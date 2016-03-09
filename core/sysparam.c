#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sysparam.h>
#include <espressif/spi_flash.h>

//TODO: make this properly threadsafe
//TODO: reduce stack usage
//FIXME: CRC calculations/checking

/* The "magic" values that indicate the start of a sysparam region in flash.
 * Note that SYSPARAM_STALE_MAGIC is written over SYSPARAM_ACTIVE_MAGIC, so it
 * must not contain any set bits which are not set in SYSPARAM_ACTIVE_MAGIC
 * (that is, going from SYSPARAM_ACTIVE_MAGIC to SYSPARAM_STALE_MAGIC must only
 * clear bits, not set them)
 */
#define SYSPARAM_ACTIVE_MAGIC 0x70524f45 // "EORp" in little-endian
#define SYSPARAM_STALE_MAGIC  0x40524f45 // "EOR@" in little-endian

/* The size of the initial buffer created by sysparam_iter_start, etc, to hold
 * returned key-value pairs.  Setting this too small may result in a lot of
 * unnecessary reallocs.  Setting it too large will waste memory when iterating
 * through entries.
 */
#define DEFAULT_ITER_BUF_SIZE 64

/* The size of the buffer (in words) used by `sysparam_create_area` when
 * scanning a potential area to make sure it's currently empty.  Note that this
 * space is taken from the stack, so it should not be too large.
 */
#define SCAN_BUFFER_SIZE 8 // words

/* Size of region/entry headers.  These should not normally need tweaking (and
 * will probably require some code changes if they are tweaked).
 */
#define REGION_HEADER_SIZE 4 // NOTE: Must be multiple of 4
#define ENTRY_HEADER_SIZE 4  // NOTE: Must be multiple of 4

/* Maximum value that can be used for a key_id.  This is limited by the format
 * to 0x7e (0x7f would produce a corresponding value ID of 0xff, which is
 * invalid)
 */
#define MAX_KEY_ID 0x7e

#ifndef SYSPARAM_DEBUG
#define SYSPARAM_DEBUG 0
#endif

/******************************* Useful Macros *******************************/

#define ROUND_TO_WORD_BOUNDARY(x) (((x) + 3) & 0xfffffffc)
#define ENTRY_SIZE(payload_len) (ENTRY_HEADER_SIZE + ROUND_TO_WORD_BOUNDARY(payload_len))

#define max(x, y) ((x) > (y) ? (x) : (y))
#define min(x, y) ((x) < (y) ? (x) : (y))

#define debug(level, format, ...) if (SYSPARAM_DEBUG >= (level)) { printf("%s" format "\n", "sysparam: ", ## __VA_ARGS__); }

#define CHECK_FLASH_OP(x) do { int __x = (x); if ((__x) != SPI_FLASH_RESULT_OK) { debug(1, "FLASH ERR: %d", __x); return SYSPARAM_ERR_IO; } } while (0);

/********************* Internal datatypes and structures *********************/

struct entry_header {
    uint8_t prev_len;
    uint8_t len;
    uint8_t id;
    uint8_t crc;
} __attribute__ ((packed));

struct sysparam_context {
    uint32_t addr;
    struct entry_header entry;
    uint64_t unused_keys[2];
    size_t compactable;
    uint8_t max_key_id;
};

/*************************** Global variables/data ***************************/

static struct {
    uint32_t cur_base;
    uint32_t alt_base;
    uint32_t end_addr;
    size_t region_size;
} _sysparam_info;

/***************************** Internal routines *****************************/

/** Erase the sectors of a region */
static sysparam_status_t _format_region(uint32_t addr) {
    uint16_t sector = addr / sdk_flashchip.sector_size;
    int i;

    for (i = 0; i < SYSPARAM_REGION_SECTORS; i++) {
        CHECK_FLASH_OP(sdk_spi_flash_erase_sector(sector + i));
    }
    return SYSPARAM_OK;
}

/** Write the magic value at the beginning of a region */
static inline sysparam_status_t _write_region_header(uint32_t addr, bool active) {
    uint32_t magic = active ? SYSPARAM_ACTIVE_MAGIC : SYSPARAM_STALE_MAGIC;
    debug(3, "write region header (0x%08x) @ 0x%08x", magic, addr);
    CHECK_FLASH_OP(sdk_spi_flash_write(addr, &magic, 4));
    return SYSPARAM_OK;
}

/** Initialize a context structure at the beginning of the active region */
static void _init_context(struct sysparam_context *ctx) {
    memset(ctx, 0, sizeof(*ctx));
    ctx->addr = _sysparam_info.cur_base;
}

/** Initialize a context structure at the end of the active region */
static sysparam_status_t init_write_context(struct sysparam_context *ctx) {
    memset(ctx, 0, sizeof(*ctx));
    ctx->addr = _sysparam_info.end_addr;
    debug(3, "read entry header @ 0x%08x", ctx->addr);
    CHECK_FLASH_OP(sdk_spi_flash_read(ctx->addr, &ctx->entry, ENTRY_HEADER_SIZE));
    return SYSPARAM_OK;
}

/** Search through the region for an entry matching the specified id
 *
 *  @param match_id  The id to match, or 0 to match any key, or 0xff to scan
 *                   to the end.
 */
static sysparam_status_t _find_entry(struct sysparam_context *ctx, uint8_t match_id) {
    uint8_t prev_len;

    while (ctx->addr + ENTRY_SIZE(ctx->entry.len) < _sysparam_info.end_addr) {
        prev_len = ctx->entry.len;
        ctx->addr += ENTRY_SIZE(ctx->entry.len);

        debug(3, "read entry header @ 0x%08x", ctx->addr);
        CHECK_FLASH_OP(sdk_spi_flash_read(ctx->addr, &ctx->entry, ENTRY_HEADER_SIZE));
        if (ctx->entry.prev_len != prev_len) {
            // Uh oh.. This should match the entry.len field from the
            // previous entry.  If it doesn't, it means that field may have
            // been corrupted and we don't even know if we're in the right
            // place anymore.  We have to bail out.
            debug(1, "prev_len mismatch at 0x%08x (%d != %d)", ctx->addr, ctx->entry.prev_len, prev_len);
            ctx->addr = _sysparam_info.end_addr;
            return SYSPARAM_ERR_CORRUPT;
        }

        if (ctx->entry.id) {
            if (!(ctx->entry.id & 0x80)) {
                // Key definition
                ctx->max_key_id = ctx->entry.id;
                ctx->unused_keys[ctx->entry.id >> 6] |= (1 << (ctx->entry.id & 0x3f));
                if (!match_id) {
                    // We're looking for any key, so make this a matching key.
                    match_id = ctx->entry.id;
                }
            } else {
                // Value entry
                ctx->unused_keys[(ctx->entry.id >> 6) & 1] &= ~(1 << (ctx->entry.id & 0x3f));
            }
            if (ctx->entry.id == match_id) {
                return SYSPARAM_OK;
            }
        } else {
            // Deleted entry
            ctx->compactable += ENTRY_SIZE(ctx->entry.len);
        }
    }
    ctx->entry.len = 0;
    ctx->entry.id = 0;
    return SYSPARAM_NOTFOUND;
}

/** Read the payload from the current entry pointed to by `ctx` */
static inline sysparam_status_t _read_payload(struct sysparam_context *ctx, uint8_t *buffer, size_t buffer_size) {
    debug(3, "read payload (%d) @ 0x%08x", min(buffer_size, ctx->entry.len), ctx->addr);
    CHECK_FLASH_OP(sdk_spi_flash_read(ctx->addr + ENTRY_HEADER_SIZE, buffer, min(buffer_size, ctx->entry.len)));
    //FIXME: check crc
    return SYSPARAM_OK;
}

/** Find the entry corresponding to the specified key name */
static sysparam_status_t _find_key(struct sysparam_context *ctx, const char *key, uint8_t key_len, uint8_t *buffer) {
    sysparam_status_t status;

    while (true) {
        // Find the next key entry
        status = _find_entry(ctx, 0);
        if (status != SYSPARAM_OK) return status;
        if (!key) {
            // We're looking for the next (any) key, so we're done.
            break;
        }
        if (ctx->entry.len == key_len) {
            status = _read_payload(ctx, buffer, key_len);
            if (status < 0) return status;
            if (!memcmp(key, buffer, key_len)) {
                // We have a match
                break;
            }
        }
    }

    return SYSPARAM_OK;
}

/** Write an entry at the specified address */
static inline sysparam_status_t _write_entry(uint32_t addr, uint8_t id, const uint8_t *payload, uint8_t len, uint8_t prev_len) {
    struct entry_header entry;

    debug(2, "Writing entry 0x%02x @ 0x%08x", id, addr);
    entry.prev_len = prev_len;
    entry.len = len;
    entry.id = id;
    entry.crc = 0; //FIXME: calculate crc
    debug(3, "write entry header @ 0x%08x", addr);
    CHECK_FLASH_OP(sdk_spi_flash_write(addr, &entry, ENTRY_HEADER_SIZE));
    debug(3, "write payload (%d) @ 0x%08x", len, addr + ENTRY_HEADER_SIZE);
    CHECK_FLASH_OP(sdk_spi_flash_write(addr + ENTRY_HEADER_SIZE, payload, len));

    return SYSPARAM_OK;
}

/** Write the "tail" entry on the end of the region
 *  (this entry just contains the `prev_len` field with all others set to 0xff)
 */
static inline sysparam_status_t _write_entry_tail(uint32_t addr, uint8_t prev_len) {
    struct entry_header entry;

    entry.prev_len = prev_len;
    entry.len = 0xff;
    entry.id = 0xff;
    entry.crc = 0xff;
    debug(3, "write entry tail @ 0x%08x", addr);
    CHECK_FLASH_OP(sdk_spi_flash_write(addr, &entry, ENTRY_HEADER_SIZE));

    return SYSPARAM_OK;
}

/** Mark an entry as "deleted" so it won't be considered in future reads */
static inline sysparam_status_t _delete_entry(uint32_t addr) {
    struct entry_header entry;

    debug(2, "Deleting entry @ 0x%08x", addr);
    debug(3, "read entry header @ 0x%08x", addr);
    CHECK_FLASH_OP(sdk_spi_flash_read(addr, &entry, ENTRY_HEADER_SIZE));
    // Set the ID to zero to mark it as "deleted"
    entry.id = 0x00;
    debug(3, "write entry header @ 0x%08x", addr);
    CHECK_FLASH_OP(sdk_spi_flash_write(addr, &entry, ENTRY_HEADER_SIZE));

    return SYSPARAM_OK;
}

/** Compact the current region, removing all deleted/unused entries, and write
 *  the result to the alternate region, then make the new alternate region the
 *  active one.
 *
 *  @param key_id  A pointer to the "current" key ID.
 *
 *  NOTE: The value corresponding to the passed key ID will not be written to
 *  the output (because it is assumed it will be overwritten as the next step
 *  in `sysparam_set_data` anyway).  When compacting, this routine will
 *  automatically update *key_id to contain the ID of this key in the new
 *  compacted result as well.
 */
static sysparam_status_t _compact_params(struct sysparam_context *ctx, uint8_t *key_id) {
    uint32_t new_base = _sysparam_info.alt_base;
    sysparam_status_t status;
    uint32_t addr = new_base + REGION_HEADER_SIZE;
    uint8_t current_key_id = 0;
    sysparam_iter_t iter;
    uint8_t prev_len = 0;

    debug(1, "compacting region (current size %d, expect to recover %d%s bytes)...", _sysparam_info.end_addr - _sysparam_info.cur_base, ctx->compactable, (ctx->unused_keys[0] || ctx->unused_keys[1]) ? "+ (unused keys present)" : "");
    status = _format_region(new_base);
    if (status < 0) return status;
    status = sysparam_iter_start(&iter);
    if (status < 0) return status;

    while (true) {
        status = sysparam_iter_next(&iter);
        if (status != SYSPARAM_OK) break;

        current_key_id++;

        // Write the key to the new region
        debug(2, "writing %d key @ 0x%08x", current_key_id, addr);
        status = _write_entry(addr, current_key_id, (uint8_t *)iter.key, iter.key_len, prev_len);
        if (status < 0) break;
        prev_len = iter.key_len;
        addr += ENTRY_SIZE(iter.key_len);

        if (iter.ctx->entry.id == *key_id) {
            // Update key_id to have the correct id for the compacted result
            *key_id = current_key_id;
            // Don't copy the old value, since we'll just be deleting it
            // and writing a new one as soon as we return.
            continue;
        }

        // Copy the value to the new region
        debug(2, "writing %d value @ 0x%08x", current_key_id, addr);
        status = _write_entry(addr, current_key_id | 0x80, iter.value, iter.value_len, prev_len);
        if (status < 0) break;
        prev_len = iter.value_len;
        addr += ENTRY_SIZE(iter.value_len);
    }
    sysparam_iter_end(&iter);

    if (status >= 0) {
        status = _write_entry_tail(addr, prev_len);
    }

    // If we broke out with an error, return the error instead of continuing.
    if (status < 0) {
        debug(1, "error encountered during compacting (%d)", status);
        return status;
    }

    // Switch to officially using the new region.
    status = _write_region_header(new_base, true);
    if (status < 0) return status;
    status = _write_region_header(_sysparam_info.cur_base, false);
    if (status < 0) return status;

    _sysparam_info.alt_base = _sysparam_info.cur_base;
    _sysparam_info.cur_base = new_base;
    _sysparam_info.end_addr = addr;

    // Fix up ctx so it doesn't point to invalid stuff
    memset(ctx, 0, sizeof(*ctx));
    ctx->addr = addr;
    ctx->entry.prev_len = prev_len;
    ctx->max_key_id = current_key_id;

    debug(1, "done compacting (current size %d)", _sysparam_info.end_addr - _sysparam_info.cur_base);

    return SYSPARAM_OK;
}

/***************************** Public Functions ******************************/

sysparam_status_t sysparam_init(uint32_t base_addr) {
    sysparam_status_t status;
    uint32_t magic0, magic1;
    struct sysparam_context ctx;

    _sysparam_info.region_size = SYSPARAM_REGION_SECTORS * sdk_flashchip.sector_size;
    // First, see if we can find an existing one.
    debug(3, "read magic @ 0x%08x", base_addr);
    CHECK_FLASH_OP(sdk_spi_flash_read(base_addr, &magic0, 4));
    debug(3, "read magic @ 0x%08x", base_addr + _sysparam_info.region_size);
    CHECK_FLASH_OP(sdk_spi_flash_read(base_addr + _sysparam_info.region_size, &magic1, 4));
    if (magic0 == SYSPARAM_ACTIVE_MAGIC && magic1 == SYSPARAM_STALE_MAGIC) {
        // Sysparam area found, first region is active
        _sysparam_info.cur_base = base_addr;
        _sysparam_info.alt_base = base_addr + _sysparam_info.region_size;
    } else if (magic0 == SYSPARAM_STALE_MAGIC && magic1 == SYSPARAM_ACTIVE_MAGIC) {
        // Sysparam area found, second region is active
        _sysparam_info.cur_base = base_addr + _sysparam_info.region_size;
        _sysparam_info.alt_base = base_addr;
    } else if (magic0 == SYSPARAM_ACTIVE_MAGIC && magic1 == SYSPARAM_ACTIVE_MAGIC) {
        // Both regions are marked as active.  Not sure which to use.
        // This can theoretically happen if something goes wrong at exactly the
        // wrong time during compacting.
        return SYSPARAM_ERR_CORRUPT;
    } else if (magic0 == SYSPARAM_STALE_MAGIC && magic1 == SYSPARAM_STALE_MAGIC) {
        // Both regions are marked as inactive.  This shouldn't ever happen.
        return SYSPARAM_ERR_CORRUPT;
    } else {
        // Looks like there's something else at that location entirely.
        return SYSPARAM_NOTFOUND;
    }

    // Find the actual end
    _sysparam_info.end_addr = _sysparam_info.cur_base + _sysparam_info.region_size;
    _init_context(&ctx);
    status = _find_entry(&ctx, 0xff);
    if (status < 0) {
        _sysparam_info.cur_base = 0;
        _sysparam_info.alt_base = 0;
        _sysparam_info.end_addr = 0;
        return status;
    }
    if (status == SYSPARAM_OK) {
        _sysparam_info.end_addr = ctx.addr;
    }

    return SYSPARAM_OK;
}

sysparam_status_t sysparam_create_area(uint32_t base_addr, bool force) {
    sysparam_status_t status;
    uint32_t buffer[SCAN_BUFFER_SIZE];
    uint32_t addr;
    int i;
    size_t region_size = SYSPARAM_REGION_SECTORS * sdk_flashchip.sector_size;

    if (!force) {
        // First, scan through the area and make sure it's actually empty and
        // we're not going to be clobbering something else important.
        for (addr = base_addr; addr < base_addr + SYSPARAM_REGION_SECTORS * 2 * sdk_flashchip.sector_size; addr += SCAN_BUFFER_SIZE) {
            debug(3, "read %d words @ 0x%08x", SCAN_BUFFER_SIZE, addr);
            CHECK_FLASH_OP(sdk_spi_flash_read(addr, buffer, SCAN_BUFFER_SIZE * 4));
            for (i = 0; i < SCAN_BUFFER_SIZE; i++) {
                if (buffer[i] != 0xffffffff) {
                    // Uh oh, not empty.
                    return SYSPARAM_NOTFOUND;
                }
            }
        }
    }

    if (_sysparam_info.cur_base == base_addr || _sysparam_info.alt_base == base_addr) {
        // We're reformating the same region we're already using.
        // De-initialize everything to force the caller to do a clean
        // `sysparam_init()` afterwards.
        memset(&_sysparam_info, 0, sizeof(_sysparam_info));
    }
    status = _format_region(base_addr);
    if (status < 0) return status;
    status = _format_region(base_addr + region_size);
    if (status < 0) return status;
    status = _write_entry_tail(base_addr + REGION_HEADER_SIZE, 0);
    if (status < 0) return status;
    status = _write_region_header(base_addr + region_size, false);
    if (status < 0) return status;
    status = _write_region_header(base_addr, true);
    if (status < 0) return status;

    return SYSPARAM_OK;
}

sysparam_status_t sysparam_get_data(const char *key, uint8_t **destptr, size_t *actual_length) {
    struct sysparam_context ctx;
    sysparam_status_t status;
    size_t key_len = strlen(key);
    uint8_t *buffer;
   
    if (!_sysparam_info.cur_base) return SYSPARAM_ERR_NOINIT;

    buffer = malloc(key_len + 2);
    if (!buffer) return SYSPARAM_ERR_NOMEM;
    do {
        _init_context(&ctx);
        status = _find_key(&ctx, key, key_len, buffer);
        if (status != SYSPARAM_OK) break;

        // Find the associated value
        status = _find_entry(&ctx, ctx.entry.id | 0x80);
        if (status != SYSPARAM_OK) break;

        buffer = realloc(buffer, ctx.entry.len + 1);
        if (!buffer) {
            return SYSPARAM_ERR_NOMEM;
        }
        status = _read_payload(&ctx, buffer, ctx.entry.len);
        if (status != SYSPARAM_OK) break;

        // Zero-terminate the result, just in case (doesn't hurt anything for
        // non-string data, and can avoid nasty mistakes if the caller wants to
        // interpret the result as a string).
        buffer[ctx.entry.len] = 0;

        *destptr = buffer;
        if (actual_length) *actual_length = ctx.entry.len;
        return SYSPARAM_OK;
    } while (false);

    free(buffer);
    if (actual_length) *actual_length = 0;
    return status;
}

sysparam_status_t sysparam_get_data_static(const char *key, uint8_t *buffer, size_t buffer_size, size_t *actual_length) {
    struct sysparam_context ctx;
    sysparam_status_t status = SYSPARAM_OK;
    size_t key_len = strlen(key);

    if (!_sysparam_info.cur_base) return SYSPARAM_ERR_NOINIT;

    // Supplied buffer must be at least as large as the key, or 2 bytes,
    // whichever is larger.
    if (buffer_size < max(key_len, 2)) return SYSPARAM_ERR_NOMEM;

    if (actual_length) *actual_length = 0;

    _init_context(&ctx);
    status = _find_key(&ctx, key, key_len, buffer);
    if (status != SYSPARAM_OK) return status;
    status = _find_entry(&ctx, ctx.entry.id | 0x80);
    if (status != SYSPARAM_OK) return status;
    status = _read_payload(&ctx, buffer, buffer_size);
    if (status != SYSPARAM_OK) return status;

    if (actual_length) *actual_length = ctx.entry.len;
    return SYSPARAM_OK;
}

sysparam_status_t sysparam_get_string(const char *key, char **destptr) {
    // `sysparam_get_data` will zero-terminate the result as a matter of course,
    // so no need to do that here.
    return sysparam_get_data(key, (uint8_t **)destptr, NULL);
}

sysparam_status_t sysparam_get_int(const char *key, int32_t *result) {
    char *buffer;
    char *endptr;
    int32_t value;
    sysparam_status_t status;

    status = sysparam_get_string(key, &buffer);
    if (status != SYSPARAM_OK) return status;
    value = strtol(buffer, &endptr, 0);
    if (*endptr) {
        // There was extra crap at the end of the string.
        free(buffer);
        return SYSPARAM_PARSEFAILED;
    }

    *result = value;
    free(buffer);
    return SYSPARAM_OK;
}

sysparam_status_t sysparam_get_bool(const char *key, bool *result) {
    char *buffer;
    int i;
    sysparam_status_t status;

    status = sysparam_get_string(key, &buffer);
    if (status != SYSPARAM_OK) return status;
    do {
        for (i = 0; buffer[i]; i++) {
            // Quick-and-dirty tolower().  Not perfect, but works for our
            // purposes, and avoids needing to pull in additional libc stuff.
            if (buffer[i] >= 0x41) buffer[i] |= 0x20;
        }
        if (!strcmp(buffer, "y")    ||
            !strcmp(buffer, "yes")  ||
            !strcmp(buffer, "t")    ||
            !strcmp(buffer, "true") ||
            !strcmp(buffer, "1")) {
                *result = true;
                break;
        }
        if (!strcmp(buffer, "n")     ||
            !strcmp(buffer, "no")    ||
            !strcmp(buffer, "f")     ||
            !strcmp(buffer, "false") ||
            !strcmp(buffer, "0")) {
                *result = false;
                break;
        }
        status = SYSPARAM_PARSEFAILED;
    } while (0);

    free(buffer);
    return status;
}

sysparam_status_t sysparam_set_data(const char *key, const uint8_t *value, size_t value_len) {
    struct sysparam_context ctx;
    struct sysparam_context write_ctx;
    sysparam_status_t status = SYSPARAM_OK;
    uint8_t key_len = strlen(key);
    uint8_t *buffer;
    size_t free_space;
    size_t needed_space;
    bool free_value = false;
    uint8_t key_id = 0;
    uint32_t old_value_addr = 0;
   
    if (!_sysparam_info.cur_base) return SYSPARAM_ERR_NOINIT;
    if (!key_len) return SYSPARAM_ERR_BADVALUE;
    if (value_len > 0xff) return SYSPARAM_ERR_BADVALUE;

    if (!value) value_len = 0;

    if (value_len && ((intptr_t)value & 0x3)) {
        // The passed value isn't word-aligned.  This will be a problem later
        // when calling `sdk_spi_flash_write`, so make a word-aligned copy.
        buffer = malloc(value_len);
        if (!buffer) return SYSPARAM_ERR_NOMEM;
        memcpy(buffer, value, value_len);
        value = buffer;
        free_value = true;
    }
    // Create a working buffer for `_find_key` to use.
    buffer = malloc(key_len);
    if (!buffer) {
        if (free_value) free((void *)value);
        return SYSPARAM_ERR_NOMEM;
    }

    do {
        _init_context(&ctx);
        status = _find_key(&ctx, key, key_len, buffer);
        if (status == SYSPARAM_OK) {
            // Key already exists, see if there's a current value.
            key_id = ctx.entry.id;
            status = _find_entry(&ctx, key_id | 0x80);
            if (status == SYSPARAM_OK) {
                old_value_addr = ctx.addr;
            }
        }
        if (status < 0) break;

        if (value_len) {
            if (old_value_addr) {
                if (ctx.entry.len == value_len) {
                    // Are we trying to write the same value that's already there?
                    if (value_len > key_len) {
                        buffer = realloc(buffer, value_len);
                        if (!buffer) return SYSPARAM_ERR_NOMEM;
                    }
                    status = _read_payload(&ctx, buffer, value_len);
                    if (status == SYSPARAM_ERR_CORRUPT) {
                        // If the CRC check failed, don't worry about it.  We're
                        // going to be deleting this entry anyway.
                    } else if (status < 0) {
                        break;
                    } else if (!memcmp(buffer, value, value_len)) {
                        // Yup, it's a match! No need to do anything further,
                        // just leave the current value as-is.
                        status = SYSPARAM_OK;
                        break;
                    }
                }

                // Since we will be deleting the old value (if any) make sure
                // that the compactable count includes the space taken up by
                // that entry too (even though it's not actually deleted yet)
                ctx.compactable += ENTRY_SIZE(ctx.entry.len);
            }

            // Append new value to the end, but first make sure we have enough
            // space.
            free_space = _sysparam_info.cur_base + _sysparam_info.region_size - _sysparam_info.end_addr - 4;
            needed_space = ENTRY_SIZE(value_len);
            if (!key_id) {
                // We did not find a previous key entry matching this key.  We
                // will need to add a key entry as well.
                key_len = strlen(key);
                needed_space += ENTRY_SIZE(key_len);
            }
            if (needed_space > free_space) {
                // Can we compact things?
                // First, scan all remaining entries up to the end so we can
                // get a reasonably accurate "compactable" reading.
                _find_entry(&ctx, 0xff);
                if (needed_space <= free_space + ctx.compactable) {
                    // We should be able to get enough space by compacting.
                    status = _compact_params(&ctx, &key_id);
                    if (status < 0) break;
                    old_value_addr = 0;
                } else if (ctx.unused_keys[0] || ctx.unused_keys[1]) {
                    // Compacting will gain more space than expected, because
                    // there are some keys that can be omitted too, but we
                    // don't know exactly how much that will gain, so all we
                    // can do is give it a try and see if it gives us enough.
                    status = _compact_params(&ctx, &key_id);
                    if (status < 0) break;
                    old_value_addr = 0;
                }
                free_space = _sysparam_info.cur_base + _sysparam_info.region_size - _sysparam_info.end_addr - 4;
            }
            if (needed_space > free_space) {
                // Nothing we can do here.. We're full.
                // (at least full enough that compacting won't help us store
                // this value)
                debug(1, "region full (need %d of %d remaining)", needed_space, free_space);
                status = SYSPARAM_ERR_FULL;
                break;
            }

            init_write_context(&write_ctx);

            if (!key_id) {
                // We need to write a key entry for a new key.
                // If we didn't find the key, then we already know _find_entry
                // has gone through the entire contents, and thus
                // ctx.max_key_id has the largest key_id found in the whole
                // region.
                key_id = ctx.max_key_id + 1;
                if (key_id > MAX_KEY_ID) {
                    if (ctx.unused_keys[0] || ctx.unused_keys[1]) {
                        status = _compact_params(&ctx, &key_id);
                        if (status < 0) break;
                        old_value_addr = 0;
                    } else {
                        debug(1, "out of ids!");
                        status = SYSPARAM_ERR_FULL;
                        break;
                    }
                }
                status = _write_entry(write_ctx.addr, key_id, (uint8_t *)key, key_len, write_ctx.entry.prev_len);
                if (status < 0) break;
                write_ctx.addr += ENTRY_SIZE(key_len);
                write_ctx.entry.prev_len = key_len;
            }

            // Write new value
            status = _write_entry(write_ctx.addr, key_id | 0x80, value, value_len, write_ctx.entry.prev_len);
            if (status < 0) break;
            write_ctx.addr += ENTRY_SIZE(value_len);
            status = _write_entry_tail(write_ctx.addr, value_len);
            if (status < 0) break;
            _sysparam_info.end_addr = write_ctx.addr;
        }

        // Delete old value (if present) by setting it's id to 0x00
        if (old_value_addr) {
            status = _delete_entry(old_value_addr);
            if (status < 0) break;
        }
    } while (false);

    if (free_value) free((void *)value);
    free(buffer);
    return status;
}

sysparam_status_t sysparam_set_string(const char *key, const char *value) {
    return sysparam_set_data(key, (const uint8_t *)value, strlen(value));
}

sysparam_status_t sysparam_set_int(const char *key, int32_t value) {
    uint8_t buffer[12];
    int len;
    
    len = snprintf((char *)buffer, 12, "%d", value);
    return sysparam_set_data(key, buffer, len);
}

sysparam_status_t sysparam_set_bool(const char *key, bool value) {
    uint8_t buf[4] = {0xff, 0xff, 0xff, 0xff};
    bool old_value;

    // Don't write anything if the current setting already evaluates to the
    // same thing.
    if (sysparam_get_bool(key, &old_value) == SYSPARAM_OK) {
        if (old_value == value) return SYSPARAM_OK;
    }

    buf[0] = value ? 'y' : 'n';
    return sysparam_set_data(key, buf, 1);
}

sysparam_status_t sysparam_iter_start(sysparam_iter_t *iter) {
    if (!_sysparam_info.cur_base) return SYSPARAM_ERR_NOINIT;

    iter->bufsize = DEFAULT_ITER_BUF_SIZE;
    iter->key = malloc(iter->bufsize);
    if (!iter->key) {
        iter->bufsize = 0;
        return SYSPARAM_ERR_NOMEM;
    }
    iter->key_len = 0;
    iter->value_len = 0;
    iter->ctx = malloc(sizeof(struct sysparam_context));
    if (!iter->ctx) {
        free(iter->key);
        iter->bufsize = 0;
        return SYSPARAM_ERR_NOMEM;
    }
    _init_context(iter->ctx);

    return SYSPARAM_OK;
}

sysparam_status_t sysparam_iter_next(sysparam_iter_t *iter) {
    uint8_t buffer[2];
    sysparam_status_t status;
    size_t required_len;
    struct sysparam_context *ctx = iter->ctx;
    struct sysparam_context value_ctx;
    size_t key_space;

    while (true) {
        status = _find_key(ctx, NULL, 0, buffer);
        if (status != SYSPARAM_OK) return status;
        memcpy(&value_ctx, ctx, sizeof(value_ctx));

        status = _find_entry(&value_ctx, ctx->entry.id | 0x80);
        if (status < 0) return status;
        if (status == SYSPARAM_NOTFOUND) continue;

        key_space = ROUND_TO_WORD_BOUNDARY(ctx->entry.len + 1);
        required_len = key_space + value_ctx.entry.len + 1;
        if (required_len > iter->bufsize) {
            iter->key = realloc(iter->key, required_len);
            if (!iter->key) {
                iter->bufsize = 0;
                return SYSPARAM_ERR_NOMEM;
            }
            iter->bufsize = required_len;
        }

        status = _read_payload(ctx, (uint8_t *)iter->key, iter->bufsize);
        if (status < 0) return status;
        // Null-terminate the key
        iter->key[ctx->entry.len] = 0;
        iter->key_len = ctx->entry.len;

        iter->value = (uint8_t *)(iter->key + key_space);
        status = _read_payload(&value_ctx, iter->value, iter->bufsize - key_space);
        if (status < 0) return status;
        // Null-terminate the value (just in case)
        iter->value[value_ctx.entry.len] = 0;
        iter->value_len = value_ctx.entry.len;
        debug(2, "iter_next: (0x%08x) '%s' = (0x%08x) '%s' (%d)", ctx->addr, iter->key, value_ctx.addr, iter->value, iter->value_len);

        return SYSPARAM_OK;
    }
}

void sysparam_iter_end(sysparam_iter_t *iter) {
    if (iter->key) free(iter->key);
    if (iter->ctx) free(iter->ctx);
}


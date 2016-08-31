/*
 * Part of esp-open-rtos
 * Copyright (C) 2016 Alex Stewart
 * BSD Licensed as described in the file LICENSE
 */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sysparam.h>
#include <espressif/spi_flash.h>
#include <common_macros.h>
#include "FreeRTOS.h"
#include "semphr.h"

//TODO: make this properly threadsafe
//TODO: reduce stack usage

/* The "magic" value that indicates the start of a sysparam region in flash.
 */
#define SYSPARAM_MAGIC 0x70524f45 // "EORp" in little-endian

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

/* The size of the temporary buffer used for reading back and verifying data
 * written to flash.  Making this larger will make the write-and-verify
 * operation slightly faster, but will use more heap during writes
 */
#define VERIFY_BUF_SIZE 64

/* Size of region/entry headers.  These should not normally need tweaking (and
 * will probably require some code changes if they are tweaked).
 */
#define REGION_HEADER_SIZE 8 // NOTE: Must be multiple of 4
#define ENTRY_HEADER_SIZE 4  // NOTE: Must be multiple of 4

/* These are limited by the format to 0xffff, but could be set lower if desired
 */
#define MAX_KEY_LEN   0xffff
#define MAX_VALUE_LEN 0xffff

/* Maximum value that can be used for a key_id.  This is limited by the format
 * to 0xffe (0xfff indicates end/unwritten space)
 */
#define MAX_KEY_ID 0x0ffe

#define REGION_FLAG_SECOND  0x8000 // First (0) or second (1) region
#define REGION_FLAG_ACTIVE  0x4000 // Stale (0) or active (1) region
#define REGION_MASK_SIZE    0x0fff // Region size in sectors

#define ENTRY_FLAG_ALIVE    0x8000 // Deleted (0) or active (1)
#define ENTRY_FLAG_INVALID  0x4000 // Valid (0) or invalid (1) entry
#define ENTRY_FLAG_VALUE    0x2000 // Key (0) or value (1)
#define ENTRY_FLAG_BINARY   0x1000 // Text (0) or binary (1) data

#define ENTRY_MASK_ID  0xfff

#define ENTRY_ID_END   0xfff
#define ENTRY_ID_ANY  0x1000

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

struct region_header {
    uint32_t magic;
    uint16_t flags_size;
    uint16_t reserved;
} __attribute__ ((packed));

struct entry_header {
    uint16_t idflags;
    uint16_t len;
} __attribute__ ((packed));

struct sysparam_context {
    uint32_t addr;
    struct entry_header entry;
    int unused_keys;
    size_t compactable;
    uint16_t max_key_id;
};

/*************************** Global variables/data ***************************/

static struct {
    uint32_t cur_base;
    uint32_t alt_base;
    uint32_t end_addr;
    size_t region_size;
    bool force_compact;
    SemaphoreHandle_t sem;
} _sysparam_info;

/***************************** Internal routines *****************************/

static inline IRAM sysparam_status_t _do_write(uint32_t addr, const void *data, size_t data_size) {
    CHECK_FLASH_OP(sdk_spi_flash_write(addr, (void*) data, data_size));
    return SYSPARAM_OK;
}

static inline IRAM sysparam_status_t _do_verify(uint32_t addr, const void *data, void *buffer, size_t len) {
    CHECK_FLASH_OP(sdk_spi_flash_read(addr, buffer, len));
    if (memcmp(data, buffer, len)) {
        return SYSPARAM_ERR_IO;
    }
    return SYSPARAM_OK;
}

/*FIXME: Eventually, this should probably be implemented down at the SPI flash library layer, where it can just compare bytes/words straight from the SPI hardware buffer instead of allocating a whole separate temp buffer, reading chunks into that, and then doing a memcmp.. */
static IRAM sysparam_status_t _write_and_verify(uint32_t addr, const void *data, size_t data_size) {
    int i;
    size_t count;
    sysparam_status_t status = SYSPARAM_OK;
    uint8_t *verify_buf = malloc(VERIFY_BUF_SIZE);

    if (!verify_buf) return SYSPARAM_ERR_NOMEM;
    do {
        status = _do_write(addr, data, data_size);
        if (status != SYSPARAM_OK) break;
        for (i = 0; i < data_size; i += VERIFY_BUF_SIZE) {
            count = min(data_size - i, VERIFY_BUF_SIZE);
            status = _do_verify(addr + i, data + i, verify_buf, count);
            if (status != SYSPARAM_OK) {
                debug(1, "Flash write (@ 0x%08x) verify failed!", addr);
                break;
            }
        }
    } while (false);
    free(verify_buf);
    return status;
}

/** Erase the sectors of a region */
static sysparam_status_t _format_region(uint32_t addr, uint16_t num_sectors) {
    uint16_t sector = addr / sdk_flashchip.sector_size;
    int i;

    for (i = 0; i < num_sectors; i++) {
        CHECK_FLASH_OP(sdk_spi_flash_erase_sector(sector + i));
    }
    return SYSPARAM_OK;
}

/** Write the magic data at the beginning of a region */
static inline sysparam_status_t _write_region_header(uint32_t addr, uint32_t other, bool active) {
    struct region_header header;
    sysparam_status_t status;
    int16_t num_sectors;

    header.magic = SYSPARAM_MAGIC;
    if (addr < other) {
        num_sectors = (other - addr) / sdk_flashchip.sector_size;
        header.flags_size = num_sectors & REGION_MASK_SIZE;
    } else {
        num_sectors = (addr - other) / sdk_flashchip.sector_size;
        header.flags_size = num_sectors & REGION_MASK_SIZE;
        header.flags_size |= REGION_FLAG_SECOND;
    }
    if (active) {
        header.flags_size |= REGION_FLAG_ACTIVE;
    }
    header.reserved = 0;

    debug(3, "write region header (0x%04x) @ 0x%08x", header.flags_size, addr);
    status = _write_and_verify(addr, &header, REGION_HEADER_SIZE);
    if (status != SYSPARAM_OK) {
        // Uh oh.. Something failed, so we don't know whether what we wrote is
        // actually in the flash or not.  Try to zero it out to be sure and
        // return an error.
        debug(3, "zero region header @ 0x%08x", addr);
        memset(&header, 0, REGION_HEADER_SIZE);
        _write_and_verify(addr, &header, REGION_HEADER_SIZE);
        return SYSPARAM_ERR_IO;
    }
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
    CHECK_FLASH_OP(sdk_spi_flash_read(ctx->addr, (void*) &ctx->entry, ENTRY_HEADER_SIZE));
    return SYSPARAM_OK;
}

/** Search through the region for an entry matching the specified id
 *
 *  @param match_id  The id to match, or 0 to match any key, or 0xfff to scan
 *                   to the end.
 */
static sysparam_status_t _find_entry(struct sysparam_context *ctx, uint16_t match_id, bool find_value) {
    uint16_t id;

    while (true) {
        if (ctx->addr == _sysparam_info.cur_base) {
            ctx->addr += REGION_HEADER_SIZE;
        } else {
            uint32_t next_addr = ctx->addr + ENTRY_SIZE(ctx->entry.len);
            if (next_addr > _sysparam_info.cur_base + _sysparam_info.region_size) {
                // This entry has an obviously impossible length, so we need to
                // stop reading here.
                // We can report this as the end of the valid entries, but then
                // any future writes (to the end) will write over
                // previously-written data and result in garbage.  The best
                // workaround is to make sure that the next write operation
                // will always start with a compaction, which will leave off
                // the invalid data at the end and fix the issue going forward.
                debug(1, "Encountered entry with invalid length (0x%04x) @ 0x%08x (region end is 0x%08x).  Truncating entries.", ctx->entry.len, ctx->addr, _sysparam_info.end_addr);
                _sysparam_info.force_compact = true;
                break;
            }
            ctx->addr = next_addr;
            if (ctx->addr == _sysparam_info.cur_base + _sysparam_info.region_size) {
                // This is the last entry in the available space, but it
                // exactly fits.  Stop reading here.
                break;
            }
        }

        debug(3, "read entry header @ 0x%08x", ctx->addr);
        CHECK_FLASH_OP(sdk_spi_flash_read(ctx->addr, (void*) &ctx->entry, ENTRY_HEADER_SIZE));
        debug(3, "  idflags = 0x%04x", ctx->entry.idflags);
        if (ctx->entry.idflags == 0xffff) {
            // 0xffff is never a valid id field, so this means we've hit the
            // end and are looking at unwritten flash space from here on.
            break;
        }

        id = ctx->entry.idflags & ENTRY_MASK_ID;
        if ((ctx->entry.idflags & (ENTRY_FLAG_ALIVE | ENTRY_FLAG_INVALID)) == ENTRY_FLAG_ALIVE) {
            debug(3, "  entry is alive and valid");
            if (!(ctx->entry.idflags & ENTRY_FLAG_VALUE)) {
                debug(3, "  entry is a key");
                ctx->max_key_id = id;
                ctx->unused_keys++;
                if (!find_value) {
                    if ((id == match_id) || (match_id == ENTRY_ID_ANY)) {
                        return SYSPARAM_OK;
                    }
                }
            } else {
                debug(3, "  entry is a value");
                ctx->unused_keys--;
                if (find_value) {
                    if ((id == match_id) || (match_id == ENTRY_ID_ANY)) {
                        return SYSPARAM_OK;
                    }
                }
            }
            debug(3, "  (not a match)");
        } else {
            debug(3, "  entry is deleted or invalid");
            ctx->compactable += ENTRY_SIZE(ctx->entry.len);
        }
    }
    if (match_id == ENTRY_ID_END) {
        return SYSPARAM_OK;
    }
    ctx->entry.len = 0;
    ctx->entry.idflags = 0;
    return SYSPARAM_NOTFOUND;
}

/** Read the payload from the current entry pointed to by `ctx` */
static inline sysparam_status_t _read_payload(struct sysparam_context *ctx, uint8_t *buffer, size_t buffer_size) {
    debug(3, "read payload (%d) @ 0x%08x", min(buffer_size, ctx->entry.len), ctx->addr);
    CHECK_FLASH_OP(sdk_spi_flash_read(ctx->addr + ENTRY_HEADER_SIZE, (void*) buffer, min(buffer_size, ctx->entry.len)));
    return SYSPARAM_OK;
}

/** Find the entry corresponding to the specified key name */
static sysparam_status_t _find_key(struct sysparam_context *ctx, const char *key, uint16_t key_len, uint8_t *buffer) {
    sysparam_status_t status;

    debug(3, "find key: %s", key ? key : "(null)");
    while (true) {
        // Find the next key entry
        status = _find_entry(ctx, ENTRY_ID_ANY, false);
        if (status != SYSPARAM_OK) return status;
        debug(3, "found a key entry @ 0x%08x", ctx->addr);
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
            debug(3, "entry payload does not match");
        } else {
            debug(3, "key length (%d) does not match (%d)", ctx->entry.len, key_len);
        }
    }
    debug(3, "key match @ 0x%08x (idflags = 0x%04x)", ctx->addr, ctx->entry.idflags);

    return SYSPARAM_OK;
}

/** Find the value entry matching the id field from a particular key */
static inline sysparam_status_t _find_value(struct sysparam_context *ctx, uint16_t id_field) {
    debug(3, "find value: 0x%04x", id_field);
    return _find_entry(ctx, id_field & ENTRY_MASK_ID, true);
}

/** Write an entry at the specified address */
static inline sysparam_status_t _write_entry(uint32_t addr, uint16_t id, const uint8_t *payload, uint16_t len) {
    struct entry_header entry;
    sysparam_status_t status;

    debug(2, "Writing entry 0x%02x @ 0x%08x", id, addr);
    entry.idflags = id | ENTRY_FLAG_ALIVE | ENTRY_FLAG_INVALID;
    entry.len = len;
    debug(3, "write initial entry header @ 0x%08x", addr);
    status = _write_and_verify(addr, &entry, ENTRY_HEADER_SIZE);
    if (status == SYSPARAM_ERR_IO) {
        // Uh-oh.. Either the flash call failed in some way or we didn't get
        // back what we wrote.  This could be a problem because depending on
        // how it went wrong it could screw up all reads/writes from this point
        // forward.  Try to salvage the on-flash structure by overwriting the
        // failed header with all zeros, which (if successful) will be
        // interpreted on later reads as a deleted empty-payload entry (and it
        // will just skip to the next spot).
        memset(&entry, 0, ENTRY_HEADER_SIZE);
        debug(3, "zeroing entry header @ 0x%08x", addr);
        status = _write_and_verify(addr, &entry, ENTRY_HEADER_SIZE);
        if (status != SYSPARAM_OK) return status;

        // Make sure future writes skip past this zeroed bit
        if (_sysparam_info.end_addr == addr) {
            _sysparam_info.end_addr += ENTRY_HEADER_SIZE;
        }
        // We could just skip to the next space and try again, but
        // unfortunately now we can't be sure there's enough space remaining to
        // fit the entry, so we just have to fail this operation.  Hopefully,
        // at least, future requests will still succeed, though.
        status = SYSPARAM_ERR_IO;
    }
    if (status != SYSPARAM_OK) return status;

    // If we've gotten this far, we've committed to writing the full entry.
    if (_sysparam_info.end_addr == addr) {
        _sysparam_info.end_addr += ENTRY_SIZE(len);
    }
    debug(3, "write payload (%d) @ 0x%08x", len, addr + ENTRY_HEADER_SIZE);
    status = _write_and_verify(addr + ENTRY_HEADER_SIZE, payload, len);
    if (status != SYSPARAM_OK) return status;

    debug(3, "set entry valid @ 0x%08x", addr);
    entry.idflags &= ~ENTRY_FLAG_INVALID;
    status = _write_and_verify(addr, &entry, ENTRY_HEADER_SIZE);

    return status;
}

/** Mark an entry as "deleted" so it won't be considered in future reads */
static inline sysparam_status_t _delete_entry(uint32_t addr) {
    struct entry_header entry;

    debug(2, "Deleting entry @ 0x%08x", addr);
    debug(3, "read entry header @ 0x%08x", addr);
    CHECK_FLASH_OP(sdk_spi_flash_read(addr, (void*) &entry, ENTRY_HEADER_SIZE));
    // Set the ID to zero to mark it as "deleted"
    entry.idflags &= ~ENTRY_FLAG_ALIVE;
    debug(3, "write entry header @ 0x%08x", addr);
    CHECK_FLASH_OP(sdk_spi_flash_write(addr, (void*) &entry, ENTRY_HEADER_SIZE));

    return SYSPARAM_OK;
}

/** Compact the current region, removing all deleted/unused entries, and write
 *  the result to the alternate region, then make the new alternate region the
 *  active one.
 *
 *  @param key_id  A pointer to the "current" key ID, or NULL if none.
 *
 *  NOTE: The value corresponding to the passed key ID will not be written to
 *  the output (because it is assumed it will be overwritten as the next step
 *  in `sysparam_set_data` anyway).  When compacting, this routine will
 *  automatically update *key_id to contain the ID of this key in the new
 *  compacted result as well.
 */
static sysparam_status_t _compact_params(struct sysparam_context *ctx, int *key_id) {
    uint32_t new_base = _sysparam_info.alt_base;
    sysparam_status_t status;
    uint32_t addr = new_base + REGION_HEADER_SIZE;
    uint16_t current_key_id = 0;
    sysparam_iter_t iter;
    uint16_t binary_flag;
    uint16_t num_sectors = _sysparam_info.region_size / sdk_flashchip.sector_size;

    debug(1, "compacting region (current size %d, expect to recover %d%s bytes)...", _sysparam_info.end_addr - _sysparam_info.cur_base, ctx ? ctx->compactable : 0, (ctx && ctx->unused_keys > 0) ? "+ (unused keys present)" : "");
    status = _format_region(new_base, num_sectors);
    if (status < 0) return status;
    status = sysparam_iter_start(&iter);
    if (status < 0) return status;

    while (true) {
        status = sysparam_iter_next(&iter);
        if (status != SYSPARAM_OK) break;

        current_key_id++;

        // Write the key to the new region
        debug(2, "writing %d key @ 0x%08x", current_key_id, addr);
        status = _write_entry(addr, current_key_id, (uint8_t *)iter.key, iter.key_len);
        if (status < 0) break;
        addr += ENTRY_SIZE(iter.key_len);

        if (key_id && (iter.ctx->entry.idflags & ENTRY_MASK_ID) == *key_id) {
            // Update key_id to have the correct id for the compacted result
            *key_id = current_key_id;
            // Don't copy the old value, since we'll just be deleting it
            // and writing a new one as soon as we return.
            continue;
        }

        // Copy the value to the new region
        debug(2, "writing %d value @ 0x%08x", current_key_id, addr);
        binary_flag = iter.binary ? ENTRY_FLAG_BINARY : 0;
        status = _write_entry(addr, current_key_id | ENTRY_FLAG_VALUE | binary_flag, iter.value, iter.value_len);
        if (status < 0) break;
        addr += ENTRY_SIZE(iter.value_len);
    }
    sysparam_iter_end(&iter);

    // If we broke out with an error, return the error instead of continuing.
    if (status < 0) {
        debug(1, "error encountered during compacting (%d)", status);
        return status;
    }

    // Switch to officially using the new region.
    status = _write_region_header(new_base, _sysparam_info.cur_base, true);
    if (status < 0) return status;
    status = _write_region_header(_sysparam_info.cur_base, new_base, false);
    if (status < 0) return status;

    _sysparam_info.alt_base = _sysparam_info.cur_base;
    _sysparam_info.cur_base = new_base;
    _sysparam_info.end_addr = addr;
    _sysparam_info.force_compact = false;

    if (ctx) {
        // Fix up ctx so it doesn't point to invalid stuff
        memset(ctx, 0, sizeof(*ctx));
        ctx->addr = addr;
        ctx->max_key_id = current_key_id;
    }

    debug(1, "done compacting (current size %d)", _sysparam_info.end_addr - _sysparam_info.cur_base);

    return SYSPARAM_OK;
}

/***************************** Public Functions ******************************/

sysparam_status_t sysparam_init(uint32_t base_addr, uint32_t top_addr) {
    sysparam_status_t status;
    uint32_t addr0, addr1;
    struct region_header header0, header1;
    struct sysparam_context ctx;
    uint16_t num_sectors;

    // Make sure we're starting at the beginning of the sector
    base_addr -= (base_addr % sdk_flashchip.sector_size);

    if (!top_addr || top_addr == base_addr) {
        // Only scan the specified sector, nowhere else.
        top_addr = base_addr + sdk_flashchip.sector_size;
    }
    for (addr0 = base_addr; addr0 < top_addr; addr0 += sdk_flashchip.sector_size) {
        CHECK_FLASH_OP(sdk_spi_flash_read(addr0, (void*) &header0, REGION_HEADER_SIZE));
        if (header0.magic == SYSPARAM_MAGIC) {
            // Found a starting point...
            break;
        }
    }
    if (addr0 >= top_addr) {
        return SYSPARAM_NOTFOUND;
    }

    // We've found a valid header at addr0.  Now find the other half of the sysparam area.
    num_sectors = header0.flags_size & REGION_MASK_SIZE;

    if (header0.flags_size & REGION_FLAG_SECOND) {
        addr1 = addr0 - num_sectors * sdk_flashchip.sector_size;
    } else {
        addr1 = addr0 + num_sectors * sdk_flashchip.sector_size;
    }
    CHECK_FLASH_OP(sdk_spi_flash_read(addr1, (void*) &header1, REGION_HEADER_SIZE));

    if (header1.magic == SYSPARAM_MAGIC) {
        // Yay! Found the other one.  Sanity-check it..
        if ((header0.flags_size & REGION_FLAG_SECOND) == (header1.flags_size & REGION_FLAG_SECOND)) {
            // Hmm.. they both say they're the same region.  That can't be right...
            debug(1, "Found region headers @ 0x%08x and 0x%08x, but both claim to be the same region.", addr0, addr1);
            return SYSPARAM_ERR_CORRUPT;
        }
    } else {
        // Didn't find a valid header at the alternate location (which probably means something clobbered it or something went wrong at a critical point when rewriting it.  Is the one we did find the active or stale one?
        if (header0.flags_size & REGION_FLAG_ACTIVE) {
            // Found the active one.  We can work with this.  Try to recreate the missing stale region...
            debug(2, "Found active region header @ 0x%08x but no stale region @ 0x%08x. Trying to recreate stale region.", addr0, addr1);
            status = _format_region(addr1, num_sectors);
            if (status != SYSPARAM_OK) return status;
            status = _write_region_header(addr1, addr0, false);
            if (status != SYSPARAM_OK) return status;
        } else {
            // Found the stale one.  We have no idea how old it is, so we shouldn't use it without some sort of confirmation/recovery.  We'll have to bail for now.
            debug(1, "Found stale-region header @ 0x%08x, but no active region.", addr0);
            return SYSPARAM_ERR_CORRUPT;
        }
    }
    // At this point we have confirmed valid regions at addr0 and addr1.

    _sysparam_info.region_size = num_sectors * sdk_flashchip.sector_size;
    if (header0.flags_size & REGION_FLAG_ACTIVE) {
        _sysparam_info.cur_base = addr0;
        _sysparam_info.alt_base = addr1;
        debug(3, "Active region @ 0x%08x (0x%04x).  Stale region @ 0x%08x (0x%04x).", addr0, header0.flags_size, addr1, header1.flags_size);

    } else {
        _sysparam_info.cur_base = addr1;
        _sysparam_info.alt_base = addr0;
        debug(3, "Active region @ 0x%08x (0x%04x).  Stale region @ 0x%08x (0x%04x).", addr1, header1.flags_size, addr0, header0.flags_size);
    }

    // Find the actual end
    _sysparam_info.end_addr = _sysparam_info.cur_base + _sysparam_info.region_size;
    _sysparam_info.force_compact = false;
    _init_context(&ctx);
    status = _find_entry(&ctx, ENTRY_ID_END, false);
    if (status < 0) {
        _sysparam_info.cur_base = 0;
        _sysparam_info.alt_base = 0;
        _sysparam_info.end_addr = 0;
        return status;
    }
    if (status == SYSPARAM_OK) {
        _sysparam_info.end_addr = ctx.addr;
    }

    _sysparam_info.sem = xSemaphoreCreateMutex();

    return SYSPARAM_OK;
}

sysparam_status_t sysparam_create_area(uint32_t base_addr, uint16_t num_sectors, bool force) {
    size_t region_size;
    sysparam_status_t status;
    uint32_t buffer[SCAN_BUFFER_SIZE];
    uint32_t addr;
    int i;

    // Convert "number of sectors for area" into "number of sectors per region"
    if (num_sectors < 1 || (num_sectors & 1)) {
        return SYSPARAM_ERR_BADVALUE;
    }
    num_sectors >>= 1;
    region_size = num_sectors * sdk_flashchip.sector_size;

    if (!force) {
        // First, scan through the area and make sure it's actually empty and
        // we're not going to be clobbering something else important.
        for (addr = base_addr; addr < base_addr + region_size * 2; addr += SCAN_BUFFER_SIZE) {
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
    status = _format_region(base_addr, num_sectors);
    if (status < 0) return status;
    status = _format_region(base_addr + region_size, num_sectors);
    if (status < 0) return status;
    status = _write_region_header(base_addr, base_addr + region_size, true);
    if (status < 0) return status;
    status = _write_region_header(base_addr + region_size, base_addr, false);
    if (status < 0) return status;

    return SYSPARAM_OK;
}

sysparam_status_t sysparam_get_info(uint32_t *base_addr, uint32_t *num_sectors) {
    if (!_sysparam_info.cur_base) return SYSPARAM_ERR_NOINIT;

    *base_addr = min(_sysparam_info.cur_base, _sysparam_info.alt_base);
    *num_sectors = (_sysparam_info.region_size / sdk_flashchip.sector_size) * 2;
    return SYSPARAM_OK;
}

sysparam_status_t sysparam_compact() {
    xSemaphoreTake(_sysparam_info.sem, portMAX_DELAY);
    sysparam_status_t status;

    if (_sysparam_info.cur_base) {
        status = _compact_params(NULL, NULL);
    } else {
        status = SYSPARAM_ERR_NOINIT;
    }

    xSemaphoreGive(_sysparam_info.sem);
    return status;
}

sysparam_status_t sysparam_get_data(const char *key, uint8_t **destptr, size_t *actual_length, bool *is_binary) {
    struct sysparam_context ctx;
    sysparam_status_t status;
    size_t key_len = strlen(key);
    uint8_t *buffer;
    uint8_t *newbuf;
   
    if (!_sysparam_info.cur_base) return SYSPARAM_ERR_NOINIT;

    buffer = malloc(key_len + 2);
    if (!buffer) return SYSPARAM_ERR_NOMEM;
    do {
        _init_context(&ctx);
        status = _find_key(&ctx, key, key_len, buffer);
        if (status != SYSPARAM_OK) break;

        // Find the associated value
        status = _find_value(&ctx, ctx.entry.idflags);
        if (status != SYSPARAM_OK) break;

        newbuf = realloc(buffer, ctx.entry.len + 1);
        if (!newbuf) {
            status = SYSPARAM_ERR_NOMEM;
            break;
        }
        buffer = newbuf;
        status = _read_payload(&ctx, buffer, ctx.entry.len);
        if (status != SYSPARAM_OK) break;

        // Zero-terminate the result, just in case (doesn't hurt anything for
        // non-string data, and can avoid nasty mistakes if the caller wants to
        // interpret the result as a string).
        buffer[ctx.entry.len] = 0;

        *destptr = buffer;
        if (actual_length) *actual_length = ctx.entry.len;
        if (is_binary) *is_binary = (bool)(ctx.entry.idflags & ENTRY_FLAG_BINARY);
        return SYSPARAM_OK;
    } while (false);

    free(buffer);
    if (actual_length) *actual_length = 0;
    return status;
}

sysparam_status_t sysparam_get_data_static(const char *key, uint8_t *buffer, size_t buffer_size, size_t *actual_length, bool *is_binary) {
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
    status = _find_value(&ctx, ctx.entry.idflags);
    if (status != SYSPARAM_OK) return status;
    status = _read_payload(&ctx, buffer, buffer_size);
    if (status != SYSPARAM_OK) return status;

    if (actual_length) *actual_length = ctx.entry.len;
    if (is_binary) *is_binary = (bool)(ctx.entry.idflags & ENTRY_FLAG_BINARY);
    return SYSPARAM_OK;
}

sysparam_status_t sysparam_get_string(const char *key, char **destptr) {
    bool is_binary;
    sysparam_status_t status;
    uint8_t *buf;

    status = sysparam_get_data(key, &buf, NULL, &is_binary);
    if (status != SYSPARAM_OK) return status;
    if (is_binary) {
        // Value was saved as binary data, which means we shouldn't try to
        // interpret it as a string.
        free(buf);
        return SYSPARAM_PARSEFAILED;
    }
    // `sysparam_get_data` will zero-terminate the result as a matter of course,
    // so no need to do that here.
    *destptr = (char *)buf;
    return SYSPARAM_OK;
}

sysparam_status_t sysparam_get_int32(const char *key, int32_t *result) {
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

sysparam_status_t sysparam_get_int8(const char *key, int8_t *result) {
    int32_t value;
    sysparam_status_t status;

    status = sysparam_get_int32(key, &value);
    if (status == SYSPARAM_OK) {
        *result = value;
    }
    return status;
}

sysparam_status_t sysparam_get_bool(const char *key, bool *result) {
    char *buffer;
    sysparam_status_t status;

    status = sysparam_get_string(key, &buffer);
    if (status != SYSPARAM_OK) return status;
    do {
        if (!strcasecmp(buffer, "y")    ||
            !strcasecmp(buffer, "yes")  ||
            !strcasecmp(buffer, "t")    ||
            !strcasecmp(buffer, "true") ||
            !strcmp(buffer, "1")) {
                *result = true;
                break;
        }
        if (!strcasecmp(buffer, "n")     ||
            !strcasecmp(buffer, "no")    ||
            !strcasecmp(buffer, "f")     ||
            !strcasecmp(buffer, "false") ||
            !strcmp(buffer, "0")) {
                *result = false;
                break;
        }
        status = SYSPARAM_PARSEFAILED;
    } while (0);

    free(buffer);
    return status;
}

sysparam_status_t sysparam_set_data(const char *key, const uint8_t *value, size_t value_len, bool is_binary) {
    struct sysparam_context ctx;
    struct sysparam_context write_ctx;
    sysparam_status_t status = SYSPARAM_OK;
    uint16_t key_len = strlen(key);
    uint8_t *buffer;
    uint8_t *newbuf;
    size_t free_space;
    size_t needed_space;
    bool free_value = false;
    int key_id = -1;
    uint32_t old_value_addr = 0;
    uint16_t binary_flag;
   
    if (!_sysparam_info.cur_base) return SYSPARAM_ERR_NOINIT;
    if (!key_len) return SYSPARAM_ERR_BADVALUE;
    if (key_len > MAX_KEY_LEN) return SYSPARAM_ERR_BADVALUE;
    if (value_len > MAX_VALUE_LEN) return SYSPARAM_ERR_BADVALUE;

    xSemaphoreTake(_sysparam_info.sem, portMAX_DELAY);

    if (!value) value_len = 0;

    debug(1, "updating value for '%s' (%d bytes)", key, value_len);
    if (value_len && ((intptr_t)value & 0x3)) {
        // The passed value isn't word-aligned.  This will be a problem later
        // when calling `sdk_spi_flash_write`, so make a word-aligned copy.
        buffer = malloc(value_len);
        if (!buffer) {
            status = SYSPARAM_ERR_NOMEM;
            goto done;
        }
        memcpy(buffer, value, value_len);
        value = buffer;
        free_value = true;
    }
    // Create a working buffer for `_find_key` to use.
    buffer = malloc(key_len);
    if (!buffer) {
        if (free_value) free((void *)value);
        status = SYSPARAM_ERR_NOMEM;
        goto done;
    }

    do {
        _init_context(&ctx);
        status = _find_key(&ctx, key, key_len, buffer);
        if (status == SYSPARAM_OK) {
            // Key already exists, see if there's a current value.
            key_id = ctx.entry.idflags & ENTRY_MASK_ID;
            status = _find_value(&ctx, key_id);
            if (status == SYSPARAM_OK) {
                old_value_addr = ctx.addr;
            }
        }
        if (status < 0) break;

        binary_flag = is_binary ? ENTRY_FLAG_BINARY : 0;

        if (value_len) {
            if (old_value_addr) {
                if ((ctx.entry.idflags & ENTRY_FLAG_BINARY) == binary_flag && ctx.entry.len == value_len) {
                    // Are we trying to write the same value that's already there?
                    if (value_len > key_len) {
                        newbuf = realloc(buffer, value_len);
                        if (!newbuf) {
                            status = SYSPARAM_ERR_NOMEM;
                            break;
                        }
                        buffer = newbuf;
                    }
                    status = _read_payload(&ctx, buffer, value_len);
                    if (status < 0) break;
                    if (!memcmp(buffer, value, value_len)) {
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
            free_space = _sysparam_info.cur_base + _sysparam_info.region_size - _sysparam_info.end_addr;
            needed_space = ENTRY_SIZE(value_len);
            if (key_id < 0) {
                // We did not find a previous key entry matching this key.  We
                // will need to add a key entry as well.
                key_len = strlen(key);
                needed_space += ENTRY_SIZE(key_len);
            }
            if (needed_space > free_space) {
                // Can we compact things?
                // First, scan all remaining entries up to the end so we can
                // get a reasonably accurate "compactable" reading.
                _find_entry(&ctx, ENTRY_ID_END, false);
                if (needed_space <= free_space + ctx.compactable) {
                    // We should be able to get enough space by compacting.
                    status = _compact_params(&ctx, &key_id);
                    if (status < 0) break;
                    old_value_addr = 0;
                } else if (ctx.unused_keys > 0) {
                    // Compacting will gain more space than expected, because
                    // there are some keys that can be omitted too, but we
                    // don't know exactly how much that will gain, so all we
                    // can do is give it a try and see if it gives us enough.
                    status = _compact_params(&ctx, &key_id);
                    if (status < 0) break;
                    old_value_addr = 0;
                }
                free_space = _sysparam_info.cur_base + _sysparam_info.region_size - _sysparam_info.end_addr;
            }
            if (needed_space > free_space) {
                // Nothing we can do here.. We're full.
                // (at least full enough that compacting won't help us store
                // this value)
                debug(1, "region full (need %d of %d remaining)", needed_space, free_space);
                status = SYSPARAM_ERR_FULL;
                break;
            }

            if (key_id < 0) {
                // We need to write a key entry for a new key.
                // If we didn't find the key, then we already know _find_entry
                // has gone through the entire contents, and thus
                // ctx.max_key_id has the largest key_id found in the whole
                // region.
                if (ctx.max_key_id >= MAX_KEY_ID) {
                    if (ctx.unused_keys > 0) {
                        status = _compact_params(&ctx, &key_id);
                        if (status < 0) break;
                        old_value_addr = 0;
                    } else {
                        debug(1, "out of ids!");
                        status = SYSPARAM_ERR_FULL;
                        break;
                    }
                }
            }

            if (_sysparam_info.force_compact) {
                // We didn't need to compact above, but due to previously
                // detected inconsistencies, we should compact anyway before
                // writing anything new, so do that.
                status = _compact_params(&ctx, &key_id);
                if (status < 0) break;
            }

            init_write_context(&write_ctx);

            if (key_id < 0) {
                // Write a new key entry
                key_id = ctx.max_key_id + 1;
                status = _write_entry(write_ctx.addr, key_id, (uint8_t *)key, key_len);
                if (status < 0) break;
                write_ctx.addr += ENTRY_SIZE(key_len);
            }

            // Write new value
            status = _write_entry(write_ctx.addr, key_id | ENTRY_FLAG_VALUE | binary_flag, value, value_len);
            if (status < 0) break;
            write_ctx.addr += ENTRY_SIZE(value_len);
            _sysparam_info.end_addr = write_ctx.addr;
        }

        // Delete old value (if present) by clearing its "alive" flag
        if (old_value_addr) {
            status = _delete_entry(old_value_addr);
            if (status < 0) break;
        }

        debug(1, "New addr is 0x%08x (%d bytes remaining)", _sysparam_info.end_addr, _sysparam_info.cur_base + _sysparam_info.region_size - _sysparam_info.end_addr);
    } while (false);

    if (free_value) free((void *)value);
    free(buffer);

 done:
    xSemaphoreGive(_sysparam_info.sem);

    return status;
}

sysparam_status_t sysparam_set_string(const char *key, const char *value) {
    return sysparam_set_data(key, (const uint8_t *)value, strlen(value), false);
}

sysparam_status_t sysparam_set_int32(const char *key, int32_t value) {
    uint8_t buffer[12];
    int len;
    
    len = snprintf((char *)buffer, 12, "%d", value);
    return sysparam_set_data(key, buffer, len, false);
}

sysparam_status_t sysparam_set_int8(const char *key, int8_t value) {
    return sysparam_set_int32(key, value);
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
    return sysparam_set_data(key, buf, 1, false);
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
    char *newbuf;

    while (true) {
        status = _find_key(ctx, NULL, 0, buffer);
        if (status != SYSPARAM_OK) return status;
        memcpy(&value_ctx, ctx, sizeof(value_ctx));

        status = _find_value(&value_ctx, ctx->entry.idflags);
        if (status < 0) return status;
        if (status == SYSPARAM_NOTFOUND) continue;

        key_space = ROUND_TO_WORD_BOUNDARY(ctx->entry.len + 1);
        required_len = key_space + value_ctx.entry.len + 1;
        if (required_len > iter->bufsize) {
            newbuf = realloc(iter->key, required_len);
            if (!newbuf) {
                return SYSPARAM_ERR_NOMEM;
            }
            iter->key = newbuf;
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
        if (value_ctx.entry.idflags & ENTRY_FLAG_BINARY) {
            iter->binary = true;
            debug(2, "iter_next: (0x%08x) '%s' = (0x%08x) <binary-data> (%d)", ctx->addr, iter->key, value_ctx.addr, iter->value_len);
        } else {
            iter->binary = false;
            debug(2, "iter_next: (0x%08x) '%s' = (0x%08x) '%s' (%d)", ctx->addr, iter->key, value_ctx.addr, iter->value, iter->value_len);
        }

        return SYSPARAM_OK;
    }
}

void sysparam_iter_end(sysparam_iter_t *iter) {
    if (iter->key) free(iter->key);
    if (iter->ctx) free(iter->ctx);
}


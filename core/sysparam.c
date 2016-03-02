#include <stdlib.h>
#include <string.h>
#include <sysparam.h>
#include <espressif/spi_flash.h>

//TODO: make this properly threadsafe

#define SYSPARAM_MAGIC 0x70524f45 // "EORp" in little-endian
#define SYSPARAM_REGION_HEADER_SIZE 4
#define ENTRY_OVERHEAD 4
#define DEFAULT_ITER_BUF_SIZE 64
#define MAX_KEY_ID 0x7e

typedef struct sysparam_context {
    uint32_t key_addr;
    uint32_t value_addr;
    uint32_t end_addr;
    size_t key_len;
    size_t value_len;
    size_t compactable;
    uint8_t key_id;
    uint8_t max_key_id;
    bool length_error;
} sysparam_context_t;

//#define CHECK_FLASH_OP(x) if ((x) != SPI_FLASH_RESULT_OK) return SYSPARAM_ERR_IO;
#include <stdio.h>
#define CHECK_FLASH_OP(x) do { int __x = (x); if ((__x) != SPI_FLASH_RESULT_OK) { printf("FLASH ERR: %s: %d\n", #x, __x); return SYSPARAM_ERR_IO; } } while (0);

/* Internal data structures */

static struct {
    uint32_t cur_addr;
    uint32_t alt_addr;
    size_t region_size;
} sysparam_info;

/* Internal routines */

#define max(x, y) ((x) > (y) ? (x) : (y))
#define min(x, y) ((x) < (y) ? (x) : (y))

static sysparam_status_t format_region(uint32_t addr) {
    uint16_t sector = addr / sdk_flashchip.sector_size;
    int i;

    for (i = 0; i < SYSPARAM_REGION_SECTORS; i++) {
        CHECK_FLASH_OP(sdk_spi_flash_erase_sector(sector + i));
    }
    return SYSPARAM_OK;
}

static sysparam_status_t write_region_header(uint32_t addr) {
    uint32_t magic = SYSPARAM_MAGIC;
    CHECK_FLASH_OP(sdk_spi_flash_write(addr, &magic, 4));
    return SYSPARAM_OK;
}

static void init_context(sysparam_context_t *ctx) {
    memset(ctx, 0, sizeof(*ctx));
    ctx->key_addr = sysparam_info.cur_addr + SYSPARAM_REGION_HEADER_SIZE;
}

// Scan through the region to find the location of the key entry matching the
// specified name.
static sysparam_status_t find_key(sysparam_context_t *ctx, const char *key, size_t key_len, uint8_t *buffer) {
    size_t payload_len;
    uint8_t entry_id;

    // Are we already at the end?
    if (ctx->key_addr == ctx->end_addr) return SYSPARAM_NOTFOUND;

    while (ctx->key_addr < sysparam_info.cur_addr + sysparam_info.region_size - 2) {
        if (ctx->length_error) {
            // Our last entry's length fields didn't match, which means we have
            // no idea whether we're in the right place anymore.  Can't
            // continue.
            //FIXME: print an error
            return SYSPARAM_ERR_BADDATA;
        }
        if (ctx->key_len) {
            ctx->key_addr += ctx->key_len + ENTRY_OVERHEAD;
        }

        CHECK_FLASH_OP(sdk_spi_flash_read(ctx->key_addr, buffer, 2));
        payload_len = buffer[0];
        entry_id = buffer[1];
        ctx->key_len = payload_len;

        CHECK_FLASH_OP(sdk_spi_flash_read(ctx->key_addr + payload_len + 2, buffer, 2));
        // checksum = buffer[0]; //FIXME
        if (buffer[1] != payload_len) {
            ctx->length_error = true;
        }

        if (entry_id == 0xff) {
            // End of entries
            break;
        } else if (!entry_id) {
            // Deleted entry
        } else if (!(entry_id & 0x80)) {
            // Key definition
            ctx->max_key_id = max(ctx->max_key_id, entry_id);
            if (!key) {
                ctx->key_id = entry_id;
                return SYSPARAM_OK;
            }
            if (payload_len == key_len) {
                CHECK_FLASH_OP(sdk_spi_flash_read(ctx->key_addr + 2, buffer, key_len));
                //FIXME: check checksum
                // If checksum checks out, clear length_error
                if (!memcmp(key, buffer, key_len)) {
                    ctx->key_id = entry_id;
                    return SYSPARAM_OK;
                }
            }
        }
    }
    ctx->end_addr = ctx->key_addr;
    ctx->key_len = 0;
    return SYSPARAM_NOTFOUND;
}

// Scan through the region to find the location of the value entry matching the
// key found by `find_key`
static sysparam_status_t find_value(sysparam_context_t *ctx) {
    uint32_t addr = ctx->key_addr;
    size_t payload_len = ctx->key_len;
    bool length_error = ctx->length_error;
    uint8_t value_id = ctx->key_id | 0x80;
    uint8_t entry_id;
    uint8_t buffer[2];

    while (addr < sysparam_info.cur_addr + sysparam_info.region_size - 2) {
        if (length_error) {
            // Our last entry's length fields didn't match, which means we have
            // no idea whether we're in the right place anymore.  Can't
            // continue.
            //FIXME: print an error
            return SYSPARAM_ERR_BADDATA;
        }
        addr += payload_len + ENTRY_OVERHEAD;

        CHECK_FLASH_OP(sdk_spi_flash_read(addr, buffer, 2));
        payload_len = buffer[0];
        entry_id = buffer[1];

        CHECK_FLASH_OP(sdk_spi_flash_read(addr + payload_len + 2, buffer, 2));
        //checksum = buffer[0]; //FIXME
        if (buffer[1] != payload_len) {
            length_error = true;
        }

        if (entry_id == 0xff) {
            // End of entries
            break;
        } else if (!entry_id) {
            // Deleted entry
        } else if (!(entry_id & 0x80)) {
            // Key entry.  Make sure we update max_key_id.
            ctx->max_key_id = max(ctx->max_key_id, entry_id);
        } else if (entry_id == value_id) {
            // We found our value
            ctx->value_addr = addr;
            ctx->value_len = payload_len;
            return SYSPARAM_OK;
        }
    }
    ctx->end_addr = addr;
    ctx->value_len = 0;
    return SYSPARAM_NOTFOUND;
}

// Scan through any remaining data in the region until we get to the end,
// updating ctx as we go.
// NOTE: This assumes you've already called `find_key`/`find_value` (if you
// care about those things).  It only looks for the end.
static sysparam_status_t find_end(sysparam_context_t *ctx) {
    uint32_t addr;
    size_t payload_len;
    bool length_error = ctx->length_error;
    uint8_t entry_id;
    uint8_t buffer[2];

    if (ctx->end_addr) {
        return SYSPARAM_OK;
    }
    if (ctx->value_addr) {
        addr = ctx->value_addr;
        payload_len = ctx->value_len;
    } else {
        addr = ctx->key_addr;
        payload_len = ctx->key_len;
    }
    while (addr < sysparam_info.cur_addr + sysparam_info.region_size - 2) {
        if (length_error) {
            // Our last entry's length fields didn't match, which means we have
            // no idea whether we're in the right place anymore.  Can't
            // continue.
            //FIXME: print an error
            return SYSPARAM_ERR_BADDATA;
        }
        addr += payload_len + ENTRY_OVERHEAD;

        CHECK_FLASH_OP(sdk_spi_flash_read(addr, buffer, 2));
        payload_len = buffer[0];
        entry_id = buffer[1];

        CHECK_FLASH_OP(sdk_spi_flash_read(addr + payload_len + 2, buffer, 2));
        //checksum = buffer[0]; //FIXME
        if (buffer[1] != payload_len) {
            length_error = true;
        }

        if (entry_id == 0xff) {
            // End of entries
            break;
        } else if (!entry_id) {
            // Deleted entry
        } else if (!(entry_id & 0x80)) {
            // Key entry.  Make sure we update max_key_id.
            ctx->max_key_id = max(ctx->max_key_id, entry_id);
        }
    }
    ctx->end_addr = addr;
    ctx->value_len = 0;
    return SYSPARAM_OK;
}

static sysparam_status_t read_key(sysparam_context_t *ctx, char *buffer, size_t buffer_size) {
    if (!ctx->key_len) {
        return SYSPARAM_NOTFOUND;
    }
    CHECK_FLASH_OP(sdk_spi_flash_read(ctx->key_addr + 2, buffer, min(buffer_size, ctx->key_len)));
    //FIXME: check checksum
    return SYSPARAM_OK;
}

static sysparam_status_t read_value(sysparam_context_t *ctx, uint8_t *buffer, size_t buffer_size) {
    if (!ctx->value_len) {
        return SYSPARAM_NOTFOUND;
    }
    CHECK_FLASH_OP(sdk_spi_flash_read(ctx->value_addr + 2, buffer, min(buffer_size, ctx->value_len)));
    //FIXME: check checksum
    return SYSPARAM_OK;
}

static inline sysparam_status_t write_entry(uint32_t addr, uint8_t id, const uint8_t *payload, size_t payload_len) {
    uint8_t buffer[2];

    buffer[0] = payload_len;
    buffer[1] = id;
    CHECK_FLASH_OP(sdk_spi_flash_write(addr, buffer, 2));
    CHECK_FLASH_OP(sdk_spi_flash_write(addr + 2, payload, payload_len));
    buffer[0] = 0; //FIXME: calculate checksum
    buffer[1] = payload_len;
    CHECK_FLASH_OP(sdk_spi_flash_write(addr + 2 + payload_len, buffer, 2));

    return SYSPARAM_OK;
}

static sysparam_status_t compact_params(sysparam_context_t *ctx, bool delete_current_value) {
    uint32_t new_base = sysparam_info.alt_addr;
    sysparam_status_t status;
    uint32_t addr = new_base + SYSPARAM_REGION_HEADER_SIZE;
    uint8_t current_key_id = 0;
    uint32_t zero = 0;
    sysparam_iter_t iter;

    status = format_region(new_base);
    if (status < 0) return status;
    status = sysparam_iter_start(&iter);
    if (status < 0) return status;

    while (true) {
        status = sysparam_iter_next(&iter);
        if (status < 0) break;

        current_key_id++;

        if (iter.ctx->key_addr == ctx->key_addr) {
            ctx->key_addr = addr;
        }
        if (iter.ctx->key_id == ctx->key_id) {
            ctx->key_id = current_key_id;
        }

        // Write the key to the new region
        status = write_entry(addr, current_key_id, (uint8_t *)iter.key, iter.key_len);
        if (status < 0) break;
        addr += iter.key_len + ENTRY_OVERHEAD;

        if (iter.ctx->value_addr == ctx->value_addr) {
            if (delete_current_value) {
                // Don't copy the old value, since we'll just be deleting it
                // and writing a new one as soon as we return.
                ctx->value_addr = 0;
                ctx->value_len = 0;
                continue;
            } else {
                ctx->value_addr = addr;
            }
        }
        // Copy the value to the new region
        status = write_entry(addr, current_key_id | 0x80, iter.value, iter.value_len);
        if (status < 0) break;
        addr += iter.value_len + ENTRY_OVERHEAD;
    }
    sysparam_iter_end(&iter);

    // If we broke out with an error, return the error instead of continuing.
    if (status < 0) return status;

    // Fix up all the remaining bits of ctx to have correct values for the new
    // (compacted) region.
    ctx->end_addr = addr;
    ctx->compactable = 0;
    ctx->max_key_id = current_key_id;
    ctx->length_error = false;

    // Switch to officially using the new region.
    status = write_region_header(new_base);
    if (status < 0) return status;
    sysparam_info.alt_addr = sysparam_info.cur_addr;
    sysparam_info.cur_addr = new_base;
    // Zero out the old header, so future calls to sysparam_init() will know
    // that the new one is the correct region to be looking at.
    CHECK_FLASH_OP(sdk_spi_flash_write(sysparam_info.alt_addr, &zero, 4));

    return SYSPARAM_OK;
}

/* Public Functions */

sysparam_status_t sysparam_init(uint32_t base_addr, bool create) {
    sysparam_status_t status;
    size_t region_size = SYSPARAM_REGION_SECTORS * sdk_flashchip.sector_size;
    uint32_t magic;
    int i;

    sysparam_info.region_size = region_size;
    for (i = 0; i < 2; i++) {
        CHECK_FLASH_OP(sdk_spi_flash_read(base_addr + (i * region_size), &magic, 4));
        if (magic == SYSPARAM_MAGIC) {
            sysparam_info.cur_addr = base_addr + i * region_size;
            sysparam_info.alt_addr = base_addr + (i ^ 1) * region_size;
            return SYSPARAM_OK;
        }
    }
    // We couldn't find one already present, so create a new one at the
    // specified address (if `create` is set).
    if (create) {
        sysparam_info.cur_addr = base_addr;
        sysparam_info.alt_addr = base_addr + region_size;
        status = format_region(base_addr);
        if (status != SYSPARAM_OK) return status;
        return write_region_header(base_addr);
    } else {
        return SYSPARAM_NOTFOUND;
    }
}

sysparam_status_t sysparam_get_raw(const char *key, uint8_t **destptr, size_t *actual_length) {
    sysparam_context_t ctx;
    sysparam_status_t status;
    size_t key_len = strlen(key);
    uint8_t *buffer = malloc(key_len + 2);

    if (!buffer) return SYSPARAM_ERR_NOMEM;
    do {
        init_context(&ctx);
        status = find_key(&ctx, key, key_len, buffer);
        if (status != SYSPARAM_OK) break;

        status = find_value(&ctx);
        if (status != SYSPARAM_OK) break;

        buffer = realloc(buffer, ctx.value_len + 1);
        if (!buffer) {
            return SYSPARAM_ERR_NOMEM;
        }
        status = read_value(&ctx, buffer, ctx.value_len);
        if (status != SYSPARAM_OK) break;

        // Zero-terminate the result, just in case (doesn't hurt anything for
        // non-string data, and can avoid nasty mistakes if the caller wants to
        // interpret the result as a string).
        buffer[ctx.value_len] = 0;

        *destptr = buffer;
        if (actual_length) *actual_length = ctx.value_len;
        return SYSPARAM_OK;
    } while (false);

    free(buffer);
    *destptr = NULL;
    if (actual_length) *actual_length = 0;
    return status;
}

sysparam_status_t sysparam_get_string(const char *key, char **destptr) {
    // `sysparam_get_raw` will zero-terminate the result as a matter of course,
    // so no need to do that here.
    return sysparam_get_raw(key, (uint8_t **)destptr, NULL);
}

sysparam_status_t sysparam_get_raw_static(const char *key, uint8_t *buffer, size_t buffer_size, size_t *actual_length) {
    sysparam_context_t ctx;
    sysparam_status_t status = SYSPARAM_OK;
    size_t key_len = strlen(key);

    // Supplied buffer must be at least as large as the key, or 2 bytes,
    // whichever is larger.
    if (buffer_size < max(key_len, 2)) return SYSPARAM_ERR_NOMEM;

    if (actual_length) *actual_length = 0;

    init_context(&ctx);
    status = find_key(&ctx, key, key_len, buffer);
    if (status != SYSPARAM_OK) return status;
    status = find_value(&ctx);
    if (status != SYSPARAM_OK) return status;
    status = read_value(&ctx, buffer, buffer_size);
    if (status != SYSPARAM_OK) return status;

    if (actual_length) *actual_length = ctx.value_len;
    return SYSPARAM_OK;
}

sysparam_status_t sysparam_put_raw(const char *key, const uint8_t *value, size_t value_len) {
    sysparam_context_t ctx;
    sysparam_status_t status = SYSPARAM_OK;
    size_t key_len = strlen(key);
    uint8_t *buffer;
    size_t free_space;
    size_t needed_space;
    bool free_value = false;
   
    if (!key_len) return SYSPARAM_ERR_BADARGS;
    if (value_len && (value & 0x3)) {
        // The passed value isn't word-aligned.  This will be a problem later
        // when calling `sdk_spi_flash_write`, so make a word-aligned copy.
        buffer = malloc(value_len);
        if (!buffer) return SYSPARAM_ERR_NOMEM;
        memcpy(buffer, value, value_len);
        value = buffer;
        free_value = true;
    }
    // Create a working buffer for `find_key` to use.
    buffer = malloc(key_len);
    if (!buffer) {
        if (free_value) free(value);
        return SYSPARAM_ERR_NOMEM;
    }


    do {
        init_context(&ctx);
        status = find_key(&ctx, key, key_len, buffer);
        if (status == SYSPARAM_OK) {
            // Key already exists, see if there's a current value.
            status = find_value(&ctx);
        }
        if (status < 0) break;

        if (value_len) {
            if (ctx.value_len == value_len) {
                // Are we trying to write the same value that's already there?
                if (value_len > key_len) {
                    buffer = realloc(buffer, value_len);
                    if (!buffer) return SYSPARAM_ERR_NOMEM;
                }
                status = read_value(&ctx, buffer, value_len);
                if (status < 0) break;
                if (!memcmp(buffer, value, value_len)) {
                    // Yup! No need to do anything further, just leave the
                    // current value as-is.
                    status = SYSPARAM_OK;
                    break;
                }
            }

            // Write the new/updated value
            status = find_end(&ctx);
            if (status < 0) break;

            // Since we will be deleting the old value (if any) make sure that
            // the compactable count includes the space taken up by that entry
            // too (even though it's not actually deleted yet)
            if (ctx.value_addr) {
                ctx.compactable += ctx.value_len + ENTRY_OVERHEAD;
            }

            // Append new value to the end, but first make sure we have enough
            // space.
            free_space = sysparam_info.region_size - (ctx.end_addr - sysparam_info.cur_addr);
            needed_space = ENTRY_OVERHEAD + value_len;
            if (!ctx.key_id) {
                // We did not find a previous key entry matching this key.  We will
                // need to add a key entry as well.
                key_len = strlen(key);
                needed_space += ENTRY_OVERHEAD + key_len;
            }
            if (needed_space > free_space) {
                if (needed_space > free_space + ctx.compactable) {
                    // Nothing we can do here.. We're full.
                    // (at least full enough that compacting won't help us store
                    // this value)
                    //FIXME: debug message
                    status = SYSPARAM_ERR_FULL;
                    break;
                }
                // We should have enough space after we compact things.
                status = compact_params(&ctx, true);
                if (status < 0) break;
            }

            if (!ctx.key_id) {
                // Write key entry for new key
                ctx.key_id = ctx.max_key_id + 1;
                if (ctx.key_id > MAX_KEY_ID) {
                    status = SYSPARAM_ERR_FULL;
                    break;
                }
                status = write_entry(ctx.end_addr, ctx.key_id, (uint8_t *)key, key_len);
                if (status < 0) break;
                ctx.end_addr += key_len + ENTRY_OVERHEAD;
            }

            // Write new value
            status = write_entry(ctx.end_addr, ctx.key_id | 0x80, value, value_len);
            if (status < 0) break;
        }

        // Delete old value (if present) by setting it's id to 0x00
        if (ctx.value_addr) {
            buffer[0] = 0;
            if (sdk_spi_flash_write(ctx.value_addr + 1, buffer, 1) != SPI_FLASH_RESULT_OK) {
                status = SYSPARAM_ERR_IO;
                break;
            }
        }
    } while (false);

    if (free_value) free(value);
    free(buffer);
    return status;
}

sysparam_status_t sysparam_put_string(const char *key, const char *value) {
    return sysparam_put_raw(key, (const uint8_t *)value, strlen(value));
}

sysparam_status_t sysparam_iter_start(sysparam_iter_t *iter) {
    iter->bufsize = DEFAULT_ITER_BUF_SIZE;
    iter->key = malloc(iter->bufsize);
    if (!iter->key) {
        iter->bufsize = 0;
        return SYSPARAM_ERR_NOMEM;
    }
    iter->key_len = 0;
    iter->value_len = 0;
    iter->ctx = malloc(sizeof(sysparam_context_t));
    if (!iter->ctx) {
        free(iter->key);
        iter->bufsize = 0;
        return SYSPARAM_ERR_NOMEM;
    }
    init_context(iter->ctx);

    return SYSPARAM_OK;
}

sysparam_status_t sysparam_iter_next(sysparam_iter_t *iter) {
    uint8_t buffer[2];
    sysparam_status_t status;
    size_t required_len;

    while (true) {
        status = find_key(iter->ctx, NULL, 0, buffer);
        if (status != 0) return status;
        status = find_value(iter->ctx);
        if (status < 0) return status;
        if (status == SYSPARAM_NOTFOUND) continue;
        required_len = iter->ctx->key_len + 1 + iter->ctx->value_len + 1;
        if (required_len < iter->bufsize) {
            iter->key = realloc(iter->key, required_len);
            if (!iter->key) {
                iter->bufsize = 0;
                return SYSPARAM_ERR_NOMEM;
            }
            iter->bufsize = required_len;
        }

        status = read_key(iter->ctx, iter->key, iter->bufsize);
        if (status < 0) return status;
        // Null-terminate the key
        iter->key[iter->ctx->key_len] = 0;
        iter->key_len = iter->ctx->key_len;

        iter->value = (uint8_t *)iter->key + iter->ctx->key_len + 1;
        status = read_value(iter->ctx, iter->value, iter->bufsize - iter->ctx->key_len - 1);
        if (status < 0) return status;
        // Null-terminate the value (just in case)
        iter->value[iter->ctx->value_len] = 0;
        iter->value_len = iter->ctx->value_len;

        return SYSPARAM_OK;
    }
}

void sysparam_iter_end(sysparam_iter_t *iter) {
    if (iter->key) free(iter->key);
    if (iter->ctx) free(iter->ctx);
}


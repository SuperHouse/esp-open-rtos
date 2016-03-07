#ifndef _SYSPARAM_H_
#define _SYSPARAM_H_

#include <esp/types.h>

#ifndef SYSPARAM_REGION_SECTORS
// Number of (4K) sectors that make up a sysparam region.  Total sysparam data
// cannot be larger than this.  Note that the actual amount of used flash
// space will be *twice* this amount.
#define SYSPARAM_REGION_SECTORS 1
#endif

typedef enum {
    SYSPARAM_ERR_NOMEM    = -6,
    SYSPARAM_ERR_CORRUPT  = -5,
    SYSPARAM_ERR_IO       = -4,
    SYSPARAM_ERR_FULL     = -3,
    SYSPARAM_ERR_BADVALUE = -2,
    SYSPARAM_ERR_NOINIT   = -1,
    SYSPARAM_OK           = 0,
    SYSPARAM_NOTFOUND     = 1,
    SYSPARAM_PARSEFAILED  = 2,
} sysparam_status_t;

typedef struct {
    char *key;
    uint8_t *value;
    size_t key_len;
    size_t value_len;
    size_t bufsize;
    struct sysparam_context *ctx;
} sysparam_iter_t;

sysparam_status_t sysparam_init(uint32_t base_addr);
sysparam_status_t sysparam_create_area(uint32_t base_addr, bool force);
sysparam_status_t sysparam_get_data(const char *key, uint8_t **destptr, size_t *actual_length);
sysparam_status_t sysparam_get_data_static(const char *key, uint8_t *buffer, size_t buffer_size, size_t *actual_length);
sysparam_status_t sysparam_get_string(const char *key, char **destptr);
sysparam_status_t sysparam_get_int(const char *key, int32_t *result);
sysparam_status_t sysparam_get_bool(const char *key, bool *result);
sysparam_status_t sysparam_set_data(const char *key, const uint8_t *value, size_t value_len);
sysparam_status_t sysparam_set_string(const char *key, const char *value);
sysparam_status_t sysparam_set_int(const char *key, int32_t value);
sysparam_status_t sysparam_set_bool(const char *key, bool value);
sysparam_status_t sysparam_iter_start(sysparam_iter_t *iter);
sysparam_status_t sysparam_iter_next(sysparam_iter_t *iter);
void sysparam_iter_end(sysparam_iter_t *iter);

#endif /* _SYSPARAM_H_ */

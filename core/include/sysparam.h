#ifndef _SYSPARAM_H_
#define _SYSPARAM_H_

#include <esp/types.h>

#ifndef SYSPARAM_REGION_SECTORS
/** Number of (4K) sectors that make up a sysparam region.  Total sysparam data
 *  cannot be larger than this.  Note that the full sysparam area is two
 *  regions, so the actual amount of used flash space will be *twice* this
 *  amount.
 */
#define SYSPARAM_REGION_SECTORS 1
#endif

/** Status codes returned by all sysparam functions
 *
 *  Error codes all have values less than zero, and can be returned by any
 *  function.  Values greater than zero are non-error status codes which may be
 *  returned by some functions to indicate various results (each function should document which non-error statuses it may return).
 */
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

 *  @retval SYSPARAM_ERR_NOINIT   sysparam_init() must be called first
 *  @retval SYSPARAM_ERR_BADVALUE One or more arguments are invalid
 *  @retval SYSPARAM_ERR_FULL     No space left in sysparam area
 *                                (or too many keys in use)
 *  @retval SYSPARAM_ERR_NOMEM    Unable to allocate memory
 *  @retval SYSPARAM_ERR_CORRUPT  Sysparam region has bad/corrupted data
 *  @retval SYSPARAM_ERR_IO       I/O error reading/writing flash

/** Structure used by sysparam_iter_next() to keep track of its current state
 * and return its results.  This should be initialized by calling
 * sysparam_iter_start() and cleaned up afterward by calling
 * sysparam_iter_end().
 */
typedef struct {
    char *key;
    uint8_t *value;
    size_t key_len;
    size_t value_len;
    size_t bufsize;
    struct sysparam_context *ctx;
} sysparam_iter_t;

/** Initialize sysparam and set up the current area of flash to use.
 *
 *  This must be called (and return successfully) before any other sysparam
 *  routines (except sysparam_create_area()) are called.
 *
 *  This should normally be taken care of automatically on boot by the OS
 *  startup routines.  It may be necessary to call it specially, however, if
 *  the normal initialization failed, or after calling sysparam_create_area()
 *  to reformat the current area.
 *
 *  @param base_addr [in] The flash address which should contain the start of
 *                        the (already present) sysparam area
 *
 *  @retval SYSPARAM_OK           Initialization successful.
 *  @retval SYSPARAM_NOTFOUND     The specified address does not appear to
 *                                contain a sysparam area.  It may be necessary
 *                                to call sysparam_create_area() to create one
 *                                first.
 *  @retval SYSPARAM_ERR_CORRUPT  Sysparam region has bad/corrupted data
 *  @retval SYSPARAM_ERR_IO       I/O error reading/writing flash
 */
sysparam_status_t sysparam_init(uint32_t base_addr);

/** Create a new sysparam area in flash at the specified address.
 *
 *  By default, this routine will scan the specified area to make sure it
 *  appears to be empty (i.e. all 0xFF bytes) before setting it up as a new
 *  sysparam area.  If there appears to be other data already present, it will
 *  not overwrite it.  Setting `force` to `true` will cause it to clobber any
 *  existing data instead.
 *
 *  @param base_addr [in] The flash address at which it should start
 *                        (must be a multiple of the sector size)
 *  @param force     [in] Proceed even if the space does not appear to be empty
 *
 *  @retval SYSPARAM_OK        Area (re)created successfully.
 *  @retval SYSPARAM_NOTFOUND  `force` was not specified, and the area at
 *                             `base_addr` appears to have other data.  No
 *                             action taken.
 *  @retval SYSPARAM_ERR_IO    I/O error reading/writing flash
 *
 *  Note: This routine can create a sysparam area in another location than the
 *  one currently being used, but does not change which area is currently used
 *  (you will need to call sysparam_init() again if you want to do that).  If
 *  you reformat the area currently being used, you will also need to call
 *  sysparam_init() again afterward before you will be able to continue using
 *  it.
 */ 
sysparam_status_t sysparam_create_area(uint32_t base_addr, bool force);

/** Get the value associated with a key
 *
 *  This is the core "get value" function.  It will retrieve the value for the
 *  specified key in a freshly malloc()'d buffer and return it.  Raw values can
 *  contain any data (including zero bytes), so the `actual_length` parameter
 *  should be used to determine the length of the data in the buffer.
 *
 *  Note: It is up to the caller to free() the returned buffer when done using
 *  it.
 *
 *  @param key           [in]  Key name (zero-terminated string)
 *  @param destptr       [out] Pointer to a location to hold the address of the
 *                             returned data buffer
 *  @param actual_length [out] Pointer to a location to hold the length of the
 *                             returned data buffer
 *
 *  @retval SYSPARAM_OK           Value successfully retrieved.
 *  @retval SYSPARAM_NOTFOUND     Key/value not found.  No buffer returned.
 *  @retval SYSPARAM_ERR_NOINIT   sysparam_init() must be called first
 *  @retval SYSPARAM_ERR_NOMEM    Unable to allocate memory
 *  @retval SYSPARAM_ERR_CORRUPT  Sysparam region has bad/corrupted data
 *  @retval SYSPARAM_ERR_IO       I/O error reading/writing flash
 *
 *  Note: If the result is anything other than SYSPARAM_OK, the value
 *  in `destptr` is not changed.  This means it is possible to set a default
 *  value before calling this function which will be left as-is if a sysparam
 *  value could not be successfully read.
 */
sysparam_status_t sysparam_get_data(const char *key, uint8_t **destptr, size_t *actual_length);

/** Get the value associate with a key (static buffers only)
 *
 *  This performs the same function as sysparam_get_data() but without
 *  performing any memory allocations.  It can thus be used before the heap has
 *  been configured or in other cases where using the heap would be a problem
 *  (i.e. in an OOM handler, etc).  It requires that the caller pass in a
 *  suitably sized buffer for the value to be read (if the supplied buffer is
 *  not large enough, the returned value will be truncated and the full
 *  required length will be returned in `actual_length`).
 *
 *  NOTE: In addition to being large enough for the value, the supplied buffer
 *  must also be at least as large as the length of the key being requested.
 *  If it is not, an error will be returned.
 *
 *  @param key           [in]  Key name (zero-terminated string)
 *  @param buffer        [in]  Pointer to a buffer to hold the returned value
 *  @param buffer_size   [in]  Length of the supplied buffer in bytes
 *  @param actual_length [out] pointer to a location to hold the actual length
 *                             of the data which was associated with the key
 *                             (may be NULL).
 *
 *  @retval SYSPARAM_OK           Value successfully retrieved
 *  @retval SYSPARAM_NOTFOUND     Key/value not found
 *  @retval SYSPARAM_ERR_NOINIT   sysparam_init() must be called first
 *  @retval SYSPARAM_ERR_NOMEM    The supplied buffer is too small
 *  @retval SYSPARAM_ERR_CORRUPT  Sysparam region has bad/corrupted data
 *  @retval SYSPARAM_ERR_IO       I/O error reading/writing flash
 */
sysparam_status_t sysparam_get_data_static(const char *key, uint8_t *buffer, size_t buffer_size, size_t *actual_length);

/** Return the string value associated with a key
 * 
 *  This routine can be used if you know that the value in a key will (or at
 *  least should) be a string.  It will return a zero-terminated char buffer
 *  containing the value retrieved.
 *
 *  Note: It is up to the caller to free() the returned buffer when done using
 *  it.
 *
 *  @param key     [in]  Key name (zero-terminated string)
 *  @param destptr [out] Pointer to a location to hold the address of the
 *                       returned data buffer
 *
 *  @retval SYSPARAM_OK           Value successfully retrieved.
 *  @retval SYSPARAM_NOTFOUND     Key/value not found.
 *  @retval SYSPARAM_ERR_NOINIT   sysparam_init() must be called first
 *  @retval SYSPARAM_ERR_NOMEM    Unable to allocate memory
 *  @retval SYSPARAM_ERR_CORRUPT  Sysparam region has bad/corrupted data
 *  @retval SYSPARAM_ERR_IO       I/O error reading/writing flash
 *
 *  Note: If the result is anything other than SYSPARAM_OK, the value
 *  in `destptr` is not changed.  This means it is possible to set a default
 *  value before calling this function which will be left as-is if a sysparam
 *  value could not be successfully read.
 */
sysparam_status_t sysparam_get_string(const char *key, char **destptr);

/** Return the int32_t value associated with a key
 * 
 *  This routine can be used if you know that the value in a key will (or at
 *  least should) be an integer value.  It will parse the stored data as a
 *  number (in standard decimal or "0x" hex notation) and return the result.
 *
 *  @param key    [in]  Key name (zero-terminated string)
 *  @param result [out] Pointer to a location to hold returned integer value
 *
 *  @retval SYSPARAM_OK           Value successfully retrieved.
 *  @retval SYSPARAM_NOTFOUND     Key/value not found.
 *  @retval SYSPARAM_PARSEFAILED  The retrieved value could not be parsed as an
 *                                integer.
 *  @retval SYSPARAM_ERR_NOINIT   sysparam_init() must be called first
 *  @retval SYSPARAM_ERR_NOMEM    Unable to allocate memory
 *  @retval SYSPARAM_ERR_CORRUPT  Sysparam region has bad/corrupted data
 *  @retval SYSPARAM_ERR_IO       I/O error reading/writing flash
 *
 *  Note: If the result is anything other than SYSPARAM_OK, the value
 *  in `result` is not changed.  This means it is possible to set a default
 *  value before calling this function which will be left as-is if a sysparam
 *  value could not be successfully read.
 */
sysparam_status_t sysparam_get_int(const char *key, int32_t *result);

/** Return the boolean value associated with a key
 * 
 *  This routine can be used if you know that the value in a key will (or at
 *  least should) be a boolean setting.  It will read the specified value as a
 *  text string and attempt to parse it as a boolean value.
 *
 *  It will recognize the following (case-insensitive) strings:
 *    * True: "yes", "y", "true", "t", "1"
 *    * False: "no", "n", "false", "f", "0"
 *
 *  @param key    [in]  Key name (zero-terminated string)
 *  @param result [out] Pointer to a location to hold returned boolean value
 *
 *  @retval SYSPARAM_OK           Value successfully retrieved.
 *  @retval SYSPARAM_NOTFOUND     Key/value not found.
 *  @retval SYSPARAM_PARSEFAILED  The retrieved value could not be parsed as a
 *                                boolean setting.
 *  @retval SYSPARAM_ERR_NOINIT   sysparam_init() must be called first
 *  @retval SYSPARAM_ERR_NOMEM    Unable to allocate memory
 *  @retval SYSPARAM_ERR_CORRUPT  Sysparam region has bad/corrupted data
 *  @retval SYSPARAM_ERR_IO       I/O error reading/writing flash
 *
 *  Note: If the result is anything other than SYSPARAM_OK, the value
 *  in `result` is not changed.  This means it is possible to set a default
 *  value before calling this function which will be left as-is if a sysparam
 *  value could not be successfully read.
 */
sysparam_status_t sysparam_get_bool(const char *key, bool *result);

/** Set the value associated with a key
 *
 *  The supplied value can be any data, up to 255 bytes in length.  If `value`
 *  is NULL or `value_len` is 0, this is treated as a request to delete any
 *  current entry matching `key`.
 *
 *  @param key       [in] Key name (zero-terminated string)
 *  @param value     [in] Pointer to a buffer containing the value data
 *  @param value_len [in] Length of the data in the buffer
 *
 *  @retval SYSPARAM_OK           Value successfully set.
 *  @retval SYSPARAM_ERR_NOINIT   sysparam_init() must be called first
 *  @retval SYSPARAM_ERR_BADVALUE Either an empty key was provided or value_len
 *                                is too large
 *  @retval SYSPARAM_ERR_FULL     No space left in sysparam area
 *                                (or too many keys in use)
 *  @retval SYSPARAM_ERR_NOMEM    Unable to allocate memory
 *  @retval SYSPARAM_ERR_CORRUPT  Sysparam region has bad/corrupted data
 *  @retval SYSPARAM_ERR_IO       I/O error reading/writing flash
 */
sysparam_status_t sysparam_set_data(const char *key, const uint8_t *value, size_t value_len);

/** Set a key's value from a string
 *
 *  Performs the same function as sysparam_set_data(), but accepts a
 *  zero-terminated string value instead.
 *
 *  @param key       [in] Key name (zero-terminated string)
 *  @param value     [in] Value to set (zero-terminated string)
 *
 *  @retval SYSPARAM_OK           Value successfully set.
 *  @retval SYSPARAM_ERR_BADVALUE Either an empty key was provided or the
 *                                length of `value` is too large
 *  @retval SYSPARAM_ERR_FULL     No space left in sysparam area
 *                                (or too many keys in use)
 *  @retval SYSPARAM_ERR_NOMEM    Unable to allocate memory
 *  @retval SYSPARAM_ERR_CORRUPT  Sysparam region has bad/corrupted data
 *  @retval SYSPARAM_ERR_IO       I/O error reading/writing flash
 */
sysparam_status_t sysparam_set_string(const char *key, const char *value);

/** Set a key's value as a number
 *
 *  Converts an int32_t value to a decimal number and writes it to the
 *  specified key.  This does the inverse of the sysparam_get_int()
 *  function.
 *
 *  @param key       [in] Key name (zero-terminated string)
 *  @param value     [in] Value to set
 *
 *  @retval SYSPARAM_OK           Value successfully set.
 *  @retval SYSPARAM_ERR_BADVALUE An empty key was provided.
 *  @retval SYSPARAM_ERR_FULL     No space left in sysparam area
 *                                (or too many keys in use)
 *  @retval SYSPARAM_ERR_NOMEM    Unable to allocate memory
 *  @retval SYSPARAM_ERR_CORRUPT  Sysparam region has bad/corrupted data
 *  @retval SYSPARAM_ERR_IO       I/O error reading/writing flash
 */
sysparam_status_t sysparam_set_int(const char *key, int32_t value);

/** Set a key's value as a boolean (yes/no) string
 *
 *  Converts a bool value to a corresponding text string and writes it to the
 *  specified key.  This does the inverse of the sysparam_get_bool()
 *  function.
 *
 *  Note that if the key already contains a value which parses to the same
 *  boolean (true/false) value, it is left unchanged.
 *
 *  @param key       [in] Key name (zero-terminated string)
 *  @param value     [in] Value to set
 *
 *  @retval SYSPARAM_OK           Value successfully set.
 *  @retval SYSPARAM_ERR_BADVALUE An empty key was provided.
 *  @retval SYSPARAM_ERR_FULL     No space left in sysparam area
 *                                (or too many keys in use)
 *  @retval SYSPARAM_ERR_NOMEM    Unable to allocate memory
 *  @retval SYSPARAM_ERR_CORRUPT  Sysparam region has bad/corrupted data
 *  @retval SYSPARAM_ERR_IO       I/O error reading/writing flash
 */
sysparam_status_t sysparam_set_bool(const char *key, bool value);

/** Begin iterating through all key/value pairs
 *
 *  This function initializes a sysparam_iter_t structure to prepare it for
 *  iterating through the list of key/value pairs using sysparam_iter_next().
 *  This does not fetch any items (the first successive call to
 *  sysparam_iter_next() will return the first key/value in the list).
 *
 *  NOTE: When done, you must call sysparam_iter_end() to free the resources
 *  associated with `iter`, or you will leak memory.
 *
 *  @param iter [in] A pointer to a sysparam_iter_t structure to initialize
 *
 *  @retval SYSPARAM_OK           Initialization successful
 *  @retval SYSPARAM_ERR_NOMEM    Unable to allocate memory
 */
sysparam_status_t sysparam_iter_start(sysparam_iter_t *iter);

/** Fetch the next key/value pair
 *
 *  This will retrieve the next key and value from the sysparam area, placing
 *  them in `iter->key`, and `iter->value` (and updating `iter->key_len` and
 *  `iter->value_len`).
 *
 *  NOTE: `iter->key` and `iter->value` are static buffers local to the `iter`
 *  structure, and will be overwritten with the next call to
 *  sysparam_iter_next() using the same `iter`.  They should *not* be free()d
 *  after use.
 *
 *  @param iter [in]  The iterator structure to update
 *
 *  @retval SYSPARAM_OK           Next key/value retrieved
 *  @retval SYSPARAM_ERR_NOMEM    Unable to allocate memory
 *  @retval SYSPARAM_ERR_CORRUPT  Sysparam region has bad/corrupted data
 *  @retval SYSPARAM_ERR_IO       I/O error reading/writing flash
 */
sysparam_status_t sysparam_iter_next(sysparam_iter_t *iter);

/** Finish iterating through keys/values
 *
 *  Cleans up and releases resources allocated by sysparam_iter_start() /
 *  sysparam_iter_next().
 */
void sysparam_iter_end(sysparam_iter_t *iter);

#endif /* _SYSPARAM_H_ */

/* ESP8266 "Hardware RNG" (validity still being confirmed) support for ESP8266
 *
 * Based on research done by @foogod.
 *
 * Please don't rely on this too much as an entropy source, quite yet...
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Angus Gratton
 * BSD Licensed as described in the file LICENSE
 */
#include <mbedtls/entropy_poll.h>
#include <esp/wdev_regs.h>
#include <string.h>

int mbedtls_hardware_poll( void *data,
                           unsigned char *output, size_t len, size_t *olen )
{
    (void)(data);
    for(int i = 0; i < len; i+=4) {
        uint32_t random = WDEV.HWRNG;
        /* using memcpy here in case output is unaligned */
        memcpy(output + i, &random, (i+4 <= len) ? 4 : (len % 4));
    }
    if(olen)
        *olen = len;
    return 0;
}

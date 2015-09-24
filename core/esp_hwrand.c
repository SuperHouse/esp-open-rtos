/* Hardware Random Number Generator Functions
 *
 * For documentation, see http://esp8266-re.foogod.com/wiki/Random_Number_Generator
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Angus Gratton
 * BSD Licensed as described in the file LICENSE
 */
#include <esp/hwrand.h>
#include <esp/wdev_regs.h>
#include <string.h>

/* Return a random 32-bit number */
uint32_t hwrand(void)
{
    return WDEV.HWRNG;
}

/* Fill a variable size buffer with data from the Hardware RNG */
void hwrand_fill(uint8_t *buf, size_t len)
{
    for(size_t i = 0; i < len; i+=4) {
        uint32_t random = WDEV.HWRNG;
        /* using memcpy here in case 'buf' is unaligned */
        memcpy(buf + i, &random, (i+4 <= len) ? 4 : (len % 4));
    }
}

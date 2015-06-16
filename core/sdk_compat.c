/*
 * Wrappers for functions called by binary espressif libraries
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

void *zalloc(size_t nbytes)
{
    return calloc(1, nbytes);
}

/* this is currently just a stub to see where in the SDK it gets
   called, and with what arguments...

   In the binary SDK printf & ets_printf are aliased together, most
   references appear to be to printf but libphy, libwpa & libnet80211
   all call ets_printf sometimes... Seems to not be in common code
   paths, haven't investigated exactly where.
*/
int ets_printf(const char *format, ...)  {
    return printf("ets_printf format=%s\r\n", format);
}


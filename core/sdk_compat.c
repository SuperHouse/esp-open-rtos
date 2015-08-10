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
#include <common_macros.h>

void IRAM *zalloc(size_t nbytes)
{
    return calloc(1, nbytes);
}

extern void (*__init_array_start)(void);
extern void (*__init_array_end)(void);

/* Do things which should be done as part of the startup code, but aren't.

   Can be replaced with _start() once we have open source startup code.
*/
void sdk_compat_initialise()
{
    /* Call C++ constructors or C functions marked with __attribute__((constructor)) */
    void (**p)(void);
    for ( p = &__init_array_start; p != &__init_array_end; ++p)
        (*p)();
}

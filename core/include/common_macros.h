/* Some common compiler macros
 *
 * Not esp8266-specific.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */

#ifndef _COMMON_MACROS_H
#define _COMMON_MACROS_H

#include <sys/cdefs.h>

#define UNUSED __attributed((unused))

#ifndef BIT
#define BIT(X) (1<<(X))
#endif

/* These macros convert values to/from bitfields specified by *_M and *_S (mask
 * and shift) constants.  Used primarily with ESP8266 register access.
 */

#define VAL2FIELD(fieldname, value) (((value) & fieldname##_M) << fieldname##_S)
#define FIELD2VAL(fieldname, regbits) (((regbits) >> fieldname##_S) & fieldname##_M)

#define FIELD_MASK(fieldname) (fieldname##_M << fieldname##_S)
#define SET_FIELD(regbits, fieldname, value) (((regbits) & ~FIELD_MASK(fieldname)) | VAL2FIELD(fieldname, value))

/* Use this macro to store constant values in IROM flash instead
   of having them loaded into rodata (which resides in DRAM)

   Unlike the ESP8266 SDK you don't need an attribute like this for
   standard functions. They're stored in flash by default. But
   variables need them.

   Important to note: IROM flash can only be accessed via 32-bit word
   aligned reads. It's up to the user of this attribute to ensure this.
*/
#ifdef	__cplusplus
    #define IROM __attribute__((section(".irom0.literal")))
#else
    #define IROM __attribute__((section(".irom0.literal"))) const
#endif

#define INLINED inline static __attribute__((always_inline)) __attribute__((unused))

#define IRAM __attribute__((section(".iram1.text")))

#endif

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

#define UNUSED __attributed((unused))

#ifndef BIT
#define BIT(X) (1<<X)
#endif

/* Use this macro to store constant values in IROM flash instead
   of having them loaded into rodata (which resides in DRAM)

   Unlike the ESP8266 SDK you don't need an attribute like this for
   standard functions. They're stored in flash by default. But
   variables need them.

   Important to note: IROM flash can only be accessed via 32-bit word
   aligned reads. It's up to the user of this attribute to ensure this.
*/
#define IROM __attribute__((section(".irom0.literal"))) const

#define INLINED inline static __attribute__((always_inline)) __attribute__((unused))

#define IRAM __attribute__((section(".iram1.text")))

#endif

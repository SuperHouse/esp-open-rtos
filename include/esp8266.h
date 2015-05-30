/* esp8266.h
 *
 * ESP-specific SoC-level addresses, macros, etc.
 * Part of esp-open-rtos
 *
 * Copyright (C) 2105 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#include <stdint.h>

#ifndef _ESP8266_H
#define _ESP8266_H

/* Use this macro to store constant values in IROM flash instead
   of having them loaded into rodata (which resides in DRAM)

   Unlike the ESP8266 SDK you don't need an attribute like this for
   standard functions. They're stored in flash by default. But
   variables need them.

   Important to note: IROM flash can only be accessed via 32-bit word
   aligned reads. It's up to the user of this attribute to ensure this.
*/
#define IROM __attribute__((section(".irom0"))) const


/* Register addresses

   ESPTODO: break this out to its own header file and clean it up, add other regs, etc.
*/
static volatile __attribute__((unused)) uint32_t *ESP_REG_WDT = (uint32_t *)0x60000900;

#endif

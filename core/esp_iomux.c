/* Compiler-level implementation for esp/iomux.h and esp/iomux_private.h
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#include "esp/iomux.h"
#include "common_macros.h"

/* These are non-static versions of the GPIO mapping tables in
   iomux.h, so if they need to be linked only one copy is linked for
   the entire program.

   These are only ever linked in if the arguments to gpio_to_ionum
   or ionum_to_gpio are not known at compile time.

   Arrays are declared as 32-bit integers in IROM to save RAM.
*/
const IROM uint32_t GPIO_TO_IOMUX_MAP[] = _GPIO_TO_IOMUX;
const IROM uint32_t IOMUX_TO_GPIO_MAP[] = _IOMUX_TO_GPIO;

/** esp/iomux_private.h
 *
 * Private implementation parts of iomux registers. In headers to
 * allow compile-time optimisations.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */

/* Mapping from register index to GPIO and from GPIO index to register
   number. DO NOT USE THESE IN YOUR CODE, call gpio_to_iomux(xxx) or
   iomux_to_gpio(xxx) instead.
*/
#ifndef _IOMUX_PRIVATE
#define _IOMUX_PRIVATE

#include "common_macros.h"

#define _IOMUX_TO_GPIO { 12, 13, 14, 15, 3, 1, 6, 7, 8, 9, 10, 11, 0, 2, 4, 5 }
#define _GPIO_TO_IOMUX { 12, 5, 13, 4, 14, 15, 6, 7, 8, 9, 10, 11, 0, 1, 2, 3 }

extern const IROM uint32_t GPIO_TO_IOMUX_MAP[];
extern const IROM uint32_t IOMUX_TO_GPIO_MAP[];

INLINED uint8_t gpio_to_iomux(const uint8_t gpio_number)
{
    if(__builtin_constant_p(gpio_number)) {
        static const uint8_t _regs[] = _GPIO_TO_IOMUX;
        return _regs[gpio_number];
    } else {
        return GPIO_TO_IOMUX_MAP[gpio_number];
    }
}

INLINED uint8_t iomux_to_gpio(const uint8_t iomux_number)
{
    if(__builtin_constant_p(iomux_number)) {
        static const uint8_t _regs[] = _IOMUX_TO_GPIO;
        return _regs[iomux_number];
    } else {
        return IOMUX_TO_GPIO_MAP[iomux_number];
    }
}

#endif

/** esp/iomux.h
 *
 * Configuration of iomux registers.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#ifndef _ESP_IOMUX_H
#define _ESP_IOMUX_H
#include "esp/types.h"
#include "esp/iomux_regs.h"

#ifdef	__cplusplus
extern "C" {
#endif

/**
 * Convert a GPIO pin number to an iomux register index.
 *
 * This function should evaluate to a constant if the gpio_number is
 * known at compile time, or return the result from a lookup table if not.
 *
 */
uint8_t IRAM gpio_to_iomux(const uint8_t gpio_number);

/**
 * Convert an iomux register index to a GPIO pin number.
 *
 * This function should evaluate to a constant if the iomux_num is
 * known at compile time, or return the result from a lookup table if not.
 *
 */
uint8_t IRAM iomux_to_gpio(const uint8_t iomux_num);

/**
 * Directly get the IOMUX register for a particular gpio number
 *
 * ie *gpio_iomux_reg(3) is equivalent to IOMUX_GPIO3
 */
inline static esp_reg_t gpio_iomux_reg(const uint8_t gpio_number)
{
    return &(IOMUX.PIN[gpio_to_iomux(gpio_number)]);
}

/**
 * Set a pin to the GPIO function.
 *
 * This allows you to set pins to GPIO without knowing in advance the
 * exact register masks to use.
 *
 * flags can be any of IOMUX_PIN_OUTPUT_ENABLE, IOMUX_PIN_PULLUP, IOMUX_PIN_PULLDOWN, etc. Any other flags will be cleared.
 *
 * Equivalent to a direct register operation if gpio_number is known at compile time.
 * ie the following are equivalent:
 *
 * iomux_set_gpio_function(12, IOMUX_PIN_OUTPUT_ENABLE);
 * IOMUX_GPIO12 = IOMUX_GPIO12_FUNC_GPIO | IOMUX_PIN_OUTPUT_ENABLE;
 */
inline static void iomux_set_gpio_function(const uint8_t gpio_number, const uint32_t flags)
{
    const uint8_t reg_idx = gpio_to_iomux(gpio_number);
    const uint32_t func = (reg_idx > 11 ? IOMUX_FUNC(0) : IOMUX_FUNC(3)) | flags;
    IOMUX.PIN[reg_idx] = func | flags;
}

#ifdef	__cplusplus
}
#endif

#endif

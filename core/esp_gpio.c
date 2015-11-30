/* GPIO management functions
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Angus Gratton
 * BSD Licensed as described in the file LICENSE
 */
#include <esp/gpio.h>

void gpio_enable(const uint8_t gpio_num, const gpio_direction_t direction)
{
    uint32_t iomux_flags;

    switch(direction) {
    case GPIO_INPUT:
        iomux_flags = 0;
        break;
    case GPIO_OUTPUT:
        iomux_flags = IOMUX_PIN_OUTPUT_ENABLE;
        break;
    case GPIO_OUT_OPEN_DRAIN:
        iomux_flags = IOMUX_PIN_OUTPUT_ENABLE;
        break;
    case GPIO_INPUT_PULLUP:
        iomux_flags = IOMUX_PIN_PULLUP;
        break;
    default:
        return; /* Invalid direction flag */
    }
    iomux_set_gpio_function(gpio_num, iomux_flags);
    if(direction == GPIO_OUT_OPEN_DRAIN)
        GPIO.CONF[gpio_num] |= GPIO_CONF_OPEN_DRAIN;
    else
        GPIO.CONF[gpio_num] &= ~GPIO_CONF_OPEN_DRAIN;
    if (iomux_flags & IOMUX_PIN_OUTPUT_ENABLE)
        GPIO.ENABLE_OUT_SET = BIT(gpio_num);
    else
        GPIO.ENABLE_OUT_CLEAR = BIT(gpio_num);
}


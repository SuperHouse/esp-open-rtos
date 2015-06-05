/** esp_iomux.h
 *
 * GPIO functions.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#ifndef _ESP_GPIO_H
#include <stdbool.h>
#include "esp/registers.h"
#include "esp/iomux.h"

typedef enum {
    GPIO_INPUT = 0,
    GPIO_OUTPUT = IOMUX_OE,
    GPIO_INPUT_PULLUP = IOMUX_PU,
} gpio_direction_t;

/* Enable GPIO on the specified pin, and set it to input/output/ with
 *  pullup as needed
 */
INLINED void gpio_enable(const uint8_t gpio_num, const gpio_direction_t direction)
{
    iomux_set_gpio_function(gpio_num, (uint8_t)direction);
    if(direction == GPIO_OUTPUT)
	GPIO_DIR_SET = BIT(gpio_num);
    else
	GPIO_DIR_CLEAR = BIT(gpio_num);
}

/* Disable GPIO on the specified pin, and set it Hi-Z.
 *
 * If later muxing this pin to a different function, make sure to set
 * IOMUX_OE if necessary to enable the output buffer.
 */
INLINED void gpio_disable(const uint8_t gpio_num)
{
    GPIO_DIR_CLEAR = BIT(gpio_num);
    *gpio_iomux_reg(gpio_num) &= ~IOMUX_OE;
}

/* Set output of a pin high or low.
 *
 * Only works if pin has been set to GPIO_OUTPUT via gpio_enable()
 */
INLINED void gpio_write(const uint8_t gpio_num, const uint32_t set)
{
    if(set)
	GPIO_OUT_SET = BIT(gpio_num);
    else
	GPIO_OUT_CLEAR = BIT(gpio_num);
}

/* Toggle output of a pin
 *
 * Only works if pin has been set to GPIO_OUTPUT via gpio_enable()
 */
INLINED void gpio_toggle(const uint8_t gpio_num)
{
    /* Why implement like this instead of GPIO_OUT_REG ^= xxx?
       Concurrency. If an interrupt or higher priority task writes to
       GPIO_OUT between reading and writing, only the gpio_num pin can
       get an invalid value. Prevents one task from clobbering another
       task's pins, without needing to disable/enable interrupts.
    */
    if(GPIO_OUT_REG & BIT(gpio_num))
	GPIO_OUT_CLEAR = BIT(gpio_num);
    else
	GPIO_OUT_SET = BIT(gpio_num);
}

/* Read input value of a GPIO pin.
 *
 * If pin is set as an input, this reads the value on the pin.
 * If pin is set as an output, this reads the last value written to the pin.
 */
INLINED bool gpio_read(const uint8_t gpio_num)
{
    return GPIO_IN_REG & BIT(gpio_num);
}


#endif

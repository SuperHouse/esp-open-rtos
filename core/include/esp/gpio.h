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
#include "esp/cpu.h"
#include "xtensa_interrupts.h"

typedef enum {
    GPIO_INPUT,
    GPIO_OUTPUT,         /* "Standard" push-pull output */
    GPIO_OUT_OPEN_DRAIN, /* Open drain output */
    GPIO_INPUT_PULLUP,
} gpio_direction_t;

/* Enable GPIO on the specified pin, and set it to input/output/ with
 *  pullup as needed
 */
INLINED void gpio_enable(const uint8_t gpio_num, const gpio_direction_t direction)
{
    uint32_t iomux_flags;
    uint32_t ctrl_val;

    switch(direction) {
    case GPIO_INPUT:
        iomux_flags = 0;
        ctrl_val = GPIO_SOURCE_GPIO;
        break;
    case GPIO_OUTPUT:
        iomux_flags = IOMUX_OE;
        ctrl_val = GPIO_DRIVE_PUSH_PULL|GPIO_SOURCE_GPIO;
        break;
    case GPIO_OUT_OPEN_DRAIN:
        iomux_flags = IOMUX_OE;
        ctrl_val = GPIO_DRIVE_OPEN_DRAIN|GPIO_SOURCE_GPIO;
        break;
    case GPIO_INPUT_PULLUP:
        iomux_flags = IOMUX_PU;
        ctrl_val = GPIO_SOURCE_GPIO;
    }
    iomux_set_gpio_function(gpio_num, iomux_flags);
    GPIO_CTRL_REG(gpio_num) = (GPIO_CTRL_REG(gpio_num)&GPIO_INT_MASK) | ctrl_val;
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

typedef enum {
    INT_NONE = 0,
    INT_RISING = GPIO_INT_RISING,
    INT_FALLING = GPIO_INT_FALLING,
    INT_CHANGE = GPIO_INT_CHANGE,
    INT_LOW = GPIO_INT_LOW,
    INT_HIGH = GPIO_INT_HIGH,
} gpio_interrupt_t;

extern void gpio_interrupt_handler(void);

/* Set the interrupt type for a given pin
 */
INLINED void gpio_set_interrupt(const uint8_t gpio_num, const gpio_interrupt_t int_type)
{
    GPIO_CTRL_REG(gpio_num) = (GPIO_CTRL_REG(gpio_num)&~GPIO_INT_MASK)
        | (int_type & GPIO_INT_MASK);
    if(int_type != INT_NONE) {
        _xt_isr_attach(INUM_GPIO, gpio_interrupt_handler);
        _xt_isr_unmask(1<<INUM_GPIO);
    }
}

#endif

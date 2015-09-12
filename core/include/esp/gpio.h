/** esp_iomux.h
 *
 * GPIO functions.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#ifndef _ESP_GPIO_H
#define _ESP_GPIO_H
#include <stdbool.h>
#include "esp/gpio_regs.h"
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

/* Disable GPIO on the specified pin, and set it Hi-Z.
 *
 * If later muxing this pin to a different function, make sure to set
 * IOMUX_PIN_OUTPUT_ENABLE if necessary to enable the output buffer.
 */
INLINED void gpio_disable(const uint8_t gpio_num)
{
    GPIO.ENABLE_OUT_CLEAR = BIT(gpio_num);
    *gpio_iomux_reg(gpio_num) &= ~IOMUX_PIN_OUTPUT_ENABLE;
}

/* Set output of a pin high or low.
 *
 * Only works if pin has been set to GPIO_OUTPUT via gpio_enable()
 */
INLINED void gpio_write(const uint8_t gpio_num, const bool set)
{
    if(set)
        GPIO.OUT_SET = BIT(gpio_num);
    else
        GPIO.OUT_CLEAR = BIT(gpio_num);
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
    if(GPIO.OUT & BIT(gpio_num))
        GPIO.OUT_CLEAR = BIT(gpio_num);
    else
        GPIO.OUT_SET = BIT(gpio_num);
}

/* Read input value of a GPIO pin.
 *
 * If pin is set as an input, this reads the value on the pin.
 * If pin is set as an output, this reads the last value written to the pin.
 */
INLINED bool gpio_read(const uint8_t gpio_num)
{
    return GPIO.IN & BIT(gpio_num);
}

extern void gpio_interrupt_handler(void);

/* Set the interrupt type for a given pin
 *
 * If int_type is not GPIO_INTTYPE_NONE, the gpio_interrupt_handler will be attached and unmasked.
 */
INLINED void gpio_set_interrupt(const uint8_t gpio_num, const gpio_inttype_t int_type)
{
    GPIO.CONF[gpio_num] = SET_FIELD(GPIO.CONF[gpio_num], GPIO_CONF_INTTYPE, int_type);
    if(int_type != GPIO_INTTYPE_NONE) {
        _xt_isr_attach(INUM_GPIO, gpio_interrupt_handler);
        _xt_isr_unmask(1<<INUM_GPIO);
    }
}

/* Return the interrupt type set for a pin */
INLINED gpio_inttype_t gpio_get_interrupt(const uint8_t gpio_num)
{
    return (gpio_inttype_t)FIELD2VAL(GPIO_CONF_INTTYPE, GPIO.CONF[gpio_num]);
}

#endif

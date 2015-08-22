/* ESP GPIO interrupts.

   Use with gpio_set_interrupt(), defined in esp/gpio.h

   These interrupt vectors are default implementations with weak
   linkage. If you write your own GPIO interrupt vectors in your program
   then they will replace these at link time.

   Look in examples/button/ for a simple GPIO interrupt example.

   You can implement GPIO interrupt handlers in either of two ways:

   - Implement gpXX_interrupt_handler() for each GPIO pin number that
     you want to use interrupt with. This is simple but it may not
     be enough in all cases.

   void gpio01_interrupt_handler(void) {
       // Do something when GPIO 01 changes
   }

   void gpio12_interrupt_handler(void) {
       // Do something when GPIO 12 changes
   }

   OR

   - Implement a single function named gpio_interrupt_handler(). This
     will need to manually check GPIO.STATUS and clear any status
     bits after handling interrupts. This gives you full control, but
     you can't combine it with the first approach.


  Part of esp-open-rtos
  Copyright (C) 2015 Superhouse Automation Pty Ltd
  BSD Licensed as described in the file LICENSE
 */
#include "esp8266.h"

void gpio_interrupt_handler(void);
void gpio_noop_interrupt_handler(void) { }
void gpio00_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio01_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio02_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio03_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio04_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio05_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio06_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio07_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio08_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio09_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio10_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio11_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio12_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio13_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio14_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));
void gpio15_interrupt_handler(void) __attribute__((weak, alias("gpio_noop_interrupt_handler")));

typedef void (* gpio_interrupt_handler_t)(void);

const gpio_interrupt_handler_t gpio_interrupt_handlers[16] = {
    gpio00_interrupt_handler, gpio01_interrupt_handler, gpio02_interrupt_handler,
    gpio03_interrupt_handler, gpio04_interrupt_handler, gpio05_interrupt_handler,
    gpio06_interrupt_handler, gpio07_interrupt_handler, gpio08_interrupt_handler,
    gpio09_interrupt_handler, gpio10_interrupt_handler, gpio11_interrupt_handler,
    gpio12_interrupt_handler, gpio13_interrupt_handler, gpio14_interrupt_handler,
    gpio15_interrupt_handler };

void __attribute__((weak)) IRAM gpio_interrupt_handler(void)
{
    uint32_t status_reg = GPIO.STATUS;
    GPIO.STATUS_CLEAR = status_reg;
    uint8_t gpio_idx;
    while((gpio_idx = __builtin_ffs(status_reg)))
    {
        gpio_idx--;
        status_reg &= ~BIT(gpio_idx);
        if(FIELD2VAL(GPIO_CONF_INTTYPE, GPIO.CONF[gpio_idx]))
            gpio_interrupt_handlers[gpio_idx]();
    }
}

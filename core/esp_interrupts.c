/* ESP8266 Xtensa interrupt management functions
 *
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Angus Gratton
 * BSD Licensed as described in the file LICENSE
 */
#include <esp/interrupts.h>

_xt_isr isr[16];

void IRAM _xt_isr_attach(uint8_t i, _xt_isr func)
{
    isr[i] = func;
}

/* This ISR handler is taken directly from the FreeRTOS port and
   probably could use a cleanup.
*/
uint16_t IRAM _xt_isr_handler(uint16_t i)
{
    uint8_t index;

    /* I think this is implementing some kind of interrupt priority or
       short-circuiting an expensive ffs for most common interrupts - ie
       WDT And GPIO are common or high priority, then remaining flags.
    */
    if (i & (1 << INUM_WDT)) {
	index = INUM_WDT;
    }
    else if (i & (1 << INUM_GPIO)) {
	index = INUM_GPIO;
    }else {
	index = __builtin_ffs(i) - 1;

	if (index == INUM_MAX) {
	    /* I don't understand what happens here. INUM_MAX is not
	       the highest interrupt number listed (and the isr array
	       has 16 entries).

	       Clearing that flag and then setting index to
	       __builtin_ffs(i)-1 may result in index == 255 if no
	       higher flags are set, unless this is guarded against
	       somehow by the caller?

	       I also don't understand why the code is written like
	       this in esp_iot_rtos_sdk instead of just putting the i
	       &= line near the top... Probably no good reason?
	    */
	    i &= ~(1 << INUM_MAX);
	    index = __builtin_ffs(i) - 1;
	}
    }

    _xt_clear_ints(1<<index);

    isr[index]();

    return i & ~(1 << index);
}

/* esp/cpu.h
 *
 * Details relating to the ESP8266 Xtensa core.
 *
 */
#ifndef _ESP_CPU_H
#define _ESP_CPU_H
#include <stdbool.h>

/* Interrupt numbers for level 1 exception handler.
 *
 * Currently the UserExceptionVector calls down to _xt_isr_handler,
 * defined in port.c, for at least some of these interrupts. Some are handled
 * on the SDK side, though.
 */
typedef enum {
    INUM_SPI = 2,
    INUM_GPIO = 4,
    INUM_UART = 5,
    INUM_MAX = 6, /* in some places this is documented as timer0 CCOMPARE0 interrupt */
    INUM_SOFT = 7,
    INUM_WDT = 8,
    INUM_TIMER_FRC1 = 9,

    /* FRC2 default handler. Configured by sdk_ets_timer_init, which
       runs as part of default libmain.a startup code, assigns
       interrupt handler to sdk_vApplicationTickHook+0x68
     */
    INUM_TIMER_FRC2 = 10,
} xt_isr_num_t;

#endif


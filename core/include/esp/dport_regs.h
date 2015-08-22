/* esp/dport_regs.h
 *
 * ESP8266 DPORT0 register definitions
 *
 * Not compatible with ESP SDK register access code.
 */

#ifndef _ESP_DPORT_REGS_H
#define _ESP_DPORT_REGS_H

#include "esp/types.h"
#include "common_macros.h"

#define DPORT_BASE 0x3ff00000
#define DPORT (*(struct DPORT_REGS *)(DPORT_BASE))

/* DPORT registers

   Control various aspects of core/peripheral interaction... Not well
   documented or understood.
*/

struct DPORT_REGS {
    uint32_t volatile _unknown0;    // 0x00
    uint32_t volatile INT_ENABLE;   // 0x04
} __attribute__ (( packed ));

_Static_assert(sizeof(struct DPORT_REGS) == 0x08, "DPORT_REGS is the wrong size");

/* Details for INT_ENABLE register */

/* Set flags to enable CPU interrupts from some peripherals. Read/write.

   bit 0 - Is set by RTOS SDK startup code but function is unknown.
   bit 1 - INT_ENABLE_TIMER0 allows TIMER 0 (FRC1) to trigger interrupt INUM_TIMER_FRC1.
   bit 2 - INT_ENABLE_TIMER1 allows TIMER 1 (FRC2) to trigger interrupt INUM_TIMER_FRC2.

   Espressif calls this register "EDGE_INT_ENABLE_REG". The "edge" in
   question is (I think) the interrupt line from the peripheral, as
   the interrupt status bit is set. There may be a similar register
   for enabling "level" interrupts instead of edge triggering
   - this is unknown.
*/

#define DPORT_INT_ENABLE_TIMER0  BIT(1)
#define DPORT_INT_ENABLE_TIMER1  BIT(2)

/* Aliases for the Espressif way of referring to TIMER0 (FRC1) and TIMER1
 * (FRC2).. */
#define DPORT_INT_ENABLE_FRC1  DPORT_INT_ENABLE_TIMER0
#define DPORT_INT_ENABLE_FRC2  DPORT_INT_ENABLE_TIMER1

#endif /* _ESP_DPORT_REGS_H */

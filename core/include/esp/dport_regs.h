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
    uint32_t volatile DPORT0;              // 0x00  FIXME: need a better name for this
    uint32_t volatile INT_ENABLE;          // 0x04
    uint32_t volatile _unknown08;          // 0x08
    uint32_t volatile SPI_READY;           // 0x0c
    uint32_t volatile _unknown10;          // 0x10
    uint32_t volatile CPU_CLOCK;           // 0x14
    uint32_t volatile CLOCKGATE_WATCHDOG;  // 0x18
    uint32_t volatile _unknown1c;          // 0x1c
    uint32_t volatile SPI_INT_STATUS;      // 0x20
    uint32_t volatile SPI_CACHE_RAM;       // 0x24
    uint32_t volatile PERI_IO;             // 0x28
    uint32_t volatile SLC_TX_DESC_DEBUG;   // 0x2c
    uint32_t volatile _unknown30;          // 0x30
    uint32_t volatile _unknown34;          // 0x34
    uint32_t volatile _unknown38;          // 0x38
    uint32_t volatile _unknown3c;          // 0x3c
    uint32_t volatile _unknown40;          // 0x40
    uint32_t volatile _unknown44;          // 0x44
    uint32_t volatile _unknown48;          // 0x48
    uint32_t volatile _unknown4c;          // 0x4c
    uint32_t volatile OTP_MAC0;            // 0x50
    uint32_t volatile OTP_MAC1;            // 0x54
    uint32_t volatile OTP_CHIPID;          // 0x58
    uint32_t volatile OTP_MAC2;            // 0x5c
};

_Static_assert(sizeof(struct DPORT_REGS) == 0x60, "DPORT_REGS is the wrong size");

/* Details for DPORT0 register */

/* Currently very little known about this register.  The following is based on analysis of the startup code in the Espressif SDK: */

#define DPORT_DPORT0_FIELD0_M  0x0000001f
#define DPORT_DPORT0_FIELD0_S  0

/* Details for INT_ENABLE register */

/* Set flags to enable CPU interrupts from some peripherals. Read/write.

   bit 0 - INT_ENABLE_WDT (unclear exactly how this works.  Set by RTOS SDK startup code)
   bit 1 - INT_ENABLE_TIMER0 allows TIMER 0 (FRC1) to trigger interrupt INUM_TIMER_FRC1.
   bit 2 - INT_ENABLE_TIMER1 allows TIMER 1 (FRC2) to trigger interrupt INUM_TIMER_FRC2.

   Espressif calls this register "EDGE_INT_ENABLE_REG". The "edge" in
   question is (I think) the interrupt line from the peripheral, as
   the interrupt status bit is set. There may be a similar register
   for enabling "level" interrupts instead of edge triggering
   - this is unknown.
*/

#define DPORT_INT_ENABLE_WDT     BIT(0)
#define DPORT_INT_ENABLE_TIMER0  BIT(1)
#define DPORT_INT_ENABLE_TIMER1  BIT(2)

/* Aliases for the Espressif way of referring to TIMER0 (FRC1) and TIMER1
 * (FRC2).. */
#define DPORT_INT_ENABLE_FRC1  DPORT_INT_ENABLE_TIMER0
#define DPORT_INT_ENABLE_FRC2  DPORT_INT_ENABLE_TIMER1

/* Details for SPI_READY register */

#define DPORT_SPI_READY_IDLE     BIT(9)

/* Details for CPU_CLOCK register */

#define DPORT_CPU_CLOCK_X2       BIT(0)

/* Details for CLOCKGATE_WATCHDOG register */

/* Comment found in pvvx/mp3_decode headers: "use clockgate_watchdog(flg) { if(flg) 0x3FF00018 &= 0x77; else 0x3FF00018 |= 8; }".  Not sure what this means or does. */

#define DPORT_CLOCKGATE_WATCHDOG_DISABLE  BIT(3)

/* Details for SPI_INT_STATUS register */

#define DPORT_SPI_INT_STATUS_SPI0  BIT(4)
#define DPORT_SPI_INT_STATUS_SPI1  BIT(7)
#define DPORT_SPI_INT_STATUS_I2S   BIT(9)

/* Details for SPI_CACHE_RAM register */

#define DPORT_SPI_CACHE_RAM_BANK1  BIT(3)
#define DPORT_SPI_CACHE_RAM_BANK0  BIT(4)

/* Details for PERI_IO register */

#define DPORT_PERI_IO_SWAP_UARTS       BIT(0)
#define DPORT_PERI_IO_SWAP_SPIS        BIT(1)
#define DPORT_PERI_IO_SWAP_UART0_PINS  BIT(2)
#define DPORT_PERI_IO_SWAP_UART1_PINS  BIT(3)
#define DPORT_PERI_IO_SPI1_PRIORITY    BIT(5)
#define DPORT_PERI_IO_SPI1_SHARED      BIT(6)
#define DPORT_PERI_IO_SPI0_SHARED      BIT(7)

/* Details for SLC_TX_DESC_DEBUG register */

#define SLC_TX_DESC_DEBUG_VALUE_M      0x0000ffff
#define SLC_TX_DESC_DEBUG_VALUE_S      0

#define SLC_TX_DESC_DEBUG_VALUE_MAGIC  0xcccc

#endif /* _ESP_DPORT_REGS_H */

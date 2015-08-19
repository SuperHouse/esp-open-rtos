/* esp/registers.h
 *
 * ESP8266 register addresses and bitmasks.
 *
 * Not compatible with ESP SDK register access code.
 *
 * Based on register map documentation:
 * https://github.com/esp8266/esp8266-wiki/wiki/Memory-Map
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#ifndef _ESP_REGISTERS
#define _ESP_REGISTERS
#include "common_macros.h"
#include "esp/types.h"

#include "esp/iomux_regs.h"

/* Internal macro, only defined in header body */
#define _REG(BASE, OFFSET) (*(esp_reg_t)((BASE)+(OFFSET)))

/* Register base addresses

   You shouldn't need to use these directly.
 */
#define MMIO_BASE   0x60000000
#define DPORT_BASE  0x3ff00000

#define UART0_BASE (MMIO_BASE + 0)
#define SPI1_BASE  (MMIO_BASE + 0x0100)
#define SPI_BASE   (MMIO_BASE + 0x0200)
#define GPIO0_BASE (MMIO_BASE + 0x0300)
#define TIMER_BASE (MMIO_BASE + 0x0600)
#define RTC_BASE   (MMIO_BASE + 0x0700)
//#define IOMUX_BASE (MMIO_BASE + 0x0800)
#define WDT_BASE   (MMIO_BASE + 0x0900)
#define I2C_BASE   (MMIO_BASE + 0x0d00)
#define UART1_BASE (MMIO_BASE + 0x0F00)
#define RTCB_BASE  (MMIO_BASE + 0x1000)
#define RTCS_BASE  (MMIO_BASE + 0x1100)
#define RTCU_BASE  (MMIO_BASE + 0x1200)


/*
 * Based on descriptions by mamalala at https://github.com/esp8266/esp8266-wiki/wiki/gpio-registers
 */

/** GPIO OUTPUT registers GPIO_OUT_REG, GPIO_OUT_SET, GPIO_OUT_CLEAR
 *
 * Registers for pin outputs.
 *
 * _SET and _CLEAR write-only registers set and clear bits in _REG,
 * respectively.
 *
 * ie
 * GPIO_OUT_REG |= BIT(3);
 * and
 * GPIO_OUT_SET = BIT(3);
 *
 * ... are equivalent, but latter uses less CPU cycles.
 */
#define GPIO_OUT_REG   _REG(GPIO0_BASE, 0x00)
#define GPIO_OUT_SET   _REG(GPIO0_BASE, 0x04)
#define GPIO_OUT_CLEAR _REG(GPIO0_BASE, 0x08)

/* GPIO DIR registers GPIO_DIR_REG, GPIO_DIR_SET, GPIO_DIR_CLEAR
 *
 * Set bit in DIR register for output pins. Writing to _SET and _CLEAR
 * registers set and clear bits in _REG, respectively.
*/
#define GPIO_DIR_REG   _REG(GPIO0_BASE, 0x0C)
#define GPIO_DIR_SET   _REG(GPIO0_BASE, 0x10)
#define GPIO_DIR_CLEAR _REG(GPIO0_BASE, 0x14)


/* GPIO IN register GPIO_IN_REG
 *
 * Reads current input values.
 */
#define GPIO_IN_REG    _REG(GPIO0_BASE, 0x18)

/* GPIO interrupt 'status' flag

   Bit set if interrupt has fired (see below for interrupt config
   registers.

   Lower 16 bits only are used.
*/
#define GPIO_STATUS_REG   _REG(GPIO0_BASE,0x1c)
#define GPIO_STATUS_SET   _REG(GPIO0_BASE,0x20)
#define GPIO_STATUS_CLEAR _REG(GPIO0_BASE,0x24)

#define GPIO_STATUS_MASK  0x0000FFFFL

/* GPIO pin control registers for GPIOs 0-15
 *
 */
#define GPIO_CTRL_REG(GPNUM) _REG(GPIO0_BASE, 0x28+(GPNUM*4))

#define GPIO_SOURCE_GPIO 0
#define GPIO_SOURCE_DAC BIT(0) /* "Sigma-Delta" */
#define GPIO_SOURCE_MASK BIT(0

#define GPIO_DRIVE_PUSH_PULL 0
#define GPIO_DRIVE_OPEN_DRAIN BIT(2)
#define GPIO_DRIVE_MASK BIT(2)

#define GPIO_INT_NONE 0
#define GPIO_INT_RISING BIT(7)
#define GPIO_INT_FALLING BIT(8)
#define GPIO_INT_CHANGE (BIT(7)|BIT(8))
#define GPIO_INT_LOW BIT(9)
#define GPIO_INT_HIGH (BIT(7)|BIT(9))
#define GPIO_INT_MASK (BIT(7)|BIT(8)|BIT(9))

/* TIMER registers
 *
 * ESP8266 has two hardware(?) timer counters, FRC1 and FRC2.
 *
 * FRC1 is a 24-bit countdown timer, triggers interrupt when reaches zero.
 * FRC2 is a 32-bit countup timer, can set a variable match value to trigger an interrupt.
 *
 * FreeRTOS tick timer appears to come from XTensa core tick timer0,
 * not either of these.  FRC2 is used in the FreeRTOS SDK however. It
 * is set to free-run, interrupting periodically via updates to the
 * MATCH register. sdk_ets_timer_init configures FRC2 and assigns FRC2
 * interrupt handler at sdk_vApplicationTickHook+0x68
 */

/* Load value for FRC1, read/write.

   When TIMER_CTRL_RELOAD is cleared in TIMER_FRC1_CTRL_REG, FRC1 will
   reload to TIMER_FRC1_MAX_LOAD once overflowed (unless the load
   value is rewritten in the interrupt handler.)

   When TIMER_CTRL_RELOAD is set in TIMER_FRC1_CTRL_REG, FRC1 will reload
   from the load register value once overflowed.
*/
#define TIMER_FRC1_LOAD_REG   _REG(TIMER_BASE, 0x00)

#define TIMER_FRC1_MAX_LOAD 0x7fffff

/* Current count value for FRC1, read only? */
#define TIMER_FRC1_COUNT_REG  _REG(TIMER_BASE, 0x04)

/* Control register for FRC1, read/write.

   See the bit definitions TIMER_CTRL_xxx lower down.
 */
#define TIMER_FRC1_CTRL_REG  _REG(TIMER_BASE, 0x08)

/* Reading this register always returns the value in
 * TIMER_FRC1_LOAD_REG.
 *
 * Writing zero to this register clears the FRC1
 * interrupt status.
 */
#define TIMER_FRC1_CLEAR_INT_REG  _REG(TIMER_BASE, 0x0c)

/* FRC2 load register.
 *
 * If TIMER_CTRL_RELOAD is cleared in TIMER_FRC2_CTRL_REG, writing to
 * this register will update the FRC2 COUNT value.
 *
 * If TIMER_CTRL_RELOAD is set in TIMER_FRC2_CTRL_REG, the behaviour
 * appears to be the same except that writing 0 to the load register
 * both sets the COUNT register to 0 and disables the timer, even if
 * the TIMER_CTRL_RUN bit is set.
 *
 * Offsets 0x34, 0x38, 0x3c all seem to read back the LOAD_REG value
 * also (but have no known function.)
 */
#define TIMER_FRC2_LOAD_REG   _REG(TIMER_BASE, 0x20)

/* FRC2 current count value. Read only? */
#define TIMER_FRC2_COUNT_REG _REG(TIMER_BASE, 0x24)

/* Control register for FRC2. Read/write.

   See the bit definitions TIMER_CTRL_xxx lower down.
*/
#define TIMER_FRC2_CTRL_REG  _REG(TIMER_BASE, 0x28)

/* Reading this value returns the current value of
 * TIMER_FRC2_LOAD_REG.
 *
 * Writing zero to this value clears the FRC2 interrupt status.
 */
#define TIMER_FRC2_CLEAR_INT_REG  _REG(TIMER_BASE, 0x2c)

/* Interrupt match value for FRC2. When COUNT == MATCH,
   the interrupt fires.
*/
#define TIMER_FRC2_MATCH_REG _REG(TIMER_BASE, 0x30)

/* Timer control bits to set clock divisor values.

   Divider from master 80MHz APB_CLK (unconfirmed, see esp/clocks.h).
*/
#define TIMER_CTRL_DIV_1  0
#define TIMER_CTRL_DIV_16 BIT(2)
#define TIMER_CTRL_DIV_256 BIT(3)
#define TIMER_CTRL_DIV_MASK (BIT(2)|BIT(3))

/* Set timer control bits to trigger interrupt on "edge" or "level"
 *
 * Observed behaviour is like this:
 *
 *  * When TIMER_CTRL_INT_LEVEL is set, the interrupt status bit
 *    TIMER_CTRL_INT_STATUS remains set when the timer interrupt
 *    triggers, unless manually cleared by writing 0 to
 *    TIMER_FRCx_CLEAR_INT.  While the interrupt status bit stays set
 *    the timer will continue to run normally, but the interrupt
 *    (INUM_TIMER_FRC1 or INUM_TIMER_FRC2) won't trigger again.
 *
 *  * When TIMER_CTRL_INT_EDGE (default) is set, there's no need to
 *    manually write to TIMER_FRCx_CLEAR_INT. The interrupt status bit
 *    TIMER_CTRL_INT_STATUS automatically clears after the interrupt
 *    triggers, and the interrupt handler will run again
 *    automatically.
 *
 */
#define TIMER_CTRL_INT_EDGE 0
#define TIMER_CTRL_INT_LEVEL BIT(0)
#define TIMER_CTRL_INT_MASK BIT(0)

/* Timer auto-reload bit

   This bit interacts with TIMER_FRC1_LOAD_REG & TIMER_FRC2_LOAD_REG
   differently, see those registers for details.
*/
#define TIMER_CTRL_RELOAD BIT(6)

/* Timer run bit */
#define TIMER_CTRL_RUN BIT(7)

/* Read-only timer interrupt status.

   This bit gets set on FRC1 when interrupt fires, and cleared on a
   write to TIMER_FRC1_CLEAR_INT (cleared automatically if
   TIMER_CTRL_INT_LEVEL is not set).
*/
#define TIMER_CTRL_INT_STATUS BIT(8)

/* WDT register(s)

   Not fully understood yet. Writing 0 here disables wdt.

   See ROM functions esp_wdt_xxx
 */
#define WDT_CTRL       _REG(WDT_BASE, 0x00)

/* DPORT registers

   Control various aspects of core/peripheral interaction... Not well
   documented or understood.
*/

/* Set flags to enable CPU interrupts from some peripherals. Read/write.

   bit 0 - Is set by RTOS SDK startup code but function is unknown.
   bit 1 - INT_ENABLE_FRC1 allows TIMER FRC1 to trigger interrupt INUM_TIMER_FRC1.
   bit 2 - INT_ENABLE_FRC2 allows TIMER FRC2 to trigger interrupt INUM_TIMER_FRC2.

   Espressif calls this register "EDGE_INT_ENABLE_REG". The "edge" in
   question is (I think) the interrupt line from the peripheral, as
   the interrupt status bit is set. There may be a similar register
   for enabling "level" interrupts instead of edge triggering
   - this is unknown.
*/
#define DP_INT_ENABLE_REG _REG(DPORT_BASE, 0x04)

/* Set to enable interrupts from TIMER FRC1 */
#define INT_ENABLE_FRC1 BIT(1)
/* Set to enable interrupts interrupts from TIMER FRC2 */
#define INT_ENABLE_FRC2 BIT(2)

#endif

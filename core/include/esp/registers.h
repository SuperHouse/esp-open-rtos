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

typedef volatile uint32_t *esp_reg_t;

/* Internal macro, only defined in header body */
#define _REG(BASE, OFFSET) (*(esp_reg_t)((BASE)+(OFFSET)))

/* Register base addresses

   You shouldn't need to use these directly.
 */
#define MMIO_BASE   0x60000000

#define UART0_BASE (MMIO_BASE + 0)
#define SPI1_BASE  (MMIO_BASE + 0x0100)
#define SPI_BASE   (MMIO_BASE + 0x0200)
#define GPIO0_BASE (MMIO_BASE + 0x0300)
#define TIMER_BASE (MMIO_BASE + 0x0600)
#define RTC_BASE   (MMIO_BASE + 0x0700)
#define IOMUX_BASE (MMIO_BASE + 0x0800)
#define WDT_BASE   (MMIO_BASE + 0x0900)
#define I2C_BASE   (MMIO_BASE + 0x0d00)
#define UART1_BASE (MMIO_BASE + 0x0F00)
#define RTCB_BASE  (MMIO_BASE + 0x1000)
#define RTCS_BASE  (MMIO_BASE + 0x1100)
#define RTCU_BASE  (MMIO_BASE + 0x1200)

/*
 * iomux registers, apply to pin functions.
 *
 * Note that IOMUX register order is _not_ the same as GPIO order. See
 * esp_iomux.h for programmer-friendly IOMUX configuration options
 */
#define IOMUX_REG(X) _REG(IOMUX_BASE,0x04+4*X)

#define IOMUX_OE       BIT(0) /* iomux Output enable bit */
#define IOMUX_OE_SLEEP BIT(1) /* iomux Output during sleep bit */

#define IOMUX_PD       BIT(6) /* iomux soft pulldown bit */
#define IOMUX_PD_SLEEP BIT(2) /* iomux soft pulldown during sleep bit */
#define IOMUX_PU       BIT(7) /* iomux soft pullup bit */
#define IOMUX_PU_SLEEP BIT(3) /* iomux soft pullup during sleep bit */

#define IOMUX_FLAG_WAKE_MASK (IOMUX_OE|IOMUX_PD|IOMUX_PU)
#define IOMUX_FLAG_SLEEP_MASK (IOMUX_OE_SLEEP|IOMUX_PD_SLEEP|IOMUX_PU_SLEEP)
#define IOMUX_FLAG_MASK (IOMUX_FLAG_WAKE_MASK|IOMUX_FLAG_SLEEP_MASK)

#define IOMUX_FUNC_MASK (BIT(4)|BIT(5)|BIT(12))

/* All pins have FUNC_A on reset (unconfirmed) */
#define IOMUX_FUNC_A (0)
#define IOMUX_FUNC_B BIT(4)
#define IOMUX_FUNC_C BIT(5)
#define IOMUX_FUNC_D BIT(4)|BIT(5)
#define IOMUX_FUNC_E BIT(12)


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

/* WDT register(s)

   Not fully understood yet. Writing 0 here disables wdt.

   See ROM functions esp_wdt_xxx
 */
#define WDT_CTRL       _REG(WDT_BASE, 0x00)

#endif

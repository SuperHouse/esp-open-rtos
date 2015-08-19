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
#include "esp/gpio_regs.h"
#include "esp/timer_regs.h"
#include "esp/dport_regs.h"

/* Internal macro, only defined in header body */
#define _REG(BASE, OFFSET) (*(esp_reg_t)((BASE)+(OFFSET)))

/* Register base addresses

   You shouldn't need to use these directly.
 */
#define MMIO_BASE   0x60000000
//#define DPORT_BASE  0x3ff00000

#define UART0_BASE (MMIO_BASE + 0)
#define SPI1_BASE  (MMIO_BASE + 0x0100)
#define SPI_BASE   (MMIO_BASE + 0x0200)
//#define GPIO0_BASE (MMIO_BASE + 0x0300)
//#define TIMER_BASE (MMIO_BASE + 0x0600)
#define RTC_BASE   (MMIO_BASE + 0x0700)
//#define IOMUX_BASE (MMIO_BASE + 0x0800)
#define WDT_BASE   (MMIO_BASE + 0x0900)
#define I2C_BASE   (MMIO_BASE + 0x0d00)
#define UART1_BASE (MMIO_BASE + 0x0F00)
#define RTCB_BASE  (MMIO_BASE + 0x1000)
#define RTCS_BASE  (MMIO_BASE + 0x1100)
#define RTCU_BASE  (MMIO_BASE + 0x1200)

/* WDT register(s)

   Not fully understood yet. Writing 0 here disables wdt.

   See ROM functions esp_wdt_xxx
 */
#define WDT_CTRL       _REG(WDT_BASE, 0x00)

#endif

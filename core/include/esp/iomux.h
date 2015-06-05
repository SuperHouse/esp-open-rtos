/** esp/iomux.h
 *
 * Configuration of iomux registers.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#ifndef _ESP_IOMUX_H
#define _ESP_IOMUX_H
#include <stdint.h>
#include "esp/registers.h"

/**
 * Convert a GPIO pin number to an iomux register index.
 *
 * This function should evaluate to a constant if the gpio_number is
 * known at compile time, or return the result from a lookup table if not.
 *
 */
inline static uint8_t gpio_to_iomux(const uint8_t gpio_number);

/**
 * Convert an iomux register index to a GPIO pin number.
 *
 * This function should evaluate to a constant if the iomux_num is
 * known at compile time, or return the result from a lookup table if not.
 *
 */
inline static uint8_t iomux_to_gpio(const uint8_t iomux_num);

/**
 * Directly get the IOMUX register for a particular gpio number
 *
 * ie *gpio_iomux_reg(3) is equivalent to IOMUX_GP03
 */
inline static esp_reg_t gpio_iomux_reg(const uint8_t gpio_number)
{
    return &IOMUX_REG(gpio_to_iomux(gpio_number));
}

/**
 * Set a pin to the GPIO function.
 *
 * This allows you to set pins to GPIO without knowing in advance the
 * exact register masks to use.
 *
 * flags can be any of IOMUX_OE, IOMUX_PU, IOMUX_PD, etc. Any other flags will be cleared.
 *
 * Equivalent to a direct register operation if gpio_number is known at compile time.
 * ie the following are equivalent:
 *
 * iomux_set_gpio_function(12, IOMUX_OE);
 * IOMUX_GP12 = (IOMUX_GP12 & ~IOMUX_FUNC_MASK) | IOMUX_GP12_GPIO | IOMUX_OE;
 */
inline static void iomux_set_gpio_function(const uint8_t gpio_number, const uint8_t flags)
{
    const uint8_t reg_idx = gpio_to_iomux(gpio_number);
    const esp_reg_t reg = &IOMUX_REG(reg_idx);
    const uint32_t func = (reg_idx > 11 ? IOMUX_FUNC_A : IOMUX_FUNC_D) | flags;
    const uint32_t val = *reg & ~(IOMUX_FUNC_MASK | IOMUX_FLAG_MASK);
    *reg = val | func;
}

/**
 * Set an IOMUX register directly
 *
 * Shortcut for
 * IOMUX_GPxx = (IOMUX_GPxx & ~IOMUX_FUNC_MASK) | IOMUX_GPxx_func
 *
 * instead call
 * IOMUX_SET_FN(GPxx, func);
 * can also do
 * IOMUX_SET_FN(GP12, GPIO)|IOMUX_OE;
 * ... to set the OE flag if it was previously cleared.
 *
 * but a better option is:
 * IOMUX_SET(GP12, GPIO, IOMUX_OE);
 * ...which clears any other flags at the same time.
 */
#define IOMUX_SET_FN(GP,FN) IOMUX_##GP = ((IOMUX_##GP & ~IOMUX_FUNC_MASK) | IOMUX_##GP##_##FN)
#define IOMUX_SET(GP,FN,FLAGS) IOMUX_##GP = ((IOMUX_##GP & ~(IOMUX_FUNC_MASK|IOMUX_FLAG_MASK)) | IOMUX_##GP##_##FN|FLAGS)

/* IOMUX register index 0, GPIO 12 */
#define IOMUX_GP12           IOMUX_REG(0)
#define IOMUX_GP12_MTDI      IOMUX_FUNC_A
#define IOMUX_GP12_I2S_DIN   IOMUX_FUNC_B
#define IOMUX_GP12_HSPI_MISO IOMUX_FUNC_C
#define IOMUX_GP12_GPIO      IOMUX_FUNC_D
#define IOMUX_GP12_UART0_DTR IOMUX_FUNC_E

/* IOMUX register index 1, GPIO 13 */
#define IOMUX_GP13           IOMUX_REG(1)
#define IOMUX_GP13_MTCK      IOMUX_FUNC_A
#define IOMUX_GP13_I2SI_BCK  IOMUX_FUNC_B
#define IOMUX_GP13_HSPI_MOSI IOMUX_FUNC_C
#define IOMUX_GP13_GPIO      IOMUX_FUNC_D
#define IOMUX_GP13_UART0_CTS IOMUX_FUNC_E

/* IOMUX register index 2, GPIO 14 */
#define IOMUX_GP14           IOMUX_REG(2)
#define IOMUX_GP14_MTMS      IOMUX_FUNC_A
#define IOMUX_GP14_I2SI_WS   IOMUX_FUNC_B
#define IOMUX_GP14_HSPI_CLK  IOMUX_FUNC_C
#define IOMUX_GP14_GPIO      IOMUX_FUNC_D
#define IOMUX_GP14_UART0_DSR IOMUX_FUNC_E

/* IOMUX register index 3, GPIO 15 */
#define IOMUX_GP15           IOMUX_REG(3)
#define IOMUX_GP15_MTDO      IOMUX_FUNC_A
#define IOMUX_GP15_I2SO_BCK  IOMUX_FUNC_B
#define IOMUX_GP15_HSPI_CS0  IOMUX_FUNC_C
#define IOMUX_GP15_GPIO      IOMUX_FUNC_D
#define IOMUX_GP15_UART0_RTS IOMUX_FUNC_E

/* IOMUX register index 4, GPIO 3 */
#define IOMUX_GP03           IOMUX_REG(4)
#define IOMUX_GP03_UART0_RX  IOMUX_FUNC_A
#define IOMUX_GP03_I2SO_DATA IOMUX_FUNC_B
#define IOMUX_GP03_GPIO      IOMUX_FUNC_D
#define IOMUX_GP03_CLK_XTAL_BK IOMUX_FUNC_E

/* IOMUX register index 5, GPIO 1 */
#define IOMUX_GP01           IOMUX_REG(5)
#define IOMUX_GP01_UART0_TX  IOMUX_FUNC_A
#define IOMUX_GP01_SPICS1    IOMUX_FUNC_B
#define IOMUX_GP01_GPIO      IOMUX_FUNC_D
#define IOMUX_GP01_CLK_RTC_BK IOMUX_FUNC_E

/* IOMUX register index 6, GPIO 6 */
#define IOMUX_GP06           IOMUX_REG(6)
#define IOMUX_GP06_SD_CLK    IOMUX_FUNC_A
#define IOMUX_GP06_SP_ICLK   IOMUX_FUNC_B
#define IOMUX_GP06_GPIO      IOMUX_FUNC_D
#define IOMUX_GP06_UART1_CTS IOMUX_FUNC_E

/* IOMUX register index 7, GPIO 7 */
#define IOMUX_GP07           IOMUX_REG(7)
#define IOMUX_GP07_SD_DATA0  IOMUX_FUNC_A
#define IOMUX_GP07_SPIQ_MISO IOMUX_FUNC_B
#define IOMUX_GP07_GPIO      IOMUX_FUNC_D
#define IOMUX_GP07_UART1_TX  IOMUX_FUNC_E

/* IOMUX register index 8, GPIO 8 */
#define IOMUX_GP08           IOMUX_REG(8)
#define IOMUX_GP08_SD_DATA1  IOMUX_FUNC_A
#define IOMUX_GP08_SPID_MOSI IOMUX_FUNC_B
#define IOMUX_GP08_GPIO      IOMUX_FUNC_D
#define IOMUX_GP08_UART1_RX  IOMUX_FUNC_E

/* IOMUX register index 9, GPIO 9 */
#define IOMUX_GP09           IOMUX_REG(9)
#define IOMUX_GP09_SD_DATA2  IOMUX_FUNC_A
#define IOMUX_GP09_SPI_HD    IOMUX_FUNC_B
#define IOMUX_GP09_GPIO      IOMUX_FUNC_D
#define IOMUX_GP09_UFNC_HSPIHD IOMUX_FUNC_E

/* IOMUX register index 10, GPIO 10 */
#define IOMUX_GP10           IOMUX_REG(10)
#define IOMUX_GP10_SD_DATA3  IOMUX_FUNC_A
#define IOMUX_GP10_SPI_WP    IOMUX_FUNC_B
#define IOMUX_GP10_GPIO      IOMUX_FUNC_D
#define IOMUX_GP10_HSPIWP    IOMUX_FUNC_E

/* IOMUX register index 11, GPIO 11 */
#define IOMUX_GP11           IOMUX_REG(11)
#define IOMUX_GP11_SD_CMD    IOMUX_FUNC_A
#define IOMUX_GP11_SPI_CS0   IOMUX_FUNC_B
#define IOMUX_GP11_GPIO      IOMUX_FUNC_D
#define IOMUX_GP11_UART1_RTS IOMUX_FUNC_E

/* IOMUX register index 12, GPIO 0 */
#define IOMUX_GP00           IOMUX_REG(12)
#define IOMUX_GP00_GPIO      IOMUX_FUNC_A
#define IOMUX_GP00_SPI_CS2   IOMUX_FUNC_B
#define IOMUX_GP00_CLK_OUT   IOMUX_FUNC_E

/* IOMUX register index 13, GPIO 2 */
#define IOMUX_GP02           IOMUX_REG(13)
#define IOMUX_GP02_GPIO      IOMUX_FUNC_A
#define IOMUX_GP02_I2SO_WS   IOMUX_FUNC_B
#define IOMUX_GP02_UART1_TX  IOMUX_FUNC_C
#define IOMUX_GP02_UART0_TX  IOMUX_FUNC_E

/* IOMUX register index 14, GPIO 4 */
#define IOMUX_GP04           IOMUX_REG(14)
#define IOMUX_GP04_GPIO4     IOMUX_FUNC_A
#define IOMUX_GP04_CLK_XTAL  IOMUX_FUNC_B

/* IOMUX register index 15, GPIO 5 */
#define IOMUX_GP05           IOMUX_REG(15)
#define IOMUX_GP05_GPIO5     IOMUX_FUNC_A
#define IOMUX_GP05_CLK_RTC   IOMUX_FUNC_B

/* esp_iomux_private contains implementation parts of the inline functions
   declared above */
#include "esp/iomux_private.h"

#endif

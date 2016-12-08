/**
 * SSD1306 OLED display driver for esp-open-rtos.
 *
 * Copyright (c) 2016 urx (https://github.com/urx),
 *                    Ruslan V. Uss (https://github.com/UncleRus)
 *
 * MIT Licensed as described in the file LICENSE
 *
 * @todo Scrolling, fonts
 */
#include "ssd1306.h"
#include <stdio.h>
#if (SSD1306_I2C_SUPPORT)
    #include <i2c/i2c.h>
#endif
#if (SSD1306_SPI4_SUPPORT)
    #include <esp/spi.h>
#endif
#include <esp/gpio.h>
#include <FreeRTOS.h>
#include <task.h>

#define SPI_BUS 1

//#define SSD1306_DEBUG

/* SSD1306 commands */
#define SSD1306_SET_MEM_ADDR_MODE    (0x20)

#define SSD1306_SET_COL_ADDR         (0x21)
#define SSD1306_SET_PAGE_ADDR        (0x22)
#define SSD1306_SET_DISP_START_LINE  (0x40)
#define SSD1306_SET_CONTRAST         (0x81)
#define SSD1306_SET_SEGMENT_REMAP0   (0xA0)
#define SSD1306_SET_SEGMENT_REMAP1   (0xA1)
#define SSD1306_SET_ENTIRE_DISP_ON   (0xA5)
#define SSD1306_SET_ENTIRE_DISP_OFF  (0xA4)
#define SSD1306_SET_INVERSION_OFF    (0xA6)
#define SSD1306_SET_INVERSION_ON     (0xA7)

#define SSD1306_SET_MUX_RATIO        (0xA8)
#define SSD1306_MUX_RATIO_MASK       (0x3F)
#define SSD1306_SET_DISPLAY_OFF      (0xAE)
#define SSD1306_SET_DISPLAY_ON       (0xAF)
#define SSD1306_SET_SCAN_DIR_FWD     (0xC0)
#define SSD1306_SET_SCAN_DIR_BWD     (0xC8)
#define SSD1306_SET_DISPLAY_OFFSET   (0xD3)
#define SSD1306_SET_OSC_FREQ         (0xD5)
#define SSD1306_SET_PRE_CHRG_PER     (0xD9)

#define SSD1306_SET_COM_PINS_HW_CFG  (0xDA)
#define SSD1306_COM_PINS_HW_CFG_MASK (0x32)
#define SSD1306_SEQ_COM_PINS_CFG     (0x02)
#define SSD1306_ALT_COM_PINS_CFG     (0x12)
#define SSD1306_COM_LR_REMAP_OFF     (0x02)
#define SSD1306_COM_LR_REMAP_ON      (0x22)

#define SSD1306_SET_DESEL_LVL        (0xDB)
#define SSD1306_SET_NOP              (0xE3)

#define SSD1306_SET_CHARGE_PUMP      (0x8D)
#define SSD1306_CHARGE_PUMP_EN       (0x14)
#define SSD1306_CHARGE_PUMP_DIS      (0x10)

#ifdef SSD1306_DEBUG
#define debug(fmt, ...) printf("%s: " fmt "\n", "SSD1306", ## __VA_ARGS__)
#else
#define debug(fmt, ...)
#endif

/* Issue a command to SSD1306 device
 * I2C proto format:
 * |S|Slave Address|W|ACK|0x00|Command|Ack|P|
 * 
 * in case of two-bytes command here will be Data byte
 * right after the command byte.
 */
int ssd1306_command(const ssd1306_t *dev, uint8_t cmd)
{
    debug("Command: 0x%02x", cmd);
    switch (dev->protocol) {
#if (SSD1306_I2C_SUPPORT)
        case SSD1306_PROTO_I2C:
            i2c_start();
            if (!i2c_write(dev->addr << 1)) {
                debug("Error while xmitting I2C slave address\n");
                i2c_stop();
                return -EIO;
            }
            if (!i2c_write(0x00)) {
                debug("Error while xmitting transmission type\n");
                i2c_stop();
                return -EIO;
            }
            if (!i2c_write(cmd)) {
                debug("Error while xmitting command: 0x%02X\n", cmd);
                i2c_stop();
                return -EIO;
            }
            i2c_stop();
            break;
#endif
#if (SSD1306_SPI4_SUPPORT)
        case SSD1306_PROTO_SPI4:
            gpio_write(dev->dc_pin, false); // command mode
            gpio_write(dev->cs_pin, false);
            spi_transfer_8(SPI_BUS, cmd);
            gpio_write(dev->cs_pin, true);
            break;
#endif
        default:
            debug("Unsupported protocol");
            return -EPROTONOSUPPORT;
    }

    return 0;
}

/* Perform default init routine according
* to SSD1306 datasheet from adafruit.com */
int ssd1306_init(const ssd1306_t *dev)
{
    uint8_t pin_cfg;
    switch (dev->height) {
        case 16:
        case 32:
            pin_cfg = 0x02;
            break;
        case 64:
            pin_cfg = 0x12;
            break;
        default:
            debug("Unsupported screen height");
            return -ENOTSUP;
    }

    switch (dev->protocol) {
#if (SSD1306_I2C_SUPPORT)
        case SSD1306_PROTO_I2C:
            break;
#endif
#if (SSD1306_SPI4_SUPPORT)
        case SSD1306_PROTO_SPI4:
            gpio_enable(dev->cs_pin, GPIO_OUTPUT);
            gpio_write(dev->cs_pin, true);
            gpio_enable(dev->dc_pin, GPIO_OUTPUT);
            spi_init(SPI_BUS, SPI_MODE0, SPI_FREQ_DIV_8M, true, SPI_LITTLE_ENDIAN, true);
            break;
#endif
        default:
            debug("Unsupported protocol");
            return -EPROTONOSUPPORT;
    }

    if (!ssd1306_display_on(dev, false)                                  &&
        !ssd1306_set_osc_freq(dev, 0x80)                                 &&
        !ssd1306_set_mux_ratio(dev, dev->height - 1)                     &&
        !ssd1306_set_display_offset(dev, 0x0)                            &&
        !ssd1306_set_display_start_line(dev, 0x0)                        &&
        !ssd1306_set_charge_pump_enabled(dev, true)                      &&
        !ssd1306_set_mem_addr_mode(dev, SSD1306_ADDR_MODE_HORIZONTAL)    &&
        !ssd1306_set_segment_remapping_enabled(dev, false)               &&
        !ssd1306_set_scan_direction_fwd(dev, true)                       &&
        !ssd1306_set_com_pin_hw_config(dev, pin_cfg)                     &&
        !ssd1306_set_contrast(dev, 0x9f)                                 &&
        !ssd1306_set_precharge_period(dev, 0xf1)                         &&
        !ssd1306_set_deseltct_lvl(dev, 0x40)                             &&
        !ssd1306_set_whole_display_lighting(dev, true)                   &&
        !ssd1306_set_inversion(dev, false)                               &&
        !ssd1306_display_on(dev, true)) {
        return 0;
    }

    return -EIO;
}

int ssd1306_load_frame_buffer(const ssd1306_t *dev, uint8_t buf[])
{
    uint16_t i;
    uint8_t j;

    ssd1306_set_column_addr(dev, 0, dev->width - 1);
    ssd1306_set_page_addr(dev, 0, dev->height / 8 - 1);

    size_t len = dev->width * dev->height / 8;

    switch (dev->protocol) {
#if (SSD1306_I2C_SUPPORT)
        case SSD1306_PROTO_I2C:
            for (i = 0; i < len; i++) {
                i2c_start();
                if (!i2c_write(dev->addr << 1)) {
                    debug("Error while xmitting I2C slave address\n");
                    i2c_stop();
                    return -EIO;
                }
                if (!i2c_write(0x40)) {
                    debug("Error while xmitting transmission type\n");
                    i2c_stop();
                    return -EIO;
                }

                for (j = 0; j < 16; j++) {
                    if (!i2c_write(buf ? buf[i] : 0)) {
                        debug("Error while writing to GDDRAM\n");
                        i2c_stop();
                        return -EIO;
                    }
                    i++;
                }
                i--;
                i2c_stop();
                taskYIELD();
            }
            break;
#endif
#if (SSD1306_SPI4_SUPPORT)
        case SSD1306_PROTO_SPI4:
            gpio_write(dev->dc_pin, true); // data mode
            gpio_write(dev->cs_pin, false);
            if (buf)
                spi_transfer(SPI_BUS, buf, NULL, len, SPI_8BIT);
            else
                for (i = 0; i < len; i ++) {
                    spi_transfer_8(SPI_BUS, 0);
                }
            gpio_write(dev->cs_pin, true);
            break;
#endif
        default:
            debug("Unsupported protocol");
            return -EPROTONOSUPPORT;
    }

    return 0;
}

int ssd1306_display_on(const ssd1306_t *dev, bool on)
{
    return ssd1306_command(dev, on ? SSD1306_SET_DISPLAY_ON : SSD1306_SET_DISPLAY_OFF);
}

int ssd1306_set_display_start_line(const ssd1306_t *dev, uint8_t start)
{
    if (start > 63)
        return -EINVAL;

    return ssd1306_command(dev, SSD1306_SET_DISP_START_LINE | start);
}

int ssd1306_set_display_offset(const ssd1306_t *dev, uint8_t offset)
{
    if (offset > 63)
        return -EINVAL;

    int err = 0;
    if ((err = ssd1306_command(dev, SSD1306_SET_DISPLAY_OFFSET)))
        return err;

    return ssd1306_command(dev, offset);
}

int ssd1306_set_charge_pump_enabled(const ssd1306_t *dev, bool enabled)
{
    int err = 0;
    if ((err = ssd1306_command(dev, SSD1306_SET_CHARGE_PUMP)))
        return err;

    return ssd1306_command(dev, enabled ? SSD1306_CHARGE_PUMP_EN : SSD1306_CHARGE_PUMP_DIS);
}

int ssd1306_set_mem_addr_mode(const ssd1306_t *dev, ssd1306_mem_addr_mode_t mode)
{
    int err = 0;
    if ((err = ssd1306_command(dev, SSD1306_SET_MEM_ADDR_MODE)))
        return err;

    return ssd1306_command(dev, mode);
}

int ssd1306_set_segment_remapping_enabled(const ssd1306_t *dev, bool on)
{
    return ssd1306_command(dev, on ? SSD1306_SET_SEGMENT_REMAP1 : SSD1306_SET_SEGMENT_REMAP0);
}

int ssd1306_set_scan_direction_fwd(const ssd1306_t *dev, bool fwd)
{
    return ssd1306_command(dev, fwd ? SSD1306_SET_SCAN_DIR_FWD : SSD1306_SET_SCAN_DIR_BWD);
}

int ssd1306_set_com_pin_hw_config(const ssd1306_t *dev, uint8_t config)
{
    int err = 0;
    if ((err = ssd1306_command(dev, SSD1306_SET_COM_PINS_HW_CFG)))
        return err;

    return ssd1306_command(dev, config & SSD1306_COM_PINS_HW_CFG_MASK);
}

int ssd1306_set_contrast(const ssd1306_t *dev, uint8_t contrast)
{
    int err = 0;
    if ((err = ssd1306_command(dev, SSD1306_SET_CONTRAST)))
        return err;

    return ssd1306_command(dev, contrast);
}

int ssd1306_set_inversion(const ssd1306_t *dev, bool on)
{
    return ssd1306_command(dev, on ? SSD1306_SET_INVERSION_ON : SSD1306_SET_INVERSION_OFF);
}

int ssd1306_set_osc_freq(const ssd1306_t *dev, uint8_t osc_freq)
{
    int err = 0;
    if ((err = ssd1306_command(dev, SSD1306_SET_OSC_FREQ)))
        return err;

    return ssd1306_command(dev, osc_freq);
}

int ssd1306_set_mux_ratio(const ssd1306_t *dev, uint8_t ratio)
{
    if (ratio < 15 || ratio > 63)
        return -EINVAL;

    int err = 0;
    if ((err = ssd1306_command(dev, SSD1306_SET_MUX_RATIO)))
        return err;

    return ssd1306_command(dev, ratio);
}

int ssd1306_set_column_addr(const ssd1306_t *dev, uint8_t start, uint8_t stop)
{
    int err = 0;
    if ((err = ssd1306_command(dev, SSD1306_SET_COL_ADDR)))
        return err;

    if ((err = ssd1306_command(dev, start)))
        return err;

    return ssd1306_command(dev, stop);
}

int ssd1306_set_page_addr(const ssd1306_t *dev, uint8_t start, uint8_t stop)
{
    int err = 0;
    if ((err = ssd1306_command(dev, SSD1306_SET_PAGE_ADDR)))
        return err;

    if ((err = ssd1306_command(dev, start)))
        return err;

    return ssd1306_command(dev, stop);
}

int ssd1306_set_precharge_period(const ssd1306_t *dev, uint8_t prchrg)
{
    int err = 0;
    if ((err = ssd1306_command(dev, SSD1306_SET_PRE_CHRG_PER)))
        return err;

    return ssd1306_command(dev, prchrg);
}

int ssd1306_set_deseltct_lvl(const ssd1306_t *dev, uint8_t lvl)
{
    int err = 0;
    if ((err = ssd1306_command(dev, SSD1306_SET_DESEL_LVL)))
        return err;

    return ssd1306_command(dev, lvl);
}

int ssd1306_set_whole_display_lighting(const ssd1306_t *dev, bool light)
{
    return ssd1306_command(dev, light ? SSD1306_SET_ENTIRE_DISP_ON :  SSD1306_SET_ENTIRE_DISP_OFF);
}


/* one byte of xbm - 8 dots in line of picture source
 * one byte of fb - 8 rows for 1 column of screen
 */
int ssd1306_load_xbm(const ssd1306_t *dev, uint8_t *xbm, uint8_t *fb)
{
    uint8_t bit = 0;

    int row = 0;
    int column = 0;
    for (row = 0; row < dev->height; row ++) {
        for (column = 0; column < dev->width / 8; column++) {
            uint16_t xbm_offset = row * 16  + column;
            for (bit = 0; bit < 8; bit++) {
                if (*(xbm + xbm_offset) & 1 << bit) {
                    *(fb + dev->width * (row / 8) + column * 8 + bit) |= 1 << row % 8;
                }
            }
        }
    }

    return ssd1306_load_frame_buffer(dev, fb);
}



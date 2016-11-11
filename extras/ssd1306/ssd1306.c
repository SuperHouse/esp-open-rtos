#include <stdio.h>
#include <i2c/i2c.h>
#include <FreeRTOS.h>
#include <task.h>
#include "ssd1306.h"

/* SSD1306 commands */
#define SSD1306_SET_MEM_ADDR_MODE   (0x20)
#define SSD1306_ADDR_MODE_HORIZ     (0x0)
#define SSD1306_ADDR_MODE_VERT      (0x1)
#define SSD1306_ADDR_MODE_PAGE      (0x2)

#define SSD1306_SET_COL_ADDR        (0x21)
#define SSD1306_SET_PAGE_ADDR       (0x22)
#define SSD1306_SET_DISP_START_LINE (0x40)
#define SSD1306_SET_CONTRAST        (0x81)
#define SSD1306_SET_SEGMENT_REMAP0  (0xA0)
#define SSD1306_SET_SEGMENT_REMAP1  (0xA1)
#define SSD1306_SET_ENTIRE_DISP_ON  (0xA5)
#define SSD1306_SET_ENTIRE_DISP_OFF (0xA4)
#define SSD1306_SET_INVERSION_OFF   (0xA6)
#define SSD1306_SET_INVERSION_ON    (0xA7)

#define SSD1306_SET_MUX_RATIO       (0xA8)
#define SSD1306_MUX_RATIO_MASK      (0x3F)
#define SSD1306_SET_DISPLAY_OFF     (0xAE)
#define SSD1306_SET_DISPLAY_ON      (0xAF)
#define SSD1306_SET_SCAN_DIR_FWD    (0xC0)
#define SSD1306_SET_SCAN_DIR_BWD    (0xC8)
#define SSD1306_SET_DISPLAY_OFFSET  (0xD3)
#define SSD1306_SET_OSC_FREQ        (0xD5)
#define SSD1306_SET_PRE_CHRG_PER    (0xD9)

#define SSD1306_SET_COM_PINS_HW_CFG (0xDA)
#define SSD1306_COM_PINS_HW_CFG_MASK    (0x32)
#define SSD1306_SEQ_COM_PINS_CFG    (0x02)
#define SSD1306_ALT_COM_PINS_CFG    (0x12)
#define SSD1306_COM_LR_REMAP_OFF    (0x02)
#define SSD1306_COM_LR_REMAP_ON     (0x22)

#define SSD1306_SET_DESEL_LVL       (0xDB)
#define SSD1306_SET_NOP             (0xE3)

#define SSD1306_SET_CHARGE_PUMP     (0x8D)
#define SSD1306_CHARGE_PUMP_EN      (0x14)
#define SSD1306_CHARGE_PUMP_DIS     (0x10)

#ifdef SSD1306_DEBUG
#define debug(fmt, ...) printf("%s" fmt "\n", "SSD1306", ## __VA_ARGS__);
#else
#define debug(fmt, ...)
#endif

/* Issue a command to SSD1306 device
 * format such follows:
 * |S|Slave Address|W|ACK|0x00|Command|Ack|P|
 * 
 * in case of two-bytes command here will be Data byte
 * right after command byte.
 */
int ssd1306_command(uint8_t cmd)
{
    i2c_start();
    if (!i2c_write(SSD1306_I2C_ADDR << 1)) {
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

    return 0;
}

/* Perform default init routine according
* to SSD1306 datasheet from adafruit.com */
int ssd1306_init()
{
    if (!ssd1306_display_on(false)                                  &&
        !ssd1306_set_osc_freq(0x80)                                 &&
        !ssd1306_set_mux_ratio(SSD1306_ROWS-1)                      &&
        !ssd1306_set_display_offset(0x0)                            &&
        !ssd1306_set_display_start_line(0x0)                        &&
        !ssd1306_set_charge_pump_enabled(true)                      &&
        !ssd1306_set_mem_addr_mode(SSD1306_ADDR_MODE_HORIZ)         &&
        !ssd1306_set_segment_remapping_enabled(false)               &&
        !ssd1306_set_scan_direction_fwd(true)                       &&
        !ssd1306_set_com_pin_hw_config(SSD1306_ALT_COM_PINS_CFG)    &&
        !ssd1306_set_contrast(0x9f)                                 &&
        !ssd1306_set_precharge_period(0xf1)                         &&
        !ssd1306_set_deseltct_lvl(0x40)                             &&
        !ssd1306_set_whole_display_lighting(true)                   &&
        !ssd1306_set_inversion(false)                               &&
        !ssd1306_display_on(true)) {
        return 0;
    }

    return -EIO;
}

/*
    * frame buffer of SSD1306 consists of 8 pages of 128 bits each
    *
*/
int ssd1306_load_frame_buffer(uint8_t buf[], uint16_t len)
{
    uint16_t i;
    uint8_t j;

    ssd1306_set_column_addr(0, 127);
    ssd1306_set_page_addr(0, 7);

    for (i=0; i<len; i++) {
        i2c_start();
        if (!i2c_write(SSD1306_I2C_ADDR << 1)) {
            debug("Error while xmitting I2C slave address\n");
            i2c_stop();
            return -EIO;
        }
        if (!i2c_write(0x40)) {
            debug("Error while xmitting transmission type\n");
            i2c_stop();
            return -EIO;
        }

        for (j=0;j<16;j++) {
            if (!i2c_write(buf[i])) {
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

    return 0;
}

int ssd1306_clear_screen()
{
    uint16_t i = 0;
    uint8_t j = 0;

    ssd1306_set_column_addr(0, 127);
    ssd1306_set_page_addr(0, 7);

    while (i < (SSD1306_ROWS*SSD1306_COLS/8)) {
        i2c_start();
        if (!i2c_write(SSD1306_I2C_ADDR << 1)) {
            debug("Error while xmitting I2C slave address\n");
            i2c_stop();
            return -EIO;
        }
        if (!i2c_write(0x40)) {
            debug("Error while xmitting transmission type\n");
            i2c_stop();
            return -EIO;
        }

        /* write 16 bytes of data and then give resources to another task */
        while (j < 16) {
            if (!i2c_write(0x0)) {
                debug("Error while writing to GDDRAM\n");
                i2c_stop();
                return -EIO;
            }
            i++;
            j++;
        }
        i--;
        j = 0;
        i2c_stop();
        taskYIELD();
    }

    return 0;
}

int ssd1306_display_on(bool on)
{
    if (on)
        return ssd1306_command(SSD1306_SET_DISPLAY_ON);

    return ssd1306_command(SSD1306_SET_DISPLAY_OFF);
}

int ssd1306_set_display_start_line(uint8_t start)
{
    return ssd1306_command(SSD1306_SET_DISP_START_LINE | start);
}

int ssd1306_set_display_offset(uint8_t offset)
{
    int err = 0;
    if ((err = ssd1306_command(SSD1306_SET_DISPLAY_OFFSET)))
        return err;

    return ssd1306_command(offset);
}

int ssd1306_set_charge_pump_enabled(bool enabled)
{
    int err = 0;
    if ((err = ssd1306_command(SSD1306_SET_CHARGE_PUMP)))
        return err;

    if (enabled)
        return ssd1306_command(SSD1306_CHARGE_PUMP_EN);

    return ssd1306_command(SSD1306_CHARGE_PUMP_DIS);
}

int ssd1306_set_mem_addr_mode(uint8_t mode)
{
    if (mode >= 0x3)
        return -EINVAL;

    int err = 0;
    if ((err = ssd1306_command(SSD1306_SET_MEM_ADDR_MODE)))
        return err;

    return ssd1306_command(mode);
}

int ssd1306_set_segment_remapping_enabled(bool on)
{
    if (on)
        return ssd1306_command(SSD1306_SET_SEGMENT_REMAP1);

    return ssd1306_command(SSD1306_SET_SEGMENT_REMAP0);
}

int ssd1306_set_scan_direction_fwd(bool fwd)
{
    if (fwd)
        return ssd1306_command(SSD1306_SET_SCAN_DIR_FWD);

    return ssd1306_command(SSD1306_SET_SCAN_DIR_BWD);
}

int ssd1306_set_com_pin_hw_config(uint8_t config)
{
    int err = 0;
    if ((err = ssd1306_command(SSD1306_SET_COM_PINS_HW_CFG)))
        return err;

    return ssd1306_command(config & SSD1306_COM_PINS_HW_CFG_MASK);
}

int ssd1306_set_contrast(uint8_t contrast)
{
    int err = 0;
    if ((err = ssd1306_command(SSD1306_SET_CONTRAST)))
        return err;

    return ssd1306_command(contrast);
}

int ssd1306_set_inversion(bool on)
{
    if (on)
        return ssd1306_command(SSD1306_SET_INVERSION_ON);

    return ssd1306_command(SSD1306_SET_INVERSION_OFF);
}

int ssd1306_set_osc_freq(uint8_t osc_freq)
{
    int err = 0;
    if ((err = ssd1306_command(SSD1306_SET_OSC_FREQ)))
        return err;

    return ssd1306_command(osc_freq);
}

int ssd1306_set_mux_ratio(uint8_t ratio)
{
    if (ratio < 15)
        return -EINVAL;

    int err = 0;
    if ((err = ssd1306_command(SSD1306_SET_MUX_RATIO)))
        return err;

    return ssd1306_command(ratio);
}

int ssd1306_set_column_addr(uint8_t start, uint8_t stop)
{
    int err = 0;
    if ((err = ssd1306_command(SSD1306_SET_COL_ADDR)))
        return err;

    if ((err = ssd1306_command(start)))
        return err;

    return ssd1306_command(stop);
}

int ssd1306_set_page_addr(uint8_t start, uint8_t stop)
{
    int err = 0;
    if ((err = ssd1306_command(SSD1306_SET_PAGE_ADDR)))
        return err;

    if ((err = ssd1306_command(start)))
        return err;

    return ssd1306_command(stop);
}

int ssd1306_set_precharge_period(uint8_t prchrg)
{
    int err = 0;
    if ((err = ssd1306_command(SSD1306_SET_PRE_CHRG_PER)))
        return err;

    return ssd1306_command(prchrg);
}

int ssd1306_set_deseltct_lvl(uint8_t lvl)
{
    int err = 0;
    if ((err = ssd1306_command(SSD1306_SET_DESEL_LVL)))
        return err;

    return ssd1306_command(lvl);
}

int ssd1306_set_whole_display_lighting(bool light)
{
    if (light)
        return ssd1306_command(SSD1306_SET_ENTIRE_DISP_ON);

    return ssd1306_command(SSD1306_SET_ENTIRE_DISP_OFF);
}


/* one byte of xbm - 8 dots in line of picture source
 * one byte of fb - 8 rows for 1 column of screen
 */
int ssd1306_load_xbm(uint8_t *xbm, uint8_t *fb)
{
    uint8_t bit = 0;

    int row = 0;
    int column = 0;
    for (row = 0; row < SSD1306_ROWS; row ++) {
        for (column = 0; column < SSD1306_COLS/8; column++) {
            uint16_t xbm_offset = row * 16  + column;
            for (bit = 0; bit < 8; bit++) {
                if (*(xbm + xbm_offset) & 1 << bit) {
                    *(fb + SSD1306_COLS*(row/8)+column*8+bit) |= 1 << row%8;
                }
            }
        }
    }

    return ssd1306_load_frame_buffer(fb, SSD1306_ROWS*SSD1306_COLS/8);
}



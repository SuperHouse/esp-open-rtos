/**
 * The MIT License (MIT)
 *
 * Copyright (c) 2016 sheinz (https://github.com/sheinz)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
#include "bmp280.h"
#include "i2c/i2c.h"


#ifdef BMP280_DEBUG
#include <stdio.h>
#define debug(fmt, ...) printf("%s" fmt "\n", "bmp280: ", ## __VA_ARGS__);
#else
#define debug(fmt, ...)
#endif

/**
 * BMP280 registers
 */
#define BMP280_REG_TEMP_XLSB   0xFC /* bits: 7-4 */
#define BMP280_REG_TEMP_LSB    0xFB
#define BMP280_REG_TEMP_MSB    0xFA
#define BMP280_REG_TEMP        (BMP280_REG_TEMP_MSB)
#define BMP280_REG_PRESS_XLSB  0xF9 /* bits: 7-4 */
#define BMP280_REG_PRESS_LSB   0xF8
#define BMP280_REG_PRESS_MSB   0xF7
#define BMP280_REG_PRESSURE    (BMP280_REG_PRESS_MSB)
#define BMP280_REG_CONFIG      0xF5 /* bits: 7-5 t_sb; 4-2 filter; 0 spi3w_en */
#define BMP280_REG_CTRL        0xF4 /* bits: 7-5 osrs_t; 4-2 osrs_p; 1-0 mode */
#define BMP280_REG_STATUS      0xF3 /* bits: 3 measuring; 0 im_update */
#define BMP280_REG_RESET       0xE0
#define BMP280_REG_ID          0xD0
#define BMP280_REG_CALIB       0x88


#define BMP280_CHIP_ID         0x58 /* BMP280 has chip-id 0x58 */
#define BMP280_RESET_VALUE     0xB6

typedef struct __attribute__((packed)) {
    uint16_t dig_T1;
    int16_t  dig_T2;
    int16_t  dig_T3;
    uint16_t dig_P1;
    int16_t  dig_P2;
    int16_t  dig_P3;
    int16_t  dig_P4;
    int16_t  dig_P5;
    int16_t  dig_P6;
    int16_t  dig_P7;
    int16_t  dig_P8;
    int16_t  dig_P9;
} BMP280_Calib;

static BMP280_Calib calib_data;

void bmp280_init_default_params(bmp280_params_t *params)
{
    params->mode = BMP280_MODE_NORMAL;
    params->filter = BMP280_FILTER_OFF;
    params->oversampling = BMP280_STANDARD;
    params->standby = BMP280_STANDBY_250;
}

static uint8_t read_register8(uint8_t addr)
{
    uint8_t r = 0;
    if (!i2c_slave_read(BMP280_ADDRESS, addr, &r, 1)) {
        r = 0;
    }
    return r;
}

/**
 * Even though value is signed the actual value is always positive.
 * So, no need to take care of sign bit.
 */
static bool read_register24(uint8_t addr, int32_t *value)
{
    uint8_t d[] = {0, 0, 0};
    if (i2c_slave_read(BMP280_ADDRESS, addr, d, sizeof(d))) {
        *value = d[0];
        *value <<= 8;
        *value |= d[1];
        *value <<= 4;
        *value |= d[2]>>4;
        return true;
    }
    return false;
}

static bool check_chip_id()
{
    return (read_register8(BMP280_REG_ID)==BMP280_CHIP_ID);
}

static bool read_calibration_data()
{
    if (!i2c_slave_read(BMP280_ADDRESS, BMP280_REG_CALIB,
                (uint8_t*)&calib_data, sizeof(calib_data))) {
        return false;
    }
    debug("Calibration data received:");
    debug("dig_T1=%d", calib_data.dig_T1);
    debug("dig_T2=%d", calib_data.dig_T2);
    debug("dig_T3=%d", calib_data.dig_T3);
    debug("dig_P1=%d", calib_data.dig_P1);
    debug("dig_P2=%d", calib_data.dig_P2);
    debug("dig_P3=%d", calib_data.dig_P3);
    debug("dig_P4=%d", calib_data.dig_P4);
    debug("dig_P5=%d", calib_data.dig_P5);
    debug("dig_P6=%d", calib_data.dig_P6);
    debug("dig_P7=%d", calib_data.dig_P7);
    debug("dig_P8=%d", calib_data.dig_P8);
    debug("dig_P9=%d", calib_data.dig_P9);
    return true;
}

static bool write_register8(uint8_t addr, uint8_t value)
{
    uint8_t d[] = {addr, value};

    return i2c_slave_write(BMP280_ADDRESS, d, 2);
}

bool bmp280_init(bmp280_params_t *params, uint8_t scl_pin, uint8_t sda_pin)
{
    i2c_init(scl_pin, sda_pin);
    if (!check_chip_id()) {
        debug("Sensor not found or wrong sensor version");
        return false;
    }

    if (!read_calibration_data()) {
        debug("Failed to read calibration data");
        return false;
    }

    uint8_t config = (params->standby << 5) | (params->filter << 2);
    debug("Writing config reg=%x", config);
    if (!write_register8(BMP280_REG_CONFIG, config)) {
        debug("Failed configuring sensor");
        return false;
    }

    uint8_t oversampling_temp =
        (params->oversampling == BMP280_ULTRA_HIGH_RES) ? 2 : 1;

    if (params->mode == BMP280_MODE_FORCED) {
        params->mode = BMP280_MODE_SLEEP;  // initial mode for forced is sleep
    }

    uint8_t ctrl = (oversampling_temp << 5) | (params->oversampling << 2)
        | (params->mode);

    debug("Writing ctrl reg=%x", ctrl);
    if (!write_register8(BMP280_REG_CTRL, ctrl)) {
        debug("Failed controlling sensor");
        return false;
    }
    return true;
}

bool bmp280_force_measurement()
{
    uint8_t ctrl = read_register8(BMP280_REG_CTRL);
    ctrl &= ~0b11;  // clear two lower bits
    ctrl |= BMP280_MODE_FORCED;
    debug("Writing ctrl reg=%x", ctrl);
    if (!write_register8(BMP280_REG_CTRL, ctrl)) {
        debug("Failed starting forced mode");
        return false;
    }
    return true;
}

bool bmp280_is_measuring()
{
    uint8_t status = read_register8(BMP280_REG_STATUS);
    if (status & (1<<3)) {
        debug("Status: measuring");
        return true;
    }
    debug("Status: idle");
    return false;
}

/**
 * Compensation algorithm is taken from BMP280 datasheet.
 *
 * Return value is in degrees Celsius.
 */
static inline float compensate_temperature(int32_t raw_temp, int32_t *fine_temp)
{
    int32_t var1, var2, T;

    var1 = ((((raw_temp>>3) - ((int32_t)calib_data.dig_T1<<1)))
            * ((int32_t)calib_data.dig_T2)) >> 11;

    var2 = (((((raw_temp>>4) - ((int32_t)calib_data.dig_T1))
                    * ((raw_temp>>4) - ((int32_t)calib_data.dig_T1))) >> 12)
            * ((int32_t)calib_data.dig_T3)) >> 14;

    *fine_temp = var1 + var2;
    T = (*fine_temp * 5 + 128) >> 8;
    return (float)T/100;
}

/**
 * Compensation algorithm is taken from BMP280 datasheet.
 *
 * Return value is in Pa.
 */
static inline float compensate_pressure(int32_t raw_press, int32_t fine_temp)
{
    int64_t var1, var2, p;

    var1 = ((int64_t)fine_temp) - 128000;
    var2 = var1 * var1 * (int64_t)calib_data.dig_P6;
    var2 = var2 + ((var1*(int64_t)calib_data.dig_P5)<<17);
    var2 = var2 + (((int64_t)calib_data.dig_P4)<<35);
    var1 = ((var1 * var1 * (int64_t)calib_data.dig_P3)>>8) +
        ((var1 * (int64_t)calib_data.dig_P2)<<12);
    var1 = (((((int64_t)1)<<47)+var1))*((int64_t)calib_data.dig_P1)>>33;

    if (var1 == 0) {
        return 0;  // avoid exception caused by division by zero
    }

    p = 1048576 - raw_press;
    p = (((p<<31) - var2)*3125) / var1;
    var1 = (((int64_t)calib_data.dig_P9) * (p>>13) * (p>>13)) >> 25;
    var2 = (((int64_t)calib_data.dig_P8) * p) >> 19;

    p = ((p + var1 + var2) >> 8) + (((int64_t)calib_data.dig_P7)<<4);
    return (float)p/256;
}

bool bmp280_read(float *temperature, float *pressure)
{
    int32_t raw_pressure;
    int32_t raw_temp;
    int32_t fine_temp;

    if (!read_register24(BMP280_REG_TEMP, &raw_temp)) {
        debug("Failed reading temperature");
        return false;
    }

    if (!read_register24(BMP280_REG_PRESSURE, &raw_pressure)) {
        debug("Failed reading pressure");
        return false;
    }

    debug("Raw temperature: %d", raw_temp);
    debug("Raw pressure: %d", raw_pressure);

    *temperature = compensate_temperature(raw_temp, &fine_temp);
    *pressure = compensate_pressure(raw_pressure, fine_temp);

    return true;
}

bool bmp280_soft_reset()
{
    if (!write_register8(BMP280_REG_RESET, BMP280_RESET_VALUE)) {
        debug("Failed resetting sensor");
        return false;
    }
    return true;
}

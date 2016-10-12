/*
 * Driver for 3-axis digital compass HMC5883L
 *
 * Part of esp-open-rtos
 * Copyright (C) 2016 Ruslan V. Uss <unclerus@gmail.com>
 * BSD Licensed as described in the file LICENSE
 */
#include "hmc5883l.h"
#include <i2c/i2c.h>
#include <espressif/esp_common.h>

#define ADDR 0x1e

#define REG_CR_A 0x00
#define REG_CR_B 0x01
#define REG_MODE 0x02
#define REG_DX_H 0x03
#define REG_DX_L 0x04
#define REG_DZ_H 0x05
#define REG_DZ_L 0x06
#define REG_DY_H 0x07
#define REG_DY_L 0x08
#define REG_STAT 0x09
#define REG_ID_A 0x0a
#define REG_ID_B 0x0b
#define REG_ID_C 0x0c

#define BIT_MA  5
#define BIT_DO  2
#define BIT_GN  5

#define MASK_MD 0x03
#define MASK_MA 0x60
#define MASK_DO 0x1c
#define MASK_MS 0x03
#define MASK_DR 0x01
#define MASK_DL 0x02

#define MEASUREMENT_TIMEOUT 6000

static const float gain_values [] = {
    [HMC5883L_GAIN_1370] = 0.73,
    [HMC5883L_GAIN_1090] = 0.92,
    [HMC5883L_GAIN_820]  = 1.22,
    [HMC5883L_GAIN_660]  = 1.52,
    [HMC5883L_GAIN_440]  = 2.27,
    [HMC5883L_GAIN_390]  = 2.56,
    [HMC5883L_GAIN_330]  = 3.03,
    [HMC5883L_GAIN_230]  = 4.35
};

static float current_gain;
static hmc5883l_operating_mode_t current_mode;

static inline void write_register(uint8_t reg, uint8_t val)
{
    uint8_t buf[2] = { reg, val };
    i2c_slave_write(ADDR, buf, 2);
}

static inline uint8_t read_register(uint8_t reg)
{
    uint8_t res;
    i2c_slave_read(ADDR, reg, &res, 1);
    return res;
}

static inline void update_register(uint8_t reg, uint8_t mask, uint8_t val)
{
    write_register(reg, (read_register(reg) & mask) | val);
}

bool hmc5883l_init()
{
    if (hmc5883l_get_id() != HMC5883L_ID)
        return false;
    current_gain = gain_values[hmc5883l_get_gain()];
    current_mode = hmc5883l_get_operating_mode();
    return true;
}

uint32_t hmc5883l_get_id()
{
    uint32_t res = 0;
    i2c_slave_read(ADDR, REG_ID_A, (uint8_t *)&res, 3);
    return res;
}

hmc5883l_operating_mode_t hmc5883l_get_operating_mode()
{
    uint8_t res = read_register(REG_MODE) & MASK_MD;
    return res == 0 ? HMC5883L_MODE_CONTINUOUS : HMC5883L_MODE_SINGLE;
}

void hmc5883l_set_operating_mode(hmc5883l_operating_mode_t mode)
{
    write_register(REG_MODE, mode);
    current_mode = mode;
}

hmc5883l_samples_averaged_t hmc5883l_get_samples_averaged()
{
    return (read_register(REG_CR_A) & MASK_MA) >> BIT_MA;
}

void hmc5883l_set_samples_averaged(hmc5883l_samples_averaged_t samples)
{
    update_register(REG_CR_A, MASK_MA, samples << BIT_MA);
}

hmc5883l_data_rate_t hmc5883l_get_data_rate()
{
    return (read_register(REG_CR_A) & MASK_DO) >> BIT_DO;
}

void hmc5883l_set_data_rate(hmc5883l_data_rate_t rate)
{
    update_register(REG_CR_A, MASK_DO, rate << BIT_DO);
}

hmc5883l_bias_t hmc5883l_get_bias()
{
    return read_register(REG_CR_A) & MASK_MS;
}

void hmc5883l_set_bias(hmc5883l_bias_t bias)
{
    update_register(REG_CR_A, MASK_MS, bias);
}

hmc5883l_gain_t hmc5883l_get_gain()
{
    return read_register(REG_CR_B) >> BIT_GN;
}

void hmc5883l_set_gain(hmc5883l_gain_t gain)
{
    write_register(REG_CR_B, gain << BIT_GN);
    current_gain = gain_values[gain];
}

bool hmc5883l_data_is_locked()
{
    return read_register(REG_STAT) & MASK_DL;
}

bool hmc5883l_data_is_ready()
{
    return read_register(REG_STAT) & MASK_DR;
}

bool hmc5883l_get_raw_data(hmc5883l_raw_data_t *data)
{
    if (current_mode == HMC5883L_MODE_SINGLE)
    {
        // overwrite mode register for measurement
        hmc5883l_set_operating_mode(current_mode);
        // wait for data
        uint32_t timeout = sdk_system_get_time() + MEASUREMENT_TIMEOUT;
        while (!hmc5883l_data_is_ready())
        {
            if (sdk_system_get_time() >= timeout)
                return false;
        }
    }
    uint8_t buf[6];
    i2c_slave_read(ADDR, REG_DX_H, buf, 6);
    data->x = ((int16_t)buf[REG_DX_H - REG_DX_H] << 8) | buf[REG_DX_L - REG_DX_H];
    data->y = ((int16_t)buf[REG_DY_H - REG_DX_H] << 8) | buf[REG_DY_L - REG_DX_H];
    data->z = ((int16_t)buf[REG_DZ_H - REG_DX_H] << 8) | buf[REG_DZ_L - REG_DX_H];
    return true;
}

void hmc5883l_raw_to_mg(const hmc5883l_raw_data_t *raw, hmc5883l_data_t *mg)
{
    mg->x = raw->x * current_gain;
    mg->y = raw->y * current_gain;
    mg->z = raw->z * current_gain;
}

bool hmc5883l_get_data(hmc5883l_data_t *data)
{
    hmc5883l_raw_data_t raw;

    if (!hmc5883l_get_raw_data(&raw))
        return false;
    hmc5883l_raw_to_mg(&raw, data);
    return true;
}

/*
 * Driver for ADS1113/ADS1114/ADS1115 I2C ADC
 *
 * Part of esp-open-rtos
 * Copyright (C) 2016 Ruslan V. Uss <unclerus@gmail.com>
 * BSD Licensed as described in the file LICENSE
 */
#include "ads111x.h"
#include <i2c/i2c.h>

#define ADS111X_DEBUG

#ifdef ADS111X_DEBUG
#include <stdio.h>
#define debug(fmt, ...) printf("%s" fmt "\n", "ADS111x: ", ## __VA_ARGS__)
#else
#define debug(fmt, ...)
#endif

#define REG_CONVERSION 0
#define REG_CONFIG     1
#define REG_THRESH_L   2
#define REG_THRESH_H   3

#define COMP_QUE_OFFSET  1
#define COMP_QUE_MASK    0x03
#define COMP_LAT_OFFSET  2
#define COMP_LAT_MASK    0x01
#define COMP_POL_OFFSET  3
#define COMP_POL_MASK    0x01
#define COMP_MODE_OFFSET 4
#define COMP_MODE_MASK   0x01
#define DR_OFFSET        5
#define DR_MASK          0x07
#define MODE_OFFSET      8
#define MODE_MASK        0x01
#define PGA_OFFSET       9
#define PGA_MASK         0x07
#define MUX_OFFSET       12
#define MUX_MASK         0x07
#define OS_OFFSET        15
#define OS_MASK          0x01

const float ads111x_gain_values[] = {
    [ADS111X_GAIN_6V144]   = 6.144,
    [ADS111X_GAIN_4V096]   = 4.096,
    [ADS111X_GAIN_2V048]   = 2.048,
    [ADS111X_GAIN_1V024]   = 1.024,
    [ADS111X_GAIN_0V512]   = 0.512,
    [ADS111X_GAIN_0V256]   = 0.256,
    [ADS111X_GAIN_0V256_2] = 0.256,
    [ADS111X_GAIN_0V256_3] = 0.256
};

static uint16_t read_reg(uint8_t addr, uint8_t reg)
{
    uint16_t res = 0;
    if (!i2c_slave_read(addr, reg, (uint8_t *)&res, 2))
        debug("Could not read register %d", reg);
    //debug("Read %d: 0x%04x", reg, res);
    return res;
}

static void write_reg(uint8_t addr, uint8_t reg, uint16_t val)
{
    //debug("Write %d: 0x%04x", reg, val);
    uint8_t buf[3] = {reg, val >> 8, val};
    if (!i2c_slave_write(addr, buf, 3))
        debug("Could not write 0x%04x to register %d", val, reg);
}

static uint16_t read_conf_bits(uint8_t addr, uint8_t offs, uint16_t mask)
{
    return (read_reg(addr, REG_CONFIG) >> offs) & mask;
}

static void write_conf_bits(uint8_t addr, uint16_t val, uint8_t offs, uint16_t mask)
{
    write_reg(addr, REG_CONFIG, (read_reg(addr, REG_CONFIG) & ~(mask << offs)) | (val << offs));
}

bool ads111x_busy(uint8_t addr)
{
    return read_conf_bits(addr, OS_OFFSET, OS_MASK);
}

void ads111x_start_conversion(uint8_t addr)
{
    write_conf_bits(addr, 1, OS_OFFSET, OS_MASK);
}

int16_t ads111x_get_value(uint8_t addr)
{
    return read_reg(addr, REG_CONVERSION);
}

ads111x_gain_t ads111x_get_gain(uint8_t addr)
{
    return read_conf_bits(addr, PGA_OFFSET, PGA_MASK);
}

void ads111x_set_gain(uint8_t addr, ads111x_gain_t gain)
{
    write_conf_bits(addr, gain, PGA_OFFSET, PGA_MASK);
}

ads111x_mux_t ads111x_get_input_mux(uint8_t addr)
{
    return read_conf_bits(addr, MUX_OFFSET, MUX_MASK);
}

void ads111x_set_input_mux(uint8_t addr, ads111x_mux_t mux)
{
    write_conf_bits(addr, mux, MUX_OFFSET, MUX_MASK);
}

ads111x_mode_t ads111x_get_mode(uint8_t addr)
{
    return read_conf_bits(addr, MODE_OFFSET, MODE_MASK);
}

void ads111x_set_mode(uint8_t addr, ads111x_mode_t mode)
{
    write_conf_bits(addr, mode, MODE_OFFSET, MODE_MASK);
}

ads111x_data_rate_t ads111x_get_data_rate(uint8_t addr)
{
    return read_conf_bits(addr, DR_OFFSET, DR_MASK);
}

void ads111x_set_data_rate(uint8_t addr, ads111x_data_rate_t rate)
{
    write_conf_bits(addr, rate, DR_OFFSET, DR_MASK);
}

ads111x_comp_mode_t ads111x_get_comp_mode(uint8_t addr)
{
    return read_conf_bits(addr, COMP_MODE_OFFSET, COMP_MODE_MASK);
}

void ads111x_set_comp_mode(uint8_t addr, ads111x_comp_mode_t mode)
{
    write_conf_bits(addr, mode, COMP_MODE_OFFSET, COMP_MODE_MASK);
}

ads111x_comp_polarity_t ads111x_get_comp_polarity(uint8_t addr)
{
    return read_conf_bits(addr, COMP_POL_OFFSET, COMP_POL_MASK);
}

void ads111x_set_comp_polarity(uint8_t addr, ads111x_comp_polarity_t polarity)
{
    write_conf_bits(addr, polarity, COMP_POL_OFFSET, COMP_POL_MASK);
}

ads111x_comp_latch_t ads111x_get_comp_latch(uint8_t addr)
{
    return read_conf_bits(addr, COMP_LAT_OFFSET, COMP_LAT_MASK);
}

void ads111x_set_comp_latch(uint8_t addr, ads111x_comp_latch_t latch)
{
    write_conf_bits(addr, latch, COMP_LAT_OFFSET, COMP_LAT_MASK);
}

ads111x_comp_queue_t ads111x_get_comp_queue(uint8_t addr)
{
    return read_conf_bits(addr, COMP_QUE_OFFSET, COMP_QUE_MASK);
}

void ads111x_set_comp_queue(uint8_t addr, ads111x_comp_queue_t queue)
{
    write_conf_bits(addr, queue, COMP_QUE_OFFSET, COMP_QUE_MASK);
}

int16_t ads111x_get_comp_low_thresh(uint8_t addr)
{
    return read_reg(addr, REG_THRESH_L);
}

void ads111x_set_comp_low_thresh(uint8_t addr, int16_t thresh)
{
    write_reg(addr, REG_THRESH_L, thresh);
}

int16_t ads111x_get_comp_high_thresh(uint8_t addr)
{
    return read_reg(addr, REG_THRESH_H);
}

void ads111x_set_comp_high_thresh(uint8_t addr, int16_t thresh)
{
    write_reg(addr, REG_THRESH_H, thresh);
}

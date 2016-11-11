/*
 * Driver for DS1307 RTC
 *
 * Part of esp-open-rtos
 * Copyright (C) 2016 Ruslan V. Uss <unclerus@gmail.com>
 * BSD Licensed as described in the file LICENSE
 */
#include "ds1307.h"
#include <i2c/i2c.h>
#include <stdio.h>

#define ADDR 0x68
#define RAM_SIZE 56

#define TIME_REG    0
#define CONTROL_REG 7
#define RAM_REG     8

#define CH_BIT      (1 << 7)
#define HOUR12_BIT  (1 << 6)
#define PM_BIT      (1 << 5)
#define SQWE_BIT    (1 << 4)
#define OUT_BIT     (1 << 7)

#define CH_MASK      0x7f
#define SECONDS_MASK 0x7f
#define HOUR12_MASK  0x1f
#define HOUR24_MASK  0x3f
#define SQWEF_MASK   0x03
#define SQWE_MASK    0xef
#define OUT_MASK     0x7f

static uint8_t bcd2dec(uint8_t val)
{
    return (val >> 4) * 10 + (val & 0x0f);
}

static uint8_t dec2bcd(uint8_t val)
{
    return ((val / 10) << 4) + (val % 10);
}

static uint8_t read_register(uint8_t reg)
{
    uint8_t val;
    i2c_slave_read(ADDR, reg, &val, 1);
    return val;
}

static void update_register(uint8_t reg, uint8_t mask, uint8_t val)
{
    uint8_t buf[2];

    buf[0] = reg;
    buf[1] = (read_register(reg) & mask) | val;

    i2c_slave_write(ADDR, buf, 2);
}

void ds1307_start(bool start)
{
    update_register(TIME_REG, CH_MASK, start ? 0 : CH_BIT);
}

bool ds1307_is_running()
{
    return !(read_register(TIME_REG) & CH_BIT);
}

void ds1307_get_time(struct tm *time)
{
    uint8_t buf[7];

    i2c_slave_read(ADDR, TIME_REG, buf, 7);

    time->tm_sec = bcd2dec(buf[0] & SECONDS_MASK);
    time->tm_min = bcd2dec(buf[1]);
    if (buf[2] & HOUR12_BIT)
    {
        // RTC in 12-hour mode
        time->tm_hour = bcd2dec(buf[2] & HOUR12_MASK) - 1;
        if (buf[2] & PM_BIT)
            time->tm_hour += 12;
    }
    else time->tm_hour = bcd2dec(buf[2] & HOUR24_MASK);
    time->tm_wday = bcd2dec(buf[3]) - 1;
    time->tm_mday = bcd2dec(buf[4]);
    time->tm_mon  = bcd2dec(buf[5]) - 1;
    time->tm_year = bcd2dec(buf[6]) + 2000;
}

void ds1307_set_time(const struct tm *time)
{
    uint8_t buf[8];
    buf[0] = TIME_REG;
    buf[1] = dec2bcd(time->tm_sec);
    buf[2] = dec2bcd(time->tm_min);
    buf[3] = dec2bcd(time->tm_hour);
    buf[4] = dec2bcd(time->tm_wday + 1);
    buf[5] = dec2bcd(time->tm_mday);
    buf[6] = dec2bcd(time->tm_mon + 1);
    buf[7] = dec2bcd(time->tm_year - 2000);

    i2c_slave_write(ADDR, buf, 8);
}

void ds1307_enable_squarewave(bool enable)
{
    update_register(CONTROL_REG, SQWE_MASK, enable ? SQWE_BIT : 0);
}

bool ds1307_is_squarewave_enabled()
{
    return read_register(CONTROL_REG) & SQWE_BIT;
}

void ds1307_set_squarewave_freq(ds1307_squarewave_freq_t freq)
{
    update_register(CONTROL_REG, SQWEF_MASK, (uint8_t)freq);
}

ds1307_squarewave_freq_t ds1307_get_squarewave_freq()
{
    return (ds1307_squarewave_freq_t)(read_register(CONTROL_REG) & SQWEF_MASK);
}

bool ds1307_get_output()
{
    return read_register(CONTROL_REG) & OUT_BIT;
}

void ds1307_set_output(bool value)
{
    update_register(CONTROL_REG, OUT_MASK, value ? OUT_BIT : 0);
}

bool ds1307_read_ram(uint8_t offset, uint8_t *buf, uint8_t len)
{
    if (offset + len > RAM_SIZE) return false;

    return i2c_slave_read(ADDR, RAM_REG + offset, buf, len);
}

bool ds1307_write_ram(uint8_t offset, uint8_t *buf, uint8_t len)
{
    if (offset + len > RAM_SIZE) return false;

    // temporary buffer on the stack is not good so copy-paste :(
    bool success = false;
    do {
        i2c_start();
        if (!i2c_write(ADDR << 1))
            break;
        if (!i2c_write(RAM_REG + offset))
            break;
        while (len--) {
            if (!i2c_write(*buf++))
                break;
        }
        i2c_stop();
        success = true;
    } while(0);
    return success;
}

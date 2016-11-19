/*
 * Driver for 12-bit DAC MCP4725
 *
 * Part of esp-open-rtos
 * Copyright (C) 2016 Ruslan V. Uss <unclerus@gmail.com>
 * BSD Licensed as described in the file LICENSE
 */
#include "mcp4725.h"
#include <i2c/i2c.h>

#define CMD_DAC    0x40
#define CMD_EEPROM 0x60
#define BIT_READY  0x80

static void read_data(uint8_t addr, uint8_t *buf, uint8_t size)
{
    i2c_start();
    i2c_write(addr << 1 | 1);
    while (size--)
        *(buf++) = i2c_read(!size);
    i2c_stop();
}

bool mcp4725_eeprom_busy(uint8_t addr)
{
    uint8_t res;
    read_data(addr, &res, 1);

    return !(res & BIT_READY);
}

mcp4725_power_mode_t mcp4725_get_power_mode(uint8_t addr, bool eeprom)
{
    uint8_t buf[4];
    read_data(addr, buf, eeprom ? 4 : 1);

    return (eeprom ? buf[3] >> 5 : buf[0] >> 1) & 0x03;
}

void mcp4725_set_power_mode(uint8_t addr, mcp4725_power_mode_t mode, bool eeprom)
{
    uint16_t value = mcp4725_get_raw_output(addr, eeprom);
    uint8_t data[] = {
        (eeprom ? CMD_EEPROM : CMD_DAC) | ((uint8_t)mode << 1),
        value >> 4,
        value << 4
    };
    i2c_slave_write(addr, data, 3);
}

uint16_t mcp4725_get_raw_output(uint8_t addr, bool eeprom)
{
    uint8_t buf[5];
    read_data(addr, buf, eeprom ? 5 : 3);

    return eeprom
        ? ((uint16_t)(buf[3] & 0x0f) << 8) | buf[4]
        : ((uint16_t)buf[0] << 4) | (buf[1] >> 4);
}

void mcp4725_set_raw_output(uint8_t addr, uint16_t value, bool eeprom)
{
    uint8_t data[] = {
        (eeprom ? CMD_EEPROM : CMD_DAC),
        value >> 4,
        value << 4
    };
    i2c_slave_write(addr, data, 3);
}



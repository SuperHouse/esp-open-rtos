/*
 * Driver for BH1750 light sensor
 *
 * Part of esp-open-rtos
 * Copyright (C) 2017 Andrej Krutak <dev@andree.sk>
 * BSD Licensed as described in the file LICENSE
 */
#include "bh1750.h"
#include <i2c/i2c.h>
#include <stdio.h>

void bh1750_configure(uint8_t addr, uint8_t mode)
{
	i2c_slave_write(addr, NULL, &mode, 1);
}

uint16_t bh1750_read(uint8_t addr)
{
	uint8_t buf[2];
	uint16_t level;

	i2c_slave_read(addr, NULL, buf, 2);

	level = buf[0] << 8 | buf[1];
	level = (level * 10) / 12; // convert to LUX

	return level;
}

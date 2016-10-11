/*
 * Part of esp-open-rtos
 * Copyright (C) 2016 Brian Schwind (https://github.com/bschwind)
 * BSD Licensed as described in the file LICENSE
 */

#ifndef __TSL2561_H__
#define __TSL2561_H__

#include <stdint.h>
#include <stdbool.h>

// I2C Addresses
#define TSL2561_I2C_ADDR_VCC 0x49
#define TSL2561_I2C_ADDR_GND 0x29
#define TSL2561_I2C_ADDR_FLOAT 0x39 // Default

// Integration time IDs
#define TSL2561_INTEGRATION_13MS 0x00
#define TSL2561_INTEGRATION_101MS 0x01
#define TSL2561_INTEGRATION_402MS 0x02 // Default

// Gain IDs
#define TSL2561_GAIN_1X 0x00
#define TSL2561_GAIN_16X 0x10

typedef struct {
    uint8_t i2c_addr;
    uint8_t integration_time;
    uint8_t gain;
    uint8_t package_type;
} tsl2561_t;

void tsl2561_init(tsl2561_t *device);
void tsl2561_set_integration_time(tsl2561_t *device, uint8_t integration_time_id);
void tsl2561_set_gain(tsl2561_t *device, uint8_t gain);
bool tsl2561_read_lux(tsl2561_t *device, uint32_t *lux);

#endif  // __TSL2561_H__

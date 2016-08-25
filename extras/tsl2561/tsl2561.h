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

// Registers
#define TSL2561_REG_COMMAND 0x80
#define TSL2561_REG_CONTROL 0x00
#define TSL2561_REG_TIMING 0x01
#define TSL2561_REG_THRESHOLD_LOW_0 0x02
#define TSL2561_REG_THRESHOLD_LOW_1 0x03
#define TSL2561_REG_THRESHOLD_HIGH_0 0x04
#define TSL2561_REG_THRESHOLD_HIGH_1 0x05
#define TSL2561_REG_INTERRUPT 0x06
#define TSL2561_REG_PART_ID 0x0A
#define TSL2561_REG_CHANNEL_0_LOW 0x0C
#define TSL2561_REG_CHANNEL_0_HIGH 0x0D
#define TSL2561_REG_CHANNEL_1_LOW 0x0E
#define TSL2561_REG_CHANNEL_1_HIGH 0x0F

// TSL2561 Misc Values
#define TSL2561_ON 0x03
#define TSL2561_OFF 0x00
#define TSL2561_READ_WORD 0x20

// Integration time IDs
#define TSL2561_INTEGRATION_13MS 0x00
#define TSL2561_INTEGRATION_101MS 0x01
#define TSL2561_INTEGRATION_402MS 0x02 // Default

// Integration times in milliseconds
#define TSL2561_INTEGRATION_TIME_13MS 20
#define TSL2561_INTEGRATION_TIME_101MS 110
#define TSL2561_INTEGRATION_TIME_402MS 410 // Default

// Gain IDs
#define TSL2561_GAIN_1X 0x00
#define TSL2561_GAIN_16X 0x10

// Calculation constants
#define LUX_SCALE 14
#define RATIO_SCALE 9
#define CH_SCALE 10
#define CHSCALE_TINT0 0x7517
#define CHSCALE_TINT1 0x0fe7

// Package constants
#define TSL2561_PACKAGE_CS 0x00
#define TSL2561_PACKAGE_T_FN_CL 0x01

// Constants from the TSL2561 data sheet
#define K1T 0x0040 // 0.125 * 2^RATIO_SCALE
#define B1T 0x01f2 // 0.0304 * 2^LUX_SCALE
#define M1T 0x01be // 0.0272 * 2^LUX_SCALE
#define K2T 0x0080 // 0.250 * 2^RATIO_SCALE
#define B2T 0x0214 // 0.0325 * 2^LUX_SCALE
#define M2T 0x02d1 // 0.0440 * 2^LUX_SCALE
#define K3T 0x00c0 // 0.375 * 2^RATIO_SCALE
#define B3T 0x023f // 0.0351 * 2^LUX_SCALE
#define M3T 0x037b // 0.0544 * 2^LUX_SCALE
#define K4T 0x0100 // 0.50 * 2^RATIO_SCALE
#define B4T 0x0270 // 0.0381 * 2^LUX_SCALE
#define M4T 0x03fe // 0.0624 * 2^LUX_SCALE
#define K5T 0x0138 // 0.61 * 2^RATIO_SCALE
#define B5T 0x016f // 0.0224 * 2^LUX_SCALE
#define M5T 0x01fc // 0.0310 * 2^LUX_SCALE
#define K6T 0x019a // 0.80 * 2^RATIO_SCALE
#define B6T 0x00d2 // 0.0128 * 2^LUX_SCALE
#define M6T 0x00fb // 0.0153 * 2^LUX_SCALE
#define K7T 0x029a // 1.3 * 2^RATIO_SCALE
#define B7T 0x0018 // 0.00146 * 2^LUX_SCALE
#define M7T 0x0012 // 0.00112 * 2^LUX_SCALE
#define K8T 0x029a // 1.3 * 2^RATIO_SCALE
#define B8T 0x0000 // 0.000 * 2^LUX_SCALE
#define M8T 0x0000 // 0.000 * 2^LUX_SCALE
#define K1C 0x0043 // 0.130 * 2^RATIO_SCALE
#define B1C 0x0204 // 0.0315 * 2^LUX_SCALE
#define M1C 0x01ad // 0.0262 * 2^LUX_SCALE
#define K2C 0x0085 // 0.260 * 2^RATIO_SCALE
#define B2C 0x0228 // 0.0337 * 2^LUX_SCALE
#define M2C 0x02c1 // 0.0430 * 2^LUX_SCALE
#define K3C 0x00c8 // 0.390 * 2^RATIO_SCALE
#define B3C 0x0253 // 0.0363 * 2^LUX_SCALE
#define M3C 0x0363 // 0.0529 * 2^LUX_SCALE
#define K4C 0x010a // 0.520 * 2^RATIO_SCALE
#define B4C 0x0282 // 0.0392 * 2^LUX_SCALE
#define M4C 0x03df // 0.0605 * 2^LUX_SCALE
#define K5C 0x014d // 0.65 * 2^RATIO_SCALE
#define B5C 0x0177 // 0.0229 * 2^LUX_SCALE
#define M5C 0x01dd // 0.0291 * 2^LUX_SCALE
#define K6C 0x019a // 0.80 * 2^RATIO_SCALE
#define B6C 0x0101 // 0.0157 * 2^LUX_SCALE
#define M6C 0x0127 // 0.0180 * 2^LUX_SCALE
#define K7C 0x029a // 1.3 * 2^RATIO_SCALE
#define B7C 0x0037 // 0.00338 * 2^LUX_SCALE
#define M7C 0x002b // 0.00260 * 2^LUX_SCALE
#define K8C 0x029a // 1.3 * 2^RATIO_SCALE
#define B8C 0x0000 // 0.000 * 2^LUX_SCALE
#define M8C 0x0000 // 0.000 * 2^LUX_SCALE

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

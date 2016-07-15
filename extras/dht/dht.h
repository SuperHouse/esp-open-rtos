/*
 * Part of esp-open-rtos
 * Copyright (C) 2016 Jonathan Hartsuiker (https://github.com/jsuiker)
 * BSD Licensed as described in the file LICENSE
 *
 */

#ifndef __DHT_H__
#define __DHT_H__

#include <stdint.h>
#include <stdbool.h>

#define DHT11       11
#define DHT22       22

// Type of sensor to use
#define DHT_TYPE    DHT22

/**
 * Read data from sensor on specified pin.
 *
 * Humidity and temperature is returned as integers.
 * For example: humidity=625 is 62.5 %
 *              temperature=24.4 is 24.4 degrees Celsius
 *
 */
bool dht_read_data(uint8_t pin, int16_t *humidity, int16_t *temperature);


/**
 * Float version of dht_read_data.
 *
 * Return values as floating point values.
 */
bool dht_read_float_data(uint8_t pin, float *humidity, float *temperature);

#endif  // __DHT_H__

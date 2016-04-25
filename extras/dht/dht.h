/*
 * Part of esp-open-rtos
 * Copyright (C) 2016 Jonathan Hartsuiker (https://github.com/jsuiker)
 * BSD Licensed as described in the file LICENSE
 *
 */

#ifndef __DTH_H__
#define __DHT_H__

#include "FreeRTOS.h"

bool dht_wait_for_pin_state(uint8_t pin, uint8_t interval, uint8_t timeout, bool expected_pin_sate, uint8_t * counter);
bool dht_fetch_data(int8_t pin, int8_t * humidity, int8_t * temperature);

#endif


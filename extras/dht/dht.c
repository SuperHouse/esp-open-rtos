/*
 * Part of esp-open-rtos
 * Copyright (C) 2016 Jonathan Hartsuiker (https://github.com/jsuiker)
 * BSD Licensed as described in the file LICENSE
 *
 */

#include "dht.h"
#include "string.h"
#include "task.h"
#include "esp/gpio.h"

#include <espressif/esp_misc.h> // sdk_os_delay_us

#ifndef DEBUG_DHT
#define DEBUG_DHT 0
#endif

#if DEBUG_DHT
#define debug(fmt, ...) printf("%s" fmt "\n", "dht: ", ## __VA_ARGS__);
#else
#define debug(fmt, ...) /* (do nothing) */
#endif

/* 
 *  Note:
 *  A suitable pull-up resistor should be connected to the selected GPIO line
 *
 *  __           ______          _______                              ___________________________
 *    \    A    /      \   C    /       \   DHT duration_data_low    /                           \
 *     \_______/   B    \______/    D    \__________________________/   DHT duration_data_high    \__
 *
 *
 *  Initializing communications with the DHT requires four 'phases' as follows:
 * 
 *  Phase A - MCU pulls signal low for at least 18000 us
 *  Phase B - MCU allows signal to float back up and waits 20-40us for DHT to pull it low
 *  Phase C - DHT pulls signal low for ~80us
 *  Phase D - DHT lets signal float back up for ~80us
 *  
 *  After this, the DHT transmits its first bit by holding the signal low for 50us
 *  and then letting it float back high for a period of time that depends on the data bit.
 *  duration_data_high is shorter than 50us for a logic '0' and longer than 50us for logic '1'.
 *
 *  There are a total of 40 data bits trasnmitted sequentially. These bits are read into a byte array
 *  of length 5.  The first and third bytes are humidity (%) and temperature (C), respectively.  Bytes 2 and 4
 *  are zero-filled and the fifth is a checksum such that:
 *
 *  byte_5 == (byte_1 + byte_2 + byte_3 + btye_4) & 0xFF
 *
*/

/*  
 *  @pin                    the selected GPIO pin
 *  @interval               how frequently the pin state is checked in microseconds
 *  @timeout                maximum length of time to wait for the expected pin state
 *  @expected_pin_state     high (true) or low (false) pin state
 *  @counter                pointer to external uint8_t for tallying the duration waited for the pin state
*/

bool dht_await_pin_state(uint8_t pin, uint8_t interval, uint8_t timeout, bool expected_pin_state, uint8_t * counter) {

    for (*counter = 0; *counter < timeout; *counter+=interval) {
        if (gpio_read(pin) == expected_pin_state) return true;
        sdk_os_delay_us(interval);
    }

    return false;
}

/*  
 *  
 *  
 *  @pin                    the selected GPIO pin
 *  @humidity               pointer to external int8_t to store resulting humidity value
 *  @temperature            pointer to external int8_t to store resulting temperature value
*/

bool dht_fetch_data(int8_t pin, int8_t * humidity, int8_t * temperature) {
    int8_t data[40] = {0};
    int8_t result[5] = {0};
    uint8_t i = 0;

    uint8_t init_phase_duration = 0;
    uint8_t duration_data_low = 0;
    uint8_t duration_data_high = 0;

    gpio_enable(pin, GPIO_OUT_OPEN_DRAIN);

    taskENTER_CRITICAL();

    // Phase 'A' pulling signal low to initiate read sequence
    gpio_write(pin, 0);
    sdk_os_delay_us(20000);
    gpio_write(pin, 1);

    // Step through Phase 'B' at 2us intervals, 40us max
    if (dht_await_pin_state(pin, 2, 40, false, &init_phase_duration)) {
        // Step through Phase 'C ' at 2us intervals, 88us max
        if (dht_await_pin_state(pin, 2, 88, true, &init_phase_duration)) {
            // Step through Phase 'D' at 2us intervals, 88us max
            if (dht_await_pin_state(pin, 2, 88, false, &init_phase_duration)) {

                // Read in each of the 40 bits of data...
                for (i = 0; i < 40; i++) {
                    if (dht_await_pin_state(pin, 2, 60, true, &duration_data_low)) {
                        if (dht_await_pin_state(pin, 2, 75, false, &duration_data_high)) {
                            data[i] = duration_data_high > duration_data_low;
                        }
                    }
                }

                taskEXIT_CRITICAL();

                for (i = 0; i < 40; i++) {
                    // Read each bit into 'result' byte array...
                    result[i/8] <<= 1;
                    result[i/8] |= data[i];
                }

                if (result[4] == ((result[0] + result[1] + result[2] + result[3]) & 0xFF)) {
                    // Data valid, checksum succeeded...
                    *humidity = result[0];
                    *temperature = result[2];
                    debug("Successfully retrieved sensor data...");
                    return true;
                } else {
                    debug("Checksum failed, invalid data received from sensor...");
                }

            } else {
                debug("Initialization error, problem in phase 'D'...");
            }
        } else {
            debug("Initialization error, problem in phase 'C'...");
        }
    } else {
        debug("Initialization error, problem in phase 'B'...");
    }
    
    taskEXIT_CRITICAL();
    return false;
}


/* 
 * The MIT License (MIT)
 * 
 * Copyright (c) 2015 Johan Kanflo (github.com/kanflo)
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include <esp8266.h>
#include <espressif/esp_misc.h> // sdk_os_delay_us
#include "i2c.h"


// I2C driver for ESP8266 written for use with esp-open-rtos
// Based on https://en.wikipedia.org/wiki/I²C#Example_of_bit-banging_the_I.C2.B2C_Master_protocol

// With calling overhead, we end up at ~100kbit/s
#define CLK_HALF_PERIOD_US (1)

#define CLK_STRETCH  (10)

static bool started;
static uint8_t g_scl_pin;
static uint8_t g_sda_pin;

void i2c_init(uint8_t scl_pin, uint8_t sda_pin)
{
    started = false;
    g_scl_pin = scl_pin;
    g_sda_pin = sda_pin;

    // Just to prevent these pins floating too much if not connected.
    gpio_set_pullup(g_scl_pin, 1, 1);
    gpio_set_pullup(g_sda_pin, 1, 1);

    gpio_enable(g_scl_pin, GPIO_OUT_OPEN_DRAIN);
    gpio_enable(g_sda_pin, GPIO_OUT_OPEN_DRAIN);

    // I2C bus idle state.
    gpio_write(g_scl_pin, 1);
    gpio_write(g_sda_pin, 1);
}

static inline void i2c_delay(void)
{
    sdk_os_delay_us(CLK_HALF_PERIOD_US);
}

// Set SCL as input, allowing it to float high, and return current
// level of line, 0 or 1
static inline bool read_scl(void)
{
    gpio_write(g_scl_pin, 1);
    return gpio_read(g_scl_pin); // Clock high, valid ACK
}

// Set SDA as input, allowing it to float high, and return current
// level of line, 0 or 1
static inline bool read_sda(void)
{
    gpio_write(g_sda_pin, 1);
    // TODO: Without this delay we get arbitration lost in i2c_stop
    i2c_delay();
    return gpio_read(g_sda_pin); // Clock high, valid ACK
}

// Actively drive SCL signal low
static inline void clear_scl(void)
{
    gpio_write(g_scl_pin, 0);
}

// Actively drive SDA signal low
static inline void clear_sda(void)
{
    gpio_write(g_sda_pin, 0);
}

// Output start condition
void i2c_start(void)
{
    uint32_t clk_stretch = CLK_STRETCH;
    if (started) { // if started, do a restart cond
        // Set SDA to 1
        (void) read_sda();
        i2c_delay();
        while (read_scl() == 0 && clk_stretch--) ;
        // Repeated start setup time, minimum 4.7us
        i2c_delay();
    }
    if (read_sda() == 0) {
        printf("I2C: arbitration lost in i2c_start\n");
    }
    // SCL is high, set SDA from 1 to 0.
    clear_sda();
    i2c_delay();
    clear_scl();
    started = true;
}

// Output stop condition
void i2c_stop(void)
{
    uint32_t clk_stretch = CLK_STRETCH;
    // Set SDA to 0
    clear_sda();
    i2c_delay();
    // Clock stretching
    while (read_scl() == 0 && clk_stretch--) ;
    // Stop bit setup time, minimum 4us
    i2c_delay();
    // SCL is high, set SDA from 0 to 1
    if (read_sda() == 0) {
        printf("I2C: arbitration lost in i2c_stop\n");
    }
    i2c_delay();
    started = false;
}

// Write a bit to I2C bus
static void i2c_write_bit(bool bit)
{
    uint32_t clk_stretch = CLK_STRETCH;
    if (bit) {
        (void) read_sda();
    } else {
        clear_sda();
    }
    i2c_delay();
    // Clock stretching
    while (read_scl() == 0 && clk_stretch--) ;
    // SCL is high, now data is valid
    // If SDA is high, check that nobody else is driving SDA
    if (bit && read_sda() == 0) {
        printf("I2C: arbitration lost in i2c_write_bit\n");
    }
    i2c_delay();
    clear_scl();
}

// Read a bit from I2C bus
static bool i2c_read_bit(void)
{
    uint32_t clk_stretch = CLK_STRETCH;
    bool bit;
    // Let the slave drive data
    (void) read_sda();
    i2c_delay();
    // Clock stretching
    while (read_scl() == 0 && clk_stretch--) ;
    // SCL is high, now data is valid
    bit = read_sda();
    i2c_delay();
    clear_scl();
    return bit;
}

bool i2c_write(uint8_t byte)
{
    bool nack;
    uint8_t bit;
    for (bit = 0; bit < 8; bit++) {
        i2c_write_bit((byte & 0x80) != 0);
        byte <<= 1;
    }
    nack = i2c_read_bit();
    return !nack;
}

uint8_t i2c_read(bool ack)
{
    uint8_t byte = 0;
    uint8_t bit;
    for (bit = 0; bit < 8; bit++) {
        byte = (byte << 1) | i2c_read_bit();
    }
    i2c_write_bit(ack);
    return byte;
}

bool i2c_slave_write(uint8_t slave_addr, uint8_t *data, uint8_t len)
{
    bool success = false;
    do {
        i2c_start();
        if (!i2c_write(slave_addr << 1))
            break;
        while (len--) {
            if (!i2c_write(*data++))
                break;
        }
        i2c_stop();
        success = true;
    } while(0);
    return success;
}

bool i2c_slave_read(uint8_t slave_addr, uint8_t data, uint8_t *buf, uint32_t len)
{
    bool success = false;
    do {
        i2c_start();
        if (!i2c_write(slave_addr << 1)) {
            break;
        }
        i2c_write(data);
        i2c_stop();
        i2c_start();
        if (!i2c_write(slave_addr << 1 | 1)) { // Slave address + read
            break;
        }
        while(len) {
            *buf = i2c_read(len == 1);
            buf++;
            len--;
        }
        success = true;
    } while(0);
    i2c_stop();
    if (!success) {
        printf("I2C: write error\n");
    }
    return success;
}

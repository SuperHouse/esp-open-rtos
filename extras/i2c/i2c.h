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

#ifndef __I2C_H__
#define __I2C_H__

#include <stdint.h>
#include <stdbool.h>
#include <errno.h>
#include <FreeRTOS.h>
#include <task.h>

#ifdef	__cplusplus
extern "C" {
#endif


#define I2C_FREQUENCY_400K true  // for test WIP

/*
 *  Some bit can be transmit slower.
 *  Selected frequency fix the speed of a bit transmission
 *  I2C lib take the maximum frequency defined
 *  Don't change frequency when I2C transaction had begin
 */

#ifdef I2C_FREQUENCY_500K
#define I2C_CUSTOM_DELAY_160MHZ   6
#define I2C_CUSTOM_DELAY_80MHZ    1   //Sry, maximum is 320kHz at 80MHz
#elif defined(I2C_FREQUENCY_400K)
#define I2C_CUSTOM_DELAY_160MHZ   10
#define I2C_CUSTOM_DELAY_80MHZ    1   //Sry, maximum is 320kHz at 80MHz
#else
#define I2C_CUSTOM_DELAY_160MHZ   100
#define I2C_CUSTOM_DELAY_80MHZ    20
#endif

// I2C driver for ESP8266 written for use with esp-open-rtos
// Based on https://en.wikipedia.org/wiki/I²C#Example_of_bit-banging_the_I.C2.B2C_Master_protocol
// With calling overhead, we end up at ~320kbit/s

//Level 0 API

/**
 * Init bitbanging I2C driver on given pins
 * @param scl_pin SCL pin for I2C
 * @param sda_pin SDA pin for I2C
 */
void i2c_init(uint8_t scl_pin, uint8_t sda_pin);

/**
 * Write a byte to I2C bus.
 * @param byte Pointer to device descriptor
 * @return true if slave acked
 */
bool i2c_write(uint8_t byte);

/**
 * Read a byte from I2C bus.
 * @param ack Set Ack for slave (false: Ack // true: NoAck)
 * @return byte read from slave.
 */
uint8_t i2c_read(bool ack);

/**
 * Send start or restart condition
 */
void i2c_start(void);

/**
 * Send stop condition
 * @return false if link was broken
 */
bool i2c_stop(void);

/**
 * get status from I2C bus.
 * @return true if busy.
 */
bool i2c_status(void);

//Level 1 API (Don't need functions above)

/**
 * This function will allow you to force a transmission I2C, cancel current transmission.
 * Warning: Use with precaution. Don't use it if you can avoid it. Usefull for priority transmission.
 * @param state Force the next I2C transmission if true (Use with precaution)
 */
void i2c_force_bus(bool state);

/**
 * Write 'len' bytes from 'buf' to slave at 'data' register adress .
 * @param slave_addr slave device address
 * @param data Pointer to register address to send if non-null
 * @param buf Pointer to data buffer
 * @param len Number of byte to send
 * @return Non-Zero if error occured
 */
int i2c_slave_write(uint8_t slave_addr, const uint8_t *data, const uint8_t *buf, uint32_t len);

/**
 * Issue a send operation of 'data' register adress, followed by reading 'len' bytes
 * from slave into 'buf'.
 * @param slave_addr slave device address
 * @param data Pointer to register address to send if non-null
 * @param buf Pointer to data buffer
 * @param len Number of byte to read
 * @return Non-Zero if error occured
 */
int i2c_slave_read(uint8_t slave_addr, const uint8_t *data, uint8_t *buf, uint32_t len);

#ifdef	__cplusplus
}
#endif

#endif /* __I2C_H__ */

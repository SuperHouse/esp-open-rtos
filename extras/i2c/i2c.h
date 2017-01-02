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

#ifdef	__cplusplus
extern "C" {
#endif

// I2C driver for ESP8266 written for use with esp-open-rtos
// Based on https://en.wikipedia.org/wiki/I²C#Example_of_bit-banging_the_I.C2.B2C_Master_protocol
// With calling overhead, we end up at ~320kbit/s

///////Level 0 API

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
 */
void i2c_stop(void);

/**
 * get status from I2C bus.
 * @return true if busy.
 */
bool i2c_status(void);

///////Level 1 API (Don't need functions above)

/**
 * Write 'len' bytes from 'buf' to slave. Return true if slave acked.
 * @param slave_addr slave device address
 * @param buf Pointer to data buffer
 * @param len Number of byte to send
 * @return false if error occured
 */
bool i2c_slave_write(uint8_t slave_addr, uint8_t *buf, uint8_t len);

/**
 * Issue a read operation and send 'data', followed by reading 'len' bytes
 * from slave into 'buf'.
 * @param slave_addr slave device address
 * @param data register address to send
 * @param buf Pointer to data buffer
 * @param len Number of byte to read
 * @return false if error occured
 */
bool i2c_slave_read(uint8_t slave_addr, uint8_t data, uint8_t *buf, uint32_t len);


#ifdef	__cplusplus
}
#endif

#endif /* __I2C_H__ */

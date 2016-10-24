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

// Init bitbanging I2C driver on given pins
void i2c_init(uint8_t scl_pin, uint8_t sda_pin);

// Write a byte to I2C bus. Return true if slave acked.
bool i2c_write(uint8_t byte);

// Read a byte from I2C bus. Return true if slave acked.
uint8_t i2c_read(bool ack);

// Write 'len' bytes from 'buf' to slave. Return true if slave acked.
bool i2c_slave_write(uint8_t slave_addr, uint8_t *buf, uint8_t len);

// Issue a read operation and send 'data', followed by reading 'len' bytes
// from slave into 'buf'. Return true if slave acked.
bool i2c_slave_read(uint8_t slave_addr, uint8_t data, uint8_t *buf, uint32_t len);

// Send start and stop conditions. Only needed when implementing protocols for
// devices where the i2c_slave_[read|write] functions above are of no use.
void i2c_start(void);
void i2c_stop(void);

#ifdef	__cplusplus
}
#endif

#endif /* __I2C_H__ */

/* 
 * The MIT License (MIT)
 * 
 * Copyright (c) 2015 Lilian Marazano (github.com/Zaltora)
 * Based on Baoshi i2c library <mail(at)ba0sh1(dot)com>
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
#endif

#include <esp8266.h>
#include <espressif/esp_misc.h> // sdk_os_delay_us
#include <stdint.h>
#include <stdbool.h>


//#define _DELAY sdk_os_delay_us(1)  // can up to 300kHz max
#define _DELAY for (volatile uint32_t __j = 3; __j > 0; __j--)  // can up to 1.9MHz max at 160MHz clock

// if you want use an other API for GPIO or use GPIO16, change here
#define _SDA1 gpio_write(_sda_pin, 1)
#define _SDA0 gpio_write(_sda_pin, 0)

#define _SCL1 gpio_write(_scl_pin, 1)
#define _SCL0 gpio_write(_scl_pin, 0)

#define _SDAX gpio_read(_sda_pin)
#define _SCLX gpio_read(_scl_pin)


/**
 * @brief    Init I2C bus
 * @param scl_pin SCL pin number
 * @param sda_pin SDA pin number
 */
void i2c_init(uint8_t scl_pin, uint8_t sda_pin) ;

/**
 * @brief    Send data to I2C bus
 * @param    data Data to send
 * @return   true if ACK is received at end of sending. False if not ACK'ed
 */
uint8_t i2c_write(uint8_t data);

/**
 * @brief    Read data from I2C bus
 * @param   ack ACK (true) or NACK (false)
 * @return   Data read
 */
uint8_t i2c_read(uint8_t ack);



/**
 * @brief   Send I2C start bit
 * @return  true if start successfully. Otherwise the bus is busy
 */
uint8_t i2c_start(void);

/**
 * @brief   Send I2C stop bit
 */
void i2c_stop(void);

/**
 * @brief Write multiple bytes to a device.
 * @param slave_addr I2C slave device address
 * @param buf Buffer to copy new data from
 * @param len Number of bytes to write
 * @return Status of operation (true = success)
 */
bool i2c_slave_write(uint8_t slave_addr, uint8_t *buf, uint16_t len);

/**
 * @brief Read multiple bytes from a device register.
 * @param slave_addr I2C slave device address
 * @param data First register to read from
 * @param buf Buffer to store read data in
 * @param len Number of bytes to read
 * @return Status of read operation (true = success)
 */
bool i2c_slave_read(uint8_t slave_addr, uint8_t data, uint8_t *buf, uint16_t len);


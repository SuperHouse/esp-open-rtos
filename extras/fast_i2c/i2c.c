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

#include "i2c.h"

static uint8_t _scl_pin;
static uint8_t _sda_pin;

void i2c_init(uint8_t scl_pin, uint8_t sda_pin) {

	_scl_pin = scl_pin ;
	_sda_pin = sda_pin ;

	gpio_enable(_sda_pin, GPIO_OUT_OPEN_DRAIN);
	gpio_enable(_scl_pin, GPIO_OUT_OPEN_DRAIN);
	// Set idle bus high
	_SDA1;
	_SCL1;

	return;
}

uint8_t i2c_start(void) {

	_SDA1;
	_SCL1;
	_DELAY;
	if (_SDAX == 0) return false; // Bus busy
	_SDA0;
	_DELAY;
	_SCL0;
	return true;
}

void i2c_stop(void) {

	_SDA0;
	_SCL1;
	_DELAY;
	while (_SCLX == 0); // clock stretching
	_SDA1;
	_DELAY;
}

uint8_t i2c_write(uint8_t data) {

	uint8_t ibit;
	uint8_t ret;

	for (ibit = 0; ibit < 8; ++ibit)
	{
		if (data & 0x80)
			_SDA1;
		else
			_SDA0;
		_DELAY;
		_SCL1;
		_DELAY;
		data = data << 1;
		_SCL0;
	}
	_SDA1;
	_DELAY;
	_SCL1;
	_DELAY;
	ret = (_SDAX == 0);
	_SCL0;
	_DELAY;

	return ret;
}

uint8_t i2c_read(uint8_t ack) {

	uint8_t data = 0;
	uint8_t ibit = 8;

	_SDA1;
	while (ibit--)
	{
		data = data << 1;
		_SCL0;
		_DELAY;
		_SCL1;
		_DELAY;
		if (_SDAX)
			data = data | 0x01;
	}
	_SCL0;
	if (ack)
		_SDA0;  // ACK
	else
		_SDA1;  // NACK
	_DELAY;
	// Send clock
	_SCL1;
	_DELAY;
	_SCL0;
	_DELAY;
	// ACK end
	_SDA1;

	return data;
}

bool i2c_slave_read(uint8_t slave_addr, uint8_t data, uint8_t *buf, uint16_t len) {

	i2c_start();
	if(!i2c_write(slave_addr<<1)) goto fail_send; // adress + W
	if(!i2c_write(data)) goto fail_send; //Send byte
	i2c_start(); // restart condition
	if(!i2c_write((slave_addr<<1) | 1)) goto fail_send; // adress + R

	while(--len) {
		*(buf++) = i2c_read(1);
	}
	*buf = i2c_read(0);
	i2c_stop();
	return true;

	fail_send:
	i2c_stop();
	return false ;
}

bool i2c_slave_write(uint8_t slave_addr, uint8_t *buf, uint16_t len) {

	i2c_start();
	if(!i2c_write(slave_addr<<1)) goto fail_send ; // adress + W
	while (len--) {
		if(!i2c_write((uint8_t) *(buf++))) goto fail_send ;
	}
	i2c_stop();
	return true;

	fail_send:
	i2c_stop();
	return false ;
}

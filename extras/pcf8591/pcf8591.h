/**
 * Driver for  8-bit analog-to-digital conversion and
 * an 8-bit digital-to-analog conversion PCF8591
 *
 * Part of esp-open-rtos
 * Copyright (C) 2017 Pham Ngoc Thanh <pnt239@gmail.com>
 * BSD Licensed as described in the file LICENSE
 */
#ifndef _EXTRAS_PCF8591_H_
#define _EXTRAS_PCF8591_H_

#include <i2c/i2c.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * CAUTION: PLEASE SET I2C_FREQUENCY_400K IS 'false' IN 'i2c.h' FILE
 */

#define PCF8591_DEFAULT_ADDRESS 0x48

void pcf8591_init(void); //FIXME : library incomplete ?

/**
 * Read input value of an analog pin.
 * @param[in] addr Pointer to device
 * @param[in] analog_pin pin number:
 *            0 - AIN0
 *            1 - AIN1
 *            2 - AIN2
 *            3 - AIN3
 * @return analog value
 */
uint8_t pcf8591_read(i2c_dev_t* dev, uint8_t analog_pin);


#ifdef __cplusplus
}
#endif

#endif /* _EXTRAS_PCF8591_H_ */

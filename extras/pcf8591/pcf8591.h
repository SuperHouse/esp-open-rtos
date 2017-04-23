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

#ifdef __cplusplus
extern "C"
{
#endif

#define PCF8591_DEFAULT_ADDRESS 0x90

/**
 * Set new sensor address for switching another.
 * @param[in] addr Pointer to device
 * @return none
 */
void pcf8591_set_address(uint8_t addr);


#ifdef __cplusplus
}
#endif

#endif /* _EXTRAS_PCF8591_H_ */

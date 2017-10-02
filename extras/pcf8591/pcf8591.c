#include <stddef.h>
#include <stdint.h>

#include "pcf8591.h"

/**
 * CAUTION: PLEASE SET LOW FREQUENCY
 */

#define PCF8591_CTRL_REG_READ 0x03

uint8_t pcf8591_read(i2c_dev_t* dev, uint8_t analog_pin)
{
    uint8_t res = 0;
    uint8_t control_reg = PCF8591_CTRL_REG_READ & analog_pin;

    i2c_slave_read(dev->bus, dev->addr, &control_reg, &res, 1);

    return res;
}

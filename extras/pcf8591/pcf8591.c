#include <stddef.h>
#include <stdint.h>

#include <i2c/i2c.h>
#include "pcf8591.h"

/**
 * CAUTION: PLEASE SET I2C_FREQUENCY_400K IS 'false' IN 'i2c.h' FILE
 */

#define PCF8591_CTRL_REG_READ 0x03

uint8_t
pcf8591_read(uint8_t addr, uint8_t analog_pin)
{
    uint8_t res = 0;
    uint8_t control_reg = PCF8591_CTRL_REG_READ & analog_pin;

    i2c_slave_read(addr, &control_reg, &res, 1);

    return res;
}

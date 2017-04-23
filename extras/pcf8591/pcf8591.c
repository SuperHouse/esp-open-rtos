#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#include <i2c/i2c.h>
#include "pcf8591.h"

static uint8_t mAddress = PCF8591_DEFAULT_ADDRESS;
static float mVoltage = 3.3f;

void
pcf8591_set_address(uint8_t addr)
{
    //
}

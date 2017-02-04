#include "pcf8574.h"
#include <i2c/i2c.h>

uint8_t pcf8574_port_read(uint8_t addr)
{
    uint8_t res;
    if (i2c_slave_read(addr, NULL, &res, 1))
            return 0;
    return res;
}

size_t pcf8574_port_read_buf(uint8_t addr, void *buf, size_t len)
{
    if (!len || !buf) return 0;
    uint8_t *_buf = (uint8_t *)buf;

    if (i2c_slave_read(addr, NULL, _buf, len))
        return 0;
    return len;
}

size_t pcf8574_port_write_buf(uint8_t addr, void *buf, size_t len)
{
    if (!len || !buf) return 0;
    uint8_t *_buf = (uint8_t *)buf;

    if (i2c_slave_write(addr, NULL, _buf, len))
        return 0;
    return len;
}

void pcf8574_port_write(uint8_t addr, uint8_t value)
{
    i2c_slave_write(addr, NULL, &value, 1);
}

bool pcf8574_gpio_read(uint8_t addr, uint8_t num)
{
    return (bool)((pcf8574_port_read(addr) >> num) & 1);
}

void pcf8574_gpio_write(uint8_t addr, uint8_t num, bool value)
{
    uint8_t bit = (uint8_t)value << num;
    uint8_t mask = ~(1 << num);
    pcf8574_port_write (addr, (pcf8574_port_read(addr) & mask) | bit);
}

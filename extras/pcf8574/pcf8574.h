/**
 * \file Driver for PCF8574 compartible remote 8-bit I/O expanders for I2C-bus
 * \author Ruslan V. Uss
 */
#ifndef PCF8574_PCF8574_H_
#define PCF8574_PCF8574_H_

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * \brief Read GPIO port value
 * \param addr I2C register address (0b0100<A2><A1><A0> for PCF8574)
 * \return 8-bit GPIO port value
 */
uint8_t pcf8574_port_read(uint8_t addr);

/**
 * \brief Continiously read GPIO port values to buffer
 * @param addr I2C register address (0b0100<A2><A1><A0> for PCF8574)
 * @param buf Target buffer
 * @param len Buffer length
 * @return Number of bytes read
 */
size_t pcf8574_port_read_buf(uint8_t addr, void *buf, size_t len);

/**
 * \brief Write value to GPIO port
 * \param addr I2C register address (0b0100<A2><A1><A0> for PCF8574)
 * \param value GPIO port value
 */
void pcf8574_port_write(uint8_t addr, uint8_t value);

/**
 * \brief Continiously write GPIO values to GPIO port
 * \param addr I2C register address (0b0100<A2><A1><A0> for PCF8574)
 * @param buf Buffer with values
 * @param len Buffer length
 * @return Number of bytes written
 */
size_t pcf8574_port_write_buf(uint8_t addr, void *buf, size_t len);

/**
 * \brief Read input value of a GPIO pin
 * \param addr I2C register address (0b0100<A2><A1><A0> for PCF8574)
 * \param num pin number (0..7)
 * \return GPIO pin value
 */
bool pcf8574_gpio_read(uint8_t addr, uint8_t num);

/**
 * \brief Set GPIO pin output
 * Note this is READ - MODIFY - WRITE operation! Please read PCF8574
 * datasheet first.
 * \param addr I2C register address (0b0100<A2><A1><A0> for PCF8574)
 * \param num pin number (0..7)
 * \param value true for high level
 */
void pcf8574_gpio_write(uint8_t addr, uint8_t num, bool value);

#ifdef __cplusplus
}
#endif

#endif /* PCF8574_PCF8574_H_ */

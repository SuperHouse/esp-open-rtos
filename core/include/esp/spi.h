/**
 * \file Hardware SPI master driver
 *
 * Part of esp-open-rtos
 *
 * \copyright Ruslan V. Uss, 2016
 * BSD Licensed as described in the file LICENSE
 */
#ifndef _ESP_SPI_H_
#define _ESP_SPI_H_

#include <stdbool.h>
#include <stdint.h>
#include "esp/spi_regs.h"
#include "esp/clocks.h"

/**
 * Macro for use with spi_init and spi_set_frequency_div.
 * SPI frequency = 80000000 / divider / count
 * dvider must be in 1..8192 and count in 1..64
 */
#define SPI_GET_FREQ_DIV(divider, count) (((count) << 16) | (divider))

/**
 * Predefinded SPI frequency dividers
 */
#define SPI_FREQ_DIV_125K SPI_GET_FREQ_DIV(64, 10) ///< 125kHz
#define SPI_FREQ_DIV_250K SPI_GET_FREQ_DIV(32, 10) ///< 250kHz
#define SPI_FREQ_DIV_500K SPI_GET_FREQ_DIV(16, 10) ///< 500kHz
#define SPI_FREQ_DIV_1M   SPI_GET_FREQ_DIV(8, 10)  ///< 1MHz
#define SPI_FREQ_DIV_2M   SPI_GET_FREQ_DIV(4, 10)  ///< 2MHz
#define SPI_FREQ_DIV_4M   SPI_GET_FREQ_DIV(2, 10)  ///< 4MHz
#define SPI_FREQ_DIV_8M   SPI_GET_FREQ_DIV(5,  2)  ///< 8MHz
#define SPI_FREQ_DIV_10M  SPI_GET_FREQ_DIV(4,  2)  ///< 10MHz
#define SPI_FREQ_DIV_20M  SPI_GET_FREQ_DIV(2,  2)  ///< 20MHz
#define SPI_FREQ_DIV_40M  SPI_GET_FREQ_DIV(1,  2)  ///< 40MHz
#define SPI_FREQ_DIV_80M  SPI_GET_FREQ_DIV(1,  1)  ///< 80MHz

#ifdef __cplusplus
extern "C"
{
#endif

typedef enum _spi_mode_t {
    SPI_MODE0 = 0,  ///< CPOL = 0, CPHA = 0
    SPI_MODE1,      ///< CPOL = 0, CPHA = 1
    SPI_MODE2,      ///< CPOL = 1, CPHA = 0
    SPI_MODE3       ///< CPOL = 1, CPHA = 1
} spi_mode_t;

typedef enum _spi_endianness_t {
    SPI_LITTLE_ENDIAN,
    SPI_BIG_ENDIAN
} spi_endianness_t;

/**
 * \brief Initalize SPI bus
 * Initalize specified SPI bus and setup appropriate pins:
 * Bus 0:
 *   - MISO = GPIO 7
 *   - MOSI = GPIO 8
 *   - SCK  = GPIO 6
 *   - CS0  = GPIO 11 (if minimal_pins is false)
 *   - HD   = GPIO 9  (if minimal_pins is false)
 *   - WP   = GPIO 10 (if minimal_pins is false)
 * Bus 1:
 *   - MISO = GPIO 12
 *   - MOSI = GPIO 13
 *   - SCK  = GPIO 14
 *   - CS0  = GPIO 15 (if minimal_pins is false)
 * Note that system flash memory is on the bus 0!
 * \param bus Bus ID: 0 - system, 1 - user
 * \param mode Bus mode
 * \param freq_divider SPI bus frequency divider, use SPI_GET_FREQ_DIV() or predefined value
 * \param msb Bit order, MSB first if true
 * \param endianness Byte order
 * \param minimal_pins If true use the minimal set of pins: MISO, MOSI and SCK.
 * \return false when error
 */
bool spi_init(uint8_t bus, spi_mode_t mode, uint32_t freq_divider, bool msb, spi_endianness_t endianness, bool minimal_pins);

/**
 * \brief Set SPI bus mode
 * \param bus Bus ID: 0 - system, 1 - user
 * \param mode Bus mode.
 */
void spi_set_mode(uint8_t bus, spi_mode_t mode);
/**
 * \brief Get mode of the SPI bus
 * \param bus Bus ID: 0 - system, 1 - user
 * \return Bus mode
 */
inline spi_mode_t spi_get_mode(uint8_t bus)
{
    return (spi_mode_t)((SPI(bus).PIN & SPI_PIN_IDLE_EDGE ? 2 : 0) | (SPI(bus).USER0 & SPI_USER0_CLOCK_OUT_EDGE ? 1 : 0));
}

/**
 * \brief Set SPI bus frequency
 * Examples:
 *
 *     spi_set_frequency_div(1, SPI_FREQ_DIV_8M); // 8 MHz, predefined value
 *     ...
 *     spi_set_frequency_div(1, SPI_GET_FREQ_DIV(8, 10)); // divider = 8, count = 10,
 *                                                        // frequency = 80000000 Hz / 8 / 10 = 1000000 Hz
 *
 * \param bus Bus ID: 0 - system, 1 - user
 * \param divider Predivider of the system bus frequency (80MHz) in the 2 low
 *     bytes and period pulses count in the third byte. Please note that
 *     divider must be be in range 1..8192 and count in range 2..64. Use the
 *     macro SPI_GET_FREQ_DIV(divider, count) to get the correct parameter value.
 */
void spi_set_frequency_div(uint8_t bus, uint32_t divider);
/**
 * \brief Get SPI bus frequency
 * Note the result is in Hz.
 * \param bus Bus ID: 0 - system, 1 - user
 * \return SPI frequency, Hz
 */
inline uint32_t spi_get_frequency_hz(uint8_t bus)
{
    return APB_CLK_FREQ /
        (((SPI(bus).CLOCK >> SPI_CLOCK_DIV_PRE_S) & SPI_CLOCK_DIV_PRE_M) + 1) /
        (((SPI(bus).CLOCK >> SPI_CLOCK_COUNT_NUM_S) & SPI_CLOCK_COUNT_NUM_M) + 1);
}

/**
 * \brief Set SPI bus bit order
 * \param bus Bus ID: 0 - system, 1 - user
 * \param msb Bit order, MSB first if true
 */
void spi_set_msb(uint8_t bus, bool msb);
/**
 * \brief Get SPI bus bit order
 * \param bus Bus ID: 0 - system, 1 - user
 * \return msb Bit order, MSB first if true
 */
inline bool spi_get_msb(uint8_t bus)
{
    return !(SPI(bus).CTRL0 & (SPI_CTRL0_WR_BIT_ORDER | SPI_CTRL0_RD_BIT_ORDER));
}

/**
 * \brief Set SPI bus byte order
 * This value is ignored when transferring buffer with spi_transfer()
 * \param bus Bus ID: 0 - system, 1 - user
 * \param endianness Byte order
 */
void spi_set_endianness(uint8_t bus, spi_endianness_t endianness);
/**
 * \brief Get SPI bus byte order
 * \param bus Bus ID: 0 - system, 1 - user
 * \return endianness Byte order
 */
inline spi_endianness_t spi_get_endianness(uint8_t bus)
{
    return SPI(bus).USER0 & (SPI_USER0_WR_BYTE_ORDER | SPI_USER0_RD_BYTE_ORDER)
    	? SPI_BIG_ENDIAN
    	: SPI_LITTLE_ENDIAN;
}

/**
 * \brief Transfer byte over SPI
 * \param bus Bus ID: 0 - system, 1 - user
 * \param data Byte to send
 * \return Received byte
 */
uint8_t spi_transfer_8(uint8_t bus, uint8_t data);
/**
 * \brief Transfer word over SPI
 * \param bus Bus ID: 0 - system, 1 - user
 * \param data Word to send
 * \return Received word
 */
uint16_t spi_transfer_16(uint8_t bus, uint16_t data);
/**
 * \brief Transfer dword over SPI
 * \param bus Bus ID: 0 - system, 1 - user
 * \param data dword to send
 * \return Received dword
 */
uint32_t spi_transfer_32(uint8_t bus, uint32_t data);
/**
 * \brief Transfer buffer over SPI
 * \param bus Bus ID: 0 - system, 1 - user
 * \param data Data to send. Buffer contents will be replaced with received data
 * \param len Buffer size
 */
void spi_transfer(uint8_t bus, void *data, size_t len);

#ifdef __cplusplus
}
#endif

#endif /* _ESP_SPI_H_ */

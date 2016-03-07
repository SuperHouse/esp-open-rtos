/*
 * ESP hardware SPI master driver
 *
 * Part of esp-open-rtos
 * Copyright (c) Ruslan V. Uss, 2016
 * BSD Licensed as described in the file LICENSE
 */
#include "esp/spi.h"

#include "esp/iomux.h"
#include "esp/gpio.h"
#include <string.h>

#define _SPI0_SCK_GPIO  6
#define _SPI0_MISO_GPIO 7
#define _SPI0_MOSI_GPIO 8
#define _SPI0_HD_GPIO   9
#define _SPI0_WP_GPIO   10
#define _SPI0_CS0_GPIO  11

#define _SPI1_MISO_GPIO 12
#define _SPI1_MOSI_GPIO 13
#define _SPI1_SCK_GPIO  14
#define _SPI1_CS0_GPIO  15

#define _SPI0_FUNC 1
#define _SPI1_FUNC 2

#define _SPI_BUF_SIZE 64

inline static void _set_pin_function(uint8_t pin, uint32_t function)
{
    iomux_set_function(gpio_to_iomux(pin), function);
}

bool spi_init(uint8_t bus, spi_mode_t mode, uint32_t freq_divider, bool msb, spi_endianness_t endianness, bool minimal_pins)
{
    switch (bus)
    {
        case 0:
            _set_pin_function(_SPI0_MISO_GPIO, _SPI0_FUNC);
            _set_pin_function(_SPI0_MOSI_GPIO, _SPI0_FUNC);
            _set_pin_function(_SPI0_SCK_GPIO, _SPI0_FUNC);
            if (!minimal_pins)
            {
                _set_pin_function(_SPI0_HD_GPIO, _SPI0_FUNC);
                _set_pin_function(_SPI0_WP_GPIO, _SPI0_FUNC);
                _set_pin_function(_SPI0_CS0_GPIO, _SPI0_FUNC);
            }
            break;
        case 1:
            _set_pin_function(_SPI1_MISO_GPIO, _SPI1_FUNC);
            _set_pin_function(_SPI1_MOSI_GPIO, _SPI1_FUNC);
            _set_pin_function(_SPI1_SCK_GPIO, _SPI1_FUNC);
            if (!minimal_pins)
                _set_pin_function(_SPI1_CS0_GPIO, _SPI1_FUNC);
            break;
        default:
            return false;
    }

    SPI(bus).USER0 = SPI_USER0_MOSI | SPI_USER0_CLOCK_IN_EDGE | SPI_USER0_DUPLEX |
        (minimal_pins ? 0 : (SPI_USER0_CS_HOLD | SPI_USER0_CS_SETUP));

    spi_set_frequency_div(bus, freq_divider);
    spi_set_mode(bus, mode);
    spi_set_msb(bus, msb);
    spi_set_endianness(bus, endianness);

    return true;
}

void spi_set_mode(uint8_t bus, spi_mode_t mode)
{
    // CPHA
    if ((uint8_t)mode & 1)
        SPI(bus).USER0 |= SPI_USER0_CLOCK_OUT_EDGE;
    else
        SPI(bus).USER0 &= ~SPI_USER0_CLOCK_OUT_EDGE;

    // CPOL - see http://bbs.espressif.com/viewtopic.php?t=342#p5384
    if ((uint8_t)mode & 2)
        SPI(bus).PIN |= SPI_PIN_IDLE_EDGE;
    else
        SPI(bus).PIN &= ~SPI_PIN_IDLE_EDGE;
}

void spi_set_msb(uint8_t bus, bool msb)
{
    if (msb)
        SPI(bus).CTRL0 &= ~(SPI_CTRL0_WR_BIT_ORDER | SPI_CTRL0_RD_BIT_ORDER);
    else
        SPI(bus).CTRL0 |= (SPI_CTRL0_WR_BIT_ORDER | SPI_CTRL0_RD_BIT_ORDER);
}

void spi_set_endianness(uint8_t bus, spi_endianness_t endianness)
{
    if (endianness == SPI_BIG_ENDIAN)
        SPI(bus).USER0 |= (SPI_USER0_WR_BYTE_ORDER | SPI_USER0_RD_BYTE_ORDER);
    else
        SPI(bus).USER0 &= ~(SPI_USER0_WR_BYTE_ORDER | SPI_USER0_RD_BYTE_ORDER);
}

void spi_set_frequency_div(uint8_t bus, uint32_t divider)
{
    uint32_t predivider = divider & 0xffff;
    uint32_t count = divider >> 16;
    if (count > 1 || divider > 1)
    {
        predivider = predivider > SPI_CLOCK_DIV_PRE_M + 1 ? SPI_CLOCK_DIV_PRE_M + 1 : predivider;
        count = count > SPI_CLOCK_COUNT_NUM_M + 1 ? SPI_CLOCK_COUNT_NUM_M + 1 : count;
        IOMUX.CONF &= ~(bus == 0 ? IOMUX_CONF_SPI0_CLOCK_EQU_SYS_CLOCK : IOMUX_CONF_SPI1_CLOCK_EQU_SYS_CLOCK);
        SPI(bus).CLOCK = (((predivider - 1) & SPI_CLOCK_DIV_PRE_M) << SPI_CLOCK_DIV_PRE_S) |
            (((count - 1)     & SPI_CLOCK_COUNT_NUM_M)  << SPI_CLOCK_COUNT_NUM_S) |
            (((count / 2 - 1) & SPI_CLOCK_COUNT_HIGH_M) << SPI_CLOCK_COUNT_HIGH_S) |
            (((count - 1)     & SPI_CLOCK_COUNT_LOW_M)  << SPI_CLOCK_COUNT_LOW_S);
    }
    else
    {
        IOMUX.CONF |= bus == 0 ? IOMUX_CONF_SPI0_CLOCK_EQU_SYS_CLOCK : IOMUX_CONF_SPI1_CLOCK_EQU_SYS_CLOCK;
        SPI(bus).CLOCK = SPI_CLOCK_EQU_SYS_CLOCK;
    }
}

inline static void _set_size(uint8_t bus, uint8_t bytes)
{
    uint16_t bits = ((uint16_t)bytes << 3) - 1;
    const uint32_t mask = ~((SPI_USER1_MOSI_BITLEN_M << SPI_USER1_MOSI_BITLEN_S) |
        (SPI_USER1_MISO_BITLEN_M << SPI_USER1_MISO_BITLEN_S));
    SPI(bus).USER1 = (SPI(bus).USER1 & mask) | (bits << SPI_USER1_MOSI_BITLEN_S) |
        (bits << SPI_USER1_MISO_BITLEN_S);
}

inline static void _wait(uint8_t bus)
{
    while (SPI(bus).CMD & SPI_CMD_USR)
        ;
}

inline static void _start(uint8_t bus)
{
    SPI(bus).CMD |= SPI_CMD_USR;
}

inline static uint32_t _reverse_bytes(uint32_t value)
{
    return (value << 24) | ((value << 8) & 0x00ff0000) | ((value >> 8) & 0x0000ff00) | (value >> 24);
}

static uint32_t _spi_single_transfer (uint8_t bus, uint32_t data, uint8_t len)
{
    _wait(bus);
    _set_size(bus, len);
    spi_endianness_t e = spi_get_endianness(bus);
    SPI(bus).W0 = e == SPI_BIG_ENDIAN ? _reverse_bytes(data) : data;
    _start(bus);
    _wait(bus);
    return e == SPI_BIG_ENDIAN ? _reverse_bytes(SPI(bus).W0) : SPI(bus).W0;
}

// works properly only with little endian byte order
static void _spi_buf_transfer (uint8_t bus, const uint8_t *out_data, uint8_t *in_data, size_t len)
{
    _wait(bus);
    _set_size(bus, len);
    memcpy((void *)&SPI(bus).W0, out_data, len);
    _start(bus);
    _wait(bus);
    if (in_data)
        memcpy(in_data, (void *)&SPI(bus).W0, len);
}

uint8_t spi_transfer_8(uint8_t bus, uint8_t data)
{
    return _spi_single_transfer(bus, data, sizeof(data));
}

uint16_t spi_transfer_16(uint8_t bus, uint16_t data)
{
    return _spi_single_transfer(bus, data, sizeof(data));
}

uint32_t spi_transfer_32(uint8_t bus, uint32_t data)
{
    return _spi_single_transfer(bus, data, sizeof(data));
}

void spi_transfer(uint8_t bus, const void *out_data, void *in_data, size_t len)
{
    if (!out_data || !len) return;

    _wait(bus);
    spi_endianness_t e = spi_get_endianness(bus);
    spi_set_endianness(bus, SPI_LITTLE_ENDIAN);

    size_t blocks = len / _SPI_BUF_SIZE;
    for (size_t i = 0; i < blocks; i++)
    {
        size_t offset = i * _SPI_BUF_SIZE;
        _spi_buf_transfer(bus, (const uint8_t *)out_data + offset,
            in_data ? (uint8_t *)in_data + offset : NULL, _SPI_BUF_SIZE);
    }

    uint8_t tail = len % _SPI_BUF_SIZE;
    if (tail)
    {
        _spi_buf_transfer(bus, (const uint8_t *)out_data + blocks * _SPI_BUF_SIZE,
            in_data ? (uint8_t *)in_data + blocks * _SPI_BUF_SIZE : NULL, tail);
    }

    spi_set_endianness(bus, e);
}

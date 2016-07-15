#include "esp_spi_flash.h"
#include "flashchip.h"
#include "espressif/spi_flash.h"
#include "FreeRTOS.h"
#include "esp/rom.h"
#include "esp/spi_regs.h"


static uint32_t IRAM read_status(sdk_flashchip_t *flashchip, uint32_t *status)
{
    uint32_t _status;

    do {
        SPI(0).RSTATUS = 0;
        SPI(0).CMD = SPI_CMD_READ_SR;
        while (SPI(0).CMD) {}
        _status = SPI(0).RSTATUS & flashchip->status_mask;
    } while ( _status & 0b1);

    *status = _status;

    return 0;
}

static uint32_t IRAM wait_idle(sdk_flashchip_t *flashchip)
{
    while (DPORT.SPI_READY & DPORT_SPI_READY_IDLE) {}
    uint32_t a3;
    return read_status(flashchip, &a3);
}

static uint32_t IRAM write_enable(sdk_flashchip_t *flashchip)
{
    uint32_t local0 = 0;

    wait_idle(flashchip);

    SPI(0).CMD = SPI_CMD_WRITE_ENABLE;
    while (SPI(0).CMD) {}

    if (!(local0 & 0b1)) {
        do {
            read_status(flashchip, &local0);
        } while (!(local0 & (1<<1)));
    }
    return 0;
}

static uint32_t IRAM page_program(sdk_flashchip_t *flashchip, uint32_t dest_addr,
    uint32_t *buf, uint32_t size)
{
    if (size & 0b11) {
        return 1;
    }

    // check if block to write doesn't cross page boundary
    if (flashchip->page_size < size + (dest_addr % flashchip->page_size)) {
        return 1;
    }
    wait_idle(flashchip);
    if (size < 1) {
        return 0;
    }

    // a12 = 0x60000200
    // a0 =  0x00FFFFFF
    // a6 = (dest_addr & 0x00FFFFFF) | 0x20000000
    while (size >= 32) {
        SPI(0).ADDR = (dest_addr & 0x00FFFFFF) | 0x20000000;
        // a4 - loop variable += 4
        // a5 = buf[0]
        for (uint8_t i = 0; i != 8; i++) {
            SPI(0).W[i] = buf[i];
        }
        size -= 32;
        dest_addr += 32;
        buf += 8;
        if (write_enable(flashchip)) {
            return 1;
        }
        SPI(0).CMD = SPI_CMD_PP;
        while (SPI(0).CMD) {}   // wait for reg->cmd to be 0
        wait_idle(flashchip);
        // a0 = 0x00FFFFFF
        if (size < 1) {
            return 0;
        }
    }
    // a7 = 0x00FFFFFF & dest_addr
    // a4 = size << 24;
    // a4 = a7 | a4
    SPI(0).ADDR = (size << 24) | (0x00FFFFFF & dest_addr);
    // a6 = 0b11 & size
    // a3 = size >> 2;
    // a5 = a3 + 1
    uint32_t words = size >> 2;
    if (0b11 & size) {
        words += 1;
    }
    words = words & 0xFF;
    if (words != 0) {
        // a4 = 0
        uint8_t i = 0;

        if (words & 0b1) {  // bit 0 is set in a3
            SPI(0).W[0] = buf[0];
            i++;
        }
        // a6 = a3 >> 1;
        if (words >> 1) {
            // a6 =  0x600000200
            // buff[0]
            for (; i != words; i++) {
                SPI(0).W[i] = buf[i];
            }
        }
    }

    if (write_enable(flashchip)) {
        return 1;
    }
    SPI(0).CMD = SPI_CMD_PP;
    while (SPI(0).CMD) {}   // wait for reg->cmd to be 0
    wait_idle(flashchip);
    // a0 = 0x00FFFFFF
    return 0;
}

static uint32_t IRAM read_data(sdk_flashchip_t *flashchip, uint32_t addr,
        uint32_t *dst, uint32_t size)
{
    // a12 = dst
    if ((addr + size) > flashchip->chip_size) {
        return 1;
    }

    // a14 = addr
    // a13 = size
    wait_idle(flashchip);
    if (size < 1) {
        return 0;
    }
    // SPI(0).CMD
    while (size >= 32) {
        // a8 = addr | 0x20000000;
        SPI(0).ADDR = addr | 0x20000000;
        SPI(0).CMD = SPI_CMD_READ;
        while (SPI(0).CMD) {};
        for (uint32_t a2 = 0; a2 < 8; a2++) {
            *dst = SPI(0).W[a2];
            dst++;
        }
        size -= 32;
        addr += 32;
    }

    if (size >= 1) {
        // a7 = size << 24;
        // a7 = addr | a7
        SPI(0).ADDR = addr | (size << 24);
        SPI(0).CMD = SPI_CMD_READ;
        while (SPI(0).CMD) {};
        // a10 = size & 0b11
        uint8_t a7 = size >> 2;
        // a9 = a7 + 1
        if (size & 0b11) {
           // a7 = a7 + 1
           a7++;
        }
        // a7 = a7 & 0xFF
        if (!a7) {
            return 0;
        }
        uint8_t a2 = 0;
        if (a7 & 0b1) {
            a2 = 1;
            // a11 = SPI(0).W0
            *dst = SPI(0).W[0];
            dst += 1;
        }
        size = a7 >> 1;
        if (!size) {
            return 0;
        }
        for (; a2 != a7; a2++) {
            *dst = SPI(0).W[a2];
            dst += 1;
        }
    }

    return 0;
}

/**
 * Reverse engineered implementation of spi_flash.o:sdk_SPIRead
 */
static uint32_t IRAM spi_read(uint32_t dest_addr, void *src, uint32_t size)
{
    if (read_data(&sdk_flashchip, dest_addr, (uint32_t*)src, size)) {
        return 1;
    } else {
        return 0;
    }
}

/**
 * Reverse engineered implementation of spi_flash.o:sdk_spi_flash_read
 */
uint32_t IRAM esp_spi_flash_read(uint32_t dest_addr, void *src, uint32_t size)
{
    if (src) {
        vPortEnterCritical();
        Cache_Read_Disable();
        uint32_t result = spi_read(dest_addr, src, size);
        Cache_Read_Enable(0, 0, 1);
        vPortExitCritical();
        return result;
    } else {
        return 1;
    }
}

/**
 * Reverse engineered implementation of spi_flash.o:sdk_SPIWrite
 */
static uint32_t IRAM spi_write(uint32_t dest_addr, void *dst, uint32_t size)
{
    if (sdk_flashchip.chip_size < (dest_addr + size)) {
        return 1;
    }

    uint32_t write_bytes_to_page = sdk_flashchip.page_size -
        (dest_addr % sdk_flashchip.page_size);

    if (size < write_bytes_to_page) {
        if (page_program(&sdk_flashchip, dest_addr, (uint32_t*)dst, size)) {
            return 1;
        } else {
            return 0;
        }
    }

    if (page_program(&sdk_flashchip, dest_addr, (uint32_t*)dst, write_bytes_to_page)) {
        return 1;
    }

    uint32_t offset = write_bytes_to_page;
    uint32_t pages_to_write = (size - offset) / sdk_flashchip.page_size;
    for (uint8_t i = 0; i != pages_to_write; i++) {
        if (page_program(&sdk_flashchip, dest_addr + offset,
                    dst + ((offset>>2)<<2), sdk_flashchip.page_size)) {
            return 1;
        }
        offset += sdk_flashchip.page_size;
    }

    if (page_program(&sdk_flashchip, dest_addr + offset,
                dst + ((offset>>2)<<2), size - offset)) {
        return 1;
    } else {
        return 0;
    }
}

/**
 * Reverse engineered implementation of spi_flash.o:sdk_spi_flash_write
 */
uint32_t IRAM esp_spi_flash_write(uint32_t dest_addr, void *dst, uint32_t size)
{
    if (dst) {
        if (size & 0b11) {  // not 4-byte aligned
            size = size >> 2;
            size = (size << 2) + 1;
        }
        vPortEnterCritical();
        Cache_Read_Disable();
        uint32_t result = spi_write(dest_addr, dst, size);
        Cache_Read_Enable(0, 0, 1);
        vPortExitCritical();
        return result;
    } else {
        return 1;
    }
}

static uint32_t IRAM sector_erase(sdk_flashchip_t *chip, uint32_t addr)
{
    // a12 -> addr
    // a0 = addr & 0xFFF
    if (addr & 0xFFF) {
        return 1;
    }

    wait_idle(chip);
    SPI(0).ADDR = addr & 0x00FFFFFF;
    SPI(0).CMD = SPI_CMD_SE;
    while (SPI(0).CMD) {};
    wait_idle(chip);

    return 0;
}

/**
 * Reverse engineered implementation of spi_flash.o:sdk_SPIEraseSector
 */
static uint32_t IRAM spi_erase_sector(uint32_t sector)
{
    if (sector >= (sdk_flashchip.chip_size / sdk_flashchip.sector_size)) {
        return 1;
    }

    if (write_enable(&sdk_flashchip)) {
        return 1;
    }

    if (sector_erase(&sdk_flashchip, sdk_flashchip.sector_size * sector)) {
        return 1;
    }
    return 0;
}

/**
 * Reverse engineered implementation of spi_flash.o:sdk_spi_flash_erase_sector
 */
uint32_t IRAM esp_spi_flash_erase(uint32_t sector)
{
    vPortEnterCritical();
    Cache_Read_Disable();

    uint32_t result = spi_erase_sector(sector);

    Cache_Read_Enable(0, 0, 1);
    vPortExitCritical();

    return result;
}

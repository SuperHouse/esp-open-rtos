/**
 * The MIT License (MIT)
 *
 * Copyright (c) 2016 sheinz (https://github.com/sheinz)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
#include "esp_spiffs_flash.h"
#include "flashchip.h"
#include "espressif/spi_flash.h"
#include "FreeRTOS.h"
#include "esp/rom.h"
#include "esp/spi_regs.h"
#include <string.h>

/**
 * Note about Wait_SPI_Idle.
 *
 * Each write/erase flash operation sets BUSY bit in flash status register.
 * If attempt to access flash while BUSY bit is set operation will fail.
 * Function Wait_SPI_Idle loops until this bit is not cleared.
 *
 * The approach in the following code is that each write function that is
 * accessible from the outside should leave flash in Idle state.
 * The read operations doesn't set BUSY bit in a flash. So they do not wait.
 * They relay that previous operation is completely finished.
 *
 * This approach is different from ESP8266 bootrom where Wait_SPI_Idle is
 * called where it needed and not.
 */

#define SPI_WRITE_MAX_SIZE  64

// 64 bytes read causes hang
// http://bbs.espressif.com/viewtopic.php?f=6&t=2439
#define SPI_READ_MAX_SIZE   60


/**
 * Copy unaligned data to 4-byte aligned destination buffer.
 *
 * @param words Number of 4-byte words to write.
 *
 * @see unaligned_memcpy.S
 */
void memcpy_unaligned_src(volatile uint32_t *dst, uint8_t *src, uint8_t words);

/**
 * Copy 4-byte aligned source data to unaligned destination buffer.
 *
 * @param bytes Number of byte to copy to dst.
 *
 * @see unaligned_memcpy.S
 */
void memcpy_unaligned_dst(uint8_t *dst, volatile uint32_t *src, uint8_t bytes);


/**
 * Low level SPI flash write. Write block of data up to 64 bytes.
 */
static inline void IRAM spi_write_data(sdk_flashchip_t *chip, uint32_t addr,
        uint8_t *buf, uint32_t size)
{
    uint32_t words = size >> 2;
    if (size & 0b11) {
        words++;
    }

    Wait_SPI_Idle(chip);  // wait for previous write to finish

    SPI(0).ADDR = (addr & 0x00FFFFFF) | (size << 24);

    memcpy_unaligned_src(SPI(0).W, buf, words);

    SPI_write_enable(chip);

    SPI(0).CMD = SPI_CMD_PP;
    while (SPI(0).CMD) {}
}

/**
 * Write a page of flash. Data block should not cross page boundary.
 */
static uint32_t IRAM spi_write_page(sdk_flashchip_t *flashchip, uint32_t dest_addr,
    uint8_t *buf, uint32_t size)
{
    // check if block to write doesn't cross page boundary
    if (flashchip->page_size < size + (dest_addr % flashchip->page_size)) {
        return ESP_SPIFFS_FLASH_ERROR;
    }

    if (size < 1) {
        return ESP_SPIFFS_FLASH_OK;
    }

    while (size >= SPI_WRITE_MAX_SIZE) {
        spi_write_data(flashchip, dest_addr, buf, SPI_WRITE_MAX_SIZE);

        size -= SPI_WRITE_MAX_SIZE;
        dest_addr += SPI_WRITE_MAX_SIZE;
        buf += SPI_WRITE_MAX_SIZE;

        if (size < 1) {
            return ESP_SPIFFS_FLASH_OK;
        }
    }

    spi_write_data(flashchip, dest_addr, buf, size);

    return ESP_SPIFFS_FLASH_OK;
}

/**
 * Split block of data into pages and write pages.
 */
static uint32_t IRAM spi_write(uint32_t addr, uint8_t *dst, uint32_t size)
{
    if (sdk_flashchip.chip_size < (addr + size)) {
        return ESP_SPIFFS_FLASH_ERROR;
    }

    uint32_t write_bytes_to_page = sdk_flashchip.page_size -
        (addr % sdk_flashchip.page_size);  // TODO: place for optimization

    if (size < write_bytes_to_page) {
        if (spi_write_page(&sdk_flashchip, addr, dst, size)) {
            return ESP_SPIFFS_FLASH_ERROR;
        }
    } else {
        if (spi_write_page(&sdk_flashchip, addr, dst, write_bytes_to_page)) {
            return ESP_SPIFFS_FLASH_ERROR;
        }

        uint32_t offset = write_bytes_to_page;
        uint32_t pages_to_write = (size - offset) / sdk_flashchip.page_size;
        for (uint8_t i = 0; i != pages_to_write; i++) {
            if (spi_write_page(&sdk_flashchip, addr + offset,
                        dst + offset, sdk_flashchip.page_size)) {
                return ESP_SPIFFS_FLASH_ERROR;
            }
            offset += sdk_flashchip.page_size;
        }

        if (spi_write_page(&sdk_flashchip, addr + offset,
                    dst + offset, size - offset)) {
            return ESP_SPIFFS_FLASH_ERROR;
        }
    }

    return ESP_SPIFFS_FLASH_OK;
}

uint32_t IRAM esp_spiffs_flash_write(uint32_t addr, uint8_t *buf, uint32_t size)
{
    uint32_t result = ESP_SPIFFS_FLASH_ERROR;

    if (buf) {
        vPortEnterCritical();
        Cache_Read_Disable();

        result = spi_write(addr, buf, size);

        // make sure all write operations is finished before exiting
        Wait_SPI_Idle(&sdk_flashchip);

        Cache_Read_Enable(0, 0, 1);
        vPortExitCritical();
    }

    return result;
}

/**
 * Read SPI flash up to 64 bytes.
 */
static inline void IRAM read_block(sdk_flashchip_t *chip, uint32_t addr,
        uint8_t *buf, uint32_t size)
{
    SPI(0).ADDR = (addr & 0x00FFFFFF) | (size << 24);
    SPI(0).CMD = SPI_CMD_READ;

    while (SPI(0).CMD) {};

    memcpy_unaligned_dst(buf, SPI(0).W, size);
}

/**
 * Read SPI flash data. Data region doesn't need to be page aligned.
 */
static inline uint32_t IRAM read_data(sdk_flashchip_t *flashchip, uint32_t addr,
        uint8_t *dst, uint32_t size)
{
    if (size < 1) {
        return ESP_SPIFFS_FLASH_OK;
    }

    if ((addr + size) > flashchip->chip_size) {
        return ESP_SPIFFS_FLASH_ERROR;
    }

    while (size >= SPI_READ_MAX_SIZE) {
        read_block(flashchip, addr, dst, SPI_READ_MAX_SIZE);
        dst += SPI_READ_MAX_SIZE;
        size -= SPI_READ_MAX_SIZE;
        addr += SPI_READ_MAX_SIZE;
    }

    if (size > 0) {
        read_block(flashchip, addr, dst, size);
    }

    return ESP_SPIFFS_FLASH_OK;
}

uint32_t IRAM esp_spiffs_flash_read(uint32_t dest_addr, uint8_t *buf, uint32_t size)
{
    uint32_t result = ESP_SPIFFS_FLASH_ERROR;

    if (buf) {
        vPortEnterCritical();
        Cache_Read_Disable();

        result = read_data(&sdk_flashchip, dest_addr, buf, size);

        Cache_Read_Enable(0, 0, 1);
        vPortExitCritical();
    }

    return result;
}

uint32_t IRAM esp_spiffs_flash_erase_sector(uint32_t addr)
{
    if ((addr + sdk_flashchip.sector_size) > sdk_flashchip.chip_size) {
        return ESP_SPIFFS_FLASH_ERROR;
    }

    if (addr & 0xFFF) {
        return ESP_SPIFFS_FLASH_ERROR;
    }

    vPortEnterCritical();
    Cache_Read_Disable();

    SPI_write_enable(&sdk_flashchip);

    SPI(0).ADDR = addr & 0x00FFFFFF;
    SPI(0).CMD = SPI_CMD_SE;
    while (SPI(0).CMD) {};

    Wait_SPI_Idle(&sdk_flashchip);

    Cache_Read_Enable(0, 0, 1);
    vPortExitCritical();

    return ESP_SPIFFS_FLASH_OK;
}

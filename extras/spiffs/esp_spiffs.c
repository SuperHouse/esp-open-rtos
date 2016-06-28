/**
 * ESP8266 SPIFFS HAL configuration.
 *
 * Part of esp-open-rtos
 * Copyright (c) 2016 sheinz https://github.com/sheinz
 * MIT License
 */
#include "esp_spiffs.h"
#include "spiffs.h"
#include <espressif/spi_flash.h>
#include <stdbool.h>
#include "common_macros.h"
#include "FreeRTOS.h"
#include "esp/rom.h"

spiffs fs;

static void *work_buf = 0;
static void *fds_buf = 0;
static void *cache_buf = 0;


// ROM functions
uint32_t SPI_read_data(sdk_flashchip_t *p, uint32_t dest_addr, void *src,
        uint32_t size);
uint32_t SPI_page_program(sdk_flashchip_t *p, uint32_t dest_addr, void *dst,
        uint32_t size);
uint32_t SPI_write_enable(sdk_flashchip_t *p);
uint32_t SPI_sector_erase(sdk_flashchip_t *p, uint32_t sector_addr);


/**
 * Reverse engineered implementation of spi_flash.o:sdk_SPIRead
 */
uint32_t IRAM spi_read(uint32_t dest_addr, void *src, uint32_t size)
{
    if (SPI_read_data(&sdk_flashchip, dest_addr, src, size)) {
        return 1;
    } else {
        return 0;
    }
}

/**
 * Reverse engineered implementation of spi_flash.o:sdk_spi_flash_read
 */
uint32_t IRAM spi_flash_read(uint32_t dest_addr, void *src, uint32_t size)
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
uint32_t IRAM spi_write(uint32_t dest_addr, void *dst, uint32_t size)
{
    if (sdk_flashchip.chip_size < (dest_addr + size)) {
        return 1;
    }

    uint32_t write_bytes_to_page = sdk_flashchip.page_size -
        (dest_addr % sdk_flashchip.page_size);

    if (size < write_bytes_to_page) {
        if (SPI_page_program(&sdk_flashchip, dest_addr, dst, size)) {
            return 1;
        } else {
            return 0;
        }
    }

    if (SPI_page_program(&sdk_flashchip, dest_addr, dst, write_bytes_to_page)) {
        return 1;
    }

    uint32_t offset = write_bytes_to_page;
    uint32_t pages_to_write = (size - offset) / sdk_flashchip.page_size;
    for (uint8_t i = 0; i != pages_to_write; i++) {
        if (SPI_page_program(&sdk_flashchip, dest_addr + offset,
                    dst + ((offset>>2)<<2), sdk_flashchip.page_size)) {
            return 1;
        }
        offset += sdk_flashchip.page_size;
    }

    if (SPI_page_program(&sdk_flashchip, dest_addr + offset,
                dst + ((offset>>2)<<2), size - offset)) {
        return 1;
    } else {
        return 0;
    }
}

/**
 * Reverse engineered implementation of spi_flash.o:sdk_spi_flash_write
 */
uint32_t IRAM spi_flash_write(uint32_t dest_addr, void *dst, uint32_t size)
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

/**
 * Reverse engineered implementation of spi_flash.o:sdk_SPIEraseSector
 */
uint32_t IRAM spi_erase_sector(uint32_t sector)
{
    if (sector >= (sdk_flashchip.chip_size / sdk_flashchip.sector_size)) {
        return 1;
    }

    if (SPI_write_enable(&sdk_flashchip)) {
        return 1;
    }

    if (SPI_sector_erase(&sdk_flashchip, sdk_flashchip.sector_size * sector)) {
        return 1;
    }
    return 0;
}

/**
 * Reverse engineered implementation of spi_flash.o:sdk_spi_flash_erase_sector
 */
uint32_t IRAM spi_flash_erase_sector(uint32_t sector)
{
    vPortEnterCritical();
    Cache_Read_Disable();

    uint32_t result = spi_erase_sector(sector);

    Cache_Read_Enable(0, 0, 1);
    vPortExitCritical();

    return result;
}


/*
 * Flash addresses and size alignment is a rip-off of Arduino implementation.
 */

static s32_t esp_spiffs_read(u32_t addr, u32_t size, u8_t *dst)
{
    uint32_t result = SPIFFS_OK;
    uint32_t alignedBegin = (addr + 3) & (~3);
    uint32_t alignedEnd = (addr + size) & (~3);
    if (alignedEnd < alignedBegin) {
        alignedEnd = alignedBegin;
    }

    if (addr < alignedBegin) {
        uint32_t nb = alignedBegin - addr;
        uint32_t tmp;
        if (spi_flash_read(alignedEnd - 4, &tmp, 4) != SPI_FLASH_RESULT_OK) {
            printf("spi_flash_read failed\n");
            return SPIFFS_ERR_INTERNAL;
        }
        memcpy(dst, &tmp + 4 - nb, nb);
    }

    if (alignedEnd != alignedBegin) {
        if (spi_flash_read(alignedBegin,
                    (uint32_t*) (dst + alignedBegin - addr),
                    alignedEnd - alignedBegin) != SPI_FLASH_RESULT_OK) {
            printf("spi_flash_read failed\n");
            return SPIFFS_ERR_INTERNAL;
        }
    }

    if (addr + size > alignedEnd) {
        uint32_t nb = addr + size - alignedEnd;
        uint32_t tmp;
        if (spi_flash_read(alignedEnd, &tmp, 4) != SPI_FLASH_RESULT_OK) {
            printf("spi_flash_read failed\n");
            return SPIFFS_ERR_INTERNAL;
        }

        memcpy(dst + size - nb, &tmp, nb);
    }

    return result;
}

static const int UNALIGNED_WRITE_BUFFER_SIZE = 512;

static s32_t esp_spiffs_write(u32_t addr, u32_t size, u8_t *src)
{
    uint32_t alignedBegin = (addr + 3) & (~3);
    uint32_t alignedEnd = (addr + size) & (~3);
    if (alignedEnd < alignedBegin) {
        alignedEnd = alignedBegin;
    }

    if (addr < alignedBegin) {
        uint32_t ofs = alignedBegin - addr;
        uint32_t nb = (size < ofs) ? size : ofs;
        uint8_t tmp[4] __attribute__((aligned(4))) = {0xff, 0xff, 0xff, 0xff};
        memcpy(tmp + 4 - ofs, src, nb);
        if (spi_flash_write(alignedBegin - 4, (uint32_t*) tmp, 4)
                != SPI_FLASH_RESULT_OK) {
            printf("spi_flash_write failed\n");
            return SPIFFS_ERR_INTERNAL;
        }
    }

    if (alignedEnd != alignedBegin) {
        uint32_t* srcLeftover = (uint32_t*) (src + alignedBegin - addr);
        uint32_t srcAlign = ((uint32_t) srcLeftover) & 3;
        if (!srcAlign) {
            if (spi_flash_write(alignedBegin, (uint32_t*) srcLeftover,
                    alignedEnd - alignedBegin) != SPI_FLASH_RESULT_OK) {
                printf("spi_flash_write failed\n");
                return SPIFFS_ERR_INTERNAL;
            }
        }
        else {
            uint8_t buf[UNALIGNED_WRITE_BUFFER_SIZE];
            for (uint32_t sizeLeft = alignedEnd - alignedBegin; sizeLeft; ) {
                size_t willCopy = sizeLeft < sizeof(buf) ? sizeLeft : sizeof(buf);
                memcpy(buf, srcLeftover, willCopy);

                if (spi_flash_write(alignedBegin, (uint32_t*) buf, willCopy)
                        != SPI_FLASH_RESULT_OK) {
                    printf("spi_flash_write failed\n");
                    return SPIFFS_ERR_INTERNAL;
                }

                sizeLeft -= willCopy;
                srcLeftover += willCopy;
                alignedBegin += willCopy;
            }
        }
    }

    if (addr + size > alignedEnd) {
        uint32_t nb = addr + size - alignedEnd;
        uint32_t tmp = 0xffffffff;
        memcpy(&tmp, src + size - nb, nb);

        if (spi_flash_write(alignedEnd, &tmp, 4) != SPI_FLASH_RESULT_OK) {
            printf("spi_flash_write failed\n");
            return SPIFFS_ERR_INTERNAL;
        }
    }

    return SPIFFS_OK;
}

static s32_t esp_spiffs_erase(u32_t addr, u32_t size)
{
    if (addr % SPI_FLASH_SEC_SIZE) {
        printf("Unaligned erase addr=%x\n", addr);
    }
    if (size % SPI_FLASH_SEC_SIZE) {
        printf("Unaligned erase size=%d\n", size);
    }

    const uint32_t sector = addr / SPI_FLASH_SEC_SIZE;
    const uint32_t sectorCount = size / SPI_FLASH_SEC_SIZE;

    for (uint32_t i = 0; i < sectorCount; ++i) {
        spi_flash_erase_sector(sector + i);
    }
    return SPIFFS_OK;
}

int32_t esp_spiffs_mount()
{
    spiffs_config config = {0};

    config.hal_read_f = esp_spiffs_read;
    config.hal_write_f = esp_spiffs_write;
    config.hal_erase_f = esp_spiffs_erase;

    size_t workBufSize = 2 * SPIFFS_CFG_LOG_PAGE_SZ();
    size_t fdsBufSize = SPIFFS_buffer_bytes_for_filedescs(&fs, 5);
    size_t cacheBufSize = SPIFFS_buffer_bytes_for_cache(&fs, 5);

    work_buf = malloc(workBufSize);
    fds_buf = malloc(fdsBufSize);
    cache_buf = malloc(cacheBufSize);
    printf("spiffs memory, work_buf_size=%d, fds_buf_size=%d, cache_buf_size=%d\n",
            workBufSize, fdsBufSize, cacheBufSize);

    int32_t err = SPIFFS_mount(&fs, &config, work_buf, fds_buf, fdsBufSize,
            cache_buf, cacheBufSize, 0);

    if (err != SPIFFS_OK) {
        printf("Error spiffs mount: %d\n", err);
    }

    return err;
}

void esp_spiffs_unmount()
{
    SPIFFS_unmount(&fs);

    free(work_buf);
    free(fds_buf);
    free(cache_buf);

    work_buf = 0;
    fds_buf = 0;
    cache_buf = 0;
}

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
#include <esp/uart.h>
#include <fcntl.h>

spiffs fs;

typedef struct {
    void *buf;
    uint32_t size;
} fs_buf_t;

static fs_buf_t work_buf = {0};
static fs_buf_t fds_buf = {0};
static fs_buf_t cache_buf = {0};

/**
 * Number of file descriptors opened at the same time
 */
#define ESP_SPIFFS_FD_NUMBER       5

#define ESP_SPIFFS_CACHE_PAGES     5


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

void esp_spiffs_init()
{
    work_buf.size = 2 * SPIFFS_CFG_LOG_PAGE_SZ();
    fds_buf.size = SPIFFS_buffer_bytes_for_filedescs(&fs, ESP_SPIFFS_FD_NUMBER);
    cache_buf.size= SPIFFS_buffer_bytes_for_cache(&fs, ESP_SPIFFS_CACHE_PAGES);

    work_buf.buf = malloc(work_buf.size);
    fds_buf.buf = malloc(fds_buf.size);
    cache_buf.buf = malloc(cache_buf.size);
}

void esp_spiffs_deinit()
{
    free(work_buf.buf);
    work_buf.buf = 0;

    free(fds_buf.buf);
    fds_buf.buf = 0;

    free(cache_buf.buf);
    cache_buf.buf = 0;
}

int32_t esp_spiffs_mount()
{
    spiffs_config config = {0};

    config.hal_read_f = esp_spiffs_read;
    config.hal_write_f = esp_spiffs_write;
    config.hal_erase_f = esp_spiffs_erase;

    printf("SPIFFS size: %d\n", SPIFFS_SIZE);
    printf("SPIFFS memory, work_buf_size=%d, fds_buf_size=%d, cache_buf_size=%d\n",
            work_buf.size, fds_buf.size, cache_buf.size);

    int32_t err = SPIFFS_mount(&fs, &config, (uint8_t*)work_buf.buf, 
            (uint8_t*)fds_buf.buf, fds_buf.size, 
            cache_buf.buf, cache_buf.size, 0);

    if (err != SPIFFS_OK) {
        printf("Error spiffs mount: %d\n", err);
    }

    return err;
}

#define FD_OFFSET 3

// This implementation replaces implementation in core/newlib_syscals.c
long _write_r(struct _reent *r, int fd, const char *ptr, int len )
{
    if(fd != r->_stdout->_file) {
        long ret = SPIFFS_write(&fs, (spiffs_file)(fd - FD_OFFSET), 
                (char*)ptr, len);
        return ret;
    }
    for(int i = 0; i < len; i++) {
        /* Auto convert CR to CRLF, ignore other LFs (compatible with Espressif SDK behaviour) */
        if(ptr[i] == '\r')
            continue;
        if(ptr[i] == '\n')
            uart_putc(0, '\r');
        uart_putc(0, ptr[i]);
    }
    return len;
}

// This implementation replaces implementation in core/newlib_syscals.c
long _read_r( struct _reent *r, int fd, char *ptr, int len )
{
    int ch, i;

    if(fd != r->_stdin->_file) {
        long ret = SPIFFS_read(&fs, (spiffs_file)(fd - FD_OFFSET), ptr, len);
        return ret;
    }
    uart_rxfifo_wait(0, 1);
    for(i = 0; i < len; i++) {
        ch = uart_getc_nowait(0);
        if (ch < 0) break;
        ptr[i] = ch;
    }
    return i;
}

int _open_r(struct _reent *r, const char *pathname, int flags, int mode)
{
    uint32_t spiffs_flags = SPIFFS_RDONLY;

    if (flags & O_CREAT)    spiffs_flags |= SPIFFS_CREAT;
    if (flags & O_APPEND)   spiffs_flags |= SPIFFS_APPEND;
    if (flags & O_TRUNC)    spiffs_flags |= SPIFFS_TRUNC;
    if (flags & O_RDONLY)   spiffs_flags |= SPIFFS_RDONLY;
    if (flags & O_WRONLY)   spiffs_flags |= SPIFFS_WRONLY;

    int ret = SPIFFS_open(&fs, pathname, spiffs_flags, mode);
    if (ret > 0) {
        return ret + FD_OFFSET;
    }
    return ret;
}

int _close_r(struct _reent *r, int fd)
{
    return SPIFFS_close(&fs, (spiffs_file)(fd - FD_OFFSET));
}

int _unlink_r(struct _reent *r, const char *path)
{
    return SPIFFS_remove(&fs, path);
}

int _fstat_r(struct _reent *r, int fd, void *buf)
{
    spiffs_stat s;
    struct stat *sb = (struct stat*)buf;

    int result = SPIFFS_fstat(&fs, (spiffs_file)(fd - FD_OFFSET), &s);
    sb->st_size = s.size;

    return result;
}

int _stat_r(struct _reent *r, const char *pathname, void *buf)
{
    spiffs_stat s;
    struct stat *sb = (struct stat*)buf;

    int result = SPIFFS_stat(&fs, pathname, &s);
    sb->st_size = s.size;

    return result;
}

off_t _lseek_r(struct _reent *r, int fd, off_t offset, int whence)
{   
    return SPIFFS_lseek(&fs, (spiffs_file)(fd - FD_OFFSET), offset, whence);
}

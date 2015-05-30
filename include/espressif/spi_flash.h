/* 
 * copyright (c) Espressif System 2010
 * 
 */

#ifndef __SPI_FLASH_H__
#define __SPI_FLASH_H__

typedef enum {
    SPI_FLASH_RESULT_OK,
    SPI_FLASH_RESULT_ERR,
    SPI_FLASH_RESULT_TIMEOUT
} sdk_SpiFlashOpResult;

#define SPI_FLASH_SEC_SIZE      4096

uint32_t sdk_spi_flash_get_id(void);
sdk_SpiFlashOpResult sdk_spi_flash_read_status(uint32_t *status);
sdk_SpiFlashOpResult sdk_spi_flash_write_status(uint32_t status_value);
sdk_SpiFlashOpResult sdk_spi_flash_erase_sector(uint16_t sec);
sdk_SpiFlashOpResult sdk_spi_flash_write(uint32_t des_addr, uint32_t *src_addr, uint32_t size);
sdk_SpiFlashOpResult sdk_spi_flash_read(uint32_t src_addr, uint32_t *des_addr, uint32_t size);

#endif

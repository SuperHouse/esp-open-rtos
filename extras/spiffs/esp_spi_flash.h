#ifndef __ESP_SPI_FLASH_H__
#define __ESP_SPI_FLASH_H__

#include <stdint.h>
#include "common_macros.h"

uint32_t IRAM esp_spi_flash_read(uint32_t dest_addr, void *src, uint32_t size);
uint32_t IRAM esp_spi_flash_write(uint32_t dest_addr, void *dst, uint32_t size);
uint32_t IRAM esp_spi_flash_erase(uint32_t sector);

#endif  // __ESP_SPI_FLASH_H__

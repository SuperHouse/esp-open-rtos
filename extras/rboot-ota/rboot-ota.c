#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <espressif/spi_flash.h>
#include <espressif/esp_system.h>

#include <FreeRTOS.h>
#include <task.h>

#include "rboot-ota.h"

#define ROM_MAGIC_OLD 0xe9
#define ROM_MAGIC_NEW 0xea
#define CHECKSUM_INIT 0xef

#if 0
#define RBOOT_DEBUG(f_, ...) printf((f_), __VA_ARGS__)
#else
#define RBOOT_DEBUG(f_, ...)
#endif

typedef struct __attribute__((packed)) {
    uint8_t magic;
    uint8_t section_count;
    uint8_t val[2]; /* flash size & speed when placed @ offset 0, I think ignored otherwise */
    uint32_t entrypoint;
} image_header_t;

typedef struct __attribute__((packed)) {
    uint32_t load_addr;
    uint32_t length;
} section_header_t;


// get the rboot config
rboot_config_t rboot_get_config() {
	rboot_config_t conf;
	sdk_spi_flash_read(BOOT_CONFIG_SECTOR * SECTOR_SIZE, (uint32_t*)&conf, sizeof(rboot_config_t));
	return conf;
}

// write the rboot config
// preserves contents of rest of sector, so rest
// of sector can be used to store user data
// updates checksum automatically, if enabled
bool rboot_set_config(rboot_config_t *conf) {
	uint8_t *buffer;
#ifdef RBOOT_CONFIG_CHKSUM
	uint8_t chksum;
	uint8_t *ptr;
#endif

	buffer = (uint8_t*)malloc(SECTOR_SIZE);
	if (!buffer) {
		printf("rboot_set_config: Failed to allocate sector buffer\r\n");
		return false;
	}

#ifdef BOOT_CONFIG_CHKSUM
	chksum = CHKSUM_INIT;
	for (ptr = (uint8_t*)conf; ptr < &conf->chksum; ptr++) {
		chksum ^= *ptr;
	}
	conf->chksum = chksum;
#endif

	sdk_spi_flash_read(BOOT_CONFIG_SECTOR * SECTOR_SIZE, (uint32_t*)buffer, SECTOR_SIZE);
	memcpy(buffer, conf, sizeof(rboot_config_t));
        vPortEnterCritical();
	sdk_spi_flash_erase_sector(BOOT_CONFIG_SECTOR);
        vPortExitCritical();
        taskYIELD();
        vPortEnterCritical();
	sdk_spi_flash_write(BOOT_CONFIG_SECTOR * SECTOR_SIZE, (uint32_t*)buffer, SECTOR_SIZE);
        vPortExitCritical();
	free(buffer);
	return true;
}

// get current boot rom
uint8_t rboot_get_current_rom() {
	rboot_config_t conf;
	conf = rboot_get_config();
	return conf.current_rom;
}

// set current boot rom
bool rboot_set_current_rom(uint8_t rom) {
	rboot_config_t conf;
	conf = rboot_get_config();
	if (rom >= conf.count) return false;
	conf.current_rom = rom;
	return rboot_set_config(&conf);
}

// Check that a valid-looking rboot image is found at this offset on the flash, and
// takes up 'expected_length' bytes.
bool rboot_verify_image(uint32_t offset, uint32_t expected_length, const char **error_message)
{
    char *error = NULL;
    if(offset % 4) {
        error = "Unaligned flash offset";
        goto fail;
    }

    uint32_t end_offset = offset + expected_length;
    image_header_t image_header;
    sdk_spi_flash_read(offset, (uint32_t *)&image_header, sizeof(image_header_t));
    offset += sizeof(image_header_t);

    if(image_header.magic != ROM_MAGIC_OLD && image_header.magic != ROM_MAGIC_NEW) {
        error = "Missing initial magic";
        goto fail;
    }

    bool is_new_header = (image_header.magic == ROM_MAGIC_NEW); /* a v1.2/rboot header, so expect a v1.1 header after the initial section */

    int remaining_sections = image_header.section_count;

    uint8_t checksum = CHECKSUM_INIT;

    while(remaining_sections > 0 && offset < end_offset)
    {
        /* read section header */
        section_header_t header;
        sdk_spi_flash_read(offset, (uint32_t *)&header, sizeof(section_header_t));
        RBOOT_DEBUG("Found section @ 0x%08lx length 0x%08lx load 0x%08lx padded 0x%08lx\r\n", offset, header.length, header.load_addr, header.length);
        offset += sizeof(section_header_t);


        if(header.length+offset > end_offset) {
            break; /* sanity check: will reading section take us off end of expected flashregion? */
        }

        if(!is_new_header) {
            /* Add individual data of the section to the checksum. */
            char chunk[16];
            for(int i = 0; i < header.length; i++) {
                if(i % sizeof(chunk) == 0)
                    sdk_spi_flash_read(offset+i, (uint32_t *)chunk, sizeof(chunk));
                checksum ^= chunk[i % sizeof(chunk)];
            }
        }

        offset += header.length;
        /* pad section to 4 byte align */
        offset = (offset+3) & ~3;

        remaining_sections--;

        if(is_new_header) {
            /* pad to a 16 byte offset */
            offset = (offset+15) & ~15;

            /* expect a v1.1 header here at start of "real" sections */
            sdk_spi_flash_read(offset, (uint32_t *)&image_header, sizeof(image_header_t));
            offset += sizeof(image_header_t);
            if(image_header.magic != ROM_MAGIC_OLD) {
                error = "Bad second magic";
                goto fail;
            }
            remaining_sections = image_header.section_count;
            is_new_header = false;
        }
    }

    if(remaining_sections > 0) {
        error = "Image truncated";
        goto fail;
    }

    /* add a byte for the image checksum (actually comes after the padding) */
    offset++;
    /* pad the image length to a 16 byte boundary */
    offset = (offset+15) & ~15;

    uint8_t read_checksum;
    sdk_spi_flash_read(offset-1, (uint32_t *)&read_checksum, 1); /* not sure if this will work */
    if(read_checksum != checksum) {
        error = "Invalid checksum";
        goto fail;
    }

    if(offset != end_offset) {
        error = "Wrong length";
        goto fail;
    }

    RBOOT_DEBUG("rboot_verify_image: verified expected 0x%08lx bytes.\r\n", expected_length);
    return true;

 fail:
    if(error_message)
        *error_message = error;
    printf("%s: %s\r\n", __func__, error);
    return false;
}

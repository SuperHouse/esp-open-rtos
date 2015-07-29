#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <espressif/spi_flash.h>
#include <espressif/esp_system.h>

#include <lwip/sockets.h>

#include <FreeRTOS.h>
#include <task.h>

#define SECTOR_SIZE 0x1000
#define BOOT_CONFIG_SECTOR 1

#include "rboot-ota.h"

#define ROM_MAGIC_OLD 0xe9
#define ROM_MAGIC_NEW 0xea


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
		printf("Failed to allocate sector buffer\r\n");
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

int rboot_ota_update(int fd, int slot, bool reboot_now)
{
    rboot_config_t conf;
    conf = rboot_get_config();

    if(slot == -1) {
        slot = (conf.current_rom + 1) % RBOOT_MAX_ROMS;
    }

    size_t sector = conf.roms[slot] / SECTOR_SIZE;
    uint8_t *sector_buf = (uint8_t *)malloc(SECTOR_SIZE);
    if(!sector_buf) {
        printf("Failed to malloc sector buffer\r\n");
        return 0;
    }

    printf("New image going into sector %d @ 0x%lx\r\n", slot, conf.roms[slot]);

    /* Read bootloader header */
    int r = read(fd, sector_buf, 8);
    if(r != 8 || (sector_buf[0] != ROM_MAGIC_OLD && sector_buf[0] != ROM_MAGIC_NEW)) {
        printf("Failed to read ESP bootloader header r=%d magic=%d.\r\n", r, sector_buf[0]);
        slot = -1;
        goto cleanup;
    }
    /* if we saw a v1.2 header, we can expect a v1.1 header after the first section */
    bool in_new_header = (sector_buf[0] == ROM_MAGIC_NEW);

    int remaining_sections = sector_buf[1];
    size_t offs = 8;
    size_t total_read = 8;
    size_t left_section = 0; /* Number of bytes left in this section */

    while(remaining_sections > 0 || left_section > 0)
    {
        if(left_section == 0) {
            /* No more bytes in this section, read the next section header */

            if(offs + (in_new_header ? 16 : 8) > SECTOR_SIZE) {
                printf("PANIC: reading section header overflows sector boundary. FIXME.\r\n");
                slot = -1;
                goto cleanup;
            }

            if(in_new_header && total_read > 8)
            {
                /* expecting an "old" style 8 byte image header here, following irom0 */
                int r = read(fd, sector_buf+offs, 8);
                if(r != 8 || sector_buf[offs] != ROM_MAGIC_OLD) {
                    printf("Failed to read second flash header r=%d magic=0x%02x.\r\n", r, sector_buf[offs]);
                    slot = -1;
                    goto cleanup;
                }
                /* treat this number as the reliable number of remaining sections */
                remaining_sections = sector_buf[offs+1];
                in_new_header = false;
            }

            int r = read(fd, sector_buf+offs, 8);
            if(r != 8) {
                printf("Failed to read section header.\r\n");
                slot = -1;
                goto cleanup;
            }
            offs += 8;
            total_read += 8;
            left_section = *((uint32_t *)(sector_buf+offs-4));

            /* account for padding from the reported section size out to the alignment barrier */
            size_t section_align = in_new_header ? 16 : 4;
            left_section = (left_section+section_align-1) & ~(section_align-1);

            remaining_sections--;
            printf("New section @ 0x%x length 0x%x align 0x%x remaining 0x%x\r\n", total_read, left_section, section_align, remaining_sections);
        }

        size_t bytes_to_read = left_section > (SECTOR_SIZE-offs) ? (SECTOR_SIZE-offs) : left_section;
        int r = read(fd, sector_buf+offs, bytes_to_read);
        if(r < 0) {
            printf("Failed to read from fd\r\n");
            slot = -1;
            goto cleanup;
        }
        if(r == 0) {
            printf("EOF before end of image remaining_sections=%d this_section=%d\r\n",
                   remaining_sections, left_section);
            slot = -1;
            goto cleanup;
        }
        offs += r;
        total_read += r;
        left_section -= r;

        if(offs == SECTOR_SIZE || (left_section == 0 && remaining_sections == 0)) {
            /* sector buffer is full, or we're at the very end, so write sector to flash */
            printf("Sector buffer full. Erasing sector 0x%02x\r\n", sector);
            sdk_spi_flash_erase_sector(sector);
            printf("Erase done.\r\n");
            //sdk_spi_flash_write(sector * SECTOR_SIZE, (uint32_t*)sector_buf, SECTOR_SIZE);
            printf("Flash done.\r\n");
            offs = 0;
            sector++;
        }
    }

    /* Done reading image from fd and writing it out */
    if(reboot_now)
    {
        close(fd);
        conf.current_rom = slot;
        rboot_set_config(&conf);
        sdk_system_restart();
    }

 cleanup:
    free(sector_buf);
    return slot;
}


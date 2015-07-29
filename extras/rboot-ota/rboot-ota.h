#ifndef __RBOOT_OTA_H__
#define __RBOOTOTA_H__
/* rboot-ota client API
 *
 * Ported from https://github.com/raburton/esp8266/ to esp-open-rtos
 *
 * BSD Licensed as per the file LICENSE in the top-level directory.
 * Copyright (c) 2015 Richard A Burton & SuperHouse Pty Ltd
 */
#include <stdint.h>
#include <rboot-config.h>

/* rboot config block structure (stored in flash offset 0x1000)
 *
 * Structure taken from rboot.h revision a4724ede22
 * The version of rboot you're using has to match this structure
 */
typedef struct {
        uint8_t magic;               // our magic
        uint8_t version;             // config struct version
        uint8_t mode;                        // boot loader mode
        uint8_t current_rom;         // currently selected rom
        uint8_t gpio_rom;            // rom to use for gpio boot
        uint8_t count;               // number of roms in use
        uint8_t unused[2];           // padding
        uint32_t roms[RBOOT_MAX_ROMS]; // flash addresses of the roms
#ifdef RBOOT_CONFIG_CHKSUM
        uint8_t chksum;              // config chksum
#endif
} rboot_config_t;


// timeout for the initial connect (in ms)
#define OTA_CONNECT_TIMEOUT  10000

// timeout for the download and flash to complete (in ms), once connected
#define OTA_DOWNLOAD_TIMEOUT 20000

#define UPGRADE_FLAG_IDLE		0x00
#define UPGRADE_FLAG_START		0x01
#define UPGRADE_FLAG_FINISH		0x02

#define FLASH_BY_ADDR 0xff

/* Perform an OTA update.
 *
 * * 'fd' is the file descriptor to read the OTA image from.
 * * 'slot' is the slot to update, or -1 to automatically update next slot.
 * * 'reboot_now' means to reboot to the new slot immediately
 *   (if true, function won't return if successful).
 *
 * Returns '0' if the update fails. Returns the newly loaded slot if
 * reboot_now is false, and the update succeeds so the next restart
 * will hit the new image.
 */
int rboot_ota_update(int fd, int slot, bool reboot_now);
rboot_config_t rboot_get_config();
bool rboot_set_config(rboot_config_t *conf);
uint8_t rboot_get_current_rom();
bool rboot_set_current_rom(uint8_t rom);

#endif

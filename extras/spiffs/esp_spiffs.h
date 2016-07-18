/**
 * ESP8266 SPIFFS HAL configuration.
 *
 * Part of esp-open-rtos
 * Copyright (c) 2016 sheinz https://github.com/sheinz
 * MIT License
 */
#ifndef __ESP_SPIFFS_H__
#define __ESP_SPIFFS_H__

#include "spiffs.h"

extern spiffs fs;

/**
 * Prepare for SPIFFS mount.
 *
 * The function allocates all the necessary buffers.
 */
void esp_spiffs_init();

/**
 * Free all memory buffers that were used by SPIFFS.
 *
 * The function should be called after SPIFFS unmount if the file system is not
 * going to need any more.
 */
void esp_spiffs_deinit();

/**
 * Mount SPIFFS.
 *
 * esp_spiffs_init must be called first.
 *
 * Return SPIFFS return code.
 */
int32_t esp_spiffs_mount();

#endif  // __ESP_SPIFFS_H__

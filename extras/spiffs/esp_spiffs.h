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
 * Provide SPIFFS with all necessary configuration, allocate memory buffers
 * and mount SPIFFS.
 *
 * Return SPIFFS return code.
 */
int32_t esp_spiffs_mount();

/**
 * Unmount SPIFFS and free all allocated buffers.
 */
void esp_spiffs_unmount();

#endif  // __ESP_SPIFFS_H__

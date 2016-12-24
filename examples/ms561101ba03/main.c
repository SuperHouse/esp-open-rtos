/*
 * Example of using MS561101ba03 driver
 *
 * Copyright (C) 2016 Bernhard Guillon <Bernhard.Guillon@web.de>
 *
 * Loosely based on main.c with:
 * Copyright (C) 2016 Ruslan V. Uss <unclerus@gmail.com>
 * BSD Licensed as described in the file LICENSE
 */
#include <esp/uart.h>
#include <espressif/esp_common.h>
#include <stdio.h>
#include <i2c/i2c.h>
#include <ms561101ba03/ms561101ba03.h>

#define SCL_PIN 5
#define SDA_PIN 4

void user_init(void)
{
    i2c_init(SCL_PIN, SDA_PIN);

    uart_set_baud(0, 115200);
    printf("SDK version:%s\n\n", sdk_system_get_sdk_version());

    ms561101ba03_t device = {
        .addr = MS561101BA03_ADDR_CSB_LOW,
        .osr  = MS561101BA03_OSR_4096,
    };

    while (!ms561101ba03_init(&device))
        printf("Device not found\n");

    while (true)
    {
        if (!ms561101ba03_get_sensor_data(&device))
            printf("Error reading sensor data from device");
        printf("Temperature in C * 100: %i \nPressure in mbar * 100: %i\n", device.result.temperature, device.result.pressure);
    }
}

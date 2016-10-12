/*
 * Example of using HMC5883L driver
 *
 * Part of esp-open-rtos
 * Copyright (C) 2016 Ruslan V. Uss <unclerus@gmail.com>
 * BSD Licensed as described in the file LICENSE
 */
#include <esp/uart.h>
#include <espressif/esp_common.h>
#include <stdio.h>
#include <i2c/i2c.h>
#include <hmc5883l/hmc5883l.h>

#define SCL_PIN 5
#define SDA_PIN 4

void user_init(void)
{
    uart_set_baud(0, 115200);
    printf("SDK version:%s\n\n", sdk_system_get_sdk_version());

    i2c_init(SCL_PIN, SDA_PIN);

    while (!hmc5883l_init())
        printf("Device not found\n");

    hmc5883l_set_operating_mode(HMC5883L_MODE_CONTINUOUS);
    hmc5883l_set_samples_averaged(HMC5883L_SAMPLES_8);
    hmc5883l_set_data_rate(HMC5883L_DATA_RATE_07_50);
    hmc5883l_set_gain(HMC5883L_GAIN_1090);

    while (true)
    {
        hmc5883l_data_t data;
        hmc5883l_get_data(&data);
        printf("Magnetic data: X:%.2f mG, Y:%.2f mG, Z:%.2f mG\n", data.x, data.y, data.z);

        for (uint32_t i = 0; i < 1000; i++)
            sdk_os_delay_us(250);
    }
}

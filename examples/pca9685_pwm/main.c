/*
 * Example of using PCA9685 PWM driver
 *
 * Part of esp-open-rtos
 * Copyright (C) 2016 Ruslan V. Uss <unclerus@gmail.com>
 * Public domain
 */
#include <esp/uart.h>
#include <espressif/esp_common.h>
#include <i2c/i2c.h>
#include <pca9685/pca9685.h>
#include <stdio.h>

#define ADDR 0x40

#define SCL_PIN 5
#define SDA_PIN 4

#define PWM_FREQ 500

void user_init(void)
{
    uart_set_baud(0, 115200);
    printf("SDK version:%s\n", sdk_system_get_sdk_version());

    i2c_init(SCL_PIN, SDA_PIN);

    pca9685_init(ADDR);

    pca9685_set_pwm_frequency(ADDR, 1000);
    printf("Freq 1000Hz, real %d\n", pca9685_get_pwm_frequency(ADDR));

    uint16_t val = 0;
    while (true)
    {
        printf("Set ch0 to %d, ch4 to %d\n", val, 4096 - val);
        pca9685_set_pwm_value(ADDR, 0, val);
        pca9685_set_pwm_value(ADDR, 4, 4096 - val);

        if (val++ == 4096)
            val = 0;
    }
}

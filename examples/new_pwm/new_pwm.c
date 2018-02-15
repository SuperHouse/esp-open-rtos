/* Very basic example to test the pwm library
 * Hook up an LED to pin14 and you should see the intensity change
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Javier Cardona (https://github.com/jcard0na)
 * BSD Licensed as described in the file LICENSE
 */
#include "espressif/esp_common.h"
#include "esp/uart.h"
#include "FreeRTOS.h"
#include "task.h"
#include "new_pwm.h"

#define PWM_CHANNELS 3
const uint32_t period = 5000; // * 200ns ^= 1 kHz

// PWM setup
uint32_t io_info[PWM_CHANNELS][3] = {
    {0, 0, 12},
    {0, 0, 13},
    {0, 0, 15},
};

// Initial duty: all off
uint32_t pwm_duty_init[PWM_CHANNELS] = {0};

void pwm_task(void *pvParameters)
{
    uint32_t counts[PWM_CHANNELS] = {0, 1000, 3000};
    while(1) {
        vTaskDelay(10);
        for (uint8_t ii=0; ii<PWM_CHANNELS; ii++) {
            pwm_set_duty(counts[ii], ii);
            counts[ii] += period/32;
            if (counts[ii] > period)
                counts[ii] = 0;
        }
        pwm_start();
    }
}

void user_init(void)
{
    uart_set_baud(0, 115200);

    printf("SDK version:%s\n", sdk_system_get_sdk_version());

    printf("pwm_init()\n");
    pwm_init(period, pwm_duty_init, PWM_CHANNELS, io_info);

    printf("pwm_start()\n");
    pwm_start();

    xTaskCreate(pwm_task, "new_pwm", 256, NULL, 2, NULL);
}

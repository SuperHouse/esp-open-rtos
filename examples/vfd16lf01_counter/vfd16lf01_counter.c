/*
 * Simple cunter that is displayed on 16lf01 VFD display.
 * Author: Grzegorz Hetman - ghetman@gmail.com
 */

#include "espressif/esp_common.h"
#include "esp/uart.h"
#include "FreeRTOS.h"
#include "task.h"

// Samsung VFD 16lf01 driver
#include "vfd16lf01/vfd16lf01.h"
 
void counter(void *pvParameters)
{
    uint8_t count = 0;

    uint8_t pin_clk = 15;
    uint8_t pin_rst = 13;
    uint8_t pin_data = 0;
    uint8_t digits = 16;
    uint8_t brightness = 31; // Range 0-31
    
    vfd_16lf01_init(pin_clk, pin_rst, pin_data, digits, brightness);
    vfd_16lf01_print("ESP-OPEN-RTOS ;)", pin_clk, pin_data);    

    vTaskDelay(5000 / portTICK_RATE_MS);

    while(1) {
        char msg[16];
        sprintf(msg, "Counter %d", count++);
        printf("%s\n", msg);
        vfd_16lf01_print(msg, pin_clk, pin_data);
        vTaskDelay(250 / portTICK_RATE_MS);
    }
}

void user_init(void)
{
    uart_set_baud(0, 115200);
    printf("SDK version:%s\n", sdk_system_get_sdk_version());
    xTaskCreate(&counter, (signed char *)"counter", 256, NULL, 2, NULL);
}


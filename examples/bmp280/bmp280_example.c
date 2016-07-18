#include <stdio.h>

#include "espressif/esp_common.h"
#include "esp/uart.h"

#include "FreeRTOS.h"
#include "task.h"

#include "bmp280/bmp280.h"

// In forced mode user initiate measurement each time.
// In normal mode measurement is done continuously with specified standby time. 
// #define MODE_FORCED

const uint8_t scl_pin = 5;
const uint8_t sda_pin = 4;

#ifdef MODE_FORCED
static void bmp280_task_forced(void *pvParameters)
{
    bmp280_params_t  params;
    float pressure, temperature;

    bmp280_init_default_params(&params);
    params.mode = BMP280_MODE_FORCED;

    while (1) {
        while (!bmp280_init(&params, scl_pin, sda_pin)) {
            printf("BMP280 initialization failed\n");
            vTaskDelay(1000 / portTICK_RATE_MS);
        }

        while(1) {
            vTaskDelay(1000 / portTICK_RATE_MS);
            if (!bmp280_force_measurement()) {
                printf("Failed initiating measurement\n");
                break;
            }
            while (bmp280_is_measuring()) {}; // wait for measurement to complete

            if (!bmp280_read(&temperature, &pressure)) {
                printf("Temperature/pressure reading failed\n");
                break;
            }
            printf("Pressure: %.2f Pa, Temperature: %.2f C\n", pressure, temperature);
        }
    }
}
#else
static void bmp280_task_normal(void *pvParameters)
{
    bmp280_params_t  params;
    float pressure, temperature;

    bmp280_init_default_params(&params);
    while (1) {
        while (!bmp280_init(&params, scl_pin, sda_pin)) {
            printf("BMP280 initialization failed\n");
            vTaskDelay(1000 / portTICK_RATE_MS);
        }

        while(1) {
            vTaskDelay(1000 / portTICK_RATE_MS);
            if (!bmp280_read(&temperature, &pressure)) {
                printf("Temperature/pressure reading failed\n");
                break;
            }
            printf("Pressure: %.2f Pa, Temperature: %.2f C\n", pressure, temperature);
        }
    }
}
#endif

void user_init(void)
{
    uart_set_baud(0, 115200);

    // Just some information
    printf("\n");
    printf("SDK version : %s\n", sdk_system_get_sdk_version());
    printf("GIT version : %s\n", GITSHORTREV);

#ifdef MODE_FORCED
    xTaskCreate(bmp280_task_forced, (signed char *)"bmp280_task", 256, NULL, 2, NULL);
#else
    xTaskCreate(bmp280_task_normal, (signed char *)"bmp280_task", 256, NULL, 2, NULL);
#endif
}

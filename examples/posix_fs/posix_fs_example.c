#include "espressif/esp_common.h"
#include "esp/uart.h"
#include "FreeRTOS.h"
#include "task.h"
#include "esp8266.h"
#include <stdio.h>

#include "esp_spiffs.h"
#include "spiffs.h"

#include "fs-test/fs_test.h"


void test_task(void *pvParameters)
{
    esp_spiffs_mount();
    esp_spiffs_unmount();  // FS must be unmounted before formating
    if (SPIFFS_format(&fs) == SPIFFS_OK) {
        printf("Format complete\n");
    } else {
        printf("Format failed\n");
    }
    esp_spiffs_mount();

    while (1) {
        vTaskDelay(5000 / portTICK_RATE_MS);

        if (fs_test_run(1000)) {
            printf("PASS\n");
        } else {
            printf("FAIL\n");
        }
    }
}

void user_init(void)
{
    uart_set_baud(0, 115200);

    xTaskCreate(test_task, (signed char *)"test_task", 1024, NULL, 2, NULL);
}

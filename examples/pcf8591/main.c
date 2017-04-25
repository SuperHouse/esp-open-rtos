#include <stdio.h>

#include "espressif/esp_common.h"
#include "esp/uart.h"

#include "FreeRTOS.h"
#include "task.h"

#include "i2c/i2c.h"
#include "pcf8591/pcf8591.h"

#define SCL_PIN 5
#define SDA_PIN 4

static void measure(void *pvParameters)
{
    while (1)
    {
        vTaskDelay(1000 / portTICK_PERIOD_MS);
        printf("Value: %d\n", pcf8591_read(PCF8591_DEFAULT_ADDRESS, 0x03));
    }
}

void user_init(void)
{
    uart_set_baud(0, 115200);

    // Just some information
    printf("\n");
    printf("SDK version : %s\n", sdk_system_get_sdk_version());
    printf("GIT version : %s\n", GITSHORTREV);

    i2c_init(SCL_PIN, SDA_PIN);

    xTaskCreate(measure, "measure_task", 256, NULL, 2, NULL);
}

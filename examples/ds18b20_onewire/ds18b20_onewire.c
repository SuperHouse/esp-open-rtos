/* ds18b20 - Retrieves temperature from ds18b20 sensors and print it out.
 *
 * This sample code is in the public domain.,
 */
#include "espressif/esp_common.h"
#include "esp/uart.h"

#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "queue.h"

// DS18B20 driver
#include "ds18b20/ds18b20.h"

void print_temperature(void *pvParameters)
{
    int delay = 500;
    uint8_t amount = 0;
    uint8_t sensors = 2;
    DSENSOR t[sensors];
    
    // Use GPIO 13 as one wire pin. 
    uint8_t GPIO_FOR_ONE_WIRE = 13;

    while(1) {
        // Search all DS18B20, return its amount and feed 't' structure with result data.
        amount = readDS18B20(GPIO_FOR_ONE_WIRE, t);

        if (amount < sensors){
            printf("Something is wrong, I expect to see %d sensors \nbut just %d was detected!\n", sensors, amount);
        }

        for (int i = 0; i < amount; ++i)
        {
            printf("Sensor %d report: %d.%d C\n",t[i].id, t[i].major, t[i].minor);
        }
        printf("\n");
        vTaskDelay(delay / portTICK_RATE_MS);
    }
}

void user_init(void)
{
    uart_set_baud(0, 115200);

    printf("SDK version:%s\n", sdk_system_get_sdk_version());

    xTaskCreate(&print_temperature, (signed char *)"get_task", 256, NULL, 2, NULL);
}


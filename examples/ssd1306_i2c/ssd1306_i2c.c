#include "espressif/esp_common.h"
#include "esp/uart.h"

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

#include <string.h>

#include "i2c/i2c.h"
#include "ssd1306/ssd1306.h"

#include "image.xbm"

/* Change this according to you schematics */
#define SCL_PIN GPIO_ID_PIN((14))
#define SDA_PIN GPIO_ID_PIN((12))

/* Local frame buffer */
static uint8_t buffer[SSD1306_ROWS * SSD1306_COLS / 8];

static void ssd1306_task(void *pvParameters)
{
    printf("%s: Started user interface task\n", __FUNCTION__);
    vTaskDelay(1000/portTICK_PERIOD_MS);


    if (ssd1306_load_xbm(image_bits, buffer))
        goto error_loop;

    ssd1306_set_whole_display_lighting(false);
    while (1) {
        vTaskDelay(2000 / portTICK_PERIOD_MS);
        printf("%s: steel alive\n", __FUNCTION__);
    }

error_loop:
    printf("%s: error while loading framebuffer into SSD1306\n", __func__);
    for(;;){
        vTaskDelay(2000 / portTICK_PERIOD_MS);
        printf("%s: error loop\n", __FUNCTION__);
    }
}

void user_init(void)
{
    // Setup HW
    uart_set_baud(0, 115200);

    printf("SDK version:%s\n", sdk_system_get_sdk_version());

    i2c_init(SCL_PIN, SDA_PIN);

    if (ssd1306_init()){
        for (;;) {
            printf("%s: failed to init SSD1306 lcd\n", __func__);
            vTaskDelay(1000/portTICK_PERIOD_MS);
        }
    }

    ssd1306_set_whole_display_lighting(true);
    vTaskDelay(1000/portTICK_PERIOD_MS);
    // Create user interface task
    xTaskCreate(ssd1306_task, "ssd1306_task", 256, NULL, 2, NULL);
}

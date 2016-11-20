#include <espressif/esp_common.h>
#include <esp/uart.h>
#include <FreeRTOS.h>
#include <task.h>
#include <queue.h>
#include <string.h>
#include <ssd1306/ssd1306.h>

/* Remove this line if your display connected by SPI */
#define I2C_CONNECTION

#ifdef I2C_CONNECTION
    #include <i2c/i2c.h>
#endif

#include "image.xbm"

/* Change this according to you schematics and display size */
#define DISPLAY_WIDTH  128
#define DISPLAY_HEIGHT 64

#ifdef I2C_CONNECTION
    #define PROTOCOL SSD1306_PROTO_I2C
    #define SCL_PIN  5
    #define SDA_PIN  4
#else
    #define PROTOCOL SSD1306_PROTO_SPI4
    #define CS_PIN   5
    #define DC_PIN   4
#endif

/* Declare device descriptor */
static const ssd1306_t dev = {
    .protocol = PROTOCOL,
#ifndef I2C_CONNECTION
    .cs_pin   = CS_PIN,
    .dc_pin   = DC_PIN,
#endif
    .width    = DISPLAY_WIDTH,
    .height   = DISPLAY_HEIGHT
};

/* Local frame buffer */
static uint8_t buffer[DISPLAY_WIDTH * DISPLAY_HEIGHT / 8];

static void ssd1306_task(void *pvParameters)
{
    printf("%s: Started user interface task\n", __FUNCTION__);
    vTaskDelay(1000/portTICK_PERIOD_MS);


    if (ssd1306_load_xbm(&dev, image_bits, buffer))
        goto error_loop;

    ssd1306_set_whole_display_lighting(&dev, false);
    bool fwd = false;
    while (1) {
        vTaskDelay(2000 / portTICK_PERIOD_MS);
        printf("%s: still alive, flipping!\n", __FUNCTION__);
        ssd1306_set_scan_direction_fwd(&dev, fwd);
        fwd = !fwd;
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

#ifdef I2C_CONNECTION
    i2c_init(SCL_PIN, SDA_PIN);
#endif

    while (ssd1306_init(&dev) != 0)
    {
        printf("%s: failed to init SSD1306 lcd\n", __func__);
        vTaskDelay(1000/portTICK_PERIOD_MS);
    }

    ssd1306_set_whole_display_lighting(&dev, true);
    vTaskDelay(1000/portTICK_PERIOD_MS);
    // Create user interface task
    xTaskCreate(ssd1306_task, "ssd1306_task", 256, NULL, 2, NULL);
}

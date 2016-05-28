/* The classic "blink" example
 *
 * This sample code is in the public domain.
 */
#include "espressif/esp_common.h"
#include "esp/uart.h"
#include "FreeRTOS.h"
#include "task.h"
#include "esp8266.h"

#include "mbedtls/aes.h"
#include "xtensa_ops.h"
#include <string.h>

const int gpio = 2;

/* This task uses the high level GPIO API (esp_gpio.h) to blink an LED.
 *
 */
void blinkenTask(void *pvParameters)
{
    gpio_enable(gpio, GPIO_OUTPUT);
    while(1) {
        gpio_write(gpio, 1);
        vTaskDelay(1000 / portTICK_RATE_MS);
        gpio_write(gpio, 0);
        vTaskDelay(1000 / portTICK_RATE_MS);
    }
}


/* This task demonstrates an alternative way to use raw register
   operations to blink an LED.

   The step that sets the iomux register can't be automatically
   updated from the 'gpio' constant variable, so you need to change
   the line that sets IOMUX_GPIO2 if you change 'gpio'.

   There is no significant performance benefit to this way over the
   blinkenTask version, so it's probably better to use the blinkenTask
   version.

   NOTE: This task isn't enabled by default, see the commented out line in user_init.
*/
void blinkenRegisterTask(void *pvParameters)
{
    GPIO.ENABLE_OUT_SET = BIT(gpio);
    IOMUX_GPIO2 = IOMUX_GPIO2_FUNC_GPIO | IOMUX_PIN_OUTPUT_ENABLE; /* change this line if you change 'gpio' */
    while(1) {
        GPIO.OUT_SET = BIT(gpio);
        vTaskDelay(1000 / portTICK_RATE_MS);
        GPIO.OUT_CLEAR = BIT(gpio);
        vTaskDelay(1000 / portTICK_RATE_MS);
    }
}

void user_init(void)
{
    uart_set_baud(0, 115200);
    static uint8_t data[1024];
    static uint8_t output[1024];
    static uint8_t iv[16];

    static uint8_t key[256 / 8];

    memset(data, 0, sizeof(data));
    memset(iv, 0, sizeof(iv));

    mbedtls_aes_context ctx;
    uint32_t before, after;
    RSR(before, CCOUNT)
    mbedtls_aes_init(&ctx);
    mbedtls_aes_setkey_enc(&ctx, key, 256);

    for(int r = 0; r < 10; r++) {
        mbedtls_aes_crypt_cbc(&ctx,
                              MBEDTLS_AES_ENCRYPT,
                              sizeof(data),
                              iv,
                              data,
                              output);
        memcpy(data, output, 1024);
    }
    RSR(after, CCOUNT);
    printf("cycle count %d\n", after - before);
    vPortExitCritical();
    while(1) {}
}

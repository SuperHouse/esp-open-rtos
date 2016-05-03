/* A very simple OTA example
 *
 * Binds a TCP socket, reads an image from it over TFTP and then flashes live.
 *
 * For more information about esp-open-rtos OTA see https://github.com/SuperHouse/esp-open-rtos/wiki/OTA-Update-Configuration
 *
 * NOT SUITABLE TO PUT ON THE INTERNET OR INTO A PRODUCTION ENVIRONMENT!!!!
 */
#include "espressif/esp_common.h"
#include "esp/uart.h"
#include "FreeRTOS.h"
#include "task.h"
#include "esp8266.h"
#include "ssid_config.h"

#include "ota-tftp.h"
#include "rboot.h"
#include "rboot-api.h"

#define TFTP_IMAGE_SERVER "192.168.1.23"
#define TFTP_IMAGE_FILENAME1 "firmware1.bin"
#define TFTP_IMAGE_FILENAME2 "firmware2.bin"

void tftp_client_task(void *pvParameters)
{
    printf("TFTP client task starting...\n");
    rboot_config conf;
    conf = rboot_get_config();
    int slot = (conf.current_rom + 1) % conf.count;
    printf("Image will be saved in OTA slot %d.\n", slot);
    if(slot == conf.current_rom) {
        printf("FATAL ERROR: Only one OTA slot is configured!\n");
        while(1) {}
    }

    /* Alternate between trying two different filenames. Probalby want to change this if making a practical
       example!

       Note: example will reboot into FILENAME1 if it is successfully downloaded, but FILENAME2 is ignored.
    */
    while(1) {
        printf("Downloading %s to slot %d...\n", TFTP_IMAGE_FILENAME1, slot);
        int res = ota_tftp_download(TFTP_IMAGE_SERVER, TFTP_PORT, TFTP_IMAGE_FILENAME1, 1000, slot);
        printf("ota_tftp_download %s result %d\n", TFTP_IMAGE_FILENAME1, res);
        if(res == 0) {
            printf("Rebooting into slot %d...\n", slot);
            rboot_set_current_rom(slot);
            sdk_system_restart();
        }
        vTaskDelay(5000 / portTICK_RATE_MS);

        printf("Downloading %s to slot %d...\n", TFTP_IMAGE_FILENAME2, slot);
        res = ota_tftp_download(TFTP_IMAGE_SERVER, TFTP_PORT, TFTP_IMAGE_FILENAME2, 1000, slot);
        printf("ota_tftp_download %s result %d\n", TFTP_IMAGE_FILENAME2, res);
        vTaskDelay(5000 / portTICK_RATE_MS);
    }
}

void user_init(void)
{
    uart_set_baud(0, 115200);

    rboot_config conf = rboot_get_config();
    printf("\r\n\r\nOTA Basic demo.\r\nCurrently running on flash slot %d / %d.\r\n\r\n",
           conf.current_rom, conf.count);

    printf("Image addresses in flash:\r\n");
    for(int i = 0; i <conf.count; i++) {
        printf("%c%d: offset 0x%08x\r\n", i == conf.current_rom ? '*':' ', i, conf.roms[i]);
    }

    struct sdk_station_config config = {
        .ssid = WIFI_SSID,
        .password = WIFI_PASS,
    };
    sdk_wifi_set_opmode(STATION_MODE);
    sdk_wifi_station_set_config(&config);

    ota_tftp_init_server(TFTP_PORT);
    xTaskCreate(&tftp_client_task, (signed char *)"tftp_client", 1024, NULL, 2, NULL);
}

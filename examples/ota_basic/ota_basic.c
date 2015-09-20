/* A very simple OTA example
 *
 * Binds a TCP socket, reads an image from it and then flashes live.
 *
 * This lets you flash from the command line via netcat.
 *
 * NOT SUITABLE TO PUT ON THE INTERNET OR INTO A PRODUCTION ENVIRONMENT!!!!
 */
#include "espressif/esp_common.h"
#include "espressif/sdk_private.h"
#include "FreeRTOS.h"
#include "task.h"
#include "esp8266.h"
#include "ssid_config.h"

#include "ota-tftp.h"
#include "rboot-ota.h"

void user_init(void)
{
    sdk_uart_div_modify(0, UART_CLK_FREQ / 115200);

    rboot_config_t conf = rboot_get_config();
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
}

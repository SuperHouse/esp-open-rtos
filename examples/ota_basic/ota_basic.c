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
#include "rboot-ota.h"

#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include "lwip/netdb.h"
#include "lwip/dns.h"

#define FWPORT 12550

#if !defined(WIFI_SSID) || !defined(WIFI_PASS)
#error "Please define macros WIFI_SSID & WIFI_PASS (here, or better in a local.h file at root level or in program dir."
#endif

void simpleOTATask(void *pvParameters)
{
    printf("Listening for firmware on port %d...\r\n", FWPORT);
    int s = socket(AF_INET, SOCK_STREAM, 0);
    if(s < 0) {
        printf("... Failed to allocate socket.\r\n");
        return;
    }

    struct sockaddr_in s_addr = {
        .sin_family = AF_INET,
        .sin_addr = {
            .s_addr = INADDR_ANY,
        },
        .sin_port = htons(FWPORT),
    };
    if(bind(s, (struct sockaddr *) &s_addr, sizeof(s_addr)) < 0)
    {
        printf("... Failed to bind.\r\n");
        return;
    }

    if(listen(s, 0) == -1) {
        printf("... Failed to listen.\r\n");
        return;
    }

    int client;
    while((client = accept(s, NULL, NULL)) != 0)
    {
        printf("Got new socket. Trying OTA update...\r\n");

        int slot = rboot_ota_update(client, -1, false);
        close(client);
        if(slot < 0) {
            printf("OTA update failed. :(.\r\n");
            continue;
        }
        printf("OTA succeeded at slot %d!\r\n", slot);
        //rboot_set_current_rom(slot);
        //sdk_system_restart();
    }
    printf("Failed to accept.\r\n");
    close(s);
    return;
}

void user_init(void)
{
    sdk_uart_div_modify(0, UART_CLK_FREQ / 115200);

    printf("OTA Basic demo. Currently running on slot %d / %d.\r\n",
           rboot_get_current_rom(), RBOOT_MAX_ROMS);

    struct sdk_station_config config = {
        .ssid = WIFI_SSID,
        .password = WIFI_PASS,
    };
    sdk_wifi_set_opmode(STATION_MODE);
    sdk_wifi_station_set_config(&config);

    xTaskCreate(simpleOTATask, (signed char *)"simpleOTATask", 512, NULL, 2, NULL);
}

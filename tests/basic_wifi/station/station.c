/* http_get - Retrieves a web page over HTTP GET.
 *
 * See http_get_ssl for a TLS-enabled version.
 *
 * This sample code is in the public domain.,
 */
#include "espressif/esp_common.h"
#include "esp/uart.h"

#include <string.h>

#include "FreeRTOS.h"
#include "task.h"

#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include "lwip/netdb.h"
#include "lwip/dns.h"

#include "ssid_config.h"

#include "test/test.h"

#define AP_SSID "esp-open-rtos-ap"
#define AP_PSK "esp-open-rtos"
#define SERVER "172.16.0.1"
#define PORT 23

void connect_task(void *pvParameters)
{
    printf("HTTP get task starting...\r\n");

    while(1) {
        struct sockaddr_in serv_addr;
        uint8_t buf[256];

        int s = socket(AF_INET, SOCK_STREAM, 0);
        if(s < 0) {
            printf("failed to allocate socket.\n");
            vTaskDelay(1000 / portTICK_RATE_MS);
            continue;
        }

        bzero(&serv_addr, sizeof(serv_addr));
        serv_addr.sin_port = htons(23);
        serv_addr.sin_family = AF_INET;
        if (inet_aton(SERVER, &serv_addr.sin_addr.s_addr) == 0) {
            printf("failed to set IP address\n");
            continue;
        }

        printf("allocated socket\n");

        if(connect(s, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) != 0) {
            close(s);
            printf("socket connect failed.\n");
            vTaskDelay(4000 / portTICK_RATE_MS);
            continue;
        }

        printf("connected\n");

        bzero(buf, 256);

        int r = 0;
        for (int i = 0; i < 10; i++) {
            r = read(s, buf, 256);
            if (r > 0) {
                break;
            }
            vTaskDelay(1000 / portTICK_RATE_MS);
        }
        printf("data: %s\n", buf);
        TEST_CHECK(r > 0, "no data received");

        TEST_CHECK(strcmp((const char*)buf, "test ping\r\n") == 0, 
                "received wrong data");

        close(s);

        TEST_FINISH();
        break;
    }
}

void user_init(void)
{
    TEST_INIT(30);

    printf("SDK version:%s\n", sdk_system_get_sdk_version());

    struct sdk_station_config config = {
        .ssid = AP_SSID,
        .password = AP_PSK,
    };

    /* required to call wifi_set_opmode before station_set_config */
    sdk_wifi_set_opmode(STATION_MODE);
    sdk_wifi_station_set_config(&config);

    xTaskCreate(&connect_task, (signed char *)"connect_task", 256, NULL, 2, NULL);
}


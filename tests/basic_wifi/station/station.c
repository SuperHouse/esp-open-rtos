/**
 * This test connects to an access point and connects to a server on port 23.
 * It waits for a server data and responds with another data.
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

#include "test/test.h"

#define AP_SSID     "esp-open-rtos-ap"
#define AP_PSK      "esp-open-rtos"
#define SERVER      "172.16.0.1"
#define PORT        23

void connect_task(void *pvParameters)
{
    printf("HTTP get task starting...\r\n");

    while(1) {
        struct sockaddr_in serv_addr;
        uint8_t buf[256];

        // wait for wifi connection
        while (sdk_wifi_station_get_connect_status() != STATION_GOT_IP) {
            vTaskDelay(100 / portTICK_RATE_MS);
        }

        int s = socket(AF_INET, SOCK_STREAM, 0);
        TEST_ASSERT(s > 0, "failed to allocate socket.");

        bzero(&serv_addr, sizeof(serv_addr));
        serv_addr.sin_port = htons(PORT);
        serv_addr.sin_family = AF_INET;

        TEST_ASSERT(inet_aton(SERVER, &serv_addr.sin_addr.s_addr),
                "failed to set IP address\n");

        printf("allocated socket\n");

        TEST_ASSERT(connect(s, (struct sockaddr*)&serv_addr, sizeof(serv_addr)),
                "socket connect failed");

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


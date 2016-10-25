/**
 * This test creates a WiFi access point and listens on port 23 for incomming
 * connection. When incomming connection occurs it sends a string and waits for
 * a response.
 */
#include <string.h>

#include <espressif/esp_common.h>
#include <esp/uart.h>
#include <FreeRTOS.h>
#include <task.h>
#include <queue.h>
#include <dhcpserver.h>

#include <lwip/api.h>

#include "test/test.h"

#define AP_SSID         "esp-open-rtos-ap"
#define AP_PSK          "esp-open-rtos"
#define SERVER_PORT     23


static void server_task(void *pvParameters)
{
    struct netconn *nc = netconn_new(NETCONN_TCP);
    TEST_ASSERT(nc, "failed to allocate socket.")

    netconn_bind(nc, IP_ADDR_ANY, SERVER_PORT);
    netconn_listen(nc);

    struct netconn *client = NULL;
    err_t err = netconn_accept(nc, &client);
    TEST_ASSERT(err == ERR_OK, "Error accepting connection");

    ip_addr_t client_addr;
    uint16_t port_ignore;
    netconn_peer(client, &client_addr, &port_ignore);

    char buf[80];
    snprintf(buf, sizeof(buf), "test ping\r\n");
    printf("writing data to socket: %s\n", buf);
    netconn_write(client, buf, strlen(buf), NETCONN_COPY);
    vTaskDelay(1000 / portTICK_RATE_MS);

    netconn_delete(client);

    TEST_FINISH();
}

void user_init(void)
{
    TEST_INIT(30);

    printf("SDK version:%s\n", sdk_system_get_sdk_version());

    sdk_wifi_set_opmode(SOFTAP_MODE);
    struct ip_info ap_ip;
    IP4_ADDR(&ap_ip.ip, 172, 16, 0, 1);
    IP4_ADDR(&ap_ip.gw, 0, 0, 0, 0);
    IP4_ADDR(&ap_ip.netmask, 255, 255, 0, 0);
    sdk_wifi_set_ip_info(1, &ap_ip);

    struct sdk_softap_config ap_config = {
        .ssid = AP_SSID,
        .ssid_hidden = 0,
        .channel = 3,
        .ssid_len = strlen(AP_SSID),
        .authmode = AUTH_WPA_WPA2_PSK,
        .password = AP_PSK,
        .max_connection = 3,
        .beacon_interval = 100,
    };
    sdk_wifi_softap_set_config(&ap_config);

    ip_addr_t first_client_ip;
    IP4_ADDR(&first_client_ip, 172, 16, 0, 2);
    dhcpserver_start(&first_client_ip, 4);

    xTaskCreate(server_task, (signed char *)"setver_task", 512, NULL, 2, NULL);
}

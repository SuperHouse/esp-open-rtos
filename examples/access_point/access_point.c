/* Very basic example showing usage of access point mode and the DHCP server.

   The ESP in the example runs a telnet server on 172.16.0.1 (port 23) that
   outputs some status information if you connect to it, then closes
   the connection.

   This example code is in the public domain.
*/
#include <string.h>

#include <espressif/esp_common.h>
#include <espressif/sdk_private.h>
#include <sdk_internal.h>
#include <FreeRTOS.h>
#include <task.h>
#include <queue.h>
#include <dhcpserver.h>

#include <lwip/api.h>

#define AP_SSID "esp-open-rtos AP"
#define AP_PSK "esp-open-rtos"

#define TELNET_PORT 23

static void telnetTask(void *pvParameters);

void user_init(void)
{
    sdk_uart_div_modify(0, UART_CLK_FREQ / 115200);
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

    xTaskCreate(telnetTask, (signed char *)"telnetTask", 512, NULL, 2, NULL);
}

/* Telnet task listens on port 23, returns some status information and then closes
   the connection if you connect to it.
*/
static void telnetTask(void *pvParameters)
{
  struct netconn *nc = netconn_new (NETCONN_TCP);
  if(!nc) {
    printf("Status monitor: Failed to allocate socket.\r\n");
    return;
  }
  netconn_bind(nc, IP_ADDR_ANY, TELNET_PORT);
  netconn_listen(nc);

  while(1) {
    struct netconn *client = NULL;
    err_t err = netconn_accept(nc, &client);

    if ( err != ERR_OK ) {
      if(client)
	netconn_delete(client);
      continue;
    }

    ip_addr_t client_addr;
    uint16_t port_ignore;
    netconn_peer(client, &client_addr, &port_ignore);

    char buf[80];
    snprintf(buf, sizeof(buf), "Uptime %d seconds\r\n",
	     xTaskGetTickCount()*portTICK_RATE_MS/1000);
    netconn_write(client, buf, strlen(buf), NETCONN_COPY);
    snprintf(buf, sizeof(buf), "Free heap %d bytes\r\n", (int)xPortGetFreeHeapSize());
    netconn_write(client, buf, strlen(buf), NETCONN_COPY);
    snprintf(buf, sizeof(buf), "Your address is %d.%d.%d.%d\n\n",
             ip4_addr1(&client_addr), ip4_addr2(&client_addr),
             ip4_addr3(&client_addr), ip4_addr4(&client_addr));
    netconn_write(client, buf, strlen(buf), NETCONN_COPY);

    snprintf(buf, sizeof(buf), "Structures head %p tail %p \n",
           sdk_g_ic.v.station_info_head, sdk_g_ic.v.station_info_tail);
    netconn_write(client, buf, strlen(buf), NETCONN_COPY);

    if(sdk_g_ic.v.station_info_tail) {
        snprintf(buf, sizeof(buf), "Tail BSSID %02x:%02x:%02x IP %d NEXT %p\n",
               sdk_g_ic.v.station_info_tail->bssid[0],
               sdk_g_ic.v.station_info_tail->bssid[1],
               sdk_g_ic.v.station_info_tail->bssid[2],
               ip4_addr1(&sdk_g_ic.v.station_info_tail->ip),
               STAILQ_NEXT(sdk_g_ic.v.station_info_tail, next));
        netconn_write(client, buf, strlen(buf), NETCONN_COPY);
    }

    struct sdk_station_info *station = sdk_wifi_softap_get_station_info();
    while(station) {
        snprintf(buf, sizeof(buf), "Client %02x:%02x:%02x:%02x:%02x:%02x IP %d.%d.%d.%d\n",
               station->bssid[0], station->bssid[1], station->bssid[2],
               station->bssid[3], station->bssid[4], station->bssid[5],
               ip4_addr1(&station->ip), ip4_addr2(&station->ip),
               ip4_addr3(&station->ip), ip4_addr4(&station->ip));
        netconn_write(client, buf, strlen(buf), NETCONN_COPY);
        station = STAILQ_NEXT(station, next);
    }

    netconn_delete(client);
  }
}

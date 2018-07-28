/**
 * Very basic example showing usage of netconn data receive echo over telnet.
 * the connection.
 *
 * This example code is in the public domain.
 */
#include <string.h>

#include <espressif/esp_common.h>
#include <esp/uart.h>
#include <FreeRTOS.h>
#include <task.h>
#include <queue.h>

#include <ssid_config.h>

#include <lwip/api.h>

#define TELNET_PORT 23
#define ECHO_PREFIX "\r\nYou entered: "
#define ECHO_POSTFIX "\r\n"
#define INPUT_ERROR "\r\nERROR: input line too long - try again.\r\n"
#define BYE "\r\nBYE\r\n"

static void telnetTask(void *pvParameters);

static void heartbeatTask(void *pvParameters){
    while(1){
        vTaskDelay(1000 / portTICK_PERIOD_MS);
        printf("Uptime %d seconds\r\n", xTaskGetTickCount() * portTICK_PERIOD_MS / 1000);
    }
}

void user_init(void)
{
    uart_set_baud(0, 115200);
    printf("SDK version:%s\n", sdk_system_get_sdk_version());

    struct sdk_station_config config = {
        .ssid = WIFI_SSID,
        .password = WIFI_PASS,
    };

    sdk_wifi_set_opmode(STATION_MODE);
    sdk_wifi_station_set_config(&config);
    sdk_wifi_station_connect();

    xTaskCreate(telnetTask, "telnetTask", 512, NULL, 2, NULL);
    xTaskCreate(heartbeatTask, "heardbeatTask", 512, NULL, 2, NULL);
}

/* Telnet task listens on port 23, returns some status information and then closes
 the connection if you connect to it.
 */
static void telnetTask(void *pvParameters)
{
    struct netconn *nc = netconn_new(NETCONN_TCP);
    if (!nc)
    {
        printf("Status monitor: Failed to allocate socket.\r\n");
        return;
    }
    netconn_bind(nc, IP_ANY_TYPE, TELNET_PORT);
    netconn_listen(nc);

    while (1)
    {
        struct netconn *client = NULL;
#ifdef DEBUG
        printf("waiting for new connection\n");
#endif
        err_t err = netconn_accept(nc, &client);

        if (err != ERR_OK)
        {
            if (client){
                netconn_delete(client);
            }
            continue;
        }

        ip_addr_t client_addr;
        uint16_t port_ignore;
        netconn_peer(client, &client_addr, &port_ignore);
        // TODO check return codes
        char buf[80];
        snprintf(buf, sizeof(buf), "Uptime %d seconds\r\n", xTaskGetTickCount() * portTICK_PERIOD_MS / 1000);
        netconn_write(client, buf, strlen(buf), NETCONN_COPY);
        snprintf(buf, sizeof(buf), "Free heap %d bytes\r\n", (int) xPortGetFreeHeapSize());
        netconn_write(client, buf, strlen(buf), NETCONN_COPY);
        char abuf[40];
        snprintf(buf, sizeof(buf), "Your address is %s\r\n\r\n", ipaddr_ntoa_r(&client_addr, abuf, sizeof(abuf)));
        netconn_write(client, buf, strlen(buf), NETCONN_COPY);

        char input_line[160] = {'\0'};
        size_t buffer_pos = 0;
        while(err == ERR_OK)
        {
            struct netbuf *nb;
            if ((err = netconn_recv(client, &nb)) == ERR_OK) {
                char *data_in = NULL;
                uint16_t data_len = 0;
                err = netbuf_data(nb, (void*)&data_in, &data_len);

                if(err != ERR_OK){
                    if(nb != NULL){
                        netbuf_delete(nb);
                    }
                    break;
                }
#ifdef DEBUG
                printf("input[%d]: %s\n", data_len, data_in);
#endif
                // check for termination request
                if((data_len == 1 && data_in[0] == 0x04) || (data_len == 2 && data_in[0] == 0xFF && data_in[1] == 0xEC)){
#ifdef DEBUG
                    printf("exit requested\n");
#endif
                    err = netconn_write(client, BYE, strlen(BYE), NETCONN_NOFLAG);
                    if(nb != NULL){
                        netbuf_delete(nb);
                    }
                    break;
                }

                // check if there's space left in the buffer
                if(buffer_pos + data_len < sizeof(input_line)) {
                    // copy data into input buffer
                    if(data_len > 0){
                        memcpy(&input_line[buffer_pos], (char*)data_in, data_len);
                        buffer_pos += data_len;
                        // check for line ending
                        if((data_len >= 2) &&
                            (((data_in[data_len-2] == 0x0D) && (data_in[data_len-1] == 0x00))
                            ||
                            ((data_in[data_len-2] == '\r') && (data_in[data_len-1] == '\n')))){ // \r\n
#ifdef DEBUG
                            printf("got line ending\n");
#endif
                            netconn_write(client, ECHO_PREFIX, strlen(ECHO_PREFIX), NETCONN_NOFLAG);
                            netconn_write(client, input_line, strlen(input_line), NETCONN_COPY);
                            netconn_write(client, ECHO_POSTFIX, strlen(ECHO_POSTFIX), NETCONN_NOFLAG);

                            // set buffer to zero, otherwise we would have to add the null byte by hand
                            memset(input_line, 0, sizeof(input_line));
                            buffer_pos = 0;
                        }
                    }
                } else {
                    netconn_write(client, INPUT_ERROR, strlen(INPUT_ERROR), NETCONN_NOFLAG);
                    memset(input_line, 0, sizeof(input_line));
                    buffer_pos = 0;
                }
            }
            if(nb != NULL){
                netbuf_delete(nb);
            }
        }
        memset(input_line, 0, sizeof(input_line));
        buffer_pos = 0;
        netconn_close(client);
        netconn_delete(client);
#ifdef DEBUG
        printf("connection close\n");
#endif
    }
}

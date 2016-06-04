/* websocket_mbedtls - Websocket example using mbed TLS.
 *
 * It creates a websocket with a server running on Heroku. It uses TLS v1.2.
 * I already implemented support to the permessage-deflate extension that
 * reduces the footprint of the websocket frames using the inflate deflate
 * algorithm.

 * The remaining memory when using the websocket on top of mbed TLS 1.2 is ~14Kb
 *
 * There is room for memory optimization. Feel free to improve the code.
 *
 * After get the esp8266 connected, go to ruby-websockets-chat.herokuapp.com
 * and type some commands like break (to reconnect), turn led on and turn led off.
 * 
 * If you wanna check the source code from the server:
 * https://github.com/heroku-examples/ruby-websockets-chat-demo
 * 
 * If you wanna work with the permessage-deflate extension, connect to the
 * host serene-escarpment-15149.herokuapp.com and the path /echo . It is a websocket
 * server echoing back your messages and supporting the permessage-deflate extension:
 * https://github.com/luisbebop/websocket-echo-deflate
 */

#include "espressif/esp_common.h"
#include "esp/uart.h"
#include <string.h>
#include "FreeRTOS.h"
#include "task.h"
#include "ssid_config.h"
#include "conn.h"
#include "ws.h"
#include "util.h"

const int gpio = 2;

void websocket_task(void *pvParameters)
{
	//char * host = "serene-escarpment-15149.herokuapp.com";
	//char * path = "/echo";
	
	char *host = "ruby-websockets-chat.herokuapp.com";
	char *path = "/";
	
	int socket = 0, ret = 0;
	int port = 443;
	Bool compression = false, timeout = false;
	char text[2048];
	
	gpio_enable(gpio, GPIO_OUTPUT);
	gpio_write(gpio, 1);
			
    while(1) {
		vTaskDelay(5000 / portTICK_RATE_MS);
		printf("top of loop, free heap = %u\n", xPortGetFreeHeapSize());
		
		socket = ConnConnect(host, port);
		printf("\nConnConnect socket %d\n", socket);
		
		ret = wsConnect(socket, host, path, &compression);
		printf("wsConnect ret %d compression %d\n", ret, compression);
	    if ( ret < 0)
	    {
	        printf("websocket handshake error ret=%d\n", ret);
	    }
			
		strcpy(text, "{\"handle\":\"websocket-c-client\", \"text\": \"hello from low level ~*~ esp8266\"}");
		wsSendText(socket, text, compression);
		
		while(1) {
			printf("top of loop, free heap = %u\n", xPortGetFreeHeapSize());

			memset(text, 0, sizeof(text));
			wsReceiveText(socket, text, 2048, compression, &timeout, 15);

			if (timeout) {
				printf("wsReceiveText timeout\n");
			} else {
				printf("no timeout ...\n");
				printf("%s\n", text);
				
				if(strstr(text, "break") != 0) break;
				if(strstr(text, "turn led on") != 0) gpio_write(gpio, 0);
				if(strstr(text, "turn led off") != 0) gpio_write(gpio, 1);
			}
		}
		
		printf("Before ConnClose top of loop, free heap = %u\n", xPortGetFreeHeapSize());
		ConnClose(socket);
		printf("After ConnClose top of loop, free heap = %u\n", xPortGetFreeHeapSize());
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

    /* required to call wifi_set_opmode before station_set_config */
    sdk_wifi_set_opmode(STATION_MODE);
    sdk_wifi_station_set_config(&config);

    xTaskCreate(&websocket_task, (signed char *)"websocket_task", 2048, NULL, 2, NULL);
}

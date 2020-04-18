#include <stdio.h>
#include <esp/uart.h>

#include "wifi_config.h"


void on_wifi_event(wifi_config_event_t event) {
    if (event == WIFI_CONFIG_CONNECTED) {
        printf("Connected to WiFi\n");
    } else if (event == WIFI_CONFIG_DISCONNECTED) {
        printf("Disconnected from WiFi\n");
    }
}

void user_init(void) {
    uart_set_baud(0, 115200);

    wifi_config_init2("my-accessory", NULL, on_wifi_event);
}
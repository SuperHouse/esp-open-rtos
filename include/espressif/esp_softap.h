/*
 *  Copyright (C) 2013 -2014  Espressif System
 *
 */

#ifndef __ESP_SOFTAP_H__
#define __ESP_SOFTAP_H__

#include <stdint.h>
#include "lwip/ip_addr.h"
#include "espressif/queue.h"

#ifdef	__cplusplus
extern "C" {
#endif

struct sdk_softap_config {
    uint8_t ssid[32];
    uint8_t password[64];
    uint8_t ssid_len;
    uint8_t channel;
    AUTH_MODE authmode;
    uint8_t ssid_hidden;
    uint8_t max_connection;
    uint16_t beacon_interval;
};

bool sdk_wifi_softap_get_config(struct sdk_softap_config *config);
bool sdk_wifi_softap_set_config(struct sdk_softap_config *config);

struct sdk_station_info {
    STAILQ_ENTRY(sdk_station_info) next;
    uint8_t bssid[6];
    struct ip_addr ip;
};

struct sdk_station_info* sdk_wifi_softap_get_station_info();
bool sdk_wifi_softap_free_station_info();

#ifdef	__cplusplus
}
#endif

#endif

/*
 *  Copyright (C) 2013 -2014  Espressif System
 *
 */

#ifndef __ESP_STA_H__
#define __ESP_STA_H__

#include "queue.h"

struct station_config {
    uint8_t ssid[32];
    uint8_t password[64];
    uint8_t bssid_set;
    uint8_t bssid[6];
};

bool wifi_station_get_config(struct station_config *config);
bool wifi_station_set_config(struct station_config *config);

bool wifi_station_connect(void);
bool wifi_station_disconnect(void);

struct scan_config {
    uint8_t *ssid;
    uint8_t *bssid;
    uint8_t channel;
    uint8_t show_hidden;
};

struct bss_info {
    STAILQ_ENTRY(bss_info)     next;

    uint8_t bssid[6];
    uint8_t ssid[32];
    uint8_t channel;
    int8_t rssi;
    AUTH_MODE authmode;
    uint8_t is_hidden;
};

/* NB: in esp_iot_rtos_sdk this enum is just called STATUS and has no SCAN_ prefixes */
typedef enum {
    SCAN_OK = 0,
    SCAN_FAIL,
    SCAN_PENDING,
    SCAN_BUSY,
    SCAN_CANCEL,
} scan_status_t;

typedef void (* scan_done_cb_t)(void *arg, scan_status_t status);

bool wifi_station_scan(struct scan_config *config, scan_done_cb_t cb);

uint8_t wifi_station_get_auto_connect(void);
bool wifi_station_set_auto_connect(uint8_t set);

enum {
    STATION_IDLE = 0,
    STATION_CONNECTING,
    STATION_WRONG_PASSWORD,
    STATION_NO_AP_FOUND,
    STATION_CONNECT_FAIL,
    STATION_GOT_IP
};

uint8_t wifi_station_get_connect_status(void);

#endif

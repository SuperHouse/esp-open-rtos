/**
  * Paho Embedded MQTT client, esp-open-rtos support.
  *
  * Copyright (c) 2015, Baoshi Zhu & 2016, Angus Gratton
  * All rights reserved.
  * Use of this source code is governed by a BSD-style license that can be
  * found in the LICENSE.txt file.
  *
  * THIS SOFTWARE IS PROVIDED 'AS-IS', WITHOUT ANY EXPRESS OR IMPLIED
  * WARRANTY.  IN NO EVENT WILL THE AUTHOR(S) BE HELD LIABLE FOR ANY DAMAGES
  * ARISING FROM THE USE OF THIS SOFTWARE.
  *
  */

#include <espressif/esp_common.h>
#include <lwip/sockets.h>
#include <lwip/inet.h>
#include <lwip/netdb.h>
#include <lwip/sys.h>
#include <string.h>

#include "MQTTESP8266.h"

char expired(Timer* timer)
{
    portTickType now = xTaskGetTickCount();
    int32_t left = timer->end_time - now;
    return (left < 0);
}


void countdown_ms(Timer* timer, unsigned int timeout)
{
    portTickType now = xTaskGetTickCount();
    timer->end_time = now + timeout / portTICK_RATE_MS;
}


void countdown(Timer* timer, unsigned int timeout)
{
    countdown_ms(timer, timeout * 1000);
}


int left_ms(Timer* timer)
{
    portTickType now = xTaskGetTickCount();
    int32_t left = timer->end_time - now;
    return (left < 0) ? 0 : left / portTICK_RATE_MS;
}


void InitTimer(Timer* timer)
{
    timer->end_time = 0;
}

static int  mqtt_esp_read(Network* n, unsigned char* buffer, int len, int timeout_ms)
{
    /* set SO_RCVTIMEO if timeout_ms > 0 otherwise O_NONBLOCK */
    lwip_setsockopt(n->socket, SOL_SOCKET, SO_RCVTIMEO, &timeout_ms, sizeof(int));
    lwip_fcntl(n->socket, F_SETFL, (timeout_ms) > 0 ? 0 : O_NONBLOCK);
    int r = recv(n->socket, buffer, len, 0);
    if(r == 0) {
        r = -1; /* 0 indicates timeout */
    }
    return r;
}


static int mqtt_esp_write(Network* n, unsigned char* buffer, int len, int timeout_ms)
{
    lwip_setsockopt(n->socket, SOL_SOCKET, SO_SNDTIMEO, &timeout_ms, sizeof(int));
    lwip_fcntl(n->socket, F_SETFL, (timeout_ms > 0) ? 0 : O_NONBLOCK);
    int r = send(n->socket, buffer, len, 0);
    if(r == 0) {
        r = -1; /* 0 indicates timeout */
    }
    return r;
}

void  NewNetwork(Network* n)
{
    n->socket = -1;
    n->mqttread = mqtt_esp_read;
    n->mqttwrite = mqtt_esp_write;
}

int  ConnectNetwork(Network* n, const char* host, int port)
{
    struct sockaddr_in addr;
    ip_addr_t ipaddr;
    int ret;

    err_t e = netconn_gethostbyname(host, &ipaddr);
    if(e) {
        return e;
    }

    inet_addr_from_ipaddr(&(addr.sin_addr), &ipaddr);
    addr.sin_family = AF_INET;
    addr.sin_port = htons(port);

    ret = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (ret < 0)
    {
        return ret;
    }
    n->socket = ret;

    ret = connect(n->socket, ( struct sockaddr *)&addr, sizeof(struct sockaddr_in));
    if (ret < 0)
    {
        close(n->socket);
        n->socket = -1;
        return ret;
    }

    return ret;
}


int  DisconnectNetwork(Network* n)
{
    close(n->socket);
    n->socket = -1;
    return 0;
}

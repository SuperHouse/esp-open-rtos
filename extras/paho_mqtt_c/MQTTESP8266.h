/**
  * Paho Embedded MQTT client, esp-open-rtos support. 
  *
  * Copyright (c) 2015, Baoshi Zhu & 2016, Angus Gratton.
  * All rights reserved.
  * Use of this source code is governed by a BSD-style license that can be
  * found in the LICENSE.txt file.
  *
  * THIS SOFTWARE IS PROVIDED 'AS-IS', WITHOUT ANY EXPRESS OR IMPLIED
  * WARRANTY.  IN NO EVENT WILL THE AUTHOR(S) BE HELD LIABLE FOR ANY DAMAGES
  * ARISING FROM THE USE OF THIS SOFTWARE.
  *
  */
#ifndef _MQTT_ESP8266_H_
#define _MQTT_ESP8266_H_

#include <FreeRTOS.h>
#include <portmacro.h>

#include <lwip/api.h>

typedef struct Timer Timer;

typedef struct Network Network;

struct Timer
{
    portTickType end_time;
};

struct Network
{
    int socket;
    int (*mqttread) (Network*, unsigned char*, int, int);
    int (*mqttwrite) (Network*, unsigned char*, int, int);
};

char expired(Timer*);
void countdown_ms(Timer*, unsigned int);
void countdown(Timer*, unsigned int);
int left_ms(Timer*);

void InitTimer(Timer*);

void NewNetwork(Network* n);
int ConnectNetwork(Network* n, const char* host, int port);
int DisconnectNetwork(Network* n);


#endif /* _MQTT_ESP8266_H_ */

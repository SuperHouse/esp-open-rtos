/**
  ******************************************************************************
  * @file    MQTTESP8266.h
  * @author  Baoshi <mail(at)ba0sh1(dot)com>
  * @version 0.1
  * @date    Sep 9, 2015
  * @brief   Eclipse Paho ported to ESP8266 RTOS
  *
  ******************************************************************************
  * @copyright
  *
  * Copyright (c) 2015, Baoshi Zhu. All rights reserved.
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

typedef struct Timer Timer;

struct Timer
{
    portTickType end_time;
};

typedef struct Network Network;

struct Network
{
	int my_socket;
	int (*mqttread) (Network*, unsigned char*, int, int);
	int (*mqttwrite) (Network*, unsigned char*, int, int);
};

char expired(Timer*);
void countdown_ms(Timer*, unsigned int);
void countdown(Timer*, unsigned int);
int left_ms(Timer*);

void InitTimer(Timer*);

int mqtt_esp_read(Network*, unsigned char*, int, int);
int mqtt_esp_write(Network*, unsigned char*, int, int);
void mqtt_esp_disconnect(Network*);

void NewNetwork(Network* n);
int ConnectNetwork(Network* n, const char* host, int port);
int DisconnectNetwork(Network* n);


#endif /* _MQTT_ESP8266_H_ */

/*******************************************************************************
 * Copyright (c) 2014 IBM Corp.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * and Eclipse Distribution License v1.0 which accompany this distribution.
 *
 * The Eclipse Public License is available at
 *    http://www.eclipse.org/legal/epl-v10.html
 * and the Eclipse Distribution License is available at
 *   http://www.eclipse.org/org/documents/edl-v10.php.
 *
 * Contributors:
 *    Allan Stockdill-Mander/Ian Craggs - initial API and implementation and/or initial documentation
 *******************************************************************************/

#ifndef __MQTT_CLIENT_C_
#define __MQTT_CLIENT_C_

#include "MQTTPacket.h"
#include "MQTTESP8266.h"

#define MAX_PACKET_ID 65535
#define MAX_MESSAGE_HANDLERS 5
#define MAX_FAIL_ALLOWED  2

enum QoS { QOS0, QOS1, QOS2 };

// all failure return codes must be negative
enum returnCode {READ_ERROR = -4, DISCONNECTED = -3, BUFFER_OVERFLOW = -2, FAILURE = -1, SUCCESS = 0 };

void NewTimer(Timer*);

typedef struct _MQTTMessage
{
    enum QoS qos;
    char retained;
    char dup;
    unsigned short id;
    void *payload;
    size_t payloadlen;
} MQTTMessage;

typedef struct _MessageData
{
    MQTTString* topic;
    MQTTMessage* message;
} MessageData;

typedef void (*messageHandler)(MessageData*);

struct _MQTTClient
{
    unsigned int next_packetid;
    unsigned int command_timeout_ms;
    size_t buf_size, readbuf_size;
    unsigned char *buf;
    unsigned char *readbuf;
    unsigned int keepAliveInterval;
    char ping_outstanding;
    int fail_count;
    int isconnected;

    struct MessageHandlers
    {
        const char* topicFilter;
        void (*fp) (MessageData*);
    } messageHandlers[MAX_MESSAGE_HANDLERS];      // Message handlers are indexed by subscription topic

    void (*defaultMessageHandler) (MessageData*);

    Network* ipstack;
    Timer ping_timer;
};


typedef struct _MQTTClient MQTTClient;


int MQTTConnect(MQTTClient* c, MQTTPacket_connectData* options);
int MQTTPublish(MQTTClient* c, const char* topic, MQTTMessage* message);
int MQTTSubscribe(MQTTClient* c, const char* topic, enum QoS qos, messageHandler handler);
int MQTTUnsubscribe(MQTTClient* c, const char* topic);
int MQTTDisconnect(MQTTClient* c);
int MQTTYield(MQTTClient* c, int timeout_ms);

void NewMQTTClient(MQTTClient*, Network*, unsigned int, unsigned char*, size_t, unsigned char*, size_t);

#define DefaultClient {0, 0, 0, 0, NULL, NULL, 0, 0, 0}

#endif

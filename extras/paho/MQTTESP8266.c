/**
  ******************************************************************************
  * @file    MQTTESP8266.c
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

#include <espressif/esp_common.h>
#include <c_types.h>
#include <lwip/sockets.h>
#include <lwip/inet.h>
#include <lwip/netdb.h>
#include <lwip/sys.h>
#include <string.h>

#include "MQTTESP8266.h"

char ICACHE_FLASH_ATTR expired(Timer* timer)
{
    portTickType now = xTaskGetTickCount();
	int32_t left = timer->end_time - now;
	return (left < 0);
}


void ICACHE_FLASH_ATTR countdown_ms(Timer* timer, unsigned int timeout)
{
    portTickType now = xTaskGetTickCount();
	timer->end_time = now + timeout / portTICK_RATE_MS;
}


void ICACHE_FLASH_ATTR countdown(Timer* timer, unsigned int timeout)
{
    countdown_ms(timer, timeout * 1000);
}


int ICACHE_FLASH_ATTR left_ms(Timer* timer)
{
    portTickType now = xTaskGetTickCount();
    int32_t left = timer->end_time - now;
	return (left < 0) ? 0 : left / portTICK_RATE_MS;
}


void ICACHE_FLASH_ATTR InitTimer(Timer* timer)
{
	timer->end_time = 0;
}



int ICACHE_FLASH_ATTR mqtt_esp_read(Network* n, unsigned char* buffer, int len, int timeout_ms)
{
    struct timeval tv;
    fd_set fdset;
    int rc = 0;
    int rcvd = 0;
    FD_ZERO(&fdset);
    FD_SET(n->my_socket, &fdset);
    // It seems tv_sec actually means FreeRTOS tick
    tv.tv_sec = timeout_ms / portTICK_RATE_MS;
    tv.tv_usec = 0;
    rc = select(n->my_socket + 1, &fdset, 0, 0, &tv);
    if ((rc > 0) && (FD_ISSET(n->my_socket, &fdset)))
    {
        rcvd = recv(n->my_socket, buffer, len, 0);
    }
    else
    {
        // select fail
        return -1;
    }
    return rcvd;
}


int ICACHE_FLASH_ATTR mqtt_esp_write(Network* n, unsigned char* buffer, int len, int timeout_ms)
{
	struct timeval tv;
	fd_set fdset;
	int rc = 0;

	FD_ZERO(&fdset);
	FD_SET(n->my_socket, &fdset);
	// It seems tv_sec actually means FreeRTOS tick
    tv.tv_sec = timeout_ms / portTICK_RATE_MS;
    tv.tv_usec = 0;
	rc = select(n->my_socket + 1, 0, &fdset, 0, &tv);
	if ((rc > 0) && (FD_ISSET(n->my_socket, &fdset)))
	{
	    rc = send(n->my_socket, buffer, len, 0);
	}
	else
	{
	    // select fail
	    return -1;
	}
	return rc;
}



void ICACHE_FLASH_ATTR NewNetwork(Network* n)
{
	n->my_socket = -1;
	n->mqttread = mqtt_esp_read;
	n->mqttwrite = mqtt_esp_write;
}


#if 0
int TLSConnectNetwork(Network *n, char* addr, int port, SlSockSecureFiles_t* certificates, unsigned char sec_method, unsigned int cipher, char server_verify) {
	SlSockAddrIn_t sAddr;
	int addrSize;
	int retVal;
	unsigned long ipAddress;

	retVal = sl_NetAppDnsGetHostByName(addr, strlen(addr), &ipAddress, AF_INET);
	if (retVal < 0) {
		return -1;
	}

	sAddr.sin_family = AF_INET;
	sAddr.sin_port = sl_Htons((unsigned short)port);
	sAddr.sin_addr.s_addr = sl_Htonl(ipAddress);

	addrSize = sizeof(SlSockAddrIn_t);

	n->my_socket = sl_Socket(SL_AF_INET,SL_SOCK_STREAM, SL_SEC_SOCKET);
	if (n->my_socket < 0) {
		return -1;
	}

	SlSockSecureMethod method;
	method.secureMethod = sec_method;
	retVal = sl_SetSockOpt(n->my_socket, SL_SOL_SOCKET, SL_SO_SECMETHOD, &method, sizeof(method));
	if (retVal < 0) {
		return retVal;
	}

	SlSockSecureMask mask;
	mask.secureMask = cipher;
	retVal = sl_SetSockOpt(n->my_socket, SL_SOL_SOCKET, SL_SO_SECURE_MASK, &mask, sizeof(mask));
	if (retVal < 0) {
		return retVal;
	}

	if (certificates != NULL) {
		retVal = sl_SetSockOpt(n->my_socket, SL_SOL_SOCKET, SL_SO_SECURE_FILES, certificates->secureFiles, sizeof(SlSockSecureFiles_t));
		if(retVal < 0)
		{
			return retVal;
		}
	}

	retVal = sl_Connect(n->my_socket, ( SlSockAddr_t *)&sAddr, addrSize);
	if( retVal < 0 ) {
		if (server_verify || retVal != -453) {
			sl_Close(n->my_socket);
			return retVal;
		}
	}

	SysTickIntRegister(SysTickIntHandler);
	SysTickPeriodSet(80000);
	SysTickEnable();

	return retVal;
}


#endif


LOCAL int ICACHE_FLASH_ATTR host2addr(const char *hostname , struct in_addr *in)
{
    struct addrinfo hints, *servinfo, *p;
    struct sockaddr_in *h;
    int rv;

    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_STREAM;
    rv = getaddrinfo(hostname, 0 , &hints , &servinfo);
    if (rv != 0)
    {
        return rv;
    }

    // loop through all the results and get the first resolve
    for (p = servinfo; p != 0; p = p->ai_next)
    {
        h = (struct sockaddr_in *)p->ai_addr;
        in->s_addr = h->sin_addr.s_addr;
    }
    freeaddrinfo(servinfo); // all done with this structure
    return 0;
}


int ICACHE_FLASH_ATTR ConnectNetwork(Network* n, const char* host, int port)
{
    struct sockaddr_in addr;
    int ret;

    if (host2addr(host, &(addr.sin_addr)) != 0)
    {
        return -1;
    }

    addr.sin_family = AF_INET;
    addr.sin_port = htons(port);

    n->my_socket = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
    if( n->my_socket < 0 )
    {
        // error
        return -1;
    }
    ret = connect(n->my_socket, ( struct sockaddr *)&addr, sizeof(struct sockaddr_in));
    if( ret < 0 )
    {
        // error
        close(n->my_socket);
        return ret;
    }

    return ret;
}


int ICACHE_FLASH_ATTR DisconnectNetwork(Network* n)
{
    close(n->my_socket);
    n->my_socket = -1;
    return 0;
}

/*
 * Copyright (c) 2007-2015, Cameron Rich
 * Modifications Copyright (c) 2015 Superhouse Automation Pty Ltd
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without 
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, 
 *   this list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above copyright notice, 
 *   this list of conditions and the following disclaimer in the documentation 
 *   and/or other materials provided with the distribution.
 * * Neither the name of the axTLS project nor the names of its contributors 
 *   may be used to endorse or promote products derived from this software 
 *   without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/**
 * @file os_port.h
 *
 * Some stuff to minimise the differences between windows and linux/unix
 */

#ifndef _HEADER_OS_PORT_H
#define _HEADER_OS_PORT_H

#ifdef __cplusplus
extern "C" {
#endif

#include "FreeRTOS.h"
#include "os_int.h"
#include "config.h"
#include <stdio.h>
#include <pwd.h>
#include <netdb.h>
//#include <fcntl.h>
#include <errno.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <posix/sys/socket.h>
#include <sys/wait.h>
#include <ipv4/lwip/inet.h>
#if defined(CONFIG_SSL_CTX_MUTEXING)
#include "semphr.h"
#endif

#define SOCKET_READ(A,B,C)      read(A,B,C)
#define SOCKET_WRITE(A,B,C)     write(A,B,C)
#define SOCKET_CLOSE(A)         if (A >= 0) close(A)
#define TTY_FLUSH()

static inline uint64_t be64toh(uint64_t x) {
  return ntohl(x>>32) | ((uint64_t)(ntohl(x)) << 32);
}

void exit_now(const char *format, ...) __attribute((noreturn));

#define EXP_FUNC
#define STDCALL

/* Mutex definitions */
#if defined(CONFIG_SSL_CTX_MUTEXING)
#define SSL_CTX_MUTEX_TYPE           xSemaphoreHandle
#define SSL_CTX_MUTEX_INIT(A)       vSemaphoreCreateBinaryCreateMutex(A)
#define SSL_CTX_MUTEX_DESTROY(A)    vSemaphoreDelete(A)
#define SSL_CTX_LOCK(A)             xSemaphoreTakeRecursive(A, portMAX_DELAY)
#define SSL_CTX_UNLOCK(A)           xSemaphoreGiveRecursive(A)
#else
#define SSL_CTX_MUTEX_TYPE
#define SSL_CTX_MUTEX_INIT(A)
#define SSL_CTX_MUTEX_DESTROY(A)
#define SSL_CTX_LOCK(A)
#define SSL_CTX_UNLOCK(A)
#endif

#ifdef __cplusplus
}
#endif

#endif 

/* this file provides function aliasing/etc that are needed for
   compatibility with other binary espressif libraries */
#include <stdlib.h>
#include <string.h>
#include "FreeRTOS.h"

/* SDK uses this and so does lwip, it was defined in libudhcp.a
   but that library has been removed. */
int errno;

/* newlib uses __errno in some contexts */
int *__errno(void) {
    return &errno;
}

/* libc memory management functions.

   Many of these are linked from the RTOS SDK blob libraries.

   In esp_iot_rtos_sdk these are aliased to exception-safe versions of
   the FreeRTOS functions. I think the rationale is that they're
   sometimes called in exception contexts (ESPTODO: Verify this).

   For now these are exception-safe wrappers to the FreeRTOS versions.
 */

void *malloc(size_t nbytes) {
	void *res;
	portENTER_CRITICAL();
	res = pvPortMalloc(nbytes);
	portEXIT_CRITICAL();
	return res;
}

void *calloc(size_t count, size_t size) {
	void *res;
	size_t nbytes = count * size;
	portENTER_CRITICAL();
	res = pvPortMalloc(nbytes);
	portEXIT_CRITICAL();
	if(res) {
		memset(res, 0, nbytes);
	}
	return res;
}

void *zalloc(size_t nbytes) {
    return calloc(1, nbytes);
}

void *realloc(void *old, size_t newsize) {
	void *new;
	portENTER_CRITICAL();
	if(newsize == 0) {
		vPortFree(old);
		return 0;
	}
	/* realloc implementation borrowed from esp_iot_rtos_sdk, could be better I think */
	new = pvPortMalloc(newsize);
	if (new) {
		memcpy(new, old, newsize);
		vPortFree(old);
	}
	portEXIT_CRITICAL();
	return new;
}

void free(void *ptr) {
    portENTER_CRITICAL();
    vPortFree(ptr);
    portEXIT_CRITICAL();
}

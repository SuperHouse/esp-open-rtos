#ifndef util_h_INCLUDED
#define util_h_INCLUDED

#include "espressif/esp_common.h"
#include "espressif/esp_misc.h"
#include "esp8266.h"
#include "FreeRTOS.h"
#include "task.h"

void delayMicroSec(uint16_t us) {
	sdk_os_delay_us(us);
}

void setPinDigital(uint8_t pin, bool value) {
	gpio_write(pin, value);
}

unsigned long getMicroSec() {
	return sdk_system_get_time();
}

void disableInterrupts() {
	taskENTER_CRITICAL();
}

void enableInterrupts() {
	taskEXIT_CRITICAL();
}

#endif // util_h_INCLUDED


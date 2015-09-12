/*
 *  Copyright (C) 2013 -2014  Espressif System
 *
 */

#ifndef __ESP_SYSTEM_H__
#define __ESP_SYSTEM_H__

#ifdef	__cplusplus
extern "C" {
#endif

enum sdk_rst_reason {
	DEFAULT_RST	  = 0,
	WDT_RST	      = 1,
	EXCEPTION_RST = 2,
	SOFT_RST      = 3
};

struct sdk_rst_info{
	uint32_t reason;
	uint32_t exccause;
	uint32_t epc1;
	uint32_t epc2;
	uint32_t epc3;
	uint32_t excvaddr;
	uint32_t depc;
	uint32_t rtn_addr;
};

struct sdk_rst_info* sdk_system_get_rst_info(void);

const char* sdk_system_get_sdk_version(void);

enum sdk_sleep_type {
    WIFI_SLEEP_NONE = 0,
    WIFI_SLEEP_LIGHT = 1,
    WIFI_SLEEP_MODEM = 2,
};
void sdk_wifi_set_sleep_type(enum sdk_sleep_type);
enum sdk_sleep_type sdk_wifi_get_sleep_type(enum sdk_sleep_type);

void sdk_system_restore(void);
void sdk_system_restart(void);
void sdk_system_deep_sleep(uint32_t time_in_us);

uint32_t sdk_system_get_time(void);

void sdk_system_print_meminfo(void);
uint32_t sdk_system_get_free_heap_size(void);
uint32_t sdk_system_get_chip_id(void);

uint32_t sdk_system_rtc_clock_cali_proc(void);
uint32_t sdk_system_get_rtc_time(void);

bool sdk_system_rtc_mem_read(uint8_t src, void *dst, uint16_t n);
bool sdk_system_rtc_mem_write(uint8_t dst, const void *src, uint16_t n);

void sdk_system_uart_swap(void);

#ifdef	__cplusplus
}
#endif

#endif

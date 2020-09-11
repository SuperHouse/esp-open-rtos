/*
 * Auxiliary functions to handle date/time along with lwIP sntp implementation.
 *
 * Jesus Alonso (doragasu)
 */

#include <sys/reent.h>
#include <sys/types.h>
#include <sys/errno.h>
#include <stdio.h>
#include <espressif/esp_common.h>
#include <esp/timer.h>
#include <esp/rtc_regs.h>
#include <FreeRTOS.h>
#include <assert.h>
#include <semphr.h>
#include "sntp.h"

#ifdef  SNTP_LOGD_WITH_PRINTF
#define SNTP_LOGD(FMT, ...) printf(FMT "\n", ##__VA_ARGS__)
#endif

#ifndef SNTP_LOGD
#define SNTP_LOGD(...)
#define SKIP_DIAGNOSTICS
#endif

#define TIMER_COUNT			RTC.COUNTER

// daylight settings
// Base calculated with value obtained from NTP server (64 bits)
#define sntp_base	(*((uint64_t*)RTC.SCRATCH))
// Timer value when sntp_base was obtained
#define tim_ref 	(RTC.SCRATCH[2])
// Calibration value
#define cal 		(RTC.SCRATCH[3])

// To protect access to the above.
static SemaphoreHandle_t sntp_sem = NULL;

// Timezone related data.
static struct timezone stz;

// Implemented in sntp.c
void sntp_init(void);

// Sets time zone.
// NOTE: Settings do not take effect until SNTP time is updated.
void sntp_set_timezone(const struct timezone *tz) {
    if (tz) {
        stz = *tz;
    } else {
        stz.tz_minuteswest = 0;
        stz.tz_dsttime = 0;
    }
}

// Initialization
void sntp_initialize(const struct timezone *tz) {
    if (tz) {
        stz = *tz;
    } else {
        stz.tz_minuteswest = 0;
        stz.tz_dsttime = 0;
    }
    sntp_base = 0;
    // To avoid div by 0 exceptions if requesting time before SNTP config
    cal = 1;
    tim_ref = TIMER_COUNT;
    sntp_sem = xSemaphoreCreateMutex();
    assert(sntp_sem != NULL);
    
    sntp_init();
}

// Return usecs.
static inline uint64_t sntp_get_rtc_time() {
    xSemaphoreTake(sntp_sem, portMAX_DELAY);
    uint32_t tim = TIMER_COUNT;
    // Assume the difference does not overflow in which case
    // wrapping of the RTC timer still yields a good difference.
    uint32_t diff = tim - tim_ref;
    tim_ref = tim;
    uint64_t diff_us = ((uint64_t)diff * cal) >> 12;
    uint64_t base = sntp_base + diff_us;
    sntp_base = base;
    xSemaphoreGive(sntp_sem);

    return base;
}

// Syscall implementation. doesn't seem to use tzp.
int _gettimeofday_r(struct _reent *r, struct timeval *tp, void *tzp) {
    (void)r;
    // Syscall defined by xtensa newlib defines tzp as void*
    // So it looks like it is not used. Also check tp is not NULL
    if (tzp || !tp) return EINVAL;

	if (sntp_base == 0) {
	 	printf("Time not valid yet\n");
	 	return EINVAL;
	}

    uint64_t base = sntp_get_rtc_time();

    tp->tv_sec = base / 1000000U;
    tp->tv_usec = base % 1000000U;
    return 0;
}

// Update RTC timer. Called by SNTP module each time it receives an update.
void sntp_update_rtc(time_t t, uint32_t us) {
    // Apply daylight and timezone correction
    t += (stz.tz_minuteswest + stz.tz_dsttime * 60) * 60;
    int64_t sntp_correct = (uint64_t)us + (uint64_t)t * 1000000U;

    xSemaphoreTake(sntp_sem, portMAX_DELAY);
    uint32_t tim = TIMER_COUNT;
    tim_ref = tim;
    sntp_base = sntp_correct;
#ifndef SKIP_DIAGNOSTICS
    // Assume the difference does not overflow in which case
    // wrapping of the RTC timer still yields a good difference.
    uint32_t diff = tim - tim_ref;
    uint64_t diff_us = ((uint64_t)diff * cal) >> 12;
    uint64_t sntp_current = sntp_base + diff_us;
#endif
    cal = sdk_system_rtc_clock_cali_proc();
    xSemaphoreGive(sntp_sem);

    SNTP_LOGD("SNTP RTC Adjust: drift = %d usec, cal = %d", (int)(sntp_correct - sntp_current), cal);
}

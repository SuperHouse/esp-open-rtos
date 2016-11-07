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
#include "FreeRTOS.h"
#include "semphr.h"
#include "sntp.h"

#define TIMER_COUNT      RTC.COUNTER

// Base calculated with value obtained from NTP server (64 bits)
#define sntp_base        (*((uint64_t*)RTC.SCRATCH))
// Timer value when sntp_base was obtained
#define time_ref         (RTC.SCRATCH[2])

// RTC counts.
static uint64_t rtc_count;

// NTP time last received.
static uint64_t sntp_last;
// RTC counts at the processing of NTP sntp_last time.
static uint64_t rtc_ref;

// The numerator and denominator of the calibration ratio. The
// difference between the sntp time responses, and the difference in
// the RTC counts for these respective events.
static uint64_t sntp_diff_sum;
static uint64_t rtc_diff_sum;
// Calibration value. The ratio of the number of usec over the number
// of RTC counts.
#define time_cal         (RTC.SCRATCH[3])

// To protect access to the above.
static xSemaphoreHandle sntp_mutex = NULL;

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

    sntp_base = 0UL;
    time_ref = TIMER_COUNT;
    rtc_count = 0UL;
    sntp_last = 0UL;
    rtc_ref = 0UL;

    // The system rtc clock function is noisy so repeat to get a
    // cleaner startup value.
    uint32_t cal = 0;
    uint32_t i;
    for (i = 0; i < 32; i++)
        cal += sdk_system_rtc_clock_cali_proc();
    time_cal = cal / 32;
    sntp_diff_sum = (uint64_t)time_cal << 20;
    rtc_diff_sum = 1UL << 20;

    vSemaphoreCreateBinary(sntp_mutex);
    sntp_init();
}

// Return usecs.
inline uint64_t sntp_get_rtc_time() {
    xSemaphoreTake(sntp_mutex, portMAX_DELAY);
    uint32_t tim = TIMER_COUNT;
    // Assume the difference does not overflow in which case
    // wrapping of the RTC timer still yields a good difference.
    uint32_t diff = tim - time_ref;
    time_ref = tim;
    rtc_count += diff;
    uint64_t diff_us = ((uint64_t)diff * time_cal) >> 12;
    uint64_t base = sntp_base + diff_us;
    sntp_base = base;
    xSemaphoreGive(sntp_mutex);
    return base;
}

// Syscall implementation. doesn't seem to use tzp.
int _gettimeofday_r(struct _reent *r, struct timeval *tp, void *tzp) {
    (void)r;
    // Syscall defined by xtensa newlib defines tzp as void*
    // So it looks like it is not used. Also check tp is not NULL
    if (tzp || !tp) return EINVAL;

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

    xSemaphoreTake(sntp_mutex, portMAX_DELAY);
    uint32_t time = TIMER_COUNT;
    // Assume the difference does not overflow in which case
    // wrapping of the RTC timer still yields a good difference.
    uint32_t diff = time - time_ref;
    time_ref = time;
    rtc_count += diff;
    uint64_t diff_us = ((uint64_t)diff * time_cal) >> 12;
    uint64_t sntp_current = sntp_base + diff_us;

    if (sntp_correct <= sntp_last) {
        // Reject this update as it is older than a prior update,
        // probably an old response arriving out of order.
        sntp_base = sntp_current;
    } else {
        sntp_base = sntp_correct;
        if (sntp_last > 0) {
            // Filter the time_cal ratio numerator and denominator
            // separately - for better precision.
            uint64_t sntp_diff = sntp_correct - sntp_last;
            sntp_diff_sum = (sntp_diff_sum * 7 + (sntp_diff << 12)) / 8;
            uint64_t rtc_diff = rtc_count - rtc_ref;
            rtc_diff_sum = (rtc_diff_sum * 7 + rtc_diff) / 8;
            time_cal = sntp_diff_sum / rtc_diff_sum;
            //
            // The calibation ratio is constrained to be close to the
            // system time_cal value under the assumption that the
            // system value is not too far off.
            uint32_t sys_cal = sdk_system_rtc_clock_cali_proc();
            uint32_t sys_cal_max = sys_cal + sys_cal / 16;
            if (time_cal > sys_cal_max)
                time_cal = sys_cal_max;
            uint32_t sys_cal_min = sys_cal - sys_cal / 16;
            if (time_cal < sys_cal_min)
                time_cal = sys_cal_min;
        }
        sntp_last = sntp_correct;
        rtc_ref = rtc_count;
    }

    xSemaphoreGive(sntp_mutex);

    printf("\n****** RTC Adjust: time %d.%d, drift = %d usec, cal = %d\n", (int)t, us, (int)(sntp_correct - sntp_current), time_cal);
}

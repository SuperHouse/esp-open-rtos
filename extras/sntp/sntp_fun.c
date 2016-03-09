/*
 * Auxiliar functions to handle date/time along with lwIP sntp implementation.
 *
 * Jesus Alonso (doragasu)
 */

#include <stdio.h>
#include <espressif/esp_common.h>
#include <esp/timer.h>
#include <esp/rtc_regs.h>
#include "sntp.h"

#define TIMER_COUNT			RTC.COUNTER

// daylight settings
// Base calculated with value obtained from NTP server (64 bits)
#define sntp_base	(*((uint64_t*)RTC.SCRATCH))
// Timer value when base was obtained
#define tim_ref 	(RTC.SCRATCH[2])

// Setters and getters for CAL, TZ and DST.
#define RTC_CAL_SET(val)	(RTC.SCRATCH[3] |= (val) & 0x0000FFFF)
#define RTC_DST_SET(val)	(RTC.SCRATCH[3] |= ((val)<<16) & 0x00010000)
#define RTC_TZ_SET(val)		(RTC.SCRATCH[3] |= ((val)<<24) & 0xFF000000)

#define RTC_CAL_GET()		(RTC.SCRATCH[3] & 0x0000FFFF)
#define RTC_DST_GET()		((RTC.SCRATCH[3] & 0x00010000)>>16)
#define RTC_TZ_GET()		((((int)RTC.SCRATCH[3]) & ((int)0xFF000000))>>24)

// Implemented in sntp.c
void sntp_init(void);

// Sets time zone. Allowed values are in the range [-11, 13].
// NOTE: Settings do not take effect until SNTP time is updated. It is
void sntp_set_timezone(int time_zone) {
	//tz = time_zone;
	RTC_TZ_SET(time_zone);
}

// Sets daylight.
// NOTE: Settings do not take effect until SNTP time is updated.
void sntp_set_daylight(int day_light) {
	//dst = day_light;
	RTC_DST_SET(day_light);
}


void sntp_initialize(int time_zone, int day_light) {
	sntp_base = 0;
	RTC_TZ_SET(time_zone);
	RTC_DST_SET(day_light);
	// To avoid div by 0 exceptions if requesting time before SNTP config
	RTC_CAL_SET(1);
	tim_ref = TIMER_COUNT;
	sntp_init();
}

// Check if a timer wrap has occurred. Compensate sntp_base reference
// if affirmative.
// TODO: think about multitasking and race conditions
static inline void sntp_check_timer_wrap(uint32_t current_value) {
	if (current_value < tim_ref) {
		// Timer wrap has occurred, compensate by subtracting 2^32 to ref.
		sntp_base -= 1LLU<<32;
		// DEBUG
		printf("\nTIMER WRAPPED!\n");
	}
}

// Return secs. If us is not a null pointer, fill it with usecs
time_t sntp_get_rtc_time(int32_t *us) {
	time_t secs;
	uint32_t tim;
	uint64_t base;

	tim = TIMER_COUNT;
	// Check for timer wrap
	sntp_check_timer_wrap(tim);
	base = sntp_base + tim - tim_ref;
	secs = base * RTC_CAL_GET() / (1000000U<<12);
	if (us) {
		*us = base * RTC_CAL_GET() % (1000000U<<12);
	}
	return secs;
}

/// Update RTC timer. Called by SNTP module each time it receives an update.
void sntp_update_rtc(time_t t, uint32_t us) {
	// Apply daylight and timezone correction
	t += (RTC_TZ_GET() + RTC_DST_GET()) * 3600;
	// DEBUG: Compute and print drift
	int64_t sntp_current = sntp_base + TIMER_COUNT - tim_ref;
	int64_t sntp_correct = (((uint64_t)us + (uint64_t)t * 1000000U)<<12) / RTC_CAL_GET();
	printf("\nRTC Adjust: drift = %ld ticks, cal = %d\n", (time_t)(sntp_correct - sntp_current), RTC_CAL_GET());

	tim_ref = TIMER_COUNT;
	RTC_CAL_SET(sdk_system_rtc_clock_cali_proc());

	sntp_base = (((uint64_t)us + (uint64_t)t * 1000000U)<<12) / RTC_CAL_GET();

	// DEBUG: Print obtained secs and check calculated secs are the same
	time_t deb = sntp_base * RTC_CAL_GET() / (1000000U<<12);
	printf("\nT: %lu, %lu, %s\n", t, deb, ctime(&deb));
}


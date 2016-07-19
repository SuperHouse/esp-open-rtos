/* Driver for DS3231 high precision RTC module
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Richard A Burton <richardaburton@gmail.com>
 * Copyright (C) 2016 Bhuvanchandra DV <bhuvanchandra.dv@gmail.com>
 * MIT Licensed as described in the file LICENSE
*/

#ifndef __DS3231_H__
#define __DS3231_H__

#include <stdint.h>
#include <stdbool.h>
#include <time.h>

#define DS3231_ADDR			0x68

#define DS3231_STAT_OSCILLATOR		0x80
#define DS3231_STAT_32KHZ		0x08
#define DS3231_STAT_BUSY		0x04
#define DS3231_STAT_ALARM_2		0x02
#define DS3231_STAT_ALARM_1		0x01

#define DS3231_CTRL_OSCILLATOR		0x80
#define DS3231_CTRL_SQUAREWAVE_BB	0x40
#define DS3231_CTRL_TEMPCONV		0x20
#define DS3231_CTRL_SQWAVE_4096HZ	0x10
#define DS3231_CTRL_SQWAVE_1024HZ	0x08
#define DS3231_CTRL_SQWAVE_8192HZ	0x18
#define DS3231_CTRL_SQWAVE_1HZ		0x00
#define DS3231_CTRL_ALARM_INTS		0x04
#define DS3231_CTRL_ALARM2_INT		0x02
#define DS3231_CTRL_ALARM1_INT		0x01

#define DS3231_ALARM_WDAY		0x40
#define DS3231_ALARM_NOTSET		0x80

#define DS3231_ADDR_TIME		0x00
#define DS3231_ADDR_ALARM1		0x07
#define DS3231_ADDR_ALARM2		0x0b
#define DS3231_ADDR_CONTROL		0x0e
#define DS3231_ADDR_STATUS		0x0f
#define DS3231_ADDR_AGING		0x10
#define DS3231_ADDR_TEMP		0x11

#define DS3231_12HOUR_FLAG		0x40
#define DS3231_12HOUR_MASK		0x1f
#define DS3231_PM_FLAG			0x20
#define DS3231_MONTH_MASK		0x1f

enum {
	DS3231_SET = 0,
	DS3231_CLEAR,
	DS3231_REPLACE
};

enum {
	DS3231_ALARM_NONE = 0,
	DS3231_ALARM_1,
	DS3231_ALARM_2,
	DS3231_ALARM_BOTH
};

enum {
	DS3231_ALARM1_EVERY_SECOND = 0,
	DS3231_ALARM1_MATCH_SEC,
	DS3231_ALARM1_MATCH_SECMIN,
	DS3231_ALARM1_MATCH_SECMINHOUR,
	DS3231_ALARM1_MATCH_SECMINHOURDAY,
	DS3231_ALARM1_MATCH_SECMINHOURDATE
};

enum {
	DS3231_ALARM2_EVERY_MIN = 0,
	DS3231_ALARM2_MATCH_MIN,
	DS3231_ALARM2_MATCH_MINHOUR,
	DS3231_ALARM2_MATCH_MINHOURDAY,
	DS3231_ALARM2_MATCH_MINHOURDATE
};

bool ds3231_setTime(struct tm *time);
bool ds3231_setAlarm(uint8_t alarms, struct tm *time1, uint8_t option1, struct tm *time2, uint8_t option2);
bool ds3231_getOscillatorStopFlag(bool *flag);
bool ds3231_clearOscillatorStopFlag();
bool ds3231_getAlarmFlags(uint8_t *alarms);
bool ds3231_clearAlarmFlags(uint8_t alarm);
bool ds3231_enableAlarmInts(uint8_t alarms);
bool ds3231_disableAlarmInts(uint8_t alarms);
bool ds3231_enable32khz();
bool ds3231_disable32khz();
bool ds3231_enableSquarewave();
bool ds3231_disableSquarewave();
bool ds3231_setSquarewaveFreq(uint8_t freq);
bool ds3231_getTempInteger(int8_t *temp);
bool ds3231_getTempFloat(float *temp);
bool ds3231_getTime(struct tm *time);
void ds3231_Init(uint8_t scl, uint8_t sda);

#endif

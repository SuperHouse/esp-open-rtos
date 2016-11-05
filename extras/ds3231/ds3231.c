/* Driver for DS3231 high precision RTC module
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Richard A Burton <richardaburton@gmail.com>
 * Copyright (C) 2016 Bhuvanchandra DV <bhuvanchandra.dv@gmail.com>
 * MIT Licensed as described in the file LICENSE
*/

#include "ds3231.h"
#include "espressif/esp_common.h"
#include "espressif/sdk_private.h"
#include "esp8266.h"

#include "i2c/i2c.h"

/* Convert normal decimal to binary coded decimal */
static inline uint8_t  decToBcd(uint8_t dec)
{
    return(((dec / 10) * 16) + (dec % 10));
}

/* Convert binary coded decimal to normal decimal */
static inline uint8_t  bcdToDec(uint8_t bcd)
{
    return(((bcd / 16) * 10) + (bcd % 16));
}

/* Send a number of bytes to the rtc over i2c
 * returns true to indicate success
 */
static inline bool ds3231_send(uint8_t *data, uint8_t len)
{
    return i2c_slave_write(DS3231_ADDR, data, len);
}

/* Read a number of bytes from the rtc over i2c
 * returns true to indicate success
 */
static inline bool ds3231_recv(uint8_t *data, uint8_t len)
{
    return i2c_slave_read(DS3231_ADDR, data[0], data, len);
}

bool ds3231_setTime(struct tm *time)
{
    uint8_t data[8];

    /* start register */
    data[0] = DS3231_ADDR_TIME;
    /* time/date data */
    data[1] = decToBcd(time->tm_sec);
    data[2] = decToBcd(time->tm_min);
    data[3] = decToBcd(time->tm_hour);
    data[4] = decToBcd(time->tm_wday + 1);
    data[5] = decToBcd(time->tm_mday);
    data[6] = decToBcd(time->tm_mon + 1);
    data[7] = decToBcd(time->tm_year - 100);

    return ds3231_send(data, 8);
}

bool ds3231_setAlarm(uint8_t alarms, struct tm *time1, uint8_t option1, struct tm *time2, uint8_t option2)
{
    int i = 0;
    uint8_t data[8];

    /* start register */
    data[i++] = (alarms == DS3231_ALARM_2 ? DS3231_ADDR_ALARM2 : DS3231_ADDR_ALARM1);

    /* alarm 1 data */
    if (alarms != DS3231_ALARM_2) {
        data[i++] = (option1 >= DS3231_ALARM1_MATCH_SEC ? decToBcd(time1->tm_sec) : DS3231_ALARM_NOTSET);
        data[i++] = (option1 >= DS3231_ALARM1_MATCH_SECMIN ? decToBcd(time1->tm_min) : DS3231_ALARM_NOTSET);
        data[i++] = (option1 >= DS3231_ALARM1_MATCH_SECMINHOUR ? decToBcd(time1->tm_hour) : DS3231_ALARM_NOTSET);
        data[i++] = (option1 == DS3231_ALARM1_MATCH_SECMINHOURDAY ? (decToBcd(time1->tm_wday + 1) & DS3231_ALARM_WDAY) :
            (option1 == DS3231_ALARM1_MATCH_SECMINHOURDATE ? decToBcd(time1->tm_mday) : DS3231_ALARM_NOTSET));
    }

    /* alarm 2 data */
    if (alarms != DS3231_ALARM_1) {
        data[i++] = (option2 >= DS3231_ALARM2_MATCH_MIN ? decToBcd(time2->tm_min) : DS3231_ALARM_NOTSET);
        data[i++] = (option2 >= DS3231_ALARM2_MATCH_MINHOUR ? decToBcd(time2->tm_hour) : DS3231_ALARM_NOTSET);
        data[i++] = (option2 == DS3231_ALARM2_MATCH_MINHOURDAY ? (decToBcd(time2->tm_wday + 1) & DS3231_ALARM_WDAY) :
            (option2 == DS3231_ALARM2_MATCH_MINHOURDATE ? decToBcd(time2->tm_mday) : DS3231_ALARM_NOTSET));
    }

    return ds3231_send(data, i);
}

/* Get a byte containing just the requested bits
 * pass the register address to read, a mask to apply to the register and
 * an uint* for the output
 * you can test this value directly as true/false for specific bit mask
 * of use a mask of 0xff to just return the whole register byte
 * returns true to indicate success
 */
bool ds3231_getFlag(uint8_t addr, uint8_t mask, uint8_t *flag)
{
    uint8_t data[1];

    /* get register */
    data[0] = addr;
    if (ds3231_send(data, 1) && ds3231_recv(data, 1)) {
        /* return only requested flag */
        *flag = (data[0] & mask);
        return true;
    }

    return false;
}

/* Set/clear bits in a byte register, or replace the byte altogether
 * pass the register address to modify, a byte to replace the existing
 * value with or containing the bits to set/clear and one of
 * DS3231_SET/DS3231_CLEAR/DS3231_REPLACE
 * returns true to indicate success
 */
bool ds3231_setFlag(uint8_t addr, uint8_t bits, uint8_t mode)
{
    uint8_t data[2];

    data[0] = addr;
    /* get status register */
    if (ds3231_send(data, 1) && ds3231_recv(data+1, 1)) {
        /* clear the flag */
        if (mode == DS3231_REPLACE)
            data[1] = bits;
        else if (mode == DS3231_SET)
            data[1] |= bits;
        else
            data[1] &= ~bits;

        if (ds3231_send(data, 2)) {
            return true;
        }
    }

    return false;
}

bool ds3231_getOscillatorStopFlag(bool *flag)
{
    uint8_t f;

    if (ds3231_getFlag(DS3231_ADDR_STATUS, DS3231_STAT_OSCILLATOR, &f)) {
        *flag = (f ? true : false);
        return true;
    }

    return false;
}

inline bool ds3231_clearOscillatorStopFlag()
{
    return ds3231_setFlag(DS3231_ADDR_STATUS, DS3231_STAT_OSCILLATOR, DS3231_CLEAR);
}

inline bool ds3231_getAlarmFlags(uint8_t *alarms)
{
    return ds3231_getFlag(DS3231_ADDR_STATUS, DS3231_ALARM_BOTH, alarms);
}

inline bool ds3231_clearAlarmFlags(uint8_t alarms)
{
    return ds3231_setFlag(DS3231_ADDR_STATUS, alarms, DS3231_CLEAR);
}

inline bool ds3231_enableAlarmInts(uint8_t alarms)
{
    return ds3231_setFlag(DS3231_ADDR_CONTROL, DS3231_CTRL_ALARM_INTS | alarms, DS3231_SET);
}

inline bool ds3231_disableAlarmInts(uint8_t alarms)
{
    /* Just disable specific alarm(s) requested
     * does not disable alarm interrupts generally (which would enable the squarewave)
     */
    return ds3231_setFlag(DS3231_ADDR_CONTROL, alarms, DS3231_CLEAR);
}

inline bool ds3231_enable32khz()
{
    return ds3231_setFlag(DS3231_ADDR_STATUS, DS3231_STAT_32KHZ, DS3231_SET);
}

inline bool ds3231_disable32khz()
{
    return ds3231_setFlag(DS3231_ADDR_STATUS, DS3231_STAT_32KHZ, DS3231_CLEAR);
}

inline bool ds3231_enableSquarewave()
{
    return ds3231_setFlag(DS3231_ADDR_CONTROL, DS3231_CTRL_ALARM_INTS, DS3231_CLEAR);
}

inline bool ds3231_disableSquarewave()
{
    return ds3231_setFlag(DS3231_ADDR_CONTROL, DS3231_CTRL_ALARM_INTS, DS3231_SET);
}

bool ds3231_setSquarewaveFreq(uint8_t freq)
{
    uint8_t flag = 0;

    if (ds3231_getFlag(DS3231_ADDR_CONTROL, 0xff, &flag)) {
        /* clear current rate */
        flag &= ~DS3231_CTRL_SQWAVE_8192HZ;
        /* set new rate */
        flag |= freq;

        return ds3231_setFlag(DS3231_ADDR_CONTROL, flag, DS3231_REPLACE);
    }
    return false;
}

bool ds3231_getRawTemp(int16_t *temp)
{
    uint8_t data[2];

    data[0] = DS3231_ADDR_TEMP;
    if (ds3231_send(data, 1) && ds3231_recv(data, 2)) {
        *temp = (int16_t)(int8_t)data[0] << 2 | data[1] >> 6;
        return true;
    }

    return false;
}

bool ds3231_getTempInteger(int8_t *temp)
{
    int16_t tInt;

    if (ds3231_getRawTemp(&tInt)) {
        *temp = tInt >> 2;
        return true;
    }

    return false;
}

bool ds3231_getTempFloat(float *temp)
{
    int16_t tInt;

    if (ds3231_getRawTemp(&tInt)) {
        *temp = tInt * 0.25;
        return true;
    }

    return false;
}

bool ds3231_getTime(struct tm *time)
{
    uint8_t data[7];

    /* start register address */
    data[0] = DS3231_ADDR_TIME;
    if (!ds3231_send(data, 1)) {
        return false;
    }

    /* read time */
    if (!ds3231_recv(data, 7)) {
        return false;
    }

    /* convert to unix time structure */
    time->tm_sec = bcdToDec(data[0]);
    time->tm_min = bcdToDec(data[1]);
    if (data[2] & DS3231_12HOUR_FLAG) {
        /* 12H */
        time->tm_hour = bcdToDec(data[2] & DS3231_12HOUR_MASK) - 1;
        /* AM/PM? */
        if (data[2] & DS3231_PM_FLAG) time->tm_hour += 12;
    } else {
        /* 24H */
        time->tm_hour = bcdToDec(data[2]);
    }
    time->tm_wday = bcdToDec(data[3]) - 1;
    time->tm_mday = bcdToDec(data[4]);
    time->tm_mon  = bcdToDec(data[5] & DS3231_MONTH_MASK) - 1;
    time->tm_year = bcdToDec(data[6]) + 100;
    time->tm_isdst = 0;

    // apply a time zone (if you are not using localtime on the rtc or you want to check/apply DST)
    //applyTZ(time);

    return true;
    
}

void ds3231_Init(uint8_t scl, uint8_t sda)
{
    i2c_init(scl, sda);
}

/*
 * Stub time-related functions for TLS time-related operations
 *
 * ESPTODO: Revisit these ASAP as gettimeofday() is used for entropy
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#include <time.h>
#include <sys/time.h>
#include <stdio.h>

time_t time(time_t *t)
{
    return 0;
}

time_t mktime(struct tm *tm)
{
    return 0;
}

int gettimeofday(struct timeval *tv, void *tz)
{
    return 0;
}

void abort(void)
{
    printf("abort() was called.\r\n");
    while(1) {}
}

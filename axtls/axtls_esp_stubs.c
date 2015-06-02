#include <time.h>
#include <sys/time.h>
#include <stdio.h>
/*
 * Stub time functions for TLS time-related operations
 *
 * ESPTODO: Revisit these soon as gettimeofday() is used for entropy
 */

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

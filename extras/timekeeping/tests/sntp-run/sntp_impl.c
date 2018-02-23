/*
 * Test implementation of callback for LWIP SNTP
 *
 * Production code would likely decide how to handle
 * various magnitude changes, and be brisk about it
 */

/*-
 * Copyright (c) 2018, Jeff Kletsky
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *
 *     * Neither the name of the copyright holder nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#include <sys/time.h>

#include <stdlib.h>

#include "sntp_impl.h"


#ifndef SNTP_IMPL_STEP_THRESHOLD
#define SNTP_IMPL_STEP_THRESHOLD 128000
#endif


#define TV2LD(TV) ((long double)TV.tv_sec + (long double)TV.tv_usec * 1.e-6)
#include <stdio.h>


/*
 * Called by lwip/apps/sntp.c through
 * #define SNTP_SET_SYSTEM_TIME_US(S, F) sntp_impl_set_system_time_us(S, F)
 * u32_t matches lwip/apps/sntp.c
 */
void
sntp_impl_set_system_time_us(uint32_t secs, uint32_t us) {

    struct timeval new;
    struct timeval old;
    struct timeval dt;

#ifdef TIMEKEEPING_SET_AND_MEASURE_ONLY
    static long double time_has_been_set_at;
#endif

    gettimeofday(&old, NULL);

    new.tv_sec = secs;
    new.tv_usec = us;

    timersub(&new, &old, &dt);

#ifdef TIMEKEEPING_SET_AND_MEASURE_ONLY

    if (time_has_been_set_at == 0) {
        settimeofday(&new, NULL);
        time_has_been_set_at = TV2LD(new);
    }

    printf("SNTP:  %20.6Lf    delta: %10.3Lf ms %3.1Lf ppm\n",
           TV2LD(new), TV2LD(dt)*1e3, (TV2LD(dt) / (TV2LD(new) - time_has_been_set_at))*1e6);

#else /* Normal operation */

    if (secs || abs(us) > SNTP_IMPL_STEP_THRESHOLD) {
        settimeofday(&new, NULL);
    } else {
        adjtime(&dt, NULL);
    }

    printf("SNTP:  %20.6Lf    delta: %7.3Lf ms\n",
           TV2LD(new), TV2LD(dt)*1e3);

#endif
}

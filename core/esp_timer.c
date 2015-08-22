/* Timer peripheral management functions for esp/timer.h.
 *
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#include <esp/timer.h>
#include <stdio.h>
#include <stdlib.h>

/*
 * These are the runtime implementations for functions that are linked in if any of
 * the arguments aren't known at compile time (values are evaluated at
 * compile time otherwise.)
 */
uint32_t _timer_freq_to_count_runtime(const timer_frc_t frc, const uint32_t freq, const timer_clkdiv_t div)
{
    return _timer_freq_to_count_impl(frc, freq, div);
}

uint32_t _timer_time_to_count_runtime(const timer_frc_t frc, uint32_t us, const timer_clkdiv_t div)
{
    return _timer_time_to_count_runtime(frc, us, div);
}

bool _timer_set_frequency_runtime(const timer_frc_t frc, uint32_t freq)
{
    return _timer_set_frequency_runtime(frc, freq);
}

bool _timer_set_timeout_runtime(const timer_frc_t frc, uint32_t us)
{
    return _timer_set_timeout_impl(frc, us);
}

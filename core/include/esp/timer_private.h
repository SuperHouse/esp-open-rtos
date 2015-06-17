/* Private header parts of the timer API implementation
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#ifndef _ESP_TIMER_PRIVATE_H
#define _ESP_TIMER_PRIVATE_H

#include <limits.h>
#include <stdio.h>
#include <stdlib.h>

/* Timer divisor index to max frequency */
#define _FREQ_DIV1  (80*1000*1000)
#define _FREQ_DIV16 (5*1000*1000)
#define _FREQ_DIV256 312500
const static uint32_t IROM _TIMER_FREQS[] = { _FREQ_DIV1, _FREQ_DIV16, _FREQ_DIV256 };

/* Timer divisor index to divisor value */
const static uint32_t IROM _TIMER_DIV_VAL[] = { 1, 16, 256 };

/* Timer divisor to mask value */
const static uint32_t IROM _TIMER_DIV_REG[] = { TIMER_CTRL_DIV_1, TIMER_CTRL_DIV_16, TIMER_CTRL_DIV_256 };

INLINED esp_reg_t _timer_ctrl_reg(const timer_frc_t frc)
{
    return (frc == TIMER_FRC1) ? &TIMER_FRC1_CTRL_REG : &TIMER_FRC2_CTRL_REG;
}

INLINED uint32_t timer_get_count(const timer_frc_t frc)
{
    return (frc == TIMER_FRC1) ? TIMER_FRC1_COUNT_REG : TIMER_FRC2_COUNT_REG;
}

INLINED uint32_t timer_get_load(const timer_frc_t frc)
{
    return (frc == TIMER_FRC1) ? TIMER_FRC1_LOAD_REG : TIMER_FRC2_LOAD_REG;
}

INLINED void timer_set_load(const timer_frc_t frc, const uint32_t load)
{
    if(frc == TIMER_FRC1)
        TIMER_FRC1_LOAD_REG = load;
    else
        TIMER_FRC2_LOAD_REG = load;
}

INLINED uint32_t timer_max_load(const timer_frc_t frc)
{
    return (frc == TIMER_FRC1) ? TIMER_FRC1_MAX_LOAD : UINT32_MAX;
}

INLINED void timer_set_divider(const timer_frc_t frc, const timer_div_t div)
{
    if(div < TIMER_DIV1 || div > TIMER_DIV256)
        return;
    esp_reg_t ctrl = _timer_ctrl_reg(frc);
    *ctrl = (*ctrl & ~TIMER_CTRL_DIV_MASK) | (_TIMER_DIV_REG[div] & TIMER_CTRL_DIV_MASK);
}

INLINED void timer_set_interrupts(const timer_frc_t frc, bool enable)
{
    const uint32_t dp_bit = (frc == TIMER_FRC1) ? INT_ENABLE_FRC1 : INT_ENABLE_FRC2;
    const uint32_t int_mask = BIT((frc == TIMER_FRC1) ? INUM_TIMER_FRC1 : INUM_TIMER_FRC2);
    if(enable) {
        DP_INT_ENABLE_REG |= dp_bit;
        _xt_isr_unmask(int_mask);
    } else {
        DP_INT_ENABLE_REG &= ~dp_bit;
        _xt_isr_mask(int_mask);
    }
}

INLINED void timer_set_run(const timer_frc_t frc, const bool run)
{
    esp_reg_t ctrl = _timer_ctrl_reg(frc);
    if (run)
        *ctrl |= TIMER_CTRL_RUN;
    else
        *ctrl &= ~TIMER_CTRL_RUN;
}

INLINED bool timer_get_run(const timer_frc_t frc)
{
    return *_timer_ctrl_reg(frc) & TIMER_CTRL_RUN;
}

INLINED void timer_set_reload(const timer_frc_t frc, const bool reload)
{
    esp_reg_t ctrl = _timer_ctrl_reg(frc);
    if (reload)
        *ctrl |= TIMER_CTRL_RELOAD;
    else
        *ctrl &= ~TIMER_CTRL_RELOAD;
}

INLINED bool timer_get_reload(const timer_frc_t frc)
{
    return *_timer_ctrl_reg(frc) & TIMER_CTRL_RELOAD;
}

INLINED timer_div_t timer_freq_to_div(uint32_t freq)
{
    /*
      try to maintain resolution without risking overflows.
      these values are a bit arbitrary at the moment! */
    if(freq > 100*1000)
        return TIMER_DIV1;
    else if(freq > 100)
        return TIMER_DIV16;
    else
        return TIMER_DIV256;
}

/* timer_timer_to_count implementation - inline if all args are constant, call normally otherwise */

INLINED uint32_t _timer_freq_to_count_impl(const timer_frc_t frc, const uint32_t freq, const timer_div_t div)
{
    if(div < TIMER_DIV1 || div > TIMER_DIV256)
        return 0; /* invalid divider */

    if(freq > _TIMER_FREQS[div])
        return 0; /* out of range for given divisor */

    uint64_t counts = _TIMER_FREQS[div]/freq;
    return counts;
}

uint32_t _timer_freq_to_count_runtime(const timer_frc_t frc, const uint32_t freq, const timer_div_t div);

INLINED uint32_t timer_freq_to_count(const timer_frc_t frc, const uint32_t freq, const timer_div_t div)
{
    if(__builtin_constant_p(frc) && __builtin_constant_p(freq) && __builtin_constant_p(div))
        return _timer_freq_to_count_impl(frc, freq, div);
    else
        return _timer_freq_to_count_runtime(frc, freq, div);
}

INLINED timer_div_t timer_time_to_div(uint32_t us)
{
    /*
      try to maintain resolution without risking overflows. Similar to
      timer_freq_to_div, these values are a bit arbitrary at the
      moment! */
    if(us < 1000)
        return TIMER_DIV1;
    else if(us < 10*1000)
        return TIMER_DIV16;
    else
        return TIMER_DIV256;
}

/* timer_timer_to_count implementation - inline if all args are constant, call normally otherwise */

INLINED uint32_t _timer_time_to_count_impl(const timer_frc_t frc, uint32_t us, const timer_div_t div)
{
    if(div < TIMER_DIV1 || div > TIMER_DIV256)
        return 0; /* invalid divider */

    const uint32_t TIMER_MAX = timer_max_load(frc);

    if(div != TIMER_DIV256) /* timer tick in MHz */
    {
        /* timer is either 80MHz or 5MHz, so either 80 or 5 MHz counts per us */
        const uint32_t counts_per_us = ((div == TIMER_DIV1) ? _FREQ_DIV1 : _FREQ_DIV16)/1000/1000;
        if(us > TIMER_MAX/counts_per_us)
            return 0; /* Multiplying us by mhz_per_count will overflow TIMER_MAX */
        return us*counts_per_us;
    }
    else /* /256 divider, 312.5kHz freq so need to scale up */
    {
        /* derived from naive floating point equation that we can't use:
        counts = (us/1000/1000)*_FREQ_DIV256;
        counts = (us/2000)*(_FREQ_DIV256/500);
        counts = us*(_FREQ_DIV256/500)/2000;
        */
        const uint32_t scalar = _FREQ_DIV256/500;
        if(us > 1+UINT32_MAX/scalar)
            return 0; /* Multiplying us by _FREQ_DIV256/500 will overflow uint32_t */

        uint32_t counts = (us*scalar)/2000;
        if(counts > TIMER_MAX)
            return 0; /* counts value too high for timer type */
        return counts;
    }
}

uint32_t _timer_time_to_count_runtime(const timer_frc_t frc, uint32_t us, const timer_div_t div);

INLINED uint32_t timer_time_to_count(const timer_frc_t frc, uint32_t us, const timer_div_t div)
{
    if(__builtin_constant_p(frc) && __builtin_constant_p(us) && __builtin_constant_p(div))
        return _timer_time_to_count_impl(frc, us, div);
    else
        return _timer_time_to_count_runtime(frc, us, div);
}

/* timer_set_frequency implementation - inline if all args are constant, call normally otherwise */

INLINED bool _timer_set_frequency_impl(const timer_frc_t frc, uint32_t freq)
{
    uint32_t counts = 0;
    timer_div_t div = timer_freq_to_div(freq);

    counts = timer_freq_to_count(frc, freq, div);
    if(counts == 0)
    {
        printf("ABORT: No counter for timer %d frequency %d\r\n", frc, freq);
        abort();
    }

    timer_set_divider(frc, div);
    if(frc == TIMER_FRC1)
    {
        timer_set_load(frc, counts);
        timer_set_reload(frc, true);
    }
    else /* FRC2 */
    {
        /* assume that if this overflows it'll wrap, so we'll get desired behaviour */
        TIMER_FRC2_MATCH_REG = counts + TIMER_FRC2_COUNT_REG;
    }
    return true;
}

bool _timer_set_frequency_runtime(const timer_frc_t frc, uint32_t freq);

INLINED bool timer_set_frequency(const timer_frc_t frc, uint32_t freq)
{
    if(__builtin_constant_p(frc) && __builtin_constant_p(freq))
        return _timer_set_frequency_impl(frc, freq);
    else
        return _timer_set_frequency_runtime(frc, freq);
}

/* timer_set_timeout implementation - inline if all args are constant, call normally otherwise */

INLINED bool _timer_set_timeout_impl(const timer_frc_t frc, uint32_t us)
{
    uint32_t counts = 0;
    timer_div_t div = timer_time_to_div(us);

    counts = timer_time_to_count(frc, us, div);
    if(counts == 0)
        return false; /* can't set frequency */

    timer_set_divider(frc, div);
    if(frc == TIMER_FRC1)
    {
        timer_set_load(frc, counts);
    }
    else /* FRC2 */
    {
        TIMER_FRC2_MATCH_REG = counts + TIMER_FRC2_COUNT_REG;
    }

    return true;
}

bool _timer_set_timeout_runtime(const timer_frc_t frc, uint32_t us);

INLINED bool timer_set_timeout(const timer_frc_t frc, uint32_t us)
{
    if(__builtin_constant_p(frc) && __builtin_constant_p(us))
        return _timer_set_timeout_impl(frc, us);
    else
        return _timer_set_timeout_runtime(frc, us);
}



#endif

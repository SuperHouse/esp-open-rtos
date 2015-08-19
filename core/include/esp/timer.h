/** esp/timer.h
 *
 * Timer (FRC1 & FRC2) functions.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#ifndef _ESP_TIMER_H
#define _ESP_TIMER_H

#include <stdbool.h>
#include <xtensa_interrupts.h>
#include "esp/timer_regs.h"
#include "esp/cpu.h"

typedef enum {
    FRC1 = 0,
    FRC2 = 1,
} timer_frc_t;

/* Return current count value for timer. */
INLINED uint32_t timer_get_count(const timer_frc_t frc);

/* Return current load value for timer. */
INLINED uint32_t timer_get_load(const timer_frc_t frc);

/* Write load value for timer. */
INLINED void timer_set_load(const timer_frc_t frc, const uint32_t load);

/* Returns maximum load value for timer. */
INLINED uint32_t timer_max_load(const timer_frc_t frc);

/* Set the timer divider value */
INLINED void timer_set_divider(const timer_frc_t frc, const timer_clkdiv_t div);

/* Enable or disable timer interrupts

   This both sets the xtensa interrupt mask and writes to the DPORT register
   that allows timer interrupts.
*/
INLINED void timer_set_interrupts(const timer_frc_t frc, bool enable);

/* Turn the timer on or off */
INLINED void timer_set_run(const timer_frc_t frc, const bool run);

/* Get the run state of the timer (on or off) */
INLINED bool timer_get_run(const timer_frc_t frc);

/* Set timer auto-reload on or off */
INLINED void timer_set_reload(const timer_frc_t frc, const bool reload);

/* Get the auto-reload state of the timer (on or off) */
INLINED bool timer_get_reload(const timer_frc_t frc);

/* Return a suitable timer divider for the specified frequency,
   or -1 if none is found.
 */
INLINED timer_clkdiv_t timer_freq_to_div(uint32_t freq);

/* Return the number of timer counts to achieve the specified
 * frequency with the specified divisor.
 *
 * frc parameter is used to check out-of-range values for timer size.
 *
 * Returns 0 if the given freq/divisor combo cannot be achieved.
 *
 * Compile-time evaluates if all arguments are available at compile time.
 */
INLINED uint32_t timer_freq_to_count(const timer_frc_t frc, uint32_t freq, const timer_clkdiv_t div);

/* Return a suitable timer divider for the specified duration in
   microseconds or -1 if none is found.
 */
INLINED timer_clkdiv_t timer_time_to_div(uint32_t us);

/* Return the number of timer counts for the specified timer duration
 * in microseconds, when using the specified divisor.
 *
 * frc paraemter is used to check out-of-range values for timer size.
 *
 * Returns 0 if the given time/divisor combo cannot be achieved.
 *
 * Compile-time evaluates if all arguments are available at compile time.
 */
INLINED uint32_t timer_time_to_count(const timer_frc_t frc, uint32_t us, const timer_clkdiv_t div);

/* Set a target timer interrupt frequency in Hz.

   For FRC1 this sets the timer load value and enables autoreload so
   the interrupt will fire regularly with the target frequency.

   For FRC2 this sets the timer match value so the next interrupt
   comes in line with the target frequency. However this won't repeat
   automatically, you have to call timer_set_frequency again when the
   timer interrupt runs.

   Will change the timer divisor value to suit the target frequency.

   Does not start/stop the timer, you have to do this manually via
   timer_set_run.

   Returns true on success, false if given frequency could not be set.

   Compile-time evaluates to simple register writes if all arguments
   are available at compile time.
*/
INLINED bool timer_set_frequency(const timer_frc_t frc, uint32_t freq);

/* Sets the timer for a oneshot interrupt in 'us' microseconds.

   Will change the timer divisor value to suit the target time.

   Does not change the autoreload setting.

   For FRC2 this sets the timer match value relative to the current
   load value.

   Note that for a true "one shot" timeout with FRC1 then you need to
   also disable FRC1 in the timer interrupt handler by calling
   timer_set_run(TIMER_FRC1, false);

   Returns true if the timeout was successfully set.

   Compile-time evaluates to simple register writes if all arguments
   are available at compile time.
*/
INLINED bool timer_set_timeout(const timer_frc_t frc, uint32_t us);

#include "timer_private.h"

#endif

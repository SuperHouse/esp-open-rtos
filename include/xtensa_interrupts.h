/* Xtensa interrupt management functions
 *
 * Some (w/ sdk_ prefix) are implemented in binary libs, rest are
 * inlines replacing functions in the binary libraries.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#ifndef _XTENSA_INTERRUPTS_H
#define _XTENSA_INTERRUPTS_H
#include <stdint.h>
#include <stdbool.h>
#include <xtruntime.h>
#include <xtensa/hal.h>
#include <common_macros.h>

void sdk__xt_int_exit (void);
void _xt_user_exit (void);
void sdk__xt_tick_timer_init (void);
void sdk__xt_timer_int1(void);

INLINED uint32_t _xt_get_intlevel(void)
{
    uint32_t level;
    __asm__ volatile("rsr %0, intlevel" : "=a"(level));
    return level;
}

/* Disable interrupts and return the old ps value, to pass into
   _xt_restore_interrupts later.

   This is desirable to use in place of
   portDISABLE_INTERRUPTS/portENABLE_INTERRUPTS for
   non-FreeRTOS & non-portable code.
*/
INLINED uint32_t _xt_disable_interrupts(void)
{
    uint32_t old_level;
    __asm__ volatile ("rsil %0, " XTSTR(XCHAL_EXCM_LEVEL) : "=a" (old_level));
    return old_level;
}

/* Restore PS level. Intended to be used with _xt_disable_interrupts */
INLINED void _xt_restore_interrupts(uint32_t new_ps)
{
    __asm__ volatile ("wsr %0, ps; rsync" :: "a" (new_ps));
}

/* ESPTODO: the mask/unmask functions aren't thread safe */

INLINED void _xt_isr_unmask(uint32_t unmask)
{
    uint32_t intenable;
    asm volatile ("rsr %0, intenable" : "=a" (intenable));
    intenable |= unmask;
    asm volatile ("wsr %0, intenable; esync" :: "a" (intenable));
}

INLINED void _xt_isr_mask (uint32_t mask)
{
    uint32_t intenable;
    asm volatile ("rsr %0, intenable" : "=a" (intenable));
    intenable &= ~mask;
    asm volatile ("wsr %0, intenable; esync" :: "a" (intenable));
}

INLINED uint32_t _xt_read_ints (void)
{
    uint32_t interrupt;
    asm volatile ("rsr %0, interrupt" : "=a" (interrupt));
    return interrupt;
}

INLINED void _xt_clear_ints(uint32_t mask)
{
    asm volatile ("wsr %0, intclear; esync" :: "a" (mask));
}

typedef void (* _xt_isr)(void);
/* This function is implemeneted in FreeRTOS port.c at the moment,
   should be moved or converted to an inline */
void        _xt_isr_attach (uint8_t i, _xt_isr func);

#endif

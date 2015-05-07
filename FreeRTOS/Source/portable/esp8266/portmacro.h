/*
    FreeRTOS V7.5.2 - Copyright (C) 2013 Real Time Engineers Ltd.

    VISIT http://www.FreeRTOS.org TO ENSURE YOU ARE USING THE LATEST VERSION.

    ***************************************************************************
     *                                                                       *
     *    FreeRTOS provides completely free yet professionally developed,    *
     *    robust, strictly quality controlled, supported, and cross          *
     *    platform software that has become a de facto standard.             *
     *                                                                       *
     *    Help yourself get started quickly and support the FreeRTOS         *
     *    project by purchasing a FreeRTOS tutorial book, reference          *
     *    manual, or both from: http://www.FreeRTOS.org/Documentation        *
     *                                                                       *
     *    Thank you!                                                         *
     *                                                                       *
    ***************************************************************************

    This file is part of the FreeRTOS distribution.

    FreeRTOS is free software; you can redistribute it and/or modify it under
    the terms of the GNU General Public License (version 2) as published by the
    Free Software Foundation >>!AND MODIFIED BY!<< the FreeRTOS exception.

    >>! NOTE: The modification to the GPL is included to allow you to distribute
    >>! a combined work that includes FreeRTOS without being obliged to provide
    >>! the source code for proprietary components outside of the FreeRTOS
    >>! kernel.

    FreeRTOS is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    FOR A PARTICULAR PURPOSE.  Full license text is available from the following
    link: http://www.freertos.org/a00114.html

    1 tab == 4 spaces!

    ***************************************************************************
     *                                                                       *
     *    Having a problem?  Start by reading the FAQ "My application does   *
     *    not run, what could be wrong?"                                     *
     *                                                                       *
     *    http://www.FreeRTOS.org/FAQHelp.html                               *
     *                                                                       *
    ***************************************************************************

    http://www.FreeRTOS.org - Documentation, books, training, latest versions,
    license and Real Time Engineers Ltd. contact details.

    http://www.FreeRTOS.org/plus - A selection of FreeRTOS ecosystem products,
    including FreeRTOS+Trace - an indispensable productivity tool, a DOS
    compatible FAT file system, and our tiny thread aware UDP/IP stack.

    http://www.OpenRTOS.com - Real Time Engineers ltd license FreeRTOS to High
    Integrity Systems to sell under the OpenRTOS brand.  Low cost OpenRTOS
    licenses offer ticketed support, indemnification and middleware.

    http://www.SafeRTOS.com - High Integrity Systems also provide a safety
    engineered and independently SIL3 certified version for use in safety and
    mission critical applications that require provable dependability.

    1 tab == 4 spaces!
*/


#ifndef PORTMACRO_H
#define PORTMACRO_H

#ifdef __cplusplus
extern "C" {
#endif

#include "esp_common.h"
#include    <xtruntime.h>
#include    "xtensa_rtos.h"

/*-----------------------------------------------------------
 * Port specific definitions for ESP8266
 *
 * The settings in this file configure FreeRTOS correctly for the
 * given hardware and compiler.
 *
 * These settings should not be altered.
 *-----------------------------------------------------------
 */

/* Type definitions. */
#define portCHAR                char
#define portFLOAT               float
#define portDOUBLE              double
#define portLONG                long
#define portSHORT               short
#define portSTACK_TYPE          unsigned portLONG
#define portBASE_TYPE           long

typedef unsigned portLONG portTickType;

#define portMAX_DELAY (( portTickType ) UINT32_MAX)
/*-----------------------------------------------------------*/

/* Architecture specifics. */
#define portSTACK_GROWTH			( -1 )
#define portTICK_RATE_MS			( ( portTickType ) 1000 / configTICK_RATE_HZ )
#define portBYTE_ALIGNMENT			8
/*-----------------------------------------------------------*/

enum SVC_ReqType {
  SVC_Software = 1,
  SVC_MACLayer = 2,
};

/* Scheduler utilities. */
void PendSV(enum SVC_ReqType);
#define portYIELD()	PendSV(SVC_Software)

/* Task utilities. */
#define portEND_SWITCHING_ISR( xSwitchRequired )			\
    {									\
	extern void vTaskSwitchContext( void );				\
									\
	if( xSwitchRequired )						\
	{								\
	    vTaskSwitchContext();					\
	}								\
    }

/*-----------------------------------------------------------*/

extern char NMIIrqIsOn;
extern char level1_int_disabled;
extern unsigned cpu_sr;

/* ESPTODO: Currently we store the old interrupt level (ps) in a global variable
   cpu_sr. It may not be necessary to do this, but it depends on how the blob libraries
   call into these functions.
*/
inline static __attribute__((always_inline)) void _esp_disable_interrupts(void)
{
    if(!NMIIrqIsOn && !level1_int_disabled) {
	__asm__ volatile ("rsil %0, " XTSTR(XCHAL_EXCM_LEVEL) : "=a" (cpu_sr) :: "memory");
	level1_int_disabled = 1;
    }
}

inline static __attribute__((always_inline)) void _esp_enable_interrupts(void)
{
    if(!NMIIrqIsOn && level1_int_disabled) {
	level1_int_disabled = 0;
	__asm__ volatile ("wsr %0, ps" :: "a" (cpu_sr) : "memory");
    }
}

/* Disable interrupts, saving previous state in cpu_sr */
#define  portDISABLE_INTERRUPTS() _esp_disable_interrupts()

/* Restore interrupts to previous level saved in cpu_sr */
#define  portENABLE_INTERRUPTS() _esp_enable_interrupts()

/* Critical section management. */
void vPortEnterCritical( void );
void vPortExitCritical( void );

#define portENTER_CRITICAL()                vPortEnterCritical()
#define portEXIT_CRITICAL()                 vPortExitCritical()

/* Task function macros as described on the FreeRTOS.org WEB site.  These are
not necessary for to use this port.  They are defined so the common demo files
(which build with all the ports) will build. */
#define portTASK_FUNCTION_PROTO( vFunction, pvParameters ) void vFunction( void *pvParameters )
#define portTASK_FUNCTION( vFunction, pvParameters ) void vFunction( void *pvParameters )
/*-----------------------------------------------------------*/

/* XTensa interrupt management functions, used in port.c.
   Implementations in blob libs */
void        _xt_int_exit (void);
void        _xt_user_exit (void);
void        _xt_tick_timer_init (void);
void        _xt_isr_unmask (uint32_t unmask);
void        _xt_isr_mask (uint32_t mask);
uint32_t    _xt_read_ints (void);
void        _xt_clear_ints(uint32_t mask);
typedef void (* _xt_isr)(void);
void        _xt_isr_attach (uint8_t i, _xt_isr func);
void	    _xt_timer_int1(void);

#ifdef __cplusplus
}
#endif

#endif /* PORTMACRO_H */


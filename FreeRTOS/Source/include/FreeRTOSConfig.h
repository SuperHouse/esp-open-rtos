/*
    FreeRTOS V9.0.1 - Copyright (C) 2017 Real Time Engineers Ltd.
    All rights reserved

    VISIT http://www.FreeRTOS.org TO ENSURE YOU ARE USING THE LATEST VERSION.

    This file is part of the FreeRTOS distribution.

    FreeRTOS is free software; you can redistribute it and/or modify it under
    the terms of the GNU General Public License (version 2) as published by the
    Free Software Foundation >>>> AND MODIFIED BY <<<< the FreeRTOS exception.

    ***************************************************************************
    >>!   NOTE: The modification to the GPL is included to allow you to     !<<
    >>!   distribute a combined work that includes FreeRTOS without being   !<<
    >>!   obliged to provide the source code for proprietary components     !<<
    >>!   outside of the FreeRTOS kernel.                                   !<<
    ***************************************************************************

    FreeRTOS is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    FOR A PARTICULAR PURPOSE.  Full license text is available on the following
    link: http://www.freertos.org/a00114.html


    For esp-open-rtos, you can override settings in here by creating your own
    FreeRTOSConfig.h file in your program directory. You could just copy this
    file there and edit it, but it's recommended you instead define whatever you
    want to override and then use #include_next<FreeRTOSConfig.h> to pick up
    these defaults. The "blink" example in "examples/blink" provides an example
    of how to do this.

    1 tab == 4 spaces!
*/

#ifndef __DEFAULT_FREERTOS_CONFIG_H
#define __DEFAULT_FREERTOS_CONFIG_H

/*-----------------------------------------------------------
 * Application specific definitions.
 *
 * These definitions should be adjusted for your particular hardware and
 * application requirements.
 *
 * THESE PARAMETERS ARE DESCRIBED WITHIN THE 'CONFIGURATION' SECTION OF THE
 * FreeRTOS API DOCUMENTATION AVAILABLE ON THE FreeRTOS.org WEB SITE.
 *
 * See http://www.freertos.org/a00110.html.
 *----------------------------------------------------------*/
#ifndef configUSE_PREEMPTION
#define configUSE_PREEMPTION		1
#endif
#ifndef configUSE_IDLE_HOOK
#define configUSE_IDLE_HOOK			0
#endif
#ifndef configUSE_TICK_HOOK
#define configUSE_TICK_HOOK			0
#endif
#ifndef configCPU_CLOCK_HZ
/* This is the _default_ clock speed for the CPU. Can be either 80MHz
 * or 160MHz, and the system will set the clock speed to match at startup.
 *
 * Note that it's possible to change the clock speed at runtime, so you
 * can/should use sdk_system_get_cpu_frequency() in order to determine the
 * current CPU frequency, in preference to this macro.
 */
#define configCPU_CLOCK_HZ			( ( unsigned long ) 80000000 )
#endif
#ifndef configTICK_RATE_HZ
#define configTICK_RATE_HZ			( ( TickType_t ) 100 )
#endif
#ifndef configMAX_PRIORITIES
#define configMAX_PRIORITIES		( 15 )
#endif
#ifndef configMINIMAL_STACK_SIZE
#define configMINIMAL_STACK_SIZE	( ( unsigned short )256 )
#endif
#ifndef configTOTAL_HEAP_SIZE
#define configTOTAL_HEAP_SIZE		( ( size_t ) ( 32 * 1024 ) )
#endif
#ifndef configMAX_TASK_NAME_LEN
#define configMAX_TASK_NAME_LEN		( 16 )
#endif
#ifndef configUSE_TRACE_FACILITY
#define configUSE_TRACE_FACILITY	0
#endif
#ifndef configUSE_STATS_FORMATTING_FUNCTIONS
#define configUSE_STATS_FORMATTING_FUNCTIONS 0
#endif
#ifndef configUSE_16_BIT_TICKS
#define configUSE_16_BIT_TICKS		0
#endif
#ifndef configIDLE_SHOULD_YIELD
#define configIDLE_SHOULD_YIELD		1
#endif

#ifndef INCLUDE_xTaskGetIdleTaskHandle
#define INCLUDE_xTaskGetIdleTaskHandle 1
#endif
#ifndef INCLUDE_xTimerGetTimerDaemonTaskHandle
#define INCLUDE_xTimerGetTimerDaemonTaskHandle 1
#endif

#ifndef configCHECK_FOR_STACK_OVERFLOW
#define configCHECK_FOR_STACK_OVERFLOW  2
#endif
#ifndef configUSE_MUTEXES
#define configUSE_MUTEXES  1
#endif
#ifndef configUSE_TIMERS
#define configUSE_TIMERS    1
#endif

#if configUSE_TIMERS
#ifndef configTIMER_TASK_PRIORITY
#define configTIMER_TASK_PRIORITY ( tskIDLE_PRIORITY + 2 )
#endif
#ifndef configTIMER_QUEUE_LENGTH
#define configTIMER_QUEUE_LENGTH (10)
#endif
#ifndef configTIMER_TASK_STACK_DEPTH
#define configTIMER_TASK_STACK_DEPTH  ( ( unsigned short ) 512 )
#endif
#endif

/* Co-routine definitions. */
#ifndef configUSE_CO_ROUTINES
#define configUSE_CO_ROUTINES 		0
#endif
#ifndef configMAX_CO_ROUTINE_PRIORITIES
#define configMAX_CO_ROUTINE_PRIORITIES ( 2 )
#endif

#ifndef configUSE_NEWLIB_REENTRANT
#define configUSE_NEWLIB_REENTRANT 1
#endif

/* Set the following definitions to 1 to include the API function, or zero
to exclude the API function. */
#ifndef INCLUDE_vTaskPrioritySet
#define INCLUDE_vTaskPrioritySet		1
#endif
#ifndef INCLUDE_uxTaskPriorityGet
#define INCLUDE_uxTaskPriorityGet		1
#endif
#ifndef INCLUDE_vTaskDelete
#define INCLUDE_vTaskDelete				1
#endif
#ifndef INCLUDE_vTaskCleanUpResource
#define INCLUDE_vTaskCleanUpResources	0
#endif
#ifndef INCLUDE_vTaskSuspend
#define INCLUDE_vTaskSuspend			1
#endif
#ifndef INCLUDE_vTaskDelayUntil
#define INCLUDE_vTaskDelayUntil			1
#endif
#ifndef INCLUDE_vTaskDelay
#define INCLUDE_vTaskDelay				1
#endif

/*set the #define for debug info*/
#ifndef INCLUDE_xTaskGetCurrentTaskHandle
#define INCLUDE_xTaskGetCurrentTaskHandle 1
#endif
#ifndef INCLUDE_uxTaskGetStackHighWaterMark
#define INCLUDE_uxTaskGetStackHighWaterMark 1
#endif

#ifndef configENABLE_BACKWARD_COMPATIBILITY
#define configENABLE_BACKWARD_COMPATIBILITY 0
#endif

/* Normal assert() semantics without relying on the provision of an assert.h
header file. */
void vAssertCalled(const char * pcFile, unsigned long ulLine);
#define configASSERT(x) if((x) == 0) vAssertCalled(__FILE__, __LINE__);

#endif /* __DEFAULT_FREERTOS_CONFIG_H */


/*
    FreeRTOS V9.0.1 - Copyright (C) 2017 Real Time Engineers Ltd.

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

/*-----------------------------------------------------------
 * Implementation of functions defined in portable.h for ESP8266
 *
 * This is based on the version supplied in esp_iot_rtos_sdk,
 * which is in turn based on the ARM CM3 port.
 *----------------------------------------------------------*/

#include <xtensa/config/core.h>
#include <malloc.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <xtensa_ops.h>

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "xtensa_rtos.h"

unsigned cpu_sr;
char level1_int_disabled;

/* Supervisor stack pointer entry. This is the "high water mark" of
   how far the supervisor stack grew down before task started. Is zero
   before the scheduler starts.

 After the scheduler starts, task stacks are all allocated from the
 heap and FreeRTOS checks for stack overflow.
*/
void *xPortSupervisorStackPointer;

void vAssertCalled(const char * pcFile, unsigned long ulLine)
{
    printf("rtos assert %s %lu\n", pcFile, ulLine);
    abort();
    //for (;;);
}

/*
 * Stack initialization
 */
portSTACK_TYPE *pxPortInitialiseStack( portSTACK_TYPE *pxTopOfStack, TaskFunction_t pxCode, void *pvParameters )
{
    #define SET_STKREG(r,v) sp[(r) >> 2] = (portSTACK_TYPE)(v)
    portSTACK_TYPE *sp, *tp;

    /* Create interrupt stack frame aligned to 16 byte boundary */
    sp = (portSTACK_TYPE*) (((uint32_t)(pxTopOfStack + 1) - XT_CP_SIZE - XT_STK_FRMSZ) & ~0xf);

    /* Clear the entire frame (do not use memset() because we don't depend on C library) */
    for (tp = sp; tp <= pxTopOfStack; ++tp)
        *tp = 0;

    /* Explicitly initialize certain saved registers */
    SET_STKREG( XT_STK_PC,      pxCode                        );  /* task entrypoint                  */
    SET_STKREG( XT_STK_A0,      0                           );  /* to terminate GDB backtrace       */
    SET_STKREG( XT_STK_A1,      (uint32_t)sp + XT_STK_FRMSZ   );  /* physical top of stack frame      */
    SET_STKREG( XT_STK_A2,      pvParameters   );           /* parameters      */
    SET_STKREG( XT_STK_EXIT,    _xt_user_exit               );  /* user exception exit dispatcher   */

    /* Set initial PS to int level 0, EXCM disabled ('rfe' will enable), user mode. */
    SET_STKREG( XT_STK_PS,      PS_UM | PS_EXCM     );
    return sp;
}

static int pending_soft_sv;
static int pending_maclayer_sv;

/*
 * The portYIELD macro calls PendSV with SVC_Software to set a pending interrupt
 * service callback that allows a task switch, and this occur when interrupts
 * are enabled which might be after exiting the critical region below.
 *
 * The wdev NMI calls this function from pp_post() with SVC_MACLayer to set a
 * pending interrupt service callback which flushs the queue of messages that
 * the NMI stashes away. This interrupt will be triggered after the return from
 * the NMI and when interrupts are enabled. The NMI can not touch the FreeRTOS
 * queues itself. The NMI must not touch the interrupt masks so that path must
 * not call vPortEnterCritical and vPortExitCritical.
 */
void IRAM PendSV(enum SVC_ReqType req)
{
    if (req == SVC_Software) {
        vPortEnterCritical();
        pending_soft_sv = 1;
        WSR(BIT(INUM_SOFT), interrupt);
        vPortExitCritical();
    } else if (req == SVC_MACLayer) {
        pending_maclayer_sv= 1;
        WSR(BIT(INUM_SOFT), interrupt);
    }
}

/* This MAC layer ISR handler is defined in libpp.a, and is called
 * after a Blob SV requests a soft interrupt by calling
 * PendSV(SVC_MACLayer).
 */
extern portBASE_TYPE sdk_MacIsrSigPostDefHdl(void);

void IRAM SV_ISR(void)
{
    portBASE_TYPE xHigherPriorityTaskWoken = pdFALSE ;
    if (pending_maclayer_sv) {
        xHigherPriorityTaskWoken = sdk_MacIsrSigPostDefHdl();
        pending_maclayer_sv = 0;
    }
    if (xHigherPriorityTaskWoken || pending_soft_sv) {
        sdk__xt_timer_int1();
        pending_soft_sv = 0;
    }
}

void xPortSysTickHandle (void)
{
    if (xTaskIncrementTick() != pdFALSE) {
        vTaskSwitchContext();
    }
}

/*
 * See header file for description.
 */
portBASE_TYPE xPortStartScheduler( void )
{
    _xt_isr_attach(INUM_SOFT, SV_ISR);
    _xt_isr_unmask(BIT(INUM_SOFT));

    /* Initialize system tick timer interrupt and schedule the first tick. */
    _xt_isr_attach(INUM_TICK, sdk__xt_timer_int);
    _xt_isr_unmask(BIT(INUM_TICK));
    sdk__xt_tick_timer_init();

    vTaskSwitchContext();

    /* mark the supervisor stack pointer high water mark. xt_int_exit
       actually frees ~0x50 bytes off the stack, so this value is
       conservative.
    */
    __asm__ __volatile__ ("mov %0, a1\n" : "=a"(xPortSupervisorStackPointer));

    sdk__xt_int_exit();

    /* Should not get here as the tasks are now running! */
    return pdTRUE;
}

/* Determine free heap size via libc sbrk function & mallinfo

   sbrk gives total size in totally unallocated memory,
   mallinfo.fordblks gives free space inside area dedicated to heap.

   mallinfo is possibly non-portable, although glibc & newlib both support
   the fordblks member.
*/
size_t xPortGetFreeHeapSize( void )
{
    struct mallinfo mi = mallinfo();
    uint32_t brk_val = (uint32_t) sbrk(0);

    intptr_t sp = (intptr_t)xPortSupervisorStackPointer;
    if (sp == 0) {
        /* scheduler not started */
        SP(sp);
    }
    return sp - brk_val + mi.fordblks;
}

void vPortEndScheduler( void )
{
    /* No-op, nothing to return to */
}

/*-----------------------------------------------------------*/

static unsigned portBASE_TYPE uxCriticalNesting = 0;

/* These nested vPortEnter/ExitCritical macros are called by SDK
 * libraries in libmain, libnet80211, libpp
 *
 * It may be possible to replace the global nesting count variable
 * with a save/restore of interrupt level, although it's difficult as
 * the functions have no return value.
 *
 * These should not be called from the NMI in regular operation and
 * the NMI must not touch the interrupt mask, but that might occur in
 * exceptional paths such as aborts and debug code.
 */
void IRAM vPortEnterCritical(void) {
    portDISABLE_INTERRUPTS();
    uxCriticalNesting++;
}

/*-----------------------------------------------------------*/

void IRAM vPortExitCritical(void) {
    uxCriticalNesting--;
    if (uxCriticalNesting == 0)
        portENABLE_INTERRUPTS();
}

/* Backward compatibility, for the sdk library. */

signed portBASE_TYPE xTaskGenericCreate(TaskFunction_t pxTaskCode,
                                        const signed char * const pcName,
                                        unsigned short usStackDepth,
                                        void *pvParameters,
                                        unsigned portBASE_TYPE uxPriority,
                                        TaskHandle_t *pxCreatedTask,
                                        portSTACK_TYPE *puxStackBuffer,
                                        const MemoryRegion_t * const xRegions) {
    (void)puxStackBuffer;
    (void)xRegions;
    return xTaskCreate(pxTaskCode, (const char * const)pcName, usStackDepth,
                       pvParameters, uxPriority, pxCreatedTask);
}

BaseType_t xQueueGenericReceive(QueueHandle_t xQueue, void * const pvBuffer,
                                TickType_t xTicksToWait, const BaseType_t xJustPeeking) {
    configASSERT(xJustPeeking == 0);
    return xQueueReceive(xQueue, pvBuffer, xTicksToWait);
}

/* Code for dumping status/debug output/etc, including fatal
 * exception handling.
 *
 * Part of esp-open-rtos
 *
 * Partially reverse engineered from MIT licensed Espressif RTOS SDK Copyright (C) Espressif Systems.
 * Additions Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#include <string.h>
#include <stdio.h>
#include <FreeRTOS.h>
#include <task.h>

#include "debug_dumps.h"
#include "common_macros.h"
#include "xtensa_ops.h"
#include "esp/rom.h"
#include "esp/uart.h"
#include "espressif/esp_common.h"
#include "sdk_internal.h"

void dump_excinfo(void) {
    uint32_t exccause, epc1, epc2, epc3, excvaddr, depc, excsave1;
    uint32_t excinfo[8];

    RSR(exccause, exccause);
    printf("Fatal exception (%d): \n", (int)exccause);
    RSR(epc1, epc1);
    RSR(epc2, epc2);
    RSR(epc3, epc3);
    RSR(excvaddr, excvaddr);
    RSR(depc, depc);
    RSR(excsave1, excsave1);
    printf("%s=0x%08x\n", "epc1", epc1);
    printf("%s=0x%08x\n", "epc2", epc2);
    printf("%s=0x%08x\n", "epc3", epc3);
    printf("%s=0x%08x\n", "excvaddr", excvaddr);
    printf("%s=0x%08x\n", "depc", depc);
    printf("%s=0x%08x\n", "excsave1", excsave1);
    sdk_system_rtc_mem_read(0, excinfo, 32); // Why?
    excinfo[0] = 2;
    excinfo[1] = exccause;
    excinfo[2] = epc1;
    excinfo[3] = epc2;
    excinfo[4] = epc3;
    excinfo[5] = excvaddr;
    excinfo[6] = depc;
    excinfo[7] = excsave1;
    sdk_system_rtc_mem_write(0, excinfo, 32);
}

/* There's a lot of smart stuff we could do while dumping stack
   but for now we just dump a likely looking section of stack
   memory
*/
void dump_stack(uint32_t *sp) {
    printf("\nStack: SP=%p\n", sp);
    for(uint32_t *p = sp; p < sp + 32; p += 4) {
        if((intptr_t)p >= 0x3fffc000) {
            break; /* approximate end of RAM */
        }
        printf("%p: %08x %08x %08x %08x\n", p, p[0], p[1], p[2], p[3]);
        if(p[0] == 0xa5a5a5a5 && p[1] == 0xa5a5a5a5
           && p[2] == 0xa5a5a5a5 && p[3] == 0xa5a5a5a5) {
            break; /* FreeRTOS uses this pattern to mark untouched stack space */
        }
    }
}

/* Dump exception status registers as stored above 'sp'
   by the interrupt handler preamble
*/
void dump_exception_registers(uint32_t *sp) {
    uint32_t excsave1;
    uint32_t *saved = sp - (0x50 / sizeof(uint32_t));
    printf("Registers:\n");
    RSR(excsave1, excsave1);
    printf("a0 %08x ", excsave1);
    printf("a1 %08x ", (intptr_t)sp);
    for(int a = 2; a < 14; a++) {
        printf("a%-2d %08x%c", a, saved[a+3], a == 3 || a == 7 || a == 11 ? '\n':' ');
    }
    printf("SAR %08x\n", saved[0x13]);
}

void IRAM fatal_exception_handler(uint32_t *sp) {
    if (!sdk_NMIIrqIsOn) {
        vPortEnterCritical();
        do {
            DPORT.DPORT0 &= 0xffffffe0;
        } while (DPORT.DPORT0 & 0x00000001);
    }
    Cache_Read_Disable();
    Cache_Read_Enable(0, 0, 1);
    dump_excinfo();
    if (sp) {
        dump_exception_registers(sp);
        dump_stack(sp);
    }
    uart_flush_txfifo(0);
    uart_flush_txfifo(1);
    sdk_system_restart_in_nmi();
    while(1) {}
}

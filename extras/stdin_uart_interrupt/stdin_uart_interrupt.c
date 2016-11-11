/* 
 * The MIT License (MIT)
 * 
 * Copyright (c) 2015 Johan Kanflo (github.com/kanflo)
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include <esp8266.h>
#include <FreeRTOS.h>
#include <semphr.h>
#include <stdio.h>

#if (configUSE_COUNTING_SEMAPHORES == 0)
 #error "You need to define configUSE_COUNTING_SEMAPHORES in a local FreeRTOSConfig.h, see examples/terminal/FreeRTOSConfig.h"
#endif

// IRQ driven UART RX driver for ESP8266 written for use with esp-open-rtos
// TODO: Handle UART1

#ifndef UART0
#define UART0 (0)
#endif

#define UART0_RX_SIZE  (128) // ESP8266 UART HW FIFO size

static SemaphoreHandle_t uart0_sem = NULL;
static bool inited = false;
static void uart0_rx_init(void);

IRAM void uart0_rx_handler(void)
{
    // TODO: Handle UART1, see reg 0x3ff20020, bit2, bit0 represents uart1 and uart0 respectively
    if (!UART(UART0).INT_STATUS & UART_INT_STATUS_RXFIFO_FULL) {
        return;
    }
//    printf(" [%08x (%d)]\n", READ_PERI_REG(UART_INT_ST(UART0)), READ_PERI_REG(UART_STATUS(UART0)) & (UART_RXFIFO_CNT << UART_RXFIFO_CNT_S));
    if (UART(UART0).INT_STATUS & UART_INT_STATUS_RXFIFO_FULL) {
        UART(UART0).INT_CLEAR = UART_INT_CLEAR_RXFIFO_FULL;
        if (UART(UART0).STATUS & (UART_STATUS_RXFIFO_COUNT_M << UART_STATUS_RXFIFO_COUNT_S)) {
            long int xHigherPriorityTaskWoken;
            _xt_isr_mask(1 << INUM_UART);
            _xt_clear_ints(1<<INUM_UART);
            xSemaphoreGiveFromISR(uart0_sem, &xHigherPriorityTaskWoken);
            if(xHigherPriorityTaskWoken) {
                portYIELD();
            }
        }
    } else {
        printf("Error: unexpected uart irq, INT_STATUS 0x%02x\n", UART(UART0).INT_STATUS);
    }
}

uint32_t uart0_num_char(void)
{
    uint32_t count;
    if (!inited) uart0_rx_init();
    count = UART(UART0).STATUS & (UART_STATUS_RXFIFO_COUNT_M << UART_STATUS_RXFIFO_COUNT_S);
    return count;
}

// _read_stdin_r in core/newlib_syscalls.c will be skipped by the linker in favour
// of this function
long _read_stdin_r(struct _reent *r, int fd, char *ptr, int len)
{
    if (!inited) uart0_rx_init();
    for(int i = 0; i < len; i++) {
        if (!(UART(UART0).STATUS & (UART_STATUS_RXFIFO_COUNT_M << UART_STATUS_RXFIFO_COUNT_S))) {
            _xt_isr_unmask(1 << INUM_UART);
            if (!xSemaphoreTake(uart0_sem, portMAX_DELAY)) {
                printf("\nFailed to get sem\n");
            }
        }
        ptr[i] = UART(UART0).FIFO & (UART_FIFO_DATA_M << UART_FIFO_DATA_S);
    }
    return len;
}

static void uart0_rx_init(void)
{
    int trig_lvl = 1;
    uart0_sem = xSemaphoreCreateCounting(UART0_RX_SIZE, 0);

    _xt_isr_attach(INUM_UART, uart0_rx_handler);
    _xt_isr_unmask(1 << INUM_UART);

    // reset the rx fifo
    uint32_t conf = UART(UART0).CONF0;
    UART(UART0).CONF0 = conf | UART_CONF0_RXFIFO_RESET;
    UART(UART0).CONF0 = conf & ~UART_CONF0_RXFIFO_RESET;

    // set rx fifo trigger
    UART(UART0).CONF1 |= (trig_lvl & UART_CONF1_RXFIFO_FULL_THRESHOLD_M) << UART_CONF1_RXFIFO_FULL_THRESHOLD_S;

    // clear all interrupts
    UART(UART0).INT_CLEAR = 0x1ff;

    // enable rx_interrupt
    UART(UART0).INT_ENABLE = UART_INT_ENABLE_RXFIFO_FULL;

    inited = true;
}

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
#include <espressif/esp8266/esp8266.h>
#include <espressif/esp8266/uart_register.h>
#include <FreeRTOS.h>
#include <semphr.h>

#if (configUSE_COUNTING_SEMAPHORES == 0)
 #error "You need to define configUSE_COUNTING_SEMAPHORES in a local FreeRTOSConfig.h, see examples/terminal/FreeRTOSConfig.h"
#endif

// IRQ driven UART RX driver for ESP8266 written for use with esp-open-rtos
// TODO: Handle UART1

#define UART0_RX_SIZE  (81)

#ifndef UART0
#define UART0 (0)
#endif

static xSemaphoreHandle uart0_sem = NULL;
static char rx_buf[UART0_RX_SIZE];
static uint8_t rd_pos = 0;
static uint8_t wr_pos = 0;
static bool inited = false;

static void uart0_rx_init(void);


IRAM void uart0_rx_handler(void)
{
    // TODO: Handle UART1, see reg 0x3ff20020, bit2, bit0 represents uart1 and uart0 respectively
    if (UART_RXFIFO_FULL_INT_ST != (READ_PERI_REG(UART_INT_ST(UART0)) & UART_RXFIFO_FULL_INT_ST)) {
        return;
    }
    WRITE_PERI_REG(UART_INT_CLR(UART0), UART_RXFIFO_FULL_INT_CLR);
    while (READ_PERI_REG(UART_STATUS(UART0)) & (UART_RXFIFO_CNT << UART_RXFIFO_CNT_S)) {
        char ch = READ_PERI_REG(UART_FIFO(UART0)) & 0xff;
        uint8_t wr_next = (wr_pos+1) % UART0_RX_SIZE;
        if (wr_next != rd_pos) {
            rx_buf[wr_pos] = ch;
            wr_pos = (wr_pos+1) % UART0_RX_SIZE;
            xSemaphoreGiveFromISR(uart0_sem, NULL);
        }
    }
}

uint32_t uart0_num_char(void)
{
    uint32_t count;
    if (!inited) uart0_rx_init();
    _xt_isr_mask(1 << INUM_UART);
    if (rd_pos > wr_pos) count = rd_pos - wr_pos;
    else count = wr_pos - rd_pos;
    _xt_isr_unmask(1 << INUM_UART);
    return count;
}

// _read_r in core/newlib_syscalls.c will be skipped in favour of this function
long _read_r(struct _reent *r, int fd, char *ptr, int len)
{
    if (!inited) uart0_rx_init();
    for(int i = 0; i < len; i++) {
        char ch;
        if (xSemaphoreTake(uart0_sem, portMAX_DELAY)) {
            _xt_isr_mask(1 << INUM_UART);
            ch = rx_buf[rd_pos];
            rd_pos = (rd_pos+1) % UART0_RX_SIZE;
            _xt_isr_unmask(1 << INUM_UART);
            ptr[i] = ch;
        }
    }
    return len;
}

static void uart0_rx_init(void)
{
    int trig_lvl = 1;
    uart0_sem = xSemaphoreCreateCounting(UART0_RX_SIZE, 0);

    _xt_isr_attach(INUM_UART, uart0_rx_handler);
    _xt_isr_unmask(1 << INUM_UART);

    //clear rx and tx fifo,not ready
    SET_PERI_REG_MASK(UART_CONF0(UART0), UART_RXFIFO_RST | UART_TXFIFO_RST);
    CLEAR_PERI_REG_MASK(UART_CONF0(UART0), UART_RXFIFO_RST | UART_TXFIFO_RST);

    //set rx fifo trigger
    WRITE_PERI_REG(UART_CONF1(UART0), (trig_lvl & UART_RXFIFO_FULL_THRHD) << UART_RXFIFO_FULL_THRHD_S);

    //clear all interrupt
    WRITE_PERI_REG(UART_INT_CLR(UART0), 0xffff);
    //enable rx_interrupt
    SET_PERI_REG_MASK(UART_INT_ENA(UART0), UART_RXFIFO_FULL_INT_ENA);    
    inited = true;
}

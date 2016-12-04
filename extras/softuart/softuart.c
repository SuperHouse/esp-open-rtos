/*
 * Softuart
 *
 * Copyright (C) 2016 Bernhard Guillon <Bernhard.Guillon@web.de>
 *
 * This code is based on Softuart from here [1] and reworked to
 * fit into esp-open-rtos. For now only the RX part is ported.
 * Also the configuration of the pin is for now hardcoded.
 *
 * it fits my needs to read the GY-GPS6MV2 module with 9600 8n1
 *
 * Original Copyright:
 * Copyright (c) 2015 plieningerweb
 *
 * MIT Licensed as described in the file LICENSE
 *
 * 1 https://github.com/plieningerweb/esp8266-software-uart
 */

#include "softuart.h"
#include <stdint.h>
#include <esp/gpio.h>
#include <espressif/esp_common.h>
#include <stdio.h>

static softuart s;

void handle_rx(uint8_t gpio_num)
{
    // Disable interrupt
    gpio_set_interrupt(rx_pin, GPIO_INTTYPE_NONE, handle_rx);

    // Wait till start bit is half over so we can sample the next one in the center
    sdk_os_delay_us(s.bit_time/2);

    // Now sample bits
    unsigned i;
    unsigned d = 0;
    unsigned start_time = 0x7FFFFFFF & sdk_system_get_time();

    for(i = 0; i < 8; i ++ )
    {
        while ((0x7FFFFFFF & sdk_system_get_time()) < (start_time + (s.bit_time*(i+1))))
        {
            // If system timer overflow, escape from while loop
            if ((0x7FFFFFFF & sdk_system_get_time()) < start_time)
            {
                break;
            }
        }
        // Shift d to the right
        d >>= 1;

        // Read bit
        if(gpio_read(rx_pin))
        {
            // If high, set msb of 8bit to 1
            d |= 0x80;
        }
    }

    // Store byte in buffer
    // If buffer full, set the overflow flag and return
    uint8_t next = (s.buffer.receive_buffer_tail + 1) % SOFTUART_MAX_RX_BUFF;
    if (next != s.buffer.receive_buffer_head)
    {
        // save new data in buffer: tail points to where byte goes
        s.buffer.receive_buffer[s.buffer.receive_buffer_tail] = d; // save new byte
        s.buffer.receive_buffer_tail = next;
    }
    else
    {
        s.buffer.buffer_overflow = 1;
    }

    // Wait for stop bit
    sdk_os_delay_us(s.bit_time);
    // Done
    // Reenable interrupt
    gpio_set_interrupt(rx_pin, GPIO_INTTYPE_EDGE_NEG, handle_rx);
}

bool softuart_init(uint32_t baudrate)
{
    if (baudrate == 0)
        return false;

    // Calculate bit_time
    s.bit_time = (1000000 / baudrate);
    if ( ((100000000 / baudrate) - (100*s.bit_time)) > 50 )
        s.bit_time++;

    gpio_enable(rx_pin, GPIO_INPUT);
    gpio_set_pullup(rx_pin, true, false);
    // Set up the interrupt handler to get the startbit
    gpio_set_interrupt(rx_pin, GPIO_INTTYPE_EDGE_NEG, handle_rx);

    return true;
}

// Read data from buffer
uint8_t softuart_read()
{
    // Empty buffer?
    if (s.buffer.receive_buffer_head == s.buffer.receive_buffer_tail)
        return 0;

    // Read from "head"
    uint8_t d = s.buffer.receive_buffer[s.buffer.receive_buffer_head]; // grab next byte
    s.buffer.receive_buffer_head = (s.buffer.receive_buffer_head + 1) % SOFTUART_MAX_RX_BUFF;
    return d;
}

// Is data in buffer available?
bool softuart_available()
{
    return (s.buffer.receive_buffer_tail + SOFTUART_MAX_RX_BUFF - s.buffer.receive_buffer_head) % SOFTUART_MAX_RX_BUFF;
}

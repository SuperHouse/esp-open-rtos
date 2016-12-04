/*
 * Softuart example
 *
 * Copyright (C) 2016 Bernhard Guillon <Bernhard.Guillon@web.de>
 * Copyright (c) 2015 plieningerweb
 *
 * MIT Licensed as described in the file LICENSE
 */
#include <esp/gpio.h>
#include <esp/uart.h>
#include <espressif/esp_common.h>
#include <stdio.h>
#include "softuart/softuart.h"

void user_init(void)
{
    // setup real UART for now
    uart_set_baud(0, 115200);
    printf("SDK version:%s\n\n", sdk_system_get_sdk_version());

    // setup software rx to 9600 8n1
    softuart_init(9600);

    while (true)
    {
        if (!softuart_available())
            continue;
        printf("%c",softuart_read());
    }
}

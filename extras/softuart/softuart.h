/*
 * Softuart for esp-open-rtos
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
#ifndef SOFTUART_H_
#define SOFTUART_H_

#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C"
{
#endif

// FIXME: for now you need to provide the gpio number for RX here
#define rx_pin 13

#define SOFTUART_MAX_RX_BUFF 64
#define SOFTUART_GPIO_COUNT 16

/**
 * Private data buffer
 */
typedef struct softuart_buffer_t
{
    char receive_buffer[SOFTUART_MAX_RX_BUFF];
    uint8_t receive_buffer_tail;
    uint8_t receive_buffer_head;
    uint8_t buffer_overflow;
} softuart_buffer_t;

/**
 * Private softuart descriptor
 */
typedef struct
{
    uint8_t pin_rx;                    //!< This value is ignored by now but planned to get added again
    volatile softuart_buffer_t buffer; //!< Internal buffer
    uint16_t bit_time;                 //!< Time for one bit, filled by softuart
} softuart;

/**
 * Initialize software uart and setup interrup handlers
 *
 * FIXME: For now you will have to set up the
 *        rx_pin and handle_rx your self.
 *
 * @param baudrate actual baudrate
 * @return true if no errors occured otherwise false
 */
bool softuart_init(uint32_t baudrate);

/**
 * Check if data is available
 * @return true if data is available otherwise false
 */
bool softuart_available();

/**
 * Read current byte from internal buffer if available.
 *
 * NOTE: This call is non blocking.
 * NOTE: You have to check softuart_available first.
 * @return current byte
 */
uint8_t softuart_read();

#ifdef __cplusplus
}
#endif

#endif /* SOFTUART_H_ */

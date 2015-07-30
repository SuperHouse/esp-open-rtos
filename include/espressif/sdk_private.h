/* sdk_private.h

   This source file contains function prototypes for "private" but
   useful functions defined in the "binary blob" ESP IoT RTOS SDK libraries.

   For the "public" API, check the esp_common header file and the various
   sub-headers it includes.

   Function names here have the 'sdk_' prefix that is attached to all
   binary library symbols by the esp-open-rtos build process.

   This file is a part of esp-open-rtos.
*/
#ifndef SDK_PRIVATE_H
#define SDK_PRIVATE_H

#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif

struct ip_addr;

/*********************************************
* Defined in libmain.a
*********************************************
*/

/* Change UART divider without re-initialising UART.

   uart_no = 0 or 1 for which UART
   new_divisor = Calculated in the form UART_CLK_FREQ / BAUD
 */
void sdk_uart_div_modify(uint32_t uart_no, uint32_t new_divisor);

/* Read a single character from the UART.
   Returns 0 on success, 1 if no character in fifo
 */
int sdk_uart_rx_one_char(char *buf);

/* Write a single character to the UART.
 */
void sdk_os_putc(char c);

/* Called when an IP gets set on the "station" (client) interface.
 */
void sdk_system_station_got_ip_set(struct ip_addr *ip_addr, struct ip_addr *sn_mask, struct ip_addr *gw_addr);

/* This is a no-op wrapper around ppRecycleRxPkt, which is defined in libpp.a

   It's called when a pbuf is freed, and allows pp to reuse the 'eb' pointer to ESP-specific
   pbuf data. (See esp-lwip pbuf.h)
 */
void sdk_system_pp_recycle_rx_pkt(void *eb);

#ifdef	__cplusplus
}
#endif

#endif

/* sdk_prototypes.h

   This source file contains function prototypes for functions defined
   in the remaining "binary blob" ESP IoT RTOS SDK libraries. Sorted
   by which library they appear in.

   Function names here have the 'sdk_' prefix that is put on all binary library functions
   by the Open RTOS SDK.
*/
#ifndef SDK_PROTOTYPES_H
#define SDK_PROTOTYPES_H

#include <stdint.h>
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
 */
char sdk_uart_rx_one_char(void);

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

const char* sdk_system_get_sdk_version(void);


#endif

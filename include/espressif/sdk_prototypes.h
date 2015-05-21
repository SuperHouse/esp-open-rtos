/* This source file contains function prototypes for functions defined
   in the remaining "binary blob" ESP IoT RTOS SDK libraries. Sorted
   by which library they appear in.
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
void uart_div_modify(uint32_t uart_no, uint32_t new_divisor);

/* Called when an IP gets set on the "station" (client) interface.
 */
void system_station_got_ip_set(struct ip_addr *ip_addr, struct ip_addr *sn_mask, struct ip_addr *gw_addr);

/* This is a no-op wrapper around ppRecycleRxPkt, which is defined in libpp.a

   It's called when a pbuf is freed, and allows pp to reuse the 'eb' pointer to ESP-specific
   pbuf data. (See esp-lwip pbuf.h)
 */
void system_pp_recycle_rx_pkt(void *eb);


#endif

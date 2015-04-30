/* This source file contains function prototypes for public functions defined in the
   "binary blob" ESP8266 libraries. Sorted by which library they appear in.
*/
#ifndef BLOB_PROTOTYPES_H
#define BLOB_PROTOTYPES_H

#include <stdint.h>

/*********************************************
* libmain.a */

/* Change UART divider without re-initialising UART.

   uart_no = 0 or 1 for which UART
   new_divisor = Calculated in the form UART_CLK_FREQ / BAUD
 */
void uart_div_modify(uint32_t uart_no, uint32_t new_divisor);


#endif

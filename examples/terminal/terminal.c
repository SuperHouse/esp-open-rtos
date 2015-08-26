/* Serial terminal example
 * UART RX is interrupt driven
 * Read characters until \n and echo back
 *
 * This sample code is in the public domain.
 */

#include <stdint.h>
#include <sys/types.h>
#include <unistd.h>
#include <espressif/esp_common.h>
#include <serial_driver.h>

#define BUFFER_SIZE (81)

void user_init(void)
{
    char buffer[BUFFER_SIZE];
    uint32_t i = 0;
    sdk_uart_div_modify(0, UART_CLK_FREQ / 115200);
    while(1) {
        char ch;
        // The thread will block here until there is data available
        // NB. read(...) may be called from user_init or from a thread
        // We can check how many characters are available in the RX buffer
        // with uint32_t uart0_num_char(void);
        if (read(0, (void*)&ch, 1)) { // 0 is stdin
            if (i == BUFFER_SIZE-2 || ch == '\n') {
                buffer[i] = 0;
                printf("Unknown command: %s\n", (char*) buffer);
                i = 0;
            } else {
                buffer[i++] = ch;
            }
        }
    }
}

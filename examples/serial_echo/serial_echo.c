/* Extremely simple example that just reads from stdin and echoes back on stdout
 *
 * Has an easter egg, which is if you type "QUACK" it'll quack 3 times back at you.
 *
 * This example code is in the public domain
 */
#include "espressif/esp_common.h"
#include <esp/uart.h>
#include <string.h>

void user_init(void)
{
    uart_set_baud(0, 115200);
    printf("SDK version:%s\n", sdk_system_get_sdk_version());
    printf("Going into echo mode...\n");

    /* By default stdout is line-buffered, so you only see output
       after a newline is sent. This is helpful in a multithreaded
       environment so output doesn't get chopped up within a line.

       Here we want to see the echo immediately, so disable buffering.
    */
    setbuf(stdout, NULL);

    while(1) {
        int c = getchar();
        if(c != EOF)
            putchar(c);

        /* Easter egg: check for a quack! */
        static int quack;
        if(c == "QUACK"[quack]) {
            quack++;
            if(quack == strlen("QUACK")) {
                printf("\nQUACK\nQUACK\n");
                quack = 0;
            }
        } else {
            quack = 0;
        }
    }
}

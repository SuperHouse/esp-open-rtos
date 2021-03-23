#include <stdlib.h>
#include <string.h> /* strlen */

#include <espressif/esp_common.h>
#include <espressif/user_interface.h>
#include <esp/uart.h>
#include <FreeRTOS.h>
#include <task.h>

#include <uart_repl/uart_repl.h>


void handle_command(char const d[]) {
	if (!strcmp(d, "ts") || !strcmp(d, "time")) {
		printf("the tick count since boot is: %u\n", xTaskGetTickCount());
	} else if (!strcmp(d, "help")) {
		printf("commands include ts, time\n");
	} else {
		printf("command not recognized, try help\n");
	}
}


void user_init(void) {
	uart_set_baud(0, 115200);

	printf("\n\nWelcome to the uart REPL demo. try \"help\"\n");
	uart_repl_init(&handle_command);
}



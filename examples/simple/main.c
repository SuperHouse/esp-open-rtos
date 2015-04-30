/* Very basic example that just demonstrates we can run at all!
 */
#include "esp_common.h"
#include "FreeRTOS.h"
#include "task.h"
#include "espressif/blob_prototypes.h"
#include "queue.h"

void task1(void *pvParameters)
{
    xQueueHandle *queue = (xQueueHandle *)pvParameters;
    printf("Hello from task1!\r\n");
    while(1) {
	char msg = 'c';
	vTaskDelay(100);
	xQueueSend(*queue, &msg, 0);
    }
}

void task2(void *pvParameters)
{
    printf("Hello from task 2!\r\n");
    xQueueHandle *queue = (xQueueHandle *)pvParameters;
    while(1) {
	char msg;
	if(xQueueReceive(*queue, &msg, 1000)) {
	    printf("Got %c\n", msg);
	} else {
	    printf("No msg :(\n");
	}
    }
}

static xQueueHandle mainqueue;

void user_init(void)
{
    uart_div_modify(0, UART_CLK_FREQ / 115200);
    printf("SDK version:%s\n", system_get_sdk_version());
    mainqueue = xQueueCreate(10, 1);
    xTaskCreate(task1, (signed char *)"tsk1", 256, &mainqueue, 2, NULL);
    xTaskCreate(task2, (signed char *)"tsk2", 256, &mainqueue, 2, NULL);
}



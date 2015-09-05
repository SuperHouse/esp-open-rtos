/* Simple example for I2C / BMP180 / Timer & Event Handling
 *
 * This sample code is in the public domain.
 */
#include "espressif/esp_common.h"
#include "espressif/sdk_private.h"

#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "queue.h"

// BMP180 driver
#include "bmp180/bmp180.h"

#define MY_EVT_TIMER  0x01
#define MY_EVT_BMP180 0x02

#define SCL_PIN GPIO_ID_PIN((0))
#define SDA_PIN GPIO_ID_PIN((2))

typedef struct
{
    uint8_t event_type;
    bmp180_result_t bmp180_data;
} my_event_t;

// Communication Queue
static xQueueHandle mainqueue;
static xTimerHandle timerHandle;

// Own BMP180 User Inform Implementation
bool bmp180_i2c_informUser(const xQueueHandle* resultQueue, uint8_t cmd, bmp180_temp_t temperatue, bmp180_press_t pressure)
{
    my_event_t ev;

    ev.event_type = MY_EVT_BMP180;
    ev.bmp180_data.cmd = cmd;
    ev.bmp180_data.temperatue = temperatue;
    ev.bmp180_data.pressure = pressure;

    return (xQueueSend(*resultQueue, &ev, 0) == pdTRUE);
}

// Timer call back
static void bmp180_i2c_timer_cb(xTimerHandle xTimer)
{
    my_event_t ev;
    ev.event_type = MY_EVT_TIMER;

    xQueueSend(mainqueue, &ev, 0);
}

// Check for communiction events
void bmp180_task(void *pvParameters)
{
    // Received pvParameters is communication queue
    xQueueHandle *com_queue = (xQueueHandle *)pvParameters;

    printf("%s: Started user interface task\n", __FUNCTION__);

    while(1)
    {
        my_event_t ev;

        xQueueReceive(*com_queue, &ev, portMAX_DELAY);

        switch(ev.event_type)
        {
        case MY_EVT_TIMER:
            printf("%s: Received Timer Event\n", __FUNCTION__);

            bmp180_trigger_measurement(com_queue);
            break;
        case MY_EVT_BMP180:
            printf("%s: Received BMP180 Event temp:=%d.%d°C press=%d.%02dhPa\n", __FUNCTION__, \
                       (int32_t)ev.bmp180_data.temperatue, abs((int32_t)(ev.bmp180_data.temperatue*10)%10), \
                       ev.bmp180_data.pressure/100, ev.bmp180_data.pressure%100 );
            break;
        default:
            break;
        }
    }
}

// Setup HW
void user_setup(void)
{
    // Set UART Parameter
    sdk_uart_div_modify(0, UART_CLK_FREQ / 115200);

    // Give the UART some time to settle
    sdk_os_delay_us(500);
}

void user_init(void)
{
    // Setup HW
    user_setup();

    // Just some infomations
    printf("\n");
    printf("SDK version : %s\n", sdk_system_get_sdk_version());
    printf("GIT version : %s\n", GITSHORTREV);

    // Use our user inform implementation
    bmp180_informUser = bmp180_i2c_informUser;

    // Init BMP180 Interface
    bmp180_init(SCL_PIN, SDA_PIN);

    // Create Main Communication Queue
    mainqueue = xQueueCreate(10, sizeof(my_event_t));

    // Create user interface task
    xTaskCreate(bmp180_task, (signed char *)"bmp180_task", 256, &mainqueue, 2, NULL);

    // Create Timer (Trigger a measurement every second)
    timerHandle = xTimerCreate((signed char *)"BMP180 Trigger", 1000/portTICK_RATE_MS, pdTRUE, NULL, bmp180_i2c_timer_cb);

    if (timerHandle != NULL)
    {
        if (xTimerStart(timerHandle, 0) != pdPASS)
        {
            printf("%s: Unable to start Timer ...\n", __FUNCTION__);
        }
    }
    else
    {
        printf("%s: Unable to create Timer ...\n", __FUNCTION__);
    }
}

/**
 * Simple example with one sensor connected to I2C bus 0. It demonstrates the
 * different approaches to fetch the data. Either the interrupt *nINT* is used
 * whenever new data are available or exceed defined thresholds or the new
 * data are fetched periodically.
 *
 * Harware configuration:
 *
 * +------------------------+    +--------+
 * | ESP8266  Bus 0         |    | CCS811 |
 * |          GPIO 5 (SCL)  >----> SCL    |
 * |          GPIO 4 (SDA)  ------ SDA    |
 * |          GPIO 2        <----- /nINT  |
 * |          GND           -----> /WAKE  |
 * +------------------------+    +--------+
 */

// use following constants to define the demo mode
// #define INT_DATA_RDY_USED
// #define INT_THRESHOLD_USED

#include "espressif/esp_common.h"
#include "esp/uart.h"
#include "i2c/i2c.h"

#include "FreeRTOS.h"
#include <task.h>

// include CCS811 driver
#include "ccs811/ccs811.h"

// define I2C interfaces at which CCS811 sensors can be connected
#define I2C_BUS       0
#define I2C_SCL_PIN   5
#define I2C_SDA_PIN   4

// define GPIO for interrupt
#define INT_GPIO      2

static ccs811_sensor_t* sensor;

#if defined(INT_DATA_RDY_USED) || defined(INT_THRESHOLD_USED)
/**
 * In this example, the interrupt *nINT* is used. It is triggered every time
 * new data are available (INT_DATA_RDY_USED) or exceed defined thresholds
 * (INT_THRESHOLD_USED). In this case, the user has to define an interrupt
 * handler that fetches the data directly or triggers a task, that is waiting
 * to fetch the data. In this example, a task is defined which suspends itself
 * in each cycle to wait for fetching the data. The task is resumed by the
 * the interrupt handler.
 */

TaskHandle_t nINT_task;

// User task that fetches the sensor values.

void user_task_interrupt (void *pvParameters)
{
    uint16_t tvoc;
    uint16_t eco2;

    while (1)
    {
        // task suspends itself and waits to be resumed by interrupt handler
        vTaskSuspend (NULL);

        // after resume get the results and do something with them
        if (ccs811_get_results (sensor, &tvoc, &eco2, 0, 0))
            printf("%.3f CCS811 Sensor interrupt: TVOC %d ppb, eCO2 %d ppm\n",
                   (double)sdk_system_get_time()*1e-3, tvoc, eco2);
    }
}

// Interrupt handler which resumes user_task_interrupt on interrupt

void nINT_handler (uint8_t gpio)
{
    xTaskResumeFromISR (nINT_task);
}

#else

/*
 * In this example, user task fetches the sensor values every seconds.
 */

void user_task_periodic(void *pvParameters)
{
    uint16_t tvoc;
    uint16_t eco2;

    TickType_t last_wakeup = xTaskGetTickCount();

    while (1)
    {
        // get environmental data from another sensor and set them
        // ccs811_set_environmental_data (sensor, 25.3, 47.8);

        // get the results and do something with them
        if (ccs811_get_results (sensor, &tvoc, &eco2, 0, 0))
            printf("%.3f CCS811 Sensor periodic: TVOC %d ppb, eCO2 %d ppm\n",
                   (double)sdk_system_get_time()*1e-3, tvoc, eco2);

        // passive waiting until 1 second is over
        vTaskDelayUntil(&last_wakeup, 1000 / portTICK_PERIOD_MS);
    }
}

#endif


void user_init(void)
{
    // set UART Parameter
    uart_set_baud(0, 115200);
    // give the UART some time to settle
    sdk_os_delay_us(500);

    /** -- MANDATORY PART -- */

    // init all I2C bus interfaces at which CCS811 sensors are connected
    i2c_init (I2C_BUS, I2C_SCL_PIN, I2C_SDA_PIN, I2C_FREQ_100K);
    
    // longer clock stretching is required for CCS811
    i2c_set_clock_stretch (I2C_BUS, CCS811_I2C_CLOCK_STRETCH);

    // init the sensor with slave address CCS811_I2C_ADDRESS_1 connected I2C_BUS.
    sensor = ccs811_init_sensor (I2C_BUS, CCS811_I2C_ADDRESS_1);

    if (sensor)
    {
        #if defined(INT_DATA_RDY_USED) || defined(INT_THRESHOLD_USED)

        // create a task that is resumed by interrupt handler to use the sensor
        xTaskCreate(user_task_interrupt, "user_task_interrupt", 256, NULL, 2, &nINT_task);

        // activate the interrupt for INT_GPIO and set the interrupt handler
        gpio_set_interrupt(INT_GPIO, GPIO_INTTYPE_EDGE_NEG, nINT_handler);

        #ifdef INT_DATA_RDY_USED
        // enable the data ready interrupt
        ccs811_enable_interrupt (sensor, true);
        #else
        // set threshold parameters and enable threshold interrupt mode
        ccs811_set_eco2_thresholds (sensor, 600, 1100, 40);
        #endif

        #else

        // create a periodic task that uses the sensor
        xTaskCreate(user_task_periodic, "user_task_periodic", 256, NULL, 2, NULL);

        #endif

        // start periodic measurement with one measurement per second
        ccs811_set_mode (sensor, ccs811_mode_1s);
    }
}


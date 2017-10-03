/**
 * Simple example with one SHT3x sensor. 
 *
 * It shows two different user task implementations, one in *single shot mode*
 * and one in *periodic mode*.
 * 
 * Which implementation is used is defined by constant SINGLE_SHOT_MODE.
 *
 * Harware configuration:
 *
 *   +------------------------+     +----------+
 *   | ESP8266  Bus 0         |     | SHT3x    |
 *   |          GPIO 5 (SCL)  ------> SCL      |
 *   |          GPIO 4 (SDA)  ------- SDA      |
 *   +------------------------+     +----------+
 */

// #define SINGLE_SHOT_MODE
 
#include "espressif/esp_common.h"
#include "esp/uart.h"

#include "FreeRTOS.h"
#include "task.h"

// include SHT3x driver
#include "sht3x/sht3x.h"

// define I2C interfaces at which SHTx3 sensors are connected
#define I2C_BUS       0
#define I2C_SCL_PIN   GPIO_ID_PIN((5))
#define I2C_SDA_PIN   GPIO_ID_PIN((4))

static sht3x_sensor_t* sensor;    // sensor device data structure

#ifdef SINGLE_SHOT_MODE
/*
 * User task that triggers a measurement every 5 seconds. Due to
 * power efficiency reasons, it uses the SHT3x *single_shot*.
 */
void user_task (void *pvParameters)
{
    sht3x_values_t values;

    TickType_t last_wakeup = xTaskGetTickCount();

    while (1) 
    {
        // Trigger one measurement in single shot mode.
        sht3x_start_measurement (sensor, single_shot);
        
        // Wait until measurement is ready (constant time of at least 30 ms
        // or the duration returned from *sht3x_get_measurement_duration*).
        vTaskDelay (sht3x_get_measurement_duration(sensor));
        
        // retrieve the values and do something with them
        if (sht3x_get_results (sensor, &values))
            printf("%.3f SHT3x Sensor: %.2f °C, %.2f %%\n", 
                   (double)sdk_system_get_time()*1e-3,  
                   values.temperature, values.humidity);

        // wait until 5 seconds are over
        vTaskDelayUntil(&last_wakeup, 5000 / portTICK_PERIOD_MS);
    }
}
#else  // PERIODIC MODE
/*
 * User task that fetches latest measurement results of sensor every 2
 * seconds. It starts the SHT3x in periodic mode with 1 measurements per
 * second (*periodic_1mps*).
 */
void user_task (void *pvParameters)
{
    sht3x_values_t values;

    // Start periodic measurements with 1 measurement per second.
    sht3x_start_measurement (sensor, periodic_1mps);

    // Wait until first measurement is ready (constant time of at least 30 ms
    // or the duration returned from *sht3x_get_measurement_duration*).
    vTaskDelay (sht3x_get_measurement_duration(sensor));

    TickType_t last_wakeup = xTaskGetTickCount();
    
    while (1) 
    {
        // Get the values and do something with them.
        if (sht3x_get_results (sensor, &values))
            printf("%.3f SHT3x Sensor: %.2f °C, %.2f %%\n", 
                   (double)sdk_system_get_time()*1e-3,  
                   values.temperature, values.humidity);
                   
        // Wait until 2 seconds (cycle time) are over.
        vTaskDelayUntil(&last_wakeup, 2000 / portTICK_PERIOD_MS);
    }
}
#endif

void user_init(void)
{
    // Set UART Parameter.
    uart_set_baud(0, 115200);

    // Give the UART some time to settle.
    sdk_os_delay_us(500);
    
    // Init I2C bus interfaces at which SHT3x sensors are connected
    // (different busses are possible).
    i2c_init(I2C_BUS, I2C_SCL_PIN, I2C_SDA_PIN, I2C_FREQ_100K);
    
    // Create the sensors.
    if ((sensor = sht3x_init_sensor (I2C_BUS, SHT3x_ADDR_2)))
    {
        // Create a user task that uses the sensors.
        xTaskCreate(user_task, "user_task", 256, NULL, 2, 0);
    }

    // That's it.
}

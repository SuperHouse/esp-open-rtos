/**
 * Simple example with two SHT3x sensors.
 *
 * It shows two different user task implementations, one in *single shot mode*
 * and one in *periodic mode*. In addition, it shows both approaches for the
 * implementation of waiting for measurement results, one as busy waiting and
 * one as passive waiting using *vTaskDelay*.
 * 
 * Harware configuration:
 *
 *   +------------------------+     +----------+
 *   | ESP8266  Bus 0         |     | SHT3x_1  |
 *   |          GPIO 5 (SCL)  ------> SCL      |
 *   |          GPIO 4 (SDA)  ------- SDA      |
 *   |                        |     +----------+
 *   |          Bus 1         |     | SHT3x_2  |
 *   |          GPIO 14 (SCL) ------> SCL      |
 *   |          GPIO 12 (SDA) ------- SDA      |
 *   +------------------------+     +----------+
 */

#include "espressif/esp_common.h"
#include "esp/uart.h"

#include "FreeRTOS.h"
#include "task.h"

// include SHT3x driver

#include "sht3x/sht3x.h"

// define I2C interfaces at which SHTx3 sensors are connected

#define I2C_1_BUS       0
#define I2C_1_SCL_PIN   GPIO_ID_PIN((5))
#define I2C_1_SDA_PIN   GPIO_ID_PIN((4))

#define I2C_2_BUS       1
#define I2C_2_SCL_PIN   GPIO_ID_PIN((14))
#define I2C_2_SDA_PIN   GPIO_ID_PIN((12))

static sht3x_sensor_t* sensor1;
static sht3x_sensor_t* sensor2;

/*
 * User task that triggers measurements of sensor1 every 5 seconds. Due to
 * power efficiency reasons, it uses the SHT3x *single_shot* and *vTaskDelay*
 * to wait for measurement results.
 */
void user_task_sensor1 (void *pvParameters)
{
    sht3x_values_t values;
    int32_t duration;

    TickType_t last_wakeup = xTaskGetTickCount();

    while (1) 
    {
        // trigger one measurement in single shot mode
        duration = sht3x_start_measurement (sensor1, single_shot);

        // passive waiting until measurement results are available
        if (duration > 0)
            vTaskDelay (duration);
        
        // retrieve the values and do something with them
        if (sht3x_get_results (sensor1, &values))
            printf("%.3f SHT3x Sensor1: %.2f °C, %.2f %%\n", 
                   (double)sdk_system_get_time()*1e-3,  
                   values.temperature, values.humidity);

        // passive waiting until 5 seconds are over
        vTaskDelayUntil(&last_wakeup, 5000 / portTICK_PERIOD_MS);
    }
}

/*
 * User task that fetches latest measurement results of sensor2 every 2
 * seconds. It starts the SHT3x in periodic mode with 10 measurements per
 * second (*periodic_10mps*). It uses busy waiting for first measurement
 * results.
 */
void user_task_sensor2 (void *pvParameters)
{
    sht3x_values_t values;

    // start periodic measurement mode
    sht3x_start_measurement (sensor2, periodic_10mps);

    // busy waiting until measurement results are available
    while (sht3x_is_measuring (sensor2) > 0);

    TickType_t last_wakeup = xTaskGetTickCount();
    
    while (1) 
    {
        // retrieve the values and do something with them
        if (sht3x_get_results (sensor2, &values))
            printf("%.3f SHT3x Sensor2: %.2f °C, %.2f %%\n", 
                   (double)sdk_system_get_time()*1e-3,  
                   values.temperature, values.humidity);

        // passive waiting until 2 seconds are over
        vTaskDelayUntil(&last_wakeup, 2000 / portTICK_PERIOD_MS);
    }
}


void user_init(void)
{
    // Please note: Return values are not considered in this example for 
    // readability reasons. All functions return boolean and set an error
    // code that allows effective error handling.
    
    // Set UART Parameter
    uart_set_baud(0, 115200);

    // Give the UART some time to settle
    sdk_os_delay_us(500);
    
    // Init I2C bus interfaces at which SHT3x sensors are connected
    // (different busses are possible)
    i2c_init(I2C_1_BUS, I2C_1_SCL_PIN, I2C_1_SDA_PIN, I2C_FREQ_100K);
    i2c_init(I2C_2_BUS, I2C_2_SCL_PIN, I2C_2_SDA_PIN, I2C_FREQ_100K);

    // Create sensors
    sensor1 = sht3x_init_sensor (I2C_1_BUS, SHT3x_ADDR_2);
    sensor2 = sht3x_init_sensor (I2C_2_BUS, SHT3x_ADDR_1);
    
    // Create tasks that use the sensors
    xTaskCreate(user_task_sensor1, "user_task_sensor1", 256, NULL, 2, 0);
    xTaskCreate(user_task_sensor2, "user_task_sensor2", 256, NULL, 2, 0);
        
    // That's it.
}

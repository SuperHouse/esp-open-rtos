/**
 * Simple example with two SHT3x sensors.
 *
 * It shows two different user task implementations, one in *single shot mode*
 * and one in *periodic mode*.
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
 * power efficiency reasons, it uses the SHT3x *sht3x_single_shot* mode.
 */
void user_task_sensor1 (void *pvParameters)
{
    float temperature;
    float humidity;

    TickType_t last_wakeup = xTaskGetTickCount();

    while (1) 
    {
        // Trigger one measurement in single shot mode with high repeatability.
        sht3x_start_measurement (sensor1, sht3x_single_shot, sht3x_high);
 
        // Wait until measurement is ready (constant time of at least 30 ms
        // or the duration returned from *sht3x_get_measurement_duration*).
        vTaskDelay (sht3x_get_measurement_duration(sht3x_high));
        
        // retrieve the values and do something with them
        if (sht3x_get_results (sensor1, &temperature, &humidity))
            printf("%.3f SHT3x Sensor 1: %.2f °C, %.2f %%\n", 
                   (double)sdk_system_get_time()*1e-3, temperature, humidity);

        // wait until 5 seconds are over
        vTaskDelayUntil(&last_wakeup, 5000 / portTICK_PERIOD_MS);
    }
}

/*
 * User task that fetches latest measurement results of sensor2 every 2
 * seconds. It starts the SHT3x in periodic mode with 10 measurements per
 * second (*sht3x_periodic_10mps*).
 */
void user_task_sensor2 (void *pvParameters)
{
    float temperature;
    float humidity;

    // Start periodic measurement mode with high repeatability.
    sht3x_start_measurement (sensor2, sht3x_periodic_10mps, sht3x_high);

    // Wait until measurement is ready (constant time of at least 30 ms
    // or the duration returned from *sht3x_get_measurement_duration*).
    vTaskDelay (sht3x_get_measurement_duration(sht3x_high));

    TickType_t last_wakeup = xTaskGetTickCount();
    
    while (1) 
    {
        // Retrieve the values and do something with them.
        if (sht3x_get_results (sensor2, &temperature, &humidity))
            printf("%.3f SHT3x Sensor 2: %.2f °C, %.2f %%\n", 
                   (double)sdk_system_get_time()*1e-3, temperature, humidity);

        // Wait until 2 seconds are over.
        vTaskDelayUntil(&last_wakeup, 2000 / portTICK_PERIOD_MS);
    }
}


void user_init(void)
{
    // Set UART Parameter
    uart_set_baud(0, 115200);

    // Give the UART some time to settle.
    sdk_os_delay_us(500);
    
    // Init I2C bus interfaces at which SHT3x sensors are connected
    // (different busses are possible).
    i2c_init(I2C_1_BUS, I2C_1_SCL_PIN, I2C_1_SDA_PIN, I2C_FREQ_100K);
    i2c_init(I2C_2_BUS, I2C_2_SCL_PIN, I2C_2_SDA_PIN, I2C_FREQ_100K);

    // Create sensors.
    sensor1 = sht3x_init_sensor (I2C_1_BUS, SHT3x_ADDR_2);
    sensor2 = sht3x_init_sensor (I2C_2_BUS, SHT3x_ADDR_1);

    if (sensor1 && sensor2)
    {   
        // Create the tasks that use the sensors.
        xTaskCreate(user_task_sensor1, "user_task_sensor1", 256, NULL, 2, 0);
        xTaskCreate(user_task_sensor2, "user_task_sensor2", 256, NULL, 2, 0);
    }
           
    // That's it.
}

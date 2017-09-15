/**
 * Simple example with one sensor using SHT3x driver in periodic mode
 * and a user task.
 */
 
#include "espressif/esp_common.h"
#include "esp/uart.h"

#include "FreeRTOS.h"
#include "task.h"

// include SHT3x driver

#include "sht3x/sht3x.h"

// define I2C interface at which SHTx3 sensor is connected
#define I2C_BUS       0
#define I2C_SCL_PIN   GPIO_ID_PIN((5))
#define I2C_SDA_PIN   GPIO_ID_PIN((4))

#define SHT3x_ADDR 0x45

static uint32_t sensor;

/**
 * Task that executes function sht3x_get_values to get last
 * actual and average sensor values for given sensor.
 */ 
void my_user_task(void *pvParameters)
{
    sht3x_value_set_t actual; 
    sht3x_value_set_t average;

    while (1) 
    {
        sht3x_get_values(sensor, &actual, &average);
 
        printf("%.3f Sensor %d: %.2f (%.2f) C, %.2f (%.2f) F, %.2f (%.2f) \n", 
               (double)sdk_system_get_time()*1e-3, sensor, 
               actual.temperature_c, average.temperature_c, 
               actual.temperature_f, average.temperature_f, 
               actual.humidity, average.humidity);
 
        // Delay value has to be equal or greater than the period of measurment
        // task
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}


void user_init(void)
{
    // Please note: Return values are not considered for readability reasons.
    // All functions return a boolean that allows effecitve error handling.
    
    // Set UART Parameter
    uart_set_baud(0, 115200);

    // Give the UART some time to settle
    sdk_os_delay_us(500);
    
    // Init I2C bus interface at which SHT3x sensor is connected
    i2c_init(I2C_BUS, I2C_SCL_PIN, I2C_SDA_PIN, I2C_FREQ_100K);

    // Init SHT3x driver
    sht3x_init();
    
    // Create sensors
    sensor = sht3x_create_sensor (I2C_BUS, SHT3x_ADDR);
    
    // Optional: Set the period of measurements (default 1000 ms)
    // sht3x_set_measurement_period (sensor, 1000);
    
    // Optional: Set the weight for expontial moving average (default 0.2)
    // sht3x_set_average_weight (sensor, 0.2);

    // Create a task for getting results
    xTaskCreate(my_user_task, "my_user_task", 256, NULL, 2, NULL);
        
    // That's it.
}

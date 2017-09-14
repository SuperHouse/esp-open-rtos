/**
 * Simple example with one sensor using SHT3x driver using callback function
 * to get the results.
 */
 
#include "espressif/esp_common.h"
#include "esp/uart.h"

#include "FreeRTOS.h"

// include SHT3x driver

#include "sht3x/sht3x.h"

// define I2C interface at which SHTx3 sensor is connected
#define I2C_BUS       0
#define I2C_SCL_PIN   GPIO_ID_PIN((5))
#define I2C_SDA_PIN   GPIO_ID_PIN((4))

#define SHT3x_ADDR 0x45

static uint32_t sensor;

/**
 * Everything you need is a callback function that can handle
 * callbacks from the background measurement task of the
 * SHT3x driver. This function is called periodically
 * and delivers the actual and average sensor value sets for 
 * given sensor.
 */
static void my_callback_function (uint32_t sensor, 
                                  sht3x_value_set_t actual, 
                                  sht3x_value_set_t average)
{
    printf("%.3f Sensor %d: %.2f (%.2f) C, %.2f (%.2f) F, %.2f (%.2f) \n", 
           (double)sdk_system_get_time()*1e-3, sensor, 
           actual.c_temperature, average.c_temperature, 
           actual.f_temperature, average.f_temperature, 
           actual.humidity, average.humidity);
}


void user_init(void)
{
    // Set UART Parameter
    uart_set_baud(0, 115200);

    // Give the UART some time to settle
    sdk_os_delay_us(500);
    
    // Init I2C bus interface at which SHT3x sensor is connected
    i2c_init(I2C_BUS, I2C_SCL_PIN, I2C_SDA_PIN, I2C_FREQ_100K);

    // Init SHT3x driver
    if (!sht3x_init())
    {
        // error message
        return;
    }
    
    // Create sensors
    if ((sensor = sht3x_create_sensor (I2C_BUS, SHT3x_ADDR)) < 0)
    {
        // error message
        return;
    }
    
    // Set the callback function
    if (!sht3x_set_callback_function (sensor, &my_callback_function))
    {
        // error message
        return;
    }
    
    /*
    // Optional: Set the period of measurements (default 1000 ms)
    if (!sht3x_set_measurement_period (sensor, 1000))
    {
        // error message
        return;
    }
    
    // Optional: Set the weight for expontial moving average (default 0.2)
    if (!sht3x_set_average_weight (sensor, 0.2))
    {
        // error message
        return;
    }
    */
    
    // That's it.
}

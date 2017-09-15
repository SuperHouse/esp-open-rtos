/**
 * Simple example with two sensors connected to two different I2C interfaces 
 * using SHT3x driver using callback function to get the results.
 */
 
#include "espressif/esp_common.h"
#include "esp/uart.h"

#include "FreeRTOS.h"

// include SHT3x driver

#include "sht3x/sht3x.h"

// define I2C interfaces at which SHTx3 sensors are connected
#define I2C_1_BUS       0
#define I2C_1_SCL_PIN   GPIO_ID_PIN((5))
#define I2C_1_SDA_PIN   GPIO_ID_PIN((4))

#define I2C_2_BUS       1
#define I2C_2_SCL_PIN   GPIO_ID_PIN((16))
#define I2C_2_SDA_PIN   GPIO_ID_PIN((14))

#define SHT3x_ADDR_1 0x44
#define SHT3x_ADDR_2 0x45

static uint32_t sensor1;
static uint32_t sensor2;

/**
 * Everything you need is a callback function that can handle
 * callbacks from the background measurement task of the
 * SHT3x driver. This function is called periodically
 * and delivers the actual and average sensor values for 
 * given sensor.
 */
static void my_callback_function (uint32_t sensor, 
                                  sht3x_value_set_t actual, 
                                  sht3x_value_set_t average)
{
    printf("%.3f Sensor %d: %.2f (%.2f) C, %.2f (%.2f) F, %.2f (%.2f) \n", 
           (double)sdk_system_get_time()*1e-3, sensor, 
           actual.temperature_c, average.temperature_c, 
           actual.temperature_f, average.temperature_f, 
           actual.humidity, average.humidity);
}


void user_init(void)
{
    // Please note: Return values are not considered for readability reasons.
    // All functions return a boolean that allows effecitve error handling.
    
    // Set UART Parameter
    uart_set_baud(0, 115200);

    // Give the UART some time to settle
    sdk_os_delay_us(500);
    
    // Init I2C bus interfaces at which SHT3x sensors are connected
    // (different busses are possible)
    i2c_init(I2C_1_BUS, I2C_1_SCL_PIN, I2C_1_SDA_PIN, I2C_FREQ_100K);
    i2c_init(I2C_2_BUS, I2C_2_SCL_PIN, I2C_2_SDA_PIN, I2C_FREQ_100K);

    // Init SHT3x driver (parameter is the number of SHT3x sensors used)
    sht3x_init();
    
    // Create sensors
    sensor1 = sht3x_create_sensor (I2C_1_BUS, SHT3x_ADDR_1);
    sensor2 = sht3x_create_sensor (I2C_2_BUS, SHT3x_ADDR_2);
    
    // Set the callback function
    sht3x_set_callback_function (sensor1, &my_callback_function);
    sht3x_set_callback_function (sensor2, &my_callback_function);
    
    // Optional: Set the period of measurements (default 1000 ms)
    sht3x_set_measurement_period (sensor1, 1000);
    sht3x_set_measurement_period (sensor2, 5000);
    
    // Optional: Set the weight for expontial moving average (default 0.2)
    sht3x_set_average_weight (sensor1, 0.15);
    sht3x_set_average_weight (sensor2, 0.25);

    // That's it.
}

/**
 * Simple example with one sensor connected to I2C bus 0
 * using BME680 driver and a user task that polls the results.
 *
 * Harware configuration:
 *
 *  ESP8266             BME680
 *  GPIO 5 (SCL)    ->  SCL
 *  GPIO 4 (SDA)    --  SDA
 */
 
#include "espressif/esp_common.h"
#include "esp/uart.h"
#include "i2c/i2c.h"

// include BME680 driver
#include "bme680/bme680_drv.h"

// define I2C interfaces at which BME680 sensors can be connected
#define I2C_BUS       0
#define I2C_SCL_PIN   GPIO_ID_PIN((5))
#define I2C_SDA_PIN   GPIO_ID_PIN((4))

#define BME680_ADDR1    0x76
#define BME680_ADDR2    0x77 // default

static uint32_t sensor;

/**
 * Task that executes function bme680_get_values to get last
 * actual and average sensor values.
 */ 
void my_user_task(void *pvParameters)
{
    bme680_value_set_t actual; 
    bme680_value_set_t average;

    while (1) 
    {
        bme680_get_values(sensor, &actual, &average);
 
        printf("%.3f Sensor %d: %.2f (%.2f) C, %.2f (%.2f) Percent, %.2f (%.2f) hPa, %.2f (%.2f) Ohm\n", 
               (double)sdk_system_get_time()*1e-3, sensor, 
               actual.temperature, average.temperature,
               actual.humidity, average.humidity,
               actual.pressure, average.pressure,
               actual.gas, average.gas);
 
        // Delay value has to be equal or greater than the period of measurment
        // task
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}



void user_init(void)
{
    // Set UART Parameter
    uart_set_baud(0, 115200);
    // Give the UART some time to settle
    sdk_os_delay_us(500);
    
    /** Please note: 
      * Function *bme680_create_sensor* returns a value greater or equal 0
      * on succes, all other *bme680_* functions return true on success. Using
      * these return values, you could realize an error handling. Error 
      * handling is not realized in this example due to readability reasons.
      */
    
    /** -- MANDATORY PART -- */
    
    // Init all I2C bus interfaces at which BME680 sensors are connected
    i2c_init(I2C_BUS, I2C_SCL_PIN, I2C_SDA_PIN, I2C_FREQ_100K);

    // Init BME680 driver itself.
    bme680_init_driver();

    // Create the sensor with slave address 0x77 (BME680_ADDR2) connected to
    // I2C bus 0 (I2C_BUS_1). Parameter *cs* is ignored in case of I2C.
    sensor = bme680_create_sensor (I2C_BUS, BME680_ADDR2, 0);

    // Create a task for getting results
    xTaskCreate(my_user_task, "my_user_task", 256, NULL, 2, NULL);

    // That's it.

    /** -- OPTIONAL PART -- */
    
    // Change the period of measurements (default 1000 ms) to 500 ms.
    bme680_set_measurement_period (sensor, 500);
    
    // Changes the oversampling rates (default os_1x) to 4x oversampling for
    // temperature and 2x oversampling for pressure. Humidity measurement is
    // skipped.
    bme680_set_oversampling_rates(sensor, os_4x, os_2x, none);
    
    // Change the IIR filter size (default iir_size_3) for temperature and 
    // and pressure to 7.
    bme680_set_filter_size(sensor, iir_size_7);

    // Change the heaeter profile (default 320 degree Celcius for 150 ms) to
    // 200 degree Celcius for 100 ms.
    bme680_set_heater_profile (sensor, 200, 100);
}


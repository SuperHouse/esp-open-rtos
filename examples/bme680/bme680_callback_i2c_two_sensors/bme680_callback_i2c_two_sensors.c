/**
 * Simple example with two sensors connected to differen I2C busses
 * using BME680 driver and callback function to get the results.
 *
 * Harware configuration:
 *
 *  ESP8266  Bus 0               BME680_1
 *           GPIO 5 (SCL)   ->   SCL
 *           GPIO 4 (SDA)	--	 SDA
 *
 *           Bus 1               BME680_2
 *           GPIO 12 (SCL)   ->  SCL
 *           GPIO 14 (SDA)   --  SDA
 */
 
#include "espressif/esp_common.h"
#include "esp/uart.h"
#include "i2c/i2c.h"

// include BME680 driver
#include "bme680/bme680_drv.h"

// define I2C interfaces at which BME680 sensors can be connected
#define I2C_1_BUS       0
#define I2C_1_SCL_PIN   GPIO_ID_PIN((5))
#define I2C_1_SDA_PIN   GPIO_ID_PIN((4))

#define I2C_2_BUS       1
#define I2C_2_SCL_PIN   GPIO_ID_PIN((12))
#define I2C_2_SDA_PIN   GPIO_ID_PIN((14))

#define BME680_ADDR1    0x76
#define BME680_ADDR2    0x77 // default

static uint32_t sensor1;
static uint32_t sensor2;

/**
 * Everything you need is a callback function that can handle
 * callbacks from the background measurement task of the
 * BME680 driver. This function is called periodically
 * and delivers the actual and average sensor value sets for 
 * given sensor.
 */

static void my_callback_function (uint32_t sensor, 
                                  bme680_value_set_t actual, 
                                  bme680_value_set_t average)
{
    printf("%.3f Sensor %d: %.2f (%.2f) C, %.2f (%.2f) Percent, %.2f (%.2f) hPa, %.2f (%.2f) Ohm\n", 
           (double)sdk_system_get_time()*1e-3, sensor, 
            actual.temperature, average.temperature,
            actual.humidity, average.humidity,
            actual.pressure, average.pressure,
            actual.gas, average.gas);
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
    i2c_init(I2C_1_BUS, I2C_1_SCL_PIN, I2C_1_SDA_PIN, I2C_FREQ_100K);
    i2c_init(I2C_2_BUS, I2C_2_SCL_PIN, I2C_2_SDA_PIN, I2C_FREQ_100K);

    // Init BME680 driver itself.
    bme680_init_driver();

    // Create the sensors connected to I2C bus 0 (I2C_BUS_1) and (I2C_BUS_1).
    // They can use same or different addresses. Parameter *cs* is ignored
    // in case of I2C.
    sensor1 = bme680_create_sensor (I2C_1_BUS, BME680_ADDR2, 0);
    sensor2 = bme680_create_sensor (I2C_2_BUS, BME680_ADDR2, 0);

    // Register the callback functions to get measurement results.
    bme680_set_callback_function (sensor1, &my_callback_function);
    bme680_set_callback_function (sensor2, &my_callback_function);

    // That's it.

    /** -- OPTIONAL PART -- */

    // Change the period of measurements (default 1000 ms) to 2000 ms and
    // 5000 ms, respectively.
    bme680_set_measurement_period (sensor1, 2000);
    bme680_set_measurement_period (sensor2, 5000);
    
    // Changes the oversampling rates (default os_1x) to 4x oversampling for
    // sensor1 and 16x oversampling for sensor2. Humidity measurement is
    // skipped for sensor1.
    bme680_set_oversampling_rates(sensor1, os_2x, os_2x, none);
    bme680_set_oversampling_rates(sensor2, os_8x, os_8x, os_8x);
    
    // Change the IIR filter size (default iir_size_3) for temperature and 
    // and pressure to 15 and 63, respectively.
    bme680_set_filter_size(sensor1, iir_size_15);
    bme680_set_filter_size(sensor2, iir_size_63);

    // Change the heaeter profile (default 320 degree Celcius for 150 ms) to
    // 200 degree Celcius for 100 ms and 400 degrees for 150 ms, respectively.
    bme680_set_heater_profile (sensor1, 200, 100);
    bme680_set_heater_profile (sensor2, 400, 150);
}


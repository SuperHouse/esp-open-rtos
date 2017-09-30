/**
 * Simple example with one sensor connected to SPI bus 1 
 * using BME680 driver and callback function to get the results.
 *
 * Harware configuration:
 *
 *  ESP8266             BME680
 *  GPIO 12 (MISO)  <-  SDO
 *  GPIO 13 (MOSI)  ->  SDI
 *  GPIO 14 (SCK)   ->  SCK
 *  GPIO 2  (CS)    ->  CS
 */
 
#include "espressif/esp_common.h"
#include "esp/uart.h"

// include BME680 driver
#include "bme680/bme680_drv.h"

#define SPI_BUS         1
#define SPI_CS_GPIO     2   // GPIO 15, the default CS of SPI bus 1, can't be used

#define BME680_ADDR1    0x76
#define BME680_ADDR2    0x77 // default

static uint32_t sensor;

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
    
    // Init BME680 driver itself.
    bme680_init_driver();

    // Create the sensor at bus SPI_BUS with SPI_CS_GPIO as CS signal.
    // Parameter *addr* has to be 0 in case of SPI bus.
    sensor = bme680_create_sensor (SPI_BUS, 0, SPI_CS_GPIO);

    // Register the callback function to get measurement results.
    bme680_set_callback_function (sensor, &my_callback_function);
    
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
    
    // That's it.
}


/**
 * Simple example with one sensor connected either to I2C bus 0 or
 * SPI bus 1.
 *
 * Harware configuration:
 *
 *   I2C   +-------------------------+     +----------+
 *         | ESP8266  Bus 0          |     | BME680   |
 *         |          GPIO 5 (SCL)   ------> SCL      |
 *         |          GPIO 4 (SDA)   ------- SDA      |
 *         +-------------------------+     +----------+
 *
 *   SPI   +-------------------------+     +----------+
 *         | ESP8266  Bus 1          |     | BME680   |
 *         |          GPIO 12 (MISO) <-----< SDO      |
 *         |          GPIO 13 (MOSI) >-----> SDI      |
 *         |          GPIO 14 (SCK)  >-----> SCK      |
 *         |          GPIO 2  (CS)   >-----> CS       |
 *         +-------------------------+     +----------+
 */

// Uncomment to use SPI
// #define SPI_USED

#include "espressif/esp_common.h"
#include "esp/uart.h"

#include "FreeRTOS.h"
#include "task.h"

// include communication interface driver
#include "esp/spi.h"
#include "i2c/i2c.h"

// include BME680 driver
#include "bme680/bme680.h"


#ifdef SPI_USED
// define SPI interface for BME680 sensors
#define SPI_BUS         1
#define SPI_CS_GPIO     2   // GPIO 15, the default CS of SPI bus 1, can't be used
#else
// define I2C interface for BME680 sensors
#define I2C_BUS         0
#define I2C_SCL_PIN     5
#define I2C_SDA_PIN     4
#endif

static bme680_sensor_t* sensor;

/*
 * User task that triggers measurements of sensor every seconds. It uses
 * function *vTaskDelay* to wait for measurement results. Busy wating
 * alternative is shown in comments
 */
void user_task(void *pvParameters)
{
    bme680_values_float_t values;

    TickType_t last_wakeup = xTaskGetTickCount();

    // as long as sensor configuration isn't changed, duration is constant
    uint32_t duration = bme680_get_measurement_duration(sensor);

    while (1)
    {
        // trigger the sensor to start one TPHG measurement cycle
        if (bme680_force_measurement (sensor))
        {
            // passive waiting until measurement results are available
            vTaskDelay (duration);

            // alternatively: busy waiting until measurement results are available
            // while (bme680_is_measuring (sensor)) ;

            // get the results and do something with them
            if (bme680_get_results_float (sensor, &values))
                printf("%.3f BME680 Sensor: %.2f °C, %.2f %%, %.2f hPa, %.2f Ohm\n",
                       (double)sdk_system_get_time()*1e-3,
                       values.temperature, values.humidity,
                       values.pressure, values.gas_resistance);
        }
        // passive waiting until 1 second is over
        vTaskDelayUntil(&last_wakeup, 1000 / portTICK_PERIOD_MS);
    }
}


void user_init(void)
{
    // Set UART Parameter
    uart_set_baud(0, 115200);
    // Give the UART some time to settle
    sdk_os_delay_us(500);

    /** -- MANDATORY PART -- */

    #ifdef SPI_USED
    // Init the sensor connected either to SPI.
    sensor = bme680_init_sensor (SPI_BUS, 0, SPI_CS_GPIO);
    #else
    // Init all I2C bus interfaces at which BME680 sensors are connected
    i2c_init(I2C_BUS, I2C_SCL_PIN, I2C_SDA_PIN, I2C_FREQ_100K);

    // Init the sensor connected either to I2C.
    sensor = bme680_init_sensor (I2C_BUS, BME680_I2C_ADDRESS_2, 0);
    #endif

    if (sensor)
    {
        // Create a task that uses the sensor
        xTaskCreate(user_task, "user_task", 256, NULL, 2, NULL);

        /** -- OPTIONAL PART -- */

        // Changes the oversampling rates to 4x oversampling for temperature
        // and 2x oversampling for humidity. Pressure measurement is skipped.
        bme680_set_oversampling_rates(sensor, osr_4x, osr_none, osr_2x);

        // Change the IIR filter size for temperature and pressure to 7.
        bme680_set_filter_size(sensor, iir_size_7);

        // Change the heater profile 0 to 200 degree Celcius for 100 ms.
        bme680_set_heater_profile (sensor, 0, 200, 100);
        bme680_use_heater_profile (sensor, 0);

        // Set ambient temperature to 10 degree Celsius
        bme680_set_ambient_temperature (sensor, 10);
    }
}

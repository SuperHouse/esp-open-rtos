# Driver for BME680 digital temperature and humidity sensor

This driver is written for usage with the ESP8266 and FreeRTOS ([esp-open-rtos](https://github.com/SuperHouse/esp-open-rtos) and [esp-open-rtos-driver-i2c](https://github.com/kanflo/esp-open-rtos-driver-i2c)).

Please note: 

1. The driver supports multiple sensors that are connected either to I2C as well as SPI.

2. Due to the complexity of the sensor output value compputation based on many calibration parameters, the original Bosch Sensortec BME680 driver that is released as open source [https://github.com/BoschSensortec/BME680_driver] is integrated for internal use. Please note the license of this part, which is an extended BSD license and can be found in each of that source files.

## About the sensor

BME680 is an low power environmental sensor that integrates a temperature, a pressure, a humidity and a gas sensor in only one unit. It can be connected to controller using either I2C or SPI.

### Sensor modes

BME680 can operate in two different low-level power modes, the *sleep mode* and the *forced mode*.

#### Sleep mode

This mode is the default mode. The sensor starts automatically in this mode after power-up sequence. In this mode it does not perform any measurement and therefore just consumes 0.15 μA.

#### Forced Mode

Using the mode switch command, the sensor switches from sleep mode into the forced mode. In this mode, temperature, pressure, humidity and gas measurements are performed sequentially exactly once. Such a measurement cycle is also called TPHG (Temperature, Pressure, Humidity and Gas). 

Each of these measurements can be influenced, activated or skipped separately via the sensor settings, see section **Measurement settings**.

### Measurement settings

The sensor allows to change different measurement parameters.

#### Oversampling rates

For temperature, pressure, and humidity measurements, it is possible by the user task to individually define different over-sampling rates for each of these measurements. Possible over-sampling rates are 1x (default by the driver) 2x, 4x, 8x and 16x.

It is also possible to define an oversampling rate of 0. This deactivates the corresponding measurement and the output values become invalid.

#### IIR Filter

The sensor integrates an internal IIR filter (low pass filter) to reduce short-term changes in sensor output values caused by external disturbances. It effectively reduces the bandwidth of the sensor output values.

The filter can optionally be used for pressure and temperature data that are subject to many short-term changes. Humidity and gas inside the sensor does not fluctuate rapidly and does not require such a low pass filtering.

The user task can change the size of the filter. The default size is 3. If the size of the filter becomes 0, the filter is not used.

#### Heater profile

For gas measurement the sensor integrates a heater. The paremeters for this heater are defined by a heater profile. Such a heater profile consists of a temperature setting point (the target temperature) and the heating duration. 

Even though the sensor supports up to 10 different such profiles at them same time, only one profile is used by the driver for simplicity reasons. The temperature setting point and the heating duration of this one profile can be defined by the user task. Default values used by the driver are 320 degree Celcius as target temperature and 150 ms heating duration. 

According to the datasheet, target temperatures of between 200 and 400 degrees Celsius are typical and about 20 to 30 ms are necessary for the heater to reach the desired target temperature.

If heating duration is 0 ms, the gas measurement is skipped and output values become invalid.

### Communication interfaces

The sensor can be connected using I2C or SPI. The driver support both communication interfaces.

The I2C interface supports the Standard, Fast and High Speed modes up to 3.4 Mbps. It is possible to connect multiple BME680 with two different I2C slave addresses (0x76 and 0x77) to one I2C bus or with same I2C addresses to different I2C busses.

The SPI interface allows clock rates up to 10 MHz and SPI modes '00' (CPOL=CPHA=0) and '11' (CPOL=CPHA=1).

Interface selection is done automatically using the CS signal. As long as the CS signal keeps high after power-on reset, the I2C interface is used. Once the CS signal has been pulled down, SPI interface is used until next power-on reset.

## How the driver works

To avoid blocking of user tasks during measurements due to their duration, separate tasks running in background are used to realize the measurements. These background tasks are created implicitly when a user task calls function *bme680_create_sensor* for each connected BME680 sensor. The background tasks realize the measurement procedures which are executed periodically at a rate that can be defined by the user for each sensor separately using function *bme680_set_measurement_period* (default period is 1000 ms).

### Measurement method

The driver triggers a measurement cycle using functions of the original Bosch Sensortec BME680 driver, which has been released as open source [https://github.com/BoschSensortec/BME680_driver] and is integrated for internal use. These functions call up recall functions of the driver which implement the communication with the sensor.

The duration of a THPG measuring cycle can vary from a few milliseconds to a half a second, depending on which measurements of the THPG measuring cycle are activated and the measurement settings such as the oversampling rate and heating profile as well as sensor value processing parameters such as the IIR filter size.

Therefore, the measurement period should be not less than 1 second.

### Measured data

At each measurement, *actual sensor values* for temperature, pressure, humidity as well as gas are determined as floating point values from the measured data sets. Temperature is given in °C, pressure in hectopascals, Humidity in percent and gas is given in Ohm representing the resistance of sensor's gas sensitive layer.

If average value computation is enabled (default), the background task also computes successively at each measurement the *average sensor values* based on these *actual sensor values* using the exponential moving average 

    Average[k] = W * Actual + (1-W) * Average [k-1]

where coefficient W represents the degree of weighting decrease, a constant smoothing factor between 0 and 1. A higher W discounts older observations faster. The coefficient W (smoothing factor) can be defined by the user task using function *bme680_set_average_weight*. The default value of W is 0.2. The average value computation can be enabled or disabled using function *bme680_enable_average_computation*.

If average computation is disabled, *average sensor values* correspond to the *actual sensor values*.

### Getting results.

As soon as a measurement is completed, the actual sensor values * and * average sensor values * can be read by user tasks. There are two ways to do this:

- define a callback function or 
- call the function * bme680_get_values * explicitly.

#### Using callback function

For each connected BME680 sensor, the user task can register a callback function using function *bme680_set_callback_function*. If a callback function is registered, it is called by the background task after each measurement to pass *actual sensor values* and *average sensor values* to user tasks. Thus, the user gets the results of the measurements automatically with same rate as the periodic measurements are executed.

Using the callback function is the easiest way to get the results.

#### Using function bme680_get_values

If no recall function is registered, the user task must call *bme680_get_values* to get the *current sensor values* and *average sensor values*. These values are stored in data structures of type *bme680_value_set_t*, which are passed as pointer parameters to the function. By NULL pointers for one of these parameters, the user task can decide which results are not interesting.

To ensure that the actual and average sensor values are up-to-date, the rate of periodic measurements realized by the background task should be at least equal to or higher than the rate of calling the function *bme680_get_values*. That is, the measurement period in the background task which is set by function *bme680_set_measurement_period* must be less than or equal to the rate of calling function *bme680_get_values*.

Please note: If gas measurement is activated, the measuring period should be at least 1 second.

## Usage 

First, the hardware configuration has to be establisch. This can differ dependent on the communication interface and the number of sensors to be used.

### Hardware configuration

First figure shows a possible configuration with only one I2C busses.

```
 +------------------------+     +--------+
 | ESP8266  Bus 0         |     | BME680 |
 |          GPIO 5 (SCL)  +---->+ SCL    |
 |          GPIO 4 (SDA)  +-----+ SDA    |
 |                        |     +--------+
 +------------------------+
```
Next figure shows a possible configuration with two I2C busses.

```
 +------------------------+     +----------+
 | ESP8266  Bus 0         |     | BME680_1 |
 |          GPIO 5 (SCL)  ------> SCL      |
 |          GPIO 4 (SDA)  ------- SDA      |
 |                        |     +----------+
 |          Bus 1         |     | BME680_2 |
 |          GPIO 12 (SCL) ------> SCL      |
 |          GPIO 14 (SDA) ------- SDA      |
 +------------------------+     +----------+
```

Last figure shows a possible configuration using SPI bus 1.

 +-------------------------+     +--------+
 | ESP8266  Bus 0          |     | BME680 |
 |          GPIO 12 (MISO) <------ SDO    |
 |          GPIO 13 (MOSI) >-----> SDA    |
 |          GPIO 14 (SCK)  >-----> SCK    |
 |          GPIO 2  (CS)   >-----> CS     |
 +-------------------------+     +--------+

Please note: 

1. Since the system flash memory is connected to SPI bus 0, the sensor has to be connected to SPI bus 1. 

2. GPIO15 used as CS signal of SPI bus 1 by default, does not work correctly together with BME680's signal. Therefore, the user has to specify another GPIO pin as CS signal when the sensor is created, e.g. GPIO2.

### Communication interface dependent part

According to the hardware configuration, some constants should be defined, e.g. for
only one I2C and the SPI.

```
#define I2C_BUS         0
#define I2C_SCL_PIN     GPIO_ID_PIN((5))
#define I2C_SDA_PIN     GPIO_ID_PIN((4))

#define BME680_ADDR1    0x76
#define BME680_ADDR2    0x77 // default

#define SPI_BUS         1
#define SPI_CS_GPIO     2   // GPIO 15, the default CS of SPI bus 1, can't be used
```
Only in case of I2C, the I2C driver has to initialized before it can be used. This is not neccessary for SPI.

```
...
i2c_init(I2C_BUS, I2C_SCL_PIN, I2C_SDA_PIN, I2C_FREQ_100K))
```

Next, the BME680 driver itself has to be initialized using function *bme680_init*. This is independent on the communication interface.

```
bme680_init_driver();
```

If BME680 driver initialization was successful, function *bme680_create_sensor* has to be called for each sensor to initialize the sensor connected to a certain bus with given slave address, to check its availability and to start the background task for measurements.

In the case of I2C interface, this call looks like following. The last parameter is the SPI CS signal pin is ignored in case of I2C.

```
sensor = bme680_create_sensor (I2C_BUS, BME680_ADDR2, 0);
```

For SPI the call looks like this. The second parameter is the I2C slave address, that is invalid. It is used by function *bme680_create_sensor* to determine the communication infertace to be used. In cas of SPI, the GPIO for CS signal has to be specified.

```
    sensor = bme680_create_sensor (SPI_BUS, 0, SPI_CS_GPIO);
```

On success this function returns the *ID* of a sensor descriptor between 0 and *BME680_MAX_SENSORS* or -1 otherwise. This *ID* is used to identify the sensor in all other functions used later.

The remaining part of the software is independent on the communication interface.

If you want to use a callback function defined like following to get the measurement results

```
static void my_callback_function (uint32_t sensor, 
                                  bme680_value_set_t actual, 
                                  bme680_value_set_t average)
{
  ...
}
```

You have to register this callback function using *bme680_set_callback_function*.

```
bme680_set_callback_function (sensor, &my_callback_function);
```

Optionally, you could wish to set some measurement parameters. For details see the section **Measurement settings** above, the header file of the driver **bme680_driver.h**, and of course the datasheet of the sensor.

```
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
```

All functions return a boolean that allows effective error handling.

## Full Example for one sensor connected to I2C bus

```

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
    i2c_init(I2C_BUS, I2C_SCL_PIN, I2C_SDA_PIN, I2C_FREQ_100K);

    // Init BME680 driver itself.
    bme680_init_driver();

    // Create the sensor with slave address 0x77 (BME680_ADDR2) connected to
    // I2C bus 0 (I2C_BUS_1). Parameter *cs* is ignored in case of I2C.
    sensor = bme680_create_sensor (I2C_BUS, BME680_ADDR2, 0);

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
}
```

## Further Examples

For further examples see [examples directory](../../examples/bme680/README.md)



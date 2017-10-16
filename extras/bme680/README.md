# Driver for **BME680** digital **environmental sensor**

This driver is written for usage with the ESP8266 and FreeRTOS. It supports multiple sensors that are either connected to the SPI or to different I2C interfaces with different addresses.

## About the sensor

BME680 is an ulta-low-power environmental sensor that integrates temperature, pressure, humidity and gas sensors in only one unit.

## Communication interfaces

The BME680 sensor can be connected using I2C or SPI. The driver supports both communication interfaces.

The I2C interface supports data rates up to 3.4 Mbps. It is possible to connect multiple BME680 sensors with different I2C slave addresses to the same I2C bus or to different I2C buses. Possible I2C slave addresses are 0x76 and 0x77.

The SPI interface allows clock rates up to 10 MHz and the SPI modes '00' (CPOL=CPHA=0) and '11' (CPOL=CPHA=1).

Interface selection is done automatically using the SPI CS signal. As long as the CS signal keeps high after power-on reset, the I2C interface is used. Once the CS signal has been pulled down, SPI interface is used until next power-on reset.

## Measurement process

Once the BME680 has been initialized, it can be used for measurements. The BME680 operates in two different low-level power modes, the **sleep mode** and the **forced mode**.

The *sleep mode* is the default mode. The sensor starts automatically in this mode after power-up sequence. It does not perform any measurement in this mode and therefore just consumes 0.15 μA.

#### Measurement cylce

To perform measurements, the BME680 sensor has to be triggered to switch to the **forced mode**. In this mode, it performs exactly one measurement of temperature, pressure, humidity, and gas in that order, the so-called **TPHG measurement cycle**. After the execution of this TPHG measurement cylce, the **raw sensor data** become available and the sensor returns automatically back to sleep mode.

Each of the individual measurements can be configured or skipped separately via the sensor settings, see section **Measurement settings**. Dependent on the configuration, the **duration of a TPHG measurement cycle** can vary from some milliseconds up to about 4.5 seconds, escpecially if gas measurement is enabled.

Therefore, the measurement process is separated into the following steps:

1. Trigger the sensor with function **_bme680_force_measurement_** to switch to *forced mode* in which it performs exactly one THPG measurement cycle.

2. Wait the measurement duration using either passive waiting with function **_vTaskDelay_** or busy waiting with function **_bme680_is_measuring_**  until the results are available.

3. Fetch the results as fixed point values with function **_bme680_get_results_fixed_** or as floating point values with function **_bme680_get_results_float_**.

For convenience reasons, it is also possible to use either function **_bme680_measure_float_** or function **_bme680_measure_fixed_**, which combine all 3 steps above within a single function. **Please note**, these functions must not be used when the are called from a software timer callback function since the calling task is delayed using function *vTaskDelay*.

#### Measurement results

Once the sensor has finished the measurement, either function **_bme680_get_results_fixed_** or function **_bme680_get_results_float_** can be used to fetch the results. These functions read the raw data from the sensor and converts them into fixed point or floating point sensor values. This conversion process bases in very complex calculations using a large number of calibration parameters.

Dependent on sensor value representation, measurement results contain different dimensions:

| Value | Fixed Point | Floating Point | Conversion
| ----- | ----------- | -------------- |-----------
| temperature | 1/100 °C | °C | float = fixed / 100
| pressure | Pascal | hPascal | float = fixed / 100
| humdidity | 1/1000 % | % | float = fixed / 1000
| gas_resistance | Ohm | Ohm | float = fixed

The gas resistance value in Ohm represents the resistance of sensor's gas sensitive layer.

## Measurement settings

The sensor allows to change different measurement parameters.

#### Oversampling rates

Using function **_bme680_set_oversampling_rates_**, it is possible to define individual oversampling rates for the measurements of temperature, pressure, and humidity. Possible oversampling rates are 1x (default by the driver) 2x, 4x, 8x and 16x. Using an oversampling rate *osr*, the resolution of raw sensor data can be increased from 16 bit to 16+ld(*osr*) bit.

It is also possible to define an oversampling rate of 0. This **deactivates** the corresponding measurement and the output values become invalid.

#### IIR Filter

The sensor integrates an internal IIR filter (low pass filter) to reduce short-term changes in sensor output values caused by external disturbances. It effectively reduces the bandwidth of the sensor output values.

The filter can optionally be used for pressure and temperature data that are subject to many short-term changes. Using the IIR filter, increases the resolution of pressure and temperature data to 20 bit. Humidity and gas inside the sensor does not fluctuate rapidly and does not require such a low pass filtering.

Using function **_bme680_set_filter_size_**, the user task can change the **size of the filter**. The default size is 3. If the size of the filter becomes 0, the filter is **not used**.

#### Heater profile

For gas measurement the sensor integrates a heater. The paremeters for this heater are defined by a heater profile. Such a heater profile consists of a temperature setting point (the target temperature) and the heating duration. 

Even though the sensor supports up to 10 different such profiles at them same time, only one profile is used by the driver for simplicity reasons. The **temperature setting point** and the **heating duration** of this one profile can be defined by the user task using function **_bme680_set_heater_profile_**. Default values used by the driver are 320 degree Celsius as target temperature and 150 ms heating duration. 

According to the datasheet, target temperatures between 200 and 400 degrees Celsius are typical and about 20 to 30 ms are necessary for the heater to reach the desired target temperature.

If heating duration is 0 ms, the gas measurement **is skipped** and output values become invalid.

## Error Handling

Most driver functions return a simple boolean value to indicate whether its execution was successful or an error happened. In the latter case, the member **_error_code_** of the sensor device data structure is set which indicates what error happened. 

There are two different error levels that are ORed into one single *error_code*, errors in the I2C or SPI communication and errors with the BME680 sensor itself.  To test for a certain error, you can AND the *error_code* with one of the error masks, **_BME680_INT_ERROR_MASK_** for I2C or SPI errors and **_BME680_DRV_ERROR_MASK_** for other errors and then test for a certain error code.


## Usage 

First, the hardware configuration has to be establisch. This can differ dependent on the communication interface used and the number of sensors.

### Hardware configurations

The driver supports multiple BME680 sensors at the same time that are connected either to I2C or SPI. Following figures show some possible hardware configurations.

First figure shows the configuration with only one sensor at I2C bus 0.

```
 +-------------------------+     +--------+
 | ESP8266  Bus 0          |     | BME680 |
 |          GPIO 5 (SCL)   +---->+ SCL    |
 |          GPIO 4 (SDA)   +-----+ SDA    |
 |                         |     +--------+
 +-------------------------+
```
Next figure shows a possible configuration with two I2C buses. In that case, the sensors can have same or different I2C slave adresses.

```
 +-------------------------+     +----------+
 | ESP8266  Bus 0          |     | BME680_1 |
 |          GPIO 5 (SCL)   ------> SCL      |
 |          GPIO 4 (SDA)   ------- SDA      |
 |                         |     +----------+
 |          Bus 1          |     | BME680_2 |
 |          GPIO 14 (SCL)  ------> SCL      |
 |          GPIO 12 (SDA)  ------- SDA      |
 +-------------------------+     +----------+
```

Last figure shows a possible configuration using I2C bus 0 and SPI bus 1 at the same time.
```
 +-------------------------+     +----------+
 | ESP8266  Bus 0          |     | BME680_1 |
 |          GPIO 5 (SCL)   ------> SCL      |
 |          GPIO 4 (SDA)   ------- SDA      |
 |                         |     +----------+
 |          Bus 1          |     | BME680_2 |
 |          GPIO 12 (MISO) <------ SDO      |
 |          GPIO 13 (MOSI) >-----> SDI      |
 |          GPIO 14 (SCK)  >-----> SCK      |
 |          GPIO 2  (CS)   >-----> CS       |
 +-------------------------+     +----------+
```
**Please note:** 

1. Since the system flash memory is connected to SPI bus 0, the sensor has to be connected to SPI bus 1. 

2. GPIO15 used as CS signal of SPI bus 1 by default, does not work correctly together with BME680. Therefore, the user has to specify another GPIO pin as CS signal when the sensor is initialized, e.g., GPIO2.

Further configurations are possible, e.g., two sensors that are connected at the same I2C bus with different slave addresses.

### Communication interface settings

Dependent on the hardware configuration, the communication interface settings have to be defined.

```
// define SPI interface for BME680 sensors
#define SPI_BUS         1
#define SPI_CS_GPIO     2   // GPIO 15, the default CS of SPI bus 1, can't be used
#else

// define I2C interface for BME680 sensors
#define I2C_BUS         0
#define I2C_SCL_PIN     GPIO_ID_PIN((5))
#define I2C_SDA_PIN     GPIO_ID_PIN((4))
#endif

```

### Main programm

If I2C interfaces are used, they have to be initialized first.

```
i2c_init(I2C_BUS, I2C_SCL_PIN, I2C_SDA_PIN, I2C_FREQ_100K))
```

Once I2C interfaces are initialized, function **_bme680_init_sensor_** has to be called for each BME680 sensor to initialize the sensor and to check its availability as well as its error state. This function returns a pointer to the sensor device data structure or NULL in case of error.

The parameters *bus* specifies the ID of the I2C or SPI bus to which the sensor is connected.

```
static bme680_sensor_t* sensor;
```

For sensors connected to an I2C interface, a valid I2C slave address has to be defined as parameter *addr*. In that case parameter *cs* is ignored.

```
sensor = bme680_init_sensor (I2C_BUS, BME680_I2C_ADDRESS_2, 0);

```

If parameter *addr* is 0, the sensor is connected to a SPI bus. In that case, parameter *cs* defines the GPIO used as CS signal.

```
sensor = bme680_init_sensor (SPI_BUS, 0, SPI_CS_GPIO);

```

The remaining part of the program is independent on the communication interface.

Optionally, you could wish to set some measurement parameters. For details see the section **Measurement settings** above, the header file of the driver **bme680.h**, and of course the datasheet of the sensor.

```
if (sensor)
{
    // Changes the oversampling rates (default os_1x) to 4x oversampling 
    // for temperature and 2x oversampling for humidity. Pressure 
    // measurement is skipped in this example.
    bme680_set_oversampling_rates(sensor, osr_4x, osr_none, osr_2x);
    
    // Change the IIR filter size (default iir_size_3) for temperature and
    // and pressure to 7.
    bme680_set_filter_size(sensor, iir_size_7);

    // Change the heaeter profile (default 320 degree Celcius for 150 ms)
    // to 200 degree Celcius for 100 ms.
    bme680_set_heater_profile (sensor, 320, 150);
 
    ...
}
```

Last, the user task that uses the sensor has to be created.


### User task

BME680 supports only the *forced mode* that performs exactly one measuerement. Therefore, the measurement has to be triggered in each cycle. The waiting for measurement results is also required in each cylce, before the results can be fetched.

Thus the user task could look like the following:


```
void user_task(void *pvParameters)
{
    bme680_values_float_t values;
    int32_t duration;

    TickType_t last_wakeup = xTaskGetTickCount();
    
    while (1) 
    {   
        // trigger the sensor to start one TPHG measurement cycle 
        duration = bme680_force_measurement (sensor);
        
        // passive waiting until measurement results are available
        if (duration > 0) vTaskDelay (duration);
        
        // busy waiting until measurement results are available
        // while (bme680_is_measuring (sensor) > 0) ;

        // get the results and do something with them
        if (bme680_get_results_float (sensor, &values))
            printf("%.3f BME680 Sensor: %.2f °C, %.2f %%, %.2f hPa, %.2f Ohm\n", 
                   (double)sdk_system_get_time()*1e-3,
                   values.temperature, values.humidity, 
                   values.pressure, values.gas_resistance);

        // passive waiting until 1 second is over
        vTaskDelayUntil(&last_wakeup, 1000 / portTICK_PERIOD_MS);
    }
}
```

Function **_bme680_force_measurement_** is called inside the task loop to start exactly one measurement in each cycle. It returns the estimated duration of the measurement dependent on the measurement settings. The task is then delayed by this duration using function **_vTaskDelay_** to wait passively before the results are fetched with function **_bme680_get_results_float**. The busy waiting alternative is shown in comments.

### Error Handling

The code could be extended by an error handling. In the event of an error, most driver functions set member **_error_code_** of the sensor device data structure. This indicates which error has occurred. Error codes are a combination of I2C and SPI communication error codes as well as BME680 sensor error codes. To test a particular error, the *error code* can be AND with one of the error masks **_BME680_INT_ERROR_MASK_** or **_BME680_DRV_ERROR_MASK_**.

For example, error handling for **_bme680_get_results_** could look like:
```

if (bme680_get_results (sensor, &values))
{
    // no error happened
    ...
}
else
{
    // error happened
    
    switch (sensor->error_code & BME680_INT_ERROR_MASK)
    {
        case BME680_I2C_BUSY:        ...
        case BME680_I2C_READ_FAILED: ...
        ...
    }
    switch (sensor->error_code & BME680_DRV_ERROR_MASK)
    {
        case BME680_MEAS_NOT_RUNNING: ...
        case BME680_NO_NEW_DATA:      ...
        ...
    }
}
```

## Full Example

```
// Uncomment to use SPI
// #define SPI_USED
 
#include "espressif/esp_common.h"
#include "esp/uart.h"

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
#define I2C_SCL_PIN     GPIO_ID_PIN((5))
#define I2C_SDA_PIN     GPIO_ID_PIN((4))
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
    int32_t duration;

    TickType_t last_wakeup = xTaskGetTickCount();
    
    while (1) 
    {   
        // trigger the sensor to start one TPHG measurement cycle 
        duration = bme680_force_measurement (sensor);
        
        // passive waiting until measurement results are available
        if (duration > 0) vTaskDelay (duration);
        
        // busy waiting until measurement results are available
        // while (bme680_is_measuring (sensor) > 0) ;

        // get the results and do something with them
        if (bme680_get_results_float (sensor, &values))
            printf("%.3f BME680 Sensor: %.2f °C, %.2f %%, %.2f hPa, %.2f Ohm\n", 
                   (double)sdk_system_get_time()*1e-3,
                   values.temperature, values.humidity, 
                   values.pressure, values.gas_resistance);

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
            
        // Changes the oversampling rates (default os_1x) to 4x oversampling 
        // for temperature and 2x oversampling for humidity. Pressure 
        // measurement is skipped in this example.
        bme680_set_oversampling_rates(sensor, osr_4x, osr_none, osr_2x);
    
        // Change the IIR filter size (default iir_size_3) for temperature and
        // and pressure to 7.
        bme680_set_filter_size(sensor, iir_size_7);

        // Change the heaeter profile (default 320 degree Celcius for 150 ms)
        // to 200 degree Celcius for 100 ms.
        bme680_set_heater_profile (sensor, 320, 150);
    }
}
```

## Further Examples

For further examples see [examples directory](../../examples/bme680/README.md)



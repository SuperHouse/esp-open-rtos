# Driver for SHT3x digital temperature and humity sensor

This driver is written for usage with the ESP8266 and FreeRTOS ([esp-open-rtos](https://github.com/SuperHouse/esp-open-rtos) and [esp-open-rtos-driver-i2c](https://github.com/kanflo/esp-open-rtos-driver-i2c)).

Please note: The driver supports multiple sensors connected to different I2C with differen addresses.

## About the sensor

SHT3x is a digital temperature and humity sensor that uses I2C interface as slave with up to 1 MHz communication speed. It can operate with three levels of *repeatability* (low, medium and high) in two different modes, the *single shot data aquisition mode* and the *periodic data aquisition mode*.

### Single shot data aquisition mode

In this mode one issued measurement command triggers the acquisition of one data pair. Each data pair
consists of temperature and humidity as 16 bit decimal values. 

Repeatability setting influences the measurement duration as well as the current consumption of the sensor. The measuerment takes 3 ms at low repeatability, 5 ms at low repeatability, and 13.5 ms at high respectively. Average current consumption while sensor is measuring at lowest repeatability is 800 uA. That is, the higher repeatability level is, the longer the measurement takes and the higher the power consumption is. In standby the sensor consumes only 0.2 uA.

### Periodic data aquisition mode

In this mode one issued measurement command yields a stream of data pairs. Each data pair
consists of temperature and humidity as 16 bit decimal values. Once the measurement command is sent to the sensor, it executes measurements periodically by itself with a rate of 0.5, 1, 2, 4 or 10 measurements per second (mps). The data pairs can be read by a fetch command at the same rate.

As in single shot data aquisition mode, the repeatability setting influences the measurement duration as well as the current consumption of the sensor, see above.

## How the driver works

To avoid blocking of user tasks during the measurements, a seperate task running in background is created for each connectd SHT3x sensor using the function *sht3x_create_sensor*. The background task realizes the measurement procedure which is executed periodically at a rate that can be defined by the user using function *sht3x_set_measurement_period* (default period is 1000 ms).

### Measurement

Since predefined rates of *periodic data aquisition mode* of the sensor itself are normally not compatible with user requirements, the measurement procedure is realized in *single shot data aquisition mode* at the highest level of repeatability. Because of the sensor power characteristics, *single shot data aquisition mode* is more power efficient than using *periodic data aquisition mode* in most use cases. 

However, using the *single shot data aquisition mode* produces a delay of 20 ms for each measurement. This is the time needed from issuing the measurement command until measured sensor data are available and can be read. Since the delay is realized using *vTaskDelay* function in the background task, neither the system nor any user task is blocked during the measurement. 

Please note: Since each measurement produces a delay of 20 ms, the minimum period that can be defined with function *sht3x_set_measurement_period* is 20 ms. Therefore, a maximum measurement rate of 50 mps could be reached.

### Measured data

At each measurement, *actual sensor values* for temperature as well as humidity are determined as floating point values from measuered data pairs. Temerature is given in °C as well in °F. Humiditiy is given in percent. Based on these *actual sensor values* the background task also computes *average sensor values* successive at each measurement using the exponential moving average

    Average[k] = W * Value + (1-W) * Average [k-1]

where coefficient W represents the degree of weighting decrease, a constant smoothing factor between 0 and 1. A higher W discounts older observations faster. The coefficient W (smoothing factor) can be defined by the user (default W is 0.2) using function *sht3x_set_average_weight*.

### Getting results.

To get measured values by a user task, there are two possibilities, the defining a callback function or calling function *sht3x_get_values*.

#### Using callback function

For each connected SHT3 sensor, the user can register a callback function using function *sht3x_set_callback_function*. If a callback function is registered, it is called after each measurement by the background task to pass the *actual sensor values* and *average sensor values* to user tasks. Thus, the user gets the results automatically with same rate as the periodic measurement is executed.

Using the callback function is the easiest way to get the results.

#### Using function sht3x_get_values

If there is no callback function registered, the user has to use function *sht3x_get_values* explicitly to get *actual sensor values* and *average sensor values*. To ensure that these values are up-to-date, the rate of periodic measurement in background task should be at least the same as the rate of using function *sht3x_get_values*

## Usage

Before using the sht3x driver, function *sht3x_init* needs to be called to setup each I2C interface. 

```
#define I2C_BUS       0
#define I2C_SCL_PIN   GPIO_ID_PIN((5))
#define I2C_SDA_PIN   GPIO_ID_PIN((4))

#define SHT3x_ADDR 0x45

...
i2c_init(I2C_BUS, I2C_SCL_PIN, I2C_SDA_PIN, I2C_FREQ_100K))
...
```

Next, the SHT3x driver itself has to be initialized using function *sht3x_init*.

```
sht3x_init();
```

If SHT3x driver initialisation was successful, function *sht3x_create_sensor* has to be called for each sensor to initialize the sensor connected to a certain bus with slave address, to check its availability and to start a background task for measurments.

```
sensor = sht3x_create_sensor (I2C_BUS, SHT3x_ADDR);
```

This function returns the id of the sensor between 0 and *SHT3x_MAX_SENSORS* on success or -1 on error. This id is used to identify the sensor in all other functions used later.

If you want to use a callback function defined like following

```
static void my_callback_function (uint32_t sensor, 
                                  sht3x_value_set_t actual, 
                                  sht3x_value_set_t average)
{
  ...
}
```

you have to register it using *sht3x_set_callback_function*

```
sht3x_set_callback_function (sensor, &my_callback_function);
```

Optionally, you could set the measurement period using function *sht3x_set_measurement_period* or the weight (smoothing factor) for exponential moving average computation using function *sht3x_set_average_weight*.

```
sht3x_set_measurement_period (sensor, 1000);
sht3x_set_average_weight (sensor, 0.2);
```

All functions return a boolean that allows effecitve error handling.


## Full Example 

```
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
```

## Further Examples

For further examples see [Examples directory](../../examples/sht3x/README.md)




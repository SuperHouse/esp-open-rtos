# Driver for **SHT3x** digital temperature and humidity sensor

This driver is written for usage with the ESP8266 and FreeRTOS using the I2C interface driver ([esp-open-rtos](https://github.com/SuperHouse/esp-open-rtos) and [esp-open-rtos-driver-i2c](https://github.com/kanflo/esp-open-rtos-driver-i2c)).

Please note: The driver supports multiple sensors connected to different I2C interfaces and different addresses.

## About the sensor

SHT3x is a digital temperature and humidity sensor that uses an I2C interface with up to 1 MHz communication speed. It can operate with **three levels of repeatability** (low, medium and high) and in two different modes, the **single shot data acquisition mode** and the **periodic data acquisition mode**.

### Single shot data acquisition mode

In this mode, a measurement command triggers the **acquisition of one data pair**. Each data pair consists of temperature and humidity as 16-bit decimal values.

The repeatability affects the measurement time as well as the power consumption of the sensor. The measurement takes 3 ms with low repeatability, 5 ms with medium repeatability and 13.5 ms with high repeatability. That is, the measurement produces a noticeable delay in execution.

While the sensor measures at the lowest repeatability, the average current consumption is 800 μA. That is, the higher the repeatability level, the longer the measurement takes and the higher the power consumption. The sensor consumes only 0.2 μA in standby mode.

### Periodic data acquisition mode

In this mode, one issued measurement command yields a stream of data pairs. Each data pair again consists of temperature and humidity as 16-bit decimal values. As soon as the measurement command has been sent to the sensor, it performs measurements **periodically at a rate of 0.5, 1, 2, 4 or 10 measurements per second (mps)**. The data pairs can be read with a fetch command at the same rate.

As in the *single shot data acquisition mode*, the repeatability setting affects both the measurement time and the current consumption of the sensor, see above.

## How the driver works

In order to avoid blocking of user tasks during measurements due to their duration, separate **background tasks** are used for each sensor to **carry out the measurements**. These background tasks are created automatically when a user task calls function **_sht3x_create_sensor_** to initialize a connected SHT3x sensor. For each connected sensor, one background task is created. The background tasks realize the measurement procedures which are executed periodically at a rate that can be defined by the user for each sensor separately using function **_sht3x_set_measurement_period_** (default period is 1000 ms).

### Measurement method

Since the predefined rates of *periodic data acquisition mode* of the sensor itself are normally not compatible with user requirements, the **periodic measurements are realized by the background task using the _single shot data acquisition mode_** at the highest level of repeatability. Because of the sensor power characteristics, *single shot data acquisition mode* is more power efficient than using the *periodic data acquisition mode* in most use cases. 

However, using the *single shot data acquisition mode* produces a delay of 20 ms for each measurement. This is just the time needed from issuing the measurement command until measured sensor data are available and can be read. Since this delay is realized using **_vTaskDelay_** function in the background tasks, **neither the system nor any user task is blocked during the measurements**. 

Since each measurement produces a delay of 20 ms, the **minimum period** that can be defined with function **_sht3x_set_measurement_period_** is 20 ms. Therefore, a maximum measurement rate of 50 mps could be reached.

### Measured data

At each measurement, **actual sensor values** for temperature as well as humidity are determined as floating point values from the measured data pairs. Temperature is given in °C as well as in °F. Humidity is given in percent. 

If average value computation is enabled (default), the background task also computes successively at each measurement the **average sensor values** based on these *actual sensor values* using the exponential moving average 

    Average[k] = W * Actual + (1-W) * Average [k-1]

where coefficient W represents the degree of weighting decrease, a constant smoothing factor between 0 and 1. A higher W discounts older observations faster. The coefficient W (smoothing factor) can be defined by the user task using function **_sht3x_set_average_weight_**. The default value of W is 0.2. The average value computation can be enabled or disabled using function **_sht3x_enable_average_computation_**.

If average computation is disabled, *average sensor values* correspond to the *actual sensor values*.

### Getting results.

As soon as a measurement is completed, the actual sensor values * and * average sensor values * can be read by user tasks. There are two ways to do this:

- define a **callback function** or 
- call the function **_sht3x_get_values_** explicitly.

#### Using callback function

For each connected SHT3 sensor, the user task can register a callback function using function **_sht3x_set_callback_function_**. If a callback function is registered, it is called by the background task after each measurement to pass *actual sensor values* and *average sensor values* to user tasks. Thus, the user gets the results of the measurements automatically with same rate as the periodic measurements are executed.

Using the callback function is the easiest way to get the results.

#### Using function **_sht3x_get_values_**

If there is no callback function registered, the user task has to call function **_sht3x_get_values_** to get *actual sensor values* and *average sensor values*. These values are stored in data structures that are specified as pointer parameters. Using NULL pointers for the parameters, the user task can decide which results are not interesting.

To ensure that the values are up-to-date, the rate of periodic measurement in background task should be at least the same or higher as the rate of using function **_sht3x_get_values_**. That is, the period of measurements in background task set with function **_sht3x_set_measurement_period_** has to be less or equal than the rate of using function **_sht3x_get_values_**.

If average computation is disabled, *average sensor values* are just the same as *actual sensor values*.

Please note: The minimum measurement period can be 20 ms.

## Usage

Before using the SHT3x driver, function **_i2c_init_** needs to be called to setup each I2C interface. 

```
#define I2C_BUS       0
#define I2C_SCL_PIN   GPIO_ID_PIN((5))
#define I2C_SDA_PIN   GPIO_ID_PIN((4))

#define SHT3x_ADDR 0x45

...
i2c_init(I2C_BUS, I2C_SCL_PIN, I2C_SDA_PIN, I2C_FREQ_100K))
...
```

Next, the SHT3x driver itself has to be initialized using function **_sht3x_init_**.

```
sht3x_init();
```

If SHT3x driver initialization was successful, function **_sht3x_create_sensor_** has to be called for each sensor to initialize the sensor connected to a certain bus with given slave address, to check its availability and to start the background task for measurements.

```
sensor = sht3x_create_sensor (I2C_BUS, SHT3x_ADDR);
```

On success this function returns the *ID* of a sensor descriptor between 0 and **_SHT3x_MAX_SENSORS_** or -1 otherwise. This *ID* is used to identify the sensor in all other functions used later.

If you want to use a callback function to get the measurement results, it has to be defined like following. 

```
static void my_callback_function (uint32_t sensor, 
                                  sht3x_value_set_t actual, 
                                  sht3x_value_set_t average)
{
  ...
}
```

You have to register this callback function using **_sht3x_set_callback_function_**.

```
sht3x_set_callback_function (sensor, &my_callback_function);
```

Optionally, you could set the measurement period using function **_sht3x_set_measurement_period_** or the weight (smoothing factor) for exponential moving average computation using function **_sht3x_set_average_weight_**.

```
sht3x_set_measurement_period (sensor, 1000);
sht3x_set_average_weight (sensor, 0.2);
```

All functions return a boolean that allows effective error handling.

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
           actual.temperature_c, average.temperature_c, 
           actual.temperature_f, average.temperature_f, 
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
    
    // Optional: Set the weight for exponential moving average (default 0.2)
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

For further examples see [examples directory](../../examples/sht3x/README.md)




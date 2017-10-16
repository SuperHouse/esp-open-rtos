# Driver for **SHT3x** digital **temperature and humidity sensor**

This driver is written for usage with the ESP8266 and FreeRTOS using the I2C interface driver. It supports multiple SHT3x sensors connected to the same or different I2C interfaces.

## About the sensor

SHT3x is a digital temperature and humidity sensor that uses an I2C interface with up to 1 MHz communication speed. It can operate with **three levels of repeatability** (low, medium and high) and in two different modes, the **single shot data acquisition mode** (or short **single shot mode**) and the **periodic data acquisition mode** (or short **periodic mode**).

## Measurement process

Once the SHT3x sensor is initialized, it can be used for measurements. 

### Single shot mode

In **single shot mode**, a measurement command triggers the acquisition of **exactly one data pair**. Each data pair consists of temperature and humidity as 16-bit decimal values. 

Due to the measurement duration of up to 30 ms, the measurement process is separated into steps to avoid blocking the user task during measurements:

1. Trigger the sensor with function **_sht3x_start_measurement_** to start exactly one single measurement.

2. Wait the measurement duration until the results are available using passive waiting with function **_vTaskDelay_** or busy waiting with function **_sht3x_is_measuring_**.

3. Fetch the results as floating point sensor values with function **_sht3x_get_results_** or as raw data with function **_sht3x_get_raw_data_**.

In the *single shot mode*, the user task has to perform all steps every time new sensor values ​​are needed. When using the *single image mode*, however, a delay of up to 30 ms is generated for each measurement.

The advantage of this mode is that the sensor can switch between successive measurements into the sleep mode, which is more energy-efficient. This is particularly useful when the measurement rate is less than 1 measurement per second.

### Periodic mode

In this mode, one issued measurement command yields a stream of data pairs. Each data pair consists again of temperature and humidity as 16-bit decimal values. As soon as the measurement command has been sent to the sensor, it automatically performs measurements **periodically at a rate of 0.5, 1, 2, 4 or 10 measurements per second (mps)**. The data pairs can be fetched with the same rate or a less rate.

As in *single shot mode*, the measurement process is separated into the following steps:

1. Trigger the sensor with function **_sht3x_start_measurement_** and the rate of periodic measurements to start periodic measurements.

2. Wait the measurement duration until the results are available using passive waiting with function **_vTaskDelay_** or busy waiting with function **_sht3x_is_measuring_**.

3. Fetch the results as floating point sensor values with function **_sht3x_get_results_** or as raw data with function **_sht3x_get_raw_data_**.

However, in contrast to the *single shot mode*, steps 1 and 2 have to be executed only once. Once the measurement is started, the user task hast can simply fetch data periodically. 

The rate of fetching the data must be not greater than the rate of periodic measuring rate of the sensor, however, it *should be less* to avoid conflicts caused by the timing tolerance of the sensor.

## Measurement results

Once new measurement results are available, either function **_sht3x_get_raw_data_** or function **_sht3x_get_results_** can be used to fetch the results. 

Function **__sht3x_get_raw_data_** fetches only the raw sensor data in 16-decimal format, checks the CRC checksums and stores them in an byte array of type **_sht3x_raw_data_t_**. The user task then can use them directly or to call function **_sht3x_compute_values_** to compute floating point sensor values from them. 

Function **_sht3x_get_results_** combines function *sht3x_read_raw_data* and function 
 *sht3x_compute_values_* to get the latest sensor values. This is the preferred approach to get sensor values by the user task.

## Error Handling

Most driver functions return a simple boolean value to indicate whether its execution was successful or an error happened. In the latter case, the member **_error_code_** of the sensor device data structure is set which indicates what error happened. 

There are two different error levels that are ORed into one single *error_code*, errors in the I2C communication and errors with the SHT3x sensor itself.  To test for a certain error you can AND the *error_code* with one of the error masks, **_SHT3x_I2C_ERROR_MASK_** for I2C errors and **_SHT3x_DRV_ERROR_MASK_** for other errors and then test for a certain error code.


## Repeatability

The SHT3x sensor supports **three levels of repeatability** (low, medium and high). Repeatability is the variation in measurement results taken by the sensor under the same conditions, and in a short period of time. It is a measure for the noise on the physical sensor output. The higher the repeatability the smaller are changes in the output subsequent measurements.

The repeatability settings influences the measurement duration as well as the power consumption of the sensor. The measurement takes 3 ms with low repeatability, 5 ms with medium repeatability and 13.5 ms with high repeatability. That is, the measurement produces a noticeable delay in execution.

While the sensor measures at the lowest repeatability, the average current consumption is 800 μA. That is, the higher the repeatability level, the longer the measurement takes and the higher the power consumption. The sensor consumes only 0.2 μA in standby mode.

Measurements started using function **_sht3x_start_measurement_** always use highest repeatability level by default. User task can change this by setting member **_repeatability_** of the sensor device data structure before function **_sht3x_start_measurement_** is called.


## Usage

Before using the SHT3x driver, function **_i2c_init_** needs to be called for each I2C interface to setup them. 

```
#include "sht3x/sht3x.h"
...
#define I2C_BUS       0
#define I2C_SCL_PIN   GPIO_ID_PIN((5))
#define I2C_SDA_PIN   GPIO_ID_PIN((4))

...
i2c_init(I2C_BUS, I2C_SCL_PIN, I2C_SDA_PIN, I2C_FREQ_100K))
...
```

Once I2C interfaces are initialized, function **_sht3x_init_sensor_** has to be called for each SHT3x sensor to initialize the sensor and to check its availability as well as its error state. The parameters specify the I2C bus to which it is connected and its I2C slave address.

```
static sht3x_sensor_t* sensor;    // pointer to sensor device data structure
...
if ((sensor = sht3x_init_sensor (I2C_BUS, SHT3x_ADDR_2)))
{
    ...
}
```

Function **_sht3x_init_sensor_** returns a pointer to the sensor device data structure or NULL in case of error.

Last, the user task that uses the sensor has to be created.

```
xTaskCreate(user_task, "user_task", 256, NULL, 2, 0);
```

In the **periodic mode**, the user task has to start the periodic measurement only once at the beginning of the task. After that, it has only to wait for the results of the first measurement. In the task loop itself, it simply fetches the next measurement results in each cycle.

Thus, in this mode the user task could look like the following:

```
void user_task (void *pvParameters)
{
    sht3x_values_t values;
    int32_t duration;

    // start periodic measurements with 1 measurement per second
    duration = sht3x_start_measurement (sensor, periodic_1mps);

    // passive waiting until first measurement results are available
    if (duration > 0)
        vTaskDelay (duration);

    // busy waiting until first measurement results are available
    // while (sht3x_is_measuring (sensor) > 0) ;

    TickType_t last_wakeup = xTaskGetTickCount();
    
    while (1) 
    {
        // get the values and do something with them
        if (sht3x_get_results (sensor, &values))
            printf("%.3f SHT3x Sensor: %.2f °C, %.2f %%\n", 
                   (double)sdk_system_get_time()*1e-3,  
                   values.temperature, values.humidity);

        // passive waiting until 2 seconds (cycle time) are over
        vTaskDelayUntil(&last_wakeup, 2000 / portTICK_PERIOD_MS);
    }
}
```

At the beginning of the task, the periodic measurement is started by function **_sht3x_start_measurement_** with a rate of 1 measurement per second. Using the measurement duration in RTOS ticks returned from this function, the task is delayed using **_vTaskDelay_** to wait for first measurement results. The busy waiting alternative using function **_sht3x_is_measuring_** is shown in comments. Inside the task loop, the measurement results are fetched periodically using function **_sht3x_get_results_** with a rate of once per second.

In the **single shot mode**, the measurement has to be triggered 
in each cycle. Waiting for measurement results is also required in each cylce, before the results can be fetched.

Thus the user task could look like the following:

```
void user_task (void *pvParameters)
{
    sht3x_values_t values;
    int32_t duration;

    TickType_t last_wakeup = xTaskGetTickCount();

    while (1) 
    {
        // trigger one measurement in single shot mode
        duration = sht3x_start_measurement (sensor, single_shot);
        
        // passive waiting until measurement results are available
        if (duration > 0)
            vTaskDelay (duration);
        
        // busy waiting until first measurement results are available
        // while (sht3x_is_measuring (sensor) > 0) ;

        // retrieve the values and do something with them
        if (sht3x_get_results (sensor, &values))
            printf("%.3f SHT3x Sensor: %.2f °C, %.2f %%\n", 
                   (double)sdk_system_get_time()*1e-3,  
                   values.temperature, values.humidity);

        // passive waiting until 5 seconds are over
        vTaskDelayUntil(&last_wakeup, 5000 / portTICK_PERIOD_MS);
    }
}
```

In contrast to the *periodic mode*, the function **_sht3x_start_measurement_** is called inside the task loop to start exactly one measurement in each cycle. The task is then also delayed every time using function **_vTaskDelay_** before the results are fetched with function **_sht3x_get_results_** in each cycle.

The code could be extended by an error handling. In the event of an error, most driver functions set member **_error_code_** of the data structure of the sensor device. This indicates which error has occurred. Error codes are a combination of I2C communication error codes and SHT3x sensor error codes. To test a particular error, the *error code* can be AND with one of the error masks **_SHT3x_I2C_ERROR_MASK_** or **_SHT3x_DRV_ERROR_MASK_**.

For example, error handling for **_sht3x_get_results_** could look like:
```

if (sht3x_get_results (sensor, &values))
{
    // no error happened
    ...
}
else
{
    // error happened
    
    switch (sensor->error_code & SHT3x_I2C_ERROR_MASK)
    {
        case SHT3x_I2C_BUSY:        ...
        case SHT3x_I2C_READ_FAILED: ...
        ...
    }
    switch (sensor->error_code & SHT3x_DRV_ERROR_MASK)
    {
        case SHT3x_MEAS_NOT_RUNNING:      ...
        case SHT3x_READ_RAW_DATA_FAILED:  ...
        case SHT3x_WRONG_CRC_TEMPERATURE: ...
        ...
    }
}
```

## Full Example 

```
#include "espressif/esp_common.h"
#include "esp/uart.h"

#include "FreeRTOS.h"
#include "task.h"

// include SHT3x driver
#include "sht3x/sht3x.h"

// define I2C interfaces at which SHTx3 sensors are connected
#define I2C_BUS       0
#define I2C_SCL_PIN   GPIO_ID_PIN((5))
#define I2C_SDA_PIN   GPIO_ID_PIN((4))

static sht3x_sensor_t* sensor;    // sensor device data structure

/*
 * User task that fetches latest measurement results of sensor every 2
 * seconds. It starts the SHT3x in periodic mode with 1 measurements per
 * second (*periodic_1mps*). It uses passive waiting for first measurement
 * results.
 */
void user_task (void *pvParameters)
{
    sht3x_values_t values;

    // start periodic measurements with 1 measurement per second
    sht3x_start_measurement (sensor, periodic_1mps);
    
    // passive waiting until measurement results are available
    if (duration > 0)
        vTaskDelay (duration);

    TickType_t last_wakeup = xTaskGetTickCount();
    
    while (1) 
    {
        // get the values and do something with them
        if (sht3x_get_results (sensor, &values))
            printf("%.3f SHT3x Sensor: %.2f °C, %.2f %%\n", 
                   (double)sdk_system_get_time()*1e-3,  
                   values.temperature, values.humidity);
                   
        // passive waiting until 2 seconds (cycle time) are over
        vTaskDelayUntil(&last_wakeup, 2000 / portTICK_PERIOD_MS);
    }
}
#endif

void user_init(void)
{
    // Set UART Parameter
    uart_set_baud(0, 115200);

    // Give the UART some time to settle
    sdk_os_delay_us(500);
    
    // Init I2C bus interfaces at which SHT3x sensors are connected
    // (different busses are possible)
    i2c_init(I2C_BUS, I2C_SCL_PIN, I2C_SDA_PIN, I2C_FREQ_100K);
    
    // Create sensors
    if ((sensor = sht3x_init_sensor (I2C_BUS, SHT3x_ADDR_2)))
    {
        // Create a user task that uses the sensor
        xTaskCreate(user_task, "user_task", 256, NULL, 2, 0);
        
    }

    // That's it.
}
```

## Further Examples

See also the examples in the examples directory [examples directory](../../examples/sht3x/README.md).

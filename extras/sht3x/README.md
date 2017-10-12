# Driver for **SHT3x** digital **temperature and humidity sensor**

This driver is written for usage with the ESP8266 and FreeRTOS using the I2C interface driver. It supports multiple sensors connected to the same or different I2C interfaces.

## About the sensor

SHT3x is a digital temperature and humidity sensor that uses an I2C interface with up to 1 MHz communication speed. It can operate with **three levels of repeatability** (low, medium and high) and in two different modes, the **single shot data acquisition mode** (or short **single shot mode**) and the **periodic data acquisition mode** (or short **periodic mode**).

### Repeatability

Repeatability or test–retest reliability is the variation in measurement results taken by the sensor under the same conditions, and in a short period of time. It is a measure for the noise on the physical sensor output. The higher the repeatability the smaller are changes in the output subsequent measurements.

The repeatability settings influences the measurement duration as well as the power consumption of the sensor. The measurement takes 3 ms with low repeatability, 5 ms with medium repeatability and 13.5 ms with high repeatability. That is, the measurement produces a noticeable delay in execution.

While the sensor measures at the lowest repeatability, the average current consumption is 800 μA. That is, the higher the repeatability level, the longer the measurement takes and the higher the power consumption. The sensor consumes only 0.2 μA in standby mode.

### Single shot data acquisition mode

In this mode, a measurement command triggers the acquisition of **exactly one data pair**. Each data pair consists of temperature and humidity as 16-bit decimal values.

### Periodic data acquisition mode

In this mode, one issued measurement command yields a stream of data pairs. Each data pair again consists of temperature and humidity as 16-bit decimal values. As soon as the measurement command has been sent to the sensor, it performs measurements **periodically at a rate of 0.5, 1, 2, 4 or 10 measurements per second (mps)**. The data pairs can be read with a fetch command at the same rate.

As in the *single shot mode*, the repeatability setting affects both the measurement duration and the current consumption of the sensor, see above.


## How the driver works

The driver supports multiple SHT3x sensors at the same time. They can be connected with different addresses at the same I2C bus or with arbitrary addresses to different I2C buses. Each sensor has to be initialized at the beginning using function **_sht3x_init_sensor_**. Parameters are the I2C bus and address at which the sensor is connected.

### Measurement process

Once the sensor is initialized and tested, it can be used for measurements. In order to avoid blocking of user tasks during measurements due to their duration, the measurement process is splitted into the following steps:

1. Trigger the sensor to start the measurement either in *single shot mode* or in *periodic mode*.

2. Fetch the values from the sensor once in *single shot mode* or periodically in *periodic mode*

Between the first step and the second step, the sensor performs the measurement, which can take up to 30 ms. During that time the user task has to wait.

#### Single shot data acquisition mode

In the *single shot mode*, the user task has to execute both steps every time new sensor values are needed, including the waiting time. The advantage of this mode is that the sensor can switch between successive measurements into the sleep mode which is more power-efficient. However, using the *single shot mode* produces a delay of up to 30 ms for each measurement. 

#### Periodic data acquisition mode

In the *periodic mode*, the sensor automatically performs periodic measurements. Once the sensor has been triggered to start periodic measurements, new measurement results become available every 100 ms, 250 ms, 500 ms, 1000 ms or 2000 ms. The user task has simply to fetch them. Of course, the rate of fetching new measurement results must be less than the rate used by the sensor. The only waiting time required in this mode is the time between the start of the periodic measurements and the time when the first measurement results become available.

As in the *single shot mode* the sensor switches to the sleep mode between successive measurements. Thus, the *periodic mode* becomes as power-efficient as the *single shot mode* when at least one measurement result per second is required by the user task. Only, if the user task requires new measurement results seldom, e.g. one measurement per minute, then the *single shot mode* is the better choice.

### Starting measurement

Measurements are started using function **_sht3x_start_measurement_**. The SHT3x data acquisition mode to be used is defined by a parameter. In both modes, the highest repeatability is used.

If the measurement could be started successfully, the function returns an estimated duration until the first measurement results become available. The user task can use this duration with function **_vTaskDelay_** to wait until the measurement results are available. Alternatively, function **_sht3x_is_running_** can be used to realize a busy waiting. This function returns the remaining duration until the measurement will be finished.

Please note: Since *vTaskDelay* can only handle delays as multiples of 10 ms, the duration obtained as return value from function *sht3x_start_measurement* is 30 ms for high repeatability and 20 ms for medium as well as low repeatability.

### Measured data

Once new measurement results are available, either function **_sht3x_get_raw_data_** or function **_sht3x_get_results_** can be used to fetch the results. 

Function **__sht3x_get_raw_data_** fetches only the raw sensor data in 16-decimal format, checks the CRC checksums and stores them in an byte array of type **_sht3x_raw_data_t_**. The user task then can use them directly or to call function **_sht3x_compute_values_** to compute floating point sensor values from them. 

Function **_sht3x_get_results_** combines function *sht3x_read_raw_data* and function 
 *sht3x_compute_values_* to get the latest sensor values. This is the preferred approach to get sensor values by the user task.

In the **periodic mode**, the function *sht3x get_results* can be executed repeatedly without a new call of function *sht3_start_measurement* and without a new waiting time. However, the rate of the repeated call should be less than the half of the periodic measuring rate of the sensor.

## Error Handling

Most driver functions return a simple boolean value to indicate whether its execution was successful or an error happened. In later case, the member **_error_code_** of the sensor device data structure is set which indicates what error happened. 

There are two different error levels that are ORed into one single *error_code*, errors in I2C communication and errors with the SHT3x sensor itself.  To test for a certain error you can AND the *error_code* with one of the error masks, **_SHT3x_I2C_ERROR_MASK_** for I2C errors and **_SHT3x_DRV_ERROR_MASK_** for other errors and then test for a certain error code.

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

```
sht3x_init_driver();
```

Once I2C interfaces are initialized, function **_sht3x_init_sensor_** has to be called for each sensor to initialize the sensor and to check its availability as well as its error state. The parameters specify the I2C bus and address to which it is connected.

```
static sht3x_sensor_t* sensor;    // pointer to sensor device data structure
...
sensor = sht3x_init_sensor (I2C_BUS, SHT3x_ADDR_2);
```

Function **_sht3x_init_sensor_** returns a pointer to the sensor device data structure or NULL in case of error.

Last, the user task that uses the sensor has to be created.

```
xTaskCreate(user_task, "user_task", 256, NULL, 2, 0);
```

The user task can use the sensor in two different ways, either in *periodic mode* or in *single shot mode*. 

In *periodic mode* the user task calls function **_sht3x_start_measurement_** only once and fetches the measurement result in each cycle with function **_sht3x_get_results_** without any delay. In this mode the user task could look like the following:

```
void user_task(void *pvParameters)
{
    sht3x_values_t values;
    int32_t duration;

    duration = sht3x_start_measurement (sensor, periodic_1mps);

    // busy waiting
    // while (sht3x_is_measuring (sensor) > 0) ;

    // suspend the task for waiting
    if (duration > 0)
        vTaskDelay (duration/portTICK_PERIOD_MS);
    
    TickType_t last_wakeup = xTaskGetTickCount();

    while (1) 
    {
        // retrieve the values and do something with them
        if (sht3x_get_results (sensor, &values))
            printf("%.3f SHT3x Sensor: %.2f °C, %.2f %%\n", 
                   (double)sdk_system_get_time()*1e-3,  
                   values.temperature, values.humidity);

        // passive waiting until 2 seconds are over
        vTaskDelayUntil(&last_wakeup, 2000 / portTICK_PERIOD_MS);
    }
}
```
At the beginning of the task, the periodic measurement is started by function **_sht3x_start_measurement_** with a rate of 1 measurements per second. Using the duration returned from this function, the task is delayed using **_vTaskDelay_**. This is the duration until the first measurement results become available. The busy waiting alternative is shown in comments.

Inside the task loop, the measurement results are fetched periodically using function **_sht3x_get_results_** with a rate of once per second.

In the *single shot mode*, the measurement in each cycle consist of the three steps:

- start the measurement using function **sht3x_start_measurement_**
- waiting the measurement duration
- fetch the results using function **sht3x_get_results_**

Thus the user task could look like the following:

```
void user_task(void *pvParameters)
{
    sht3x_values_t values;
    int32_t duration;

    TickType_t last_wakeup = xTaskGetTickCount();

    while (1) 
    {
        // trigger one measurement in single shot mode
        duration = sht3x_start_measurement (sensor, single_shot);
        
        // busy waiting
        // while (sht3x_is_measuring (sensor) > 0) ;

        // passive waiting until measurement results are available
        if (duration > 0)
            vTaskDelay (duration/portTICK_PERIOD_MS);
        
        // retrieve the values and do something with them
        if (sht3x_get_results (sensor, &values))
            printf("%.3f SHT3x Sensor: %.2f °C, %.2f %%\n", 
                   (double)sdk_system_get_time()*1e-3,  
                   values.temperature, values.humidity);

        // passive waiting until 5 seconds are over
        vTaskDelayUntil(&last_wakeup, 5000 / portTICK_PERIOD_MS);
    }
```
In contrast to the *periodic mode*, the function **_sht3x_start_measurement_** is called inside the task loop to start the measurement in each cycle. The task is then also delayed every time.

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

void user_task (void *pvParameters)
{
    sht3x_values_t values;

    // start periodic measurement mode
    sht3x_start_measurement (sensor, periodic_1mps);

    // busy waiting until measurement results are available
    while (sht3x_is_measuring (sensor) > 0) ;

    TickType_t last_wakeup = xTaskGetTickCount();
    
    while (1) 
    {
        // retrieve the values and do something with them
        if (sht3x_get_results (sensor, &values))
            printf("%.3f SHT3x Sensor: %.2f °C, %.2f %%\n", 
                   (double)sdk_system_get_time()*1e-3,  
                   values.temperature, values.humidity);

        // passive waiting until 2 seconds are over
        vTaskDelayUntil(&last_wakeup, 2000 / portTICK_PERIOD_MS);
    }
}

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
    sensor = sht3x_init_sensor (I2C_BUS, SHT3x_ADDR_2);
    
    // Create a user task that uses the sensor
    xTaskCreate(user_task, "user_task", 256, NULL, 2, 0);
        
    // That's it.
}
```

## Further Examples

See also the examples in the examples directory [examples directory](../../examples/sht3x/README.md).

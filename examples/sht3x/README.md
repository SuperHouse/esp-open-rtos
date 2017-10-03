# SHT3x Driver Examples

These examples references two addtional drivers [i2c](https://github.com/kanflo/esp-open-rtos-driver-i2c) and [sht3x](https://github.com/gschorcht/esp-open-rtos/extras/sht3x), which are provided in the `../../extras` folder.

If you plan to use one or both of this drivers in your own projects, please check the main development pages for updated versions or reported issues.

## Hardware setup

There are examples for only one sensor and examples for two sensors. 

To run examples with **one sensor**, just use GPIO5 (SCL) and GPIO4 (SDA) to connect to the SHT3x sensor's I2C interface. 

```
 +------------------------+     +--------+
 | ESP8266  Bus 0         |     | SHT3x  |
 |          GPIO 5 (SCL)  >---- > SCL    |
 |          GPIO 4 (SDA)  ------- SDA    |
 |                        |     +--------+
 +------------------------+
```

If you want to run examples with **two sensors**, you could do this with only one bus and different I2C addresses or with two buses and the same or different I2C addresses. In later case, use GPIO14 (SCL) and GPIO12 (SDA) for the second bus to connect to the second SHT3x sensor's I2C interface.

```
 +------------------------+     +----------+
 | ESP8266  Bus 0         |     | SHT3x_1  |
 |          GPIO 5 (SCL)  >-----> SCL      |
 |          GPIO 4 (SDA)  ------- SDA      |
 |                        |     +----------+
 |          Bus 1         |     | SHT3x_2  |
 |          GPIO 14 (SCL) >-----> SCL      |
 |          GPIO 12 (SDA) ------- SDA      |
 +------------------------+     +----------+
```

## Example description

Examples show how to use the driver in single shot as well as in periodic mode.


### _sht3x_one_sensor_
  
The simple example show how to use the driver with one SHT3x sensor. It demonstrates two different user task implementations, one in *single shot mode* and one in *periodic mode*. In addition, it shows both approaches for the implementation of waiting for measurement results, one as busy waiting and one as passive waiting using *vTaskDelay*.

### _sht3x_two_sensors_

This simple example shows how to use the driver for two sensors. As with the example _sht3x_one_sensor_, it uses two different user task implementations and waiting approaches, in this example one for each of the tasks.


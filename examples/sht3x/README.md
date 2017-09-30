# SHT3x Driver Examples

These examples references two addtional drivers [i2c](https://github.com/kanflo/esp-open-rtos-driver-i2c) and [sht3x](https://github.com/gschorcht/esp-open-rtos/extras/sht3x), which are provided in the `../../extras` folder.

If you plan to use one or both of this drivers in your own projects, please check the main development pages for updated versions or reported issues.

## Hardware setup

There are examples for only one sensor and examples for two sensors. 

To run examples with **one sensor**, just use GPIO5 (SCL) and GPIO4 (SDA) to connect to the SHT3x sensor's I2C interface. 

```
 +------------------------+     +--------+
 | ESP8266  Bus 0         |     | BME680 |
 |          GPIO 5 (SCL)  +---->+ SCL    |
 |          GPIO 4 (SDA)  +-----+ SDA    |
 |                        |     +--------+
 +------------------------+
```

If you want to run examples with **two sensors**, you could do this with only one bus and different I2C addresses or with two buses and the same or different I2C addresses. In later case, use GPIO16 (SCL) and GPIO14 (SDA) for the second bus to connect to the second SHT3x sensor's I2C interface.

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

## Example description

### _shtx_callback_one_sensor_

This example shows how to use a **callback function** to get the results of periodic measurements of only **one sensor** with a period of 1000 ms. It includes some simple error handling.

### _shtx_callback_two_sensors_

This example shows how to use a **callback function** to get the results of periodic measurements of **two sensors** with **different measurement periods** of 1000 ms and 5000 ms, respectively. The sensors are connected to **two different buses**. There is no error handling in this example.

### _shtx_task_one_sensor_
  
This example shows how to use a **task** in conjunction with function **_sht3x_get_values_** to get the results of periodic measurements of only **one sensor** with a period of 1000 ms. The task uses function **_vTaskDelay_** to realize a periodic exudation of function **_sht3x_get_values_** with same rate as periodic measurements. There is no error handling in this example.

### _shtx_timer_one_sensor_

This example shows how to use a **software timer** and **timer callback function** in conjunction with function **_sht3x_get_values_** to get the results of periodic measurements of only **one sensor** with a period of 1000 ms. The timer callback function executes function **_sht3x_get_values_** to get the results of periodic measurements. The timer is started with same period as periodic measurements. Thus, the timer callback function is executed at same rate as periodic measurements. There is no error handling in this example.

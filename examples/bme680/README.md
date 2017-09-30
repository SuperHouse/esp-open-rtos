# BME680 Driver Examples

These examples references two addtional drivers [i2c](https://github.com/kanflo/esp-open-rtos-driver-i2c) and [bme680](https://github.com/gschorcht/esp-open-rtos/extras/bme680), which are provided in the `../../extras` folder.

If you plan to use one or both of this drivers in your own projects, please check the main development pages for updated versions or reported issues.

## Hardware setup

There are examples using I2C with one or two sensors as well as examples using SPI with one sensor.

To run examples with **one sensor** as I2C slave, just use GPIO5 (SCL) and GPIO4 (SDA) to connect to the BME680 sensor's I2C interface. 

If you want to run examples with **two sensors**, you could do this with only one bus and different I2C addresses or with two buses and the same or different I2C addresses. In later case, use GPIO16 (SCL) and GPIO14 (SDA) for the second I2C bus.

## Example description

__*shtx_callback_i2c*__

In this example, only **one sensor** connected to **I2C** is used. It shows how to use a **callback function** to get the results of the periodic measurements. In addition, it shows how to change some optional sensor and measurement parameters. In this example, there is no error handling.

__*shtx_callback_i2c_two_sensors*__

In this example, **two sensors** are used which are connected to **different I2C buses** but with the same slave addresses. It shows how to use a **callback function** to get the results of the periodic measurements. In addition, it shows how to change some optional sensor and measurement parameters for both sensors differently. In this example, there is no error handling.

__*shtx_callback_spi*__

In this example, only **one sensor** connected to **SPI** is used. It shows how to use a **callback function** to get the results of the periodic measurements. In addition, it shows how to change some optional sensor and measurement parameters. In this example, there is no error handling.

__*shtx_task_one_sensor*__

In this example, only **one sensor** connected to **I2C** is used. It shows how to use a **task** in conjunction with function __*bme680_get_values*__ to get the results of the periodic measurements. The task uses the *vTaskDelay* function to perform a periodic execution of the *bme680_get_values* function at the same rate as that of the periodic measurements. In this example, there is no error handling.

__*shtx_timer_one_sensor*__

In this example, only **one sensor** connected to **I2C** is used. It shows how to use a **software timer** and a **timer callback function** in conjunction with function __*bme680_get_values*__ to get the results of periodic measurements. The timer callback function executes function *bme680_get_values* to get the results. The timer is started with same period as periodic measurements. Thus, the timer callback function is executed at same rate as periodic measurements. There is no error handling in this example.

# BME680 Driver Examples

These examples references two addtional drivers **i2c** and **bme680**, which are provided in the `../../extras` folder.

If you plan to use one or both of this drivers in your own projects, please check the main development pages for updated versions or reported issues.

## Hardware setup

There are examples that are using either I2C or SPI with one or two sensors.

For examples using BME680 sensor as I2C slave, just use GPIO5 (SCL) and GPIO4 (SDA) to connect to the BME680 sensor's I2C interface. 

```
 +-------------------------+     +--------+
 | ESP8266  Bus 0          |     | BME680 |
 |          GPIO 5 (SCL)   +---->+ SCL    |
 |          GPIO 4 (SDA)   +-----+ SDA    |
 |                         |     +--------+
 +-------------------------+
```

For examples that are using SPI, BME680 sensor has to be connected to SPI bus 1.  Since GPIO15 used as default CS signal of SPI bus 1 does not work correctly together with BME680, you have to connect CS to another GPIO pin, e.g., GPIO2.

 +-------------------------+     +----------+
 | ESP8266  Bus 1          |     | BME680   |
 |          GPIO 12 (MISO) <-----< SDO      |
 |          GPIO 13 (MOSI) >-----> SDI      |
 |          GPIO 14 (SCK)  >-----> SCK      |
 |          GPIO 2  (CS)   >-----> CS       |
 +-------------------------+     +----------+

The example with two sensors use the combination of I2C and SPI.

## Example description

__*bme680_one_sensor*__

In this simple example, only **one sensor** connected either to **I2C** or to **SPI** is used. Constant **SPI_USED** defines which interface is used.

__*bme680_two_sensors*__

Simple example with two sensors, one sensor connected to **I2C** bus 0 and one sensor connected to **SPI**. It defines two different user tasks that use the sensors as well as different approaches for the implementation of waiting for measurement results, one as busy waiting using **_bme680_is_measuring_** and one as passive waiting using *vTaskDelay*.

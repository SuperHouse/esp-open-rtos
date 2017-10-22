# SHT3x Driver Examples

These examples demonstrate the usage of the SHT3x driver with only one and multiple SHT3x sensors.

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

It shows different user task implementations in *single shot mode* and *periodic mode*. In *single shot* mode either low level or high level functions are used. Constants SINGLE_SHOT_LOW_LEVEL and SINGLE_SHOT_HIGH_LEVEL controls which task implementation is used.

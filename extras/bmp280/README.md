# Driver for BMP280 absolute barometric pressure sensor

The driver works only with BMP280 sensor. For BMP080/BMP180 there's a separate
driver. Even though BMP280 is a successor of BMP180 they are not compatible.
They have different registers and different operation modes.
BMP280 supports two ways of communication: spi and i2c.
This driver provides only i2c communication.
The driver is written for [esp-open-rtos](https://github.com/SuperHouse/esp-open-rtos)
framework and requires [i2c driver](https://github.com/SuperHouse/esp-open-rtos/tree/master/extras/i2c)
from it.

## Features

 * I2C communication.
 * Forced mode (Similar to BMP180 operation).
 * Normal mode. Continuous measurement.
 * Soft reset.

## Usage

Connect BMP280 module to you ESP8266 module and specify SCL and SDA pins:

```
const uint8_t scl_pin = 5;
const uint8_t sda_pin = 4;
```

Pull up SDO pin of BMP280 in order to have address 0x77.
Or pull down SDO pin and change `#define BMP280_ADDRESS 0x77` to
`#define BMP280_ADDRESS 0x76`. Otherwise your sensor will not work.
By default address 0x77 is used, so SDO pin should be high.

BMP280 supports two operation modes.

### Forced mode

In forced mode, a single measurement is performed according to selected
configuration. When the measurement is finished, the sensor returns to
sleep mode and the measurement results can be read.

### Normal mode

Normal mode continuously cycles between measurement period and standby period,
whose time is defined by standby_time.

## Example

### Forced mode

```
const uint8_t scl_pin = 5;
const uint8_t sda_pin = 4;
bmp280_params_t  params;
float pressure, temperature;

bmp280_init_default_params(&params);
params.mode = BMP280_MODE_FORCED;
bmp280_init(&params, scl_pin, sda_pin);

while (1) {
    bmp280_force_measurement();
    while (bmp280_is_measuring()) {}; // wait for measurement to complete

    bmp280_read(&temperature, &pressure);
    printf("Pressure: %.2f Pa, Temperature: %.2f C\n", pressure, temperature);
    vTaskDelay(1000 / portTICK_RATE_MS);
}
```

### Normal mode

```
bmp280_params_t  params;
float pressure, temperature;

bmp280_init_default_params(&params);
bmp280_init(&params, scl_pin, sda_pin);

while (1) {
    bmp280_read(&temperature, &pressure);
    printf("Pressure: %.2f Pa, Temperature: %.2f C\n", pressure, temperature);
    vTaskDelay(1000 / portTICK_RATE_MS);
}
```

## License

The driver is released under MIT license.

Copyright (c) 2016 sheinz (https://github.com/sheinz)

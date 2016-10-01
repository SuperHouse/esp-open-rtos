# Driver for I2C SSD1306 128x64 OLED LCD

This driver is written for usage with the ESP8266 and FreeRTOS ([esp-open-rtos](https://github.com/SuperHouse/esp-open-rtos)).

### Usage

Before using the SSD1306 LCD module, the function `i2c_init(SCL_PIN, SDA_PIN)` needs to be called to setup the I2C interface and then you must call ssd1306_init().

#### Example 

```
#define SCL_PIN GPIO_ID_PIN(0)
#define SDA_PIN GPIO_ID_PIN(2)
...

i2c_init(SCL_PIN, SDA_PIN);

if (ssd1306_init()) {
// An error occured, while performing SSD1306 init init (E.g device not found etc.)
}

// rest of the code
```





# Driver for SSD1306 OLED LCD

This driver is written for usage with the ESP8266 and FreeRTOS ([esp-open-rtos](https://github.com/SuperHouse/esp-open-rtos)).

## Supported display sizes

 - 128x64
 - 128x32
 - 128x16
 - 96x16

## Supported connection interfaces

Currently supported two of them: I2C and SPI4.

## Usage

If Reset pin is accesible in your display module, connect it to the RESET pin of ESP8266.
If you don't do this, display RAM may be glitchy after the power lost/restore.

### I2C protocol

Before using the SSD1306 LCD module the function `i2c_init(SCL_PIN, SDA_PIN)` needs to be
called to setup the I2C interface and then you must call `ssd1306_init()`.

#### Example 

```C
#define SCL_PIN 5
#define SDA_PIN 4
...

static const ssd1306_t device = {
	.protocol = SSD1306_PROTO_I2C,
	.width = 128,
	.height = 64
};

...

i2c_init(SCL_PIN, SDA_PIN);

if (ssd1306_init(&device)) {
// An error occured, while performing SSD1306 init (E.g device not found etc.)
}

// rest of the code
```

### SPI4 protocol

This protocol MUCH faster than I2C but uses 2 additional GPIO pins (beside of HSPI CLK
and HSPI MOSI): Data/Command pin and Chip Select pin.

No additional function calls are required before `ssd1306_init()`.

#### Example 

```C
#define CS_PIN 5
#define DC_PIN 4

...

static const ssd1306_t device = {
	.protocol = SSD1306_PROTO_SPI4,
	.cs_pin = CS_PIN,
	.dc_pin = DC_PIN,
	.width = 128,
	.height = 64
};

...

if (ssd1306_init(&device)) {
// An error occured, while performing SSD1306 init
}

// rest of the code
```

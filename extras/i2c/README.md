# Yet another I2C driver for the ESP8266

This time a driver for the excellent esp-open-rtos. This is a bit banging I2C driver based on the Wikipedia pesudo C code [1].

### Adding to your project

Add the driver to your project as a submodule rather than cloning it:

````
% git submodule add https://github.com/kanflo/esp-open-rtos-driver-i2c.git i2c
````
The esp-open-rtos makefile-fu will make sure the driver is built.

### Usage


````
#include <i2c.h>

#define SCL_PIN (0)
#define SDA_PIN (2)

uint8_t slave_addr = 0x20;
uint8_t reg_addr = 0x1f;
uint8_t reg_data;
uint8_t data[] = {reg_addr, 0xc8};

i2c_init(SCL_PIN, SDA_PIN);

// Write data to slave
bool success = i2c_slave_write(slave_addr, data, sizeof(data));

// Issue write to slave, sending reg_addr, followed by reading 1 byte
success = i2c_slave_read(slave_addr, &reg_addr, reg_data, 1);

````

The driver is released under the MIT license.

[1] https://en.wikipedia.org/wiki/I²C#Example_of_bit-banging_the_I.C2.B2C_Master_protocol
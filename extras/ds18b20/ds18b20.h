#ifndef DRIVER_DS18B20_H_
#define DRIVER_DS18B20_H_

typedef struct DSENSOR {
	uint8_t id;
    uint8_t major;
    uint8_t minor;
} DSENSOR;

// Scan all ds18b20 sensors on bus and return its amount.
// Result are saved in array of DSENSOR structure.
// Cause printf in esp sdk don`t support float,
// I split result as two number (major, minor).
uint8_t readDS18B20(uint8_t pin, DSENSOR *result);

// This method is just to demonstrate how to read 
// temperature from single dallas chip.
float read_single_DS18B20(uint8_t pin);

#endif

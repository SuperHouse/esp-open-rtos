#ifndef DRIVER_DS18B20_H_
#define DRIVER_DS18B20_H_

typedef struct {
    uint8_t id;
    float value;
} ds_sensor_t;

// Scan all ds18b20 sensors on bus and return its amount.
// Result are saved in array of ds_sensor_t structure.
uint8_t ds18b20_read_all(uint8_t pin, ds_sensor_t *result);

// This method is just to demonstrate how to read 
// temperature from single dallas chip.
float ds18b20_read_single(uint8_t pin);

#endif

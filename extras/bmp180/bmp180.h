/*
 * bmp180.h
 *
 *  Created on: 23.08.2015
 *      Author: fbargste
 */

#ifndef DRIVER_BMP180_H_
#define DRIVER_BMP180_H_

#include "stdint.h"
#include "stdbool.h"

#include "FreeRTOS.h"
#include "queue.h"

// Uncomment to enable debug output
//#define BMP180_DEBUG

#define BMP180_TEMPERATURE (1<<0)
#define BMP180_PRESSURE    (1<<1)

//
// Create bmp180_types
//

// temperature in °C
typedef float bmp180_temp_t;
// pressure in mPa (To get hPa divide by 100)
typedef uint32_t bmp180_press_t;

// BMP180_Event_Result
typedef struct
{
    uint8_t cmd;
    bmp180_temp_t  temperature;
    bmp180_press_t pressure;
} bmp180_result_t;

// Init bmp180 driver ...
bool bmp180_init(uint8_t scl, uint8_t sda);

// Trigger a "complete" measurement (temperature and pressure will be valid when given to "bmp180_informUser)
void bmp180_trigger_measurement(const xQueueHandle* resultQueue);

// Trigger a "temperature only" measurement (only temperature will be valid when given to "bmp180_informUser)
void bmp180_trigger_temperature_measurement(const xQueueHandle* resultQueue);

// Trigger a "pressure only" measurement (only pressure will be valid when given to "bmp180_informUser)
void bmp180_trigger_pressure_measurement(const xQueueHandle* resultQueue);

// Give the user the chance to create it's own handler
extern bool (*bmp180_informUser)(const xQueueHandle* resultQueue, uint8_t cmd, bmp180_temp_t temperature, bmp180_press_t pressure);

#endif /* DRIVER_BMP180_H_ */

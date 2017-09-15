/*
 * Driver for Sensirion SHT3x digital temperature and humity sensor
 * connected to I2C
 *
 * Part of esp-open-rtos
 * Copyright (C) 2017 Gunar Schorcht (https://github.com/gschorcht)
 * BSD Licensed as described in the file LICENSE
 */

#ifndef DRIVER_SHT3x_H_
#define DRIVER_SHT3x_H_

#include "stdint.h"
#include "stdbool.h"

#include "FreeRTOS.h"
#include "queue.h"

#include "i2c/i2c.h"

// Uncomment to enable debug output
// #define SHT3x_DEBUG

// Change this if you need more than 3 SHT3x sensors
#define SHT3x_MAX_SENSORS 3

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    float   temperature_c;    // temperature in degree Fahrenheit
    float   temperature_f;    // temperature in degree Celcius
    float   humidity;         // humidity in percent
} sht3x_value_set_t;

typedef void (*sht3x_cb_function_t)(uint32_t sensor,
                                    sht3x_value_set_t actual, 
                                    sht3x_value_set_t average);

// SHT3x sensor data structure
typedef struct {

    bool     active;
    bool     first_measurement;
    
    uint8_t  bus;
    uint8_t  addr;

    uint32_t period;

    sht3x_value_set_t  actual;
    sht3x_value_set_t  average;
    
    float   average_weight;

    sht3x_cb_function_t cb_function;
    TaskHandle_t        cb_task;
    
} sht3x_sensor_t;


/**
 * Initialize the SHT3x driver. This function must be called only once at the
 * beginning.
 *
 * @return  true on success, false on error
 */
bool sht3x_init ();


/**
 * Initialize the SHT3x sensor connected to a certain bus with slave
 * address, check its availability and start a background task for
 * measurements.
 * 
 * The background task carries out measurements periodically using SHT3x's
 * single shot data acquisition mode with a default period of 1000 ms.
 * This period be changed using function @set_measurment_period.
 * 
 * At each measurement, actual sensor values are determined and exponential
 * moving average values are computed. The weight (smoothing factor) for this
 * average computation is 0.2 by default. It can be changed using function
 * @sht3x_set_average_weight.
 *
 * If a callback method is registered using function 
 * @sht3x_set_callback_function, it is called after each measurement to pass
 * measurement results to user tasks. Otherwise, user tasks have to use
 * function @sht3x_get_values explicitly to get the results.
 *
 * @param   bus     I2C bus at which SHT3x sensor is connected
 * @param   addr    I2C addr of the SHT3x sensor
 *
 * @return  id of the sensor (0 or greater on success or -1 on error)
 */
uint32_t sht3x_create_sensor (uint8_t bus, uint8_t addr);


/**
 * Set the period of the background measurement task for a certain sensor.
 *
 * Please note the minimum period is 20 ms since the measurement takes
 * about 20 ms.
 *
 * @param   sensor  id of the sensor
 * @param   period  Measurement period in ms (default 1000 ms)
 *
 * @return  true on success, false on error
 */
bool sht3x_set_measurement_period (uint32_t sensor, uint32_t period);


/**
 * Set the callback function for the background measurement task for a certain
 * sensor. 
 *
 * If a callback method is registered, it is called after each measurement to
 * pass measurement results to user tasks. Thus, callback function is executed
 * at the same rate as measurements.
 *
 * @param   sensor      id of the sensor
 * @param   function    user function called after each measurement
 *                      (NULL to delete it for the sensor)
 *
 * @return  true on success, false on error
 */ 
bool sht3x_set_callback_function (uint32_t sensor, 
                                  sht3x_cb_function_t user_function);


/**
 * Deletes the SHT3x sensor given by its id.
 *
 * @param   sensor   id of the sensor
 *
 * @return  true on success, false on error
 */
bool sht3x_delete_sensor (uint32_t sensor);


/**
 * Returns actual and average sensor values of last measurement. Parameters
 * @actual and @average are pointer to data structures of type
 * @sht3x_value_set_t which are filled with measurement results. Use NULL for
 * that pointers parameters, if you are not interested on certain results. 
 *
 * This function is only needed, if there is no callback function registered
 * for the sensor.
 *
 * @param   sensor  id of the sensor
 * @param   actual  pointer to a data structure for actual sensor values
 * @param   average pointer to a data structure for average sensor values
 *
 * @return  true on success, false on error
 */
bool sht3x_get_values (uint32_t sensor, 
                       sht3x_value_set_t *actual, 
                       sht3x_value_set_t *average);

/**
 * At each measurement carried out by the background task, actual
 * sensor values are determined and exponential moving average values are
 * computed according to following equation
 *
 *    Average[k] = W * Value + (1-W) * Average [k-1]
 *
 * where coefficient W represents the degree of weighting decrease, a
 * constant smoothing factor between 0 and 1. A higher W discounts older
 * observations faster.
 * 
 * @param   sensor  id of the sensor
 * @param   weight  coefficient W (default is 0.2)
 *
 * @return  true on success, false on error
 */
bool sht3x_set_average_weight (uint32_t sensor, float weight);

#ifdef __cplusplus
}
#endif

#endif /* DRIVER_SHT3x_H_ */

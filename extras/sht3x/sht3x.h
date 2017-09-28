/*
 * The BSD License (3-clause license)
 *
 * Copyright (c) 2017 Gunar Schorcht (https://github.com/gschorcht
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its 
 * contributors may be used to endorse or promote products derived from this
 * software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

/*
 * Driver for Sensirion SHT3x digital temperature and humity sensor
 * connected to I2C
 *
 * Part of esp-open-rtos
 */
 
#ifndef DRIVER_SHT3x_H_
#define DRIVER_SHT3x_H_

#include "stdint.h"
#include "stdbool.h"

#include "FreeRTOS.h"

#include "i2c/i2c.h"

// Uncomment to enable debug output
// #define SHT3x_DEBUG

// Change this if you need more than 3 SHT3x sensors
#define SHT3x_MAX_SENSORS 3

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief	actual or average value set type
 */
typedef struct {
    float   temperature_c;    // temperature in degree Celcius
    float   temperature_f;    // temperature in degree Fahrenheit
    float   humidity;         // humidity in percent
} sht3x_value_set_t;

/**
 * @brief	callback unction type to pass result of measurement to user tasks
 */
typedef void (*sht3x_cb_function_t)(uint32_t sensor,
                                    sht3x_value_set_t actual, 
                                    sht3x_value_set_t average);

/**
 * @brief 	SHT3x sensor device data structure type
 */
typedef struct {

    bool     active;
    
    uint8_t  bus;
    uint8_t  addr;

    uint32_t period;

    sht3x_value_set_t  actual;
    sht3x_value_set_t  average;
    
    bool	average_computation;
    bool    average_first_measurement;
    float   average_weight;

    sht3x_cb_function_t cb_function;
    TaskHandle_t        bg_task;
    
} sht3x_sensor_t;


/**
 * @brief	Initialize the SHT3x driver
 *
 * This function initializes all internal data structures. It must be called
 * exactly once at the beginning.
 *
 * @return  true on success, false on error
 */
bool sht3x_init ();


/**
 * @brief	Initialize a SHT3x sensor
 * 
 * This function initializes the SHT3x sensor connected to a certain 
 * bus with given slave address and checks its availability.
 *
 * Furthermore, it starts a background task for measurements with 
 * the sensor. The background task carries out the measurements periodically
 * using SHT3x's single shot data acquisition mode with a default period 
 * of 1000 ms. This period be changed using function *set_measurment_period*.
 * 
 * During each measurement the background task 
 *
 *	1. determines *actual sensor values*
 *  2. computes optionally *average sensor values*
 *	3. calls back optionally a registered function of user task.
 *
 * The average value computation uses an exponential moving average 
 * and can be activated (default) or deactivated with function 
 * *sht3x_enable_average_computation*. If the average value computation is
 * deactivated, *average sensor values* correspond to *actual sensor values*.
 * The weight (smoothing factor) used in the average value computatoin is 0.2 
 * by default and can be changed with function *sht3x_set_average_weight*.
 *
 * If a callback method has been registered with function 
 * *sht3x_set_callback_function*, it is called after each measurement
 * to pass measurement results to user tasks. Otherwise, user tasks have to
 * use function *sht3x_get_values* explicitly to get the results.
 *
 * @param   bus     I2C bus at which SHT3x sensor is connected
 * @param   addr    I2C addr of the SHT3x sensor
 *
 * @return  ID of the sensor (0 or greater on success or -1 on error)
 */
uint32_t sht3x_create_sensor (uint8_t bus, uint8_t addr);


/**
 * @brief 	Set the period of the background measurement task for the given
 *			sensor
 *
 * Please note: The minimum period is 20 ms since each measurement takes
 * about 20 ms.
 *
 * @param   sensor  ID of the sensor
 * @param   period  Measurement period in ms (default 1000 ms)
 *
 * @return  true on success, false on error
 */
bool sht3x_set_measurement_period (uint32_t sensor, uint32_t period);


/**
 * @brief 	Set the callback function for the background measurement task for
 *			the given sensor
 *
 * If a callback method is registered, it is called after each measurement to
 * pass measurement results to user tasks. Thus, callback function is executed
 * at the same rate as the measurements.
 *
 * @param   sensor      ID of the sensor
 * @param   function    user function called after each measurement
 *                      (NULL to delete it for the sensor)
 *
 * @return  true on success, false on error
 */ 
bool sht3x_set_callback_function (uint32_t sensor, 
                                  sht3x_cb_function_t user_function);


/**
 * @brief	Deletes the SHT3x sensor given by its ID
 *
 * @param   sensor   ID of the sensor
 *
 * @return  true on success, false on error
 */
bool sht3x_delete_sensor (uint32_t sensor);


/**
 * @brief	Get actual and average sensor values
 *
 * This function returns the actual and average sensor values of the last
 * measurement. The parameters *actual* and *average* are pointers to data
 * structures of the type *sht3x_value_set_t*, which are filled with the
 * of last measurement. Use NULL for the appropriate parameter if you are
 * not interested in specific results.
 *
 * If average value computation is deactivated, average sensor values 
 * correspond to the actual sensor values.
 *
 * Please note: Calling this function is only necessary if no callback
 * function has been registered for the sensor.
 *
 * @param   sensor  ID of the sensor
 * @param   actual  Pointer to a data structure for actual sensor values
 * @param   average Pointer to a data structure for average sensor values
 *
 * @return  true on success, false on error
 */
bool sht3x_get_values (uint32_t sensor, 
                       sht3x_value_set_t *actual, 
                       sht3x_value_set_t *average);


/**
 * @brief	Enable (default) or disable average value computation
 * 
 * In case, the average value computation is disabled, average sensor values
 * correspond to the actual sensor values.
 *
 * @param   sensor  id of the sensor
 * @param	enabled	true to enable or false to disable average computation
 *
 * @return  true on success, false on error
*/
bool sht3x_enable_average_computation (uint32_t sensor, bool enabled);


/**
 * @brief	Set weight (smoothing factor) for average value computation
 * 
 * At each measurement carried out by the background task, actual sensor
 * values are determined. If average value computation is enabled (default),
 * exponential moving average values are computed according to following 
 * equation
 *
 *    Average[k] = W * Value + (1-W) * Average [k-1]
 *
 * where coefficient W represents the degree of weighting decrease, a constant
 * smoothing factor between 0 and 1. A higher W discounts older observations
 * faster. W is 0.2 by default.
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

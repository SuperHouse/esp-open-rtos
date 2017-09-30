/*
 * Driver for Bosch Sensortec BME680 digital temperature, humity, pressure and
 * gas sensor connected to I2C or SPI
 *
 * Part of esp-open-rtos [https://github.com/SuperHouse/esp-open-rtos]
 *
 * PLEASE NOTE: 
 * Due to the complexity of the sensor output value compputation based on many
 * calibration parameters, the original Bosch Sensortec BME680 driver that is
 * released as open source [https://github.com/BoschSensortec/BME680_driver]
 * and integrated for internal use. Please note the license of this part, which
 * is an extended BSD license and can be found in each of that source files.
 *
 * ---------------------------------------------------------------------------
 *
 * The BSD License (3-clause license)
 *
 * Copyright (c) 2017 Gunar Schorcht (https://github.com/gschorcht]
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

#ifndef BME680_DRV_H_
#define BME680_DRV_H_

#include "stdint.h"
#include "stdbool.h"

#include "FreeRTOS.h"
#include <task.h>

#include "i2c/i2c.h"
#include "esp/spi.h"

#include "bme680/bme680.h"

// Uncomment to enable debug output
// #define BME680_DEBUG

// Change this if you need more than 3 BME680 sensors
#define BME680_MAX_SENSORS 3

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * @brief	Type for actual and average sensor values (called TPHG values)
 */
typedef struct {
    float   temperature;    // temperature in degree Celcius
    float   pressure;       // barometric pressure in hPascal
    float   humidity;       // humidity in percent
    float   gas;            // gas resistance in Ohm
} bme680_value_set_t;

/**
 * @brief	callback unction type to pass result of measurement to user tasks
 */
typedef void (*bme680_cb_function_t)(uint32_t sensor,
                                    bme680_value_set_t actual, 
                                    bme680_value_set_t average);

/**
 * @brief 	BME680 sensor device data structure type
 */
typedef struct {

    bool     active;
    
    uint8_t  bus;               // I2C = 0, SPI = 1
    uint8_t  addr;              // I2C = slave address, SPI = 0
    uint8_t  spi_cs_pin;        // GPIO used as SPI CS

    uint32_t period;

    bme680_value_set_t  actual;
    bme680_value_set_t  average;
    
    bool	average_computation;
    bool    average_first_measurement;
    float   average_weight;

    bme680_cb_function_t cb_function;
    TaskHandle_t         bg_task;
    
    struct bme680_dev dev;  // internal Bosch BME680 driver data structure
    
} bme680_sensor_t;


/**
 * @brief 	BME680 oversampling rate values
 */
typedef enum {
    none   = 0,     // measurement is skipped, output values are invalid
    os_1x  = 1,     // default oversampling rates
    os_2x  = 2,
    os_4x  = 3,
    os_8x  = 4,
    os_16x = 5
} bme680_oversampling_t;


/**
 * @brief 	BME680 IIR filter sizes
 */
typedef enum {
    iir_size_0   = 0,   // filter is not used
    iir_size_1   = 1,
    iir_size_3   = 2,
    iir_size_7   = 3,
    iir_size_15  = 4,
    iir_size_31  = 5,
    iir_size_63  = 6,
    iir_size_127 = 7
} bme680_filter_size_t;

/**
 * @brief	Initialize the BME680 driver
 *
 * This function initializes all internal data structures. It must be called
 * exactly once at the beginning.
 *
 * @return  true on success, false on error
 */
bool bme680_init_driver ();


/**
 * @brief	Create and initialize a BME680 sensor
 * 
 * This function initializes the BME680 sensor and checks its availability.
 *
 * Furthermore, the starts a background task for measurements with 
 * the sensor. The background task carries out the measurements periodically
 * using BME680's single shot data acquisition mode with a default period 
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
 * *bme680_enable_average_computation*. If the average value computation is
 * deactivated, *average sensor values* correspond to *actual sensor values*.
 * The weight (smoothing factor) used in the average value computatoin is 0.2 
 * by default and can be changed with function *bme680_set_average_weight*.
 *
 * If a callback method has been registered with function 
 * *bme680_set_callback_function*, it is called after each measurement
 * to pass measurement results to user tasks. Otherwise, user tasks have to
 * use function *bme680_get_values* explicitly to get the results.
 *
 * The sensor can either be connected to an I2C or SPI bus. If *addr* is
 * greater than 0, it defines a valid I2C slave address and the sensor is
 * connected to an I2C bus using this address. If *addr* is 0, the sensor
 * is connected to a SPI bus. In both cases, the *bus* parameter specifies
 * the ID of the corresponding bus. In case of SPI, parameter *cs* defines
 * the GPIO used as CS signal.
 *
 * @param   bus     I2C or SPI bus at which BME680 sensor is connected
 * @param   addr    I2C addr of the BME680 sensor or 0 for SPI
 * @param   cs      SPI CS GPIO, ignored for I2C
 *
 * @return  ID of the sensor (0 or greater on success or -1 on error)
 */
uint32_t bme680_create_sensor (uint8_t bus, uint8_t addr, uint8_t cs_pin);


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
bool bme680_set_measurement_period (uint32_t sensor, uint32_t period);


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
bool bme680_set_callback_function (uint32_t sensor, 
                                  bme680_cb_function_t user_function);


/**
 * @brief	Deletes the BME680 sensor given by its ID
 *
 * @param   sensor   ID of the sensor
 *
 * @return  true on success, false on error
 */
bool bme680_delete_sensor (uint32_t sensor);


/**
 * @brief	Get the actual and average sensor values
 *
 * This function returns the actual and average sensor values of the last
 * measurement. The parameters *actual* and *average* are pointers to data
 * structures of the type *bme680_value_set_t*, which are filled with the
 * of last measurement. Use NULL for the appropriate parameter if you are
 * not interested in specific results.
 *
 * If average value computation is deactivated, average sensor values 
 * correspond to the actual sensor values.
 *
 * Please note: Calling this function is only necessary if no callback
 * function has been registered for the sensor.
 *
 * @param   sensor    ID of the sensor
 * @param   actual    Pointer to a data structure for actual sensor values
 * @param   average   Pointer to a data structure for average sensor values
 *
 * @return  true on success, false on error
 */
bool bme680_get_values (uint32_t sensor, 
                       bme680_value_set_t *actual, 
                       bme680_value_set_t *average);


/**
 * @brief	Enable (default) or disable the average value computation
 * 
 * In case, the average value computation is disabled, average sensor values
 * correspond to the actual sensor values.
 *
 * Please note: All average sensor values are reset if parameters for
 * measurement are changed using either function *bme680_set_average_weight*,
 * *bme680_set_oversampling_rates*, *bme680_set_heater_profile* or
 * *bme680_set_filter_size*.
 *
 * @param   sensor    id of the sensor
 * @param	enabled	  true to enable or false to disable average computation
 *
 * @return  true on success, false on error
*/
bool bme680_enable_average_computation (uint32_t sensor, bool enabled);


/**
 * @brief	Set the weight (smoothing factor) for average value computation
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
bool bme680_set_average_weight (uint32_t sensor, float weight);


/**
 * @brief   Set the oversampling rates for measurements
 * 
 * The BME680 sensor allows to define different oversampling rates for the
 * measurements of temperature, pressure and humidity, separatly. Possible
 * oversampling rates defined by enumaration type are none, 1x (default), 
 * 2x, 4x, 8x, and 16x. In case of *none*, the corressponing measurement is
 * skipped and output values are invalid.
 *
 * Please note: To disable the measurement of either temperature, pressure
 * or humidity, set the corresponding oversamling rate to *none*.
 *
 * @param   sensor  id of the sensor
 * @param   ost     oversampling rate for temperature measurements
 * @param   osp     oversampling rate for pressure measurements
 * @param   osh     oversampling rate for humidity measurements
 *
 * @return  true on success, false on error
 */
bool bme680_set_oversampling_rates (uint32_t sensor, 
                                    bme680_oversampling_t ost,
                                    bme680_oversampling_t osp,
                                    bme680_oversampling_t osh);
                                    
/**
 * @brief   Set the heater profile for gas measurements
 *
 * For gas measurement the sensor integrates a heater. The paremeters for
 * this heater are defined by a heater profile. Such a heater profile
 * consists of a temperature setting point (the target temperature) and the
 * heating duration. 
 *
 * Even though the sensor supports up to 10 different profiles, only one 
 * profile is used by this driver for simplicity. The temperature setting
 * point and the heating duration of this profile can be defined by this
 * function. Default values are 320 degree Celcius as target temperature and
 * 150 ms heating duration. If heating duration is 0 ms, the gas measurement
 * is skipped and output values are invalid.
 *
 * Please note: To disable the measurement of gas, set the heating duration
 * to 0 ms.
 *
 * Please note: According to the datasheet, target temperatures of between
 * 200 and 400 degrees Celsius are typical and about 20 to 30 ms are necessary
 * for the heater to reach the desired target temperature.
 *
 * @param   sensor        id of the sensor
 * @param   temperature   heating temperature in degree Celcius
 * @param   duration      heating duration in milliseconds
 *
 * @return  true on success, false on error
 */
bool bme680_set_heater_profile (uint32_t sensor, 
                                uint16_t temperature, 
                                uint16_t duration);


/**
 * @brief   Set the size of the IIR filter
 *
 * The sensor integrates an internal IIR filter (low pass filter) to
 * reduce short-term changes in sensor output values caused by external
 * disturbances. It effectively reduces the bandwidth of the sensor output 
 * values.
 *
 * The filter can optionally be used for pressure and temperature data that
 * are subject to many short-term changes. Humidity and gas inside the sensor
 * does not fluctuate rapidly and does not require such a low pass filtering.
 * 
 * This function sets the size of the filter. The default filter size is
 * 3 (iir_size_3).
 * 
 * Please note: If the size of the filter is 0, the filter is not used.
 *
 * @param   sensor  id of the sensor
 * @param   size    IIR filter size
 *
 * @return  true on success, false on error
 */
bool bme680_set_filter_size(uint32_t sensor, bme680_filter_size_t size);



#ifdef __cplusplus
}
#endif /* End of CPP guard */

#endif /* BME680_DRV_H_ */


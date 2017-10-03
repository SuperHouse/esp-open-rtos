/*
 * Driver for Sensirion SHT3x digital temperature and humidity sensor
 * connected to I2C
 *
 * Part of esp-open-rtos
 *
 * ----------------------------------------------------------------
 *
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
 
#ifndef DRIVER_SHT3x_H_
#define DRIVER_SHT3x_H_

#include "stdint.h"
#include "stdbool.h"

#include "FreeRTOS.h"

#include "i2c/i2c.h"

// Uncomment to enable debug output
// #define SHT3x_DEBUG

#ifdef __cplusplus
extern "C" {
#endif

// definition of possible I2C slave addresses
#define SHT3x_ADDR_1 0x44        // ADDR pin connected to GND/VSS (default)
#define SHT3x_ADDR_2 0x45        // ADDR pin connected to VDD

// definition of error codes
#define SHT3x_OK                    0

#define SHT3x_I2C_ERROR_MASK        0x000f
#define SHT3x_DRV_ERROR_MASK        0xfff0

// error codes for I2C interface ORed with SHT3x error codes
#define SHT3x_I2C_READ_FAILED       1
#define SHT3x_I2C_SEND_CMD_FAILED   2
#define SHT3x_I2C_BUSY              3

// SHT3x driver error codes OR ed with error codes for I2C interface
#define SHT3x_MEAS_NOT_STARTED      (1 << 8)
#define SHT3x_MEAS_ALREADY_RUNNING  (2 << 8)
#define SHT3x_MEAS_STILL_RUNNING    (3 << 8)
#define SHT3x_READ_RAW_DATA_FAILED  (4 << 8)

#define SHT3x_SEND_MEAS_CMD_FAILED  (5 << 8)
#define SHT3x_SEND_RESET_CMD_FAILED (6 << 8)
#define SHT3x_STATUS_CMD_FAILED     (7 << 8)

#define SHT3x_WRONG_CRC_TEMPERATURE (8 << 8)
#define SHT3x_WRONG_CRC_HUMIDITY    (9 << 8)

#define SHT3x_RAW_DATA_SIZE 6

/**
 * @brief	raw data type
 */
typedef uint8_t sht3x_raw_data_t [SHT3x_RAW_DATA_SIZE];

/**
 * @brief	sensor values type
 */
typedef struct {
    float   temperature;    // temperature in degree Celcius
    float   humidity;       // humidity in percent
} sht3x_values_t;


/**
 * @brief   possible measurement modes
 */
typedef enum {
    single_shot = 0,    // one single measurement
    periodic_05mps,     // periodic with 0.5 measurements per second (mps)
    periodic_1mps,      // periodic with   1 measurements per second (mps)
    periodic_2mps,      // periodic with   2 measurements per second (mps)
    periodic_4mps,      // periodic with   4 measurements per second (mps)
    periodic_10mps      // periodic with  10 measurements per second (mps)
} sht3x_mode_t;
    
    
/**
 * @brief   possible repeatability modes
 */
typedef enum {
    high = 0,
    medium,
    low
} sht3x_repeat_t;

/**
 * @brief 	SHT3x sensor device data structure type
 */
typedef struct {

    bool            active;          // indicates whether sensor is active

    uint32_t        error_code;       // 
    
    uint8_t         bus;             // I2C bus at which sensor is connected
    uint8_t         addr;            // I2C slave address of the sensor
    
    sht3x_mode_t    mode;            // used measurement mode
    sht3x_repeat_t  repeatability;   // used repeatability
 
    bool            meas_started;    // indicates whether measurement started
    uint32_t        meas_start_time; // measurement start time in microseconds
    bool            meas_first;      // first measurement in periodic mode
    
} sht3x_sensor_t;    


/**
 * @brief	Initialize a SHT3x sensor
 * 
 * The function creates a data structure describing the sensor device, 
 * initializes, probes for the device, and configures the device that is 
 * connected at the specified I2C bus with the given slave address.
 *  
 * @param   bus       I2C bus at which sensor is connected
 * @param   addr      I2C slave address of the sensor
 * @return            pointer to sensor data structure, or NULL on error
 */
sht3x_sensor_t* sht3x_init_sensor (uint8_t bus, uint8_t addr);


/**
 * @brief	Start single shot or periodic measurements
 *
 * The function starts the measurement either in *single shot mode* 
 * (exactly one measurement) or *periodic mode* (periodic measurements). 
 *
 * In the *single shot mode*, this function has to be called for each
 * measurement. The measurement duration returned by the function has to be
 * waited every time before the results can be fetched. 
 *
 * In the *periodic mode*, this function has to be called only once. Also the
 * measurement duration must be waited only once until the first results are
 * available. After this first measurement, the sensor then automatically 
 * performs all subsequent measurements. The rate of periodic measurements can
 * be 10, 4, 2, 1 or 0.5 measurements per second (mps). The user task can 
 * fetch the results with the half or less rate. The rate of the periodic 
 * measurements is defined by the parameter *mode*.
 *
 * On success, the function returns an estimated measurement duration. This 
 * defines the duration needed by the sensor before first results become 
 * available. The user task has to wait this time before it can fetch the 
 * results using function *sht3x_get_results* or *sht3x_get_raw_data*.
 *
 * @param   dev       pointer to sensor device data structure
 * @param   mode      measurement mode, see type *sht3x_mode_t*
 * @return            true on success, false on error
 */
int32_t sht3x_start_measurement (sht3x_sensor_t* dev, sht3x_mode_t mode);


/**
 * @brief	Check whether measurement is still running
 *
 * The function can be used to test whether a measurement has been started
 * at all and how long it still takes before measurement results become
 * available. The return value can be
 *
 *   >0  in case the measurement is is still running,
 *    0  in case the measurement has been already finished, or
 *   <0  in case of error.
 *
 * That is, a return value greater than 0 indicates that the measurement
 * results are still not available and the user task has to wait that time.
 * 
 * @param   dev       pointer to sensor device data structure
 * @return            remaining measurement duration or -1 on error
 */
int32_t sht3x_is_measuring (sht3x_sensor_t* dev);

/**
 * @brief	Read the results from sensor as raw data
 *
 * The function read measurement results from the sensor, checks the CRC
 * checksum and stores them in the byte array as following.
 *
 *      data[0] = Temperature MSB
 *      data[1] = Temperature LSB
 *      data[2] = Temperature CRC
 *      data[3] = Pressure MSB
 *      data[4] = Pressure LSB 
 *      data[2] = Pressure CRC
 *
 * In case that there are no new data that can be read, the function returns
 * false.
 * 
 * @param   dev       pointer to sensor device data structure
 * @param   raw_data  byte array in which raw data are stored 
 * @return            true on success, false on error
 */
bool sht3x_get_raw_data(sht3x_sensor_t* dev, sht3x_raw_data_t raw_data);

/**
 * @brief	Computes sensor values from raw data
 *
 * @param   raw_data  byte array that contains raw data  
 * @param   values    pointer to data structure in which results are stored
 * @return            true on success, false on error
 */
bool sht3x_compute_values (sht3x_raw_data_t raw_data, 
                           sht3x_values_t* values);

/**
 * @brief	Get the results of latest measurement
 *
 * The function combines function *sht3x_read_raw_data* and function 
 * *sht3x_compute_values* to get the latest measurement results.
 * 
 * @param   dev       pointer to sensor device data structure
 * @param   values    pointer to data structure in which results are stored
 * @return            true on success, false on error
 */
bool sht3x_get_results (sht3x_sensor_t* dev, sht3x_values_t* values);


#ifdef __cplusplus
}
#endif

#endif /* DRIVER_SHT3x_H_ */

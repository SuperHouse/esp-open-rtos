/**
 * Driver for LIS3DH 3-axes digital accelerometer connected to I2C or SPI.
 *
 * This driver is for the usage with the ESP8266 and FreeRTOS (esp-open-rtos)
 * [https://github.com/SuperHouse/esp-open-rtos]. It is also working with ESP32
 * and ESP-IDF [https://github.com/espressif/esp-idf.git] as well as Linux
 * based systems using a wrapper library for ESP8266 functions.
 *
 * ---------------------------------------------------------------------------
 *
 * The BSD License (3-clause license)
 *
 * Copyright (c) 2017 Gunar Schorcht (https://github.com/gschorcht)
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
 * ARE DISCLAIMED. IN NO Activity SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#ifndef __LIS3DH_TYPES_H__
#define __LIS3DH_TYPES_H__

#include "stdint.h"
#include "stdbool.h"

#ifdef __cplusplus
extern "C"
{
#endif


/**
 * @brief   Output data rates (ODR), related to resolution modes
 */
typedef enum {

    lis3dh_power_down = 0,  // power down mode
    lis3dh_odr_1,           // high resolution / normal / low power   1 Hz
    lis3dh_odr_10,          // high resolution / normal / low power  10 Hz
    lis3dh_odr_25,          // high resolution / normal / low power  25 Hz
    lis3dh_odr_50,          // high resolution / normal / low power  50 Hz
    lis3dh_odr_100,         // high resolution / normal / low power 100 Hz
    lis3dh_odr_200,         // high resolution / normal / low power 200 Hz
    lis3dh_odr_400,         // high resolution / normal / low power 400 Hz
    lis3dh_odr_1600,        // low power mode 1.6 kHz
    lis3dh_odr_5000,        // normal 1.25 kHz / low power 5 kHz

} lis3dh_odr_mode_t;

/**
 * @brief   Resolution modes, related to output data rates (ODR)
 */
typedef enum {

    lis3dh_low_power,       // low power mode resolution ( 8 bit data)
    lis3dh_normal,          // normal mode resolution    (10 bit data)
    lis3dh_high_res         // high resolution mode      (12 bit data)

} lis3dh_resolution_t;

/**
 * @brief   Full scale measurement range
 */
typedef enum {

    lis3dh_scale_2g = 0,     // default
    lis3dh_scale_4g,
    lis3dh_scale_8g,
    lis3dh_scale_16g

} lis3dh_scale_t;


/**
 * @brief   FIFO mode
 */
typedef enum {

    lis3dh_bypass = 0,     // default
    lis3dh_fifo   = 1,
    lis3dh_stream = 2,
    lis3dh_trigger= 3

} lis3dh_fifo_mode_t;


/**
 * @brief   Interrupt signals
 */
typedef enum {

    lis3dh_int1_signal = 0,
    lis3dh_int2_signal = 1    

} lis3dh_int_signals_t;
 
 
/**
 * @brief   Activity interrupt configuration for INT1/INT2 signals
 *
 * Activity interrupts are: axes movement wake-up, free-fall, 6D/4D detection.
 */
typedef struct {

    enum {                    // activity type for the interrupt

        lis3dh_wake_up,       // AOI = 0, 6D = 0
        lis3dh_free_fall,     // AOI = 1, 6D = 0

        lis3dh_6d_movement,   // AOI = 0, 6D = 1, D4D = 0
        lis3dh_6d_position,   // AOI = 1, 6D = 1, D4D = 0

        lis3dh_4d_movement,   // AOI = 0, 6D = 1, D4D = 1
        lis3dh_4d_position,   // AOI = 1, 6D = 1, D4D = 1
    
    } activity;            

    uint8_t  threshold;       // threshold used for comparison for all axes

    bool     x_low_enabled;   // x lower than threshold interrupt enabled
    bool     x_high_enabled;  // x higher than threshold interrupt enabled
    
    bool     y_low_enabled;   // y lower than threshold interrupt enabled
    bool     y_high_enabled;  // y higher than threshold interrupt enabled

    bool     z_low_enabled;   // z lower than threshold interrupt enabled
    bool     z_high_enabled;  // z higher than threshold interrupt enabled

    bool     latch;           // latch the interrupt when true until the
                              // interrupt source has been read
                              
    uint8_t  duration;        // duration in 1/ODR an interrupt condition has
                              // to be given before the interrupt is generated
} lis3dh_int_activity_config_t;


/**
 * @brief   Activity interrupt source type for interrupt signals INT1/INT2 
 */
typedef struct {

    bool    active:1;     // true - one ore more activities occured
    
    bool    x_low :1;     // true - x low activity occured
    bool    x_high:1;     // true - x high activity occured

    bool    y_low :1;     // true - z low activity occured
    bool    y_high:1;     // true - z high activity occured

    bool    z_low :1;     // true - z low activity occured
    bool    z_high:1;     // true - z high activity occured
    
} lis3dh_int_activity_source_t;


/**
 * @brief   Data interrupt types for INT1 signal
 */
typedef enum {

    lis3dh_data_ready,     // interrupt when data are ready to read
    lis3dh_fifo_watermark, // interrupt when FIFO exceeds the FIFO threashold
    lis3dh_fifo_overrun    // interrupt when FIFO is completely filled

} lis3dh_int_data_t;


/**
 * @brief   Data interrupt source type for INT1 signal
 */
typedef struct {

    bool data_ready;        // true when data are ready to read
    bool fifo_watermark;    // true when FIFO exceeds the FIFO threashold
    bool fifo_overrun;      // true when FIFO is completely filled
    
} lis3dh_int_data_source_t;


/**
 * @brief   Click interrupt configuration for interrupt signals INT1/INT2 
 */
typedef struct {

    bool    x_single;       // x-axis single tap interrupt enabled
    bool    x_double;       // x-axis double tap interrupt enabled
    
    bool    y_single;       // y-axis single tap interrupt enabled
    bool    y_double;       // y-axis double tap interrupt enabled

    bool    z_single;       // z-axis single tap interrupt enabled
    bool    z_double;       // z-axis double tap interrupt enabled

    uint8_t  threshold;     // threshold used for comparison for all axes

    bool     latch;         // latch the interrupt when true until the
                            // interrupt source has been read
                          
    uint8_t  time_limit;    // maximum time interval between the start and the
                            // end of a cick (accel increases and falls back)
    uint8_t  time_latency;  // click detection is disabled for that time after 
                            // a was click detected (in 1/ODR)
    uint8_t  time_window;   // time interval in which the second click has to
                            // to be detected in double clicks (in 1/ODR)

} lis3dh_int_click_config_t;


/**
 * @brief   Click interrupt configuration for interrupt signals INT1/INT2 
 */
typedef struct {

    bool    x_click:1;    // click detected in x direction
    bool    y_click:1;    // click detected in y direction
    bool    z_click:1;    // click detected in z direction

    bool    sign   :1;    // click sign (0 - posisitive, 1 - negative)

    bool    s_click:1;    // single click detected
    bool    d_click:1;    // double click detected

    bool    active :1;    // true - one ore more Activities occured

} lis3dh_int_click_source_t;


/**
 * @brief   INT1, INT2 signal activity level
 */
typedef enum {

    lis3dh_high_active = 0,
    lis3dh_low_active

} lis3dh_int_signal_level_t;
    
    
/**
 * @brief   Raw data set as two complements
 */
typedef struct {

    int16_t ax; // acceleration on x axis
    int16_t ay; // acceleration on y axis
    int16_t az; // acceleration on z axis

} lis3dh_raw_data_t;


/**
 * @brief   Raw data FIFO type
 */
typedef lis3dh_raw_data_t lis3dh_raw_data_fifo_t[32];


/**
 * @brief   Floating point output value set in degree
 */
typedef struct {

    float ax;   // acceleration on x axis
    float ay;   // acceleration on y axis
    float az;   // acceleration on z axis

} lis3dh_float_data_t;


/**
 * @brief   Floating point output value FIFO type
 */
typedef lis3dh_float_data_t lis3dh_float_data_fifo_t[32];


/**
 * @brief   HPF (high pass filter) modes
 */
typedef enum {

    lis3dh_hpf_normal = 0, // normal mode (reset by reading reference)
    lis3dh_hpf_reference,  // reference signal for filtering
    lis3dh_hpf_normal_x,   // normal mode
    lis3dh_hpf_autoreset   // autoreset on interrupt Activity

} lis3dh_hpf_mode_t;


/**
 * @brief   LIS3DH sensor device data structure type
 */
typedef struct {

    int       error_code;           // error code of last operation

    uint8_t   bus;                  // I2C = x, SPI = 1
    uint8_t   addr;                 // I2C = slave address, SPI = 0

    uint8_t   cs;                   // ESP8266, ESP32: GPIO used as SPI CS
                                    // __linux__: device index

    lis3dh_scale_t      scale;      // fill range scale (default 245 dps)
    lis3dh_resolution_t res;        // resolution used
    lis3dh_fifo_mode_t  fifo_mode;  // FIFO operation mode (default bypass)
    bool                fifo_first; // first FIFO access
      
} lis3dh_sensor_t;
                                 

#ifdef __cplusplus
}
#endif /* End of CPP guard */

#endif /* __LIS3DH_TYPES_H__ */

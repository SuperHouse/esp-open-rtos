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

/**
 * Driver for Sensirion SHT3x digital temperature and humity sensor
 * connected to I2C
 *
 * Part of esp-open-rtos
 */

#include <string.h>

#include "sht3x.h"

#include "FreeRTOS.h"
#include "task.h"

#include "espressif/esp_common.h"
#include "espressif/sdk_private.h"

#define SHT3x_STATUS_CMD               0xF32D
#define SHT3x_CLEAR_STATUS_CMD         0x3041
#define SHT3x_RESET_CMD                0x30A2
#define SHT3x_FETCH_DATA_CMD           0xE000
#define SHT3x_HEATER_OFF_CMD           0x3066

const uint16_t SHT3x_MEASURE_CMD[6][3] = { {0x2c06,0x2c0d,0x2c10},    // [SINGLE_SHOT][H,M,L]
                                           {0x2032,0x2024,0x202f},    // [PERIODIC_05][H,M,L]
                                           {0x2130,0x2126,0x212d},    // [PERIODIC_1 ][H,M,L]
                                           {0x2236,0x2220,0x222b},    // [PERIODIC_2 ][H,M,L]
                                           {0x2234,0x2322,0x2329},    // [PERIODIC_4 ][H,M,L]
                                           {0x2737,0x2721,0x272a} };  // [PERIODIC_10][H,M,L]

// tick counts [High, Medium, Low]
// minimum is one tick if portTICK_PERIOD_MS is greater than 20 or 30 ms
const int32_t SHT3x_MEASURE_DURATION[3] = { (30 + portTICK_PERIOD_MS-1)/portTICK_PERIOD_MS,
                                            (20 + portTICK_PERIOD_MS-1)/portTICK_PERIOD_MS,
                                            (20 + portTICK_PERIOD_MS-1)/portTICK_PERIOD_MS };

#ifdef SHT3x_DEBUG
#define debug(s, f, ...) printf("%s %s: " s "\n", "SHT3x", f, ## __VA_ARGS__)
#define debug_dev(s, f, d, ...) printf("%s %s: bus %d, addr %02x - " s "\n", "SHT3x", f, d->bus, d->addr, ## __VA_ARGS__)
#else
#define debug(s, f, ...)
#define debug_dev(s, f, d, ...)
#endif

#define error(s, f, ...) printf("%s %s: " s "\n", "SHT3x", f, ## __VA_ARGS__)
#define error_dev(s, f, d, ...) printf("%s %s: bus %d, addr %02x - " s "\n", "SHT3x", f, d->bus, d->addr, ## __VA_ARGS__)

/** Forward declaration of function for internal use */

static bool sht3x_send_command  (sht3x_sensor_t*, uint16_t);
static bool sht3x_read_data     (sht3x_sensor_t*, uint8_t*,  uint32_t);
static bool sht3x_get_status    (sht3x_sensor_t*, uint16_t*);
// static bool sht3x_reset         (sht3x_sensor_t*);

static uint8_t crc8 (uint8_t data[], int len);

/** ------------------------------------------------ */

bool sht3x_init_driver()
{
    return true;
}


sht3x_sensor_t* sht3x_init_sensor(uint8_t bus, uint8_t addr)
{
    sht3x_sensor_t* dev;

    if ((dev = malloc (sizeof(sht3x_sensor_t))) == NULL)
        return NULL;
    
    // init sensor data structure
    dev->bus  = bus;
    dev->addr = addr;
    dev->mode = single_shot;
    dev->repeatability = high;
    dev->meas_started = false;
    dev->meas_start_tick = 0;
    
    dev->active = true;

    uint16_t status;

    // check the again the status after clear status command
    if (!sht3x_get_status(dev, &status))
    {
        error_dev ("could not get sensor status", __FUNCTION__, dev);
        free(dev);
        return NULL;       
    }
    
    debug_dev ("sensor initialized", __FUNCTION__, dev);
    return dev;
}


int32_t sht3x_start_measurement (sht3x_sensor_t* dev, sht3x_mode_t mode)
{
    if (!dev || !dev->active) return -1;
    
    dev->error_code = SHT3x_OK;
    
    // return remaining time when measurement is already running
    if (dev->meas_started)
    {
        debug_dev ("measurement already started", __FUNCTION__, dev);
        dev->error_code = SHT3x_MEAS_ALREADY_RUNNING;
        return sht3x_is_measuring (dev);
    }
    
    dev->mode = mode;
    
    // start measurement according to selected mode and return an duration estimate
    if (sht3x_send_command(dev, SHT3x_MEASURE_CMD[dev->mode][dev->repeatability]))
    {
        dev->meas_start_tick = xTaskGetTickCount ();
        dev->meas_started = true;
        dev->meas_first = true;
        return SHT3x_MEASURE_DURATION[dev->repeatability];   // in RTOS ticks
    }

    dev->error_code |= SHT3x_SEND_MEAS_CMD_FAILED;
    return -1;  // on error
}


// returns 0 when finished, -1 on error, remaining measurement time otherwise
int32_t sht3x_is_measuring (sht3x_sensor_t* dev)
{
    if (!dev || !dev->active) return -1;

    dev->error_code = SHT3x_OK;

    if (!dev->meas_started)
    {
        error_dev ("measurement not started", __FUNCTION__, dev);
        dev->error_code = SHT3x_MEAS_NOT_STARTED;
        return -1;
    }
    
    // computation is necessary in periodic mode only for first measurement
    // in single shot mode every measurment is the first one
    if (!dev->meas_first)
        return 0;
        
    uint32_t elapsed_time;

    elapsed_time = (xTaskGetTickCount() - dev->meas_start_tick);  // in RTOS ticks

    if (elapsed_time >= SHT3x_MEASURE_DURATION[dev->repeatability])
        return 0;
    else
        return SHT3x_MEASURE_DURATION[dev->repeatability] - elapsed_time;
}


bool sht3x_get_raw_data(sht3x_sensor_t* dev, sht3x_raw_data_t raw_data)
{
    if (!dev || !dev->active || !raw_data) return false;

    dev->error_code = SHT3x_OK;

    if (sht3x_is_measuring (dev) == -1)
    {
        error_dev ("measurement is still running", __FUNCTION__, dev);
        return false;
    }
    
    if (dev->mode == single_shot && 
        sht3x_read_data(dev, raw_data, sizeof(sht3x_raw_data_t)))
    {
        debug_dev ("single shot data available", __FUNCTION__, dev);
        dev->meas_started = false;
    }
    else if (dev->mode != single_shot &&
             sht3x_send_command(dev, SHT3x_FETCH_DATA_CMD) &&
             sht3x_read_data(dev, raw_data, sizeof(sht3x_raw_data_t)))
    {
        debug_dev ("periodic data available", __FUNCTION__, dev);
        dev->meas_first = false;
    }
    else
    {
        error_dev ("read raw data failed", __FUNCTION__, dev);
        dev->error_code |= SHT3x_READ_RAW_DATA_FAILED;
        return false;
    }
     
    if (crc8(raw_data,2) != raw_data[2])
    {
        error_dev ("CRC check for temperature data failed", __FUNCTION__, dev);
        dev->error_code |= SHT3x_WRONG_CRC_TEMPERATURE;
        return false;
    }

    if (crc8(raw_data+3,2) != raw_data[5])
    {
        error_dev ("CRC check for humidity data failed", __FUNCTION__, dev);
        dev->error_code |= SHT3x_WRONG_CRC_HUMIDITY;
        return false;
    }

    return true;
}


bool sht3x_compute_values (sht3x_raw_data_t raw_data, sht3x_values_t* values)
{
    if (!raw_data || !values) return false;

    values->temperature = ((((raw_data[0] * 256.0) + raw_data[1]) * 175) / 65535.0) - 45;
    values->humidity    = ((((raw_data[3] * 256.0) + raw_data[4]) * 100) / 65535.0);
  
    return true;    
}


bool sht3x_get_results (sht3x_sensor_t* dev, sht3x_values_t* values)
{
    if (!dev || !dev->active || !values) return false;

    sht3x_raw_data_t raw_data;
    
    if (!sht3x_get_raw_data (dev, raw_data))
        return false;
        
    return sht3x_compute_values (raw_data, values);
}

/* Functions for internal use only */

static bool sht3x_send_command(sht3x_sensor_t* dev, uint16_t cmd)
{
    if (!dev || !dev->active) return false;

    uint8_t data[2] = { cmd >> 8, cmd & 0xff };

    debug_dev ("send command MSB=%02x LSB=%02x", __FUNCTION__, dev, data[0], data[1]);

    int err;
    int count = 10;

    // in case i2c is busy, try to write up to ten times and 100 ms
    // tested with a task that is disturbing by using i2c bus almost all the time
    while ((err=i2c_slave_write(dev->bus, dev->addr, 0, data, 2)) == -EBUSY && count--)
       vTaskDelay (10 / portTICK_PERIOD_MS);
  
    if (err)
    {
        dev->error_code |= (err == -EBUSY) ? SHT3x_I2C_BUSY : SHT3x_I2C_SEND_CMD_FAILED;
        error_dev ("i2c error %d on write command %02x", __FUNCTION__, dev, err, cmd);
        return false;
    }
      
    return true;
}


static bool sht3x_read_data(sht3x_sensor_t* dev, uint8_t *data,  uint32_t len)
{
    if (!dev || !dev->active) return false;

    int err;
    int count = 10;

    // in case i2c is busy, try to read up to ten times and 100 ms
    while ((err=i2c_slave_read(dev->bus, dev->addr, 0, data, len)) == -EBUSY && count--)
        vTaskDelay (10 / portTICK_PERIOD_MS);
        
    if (err)
    {
        dev->error_code |= (err == -EBUSY) ? SHT3x_I2C_BUSY : SHT3x_I2C_READ_FAILED;
        error_dev ("error %d on read %d byte", __FUNCTION__, dev, err, len);
        return false;
    }

#   ifdef SHT3x_DEBUG
    printf("SHT3x %s: bus %d, addr %02x - read following bytes: ", 
           __FUNCTION__, dev->bus, dev->addr);
    for (int i=0; i < len; i++)
        printf("%02x ", data[i]);
    printf("\n");
#   endif

    return true;
}


/*
static bool sht3x_reset (sht3x_sensor_t* dev)
{
    if (!dev || !dev->active) return false;

    debug_dev ("soft-reset triggered", __FUNCTION__, dev);
    
    dev->error_code = SHT3x_OK;

    // send reset command
    if (!sht3x_send_command(dev, SHT3x_RESET_CMD))
    {
        dev->error_code |= SHT3x_SEND_RESET_CMD_FAILED;
        return false;
    }   
    // wait for small amount of time needed (according to datasheet 0.5ms)
    vTaskDelay (20 / portTICK_PERIOD_MS);
    
    uint16_t status;

    // check the status after reset
    if (!sht3x_get_status(dev, &status))
        return false;
        
    return true;    
}
*/


static bool sht3x_get_status (sht3x_sensor_t* dev, uint16_t* status)
{
    if (!dev || !dev->active || !status) return false;

    dev->error_code = SHT3x_OK;

    uint8_t  data[3];

    if (!sht3x_send_command(dev, SHT3x_STATUS_CMD) || !sht3x_read_data(dev, data, 3))
    {
        dev->error_code |= SHT3x_STATUS_CMD_FAILED;
        return false;
    }

    *status = data[0] << 8 | data[1];
    debug_dev ("status=%02x", __FUNCTION__, dev, *status);
    return true;
}


const uint8_t g_polynom = 0x31;

static uint8_t crc8 (uint8_t data[], int len)
{
    // initialization value
    uint8_t crc = 0xff;
    
    // iterate over all bytes
    for (int i=0; i < len; i++)
    {
        crc ^= data[i];  
    
        for (int i = 0; i < 8; i++)
        {
            bool xor = crc & 0x80;
            crc = crc << 1;
            crc = xor ? crc ^ g_polynom : crc;
        }
    }

    return crc;
} 



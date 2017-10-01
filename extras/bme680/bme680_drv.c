/*
 * Driver for Bosch Sensortec BME680 digital temperature, humity, pressure and
 * gas sensor connected to I2C or SPI
 *
 * Part of esp-open-rtos [https://github.com/SuperHouse/esp-open-rtos]
 *
 * PLEASE NOTE: 
 * Due to the complexity of the sensor output value computation based on many
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

#include <string.h>
 
#include "bme680_drv.h"
#include "FreeRTOS.h"
#include "task.h"

#include "espressif/esp_common.h"
#include "espressif/sdk_private.h"

#ifdef BME680_DEBUG
#define debug(s, f, ...) printf("%s %s: " s "\n", "BME680", f, ## __VA_ARGS__)
#else
#define debug(s, f, ...)
#endif

#define error(s, f, ...) printf("%s %s: " s "\n", "BME680", f, ## __VA_ARGS__)

#define BME680_BG_TASK_PRIORITY        9

/** 
 * Forward declation of internal functions used by embedded Bosch Sensortec BME680 driver.
 */
static void bme680_user_delay_ms(uint32_t period);
static int8_t bme680_user_spi_read(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data, uint16_t len);
static int8_t bme680_user_spi_write(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data, uint16_t len);
static int8_t bme680_user_i2c_read(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data, uint16_t len);
static int8_t bme680_user_i2c_write(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data, uint16_t len);

/**
 * Sensor data structures
 */
bme680_sensor_t bme680_sensors[BME680_MAX_SENSORS];

/** */

static bool bme680_valid_sensor (uint32_t sensor, const char* function)
{
    if (sensor < 0 || sensor > BME680_MAX_SENSORS)
    {
        debug("Wrong sensor id %d.", function, sensor);
        return false;
    }
    
    if (!bme680_sensors[sensor].active)
    {
        debug("Sensor with id %d is not active.", function, sensor);
        return false;
    }
    
    return true;
}


static bool bme680_is_available (uint32_t id)
{
    struct bme680_dev *dev = &bme680_sensors[id].dev;

    if (!bme680_valid_sensor(id, __FUNCTION__) || 
        bme680_get_regs(BME680_CHIP_ID_ADDR, &dev->chip_id, 1, dev) != BME680_OK)
    {
        return false;
    }

    return true;
}


static void bme680_compute_values (uint8_t id, struct bme680_field_data* data)
{
    if (!bme680_valid_sensor(id, __FUNCTION__) || !data)
        return;

    bme680_value_set_t  act;
    bme680_value_set_t  avg = bme680_sensors[id].average;
    float w = bme680_sensors[id].average_weight;

    act.temperature = bme680_sensors[id].dev.tph_sett.os_temp   ? data->temperature / 100.0f : 0;
    act.pressure    = bme680_sensors[id].dev.tph_sett.os_pres   ? data->pressure / 100.0f : 0;
    act.humidity    = bme680_sensors[id].dev.tph_sett.os_hum    ? data->humidity / 1000.0f : 0;
    act.gas         = bme680_sensors[id].dev.gas_sett.heatr_dur ? data->gas_resistance : 0;
  
    if (bme680_sensors[id].average_first_measurement || 
        !bme680_sensors[id].average_computation)
    {
        bme680_sensors[id].average_first_measurement = false;

        avg = act;
    }
    else
    {
        avg.temperature = w * act.temperature + (1-w) * avg.temperature;
        avg.humidity    = w * act.humidity    + (1-w) * avg.humidity;
        avg.pressure    = w * act.pressure    + (1-w) * avg.pressure;
        avg.gas         = w * act.gas         + (1-w) * avg.gas;
    }
   
    bme680_sensors[id].actual  = act;
    bme680_sensors[id].average = avg;
}


static void bme680_background_task (void *pvParameters)
{
    uint32_t id = (uint32_t)pvParameters;
    uint32_t next_time = sdk_system_get_time ();
    
    while (1) 
    {
        debug("%.3f Sensor %d", __FUNCTION__, (double)sdk_system_get_time()*1e-3, id);

        struct bme680_dev* dev = &bme680_sensors[id].dev;
        struct bme680_field_data data;
        
        uint8_t set_required_settings;
        int8_t rslt = BME680_OK;

    	/* Select the power mode */
    	/* Must be set before writing the sensor configuration */
    	dev->power_mode = BME680_FORCED_MODE; 

     	debug ("Using oversampling rates: %d %d %d", __FUNCTION__, 
     	       bme680_sensors[id].dev.tph_sett.os_temp, 
 	           bme680_sensors[id].dev.tph_sett.os_pres, 
 	           bme680_sensors[id].dev.tph_sett.os_hum);

    	/* Set the required sensor settings needed */
    	set_required_settings = BME680_OST_SEL | 
    	                        BME680_OSP_SEL | 
    	                        BME680_OSH_SEL |
    	                        BME680_FILTER_SEL | 
    	                        BME680_GAS_SENSOR_SEL;

    	/* Set the desired sensor configuration */
    	rslt = bme680_set_sensor_settings(set_required_settings, dev);

	    /* Set the power mode to forced mode to trigger one TPHG measurement cycle */
    	rslt = bme680_set_sensor_mode(dev);

	    /* Get the total measurement duration so as to sleep or wait till the
    	 * measurement is complete */
    	uint16_t meas_period;
    	bme680_get_profile_dur(&meas_period, dev);
    	vTaskDelay(meas_period/portTICK_PERIOD_MS); /* Delay till the measurement is ready */

        if ((rslt = bme680_get_sensor_data(&data, dev)) == BME680_OK)
        {
           bme680_compute_values(id, &data);
                
           debug("%d ms: %.2f C, %.2f Percent, %.2f hPa, %.2f Ohm", __FUNCTION__, 
                 sdk_system_get_time (),
                 bme680_sensors[id].actual.temperature,
                 bme680_sensors[id].actual.humidity,
                 bme680_sensors[id].actual.pressure,
                 bme680_sensors[id].actual.gas);

            if (bme680_sensors[id].cb_function)
                bme680_sensors[id].cb_function(id,
                                               bme680_sensors[id].actual,
                                               bme680_sensors[id].average);
                    
        }
        else
		    error("Could not get data from sensor with id %d", __FUNCTION__,id);

		/* Compute next measurement time as well as remaining cycle time*/
		uint32_t system_time = sdk_system_get_time ();
		uint32_t remaining_time;

		next_time = next_time + bme680_sensors[id].period*1000; // in us

        if (next_time < system_time)
            // in case of timer overflow
            remaining_time = UINT32_MAX - system_time + next_time;
        else
            // normal case
            remaining_time = next_time - system_time;

        /* Delay the background task by the cycle time */
        vTaskDelay(remaining_time/1000/portTICK_PERIOD_MS);
    }
}


bool bme680_init_driver()
{
    for (int id=0; id < BME680_MAX_SENSORS; id++)
        bme680_sensors[id].active = false;
        
    return true;
}


uint32_t bme680_create_sensor(uint8_t bus, uint8_t addr, uint8_t cs)
{
    static uint32_t id;
    static char bg_task_name[20];
    
    // search for first free sensor data structure
    for (id=0; id < BME680_MAX_SENSORS; id++)
    {
        debug("id=%d active=%d", __FUNCTION__, id, bme680_sensors[id].active);
        if (!bme680_sensors[id].active)
            break;
    }
    debug("id=%d", __FUNCTION__, id);
    
    if (id == BME680_MAX_SENSORS)
    {
        debug("No more sensor data structures available.", __FUNCTION__);
        return -1;
    }
    // init sensor data structure
    bme680_sensors[id].bus  = bus;
    bme680_sensors[id].addr = addr;
    bme680_sensors[id].period = 1000;
    bme680_sensors[id].average_computation = true;
    bme680_sensors[id].average_first_measurement = true;
    bme680_sensors[id].average_weight = 0.2;
    bme680_sensors[id].cb_function = NULL;
    bme680_sensors[id].bg_task = NULL;

    bme680_sensors[id].dev.dev_id = id;

    if (bme680_sensors[id].addr)
    {
        // I2C interface used
        bme680_sensors[id].addr = addr;
        bme680_sensors[id].dev.intf = BME680_I2C_INTF;
        bme680_sensors[id].dev.read = bme680_user_i2c_read;
        bme680_sensors[id].dev.write = bme680_user_i2c_write;
        bme680_sensors[id].dev.delay_ms = bme680_user_delay_ms;
    }
    else
    {
        // SPI interface used
        bme680_sensors[id].spi_cs_pin = cs;
        bme680_sensors[id].dev.intf = BME680_SPI_INTF;
        bme680_sensors[id].dev.read = bme680_user_spi_read;
        bme680_sensors[id].dev.write = bme680_user_spi_write;
        bme680_sensors[id].dev.delay_ms = bme680_user_delay_ms;
        
        gpio_enable(bme680_sensors[id].spi_cs_pin, GPIO_OUTPUT);
        gpio_write (bme680_sensors[id].spi_cs_pin, true);
    }
    
    // initialize embedded Bosch Sensortec driver
    if (bme680_init(&bme680_sensors[id].dev))
    {
        error("Could not initialize the sensor device with id %d", __FUNCTION__, id);
        return -1;
    }
            
    bme680_sensors[id].active = true;
    
    // check whether sensor is available
    if (!bme680_is_available(id))
    {
        debug("Sensor with id %d is not available", __FUNCTION__, id);
        bme680_sensors[id].active = false;    
        return -1;
    }

 	/* Set the default temperature, pressure and humidity settings */
    bme680_set_oversampling_rates (id, os_1x, os_1x, os_1x);
    bme680_set_filter_size (id, iir_size_3);

	/* Set heater default profile 320 degree Celcius for 150 ms */
    bme680_set_heater_profile (id, 320, 150);

    snprintf (bg_task_name, 20, "bme680_bg_task_%d", id);

    if (xTaskCreate (bme680_background_task, bg_task_name, 256, (void*)id, 
                     BME680_BG_TASK_PRIORITY, 
                     &bme680_sensors[id].bg_task) != pdPASS)
    {
        vTaskDelete(bme680_sensors[id].bg_task);
        error("Could not create the background task %s for sensor with id %d\n",
               __FUNCTION__, bg_task_name, id);
        bme680_sensors[id].active = false;    
        return -1;
    }

    return id;
}


bool bme680_delete_sensor(uint32_t sensor)
{
    if (!bme680_valid_sensor(sensor, __FUNCTION__))
        return false;

    bme680_sensors[sensor].active = false;
    
    if (bme680_sensors[sensor].bg_task)
        vTaskDelete(bme680_sensors[sensor].bg_task);
    
    return true;
}


bool bme680_set_measurement_period (uint32_t sensor, uint32_t period)
{
    if (!bme680_valid_sensor(sensor, __FUNCTION__))
        return false;

    if (period < 20)
        error("Period of %d ms is less than the minimum "
              "period of 20 ms for sensor with id %d.", 
              __FUNCTION__, period, sensor);

    bme680_sensors[sensor].period = period;
    
    return true;
}


bool bme680_set_callback_function (uint32_t sensor, bme680_cb_function_t bme680_user_function)
{
    if (!bme680_valid_sensor(sensor, __FUNCTION__))
        return false;
    
    bme680_sensors[sensor].cb_function = bme680_user_function;
    
    debug("Set callback function done.", __FUNCTION__);

    return false;
}


bool bme680_get_values(uint32_t sensor, bme680_value_set_t *actual, bme680_value_set_t *average)
{
    if (!bme680_valid_sensor(sensor, __FUNCTION__))
        return false;

    if (actual)  *actual  = bme680_sensors[sensor].actual;
    if (average) *average = bme680_sensors[sensor].average;

    return true;
}


bool bme680_enable_average_computation (uint32_t sensor, bool enabled)
{
    if (!bme680_valid_sensor(sensor, __FUNCTION__))
        return false;

    bme680_sensors[sensor].average_computation = enabled;
    bme680_sensors[sensor].average_first_measurement = enabled;

    return true;
}


bool bme680_set_average_weight (uint32_t sensor, float weight)
{
    if (!bme680_valid_sensor(sensor, __FUNCTION__))
        return false;

    bme680_sensors[sensor].average_first_measurement = true;
    bme680_sensors[sensor].average_weight = weight;

    return true;
}


bool bme680_set_oversampling_rates (uint32_t sensor, 
                                    bme680_oversampling_t ost,
                                    bme680_oversampling_t osp,
                                    bme680_oversampling_t osh)
{
    if (!bme680_valid_sensor(sensor, __FUNCTION__))
        return false;

 	/* Set the temperature, pressure and humidity settings */
    bme680_sensors[sensor].dev.tph_sett.os_temp = ost;
  	bme680_sensors[sensor].dev.tph_sett.os_pres = osp;
 	bme680_sensors[sensor].dev.tph_sett.os_hum  = osh;

 	debug ("Setting oversampling rates done: osrt=%d osp=%d osrh=%d", __FUNCTION__, 
 	       bme680_sensors[sensor].dev.tph_sett.os_temp, 
 	       bme680_sensors[sensor].dev.tph_sett.os_pres, 
 	       bme680_sensors[sensor].dev.tph_sett.os_hum);
 	       
 	bme680_sensors[sensor].average_first_measurement = true;
                                       
   	return true;
}

bool bme680_set_heater_profile (uint32_t sensor, uint16_t temperature, uint16_t duration)
{
    if (!bme680_valid_sensor(sensor, __FUNCTION__))
        return false;

 	/* Set the temperature, pressure and humidity settings */
    bme680_sensors[sensor].dev.gas_sett.heatr_temp = temperature; /* degree Celsius */
    bme680_sensors[sensor].dev.gas_sett.heatr_dur = duration; /* milliseconds */

 	debug ("Setting heater profile done: temperature=%d duration=%d", __FUNCTION__, 
 	       bme680_sensors[sensor].dev.gas_sett.heatr_temp, 
 	       bme680_sensors[sensor].dev.gas_sett.heatr_dur);
 	       
    /* Set the remaining default gas sensor settings and link the heating profile */
    if (temperature == 0 || duration == 0)
        bme680_sensors[sensor].dev.gas_sett.run_gas = BME680_DISABLE_GAS_MEAS;
    else
        bme680_sensors[sensor].dev.gas_sett.run_gas = BME680_ENABLE_GAS_MEAS;

 	bme680_sensors[sensor].average_first_measurement = true;
                                       
   	return true;
}


bool bme680_set_filter_size(uint32_t sensor, bme680_filter_size_t size)
{
    if (!bme680_valid_sensor(sensor, __FUNCTION__))
        return false;

 	/* Set the temperature, pressure and humidity settings */
	bme680_sensors[sensor].dev.tph_sett.filter = size;

 	debug ("Setting filter size done: size=%d", __FUNCTION__, 
 	       bme680_sensors[sensor].dev.tph_sett.filter);
 	       
 	bme680_sensors[sensor].average_first_measurement = true;
                                       
   	return true;
}


/** 
 * Internal functions used by embedded Bosch Sensortec BME680 driver.
 */

static void bme680_user_delay_ms(uint32_t period)
{
    /*
     * Return control or wait,
     * for a period amount of milliseconds
     */
     
     vTaskDelay(period / portTICK_PERIOD_MS);
}

#define BME680_SPI_BUF_SIZE 64      // SPI register data buffer size of ESP866

static const spi_settings_t bus_settings = {
    .mode         = SPI_MODE0,
    .freq_divider = SPI_FREQ_DIV_10M,
    .msb          = true,
    .minimal_pins = true,
    .endianness   = SPI_LITTLE_ENDIAN
};


static int8_t bme680_user_spi_read(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data, uint16_t len)
{
    /*
     * The parameter dev_id can be used as a variable to select which Chip Select pin has
     * to be set low to activate the relevant device on the SPI bus
     */

    /*
     * Data on the bus should be like
     * |----------------+---------------------+-------------|
     * | MOSI           | MISO                | Chip Select |
     * |----------------+---------------------|-------------|
     * | (don't care)   | (don't care)        | HIGH        |
     * | (reg_addr)     | (don't care)        | LOW         |
     * | (don't care)   | (reg_data[0])       | LOW         |
     * | (....)         | (....)              | LOW         |
     * | (don't care)   | (reg_data[len - 1]) | LOW         |
     * | (don't care)   | (don't care)        | HIGH        |
     * |----------------+---------------------|-------------|
     */

    // debug("dev_id=%d, reg_addr=%0x, len=%d\n", __FUNCTION__, dev_id, reg_addr, len);

    if (len >= BME680_SPI_BUF_SIZE)
    {
        error("Error on read from SPI slave on bus 1. Tried to transfer more"
              "than %d byte in one read operation.", __FUNCTION__, BME680_SPI_BUF_SIZE);
        return -1;
    }
    
    spi_settings_t old_settings;

    static uint8_t mosi[BME680_SPI_BUF_SIZE];
    static uint8_t miso[BME680_SPI_BUF_SIZE];
    
    memset (mosi, 0xff, BME680_SPI_BUF_SIZE);
    memset (miso, 0xff, BME680_SPI_BUF_SIZE);
    
    mosi[0] = reg_addr;
        
    uint8_t bus = bme680_sensors[dev_id].bus;
    uint8_t spi_cs_pin = bme680_sensors[dev_id].spi_cs_pin;

    spi_get_settings(bus, &old_settings);
    spi_set_settings(bus, &bus_settings);
    gpio_write(spi_cs_pin, false);

    size_t success = spi_transfer (bus, (const void*)mosi, (void*)miso, len+1, SPI_8BIT);

    gpio_write(spi_cs_pin, true);
    spi_set_settings(bus, &old_settings);

    if (!success)
    {
        error("Could not read data from SPI bus %d", __FUNCTION__, bus);
        return -1;
    }
    
    for (int i=0; i < len; i++)
      reg_data[i] = miso[i+1];
        
#   ifdef BME680_DEBUG
    printf("BME680 %s: Read the following bytes: ", __FUNCTION__);
    printf("%0x ", reg_addr);
    for (int i=0; i < len; i++)
        printf("%0x ", reg_data[i]);
    printf("\n");
#   endif        
        
    return 0;
}


static int8_t bme680_user_spi_write(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data, uint16_t len)
{
    /*
     * The parameter dev_id can be used as a variable to select which Chip Select pin has
     * to be set low to activate the relevant device on the SPI bus
     */

    /*
     * Data on the bus should be like
     * |---------------------+--------------+-------------|
     * | MOSI                | MISO         | Chip Select |
     * |---------------------+--------------|-------------|
     * | (don't care)        | (don't care) | HIGH        |
     * | (reg_addr)          | (don't care) | LOW         |
     * | (reg_data[0])       | (don't care) | LOW         |
     * | (....)              | (....)       | LOW         |
     * | (reg_data[len - 1]) | (don't care) | LOW         |
     * | (don't care)        | (don't care) | HIGH        |
     * |---------------------+--------------|-------------|
     */
     
    static uint8_t mosi[BME680_SPI_BUF_SIZE];
    
    if (len >= BME680_SPI_BUF_SIZE)
    {
        error("Error on write to SPI slave on bus 1. Tried to transfer more"
              "than %d byte in one write operation.", __FUNCTION__, BME680_SPI_BUF_SIZE);
        return -1;        
    }
    
    mosi[0] = reg_addr;
    
    for (int i = 0; i < len; i++)
        mosi[i+1] = reg_data[i];
        
#   ifdef BME680_DEBUG
    printf("BME680 %s: Write the following bytes: ", __FUNCTION__);
    for (int i = 0; i < len+1; i++)
        printf("%0x ", mosi[i]);
    printf("\n");
#   endif

    spi_settings_t old_settings;
    
    uint8_t bus = bme680_sensors[dev_id].bus;
    uint8_t spi_cs_pin = bme680_sensors[dev_id].spi_cs_pin;

    spi_get_settings(bus, &old_settings);
    spi_set_settings(bus, &bus_settings);
    gpio_write(spi_cs_pin, false);

    size_t success = spi_transfer (bus, (const void*)mosi, NULL, len+1, SPI_8BIT);

    gpio_write(spi_cs_pin, true);
    spi_set_settings(bus, &old_settings);

    if (!success)
    {
        error("Could not write data to SPI bus %d", __FUNCTION__, bus);
        return -1;
    }

    return 0;
}

static int8_t bme680_user_i2c_read(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data, uint16_t len)
{
    /*
     * The parameter dev_id can be used as a variable to store the I2C address of the device
     */

    /*
     * Data on the bus should be like
     * |------------+---------------------|
     * | I2C action | Data                |
     * |------------+---------------------|
     * | Start      | -                   |
     * | Write      | (reg_addr)          |
     * | Stop       | -                   |
     * | Start      | -                   |
     * | Read       | (reg_data[0])       |
     * | Read       | (....)              |
     * | Read       | (reg_data[len - 1]) |
     * | Stop       | -                   |
     * |------------+---------------------|
     */

    debug ("Read %d byte from i2c slave on bus %d with addr %0x.", 
           __FUNCTION__, len, bme680_sensors[dev_id].bus, bme680_sensors[dev_id].addr);

    int result = i2c_slave_read(bme680_sensors[dev_id].bus, 
                                bme680_sensors[dev_id].addr, 
                                &reg_addr, reg_data, len);

    if (result)
    {
        error("Error %d on read %d byte from I2C slave on bus %d with addr %0x.", 
              __FUNCTION__, result, len, bme680_sensors[dev_id].bus, bme680_sensors[dev_id].addr);
        return result;
    }

#   ifdef BME680_DEBUG
    printf("BME680 %s: Read following bytes: ", __FUNCTION__);
    printf("%0x ", reg_addr);
    for (int i=0; i < len; i++)
        printf("%0x ", reg_data[i]);
    printf("\n");
#   endif

    return result;
}

static int8_t bme680_user_i2c_write(uint8_t dev_id, uint8_t reg_addr, uint8_t *reg_data, uint16_t len)
{
   /*
     * The parameter dev_id can be used as a variable to store the I2C address of the device
     */

    /*
     * Data on the bus should be like
     * |------------+---------------------|
     * | I2C action | Data                |
     * |------------+---------------------|
     * | Start      | -                   |
     * | Write      | (reg_addr)          |
     * | Write      | (reg_data[0])       |
     * | Write      | (....)              |
     * | Write      | (reg_data[len - 1]) |
     * | Stop       | -                   |
     * |------------+---------------------|
     */

    debug ("Write %d byte to i2c slave on bus %d with addr %0x.", 
           __FUNCTION__, len, bme680_sensors[dev_id].bus, bme680_sensors[dev_id].addr);

    int result = i2c_slave_write(bme680_sensors[dev_id].bus, 
                                 bme680_sensors[dev_id].addr, 
                                 &reg_addr, reg_data, len);
  
    if (result)
    {
        error("Error %d on write to i2c slave on bus %d with addr %0x.", 
               __FUNCTION__, result, bme680_sensors[dev_id].bus, bme680_sensors[dev_id].addr);
        return result;
    }

#   ifdef BME680_DEBUG
    printf("BME680 %s: Wrote the following bytes: ", __FUNCTION__);
    printf("%0x ", reg_addr);
    for (int i=0; i < len; i++)
        printf("%0x ", reg_data[i]);
    printf("\n");
#   endif
      
    return result;
}



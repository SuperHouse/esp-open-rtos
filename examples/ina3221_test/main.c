/*
 * Example of using INA3221
 *
 * Part of esp-open-rtos
 * Copyright (C) 2016 Zaltora
 * MIT Licensed as described in the file LICENSE
 */

#include "espressif/esp_common.h"
#include "FreeRTOS.h"
#include "task.h"
#include <esp/uart.h>
#include <stdbool.h>
#include "ina3221/ina3221.h"

#define PIN_SCL 4
#define PIN_SDA 2
#define ADDR INA3221_ADDR_0

//#define STRUCT_SETTING 1

void loop(void *pvParameters)
{
    uint32_t measure_number = 0;
    float bus_voltage;
    float shunt_voltage;
    float shunt_current;

    // Create ina3221 device
    ina3221_t dev = {
            .addr = ADDR,
            .shunt = { 100 ,100 ,100 },  // shunt values are 100 mOhm for each channel
            .mask.mask_register = INA3221_DEFAULT_MASK, // Init
            .config.config_register = INA3221_DEFAULT_CONFIG, // Init
    };

#ifndef STRUCT_SETTING
    if(ina3221_setting(&dev ,false, true, true)) // trigger mode,  bus and shunt activated
        goto error_loop;
    if(ina3221_enableChannel(&dev , true, true, true)) // Enable all channels
        goto error_loop;
    if(ina3221_setAverage(&dev, INA3221_AVG_64)) // 64 samples average
        goto error_loop;
    if(ina3221_setBusConversionTime(&dev, INA3221_CT_2116)) // 2ms by channel
        goto error_loop;
    if(ina3221_setShuntConversionTime(&dev, INA3221_CT_2116)) // 2ms by channel
        goto error_loop;
#else
    dev.config.mode = false; // trigger mode
    dev.config.esht = true; // shunt enable
    dev.config.ebus = true; // bus enable
    dev.config.ch1 = true; // channel 1 enable
    dev.config.ch2 = true; // channel 2 enable
    dev.config.ch3 = true; // channel 3 enable
    dev.config.avg = INA3221_AVG_64; // 64 samples average
    dev.config.vbus = INA3221_CT_2116; // 2ms by channel (bus)
    dev.config.vsht = INA3221_CT_2116; // 2ms by channel (shunt)
    if(ina3221_sync(&dev))
        goto error_loop;
#endif

    while(1)
    {
        measure_number++;
        do
        {
            if (ina3221_trigger(&dev)) // Start a measure & get mask
                goto error_loop;
        } while(!(dev.mask.cvrf)); // check if measure done

        for (uint8_t i = 0 ; i < BUS_NUMBER ; i++) {

            if(ina3221_getBusVoltage(&dev, i, &bus_voltage)) // Get voltage in V
                goto error_loop;
            if(ina3221_getShuntValue(&dev, i, &shunt_voltage, &shunt_current)) // Get voltage in mV and currant in mA
                goto error_loop;

            printf("Measure number %u\n", measure_number);
            printf("Bus voltage: %.02f V\n", bus_voltage );
            printf("Shunt voltage: %.02f mV\n", shunt_voltage );
            printf("Shunt current: %.02f mA\n\n", shunt_current );

        }
        vTaskDelay(5000/portTICK_PERIOD_MS);
    }

    error_loop:
    printf("%s: error while com with INA3221\n", __func__);
    for(;;){
        vTaskDelay(2000 / portTICK_PERIOD_MS);
        printf("%s: error loop\n", __FUNCTION__);
    }

}



void user_init(void)
{
    uart_set_baud(0, 115200);
    printf("SDK version:%s\n", sdk_system_get_sdk_version());

    i2c_init(PIN_SCL,PIN_SDA);

    xTaskCreate(loop, "tsk1", 512, NULL, 2, NULL);
}

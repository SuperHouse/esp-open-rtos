#include <string.h>

#include "sht3x.h"

#include "FreeRTOS.h"
#include "task.h"

#include "espressif/esp_common.h"
#include "espressif/sdk_private.h"

#define SHT3x_CB_TASK_PRIORITY        9

#define SHT3x_STATUS_CMD              0xF32D
#define SHT3x_CLEAR_STATUS_CMD        0x3041
#define SHT3x_RESET_CMD               0x30A2
#define SHT3x_MEASURE_ONE_SHOT_CMD    0x2C06
#define SHT3x_MEASURE_PERIODIC_1_CMD  0x2130
#define SHT3x_MEASURE_PERIODIC_2_CMD  0x2236
#define SHT3x_MEASURE_PERIODIC_4_CMD  0x2434
#define SHT3x_MEASURE_PERIODIC_10_CMD 0x2737
#define SHT3x_FETCH_DATA_CMD          0xE000

#ifdef SHT3x_DEBUG
#define DEBUG_PRINTF(s, ...) printf("%s: " s "\n", "SHT3x", ## __VA_ARGS__)
#else
#define DEBUG_PRINTF(s, ...)
#endif


sht3x_sensor_t sht3x_sensors[SHT3x_MAX_SENSORS];


static bool sht3x_send_command(uint32_t id, uint16_t cmd)
{
    uint8_t data[2] = { cmd / 256, cmd % 256 };

    DEBUG_PRINTF("%s: Send MSB command byte %0x", __FUNCTION__, data[0]);
    DEBUG_PRINTF("%s: Send LSB command byte %0x", __FUNCTION__, data[1]);

    int error = i2c_slave_write(sht3x_sensors[id].bus, sht3x_sensors[id].addr, 0, data, 2);
  
    if (error)
    {
        printf("%s: Error %d on write command %0x to i2c slave on bus %d with addr %0x.\n", 
               __FUNCTION__, error, cmd, sht3x_sensors[id].bus, sht3x_sensors[id].addr);
        return false;
    }
      
    return true;
}


static bool sht3x_read_data(uint32_t id, uint8_t *data,  uint32_t len)
{
    int error = i2c_slave_read(sht3x_sensors[id].bus, sht3x_sensors[id].addr, 0, data, len);

    if (error)
    {
        printf("%s: Error %d on read %d byte from i2c slave on bus %d with addr %0x.\n", 
               __FUNCTION__, error, len, sht3x_sensors[id].bus, sht3x_sensors[id].addr);
        return false;
    }

#   ifdef SHT3x_DEBUG
    printf("SHT3x: %s: Read following bytes: ", __FUNCTION__);
    for (int i=0; i < len; i++)
        printf("%0x ", data[i]);
    printf("\n");
#   endif

    return true;
}


static bool sht3x_is_available (uint32_t sensor)
{
    uint8_t data[3];

    if (!sht3x_send_command(sensor, SHT3x_STATUS_CMD))
        return false;
        
    if (!sht3x_read_data(sensor, data, 3))
        return false;

    return true;
}


static bool sht3x_valid_sensor (uint32_t sensor, const char* function)
{
    if (sensor < 0 || sensor > SHT3x_MAX_SENSORS)
    {
        DEBUG_PRINTF("%s: Wrong sensor id %d.", function, sensor);
        return false;
    }
    
    if (!sht3x_sensors[sensor].active)
    {
        DEBUG_PRINTF("%s: Sensor with id %d is not active.", function, sensor);
        return false;
    }
    
    return true;
}


static void sht3x_compute_values (uint8_t id, uint8_t* data)
{
  sht3x_value_set_t  act;
  sht3x_value_set_t  avg = sht3x_sensors[id].average;
  float w = sht3x_sensors[id].average_weight;

  act.temperature_c = ((((data[0] * 256.0) + data[1]) * 175) / 65535.0) - 45;
  act.temperature_f = ((((data[0] * 256.0) + data[1]) * 347) / 65535.0) - 49;
  act.humidity      = ((((data[3] * 256.0) + data[4]) * 100) / 65535.0);
  
  if (sht3x_sensors[id].first_measurement)
  {
    sht3x_sensors[id].first_measurement = false;

    avg = act;
  }
  else
  {
    avg.temperature_c = w * act.temperature_c + (1-w) * avg.temperature_c;
    avg.temperature_f = w * act.temperature_f + (1-w) * avg.temperature_f;
    avg.humidity      = w * act.humidity      + (1-w) * avg.humidity;
  }
   
  sht3x_sensors[id].actual  = act;
  sht3x_sensors[id].average = avg;
}


static void sht3x_callback_task (void *pvParameters)
{
    uint8_t  data[6];
    uint32_t sensor = (uint32_t)pvParameters;

    while (1) 
    {
        // DEBUG_PRINTF("%.3f Sensor %d: %s", (double)sdk_system_get_time()*1e-3, sensor, __FUNCTION__);

        if (sht3x_send_command(sensor, SHT3x_MEASURE_ONE_SHOT_CMD))
        {
            vTaskDelay (20 / portTICK_PERIOD_MS);

            if (sht3x_read_data(sensor, data, 6))
            {
                sht3x_compute_values(sensor, data);
                
                // DEBUG_PRINTF("%.2f C, %.2f F, %.2f", 
                //               sht3x_sensors[sensor].actual.temperature_c,
                //               sht3x_sensors[sensor].actual.temperature_f,
                //               sht3x_sensors[sensor].actual.humidity);

                if (sht3x_sensors[sensor].cb_function)
                    sht3x_sensors[sensor].cb_function(sensor,
                                                      sht3x_sensors[sensor].actual,
                                                      sht3x_sensors[sensor].average);
                    
            }
            vTaskDelay((sht3x_sensors[sensor].period-20) / portTICK_PERIOD_MS);
        }
        else
            vTaskDelay(sht3x_sensors[sensor].period / portTICK_PERIOD_MS);
    }
}


bool sht3x_init()
{
    for (int id=0; id < SHT3x_MAX_SENSORS; id++)
        sht3x_sensors[id].active = false;
        
    return true;
}


uint32_t sht3x_create_sensor(uint8_t bus, uint8_t addr)
{
    static uint32_t id;
    static char cb_task_name[20];
    
    // search for first free sensor data structure
    for (id=0; id < SHT3x_MAX_SENSORS; id++)
    {
        DEBUG_PRINTF("%s: id=%d active=%d", __FUNCTION__, id, sht3x_sensors[id].active);
        if (!sht3x_sensors[id].active)
            break;
    }
    DEBUG_PRINTF("%s: id=%d", __FUNCTION__, id);
    
    if (id == SHT3x_MAX_SENSORS)
    {
        DEBUG_PRINTF("%s: No more sensor data structures available.", __FUNCTION__);
        return -1;
    }
    
    // init sensor data structure
    sht3x_sensors[id].bus  = bus;
    sht3x_sensors[id].addr = addr;
    sht3x_sensors[id].period = 1000;
    sht3x_sensors[id].first_measurement = true;
    sht3x_sensors[id].average_weight = 0.2;
    sht3x_sensors[id].cb_function = NULL;
    sht3x_sensors[id].cb_task = NULL;

    // check whether sensor is available
    if (!sht3x_is_available(id))
        return -1;

    // clear sensor status register
    if (!sht3x_send_command(id, SHT3x_CLEAR_STATUS_CMD))
        return -1;

    snprintf (cb_task_name, 20, "sht3x_cb_task_%d", id);

    if (xTaskCreate (sht3x_callback_task, cb_task_name, 256, (void*)id, 
                     SHT3x_CB_TASK_PRIORITY, 
                     &sht3x_sensors[id].cb_task) != pdPASS)
    {
       vTaskDelete(sht3x_sensors[id].cb_task);
       printf("%s: Could not create task %s\n", __FUNCTION__, cb_task_name);
       return false;
    }

    sht3x_sensors[id].active = true;
    
    return id;
}


bool sht3x_delete_sensor(uint32_t sensor)
{
    if (!sht3x_valid_sensor(sensor, __FUNCTION__))
        return false;

    if (sht3x_sensors[sensor].cb_task)
        vTaskDelete(sht3x_sensors[sensor].cb_task);

    if (memset(&sht3x_sensors[sensor], 1, sizeof(sht3x_sensor_t)) == NULL)
    {
        DEBUG_PRINTF("%s: Could not initialize memory for sensor with id %d.", __FUNCTION__, sensor);
        return false;
    }
    
    return true;
}


bool sht3x_set_measurement_period (uint32_t sensor, uint32_t period)
{
    if (!sht3x_valid_sensor(sensor, __FUNCTION__))
        return false;

    if (period < 20)
        DEBUG_PRINTF("%s: Period of %d ms is less than the minimum period of 20 ms for sensor with id %d.", __FUNCTION__, period, sensor);

    sht3x_sensors[sensor].period = period;
    
    return true;
}


bool sht3x_set_callback_function (uint32_t sensor, sht3x_cb_function_t user_function)
{
    if (!sht3x_valid_sensor(sensor, __FUNCTION__))
        return false;
    
    sht3x_sensors[sensor].cb_function = user_function;
    
    DEBUG_PRINTF("%s: Set callback mode done.", __FUNCTION__);

    return false;
}


bool sht3x_get_values(uint32_t sensor, sht3x_value_set_t *actual, sht3x_value_set_t *average)
{
    if (!sht3x_valid_sensor(sensor, __FUNCTION__))
        return false;

    if (actual)  *actual  = sht3x_sensors[sensor].actual;
    if (average) *average = sht3x_sensors[sensor].average;

    return true;
}

bool sht3x_set_average_weight (uint32_t sensor, float weight)
{
    sht3x_sensors[sensor].first_measurement = true;
    sht3x_sensors[sensor].average_weight = weight;

    return true;
}


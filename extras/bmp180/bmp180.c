#include "bmp180.h"

#include "FreeRTOS.h"
#include "queue.h"
#include "task.h"

#include "espressif/esp_common.h"
#include "espressif/sdk_private.h"

#include "i2c/i2c.h"

#define BMP180_RX_QUEUE_SIZE      10
#define BMP180_TASK_PRIORITY      9

#define BMP180_DEVICE_ADDRESS     0x77

#define BMP180_VERSION_REG        0xD0
#define BMP180_CONTROL_REG        0xF4
#define BMP180_RESET_REG          0xE0
#define BMP180_OUT_MSB_REG        0xF6
#define BMP180_OUT_LSB_REG        0xF7
#define BMP180_OUT_XLSB_REG       0xF8

#define BMP180_CALIBRATION_REG    0xAA

//
// Values for BMP180_CONTROL_REG
//
#define BMP180_MEASURE_TEMP       0x2E
#define BMP180_MEASURE_PRESS_OSS0 0x34
#define BMP180_MEASURE_PRESS_OSS1 0x74
#define BMP180_MEASURE_PRESS_OSS2 0xB4
#define BMP180_MEASURE_PRESS_OSS3 0xF4

#define BMP180_DEFAULT_CONV_TIME  5000

//
// CHIP ID stored in BMP180_VERSION_REG
//
#define BMP180_CHIP_ID            0x55

//
// Reset value for BMP180_RESET_REG
//
#define BMP180_RESET_VALUE        0xB6


// BMP180_Event_Command
typedef struct
{
    uint8_t cmd;
    const xQueueHandle* resultQueue;
} bmp180_command_t;

// Just works due to the fact that xQueueHandle is a "void *"
static xQueueHandle bmp180_rx_queue = NULL;
static xTaskHandle  bmp180_task_handle = NULL;

// Calibration constants
static int16_t  AC1;
static int16_t  AC2;
static int16_t  AC3;
static uint16_t AC4;
static uint16_t AC5;
static uint16_t AC6;

static int16_t  B1;
static int16_t  B2;

static int16_t  MB;
static int16_t  MC;
static int16_t  MD;

//
// Forward declarations
//
static void bmp180_meassure(const bmp180_command_t* command);
static bool bmp180_informUser_Impl(const xQueueHandle* resultQueue, uint8_t cmd, bmp180_temp_t temperature, bmp180_press_t pressure);

// Set default implementation .. User gets result as bmp180_result_t event
bool (*bmp180_informUser)(const xQueueHandle* resultQueue, uint8_t cmd, bmp180_temp_t temperature, bmp180_press_t pressure) = bmp180_informUser_Impl;

// I2C Driver Task
static void bmp180_driver_task(void *pvParameters)
{
    // Data to be received from user
    bmp180_command_t current_command;

#ifdef BMP180_DEBUG
    // Wait for commands from the outside
    printf("%s: Started Task\n", __FUNCTION__);
#endif

    while(1)
    {
        // Wait for user to insert commands
        if (xQueueReceive(bmp180_rx_queue, &current_command, portMAX_DELAY) == pdTRUE)
        {
#ifdef BMP180_DEBUG
            printf("%s: Received user command %d 0x%p\n", __FUNCTION__, current_command.cmd, current_command.resultQueue);
#endif
            // use user provided queue
            if (current_command.resultQueue != NULL)
            {
                // Work on it ...
                bmp180_meassure(&current_command);
            }
        }
    }
}

static uint8_t bmp180_readRegister8(uint8_t reg)
{
    uint8_t r = 0;

    if (!i2c_slave_read(BMP180_DEVICE_ADDRESS, reg, &r, 1))
    {
        r = 0;
    }
    return r;
}


static int16_t bmp180_readRegister16(uint8_t reg)
{
    uint8_t d[] = { 0, 0 };
    int16_t r = 0;

    if (i2c_slave_read(BMP180_DEVICE_ADDRESS, reg, d, 2))
    {
        r = ((int16_t)d[0]<<8) | (d[1]);
    }
    return r;
}

static void bmp180_start_Messurement(uint8_t cmd)
{
    uint8_t d[] = { BMP180_CONTROL_REG, cmd };

    i2c_slave_write(BMP180_DEVICE_ADDRESS, d, 2);
}

static int16_t bmp180_getUncompensatedMessurement(uint8_t cmd)
{
    // Write Start Code into reg 0xF4 (Currently without oversampling ...)
    bmp180_start_Messurement((cmd==BMP180_TEMPERATURE)?BMP180_MEASURE_TEMP:BMP180_MEASURE_PRESS_OSS0);

    // Wait 5ms Datasheet states 4.5ms
    sdk_os_delay_us(BMP180_DEFAULT_CONV_TIME);

    return (int16_t)bmp180_readRegister16(BMP180_OUT_MSB_REG);
}

static void bmp180_fillInternalConstants(void)
{
    AC1 = bmp180_readRegister16(BMP180_CALIBRATION_REG+0);
    AC2 = bmp180_readRegister16(BMP180_CALIBRATION_REG+2);
    AC3 = bmp180_readRegister16(BMP180_CALIBRATION_REG+4);
    AC4 = bmp180_readRegister16(BMP180_CALIBRATION_REG+6);
    AC5 = bmp180_readRegister16(BMP180_CALIBRATION_REG+8);
    AC6 = bmp180_readRegister16(BMP180_CALIBRATION_REG+10);

    B1 = bmp180_readRegister16(BMP180_CALIBRATION_REG+12);
    B2 = bmp180_readRegister16(BMP180_CALIBRATION_REG+14);

    MB = bmp180_readRegister16(BMP180_CALIBRATION_REG+16);
    MC = bmp180_readRegister16(BMP180_CALIBRATION_REG+18);
    MD = bmp180_readRegister16(BMP180_CALIBRATION_REG+20);

#ifdef BMP180_DEBUG
    printf("%s: AC1:=%d AC2:=%d AC3:=%d AC4:=%u AC5:=%u AC6:=%u \n", __FUNCTION__, AC1, AC2, AC3, AC4, AC5, AC6);
    printf("%s: B1:=%d B2:=%d\n", __FUNCTION__, B1, B2);
    printf("%s: MB:=%d MC:=%d MD:=%d\n", __FUNCTION__, MB, MC, MD);
#endif
}

static bool bmp180_create_communication_queues()
{
    // Just create them once
    if (bmp180_rx_queue==NULL)
    {
        bmp180_rx_queue = xQueueCreate(BMP180_RX_QUEUE_SIZE, sizeof(bmp180_result_t));
    }

    return (bmp180_rx_queue!=NULL);
}

static bool bmp180_is_avaialble()
{
    return (bmp180_readRegister8(BMP180_VERSION_REG)==BMP180_CHIP_ID);
}

static bool bmp180_createTask()
{
    // We already have a task
    portBASE_TYPE x = pdPASS;

    if (bmp180_task_handle==NULL)
    {
        x = xTaskCreate(bmp180_driver_task, (signed char *)"bmp180_driver_task", 256, NULL, BMP180_TASK_PRIORITY, &bmp180_task_handle);
    }
    return (x==pdPASS);
}

static void bmp180_meassure(const bmp180_command_t* command)
{
    int32_t T, P;

    // Init result to 0
    T = P = 0;

    if (command->resultQueue != NULL)
    {
        int32_t UT, X1, X2, B5;

        //
        // Temperature is always needed ... Also required for pressure only
        //
        // Calculation taken from BMP180 Datasheet
        UT = (int32_t)bmp180_getUncompensatedMessurement(BMP180_TEMPERATURE);

        X1 = (UT - (int32_t)AC6) * ((int32_t)AC5) >> 15;
        X2 = ((int32_t)MC << 11) / (X1 + (int32_t)MD);
        B5 = X1 + X2;

        T = (B5 + 8) >> 4;

#ifdef BMP180_DEBUG
        printf("%s: T:= %ld.%d\n", __FUNCTION__, T/10, abs(T%10));
#endif

        // Do we also need pressure?
        if (command->cmd & BMP180_PRESSURE)
        {
            int32_t X3, B3, B6;
            uint32_t B4, B7, UP;

            UP = ((uint32_t)bmp180_getUncompensatedMessurement(BMP180_PRESSURE) & 0xFFFF);

            // Calculation taken from BMP180 Datasheet
            B6 = B5 - 4000;
            X1 = ((int32_t)B2 * ((B6 * B6) >> 12)) >> 11;
            X2 = ((int32_t)AC2 * B6) >> 11;
            X3 = X1 + X2;

            B3 = (((int32_t)AC1 * 4 + X3) + 2) >> 2;
            X1 = ((int32_t)AC3 * B6) >> 13;
            X2 = ((int32_t)B1 * ((B6 * B6) >> 12)) >> 16;
            X3 = ((X1 + X2) + 2) >> 2;
            B4 = ((uint32_t)AC4 * (uint32_t)(X3 + 32768)) >> 15;
            B7 = (UP - B3) * (uint32_t)(50000UL);

            if (B7 < 0x80000000)
            {
                P = (B7 * 2) / B4;
            }
            else
            {
                P = (B7 / B4) * 2;
            }

            X1 = (P >> 8) * (P >> 8);
            X1 = (X1 * 3038) >> 16;
            X2 = (-7357 * P) >> 16;
            P = P + ((X1 + X2 + (int32_t)3791) >> 4);

#ifdef BMP180_DEBUG
            printf("%s: P:= %ld\n", __FUNCTION__, P);
#endif
        }

        // Inform the user ...
        if (!bmp180_informUser(command->resultQueue, command->cmd, ((bmp180_temp_t)T)/10.0, (bmp180_press_t)P))
        {
            // Failed to send info to user
            printf("%s: Unable to inform user bmp180_informUser returned \"false\"\n", __FUNCTION__);
        }
    }
}

// Default user inform implementation
static bool bmp180_informUser_Impl(const xQueueHandle* resultQueue, uint8_t cmd, bmp180_temp_t temperature, bmp180_press_t pressure)
{
    bmp180_result_t result;

    result.cmd = cmd;
    result.temperature = temperature;
    result.pressure = pressure;

    return (xQueueSend(*resultQueue, &result, 0) == pdTRUE);
}

// Just init all needed queues
bool bmp180_init(uint8_t scl, uint8_t sda)
{
    // 1. Create required queues
    bool result = false;

    if (bmp180_create_communication_queues())
    {
        // 2. Init i2c driver
        i2c_init(scl, sda);

        // 3. Check for bmp180 ...
        if (bmp180_is_avaialble())
        {
            // 4. Init all internal constants ...
            bmp180_fillInternalConstants();

            // 5. Start driver task
            if (bmp180_createTask())
            {
                // We are finished
                result = true;
            }
        }
    }

    return result;
}

void bmp180_trigger_measurement(const xQueueHandle* resultQueue)
{
    bmp180_command_t c;

    c.cmd = BMP180_PRESSURE + BMP180_TEMPERATURE;
    c.resultQueue = resultQueue;

    xQueueSend(bmp180_rx_queue, &c, 0);
}


void bmp180_trigger_pressure_measurement(const xQueueHandle* resultQueue)
{
    bmp180_command_t c;

    c.cmd = BMP180_PRESSURE;
    c.resultQueue = resultQueue;

    xQueueSend(bmp180_rx_queue, &c, 0);
}

void bmp180_trigger_temperature_measurement(const xQueueHandle* resultQueue)
{
    bmp180_command_t c;

    c.cmd = BMP180_TEMPERATURE;
    c.resultQueue = resultQueue;

    xQueueSend(bmp180_rx_queue, &c, 0);
}

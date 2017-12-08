/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2015 Johan Kanflo (github.com/kanflo)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include "i2c.h"

#include <esp8266.h>
#include <espressif/esp_system.h>
#include <FreeRTOS.h>
#include <task.h>

//#define I2C_DEBUG true

#ifdef I2C_DEBUG
#define debug(fmt, ...) printf("%s: " fmt "\n", "I2C", ## __VA_ARGS__)
#else
#define debug(fmt, ...)
#endif

// The following array contains delay values for different frequencies.
// These were tuned to match the specified SCL frequency on average.
// The tuning was done using GCC 5.2.0 with -O2 optimization.
const static uint8_t i2c_freq_array[][2] = {
#if I2C_USE_GPIO16 == 1
    [I2C_FREQ_80K]   = {230, 107},
    [I2C_FREQ_100K]  = {180, 82},
    [I2C_FREQ_400K]  = {30, 7},
    [I2C_FREQ_500K]  = {20, 1},
    [I2C_FREQ_600K]  = {13, 0},
    [I2C_FREQ_800K]  = {5, 0},
    [I2C_FREQ_1000K] = {1, 0}
#else
    [I2C_FREQ_80K]   = {235, 112},
    [I2C_FREQ_100K]  = {185, 88},
    [I2C_FREQ_400K]  = {36, 13},
    [I2C_FREQ_500K]  = {25, 8},
    [I2C_FREQ_600K]  = {20, 5},
    [I2C_FREQ_800K]  = {11, 1},
    [I2C_FREQ_1000K] = {5, 0},
    [I2C_FREQ_1300K] = {1, 0}
#endif
};

// Bus settings
typedef struct i2c_bus_description
{
#if I2C_USE_GPIO16 == 1
  uint8_t g_scl_pin;     // SCL pin
  uint8_t g_sda_pin;     // SDA pin
#else
  uint32_t g_scl_mask;   // SCL pin mask
  uint32_t g_sda_mask;   // SDA pin mask
#endif
  i2c_freq_t frequency;  // Frequency
  uint8_t delay;
  bool started;
  bool flag;
  bool force;
  uint32_t clk_stretch;
} i2c_bus_description_t;

static i2c_bus_description_t i2c_bus[I2C_MAX_BUS];

inline bool i2c_status(uint8_t bus)
{
    return i2c_bus[bus].started;
}

int i2c_init(uint8_t bus, uint8_t scl_pin, uint8_t sda_pin, i2c_freq_t freq)
{
    if (bus >= I2C_MAX_BUS) {
        debug("Invalid bus");
        return -EINVAL;
    }

#if I2C_USE_GPIO16 == 1
    const int I2C_MAX_PIN = 16;
#else
    const int I2C_MAX_PIN = 15;
#endif

    if (scl_pin > I2C_MAX_PIN || sda_pin > I2C_MAX_PIN)
    {
        debug("Invalid GPIO number. All pins must be less than or equal to %d",
              I2C_MAX_PIN);
        return -EINVAL;
    }

    i2c_bus[bus].started = false;
    i2c_bus[bus].flag = false;
#if I2C_USE_GPIO16 == 1
    i2c_bus[bus].g_scl_pin = scl_pin;
    i2c_bus[bus].g_sda_pin = sda_pin;
#else
    i2c_bus[bus].g_scl_mask = BIT(scl_pin);
    i2c_bus[bus].g_sda_mask = BIT(sda_pin);
#endif

    i2c_bus[bus].frequency = freq;
    i2c_bus[bus].clk_stretch = I2C_DEFAULT_CLK_STRETCH;

    // Just to prevent these pins floating too much if not connected.
    gpio_set_pullup(scl_pin, 1, 1);
    gpio_set_pullup(sda_pin, 1, 1);

    gpio_enable(scl_pin, GPIO_OUT_OPEN_DRAIN);
    gpio_enable(sda_pin, GPIO_OUT_OPEN_DRAIN);

    // I2C bus idle state.
    gpio_write(scl_pin, 1);
    gpio_write(sda_pin, 1);

    // Prevent user, if frequency is high
    if (sdk_system_get_cpu_freq() == SYS_CPU_80MHZ)
        if (i2c_freq_array[i2c_bus[bus].frequency][1] == 0) {
            debug("Frequency not supported");
            return -ENOTSUP;
        }

    return 0;
}

void i2c_set_frequency(uint8_t bus, i2c_freq_t freq)
{
    i2c_bus[bus].frequency = freq;
}

void i2c_set_clock_stretch(uint8_t bus, uint32_t clk_stretch)
{
    i2c_bus[bus].clk_stretch = clk_stretch;
}

static inline void i2c_delay(uint8_t bus)
{
    uint32_t delay = i2c_bus[bus].delay;
    __asm volatile (
        "1: addi %0, %0, -1" "\n"
        "bnez %0, 1b" "\n"
    : "=a" (delay) : "0" (delay));
}

static inline bool read_scl(uint8_t bus)
{
#if I2C_USE_GPIO16 == 1
    return gpio_read(i2c_bus[bus].g_scl_pin);
#else
    return GPIO.IN & i2c_bus[bus].g_scl_mask;
#endif
}

static inline bool read_sda(uint8_t bus)
{
#if I2C_USE_GPIO16 == 1
    return gpio_read(i2c_bus[bus].g_sda_pin);
#else
    return GPIO.IN & i2c_bus[bus].g_sda_mask;
#endif
}

// Actively drive SCL signal low
static inline void clear_scl(uint8_t bus)
{
#if I2C_USE_GPIO16 == 1
    gpio_write(i2c_bus[bus].g_scl_pin, 0);
#else
    GPIO.OUT_CLEAR = i2c_bus[bus].g_scl_mask;
#endif
}

// Actively drive SDA signal low
static inline void clear_sda(uint8_t bus)
{
#if I2C_USE_GPIO16 == 1
    gpio_write(i2c_bus[bus].g_sda_pin, 0);
#else
    GPIO.OUT_CLEAR = i2c_bus[bus].g_sda_mask;
#endif
}

static inline void set_scl(uint8_t bus)
{
#if I2C_USE_GPIO16 == 1
    gpio_write(i2c_bus[bus].g_scl_pin, 1);
#else
    GPIO.OUT_SET = i2c_bus[bus].g_scl_mask;
#endif
}

static inline void set_sda(uint8_t bus)
{
#if I2C_USE_GPIO16 == 1
    gpio_write(i2c_bus[bus].g_sda_pin, 1);
#else
    GPIO.OUT_SET = i2c_bus[bus].g_sda_mask;
#endif
}

// Output start condition
void i2c_start(uint8_t bus)
{
    if (sdk_system_get_cpu_freq() == SYS_CPU_160MHZ)
       i2c_bus[bus].delay = i2c_freq_array[i2c_bus[bus].frequency][0];
    else
       i2c_bus[bus].delay = i2c_freq_array[i2c_bus[bus].frequency][1];

    if (i2c_bus[bus].started) { // if started, do a restart cond
        // Set SDA to 1
        set_sda(bus);
        i2c_delay(bus);
        uint32_t clk_stretch = i2c_bus[bus].clk_stretch;
        set_scl(bus);
        while (read_scl(bus) == 0 && clk_stretch--)
            ;
        // Repeated start setup time, minimum 4.7us
        i2c_delay(bus);
    }
    i2c_bus[bus].started = true;
    set_sda(bus);
    if (read_sda(bus) == 0) {
        debug("arbitration lost in i2c_start from bus %u", bus);
    }
    // SCL is high, set SDA from 1 to 0.
    clear_sda(bus);
    i2c_delay(bus);
    clear_scl(bus);
}

// Output stop condition
bool i2c_stop(uint8_t bus)
{
    uint32_t clk_stretch = i2c_bus[bus].clk_stretch;
    // Set SDA to 0
    clear_sda(bus);
    i2c_delay(bus);
    // Clock stretching
    set_scl(bus);
    while (read_scl(bus) == 0 && clk_stretch--)
        ;
    // Stop bit setup time, minimum 4us
    i2c_delay(bus);
    // SCL is high, set SDA from 0 to 1
    set_sda(bus);
    // additional delay before testing SDA value to avoid wrong state
    i2c_delay(bus); 
    if (read_sda(bus) == 0) {
        debug("arbitration lost in i2c_stop from bus %u", bus);
    }
    i2c_delay(bus);
    if (!i2c_bus[bus].started) {
        debug("bus %u link was break!", bus);
        return false; // If bus was stop in other way, the current transmission Failed
    }
    i2c_bus[bus].started = false;
    return true;
}

// Write a bit to I2C bus
static void i2c_write_bit(uint8_t bus, bool bit)
{
    uint32_t clk_stretch = i2c_bus[bus].clk_stretch;
    if (bit) {
        set_sda(bus);
    } else {
        clear_sda(bus);
    }
    i2c_delay(bus);
    // Clock stretching
    set_scl(bus);
    while (read_scl(bus) == 0 && clk_stretch--)
        ;
    // SCL is high, now data is valid
    // If SDA is high, check that nobody else is driving SDA
    if (bit && read_sda(bus) == 0) {
        debug("arbitration lost in i2c_write_bit from bus %u", bus);
    }
    i2c_delay(bus);
    clear_scl(bus);
}

// Read a bit from I2C bus
static bool i2c_read_bit(uint8_t bus)
{
    uint32_t clk_stretch = i2c_bus[bus].clk_stretch;
    bool bit;
    // Let the slave drive data
    set_sda(bus);
    i2c_delay(bus);
    set_scl(bus);
    // Clock stretching
    while (read_scl(bus) == 0 && clk_stretch--)
        ;
    // SCL is high, now data is valid
    bit = read_sda(bus);
    i2c_delay(bus);
    clear_scl(bus);
    return bit;
}

bool i2c_write(uint8_t bus, uint8_t byte)
{
    bool nack;
    uint8_t bit;
    for (bit = 0; bit < 8; bit++) {
        i2c_write_bit(bus, (byte & 0x80) != 0);
        byte <<= 1;
    }
    nack = i2c_read_bit(bus);
    return !nack;
}

uint8_t i2c_read(uint8_t bus, bool ack)
{
    uint8_t byte = 0;
    uint8_t bit;
    for (bit = 0; bit < 8; bit++) {
        byte = ((byte << 1)) | (i2c_read_bit(bus));
    }
    i2c_write_bit(bus, ack);
    return byte;
}

void i2c_force_bus(uint8_t bus, bool state)
{
    i2c_bus[bus].force = state;
}

static int i2c_bus_test(uint8_t bus)
{
    taskENTER_CRITICAL(); // To prevent task swaping after checking flag and before set it!
    bool status = i2c_bus[bus].flag; // get current status
    if (i2c_bus[bus].force) {
        i2c_bus[bus].flag = true; // force bus on
        taskEXIT_CRITICAL();
        if (status)
           i2c_stop(bus); //Bus was busy, stop it.
    }
    else {
        if (status) {
            taskEXIT_CRITICAL();
            debug("busy");
            taskYIELD(); // If bus busy, change task to try finish last com.
            return -EBUSY;  // If bus busy, inform user
        }
        else {
            i2c_bus[bus].flag = true; // Set Bus busy
            taskEXIT_CRITICAL();
        }
    }
    return 0;
}

int i2c_slave_write(uint8_t bus, uint8_t slave_addr, const uint8_t *data, const uint8_t *buf, uint32_t len)
{
    if (i2c_bus_test(bus))
        return -EBUSY;
    i2c_start(bus);
    if (!i2c_write(bus, slave_addr << 1))
        goto error;
    if (data != NULL)
        if (!i2c_write(bus, *data))
            goto error;
    while (len--) {
        if (!i2c_write(bus, *buf++))
            goto error;
    }
    if (!i2c_stop(bus))
        goto error;
    i2c_bus[bus].flag = false; // Bus free
    return 0;

error:
    debug("Bus %u Write Error", bus);
    i2c_stop(bus);
    i2c_bus[bus].flag = false; // Bus free
    return -EIO;
}

int i2c_slave_read(uint8_t bus, uint8_t slave_addr, const uint8_t *data, uint8_t *buf, uint32_t len)
{
    if (i2c_bus_test(bus))
        return -EBUSY;
    if (data != NULL) {
        i2c_start(bus);
        if (!i2c_write(bus, slave_addr << 1))
            goto error;
        if (!i2c_write(bus, *data))
            goto error;
    }
    i2c_start(bus);
    if (!i2c_write(bus, slave_addr << 1 | 1)) // Slave address + read
        goto error;
    while(len) {
        *buf = i2c_read(bus, len == 1);
        buf++;
        len--;
    }
    if (!i2c_stop(bus))
        goto error;
    i2c_bus[bus].flag = false; // Bus free
    return 0;

error:
    debug("Read Error");
    i2c_stop(bus);
    i2c_bus[bus].flag = false; // Bus free
    return -EIO;
}

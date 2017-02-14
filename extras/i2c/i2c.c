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

#include <esp8266.h>
#include <espressif/esp_misc.h> // sdk_os_delay_us
#include <espressif/esp_system.h>
#include "i2c.h"

//#define I2C_DEBUG true

#ifdef I2C_DEBUG
#define debug(fmt, ...) printf("%s: " fmt "\n", "I2C", ## __VA_ARGS__)
#else
#define debug(fmt, ...)
#endif

#define CLK_STRETCH  (10)

static bool started;
static bool flag;
static bool force;
static uint8_t freq ;
static uint8_t g_scl_pin;
static uint8_t g_sda_pin;

inline bool i2c_status(void)
{
    return started;
}

void i2c_init(uint8_t scl_pin, uint8_t sda_pin)
{
    started = false;
    flag = false ;
    g_scl_pin = scl_pin;
    g_sda_pin = sda_pin;

    // Just to prevent these pins floating too much if not connected.
    gpio_set_pullup(g_scl_pin, 1, 1);
    gpio_set_pullup(g_sda_pin, 1, 1);

    gpio_enable(g_scl_pin, GPIO_OUT_OPEN_DRAIN);
    gpio_enable(g_sda_pin, GPIO_OUT_OPEN_DRAIN);

    // I2C bus idle state.
    gpio_write(g_scl_pin, 1);
    gpio_write(g_sda_pin, 1);

    // Prevent user, if frequency is high
    if (sdk_system_get_cpu_freq() == SYS_CPU_80MHZ)
        if (I2C_CUSTOM_DELAY_80MHZ == 1)
            debug("Max frequency is 320Khz at 80MHz");

}

static inline void i2c_delay(void)
{
    uint32_t delay;
    if (freq == SYS_CPU_160MHZ)
    {
        __asm volatile (
            "movi %0, %1" "\n"
            "1: addi %0, %0, -1" "\n"
            "bnez %0, 1b" "\n"
        : "=a" (delay) : "i" (I2C_CUSTOM_DELAY_160MHZ));
    }
    else
    {
        __asm volatile (
            "movi %0, %1" "\n"
            "1: addi %0, %0, -1" "\n"
            "bnez %0, 1b" "\n"
        : "=a" (delay) : "i" (I2C_CUSTOM_DELAY_80MHZ));
    }
}

// Set SCL as input, allowing it to float high, and return current
// level of line, 0 or 1
static inline bool read_scl(void)
{
    gpio_write(g_scl_pin, 1);
    return gpio_read(g_scl_pin); // Clock high, valid ACK
}

// Set SDA as input, allowing it to float high, and return current
// level of line, 0 or 1
static inline bool read_sda(void)
{
    gpio_write(g_sda_pin, 1);
    // TODO: Without this delay we get arbitration lost in i2c_stop
    i2c_delay();
    return gpio_read(g_sda_pin); // Clock high, valid ACK
}

// Actively drive SCL signal low
static inline void clear_scl(void)
{
    gpio_write(g_scl_pin, 0);
}

// Actively drive SDA signal low
static inline void clear_sda(void)
{
    gpio_write(g_sda_pin, 0);
}

// Output start condition
void i2c_start(void)
{
    uint32_t clk_stretch = CLK_STRETCH;
    freq = sdk_system_get_cpu_freq();
    if (started) { // if started, do a restart cond
        // Set SDA to 1
        (void) read_sda();
        i2c_delay();
        while (read_scl() == 0 && clk_stretch--) ;
        // Repeated start setup time, minimum 4.7us
        i2c_delay();
    }
    started = true;
    if (read_sda() == 0) {
        debug("arbitration lost in i2c_start");
    }
    // SCL is high, set SDA from 1 to 0.
    clear_sda();
    i2c_delay();
    clear_scl();
}

// Output stop condition
bool i2c_stop(void)
{
    uint32_t clk_stretch = CLK_STRETCH;
    // Set SDA to 0
    clear_sda();
    i2c_delay();
    // Clock stretching
    while (read_scl() == 0 && clk_stretch--) ;
    // Stop bit setup time, minimum 4us
    i2c_delay();
    // SCL is high, set SDA from 0 to 1
    if (read_sda() == 0) {
        debug("arbitration lost in i2c_stop");
    }
    i2c_delay();
    if (!started) {
        debug("link was break!");
        return false ; //If bus was stop in other way, the current transmission Failed
    }
    started = false;
    return true;
}

// Write a bit to I2C bus
static void i2c_write_bit(bool bit)
{
    uint32_t clk_stretch = CLK_STRETCH;
    if (bit) {
        (void) read_sda();
    } else {
        clear_sda();
    }
    i2c_delay();
    // Clock stretching
    while (read_scl() == 0 && clk_stretch--) ;
    // SCL is high, now data is valid
    // If SDA is high, check that nobody else is driving SDA
    if (bit && read_sda() == 0) {
        debug("arbitration lost in i2c_write_bit");
    }
    i2c_delay();
    clear_scl();
}

// Read a bit from I2C bus
static bool i2c_read_bit(void)
{
    uint32_t clk_stretch = CLK_STRETCH;
    bool bit;
    // Let the slave drive data
    (void) read_sda();
    i2c_delay();
    // Clock stretching
    while (read_scl() == 0 && clk_stretch--) ;
    // SCL is high, now data is valid
    bit = read_sda();
    i2c_delay();
    clear_scl();
    return bit;
}

bool i2c_write(uint8_t byte)
{
    bool nack;
    uint8_t bit;
    for (bit = 0; bit < 8; bit++) {
        i2c_write_bit((byte & 0x80) != 0);
        byte <<= 1;
    }
    nack = i2c_read_bit();
    return !nack;
}

uint8_t i2c_read(bool ack)
{
    uint8_t byte = 0;
    uint8_t bit;
    for (bit = 0; bit < 8; bit++) {
        byte = (byte << 1) | i2c_read_bit();
    }
    i2c_write_bit(ack);
    return byte;
}

void i2c_force_bus(bool state)
{
    force = state ;
}

static int i2c_bus_test()
{
    taskENTER_CRITICAL(); // To prevent task swaping after checking flag and before set it!
    bool status = flag ; // get current status
    if(force)
    {
        flag = true ; // force bus on
        taskEXIT_CRITICAL();
        if(status)
           i2c_stop(); //Bus was busy, stop it.
    }
    else
    {
        if (status)
        {
            taskEXIT_CRITICAL();
            debug("busy");
            taskYIELD(); // If bus busy, change task to try finish last com.
            return -EBUSY ;  // If bus busy, inform user
        }
        else
        {
            flag = true ; // Set Bus busy
            taskEXIT_CRITICAL();
        }
    }
    return 0 ;
}

int i2c_slave_write(uint8_t slave_addr, const uint8_t *data, const uint8_t *buf, uint32_t len)
{
    if(i2c_bus_test())
        return -EBUSY ;
    i2c_start();
    if (!i2c_write(slave_addr << 1))
        goto error;
    if(data != NULL)
        if (!i2c_write(*data))
            goto error;
    while (len--) {
        if (!i2c_write(*buf++))
            goto error;
    }
    if (!i2c_stop())
        goto error;
    flag = false ; // Bus free
    return 0;

    error:
    debug("Write Error");
    i2c_stop();
    flag = false ; // Bus free
    return -EIO;
}

int i2c_slave_read(uint8_t slave_addr, const uint8_t *data, uint8_t *buf, uint32_t len)
{
    if(i2c_bus_test())
        return -EBUSY ;
    if(data != NULL) {
        i2c_start();
        if (!i2c_write(slave_addr << 1))
            goto error;
        if (!i2c_write(*data))
            goto error;
        if (!i2c_stop())
            goto error;
    }
    i2c_start();
    if (!i2c_write(slave_addr << 1 | 1)) // Slave address + read
        goto error;
    while(len) {
        *buf = i2c_read(len == 1);
        buf++;
        len--;
    }
    if (!i2c_stop())
        goto error;
    flag = false ; // Bus free
    return 0;

    error:
    debug("Read Error");
    i2c_stop();
    flag = false ; // Bus free
    return -EIO;
}

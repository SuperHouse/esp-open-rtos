/*
 * Driver for DS1307 RTC
 *
 * Part of esp-open-rtos
 * Copyright (C) 2016 Ruslan V. Uss <unclerus@gmail.com>
 * BSD Licensed as described in the file LICENSE
 */
#ifndef EXTRAS_DS1307_H_
#define EXTRAS_DS1307_H_

#include <stdint.h>
#include <stdbool.h>
#include <time.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Squarewave frequency
 */
typedef enum _ds1307_squarewave_freq_t
{
    DS1307_1HZ = 0, //!< 1 Hz
    DS1307_4096HZ,  //!< 4096 Hz
    DS1307_8192HZ,  //!< 8192 Hz
    DS1307_32768HZ  //!< 32768 Hz
} ds1307_squarewave_freq_t;

/**
 * \brief Start/stop clock
 * \param start Start clock if true
 */
void ds1307_start(bool start);

/**
 * \brief Get current clock state
 * \return true if clock running
 */
bool ds1307_is_running();

/**
 * \brief Get current time
 * \param time Pointer to the time struct to fill
 */
void ds1307_get_time(struct tm *time);

/**
 * \brief Set time to RTC
 * \param time Pointer to the time struct
 */
void ds1307_set_time(const struct tm *time);

/**
 * \brief Enable or disable square-wave oscillator output
 * \param enable Enable oscillator if true
 */
void ds1307_enable_squarewave(bool enable);

/**
 * \brief Get square-wave oscillator output
 * \return true if square-wave oscillator enabled
 */
bool ds1307_is_squarewave_enabled();

/**
 * \brief Set square-wave oscillator frequency
 * \param freq Frequency
 */
void ds1307_set_squarewave_freq(ds1307_squarewave_freq_t freq);

/**
 * \brief Get current square-wave oscillator frequency
 * \return Frequency
 */
ds1307_squarewave_freq_t ds1307_get_squarewave_freq();

/**
 * \brief Get current output level of the SQW/OUT pin
 * \return true if high
 */
bool ds1307_get_output();

/**
 * \brief Set output level of the SQW/OUT pin
 * Set output level if square-wave output is disabled
 * \param value High level if true
 */
void ds1307_set_output(bool value);

/**
 * \brief Read RAM contents into the buffer
 * \param offset Start byte, 0..55
 * \param buf Buffer
 * \param len Bytes to read, 1..56
 * \return false if error occured
 */
bool ds1307_read_ram(uint8_t offset, uint8_t *buf, uint8_t len);

/**
 * \brief Write buffer to RTC RAM
 * \param offset Start byte, 0..55
 * \param buf Buffer
 * \param len Bytes to write, 1..56
 * \return false if error occured
 */
bool ds1307_write_ram(uint8_t offset, uint8_t *buf, uint8_t len);


#ifdef __cplusplus
}
#endif

#endif /* EXTRAS_DS1307_H_ */

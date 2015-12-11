/* Implementation of PWM support for the Espressif SDK.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Guillem Pascual Ginovart (https://github.com/gpascualg)
 * Copyright (C) 2015 Javier Cardona (https://github.com/jcard0na)
 * BSD Licensed as described in the file LICENSE
 */
#include <stdint.h>

#define MAX_PWM_PINS    8

void pwm_init(uint8_t npins, uint8_t* pins);
void pwm_set_freq(uint16_t freq);
void pwm_set_duty(uint16_t duty);

void pwm_restart();
void pwm_start();
void pwm_stop();

/* Implementation of PWM support for the Espressif SDK.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Guillem Pascual Ginovart (https://github.com/gpascualg)
 * Copyright (C) 2015 Javier Cardona (https://github.com/jcard0na)
 * BSD Licensed as described in the file LICENSE
 */
#ifndef EXTRAS_PWM_H_
#define EXTRAS_PWM_H_

#include <stdint.h>

#define MAX_PWM_PINS    8

#ifdef __cplusplus
extern "C" {
#endif

void pwm_init(uint8_t npins, uint8_t* pins);
void pwm_set_freq(uint16_t freq);
void pwm_set_duty(uint16_t duty);

void pwm_restart();
void pwm_start();
void pwm_stop();

#ifdef __cplusplus
}
#endif

#endif /* EXTRAS_PWM_H_ */

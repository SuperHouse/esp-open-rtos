/* Implementation of HW PWM support.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2018 ourairquality (https://github.com/ourairquality)
 * Copyright (C) 2018 Zaltora (https://github.com/Zaltora)
 * BSD Licensed as described in the file LICENSE
 */
#ifndef EXTRAS_HW_PWM_H_
#define EXTRAS_HW_PWM_H_

#include <stdint.h>

#define MAX_PWM_PINS    8

#ifdef __cplusplus
extern "C" {
#endif

void hw_pwm_init(uint8_t npins, const uint8_t* pins);
void hw_pwm_set_prescale(uint8_t prescale);
void hw_pwm_set_duty(uint8_t duty);

void hw_pwm_restart();
void hw_pwm_start();
void hw_pwm_stop();

#ifdef __cplusplus
}
#endif

#endif /* EXTRAS_HW_PWM_H_ */

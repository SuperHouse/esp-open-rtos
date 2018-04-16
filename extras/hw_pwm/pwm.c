/* Implementation of HW PWM support.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2018 ourairquality (https://github.com/ourairquality)
 * Copyright (C) 2018 Zaltora (https://github.com/Zaltora)
 * BSD Licensed as described in the file LICENSE
 */
#include "pwm.h"

#include <espressif/esp_common.h>
#include <esp8266.h>


#ifdef PWM_DEBUG
#define debug(fmt, ...) printf("%s: " fmt "\n", "HW_PWM", ## __VA_ARGS__)
#else
#define debug(fmt, ...)
#endif

typedef struct pwmInfoDefinition
{
    uint8_t running;
    uint8_t preScale;
    uint8_t dutyCycle;
    bool output;

    /* private */
    uint8_t usedPins;
    uint8_t pins[8];
} PWMInfo;

static PWMInfo pwmInfo;

void hw_pwm_init(uint8_t npins, const uint8_t* pins)
{
    /* Assert number of pins is correct */
    if (npins > MAX_PWM_PINS)
    {
        debug("Incorrect number of PWM pins (%d)\n", npins);
        return;
    }

    /* Save pins information */
    pwmInfo.usedPins = npins;

    for (uint8_t i = 0 ; i < npins; ++i)
    {
        pwmInfo.pins[i] = pins[i];
        /* configure GPIOs */
        gpio_enable(pins[i], GPIO_OUTPUT);
    }

    /* Set output to LOW */
    hw_pwm_stop();

    /* Flag not running */
    pwmInfo.running = 0;
}

//FIXME: Need Confirmation
// Freq = (80,000,000/prescale) * (target / 256) HZ           (0   < target < 128)
// Freq = (80,000,000/prescale) * ((256 - target) / 256)  HZ  (128 < target < 256)
void hw_pwm_set_prescale(uint8_t prescale)
{
    //TODO: Add a freq/prescale converter
    pwmInfo.preScale = prescale;
    debug("Set Prescale: %u",pwmInfo.preScale);
}

void hw_pwm_set_duty(uint8_t duty)
{
    pwmInfo.dutyCycle = duty;
    if (duty == 0 || duty == UINT8_MAX)
    {
      pwmInfo.output = (duty == UINT8_MAX);
    }
    debug("Duty set at %u",pwmInfo.dutyCycle);
    hw_pwm_restart();
}

void hw_pwm_restart()
{
    if (pwmInfo.running)
    {
        hw_pwm_stop();
        hw_pwm_start();
    }
}

void hw_pwm_start()
{
    if (pwmInfo.dutyCycle > 0 && pwmInfo.dutyCycle < UINT8_MAX)
    {
        for (uint8_t i = 0; i < pwmInfo.usedPins; ++i)
        {
            SET_MASK_BITS(GPIO.CONF[pwmInfo.pins[i]], GPIO_CONF_SOURCE_PWM);
        }
        GPIO.PWM = GPIO_PWM_ENABLE | (pwmInfo.preScale << 8) | pwmInfo.dutyCycle;
    }
    else
    {
      for (uint8_t i = 0; i < pwmInfo.usedPins; ++i)
      {
        gpio_write(pwmInfo.pins[i], pwmInfo.output );
      }       
    }
    debug("start");
    pwmInfo.running = 1;
}

void hw_pwm_stop()
{
    for (uint8_t i = 0; i < pwmInfo.usedPins; ++i)
    {
      CLEAR_MASK_BITS(GPIO.CONF[pwmInfo.pins[i]], GPIO_CONF_SOURCE_PWM);
      gpio_write(pwmInfo.pins[i], false);
    }       
    debug("stop");
    pwmInfo.running = 0;
}

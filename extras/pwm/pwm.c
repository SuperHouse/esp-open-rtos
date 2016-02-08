/* Implementation of PWM support for the Espressif SDK.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Guillem Pascual Ginovart (https://github.com/gpascualg)
 * Copyright (C) 2015 Javier Cardona (https://github.com/jcard0na)
 * BSD Licensed as described in the file LICENSE
 */
#include "pwm.h"

#include <espressif/esp_common.h>
#include <espressif/sdk_private.h>
#include <FreeRTOS.h>
#include <esp8266.h>

typedef struct PWMPinDefinition
{
    uint8_t pin;
    uint8_t divider;
} PWMPin;

typedef enum {
    PERIOD_ON   = 0,
    PERIOD_OFF  = 1
} pwm_step_t;


typedef struct pwmInfoDefinition
{
    uint8_t running;

    uint16_t freq;
    uint16_t dutyCicle;

    /* private */
    uint32_t _maxLoad;
    uint32_t _onLoad;
    uint32_t _offLoad;
    pwm_step_t _step;

    uint16_t usedPins;
    PWMPin pins[8];
} PWMInfo;

static PWMInfo pwmInfo;

static void frc1_interrupt_handler(void)
{
    uint8_t i = 0;
    bool out = true;
    uint32_t load = pwmInfo._onLoad;
    pwm_step_t step = PERIOD_ON;

    if (pwmInfo._step == PERIOD_ON)
    {
        out = false;
        load = pwmInfo._offLoad;
        step = PERIOD_OFF;
    }

    for (; i < pwmInfo.usedPins; ++i)
    {
        gpio_write(pwmInfo.pins[i].pin, out);
    }

    timer_set_load(FRC1, load);
    pwmInfo._step = step;
}

void pwm_init(uint8_t npins, uint8_t* pins)
{
    /* Assert number of pins is correct */
    if (npins > MAX_PWM_PINS)
    {
        printf("Incorrect number of PWM pins (%d)\n", npins);
        return;
    }

    /* Initialize */
    pwmInfo._maxLoad = 0;
    pwmInfo._onLoad = 0;
    pwmInfo._offLoad = 0;
    pwmInfo._step = PERIOD_ON;

    /* Save pins information */
    pwmInfo.usedPins = npins;

    uint8_t i = 0;
    for (; i < npins; ++i)
    {
        pwmInfo.pins[i].pin = pins[i];

        /* configure GPIOs */
        gpio_enable(pins[i], GPIO_OUTPUT);
    }

    /* Stop timers and mask interrupts */
    pwm_stop();

    /* set up ISRs */
    _xt_isr_attach(INUM_TIMER_FRC1, frc1_interrupt_handler);

    /* Flag not running */
    pwmInfo.running = 0;
}

void pwm_set_freq(uint16_t freq)
{
    pwmInfo.freq = freq;

    /* Stop now to avoid load being used */
    if (pwmInfo.running)
    {
        pwm_stop();
        pwmInfo.running = 1;
    }

    timer_set_frequency(FRC1, freq);
    pwmInfo._maxLoad = timer_get_load(FRC1);

    if (pwmInfo.running)
    {
        pwm_start();
    }
}

void pwm_set_duty(uint16_t duty)
{
    bool output;

    pwmInfo.dutyCicle = duty;
    if (duty > 0 && duty < UINT16_MAX) {
        pwm_restart();
	return;
    }

    // 0% and 100% duty cycle are special cases: constant output.
    pwm_stop();
    pwmInfo.running = 1;
    output = (duty == UINT16_MAX);
    for (uint8_t i = 0; i < pwmInfo.usedPins; ++i)
    {
	gpio_write(pwmInfo.pins[i].pin, output);
    }
}

void pwm_restart()
{
    if (pwmInfo.running)
    {
        pwm_stop();
        pwm_start();
    }
}

void pwm_start()
{
    pwmInfo._onLoad = pwmInfo.dutyCicle * pwmInfo._maxLoad / UINT16_MAX;
    pwmInfo._offLoad = pwmInfo._maxLoad - pwmInfo._onLoad;
    pwmInfo._step = PERIOD_ON;

    // Trigger ON
    uint8_t i = 0;
    for (; i < pwmInfo.usedPins; ++i)
    {
        gpio_write(pwmInfo.pins[i].pin, true);
    }

    timer_set_load(FRC1, pwmInfo._onLoad);
    timer_set_reload(FRC1, false);
    timer_set_interrupts(FRC1, true);
    timer_set_run(FRC1, true);

    pwmInfo.running = 1;
}

void pwm_stop()
{
    timer_set_interrupts(FRC1, false);
    timer_set_run(FRC1, false);
    pwmInfo.running = 0;
}

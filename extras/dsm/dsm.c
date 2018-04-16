/* Implementation of Delta-Sigma modulator support.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2018 ourairquality (https://github.com/ourairquality)
 * Copyright (C) 2018 Zaltora (https://github.com/Zaltora)
 * BSD Licensed as described in the file LICENSE
 */
#include "dsm.h"

#include <espressif/esp_common.h>
#include <esp8266.h>


#ifdef DSM_DEBUG
#define debug(fmt, ...) printf("%s: " fmt "\n", "DSM", ## __VA_ARGS__)
#else
#define debug(fmt, ...)
#endif

typedef struct dsmInfoDefinition
{
    uint8_t running;
    uint8_t preScale;
    uint8_t dutyCycle;
    bool output;

    /* private */
    uint8_t usedPins;
    uint8_t pins[8];
} DSMInfo;

static DSMInfo dsmInfo;

void dsm_init(uint8_t npins, const uint8_t* pins)
{
    /* Assert number of pins is correct */
    if (npins > MAX_DSM_PINS)
    {
        debug("Incorrect number of PWM pins (%d)\n", npins);
        return;
    }

    /* Save pins information */
    dsmInfo.usedPins = npins;

    for (uint8_t i = 0 ; i < npins; ++i)
    {
        dsmInfo.pins[i] = pins[i];
        /* configure GPIOs */
        gpio_enable(pins[i], GPIO_OUTPUT);
    }

    /* Set output to LOW */
    dsm_stop();

    /* Flag not running */
    dsmInfo.running = 0;
}

// Freq = (80,000,000/prescale) * (target / 256) HZ           (0   < target < 128)
// Freq = (80,000,000/prescale) * ((256 - target) / 256)  HZ  (128 < target < 256)
void dsm_set_prescale(uint8_t prescale)
{
    //TODO: Add a freq/prescale converter
    dsmInfo.preScale = prescale;
    debug("Set Prescale: %u",dsmInfo.preScale);
}

// Freq = (80,000,000/prescale) * (target / 256) HZ           (0   < target < 128)
// Freq = (80,000,000/prescale) * ((256 - target) / 256)  HZ  (128 < target < 256)
void dsm_set_target(uint8_t target)
{
    dsmInfo.dutyCycle = target;
    if (target == 0 || target == UINT8_MAX)
    {
      dsmInfo.output = (target == UINT8_MAX);
    }
    debug("Duty set at %u",dsmInfo.dutyCycle);
    if (dsmInfo.running)
    {
        dsm_start();
    }
}

void dsm_start()
{
    if (dsmInfo.dutyCycle > 0 && dsmInfo.dutyCycle < UINT8_MAX)
    {
        for (uint8_t i = 0; i < dsmInfo.usedPins; ++i)
        {
            SET_MASK_BITS(GPIO.CONF[dsmInfo.pins[i]], GPIO_CONF_SOURCE_PWM);
        }
        GPIO.PWM = GPIO_PWM_ENABLE | (dsmInfo.preScale << 8) | dsmInfo.dutyCycle;
    }
    else
    {
      for (uint8_t i = 0; i < dsmInfo.usedPins; ++i)
      {
        gpio_write(dsmInfo.pins[i], dsmInfo.output );
      }       
    }
    debug("start");
    dsmInfo.running = 1;
}

void dsm_stop()
{
    for (uint8_t i = 0; i < dsmInfo.usedPins; ++i)
    {
      CLEAR_MASK_BITS(GPIO.CONF[dsmInfo.pins[i]], GPIO_CONF_SOURCE_PWM);
      gpio_write(dsmInfo.pins[i], false);
    }       
    debug("stop");
    dsmInfo.running = 0;
}

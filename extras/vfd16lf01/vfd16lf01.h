#ifndef DRIVER_VFD16LF01_H_
#define DRIVER_VFD16LF01_H_

#include "FreeRTOS.h"

// Comment this out, if your display 
// is connected directly to esp module,
// otherwise all signals will be inverted.
#define VIA_INVERTERS

void vfd_16lf01_init(uint8_t clk, uint8_t rst, uint8_t dat, uint8_t digits, uint8_t brightness);
void vfd_16lf01_set_brightness(uint8_t amount, uint8_t clk, uint8_t data);
void vfd_16lf01_set_cursor(uint8_t pos, uint8_t clk, uint8_t data);
void vfd_16lf01_print(char *chp, uint8_t clk, uint8_t data);
void vfd_16lf01_clear(uint8_t clk, uint8_t data);
void vfd_16lf01_home(uint8_t clk, uint8_t data);
void vfd_16lf01_reset(uint8_t rst);

#endif

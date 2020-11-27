/*
 * Example of using MAX7219 driver with 8x8 LED Matrix displays
 *
 * MAX7219 driver uses the hardware SPI bus, so connect with pinout:
 *  DIN -> HSPID/HMOSI
 *  CS -> HSPICS/HCS
 *  CLK -> HSPICLK/HSCLK
 */
#include <esp/uart.h>
#include <espressif/esp_common.h>
#include <stdio.h>
#include <max7219/max7219.h>
#include <FreeRTOS.h>
#include <task.h>

#include "./digit_font.h"

#define CS_PIN 15
#define DELAY 1000

static max7219_display_t disp = {
  .cs_pin       = CS_PIN,
  .digits       = 8,
  .cascade_size = 4,
  .mirrored     = false
};

void user_init(void) {
  uart_set_baud(0, 115200);
  printf("SDK version:%s\n", sdk_system_get_sdk_version());

  max7219_init(&disp);
  //max7219_set_decode_mode(&disp, true);

  uint8_t counter = 0;
  while (true) {
    max7219_clear(&disp);

    max7219_draw_image_8x8(&disp, 0, DIGITS[counter % 10]);
    max7219_draw_image_8x8(&disp, 1, DIGITS[(counter+1) % 10]);
    max7219_draw_image_8x8(&disp, 2, DIGITS[(counter+2) % 10]);
    max7219_draw_image_8x8(&disp, 3, DIGITS[(counter+3) % 10]);

    vTaskDelay(DELAY / portTICK_PERIOD_MS);

    counter++;
  }
}

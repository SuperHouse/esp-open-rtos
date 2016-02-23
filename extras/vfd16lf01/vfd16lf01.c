#include "vfd16lf01.h"
#include <espressif/esp_misc.h> // sdk_os_delay_us

#define VFD_CMD_BUFFER_POINTER 0b10100000
#define VFD_CMD_DIGIT_COUNTER 0b11000000
#define VFD_CMD_MASK 0b00001111
#define VFD_CMD_BRIGHTNESS 0b11100000
#define VFD_CMD_BRIGHTNESS_MASK 0b00011111

#define bit_read(value, bit) (((value) >> (bit)) & 0x01)

static uint8_t _digits_count;

static void vfd_16lf01_command(uint8_t payload, uint8_t clk, uint8_t data){
  static int8_t i=0;
  // If you notice any strange issue with displayed payload
  // please increase all delay value to 1~2ms.
#ifdef VIA_INVERTERS
  for (i=7; i>=0; i--) {
    if (bit_read(payload, i)){
      gpio_write(data, 0);
    } else {
      gpio_write(data, 1);
    }

    gpio_write(clk, 0);
    sdk_os_delay_us(500);
    gpio_write(clk, 1);
    sdk_os_delay_us(500); 
    gpio_write(clk, 0);
    // Internal processing time (50us)
    sdk_os_delay_us(50);
  }
#else
  for (i=7; i>=0; i--) {
    if (bit_read(payload, i)){
      gpio_write(data, 1);
    } else {
      gpio_write(data, 0);
    }

    gpio_write(clk, 1);
    sdk_os_delay_us(500);
    gpio_write(clk, 0);
    sdk_os_delay_us(500); 
    gpio_write(clk, 1);
    // Internal processing time (50us)
    sdk_os_delay_us(50);
  }  
#endif
}

// Set number of digits to control.
static void vfd_16lf01_set_digits_count(uint8_t digits, uint8_t clk, uint8_t data) {
  if (digits > 16) {
    digits = 16;
  }
  
  _digits_count = digits;
  digits &= VFD_CMD_MASK;
  vfd_16lf01_command(VFD_CMD_DIGIT_COUNTER | digits, clk, data);
}

// Write a char on the display
static inline uint8_t vfd_16lf01_write(uint8_t _char, uint8_t clk, uint8_t data) {
  // First set of charmap (letters ad some symbols)
  if (_char >= 64 && _char <= 95) {
    vfd_16lf01_command(_char - 64, clk, data);
  }
  // Second set of charmap (numbers and some symbols)
  else if (_char >= 32 && _char <= 63) {
    vfd_16lf01_command(_char, clk, data);
  }
  // Lower case letters
  else if (_char >= 97 && _char <= 122) {
    vfd_16lf01_command(_char - 96, clk, data);
  }
  return 1;
}

// Reset device.
void vfd_16lf01_reset(uint8_t rst){
#ifdef VIA_INVERTERS
  gpio_write(rst, 1);
  sdk_os_delay_us(500);
  gpio_write(rst, 0);
  sdk_os_delay_us(500);
#else
  gpio_write(rst, 0);
  sdk_os_delay_us(500);
  gpio_write(rst, 1);
  sdk_os_delay_us(500);
#endif
}

// Initialize device.
void vfd_16lf01_init(uint8_t clk, uint8_t rst, uint8_t data, uint8_t digits, uint8_t brightness) {
  gpio_enable(clk, GPIO_OUTPUT);
  gpio_enable(rst, GPIO_OUTPUT);
  gpio_enable(data, GPIO_OUTPUT);

  vfd_16lf01_reset(rst);
  vfd_16lf01_set_digits_count(digits, clk, data);//16

  vfd_16lf01_clear(clk, data);
  vfd_16lf01_set_brightness(brightness, clk, data);//31
}

// Set buffer pointer position.
void vfd_16lf01_set_cursor(uint8_t pos, uint8_t clk, uint8_t data) {
  if (pos > 15) {
    pos = 15;
  }
  
  // First digit value is B1111, from second start from 0
  if (pos == 0) {
    pos = 0b1111;
  }
  else {
    pos--;
  }
  
  pos &= VFD_CMD_MASK;
  vfd_16lf01_command(VFD_CMD_BUFFER_POINTER | pos, clk, data);
}

// Set display brightness, from 0 to 31.
void vfd_16lf01_set_brightness(uint8_t amount, uint8_t clk, uint8_t data) {
  if (amount > 31) {
    amount = 31;
  }
  amount &= VFD_CMD_BRIGHTNESS_MASK;
  vfd_16lf01_command(VFD_CMD_BRIGHTNESS | amount, clk, data);
}


// Return to position 1
void vfd_16lf01_home(uint8_t clk, uint8_t data) { 
  vfd_16lf01_set_cursor(0, clk, data);
}

// Blank the display by setting up to 16 spaces
void vfd_16lf01_clear(uint8_t clk, uint8_t data) {
  static uint8_t i = 0;
  vfd_16lf01_set_cursor(0, clk, data);
  for (i=0; i<_digits_count; i++) {
    vfd_16lf01_write(' ', clk, data);
  }
}

void vfd_16lf01_print(char *chp, uint8_t clk, uint8_t data) {
  uint8_t i = 0;

  vfd_16lf01_home(clk, data);

  while (*chp){
     vfd_16lf01_write(*chp++, clk, data);
     i++;
  }

  // Clear the rest cells that can display old characters.
  for (;i < _digits_count; i++) {
    vfd_16lf01_write(' ', clk, data);
  }
}
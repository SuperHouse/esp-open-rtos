/**
 * The MIT License (MIT)
 *
 * Copyright (c) 2016 sheinz (https://github.com/sheinz)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
#ifndef __WS2812_I2S_H__
#define __WS2812_I2S_H__

#include <stdint.h>
#include <stdbool.h>

#ifdef	__cplusplus
extern "C" {
#endif

typedef union {
    struct {
        uint8_t blue; //LSB
        uint8_t green;
        uint8_t red;
        uint8_t white;
    };
    uint32_t color; // 0xWWRRGGBB
} ws2812_pixel_t;

typedef enum {
  PIXEL_RGB = 12,
  PIXEL_RGBW = 16
} pixeltype_t;

#define I2S_COLOR_PROFILE_N_RGB 1
#define I2S_COLOR_PROFILE_N_RBG 2
#define I2S_COLOR_PROFILE_N_GBR 3
#define I2S_COLOR_PROFILE_N_GRB 4
#define I2S_COLOR_PROFILE_N_BGR 5
#define I2S_COLOR_PROFILE_N_BRG 6

#ifndef I2S_COLOR_PROFILE

#if defined(I2S_COLOR_PROFILE_BRG)
#define I2S_COLOR_PROFILE I2S_COLOR_PROFILE_N_BRG
#elif defined(I2S_COLOR_PROFILE_RBG)
#define I2S_COLOR_PROFILE I2S_COLOR_PROFILE_N_RBG
#elif defined(I2S_COLOR_PROFILE_GBR)
#define I2S_COLOR_PROFILE I2S_COLOR_PROFILE_N_GBR
#elif defined(I2S_COLOR_PROFILE_RGB)
#define I2S_COLOR_PROFILE I2S_COLOR_PROFILE_N_RGB
#elif defined(I2S_COLOR_PROFILE_BGR)
#define I2S_COLOR_PROFILE I2S_COLOR_PROFILE_N_BGR
#else
#define I2S_COLOR_PROFILE I2S_COLOR_PROFILE_N_GRB
#endif

#endif

#if I2S_COLOR_PROFILE == I2S_COLOR_PROFILE_N_RGB
#define I2S_COLOR_FIRST red
#define I2S_COLOR_SECOND green
#define I2S_COLOR_THIRD blue
#elif I2S_COLOR_PROFILE == I2S_COLOR_PROFILE_N_RBG
#define I2S_COLOR_FIRST red
#define I2S_COLOR_SECOND blue
#define I2S_COLOR_THIRD green
#elif I2S_COLOR_PROFILE == I2S_COLOR_PROFILE_N_GBR
#define I2S_COLOR_FIRST green
#define I2S_COLOR_SECOND blue
#define I2S_COLOR_THIRD red
#elif I2S_COLOR_PROFILE == I2S_COLOR_PROFILE_N_GRB
#define I2S_COLOR_FIRST green
#define I2S_COLOR_SECOND red
#define I2S_COLOR_THIRD blue
#elif I2S_COLOR_PROFILE == I2S_COLOR_PROFILE_N_BGR
#define I2S_COLOR_FIRST blue
#define I2S_COLOR_SECOND green
#define I2S_COLOR_THIRD red
#else
#define I2S_COLOR_FIRST blue
#define I2S_COLOR_SECOND red
#define I2S_COLOR_THIRD green
#endif

/**
 * Initialize i2s and dma subsystems to work with ws2812 led strip.
 *
 * Please note that each pixel will take 12 bytes of RAM.
 *
 * @param pixels_number Number of pixels in the strip.
 */
int ws2812_i2s_init(uint32_t pixels_number, pixeltype_t type);

/**
 * Update ws2812 pixels.
 *
 * @param pixels Array of 'pixels_number' pixels. The array must contain all
 * the pixels.
 */
void ws2812_i2s_update(ws2812_pixel_t *pixels, pixeltype_t type);

#ifdef	__cplusplus
}
#endif

#endif  // __WS2812_I2S_H__

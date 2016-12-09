/*
 * oled_fonts.c
 *
 *  Created on: 8 dec. 2016
 *      Author: zaltora
 */
#include "fonts.h"

extern const font_info_t  glcd_5x7_font_info;
extern const font_info_t  roboto_8ptFontInfo;
extern const font_info_t  roboto_10ptFontInfo;

const font_info_t*  fonts[NUM_FONTS] =
{
    &glcd_5x7_font_info,
    &roboto_8ptFontInfo,
    &roboto_10ptFontInfo,
};

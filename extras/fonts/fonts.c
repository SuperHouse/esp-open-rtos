/*
 * oled_fonts.c
 *
 *  Created on: 8 dec. 2016
 *      Author: zaltora
 */
#include "fonts.h"

extern const font_info_t  glcd_5x7_font_info;
extern const font_info_t  tahoma_8pt_font_info;
extern const font_info_t  tahoma_16ptFontInfo;

const font_info_t*  fonts[NUM_FONTS] =
{
    &glcd_5x7_font_info,
    &tahoma_8pt_font_info,
    &tahoma_16ptFontInfo,
};

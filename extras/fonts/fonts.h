/*
 * fonts.h
 *
 *  Created on: 8 dec. 2016
 *      Author: zaltora
 */

#ifndef FONTS_H
#define FONTS_H

#include <FreeRTOS.h>
#include "config.h"

/**
 * Character descriptor
 */
typedef struct _font_char_desc
{
    uint8_t width;      //Character width in pixel
    uint16_t offset;    //Offset of this character in bitmap
} font_char_desc_t;

/**
 * Font information
 */
typedef struct _font_info
{
    uint8_t height;         //Character height in pixel, all characters have same height
    uint8_t c;              //Simulation of "C" width in TrueType term, the space between adjacent characters
    char char_start;        //First character
    char char_end;          //Last character
    const font_char_desc_t* char_descriptors; //descriptor for each character
    const uint8_t *bitmap;  //Character bitmap
} font_info_t;

extern const font_info_t* fonts[NUM_FONTS];  //Built-in fonts

#endif // _FONTS__H_

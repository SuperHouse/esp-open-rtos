/*
 * fonts.h
 *
 *  Created on: 8 dec. 2016
 *      Author: zaltora
 */
#ifndef _EXTRAS_FONTS_H_
#define _EXTRAS_FONTS_H_

#include <stdint.h>
#include <stddef.h>
#include "config.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum
{
    FONT_FACE_GLCD5x7 = 0,
    FONT_FACE_ROBOTO_8PT,
    FONT_FACE_ROBOTO_10PT,
    FONT_FACE_TERMINUS_6X12_KOI8_R,
    FONT_FACE_TERMINUS_8X14_KOI8_R,
    FONT_FACE_TERMINUS_BOLD_8X14_KOI8_R,
    FONT_FACE_TERMINUS_8X16_KOI8_R,
    FONT_FACE_TERMINUS_BOLD_8X16_KOI8_R,
    FONT_FACE_TERMINUS_14X28_KOI8_R,
    FONT_FACE_TERMINUS_BOLD_14X28_KOI8_R,
    FONT_FACE_TERMINUS_16X32_KOI8_R,
    FONT_FACE_TERMINUS_BOLD_16X32_KOI8_R,
} font_face_t;

#define FONT_FACE_MAX FONT_FACE_TERMINUS_BOLD_16X32_KOI8_R

/**
 * Character descriptor
 */
typedef struct _font_char_desc
{
    uint8_t width;   ///< Character width in pixel
    uint16_t offset; ///< Offset of this character in bitmap
} font_char_desc_t;

/**
 * Font information
 */
typedef struct _font_info
{
    uint8_t height;                           ///< Character height in pixel, all characters have same height
    uint8_t c;                                ///< Simulation of "C" width in TrueType term, the space between adjacent characters
    char char_start;                          ///< First character
    char char_end;                            ///< Last character
    const font_char_desc_t *char_descriptors; ///< descriptor for each character
    const uint8_t *bitmap;                    ///< Character bitmap
} font_info_t;

/**
 * Built-in fonts
 */
extern const font_info_t *fonts[];
extern const size_t fonts_count;

#ifdef __cplusplus
}
#endif

#endif /* _EXTRAS_FONTS_H_ */

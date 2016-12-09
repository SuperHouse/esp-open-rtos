/*
 * fonts.c
 *
 *  Created on: 8 dec. 2016
 *      Author: zaltora
 */
#include "fonts.h"

#if FONTS_GLCD_5X7
    #include "data/font_glcd_5x7.h"
#endif

#if FONTS_ROBOTO_8PT
    #include "data/font_roboto_8pt.h"
#endif
#if FONTS_ROBOTO_10PT
    #include "data/font_roboto_10pt.h"
#endif

#if FONTS_TERMINUS_6X12_KOI8_R
    #include "data/font_terminus_6x12_koi8_r.h"
#endif

#if FONTS_TERMINUS_8X14_KOI8_R
    #include "data/font_terminus_8x14_koi8_r.h"
#endif
#if FONTS_TERMINUS_BOLD_8X14_KOI8_R
    #include "data/font_terminus_bold_8x14_koi8_r.h"
#endif

#if FONTS_TERMINUS_14X28_KOI8_R
    #include "data/font_terminus_14x28_koi8_r.h"
#endif
#if FONTS_TERMINUS_BOLD_14X28_KOI8_R
    #include "data/font_terminus_bold_14x28_koi8_r.h"
#endif

#if FONTS_TERMINUS_16X32_KOI8_R
    #include "data/font_terminus_16x32_koi8_r.h"
#endif
#if FONTS_TERMINUS_BOLD_16X32_KOI8_R
    #include "data/font_terminus_bold_16x32_koi8_r.h"
#endif

/////////////////////////////////////////////

const font_info_t *fonts[] =
{
#if FONTS_GLCD_5X7
    [FONT_FACE_GLCD5x7] = &_fonts_glcd_5x7_info,
#else
    [FONT_FACE_GLCD5x7] = NULL,
#endif

#if FONTS_ROBOTO_8PT
    [FONT_FACE_ROBOTO_8PT] = &_fonts_roboto_8pt_info,
#else
    [FONT_FACE_ROBOTO_8PT] = NULL,
#endif
#if FONTS_ROBOTO_10PT
    [FONT_FACE_ROBOTO_10PT] = &_fonts_roboto_10pt_info,
#else
    [FONT_FACE_ROBOTO_10PT] = NULL,
#endif

#if FONTS_TERMINUS_6X12_KOI8_R
    [FONT_FACE_TERMINUS_6X12_KOI8_R] = &_fonts_terminus_6x12_koi8_r_info,
#else
    [FONT_FACE_TERMINUS_6X12_KOI8_R] = NULL,
#endif

#if FONTS_TERMINUS_8X14_KOI8_R
    [FONT_FACE_TERMINUS_8X14_KOI8_R] = &_fonts_terminus_8x14_koi8_r_info,
#else
    [FONT_FACE_TERMINUS_8X14_KOI8_R] = NULL,
#endif
#if FONTS_TERMINUS_BOLD_8X14_KOI8_R
    [FONT_FACE_TERMINUS_BOLD_8X14_KOI8_R] = &_fonts_terminus_bold_8x14_koi8_r_info,
#else
    [FONT_FACE_TERMINUS_BOLD_8X14_KOI8_R] = NULL,
#endif

#if FONTS_TERMINUS_14X28_KOI8_R
    [FONT_FACE_TERMINUS_14X28_KOI8_R] = &_fonts_terminus_14x28_koi8_r_info,
#else
    [FONT_FACE_TERMINUS_14X28_KOI8_R] = NULL,
#endif
#if FONTS_TERMINUS_BOLD_14X28_KOI8_R
    [FONT_FACE_TERMINUS_BOLD_14X28_KOI8_R] = &_fonts_terminus_bold_14x28_koi8_r_info,
#else
    [FONT_FACE_TERMINUS_BOLD_14X28_KOI8_R] = NULL,
#endif

#if FONTS_TERMINUS_16X32_KOI8_R
    [FONT_FACE_TERMINUS_16X32_KOI8_R] = &_fonts_terminus_16x32_koi8_r_info,
#else
    [FONT_FACE_TERMINUS_16X32_KOI8_R] = NULL,
#endif
#if FONTS_TERMINUS_BOLD_16X32_KOI8_R
    [FONT_FACE_TERMINUS_BOLD_16X32_KOI8_R] = &_fonts_terminus_bold_16x32_koi8_r_info,
#else
    [FONT_FACE_TERMINUS_BOLD_16X32_KOI8_R] = NULL,
#endif
};

const size_t fonts_count = (sizeof(fonts) / sizeof(font_info_t *));

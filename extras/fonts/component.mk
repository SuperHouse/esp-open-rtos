# Component makefile for extras/fonts

# expected anyone using this component includes it as 'fonts/fonts.h'
INC_DIRS += $(fonts_ROOT)..

# args for passing into compile rule generation
fonts_SRC_DIR = $(fonts_ROOT)

FONTS_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

# default builtin fonts
include $(FONTS_DIR)defaults.mk

fonts_CFLAGS = $(CFLAGS) \
	-DFONTS_GLCD_5X7=$(FONTS_GLCD_5X7) \
	-DFONTS_ROBOTO_8PT=$(FONTS_ROBOTO_8PT) \
	-DFONTS_ROBOTO_10PT=$(FONTS_ROBOTO_10PT) \
	-DFONTS_TERMINUS_6X12_KOI8_R=$(FONTS_TERMINUS_6X12_KOI8_R) \
	-DFONTS_TERMINUS_8X14_KOI8_R=$(FONTS_TERMINUS_8X14_KOI8_R) \
	-DFONTS_TERMINUS_BOLD_8X14_KOI8_R=$(FONTS_TERMINUS_BOLD_8X14_KOI8_R) \
	-DFONTS_TERMINUS_14X28_KOI8_R=$(FONTS_TERMINUS_14X28_KOI8_R) \
	-DFONTS_TERMINUS_BOLD_14X28_KOI8_R=$(FONTS_TERMINUS_BOLD_14X28_KOI8_R) \
	-DFONTS_TERMINUS_16X32_KOI8_R=$(FONTS_TERMINUS_16X32_KOI8_R) \
	-DFONTS_TERMINUS_BOLD_16X32_KOI8_R=$(FONTS_TERMINUS_BOLD_16X32_KOI8_R)
	
$(eval $(call component_compile_rules,fonts))

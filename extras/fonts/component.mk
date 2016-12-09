# Component makefile for extras/fonts

# expected anyone using bmp driver includes it as 'fonts/fonts.h'
INC_DIRS += $(fonts_ROOT)..

# args for passing into compile rule generation
fonts_SRC_DIR =  $(fonts_ROOT)

FONTS_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

# fonts by default
include $(FONTS_DIR)defaults.mk

fonts_CFLAGS = $(CFLAGS) \
	-DFONTS_GLCD_5X7=$(FONTS_GLCD_5X7)
	-DFONTS_ROBOTO_8PT=$(FONTS_ROBOTO_8PT)
	-DFONTS_ROBOTO_10PT=$(FONTS_ROBOTO_10PT)
	
$(eval $(call component_compile_rules,fonts))

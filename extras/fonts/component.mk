# Component makefile for extras/fonts

# expected anyone using bmp driver includes it as 'fonts/fonts.h'
INC_DIRS += $(fonts_ROOT)..

# args for passing into compile rule generation
fonts_SRC_DIR =  $(fonts_ROOT)

$(eval $(call component_compile_rules,fonts))

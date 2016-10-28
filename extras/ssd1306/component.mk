# Component makefile for extras/ssd1306

# expected anyone using ssd1306 driver includes it as 'ssd1306/ssd1306.h'
INC_DIRS += $(ssd1306_ROOT)..

# args for passing into compile rule generation
ssd1306_SRC_DIR =  $(ssd1306_ROOT)

$(eval $(call component_compile_rules,ssd1306))

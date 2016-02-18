# Component makefile for extras/ds18b20

# expected anyone using bmp driver includes it as 'ds18b20/ds18b20.h'
INC_DIRS += $(ds18b20_ROOT)..

# args for passing into compile rule generation
ds18b20_SRC_DIR =  $(ds18b20_ROOT)

$(eval $(call component_compile_rules,ds18b20))

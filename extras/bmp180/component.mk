# Component makefile for extras/bmp180

INC_DIRS += $(ROOT)extras

# args for passing into compile rule generation
extras/bmp180_INC_DIR =  $(ROOT)extras
extras/bmp180_SRC_DIR =  $(ROOT)extras/bmp180

$(eval $(call component_compile_rules,extras/bmp180))

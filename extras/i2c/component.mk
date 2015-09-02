# Component makefile for extras/i2c

INC_DIRS += $(ROOT)extras

# args for passing into compile rule generation
extras/i2c_INC_DIR =  $(ROOT)extras
extras/i2c_SRC_DIR =  $(ROOT)extras/i2c

$(eval $(call component_compile_rules,extras/i2c))

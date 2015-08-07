# Component makefile for extras/serial-driver
#
# See examples/terminal for usage

INC_DIRS += $(ROOT)extras/serial-driver

# args for passing into compile rule generation
extras/serial-driver_INC_DIR =  $(ROOT)extras/serial-driver
extras/serial-driver_SRC_DIR =  $(ROOT)extras/serial-driver

$(eval $(call component_compile_rules,extras/serial-driver))

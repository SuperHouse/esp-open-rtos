# Component makefile for extras/rf433mhz

# expected anyone using this driver includes it as 'rf433mhz/rf_433mhz.h'
INC_DIRS += $(rf433mhz_ROOT)..

# args for passing into compile rule generation
rf433mhz_SRC_DIR = $(rf433mhz_ROOT)

$(eval $(call component_compile_rules,rf433mhz))

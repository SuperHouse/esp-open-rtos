# Component makefile for extras/rboot-ota

INC_DIRS += $(ROOT)extras/rboot-ota

# args for passing into compile rule generation
extras/rboot-ota_INC_DIR =  $(ROOT)extras/rboot-ota
extras/rboot-ota_SRC_DIR =  $(ROOT)extras/rboot-ota

$(eval $(call component_compile_rules,extras/rboot-ota))

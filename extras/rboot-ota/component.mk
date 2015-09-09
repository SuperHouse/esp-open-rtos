# Component makefile for extras/rboot-ota

INC_DIRS += $(rboot-ota_ROOT)

# args for passing into compile rule generation
rboot-ota_SRC_DIR =  $(rboot-ota_ROOT)

$(eval $(call component_compile_rules,rboot-ota))


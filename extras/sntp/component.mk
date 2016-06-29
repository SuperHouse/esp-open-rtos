# Component makefile for extras/sntp

INC_DIRS += $(sntp_ROOT)

# args for passing into compile rule generation
sntp_SRC_DIR =  $(sntp_ROOT)

$(eval $(call component_compile_rules,sntp))

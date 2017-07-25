# Component makefile for extras/captdns

INC_DIRS += $(captdns_ROOT)

# args for passing into compile rule generation
captdns_SRC_DIR = $(captdns_ROOT)

$(eval $(call component_compile_rules,captdns))

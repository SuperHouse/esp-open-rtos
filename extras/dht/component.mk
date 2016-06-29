# Component makefile for extras/dht

INC_DIRS += $(ROOT)extras/dht

# args for passing into compile rule generation
extras/dht_INC_DIR =  $(ROOT)extras/dht
extras/dht_SRC_DIR =  $(ROOT)extras/dht

$(eval $(call component_compile_rules,extras/dht))


# Component makefile for LWIP

LWIP_DIR = $(ROOT)lwip/lwip/src/
INC_DIRS += $(LWIP_DIR)/include $(ROOT)/lwip/include $(ROOT)lwip/include $(LWIP_DIR)include/ipv4 $(LWIP_DIR)include/ipv4/lwip

# args for passing into compile rule generation
lwip_ROOT = $(ROOT)/lwip
lwip_INC_DIR =  # all in INC_DIRS, needed for normal operation
lwip_SRC_DIR = $(ROOT)/lwip $(LWIP_DIR)api $(LWIP_DIR)core $(LWIP_DIR)core/ipv4 $(LWIP_DIR)netif

# LWIP 1.4.1 generates a single warning so we need to disable -Werror when building it
lwip_CFLAGS = $(CFLAGS) -Wno-address

$(eval $(call component_compile_rules,lwip))


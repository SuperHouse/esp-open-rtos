# Component makefile for axTLS

# axTLS has its own configure and build system, but it's not particularly
# designed for embedded systems. For now we're just imposing the ESP Open RTOS
# build system over the top.

# We supply our own hand tweaked config.h in the external 'include' dir.

AXTLS_DIR = $(axtls_ROOT)axtls/
INC_DIRS += $(axtls_ROOT)include $(AXTLS_DIR)ssl $(AXTLS_DIR)crypto

# args for passing into compile rule generation
axtls_INC_DIR =  $(AXTLS_DIR)include $(AXTLS_DIR)
axtls_SRC_DIR = $(AXTLS_DIR)crypto $(AXTLS_DIR)ssl $(axtls_ROOT)

#axtls_CFLAGS = $(CFLAGS) -Wno-address

$(eval $(call component_compile_rules,axtls))

# Helpful error if git submodule not initialised
$(axtls_SRC_DIR):
	$(error "axtls git submodule not installed. Please run 'git submodule init' then 'git submodule update'")

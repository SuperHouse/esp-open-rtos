# Component makefile for extras/dhcpserver

#error IWASERROR

INC_DIRS += $(ROOT)extras/dhcpserver/include

# args for passing into compile rule generation
extras/dhcpserver_INC_DIR =  $(ROOT)extras/dhcpserver
extras/dhcpserver_SRC_DIR =  $(ROOT)extras/dhcpserver

$(eval $(call component_compile_rules,extras/dhcpserver))

# Component makefile for binary SDK components

binary_sdk_SRC_DIR =  $(binary_sdk_ROOT)libmain $(binary_sdk_ROOT)libnet80211 $(binary_sdk_ROOT)libphy $(binary_sdk_ROOT)libpp $(binary_sdk_ROOT)libwpa

$(eval $(call component_compile_rules,binary_sdk))

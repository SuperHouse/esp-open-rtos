# Component makefile for extras/paho

# expected anyone using bmp driver includes it as 'paho/MQTT*.h'
INC_DIRS += $(paho_ROOT)..

# args for passing into compile rule generation
paho_SRC_DIR =  $(paho_ROOT)

$(eval $(call component_compile_rules,paho))

# Component makefile for extras/paho_mqtt_c

MQTT_PACKET_DIR=$(paho_mqtt_c_ROOT)org.eclipse.paho.mqtt.embedded-c/MQTTPacket/src/

paho_mqtt_c_SRC_DIR =  $(paho_mqtt_c_ROOT) $(MQTT_PACKET_DIR)

# upstream MQTT code has some unused variables
paho_mqtt_c_CFLAGS = $(CFLAGS) -Wno-unused-but-set-variable

INC_DIRS += $(paho_mqtt_c_ROOT) $(MQTT_PACKET_DIR)

$(eval $(call component_compile_rules,paho_mqtt_c))

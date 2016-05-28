# Paho MQTT Embedded C Client

https://www.eclipse.org/paho/clients/c/embedded/

ESP8266 port based on the port done by @baoshi.

## Directory Organisation

* org.eclipse.paho.mqtt.embedded-c/ is the upstream project.

* MQTTClient.c is copied verbatim from org.eclipse.paho.mqtt.embedded-c/MQTTClient-C/src/ (as it needs to be in the same directory as MQTTClient.h)

* MQTTClient.h is copied from the same place, and has one line changed to include the upstream platform header file.

... any time the submodule is updated, those two source files should also be refreshed.


# Makefile for wificfg example
PROGRAM=wifi-config-v2
EXTRA_COMPONENTS=extras/wifi-config-v2 extras/http-parser extras/dhcpserver

# For the mDNS responder included under extras:
#EXTRA_COMPONENTS += extras/mdnsresponder
#EXTRA_CFLAGS += -DEXTRAS_MDNS_RESPONDER

# For the mDNS responder included with lwip:
EXTRA_CFLAGS += -DLWIP_MDNS_RESPONDER=1 -DLWIP_NUM_NETIF_CLIENT_DATA=1 -DLWIP_NETIF_EXT_STATUS_CALLBACK=1

# Avoid writing the wifi state to flash when using wificfg.
EXTRA_CFLAGS += -DWIFI_PARAM_SAVE=0

# enable debugging for the wifi config tasks
EXTRA_CFLAGS += -DWIFI_CONFIG_DEBUG

include ../../common.mk

PROGRAM=spiffs_example
EXTRA_COMPONENTS = extras/spiffs
FLASH_SIZE = 32

# spiffs configuration
SPIFFS_BASE_ADDR = 0x200000
SPIFFS_SIZE = 0x010000

include ../../common.mk

$(eval $(call make_spiffs_image,files))

# Component makefile for extras/spiffs

SPIFFS_BASE_ADDR ?= 0x300000
SPIFFS_SIZE ?= 0x100000

INC_DIRS += $(spiffs_ROOT)
INC_DIRS += $(spiffs_ROOT)spiffs/src

# args for passing into compile rule generation
spiffs_SRC_DIR = $(spiffs_ROOT)spiffs/src
spiffs_SRC_DIR += $(spiffs_ROOT)

spiffs_CFLAGS = $(CFLAGS)
spiffs_CFLAGS += -DSPIFFS_BASE_ADDR=$(SPIFFS_BASE_ADDR)
spiffs_CFLAGS += -DSPIFFS_SIZE=$(SPIFFS_SIZE)

$(eval $(call component_compile_rules,spiffs))

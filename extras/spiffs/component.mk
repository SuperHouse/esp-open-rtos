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


# Create an SPIFFS image of specified directory and flash it with
# the rest of the firmware.
#
# Argumens:
#   $(1) - directory with files which go into spiffs image
#
# Example:
#  $(eval $(call make_spiffs_image,files))
define make_spiffs_image
SPIFFS_IMAGE = $(addprefix $(FIRMWARE_DIR),spiffs.bin)
MKSPIFFS_DIR = $(ROOT)/extras/spiffs/mkspiffs
MKSPIFFS = $$(MKSPIFFS_DIR)/mkspiffs
SPIFFS_FILE_LIST = $(shell find $(1))

all: $$(SPIFFS_IMAGE)

clean: clean_spiffs_img clean_mkspiffs

$$(SPIFFS_IMAGE): $$(MKSPIFFS) $$(SPIFFS_FILE_LIST)
	$$< $(1) $$@

# Rebuild SPIFFS if Makefile is changed, where SPIFF_SIZE is defined
$$(spiffs_ROOT)spiffs_config.h: Makefile
	$$(Q) touch $$@

$$(MKSPIFFS)_MAKE:
	$$(MAKE) -C $$(MKSPIFFS_DIR) SPIFFS_SIZE=$(SPIFFS_SIZE)

# if SPIFFS_SIZE in Makefile is changed rebuild mkspiffs
$$(MKSPIFFS): Makefile
	$$(MAKE) -C $$(MKSPIFFS_DIR) clean
	$$(MAKE) -C $$(MKSPIFFS_DIR) SPIFFS_SIZE=$(SPIFFS_SIZE)

clean_spiffs_img:
	$$(Q) rm -f $$(SPIFFS_IMAGE)

clean_mkspiffs:
	$$(Q) $$(MAKE) -C $$(MKSPIFFS_DIR) clean

# run make for mkspiffs always
all: $$(MKSPIFFS)_MAKE

.PHONY: $$(MKSPIFFS)_MAKE

SPIFFS_ESPTOOL_ARGS = $(SPIFFS_BASE_ADDR) $$(SPIFFS_IMAGE)
endef

$(eval $(call component_compile_rules,spiffs))

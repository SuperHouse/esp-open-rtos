# esp-open-rtos common Makefile
#
# To use this Makefile, define the variable TARGET with the program
# name (plus any other variables you want to override) in your
# progream's makefile, then include common.mk as the last line
# in the Makefile.
#
# See the programs in the 'examples' directory for examples.
#
# Note: your program does not have to be under the top esp-open-rtos
# directory - you can build out of tree programs.

# This makefile is adapted from the esp-mqtt makefile by @tuanpmt
# https://github.com/tuanpmt/esp_mqtt, but it has change significantly
# since then.

# To override variables assigned below with ?= for the local system,
# rather than per-project, add the entries to this optional local.mk
# file, or specify on the command line, or pass as environment vars.
-include local.mk

# esptool defaults
ESPTOOL ?= esptool.py
ESPBAUD ?= 115200

ifndef TARGET
	$(error "Set the TARGET environment variable in your Makefile before including common.mk"
endif

# Output directors to store intermediate compiled files
# relative to the target directory
BUILD_DIR ?= $(TARGET_DIR)build/
FW_BASE ?= $(TARGET_DIR)firmware/

# we create two different files for uploading into the flash
# these are the names and options to generate them
FW_1	= 0x00000
FW_2	= 0x40000

FLAVOR ?= release # or debug

# Compiler names, etc. assume gdb
ESPPORT ?= /dev/ttyUSB0
CROSS ?= xtensa-lx106-elf-

AR = $(CROSS)ar
CC = $(CROSS)gcc
LD = $(CROSS)gcc
NM = $(CROSS)nm
CPP = $(CROSS)g++
SIZE = $(CROSS)size
OBJCOPY = $(CROSS)objcopy

# Source components to compile and link. Each of these are subdirectories
# of the root, with a 'component.mk' file.
COMPONENTS     ?= FreeRTOS lwip

# libraries to link, mainly blobs provided by the esp-iot-rtos SDK
LIBS		?= gcc json main net80211 phy pp ssl udhcp wpa hal

CFLAGS		= -Wall -Werror -Wl,-EL -nostdlib -mlongcalls -mtext-section-literals -std=gnu99
LDFLAGS		= -nostdlib -Wl,--no-check-sections -Wl,-L$(ROOT)lib -u call_user_start -Wl,-static -Wl,-Map=build/${TARGET}.map

ifeq ($(FLAVOR),debug)
    CFLAGS += -g -O0
    LDFLAGS += -g -O0
else
    CFLAGS += -g -O2
    LDFLAGS += -g -O2
endif

LINKER_SCRIPTS  = ld/eagle.app.v6.ld ld/eagle.rom.addr.v6.ld

####
#### no user configurable options below here
####

# hacky way to get a single space value
empty :=
space := $(empty) $(empty)

# assume the target_dir is the directory the top-level makefile was run in
TARGET_DIR := $(dir $(firstword $(MAKEFILE_LIST)))

# assume the 'root' directory (ie top of the tree) is the directory common.mk is in
ROOT := $(dir $(lastword $(MAKEFILE_LIST)))

# derive various parts of compiler/linker arguments
LIB_ARGS         = $(addprefix -l,$(LIBS))
TARGET_OUT   = $(BUILD_DIR)$(TARGET).out
LDFLAGS      += $(addprefix -T$(ROOT),$(LINKER_SCRIPTS))
FW_FILE_1    = $(addprefix $(FW_BASE)/,$(FW_1).bin)
FW_FILE_2    = $(addprefix $(FW_BASE)/,$(FW_2).bin)

# Common include directories, shared across all "components"
# components will add their include directories to this argument
#
# Placing $(TARGET_DIR) and $(TARGET_DIR)include first allows
# targets to have their own copies of header config files for components
# , which is useful for overriding things.
INC_DIRS      = $(TARGET_DIR) $(TARGET_DIR)include $(ROOT)include

ifeq ("$(V)","1")
Q :=
vecho := @true
else
Q := @
vecho := @echo
endif

.PHONY: all clean debug_print

all: $(TARGET_OUT) $(FW_FILE_1) $(FW_FILE_2)

# component_compile_rules: Produces compilation rules for a given
# component
#
# Call arguments are:
# $(1) - component name
#
# Expects that the following component-specific variables are defined:
#
# $(1)_ROOT    = Top-level dir containing component. Can be in-tree or out-of-tree.
# $(1)_SRC_DIR = List of source directories for the component. All must be under $(1)_ROOT
# $(1)_INC_DIR = List of include directories specific for the component
#
# Optional variables:
# $(1)_CFLAGS  = CFLAGS to override the default CFLAGS for this component only.
#
# Each call appends to COMPONENT_ARS which is a list of archive files for compiled components
COMPONENT_ARS =
define component_compile_rules
$(1)_OBJ_DIR   = $(BUILD_DIR)$(1)/
### determine source files and object files ###
$(1)_SRC_FILES = $$(foreach sdir,$$($(1)_SRC_DIR),$$(realpath $$(wildcard $$(sdir)/*.c)))
$(1)_REAL_ROOT = $$(realpath $$($(1)_ROOT))
# patsubst here substitutes real paths for the relative OBJ_DIR path, making things short again
$(1)_OBJ_FILES = $$(patsubst $$($(1)_REAL_ROOT)%.c,$$($(1)_OBJ_DIR)%.o,$$($(1)_SRC_FILES))

### determine compiler arguments ###
$(1)_CFLAGS ?= $(CFLAGS)
$(1)_CC_ARGS = $(Q) $(CC) $(addprefix -I,$(INC_DIRS)) $$(addprefix -I,$$($(1)_INC_DIR)) $$($(1)_CFLAGS)
$(1)_AR = $(BUILD_DIR)$(1).a

$$($(1)_OBJ_DIR)%.o: $$($(1)_REAL_ROOT)%.c
	$(vecho) "CC $$<"
	$(Q) mkdir -p $$(dir $$@)
	$$($(1)_CC_ARGS) -c $$< -o $$@
	$$($(1)_CC_ARGS) -MM -MT $$@ -MF $$(@:.o=.d) $$<
	$(Q) $(OBJCOPY) --rename-section .text=.irom0.text --rename-section .literal=.irom0.literal $$@

$$($(1)_AR): $$($(1)_OBJ_FILES)
	$(vecho) "AR $$@"
	$(Q) $(AR) cru $$@ $$^

COMPONENT_ARS += $$($(1)_AR)

-include $$($(1)_OBJ_FILES:.o=.d)
endef

## Include components (this is where the actual compiler sections are generated)
$(foreach component,$(COMPONENTS), $(eval include $(ROOT)/$(component)/component.mk))

# include "dummy component" for the 'target' object file
target_SRC_DIR=$(TARGET_DIR)
target_ROOT=$(TARGET_DIR)
$(eval $(call component_compile_rules,target))

# final linking step to produce .elf
$(TARGET_OUT): $(COMPONENT_ARS)
	$(vecho) "LD $@"
	$(Q) $(LD) $(LD_SCRIPT) $(LDFLAGS) -Wl,--start-group $(LIB_ARGS) $(COMPONENT_ARS) -Wl,--end-group -o $@

$(BUILD_DIR) $(FW_BASE):
	$(Q) mkdir -p $@

$(FW_FILE_1) $(FW_FILE_2): $(TARGET_OUT) $(FW_BASE)
	$(vecho) "FW $@"
	$(ESPTOOL) elf2image $< -o $(FW_BASE)

flash: $(FW_FILE_1) $(FW_FILE_2)
	$(ESPTOOL) -p $(ESPPORT) --baud $(ESPBAUD) write_flash $(FW_1) $(FW_FILE_1) $(FW_2) $(FW_FILE_2)

size: $(TARGET_OUT)
	$(Q) $(CROSS)size --format=sysv $(TARGET_OUT)

test: flash
	screen $(ESPPORT) 115200

# the rebuild target is written like this so it can be run in a parallel build
# environment without causing weird side effects
rebuild:
	$(MAKE) clean
	$(MAKE) all

clean:
	$(Q) rm -rf $(BUILD_DIR)
	$(Q) rm -rf $(FW_BASE)

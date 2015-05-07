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
OBJCOPY = $(CROSS)objcopy

# which modules (subdirectories) of the main project to include in compiling
MODULES		?= FreeRTOS/Source FreeRTOS/Source/portable/MemMang FreeRTOS/Source/portable/esp8266
MODULE_INCDIR    ?= FreeRTOS/Source/include include
MODULE_INCDIR    += include/lwip include/lwip/ipv4 include/lwip/ipv6
SDK_INCDIR=include/espressif

# libraries to link, mainly blobs provided by the esp-iot-rtos SDK
LIBS		?= gcc json lwip main net80211 phy pp ssl udhcp wpa hal

CFLAGS		= -Wall -Werror -Wl,-EL -nostdlib -mlongcalls -mtext-section-literals -std=gnu99
LDFLAGS		= -nostdlib -Wl,--no-check-sections -Wl,-L$(ROOT)lib -u call_user_start -Wl,-static -Wl,-Map=build/${TARGET}.map

ifeq ($(FLAVOR),debug)
    CFLAGS += -g -O0
    LDFLAGS += -g -O0
else
    CFLAGS += -g -O2
    LDFLAGS += -g -O2
endif

####
#### no user configurable options below here
####

# assume the target_dir is the directory the top-level makefile was run in
TARGET_DIR := $(dir $(firstword $(MAKEFILE_LIST)))

# assume the 'root' directory (ie top of the tree) is the directory common.mk is in
ROOT := $(dir $(lastword $(MAKEFILE_LIST)))

FW_TOOL		?= $(ESPTOOL)
SRC_DIR		:= $(TARGET_DIR) $(addprefix $(ROOT),$(MODULES))
OBJ_DIR	        := $(BUILD_DIR)obj/

LINKER_SCRIPTS  := ld/eagle.app.v6.ld ld/eagle.rom.addr.v6.ld

SRC		:= $(foreach sdir,$(SRC_DIR),$(wildcard $(sdir)/*.c))
# double patsubst in OBJ first removes the $(ROOT) prefix from any
# files in SRC that are relative to ROOT, then replaces .c in any not
# relative to root (ie the files in the target dir)
OBJ		:= $(patsubst %,$(OBJ_DIR)%,$(notdir $(patsubst %.c,%.o,$(SRC))))
LIBS		:= $(addprefix -l,$(LIBS))
APP_AR		:= $(BUILD_DIR)/$(TARGET)_app.a
TARGET_OUT	:= $(BUILD_DIR)/$(TARGET).out

LDFLAGS        += $(addprefix -T$(ROOT),$(LINKER_SCRIPTS))

INCARGS	        := $(addprefix -I,$(SRC_DIR))
MODULE_INCARGS	:= $(addprefix -I$(ROOT),$(MODULE_INCDIR)) # $(addsuffix include,$(MODULE_INCDIR))
SDK_INCARGS     := $(addprefix -I$(ROOT),$(SDK_INCDIR))

FW_FILE_1	:= $(addprefix $(FW_BASE)/,$(FW_1).bin)
FW_FILE_2	:= $(addprefix $(FW_BASE)/,$(FW_2).bin)

CC_ARGS		= $(Q) $(CC) $(INCARGS) $(MODULE_INCARGS) $(SDK_INCARGS) $(CFLAGS)

V ?= $(VERBOSE)
ifeq ("$(V)","1")
Q :=
vecho := @true
else
Q := @
vecho := @echo
endif

vpath %.c $(SRC_DIR)

# Main compilation rule
$(OBJ_DIR)%.o: %.c $(OBJ_DIR)
	$(vecho) "CC $<"
	$(CC_ARGS) -c $< -o $@
	$(CC_ARGS) -MM -MT $@ -MF $(@:.o=.d) $<
	$(Q) $(OBJCOPY) --rename-section .text=.irom0.text --rename-section .literal=.irom0.literal $@

.PHONY: all clean

all: $(TARGET_OUT) $(FW_FILE_1) $(FW_FILE_2)

$(FW_FILE_1) $(FW_FILE_2): $(TARGET_OUT) $(FW_BASE)
	$(vecho) "FW $@"
	$(ESPTOOL) elf2image $< -o $(FW_BASE)

$(TARGET_OUT): $(APP_AR)
	$(vecho) "LD $@"
	$(Q) $(LD) $(LD_SCRIPT) $(LDFLAGS) -Wl,--start-group $(LIBS) $(APP_AR) -Wl,--end-group -o $@

$(APP_AR): $(OBJ)
	$(vecho) "AR $@"
	$(Q) $(AR) cru $@ $^

:
	$(Q) mkdir -p $@

$(BUILD_DIR) $(FW_BASE) $(OBJ_DIR):
	$(Q) mkdir -p $@

flash: $(FW_FILE_1) $(FW_FILE_2)
	$(ESPTOOL) -p $(ESPPORT) --baud $(ESPBAUD) write_flash $(FW_1) $(FW_FILE_1) $(FW_2) $(FW_FILE_2)

test: flash
	screen $(ESPPORT) 115200

rebuild: clean all

clean:
	$(Q) rm -f $(APP_AR)
	$(Q) rm -f $(TARGET_OUT)
	$(Q) rm -rf $(BUILD_DIR)
	$(Q) rm -rf $(BUILD_BASE)
	$(Q) rm -f $(FW_FILE_1)
	$(Q) rm -f $(FW_FILE_2)
	$(Q) rm -rf $(FW_BASE)

$(foreach bdir,$(BUILD_DIR),$(eval $(call compile-objects,$(bdir))))

-include $(OBJ:.o=.d)

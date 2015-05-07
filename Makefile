# This makefile is adapted from the esp-mqtt makefile
# by @tuanpmt https://github.com/tuanpmt/esp_mqtt

# To override variables assigned with ?=, add
# entries to this optional Makefile.local file
# or specify on the command line/environment.
-include Makefile.local

# Output directors to store intermediate compiled files
# relative to the project directory
BUILD_BASE	?= build
FW_BASE ?= firmware

# esptool defaults
ESPTOOL ?= esptool.py
ESPBAUD ?= 115200

# name for the target project
TARGET	= app

# linker script used for the above linkier step
LD_SCRIPT	= eagle.app.v6.ld

# we create two different files for uploading into the flash
# these are the names and options to generate them
FW_1	= 0x00000
FW_2	= 0x40000

FLAVOR ?= release

# Assuming gcc for now...
ESPPORT ?= /dev/ttyUSB0
CCFLAGS += -Os -ffunction-sections -fno-jump-tables
AR = xtensa-lx106-elf-ar
CC = xtensa-lx106-elf-gcc
LD = xtensa-lx106-elf-gcc
NM = xtensa-lx106-elf-nm
CPP = xtensa-lx106-elf-cpp
OBJCOPY = xtensa-lx106-elf-objcopy

# which modules (subdirectories) of the project to include in compiling
MODULES		= FreeRTOS/Source FreeRTOS/Source/portable/MemMang FreeRTOS/Source/portable/esp8266 examples/simple/
EXTRA_INCDIR    = FreeRTOS/Source/include include include/espressif examples/simple
EXTRA_INCDIR += include/lwip include/lwip/ipv4 include/lwip/ipv6

# libraries used in this project, mainly provided by the SDK
LIBS		= c gcc json lwip main net80211 phy pp ssl udhcp wpa hal

CFLAGS		= -Os -Wall -Wl,-EL -fno-inline-functions -nostdlib -mlongcalls -mtext-section-literals

LDFLAGS		= -nostdlib -Wl,--no-check-sections -Wl,-Llib -u call_user_start -Wl,-static -Wl,-Map=build/${TARGET}.map

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
FW_TOOL		?= $(ESPTOOL)
SRC_DIR		:= $(MODULES)
BUILD_DIR	:= $(addprefix $(BUILD_BASE)/,$(MODULES))

SRC		:= $(foreach sdir,$(SRC_DIR),$(wildcard $(sdir)/*.c))
OBJ		:= $(patsubst %.c,$(BUILD_BASE)/%.o,$(SRC))
LIBS		:= $(addprefix -l,$(LIBS))
APP_AR		:= $(addprefix $(BUILD_BASE)/,$(TARGET)_app.a)
TARGET_OUT	:= $(addprefix $(BUILD_BASE)/,$(TARGET).out)

LD_SCRIPT	:= -Tld/$(LD_SCRIPT) -Tld/eagle.rom.addr.v6.ld

INCDIR	:= $(addprefix -I,$(SRC_DIR))
EXTRA_INCDIR	:= $(addprefix -I,$(EXTRA_INCDIR))
MODULE_INCDIR	:= $(addsuffix /include,$(INCDIR))

FW_FILE_1	:= $(addprefix $(FW_BASE)/,$(FW_1).bin)
FW_FILE_2	:= $(addprefix $(FW_BASE)/,$(FW_2).bin)

CC_ARGS		= $(Q) $(CC) $(INCDIR) $(MODULE_INCDIR) $(EXTRA_INCDIR) $(SDK_INCDIR) $(CFLAGS)

V ?= $(VERBOSE)
ifeq ("$(V)","1")
Q :=
vecho := @true
else
Q := @
vecho := @echo
endif

vpath %.c $(SRC_DIR)

define compile-objects
$1/%.o: %.c $1
	$(vecho) "CC $$<"
	$(CC_ARGS) -c $$< -o $$@
	$(CC_ARGS) -MM -MT $$@ -MF $$(@:.o=.d) $$<
	$(Q) $(OBJCOPY) --rename-section .text=.irom0.text --rename-section .literal=.irom0.literal $$@
endef

.PHONY: all checkdirs clean

all: checkdirs $(TARGET_OUT) $(FW_FILE_1) $(FW_FILE_2)

$(FW_FILE_1): $(TARGET_OUT) firmware
	$(vecho) "FW $@"
	$(ESPTOOL) elf2image $< -o $(FW_BASE)/

$(FW_FILE_2): $(TARGET_OUT) firmware
	$(vecho) "FW $@"
	$(ESPTOOL) elf2image $< -o $(FW_BASE)/

$(TARGET_OUT): $(APP_AR)
	$(vecho) "LD $@"
	$(Q) $(LD) $(LD_SCRIPT) $(LDFLAGS) -Wl,--start-group $(LIBS) $(APP_AR) -Wl,--end-group -o $@

$(APP_AR): $(OBJ)
	$(vecho) "AR $@"
	$(Q) $(AR) cru $@ $^

checkdirs: $(BUILD_DIR) $(FW_BASE)

$(BUILD_DIR):
	$(Q) mkdir -p $@

firmware:
	$(Q) mkdir -p $@

flash: $(FW_FILE_1)  $(FW_FILE_2)
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

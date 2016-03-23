# This is a wrapper around the rboot makefile, which gives us the parameters
# we need to use rboot with esp-open-rtos
#
# The wrapper means we don't require esptool2 in the build process, so we can just use
# esptool.py (still need xxd, grep, sed to generate the header - see below.)

BUILD_DIR ?= build
FIRMWARE_DIR ?= firmware

# RBOOT configuration parameters.
# RBOOT_BIG_FLASH is required for esp-open-rtos.
export RBOOT_BIG_FLASH    = 1

export RBOOT_BUILD_BASE=$(abspath $(BUILD_DIR))

# Default ESPTOOL params, all the same as when using normal esp-open-rtos makefiles
ESPTOOL ?= esptool.py
ESPPORT ?= /dev/ttyUSB0
ESPBAUD ?= 115200

FLASH_SIZE ?= 16
FLASH_MODE ?= qio
FLASH_SPEED ?= 40

ESPTOOL_ARGS=-fs $(FLASH_SIZE)m -fm $(FLASH_MODE) -ff $(FLASH_SPEED)m

ifeq ("$(V)","1")
Q :=
else
Q := @
endif

all: $(FIRMWARE_DIR)/rboot.bin

rboot/Makefile:
	$(error rboot git submodule is not checkedo out. Try running 'git submodule update --init --recursive')

$(FIRMWARE_DIR)/rboot.bin: $(BUILD_DIR)/rboot.elf $(FIRMWARE_DIR)
	@echo "FW rboot.bin"
	$(Q) $(ESPTOOL) elf2image $(ESPTOOL_ARGS) $< -o $(BUILD_DIR)/
	$(Q) mv $(BUILD_DIR)/0x00000.bin $@

# rboot generates this header using the 'esptool2 -header' option. To try and avoid
# esptool2 as a dependency, we try it here using grep, sed, xxd (all fairly common Unix tools)
$(BUILD_DIR)/rboot-hex2a.h: $(BUILD_DIR)/rboot-stage2a.elf $(BUILD_DIR)
	@echo "Extracting stub image header..."
	$(Q) xtensa-lx106-elf-objcopy $< --only-section .text -Obinary $(BUILD_DIR)/rboot-hex2a.bin
	$(Q) xxd -i $(BUILD_DIR)/rboot-hex2a.bin > $@.in
	$(Q) sed -i "s/unsigned char .\+\[\]/const uint8 _text_data[]/" $@.in
	$(Q) sed -i "s/unsigned int .\+_len/const uint32 _text_len/" $@.in
	$(Q) echo "const uint32 entry_addr = $$(xtensa-lx106-elf-objdump -f $< | grep 'start address' | grep -o '0x.\+');" >> $@.in
	$(Q) echo "const uint32 _text_addr = 0x$$(xtensa-lx106-elf-objdump -h -j .text $< | grep ".text" | grep -o '401.....' | head -n1);" >> $@.in
	$(Q) mv $@.in $@

$(BUILD_DIR)/rboot-stage2a.elf: $(BUILD_DIR)
	$(Q) $(MAKE) -C rboot $(RBOOT_BUILD_BASE)/rboot-stage2a.elf

$(BUILD_DIR)/rboot.elf: $(BUILD_DIR)/rboot-hex2a.h
	$(Q) $(MAKE) -C rboot $(RBOOT_BUILD_BASE)/rboot.elf

$(BUILD_DIR) $(FIRMWARE_DIR):
	$(Q) mkdir -p "$@"

flash: $(FIRMWARE_DIR)/rboot.bin
	$(Q) $(ESPTOOL) -p $(ESPPORT) -b $(ESPBAUD) write_flash $(ESPTOOL_ARGS) 0x0 $<

clean:
	$(Q) rm -rf $(BUILD_DIR)
	$(Q) rm -rf $(FIRMWARE_DIR)

.PHONY: all clean flash erase_config

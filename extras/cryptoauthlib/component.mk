#
# esp_open_rtos build system component Makefile
#

CRYPTOAUTHLIB_MODULE_DIR = $(cryptoauthlib_ROOT)cryptoauthlib/
CRYPTOAUTHLIB_DIR = $(CRYPTOAUTHLIB_MODULE_DIR)lib/
INC_DIRS += $(cryptoauthlib_ROOT) $(CRYPTOAUTHLIB_DIR) $(CRYPTOAUTHLIB_DIR)basic $(CRYPTOAUTHLIB_DIR)hal

# args for passing into compile rule generation
cryptoauthlib_INC_DIR = $(CRYPTOAUTHLIB_DIR) $(CRYPTOAUTHLIB_DIR)basic
cryptoauthlib_SRC_DIR = \
	$(cryptoauthlib_ROOT) \
	$(CRYPTOAUTHLIB_DIR) \
	$(CRYPTOAUTHLIB_DIR)basic \
	$(CRYPTOAUTHLIB_DIR)crypto \
	$(CRYPTOAUTHLIB_DIR)crypto/hashes \
	$(CRYPTOAUTHLIB_DIR)host

cryptoauthlib_EXTRA_SRC_FILES = $(CRYPTOAUTHLIB_DIR)hal/atca_hal.c $(cryptoauthlib_ROOT)/hal/atca_hal_espfreertos_i2c.c

# default define variable values
CRYPTOAUTHLIB_ROOT_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
include $(CRYPTOAUTHLIB_ROOT_DIR)defaults.mk

ATEC_DEBUG_FLAGS = \
	-DATEC_HAL_DEBUG=$(ATEC_HAL_DEBUG) \
	-DATEC_HAL_VERBOSE_DEBUG=$(ATEC_HAL_VERBOSE_DEBUG) \
	-DATEC_I2C_HAL_DEBUG=$(ATEC_I2C_HAL_DEBUG)

cryptoauthlib_CFLAGS += -DATCA_HAL_I2C -std=gnu11 $(ATEC_DEBUG_FLAGS)

ifeq ($(ATEC_PRINTF_ENABLE), 1)
cryptoauthlib_CFLAGS += -DATCAPRINTF
cryptoauthlib_CXXFLAGS += -DATCAPRINTF
endif

$(eval $(call component_compile_rules,cryptoauthlib))

# Helpful error if git submodule not initialised
$(CRYPTOAUTHLIB_MODULE_DIR):
	$(error "cryptoauthlib git submodule not installed. Please run 'git submodule update --init'")

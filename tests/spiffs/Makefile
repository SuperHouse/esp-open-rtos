PROGRAM=posix_fs_example
PROGRAM_EXTRA_SRC_FILES=./fs-test/fs_test.c

EXTRA_COMPONENTS = extras/spiffs extras/test
FLASH_SIZE = 32

# spiffs configuration
SPIFFS_BASE_ADDR = 0x200000
SPIFFS_SIZE = 0x100000

include ../../common.mk

run_test:
	python ../../extras/test/run_test.py $(ESPPORT)

.PHONY: run_test

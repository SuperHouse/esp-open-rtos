PROGRAM=tests

EXTRA_COMPONENTS=extras/dhcpserver extras/spiffs

PROGRAM_SRC_DIR = . ./cases

FLASH_SIZE = 32

# spiffs configuration
SPIFFS_BASE_ADDR = 0x200000
SPIFFS_SIZE = 0x100000

# Add unity test framework headers & core source file
PROGRAM_INC_DIR = ./unity/src ./fs-test
PROGRAM_EXTRA_SRC_FILES = ./unity/src/unity.c ./fs-test/fs_test.c

TESTCASE_SRC_FILES = $(wildcard $(PROGRAM_DIR)cases/*.c)

# Do not include source files into a static library because when adding this
# library with '--whole-archive' linker gives error that archive contains
# unknown objects (source files)
INCLUDE_SRC_IN_AR = 0

# Link every object in the 'program' archive, to pick up constructor functions for test cases
EXTRA_LDFLAGS = -Wl,--whole-archive $(BUILD_DIR)program.a -Wl,--no-whole-archive

include ../common.mk

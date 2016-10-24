PROGRAM=tests

EXTRA_COMPONENTS=extras/dhcpserver

PROGRAM_SRC_DIR = . ./cases

# Add unity test framework headers & core source file
PROGRAM_INC_DIR = ./unity/src
PROGRAM_EXTRA_SRC_FILES = ./unity/src/unity.c

TESTCASE_SRC_FILES = $(wildcard $(PROGRAM_DIR)cases/*.c)

# Do not include source files into a static library because when adding this
# library with '--whole-archive' linker gives error that archive contains
# unknown objects (source files)
INCLUDE_SRC_INTO_AR = 0

# Link every object in the 'program' archive, to pick up constructor functions for test cases
EXTRA_LDFLAGS = -Wl,--whole-archive $(BUILD_DIR)program.a -Wl,--no-whole-archive

include ../common.mk

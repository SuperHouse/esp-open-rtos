PROGRAM=tests

PROGRAM_SRC_DIR = $(PROGRAM_DIR) $(PROGRAM_DIR)cases

# Add unity test framework headers & core source file
PROGRAM_INC_DIR = $(PROGRAM_DIR)unity/src
PROGRAM_EXTRA_SRC_FILES = $(PROGRAM_DIR)unity/src/unity.c

TESTCASE_SRC_FILES = $(wildcard $(PROGRAM_DIR)cases/*.c)

# Link every object in the 'program' archive, to pick up constructor functions for test cases
EXTRA_LDFLAGS = -Wl,--whole-archive $(BUILD_DIR)program.a -Wl,--no-whole-archive

include ../common.mk

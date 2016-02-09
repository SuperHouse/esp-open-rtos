PROGRAM=tests

EXTRA_LINKER_SCRIPTS = $(PROGRAM_DIR)ld/tests.ld
PROGRAM_SRC_DIR = $(PROGRAM_DIR) $(PROGRAM_DIR)cases

# Add unity test framework headers & core source file
PROGRAM_INC_DIR = $(PROGRAM_DIR)unity/src
PROGRAM_EXTRA_SRC_FILES = $(PROGRAM_DIR)unity/src/unity.c

# append -u <basename_test_entry to the linker arguments for
# each source file in the 'cases' directory, so the test case
# entries get added to the compiled binary
TESTCASE_SRC_FILES = $(wildcard $(PROGRAM_DIR)cases/*.c)
TESTCASE_ENTRIES = $(sort $(patsubst %.c,%,$(TESTCASE_SRC_FILES)))
EXTRA_LDFLAGS = $(foreach entry,$(TESTCASE_ENTRIES),$(BUILD_DIR)program/$(entry).o)

include ../common.mk

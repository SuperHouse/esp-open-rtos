TESTS = $(shell find $(dir $(lastword $(MAKEFILE_LIST))) \
		-mindepth 2 -maxdepth 2 -name Makefile | sed s/Makefile//g)

# Generate some dummy .dummybuild/.dummyrebuild target files
TESTS_BUILD = $(patsubst %,%.dummybuild,$(TESTS))
TESTS_TEST = $(patsubst %,%.dummytest,$(TESTS))

all: $(TESTS_BUILD)

$(TESTS_TEST): $(TESTS_BUILD)

test: $(TESTS_TEST)

%.dummybuild:
	$(MAKE) -C $(dir $@)

%.dummytest:
	$(MAKE) -C $(dir $@) flash
	$(MAKE) -C $(dir $@) run_test

.PHONY: all test
.NOTPARALLEL:
.ONESHELL:

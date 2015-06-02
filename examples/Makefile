warning:
	@echo "******************************************************"
	@echo "You may not want this Makefile, even though it's here!"
	@echo "******************************************************"
	@echo ""
	@echo "SUGGESTIONS:"
	@echo "Running 'make' in one of the subdirectories will build a single example."
	@echo "Running 'make help' in one of the subdirectories will print some help."
	@echo ""
	@echo "OTHERWISE:"
	@echo "This makefile is for building all of the examples at once, as a developer test."
	@echo "To use it, run 'make build-examples' or 'make rebuild-examples'"
	@echo

build-examples:
	set -e
	for example in `find . -mindepth 2 -name Makefile | sed s/Makefile//)`; do
	   $(MAKE) -C $$example
	done

rebuild-examples:
	set -e
	for example in `find . -mindepth 2 -name Makefile | sed s/Makefile//)`; do
	   $(MAKE) -C $$example rebuild
	done

.PHONY: warning rebuild-examples build-examples
.NOTPARALLEL:
.ONESHELL:

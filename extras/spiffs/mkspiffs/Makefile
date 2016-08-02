# Check if SPIFFS_SIZE defined only if not cleaning
ifneq ($(MAKECMDGOALS),clean)
ifndef SPIFFS_SIZE
define ERROR_MSG
Variable SPIFFS_SIZE is not defined.
Cannot build mkspiffs without SPIFFS_SIZE.
Please specify it in your application Makefile.

endef
$(error $(ERROR_MSG))	
endif
endif

# explicitly use gcc as in xtensa build environment it might be set to
# cross compiler
CC = gcc

SOURCES := spiffs_hydrogen.c
SOURCES += spiffs_cache.c
SOURCES += spiffs_gc.c
SOURCES += spiffs_check.c
SOURCES += spiffs_nucleus.c
SOURCES += mkspiffs.c

OBJECTS := $(SOURCES:.c=.o)

VPATH = ../spiffs/src

CFLAGS += -I..
CFLAGS += -DSPIFFS_BASE_ADDR=0   # for image base addr is start of the image
CFLAGS += -DSPIFFS_SIZE=$(SPIFFS_SIZE)

all: mkspiffs

$(OBJECTS): $(SOURCES)

$(OBJECTS): ../spiffs_config.h

mkspiffs: $(OBJECTS)

clean:
	@rm -f mkspiffs
	@rm -f *.o

.PHONY: all clean


STATION_PORT := $(ESPPORT)
AP_PORT := /dev/tty.SLAB_USBtoUART59

all: station ap

flash: ap station

clean: ap station

flash: GOAL=flash

clean: GOAL=clean

station: ESPPORT=$(STATION_PORT)

ap: ESPPORT=$(AP_PORT)

station:
	$(MAKE) -C station $(GOAL)

ap:
	$(MAKE) -C ap $(GOAL)

run_test:
	python ../../extras/test/run_test.py $(STATION_PORT) $(AP_PORT)

.PHONY: all station ap run_test flash clean


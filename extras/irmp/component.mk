# Component makefile for extras/irmp

INC_DIRS += $(irmp_ROOT)..

# args for passing into compile rule generation
irmp_SRC_DIR =  $(irmp_ROOT)

# users can override this setting and get console debug output
IRMP_DEBUG ?= 0
ifeq ($(IRMP_DEBUG),1)
	irmp_CFLAGS = $(CFLAGS) -DIRMP_DEBUG
endif

$(eval $(call component_compile_rules,irmp))

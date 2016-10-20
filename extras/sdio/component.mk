# Component makefile for extras/sdio
INC_DIRS += $(sdio_ROOT)..

# args for passing into compile rule generation
sdio_SRC_DIR = $(sdio_ROOT)

$(eval $(call component_compile_rules,sdio))
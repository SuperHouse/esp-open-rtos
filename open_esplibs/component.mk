# Component makefile for "open sdk libs"

# args for passing into compile rule generation
opensdk_libmain_ROOT = $(opensdk_libmain_DEFAULT_ROOT)libmain
opensdk_libmain_INC_DIR = 
opensdk_libmain_SRC_DIR = $(opensdk_libmain_ROOT)
opensdk_libmain_EXTRA_SRC_FILES = 

opensdk_libmain_CFLAGS = $(CFLAGS)

$(eval $(call component_compile_rules,opensdk_libmain))

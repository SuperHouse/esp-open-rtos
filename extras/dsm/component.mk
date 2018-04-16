# Component makefile for private/dsm

INC_DIRS += $(ROOT)private/dsm

# args for passing into compile rule generation
private/dsm_INC_DIR =  $(ROOT)private/dsm
private/dsm_SRC_DIR =  $(ROOT)private/dsm

$(eval $(call component_compile_rules,private/dsm))

# Component makefile for extras/test

INC_DIRS += $(test_ROOT)..

# args for passing into compile rule generation
test_SRC_DIR =  $(test_ROOT)

$(eval $(call component_compile_rules,test))

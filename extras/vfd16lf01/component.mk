# Component makefile for extras/vfd16lf01

# expected anyone using bmp driver includes it as 'vfd16lf01/vfd16lf01.h'
INC_DIRS += $(vfd16lf01_ROOT)..

# args for passing into compile rule generation
vfd16lf01_SRC_DIR =  $(vfd16lf01_ROOT)

$(eval $(call component_compile_rules,vfd16lf01))

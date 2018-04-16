# Component makefile for private/hw_pwm

INC_DIRS += $(ROOT)private/hw_pwm

# args for passing into compile rule generation
private/hw_pwm_INC_DIR =  $(ROOT)private/hw_pwm
private/hw_pwm_SRC_DIR =  $(ROOT)private/hw_pwm

$(eval $(call component_compile_rules,private/hw_pwm))

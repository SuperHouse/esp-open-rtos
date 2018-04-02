# Component makefile for extras/uart_repl

# expected anyone using RTC driver includes it as 'uart_repl/uart_repl.h'
INC_DIRS += $(uart_repl_ROOT)..

# args for passing into compile rule generation
uart_repl_SRC_DIR = $(uart_repl_ROOT)

$(eval $(call component_compile_rules,uart_repl))

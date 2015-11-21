# Component makefile for extras/stdin_uart_interrupt
#
# See examples/terminal for usage. Well, actually there is no need to see it
# for 'usage' as this module is a drop-in replacement for the original polled
# version of reading from the UART.

INC_DIRS += $(ROOT)extras/stdin_uart_interrupt

# args for passing into compile rule generation
extras/stdin_uart_interrupt_INC_DIR =  $(ROOT)extras/stdin_uart_interrupt
extras/stdin_uart_interrupt_SRC_DIR =  $(ROOT)extras/stdin_uart_interrupt

$(eval $(call component_compile_rules,extras/stdin_uart_interrupt))

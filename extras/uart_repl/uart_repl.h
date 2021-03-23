#ifndef _SWC_UART_REPL_
#define _SWC_UART_REPL_
#include <stddef.h> /* size_t */
#include <stdarg.h> /* varargs */


#if 0
/* in the future, maybe add support for special keys */
enum uart_repl_special_key {
	UART_REPL_NONE,
	UART_REPL_UP,
	UART_REPL_DOWN,
	UART_REPL_RIGHT,
	UART_REPL_LEFT,
};
#endif

typedef void (*uart_repl_handler)(char const *);

/* various helpers to allow us to gracefully show output */
void error(const char *, ...);
void debug(const char *, ...);
void response(const char *, ...);

struct serial_terminal_status {
	char line[80];
	unsigned int lineCursorPosition; // this is the index of the next character to be written
	unsigned int lineLength; // length of string total so far
	char lastReadChar;
	uart_repl_handler lineCb;
	enum uart_repl_ansi_parse_state {
		UART_REPL_ANSI_NONE = 0,
		UART_REPL_ANSI_JUST_ESCAPED,
		UART_REPL_ANSI_READ_CSI_PARAMETER_BYTES,
		UART_REPL_ANSI_READ_CSI_INTERMEDIATE_BYTES,
		UART_REPL_ANSI_READ_CSI_FINAL_BYTE,
	} state;
	struct {
		unsigned int parameter_n_bytes;
		unsigned int intermediate_n_bytes;
		char parameter_bytes[10];
		char intermediate_bytes[10];
		char final_byte;
	} csi_seq;
};

void uart_repl_task(void *);
void uart_repl_init(uart_repl_handler);

#endif /* ndef _SWC_UART_REPL_ */


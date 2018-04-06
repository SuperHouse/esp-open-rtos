/* Read-Evaluate-Print Loop over UART
 *
 * This is a library that allows you to quickly prototype REPL-type loops.
 * Currently, basic ANSI escape sequences are supported so that GNU screen(1)
 * can be used with the delete and arrow keys. The framework is very expandable
 * to other ANSI escape sequences.
 *
 * Dependencies: it is recommended that you also use extras/stdin_uart_interrupt
 * to make this more responsive.
 */

#include <uart_repl/uart_repl.h>

#include <stdio.h> /* fflush, fputs, putchar, stdout, STDIN_FILENO */
#include <string.h>/* memset */
#include <unistd.h> /* read */
#include <ctype.h> /* isalnum */

#include <FreeRTOS.h>
#include <task.h> /* vTaskDelete, xTaskCreate */


/* This is a helper macro which creates a highly-localized and optimizable
 * function. It greatly aids in code readability, and the compiler should be
 * able to eliminate most of the stack overhead from these function calls.
 *
 * Note: Uses a GCC-specific version of VA_ARGS that allows us to have no
 *       arguments specified (the default case). */
#define UTIL(F, ...) static void F(struct serial_terminal_status *ST, \
                                   ##__VA_ARGS__)

// convenience macros
#define POS (ST->lineCursorPosition)
#define LEN (ST->lineLength)
#define CH (ST->lastReadChar)
#define LINE (ST->line)
#define STATE (ST->state)
#define CSI (ST->csi_seq)


UTIL(bell) {
	// ring bell
	putchar('\a');
}

UTIL(arrowLeft) {
	if (POS) {
		POS--;
		putchar('\b'); // move cursor backward
	} else {
		bell(ST);
	}
}

UTIL(arrowRight) {
	if (POS < LEN) {
		putchar(LINE[POS++]);
	} else {
		bell(ST);
	}
}

UTIL(arrowUp) {
	// TODO - in the future perhaps we can support line history
	bell(ST);
}
UTIL(arrowDown) {
	// TODO - in the future perhaps we can support line history
	bell(ST);
}

UTIL(backSpace) {
	if (POS) {
		int j;

		// copy the rest of the string (if any) one character backwards, and
		// also update the screen as we go
		putchar('\b');
		for (j = POS; j < LEN; j++) {
			LINE[j-1] = LINE[j];
			putchar(LINE[j-1]);
		}

		// erase the ending character, also account for the loss
		putchar(' ');
		putchar('\b');
		LINE[--LEN] = '\0';
		POS--;

		// we just moved the cursor right a few spaces, so reset it now
		for (j = LEN - POS; j > 0; putchar('\b'), j--);

	} else {
		bell(ST);
	}
}

UTIL(deleteKey) {
	if (POS < LEN) {
		arrowRight(ST);
		backSpace(ST);
	} else {
		bell(ST);
	}
}


UTIL(prompt) {
	while (POS) {
		LINE[--POS] = '\0';
	}
	LEN = 0;
	fputs("> ", stdout);
}


UTIL(pushPrintable) {
	if (POS == LEN) {
		// XXX TODO could overflow
		LINE[POS+1] = '\0';
	}
	LINE[POS] = CH;
	LEN++;
	POS++;
	putchar(CH);
}

UTIL(realEscapeKey) {
	//fputs("<Esc>", stdout);
}

UTIL(nonAnsiChar) {

	// normal printable, echoing character (but line might be full)
	if (CH >= 0x20 && CH < 0x7F) {
		if (POS + 1 < sizeof(LINE)) {
			// if line length is respected...
			pushPrintable(ST);
		} else {
			bell(ST);
		}

	// Backspace key or CTRL+H
	} else if (0x7F == CH || 0x08 == CH) {
		backSpace(ST);
	
	// <Enter> key
	} else if ('\n' == CH || '\r' == CH) {
		putchar('\n');
		ST->lineCb((char const *) LINE);
		prompt(ST);

	// CTRL+C, abort current command
	} else if (0x03 == CH) {
		bell(ST);
		putchar('\n');
		prompt(ST);

	// CTRL+L, redraw on new line
	} else if (0x0C == CH) {
		putchar('\n');
		prompt(ST);
		fputs(LINE, stdout);

	// CTRL+U, clear line in place
	} else if (0x15 == CH) {
		while (POS) {
			fputs("\b \b", stdout);
			LINE[--POS] = '\0';
			LEN--;
		}

	// <Esc>, starting an escape sequence maybe
	} else if (0x1b == CH) {
		/*
		 * There is going to be an issue here, and POS cannot fix it right now.
		 * There is a non-determinism when using only the character queue. It
		 * turns out that the ANSI escape sequence parser will need to introduce
		 * some kind of waiting concept to determine whether a given <Esc> is
		 * due to an escape sequence or just a stand-alone escape.
		 *
		 * TODO: For now, we just assume Esc is always part of an ANSI escape
		 * sequence. In the future. the character-wise state machine should
		 * incorporate one external event (a delay after pressing <Esc>) that
		 * can be used to determine a given <Esc> is stand-alone after that
		 * given time-out.
		 */
		STATE = UART_REPL_ANSI_JUST_ESCAPED;

	} else {
		// nonprintable or unhandled character; do nothing!
		//printf("<NP 0x%02x>", CH);
	}
}


UTIL(AnsiCSIBackout) {

	if (UART_REPL_ANSI_NONE == STATE) {
		// nothing to do
		return;
	}

	/* If this gets called, we are part of the way thru parsing an ANSI
	 * sequence, and we need to back out of it from whereever we're at in the
	 * parsing process. Use the existing state information to functionally
	 * ignore this ANSI escape sequence by using nonAnsiChar(ST) to re-handle the
	 * keys in the proper order. if this routine is called after the CSI
	 * structure has been completely populated, it is assumed the CH character
	 * will still represent the final byte by the time we get here. so if
	 * AnsiCSIBackout is called from e.g. arrowRight(), it is assumed that CH is
	 * still equal to final_byte.
	 */

	char tempChar;
	int j;

	switch (STATE) {
		case UART_REPL_ANSI_JUST_ESCAPED:
			// handled below, only back out one character
			realEscapeKey(ST);
			nonAnsiChar(ST);
			STATE = UART_REPL_ANSI_NONE;
			break;
		case UART_REPL_ANSI_READ_CSI_PARAMETER_BYTES:
		case UART_REPL_ANSI_READ_CSI_INTERMEDIATE_BYTES:
		case UART_REPL_ANSI_READ_CSI_FINAL_BYTE:
			realEscapeKey(ST);
			tempChar = CH; // backup the current key
			CH = '[';
			nonAnsiChar(ST);
			for (j = 0; j < CSI.parameter_n_bytes; j++) {
				CH = CSI.parameter_bytes[j];
				nonAnsiChar(ST);
				CSI.parameter_bytes[j] = '\0';
				CSI.parameter_n_bytes--;
			}
			for (j = 0; j < CSI.intermediate_n_bytes; j++) {
				CH = CSI.intermediate_bytes[j];
				nonAnsiChar(ST);
				CSI.intermediate_bytes[j] = '\0';
				CSI.intermediate_n_bytes--;
			}
			CH = tempChar; // restore
			nonAnsiChar(ST);
			STATE = UART_REPL_ANSI_NONE;
			break;
		case UART_REPL_ANSI_NONE:
		default:
			break;
	}
}


/* this takes an input of the csi_seq structure, and does whatever it wants with
 * it */
UTIL(AnsiCSI) {
	switch (CSI.final_byte) {
		// handle arrow keys (note: shifted versions are not captured)
		case 'A': arrowUp(ST);    break;
		case 'B': arrowDown(ST);  break;
		case 'C': arrowRight(ST); break;
		case 'D': arrowLeft(ST);  break;
		case '~':
			if (1 == CSI.parameter_n_bytes) {
				switch (CSI.parameter_bytes[0]) {
					//case '1': fputs("<Home>", stdout); break;
					//case '2': fputs("<Ins>", stdout); break;
					case '3': deleteKey(ST); break;
					//case '4': fputs("<End>", stdout); break;
					//case '5': fputs("<PgUp>", stdout); break;
					//case '6': fputs("<PgDn>", stdout); break;
					default: AnsiCSIBackout(ST); break;
				}
			} else {
				AnsiCSIBackout(ST);
			}
			break;
		default:
			AnsiCSIBackout(ST);
			break;
	}
}



UTIL(readCH) {
	if (!read(STDIN_FILENO, (void*)&CH, 1)) {
		fputs("never see this print as read(...) is blocking\n", stdout);
	}
}




UTIL(MainStateMachine) {
	prompt(ST);

top:
	fflush(stdout);
	switch (STATE) {
		case UART_REPL_ANSI_NONE:
			readCH(ST);
			nonAnsiChar(ST);
			break;

		case UART_REPL_ANSI_JUST_ESCAPED:
			readCH(ST);

			CSI.parameter_n_bytes = 0;
			CSI.intermediate_n_bytes = 0;

			/* Wikipedia: Sequences have different lengths. All sequences start
			 * with ESC (27 / hex 0x1B), followed by a second byte in the range
			 * 0x40–0x5F (ASCII @A–Z[\]^_). */
			if (CH < 0x40 || CH > 0x5F) {
				AnsiCSIBackout(ST);
			} else if ('[' == CH) {
				STATE = UART_REPL_ANSI_READ_CSI_PARAMETER_BYTES;
				readCH(ST);
			} else {
				AnsiCSIBackout(ST);
			}
			break;

		/* Wikipedia: The ESC [ is followed by any number (including none) of
		 * "parameter bytes" in the range 0x30–0x3F (ASCII 0–9:;<=>?), then by
		 * any number of "intermediate bytes" in the range 0x20–0x2F (ASCII
		 * space and !"#$%&'()*+,-./), then finally by a single "final byte" in
		 * the range 0x40–0x7E (ASCII @A–Z[\]^_`a–z{|}~). */
		case UART_REPL_ANSI_READ_CSI_PARAMETER_BYTES:
			if (CH >= 0x30 && CH <= 0x3F) {
				// valid parameter byte
				CSI.parameter_bytes[CSI.parameter_n_bytes++] = CH;
				readCH(ST); // for the next thing
			} else if (CH >= 0x20 && CH <= 0x2F) {
				// valid intermediate byte
				STATE = UART_REPL_ANSI_READ_CSI_INTERMEDIATE_BYTES;
			} else if (CH >= 0x40 && CH <= 0x7E) {
				// valid final byte
				STATE = UART_REPL_ANSI_READ_CSI_FINAL_BYTE;
			} else {
				AnsiCSIBackout(ST);
			}
			break;

		case UART_REPL_ANSI_READ_CSI_INTERMEDIATE_BYTES:
			if (CH >= 0x20 && CH <= 0x2F) {
				// valid intermediate byte
				CSI.intermediate_bytes[CSI.intermediate_n_bytes++] = CH;
				readCH(ST); // for the next thing
			} else if (CH >= 0x40 && CH <= 0x7E) {
				// valid final byte
				STATE = UART_REPL_ANSI_READ_CSI_FINAL_BYTE;
			} else {
				AnsiCSIBackout(ST);
			}
			break;

		case UART_REPL_ANSI_READ_CSI_FINAL_BYTE:
			if (CH >= 0x40 && CH <= 0x7E) {
				// valid final byte
				CSI.final_byte = CH;
				AnsiCSI(ST);
				STATE = UART_REPL_ANSI_NONE;
			} else {
				AnsiCSIBackout(ST);
			}
			break;
	}

	goto top;
}

#undef UTIL
#undef POS
#undef LINE
#undef LEN
#undef CH
#undef STATE


// local variable that holds the status
struct serial_terminal_status cc;

void uart_repl_task(void *pvParameters) {
	memset(&cc, 0, sizeof(cc));
	cc.lineCb = pvParameters;
	MainStateMachine(&cc);
	vTaskDelete(NULL); // just in case we get here
}


void uart_repl_init(uart_repl_handler line_cb) {
	xTaskCreate(uart_repl_task, "uart_repl", 256, (void *)line_cb, 10, NULL);
}

void error(const char* format, ...) {
	va_list argptr;
	va_start(argptr, format);
	
	// TODO preempt the console stuff
	taskENTER_CRITICAL();
	printf("\x1b[1;31mERROR:\x1b[1m ");
	vprintf(format, argptr);
	printf("\x1b[0m");
	fflush(stdout);
	taskEXIT_CRITICAL();
	va_end(argptr);
}

// TODO some day replace this with a callback or something, so that it is not
// named statically
void response(const char* format, ...) {
	va_list argptr;
	va_start(argptr, format);
	
	// TODO preempt the console stuff
	vprintf(format, argptr);
	fflush(stdout);
	va_end(argptr);

	// TODO track if the last character was a newline; if not, make sure
	// prompt() handles it by adding a newline
}

void debug(const char* format, ...) {
	va_list argptr;
	va_start(argptr, format);
	
	// TODO preempt the console stuff
	vprintf(format, argptr);
	fflush(stdout);
	va_end(argptr);
}


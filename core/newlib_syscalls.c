/* newlib_syscalls.c - newlib syscalls for ESP8266
 *
 * Part of esp-open-rtos
 * Copyright (C) 2105 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */
#include <sys/reent.h>
#include <sys/types.h>
#include <sys/errno.h>
#include <espressif/sdk_private.h>
#include <common_macros.h>
#include <esp/uart.h>
#include <stdlib.h>

IRAM caddr_t _sbrk_r (struct _reent *r, int incr)
{
    extern char   _heap_start; /* linker script defined */
    static char * heap_end;
    char *        prev_heap_end;

    if (heap_end == NULL)
	heap_end = &_heap_start;
    prev_heap_end = heap_end;
    /* TODO: Check stack collision
       if (heap_end + incr > stack_ptr)
       {
       _write (1, "_sbrk: Heap collided with stack\n", 32);
       abort();
       }
    */
    heap_end += incr;

    return (caddr_t) prev_heap_end;
}

/* syscall implementation for stdio write to UART */
long _write_r(struct _reent *r, int fd, const char *ptr, int len )
{
    if(fd != r->_stdout->_file) {
        r->_errno = EBADF;
        return -1;
    }
    for(int i = 0; i < len; i++) {
        /* Auto convert CR to CRLF, ignore other LFs (compatible with Espressif SDK behaviour) */
        if(ptr[i] == '\r')
            continue;
        if(ptr[i] == '\n')
            uart_putc(0, '\r');
        uart_putc(0, ptr[i]);
    }
    return len;
}

/* syscall implementation for stdio read from UART */
__attribute__((weak)) long _read_r( struct _reent *r, int fd, char *ptr, int len )
{
    int ch, i;

    if(fd != r->_stdin->_file) {
        r->_errno = EBADF;
        return -1;
    }
    uart_rxfifo_wait(0, 1);
    for(i = 0; i < len; i++) {
        ch = uart_getc_nowait(0);
        if (ch < 0) break;
        ptr[i] = ch;
    }
    return i;
}

/* Stub syscall implementations follow, to allow compiling newlib functions that
   pull these in via various codepaths
*/
__attribute__((alias("syscall_returns_enosys"))) int _open_r(struct _reent *r, const char *pathname, int flags, int mode);
__attribute__((alias("syscall_returns_enosys"))) int _fstat_r(struct _reent *r, int fd, void *buf);
__attribute__((alias("syscall_returns_enosys"))) int _close_r(struct _reent *r, int fd);
__attribute__((alias("syscall_returns_enosys"))) off_t _lseek_r(struct _reent *r, int fd, off_t offset, int whence);

/* Generic stub for any newlib syscall that fails with errno ENOSYS
   ("Function not implemented") and a return value equivalent to
   (int)-1. */
static int syscall_returns_enosys(struct _reent *r)
{
    r->_errno=ENOSYS;
    return -1;
}

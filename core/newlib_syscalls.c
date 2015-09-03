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
       while(1) {}
       }
    */
    heap_end += incr;

    return (caddr_t) prev_heap_end;
}

/* syscall implementation for stdio write to UART

   at the moment UART functionality is all still in the binary SDK
 */
long _write_r(struct _reent *r, int fd, const char *ptr, int len )
{
    if(fd != r->_stdout->_file) {
        r->_errno = EBADF;
        return -1;
    }
    for(int i = 0; i < len; i++)
	sdk_os_putc(ptr[i]);
    return len;
}

/* syscall implementation for stdio read from UART

   at the moment UART functionality is all still in the binary SDK
 */
long _read_r( struct _reent *r, int fd, char *ptr, int len )
{
    if(fd != r->_stdin->_file) {
        r->_errno = EBADF;
        return -1;
    }
    for(int i = 0; i < len; i++) {
        char ch;
        while (sdk_uart_rx_one_char(&ch)) ;
        ptr[i] = ch;
    }
    return len;
}

/* These are stub implementations for the reentrant syscalls that
 * newlib is configured to expect */
int _fstat_r(struct _reent *r, int fd, void *buf)
{
    return -1;
}

int _close_r(struct _reent *r, int fd)
{
    return -1;
}

off_t _lseek_r(struct _reent *r, int fd, off_t offset, int whence)
{
    return (off_t)-1;
}


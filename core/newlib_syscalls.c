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
#include <xtensa_ops.h>
#include <esp/uart.h>
#include <stdlib.h>
#include <stdout_redirect.h>
#include <sys/time.h>
#include <lwip/sockets.h>

/*
 * The file descriptor index space is allocated in blocks. The first block of 3
 * is for newlib I/O the stdin stdout and stderr. The next block of
 * MEMP_NUM_NETCONN is allocated for lwip sockets, and the remainer to file
 * system descriptors. The newlib default FD_SETSIZE is 64.
 */
#if LWIP_SOCKET_OFFSET < 3
#error Expecting a LWIP_SOCKET_OFFSET >= 3, to allow room for the standard I/O descriptors.
#endif
#define FILE_DESCRIPTOR_OFFSET (LWIP_SOCKET_OFFSET + MEMP_NUM_NETCONN)
#if FILE_DESCRIPTOR_OFFSET > FD_SETSIZE
#error Too many lwip sockets for the FD_SETSIZE.
#endif

extern void *xPortSupervisorStackPointer;

IRAM caddr_t _sbrk_r (struct _reent *r, int incr)
{
    extern char   _heap_start; /* linker script defined */
    static char * heap_end;
    char *        prev_heap_end;

    if (heap_end == NULL)
	heap_end = &_heap_start;
    prev_heap_end = heap_end;

    intptr_t sp = (intptr_t)xPortSupervisorStackPointer;
    if(sp == 0) /* scheduler not started */
        SP(sp);

    if ((intptr_t)heap_end + incr >= sp)
    {
        r->_errno = ENOMEM;
        return (caddr_t)-1;
    }

    heap_end += incr;

    return (caddr_t) prev_heap_end;
}

/* syscall implementation for stdio write to UART */
__attribute__((weak)) long _write_stdout_r(struct _reent *r, int fd, const char *ptr, int len )
{
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

static _WriteFunction *current_stdout_write_r = &_write_stdout_r;

void set_write_stdout(_WriteFunction *f)
{
    if  (f != NULL) {
        current_stdout_write_r = f;
    } else {
        current_stdout_write_r = &_write_stdout_r;
    }
}

_WriteFunction *get_write_stdout()
{
    return current_stdout_write_r;
}

/* default implementation, replace in a filesystem */
__attribute__((weak)) long _write_filesystem_r(struct _reent *r, int fd, const char *ptr, int len )
{
    r->_errno = EBADF;
    return -1;
}

__attribute__((weak)) long _write_r(struct _reent *r, int fd, const char *ptr, int len )
{
    if (fd >= FILE_DESCRIPTOR_OFFSET) {
        return _write_filesystem_r(r, fd, ptr, len);
    }
    if (fd >= LWIP_SOCKET_OFFSET) {
        return lwip_write(fd, ptr, len);
    }
    if (fd == r->_stdout->_file) {
        return current_stdout_write_r(r, fd, ptr, len);
    }
    r->_errno = EBADF;
    return -1;
}

/* syscall implementation for stdio read from UART */
__attribute__((weak)) long _read_stdin_r(struct _reent *r, int fd, char *ptr, int len)
{
    int ch, i;
    uart_rxfifo_wait(0, 1);
    for(i = 0; i < len; i++) {
        ch = uart_getc_nowait(0);
        if (ch < 0) break;
        ptr[i] = ch;
    }
    return i;
}

/* default implementation, replace in a filesystem */
__attribute__((weak)) long _read_filesystem_r( struct _reent *r, int fd, char *ptr, int len )
{
    r->_errno = EBADF;
    return -1;
}

__attribute__((weak)) long _read_r( struct _reent *r, int fd, char *ptr, int len )
{
    if (fd >= FILE_DESCRIPTOR_OFFSET) {
        return _read_filesystem_r(r, fd, ptr, len);
    }
    if (fd >= LWIP_SOCKET_OFFSET) {
        return lwip_read(fd, ptr, len);
    }
    if (fd == r->_stdin->_file) {
        _read_stdin_r(r, fd, ptr, len);
    }
    r->_errno = EBADF;
    return -1;
}

/* default implementation, replace in a filesystem */
__attribute__((weak)) int _close_filesystem_r(struct _reent *r, int fd)
{
    r->_errno = EBADF;
    return -1;
}

__attribute__((weak)) int _close_r(struct _reent *r, int fd)
{
    if (fd >= FILE_DESCRIPTOR_OFFSET) {
        return _close_filesystem_r(r, fd);
    }
    if (fd >= LWIP_SOCKET_OFFSET) {
        return lwip_close(fd);
    }
    r->_errno = EBADF;
    return -1;
}

/* Stub syscall implementations follow, to allow compiling newlib functions that
   pull these in via various codepaths
*/
__attribute__((weak, alias("syscall_returns_enosys"))) 
int _open_r(struct _reent *r, const char *pathname, int flags, int mode);

__attribute__((weak, alias("syscall_returns_enosys"))) 
int _unlink_r(struct _reent *r, const char *path);

__attribute__((weak, alias("syscall_returns_enosys"))) 
int _fstat_r(struct _reent *r, int fd, void *buf);

__attribute__((weak, alias("syscall_returns_enosys"))) 
int _stat_r(struct _reent *r, const char *pathname, void *buf);

__attribute__((weak, alias("syscall_returns_enosys"))) 
off_t _lseek_r(struct _reent *r, int fd, off_t offset, int whence);

__attribute__((weak, alias("_gettimeofday_r")))
int _gettimeofday_r _PARAMS ((struct _reent *r, struct timeval *now, void *p)) {
  now->tv_sec = 0;
  now->tv_usec = 0;
  errno = ENOSYS;
  return -1;
}

/* Generic stub for any newlib syscall that fails with errno ENOSYS
   ("Function not implemented") and a return value equivalent to
   (int)-1. */
static int syscall_returns_enosys(struct _reent *r)
{
    r->_errno=ENOSYS;
    return -1;
}

/*
 * Part of esp-open-rtos
 * Copyright (C) 2016 Oto Petrik <oto.petrik@gmail.com>
 * BSD Licensed as described in the file LICENSE
 */

#ifndef _STDOUT_REDIRECT_H_
#define _STDOUT_REDIRECT_H_

#ifdef __cplusplus
extern "C"
{
#endif

typedef long _WriteFunction(struct _reent *r, int fd, const char *ptr, int len );

void set_write_stdout(_WriteFunction *f);
_WriteFunction *get_write_stdout();

#ifdef __cplusplus
}
#endif

#endif /* _STDOUT_REDIRECT_H_ */

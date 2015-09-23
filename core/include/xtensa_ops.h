/** xtensa_ops.h
 *
 * Special macros/etc which deal with Xtensa-specific architecture/CPU
 * considerations.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */

#ifndef _XTENSA_OPS_H
#define _XTENSA_OPS_H

// GCC macros for reading, writing, and exchanging Xtensa processor special
// registers:

#define RSR(var, reg) asm volatile ("rsr %0, " #reg : "=r" (var));
#define WSR(var, reg) asm volatile ("wsr %0, " #reg : : "r" (var));
#define XSR(var, reg) asm volatile ("xsr %0, " #reg : "+r" (var));

#endif /* _XTENSA_OPS_H */

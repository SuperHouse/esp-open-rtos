#ifndef _OPEN_ESPLIBS_H
#define _OPEN_ESPLIBS_H

// This header includes conditional defines to control which bits of the
// Open-Source libraries get built when building esp-open-rtos.  This can be
// useful for quickly troubleshooting whether a bug is due to the
// reimplementation of Espressif libraries, or something else.

#ifndef OPEN_ESPLIBS
#define OPEN_ESPLIBS 1
#endif

#ifndef OPEN_LIBMAIN
#define OPEN_LIBMAIN (OPEN_ESPLIBS)
#endif

#ifndef OPEN_LIBMAIN_MISC
#define OPEN_LIBMAIN_MISC (OPEN_LIBMAIN)
#endif
#ifndef OPEN_LIBMAIN_OS_CPU_A
#define OPEN_LIBMAIN_OS_CPU_A (OPEN_LIBMAIN)
#endif
#ifndef OPEN_LIBMAIN_SPI_FLASH
#define OPEN_LIBMAIN_SPI_FLASH (OPEN_LIBMAIN)
#endif
#ifndef OPEN_LIBMAIN_TIMERS
#define OPEN_LIBMAIN_TIMERS (OPEN_LIBMAIN)
#endif
#ifndef OPEN_LIBMAIN_UART
#define OPEN_LIBMAIN_UART (OPEN_LIBMAIN)
#endif
#ifndef OPEN_LIBMAIN_XTENSA_CONTEXT
#define OPEN_LIBMAIN_XTENSA_CONTEXT (OPEN_LIBMAIN)
#endif
#ifndef OPEN_LIBMAIN_USER_INTERFACE
#define OPEN_LIBMAIN_USER_INTERFACE (OPEN_LIBMAIN)
#endif

#endif /* _OPEN_ESPLIBS_H */

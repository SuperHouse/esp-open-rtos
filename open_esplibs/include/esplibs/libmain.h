/* Internal function declarations for Espressif SDK libmain functions.

   These are internal-facing declarations, it is not recommended to include these headers in your program.
   (look at the headers in include/espressif/ instead and use these whenever possible.)

   Copyright (C) 2015 Espressif Systems. Derived from MIT Licensed SDK libraries.
   BSD Licensed as described in the file LICENSE.
*/
#include "sdk_internal.h"
#ifndef _ESPLIBS_LIBMAIN_H
#define _ESPLIBS_LIBMAIN_H

#include "sdk_internal.h"

// misc.c
int sdk_os_get_cpu_frequency(void);

/* Don't call this function from user code, it doesn't change the CPU
 * speed. Call sdk_system_update_cpu_freq() instead. */
void sdk_os_update_cpu_frequency(int freq);

// user_interface.c
void sdk_system_restart_in_nmi(void);
int sdk_system_get_test_result(void);
void sdk_wifi_param_save_protect(struct sdk_g_ic_saved_st *data);
bool sdk_system_overclock(void);
bool sdk_system_restoreclock(void);
uint32_t sdk_system_relative_time(uint32_t reltime);

#endif /* _ESPLIBS_LIBMAIN_H */


#ifndef _ESPLIBS_LIBMAIN_H
#define _ESPLIBS_LIBMAIN_H

// misc.c
int sdk_os_get_cpu_frequency(void);
void sdk_os_update_cpu_frequency(int freq);

// user_interface.c
void sdk_system_restart_in_nmi(void);
int sdk_system_get_test_result(void);
void sdk_wifi_param_save_protect(struct sdk_g_ic_saved_st *data);
bool sdk_system_overclock(void);
bool sdk_system_restoreclock(void);
uint32_t sdk_system_relative_time(uint32_t reltime);

#endif /* _ESPLIBS_LIBMAIN_H */


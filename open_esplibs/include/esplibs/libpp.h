/* Internal function declarations for Espressif SDK libpp functions.

   These are internal-facing declarations, it is not recommended to include these headers in your program.
   (look at the headers in include/espressif/ instead and use these whenever possible.)

   Copyright (C) 2015 Espressif Systems. Derived from MIT Licensed SDK libraries.
   BSD Licensed as described in the file LICENSE.
*/
#ifndef _ESPLIBS_LIBPP_H
#define _ESPLIBS_LIBPP_H

// Located in wdev.o
extern uint32_t sdk_WdevTimOffSet;

// Defined in pp.o: .irom0.text+0xa08
void sdk_ppRecycleRxPkt(void *);

// Defined in pm.o: .irom0.text+0x74
uint32_t sdk_pm_rtc_clock_cali_proc(void);

// Defined in pm.o: .irom0.text+0xb8
void sdk_pm_set_sleep_time(uint32_t);

// Defined in pm.o: .irom0.text+0x1758
uint8_t sdk_pm_is_waked(void);

// Defined in pm.o: .irom0.text+0x1774
bool sdk_pm_is_open(void);

// Defined in pm.o: .irom0.text+0x19ac
bool sdk_pm_post(int);

// Defined in wdev.o: .irom0.text+0x450
void sdk_wDev_MacTim1SetFunc(void (*func)(void));

// Defined in wdev.o: .text+0x4a8
void sdk_wDev_MacTim1Arm(uint32_t);

#endif /* _ESPLIBS_LIBPP_H */


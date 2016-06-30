/* Internal function declarations for Espressif SDK libnet80211 functions.

   These are internal-facing declarations, it is not recommended to include these headers in your program.
   (look at the headers in include/espressif/ instead and use these whenever possible.)

   Copyright (C) 2015 Espressif Systems. Derived from MIT Licensed SDK libraries.
   BSD Licensed as described in the file LICENSE.
*/
#ifndef _ESPLIBS_LIBNET80211_H
#define _ESPLIBS_LIBNET80211_H

// Defined in wl_cnx.o
extern ETSTimer sdk_sta_con_timer;

// Defined in ieee80211_sta.o: .irom0.text+0xcc4
bool sdk_wifi_station_stop(void);

// Defined in ieee80211_hostap.o: .irom0.text+0x1184
bool sdk_wifi_softap_stop(void);

#endif /* _ESPLIBS_LIBNET80211_H */


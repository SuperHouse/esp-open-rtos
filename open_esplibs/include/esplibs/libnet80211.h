#ifndef _ESPLIBS_LIBNET80211_H
#define _ESPLIBS_LIBNET80211_H

// Defined in wl_cnx.o
extern ETSTimer sdk_sta_con_timer;

// Defined in ieee80211_sta.o: .irom0.text+0xcc4
bool sdk_wifi_station_stop(void);

// Defined in ieee80211_hostap.o: .irom0.text+0x1184
bool sdk_wifi_softap_stop(void);

#endif /* _ESPLIBS_LIBNET80211_H */


/* Recreated Espressif libnet80211 ieee80211_hostap.o contents.

   Copyright (C) 2015 Espressif Systems. Derived from MIT Licensed SDK libraries.
   BSD Licensed as described in the file LICENSE
*/
#include "open_esplibs.h"
#if OPEN_LIBNET80211_HOSTAP
// The contents of this file are only built if OPEN_LIBNET80211_HOSTAP is set to true

#include "sdk_internal.h"

void sdk_ieee80211_send_mgmt(void *, int, int);
void sdk_cnx_node_leave(struct sdk_g_ic_netif_info *netif, struct sdk_netif_conninfo *conn);

void sdk_hostap_handle_timer(struct sdk_netif_conninfo *cnx_node)
{
    uint32_t count1 = *(uint32_t *)(((void *)cnx_node) + 0x108);
    uint32_t count2 = TIMER_FRC2.COUNT;

    if ((count2 - count1) > 93599688U) {
        struct sdk_g_ic_netif_info *info = sdk_g_ic.v.softap_netif_info;
        struct sdk_netif_conninfo *conninfo = info->_unknown88;
        info->_unknown88 = cnx_node;
        sdk_ieee80211_send_mgmt(info, 160, 4);
        sdk_ieee80211_send_mgmt(info, 192, 2);
        info->_unknown88 = conninfo;
        sdk_cnx_node_leave(info, cnx_node);
    }
}

#endif /* OPEN_LIBNET80211_HOSTAP */

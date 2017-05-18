/* Recreated Espressif libnet80211 ieee80211_hostap.o contents.

   Copyright (C) 2015 Espressif Systems. Derived from MIT Licensed SDK libraries.
   BSD Licensed as described in the file LICENSE
*/
#include "open_esplibs.h"
#if OPEN_LIBNET80211_HOSTAP
// The contents of this file are only built if OPEN_LIBNET80211_HOSTAP is set to true

#include "esplibs/libnet80211.h"

void IRAM sdk_hostap_handle_timer(struct sdk_netif_conninfo *cnx_node)
{
    uint32_t count1 = cnx_node->_unknown108;
    uint32_t count2 = TIMER_FRC2.COUNT;

    if ((count2 - count1) > 93599688U) {
        struct sdk_g_ic_netif_info *netif_info = sdk_g_ic.v.softap_netif_info;
        struct sdk_netif_conninfo *conninfo = netif_info->_unknown88;
        netif_info->_unknown88 = cnx_node;
        sdk_ieee80211_send_mgmt(netif_info, 160, 4);
        sdk_ieee80211_send_mgmt(netif_info, 192, 2);
        netif_info->_unknown88 = conninfo;
        sdk_cnx_node_leave(netif_info, cnx_node);
    }
}

#endif /* OPEN_LIBNET80211_HOSTAP */

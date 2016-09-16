/* Recreated Espressif libnet80211 wl_cnx.o contents.

   Copyright (C) 2015 Espressif Systems. Derived from MIT Licensed SDK libraries.
   BSD Licensed as described in the file LICENSE
*/
#include "open_esplibs.h"
#if OPEN_LIBNET80211_WL_CNX
// The contents of this file are only built if OPEN_LIBNET80211_WL_CNX is set to true

#include "espressif/esp_misc.h"
#include "sdk_internal.h"
#include <string.h>

void *sdk_cnx_node_search(uint8_t mac[6])
{
    int count = sdk_g_ic.s._unknown310 + 2;
    if (count < 1)
        return NULL;

    struct sdk_netif_conninfo **conninfo = sdk_g_ic.v.softap_netif_info->conninfo;

    int i = 0;
    do {
        struct sdk_netif_conninfo *info = conninfo[i];

        if (info && memcmp(mac, info, 6) == 0)
            return info;
        i = i + 1;
    } while (i != count);

    return NULL;
}

#endif /* OPEN_LIBNET80211_WL_CNX */

/* Recreated Espressif libnet80211 wl_cnx.o contents.

   Copyright (C) 2015 Espressif Systems. Derived from MIT Licensed SDK libraries.
   BSD Licensed as described in the file LICENSE
*/
#include "open_esplibs.h"
#if OPEN_LIBNET80211_WL_CNX
// The contents of this file are only built if OPEN_LIBNET80211_WL_CNX is set to true

#include "espressif/esp_misc.h"
#include "esplibs/libnet80211.h"
#include <string.h>
#include "lwip/dhcp.h"

ETSTimer sdk_sta_con_timer;
void *sdk_g_cnx_probe_rc_list_cb;

#if 0

// Most of the code in this file assesses static data so it will be all or none.
static uint32_t Ldata001;
static uint8_t Ldata003;
static uint8_t Ldata004;
static uint32_t Ldata006;
static void *Ldate007;

// Use of the netif->flags and the NETIF_FLAG_DHCP flag removed in lwip v2.
void sdk_cnx_sta_leave(struct sdk_g_ic_netif_info *netif_info, void *arg1) {
    struct netif *netif = netif_info->netif;

    uint32_t phy_type = sdk_ieee80211_phy_type_get();
    uint16_t v1 = *(uint16_t *)(arg1 + 0x1a) & 0xfff;
    sdk_ic_set_sta(0, 0, arg1, 0, v1, phy_type, 0, 0);

    netif_set_down(netif);

    // The NETIF_FLAG_DHCP flags is removed in lwip v2?
    if (netif->flags & 0x8) {
        dhcp_release(netif);
        dhcp_stop(netif);
    }

    uint32_t v2 = *(uint8_t *)(arg1 + 0xe8);
    free(sdk_g_ic.v._unknown190[v2]);
    sdk_g_ic.v._unknown190[v2] = NULL;

    if (sdk_g_ic.v._unknown190[0]) {
        free(sdk_g_ic.v._unknown190[0]);
        sdk_g_ic.v._unknown190[0] = NULL;
    }

    if (sdk_g_ic.v._unknown190[1]) {
        free(sdk_g_ic.v._unknown190[1]);
        sdk_g_ic.v._unknown190[1] = NULL;
    }

    sdk_scan_cancel();

    sdk_wDev_SetRxPolicy(0, 0, 0);

    Ldata001 = 2;

    uint8_t v3 = *(uint8_t *)(arg1 + 0x6);
    if (v3 & 2) {
        *(uint8_t *)(arg1 + 0x6) = v3 & 0xfd;
        sdk_cnx_rc_update_state_metric(arg1, -7, 1);
        Ldate007 = arg1;
    }

    sdk_cnx_remove_rc(arg1);

    Ldata006 = 0;
    *(uint32_t *)(arg1 + 0x8) &= 0xfffffffe;
    netif_info->_unknown88 = NULL;

    return;
}
#endif

void IRAM *sdk_cnx_node_search(uint8_t mac[6])
{
    int end = sdk_g_ic.s._unknown310 + 2;

    // Note this defensive test seems dead code, the value is loaded
    // as a uint8_t value so adding 2 ensures this test never passes.
    if (end < 1)
        return NULL;

    struct sdk_netif_conninfo **conninfo = sdk_g_ic.v.softap_netif_info->conninfo;

    int i = 0;
    do {
        struct sdk_netif_conninfo *info = conninfo[i];

        if (info) {
            if (memcmp(mac, info->mac_addr, 6) == 0) {
                return info;
            }
        }
        i++;
    } while (i < end);

    return NULL;
}

#endif /* OPEN_LIBNET80211_WL_CNX */

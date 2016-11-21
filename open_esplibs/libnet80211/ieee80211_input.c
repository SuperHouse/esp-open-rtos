/* Recreated Espressif libnet80211 ieee80211_input.o contents.

   Copyright (C) 2015 Espressif Systems. Derived from MIT Licensed SDK libraries.
   BSD Licensed as described in the file LICENSE
*/
#include "open_esplibs.h"
#if OPEN_LIBNET80211_INPUT
// The contents of this file are only built if OPEN_LIBNET80211_INPUT is set to true

#include "esplibs/libpp.h"

void IRAM sdk_ieee80211_deliver_data(struct sdk_g_ic_netif_info *netif_info, struct esf_buf *esf_buf) {
    struct netif *netif = netif_info->netif;

    if (netif->flags & NETIF_FLAG_LINK_UP) {
        uint16_t length = esf_buf->length;
        struct pbuf *pbuf = pbuf_alloc(PBUF_RAW, length, PBUF_REF);
        pbuf->payload = esf_buf->pbuf2->payload;
        esf_buf->pbuf1 = pbuf;
        pbuf->eb = (void *)esf_buf;
        ethernetif_input(netif, pbuf);
        return;
    }

    if (esf_buf)
        sdk_ppRecycleRxPkt(esf_buf);

    return;
}

#endif /* OPEN_LIBNET80211_INPUT */

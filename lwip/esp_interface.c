/* LWIP interface to the ESP SDK MAC layer

   These two symbols are called from libnet80211.a
*/
#include "lwip/opt.h"

#include "lwip/def.h"
#include "lwip/mem.h"
#include "lwip/pbuf.h"
#include <lwip/stats.h>
#include <lwip/snmp.h>
#include "netif/etharp.h"
#include "netif/ppp_oe.h"

/* declared in libnet80211.a */
int8_t ieee80211_output_pbuf(struct netif *ifp, struct pbuf* pb);
//sint8 ieee80211_output_pbuf(struct ieee80211_conn *conn, esf_buf *eb);

static err_t
low_level_output(struct netif *netif, struct pbuf *p)
{
  struct pbuf *q;

  for(q = p; q != NULL; q = q->next) {
      ieee80211_output_pbuf(netif, q);
  }

  LINK_STATS_INC(link.xmit);

  return ERR_OK;
}


err_t ethernetif_init(struct netif *netif)
{
  LWIP_ASSERT("netif != NULL", (netif != NULL));

#if LWIP_NETIF_HOSTNAME
  /* Initialize interface hostname */
  netif->hostname = "lwip";
#endif /* LWIP_NETIF_HOSTNAME */

  /*
   * Initialize the snmp variables and counters inside the struct netif.
   * The last argument should be replaced with your link speed, in units
   * of bits per second.
   */
  NETIF_INIT_SNMP(netif, snmp_ifType_ethernet_csmacd, LINK_SPEED_OF_YOUR_NETIF_IN_BPS);

  //netif->state = (void *)0xDEADBEEF; /* this appears unused by esp layer */
  netif->name[0] = 'e';
  netif->name[1] = 'n';
  netif->output = etharp_output;
  /* NB: in the SDK there's a static wrapper function to this, not sure what it does!! */
  netif->linkoutput = low_level_output;

  /* low level init components */
  netif->hwaddr_len = 6;
  /* hwaddr seems to be set elsewhere, or (more likely) is per-packet by MAC layer */
  netif->mtu = 1500;
  netif->flags = NETIF_FLAG_BROADCAST | NETIF_FLAG_ETHARP | NETIF_FLAG_LINK_UP;

  return ERR_OK;
}

/* called from ieee80211_deliver_data with new IP frames */
void ethernetif_input(struct netif *netif, struct pbuf *p)
{
    struct eth_hdr *ethhdr = p->payload;
  /* examine packet payloads ethernet header */

  switch (htons(ethhdr->type)) {
  /* IP or ARP packet? */
  case ETHTYPE_IP:
  case ETHTYPE_ARP:
//  case ETHTYPE_IPV6:
    /* full packet send to tcpip_thread to process */
    if (netif->input(p, netif)!=ERR_OK)
     { LWIP_DEBUGF(NETIF_DEBUG, ("ethernetif_input: IP input error\n"));
       pbuf_free(p);
       p = NULL;
     }
    break;

  default:
    pbuf_free(p);
    p = NULL;
    break;
  }
}

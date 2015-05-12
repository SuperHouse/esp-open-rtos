/* LWIP interface to the ESP SDK MAC layer

   These two symbols are called from libnet80211.a
*/

/* called from hostap_input... less clear what this is for! */
void ethernetif_init(void)
{

}

/* called from ieee80211_deliver_data with new IP frames */
void ethernetif_input(void)
{

}

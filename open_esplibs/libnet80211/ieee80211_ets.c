/* Recreated Espressif libnet80211 ieee80211_ets.o contents.

   Copyright (C) 2015 Espressif Systems. Derived from MIT Licensed SDK libraries.
   BSD Licensed as described in the file LICENSE
*/
#include "open_esplibs.h"
#if OPEN_LIBNET80211_ETS
// The contents of this file are only built if OPEN_LIBNET80211_ETS is set to true

#include "esplibs/libnet80211.h"
#include "esplibs/libpp.h"

struct esf_buf IRAM *sdk_ieee80211_getmgtframe(void **arg0, uint32_t arg1, uint32_t arg2) {
    uint32_t len = (arg1 + arg2 + 3) & 0xfffffffc;
    if (len >= 256) return NULL;

    struct esf_buf *esf_buf = sdk_esf_buf_alloc(NULL, len < 65 ? 5 : 4);
    if (esf_buf) {
        struct pbuf *pbuf = esf_buf->pbuf2;
        void *payload = pbuf->payload;
        *arg0 = payload + arg1;
    }

    return esf_buf;
}

#endif /* OPEN_LIBNET80211_ETS */

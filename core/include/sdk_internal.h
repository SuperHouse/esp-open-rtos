#ifndef _INTERNAL_SDK_STRUCTURES_H
#define _INTERNAL_SDK_STRUCTURES_H

#include "espressif/esp_wifi.h"
#include "espressif/spi_flash.h"
#include "espressif/phy_info.h"
#include "lwip/netif.h"

///////////////////////////////////////////////////////////////////////////////
//                   Internal structures and data objects                    //
///////////////////////////////////////////////////////////////////////////////

// 'info' is declared in app_main.o at .bss+0x4

struct sdk_info_st {
    uint32_t _unknown0;
    uint32_t _unknown1;
    uint32_t _unknown2;
    uint8_t _unknown3[12];
    uint8_t softap_mac_addr[6];
    uint8_t sta_mac_addr[6];
};

extern struct sdk_info_st sdk_info;

// 'rst_if' is declared in user_interface.o at .bss+0xfc

struct sdk_rst_if_st {
    uint32_t version;
    uint8_t _unknown[28];
};

extern struct sdk_rst_if_st sdk_rst_if;

// 'g_ic' is declared in libnet80211/ieee80211.o at .bss+0x0
// See also: http://esp8266-re.foogod.com/wiki/G_ic_(IoT_RTOS_SDK_0.9.9)

struct sdk_g_ic_netif_info {
    struct netif *netif;
    //TODO: rest of this structure is unknown.
};

// This is the portion of g_ic which is not loaded/saved to the flash ROM, and
// starts out zeroed on every boot.
struct sdk_g_ic_volatile_st {
    void *_unknown0;
    void *_unknown4;

    uint8_t _unknown8[8];

    struct sdk_g_ic_netif_info *station_netif_info;
    struct sdk_g_ic_netif_info *softap_netif_info;
    uint8_t _unknown18;
    uint32_t _unknown1c;
    uint32_t _unknown20;

    uint8_t _unknown24[8];

    uint8_t _unknown2c;

    uint8_t _unknown30[76];

    uint8_t _unknown7c;
    uint8_t _unknown7d;
    uint8_t _unknown7e;
    uint8_t _unknown7f;

    uint8_t _unknown80[204];

    void *_unknown14c;

    uint8_t _unknown150[20];

    uint32_t _unknown164;
    void *_unknown168;
    void *_unknown16c;
    void *_unknown170;
    void *_unknown174;
    void *_unknown178;

    uint8_t _unknown17c[4];

    void *_unknown180;
    void *_unknown184;
    struct station_info *station_info_head;
    struct station_info *station_info_tail;
    uint32_t _unknown190;
    uint32_t _unknown194;

    uint8_t _unknown198[40];

    void *_unknown1c0;
    void *_unknown1c4;
    uint32_t _unknown1c8;

    uint8_t _unknown1cc[4];

    uint16_t _unknown1d0;

    uint8_t _unknown1d2[2];

    uint8_t _unknown1d4;

    uint8_t _unknown1d5[3];
};

struct sdk_g_ic_unk0_st {
    uint32_t _unknown1e4;
    uint8_t _unknown1e8[32];
};

// This is the portion of g_ic which is loaded/saved to the flash ROM, and thus
// is preserved across reboots.
struct sdk_g_ic_saved_st {
    uint8_t _unknown1d8;
    uint8_t boot_info;
    uint8_t user0_addr[3];
    uint8_t user1_addr[3];
    uint8_t wifi_mode;
    uint8_t wifi_led_enable;
    uint8_t wifi_led_gpio;
    uint8_t _unknown1e3;

    struct sdk_g_ic_unk0_st _unknown1e4;

    uint8_t _unknown208;
    uint8_t _unknown209;
    uint8_t _unknown20a;
    uint8_t _unknown20b;
    uint8_t _unknown20c;
    uint8_t _unknown20d;
    uint8_t _unknown20e;
    uint8_t _unknown20f[64];
    uint8_t _unknown24f;

    uint8_t _unknown250[49];

    uint8_t _unknown281;

    uint8_t _unknown282[6];

    uint32_t _unknown288;
    uint8_t _unknown28c;

    uint8_t _unknown28d[31];

    uint8_t _unknown2ac[64];
    uint8_t _unknonwn2ec;

    uint8_t _unknown2ed[32];

    uint8_t _unknown30d;
    uint8_t _unknown30e;
    uint8_t _unknown30f;
    uint8_t _unknown310;

    uint8_t _unknown311[3];

    uint8_t ap_number;
    uint8_t current_ap_id;

    uint8_t _unknown316[502];

    uint32_t _unknown50c;
    uint16_t _unknown510;
    uint16_t _unknown512;
    uint16_t _unknown514;

    uint8_t _unknown516[2];

    uint8_t auto_connect;

    uint8_t _unknown519[3];

    enum sdk_phy_mode phy_mode;

    uint8_t _unknown520[36];

    uint16_t _unknown544;

    uint8_t _unknown546[2];
};

struct sdk_g_ic_st {
    struct sdk_g_ic_volatile_st v; // 0x0 - 0x1d8
    struct sdk_g_ic_saved_st    s; // 0x1d8 - 0x548
};

extern struct sdk_g_ic_st sdk_g_ic;

///////////////////////////////////////////////////////////////////////////////
// The above structures all refer to data regions outside our control, and a
// simple mistake/misunderstanding editing things here can completely screw up
// how we access them, so do some basic sanity checks to make sure that they
// appear to match up correctly with the actual data structures other parts of
// the SDK are expecting.
///////////////////////////////////////////////////////////////////////////////

_Static_assert(sizeof(struct sdk_info_st) == 0x24, "info_st is the wrong size!");
_Static_assert(sizeof(struct sdk_rst_if_st) == 0x20, "sdk_rst_if_st is the wrong size!");
_Static_assert(sizeof(struct sdk_g_ic_volatile_st) == 0x1d8, "sdk_g_ic_volatile_st is the wrong size!");
_Static_assert(sizeof(struct sdk_g_ic_saved_st) == 0x370, "sdk_g_ic_saved_st is the wrong size!");
_Static_assert(sizeof(struct sdk_g_ic_st) == 0x548, "sdk_g_ic_st is the wrong size!");

///////////////////////////////////////////////////////////////////////////////
//                            Function Prototypes                            //
///////////////////////////////////////////////////////////////////////////////

sdk_SpiFlashOpResult sdk_SPIRead(uint32_t src_addr, uint32_t *des_addr, uint32_t size);
sdk_SpiFlashOpResult sdk_SPIWrite(uint32_t des_addr, uint32_t *src_addr, uint32_t size);
void sdk_cnx_attach(struct sdk_g_ic_st *);
void sdk_ets_timer_init(void);
void sdk_ieee80211_ifattach(struct sdk_g_ic_st *, uint8_t *);
void sdk_ieee80211_phy_init(enum sdk_phy_mode);
void sdk_lmacInit(void);
void sdk_phy_disable_agc(void);
void sdk_phy_enable_agc(void);
void sdk_pm_attach(void);
void sdk_pp_attach(void);
void sdk_pp_soft_wdt_init(void);
int sdk_register_chipv6_phy(sdk_phy_info_t *);
void sdk_sleep_reset_analog_rtcreg_8266(void);
uint32_t sdk_system_get_checksum(uint8_t *, uint32_t);
void sdk_system_restart_in_nmi(void);
void sdk_wDevEnableRx(void);
void sdk_wDev_Initialize(void);
void sdk_wifi_mode_set(uint8_t);
void sdk_wifi_softap_cacl_mac(uint8_t *, uint8_t *);
void sdk_wifi_softap_set_default_ssid(void);
void sdk_wifi_softap_start(void);
void sdk_wifi_station_start(void);

#endif /* _INTERNAL_SDK_STRUCTURES_H */

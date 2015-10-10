/* Implementation of libmain/app_main.o from the Espressif SDK.
 *
 * This contains most of the startup code for the SDK/OS, some event handlers,
 * etc.
 *
 * Part of esp-open-rtos
 * Copyright (C) 2015 Superhouse Automation Pty Ltd
 * BSD Licensed as described in the file LICENSE
 */

#include <string.h>
#include <FreeRTOS.h>
#include <task.h>
#include <lwip/tcpip.h>

#include "common_macros.h"
#include "xtensa_ops.h"
#include "esp/rom.h"
#include "esp/uart.h"
#include "esp/iomux_regs.h"
#include "esp/spi_regs.h"
#include "esp/dport_regs.h"
#include "esp/wdev_regs.h"
#include "os_version.h"

#include "espressif/esp_common.h"
#include "sdk_internal.h"

/* This is not declared in any header file (but arguably should be) */

void user_init(void);

#define BOOT_INFO_SIZE 28
//TODO: phy_info should probably be a struct (no idea about its organization, though)
#define PHY_INFO_SIZE 128

// These are the offsets of these values within the RTCMEM regions.  It appears
// that the ROM saves them to RTCMEM before calling us, and we pull them out of
// there to display them in startup messages (not sure why it works that way).
#define RTCMEM_BACKUP_PHY_VER  31
#define RTCMEM_SYSTEM_PP_VER   62

#define halt()  while (1) {}

extern uint32_t _bss_start;
extern uint32_t _bss_end;

// .Ldata003 -- .irom.text+0x0
static const uint8_t IROM default_phy_info[PHY_INFO_SIZE] = {
    0x05, 0x00, 0x04, 0x02, 0x05, 0x05, 0x05, 0x02,
    0x05, 0x00, 0x04, 0x05, 0x05, 0x04, 0x05, 0x05,
    0x04, 0xfe, 0xfd, 0xff, 0xf0, 0xf0, 0xf0, 0xe0,
    0xe0, 0xe0, 0xe1, 0x0a, 0xff, 0xff, 0xf8, 0x00,
    0xf8, 0xf8, 0x52, 0x4e, 0x4a, 0x44, 0x40, 0x38,
    0x00, 0x00, 0x01, 0x01, 0x02, 0x03, 0x04, 0x05,
    0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0xe1, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x01, 0x93, 0x43, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};

// user_init_flag -- .bss+0x0
uint8_t sdk_user_init_flag;

// info -- .bss+0x4
struct sdk_info_st sdk_info;

// xUserTaskHandle -- .bss+0x28
xTaskHandle sdk_xUserTaskHandle;

// xWatchDogTaskHandle -- .bss+0x2c
xTaskHandle sdk_xWatchDogTaskHandle;

/* Static function prototypes */

static void IRAM get_otp_mac_address(uint8_t *buf);
static void IRAM set_spi0_divisor(uint32_t divisor);
static void zero_bss(void);
static void init_networking(uint8_t *phy_info, uint8_t *mac_addr);
static void init_g_ic(void);
static void dump_excinfo(void);
static void user_start_phase2(void);
static void dump_flash_sector(uint32_t start_sector, uint32_t length);
static void dump_flash_config_sectors(uint32_t start_sector);

// .Lfunc001 -- .text+0x14
static void IRAM get_otp_mac_address(uint8_t *buf) {
    uint32_t otp_flags;
    uint32_t otp_id0, otp_id1;
    uint32_t otp_vendor_id;

    otp_flags = DPORT.OTP_CHIPID;
    otp_id1 = DPORT.OTP_MAC1;
    otp_id0 = DPORT.OTP_MAC0;
    if (!(otp_flags & 0x8000)) {
        //FIXME: do we really need this check?
        printf("Firmware ONLY supports ESP8266!!!\n");
        halt();
    }
    if (otp_id0 == 0 && otp_id1 == 0) {
        printf("empty otp\n");
        halt();
    }
    if (otp_flags & 0x1000) {
        // If bit 12 is set, it indicates that the vendor portion of the MAC
        // address is stored in DPORT.OTP_MAC2.
        otp_vendor_id = DPORT.OTP_MAC2;
        buf[0] = otp_vendor_id >> 16;
        buf[1] = otp_vendor_id >> 8;
        buf[2] = otp_vendor_id;
    } else {
        // If bit 12 is clear, there's no MAC vendor in DPORT.OTP_MAC2, so
        // default to the Espressif MAC vendor prefix instead.
        buf[1] = 0xfe;
        buf[0] = 0x18;
        buf[2] = 0x34;
    }
    buf[3] = otp_id1 >> 8;
    buf[4] = otp_id1;
    buf[5] = otp_id0 >> 24;
}

// .Lfunc002 -- .text+0xa0
static void IRAM set_spi0_divisor(uint32_t divisor) {
    int cycle_len, half_cycle_len, clkdiv;

    if (divisor < 2) {
        clkdiv = 0;
        SPI(0).CTRL0 |= SPI_CTRL0_CLOCK_EQU_SYS_CLOCK;
        IOMUX.CONF |= IOMUX_CONF_SPI0_CLOCK_EQU_SYS_CLOCK;
    } else {
        cycle_len = divisor - 1;
        half_cycle_len = (divisor / 2) - 1;
        clkdiv = VAL2FIELD(SPI_CTRL0_CLOCK_NUM, cycle_len)
               | VAL2FIELD(SPI_CTRL0_CLOCK_HIGH, half_cycle_len)
               | VAL2FIELD(SPI_CTRL0_CLOCK_LOW, cycle_len);
        SPI(0).CTRL0 &= ~SPI_CTRL0_CLOCK_EQU_SYS_CLOCK;
        IOMUX.CONF &= ~IOMUX_CONF_SPI0_CLOCK_EQU_SYS_CLOCK;
    }
    SPI(0).CTRL0 = SET_FIELD(SPI(0).CTRL0, SPI_CTRL0_CLOCK, clkdiv);
}

// .text+0x148
void IRAM sdk_user_fatal_exception_handler(void) {
    if (!sdk_NMIIrqIsOn) {
        vPortEnterCritical();
        do {
            DPORT.DPORT0 &= 0xffffffe0;
        } while (DPORT.DPORT0 & 0x00000001);
    }
    Cache_Read_Disable();
    Cache_Read_Enable(0, 0, 1);
    dump_excinfo();
    uart_flush_txfifo(0);
    uart_flush_txfifo(1);
    sdk_system_restart_in_nmi();
    halt();
}


static void IRAM default_putc(char c) {
    uart_putc(0, c);
}

// .text+0x258
void IRAM sdk_user_start(void) {
    uint32_t buf32[sizeof(struct sdk_g_ic_saved_st) / 4];
    uint8_t *buf8 = (uint8_t *)buf32;
    uint32_t flash_speed_divisor;
    uint32_t flash_sectors;
    uint32_t flash_size;
    int boot_slot;
    uint32_t cksum_magic;
    uint32_t cksum_len;
    uint32_t cksum_value;
    uint32_t ic_flash_addr;

    SPI(0).USER0 |= SPI_USER0_CS_SETUP;
    sdk_SPIRead(0, buf32, 4);

    switch (buf8[3] & 0x0f) {
        case 0xf:  // 80 MHz
            flash_speed_divisor = 1;
            break;
        case 0x0:  // 40 MHz
            flash_speed_divisor = 2;
            break;
        case 0x1:  // 26 MHz
            flash_speed_divisor = 3;
            break;
        case 0x2:  // 20 MHz
            flash_speed_divisor = 4;
            break;
        default:  // Invalid -- Assume 40 MHz
            flash_speed_divisor = 2;
    }
    switch (buf8[3] >> 4) {
        case 0x0:   // 4 Mbit (512 KByte)
            flash_sectors = 128;
            break;
        case 0x1:  // 2 Mbit (256 Kbyte)
            flash_sectors = 64;
            break;
        case 0x2:  // 8 Mbit (1 Mbyte)
            flash_sectors = 256;
            break;
        case 0x3:  // 16 Mbit (2 Mbyte)
            flash_sectors = 512;
            break;
        case 0x4:  // 32 Mbit (4 Mbyte)
            flash_sectors = 1024;
            break;
        default:   // Invalid -- Assume 4 Mbit (512 KByte)
            flash_sectors = 128;
    }
    //FIXME: we should probably calculate flash_sectors by starting with flash_size and dividing by sdk_flashchip.sector_size instead of vice-versa.
    flash_size = flash_sectors * 4096;
    sdk_flashchip.chip_size = flash_size;
    set_spi0_divisor(flash_speed_divisor);
    sdk_SPIRead(flash_size - 4096, buf32, BOOT_INFO_SIZE);
    boot_slot = buf8[0] ? 1 : 0;
    cksum_magic = buf32[1];
    cksum_len = buf32[3 + boot_slot];
    cksum_value = buf32[5 + boot_slot];
    ic_flash_addr = (flash_sectors - 3 + boot_slot) * sdk_flashchip.sector_size;
    sdk_SPIRead(ic_flash_addr, buf32, sizeof(struct sdk_g_ic_saved_st));
    Cache_Read_Enable(0, 0, 1);
    zero_bss();
    sdk_os_install_putc1(default_putc);
    if (cksum_magic == 0xffffffff) {
        // No checksum required
    } else if ((cksum_magic == 0x55aa55aa) &&
            (sdk_system_get_checksum(buf8, cksum_len) == cksum_value)) {
        // Checksum OK
    } else {
        // Bad checksum or bad cksum_magic value
        dump_flash_config_sectors(flash_sectors - 4);
        //FIXME: should we halt here? (original SDK code doesn't)
    }
    memcpy(&sdk_g_ic.s, buf32, sizeof(struct sdk_g_ic_saved_st));

    user_start_phase2();
}

// .text+0x3a8
void IRAM vApplicationStackOverflowHook(xTaskHandle task, char *task_name) {
    printf("\"%s\"(stack_size = %lu) overflow the heap_size.\n", task_name, uxTaskGetStackHighWaterMark(task));
}

// .text+0x3d8
void IRAM vApplicationIdleHook(void) {
    printf("idle %u\n", WDEV.SYS_TIME);
}

// .text+0x404
void IRAM vApplicationTickHook(void) {
    printf("tick %u\n", WDEV.SYS_TIME);
}

// .Lfunc005 -- .irom0.text+0x8
static void zero_bss(void) {
    uint32_t *addr;

    for (addr = &_bss_start; addr < &_bss_end; addr++) {
        *addr = 0;
    }
}

// .Lfunc006 -- .irom0.text+0x70
static void init_networking(uint8_t *phy_info, uint8_t *mac_addr) {
    if (sdk_register_chipv6_phy(phy_info)) {
        printf("FATAL: sdk_register_chipv6_phy failed");
        halt();
    }
    uart_set_baud(0, 74906);
    uart_set_baud(1, 74906);
    sdk_phy_disable_agc();
    sdk_ieee80211_phy_init(sdk_g_ic.s.phy_mode);
    sdk_lmacInit();
    sdk_wDev_Initialize();
    sdk_pp_attach();
    sdk_ieee80211_ifattach(&sdk_g_ic, mac_addr);
    _xt_isr_mask(1);
    DPORT.DPORT0 = SET_FIELD(DPORT.DPORT0, DPORT_DPORT0_FIELD0, 1);
    sdk_pm_attach();
    sdk_phy_enable_agc();
    sdk_cnx_attach(&sdk_g_ic);
    sdk_wDevEnableRx();
}

// .Lfunc007 -- .irom0.text+0x148
static void init_g_ic(void) {
    if (sdk_g_ic.s.wifi_mode == 0xff) {
        sdk_g_ic.s.wifi_mode = 2;
    }
    sdk_wifi_softap_set_default_ssid();
    if (sdk_g_ic.s._unknown30d < 1 || sdk_g_ic.s._unknown30d > 14) {
        sdk_g_ic.s._unknown30d = 1;
    }
    if (sdk_g_ic.s._unknown544 < 100 || sdk_g_ic.s._unknown544 > 60000) {
        sdk_g_ic.s._unknown544 = 100;
    }
    if (sdk_g_ic.s._unknown30e == 1 || sdk_g_ic.s._unknown30e > 4) {
        sdk_g_ic.s._unknown30e = 0;
    }
    bzero(sdk_g_ic.s._unknown2ac, sizeof(sdk_g_ic.s._unknown2ac));
    if (sdk_g_ic.s._unknown30f > 1) {
        sdk_g_ic.s._unknown30f = 0;
    }
    if (sdk_g_ic.s._unknown310 > 4) {
        sdk_g_ic.s._unknown310 = 4;
    }
    if (sdk_g_ic.s._unknown1e4._unknown1e4 == 0xffffffff) {
        bzero(&sdk_g_ic.s._unknown1e4, sizeof(sdk_g_ic.s._unknown1e4));
        bzero(&sdk_g_ic.s._unknown20f, sizeof(sdk_g_ic.s._unknown20f));
    }
    sdk_g_ic.s.wifi_led_enable = 0;
    if (sdk_g_ic.s._unknown281 > 1) {
        sdk_g_ic.s._unknown281 = 0;
    }
    if (sdk_g_ic.s.ap_number > 5) {
        sdk_g_ic.s.ap_number = 1;
    }
    if (sdk_g_ic.s.phy_mode < 1 || sdk_g_ic.s.phy_mode > 3) {
       sdk_g_ic.s.phy_mode = PHY_MODE_11N;
    }
}

// .Lfunc008 -- .irom0.text+0x2a0
static void dump_excinfo(void) {
    uint32_t exccause, epc1, epc2, epc3, excvaddr, depc, excsave1;
    uint32_t excinfo[8];

    RSR(exccause, exccause);
    printf("Fatal exception (%d): \n", (int)exccause);
    RSR(epc1, epc1);
    RSR(epc2, epc2);
    RSR(epc3, epc3);
    RSR(excvaddr, excvaddr);
    RSR(depc, depc);
    RSR(excsave1, excsave1);
    printf("%s=0x%08x\n", "epc1", epc1);
    printf("%s=0x%08x\n", "epc2", epc2);
    printf("%s=0x%08x\n", "epc3", epc3);
    printf("%s=0x%08x\n", "excvaddr", excvaddr);
    printf("%s=0x%08x\n", "depc", depc);
    printf("%s=0x%08x\n", "excsave1", excsave1);
    sdk_system_rtc_mem_read(0, excinfo, 32); // Why?
    excinfo[0] = 2;
    excinfo[1] = exccause;
    excinfo[2] = epc1;
    excinfo[3] = epc2;
    excinfo[4] = epc3;
    excinfo[5] = excvaddr;
    excinfo[6] = depc;
    excinfo[7] = excsave1;
    sdk_system_rtc_mem_write(0, excinfo, 32);
}

// .irom0.text+0x398
void sdk_wdt_init(void) {
    WDT.CTRL &= ~WDT_CTRL_ENABLE;
    DPORT.INT_ENABLE |= DPORT_INT_ENABLE_WDT;
    WDT.REG1 = 0x0000000b;
    WDT.REG2 = 0x0000000c;
    WDT.CTRL |= WDT_CTRL_FLAG3 | WDT_CTRL_FLAG4 | WDT_CTRL_FLAG5;
    WDT.CTRL = SET_FIELD(WDT.CTRL, WDT_CTRL_FIELD0, 0);
    WDT.CTRL |= WDT_CTRL_ENABLE;
    sdk_pp_soft_wdt_init();
}

// .irom0.text+0x474
void sdk_user_init_task(void *params) {
    int phy_ver, pp_ver;

    sdk_ets_timer_init();
    printf("\nESP-Open-SDK ver: %s compiled @ %s %s\n", OS_VERSION_STR, __DATE__, __TIME__);
    phy_ver = RTCMEM_BACKUP[RTCMEM_BACKUP_PHY_VER] >> 16;
    printf("phy ver: %d, ", phy_ver);
    pp_ver = RTCMEM_SYSTEM[RTCMEM_SYSTEM_PP_VER];
    printf("pp ver: %d.%d\n\n", (pp_ver >> 8) & 0xff, pp_ver & 0xff);
    user_init();
    sdk_user_init_flag = 1;
    sdk_wifi_mode_set(sdk_g_ic.s.wifi_mode);
    if (sdk_g_ic.s.wifi_mode == 1) {
        sdk_wifi_station_start();
        netif_set_default(sdk_g_ic.v.station_netif_info->netif);
    }
    if (sdk_g_ic.s.wifi_mode == 2) {
        sdk_wifi_softap_start();
        netif_set_default(sdk_g_ic.v.softap_netif_info->netif);
    }
    if (sdk_g_ic.s.wifi_mode == 3) {
        sdk_wifi_station_start();
        sdk_wifi_softap_start();
        netif_set_default(sdk_g_ic.v.softap_netif_info->netif);
    }
    if (sdk_wifi_station_get_auto_connect()) {
        sdk_wifi_station_connect();
    }
    vTaskDelete(NULL);
}

// .Lfunc009 -- .irom0.text+0x5b4
static void user_start_phase2(void) {
    uint8_t *buf;
    uint8_t *phy_info;

    sdk_system_rtc_mem_read(0, &sdk_rst_if, sizeof(sdk_rst_if));
    if (sdk_rst_if.version > 3) {
        // Bad version number. Probably garbage.
        bzero(&sdk_rst_if, sizeof(sdk_rst_if));
    }
    buf = malloc(sizeof(sdk_rst_if));
    bzero(buf, sizeof(sdk_rst_if));
    sdk_system_rtc_mem_write(0, buf, sizeof(sdk_rst_if));
    free(buf);
    sdk_sleep_reset_analog_rtcreg_8266();
    get_otp_mac_address(sdk_info.sta_mac_addr);
    sdk_wifi_softap_cacl_mac(sdk_info.softap_mac_addr, sdk_info.sta_mac_addr);
    sdk_info._unknown0 = 0x0104a8c0;
    sdk_info._unknown1 = 0x00ffffff;
    sdk_info._unknown2 = 0x0104a8c0;
    init_g_ic();
    phy_info = malloc(PHY_INFO_SIZE);
    sdk_spi_flash_read(sdk_flashchip.chip_size - sdk_flashchip.sector_size * 4, (uint32_t *)phy_info, PHY_INFO_SIZE);

    // Disable default buffering on stdout
    setbuf(stdout, NULL);
    // Wait for UARTs to finish sending anything in their queues.
    uart_flush_txfifo(0);
    uart_flush_txfifo(1);

    if (phy_info[0] != 5) {
        // Bad version byte.  Discard what we read and use default values
        // instead.
        memcpy(phy_info, default_phy_info, PHY_INFO_SIZE);
    }
    init_networking(phy_info, sdk_info.sta_mac_addr);
    free(phy_info);
    tcpip_init(NULL, NULL);
    sdk_wdt_init();
    xTaskCreate(sdk_user_init_task, (signed char *)"uiT", 1024, 0, 14, &sdk_xUserTaskHandle);
    vTaskStartScheduler();
}

// .Lfunc010 -- .irom0.text+0x710
static void dump_flash_sector(uint32_t start_sector, uint32_t length) {
    uint8_t *buf;
    int bufsize, i;

    bufsize = (length + 3) & 0xfffc;
    buf = malloc(bufsize);
    sdk_spi_flash_read(start_sector * sdk_flashchip.sector_size, (uint32_t *)buf
, bufsize);
    for (i = 0; i < length; i++) {
        if ((i & 0xf) == 0) {
            if (i) {
                printf("\n");
            }
            printf("%04x:", i);
        }
        printf(" %02x", buf[i]);
    }
    printf("\n");
    free(buf);
}

// .Lfunc011 -- .irom0.text+0x790
static void dump_flash_config_sectors(uint32_t start_sector) {
    printf("system param error\n");
    // Note: original SDK code didn't dump PHY info
    printf("phy_info:\n");
    dump_flash_sector(start_sector, PHY_INFO_SIZE);
    printf("\ng_ic saved 0:\n");
    dump_flash_sector(start_sector + 1, sizeof(struct sdk_g_ic_saved_st));
    printf("\ng_ic saved 1:\n");
    dump_flash_sector(start_sector + 2, sizeof(struct sdk_g_ic_saved_st));
    printf("\nboot info:\n");
    dump_flash_sector(start_sector + 3, BOOT_INFO_SIZE);
}


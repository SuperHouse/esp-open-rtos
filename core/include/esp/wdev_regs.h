/* esp/dport_regs.h
 *
 * ESP8266 WDEV register definitions
 *
 * In the DPORT memory space, alongside DPORT regs. However mostly
 * concerned with the WiFi hardware interface.
 *
 * Not well understood at all, 100% figured out via reverse engineering.
 */

#ifndef _ESP_WDEV__REGS_H
#define _ESP_WDEV__REGS_H

#include "esp/types.h"
#include "common_macros.h"

#define WDEV_BASE 0x3ff20e00
#define WDEV (*(struct WDEV_REGS *)(WDEV_BASE))

/* WDEV registers
*/

struct WDEV_REGS {
    uint32_t volatile _unknown00;          // 0x00
    uint32_t volatile _unknown04;          // 0x04
    uint32_t volatile _unknown08;          // 0x08
    uint32_t volatile _unknown0c;          // 0x0c
    uint32_t volatile _unknown10;          // 0x10
    uint32_t volatile _unknown14;          // 0x14
    uint32_t volatile _unknown18;          // 0x18
    uint32_t volatile _unknown1c;          // 0x1c
    uint32_t volatile _unknown20;          // 0x20
    uint32_t volatile _unknown24;          // 0x24
    uint32_t volatile _unknown28;          // 0x28
    uint32_t volatile _unknown2c;          // 0x2c
    uint32_t volatile _unknown30;          // 0x30
    uint32_t volatile _unknown34;          // 0x34
    uint32_t volatile _unknown38;          // 0x38
    uint32_t volatile _unknown3c;          // 0x3c
    uint32_t volatile _unknown40;          // 0x40
    uint32_t volatile HWRNG;               // 0x44 Appears to be HW RNG, see https://github.com/SuperHouse/esp-open-rtos/issues/3#issuecomment-139453094
};

#endif

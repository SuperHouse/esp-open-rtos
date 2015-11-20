/* esp/rtc_regs.h
 *
 * ESP8266 RTC register definitions
 *
 * Not compatible with ESP SDK register access code.
 */

#ifndef _ESP_RTC_REGS_H
#define _ESP_RTC_REGS_H

#include "esp/types.h"
#include "common_macros.h"

#define RTC_BASE 0x60000700
#define RTC (*(struct RTC_REGS *)(RTC_BASE))

//FIXME: need to understand/clarify distinction between GPIO_CONF and GPIO_CFG[]
// Note: GPIO_CFG[3] is also known as PAD_XPD_DCDC_CONF in eagle_soc.h

struct RTC_REGS {
    uint32_t volatile _unknown0;        // 0x00
    uint32_t volatile COUNTER_ALARM;    // 0x04
    uint32_t volatile RESET_REASON0;    // 0x08       //FIXME: need better name
    uint32_t volatile _unknownc[2];     // 0x0c - 0x10
    uint32_t volatile RESET_REASON1;    // 0x14       //FIXME: need better name
    uint32_t volatile RESET_REASON2;    // 0x18       //FIXME: need better name
    uint32_t volatile COUNTER;          // 0x1c
    uint32_t volatile INT_SET;          // 0x20
    uint32_t volatile INT_CLEAR;        // 0x24
    uint32_t volatile INT_ENABLE;       // 0x28
    uint32_t volatile _unknown2c;       // 0x2c
    uint32_t volatile SCRATCH[4];       // 0x30 - 3c
    uint32_t volatile _unknown40[10];   // 0x40 - 0x64
    uint32_t volatile GPIO_OUT;         // 0x68
    uint32_t volatile _unknown6c[2];    // 0x6c - 0x70
    uint32_t volatile GPIO_ENABLE;      // 0x74
    uint32_t volatile _unknown80[5];    // 0x78 - 0x88
    uint32_t volatile GPIO_IN;          // 0x8c
    uint32_t volatile GPIO_CONF;        // 0x90
    uint32_t volatile GPIO_CFG[6];      // 0x94 - 0xa8
};

_Static_assert(sizeof(struct RTC_REGS) == 0xac, "RTC_REGS is the wrong size");

/* The following are used in sdk_rtc_get_reset_reason().  Details are still a
 * bit sketchy regarding exactly what they mean/do.. */

#define RTC_RESET_REASON1_CODE_M  0x0000000f
#define RTC_RESET_REASON1_CODE_S  0

#define RTC_RESET_REASON2_CODE_M  0x0000003f
#define RTC_RESET_REASON2_CODE_S  8

#define RTC_RESET_REASON0_SOMETHING  BIT(21)

#endif /* _ESP_RTC_REGS_H */

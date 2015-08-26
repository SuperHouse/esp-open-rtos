/* esp/wdt_regs.h
 *
 * ESP8266 Watchdog Timer register definitions
 *
 * Not compatible with ESP SDK register access code.
 */

#ifndef _ESP_WDT_REGS_H
#define _ESP_WDT_REGS_H

#include "esp/types.h"
#include "common_macros.h"

#define WDT_BASE 0x60000900
#define WDT (*(struct WDT_REGS *)(WDT_BASE))

/* WDT register(s)

   Not fully understood yet. Writing 0 to CTRL disables WDT.

   See ROM functions esp_wdt_xxx
 */

struct WDT_REGS {
    uint32_t volatile CTRL;        // 0x00
    uint32_t volatile REG1;        // 0x04
    uint32_t volatile REG2;        // 0x08
    uint32_t volatile _unused[2];  // 0x0c - 0x10
    uint32_t volatile FEED;        // 0x14
};

_Static_assert(sizeof(struct WDT_REGS) == 0x18, "WDT_REGS is the wrong size");

/* Writing WDT_FEED_MAGIC to WDT.FEED register "feeds the dog" and holds off
 * triggering for another cycle (unconfirmed) */
#define WDT_FEED_MAGIC  0x73

#endif /* _ESP_WDT_REGS_H */

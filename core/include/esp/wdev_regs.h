/* esp/wdev_regs.h
 *
 * ESP8266 register definitions for the "wdev" region (0x3FF2xxx)
 *
 * Not compatible with ESP SDK register access code.
 */

#ifndef _ESP_WDEV_REGS_H
#define _ESP_WDEV_REGS_H

#include "esp/types.h"
#include "common_macros.h"

#define WDEV_BASE 0x3FF20000
#define WDEV (*(struct WDEV_REGS *)(WDEV_BASE))

/* Note: This memory region is not currently well understood.  Pretty much all
 * of the definitions here are from reverse-engineering the Espressif SDK code,
 * many are just educated guesses, and almost certainly some are misleading or
 * wrong.  If you can improve on any of this, please contribute!
 */

struct WDEV_REGS {
    uint32_t volatile _unknown[768];  // 0x0000 - 0x0bfc
    uint32_t volatile SYS_TIME;       // 0x0c00
} __attribute__ (( packed ));

_Static_assert(sizeof(struct WDEV_REGS) == 0xc04, "WDEV_REGS is the wrong size");

#endif /* _ESP_WDEV_REGS_H */

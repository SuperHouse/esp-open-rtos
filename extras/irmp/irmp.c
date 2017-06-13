/*---------------------------------------------------------------------------------------------------------------------------------------------------
 * irmp.c - infrared multi-protocol decoder, supports several remote control protocols
 *
 * Copyright (c) 2009-2016 Frank Meyer - frank(at)fli4l.de
 *
 * $Id: irmp.c,v 1.192 2017/02/17 09:13:06 fm Exp $
 *
 * Supported AVR mikrocontrollers:
 *
 * ATtiny87,  ATtiny167
 * ATtiny45,  ATtiny85
 * ATtiny44,  ATtiny84
 * ATmega8,   ATmega16,  ATmega32
 * ATmega162
 * ATmega164, ATmega324, ATmega644,  ATmega644P, ATmega1284, ATmega1284P
 * ATmega88,  ATmega88P, ATmega168,  ATmega168P, ATmega328P
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */

#include "irmp.h"

#if IRMP_SUPPORT_GRUNDIG_PROTOCOL == 1 || IRMP_SUPPORT_NOKIA_PROTOCOL == 1 || IRMP_SUPPORT_IR60_PROTOCOL == 1
#  define IRMP_SUPPORT_GRUNDIG_NOKIA_IR60_PROTOCOL  1
#else
#  define IRMP_SUPPORT_GRUNDIG_NOKIA_IR60_PROTOCOL  0
#endif

#if IRMP_SUPPORT_SIEMENS_PROTOCOL == 1 || IRMP_SUPPORT_RUWIDO_PROTOCOL == 1
#  define IRMP_SUPPORT_SIEMENS_OR_RUWIDO_PROTOCOL   1
#else
#  define IRMP_SUPPORT_SIEMENS_OR_RUWIDO_PROTOCOL   0
#endif

#if IRMP_SUPPORT_RC5_PROTOCOL == 1 ||                   \
    IRMP_SUPPORT_S100_PROTOCOL == 1 ||                  \
    IRMP_SUPPORT_RC6_PROTOCOL == 1 ||                   \
    IRMP_SUPPORT_GRUNDIG_NOKIA_IR60_PROTOCOL == 1 ||    \
    IRMP_SUPPORT_SIEMENS_OR_RUWIDO_PROTOCOL == 1 ||     \
    IRMP_SUPPORT_IR60_PROTOCOL == 1 ||                  \
    IRMP_SUPPORT_A1TVBOX_PROTOCOL == 1 ||               \
    IRMP_SUPPORT_MERLIN_PROTOCOL == 1 ||                \
    IRMP_SUPPORT_ORTEK_PROTOCOL == 1
#  define IRMP_SUPPORT_MANCHESTER                   1
#else
#  define IRMP_SUPPORT_MANCHESTER                   0
#endif

#if IRMP_SUPPORT_NETBOX_PROTOCOL == 1
#  define IRMP_SUPPORT_SERIAL                       1
#else
#  define IRMP_SUPPORT_SERIAL                       0
#endif

#define IRMP_KEY_REPETITION_LEN                 (uint_fast16_t)(F_INTERRUPTS * 150.0e-3 + 0.5)           // autodetect key repetition within 150 msec

#define MIN_TOLERANCE_00                        1.0                           // -0%
#define MAX_TOLERANCE_00                        1.0                           // +0%

#define MIN_TOLERANCE_02                        0.98                          // -2%
#define MAX_TOLERANCE_02                        1.02                          // +2%

#define MIN_TOLERANCE_03                        0.97                          // -3%
#define MAX_TOLERANCE_03                        1.03                          // +3%

#define MIN_TOLERANCE_05                        0.95                          // -5%
#define MAX_TOLERANCE_05                        1.05                          // +5%

#define MIN_TOLERANCE_10                        0.9                           // -10%
#define MAX_TOLERANCE_10                        1.1                           // +10%

#define MIN_TOLERANCE_15                        0.85                          // -15%
#define MAX_TOLERANCE_15                        1.15                          // +15%

#define MIN_TOLERANCE_20                        0.8                           // -20%
#define MAX_TOLERANCE_20                        1.2                           // +20%

#define MIN_TOLERANCE_30                        0.7                           // -30%
#define MAX_TOLERANCE_30                        1.3                           // +30%

#define MIN_TOLERANCE_40                        0.6                           // -40%
#define MAX_TOLERANCE_40                        1.4                           // +40%

#define MIN_TOLERANCE_50                        0.5                           // -50%
#define MAX_TOLERANCE_50                        1.5                           // +50%

#define MIN_TOLERANCE_60                        0.4                           // -60%
#define MAX_TOLERANCE_60                        1.6                           // +60%

#define MIN_TOLERANCE_70                        0.3                           // -70%
#define MAX_TOLERANCE_70                        1.7                           // +70%

#define SIRCS_START_BIT_PULSE_LEN_MIN           ((uint_fast8_t)(F_INTERRUPTS * SIRCS_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define SIRCS_START_BIT_PULSE_LEN_MAX           ((uint_fast8_t)(F_INTERRUPTS * SIRCS_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define SIRCS_START_BIT_PAUSE_LEN_MIN           ((uint_fast8_t)(F_INTERRUPTS * SIRCS_START_BIT_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#if IRMP_SUPPORT_NETBOX_PROTOCOL                // only 5% to avoid conflict with NETBOX:
#  define SIRCS_START_BIT_PAUSE_LEN_MAX         ((uint_fast8_t)(F_INTERRUPTS * SIRCS_START_BIT_PAUSE_TIME * MAX_TOLERANCE_05 + 0.5))
#else                                           // only 5% + 1 to avoid conflict with RC6:
#  define SIRCS_START_BIT_PAUSE_LEN_MAX         ((uint_fast8_t)(F_INTERRUPTS * SIRCS_START_BIT_PAUSE_TIME * MAX_TOLERANCE_05 + 0.5) + 1)
#endif
#define SIRCS_1_PULSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * SIRCS_1_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define SIRCS_1_PULSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * SIRCS_1_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define SIRCS_0_PULSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * SIRCS_0_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define SIRCS_0_PULSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * SIRCS_0_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define SIRCS_PAUSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * SIRCS_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define SIRCS_PAUSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * SIRCS_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)

#define NEC_START_BIT_PULSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * NEC_START_BIT_PULSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define NEC_START_BIT_PULSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * NEC_START_BIT_PULSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define NEC_START_BIT_PAUSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * NEC_START_BIT_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define NEC_START_BIT_PAUSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * NEC_START_BIT_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define NEC_REPEAT_START_BIT_PAUSE_LEN_MIN      ((uint_fast8_t)(F_INTERRUPTS * NEC_REPEAT_START_BIT_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define NEC_REPEAT_START_BIT_PAUSE_LEN_MAX      ((uint_fast8_t)(F_INTERRUPTS * NEC_REPEAT_START_BIT_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define NEC_PULSE_LEN_MIN                       ((uint_fast8_t)(F_INTERRUPTS * NEC_PULSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define NEC_PULSE_LEN_MAX                       ((uint_fast8_t)(F_INTERRUPTS * NEC_PULSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define NEC_1_PAUSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * NEC_1_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define NEC_1_PAUSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * NEC_1_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define NEC_0_PAUSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * NEC_0_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define NEC_0_PAUSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * NEC_0_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
// autodetect nec repetition frame within 50 msec:
// NEC seems to send the first repetition frame after 40ms, further repetition frames after 100 ms
#if 0
#define NEC_FRAME_REPEAT_PAUSE_LEN_MAX          (uint_fast16_t)(F_INTERRUPTS * NEC_FRAME_REPEAT_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5)
#else
#define NEC_FRAME_REPEAT_PAUSE_LEN_MAX          (uint_fast16_t)(F_INTERRUPTS * 100.0e-3 * MAX_TOLERANCE_20 + 0.5)
#endif

#define SAMSUNG_START_BIT_PULSE_LEN_MIN         ((uint_fast8_t)(F_INTERRUPTS * SAMSUNG_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define SAMSUNG_START_BIT_PULSE_LEN_MAX         ((uint_fast8_t)(F_INTERRUPTS * SAMSUNG_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define SAMSUNG_START_BIT_PAUSE_LEN_MIN         ((uint_fast8_t)(F_INTERRUPTS * SAMSUNG_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define SAMSUNG_START_BIT_PAUSE_LEN_MAX         ((uint_fast8_t)(F_INTERRUPTS * SAMSUNG_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define SAMSUNG_PULSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * SAMSUNG_PULSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define SAMSUNG_PULSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * SAMSUNG_PULSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define SAMSUNG_1_PAUSE_LEN_MIN                 ((uint_fast8_t)(F_INTERRUPTS * SAMSUNG_1_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define SAMSUNG_1_PAUSE_LEN_MAX                 ((uint_fast8_t)(F_INTERRUPTS * SAMSUNG_1_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define SAMSUNG_0_PAUSE_LEN_MIN                 ((uint_fast8_t)(F_INTERRUPTS * SAMSUNG_0_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define SAMSUNG_0_PAUSE_LEN_MAX                 ((uint_fast8_t)(F_INTERRUPTS * SAMSUNG_0_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)

#define SAMSUNGAH_START_BIT_PULSE_LEN_MIN       ((uint_fast8_t)(F_INTERRUPTS * SAMSUNGAH_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define SAMSUNGAH_START_BIT_PULSE_LEN_MAX       ((uint_fast8_t)(F_INTERRUPTS * SAMSUNGAH_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define SAMSUNGAH_START_BIT_PAUSE_LEN_MIN       ((uint_fast8_t)(F_INTERRUPTS * SAMSUNGAH_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define SAMSUNGAH_START_BIT_PAUSE_LEN_MAX       ((uint_fast8_t)(F_INTERRUPTS * SAMSUNGAH_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define SAMSUNGAH_PULSE_LEN_MIN                 ((uint_fast8_t)(F_INTERRUPTS * SAMSUNGAH_PULSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define SAMSUNGAH_PULSE_LEN_MAX                 ((uint_fast8_t)(F_INTERRUPTS * SAMSUNGAH_PULSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define SAMSUNGAH_1_PAUSE_LEN_MIN               ((uint_fast8_t)(F_INTERRUPTS * SAMSUNGAH_1_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define SAMSUNGAH_1_PAUSE_LEN_MAX               ((uint_fast8_t)(F_INTERRUPTS * SAMSUNGAH_1_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define SAMSUNGAH_0_PAUSE_LEN_MIN               ((uint_fast8_t)(F_INTERRUPTS * SAMSUNGAH_0_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define SAMSUNGAH_0_PAUSE_LEN_MAX               ((uint_fast8_t)(F_INTERRUPTS * SAMSUNGAH_0_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)

#define MATSUSHITA_START_BIT_PULSE_LEN_MIN      ((uint_fast8_t)(F_INTERRUPTS * MATSUSHITA_START_BIT_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define MATSUSHITA_START_BIT_PULSE_LEN_MAX      ((uint_fast8_t)(F_INTERRUPTS * MATSUSHITA_START_BIT_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define MATSUSHITA_START_BIT_PAUSE_LEN_MIN      ((uint_fast8_t)(F_INTERRUPTS * MATSUSHITA_START_BIT_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define MATSUSHITA_START_BIT_PAUSE_LEN_MAX      ((uint_fast8_t)(F_INTERRUPTS * MATSUSHITA_START_BIT_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define MATSUSHITA_PULSE_LEN_MIN                ((uint_fast8_t)(F_INTERRUPTS * MATSUSHITA_PULSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define MATSUSHITA_PULSE_LEN_MAX                ((uint_fast8_t)(F_INTERRUPTS * MATSUSHITA_PULSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
#define MATSUSHITA_1_PAUSE_LEN_MIN              ((uint_fast8_t)(F_INTERRUPTS * MATSUSHITA_1_PAUSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define MATSUSHITA_1_PAUSE_LEN_MAX              ((uint_fast8_t)(F_INTERRUPTS * MATSUSHITA_1_PAUSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
#define MATSUSHITA_0_PAUSE_LEN_MIN              ((uint_fast8_t)(F_INTERRUPTS * MATSUSHITA_0_PAUSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define MATSUSHITA_0_PAUSE_LEN_MAX              ((uint_fast8_t)(F_INTERRUPTS * MATSUSHITA_0_PAUSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)

#define KASEIKYO_START_BIT_PULSE_LEN_MIN        ((uint_fast8_t)(F_INTERRUPTS * KASEIKYO_START_BIT_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define KASEIKYO_START_BIT_PULSE_LEN_MAX        ((uint_fast8_t)(F_INTERRUPTS * KASEIKYO_START_BIT_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define KASEIKYO_START_BIT_PAUSE_LEN_MIN        ((uint_fast8_t)(F_INTERRUPTS * KASEIKYO_START_BIT_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define KASEIKYO_START_BIT_PAUSE_LEN_MAX        ((uint_fast8_t)(F_INTERRUPTS * KASEIKYO_START_BIT_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define KASEIKYO_PULSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * KASEIKYO_PULSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define KASEIKYO_PULSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * KASEIKYO_PULSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
#define KASEIKYO_1_PAUSE_LEN_MIN                ((uint_fast8_t)(F_INTERRUPTS * KASEIKYO_1_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define KASEIKYO_1_PAUSE_LEN_MAX                ((uint_fast8_t)(F_INTERRUPTS * KASEIKYO_1_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define KASEIKYO_0_PAUSE_LEN_MIN                ((uint_fast8_t)(F_INTERRUPTS * KASEIKYO_0_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define KASEIKYO_0_PAUSE_LEN_MAX                ((uint_fast8_t)(F_INTERRUPTS * KASEIKYO_0_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)

#define MITSU_HEAVY_START_BIT_PULSE_LEN_MIN     ((uint_fast8_t)(F_INTERRUPTS * MITSU_HEAVY_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define MITSU_HEAVY_START_BIT_PULSE_LEN_MAX     ((uint_fast8_t)(F_INTERRUPTS * MITSU_HEAVY_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define MITSU_HEAVY_START_BIT_PAUSE_LEN_MIN     ((uint_fast8_t)(F_INTERRUPTS * MITSU_HEAVY_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define MITSU_HEAVY_START_BIT_PAUSE_LEN_MAX     ((uint_fast8_t)(F_INTERRUPTS * MITSU_HEAVY_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define MITSU_HEAVY_PULSE_LEN_MIN               ((uint_fast8_t)(F_INTERRUPTS * MITSU_HEAVY_PULSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define MITSU_HEAVY_PULSE_LEN_MAX               ((uint_fast8_t)(F_INTERRUPTS * MITSU_HEAVY_PULSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
#define MITSU_HEAVY_1_PAUSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * MITSU_HEAVY_1_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define MITSU_HEAVY_1_PAUSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * MITSU_HEAVY_1_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define MITSU_HEAVY_0_PAUSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * MITSU_HEAVY_0_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define MITSU_HEAVY_0_PAUSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * MITSU_HEAVY_0_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)

#define VINCENT_START_BIT_PULSE_LEN_MIN         ((uint_fast8_t)(F_INTERRUPTS * VINCENT_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define VINCENT_START_BIT_PULSE_LEN_MAX         ((uint_fast8_t)(F_INTERRUPTS * VINCENT_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define VINCENT_START_BIT_PAUSE_LEN_MIN         ((uint_fast8_t)(F_INTERRUPTS * VINCENT_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define VINCENT_START_BIT_PAUSE_LEN_MAX         ((uint_fast8_t)(F_INTERRUPTS * VINCENT_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define VINCENT_PULSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * VINCENT_PULSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define VINCENT_PULSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * VINCENT_PULSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
#define VINCENT_1_PAUSE_LEN_MIN                 ((uint_fast8_t)(F_INTERRUPTS * VINCENT_1_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define VINCENT_1_PAUSE_LEN_MAX                 ((uint_fast8_t)(F_INTERRUPTS * VINCENT_1_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define VINCENT_0_PAUSE_LEN_MIN                 ((uint_fast8_t)(F_INTERRUPTS * VINCENT_0_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define VINCENT_0_PAUSE_LEN_MAX                 ((uint_fast8_t)(F_INTERRUPTS * VINCENT_0_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)

#define PANASONIC_START_BIT_PULSE_LEN_MIN       ((uint_fast8_t)(F_INTERRUPTS * PANASONIC_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define PANASONIC_START_BIT_PULSE_LEN_MAX       ((uint_fast8_t)(F_INTERRUPTS * PANASONIC_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define PANASONIC_START_BIT_PAUSE_LEN_MIN       ((uint_fast8_t)(F_INTERRUPTS * PANASONIC_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define PANASONIC_START_BIT_PAUSE_LEN_MAX       ((uint_fast8_t)(F_INTERRUPTS * PANASONIC_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define PANASONIC_PULSE_LEN_MIN                 ((uint_fast8_t)(F_INTERRUPTS * PANASONIC_PULSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define PANASONIC_PULSE_LEN_MAX                 ((uint_fast8_t)(F_INTERRUPTS * PANASONIC_PULSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
#define PANASONIC_1_PAUSE_LEN_MIN               ((uint_fast8_t)(F_INTERRUPTS * PANASONIC_1_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define PANASONIC_1_PAUSE_LEN_MAX               ((uint_fast8_t)(F_INTERRUPTS * PANASONIC_1_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define PANASONIC_0_PAUSE_LEN_MIN               ((uint_fast8_t)(F_INTERRUPTS * PANASONIC_0_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define PANASONIC_0_PAUSE_LEN_MAX               ((uint_fast8_t)(F_INTERRUPTS * PANASONIC_0_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)

#define RECS80_START_BIT_PULSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * RECS80_START_BIT_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define RECS80_START_BIT_PULSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * RECS80_START_BIT_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define RECS80_START_BIT_PAUSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * RECS80_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RECS80_START_BIT_PAUSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * RECS80_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define RECS80_PULSE_LEN_MIN                    ((uint_fast8_t)(F_INTERRUPTS * RECS80_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define RECS80_PULSE_LEN_MAX                    ((uint_fast8_t)(F_INTERRUPTS * RECS80_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define RECS80_1_PAUSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * RECS80_1_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RECS80_1_PAUSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * RECS80_1_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define RECS80_0_PAUSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * RECS80_0_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RECS80_0_PAUSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * RECS80_0_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)


#if IRMP_SUPPORT_BOSE_PROTOCOL == 1 // BOSE conflicts with RC5, so keep tolerance for RC5 minimal here:
#define RC5_START_BIT_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * RC5_BIT_TIME * MIN_TOLERANCE_05 + 0.5) - 1)
#define RC5_START_BIT_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * RC5_BIT_TIME * MAX_TOLERANCE_05 + 0.5) + 1)
#else
#define RC5_START_BIT_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * RC5_BIT_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RC5_START_BIT_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * RC5_BIT_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#endif

#define RC5_BIT_LEN_MIN                         ((uint_fast8_t)(F_INTERRUPTS * RC5_BIT_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RC5_BIT_LEN_MAX                         ((uint_fast8_t)(F_INTERRUPTS * RC5_BIT_TIME * MAX_TOLERANCE_10 + 0.5) + 1)

#if IRMP_SUPPORT_BOSE_PROTOCOL == 1 // BOSE conflicts with S100, so keep tolerance for S100 minimal here:
#define S100_START_BIT_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * S100_BIT_TIME * MIN_TOLERANCE_05 + 0.5) - 1)
#define S100_START_BIT_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * S100_BIT_TIME * MAX_TOLERANCE_05 + 0.5) + 1)
#else
#define S100_START_BIT_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * S100_BIT_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define S100_START_BIT_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * S100_BIT_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#endif

#define S100_BIT_LEN_MIN                         ((uint_fast8_t)(F_INTERRUPTS * S100_BIT_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define S100_BIT_LEN_MAX                         ((uint_fast8_t)(F_INTERRUPTS * S100_BIT_TIME * MAX_TOLERANCE_10 + 0.5) + 1)

#define DENON_PULSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * DENON_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define DENON_PULSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * DENON_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define DENON_1_PAUSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * DENON_1_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define DENON_1_PAUSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * DENON_1_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
// RUWIDO (see t-home-mediareceiver-15kHz.txt) conflicts here with DENON
#define DENON_0_PAUSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * DENON_0_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define DENON_0_PAUSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * DENON_0_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define DENON_AUTO_REPETITION_PAUSE_LEN         ((uint_fast16_t)(F_INTERRUPTS * DENON_AUTO_REPETITION_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)

#define THOMSON_PULSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * THOMSON_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define THOMSON_PULSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * THOMSON_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define THOMSON_1_PAUSE_LEN_MIN                 ((uint_fast8_t)(F_INTERRUPTS * THOMSON_1_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define THOMSON_1_PAUSE_LEN_MAX                 ((uint_fast8_t)(F_INTERRUPTS * THOMSON_1_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define THOMSON_0_PAUSE_LEN_MIN                 ((uint_fast8_t)(F_INTERRUPTS * THOMSON_0_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define THOMSON_0_PAUSE_LEN_MAX                 ((uint_fast8_t)(F_INTERRUPTS * THOMSON_0_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)

#define RC6_START_BIT_PULSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * RC6_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RC6_START_BIT_PULSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * RC6_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define RC6_START_BIT_PAUSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * RC6_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RC6_START_BIT_PAUSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * RC6_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define RC6_TOGGLE_BIT_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * RC6_TOGGLE_BIT_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RC6_TOGGLE_BIT_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * RC6_TOGGLE_BIT_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define RC6_BIT_PULSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * RC6_BIT_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RC6_BIT_PULSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * RC6_BIT_TIME * MAX_TOLERANCE_60 + 0.5) + 1)       // pulses: 300 - 800
#define RC6_BIT_PAUSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * RC6_BIT_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RC6_BIT_PAUSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * RC6_BIT_TIME * MAX_TOLERANCE_20 + 0.5) + 1)       // pauses: 300 - 600

#define RECS80EXT_START_BIT_PULSE_LEN_MIN       ((uint_fast8_t)(F_INTERRUPTS * RECS80EXT_START_BIT_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define RECS80EXT_START_BIT_PULSE_LEN_MAX       ((uint_fast8_t)(F_INTERRUPTS * RECS80EXT_START_BIT_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define RECS80EXT_START_BIT_PAUSE_LEN_MIN       ((uint_fast8_t)(F_INTERRUPTS * RECS80EXT_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RECS80EXT_START_BIT_PAUSE_LEN_MAX       ((uint_fast8_t)(F_INTERRUPTS * RECS80EXT_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define RECS80EXT_PULSE_LEN_MIN                 ((uint_fast8_t)(F_INTERRUPTS * RECS80EXT_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define RECS80EXT_PULSE_LEN_MAX                 ((uint_fast8_t)(F_INTERRUPTS * RECS80EXT_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define RECS80EXT_1_PAUSE_LEN_MIN               ((uint_fast8_t)(F_INTERRUPTS * RECS80EXT_1_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RECS80EXT_1_PAUSE_LEN_MAX               ((uint_fast8_t)(F_INTERRUPTS * RECS80EXT_1_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define RECS80EXT_0_PAUSE_LEN_MIN               ((uint_fast8_t)(F_INTERRUPTS * RECS80EXT_0_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RECS80EXT_0_PAUSE_LEN_MAX               ((uint_fast8_t)(F_INTERRUPTS * RECS80EXT_0_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)

#define NUBERT_START_BIT_PULSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * NUBERT_START_BIT_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define NUBERT_START_BIT_PULSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * NUBERT_START_BIT_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define NUBERT_START_BIT_PAUSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * NUBERT_START_BIT_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define NUBERT_START_BIT_PAUSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * NUBERT_START_BIT_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define NUBERT_1_PULSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * NUBERT_1_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define NUBERT_1_PULSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * NUBERT_1_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define NUBERT_1_PAUSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * NUBERT_1_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define NUBERT_1_PAUSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * NUBERT_1_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define NUBERT_0_PULSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * NUBERT_0_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define NUBERT_0_PULSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * NUBERT_0_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define NUBERT_0_PAUSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * NUBERT_0_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define NUBERT_0_PAUSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * NUBERT_0_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)

#define FAN_START_BIT_PULSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * FAN_START_BIT_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define FAN_START_BIT_PULSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * FAN_START_BIT_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define FAN_START_BIT_PAUSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * FAN_START_BIT_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define FAN_START_BIT_PAUSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * FAN_START_BIT_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define FAN_1_PULSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * FAN_1_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define FAN_1_PULSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * FAN_1_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define FAN_1_PAUSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * FAN_1_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define FAN_1_PAUSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * FAN_1_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define FAN_0_PULSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * FAN_0_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define FAN_0_PULSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * FAN_0_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define FAN_0_PAUSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * FAN_0_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define FAN_0_PAUSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * FAN_0_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)

#define SPEAKER_START_BIT_PULSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * SPEAKER_START_BIT_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define SPEAKER_START_BIT_PULSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * SPEAKER_START_BIT_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define SPEAKER_START_BIT_PAUSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * SPEAKER_START_BIT_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define SPEAKER_START_BIT_PAUSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * SPEAKER_START_BIT_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define SPEAKER_1_PULSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * SPEAKER_1_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define SPEAKER_1_PULSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * SPEAKER_1_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define SPEAKER_1_PAUSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * SPEAKER_1_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define SPEAKER_1_PAUSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * SPEAKER_1_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define SPEAKER_0_PULSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * SPEAKER_0_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define SPEAKER_0_PULSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * SPEAKER_0_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define SPEAKER_0_PAUSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * SPEAKER_0_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define SPEAKER_0_PAUSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * SPEAKER_0_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)

#define BANG_OLUFSEN_START_BIT1_PULSE_LEN_MIN   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT1_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define BANG_OLUFSEN_START_BIT1_PULSE_LEN_MAX   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT1_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define BANG_OLUFSEN_START_BIT1_PAUSE_LEN_MIN   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT1_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define BANG_OLUFSEN_START_BIT1_PAUSE_LEN_MAX   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT1_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define BANG_OLUFSEN_START_BIT2_PULSE_LEN_MIN   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT2_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define BANG_OLUFSEN_START_BIT2_PULSE_LEN_MAX   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT2_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define BANG_OLUFSEN_START_BIT2_PAUSE_LEN_MIN   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT2_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define BANG_OLUFSEN_START_BIT2_PAUSE_LEN_MAX   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT2_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define BANG_OLUFSEN_START_BIT3_PULSE_LEN_MIN   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT3_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define BANG_OLUFSEN_START_BIT3_PULSE_LEN_MAX   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT3_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define BANG_OLUFSEN_START_BIT3_PAUSE_LEN_MIN   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT3_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define BANG_OLUFSEN_START_BIT3_PAUSE_LEN_MAX   ((PAUSE_LEN)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT3_PAUSE_TIME * MAX_TOLERANCE_05 + 0.5) + 1) // value must be below IRMP_TIMEOUT
#define BANG_OLUFSEN_START_BIT4_PULSE_LEN_MIN   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT4_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define BANG_OLUFSEN_START_BIT4_PULSE_LEN_MAX   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT4_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define BANG_OLUFSEN_START_BIT4_PAUSE_LEN_MIN   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT4_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define BANG_OLUFSEN_START_BIT4_PAUSE_LEN_MAX   ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_START_BIT4_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define BANG_OLUFSEN_PULSE_LEN_MIN              ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define BANG_OLUFSEN_PULSE_LEN_MAX              ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define BANG_OLUFSEN_1_PAUSE_LEN_MIN            ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_1_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define BANG_OLUFSEN_1_PAUSE_LEN_MAX            ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_1_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define BANG_OLUFSEN_0_PAUSE_LEN_MIN            ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_0_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define BANG_OLUFSEN_0_PAUSE_LEN_MAX            ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_0_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define BANG_OLUFSEN_R_PAUSE_LEN_MIN            ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_R_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define BANG_OLUFSEN_R_PAUSE_LEN_MAX            ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_R_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define BANG_OLUFSEN_TRAILER_BIT_PAUSE_LEN_MIN  ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_TRAILER_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define BANG_OLUFSEN_TRAILER_BIT_PAUSE_LEN_MAX  ((uint_fast8_t)(F_INTERRUPTS * BANG_OLUFSEN_TRAILER_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)

#define IR60_TIMEOUT_LEN                        ((uint_fast8_t)(F_INTERRUPTS * IR60_TIMEOUT_TIME * 0.5))
#define GRUNDIG_NOKIA_IR60_START_BIT_LEN_MIN    ((uint_fast8_t)(F_INTERRUPTS * GRUNDIG_NOKIA_IR60_BIT_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define GRUNDIG_NOKIA_IR60_START_BIT_LEN_MAX    ((uint_fast8_t)(F_INTERRUPTS * GRUNDIG_NOKIA_IR60_BIT_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define GRUNDIG_NOKIA_IR60_BIT_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * GRUNDIG_NOKIA_IR60_BIT_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define GRUNDIG_NOKIA_IR60_BIT_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * GRUNDIG_NOKIA_IR60_BIT_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define GRUNDIG_NOKIA_IR60_PRE_PAUSE_LEN_MIN    ((uint_fast8_t)(F_INTERRUPTS * GRUNDIG_NOKIA_IR60_PRE_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) + 1)
#define GRUNDIG_NOKIA_IR60_PRE_PAUSE_LEN_MAX    ((uint_fast8_t)(F_INTERRUPTS * GRUNDIG_NOKIA_IR60_PRE_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)

#define SIEMENS_OR_RUWIDO_START_BIT_PULSE_LEN_MIN       ((uint_fast8_t)(F_INTERRUPTS * SIEMENS_OR_RUWIDO_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define SIEMENS_OR_RUWIDO_START_BIT_PULSE_LEN_MAX       ((uint_fast8_t)(F_INTERRUPTS * SIEMENS_OR_RUWIDO_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define SIEMENS_OR_RUWIDO_START_BIT_PAUSE_LEN_MIN       ((uint_fast8_t)(F_INTERRUPTS * SIEMENS_OR_RUWIDO_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define SIEMENS_OR_RUWIDO_START_BIT_PAUSE_LEN_MAX       ((uint_fast8_t)(F_INTERRUPTS * SIEMENS_OR_RUWIDO_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define SIEMENS_OR_RUWIDO_BIT_PULSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * SIEMENS_OR_RUWIDO_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define SIEMENS_OR_RUWIDO_BIT_PULSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * SIEMENS_OR_RUWIDO_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define SIEMENS_OR_RUWIDO_BIT_PAUSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * SIEMENS_OR_RUWIDO_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define SIEMENS_OR_RUWIDO_BIT_PAUSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * SIEMENS_OR_RUWIDO_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)

#define FDC_START_BIT_PULSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * FDC_START_BIT_PULSE_TIME * MIN_TOLERANCE_05 + 0.5) - 1)   // 5%: avoid conflict with NETBOX
#define FDC_START_BIT_PULSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * FDC_START_BIT_PULSE_TIME * MAX_TOLERANCE_05 + 0.5))
#define FDC_START_BIT_PAUSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * FDC_START_BIT_PAUSE_TIME * MIN_TOLERANCE_05 + 0.5) - 1)
#define FDC_START_BIT_PAUSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * FDC_START_BIT_PAUSE_TIME * MAX_TOLERANCE_05 + 0.5))
#define FDC_PULSE_LEN_MIN                       ((uint_fast8_t)(F_INTERRUPTS * FDC_PULSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define FDC_PULSE_LEN_MAX                       ((uint_fast8_t)(F_INTERRUPTS * FDC_PULSE_TIME * MAX_TOLERANCE_50 + 0.5) + 1)
#define FDC_1_PAUSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * FDC_1_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define FDC_1_PAUSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * FDC_1_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#if 0
#define FDC_0_PAUSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * FDC_0_PAUSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)   // could be negative: 255
#else
#define FDC_0_PAUSE_LEN_MIN                     (1)                                                                         // simply use 1
#endif
#define FDC_0_PAUSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * FDC_0_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)

#define RCCAR_START_BIT_PULSE_LEN_MIN           ((uint_fast8_t)(F_INTERRUPTS * RCCAR_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RCCAR_START_BIT_PULSE_LEN_MAX           ((uint_fast8_t)(F_INTERRUPTS * RCCAR_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define RCCAR_START_BIT_PAUSE_LEN_MIN           ((uint_fast8_t)(F_INTERRUPTS * RCCAR_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RCCAR_START_BIT_PAUSE_LEN_MAX           ((uint_fast8_t)(F_INTERRUPTS * RCCAR_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define RCCAR_PULSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * RCCAR_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define RCCAR_PULSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * RCCAR_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define RCCAR_1_PAUSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * RCCAR_1_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define RCCAR_1_PAUSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * RCCAR_1_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define RCCAR_0_PAUSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * RCCAR_0_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define RCCAR_0_PAUSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * RCCAR_0_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)

#define JVC_START_BIT_PULSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * JVC_START_BIT_PULSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define JVC_START_BIT_PULSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * JVC_START_BIT_PULSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
#define JVC_REPEAT_START_BIT_PAUSE_LEN_MIN      ((uint_fast8_t)(F_INTERRUPTS * (JVC_FRAME_REPEAT_PAUSE_TIME - IRMP_TIMEOUT_TIME) * MIN_TOLERANCE_40 + 0.5) - 1)  // HACK!
#define JVC_REPEAT_START_BIT_PAUSE_LEN_MAX      ((uint_fast8_t)(F_INTERRUPTS * (JVC_FRAME_REPEAT_PAUSE_TIME - IRMP_TIMEOUT_TIME) * MAX_TOLERANCE_70 + 0.5) - 1)  // HACK!
#define JVC_PULSE_LEN_MIN                       ((uint_fast8_t)(F_INTERRUPTS * JVC_PULSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define JVC_PULSE_LEN_MAX                       ((uint_fast8_t)(F_INTERRUPTS * JVC_PULSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
#define JVC_1_PAUSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * JVC_1_PAUSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define JVC_1_PAUSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * JVC_1_PAUSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
#define JVC_0_PAUSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * JVC_0_PAUSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define JVC_0_PAUSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * JVC_0_PAUSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
// autodetect JVC repetition frame within 50 msec:
#define JVC_FRAME_REPEAT_PAUSE_LEN_MAX          (uint_fast16_t)(F_INTERRUPTS * JVC_FRAME_REPEAT_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5)

#define NIKON_START_BIT_PULSE_LEN_MIN           ((uint_fast8_t)(F_INTERRUPTS * NIKON_START_BIT_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define NIKON_START_BIT_PULSE_LEN_MAX           ((uint_fast8_t)(F_INTERRUPTS * NIKON_START_BIT_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define NIKON_START_BIT_PAUSE_LEN_MIN           ((uint_fast16_t)(F_INTERRUPTS * NIKON_START_BIT_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define NIKON_START_BIT_PAUSE_LEN_MAX           ((uint_fast16_t)(F_INTERRUPTS * NIKON_START_BIT_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define NIKON_REPEAT_START_BIT_PAUSE_LEN_MIN    ((uint_fast8_t)(F_INTERRUPTS * NIKON_REPEAT_START_BIT_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define NIKON_REPEAT_START_BIT_PAUSE_LEN_MAX    ((uint_fast8_t)(F_INTERRUPTS * NIKON_REPEAT_START_BIT_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define NIKON_PULSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * NIKON_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define NIKON_PULSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * NIKON_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define NIKON_1_PAUSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * NIKON_1_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define NIKON_1_PAUSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * NIKON_1_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define NIKON_0_PAUSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * NIKON_0_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define NIKON_0_PAUSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * NIKON_0_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define NIKON_FRAME_REPEAT_PAUSE_LEN_MAX        (uint_fast16_t)(F_INTERRUPTS * NIKON_FRAME_REPEAT_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5)

#define KATHREIN_START_BIT_PULSE_LEN_MIN        ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define KATHREIN_START_BIT_PULSE_LEN_MAX        ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define KATHREIN_START_BIT_PAUSE_LEN_MIN        ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define KATHREIN_START_BIT_PAUSE_LEN_MAX        ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define KATHREIN_1_PULSE_LEN_MIN                ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_1_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define KATHREIN_1_PULSE_LEN_MAX                ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_1_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define KATHREIN_1_PAUSE_LEN_MIN                ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_1_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define KATHREIN_1_PAUSE_LEN_MAX                ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_1_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define KATHREIN_0_PULSE_LEN_MIN                ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_0_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define KATHREIN_0_PULSE_LEN_MAX                ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_0_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define KATHREIN_0_PAUSE_LEN_MIN                ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_0_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define KATHREIN_0_PAUSE_LEN_MAX                ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_0_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define KATHREIN_SYNC_BIT_PAUSE_LEN_MIN         ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_SYNC_BIT_PAUSE_LEN_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define KATHREIN_SYNC_BIT_PAUSE_LEN_MAX         ((uint_fast8_t)(F_INTERRUPTS * KATHREIN_SYNC_BIT_PAUSE_LEN_TIME * MAX_TOLERANCE_10 + 0.5) + 1)

#define NETBOX_START_BIT_PULSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * NETBOX_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define NETBOX_START_BIT_PULSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * NETBOX_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define NETBOX_START_BIT_PAUSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * NETBOX_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define NETBOX_START_BIT_PAUSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * NETBOX_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define NETBOX_PULSE_LEN                        ((uint_fast8_t)(F_INTERRUPTS * NETBOX_PULSE_TIME))
#define NETBOX_PAUSE_LEN                        ((uint_fast8_t)(F_INTERRUPTS * NETBOX_PAUSE_TIME))
#define NETBOX_PULSE_REST_LEN                   ((uint_fast8_t)(F_INTERRUPTS * NETBOX_PULSE_TIME / 4))
#define NETBOX_PAUSE_REST_LEN                   ((uint_fast8_t)(F_INTERRUPTS * NETBOX_PAUSE_TIME / 4))

#define LEGO_START_BIT_PULSE_LEN_MIN            ((uint_fast8_t)(F_INTERRUPTS * LEGO_START_BIT_PULSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define LEGO_START_BIT_PULSE_LEN_MAX            ((uint_fast8_t)(F_INTERRUPTS * LEGO_START_BIT_PULSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
#define LEGO_START_BIT_PAUSE_LEN_MIN            ((uint_fast8_t)(F_INTERRUPTS * LEGO_START_BIT_PAUSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define LEGO_START_BIT_PAUSE_LEN_MAX            ((uint_fast8_t)(F_INTERRUPTS * LEGO_START_BIT_PAUSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
#define LEGO_PULSE_LEN_MIN                      ((uint_fast8_t)(F_INTERRUPTS * LEGO_PULSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define LEGO_PULSE_LEN_MAX                      ((uint_fast8_t)(F_INTERRUPTS * LEGO_PULSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
#define LEGO_1_PAUSE_LEN_MIN                    ((uint_fast8_t)(F_INTERRUPTS * LEGO_1_PAUSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define LEGO_1_PAUSE_LEN_MAX                    ((uint_fast8_t)(F_INTERRUPTS * LEGO_1_PAUSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)
#define LEGO_0_PAUSE_LEN_MIN                    ((uint_fast8_t)(F_INTERRUPTS * LEGO_0_PAUSE_TIME * MIN_TOLERANCE_40 + 0.5) - 1)
#define LEGO_0_PAUSE_LEN_MAX                    ((uint_fast8_t)(F_INTERRUPTS * LEGO_0_PAUSE_TIME * MAX_TOLERANCE_40 + 0.5) + 1)

#define BOSE_START_BIT_PULSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * BOSE_START_BIT_PULSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define BOSE_START_BIT_PULSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * BOSE_START_BIT_PULSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define BOSE_START_BIT_PAUSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * BOSE_START_BIT_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define BOSE_START_BIT_PAUSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * BOSE_START_BIT_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define BOSE_PULSE_LEN_MIN                       ((uint_fast8_t)(F_INTERRUPTS * BOSE_PULSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define BOSE_PULSE_LEN_MAX                       ((uint_fast8_t)(F_INTERRUPTS * BOSE_PULSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define BOSE_1_PAUSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * BOSE_1_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define BOSE_1_PAUSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * BOSE_1_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define BOSE_0_PAUSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * BOSE_0_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define BOSE_0_PAUSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * BOSE_0_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define BOSE_FRAME_REPEAT_PAUSE_LEN_MAX          (uint_fast16_t)(F_INTERRUPTS * 100.0e-3 * MAX_TOLERANCE_20 + 0.5)

#define A1TVBOX_START_BIT_PULSE_LEN_MIN         ((uint_fast8_t)(F_INTERRUPTS * A1TVBOX_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define A1TVBOX_START_BIT_PULSE_LEN_MAX         ((uint_fast8_t)(F_INTERRUPTS * A1TVBOX_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define A1TVBOX_START_BIT_PAUSE_LEN_MIN         ((uint_fast8_t)(F_INTERRUPTS * A1TVBOX_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define A1TVBOX_START_BIT_PAUSE_LEN_MAX         ((uint_fast8_t)(F_INTERRUPTS * A1TVBOX_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define A1TVBOX_BIT_PULSE_LEN_MIN               ((uint_fast8_t)(F_INTERRUPTS * A1TVBOX_BIT_PULSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define A1TVBOX_BIT_PULSE_LEN_MAX               ((uint_fast8_t)(F_INTERRUPTS * A1TVBOX_BIT_PULSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define A1TVBOX_BIT_PAUSE_LEN_MIN               ((uint_fast8_t)(F_INTERRUPTS * A1TVBOX_BIT_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define A1TVBOX_BIT_PAUSE_LEN_MAX               ((uint_fast8_t)(F_INTERRUPTS * A1TVBOX_BIT_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)

#define MERLIN_START_BIT_PULSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * MERLIN_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define MERLIN_START_BIT_PULSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * MERLIN_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define MERLIN_START_BIT_PAUSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * MERLIN_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define MERLIN_START_BIT_PAUSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * MERLIN_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define MERLIN_BIT_PULSE_LEN_MIN                ((uint_fast8_t)(F_INTERRUPTS * MERLIN_BIT_PULSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define MERLIN_BIT_PULSE_LEN_MAX                ((uint_fast8_t)(F_INTERRUPTS * MERLIN_BIT_PULSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define MERLIN_BIT_PAUSE_LEN_MIN                ((uint_fast8_t)(F_INTERRUPTS * MERLIN_BIT_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define MERLIN_BIT_PAUSE_LEN_MAX                ((uint_fast8_t)(F_INTERRUPTS * MERLIN_BIT_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)

#define ORTEK_START_BIT_PULSE_LEN_MIN           ((uint_fast8_t)(F_INTERRUPTS * ORTEK_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define ORTEK_START_BIT_PULSE_LEN_MAX           ((uint_fast8_t)(F_INTERRUPTS * ORTEK_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define ORTEK_START_BIT_PAUSE_LEN_MIN           ((uint_fast8_t)(F_INTERRUPTS * ORTEK_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define ORTEK_START_BIT_PAUSE_LEN_MAX           ((uint_fast8_t)(F_INTERRUPTS * ORTEK_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define ORTEK_BIT_PULSE_LEN_MIN                 ((uint_fast8_t)(F_INTERRUPTS * ORTEK_BIT_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define ORTEK_BIT_PULSE_LEN_MAX                 ((uint_fast8_t)(F_INTERRUPTS * ORTEK_BIT_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define ORTEK_BIT_PAUSE_LEN_MIN                 ((uint_fast8_t)(F_INTERRUPTS * ORTEK_BIT_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define ORTEK_BIT_PAUSE_LEN_MAX                 ((uint_fast8_t)(F_INTERRUPTS * ORTEK_BIT_TIME * MAX_TOLERANCE_10 + 0.5) + 1)

#define TELEFUNKEN_START_BIT_PULSE_LEN_MIN      ((uint_fast8_t)(F_INTERRUPTS * TELEFUNKEN_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define TELEFUNKEN_START_BIT_PULSE_LEN_MAX      ((uint_fast8_t)(F_INTERRUPTS * TELEFUNKEN_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define TELEFUNKEN_START_BIT_PAUSE_LEN_MIN      ((uint_fast8_t)(F_INTERRUPTS * (TELEFUNKEN_START_BIT_PAUSE_TIME) * MIN_TOLERANCE_10 + 0.5) - 1)
#define TELEFUNKEN_START_BIT_PAUSE_LEN_MAX      ((uint_fast8_t)(F_INTERRUPTS * (TELEFUNKEN_START_BIT_PAUSE_TIME) * MAX_TOLERANCE_10 + 0.5) - 1)
#define TELEFUNKEN_PULSE_LEN_MIN                ((uint_fast8_t)(F_INTERRUPTS * TELEFUNKEN_PULSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define TELEFUNKEN_PULSE_LEN_MAX                ((uint_fast8_t)(F_INTERRUPTS * TELEFUNKEN_PULSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define TELEFUNKEN_1_PAUSE_LEN_MIN              ((uint_fast8_t)(F_INTERRUPTS * TELEFUNKEN_1_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define TELEFUNKEN_1_PAUSE_LEN_MAX              ((uint_fast8_t)(F_INTERRUPTS * TELEFUNKEN_1_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
#define TELEFUNKEN_0_PAUSE_LEN_MIN              ((uint_fast8_t)(F_INTERRUPTS * TELEFUNKEN_0_PAUSE_TIME * MIN_TOLERANCE_30 + 0.5) - 1)
#define TELEFUNKEN_0_PAUSE_LEN_MAX              ((uint_fast8_t)(F_INTERRUPTS * TELEFUNKEN_0_PAUSE_TIME * MAX_TOLERANCE_30 + 0.5) + 1)
// autodetect TELEFUNKEN repetition frame within 50 msec:
// #define TELEFUNKEN_FRAME_REPEAT_PAUSE_LEN_MAX   (uint_fast16_t)(F_INTERRUPTS * TELEFUNKEN_FRAME_REPEAT_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5)

#define ROOMBA_START_BIT_PULSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define ROOMBA_START_BIT_PULSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define ROOMBA_START_BIT_PAUSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define ROOMBA_START_BIT_PAUSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define ROOMBA_1_PAUSE_LEN_EXACT                ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_1_PAUSE_TIME + 0.5))
#define ROOMBA_1_PULSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_1_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define ROOMBA_1_PULSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_1_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define ROOMBA_1_PAUSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_1_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define ROOMBA_1_PAUSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_1_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define ROOMBA_0_PAUSE_LEN                      ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_0_PAUSE_TIME))
#define ROOMBA_0_PULSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_0_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define ROOMBA_0_PULSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_0_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define ROOMBA_0_PAUSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_0_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define ROOMBA_0_PAUSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * ROOMBA_0_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)

#define RCMM32_START_BIT_PULSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * RCMM32_START_BIT_PULSE_TIME * MIN_TOLERANCE_05 + 0.5) - 1)
#define RCMM32_START_BIT_PULSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * RCMM32_START_BIT_PULSE_TIME * MAX_TOLERANCE_05 + 0.5) + 1)
#define RCMM32_START_BIT_PAUSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * RCMM32_START_BIT_PAUSE_TIME * MIN_TOLERANCE_05 + 0.5) - 1)
#define RCMM32_START_BIT_PAUSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * RCMM32_START_BIT_PAUSE_TIME * MAX_TOLERANCE_05 + 0.5) + 1)
#define RCMM32_BIT_PULSE_LEN_MIN                ((uint_fast8_t)(F_INTERRUPTS * RCMM32_PULSE_TIME * MIN_TOLERANCE_05 + 0.5) - 1)
#define RCMM32_BIT_PULSE_LEN_MAX                ((uint_fast8_t)(F_INTERRUPTS * RCMM32_PULSE_TIME * MAX_TOLERANCE_05 + 0.5) + 1)
#define RCMM32_BIT_00_PAUSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * RCMM32_00_PAUSE_TIME * MIN_TOLERANCE_05 + 0.5) - 1)
#define RCMM32_BIT_00_PAUSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * RCMM32_00_PAUSE_TIME * MAX_TOLERANCE_05 + 0.5) + 1)
#define RCMM32_BIT_01_PAUSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * RCMM32_01_PAUSE_TIME * MIN_TOLERANCE_05 + 0.5) - 1)
#define RCMM32_BIT_01_PAUSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * RCMM32_01_PAUSE_TIME * MAX_TOLERANCE_05 + 0.5) + 1)
#define RCMM32_BIT_10_PAUSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * RCMM32_10_PAUSE_TIME * MIN_TOLERANCE_05 + 0.5) - 1)
#define RCMM32_BIT_10_PAUSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * RCMM32_10_PAUSE_TIME * MAX_TOLERANCE_05 + 0.5) + 1)
#define RCMM32_BIT_11_PAUSE_LEN_MIN             ((uint_fast8_t)(F_INTERRUPTS * RCMM32_11_PAUSE_TIME * MIN_TOLERANCE_05 + 0.5) - 1)
#define RCMM32_BIT_11_PAUSE_LEN_MAX             ((uint_fast8_t)(F_INTERRUPTS * RCMM32_11_PAUSE_TIME * MAX_TOLERANCE_05 + 0.5) + 1)

#define PENTAX_START_BIT_PULSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * PENTAX_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define PENTAX_START_BIT_PULSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * PENTAX_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define PENTAX_START_BIT_PAUSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * PENTAX_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define PENTAX_START_BIT_PAUSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * PENTAX_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define PENTAX_1_PAUSE_LEN_EXACT                ((uint_fast8_t)(F_INTERRUPTS * PENTAX_1_PAUSE_TIME + 0.5))
#define PENTAX_PULSE_LEN_MIN                    ((uint_fast8_t)(F_INTERRUPTS * PENTAX_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define PENTAX_PULSE_LEN_MAX                    ((uint_fast8_t)(F_INTERRUPTS * PENTAX_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define PENTAX_1_PAUSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * PENTAX_1_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define PENTAX_1_PAUSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * PENTAX_1_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define PENTAX_0_PAUSE_LEN                      ((uint_fast8_t)(F_INTERRUPTS * PENTAX_0_PAUSE_TIME))
#define PENTAX_PULSE_LEN_MIN                    ((uint_fast8_t)(F_INTERRUPTS * PENTAX_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define PENTAX_PULSE_LEN_MAX                    ((uint_fast8_t)(F_INTERRUPTS * PENTAX_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define PENTAX_0_PAUSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * PENTAX_0_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define PENTAX_0_PAUSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * PENTAX_0_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)

#define ACP24_START_BIT_PULSE_LEN_MIN           ((uint_fast8_t)(F_INTERRUPTS * ACP24_START_BIT_PULSE_TIME * MIN_TOLERANCE_15 + 0.5) - 1)
#define ACP24_START_BIT_PULSE_LEN_MAX           ((uint_fast8_t)(F_INTERRUPTS * ACP24_START_BIT_PULSE_TIME * MAX_TOLERANCE_15 + 0.5) + 1)
#define ACP24_START_BIT_PAUSE_LEN_MIN           ((uint_fast8_t)(F_INTERRUPTS * ACP24_START_BIT_PAUSE_TIME * MIN_TOLERANCE_15 + 0.5) - 1)
#define ACP24_START_BIT_PAUSE_LEN_MAX           ((uint_fast8_t)(F_INTERRUPTS * ACP24_START_BIT_PAUSE_TIME * MAX_TOLERANCE_15 + 0.5) + 1)
#define ACP24_PULSE_LEN_MIN                     ((uint_fast8_t)(F_INTERRUPTS * ACP24_PULSE_TIME * MIN_TOLERANCE_15 + 0.5) - 1)
#define ACP24_PULSE_LEN_MAX                     ((uint_fast8_t)(F_INTERRUPTS * ACP24_PULSE_TIME * MAX_TOLERANCE_15 + 0.5) + 1)
#define ACP24_1_PAUSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * ACP24_1_PAUSE_TIME * MIN_TOLERANCE_15 + 0.5) - 1)
#define ACP24_1_PAUSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * ACP24_1_PAUSE_TIME * MAX_TOLERANCE_15 + 0.5) + 1)
#define ACP24_0_PAUSE_LEN_MIN                   ((uint_fast8_t)(F_INTERRUPTS * ACP24_0_PAUSE_TIME * MIN_TOLERANCE_15 + 0.5) - 1)
#define ACP24_0_PAUSE_LEN_MAX                   ((uint_fast8_t)(F_INTERRUPTS * ACP24_0_PAUSE_TIME * MAX_TOLERANCE_15 + 0.5) + 1)

#define RADIO1_START_BIT_PULSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * RADIO1_START_BIT_PULSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RADIO1_START_BIT_PULSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * RADIO1_START_BIT_PULSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define RADIO1_START_BIT_PAUSE_LEN_MIN          ((uint_fast8_t)(F_INTERRUPTS * RADIO1_START_BIT_PAUSE_TIME * MIN_TOLERANCE_10 + 0.5) - 1)
#define RADIO1_START_BIT_PAUSE_LEN_MAX          ((uint_fast8_t)(F_INTERRUPTS * RADIO1_START_BIT_PAUSE_TIME * MAX_TOLERANCE_10 + 0.5) + 1)
#define RADIO1_1_PAUSE_LEN_EXACT                ((uint_fast8_t)(F_INTERRUPTS * RADIO1_1_PAUSE_TIME + 0.5))
#define RADIO1_1_PULSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * RADIO1_1_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define RADIO1_1_PULSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * RADIO1_1_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define RADIO1_1_PAUSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * RADIO1_1_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define RADIO1_1_PAUSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * RADIO1_1_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define RADIO1_0_PAUSE_LEN                      ((uint_fast8_t)(F_INTERRUPTS * RADIO1_0_PAUSE_TIME))
#define RADIO1_0_PULSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * RADIO1_0_PULSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define RADIO1_0_PULSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * RADIO1_0_PULSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)
#define RADIO1_0_PAUSE_LEN_MIN                  ((uint_fast8_t)(F_INTERRUPTS * RADIO1_0_PAUSE_TIME * MIN_TOLERANCE_20 + 0.5) - 1)
#define RADIO1_0_PAUSE_LEN_MAX                  ((uint_fast8_t)(F_INTERRUPTS * RADIO1_0_PAUSE_TIME * MAX_TOLERANCE_20 + 0.5) + 1)

#define AUTO_FRAME_REPETITION_LEN               (uint_fast16_t)(F_INTERRUPTS * AUTO_FRAME_REPETITION_TIME + 0.5)       // use uint_fast16_t!

#ifdef ANALYZE
#  define ANALYZE_PUTCHAR(a)                    { if (! silent)             { putchar (a);          } }
#  define ANALYZE_ONLY_NORMAL_PUTCHAR(a)        { if (! silent && !verbose) { putchar (a);          } }
#  define ANALYZE_PRINTF(...)                   { if (verbose)              { printf (__VA_ARGS__); } }
#  define ANALYZE_ONLY_NORMAL_PRINTF(...)       { if (! silent && !verbose) { printf (__VA_ARGS__); } }
#  define ANALYZE_NEWLINE()                     { if (verbose)              { putchar ('\n');       } }
static int                                      silent;
static int                                      time_counter;
static int                                      verbose;

/*******************************                not every PIC compiler knows variadic macros :-(
#else
#  define ANALYZE_PUTCHAR(a)
#  define ANALYZE_ONLY_NORMAL_PUTCHAR(a)
#  define ANALYZE_PRINTF(...)
#  define ANALYZE_ONLY_NORMAL_PRINTF(...)
#  endif
#  define ANALYZE_NEWLINE()
*********************************/
#endif

#if IRMP_USE_CALLBACK == 1
static void                                     (*irmp_callback_ptr) (uint_fast8_t);
#endif // IRMP_USE_CALLBACK == 1

#define PARITY_CHECK_OK                         1
#define PARITY_CHECK_FAILED                     0

/*---------------------------------------------------------------------------------------------------------------------------------------------------
 *  Protocol names
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */
#if defined(UNIX_OR_WINDOWS) || IRMP_PROTOCOL_NAMES == 1
static const char proto_unknown[]       PROGMEM = "UNKNOWN";
static const char proto_sircs[]         PROGMEM = "SIRCS";
static const char proto_nec[]           PROGMEM = "NEC";
static const char proto_samsung[]       PROGMEM = "SAMSUNG";
static const char proto_matsushita[]    PROGMEM = "MATSUSH";
static const char proto_kaseikyo[]      PROGMEM = "KASEIKYO";
static const char proto_recs80[]        PROGMEM = "RECS80";
static const char proto_rc5[]           PROGMEM = "RC5";
static const char proto_denon[]         PROGMEM = "DENON";
static const char proto_rc6[]           PROGMEM = "RC6";
static const char proto_samsung32[]     PROGMEM = "SAMSG32";
static const char proto_apple[]         PROGMEM = "APPLE";
static const char proto_recs80ext[]     PROGMEM = "RECS80EX";
static const char proto_nubert[]        PROGMEM = "NUBERT";
static const char proto_bang_olufsen[]  PROGMEM = "BANG OLU";
static const char proto_grundig[]       PROGMEM = "GRUNDIG";
static const char proto_nokia[]         PROGMEM = "NOKIA";
static const char proto_siemens[]       PROGMEM = "SIEMENS";
static const char proto_fdc[]           PROGMEM = "FDC";
static const char proto_rccar[]         PROGMEM = "RCCAR";
static const char proto_jvc[]           PROGMEM = "JVC";
static const char proto_rc6a[]          PROGMEM = "RC6A";
static const char proto_nikon[]         PROGMEM = "NIKON";
static const char proto_ruwido[]        PROGMEM = "RUWIDO";
static const char proto_ir60[]          PROGMEM = "IR60";
static const char proto_kathrein[]      PROGMEM = "KATHREIN";
static const char proto_netbox[]        PROGMEM = "NETBOX";
static const char proto_nec16[]         PROGMEM = "NEC16";
static const char proto_nec42[]         PROGMEM = "NEC42";
static const char proto_lego[]          PROGMEM = "LEGO";
static const char proto_thomson[]       PROGMEM = "THOMSON";
static const char proto_bose[]          PROGMEM = "BOSE";
static const char proto_a1tvbox[]       PROGMEM = "A1TVBOX";
static const char proto_ortek[]         PROGMEM = "ORTEK";
static const char proto_telefunken[]    PROGMEM = "TELEFUNKEN";
static const char proto_roomba[]        PROGMEM = "ROOMBA";
static const char proto_rcmm32[]        PROGMEM = "RCMM32";
static const char proto_rcmm24[]        PROGMEM = "RCMM24";
static const char proto_rcmm12[]        PROGMEM = "RCMM12";
static const char proto_speaker[]       PROGMEM = "SPEAKER";
static const char proto_lgair[]         PROGMEM = "LGAIR";
static const char proto_samsung48[]     PROGMEM = "SAMSG48";
static const char proto_merlin[]        PROGMEM = "MERLIN";
static const char proto_pentax[]        PROGMEM = "PENTAX";
static const char proto_fan[]           PROGMEM = "FAN";
static const char proto_s100[]          PROGMEM = "S100";
static const char proto_acp24[]         PROGMEM = "ACP24";
static const char proto_technics[]      PROGMEM = "TECHNICS";
static const char proto_panasonic[]     PROGMEM = "PANASONIC";
static const char proto_mitsu_heavy[]   PROGMEM = "MITSU_HEAVY";
static const char proto_vincent[]       PROGMEM = "VINCENT";
static const char proto_samsungah[]     PROGMEM = "SAMSUNGAH";

static const char proto_radio1[]        PROGMEM = "RADIO1";

const char * const
irmp_protocol_names[IRMP_N_PROTOCOLS + 1] PROGMEM =
{
    proto_unknown,
    proto_sircs,
    proto_nec,
    proto_samsung,
    proto_matsushita,
    proto_kaseikyo,
    proto_recs80,
    proto_rc5,
    proto_denon,
    proto_rc6,
    proto_samsung32,
    proto_apple,
    proto_recs80ext,
    proto_nubert,
    proto_bang_olufsen,
    proto_grundig,
    proto_nokia,
    proto_siemens,
    proto_fdc,
    proto_rccar,
    proto_jvc,
    proto_rc6a,
    proto_nikon,
    proto_ruwido,
    proto_ir60,
    proto_kathrein,
    proto_netbox,
    proto_nec16,
    proto_nec42,
    proto_lego,
    proto_thomson,
    proto_bose,
    proto_a1tvbox,
    proto_ortek,
    proto_telefunken,
    proto_roomba,
    proto_rcmm32,
    proto_rcmm24,
    proto_rcmm12,
    proto_speaker,
    proto_lgair,
    proto_samsung48,
    proto_merlin,
    proto_pentax,
    proto_fan,
    proto_s100,
    proto_acp24,
    proto_technics,
    proto_panasonic,
    proto_mitsu_heavy,
    proto_vincent,
    proto_samsungah,
    proto_radio1
};

#endif

/*---------------------------------------------------------------------------------------------------------------------------------------------------
 *  Logging
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */
#if IRMP_LOGGING == 1                                                   // logging via UART

#if defined(ARM_STM32F4XX)
#  define  STM32_GPIO_CLOCK   RCC_AHB1Periph_GPIOA                      // UART2 on PA2
#  define  STM32_UART_CLOCK   RCC_APB1Periph_USART2
#  define  STM32_GPIO_PORT    GPIOA
#  define  STM32_GPIO_PIN     GPIO_Pin_2
#  define  STM32_GPIO_SOURCE  GPIO_PinSource2
#  define  STM32_UART_AF      GPIO_AF_USART2
#  define  STM32_UART_COM     USART2
#  define  STM32_UART_BAUD    115200                                    // 115200 Baud
#  include "stm32f4xx_usart.h"
#elif defined(ARM_STM32F10X)
#  define  STM32_UART_COM     USART3                                    // UART3 on PB10
#elif defined(ARDUINO)                                                  // Arduino Serial implementation
#  if defined(USB_SERIAL)
#    include "usb_serial.h"
#  else
#    error USB_SERIAL not defined in ARDUINO Environment
#  endif
#else
#  if IRMP_EXT_LOGGING == 1                                             // use external logging
#    include "irmpextlog.h"
#  else                                                                 // normal UART log (IRMP_EXT_LOGGING == 0)
#    define BAUD                                    9600L
#  ifndef UNIX_OR_WINDOWS
#    include <util/setbaud.h>
#  endif

#ifdef UBRR0H

#define UART0_UBRRH                             UBRR0H
#define UART0_UBRRL                             UBRR0L
#define UART0_UCSRA                             UCSR0A
#define UART0_UCSRB                             UCSR0B
#define UART0_UCSRC                             UCSR0C
#define UART0_UDRE_BIT_VALUE                    (1<<UDRE0)
#define UART0_UCSZ1_BIT_VALUE                   (1<<UCSZ01)
#define UART0_UCSZ0_BIT_VALUE                   (1<<UCSZ00)
#ifdef URSEL0
#define UART0_URSEL_BIT_VALUE                   (1<<URSEL0)
#else
#define UART0_URSEL_BIT_VALUE                   (0)
#endif
#define UART0_TXEN_BIT_VALUE                    (1<<TXEN0)
#define UART0_UDR                               UDR0
#define UART0_U2X                               U2X0

#else

#define UART0_UBRRH                             UBRRH
#define UART0_UBRRL                             UBRRL
#define UART0_UCSRA                             UCSRA
#define UART0_UCSRB                             UCSRB
#define UART0_UCSRC                             UCSRC
#define UART0_UDRE_BIT_VALUE                    (1<<UDRE)
#define UART0_UCSZ1_BIT_VALUE                   (1<<UCSZ1)
#define UART0_UCSZ0_BIT_VALUE                   (1<<UCSZ0)
#ifdef URSEL
#define UART0_URSEL_BIT_VALUE                   (1<<URSEL)
#else
#define UART0_URSEL_BIT_VALUE                   (0)
#endif
#define UART0_TXEN_BIT_VALUE                    (1<<TXEN)
#define UART0_UDR                               UDR
#define UART0_U2X                               U2X

#endif //UBRR0H
#endif //IRMP_EXT_LOGGING
#endif //ARM_STM32F4XX

/*---------------------------------------------------------------------------------------------------------------------------------------------------
 *  Initialize  UART
 *  @details  Initializes UART
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */
void
irmp_uart_init (void)
{
#ifndef UNIX_OR_WINDOWS
#if defined(ARM_STM32F4XX)
    GPIO_InitTypeDef GPIO_InitStructure;
    USART_InitTypeDef USART_InitStructure;

    // Clock enable vom TX Pin
    RCC_AHB1PeriphClockCmd(STM32_GPIO_CLOCK, ENABLE);

    // Clock enable der UART
    RCC_APB1PeriphClockCmd(STM32_UART_CLOCK, ENABLE);

    // UART Alternative-Funktion mit dem IO-Pin verbinden
    GPIO_PinAFConfig(STM32_GPIO_PORT,STM32_GPIO_SOURCE,STM32_UART_AF);

    // UART als Alternative-Funktion mit PushPull
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;

    // TX-Pin
    GPIO_InitStructure.GPIO_Pin = STM32_GPIO_PIN;
    GPIO_Init(STM32_GPIO_PORT, &GPIO_InitStructure);

    // Oversampling
    USART_OverSampling8Cmd(STM32_UART_COM, ENABLE);

    // init baud rate, 8 data bits, 1 stop bit, no parity, no RTS+CTS
    USART_InitStructure.USART_BaudRate = STM32_UART_BAUD;
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits = USART_StopBits_1;
    USART_InitStructure.USART_Parity = USART_Parity_No;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_InitStructure.USART_Mode = USART_Mode_Tx;
    USART_Init(STM32_UART_COM, &USART_InitStructure);

    // UART enable
    USART_Cmd(STM32_UART_COM, ENABLE);

#elif defined(ARM_STM32F10X)
    GPIO_InitTypeDef GPIO_InitStructure;
    USART_InitTypeDef USART_InitStructure;

    // Clock enable vom TX Pin
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE); // UART3 an PB10

    // Clock enable der UART
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3, ENABLE);

    // UART als Alternative-Funktion mit PushPull
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;

    // TX-Pin
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
    GPIO_Init(GPIOB, &GPIO_InitStructure);

    // Oversampling
    USART_OverSampling8Cmd(STM32_UART_COM, ENABLE);

    // init baud rate, 8 data bits, 1 stop bit, no parity, no RTS+CTS
    USART_InitStructure.USART_BaudRate = 115200;
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits = USART_StopBits_1;
    USART_InitStructure.USART_Parity = USART_Parity_No;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_InitStructure.USART_Mode = USART_Mode_Tx;
    USART_Init(STM32_UART_COM, &USART_InitStructure);

    // UART enable
    USART_Cmd(STM32_UART_COM, ENABLE);

#elif defined(ARDUINO)
    // we use the Arduino Serial Imlementation
    // you have to call Serial.begin(SER_BAUD); in Arduino setup() function

#elif defined (__AVR_XMEGA__)

    PMIC.CTRL |= PMIC_HILVLEN_bm;

    USARTC1.BAUDCTRLB = 0;
    USARTC1.BAUDCTRLA = F_CPU / 153600 - 1;
    USARTC1.CTRLA = USART_RXCINTLVL_HI_gc;                                                          // high INT level (receive)
    USARTC1.CTRLB = USART_TXEN_bm | USART_RXEN_bm;                                                  // activated RX and TX
    USARTC1.CTRLC = USART_CHSIZE_8BIT_gc;                                                           // 8 Bit
    PORTC.DIR |= (1<<7);                                                                            // TXD is output
    PORTC.DIR &= ~(1<<6);

#else

#if (IRMP_EXT_LOGGING == 0)                                                                         // use UART
    UART0_UBRRH = UBRRH_VALUE;                                                                      // set baud rate
    UART0_UBRRL = UBRRL_VALUE;

#if USE_2X
    UART0_UCSRA |= (1<<UART0_U2X);
#else
    UART0_UCSRA &= ~(1<<UART0_U2X);
#endif

    UART0_UCSRC = UART0_UCSZ1_BIT_VALUE | UART0_UCSZ0_BIT_VALUE | UART0_URSEL_BIT_VALUE;
    UART0_UCSRB |= UART0_TXEN_BIT_VALUE;                                                            // enable UART TX
#else                                                                                               // other log method
    initextlog();
#endif //IRMP_EXT_LOGGING
#endif //ARM_STM32F4XX
#endif // UNIX_OR_WINDOWS
}

/*---------------------------------------------------------------------------------------------------------------------------------------------------
 *  Send character
 *  @details  Sends character
 *  @param    ch character to be transmitted
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */
void
irmp_uart_putc (unsigned char ch)
{
#ifndef UNIX_OR_WINDOWS
#if defined(ARM_STM32F4XX) || defined(ARM_STM32F10X)
    // warten bis altes Byte gesendet wurde
    while (USART_GetFlagStatus(STM32_UART_COM, USART_FLAG_TXE) == RESET)
    {
        ;
    }

    USART_SendData(STM32_UART_COM, ch);

    if (ch == '\n')
    {
        while (USART_GetFlagStatus(STM32_UART_COM, USART_FLAG_TXE) == RESET);
        USART_SendData(STM32_UART_COM, '\r');
    }

#elif defined(ARDUINO)
    // we use the Arduino Serial Imlementation
    usb_serial_putchar(ch);

#else
#if (IRMP_EXT_LOGGING == 0)

#  if defined (__AVR_XMEGA__)
    while (!(USARTC1.STATUS & USART_DREIF_bm))
    {
        ;
    }

    USARTC1.DATA = ch;

#  else // AVR_MEGA
    while (!(UART0_UCSRA & UART0_UDRE_BIT_VALUE))
    {
        ;
    }

    UART0_UDR = ch;

#  endif // __AVR_XMEGA__

#else

    sendextlog(ch);                                                         // use external log

#endif // IRMP_EXT_LOGGING
#endif // ARM_STM32F4XX
#else
    fputc (ch, stderr);
#endif // UNIX_OR_WINDOWS
}

/*---------------------------------------------------------------------------------------------------------------------------------------------------
 *  Log IR signal
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */

#define STARTCYCLES                       2                                 // min count of zeros before start of logging
#define ENDBITS                        1000                                 // number of sequenced highbits to detect end
#define DATALEN                         700                                 // log buffer size

static void
irmp_log (uint_fast8_t val)
{
    static uint8_t          buf[DATALEN];                                   // logging buffer
    static uint_fast16_t    buf_idx;                                        // index
    static uint_fast8_t     startcycles;                                    // current number of start-zeros
    static uint_fast16_t    cnt;                                            // counts sequenced highbits - to detect end
    static uint_fast8_t     last_val = 1;

    if (! val && (startcycles < STARTCYCLES) && !buf_idx)                   // prevent that single random zeros init logging
    {
        startcycles++;
    }
    else
    {
        startcycles = 0;

        if (! val || buf_idx != 0)                                          // start or continue logging on "0", "1" cannot init logging
        {
            if (last_val == val)
            {
                cnt++;

                if (val && cnt > ENDBITS)                                   // if high received then look at log-stop condition
                {                                                           // if stop condition is true, output on uart
                    uint_fast8_t     i8;
                    uint_fast16_t    i;
                    uint_fast16_t    j;
                    uint_fast8_t     v = '1';
                    uint_fast16_t    d;

                    for (i8 = 0; i8 < STARTCYCLES; i8++)
                    {
                        irmp_uart_putc ('0');                               // the ignored starting zeros
                    }

                    for (i = 0; i < buf_idx; i++)
                    {
                        d = buf[i];

                        if (d == 0xff)
                        {
                            i++;
                            d = buf[i];
                            i++;
                            d |= ((uint_fast16_t) buf[i] << 8);
                        }

                        for (j = 0; j < d; j++)
                        {
                            irmp_uart_putc (v);
                        }

                        v = (v == '1') ? '0' : '1';
                    }

                    for (i8 = 0; i8 < 20; i8++)
                    {
                        irmp_uart_putc ('1');
                    }

                    irmp_uart_putc ('\n');
                    buf_idx = 0;
                    last_val = 1;
                    cnt = 0;
                }
            }
            else if (buf_idx < DATALEN - 3)
            {
                if (cnt >= 0xff)
                {
                    buf[buf_idx++]  = 0xff;
                    buf[buf_idx++]  = (cnt & 0xff);
                    buf[buf_idx]    = (cnt >> 8);
                }
                else
                {
                    buf[buf_idx] = cnt;
                }

                buf_idx++;
                cnt = 1;
                last_val = val;
            }
        }
    }
}

#else
#define irmp_log(val)
#endif //IRMP_LOGGING

typedef struct
{
    uint_fast8_t    protocol;                                                // ir protocol
    uint_fast8_t    pulse_1_len_min;                                         // minimum length of pulse with bit value 1
    uint_fast8_t    pulse_1_len_max;                                         // maximum length of pulse with bit value 1
    uint_fast8_t    pause_1_len_min;                                         // minimum length of pause with bit value 1
    uint_fast8_t    pause_1_len_max;                                         // maximum length of pause with bit value 1
    uint_fast8_t    pulse_0_len_min;                                         // minimum length of pulse with bit value 0
    uint_fast8_t    pulse_0_len_max;                                         // maximum length of pulse with bit value 0
    uint_fast8_t    pause_0_len_min;                                         // minimum length of pause with bit value 0
    uint_fast8_t    pause_0_len_max;                                         // maximum length of pause with bit value 0
    uint_fast8_t    address_offset;                                          // address offset
    uint_fast8_t    address_end;                                             // end of address
    uint_fast8_t    command_offset;                                          // command offset
    uint_fast8_t    command_end;                                             // end of command
    uint_fast8_t    complete_len;                                            // complete length of frame
    uint_fast8_t    stop_bit;                                                // flag: frame has stop bit
    uint_fast8_t    lsb_first;                                               // flag: LSB first
    uint_fast8_t    flags;                                                   // some flags
} IRMP_PARAMETER;

#if IRMP_SUPPORT_SIRCS_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER sircs_param =
{
    IRMP_SIRCS_PROTOCOL,                                                // protocol:        ir protocol
    SIRCS_1_PULSE_LEN_MIN,                                              // pulse_1_len_min: minimum length of pulse with bit value 1
    SIRCS_1_PULSE_LEN_MAX,                                              // pulse_1_len_max: maximum length of pulse with bit value 1
    SIRCS_PAUSE_LEN_MIN,                                                // pause_1_len_min: minimum length of pause with bit value 1
    SIRCS_PAUSE_LEN_MAX,                                                // pause_1_len_max: maximum length of pause with bit value 1
    SIRCS_0_PULSE_LEN_MIN,                                              // pulse_0_len_min: minimum length of pulse with bit value 0
    SIRCS_0_PULSE_LEN_MAX,                                              // pulse_0_len_max: maximum length of pulse with bit value 0
    SIRCS_PAUSE_LEN_MIN,                                                // pause_0_len_min: minimum length of pause with bit value 0
    SIRCS_PAUSE_LEN_MAX,                                                // pause_0_len_max: maximum length of pause with bit value 0
    SIRCS_ADDRESS_OFFSET,                                               // address_offset:  address offset
    SIRCS_ADDRESS_OFFSET + SIRCS_ADDRESS_LEN,                           // address_end:     end of address
    SIRCS_COMMAND_OFFSET,                                               // command_offset:  command offset
    SIRCS_COMMAND_OFFSET + SIRCS_COMMAND_LEN,                           // command_end:     end of command
    SIRCS_COMPLETE_DATA_LEN,                                            // complete_len:    complete length of frame
    SIRCS_STOP_BIT,                                                     // stop_bit:        flag: frame has stop bit
    SIRCS_LSB,                                                          // lsb_first:       flag: LSB first
    SIRCS_FLAGS                                                         // flags:           some flags
};

#endif

#if IRMP_SUPPORT_NEC_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER nec_param =
{
    IRMP_NEC_PROTOCOL,                                                  // protocol:        ir protocol
    NEC_PULSE_LEN_MIN,                                                  // pulse_1_len_min: minimum length of pulse with bit value 1
    NEC_PULSE_LEN_MAX,                                                  // pulse_1_len_max: maximum length of pulse with bit value 1
    NEC_1_PAUSE_LEN_MIN,                                                // pause_1_len_min: minimum length of pause with bit value 1
    NEC_1_PAUSE_LEN_MAX,                                                // pause_1_len_max: maximum length of pause with bit value 1
    NEC_PULSE_LEN_MIN,                                                  // pulse_0_len_min: minimum length of pulse with bit value 0
    NEC_PULSE_LEN_MAX,                                                  // pulse_0_len_max: maximum length of pulse with bit value 0
    NEC_0_PAUSE_LEN_MIN,                                                // pause_0_len_min: minimum length of pause with bit value 0
    NEC_0_PAUSE_LEN_MAX,                                                // pause_0_len_max: maximum length of pause with bit value 0
    NEC_ADDRESS_OFFSET,                                                 // address_offset:  address offset
    NEC_ADDRESS_OFFSET + NEC_ADDRESS_LEN,                               // address_end:     end of address
    NEC_COMMAND_OFFSET,                                                 // command_offset:  command offset
    NEC_COMMAND_OFFSET + NEC_COMMAND_LEN,                               // command_end:     end of command
    NEC_COMPLETE_DATA_LEN,                                              // complete_len:    complete length of frame
    NEC_STOP_BIT,                                                       // stop_bit:        flag: frame has stop bit
    NEC_LSB,                                                            // lsb_first:       flag: LSB first
    NEC_FLAGS                                                           // flags:           some flags
};

static const PROGMEM IRMP_PARAMETER nec_rep_param =
{
    IRMP_NEC_PROTOCOL,                                                  // protocol:        ir protocol
    NEC_PULSE_LEN_MIN,                                                  // pulse_1_len_min: minimum length of pulse with bit value 1
    NEC_PULSE_LEN_MAX,                                                  // pulse_1_len_max: maximum length of pulse with bit value 1
    NEC_1_PAUSE_LEN_MIN,                                                // pause_1_len_min: minimum length of pause with bit value 1
    NEC_1_PAUSE_LEN_MAX,                                                // pause_1_len_max: maximum length of pause with bit value 1
    NEC_PULSE_LEN_MIN,                                                  // pulse_0_len_min: minimum length of pulse with bit value 0
    NEC_PULSE_LEN_MAX,                                                  // pulse_0_len_max: maximum length of pulse with bit value 0
    NEC_0_PAUSE_LEN_MIN,                                                // pause_0_len_min: minimum length of pause with bit value 0
    NEC_0_PAUSE_LEN_MAX,                                                // pause_0_len_max: maximum length of pause with bit value 0
    0,                                                                  // address_offset:  address offset
    0,                                                                  // address_end:     end of address
    0,                                                                  // command_offset:  command offset
    0,                                                                  // command_end:     end of command
    0,                                                                  // complete_len:    complete length of frame
    NEC_STOP_BIT,                                                       // stop_bit:        flag: frame has stop bit
    NEC_LSB,                                                            // lsb_first:       flag: LSB first
    NEC_FLAGS                                                           // flags:           some flags
};

#endif

#if IRMP_SUPPORT_NEC42_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER nec42_param =
{
    IRMP_NEC42_PROTOCOL,                                                // protocol:        ir protocol
    NEC_PULSE_LEN_MIN,                                                  // pulse_1_len_min: minimum length of pulse with bit value 1
    NEC_PULSE_LEN_MAX,                                                  // pulse_1_len_max: maximum length of pulse with bit value 1
    NEC_1_PAUSE_LEN_MIN,                                                // pause_1_len_min: minimum length of pause with bit value 1
    NEC_1_PAUSE_LEN_MAX,                                                // pause_1_len_max: maximum length of pause with bit value 1
    NEC_PULSE_LEN_MIN,                                                  // pulse_0_len_min: minimum length of pulse with bit value 0
    NEC_PULSE_LEN_MAX,                                                  // pulse_0_len_max: maximum length of pulse with bit value 0
    NEC_0_PAUSE_LEN_MIN,                                                // pause_0_len_min: minimum length of pause with bit value 0
    NEC_0_PAUSE_LEN_MAX,                                                // pause_0_len_max: maximum length of pause with bit value 0
    NEC42_ADDRESS_OFFSET,                                               // address_offset:  address offset
    NEC42_ADDRESS_OFFSET + NEC42_ADDRESS_LEN,                           // address_end:     end of address
    NEC42_COMMAND_OFFSET,                                               // command_offset:  command offset
    NEC42_COMMAND_OFFSET + NEC42_COMMAND_LEN,                           // command_end:     end of command
    NEC42_COMPLETE_DATA_LEN,                                            // complete_len:    complete length of frame
    NEC_STOP_BIT,                                                       // stop_bit:        flag: frame has stop bit
    NEC_LSB,                                                            // lsb_first:       flag: LSB first
    NEC_FLAGS                                                           // flags:           some flags
};

#endif

#if IRMP_SUPPORT_LGAIR_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER lgair_param =
{
    IRMP_LGAIR_PROTOCOL,                                                // protocol:        ir protocol
    NEC_PULSE_LEN_MIN,                                                  // pulse_1_len_min: minimum length of pulse with bit value 1
    NEC_PULSE_LEN_MAX,                                                  // pulse_1_len_max: maximum length of pulse with bit value 1
    NEC_1_PAUSE_LEN_MIN,                                                // pause_1_len_min: minimum length of pause with bit value 1
    NEC_1_PAUSE_LEN_MAX,                                                // pause_1_len_max: maximum length of pause with bit value 1
    NEC_PULSE_LEN_MIN,                                                  // pulse_0_len_min: minimum length of pulse with bit value 0
    NEC_PULSE_LEN_MAX,                                                  // pulse_0_len_max: maximum length of pulse with bit value 0
    NEC_0_PAUSE_LEN_MIN,                                                // pause_0_len_min: minimum length of pause with bit value 0
    NEC_0_PAUSE_LEN_MAX,                                                // pause_0_len_max: maximum length of pause with bit value 0
    LGAIR_ADDRESS_OFFSET,                                               // address_offset:  address offset
    LGAIR_ADDRESS_OFFSET + LGAIR_ADDRESS_LEN,                           // address_end:     end of address
    LGAIR_COMMAND_OFFSET,                                               // command_offset:  command offset
    LGAIR_COMMAND_OFFSET + LGAIR_COMMAND_LEN,                           // command_end:     end of command
    LGAIR_COMPLETE_DATA_LEN,                                            // complete_len:    complete length of frame
    NEC_STOP_BIT,                                                       // stop_bit:        flag: frame has stop bit
    NEC_LSB,                                                            // lsb_first:       flag: LSB first
    NEC_FLAGS                                                           // flags:           some flags
};

#endif

#if IRMP_SUPPORT_SAMSUNG_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER samsung_param =
{
    IRMP_SAMSUNG_PROTOCOL,                                              // protocol:        ir protocol
    SAMSUNG_PULSE_LEN_MIN,                                              // pulse_1_len_min: minimum length of pulse with bit value 1
    SAMSUNG_PULSE_LEN_MAX,                                              // pulse_1_len_max: maximum length of pulse with bit value 1
    SAMSUNG_1_PAUSE_LEN_MIN,                                            // pause_1_len_min: minimum length of pause with bit value 1
    SAMSUNG_1_PAUSE_LEN_MAX,                                            // pause_1_len_max: maximum length of pause with bit value 1
    SAMSUNG_PULSE_LEN_MIN,                                              // pulse_0_len_min: minimum length of pulse with bit value 0
    SAMSUNG_PULSE_LEN_MAX,                                              // pulse_0_len_max: maximum length of pulse with bit value 0
    SAMSUNG_0_PAUSE_LEN_MIN,                                            // pause_0_len_min: minimum length of pause with bit value 0
    SAMSUNG_0_PAUSE_LEN_MAX,                                            // pause_0_len_max: maximum length of pause with bit value 0
    SAMSUNG_ADDRESS_OFFSET,                                             // address_offset:  address offset
    SAMSUNG_ADDRESS_OFFSET + SAMSUNG_ADDRESS_LEN,                       // address_end:     end of address
    SAMSUNG_COMMAND_OFFSET,                                             // command_offset:  command offset
    SAMSUNG_COMMAND_OFFSET + SAMSUNG_COMMAND_LEN,                       // command_end:     end of command
    SAMSUNG_COMPLETE_DATA_LEN,                                          // complete_len:    complete length of frame
    SAMSUNG_STOP_BIT,                                                   // stop_bit:        flag: frame has stop bit
    SAMSUNG_LSB,                                                        // lsb_first:       flag: LSB first
    SAMSUNG_FLAGS                                                       // flags:           some flags
};

#endif

#if IRMP_SUPPORT_SAMSUNGAH_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER samsungah_param =
{
    IRMP_SAMSUNGAH_PROTOCOL,                                            // protocol:        ir protocol
    SAMSUNGAH_PULSE_LEN_MIN,                                            // pulse_1_len_min: minimum length of pulse with bit value 1
    SAMSUNGAH_PULSE_LEN_MAX,                                            // pulse_1_len_max: maximum length of pulse with bit value 1
    SAMSUNGAH_1_PAUSE_LEN_MIN,                                          // pause_1_len_min: minimum length of pause with bit value 1
    SAMSUNGAH_1_PAUSE_LEN_MAX,                                          // pause_1_len_max: maximum length of pause with bit value 1
    SAMSUNGAH_PULSE_LEN_MIN,                                            // pulse_0_len_min: minimum length of pulse with bit value 0
    SAMSUNGAH_PULSE_LEN_MAX,                                            // pulse_0_len_max: maximum length of pulse with bit value 0
    SAMSUNGAH_0_PAUSE_LEN_MIN,                                          // pause_0_len_min: minimum length of pause with bit value 0
    SAMSUNGAH_0_PAUSE_LEN_MAX,                                          // pause_0_len_max: maximum length of pause with bit value 0
    SAMSUNGAH_ADDRESS_OFFSET,                                           // address_offset:  address offset
    SAMSUNGAH_ADDRESS_OFFSET + SAMSUNGAH_ADDRESS_LEN,                   // address_end:     end of address
    SAMSUNGAH_COMMAND_OFFSET,                                           // command_offset:  command offset
    SAMSUNGAH_COMMAND_OFFSET + SAMSUNGAH_COMMAND_LEN,                   // command_end:     end of command
    SAMSUNGAH_COMPLETE_DATA_LEN,                                        // complete_len:    complete length of frame
    SAMSUNGAH_STOP_BIT,                                                 // stop_bit:        flag: frame has stop bit
    SAMSUNGAH_LSB,                                                      // lsb_first:       flag: LSB first
    SAMSUNGAH_FLAGS                                                     // flags:           some flags
};

#endif

#if IRMP_SUPPORT_TELEFUNKEN_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER telefunken_param =
{
    IRMP_TELEFUNKEN_PROTOCOL,                                           // protocol:        ir protocol
    TELEFUNKEN_PULSE_LEN_MIN,                                           // pulse_1_len_min: minimum length of pulse with bit value 1
    TELEFUNKEN_PULSE_LEN_MAX,                                           // pulse_1_len_max: maximum length of pulse with bit value 1
    TELEFUNKEN_1_PAUSE_LEN_MIN,                                         // pause_1_len_min: minimum length of pause with bit value 1
    TELEFUNKEN_1_PAUSE_LEN_MAX,                                         // pause_1_len_max: maximum length of pause with bit value 1
    TELEFUNKEN_PULSE_LEN_MIN,                                           // pulse_0_len_min: minimum length of pulse with bit value 0
    TELEFUNKEN_PULSE_LEN_MAX,                                           // pulse_0_len_max: maximum length of pulse with bit value 0
    TELEFUNKEN_0_PAUSE_LEN_MIN,                                         // pause_0_len_min: minimum length of pause with bit value 0
    TELEFUNKEN_0_PAUSE_LEN_MAX,                                         // pause_0_len_max: maximum length of pause with bit value 0
    TELEFUNKEN_ADDRESS_OFFSET,                                          // address_offset:  address offset
    TELEFUNKEN_ADDRESS_OFFSET + TELEFUNKEN_ADDRESS_LEN,                 // address_end:     end of address
    TELEFUNKEN_COMMAND_OFFSET,                                          // command_offset:  command offset
    TELEFUNKEN_COMMAND_OFFSET + TELEFUNKEN_COMMAND_LEN,                 // command_end:     end of command
    TELEFUNKEN_COMPLETE_DATA_LEN,                                       // complete_len:    complete length of frame
    TELEFUNKEN_STOP_BIT,                                                // stop_bit:        flag: frame has stop bit
    TELEFUNKEN_LSB,                                                     // lsb_first:       flag: LSB first
    TELEFUNKEN_FLAGS                                                    // flags:           some flags
};

#endif

#if IRMP_SUPPORT_MATSUSHITA_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER matsushita_param =
{
    IRMP_MATSUSHITA_PROTOCOL,                                           // protocol:        ir protocol
    MATSUSHITA_PULSE_LEN_MIN,                                           // pulse_1_len_min: minimum length of pulse with bit value 1
    MATSUSHITA_PULSE_LEN_MAX,                                           // pulse_1_len_max: maximum length of pulse with bit value 1
    MATSUSHITA_1_PAUSE_LEN_MIN,                                         // pause_1_len_min: minimum length of pause with bit value 1
    MATSUSHITA_1_PAUSE_LEN_MAX,                                         // pause_1_len_max: maximum length of pause with bit value 1
    MATSUSHITA_PULSE_LEN_MIN,                                           // pulse_0_len_min: minimum length of pulse with bit value 0
    MATSUSHITA_PULSE_LEN_MAX,                                           // pulse_0_len_max: maximum length of pulse with bit value 0
    MATSUSHITA_0_PAUSE_LEN_MIN,                                         // pause_0_len_min: minimum length of pause with bit value 0
    MATSUSHITA_0_PAUSE_LEN_MAX,                                         // pause_0_len_max: maximum length of pause with bit value 0
    MATSUSHITA_ADDRESS_OFFSET,                                          // address_offset:  address offset
    MATSUSHITA_ADDRESS_OFFSET + MATSUSHITA_ADDRESS_LEN,                 // address_end:     end of address
    MATSUSHITA_COMMAND_OFFSET,                                          // command_offset:  command offset
    MATSUSHITA_COMMAND_OFFSET + MATSUSHITA_COMMAND_LEN,                 // command_end:     end of command
    MATSUSHITA_COMPLETE_DATA_LEN,                                       // complete_len:    complete length of frame
    MATSUSHITA_STOP_BIT,                                                // stop_bit:        flag: frame has stop bit
    MATSUSHITA_LSB,                                                     // lsb_first:       flag: LSB first
    MATSUSHITA_FLAGS                                                    // flags:           some flags
};

#endif

#if IRMP_SUPPORT_KASEIKYO_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER kaseikyo_param =
{
    IRMP_KASEIKYO_PROTOCOL,                                             // protocol:        ir protocol
    KASEIKYO_PULSE_LEN_MIN,                                             // pulse_1_len_min: minimum length of pulse with bit value 1
    KASEIKYO_PULSE_LEN_MAX,                                             // pulse_1_len_max: maximum length of pulse with bit value 1
    KASEIKYO_1_PAUSE_LEN_MIN,                                           // pause_1_len_min: minimum length of pause with bit value 1
    KASEIKYO_1_PAUSE_LEN_MAX,                                           // pause_1_len_max: maximum length of pause with bit value 1
    KASEIKYO_PULSE_LEN_MIN,                                             // pulse_0_len_min: minimum length of pulse with bit value 0
    KASEIKYO_PULSE_LEN_MAX,                                             // pulse_0_len_max: maximum length of pulse with bit value 0
    KASEIKYO_0_PAUSE_LEN_MIN,                                           // pause_0_len_min: minimum length of pause with bit value 0
    KASEIKYO_0_PAUSE_LEN_MAX,                                           // pause_0_len_max: maximum length of pause with bit value 0
    KASEIKYO_ADDRESS_OFFSET,                                            // address_offset:  address offset
    KASEIKYO_ADDRESS_OFFSET + KASEIKYO_ADDRESS_LEN,                     // address_end:     end of address
    KASEIKYO_COMMAND_OFFSET,                                            // command_offset:  command offset
    KASEIKYO_COMMAND_OFFSET + KASEIKYO_COMMAND_LEN,                     // command_end:     end of command
    KASEIKYO_COMPLETE_DATA_LEN,                                         // complete_len:    complete length of frame
    KASEIKYO_STOP_BIT,                                                  // stop_bit:        flag: frame has stop bit
    KASEIKYO_LSB,                                                       // lsb_first:       flag: LSB first
    KASEIKYO_FLAGS                                                      // flags:           some flags
};

#endif

#if IRMP_SUPPORT_PANASONIC_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER panasonic_param =
{
    IRMP_PANASONIC_PROTOCOL,                                            // protocol:        ir protocol
    PANASONIC_PULSE_LEN_MIN,                                            // pulse_1_len_min: minimum length of pulse with bit value 1
    PANASONIC_PULSE_LEN_MAX,                                            // pulse_1_len_max: maximum length of pulse with bit value 1
    PANASONIC_1_PAUSE_LEN_MIN,                                          // pause_1_len_min: minimum length of pause with bit value 1
    PANASONIC_1_PAUSE_LEN_MAX,                                          // pause_1_len_max: maximum length of pause with bit value 1
    PANASONIC_PULSE_LEN_MIN,                                            // pulse_0_len_min: minimum length of pulse with bit value 0
    PANASONIC_PULSE_LEN_MAX,                                            // pulse_0_len_max: maximum length of pulse with bit value 0
    PANASONIC_0_PAUSE_LEN_MIN,                                          // pause_0_len_min: minimum length of pause with bit value 0
    PANASONIC_0_PAUSE_LEN_MAX,                                          // pause_0_len_max: maximum length of pause with bit value 0
    PANASONIC_ADDRESS_OFFSET,                                           // address_offset:  address offset
    PANASONIC_ADDRESS_OFFSET + PANASONIC_ADDRESS_LEN,                   // address_end:     end of address
    PANASONIC_COMMAND_OFFSET,                                           // command_offset:  command offset
    PANASONIC_COMMAND_OFFSET + PANASONIC_COMMAND_LEN,                   // command_end:     end of command
    PANASONIC_COMPLETE_DATA_LEN,                                        // complete_len:    complete length of frame
    PANASONIC_STOP_BIT,                                                 // stop_bit:        flag: frame has stop bit
    PANASONIC_LSB,                                                      // lsb_first:       flag: LSB first
    PANASONIC_FLAGS                                                     // flags:           some flags
};

#endif

#if IRMP_SUPPORT_MITSU_HEAVY_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER mitsu_heavy_param =
{
    IRMP_MITSU_HEAVY_PROTOCOL,                                          // protocol:        ir protocol
    MITSU_HEAVY_PULSE_LEN_MIN,                                          // pulse_1_len_min: minimum length of pulse with bit value 1
    MITSU_HEAVY_PULSE_LEN_MAX,                                          // pulse_1_len_max: maximum length of pulse with bit value 1
    MITSU_HEAVY_1_PAUSE_LEN_MIN,                                        // pause_1_len_min: minimum length of pause with bit value 1
    MITSU_HEAVY_1_PAUSE_LEN_MAX,                                        // pause_1_len_max: maximum length of pause with bit value 1
    MITSU_HEAVY_PULSE_LEN_MIN,                                          // pulse_0_len_min: minimum length of pulse with bit value 0
    MITSU_HEAVY_PULSE_LEN_MAX,                                          // pulse_0_len_max: maximum length of pulse with bit value 0
    MITSU_HEAVY_0_PAUSE_LEN_MIN,                                        // pause_0_len_min: minimum length of pause with bit value 0
    MITSU_HEAVY_0_PAUSE_LEN_MAX,                                        // pause_0_len_max: maximum length of pause with bit value 0
    MITSU_HEAVY_ADDRESS_OFFSET,                                         // address_offset:  address offset
    MITSU_HEAVY_ADDRESS_OFFSET + MITSU_HEAVY_ADDRESS_LEN,               // address_end:     end of address
    MITSU_HEAVY_COMMAND_OFFSET,                                         // command_offset:  command offset
    MITSU_HEAVY_COMMAND_OFFSET + MITSU_HEAVY_COMMAND_LEN,               // command_end:     end of command
    MITSU_HEAVY_COMPLETE_DATA_LEN,                                      // complete_len:    complete length of frame
    MITSU_HEAVY_STOP_BIT,                                               // stop_bit:        flag: frame has stop bit
    MITSU_HEAVY_LSB,                                                    // lsb_first:       flag: LSB first
    MITSU_HEAVY_FLAGS                                                   // flags:           some flags
};

#endif

#if IRMP_SUPPORT_VINCENT_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER vincent_param =
{
    IRMP_VINCENT_PROTOCOL,                                              // protocol:        ir protocol
    VINCENT_PULSE_LEN_MIN,                                              // pulse_1_len_min: minimum length of pulse with bit value 1
    VINCENT_PULSE_LEN_MAX,                                              // pulse_1_len_max: maximum length of pulse with bit value 1
    VINCENT_1_PAUSE_LEN_MIN,                                            // pause_1_len_min: minimum length of pause with bit value 1
    VINCENT_1_PAUSE_LEN_MAX,                                            // pause_1_len_max: maximum length of pause with bit value 1
    VINCENT_PULSE_LEN_MIN,                                              // pulse_0_len_min: minimum length of pulse with bit value 0
    VINCENT_PULSE_LEN_MAX,                                              // pulse_0_len_max: maximum length of pulse with bit value 0
    VINCENT_0_PAUSE_LEN_MIN,                                            // pause_0_len_min: minimum length of pause with bit value 0
    VINCENT_0_PAUSE_LEN_MAX,                                            // pause_0_len_max: maximum length of pause with bit value 0
    VINCENT_ADDRESS_OFFSET,                                             // address_offset:  address offset
    VINCENT_ADDRESS_OFFSET + VINCENT_ADDRESS_LEN,                       // address_end:     end of address
    VINCENT_COMMAND_OFFSET,                                             // command_offset:  command offset
    VINCENT_COMMAND_OFFSET + VINCENT_COMMAND_LEN,                       // command_end:     end of command
    VINCENT_COMPLETE_DATA_LEN,                                          // complete_len:    complete length of frame
    VINCENT_STOP_BIT,                                                   // stop_bit:        flag: frame has stop bit
    VINCENT_LSB,                                                        // lsb_first:       flag: LSB first
    VINCENT_FLAGS                                                       // flags:           some flags
};

#endif

#if IRMP_SUPPORT_RECS80_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER recs80_param =
{
    IRMP_RECS80_PROTOCOL,                                               // protocol:        ir protocol
    RECS80_PULSE_LEN_MIN,                                               // pulse_1_len_min: minimum length of pulse with bit value 1
    RECS80_PULSE_LEN_MAX,                                               // pulse_1_len_max: maximum length of pulse with bit value 1
    RECS80_1_PAUSE_LEN_MIN,                                             // pause_1_len_min: minimum length of pause with bit value 1
    RECS80_1_PAUSE_LEN_MAX,                                             // pause_1_len_max: maximum length of pause with bit value 1
    RECS80_PULSE_LEN_MIN,                                               // pulse_0_len_min: minimum length of pulse with bit value 0
    RECS80_PULSE_LEN_MAX,                                               // pulse_0_len_max: maximum length of pulse with bit value 0
    RECS80_0_PAUSE_LEN_MIN,                                             // pause_0_len_min: minimum length of pause with bit value 0
    RECS80_0_PAUSE_LEN_MAX,                                             // pause_0_len_max: maximum length of pause with bit value 0
    RECS80_ADDRESS_OFFSET,                                              // address_offset:  address offset
    RECS80_ADDRESS_OFFSET + RECS80_ADDRESS_LEN,                         // address_end:     end of address
    RECS80_COMMAND_OFFSET,                                              // command_offset:  command offset
    RECS80_COMMAND_OFFSET + RECS80_COMMAND_LEN,                         // command_end:     end of command
    RECS80_COMPLETE_DATA_LEN,                                           // complete_len:    complete length of frame
    RECS80_STOP_BIT,                                                    // stop_bit:        flag: frame has stop bit
    RECS80_LSB,                                                         // lsb_first:       flag: LSB first
    RECS80_FLAGS                                                        // flags:           some flags
};

#endif

#if IRMP_SUPPORT_RC5_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER rc5_param =
{
    IRMP_RC5_PROTOCOL,                                                  // protocol:        ir protocol
    RC5_BIT_LEN_MIN,                                                    // pulse_1_len_min: here: minimum length of short pulse
    RC5_BIT_LEN_MAX,                                                    // pulse_1_len_max: here: maximum length of short pulse
    RC5_BIT_LEN_MIN,                                                    // pause_1_len_min: here: minimum length of short pause
    RC5_BIT_LEN_MAX,                                                    // pause_1_len_max: here: maximum length of short pause
    0,                                                                  // pulse_0_len_min: here: not used
    0,                                                                  // pulse_0_len_max: here: not used
    0,                                                                  // pause_0_len_min: here: not used
    0,                                                                  // pause_0_len_max: here: not used
    RC5_ADDRESS_OFFSET,                                                 // address_offset:  address offset
    RC5_ADDRESS_OFFSET + RC5_ADDRESS_LEN,                               // address_end:     end of address
    RC5_COMMAND_OFFSET,                                                 // command_offset:  command offset
    RC5_COMMAND_OFFSET + RC5_COMMAND_LEN,                               // command_end:     end of command
    RC5_COMPLETE_DATA_LEN,                                              // complete_len:    complete length of frame
    RC5_STOP_BIT,                                                       // stop_bit:        flag: frame has stop bit
    RC5_LSB,                                                            // lsb_first:       flag: LSB first
    RC5_FLAGS                                                           // flags:           some flags
};

#endif

#if IRMP_SUPPORT_S100_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER s100_param =
{
    IRMP_S100_PROTOCOL,                                                 // protocol:        ir protocol
    S100_BIT_LEN_MIN,                                                   // pulse_1_len_min: here: minimum length of short pulse
    S100_BIT_LEN_MAX,                                                   // pulse_1_len_max: here: maximum length of short pulse
    S100_BIT_LEN_MIN,                                                   // pause_1_len_min: here: minimum length of short pause
    S100_BIT_LEN_MAX,                                                   // pause_1_len_max: here: maximum length of short pause
    0,                                                                  // pulse_0_len_min: here: not used
    0,                                                                  // pulse_0_len_max: here: not used
    0,                                                                  // pause_0_len_min: here: not used
    0,                                                                  // pause_0_len_max: here: not used
    S100_ADDRESS_OFFSET,                                                // address_offset:  address offset
    S100_ADDRESS_OFFSET + S100_ADDRESS_LEN,                             // address_end:     end of address
    S100_COMMAND_OFFSET,                                                // command_offset:  command offset
    S100_COMMAND_OFFSET + S100_COMMAND_LEN,                             // command_end:     end of command
    S100_COMPLETE_DATA_LEN,                                             // complete_len:    complete length of frame
    S100_STOP_BIT,                                                      // stop_bit:        flag: frame has stop bit
    S100_LSB,                                                           // lsb_first:       flag: LSB first
    S100_FLAGS                                                          // flags:           some flags
};

#endif

#if IRMP_SUPPORT_DENON_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER denon_param =
{
    IRMP_DENON_PROTOCOL,                                                // protocol:        ir protocol
    DENON_PULSE_LEN_MIN,                                                // pulse_1_len_min: minimum length of pulse with bit value 1
    DENON_PULSE_LEN_MAX,                                                // pulse_1_len_max: maximum length of pulse with bit value 1
    DENON_1_PAUSE_LEN_MIN,                                              // pause_1_len_min: minimum length of pause with bit value 1
    DENON_1_PAUSE_LEN_MAX,                                              // pause_1_len_max: maximum length of pause with bit value 1
    DENON_PULSE_LEN_MIN,                                                // pulse_0_len_min: minimum length of pulse with bit value 0
    DENON_PULSE_LEN_MAX,                                                // pulse_0_len_max: maximum length of pulse with bit value 0
    DENON_0_PAUSE_LEN_MIN,                                              // pause_0_len_min: minimum length of pause with bit value 0
    DENON_0_PAUSE_LEN_MAX,                                              // pause_0_len_max: maximum length of pause with bit value 0
    DENON_ADDRESS_OFFSET,                                               // address_offset:  address offset
    DENON_ADDRESS_OFFSET + DENON_ADDRESS_LEN,                           // address_end:     end of address
    DENON_COMMAND_OFFSET,                                               // command_offset:  command offset
    DENON_COMMAND_OFFSET + DENON_COMMAND_LEN,                           // command_end:     end of command
    DENON_COMPLETE_DATA_LEN,                                            // complete_len:    complete length of frame
    DENON_STOP_BIT,                                                     // stop_bit:        flag: frame has stop bit
    DENON_LSB,                                                          // lsb_first:       flag: LSB first
    DENON_FLAGS                                                         // flags:           some flags
};

#endif

#if IRMP_SUPPORT_RC6_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER rc6_param =
{
    IRMP_RC6_PROTOCOL,                                                  // protocol:        ir protocol

    RC6_BIT_PULSE_LEN_MIN,                                              // pulse_1_len_min: here: minimum length of short pulse
    RC6_BIT_PULSE_LEN_MAX,                                              // pulse_1_len_max: here: maximum length of short pulse
    RC6_BIT_PAUSE_LEN_MIN,                                              // pause_1_len_min: here: minimum length of short pause
    RC6_BIT_PAUSE_LEN_MAX,                                              // pause_1_len_max: here: maximum length of short pause
    0,                                                                  // pulse_0_len_min: here: not used
    0,                                                                  // pulse_0_len_max: here: not used
    0,                                                                  // pause_0_len_min: here: not used
    0,                                                                  // pause_0_len_max: here: not used
    RC6_ADDRESS_OFFSET,                                                 // address_offset:  address offset
    RC6_ADDRESS_OFFSET + RC6_ADDRESS_LEN,                               // address_end:     end of address
    RC6_COMMAND_OFFSET,                                                 // command_offset:  command offset
    RC6_COMMAND_OFFSET + RC6_COMMAND_LEN,                               // command_end:     end of command
    RC6_COMPLETE_DATA_LEN_SHORT,                                        // complete_len:    complete length of frame
    RC6_STOP_BIT,                                                       // stop_bit:        flag: frame has stop bit
    RC6_LSB,                                                            // lsb_first:       flag: LSB first
    RC6_FLAGS                                                           // flags:           some flags
};

#endif

#if IRMP_SUPPORT_RECS80EXT_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER recs80ext_param =
{
    IRMP_RECS80EXT_PROTOCOL,                                            // protocol:        ir protocol
    RECS80EXT_PULSE_LEN_MIN,                                            // pulse_1_len_min: minimum length of pulse with bit value 1
    RECS80EXT_PULSE_LEN_MAX,                                            // pulse_1_len_max: maximum length of pulse with bit value 1
    RECS80EXT_1_PAUSE_LEN_MIN,                                          // pause_1_len_min: minimum length of pause with bit value 1
    RECS80EXT_1_PAUSE_LEN_MAX,                                          // pause_1_len_max: maximum length of pause with bit value 1
    RECS80EXT_PULSE_LEN_MIN,                                            // pulse_0_len_min: minimum length of pulse with bit value 0
    RECS80EXT_PULSE_LEN_MAX,                                            // pulse_0_len_max: maximum length of pulse with bit value 0
    RECS80EXT_0_PAUSE_LEN_MIN,                                          // pause_0_len_min: minimum length of pause with bit value 0
    RECS80EXT_0_PAUSE_LEN_MAX,                                          // pause_0_len_max: maximum length of pause with bit value 0
    RECS80EXT_ADDRESS_OFFSET,                                           // address_offset:  address offset
    RECS80EXT_ADDRESS_OFFSET + RECS80EXT_ADDRESS_LEN,                   // address_end:     end of address
    RECS80EXT_COMMAND_OFFSET,                                           // command_offset:  command offset
    RECS80EXT_COMMAND_OFFSET + RECS80EXT_COMMAND_LEN,                   // command_end:     end of command
    RECS80EXT_COMPLETE_DATA_LEN,                                        // complete_len:    complete length of frame
    RECS80EXT_STOP_BIT,                                                 // stop_bit:        flag: frame has stop bit
    RECS80EXT_LSB,                                                      // lsb_first:       flag: LSB first
    RECS80EXT_FLAGS                                                     // flags:           some flags
};

#endif

#if IRMP_SUPPORT_NUBERT_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER nubert_param =
{
    IRMP_NUBERT_PROTOCOL,                                               // protocol:        ir protocol
    NUBERT_1_PULSE_LEN_MIN,                                             // pulse_1_len_min: minimum length of pulse with bit value 1
    NUBERT_1_PULSE_LEN_MAX,                                             // pulse_1_len_max: maximum length of pulse with bit value 1
    NUBERT_1_PAUSE_LEN_MIN,                                             // pause_1_len_min: minimum length of pause with bit value 1
    NUBERT_1_PAUSE_LEN_MAX,                                             // pause_1_len_max: maximum length of pause with bit value 1
    NUBERT_0_PULSE_LEN_MIN,                                             // pulse_0_len_min: minimum length of pulse with bit value 0
    NUBERT_0_PULSE_LEN_MAX,                                             // pulse_0_len_max: maximum length of pulse with bit value 0
    NUBERT_0_PAUSE_LEN_MIN,                                             // pause_0_len_min: minimum length of pause with bit value 0
    NUBERT_0_PAUSE_LEN_MAX,                                             // pause_0_len_max: maximum length of pause with bit value 0
    NUBERT_ADDRESS_OFFSET,                                              // address_offset:  address offset
    NUBERT_ADDRESS_OFFSET + NUBERT_ADDRESS_LEN,                         // address_end:     end of address
    NUBERT_COMMAND_OFFSET,                                              // command_offset:  command offset
    NUBERT_COMMAND_OFFSET + NUBERT_COMMAND_LEN,                         // command_end:     end of command
    NUBERT_COMPLETE_DATA_LEN,                                           // complete_len:    complete length of frame
    NUBERT_STOP_BIT,                                                    // stop_bit:        flag: frame has stop bit
    NUBERT_LSB,                                                         // lsb_first:       flag: LSB first
    NUBERT_FLAGS                                                        // flags:           some flags
};

#endif

#if IRMP_SUPPORT_FAN_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER fan_param =
{
    IRMP_FAN_PROTOCOL,                                                  // protocol:        ir protocol
    FAN_1_PULSE_LEN_MIN,                                                // pulse_1_len_min: minimum length of pulse with bit value 1
    FAN_1_PULSE_LEN_MAX,                                                // pulse_1_len_max: maximum length of pulse with bit value 1
    FAN_1_PAUSE_LEN_MIN,                                                // pause_1_len_min: minimum length of pause with bit value 1
    FAN_1_PAUSE_LEN_MAX,                                                // pause_1_len_max: maximum length of pause with bit value 1
    FAN_0_PULSE_LEN_MIN,                                                // pulse_0_len_min: minimum length of pulse with bit value 0
    FAN_0_PULSE_LEN_MAX,                                                // pulse_0_len_max: maximum length of pulse with bit value 0
    FAN_0_PAUSE_LEN_MIN,                                                // pause_0_len_min: minimum length of pause with bit value 0
    FAN_0_PAUSE_LEN_MAX,                                                // pause_0_len_max: maximum length of pause with bit value 0
    FAN_ADDRESS_OFFSET,                                                 // address_offset:  address offset
    FAN_ADDRESS_OFFSET + FAN_ADDRESS_LEN,                               // address_end:     end of address
    FAN_COMMAND_OFFSET,                                                 // command_offset:  command offset
    FAN_COMMAND_OFFSET + FAN_COMMAND_LEN,                               // command_end:     end of command
    FAN_COMPLETE_DATA_LEN,                                              // complete_len:    complete length of frame
    FAN_STOP_BIT,                                                       // stop_bit:        flag: frame has NO stop bit
    FAN_LSB,                                                            // lsb_first:       flag: LSB first
    FAN_FLAGS                                                           // flags:           some flags
};

#endif

#if IRMP_SUPPORT_SPEAKER_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER speaker_param =
{
    IRMP_SPEAKER_PROTOCOL,                                              // protocol:        ir protocol
    SPEAKER_1_PULSE_LEN_MIN,                                            // pulse_1_len_min: minimum length of pulse with bit value 1
    SPEAKER_1_PULSE_LEN_MAX,                                            // pulse_1_len_max: maximum length of pulse with bit value 1
    SPEAKER_1_PAUSE_LEN_MIN,                                            // pause_1_len_min: minimum length of pause with bit value 1
    SPEAKER_1_PAUSE_LEN_MAX,                                            // pause_1_len_max: maximum length of pause with bit value 1
    SPEAKER_0_PULSE_LEN_MIN,                                            // pulse_0_len_min: minimum length of pulse with bit value 0
    SPEAKER_0_PULSE_LEN_MAX,                                            // pulse_0_len_max: maximum length of pulse with bit value 0
    SPEAKER_0_PAUSE_LEN_MIN,                                            // pause_0_len_min: minimum length of pause with bit value 0
    SPEAKER_0_PAUSE_LEN_MAX,                                            // pause_0_len_max: maximum length of pause with bit value 0
    SPEAKER_ADDRESS_OFFSET,                                             // address_offset:  address offset
    SPEAKER_ADDRESS_OFFSET + SPEAKER_ADDRESS_LEN,                       // address_end:     end of address
    SPEAKER_COMMAND_OFFSET,                                             // command_offset:  command offset
    SPEAKER_COMMAND_OFFSET + SPEAKER_COMMAND_LEN,                       // command_end:     end of command
    SPEAKER_COMPLETE_DATA_LEN,                                          // complete_len:    complete length of frame
    SPEAKER_STOP_BIT,                                                   // stop_bit:        flag: frame has stop bit
    SPEAKER_LSB,                                                        // lsb_first:       flag: LSB first
    SPEAKER_FLAGS                                                       // flags:           some flags
};

#endif

#if IRMP_SUPPORT_BANG_OLUFSEN_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER bang_olufsen_param =
{
    IRMP_BANG_OLUFSEN_PROTOCOL,                                         // protocol:        ir protocol
    BANG_OLUFSEN_PULSE_LEN_MIN,                                         // pulse_1_len_min: minimum length of pulse with bit value 1
    BANG_OLUFSEN_PULSE_LEN_MAX,                                         // pulse_1_len_max: maximum length of pulse with bit value 1
    BANG_OLUFSEN_1_PAUSE_LEN_MIN,                                       // pause_1_len_min: minimum length of pause with bit value 1
    BANG_OLUFSEN_1_PAUSE_LEN_MAX,                                       // pause_1_len_max: maximum length of pause with bit value 1
    BANG_OLUFSEN_PULSE_LEN_MIN,                                         // pulse_0_len_min: minimum length of pulse with bit value 0
    BANG_OLUFSEN_PULSE_LEN_MAX,                                         // pulse_0_len_max: maximum length of pulse with bit value 0
    BANG_OLUFSEN_0_PAUSE_LEN_MIN,                                       // pause_0_len_min: minimum length of pause with bit value 0
    BANG_OLUFSEN_0_PAUSE_LEN_MAX,                                       // pause_0_len_max: maximum length of pause with bit value 0
    BANG_OLUFSEN_ADDRESS_OFFSET,                                        // address_offset:  address offset
    BANG_OLUFSEN_ADDRESS_OFFSET + BANG_OLUFSEN_ADDRESS_LEN,             // address_end:     end of address
    BANG_OLUFSEN_COMMAND_OFFSET,                                        // command_offset:  command offset
    BANG_OLUFSEN_COMMAND_OFFSET + BANG_OLUFSEN_COMMAND_LEN,             // command_end:     end of command
    BANG_OLUFSEN_COMPLETE_DATA_LEN,                                     // complete_len:    complete length of frame
    BANG_OLUFSEN_STOP_BIT,                                              // stop_bit:        flag: frame has stop bit
    BANG_OLUFSEN_LSB,                                                   // lsb_first:       flag: LSB first
    BANG_OLUFSEN_FLAGS                                                  // flags:           some flags
};

#endif

#if IRMP_SUPPORT_GRUNDIG_NOKIA_IR60_PROTOCOL == 1

static uint_fast8_t first_bit;

static const PROGMEM IRMP_PARAMETER grundig_param =
{
    IRMP_GRUNDIG_PROTOCOL,                                              // protocol:        ir protocol

    GRUNDIG_NOKIA_IR60_BIT_LEN_MIN,                                     // pulse_1_len_min: here: minimum length of short pulse
    GRUNDIG_NOKIA_IR60_BIT_LEN_MAX,                                     // pulse_1_len_max: here: maximum length of short pulse
    GRUNDIG_NOKIA_IR60_BIT_LEN_MIN,                                     // pause_1_len_min: here: minimum length of short pause
    GRUNDIG_NOKIA_IR60_BIT_LEN_MAX,                                     // pause_1_len_max: here: maximum length of short pause
    0,                                                                  // pulse_0_len_min: here: not used
    0,                                                                  // pulse_0_len_max: here: not used
    0,                                                                  // pause_0_len_min: here: not used
    0,                                                                  // pause_0_len_max: here: not used
    GRUNDIG_ADDRESS_OFFSET,                                             // address_offset:  address offset
    GRUNDIG_ADDRESS_OFFSET + GRUNDIG_ADDRESS_LEN,                       // address_end:     end of address
    GRUNDIG_COMMAND_OFFSET,                                             // command_offset:  command offset
    GRUNDIG_COMMAND_OFFSET + GRUNDIG_COMMAND_LEN + 1,                   // command_end:     end of command (USE 1 bit MORE to STORE NOKIA DATA!)
    NOKIA_COMPLETE_DATA_LEN,                                            // complete_len:    complete length of frame, here: NOKIA instead of GRUNDIG!
    GRUNDIG_NOKIA_IR60_STOP_BIT,                                        // stop_bit:        flag: frame has stop bit
    GRUNDIG_NOKIA_IR60_LSB,                                             // lsb_first:       flag: LSB first
    GRUNDIG_NOKIA_IR60_FLAGS                                            // flags:           some flags
};

#endif

#if IRMP_SUPPORT_SIEMENS_OR_RUWIDO_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER ruwido_param =
{
    IRMP_RUWIDO_PROTOCOL,                                               // protocol:        ir protocol
    SIEMENS_OR_RUWIDO_BIT_PULSE_LEN_MIN,                                // pulse_1_len_min: here: minimum length of short pulse
    SIEMENS_OR_RUWIDO_BIT_PULSE_LEN_MAX,                                // pulse_1_len_max: here: maximum length of short pulse
    SIEMENS_OR_RUWIDO_BIT_PAUSE_LEN_MIN,                                // pause_1_len_min: here: minimum length of short pause
    SIEMENS_OR_RUWIDO_BIT_PAUSE_LEN_MAX,                                // pause_1_len_max: here: maximum length of short pause
    0,                                                                  // pulse_0_len_min: here: not used
    0,                                                                  // pulse_0_len_max: here: not used
    0,                                                                  // pause_0_len_min: here: not used
    0,                                                                  // pause_0_len_max: here: not used
    RUWIDO_ADDRESS_OFFSET,                                              // address_offset:  address offset
    RUWIDO_ADDRESS_OFFSET + RUWIDO_ADDRESS_LEN,                         // address_end:     end of address
    RUWIDO_COMMAND_OFFSET,                                              // command_offset:  command offset
    RUWIDO_COMMAND_OFFSET + RUWIDO_COMMAND_LEN,                         // command_end:     end of command
    SIEMENS_COMPLETE_DATA_LEN,                                          // complete_len:    complete length of frame, here: SIEMENS instead of RUWIDO!
    SIEMENS_OR_RUWIDO_STOP_BIT,                                         // stop_bit:        flag: frame has stop bit
    SIEMENS_OR_RUWIDO_LSB,                                              // lsb_first:       flag: LSB first
    SIEMENS_OR_RUWIDO_FLAGS                                             // flags:           some flags
};

#endif

#if IRMP_SUPPORT_FDC_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER fdc_param =
{
    IRMP_FDC_PROTOCOL,                                                  // protocol:        ir protocol
    FDC_PULSE_LEN_MIN,                                                  // pulse_1_len_min: minimum length of pulse with bit value 1
    FDC_PULSE_LEN_MAX,                                                  // pulse_1_len_max: maximum length of pulse with bit value 1
    FDC_1_PAUSE_LEN_MIN,                                                // pause_1_len_min: minimum length of pause with bit value 1
    FDC_1_PAUSE_LEN_MAX,                                                // pause_1_len_max: maximum length of pause with bit value 1
    FDC_PULSE_LEN_MIN,                                                  // pulse_0_len_min: minimum length of pulse with bit value 0
    FDC_PULSE_LEN_MAX,                                                  // pulse_0_len_max: maximum length of pulse with bit value 0
    FDC_0_PAUSE_LEN_MIN,                                                // pause_0_len_min: minimum length of pause with bit value 0
    FDC_0_PAUSE_LEN_MAX,                                                // pause_0_len_max: maximum length of pause with bit value 0
    FDC_ADDRESS_OFFSET,                                                 // address_offset:  address offset
    FDC_ADDRESS_OFFSET + FDC_ADDRESS_LEN,                               // address_end:     end of address
    FDC_COMMAND_OFFSET,                                                 // command_offset:  command offset
    FDC_COMMAND_OFFSET + FDC_COMMAND_LEN,                               // command_end:     end of command
    FDC_COMPLETE_DATA_LEN,                                              // complete_len:    complete length of frame
    FDC_STOP_BIT,                                                       // stop_bit:        flag: frame has stop bit
    FDC_LSB,                                                            // lsb_first:       flag: LSB first
    FDC_FLAGS                                                           // flags:           some flags
};

#endif

#if IRMP_SUPPORT_RCCAR_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER rccar_param =
{
    IRMP_RCCAR_PROTOCOL,                                                // protocol:        ir protocol
    RCCAR_PULSE_LEN_MIN,                                                // pulse_1_len_min: minimum length of pulse with bit value 1
    RCCAR_PULSE_LEN_MAX,                                                // pulse_1_len_max: maximum length of pulse with bit value 1
    RCCAR_1_PAUSE_LEN_MIN,                                              // pause_1_len_min: minimum length of pause with bit value 1
    RCCAR_1_PAUSE_LEN_MAX,                                              // pause_1_len_max: maximum length of pause with bit value 1
    RCCAR_PULSE_LEN_MIN,                                                // pulse_0_len_min: minimum length of pulse with bit value 0
    RCCAR_PULSE_LEN_MAX,                                                // pulse_0_len_max: maximum length of pulse with bit value 0
    RCCAR_0_PAUSE_LEN_MIN,                                              // pause_0_len_min: minimum length of pause with bit value 0
    RCCAR_0_PAUSE_LEN_MAX,                                              // pause_0_len_max: maximum length of pause with bit value 0
    RCCAR_ADDRESS_OFFSET,                                               // address_offset:  address offset
    RCCAR_ADDRESS_OFFSET + RCCAR_ADDRESS_LEN,                           // address_end:     end of address
    RCCAR_COMMAND_OFFSET,                                               // command_offset:  command offset
    RCCAR_COMMAND_OFFSET + RCCAR_COMMAND_LEN,                           // command_end:     end of command
    RCCAR_COMPLETE_DATA_LEN,                                            // complete_len:    complete length of frame
    RCCAR_STOP_BIT,                                                     // stop_bit:        flag: frame has stop bit
    RCCAR_LSB,                                                          // lsb_first:       flag: LSB first
    RCCAR_FLAGS                                                         // flags:           some flags
};

#endif

#if IRMP_SUPPORT_NIKON_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER nikon_param =
{
    IRMP_NIKON_PROTOCOL,                                                // protocol:        ir protocol
    NIKON_PULSE_LEN_MIN,                                                // pulse_1_len_min: minimum length of pulse with bit value 1
    NIKON_PULSE_LEN_MAX,                                                // pulse_1_len_max: maximum length of pulse with bit value 1
    NIKON_1_PAUSE_LEN_MIN,                                              // pause_1_len_min: minimum length of pause with bit value 1
    NIKON_1_PAUSE_LEN_MAX,                                              // pause_1_len_max: maximum length of pause with bit value 1
    NIKON_PULSE_LEN_MIN,                                                // pulse_0_len_min: minimum length of pulse with bit value 0
    NIKON_PULSE_LEN_MAX,                                                // pulse_0_len_max: maximum length of pulse with bit value 0
    NIKON_0_PAUSE_LEN_MIN,                                              // pause_0_len_min: minimum length of pause with bit value 0
    NIKON_0_PAUSE_LEN_MAX,                                              // pause_0_len_max: maximum length of pause with bit value 0
    NIKON_ADDRESS_OFFSET,                                               // address_offset:  address offset
    NIKON_ADDRESS_OFFSET + NIKON_ADDRESS_LEN,                           // address_end:     end of address
    NIKON_COMMAND_OFFSET,                                               // command_offset:  command offset
    NIKON_COMMAND_OFFSET + NIKON_COMMAND_LEN,                           // command_end:     end of command
    NIKON_COMPLETE_DATA_LEN,                                            // complete_len:    complete length of frame
    NIKON_STOP_BIT,                                                     // stop_bit:        flag: frame has stop bit
    NIKON_LSB,                                                          // lsb_first:       flag: LSB first
    NIKON_FLAGS                                                         // flags:           some flags
};

#endif

#if IRMP_SUPPORT_KATHREIN_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER kathrein_param =
{
    IRMP_KATHREIN_PROTOCOL,                                             // protocol:        ir protocol
    KATHREIN_1_PULSE_LEN_MIN,                                           // pulse_1_len_min: minimum length of pulse with bit value 1
    KATHREIN_1_PULSE_LEN_MAX,                                           // pulse_1_len_max: maximum length of pulse with bit value 1
    KATHREIN_1_PAUSE_LEN_MIN,                                           // pause_1_len_min: minimum length of pause with bit value 1
    KATHREIN_1_PAUSE_LEN_MAX,                                           // pause_1_len_max: maximum length of pause with bit value 1
    KATHREIN_0_PULSE_LEN_MIN,                                           // pulse_0_len_min: minimum length of pulse with bit value 0
    KATHREIN_0_PULSE_LEN_MAX,                                           // pulse_0_len_max: maximum length of pulse with bit value 0
    KATHREIN_0_PAUSE_LEN_MIN,                                           // pause_0_len_min: minimum length of pause with bit value 0
    KATHREIN_0_PAUSE_LEN_MAX,                                           // pause_0_len_max: maximum length of pause with bit value 0
    KATHREIN_ADDRESS_OFFSET,                                            // address_offset:  address offset
    KATHREIN_ADDRESS_OFFSET + KATHREIN_ADDRESS_LEN,                     // address_end:     end of address
    KATHREIN_COMMAND_OFFSET,                                            // command_offset:  command offset
    KATHREIN_COMMAND_OFFSET + KATHREIN_COMMAND_LEN,                     // command_end:     end of command
    KATHREIN_COMPLETE_DATA_LEN,                                         // complete_len:    complete length of frame
    KATHREIN_STOP_BIT,                                                  // stop_bit:        flag: frame has stop bit
    KATHREIN_LSB,                                                       // lsb_first:       flag: LSB first
    KATHREIN_FLAGS                                                      // flags:           some flags
};

#endif

#if IRMP_SUPPORT_NETBOX_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER netbox_param =
{
    IRMP_NETBOX_PROTOCOL,                                               // protocol:        ir protocol
    NETBOX_PULSE_LEN,                                                   // pulse_1_len_min: minimum length of pulse with bit value 1, here: exact value
    NETBOX_PULSE_REST_LEN,                                              // pulse_1_len_max: maximum length of pulse with bit value 1, here: rest value
    NETBOX_PAUSE_LEN,                                                   // pause_1_len_min: minimum length of pause with bit value 1, here: exact value
    NETBOX_PAUSE_REST_LEN,                                              // pause_1_len_max: maximum length of pause with bit value 1, here: rest value
    NETBOX_PULSE_LEN,                                                   // pulse_0_len_min: minimum length of pulse with bit value 0, here: exact value
    NETBOX_PULSE_REST_LEN,                                              // pulse_0_len_max: maximum length of pulse with bit value 0, here: rest value
    NETBOX_PAUSE_LEN,                                                   // pause_0_len_min: minimum length of pause with bit value 0, here: exact value
    NETBOX_PAUSE_REST_LEN,                                              // pause_0_len_max: maximum length of pause with bit value 0, here: rest value
    NETBOX_ADDRESS_OFFSET,                                              // address_offset:  address offset
    NETBOX_ADDRESS_OFFSET + NETBOX_ADDRESS_LEN,                         // address_end:     end of address
    NETBOX_COMMAND_OFFSET,                                              // command_offset:  command offset
    NETBOX_COMMAND_OFFSET + NETBOX_COMMAND_LEN,                         // command_end:     end of command
    NETBOX_COMPLETE_DATA_LEN,                                           // complete_len:    complete length of frame
    NETBOX_STOP_BIT,                                                    // stop_bit:        flag: frame has stop bit
    NETBOX_LSB,                                                         // lsb_first:       flag: LSB first
    NETBOX_FLAGS                                                        // flags:           some flags
};

#endif

#if IRMP_SUPPORT_LEGO_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER lego_param =
{
    IRMP_LEGO_PROTOCOL,                                                 // protocol:        ir protocol
    LEGO_PULSE_LEN_MIN,                                                 // pulse_1_len_min: minimum length of pulse with bit value 1
    LEGO_PULSE_LEN_MAX,                                                 // pulse_1_len_max: maximum length of pulse with bit value 1
    LEGO_1_PAUSE_LEN_MIN,                                               // pause_1_len_min: minimum length of pause with bit value 1
    LEGO_1_PAUSE_LEN_MAX,                                               // pause_1_len_max: maximum length of pause with bit value 1
    LEGO_PULSE_LEN_MIN,                                                 // pulse_0_len_min: minimum length of pulse with bit value 0
    LEGO_PULSE_LEN_MAX,                                                 // pulse_0_len_max: maximum length of pulse with bit value 0
    LEGO_0_PAUSE_LEN_MIN,                                               // pause_0_len_min: minimum length of pause with bit value 0
    LEGO_0_PAUSE_LEN_MAX,                                               // pause_0_len_max: maximum length of pause with bit value 0
    LEGO_ADDRESS_OFFSET,                                                // address_offset:  address offset
    LEGO_ADDRESS_OFFSET + LEGO_ADDRESS_LEN,                             // address_end:     end of address
    LEGO_COMMAND_OFFSET,                                                // command_offset:  command offset
    LEGO_COMMAND_OFFSET + LEGO_COMMAND_LEN,                             // command_end:     end of command
    LEGO_COMPLETE_DATA_LEN,                                             // complete_len:    complete length of frame
    LEGO_STOP_BIT,                                                      // stop_bit:        flag: frame has stop bit
    LEGO_LSB,                                                           // lsb_first:       flag: LSB first
    LEGO_FLAGS                                                          // flags:           some flags
};

#endif

#if IRMP_SUPPORT_THOMSON_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER thomson_param =
{
    IRMP_THOMSON_PROTOCOL,                                              // protocol:        ir protocol
    THOMSON_PULSE_LEN_MIN,                                              // pulse_1_len_min: minimum length of pulse with bit value 1
    THOMSON_PULSE_LEN_MAX,                                              // pulse_1_len_max: maximum length of pulse with bit value 1
    THOMSON_1_PAUSE_LEN_MIN,                                            // pause_1_len_min: minimum length of pause with bit value 1
    THOMSON_1_PAUSE_LEN_MAX,                                            // pause_1_len_max: maximum length of pause with bit value 1
    THOMSON_PULSE_LEN_MIN,                                              // pulse_0_len_min: minimum length of pulse with bit value 0
    THOMSON_PULSE_LEN_MAX,                                              // pulse_0_len_max: maximum length of pulse with bit value 0
    THOMSON_0_PAUSE_LEN_MIN,                                            // pause_0_len_min: minimum length of pause with bit value 0
    THOMSON_0_PAUSE_LEN_MAX,                                            // pause_0_len_max: maximum length of pause with bit value 0
    THOMSON_ADDRESS_OFFSET,                                             // address_offset:  address offset
    THOMSON_ADDRESS_OFFSET + THOMSON_ADDRESS_LEN,                       // address_end:     end of address
    THOMSON_COMMAND_OFFSET,                                             // command_offset:  command offset
    THOMSON_COMMAND_OFFSET + THOMSON_COMMAND_LEN,                       // command_end:     end of command
    THOMSON_COMPLETE_DATA_LEN,                                          // complete_len:    complete length of frame
    THOMSON_STOP_BIT,                                                   // stop_bit:        flag: frame has stop bit
    THOMSON_LSB,                                                        // lsb_first:       flag: LSB first
    THOMSON_FLAGS                                                       // flags:           some flags
};

#endif

#if IRMP_SUPPORT_BOSE_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER bose_param =
{
    IRMP_BOSE_PROTOCOL,                                                 // protocol:        ir protocol
    BOSE_PULSE_LEN_MIN,                                                 // pulse_1_len_min: minimum length of pulse with bit value 1
    BOSE_PULSE_LEN_MAX,                                                 // pulse_1_len_max: maximum length of pulse with bit value 1
    BOSE_1_PAUSE_LEN_MIN,                                               // pause_1_len_min: minimum length of pause with bit value 1
    BOSE_1_PAUSE_LEN_MAX,                                               // pause_1_len_max: maximum length of pause with bit value 1
    BOSE_PULSE_LEN_MIN,                                                 // pulse_0_len_min: minimum length of pulse with bit value 0
    BOSE_PULSE_LEN_MAX,                                                 // pulse_0_len_max: maximum length of pulse with bit value 0
    BOSE_0_PAUSE_LEN_MIN,                                               // pause_0_len_min: minimum length of pause with bit value 0
    BOSE_0_PAUSE_LEN_MAX,                                               // pause_0_len_max: maximum length of pause with bit value 0
    BOSE_ADDRESS_OFFSET,                                                // address_offset:  address offset
    BOSE_ADDRESS_OFFSET + BOSE_ADDRESS_LEN,                             // address_end:     end of address
    BOSE_COMMAND_OFFSET,                                                // command_offset:  command offset
    BOSE_COMMAND_OFFSET + BOSE_COMMAND_LEN,                             // command_end:     end of command
    BOSE_COMPLETE_DATA_LEN,                                             // complete_len:    complete length of frame
    BOSE_STOP_BIT,                                                      // stop_bit:        flag: frame has stop bit
    BOSE_LSB,                                                           // lsb_first:       flag: LSB first
    BOSE_FLAGS                                                          // flags:           some flags
};

#endif

#if IRMP_SUPPORT_A1TVBOX_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER a1tvbox_param =
{
    IRMP_A1TVBOX_PROTOCOL,                                              // protocol:        ir protocol

    A1TVBOX_BIT_PULSE_LEN_MIN,                                          // pulse_1_len_min: here: minimum length of short pulse
    A1TVBOX_BIT_PULSE_LEN_MAX,                                          // pulse_1_len_max: here: maximum length of short pulse
    A1TVBOX_BIT_PAUSE_LEN_MIN,                                          // pause_1_len_min: here: minimum length of short pause
    A1TVBOX_BIT_PAUSE_LEN_MAX,                                          // pause_1_len_max: here: maximum length of short pause
    0,                                                                  // pulse_0_len_min: here: not used
    0,                                                                  // pulse_0_len_max: here: not used
    0,                                                                  // pause_0_len_min: here: not used
    0,                                                                  // pause_0_len_max: here: not used
    A1TVBOX_ADDRESS_OFFSET,                                             // address_offset:  address offset
    A1TVBOX_ADDRESS_OFFSET + A1TVBOX_ADDRESS_LEN,                       // address_end:     end of address
    A1TVBOX_COMMAND_OFFSET,                                             // command_offset:  command offset
    A1TVBOX_COMMAND_OFFSET + A1TVBOX_COMMAND_LEN,                       // command_end:     end of command
    A1TVBOX_COMPLETE_DATA_LEN,                                          // complete_len:    complete length of frame
    A1TVBOX_STOP_BIT,                                                   // stop_bit:        flag: frame has stop bit
    A1TVBOX_LSB,                                                        // lsb_first:       flag: LSB first
    A1TVBOX_FLAGS                                                       // flags:           some flags
};

#endif

#if IRMP_SUPPORT_MERLIN_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER merlin_param =
{
    IRMP_MERLIN_PROTOCOL,                                               // protocol:        ir protocol

    MERLIN_BIT_PULSE_LEN_MIN,                                           // pulse_1_len_min: here: minimum length of short pulse
    MERLIN_BIT_PULSE_LEN_MAX,                                           // pulse_1_len_max: here: maximum length of short pulse
    MERLIN_BIT_PAUSE_LEN_MIN,                                           // pause_1_len_min: here: minimum length of short pause
    MERLIN_BIT_PAUSE_LEN_MAX,                                           // pause_1_len_max: here: maximum length of short pause
    0,                                                                  // pulse_0_len_min: here: not used
    0,                                                                  // pulse_0_len_max: here: not used
    0,                                                                  // pause_0_len_min: here: not used
    0,                                                                  // pause_0_len_max: here: not used
    MERLIN_ADDRESS_OFFSET,                                              // address_offset:  address offset
    MERLIN_ADDRESS_OFFSET + MERLIN_ADDRESS_LEN,                         // address_end:     end of address
    MERLIN_COMMAND_OFFSET,                                              // command_offset:  command offset
    MERLIN_COMMAND_OFFSET + MERLIN_COMMAND_LEN,                         // command_end:     end of command
    MERLIN_COMPLETE_DATA_LEN,                                           // complete_len:    complete length of frame
    MERLIN_STOP_BIT,                                                    // stop_bit:        flag: frame has stop bit
    MERLIN_LSB,                                                         // lsb_first:       flag: LSB first
    MERLIN_FLAGS                                                        // flags:           some flags
};

#endif

#if IRMP_SUPPORT_ORTEK_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER ortek_param =
{
    IRMP_ORTEK_PROTOCOL,                                                // protocol:        ir protocol

    ORTEK_BIT_PULSE_LEN_MIN,                                            // pulse_1_len_min: here: minimum length of short pulse
    ORTEK_BIT_PULSE_LEN_MAX,                                            // pulse_1_len_max: here: maximum length of short pulse
    ORTEK_BIT_PAUSE_LEN_MIN,                                            // pause_1_len_min: here: minimum length of short pause
    ORTEK_BIT_PAUSE_LEN_MAX,                                            // pause_1_len_max: here: maximum length of short pause
    0,                                                                  // pulse_0_len_min: here: not used
    0,                                                                  // pulse_0_len_max: here: not used
    0,                                                                  // pause_0_len_min: here: not used
    0,                                                                  // pause_0_len_max: here: not used
    ORTEK_ADDRESS_OFFSET,                                               // address_offset:  address offset
    ORTEK_ADDRESS_OFFSET + ORTEK_ADDRESS_LEN,                           // address_end:     end of address
    ORTEK_COMMAND_OFFSET,                                               // command_offset:  command offset
    ORTEK_COMMAND_OFFSET + ORTEK_COMMAND_LEN,                           // command_end:     end of command
    ORTEK_COMPLETE_DATA_LEN,                                            // complete_len:    complete length of frame
    ORTEK_STOP_BIT,                                                     // stop_bit:        flag: frame has stop bit
    ORTEK_LSB,                                                          // lsb_first:       flag: LSB first
    ORTEK_FLAGS                                                         // flags:           some flags
};

#endif

#if IRMP_SUPPORT_ROOMBA_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER roomba_param =
{
    IRMP_ROOMBA_PROTOCOL,                                               // protocol:        ir protocol
    ROOMBA_1_PULSE_LEN_MIN,                                             // pulse_1_len_min: minimum length of pulse with bit value 1
    ROOMBA_1_PULSE_LEN_MAX,                                             // pulse_1_len_max: maximum length of pulse with bit value 1
    ROOMBA_1_PAUSE_LEN_MIN,                                             // pause_1_len_min: minimum length of pause with bit value 1
    ROOMBA_1_PAUSE_LEN_MAX,                                             // pause_1_len_max: maximum length of pause with bit value 1
    ROOMBA_0_PULSE_LEN_MIN,                                             // pulse_0_len_min: minimum length of pulse with bit value 0
    ROOMBA_0_PULSE_LEN_MAX,                                             // pulse_0_len_max: maximum length of pulse with bit value 0
    ROOMBA_0_PAUSE_LEN_MIN,                                             // pause_0_len_min: minimum length of pause with bit value 0
    ROOMBA_0_PAUSE_LEN_MAX,                                             // pause_0_len_max: maximum length of pause with bit value 0
    ROOMBA_ADDRESS_OFFSET,                                              // address_offset:  address offset
    ROOMBA_ADDRESS_OFFSET + ROOMBA_ADDRESS_LEN,                         // address_end:     end of address
    ROOMBA_COMMAND_OFFSET,                                              // command_offset:  command offset
    ROOMBA_COMMAND_OFFSET + ROOMBA_COMMAND_LEN,                         // command_end:     end of command
    ROOMBA_COMPLETE_DATA_LEN,                                           // complete_len:    complete length of frame
    ROOMBA_STOP_BIT,                                                    // stop_bit:        flag: frame has stop bit
    ROOMBA_LSB,                                                         // lsb_first:       flag: LSB first
    ROOMBA_FLAGS                                                        // flags:           some flags
};

#endif

#if IRMP_SUPPORT_RCMM_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER rcmm_param =
{
    IRMP_RCMM32_PROTOCOL,                                               // protocol:        ir protocol

    RCMM32_BIT_PULSE_LEN_MIN,                                           // pulse_1_len_min: here: minimum length of short pulse
    RCMM32_BIT_PULSE_LEN_MAX,                                           // pulse_1_len_max: here: maximum length of short pulse
    0,                                                                  // pause_1_len_min: here: minimum length of short pause
    0,                                                                  // pause_1_len_max: here: maximum length of short pause
    RCMM32_BIT_PULSE_LEN_MIN,                                           // pulse_0_len_min: here: not used
    RCMM32_BIT_PULSE_LEN_MAX,                                           // pulse_0_len_max: here: not used
    0,                                                                  // pause_0_len_min: here: not used
    0,                                                                  // pause_0_len_max: here: not used
    RCMM32_ADDRESS_OFFSET,                                              // address_offset:  address offset
    RCMM32_ADDRESS_OFFSET + RCMM32_ADDRESS_LEN,                         // address_end:     end of address
    RCMM32_COMMAND_OFFSET,                                              // command_offset:  command offset
    RCMM32_COMMAND_OFFSET + RCMM32_COMMAND_LEN,                         // command_end:     end of command
    RCMM32_COMPLETE_DATA_LEN,                                           // complete_len:    complete length of frame
    RCMM32_STOP_BIT,                                                    // stop_bit:        flag: frame has stop bit
    RCMM32_LSB,                                                         // lsb_first:       flag: LSB first
    RCMM32_FLAGS                                                        // flags:           some flags
};

#endif

#if IRMP_SUPPORT_PENTAX_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER pentax_param =
{
    IRMP_PENTAX_PROTOCOL,                                               // protocol:        ir protocol
    PENTAX_PULSE_LEN_MIN,                                               // pulse_1_len_min: minimum length of pulse with bit value 1
    PENTAX_PULSE_LEN_MAX,                                               // pulse_1_len_max: maximum length of pulse with bit value 1
    PENTAX_1_PAUSE_LEN_MIN,                                             // pause_1_len_min: minimum length of pause with bit value 1
    PENTAX_1_PAUSE_LEN_MAX,                                             // pause_1_len_max: maximum length of pause with bit value 1
    PENTAX_PULSE_LEN_MIN,                                               // pulse_0_len_min: minimum length of pulse with bit value 0
    PENTAX_PULSE_LEN_MAX,                                               // pulse_0_len_max: maximum length of pulse with bit value 0
    PENTAX_0_PAUSE_LEN_MIN,                                             // pause_0_len_min: minimum length of pause with bit value 0
    PENTAX_0_PAUSE_LEN_MAX,                                             // pause_0_len_max: maximum length of pause with bit value 0
    PENTAX_ADDRESS_OFFSET,                                              // address_offset:  address offset
    PENTAX_ADDRESS_OFFSET + PENTAX_ADDRESS_LEN,                         // address_end:     end of address
    PENTAX_COMMAND_OFFSET,                                              // command_offset:  command offset
    PENTAX_COMMAND_OFFSET + PENTAX_COMMAND_LEN,                         // command_end:     end of command
    PENTAX_COMPLETE_DATA_LEN,                                           // complete_len:    complete length of frame
    PENTAX_STOP_BIT,                                                    // stop_bit:        flag: frame has stop bit
    PENTAX_LSB,                                                         // lsb_first:       flag: LSB first
    PENTAX_FLAGS                                                        // flags:           some flags
};

#endif

#if IRMP_SUPPORT_ACP24_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER acp24_param =
{
    IRMP_ACP24_PROTOCOL,                                                // protocol:        ir protocol
    ACP24_PULSE_LEN_MIN,                                                // pulse_1_len_min: minimum length of pulse with bit value 1
    ACP24_PULSE_LEN_MAX,                                                // pulse_1_len_max: maximum length of pulse with bit value 1
    ACP24_1_PAUSE_LEN_MIN,                                              // pause_1_len_min: minimum length of pause with bit value 1
    ACP24_1_PAUSE_LEN_MAX,                                              // pause_1_len_max: maximum length of pause with bit value 1
    ACP24_PULSE_LEN_MIN,                                                // pulse_0_len_min: minimum length of pulse with bit value 0
    ACP24_PULSE_LEN_MAX,                                                // pulse_0_len_max: maximum length of pulse with bit value 0
    ACP24_0_PAUSE_LEN_MIN,                                              // pause_0_len_min: minimum length of pause with bit value 0
    ACP24_0_PAUSE_LEN_MAX,                                              // pause_0_len_max: maximum length of pause with bit value 0
    ACP24_ADDRESS_OFFSET,                                               // address_offset:  address offset
    ACP24_ADDRESS_OFFSET + ACP24_ADDRESS_LEN,                           // address_end:     end of address
    ACP24_COMMAND_OFFSET,                                               // command_offset:  command offset
    ACP24_COMMAND_OFFSET + ACP24_COMMAND_LEN,                           // command_end:     end of command
    ACP24_COMPLETE_DATA_LEN,                                            // complete_len:    complete length of frame
    ACP24_STOP_BIT,                                                     // stop_bit:        flag: frame has stop bit
    ACP24_LSB,                                                          // lsb_first:       flag: LSB first
    ACP24_FLAGS                                                         // flags:           some flags
};

#endif

#if IRMP_SUPPORT_RADIO1_PROTOCOL == 1

static const PROGMEM IRMP_PARAMETER radio1_param =
{
    IRMP_RADIO1_PROTOCOL,                                               // protocol:        ir protocol

    RADIO1_1_PULSE_LEN_MIN,                                             // pulse_1_len_min: minimum length of pulse with bit value 1
    RADIO1_1_PULSE_LEN_MAX,                                             // pulse_1_len_max: maximum length of pulse with bit value 1
    RADIO1_1_PAUSE_LEN_MIN,                                             // pause_1_len_min: minimum length of pause with bit value 1
    RADIO1_1_PAUSE_LEN_MAX,                                             // pause_1_len_max: maximum length of pause with bit value 1
    RADIO1_0_PULSE_LEN_MIN,                                             // pulse_0_len_min: minimum length of pulse with bit value 0
    RADIO1_0_PULSE_LEN_MAX,                                             // pulse_0_len_max: maximum length of pulse with bit value 0
    RADIO1_0_PAUSE_LEN_MIN,                                             // pause_0_len_min: minimum length of pause with bit value 0
    RADIO1_0_PAUSE_LEN_MAX,                                             // pause_0_len_max: maximum length of pause with bit value 0
    RADIO1_ADDRESS_OFFSET,                                              // address_offset:  address offset
    RADIO1_ADDRESS_OFFSET + RADIO1_ADDRESS_LEN,                         // address_end:     end of address
    RADIO1_COMMAND_OFFSET,                                              // command_offset:  command offset
    RADIO1_COMMAND_OFFSET + RADIO1_COMMAND_LEN,                         // command_end:     end of command
    RADIO1_COMPLETE_DATA_LEN,                                           // complete_len:    complete length of frame
    RADIO1_STOP_BIT,                                                    // stop_bit:        flag: frame has stop bit
    RADIO1_LSB,                                                         // lsb_first:       flag: LSB first
    RADIO1_FLAGS                                                        // flags:           some flags
};

#endif

static uint_fast8_t                             irmp_bit;                   // current bit position
static IRMP_PARAMETER                           irmp_param;

#if IRMP_SUPPORT_RC5_PROTOCOL == 1 && (IRMP_SUPPORT_FDC_PROTOCOL == 1 || IRMP_SUPPORT_RCCAR_PROTOCOL == 1)
static IRMP_PARAMETER                           irmp_param2;
#endif

static volatile uint_fast8_t                    irmp_ir_detected = FALSE;
static volatile uint_fast8_t                    irmp_protocol;
static volatile uint_fast16_t                   irmp_address;
static volatile uint_fast16_t                   irmp_command;
static volatile uint_fast16_t                   irmp_id;                // only used for SAMSUNG protocol
static volatile uint_fast8_t                    irmp_flags;
// static volatile uint_fast8_t                 irmp_busy_flag;

#if defined(__MBED__)
// DigitalIn inputPin(IRMP_PIN, PullUp);                                // this requires mbed.h and source to be compiled as cpp
gpio_t                                          gpioIRin;               // use low level c function instead
#endif


#ifdef ANALYZE
#define input(x)                                (x)
static uint_fast8_t                             IRMP_PIN;
static uint_fast8_t                             radio;
#endif

/*---------------------------------------------------------------------------------------------------------------------------------------------------
 *  Initialize IRMP decoder
 *  @details  Configures IRMP input pin
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */
#ifndef ANALYZE
void
irmp_init (void)
{
#if defined(PIC_CCS) || defined(PIC_C18)                                // PIC: do nothing
#elif defined (ARM_STM32)                                               // STM32
    GPIO_InitTypeDef     GPIO_InitStructure;

    /* GPIOx clock enable */
#  if defined (ARM_STM32L1XX)
    RCC_AHBPeriphClockCmd(IRMP_PORT_RCC, ENABLE);
#  elif defined (ARM_STM32F10X)
    RCC_APB2PeriphClockCmd(IRMP_PORT_RCC, ENABLE);
#  elif defined (ARM_STM32F4XX)
    RCC_AHB1PeriphClockCmd(IRMP_PORT_RCC, ENABLE);
#  endif

    /* GPIO Configuration */
    GPIO_InitStructure.GPIO_Pin = IRMP_BIT;
#  if defined (ARM_STM32L1XX) || defined (ARM_STM32F4XX)
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
#  elif defined (ARM_STM32F10X)
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
#  endif
    GPIO_Init(IRMP_PORT, &GPIO_InitStructure);

#elif defined(STELLARIS_ARM_CORTEX_M4)
    // Enable the GPIO port
    ROM_SysCtlPeripheralEnable(IRMP_PORT_PERIPH);

    // Set as an input
    ROM_GPIODirModeSet(IRMP_PORT_BASE, IRMP_PORT_PIN, GPIO_DIR_MODE_IN);
    ROM_GPIOPadConfigSet(IRMP_PORT_BASE, IRMP_PORT_PIN, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);

#elif defined(__SDCC_stm8)                                              // STM8
    IRMP_GPIO_STRUCT->DDR &= ~(1<<IRMP_BIT);                            // pin is input
    IRMP_GPIO_STRUCT->CR1 |= (1<<IRMP_BIT);                             // activate pullup

#elif defined (TEENSY_ARM_CORTEX_M4)                                    // TEENSY
    pinMode(IRMP_PIN, INPUT);

#elif defined(__xtensa__)                                               // ESP8266
    gpio_enable(IRMP_BIT_NUMBER, GPIO_INPUT);
/*
                                                                        // select pin function
#  if (IRMP_BIT_NUMBER == 12)
    PIN_FUNC_SELECT(PERIPHS_IO_MUX_MTDI_U, FUNC_GPIO12);
//  doesn't work for me:
//  # elif (IRMP_BIT_NUMBER == 13)
//  PIN_FUNC_SELECT(PERIPHS_IO_MUX_MTCK_U , FUNC_GPIO13);
#  else
#   warning Please add PIN_FUNC_SELECT when necessary.
#  endif
    GPIO_DIS_OUTPUT(IRMP_BIT_NUMBER);
*/

#elif defined(__MBED__)
    gpio_init_in_ex(&gpioIRin, IRMP_PIN, IRMP_PINMODE);                 // initialize input for IR diode

#else                                                                   // AVR
    IRMP_PORT &= ~(1<<IRMP_BIT);                                        // deactivate pullup
    IRMP_DDR &= ~(1<<IRMP_BIT);                                         // set pin to input
#endif

#if IRMP_LOGGING == 1
    irmp_uart_init ();
#endif
}
#endif
/*---------------------------------------------------------------------------------------------------------------------------------------------------
 *  Get IRMP data
 *  @details  gets decoded IRMP data
 *  @param    pointer in order to store IRMP data
 *  @return    TRUE: successful, FALSE: failed
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */
uint_fast8_t
irmp_get_data (IRMP_DATA * irmp_data_p)
{
    uint_fast8_t   rtc = FALSE;

    if (irmp_ir_detected)
    {
        switch (irmp_protocol)
        {
#if IRMP_SUPPORT_SAMSUNG_PROTOCOL == 1
            case IRMP_SAMSUNG_PROTOCOL:
                if ((irmp_command >> 8) == (~irmp_command & 0x00FF))
                {
                    irmp_command &= 0xff;
                    irmp_command |= irmp_id << 8;
                    rtc = TRUE;
                }
                break;

#if IRMP_SUPPORT_SAMSUNG48_PROTOCOL == 1
            case IRMP_SAMSUNG48_PROTOCOL:
                irmp_command = (irmp_command & 0x00FF) | ((irmp_id & 0x00FF) << 8);
                rtc = TRUE;
                break;
#endif
#endif

#if IRMP_SUPPORT_NEC_PROTOCOL == 1
            case IRMP_NEC_PROTOCOL:
                if ((irmp_command >> 8) == (~irmp_command & 0x00FF))
                {
                    irmp_command &= 0xff;
                    rtc = TRUE;
                }
                else if (irmp_address == 0x87EE)
                {
#ifdef ANALYZE
                    ANALYZE_PRINTF ("Switching to APPLE protocol\n");
#endif // ANALYZE
                    irmp_protocol = IRMP_APPLE_PROTOCOL;
                    irmp_address = (irmp_command & 0xFF00) >> 8;
                    irmp_command &= 0x00FF;
                    rtc = TRUE;
                }
                break;
#endif


#if IRMP_SUPPORT_NEC_PROTOCOL == 1
            case IRMP_VINCENT_PROTOCOL:
                if ((irmp_command >> 8) == (irmp_command & 0x00FF))
                {
                    irmp_command &= 0xff;
                    rtc = TRUE;
                }
                break;
#endif

#if IRMP_SUPPORT_BOSE_PROTOCOL == 1
            case IRMP_BOSE_PROTOCOL:
                if ((irmp_command >> 8) == (~irmp_command & 0x00FF))
                {
                    irmp_command &= 0xff;
                    rtc = TRUE;
                }
                break;
#endif
#if IRMP_SUPPORT_SIEMENS_OR_RUWIDO_PROTOCOL == 1
            case IRMP_SIEMENS_PROTOCOL:
            case IRMP_RUWIDO_PROTOCOL:
                if (((irmp_command >> 1) & 0x0001) == (~irmp_command & 0x0001))
                {
                    irmp_command >>= 1;
                    rtc = TRUE;
                }
                break;
#endif
#if IRMP_SUPPORT_KATHREIN_PROTOCOL == 1
            case IRMP_KATHREIN_PROTOCOL:
                if (irmp_command != 0x0000)
                {
                    rtc = TRUE;
                }
                break;
#endif
#if IRMP_SUPPORT_RC5_PROTOCOL == 1
            case IRMP_RC5_PROTOCOL:
                irmp_address &= ~0x20;                              // clear toggle bit
                rtc = TRUE;
                break;
#endif
#if IRMP_SUPPORT_S100_PROTOCOL == 1
            case IRMP_S100_PROTOCOL:
                irmp_address &= ~0x20;                              // clear toggle bit
                rtc = TRUE;
                break;
#endif
#if IRMP_SUPPORT_IR60_PROTOCOL == 1
            case IRMP_IR60_PROTOCOL:
                if (irmp_command != 0x007d)                         // 0x007d (== 62<<1 + 1) is start instruction frame
                {
                    rtc = TRUE;
                }
                else
                {
#ifdef ANALYZE
                    ANALYZE_PRINTF("Info IR60: got start instruction frame\n");
#endif // ANALYZE
                }
                break;
#endif
#if IRMP_SUPPORT_RCCAR_PROTOCOL == 1
            case IRMP_RCCAR_PROTOCOL:
                // frame in irmp_data:
                // Bit 12 11 10 9  8  7  6  5  4  3  2  1  0
                //     V  D7 D6 D5 D4 D3 D2 D1 D0 A1 A0 C1 C0   //         10 9  8  7  6  5  4  3  2  1  0
                irmp_address = (irmp_command & 0x000C) >> 2;    // addr:   0  0  0  0  0  0  0  0  0  A1 A0
                irmp_command = ((irmp_command & 0x1000) >> 2) | // V-Bit:  V  0  0  0  0  0  0  0  0  0  0
                               ((irmp_command & 0x0003) << 8) | // C-Bits: 0  C1 C0 0  0  0  0  0  0  0  0
                               ((irmp_command & 0x0FF0) >> 4);  // D-Bits:          D7 D6 D5 D4 D3 D2 D1 D0
                rtc = TRUE;                                     // Summe:  V  C1 C0 D7 D6 D5 D4 D3 D2 D1 D0
                break;
#endif

#if IRMP_SUPPORT_NETBOX_PROTOCOL == 1                           // squeeze code to 8 bit, upper bit indicates release-key
            case IRMP_NETBOX_PROTOCOL:
                if (irmp_command & 0x1000)                      // last bit set?
                {
                    if ((irmp_command & 0x1f) == 0x15)          // key pressed: 101 01 (LSB)
                    {
                        irmp_command >>= 5;
                        irmp_command &= 0x7F;
                        rtc = TRUE;
                    }
                    else if ((irmp_command & 0x1f) == 0x10)     // key released: 000 01 (LSB)
                    {
                        irmp_command >>= 5;
                        irmp_command |= 0x80;
                        rtc = TRUE;
                    }
                    else
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF("error NETBOX: bit6/7 must be 0/1\n");
#endif // ANALYZE
                    }
                }
                else
                {
#ifdef ANALYZE
                    ANALYZE_PRINTF("error NETBOX: last bit not set\n");
#endif // ANALYZE
                }
                break;
#endif
#if IRMP_SUPPORT_LEGO_PROTOCOL == 1
            case IRMP_LEGO_PROTOCOL:
            {
                uint_fast8_t crc = 0x0F ^ ((irmp_command & 0xF000) >> 12) ^ ((irmp_command & 0x0F00) >> 8) ^ ((irmp_command & 0x00F0) >> 4);

                if ((irmp_command & 0x000F) == crc)
                {
                    irmp_command >>= 4;
                    rtc = TRUE;
                }
                else
                {
#ifdef ANALYZE
                    ANALYZE_PRINTF ("CRC error in LEGO protocol\n");
#endif // ANALYZE
                    // rtc = TRUE;                              // don't accept codes with CRC errors
                }
                break;
            }
#endif

            default:
            {
                rtc = TRUE;
                break;
            }
        }

        if (rtc)
        {
            irmp_data_p->protocol = irmp_protocol;
            irmp_data_p->address = irmp_address;
            irmp_data_p->command = irmp_command;
            irmp_data_p->flags   = irmp_flags;
            irmp_command = 0;
            irmp_address = 0;
            irmp_flags   = 0;
        }

        irmp_ir_detected = FALSE;
    }

    return rtc;
}

#if IRMP_USE_CALLBACK == 1
void
irmp_set_callback_ptr (void (*cb)(uint_fast8_t))
{
    irmp_callback_ptr = cb;
}
#endif // IRMP_USE_CALLBACK == 1

// these statics must not be volatile, because they are only used by irmp_store_bit(), which is called by irmp_ISR()
static uint_fast16_t irmp_tmp_address;                                      // ir address
static uint_fast16_t irmp_tmp_command;                                      // ir command

#if (IRMP_SUPPORT_RC5_PROTOCOL == 1 && (IRMP_SUPPORT_FDC_PROTOCOL == 1 || IRMP_SUPPORT_RCCAR_PROTOCOL == 1)) || IRMP_SUPPORT_NEC42_PROTOCOL == 1
static uint_fast16_t irmp_tmp_address2;                                     // ir address
static uint_fast16_t irmp_tmp_command2;                                     // ir command
#endif

#if IRMP_SUPPORT_LGAIR_PROTOCOL == 1
static uint_fast16_t irmp_lgair_address;                                    // ir address
static uint_fast16_t irmp_lgair_command;                                    // ir command
#endif

#if IRMP_SUPPORT_SAMSUNG_PROTOCOL == 1
static uint_fast16_t irmp_tmp_id;                                           // ir id (only SAMSUNG)
#endif
#if IRMP_SUPPORT_KASEIKYO_PROTOCOL == 1
static uint8_t      xor_check[6];                                           // check kaseikyo "parity" bits
static uint_fast8_t genre2;                                                 // save genre2 bits here, later copied to MSB in flags
#endif

#if IRMP_SUPPORT_ORTEK_PROTOCOL == 1
static uint_fast8_t  parity;                                                // number of '1' of the first 14 bits, check if even.
#endif

#if IRMP_SUPPORT_MITSU_HEAVY_PROTOCOL == 1
static uint_fast8_t  check;                                                 // number of '1' of the first 14 bits, check if even.
static uint_fast8_t  mitsu_parity;                                          // number of '1' of the first 14 bits, check if even.
#endif

/*---------------------------------------------------------------------------------------------------------------------------------------------------
 *  store bit
 *  @details  store bit in temp address or temp command
 *  @param    value to store: 0 or 1
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */
// verhindert, dass irmp_store_bit() inline compiliert wird:
// static void irmp_store_bit (uint_fast8_t) __attribute__ ((noinline));

static void
irmp_store_bit (uint_fast8_t value)
{
#if IRMP_SUPPORT_ACP24_PROTOCOL == 1
    if (irmp_param.protocol == IRMP_ACP24_PROTOCOL)                                                 // squeeze 64 bits into 16 bits:
    {
        if (value)
        {
            // ACP24-Frame:
            //           1         2         3         4         5         6
            // 0123456789012345678901234567890123456789012345678901234567890123456789
            // N VVMMM    ? ???    t vmA x                 y                     TTTT
            //
            // irmp_data_p->command:
            //
            //         5432109876543210
            //         NAVVvMMMmtxyTTTT

            switch (irmp_bit)
            {
                case  0: irmp_tmp_command |= (1<<15); break;                                        // N
                case  2: irmp_tmp_command |= (1<<13); break;                                        // V
                case  3: irmp_tmp_command |= (1<<12); break;                                        // V
                case  4: irmp_tmp_command |= (1<<10); break;                                        // M
                case  5: irmp_tmp_command |= (1<< 9); break;                                        // M
                case  6: irmp_tmp_command |= (1<< 8); break;                                        // M
                case 20: irmp_tmp_command |= (1<< 6); break;                                        // t
                case 22: irmp_tmp_command |= (1<<11); break;                                        // v
                case 23: irmp_tmp_command |= (1<< 7); break;                                        // m
                case 24: irmp_tmp_command |= (1<<14); break;                                        // A
                case 26: irmp_tmp_command |= (1<< 5); break;                                        // x
                case 44: irmp_tmp_command |= (1<< 4); break;                                        // y
                case 66: irmp_tmp_command |= (1<< 3); break;                                        // T
                case 67: irmp_tmp_command |= (1<< 2); break;                                        // T
                case 68: irmp_tmp_command |= (1<< 1); break;                                        // T
                case 69: irmp_tmp_command |= (1<< 0); break;                                        // T
            }
        }
    }
    else
#endif // IRMP_SUPPORT_ACP24_PROTOCOL

#if IRMP_SUPPORT_ORTEK_PROTOCOL == 1
    if (irmp_param.protocol == IRMP_ORTEK_PROTOCOL)
    {
        if (irmp_bit < 14)
        {
            if (value)
            {
                parity++;
            }
        }
        else if (irmp_bit == 14)
        {
            if (value)                                                                                      // value == 1: even parity
            {
                if (parity & 0x01)
                {
                    parity = PARITY_CHECK_FAILED;
                }
                else
                {
                    parity = PARITY_CHECK_OK;
                }
            }
            else
            {
                if (parity & 0x01)                                                                          // value == 0: odd parity
                {
                    parity = PARITY_CHECK_OK;
                }
                else
                {
                    parity = PARITY_CHECK_FAILED;
                }
            }
        }
    }
    else
#endif
    {
        ;
    }

#if IRMP_SUPPORT_GRUNDIG_NOKIA_IR60_PROTOCOL == 1
    if (irmp_bit == 0 && irmp_param.protocol == IRMP_GRUNDIG_PROTOCOL)
    {
        first_bit = value;
    }
    else
#endif

    if (irmp_bit >= irmp_param.address_offset && irmp_bit < irmp_param.address_end)
    {
        if (irmp_param.lsb_first)
        {
            irmp_tmp_address |= (((uint_fast16_t) (value)) << (irmp_bit - irmp_param.address_offset));   // CV wants cast
        }
        else
        {
            irmp_tmp_address <<= 1;
            irmp_tmp_address |= value;
        }
    }
    else if (irmp_bit >= irmp_param.command_offset && irmp_bit < irmp_param.command_end)
    {
        if (irmp_param.lsb_first)
        {
#if IRMP_SUPPORT_SAMSUNG48_PROTOCOL == 1
            if (irmp_param.protocol == IRMP_SAMSUNG48_PROTOCOL && irmp_bit >= 32)
            {
                irmp_tmp_id |= (((uint_fast16_t) (value)) << (irmp_bit - 32));   // CV wants cast
            }
            else
#endif
            {
                irmp_tmp_command |= (((uint_fast16_t) (value)) << (irmp_bit - irmp_param.command_offset));   // CV wants cast
            }
        }
        else
        {
            irmp_tmp_command <<= 1;
            irmp_tmp_command |= value;
        }
    }

#if IRMP_SUPPORT_LGAIR_PROTOCOL == 1
    if (irmp_param.protocol == IRMP_NEC_PROTOCOL || irmp_param.protocol == IRMP_NEC42_PROTOCOL)
    {
        if (irmp_bit < 8)
        {
            irmp_lgair_address <<= 1;                                                               // LGAIR uses MSB
            irmp_lgair_address |= value;
        }
        else if (irmp_bit < 24)
        {
            irmp_lgair_command <<= 1;                                                               // LGAIR uses MSB
            irmp_lgair_command |= value;
        }
    }
    // NO else!
#endif

#if IRMP_SUPPORT_NEC42_PROTOCOL == 1
    if (irmp_param.protocol == IRMP_NEC42_PROTOCOL && irmp_bit >= 13 && irmp_bit < 26)
    {
        irmp_tmp_address2 |= (((uint_fast16_t) (value)) << (irmp_bit - 13));                             // CV wants cast
    }
    else
#endif

#if IRMP_SUPPORT_SAMSUNG_PROTOCOL == 1
    if (irmp_param.protocol == IRMP_SAMSUNG_PROTOCOL && irmp_bit >= SAMSUNG_ID_OFFSET && irmp_bit < SAMSUNG_ID_OFFSET + SAMSUNG_ID_LEN)
    {
        irmp_tmp_id |= (((uint_fast16_t) (value)) << (irmp_bit - SAMSUNG_ID_OFFSET));                    // store with LSB first
    }
    else
#endif

#if IRMP_SUPPORT_KASEIKYO_PROTOCOL == 1
    if (irmp_param.protocol == IRMP_KASEIKYO_PROTOCOL)
    {
        if (irmp_bit >= 20 && irmp_bit < 24)
        {
            irmp_tmp_command |= (((uint_fast16_t) (value)) << (irmp_bit - 8));      // store 4 system bits (genre 1) in upper nibble with LSB first
        }
        else if (irmp_bit >= 24 && irmp_bit < 28)
        {
            genre2 |= (((uint_fast8_t) (value)) << (irmp_bit - 20));                // store 4 system bits (genre 2) in upper nibble with LSB first
        }

        if (irmp_bit < KASEIKYO_COMPLETE_DATA_LEN)
        {
            if (value)
            {
                xor_check[irmp_bit / 8] |= 1 << (irmp_bit % 8);
            }
            else
            {
                xor_check[irmp_bit / 8] &= ~(1 << (irmp_bit % 8));
            }
        }
    }
    else
#endif

#if IRMP_SUPPORT_MITSU_HEAVY_PROTOCOL == 1
    if (irmp_param.protocol == IRMP_MITSU_HEAVY_PROTOCOL)                           // squeeze 64 bits into 16 bits:
    {
        if (irmp_bit == 72 )
        {                                                                           // irmp_tmp_address, irmp_tmp_command received: check parity & compress
            mitsu_parity = PARITY_CHECK_OK;

            check = irmp_tmp_address >> 8;                                          // inverted upper byte == lower byte?
            check = ~ check;

            if (check == (irmp_tmp_address & 0xFF))
            {                                                                       // ok:
                irmp_tmp_address <<= 8;                                             // throw away upper byte
            }
            else
            {
                mitsu_parity = PARITY_CHECK_FAILED;
            }

            check = irmp_tmp_command >> 8;                                          // inverted upper byte == lower byte?
            check = ~ check;
            if (check == (irmp_tmp_command & 0xFF))
            {                                                                       // ok:  pack together
                irmp_tmp_address |= irmp_tmp_command & 0xFF;                        // byte 1, byte2 in irmp_tmp_address, irmp_tmp_command can be used for byte 3
            }
            else
            {
                mitsu_parity = PARITY_CHECK_FAILED;
            }
            irmp_tmp_command = 0;
        }

        if (irmp_bit >= 72 )
        {                                                                           // receive 3. word in irmp_tmp_command
            irmp_tmp_command <<= 1;
            irmp_tmp_command |= value;
        }
    }
    else
#endif // IRMP_SUPPORT_MITSU_HEAVY_PROTOCOL
    {
        ;
    }

    irmp_bit++;
}

/*---------------------------------------------------------------------------------------------------------------------------------------------------
 *  store bit
 *  @details  store bit in temp address or temp command
 *  @param    value to store: 0 or 1
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */
#if IRMP_SUPPORT_RC5_PROTOCOL == 1 && (IRMP_SUPPORT_FDC_PROTOCOL == 1 || IRMP_SUPPORT_RCCAR_PROTOCOL == 1)
static void
irmp_store_bit2 (uint_fast8_t value)
{
    uint_fast8_t irmp_bit2;

    if (irmp_param.protocol)
    {
        irmp_bit2 = irmp_bit - 2;
    }
    else
    {
        irmp_bit2 = irmp_bit - 1;
    }

    if (irmp_bit2 >= irmp_param2.address_offset && irmp_bit2 < irmp_param2.address_end)
    {
        irmp_tmp_address2 |= (((uint_fast16_t) (value)) << (irmp_bit2 - irmp_param2.address_offset));   // CV wants cast
    }
    else if (irmp_bit2 >= irmp_param2.command_offset && irmp_bit2 < irmp_param2.command_end)
    {
        irmp_tmp_command2 |= (((uint_fast16_t) (value)) << (irmp_bit2 - irmp_param2.command_offset));   // CV wants cast
    }
}
#endif // IRMP_SUPPORT_RC5_PROTOCOL == 1 && (IRMP_SUPPORT_FDC_PROTOCOL == 1 || IRMP_SUPPORT_RCCAR_PROTOCOL == 1)

/*---------------------------------------------------------------------------------------------------------------------------------------------------
 *  ISR routine
 *  @details  ISR routine, called 10000 times per second
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */
uint_fast8_t
irmp_ISR (void)
{
    static uint_fast8_t     irmp_start_bit_detected;                                // flag: start bit detected
    static uint_fast8_t     wait_for_space;                                         // flag: wait for data bit space
    static uint_fast8_t     wait_for_start_space;                                   // flag: wait for start bit space
    static uint_fast8_t     irmp_pulse_time;                                        // count bit time for pulse
    static PAUSE_LEN        irmp_pause_time;                                        // count bit time for pause
    static uint_fast16_t    last_irmp_address = 0xFFFF;                             // save last irmp address to recognize key repetition
    static uint_fast16_t    last_irmp_command = 0xFFFF;                             // save last irmp command to recognize key repetition
    static uint_fast16_t    key_repetition_len;                                     // SIRCS repeats frame 2-5 times with 45 ms pause
    static uint_fast8_t     repetition_frame_number;
#if IRMP_SUPPORT_DENON_PROTOCOL == 1
    static uint_fast16_t    last_irmp_denon_command;                                // save last irmp command to recognize DENON frame repetition
    static uint_fast16_t    denon_repetition_len = 0xFFFF;                          // denon repetition len of 2nd auto generated frame
#endif
#if IRMP_SUPPORT_RC5_PROTOCOL == 1 || IRMP_SUPPORT_S100_PROTOCOL == 1
    static uint_fast8_t     rc5_cmd_bit6;                                           // bit 6 of RC5 command is the inverted 2nd start bit
#endif
#if IRMP_SUPPORT_MANCHESTER == 1
    static PAUSE_LEN        last_pause;                                             // last pause value
#endif
#if IRMP_SUPPORT_MANCHESTER == 1 || IRMP_SUPPORT_BANG_OLUFSEN_PROTOCOL == 1
    static uint_fast8_t     last_value;                                             // last bit value
#endif
    uint_fast8_t            irmp_input;                                             // input value

#ifdef ANALYZE
    time_counter++;
#endif // ANALYZE

#if defined(__SDCC_stm8)
    irmp_input = input(IRMP_GPIO_STRUCT->IDR)
#elif defined(__MBED__)
    //irmp_input = inputPin;
    irmp_input = gpio_read (&gpioIRin);
#else
    irmp_input = gpio_read(IRMP_BIT_NUMBER);
#endif

#if IRMP_USE_CALLBACK == 1
    if (irmp_callback_ptr)
    {
        static uint_fast8_t last_inverted_input;

        if (last_inverted_input != !irmp_input)
        {
            (*irmp_callback_ptr) (! irmp_input);
            last_inverted_input = !irmp_input;
        }
    }
#endif // IRMP_USE_CALLBACK == 1

    irmp_log(irmp_input);                                                       // log ir signal, if IRMP_LOGGING defined

    if (! irmp_ir_detected)                                                     // ir code already detected?
    {                                                                           // no...
        if (! irmp_start_bit_detected)                                          // start bit detected?
        {                                                                       // no...
            if (! irmp_input)                                                   // receiving burst?
            {                                                                   // yes...
//              irmp_busy_flag = TRUE;
#ifdef ANALYZE
                if (! irmp_pulse_time)
                {
                    ANALYZE_PRINTF("%8.3fms [starting pulse]\n", (double) (time_counter * 1000) / F_INTERRUPTS);
                }
#endif // ANALYZE
                irmp_pulse_time++;                                              // increment counter
            }
            else
            {                                                                   // no...
                if (irmp_pulse_time)                                            // it's dark....
                {                                                               // set flags for counting the time of darkness...
                    irmp_start_bit_detected = 1;
                    wait_for_start_space    = 1;
                    wait_for_space          = 0;
                    irmp_tmp_command        = 0;
                    irmp_tmp_address        = 0;
#if IRMP_SUPPORT_KASEIKYO_PROTOCOL == 1
                    genre2                  = 0;
#endif
#if IRMP_SUPPORT_SAMSUNG_PROTOCOL == 1
                    irmp_tmp_id = 0;
#endif

#if IRMP_SUPPORT_RC5_PROTOCOL == 1 && (IRMP_SUPPORT_FDC_PROTOCOL == 1 || IRMP_SUPPORT_RCCAR_PROTOCOL == 1) || IRMP_SUPPORT_NEC42_PROTOCOL == 1
                    irmp_tmp_command2       = 0;
                    irmp_tmp_address2       = 0;
#endif
#if IRMP_SUPPORT_LGAIR_PROTOCOL == 1
                    irmp_lgair_command      = 0;
                    irmp_lgair_address      = 0;
#endif
                    irmp_bit                = 0xff;
                    irmp_pause_time         = 1;                                // 1st pause: set to 1, not to 0!
#if IRMP_SUPPORT_RC5_PROTOCOL == 1 || IRMP_SUPPORT_S100_PROTOCOL == 1
                    rc5_cmd_bit6            = 0;                                // fm 2010-03-07: bugfix: reset it after incomplete RC5 frame!
#endif
                }
                else
                {
                    if (key_repetition_len < 0xFFFF)                            // avoid overflow of counter
                    {
                        key_repetition_len++;

#if IRMP_SUPPORT_DENON_PROTOCOL == 1
                        if (denon_repetition_len < 0xFFFF)                      // avoid overflow of counter
                        {
                            denon_repetition_len++;

                            if (denon_repetition_len >= DENON_AUTO_REPETITION_PAUSE_LEN && last_irmp_denon_command != 0)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("%8.3fms warning: did not receive inverted command repetition\n",
                                                (double) (time_counter * 1000) / F_INTERRUPTS);
#endif // ANALYZE
                                last_irmp_denon_command = 0;
                                denon_repetition_len = 0xFFFF;
                            }
                        }
#endif // IRMP_SUPPORT_DENON_PROTOCOL == 1
                    }
                }
            }
        }
        else
        {
            if (wait_for_start_space)                                           // we have received start bit...
            {                                                                   // ...and are counting the time of darkness
                if (irmp_input)                                                 // still dark?
                {                                                               // yes
                    irmp_pause_time++;                                          // increment counter

#if IRMP_SUPPORT_NIKON_PROTOCOL == 1
                    if (((irmp_pulse_time < NIKON_START_BIT_PULSE_LEN_MIN || irmp_pulse_time > NIKON_START_BIT_PULSE_LEN_MAX) && irmp_pause_time > IRMP_TIMEOUT_LEN) ||
                         irmp_pause_time > IRMP_TIMEOUT_NIKON_LEN)
#else
                    if (irmp_pause_time > IRMP_TIMEOUT_LEN)                     // timeout?
#endif
                    {                                                           // yes...
#if IRMP_SUPPORT_JVC_PROTOCOL == 1
                        if (irmp_protocol == IRMP_JVC_PROTOCOL)                 // don't show eror if JVC protocol, irmp_pulse_time has been set below!
                        {
                            ;
                        }
                        else
#endif // IRMP_SUPPORT_JVC_PROTOCOL == 1
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("%8.3fms error 1: pause after start bit pulse %d too long: %d\n", (double) (time_counter * 1000) / F_INTERRUPTS, irmp_pulse_time, irmp_pause_time);
                            ANALYZE_ONLY_NORMAL_PUTCHAR ('\n');
#endif // ANALYZE
                        }

                        irmp_start_bit_detected = 0;                            // reset flags, let's wait for another start bit
                        irmp_pulse_time         = 0;
                        irmp_pause_time         = 0;
                    }
                }
                else
                {                                                               // receiving first data pulse!
                    IRMP_PARAMETER * irmp_param_p;
                    irmp_param_p = (IRMP_PARAMETER *) 0;

#if IRMP_SUPPORT_RC5_PROTOCOL == 1 && (IRMP_SUPPORT_FDC_PROTOCOL == 1 || IRMP_SUPPORT_RCCAR_PROTOCOL == 1)
                    irmp_param2.protocol = 0;
#endif

#ifdef ANALYZE
                    ANALYZE_PRINTF ("%8.3fms [start-bit: pulse = %2d, pause = %2d]\n", (double) (time_counter * 1000) / F_INTERRUPTS, irmp_pulse_time, irmp_pause_time);
#endif // ANALYZE

#if IRMP_SUPPORT_SIRCS_PROTOCOL == 1
                    if (irmp_pulse_time >= SIRCS_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= SIRCS_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= SIRCS_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= SIRCS_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's SIRCS
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = SIRCS, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        SIRCS_START_BIT_PULSE_LEN_MIN, SIRCS_START_BIT_PULSE_LEN_MAX,
                                        SIRCS_START_BIT_PAUSE_LEN_MIN, SIRCS_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &sircs_param;
                    }
                    else
#endif // IRMP_SUPPORT_SIRCS_PROTOCOL == 1

#if IRMP_SUPPORT_JVC_PROTOCOL == 1
                    if (irmp_protocol == IRMP_JVC_PROTOCOL &&                                                       // last protocol was JVC, awaiting repeat frame
                        irmp_pulse_time >= JVC_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= JVC_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= JVC_REPEAT_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= JVC_REPEAT_START_BIT_PAUSE_LEN_MAX)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = NEC or JVC (type 1) repeat frame, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        JVC_START_BIT_PULSE_LEN_MIN, JVC_START_BIT_PULSE_LEN_MAX,
                                        JVC_REPEAT_START_BIT_PAUSE_LEN_MIN, JVC_REPEAT_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &nec_param;
                    }
                    else
#endif // IRMP_SUPPORT_JVC_PROTOCOL == 1

#if IRMP_SUPPORT_NEC_PROTOCOL == 1
                    if (irmp_pulse_time >= NEC_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= NEC_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= NEC_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= NEC_START_BIT_PAUSE_LEN_MAX)
                    {
#if IRMP_SUPPORT_NEC42_PROTOCOL == 1
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = NEC42, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        NEC_START_BIT_PULSE_LEN_MIN, NEC_START_BIT_PULSE_LEN_MAX,
                                        NEC_START_BIT_PAUSE_LEN_MIN, NEC_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &nec42_param;
#else
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = NEC, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        NEC_START_BIT_PULSE_LEN_MIN, NEC_START_BIT_PULSE_LEN_MAX,
                                        NEC_START_BIT_PAUSE_LEN_MIN, NEC_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &nec_param;
#endif
                    }
                    else if (irmp_pulse_time >= NEC_START_BIT_PULSE_LEN_MIN        && irmp_pulse_time <= NEC_START_BIT_PULSE_LEN_MAX &&
                             irmp_pause_time >= NEC_REPEAT_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= NEC_REPEAT_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's NEC
#if IRMP_SUPPORT_JVC_PROTOCOL == 1
                        if (irmp_protocol == IRMP_JVC_PROTOCOL)                 // last protocol was JVC, awaiting repeat frame
                        {                                                       // some jvc remote controls use nec repetition frame for jvc repetition frame
#ifdef ANALYZE
                            ANALYZE_PRINTF ("protocol = JVC repeat frame type 2, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                            NEC_START_BIT_PULSE_LEN_MIN, NEC_START_BIT_PULSE_LEN_MAX,
                                            NEC_REPEAT_START_BIT_PAUSE_LEN_MIN, NEC_REPEAT_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                            irmp_param_p = (IRMP_PARAMETER *) &nec_param;
                        }
                        else
#endif // IRMP_SUPPORT_JVC_PROTOCOL == 1
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("protocol = NEC (repetition frame), start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                            NEC_START_BIT_PULSE_LEN_MIN, NEC_START_BIT_PULSE_LEN_MAX,
                                            NEC_REPEAT_START_BIT_PAUSE_LEN_MIN, NEC_REPEAT_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE

                            irmp_param_p = (IRMP_PARAMETER *) &nec_rep_param;
                        }
                    }
                    else

#if IRMP_SUPPORT_JVC_PROTOCOL == 1
                    if (irmp_protocol == IRMP_JVC_PROTOCOL &&                   // last protocol was JVC, awaiting repeat frame
                        irmp_pulse_time >= NEC_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= NEC_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= NEC_0_PAUSE_LEN_MIN         && irmp_pause_time <= NEC_0_PAUSE_LEN_MAX)
                    {                                                           // it's JVC repetition type 3
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = JVC repeat frame type 3, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        NEC_START_BIT_PULSE_LEN_MIN, NEC_START_BIT_PULSE_LEN_MAX,
                                        NEC_0_PAUSE_LEN_MIN, NEC_0_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &nec_param;
                    }
                    else
#endif // IRMP_SUPPORT_JVC_PROTOCOL == 1

#endif // IRMP_SUPPORT_NEC_PROTOCOL == 1

#if IRMP_SUPPORT_TELEFUNKEN_PROTOCOL == 1
                    if (irmp_pulse_time >= TELEFUNKEN_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= TELEFUNKEN_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= TELEFUNKEN_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= TELEFUNKEN_START_BIT_PAUSE_LEN_MAX)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = TELEFUNKEN, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        TELEFUNKEN_START_BIT_PULSE_LEN_MIN, TELEFUNKEN_START_BIT_PULSE_LEN_MAX,
                                        TELEFUNKEN_START_BIT_PAUSE_LEN_MIN, TELEFUNKEN_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &telefunken_param;
                    }
                    else
#endif // IRMP_SUPPORT_TELEFUNKEN_PROTOCOL == 1

#if IRMP_SUPPORT_ROOMBA_PROTOCOL == 1
                    if (irmp_pulse_time >= ROOMBA_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= ROOMBA_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= ROOMBA_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= ROOMBA_START_BIT_PAUSE_LEN_MAX)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = ROOMBA, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        ROOMBA_START_BIT_PULSE_LEN_MIN, ROOMBA_START_BIT_PULSE_LEN_MAX,
                                        ROOMBA_START_BIT_PAUSE_LEN_MIN, ROOMBA_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &roomba_param;
                    }
                    else
#endif // IRMP_SUPPORT_ROOMBA_PROTOCOL == 1

#if IRMP_SUPPORT_ACP24_PROTOCOL == 1
                    if (irmp_pulse_time >= ACP24_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= ACP24_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= ACP24_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= ACP24_START_BIT_PAUSE_LEN_MAX)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = ACP24, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        ACP24_START_BIT_PULSE_LEN_MIN, ACP24_START_BIT_PULSE_LEN_MAX,
                                        ACP24_START_BIT_PAUSE_LEN_MIN, ACP24_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &acp24_param;
                    }
                    else
#endif // IRMP_SUPPORT_ROOMBA_PROTOCOL == 1

#if IRMP_SUPPORT_PENTAX_PROTOCOL == 1
                    if (irmp_pulse_time >= PENTAX_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= PENTAX_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= PENTAX_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= PENTAX_START_BIT_PAUSE_LEN_MAX)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = PENTAX, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        PENTAX_START_BIT_PULSE_LEN_MIN, PENTAX_START_BIT_PULSE_LEN_MAX,
                                        PENTAX_START_BIT_PAUSE_LEN_MIN, PENTAX_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &pentax_param;
                    }
                    else
#endif // IRMP_SUPPORT_PENTAX_PROTOCOL == 1

#if IRMP_SUPPORT_NIKON_PROTOCOL == 1
                    if (irmp_pulse_time >= NIKON_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= NIKON_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= NIKON_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= NIKON_START_BIT_PAUSE_LEN_MAX)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = NIKON, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        NIKON_START_BIT_PULSE_LEN_MIN, NIKON_START_BIT_PULSE_LEN_MAX,
                                        NIKON_START_BIT_PAUSE_LEN_MIN, NIKON_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &nikon_param;
                    }
                    else
#endif // IRMP_SUPPORT_NIKON_PROTOCOL == 1

#if IRMP_SUPPORT_SAMSUNG_PROTOCOL == 1
                    if (irmp_pulse_time >= SAMSUNG_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= SAMSUNG_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= SAMSUNG_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= SAMSUNG_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's SAMSUNG
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = SAMSUNG, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        SAMSUNG_START_BIT_PULSE_LEN_MIN, SAMSUNG_START_BIT_PULSE_LEN_MAX,
                                        SAMSUNG_START_BIT_PAUSE_LEN_MIN, SAMSUNG_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &samsung_param;
                    }
                    else
#endif // IRMP_SUPPORT_SAMSUNG_PROTOCOL == 1

#if IRMP_SUPPORT_SAMSUNGAH_PROTOCOL == 1
                    if (irmp_pulse_time >= SAMSUNGAH_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= SAMSUNGAH_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= SAMSUNGAH_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= SAMSUNGAH_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's SAMSUNGAH
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = SAMSUNGAH, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        SAMSUNGAH_START_BIT_PULSE_LEN_MIN, SAMSUNGAH_START_BIT_PULSE_LEN_MAX,
                                        SAMSUNGAH_START_BIT_PAUSE_LEN_MIN, SAMSUNGAH_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &samsungah_param;
                    }
                    else
#endif // IRMP_SUPPORT_SAMSUNGAH_PROTOCOL == 1

#if IRMP_SUPPORT_MATSUSHITA_PROTOCOL == 1
                    if (irmp_pulse_time >= MATSUSHITA_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= MATSUSHITA_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= MATSUSHITA_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= MATSUSHITA_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's MATSUSHITA
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = MATSUSHITA, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        MATSUSHITA_START_BIT_PULSE_LEN_MIN, MATSUSHITA_START_BIT_PULSE_LEN_MAX,
                                        MATSUSHITA_START_BIT_PAUSE_LEN_MIN, MATSUSHITA_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &matsushita_param;
                    }
                    else
#endif // IRMP_SUPPORT_MATSUSHITA_PROTOCOL == 1

#if IRMP_SUPPORT_KASEIKYO_PROTOCOL == 1
                    if (irmp_pulse_time >= KASEIKYO_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= KASEIKYO_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= KASEIKYO_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= KASEIKYO_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's KASEIKYO
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = KASEIKYO, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        KASEIKYO_START_BIT_PULSE_LEN_MIN, KASEIKYO_START_BIT_PULSE_LEN_MAX,
                                        KASEIKYO_START_BIT_PAUSE_LEN_MIN, KASEIKYO_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &kaseikyo_param;
                    }
                    else
#endif // IRMP_SUPPORT_KASEIKYO_PROTOCOL == 1

#if IRMP_SUPPORT_PANASONIC_PROTOCOL == 1
                    if (irmp_pulse_time >= PANASONIC_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= PANASONIC_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= PANASONIC_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= PANASONIC_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's PANASONIC
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = PANASONIC, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        PANASONIC_START_BIT_PULSE_LEN_MIN, PANASONIC_START_BIT_PULSE_LEN_MAX,
                                        PANASONIC_START_BIT_PAUSE_LEN_MIN, PANASONIC_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &panasonic_param;
                    }
                    else
#endif // IRMP_SUPPORT_PANASONIC_PROTOCOL == 1

#if IRMP_SUPPORT_MITSU_HEAVY_PROTOCOL == 1
                    if (irmp_pulse_time >= MITSU_HEAVY_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= MITSU_HEAVY_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= MITSU_HEAVY_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= MITSU_HEAVY_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's MITSU_HEAVY
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = MITSU_HEAVY, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        MITSU_HEAVY_START_BIT_PULSE_LEN_MIN, MITSU_HEAVY_START_BIT_PULSE_LEN_MAX,
                                        MITSU_HEAVY_START_BIT_PAUSE_LEN_MIN, MITSU_HEAVY_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &mitsu_heavy_param;
                    }
                    else
#endif // IRMP_SUPPORT_MITSU_HEAVY_PROTOCOL == 1

#if IRMP_SUPPORT_VINCENT_PROTOCOL == 1
                    if (irmp_pulse_time >= VINCENT_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= VINCENT_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= VINCENT_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= VINCENT_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's VINCENT
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = VINCENT, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        VINCENT_START_BIT_PULSE_LEN_MIN, VINCENT_START_BIT_PULSE_LEN_MAX,
                                        VINCENT_START_BIT_PAUSE_LEN_MIN, VINCENT_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &vincent_param;
                    }
                    else
#endif // IRMP_SUPPORT_VINCENT_PROTOCOL == 1

#if IRMP_SUPPORT_RADIO1_PROTOCOL == 1
                    if (irmp_pulse_time >= RADIO1_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= RADIO1_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= RADIO1_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= RADIO1_START_BIT_PAUSE_LEN_MAX)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = RADIO1, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        RADIO1_START_BIT_PULSE_LEN_MIN, RADIO1_START_BIT_PULSE_LEN_MAX,
                                        RADIO1_START_BIT_PAUSE_LEN_MIN, RADIO1_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &radio1_param;
                    }
                    else
#endif // IRMP_SUPPORT_RRADIO1_PROTOCOL == 1

#if IRMP_SUPPORT_RECS80_PROTOCOL == 1
                    if (irmp_pulse_time >= RECS80_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= RECS80_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= RECS80_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= RECS80_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's RECS80
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = RECS80, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        RECS80_START_BIT_PULSE_LEN_MIN, RECS80_START_BIT_PULSE_LEN_MAX,
                                        RECS80_START_BIT_PAUSE_LEN_MIN, RECS80_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &recs80_param;
                    }
                    else
#endif // IRMP_SUPPORT_RECS80_PROTOCOL == 1

#if IRMP_SUPPORT_S100_PROTOCOL == 1
                    if (((irmp_pulse_time >= S100_START_BIT_LEN_MIN     && irmp_pulse_time <= S100_START_BIT_LEN_MAX) ||
                         (irmp_pulse_time >= 2 * S100_START_BIT_LEN_MIN && irmp_pulse_time <= 2 * S100_START_BIT_LEN_MAX)) &&
                        ((irmp_pause_time >= S100_START_BIT_LEN_MIN     && irmp_pause_time <= S100_START_BIT_LEN_MAX) ||
                         (irmp_pause_time >= 2 * S100_START_BIT_LEN_MIN && irmp_pause_time <= 2 * S100_START_BIT_LEN_MAX)))
                    {                                                           // it's S100
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = S100, start bit timings: pulse: %3d - %3d, pause: %3d - %3d or pulse: %3d - %3d, pause: %3d - %3d\n",
                                        S100_START_BIT_LEN_MIN, S100_START_BIT_LEN_MAX,
                                        2 * S100_START_BIT_LEN_MIN, 2 * S100_START_BIT_LEN_MAX,
                                        S100_START_BIT_LEN_MIN, S100_START_BIT_LEN_MAX,
                                        2 * S100_START_BIT_LEN_MIN, 2 * S100_START_BIT_LEN_MAX);
#endif // ANALYZE

                        irmp_param_p = (IRMP_PARAMETER *) &s100_param;
                        last_pause = irmp_pause_time;

                        if ((irmp_pulse_time > S100_START_BIT_LEN_MAX && irmp_pulse_time <= 2 * S100_START_BIT_LEN_MAX) ||
                            (irmp_pause_time > S100_START_BIT_LEN_MAX && irmp_pause_time <= 2 * S100_START_BIT_LEN_MAX))
                        {
                          last_value  = 0;
                          rc5_cmd_bit6 = 1<<6;
                        }
                        else
                        {
                          last_value  = 1;
                        }
                    }
                    else
#endif // IRMP_SUPPORT_S100_PROTOCOL == 1

#if IRMP_SUPPORT_RC5_PROTOCOL == 1
                    if (((irmp_pulse_time >= RC5_START_BIT_LEN_MIN     && irmp_pulse_time <= RC5_START_BIT_LEN_MAX) ||
                         (irmp_pulse_time >= 2 * RC5_START_BIT_LEN_MIN && irmp_pulse_time <= 2 * RC5_START_BIT_LEN_MAX)) &&
                        ((irmp_pause_time >= RC5_START_BIT_LEN_MIN     && irmp_pause_time <= RC5_START_BIT_LEN_MAX) ||
                         (irmp_pause_time >= 2 * RC5_START_BIT_LEN_MIN && irmp_pause_time <= 2 * RC5_START_BIT_LEN_MAX)))
                    {                                                           // it's RC5
#if IRMP_SUPPORT_FDC_PROTOCOL == 1
                        if (irmp_pulse_time >= FDC_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= FDC_START_BIT_PULSE_LEN_MAX &&
                            irmp_pause_time >= FDC_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= FDC_START_BIT_PAUSE_LEN_MAX)
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("protocol = RC5 or FDC\n");
                            ANALYZE_PRINTF ("FDC start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                            FDC_START_BIT_PULSE_LEN_MIN, FDC_START_BIT_PULSE_LEN_MAX,
                                            FDC_START_BIT_PAUSE_LEN_MIN, FDC_START_BIT_PAUSE_LEN_MAX);
                            ANALYZE_PRINTF ("RC5 start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                            RC5_START_BIT_LEN_MIN, RC5_START_BIT_LEN_MAX,
                                            RC5_START_BIT_LEN_MIN, RC5_START_BIT_LEN_MAX);
#endif // ANALYZE
                            memcpy_P (&irmp_param2, &fdc_param, sizeof (IRMP_PARAMETER));
                        }
                        else
#endif // IRMP_SUPPORT_FDC_PROTOCOL == 1

#if IRMP_SUPPORT_RCCAR_PROTOCOL == 1
                        if (irmp_pulse_time >= RCCAR_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= RCCAR_START_BIT_PULSE_LEN_MAX &&
                            irmp_pause_time >= RCCAR_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= RCCAR_START_BIT_PAUSE_LEN_MAX)
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("protocol = RC5 or RCCAR\n");
                            ANALYZE_PRINTF ("RCCAR start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                            RCCAR_START_BIT_PULSE_LEN_MIN, RCCAR_START_BIT_PULSE_LEN_MAX,
                                            RCCAR_START_BIT_PAUSE_LEN_MIN, RCCAR_START_BIT_PAUSE_LEN_MAX);
                            ANALYZE_PRINTF ("RC5 start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                            RC5_START_BIT_LEN_MIN, RC5_START_BIT_LEN_MAX,
                                            RC5_START_BIT_LEN_MIN, RC5_START_BIT_LEN_MAX);
#endif // ANALYZE
                            memcpy_P (&irmp_param2, &rccar_param, sizeof (IRMP_PARAMETER));
                        }
                        else
#endif // IRMP_SUPPORT_RCCAR_PROTOCOL == 1
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("protocol = RC5, start bit timings: pulse: %3d - %3d, pause: %3d - %3d or pulse: %3d - %3d, pause: %3d - %3d\n",
                                            RC5_START_BIT_LEN_MIN, RC5_START_BIT_LEN_MAX,
                                            2 * RC5_START_BIT_LEN_MIN, 2 * RC5_START_BIT_LEN_MAX,
                                            RC5_START_BIT_LEN_MIN, RC5_START_BIT_LEN_MAX,
                                            2 * RC5_START_BIT_LEN_MIN, 2 * RC5_START_BIT_LEN_MAX);
#endif // ANALYZE
                        }

                        irmp_param_p = (IRMP_PARAMETER *) &rc5_param;
                        last_pause = irmp_pause_time;

                        if ((irmp_pulse_time > RC5_START_BIT_LEN_MAX && irmp_pulse_time <= 2 * RC5_START_BIT_LEN_MAX) ||
                            (irmp_pause_time > RC5_START_BIT_LEN_MAX && irmp_pause_time <= 2 * RC5_START_BIT_LEN_MAX))
                        {
                          last_value  = 0;
                          rc5_cmd_bit6 = 1<<6;
                        }
                        else
                        {
                          last_value  = 1;
                        }
                    }
                    else
#endif // IRMP_SUPPORT_RC5_PROTOCOL == 1

#if IRMP_SUPPORT_DENON_PROTOCOL == 1
                    if ( (irmp_pulse_time >= DENON_PULSE_LEN_MIN && irmp_pulse_time <= DENON_PULSE_LEN_MAX) &&
                        ((irmp_pause_time >= DENON_1_PAUSE_LEN_MIN && irmp_pause_time <= DENON_1_PAUSE_LEN_MAX) ||
                         (irmp_pause_time >= DENON_0_PAUSE_LEN_MIN && irmp_pause_time <= DENON_0_PAUSE_LEN_MAX)))
                    {                                                           // it's DENON
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = DENON, start bit timings: pulse: %3d - %3d, pause: %3d - %3d or %3d - %3d\n",
                                        DENON_PULSE_LEN_MIN, DENON_PULSE_LEN_MAX,
                                        DENON_1_PAUSE_LEN_MIN, DENON_1_PAUSE_LEN_MAX,
                                        DENON_0_PAUSE_LEN_MIN, DENON_0_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &denon_param;
                    }
                    else
#endif // IRMP_SUPPORT_DENON_PROTOCOL == 1

#if IRMP_SUPPORT_THOMSON_PROTOCOL == 1
                    if ( (irmp_pulse_time >= THOMSON_PULSE_LEN_MIN && irmp_pulse_time <= THOMSON_PULSE_LEN_MAX) &&
                        ((irmp_pause_time >= THOMSON_1_PAUSE_LEN_MIN && irmp_pause_time <= THOMSON_1_PAUSE_LEN_MAX) ||
                         (irmp_pause_time >= THOMSON_0_PAUSE_LEN_MIN && irmp_pause_time <= THOMSON_0_PAUSE_LEN_MAX)))
                    {                                                           // it's THOMSON
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = THOMSON, start bit timings: pulse: %3d - %3d, pause: %3d - %3d or %3d - %3d\n",
                                        THOMSON_PULSE_LEN_MIN, THOMSON_PULSE_LEN_MAX,
                                        THOMSON_1_PAUSE_LEN_MIN, THOMSON_1_PAUSE_LEN_MAX,
                                        THOMSON_0_PAUSE_LEN_MIN, THOMSON_0_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &thomson_param;
                    }
                    else
#endif // IRMP_SUPPORT_THOMSON_PROTOCOL == 1

#if IRMP_SUPPORT_BOSE_PROTOCOL == 1
                    if (irmp_pulse_time >= BOSE_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= BOSE_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= BOSE_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= BOSE_START_BIT_PAUSE_LEN_MAX)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = BOSE, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        BOSE_START_BIT_PULSE_LEN_MIN, BOSE_START_BIT_PULSE_LEN_MAX,
                                        BOSE_START_BIT_PAUSE_LEN_MIN, BOSE_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &bose_param;
                    }
                    else
#endif // IRMP_SUPPORT_BOSE_PROTOCOL == 1

#if IRMP_SUPPORT_RC6_PROTOCOL == 1
                    if (irmp_pulse_time >= RC6_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= RC6_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= RC6_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= RC6_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's RC6
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = RC6, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        RC6_START_BIT_PULSE_LEN_MIN, RC6_START_BIT_PULSE_LEN_MAX,
                                        RC6_START_BIT_PAUSE_LEN_MIN, RC6_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &rc6_param;
                        last_pause = 0;
                        last_value = 1;
                    }
                    else
#endif // IRMP_SUPPORT_RC6_PROTOCOL == 1

#if IRMP_SUPPORT_RECS80EXT_PROTOCOL == 1
                    if (irmp_pulse_time >= RECS80EXT_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= RECS80EXT_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= RECS80EXT_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= RECS80EXT_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's RECS80EXT
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = RECS80EXT, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        RECS80EXT_START_BIT_PULSE_LEN_MIN, RECS80EXT_START_BIT_PULSE_LEN_MAX,
                                        RECS80EXT_START_BIT_PAUSE_LEN_MIN, RECS80EXT_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &recs80ext_param;
                    }
                    else
#endif // IRMP_SUPPORT_RECS80EXT_PROTOCOL == 1

#if IRMP_SUPPORT_NUBERT_PROTOCOL == 1
                    if (irmp_pulse_time >= NUBERT_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= NUBERT_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= NUBERT_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= NUBERT_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's NUBERT
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = NUBERT, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        NUBERT_START_BIT_PULSE_LEN_MIN, NUBERT_START_BIT_PULSE_LEN_MAX,
                                        NUBERT_START_BIT_PAUSE_LEN_MIN, NUBERT_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &nubert_param;
                    }
                    else
#endif // IRMP_SUPPORT_NUBERT_PROTOCOL == 1

#if IRMP_SUPPORT_FAN_PROTOCOL == 1
                    if (irmp_pulse_time >= FAN_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= FAN_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= FAN_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= FAN_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's FAN
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = FAN, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        FAN_START_BIT_PULSE_LEN_MIN, FAN_START_BIT_PULSE_LEN_MAX,
                                        FAN_START_BIT_PAUSE_LEN_MIN, FAN_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &fan_param;
                    }
                    else
#endif // IRMP_SUPPORT_FAN_PROTOCOL == 1

#if IRMP_SUPPORT_SPEAKER_PROTOCOL == 1
                    if (irmp_pulse_time >= SPEAKER_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= SPEAKER_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= SPEAKER_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= SPEAKER_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's SPEAKER
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = SPEAKER, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        SPEAKER_START_BIT_PULSE_LEN_MIN, SPEAKER_START_BIT_PULSE_LEN_MAX,
                                        SPEAKER_START_BIT_PAUSE_LEN_MIN, SPEAKER_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &speaker_param;
                    }
                    else
#endif // IRMP_SUPPORT_SPEAKER_PROTOCOL == 1

#if IRMP_SUPPORT_BANG_OLUFSEN_PROTOCOL == 1
                    if (irmp_pulse_time >= BANG_OLUFSEN_START_BIT1_PULSE_LEN_MIN && irmp_pulse_time <= BANG_OLUFSEN_START_BIT1_PULSE_LEN_MAX &&
                        irmp_pause_time >= BANG_OLUFSEN_START_BIT1_PAUSE_LEN_MIN && irmp_pause_time <= BANG_OLUFSEN_START_BIT1_PAUSE_LEN_MAX)
                    {                                                           // it's BANG_OLUFSEN
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = BANG_OLUFSEN\n");
                        ANALYZE_PRINTF ("start bit 1 timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        BANG_OLUFSEN_START_BIT1_PULSE_LEN_MIN, BANG_OLUFSEN_START_BIT1_PULSE_LEN_MAX,
                                        BANG_OLUFSEN_START_BIT1_PAUSE_LEN_MIN, BANG_OLUFSEN_START_BIT1_PAUSE_LEN_MAX);
                        ANALYZE_PRINTF ("start bit 2 timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        BANG_OLUFSEN_START_BIT2_PULSE_LEN_MIN, BANG_OLUFSEN_START_BIT2_PULSE_LEN_MAX,
                                        BANG_OLUFSEN_START_BIT2_PAUSE_LEN_MIN, BANG_OLUFSEN_START_BIT2_PAUSE_LEN_MAX);
                        ANALYZE_PRINTF ("start bit 3 timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        BANG_OLUFSEN_START_BIT3_PULSE_LEN_MIN, BANG_OLUFSEN_START_BIT3_PULSE_LEN_MAX,
                                        BANG_OLUFSEN_START_BIT3_PAUSE_LEN_MIN, BANG_OLUFSEN_START_BIT3_PAUSE_LEN_MAX);
                        ANALYZE_PRINTF ("start bit 4 timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        BANG_OLUFSEN_START_BIT4_PULSE_LEN_MIN, BANG_OLUFSEN_START_BIT4_PULSE_LEN_MAX,
                                        BANG_OLUFSEN_START_BIT4_PAUSE_LEN_MIN, BANG_OLUFSEN_START_BIT4_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &bang_olufsen_param;
                        last_value = 0;
                    }
                    else
#endif // IRMP_SUPPORT_BANG_OLUFSEN_PROTOCOL == 1

#if IRMP_SUPPORT_GRUNDIG_NOKIA_IR60_PROTOCOL == 1
                    if (irmp_pulse_time >= GRUNDIG_NOKIA_IR60_START_BIT_LEN_MIN && irmp_pulse_time <= GRUNDIG_NOKIA_IR60_START_BIT_LEN_MAX &&
                        irmp_pause_time >= GRUNDIG_NOKIA_IR60_PRE_PAUSE_LEN_MIN && irmp_pause_time <= GRUNDIG_NOKIA_IR60_PRE_PAUSE_LEN_MAX)
                    {                                                           // it's GRUNDIG
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = GRUNDIG, pre bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        GRUNDIG_NOKIA_IR60_START_BIT_LEN_MIN, GRUNDIG_NOKIA_IR60_START_BIT_LEN_MAX,
                                        GRUNDIG_NOKIA_IR60_PRE_PAUSE_LEN_MIN, GRUNDIG_NOKIA_IR60_PRE_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &grundig_param;
                        last_pause = irmp_pause_time;
                        last_value  = 1;
                    }
                    else
#endif // IRMP_SUPPORT_GRUNDIG_NOKIA_IR60_PROTOCOL == 1

#if IRMP_SUPPORT_MERLIN_PROTOCOL == 1 // check MERLIN before RUWIDO!
                    if (irmp_pulse_time >= MERLIN_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= MERLIN_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= MERLIN_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= MERLIN_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's MERLIN
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = MERLIN, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        MERLIN_START_BIT_PULSE_LEN_MIN, MERLIN_START_BIT_PULSE_LEN_MAX,
                                        MERLIN_START_BIT_PAUSE_LEN_MIN, MERLIN_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &merlin_param;
                        last_pause = 0;
                        last_value = 1;
                    }
                    else
#endif // IRMP_SUPPORT_MERLIN_PROTOCOL == 1

#if IRMP_SUPPORT_SIEMENS_OR_RUWIDO_PROTOCOL == 1
                    if (((irmp_pulse_time >= SIEMENS_OR_RUWIDO_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= SIEMENS_OR_RUWIDO_START_BIT_PULSE_LEN_MAX) ||
                         (irmp_pulse_time >= 2 * SIEMENS_OR_RUWIDO_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= 2 * SIEMENS_OR_RUWIDO_START_BIT_PULSE_LEN_MAX)) &&
                        ((irmp_pause_time >= SIEMENS_OR_RUWIDO_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= SIEMENS_OR_RUWIDO_START_BIT_PAUSE_LEN_MAX) ||
                         (irmp_pause_time >= 2 * SIEMENS_OR_RUWIDO_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= 2 * SIEMENS_OR_RUWIDO_START_BIT_PAUSE_LEN_MAX)))
                    {                                                           // it's RUWIDO or SIEMENS
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = RUWIDO, start bit timings: pulse: %3d - %3d or %3d - %3d, pause: %3d - %3d or %3d - %3d\n",
                                        SIEMENS_OR_RUWIDO_START_BIT_PULSE_LEN_MIN,   SIEMENS_OR_RUWIDO_START_BIT_PULSE_LEN_MAX,
                                        2 * SIEMENS_OR_RUWIDO_START_BIT_PULSE_LEN_MIN, 2 * SIEMENS_OR_RUWIDO_START_BIT_PULSE_LEN_MAX,
                                        SIEMENS_OR_RUWIDO_START_BIT_PAUSE_LEN_MIN,   SIEMENS_OR_RUWIDO_START_BIT_PAUSE_LEN_MAX,
                                        2 * SIEMENS_OR_RUWIDO_START_BIT_PAUSE_LEN_MIN, 2 * SIEMENS_OR_RUWIDO_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &ruwido_param;
                        last_pause = irmp_pause_time;
                        last_value  = 1;
                    }
                    else
#endif // IRMP_SUPPORT_SIEMENS_OR_RUWIDO_PROTOCOL == 1

#if IRMP_SUPPORT_FDC_PROTOCOL == 1
                    if (irmp_pulse_time >= FDC_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= FDC_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= FDC_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= FDC_START_BIT_PAUSE_LEN_MAX)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = FDC, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        FDC_START_BIT_PULSE_LEN_MIN, FDC_START_BIT_PULSE_LEN_MAX,
                                        FDC_START_BIT_PAUSE_LEN_MIN, FDC_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &fdc_param;
                    }
                    else
#endif // IRMP_SUPPORT_FDC_PROTOCOL == 1

#if IRMP_SUPPORT_RCCAR_PROTOCOL == 1
                    if (irmp_pulse_time >= RCCAR_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= RCCAR_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= RCCAR_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= RCCAR_START_BIT_PAUSE_LEN_MAX)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = RCCAR, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        RCCAR_START_BIT_PULSE_LEN_MIN, RCCAR_START_BIT_PULSE_LEN_MAX,
                                        RCCAR_START_BIT_PAUSE_LEN_MIN, RCCAR_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &rccar_param;
                    }
                    else
#endif // IRMP_SUPPORT_RCCAR_PROTOCOL == 1

#if IRMP_SUPPORT_KATHREIN_PROTOCOL == 1
                    if (irmp_pulse_time >= KATHREIN_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= KATHREIN_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= KATHREIN_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= KATHREIN_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's KATHREIN
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = KATHREIN, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        KATHREIN_START_BIT_PULSE_LEN_MIN, KATHREIN_START_BIT_PULSE_LEN_MAX,
                                        KATHREIN_START_BIT_PAUSE_LEN_MIN, KATHREIN_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &kathrein_param;
                    }
                    else
#endif // IRMP_SUPPORT_KATHREIN_PROTOCOL == 1

#if IRMP_SUPPORT_NETBOX_PROTOCOL == 1
                    if (irmp_pulse_time >= NETBOX_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= NETBOX_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= NETBOX_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= NETBOX_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's NETBOX
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = NETBOX, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        NETBOX_START_BIT_PULSE_LEN_MIN, NETBOX_START_BIT_PULSE_LEN_MAX,
                                        NETBOX_START_BIT_PAUSE_LEN_MIN, NETBOX_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &netbox_param;
                    }
                    else
#endif // IRMP_SUPPORT_NETBOX_PROTOCOL == 1

#if IRMP_SUPPORT_LEGO_PROTOCOL == 1
                    if (irmp_pulse_time >= LEGO_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= LEGO_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= LEGO_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= LEGO_START_BIT_PAUSE_LEN_MAX)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = LEGO, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        LEGO_START_BIT_PULSE_LEN_MIN, LEGO_START_BIT_PULSE_LEN_MAX,
                                        LEGO_START_BIT_PAUSE_LEN_MIN, LEGO_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &lego_param;
                    }
                    else
#endif // IRMP_SUPPORT_LEGO_PROTOCOL == 1

#if IRMP_SUPPORT_A1TVBOX_PROTOCOL == 1
                    if (irmp_pulse_time >= A1TVBOX_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= A1TVBOX_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= A1TVBOX_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= A1TVBOX_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's A1TVBOX
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = A1TVBOX, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        A1TVBOX_START_BIT_PULSE_LEN_MIN, A1TVBOX_START_BIT_PULSE_LEN_MAX,
                                        A1TVBOX_START_BIT_PAUSE_LEN_MIN, A1TVBOX_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &a1tvbox_param;
                        last_pause = 0;
                        last_value = 1;
                    }
                    else
#endif // IRMP_SUPPORT_A1TVBOX_PROTOCOL == 1

#if IRMP_SUPPORT_ORTEK_PROTOCOL == 1
                    if (irmp_pulse_time >= ORTEK_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= ORTEK_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= ORTEK_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= ORTEK_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's ORTEK (Hama)
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = ORTEK, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        ORTEK_START_BIT_PULSE_LEN_MIN, ORTEK_START_BIT_PULSE_LEN_MAX,
                                        ORTEK_START_BIT_PAUSE_LEN_MIN, ORTEK_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &ortek_param;
                        last_pause  = 0;
                        last_value  = 1;
                        parity      = 0;
                    }
                    else
#endif // IRMP_SUPPORT_ORTEK_PROTOCOL == 1

#if IRMP_SUPPORT_RCMM_PROTOCOL == 1
                    if (irmp_pulse_time >= RCMM32_START_BIT_PULSE_LEN_MIN && irmp_pulse_time <= RCMM32_START_BIT_PULSE_LEN_MAX &&
                        irmp_pause_time >= RCMM32_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= RCMM32_START_BIT_PAUSE_LEN_MAX)
                    {                                                           // it's RCMM
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = RCMM, start bit timings: pulse: %3d - %3d, pause: %3d - %3d\n",
                                        RCMM32_START_BIT_PULSE_LEN_MIN, RCMM32_START_BIT_PULSE_LEN_MAX,
                                        RCMM32_START_BIT_PAUSE_LEN_MIN, RCMM32_START_BIT_PAUSE_LEN_MAX);
#endif // ANALYZE
                        irmp_param_p = (IRMP_PARAMETER *) &rcmm_param;
                    }
                    else
#endif // IRMP_SUPPORT_RCMM_PROTOCOL == 1
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("protocol = UNKNOWN\n");
#endif // ANALYZE
                        irmp_start_bit_detected = 0;                            // wait for another start bit...
                    }

                    if (irmp_start_bit_detected)
                    {
                        memcpy_P (&irmp_param, irmp_param_p, sizeof (IRMP_PARAMETER));

                        if (! (irmp_param.flags & IRMP_PARAM_FLAG_IS_MANCHESTER))
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("pulse_1: %3d - %3d\n", irmp_param.pulse_1_len_min, irmp_param.pulse_1_len_max);
                            ANALYZE_PRINTF ("pause_1: %3d - %3d\n", irmp_param.pause_1_len_min, irmp_param.pause_1_len_max);
#endif // ANALYZE
                        }
                        else
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("pulse: %3d - %3d or %3d - %3d\n", irmp_param.pulse_1_len_min, irmp_param.pulse_1_len_max,
                                            2 * irmp_param.pulse_1_len_min, 2 * irmp_param.pulse_1_len_max);
                            ANALYZE_PRINTF ("pause: %3d - %3d or %3d - %3d\n", irmp_param.pause_1_len_min, irmp_param.pause_1_len_max,
                                            2 * irmp_param.pause_1_len_min, 2 * irmp_param.pause_1_len_max);
#endif // ANALYZE
                        }

#if IRMP_SUPPORT_RC5_PROTOCOL == 1 && (IRMP_SUPPORT_FDC_PROTOCOL == 1 || IRMP_SUPPORT_RCCAR_PROTOCOL == 1)
                        if (irmp_param2.protocol)
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("pulse_0: %3d - %3d\n", irmp_param2.pulse_0_len_min, irmp_param2.pulse_0_len_max);
                            ANALYZE_PRINTF ("pause_0: %3d - %3d\n", irmp_param2.pause_0_len_min, irmp_param2.pause_0_len_max);
                            ANALYZE_PRINTF ("pulse_1: %3d - %3d\n", irmp_param2.pulse_1_len_min, irmp_param2.pulse_1_len_max);
                            ANALYZE_PRINTF ("pause_1: %3d - %3d\n", irmp_param2.pause_1_len_min, irmp_param2.pause_1_len_max);
#endif // ANALYZE
                        }
#endif


#if IRMP_SUPPORT_RC6_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_RC6_PROTOCOL)
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("pulse_toggle: %3d - %3d\n", RC6_TOGGLE_BIT_LEN_MIN, RC6_TOGGLE_BIT_LEN_MAX);
#endif // ANALYZE
                        }
#endif

                        if (! (irmp_param.flags & IRMP_PARAM_FLAG_IS_MANCHESTER))
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("pulse_0: %3d - %3d\n", irmp_param.pulse_0_len_min, irmp_param.pulse_0_len_max);
                            ANALYZE_PRINTF ("pause_0: %3d - %3d\n", irmp_param.pause_0_len_min, irmp_param.pause_0_len_max);
#endif // ANALYZE
                        }
                        else
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("pulse: %3d - %3d or %3d - %3d\n", irmp_param.pulse_0_len_min, irmp_param.pulse_0_len_max,
                                            2 * irmp_param.pulse_0_len_min, 2 * irmp_param.pulse_0_len_max);
                            ANALYZE_PRINTF ("pause: %3d - %3d or %3d - %3d\n", irmp_param.pause_0_len_min, irmp_param.pause_0_len_max,
                                            2 * irmp_param.pause_0_len_min, 2 * irmp_param.pause_0_len_max);
#endif // ANALYZE
                        }

#ifdef ANALYZE
#if IRMP_SUPPORT_BANG_OLUFSEN_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_BANG_OLUFSEN_PROTOCOL)
                        {
                            ANALYZE_PRINTF ("pulse_r: %3d - %3d\n", irmp_param.pulse_0_len_min, irmp_param.pulse_0_len_max);
                            ANALYZE_PRINTF ("pause_r: %3d - %3d\n", BANG_OLUFSEN_R_PAUSE_LEN_MIN, BANG_OLUFSEN_R_PAUSE_LEN_MAX);
                        }
#endif

                        ANALYZE_PRINTF ("command_offset: %2d\n", irmp_param.command_offset);
                        ANALYZE_PRINTF ("command_len:    %3d\n", irmp_param.command_end - irmp_param.command_offset);
                        ANALYZE_PRINTF ("complete_len:   %3d\n", irmp_param.complete_len);
                        ANALYZE_PRINTF ("stop_bit:       %3d\n", irmp_param.stop_bit);
#endif // ANALYZE
                    }

                    irmp_bit = 0;

#if IRMP_SUPPORT_MANCHESTER == 1
                    if ((irmp_param.flags & IRMP_PARAM_FLAG_IS_MANCHESTER) &&
                         irmp_param.protocol != IRMP_RUWIDO_PROTOCOL && // Manchester, but not RUWIDO
                         irmp_param.protocol != IRMP_RC6_PROTOCOL)      // Manchester, but not RC6
                    {
                        if (irmp_pause_time > irmp_param.pulse_1_len_max && irmp_pause_time <= 2 * irmp_param.pulse_1_len_max)
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("%8.3fms [bit %2d: pulse = %3d, pause = %3d] ", (double) (time_counter * 1000) / F_INTERRUPTS, irmp_bit, irmp_pulse_time, irmp_pause_time);
                            ANALYZE_PUTCHAR ((irmp_param.flags & IRMP_PARAM_FLAG_1ST_PULSE_IS_1) ? '0' : '1');
                            ANALYZE_NEWLINE ();
#endif // ANALYZE
                            irmp_store_bit ((irmp_param.flags & IRMP_PARAM_FLAG_1ST_PULSE_IS_1) ? 0 : 1);
                        }
                        else if (! last_value)  // && irmp_pause_time >= irmp_param.pause_1_len_min && irmp_pause_time <= irmp_param.pause_1_len_max)
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("%8.3fms [bit %2d: pulse = %3d, pause = %3d] ", (double) (time_counter * 1000) / F_INTERRUPTS, irmp_bit, irmp_pulse_time, irmp_pause_time);
                            ANALYZE_PUTCHAR ((irmp_param.flags & IRMP_PARAM_FLAG_1ST_PULSE_IS_1) ? '1' : '0');
                            ANALYZE_NEWLINE ();
#endif // ANALYZE
                            irmp_store_bit ((irmp_param.flags & IRMP_PARAM_FLAG_1ST_PULSE_IS_1) ? 1 : 0);
                        }
                    }
                    else
#endif // IRMP_SUPPORT_MANCHESTER == 1

#if IRMP_SUPPORT_SERIAL == 1
                    if (irmp_param.flags & IRMP_PARAM_FLAG_IS_SERIAL)
                    {
                        ; // do nothing
                    }
                    else
#endif // IRMP_SUPPORT_SERIAL == 1


#if IRMP_SUPPORT_DENON_PROTOCOL == 1
                    if (irmp_param.protocol == IRMP_DENON_PROTOCOL)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("%8.3fms [bit %2d: pulse = %3d, pause = %3d] ", (double) (time_counter * 1000) / F_INTERRUPTS, irmp_bit, irmp_pulse_time, irmp_pause_time);
#endif // ANALYZE

                        if (irmp_pause_time >= DENON_1_PAUSE_LEN_MIN && irmp_pause_time <= DENON_1_PAUSE_LEN_MAX)
                        {                                                       // pause timings correct for "1"?
#ifdef ANALYZE
                            ANALYZE_PUTCHAR ('1');                                  // yes, store 1
                            ANALYZE_NEWLINE ();
#endif // ANALYZE
                            irmp_store_bit (1);
                        }
                        else // if (irmp_pause_time >= DENON_0_PAUSE_LEN_MIN && irmp_pause_time <= DENON_0_PAUSE_LEN_MAX)
                        {                                                       // pause timings correct for "0"?
#ifdef ANALYZE
                            ANALYZE_PUTCHAR ('0');                                  // yes, store 0
                            ANALYZE_NEWLINE ();
#endif // ANALYZE
                            irmp_store_bit (0);
                        }
                    }
                    else
#endif // IRMP_SUPPORT_DENON_PROTOCOL == 1
#if IRMP_SUPPORT_THOMSON_PROTOCOL == 1
                    if (irmp_param.protocol == IRMP_THOMSON_PROTOCOL)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("%8.3fms [bit %2d: pulse = %3d, pause = %3d] ", (double) (time_counter * 1000) / F_INTERRUPTS, irmp_bit, irmp_pulse_time, irmp_pause_time);
#endif // ANALYZE

                        if (irmp_pause_time >= THOMSON_1_PAUSE_LEN_MIN && irmp_pause_time <= THOMSON_1_PAUSE_LEN_MAX)
                        {                                                       // pause timings correct for "1"?
#ifdef ANALYZE
                          ANALYZE_PUTCHAR ('1');                                  // yes, store 1
                          ANALYZE_NEWLINE ();
#endif // ANALYZE
                          irmp_store_bit (1);
                        }
                        else // if (irmp_pause_time >= THOMSON_0_PAUSE_LEN_MIN && irmp_pause_time <= THOMSON_0_PAUSE_LEN_MAX)
                        {                                                       // pause timings correct for "0"?
#ifdef ANALYZE
                          ANALYZE_PUTCHAR ('0');                                  // yes, store 0
                          ANALYZE_NEWLINE ();
#endif // ANALYZE
                          irmp_store_bit (0);
                        }
                    }
                    else
#endif // IRMP_SUPPORT_THOMSON_PROTOCOL == 1
                    {
                        ;                                                       // else do nothing
                    }

                    irmp_pulse_time = 1;                                        // set counter to 1, not 0
                    irmp_pause_time = 0;
                    wait_for_start_space = 0;
                }
            }
            else if (wait_for_space)                                            // the data section....
            {                                                                   // counting the time of darkness....
                uint_fast8_t got_light = FALSE;

                if (irmp_input)                                                 // still dark?
                {                                                               // yes...
                    if (irmp_bit == irmp_param.complete_len && irmp_param.stop_bit == 1)
                    {
                        if (
#if IRMP_SUPPORT_MANCHESTER == 1
                            (irmp_param.flags & IRMP_PARAM_FLAG_IS_MANCHESTER) ||
#endif
#if IRMP_SUPPORT_SERIAL == 1
                            (irmp_param.flags & IRMP_PARAM_FLAG_IS_SERIAL) ||
#endif
                            (irmp_pulse_time >= irmp_param.pulse_0_len_min && irmp_pulse_time <= irmp_param.pulse_0_len_max))
                        {
#ifdef ANALYZE
                            if (! (irmp_param.flags & IRMP_PARAM_FLAG_IS_MANCHESTER))
                            {
                                ANALYZE_PRINTF ("stop bit detected\n");
                            }
#endif // ANALYZE
                            irmp_param.stop_bit = 0;
                        }
                        else
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("error: stop bit timing wrong, irmp_bit = %d, irmp_pulse_time = %d, pulse_0_len_min = %d, pulse_0_len_max = %d\n",
                                            irmp_bit, irmp_pulse_time, irmp_param.pulse_0_len_min, irmp_param.pulse_0_len_max);
#endif // ANALYZE
                            irmp_start_bit_detected = 0;                        // wait for another start bit...
                            irmp_pulse_time         = 0;
                            irmp_pause_time         = 0;
                        }
                    }
                    else
                    {
                        irmp_pause_time++;                                                          // increment counter

#if IRMP_SUPPORT_SIRCS_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_SIRCS_PROTOCOL &&                           // Sony has a variable number of bits:
                            irmp_pause_time > SIRCS_PAUSE_LEN_MAX &&                                // minimum is 12
                            irmp_bit >= 12 - 1)                                                     // pause too long?
                        {                                                                           // yes, break and close this frame
                            irmp_param.complete_len = irmp_bit + 1;                                 // set new complete length
                            got_light = TRUE;                                                       // this is a lie, but helps (generates stop bit)
                            irmp_tmp_address |= (irmp_bit - SIRCS_MINIMUM_DATA_LEN + 1) << 8;       // new: store number of additional bits in upper byte of address!
                            irmp_param.command_end = irmp_param.command_offset + irmp_bit + 1;      // correct command length
                            irmp_pause_time = SIRCS_PAUSE_LEN_MAX - 1;                              // correct pause length
                        }
                        else
#endif
#if IRMP_SUPPORT_FAN_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_FAN_PROTOCOL &&                             // FAN has no stop bit.
                            irmp_bit >= FAN_COMPLETE_DATA_LEN - 1)                                  // last bit in frame
                        {                                                                           // yes, break and close this frame
                            if (irmp_pulse_time <= FAN_0_PULSE_LEN_MAX && irmp_pause_time >= FAN_0_PAUSE_LEN_MIN)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Generating virtual stop bit\n");
#endif // ANALYZE
                                got_light = TRUE;                                                   // this is a lie, but helps (generates stop bit)
                            }
                            else if (irmp_pulse_time >= FAN_1_PULSE_LEN_MIN && irmp_pause_time >= FAN_1_PAUSE_LEN_MIN)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Generating virtual stop bit\n");
#endif // ANALYZE
                                got_light = TRUE;                                                   // this is a lie, but helps (generates stop bit)
                            }
                        }
                        else
#endif
#if IRMP_SUPPORT_SERIAL == 1
                        // NETBOX generates no stop bit, here is the timeout condition:
                        if ((irmp_param.flags & IRMP_PARAM_FLAG_IS_SERIAL) && irmp_param.protocol == IRMP_NETBOX_PROTOCOL &&
                            irmp_pause_time >= NETBOX_PULSE_LEN * (NETBOX_COMPLETE_DATA_LEN - irmp_bit))
                        {
                            got_light = TRUE;                                                       // this is a lie, but helps (generates stop bit)
                        }
                        else
#endif
#if IRMP_SUPPORT_GRUNDIG_NOKIA_IR60_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_GRUNDIG_PROTOCOL && !irmp_param.stop_bit)
                        {
                            if (irmp_pause_time > IR60_TIMEOUT_LEN && (irmp_bit == 5 || irmp_bit == 6))
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Switching to IR60 protocol\n");
#endif // ANALYZE
                                got_light = TRUE;                                       // this is a lie, but generates a stop bit ;-)
                                irmp_param.stop_bit = TRUE;                             // set flag

                                irmp_param.protocol         = IRMP_IR60_PROTOCOL;       // change protocol
                                irmp_param.complete_len     = IR60_COMPLETE_DATA_LEN;   // correct complete len
                                irmp_param.address_offset   = IR60_ADDRESS_OFFSET;
                                irmp_param.address_end      = IR60_ADDRESS_OFFSET + IR60_ADDRESS_LEN;
                                irmp_param.command_offset   = IR60_COMMAND_OFFSET;
                                irmp_param.command_end      = IR60_COMMAND_OFFSET + IR60_COMMAND_LEN;

                                irmp_tmp_command <<= 1;
                                irmp_tmp_command |= first_bit;
                            }
                            else if (irmp_pause_time >= 2 * irmp_param.pause_1_len_max && irmp_bit >= GRUNDIG_COMPLETE_DATA_LEN - 2)
                            {                                                           // special manchester decoder
                                irmp_param.complete_len = GRUNDIG_COMPLETE_DATA_LEN;    // correct complete len
                                got_light = TRUE;                                       // this is a lie, but generates a stop bit ;-)
                                irmp_param.stop_bit = TRUE;                             // set flag
                            }
                            else if (irmp_bit >= GRUNDIG_COMPLETE_DATA_LEN)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Switching to NOKIA protocol, irmp_bit = %d\n", irmp_bit);
#endif // ANALYZE
                                irmp_param.protocol         = IRMP_NOKIA_PROTOCOL;      // change protocol
                                irmp_param.address_offset   = NOKIA_ADDRESS_OFFSET;
                                irmp_param.address_end      = NOKIA_ADDRESS_OFFSET + NOKIA_ADDRESS_LEN;
                                irmp_param.command_offset   = NOKIA_COMMAND_OFFSET;
                                irmp_param.command_end      = NOKIA_COMMAND_OFFSET + NOKIA_COMMAND_LEN;

                                if (irmp_tmp_command & 0x300)
                                {
                                    irmp_tmp_address = (irmp_tmp_command >> 8);
                                    irmp_tmp_command &= 0xFF;
                                }
                            }
                        }
                        else
#endif
#if IRMP_SUPPORT_SIEMENS_OR_RUWIDO_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_RUWIDO_PROTOCOL && !irmp_param.stop_bit)
                        {
                            if (irmp_pause_time >= 2 * irmp_param.pause_1_len_max && irmp_bit >= RUWIDO_COMPLETE_DATA_LEN - 2)
                            {                                                           // special manchester decoder
                                irmp_param.complete_len = RUWIDO_COMPLETE_DATA_LEN;     // correct complete len
                                got_light = TRUE;                                       // this is a lie, but generates a stop bit ;-)
                                irmp_param.stop_bit = TRUE;                             // set flag
                            }
                            else if (irmp_bit >= RUWIDO_COMPLETE_DATA_LEN)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Switching to SIEMENS protocol\n");
#endif // ANALYZE
                                irmp_param.protocol         = IRMP_SIEMENS_PROTOCOL;    // change protocol
                                irmp_param.address_offset   = SIEMENS_ADDRESS_OFFSET;
                                irmp_param.address_end      = SIEMENS_ADDRESS_OFFSET + SIEMENS_ADDRESS_LEN;
                                irmp_param.command_offset   = SIEMENS_COMMAND_OFFSET;
                                irmp_param.command_end      = SIEMENS_COMMAND_OFFSET + SIEMENS_COMMAND_LEN;

                                //                   76543210
                                // RUWIDO:  AAAAAAAAACCCCCCCp
                                // SIEMENS: AAAAAAAAAAACCCCCCCCCCp
                                irmp_tmp_address <<= 2;
                                irmp_tmp_address |= (irmp_tmp_command >> 6);
                                irmp_tmp_command &= 0x003F;
//                              irmp_tmp_command <<= 4;
                                irmp_tmp_command |= last_value;
                            }
                        }
                        else
#endif
#if IRMP_SUPPORT_ROOMBA_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_ROOMBA_PROTOCOL &&                          // Roomba has no stop bit
                            irmp_bit >= ROOMBA_COMPLETE_DATA_LEN - 1)                               // it's the last data bit...
                        {                                                                           // break and close this frame
                            if (irmp_pulse_time >= ROOMBA_1_PULSE_LEN_MIN && irmp_pulse_time <= ROOMBA_1_PULSE_LEN_MAX)
                            {
                                irmp_pause_time = ROOMBA_1_PAUSE_LEN_EXACT;
                            }
                            else if (irmp_pulse_time >= ROOMBA_0_PULSE_LEN_MIN && irmp_pulse_time <= ROOMBA_0_PULSE_LEN_MAX)
                            {
                                irmp_pause_time = ROOMBA_0_PAUSE_LEN;
                            }

                            got_light = TRUE;                                                       // this is a lie, but helps (generates stop bit)
                        }
                        else
#endif
#if IRMP_SUPPORT_MANCHESTER == 1
                        if ((irmp_param.flags & IRMP_PARAM_FLAG_IS_MANCHESTER) &&
                            irmp_pause_time >= 2 * irmp_param.pause_1_len_max && irmp_bit >= irmp_param.complete_len - 2 && !irmp_param.stop_bit)
                        {                                                       // special manchester decoder
                            got_light = TRUE;                                   // this is a lie, but generates a stop bit ;-)
                            irmp_param.stop_bit = TRUE;                         // set flag
                        }
                        else
#endif // IRMP_SUPPORT_MANCHESTER == 1
                        if (irmp_pause_time > IRMP_TIMEOUT_LEN)                 // timeout?
                        {                                                       // yes...
                            if (irmp_bit == irmp_param.complete_len - 1 && irmp_param.stop_bit == 0)
                            {
                                irmp_bit++;
                            }
#if IRMP_SUPPORT_NEC_PROTOCOL == 1
                            else if ((irmp_param.protocol == IRMP_NEC_PROTOCOL || irmp_param.protocol == IRMP_NEC42_PROTOCOL) && irmp_bit == 0)
                            {                                                               // it was a non-standard repetition frame
#ifdef ANALYZE                                                                              // with 4500µs pause instead of 2250µs
                                ANALYZE_PRINTF ("Detected non-standard repetition frame, switching to NEC repetition\n");
#endif // ANALYZE
                                if (key_repetition_len < NEC_FRAME_REPEAT_PAUSE_LEN_MAX)
                                {
                                    irmp_param.stop_bit     = TRUE;                         // set flag
                                    irmp_param.protocol     = IRMP_NEC_PROTOCOL;            // switch protocol
                                    irmp_param.complete_len = irmp_bit;                     // patch length: 16 or 17
                                    irmp_tmp_address = last_irmp_address;                   // address is last address
                                    irmp_tmp_command = last_irmp_command;                   // command is last command
                                    irmp_flags |= IRMP_FLAG_REPETITION;
                                    key_repetition_len = 0;
                                }
                                else
                                {
#ifdef ANALYZE
                                    ANALYZE_PRINTF ("ignoring NEC repetition frame: timeout occured, key_repetition_len = %d > %d\n",
                                                    key_repetition_len, NEC_FRAME_REPEAT_PAUSE_LEN_MAX);
#endif // ANALYZE
                                    irmp_ir_detected = FALSE;
                                }
                            }
#endif // IRMP_SUPPORT_NEC_PROTOCOL == 1
#if IRMP_SUPPORT_JVC_PROTOCOL == 1
                            else if (irmp_param.protocol == IRMP_NEC_PROTOCOL && (irmp_bit == 16 || irmp_bit == 17))      // it was a JVC stop bit
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Switching to JVC protocol, irmp_bit = %d\n", irmp_bit);
#endif // ANALYZE
                                irmp_param.stop_bit     = TRUE;                                     // set flag
                                irmp_param.protocol     = IRMP_JVC_PROTOCOL;                        // switch protocol
                                irmp_param.complete_len = irmp_bit;                                 // patch length: 16 or 17
                                irmp_tmp_command        = (irmp_tmp_address >> 4);                  // set command: upper 12 bits are command bits
                                irmp_tmp_address        = irmp_tmp_address & 0x000F;                // lower 4 bits are address bits
                                irmp_start_bit_detected = 1;                                        // tricky: don't wait for another start bit...
                            }
#endif // IRMP_SUPPORT_JVC_PROTOCOL == 1
#if IRMP_SUPPORT_LGAIR_PROTOCOL == 1
                            else if (irmp_param.protocol == IRMP_NEC_PROTOCOL && (irmp_bit == 28 || irmp_bit == 29))      // it was a LGAIR stop bit
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Switching to LGAIR protocol, irmp_bit = %d\n", irmp_bit);
#endif // ANALYZE
                                irmp_param.stop_bit     = TRUE;                                     // set flag
                                irmp_param.protocol     = IRMP_LGAIR_PROTOCOL;                      // switch protocol
                                irmp_param.complete_len = irmp_bit;                                 // patch length: 16 or 17
                                irmp_tmp_command        = irmp_lgair_command;                       // set command: upper 8 bits are command bits
                                irmp_tmp_address        = irmp_lgair_address;                       // lower 4 bits are address bits
                                irmp_start_bit_detected = 1;                                        // tricky: don't wait for another start bit...
                            }
#endif // IRMP_SUPPORT_LGAIR_PROTOCOL == 1

#if IRMP_SUPPORT_NEC42_PROTOCOL == 1
#if IRMP_SUPPORT_NEC_PROTOCOL == 1
                            else if (irmp_param.protocol == IRMP_NEC42_PROTOCOL && irmp_bit == 32)      // it was a NEC stop bit
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Switching to NEC protocol\n");
#endif // ANALYZE
                                irmp_param.stop_bit     = TRUE;                                     // set flag
                                irmp_param.protocol     = IRMP_NEC_PROTOCOL;                        // switch protocol
                                irmp_param.complete_len = irmp_bit;                                 // patch length: 16 or 17

                                //        0123456789ABC0123456789ABC0123456701234567
                                // NEC42: AAAAAAAAAAAAAaaaaaaaaaaaaaCCCCCCCCcccccccc
                                // NEC:   AAAAAAAAaaaaaaaaCCCCCCCCcccccccc
                                irmp_tmp_address        |= (irmp_tmp_address2 & 0x0007) << 13;      // fm 2012-02-13: 12 -> 13
                                irmp_tmp_command        = (irmp_tmp_address2 >> 3) | (irmp_tmp_command << 10);
                            }
#endif // IRMP_SUPPORT_NEC_PROTOCOL == 1
#if IRMP_SUPPORT_LGAIR_PROTOCOL == 1
                            else if (irmp_param.protocol == IRMP_NEC42_PROTOCOL && irmp_bit == 28)      // it was a NEC stop bit
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Switching to LGAIR protocol\n");
#endif // ANALYZE
                                irmp_param.stop_bit     = TRUE;                                     // set flag
                                irmp_param.protocol     = IRMP_LGAIR_PROTOCOL;                      // switch protocol
                                irmp_param.complete_len = irmp_bit;                                 // patch length: 16 or 17
                                irmp_tmp_address        = irmp_lgair_address;
                                irmp_tmp_command        = irmp_lgair_command;
                            }
#endif // IRMP_SUPPORT_LGAIR_PROTOCOL == 1
#if IRMP_SUPPORT_JVC_PROTOCOL == 1
                            else if (irmp_param.protocol == IRMP_NEC42_PROTOCOL && (irmp_bit == 16 || irmp_bit == 17))  // it was a JVC stop bit
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Switching to JVC protocol, irmp_bit = %d\n", irmp_bit);
#endif // ANALYZE
                                irmp_param.stop_bit     = TRUE;                                     // set flag
                                irmp_param.protocol     = IRMP_JVC_PROTOCOL;                        // switch protocol
                                irmp_param.complete_len = irmp_bit;                                 // patch length: 16 or 17

                                //        0123456789ABC0123456789ABC0123456701234567
                                // NEC42: AAAAAAAAAAAAAaaaaaaaaaaaaaCCCCCCCCcccccccc
                                // JVC:   AAAACCCCCCCCCCCC
                                irmp_tmp_command        = (irmp_tmp_address >> 4) | (irmp_tmp_address2 << 9);   // set command: upper 12 bits are command bits
                                irmp_tmp_address        = irmp_tmp_address & 0x000F;                            // lower 4 bits are address bits
                            }
#endif // IRMP_SUPPORT_JVC_PROTOCOL == 1
#endif // IRMP_SUPPORT_NEC42_PROTOCOL == 1

#if IRMP_SUPPORT_SAMSUNG48_PROTOCOL == 1
                            else if (irmp_param.protocol == IRMP_SAMSUNG48_PROTOCOL && irmp_bit == 32)          // it was a SAMSUNG32 stop bit
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Switching to SAMSUNG32 protocol\n");
#endif // ANALYZE
                                irmp_param.protocol         = IRMP_SAMSUNG32_PROTOCOL;
                                irmp_param.command_offset   = SAMSUNG32_COMMAND_OFFSET;
                                irmp_param.command_end      = SAMSUNG32_COMMAND_OFFSET + SAMSUNG32_COMMAND_LEN;
                                irmp_param.complete_len     = SAMSUNG32_COMPLETE_DATA_LEN;
                            }
#endif // IRMP_SUPPORT_SAMSUNG_PROTOCOL == 1

#if IRMP_SUPPORT_RCMM_PROTOCOL == 1
                            else if (irmp_param.protocol == IRMP_RCMM32_PROTOCOL && (irmp_bit == 12 || irmp_bit == 24))  // it was a RCMM stop bit
                            {
                                if (irmp_bit == 12)
                                {
                                    irmp_tmp_command = (irmp_tmp_address & 0xFF);                   // set command: lower 8 bits are command bits
                                    irmp_tmp_address >>= 8;                                         // upper 4 bits are address bits

#ifdef ANALYZE
                                    ANALYZE_PRINTF ("Switching to RCMM12 protocol, irmp_bit = %d\n", irmp_bit);
#endif // ANALYZE
                                    irmp_param.protocol     = IRMP_RCMM12_PROTOCOL;                 // switch protocol
                                }
                                else // if ((irmp_bit == 24)
                                {
#ifdef ANALYZE
                                    ANALYZE_PRINTF ("Switching to RCMM24 protocol, irmp_bit = %d\n", irmp_bit);
#endif // ANALYZE
                                    irmp_param.protocol     = IRMP_RCMM24_PROTOCOL;                 // switch protocol
                                }
                                irmp_param.stop_bit     = TRUE;                                     // set flag
                                irmp_param.complete_len = irmp_bit;                                 // patch length
                            }
#endif // IRMP_SUPPORT_RCMM_PROTOCOL == 1

#if IRMP_SUPPORT_TECHNICS_PROTOCOL == 1
                            else if (irmp_param.protocol == IRMP_MATSUSHITA_PROTOCOL && irmp_bit == 22)  // it was a TECHNICS stop bit
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Switching to TECHNICS protocol, irmp_bit = %d\n", irmp_bit);
#endif // ANALYZE
                                // Situation:
                                // The first 12 bits have been stored in irmp_tmp_command (LSB first)
                                // The following 10 bits have been stored in irmp_tmp_address (LSB first)
                                // The code of TECHNICS is:
                                //   cccccccccccCCCCCCCCCCC (11 times c and 11 times C)
                                //   ccccccccccccaaaaaaaaaa
                                // where C is inverted value of c

                                irmp_tmp_address <<= 1;
                                if (irmp_tmp_command & (1<<11))
                                {
                                    irmp_tmp_address |= 1;
                                    irmp_tmp_command &= ~(1<<11);
                                }

                                if (irmp_tmp_command == ((~irmp_tmp_address) & 0x07FF))
                                {
                                    irmp_tmp_address = 0;

                                    irmp_param.protocol     = IRMP_TECHNICS_PROTOCOL;                   // switch protocol
                                    irmp_param.complete_len = irmp_bit;                                 // patch length
                                }
                                else
                                {
#ifdef ANALYZE
                                    ANALYZE_PRINTF ("error 8: TECHNICS frame error\n");
                                    ANALYZE_ONLY_NORMAL_PUTCHAR ('\n');
#endif // ANALYZE
                                    irmp_start_bit_detected = 0;                    // wait for another start bit...
                                    irmp_pulse_time         = 0;
                                    irmp_pause_time         = 0;
                                }
                            }
#endif // IRMP_SUPPORT_TECHNICS_PROTOCOL == 1
                            else
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("error 2: pause %d after data bit %d too long\n", irmp_pause_time, irmp_bit);
                                ANALYZE_ONLY_NORMAL_PUTCHAR ('\n');
#endif // ANALYZE
                                irmp_start_bit_detected = 0;                    // wait for another start bit...
                                irmp_pulse_time         = 0;
                                irmp_pause_time         = 0;
                            }
                        }
                    }
                }
                else
                {                                                               // got light now!
                    got_light = TRUE;
                }

                if (got_light)
                {
#ifdef ANALYZE
                    ANALYZE_PRINTF ("%8.3fms [bit %2d: pulse = %3d, pause = %3d] ", (double) (time_counter * 1000) / F_INTERRUPTS, irmp_bit, irmp_pulse_time, irmp_pause_time);
#endif // ANALYZE

#if IRMP_SUPPORT_MANCHESTER == 1
                    if ((irmp_param.flags & IRMP_PARAM_FLAG_IS_MANCHESTER))                                     // Manchester
                    {
#if 1
                        if (irmp_pulse_time > irmp_param.pulse_1_len_max /* && irmp_pulse_time <= 2 * irmp_param.pulse_1_len_max */)
#else // better, but some IR-RCs use asymmetric timings :-/
                        if (irmp_pulse_time > irmp_param.pulse_1_len_max && irmp_pulse_time <= 2 * irmp_param.pulse_1_len_max &&
                            irmp_pause_time <= 2 * irmp_param.pause_1_len_max)
#endif
                        {
#if IRMP_SUPPORT_RC6_PROTOCOL == 1
                            if (irmp_param.protocol == IRMP_RC6_PROTOCOL && irmp_bit == 4 && irmp_pulse_time > RC6_TOGGLE_BIT_LEN_MIN)         // RC6 toggle bit
                            {
#ifdef ANALYZE
                                ANALYZE_PUTCHAR ('T');
#endif // ANALYZE
                                if (irmp_param.complete_len == RC6_COMPLETE_DATA_LEN_LONG)                      // RC6 mode 6A
                                {
                                    irmp_store_bit (1);
                                    last_value = 1;
                                }
                                else                                                                            // RC6 mode 0
                                {
                                    irmp_store_bit (0);
                                    last_value = 0;
                                }
#ifdef ANALYZE
                                ANALYZE_NEWLINE ();
#endif // ANALYZE
                            }
                            else
#endif // IRMP_SUPPORT_RC6_PROTOCOL == 1
                            {
#ifdef ANALYZE
                                ANALYZE_PUTCHAR ((irmp_param.flags & IRMP_PARAM_FLAG_1ST_PULSE_IS_1) ? '0' : '1');
#endif // ANALYZE
                                irmp_store_bit ((irmp_param.flags & IRMP_PARAM_FLAG_1ST_PULSE_IS_1) ? 0  :  1 );

#if IRMP_SUPPORT_RC6_PROTOCOL == 1
                                if (irmp_param.protocol == IRMP_RC6_PROTOCOL && irmp_bit == 4 && irmp_pulse_time > RC6_TOGGLE_BIT_LEN_MIN)      // RC6 toggle bit
                                {
#ifdef ANALYZE
                                    ANALYZE_PUTCHAR ('T');
#endif // ANALYZE
                                    irmp_store_bit (1);

                                    if (irmp_pause_time > 2 * irmp_param.pause_1_len_max)
                                    {
                                        last_value = 0;
                                    }
                                    else
                                    {
                                        last_value = 1;
                                    }
#ifdef ANALYZE
                                    ANALYZE_NEWLINE ();
#endif // ANALYZE
                                }
                                else
#endif // IRMP_SUPPORT_RC6_PROTOCOL == 1
                                {
#ifdef ANALYZE
                                    ANALYZE_PUTCHAR ((irmp_param.flags & IRMP_PARAM_FLAG_1ST_PULSE_IS_1) ? '1' : '0');
#endif // ANALYZE
                                    irmp_store_bit ((irmp_param.flags & IRMP_PARAM_FLAG_1ST_PULSE_IS_1) ? 1 :   0 );
#if IRMP_SUPPORT_RC5_PROTOCOL == 1 && (IRMP_SUPPORT_FDC_PROTOCOL == 1 || IRMP_SUPPORT_RCCAR_PROTOCOL == 1)
                                    if (! irmp_param2.protocol)
#endif
                                    {
#ifdef ANALYZE
                                        ANALYZE_NEWLINE ();
#endif // ANALYZE
                                    }
                                    last_value = (irmp_param.flags & IRMP_PARAM_FLAG_1ST_PULSE_IS_1) ? 1 : 0;
                                }
                            }
                        }
                        else if (irmp_pulse_time >= irmp_param.pulse_1_len_min && irmp_pulse_time <= irmp_param.pulse_1_len_max
                                 /* && irmp_pause_time <= 2 * irmp_param.pause_1_len_max */)
                        {
                            uint_fast8_t manchester_value;

                            if (last_pause > irmp_param.pause_1_len_max && last_pause <= 2 * irmp_param.pause_1_len_max)
                            {
                                manchester_value = last_value ? 0 : 1;
                                last_value  = manchester_value;
                            }
                            else
                            {
                                manchester_value = last_value;
                            }

#ifdef ANALYZE
                            ANALYZE_PUTCHAR (manchester_value + '0');
#endif // ANALYZE

#if IRMP_SUPPORT_RC5_PROTOCOL == 1 && (IRMP_SUPPORT_FDC_PROTOCOL == 1 || IRMP_SUPPORT_RCCAR_PROTOCOL == 1)
                            if (! irmp_param2.protocol)
#endif
                            {
#ifdef ANALYZE
                                ANALYZE_NEWLINE ();
#endif // ANALYZE
                            }

#if IRMP_SUPPORT_RC6_PROTOCOL == 1
                            if (irmp_param.protocol == IRMP_RC6_PROTOCOL && irmp_bit == 1 && manchester_value == 1)     // RC6 mode != 0 ???
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Switching to RC6A protocol\n");
#endif // ANALYZE
                                irmp_param.complete_len = RC6_COMPLETE_DATA_LEN_LONG;
                                irmp_param.address_offset = 5;
                                irmp_param.address_end = irmp_param.address_offset + 15;
                                irmp_param.command_offset = irmp_param.address_end + 1;                                 // skip 1 system bit, changes like a toggle bit
                                irmp_param.command_end = irmp_param.command_offset + 16 - 1;
                                irmp_tmp_address = 0;
                            }
#endif // IRMP_SUPPORT_RC6_PROTOCOL == 1

                            irmp_store_bit (manchester_value);
                        }
                        else
                        {
#if IRMP_SUPPORT_RC5_PROTOCOL == 1 && IRMP_SUPPORT_FDC_PROTOCOL == 1
                            if (irmp_param2.protocol == IRMP_FDC_PROTOCOL &&
                                irmp_pulse_time >= FDC_PULSE_LEN_MIN && irmp_pulse_time <= FDC_PULSE_LEN_MAX &&
                                ((irmp_pause_time >= FDC_1_PAUSE_LEN_MIN && irmp_pause_time <= FDC_1_PAUSE_LEN_MAX) ||
                                 (irmp_pause_time >= FDC_0_PAUSE_LEN_MIN && irmp_pause_time <= FDC_0_PAUSE_LEN_MAX)))
                            {
#ifdef ANALYZE
                                ANALYZE_PUTCHAR ('?');
#endif // ANALYZE
                                irmp_param.protocol = 0;                // switch to FDC, see below
                            }
                            else
#endif // IRMP_SUPPORT_FDC_PROTOCOL == 1
#if IRMP_SUPPORT_RC5_PROTOCOL == 1 && IRMP_SUPPORT_RCCAR_PROTOCOL == 1
                            if (irmp_param2.protocol == IRMP_RCCAR_PROTOCOL &&
                                irmp_pulse_time >= RCCAR_PULSE_LEN_MIN && irmp_pulse_time <= RCCAR_PULSE_LEN_MAX &&
                                ((irmp_pause_time >= RCCAR_1_PAUSE_LEN_MIN && irmp_pause_time <= RCCAR_1_PAUSE_LEN_MAX) ||
                                 (irmp_pause_time >= RCCAR_0_PAUSE_LEN_MIN && irmp_pause_time <= RCCAR_0_PAUSE_LEN_MAX)))
                            {
#ifdef ANALYZE
                                ANALYZE_PUTCHAR ('?');
#endif // ANALYZE
                                irmp_param.protocol = 0;                // switch to RCCAR, see below
                            }
                            else
#endif // IRMP_SUPPORT_RCCAR_PROTOCOL == 1
                            {
#ifdef ANALYZE
                                ANALYZE_PUTCHAR ('?');
                                ANALYZE_NEWLINE ();
                                ANALYZE_PRINTF ("error 3 manchester: timing not correct: data bit %d,  pulse: %d, pause: %d\n", irmp_bit, irmp_pulse_time, irmp_pause_time);
                                ANALYZE_ONLY_NORMAL_PUTCHAR ('\n');
#endif // ANALYZE
                                irmp_start_bit_detected = 0;                            // reset flags and wait for next start bit
                                irmp_pause_time         = 0;
                            }
                        }

#if IRMP_SUPPORT_RC5_PROTOCOL == 1 && IRMP_SUPPORT_FDC_PROTOCOL == 1
                        if (irmp_param2.protocol == IRMP_FDC_PROTOCOL && irmp_pulse_time >= FDC_PULSE_LEN_MIN && irmp_pulse_time <= FDC_PULSE_LEN_MAX)
                        {
                            if (irmp_pause_time >= FDC_1_PAUSE_LEN_MIN && irmp_pause_time <= FDC_1_PAUSE_LEN_MAX)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("   1 (FDC)\n");
#endif // ANALYZE
                                irmp_store_bit2 (1);
                            }
                            else if (irmp_pause_time >= FDC_0_PAUSE_LEN_MIN && irmp_pause_time <= FDC_0_PAUSE_LEN_MAX)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("   0 (FDC)\n");
#endif // ANALYZE
                                irmp_store_bit2 (0);
                            }

                            if (! irmp_param.protocol)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Switching to FDC protocol\n");
#endif // ANALYZE
                                memcpy (&irmp_param, &irmp_param2, sizeof (IRMP_PARAMETER));
                                irmp_param2.protocol = 0;
                                irmp_tmp_address = irmp_tmp_address2;
                                irmp_tmp_command = irmp_tmp_command2;
                            }
                        }
#endif // IRMP_SUPPORT_FDC_PROTOCOL == 1
#if IRMP_SUPPORT_RC5_PROTOCOL == 1 && IRMP_SUPPORT_RCCAR_PROTOCOL == 1
                        if (irmp_param2.protocol == IRMP_RCCAR_PROTOCOL && irmp_pulse_time >= RCCAR_PULSE_LEN_MIN && irmp_pulse_time <= RCCAR_PULSE_LEN_MAX)
                        {
                            if (irmp_pause_time >= RCCAR_1_PAUSE_LEN_MIN && irmp_pause_time <= RCCAR_1_PAUSE_LEN_MAX)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("   1 (RCCAR)\n");
#endif // ANALYZE
                                irmp_store_bit2 (1);
                            }
                            else if (irmp_pause_time >= RCCAR_0_PAUSE_LEN_MIN && irmp_pause_time <= RCCAR_0_PAUSE_LEN_MAX)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("   0 (RCCAR)\n");
#endif // ANALYZE
                                irmp_store_bit2 (0);
                            }

                            if (! irmp_param.protocol)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Switching to RCCAR protocol\n");
#endif // ANALYZE
                                memcpy (&irmp_param, &irmp_param2, sizeof (IRMP_PARAMETER));
                                irmp_param2.protocol = 0;
                                irmp_tmp_address = irmp_tmp_address2;
                                irmp_tmp_command = irmp_tmp_command2;
                            }
                        }
#endif // IRMP_SUPPORT_RCCAR_PROTOCOL == 1

                        last_pause      = irmp_pause_time;
                        wait_for_space  = 0;
                    }
                    else
#endif // IRMP_SUPPORT_MANCHESTER == 1

#if IRMP_SUPPORT_SERIAL == 1
                    if (irmp_param.flags & IRMP_PARAM_FLAG_IS_SERIAL)
                    {
                        while (irmp_bit < irmp_param.complete_len && irmp_pulse_time > irmp_param.pulse_1_len_max)
                        {
#ifdef ANALYZE
                            ANALYZE_PUTCHAR ('1');
#endif // ANALYZE
                            irmp_store_bit (1);

                            if (irmp_pulse_time >= irmp_param.pulse_1_len_min)
                            {
                                irmp_pulse_time -= irmp_param.pulse_1_len_min;
                            }
                            else
                            {
                                irmp_pulse_time = 0;
                            }
                        }

                        while (irmp_bit < irmp_param.complete_len && irmp_pause_time > irmp_param.pause_1_len_max)
                        {
#ifdef ANALYZE
                            ANALYZE_PUTCHAR ('0');
#endif // ANALYZE
                            irmp_store_bit (0);

                            if (irmp_pause_time >= irmp_param.pause_1_len_min)
                            {
                                irmp_pause_time -= irmp_param.pause_1_len_min;
                            }
                            else
                            {
                                irmp_pause_time = 0;
                            }
                        }
#ifdef ANALYZE
                        ANALYZE_NEWLINE ();
#endif // ANALYZE
                        wait_for_space = 0;
                    }
                    else
#endif // IRMP_SUPPORT_SERIAL == 1

#if IRMP_SUPPORT_SAMSUNG_PROTOCOL == 1
                    if (irmp_param.protocol == IRMP_SAMSUNG_PROTOCOL && irmp_bit == 16)       // Samsung: 16th bit
                    {
                        if (irmp_pulse_time >= SAMSUNG_PULSE_LEN_MIN && irmp_pulse_time <= SAMSUNG_PULSE_LEN_MAX &&
                            irmp_pause_time >= SAMSUNG_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= SAMSUNG_START_BIT_PAUSE_LEN_MAX)
                        {
#ifdef ANALYZE
                            ANALYZE_PRINTF ("SYNC\n");
#endif // ANALYZE
                            wait_for_space = 0;
                            irmp_bit++;
                        }
                        else  if (irmp_pulse_time >= SAMSUNG_PULSE_LEN_MIN && irmp_pulse_time <= SAMSUNG_PULSE_LEN_MAX)
                        {
#if IRMP_SUPPORT_SAMSUNG48_PROTOCOL == 1
#ifdef ANALYZE
                            ANALYZE_PRINTF ("Switching to SAMSUNG48 protocol ");
#endif // ANALYZE
                            irmp_param.protocol         = IRMP_SAMSUNG48_PROTOCOL;
                            irmp_param.command_offset   = SAMSUNG48_COMMAND_OFFSET;
                            irmp_param.command_end      = SAMSUNG48_COMMAND_OFFSET + SAMSUNG48_COMMAND_LEN;
                            irmp_param.complete_len     = SAMSUNG48_COMPLETE_DATA_LEN;
#else
#ifdef ANALYZE
                            ANALYZE_PRINTF ("Switching to SAMSUNG32 protocol ");
#endif // ANALYZE
                            irmp_param.protocol         = IRMP_SAMSUNG32_PROTOCOL;
                            irmp_param.command_offset   = SAMSUNG32_COMMAND_OFFSET;
                            irmp_param.command_end      = SAMSUNG32_COMMAND_OFFSET + SAMSUNG32_COMMAND_LEN;
                            irmp_param.complete_len     = SAMSUNG32_COMPLETE_DATA_LEN;
#endif
                            if (irmp_pause_time >= SAMSUNG_1_PAUSE_LEN_MIN && irmp_pause_time <= SAMSUNG_1_PAUSE_LEN_MAX)
                            {
#ifdef ANALYZE
                                ANALYZE_PUTCHAR ('1');
                                ANALYZE_NEWLINE ();
#endif // ANALYZE
                                irmp_store_bit (1);
                                wait_for_space = 0;
                            }
                            else
                            {
#ifdef ANALYZE
                                ANALYZE_PUTCHAR ('0');
                                ANALYZE_NEWLINE ();
#endif // ANALYZE
                                irmp_store_bit (0);
                                wait_for_space = 0;
                            }
                        }
                        else
                        {                                                           // timing incorrect!
#ifdef ANALYZE
                            ANALYZE_PRINTF ("error 3 Samsung: timing not correct: data bit %d,  pulse: %d, pause: %d\n", irmp_bit, irmp_pulse_time, irmp_pause_time);
                            ANALYZE_ONLY_NORMAL_PUTCHAR ('\n');
#endif // ANALYZE
                            irmp_start_bit_detected = 0;                            // reset flags and wait for next start bit
                            irmp_pause_time         = 0;
                        }
                    }
                    else
#endif // IRMP_SUPPORT_SAMSUNG_PROTOCOL

#if IRMP_SUPPORT_NEC16_PROTOCOL
#if IRMP_SUPPORT_NEC42_PROTOCOL == 1
                    if (irmp_param.protocol == IRMP_NEC42_PROTOCOL &&
#else // IRMP_SUPPORT_NEC_PROTOCOL instead
                    if (irmp_param.protocol == IRMP_NEC_PROTOCOL &&
#endif // IRMP_SUPPORT_NEC42_PROTOCOL == 1
                        irmp_bit == 8 && irmp_pause_time >= NEC_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= NEC_START_BIT_PAUSE_LEN_MAX)
                    {
#ifdef ANALYZE
                        ANALYZE_PRINTF ("Switching to NEC16 protocol\n");
#endif // ANALYZE
                        irmp_param.protocol         = IRMP_NEC16_PROTOCOL;
                        irmp_param.address_offset   = NEC16_ADDRESS_OFFSET;
                        irmp_param.address_end      = NEC16_ADDRESS_OFFSET + NEC16_ADDRESS_LEN;
                        irmp_param.command_offset   = NEC16_COMMAND_OFFSET;
                        irmp_param.command_end      = NEC16_COMMAND_OFFSET + NEC16_COMMAND_LEN;
                        irmp_param.complete_len     = NEC16_COMPLETE_DATA_LEN;
                        wait_for_space = 0;
                    }
                    else
#endif // IRMP_SUPPORT_NEC16_PROTOCOL

#if IRMP_SUPPORT_BANG_OLUFSEN_PROTOCOL == 1
                    if (irmp_param.protocol == IRMP_BANG_OLUFSEN_PROTOCOL)
                    {
                        if (irmp_pulse_time >= BANG_OLUFSEN_PULSE_LEN_MIN && irmp_pulse_time <= BANG_OLUFSEN_PULSE_LEN_MAX)
                        {
                            if (irmp_bit == 1)                                      // Bang & Olufsen: 3rd bit
                            {
                                if (irmp_pause_time >= BANG_OLUFSEN_START_BIT3_PAUSE_LEN_MIN && irmp_pause_time <= BANG_OLUFSEN_START_BIT3_PAUSE_LEN_MAX)
                                {
#ifdef ANALYZE
                                    ANALYZE_PRINTF ("3rd start bit\n");
#endif // ANALYZE
                                    wait_for_space = 0;
                                    irmp_bit++;
                                }
                                else
                                {                                                   // timing incorrect!
#ifdef ANALYZE
                                    ANALYZE_PRINTF ("error 3a B&O: timing not correct: data bit %d,  pulse: %d, pause: %d\n", irmp_bit, irmp_pulse_time, irmp_pause_time);
                                    ANALYZE_ONLY_NORMAL_PUTCHAR ('\n');
#endif // ANALYZE
                                    irmp_start_bit_detected = 0;                    // reset flags and wait for next start bit
                                    irmp_pause_time         = 0;
                                }
                            }
                            else if (irmp_bit == 19)                                // Bang & Olufsen: trailer bit
                            {
                                if (irmp_pause_time >= BANG_OLUFSEN_TRAILER_BIT_PAUSE_LEN_MIN && irmp_pause_time <= BANG_OLUFSEN_TRAILER_BIT_PAUSE_LEN_MAX)
                                {
#ifdef ANALYZE
                                    ANALYZE_PRINTF ("trailer bit\n");
#endif // ANALYZE
                                    wait_for_space = 0;
                                    irmp_bit++;
                                }
                                else
                                {                                                   // timing incorrect!
#ifdef ANALYZE
                                    ANALYZE_PRINTF ("error 3b B&O: timing not correct: data bit %d,  pulse: %d, pause: %d\n", irmp_bit, irmp_pulse_time, irmp_pause_time);
                                    ANALYZE_ONLY_NORMAL_PUTCHAR ('\n');
#endif // ANALYZE
                                    irmp_start_bit_detected = 0;                    // reset flags and wait for next start bit
                                    irmp_pause_time         = 0;
                                }
                            }
                            else
                            {
                                if (irmp_pause_time >= BANG_OLUFSEN_1_PAUSE_LEN_MIN && irmp_pause_time <= BANG_OLUFSEN_1_PAUSE_LEN_MAX)
                                {                                                   // pulse & pause timings correct for "1"?
#ifdef ANALYZE
                                    ANALYZE_PUTCHAR ('1');
                                    ANALYZE_NEWLINE ();
#endif // ANALYZE
                                    irmp_store_bit (1);
                                    last_value = 1;
                                    wait_for_space = 0;
                                }
                                else if (irmp_pause_time >= BANG_OLUFSEN_0_PAUSE_LEN_MIN && irmp_pause_time <= BANG_OLUFSEN_0_PAUSE_LEN_MAX)
                                {                                                   // pulse & pause timings correct for "0"?
#ifdef ANALYZE
                                    ANALYZE_PUTCHAR ('0');
                                    ANALYZE_NEWLINE ();
#endif // ANALYZE
                                    irmp_store_bit (0);
                                    last_value = 0;
                                    wait_for_space = 0;
                                }
                                else if (irmp_pause_time >= BANG_OLUFSEN_R_PAUSE_LEN_MIN && irmp_pause_time <= BANG_OLUFSEN_R_PAUSE_LEN_MAX)
                                {
#ifdef ANALYZE
                                    ANALYZE_PUTCHAR (last_value + '0');
                                    ANALYZE_NEWLINE ();
#endif // ANALYZE
                                    irmp_store_bit (last_value);
                                    wait_for_space = 0;
                                }
                                else
                                {                                                   // timing incorrect!
#ifdef ANALYZE
                                    ANALYZE_PRINTF ("error 3c B&O: timing not correct: data bit %d,  pulse: %d, pause: %d\n", irmp_bit, irmp_pulse_time, irmp_pause_time);
                                    ANALYZE_ONLY_NORMAL_PUTCHAR ('\n');
#endif // ANALYZE
                                    irmp_start_bit_detected = 0;                    // reset flags and wait for next start bit
                                    irmp_pause_time         = 0;
                                }
                            }
                        }
                        else
                        {                                                           // timing incorrect!
#ifdef ANALYZE
                            ANALYZE_PRINTF ("error 3d B&O: timing not correct: data bit %d,  pulse: %d, pause: %d\n", irmp_bit, irmp_pulse_time, irmp_pause_time);
                            ANALYZE_ONLY_NORMAL_PUTCHAR ('\n');
#endif // ANALYZE
                            irmp_start_bit_detected = 0;                            // reset flags and wait for next start bit
                            irmp_pause_time         = 0;
                        }
                    }
                    else
#endif // IRMP_SUPPORT_BANG_OLUFSEN_PROTOCOL

#if IRMP_SUPPORT_RCMM_PROTOCOL == 1
                    if (irmp_param.protocol == IRMP_RCMM32_PROTOCOL)
                    {
                        if (irmp_pause_time >= RCMM32_BIT_00_PAUSE_LEN_MIN && irmp_pause_time <= RCMM32_BIT_00_PAUSE_LEN_MAX)
                        {
#ifdef ANALYZE
                            ANALYZE_PUTCHAR ('0');
                            ANALYZE_PUTCHAR ('0');
#endif // ANALYZE
                            irmp_store_bit (0);
                            irmp_store_bit (0);
                        }
                        else if (irmp_pause_time >= RCMM32_BIT_01_PAUSE_LEN_MIN && irmp_pause_time <= RCMM32_BIT_01_PAUSE_LEN_MAX)
                        {
#ifdef ANALYZE
                            ANALYZE_PUTCHAR ('0');
                            ANALYZE_PUTCHAR ('1');
#endif // ANALYZE
                            irmp_store_bit (0);
                            irmp_store_bit (1);
                        }
                        else if (irmp_pause_time >= RCMM32_BIT_10_PAUSE_LEN_MIN && irmp_pause_time <= RCMM32_BIT_10_PAUSE_LEN_MAX)
                        {
#ifdef ANALYZE
                            ANALYZE_PUTCHAR ('1');
                            ANALYZE_PUTCHAR ('0');
#endif // ANALYZE
                            irmp_store_bit (1);
                            irmp_store_bit (0);
                        }
                        else if (irmp_pause_time >= RCMM32_BIT_11_PAUSE_LEN_MIN && irmp_pause_time <= RCMM32_BIT_11_PAUSE_LEN_MAX)
                        {
#ifdef ANALYZE
                            ANALYZE_PUTCHAR ('1');
                            ANALYZE_PUTCHAR ('1');
#endif // ANALYZE
                            irmp_store_bit (1);
                            irmp_store_bit (1);
                        }
#ifdef ANALYZE
                        ANALYZE_PRINTF ("\n");
#endif // ANALYZE
                        wait_for_space = 0;
                    }
                    else
#endif

                    if (irmp_pulse_time >= irmp_param.pulse_1_len_min && irmp_pulse_time <= irmp_param.pulse_1_len_max &&
                        irmp_pause_time >= irmp_param.pause_1_len_min && irmp_pause_time <= irmp_param.pause_1_len_max)
                    {                                                               // pulse & pause timings correct for "1"?
#ifdef ANALYZE
                        ANALYZE_PUTCHAR ('1');
                        ANALYZE_NEWLINE ();
#endif // ANALYZE
                        irmp_store_bit (1);
                        wait_for_space = 0;
                    }
                    else if (irmp_pulse_time >= irmp_param.pulse_0_len_min && irmp_pulse_time <= irmp_param.pulse_0_len_max &&
                             irmp_pause_time >= irmp_param.pause_0_len_min && irmp_pause_time <= irmp_param.pause_0_len_max)
                    {                                                               // pulse & pause timings correct for "0"?
#ifdef ANALYZE
                        ANALYZE_PUTCHAR ('0');
                        ANALYZE_NEWLINE ();
#endif // ANALYZE
                        irmp_store_bit (0);
                        wait_for_space = 0;
                    }
                    else
#if IRMP_SUPPORT_KATHREIN_PROTOCOL

                    if (irmp_param.protocol == IRMP_KATHREIN_PROTOCOL &&
                        irmp_pulse_time >= KATHREIN_1_PULSE_LEN_MIN && irmp_pulse_time <= KATHREIN_1_PULSE_LEN_MAX &&
                        (((irmp_bit == 8 || irmp_bit == 6) &&
                                irmp_pause_time >= KATHREIN_SYNC_BIT_PAUSE_LEN_MIN && irmp_pause_time <= KATHREIN_SYNC_BIT_PAUSE_LEN_MAX) ||
                         (irmp_bit == 12 &&
                                irmp_pause_time >= KATHREIN_START_BIT_PAUSE_LEN_MIN && irmp_pause_time <= KATHREIN_START_BIT_PAUSE_LEN_MAX)))

                    {
                        if (irmp_bit == 8)
                        {
                            irmp_bit++;
#ifdef ANALYZE
                            ANALYZE_PUTCHAR ('S');
                            ANALYZE_NEWLINE ();
#endif // ANALYZE
                            irmp_tmp_command <<= 1;
                        }
                        else
                        {
#ifdef ANALYZE
                            ANALYZE_PUTCHAR ('S');
                            ANALYZE_NEWLINE ();
#endif // ANALYZE
                            irmp_store_bit (1);
                        }
                        wait_for_space = 0;
                    }
                    else
#endif // IRMP_SUPPORT_KATHREIN_PROTOCOL
                    {                                                               // timing incorrect!
#ifdef ANALYZE
                        ANALYZE_PRINTF ("error 3: timing not correct: data bit %d,  pulse: %d, pause: %d\n", irmp_bit, irmp_pulse_time, irmp_pause_time);
                        ANALYZE_ONLY_NORMAL_PUTCHAR ('\n');
#endif // ANALYZE
                        irmp_start_bit_detected = 0;                                // reset flags and wait for next start bit
                        irmp_pause_time         = 0;
                    }

                    irmp_pulse_time = 1;                                            // set counter to 1, not 0
                }
            }
            else
            {                                                                       // counting the pulse length ...
                if (! irmp_input)                                                   // still light?
                {                                                                   // yes...
                    irmp_pulse_time++;                                              // increment counter
                }
                else
                {                                                                   // now it's dark!
                    wait_for_space  = 1;                                            // let's count the time (see above)
                    irmp_pause_time = 1;                                            // set pause counter to 1, not 0
                }
            }

            if (irmp_start_bit_detected && irmp_bit == irmp_param.complete_len && irmp_param.stop_bit == 0)    // enough bits received?
            {
                if (last_irmp_command == irmp_tmp_command && key_repetition_len < AUTO_FRAME_REPETITION_LEN)
                {
                    repetition_frame_number++;
                }
                else
                {
                    repetition_frame_number = 0;
                }

#if IRMP_SUPPORT_SIRCS_PROTOCOL == 1
                // if SIRCS protocol and the code will be repeated within 50 ms, we will ignore 2nd and 3rd repetition frame
                if (irmp_param.protocol == IRMP_SIRCS_PROTOCOL && (repetition_frame_number == 1 || repetition_frame_number == 2))
                {
#ifdef ANALYZE
                    ANALYZE_PRINTF ("code skipped: SIRCS auto repetition frame #%d, counter = %d, auto repetition len = %d\n",
                                    repetition_frame_number + 1, key_repetition_len, AUTO_FRAME_REPETITION_LEN);
#endif // ANALYZE
                    key_repetition_len = 0;
                }
                else
#endif

#if IRMP_SUPPORT_ORTEK_PROTOCOL == 1
                // if ORTEK protocol and the code will be repeated within 50 ms, we will ignore 2nd repetition frame
                if (irmp_param.protocol == IRMP_ORTEK_PROTOCOL && repetition_frame_number == 1)
                {
#ifdef ANALYZE
                    ANALYZE_PRINTF ("code skipped: ORTEK auto repetition frame #%d, counter = %d, auto repetition len = %d\n",
                                    repetition_frame_number + 1, key_repetition_len, AUTO_FRAME_REPETITION_LEN);
#endif // ANALYZE
                    key_repetition_len = 0;
                }
                else
#endif

#if 0 && IRMP_SUPPORT_KASEIKYO_PROTOCOL == 1    // fm 2015-12-02: don't ignore every 2nd frame
                // if KASEIKYO protocol and the code will be repeated within 50 ms, we will ignore 2nd repetition frame
                if (irmp_param.protocol == IRMP_KASEIKYO_PROTOCOL && repetition_frame_number == 1)
                {
#ifdef ANALYZE
                    ANALYZE_PRINTF ("code skipped: KASEIKYO auto repetition frame #%d, counter = %d, auto repetition len = %d\n",
                                    repetition_frame_number + 1, key_repetition_len, AUTO_FRAME_REPETITION_LEN);
#endif // ANALYZE
                    key_repetition_len = 0;
                }
                else
#endif

#if 0 && IRMP_SUPPORT_SAMSUNG_PROTOCOL == 1     // fm 2015-12-02: don't ignore every 2nd frame
                // if SAMSUNG32 or SAMSUNG48 protocol and the code will be repeated within 50 ms, we will ignore every 2nd frame
                if ((irmp_param.protocol == IRMP_SAMSUNG32_PROTOCOL || irmp_param.protocol == IRMP_SAMSUNG48_PROTOCOL) && (repetition_frame_number & 0x01))
                {
#ifdef ANALYZE
                    ANALYZE_PRINTF ("code skipped: SAMSUNG32/SAMSUNG48 auto repetition frame #%d, counter = %d, auto repetition len = %d\n",
                                    repetition_frame_number + 1, key_repetition_len, AUTO_FRAME_REPETITION_LEN);
#endif // ANALYZE
                    key_repetition_len = 0;
                }
                else
#endif

#if IRMP_SUPPORT_NUBERT_PROTOCOL == 1
                // if NUBERT protocol and the code will be repeated within 50 ms, we will ignore every 2nd frame
                if (irmp_param.protocol == IRMP_NUBERT_PROTOCOL && (repetition_frame_number & 0x01))
                {
#ifdef ANALYZE
                    ANALYZE_PRINTF ("code skipped: NUBERT auto repetition frame #%d, counter = %d, auto repetition len = %d\n",
                                    repetition_frame_number + 1, key_repetition_len, AUTO_FRAME_REPETITION_LEN);
#endif // ANALYZE
                    key_repetition_len = 0;
                }
                else
#endif

#if IRMP_SUPPORT_SPEAKER_PROTOCOL == 1
                // if SPEAKER protocol and the code will be repeated within 50 ms, we will ignore every 2nd frame
                if (irmp_param.protocol == IRMP_SPEAKER_PROTOCOL && (repetition_frame_number & 0x01))
                {
#ifdef ANALYZE
                    ANALYZE_PRINTF ("code skipped: SPEAKER auto repetition frame #%d, counter = %d, auto repetition len = %d\n",
                                    repetition_frame_number + 1, key_repetition_len, AUTO_FRAME_REPETITION_LEN);
#endif // ANALYZE
                    key_repetition_len = 0;
                }
                else
#endif

                {
#ifdef ANALYZE
                    ANALYZE_PRINTF ("%8.3fms code detected, length = %d\n", (double) (time_counter * 1000) / F_INTERRUPTS, irmp_bit);
#endif // ANALYZE
                    irmp_ir_detected = TRUE;

#if IRMP_SUPPORT_DENON_PROTOCOL == 1
                    if (irmp_param.protocol == IRMP_DENON_PROTOCOL)
                    {                                                               // check for repetition frame
                        if ((~irmp_tmp_command & 0x3FF) == last_irmp_denon_command) // command bits must be inverted
                        {
                            irmp_tmp_command = last_irmp_denon_command;             // use command received before!
                            last_irmp_denon_command = 0;

                            irmp_protocol = irmp_param.protocol;                    // store protocol
                            irmp_address = irmp_tmp_address;                        // store address
                            irmp_command = irmp_tmp_command;                        // store command
                        }
                        else
                        {
                            if ((irmp_tmp_command & 0x01) == 0x00)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("%8.3fms info Denon: waiting for inverted command repetition\n", (double) (time_counter * 1000) / F_INTERRUPTS);
#endif // ANALYZE
                                last_irmp_denon_command = irmp_tmp_command;
                                denon_repetition_len = 0;
                                irmp_ir_detected = FALSE;
                            }
                            else
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("%8.3fms warning Denon: got unexpected inverted command, ignoring it\n", (double) (time_counter * 1000) / F_INTERRUPTS);
#endif // ANALYZE
                                last_irmp_denon_command = 0;
                                irmp_ir_detected = FALSE;
                            }
                        }
                    }
                    else
#endif // IRMP_SUPPORT_DENON_PROTOCOL

#if IRMP_SUPPORT_GRUNDIG_PROTOCOL == 1
                    if (irmp_param.protocol == IRMP_GRUNDIG_PROTOCOL && irmp_tmp_command == 0x01ff)
                    {                                                               // Grundig start frame?
#ifdef ANALYZE
                        ANALYZE_PRINTF ("Detected GRUNDIG start frame, ignoring it\n");
#endif // ANALYZE
                        irmp_ir_detected = FALSE;
                    }
                    else
#endif // IRMP_SUPPORT_GRUNDIG_PROTOCOL

#if IRMP_SUPPORT_NOKIA_PROTOCOL == 1
                    if (irmp_param.protocol == IRMP_NOKIA_PROTOCOL && irmp_tmp_address == 0x00ff && irmp_tmp_command == 0x00fe)
                    {                                                               // Nokia start frame?
#ifdef ANALYZE
                        ANALYZE_PRINTF ("Detected NOKIA start frame, ignoring it\n");
#endif // ANALYZE
                        irmp_ir_detected = FALSE;
                    }
                    else
#endif // IRMP_SUPPORT_NOKIA_PROTOCOL
                    {
#if IRMP_SUPPORT_NEC_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_NEC_PROTOCOL && irmp_bit == 0)  // repetition frame
                        {
                            if (key_repetition_len < NEC_FRAME_REPEAT_PAUSE_LEN_MAX)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Detected NEC repetition frame, key_repetition_len = %d\n", key_repetition_len);
                                ANALYZE_ONLY_NORMAL_PRINTF("REPETETION FRAME                ");
#endif // ANALYZE
                                irmp_tmp_address = last_irmp_address;                   // address is last address
                                irmp_tmp_command = last_irmp_command;                   // command is last command
                                irmp_flags |= IRMP_FLAG_REPETITION;
                                key_repetition_len = 0;
                            }
                            else
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("Detected NEC repetition frame, ignoring it: timeout occured, key_repetition_len = %d > %d\n",
                                                key_repetition_len, NEC_FRAME_REPEAT_PAUSE_LEN_MAX);
#endif // ANALYZE
                                irmp_ir_detected = FALSE;
                            }
                        }
#endif // IRMP_SUPPORT_NEC_PROTOCOL

#if IRMP_SUPPORT_KASEIKYO_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_KASEIKYO_PROTOCOL)
                        {
                            uint_fast8_t xor_value;

                            xor_value = (xor_check[0] & 0x0F) ^ ((xor_check[0] & 0xF0) >> 4) ^ (xor_check[1] & 0x0F) ^ ((xor_check[1] & 0xF0) >> 4);

                            if (xor_value != (xor_check[2] & 0x0F))
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("error 4: wrong XOR check for customer id: 0x%1x 0x%1x\n", xor_value, xor_check[2] & 0x0F);
#endif // ANALYZE
                                irmp_ir_detected = FALSE;
                            }

                            xor_value = xor_check[2] ^ xor_check[3] ^ xor_check[4];

                            if (xor_value != xor_check[5])
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("error 5: wrong XOR check for data bits: 0x%02x 0x%02x\n", xor_value, xor_check[5]);
#endif // ANALYZE
                                irmp_ir_detected = FALSE;
                            }

                            irmp_flags |= genre2;       // write the genre2 bits into MSB of the flag byte
                        }
#endif // IRMP_SUPPORT_KASEIKYO_PROTOCOL == 1

#if IRMP_SUPPORT_ORTEK_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_ORTEK_PROTOCOL)
                        {
                            if (parity == PARITY_CHECK_FAILED)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("error 6: parity check failed\n");
#endif // ANALYZE
                                irmp_ir_detected = FALSE;
                            }

                            if ((irmp_tmp_address & 0x03) == 0x02)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("code skipped: ORTEK end of transmission frame (key release)\n");
#endif // ANALYZE
                                irmp_ir_detected = FALSE;
                            }
                            irmp_tmp_address >>= 2;
                        }
#endif // IRMP_SUPPORT_ORTEK_PROTOCOL == 1

#if IRMP_SUPPORT_MITSU_HEAVY_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_MITSU_HEAVY_PROTOCOL)
                        {
                            check = irmp_tmp_command >> 8;                    // inverted upper byte == lower byte?
                            check = ~ check;
                            if (check == (irmp_tmp_command & 0xFF)) {         //ok:
                              irmp_tmp_command &= 0xFF;
                            }
                            else  mitsu_parity = PARITY_CHECK_FAILED;
                            if (mitsu_parity == PARITY_CHECK_FAILED)
                            {
#ifdef ANALYZE
                                ANALYZE_PRINTF ("error 7: parity check failed\n");
#endif // ANALYZE
                                irmp_ir_detected = FALSE;
                            }
                        }
#endif // IRMP_SUPPORT_MITSU_HEAVY_PROTOCOL

#if IRMP_SUPPORT_RC6_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_RC6_PROTOCOL && irmp_param.complete_len == RC6_COMPLETE_DATA_LEN_LONG)     // RC6 mode = 6?
                        {
                            irmp_protocol = IRMP_RC6A_PROTOCOL;
                        }
                        else
#endif // IRMP_SUPPORT_RC6_PROTOCOL == 1
                        {
                            irmp_protocol = irmp_param.protocol;
                        }

#if IRMP_SUPPORT_FDC_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_FDC_PROTOCOL)
                        {
                            if (irmp_tmp_command & 0x000F)                          // released key?
                            {
                                irmp_tmp_command = (irmp_tmp_command >> 4) | 0x80;  // yes, set bit 7
                            }
                            else
                            {
                                irmp_tmp_command >>= 4;                             // no, it's a pressed key
                            }
                            irmp_tmp_command |= (irmp_tmp_address << 2) & 0x0F00;   // 000000CCCCAAAAAA -> 0000CCCC00000000
                            irmp_tmp_address &= 0x003F;
                        }
#endif

                        irmp_address = irmp_tmp_address;                            // store address
#if IRMP_SUPPORT_NEC_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_NEC_PROTOCOL)
                        {
                            last_irmp_address = irmp_tmp_address;                   // store as last address, too
                        }
#endif

#if IRMP_SUPPORT_RC5_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_RC5_PROTOCOL)
                        {
                            irmp_tmp_command |= rc5_cmd_bit6;                       // store bit 6
                        }
#endif
#if IRMP_SUPPORT_S100_PROTOCOL == 1
                        if (irmp_param.protocol == IRMP_S100_PROTOCOL)
                        {
                            irmp_tmp_command |= rc5_cmd_bit6;                       // store bit 6
                        }
#endif
                        irmp_command = irmp_tmp_command;                            // store command

#if IRMP_SUPPORT_SAMSUNG_PROTOCOL == 1
                        irmp_id = irmp_tmp_id;
#endif
                    }
                }

                if (irmp_ir_detected)
                {
                    if (last_irmp_command == irmp_tmp_command &&
                        last_irmp_address == irmp_tmp_address &&
                        key_repetition_len < IRMP_KEY_REPETITION_LEN)
                    {
                        irmp_flags |= IRMP_FLAG_REPETITION;
                    }

                    last_irmp_address = irmp_tmp_address;                           // store as last address, too
                    last_irmp_command = irmp_tmp_command;                           // store as last command, too

                    key_repetition_len = 0;
                }
                else
                {
#ifdef ANALYZE
                    ANALYZE_ONLY_NORMAL_PUTCHAR ('\n');
#endif // ANALYZE
                }

                irmp_start_bit_detected = 0;                                        // and wait for next start bit
                irmp_tmp_command        = 0;
                irmp_pulse_time         = 0;
                irmp_pause_time         = 0;

#if IRMP_SUPPORT_JVC_PROTOCOL == 1
                if (irmp_protocol == IRMP_JVC_PROTOCOL)                             // the stop bit of JVC frame is also start bit of next frame
                {                                                                   // set pulse time here!
                    irmp_pulse_time = ((uint_fast8_t)(F_INTERRUPTS * JVC_START_BIT_PULSE_TIME));
                }
#endif // IRMP_SUPPORT_JVC_PROTOCOL == 1
            }
        }
    }

#if defined(STELLARIS_ARM_CORTEX_M4)
    // Clear the timer interrupt
    TimerIntClear(TIMER1_BASE, TIMER_TIMA_TIMEOUT);
#endif

    return (irmp_ir_detected);
}

#ifdef ANALYZE

/*---------------------------------------------------------------------------------------------------------------------------------------------------
 * main functions - for Unix/Linux + Windows only!
 *
 * AVR: see main.c!
 *
 * Compile it under linux with:
 * cc irmp.c -o irmp
 *
 * usage: ./irmp [-v|-s|-a|-l] < file
 *
 * options:
 *   -v verbose
 *   -s silent
 *   -a analyze
 *   -l list pulse/pauses
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */

void
print_spectrum (char * text, int * buf, int is_pulse)
{
    int     i;
    int     j;
    int     min;
    int     max;
    int     max_value = 0;
    int     value;
    int     sum = 0;
    int     counter = 0;
    double  average = 0;
    double  tolerance;

    puts ("-----------------------------------------------------------------------------");
    printf ("%s:\n", text);

    for (i = 0; i < 256; i++)
    {
        if (buf[i] > max_value)
        {
            max_value = buf[i];
        }
    }

    for (i = 1; i < 200; i++)
    {
        if (buf[i] > 0)
        {
            printf ("%3d ", i);
            value = (buf[i] * 60) / max_value;

            for (j = 0; j < value; j++)
            {
                putchar ('o');
            }
            printf (" %d\n", buf[i]);

            sum += i * buf[i];
            counter += buf[i];
        }
        else
        {
            max = i - 1;

            if (counter > 0)
            {
                average = (float) sum / (float) counter;

                if (is_pulse)
                {
                    printf ("pulse ");
                }
                else
                {
                    printf ("pause ");
                }

                printf ("avg: %4.1f=%6.1f us, ", average, (1000000. * average) / (float) F_INTERRUPTS);
                printf ("min: %2d=%6.1f us, ", min, (1000000. * min) / (float) F_INTERRUPTS);
                printf ("max: %2d=%6.1f us, ", max, (1000000. * max) / (float) F_INTERRUPTS);

                tolerance = (max - average);

                if (average - min > tolerance)
                {
                    tolerance = average - min;
                }

                tolerance = tolerance * 100 / average;
                printf ("tol: %4.1f%%\n", tolerance);
            }

            counter = 0;
            sum = 0;
            min = i + 1;
        }
    }
}

#define STATE_LEFT_SHIFT    0x01
#define STATE_RIGHT_SHIFT   0x02
#define STATE_LEFT_CTRL     0x04
#define STATE_LEFT_ALT      0x08
#define STATE_RIGHT_ALT     0x10

#define KEY_ESCAPE          0x1B            // keycode = 0x006e
#define KEY_MENUE           0x80            // keycode = 0x0070
#define KEY_BACK            0x81            // keycode = 0x0071
#define KEY_FORWARD         0x82            // keycode = 0x0072
#define KEY_ADDRESS         0x83            // keycode = 0x0073
#define KEY_WINDOW          0x84            // keycode = 0x0074
#define KEY_1ST_PAGE        0x85            // keycode = 0x0075
#define KEY_STOP            0x86            // keycode = 0x0076
#define KEY_MAIL            0x87            // keycode = 0x0077
#define KEY_FAVORITES       0x88            // keycode = 0x0078
#define KEY_NEW_PAGE        0x89            // keycode = 0x0079
#define KEY_SETUP           0x8A            // keycode = 0x007a
#define KEY_FONT            0x8B            // keycode = 0x007b
#define KEY_PRINT           0x8C            // keycode = 0x007c
#define KEY_ON_OFF          0x8E            // keycode = 0x007c

#define KEY_INSERT          0x90            // keycode = 0x004b
#define KEY_DELETE          0x91            // keycode = 0x004c
#define KEY_LEFT            0x92            // keycode = 0x004f
#define KEY_HOME            0x93            // keycode = 0x0050
#define KEY_END             0x94            // keycode = 0x0051
#define KEY_UP              0x95            // keycode = 0x0053
#define KEY_DOWN            0x96            // keycode = 0x0054
#define KEY_PAGE_UP         0x97            // keycode = 0x0055
#define KEY_PAGE_DOWN       0x98            // keycode = 0x0056
#define KEY_RIGHT           0x99            // keycode = 0x0059
#define KEY_MOUSE_1         0x9E            // keycode = 0x0400
#define KEY_MOUSE_2         0x9F            // keycode = 0x0800

static uint_fast8_t
get_fdc_key (uint_fast16_t cmd)
{
    static uint8_t key_table[128] =
    {
     // 0     1    2    3    4    5    6    7    8     9     A     B     C     D    E    F
         0,   '^', '1', '2', '3', '4', '5', '6', '7',  '8',  '9',  '0',  0xDF, '´', 0,   '\b',
        '\t', 'q', 'w', 'e', 'r', 't', 'z', 'u', 'i',  'o',  'p',  0xFC, '+',   0,   0,   'a',
        's',  'd', 'f', 'g', 'h', 'j', 'k', 'l', 0xF6, 0xE4, '#',  '\r', 0,    '<', 'y', 'x',
        'c',  'v', 'b', 'n', 'm', ',', '.', '-', 0,    0,    0,    0,    0,    ' ', 0,   0,

         0,   '°', '!', '"', '§', '$', '%', '&', '/',  '(',  ')',  '=',  '?',  '`', 0,   '\b',
        '\t', 'Q', 'W', 'E', 'R', 'T', 'Z', 'U', 'I',  'O',  'P',  0xDC, '*',  0,   0,   'A',
        'S',  'D', 'F', 'G', 'H', 'J', 'K', 'L', 0xD6, 0xC4, '\'', '\r', 0,    '>', 'Y', 'X',
        'C',  'V', 'B', 'N', 'M', ';', ':', '_', 0,    0,    0,    0,    0,    ' ', 0,   0
    };
    static uint_fast8_t state;

    uint_fast8_t key = 0;

    switch (cmd)
    {
        case 0x002C: state |=  STATE_LEFT_SHIFT;    break;              // pressed left shift
        case 0x00AC: state &= ~STATE_LEFT_SHIFT;    break;              // released left shift
        case 0x0039: state |=  STATE_RIGHT_SHIFT;   break;              // pressed right shift
        case 0x00B9: state &= ~STATE_RIGHT_SHIFT;   break;              // released right shift
        case 0x003A: state |=  STATE_LEFT_CTRL;     break;              // pressed left ctrl
        case 0x00BA: state &= ~STATE_LEFT_CTRL;     break;              // released left ctrl
        case 0x003C: state |=  STATE_LEFT_ALT;      break;              // pressed left alt
        case 0x00BC: state &= ~STATE_LEFT_ALT;      break;              // released left alt
        case 0x003E: state |=  STATE_RIGHT_ALT;     break;              // pressed left alt
        case 0x00BE: state &= ~STATE_RIGHT_ALT;     break;              // released left alt

        case 0x006e: key = KEY_ESCAPE;              break;
        case 0x004b: key = KEY_INSERT;              break;
        case 0x004c: key = KEY_DELETE;              break;
        case 0x004f: key = KEY_LEFT;                break;
        case 0x0050: key = KEY_HOME;                break;
        case 0x0051: key = KEY_END;                 break;
        case 0x0053: key = KEY_UP;                  break;
        case 0x0054: key = KEY_DOWN;                break;
        case 0x0055: key = KEY_PAGE_UP;             break;
        case 0x0056: key = KEY_PAGE_DOWN;           break;
        case 0x0059: key = KEY_RIGHT;               break;
        case 0x0400: key = KEY_MOUSE_1;             break;
        case 0x0800: key = KEY_MOUSE_2;             break;

        default:
        {
            if (!(cmd & 0x80))                      // pressed key
            {
                if (cmd >= 0x70 && cmd <= 0x7F)     // function keys
                {
                    key = cmd + 0x10;               // 7x -> 8x
                }
                else if (cmd < 64)                  // key listed in key_table
                {
                    if (state & (STATE_LEFT_ALT | STATE_RIGHT_ALT))
                    {
                        switch (cmd)
                        {
                            case 0x0003: key = 0xB2;    break; // upper 2
                            case 0x0008: key = '{';     break;
                            case 0x0009: key = '[';     break;
                            case 0x000A: key = ']';     break;
                            case 0x000B: key = '}';     break;
                            case 0x000C: key = '\\';    break;
                            case 0x001C: key = '~';     break;
                            case 0x002D: key = '|';     break;
                            case 0x0034: key = 0xB5;    break; // Mu
                        }
                    }
                    else if (state & (STATE_LEFT_CTRL))
                    {
                        if (key_table[cmd] >= 'a' && key_table[cmd] <= 'z')
                        {
                            key = key_table[cmd] - 'a' + 1;
                        }
                        else
                        {
                            key = key_table[cmd];
                        }
                    }
                    else
                    {
                        int idx = cmd + ((state & (STATE_LEFT_SHIFT | STATE_RIGHT_SHIFT)) ? 64 : 0);

                        if (key_table[idx])
                        {
                            key = key_table[idx];
                        }
                    }
                }
            }
            break;
        }
    }

    return (key);
}

static int         analyze = FALSE;
static int         list = FALSE;
static IRMP_DATA   irmp_data;
static int         expected_protocol;
static int         expected_address;
static int         expected_command;
static int         do_check_expected_values;

static void
next_tick (void)
{
    if (! analyze && ! list)
    {
        (void) irmp_ISR ();

        if (irmp_get_data (&irmp_data))
        {
            uint_fast8_t key;

            ANALYZE_ONLY_NORMAL_PUTCHAR (' ');

            if (verbose)
            {
                printf ("%8.3fms ", (double) (time_counter * 1000) / F_INTERRUPTS);
            }

            if (irmp_data.protocol == IRMP_ACP24_PROTOCOL)
            {
                uint16_t    temp = (irmp_data.command & 0x000F) + 15;

                printf ("p=%2d (%s), a=0x%04x, c=0x%04x, f=0x%02x, temp=%d",
                        irmp_data.protocol, irmp_protocol_names[irmp_data.protocol], irmp_data.address, irmp_data.command, irmp_data.flags, temp);
            }
            else if (irmp_data.protocol == IRMP_FDC_PROTOCOL && (key = get_fdc_key (irmp_data.command)) != 0)
            {
                if ((key >= 0x20 && key < 0x7F) || key >= 0xA0)
                {
                    printf ("p=%2d (%s), a=0x%04x, c=0x%04x, f=0x%02x, asc=0x%02x, key='%c'",
                            irmp_data.protocol,  irmp_protocol_names[irmp_data.protocol], irmp_data.address, irmp_data.command, irmp_data.flags, key, key);
                }
                else if (key == '\r' || key == '\t' || key == KEY_ESCAPE || (key >= 0x80 && key <= 0x9F))                 // function keys
                {
                    char * p = (char *) NULL;

                    switch (key)
                    {
                        case '\t'                : p = "TAB";           break;
                        case '\r'                : p = "CR";            break;
                        case KEY_ESCAPE          : p = "ESCAPE";        break;
                        case KEY_MENUE           : p = "MENUE";         break;
                        case KEY_BACK            : p = "BACK";          break;
                        case KEY_FORWARD         : p = "FORWARD";       break;
                        case KEY_ADDRESS         : p = "ADDRESS";       break;
                        case KEY_WINDOW          : p = "WINDOW";        break;
                        case KEY_1ST_PAGE        : p = "1ST_PAGE";      break;
                        case KEY_STOP            : p = "STOP";          break;
                        case KEY_MAIL            : p = "MAIL";          break;
                        case KEY_FAVORITES       : p = "FAVORITES";     break;
                        case KEY_NEW_PAGE        : p = "NEW_PAGE";      break;
                        case KEY_SETUP           : p = "SETUP";         break;
                        case KEY_FONT            : p = "FONT";          break;
                        case KEY_PRINT           : p = "PRINT";         break;
                        case KEY_ON_OFF          : p = "ON_OFF";        break;

                        case KEY_INSERT          : p = "INSERT";        break;
                        case KEY_DELETE          : p = "DELETE";        break;
                        case KEY_LEFT            : p = "LEFT";          break;
                        case KEY_HOME            : p = "HOME";          break;
                        case KEY_END             : p = "END";           break;
                        case KEY_UP              : p = "UP";            break;
                        case KEY_DOWN            : p = "DOWN";          break;
                        case KEY_PAGE_UP         : p = "PAGE_UP";       break;
                        case KEY_PAGE_DOWN       : p = "PAGE_DOWN";     break;
                        case KEY_RIGHT           : p = "RIGHT";         break;
                        case KEY_MOUSE_1         : p = "KEY_MOUSE_1";   break;
                        case KEY_MOUSE_2         : p = "KEY_MOUSE_2";   break;
                        default                  : p = "<UNKNWON>";     break;
                    }

                    printf ("p=%2d (%s), a=0x%04x, c=0x%04x, f=0x%02x, asc=0x%02x, key=%s",
                            irmp_data.protocol, irmp_protocol_names[irmp_data.protocol], irmp_data.address, irmp_data.command, irmp_data.flags, key, p);
                }
                else
                {
                    printf ("p=%2d (%s), a=0x%04x, c=0x%04x, f=0x%02x, asc=0x%02x",
                            irmp_data.protocol,  irmp_protocol_names[irmp_data.protocol], irmp_data.address, irmp_data.command, irmp_data.flags, key);
                }
            }
            else
            {
                printf ("p=%2d (%s), a=0x%04x, c=0x%04x, f=0x%02x",
                        irmp_data.protocol, irmp_protocol_names[irmp_data.protocol], irmp_data.address, irmp_data.command, irmp_data.flags);
            }

            if (do_check_expected_values)
            {
                if (irmp_data.protocol != expected_protocol ||
                    irmp_data.address  != expected_address  ||
                    irmp_data.command  != expected_command)
                {
                    printf ("\nerror 7: expected values differ: p=%2d (%s), a=0x%04x, c=0x%04x\n",
                            expected_protocol, irmp_protocol_names[expected_protocol], expected_address, expected_command);
                }
                else
                {
                    printf (" checked!\n");
                }
                do_check_expected_values = FALSE;                           // only check 1st frame in a line!
            }
            else
            {
                putchar ('\n');
            }
        }
    }
}

int
main (int argc, char ** argv)
{
    int         i;
    int         ch;
    int         last_ch = 0;
    int         pulse = 0;
    int         pause = 0;

    int         start_pulses[256];
    int         start_pauses[256];
    int         pulses[256];
    int         pauses[256];

    int         first_pulse = TRUE;
    int         first_pause = TRUE;

    if (argc == 2)
    {
        if (! strcmp (argv[1], "-v"))
        {
            verbose = TRUE;
        }
        else if (! strcmp (argv[1], "-l"))
        {
            list = TRUE;
        }
        else if (! strcmp (argv[1], "-a"))
        {
            analyze = TRUE;
        }
        else if (! strcmp (argv[1], "-s"))
        {
            silent = TRUE;
        }
        else if (! strcmp (argv[1], "-r"))
        {
            radio = TRUE;
        }
    }

    for (i = 0; i < 256; i++)
    {
        start_pulses[i] = 0;
        start_pauses[i] = 0;
        pulses[i] = 0;
        pauses[i] = 0;
    }

    IRMP_PIN = 0xFF;

    while ((ch = getchar ()) != EOF)
    {
        if (ch == '_' || ch == '0')
        {
            if (last_ch != ch)
            {
                if (pause > 0)
                {
                    if (list)
                    {
                        printf ("pause: %d\n", pause);
                    }

                    if (analyze)
                    {
                        if (first_pause)
                        {
                            if (pause < 256)
                            {
                                start_pauses[pause]++;
                            }
                            first_pause = FALSE;
                        }
                        else
                        {
                            if (pause < 256)
                            {
                                pauses[pause]++;
                            }
                        }
                    }
                }
                pause = 0;
            }
            pulse++;
            IRMP_PIN = 0x00;
        }
        else if (ch == 0xaf || ch == '-' || ch == '1')
        {
            if (last_ch != ch)
            {
                if (list)
                {
                    printf ("pulse: %d ", pulse);
                }

                if (analyze)
                {
                    if (first_pulse)
                    {
                        if (pulse < 256)
                        {
                            start_pulses[pulse]++;
                        }
                        first_pulse = FALSE;
                    }
                    else
                    {
                        if (pulse < 256)
                        {
                            pulses[pulse]++;
                        }
                    }
                }
                pulse = 0;
            }

            pause++;
            IRMP_PIN = 0xff;
        }
        else if (ch == '\n')
        {
            IRMP_PIN = 0xff;
            time_counter = 0;

            if (list && pause > 0)
            {
                printf ("pause: %d\n", pause);
            }
            pause = 0;

            if (! analyze)
            {
                for (i = 0; i < (int) ((10000.0 * F_INTERRUPTS) / 10000); i++)               // newline: long pause of 10000 msec
                {
                    next_tick ();
                }
            }
            first_pulse = TRUE;
            first_pause = TRUE;
        }
        else if (ch == '#')
        {
            time_counter = 0;

            if (analyze)
            {
                while ((ch = getchar()) != '\n' && ch != EOF)
                {
                    ;
                }
            }
            else
            {
                char            buf[1024];
                char *          p;
                int             idx = -1;

                puts ("----------------------------------------------------------------------");
                putchar (ch);


                while ((ch = getchar()) != '\n' && ch != EOF)
                {
                    if (ch != '\r')                                                         // ignore CR in DOS/Windows files
                    {
                        if (ch == '[' && idx == -1)
                        {
                            idx = 0;
                        }
                        else if (idx >= 0)
                        {
                            if (ch == ']')
                            {
                                do_check_expected_values = FALSE;
                                buf[idx] = '\0';
                                idx = -1;

                                expected_protocol = atoi (buf);

                                if (expected_protocol > 0)
                                {
                                    p = buf;
                                    while (*p)
                                    {
                                        if (*p == 'x')
                                        {
                                            p++;

                                            if (sscanf (p, "%x", &expected_address) == 1)
                                            {
                                                do_check_expected_values = TRUE;
                                            }
                                            break;
                                        }
                                        p++;
                                    }

                                    if (do_check_expected_values)
                                    {
                                        do_check_expected_values = FALSE;

                                        while (*p)
                                        {
                                            if (*p == 'x')
                                            {
                                                p++;

                                                if (sscanf (p, "%x", &expected_command) == 1)
                                                {
                                                    do_check_expected_values = TRUE;
                                                }
                                                break;
                                            }
                                            p++;
                                        }

                                        if (do_check_expected_values)
                                        {
                                            // printf ("!%2d %04x %04x!\n", expected_protocol, expected_address, expected_command);
                                        }
                                    }
                                }
                            }
                            else if (idx < 1024 - 2)
                            {
                                buf[idx++] = ch;
                            }
                        }
                        putchar (ch);
                    }
                }
                putchar ('\n');
            }

        }

        last_ch = ch;

        next_tick ();
    }

    if (analyze)
    {
        print_spectrum ("START PULSES", start_pulses, TRUE);
        print_spectrum ("START PAUSES", start_pauses, FALSE);
        print_spectrum ("PULSES", pulses, TRUE);
        print_spectrum ("PAUSES", pauses, FALSE);
        puts ("-----------------------------------------------------------------------------");
    }
    return 0;
}

#endif // ANALYZE

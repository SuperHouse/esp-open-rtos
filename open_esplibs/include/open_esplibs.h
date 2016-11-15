#ifndef _OPEN_ESPLIBS_H
#define _OPEN_ESPLIBS_H

// This header includes conditional defines to control which bits of the
// Open-Source libraries get built when building esp-open-rtos.  This can be
// useful for quickly troubleshooting whether a bug is due to the
// reimplementation of Espressif libraries, or something else.

#ifndef OPEN_ESPLIBS
#define OPEN_ESPLIBS 1
#endif

#ifndef OPEN_LIBMAIN
#define OPEN_LIBMAIN (OPEN_ESPLIBS)
#endif

#ifndef OPEN_LIBMAIN_MISC
#define OPEN_LIBMAIN_MISC (OPEN_LIBMAIN)
#endif
#ifndef OPEN_LIBMAIN_OS_CPU_A
#define OPEN_LIBMAIN_OS_CPU_A (OPEN_LIBMAIN)
#endif
#ifndef OPEN_LIBMAIN_SPI_FLASH
#define OPEN_LIBMAIN_SPI_FLASH (OPEN_LIBMAIN)
#endif
#ifndef OPEN_LIBMAIN_TIMERS
#define OPEN_LIBMAIN_TIMERS (OPEN_LIBMAIN)
#endif
#ifndef OPEN_LIBMAIN_UART
#define OPEN_LIBMAIN_UART (OPEN_LIBMAIN)
#endif
#ifndef OPEN_LIBMAIN_XTENSA_CONTEXT
#define OPEN_LIBMAIN_XTENSA_CONTEXT (OPEN_LIBMAIN)
#endif
#ifndef OPEN_LIBMAIN_USER_INTERFACE
#define OPEN_LIBMAIN_USER_INTERFACE (OPEN_LIBMAIN)
#endif

#ifndef OPEN_LIBNET80211
#define OPEN_LIBNET80211 (OPEN_ESPLIBS)
#endif
#ifndef OPEN_LIBNET80211_ETS
#define OPEN_LIBNET80211_ETS (OPEN_LIBNET80211)
#endif
#ifndef OPEN_LIBNET80211_HOSTAP
#define OPEN_LIBNET80211_HOSTAP (OPEN_LIBNET80211)
#endif
#ifndef OPEN_LIBNET80211_INPUT
#define OPEN_LIBNET80211_INPUT (OPEN_LIBNET80211)
#endif
#ifndef OPEN_LIBNET80211_STA
#define OPEN_LIBNET80211_STA (OPEN_LIBNET80211)
#endif
#ifndef OPEN_LIBNET80211_WL_CNX
#define OPEN_LIBNET80211_WL_CNX (OPEN_LIBNET80211)
#endif

#ifndef OPEN_LIBPHY
#define OPEN_LIBPHY (OPEN_ESPLIBS)
#endif

#ifndef OPEN_LIBPHY_PHY_ANA
#define OPEN_LIBPHY_PHY_ANA (OPEN_LIBPHY)
#endif

#ifndef OPEN_LIBPHY_PHY_CAL
#define OPEN_LIBPHY_PHY_CAL (OPEN_LIBPHY)
#endif

#ifndef OPEN_LIBPHY_PHY_CHIP_V6
#define OPEN_LIBPHY_PHY_CHIP_V6 (OPEN_LIBPHY)
#endif

#ifndef OPEN_LIBPHY_PHY
#define OPEN_LIBPHY_PHY (OPEN_LIBPHY)
#endif

#ifndef OPEN_LIBPHY_PHY_SLEEP
#define OPEN_LIBPHY_PHY_SLEEP (OPEN_LIBPHY)
#endif

#ifndef OPEN_LIBPP
#define OPEN_LIBPP (OPEN_ESPLIBS)
#endif

#ifndef OPEN_LIBPP_ESF_BUF
#define OPEN_LIBPP_ESF_BUF (OPEN_LIBPP)
#endif

#ifndef OPEN_LIBPP_IF_HWCTRL
#define OPEN_LIBPP_IF_HWCTRL (OPEN_LIBPP)
#endif

#ifndef OPEN_LIBPP_LMAC
#define OPEN_LIBPP_LMAC (OPEN_LIBPP)
#endif

#ifndef OPEN_LIBPP_PM
#define OPEN_LIBPP_PM (OPEN_LIBPP)
#endif

#ifndef OPEN_LIBPP_PP
#define OPEN_LIBPP_PP (OPEN_LIBPP)
#endif

#ifndef OPEN_LIBPP_WDEV
#define OPEN_LIBPP_WDEV (OPEN_LIBPP)
#endif

#ifndef OPEN_LIBWPA
#define OPEN_LIBWPA (OPEN_ESPLIBS)
#endif

#ifndef OPEN_LIBWPA_OS_XTENSA
#define OPEN_LIBWPA_OS_XTENSA (OPEN_LIBWPA)
#endif

#ifndef OPEN_LIBWPA_WPA_MAIN
#define OPEN_LIBWPA_WPA_MAIN (OPEN_LIBWPA)
#endif

#endif /* _OPEN_ESPLIBS_H */

# Component makefile for "open Espressif libs"

INC_DIRS += $(open_esplibs_ROOT)include

$(eval $(call component_compile_rules,open_esplibs))

# args for passing into compile rule generation
open_esplibs_libmain_ROOT = $(open_esplibs_ROOT)libmain
open_esplibs_libmain_INC_DIR = 
open_esplibs_libmain_SRC_DIR = $(open_esplibs_libmain_ROOT)
open_esplibs_libmain_EXTRA_SRC_FILES = 
open_esplibs_libmain_CFLAGS = $(CFLAGS)

$(eval $(call component_compile_rules,open_esplibs_libmain))

open_esplibs_libnet80211_ROOT = $(open_esplibs_ROOT)libnet80211
open_esplibs_libnet80211_INC_DIR = 
open_esplibs_libnet80211_SRC_DIR = $(open_esplibs_libnet80211_ROOT)
open_esplibs_libnet80211_EXTRA_SRC_FILES = 
open_esplibs_libnet80211_CFLAGS = $(CFLAGS)

$(eval $(call component_compile_rules,open_esplibs_libnet80211))

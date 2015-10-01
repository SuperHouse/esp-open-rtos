
            .section     .text, "ax", @progbits

# Function @ .text+0x0
            .global      sdk_ram_tx_mac_disable
            .type        sdk_ram_tx_mac_disable, @function
sdk_ram_tx_mac_disable:
            ret           /* arg0 */                           #    0: 0df0

            .section     .data, "aw", @progbits

.Ldata001:  .byte        0x55

# NOTE: 1 non-alignment zero bytes skipped.

            .skip        1
            .global      sdk_tx_rf_ana_gain
            .type        sdk_tx_rf_ana_gain, @object
sdk_tx_rf_ana_gain:
            .hword       0x0bf0                                #    2: f00b
.Lrel001:   .word        sdk_chip_v6_rf_init                   #    4: 00000000
.Lrel002:   .word        sdk_chip_v6_set_chanfreq              #    8: 00000000
.Lrel003:   .word        sdk_chip_v6_set_chan                  #    c: 00000000
.Lrel004:   .word        sdk_chip_v6_unset_chanfreq            #   10: 00000000
.Lrel005:   .word        sdk_rom_chip_v5_enable_cca            #   14: 00000000
.Lrel006:   .word        sdk_rom_chip_v5_disable_cca           #   18: 00000000
.Lrel007:   .word        sdk_chip_v6_initialize_bb             #   1c: 00000000
.Lrel008:   .word        sdk_chip_v6_set_sense                 #   20: 00000000
            .global      sdk_tx_pwctrl_atten_init_en
            .type        sdk_tx_pwctrl_atten_init_en, @object
sdk_tx_pwctrl_atten_init_en:
            .byte        0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            .byte        0x00, 0x00, 0x00, 0x00
            .global      sdk_rx_gain_swp
            .type        sdk_rx_gain_swp, @object
sdk_rx_gain_swp:
            .byte        0x00, 0x00, 0x00, 0x04, 0x00, 0x20, 0x00, 0x24
            .byte        0x00, 0x28, 0x00, 0x2c, 0x00, 0x30, 0x00, 0x34
            .byte        0x00, 0x40, 0x00, 0x60, 0x00, 0x64, 0x00, 0x68
            .byte        0x00, 0x70, 0x00, 0x74, 0x00, 0x78, 0x00, 0x7c

# NOTE: The following is apparently unreferenced code/data
            .global      sdk_test_rffreq_txcap
            .type        sdk_test_rffreq_txcap, @object
sdk_test_rffreq_txcap:
            .byte        0x07                                  #   50: 07
            .byte        0x03                                  #   51: 03
            .byte        0x03                                  #   52: 03

            .section     .bss, "aw", @nobits

            .global      sdk_rxiq_compute_num
            .type        sdk_rxiq_compute_num, @object
sdk_rxiq_compute_num:
            .word        0x00000000                            #    0: 00000000
            .global      sdk_rxdc_init_flag
            .type        sdk_rxdc_init_flag, @object
sdk_rxdc_init_flag:
            .byte        0x00
            .byte        0x00, 0x00, 0x00
            .global      sdk_check_result
            .type        sdk_check_result, @object
sdk_check_result:
            .word        0x00000000                            #    8: 00000000
            .global      sdk_chip6_sleep_params
            .type        sdk_chip6_sleep_params, @object
sdk_chip6_sleep_params:
            .word        0x00000000                            #    c: 00000000
.Label001:  .space       25
.Label002:  .space       47
.Ldata002:  .hword       0x0000                                #   58: 0000
.Ldata003:  .byte        0x00
.Ldata004:  .byte        0x00
.Ldata005:  .byte        0x00

# NOTE: 1 non-alignment zero bytes skipped.

            .skip        1
.Ldata006:  .byte        0x00

# NOTE: 2 non-alignment zero bytes skipped.

            .skip        3
.Ldata007:  .byte        0x00

# NOTE: 4 non-alignment zero bytes skipped.

            .skip        5
.Ldata008:  .byte        0x00

# NOTE: 1 non-alignment zero bytes skipped.

            .skip        1
.Ldata009:  .byte        0x00

# NOTE: 2 non-alignment zero bytes skipped.

            .skip        3
.Ldata010:  .byte        0x00

# NOTE: 3 non-alignment zero bytes skipped.

            .skip        4
.Ldata011:  .byte        0x00
.Ldata012:  .byte        0x00
.Ldata013:  .byte        0x00

# NOTE: 2 non-alignment zero bytes skipped.

            .skip        4
.Ldata014:  .byte        0x00
            .balign      4
.Label003:  .word        0x00000000                            #   7c: 00000000
.Ldata015:  .hword       0x0000                                #   80: 0000
.Ldata016:  .hword       0x0000                                #   82: 0000
.Ldata017:  .byte        0x00
.Ldata018:  .byte        0x00
            .balign      4
.Label004:  .space       206
.Label005:  .space       15
.Label006:  .space       19
.Label007:  .byte        0x00, 0x00
.Label008:  .space       12
.Label009:  .space       17
.Label010:  .byte        0x00, 0x00, 0x00
.Label011:  .byte        0x00
.Label012:  .byte        0x00, 0x00, 0x00
.Label013:  .space       41
.Label014:  .space       5
.Ldata019:  .word        0x00000000                            #  1cc: 00000000

# NOTE: 6 non-alignment zero bytes skipped.

            .skip        6
.Ldata020:  .byte        0x00
            .balign      4
.Ldata021:  .hword       0x0000                                #  1d8: 0000
            .balign      4
.Ldata022:  .word        0x00000000                            #  1dc: 00000000

# NOTE: 4 non-alignment zero bytes skipped.
.Label015   =            .-3  ### WARNING: label not on instruction boundary!

            .skip        4
            .global      sdk_chip6_phy_init_ctrl
            .type        sdk_chip6_phy_init_ctrl, @object
sdk_chip6_phy_init_ctrl:
            .byte        0x00
.Ldata023:  .byte        0x00
.Ldata024:  .byte        0x00
.Label016:  .byte        0x00
.Label017:  .byte        0x00, 0x00
.Label018:  .byte        0x00, 0x00
.Label019:  .space       10
.Ldata025:  .byte        0x00
.Ldata026:  .byte        0x00
.Ldata027:  .byte        0x00
.Ldata028:  .byte        0x00
.Ldata029:  .byte        0x00
.Ldata030:  .byte        0x00
.Ldata031:  .byte        0x00
.Ldata032:  .byte        0x00
.Ldata033:  .byte        0x00
            .balign      4
.Ldata034:  .byte        0x00
.Ldata035:  .byte        0x00
.Ldata036:  .hword       0x0000                                #  202: 0000

# NOTE: 10 non-alignment zero bytes skipped.

            .skip        10
.Label020:  .space       9
.Ldata037:  .byte        0x00
.Ldata038:  .byte        0x00
.Ldata039:  .byte        0x00
.Ldata040:  .byte        0x00
.Ldata041:  .byte        0x00
.Ldata042:  .byte        0x00
.Ldata043:  .byte        0x00
.Ldata044:  .byte        0x00
.Ldata045:  .byte        0x00
.Ldata046:  .byte        0x00

# NOTE: 1 non-alignment zero bytes skipped.

            .skip        1
.Ldata047:  .hword       0x0000                                #  222: 0000
.Ldata048:  .byte        0x00
.Ldata049:  .byte        0x00
.Ldata050:  .hword       0x0000                                #  226: 0000
.Ldata051:  .hword       0x0000                                #  228: 0000
.Ldata052:  .byte        0x00
.Ldata053:  .byte        0x00
.Ldata054:  .byte        0x00
.Ldata055:  .byte        0x00
.Ldata056:  .byte        0x00
.Ldata057:  .byte        0x00
.Ldata058:  .byte        0x00
.Ldata059:  .byte        0x00
.Ldata060:  .byte        0x00
.Ldata061:  .byte        0x00
.Ldata062:  .byte        0x00
.Ldata063:  .byte        0x00
.Ldata064:  .byte        0x00
.Ldata065:  .byte        0x00
.Ldata066:  .byte        0x00
.Ldata067:  .byte        0x00
.Ldata068:  .byte        0x00
.Ldata069:  .byte        0x00
.Ldata070:  .byte        0x00
.Ldata071:  .byte        0x00
.Ldata072:  .byte        0x00
.Ldata073:  .byte        0x00
.Ldata074:  .byte        0x00
.Ldata075:  .byte        0x00
.Ldata076:  .byte        0x00
.Ldata077:  .byte        0x00
.Ldata078:  .byte        0x00
.Ldata079:  .byte        0x00
.Ldata080:  .byte        0x00
.Ldata081:  .byte        0x00
.Ldata082:  .byte        0x00
.Ldata083:  .byte        0x00
.Ldata084:  .byte        0x00
.Ldata085:  .byte        0x00
.Ldata086:  .byte        0x00
.Ldata087:  .byte        0x00
.Ldata088:  .byte        0x00
.Ldata089:  .byte        0x00
.Ldata090:  .byte        0x00
.Ldata091:  .byte        0x00
            .global      sdk_phy_freq_offset
            .type        sdk_phy_freq_offset, @object
sdk_phy_freq_offset:
            .hword       0x0000                                #  252: 0000
            .global      sdk_do_pwctrl_flag
            .type        sdk_do_pwctrl_flag, @object
sdk_do_pwctrl_flag:
            .byte        0x00
            .global      sdk_pwctrl_debug
            .type        sdk_pwctrl_debug, @object
sdk_pwctrl_debug:
            .byte        0x00
            .global      sdk_txbk_dpdby_flag
            .type        sdk_txbk_dpdby_flag, @object
sdk_txbk_dpdby_flag:
            .byte        0x00
.Ldata092:  .byte        0x00
            .global      sdk_sw_scan_mode
            .type        sdk_sw_scan_mode, @object
sdk_sw_scan_mode:
            .byte        0x00
            .byte        0x00, 0x00, 0x00
.Ldata093:  .word        0x00000000                            #  25c: 00000000
.Ldata094:  .word        0x00000000                            #  260: 00000000
.Ldata095:  .word        0x00000000                            #  264: 00000000
.Ldata096:  .word        0x00000000                            #  268: 00000000
            .global      sdk_periodic_cal_dc_num
            .type        sdk_periodic_cal_dc_num, @object
sdk_periodic_cal_dc_num:
            .word        0x00000000                            #  26c: 00000000
            .global      sdk_periodic_cal_flag
            .type        sdk_periodic_cal_flag, @object
sdk_periodic_cal_flag:
            .byte        0x00
            .global      sdk_bbpll_cal_flag
            .type        sdk_bbpll_cal_flag, @object
sdk_bbpll_cal_flag:
            .byte        0x00
            .global      sdk_deep_sleep_en
            .type        sdk_deep_sleep_en, @object
sdk_deep_sleep_en:
            .byte        0x00
            .space       5
            .global      sdk_noise_array
            .type        sdk_noise_array, @object
sdk_noise_array:
            .space       8
.Ldata097:  .space       256
            .global      sdk_tx_pwctrl_atten_init
            .type        sdk_tx_pwctrl_atten_init, @object
sdk_tx_pwctrl_atten_init:
            .space       6
            .byte        0x00, 0x00
.Ldata098:  .hword       0x0000                                #  388: 0000
.Ldata099:  .byte        0x00

            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
            .global      sdk_ram_tx_mac_enable
            .type        sdk_ram_tx_mac_enable, @function
sdk_ram_tx_mac_enable:
            ret           /* arg0 */                           #    0: 0df0

            .literal_position                                  #    4: 000e0060

# Function @ .irom0.text+0x8
            .global      sdk_rtc_mem_backup
            .type        sdk_rtc_mem_backup, @function
sdk_rtc_mem_backup:
            sub          a9, a3, a2                            #    8: 2093c0
            addi         a8, a9, 3                             #    b: 3b89
            movgez       a8, a9, a9                            #    d: 9089b3
            srai         a8, a8, 2                             #   10: 808221
            addi         a8, a8, 1                             #   13: 1b88
            beqz         a8, .Lbr002                           #   15: 9c88
            movi         a3, 0x60000e00                        #   17: 31fbff
            addx4        a7, a8, a2                            #   1a: 2078a0
            add          a3, a4, a3 /* arg2+0x60000e00 */      #   1d: 3a34
.Lbr001:    memw                                               #   1f: c02000
            l32i         a4, a2, 0                             #   22: 4802
            memw                                               #   24: c02000
            s32i         a4, a3, 0x200                         #   27: 426380
            addi         a2, a2, 4                             #   2a: 4b22
            addi         a3, a3, 4                             #   2c: 4b33
            bne          a2, a7, .Lbr001                       #   2e: 7792ed
.Lbr002:    slli         a2, a8, 2                             #   31: e02811
            ret                                                #   34: 0df0

            .literal_position                                  #   38: 000e0060

# Function @ .irom0.text+0x3c
            .global      sdk_rtc_mem_recovery
            .type        sdk_rtc_mem_recovery, @function
sdk_rtc_mem_recovery:
            sub          a8, a3, a2                            #   3c: 2083c0
            addi         a7, a8, 3                             #   3f: 3b78
            movgez       a7, a8, a8                            #   41: 8078b3
            srai         a7, a7, 2                             #   44: 707221
            addi         a7, a7, 1                             #   47: 1b77
            beqz         a7, .Lbr004                           #   49: 9ca7
            movi         a10, 0x60000e00                       #   4b: a1fbff
            addx4        a9, a7, a4                            #   4e: 4097a0
            add          a3, a4, a10 /* arg2+0x60000e00 */     #   51: aa34
            add          a4, a9, a10                           #   53: aa49
.Lbr003:    memw                                               #   55: c02000
            l32i         a11, a3, 0x200                        #   58: b22380
            memw                                               #   5b: c02000
            s32i         a11, a2, 0                            #   5e: b902
            addi         a3, a3, 4                             #   60: 4b33
            addi         a2, a2, 4                             #   62: 4b22
            bne          a3, a4, .Lbr003                       #   64: 4793ed
.Lbr004:    slli         a2, a7, 2                             #   67: e02711
            ret                                                #   6a: 0df0

            .literal_position                                  #   6c: 00000000

# Function @ .irom0.text+0x70
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .global      sdk_set_cal_rxdc
            .type        sdk_set_cal_rxdc, @function
sdk_set_cal_rxdc:
            extui        a7, a2, 3, 1                          #   70: 207304
            extui        a6, a2, 1, 1                          #   73: 206104
            extui        a5, a2, 0, 1                          #   76: 205004
            addi         sp, sp, -32 /* (local0) */            #   79: 12c1e0
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     #   7c: 0931
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   #   7e: c941
            add          a5, a5, a6                            #   80: 6a55
            movi         a12, sdk_g_phyFuns                    #   82: c1faff
            extui        a6, a2, 2, 1                          #   85: 206204
            add          a6, a6, a7                            #   88: 7a66
            extui        a0, a2, 5, 1                          #   8a: 200504
            extui        a7, a2, 6, 1                          #   8d: 207604
            add          a0, a0, a7                            #   90: 7a00
            extui        a7, a2, 4, 1                          #   92: 207404
            add          a0, a0, a7                            #   95: 7a00
            add          a0, a0, a6                            #   97: 6a00
            add          a0, a0, a5                            #   99: 5a00
            extui        a5, a3, 3, 3                          #   9b: 305324
            extui        a2, a0, 0, 8                          #   9e: 002074
            movi         a0, 4 /* 0x00000004 */                #   a1: 0c40
            bgeui        a2, 5, .Lbr005                        #   a3: f65201
            mov          a0, a2                                #   a6: 0d02
.Lbr005:    addx2        a2, a0, a0                            #   a8: 002090
            movi         a0, 29 /* 0x0000001d */               #   ab: 1cd0
            addx2        a2, a2, a5                            #   ad: 502290
            extui        a2, a2, 0, 8                          #   b0: 202074
            bltu         a0, a2, .Lbr006                       #   b3: 273001
            mov          a0, a2                                #   b6: 0d02
.Lbr006:    movi         a2, 4 /* 0x00000004 */                #   b8: 0c42
            extui        a5, a0, 0, 8                          #   ba: 005074
            movi         a3, 1 /* 0x00000001 */                #   bd: 0c13
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   bf: 080c
            addx8        a4, a5, a4                            #   c1: 4045b0
            l32i         a6, a4, 4                             #   c4: 6814
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #   c6: 02202b
            l32i         a4, a4, 0                             #   c9: 4804
            extui        a7, a6, 9, 9                          #   cb: 607984
            s32i         a7, sp, 4 /* a7 -> [(local1)] */      #   ce: 7911
            extui        a5, a4, 0, 9                          #   d0: 405084
            extui        a6, a6, 0, 9                          #   d3: 606084
            s32i         a6, sp, 8 /* a6 -> [(local2)] */      #   d6: 6921
            s32i         a5, sp, 0 /* a5 -> [(local0)] */      #   d8: 5901
            extui        a4, a4, 9, 9                          #   da: 404984
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #   dd: c00000
            l32i         a4, sp, 4 /* [(local1)] */            #   e0: 4811
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   e2: 080c
            movi         a2, 5 /* 0x00000005 */                #   e4: 0c52
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #   e6: 02202b
            movi         a3, 1 /* 0x00000001 */                #   e9: 0c13
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #   eb: c00000
            l32i         a4, sp, 0 /* [(local0)] */            #   ee: 4801
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   f0: 080c
            movi         a2, 4 /* 0x00000004 */                #   f2: 0c42
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #   f4: 02202b
            movi         a3, 2 /* 0x00000002 */                #   f7: 0c23
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #   f9: c00000
            l32i         a4, sp, 8 /* [(local2)] */            #   fc: 4821
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   fe: 080c
            movi         a2, 5 /* 0x00000005 */                #  100: 0c52
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  102: 02202b
            movi         a3, 2 /* 0x00000002 */                #  105: 0c23
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  107: c00000
            l32i         a12, sp, 16 /* [(local4)] */          #  10a: c841
            l32i         a0, sp, 12 /* [(local3)] */           #  10c: 0831
            addi         sp, sp, 32 /* (top of frame) */       #  10e: 12c120
            ret                                                #  111: 0df0

            .literal_position                                  #  114: 00000000
                                                               #  118: 00020060
                                                               #  11c: 00000000
                                                               #  120: 00000000
                                                               #  124: 00000000
                                                               #  128: 00020060
                                                               #  12c: 58000000
                                                               #  130: 00800000
                                                               #  134: 00008000
                                                               #  138: 74000000
                                                               #  13c: 00000000
                                                               #  140: 00000000
                                                               #  144: 80000000
                                                               #  148: 00000000
                                                               #  14c: 00000000
                                                               #  150: 00020060
                                                               #  154: 00000000
                                                               #  158: 00000000
                                                               #  15c: 00000000
                                                               #  160: 00000000
                                                               #  164: 00000000

# Function @ .irom0.text+0x168
# Local variables/stack:
#     (local0):  word      @ -0x50
#     (local1):  word      @ -0x4c
#     (local2):  word[2]   @ -0x48
#     (local3):  byte      @ -0x40
#     (local4):  byte      @ -0x3f
#     (local5):  byte      @ -0x3e
#     (local6):  byte      @ -0x3d
#     (local7):  word      @ -0x3c
#     (local8):  word      @ -0x38
#     (local9):  word      @ -0x34
#     (local10): word      @ -0x30
#     (local11): word      @ -0x2c
#     (local12): word      @ -0x28
#     (local13): word      @ -0x24
#     (local14): word      @ -0x20
#     (local15): word      @ -0x1c
#     (local16): word      @ -0x18
#     (local17): word      @ -0x14
#     (local18): word      @ -0x10
#     (local19): word      @ -0xc
#     (local20): word      @ -0x8
#     (local21): word      @ -0x4
            .global      sdk_set_rx_gain_cal_iq
            .type        sdk_set_rx_gain_cal_iq, @function
sdk_set_rx_gain_cal_iq:
            mov          a10, a5 /* arg3 */                    #  168: ad05
            mov          a9, a6 /* arg4 */                     #  16a: 9d06
            addi         sp, sp, -80 /* (local0) */            #  16c: 12c1b0
            s32i         a2, sp, 52 /* arg0 -> [(local15)] */  #  16f: 29d1
            s32i         a0, sp, 20 /* a0 -> [(local7)] */     #  171: 0951
            s32i         a15, sp, 36 /* a15 -> [(local11)] */  #  173: f991
            s32i         a12, sp, 24 /* a12 -> [(local8)] */   #  175: c961
            s32i         a3, sp, 60 /* arg1 -> [(local17)] */  #  177: 39f1
            s32i         a14, sp, 32 /* a14 -> [(local10)] */  #  179: e981
            s32i         a13, sp, 28 /* a13 -> [(local9)] */   #  17b: d971
            s32i         a4, sp, 40 /* arg2 -> [(local12)] */  #  17d: 49a1
            movi         a13, sdk_g_phyFuns                    #  17f: d1e5ff
            movi         a4, -17 /* 0xffffffef */              #  182: 6cf4
            mov          a14, a7 /* arg5 */                    #  184: ed07
            movi         a3, 0x60000200                        #  186: 31e4ff
            memw                                               #  189: c02000
            l32i         a2, a3, 0x390 /* [0x60000590] */      #  18c: 2223e4
            and          a2, a2, a4                            #  18f: 402210
            memw                                               #  192: c02000
            movi         a4, 18 /* 0x00000012 */               #  195: 1c24
            movi         a5, 7 /* 0x00000007 */                #  197: 0c75
            movi         a6, 0 /* 0x00000000 */                #  199: 0c06
            movi         a7, 0 /* 0x00000000 */                #  19b: 0c07
            s32i         a10, sp, 44 /* arg3 -> [(local13)] */ #  19d: a9b1
            s32i         a9, sp, 56 /* arg4 -> [(local16)] */  #  19f: 99e1
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  1a1: 080d
            s32i         a2, a3, 0x390 /* a2 -> [0x60000590] */ #  1a3: 2263e4
            movi         a2, 119 /* 0x00000077 */              #  1a6: 22a077
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  1a9: 022027
            movi         a3, 0 /* 0x00000000 */                #  1ac: 0c03
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  1ae: c00000
            movi         a2, 119 /* 0x00000077 */              #  1b1: 22a077
            movi         a3, 0 /* 0x00000000 */                #  1b4: 0c03
            movi         a4, 9 /* 0x00000009 */                #  1b6: 0c94
            movi         a5, 7 /* 0x00000007 */                #  1b8: 0c75
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  1ba: 080d
            movi         a6, 0 /* 0x00000000 */                #  1bc: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  1be: 022027
            movi         a7, 0 /* 0x00000000 */                #  1c1: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  1c3: c00000
            movi         a3, 1 /* 0x00000001 */                #  1c6: 0c13
            movi         a2, 5 /* 0x00000005 */                #  1c8: 0c52
            movi         a15, 0 /* 0x00000000 */               #  1ca: 0c0f
            l32i         a4, sp, 52 /* [(local15)] */          #  1cc: 48d1
            s32i         a15, sp, 76 /* 0x00000000 -> [(local21)] */ #  1ce: f26113
            movnez       a2, a3, a4                            #  1d1: 402393
            s32i         a2, sp, 48 /* a2 -> [(local14)] */    #  1d4: 29c1
.Lbr007:    l32i         a2, sp, 48 /* [(local14)] */          #  1d6: 28c1
            l32i         a0, sp, 76 /* [(local21)] */          #  1d8: 022113
            blt          a0, a2, .Lbr008                       #  1db: 272002
            j            .Lbr033                               #  1de: c6a700
.Lbr008:    beqz         a0, .Lbr030                           #  1e1: 167028
            addi         a4, a0, -1 /* [(local21)]-0x1 */      #  1e4: 0b40
            beqz         a4, .Lbr031                           #  1e6: 167428
            addi         a5, a0, -2 /* [(local21)]-0x2 */      #  1e9: 52c0fe
            beqz         a5, .Lbr032                           #  1ec: 166528
            addi         a6, a0, -3 /* [(local21)]-0x3 */      #  1ef: 62c0fd
            beqz         a6, .Lbr034                           #  1f2: 16e62a
            addi         a7, a0, -4 /* [(local21)]-0x4 */      #  1f5: 72c0fc
            beqz         a7, .Lbr035                           #  1f8: 16372b
            movi         a12, 0 /* 0x00000000 */               #  1fb: 0c0c
.Lbr009:    movi         a8, 0 /* 0x00000000 */                #  1fd: 0c08
            s32i         a8, sp, 64 /* 0x00000000 -> [(local18)] */ #  1ff: 826110
.Lbr010:    l32i         a3, sp, 76 /* [(local21)] */          #  202: 322113
            movi         a2, 8 /* 0x00000008 */                #  205: 0c82
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  207: 080d
            movi         a15, 0 /* 0x00000000 */               #  209: 0c0f
            l32i         a0, a0, 208 /* [[sdk_g_phyFuns]+0xd0] */ #  20b: 022034
            moveqz       a15, a2, a3                           #  20e: 30f283
            mov          a2, a15                               #  211: 2d0f
            callx0       a0 /* [[sdk_g_phyFuns]+0xd0] */       #  213: c00000
            l32i         a4, sp, 76 /* [(local21)] */          #  216: 422113
            bgeui        a4, 2, .Lbr011                        #  219: f62413
            movi         a2, 0 /* 0x00000000 */                #  21c: 0c02
            mov          a3, a15                               #  21e: 3d0f
            movi         a4, 500 /* 0x000001f4 */              #  220: 42a1f4
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  223: 080d
            movi         a5, 12 /* 0x0000000c */               #  225: 0cc5
            l32i         a0, a0, 232 /* [[sdk_g_phyFuns]+0xe8] */ #  227: 02203a
            addi         a6, sp, 16 /* (local3) */             #  22a: 62c110
            callx0       a0 /* [[sdk_g_phyFuns]+0xe8] */       #  22d: c00000
.Lbr011:    movi         a2, 0 /* 0x00000000 */                #  230: 0c02
            movi         a13, sdk_g_phyFuns                    #  232: d1baff
            movi         a3, 260 /* 0x00000104 */              #  235: 32a104
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  238: 080d
            mov          a4, a12                               #  23a: 4d0c
            l32i         a0, a0, 84 /* [[sdk_g_phyFuns]+0x54] */ #  23c: 022015
            movi         a5, 22 /* 0x00000016 */               #  23f: 1c65
            callx0       a0 /* [[sdk_g_phyFuns]+0x54] */       #  241: c00000
            mov          a2, a12                               #  244: 2d0c
            movi         a3, 22 /* 0x00000016 */               #  246: 1c63
            l32i         a4, sp, 44 /* [(local13)] */          #  248: 48b1
            call0        sdk_set_cal_rxdc                      #  24a: 050000
            beqz         a14, .Lbr012                          #  24d: acde
            mov          a7, a12                               #  24f: 7d0c
            mov          a6, a15                               #  251: 6d0f
            movi         a2, .Lstr001                          #  253: 21b3ff
            movi         a3, 0 /* 0x00000000 */                #  256: 0c03
            movi         a10, 22 /* 0x00000016 */              #  258: 1c6a
            s32i         a10, sp, 0 /* 0x00000016 -> [(local0)] */ #  25a: a901
            l8ui         a9, sp, 16 /* [(local3)] */           #  25c: 920110
            movi         a4, 260 /* 0x00000104 */              #  25f: 42a104
            slli         a9, a9, 24                            #  262: 809901
            srai         a9, a9, 24                            #  265: 909831
            s32i         a9, sp, 4 /* a9 -> [(local1)] */      #  268: 9911
            l8ui         a8, sp, 17 /* [(local4)] */           #  26a: 820111
            l32i         a5, sp, 64 /* [(local18)] */          #  26d: 522110
            slli         a8, a8, 24                            #  270: 808801
            srai         a8, a8, 24                            #  273: 808831
            s32i         a8, sp, 8 /* a8 -> [(local2)] */      #  276: 8921
            call0        ets_printf                            #  278: 01b7ffc0
                                                               #  27c: 0000
.Lbr012:    movi         a13, sdk_g_phyFuns                    #  27e: d1a9ff
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  281: 080d
            l32i         a0, a0, 64 /* [[sdk_g_phyFuns]+0x40] */ #  283: 022010
            movi         a2, 1 /* 0x00000001 */                #  286: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x40] */       #  288: c00000
            movi         a15, 0 /* 0x00000000 */               #  28b: 0c0f
.Lbr013:    movi         a2, 1 /* 0x00000001 */                #  28d: 0c12
            l32i         a3, sp, 60 /* [(local17)] */          #  28f: 38f1
            l32i         a4, sp, 64 /* [(local18)] */          #  291: 422110
            movi         a5, 0 /* 0x00000000 */                #  294: 0c05
            movi         a6, 0 /* 0x00000000 */                #  296: 0c06
            s32i         a6, sp, 0 /* 0x00000000 -> [(local0)] */ #  298: 6901
            s32i         a6, sp, 4 /* 0x00000000 -> [(local1)] */ #  29a: 6911
            s32i         a6, sp, 8 /* 0x00000000 -> [(local2)] */ #  29c: 6921
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  29e: 080d
            movi         a7, 0 /* 0x00000000 */                #  2a0: 0c07
            l32i         a0, a0, 104 /* [[sdk_g_phyFuns]+0x68] */ #  2a2: 02201a
            movi         a6, 0 /* 0x00000000 */                #  2a5: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x68] */       #  2a7: c00000
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  2aa: 080d
            movi         a2, 1 /* 0x00000001 */                #  2ac: 0c12
            l32i         a0, a0, 52 /* [[sdk_g_phyFuns]+0x34] */ #  2ae: 08d0
            movi         a3, 1024 /* 0x00000400 */             #  2b0: 32a400
            callx0       a0 /* [[sdk_g_phyFuns]+0x34] */       #  2b3: c00000
            memw                                               #  2b6: c02000
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  2b9: 080d
            movi         a12, 0x60000200                       #  2bb: c19bff
            l32i         a0, a0, 48 /* [[sdk_g_phyFuns]+0x30] */ #  2be: 08c0
            l32i         a12, a12, 0x3e4 /* [0x600005e4] */    #  2c0: c22cf9
            callx0       a0 /* [[sdk_g_phyFuns]+0x30] */       #  2c3: c00000
            beqz         a14, .Lbr014                          #  2c6: 8cde
            movi         a2, .Lstr002                          #  2c8: 2199ff
            srai         a3, a12, 8                            #  2cb: c03821
            movi         a4, 0x00008000                        #  2ce: 4198ff
            call0        ets_printf                            #  2d1: 01a1ffc0
                                                               #  2d5: 0000
.Lbr014:    movi         a2, 0x00800000                        #  2d7: 2197ff
            l32i         a0, sp, 64 /* [(local18)] */          #  2da: 022110
            bge          a2, a12, .Lbr015                      #  2dd: c7a210
            addi         a2, a0, 24 /* [(local18)]+0x18 */     #  2e0: 22c018
            addi         a15, a15, 1                           #  2e3: 1bff
            extui        a15, a15, 0, 8                        #  2e5: f0f074
            extui        a0, a2, 0, 8                          #  2e8: 200074
            s32i         a0, sp, 64 /* a0 -> [(local18)] */    #  2eb: 026110
            bnei         a15, 2, .Lbr013                       #  2ee: 662f9b
.Lbr015:    l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  2f1: 080d
            l32i         a0, a0, 108 /* [[sdk_g_phyFuns]+0x6c] */ #  2f3: 02201b
            movi         a2, 1 /* 0x00000001 */                #  2f6: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x6c] */       #  2f8: c00000
            movi         a12, 0 /* 0x00000000 */               #  2fb: 0c0c
            movi         a15, 0 /* 0x00000000 */               #  2fd: 0c0f
            movi         a13, 0 /* 0x00000000 */               #  2ff: 0c0d
            movi         a2, 0 /* 0x00000000 */                #  301: 0c02
            movi         a3, 0 /* 0x00000000 */                #  303: 0c03
            s32i         a3, sp, 68 /* 0x00000000 -> [(local19)] */ #  305: 326111
            s32i         a2, sp, 72 /* 0x00000000 -> [(local20)] */ #  308: 226112
.Lbr016:    movi         a2, 14 /* 0x0000000e */               #  30b: 0ce2
            l32i         a3, sp, 60 /* [(local17)] */          #  30d: 38f1
            l32i         a4, sp, 64 /* [(local18)] */          #  30f: 422110
            addi         a5, sp, 18 /* (local5) */             #  312: 52c112
            l32i         a6, sp, 56 /* [(local16)] */          #  315: 68e1
            mov          a7, a14 /* arg5 */                    #  317: 7d0e
            call0        sdk_ram_rfcal_rxiq                    #  319: 0190ffc0
                                                               #  31d: 0000
            beqz         a14, .Lbr017                          #  31f: 9cbe
            movi         a2, .Lstr003                          #  321: 2185ff
            mov          a3, a12                               #  324: 3d0c
            l8ui         a5, sp, 19 /* [(local6)] */           #  326: 520113
            l8ui         a4, sp, 18 /* [(local5)] */           #  329: 420112
            slli         a5, a5, 24                            #  32c: 805501
            slli         a4, a4, 24                            #  32f: 804401
            srai         a4, a4, 24                            #  332: 404831
            srai         a5, a5, 24                            #  335: 505831
            call0        ets_printf                            #  338: 018affc0
                                                               #  33c: 0000
.Lbr017:    beqz         a12, .Lbr018                          #  33e: bc0c
            l8ui         a2, sp, 18 /* [(local5)] */           #  340: 220112
            movi         a0, sdk_g_phyFuns                     #  343: 017eff
            slli         a2, a2, 24                            #  346: 802201
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  349: 0800
            srai         a2, a2, 24                            #  34b: 202831
            l32i         a0, a0, 0 /* [[sdk_g_phyFuns]] */     #  34e: 0800
            sub          a2, a13, a2                           #  350: 202dc0
            callx0       a0 /* [[sdk_g_phyFuns]] */            #  353: c00000
            bgei         a2, 2, .Lbr018                        #  356: e62218
            l8ui         a2, sp, 19 /* [(local6)] */           #  359: 220113
            movi         a0, sdk_g_phyFuns                     #  35c: 0179ff
            slli         a2, a2, 24                            #  35f: 802201
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  362: 0800
            srai         a2, a2, 24                            #  364: 202831
            l32i         a0, a0, 0 /* [[sdk_g_phyFuns]] */     #  367: 0800
            sub          a2, a15, a2                           #  369: 202fc0
            callx0       a0 /* [[sdk_g_phyFuns]] */            #  36c: c00000
            blti         a2, 2, .Lbr020                        #  36f: a62231
.Lbr018:    l32i         a3, sp, 72 /* [(local20)] */          #  372: 322112
            l32i         a2, sp, 68 /* [(local19)] */          #  375: 222111
            l8ui         a13, sp, 18 /* [(local5)] */          #  378: d20112
            l8ui         a15, sp, 19 /* [(local6)] */          #  37b: f20113
            addi         a12, a12, 1                           #  37e: 1bcc
            extui        a12, a12, 0, 8                        #  380: c0c074
            slli         a15, a15, 24                          #  383: 80ff01
            slli         a13, a13, 24                          #  386: 80dd01
            srai         a13, a13, 24                          #  389: d0d831
            srai         a15, a15, 24                          #  38c: f0f831
            add          a2, a15, a2                           #  38f: 2a2f
            add          a3, a13, a3                           #  391: 3a3d
            s32i         a3, sp, 72 /* a3 -> [(local20)] */    #  393: 326112
            s32i         a2, sp, 68 /* a2 -> [(local19)] */    #  396: 226111
            beqi         a12, 4, .Lbr019                       #  399: 264c02
            j            .Lbr016                               #  39c: c6daff
.Lbr019:    movi         a0, 0 /* 0x00000000 */                #  39f: 0c00
            j            .Lbr021                               #  3a1: 460000
.Lbr020:    movi         a0, 1 /* 0x00000001 */                #  3a4: 0c10
.Lbr021:    movi         a3, -31 /* 0xffffffe1 */              #  3a6: 6c13
            bnez         a0, .Lbr029                           #  3a8: 567009
            l32i         a13, sp, 72 /* [(local20)] */         #  3ab: d22112
            l32i         a0, sp, 68 /* [(local19)] */          #  3ae: 022111
            addi         a13, a13, 2 /* [(local20)]+0x2 */     #  3b1: 2bdd
            addi         a0, a0, 2 /* [(local19)]+0x2 */       #  3b3: 2b00
            srai         a0, a0, 2                             #  3b5: 000221
            srai         a13, a13, 2                           #  3b8: d0d221
            slli         a13, a13, 24                          #  3bb: 80dd01
            srai         a13, a13, 24                          #  3be: d0d831
.Lbr022:    movi         a2, -15 /* 0xfffffff1 */              #  3c1: 7c12
            slli         a15, a0, 24                           #  3c3: 80f001
            srai         a15, a15, 24                          #  3c6: f0f831
            mov          a0, a2 /* 0xfffffff1 */               #  3c9: 0d02
            blt          a13, a2, .Lbr023                      #  3cb: 272d01
            mov          a0, a13                               #  3ce: 0d0d
.Lbr023:    movi         a2, 15 /* 0x0000000f */               #  3d0: 0cf2
            mov          a7, a2 /* 0x0000000f */               #  3d2: 7d02
            bgei         a0, 16, .Lbr024                       #  3d4: e6b001
            mov          a7, a0                                #  3d7: 7d00
.Lbr024:    mov          a0, a3 /* 0xffffffe1 */               #  3d9: 0d03
            slli         a13, a7, 24                           #  3db: 80d701
            srai         a13, a13, 24                          #  3de: d0d831
            blt          a15, a3, .Lbr025                      #  3e1: 372f01
            mov          a0, a15                               #  3e4: 0d0f
.Lbr025:    movi         a15, 31 /* 0x0000001f */              #  3e6: 1cff
            mov          a7, a15 /* 0x0000001f */              #  3e8: 7d0f
            bgei         a0, 32, .Lbr026                       #  3ea: e6c001
            mov          a7, a0                                #  3ed: 7d00
.Lbr026:    slli         a15, a7, 24                           #  3ef: 80f701
            l32i         a0, sp, 52 /* [(local15)] */          #  3f2: 08d1
            srai         a15, a15, 24                          #  3f4: f0f831
            bnez         a0, .Lbr027                           #  3f7: dc50
            l32i         a3, sp, 40 /* [(local12)] */          #  3f9: 38a1
            extui        a0, a7, 0, 6                          #  3fb: 700054
            extui        a2, a13, 0, 5                         #  3fe: d02044
            slli         a2, a2, 6                             #  401: a02211
            or           a0, a0, a2                            #  404: 200020
            l32i         a2, sp, 76 /* [(local21)] */          #  407: 222113
            addx2        a2, a2, a3                            #  40a: 302290
            s16i         a0, a2, 0                             #  40d: 025200
.Lbr027:    beqz         a14, .Lbr028                          #  410: 8cee
            mov          a5, a15                               #  412: 5d0f
            mov          a4, a13                               #  414: 4d0d
            movi         a2, .Lstr004                          #  416: 214bff
            l32i         a3, sp, 76 /* [(local21)] */          #  419: 322113
            call0        ets_printf                            #  41c: 0152ffc0
                                                               #  420: 0000
.Lbr028:    movi         a13, sdk_g_phyFuns                    #  422: d149ff
            extui        a5, a12, 0, 2                         #  425: c05014
            movi         a6, sdk_rxiq_compute_num              #  428: 6149ff
            l32i         a3, sp, 76 /* [(local21)] */          #  42b: 322113
            l32i         a7, a6, 0 /* [sdk_rxiq_compute_num] */ #  42e: 7806
            addi         a4, a3, 1 /* [(local21)]+0x1 */       #  430: 1b43
            extui        a3, a4, 0, 8                          #  432: 403074
            s32i         a3, sp, 76 /* a3 -> [(local21)] */    #  435: 326113
            slli         a7, a7, 2                             #  438: e07711
            or           a5, a5, a7                            #  43b: 705520
            s32i         a5, a6, 0 /* a5 -> [sdk_rxiq_compute_num] */ #  43e: 5906
            j            .Lbr007                               #  440: 8664ff
.Lbr029:    l8ui         a0, sp, 19 /* [(local6)] */           #  443: 020113
            l8ui         a2, sp, 18 /* [(local5)] */           #  446: 220112
            slli         a0, a0, 24                            #  449: 800001
            slli         a2, a2, 24                            #  44c: 802201
            srai         a2, a2, 24                            #  44f: 202831
            srai         a0, a0, 24                            #  452: 000831
            add          a0, a0, a15                           #  455: fa00
            add          a13, a2, a13                          #  457: dad2
            addi         a13, a13, 1                           #  459: 1bdd
            addi         a0, a0, 1                             #  45b: 1b00
            srai         a0, a0, 1                             #  45d: 000121
            srai         a13, a13, 1                           #  460: d0d121
            slli         a13, a13, 24                          #  463: 80dd01
            srai         a13, a13, 24                          #  466: d0d831
            j            .Lbr022                               #  469: 06d5ff
.Lbr030:    movi         a12, 0 /* 0x00000000 */               #  46c: 0c0c
            j            .Lbr009                               #  46e: c662ff
.Lbr031:    movi         a12, 64 /* 0x00000040 */              #  471: 4c0c
            j            .Lbr009                               #  473: 8661ff
.Lbr032:    movi         a12, 96 /* 0x00000060 */              #  476: c2a060
            movi         a2, 15 /* 0x0000000f */               #  479: 0cf2
            s32i         a2, sp, 64 /* 0x0000000f -> [(local18)] */ #  47b: 226110
            j            .Lbr010                               #  47e: 0660ff
.Lbr033:    movi         a5, 16 /* 0x00000010 */               #  481: 1c05
            memw                                               #  483: c02000
            movi         a4, 0x60000200                        #  486: 4132ff
            l32i         a3, a4, 0x390 /* [0x60000590] */      #  489: 3224e4
            or           a3, a3, a5                            #  48c: 503320
            memw                                               #  48f: c02000
            s32i         a3, a4, 0x390 /* a3 -> [0x60000590] */ #  492: 3264e4
            l32i         a12, sp, 24 /* [(local8)] */          #  495: c861
            l32i         a13, sp, 28 /* [(local9)] */          #  497: d871
            l32i         a14, sp, 32 /* [(local10)] */         #  499: e881
            l32i         a15, sp, 36 /* [(local11)] */         #  49b: f891
            l32i         a0, sp, 20 /* [(local7)] */           #  49d: 0851
            addi         sp, sp, 80 /* (top of frame) */       #  49f: 12c150
            ret           /* [(local14)] */                    #  4a2: 0df0
.Lbr034:    movi         a12, 112 /* 0x00000070 */             #  4a4: c2a070
            movi         a6, 40 /* 0x00000028 */               #  4a7: 2c86
            s32i         a6, sp, 64 /* 0x00000028 -> [(local18)] */ #  4a9: 626110
            j            .Lbr010                               #  4ac: 8654ff
.Lbr035:    movi         a12, 120 /* 0x00000078 */             #  4af: c2a078
            movi         a7, 65 /* 0x00000041 */               #  4b2: 4c17
            s32i         a7, sp, 64 /* 0x00000041 -> [(local18)] */ #  4b4: 726110
            j            .Lbr010                               #  4b7: c651ff

            .literal_position                                  #  4bc: a4000000
                                                               #  4c0: 00000000
                                                               #  4c4: 00000000
                                                               #  4c8: 00000000
                                                               #  4cc: 00000000

# Function @ .irom0.text+0x4d0
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word      @ -0x3c
#     (local2):  word      @ -0x38
#     (local3):  word      @ -0x34
#     (local4):  word      @ -0x30
#     (local5):  word      @ -0x2c
#     (local6):  word      @ -0x28
#     (local7):  word      @ -0x24
#     (local8):  word      @ -0x20
#     (local9):  word      @ -0x1c
#     (local10): word      @ -0x18
#     (local11): word      @ -0x14
#     (local12): word[4]   @ -0x10
            .global      sdk_gen_rx_gain_table
            .type        sdk_gen_rx_gain_table, @function
sdk_gen_rx_gain_table:
            addi         sp, sp, -64 /* (local0) */            #  4d0: 12c1c0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  4d3: c921
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  4d5: d931
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  4d7: e941
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   #  4d9: f951
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  4db: 0911
            s32i         a5, sp, 40 /* arg3 -> [(local10)] */  #  4dd: 59a1
            s32i         a7, sp, 36 /* arg5 -> [(local9)] */   #  4df: 7991
            s32i         a2, sp, 28 /* arg0 -> [(local7)] */   #  4e1: 2971
            s32i         a4, sp, 32 /* arg2 -> [(local8)] */   #  4e3: 4981
            movi         a2, 127 /* 0x0000007f */              #  4e5: 22a07f
            slli         a4, a3, 24                            #  4e8: 804301
            srai         a4, a4, 24                            #  4eb: 404831
            movltz       a3, a2, a4                            #  4ee: 4032a3
            s32i         a3, sp, 24 /* a3 -> [(local6)] */     #  4f1: 3961
            bgei         a3, 1, .Lbr036                        #  4f3: e61302
            j            .Lbr047                               #  4f6: 464100
.Lbr036:    movi         a12, 0 /* 0x00000000 */               #  4f9: 0c0c
            movi         a0, 0 /* 0x00000000 */                #  4fb: 0c00
            movi         a15, 0 /* 0x00000000 */               #  4fd: 0c0f
            l32i         a5, sp, 40 /* [(local10)] */          #  4ff: 58a1
            addi         a7, a6, -1 /* arg4-0x1 */             #  501: 0b76
            mov          a13, a5 /* [(local10)] */             #  503: dd05
            add          a5, a5, a7                            #  505: 7a55
            s32i         a5, sp, 44 /* a5 -> [(local11)] */    #  507: 59b1
.Lbr037:    movi         a3, 24 /* 0x00000018 */               #  509: 1c83
            l8ui         a10, a13, 0                           #  50b: a20d00
            sub          a6, a12, a15                          #  50e: f06cc0
            slli         a14, a6, 24                           #  511: 80e601
            srai         a14, a14, 24                          #  514: e0e831
            slli         a10, a10, 24                          #  517: 80aa01
            srai         a10, a10, 24                          #  51a: a0a831
            blt          a14, a10, .Lbr040                     #  51d: a72e3e
.Lbr038:    slli         a6, a6, 24                            #  520: 806601
            l32i         a2, sp, 44 /* [(local11)] */          #  523: 28b1
            srai         a6, a6, 24                            #  525: 606831
            bge          a13, a2, .Lbr040                      #  528: 27ad33
            extui        a7, a10, 0, 8                         #  52b: a07074
            bnez         a7, .Lbr039                           #  52e: cca7
            l8ui         a8, a13, 1                            #  530: 820d01
            slli         a8, a8, 24                            #  533: 808801
            srai         a8, a8, 24                            #  536: 808831
            blt          a6, a8, .Lbr040                       #  539: 872622
.Lbr039:    l32i         a13, sp, 40 /* [(local10)] */         #  53c: d8a1
            addi         a0, a0, 1                             #  53e: 1b00
            extui        a2, a10, 0, 8                         #  540: a02074
            add          a15, a15, a2                          #  543: 2aff
            extui        a0, a0, 0, 8                          #  545: 000074
            add          a13, a13, a0                          #  548: 0add
            sub          a6, a12, a15                          #  54a: f06cc0
            slli         a14, a6, 24                           #  54d: 80e601
            l8ui         a10, a13, 0                           #  550: a20d00
            srai         a14, a14, 24                          #  553: e0e831
            slli         a10, a10, 24                          #  556: 80aa01
            srai         a10, a10, 24                          #  559: a0a831
            bge          a14, a10, .Lbr038                     #  55c: a7aec0
.Lbr040:    s32i         a0, sp, 48 /* a0 -> [(local12)] */    #  55f: 09c1
            blt          a14, a3, .Lbr041                      #  561: 372e0d
            addi         a6, a14, -24                          #  564: 62cee8
            movi         a14, 15 /* 0x0000000f */              #  567: 0cfe
            slli         a6, a6, 24                            #  569: 806601
            srai         a6, a6, 24                            #  56c: 606831
            j            .Lbr042                               #  56f: 860a00
.Lbr041:    mov          a2, a14                               #  572: 2d0e
            movi         a3, 6 /* 0x00000006 */                #  574: 0c63
            call0        __divsi3                              #  576: 01d3ffc0
                                                               #  57a: 0000
            mov          a0, a2                                #  57c: 0d02
            movi         a3, 6 /* 0x00000006 */                #  57e: 0c63
            mov          a2, a14                               #  580: 2d0e
            ssl          a0                                    #  582: 001040
            movi         a14, 1 /* 0x00000001 */               #  585: 0c1e
            sll          a14, a14                              #  587: 00eea1
            addi         a14, a14, -1                          #  58a: 0bee
            extui        a14, a14, 0, 16                       #  58c: e0e0f4
            call0        __modsi3                              #  58f: 01ceffc0
                                                               #  593: 0000
            l32i         a0, sp, 48 /* [(local12)] */          #  595: 08c1
            slli         a6, a2, 24                            #  597: 806201
            srai         a6, a6, 24                            #  59a: 606831
.Lbr042:    blti         a6, 5, .Lbr043                        #  59d: a65604
            movi         a6, 5 /* 0x00000005 */                #  5a0: 0c56
            j            .Lbr044                               #  5a2: 860000
.Lbr043:    extui        a6, a6, 0, 16                         #  5a5: 6060f4
.Lbr044:    s32i         a0, sp, 48 /* a0 -> [(local12)] */    #  5a8: 09c1
            s32i         a6, sp, 0 /* a6 -> [(local0)] */      #  5aa: 6901
            l32i         a7, sp, 36 /* [(local9)] */           #  5ac: 7891
            l32i         a9, sp, 32 /* [(local8)] */           #  5ae: 9881
            l32i         a8, sp, 28 /* [(local7)] */           #  5b0: 8871
            addx2        a9, a0, a9                            #  5b2: 909090
            l16ui        a4, a9, 0                             #  5b5: 421900
            addx2        a8, a12, a8                           #  5b8: 808c90
            addx8        a4, a14, a4                           #  5bb: 404eb0
            add          a4, a6, a4                            #  5be: 4a46
            extui        a4, a4, 0, 16                         #  5c0: 4040f4
            s16i         a4, a8, 0                             #  5c3: 425800
            beqz         a7, .Lbr045                           #  5c6: 9c47
            l16ui        a5, a9, 0                             #  5c8: 521900
            movi         a2, .Lstr005                          #  5cb: 21bcff
            mov          a3, a12                               #  5ce: 3d0c
            mov          a6, a14                               #  5d0: 6d0e
            l32i         a7, sp, 0 /* [(local0)] */            #  5d2: 7801
            call0        ets_printf                            #  5d4: 01beffc0
                                                               #  5d8: 0000
            l32i         a0, sp, 48 /* [(local12)] */          #  5da: 08c1
            l32i         a6, sp, 0 /* [(local0)] */            #  5dc: 6801
.Lbr045:    movi         a10, 15 /* 0x0000000f */              #  5de: 0cfa
            bne          a14, a10, .Lbr046                     #  5e0: a79e0b
            bnei         a6, 5, .Lbr046                        #  5e3: 665608
            movi         a11, .Ldata001                        #  5e6: b1b6ff
            s8i          a12, a11, 0 /* a12 -> [.Ldata001] */  #  5e9: c24b00
            j            .Lbr047                               #  5ec: c60300
.Lbr046:    l32i         a14, sp, 24 /* [(local6)] */          #  5ef: e861
            addi         a12, a12, 1                           #  5f1: 1bcc
            slli         a12, a12, 24                          #  5f3: 80cc01
            srai         a12, a12, 24                          #  5f6: c0c831
            sub          a14, a12, a14                         #  5f9: e0ecc0
            bnez         a14, .Lbr037                          #  5fc: 569ef0
.Lbr047:    l32i         a12, sp, 8 /* [(local2)] */           #  5ff: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  601: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  603: e841
            l32i         a15, sp, 20 /* [(local5)] */          #  605: f851
            l32i         a0, sp, 4 /* [(local1)] */            #  607: 0811
            addi         sp, sp, 64 /* (top of frame) */       #  609: 12c140
            ret                                                #  60c: 0df0

            .literal_position                                  #  610: 00000000
                                                               #  614: 00000000
                                                               #  618: 00000000

# Function @ .irom0.text+0x61c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_pbus_set_rxbbgain
            .type        sdk_pbus_set_rxbbgain, @function
sdk_pbus_set_rxbbgain:
            addi         sp, sp, -16 /* (local0) */            #  61c: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  61f: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  621: 0901
            mov          a12, a2 /* arg0 */                    #  623: cd02
            movi         a0, 23 /* 0x00000017 */               #  625: 1c70
            blt          a0, a2, .Lbr050                       #  627: 27201d
            movi         a2, 17 /* 0x00000011 */               #  62a: 1c12
            blt          a2, a12, .Lbr049                      #  62c: c72212
            bgei         a12, 12, .Lbr048                      #  62f: e6ac09
            movi         a0, 64 /* 0x00000040 */               #  632: 4c00
            bgei         a12, 6, .Lbr051                       #  634: e66c13
            movi         a0, 0 /* 0x00000000 */                #  637: 0c00
            j            .Lbr051                               #  639: 860300
.Lbr048:    movi         a0, 96 /* 0x00000060 */               #  63c: 02a060
            j            .Lbr051                               #  63f: 060200
.Lbr049:    movi         a0, 112 /* 0x00000070 */              #  642: 02a070
            j            .Lbr051                               #  645: 860000
.Lbr050:    movi         a0, 120 /* 0x00000078 */              #  648: 02a078
.Lbr051:    movi         a2, sdk_g_phyFuns                     #  64b: 21f1ff
            extui        a4, a0, 0, 16                         #  64e: 0040f4
            l32i         a0, a2, 0 /* [sdk_g_phyFuns] */       #  651: 0802
            movi         a3, 1 /* 0x00000001 */                #  653: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  655: 02202b
            movi         a2, 3 /* 0x00000003 */                #  658: 0c32
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  65a: c00000
            mov          a2, a12 /* arg0 */                    #  65d: 2d0c
            movi         a3, 6 /* 0x00000006 */                #  65f: 0c63
            call0        __modsi3                              #  661: 01edffc0
                                                               #  665: 0000
            movi         a3, 2 /* 0x00000002 */                #  667: 0c23
            movi         a5, 6 /* 0x00000006 */                #  669: 0c65
            slli         a4, a2, 3                             #  66b: d04211
            movi         a0, sdk_g_phyFuns                     #  66e: 01e9ff
            movi         a2, 3 /* 0x00000003 */                #  671: 0c32
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  673: 0800
            or           a4, a4, a5                            #  675: 504420
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  678: 02202b
            extui        a4, a4, 0, 16                         #  67b: 4040f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  67e: c00000
            l32i         a12, sp, 4 /* [(local1)] */           #  681: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  683: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  685: 12c110
            ret                                                #  688: 0df0

            .literal_position                                  #  68c: 009a0060
                                                               #  690: 00000000
                                                               #  694: 00000300
                                                               #  698: 00000000
                                                               #  69c: 00020060
                                                               #  6a0: a00f0000
                                                               #  6a4: 00000000
                                                               #  6a8: 00000000
                                                               #  6ac: fffffcff
                                                               #  6b0: 00020060
                                                               #  6b4: 00000000
                                                               #  6b8: 00000100
                                                               #  6bc: 009e0060
                                                               #  6c0: 00000000

# Function @ .irom0.text+0x6c4
# Local variables/stack:
#     (local0):  word[4]   @ -0x60
#     (local1):  hword     @ -0x50
#     (local2):  hword     @ -0x4e
#     (local3):  hword     @ -0x4c
#     (local4):  hword     @ -0x4a
#     (local5):  word      @ -0x48
#     (local6):  word      @ -0x44
#     (local7):  word      @ -0x40
#     (local8):  word      @ -0x3c
#     (local9):  word      @ -0x38
#     (local10): word      @ -0x34
#     (local11): word      @ -0x30
#     (local12): word      @ -0x2c
#     (local13): word      @ -0x28
#     (local14): word      @ -0x24
#     (local15): word      @ -0x20
#     (local16): word      @ -0x1c
#     (local17): word      @ -0x18
#     (local18): word      @ -0x14
#     (local19): word[4]   @ -0x10
            .global      sdk_set_rx_gain_testchip_50
            .type        sdk_set_rx_gain_testchip_50, @function
sdk_set_rx_gain_testchip_50:
            mov          a4, a6 /* arg4 */                     #  6c4: 4d06
            movi         a9, sdk_rxiq_compute_num              #  6c6: 91f2ff
            addi         sp, sp, -96 /* (local0) */            #  6c9: 12c1a0
            s32i         a12, sp, 44 /* a12 -> [(local10)] */  #  6cc: c9b1
            s32i         a15, sp, 56 /* a15 -> [(local13)] */  #  6ce: f9e1
            s32i         a0, sp, 40 /* a0 -> [(local9)] */     #  6d0: 09a1
            s32i         a2, sp, 28 /* arg0 -> [(local6)] */   #  6d2: 2971
            s32i         a3, sp, 32 /* arg1 -> [(local7)] */   #  6d4: 3981
            s32i         a5, sp, 68 /* arg3 -> [(local16)] */  #  6d6: 526111
            s32i         a14, sp, 52 /* a14 -> [(local12)] */  #  6d9: e9d1
            s32i         a13, sp, 48 /* a13 -> [(local11)] */  #  6db: d9c1
            mov          a14, a7 /* arg5 */                    #  6dd: ed07
            movi         a13, 0x60009a00                       #  6df: d1ebff
            l8ui         a5, a9, 4 /* [sdk_rxdc_init_flag] */  #  6e2: 520904
            s32i         a4, sp, 24 /* arg4 -> [(local5)] */   #  6e5: 4961
            beqz         a5, .Lbr052                           #  6e7: 8c85
            l32i         a10, a3, 0 /* [arg1] */               #  6e9: a803
            s32i         a3, sp, 32 /* arg1 -> [(local7)] */   #  6eb: 3981
            extui        a10, a10, 16, 1                       #  6ed: a0a005
            bnez         a10, .Lbr059                          #  6f0: 56ea1e
.Lbr052:    movi         a4, 0x00030000                        #  6f3: 41e8ff
            movi         a15, sdk_g_phyFuns                    #  6f6: f1e8ff
            movi         a3, 0x60000200                        #  6f9: 31e8ff
            memw                                               #  6fc: c02000
            l32i         a2, a3, 0x3c8 /* [0x600005c8] */      #  6ff: 2223f2
            or           a2, a2, a4                            #  702: 402220
            memw                                               #  705: c02000
            s32i         a2, a3, 0x3c8 /* a2 -> [0x600005c8] */ #  708: 2263f2
            memw                                               #  70b: c02000
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #  70e: 080f
            movi         a12, 480 /* 0x000001e0 */             #  710: c2a1e0
            l32i         a0, a0, 160 /* [[sdk_g_phyFuns]+0xa0] */ #  713: 022028
            s32i         a12, a13, 104 /* 0x000001e0 -> [0x60009a68] */ #  716: c26d1a
            callx0       a0 /* [[sdk_g_phyFuns]+0xa0] */       #  719: c00000
            movi         a2, 119 /* 0x00000077 */              #  71c: 22a077
            movi         a3, 0 /* 0x00000000 */                #  71f: 0c03
            movi         a4, 18 /* 0x00000012 */               #  721: 1c24
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #  723: 080f
            movi         a5, 7 /* 0x00000007 */                #  725: 0c75
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  727: 022025
            movi         a6, 0 /* 0x00000000 */                #  72a: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  72c: c00000
            movi         a3, 0 /* 0x00000000 */                #  72f: 0c03
            movi         a4, 24 /* 0x00000018 */               #  731: 1c84
            movi         a5, 5 /* 0x00000005 */                #  733: 0c55
            movi         a6, 5 /* 0x00000005 */                #  735: 0c56
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #  737: 080f
            s32i         a2, sp, 36 /* a2 -> [(local8)] */     #  739: 2991
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  73b: 022025
            movi         a2, 119 /* 0x00000077 */              #  73e: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  741: c00000
            movi         a3, 0 /* 0x00000000 */                #  744: 0c03
            movi         a4, 24 /* 0x00000018 */               #  746: 1c84
            movi         a5, 5 /* 0x00000005 */                #  748: 0c55
            movi         a6, 5 /* 0x00000005 */                #  74a: 0c56
            movi         a7, 0 /* 0x00000000 */                #  74c: 0c07
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #  74e: 080f
            mov          a12, a2                               #  750: cd02
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  752: 022027
            movi         a2, 119 /* 0x00000077 */              #  755: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  758: c00000
            movi         a2, 119 /* 0x00000077 */              #  75b: 22a077
            movi         a3, 0 /* 0x00000000 */                #  75e: 0c03
            movi         a4, 18 /* 0x00000012 */               #  760: 1c24
            movi         a5, 7 /* 0x00000007 */                #  762: 0c75
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #  764: 080f
            movi         a6, 0 /* 0x00000000 */                #  766: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  768: 022027
            movi         a7, 0 /* 0x00000000 */                #  76b: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  76d: c00000
            s32i         a12, sp, 72 /* a12 -> [(local17)] */  #  770: c26112
            beqz         a14, .Lbr057                          #  773: 168e0d
            movi         a5, 0 /* 0x00000000 */                #  776: 0c05
            movi         a12, 0 /* 0x00000000 */               #  778: 0c0c
            l8ui         a2, sp, 108 /* [(FP)+0xc] */          #  77a: 22016c
            l32i         a15, sp, 96 /* [(local20)] */         #  77d: f22118
            s32i         a2, sp, 60 /* [(FP)+0xc] -> [(local14)] */ #  780: 29f1
            addx2        a6, a12, a15                          #  782: f06c90
.Lbr053:    l16ui        a6, a6, 0                             #  785: 621600
            movi         a4, 4 /* 0x00000004 */                #  788: 0c44
            mov          a0, a4 /* 0x00000004 */               #  78a: 0d04
            extui        a10, a6, 0, 15                        #  78c: 60a0e4
            extui        a2, a6, 4, 1                          #  78f: 602404
            extui        a8, a6, 7, 1                          #  792: 608704
            extui        a11, a6, 6, 1                         #  795: 60b604
            extui        a7, a6, 5, 1                          #  798: 607504
            extui        a9, a6, 9, 1                          #  79b: 609904
            extui        a3, a6, 8, 1                          #  79e: 603804
            add          a3, a3, a9                            #  7a1: 9a33
            add          a7, a7, a11                           #  7a3: ba77
            add          a3, a3, a8                            #  7a5: 8a33
            add          a3, a3, a7                            #  7a7: 7a33
            movi         a7, 29 /* 0x0000001d */               #  7a9: 1cd7
            extui        a6, a6, 3, 1                          #  7ab: 606304
            add          a6, a6, a2                            #  7ae: 2a66
            add          a3, a3, a6                            #  7b0: 6a33
            extui        a3, a3, 0, 8                          #  7b2: 303074
            bgeui        a3, 5, .Lbr054                        #  7b5: f65301
            mov          a0, a3                                #  7b8: 0d03
.Lbr054:    extui        a11, a0, 0, 8                         #  7ba: 00b074
            s32i         a5, sp, 76 /* a5 -> [(local18)] */    #  7bd: 526113
            extui        a0, a10, 0, 3                         #  7c0: a00024
            addx2        a11, a11, a11                         #  7c3: b0bb90
            addx2        a11, a11, a0                          #  7c6: 00bb90
            mov          a0, a7 /* 0x0000001d */               #  7c9: 0d07
            extui        a11, a11, 0, 16                       #  7cb: b0b0f4
            bltu         a7, a11, .Lbr055                      #  7ce: b73701
            mov          a0, a11                               #  7d1: 0d0b
.Lbr055:    extui        a3, a0, 0, 16                         #  7d3: 0030f4
            s32i         a3, sp, 64 /* a3 -> [(local15)] */    #  7d6: 326110
            ssr          a3                                    #  7d9: 000340
            srl          a2, a5                                #  7dc: 502091
            bbsi         a2, 0, .Lbr056                        #  7df: 07e25e
            extui        a2, a10, 0, 12                        #  7e2: a020b4
            call0        sdk_ram_pbus_set_rxgain               #  7e5: 01b6ffc0
                                                               #  7e9: 0000
            movi         a2, 0x00000fa0                        #  7eb: 21adff
            addi         a3, sp, 16 /* (local1) */             #  7ee: 32c110
            movi         a0, sdk_g_phyFuns                     #  7f1: 01acff
            movi         a4, 10 /* 0x0000000a */               #  7f4: 0ca4
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  7f6: 0800
            l32i         a5, sp, 60 /* [(local14)] */          #  7f8: 58f1
            l32i         a0, a0, 236 /* [[sdk_g_phyFuns]+0xec] */ #  7fa: 02203b
            movi         a6, 0 /* 0x00000000 */                #  7fd: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0xec] */       #  7ff: c00000
            l32i         a5, sp, 76 /* [(local18)] */          #  802: 522113
            movi         a8, 1 /* 0x00000001 */                #  805: 0c18
            l32i         a3, sp, 68 /* [(local16)] */          #  807: 322111
            l16si        a4, sp, 16 /* [(local1)] */           #  80a: 429108
            l16si        a2, sp, 18 /* [(local2)] */           #  80d: 229109
            l32i         a9, sp, 64 /* [(local15)] */          #  810: 922110
            l16si        a6, sp, 20 /* [(local3)] */           #  813: 62910a
            l16si        a7, sp, 22 /* [(local4)] */           #  816: 72910b
            extui        a6, a6, 0, 9                          #  819: 606084
            extui        a7, a7, 0, 9                          #  81c: 707084
            ssl          a9                                    #  81f: 001940
            extui        a2, a2, 0, 9                          #  822: 202084
            extui        a4, a4, 0, 9                          #  825: 404084
            addx8        a3, a9, a3                            #  828: 3039b0
            slli         a4, a4, 9                             #  82b: 704411
            slli         a2, a2, 9                             #  82e: 702211
            sll          a8, a8                                #  831: 0088a1
            or           a5, a5, a8                            #  834: 805520
            or           a2, a2, a7                            #  837: 702220
            or           a4, a4, a6                            #  83a: 604420
            s32i         a4, a3, 0                             #  83d: 4903
            s32i         a2, a3, 4                             #  83f: 2913
.Lbr056:    addi         a12, a12, 1                           #  841: 1bcc
            extui        a12, a12, 0, 8                        #  843: c0c074
            addx2        a6, a12, a15                          #  846: f06c90
            sub          a4, a14, a12                          #  849: c04ec0
            bnez         a4, .Lbr053                           #  84c: 5654f3
.Lbr057:    l32i         a0, sp, 32 /* [(local7)] */           #  84f: 0881
            movi         a15, sdk_g_phyFuns                    #  851: f195ff
            l32i         a0, a0, 0 /* [[(local7)]] */          #  854: 0800
            l32i         a12, sp, 72 /* [(local17)] */         #  856: c22112
            bbsi         a0, 16, .Lbr058                       #  859: 07f01a
            l32i         a2, sp, 28 /* [(local6)] */           #  85c: 2871
            beqz         a2, .Lbr058                           #  85e: 9c52
            movi         a2, 0 /* 0x00000000 */                #  860: 0c02
            movi         a3, 8 /* 0x00000008 */                #  862: 0c83
            l32i         a4, sp, 24 /* [(local5)] */           #  864: 4861
            l32i         a5, sp, 68 /* [(local16)] */          #  866: 522111
            l8ui         a6, sp, 100 /* [(FP)+0x4] */          #  869: 620164
            l8ui         a7, sp, 104 /* [(FP)+0x8] */          #  86c: 720168
            l8ui         a8, sp, 108 /* [(FP)+0xc] */          #  86f: 82016c
            s32i         a8, sp, 0 /* [(FP)+0xc] -> [(local0)] */ #  872: 8901
            call0        sdk_set_rx_gain_cal_iq                #  874: 050000
.Lbr058:    mov          a7, a12 /* [(local17)] */             #  877: 7d0c
            movi         a4, 0xfffcffff                        #  879: 418cff
            memw                                               #  87c: c02000
            movi         a3, 0x60000200                        #  87f: 318cff
            l32i         a2, a3, 0x3c8 /* [0x600005c8] */      #  882: 2223f2
            and          a2, a2, a4                            #  885: 402210
            memw                                               #  888: c02000
            movi         a4, 24 /* 0x00000018 */               #  88b: 1c84
            movi         a5, 5 /* 0x00000005 */                #  88d: 0c55
            movi         a6, 5 /* 0x00000005 */                #  88f: 0c56
            s32i         a2, a3, 0x3c8 /* a2 -> [0x600005c8] */ #  891: 2263f2
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #  894: 080f
            movi         a2, 119 /* 0x00000077 */              #  896: 22a077
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  899: 022027
            movi         a3, 0 /* 0x00000000 */                #  89c: 0c03
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  89e: c00000
            l32i         a7, sp, 36 /* [(local8)] */           #  8a1: 7891
            movi         a2, 119 /* 0x00000077 */              #  8a3: 22a077
            movi         a3, 0 /* 0x00000000 */                #  8a6: 0c03
            movi         a4, 18 /* 0x00000012 */               #  8a8: 1c24
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #  8aa: 080f
            movi         a5, 7 /* 0x00000007 */                #  8ac: 0c75
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  8ae: 022027
            movi         a6, 0 /* 0x00000000 */                #  8b1: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  8b3: c00000
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #  8b6: 080f
            l32i         a0, a0, 200 /* [[sdk_g_phyFuns]+0xc8] */ #  8b8: 022032
            callx0       a0 /* [[sdk_g_phyFuns]+0xc8] */       #  8bb: c00000
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #  8be: 080f
            l32i         a0, a0, 196 /* [[sdk_g_phyFuns]+0xc4] */ #  8c0: 022031
            callx0       a0 /* [[sdk_g_phyFuns]+0xc4] */       #  8c3: c00000
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #  8c6: 080f
            l32i         a0, a0, 188 /* [[sdk_g_phyFuns]+0xbc] */ #  8c8: 02202f
            movi         a12, sdk_rxiq_compute_num             #  8cb: c17aff
            callx0       a0 /* [[sdk_g_phyFuns]+0xbc] */       #  8ce: c00000
            l32i         a4, sp, 32 /* [(local7)] */           #  8d1: 4881
            movi         a5, 0x00010000                        #  8d3: 5179ff
            l32i         a3, a4, 0 /* [[(local7)]] */          #  8d6: 3804
            movi         a2, 1 /* 0x00000001 */                #  8d8: 0c12
            or           a3, a3, a5                            #  8da: 503320
            s32i         a3, a4, 0 /* a3 -> [[(local7)]] */    #  8dd: 3904
            s8i          a2, a12, 4 /* 0x01 -> [sdk_rxdc_init_flag] */ #  8df: 224c04
.Lbr059:    beqz         a14, .Lbr063                          #  8e2: 16fe0d
            l32i         a15, sp, 96 /* [(local20)] */         #  8e5: f22118
            movi         a6, 0x60009e00                        #  8e8: 6175ff
            movi         a12, 0 /* 0x00000000 */               #  8eb: 0c0c
            l32i         a2, sp, 24 /* [(local5)] */           #  8ed: 2861
            l32i         a0, sp, 68 /* [(local16)] */          #  8ef: 022111
            movi         a5, 4 /* 0x00000004 */                #  8f2: 0c45
.Lbr060:    addx2        a10, a12, a15                         #  8f4: f0ac90
            l16ui        a10, a10, 0                           #  8f7: a21a00
            mov          a3, a5 /* 0x00000004 */               #  8fa: 3d05
            extui        a7, a10, 8, 1                         #  8fc: a07804
            extui        a9, a10, 4, 1                         #  8ff: a09404
            extui        a8, a10, 3, 1                         #  902: a08304
            add          a8, a8, a9                            #  905: 9a88
            extui        a11, a10, 6, 1                        #  907: a0b604
            extui        a9, a10, 5, 1                         #  90a: a09504
            add          a9, a9, a11                           #  90d: ba99
            extui        a11, a10, 9, 1                        #  90f: a0b904
            add          a7, a7, a11                           #  912: ba77
            extui        a11, a10, 7, 1                        #  914: a0b704
            add          a7, a7, a11                           #  917: ba77
            extui        a10, a10, 0, 15                       #  919: a0a0e4
            movi         a11, 29 /* 0x0000001d */              #  91c: 1cdb
            add          a7, a7, a9                            #  91e: 9a77
            add          a7, a7, a8                            #  920: 8a77
            extui        a8, a10, 0, 3                         #  922: a08024
            extui        a7, a7, 0, 8                          #  925: 707074
            bgeui        a7, 5, .Lbr061                        #  928: f65701
            mov          a3, a7                                #  92b: 3d07
.Lbr061:    extui        a4, a3, 0, 8                          #  92d: 304074
            mov          a3, a11 /* 0x0000001d */              #  930: 3d0b
            addx2        a7, a4, a4                            #  932: 407490
            addx2        a7, a7, a8                            #  935: 807790
            extui        a7, a7, 0, 16                         #  938: 7070f4
            bltu         a11, a7, .Lbr062                      #  93b: 773b01
            mov          a3, a7                                #  93e: 3d07
.Lbr062:    extui        a11, a3, 0, 16                        #  940: 30b0f4
            addx8        a11, a11, a0                          #  943: 00bbb0
            l32i         a8, a11, 4                            #  946: 881b
            l32i         a11, a11, 0                           #  948: b80b
            extui        a3, a8, 9, 9                          #  94a: 803984
            extui        a7, a11, 0, 9                         #  94d: b07084
            extui        a8, a8, 0, 9                          #  950: 808084
            extui        a11, a11, 9, 9                        #  953: b0b984
            memw                                               #  956: c02000
            slli         a11, a11, 8                           #  959: 80bb11
            slli         a9, a10, 17                           #  95c: f09a01
            movi         a5, 30 /* 0x0000001e */               #  95f: 1ce5
            s32i         a5, a13, 104 /* 0x0000001e -> [0x60009a68] */ #  961: 526d1a
            add          a9, a9, a11                           #  964: ba99
            srli         a11, a7, 1                            #  966: 70b141
            addx4        a5, a12, a6                           #  969: 605ca0
            add          a9, a9, a11                           #  96c: ba99
            memw                                               #  96e: c02000
            s32i         a9, a5, 0                             #  971: 9905
            memw                                               #  973: c02000
            movi         a11, 31 /* 0x0000001f */              #  976: 1cfb
            s32i         a11, a13, 104 /* 0x0000001f -> [0x60009a68] */ #  978: b26d1a
            memw                                               #  97b: c02000
            slli         a7, a7, 31                            #  97e: 107701
            slli         a3, a3, 22                            #  981: a03301
            s32i         a9, a5, 0                             #  984: 9905
            add          a3, a3, a7                            #  986: 7a33
            addx2        a7, a4, a2                            #  988: 207490
            l16ui        a7, a7, 0                             #  98b: 721700
            slli         a8, a8, 13                            #  98e: 308811
            extui        a7, a7, 0, 11                         #  991: 7070a4
            addx4        a7, a7, a8                            #  994: 8077a0
            add          a3, a3, a7                            #  997: 7a33
            memw                                               #  999: c02000
            movi         a8, 480 /* 0x000001e0 */              #  99c: 82a1e0
            s32i         a8, a13, 104 /* 0x000001e0 -> [0x60009a68] */ #  99f: 826d1a
            memw                                               #  9a2: c02000
            s32i         a3, a5, 0                             #  9a5: 3905
            memw                                               #  9a7: c02000
            movi         a7, 481 /* 0x000001e1 */              #  9aa: 72a1e1
            s32i         a7, a13, 104 /* 0x000001e1 -> [0x60009a68] */ #  9ad: 726d1a
            memw                                               #  9b0: c02000
            s32i         a3, a5, 0                             #  9b3: 3905
            addi         a12, a12, 1                           #  9b5: 1bcc
            l32i         a3, sp, 80 /* [(local19)] */          #  9b7: 322114
            movi         a5, 4 /* 0x00000004 */                #  9ba: 0c45
            extui        a12, a12, 0, 8                        #  9bc: c0c074
            sub          a8, a14, a12                          #  9bf: c08ec0
            bnez         a8, .Lbr060                           #  9c2: 56e8f2
.Lbr063:    l32i         a12, sp, 44 /* [(local10)] */         #  9c5: c8b1
            l32i         a13, sp, 48 /* [(local11)] */         #  9c7: d8c1
            l32i         a14, sp, 52 /* [(local12)] */         #  9c9: e8d1
            l32i         a15, sp, 56 /* [(local13)] */         #  9cb: f8e1
            l32i         a0, sp, 40 /* [(local9)] */           #  9cd: 08a1
            addi         sp, sp, 96 /* (local20) */            #  9cf: 12c160
            ret                                                #  9d2: 0df0

            .literal_position                                  #  9d4: 00020060
                                                               #  9d8: 00000000
                                                               #  9dc: 00000000
                                                               #  9e0: 00000000
                                                               #  9e4: 00000000
                                                               #  9e8: 00000000
                                                               #  9ec: 00000000

# Function @ .irom0.text+0x9f0
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word      @ -0x3c
#     (local2):  word      @ -0x38
#     (local3):  word      @ -0x34
#     (local4):  word      @ -0x30
#     (local5):  word      @ -0x2c
#     (local6):  word      @ -0x28
#     (local7):  word      @ -0x24
#     (local8):  word      @ -0x20
#     (local9):  word      @ -0x1c
#     (local10): word      @ -0x18
#     (local11): word      @ -0x14
#     (local12): word[4]   @ -0x10
            .global      sdk_ram_get_corr_power
            .type        sdk_ram_get_corr_power, @function
sdk_ram_get_corr_power:
            addi         sp, sp, -64 /* (local0) */            #  9f0: 12c1c0
            s32i         a13, sp, 48 /* a13 -> [(local12)] */  #  9f3: d9c1
            s32i         a12, sp, 44 /* a12 -> [(local11)] */  #  9f5: c9b1
            s32i         a0, sp, 40 /* a0 -> [(local10)] */    #  9f7: 09a1
            mov          a12, a2 /* arg0 */                    #  9f9: cd02
            movi         a2, 0x60000200                        #  9fb: 21f6ff
            memw                                               #  9fe: c02000
            l32i         a5, a2, 0x38c /* [0x6000058c] */      #  a01: 5222e3
            srai         a5, a5, 9                             #  a04: 505921
            memw                                               #  a07: c02000
            l32i         a4, a2, 0x380 /* [0x60000580] */      #  a0a: 4222e0
            srai         a4, a4, 9                             #  a0d: 404921
            add          a4, a4, a5                            #  a10: 5a44
            memw                                               #  a12: c02000
            l32i         a5, a2, 0x388 /* [0x60000588] */      #  a15: 5222e2
            srai         a5, a5, 9                             #  a18: 505921
            memw                                               #  a1b: c02000
            l32i         a0, a2, 0x384 /* [0x60000584] */      #  a1e: 0222e1
            srai         a0, a0, 9                             #  a21: 000921
            sub          a0, a0, a5                            #  a24: 5000c0
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     #  a27: 0931
            memw                                               #  a29: c02000
            l32i         a6, a2, 0x3dc /* [0x600005dc] */      #  a2c: 6222f7
            srai         a6, a6, 8                             #  a2f: 606821
            s32i         a6, sp, 0 /* a6 -> [(local0)] */      #  a32: 6901
            memw                                               #  a34: c02000
            l32i         a5, a2, 0x3e0 /* [0x600005e0] */      #  a37: 5222f8
            srai         a5, a5, 8                             #  a3a: 505821
            s32i         a5, sp, 4 /* a5 -> [(local1)] */      #  a3d: 5911
            memw                                               #  a3f: c02000
            l32i         a2, a2, 0x3e4 /* [0x600005e4] */      #  a42: 2222f9
            movi         a13, -4 /* 0xfffffffc */              #  a45: 7ccd
            addi         a5, a3, -2 /* arg1-0x2 */             #  a47: 52c3fe
            srai         a0, a0, 31                            #  a4a: 000f31
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  a4d: 0921
            ssr          a5                                    #  a4f: 000540
            addx2        a13, a3, a13                          #  a52: d0d390
            srai         a5, a4, 31                            #  a55: 405f31
            sra          a2, a2                                #  a58: 2020b1
            s32i         a2, a12, 0 /* a2 -> [arg0] */         #  a5b: 290c
            mov          a3, a5                                #  a5d: 3d05
            mov          a2, a4                                #  a5f: 2d04
            call0        __muldi3                              #  a61: 01ddffc0
                                                               #  a65: 0000
            s32i         a2, sp, 20 /* a2 -> [(local5)] */     #  a67: 2951
            s32i         a3, sp, 16 /* a3 -> [(local4)] */     #  a69: 3941
            l32i         a5, sp, 8 /* [(local2)] */            #  a6b: 5821
            l32i         a4, sp, 12 /* [(local3)] */           #  a6d: 4831
            mov          a3, a5 /* [(local2)] */               #  a6f: 3d05
            mov          a2, a4 /* [(local3)] */               #  a71: 2d04
            call0        __muldi3                              #  a73: 01daffc0
                                                               #  a77: 0000
            mov          a4, a3                                #  a79: 4d03
            l32i         a6, sp, 20 /* [(local5)] */           #  a7b: 6851
            l32i         a3, sp, 16 /* [(local4)] */           #  a7d: 3841
            add          a2, a6, a2                            #  a7f: 2a26
            add          a3, a3, a4                            #  a81: 4a33
            bgeu         a2, a6, .Lbr064                       #  a83: 67b201
            addi         a3, a3, 1                             #  a86: 1b33
.Lbr064:    mov          a4, a13                               #  a88: 4d0d
            call0        __ashrdi3                             #  a8a: 01d5ffc0
                                                               #  a8e: 0000
            s32i         a2, a12, 4 /* a2 -> [arg0+0x4] */     #  a90: 291c
            l32i         a4, sp, 0 /* [(local0)] */            #  a92: 4801
            l32i         a6, sp, 4 /* [(local1)] */            #  a94: 6811
            s32i         a6, sp, 28 /* [(local1)] -> [(local7)] */ #  a96: 6971
            srai         a5, a4, 31                            #  a98: 405f31
            srai         a6, a6, 31                            #  a9b: 606f31
            s32i         a6, sp, 24 /* a6 -> [(local6)] */     #  a9e: 6961
            mov          a3, a5                                #  aa0: 3d05
            mov          a2, a4 /* [(local0)] */               #  aa2: 2d04
            call0        __muldi3                              #  aa4: 01d0ffc0
                                                               #  aa8: 0000
            s32i         a2, sp, 36 /* a2 -> [(local9)] */     #  aaa: 2991
            s32i         a3, sp, 32 /* a3 -> [(local8)] */     #  aac: 3981
            l32i         a5, sp, 24 /* [(local6)] */           #  aae: 5861
            l32i         a4, sp, 28 /* [(local7)] */           #  ab0: 4871
            mov          a3, a5 /* [(local6)] */               #  ab2: 3d05
            mov          a2, a4 /* [(local7)] */               #  ab4: 2d04
            call0        __muldi3                              #  ab6: 01ccffc0
                                                               #  aba: 0000
            mov          a4, a3                                #  abc: 4d03
            l32i         a8, sp, 36 /* [(local9)] */           #  abe: 8891
            l32i         a3, sp, 32 /* [(local8)] */           #  ac0: 3881
            add          a2, a8, a2                            #  ac2: 2a28
            add          a3, a3, a4                            #  ac4: 4a33
            bgeu         a2, a8, .Lbr065                       #  ac6: 87b201
            addi         a3, a3, 1                             #  ac9: 1b33
.Lbr065:    mov          a4, a13                               #  acb: 4d0d
            call0        __ashrdi3                             #  acd: 01c7ffc0
                                                               #  ad1: 0000
            l32i         a0, sp, 40 /* [(local10)] */          #  ad3: 08a1
            s32i         a2, a12, 8 /* a2 -> [arg0+0x8] */     #  ad5: 292c
            l32i         a13, sp, 48 /* [(local12)] */         #  ad7: d8c1
            l32i         a12, sp, 44 /* [(local11)] */         #  ad9: c8b1
            addi         sp, sp, 64 /* (top of frame) */       #  adb: 12c140
            ret                                                #  ade: 0df0

            .literal_position                                  #  ae0: 00000000

# Function @ .irom0.text+0xae4
            .global      sdk_check_data_func
            .type        sdk_check_data_func, @function
sdk_check_data_func:
            blt          a2, a3, .Lbr066                       #  ae4: 372202
            bge          a4, a2, .Lbr067                       #  ae7: 27a411
.Lbr066:    ssl          a5                                    #  aea: 001540
            movi         a3, sdk_rxiq_compute_num              #  aed: 31fcff
            movi         a4, 1 /* 0x00000001 */                #  af0: 0c14
            l32i         a2, a3, 8 /* [sdk_check_result] */    #  af2: 2823
            sll          a4, a4                                #  af4: 0044a1
            or           a2, a2, a4                            #  af7: 402220
            s32i         a2, a3, 8 /* a2 -> [sdk_check_result] */ #  afa: 2923
.Lbr067:    ret                                                #  afc: 0df0

            .literal_position                                  #  b00: 009a0060
                                                               #  b04: fd7ffdff

# Function @ .irom0.text+0xb08
            .global      sdk_do_noisefloor_lsleep_v50
            .type        sdk_do_noisefloor_lsleep_v50, @function
sdk_do_noisefloor_lsleep_v50:
            movi         a8, -512 /* 0xfffffe00 */             #  b08: 82ae00
            movi         a7, 322 /* 0x00000142 */              #  b0b: 72a142
            movi         a3, 0x60009a00                        #  b0e: 31fcff
            memw                                               #  b11: c02000
            l32i         a6, a3, 0x164 /* [0x60009b64] */      #  b14: 622359
            and          a6, a6, a8                            #  b17: 806610
            or           a6, a6, a7                            #  b1a: 706620
            memw                                               #  b1d: c02000
            s32i         a6, a3, 0x164 /* a6 -> [0x60009b64] */ #  b20: 626359
            movi         a5, 0xfffd7ffd                        #  b23: 51f8ff
            movi         a4, 2 /* 0x00000002 */                #  b26: 0c24
            memw                                               #  b28: c02000
            l32i         a2, a3, 0x160 /* [0x60009b60] */      #  b2b: 222358
            and          a2, a2, a5                            #  b2e: 502210
            or           a2, a2, a4                            #  b31: 402220
            memw                                               #  b34: c02000
            s32i         a2, a3, 0x160 /* a2 -> [0x60009b60] */ #  b37: 226358
            ret                                                #  b3a: 0df0

            .literal_position                                  #  b3c: 000af23f
                                                               #  b40: 009a0060
                                                               #  b44: 00000000
                                                               #  b48: 00000000

# Function @ .irom0.text+0xb4c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .global      sdk_do_noisefloor
            .type        sdk_do_noisefloor, @function
sdk_do_noisefloor:
            addi         sp, sp, -32 /* (local0) */            #  b4c: 12c1e0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  b4f: 0911
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  b51: 2901
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  b53: d931
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  b55: e941
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  b57: c921
            mov          a14, a5 /* arg3 */                    #  b59: ed05
            movi         a12, 0x60009a00                       #  b5b: c1f9ff
            movi         a13, 0x3ff20a00                       #  b5e: d1f7ff
.Lbr068:    memw                                               #  b61: c02000
            l32i         a0, a12, 0x160 /* [0x60009b60] */     #  b64: 022c58
            s32i         a4, sp, 20 /* arg2 -> [(local5)] */   #  b67: 4951
            bbsi         a0, 1, .Lbr070                        #  b69: 17e024
            mov          a2, a3 /* arg1 */                     #  b6c: 2d03
            call0        sdk_ets_delay_us                      #  b6e: 01f6ffc0
                                                               #  b72: 0000
            movi         a0, sdk_g_phyFuns                     #  b74: 01f4ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  b77: 0800
            l32i         a0, a0, 100 /* [[sdk_g_phyFuns]+0x64] */ #  b79: 022019
            l32i         a2, sp, 0 /* [(local0)] */            #  b7c: 2801
            callx0       a0 /* [[sdk_g_phyFuns]+0x64] */       #  b7e: c00000
            l32i         a0, sp, 20 /* [(local5)] */           #  b81: 0851
.Lbr069:    memw                                               #  b83: c02000
            l32i         a2, a12, 0x160 /* [0x60009b60] */     #  b86: 222c58
            bbsi         a2, 1, .Lbr071                        #  b89: 17e213
            movi         a2, 0 /* 0x00000000 */                #  b8c: 0c02
            j            .Lbr073                               #  b8e: 060700
.Lbr070:    memw                                               #  b91: c02000
            l32i         a5, a13, 0x200 /* [0x3ff20c00] */     #  b94: 522d80
            sub          a5, a5, a4                            #  b97: 4055c0
            bgeu         a14, a5, .Lbr068                      #  b9a: 57bec3
            j            .Lbr072                               #  b9d: c60200
.Lbr071:    memw                                               #  ba0: c02000
            l32i         a6, a13, 0x200 /* [0x3ff20c00] */     #  ba3: 622d80
            sub          a6, a6, a0                            #  ba6: 0066c0
            bgeu         a14, a6, .Lbr069                      #  ba9: 67bed6
.Lbr072:    movi         a2, 1 /* 0x00000001 */                #  bac: 0c12
.Lbr073:    l32i         a12, sp, 8 /* [(local2)] */           #  bae: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  bb0: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  bb2: e841
            l32i         a0, sp, 4 /* [(local1)] */            #  bb4: 0811
            addi         sp, sp, 32 /* (top of frame) */       #  bb6: 12c120
            ret                                                #  bb9: 0df0

            .literal_position                                  #  bbc: fffffff7
                                                               #  bc0: 009a0060

# Function @ .irom0.text+0xbc4
            .global      sdk_start_dig_rx
            .type        sdk_start_dig_rx, @function
sdk_start_dig_rx:
            movi         a9, 0xf7ffffff                        #  bc4: 91feff
            movi         a3, 0x60009a00                        #  bc7: 31feff
            memw                                               #  bca: c02000
            l32i         a8, a3, 0x108 /* [0x60009b08] */      #  bcd: 822342
            and          a8, a8, a9                            #  bd0: 908810
            memw                                               #  bd3: c02000
            s32i         a8, a3, 0x108 /* a8 -> [0x60009b08] */ #  bd6: 826342
            movi         a7, 1 /* 0x00000001 */                #  bd9: 0c17
            memw                                               #  bdb: c02000
            l32i         a6, a3, 0x160 /* [0x60009b60] */      #  bde: 622358
            or           a6, a6, a7                            #  be1: 706620
            memw                                               #  be4: c02000
            s32i         a6, a3, 0x160 /* a6 -> [0x60009b60] */ #  be7: 626358
            movi         a5, -2 /* 0xfffffffe */               #  bea: 7ce5
            memw                                               #  bec: c02000
            l32i         a4, a3, 0x160 /* [0x60009b60] */      #  bef: 422358
            and          a4, a4, a5                            #  bf2: 504410
            memw                                               #  bf5: c02000
            s32i         a4, a3, 0x160 /* a4 -> [0x60009b60] */ #  bf8: 426358
            memw                                               #  bfb: c02000
            s32i         a2, a3, 44 /* arg0 -> [0x60009a2c] */ #  bfe: 29b3
            ret           /* arg0 */                           #  c00: 0df0

            .literal_position                                  #  c04: 009a0060
                                                               #  c08: 00000008
                                                               #  c0c: fffff7ff

# Function @ .irom0.text+0xc10
            .global      sdk_stop_dig_rx
            .type        sdk_stop_dig_rx, @function
sdk_stop_dig_rx:
            movi         a4, 0x60009a00                        #  c10: 41fdff
            memw                                               #  c13: c02000
            movi         a7, 0x08000000                        #  c16: 71fcff
            l32i         a2, a4, 44 /* [0x60009a2c] */         #  c19: 28b4
            memw                                               #  c1b: c02000
            l32i         a6, a4, 0x108 /* [0x60009b08] */      #  c1e: 622442
            or           a6, a6, a7                            #  c21: 706620
            memw                                               #  c24: c02000
            s32i         a6, a4, 0x108 /* a6 -> [0x60009b08] */ #  c27: 626442
            movi         a5, 0xfff7ffff                        #  c2a: 51f8ff
            memw                                               #  c2d: c02000
            l32i         a3, a4, 44 /* [0x60009a2c] */         #  c30: 38b4
            and          a3, a3, a5                            #  c32: 503310
            memw                                               #  c35: c02000
            s32i         a3, a4, 44 /* a3 -> [0x60009a2c] */   #  c38: 39b4
            ret           /* [0x60009a2c] */                   #  c3a: 0df0

            .literal_position                                  #  c3c: 00000000
                                                               #  c40: 00000000

# Function @ .irom0.text+0xc44
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_chip_v6_set_chanfreq
            .type        sdk_chip_v6_set_chanfreq, @function
sdk_chip_v6_set_chanfreq:
            addi         sp, sp, -16 /* (local0) */            #  c44: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  c47: 0901
            movi         a0, sdk_g_phyFuns                     #  c49: 01fcff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  c4c: 0800
            l32i         a0, a0, 68 /* [[sdk_g_phyFuns]+0x44] */ #  c4e: 022011
            movi         a3, 128 /* 0x00000080 */              #  c51: 32a080
            callx0       a0 /* [[sdk_g_phyFuns]+0x44] */       #  c54: c00000
            call0        sdk_chip_v6_set_chan                  #  c57: 01faffc0
                                                               #  c5b: 0000
            movi         a2, 0 /* 0x00000000 */                #  c5d: 0c02
            l32i         a0, sp, 0 /* [(local0)] */            #  c5f: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  c61: 12c110
            ret           /* 0x00000000 */                     #  c64: 0df0

            .literal_position                                  #  c68: 00000000
                                                               #  c6c: 00000000
                                                               #  c70: 00000000
                                                               #  c74: 78010000
                                                               #  c78: 58000000
                                                               #  c7c: 65010000
                                                               #  c80: 0c000000
                                                               #  c84: 0c000000
                                                               #  c88: 0c000000
                                                               #  c8c: 0c000000
                                                               #  c90: 0c000000
                                                               #  c94: 00000000
                                                               #  c98: 00000000
                                                               #  c9c: 00000000
                                                               #  ca0: 00000400
                                                               #  ca4: 00000000
                                                               #  ca8: 00000000
                                                               #  cac: 00000000
                                                               #  cb0: 00000000
                                                               #  cb4: 00000000
                                                               #  cb8: 00000000
                                                               #  cbc: 00000000
                                                               #  cc0: 00000000

# Function @ .irom0.text+0xcc4
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word[3]   @ -0x3c
#     (local2):  byte[2]   @ -0x2e
#     (local3):  word      @ -0x2c
#     (local4):  word      @ -0x28
#     (local5):  word      @ -0x24
#     (local6):  word      @ -0x20
#     (local7):  word      @ -0x1c
#     (local8):  word      @ -0x18
#     (local9):  word      @ -0x14
#     (local10): word      @ -0x10
#     (local11): word[3]   @ -0xc
            .global      sdk_tx_cap_init
            .type        sdk_tx_cap_init, @function
sdk_tx_cap_init:
            addi         sp, sp, -64 /* (local0) */            #  cc4: 12c1c0
            s32i         a12, sp, 24 /* a12 -> [(local4)] */   #  cc7: c961
            s32i         a15, sp, 36 /* a15 -> [(local7)] */   #  cc9: f991
            s32i         a14, sp, 32 /* a14 -> [(local6)] */   #  ccb: e981
            s32i         a13, sp, 28 /* a13 -> [(local5)] */   #  ccd: d971
            movi         a13, sdk_rxiq_compute_num             #  ccf: d1e6ff
            s32i         a0, sp, 20 /* a0 -> [(local3)] */     #  cd2: 0951
            l32i         a0, a13, 12 /* [sdk_chip6_sleep_params] */ #  cd4: 083d
            addi         a14, a13, 41 /* .Label002 */          #  cd6: e2cd29
            extui        a0, a0, 18, 1                         #  cd9: 000205
            bnez         a0, .Lbr084                           #  cdc: 56b017
            movi         a12, sdk_g_phyFuns                    #  cdf: c1e3ff
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  ce2: 080c
            l32i         a0, a0, 160 /* [[sdk_g_phyFuns]+0xa0] */ #  ce4: 022028
            callx0       a0 /* [[sdk_g_phyFuns]+0xa0] */       #  ce7: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  cea: 080c
            l32i         a0, a0, 192 /* [[sdk_g_phyFuns]+0xc0] */ #  cec: 022030
            movi         a2, 1 /* 0x00000001 */                #  cef: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0xc0] */       #  cf1: c00000
            movi         a15, .Ldata001                        #  cf4: f1dfff
            l16ui        a2, a15, 2 /* [sdk_tx_rf_ana_gain] */ #  cf7: 221f01
            extui        a2, a2, 0, 12                         #  cfa: 2020b4
            call0        sdk_ram_pbus_xpd_tx_on                #  cfd: 01e9ffc0
                                                               #  d01: 0000
            l16ui        a2, a15, 2 /* [sdk_tx_rf_ana_gain] */ #  d03: 221f01
            addi         a3, sp, 16 /* (FP)-0x30 */            #  d06: 32c110
            movi         a4, 1 /* 0x00000001 */                #  d09: 0c14
            call0        sdk_set_txdc_pbus                     #  d0b: 01e7ffc0
                                                               #  d0f: 0000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  d11: 080c
            l32i         a0, a0, 24 /* [[sdk_g_phyFuns]+0x18] */ #  d13: 0860
            movi         a2, 0 /* 0x00000000 */                #  d15: 0c02
            callx0       a0 /* [[sdk_g_phyFuns]+0x18] */       #  d17: c00000
            l8ui         a13, sp, 18 /* [(local2)] */          #  d1a: d20112
            movi         a12, 0 /* 0x00000000 */               #  d1d: 0c0c
            movi         a15, .Label007                        #  d1f: f1d5ff
.Lbr074:    beqz         a12, .Lbr077                          #  d22: 9c6c
            beqi         a12, 1, .Lbr076                       #  d24: 261c0f
            beqi         a12, 2, .Lbr075                       #  d27: 262c07
            bnei         a12, 3, .Lbr078                       #  d2a: 663c10
            movi         a13, 14 /* 0x0000000e */              #  d2d: 0ced
            j            .Lbr078                               #  d2f: c60200
.Lbr075:    movi         a13, 11 /* 0x0000000b */              #  d32: 0cbd
            j            .Lbr078                               #  d34: 860100
.Lbr076:    movi         a13, 6 /* 0x00000006 */               #  d37: 0c6d
            j            .Lbr078                               #  d39: 460000
.Lbr077:    movi         a13, 1 /* 0x00000001 */               #  d3c: 0c1d
.Lbr078:    mov          a7, a15 /* .Label007 */               #  d3e: 7d0f
            movi         a6, 100 /* 0x00000064 */              #  d40: 62a064
            movi         a4, 1 /* 0x00000001 */                #  d43: 0c14
            movi         a3, .Label006                         #  d45: 31cdff
            movi         a5, .Ldata002                         #  d48: 51ccff
            slli         a2, a13, 24                           #  d4b: 802d01
            srai         a2, a2, 24                            #  d4e: 202831
            l16si        a5, a5, 0x1fa /* [sdk_phy_freq_offset] */ #  d51: 5295fd
            l8ui         a3, a3, 128 /* [.Ldata023] */         #  d54: 320380
            s32i         a4, sp, 4 /* 0x00000001 -> [(local1)] */ #  d57: 4911
            s32i         a6, sp, 0 /* 0x00000064 -> [(local0)] */ #  d59: 6901
            movi         a4, 0 /* 0x00000000 */                #  d5b: 0c04
            movi         a6, sdk_chip6_sleep_params            #  d5d: 61c8ff
            call0        sdk_chip_60_set_channel               #  d60: 01d3ffc0
                                                               #  d64: 0000
            movi         a2, 64 /* 0x00000040 */               #  d66: 4c02
            movi         a3, 40 /* 0x00000028 */               #  d68: 2c83
            movi         a4, 2 /* 0x00000002 */                #  d6a: 0c24
            movi         a5, 0 /* 0x00000000 */                #  d6c: 0c05
            addx2        a6, a13, a13                          #  d6e: d06d90
            add          a6, a14, a6                           #  d71: 6a6e
            call0        sdk_ram_rfcal_txcap                   #  d73: 01cfffc0
                                                               #  d77: 0000
            addi         a12, a12, 1                           #  d79: 1bcc
            extui        a12, a12, 0, 8                        #  d7b: c0c074
            bnei         a12, 4, .Lbr074                       #  d7e: 664ca0
            movi         a12, 0 /* 0x00000000 */               #  d81: 0c0c
            movi         a15, 0 /* 0x00000000 */               #  d83: 0c0f
            movi         a13, 3 /* 0x00000003 */               #  d85: 0c3d
            movi         a0, sdk_chip6_sleep_params            #  d87: 01bfff
            s32i         a13, sp, 40 /* 0x00000003 -> [(local8)] */ #  d8a: d9a1
            add          a14, a15, a0 /* sdk_chip6_sleep_params */ #  d8c: 0aef
.Lbr079:    movi         a13, 14 /* 0x0000000e */              #  d8e: 0ced
.Lbr080:    bgeui        a12, 6, .Lbr081                       #  d90: f66c23
            mov          a2, a12                               #  d93: 2d0c
            movi         a3, 5 /* 0x00000005 */                #  d95: 0c53
            l8ui         a0, a14, 32                           #  d97: 020e20
            s32i         a0, sp, 52 /* a0 -> [(local11)] */    #  d9a: 09d1
            call0        __udivsi3                             #  d9c: 01c6ffc0
                                                               #  da0: 0000
            mov          a3, a2                                #  da2: 3d02
            l8ui         a4, a14, 47                           #  da4: 420e2f
            l32i         a2, sp, 52 /* [(local11)] */          #  da7: 28d1
            movi         a0, sdk_chip6_sleep_params            #  da9: 01b7ff
            sub          a4, a4, a2                            #  dac: 2044c0
            mull         a3, a3, a4                            #  daf: 403382
            add          a2, a2, a3                            #  db2: 3a22
            j            .Lbr083                               #  db4: c61300
.Lbr081:    movi         a5, 10 /* 0x0000000a */               #  db7: 0ca5
            bltu         a5, a12, .Lbr082                      #  db9: c73522
            movi         a3, 5 /* 0x00000005 */                #  dbc: 0c53
            addi         a2, a12, -5                           #  dbe: 22ccfb
            l8ui         a4, a14, 62                           #  dc1: 420e3e
            l8ui         a5, a14, 47                           #  dc4: 520e2f
            s32i         a5, sp, 48 /* a5 -> [(local10)] */    #  dc7: 59c1
            sub          a4, a4, a5                            #  dc9: 5044c0
            mull         a2, a2, a4                            #  dcc: 402282
            call0        __divsi3                              #  dcf: 01baffc0
                                                               #  dd3: 0000
            l32i         a6, sp, 48 /* [(local10)] */          #  dd5: 68c1
            movi         a0, sdk_chip6_sleep_params            #  dd7: 01adff
            add          a2, a2, a6                            #  dda: 6a22
            j            .Lbr083                               #  ddc: c60900
.Lbr082:    l8ui         a2, a14, 71                           #  ddf: 220e47
            movi         a7, 12 /* 0x0000000c */               #  de2: 0cc7
            bltu         a7, a12, .Lbr083                      #  de4: c7371f
            addx4        a8, a12, a12                          #  de7: c08ca0
            l8ui         a3, a14, 62                           #  dea: 320e3e
            s32i         a3, sp, 44 /* a3 -> [(local9)] */     #  ded: 39b1
            addi         a8, a8, -50                           #  def: 82c8ce
            sub          a2, a2, a3                            #  df2: 3022c0
            mull         a2, a8, a2                            #  df5: 202882
            movi         a3, 22 /* 0x00000016 */               #  df8: 1c63
            call0        __divsi3                              #  dfa: 01b0ffc0
                                                               #  dfe: 0000
            l32i         a9, sp, 44 /* [(local9)] */           #  e00: 98b1
            movi         a0, sdk_chip6_sleep_params            #  e02: 01a3ff
            add          a2, a2, a9                            #  e05: 9a22
.Lbr083:    addi         a13, a13, -1                          #  e07: 0bdd
            addx2        a3, a12, a12                          #  e09: c03c90
            add          a3, a15, a3                           #  e0c: 3a3f
            addi         a12, a12, 1                           #  e0e: 1bcc
            extui        a12, a12, 0, 8                        #  e10: c0c074
            add          a3, a0, a3                            #  e13: 3a30
            s8i          a2, a3, 32                            #  e15: 224320
            bnez         a13, .Lbr080                          #  e18: 564df7
            movi         a12, 0 /* 0x00000000 */               #  e1b: 0c0c
            l32i         a4, sp, 40 /* [(local8)] */           #  e1d: 48a1
            addi         a15, a15, 1                           #  e1f: 1bff
            extui        a15, a15, 0, 8                        #  e21: f0f074
            add          a14, a15, a0                          #  e24: 0aef
            addi         a4, a4, -1 /* [(local8)]-0x1 */       #  e26: 0b44
            s32i         a4, sp, 40 /* [(local8)]-0x1 -> [(local8)] */ #  e28: 49a1
            bnez         a4, .Lbr079                           #  e2a: 5604f6
            movi         a0, sdk_g_phyFuns                     #  e2d: 0199ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  e30: 0800
            l32i         a0, a0, 200 /* [[sdk_g_phyFuns]+0xc8] */ #  e32: 022032
            callx0       a0 /* [[sdk_g_phyFuns]+0xc8] */       #  e35: c00000
            movi         a12, sdk_g_phyFuns                    #  e38: c198ff
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e3b: 080c
            l32i         a0, a0, 196 /* [[sdk_g_phyFuns]+0xc4] */ #  e3d: 022031
            callx0       a0 /* [[sdk_g_phyFuns]+0xc4] */       #  e40: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e43: 080c
            movi         a13, sdk_rxiq_compute_num             #  e45: d195ff
            l32i         a0, a0, 188 /* [[sdk_g_phyFuns]+0xbc] */ #  e48: 02202f
            movi         a14, 0x00040000                       #  e4b: e195ff
            callx0       a0 /* [[sdk_g_phyFuns]+0xbc] */       #  e4e: c00000
            l32i         a2, a13, 12 /* [sdk_chip6_sleep_params] */ #  e51: 283d
            or           a2, a2, a14                           #  e53: e02220
            s32i         a2, a13, 12 /* a2 -> [sdk_chip6_sleep_params] */ #  e56: 293d
            j            .Lbr085                               #  e58: 060700
.Lbr084:    l8ui         a2, a13, 90 /* [.Ldata003] */         #  e5b: 220d5a
            l8ui         a3, a13, 90 /* [.Ldata003] */         #  e5e: 320d5a
            slli         a2, a2, 24                            #  e61: 802201
            srai         a2, a2, 24                            #  e64: 202831
            slli         a3, a3, 24                            #  e67: 803301
            srai         a3, a3, 24                            #  e6a: 303831
            addx2        a2, a2, a3                            #  e6d: 302290
            add          a2, a14, a2                           #  e70: 2a2e
            call0        sdk_set_txcap_reg                     #  e72: 0193ffc0
                                                               #  e76: 0000
.Lbr085:    l32i         a12, sp, 24 /* [(local4)] */          #  e78: c861
            l32i         a13, sp, 28 /* [(local5)] */          #  e7a: d871
            l32i         a14, sp, 32 /* [(local6)] */          #  e7c: e881
            l32i         a15, sp, 36 /* [(local7)] */          #  e7e: f891
            l32i         a0, sp, 20 /* [(local3)] */           #  e80: 0851
            addi         sp, sp, 64 /* (top of frame) */       #  e82: 12c140
            ret                                                #  e85: 0df0

            .balign      4
# Function @ .irom0.text+0xe88
            .global      sdk_target_power_add_backoff
            .type        sdk_target_power_add_backoff, @function
sdk_target_power_add_backoff:
            movi         a8, 16 /* 0x00000010 */               #  e88: 1c08
            l8ui         a6, a3, 0 /* [arg1] */                #  e8a: 620300
            movi         a5, 28 /* 0x0000001c */               #  e8d: 1cc5
            bge          a5, a4, .Lbr086                       #  e8f: 47a504
            movi         a7, 12 /* 0x0000000c */               #  e92: 0cc7
            j            .Lbr088                               #  e94: 860200
.Lbr086:    bge          a8, a4, .Lbr087                       #  e97: 47a805
            addi         a7, a4, -16 /* arg2-0x10 */           #  e9a: 72c4f0
            j            .Lbr088                               #  e9d: 460000
.Lbr087:    movi         a7, 0 /* 0x00000000 */                #  ea0: 0c07
.Lbr088:    sub          a6, a6, a7                            #  ea2: 7066c0
            s8i          a6, a2, 0 /* a6 -> [arg0] */          #  ea5: 624200
            mov          a7, a8 /* 0x00000010 */               #  ea8: 7d08
            blt          a8, a4, .Lbr089                       #  eaa: 472801
            mov          a7, a4 /* arg2 */                     #  ead: 7d04
.Lbr089:    movi         a4, 1 /* 0x00000001 */                #  eaf: 0c14
.Lbr090:    add          a9, a2, a4                            #  eb1: 4a92
            addi         a10, a4, 1                            #  eb3: 1ba4
            add          a8, a3, a4                            #  eb5: 4a83
            l8ui         a8, a8, 0                             #  eb7: 820800
            extui        a4, a10, 0, 8                         #  eba: a04074
            sub          a8, a8, a7                            #  ebd: 7088c0
            s8i          a8, a9, 0                             #  ec0: 824900
            bnei         a4, 6, .Lbr090                        #  ec3: 6664ea
            ret           /* arg0 */                           #  ec6: 0df0

            .literal_position                                  #  ec8: 9e010000
                                                               #  ecc: 0c000000
                                                               #  ed0: 29000000
                                                               #  ed4: 74000000
                                                               #  ed8: 0c000000
                                                               #  edc: 00020060
                                                               #  ee0: 00000000
                                                               #  ee4: 5c000000
                                                               #  ee8: 0c000000
                                                               #  eec: 00000000
                                                               #  ef0: 00000020
                                                               #  ef4: 00000000
                                                               #  ef8: 00000000
                                                               #  efc: 00000000
                                                               #  f00: 00000000
                                                               #  f04: 00000000

# Function @ .irom0.text+0xf08
# Local variables/stack:
#     (local0):  word      @ -0x30
#     (local1):  word[5]   @ -0x2c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word      @ -0x8
#     (local7):  word      @ -0x4
            .global      sdk_tx_pwctrl_init_cal
            .type        sdk_tx_pwctrl_init_cal, @function
sdk_tx_pwctrl_init_cal:
            movi         a6, 100 /* 0x00000064 */              #  f08: 62a064
            movi         a4, 1 /* 0x00000001 */                #  f0b: 0c14
            addi         sp, sp, -48 /* (local0) */            #  f0d: 12c1d0
            s32i         a14, sp, 40 /* a14 -> [(local6)] */   #  f10: e9a1
            s32i         a0, sp, 28 /* a0 -> [(local3)] */     #  f12: 0971
            s32i         a15, sp, 44 /* a15 -> [(local7)] */   #  f14: f9b1
            s32i         a13, sp, 36 /* a13 -> [(local5)] */   #  f16: d991
            s32i         a12, sp, 32 /* a12 -> [(local4)] */   #  f18: c981
            mov          a13, a3 /* arg1 */                    #  f1a: dd03
            mov          a12, a2 /* arg0 */                    #  f1c: cd02
            movi         a15, .Label013                        #  f1e: f1eaff
            slli         a2, a2, 24                            #  f21: 802201
            srai         a2, a2, 24                            #  f24: 202831
            addi         a7, a15, -38 /* .Label007 */          #  f27: 72cfda
            l16si        a5, a15, 180 /* [sdk_phy_freq_offset] */ #  f2a: 529f5a
            l8ui         a3, a15, 71 /* [.Ldata023] */         #  f2d: 320f47
            s32i         a4, sp, 4 /* 0x00000001 -> [(local1)] */ #  f30: 4911
            s32i         a6, sp, 0 /* 0x00000064 -> [(local0)] */ #  f32: 6901
            movi         a4, 0 /* 0x00000000 */                #  f34: 0c04
            movi         a6, sdk_chip6_sleep_params            #  f36: 61e5ff
            call0        sdk_chip_60_set_channel               #  f39: 01eeffc0
                                                               #  f3d: 0000
            movi         a3, .Label002                         #  f3f: 31e4ff
            addx2        a2, a12, a12                          #  f42: c02c90
            add          a2, a2, a3                            #  f45: 3a22
            call0        sdk_set_txcap_reg                     #  f47: 01ecffc0
                                                               #  f4b: 0000
            l8ui         a4, a15, 182 /* [sdk_do_pwctrl_flag] */ #  f4d: 420fb6
            bnez         a4, .Lbr091                           #  f50: cc74
            bnei         a12, 6, .Lbr091                       #  f52: 666c05
            call0        sdk_cal_rf_ana_gain                   #  f55: 01e9ffc0
                                                               #  f59: 0000
.Lbr091:    movi         a14, .Ldata012                        #  f5b: e1deff
            bnei         a13, 1, .Lbr093                       #  f5e: 661d34
            movi         a13, 0 /* 0x00000000 */               #  f61: 0c0d
            movi         a5, 0 /* 0x00000000 */                #  f63: 0c05
            s32i         a5, sp, 24 /* 0x00000000 -> [(local2)] */ #  f65: 5961
.Lbr092:    mov          a2, a14 /* .Ldata012 */               #  f67: 2d0e
            call0        sdk_tx_pwr_backoff                    #  f69: 01e5ffc0
                                                               #  f6d: 0000
            l32i         a6, sp, 24 /* [(local2)] */           #  f6f: 6861
            add          a13, a2, a13                          #  f71: dad2
            slli         a13, a13, 16                          #  f73: 00dd11
            srai         a13, a13, 16                          #  f76: d0d031
            addi         a0, a6, 1 /* [(local2)]+0x1 */        #  f79: 1b06
            extui        a6, a0, 0, 8                          #  f7b: 006074
            s32i         a6, sp, 24 /* a6 -> [(local2)] */     #  f7e: 6961
            bnei         a6, 4, .Lbr092                        #  f80: 6646e3
            addi         a0, a13, 2                            #  f83: 2b0d
            addi         a13, a13, 5                           #  f85: 5bdd
            movgez       a13, a0, a0                           #  f87: 00d0b3
            srai         a13, a13, 2                           #  f8a: d0d221
            slli         a13, a13, 16                          #  f8d: 00dd11
            srai         a13, a13, 16                          #  f90: d0d031
            j            .Lbr094                               #  f93: 460000
.Lbr093:    movi         a13, 0 /* 0x00000000 */               #  f96: 0c0d
.Lbr094:    mov          a3, a14 /* .Ldata012 */               #  f98: 3d0e
            addi         a2, sp, 16 /* (FP)-0x20 */            #  f9a: 22c110
            mov          a4, a13                               #  f9d: 4d0d
            call0        sdk_target_power_add_backoff          #  f9f: 050000
            beqi         a12, 1, .Lbr095                       #  fa2: 261c12
            addi         a2, a12, -6 /* arg0-0x6 */            #  fa5: 22ccfa
            beqz         a2, .Lbr099                           #  fa8: 16c20b
            addi         a4, a12, -11 /* arg0-0xb */           #  fab: 42ccf5
            movi         a3, 2 /* 0x00000002 */                #  fae: 0c23
            movi         a0, 3 /* 0x00000003 */                #  fb0: 0c30
            moveqz       a0, a3, a4                            #  fb2: 400383
            j            .Lbr096                               #  fb5: 460000
.Lbr095:    movi         a0, 0 /* 0x00000000 */                #  fb8: 0c00
.Lbr096:    movi         a3, 0x60000200                        #  fba: 31c8ff
            movi         a6, -1 /* 0xffffffff */               #  fbd: 7cf6
            extui        a4, a13, 0, 8                         #  fbf: d04074
            slli         a5, a0, 3                             #  fc2: d05011
            movi         a14, sdk_chip6_sleep_params           #  fc5: e1c4ff
            ssl          a5                                    #  fc8: 001540
            movi         a5, 255 /* 0x000000ff */              #  fcb: 52a0ff
            addx2        a14, a0, a14                          #  fce: e0e090
            s16i         a13, a14, 12                          #  fd1: d25e06
            sll          a5, a5                                #  fd4: 0055a1
            sll          a4, a4                                #  fd7: 0044a1
            xor          a5, a5, a6                            #  fda: 605530
            memw                                               #  fdd: c02000
            l32i         a2, a3, 0x3fc /* [0x600005fc] */      #  fe0: 2223ff
            and          a2, a2, a5                            #  fe3: 502210
            or           a2, a2, a4                            #  fe6: 402220
            memw                                               #  fe9: c02000
            movi         a4, 6 /* 0x00000006 */                #  fec: 0c64
            movi         a5, 31 /* 0x0000001f */               #  fee: 1cf5
            movi         a9, 312 /* 0x00000138 */              #  ff0: 92a138
            movi         a6, .Ldata001                         #  ff3: 61bbff
            movi         a7, .Ldata005                         #  ff6: 71bbff
            s32i         a2, a3, 0x3fc /* a2 -> [0x600005fc] */ #  ff9: 2263ff
            addx2        a12, a0, a0                           #  ffc: 00c090
            movi         a2, 64 /* 0x00000040 */               #  fff: 4c02
            addi         a3, sp, 16 /* (FP)-0x20 */            # 1001: 32c110
            slli         a12, a12, 1                           # 1004: f0cc11
            add          a7, a12, a7                           # 1007: 7a7c
            l16ui        a6, a6, 2 /* [sdk_tx_rf_ana_gain] */  # 1009: 621601
            s32i         a9, sp, 0 /* 0x00000138 -> [(local0)] */ # 100c: 9901
            l8ui         a8, a15, 183 /* [sdk_pwctrl_debug] */ # 100e: 820fb7
            s32i         a8, sp, 4 /* [sdk_pwctrl_debug] -> [(local1)] */ # 1011: 8911
            call0        sdk_ram_rfcal_pwrctrl                 # 1013: 01bcffc0
                                                               # 1017: 0000
            movi         a3, sdk_rxiq_compute_num              # 1019: 31b4ff
            movi         a5, sdk_chip6_sleep_params            # 101c: 51b3ff
            l8ui         a4, a3, 117 /* [.Ldata013] */         # 101f: 420375
            l8ui         a0, a3, 116 /* [.Ldata012] */         # 1022: 020374
            add          a5, a12, a5                           # 1025: 5a5c
            l8ui         a2, a5, 81                            # 1027: 220551
            l8ui         a5, a5, 80                            # 102a: 520550
            slli         a2, a2, 24                            # 102d: 802201
            sub          a0, a0, a4                            # 1030: 4000c0
            addi         a0, a0, 4                             # 1033: 4b00
            srai         a2, a2, 24                            # 1035: 202831
            slli         a5, a5, 24                            # 1038: 805501
            srai         a5, a5, 24                            # 103b: 505831
            sub          a2, a2, a5                            # 103e: 5022c0
            bge          a0, a2, .Lbr097                       # 1041: 27a009
            movi         a7, 0x20000000                        # 1044: 71abff
            l32i         a6, a3, 12 /* [sdk_chip6_sleep_params] */ # 1047: 6833
            or           a6, a6, a7                            # 1049: 706620
            s32i         a6, a3, 12 /* a6 -> [sdk_chip6_sleep_params] */ # 104c: 6933
.Lbr097:    l32i         a12, sp, 32 /* [(local4)] */          # 104e: c881
            l32i         a13, sp, 36 /* [(local5)] */          # 1050: d891
            l32i         a0, sp, 28 /* [(local3)] */           # 1052: 0871
            l16si        a8, a14, 12                           # 1054: 829e06
            l32i         a14, sp, 40 /* [(local6)] */          # 1057: e8a1
            blti         a8, 5, .Lbr098                        # 1059: a65804
            movi         a9, 1 /* 0x00000001 */                # 105c: 0c19
            s8i          a9, a15, 184 /* 0x01 -> [sdk_txbk_dpdby_flag] */ # 105e: 924fb8
.Lbr098:    l32i         a15, sp, 44 /* [(local7)] */          # 1061: f8b1
            addi         sp, sp, 48 /* (top of frame) */       # 1063: 12c130
            ret                                                # 1066: 0df0
.Lbr099:    movi         a0, 1 /* 0x00000001 */                # 1068: 0c10
            j            .Lbr096                               # 106a: 06d3ff

            .literal_position                                  # 1070: 0c000000
                                                               # 1074: 00000000
                                                               # 1078: 00000000
                                                               # 107c: 00000000
                                                               # 1080: 00000000
                                                               # 1084: c7010000
                                                               # 1088: 0e020000
                                                               # 108c: 0c000000
                                                               # 1090: 0c000000
                                                               # 1094: 00000000
                                                               # 1098: 00000000
                                                               # 109c: 0c000000
                                                               # 10a0: 00000000
                                                               # 10a4: 00000000
                                                               # 10a8: 00000000
                                                               # 10ac: 0c000000
                                                               # 10b0: 00000000
                                                               # 10b4: 00000000
                                                               # 10b8: 00000000
                                                               # 10bc: 00000000
                                                               # 10c0: 00000000
                                                               # 10c4: 00000000
                                                               # 10c8: 00000000
                                                               # 10cc: 00000000
                                                               # 10d0: 00000000

# Function @ .irom0.text+0x10d4
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word      @ -0x3c
#     (local2):  word      @ -0x38
#     (local3):  word      @ -0x34
#     (local4):  word      @ -0x30
#     (local5):  word      @ -0x2c
#     (local6):  word      @ -0x28
#     (local7):  word      @ -0x24
#     (local8):  word      @ -0x20
#     (local9):  word      @ -0x1c
#     (local10): word      @ -0x18
#     (local11): word      @ -0x14
#     (local12): word[4]   @ -0x10
            .global      sdk_tx_atten_set_interp
            .type        sdk_tx_atten_set_interp, @function
sdk_tx_atten_set_interp:
            addi         a4, a2, -6 /* arg0-0x6 */             # 10d4: 42c2fa
            addx4        a5, a2, a2                            # 10d7: 2052a0
            addi         sp, sp, -64 /* (local0) */            # 10da: 12c1c0
            s32i         a13, sp, 20 /* a13 -> [(local5)] */   # 10dd: d951
            s32i         a3, sp, 48 /* arg1 -> [(local12)] */  # 10df: 39c1
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     # 10e1: 0931
            s32i         a14, sp, 24 /* a14 -> [(local6)] */   # 10e3: e961
            s32i         a15, sp, 28 /* a15 -> [(local7)] */   # 10e5: f971
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   # 10e7: c941
            addi         a5, a5, -55                           # 10e9: 52c5c9
            mov          a12, a2 /* arg0 */                    # 10ec: cd02
            s32i         a5, sp, 8 /* a5 -> [(local2)] */      # 10ee: 5921
            s32i         a4, sp, 32 /* arg0-0x6 -> [(local8)] */ # 10f0: 4981
            movi         a15, 0 /* 0x00000000 */               # 10f2: 0c0f
            movi         a14, 6 /* 0x00000006 */               # 10f4: 0c6e
            movi         a0, sdk_chip6_sleep_params            # 10f6: 01deff
            addi         a3, a2, -1 /* arg0-0x1 */             # 10f9: 0b32
            s32i         a3, sp, 44 /* arg0-0x1 -> [(local11)] */ # 10fb: 39b1
            mov          a13, a0 /* sdk_chip6_sleep_params */  # 10fd: dd00
            addi         a0, a0, -12 /* sdk_rxiq_compute_num */ # 10ff: 02c0f4
.Lbr100:    bgeui        a12, 7, .Lbr101                       # 1102: f67c2d
            movi         a3, 5 /* 0x00000005 */                # 1105: 0c53
            l32i         a2, sp, 44 /* [(local11)] */          # 1107: 28b1
            l8ui         a4, a13, 86                           # 1109: 420d56
            l8ui         a5, a13, 80                           # 110c: 520d50
            s32i         a5, sp, 40 /* a5 -> [(local10)] */    # 110f: 59a1
            slli         a4, a4, 24                            # 1111: 804401
            slli         a5, a5, 24                            # 1114: 805501
            srai         a5, a5, 24                            # 1117: 505831
            srai         a4, a4, 24                            # 111a: 404831
            sub          a4, a4, a5                            # 111d: 5044c0
            mull         a2, a2, a4                            # 1120: 402282
            call0        __divsi3                              # 1123: 01e3ffc0
                                                               # 1127: 0000
            l32i         a5, sp, 40 /* [(local10)] */          # 1129: 58a1
            movi         a0, sdk_rxiq_compute_num              # 112b: 01d2ff
            add          a2, a2, a5                            # 112e: 5a22
            j            .Lbr103                               # 1130: 061800
.Lbr101:    bgeui        a12, 12, .Lbr102                      # 1133: f6ac2d
            movi         a3, 5 /* 0x00000005 */                # 1136: 0c53
            l32i         a2, sp, 32 /* [(local8)] */           # 1138: 2881
            l8ui         a4, a13, 92                           # 113a: 420d5c
            l8ui         a5, a13, 86                           # 113d: 520d56
            s32i         a5, sp, 36 /* a5 -> [(local9)] */     # 1140: 5991
            slli         a4, a4, 24                            # 1142: 804401
            slli         a5, a5, 24                            # 1145: 805501
            srai         a5, a5, 24                            # 1148: 505831
            srai         a4, a4, 24                            # 114b: 404831
            sub          a4, a4, a5                            # 114e: 5044c0
            mull         a2, a2, a4                            # 1151: 402282
            call0        __divsi3                              # 1154: 01d8ffc0
                                                               # 1158: 0000
            l32i         a5, sp, 36 /* [(local9)] */           # 115a: 5891
            movi         a0, sdk_rxiq_compute_num              # 115c: 01c7ff
            add          a2, a2, a5                            # 115f: 5a22
            j            .Lbr103                               # 1161: c60b00
.Lbr102:    l8ui         a2, a13, 98                           # 1164: 220d62
            movi         a6, 13 /* 0x0000000d */               # 1167: 0cd6
            slli         a2, a2, 24                            # 1169: 802201
            srai         a2, a2, 24                            # 116c: 202831
            bltu         a6, a12, .Lbr103                      # 116f: c73621
            l8ui         a4, a13, 92                           # 1172: 420d5c
            s32i         a4, sp, 4 /* a4 -> [(local1)] */      # 1175: 4911
            slli         a4, a4, 24                            # 1177: 804401
            srai         a4, a4, 24                            # 117a: 404831
            sub          a4, a2, a4                            # 117d: 4042c0
            l32i         a2, sp, 8 /* [(local2)] */            # 1180: 2821
            movi         a3, 22 /* 0x00000016 */               # 1182: 1c63
            mull         a2, a2, a4                            # 1184: 402282
            call0        __divsi3                              # 1187: 01ccffc0
                                                               # 118b: 0000
            l32i         a5, sp, 4 /* [(local1)] */            # 118d: 5811
            movi         a0, sdk_rxiq_compute_num              # 118f: 01bbff
            add          a2, a2, a5                            # 1192: 5a22
.Lbr103:    addi         a13, a13, 1                           # 1194: 1bdd
            addi         a14, a14, -1                          # 1196: 0bee
            l32i         a7, sp, 48 /* [(local12)] */          # 1198: 78c1
            l8ui         a6, a0, 132 /* [.Ldata017] */         # 119a: 620084
            add          a7, a15, a7                           # 119d: 7a7f
            slli         a6, a6, 24                            # 119f: 806601
            addi         a15, a15, 1                           # 11a2: 1bff
            srai         a6, a6, 24                            # 11a4: 606831
            add          a6, a6, a2                            # 11a7: 2a66
            s8i          a6, a7, 0                             # 11a9: 624700
            bnez         a14, .Lbr100                          # 11ac: 562ef5
            movi         a2, .Label014                         # 11af: 21b5ff
            movi         a9, sdk_loop_pwctrl_correct_atten_high_power # 11b2: 91b3ff
            l32i         a10, sp, 48 /* [(local12)] */         # 11b5: a8c1
            l8ui         a9, a9, 0 /* [sdk_loop_pwctrl_correct_atten_high_power] */ # 11b7: 920900
            l8ui         a11, a10, 0 /* [[(local12)]] */       # 11ba: b20a00
            slli         a9, a9, 24                            # 11bd: 809901
            srai         a9, a9, 24                            # 11c0: 909831
            add          a9, a9, a11                           # 11c3: ba99
            s8i          a9, a10, 0 /* a9 -> [[(local12)]] */  # 11c5: 924a00
            l8ui         a8, a2, 108 /* [.Ldata061] */         # 11c8: 82026c
            l8ui         a10, a2, 144 /* [.Ldata092] */        # 11cb: a20290
            beqi         a8, 1, .Lbr105                        # 11ce: 26182b
            beqi         a10, 1, .Lbr105                       # 11d1: 261a28
            movi         a5, 0 /* 0x00000000 */                # 11d4: 0c05
            movi         a13, -128 /* 0xffffff80 */            # 11d6: d2af80
.Lbr104:    mov          a6, a13                               # 11d9: 6d0d
            movi         a2, .Label020                         # 11db: 21abff
            movi         a3, 13 /* 0x0000000d */               # 11de: 0cd3
            l32i         a4, sp, 48 /* [(local12)] */          # 11e0: 48c1
            s8i          a13, a0, 91 /* a13 -> [.Ldata004] */  # 11e2: d2405b
            s8i          a5, a0, 122 /* a5 -> [.Ldata014] */   # 11e5: 52407a
            call0        sdk_ram_set_txbb_atten                # 11e8: 01b5ffc0
                                                               # 11ec: 0000
            l32i         a12, sp, 16 /* [(local4)] */          # 11ee: c841
            l32i         a13, sp, 20 /* [(local5)] */          # 11f0: d851
            l32i         a14, sp, 24 /* [(local6)] */          # 11f2: e861
            l32i         a15, sp, 28 /* [(local7)] */          # 11f4: f871
            l32i         a0, sp, 12 /* [(local3)] */           # 11f6: 0831
            addi         sp, sp, 64 /* (top of frame) */       # 11f8: 12c140
            ret                                                # 11fb: 0df0
.Lbr105:    l8ui         a11, a2, 99 /* [.Ldata052] */         # 11fd: b20263
            l8ui         a14, a2, 103 /* [.Ldata056] */        # 1200: e20267
            bnez         a11, .Lbr108                          # 1203: dc5b
            bltui        a12, 3, .Lbr106                       # 1205: b63c02
            j            .Lbr114                               # 1208: 864700
.Lbr106:    movi         a2, sdk_chip6_sleep_params            # 120b: 21a0ff
            l8ui         a2, a2, 82 /* [.Ldata006] */          # 120e: 220252
.Lbr107:    movi         a5, 1 /* 0x00000001 */                # 1211: 0c15
            slli         a13, a2, 24                           # 1213: 80d201
            srai         a13, a13, 24                          # 1216: d0d831
            j            .Lbr104                               # 1219: 06efff
.Lbr108:    bltu         a14, a12, .Lbr110                     # 121c: c73e61
            movi         a15, sdk_chip6_sleep_params           # 121f: f19cff
            l8ui         a13, a2, 101 /* [.Ldata054] */        # 1222: d20265
            add          a13, a13, a15                         # 1225: fadd
            l8ui         a13, a13, 80                          # 1227: d20d50
            l8ui         a15, a2, 104 /* [.Ldata057] */        # 122a: f20268
            slli         a13, a13, 24                          # 122d: 80dd01
            srai         a13, a13, 24                          # 1230: d0d831
            bnei         a15, 1, .Lbr109                       # 1233: 661f45
            movi         a12, sdk_rxiq_compute_num             # 1236: c197ff
            movi         a3, 5 /* 0x00000005 */                # 1239: 0c53
            l8ui         a2, a12, 98 /* [.Ldata007] */         # 123b: 220c62
            l8ui         a12, a12, 92 /* [.Ldata005] */        # 123e: c20c5c
            slli         a2, a2, 24                            # 1241: 802201
            srai         a2, a2, 24                            # 1244: 202831
            slli         a12, a12, 24                          # 1247: 80cc01
            srai         a12, a12, 24                          # 124a: c0c831
            sub          a2, a2, a12                           # 124d: c022c0
            mull         a2, a14, a2                           # 1250: 202e82
            call0        __divsi3                              # 1253: 019bffc0
                                                               # 1257: 0000
            add          a3, a12, a2                           # 1259: 2a3c
            slli         a3, a3, 24                            # 125b: 803301
            l32i         a2, sp, 44 /* [(local11)] */          # 125e: 28b1
            srai         a3, a3, 24                            # 1260: 303831
            sub          a3, a3, a13                           # 1263: d033c0
            mull         a2, a2, a3                            # 1266: 302282
            mov          a3, a14 /* [.Ldata056] */             # 1269: 3d0e
            call0        __divsi3                              # 126b: 0196ffc0
                                                               # 126f: 0000
            movi         a0, sdk_rxiq_compute_num              # 1271: 0189ff
            add          a13, a13, a2                          # 1274: 2add
            slli         a13, a13, 24                          # 1276: 80dd01
            srai         a13, a13, 24                          # 1279: d0d831
.Lbr109:    movi         a5, 1 /* 0x00000001 */                # 127c: 0c15
            j            .Lbr104                               # 127e: c6d5ff
.Lbr110:    l8ui         a3, a2, 102 /* [.Ldata055] */         # 1281: 320266
            movi         a15, 15 /* 0x0000000f */              # 1284: 0cff
            sub          a15, a15, a3                          # 1286: 30ffc0
            blt          a12, a15, .Lbr111                     # 1289: f72c4a
            movi         a15, sdk_chip6_sleep_params           # 128c: f184ff
            l8ui         a13, a2, 100 /* [.Ldata053] */        # 128f: d20264
            add          a13, a13, a15                         # 1292: fadd
            l8ui         a13, a13, 98                          # 1294: d20d62
            l8ui         a4, a2, 104 /* [.Ldata057] */         # 1297: 420268
            slli         a13, a13, 24                          # 129a: 80dd01
            srai         a13, a13, 24                          # 129d: d0d831
            bnei         a4, 1, .Lbr109                        # 12a0: 6614d8
            l8ui         a15, a0, 104 /* [.Ldata008] */        # 12a3: f20068
            slli         a15, a15, 24                          # 12a6: 80ff01
            srai         a15, a15, 24                          # 12a9: f0f831
            bgeui        a12, 12, .Lbr112                      # 12ac: f6ac2f
            movi         a2, sdk_rxiq_compute_num              # 12af: 217cff
            movi         a3, 8 /* 0x00000008 */                # 12b2: 0c83
            l8ui         a2, a2, 98 /* [.Ldata007] */          # 12b4: 220262
            sub          a3, a3, a14                           # 12b7: e033c0
            slli         a2, a2, 24                            # 12ba: 802201
            srai         a2, a2, 24                            # 12bd: 202831
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 12c0: 2901
            sub          a2, a15, a2                           # 12c2: 202fc0
            mull         a2, a2, a3                            # 12c5: 302282
            movi         a3, 5 /* 0x00000005 */                # 12c8: 0c53
            call0        __divsi3                              # 12ca: 017fffc0
                                                               # 12ce: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 12d0: 0801
            add          a0, a0, a2                            # 12d2: 2a00
            j            .Lbr113                               # 12d4: c60a00
.Lbr111:    movi         a5, 0 /* 0x00000000 */                # 12d7: 0c05
            movi         a13, -128 /* 0xffffff80 */            # 12d9: d2af80
            j            .Lbr104                               # 12dc: 46beff
.Lbr112:    movi         a2, sdk_rxiq_compute_num              # 12df: 2171ff
            movi         a3, 3 /* 0x00000003 */                # 12e2: 0c33
            l8ui         a2, a2, 110 /* [.Ldata010] */         # 12e4: 22026e
            sub          a3, a3, a14                           # 12e7: e033c0
            slli         a2, a2, 24                            # 12ea: 802201
            srai         a2, a2, 24                            # 12ed: 202831
            sub          a2, a2, a15                           # 12f0: f022c0
            mull         a2, a2, a3                            # 12f3: 302282
            addx4        a2, a2, a2                            # 12f6: 2022a0
            movi         a3, 22 /* 0x00000016 */               # 12f9: 1c63
            call0        __divsi3                              # 12fb: 0174ffc0
                                                               # 12ff: 0000
            add          a0, a15, a2                           # 1301: 2a0f
.Lbr113:    movi         a3, 14 /* 0x0000000e */               # 1303: 0ce3
            slli         a2, a0, 24                            # 1305: 802001
            srai         a2, a2, 24                            # 1308: 202831
            sub          a3, a3, a12                           # 130b: c033c0
            sub          a2, a2, a13                           # 130e: d022c0
            mull         a2, a2, a3                            # 1311: 302282
            mov          a3, a14 /* [.Ldata056] */             # 1314: 3d0e
            call0        __divsi3                              # 1316: 016effc0
                                                               # 131a: 0000
            movi         a0, sdk_rxiq_compute_num              # 131c: 0163ff
            add          a13, a13, a2                          # 131f: 2add
            slli         a13, a13, 24                          # 1321: 80dd01
            srai         a13, a13, 24                          # 1324: d0d831
            j            .Lbr109                               # 1327: 46d4ff
.Lbr114:    bltui        a12, 10, .Lbr115                      # 132a: b69c08
            movi         a2, sdk_chip6_sleep_params            # 132d: 215fff
            l8ui         a2, a2, 94 /* [.Ldata009] */          # 1330: 22025e
            j            .Lbr107                               # 1333: 86b6ff
.Lbr115:    movi         a13, -128 /* 0xffffff80 */            # 1336: d2af80
            movi         a5, 0 /* 0x00000000 */                # 1339: 0c05
            j            .Lbr104                               # 133b: 86a6ff

            .literal_position                                  # 1340: 00000000
                                                               # 1344: 00000000
                                                               # 1348: 00000000
                                                               # 134c: 00000000
                                                               # 1350: 56010000
                                                               # 1354: 00000000
                                                               # 1358: 00000000
                                                               # 135c: 00001000
                                                               # 1360: 00000000
                                                               # 1364: 00000000
                                                               # 1368: 00000000
                                                               # 136c: 00000000

# Function @ .irom0.text+0x1370
# Local variables/stack:
#     (local0):  byte[14]  @ -0x2e
#     (local1):  word      @ -0x20
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word      @ -0x10
#     (local6):  word[3]   @ -0xc
            .global      sdk_tx_pwctrl_init
            .type        sdk_tx_pwctrl_init, @function
sdk_tx_pwctrl_init:
            addi         sp, sp, -48 /* (FP)-0x30 */           # 1370: 12c1d0
            s32i         a14, sp, 28 /* a14 -> [(local4)] */   # 1373: e971
            s32i         a2, sp, 36 /* arg0 -> [(local6)] */   # 1375: 2991
            s32i         a12, sp, 20 /* a12 -> [(local2)] */   # 1377: c951
            s32i         a0, sp, 16 /* a0 -> [(local1)] */     # 1379: 0941
            s32i         a15, sp, 32 /* a15 -> [(local5)] */   # 137b: f981
            s32i         a13, sp, 24 /* a13 -> [(local3)] */   # 137d: d961
            movi         a13, sdk_rxiq_compute_num             # 137f: d1f0ff
            mov          a15, a2 /* arg0 */                    # 1382: fd02
            l32i         a0, a13, 12 /* [sdk_chip6_sleep_params] */ # 1384: 083d
            movi         a12, .Ldata001                        # 1386: c1efff
            extui        a0, a0, 20, 1                         # 1389: 000405
            bnez         a0, .Lbr121                           # 138c: 56b00a
            movi         a14, sdk_g_phyFuns                    # 138f: e1eeff
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      # 1392: 080e
            l32i         a0, a0, 160 /* [[sdk_g_phyFuns]+0xa0] */ # 1394: 022028
            callx0       a0 /* [[sdk_g_phyFuns]+0xa0] */       # 1397: c00000
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      # 139a: 080e
            l32i         a0, a0, 192 /* [[sdk_g_phyFuns]+0xc0] */ # 139c: 022030
            movi         a2, 1 /* 0x00000001 */                # 139f: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0xc0] */       # 13a1: c00000
            l16ui        a2, a12, 2 /* [sdk_tx_rf_ana_gain] */ # 13a4: 221c01
            extui        a2, a2, 0, 12                         # 13a7: 2020b4
            call0        sdk_ram_pbus_xpd_tx_on                # 13aa: 01edffc0
                                                               # 13ae: 0000
            l16ui        a2, a12, 2 /* [sdk_tx_rf_ana_gain] */ # 13b0: 221c01
            mov          a3, sp /* (FP)-0x30 */                # 13b3: 3d01
            movi         a4, 1 /* 0x00000001 */                # 13b5: 0c14
            call0        sdk_set_txdc_pbus                     # 13b7: 01ebffc0
                                                               # 13bb: 0000
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      # 13bd: 080e
            l32i         a0, a0, 24 /* [[sdk_g_phyFuns]+0x18] */ # 13bf: 0860
            movi         a2, 0 /* 0x00000000 */                # 13c1: 0c02
            callx0       a0 /* [[sdk_g_phyFuns]+0x18] */       # 13c3: c00000
            l8ui         a13, sp, 2 /* [(local0)] */           # 13c6: d20102
            movi         a12, 0 /* 0x00000000 */               # 13c9: 0c0c
.Lbr116:    beqz         a12, .Lbr119                          # 13cb: 9c6c
            beqi         a12, 1, .Lbr118                       # 13cd: 261c0f
            beqi         a12, 2, .Lbr117                       # 13d0: 262c07
            bnei         a12, 3, .Lbr120                       # 13d3: 663c10
            movi         a13, 14 /* 0x0000000e */              # 13d6: 0ced
            j            .Lbr120                               # 13d8: c60200
.Lbr117:    movi         a13, 11 /* 0x0000000b */              # 13db: 0cbd
            j            .Lbr120                               # 13dd: 860100
.Lbr118:    movi         a13, 1 /* 0x00000001 */               # 13e0: 0c1d
            j            .Lbr120                               # 13e2: 460000
.Lbr119:    movi         a13, 6 /* 0x00000006 */               # 13e5: 0c6d
.Lbr120:    mov          a3, a15 /* arg0 */                    # 13e7: 3d0f
            mov          a2, a13                               # 13e9: 2d0d
            call0        sdk_tx_pwctrl_init_cal                # 13eb: 050000
            addi         a12, a12, 1                           # 13ee: 1bcc
            extui        a12, a12, 0, 8                        # 13f0: c0c074
            bnei         a12, 4, .Lbr116                       # 13f3: 664cd4
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      # 13f6: 080e
            l32i         a0, a0, 200 /* [[sdk_g_phyFuns]+0xc8] */ # 13f8: 022032
            callx0       a0 /* [[sdk_g_phyFuns]+0xc8] */       # 13fb: c00000
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      # 13fe: 080e
            l32i         a0, a0, 196 /* [[sdk_g_phyFuns]+0xc4] */ # 1400: 022031
            movi         a13, sdk_rxiq_compute_num             # 1403: d1d2ff
            callx0       a0 /* [[sdk_g_phyFuns]+0xc4] */       # 1406: c00000
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      # 1409: 080e
            l32i         a0, a0, 188 /* [[sdk_g_phyFuns]+0xbc] */ # 140b: 02202f
            callx0       a0 /* [[sdk_g_phyFuns]+0xbc] */       # 140e: c00000
            movi         a2, 0x00100000                        # 1411: 21d2ff
            l32i         a0, a13, 12 /* [sdk_chip6_sleep_params] */ # 1414: 083d
            movi         a4, sdk_loop_pwctrl_pwdet_error_accum_high_power # 1416: 41d0ff
            movi         a5, sdk_loop_pwctrl_correct_atten_high_power # 1419: 51ceff
            movi         a6, .Label005                         # 141c: 61cdff
            movi         a3, 0 /* 0x00000000 */                # 141f: 0c03
            s8i          a3, a13, 133 /* 0x00 -> [.Ldata018] */ # 1421: 324d85
            s8i          a3, a13, 132 /* 0x00 -> [.Ldata017] */ # 1424: 324d84
            s16i         a3, a6, 130 /* 0x0000 -> [.Ldata021] */ # 1427: 325641
            s8i          a3, a6, 128 /* 0x00 -> [.Ldata020] */ # 142a: 324680
            s8i          a3, a5, 0 /* 0x00 -> [sdk_loop_pwctrl_correct_atten_high_power] */ # 142d: 324500
            s16i         a3, a4, 0 /* 0x0000 -> [sdk_loop_pwctrl_pwdet_error_accum_high_power] */ # 1430: 325400
            or           a0, a0, a2                            # 1433: 200020
            s32i         a0, a13, 12 /* a0 -> [sdk_chip6_sleep_params] */ # 1436: 093d
            j            .Lbr122                               # 1438: 060700
.Lbr121:    mov          a3, sp /* (FP)-0x30 */                # 143b: 3d01
            movi         a4, 0 /* 0x00000000 */                # 143d: 0c04
            l16ui        a2, a13, 130 /* [.Ldata016] */        # 143f: 221d41
            s16i         a2, a12, 2 /* [.Ldata016] -> [sdk_tx_rf_ana_gain] */ # 1442: 225c01
            call0        sdk_set_txdc_pbus                     # 1445: 01c8ffc0
                                                               # 1449: 0000
            l16ui        a2, a12, 2 /* [sdk_tx_rf_ana_gain] */ # 144b: 221c01
            mov          a3, sp /* (FP)-0x30 */                # 144e: 3d01
            call0        sdk_set_rfanagain_dc_reg              # 1450: 01c7ffc0
                                                               # 1454: 0000
            l32i         a0, a13, 12 /* [sdk_chip6_sleep_params] */ # 1456: 083d
.Lbr122:    bbsi         a0, 27, .Lbr123                       # 1458: b7f007
            l8ui         a2, a13, 90 /* [.Ldata003] */         # 145b: 220d5a
            addi         a3, sp, 8 /* (FP)-0x28 */             # 145e: 8b31
            call0        sdk_tx_atten_set_interp               # 1460: 050000
.Lbr123:    l32i         a12, sp, 20 /* [(local2)] */          # 1463: c851
            l32i         a13, sp, 24 /* [(local3)] */          # 1465: d861
            l32i         a14, sp, 28 /* [(local4)] */          # 1467: e871
            l32i         a15, sp, 32 /* [(local5)] */          # 1469: f881
            l32i         a0, sp, 16 /* [(local1)] */           # 146b: 0841
            addi         sp, sp, 48 /* (top of frame) */       # 146d: 12c130
            ret                                                # 1470: 0df0

            .literal_position                                  # 1474: 009a0060

# Function @ .irom0.text+0x1478
            .global      sdk_ram_get_noisefloor
            .type        sdk_ram_get_noisefloor, @function
sdk_ram_get_noisefloor:
            movi         a2, 0x60009a00                        # 1478: 21ffff
            memw                                               # 147b: c02000
            l32i         a2, a2, 0x164 /* [0x60009b64] */      # 147e: 222259
            extui        a2, a2, 20, 12                        # 1481: 2024b5
            addi         a2, a2, 1                             # 1484: 1b22
            srli         a2, a2, 1                             # 1486: 202141
            addmi        a2, a2, -2048                         # 1489: 22d2f8
            slli         a2, a2, 16                            # 148c: 002211
            srai         a2, a2, 16                            # 148f: 202031
            ret                                                # 1492: 0df0

            .literal_position                                  # 1494: 00000000

# Function @ .irom0.text+0x1498
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_get_noisefloor_sat
            .type        sdk_get_noisefloor_sat, @function
sdk_get_noisefloor_sat:
            addi         sp, sp, -16 /* (local0) */            # 1498: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 149b: 0901
            movi         a0, sdk_g_phyFuns                     # 149d: 01fdff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 14a0: 0800
            l32i         a0, a0, 40 /* [[sdk_g_phyFuns]+0x28] */ # 14a2: 08a0
            callx0       a0 /* [[sdk_g_phyFuns]+0x28] */       # 14a4: c00000
            movi         a5, -340 /* 0xfffffeac */             # 14a7: 52aeac
            movi         a0, -392 /* 0xfffffe78 */             # 14aa: 02ae78
            blt          a2, a0, .Lbr124                       # 14ad: 072201
            mov          a0, a2                                # 14b0: 0d02
.Lbr124:    mov          a2, a5 /* 0xfffffeac */               # 14b2: 2d05
            blt          a5, a0, .Lbr125                       # 14b4: 072501
            mov          a2, a0                                # 14b7: 2d00
.Lbr125:    l32i         a0, sp, 0 /* [(local0)] */            # 14b9: 0801
            slli         a2, a2, 16                            # 14bb: 002211
            srai         a2, a2, 16                            # 14be: 202031
            addi         sp, sp, 16 /* (top of frame) */       # 14c1: 12c110
            ret                                                # 14c4: 0df0

            .literal_position                                  # 14c8: 009a0060
                                                               # 14cc: fd7ffdff

# Function @ .irom0.text+0x14d0
            .global      sdk_ram_set_noise_floor
            .type        sdk_ram_set_noise_floor, @function
sdk_ram_set_noise_floor:
            movi         a10, -3 /* 0xfffffffd */              # 14d0: 7cda
            movi         a4, 0x60009a00                        # 14d2: 41fdff
            memw                                               # 14d5: c02000
            l32i         a9, a4, 0x160 /* [0x60009b60] */      # 14d8: 922458
            and          a9, a9, a10                           # 14db: a09910
            memw                                               # 14de: c02000
            s32i         a9, a4, 0x160 /* a9 -> [0x60009b60] */ # 14e1: 926458
            addi         a10, a2, 1 /* arg0+0x1 */             # 14e4: 1ba2
            addi         a8, a2, 2 /* arg0+0x2 */              # 14e6: 2b82
            movgez       a8, a10, a10                          # 14e8: a08ab3
            srai         a8, a8, 1                             # 14eb: 808121
            movi         a9, -512 /* 0xfffffe00 */             # 14ee: 92ae00
            addmi        a8, a8, 512                           # 14f1: 82d802
            extui        a8, a8, 0, 9                          # 14f4: 808084
            memw                                               # 14f7: c02000
            l32i         a7, a4, 0x164 /* [0x60009b64] */      # 14fa: 722459
            and          a7, a7, a9                            # 14fd: 907710
            or           a7, a7, a8                            # 1500: 807720
            memw                                               # 1503: c02000
            s32i         a7, a4, 0x164 /* a7 -> [0x60009b64] */ # 1506: 726459
            movi         a6, 0xfffd7ffd                        # 1509: 61f0ff
            movi         a5, 2 /* 0x00000002 */                # 150c: 0c25
            memw                                               # 150e: c02000
            l32i         a3, a4, 0x160 /* [0x60009b60] */      # 1511: 322458
            and          a3, a3, a6                            # 1514: 603310
            or           a3, a3, a5                            # 1517: 503320
            memw                                               # 151a: c02000
            s32i         a3, a4, 0x160 /* a3 -> [0x60009b60] */ # 151d: 326458
            ret           /* arg0 */                           # 1520: 0df0

            .literal_position                                  # 1524: 009a0060
                                                               # 1528: 00f0ffff
                                                               # 152c: 02800200

# Function @ .irom0.text+0x1530
            .global      sdk_ram_start_noisefloor
            .type        sdk_ram_start_noisefloor, @function
sdk_ram_start_noisefloor:
            movi         a7, 0x60009a00                        # 1530: 71fdff
            memw                                               # 1533: c02000
            l32i         a3, a7, 0x160 /* [0x60009b60] */      # 1536: 322758
            movi         a8, 416 /* 0x000001a0 */              # 1539: 82a1a0
            bbsi         a3, 1, .Lbr126                        # 153c: 17e32f
            extui        a9, a2, 0, 3                          # 153f: 209024
            movi         a10, 0xfffff000                       # 1542: a1f9ff
            slli         a9, a9, 9                             # 1545: 709911
            memw                                               # 1548: c02000
            l32i         a6, a7, 0x164 /* [0x60009b64] */      # 154b: 622759
            and          a6, a6, a10                           # 154e: a06610
            or           a6, a6, a9                            # 1551: 906620
            or           a6, a6, a8                            # 1554: 806620
            memw                                               # 1557: c02000
            s32i         a6, a7, 0x164 /* a6 -> [0x60009b64] */ # 155a: 626759
            movi         a5, 0x00028002                        # 155d: 51f3ff
            memw                                               # 1560: c02000
            l32i         a4, a7, 0x160 /* [0x60009b60] */      # 1563: 422758
            or           a4, a4, a5                            # 1566: 504420
            memw                                               # 1569: c02000
            s32i         a4, a7, 0x160 /* a4 -> [0x60009b60] */ # 156c: 426758
.Lbr126:    ret           /* arg0 */                           # 156f: 0df0

            .literal_position                                  # 1574: 01f0ffff
                                                               # 1578: 00960060

# Function @ .irom0.text+0x157c
            .global      sdk_read_hw_noisefloor
            .type        sdk_read_hw_noisefloor, @function
sdk_read_hw_noisefloor:
            movi         a3, 0xfffff001                        # 157c: 31feff
            movi         a2, 0x60009600                        # 157f: 21feff
            memw                                               # 1582: c02000
            l32i         a2, a2, 0x224 /* [0x60009824] */      # 1585: 222289
            extui        a2, a2, 0, 12                         # 1588: 2020b4
            add          a2, a2, a3                            # 158b: 3a22
            srli         a2, a2, 1                             # 158d: 202141
            slli         a2, a2, 16                            # 1590: 002211
            srai         a2, a2, 16                            # 1593: 202031
            ret                                                # 1596: 0df0

            .literal_position                                  # 1598: fff1ffff
                                                               # 159c: 00000000
                                                               # 15a0: 00000000
                                                               # 15a4: 009a0060
                                                               # 15a8: 88030000
                                                               # 15ac: 7c000000
                                                               # 15b0: 00000000
                                                               # 15b4: 88030000
                                                               # 15b8: d8010000
                                                               # 15bc: 00000000
                                                               # 15c0: 00000000
                                                               # 15c4: 88030000

# Function @ .irom0.text+0x15c8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .global      sdk_noise_check_loop
            .type        sdk_noise_check_loop, @function
sdk_noise_check_loop:
            movi         a7, 0x60009a00                        # 15c8: 71f7ff
            movi         a6, 512 /* 0x00000200 */              # 15cb: 62a200
            movi         a8, 0xfffff1ff                        # 15ce: 81f2ff
            addi         sp, sp, -16 /* (local0) */            # 15d1: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 15d4: d921
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 15d6: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 15d8: c911
            movi         a12, sdk_rxiq_compute_num             # 15da: c1f1ff
            movi         a0, sdk_g_phyFuns                     # 15dd: 01efff
            mov          a13, a2 /* arg0 */                    # 15e0: dd02
            memw                                               # 15e2: c02000
            l32i         a5, a7, 0x164 /* [0x60009b64] */      # 15e5: 522759
            and          a5, a5, a8                            # 15e8: 805510
            or           a5, a5, a6                            # 15eb: 605520
            memw                                               # 15ee: c02000
            s32i         a5, a7, 0x164 /* a5 -> [0x60009b64] */ # 15f1: 526759
            movi         a5, 5 /* 0x00000005 */                # 15f4: 0c55
            memw                                               # 15f6: c02000
            l32i         a4, a7, 0x160 /* [0x60009b60] */      # 15f9: 422758
            movi         a6, .Ldata098                         # 15fc: 61ebff
            srli         a4, a4, 15                            # 15ff: 404f41
            and          a4, a4, a5                            # 1602: 504410
            beqi         a4, 5, .Lbr127                        # 1605: 26540a
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1608: 0800
            l32i         a0, a0, 100 /* [[sdk_g_phyFuns]+0x64] */ # 160a: 022019
            callx0       a0 /* [[sdk_g_phyFuns]+0x64] */       # 160d: c00000
            j            .Lbr129                               # 1610: c60400
.Lbr127:    l16ui        a2, a6, 0 /* [.Ldata098] */           # 1613: 221600
            memw                                               # 1616: c02000
            l32i         a4, a7, 0x160 /* [0x60009b60] */      # 1619: 422758
            bbci         a4, 1, .Lbr130                        # 161c: 17641d
            bgeui        a2, 10, .Lbr131                       # 161f: f6921f
            addi         a0, a2, 1 /* [.Ldata098]+0x1 */       # 1622: 1b02
.Lbr128:    s16i         a0, a6, 0 /* a0 -> [.Ldata098] */     # 1624: 025600
.Lbr129:    movi         a2, .Label003                         # 1627: 21e1ff
            l32i         a4, a12, 0x1dc /* [.Ldata022] */      # 162a: 422c77
            addi         a3, a2, 9 /* .Ldata018 */             # 162d: 9b32
            call0        sdk_rtc_mem_backup                    # 162f: 050000
            l32i         a12, sp, 4 /* [(local1)] */           # 1632: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 1634: d821
            l32i         a0, sp, 0 /* [(local0)] */            # 1636: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1638: 12c110
            ret                                                # 163b: 0df0
.Lbr130:    s32i         a3, sp, 12 /* arg1 -> [(local3)] */   # 163d: 3931
            bltui        a2, 10, .Lbr132                       # 163f: b69205
.Lbr131:    movi         a2, -336 /* 0xfffffeb0 */             # 1642: 22aeb0
            j            .Lbr133                               # 1645: 860300
.Lbr132:    movi         a0, sdk_g_phyFuns                     # 1648: 01daff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 164b: 0800
            l32i         a0, a0, 40 /* [[sdk_g_phyFuns]+0x28] */ # 164d: 08a0
            callx0       a0 /* [[sdk_g_phyFuns]+0x28] */       # 164f: c00000
            l32i         a3, sp, 12 /* [(local3)] */           # 1652: 3831
            movi         a6, .Ldata098                         # 1654: 61d8ff
.Lbr133:    movi         a4, -404 /* 0xfffffe6c */             # 1657: 42ae6c
            bge          a4, a2, .Lbr141                       # 165a: 27a472
            l16ui        a5, a6, 0 /* [.Ldata098] */           # 165d: 521600
            movi         a7, -340 /* 0xfffffeac */             # 1660: 72aeac
            bgeui        a5, 10, .Lbr136                       # 1663: f69514
            movi         a0, -392 /* 0xfffffe78 */             # 1666: 02ae78
            blt          a2, a0, .Lbr134                       # 1669: 072201
            mov          a0, a2                                # 166c: 0d02
.Lbr134:    mov          a2, a7 /* 0xfffffeac */               # 166e: 2d07
            blt          a7, a0, .Lbr135                       # 1670: 072701
            mov          a2, a0                                # 1673: 2d00
.Lbr135:    slli         a2, a2, 16                            # 1675: 002211
            srai         a2, a2, 16                            # 1678: 202031
.Lbr136:    l16si        a0, a12, 128 /* [.Ldata015] */        # 167b: 029c40
            bge          a0, a2, .Lbr144                       # 167e: 27a06d
            addx2        a0, a0, a0                            # 1681: 000090
            add          a0, a2, a0                            # 1684: 0a02
            addi         a4, a0, -2                            # 1686: 42c0fe
            addi         a0, a0, 1                             # 1689: 1b00
            movgez       a0, a4, a4                            # 168b: 4004b3
            srai         a0, a0, 2                             # 168e: 000221
.Lbr137:    slli         a0, a0, 16                            # 1691: 000011
            srai         a0, a0, 16                            # 1694: 000031
            s16i         a0, a12, 128 /* a0 -> [.Ldata015] */  # 1697: 025c40
.Lbr138:    movi         a2, .Ldata021                         # 169a: 21c7ff
            l8ui         a2, a2, 128 /* [sdk_sw_scan_mode] */  # 169d: 220280
            beqz         a2, .Lbr145                           # 16a0: 16a205
            movi         a2, -388 /* 0xfffffe7c */             # 16a3: 22ae7c
            bge          a2, a0, .Lbr142                       # 16a6: 07a23b
            add          a4, a0, a2                            # 16a9: 2a40
            addi         a2, a4, 1                             # 16ab: 1b24
            movgez       a2, a4, a4                            # 16ad: 4024b3
            srai         a2, a2, 1                             # 16b0: 202121
            slli         a2, a2, 16                            # 16b3: 002211
            srai         a2, a2, 16                            # 16b6: 202031
            s16i         a2, a12, 88 /* a2 -> [.Ldata002] */   # 16b9: 225c2c
            j            .Lbr143                               # 16bc: 860a00
.Lbr139:    movi         a0, 0 /* 0x00000000 */                # 16bf: 0c00
.Lbr140:    beqz         a3, .Lbr141                           # 16c1: 8cb3
            beqz         a0, .Lbr141                           # 16c3: 8c90
            movi         a0, sdk_g_phyFuns                     # 16c5: 01bdff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 16c8: 0800
            l32i         a0, a0, 88 /* [[sdk_g_phyFuns]+0x58] */ # 16ca: 022016
            callx0       a0 /* [[sdk_g_phyFuns]+0x58] */       # 16cd: c00000
.Lbr141:    movi         a0, sdk_g_phyFuns                     # 16d0: 01bcff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 16d3: 0800
            l32i         a0, a0, 100 /* [[sdk_g_phyFuns]+0x64] */ # 16d5: 022019
            mov          a2, a13 /* arg0 */                    # 16d8: 2d0d
            callx0       a0 /* [[sdk_g_phyFuns]+0x64] */       # 16da: c00000
            movi         a6, .Ldata098                         # 16dd: 61b9ff
            movi         a0, 0 /* 0x00000000 */                # 16e0: 0c00
            j            .Lbr128                               # 16e2: 86cfff
.Lbr142:    mov          a2, a0                                # 16e5: 2d00
            s16i         a0, a12, 88 /* a0 -> [.Ldata002] */   # 16e7: 025c2c
.Lbr143:    movi         a0, 1 /* 0x00000001 */                # 16ea: 0c10
            j            .Lbr140                               # 16ec: 46f4ff
.Lbr144:    bge          a2, a0, .Lbr138                       # 16ef: 07a2a7
            addi         a4, a0, -16 /* [.Ldata015]-0x10 */    # 16f2: 42c0f0
            bge          a2, a4, .Lbr147                       # 16f5: 47a21b
            addi         a0, a0, -12 /* [.Ldata015]-0xc */     # 16f8: 02c0f4
            j            .Lbr137                               # 16fb: 86e4ff
.Lbr145:    l16si        a2, a12, 88 /* [.Ldata002] */         # 16fe: 229c2c
            addi         a5, a2, 8 /* [.Ldata002]+0x8 */       # 1701: 8b52
            blt          a5, a0, .Lbr146                       # 1703: 072505
            addi         a7, a2, -8 /* [.Ldata002]-0x8 */      # 1706: 72c2f8
            bge          a0, a7, .Lbr139                       # 1709: 77a0b2
.Lbr146:    mov          a2, a0                                # 170c: 2d00
            s16i         a0, a12, 88 /* a0 -> [.Ldata002] */   # 170e: 025c2c
            j            .Lbr143                               # 1711: 46f5ff
.Lbr147:    addx2        a4, a2, a2                            # 1714: 204290
            add          a0, a0, a4                            # 1717: 4a00
            addi         a4, a0, -2                            # 1719: 42c0fe
            addi         a0, a0, 1                             # 171c: 1b00
            movgez       a0, a4, a4                            # 171e: 4004b3
            srai         a0, a0, 2                             # 1721: 000221
            j            .Lbr137                               # 1724: 46daff

            .literal_position                                  # 1728: 00000000
                                                               # 172c: 00000000
                                                               # 1730: 009a0060
                                                               # 1734: 78020000
                                                               # 1738: 009a0060
                                                               # 173c: ffffffbf
                                                               # 1740: 000af23f
                                                               # 1744: 009a0060
                                                               # 1748: 78020000
                                                               # 174c: 009a0060
                                                               # 1750: 000af23f
                                                               # 1754: 009a0060
                                                               # 1758: 78020000
                                                               # 175c: 00000000
                                                               # 1760: 00000000
                                                               # 1764: 00000000
                                                               # 1768: 00000000
                                                               # 176c: 00002000
                                                               # 1770: 009a0060
                                                               # 1774: 00000000

# Function @ .irom0.text+0x1778
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word      @ -0x3c
#     (local2):  word      @ -0x38
#     (local3):  word      @ -0x34
#     (local4):  word      @ -0x30
#     (local5):  word      @ -0x2c
#     (local6):  word      @ -0x28
#     (local7):  word      @ -0x24
#     (local8):  word      @ -0x20
#     (local9):  word      @ -0x1c
#     (local10): word      @ -0x18
#     (local11): word      @ -0x14
#     (local12): word      @ -0x10
#     (local13): word[3]   @ -0xc
            .global      sdk_noise_init
            .type        sdk_noise_init, @function
sdk_noise_init:
            mov          a8, a2 /* arg0 */                     # 1778: 8d02
            movi         a9, sdk_g_phyFuns                     # 177a: 91ecff
            addi         sp, sp, -64 /* (local0) */            # 177d: 12c1c0
            s32i         a0, sp, 20 /* a0 -> [(local5)] */     # 1780: 0951
            s32i         a12, sp, 24 /* a12 -> [(local6)] */   # 1782: c961
            s32i         a14, sp, 32 /* a14 -> [(local8)] */   # 1784: e981
            s32i         a15, sp, 36 /* a15 -> [(local9)] */   # 1786: f991
            s32i         a13, sp, 28 /* a13 -> [(local7)] */   # 1788: d971
            movi         a15, -1024 /* 0xfffffc00 */           # 178a: f2ac00
            movi         a13, sdk_rxiq_compute_num             # 178d: d1e6ff
            mov          a14, a3 /* arg1 */                    # 1790: ed03
            movi         a12, 201 /* 0x000000c9 */             # 1792: c2a0c9
            mov          a3, a4 /* arg2 */                     # 1795: 3d04
            l32i         a4, sp, 64 /* [(local14)] */          # 1797: 422110
            l32i         a9, a9, 0 /* [sdk_g_phyFuns] */       # 179a: 9809
            l32i         a0, a4, 0 /* [[(local14)]] */         # 179c: 0804
            l32i         a9, a9, 88 /* [[sdk_g_phyFuns]+0x58] */ # 179e: 922916
            extui        a0, a0, 21, 1                         # 17a1: 000505
            bnez         a0, .Lbr158                           # 17a4: 562019
            movi         a2, -388 /* 0xfffffe7c */             # 17a7: 22ae7c
            s32i         a6, sp, 4 /* arg4 -> [(local1)] */    # 17aa: 6911
            s32i         a4, sp, 0 /* [(local14)] -> [(local0)] */ # 17ac: 4901
            s32i         a8, sp, 52 /* arg0 -> [(local13)] */  # 17ae: 89d1
            s32i         a3, sp, 48 /* arg2 -> [(local12)] */  # 17b0: 39c1
            s32i         a5, sp, 44 /* arg3 -> [(local11)] */  # 17b2: 59b1
            callx0       a9 /* [[sdk_g_phyFuns]+0x58] */       # 17b4: c00900
            movi         a9, -388 /* 0xfffffe7c */             # 17b7: 92ae7c
            memw                                               # 17ba: c02000
            movi         a10, 0x60009a00                       # 17bd: a1dcff
            l32i         a3, a10, 52 /* [0x60009a34] */        # 17c0: 38da
            and          a3, a3, a15                           # 17c2: f03310
            or           a3, a3, a12                           # 17c5: c03320
            memw                                               # 17c8: c02000
            s32i         a3, a10, 52 /* a3 -> [0x60009a34] */  # 17cb: 39da
            memw                                               # 17cd: c02000
            l32i         a0, a10, 52 /* [0x60009a34] */        # 17d0: 08da
            movi         a2, -2 /* 0xfffffffe */               # 17d2: 7ce2
            and          a0, a0, a2                            # 17d4: 200010
            memw                                               # 17d7: c02000
            s32i         a0, a10, 52 /* a0 -> [0x60009a34] */  # 17da: 09da
            memw                                               # 17dc: c02000
            movi         a0, sdk_noise_array                   # 17df: 01d5ff
            movi         a8, -340 /* 0xfffffeac */             # 17e2: 82aeac
            l32i         a10, a10, 0x160 /* [0x60009b60] */    # 17e5: a22a58
            movi         a11, 0 /* 0x00000000 */               # 17e8: 0c0b
            s32i         a11, sp, 40 /* 0x00000000 -> [(local10)] */ # 17ea: b9a1
            s16i         a9, a13, 88 /* 0xfe7c -> [.Ldata002] */ # 17ec: 925d2c
.Lbr148:    l32i         a4, sp, 40 /* [(local10)] */          # 17ef: 48a1
            addi         a5, a4, 1 /* [(local10)]+0x1 */       # 17f1: 1b54
            addx2        a6, a4, a0                            # 17f3: 006490
            s16i         a8, a6, 0                             # 17f6: 825600
            extui        a4, a5, 0, 8                          # 17f9: 504074
            s32i         a4, sp, 40 /* a4 -> [(local10)] */    # 17fc: 49a1
            bnei         a4, 4, .Lbr148                        # 17fe: 6644ed
            memw                                               # 1801: c02000
            movi         a9, 0x60009a00                        # 1804: 91cdff
            l32i         a3, a9, 44 /* [0x60009a2c] */         # 1807: 38b9
            s32i         a3, sp, 8 /* [0x60009a2c] -> [(local2)] */ # 1809: 3921
            memw                                               # 180b: c02000
            l32i         a2, a9, 0x320 /* [0x60009d20] */      # 180e: 2229c8
            s32i         a2, sp, 12 /* [0x60009d20] -> [(local3)] */ # 1811: 2931
            memw                                               # 1813: c02000
            l32i         a15, a9, 0x340 /* [0x60009d40] */     # 1816: f229d0
            s32i         a15, sp, 16 /* [0x60009d40] -> [(local4)] */ # 1819: f941
            memw                                               # 181b: c02000
            l32i         a11, a9, 44 /* [0x60009a2c] */        # 181e: b8b9
            movi         a12, -2 /* 0xfffffffe */              # 1820: 7cec
            and          a11, a11, a12                         # 1822: c0bb10
            memw                                               # 1825: c02000
            s32i         a11, a9, 44 /* a11 -> [0x60009a2c] */ # 1828: b9b9
            movi         a10, 0xbfffffff                       # 182a: a1c4ff
            memw                                               # 182d: c02000
            l32i         a8, a9, 0x320 /* [0x60009d20] */      # 1830: 8229c8
            and          a8, a8, a10                           # 1833: a08810
            memw                                               # 1836: c02000
            s32i         a8, a9, 0x320 /* a8 -> [0x60009d20] */ # 1839: 8269c8
            movi         a12, 0x3ff20a00                       # 183c: c1c1ff
            movi         a7, 0 /* 0x00000000 */                # 183f: 0c07
            s32i         a7, sp, 40 /* 0x00000000 -> [(local10)] */ # 1841: 79a1
.Lbr149:    memw                                               # 1843: c02000
            l32i         a15, a12, 0x200 /* [0x3ff20c00] */    # 1846: f22c80
            l32i         a4, sp, 40 /* [(local10)] */          # 1849: 48a1
            movi         a2, 14 /* 0x0000000e */               # 184b: 0ce2
            addx4        a3, a4, a4                            # 184d: 4034a0
            addi         a4, a4, -3 /* [(local10)]-0x3 */      # 1850: 42c4fd
            addi         a3, a3, 1                             # 1853: 1b33
            movnez       a2, a3, a4                            # 1855: 402393
            slli         a2, a2, 24                            # 1858: 802201
            srai         a2, a2, 24                            # 185b: 202831
            call0        sdk_chip_v6_set_chan                  # 185e: 01c5ffc0
                                                               # 1862: 0000
            memw                                               # 1864: c02000
            movi         a0, 0x60009a00                        # 1867: 01b7ff
            l32i         a13, sp, 40 /* [(local10)] */         # 186a: d8a1
            l32i         a4, a0, 0x160 /* [0x60009b60] */      # 186c: 422058
            beqz         a14, .Lbr153                          # 186f: acde
            movi         a0, sdk_noise_array                   # 1871: 01b5ff
            movi         a12, 0 /* 0x00000000 */               # 1874: 0c0c
            addx2        a13, a13, a0                          # 1876: 00dd90
.Lbr150:    mov          a4, a15 /* [0x3ff20c00] */            # 1879: 4d0f
            l32i         a2, sp, 52 /* [(local13)] */          # 187b: 28d1
            l32i         a3, sp, 48 /* [(local12)] */          # 187d: 38c1
            l32i         a5, sp, 44 /* [(local11)] */          # 187f: 58b1
            call0        sdk_do_noisefloor                     # 1881: 050000
            bnez         a2, .Lbr152                           # 1884: dc22
            call0        sdk_get_noisefloor_sat                # 1886: 050000
            l16si        a4, a13, 0                            # 1889: 429d00
            addi         a12, a12, 1                           # 188c: 1bcc
            bge          a2, a4, .Lbr151                       # 188e: 47a202
            s16i         a2, a13, 0                            # 1891: 225d00
.Lbr151:    extui        a12, a12, 0, 8                        # 1894: c0c074
            bne          a14, a12, .Lbr150                     # 1897: c79ede
.Lbr152:    movi         a0, 0x60009a00                        # 189a: 01acff
            movi         a12, 0x3ff20a00                       # 189d: c1acff
.Lbr153:    memw                                               # 18a0: c02000
            l32i         a2, a0, 52 /* [0x60009a34] */         # 18a3: 28d0
            movi         a3, -2 /* 0xfffffffe */               # 18a5: 7ce3
            and          a2, a2, a3                            # 18a7: 302210
            memw                                               # 18aa: c02000
            l32i         a13, sp, 40 /* [(local10)] */         # 18ad: d8a1
            s32i         a2, a0, 52 /* a2 -> [0x60009a34] */   # 18af: 29d0
            addi         a15, a13, 1 /* [(local10)]+0x1 */     # 18b1: 1bfd
            extui        a13, a15, 0, 8                        # 18b3: f0d074
            s32i         a13, sp, 40 /* a13 -> [(local10)] */  # 18b6: d9a1
            bnei         a13, 4, .Lbr149                       # 18b8: 664d87
            memw                                               # 18bb: c02000
            movi         a6, 0x60009a00                        # 18be: 61a5ff
            l32i         a8, sp, 8 /* [(local2)] */            # 18c1: 8821
            s32i         a8, a6, 44 /* [(local2)] -> [0x60009a2c] */ # 18c3: 89b6
            memw                                               # 18c5: c02000
            l32i         a7, sp, 12 /* [(local3)] */           # 18c8: 7831
            s32i         a7, a6, 0x320 /* [(local3)] -> [0x60009d20] */ # 18ca: 7266c8
            memw                                               # 18cd: c02000
            l32i         a5, sp, 16 /* [(local4)] */           # 18d0: 5841
            l32i         a4, sp, 4 /* [(local1)] */            # 18d2: 4811
            s32i         a5, a6, 0x340 /* [(local4)] -> [0x60009d40] */ # 18d4: 5266d0
            beqz         a4, .Lbr156                           # 18d7: bce4
            movi         a0, sdk_noise_array                   # 18d9: 019fff
            movi         a2, -40 /* 0xffffffd8 */              # 18dc: 22afd8
            movi         a9, 0 /* 0x00000000 */                # 18df: 0c09
            s32i         a9, sp, 40 /* 0x00000000 -> [(local10)] */ # 18e1: 99a1
            slli         a10, a2, 16                           # 18e3: 00a211
.Lbr154:    srai         a10, a10, 16                          # 18e6: a0a031
            l32i         a3, sp, 40 /* [(local10)] */          # 18e9: 38a1
            l32i         a4, sp, 40 /* [(local10)] */          # 18eb: 48a1
            addx2        a3, a3, a0                            # 18ed: 003390
            addi         a5, a4, 1 /* [(local10)]+0x1 */       # 18f0: 1b54
            extui        a4, a5, 0, 8                          # 18f2: 504074
            l16si        a3, a3, 0                             # 18f5: 329300
            s32i         a4, sp, 40 /* a4 -> [(local10)] */    # 18f8: 49a1
            bge          a3, a10, .Lbr155                      # 18fa: a7a301
            mov          a2, a3                                # 18fd: 2d03
.Lbr155:    slli         a10, a2, 16                           # 18ff: 00a211
            bnei         a4, 4, .Lbr154                        # 1902: 6644e0
            movi         a0, sdk_g_phyFuns                     # 1905: 0195ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1908: 0800
            movi         a3, sdk_rxiq_compute_num              # 190a: 3195ff
            l32i         a0, a0, 88 /* [[sdk_g_phyFuns]+0x58] */ # 190d: 022016
            s16i         a2, a3, 88 /* a2 -> [.Ldata002] */    # 1910: 22532c
            callx0       a0 /* [[sdk_g_phyFuns]+0x58] */       # 1913: c00000
            j            .Lbr157                               # 1916: 060200
.Lbr156:    movi         a3, sdk_rxiq_compute_num              # 1919: 3192ff
            movi         a2, -388 /* 0xfffffe7c */             # 191c: 22ae7c
            s16i         a2, a3, 88 /* 0xfe7c -> [.Ldata002] */ # 191f: 22532c
.Lbr157:    movi         a8, 0x00200000                        # 1922: 8192ff
            l32i         a7, sp, 0 /* [(local0)] */            # 1925: 7801
            movi         a5, sdk_rxiq_compute_num              # 1927: 5190ff
            l32i         a6, a7, 0 /* [[(local0)]] */          # 192a: 6807
            l16si        a4, a5, 88 /* [.Ldata002] */          # 192c: 42952c
            or           a6, a6, a8                            # 192f: 806620
            s32i         a6, a7, 0 /* a6 -> [[(local0)]] */    # 1932: 6907
            s16i         a4, a5, 128 /* [.Ldata002] -> [.Ldata015] */ # 1934: 425540
            j            .Lbr159                               # 1937: 460b00
.Lbr158:    l16si        a2, a13, 88 /* [.Ldata002] */         # 193a: 229d2c
            callx0       a9 /* [[sdk_g_phyFuns]+0x58] */       # 193d: c00900
            memw                                               # 1940: c02000
            movi         a9, 0x60009a00                        # 1943: 918bff
            l32i         a13, a9, 52 /* [0x60009a34] */        # 1946: d8d9
            and          a13, a13, a15                         # 1948: f0dd10
            or           a13, a13, a12                         # 194b: c0dd20
            memw                                               # 194e: c02000
            s32i         a13, a9, 52 /* a13 -> [0x60009a34] */ # 1951: d9d9
            memw                                               # 1953: c02000
            l32i         a10, a9, 52 /* [0x60009a34] */        # 1956: a8d9
            movi         a11, -2 /* 0xfffffffe */              # 1958: 7ceb
            and          a10, a10, a11                         # 195a: b0aa10
            memw                                               # 195d: c02000
            s32i         a10, a9, 52 /* a10 -> [0x60009a34] */ # 1960: a9d9
            memw                                               # 1962: c02000
            l32i         a9, a9, 0x160 /* [0x60009b60] */      # 1965: 922958
.Lbr159:    l32i         a12, sp, 24 /* [(local6)] */          # 1968: c861
            l32i         a13, sp, 28 /* [(local7)] */          # 196a: d871
            l32i         a14, sp, 32 /* [(local8)] */          # 196c: e881
            l32i         a15, sp, 36 /* [(local9)] */          # 196e: f891
            l32i         a0, sp, 20 /* [(local5)] */           # 1970: 0851
            addi         sp, sp, 64 /* (local14) */            # 1972: 12c140
            ret                                                # 1975: 0df0

            .literal_position                                  # 1978: 00000000
                                                               # 197c: 00000000
                                                               # 1980: 0e020000
                                                               # 1984: 00000000

# Function @ .irom0.text+0x1988
# Local variables/stack:
#     (local0):  word      @ -0x8
#     (local1):  word      @ -0x4
            .global      sdk_target_power_backoff
            .type        sdk_target_power_backoff, @function
sdk_target_power_backoff:
            addi         sp, sp, -16 /* (FP)-0x10 */           # 1988: 12c1f0
            s32i         a12, sp, 12 /* a12 -> [(local1)] */   # 198b: c931
            mov          a3, sp /* (FP)-0x10 */                # 198d: 3d01
            mov          a12, a2 /* arg0 */                    # 198f: cd02
            movi         a2, sdk_rxiq_compute_num              # 1991: 21f9ff
            s32i         a0, sp, 8 /* a0 -> [(local0)] */      # 1994: 0921
            l8ui         a2, a2, 90 /* [.Ldata003] */          # 1996: 22025a
            call0        sdk_tx_atten_set_interp               # 1999: 050000
            movi         a0, sdk_rxiq_compute_num              # 199c: 01f8ff
            movi         a2, 0 /* 0x00000000 */                # 199f: 0c02
            mov          a5, sp /* (FP)-0x10 */                # 19a1: 5d01
.Lbr160:    addi         a6, a2, 1                             # 19a3: 1b62
            add          a4, a2, a5                            # 19a5: 5a42
            l8ui         a3, a4, 0                             # 19a7: 320400
            extui        a2, a6, 0, 8                          # 19aa: 602074
            add          a3, a3, a12                           # 19ad: ca33
            s8i          a3, a4, 0                             # 19af: 324400
            bnei         a2, 6, .Lbr160                        # 19b2: 6662ed
            movi         a2, .Label020                         # 19b5: 21f2ff
            movi         a3, 13 /* 0x0000000d */               # 19b8: 0cd3
            mov          a4, sp /* (FP)-0x10 */                # 19ba: 4d01
            l8ui         a6, a0, 91 /* [.Ldata004] */          # 19bc: 62005b
            l8ui         a5, a0, 122 /* [.Ldata014] */         # 19bf: 52007a
            slli         a6, a6, 24                            # 19c2: 806601
            srai         a6, a6, 24                            # 19c5: 606831
            call0        sdk_ram_set_txbb_atten                # 19c8: 01efffc0
                                                               # 19cc: 0000
            l32i         a12, sp, 12 /* [(local1)] */          # 19ce: c831
            l32i         a0, sp, 8 /* [(local0)] */            # 19d0: 0821
            addi         sp, sp, 16 /* (top of frame) */       # 19d2: 12c110
            ret                                                # 19d5: 0df0

            .literal_position                                  # 19d8: cc000000
                                                               # 19dc: 009a0060
                                                               # 19e0: 00000000
                                                               # 19e4: 00000000
                                                               # 19e8: 00000000

# Function @ .irom0.text+0x19ec
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .global      sdk_sdt_on_noise_start
            .type        sdk_sdt_on_noise_start, @function
sdk_sdt_on_noise_start:
            mov          a7, a2 /* arg0 */                     # 19ec: 7d02
            addi         sp, sp, -32 /* (local0) */            # 19ee: 12c1e0
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    # 19f1: 3901
            movi         a2, .Label021                         # 19f3: 21f9ff
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 19f6: 0911
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 19f8: c921
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   # 19fa: d931
            mov          a12, a5 /* arg3 */                    # 19fc: cd05
            mov          a13, a4 /* arg2 */                    # 19fe: dd04
            s32i         a7, sp, 16 /* arg0 -> [(local4)] */   # 1a00: 7941
            call0        ets_printf                            # 1a02: 01f8ffc0
                                                               # 1a06: 0000
            l32i         a0, sp, 16 /* [(local4)] */           # 1a08: 0841
.Lbr161:    memw                                               # 1a0a: c02000
            l32i         a2, a13, 0 /* [arg2] */               # 1a0d: 280d
            bne          a2, a12, .Lbr161                      # 1a0f: c792f7
            mov          a2, a0 /* [(local4)] */               # 1a12: 2d00
            call0        sdk_ets_delay_us                      # 1a14: 01f5ffc0
                                                               # 1a18: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 1a1a: 0801
            movi         a4, 5 /* 0x00000005 */                # 1a1c: 0c54
            movi         a2, 0x60009a00                        # 1a1e: 21efff
            memw                                               # 1a21: c02000
            l32i         a3, a2, 0x160 /* [0x60009b60] */      # 1a24: 322258
            srli         a3, a3, 15                            # 1a27: 303f41
            and          a3, a3, a4                            # 1a2a: 403310
            bnei         a3, 5, .Lbr162                        # 1a2d: 665313
            movi         a5, -3 /* 0xfffffffd */               # 1a30: 7cd5
            memw                                               # 1a32: c02000
            l32i         a4, a2, 0x160 /* [0x60009b60] */      # 1a35: 422258
            and          a4, a4, a5                            # 1a38: 504410
            memw                                               # 1a3b: c02000
            s32i         a4, a2, 0x160 /* a4 -> [0x60009b60] */ # 1a3e: 426258
            j            .Lbr163                               # 1a41: 460100
.Lbr162:    memw                                               # 1a44: c02000
            l32i         a6, a2, 0x160 /* [0x60009b60] */      # 1a47: 622258
.Lbr163:    movi         a7, sdk_g_phyFuns                     # 1a4a: 71e5ff
            l32i         a7, a7, 0 /* [sdk_g_phyFuns] */       # 1a4d: 7807
            l32i         a7, a7, 100 /* [[sdk_g_phyFuns]+0x64] */ # 1a4f: 722719
            extui        a2, a0, 0, 8                          # 1a52: 002074
            callx0       a7 /* [[sdk_g_phyFuns]+0x64] */       # 1a55: c00700
            l32i         a12, sp, 8 /* [(local2)] */           # 1a58: c821
            l32i         a13, sp, 12 /* [(local3)] */          # 1a5a: d831
            l32i         a0, sp, 4 /* [(local1)] */            # 1a5c: 0811
            addi         sp, sp, 32 /* (top of frame) */       # 1a5e: 12c120
            ret                                                # 1a61: 0df0

            .literal_position                                  # 1a64: 00000000
                                                               # 1a68: 7a010000
                                                               # 1a6c: 7a010000
                                                               # 1a70: ff03fcff
                                                               # 1a74: 009a0060
                                                               # 1a78: 7a010000
                                                               # 1a7c: 00000000
                                                               # 1a80: 00000000
                                                               # 1a84: 00000000
                                                               # 1a88: 00000000
                                                               # 1a8c: 00000000
                                                               # 1a90: 00000000

# Function @ .irom0.text+0x1a94
# Local variables/stack:
#     (local0):  byte      @ -0x20
#     (local1):  byte      @ -0x1f
#     (local2):  byte[2]   @ -0x1e
#     (local3):  word      @ -0x1c
#     (local4):  word      @ -0x18
#     (local5):  word      @ -0x14
#     (local6):  word      @ -0x10
#     (local7):  word[3]   @ -0xc
            .global      sdk_chip_v6_set_chan_rx_cmp
            .type        sdk_chip_v6_set_chan_rx_cmp, @function
sdk_chip_v6_set_chan_rx_cmp:
            movi         a4, 0 /* 0x00000000 */                # 1a94: 0c04
            addi         sp, sp, -32 /* (local0) */            # 1a96: 12c1e0
            s32i         a14, sp, 20 /* a14 -> [(local7)] */   # 1a99: e951
            s32i         a13, sp, 16 /* a13 -> [(local6)] */   # 1a9b: d941
            s32i         a0, sp, 8 /* a0 -> [(local4)] */      # 1a9d: 0921
            s32i         a12, sp, 12 /* a12 -> [(local5)] */   # 1a9f: c931
            movi         a0, .Label008                         # 1aa1: 01f1ff
            mov          a12, a2 /* arg0 */                    # 1aa4: cd02
            mov          a13, a3 /* arg1 */                    # 1aa6: dd03
            movi         a2, 2 /* 0x00000002 */                # 1aa8: 0c22
            movi         a3, .Ldata100                         # 1aaa: 31eeff
            l8ui         a14, a0, 125 /* [.Ldata026] */        # 1aad: e2007d
            add          a4, a4, a3 /* .Ldata100 */            # 1ab0: 3a44
            slli         a14, a14, 24                          # 1ab2: 80ee01
            add          a2, a2, a3 /* .Ldata101 */            # 1ab5: 3a22
            l16ui        a4, a4, 0 /* [.Ldata100] */           # 1ab7: 421400
            s16i         a4, sp, 0 /* [.Ldata100] -> [(local0)] */ # 1aba: 425100
            l8ui         a2, a2, 0 /* [.Ldata101] */           # 1abd: 220200
            srai         a14, a14, 24                          # 1ac0: e0e831
            s8i          a2, sp, 2 /* [.Ldata101] -> [(local2)] */ # 1ac3: 224102
            movi         a2, 13 /* 0x0000000d */               # 1ac6: 0cd2
            bgei         a12, 7, .Lbr164                       # 1ac8: e67c23
            movi         a3, 5 /* 0x00000005 */                # 1acb: 0c53
            mov          a4, a0 /* .Label008 */                # 1acd: 4d00
            l8ui         a4, a4, 124 /* [.Ldata025] */         # 1acf: 42047c
            addi         a2, a12, -1 /* arg0-0x1 */            # 1ad2: 0b2c
            slli         a4, a4, 24                            # 1ad4: 804401
            srai         a4, a4, 24                            # 1ad7: 404831
            s32i         a4, sp, 4 /* a4 -> [(local3)] */      # 1ada: 4911
            sub          a4, a14, a4                           # 1adc: 404ec0
            mull         a2, a2, a4                            # 1adf: 402282
            call0        __divsi3                              # 1ae2: 01e6ffc0
                                                               # 1ae6: 0000
            l32i         a14, sp, 4 /* [(local3)] */           # 1ae8: e811
            add          a14, a14, a2                          # 1aea: 2aee
            j            .Lbr167                               # 1aec: 460800
.Lbr164:    l8ui         a3, a0, 126 /* [.Ldata027] */         # 1aef: 32007e
            slli         a3, a3, 24                            # 1af2: 803301
            srai         a3, a3, 24                            # 1af5: 303831
            sub          a3, a3, a14                           # 1af8: e033c0
            bge          a2, a12, .Lbr165                      # 1afb: c7a202
            j            .Lbr177                               # 1afe: 464200
.Lbr165:    addi         a2, a12, -6 /* arg0-0x6 */            # 1b01: 22ccfa
            mull         a2, a3, a2                            # 1b04: 202382
            movi         a3, 5 /* 0x00000005 */                # 1b07: 0c53
            call0        __divsi3                              # 1b09: 01ddffc0
                                                               # 1b0d: 0000
.Lbr166:    add          a14, a14, a2                          # 1b0f: 2aee
.Lbr167:    bnei         a13, 1, .Lbr168                       # 1b11: 661d0a
            movi         a13, -6 /* 0xfffffffa */              # 1b14: 7cad
            s8i          a13, sp, 0 /* 0xfa -> [(local0)] */   # 1b16: d24100
            s8i          a13, sp, 2 /* 0xfa -> [(local2)] */   # 1b19: d24102
            j            .Lbr171                               # 1b1c: c60800
.Lbr168:    addi         a3, a13, -2 /* arg1-0x2 */            # 1b1f: 32cdfe
            bnez         a3, .Lbr175                           # 1b22: 56930b
            movi         a0, .Label008                         # 1b25: 01d1ff
            l8ui         a3, a0, 127 /* [.Ldata028] */         # 1b28: 32007f
            s8i          a3, sp, 0 /* [.Ldata028] -> [(local0)] */ # 1b2b: 324100
            l8ui         a2, a0, 128 /* [.Ldata029] */         # 1b2e: 220080
            s8i          a2, sp, 1 /* [.Ldata029] -> [(local1)] */ # 1b31: 224101
            l8ui         a0, a0, 129 /* [.Ldata030] */         # 1b34: 020081
.Lbr169:    s8i          a0, sp, 2 /* a0 -> [(local2)] */      # 1b37: 024102
.Lbr170:    l8ui         a13, sp, 1 /* [(local1)] */           # 1b3a: d20101
            slli         a13, a13, 24                          # 1b3d: 80dd01
            srai         a13, a13, 24                          # 1b40: d0d831
.Lbr171:    bgei         a12, 7, .Lbr172                       # 1b43: e67c2c
            l8ui         a3, sp, 0 /* [(local0)] */            # 1b46: 320100
            addi         a2, a12, -1 /* arg0-0x1 */            # 1b49: 0b2c
            slli         a3, a3, 24                            # 1b4b: 803301
            srai         a3, a3, 24                            # 1b4e: 303831
            slli         a3, a3, 24                            # 1b51: 803301
            srai         a3, a3, 24                            # 1b54: 303831
            sub          a3, a13, a3                           # 1b57: 303dc0
            mull         a2, a2, a3                            # 1b5a: 302282
            movi         a3, 5 /* 0x00000005 */                # 1b5d: 0c53
            call0        __divsi3                              # 1b5f: 01c9ffc0
                                                               # 1b63: 0000
            l8ui         a0, sp, 0 /* [(local0)] */            # 1b65: 020100
            slli         a0, a0, 24                            # 1b68: 800001
            srai         a0, a0, 24                            # 1b6b: 000831
            add          a0, a0, a2                            # 1b6e: 2a00
            j            .Lbr174                               # 1b70: 060800
.Lbr172:    l8ui         a0, sp, 2 /* [(local2)] */            # 1b73: 020102
            movi         a2, 13 /* 0x0000000d */               # 1b76: 0cd2
            slli         a0, a0, 24                            # 1b78: 800001
            srai         a0, a0, 24                            # 1b7b: 000831
            sub          a0, a0, a13                           # 1b7e: d000c0
            blt          a2, a12, .Lbr176                      # 1b81: c72275
            movi         a3, 5 /* 0x00000005 */                # 1b84: 0c53
            addi         a2, a12, -6 /* arg0-0x6 */            # 1b86: 22ccfa
            mull         a2, a0, a2                            # 1b89: 202082
            call0        __divsi3                              # 1b8c: 01bfffc0
                                                               # 1b90: 0000
.Lbr173:    add          a0, a2, a13                           # 1b92: da02
.Lbr174:    movi         a10, 0xfffc03ff                       # 1b94: a1b7ff
            add          a9, a14, a0                           # 1b97: 0a9e
            movi         a4, 0x60009a00                        # 1b99: 41b6ff
            extui        a9, a9, 0, 8                          # 1b9c: 909074
            slli         a9, a9, 10                            # 1b9f: 609911
            memw                                               # 1ba2: c02000
            l32i         a8, a4, 0x368 /* [0x60009d68] */      # 1ba5: 8224da
            and          a8, a8, a10                           # 1ba8: a08810
            or           a8, a8, a9                            # 1bab: 908820
            memw                                               # 1bae: c02000
            s32i         a8, a4, 0x368 /* a8 -> [0x60009d68] */ # 1bb1: 8264da
            movi         a7, 1 /* 0x00000001 */                # 1bb4: 0c17
            memw                                               # 1bb6: c02000
            l32i         a6, a4, 52 /* [0x60009a34] */         # 1bb9: 68d4
            or           a6, a6, a7                            # 1bbb: 706620
            memw                                               # 1bbe: c02000
            s32i         a6, a4, 52 /* a6 -> [0x60009a34] */   # 1bc1: 69d4
            movi         a5, -2 /* 0xfffffffe */               # 1bc3: 7ce5
            memw                                               # 1bc5: c02000
            l32i         a3, a4, 52 /* [0x60009a34] */         # 1bc8: 38d4
            and          a3, a3, a5                            # 1bca: 503310
            memw                                               # 1bcd: c02000
            s32i         a3, a4, 52 /* a3 -> [0x60009a34] */   # 1bd0: 39d4
            l32i         a12, sp, 12 /* [(local5)] */          # 1bd2: c831
            l32i         a13, sp, 16 /* [(local6)] */          # 1bd4: d841
            l32i         a14, sp, 20 /* [(local7)] */          # 1bd6: e851
            l32i         a0, sp, 8 /* [(local4)] */            # 1bd8: 0821
            addi         sp, sp, 32 /* (top of frame) */       # 1bda: 12c120
            ret                                                # 1bdd: 0df0
.Lbr175:    addi         a10, a13, -3 /* arg1-0x3 */           # 1bdf: a2cdfd
            bnez         a10, .Lbr170                          # 1be2: 564af5
            movi         a0, .Label008                         # 1be5: 01a4ff
            l8ui         a3, a0, 130 /* [.Ldata031] */         # 1be8: 320082
            s8i          a3, sp, 0 /* [.Ldata031] -> [(local0)] */ # 1beb: 324100
            l8ui         a2, a0, 131 /* [.Ldata032] */         # 1bee: 220083
            s8i          a2, sp, 1 /* [.Ldata032] -> [(local1)] */ # 1bf1: 224101
            l8ui         a0, a0, 132 /* [.Ldata033] */         # 1bf4: 020084
            j            .Lbr169                               # 1bf7: 06cfff
.Lbr176:    movi         a3, 5 /* 0x00000005 */                # 1bfa: 0c53
            addi         a2, a12, -2 /* arg0-0x2 */            # 1bfc: 22ccfe
            mull         a2, a0, a2                            # 1bff: 202082
            call0        __divsi3                              # 1c02: 01a2ffc0
                                                               # 1c06: 0000
            j            .Lbr173                               # 1c08: 86e1ff
.Lbr177:    addi         a2, a12, -2 /* arg0-0x2 */            # 1c0b: 22ccfe
            mull         a2, a3, a2                            # 1c0e: 202382
            movi         a3, 5 /* 0x00000005 */                # 1c11: 0c53
            call0        __divsi3                              # 1c13: 019fffc0
                                                               # 1c17: 0000
            j            .Lbr166                               # 1c19: 86bcff

            .literal_position                                  # 1c1c: 00000000
                                                               # 1c20: 00000000
                                                               # 1c24: 000af23f
                                                               # 1c28: 00000000
                                                               # 1c2c: 00000000
                                                               # 1c30: 00000000
                                                               # 1c34: 00000000
                                                               # 1c38: 00000000
                                                               # 1c3c: 00000000

# Function @ .irom0.text+0x1c40
# Local variables/stack:
#     (local0):  word      @ -0x8
#     (local1):  word      @ -0x4
            .global      sdk_chip_v6_set_chan_misc
            .type        sdk_chip_v6_set_chan_misc, @function
sdk_chip_v6_set_chan_misc:
            addi         sp, sp, -16 /* (FP)-0x10 */           # 1c40: 12c1f0
            s32i         a0, sp, 12 /* a0 -> [(local1)] */     # 1c43: 0931
            movi         a0, sdk_rxiq_compute_num              # 1c45: 01f5ff
            l32i         a0, a0, 12 /* [sdk_chip6_sleep_params] */ # 1c48: 0830
            s32i         a2, sp, 8 /* arg0 -> [(local0)] */    # 1c4a: 2921
            bbci         a0, 18, .Lbr178                       # 1c4c: 277012
            movi         a3, sdk_rxiq_compute_num              # 1c4f: 31f4ff
            addx2        a2, a2, a2                            # 1c52: 202290
            addi         a3, a3, 41 /* .Label002 */            # 1c55: 32c329
            add          a2, a2, a3                            # 1c58: 3a22
            call0        sdk_set_txcap_reg                     # 1c5a: 01f5ffc0
                                                               # 1c5e: 0000
            l32i         a2, sp, 8 /* [(local0)] */            # 1c60: 2821
.Lbr178:    movi         a4, 0x3ff20a00                        # 1c62: 41f0ff
            memw                                               # 1c65: c02000
            l32i         a4, a4, 0x270 /* [0x3ff20c70] */      # 1c68: 42249c
            bbci         a4, 1, .Lbr179                        # 1c6b: 17642e
            extui        a2, a2, 0, 8                          # 1c6e: 202074
            mov          a3, sp /* (FP)-0x10 */                # 1c71: 3d01
            call0        sdk_tx_atten_set_interp               # 1c73: 050000
            call0        sdk_dpd_scale_set                     # 1c76: 01efffc0
                                                               # 1c7a: 0000
            movi         a2, 0 /* 0x00000000 */                # 1c7c: 0c02
            call0        sdk_chip_v6_rxmax_ext                 # 1c7e: 01eeffc0
                                                               # 1c82: 0000
            movi         a0, sdk_g_phyFuns                     # 1c84: 01e9ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1c87: 0800
            movi         a2, sdk_rxiq_compute_num              # 1c89: 21e8ff
            l32i         a0, a0, 88 /* [[sdk_g_phyFuns]+0x58] */ # 1c8c: 022016
            l16si        a2, a2, 88 /* [.Ldata002] */          # 1c8f: 22922c
            callx0       a0 /* [[sdk_g_phyFuns]+0x58] */       # 1c92: c00000
            movi         a2, 30 /* 0x0000001e */               # 1c95: 1ce2
            call0        sdk_ets_delay_us                      # 1c97: 01e9ffc0
                                                               # 1c9b: 0000
.Lbr179:    l32i         a0, sp, 12 /* [(local1)] */           # 1c9d: 0831
            addi         sp, sp, 16 /* (top of frame) */       # 1c9f: 12c110
            ret                                                # 1ca2: 0df0

            .literal_position                                  # 1ca4: 86010000
                                                               # 1ca8: 04000000
                                                               # 1cac: 04000000
                                                               # 1cb0: c05d0000
                                                               # 1cb4: 00000000
                                                               # 1cb8: c05d0000
                                                               # 1cbc: 00000000
                                                               # 1cc0: 04000000
                                                               # 1cc4: 04000000
                                                               # 1cc8: 00002440
                                                               # 1ccc: 99994940
                                                               # 1cd0: 9a999999
                                                               # 1cd4: 9999e940
                                                               # 1cd8: 9a999999
                                                               # 1cdc: 00960060
                                                               # 1ce0: ffff0f00
                                                               # 1ce4: 000000c0
                                                               # 1ce8: 00000000
                                                               # 1cec: 00000000
                                                               # 1cf0: 00000000
                                                               # 1cf4: 00000000
                                                               # 1cf8: 00000000
                                                               # 1cfc: 00000000
                                                               # 1d00: 00000000
                                                               # 1d04: 00000000
                                                               # 1d08: 00000000
                                                               # 1d0c: 00000000
                                                               # 1d10: 00000000
                                                               # 1d14: 00000000
                                                               # 1d18: 00000000
                                                               # 1d1c: 00000000
                                                               # 1d20: 00000000
                                                               # 1d24: 00000000
                                                               # 1d28: 00000000
                                                               # 1d2c: 00000000
                                                               # 1d30: 00000000
                                                               # 1d34: 00000000
                                                               # 1d38: 00000000
                                                               # 1d3c: 00000000
                                                               # 1d40: 00000000
                                                               # 1d44: 00000000
                                                               # 1d48: 00000000
                                                               # 1d4c: 00000000
                                                               # 1d50: 00000000
                                                               # 1d54: 00000000
                                                               # 1d58: 00000000
                                                               # 1d5c: 00000000
                                                               # 1d60: 00000000
                                                               # 1d64: 00000000
                                                               # 1d68: 00000000
                                                               # 1d6c: 00000000
                                                               # 1d70: 00000000
                                                               # 1d74: 00000000
                                                               # 1d78: 00000000
                                                               # 1d7c: 00000000
                                                               # 1d80: 00000000
                                                               # 1d84: 00000000
                                                               # 1d88: 00000000
                                                               # 1d8c: 00000000
                                                               # 1d90: 00000000
                                                               # 1d94: 00000000

# Function @ .irom0.text+0x1d98
# Local variables/stack:
#     (local0):  word      @ -0x50
#     (local1):  word      @ -0x4c
#     (local2):  word      @ -0x48
#     (local3):  word      @ -0x44
#     (local4):  word      @ -0x40
#     (local5):  word      @ -0x3c
#     (local6):  word      @ -0x38
#     (local7):  word      @ -0x34
#     (local8):  word      @ -0x30
#     (local9):  word      @ -0x2c
#     (local10): word      @ -0x28
#     (local11): word      @ -0x24
#     (local12): word      @ -0x20
#     (local13): word      @ -0x1c
#     (local14): word      @ -0x18
#     (local15): word      @ -0x14
#     (local16): word      @ -0x10
#     (local17): word      @ -0xc
#     (local18): word      @ -0x8
#     (local19): word      @ -0x4
            .global      sdk_phy_dig_spur_set
            .type        sdk_phy_dig_spur_set, @function
sdk_phy_dig_spur_set:
            addi         sp, sp, -80 /* (local0) */            # 1d98: 12c1b0
            s32i         a14, sp, 52 /* a14 -> [(local13)] */  # 1d9b: e9d1
            s32i         a15, sp, 56 /* a15 -> [(local14)] */  # 1d9d: f9e1
            s32i         a2, sp, 28 /* arg0 -> [(local7)] */   # 1d9f: 2971
            s32i         a13, sp, 48 /* a13 -> [(local12)] */  # 1da1: d9c1
            s32i         a12, sp, 44 /* a12 -> [(local11)] */  # 1da3: c9b1
            movi         a12, .Label009                        # 1da5: c1bfff
            s32i         a0, sp, 40 /* a0 -> [(local10)] */    # 1da8: 09a1
            l8ui         a0, a12, 95 /* [.Ldata023] */         # 1daa: 020c5f
            mov          a13, a3 /* arg1 */                    # 1dad: dd03
            bnez         a0, .Lbr180                           # 1daf: cc30
            movi         a14, 40 /* 0x00000028 */              # 1db1: 2c8e
            j            .Lbr182                               # 1db3: 460400
.Lbr180:    bnei         a0, 1, .Lbr181                        # 1db6: 661004
            movi         a14, 26 /* 0x0000001a */              # 1db9: 1cae
            j            .Lbr182                               # 1dbb: 460200
.Lbr181:    addi         a3, a0, -2 /* [.Ldata023]-0x2 */      # 1dbe: 32c0fe
            movi         a2, 24 /* 0x00000018 */               # 1dc1: 1c82
            movi         a14, 40 /* 0x00000028 */              # 1dc3: 2c8e
            moveqz       a14, a2, a3                           # 1dc5: 30e283
.Lbr182:    mov          a2, a13 /* arg1 */                    # 1dc8: 2d0d
            mov          a3, a14                               # 1dca: 3d0e
            call0        __modsi3                              # 1dcc: 01c7ffc0
                                                               # 1dd0: 0000
            bgei         a2, 10, .Lbr184                       # 1dd2: e6921a
            mov          a2, a13 /* arg1 */                    # 1dd5: 2d0d
            mov          a3, a14                               # 1dd7: 3d0e
            call0        __divsi3                              # 1dd9: 01c4ffc0
                                                               # 1ddd: 0000
            mull         a0, a14, a2                           # 1ddf: 200e82
            sub          a0, a0, a13                           # 1de2: d000c0
            addx4        a0, a0, a0                            # 1de5: 0000a0
.Lbr183:    slli         a2, a0, 1                             # 1de8: f02011
            s32i         a2, sp, 24 /* a2 -> [(local6)] */     # 1deb: 2961
            j            .Lbr186                               # 1ded: 460800
.Lbr184:    sub          a4, a14, a2                           # 1df0: 204ec0
            bgei         a4, 10, .Lbr185                       # 1df3: e69417
            mov          a2, a13 /* arg1 */                    # 1df6: 2d0d
            mov          a3, a14                               # 1df8: 3d0e
            call0        __divsi3                              # 1dfa: 01bdffc0
                                                               # 1dfe: 0000
            addi         a0, a2, 1                             # 1e00: 1b02
            mull         a0, a14, a0                           # 1e02: 000e82
            sub          a0, a0, a13                           # 1e05: d000c0
            addx4        a0, a0, a0                            # 1e08: 0000a0
            j            .Lbr183                               # 1e0b: 46f6ff
.Lbr185:    movi         a2, 0 /* 0x00000000 */                # 1e0e: 0c02
            s32i         a2, sp, 24 /* 0x00000000 -> [(local6)] */ # 1e10: 2961
.Lbr186:    l8ui         a3, a12, 123 /* [.Ldata035] */        # 1e12: 320c7b
            l8ui         a2, a12, 158 /* [.Ldata048] */        # 1e15: 220c9e
            beqz         a3, .Lbr189                           # 1e18: 164308
            s32i         a3, sp, 20 /* [.Ldata035] -> [(local5)] */ # 1e1b: 3951
            l8ui         a15, a12, 122 /* [.Ldata034] */       # 1e1d: f20c7a
            slli         a2, a2, 8                             # 1e20: 802211
            add          a15, a15, a2                          # 1e23: 2aff
            beqz         a15, .Lbr189                          # 1e25: 167f07
            mov          a2, a3 /* [.Ldata035] */              # 1e28: 2d03
            movi         a14, -10 /* 0xfffffff6 */             # 1e2a: 7c6e
            mull         a14, a14, a13                         # 1e2c: d0ee82
            mul16u       a2, a2, a13                           # 1e2f: d022c1
            addx4        a3, a3, a3                            # 1e32: 3033a0
            slli         a3, a3, 1                             # 1e35: f03311
            s32i         a2, sp, 64 /* a2 -> [(local16)] */    # 1e38: 226110
            s32i         a3, sp, 72 /* a3 -> [(local18)] */    # 1e3b: 326112
            mov          a3, a15                               # 1e3e: 3d0f
            call0        __modsi3                              # 1e40: 01adffc0
                                                               # 1e44: 0000
            l32i         a0, sp, 72 /* [(local18)] */          # 1e46: 022112
            l32i         a4, sp, 64 /* [(local16)] */          # 1e49: 422110
            blt          a2, a0, .Lbr187                       # 1e4c: 072202
            j            .Lbr199                               # 1e4f: c65400
.Lbr187:    mov          a2, a4 /* [(local16)] */              # 1e52: 2d04
            mov          a3, a15                               # 1e54: 3d0f
            call0        __divsi3                              # 1e56: 01a8ffc0
                                                               # 1e5a: 0000
            call0        __floatsisf                           # 1e5c: 01a8ffc0
                                                               # 1e60: 0000
            s32i         a2, sp, 8 /* a2 -> [(local2)] */      # 1e62: 2921
            mov          a2, a15                               # 1e64: 2d0f
            call0        __floatsisf                           # 1e66: 01a6ffc0
                                                               # 1e6a: 0000
            mov          a15, a2                               # 1e6c: fd02
            l32i         a2, sp, 20 /* [(local5)] */           # 1e6e: 2851
            call0        __floatunsisf                         # 1e70: 01a5ffc0
                                                               # 1e74: 0000
            mov          a3, a2                                # 1e76: 3d02
            mov          a2, a15                               # 1e78: 2d0f
            call0        __divsf3                              # 1e7a: 01a3ffc0
                                                               # 1e7e: 0000
            mov          a3, a2                                # 1e80: 3d02
            l32i         a2, sp, 8 /* [(local2)] */            # 1e82: 2821
            call0        __mulsf3                              # 1e84: 01a2ffc0
                                                               # 1e88: 0000
            movi         a15, .Ldata102                        # 1e8a: f187ff
            l32i         a3, a15, 0 /* [.Ldata102] */          # 1e8d: 380f
            call0        __mulsf3                              # 1e8f: 01a0ffc0
                                                               # 1e93: 0000
            call0        __fixsfsi                             # 1e95: 019fffc0
                                                               # 1e99: 0000
.Lbr188:    add          a15, a14, a2                          # 1e9b: 2afe
            j            .Lbr190                               # 1e9d: 860100
.Lbr189:    movi         a15, 0 /* 0x00000000 */               # 1ea0: 0c0f
            movi         a14, -10 /* 0xfffffff6 */             # 1ea2: 7c6e
            mull         a14, a14, a13                         # 1ea4: d0ee82
.Lbr190:    l8ui         a0, a12, 154 /* [.Ldata046] */        # 1ea7: 020c9a
            s32i         a15, sp, 76 /* a15 -> [(local19)] */  # 1eaa: f26113
            beqz         a0, .Lbr193                           # 1ead: 161008
            s32i         a0, sp, 16 /* [.Ldata046] -> [(local4)] */ # 1eb0: 0941
            l8ui         a2, a12, 159 /* [.Ldata049] */        # 1eb2: 220c9f
            l8ui         a15, a12, 153 /* [.Ldata045] */       # 1eb5: f20c99
            slli         a2, a2, 8                             # 1eb8: 802211
            add          a15, a15, a2                          # 1ebb: 2aff
            beqz         a15, .Lbr193                          # 1ebd: 161f07
            mov          a3, a15                               # 1ec0: 3d0f
            mul16u       a2, a0, a13                           # 1ec2: d020c1
            s32i         a2, sp, 68 /* a2 -> [(local17)] */    # 1ec5: 226111
            addx4        a13, a0, a0                           # 1ec8: 00d0a0
            slli         a13, a13, 1                           # 1ecb: f0dd11
            call0        __modsi3                              # 1ece: 0192ffc0
                                                               # 1ed2: 0000
            l32i         a0, sp, 68 /* [(local17)] */          # 1ed4: 022111
            blt          a2, a13, .Lbr191                      # 1ed7: d72202
            j            .Lbr201                               # 1eda: 464800
.Lbr191:    mov          a3, a15                               # 1edd: 3d0f
            mov          a2, a0 /* [(local17)] */              # 1edf: 2d00
            call0        __divsi3                              # 1ee1: 018effc0
                                                               # 1ee5: 0000
            call0        __floatsisf                           # 1ee7: 018effc0
                                                               # 1eeb: 0000
            s32i         a2, sp, 12 /* a2 -> [(local3)] */     # 1eed: 2931
            l32i         a13, sp, 16 /* [(local4)] */          # 1eef: d841
            mov          a2, a15                               # 1ef1: 2d0f
            call0        __floatsisf                           # 1ef3: 018cffc0
                                                               # 1ef7: 0000
            mov          a15, a2                               # 1ef9: fd02
            mov          a2, a13 /* [(local4)] */              # 1efb: 2d0d
            call0        __floatunsisf                         # 1efd: 018affc0
                                                               # 1f01: 0000
            mov          a3, a2                                # 1f03: 3d02
            l32i         a13, sp, 12 /* [(local3)] */          # 1f05: d831
            mov          a2, a15                               # 1f07: 2d0f
            call0        __divsf3                              # 1f09: 0188ffc0
                                                               # 1f0d: 0000
            mov          a3, a2                                # 1f0f: 3d02
            mov          a2, a13 /* [(local3)] */              # 1f11: 2d0d
            call0        __mulsf3                              # 1f13: 0187ffc0
                                                               # 1f17: 0000
            movi         a3, .Ldata102                         # 1f19: 3164ff
            l32i         a3, a3, 0 /* [.Ldata102] */           # 1f1c: 3803
            call0        __mulsf3                              # 1f1e: 0185ffc0
                                                               # 1f22: 0000
            call0        __fixsfsi                             # 1f24: 0185ffc0
                                                               # 1f28: 0000
.Lbr192:    l32i         a15, sp, 76 /* [(local19)] */         # 1f2a: f22113
            add          a3, a14, a2                           # 1f2d: 2a3e
            j            .Lbr194                               # 1f2f: 060100
.Lbr193:    l32i         a15, sp, 76 /* [(local19)] */         # 1f32: f22113
            movi         a3, 0 /* 0x00000000 */                # 1f35: 0c03
.Lbr194:    s32i         a3, sp, 60 /* a3 -> [(local15)] */    # 1f37: 39f1
            movi         a2, 0x00005dc0                        # 1f39: 215dff
            l16ui        a13, a12, 160 /* [.Ldata050] */       # 1f3c: d21c50
            movi         a0, sdk_g_phyFuns                     # 1f3f: 015dff
            add          a13, a14, a13                         # 1f42: dade
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1f44: 0800
            add          a13, a13, a2                          # 1f46: 2add
            l32i         a0, a0, 0 /* [[sdk_g_phyFuns]] */     # 1f48: 0800
            mov          a2, a13                               # 1f4a: 2d0d
            callx0       a0 /* [[sdk_g_phyFuns]] */            # 1f4c: c00000
            movi         a0, 0x00005dc0                        # 1f4f: 015aff
            movi         a4, sdk_g_phyFuns                     # 1f52: 415aff
            movi         a3, 0 /* 0x00000000 */                # 1f55: 0c03
            movi         a5, 100 /* 0x00000064 */              # 1f57: 52a064
            blt          a2, a5, .Lbr195                       # 1f5a: 572201
            mov          a13, a3 /* 0x00000000 */              # 1f5d: dd03
.Lbr195:    l16ui        a3, a12, 162 /* [.Ldata051] */        # 1f5f: 321c51
            l32i         a2, a4, 0 /* [sdk_g_phyFuns] */       # 1f62: 2804
            add          a14, a14, a3                          # 1f64: 3aee
            add          a14, a14, a0                          # 1f66: 0aee
            l32i         a0, a2, 0 /* [[sdk_g_phyFuns]] */     # 1f68: 0802
            mov          a2, a14                               # 1f6a: 2d0e
            callx0       a0 /* [[sdk_g_phyFuns]] */            # 1f6c: c00000
            l32i         a3, sp, 60 /* [(local15)] */          # 1f6f: 38f1
            l32i         a0, sp, 28 /* [(local7)] */           # 1f71: 0871
            l16ui        a4, a12, 124 /* [.Ldata036] */        # 1f73: 421c3e
            addi         a0, a0, -1 /* [(local7)]-0x1 */       # 1f76: 0b00
            ssr          a0                                    # 1f78: 000040
            sra          a4, a4                                # 1f7b: 4040b1
            bbci         a4, 0, .Lbr196                        # 1f7e: 076402
            bnez         a15, .Lbr205                          # 1f81: 56af15
.Lbr196:    l16ui        a4, a12, 156 /* [.Ldata047] */        # 1f84: 421c4e
            ssr          a0                                    # 1f87: 000040
            sra          a4, a4                                # 1f8a: 4040b1
            bbci         a4, 0, .Lbr197                        # 1f8d: 076402
            bnez         a3, .Lbr208                           # 1f90: 56d315
.Lbr197:    bnez         a13, .Lbr203                          # 1f93: 56fd0b
            movi         a5, 100 /* 0x00000064 */              # 1f96: 52a064
            blt          a2, a5, .Lbr198                       # 1f99: 572201
            movi         a14, 0 /* 0x00000000 */               # 1f9c: 0c0e
.Lbr198:    l32i         a12, sp, 24 /* [(local6)] */          # 1f9e: c861
            movnez       a12, a14, a14                         # 1fa0: e0ce93
            j            .Lbr204                               # 1fa3: 462c00
.Lbr199:    sub          a6, a15, a2                           # 1fa6: 206fc0
            blt          a6, a0, .Lbr200                       # 1fa9: 072602
            j            .Lbr206                               # 1fac: 064d00
.Lbr200:    mov          a2, a4 /* [(local16)] */              # 1faf: 2d04
            mov          a3, a15                               # 1fb1: 3d0f
            call0        __divsi3                              # 1fb3: 0162ffc0
                                                               # 1fb7: 0000
            addi         a2, a2, 1                             # 1fb9: 1b22
            call0        __floatsisf                           # 1fbb: 0161ffc0
                                                               # 1fbf: 0000
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 1fc1: 2901
            mov          a2, a15                               # 1fc3: 2d0f
            call0        __floatsisf                           # 1fc5: 015fffc0
                                                               # 1fc9: 0000
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      # 1fcb: 2911
            l32i         a2, sp, 20 /* [(local5)] */           # 1fcd: 2851
            call0        __floatunsisf                         # 1fcf: 015effc0
                                                               # 1fd3: 0000
            mov          a3, a2                                # 1fd5: 3d02
            l32i         a15, sp, 0 /* [(local0)] */           # 1fd7: f801
            l32i         a2, sp, 4 /* [(local1)] */            # 1fd9: 2811
            call0        __divsf3                              # 1fdb: 015cffc0
                                                               # 1fdf: 0000
            mov          a3, a2                                # 1fe1: 3d02
            mov          a2, a15 /* [(local0)] */              # 1fe3: 2d0f
            call0        __mulsf3                              # 1fe5: 015affc0
                                                               # 1fe9: 0000
            movi         a3, .Ldata102                         # 1feb: 3135ff
            l32i         a3, a3, 0 /* [.Ldata102] */           # 1fee: 3803
            call0        __mulsf3                              # 1ff0: 0159ffc0
                                                               # 1ff4: 0000
            call0        __fixsfsi                             # 1ff6: 0158ffc0
                                                               # 1ffa: 0000
            j            .Lbr188                               # 1ffc: c6a6ff
.Lbr201:    sub          a4, a15, a2                           # 1fff: 204fc0
            blt          a4, a13, .Lbr202                      # 2002: d72402
            j            .Lbr207                               # 2005: 063800
.Lbr202:    mov          a3, a15                               # 2008: 3d0f
            mov          a2, a0 /* [(local17)] */              # 200a: 2d00
            call0        __divsi3                              # 200c: 0154ffc0
                                                               # 2010: 0000
            addi         a2, a2, 1                             # 2012: 1b22
            call0        __floatsisf                           # 2014: 0153ffc0
                                                               # 2018: 0000
            mov          a13, a2                               # 201a: dd02
            mov          a2, a15                               # 201c: 2d0f
            call0        __floatsisf                           # 201e: 0151ffc0
                                                               # 2022: 0000
            mov          a15, a2                               # 2024: fd02
            l32i         a2, sp, 16 /* [(local4)] */           # 2026: 2841
            call0        __floatunsisf                         # 2028: 0150ffc0
                                                               # 202c: 0000
            mov          a3, a2                                # 202e: 3d02
            mov          a2, a15                               # 2030: 2d0f
            call0        __divsf3                              # 2032: 014effc0
                                                               # 2036: 0000
            mov          a3, a2                                # 2038: 3d02
            mov          a2, a13                               # 203a: 2d0d
            call0        __mulsf3                              # 203c: 014dffc0
                                                               # 2040: 0000
            movi         a3, .Ldata102                         # 2042: 3120ff
            l32i         a3, a3, 0 /* [.Ldata102] */           # 2045: 3803
            call0        __mulsf3                              # 2047: 014bffc0
                                                               # 204b: 0000
            call0        __fixsfsi                             # 204d: 014affc0
                                                               # 2051: 0000
            j            .Lbr192                               # 2053: c6b4ff
.Lbr203:    mov          a12, a13                              # 2056: cd0d
.Lbr204:    movi         a14, 0x40240000                       # 2058: e11cff
            movi         a13, 0 /* 0x00000000 */               # 205b: 0c0d
            mov          a2, a12                               # 205d: 2d0c
            call0        __floatsidf                           # 205f: 0147ffc0
                                                               # 2063: 0000
            s32i         a2, sp, 36 /* a2 -> [(local9)] */     # 2065: 2991
            s32i         a3, sp, 32 /* a3 -> [(local8)] */     # 2067: 3981
            movi         a5, 0x40499999                        # 2069: 5118ff
            movi         a4, 0x9999999a                        # 206c: 4119ff
            call0        __muldf3                              # 206f: 0144ffc0
                                                               # 2073: 0000
            mov          a5, a14 /* 0x40240000 */              # 2075: 5d0e
            mov          a4, a13 /* 0x00000000 */              # 2077: 4d0d
            call0        __divdf3                              # 2079: 0142ffc0
                                                               # 207d: 0000
            call0        __fixdfsi                             # 207f: 0142ffc0
                                                               # 2083: 0000
            l32i         a3, sp, 32 /* [(local8)] */           # 2085: 3881
            movi         a5, 0x40e99999                        # 2087: 5113ff
            mov          a15, a2                               # 208a: fd02
            movi         a4, 0x9999999a                        # 208c: 4113ff
            l32i         a2, sp, 36 /* [(local9)] */           # 208f: 2891
            call0        __muldf3                              # 2091: 013effc0
                                                               # 2095: 0000
            mov          a4, a13 /* 0x00000000 */              # 2097: 4d0d
            mov          a5, a14 /* 0x40240000 */              # 2099: 5d0e
            call0        __divdf3                              # 209b: 013dffc0
                                                               # 209f: 0000
            movi         a13, 0x60009600                       # 20a1: d10eff
            call0        __fixdfsi                             # 20a4: 013cffc0
                                                               # 20a8: 0000
            movi         a7, 0xc0000000                        # 20aa: 710eff
            movi         a5, 0x000fffff                        # 20ad: 510cff
            extui        a6, a15, 0, 10                        # 20b0: f06094
            and          a5, a2, a5                            # 20b3: 505210
            slli         a6, a6, 20                            # 20b6: c06601
            mov          a2, a12                               # 20b9: 2d0c
            memw                                               # 20bb: c02000
            l32i         a4, a13, 0x2a0 /* [0x600098a0] */     # 20be: 422da8
            and          a4, a4, a7                            # 20c1: 704410
            or           a4, a4, a6                            # 20c4: 604420
            or           a4, a4, a5                            # 20c7: 504420
            memw                                               # 20ca: c02000
            l32i         a12, sp, 44 /* [(local11)] */         # 20cd: c8b1
            l32i         a14, sp, 52 /* [(local13)] */         # 20cf: e8d1
            s32i         a4, a13, 0x2a0 /* a4 -> [0x600098a0] */ # 20d1: 426da8
            l32i         a15, sp, 56 /* [(local14)] */         # 20d4: f8e1
            l32i         a13, sp, 48 /* [(local12)] */         # 20d6: d8c1
            l32i         a0, sp, 40 /* [(local10)] */          # 20d8: 08a1
            addi         sp, sp, 80 /* (top of frame) */       # 20da: 12c150
            ret                                                # 20dd: 0df0
.Lbr205:    mov          a12, a15 /* [(local19)] */            # 20df: cd0f
            j            .Lbr204                               # 20e1: c6dcff
.Lbr206:    movi         a15, 0 /* 0x00000000 */               # 20e4: 0c0f
            j            .Lbr190                               # 20e6: 466fff
.Lbr207:    l32i         a15, sp, 76 /* [(local19)] */         # 20e9: f22113
            movi         a3, 0 /* 0x00000000 */                # 20ec: 0c03
            j            .Lbr194                               # 20ee: 4691ff
.Lbr208:    mov          a12, a3 /* [(local15)] */             # 20f1: cd03
            j            .Lbr204                               # 20f3: 46d8ff

            .literal_position                                  # 20f8: 00960060
                                                               # 20fc: 009a0060
                                                               # 2100: 00000000
                                                               # 2104: 00000000
                                                               # 2108: 00000000
                                                               # 210c: 00000000
                                                               # 2110: 00000000
                                                               # 2114: 00000000

# Function @ .irom0.text+0x2118
# Local variables/stack:
#     (local0):  byte      @ -0x10
#     (local1):  byte[3]   @ -0xf
#     (local2):  word      @ -0xc
#     (local3):  word[2]   @ -0x8
            .global      sdk_phy_dig_spur_prot
            .type        sdk_phy_dig_spur_prot, @function
sdk_phy_dig_spur_prot:
            addi         sp, sp, -16 /* (local0) */            # 2118: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local3)] */    # 211b: c921
            s32i         a0, sp, 4 /* a0 -> [(local2)] */      # 211d: 0911
            bnez         a2, .Lbr209                           # 211f: cc52
            movi         a0, 0 /* 0x00000000 */                # 2121: 0c00
            movi         a12, 0 /* 0x00000000 */               # 2123: 0c0c
            j            .Lbr213                               # 2125: 861200
.Lbr209:    bgei         a2, 1, .Lbr210                        # 2128: e61202
            j            .Lbr240                               # 212b: c67200
.Lbr210:    movi         a3, 100 /* 0x00000064 */              # 212e: 32a064
            slli         a12, a2, 5                            # 2131: b0c211
            mov          a2, a12                               # 2134: 2d0c
            call0        __divsi3                              # 2136: 01f2ffc0
                                                               # 213a: 0000
            mov          a0, a2                                # 213c: 0d02
            movi         a3, 10 /* 0x0000000a */               # 213e: 0ca3
            mov          a2, a12                               # 2140: 2d0c
            slli         a12, a0, 24                           # 2142: 80c001
            srai         a12, a12, 24                          # 2145: c0c831
            call0        __divsi3                              # 2148: 01efffc0
                                                               # 214c: 0000
            movi         a3, 10 /* 0x0000000a */               # 214e: 0ca3
            call0        __modsi3                              # 2150: 01eeffc0
                                                               # 2154: 0000
            blti         a2, 2, .Lbr211                        # 2156: a62202
            j            .Lbr241                               # 2159: 067500
.Lbr211:    movi         a0, 1 /* 0x00000001 */                # 215c: 0c10
            j            .Lbr213                               # 215e: 460400
.Lbr212:    l8ui         a12, sp, 1 /* [(local1)] */           # 2161: c20101
            l8ui         a0, sp, 0 /* [(local0)] */            # 2164: 020100
            slli         a12, a12, 24                          # 2167: 80cc01
            slli         a0, a0, 24                            # 216a: 800001
            srai         a0, a0, 24                            # 216d: 000831
            srai         a12, a12, 24                          # 2170: c0c831
.Lbr213:    bgei         a12, 1, .Lbr214                       # 2173: e61c05
            srai         a4, a0, 1                             # 2176: 004121
            j            .Lbr215                               # 2179: c60100
.Lbr214:    addi         a2, a12, -1                           # 217c: 0b2c
            ssl          a2                                    # 217e: 001240
            sll          a4, a0                                # 2181: 0040a1
.Lbr215:    movi         a2, 0x60009600                        # 2184: 21ddff
            memw                                               # 2187: c02000
            s32i         a4, a2, 0x2d4 /* a4 -> [0x600098d4] */ # 218a: 4262b5
            addi         a6, a12, 30                           # 218d: 62cc1e
            movi         a5, 0 /* 0x00000000 */                # 2190: 0c05
            ssl          a6                                    # 2192: 001640
            sll          a3, a0                                # 2195: 0030a1
            movgez       a3, a5, a12                           # 2198: c035b3
            memw                                               # 219b: c02000
            s32i         a3, a2, 0x29c /* a3 -> [0x6000989c] */ # 219e: 3262a7
            bgei         a12, 1, .Lbr216                       # 21a1: e61c05
            srai         a4, a0, 1                             # 21a4: 004121
            j            .Lbr217                               # 21a7: c60100
.Lbr216:    addi         a7, a12, -1                           # 21aa: 0b7c
            ssl          a7                                    # 21ac: 001740
            sll          a4, a0                                # 21af: 0040a1
.Lbr217:    memw                                               # 21b2: c02000
            movi         a6, 0 /* 0x00000000 */                # 21b5: 0c06
            s32i         a4, a2, 0x3b0 /* a4 -> [0x600099b0] */ # 21b7: 4262ec
            addi         a10, a12, 30                          # 21ba: a2cc1e
            movi         a9, 0 /* 0x00000000 */                # 21bd: 0c09
            ssl          a10                                   # 21bf: 001a40
            sll          a8, a0                                # 21c2: 0080a1
            movgez       a8, a9, a12                           # 21c5: c089b3
            memw                                               # 21c8: c02000
            s32i         a8, a2, 0x284 /* a8 -> [0x60009884] */ # 21cb: 8262a1
            beqi         a0, 1, .Lbr219                        # 21ce: 261014
            bnei         a0, 2, .Lbr218                        # 21d1: 662004
            movi         a5, 8 /* 0x00000008 */                # 21d4: 0c85
            j            .Lbr220                               # 21d6: 860300
.Lbr218:    addi         a3, a0, -3                            # 21d9: 32c0fd
            movi         a11, 10 /* 0x0000000a */              # 21dc: 0cab
            mov          a5, a6 /* 0x00000000 */               # 21de: 5d06
            moveqz       a5, a11, a3                           # 21e0: 305b83
            j            .Lbr220                               # 21e3: 460000
.Lbr219:    movi         a5, 2 /* 0x00000002 */                # 21e6: 0c25
.Lbr220:    blti         a12, 16, .Lbr221                      # 21e8: a6bc0d
            movi         a4, -32 /* 0xffffffe0 */              # 21eb: 6c04
            addx2        a4, a12, a4                           # 21ed: 404c90
            ssl          a4                                    # 21f0: 001440
            sll          a4, a5                                # 21f3: 0045a1
            j            .Lbr222                               # 21f6: 460000
.Lbr221:    movi         a4, 0 /* 0x00000000 */                # 21f9: 0c04
.Lbr222:    memw                                               # 21fb: c02000
            s32i         a4, a2, 0x28c /* a4 -> [0x6000988c] */ # 21fe: 4262a3
            movi         a11, -16 /* 0xfffffff0 */             # 2201: 7c0b
            blti         a12, 1, .Lbr223                       # 2203: a61c10
            bgei         a12, 16, .Lbr223                      # 2206: e6bc0d
            movi         a7, -2 /* 0xfffffffe */               # 2209: 7ce7
            addx2        a7, a12, a7                           # 220b: 707c90
            ssl          a7                                    # 220e: 001740
            sll          a7, a5                                # 2211: 0075a1
            j            .Lbr224                               # 2214: c60100
.Lbr223:    movi         a8, 0 /* 0x00000000 */                # 2217: 0c08
            srai         a7, a5, 2                             # 2219: 507221
            movnez       a7, a8, a12                           # 221c: c07893
.Lbr224:    memw                                               # 221f: c02000
            movi         a10, -31 /* 0xffffffe1 */             # 2222: 6c1a
            s32i         a7, a2, 0x288 /* a7 -> [0x60009888] */ # 2224: 7262a2
            movi         a8, 0x60009a00                        # 2227: 81b5ff
            bge          a11, a12, .Lbr225                     # 222a: c7ab10
            bgez         a12, .Lbr225                          # 222d: d6dc00
            movi         a9, 30 /* 0x0000001e */               # 2230: 1ce9
            addx2        a9, a12, a9                           # 2232: 909c90
            ssl          a9                                    # 2235: 001940
            sll          a7, a5                                # 2238: 0075a1
            j            .Lbr226                               # 223b: 460000
.Lbr225:    movi         a7, 0 /* 0x00000000 */                # 223e: 0c07
.Lbr226:    movi         a9, -15 /* 0xfffffff1 */              # 2240: 7c19
            memw                                               # 2242: c02000
            s32i         a7, a8, 0x30c /* a7 -> [0x60009d0c] */ # 2245: 7268c3
            bge          a10, a12, .Lbr227                     # 2248: c7aa10
            bge          a12, a9, .Lbr227                      # 224b: 97ac0d
            movi         a3, 60 /* 0x0000003c */               # 224e: 3cc3
            addx2        a3, a12, a3                           # 2250: 303c90
            ssl          a3                                    # 2253: 001340
            sll          a4, a5                                # 2256: 0045a1
            j            .Lbr228                               # 2259: 460000
.Lbr227:    movi         a4, 0 /* 0x00000000 */                # 225c: 0c04
.Lbr228:    memw                                               # 225e: c02000
            s32i         a4, a8, 0x308 /* a4 -> [0x60009d08] */ # 2261: 4268c2
            beqi         a0, 1, .Lbr230                        # 2264: 261014
            bnei         a0, 2, .Lbr229                        # 2267: 662004
            movi         a0, 4 /* 0x00000004 */                # 226a: 0c40
            j            .Lbr231                               # 226c: 860300
.Lbr229:    addi         a5, a0, -3                            # 226f: 52c0fd
            movi         a4, 5 /* 0x00000005 */                # 2272: 0c54
            moveqz       a6, a4, a5                            # 2274: 506483
            mov          a0, a6                                # 2277: 0d06
            j            .Lbr231                               # 2279: 460000
.Lbr230:    movi         a0, 1 /* 0x00000001 */                # 227c: 0c10
.Lbr231:    blti         a12, 16, .Lbr232                      # 227e: a6bc0d
            movi         a6, -32 /* 0xffffffe0 */              # 2281: 6c06
            addx2        a6, a12, a6                           # 2283: 606c90
            ssl          a6                                    # 2286: 001640
            sll          a4, a0                                # 2289: 0040a1
            j            .Lbr233                               # 228c: 460000
.Lbr232:    movi         a4, 0 /* 0x00000000 */                # 228f: 0c04
.Lbr233:    memw                                               # 2291: c02000
            s32i         a4, a2, 0x3bc /* a4 -> [0x600099bc] */ # 2294: 4262ef
            blti         a12, 1, .Lbr234                       # 2297: a61c10
            bgei         a12, 16, .Lbr234                      # 229a: e6bc0d
            movi         a7, -2 /* 0xfffffffe */               # 229d: 7ce7
            addx2        a7, a12, a7                           # 229f: 707c90
            ssl          a7                                    # 22a2: 001740
            sll          a5, a0                                # 22a5: 0050a1
            j            .Lbr235                               # 22a8: c60100
.Lbr234:    movi         a8, 0 /* 0x00000000 */                # 22ab: 0c08
            srai         a5, a0, 2                             # 22ad: 005221
            movnez       a5, a8, a12                           # 22b0: c05893
.Lbr235:    memw                                               # 22b3: c02000
            s32i         a5, a2, 0x3b8 /* a5 -> [0x600099b8] */ # 22b6: 5262ee
            bge          a11, a12, .Lbr236                     # 22b9: c7ab10
            bgez         a12, .Lbr236                          # 22bc: d6dc00
            movi         a11, 30 /* 0x0000001e */              # 22bf: 1ceb
            addx2        a11, a12, a11                         # 22c1: b0bc90
            ssl          a11                                   # 22c4: 001b40
            sll          a5, a0                                # 22c7: 0050a1
            j            .Lbr237                               # 22ca: 460000
.Lbr236:    movi         a5, 0 /* 0x00000000 */                # 22cd: 0c05
.Lbr237:    memw                                               # 22cf: c02000
            s32i         a5, a2, 0x3ac /* a5 -> [0x600099ac] */ # 22d2: 5262eb
            bge          a10, a12, .Lbr238                     # 22d5: c7aa10
            bge          a12, a9, .Lbr238                      # 22d8: 97ac0d
            movi         a3, 60 /* 0x0000003c */               # 22db: 3cc3
            addx2        a3, a12, a3                           # 22dd: 303c90
            ssl          a3                                    # 22e0: 001340
            sll          a0, a0                                # 22e3: 0000a1
            j            .Lbr239                               # 22e6: 460000
.Lbr238:    movi         a0, 0 /* 0x00000000 */                # 22e9: 0c00
.Lbr239:    memw                                               # 22eb: c02000
            l32i         a12, sp, 8 /* [(local3)] */           # 22ee: c821
            s32i         a0, a2, 0x3a8 /* a0 -> [0x600099a8] */ # 22f0: 0262ea
            l32i         a0, sp, 4 /* [(local2)] */            # 22f3: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 22f5: 12c110
            ret           /* 0x60009600 */                     # 22f8: 0df0
.Lbr240:    bgez         a2, .Lbr212                           # 22fa: d632e6
            movi         a3, 100 /* 0x00000064 */              # 22fd: 32a064
            slli         a12, a2, 5                            # 2300: b0c211
            mov          a2, a12                               # 2303: 2d0c
            call0        __divsi3                              # 2305: 0181ffc0
                                                               # 2309: 0000
            mov          a0, a2                                # 230b: 0d02
            movi         a3, 10 /* 0x0000000a */               # 230d: 0ca3
            mov          a2, a12                               # 230f: 2d0c
            addi         a12, a0, -1                           # 2311: 0bc0
            slli         a12, a12, 24                          # 2313: 80cc01
            srai         a12, a12, 24                          # 2316: c0c831
            call0        __divsi3                              # 2319: 017dffc0
                                                               # 231d: 0000
            movi         a3, 10 /* 0x0000000a */               # 231f: 0ca3
            call0        __modsi3                              # 2321: 017cffc0
                                                               # 2325: 0000
            movi         a3, -8 /* 0xfffffff8 */               # 2327: 7c83
            bge          a2, a3, .Lbr243                       # 2329: 37a211
            movi         a0, 1 /* 0x00000001 */                # 232c: 0c10
            j            .Lbr213                               # 232e: 4690ff
.Lbr241:    movi         a0, 3 /* 0x00000003 */                # 2331: 0c30
            bgei         a2, 8, .Lbr242                        # 2333: e68202
            j            .Lbr213                               # 2336: 468eff
.Lbr242:    movi         a0, 2 /* 0x00000002 */                # 2339: 0c20
            j            .Lbr213                               # 233b: 068dff
.Lbr243:    movi         a0, 3 /* 0x00000003 */                # 233e: 0c30
            movi         a4, -2 /* 0xfffffffe */               # 2340: 7ce4
            bge          a2, a4, .Lbr244                       # 2342: 47a202
            j            .Lbr213                               # 2345: 868aff
.Lbr244:    movi         a0, 2 /* 0x00000002 */                # 2348: 0c20
            j            .Lbr213                               # 234a: 4689ff

            .literal_position                                  # 2350: 00020060
                                                               # 2354: 00000000

# Function @ .irom0.text+0x2358
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_chip_v6_rxmax_ext_dig
            .type        sdk_chip_v6_rxmax_ext_dig, @function
sdk_chip_v6_rxmax_ext_dig:
            addi         sp, sp, -16 /* (local0) */            # 2358: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 235b: 0901
            movi         a0, 0x60000200                        # 235d: 01fcff
            bnez         a2, .Lbr245                           # 2360: dc22
            movi         a4, 16 /* 0x00000010 */               # 2362: 1c04
            memw                                               # 2364: c02000
            l32i         a3, a0, 0x390 /* [0x60000590] */      # 2367: 3220e4
            or           a3, a3, a4                            # 236a: 403320
            memw                                               # 236d: c02000
            s32i         a3, a0, 0x390 /* a3 -> [0x60000590] */ # 2370: 3260e4
            j            .Lbr246                               # 2373: 060400
.Lbr245:    movi         a6, -17 /* 0xffffffef */              # 2376: 6cf6
            memw                                               # 2378: c02000
            l32i         a5, a0, 0x390 /* [0x60000590] */      # 237b: 5220e4
            and          a5, a5, a6                            # 237e: 605510
            memw                                               # 2381: c02000
            s32i         a5, a0, 0x390 /* a5 -> [0x60000590] */ # 2384: 5260e4
.Lbr246:    movi         a4, sdk_rxiq_compute_num              # 2387: 41f3ff
            slli         a3, a2, 24                            # 238a: 803201
            l8ui         a2, a4, 90 /* [.Ldata003] */          # 238d: 22045a
            srai         a3, a3, 24                            # 2390: 303831
            slli         a2, a2, 24                            # 2393: 802201
            srai         a2, a2, 24                            # 2396: 202831
            call0        sdk_chip_v6_set_chan_rx_cmp           # 2399: 050000
            l32i         a0, sp, 0 /* [(local0)] */            # 239c: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 239e: 12c110
            ret                                                # 23a1: 0df0

            .literal_position                                  # 23a4: 00000000

# Function @ .irom0.text+0x23a8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_chip_v6_rxmax_ext
            .type        sdk_chip_v6_rxmax_ext, @function
sdk_chip_v6_rxmax_ext:
            addi         sp, sp, -16 /* (local0) */            # 23a8: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 23ab: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 23ad: 0901
            mov          a12, a2 /* arg0 */                    # 23af: cd02
            call0        sdk_chip_v6_rxmax_ext_ana             # 23b1: 01fcffc0
                                                               # 23b5: 0000
            mov          a2, a12 /* arg0 */                    # 23b7: 2d0c
            call0        sdk_chip_v6_rxmax_ext_dig             # 23b9: 050000
            l32i         a12, sp, 4 /* [(local1)] */           # 23bc: c811
            l32i         a0, sp, 0 /* [(local0)] */            # 23be: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 23c0: 12c110
            ret                                                # 23c3: 0df0

            .literal_position                                  # 23c8: 00140000
                                                               # 23cc: 00000010
                                                               # 23d0: 00000000
                                                               # 23d4: 000af23f
                                                               # 23d8: 00960060
                                                               # 23dc: 009a0060
                                                               # 23e0: ffff7f80
                                                               # 23e4: 81bc1409
                                                               # 23e8: 9841c65a
                                                               # 23ec: ffffff7f
                                                               # 23f0: ffff00fc
                                                               # 23f4: 00009001
                                                               # 23f8: fffffffb
                                                               # 23fc: ffffff00
                                                               # 2400: 00000018
                                                               # 2404: ffffff80
                                                               # 2408: 000000c0
                                                               # 240c: ff0ff0ff
                                                               # 2410: 00200200
                                                               # 2414: 00f0ffff
                                                               # 2418: a60f0000
                                                               # 241c: 0000c0ff
                                                               # 2420: 54583800
                                                               # 2424: 00ff0ff0
                                                               # 2428: e600200b
                                                               # 242c: 3ff0ffdf
                                                               # 2430: 400c0020
                                                               # 2434: ffff80ff
                                                               # 2438: 00001300
                                                               # 243c: 3ff0ffff
                                                               # 2440: 800d0000
                                                               # 2444: 000000fc
                                                               # 2448: 2401fe03
                                                               # 244c: ffffff0f
                                                               # 2450: 000000b0
                                                               # 2454: 00000004
                                                               # 2458: ffff0bff
                                                               # 245c: 00002400
                                                               # 2460: ffffbfff
                                                               # 2464: 00000000
                                                               # 2468: 00020060
                                                               # 246c: 00feef3f
                                                               # 2470: ff0f0000
                                                               # 2474: 83008000
                                                               # 2478: 009a0060
                                                               # 247c: fff7ffff
                                                               # 2480: 00000000
                                                               # 2484: 80020000
                                                               # 2488: 30000000
                                                               # 248c: e7010000
                                                               # 2490: 80020000
                                                               # 2494: 00000000
                                                               # 2498: 00000000
                                                               # 249c: 0c000000

# Function @ .irom0.text+0x24a0
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .global      sdk_phy_bb_rx_cfg
            .type        sdk_phy_bb_rx_cfg, @function
sdk_phy_bb_rx_cfg:
            movi         a6, 0x00001400                        # 24a0: 61caff
            movi         a11, 0x10000000                       # 24a3: b1caff
            movi         a4, .Ldata001                         # 24a6: 41caff
            movi         a5, 0x3ff20a00                        # 24a9: 51caff
            addi         sp, sp, -32 /* (local0) */            # 24ac: 12c1e0
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   # 24af: c951
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     # 24b1: 0941
            s32i         a13, sp, 24 /* a13 -> [(local6)] */   # 24b3: d961
            movi         a8, -128 /* 0xffffff80 */             # 24b5: 82af80
            movi         a2, 0x60009a00                        # 24b8: 21c9ff
            movi         a13, 0x60009600                       # 24bb: d1c7ff
            memw                                               # 24be: c02000
            l32i         a3, a2, 0x160 /* [0x60009b60] */      # 24c1: 322258
            or           a3, a3, a6                            # 24c4: 603320
            memw                                               # 24c7: c02000
            s32i         a3, a2, 0x160 /* a3 -> [0x60009b60] */ # 24ca: 326258
            memw                                               # 24cd: c02000
            l32i         a0, a2, 0x10c /* [0x60009b0c] */      # 24d0: 022243
            or           a0, a0, a11                           # 24d3: b00020
            memw                                               # 24d6: c02000
            s32i         a0, a2, 0x10c /* a0 -> [0x60009b0c] */ # 24d9: 026243
            movi         a12, 0x807fffff                       # 24dc: c1c1ff
            memw                                               # 24df: c02000
            l32i         a10, a2, 0x340 /* [0x60009d40] */     # 24e2: a222d0
            and          a10, a10, a12                         # 24e5: c0aa10
            or           a10, a10, a11                         # 24e8: b0aa20
            memw                                               # 24eb: c02000
            s32i         a10, a2, 0x340 /* a10 -> [0x60009d40] */ # 24ee: a262d0
            movi         a9, 0x0914bc81                        # 24f1: 91bcff
            memw                                               # 24f4: c02000
            s32i         a9, a2, 0x16c /* 0x0914bc81 -> [0x60009b6c] */ # 24f7: 92625b
            movi         a7, 0x5ac64198                        # 24fa: 71bbff
            memw                                               # 24fd: c02000
            s32i         a7, a2, 0x168 /* 0x5ac64198 -> [0x60009b68] */ # 2500: 72625a
            movi         a6, 0x7fffffff                        # 2503: 61baff
            memw                                               # 2506: c02000
            l32i         a3, a2, 0x150 /* [0x60009b50] */      # 2509: 322254
            and          a3, a3, a6                            # 250c: 603310
            memw                                               # 250f: c02000
            s32i         a3, a2, 0x150 /* a3 -> [0x60009b50] */ # 2512: 326254
            memw                                               # 2515: c02000
            movi         a12, 400 /* 0x00000190 */             # 2518: c2a190
            l32i         a0, a2, 0x318 /* [0x60009d18] */      # 251b: 0222c6
            memw                                               # 251e: c02000
            s32i         a12, a2, 0x318 /* 0x00000190 -> [0x60009d18] */ # 2521: c262c6
            movi         a11, 0xfc00ffff                       # 2524: b1b3ff
            movi         a10, 0x01900000                       # 2527: a1b3ff
            memw                                               # 252a: c02000
            l32i         a9, a13, 0x2ec /* [0x600098ec] */     # 252d: 922dbb
            and          a9, a9, a11                           # 2530: b09910
            or           a9, a9, a10                           # 2533: a09920
            memw                                               # 2536: c02000
            s32i         a9, a13, 0x2ec /* a9 -> [0x600098ec] */ # 2539: 926dbb
            movi         a7, 0xfbffffff                        # 253c: 71afff
            memw                                               # 253f: c02000
            l32i         a6, a13, 0x388 /* [0x60009988] */     # 2542: 622de2
            and          a6, a6, a7                            # 2545: 706610
            memw                                               # 2548: c02000
            s32i         a6, a13, 0x388 /* a6 -> [0x60009988] */ # 254b: 626de2
            l8ui         a4, a4, 0 /* [.Ldata001] */           # 254e: 420400
            addi         a4, a4, -15 /* [.Ldata001]-0xf */     # 2551: 42c4f1
            memw                                               # 2554: c02000
            l32i         a3, a2, 0x148 /* [0x60009b48] */      # 2557: 322252
            and          a3, a3, a8                            # 255a: 803310
            or           a3, a3, a4                            # 255d: 403320
            memw                                               # 2560: c02000
            s32i         a3, a2, 0x148 /* a3 -> [0x60009b48] */ # 2563: 326252
            movi         a0, 0x00ffffff                        # 2566: 01a5ff
            movi         a12, 0x18000000                       # 2569: c1a5ff
            memw                                               # 256c: c02000
            l32i         a11, a2, 0x128 /* [0x60009b28] */     # 256f: b2224a
            and          a11, a11, a0                          # 2572: 00bb10
            or           a11, a11, a12                         # 2575: c0bb20
            memw                                               # 2578: c02000
            s32i         a11, a2, 0x128 /* a11 -> [0x60009b28] */ # 257b: b2624a
            movi         a10, 0x80ffffff                       # 257e: a1a1ff
            memw                                               # 2581: c02000
            l32i         a9, a2, 52 /* [0x60009a34] */         # 2584: 98d2
            and          a9, a9, a10                           # 2586: a09910
            memw                                               # 2589: c02000
            s32i         a9, a2, 52 /* a9 -> [0x60009a34] */   # 258c: 99d2
            movi         a7, 38 /* 0x00000026 */               # 258e: 2c67
            memw                                               # 2590: c02000
            l32i         a6, a2, 0x144 /* [0x60009b44] */      # 2593: 622251
            and          a6, a6, a8                            # 2596: 806610
            or           a6, a6, a7                            # 2599: 706620
            memw                                               # 259c: c02000
            s32i         a6, a2, 0x144 /* a6 -> [0x60009b44] */ # 259f: 626251
            movi         a4, -64 /* 0xffffffc0 */              # 25a2: 42afc0
            movi         a3, 17 /* 0x00000011 */               # 25a5: 1c13
            memw                                               # 25a7: c02000
            l32i         a0, a2, 0x370 /* [0x60009d70] */      # 25aa: 0222dc
            and          a0, a0, a4                            # 25ad: 400010
            or           a0, a0, a3                            # 25b0: 300020
            memw                                               # 25b3: c02000
            s32i         a0, a2, 0x370 /* a0 -> [0x60009d70] */ # 25b6: 0262dc
            movi         a12, 0xc0000000                       # 25b9: c193ff
            memw                                               # 25bc: c02000
            l32i         a11, a13, 0x2a0 /* [0x600098a0] */    # 25bf: b22da8
            or           a11, a11, a12                         # 25c2: c0bb20
            memw                                               # 25c5: c02000
            s32i         a11, a13, 0x2a0 /* a11 -> [0x600098a0] */ # 25c8: b26da8
            movi         a10, 0xfff00fff                       # 25cb: a190ff
            movi         a9, 0x00022000                        # 25ce: 9190ff
            memw                                               # 25d1: c02000
            l32i         a8, a2, 0x164 /* [0x60009b64] */      # 25d4: 822259
            and          a8, a8, a10                           # 25d7: a08810
            or           a8, a8, a9                            # 25da: 908820
            memw                                               # 25dd: c02000
            s32i         a8, a2, 0x164 /* a8 -> [0x60009b64] */ # 25e0: 826259
            movi         a7, 0xfffff000                        # 25e3: 718cff
            movi         a6, 0x00000fa6                        # 25e6: 618cff
            memw                                               # 25e9: c02000
            l32i         a4, a2, 0x164 /* [0x60009b64] */      # 25ec: 422259
            and          a4, a4, a7                            # 25ef: 704410
            or           a4, a4, a6                            # 25f2: 604420
            memw                                               # 25f5: c02000
            s32i         a4, a2, 0x164 /* a4 -> [0x60009b64] */ # 25f8: 426259
            movi         a3, 0xffc00000                        # 25fb: 3188ff
            movi         a0, 0x00385854                        # 25fe: 0188ff
            memw                                               # 2601: c02000
            l32i         a12, a2, 0x15c /* [0x60009b5c] */     # 2604: c22257
            and          a12, a12, a3                          # 2607: 30cc10
            or           a12, a12, a0                          # 260a: 00cc20
            memw                                               # 260d: c02000
            s32i         a12, a2, 0x15c /* a12 -> [0x60009b5c] */ # 2610: c26257
            movi         a11, 0xf00fff00                       # 2613: b184ff
            movi         a10, 0x0b2000e6                       # 2616: a184ff
            memw                                               # 2619: c02000
            l32i         a9, a2, 0x150 /* [0x60009b50] */      # 261c: 922254
            and          a9, a9, a11                           # 261f: b09910
            or           a9, a9, a10                           # 2622: a09920
            memw                                               # 2625: c02000
            s32i         a9, a2, 0x150 /* a9 -> [0x60009b50] */ # 2628: 926254
            memw                                               # 262b: c02000
            movi         a7, 128 /* 0x00000080 */              # 262e: 72a080
            l32i         a8, a2, 0x318 /* [0x60009d18] */      # 2631: 8222c6
            memw                                               # 2634: c02000
            s32i         a7, a2, 0x318 /* 0x00000080 -> [0x60009d18] */ # 2637: 7262c6
            movi         a6, 4 /* 0x00000004 */                # 263a: 0c46
            memw                                               # 263c: c02000
            l32i         a4, a2, 0x310 /* [0x60009d10] */      # 263f: 4222c4
            or           a4, a4, a6                            # 2642: 604420
            memw                                               # 2645: c02000
            s32i         a4, a2, 0x310 /* a4 -> [0x60009d10] */ # 2648: 4262c4
            movi         a3, 0xdffff03f                        # 264b: 3178ff
            movi         a0, 0x20000c40                        # 264e: 0178ff
            memw                                               # 2651: c02000
            l32i         a12, a2, 0x370 /* [0x60009d70] */     # 2654: c222dc
            and          a12, a12, a3                          # 2657: 30cc10
            or           a12, a12, a0                          # 265a: 00cc20
            memw                                               # 265d: c02000
            s32i         a12, a2, 0x370 /* a12 -> [0x60009d70] */ # 2660: c262dc
            movi         a11, 0xff80ffff                       # 2663: b174ff
            movi         a10, 0x00130000                       # 2666: a174ff
            memw                                               # 2669: c02000
            l32i         a9, a2, 0x324 /* [0x60009d24] */      # 266c: 9222c9
            and          a9, a9, a11                           # 266f: b09910
            or           a9, a9, a10                           # 2672: a09920
            memw                                               # 2675: c02000
            s32i         a9, a2, 0x324 /* a9 -> [0x60009d24] */ # 2678: 9262c9
            movi         a8, 0xfffff03f                        # 267b: 8170ff
            movi         a7, 0x00000d80                        # 267e: 7170ff
            memw                                               # 2681: c02000
            l32i         a6, a2, 0x158 /* [0x60009b58] */      # 2684: 622256
            and          a6, a6, a8                            # 2687: 806610
            or           a6, a6, a7                            # 268a: 706620
            memw                                               # 268d: c02000
            s32i         a6, a2, 0x158 /* a6 -> [0x60009b58] */ # 2690: 626256
            movi         a4, 0xfc000000                        # 2693: 416cff
            movi         a3, 0x03fe0124                        # 2696: 316cff
            memw                                               # 2699: c02000
            l32i         a0, a2, 0x34c /* [0x60009d4c] */      # 269c: 0222d3
            and          a0, a0, a4                            # 269f: 400010
            or           a0, a0, a3                            # 26a2: 300020
            memw                                               # 26a5: c02000
            s32i         a0, a2, 0x34c /* a0 -> [0x60009d4c] */ # 26a8: 0262d3
            movi         a12, 0x0fffffff                       # 26ab: c168ff
            movi         a11, 0xb0000000                       # 26ae: b168ff
            memw                                               # 26b1: c02000
            l32i         a10, a2, 0x320 /* [0x60009d20] */     # 26b4: a222c8
            and          a10, a10, a12                         # 26b7: c0aa10
            or           a10, a10, a11                         # 26ba: b0aa20
            memw                                               # 26bd: c02000
            s32i         a10, a2, 0x320 /* a10 -> [0x60009d20] */ # 26c0: a262c8
            movi         a9, 0x04000000                        # 26c3: 9164ff
            memw                                               # 26c6: c02000
            l32i         a8, a13, 0x388 /* [0x60009988] */     # 26c9: 822de2
            or           a8, a8, a9                            # 26cc: 908820
            memw                                               # 26cf: c02000
            s32i         a8, a13, 0x388 /* a8 -> [0x60009988] */ # 26d2: 826de2
            movi         a7, 0xff0bffff                        # 26d5: 7160ff
            movi         a6, 0x00240000                        # 26d8: 6161ff
            memw                                               # 26db: c02000
            l32i         a4, a5, 0x270 /* [0x3ff20c70] */      # 26de: 42259c
            and          a4, a4, a7                            # 26e1: 704410
            or           a4, a4, a6                            # 26e4: 604420
            memw                                               # 26e7: c02000
            s32i         a4, a5, 0x270 /* a4 -> [0x3ff20c70] */ # 26ea: 42659c
            movi         a3, 0xffbfffff                        # 26ed: 315cff
            memw                                               # 26f0: c02000
            l32i         a0, a2, 0x344 /* [0x60009d44] */      # 26f3: 0222d1
            and          a0, a0, a3                            # 26f6: 300010
            memw                                               # 26f9: c02000
            s32i         a0, a2, 0x344 /* a0 -> [0x60009d44] */ # 26fc: 0262d1
            movi         a2, 0 /* 0x00000000 */                # 26ff: 0c02
            call0        sdk_chip_v6_rxmax_ext_dig             # 2701: 050000
            movi         a12, sdk_g_phyFuns                    # 2704: c158ff
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 2707: 080c
            l32i         a0, a0, 12 /* [[sdk_g_phyFuns]+0xc] */ # 2709: 0830
            movi         a2, 0 /* 0x00000000 */                # 270b: 0c02
            callx0       a0 /* [[sdk_g_phyFuns]+0xc] */        # 270d: c00000
            movi         a11, -49 /* 0xffffffcf */             # 2710: b2afcf
            movi         a10, 32 /* 0x00000020 */              # 2713: 2c0a
            movi         a3, 0x60000200                        # 2715: 3154ff
            movi         a6, 0x3feffe00                        # 2718: 6155ff
            movi         a2, 0x00000fff                        # 271b: 2155ff
            memw                                               # 271e: c02000
            l32i         a9, a13, 0x238 /* [0x60009838] */     # 2721: 922d8e
            and          a9, a9, a11                           # 2724: b09910
            or           a9, a9, a10                           # 2727: a09920
            memw                                               # 272a: c02000
            s32i         a9, a13, 0x238 /* a9 -> [0x60009838] */ # 272d: 926d8e
            memw                                               # 2730: c02000
            movi         a10, 0x60009a00                       # 2733: a151ff
            movi         a7, 0x00800083                        # 2736: 714fff
            l32i         a8, a10, 0x248 /* [0x60009c48] */     # 2739: 822a92
            memw                                               # 273c: c02000
            s32i         a7, a10, 0x248 /* 0x00800083 -> [0x60009c48] */ # 273f: 726a92
            movi         a5, 6 /* 0x00000006 */                # 2742: 0c65
            memw                                               # 2744: c02000
            l32i         a4, a10, 0x24c /* [0x60009c4c] */     # 2747: 422a93
            or           a4, a4, a5                            # 274a: 504420
            memw                                               # 274d: c02000
            s32i         a4, a10, 0x24c /* a4 -> [0x60009c4c] */ # 2750: 426a93
            memw                                               # 2753: c02000
            s32i         a2, a10, 0x31c /* 0x00000fff -> [0x60009d1c] */ # 2756: 226ac7
            memw                                               # 2759: c02000
            l32i         a0, a10, 0x31c /* [0x60009d1c] */     # 275c: 022ac7
            or           a0, a0, a2                            # 275f: 200020
            memw                                               # 2762: c02000
            s32i         a0, a10, 0x31c /* a0 -> [0x60009d1c] */ # 2765: 026ac7
            movi         a11, 0xfffff7ff                       # 2768: b145ff
            memw                                               # 276b: c02000
            l32i         a9, a10, 40 /* [0x60009a28] */        # 276e: 98aa
            and          a9, a9, a11                           # 2770: b09910
            memw                                               # 2773: c02000
            s32i         a9, a10, 40 /* a9 -> [0x60009a28] */  # 2776: 99aa
            movi         a8, -7 /* 0xfffffff9 */               # 2778: 7c98
            movi         a7, 2 /* 0x00000002 */                # 277a: 0c27
            memw                                               # 277c: c02000
            l32i         a5, a6, 0x224 /* [0x3ff00024] */      # 277f: 522689
            and          a5, a5, a8                            # 2782: 805510
            or           a5, a5, a7                            # 2785: 705520
            memw                                               # 2788: c02000
            s32i         a5, a6, 0x224 /* a5 -> [0x3ff00024] */ # 278b: 526689
            movi         a4, -2 /* 0xfffffffe */               # 278e: 7ce4
            memw                                               # 2790: c02000
            l32i         a2, a3, 0x3c0 /* [0x600005c0] */      # 2793: 2223f0
            and          a2, a2, a4                            # 2796: 402210
            memw                                               # 2799: c02000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 279c: 080c
            l32i         a0, a0, 160 /* [[sdk_g_phyFuns]+0xa0] */ # 279e: 022028
            s32i         a2, a3, 0x3c0 /* a2 -> [0x600005c0] */ # 27a1: 2263f0
            callx0       a0 /* [[sdk_g_phyFuns]+0xa0] */       # 27a4: c00000
            movi         a2, 1 /* 0x00000001 */                # 27a7: 0c12
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 27a9: 080c
            movi         a3, 1 /* 0x00000001 */                # 27ab: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ # 27ad: 02202b
            movi         a4, 12 /* 0x0000000c */               # 27b0: 0cc4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       # 27b2: c00000
            movi         a2, 2 /* 0x00000002 */                # 27b5: 0c22
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 27b7: 080c
            movi         a3, 1 /* 0x00000001 */                # 27b9: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ # 27bb: 02202b
            movi         a4, 388 /* 0x00000184 */              # 27be: 42a184
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       # 27c1: c00000
            movi         a2, 3 /* 0x00000003 */                # 27c4: 0c32
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 27c6: 080c
            movi         a3, 2 /* 0x00000002 */                # 27c8: 0c23
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ # 27ca: 02202b
            movi         a4, 6 /* 0x00000006 */                # 27cd: 0c64
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       # 27cf: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 27d2: 080c
            l32i         a0, a0, 188 /* [[sdk_g_phyFuns]+0xbc] */ # 27d4: 02202f
            callx0       a0 /* [[sdk_g_phyFuns]+0xbc] */       # 27d7: c00000
            movi         a2, sdk_rxiq_compute_num              # 27da: 2129ff
            l32i         a3, a2, 12 /* [sdk_chip6_sleep_params] */ # 27dd: 3832
            movi         a0, .Ldata097                         # 27df: 0129ff
            bbsi         a3, 27, .Lbr247                       # 27e2: b7f317
            movi         a3, 127 /* 0x0000007f */              # 27e5: 32a07f
            movi         a4, sdk_rx_gain_swp                   # 27e8: 4128ff
            movi         a5, .Label016                         # 27eb: 5128ff
            movi         a6, 16 /* 0x00000010 */               # 27ee: 1c06
            movi         a7, 0 /* 0x00000000 */                # 27f0: 0c07
            mov          a2, a0 /* .Ldata097 */                # 27f2: 2d00
            call0        sdk_gen_rx_gain_table                 # 27f4: 050000
            movi         a0, .Ldata097                         # 27f7: 0126ff
            movi         a2, sdk_rxiq_compute_num              # 27fa: 2126ff
.Lbr247:    movi         a8, 0 /* 0x00000000 */                # 27fd: 0c08
            movi         a7, .Ldata001                         # 27ff: 7126ff
            movi         a3, sdk_chip6_sleep_params            # 2802: 3126ff
            l32i         a4, a2, 0x1cc /* [.Ldata019] */       # 2805: 422273
            movi         a2, 1 /* 0x00000001 */                # 2808: 0c12
            addi         a5, a3, 124 /* .Label004 */           # 280a: 52c37c
            addi         a6, a3, 22 /* .bss+0x22 */            # 280d: 62c316
            l8ui         a7, a7, 0 /* [.Ldata001] */           # 2810: 720700
            s32i         a8, sp, 4 /* 0x00000000 -> [(local1)] */ # 2813: 8911
            s32i         a8, sp, 8 /* 0x00000000 -> [(local2)] */ # 2815: 8921
            s32i         a8, sp, 12 /* 0x00000000 -> [(local3)] */ # 2817: 8931
            s32i         a0, sp, 0 /* .Ldata097 -> [(local0)] */ # 2819: 0901
            addi         a7, a7, 1 /* [.Ldata001]+0x1 */       # 281b: 1b77
            extui        a7, a7, 0, 8                          # 281d: 707074
            call0        sdk_set_rx_gain_testchip_50           # 2820: 050000
            movi         a2, 119 /* 0x00000077 */              # 2823: 22a077
            movi         a3, 0 /* 0x00000000 */                # 2826: 0c03
            movi         a4, 18 /* 0x00000012 */               # 2828: 1c24
            movi         a5, 7 /* 0x00000007 */                # 282a: 0c75
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 282c: 080c
            movi         a6, 0 /* 0x00000000 */                # 282e: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 2830: 022027
            movi         a7, 232 /* 0x000000e8 */              # 2833: 72a0e8
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 2836: c00000
            movi         a3, 1 /* 0x00000001 */                # 2839: 0c13
            memw                                               # 283b: c02000
            l32i         a2, a13, 0x260 /* [0x60009860] */     # 283e: 222d98
            or           a2, a2, a3                            # 2841: 302220
            memw                                               # 2844: c02000
            s32i         a2, a13, 0x260 /* a2 -> [0x60009860] */ # 2847: 226d98
            l32i         a12, sp, 20 /* [(local5)] */          # 284a: c851
            l32i         a13, sp, 24 /* [(local6)] */          # 284c: d861
            l32i         a0, sp, 16 /* [(local4)] */           # 284e: 0841
            addi         sp, sp, 32 /* (top of frame) */       # 2850: 12c120
            ret                                                # 2853: 0df0

            .literal_position                                  # 2858: 00000000
                                                               # 285c: 00000000

# Function @ .irom0.text+0x2860
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_uart_wait_idle
            .type        sdk_uart_wait_idle, @function
sdk_uart_wait_idle:
            addi         sp, sp, -16 /* (local0) */            # 2860: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 2863: 0901
            call0        sdk_uart_tx_flush                     # 2865: 01fcffc0
                                                               # 2869: 0000
            movi         a2, 100 /* 0x00000064 */              # 286b: 22a064
            call0        sdk_ets_delay_us                      # 286e: 01fbffc0
                                                               # 2872: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 2874: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 2876: 12c110
            ret                                                # 2879: 0df0

            .literal_position                                  # 287c: ffff1ff0
                                                               # 2880: 00008001
                                                               # 2884: 00020060
                                                               # 2888: ffffff1f
                                                               # 288c: 000000c0
                                                               # 2890: ff3fe0ff
                                                               # 2894: 00401f00
                                                               # 2898: ffff00ff
                                                               # 289c: 0000ab00
                                                               # 28a0: ff00ffff

# Function @ .irom0.text+0x28a4
            .global      sdk_phy_pbus_soc_cfg
            .type        sdk_phy_pbus_soc_cfg, @function
sdk_phy_pbus_soc_cfg:
            movi         a11, 0xf01fffff                       # 28a4: b1f6ff
            movi         a10, 0x01800000                       # 28a7: a1f6ff
            movi         a3, 0x60000200                        # 28aa: 31f6ff
            memw                                               # 28ad: c02000
            l32i         a2, a3, 0x398 /* [0x60000598] */      # 28b0: 2223e6
            and          a2, a2, a11                           # 28b3: b02210
            or           a2, a2, a10                           # 28b6: a02220
            memw                                               # 28b9: c02000
            s32i         a2, a3, 0x398 /* a2 -> [0x60000598] */ # 28bc: 2263e6
            memw                                               # 28bf: c02000
            l32i         a9, a3, 0x39c /* [0x6000059c] */      # 28c2: 9223e7
            and          a9, a9, a11                           # 28c5: b09910
            or           a9, a9, a10                           # 28c8: a09920
            memw                                               # 28cb: c02000
            s32i         a9, a3, 0x39c /* a9 -> [0x6000059c] */ # 28ce: 9263e7
            movi         a8, 0x1fffffff                        # 28d1: 81edff
            movi         a7, 0xc0000000                        # 28d4: 71eeff
            memw                                               # 28d7: c02000
            l32i         a6, a3, 0x394 /* [0x60000594] */      # 28da: 6223e5
            and          a6, a6, a8                            # 28dd: 806610
            or           a6, a6, a7                            # 28e0: 706620
            memw                                               # 28e3: c02000
            s32i         a6, a3, 0x394 /* a6 -> [0x60000594] */ # 28e6: 6263e5
            movi         a5, 0xffe03fff                        # 28e9: 51e9ff
            movi         a4, 0x001f4000                        # 28ec: 41eaff
            memw                                               # 28ef: c02000
            l32i         a2, a3, 0x398 /* [0x60000598] */      # 28f2: 2223e6
            and          a2, a2, a5                            # 28f5: 502210
            or           a2, a2, a4                            # 28f8: 402220
            memw                                               # 28fb: c02000
            s32i         a2, a3, 0x398 /* a2 -> [0x60000598] */ # 28fe: 2263e6
            movi         a11, 0xff00ffff                       # 2901: b1e5ff
            movi         a10, 0x00ab0000                       # 2904: a1e6ff
            memw                                               # 2907: c02000
            l32i         a9, a3, 0x3a0 /* [0x600005a0] */      # 290a: 9223e8
            and          a9, a9, a11                           # 290d: b09910
            or           a9, a9, a10                           # 2910: a09920
            memw                                               # 2913: c02000
            s32i         a9, a3, 0x3a0 /* a9 -> [0x600005a0] */ # 2916: 9263e8
            movi         a8, 0xffff00ff                        # 2919: 81e1ff
            movi         a7, 256 /* 0x00000100 */              # 291c: 72a100
            memw                                               # 291f: c02000
            l32i         a6, a3, 0x3c8 /* [0x600005c8] */      # 2922: 6223f2
            and          a6, a6, a8                            # 2925: 806610
            or           a6, a6, a7                            # 2928: 706620
            memw                                               # 292b: c02000
            s32i         a6, a3, 0x3c8 /* a6 -> [0x600005c8] */ # 292e: 6263f2
            movi         a5, -128 /* 0xffffff80 */             # 2931: 52af80
            movi         a4, 71 /* 0x00000047 */               # 2934: 4c74
            memw                                               # 2936: c02000
            l32i         a2, a3, 0x398 /* [0x60000598] */      # 2939: 2223e6
            and          a2, a2, a5                            # 293c: 502210
            or           a2, a2, a4                            # 293f: 402220
            memw                                               # 2942: c02000
            s32i         a2, a3, 0x398 /* a2 -> [0x60000598] */ # 2945: 2263e6
            ret                                                # 2948: 0df0

            .literal_position                                  # 294c: 9b010000
                                                               # 2950: 00060060
                                                               # 2954: 00060060
                                                               # 2958: 00060060
                                                               # 295c: 9b010000
                                                               # 2960: 00020060
                                                               # 2964: 9b010000
                                                               # 2968: 000a0060
                                                               # 296c: ff0fffff
                                                               # 2970: 00100000
                                                               # 2974: 00200000
                                                               # 2978: 00000e01
                                                               # 297c: 00000d01
                                                               # 2980: 0000de03
                                                               # 2984: 0000ed03
                                                               # 2988: 00000000
                                                               # 298c: 00000000
                                                               # 2990: 00000000
                                                               # 2994: 00000000
                                                               # 2998: 00000000
                                                               # 299c: 00000000
                                                               # 29a0: 00000000
                                                               # 29a4: 00000000
                                                               # 29a8: 00000000

# Function @ .irom0.text+0x29ac
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_phy_gpio_cfg
            .type        sdk_phy_gpio_cfg, @function
sdk_phy_gpio_cfg:
            addi         sp, sp, -16 /* (local0) */            # 29ac: 12c1f0
            movi         a4, .Label012                         # 29af: 41e7ff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 29b2: 0901
            l8ui         a2, a4, 130 /* [.Ldata043] */         # 29b4: 220482
            movi         a0, 0x60000600                        # 29b7: 01e6ff
            bnei         a2, 2, .Lbr248                        # 29ba: 662217
            movi         a5, 105 /* 0x00000069 */              # 29bd: 52a069
            movi         a6, -108 /* 0xffffff94 */             # 29c0: 62af94
            memw                                               # 29c3: c02000
            l32i         a3, a0, 0x1a0 /* [0x600007a0] */      # 29c6: 322068
            and          a3, a3, a6                            # 29c9: 603310
            or           a3, a3, a5                            # 29cc: 503320
            memw                                               # 29cf: c02000
            s32i         a3, a0, 0x1a0 /* a3 -> [0x600007a0] */ # 29d2: 326068
.Lbr248:    l8ui         a3, a4, 131 /* [.Ldata044] */         # 29d5: 320483
            beqi         a3, 1, .Lbr249                        # 29d8: 261302
            bnei         a3, 3, .Lbr250                        # 29db: 66332a
.Lbr249:    movi         a10, 1 /* 0x00000001 */               # 29de: 0c1a
            movi         a11, -68 /* 0xffffffbc */             # 29e0: b2afbc
            memw                                               # 29e3: c02000
            l32i         a9, a0, 0x1a0 /* [0x600007a0] */      # 29e6: 922068
            and          a9, a9, a11                           # 29e9: b09910
            or           a9, a9, a10                           # 29ec: a09920
            memw                                               # 29ef: c02000
            s32i         a9, a0, 0x1a0 /* a9 -> [0x600007a0] */ # 29f2: 926068
            movi         a8, -2 /* 0xfffffffe */               # 29f5: 7ce8
            memw                                               # 29f7: c02000
            l32i         a7, a0, 0x174 /* [0x60000774] */      # 29fa: 72205d
            and          a7, a7, a8                            # 29fd: 807710
            memw                                               # 2a00: c02000
            s32i         a7, a0, 0x174 /* a7 -> [0x60000774] */ # 2a03: 72605d
            l8ui         a3, a4, 131 /* [.Ldata044] */         # 2a06: 320483
.Lbr250:    movi         a5, -257 /* 0xfffffeff */             # 2a09: 52aeff
            beqi         a3, 2, .Lbr251                        # 2a0c: 262302
            bnei         a3, 3, .Lbr252                        # 2a0f: 66332b
.Lbr251:    memw                                               # 2a12: c02000
            movi         a2, 0x60000600                        # 2a15: 21cfff
            l32i         a0, a2, 0x234 /* [0x60000834] */      # 2a18: 02228d
            movi         a3, -257 /* 0xfffffeff */             # 2a1b: 32aeff
            and          a0, a0, a3                            # 2a1e: 300010
            memw                                               # 2a21: c02000
            movi         a3, 0 /* 0x00000000 */                # 2a24: 0c03
            movi         a4, 0 /* 0x00000000 */                # 2a26: 0c04
            s32i         a0, a2, 0x234 /* a0 -> [0x60000834] */ # 2a28: 02628d
            movi         a5, 1 /* 0x00000001 */                # 2a2b: 0c15
            movi         a2, 0 /* 0x00000000 */                # 2a2d: 0c02
            call0        sdk_gpio_output_set                   # 2a2f: 01d6ffc0
                                                               # 2a33: 0000
            movi         a0, 0x60000600                        # 2a35: 01c8ff
            movi         a4, .Label012                         # 2a38: 41c9ff
            movi         a5, -257 /* 0xfffffeff */             # 2a3b: 52aeff
.Lbr252:    l8ui         a3, a4, 124 /* [.Ldata037] */         # 2a3e: 32047c
            beqi         a3, 1, .Lbr253                        # 2a41: 261311
            memw                                               # 2a44: c02000
            l32i         a6, a0, 0x234 /* [0x60000834] */      # 2a47: 62208d
            and          a6, a6, a5                            # 2a4a: 506610
            memw                                               # 2a4d: c02000
            s32i         a6, a0, 0x234 /* a6 -> [0x60000834] */ # 2a50: 62608d
            l8ui         a3, a4, 124 /* [.Ldata037] */         # 2a53: 32047c
.Lbr253:    bnei         a3, 2, .Lbr254                        # 2a56: 662311
            movi         a8, 256 /* 0x00000100 */              # 2a59: 82a100
            memw                                               # 2a5c: c02000
            l32i         a7, a0, 0x214 /* [0x60000814] */      # 2a5f: 722085
            or           a7, a7, a8                            # 2a62: 807720
            memw                                               # 2a65: c02000
            s32i         a7, a0, 0x214 /* a7 -> [0x60000814] */ # 2a68: 726085
.Lbr254:    movi         a6, -305 /* 0xfffffecf */             # 2a6b: 62aecf
            l8ui         a3, a4, 129 /* [.Ldata042] */         # 2a6e: 320481
            movi         a7, 48 /* 0x00000030 */               # 2a71: 3c07
            bnei         a3, 1, .Lbr255                        # 2a73: 661314
            memw                                               # 2a76: c02000
            l32i         a9, a0, 0x218 /* [0x60000818] */      # 2a79: 922086
            and          a9, a9, a6                            # 2a7c: 609910
            or           a9, a9, a7                            # 2a7f: 709920
            memw                                               # 2a82: c02000
            s32i         a9, a0, 0x218 /* a9 -> [0x60000818] */ # 2a85: 926086
            j            .Lbr257                               # 2a88: 460d00
.Lbr255:    bnei         a3, 2, .Lbr256                        # 2a8b: 662311
            memw                                               # 2a8e: c02000
            l32i         a10, a0, 0x238 /* [0x60000838] */     # 2a91: a2208e
            and          a10, a10, a5                          # 2a94: 50aa10
            memw                                               # 2a97: c02000
            s32i         a10, a0, 0x238 /* a10 -> [0x60000838] */ # 2a9a: a2608e
            j            .Lbr257                               # 2a9d: 060800
.Lbr256:    memw                                               # 2aa0: c02000
            l32i         a2, a0, 0x218 /* [0x60000818] */      # 2aa3: 222086
            and          a2, a2, a6                            # 2aa6: 602210
            or           a2, a2, a7                            # 2aa9: 702220
            memw                                               # 2aac: c02000
            s32i         a2, a0, 0x218 /* a2 -> [0x60000818] */ # 2aaf: 226086
            memw                                               # 2ab2: c02000
            l32i         a11, a0, 0x238 /* [0x60000838] */     # 2ab5: b2208e
            and          a11, a11, a5                          # 2ab8: 50bb10
            memw                                               # 2abb: c02000
            s32i         a11, a0, 0x238 /* a11 -> [0x60000838] */ # 2abe: b2608e
.Lbr257:    l8ui         a3, a4, 126 /* [.Ldata039] */         # 2ac1: 32047e
            movi         a8, 32 /* 0x00000020 */               # 2ac4: 2c08
            beqi         a3, 1, .Lbr258                        # 2ac6: 261326
            beqi         a3, 3, .Lbr258                        # 2ac9: 263323
            beqi         a3, 4, .Lbr258                        # 2acc: 264320
            beqi         a3, 5, .Lbr258                        # 2acf: 26531d
            l8ui         a3, a4, 128 /* [.Ldata041] */         # 2ad2: 320480
            addi         a5, a3, -3 /* [.Ldata041]-0x3 */      # 2ad5: 52c3fd
            bnez         a5, .Lbr267                           # 2ad8: 562510
            memw                                               # 2adb: c02000
            l32i         a7, a0, 0x234 /* [0x60000834] */      # 2ade: 72208d
            and          a7, a7, a6                            # 2ae1: 607710
            or           a7, a7, a8                            # 2ae4: 807720
            memw                                               # 2ae7: c02000
            s32i         a7, a0, 0x234 /* a7 -> [0x60000834] */ # 2aea: 72608d
            j            .Lbr264                               # 2aed: c62a00
.Lbr258:    movi         a5, 0x60000200                        # 2af0: 519cff
            movi         a9, 0 /* 0x00000000 */                # 2af3: 0c09
            addi         a10, a3, -1 /* [.Ldata039]-0x1 */     # 2af5: 0ba3
            beqz         a10, .Lbr268                          # 2af7: 16ba0f
            addi         a11, a3, -4 /* [.Ldata039]-0x4 */     # 2afa: b2c3fc
            beqz         a11, .Lbr268                          # 2afd: 165b0f
            addi         a2, a3, -3 /* [.Ldata039]-0x3 */      # 2b00: 22c3fd
            beqz         a2, .Lbr272                           # 2b03: 167215
            addi         a10, a3, -5 /* [.Ldata039]-0x5 */     # 2b06: a2c3fb
            beqz         a10, .Lbr272                          # 2b09: 161a15
.Lbr259:    movi         a3, -497 /* 0xfffffe0f */             # 2b0c: 32ae0f
            memw                                               # 2b0f: c02000
            l32i         a5, a0, 0x208 /* [0x60000808] */      # 2b12: 522082
            and          a5, a5, a3                            # 2b15: 305510
            or           a5, a5, a7                            # 2b18: 705520
            memw                                               # 2b1b: c02000
            s32i         a5, a0, 0x208 /* a5 -> [0x60000808] */ # 2b1e: 526082
            memw                                               # 2b21: c02000
            l32i         a2, a0, 0x20c /* [0x6000080c] */      # 2b24: 222083
            and          a2, a2, a3                            # 2b27: 302210
            or           a2, a2, a7                            # 2b2a: 702220
            memw                                               # 2b2d: c02000
            s32i         a2, a0, 0x20c /* a2 -> [0x6000080c] */ # 2b30: 226083
            l8ui         a11, a4, 127 /* [.Ldata040] */        # 2b33: b2047f
            bltui        a11, 2, .Lbr260                       # 2b36: b62b26
            memw                                               # 2b39: c02000
            l32i         a9, a0, 0x214 /* [0x60000814] */      # 2b3c: 922085
            and          a9, a9, a6                            # 2b3f: 609910
            or           a9, a9, a8                            # 2b42: 809920
            memw                                               # 2b45: c02000
            s32i         a9, a0, 0x214 /* a9 -> [0x60000814] */ # 2b48: 926085
            memw                                               # 2b4b: c02000
            l32i         a7, a0, 0x234 /* [0x60000834] */      # 2b4e: 72208d
            and          a7, a7, a6                            # 2b51: 607710
            or           a7, a7, a8                            # 2b54: 807720
            memw                                               # 2b57: c02000
            s32i         a7, a0, 0x234 /* a7 -> [0x60000834] */ # 2b5a: 72608d
            j            .Lbr261                               # 2b5d: 060800
.Lbr260:    memw                                               # 2b60: c02000
            l32i         a11, a0, 0x214 /* [0x60000814] */     # 2b63: b22085
            and          a11, a11, a6                          # 2b66: 60bb10
            or           a11, a11, a7                          # 2b69: 70bb20
            memw                                               # 2b6c: c02000
            s32i         a11, a0, 0x214 /* a11 -> [0x60000814] */ # 2b6f: b26085
            memw                                               # 2b72: c02000
            l32i         a10, a0, 0x234 /* [0x60000834] */     # 2b75: a2208d
            and          a10, a10, a6                          # 2b78: 60aa10
            memw                                               # 2b7b: c02000
            s32i         a10, a0, 0x234 /* a10 -> [0x60000834] */ # 2b7e: a2608d
.Lbr261:    l8ui         a3, a4, 126 /* [.Ldata039] */         # 2b81: 32047e
            bnei         a3, 1, .Lbr262                        # 2b84: 661302
            j            .Lbr270                               # 2b87: 062300
.Lbr262:    bnei         a3, 3, .Lbr263                        # 2b8a: 663302
            j            .Lbr270                               # 2b8d: 862100
.Lbr263:    addi         a0, a3, -4 /* [.Ldata039]-0x4 */      # 2b90: 02c3fc
            beqz         a0, .Lbr273                           # 2b93: 16f00d
            addi         a2, a3, -5 /* [.Ldata039]-0x5 */      # 2b96: 22c3fb
            beqz         a2, .Lbr273                           # 2b99: 16920d
.Lbr264:    movi         a0, .Label012                         # 2b9c: 0172ff
            movi         a4, 0x60000a00                        # 2b9f: 4172ff
            l8ui         a0, a0, 125 /* [.Ldata038] */         # 2ba2: 02007d
            movi         a3, 0xffff0fff                        # 2ba5: 3171ff
            bnei         a0, 1, .Lbr265                        # 2ba8: 661015
            movi         a5, 0x00001000                        # 2bab: 5171ff
            memw                                               # 2bae: c02000
            l32i         a2, a4, 4 /* [0x60000a04] */          # 2bb1: 2814
            and          a2, a2, a3                            # 2bb3: 302210
            or           a2, a2, a5                            # 2bb6: 502220
            memw                                               # 2bb9: c02000
            s32i         a2, a4, 4 /* a2 -> [0x60000a04] */    # 2bbc: 2914
            j            .Lbr266                               # 2bbe: 460500
.Lbr265:    bnei         a0, 2, .Lbr266                        # 2bc1: 662012
            movi         a6, 0x00002000                        # 2bc4: 616cff
            memw                                               # 2bc7: c02000
            l32i         a5, a4, 4 /* [0x60000a04] */          # 2bca: 5814
            and          a5, a5, a3                            # 2bcc: 305510
            or           a5, a5, a6                            # 2bcf: 605520
            memw                                               # 2bd2: c02000
            s32i         a5, a4, 4 /* a5 -> [0x60000a04] */    # 2bd5: 5914
.Lbr266:    l32i         a0, sp, 0 /* [(local0)] */            # 2bd7: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 2bd9: 12c110
            ret                                                # 2bdc: 0df0
.Lbr267:    bnei         a3, 2, .Lbr264                        # 2bde: 6623ba
            memw                                               # 2be1: c02000
            l32i         a7, a0, 0x214 /* [0x60000814] */      # 2be4: 722085
            and          a7, a7, a6                            # 2be7: 607710
            or           a7, a7, a8                            # 2bea: 807720
            memw                                               # 2bed: c02000
            s32i         a7, a0, 0x214 /* a7 -> [0x60000814] */ # 2bf0: 726085
            j            .Lbr264                               # 2bf3: 46e9ff
.Lbr268:    l8ui         a3, a4, 127 /* [.Ldata040] */         # 2bf6: 32047f
            addi         a10, a3, -3 /* [.Ldata040]-0x3 */     # 2bf9: a2c3fd
            beqz         a10, .Lbr277                          # 2bfc: 16fa0c
            addi         a11, a3, -5 /* [.Ldata040]-0x5 */     # 2bff: b2c3fb
            beqz         a11, .Lbr277                          # 2c02: 169b0c
            bgeui        a3, 2, .Lbr269                        # 2c05: f62302
            j            .Lbr275                               # 2c08: 462c00
.Lbr269:    movi         a2, 0x010e0000                        # 2c0b: 215bff
            memw                                               # 2c0e: c02000
            s32i         a2, a5, 0x100 /* 0x010e0000 -> [0x60000300] */ # 2c11: 226540
            j            .Lbr259                               # 2c14: 06bdff
.Lbr270:    l8ui         a3, a4, 127 /* [.Ldata040] */         # 2c17: 32047f
            bnei         a3, 1, .Lbr271                        # 2c1a: 66131e
            movi         a2, 1 /* 0x00000001 */                # 2c1d: 0c12
            movi         a3, 0 /* 0x00000000 */                # 2c1f: 0c03
            movi         a4, 1 /* 0x00000001 */                # 2c21: 0c14
            movi         a5, 0 /* 0x00000000 */                # 2c23: 0c05
            call0        sdk_gpio_output_set                   # 2c25: 0159ffc0
                                                               # 2c29: 0000
            movi         a2, 0 /* 0x00000000 */                # 2c2b: 0c02
            movi         a3, 8 /* 0x00000008 */                # 2c2d: 0c83
            movi         a4, 8 /* 0x00000008 */                # 2c2f: 0c84
            movi         a5, 0 /* 0x00000000 */                # 2c31: 0c05
            call0        sdk_gpio_output_set                   # 2c33: 0157ffc0
                                                               # 2c37: 0000
            j            .Lbr264                               # 2c39: c6d7ff
.Lbr271:    bnez         a3, .Lbr264                           # 2c3c: 56c3f5
            movi         a2, 0 /* 0x00000000 */                # 2c3f: 0c02
            movi         a3, 1 /* 0x00000001 */                # 2c41: 0c13
            movi         a4, 1 /* 0x00000001 */                # 2c43: 0c14
            movi         a5, 0 /* 0x00000000 */                # 2c45: 0c05
            call0        sdk_gpio_output_set                   # 2c47: 0153ffc0
                                                               # 2c4b: 0000
            movi         a2, 8 /* 0x00000008 */                # 2c4d: 0c82
            movi         a3, 0 /* 0x00000000 */                # 2c4f: 0c03
            movi         a4, 8 /* 0x00000008 */                # 2c51: 0c84
            movi         a5, 0 /* 0x00000000 */                # 2c53: 0c05
            call0        sdk_gpio_output_set                   # 2c55: 0150ffc0
                                                               # 2c59: 0000
            j            .Lbr264                               # 2c5b: 46cfff
.Lbr272:    l8ui         a3, a4, 127 /* [.Ldata040] */         # 2c5e: 32047f
            beqi         a3, 3, .Lbr278                        # 2c61: 263376
            beqi         a3, 5, .Lbr278                        # 2c64: 265373
            bltui        a3, 2, .Lbr276                        # 2c67: b6235b
            movi         a3, 0x010d0000                        # 2c6a: 3144ff
            memw                                               # 2c6d: c02000
            s32i         a3, a5, 0x100 /* 0x010d0000 -> [0x60000300] */ # 2c70: 326540
            j            .Lbr259                               # 2c73: 46a5ff
.Lbr273:    l8ui         a3, a4, 127 /* [.Ldata040] */         # 2c76: 32047f
            bnei         a3, 1, .Lbr274                        # 2c79: 66131e
            movi         a2, 0 /* 0x00000000 */                # 2c7c: 0c02
            movi         a3, 1 /* 0x00000001 */                # 2c7e: 0c13
            movi         a4, 1 /* 0x00000001 */                # 2c80: 0c14
            movi         a5, 0 /* 0x00000000 */                # 2c82: 0c05
            call0        sdk_gpio_output_set                   # 2c84: 0146ffc0
                                                               # 2c88: 0000
            movi         a2, 8 /* 0x00000008 */                # 2c8a: 0c82
            movi         a3, 0 /* 0x00000000 */                # 2c8c: 0c03
            movi         a4, 8 /* 0x00000008 */                # 2c8e: 0c84
            movi         a5, 0 /* 0x00000000 */                # 2c90: 0c05
            call0        sdk_gpio_output_set                   # 2c92: 0143ffc0
                                                               # 2c96: 0000
            j            .Lbr264                               # 2c98: 06c0ff
.Lbr274:    bnez         a3, .Lbr264                           # 2c9b: 56d3ef
            movi         a2, 1 /* 0x00000001 */                # 2c9e: 0c12
            movi         a3, 0 /* 0x00000000 */                # 2ca0: 0c03
            movi         a4, 1 /* 0x00000001 */                # 2ca2: 0c14
            movi         a5, 0 /* 0x00000000 */                # 2ca4: 0c05
            call0        sdk_gpio_output_set                   # 2ca6: 013fffc0
                                                               # 2caa: 0000
            movi         a2, 0 /* 0x00000000 */                # 2cac: 0c02
            movi         a3, 8 /* 0x00000008 */                # 2cae: 0c83
            movi         a4, 8 /* 0x00000008 */                # 2cb0: 0c84
            movi         a5, 0 /* 0x00000000 */                # 2cb2: 0c05
            call0        sdk_gpio_output_set                   # 2cb4: 013dffc0
                                                               # 2cb8: 0000
            j            .Lbr264                               # 2cba: 86b7ff
.Lbr275:    memw                                               # 2cbd: c02000
            s32i         a9, a5, 0x100 /* 0x00000000 -> [0x60000300] */ # 2cc0: 926540
            j            .Lbr259                               # 2cc3: 4691ff
.Lbr276:    memw                                               # 2cc6: c02000
            s32i         a9, a5, 0x100 /* 0x00000000 -> [0x60000300] */ # 2cc9: 926540
            j            .Lbr259                               # 2ccc: 068fff
.Lbr277:    movi         a9, 0x03de0000                        # 2ccf: 912cff
            memw                                               # 2cd2: c02000
            s32i         a9, a5, 0x100 /* 0x03de0000 -> [0x60000300] */ # 2cd5: 926540
            j            .Lbr259                               # 2cd8: 068cff
.Lbr278:    movi         a10, 0x03ed0000                       # 2cdb: a12aff
            memw                                               # 2cde: c02000
            s32i         a10, a5, 0x100 /* 0x03ed0000 -> [0x60000300] */ # 2ce1: a26540
            j            .Lbr259                               # 2ce4: 0689ff

            .literal_position                                  # 2ce8: d8010000
                                                               # 2cec: 00000000
                                                               # 2cf0: d8010000
                                                               # 2cf4: 00020060
                                                               # 2cf8: 00000000
                                                               # 2cfc: d8010000
                                                               # 2d00: 803fe00f
                                                               # 2d04: 00020060
                                                               # 2d08: ffffff0f
                                                               # 2d0c: ffffcfff

# Function @ .irom0.text+0x2d10
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_tx_cont_en
            .type        sdk_tx_cont_en, @function
sdk_tx_cont_en:
            addi         sp, sp, -16 /* (local0) */            # 2d10: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 2d13: 0901
            movi         a0, .Ldata021                         # 2d15: 01f4ff
            l8ui         a2, a0, 127 /* [.Ldata092] */         # 2d18: 22007f
            bnez         a2, .Lbr279                           # 2d1b: 569208
            movi         a0, sdk_g_phyFuns                     # 2d1e: 01f3ff
            movi         a2, 102 /* 0x00000066 */              # 2d21: 22a066
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 2d24: 0800
            movi         a3, 3 /* 0x00000003 */                # 2d26: 0c33
            l32i         a0, a0, 144 /* [[sdk_g_phyFuns]+0x90] */ # 2d28: 022024
            movi         a4, 1 /* 0x00000001 */                # 2d2b: 0c14
            callx0       a0 /* [[sdk_g_phyFuns]+0x90] */       # 2d2d: c00000
            movi         a3, .Ldata021                         # 2d30: 31f0ff
            s32i         a2, a3, 132 /* a2 -> [.Ldata093] */   # 2d33: 226321
            movi         a2, 0x60000200                        # 2d36: 21efff
            memw                                               # 2d39: c02000
            l32i         a5, a2, 0x394 /* [0x60000594] */      # 2d3c: 5222e5
            s32i         a5, a3, 136 /* [0x60000594] -> [.Ldata094] */ # 2d3f: 526322
            memw                                               # 2d42: c02000
            l32i         a4, a2, 0x398 /* [0x60000598] */      # 2d45: 4222e6
            s32i         a4, a3, 140 /* [0x60000598] -> [.Ldata095] */ # 2d48: 426323
            memw                                               # 2d4b: c02000
            movi         a4, 1 /* 0x00000001 */                # 2d4e: 0c14
            movi         a5, 5 /* 0x00000005 */                # 2d50: 0c55
            movi         a6, 0 /* 0x00000000 */                # 2d52: 0c06
            movi         a7, 60 /* 0x0000003c */               # 2d54: 3cc7
            l32i         a2, a2, 0x39c /* [0x6000059c] */      # 2d56: 2222e7
            movi         a0, sdk_g_phyFuns                     # 2d59: 01e7ff
            s32i         a2, a3, 144 /* [0x6000059c] -> [.Ldata096] */ # 2d5c: 226324
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 2d5f: 0800
            movi         a2, 102 /* 0x00000066 */              # 2d61: 22a066
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 2d64: 022027
            movi         a3, 3 /* 0x00000003 */                # 2d67: 0c33
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 2d69: c00000
            movi         a0, .Ldata021                         # 2d6c: 01e4ff
            movi         a2, 0x0fe03f80                        # 2d6f: 21e4ff
            memw                                               # 2d72: c02000
            movi         a7, 0x60000200                        # 2d75: 71e3ff
            l32i         a11, a7, 0x39c /* [0x6000059c] */     # 2d78: b227e7
            or           a11, a11, a2                          # 2d7b: 20bb20
            memw                                               # 2d7e: c02000
            s32i         a11, a7, 0x39c /* a11 -> [0x6000059c] */ # 2d81: b267e7
            movi         a10, 0x0fffffff                       # 2d84: a1e1ff
            memw                                               # 2d87: c02000
            l32i         a9, a7, 0x398 /* [0x60000598] */      # 2d8a: 9227e6
            or           a9, a9, a10                           # 2d8d: a09920
            memw                                               # 2d90: c02000
            s32i         a9, a7, 0x398 /* a9 -> [0x60000598] */ # 2d93: 9267e6
            movi         a8, 0xffcfffff                        # 2d96: 81ddff
            memw                                               # 2d99: c02000
            l32i         a6, a7, 0x394 /* [0x60000594] */      # 2d9c: 6227e5
            and          a6, a6, a8                            # 2d9f: 806610
            memw                                               # 2da2: c02000
            s32i         a6, a7, 0x394 /* a6 -> [0x60000594] */ # 2da5: 6267e5
.Lbr279:    movi         a3, 1 /* 0x00000001 */                # 2da8: 0c13
            s8i          a3, a0, 127 /* 0x01 -> [.Ldata092] */ # 2daa: 32407f
            l32i         a0, sp, 0 /* [(local0)] */            # 2dad: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 2daf: 12c110
            ret                                                # 2db2: 0df0

            .literal_position                                  # 2db4: dc010000
                                                               # 2db8: 00000000
                                                               # 2dbc: dc010000
                                                               # 2dc0: 00020060
                                                               # 2dc4: dc010000

# Function @ .irom0.text+0x2dc8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_tx_cont_dis
            .type        sdk_tx_cont_dis, @function
sdk_tx_cont_dis:
            addi         sp, sp, -16 /* (local0) */            # 2dc8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 2dcb: 0901
            movi         a0, .Ldata022                         # 2dcd: 01f9ff
            l8ui         a2, a0, 123 /* [.Ldata092] */         # 2dd0: 22007b
            bnei         a2, 1, .Lbr280                        # 2dd3: 661238
            movi         a2, 102 /* 0x00000066 */              # 2dd6: 22a066
            movi         a3, 3 /* 0x00000003 */                # 2dd9: 0c33
            movi         a0, sdk_g_phyFuns                     # 2ddb: 01f7ff
            movi         a4, 1 /* 0x00000001 */                # 2dde: 0c14
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 2de0: 0800
            movi         a5, .Ldata022                         # 2de2: 51f6ff
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ # 2de5: 022026
            l8ui         a5, a5, 128 /* [.Ldata093] */         # 2de8: 520580
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       # 2deb: c00000
            movi         a0, .Ldata022                         # 2dee: 01f5ff
            movi         a3, 0x60000200                        # 2df1: 31f3ff
            l32i         a5, a0, 132 /* [.Ldata094] */         # 2df4: 522021
            memw                                               # 2df7: c02000
            s32i         a5, a3, 0x394 /* [.Ldata094] -> [0x60000594] */ # 2dfa: 5263e5
            l32i         a4, a0, 136 /* [.Ldata095] */         # 2dfd: 422022
            memw                                               # 2e00: c02000
            s32i         a4, a3, 0x398 /* [.Ldata095] -> [0x60000598] */ # 2e03: 4263e6
            l32i         a2, a0, 140 /* [.Ldata096] */         # 2e06: 222023
            memw                                               # 2e09: c02000
            s32i         a2, a3, 0x39c /* [.Ldata096] -> [0x6000059c] */ # 2e0c: 2263e7
.Lbr280:    movi         a6, 0 /* 0x00000000 */                # 2e0f: 0c06
            s8i          a6, a0, 123 /* 0x00 -> [.Ldata092] */ # 2e11: 62407b
            l32i         a0, sp, 0 /* [(local0)] */            # 2e14: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 2e16: 12c110
            ret                                                # 2e19: 0df0

            .balign      4
# Function @ .irom0.text+0x2e1c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_tx_cont_cfg
            .type        sdk_tx_cont_cfg, @function
sdk_tx_cont_cfg:
            addi         sp, sp, -16 /* (local0) */            # 2e1c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 2e1f: 0901
            bnei         a2, 1, .Lbr281                        # 2e21: 661205
            call0        sdk_tx_cont_en                        # 2e24: 050000
            j            .Lbr282                               # 2e27: 860000
.Lbr281:    call0        sdk_tx_cont_dis                       # 2e2a: 050000
.Lbr282:    l32i         a0, sp, 0 /* [(local0)] */            # 2e2d: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 2e2f: 12c110
            ret                                                # 2e32: 0df0

            .literal_position                                  # 2e34: 00000000
                                                               # 2e38: 00feef3f
                                                               # 2e3c: 00000000
                                                               # 2e40: 0c000000
                                                               # 2e44: 00000000
                                                               # 2e48: 00004000
                                                               # 2e4c: cc010000
                                                               # 2e50: 0c000000
                                                               # 2e54: 00000000
                                                               # 2e58: 000af23f
                                                               # 2e5c: 0c000000
                                                               # 2e60: 00780000
                                                               # 2e64: 000a0060
                                                               # 2e68: 00000000
                                                               # 2e6c: cc010000
                                                               # 2e70: 00000000
                                                               # 2e74: 00000000
                                                               # 2e78: 00000000
                                                               # 2e7c: 00000000
                                                               # 2e80: 00000000
                                                               # 2e84: 00000000
                                                               # 2e88: 00000000
                                                               # 2e8c: 00000000
                                                               # 2e90: 00000000
                                                               # 2e94: 00000000

# Function @ .irom0.text+0x2e98
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word[3]   @ -0x1c
#     (local2):  word      @ -0x10
#     (local3):  word[3]   @ -0xc
            .global      sdk_chip_v6_initialize_bb
            .type        sdk_chip_v6_initialize_bb, @function
sdk_chip_v6_initialize_bb:
            addi         sp, sp, -32 /* (local0) */            # 2e98: 12c1e0
            s32i         a12, sp, 20 /* a12 -> [(local3)] */   # 2e9b: c951
            s32i         a0, sp, 16 /* a0 -> [(local2)] */     # 2e9d: 0941
            movi         a2, 0x3feffe00                        # 2e9f: 21e6ff
            movi         a0, sdk_g_phyFuns                     # 2ea2: 01e4ff
            memw                                               # 2ea5: c02000
            l32i         a4, a2, 0x25c /* [0x3ff0005c] */      # 2ea8: 422297
            memw                                               # 2eab: c02000
            l32i         a3, a2, 0x258 /* [0x3ff00058] */      # 2eae: 322296
            memw                                               # 2eb1: c02000
            ssai         24                                    # 2eb4: 104840
            movi         a3, 1 /* 0x00000001 */                # 2eb7: 0c13
            movi         a4, 7 /* 0x00000007 */                # 2eb9: 0c74
            movi         a5, 3 /* 0x00000003 */                # 2ebb: 0c35
            movi         a6, 2 /* 0x00000002 */                # 2ebd: 0c26
            movi         a7, 0 /* 0x00000000 */                # 2ebf: 0c07
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 2ec1: 0800
            l32i         a2, a2, 0x25c /* [0x3ff0005c] */      # 2ec3: 222297
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 2ec6: 022027
            movi         a2, 97 /* 0x00000061 */               # 2ec9: 22a061
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 2ecc: c00000
            call0        sdk_phy_pbus_soc_cfg                  # 2ecf: 050000
            movi         a2, 119 /* 0x00000077 */              # 2ed2: 22a077
            movi         a3, 0 /* 0x00000000 */                # 2ed5: 0c03
            movi         a4, 16 /* 0x00000010 */               # 2ed7: 1c04
            movi         a0, sdk_g_phyFuns                     # 2ed9: 01d8ff
            movi         a5, 0 /* 0x00000000 */                # 2edc: 0c05
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 2ede: 0800
            movi         a6, 0 /* 0x00000000 */                # 2ee0: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 2ee2: 022027
            movi         a7, 1 /* 0x00000001 */                # 2ee5: 0c17
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 2ee7: c00000
            call0        sdk_rc_cal                            # 2eea: 01e2ffc0
                                                               # 2eee: 0000
            movi         a3, sdk_chip6_sleep_params            # 2ef0: 31d4ff
            mov          a2, a3 /* sdk_chip6_sleep_params */   # 2ef3: 2d03
            addi         a3, a3, 4 /* .Label001 */             # 2ef5: 4b33
            call0        sdk_init_cal_dcoffset                 # 2ef7: 01e0ffc0
                                                               # 2efb: 0000
            movi         a12, sdk_rxiq_compute_num             # 2efd: c1d1ff
            l32i         a4, a12, 12 /* [sdk_chip6_sleep_params] */ # 2f00: 483c
            bbsi         a4, 22, .Lbr283                       # 2f02: 67f411
            movi         a2, 0 /* 0x00000000 */                # 2f05: 0c02
            call0        sdk_txpwr_offset                      # 2f07: 01ddffc0
                                                               # 2f0b: 0000
            movi         a7, 0x00400000                        # 2f0d: 71ceff
            l32i         a6, a12, 12 /* [sdk_chip6_sleep_params] */ # 2f10: 683c
            or           a6, a6, a7                            # 2f12: 706620
            s32i         a6, a12, 12 /* a6 -> [sdk_chip6_sleep_params] */ # 2f15: 693c
.Lbr283:    call0        sdk_tx_cap_init                       # 2f17: 050000
            movi         a8, .Ldata019                         # 2f1a: 81ccff
            l8ui         a8, a8, 118 /* [.Ldata076] */         # 2f1d: 820876
            beqz         a8, .Lbr284                           # 2f20: 8c68
            movi         a2, 0 /* 0x00000000 */                # 2f22: 0c02
            call0        sdk_tx_pwctrl_init                    # 2f24: 050000
            j            .Lbr285                               # 2f27: 060100
.Lbr284:    movi         a2, 1 /* 0x00000001 */                # 2f2a: 0c12
            call0        sdk_tx_pwctrl_init                    # 2f2c: 050000
.Lbr285:    movi         a5, 64 /* 0x00000040 */               # 2f2f: 4c05
            movi         a7, 0 /* 0x00000000 */                # 2f31: 0c07
            movi         a6, 0 /* 0x00000000 */                # 2f33: 0c06
            movi         a9, 1 /* 0x00000001 */                # 2f35: 0c19
            movi         a10, 0 /* 0x00000000 */               # 2f37: 0c0a
            movi         a4, .Ldata001                         # 2f39: 41c6ff
            movi         a2, sdk_chip6_sleep_params            # 2f3c: 21c5ff
            l8ui         a8, a12, 115 /* [.Ldata011] */        # 2f3f: 820c73
            addi         a3, a2, 20 /* .bss+0x20 */            # 2f42: 32c214
            slli         a8, a8, 24                            # 2f45: 808801
            l16ui        a4, a4, 2 /* [sdk_tx_rf_ana_gain] */  # 2f48: 421401
            s32i         a10, sp, 0 /* 0x00000000 -> [(local0)] */ # 2f4b: a901
            s32i         a9, sp, 4 /* 0x00000001 -> [(local1)] */ # 2f4d: 9911
            srai         a8, a8, 24                            # 2f4f: 808831
            addi         a8, a8, 31                            # 2f52: 82c81f
            slli         a8, a8, 24                            # 2f55: 808801
            srai         a8, a8, 24                            # 2f58: 808831
            movgez       a6, a8, a8                            # 2f5b: 8068b3
            extui        a6, a6, 0, 8                          # 2f5e: 606074
            call0        sdk_ram_rfcal_txiq                    # 2f61: 01c7ffc0
                                                               # 2f65: 0000
            l32i         a9, a12, 12 /* [sdk_chip6_sleep_params] */ # 2f67: 983c
            bbsi         a9, 27, .Lbr286                       # 2f69: b7f907
            movi         a2, 6 /* 0x00000006 */                # 2f6c: 0c62
            call0        sdk_chip_v6_set_chan                  # 2f6e: 01c5ffc0
                                                               # 2f72: 0000
.Lbr286:    movi         a2, 0 /* 0x00000000 */                # 2f74: 0c02
            call0        sdk_dpd_init                          # 2f76: 01c4ffc0
                                                               # 2f7a: 0000
            call0        sdk_phy_bb_rx_cfg                     # 2f7c: 050000
            movi         a2, 2 /* 0x00000002 */                # 2f7f: 0c22
            movi         a0, 0x3ff20a00                        # 2f81: 01b5ff
            memw                                               # 2f84: c02000
            l32i         a11, a0, 0x270 /* [0x3ff20c70] */     # 2f87: b2209c
            or           a11, a11, a2                          # 2f8a: 20bb20
            memw                                               # 2f8d: c02000
            movi         a2, 1 /* 0x00000001 */                # 2f90: 0c12
            movi         a3, 7 /* 0x00000007 */                # 2f92: 0c73
            movi         a4, 5 /* 0x00000005 */                # 2f94: 0c54
            movi         a5, 0x00007800                        # 2f96: 51b2ff
            movi         a6, 1 /* 0x00000001 */                # 2f99: 0c16
            movi         a7, 0 /* 0x00000000 */                # 2f9b: 0c07
            s32i         a11, a0, 0x270 /* a11 -> [0x3ff20c70] */ # 2f9d: b2609c
            movi         a10, sdk_chip6_sleep_params           # 2fa0: a1afff
            s32i         a10, sp, 0 /* sdk_chip6_sleep_params -> [(local0)] */ # 2fa3: a901
            call0        sdk_noise_init                        # 2fa5: 050000
            call0        sdk_tx_pwctrl_bg_init                 # 2fa8: 01b9ffc0
                                                               # 2fac: 0000
            l32i         a3, a12, 12 /* [sdk_chip6_sleep_params] */ # 2fae: 383c
            bbci         a3, 27, .Lbr287                       # 2fb0: b7732d
            call0        sdk_wait_rfpll_cal_end                # 2fb3: 01b7ffc0
                                                               # 2fb7: 0000
            movi         a6, -1025 /* 0xfffffbff */            # 2fb9: 62abff
            movi         a5, 0x60000a00                        # 2fbc: 51aaff
            memw                                               # 2fbf: c02000
            l32i         a4, a5, 0x340 /* [0x60000d40] */      # 2fc2: 4225d0
            and          a4, a4, a6                            # 2fc5: 604410
            memw                                               # 2fc8: c02000
            s32i         a4, a5, 0x340 /* a4 -> [0x60000d40] */ # 2fcb: 4265d0
            movi         a2, 0 /* 0x00000000 */                # 2fce: 0c02
            call0        sdk_chip_v6_rxmax_ext                 # 2fd0: 050000
            movi         a0, sdk_g_phyFuns                     # 2fd3: 01a5ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 2fd6: 0800
            l32i         a0, a0, 88 /* [[sdk_g_phyFuns]+0x58] */ # 2fd8: 022016
            l16si        a2, a12, 88 /* [.Ldata002] */         # 2fdb: 229c2c
            callx0       a0 /* [[sdk_g_phyFuns]+0x58] */       # 2fde: c00000
.Lbr287:    movi         a5, 1 /* 0x00000001 */                # 2fe1: 0c15
            movi         a12, .Ldata019                        # 2fe3: c1a2ff
            movi         a9, sdk_g_phyFuns                     # 2fe6: 91a2ff
            l8ui         a2, a12, 118 /* [.Ldata076] */        # 2fe9: 220c76
            l8ui         a3, a12, 138 /* [sdk_txbk_dpdby_flag] */ # 2fec: 320c8a
            l32i         a9, a9, 0 /* [sdk_g_phyFuns] */       # 2fef: 9809
            l8ui         a4, a12, 133 /* [.Ldata091] */        # 2ff1: 420c85
            l32i         a9, a9, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 2ff4: 922927
            movnez       a4, a5, a4                            # 2ff7: 404593
            or           a3, a3, a4                            # 2ffa: 403320
            or           a2, a2, a3                            # 2ffd: 302220
            beqz         a2, .Lbr288                           # 3000: 8cf2
            movi         a2, 119 /* 0x00000077 */              # 3002: 22a077
            movi         a3, 0 /* 0x00000000 */                # 3005: 0c03
            movi         a4, 15 /* 0x0000000f */               # 3007: 0cf4
            movi         a6, 1 /* 0x00000001 */                # 3009: 0c16
            movi         a7, 1 /* 0x00000001 */                # 300b: 0c17
            callx0       a9 /* [[sdk_g_phyFuns]+0x9c] */       # 300d: c00900
            j            .Lbr289                               # 3010: 460400
.Lbr288:    movi         a2, 119 /* 0x00000077 */              # 3013: 22a077
            movi         a3, 0 /* 0x00000000 */                # 3016: 0c03
            movi         a4, 15 /* 0x0000000f */               # 3018: 0cf4
            l8ui         a7, a12, 117 /* [.Ldata075] */        # 301a: 720c75
            movi         a6, 1 /* 0x00000001 */                # 301d: 0c16
            extui        a7, a7, 0, 1                          # 301f: 707004
            callx0       a9 /* [[sdk_g_phyFuns]+0x9c] */       # 3022: c00900
.Lbr289:    l8ui         a2, a12, 118 /* [.Ldata076] */        # 3025: 220c76
            l8ui         a3, a12, 119 /* [.Ldata077] */        # 3028: 320c77
            l8ui         a4, a12, 120 /* [.Ldata078] */        # 302b: 420c78
            call0        sdk_low_power_set                     # 302e: 0199ffc0
                                                               # 3032: 0000
            movi         a2, 0 /* 0x00000000 */                # 3034: 0c02
            l32i         a12, sp, 20 /* [(local3)] */          # 3036: c851
            l32i         a0, sp, 16 /* [(local2)] */           # 3038: 0841
            addi         sp, sp, 32 /* (top of frame) */       # 303a: 12c120
            ret           /* 0x00000000 */                     # 303d: 0df0

            .literal_position                                  # 3040: 28020000
                                                               # 3044: 10000000
                                                               # 3048: 00000000
                                                               # 304c: 00000000
                                                               # 3050: 00000000
                                                               # 3054: ffffefff
                                                               # 3058: 00000000
                                                               # 305c: 28020000
                                                               # 3060: 80020000
                                                               # 3064: 88000000
                                                               # 3068: 00000000
                                                               # 306c: 0c000000
                                                               # 3070: 7c000000
                                                               # 3074: 00000000
                                                               # 3078: 00000000

# Function @ .irom0.text+0x307c
# Local variables/stack:
#     (local0):  word      @ -0x30
#     (local1):  word      @ -0x2c
#     (local2):  word      @ -0x28
#     (local3):  word      @ -0x24
#     (local4):  word      @ -0x20
#     (local5):  word      @ -0x1c
#     (local6):  word      @ -0x18
#     (local7):  word      @ -0x14
#     (local8):  word[4]   @ -0x10
            .global      sdk_periodic_cal
            .type        sdk_periodic_cal, @function
sdk_periodic_cal:
            movi         a5, .Ldata051                         # 307c: 51f1ff
            addi         sp, sp, -48 /* (local0) */            # 307f: 12c1d0
            s32i         a12, sp, 28 /* a12 -> [(local7)] */   # 3082: c971
            s32i         a13, sp, 32 /* a13 -> [(local8)] */   # 3084: d981
            s32i         a0, sp, 24 /* a0 -> [(local6)] */     # 3086: 0961
            l8ui         a2, a5, 39 /* [.Ldata089] */          # 3088: 220527
            l32i         a3, a5, 68 /* [sdk_periodic_cal_dc_num] */ # 308b: 322511
            movi         a0, 0 /* 0x00000000 */                # 308e: 0c00
            s32i         a0, sp, 16 /* 0x00000000 -> [(local4)] */ # 3090: 0941
            addi         a3, a3, 1 /* [sdk_periodic_cal_dc_num]+0x1 */ # 3092: 1b33
            s32i         a3, a5, 68 /* [sdk_periodic_cal_dc_num]+0x1 -> [sdk_periodic_cal_dc_num] */ # 3094: 326511
            bne          a2, a3, .Lbr290                       # 3097: 379207
            movi         a13, 1 /* 0x00000001 */               # 309a: 0c1d
            s32i         a0, a5, 68 /* 0x00000000 -> [sdk_periodic_cal_dc_num] */ # 309c: 026511
            j            .Lbr291                               # 309f: 460000
.Lbr290:    mov          a13, a0 /* 0x00000000 */              # 30a2: dd00
.Lbr291:    s8i          a13, a5, 44 /* a13 -> [sdk_do_pwctrl_flag] */ # 30a4: d2452c
            addi         a2, sp, 16 /* (local4) */             # 30a7: 22c110
            movi         a3, .Label001                         # 30aa: 31e6ff
            call0        sdk_init_cal_dcoffset                 # 30ad: 01f1ffc0
                                                               # 30b1: 0000
            movi         a12, sdk_rxiq_compute_num             # 30b3: c1e5ff
            beqz         a13, .Lbr294                          # 30b6: 162d08
            movi         a2, 119 /* 0x00000077 */              # 30b9: 22a077
            movi         a3, 0 /* 0x00000000 */                # 30bc: 0c03
            movi         a4, 15 /* 0x0000000f */               # 30be: 0cf4
            movi         a5, 1 /* 0x00000001 */                # 30c0: 0c15
            movi         a6, 1 /* 0x00000001 */                # 30c2: 0c16
            movi         a0, sdk_g_phyFuns                     # 30c4: 01e2ff
            l8ui         a13, a12, 90 /* [.Ldata003] */        # 30c7: d20c5a
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 30ca: 0800
            slli         a13, a13, 24                          # 30cc: 80dd01
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ # 30cf: 022025
            srai         a13, a13, 24                          # 30d2: d0d831
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       # 30d5: c00000
            movi         a3, 0 /* 0x00000000 */                # 30d8: 0c03
            movi         a4, 15 /* 0x0000000f */               # 30da: 0cf4
            movi         a5, 1 /* 0x00000001 */                # 30dc: 0c15
            movi         a6, 1 /* 0x00000001 */                # 30de: 0c16
            movi         a0, sdk_g_phyFuns                     # 30e0: 01dcff
            movi         a7, 1 /* 0x00000001 */                # 30e3: 0c17
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 30e5: 0800
            s32i         a2, sp, 20 /* a2 -> [(local5)] */     # 30e7: 2951
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 30e9: 022027
            movi         a2, 119 /* 0x00000077 */              # 30ec: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 30ef: c00000
            movi         a4, 0xffefffff                        # 30f2: 41d8ff
            l32i         a3, a12, 12 /* [sdk_chip6_sleep_params] */ # 30f5: 383c
            movi         a2, 1 /* 0x00000001 */                # 30f7: 0c12
            and          a3, a3, a4                            # 30f9: 403310
            s32i         a3, a12, 12 /* a3 -> [sdk_chip6_sleep_params] */ # 30fc: 393c
            call0        sdk_tx_pwctrl_init                    # 30fe: 050000
            movi         a9, sdk_g_phyFuns                     # 3101: 91d5ff
            movi         a5, .Ldata051                         # 3104: 51d6ff
            l32i         a9, a9, 0 /* [sdk_g_phyFuns] */       # 3107: 9809
            l8ui         a5, a5, 46 /* [sdk_txbk_dpdby_flag] */ # 3109: 52052e
            l32i         a9, a9, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 310c: 922927
            beqz         a5, .Lbr292                           # 310f: 9c15
            movi         a2, 119 /* 0x00000077 */              # 3111: 22a077
            movi         a3, 0 /* 0x00000000 */                # 3114: 0c03
            movi         a4, 15 /* 0x0000000f */               # 3116: 0cf4
            movi         a5, 1 /* 0x00000001 */                # 3118: 0c15
            movi         a6, 1 /* 0x00000001 */                # 311a: 0c16
            movi         a7, 1 /* 0x00000001 */                # 311c: 0c17
            callx0       a9 /* [[sdk_g_phyFuns]+0x9c] */       # 311e: c00900
            j            .Lbr293                               # 3121: c60300
.Lbr292:    movi         a2, 119 /* 0x00000077 */              # 3124: 22a077
            movi         a3, 0 /* 0x00000000 */                # 3127: 0c03
            movi         a4, 15 /* 0x0000000f */               # 3129: 0cf4
            movi         a5, 1 /* 0x00000001 */                # 312b: 0c15
            movi         a6, 1 /* 0x00000001 */                # 312d: 0c16
            l32i         a7, sp, 20 /* [(local5)] */           # 312f: 7851
            callx0       a9 /* [[sdk_g_phyFuns]+0x9c] */       # 3131: c00900
.Lbr293:    mov          a2, a13                               # 3134: 2d0d
            call0        sdk_chip_v6_set_chan                  # 3136: 01d0ffc0
                                                               # 313a: 0000
.Lbr294:    movi         a2, 0 /* 0x00000000 */                # 313c: 0c02
            addi         a3, sp, 16 /* (local4) */             # 313e: 32c110
            movi         a8, .Ldata097                         # 3141: 81c7ff
            l32i         a4, a12, 0x1cc /* [.Ldata019] */      # 3144: 422c73
            movi         a9, 0 /* 0x00000000 */                # 3147: 0c09
            movi         a5, .Label004                         # 3149: 51c6ff
            movi         a7, .Ldata001                         # 314c: 71c7ff
            addi         a6, a5, -102 /* .bss+0x22 */          # 314f: 62c59a
            l8ui         a7, a7, 0 /* [.Ldata001] */           # 3152: 720700
            s32i         a9, sp, 4 /* 0x00000000 -> [(local1)] */ # 3155: 9911
            s32i         a9, sp, 8 /* 0x00000000 -> [(local2)] */ # 3157: 9921
            s32i         a9, sp, 12 /* 0x00000000 -> [(local3)] */ # 3159: 9931
            s32i         a8, sp, 0 /* .Ldata097 -> [(local0)] */ # 315b: 8901
            addi         a7, a7, 1 /* [.Ldata001]+0x1 */       # 315d: 1b77
            extui        a7, a7, 0, 8                          # 315f: 707074
            call0        sdk_set_rx_gain_testchip_50           # 3162: 050000
            movi         a2, sdk_chip6_sleep_params            # 3165: 21c1ff
            movi         a4, 0 /* 0x00000000 */                # 3168: 0c04
            addi         a3, a2, 111 /* .bss+0x7b */           # 316a: 32c26f
            call0        sdk_rtc_mem_backup                    # 316d: 050000
            mov          a4, a2                                # 3170: 4d02
            movi         a2, .Label003                         # 3172: 21bfff
            s32i         a4, a12, 0x1dc /* a4 -> [.Ldata022] */ # 3175: 426c77
            addi         a3, a2, 9 /* .Ldata018 */             # 3178: 9b32
            call0        sdk_rtc_mem_backup                    # 317a: 050000
            l32i         a12, sp, 28 /* [(local7)] */          # 317d: c871
            l32i         a13, sp, 32 /* [(local8)] */          # 317f: d881
            l32i         a0, sp, 24 /* [(local6)] */           # 3181: 0861
            addi         sp, sp, 48 /* (top of frame) */       # 3183: 12c130
            ret                                                # 3186: 0df0

            .literal_position                                  # 3188: 00feef3f
                                                               # 318c: 000a0060
                                                               # 3190: 000a0060
                                                               # 3194: 00feef3f
                                                               # 3198: 00000000
                                                               # 319c: 00000000
                                                               # 31a0: 00000000
                                                               # 31a4: 00000000
                                                               # 31a8: 00000000

# Function @ .irom0.text+0x31ac
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_bbpll_cal
            .type        sdk_bbpll_cal, @function
sdk_bbpll_cal:
            addi         sp, sp, -16 /* (local0) */            # 31ac: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 31af: 0911
            movi         a2, 0x3feffe00                        # 31b1: 21f5ff
            memw                                               # 31b4: c02000
            l32i         a4, a2, 0x214 /* [0x3ff00014] */      # 31b7: 422285
            s32i         a4, sp, 0 /* [0x3ff00014] -> [(local0)] */ # 31ba: 4901
            movi         a3, -2 /* 0xfffffffe */               # 31bc: 7ce3
            memw                                               # 31be: c02000
            l32i         a0, a2, 0x214 /* [0x3ff00014] */      # 31c1: 022285
            and          a0, a0, a3                            # 31c4: 300010
            memw                                               # 31c7: c02000
            s32i         a0, a2, 0x214 /* a0 -> [0x3ff00014] */ # 31ca: 026285
            movi         a2, 80 /* 0x00000050 */               # 31cd: 5c02
            call0        sdk_ets_update_cpu_frequency          # 31cf: 01f2ffc0
                                                               # 31d3: 0000
            movi         a2, 1 /* 0x00000001 */                # 31d5: 0c12
            call0        sdk_ets_delay_us                      # 31d7: 01f1ffc0
                                                               # 31db: 0000
            movi         a7, 8 /* 0x00000008 */                # 31dd: 0c87
            movi         a8, -13 /* 0xfffffff3 */              # 31df: 7c38
            movi         a6, 0x60000a00                        # 31e1: 61eaff
            memw                                               # 31e4: c02000
            l32i         a5, a6, 0x340 /* [0x60000d40] */      # 31e7: 5226d0
            and          a5, a5, a8                            # 31ea: 805510
            or           a5, a5, a7                            # 31ed: 705520
            memw                                               # 31f0: c02000
            s32i         a5, a6, 0x340 /* a5 -> [0x60000d40] */ # 31f3: 5266d0
            movi         a2, 1000 /* 0x000003e8 */             # 31f6: 22a3e8
            call0        sdk_ets_delay_us                      # 31f9: 01e9ffc0
                                                               # 31fd: 0000
            movi         a11, 4 /* 0x00000004 */               # 31ff: 0c4b
            memw                                               # 3201: c02000
            movi         a10, 0x60000a00                       # 3204: a1e3ff
            l32i         a9, a10, 0x340 /* [0x60000d40] */     # 3207: 922ad0
            movi         a0, -13 /* 0xfffffff3 */              # 320a: 7c30
            and          a9, a9, a0                            # 320c: 009910
            or           a9, a9, a11                           # 320f: b09920
            memw                                               # 3212: c02000
            s32i         a9, a10, 0x340 /* a9 -> [0x60000d40] */ # 3215: 926ad0
            movi         a2, 1 /* 0x00000001 */                # 3218: 0c12
            call0        sdk_ets_delay_us                      # 321a: 01e2ffc0
                                                               # 321e: 0000
            memw                                               # 3220: c02000
            movi         a3, 0x3feffe00                        # 3223: 31dcff
            l32i         a2, sp, 0 /* [(local0)] */            # 3226: 2801
            s32i         a2, a3, 0x214 /* [(local0)] -> [0x3ff00014] */ # 3228: 226385
            bbci         a2, 0, .Lbr295                        # 322b: 076208
            movi         a2, 160 /* 0x000000a0 */              # 322e: 22a0a0
            call0        sdk_ets_update_cpu_frequency          # 3231: 01ddffc0
                                                               # 3235: 0000
.Lbr295:    l32i         a0, sp, 4 /* [(local1)] */            # 3237: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 3239: 12c110
            ret                                                # 323c: 0df0

            .literal_position                                  # 3240: dd010000
                                                               # 3244: dd010000
                                                               # 3248: dd010000
                                                               # 324c: 00000000
                                                               # 3250: 00000000

# Function @ .irom0.text+0x3254
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_periodic_cal_top
            .type        sdk_periodic_cal_top, @function
sdk_periodic_cal_top:
            addi         sp, sp, -16 /* (local0) */            # 3254: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 3257: 0911
            movi         a0, .Label015                         # 3259: 01f9ff
            movi         a6, 0 /* 0x00000000 */                # 325c: 0c06
            l8ui         a3, a0, 147 /* [sdk_periodic_cal_flag] */ # 325e: 320093
            l8ui         a5, a0, 107 /* [.Ldata082] */         # 3261: 52006b
            bnez         a3, .Lbr296                           # 3264: cc63
            movi         a4, 1 /* 0x00000001 */                # 3266: 0c14
            s8i          a4, a0, 147 /* 0x01 -> [sdk_periodic_cal_flag] */ # 3268: 424093
            j            .Lbr298                               # 326b: 460c00
.Lbr296:    s32i         a2, sp, 0 /* arg0 -> [(local0)] */    # 326e: 2901
            s8i          a6, a0, 147 /* 0x00 -> [sdk_periodic_cal_flag] */ # 3270: 624093
            bbsi         a5, 1, .Lbr298                        # 3273: 17e529
            movi         a2, 4 /* 0x00000004 */                # 3276: 0c42
            call0        sdk_pm_set_sleep_mode                 # 3278: 01f5ffc0
                                                               # 327c: 0000
            movi         a0, .Label015                         # 327e: 01f1ff
            l8ui         a7, a0, 148 /* [sdk_bbpll_cal_flag] */ # 3281: 720094
            bnez         a7, .Lbr297                           # 3284: cc47
            call0        sdk_bbpll_cal                         # 3286: 050000
            movi         a0, .Label015                         # 3289: 01efff
.Lbr297:    l32i         a2, sp, 0 /* [(local0)] */            # 328c: 2801
            movi         a8, 0 /* 0x00000000 */                # 328e: 0c08
            s8i          a8, a0, 148 /* 0x00 -> [sdk_bbpll_cal_flag] */ # 3290: 824094
            call0        sdk_periodic_cal                      # 3293: 050000
            movi         a2, 4 /* 0x00000004 */                # 3296: 0c42
            movi         a3, 0 /* 0x00000000 */                # 3298: 0c03
            call0        sdk_pm_wakeup_init                    # 329a: 01edffc0
                                                               # 329e: 0000
.Lbr298:    l32i         a0, sp, 4 /* [(local1)] */            # 32a0: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 32a2: 12c110
            ret                                                # 32a5: 0df0

            .literal_position                                  # 32a8: e4010000
                                                               # 32ac: e7010000
                                                               # 32b0: e8010000
                                                               # 32b4: ea010000
                                                               # 32b8: ec010000

# Function @ .irom0.text+0x32bc
            .global      sdk_register_chipv6_phy_init_param
            .type        sdk_register_chipv6_phy_init_param, @function
sdk_register_chipv6_phy_init_param:
            movi         a6, 0 /* 0x00000000 */                # 32bc: 0c06
            movi         a9, sdk_chip6_phy_init_ctrl           # 32be: 91faff
            l8ui         a4, a2, 0 /* [arg0] */                # 32c1: 420200
            mov          a5, a9 /* sdk_chip6_phy_init_ctrl */  # 32c4: 5d09
            addi         a8, a9, -64 /* .bss+0x1a4 */          # 32c6: 82c9c0
            s8i          a4, a9, 0 /* [arg0] -> [sdk_chip6_phy_init_ctrl] */ # 32c9: 424900
            l8ui         a3, a2, 1 /* [arg0+0x1] */            # 32cc: 320201
            addi         a7, a9, 15 /* .bss+0x1f3 */           # 32cf: fb79
            extui        a3, a3, 1, 1                          # 32d1: 303104
            s8i          a3, a9, 2 /* a3 -> [.Ldata024] */     # 32d4: 324902
.Lbr299:    add          a10, a6, a2                           # 32d7: 2aa6
            addi         a6, a6, 1                             # 32d9: 1b66
            l8ui         a10, a10, 2                           # 32db: a20a02
            s8i          a10, a5, 3                            # 32de: a24503
            addi         a5, a5, 1                             # 32e1: 1b55
            bne          a5, a7, .Lbr299                       # 32e3: 7795f0
            mov          a5, a9 /* sdk_chip6_phy_init_ctrl */  # 32e6: 5d09
            movi         a10, .Label016                        # 32e8: a1f1ff
            movi         a6, 0 /* 0x00000000 */                # 32eb: 0c06
.Lbr300:    add          a3, a6, a2                            # 32ed: 2a36
            addi         a5, a5, 1                             # 32ef: 1b55
            addi         a6, a6, 1                             # 32f1: 1b66
            l8ui         a4, a3, 17                            # 32f3: 420311
            s8i          a4, a5, 17                            # 32f6: 424511
            l8ui         a7, a3, 20                            # 32f9: 720314
            slli         a11, a4, 24                           # 32fc: 80b401
            add          a4, a4, a7                            # 32ff: 7a44
            s8i          a4, a5, 20                            # 3301: 424514
            l8ui         a3, a3, 23                            # 3304: 320317
            srai         a11, a11, 24                          # 3307: b0b831
            add          a11, a11, a3                          # 330a: 3abb
            s8i          a11, a5, 23                           # 330c: b24517
            bne          a5, a10, .Lbr300                      # 330f: a795da
            mov          a5, a9 /* sdk_chip6_phy_init_ctrl */  # 3312: 5d09
            movi         a7, .Label017                         # 3314: 71e7ff
            movi         a10, 0 /* 0x00000000 */               # 3317: 0c0a
            movi         a6, 0 /* 0x00000000 */                # 3319: 0c06
            l8ui         a11, a2, 26 /* [arg0+0x1a] */         # 331b: b2021a
            s8i          a11, a8, 92 /* [arg0+0x1a] -> [.Ldata034] */ # 331e: b2485c
            l8ui         a4, a2, 27 /* [arg0+0x1b] */          # 3321: 42021b
            s8i          a4, a8, 93 /* [arg0+0x1b] -> [.Ldata035] */ # 3324: 42485d
            add          a4, a6, a2 /* arg0 */                 # 3327: 2a46
            l8ui         a3, a2, 28 /* [arg0+0x1c] */          # 3329: 32021c
            l8ui         a11, a2, 29 /* [arg0+0x1d] */         # 332c: b2021d
            extui        a3, a3, 0, 6                          # 332f: 303054
            slli         a3, a3, 8                             # 3332: 803311
            or           a11, a11, a3                          # 3335: 30bb20
            s16i         a11, a8, 94 /* a11 -> [.Ldata036] */  # 3338: b2582f
.Lbr301:    addi         a6, a6, 1                             # 333b: 1b66
            l8ui         a4, a4, 30                            # 333d: 42041e
            s8i          a4, a5, 32                            # 3340: 424520
            slli         a3, a4, 24                            # 3343: 803401
            srai         a3, a3, 24                            # 3346: 303831
            bgei         a3, 6, .Lbr302                        # 3349: e66302
            bbci         a4, 7, .Lbr303                        # 334c: 776402
.Lbr302:    s8i          a10, a5, 32                           # 334f: a24520
.Lbr303:    add          a4, a6, a2                            # 3352: 2a46
            addi         a5, a5, 1                             # 3354: 1b55
            bne          a5, a7, .Lbr301                       # 3356: 7795e1
            mov          a5, a9 /* sdk_chip6_phy_init_ctrl */  # 3359: 5d09
            movi         a7, .Label018                         # 335b: 71d6ff
            movi         a6, 0 /* 0x00000000 */                # 335e: 0c06
.Lbr304:    add          a10, a6, a2                           # 3360: 2aa6
            addi         a6, a6, 1                             # 3362: 1b66
            l8ui         a10, a10, 34                          # 3364: a20a22
            s8i          a10, a5, 36                           # 3367: a24524
            addi         a5, a5, 1                             # 336a: 1b55
            bne          a5, a7, .Lbr304                       # 336c: 7795f0
            mov          a5, a9 /* sdk_chip6_phy_init_ctrl */  # 336f: 5d09
            movi         a7, .Label019                         # 3371: 71d1ff
            movi         a6, 0 /* 0x00000000 */                # 3374: 0c06
.Lbr305:    add          a11, a6, a2                           # 3376: 2ab6
            addi         a6, a6, 1                             # 3378: 1b66
            l8ui         a11, a11, 40                          # 337a: b20b28
            s8i          a11, a5, 42                           # 337d: b2452a
            addi         a5, a5, 1                             # 3380: 1b55
            bne          a5, a7, .Lbr305                       # 3382: 7795f0
            movi         a5, 5 /* 0x00000005 */                # 3385: 0c55
            l8ui         a3, a2, 48 /* [arg0+0x30] */          # 3387: 320230
            s8i          a3, a8, 65 /* [arg0+0x30] -> [.Ldata023] */ # 338a: 324841
            l8ui         a11, a2, 49 /* [arg0+0x31] */         # 338d: b20231
            s8i          a11, a8, 115 /* [arg0+0x31] -> [.Ldata037] */ # 3390: b24873
            l8ui         a10, a2, 50 /* [arg0+0x32] */         # 3393: a20232
            s8i          a10, a8, 116 /* [arg0+0x32] -> [.Ldata038] */ # 3396: a24874
            l8ui         a9, a2, 51 /* [arg0+0x33] */          # 3399: 920233
            s8i          a9, a8, 117 /* [arg0+0x33] -> [.Ldata039] */ # 339c: 924875
            l8ui         a7, a2, 52 /* [arg0+0x34] */          # 339f: 720234
            s8i          a7, a8, 118 /* [arg0+0x34] -> [.Ldata040] */ # 33a2: 724876
            l8ui         a6, a2, 53 /* [arg0+0x35] */          # 33a5: 620235
            s8i          a6, a8, 119 /* [arg0+0x35] -> [.Ldata041] */ # 33a8: 624877
            l8ui         a4, a2, 54 /* [arg0+0x36] */          # 33ab: 420236
            s8i          a4, a8, 120 /* [arg0+0x36] -> [.Ldata042] */ # 33ae: 424878
            l8ui         a3, a2, 55 /* [arg0+0x37] */          # 33b1: 320237
            s8i          a3, a8, 121 /* [arg0+0x37] -> [.Ldata043] */ # 33b4: 324879
            l8ui         a11, a2, 56 /* [arg0+0x38] */         # 33b7: b20238
            s8i          a11, a8, 122 /* [arg0+0x38] -> [.Ldata044] */ # 33ba: b2487a
            l8ui         a10, a2, 64 /* [arg0+0x40] */         # 33bd: a20240
            s8i          a10, a8, 123 /* [arg0+0x40] -> [.Ldata045] */ # 33c0: a2487b
            l8ui         a9, a2, 65 /* [arg0+0x41] */          # 33c3: 920241
            s8i          a9, a8, 124 /* [arg0+0x41] -> [.Ldata046] */ # 33c6: 92487c
            l8ui         a7, a2, 66 /* [arg0+0x42] */          # 33c9: 720242
            l8ui         a6, a2, 67 /* [arg0+0x43] */          # 33cc: 620243
            extui        a7, a7, 0, 6                          # 33cf: 707054
            slli         a7, a7, 8                             # 33d2: 807711
            or           a6, a6, a7                            # 33d5: 706620
            s16i         a6, a8, 126 /* a6 -> [.Ldata047] */   # 33d8: 62583f
            l8ui         a4, a2, 68 /* [arg0+0x44] */          # 33db: 420244
            s8i          a4, a8, 128 /* [arg0+0x44] -> [.Ldata048] */ # 33de: 424880
            l8ui         a3, a2, 69 /* [arg0+0x45] */          # 33e1: 320245
            s8i          a3, a8, 129 /* [arg0+0x45] -> [.Ldata049] */ # 33e4: 324881
            l8ui         a11, a2, 71 /* [arg0+0x47] */         # 33e7: b20247
            l8ui         a10, a2, 70 /* [arg0+0x46] */         # 33ea: a20246
            slli         a11, a11, 24                          # 33ed: 80bb01
            slli         a10, a10, 24                          # 33f0: 80aa01
            srai         a10, a10, 24                          # 33f3: a0a831
            srai         a11, a11, 24                          # 33f6: b0b831
            slli         a11, a11, 8                           # 33f9: 80bb11
            or           a10, a10, a11                         # 33fc: b0aa20
            s16i         a10, a8, 130 /* a10 -> [.Ldata050] */ # 33ff: a25841
            l8ui         a9, a2, 73 /* [arg0+0x49] */          # 3402: 920249
            l8ui         a7, a2, 72 /* [arg0+0x48] */          # 3405: 720248
            slli         a9, a9, 24                            # 3408: 809901
            slli         a7, a7, 24                            # 340b: 807701
            srai         a7, a7, 24                            # 340e: 707831
            srai         a9, a9, 24                            # 3411: 909831
            slli         a9, a9, 8                             # 3414: 809911
            or           a7, a7, a9                            # 3417: 907720
            s16i         a7, a8, 132 /* a7 -> [.Ldata051] */   # 341a: 725842
            l8ui         a6, a2, 74 /* [arg0+0x4a] */          # 341d: 62024a
            s8i          a6, a8, 134 /* [arg0+0x4a] -> [.Ldata052] */ # 3420: 624886
            l8ui         a4, a2, 75 /* [arg0+0x4b] */          # 3423: 42024b
            mov          a6, a5 /* 0x00000005 */               # 3426: 6d05
            extui        a4, a4, 0, 4                          # 3428: 404034
            s8i          a4, a8, 136 /* a4 -> [.Ldata054] */   # 342b: 424888
            bgeui        a4, 6, .Lbr306                        # 342e: f66401
            mov          a6, a4                                # 3431: 6d04
.Lbr306:    s8i          a6, a8, 136 /* a6 -> [.Ldata054] */   # 3433: 624888
            l8ui         a9, a2, 75 /* [arg0+0x4b] */          # 3436: 92024b
            extui        a9, a9, 4, 3                          # 3439: 909424
            s8i          a9, a8, 138 /* a9 -> [.Ldata056] */   # 343c: 92488a
            l8ui         a7, a2, 75 /* [arg0+0x4b] */          # 343f: 72024b
            extui        a7, a7, 7, 1                          # 3442: 707704
            s8i          a7, a8, 140 /* a7 -> [.Ldata058] */   # 3445: 72488c
            l8ui         a6, a2, 76 /* [arg0+0x4c] */          # 3448: 62024c
            extui        a6, a6, 0, 4                          # 344b: 606034
            s8i          a6, a8, 135 /* a6 -> [.Ldata053] */   # 344e: 624887
            bltu         a5, a6, .Lbr307                       # 3451: 673501
            mov          a5, a6                                # 3454: 5d06
.Lbr307:    s8i          a5, a8, 135 /* a5 -> [.Ldata053] */   # 3456: 524887
            l8ui         a9, a2, 76 /* [arg0+0x4c] */          # 3459: 92024c
            extui        a9, a9, 4, 3                          # 345c: 909424
            s8i          a9, a8, 137 /* a9 -> [.Ldata055] */   # 345f: 924889
            l8ui         a7, a2, 76 /* [arg0+0x4c] */          # 3462: 72024c
            extui        a7, a7, 7, 1                          # 3465: 707704
            s8i          a7, a8, 139 /* a7 -> [.Ldata057] */   # 3468: 72488b
            l8ui         a6, a2, 77 /* [arg0+0x4d] */          # 346b: 62024d
            extui        a6, a6, 0, 4                          # 346e: 606034
            s8i          a6, a8, 142 /* a6 -> [.Ldata060] */   # 3471: 62488e
            l8ui         a4, a2, 77 /* [arg0+0x4d] */          # 3474: 42024d
            extui        a4, a4, 4, 4                          # 3477: 404434
            s8i          a4, a8, 141 /* a4 -> [.Ldata059] */   # 347a: 42488d
            l8ui         a3, a2, 78 /* [arg0+0x4e] */          # 347d: 32024e
            s8i          a3, a8, 143 /* [arg0+0x4e] -> [.Ldata061] */ # 3480: 32488f
            l8ui         a11, a2, 79 /* [arg0+0x4f] */         # 3483: b2024f
            s8i          a11, a8, 144 /* [arg0+0x4f] -> [.Ldata062] */ # 3486: b24890
            l8ui         a10, a2, 80 /* [arg0+0x50] */         # 3489: a20250
            s8i          a10, a8, 145 /* [arg0+0x50] -> [.Ldata063] */ # 348c: a24891
            l8ui         a9, a2, 81 /* [arg0+0x51] */          # 348f: 920251
            s8i          a9, a8, 146 /* [arg0+0x51] -> [.Ldata064] */ # 3492: 924892
            l8ui         a7, a2, 82 /* [arg0+0x52] */          # 3495: 720252
            s8i          a7, a8, 147 /* [arg0+0x52] -> [.Ldata065] */ # 3498: 724893
            l8ui         a6, a2, 83 /* [arg0+0x53] */          # 349b: 620253
            s8i          a6, a8, 148 /* [arg0+0x53] -> [.Ldata066] */ # 349e: 624894
            l8ui         a4, a2, 84 /* [arg0+0x54] */          # 34a1: 420254
            s8i          a4, a8, 149 /* [arg0+0x54] -> [.Ldata067] */ # 34a4: 424895
            l8ui         a3, a2, 85 /* [arg0+0x55] */          # 34a7: 320255
            s8i          a3, a8, 150 /* [arg0+0x55] -> [.Ldata068] */ # 34aa: 324896
            l8ui         a11, a2, 86 /* [arg0+0x56] */         # 34ad: b20256
            s8i          a11, a8, 151 /* [arg0+0x56] -> [.Ldata069] */ # 34b0: b24897
            l8ui         a10, a2, 87 /* [arg0+0x57] */         # 34b3: a20257
            s8i          a10, a8, 152 /* [arg0+0x57] -> [.Ldata070] */ # 34b6: a24898
            l8ui         a9, a2, 88 /* [arg0+0x58] */          # 34b9: 920258
            s8i          a9, a8, 153 /* [arg0+0x58] -> [.Ldata071] */ # 34bc: 924899
            l8ui         a7, a2, 89 /* [arg0+0x59] */          # 34bf: 720259
            s8i          a7, a8, 154 /* [arg0+0x59] -> [.Ldata072] */ # 34c2: 72489a
            l8ui         a6, a2, 90 /* [arg0+0x5a] */          # 34c5: 62025a
            s8i          a6, a8, 155 /* [arg0+0x5a] -> [.Ldata073] */ # 34c8: 62489b
            l8ui         a4, a2, 91 /* [arg0+0x5b] */          # 34cb: 42025b
            s8i          a4, a8, 156 /* [arg0+0x5b] -> [.Ldata074] */ # 34ce: 42489c
            l8ui         a3, a2, 92 /* [arg0+0x5c] */          # 34d1: 32025c
            s8i          a3, a8, 157 /* [arg0+0x5c] -> [.Ldata075] */ # 34d4: 32489d
            l8ui         a11, a2, 93 /* [arg0+0x5d] */         # 34d7: b2025d
            s8i          a11, a8, 158 /* [arg0+0x5d] -> [.Ldata076] */ # 34da: b2489e
            l8ui         a10, a2, 94 /* [arg0+0x5e] */         # 34dd: a2025e
            s8i          a10, a8, 159 /* [arg0+0x5e] -> [.Ldata077] */ # 34e0: a2489f
            l8ui         a9, a2, 95 /* [arg0+0x5f] */          # 34e3: 92025f
            s8i          a9, a8, 160 /* [arg0+0x5f] -> [.Ldata078] */ # 34e6: 9248a0
            l8ui         a7, a2, 96 /* [arg0+0x60] */          # 34e9: 720260
            s8i          a7, a8, 161 /* [arg0+0x60] -> [.Ldata079] */ # 34ec: 7248a1
            l8ui         a6, a2, 97 /* [arg0+0x61] */          # 34ef: 620261
            s8i          a6, a8, 162 /* [arg0+0x61] -> [.Ldata080] */ # 34f2: 6248a2
            l8ui         a4, a2, 98 /* [arg0+0x62] */          # 34f5: 420262
            s8i          a4, a8, 163 /* [arg0+0x62] -> [.Ldata081] */ # 34f8: 4248a3
            l8ui         a3, a2, 99 /* [arg0+0x63] */          # 34fb: 320263
            s8i          a3, a8, 164 /* [arg0+0x63] -> [.Ldata082] */ # 34fe: 3248a4
            l8ui         a11, a2, 100 /* [arg0+0x64] */        # 3501: b20264
            s8i          a11, a8, 165 /* [arg0+0x64] -> [.Ldata083] */ # 3504: b248a5
            l8ui         a10, a2, 101 /* [arg0+0x65] */        # 3507: a20265
            s8i          a10, a8, 166 /* [arg0+0x65] -> [.Ldata084] */ # 350a: a248a6
            l8ui         a9, a2, 102 /* [arg0+0x66] */         # 350d: 920266
            s8i          a9, a8, 167 /* [arg0+0x66] -> [.Ldata085] */ # 3510: 9248a7
            l8ui         a7, a2, 103 /* [arg0+0x67] */         # 3513: 720267
            s8i          a7, a8, 168 /* [arg0+0x67] -> [.Ldata086] */ # 3516: 7248a8
            l8ui         a6, a2, 104 /* [arg0+0x68] */         # 3519: 620268
            s8i          a6, a8, 169 /* [arg0+0x68] -> [.Ldata087] */ # 351c: 6248a9
            l8ui         a4, a2, 105 /* [arg0+0x69] */         # 351f: 420269
            s8i          a4, a8, 170 /* [arg0+0x69] -> [.Ldata088] */ # 3522: 4248aa
            l8ui         a3, a2, 106 /* [arg0+0x6a] */         # 3525: 32026a
            s8i          a3, a8, 171 /* [arg0+0x6a] -> [.Ldata089] */ # 3528: 3248ab
            l8ui         a11, a2, 107 /* [arg0+0x6b] */        # 352b: b2026b
            s8i          a11, a8, 172 /* [arg0+0x6b] -> [.Ldata090] */ # 352e: b248ac
            l8ui         a10, a2, 108 /* [arg0+0x6c] */        # 3531: a2026c
            s8i          a10, a8, 173 /* [arg0+0x6c] -> [.Ldata091] */ # 3534: a248ad
            movi         a2, 0 /* 0x00000000 */                # 3537: 0c02
            ret           /* 0x00000000 */                     # 3539: 0df0

            .literal_position                                  # 353c: 00060060
                                                               # 3540: 00000000
                                                               # 3544: 70008000
                                                               # 3548: 00001000
                                                               # 354c: 65010000
                                                               # 3550: 00000000
                                                               # 3554: 00000000
                                                               # 3558: 00000000
                                                               # 355c: 00000000
                                                               # 3560: 00000000
                                                               # 3564: 00000000

# Function @ .irom0.text+0x3568
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .global      sdk_change_bbpll160_sleep
            .type        sdk_change_bbpll160_sleep, @function
sdk_change_bbpll160_sleep:
            addi         sp, sp, -16 /* (local0) */            # 3568: 12c1f0
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      # 356b: 0921
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   # 356d: c931
            movi         a2, -1 /* 0xffffffff */               # 356f: 7cf2
            movi         a12, 0x60000600                       # 3571: c1f2ff
            movi         a0, sdk_g_phyFuns                     # 3574: 01f3ff
            memw                                               # 3577: c02000
            movi         a3, 2 /* 0x00000002 */                # 357a: 0c23
            movi         a4, 8 /* 0x00000008 */                # 357c: 0c84
            movi         a5, 0 /* 0x00000000 */                # 357e: 0c05
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 3580: 0800
            s32i         a2, a12, 0x124 /* 0xffffffff -> [0x60000724] */ # 3582: 226c49
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ # 3585: 022026
            movi         a2, 106 /* 0x0000006a */              # 3588: 22a06a
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       # 358b: c00000
            movi         a2, 0 /* 0x00000000 */                # 358e: 0c02
            memw                                               # 3590: c02000
            s32i         a2, a12, 0x10c /* 0x00000000 -> [0x6000070c] */ # 3593: 226c43
            movi         a2, 3 /* 0x00000003 */                # 3596: 0c32
            call0        sdk_pm_set_sleep_cycles               # 3598: 01f1ffc0
                                                               # 359c: 0000
            memw                                               # 359e: c02000
            movi         a7, 0 /* 0x00000000 */                # 35a1: 0c07
            s32i         a7, a12, 0x140 /* 0x00000000 -> [0x60000740] */ # 35a3: 726c50
            memw                                               # 35a6: c02000
            s32i         a7, a12, 0x144 /* 0x00000000 -> [0x60000744] */ # 35a9: 726c51
            movi         a6, -2 /* 0xfffffffe */               # 35ac: 7ce6
            memw                                               # 35ae: c02000
            l32i         a5, a12, 0x1a8 /* [0x600007a8] */     # 35b1: 522c6a
            and          a5, a5, a6                            # 35b4: 605510
            memw                                               # 35b7: c02000
            s32i         a5, a12, 0x1a8 /* a5 -> [0x600007a8] */ # 35ba: 526c6a
            memw                                               # 35bd: c02000
            l32i         a4, a12, 0x100 /* [0x60000700] */     # 35c0: 422c40
            s32i         a4, sp, 4 /* [0x60000700] -> [(local1)] */ # 35c3: 4911
            movi         a3, 0x00800070                        # 35c5: 31dfff
            memw                                               # 35c8: c02000
            s32i         a3, a12, 0x100 /* 0x00800070 -> [0x60000700] */ # 35cb: 326c40
            movi         a2, 8 /* 0x00000008 */                # 35ce: 0c82
            movi         a3, 0 /* 0x00000000 */                # 35d0: 0c03
            call0        sdk_pm_wakeup_opt                     # 35d2: 01e3ffc0
                                                               # 35d6: 0000
            movi         a9, 0x00100000                        # 35d8: 91dcff
            memw                                               # 35db: c02000
            l32i         a8, a12, 0x108 /* [0x60000708] */     # 35de: 822c42
            movi         a0, .Label006                         # 35e1: 01daff
            or           a8, a8, a9                            # 35e4: 908820
            l8ui         a0, a0, 128 /* [.Ldata023] */         # 35e7: 020080
            s32i         a8, sp, 0 /* a8 -> [(local0)] */      # 35ea: 8901
            bnei         a0, 1, .Lbr308                        # 35ec: 66102c
            movi         a2, 103 /* 0x00000067 */              # 35ef: 22a067
            movi         a0, sdk_g_phyFuns                     # 35f2: 01d7ff
            movi         a3, 4 /* 0x00000004 */                # 35f5: 0c43
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 35f7: 0800
            movi         a4, 1 /* 0x00000001 */                # 35f9: 0c14
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ # 35fb: 022026
            movi         a5, 136 /* 0x00000088 */              # 35fe: 52a088
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       # 3601: c00000
            movi         a2, 103 /* 0x00000067 */              # 3604: 22a067
            movi         a0, sdk_g_phyFuns                     # 3607: 01d3ff
            movi         a3, 4 /* 0x00000004 */                # 360a: 0c43
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 360c: 0800
            movi         a4, 2 /* 0x00000002 */                # 360e: 0c24
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ # 3610: 022026
            movi         a5, 145 /* 0x00000091 */              # 3613: 52a091
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       # 3616: c00000
            j            .Lbr309                               # 3619: 860600
.Lbr308:    bnei         a0, 2, .Lbr309                        # 361c: 662017
            movi         a2, 103 /* 0x00000067 */              # 361f: 22a067
            movi         a3, 4 /* 0x00000004 */                # 3622: 0c43
            movi         a4, 2 /* 0x00000002 */                # 3624: 0c24
            movi         a0, sdk_g_phyFuns                     # 3626: 01ccff
            movi         a5, 7 /* 0x00000007 */                # 3629: 0c75
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 362b: 0800
            movi         a6, 5 /* 0x00000005 */                # 362d: 0c56
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 362f: 022027
            movi         a7, 2 /* 0x00000002 */                # 3632: 0c27
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 3634: c00000
.Lbr309:    memw                                               # 3637: c02000
            l32i         a2, sp, 0 /* [(local0)] */            # 363a: 2801
            s32i         a2, a12, 0x108 /* [(local0)] -> [0x60000708] */ # 363c: 226c42
            movi         a2, 1 /* 0x00000001 */                # 363f: 0c12
            call0        sdk_pm_wait4wakeup                    # 3641: 01c8ffc0
                                                               # 3645: 0000
            memw                                               # 3647: c02000
            l32i         a3, sp, 4 /* [(local1)] */            # 364a: 3811
            l32i         a0, sp, 8 /* [(local2)] */            # 364c: 0821
            s32i         a3, a12, 0x100 /* [(local1)] -> [0x60000700] */ # 364e: 326c40
            l32i         a12, sp, 12 /* [(local3)] */          # 3651: c831
            addi         sp, sp, 16 /* (top of frame) */       # 3653: 12c110
            ret                                                # 3656: 0df0

            .literal_position                                  # 3658: 97010000
                                                               # 365c: 00000000

# Function @ .irom0.text+0x3660
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_change_bbpll160
            .type        sdk_change_bbpll160, @function
sdk_change_bbpll160:
            addi         sp, sp, -16 /* (local0) */            # 3660: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 3663: 0901
            call0        sdk_get_chip_version                  # 3665: 01fdffc0
                                                               # 3669: 0000
            movi         a0, .Label010                         # 366b: 01fbff
            l8ui         a3, a0, 78 /* [.Ldata023] */          # 366e: 32004e
            l8ui         a0, a0, 178 /* [.Ldata083] */         # 3671: 0200b2
            beqz         a3, .Lbr311                           # 3674: 9c13
            bnei         a0, 1, .Lbr310                        # 3676: 661005
            call0        sdk_change_bbpll160_sleep             # 3679: 050000
            j            .Lbr311                               # 367c: 460200
.Lbr310:    bnez         a0, .Lbr311                           # 367f: cc60
            beqi         a2, 1, .Lbr311                        # 3681: 261204
            beqz         a2, .Lbr311                           # 3684: 8c12
            call0        sdk_change_bbpll160_sleep             # 3686: 050000
.Lbr311:    l32i         a0, sp, 0 /* [(local0)] */            # 3689: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 368b: 12c110
            ret                                                # 368e: 0df0

            .literal_position                                  # 3690: 65010000
                                                               # 3694: 00000000
                                                               # 3698: 00020060
                                                               # 369c: 00060060
                                                               # 36a0: 00000000
                                                               # 36a4: 00000000

# Function @ .irom0.text+0x36a8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_set_crystal_uart
            .type        sdk_set_crystal_uart, @function
sdk_set_crystal_uart:
            addi         sp, sp, -16 /* (local0) */            # 36a8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 36ab: 0901
            movi         a0, .Label006                         # 36ad: 01f8ff
            movi         a2, sdk_rxiq_compute_num              # 36b0: 21f9ff
            l8ui         a0, a0, 128 /* [.Ldata023] */         # 36b3: 020080
            l32i         a2, a2, 12 /* [sdk_chip6_sleep_params] */ # 36b6: 2832
            beqz         a0, .Lbr312                           # 36b8: bc80
            bbsi         a2, 27, .Lbr312                       # 36ba: b7f236
            call0        sdk_change_bbpll160_sleep             # 36bd: 050000
            movi         a0, 0x60000200                        # 36c0: 01f6ff
            memw                                               # 36c3: c02000
            l32i         a3, a0, 0x118 /* [0x60000318] */      # 36c6: 322046
            bbci         a3, 18, .Lbr312                       # 36c9: 277327
            memw                                               # 36cc: c02000
            l32i         a4, a0, 0x118 /* [0x60000318] */      # 36cf: 422046
            extui        a4, a4, 29, 3                         # 36d2: 404d25
            bnei         a4, 2, .Lbr312                        # 36d5: 66241b
            movi         a5, 0x60000600                        # 36d8: 51f1ff
            memw                                               # 36db: c02000
            l32i         a5, a5, 0x220 /* [0x60000820] */      # 36de: 522588
            bbci         a5, 8, .Lbr312                        # 36e1: 87650f
            movi         a2, 1 /* 0x00000001 */                # 36e4: 0c12
            call0        sdk_Uart_Init                         # 36e6: 01eeffc0
                                                               # 36ea: 0000
            movi         a2, 1 /* 0x00000001 */                # 36ec: 0c12
            call0        sdk_uart_buff_switch                  # 36ee: 01edffc0
                                                               # 36f2: 0000
.Lbr312:    l32i         a0, sp, 0 /* [(local0)] */            # 36f4: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 36f6: 12c110
            ret                                                # 36f9: 0df0

            .literal_position                                  # 36fc: 9a010000
                                                               # 3700: 009a0060
                                                               # 3704: 01010101
                                                               # 3708: 04040404
                                                               # 370c: 04010104
                                                               # 3710: 01040401
                                                               # 3714: 00008000
                                                               # 3718: ffc3ffff
                                                               # 371c: 00080000
                                                               # 3720: 01010104
                                                               # 3724: 04040401

# Function @ .irom0.text+0x3728
            .global      sdk_ant_switch_init
            .type        sdk_ant_switch_init, @function
sdk_ant_switch_init:
            movi         a7, .Label011                         # 3728: 71f5ff
            movi         a3, 0x60009a00                        # 372b: 31f5ff
            l8ui         a4, a7, 127 /* [.Ldata039] */         # 372e: 42077f
            movi         a5, 0x01010101                        # 3731: 51f4ff
            beqi         a4, 1, .Lbr315                        # 3734: 261468
            beqi         a4, 3, .Lbr315                        # 3737: 263465
            movi         a6, 0x04040404                        # 373a: 61f3ff
            beqi         a4, 4, .Lbr316                        # 373d: 264471
            beqi         a4, 5, .Lbr316                        # 3740: 26546e
            l8ui         a4, a7, 129 /* [.Ldata041] */         # 3743: 420781
            bnei         a4, 2, .Lbr313                        # 3746: 662411
            movi         a2, 0x04010104                        # 3749: 21f0ff
            memw                                               # 374c: c02000
            s32i         a2, a3, 0x360 /* 0x04010104 -> [0x60009d60] */ # 374f: 2263d8
            memw                                               # 3752: c02000
            s32i         a6, a3, 0x364 /* 0x04040404 -> [0x60009d64] */ # 3755: 6263d9
            j            .Lbr314                               # 3758: 460400
.Lbr313:    bnei         a4, 3, .Lbr314                        # 375b: 66340e
            movi         a4, 0x01040401                        # 375e: 41ecff
            memw                                               # 3761: c02000
            s32i         a4, a3, 0x360 /* 0x01040401 -> [0x60009d60] */ # 3764: 4263d8
            memw                                               # 3767: c02000
            s32i         a5, a3, 0x364 /* 0x01010101 -> [0x60009d64] */ # 376a: 5263d9
.Lbr314:    movi         a10, 0x00800000                       # 376d: a1e9ff
            memw                                               # 3770: c02000
            l32i         a9, a3, 0x100 /* [0x60009b00] */      # 3773: 922340
            or           a9, a9, a10                           # 3776: a09920
            memw                                               # 3779: c02000
            s32i         a9, a3, 0x100 /* a9 -> [0x60009b00] */ # 377c: 926340
            movi         a8, 0xffffc3ff                        # 377f: 81e6ff
            movi         a7, 0x00000800                        # 3782: 71e6ff
            memw                                               # 3785: c02000
            l32i         a6, a3, 0x108 /* [0x60009b08] */      # 3788: 622342
            and          a6, a6, a8                            # 378b: 806610
            or           a6, a6, a7                            # 378e: 706620
            memw                                               # 3791: c02000
            s32i         a6, a3, 0x108 /* a6 -> [0x60009b08] */ # 3794: 626342
            movi         a5, 2 /* 0x00000002 */                # 3797: 0c25
            memw                                               # 3799: c02000
            s32i         a5, a3, 40 /* 0x00000002 -> [0x60009a28] */ # 379c: 59a3
            ret                                                # 379e: 0df0
.Lbr315:    memw                                               # 37a0: c02000
            s32i         a5, a3, 0x360 /* 0x01010101 -> [0x60009d60] */ # 37a3: 5263d8
            movi         a11, 0x04010101                       # 37a6: b1deff
            memw                                               # 37a9: c02000
            s32i         a11, a3, 0x364 /* 0x04010101 -> [0x60009d64] */ # 37ac: b263d9
            j            .Lbr314                               # 37af: 86eeff
.Lbr316:    memw                                               # 37b2: c02000
            s32i         a6, a3, 0x360 /* 0x04040404 -> [0x60009d60] */ # 37b5: 6263d8
            movi         a2, 0x01040404                        # 37b8: 21dbff
            memw                                               # 37bb: c02000
            s32i         a2, a3, 0x364 /* 0x01040404 -> [0x60009d64] */ # 37be: 2263d9
            j            .Lbr314                               # 37c1: 06eaff

            .literal_position                                  # 37c4: 00060060
                                                               # 37c8: d6010000
                                                               # 37cc: 000e0060
                                                               # 37d0: 8a030000
                                                               # 37d4: d6010000
                                                               # 37d8: 0c000000
                                                               # 37dc: 0c000000
                                                               # 37e0: 7c000000
                                                               # 37e4: ffffff1f
                                                               # 37e8: 0000ff12
                                                               # 37ec: 000a0060
                                                               # 37f0: 00000000
                                                               # 37f4: 00000000
                                                               # 37f8: 00000000
                                                               # 37fc: 00000000
                                                               # 3800: 00000000
                                                               # 3804: 00000000
                                                               # 3808: 00000000
                                                               # 380c: 00000000
                                                               # 3810: 00000000
                                                               # 3814: 00000000
                                                               # 3818: 00000000
                                                               # 381c: 00000000
                                                               # 3820: 00000000
                                                               # 3824: 04000000
                                                               # 3828: 0c000000
                                                               # 382c: 00000002
                                                               # 3830: 7c000000
                                                               # 3834: 00001101
                                                               # 3838: d6010000
                                                               # 383c: d6010000
                                                               # 3840: 0000ffff
                                                               # 3844: 00000000
                                                               # 3848: 00000000

# Function @ .irom0.text+0x384c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .global      sdk_register_chipv6_phy
            .type        sdk_register_chipv6_phy, @function
sdk_register_chipv6_phy:
            movi         a5, 0x60000600                        # 384c: 51deff
            movi         a3, .Ldata020                         # 384f: 31deff
            addi         sp, sp, -32 /* (local0) */            # 3852: 12c1e0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 3855: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 3857: 0911
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   # 3859: f951
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   # 385b: d931
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   # 385d: e941
            mov          a14, a2 /* arg0 */                    # 385f: ed02
            movi         a13, 0x60000e00                       # 3861: d1daff
            movi         a15, .Ldata099                        # 3864: f1dbff
            memw                                               # 3867: c02000
            l8ui         a0, a15, 0 /* [.Ldata099] */          # 386a: 020f00
            movi         a4, 1 /* 0x00000001 */                # 386d: 0c14
            l32i         a5, a5, 0x114 /* [0x60000714] */      # 386f: 522545
            movi         a2, 0 /* 0x00000000 */                # 3872: 0c02
            extui        a5, a5, 0, 3                          # 3874: 505024
            addi         a5, a5, -2                            # 3877: 52c5fe
            moveqz       a2, a4, a5                            # 387a: 502483
            s8i          a2, a3, 156 /* a2 -> [sdk_deep_sleep_en] */ # 387d: 22439c
            bnez         a0, .Lbr317                           # 3880: ec00
            beqz         a2, .Lbr326                           # 3882: 16521a
            movi         a3, .Ldata020                         # 3885: 31d3ff
            l8ui         a3, a3, 123 /* [.Ldata091] */         # 3888: 32037b
            beqz         a3, .Lbr326                           # 388b: 16c319
            memw                                               # 388e: c02000
            l32i         a2, a13, 0x27c /* [0x6000107c] */     # 3891: 222d9f
            extui        a2, a2, 0, 16                         # 3894: 2020f4
            sub          a4, a3, a2                            # 3897: 2043c0
            bnez         a4, .Lbr328                           # 389a: 56941a
            movi         a2, 0 /* 0x00000000 */                # 389d: 0c02
            movi         a5, 0 /* 0x00000000 */                # 389f: 0c05
            j            .Lbr327                               # 38a1: 866200
.Lbr317:    movi         a5, 0 /* 0x00000000 */                # 38a4: 0c05
.Lbr318:    movi         a3, sdk_chip6_sleep_params            # 38a6: 31ccff
            addi         a12, a3, -12 /* sdk_rxiq_compute_num */ # 38a9: c2c3f4
            addi         a3, a3, 111 /* .bss+0x7b */           # 38ac: 32c36f
            beqz         a5, .Lbr320                           # 38af: ac85
            movi         a2, sdk_chip6_sleep_params            # 38b1: 21caff
            movi         a4, 0 /* 0x00000000 */                # 38b4: 0c04
            call0        sdk_rtc_mem_recovery                  # 38b6: 050000
            mov          a4, a2                                # 38b9: 4d02
            s32i         a2, a12, 0x1dc /* a2 -> [.Ldata022] */ # 38bb: 226c77
            movi         a2, .Label003                         # 38be: 21c8ff
            addi         a3, a2, 9 /* .Ldata018 */             # 38c1: 9b32
            call0        sdk_rtc_mem_recovery                  # 38c3: 050000
            movi         a9, 0x1fffffff                        # 38c6: 91c7ff
            l32i         a7, a12, 12 /* [sdk_chip6_sleep_params] */ # 38c9: 783c
            movi         a8, 0x12ff0000                        # 38cb: 81c7ff
            and          a7, a7, a9                            # 38ce: 907710
            beq          a7, a8, .Lbr319                       # 38d1: 871703
            movi         a10, 0 /* 0x00000000 */               # 38d4: 0c0a
            s32i         a10, a12, 12 /* 0x00000000 -> [sdk_chip6_sleep_params] */ # 38d6: a93c
.Lbr319:    l8ui         a0, a15, 0 /* [.Ldata099] */          # 38d8: 020f00
.Lbr320:    movi         a7, 1 /* 0x00000001 */                # 38db: 0c17
            movi         a4, 0x60000a00                        # 38dd: 41c3ff
            memw                                               # 38e0: c02000
            l32i         a6, a4, 0x348 /* [0x60000d48] */      # 38e3: 6224d2
            or           a6, a6, a7                            # 38e6: 706620
            memw                                               # 38e9: c02000
            s32i         a6, a4, 0x348 /* a6 -> [0x60000d48] */ # 38ec: 6264d2
            movi         a5, -2 /* 0xfffffffe */               # 38ef: 7ce5
            memw                                               # 38f1: c02000
            l32i         a3, a4, 0x348 /* [0x60000d48] */      # 38f4: 3224d2
            and          a3, a3, a5                            # 38f7: 503310
            memw                                               # 38fa: c02000
            movi         a11, sdk_ram_cal_tos_v60              # 38fd: b1bfff
            movi         a9, sdk_ram_chip_v6_rx_init           # 3900: 91c1ff
            movi         a10, sdk_ram_pbus_debugmode           # 3903: a1bfff
            movi         a8, sdk_ram_get_noisefloor            # 3906: 81c0ff
            movi         a7, sdk_ram_set_noise_floor           # 3909: 71c0ff
            movi         a6, sdk_ram_start_noisefloor          # 390c: 61c1ff
            movi         a5, sdk_ram_get_fm_sar_dout           # 390f: 51c1ff
            s32i         a3, a4, 0x348 /* a3 -> [0x60000d48] */ # 3912: 3264d2
            movi         a2, sdk_g_phyFuns                     # 3915: 21b6ff
            movi         a3, sdk_ram_rxiq_get_mis              # 3918: 31b8ff
            l32i         a2, a2, 0 /* [sdk_g_phyFuns] */       # 391b: 2802
            movi         a4, sdk_ram_rxiq_cover_mg_mp          # 391d: 41b5ff
            s32i         a5, a2, 36 /* sdk_ram_get_fm_sar_dout -> [[sdk_g_phyFuns]+0x24] */ # 3920: 5992
            s32i         a6, a2, 100 /* sdk_ram_start_noisefloor -> [[sdk_g_phyFuns]+0x64] */ # 3922: 626219
            s32i         a7, a2, 88 /* sdk_ram_set_noise_floor -> [[sdk_g_phyFuns]+0x58] */ # 3925: 726216
            s32i         a8, a2, 40 /* sdk_ram_get_noisefloor -> [[sdk_g_phyFuns]+0x28] */ # 3928: 89a2
            s32i         a10, a2, 160 /* sdk_ram_pbus_debugmode -> [[sdk_g_phyFuns]+0xa0] */ # 392a: a26228
            s32i         a9, a2, 136 /* sdk_ram_chip_v6_rx_init -> [[sdk_g_phyFuns]+0x88] */ # 392d: 926222
            s32i         a11, a2, 232 /* sdk_ram_cal_tos_v60 -> [[sdk_g_phyFuns]+0xe8] */ # 3930: b2623a
            s32i         a4, a2, 0x10c /* sdk_ram_rxiq_cover_mg_mp -> [[sdk_g_phyFuns]+0x10c] */ # 3933: 426243
            s32i         a3, a2, 72 /* sdk_ram_rxiq_get_mis -> [[sdk_g_phyFuns]+0x48] */ # 3936: 326212
            movi         a4, sdk_ram_restart_cal               # 3939: 41b7ff
            movi         a3, sdk_ram_tx_mac_enable             # 393c: 31b8ff
            movi         a11, sdk_ram_tx_mac_disable           # 393f: b1b8ff
            s32i         a11, a2, 116 /* sdk_ram_tx_mac_disable -> [[sdk_g_phyFuns]+0x74] */ # 3942: b2621d
            s32i         a3, a2, 120 /* sdk_ram_tx_mac_enable -> [[sdk_g_phyFuns]+0x78] */ # 3945: 32621e
            s32i         a4, a2, 216 /* sdk_ram_restart_cal -> [[sdk_g_phyFuns]+0xd8] */ # 3948: 426236
            bnez         a0, .Lbr321                           # 394b: ccc0
            mov          a2, a14 /* arg0 */                    # 394d: 2d0e
            call0        sdk_register_chipv6_phy_init_param    # 394f: 050000
            mov          a14, a2                               # 3952: ed02
            movi         a8, 14 /* 0x0000000e */               # 3954: 0ce8
            s32i         a8, sp, 0 /* 0x0000000e -> [(local0)] */ # 3956: 8901
            j            .Lbr322                               # 3958: 060300
.Lbr321:    l8ui         a9, a12, 90 /* [.Ldata003] */         # 395b: 920c5a
            movi         a14, 0 /* 0x00000000 */               # 395e: 0c0e
            slli         a9, a9, 24                            # 3960: 809901
            srai         a9, a9, 24                            # 3963: 909831
            s32i         a9, sp, 0 /* a9 -> [(local0)] */      # 3966: 9901
.Lbr322:    call0        sdk_set_crystal_uart                  # 3968: 050000
            call0        sdk_ant_switch_init                   # 396b: 050000
            call0        sdk_phy_gpio_cfg                      # 396e: 050000
            call0        sdk_tx_cont_dis                       # 3971: 050000
            movi         a2, .Lrel001                          # 3974: 21acff
            call0        sdk_register_phy_ops                  # 3977: 01b3ffc0
                                                               # 397b: 0000
            l8ui         a10, a15, 0 /* [.Ldata099] */         # 397d: a20f00
            l32i         a0, a12, 12 /* [sdk_chip6_sleep_params] */ # 3980: 083c
            bnei         a10, 1, .Lbr323                       # 3982: 661a0d
            bbsi         a0, 27, .Lbr324                       # 3985: b7f02a
            l32i         a2, sp, 0 /* [(local0)] */            # 3988: 2801
            call0        sdk_chip_v6_set_chan                  # 398a: 01afffc0
                                                               # 398e: 0000
            j            .Lbr324                               # 3990: c60700
.Lbr323:    movi         a4, 0 /* 0x00000000 */                # 3993: 0c04
            movi         a2, sdk_chip6_sleep_params            # 3995: 21a4ff
            movi         a11, 0x02000000                       # 3998: b1a5ff
            addi         a3, a2, 111 /* .bss+0x7b */           # 399b: 32c26f
            or           a11, a0, a11                          # 399e: b0b020
            s32i         a11, a12, 12 /* a11 -> [sdk_chip6_sleep_params] */ # 39a1: b93c
            call0        sdk_rtc_mem_backup                    # 39a3: 050000
            mov          a4, a2                                # 39a6: 4d02
            s32i         a2, a12, 0x1dc /* a2 -> [.Ldata022] */ # 39a8: 226c77
            movi         a2, .Label003                         # 39ab: 21a1ff
            addi         a3, a2, 9 /* .Ldata018 */             # 39ae: 9b32
            call0        sdk_rtc_mem_backup                    # 39b0: 050000
.Lbr324:    movi         a2, 0x01110000                        # 39b3: 21a0ff
            memw                                               # 39b6: c02000
            l32i         a0, a13, 0x27c /* [0x6000107c] */     # 39b9: 022d9f
            extui        a0, a0, 0, 16                         # 39bc: 0000f4
            or           a0, a0, a2                            # 39bf: 200020
            memw                                               # 39c2: c02000
            movi         a12, .Ldata020                        # 39c5: c19cff
            s32i         a0, a13, 0x27c /* a0 -> [0x6000107c] */ # 39c8: 026d9f
            l8ui         a12, a12, 103 /* [.Ldata071] */       # 39cb: c20c67
            bnei         a12, 2, .Lbr325                       # 39ce: 662c43
            movi         a5, .Ldata020                         # 39d1: 519aff
            l8ui         a6, a5, 102 /* [.Ldata070] */         # 39d4: 620566
            l8ui         a4, a5, 100 /* [.Ldata068] */         # 39d7: 420564
            l8ui         a3, a5, 99 /* [.Ldata067] */          # 39da: 320563
            slli         a4, a4, 8                             # 39dd: 804411
            or           a3, a3, a4                            # 39e0: 403320
            l8ui         a4, a5, 117 /* [.Ldata085] */         # 39e3: 420575
            l8ui         a2, a5, 116 /* [.Ldata084] */         # 39e6: 220574
            slli         a4, a4, 8                             # 39e9: 804411
            or           a2, a2, a4                            # 39ec: 402220
            l8ui         a4, a5, 101 /* [.Ldata069] */         # 39ef: 420565
            slli         a6, a6, 24                            # 39f2: 806601
            slli         a4, a4, 16                            # 39f5: 004411
            or           a4, a4, a6                            # 39f8: 604420
            or           a3, a3, a4                            # 39fb: 403320
            l8ui         a6, a5, 119 /* [.Ldata087] */         # 39fe: 620577
            l8ui         a5, a5, 118 /* [.Ldata086] */         # 3a01: 520576
            slli         a6, a6, 24                            # 3a04: 806601
            slli         a5, a5, 16                            # 3a07: 005511
            or           a5, a5, a6                            # 3a0a: 605520
            or           a2, a2, a5                            # 3a0d: 502220
            memw                                               # 3a10: c02000
            s32i         a2, a3, 0                             # 3a13: 2903
.Lbr325:    l32i         a0, sp, 4 /* [(local1)] */            # 3a15: 0811
            l32i         a12, sp, 8 /* [(local2)] */           # 3a17: c821
            l32i         a13, sp, 12 /* [(local3)] */          # 3a19: d831
            mov          a2, a14                               # 3a1b: 2d0e
            movi         a5, 1 /* 0x00000001 */                # 3a1d: 0c15
            s8i          a5, a15, 0 /* 0x01 -> [.Ldata099] */  # 3a1f: 524f00
            l32i         a14, sp, 16 /* [(local4)] */          # 3a22: e841
            l32i         a15, sp, 20 /* [(local5)] */          # 3a24: f851
            addi         sp, sp, 32 /* (top of frame) */       # 3a26: 12c120
            ret                                                # 3a29: 0df0
.Lbr326:    movi         a2, 0 /* 0x00000000 */                # 3a2b: 0c02
            movi         a5, 0 /* 0x00000000 */                # 3a2d: 0c05
.Lbr327:    movi         a7, 0xffff0000                        # 3a2f: 7184ff
            memw                                               # 3a32: c02000
            l32i         a6, a13, 0x27c /* [0x6000107c] */     # 3a35: 622d9f
            and          a6, a6, a7                            # 3a38: 706610
            or           a6, a6, a2                            # 3a3b: 206620
            memw                                               # 3a3e: c02000
            s32i         a6, a13, 0x27c /* a6 -> [0x6000107c] */ # 3a41: 626d9f
            j            .Lbr318                               # 3a44: 8697ff
.Lbr328:    movi         a5, 1 /* 0x00000001 */                # 3a47: 0c15
            addi         a2, a2, 1                             # 3a49: 1b22
            extui        a2, a2, 0, 16                         # 3a4b: 2020f4
            j            .Lbr327                               # 3a4e: 46f7ff

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "set_rx_gain: rftx=%x, rfrx=x%x, att=%d, txbb=0x%x, bbrx1=0x%x, bbrx2=0x%x, tdc:%d,%d\n" #    0: 7365745f
                                                               #    4: 72785f67
                                                               #    8: 61696e3a
                                                               #    c: 20726674
                                                               #   10: 783d2578
                                                               #   14: 2c207266
                                                               #   18: 72783d78
                                                               #   1c: 25782c20
                                                               #   20: 6174743d
                                                               #   24: 25642c20
                                                               #   28: 74786262
                                                               #   2c: 3d307825
                                                               #   30: 782c2062
                                                               #   34: 62727831
                                                               #   38: 3d307825
                                                               #   3c: 782c2062
                                                               #   40: 62727832
                                                               #   44: 3d307825
                                                               #   48: 782c2074
                                                               #   4c: 64633a25
                                                               #   50: 642c2564
                                                               #   54: 0a00
            .balign      4
.Lstr002:   .asciz       "total_pwr=%ld, max=%ld, \n"          #   58: 746f7461
                                                               #   5c: 6c5f7077
                                                               #   60: 723d256c
                                                               #   64: 642c206d
                                                               #   68: 61783d25
                                                               #   6c: 6c642c20
                                                               #   70: 0a00
            .balign      4
.Lstr003:   .asciz       "%d_%d_%d\n"                          #   74: 25645f25
                                                               #   78: 645f2564
                                                               #   7c: 0a00
            .balign      4
.Lstr004:   .asciz       "rxiq_reg: i=%d, a_mis=%d, p_mis=%d\n" #   80: 72786971
                                                               #   84: 5f726567
                                                               #   88: 3a20693d
                                                               #   8c: 25642c20
                                                               #   90: 615f6d69
                                                               #   94: 733d2564
                                                               #   98: 2c20705f
                                                               #   9c: 6d69733d
                                                               #   a0: 25640a00
.Lstr005:   .asciz       "index: %d value: 0x%x 0x%x 0x%x 0x%x\n" #   a4: 696e6465
                                                               #   a8: 783a2025
                                                               #   ac: 64207661
                                                               #   b0: 6c75653a
                                                               #   b4: 20307825
                                                               #   b8: 78203078
                                                               #   bc: 25782030
                                                               #   c0: 78257820
                                                               #   c4: 30782578
                                                               #   c8: 0a00
            .balign      4
.Label021:  .byte        0x0a, 0x00

            .section     .rodata, "a", @progbits

.Ldata100:  .hword       0x0000                                #    0: 0000
.Ldata101:  .byte        0x00
            .balign      4
.Ldata102:  .word        0x41200000                            #    4: 00002041

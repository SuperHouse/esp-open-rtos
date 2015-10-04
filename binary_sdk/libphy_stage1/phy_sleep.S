
            .section     .text, "ax", @progbits

            .literal_position                                  #    0: ffffff7f
                                                               #    4: 00020060
                                                               #    8: 00000080
                                                               #    c: ffffff0f
                                                               #   10: 00000000
                                                               #   14: 00000000
                                                               #   18: 00000000

# Function @ .text+0x1c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      pm_rtc_clock_cali
            .type        pm_rtc_clock_cali, @function
pm_rtc_clock_cali:
            addi         sp, sp, -16 /* (local0) */            #   1c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   1f: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #   21: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   23: c911
            movi         a5, 0x7fffffff                        #   25: 51f6ff
            mov          a12, a2 /* arg0 */                    #   28: cd02
            movi         a13, 0x60000200                       #   2a: d1f6ff
            memw                                               #   2d: c02000
            l32i         a4, a13, 0x170 /* [0x60000370] */     #   30: 422d5c
            and          a4, a4, a5                            #   33: 504410
            memw                                               #   36: c02000
            s32i         a4, a13, 0x170 /* a4 -> [0x60000370] */ #   39: 426d5c
            movi         a3, 257 /* 0x00000101 */              #   3c: 32a101
            memw                                               #   3f: c02000
            s32i         a3, a13, 0x16c /* 0x00000101 -> [0x6000036c] */ #   42: 326d5b
            movi         a2, 0x80000000                        #   45: 21f0ff
            memw                                               #   48: c02000
            l32i         a0, a13, 0x16c /* [0x6000036c] */     #   4b: 022d5b
            or           a0, a0, a2                            #   4e: 200020
            memw                                               #   51: c02000
            movi         a2, 100 /* 0x00000064 */              #   54: 22a064
            s32i         a0, a13, 0x16c /* a0 -> [0x6000036c] */ #   57: 026d5b
            call0        ets_delay_us                          #   5a: 01eeffc0
                                                               #   5e: 0000
            memw                                               #   60: c02000
            l32i         a6, a13, 0x170 /* [0x60000370] */     #   63: 622d5c
            bltz         a6, .Lbr002                           #   66: 968600
.Lbr001:    memw                                               #   69: c02000
            l32i         a7, a13, 0x170 /* [0x60000370] */     #   6c: 722d5c
            bgez         a7, .Lbr001                           #   6f: d667ff
.Lbr002:    movi         a3, 0x0fffffff                        #   72: 31e6ff
            memw                                               #   75: c02000
            movi         a0, chip6_phy_init_ctrl               #   78: 01e6ff
            l32i         a2, a13, 0x170 /* [0x60000370] */     #   7b: 222d5c
            l8ui         a0, a0, 1 /* [chip6_phy_init_ctrl+0x1] */ #   7e: 020001
            and          a2, a2, a3                            #   81: 302210
            beqz         a0, .Lbr003                           #   84: 8c40
            beqi         a0, 1, .Lbr004                        #   86: 261007
            beqi         a0, 2, .Lbr010                        #   89: 26203f
.Lbr003:    movi         a3, 40 /* 0x00000028 */               #   8c: 2c83
            j            .Lbr005                               #   8e: 460000
.Lbr004:    movi         a3, 26 /* 0x0000001a */               #   91: 1ca3
.Lbr005:    slli         a2, a2, 4                             #   93: c02211
            call0        __udivsi3                             #   96: 01e0ffc0
                                                               #   9a: 0000
            l32i         a13, sp, 8 /* [(local2)] */           #   9c: d821
            beqz         a2, .Lbr009                           #   9e: ac12
            l32i         a0, a12, 4 /* [arg0+0x4] */           #   a0: 081c
            beqz         a0, .Lbr008                           #   a2: 9cb0
            movi         a4, 511 /* 0x000001ff */              #   a4: 42a1ff
            bgeu         a0, a2, .Lbr006                       #   a7: 27b005
            sub          a3, a2, a0                            #   aa: 0032c0
            j            .Lbr007                               #   ad: 860000
.Lbr006:    sub          a3, a0, a2                            #   b0: 2030c0
.Lbr007:    bltu         a4, a3, .Lbr009                       #   b3: 37340c
            addx4        a3, a2, a2                            #   b6: 2032a0
            addx2        a2, a0, a0                            #   b9: 002090
            add          a2, a2, a3                            #   bc: 3a22
            srli         a2, a2, 3                             #   be: 202341
.Lbr008:    s32i         a2, a12, 4 /* a2 -> [arg0+0x4] */     #   c1: 291c
.Lbr009:    l32i         a12, sp, 4 /* [(local1)] */           #   c3: c811
            l32i         a0, sp, 0 /* [(local0)] */            #   c5: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   c7: 12c110
            ret                                                #   ca: 0df0
.Lbr010:    movi         a3, 24 /* 0x00000018 */               #   cc: 1c83
            j            .Lbr005                               #   ce: 46f0ff

            .literal_position                                  #   d4: 00feef3f

# Function @ .text+0xd8
            .balign      4
            .global      clockgate_watchdog
            .type        clockgate_watchdog, @function
clockgate_watchdog:
            movi         a4, 0x3feffe00                        #   d8: 41ffff
            beqz         a2, .Lbr011                           #   db: 9c12
            movi         a6, -9 /* 0xfffffff7 */               #   dd: 7c76
            memw                                               #   df: c02000
            l32i         a5, a4, 0x218 /* [0x3ff00018] */      #   e2: 522486
            and          a5, a5, a6                            #   e5: 605510
            memw                                               #   e8: c02000
            s32i         a5, a4, 0x218 /* a5 -> [0x3ff00018] */ #   eb: 526486
            ret           /* arg0 */                           #   ee: 0df0
.Lbr011:    movi         a3, 8 /* 0x00000008 */                #   f0: 0c83
            memw                                               #   f2: c02000
            l32i         a2, a4, 0x218 /* [0x3ff00018] */      #   f5: 222486
            or           a2, a2, a3                            #   f8: 302220
            memw                                               #   fb: c02000
            s32i         a2, a4, 0x218 /* a2 -> [0x3ff00018] */ #   fe: 226486
            ret                                                #  101: 0df0

            .section     .data, "aw", @progbits

            .global      chip_version
            .type        chip_version, @object
chip_version:
            .word        0xffffffff                            #    0: ffffffff

            .section     .bss, "aw", @nobits

            .global      periodic_cal_sat
            .type        periodic_cal_sat, @object
periodic_cal_sat:
            .byte        0x00
            .global      software_slp_reject
            .type        software_slp_reject, @object
software_slp_reject:
            .byte        0x00
            .global      SDIO_slp_reject
            .type        SDIO_slp_reject, @object
SDIO_slp_reject:
            .byte        0x00
            .global      hardware_reject
            .type        hardware_reject, @object
hardware_reject:
            .byte        0x00

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: ffff0f00
                                                               #    4: 00000000
                                                               #    8: 00000000
                                                               #    c: 00000000

# Function @ .irom0.text+0x10
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      pm_usec2rtc
            .type        pm_usec2rtc, @function
pm_usec2rtc:
            addi         sp, sp, -16 /* (local0) */            #   10: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   13: 0901
            bnez         a3, .Lbr012                           #   15: cc93
            movi         a3, 5 /* 0x00000005 */                #   17: 0c53
            call0        __udivsi3                             #   19: 01faffc0
                                                               #   1d: 0000
            j            .Lbr014                               #   1f: 860600
.Lbr012:    movi         a0, 0x000fffff                        #   22: 01f7ff
            bgeu         a0, a2, .Lbr013                       #   25: 27b00b
            call0        __udivsi3                             #   28: 01f8ffc0
                                                               #   2c: 0000
            slli         a2, a2, 12                            #   2e: 402211
            j            .Lbr014                               #   31: 060200
.Lbr013:    slli         a2, a2, 12                            #   34: 402211
            call0        __udivsi3                             #   37: 01f5ffc0
                                                               #   3b: 0000
.Lbr014:    l32i         a0, sp, 0 /* [(local0)] */            #   3d: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   3f: 12c110
            ret                                                #   42: 0df0

# Function @ .irom0.text+0x44
            .balign      4
            .global      pm_rtc2usec
            .type        pm_rtc2usec, @function
pm_rtc2usec:
            mull         a2, a2, a3                            #   44: 302282
            srli         a2, a2, 12                            #   47: 202c41
            ret                                                #   4a: 0df0

            .literal_position                                  #   4c: 00060060
                                                               #   50: 00000000
                                                               #   54: 88130000

# Function @ .irom0.text+0x58
            .balign      4
            .global      pm_set_sleep_cycles
            .type        pm_set_sleep_cycles, @function
pm_set_sleep_cycles:
            movi         a5, 0x60000600                        #   58: 51fdff
            memw                                               #   5b: c02000
            l32i         a4, a5, 0x11c /* [0x6000071c] */      #   5e: 422547
            add          a4, a2, a4                            #   61: 4a42
            memw                                               #   63: c02000
            movi         a6, periodic_cal_sat                  #   66: 61faff
            s32i         a4, a5, 0x104 /* a4 -> [0x60000704] */ #   69: 426541
            movi         a3, 0x00001388                        #   6c: 31faff
            movi         a5, 1 /* 0x00000001 */                #   6f: 0c15
            bltu         a3, a2, .Lbr015                       #   71: 273301
            movi         a5, 0 /* 0x00000000 */                #   74: 0c05
.Lbr015:    s8i          a5, a6, 0 /* a5 -> [periodic_cal_sat] */ #   76: 524600
            ret           /* arg0 */                           #   79: 0df0

            .literal_position                                  #   7c: 00000000
                                                               #   80: 00060060
                                                               #   84: 00000000
                                                               #   88: fffffcff
                                                               #   8c: 00000100
                                                               #   90: 00020060
                                                               #   94: 00000000
                                                               #   98: ffff7ffe
                                                               #   9c: 00008000
                                                               #   a0: 00020060
                                                               #   a4: 00000000
                                                               #   a8: 00000050
                                                               #   ac: 00000000

# Function @ .irom0.text+0xb0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      pm_sleep_opt
            .type        pm_sleep_opt, @function
pm_sleep_opt:
            addi         sp, sp, -16 /* (local0) */            #   b0: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   b3: 0901
            movi         a0, chip6_phy_init_ctrl               #   b5: 01f1ff
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   b8: c911
            l8ui         a0, a0, 57 /* [chip6_phy_init_ctrl+0x39] */ #   ba: 020039
            movi         a12, 0x60000600                       #   bd: c1f0ff
            bnez         a0, .Lbr016                           #   c0: dc20
            movi         a5, -4 /* 0xfffffffc */               #   c2: 7cc5
            memw                                               #   c4: c02000
            l32i         a3, a12, 0x164 /* [0x60000764] */     #   c7: 322c59
            and          a3, a3, a5                            #   ca: 503310
            memw                                               #   cd: c02000
            s32i         a3, a12, 0x164 /* a3 -> [0x60000764] */ #   d0: 326c59
            j            .Lbr018                               #   d3: 860700
.Lbr016:    bnei         a0, 1, .Lbr017                        #   d6: 661007
            movi         a6, 32 /* 0x00000020 */               #   d9: 2c06
            or           a4, a4, a6                            #   db: 604420
            j            .Lbr018                               #   de: c60400
.Lbr017:    bnei         a0, 2, .Lbr018                        #   e1: 662010
            movi         a8, 3 /* 0x00000003 */                #   e4: 0c38
            memw                                               #   e6: c02000
            l32i         a7, a12, 0x164 /* [0x60000764] */     #   e9: 722c59
            or           a7, a7, a8                            #   ec: 807720
            memw                                               #   ef: c02000
            s32i         a7, a12, 0x164 /* a7 -> [0x60000764] */ #   f2: 726c59
.Lbr018:    movi         a3, 0 /* 0x00000000 */                #   f5: 0c03
            movi         a0, g_phyFuns                         #   f7: 01e3ff
            memw                                               #   fa: c02000
            s32i         a3, a12, 0x140 /* 0x00000000 -> [0x60000740] */ #   fd: 326c50
            memw                                               #  100: c02000
            s32i         a2, a12, 0x144 /* arg0 -> [0x60000744] */ #  103: 226c51
            memw                                               #  106: c02000
            movi         a2, 119 /* 0x00000077 */              #  109: 22a077
            movi         a5, 5 /* 0x00000005 */                #  10c: 0c55
            movi         a6, 5 /* 0x00000005 */                #  10e: 0c56
            movi         a7, 1 /* 0x00000001 */                #  110: 0c17
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  112: 0800
            s32i         a4, a12, 0x100 /* a4 -> [0x60000700] */ #  114: 426c40
            l32i         a0, a0, 156 /* [[g_phyFuns]+0x9c] */  #  117: 022027
            movi         a4, 28 /* 0x0000001c */               #  11a: 1cc4
            callx0       a0 /* [[g_phyFuns]+0x9c] */           #  11c: c00000
            movi         a5, 0xfffcffff                        #  11f: 51daff
            movi         a4, 0x00010000                        #  122: 41daff
            movi         a3, 0x60000200                        #  125: 31daff
            memw                                               #  128: c02000
            l32i         a2, a3, 0x3c8 /* [0x600005c8] */      #  12b: 2223f2
            and          a2, a2, a5                            #  12e: 502210
            or           a2, a2, a4                            #  131: 402220
            memw                                               #  134: c02000
            s32i         a2, a3, 0x3c8 /* a2 -> [0x600005c8] */ #  137: 2263f2
            movi         a2, 1 /* 0x00000001 */                #  13a: 0c12
            call0        ets_delay_us                          #  13c: 01dcffc0
                                                               #  140: 0000
            movi         a2, 119 /* 0x00000077 */              #  142: 22a077
            movi         a3, 0 /* 0x00000000 */                #  145: 0c03
            movi         a4, 28 /* 0x0000001c */               #  147: 1cc4
            movi         a0, g_phyFuns                         #  149: 01d2ff
            movi         a5, 5 /* 0x00000005 */                #  14c: 0c55
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  14e: 0800
            movi         a6, 5 /* 0x00000005 */                #  150: 0c56
            l32i         a0, a0, 156 /* [[g_phyFuns]+0x9c] */  #  152: 022027
            movi         a7, 0 /* 0x00000000 */                #  155: 0c07
            callx0       a0 /* [[g_phyFuns]+0x9c] */           #  157: c00000
            movi         a5, 0xfe7fffff                        #  15a: 51cfff
            movi         a4, 0x00800000                        #  15d: 41cfff
            memw                                               #  160: c02000
            movi         a3, 0x60000200                        #  163: 31cfff
            l32i         a2, a3, 0x3e8 /* [0x600005e8] */      #  166: 2223fa
            and          a2, a2, a5                            #  169: 502210
            or           a2, a2, a4                            #  16c: 402220
            memw                                               #  16f: c02000
            movi         a4, 3 /* 0x00000003 */                #  172: 0c34
            movi         a5, 7 /* 0x00000007 */                #  174: 0c75
            movi         a6, 4 /* 0x00000004 */                #  176: 0c46
            movi         a0, g_phyFuns                         #  178: 01cbff
            movi         a7, 0 /* 0x00000000 */                #  17b: 0c07
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  17d: 0800
            s32i         a2, a3, 0x3e8 /* a2 -> [0x600005e8] */ #  17f: 2263fa
            movi         a2, 98 /* 0x00000062 */               #  182: 22a062
            l32i         a0, a0, 156 /* [[g_phyFuns]+0x9c] */  #  185: 022027
            movi         a3, 1 /* 0x00000001 */                #  188: 0c13
            callx0       a0 /* [[g_phyFuns]+0x9c] */           #  18a: c00000
            movi         a6, 0x50000000                        #  18d: 61c6ff
            memw                                               #  190: c02000
            s32i         a6, a12, 0x110 /* 0x50000000 -> [0x60000710] */ #  193: 626c44
            l32i         a12, sp, 4 /* [(local1)] */           #  196: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  198: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  19a: 12c110
            ret                                                #  19d: 0df0

            .literal_position                                  #  1a0: 00060060

# Function @ .irom0.text+0x1a4
            .balign      4
            .global      pm_wakeup_opt
            .type        pm_wakeup_opt, @function
pm_wakeup_opt:
            movi         a8, -64 /* 0xffffffc0 */              #  1a4: 82afc0
            movi         a5, 0x60000600                        #  1a7: 51feff
            memw                                               #  1aa: c02000
            l32i         a7, a5, 0x118 /* [0x60000718] */      #  1ad: 722546
            and          a7, a7, a8                            #  1b0: 807710
            or           a7, a7, a2                            #  1b3: 207720
            memw                                               #  1b6: c02000
            s32i         a7, a5, 0x118 /* a7 -> [0x60000718] */ #  1b9: 726546
            movi         a6, -2 /* 0xfffffffe */               #  1bc: 7ce6
            memw                                               #  1be: c02000
            l32i         a4, a5, 0x1a8 /* [0x600007a8] */      #  1c1: 42256a
            and          a4, a4, a6                            #  1c4: 604410
            or           a4, a4, a3                            #  1c7: 304420
            memw                                               #  1ca: c02000
            s32i         a4, a5, 0x1a8 /* a4 -> [0x600007a8] */ #  1cd: 42656a
            ret           /* arg0 */                           #  1d0: 0df0

            .literal_position                                  #  1d4: 00000000
                                                               #  1d8: 00800000
                                                               #  1dc: 0000000f
                                                               #  1e0: 00feef3f

# Function @ .irom0.text+0x1e4
            .balign      4
            .global      get_chip_version
            .type        get_chip_version, @function
get_chip_version:
            movi         a6, chip_version                      #  1e4: 61fcff
            l32i         a2, a6, 0 /* [chip_version] */        #  1e7: 2806
            bnei         a2, -1, .Lbr020                       #  1e9: 660225
            movi         a5, 0x00008000                        #  1ec: 51fbff
            movi         a4, 0x0f000000                        #  1ef: 41fbff
            movi         a2, 0x3feffe00                        #  1f2: 21fbff
            memw                                               #  1f5: c02000
            l32i         a3, a2, 0x258 /* [0x3ff00058] */      #  1f8: 322296
            and          a3, a3, a5                            #  1fb: 503310
            srli         a3, a3, 15                            #  1fe: 303f41
            bnei         a3, 1, .Lbr021                        #  201: 66130f
            memw                                               #  204: c02000
            l32i         a2, a2, 0x254 /* [0x3ff00054] */      #  207: 222295
.Lbr019:    and          a2, a2, a4                            #  20a: 402210
            extui        a2, a2, 24, 8                         #  20d: 202875
            s32i         a2, a6, 0 /* a2 -> [chip_version] */  #  210: 2906
.Lbr020:    ret                                                #  212: 0df0
.Lbr021:    memw                                               #  214: c02000
            l32i         a2, a2, 0x25c /* [0x3ff0005c] */      #  217: 222297
            j            .Lbr019                               #  21a: 06fbff

            .literal_position                                  #  220: 50008000
                                                               #  224: 00000000
                                                               #  228: 50008000
                                                               #  22c: 00008000

# Function @ .irom0.text+0x230
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      pm_sleep_opt_bb_off
            .type        pm_sleep_opt_bb_off, @function
pm_sleep_opt_bb_off:
            addi         sp, sp, -16 /* (local0) */            #  230: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  233: 0901
            call0        get_chip_version                      #  235: 050000
            beqi         a2, 2, .Lbr022                        #  238: 26220c
            movi         a2, 4 /* 0x00000004 */                #  23b: 0c42
            movi         a3, 0 /* 0x00000000 */                #  23d: 0c03
            movi         a4, 0x00800050                        #  23f: 41f8ff
            call0        pm_sleep_opt                          #  242: 050000
            j            .Lbr024                               #  245: c60700
.Lbr022:    movi         a0, chip6_phy_init_ctrl               #  248: 01f7ff
            l8ui         a0, a0, 101 /* [chip6_phy_init_ctrl+0x65] */ #  24b: 020065
            bnei         a0, 2, .Lbr023                        #  24e: 66200c
            movi         a2, 4 /* 0x00000004 */                #  251: 0c42
            movi         a3, 0 /* 0x00000000 */                #  253: 0c03
            movi         a4, 0x00800050                        #  255: 41f4ff
            call0        pm_sleep_opt                          #  258: 050000
            j            .Lbr024                               #  25b: 460200
.Lbr023:    movi         a2, 4 /* 0x00000004 */                #  25e: 0c42
            movi         a3, 0 /* 0x00000000 */                #  260: 0c03
            movi         a4, 0x00800000                        #  262: 41f2ff
            call0        pm_sleep_opt                          #  265: 050000
.Lbr024:    l32i         a0, sp, 0 /* [(local0)] */            #  268: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  26a: 12c110
            ret                                                #  26d: 0df0

            .literal_position                                  #  270: 50008000
                                                               #  274: 00000000
                                                               #  278: 50008000
                                                               #  27c: 00008000

# Function @ .irom0.text+0x280
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      pm_sleep_opt_bb_on
            .type        pm_sleep_opt_bb_on, @function
pm_sleep_opt_bb_on:
            addi         sp, sp, -16 /* (local0) */            #  280: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  283: 0901
            call0        get_chip_version                      #  285: 050000
            beqi         a2, 2, .Lbr025                        #  288: 26220c
            movi         a2, 0 /* 0x00000000 */                #  28b: 0c02
            movi         a3, 0 /* 0x00000000 */                #  28d: 0c03
            movi         a4, 0x00800050                        #  28f: 41f8ff
            call0        pm_sleep_opt                          #  292: 050000
            j            .Lbr027                               #  295: c60700
.Lbr025:    movi         a0, chip6_phy_init_ctrl               #  298: 01f7ff
            l8ui         a0, a0, 101 /* [chip6_phy_init_ctrl+0x65] */ #  29b: 020065
            bnei         a0, 2, .Lbr026                        #  29e: 66200c
            movi         a2, 0 /* 0x00000000 */                #  2a1: 0c02
            movi         a3, 0 /* 0x00000000 */                #  2a3: 0c03
            movi         a4, 0x00800050                        #  2a5: 41f4ff
            call0        pm_sleep_opt                          #  2a8: 050000
            j            .Lbr027                               #  2ab: 460200
.Lbr026:    movi         a2, 0 /* 0x00000000 */                #  2ae: 0c02
            movi         a3, 0 /* 0x00000000 */                #  2b0: 0c03
            movi         a4, 0x00800000                        #  2b2: 41f2ff
            call0        pm_sleep_opt                          #  2b5: 050000
.Lbr027:    l32i         a0, sp, 0 /* [(local0)] */            #  2b8: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  2ba: 12c110
            ret                                                #  2bd: 0df0

            .literal_position                                  #  2c0: 00060060
                                                               #  2c4: 00000000
                                                               #  2c8: 28e00100
                                                               #  2cc: 3c200300
                                                               #  2d0: 64800c00

# Function @ .irom0.text+0x2d4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      pm_set_pll_xtal_wait_time
            .type        pm_set_pll_xtal_wait_time, @function
pm_set_pll_xtal_wait_time:
            addi         sp, sp, -16 /* (local0) */            #  2d4: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  2d7: 0901
            call0        get_chip_version                      #  2d9: 050000
            movi         a0, 0x60000600                        #  2dc: 01f9ff
            beqi         a2, 1, .Lbr030                        #  2df: 26122b
            beqz         a2, .Lbr030                           #  2e2: ac82
            movi         a2, chip6_phy_init_ctrl               #  2e4: 21f8ff
            l8ui         a3, a2, 1 /* [chip6_phy_init_ctrl+0x1] */ #  2e7: 320201
            l8ui         a4, a2, 101 /* [chip6_phy_init_ctrl+0x65] */ #  2ea: 420265
            beqz         a3, .Lbr029                           #  2ed: 9c13
            beqi         a4, 2, .Lbr029                        #  2ef: 26240f
            movi         a5, 0x0001e028                        #  2f2: 51f5ff
            memw                                               #  2f5: c02000
            s32i         a5, a0, 0x10c /* 0x0001e028 -> [0x6000070c] */ #  2f8: 526043
.Lbr028:    l32i         a0, sp, 0 /* [(local0)] */            #  2fb: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  2fd: 12c110
            ret                                                #  300: 0df0
.Lbr029:    movi         a6, 0x0003203c                        #  302: 61f2ff
            memw                                               #  305: c02000
            s32i         a6, a0, 0x10c /* 0x0003203c -> [0x6000070c] */ #  308: 626043
            j            .Lbr028                               #  30b: 06fbff
.Lbr030:    movi         a7, 0x000c8064                        #  30e: 71f0ff
            memw                                               #  311: c02000
            s32i         a7, a0, 0x10c /* 0x000c8064 -> [0x6000070c] */ #  314: 726043
            j            .Lbr028                               #  317: 06f8ff

            .literal_position                                  #  31c: 00000000
                                                               #  320: 00060060

# Function @ .irom0.text+0x324
            .balign      4
            .global      pm_prepare_to_sleep
            .type        pm_prepare_to_sleep, @function
pm_prepare_to_sleep:
            movi         a3, chip6_phy_init_ctrl               #  324: 31feff
            l8ui         a2, a3, 57 /* [chip6_phy_init_ctrl+0x39] */ #  327: 220339
            l8ui         a3, a3, 58 /* [chip6_phy_init_ctrl+0x3a] */ #  32a: 32033a
            beqi         a2, 2, .Lbr031                        #  32d: 262210
            beqi         a3, 1, .Lbr031                        #  330: 26130d
            beqi         a3, 3, .Lbr031                        #  333: 26330a
            movi         a3, 2 /* 0x00000002 */                #  336: 0c23
            movi         a4, 0x60000600                        #  338: 41faff
            memw                                               #  33b: c02000
            s32i         a3, a4, 0x1a0 /* 0x00000002 -> [0x600007a0] */ #  33e: 326468
.Lbr031:    ret           /* [chip6_phy_init_ctrl+0x39] */     #  341: 0df0

            .literal_position                                  #  344: ffffefff
                                                               #  348: 00feef3f
                                                               #  34c: 00020060
                                                               #  350: 11200000
                                                               #  354: 000a0060

# Function @ .irom0.text+0x358
            .balign      4
            .global      pm_sdio_nidle
            .type        pm_sdio_nidle, @function
pm_sdio_nidle:
            movi         a7, 0xffefffff                        #  358: 71fbff
            movi         a8, 0x3feffe00                        #  35b: 81fbff
            memw                                               #  35e: c02000
            l32i         a6, a8, 0x218 /* [0x3ff00018] */      #  361: 622886
            movi         a2, 0x60000200                        #  364: 21faff
            and          a6, a6, a7                            #  367: 706610
            memw                                               #  36a: c02000
            l32i         a2, a2, 0x118 /* [0x60000318] */      #  36d: 222246
            movi         a7, 0x00002011                        #  370: 71f8ff
            bbci         a2, 18, .Lbr034                       #  373: 277251
            movi         a5, 0x60000a00                        #  376: 51f7ff
            memw                                               #  379: c02000
            l32i         a9, a5, 0x158 /* [0x60000b58] */      #  37c: 922556
            beq          a9, a7, .Lbr033                       #  37f: 771903
.Lbr032:    movi         a2, 1 /* 0x00000001 */                #  382: 0c12
            ret           /* 0x00000001 */                     #  384: 0df0
.Lbr033:    memw                                               #  386: c02000
            l32i         a2, a5, 0x13c /* [0x60000b3c] */      #  389: 22254f
            extui        a10, a2, 18, 2                        #  38c: 20a215
            bnei         a10, 3, .Lbr032                       #  38f: 663aef
            extui        a11, a2, 20, 3                        #  392: 20b425
            bnei         a11, 2, .Lbr032                       #  395: 662be9
            extui        a3, a2, 23, 9                         #  398: 203785
            movi         a9, 127 /* 0x0000007f */              #  39b: 92a07f
            bany         a9, a3, .Lbr032                       #  39e: 3789e0
            memw                                               #  3a1: c02000
            l32i         a2, a5, 0x13c /* [0x60000b3c] */      #  3a4: 22254f
            extui        a4, a2, 18, 2                         #  3a7: 204215
            bnei         a4, 3, .Lbr032                        #  3aa: 6634d4
            extui        a10, a2, 20, 3                        #  3ad: 20a425
            bnei         a10, 2, .Lbr032                       #  3b0: 662ace
            extui        a11, a2, 23, 9                        #  3b3: 20b785
            bany         a9, a11, .Lbr032                      #  3b6: b789c8
            memw                                               #  3b9: c02000
            l32i         a2, a5, 0x158 /* [0x60000b58] */      #  3bc: 222556
            bne          a2, a7, .Lbr032                       #  3bf: 7792bf
            memw                                               #  3c2: c02000
            s32i         a6, a8, 0x218 /* a6 -> [0x3ff00018] */ #  3c5: 626886
.Lbr034:    movi         a2, 0 /* 0x00000000 */                #  3c8: 0c02
            ret           /* 0x00000000 */                     #  3ca: 0df0

            .literal_position                                  #  3cc: 00000000
                                                               #  3d0: 00000000
                                                               #  3d4: 00000000
                                                               #  3d8: 000a0060
                                                               #  3dc: 00060060
                                                               #  3e0: 00001000

# Function @ .irom0.text+0x3e4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      pm_goto_sleep
            .type        pm_goto_sleep, @function
pm_goto_sleep:
            addi         sp, sp, -16 /* (local0) */            #  3e4: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  3e7: 0901
            beqi         a2, 1, .Lbr037                        #  3e9: 26120b
            beqi         a2, 2, .Lbr037                        #  3ec: 262208
.Lbr035:    movi         a2, 1 /* 0x00000001 */                #  3ef: 0c12
.Lbr036:    l32i         a0, sp, 0 /* [(local0)] */            #  3f1: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  3f3: 12c110
            ret                                                #  3f6: 0df0
.Lbr037:    call0        pm_sdio_nidle                         #  3f8: 050000
            movi         a3, periodic_cal_sat                  #  3fb: 31f4ff
            movi         a4, periodic_cal_flag                 #  3fe: 41f4ff
            s8i          a2, a3, 2 /* a2 -> [SDIO_slp_reject] */ #  401: 224302
            l8ui         a4, a4, 0 /* [periodic_cal_flag] */   #  404: 420400
            l8ui         a0, a3, 0 /* [periodic_cal_sat] */    #  407: 020300
            s8i          a2, a3, 1 /* a2 -> [software_slp_reject] */ #  40a: 224301
            and          a0, a0, a4                            #  40d: 400010
            or           a0, a2, a0                            #  410: 000220
            s8i          a0, a3, 1 /* a0 -> [software_slp_reject] */ #  413: 024301
            extui        a0, a0, 0, 8                          #  416: 000074
            bnez         a0, .Lbr035                           #  419: 5620fd
            movi         a3, bbpll_cal_flag                    #  41c: 31eeff
            movi         a2, 1 /* 0x00000001 */                #  41f: 0c12
            s8i          a2, a3, 0 /* 0x01 -> [bbpll_cal_flag] */ #  421: 224300
            movi         a6, 0x60000a00                        #  424: 61edff
            movi         a0, -1 /* 0xffffffff */               #  427: 7cf0
            movi         a10, 0x60000600                       #  429: a1ecff
            memw                                               #  42c: c02000
            s32i         a0, a10, 0x124 /* 0xffffffff -> [0x60000724] */ #  42f: 026a49
            movi         a11, 0x00100000                       #  432: b1ebff
            memw                                               #  435: c02000
            l32i         a9, a10, 0x108 /* [0x60000708] */     #  438: 922a42
            or           a9, a9, a11                           #  43b: b09920
            memw                                               #  43e: c02000
            s32i         a9, a10, 0x108 /* a9 -> [0x60000708] */ #  441: 926a42
            movi         a7, 8 /* 0x00000008 */                #  444: 0c87
            movi         a8, -13 /* 0xfffffff3 */              #  446: 7c38
            memw                                               #  448: c02000
            l32i         a5, a6, 0x340 /* [0x60000d40] */      #  44b: 5226d0
            and          a5, a5, a8                            #  44e: 805510
            or           a5, a5, a7                            #  451: 705520
            memw                                               #  454: c02000
            s32i         a5, a6, 0x340 /* a5 -> [0x60000d40] */ #  457: 5266d0
            movi         a2, 0 /* 0x00000000 */                #  45a: 0c02
            j            .Lbr036                               #  45c: 46e4ff

            .literal_position                                  #  460: 00000000
                                                               #  464: 00060060

# Function @ .irom0.text+0x468
            .balign      4
            .global      pm_wait4wakeup
            .type        pm_wait4wakeup, @function
pm_wait4wakeup:
            beqi         a2, 1, .Lbr038                        #  468: 261202
            bnei         a2, 2, .Lbr041                        #  46b: 66222f
.Lbr038:    movi         a5, periodic_cal_sat                  #  46e: 51fcff
            l8ui         a2, a5, 1 /* [software_slp_reject] */ #  471: 220501
            bnez         a2, .Lbr041                           #  474: ec62
            movi         a2, 0x60000600                        #  476: 21fbff
            memw                                               #  479: c02000
            l32i         a3, a2, 0x128 /* [0x60000728] */      #  47c: 32224a
            extui        a3, a3, 0, 2                          #  47f: 303014
            bnez         a3, .Lbr040                           #  482: cca3
.Lbr039:    memw                                               #  484: c02000
            l32i         a4, a2, 0x128 /* [0x60000728] */      #  487: 42224a
            extui        a4, a4, 0, 2                          #  48a: 404014
            beqz         a4, .Lbr039                           #  48d: 1634ff
.Lbr040:    movi         a7, 2 /* 0x00000002 */                #  490: 0c27
            memw                                               #  492: c02000
            l32i         a6, a2, 0x128 /* [0x60000728] */      #  495: 62224a
            and          a6, a6, a7                            #  498: 706610
            s8i          a6, a5, 3 /* a6 -> [hardware_reject] */ #  49b: 624503
.Lbr041:    ret                                                #  49e: 0df0

            .literal_position                                  #  4a0: 000000fe
                                                               #  4a4: 00020060
                                                               #  4a8: 00060060
                                                               #  4ac: 00000001
                                                               #  4b0: fffffcff

# Function @ .irom0.text+0x4b4
            .balign      4
            .global      pm_open_rf
            .type        pm_open_rf, @function
pm_open_rf: movi         a8, 0xfe000000                        #  4b4: 81fbff
            movi         a3, 0x60000200                        #  4b7: 31fbff
            movi         a6, 0x60000600                        #  4ba: 61fbff
            memw                                               #  4bd: c02000
            s32i         a8, a6, 0x110 /* 0xfe000000 -> [0x60000710] */ #  4c0: 826644
            movi         a7, 0 /* 0x00000000 */                #  4c3: 0c07
            memw                                               #  4c5: c02000
            s32i         a7, a6, 0x144 /* 0x00000000 -> [0x60000744] */ #  4c8: 726651
            movi         a5, 0x01000000                        #  4cb: 51f8ff
            memw                                               #  4ce: c02000
            s32i         a5, a6, 0x100 /* 0x01000000 -> [0x60000700] */ #  4d1: 526640
            movi         a4, 0xfffcffff                        #  4d4: 41f7ff
            memw                                               #  4d7: c02000
            l32i         a2, a3, 0x3c8 /* [0x600005c8] */      #  4da: 2223f2
            and          a2, a2, a4                            #  4dd: 402210
            memw                                               #  4e0: c02000
            s32i         a2, a3, 0x3c8 /* a2 -> [0x600005c8] */ #  4e3: 2263f2
            ret                                                #  4e6: 0df0

            .literal_position                                  #  4e8: 33330000
                                                               #  4ec: 00fef13f
                                                               #  4f0: 000af23f
                                                               #  4f4: ffff3fff
                                                               #  4f8: 00008000
                                                               #  4fc: fffffffc
                                                               #  500: 00000002
                                                               #  504: ffffffcf
                                                               #  508: 00000020
                                                               #  50c: ffffff3f
                                                               #  510: 00000080
                                                               #  514: ffffff7f

# Function @ .irom0.text+0x518
            .balign      4
            .global      pm_sleep_set_mac
            .type        pm_sleep_set_mac, @function
pm_sleep_set_mac:
            movi         a10, 0x00003333                       #  518: a1f4ff
            movi         a3, 0x3ff1fe00                        #  51b: 31f4ff
            movi         a6, 0x3ff20a00                        #  51e: 61f4ff
            memw                                               #  521: c02000
            s32i         a10, a6, 0x3e0 /* 0x00003333 -> [0x3ff20de0] */ #  524: a266f8
            movi         a9, 0xff3fffff                        #  527: 91f3ff
            movi         a8, 0x00800000                        #  52a: 81f3ff
            memw                                               #  52d: c02000
            l32i         a7, a6, 0x274 /* [0x3ff20c74] */      #  530: 72269d
            and          a7, a7, a9                            #  533: 907710
            or           a7, a7, a8                            #  536: 807720
            memw                                               #  539: c02000
            s32i         a7, a6, 0x274 /* a7 -> [0x3ff20c74] */ #  53c: 72669d
            movi         a5, 0xfcffffff                        #  53f: 51efff
            movi         a4, 0x02000000                        #  542: 41efff
            memw                                               #  545: c02000
            l32i         a2, a6, 0x274 /* [0x3ff20c74] */      #  548: 22269d
            and          a2, a2, a5                            #  54b: 502210
            or           a2, a2, a4                            #  54e: 402220
            memw                                               #  551: c02000
            s32i         a2, a6, 0x274 /* a2 -> [0x3ff20c74] */ #  554: 22669d
            movi         a11, 0xcfffffff                       #  557: b1ebff
            movi         a10, 0x20000000                       #  55a: a1ebff
            memw                                               #  55d: c02000
            l32i         a9, a6, 0x274 /* [0x3ff20c74] */      #  560: 92269d
            and          a9, a9, a11                           #  563: b09910
            or           a9, a9, a10                           #  566: a09920
            memw                                               #  569: c02000
            s32i         a9, a6, 0x274 /* a9 -> [0x3ff20c74] */ #  56c: 92669d
            movi         a8, 0x3fffffff                        #  56f: 81e7ff
            movi         a7, 0x80000000                        #  572: 71e7ff
            memw                                               #  575: c02000
            l32i         a5, a6, 0x274 /* [0x3ff20c74] */      #  578: 52269d
            and          a5, a5, a8                            #  57b: 805510
            or           a5, a5, a7                            #  57e: 705520
            memw                                               #  581: c02000
            s32i         a5, a6, 0x274 /* a5 -> [0x3ff20c74] */ #  584: 52669d
            movi         a4, 0x7fffffff                        #  587: 41e3ff
            memw                                               #  58a: c02000
            l32i         a2, a3, 0x204 /* [0x3ff20004] */      #  58d: 222381
            and          a2, a2, a4                            #  590: 402210
            memw                                               #  593: c02000
            s32i         a2, a3, 0x204 /* a2 -> [0x3ff20004] */ #  596: 226381
            ret                                                #  599: 0df0

            .literal_position                                  #  59c: 00000000
                                                               #  5a0: 000af23f
                                                               #  5a4: ffffff3f
                                                               #  5a8: 00fef13f
                                                               #  5ac: ffffffcf
                                                               #  5b0: fffffffc
                                                               #  5b4: ffff3fff
                                                               #  5b8: 00000080

# Function @ .irom0.text+0x5bc
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      pm_set_wakeup_mac
            .type        pm_set_wakeup_mac, @function
pm_set_wakeup_mac:
            movi         a4, chip6_phy_init_ctrl               #  5bc: 41f8ff
            addi         sp, sp, -16 /* (local0) */            #  5bf: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  5c2: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  5c4: 0901
            l8ui         a0, a4, 53 /* [chip6_phy_init_ctrl+0x35] */ #  5c6: 020435
            movi         a12, 0x3ff20a00                       #  5c9: c1f5ff
            beqi         a0, 1, .Lbr043                        #  5cc: 261076
            beqi         a0, 3, .Lbr043                        #  5cf: 263073
            beqi         a0, 4, .Lbr043                        #  5d2: 264070
            beqi         a0, 5, .Lbr043                        #  5d5: 26506d
            movi         a0, 0 /* 0x00000000 */                #  5d8: 0c00
            memw                                               #  5da: c02000
            s32i         a0, a12, 0x3e0 /* 0x00000000 -> [0x3ff20de0] */ #  5dd: 026cf8
.Lbr042:    movi         a0, 0x3fffffff                        #  5e0: 01f1ff
            movi         a3, 0x3ff1fe00                        #  5e3: 31f1ff
            memw                                               #  5e6: c02000
            l32i         a11, a12, 0x274 /* [0x3ff20c74] */    #  5e9: b22c9d
            and          a11, a11, a0                          #  5ec: 00bb10
            memw                                               #  5ef: c02000
            s32i         a11, a12, 0x274 /* a11 -> [0x3ff20c74] */ #  5f2: b26c9d
            movi         a10, 0xcfffffff                       #  5f5: a1edff
            memw                                               #  5f8: c02000
            l32i         a9, a12, 0x274 /* [0x3ff20c74] */     #  5fb: 922c9d
            and          a9, a9, a10                           #  5fe: a09910
            memw                                               #  601: c02000
            s32i         a9, a12, 0x274 /* a9 -> [0x3ff20c74] */ #  604: 926c9d
            movi         a8, 0xfcffffff                        #  607: 81eaff
            memw                                               #  60a: c02000
            l32i         a7, a12, 0x274 /* [0x3ff20c74] */     #  60d: 722c9d
            and          a7, a7, a8                            #  610: 807710
            memw                                               #  613: c02000
            s32i         a7, a12, 0x274 /* a7 -> [0x3ff20c74] */ #  616: 726c9d
            movi         a6, 0xff3fffff                        #  619: 61e6ff
            memw                                               #  61c: c02000
            l32i         a5, a12, 0x274 /* [0x3ff20c74] */     #  61f: 522c9d
            and          a5, a5, a6                            #  622: 605510
            memw                                               #  625: c02000
            s32i         a5, a12, 0x274 /* a5 -> [0x3ff20c74] */ #  628: 526c9d
            movi         a4, 0x80000000                        #  62b: 41e3ff
            memw                                               #  62e: c02000
            l32i         a2, a3, 0x204 /* [0x3ff20004] */      #  631: 222381
            or           a2, a2, a4                            #  634: 402220
            memw                                               #  637: c02000
            s32i         a2, a3, 0x204 /* a2 -> [0x3ff20004] */ #  63a: 226381
            l32i         a12, sp, 4 /* [(local1)] */           #  63d: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  63f: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  641: 12c110
            ret                                                #  644: 0df0
.Lbr043:    l8ui         a2, a4, 54 /* [chip6_phy_init_ctrl+0x36] */ #  646: 220436
            call0        pm_unmask_bt                          #  649: 050000
            j            .Lbr042                               #  64c: 06e4ff

            .literal_position                                  #  650: 87130000
                                                               #  654: 0002f23f
                                                               #  658: 00fef13f
                                                               #  65c: 00000000
                                                               #  660: 00000000

# Function @ .irom0.text+0x664
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      pm_check_mac_idle
            .type        pm_check_mac_idle, @function
pm_check_mac_idle:
            movi         a2, 20 /* 0x00000014 */               #  664: 1c42
            addi         sp, sp, -32 /* (local0) */            #  666: 12c1e0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  669: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  66b: d921
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  66d: e931
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  66f: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  671: 0901
            call0        os_delay_us                           #  673: 01faffc0
                                                               #  677: 0000
            movi         a12, 0 /* 0x00000000 */               #  679: 0c0c
            movi         a14, 0x00001387                       #  67b: e1f5ff
            movi         a13, 0x3ff20200                       #  67e: d1f5ff
            movi         a15, 0x3ff1fe00                       #  681: f1f5ff
.Lbr044:    memw                                               #  684: c02000
            l32i         a0, a13, 0x210 /* [0x3ff20410] */     #  687: 022d84
            extui        a0, a0, 0, 4                          #  68a: 000034
            bnez         a0, .Lbr045                           #  68d: cc90
            memw                                               #  68f: c02000
            l32i         a2, a15, 0x3d0 /* [0x3ff201d0] */     #  692: 222ff4
            extui        a2, a2, 12, 4                         #  695: 202c34
            beqz         a2, .Lbr046                           #  698: 9c02
.Lbr045:    movi         a2, 2 /* 0x00000002 */                #  69a: 0c22
            call0        os_delay_us                           #  69c: 01f1ffc0
                                                               #  6a0: 0000
            mov          a3, a12                               #  6a2: 3d0c
            addi         a12, a12, 1                           #  6a4: 1bcc
            extui        a12, a12, 0, 16                       #  6a6: c0c0f4
            bgeu         a14, a3, .Lbr044                      #  6a9: 37bed7
.Lbr046:    l32i         a12, sp, 4 /* [(local1)] */           #  6ac: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  6ae: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  6b0: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  6b2: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  6b4: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  6b6: 12c120
            ret                                                #  6b9: 0df0

            .literal_position                                  #  6bc: 00000000
                                                               #  6c0: 00060060
                                                               #  6c4: 00000000
                                                               #  6c8: 00000000
                                                               #  6cc: 00000000
                                                               #  6d0: 00000000

# Function @ .irom0.text+0x6d4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      pm_set_sleep_btco
            .type        pm_set_sleep_btco, @function
pm_set_sleep_btco:
            addi         sp, sp, -16 /* (local0) */            #  6d4: 12c1f0
            movi         a3, chip6_phy_init_ctrl               #  6d7: 31f9ff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  6da: 0901
            l8ui         a0, a3, 53 /* [chip6_phy_init_ctrl+0x35] */ #  6dc: 020335
            movi         a4, -305 /* 0xfffffecf */             #  6df: 42aecf
            beqi         a0, 1, .Lbr048                        #  6e2: 26100f
            beqi         a0, 3, .Lbr048                        #  6e5: 26300c
            beqi         a0, 4, .Lbr048                        #  6e8: 264009
            beqi         a0, 5, .Lbr048                        #  6eb: 265006
.Lbr047:    l32i         a0, sp, 0 /* [(local0)] */            #  6ee: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  6f0: 12c110
            ret                                                #  6f3: 0df0
.Lbr048:    movi         a6, 48 /* 0x00000030 */               #  6f5: 3c06
            movi         a2, 0x60000600                        #  6f7: 21f2ff
            memw                                               #  6fa: c02000
            l32i         a5, a2, 0x214 /* [0x60000814] */      #  6fd: 522285
            and          a5, a5, a4                            #  700: 405510
            or           a5, a5, a6                            #  703: 605520
            memw                                               #  706: c02000
            s32i         a5, a2, 0x214 /* a5 -> [0x60000814] */ #  709: 526285
            memw                                               #  70c: c02000
            l32i         a0, a2, 0x234 /* [0x60000834] */      #  70f: 02228d
            and          a0, a0, a4                            #  712: 400010
            memw                                               #  715: c02000
            s32i         a0, a2, 0x234 /* a0 -> [0x60000834] */ #  718: 02628d
            l8ui         a0, a3, 53 /* [chip6_phy_init_ctrl+0x35] */ #  71b: 020335
            beqi         a0, 1, .Lbr050                        #  71e: 26102d
            beqi         a0, 3, .Lbr050                        #  721: 26302a
            beqi         a0, 4, .Lbr049                        #  724: 264002
            bnei         a0, 5, .Lbr047                        #  727: 6650c3
.Lbr049:    l8ui         a6, a3, 54 /* [chip6_phy_init_ctrl+0x36] */ #  72a: 620336
            bltui        a6, 2, .Lbr047                        #  72d: b626bd
            movi         a2, 0 /* 0x00000000 */                #  730: 0c02
            movi         a3, 1 /* 0x00000001 */                #  732: 0c13
            movi         a4, 1 /* 0x00000001 */                #  734: 0c14
            movi         a5, 0 /* 0x00000000 */                #  736: 0c05
            call0        gpio_output_set                       #  738: 01e3ffc0
                                                               #  73c: 0000
            movi         a2, 8 /* 0x00000008 */                #  73e: 0c82
            movi         a3, 0 /* 0x00000000 */                #  740: 0c03
            movi         a4, 8 /* 0x00000008 */                #  742: 0c84
            movi         a5, 0 /* 0x00000000 */                #  744: 0c05
            call0        gpio_output_set                       #  746: 01e0ffc0
                                                               #  74a: 0000
            j            .Lbr047                               #  74c: 86e7ff
.Lbr050:    l8ui         a7, a3, 54 /* [chip6_phy_init_ctrl+0x36] */ #  74f: 720336
            bltui        a7, 2, .Lbr047                        #  752: b62798
            movi         a2, 1 /* 0x00000001 */                #  755: 0c12
            movi         a3, 0 /* 0x00000000 */                #  757: 0c03
            movi         a4, 1 /* 0x00000001 */                #  759: 0c14
            movi         a5, 0 /* 0x00000000 */                #  75b: 0c05
            call0        gpio_output_set                       #  75d: 01dbffc0
                                                               #  761: 0000
            movi         a2, 0 /* 0x00000000 */                #  763: 0c02
            movi         a3, 8 /* 0x00000008 */                #  765: 0c83
            movi         a4, 8 /* 0x00000008 */                #  767: 0c84
            movi         a5, 0 /* 0x00000000 */                #  769: 0c05
            call0        gpio_output_set                       #  76b: 01d9ffc0
                                                               #  76f: 0000
            j            .Lbr047                               #  771: 46deff

            .literal_position                                  #  774: 00000000
                                                               #  778: 00060060
                                                               #  77c: 00000000
                                                               #  780: 00000000
                                                               #  784: 00000000
                                                               #  788: 00000000
                                                               #  78c: 00000000
                                                               #  790: 00000000
                                                               #  794: 00000000
                                                               #  798: 00000000

# Function @ .irom0.text+0x79c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      pm_set_wakeup_btco
            .type        pm_set_wakeup_btco, @function
pm_set_wakeup_btco:
            addi         sp, sp, -16 /* (local0) */            #  79c: 12c1f0
            movi         a3, chip6_phy_init_ctrl               #  79f: 31f5ff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  7a2: 0901
            l8ui         a0, a3, 53 /* [chip6_phy_init_ctrl+0x35] */ #  7a4: 020335
            movi         a5, -305 /* 0xfffffecf */             #  7a7: 52aecf
            beqi         a0, 1, .Lbr052                        #  7aa: 26100f
            beqi         a0, 3, .Lbr052                        #  7ad: 26300c
            beqi         a0, 4, .Lbr052                        #  7b0: 264009
            beqi         a0, 5, .Lbr052                        #  7b3: 265006
.Lbr051:    l32i         a0, sp, 0 /* [(local0)] */            #  7b6: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  7b8: 12c110
            ret                                                #  7bb: 0df0
.Lbr052:    l8ui         a2, a3, 54 /* [chip6_phy_init_ctrl+0x36] */ #  7bd: 220336
            movi         a0, 0x60000600                        #  7c0: 01eeff
            bltui        a2, 2, .Lbr053                        #  7c3: b62228
            movi         a6, 32 /* 0x00000020 */               #  7c6: 2c06
            memw                                               #  7c8: c02000
            l32i         a7, a0, 0x214 /* [0x60000814] */      #  7cb: 722085
            and          a7, a7, a5                            #  7ce: 507710
            or           a7, a7, a6                            #  7d1: 607720
            memw                                               #  7d4: c02000
            s32i         a7, a0, 0x214 /* a7 -> [0x60000814] */ #  7d7: 726085
            memw                                               #  7da: c02000
            l32i         a4, a0, 0x234 /* [0x60000834] */      #  7dd: 42208d
            and          a4, a4, a5                            #  7e0: 504410
            or           a4, a4, a6                            #  7e3: 604420
            memw                                               #  7e6: c02000
            s32i         a4, a0, 0x234 /* a4 -> [0x60000834] */ #  7e9: 42608d
            j            .Lbr054                               #  7ec: 860800
.Lbr053:    movi         a10, 48 /* 0x00000030 */              #  7ef: 3c0a
            memw                                               #  7f1: c02000
            l32i         a9, a0, 0x214 /* [0x60000814] */      #  7f4: 922085
            and          a9, a9, a5                            #  7f7: 509910
            or           a9, a9, a10                           #  7fa: a09920
            memw                                               #  7fd: c02000
            s32i         a9, a0, 0x214 /* a9 -> [0x60000814] */ #  800: 926085
            memw                                               #  803: c02000
            l32i         a8, a0, 0x234 /* [0x60000834] */      #  806: 82208d
            and          a8, a8, a5                            #  809: 508810
            memw                                               #  80c: c02000
            s32i         a8, a0, 0x234 /* a8 -> [0x60000834] */ #  80f: 82608d
.Lbr054:    l8ui         a0, a3, 53 /* [chip6_phy_init_ctrl+0x35] */ #  812: 020335
            beqi         a0, 1, .Lbr057                        #  815: 26104f
            beqi         a0, 3, .Lbr057                        #  818: 26304c
            beqi         a0, 4, .Lbr055                        #  81b: 264002
            bnei         a0, 5, .Lbr051                        #  81e: 665094
.Lbr055:    l8ui         a0, a3, 54 /* [chip6_phy_init_ctrl+0x36] */ #  821: 020336
            bnei         a0, 1, .Lbr056                        #  824: 66101e
            movi         a2, 0 /* 0x00000000 */                #  827: 0c02
            movi         a3, 1 /* 0x00000001 */                #  829: 0c13
            movi         a4, 1 /* 0x00000001 */                #  82b: 0c14
            movi         a5, 0 /* 0x00000000 */                #  82d: 0c05
            call0        gpio_output_set                       #  82f: 01d3ffc0
                                                               #  833: 0000
            movi         a2, 8 /* 0x00000008 */                #  835: 0c82
            movi         a3, 0 /* 0x00000000 */                #  837: 0c03
            movi         a4, 8 /* 0x00000008 */                #  839: 0c84
            movi         a5, 0 /* 0x00000000 */                #  83b: 0c05
            call0        gpio_output_set                       #  83d: 01d0ffc0
                                                               #  841: 0000
            j            .Lbr051                               #  843: c6dbff
.Lbr056:    bnez         a0, .Lbr051                           #  846: 56c0f6
            movi         a2, 1 /* 0x00000001 */                #  849: 0c12
            movi         a3, 0 /* 0x00000000 */                #  84b: 0c03
            movi         a4, 1 /* 0x00000001 */                #  84d: 0c14
            movi         a5, 0 /* 0x00000000 */                #  84f: 0c05
            call0        gpio_output_set                       #  851: 01ccffc0
                                                               #  855: 0000
            movi         a2, 0 /* 0x00000000 */                #  857: 0c02
            movi         a3, 8 /* 0x00000008 */                #  859: 0c83
            movi         a4, 8 /* 0x00000008 */                #  85b: 0c84
            movi         a5, 0 /* 0x00000000 */                #  85d: 0c05
            call0        gpio_output_set                       #  85f: 01caffc0
                                                               #  863: 0000
            j            .Lbr051                               #  865: 46d3ff
.Lbr057:    l8ui         a0, a3, 54 /* [chip6_phy_init_ctrl+0x36] */ #  868: 020336
            bnei         a0, 1, .Lbr058                        #  86b: 66101e
            movi         a2, 1 /* 0x00000001 */                #  86e: 0c12
            movi         a3, 0 /* 0x00000000 */                #  870: 0c03
            movi         a4, 1 /* 0x00000001 */                #  872: 0c14
            movi         a5, 0 /* 0x00000000 */                #  874: 0c05
            call0        gpio_output_set                       #  876: 01c5ffc0
                                                               #  87a: 0000
            movi         a2, 0 /* 0x00000000 */                #  87c: 0c02
            movi         a3, 8 /* 0x00000008 */                #  87e: 0c83
            movi         a4, 8 /* 0x00000008 */                #  880: 0c84
            movi         a5, 0 /* 0x00000000 */                #  882: 0c05
            call0        gpio_output_set                       #  884: 01c3ffc0
                                                               #  888: 0000
            j            .Lbr051                               #  88a: 06caff
.Lbr058:    bnez         a0, .Lbr051                           #  88d: 5650f2
            movi         a2, 0 /* 0x00000000 */                #  890: 0c02
            movi         a3, 1 /* 0x00000001 */                #  892: 0c13
            movi         a4, 1 /* 0x00000001 */                #  894: 0c14
            movi         a5, 0 /* 0x00000000 */                #  896: 0c05
            call0        gpio_output_set                       #  898: 01bfffc0
                                                               #  89c: 0000
            movi         a2, 8 /* 0x00000008 */                #  89e: 0c82
            movi         a3, 0 /* 0x00000000 */                #  8a0: 0c03
            movi         a4, 8 /* 0x00000008 */                #  8a2: 0c84
            movi         a5, 0 /* 0x00000000 */                #  8a4: 0c05
            call0        gpio_output_set                       #  8a6: 01bcffc0
                                                               #  8aa: 0000
            j            .Lbr051                               #  8ac: 86c1ff

            .literal_position                                  #  8b0: 00000008
                                                               #  8b4: 009a0060
                                                               #  8b8: 00f0ffff
                                                               #  8bc: 000af23f
                                                               #  8c0: ffffffbf
                                                               #  8c4: 00000080
                                                               #  8c8: ffff3fff
                                                               #  8cc: 00008000
                                                               #  8d0: ffff70fc
                                                               #  8d4: 00feef3f
                                                               #  8d8: 00000000

# Function @ .irom0.text+0x8dc
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      pm_set_sleep_mode
            .type        pm_set_sleep_mode, @function
pm_set_sleep_mode:
            movi         a3, 0 /* 0x00000000 */                #  8dc: 0c03
            addi         sp, sp, -16 /* (local0) */            #  8de: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  8e1: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  8e3: 0901
            mov          a12, a2 /* arg0 */                    #  8e5: cd02
            movi         a2, 1 /* 0x00000001 */                #  8e7: 0c12
            call0        noise_check_loop                      #  8e9: 01fbffc0
                                                               #  8ed: 0000
            movi         a3, 0x08000000                        #  8ef: 31f0ff
            movi         a2, 0x60009a00                        #  8f2: 21f0ff
            memw                                               #  8f5: c02000
            l32i         a0, a2, 0x108 /* [0x60009b08] */      #  8f8: 022242
            or           a0, a0, a3                            #  8fb: 300020
            memw                                               #  8fe: c02000
            s32i         a0, a2, 0x108 /* a0 -> [0x60009b08] */ #  901: 026242
            call0        pm_set_pll_xtal_wait_time             #  904: 050000
            beqi         a12, 4, .Lbr061                       #  907: 264c11
            bnei         a12, 1, .Lbr059                       #  90a: 661c05
            call0        pm_sleep_opt_bb_off                   #  90d: 050000
            j            .Lbr061                               #  910: 060200
.Lbr059:    beqi         a12, 2, .Lbr060                       #  913: 262c02
            bnei         a12, 8, .Lbr061                       #  916: 668c02
.Lbr060:    call0        pm_sleep_opt_bb_on                    #  919: 050000
.Lbr061:    movi         a3, 0xfffff000                        #  91c: 31e7ff
            movi         a2, 2 /* 0x00000002 */                #  91f: 0c22
            movi         a5, 0x3ff20a00                        #  921: 51e6ff
            memw                                               #  924: c02000
            l32i         a0, a5, 0x214 /* [0x3ff20c14] */      #  927: 022585
            and          a0, a0, a3                            #  92a: 300010
            or           a0, a0, a2                            #  92d: 200020
            memw                                               #  930: c02000
            s32i         a0, a5, 0x214 /* a0 -> [0x3ff20c14] */ #  933: 026585
            movi         a11, 0xbfffffff                       #  936: b1e2ff
            memw                                               #  939: c02000
            l32i         a10, a5, 0x214 /* [0x3ff20c14] */     #  93c: a22585
            and          a10, a10, a11                         #  93f: b0aa10
            memw                                               #  942: c02000
            s32i         a10, a5, 0x214 /* a10 -> [0x3ff20c14] */ #  945: a26585
            movi         a9, 0x80000000                        #  948: 91dfff
            memw                                               #  94b: c02000
            l32i         a8, a5, 0x214 /* [0x3ff20c14] */      #  94e: 822585
            or           a8, a8, a9                            #  951: 908820
            memw                                               #  954: c02000
            s32i         a8, a5, 0x214 /* a8 -> [0x3ff20c14] */ #  957: 826585
            movi         a7, 0xff3fffff                        #  95a: 71dbff
            movi         a6, 0x00800000                        #  95d: 61dbff
            memw                                               #  960: c02000
            l32i         a4, a5, 0x274 /* [0x3ff20c74] */      #  963: 42259d
            and          a4, a4, a7                            #  966: 704410
            or           a4, a4, a6                            #  969: 604420
            memw                                               #  96c: c02000
            s32i         a4, a5, 0x274 /* a4 -> [0x3ff20c74] */ #  96f: 42659d
            call0        pm_set_sleep_btco                     #  972: 050000
            call0        pm_sleep_set_mac                      #  975: 050000
            call0        pm_check_mac_idle                     #  978: 050000
            bnei         a12, 8, .Lbr062                       #  97b: 668c14
            movi         a6, 0xfc70ffff                        #  97e: 61d4ff
            movi         a5, 0x3feffe00                        #  981: 51d4ff
            memw                                               #  984: c02000
            l32i         a4, a5, 0x218 /* [0x3ff00018] */      #  987: 422586
            and          a4, a4, a6                            #  98a: 604410
            memw                                               #  98d: c02000
            s32i         a4, a5, 0x218 /* a4 -> [0x3ff00018] */ #  990: 426586
.Lbr062:    l32i         a12, sp, 4 /* [(local1)] */           #  993: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  995: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  997: 12c110
            ret                                                #  99a: 0df0

            .literal_position                                  #  99c: 000af23f
                                                               #  9a0: 60360040
                                                               #  9a4: 33330000
                                                               #  9a8: 10110040
                                                               #  9ac: 50150040
                                                               #  9b0: 30330040

# Function @ .irom0.text+0x9b4
            .balign      4
            .global      pm_unmask_bt
            .type        pm_unmask_bt, @function
pm_unmask_bt:
            movi         a4, 0x3ff20a00                        #  9b4: 41faff
            beqz         a2, .Lbr064                           #  9b7: 9c82
            beqi         a2, 1, .Lbr065                        #  9b9: 261220
            beqi         a2, 2, .Lbr066                        #  9bc: 262228
            beqi         a2, 3, .Lbr067                        #  9bf: 263230
            beqi         a2, 4, .Lbr068                        #  9c2: 264238
            bnei         a2, 5, .Lbr063                        #  9c5: 665208
            movi         a2, 0x40003660                        #  9c8: 21f6ff
            memw                                               #  9cb: c02000
            s32i         a2, a4, 0x3e0 /* 0x40003660 -> [0x3ff20de0] */ #  9ce: 2264f8
.Lbr063:    ret                                                #  9d1: 0df0
.Lbr064:    movi         a3, 0 /* 0x00000000 */                #  9d3: 0c03
            memw                                               #  9d5: c02000
            s32i         a3, a4, 0x3e0 /* 0x00000000 -> [0x3ff20de0] */ #  9d8: 3264f8
            ret           /* arg0 */                           #  9db: 0df0
.Lbr065:    movi         a5, 0x00003333                        #  9dd: 51f1ff
            memw                                               #  9e0: c02000
            s32i         a5, a4, 0x3e0 /* 0x00003333 -> [0x3ff20de0] */ #  9e3: 5264f8
            ret           /* arg0 */                           #  9e6: 0df0
.Lbr066:    movi         a6, 0x40001110                        #  9e8: 61f0ff
            memw                                               #  9eb: c02000
            s32i         a6, a4, 0x3e0 /* 0x40001110 -> [0x3ff20de0] */ #  9ee: 6264f8
            ret           /* arg0 */                           #  9f1: 0df0
.Lbr067:    movi         a7, 0x40001550                        #  9f3: 71eeff
            memw                                               #  9f6: c02000
            s32i         a7, a4, 0x3e0 /* 0x40001550 -> [0x3ff20de0] */ #  9f9: 7264f8
            ret           /* arg0 */                           #  9fc: 0df0
.Lbr068:    movi         a8, 0x40003330                        #  9fe: 81ecff
            memw                                               #  a01: c02000
            s32i         a8, a4, 0x3e0 /* 0x40003330 -> [0x3ff20de0] */ #  a04: 8264f8
            ret           /* arg0 */                           #  a07: 0df0

            .literal_position                                  #  a0c: 00000000
                                                               #  a10: 00feef3f
                                                               #  a14: 000a0060
                                                               #  a18: 00001000
                                                               #  a1c: 00008f03
                                                               #  a20: ff0f0080
                                                               #  a24: fffffff7
                                                               #  a28: 000af23f
                                                               #  a2c: ffff3fff
                                                               #  a30: 009a0060
                                                               #  a34: 000af23f
                                                               #  a38: 009a0060
                                                               #  a3c: 00000000
                                                               #  a40: 00000000
                                                               #  a44: 00000000
                                                               #  a48: ffff7ffe
                                                               #  a4c: 00000000
                                                               #  a50: 00020060
                                                               #  a54: 00000000
                                                               #  a58: 00000000
                                                               #  a5c: 00000008
                                                               #  a60: 00000000
                                                               #  a64: 00000000
                                                               #  a68: 00000000
                                                               #  a6c: 00000000
                                                               #  a70: 00000000
                                                               #  a74: 00000000
                                                               #  a78: 00000000
                                                               #  a7c: 00000000
                                                               #  a80: 00000000
                                                               #  a84: 00000000
                                                               #  a88: 00000000

# Function @ .irom0.text+0xa8c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      pm_wakeup_init
            .type        pm_wakeup_init, @function
pm_wakeup_init:
            addi         sp, sp, -16 /* (local0) */            #  a8c: 12c1f0
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  a8f: e931
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  a91: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  a93: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  a95: c911
            mov          a13, a3 /* arg1 */                    #  a97: dd03
            mov          a12, a2 /* arg0 */                    #  a99: cd02
            movi         a0, periodic_cal_sat                  #  a9b: 01dcff
            beqi         a2, 2, .Lbr069                        #  a9e: 262202
            bnei         a2, 1, .Lbr070                        #  aa1: 661211
.Lbr069:    bnez         a13, .Lbr070                          #  aa4: cced
            l8ui         a2, a0, 1 /* [software_slp_reject] */ #  aa6: 220001
            bnez         a2, .Lbr070                           #  aa9: cc92
            l8ui         a3, a0, 3 /* [hardware_reject] */     #  aab: 320003
            bnez         a3, .Lbr070                           #  aae: cc43
            call0        change_bbpll160                       #  ab0: 01f0ffc0
                                                               #  ab4: 0000
.Lbr070:    movi         a10, -13 /* 0xfffffff3 */             #  ab6: 7c3a
            movi         a9, 4 /* 0x00000004 */                #  ab8: 0c49
            movi         a6, 0x3feffe00                        #  aba: 61d5ff
            movi         a8, 0x60000a00                        #  abd: 81d5ff
            memw                                               #  ac0: c02000
            l32i         a7, a8, 0x340 /* [0x60000d40] */      #  ac3: 7228d0
            and          a7, a7, a10                           #  ac6: a07710
            or           a7, a7, a9                            #  ac9: 907720
            memw                                               #  acc: c02000
            s32i         a7, a8, 0x340 /* a7 -> [0x60000d40] */ #  acf: 7268d0
            movi         a5, 0x00100000                        #  ad2: 51d1ff
            memw                                               #  ad5: c02000
            l32i         a4, a6, 0x218 /* [0x3ff00018] */      #  ad8: 422686
            or           a4, a4, a5                            #  adb: 504420
            memw                                               #  ade: c02000
            s32i         a4, a6, 0x218 /* a4 -> [0x3ff00018] */ #  ae1: 426686
            bnei         a12, 8, .Lbr071                       #  ae4: 668c11
            movi         a14, 0x038f0000                       #  ae7: e1cdff
            memw                                               #  aea: c02000
            l32i         a11, a6, 0x218 /* [0x3ff00018] */     #  aed: b22686
            or           a11, a11, a14                         #  af0: e0bb20
            memw                                               #  af3: c02000
            s32i         a11, a6, 0x218 /* a11 -> [0x3ff00018] */ #  af6: b26686
.Lbr071:    movi         a6, 0x80000fff                        #  af9: 61c9ff
            movi         a14, 0xf7ffffff                       #  afc: e1caff
            movi         a4, 0x3ff20a00                        #  aff: 41caff
            memw                                               #  b02: c02000
            s32i         a6, a4, 0x214 /* 0x80000fff -> [0x3ff20c14] */ #  b05: 626485
            movi         a5, 0xff3fffff                        #  b08: 51c9ff
            memw                                               #  b0b: c02000
            l32i         a3, a4, 0x274 /* [0x3ff20c74] */      #  b0e: 32249d
            and          a3, a3, a5                            #  b11: 503310
            memw                                               #  b14: c02000
            s32i         a3, a4, 0x274 /* a3 -> [0x3ff20c74] */ #  b17: 32649d
            addi         a2, a12, -1 /* arg0-0x1 */            #  b1a: 0b2c
            beqz         a2, .Lbr075                           #  b1c: 16520c
            addi         a7, a12, -2 /* arg0-0x2 */            #  b1f: 72ccfe
            beqz         a7, .Lbr075                           #  b22: 16f70b
            addi         a8, a12, -8 /* arg0-0x8 */            #  b25: 82ccf8
            beqz         a8, .Lbr075                           #  b28: 16980b
            movi         a2, 300 /* 0x0000012c */              #  b2b: 22a12c
            call0        ets_delay_us                          #  b2e: 01d1ffc0
                                                               #  b32: 0000
.Lbr072:    movi         a11, 0x60009a00                       #  b34: b1bfff
            memw                                               #  b37: c02000
            l32i         a4, a11, 0x108 /* [0x60009b08] */     #  b3a: 422b42
            and          a4, a4, a14                           #  b3d: e04410
            memw                                               #  b40: c02000
            s32i         a4, a11, 0x108 /* a4 -> [0x60009b08] */ #  b43: 426b42
            movi         a3, 1 /* 0x00000001 */                #  b46: 0c13
            memw                                               #  b48: c02000
            l32i         a2, a11, 0x160 /* [0x60009b60] */     #  b4b: 222b58
            or           a2, a2, a3                            #  b4e: 302220
            memw                                               #  b51: c02000
            s32i         a2, a11, 0x160 /* a2 -> [0x60009b60] */ #  b54: 226b58
            movi         a0, -2 /* 0xfffffffe */               #  b57: 7ce0
            memw                                               #  b59: c02000
            l32i         a10, a11, 0x160 /* [0x60009b60] */    #  b5c: a22b58
            and          a10, a10, a0                          #  b5f: 00aa10
            memw                                               #  b62: c02000
            s32i         a10, a11, 0x160 /* a10 -> [0x60009b60] */ #  b65: a26b58
            memw                                               #  b68: c02000
            movi         a9, 0x3ff20a00                        #  b6b: 91b2ff
            l32i         a9, a9, 0x270 /* [0x3ff20c70] */      #  b6e: 92299c
            bbci         a9, 1, .Lbr073                        #  b71: 17693b
            movi         a2, 2 /* 0x00000002 */                #  b74: 0c22
            call0        ets_delay_us                          #  b76: 01c0ffc0
                                                               #  b7a: 0000
            movi         a10, 241 /* 0x000000f1 */             #  b7c: a2a0f1
            movi         a8, -1024 /* 0xfffffc00 */            #  b7f: 82ac00
            memw                                               #  b82: c02000
            movi         a6, 0x60009a00                        #  b85: 61acff
            l32i         a9, a6, 52 /* [0x60009a34] */         #  b88: 98d6
            and          a9, a9, a8                            #  b8a: 809910
            or           a9, a9, a10                           #  b8d: a09920
            memw                                               #  b90: c02000
            s32i         a9, a6, 52 /* a9 -> [0x60009a34] */   #  b93: 99d6
            movi         a7, 240 /* 0x000000f0 */              #  b95: 72a0f0
            memw                                               #  b98: c02000
            l32i         a5, a6, 52 /* [0x60009a34] */         #  b9b: 58d6
            and          a5, a5, a8                            #  b9d: 805510
            or           a5, a5, a7                            #  ba0: 705520
            memw                                               #  ba3: c02000
            s32i         a5, a6, 52 /* a5 -> [0x60009a34] */   #  ba6: 59d6
            movi         a2, 2 /* 0x00000002 */                #  ba8: 0c22
            call0        ets_delay_us                          #  baa: 01b4ffc0
                                                               #  bae: 0000
.Lbr073:    call0        pm_set_wakeup_btco                    #  bb0: 050000
            call0        pm_set_wakeup_mac                     #  bb3: 050000
            bnez         a13, .Lbr074                          #  bb6: dced
            movi         a10, periodic_cal_sat                 #  bb8: a1a1ff
            movi         a2, periodic_cal_flag                 #  bbb: 21a1ff
            l8ui         a10, a10, 2 /* [SDIO_slp_reject] */   #  bbe: a20a02
            l8ui         a11, a2, 0 /* [periodic_cal_flag] */  #  bc1: b20200
            bnez         a10, .Lbr074                          #  bc4: dc0a
            bnei         a11, 1, .Lbr074                       #  bc6: 661b0e
            movi         a13, periodic_cal_sat                 #  bc9: d19eff
            l8ui         a13, a13, 0 /* [periodic_cal_sat] */  #  bcc: d20d00
            bnei         a13, 1, .Lbr074                       #  bcf: 661d05
            beqi         a12, 2, .Lbr076                       #  bd2: 262c7f
            beqi         a12, 1, .Lbr076                       #  bd5: 261c7c
.Lbr074:    l32i         a12, sp, 4 /* [(local1)] */           #  bd8: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  bda: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  bdc: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  bde: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  be0: 12c110
            ret                                                #  be3: 0df0
.Lbr075:    movi         a4, 0xfe7fffff                        #  be5: 4198ff
            movi         a0, g_phyFuns                         #  be8: 0199ff
            movi         a3, 0x60000200                        #  beb: 3199ff
            memw                                               #  bee: c02000
            l32i         a2, a3, 0x3e8 /* [0x600005e8] */      #  bf1: 2223fa
            and          a2, a2, a4                            #  bf4: 402210
            memw                                               #  bf7: c02000
            movi         a4, 3 /* 0x00000003 */                #  bfa: 0c34
            movi         a5, 7 /* 0x00000007 */                #  bfc: 0c75
            movi         a6, 4 /* 0x00000004 */                #  bfe: 0c46
            movi         a7, 15 /* 0x0000000f */               #  c00: 0cf7
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  c02: 0800
            s32i         a2, a3, 0x3e8 /* a2 -> [0x600005e8] */ #  c04: 2263fa
            movi         a2, 98 /* 0x00000062 */               #  c07: 22a062
            l32i         a0, a0, 156 /* [[g_phyFuns]+0x9c] */  #  c0a: 022027
            movi         a3, 1 /* 0x00000001 */                #  c0d: 0c13
            callx0       a0 /* [[g_phyFuns]+0x9c] */           #  c0f: c00000
            movi         a2, 98 /* 0x00000062 */               #  c12: 22a062
            movi         a0, g_phyFuns                         #  c15: 018fff
            movi         a3, 1 /* 0x00000001 */                #  c18: 0c13
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  c1a: 0800
            movi         a4, 11 /* 0x0000000b */               #  c1c: 0cb4
            l32i         a0, a0, 152 /* [[g_phyFuns]+0x98] */  #  c1e: 022026
            movi         a5, 128 /* 0x00000080 */              #  c21: 52a080
            callx0       a0 /* [[g_phyFuns]+0x98] */           #  c24: c00000
            call0        pm_open_rf                            #  c27: 050000
            movi         a4, chip6_sleep_params                #  c2a: 418bff
            movi         a5, 0x08000000                        #  c2d: 518bff
            l32i         a3, a4, 0 /* [chip6_sleep_params] */  #  c30: 3804
            movi         a2, 0 /* 0x00000000 */                #  c32: 0c02
            or           a3, a3, a5                            #  c34: 503320
            s32i         a3, a4, 0 /* a3 -> [chip6_sleep_params] */ #  c37: 3904
            call0        register_chipv6_phy                   #  c39: 0191ffc0
                                                               #  c3d: 0000
            movi         a2, 200 /* 0x000000c8 */              #  c3f: 22a0c8
            call0        ets_delay_us                          #  c42: 0190ffc0
                                                               #  c46: 0000
            movi         a7, chip6_sleep_params                #  c48: 7186ff
            l32i         a6, a7, 0 /* [chip6_sleep_params] */  #  c4b: 6807
            and          a6, a6, a14                           #  c4d: e06610
            s32i         a6, a7, 0 /* a6 -> [chip6_sleep_params] */ #  c50: 6907
            j            .Lbr072                               #  c52: 86b7ff
.Lbr076:    movi         a9, periodic_cal_sat                  #  c55: 9184ff
            movi         a8, 0 /* 0x00000000 */                #  c58: 0c08
            movi         a7, chip6_phy_init_ctrl               #  c5a: 7182ff
            s8i          a8, a2, 0 /* 0x00 -> [periodic_cal_flag] */ #  c5d: 824200
            l8ui         a7, a7, 100 /* [chip6_phy_init_ctrl+0x64] */ #  c60: 720764
            s8i          a8, a9, 0 /* 0x00 -> [periodic_cal_sat] */ #  c63: 824900
            extui        a7, a7, 1, 1                          #  c66: 707104
            bnez         a7, .Lbr074                           #  c69: 56b7f6
            movi         a2, 4 /* 0x00000004 */                #  c6c: 0c42
            call0        pm_set_sleep_mode                     #  c6e: 050000
            movi         a2, do_pwctrl_flag                    #  c71: 217eff
            l8ui         a2, a2, 0 /* [do_pwctrl_flag] */      #  c74: 220200
            call0        periodic_cal                          #  c77: 0184ffc0
                                                               #  c7b: 0000
            movi         a2, 4 /* 0x00000004 */                #  c7d: 0c42
            movi         a3, 0 /* 0x00000000 */                #  c7f: 0c03
            call0        pm_wakeup_init                        #  c81: 050000
            j            .Lbr074                               #  c84: 06d4ff

            .literal_position                                  #  c88: 00060060

# Function @ .irom0.text+0xc8c
            .balign      4
            .global      sleep_opt_8266
            .type        sleep_opt_8266, @function
sleep_opt_8266:
            movi         a6, 0 /* 0x00000000 */                #  c8c: 0c06
            movi         a5, 0x60000600                        #  c8e: 51feff
            memw                                               #  c91: c02000
            s32i         a6, a5, 0x140 /* 0x00000000 -> [0x60000740] */ #  c94: 626550
            memw                                               #  c97: c02000
            s32i         a2, a5, 0x144 /* arg0 -> [0x60000744] */ #  c9a: 226551
            memw                                               #  c9d: c02000
            s32i         a4, a5, 0x100 /* arg2 -> [0x60000700] */ #  ca0: 426540
            memw                                               #  ca3: c02000
            s32i         a3, a5, 0x110 /* arg1 -> [0x60000710] */ #  ca6: 326544
            ret           /* arg0 */                           #  ca9: 0df0

            .literal_position                                  #  cac: 50008000
                                                               #  cb0: 00008000

# Function @ .irom0.text+0xcb4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sleep_opt_bb_on_8266
            .type        sleep_opt_bb_on_8266, @function
sleep_opt_bb_on_8266:
            addi         sp, sp, -16 /* (local0) */            #  cb4: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  cb7: 0901
            call0        get_chip_version                      #  cb9: 050000
            beqi         a2, 2, .Lbr077                        #  cbc: 26220c
            movi         a2, 0 /* 0x00000000 */                #  cbf: 0c02
            movi         a3, 0 /* 0x00000000 */                #  cc1: 0c03
            movi         a4, 0x00800050                        #  cc3: 41faff
            call0        sleep_opt_8266                        #  cc6: 050000
            j            .Lbr078                               #  cc9: 460200
.Lbr077:    movi         a2, 0 /* 0x00000000 */                #  ccc: 0c02
            movi         a3, 0 /* 0x00000000 */                #  cce: 0c03
            movi         a4, 0x00800000                        #  cd0: 41f8ff
            call0        sleep_opt_8266                        #  cd3: 050000
.Lbr078:    l32i         a0, sp, 0 /* [(local0)] */            #  cd6: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  cd8: 12c110
            ret                                                #  cdb: 0df0

            .literal_position                                  #  ce0: 00060060
                                                               #  ce4: 00001000
                                                               #  ce8: 6ac01900
                                                               #  cec: ff0f0000
                                                               #  cf0: c8400600
                                                               #  cf4: 000000f0
                                                               #  cf8: 20203020
                                                               #  cfc: 00005020

# Function @ .irom0.text+0xd00
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sleep_reset_analog_rtcreg_8266
            .type        sleep_reset_analog_rtcreg_8266, @function
sleep_reset_analog_rtcreg_8266:
            addi         sp, sp, -16 /* (local0) */            #  d00: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  d03: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  d05: 0901
            movi         a0, -1 /* 0xffffffff */               #  d07: 7cf0
            movi         a12, 0x60000600                       #  d09: c1f5ff
            memw                                               #  d0c: c02000
            s32i         a0, a12, 0x124 /* 0xffffffff -> [0x60000724] */ #  d0f: 026c49
            call0        sleep_opt_bb_on_8266                  #  d12: 050000
            movi         a2, 8 /* 0x00000008 */                #  d15: 0c82
            movi         a3, 0 /* 0x00000000 */                #  d17: 0c03
            call0        pm_wakeup_opt                         #  d19: 050000
            call0        pm_set_pll_xtal_wait_time             #  d1c: 050000
            movi         a2, 100 /* 0x00000064 */              #  d1f: 22a064
            call0        pm_set_sleep_cycles                   #  d22: 050000
            movi         a3, 0x00100000                        #  d25: 31efff
            memw                                               #  d28: c02000
            l32i         a2, a12, 0x108 /* [0x60000708] */     #  d2b: 222c42
            or           a2, a2, a3                            #  d2e: 302220
            memw                                               #  d31: c02000
            s32i         a2, a12, 0x108 /* a2 -> [0x60000708] */ #  d34: 226c42
            movi         a2, 2 /* 0x00000002 */                #  d37: 0c22
            call0        pm_wait4wakeup                        #  d39: 050000
            call0        pm_open_rf                            #  d3c: 050000
            movi         a0, 0x0019c06a                        #  d3f: 01eaff
            movi         a4, 0 /* 0x00000000 */                #  d42: 0c04
            movi         a5, 7 /* 0x00000007 */                #  d44: 0c75
            memw                                               #  d46: c02000
            s32i         a0, a12, 0x100 /* 0x0019c06a -> [0x60000700] */ #  d49: 026c40
            movi         a11, 0x00000fff                       #  d4c: b1e8ff
            memw                                               #  d4f: c02000
            s32i         a11, a12, 0x104 /* 0x00000fff -> [0x60000704] */ #  d52: b26c41
            memw                                               #  d55: c02000
            s32i         a4, a12, 0x108 /* 0x00000000 -> [0x60000708] */ #  d58: 426c42
            movi         a10, 0x000640c8                       #  d5b: a1e5ff
            memw                                               #  d5e: c02000
            s32i         a10, a12, 0x10c /* 0x000640c8 -> [0x6000070c] */ #  d61: a26c43
            movi         a9, 0xf0000000                        #  d64: 91e4ff
            memw                                               #  d67: c02000
            s32i         a9, a12, 0x110 /* 0xf0000000 -> [0x60000710] */ #  d6a: 926c44
            movi         a8, 4 /* 0x00000004 */                #  d6d: 0c48
            memw                                               #  d6f: c02000
            s32i         a8, a12, 0x118 /* 0x00000004 -> [0x60000718] */ #  d72: 826c46
            memw                                               #  d75: c02000
            s32i         a4, a12, 0x120 /* 0x00000000 -> [0x60000720] */ #  d78: 426c48
            memw                                               #  d7b: c02000
            s32i         a4, a12, 0x140 /* 0x00000000 -> [0x60000740] */ #  d7e: 426c50
            memw                                               #  d81: c02000
            s32i         a4, a12, 0x144 /* 0x00000000 -> [0x60000744] */ #  d84: 426c51
            movi         a7, 0x20302020                        #  d87: 71dcff
            memw                                               #  d8a: c02000
            s32i         a7, a12, 0x148 /* 0x20302020 -> [0x60000748] */ #  d8d: 726c52
            movi         a6, 0x20500000                        #  d90: 61dbff
            memw                                               #  d93: c02000
            s32i         a6, a12, 0x14c /* 0x20500000 -> [0x6000074c] */ #  d96: 626c53
            memw                                               #  d99: c02000
            s32i         a4, a12, 0x158 /* 0x00000000 -> [0x60000758] */ #  d9c: 426c56
            memw                                               #  d9f: c02000
            s32i         a5, a12, 0x15c /* 0x00000007 -> [0x6000075c] */ #  da2: 526c57
            memw                                               #  da5: c02000
            s32i         a5, a12, 0x160 /* 0x00000007 -> [0x60000760] */ #  da8: 526c58
            memw                                               #  dab: c02000
            s32i         a4, a12, 0x164 /* 0x00000000 -> [0x60000764] */ #  dae: 426c59
            memw                                               #  db1: c02000
            s32i         a4, a12, 0x168 /* 0x00000000 -> [0x60000768] */ #  db4: 426c5a
            memw                                               #  db7: c02000
            s32i         a4, a12, 0x174 /* 0x00000000 -> [0x60000774] */ #  dba: 426c5d
            memw                                               #  dbd: c02000
            s32i         a4, a12, 0x180 /* 0x00000000 -> [0x60000780] */ #  dc0: 426c60
            memw                                               #  dc3: c02000
            s32i         a4, a12, 0x190 /* 0x00000000 -> [0x60000790] */ #  dc6: 426c64
            memw                                               #  dc9: c02000
            s32i         a4, a12, 0x194 /* 0x00000000 -> [0x60000794] */ #  dcc: 426c65
            memw                                               #  dcf: c02000
            s32i         a4, a12, 0x198 /* 0x00000000 -> [0x60000798] */ #  dd2: 426c66
            memw                                               #  dd5: c02000
            s32i         a4, a12, 0x19c /* 0x00000000 -> [0x6000079c] */ #  dd8: 426c67
            memw                                               #  ddb: c02000
            s32i         a4, a12, 0x1a0 /* 0x00000000 -> [0x600007a0] */ #  dde: 426c68
            memw                                               #  de1: c02000
            s32i         a4, a12, 0x1a8 /* 0x00000000 -> [0x600007a8] */ #  de4: 426c6a
            memw                                               #  de7: c02000
            s32i         a4, a12, 0x1ac /* 0x00000000 -> [0x600007ac] */ #  dea: 426c6b
            memw                                               #  ded: c02000
            s32i         a4, a12, 0x1b0 /* 0x00000000 -> [0x600007b0] */ #  df0: 426c6c
            memw                                               #  df3: c02000
            s32i         a4, a12, 0x1b4 /* 0x00000000 -> [0x600007b4] */ #  df6: 426c6d
            l32i         a12, sp, 4 /* [(local1)] */           #  df9: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  dfb: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  dfd: 12c110
            ret                                                #  e00: 0df0

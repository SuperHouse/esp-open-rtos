
            .section     .data, "aw", @progbits

.Ldata001:  .byte        0x02

            .section     .bss, "aw", @nobits

.Ldata002:  .byte        0x00
.Ldata003:  .byte        0x00
            .byte        0x00, 0x00
.Ldata004:  .word        0x00000000                            #    4: 00000000
.Ldata005:  .word        0x00000000                            #    8: 00000000
.Ldata006:  .word        0x00000000                            #    c: 00000000
.Ldata007:  .word        0x00000000                            #   10: 00000000
.Ldata008:  .word        0x00000000                            #   14: 00000000
.Ldata009:  .word        0x00000000                            #   18: 00000000
.Ldata010:  .word        0x00000000                            #   1c: 00000000

# NOTE: 4 non-alignment zero bytes skipped.

            .skip        4
.Ldata011:  .word        0x00000000                            #   24: 00000000

# NOTE: 4 non-alignment zero bytes skipped.

            .skip        4
.Ldata012:  .hword       0x0000                                #   2c: 0000
.Ldata013:  .byte        0x00
.Ldata014:  .byte        0x00
.Ldata015:  .word        0x00000000                            #   30: 00000000
.Ldata016:  .byte        0x00
.Ldata017:  .byte        0x00
.Ldata018:  .byte        0x00
.Ldata019:  .byte        0x00
.Ldata020:  .byte        0x00
.Ldata021:  .byte        0x00
.Ldata022:  .byte        0x00
.Ldata023:  .byte        0x00
.Ldata024:  .byte        0x00
.Ldata025:  .byte        0x00
.Ldata026:  .byte        0x00
.Ldata027:  .byte        0x00
.Ldata028:  .byte        0x00
.Label001:  .space       7
.Ldata029:  .hword       0x0000                                #   48: 0000
            .balign      4
.Ldata030:  .word        0x00000000                            #   4c: 00000000
.Ldata031:  .word        0x00000000                            #   50: 00000000
.Label002:  .space       28
.Label003:  .space       28
.Label004:  .space       28
.Label005:  .space       28
.Label006:  .space       24
.Label007:  .word        0x00000000                            #   dc: 00000000
.Ldata032:  .byte        0x00
.Ldata033:  .byte        0x00
.Ldata034:  .byte        0x00
.Ldata035:  .byte        0x00
.Ldata036:  .byte        0x00

# NOTE: 1 non-alignment zero bytes skipped.

            .skip        1
.Ldata037:  .hword       0x0000                                #   e6: 0000
.Ldata038:  .hword       0x0000                                #   e8: 0000

# NOTE: 8 non-alignment zero bytes skipped.

            .skip        10
.Ldata039:  .byte        0x00
.Ldata040:  .byte        0x00
            .byte        0x00, 0x00
.Ldata041:  .word        0x00000000                            #   f8: 00000000
            .word        0x00000000                            #   fc: 00000000
            .space       64
.Ldata042:  .byte        0x00, 0x00, 0x00
            .byte        0x00
.Ldata043:  .byte        0x00
.Ldata044:  .byte        0x00
.Ldata045:  .byte        0x00
.Ldata046:  .byte        0x00
.Ldata047:  .byte        0x00

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000
                                                               #    8: 00000000

# Function @ .irom0.text+0xc
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
.Lfunc001:  addi         sp, sp, -16 /* (local0) */            #    c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #    f: 0901
            call0        vPortEnterCritical                    #   11: 01fcffc0
                                                               #   15: 0000
            movi         a4, .Ldata002                         #   17: 41faff
            l8ui         a2, a4, 0 /* [.Ldata002] */           #   1a: 220400
            addmi        a3, a4, 256 /* .bss+0x100 */          #   1d: 32d401
            addi         a0, a2, 1 /* [.Ldata002]+0x1 */       #   20: 1b02
            addx8        a2, a2, a3                            #   22: 3022b0
            extui        a0, a0, 0, 8                          #   25: 000074
            bltui        a0, 8, .Lbr001                        #   28: b68001
            movi         a0, 0 /* 0x00000000 */                #   2b: 0c00
.Lbr001:    s32i         a2, sp, 4 /* a2 -> [(local1)] */      #   2d: 2911
            l8ui         a5, a4, 1 /* [.Ldata003] */           #   2f: 520401
            s8i          a0, a4, 0 /* a0 -> [.Ldata002] */     #   32: 024400
            addi         a5, a5, 1 /* [.Ldata003]+0x1 */       #   35: 1b55
            s8i          a5, a4, 1 /* [.Ldata003]+0x1 -> [.Ldata003] */ #   37: 524401
            call0        vPortExitCritical                     #   3a: 01f3ffc0
                                                               #   3e: 0000
            l32i         a6, sp, 0 /* [(local0)] */            #   40: 6801
            l32i         a2, sp, 4 /* [(local1)] */            #   42: 2811
            mov          a0, a6 /* [(local0)] */               #   44: 0d06
            addi         sp, sp, 16 /* (top of frame) */       #   46: 12c110
            ret           /* [(local1)] */                     #   49: 0df0

            .literal_position                                  #   4c: 00000000

# Function @ .irom0.text+0x50
.Lfunc002:  movi         a3, .Ldata002                         #   50: 31ffff
            l8ui         a2, a3, 1 /* [.Ldata003] */           #   53: 220301
            addi         a2, a2, -1 /* [.Ldata003]-0x1 */      #   56: 0b22
            s8i          a2, a3, 1 /* [.Ldata003]-0x1 -> [.Ldata003] */ #   58: 224301
            ret           /* [.Ldata003]-0x1 */                #   5b: 0df0

            .literal_position                                  #   60: 00000000
                                                               #   64: 00000000
                                                               #   68: 04000000
                                                               #   6c: 00000000
                                                               #   70: 00000000

# Function @ .irom0.text+0x74
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pm_rtc_clock_cali_proc
            .type        sdk_pm_rtc_clock_cali_proc, @function
sdk_pm_rtc_clock_cali_proc:
            movi         a2, 106 /* 0x0000006a */              #   74: 22a06a
            movi         a3, 2 /* 0x00000002 */                #   77: 0c23
            movi         a4, 8 /* 0x00000008 */                #   79: 0c84
            movi         a7, .Ldata002                         #   7b: 71f9ff
            addi         sp, sp, -16 /* (local0) */            #   7e: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   81: 0901
            movi         a0, sdk_g_phyFuns                     #   83: 01f8ff
            movi         a6, 0 /* 0x00000000 */                #   86: 0c06
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #   88: 0800
            mov          a5, a6 /* 0x00000000 */               #   8a: 5d06
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #   8c: 022026
            s32i         a6, a7, 8 /* 0x00000000 -> [.Ldata005] */ #   8f: 6927
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #   91: c00000
            movi         a2, .Ldata004                         #   94: 21f5ff
            call0        sdk_pm_rtc_clock_cali                 #   97: 01f6ffc0
                                                               #   9b: 0000
            movi         a2, .Ldata002                         #   9d: 21f3ff
            l32i         a0, sp, 0 /* [(local0)] */            #   a0: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   a2: 12c110
            l32i         a2, a2, 8 /* [.Ldata005] */           #   a5: 2822
            ret           /* [.Ldata005] */                    #   a7: 0df0

            .literal_position                                  #   ac: 00000000
                                                               #   b0: 00000000
                                                               #   b4: 00000000

# Function @ .irom0.text+0xb8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pm_set_sleep_time
            .type        sdk_pm_set_sleep_time, @function
sdk_pm_set_sleep_time:
            movi         a3, .Ldata002                         #   b8: 31fdff
            addi         sp, sp, -16 /* (local0) */            #   bb: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   be: 0901
            l32i         a3, a3, 8 /* [.Ldata005] */           #   c0: 3823
            call0        sdk_pm_usec2rtc                       #   c2: 01fbffc0
                                                               #   c6: 0000
            call0        sdk_pm_set_sleep_cycles               #   c8: 01fbffc0
                                                               #   cc: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   ce: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   d0: 12c110
            ret                                                #   d3: 0df0

            .literal_position                                  #   d8: 00000000
                                                               #   dc: 00000000
                                                               #   e0: 00000000
                                                               #   e4: 00000000
                                                               #   e8: 00000000
                                                               #   ec: 00000000
                                                               #   f0: 00000000
                                                               #   f4: 00feef3f
                                                               #   f8: 00000000
                                                               #   fc: 00feef3f
                                                               #  100: 00000000
                                                               #  104: 00000000
                                                               #  108: 00000000
                                                               #  10c: 00000000
                                                               #  110: 00000000
                                                               #  114: 00000000
                                                               #  118: 00000000
                                                               #  11c: 00000000
                                                               #  120: 00000000
                                                               #  124: 00000000

# Function @ .irom0.text+0x128
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc003:  addi         sp, sp, -16 /* (local0) */            #  128: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  12b: 0901
            movi         a0, .Ldata001                         #  12d: 01eaff
            movi         a2, .Ldata002                         #  130: 21ebff
            l8ui         a0, a0, 0 /* [.Ldata001] */           #  133: 020000
            l8ui         a2, a2, 224 /* [.Ldata032] */         #  136: 2202e0
            bnei         a0, 1, .Lbr002                        #  139: 661017
            bgeui        a2, 2, .Lbr006                        #  13c: f62265
            movi         a2, 2 /* 0x00000002 */                #  13f: 0c22
            movi         a3, 0 /* 0x00000000 */                #  141: 0c03
            call0        sdk_pm_wakeup_init                    #  143: 01efffc0
                                                               #  147: 0000
            movi         a4, .Ldata002                         #  149: 41e5ff
            movi         a3, 2 /* 0x00000002 */                #  14c: 0c23
            s8i          a3, a4, 224 /* 0x02 -> [.Ldata032] */ #  14e: 3244e0
            j            .Lbr007                               #  151: 861600
.Lbr002:    bnei         a0, 2, .Lbr003                        #  154: 662019
            movi         a2, 1 /* 0x00000001 */                #  157: 0c12
            call0        sdk_clockgate_watchdog                #  159: 01eaffc0
                                                               #  15d: 0000
            movi         a2, 8 /* 0x00000008 */                #  15f: 0c82
            movi         a3, 0 /* 0x00000000 */                #  161: 0c03
            call0        sdk_pm_wakeup_init                    #  163: 01e9ffc0
                                                               #  167: 0000
            movi         a2, 0 /* 0x00000000 */                #  169: 0c02
            call0        sdk_clockgate_watchdog                #  16b: 01e8ffc0
                                                               #  16f: 0000
.Lbr003:    movi         a2, .Label008                         #  171: 21dcff
            call0        printf                                #  174: 01e7ffc0
                                                               #  178: 0000
            movi         a4, sdk_pend_flag_periodic_cal        #  17a: 41dbff
            l8ui         a5, a4, 0 /* [sdk_pend_flag_periodic_cal] */ #  17d: 520400
            movi         a0, 0 /* 0x00000000 */                #  180: 0c00
            bnei         a5, 1, .Lbr004                        #  182: 66150c
            movi         a2, 0 /* 0x00000000 */                #  185: 0c02
            s8i          a2, a4, 0 /* 0x00 -> [sdk_pend_flag_periodic_cal] */ #  187: 224400
            call0        sdk_periodic_cal_top                  #  18a: 01e2ffc0
                                                               #  18e: 0000
            movi         a0, 0 /* 0x00000000 */                #  190: 0c00
.Lbr004:    movi         a2, sdk_pend_flag_noise_check         #  192: 21d6ff
            l8ui         a6, a2, 0 /* [sdk_pend_flag_noise_check] */ #  195: 620200
            bnei         a6, 1, .Lbr005                        #  198: 661602
            s8i          a0, a2, 0 /* 0x00 -> [sdk_pend_flag_noise_check] */ #  19b: 024200
.Lbr005:    l32i         a0, sp, 0 /* [(local0)] */            #  19e: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  1a0: 12c110
            ret           /* sdk_pend_flag_noise_check */      #  1a3: 0df0
.Lbr006:    movi         a2, 2 /* 0x00000002 */                #  1a5: 0c22
            movi         a3, 1 /* 0x00000001 */                #  1a7: 0c13
            call0        sdk_pm_wakeup_init                    #  1a9: 01dbffc0
                                                               #  1ad: 0000
.Lbr007:    movi         a7, sdk_NMIIrqIsOn                    #  1af: 71d0ff
            l8ui         a7, a7, 0 /* [sdk_NMIIrqIsOn] */      #  1b2: 720700
            bnez         a7, .Lbr008                           #  1b5: dcd7
            movi         a11, -32 /* 0xffffffe0 */             #  1b7: 6c0b
            memw                                               #  1b9: c02000
            movi         a10, 0x3feffe00                       #  1bc: a1ceff
            l32i         a9, a10, 0x200 /* [0x3ff00000] */     #  1bf: 922a80
            and          a9, a9, a11                           #  1c2: b09910
            movi         a11, 1 /* 0x00000001 */               #  1c5: 0c1b
            or           a9, a9, a11                           #  1c7: b09920
            memw                                               #  1ca: c02000
            s32i         a9, a10, 0x200 /* a9 -> [0x3ff00000] */ #  1cd: 926a80
            call0        vPortExitCritical                     #  1d0: 01d3ffc0
                                                               #  1d4: 0000
.Lbr008:    movi         a2, 0 /* 0x00000000 */                #  1d6: 0c02
            call0        sdk_clockgate_watchdog                #  1d8: 01d2ffc0
                                                               #  1dc: 0000
            movi         a0, .Ldata002                         #  1de: 01c6ff
            l8ui         a0, a0, 225 /* [.Ldata033] */         #  1e1: 0200e1
            bnei         a0, 1, .Lbr003                        #  1e4: 661089
            memw                                               #  1e7: c02000
            movi         a3, 0x3feffe00                        #  1ea: 31c4ff
            l32i         a2, a3, 0x214 /* [0x3ff00014] */      #  1ed: 222385
            movi         a4, 1 /* 0x00000001 */                #  1f0: 0c14
            or           a2, a2, a4                            #  1f2: 402220
            memw                                               #  1f5: c02000
            s32i         a2, a3, 0x214 /* a2 -> [0x3ff00014] */ #  1f8: 226385
            movi         a2, 160 /* 0x000000a0 */              #  1fb: 22a0a0
            call0        sdk_ets_update_cpu_frequency          #  1fe: 01c9ffc0
                                                               #  202: 0000
            j            .Lbr003                               #  204: 46daff

            .literal_position                                  #  208: 00000000
                                                               #  20c: 000af23f

# Function @ .irom0.text+0x210
.Lfunc004:  movi         a6, .Ldata002                         #  210: 61feff
            l8ui         a2, a6, 54 /* [.Ldata018] */          #  213: 220636
            movi         a5, 0x3ff20a00                        #  216: 51fdff
            beqz         a2, .Lbr009                           #  219: ac12
            memw                                               #  21b: c02000
            l8ui         a4, a6, 62 /* [.Ldata026] */          #  21e: 42063e
            l32i         a5, a5, 0x200 /* [0x3ff20c00] */      #  221: 522580
            l32i         a2, a6, 24 /* [.Ldata009] */          #  224: 2866
            l32i         a3, a6, 48 /* [.Ldata015] */          #  226: 38c6
            sub          a2, a2, a5                            #  228: 5022c0
            mull         a3, a3, a4                            #  22b: 403382
            bltu         a3, a2, .Lbr009                       #  22e: 27330c
            l32i         a8, a6, 76 /* [.Ldata030] */          #  231: 822613
            l16ui        a7, a6, 44 /* [.Ldata012] */          #  234: 721616
            add          a7, a7, a8                            #  237: 8a77
            bgeu         a7, a2, .Lbr009                       #  239: 27b701
            ret                                                #  23c: 0df0
.Lbr009:    movi         a2, 0 /* 0x00000000 */                #  23e: 0c02
            ret           /* 0x00000000 */                     #  240: 0df0

            .literal_position                                  #  244: 00000000

# Function @ .irom0.text+0x248
            .global      sdk_pm_rf_is_closed
            .type        sdk_pm_rf_is_closed, @function
sdk_pm_rf_is_closed:
            movi         a4, .Ldata002                         #  248: 41ffff
            movi         a3, 1 /* 0x00000001 */                #  24b: 0c13
            l8ui         a4, a4, 53 /* [.Ldata017] */          #  24d: 420435
            movi         a2, 0 /* 0x00000000 */                #  250: 0c02
            extui        a4, a4, 1, 3                          #  252: 404124
            addi         a4, a4, -3                            #  255: 42c4fd
            moveqz       a2, a3, a4                            #  258: 402383
            ret                                                #  25b: 0df0

            .literal_position                                  #  260: 00000000
                                                               #  264: 04000000
                                                               #  268: 10000000
                                                               #  26c: 04000000
                                                               #  270: 18000000
                                                               #  274: 20000000
                                                               #  278: 48000000
                                                               #  27c: 54000000
                                                               #  280: 00000000
                                                               #  284: 00000000
                                                               #  288: 00000000
                                                               #  28c: 00000000
                                                               #  290: 00000000

# Function @ .irom0.text+0x294
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .global      sdk_pm_set_sleep_type_from_upper
            .type        sdk_pm_set_sleep_type_from_upper, @function
sdk_pm_set_sleep_type_from_upper:
            addi         sp, sp, -16 /* (local0) */            #  294: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  297: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  299: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  29b: c911
            movi         a13, .Ldata002                        #  29d: d1f0ff
            extui        a12, a2, 0, 8                         #  2a0: 20c074
            bnez         a12, .Lbr010                          #  2a3: dc2c
            movi         a2, .Lstr001                          #  2a5: 21efff
            movi         a3, .Lstr002                          #  2a8: 31f0ff
            movi         a0, 0 /* 0x00000000 */                #  2ab: 0c00
            s8i          a0, a13, 228 /* 0x00 -> [.Ldata036] */ #  2ad: 024de4
            call0        printf                                #  2b0: 01f4ffc0
                                                               #  2b4: 0000
            j            .Lbr014                               #  2b6: 860f00
.Lbr010:    movi         a2, 1 /* 0x00000001 */                #  2b9: 0c12
            movi         a3, .Lstr003                          #  2bb: 31edff
            s8i          a2, a13, 228 /* 0x01 -> [.Ldata036] */ #  2be: 224de4
            movi         a2, .Lstr001                          #  2c1: 21eaff
            call0        printf                                #  2c4: 01f0ffc0
                                                               #  2c8: 0000
            beqi         a12, 1, .Lbr011                       #  2ca: 261c08
            beqi         a12, 2, .Lbr011                       #  2cd: 262c05
            s8i          a12, a13, 227 /* a12 -> [.Ldata035] */ #  2d0: c24de3
            j            .Lbr014                               #  2d3: 460800
.Lbr011:    l8ui         a3, a13, 226 /* [.Ldata034] */        #  2d6: 320de2
            beq          a3, a12, .Lbr013                      #  2d9: c71312
            bnei         a12, 1, .Lbr012                       #  2dc: 661c0a
            movi         a2, .Lstr004                          #  2df: 21e5ff
            call0        printf                                #  2e2: 01e9ffc0
                                                               #  2e6: 0000
            movi         a12, 2 /* 0x00000002 */               #  2e8: 0c2c
.Lbr012:    mov          a3, a12                               #  2ea: 3d0c
            s8i          a12, a13, 226 /* a12 -> [.Ldata034] */ #  2ec: c24de2
.Lbr013:    movi         a2, .Lstr005                          #  2ef: 21e2ff
            call0        printf                                #  2f2: 01e6ffc0
                                                               #  2f6: 0000
.Lbr014:    movi         a2, .Label009                         #  2f8: 21e1ff
            call0        printf                                #  2fb: 01e5ffc0
                                                               #  2ff: 0000
            l32i         a12, sp, 4 /* [(local1)] */           #  301: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  303: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  305: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  307: 12c110
            ret                                                #  30a: 0df0

            .literal_position                                  #  30c: 00000000

# Function @ .irom0.text+0x310
            .global      sdk_pm_get_sleep_type
            .type        sdk_pm_get_sleep_type, @function
sdk_pm_get_sleep_type:
            movi         a2, .Ldata002                         #  310: 21ffff
            movi         a3, 0 /* 0x00000000 */                #  313: 0c03
            l8ui         a4, a2, 228 /* [.Ldata036] */         #  315: 4202e4
            l8ui         a2, a2, 226 /* [.Ldata034] */         #  318: 2202e2
            addi         a4, a4, -1 /* [.Ldata036]-0x1 */      #  31b: 0b44
            movnez       a2, a3, a4                            #  31d: 402393
            ret                                                #  320: 0df0

            .literal_position                                  #  324: 00000000
                                                               #  328: 68000000
                                                               #  32c: 58000000
                                                               #  330: 60000000
                                                               #  334: 70000000
                                                               #  338: 88000000
                                                               #  33c: 54000000
                                                               #  340: 90000000
                                                               #  344: 00000000
                                                               #  348: 00000000
                                                               #  34c: 00000000
                                                               #  350: 00000000
                                                               #  354: 00000000
                                                               #  358: 00000000
                                                               #  35c: 00000000
                                                               #  360: 00000000
                                                               #  364: 00000000
                                                               #  368: 00000000
                                                               #  36c: 00000000

# Function @ .irom0.text+0x370
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
.Lfunc005:  addi         sp, sp, -16 /* (local0) */            #  370: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  373: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  375: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  377: 0901
            mov          a12, a2 /* arg0 */                    #  379: cd02
            call0        vTaskSuspendAll                       #  37b: 01f2ffc0
                                                               #  37f: 0000
            movi         a13, .Ldata002                        #  381: d1e8ff
            l8ui         a0, a13, 53 /* [.Ldata017] */         #  384: 020d35
            extui        a3, a0, 1, 3                          #  387: 003124
            beqi         a3, 3, .Lbr016                        #  38a: 263325
            movi         a2, .Lstr008                          #  38d: 21e6ff
            mov          a4, a12 /* arg0 */                    #  390: 4d0c
            call0        printf                                #  392: 01edffc0
                                                               #  396: 0000
            l8ui         a0, a13, 53 /* [.Ldata017] */         #  398: 020d35
            extui        a2, a0, 1, 3                          #  39b: 002124
            beqi         a2, 3, .Lbr016                        #  39e: 263211
            movi         a2, .Lstr006                          #  3a1: 21e2ff
            movi         a3, .Lstr007                          #  3a4: 31e3ff
            movi         a4, 570 /* 0x0000023a */              #  3a7: 42a23a
            call0        printf                                #  3aa: 01e8ffc0
                                                               #  3ae: 0000
.Lbr015:    j            .Lbr015 /* (halt) */                  #  3b0: 06ffff
.Lbr016:    movi         a2, 241 /* 0x000000f1 */              #  3b3: 22a0f1
            and          a2, a0, a2                            #  3b6: 202010
            bbci         a0, 5, .Lbr020                        #  3b9: 576058
            movi         a0, 10 /* 0x0000000a */               #  3bc: 0ca0
            or           a0, a2, a0                            #  3be: 000220
.Lbr017:    s8i          a0, a13, 53 /* a0 -> [.Ldata017] */   #  3c1: 024d35
            call0        .Lfunc003                             #  3c4: 05d6ff
            s8i          a12, a13, 55 /* arg0 -> [.Ldata019] */ #  3c7: c24d37
            beqi         a12, 2, .Lbr019                       #  3ca: 262c36
            beqi         a12, 4, .Lbr018                       #  3cd: 264c05
            beqi         a12, 8, .Lbr021                       #  3d0: 268c46
            bnei         a12, 16, .Lbr019                      #  3d3: 66bc2d
.Lbr018:    l8ui         a2, a13, 53 /* [.Ldata017] */         #  3d6: 220d35
            bbci         a2, 5, .Lbr019                        #  3d9: 576227
            movi         a12, .Label003                        #  3dc: c1d6ff
            mov          a2, a12 /* .Label003 */               #  3df: 2d0c
            call0        sdk_os_timer_disarm                   #  3e1: 01dbffc0
                                                               #  3e5: 0000
            movi         a4, 191 /* 0x000000bf */              #  3e7: 42a0bf
            l8ui         a3, a13, 53 /* [.Ldata017] */         #  3ea: 320d35
            mov          a2, a12 /* .Label003 */               #  3ed: 2d0c
            and          a3, a3, a4                            #  3ef: 403310
            movi         a4, 64 /* 0x00000040 */               #  3f2: 4c04
            or           a3, a3, a4                            #  3f4: 403320
            s8i          a3, a13, 53 /* a3 -> [.Ldata017] */   #  3f7: 324d35
            movi         a4, 0 /* 0x00000000 */                #  3fa: 0c04
            movi         a3, 10 /* 0x0000000a */               #  3fc: 0ca3
            call0        sdk_os_timer_arm                      #  3fe: 01d5ffc0
                                                               #  402: 0000
.Lbr019:    call0        xTaskResumeAll                        #  404: 01d5ffc0
                                                               #  408: 0000
            l32i         a12, sp, 4 /* [(local1)] */           #  40a: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  40c: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  40e: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  410: 12c110
            ret                                                #  413: 0df0
.Lbr020:    mov          a0, a2                                #  415: 0d02
            j            .Lbr017                               #  417: 86e9ff
.Lbr021:    movi         a2, .Lstr009                          #  41a: 21c7ff
            call0        printf                                #  41d: 01cfffc0
                                                               #  421: 0000
            movi         a12, .Label002                        #  423: c1c6ff
            mov          a2, a12 /* .Label002 */               #  426: 2d0c
            call0        sdk_os_timer_disarm                   #  428: 01ceffc0
                                                               #  42c: 0000
            movi         a2, .Lstr010                          #  42e: 21c4ff
            call0        printf                                #  431: 01ccffc0
                                                               #  435: 0000
            l32i         a2, a13, 80 /* [.Ldata031] */         #  437: 222d14
            movi         a3, 1000 /* 0x000003e8 */             #  43a: 32a3e8
            call0        __udivsi3                             #  43d: 01caffc0
                                                               #  441: 0000
            mov          a3, a2                                #  443: 3d02
            movi         a4, 0 /* 0x00000000 */                #  445: 0c04
            mov          a2, a12 /* .Label002 */               #  447: 2d0c
            call0        sdk_os_timer_arm                      #  449: 01c8ffc0
                                                               #  44d: 0000
            j            .Lbr019                               #  44f: 46ecff

            .literal_position                                  #  454: 00000000

# Function @ .irom0.text+0x458
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc006:  addi         sp, sp, -16 /* (local0) */            #  458: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  45b: 0901
            movi         a0, .Ldata001                         #  45d: 01fdff
            l8ui         a0, a0, 0 /* [.Ldata001] */           #  460: 020000
            bnei         a0, 2, .Lbr022                        #  463: 662004
            movi         a2, 8 /* 0x00000008 */                #  466: 0c82
            call0        .Lfunc005                             #  468: 45f0ff
.Lbr022:    l32i         a0, sp, 0 /* [(local0)] */            #  46b: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  46d: 12c110
            ret                                                #  470: 0df0

            .balign      4
# Function @ .irom0.text+0x474
            .global      sdk_uart_tx_flush
            .type        sdk_uart_tx_flush, @function
sdk_uart_tx_flush:
            ret           /* arg0 */                           #  474: 0df0

            .balign      4
# Function @ .irom0.text+0x478
            .global      sdk_pm_suspend
            .type        sdk_pm_suspend, @function
sdk_pm_suspend:
            ret           /* arg0 */                           #  478: 0df0

            .literal_position                                  #  47c: 98000000
                                                               #  480: 00000000
                                                               #  484: 00000000
                                                               #  488: 00000000
                                                               #  48c: 00000000

# Function @ .irom0.text+0x490
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc007:  addi         sp, sp, -16 /* (local0) */            #  490: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  493: 0901
            call0        vTaskSuspendAll                       #  495: 01fbffc0
                                                               #  499: 0000
            movi         a2, .Lstr011                          #  49b: 21f8ff
            call0        printf                                #  49e: 01faffc0
                                                               #  4a2: 0000
            movi         a2, .Ldata002                         #  4a4: 21f7ff
            movi         a3, 4 /* 0x00000004 */                #  4a7: 0c43
            l8ui         a0, a2, 53 /* [.Ldata017] */          #  4a9: 020235
            movi         a4, 241 /* 0x000000f1 */              #  4ac: 42a0f1
            and          a0, a0, a4                            #  4af: 400010
            or           a0, a0, a3                            #  4b2: 300020
            s8i          a0, a2, 53 /* a0 -> [.Ldata017] */    #  4b5: 024235
            call0        xTaskResumeAll                        #  4b8: 01f5ffc0
                                                               #  4bc: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  4be: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  4c0: 12c110
            ret                                                #  4c3: 0df0

            .literal_position                                  #  4c8: 70000000
                                                               #  4cc: 000af23f
                                                               #  4d0: a8000000
                                                               #  4d4: 00900100
                                                               #  4d8: 54000000
                                                               #  4dc: bc000000
                                                               #  4e0: c4000000
                                                               #  4e4: dc000000
                                                               #  4e8: e4000000
                                                               #  4ec: 00000000
                                                               #  4f0: 00000000
                                                               #  4f4: 00000000
                                                               #  4f8: 00000000
                                                               #  4fc: 00000000
                                                               #  500: 00000000
                                                               #  504: 00000000
                                                               #  508: 00000000
                                                               #  50c: 00000000
                                                               #  510: 00000000
                                                               #  514: 00000000
                                                               #  518: 00000000
                                                               #  51c: 00000000
                                                               #  520: 00000000

# Function @ .irom0.text+0x524
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
.Lfunc008:  addi         sp, sp, -32 /* (local0) */            #  524: 12c1e0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  527: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  529: d921
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  52b: e931
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  52d: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  52f: 0901
            call0        vTaskSuspendAll                       #  531: 01eeffc0
                                                               #  535: 0000
            movi         a15, .Label003                        #  537: f1e4ff
            movi         a14, 0x3ff20a00                       #  53a: e1e4ff
            addi         a12, a15, -28 /* .Label002 */         #  53d: c2cfe4
            addi         a13, a15, -112 /* .Ldata002 */        #  540: d2cf90
            memw                                               #  543: c02000
            l8ui         a0, a13, 54 /* [.Ldata018] */         #  546: 020d36
            movi         a3, 241 /* 0x000000f1 */              #  549: 32a0f1
            l8ui         a2, a13, 53 /* [.Ldata017] */         #  54c: 220d35
            l32i         a14, a14, 0x200 /* [0x3ff20c00] */    #  54f: e22e80
            and          a2, a2, a3                            #  552: 302210
            movi         a3, 8 /* 0x00000008 */                #  555: 0c83
            or           a2, a2, a3                            #  557: 302220
            s8i          a2, a13, 53 /* a2 -> [.Ldata017] */   #  55a: 224d35
            beqz         a0, .Lbr027                           #  55d: 16300a
            l32i         a5, a13, 20 /* [.Ldata008] */         #  560: 585d
            l32i         a3, a13, 48 /* [.Ldata015] */         #  562: 38cd
            sub          a0, a5, a14                           #  564: e005c0
            bgeu         a3, a0, .Lbr026                       #  567: 07b349
            movi         a15, 100 /* 0x00000064 */             #  56a: f2a064
            movi         a12, 0 /* 0x00000000 */               #  56d: 0c0c
            l8ui         a4, a13, 62 /* [.Ldata026] */         #  56f: 420d3e
.Lbr023:    addi         a12, a12, 1                           #  572: 1bcc
            l32i         a0, a13, 24 /* [.Ldata009] */         #  574: 086d
            s32i         a5, a13, 28 /* a5 -> [.Ldata010] */   #  576: 597d
            mull         a6, a4, a3                            #  578: 306482
            add          a5, a3, a5                            #  57b: 5a53
            s32i         a5, a13, 20 /* a5 -> [.Ldata008] */   #  57d: 595d
            sub          a2, a0, a5                            #  57f: 5020c0
            bgeu         a6, a2, .Lbr024                       #  582: 27b603
            add          a7, a6, a0                            #  585: 0a76
            s32i         a7, a13, 24 /* a7 -> [.Ldata009] */   #  587: 796d
.Lbr024:    bne          a12, a15, .Lbr025                     #  589: f79c21
            movi         a2, .Lstr012                          #  58c: 21d1ff
            mov          a6, a14 /* [0x3ff20c00] */            #  58f: 6d0e
            call0        printf                                #  591: 01d7ffc0
                                                               #  595: 0000
            l32i         a5, a13, 20 /* [.Ldata008] */         #  597: 585d
            movi         a9, 0x00019000                        #  599: 91ceff
            l32i         a3, a13, 48 /* [.Ldata015] */         #  59c: 38cd
            l8ui         a4, a13, 62 /* [.Ldata026] */         #  59e: 420d3e
            movi         a10, 1 /* 0x00000001 */               #  5a1: 0c1a
            moveqz       a4, a10, a4                           #  5a3: 404a83
            s8i          a4, a13, 62 /* a4 -> [.Ldata026] */   #  5a6: 424d3e
            moveqz       a3, a9, a3                            #  5a9: 303983
            s32i         a3, a13, 48 /* a3 -> [.Ldata015] */   #  5ac: 39cd
.Lbr025:    sub          a8, a5, a14                           #  5ae: e085c0
            bltu         a3, a8, .Lbr023                       #  5b1: 8733bd
.Lbr026:    movi         a12, .Label002                        #  5b4: c1c9ff
            movi         a2, .Lstr013                          #  5b7: 21c9ff
            addi         a15, a12, 28 /* .Label003 */          #  5ba: f2cc1c
            call0        printf                                #  5bd: 01cdffc0
                                                               #  5c1: 0000
            mov          a2, a15 /* .Label003 */               #  5c3: 2d0f
            call0        sdk_os_timer_disarm                   #  5c5: 01ccffc0
                                                               #  5c9: 0000
            mov          a2, a12 /* .Label002 */               #  5cb: 2d0c
            call0        sdk_os_timer_disarm                   #  5cd: 01cbffc0
                                                               #  5d1: 0000
            movi         a2, .Label010                         #  5d3: 21c3ff
            call0        printf                                #  5d6: 01caffc0
                                                               #  5da: 0000
            movi         a3, 1000 /* 0x000003e8 */             #  5dc: 32a3e8
            l32i         a4, a13, 76 /* [.Ldata030] */         #  5df: 422d13
            l32i         a5, a13, 20 /* [.Ldata008] */         #  5e2: 585d
            l32i         a2, a13, 80 /* [.Ldata031] */         #  5e4: 222d14
            sub          a5, a5, a14                           #  5e7: e055c0
            add          a2, a2, a5                            #  5ea: 5a22
            sub          a2, a2, a4                            #  5ec: 4022c0
            call0        __udivsi3                             #  5ef: 01c5ffc0
                                                               #  5f3: 0000
            mov          a3, a2                                #  5f5: 3d02
            movi         a4, 0 /* 0x00000000 */                #  5f7: 0c04
            mov          a2, a12 /* .Label002 */               #  5f9: 2d0c
            call0        sdk_os_timer_arm                      #  5fb: 01c3ffc0
                                                               #  5ff: 0000
            j            .Lbr028                               #  601: 860b00
.Lbr027:    movi         a2, .Lstr014                          #  604: 21b8ff
            call0        printf                                #  607: 01c1ffc0
                                                               #  60b: 0000
            mov          a2, a15 /* .Label003 */               #  60d: 2d0f
            call0        sdk_os_timer_disarm                   #  60f: 01c0ffc0
                                                               #  613: 0000
            mov          a2, a12 /* .Label002 */               #  615: 2d0c
            call0        sdk_os_timer_disarm                   #  617: 01bfffc0
                                                               #  61b: 0000
            movi         a2, .Lstr015                          #  61d: 21b2ff
            call0        printf                                #  620: 01beffc0
                                                               #  624: 0000
            mov          a2, a12 /* .Label002 */               #  626: 2d0c
            movi         a3, 105 /* 0x00000069 */              #  628: 32a069
            movi         a4, 0 /* 0x00000000 */                #  62b: 0c04
            call0        sdk_os_timer_arm                      #  62d: 01bbffc0
                                                               #  631: 0000
.Lbr028:    call0        xTaskResumeAll                        #  633: 01bbffc0
                                                               #  637: 0000
            l32i         a12, sp, 4 /* [(local1)] */           #  639: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  63b: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  63d: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  63f: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  641: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  643: 12c120
            ret                                                #  646: 0df0

            .literal_position                                  #  648: ec000000
                                                               #  64c: 00000000
                                                               #  650: 00010000
                                                               #  654: 00000000
                                                               #  658: 00000000
                                                               #  65c: 00000000
                                                               #  660: 00000000
                                                               #  664: 00000000
                                                               #  668: 00000000

# Function @ .irom0.text+0x66c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc009:  addi         sp, sp, -16 /* (local0) */            #  66c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  66f: 0901
            call0        vTaskSuspendAll                       #  671: 01f8ffc0
                                                               #  675: 0000
            call0        sdk_pm_rf_is_closed                   #  677: 050000
            bnez         a2, .Lbr029                           #  67a: ec62
            movi         a2, .Lstr016                          #  67c: 21f3ff
            call0        printf                                #  67f: 01f6ffc0
                                                               #  683: 0000
            movi         a2, 1 /* 0x00000001 */                #  685: 0c12
            call0        sdk_pm_send_nullfunc                  #  687: 01f5ffc0
                                                               #  68b: 0000
            movi         a3, .Ldata002                         #  68d: 31efff
            movi         a4, 2 /* 0x00000002 */                #  690: 0c24
            l8ui         a0, a3, 53 /* [.Ldata017] */          #  692: 020335
            movi         a5, 241 /* 0x000000f1 */              #  695: 52a0f1
            and          a0, a0, a5                            #  698: 500010
            or           a0, a0, a4                            #  69b: 400020
            s8i          a0, a3, 53 /* a0 -> [.Ldata017] */    #  69e: 024335
            j            .Lbr030                               #  6a1: 060200
.Lbr029:    movi         a2, .Lstr017                          #  6a4: 21ebff
            call0        printf                                #  6a7: 01eeffc0
                                                               #  6ab: 0000
.Lbr030:    call0        xTaskResumeAll                        #  6ad: 01edffc0
                                                               #  6b1: 0000
            bnez         a2, .Lbr031                           #  6b3: cc62
            movi         a2, 1 /* 0x00000001 */                #  6b5: 0c12
            call0        PendSV                                #  6b7: 01ecffc0
                                                               #  6bb: 0000
.Lbr031:    l32i         a0, sp, 0 /* [(local0)] */            #  6bd: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  6bf: 12c110
            ret                                                #  6c2: 0df0

            .literal_position                                  #  6c4: 1c010000
                                                               #  6c8: 00000000
                                                               #  6cc: 2c010000
                                                               #  6d0: 00000000
                                                               #  6d4: 00000000
                                                               #  6d8: 00000000
                                                               #  6dc: 00000000
                                                               #  6e0: 00000000
                                                               #  6e4: 00000000

# Function @ .irom0.text+0x6e8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc010:  addi         sp, sp, -16 /* (local0) */            #  6e8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  6eb: 0901
            call0        vTaskSuspendAll                       #  6ed: 01f8ffc0
                                                               #  6f1: 0000
            call0        sdk_pm_rf_is_closed                   #  6f3: 050000
            bnez         a2, .Lbr032                           #  6f6: ec62
            movi         a2, .Lstr018                          #  6f8: 21f3ff
            call0        printf                                #  6fb: 01f6ffc0
                                                               #  6ff: 0000
            movi         a2, 0 /* 0x00000000 */                #  701: 0c02
            call0        sdk_pm_send_nullfunc                  #  703: 01f5ffc0
                                                               #  707: 0000
            movi         a3, .Ldata002                         #  709: 31efff
            movi         a4, 12 /* 0x0000000c */               #  70c: 0cc4
            l8ui         a0, a3, 53 /* [.Ldata017] */          #  70e: 020335
            movi         a5, 241 /* 0x000000f1 */              #  711: 52a0f1
            and          a0, a0, a5                            #  714: 500010
            or           a0, a0, a4                            #  717: 400020
            s8i          a0, a3, 53 /* a0 -> [.Ldata017] */    #  71a: 024335
            j            .Lbr033                               #  71d: 060200
.Lbr032:    movi         a2, .Lstr019                          #  720: 21ebff
            call0        printf                                #  723: 01eeffc0
                                                               #  727: 0000
.Lbr033:    call0        xTaskResumeAll                        #  729: 01edffc0
                                                               #  72d: 0000
            bnez         a2, .Lbr034                           #  72f: cc62
            movi         a2, 1 /* 0x00000001 */                #  731: 0c12
            call0        PendSV                                #  733: 01ecffc0
                                                               #  737: 0000
.Lbr034:    l32i         a0, sp, 0 /* [(local0)] */            #  739: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  73b: 12c110
            ret                                                #  73e: 0df0

            .literal_position                                  #  740: 44010000
                                                               #  744: 00000000
                                                               #  748: 00000000
                                                               #  74c: 00000000
                                                               #  750: 00000000
                                                               #  754: 00000000

# Function @ .irom0.text+0x758
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc011:  addi         sp, sp, -16 /* (local0) */            #  758: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  75b: 0901
            call0        vTaskSuspendAll                       #  75d: 01faffc0
                                                               #  761: 0000
            movi         a2, .Lstr020                          #  763: 21f7ff
            movi         a3, .Ldata002                         #  766: 31f7ff
            movi         a4, 14 /* 0x0000000e */               #  769: 0ce4
            l8ui         a0, a3, 53 /* [.Ldata017] */          #  76b: 020335
            movi         a5, 241 /* 0x000000f1 */              #  76e: 52a0f1
            and          a0, a0, a5                            #  771: 500010
            or           a0, a0, a4                            #  774: 400020
            s8i          a0, a3, 53 /* a0 -> [.Ldata017] */    #  777: 024335
            call0        printf                                #  77a: 01f4ffc0
                                                               #  77e: 0000
            call0        sdk_ppProcessWaitQ                    #  780: 01f4ffc0
                                                               #  784: 0000
            call0        xTaskResumeAll                        #  786: 01f3ffc0
                                                               #  78a: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  78c: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  78e: 12c110
            ret                                                #  791: 0df0

            .literal_position                                  #  794: 00000000
                                                               #  798: 00000000
                                                               #  79c: 00000000
                                                               #  7a0: 00000000

# Function @ .irom0.text+0x7a4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc012:  addi         sp, sp, -16 /* (local0) */            #  7a4: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  7a7: 0901
            call0        vTaskSuspendAll                       #  7a9: 01fbffc0
                                                               #  7ad: 0000
            movi         a2, .Ldata002                         #  7af: 21f9ff
            l8ui         a0, a2, 53 /* [.Ldata017] */          #  7b2: 020235
            movi         a3, 241 /* 0x000000f1 */              #  7b5: 32a0f1
            and          a0, a0, a3                            #  7b8: 300010
            s8i          a0, a2, 53 /* a0 -> [.Ldata017] */    #  7bb: 024235
            call0        sdk_ppProcessWaitQ                    #  7be: 01f7ffc0
                                                               #  7c2: 0000
            call0        xTaskResumeAll                        #  7c4: 01f7ffc0
                                                               #  7c8: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  7ca: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  7cc: 12c110
            ret                                                #  7cf: 0df0

            .literal_position                                  #  7d4: 00000000
                                                               #  7d8: 4c010000
                                                               #  7dc: 54000000
                                                               #  7e0: 70000000
                                                               #  7e4: 54010000
                                                               #  7e8: 00000000
                                                               #  7ec: 00000000
                                                               #  7f0: 00000000
                                                               #  7f4: 00000000

# Function @ .irom0.text+0x7f8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
.Lfunc013:  addi         sp, sp, -16 /* (local0) */            #  7f8: 12c1f0
            movi         a2, .Lstr021                          #  7fb: 21f7ff
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  7fe: c911
            movi         a12, .Ldata002                        #  800: c1f5ff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  803: 0901
            l8ui         a0, a12, 53 /* [.Ldata017] */         #  805: 020c35
            movi         a3, 191 /* 0x000000bf */              #  808: 32a0bf
            and          a0, a0, a3                            #  80b: 300010
            s8i          a0, a12, 53 /* a0 -> [.Ldata017] */   #  80e: 024c35
            call0        printf                                #  811: 01f5ffc0
                                                               #  815: 0000
            movi         a2, .Label002                         #  817: 21f1ff
            call0        sdk_os_timer_disarm                   #  81a: 01f4ffc0
                                                               #  81e: 0000
            movi         a2, .Label003                         #  820: 21f0ff
            call0        sdk_os_timer_disarm                   #  823: 01f3ffc0
                                                               #  827: 0000
            l8ui         a0, a12, 53 /* [.Ldata017] */         #  829: 020c35
            l8ui         a4, a12, 59 /* [.Ldata023] */         #  82c: 420c3b
            bbsi         a0, 4, .Lbr037                        #  82f: 47e01b
            bnez         a4, .Lbr037                           #  832: dc84
            movi         a5, 0 /* 0x00000000 */                #  834: 0c05
            s8i          a5, a12, 61 /* 0x00 -> [.Ldata025] */ #  836: 524c3d
            bbci         a0, 5, .Lbr035                        #  839: 576005
            call0        .Lfunc011                             #  83c: 85f1ff
            j            .Lbr036                               #  83f: 860000
.Lbr035:    call0        .Lfunc012                             #  842: 05f6ff
.Lbr036:    l32i         a12, sp, 4 /* [(local1)] */           #  845: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  847: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  849: 12c110
            ret                                                #  84c: 0df0
.Lbr037:    movi         a2, .Lstr022                          #  84e: 21e5ff
            call0        printf                                #  851: 01e8ffc0
                                                               #  855: 0000
            call0        .Lfunc010                             #  857: 05e9ff
            j            .Lbr036                               #  85a: c6f9ff

            .literal_position                                  #  860: 64010000
                                                               #  864: 54000000
                                                               #  868: 70000000
                                                               #  86c: 00000000
                                                               #  870: 00000000
                                                               #  874: c4000000
                                                               #  878: 000af23f
                                                               #  87c: 6c010000
                                                               #  880: 70170000
                                                               #  884: 50460000
                                                               #  888: 3ffe0000
                                                               #  88c: 00000000
                                                               #  890: 00000000
                                                               #  894: 00000000
                                                               #  898: 00000000
                                                               #  89c: 00000000

# Function @ .irom0.text+0x8a0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_pm_shutdown
            .type        sdk_pm_shutdown, @function
sdk_pm_shutdown:
            movi         a2, .Lstr023                          #  8a0: 21f0ff
            addi         sp, sp, -16 /* (local0) */            #  8a3: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  8a6: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  8a8: 0901
            call0        printf                                #  8aa: 01f8ffc0
                                                               #  8ae: 0000
            movi         a2, .Label002                         #  8b0: 21edff
            call0        sdk_os_timer_disarm                   #  8b3: 01f7ffc0
                                                               #  8b7: 0000
            movi         a2, .Label003                         #  8b9: 21ebff
            call0        sdk_os_timer_disarm                   #  8bc: 01f6ffc0
                                                               #  8c0: 0000
            movi         a4, 239 /* 0x000000ef */              #  8c2: 42a0ef
            movi         a3, .Ldata001                         #  8c5: 31eaff
            movi         a12, .Ldata002                        #  8c8: c1e9ff
            movi         a5, 0 /* 0x00000000 */                #  8cb: 0c05
            s8i          a5, a12, 58 /* 0x00 -> [.Ldata022] */ #  8cd: 524c3a
            s8i          a5, a12, 59 /* 0x00 -> [.Ldata023] */ #  8d0: 524c3b
            l8ui         a0, a12, 53 /* [.Ldata017] */         #  8d3: 020c35
            l8ui         a3, a3, 0 /* [.Ldata001] */           #  8d6: 320300
            and          a0, a0, a4                            #  8d9: 400010
            s8i          a0, a12, 53 /* a0 -> [.Ldata017] */   #  8dc: 024c35
            bnei         a3, 2, .Lbr039                        #  8df: 662315
            call0        sdk_pm_rf_is_closed                   #  8e2: 050000
            beqz         a2, .Lbr038                           #  8e5: 8cc2
            movi         a2, .Label006                         #  8e7: 21e3ff
            call0        sdk_os_timer_disarm                   #  8ea: 01ebffc0
                                                               #  8ee: 0000
            movi         a2, 2 /* 0x00000002 */                #  8f0: 0c22
            call0        .Lfunc005                             #  8f2: c5a7ff
.Lbr038:    l8ui         a0, a12, 53 /* [.Ldata017] */         #  8f5: 020c35
.Lbr039:    extui        a3, a0, 1, 3                          #  8f8: 003124
            beqi         a3, 7, .Lbr040                        #  8fb: 26730a
            beqz         a3, .Lbr040                           #  8fe: 8c73
            call0        .Lfunc013                             #  900: 45efff
            l8ui         a3, a12, 53 /* [.Ldata017] */         #  903: 320c35
            extui        a3, a3, 1, 3                          #  906: 303124
.Lbr040:    movi         a6, 0x3ff20a00                        #  909: 61dbff
            movi         a2, .Lstr024                          #  90c: 21dcff
            l32i         a7, a12, 12 /* [.Ldata006] */         #  90f: 783c
            l32i         a5, a12, 16 /* [.Ldata007] */         #  911: 584c
            l8ui         a4, a12, 58 /* [.Ldata022] */         #  913: 420c3a
            memw                                               #  916: c02000
            l32i         a6, a6, 0x200 /* [0x3ff20c00] */      #  919: 622680
            sub          a6, a6, a7                            #  91c: 7066c0
            call0        printf                                #  91f: 01dfffc0
                                                               #  923: 0000
            movi         a7, 7 /* 0x00000007 */                #  925: 0c77
            movi         a9, 223 /* 0x000000df */              #  927: 92a0df
            l8ui         a8, a12, 53 /* [.Ldata017] */         #  92a: 820c35
            movi         a11, 0x00001770                       #  92d: b1d4ff
            movi         a10, 0x00004650                       #  930: a1d5ff
            movi         a0, 0 /* 0x00000000 */                #  933: 0c00
            s8i          a0, a12, 54 /* 0x00 -> [.Ldata018] */ #  935: 024c36
            s32i         a0, a12, 48 /* 0x00000000 -> [.Ldata015] */ #  938: 09cc
            s8i          a0, a12, 62 /* 0x00 -> [.Ldata026] */ #  93a: 024c3e
            s32i         a0, a12, 28 /* 0x00000000 -> [.Ldata010] */ #  93d: 097c
            s32i         a0, a12, 20 /* 0x00000000 -> [.Ldata008] */ #  93f: 095c
            s32i         a0, a12, 24 /* 0x00000000 -> [.Ldata009] */ #  941: 096c
            s32i         a0, a12, 36 /* 0x00000000 -> [.Ldata011] */ #  943: 099c
            s32i         a10, a12, 80 /* 0x00004650 -> [.Ldata031] */ #  945: a26c14
            s32i         a11, a12, 76 /* 0x00001770 -> [.Ldata030] */ #  948: b26c13
            l8ui         a10, a12, 52 /* [.Ldata016] */        #  94b: a20c34
            and          a8, a8, a9                            #  94e: 908810
            extui        a8, a8, 0, 8                          #  951: 808074
            movi         a9, 0x0000fe3f                        #  954: 91cdff
            slli         a8, a8, 8                             #  957: 808811
            or           a8, a8, a10                           #  95a: a08820
            movi         a10, 254 /* 0x000000fe */             #  95d: a2a0fe
            and          a8, a8, a9                            #  960: 908810
            extui        a9, a8, 0, 8                          #  963: 809074
            srli         a11, a8, 8                            #  966: 80b841
            s8i          a11, a12, 53 /* a11 -> [.Ldata017] */ #  969: b24c35
            and          a9, a9, a10                           #  96c: a09910
            s8i          a9, a12, 52 /* a9 -> [.Ldata016] */   #  96f: 924c34
            extui        a8, a8, 8, 8                          #  972: 808874
            srli         a8, a8, 1                             #  975: 808141
            bnone        a7, a8, .Lbr041                       #  978: 870702
            call0        .Lfunc012                             #  97b: 85e2ff
.Lbr041:    l32i         a12, sp, 4 /* [(local1)] */           #  97e: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  980: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  982: 12c110
            ret                                                #  985: 0df0

            .literal_position                                  #  988: 00000000
                                                               #  98c: a8000000
                                                               #  990: 00000000
                                                               #  994: 00000000
                                                               #  998: 00000000
                                                               #  99c: 00000000

# Function @ .irom0.text+0x9a0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_pm_reset_idle_sleep
            .type        sdk_pm_reset_idle_sleep, @function
sdk_pm_reset_idle_sleep:
            addi         sp, sp, -16 /* (local0) */            #  9a0: 12c1f0
            movi         a2, .Ldata002                         #  9a3: 21f9ff
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  9a6: 0911
            movi         a0, 0 /* 0x00000000 */                #  9a8: 0c00
            s8i          a0, a2, 56 /* 0x00 -> [.Ldata020] */  #  9aa: 024238
            movi         a2, .Label005                         #  9ad: 21f7ff
            s32i         a2, sp, 0 /* .Label005 -> [(local0)] */ #  9b0: 2901
            call0        sdk_os_timer_disarm                   #  9b2: 01f8ffc0
                                                               #  9b6: 0000
            movi         a3, .Ldata002                         #  9b8: 31f6ff
            l8ui         a3, a3, 53 /* [.Ldata017] */          #  9bb: 320335
            bbsi         a3, 5, .Lbr042                        #  9be: 57e314
            call0        sdk_rc_get_mask                       #  9c1: 01f5ffc0
                                                               #  9c5: 0000
            bnez         a2, .Lbr042                           #  9c7: ccb2
            l32i         a2, sp, 0 /* [(local0)] */            #  9c9: 2801
            movi         a3, 500 /* 0x000001f4 */              #  9cb: 32a1f4
            movi         a4, 0 /* 0x00000000 */                #  9ce: 0c04
            call0        sdk_os_timer_arm                      #  9d0: 01f3ffc0
                                                               #  9d4: 0000
.Lbr042:    l32i         a0, sp, 4 /* [(local1)] */            #  9d6: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  9d8: 12c110
            ret                                                #  9db: 0df0

            .balign      4
# Function @ .irom0.text+0x9e0
            .global      sdk_pm_idle_sleep
            .type        sdk_pm_idle_sleep, @function
sdk_pm_idle_sleep:
            ret           /* arg0 */                           #  9e0: 0df0

            .literal_position                                  #  9e4: a8000000
                                                               #  9e8: 00000000
                                                               #  9ec: 84010000
                                                               #  9f0: 41000000
                                                               #  9f4: 000af23f
                                                               #  9f8: 58000000
                                                               #  9fc: 60000000
                                                               #  a00: 00000000
                                                               #  a04: 00000000
                                                               #  a08: 00000000
                                                               #  a0c: 00000000
                                                               #  a10: 00000000
                                                               #  a14: 00000000
                                                               #  a18: 00000000
                                                               #  a1c: 00000000
                                                               #  a20: 00000000

# Function @ .irom0.text+0xa24
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .global      sdk_pm_open
            .type        sdk_pm_open, @function
sdk_pm_open:
            addi         sp, sp, -16 /* (local0) */            #  a24: 12c1f0
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  a27: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  a29: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  a2b: 0911
            mov          a12, a2 /* arg0 */                    #  a2d: cd02
            call0        vTaskSuspendAll                       #  a2f: 01f4ffc0
                                                               #  a33: 0000
            mov          a2, a12 /* arg0 */                    #  a35: 2d0c
            call0        sdk_rc_get_sta_trc                    #  a37: 01f3ffc0
                                                               #  a3b: 0000
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  a3d: 2901
            beqz         a2, .Lbr044                           #  a3f: 16d208
            movi         a2, .Label005                         #  a42: 21e8ff
            movi         a13, .Ldata002                        #  a45: d1e8ff
            movi         a3, 32 /* 0x00000020 */               #  a48: 2c03
            l8ui         a0, a13, 53 /* [.Ldata017] */         #  a4a: 020d35
            movi         a4, 223 /* 0x000000df */              #  a4d: 42a0df
            and          a0, a0, a4                            #  a50: 400010
            or           a0, a0, a3                            #  a53: 300020
            s8i          a0, a13, 53 /* a0 -> [.Ldata017] */   #  a56: 024d35
            call0        sdk_os_timer_disarm                   #  a59: 01ebffc0
                                                               #  a5d: 0000
            movi         a2, .Lstr025                          #  a5f: 21e3ff
            l8ui         a3, a13, 226 /* [.Ldata034] */        #  a62: 320de2
            l8ui         a4, a13, 53 /* [.Ldata017] */         #  a65: 420d35
            l8ui         a5, a13, 58 /* [.Ldata022] */         #  a68: 520d3a
            extui        a4, a4, 1, 3                          #  a6b: 404124
            call0        printf                                #  a6e: 01e7ffc0
                                                               #  a72: 0000
            l8ui         a5, a13, 53 /* [.Ldata017] */         #  a74: 520d35
            extui        a4, a5, 1, 3                          #  a77: 504124
            bnez         a4, .Lbr045                           #  a7a: 563406
            movi         a7, 14 /* 0x0000000e */               #  a7d: 0ce7
            movi         a6, 241 /* 0x000000f1 */              #  a7f: 62a0f1
            and          a6, a5, a6                            #  a82: 606510
            or           a6, a6, a7                            #  a85: 706620
            s8i          a6, a13, 53 /* a6 -> [.Ldata017] */   #  a88: 624d35
.Lbr043:    l32i         a3, sp, 0 /* [(local0)] */            #  a8b: 3801
            movi         a2, .Label001                         #  a8d: 21d8ff
            l16ui        a4, a3, 32 /* [[(local0)]+0x20] */    #  a90: 421310
            s8i          a12, a13, 64 /* arg0 -> [.Ldata028] */ #  a93: c24d40
            s16i         a4, a13, 72 /* [[(local0)]+0x20] -> [.Ldata029] */ #  a96: 425d24
            addi         a3, a3, 26 /* [(local0)]+0x1a */      #  a99: 32c31a
            movi         a4, 6 /* 0x00000006 */                #  a9c: 0c64
            call0        memcpy                                #  a9e: 01dcffc0
                                                               #  aa2: 0000
            l8ui         a7, a13, 52 /* [.Ldata016] */         #  aa4: 720d34
            movi         a8, 254 /* 0x000000fe */              #  aa7: 82a0fe
            and          a7, a7, a8                            #  aaa: 807710
            movi         a8, 1 /* 0x00000001 */                #  aad: 0c18
            or           a7, a7, a8                            #  aaf: 807720
            s8i          a7, a13, 52 /* a7 -> [.Ldata016] */   #  ab2: 724d34
            movi         a6, 0x3ff20a00                        #  ab5: 61cfff
            memw                                               #  ab8: c02000
            movi         a5, 0 /* 0x00000000 */                #  abb: 0c05
            l32i         a6, a6, 0x200 /* [0x3ff20c00] */      #  abd: 622680
            s32i         a6, a13, 12 /* [0x3ff20c00] -> [.Ldata006] */ #  ac0: 693d
            s32i         a5, a13, 16 /* 0x00000000 -> [.Ldata007] */ #  ac2: 594d
            call0        sdk_pp_disable_idle_timer             #  ac4: 01d4ffc0
                                                               #  ac8: 0000
            call0        sdk_pp_enable_idle_timer              #  aca: 01d3ffc0
                                                               #  ace: 0000
.Lbr044:    call0        xTaskResumeAll                        #  ad0: 01d3ffc0
                                                               #  ad4: 0000
            l32i         a12, sp, 8 /* [(local2)] */           #  ad6: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  ad8: d831
            l32i         a0, sp, 4 /* [(local1)] */            #  ada: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  adc: 12c110
            ret                                                #  adf: 0df0
.Lbr045:    beqi         a4, 6, .Lbr043                        #  ae1: 2664a6
            l8ui         a9, a13, 52 /* [.Ldata016] */         #  ae4: 920d34
            bbci         a9, 0, .Lbr043                        #  ae7: 0769a0
            movi         a2, .Lstr006                          #  aea: 21c3ff
            movi         a3, .Lstr007                          #  aed: 31c3ff
            movi         a4, 868 /* 0x00000364 */              #  af0: 42a364
            call0        printf                                #  af3: 01cbffc0
                                                               #  af7: 0000
.Lbr046:    j            .Lbr046 /* (halt) */                  #  af9: 06ffff

            .literal_position                                  #  afc: 00000000
                                                               #  b00: a4010000
                                                               #  b04: b0010000
                                                               #  b08: 54000000
                                                               #  b0c: b8010000
                                                               #  b10: 44010000
                                                               #  b14: 44010000
                                                               #  b18: 00000000
                                                               #  b1c: 45010000
                                                               #  b20: 70000000
                                                               #  b24: dc010000
                                                               #  b28: cc010000
                                                               #  b2c: 00000000
                                                               #  b30: 00000000
                                                               #  b34: 00000000
                                                               #  b38: 00000000
                                                               #  b3c: 00000000
                                                               #  b40: 00000000
                                                               #  b44: 00000000
                                                               #  b48: 00000000
                                                               #  b4c: 00000000
                                                               #  b50: 00000000
                                                               #  b54: 00000000
                                                               #  b58: 00000000
                                                               #  b5c: 00000000

# Function @ .irom0.text+0xb60
# Local variables/stack:
#     (local0):  word      @ -0x30
#     (local1):  word      @ -0x2c
#     (local2):  word      @ -0x28
#     (local3):  word      @ -0x24
#     (local4):  word      @ -0x20
#     (local5):  word      @ -0x1c
#     (local6):  word      @ -0x18
#     (local7):  word      @ -0x14
#     (local8):  word      @ -0x10
#     (local9):  word[3]   @ -0xc
            .global      sdk_pm_onBcnRx
            .type        sdk_pm_onBcnRx, @function
sdk_pm_onBcnRx:
            addi         sp, sp, -48 /* (local0) */            #  b60: 12c1d0
            s32i         a13, sp, 24 /* a13 -> [(local6)] */   #  b63: d961
            s32i         a15, sp, 32 /* a15 -> [(local8)] */   #  b65: f981
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   #  b67: c951
            s32i         a14, sp, 28 /* a14 -> [(local7)] */   #  b69: e971
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     #  b6b: 0941
            mov          a14, a3 /* arg1 */                    #  b6d: ed03
            sub          a0, a4, a3                            #  b6f: 3004c0
            blti         a0, 12, .Lbr051                       #  b72: a6a03e
            addi         a0, a14, 12 /* arg1+0xc */            #  b75: cb0e
            l16ui        a3, a3, 8 /* [arg1+0x8] */            #  b77: 321304
            movi         a12, .Ldata002                        #  b7a: c1e0ff
            slli         a3, a3, 10                            #  b7d: 603311
            s32i         a3, a12, 48 /* a3 -> [.Ldata015] */   #  b80: 39cc
            sub          a3, a4, a0                            #  b82: 0034c0
            blti         a3, 2, .Lbr052                        #  b85: a6233a
            movi         a13, 0 /* 0x00000000 */               #  b88: 0c0d
.Lbr047:    l8ui         a5, a0, 1                             #  b8a: 520001
            l8ui         a7, a0, 0                             #  b8d: 720000
            addi         a6, a5, 2                             #  b90: 2b65
            blt          a3, a6, .Lbr051                       #  b92: 67231e
            bnei         a7, 5, .Lbr048                        #  b95: 665701
            mov          a13, a0                               #  b98: dd00
.Lbr048:    add          a0, a5, a0                            #  b9a: 0a05
            addi         a0, a0, 2                             #  b9c: 2b00
            sub          a3, a4, a0                            #  b9e: 0034c0
            bgei         a3, 2, .Lbr047                        #  ba1: e623e5
            j            .Lbr053                               #  ba4: 460700
.Lbr049:    beqz         a15, .Lbr051                          #  ba7: 8c9f
            bbsi         a2, 4, .Lbr050                        #  ba9: 47e204
            l8ui         a2, a12, 59 /* [.Ldata023] */         #  bac: 220c3b
            beqz         a2, .Lbr051                           #  baf: 8c12
.Lbr050:    call0        .Lfunc010                             #  bb1: 45b3ff
.Lbr051:    l32i         a12, sp, 20 /* [(local5)] */          #  bb4: c851
            l32i         a13, sp, 24 /* [(local6)] */          #  bb6: d861
            l32i         a14, sp, 28 /* [(local7)] */          #  bb8: e871
            l32i         a15, sp, 32 /* [(local8)] */          #  bba: f881
            l32i         a0, sp, 16 /* [(local4)] */           #  bbc: 0841
            addi         sp, sp, 48 /* (top of frame) */       #  bbe: 12c130
            ret                                                #  bc1: 0df0
.Lbr052:    movi         a13, 0 /* 0x00000000 */               #  bc3: 0c0d
.Lbr053:    s32i         a2, sp, 12 /* arg0 -> [(local3)] */   #  bc5: 2931
            bnez         a13, .Lbr054                          #  bc7: ccad
            movi         a2, .Lstr026                          #  bc9: 21cdff
            call0        printf                                #  bcc: 01d8ffc0
                                                               #  bd0: 0000
            j            .Lbr051                               #  bd2: 86f7ff
.Lbr054:    movi         a2, .Lstr027                          #  bd5: 21cbff
            call0        printf                                #  bd8: 01d6ffc0
                                                               #  bdc: 0000
            movi         a2, .Label002                         #  bde: 21caff
            call0        sdk_os_timer_disarm                   #  be1: 01d4ffc0
                                                               #  be5: 0000
            l32i         a4, a12, 48 /* [.Ldata015] */         #  be7: 48cc
            l32i         a3, a14, 4 /* [arg1+0x4] */           #  be9: 381e
            l32i         a2, a14, 0 /* [arg1] */               #  beb: 280e
            l16ui        a6, a12, 232 /* [.Ldata038] */        #  bed: 621c74
            movi         a15, 0 /* 0x00000000 */               #  bf0: 0c0f
            addi         a6, a6, 1 /* [.Ldata038]+0x1 */       #  bf2: 1b66
            s16i         a15, a12, 230 /* 0x0000 -> [.Ldata037] */ #  bf4: f25c73
            s16i         a6, a12, 232 /* [.Ldata038]+0x1 -> [.Ldata038] */ #  bf7: 625c74
            l8ui         a14, a13, 3                           #  bfa: e20d03
            l8ui         a5, a13, 2                            #  bfd: 520d02
            s32i         a4, sp, 4 /* [.Ldata015] -> [(local1)] */ #  c00: 4911
            moveqz       a5, a14, a5                           #  c02: 505e83
            mull         a5, a5, a4                            #  c05: 405582
            s32i         a5, sp, 8 /* a5 -> [(local2)] */      #  c08: 5921
            mov          a5, a15 /* 0x00000000 */              #  c0a: 5d0f
            call0        __umoddi3                             #  c0c: 01cbffc0
                                                               #  c10: 0000
            l32i         a9, sp, 12 /* [(local3)] */           #  c12: 9831
            l8ui         a7, a12, 54 /* [.Ldata018] */         #  c14: 720c36
            l32i         a9, a9, 32 /* [[(local3)]+0x20] */    #  c17: 9889
            l32i         a10, sp, 4 /* [(local1)] */           #  c19: a811
            l32i         a9, a9, 4 /* [[[(local3)]+0x20]+0x4] */ #  c1b: 9819
            l32i         a8, sp, 8 /* [(local2)] */            #  c1d: 8821
            sub          a9, a9, a2                            #  c1f: 2099c0
            s32i         a9, a12, 28 /* a9 -> [.Ldata010] */   #  c22: 997c
            add          a8, a8, a9                            #  c24: 9a88
            s32i         a8, a12, 24 /* a8 -> [.Ldata009] */   #  c26: 896c
            add          a9, a9, a10                           #  c28: aa99
            s32i         a9, a12, 20 /* a9 -> [.Ldata008] */   #  c2a: 995c
            beqz         a7, .Lbr055                           #  c2c: 9c67
            l8ui         a3, a12, 62 /* [.Ldata026] */         #  c2e: 320c3e
            movi         a4, 0 /* 0x00000000 */                #  c31: 0c04
            beq          a14, a3, .Lbr056                      #  c33: 371e14
            mov          a4, a14                               #  c36: 4d0e
            movi         a2, .Lstr028                          #  c38: 21b5ff
            call0        printf                                #  c3b: 01c0ffc0
                                                               #  c3f: 0000
            movi         a4, 0 /* 0x00000000 */                #  c41: 0c04
            j            .Lbr056                               #  c43: 060100
.Lbr055:    movi         a4, 0 /* 0x00000000 */                #  c46: 0c04
            s8i          a14, a12, 62 /* a14 -> [.Ldata026] */ #  c48: e24c3e
.Lbr056:    movi         a3, 254 /* 0x000000fe */              #  c4b: 32a0fe
            l16ui        a0, a12, 72 /* [.Ldata029] */         #  c4e: 021c24
            movi         a10, 1 /* 0x00000001 */               #  c51: 0c1a
            mov          a2, a10 /* 0x00000001 */              #  c53: 2d0a
            s8i          a10, a12, 54 /* 0x01 -> [.Ldata018] */ #  c55: a24c36
            extui        a11, a0, 0, 14                        #  c58: 00b0d4
            l8ui         a5, a13, 4                            #  c5b: 520d04
            l8ui         a9, a13, 1                            #  c5e: 920d01
            and          a3, a5, a3                            #  c61: 303510
            add          a9, a9, a3                            #  c64: 3a99
            extui        a5, a5, 0, 1                          #  c66: 505004
            s8i          a5, a12, 46 /* a5 -> [.Ldata013] */   #  c69: 524c2e
            addi         a9, a9, -4                            #  c6c: 92c9fc
            extui        a9, a9, 0, 8                          #  c6f: 909074
            beqz         a11, .Lbr058                          #  c72: 9cdb
            extui        a8, a0, 3, 11                         #  c74: 0083a4
            bltu         a8, a3, .Lbr057                       #  c77: 373816
            bltu         a9, a8, .Lbr057                       #  c7a: 873913
            extui        a7, a0, 0, 3                          #  c7d: 007024
            sub          a6, a13, a3                           #  c80: 306dc0
            add          a6, a8, a6                            #  c83: 6a68
            l8ui         a6, a6, 5                             #  c85: 620605
            ssr          a7                                    #  c88: 000740
            sra          a6, a6                                #  c8b: 6060b1
            bbsi         a6, 0, .Lbr058                        #  c8e: 07e601
.Lbr057:    movi         a2, 0 /* 0x00000000 */                #  c91: 0c02
.Lbr058:    movi         a0, 1 /* 0x00000001 */                #  c93: 0c10
            extui        a3, a2, 0, 8                          #  c95: 203074
            s8i          a3, a12, 47 /* a3 -> [.Ldata014] */   #  c98: 324c2f
            bnez         a5, .Lbr059                           #  c9b: cc35
            movi         a7, 0 /* 0x00000000 */                #  c9d: 0c07
            moveqz       a0, a7, a3                            #  c9f: 300783
.Lbr059:    l8ui         a14, a13, 3                           #  ca2: e20d03
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  ca5: 0901
            movi         a5, .Ldata043                         #  ca7: 519aff
            extui        a15, a0, 0, 8                         #  caa: 00f074
            l8ui         a3, a5, 0 /* [.Ldata043] */           #  cad: 320500
            extui        a8, a2, 0, 8                          #  cb0: 208074
            addi         a3, a3, 1 /* [.Ldata043]+0x1 */       #  cb3: 1b33
            extui        a3, a3, 0, 8                          #  cb5: 303074
            beqz         a8, .Lbr060                           #  cb8: 8cd8
            l8ui         a0, a12, 53 /* [.Ldata017] */         #  cba: 020c35
            extui        a0, a0, 1, 3                          #  cbd: 000124
            blti         a0, 2, .Lbr060                        #  cc0: a62005
            bgei         a0, 6, .Lbr060                        #  cc3: e66002
            s8i          a10, a12, 244 /* 0x01 -> [.Ldata039] */ #  cc6: a24cf4
.Lbr060:    bgeui        a14, 4, .Lbr061                       #  cc9: f64e1a
            s32i         a3, sp, 36 /* a3 -> [(local9)] */     #  ccc: 3991
            beqz         a14, .Lbr061                          #  cce: 9c5e
            mov          a3, a14                               #  cd0: 3d0e
            movi         a2, 15 /* 0x0000000f */               #  cd2: 0cf2
            call0        __divsi3                              #  cd4: 019bffc0
                                                               #  cd8: 0000
            movi         a4, 0 /* 0x00000000 */                #  cda: 0c04
            l32i         a3, sp, 36 /* [(local9)] */           #  cdc: 3891
            movi         a5, .Ldata043                         #  cde: 518dff
            extui        a0, a2, 0, 8                          #  ce1: 200074
            j            .Lbr062                               #  ce4: 460000
.Lbr061:    movi         a0, 15 /* 0x0000000f */               #  ce7: 0cf0
.Lbr062:    bltu         a3, a0, .Lbr063                       #  ce9: 073325
            s8i          a4, a5, 0 /* 0x00 -> [.Ldata043] */   #  cec: 424500
            movi         a14, sdk_sleep_start_wait_time        #  cef: e18aff
            l8ui         a3, a12, 244 /* [.Ldata039] */        #  cf2: 320cf4
            movi         a0, .Ldata044                         #  cf5: 0189ff
            beqz         a3, .Lbr074                           #  cf8: 16830c
            l8ui         a2, a0, 0 /* [.Ldata044] */           #  cfb: 220000
            addi         a2, a2, 1 /* [.Ldata044]+0x1 */       #  cfe: 1b22
            extui        a2, a2, 0, 8                          #  d00: 202074
            bltui        a2, 2, .Lbr068                        #  d03: b62270
            s8i          a4, a0, 0 /* 0x00 -> [.Ldata044] */   #  d06: 424000
            movi         a3, 1300 /* 0x00000514 */             #  d09: 32a514
            s16i         a3, a14, 0 /* 0x0514 -> [sdk_sleep_start_wait_time] */ #  d0c: 325e00
            j            .Lbr069                               #  d0f: c61900
.Lbr063:    s8i          a3, a5, 0 /* a3 -> [.Ldata043] */     #  d12: 324500
.Lbr064:    l32i         a5, sp, 0 /* [(local0)] */            #  d15: 5801
            l8ui         a2, a12, 53 /* [.Ldata017] */         #  d17: 220c35
            extui        a5, a5, 0, 8                          #  d1a: 505074
            bnez         a5, .Lbr067                           #  d1d: 561505
            l8ui         a7, a13, 3                            #  d20: 720d03
            l8ui         a0, a12, 63 /* [.Ldata027] */         #  d23: 020c3f
            movi         a6, 8 /* 0x00000008 */                #  d26: 0c86
            mul16u       a7, a0, a7                            #  d28: 7070c1
            bge          a6, a7, .Lbr065                       #  d2b: 77a606
            movi         a15, 1 /* 0x00000001 */               #  d2e: 0c1f
            movi         a0, 0 /* 0x00000000 */                #  d30: 0c00
            s8i          a0, a12, 63 /* 0x00 -> [.Ldata027] */ #  d32: 024c3f
.Lbr065:    addi         a5, a0, 1                             #  d35: 1b50
.Lbr066:    s8i          a5, a12, 63 /* a5 -> [.Ldata027] */   #  d37: 524c3f
            extui        a0, a2, 1, 3                          #  d3a: 200124
            beqz         a0, .Lbr071                           #  d3d: 161005
            addi         a8, a0, -1                            #  d40: 0b80
            beqz         a8, .Lbr049                           #  d42: 1618e6
            beqi         a0, 2, .Lbr070                        #  d45: 26203a
            beqi         a0, 3, .Lbr071                        #  d48: 263046
            beqi         a0, 4, .Lbr072                        #  d4b: 264051
            beqi         a0, 5, .Lbr073                        #  d4e: 265057
            addi         a9, a0, -6                            #  d51: 92c0fa
            beqz         a9, .Lbr051                           #  d54: 16c9e5
            addi         a10, a0, -7                           #  d57: a2c0f9
            bnez         a10, .Lbr051                          #  d5a: 566ae5
            bnez         a15, .Lbr051                          #  d5d: 563fe5
            call0        sdk_pm_scan_unlocked                  #  d60: 0179ffc0
                                                               #  d64: 0000
            beqz         a2, .Lbr051                           #  d66: 16a2e4
            call0        sdk_pp_try_enable_idle_timer          #  d69: 0177ffc0
                                                               #  d6d: 0000
            j            .Lbr051                               #  d6f: 4690ff
.Lbr067:    mov          a5, a4 /* 0x00000000 */               #  d72: 5d04
            j            .Lbr066                               #  d74: c6efff
.Lbr068:    s8i          a2, a0, 0 /* a2 -> [.Ldata044] */     #  d77: 224000
.Lbr069:    s8i          a4, a12, 244 /* 0x00 -> [.Ldata039] */ #  d7a: 424cf4
            s8i          a4, a12, 245 /* 0x00 -> [.Ldata040] */ #  d7d: 424cf5
            j            .Lbr064                               #  d80: 46e4ff
.Lbr070:    beqz         a15, .Lbr051                          #  d83: 16dfe2
            extui        a11, a2, 4, 1                         #  d86: 20b404
            beqz         a11, .Lbr051                          #  d89: 167be2
            call0        .Lfunc010                             #  d8c: 8595ff
            j            .Lbr051                               #  d8f: 4688ff
.Lbr071:    beqz         a15, .Lbr051                          #  d92: 16efe1
            movi         a2, 1 /* 0x00000001 */                #  d95: 0c12
            call0        sdk_pm_post                           #  d97: 016dffc0
                                                               #  d9b: 0000
            j            .Lbr051                               #  d9d: c684ff
.Lbr072:    beqz         a15, .Lbr075                          #  da0: 167f04
            call0        .Lfunc010                             #  da3: 4594ff
            j            .Lbr051                               #  da6: 8682ff
.Lbr073:    beqz         a15, .Lbr076                          #  da9: 167f04
            movi         a2, .Label003                         #  dac: 215dff
            call0        sdk_os_timer_disarm                   #  daf: 0168ffc0
                                                               #  db3: 0000
            l8ui         a13, a12, 53 /* [.Ldata017] */        #  db5: d20c35
            extui        a13, a13, 4, 1                        #  db8: d0d404
            beqz         a13, .Lbr051                          #  dbb: 165ddf
            call0        .Lfunc010                             #  dbe: 8592ff
            j            .Lbr051                               #  dc1: c67bff
.Lbr074:    l8ui         a3, a12, 245 /* [.Ldata040] */        #  dc4: 320cf5
            s8i          a4, a0, 0 /* 0x00 -> [.Ldata044] */   #  dc7: 424000
            beqz         a3, .Lbr079                           #  dca: 163305
            l8ui         a2, a0, 1 /* [.Ldata045] */           #  dcd: 220001
            addi         a2, a2, 1 /* [.Ldata045]+0x1 */       #  dd0: 1b22
            extui        a2, a2, 0, 8                          #  dd2: 202074
            beqz         a2, .Lbr078                           #  dd5: 162204
            movi         a3, 0 /* 0x00000000 */                #  dd8: 0c03
            s8i          a3, a0, 1 /* 0x00 -> [.Ldata045] */   #  dda: 324001
            call0        sdk_pm_get_idle_wait_time             #  ddd: 015dffc0
                                                               #  de1: 0000
            movi         a4, 0 /* 0x00000000 */                #  de3: 0c04
            s16i         a2, a14, 0 /* a2 -> [sdk_sleep_start_wait_time] */ #  de5: 225e00
            j            .Lbr069                               #  de8: 86e3ff
.Lbr075:    bbsi         a2, 4, .Lbr077                        #  deb: 47e21d
            call0        .Lfunc009                             #  dee: c587ff
            j            .Lbr051                               #  df1: c66fff
.Lbr076:    l8ui         a6, a12, 55 /* [.Ldata019] */         #  df4: 620c37
            addi         a6, a6, -8 /* [.Ldata019]-0x8 */      #  df7: 62c6f8
            bnez         a6, .Lbr051                           #  dfa: 5666db
            movi         a2, .Lstr030                          #  dfd: 2149ff
            call0        printf                                #  e00: 0156ffc0
                                                               #  e04: 0000
            call0        .Lfunc007                             #  e06: 8568ff
            j            .Lbr051                               #  e09: c669ff
.Lbr077:    movi         a2, .Lstr029                          #  e0c: 2147ff
            call0        printf                                #  e0f: 0153ffc0
                                                               #  e13: 0000
            call0        .Lfunc007                             #  e15: 8567ff
            j            .Lbr051                               #  e18: 0666ff
.Lbr078:    s8i          a2, a0, 1 /* a2 -> [.Ldata045] */     #  e1b: 224001
            j            .Lbr069                               #  e1e: 06d6ff
.Lbr079:    s8i          a4, a0, 1 /* 0x00 -> [.Ldata045] */   #  e21: 424001
            j            .Lbr069                               #  e24: 86d4ff

            .literal_position                                  #  e28: 00000000
                                                               #  e2c: ec010000
                                                               #  e30: 00000000

# Function @ .irom0.text+0xe34
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc014:  addi         sp, sp, -16 /* (local0) */            #  e34: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  e37: 0901
            movi         a0, .Ldata002                         #  e39: 01fbff
            l8ui         a0, a0, 53 /* [.Ldata017] */          #  e3c: 020035
            extui        a3, a0, 1, 3                          #  e3f: 003124
            bnei         a3, 6, .Lbr080                        #  e42: 666308
            bbci         a0, 5, .Lbr082                        #  e45: 576015
            call0        .Lfunc011                             #  e48: c590ff
            j            .Lbr081                               #  e4b: 060200
.Lbr080:    movi         a2, .Lstr031                          #  e4e: 21f7ff
            call0        printf                                #  e51: 01f7ffc0
                                                               #  e55: 0000
.Lbr081:    l32i         a0, sp, 0 /* [(local0)] */            #  e57: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  e59: 12c110
            ret                                                #  e5c: 0df0
.Lbr082:    call0        .Lfunc012                             #  e5e: 4594ff
            j            .Lbr081                               #  e61: 86fcff

            .literal_position                                  #  e64: 00000000
                                                               #  e68: 58000000
                                                               #  e6c: 60000000
                                                               #  e70: 04020000
                                                               #  e74: 58000000
                                                               #  e78: 60000000
                                                               #  e7c: f4010000
                                                               #  e80: 00000000
                                                               #  e84: 00000000
                                                               #  e88: 00000000
                                                               #  e8c: 00000000

# Function @ .irom0.text+0xe90
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc015:  addi         sp, sp, -16 /* (local0) */            #  e90: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  e93: 0901
            movi         a0, .Ldata002                         #  e95: 01f3ff
            l8ui         a0, a0, 53 /* [.Ldata017] */          #  e98: 020035
            extui        a3, a0, 1, 3                          #  e9b: 003124
            bnei         a3, 1, .Lbr084                        #  e9e: 661314
            bbsi         a0, 5, .Lbr086                        #  ea1: 57e02c
            movi         a2, .Lstr006                          #  ea4: 21f1ff
            movi         a3, .Lstr007                          #  ea7: 31f1ff
            movi         a4, 1410 /* 0x00000582 */             #  eaa: 42a582
            call0        printf                                #  ead: 01f4ffc0
                                                               #  eb1: 0000
.Lbr083:    j            .Lbr083 /* (halt) */                  #  eb3: 06ffff
.Lbr084:    movi         a2, .Lstr033                          #  eb6: 21eeff
            call0        printf                                #  eb9: 01f2ffc0
                                                               #  ebd: 0000
            movi         a2, .Lstr006                          #  ebf: 21edff
            movi         a3, .Lstr007                          #  ec2: 31edff
            movi         a4, 1426 /* 0x00000592 */             #  ec5: 42a592
            call0        printf                                #  ec8: 01f0ffc0
                                                               #  ecc: 0000
.Lbr085:    j            .Lbr085 /* (halt) */                  #  ece: 06ffff
.Lbr086:    call0        .Lfunc004                             #  ed1: c533ff
            beqz         a2, .Lbr087                           #  ed4: 8cd2
            movi         a2, .Lstr032                          #  ed6: 21e9ff
            call0        printf                                #  ed9: 01ecffc0
                                                               #  edd: 0000
            call0        .Lfunc007                             #  edf: 055bff
            j            .Lbr088                               #  ee2: 860000
.Lbr087:    call0        .Lfunc008                             #  ee5: c563ff
.Lbr088:    l32i         a0, sp, 0 /* [(local0)] */            #  ee8: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  eea: 12c110
            ret                                                #  eed: 0df0

            .literal_position                                  #  ef0: 8c000000
                                                               #  ef4: 00000000
                                                               #  ef8: 0c020000
                                                               #  efc: 47010000
                                                               #  f00: 20020000
                                                               #  f04: 0002f23f
                                                               #  f08: 47010000
                                                               #  f0c: af360000
                                                               #  f10: 00000000
                                                               #  f14: 00000000
                                                               #  f18: 00000000
                                                               #  f1c: 00000000
                                                               #  f20: 00000000

# Function @ .irom0.text+0xf24
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
.Lfunc016:  mov          a3, a2 /* arg0 */                     #  f24: 3d02
            addi         sp, sp, -16 /* (local0) */            #  f26: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  f29: c921
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  f2b: d931
            movi         a2, .Label004                         #  f2d: 21f0ff
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  f30: 0911
            s32i         a3, sp, 0 /* arg0 -> [(local0)] */    #  f32: 3901
            call0        sdk_os_timer_disarm                   #  f34: 01f7ffc0
                                                               #  f38: 0000
            movi         a13, .Ldata002                        #  f3a: d1eeff
            l8ui         a0, a13, 53 /* [.Ldata017] */         #  f3d: 020d35
            extui        a0, a0, 1, 3                          #  f40: 000124
            beqz         a0, .Lbr091                           #  f43: 162006
            movi         a2, .Lstr034                          #  f46: 21ecff
            movi         a12, 0 /* 0x00000000 */               #  f49: 0c0c
            s8i          a12, a13, 58 /* 0x00 -> [.Ldata022] */ #  f4b: c24d3a
            s8i          a12, a13, 59 /* 0x00 -> [.Ldata023] */ #  f4e: c24d3b
            call0        printf                                #  f51: 01f0ffc0
                                                               #  f55: 0000
            l32i         a3, sp, 0 /* [(local0)] */            #  f57: 3801
            movi         a0, .Ldata046                         #  f59: 01e8ff
            l32i         a3, a3, 32 /* [[(local0)]+0x20] */    #  f5c: 3883
            movi         a9, 239 /* 0x000000ef */              #  f5e: 92a0ef
            l8ui         a3, a3, 15 /* [[[(local0)]+0x20]+0xf] */ #  f61: 32030f
            l8ui         a8, a13, 53 /* [.Ldata017] */         #  f64: 820d35
            beqi         a3, 1, .Lbr092                        #  f67: 261349
            movi         a2, .Lstr035                          #  f6a: 21e5ff
            movi         a4, 0x3ff20200                        #  f6d: 41e5ff
            memw                                               #  f70: c02000
            l32i         a4, a4, 0x218 /* [0x3ff20418] */      #  f73: 422486
            extui        a4, a4, 12, 16                        #  f76: 404cf4
            slli         a4, a4, 2                             #  f79: e04411
            call0        printf                                #  f7c: 01e7ffc0
                                                               #  f80: 0000
            call0        sdk_chm_get_current_channel           #  f82: 01e6ffc0
                                                               #  f86: 0000
            l8ui         a5, a13, 61 /* [.Ldata025] */         #  f88: 520d3d
            l8ui         a0, a13, 53 /* [.Ldata017] */         #  f8b: 020d35
            bnei         a5, 2, .Lbr089                        #  f8e: 662508
            s8i          a12, a13, 61 /* 0x00 -> [.Ldata025] */ #  f91: c24d3d
            call0        .Lfunc010                             #  f94: 0575ff
            j            .Lbr091                               #  f97: 860300
.Lbr089:    movi         a2, 1 /* 0x00000001 */                #  f9a: 0c12
            bbci         a0, 5, .Lbr090                        #  f9c: 576006
            srli         a6, a0, 7                             #  f9f: 006741
            beqz         a6, .Lbr094                           #  fa2: bc46
            mov          a12, a2 /* 0x00000001 */              #  fa4: cd02
.Lbr090:    s8i          a12, a13, 61 /* a12 -> [.Ldata025] */ #  fa6: c24d3d
.Lbr091:    l32i         a12, sp, 8 /* [(local2)] */           #  fa9: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  fab: d831
            l32i         a0, sp, 4 /* [(local1)] */            #  fad: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  faf: 12c110
            ret                                                #  fb2: 0df0
.Lbr092:    s8i          a12, a0, 0 /* 0x00 -> [.Ldata046] */  #  fb4: c24000
            and          a8, a8, a9                            #  fb7: 908810
            l8ui         a7, a13, 61 /* [.Ldata025] */         #  fba: 720d3d
            movi         a9, 16 /* 0x00000010 */               #  fbd: 1c09
            or           a8, a8, a9                            #  fbf: 908820
            s8i          a8, a13, 53 /* a8 -> [.Ldata017] */   #  fc2: 824d35
            bnei         a7, 2, .Lbr093                        #  fc5: 662708
            s8i          a12, a13, 61 /* 0x00 -> [.Ldata025] */ #  fc8: c24d3d
            call0        .Lfunc010                             #  fcb: c571ff
            j            .Lbr091                               #  fce: c6f5ff
.Lbr093:    s8i          a12, a13, 61 /* 0x00 -> [.Ldata025] */ #  fd1: c24d3d
            call0        .Lfunc015                             #  fd4: 85ebff
            j            .Lbr091                               #  fd7: 86f3ff
.Lbr094:    call0        .Lfunc004                             #  fda: 4523ff
            movi         a10, 0x000036af                       #  fdd: a1cbff
            movi         a0, .Ldata046                         #  fe0: 01caff
            bltu         a10, a2, .Lbr095                      #  fe3: 273a08
            s8i          a12, a13, 61 /* 0x00 -> [.Ldata025] */ #  fe6: c24d3d
            call0        .Lfunc008                             #  fe9: 8553ff
            j            .Lbr091                               #  fec: 46eeff
.Lbr095:    l8ui         a11, a0, 0 /* [.Ldata046] */          #  fef: b20000
            movi         a3, 14 /* 0x0000000e */               #  ff2: 0ce3
            addi         a2, a11, 1 /* [.Ldata046]+0x1 */      #  ff4: 1b2b
            bltu         a3, a11, .Lbr096                      #  ff6: b7330d
            s8i          a2, a0, 0 /* [.Ldata046]+0x1 -> [.Ldata046] */ #  ff9: 224000
            movi         a2, 1 /* 0x00000001 */                #  ffc: 0c12
            call0        sdk_pm_send_nullfunc                  #  ffe: 01c8ffc0
                                                               # 1002: 0000
            j            .Lbr091                               # 1004: 46e8ff
.Lbr096:    movi         a2, 1 /* 0x00000001 */                # 1007: 0c12
            s8i          a3, a0, 0 /* 0x0e -> [.Ldata046] */   # 1009: 324000
            call0        sdk_pm_send_nullfunc                  # 100c: 050000
            j            .Lbr091                               # 100f: 86e5ff

            .literal_position                                  # 1014: 8c000000
                                                               # 1018: 00000000
                                                               # 101c: 30020000
                                                               # 1020: 48010000
                                                               # 1024: 58000000
                                                               # 1028: 60000000
                                                               # 102c: 58000000
                                                               # 1030: 60000000
                                                               # 1034: 41000000
                                                               # 1038: 48010000
                                                               # 103c: 00000000
                                                               # 1040: 00000000
                                                               # 1044: 00000000
                                                               # 1048: 00000000
                                                               # 104c: 00000000
                                                               # 1050: 00000000
                                                               # 1054: 00000000
                                                               # 1058: 00000000

# Function @ .irom0.text+0x105c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
.Lfunc017:  mov          a4, a2 /* arg0 */                     # 105c: 4d02
            addi         sp, sp, -16 /* (local0) */            # 105e: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 1061: c921
            movi         a2, .Label004                         # 1063: 21ecff
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 1066: 0911
            s32i         a4, sp, 0 /* arg0 -> [(local0)] */    # 1068: 4901
            call0        sdk_os_timer_disarm                   # 106a: 01f4ffc0
                                                               # 106e: 0000
            movi         a12, .Ldata002                        # 1070: c1eaff
            l8ui         a0, a12, 53 /* [.Ldata017] */         # 1073: 020c35
            extui        a0, a0, 1, 3                          # 1076: 000124
            beqz         a0, .Lbr099                           # 1079: 162005
            movi         a2, 0 /* 0x00000000 */                # 107c: 0c02
            s8i          a2, a12, 58 /* 0x00 -> [.Ldata022] */ # 107e: 224c3a
            s8i          a2, a12, 60 /* 0x00 -> [.Ldata024] */ # 1081: 224c3c
            movi         a2, .Lstr036                          # 1084: 21e6ff
            call0        printf                                # 1087: 01eeffc0
                                                               # 108b: 0000
            l32i         a3, sp, 0 /* [(local0)] */            # 108d: 3801
            movi         a0, 0 /* 0x00000000 */                # 108f: 0c00
            l32i         a3, a3, 32 /* [[(local0)]+0x20] */    # 1091: 3883
            movi         a2, .Ldata047                         # 1093: 21e3ff
            l8ui         a3, a3, 15 /* [[[(local0)]+0x20]+0xf] */ # 1096: 32030f
            l8ui         a8, a12, 61 /* [.Ldata025] */         # 1099: 820c3d
            beqi         a3, 1, .Lbr100                        # 109c: 261338
            call0        sdk_chm_get_current_channel           # 109f: 01e9ffc0
                                                               # 10a3: 0000
            l8ui         a4, a12, 61 /* [.Ldata025] */         # 10a5: 420c3d
            l8ui         a6, a12, 53 /* [.Ldata017] */         # 10a8: 620c35
            bnei         a4, 1, .Lbr098                        # 10ab: 661416
            movi         a2, .Lstr006                          # 10ae: 21ddff
            movi         a3, .Lstr007                          # 10b1: 31ddff
            movi         a4, 1530 /* 0x000005fa */             # 10b4: 42a5fa
            movi         a5, 0 /* 0x00000000 */                # 10b7: 0c05
            s8i          a5, a12, 61 /* 0x00 -> [.Ldata025] */ # 10b9: 524c3d
            call0        printf                                # 10bc: 01e3ffc0
                                                               # 10c0: 0000
.Lbr097:    j            .Lbr097 /* (halt) */                  # 10c2: 06ffff
.Lbr098:    srli         a6, a6, 7                             # 10c5: 606741
            beqz         a6, .Lbr103                           # 10c8: bcf6
            movi         a7, 2 /* 0x00000002 */                # 10ca: 0c27
            s8i          a7, a12, 61 /* 0x02 -> [.Ldata025] */ # 10cc: 724c3d
.Lbr099:    l32i         a12, sp, 8 /* [(local2)] */           # 10cf: c821
            l32i         a0, sp, 4 /* [(local1)] */            # 10d1: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 10d3: 12c110
            ret                                                # 10d6: 0df0
.Lbr100:    s8i          a0, a2, 0 /* 0x00 -> [.Ldata047] */   # 10d8: 024200
            l8ui         a2, a12, 53 /* [.Ldata017] */         # 10db: 220c35
            movi         a3, 239 /* 0x000000ef */              # 10de: 32a0ef
            and          a2, a2, a3                            # 10e1: 302210
            s8i          a2, a12, 53 /* a2 -> [.Ldata017] */   # 10e4: 224c35
            bnei         a8, 1, .Lbr102                        # 10e7: 661817
            bbci         a2, 5, .Lbr102                        # 10ea: 576214
            movi         a2, .Lstr006                          # 10ed: 21cfff
            movi         a3, .Lstr007                          # 10f0: 31d0ff
            movi         a4, 1572 /* 0x00000624 */             # 10f3: 42a624
            s8i          a0, a12, 61 /* 0x00 -> [.Ldata025] */ # 10f6: 024c3d
            call0        printf                                # 10f9: 01d4ffc0
                                                               # 10fd: 0000
.Lbr101:    j            .Lbr101 /* (halt) */                  # 10ff: 06ffff
.Lbr102:    s8i          a0, a12, 61 /* 0x00 -> [.Ldata025] */ # 1102: 024c3d
            call0        .Lfunc014                             # 1105: c5d2ff
            j            .Lbr099                               # 1108: c6f0ff
.Lbr103:    l8ui         a2, a12, 64 /* [.Ldata028] */         # 110b: 220c40
            movi         a3, .Label001                         # 110e: 31c9ff
            call0        sdk_rc_get_trc                        # 1111: 01cfffc0
                                                               # 1115: 0000
            movi         a0, .Ldata047                         # 1117: 01c8ff
            bnez         a2, .Lbr104                           # 111a: cc92
            movi         a4, 0 /* 0x00000000 */                # 111c: 0c04
            s8i          a4, a12, 61 /* 0x00 -> [.Ldata025] */ # 111e: 424c3d
            call0        .Lfunc014                             # 1121: 05d1ff
            j            .Lbr099                               # 1124: c6e9ff
.Lbr104:    l8ui         a6, a0, 0 /* [.Ldata047] */           # 1127: 620000
            movi         a5, 14 /* 0x0000000e */               # 112a: 0ce5
            addi         a2, a6, 1 /* [.Ldata047]+0x1 */       # 112c: 1b26
            bltu         a5, a6, .Lbr105                       # 112e: 67350d
            s8i          a2, a0, 0 /* [.Ldata047]+0x1 -> [.Ldata047] */ # 1131: 224000
            movi         a2, 0 /* 0x00000000 */                # 1134: 0c02
            call0        sdk_pm_send_nullfunc                  # 1136: 01c7ffc0
                                                               # 113a: 0000
            j            .Lbr099                               # 113c: c6e3ff
.Lbr105:    movi         a2, 0 /* 0x00000000 */                # 113f: 0c02
            s8i          a5, a0, 0 /* 0x0e -> [.Ldata047] */   # 1141: 524000
            call0        sdk_pm_send_nullfunc                  # 1144: 01c5ffc0
                                                               # 1148: 0000
            j            .Lbr099                               # 114a: 46e0ff

            .literal_position                                  # 1150: 00000000
                                                               # 1154: 44020000
                                                               # 1158: 781e0000
                                                               # 115c: 685b0000
                                                               # 1160: 37180000
                                                               # 1164: 97210000
                                                               # 1168: 00000000
                                                               # 116c: 00000000

# Function @ .irom0.text+0x1170
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
.Lfunc018:  mov          a3, a2 /* arg0 */                     # 1170: 3d02
            addi         sp, sp, -16 /* (local0) */            # 1172: 12c1f0
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   # 1175: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 1177: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 1179: 0911
            movi         a12, .Ldata002                        # 117b: c1f5ff
            movi         a2, .Lstr037                          # 117e: 21f5ff
            l16ui        a0, a12, 230 /* [.Ldata037] */        # 1181: 021c73
            s32i         a3, sp, 0 /* arg0 -> [(local0)] */    # 1184: 3901
            addi         a0, a0, 1 /* [.Ldata037]+0x1 */       # 1186: 1b00
            s16i         a0, a12, 230 /* [.Ldata037]+0x1 -> [.Ldata037] */ # 1188: 025c73
            call0        printf                                # 118b: 01f7ffc0
                                                               # 118f: 0000
            l16ui        a13, a12, 230 /* [.Ldata037] */       # 1191: d21c73
            beqz         a13, .Lbr109                          # 1194: 16bd05
            l16ui        a2, a12, 232 /* [.Ldata038] */        # 1197: 221c74
            mov          a3, a13 /* [.Ldata037] */             # 119a: 3d0d
            call0        __udivsi3                             # 119c: 01f4ffc0
                                                               # 11a0: 0000
            movi         a8, 29 /* 0x0000001d */               # 11a2: 1cd8
            extui        a3, a2, 0, 16                         # 11a4: 2030f4
            movi         a2, 10 /* 0x0000000a */               # 11a7: 0ca2
            bltu         a2, a3, .Lbr107                       # 11a9: 373221
            l32i         a0, a12, 76 /* [.Ldata030] */         # 11ac: 022c13
            movi         a4, 0x00001e78                        # 11af: 41eaff
            movi         a6, 0x00005b68                        # 11b2: 61eaff
            bltu         a4, a0, .Lbr106                       # 11b5: 073407
            movi         a5, 200 /* 0x000000c8 */              # 11b8: 52a0c8
            add          a5, a0, a5 /* [.Ldata030]+0xc8 */     # 11bb: 5a50
            s32i         a5, a12, 76 /* [.Ldata030]+0xc8 -> [.Ldata030] */ # 11bd: 526c13
.Lbr106:    l32i         a0, a12, 80 /* [.Ldata031] */         # 11c0: 022c14
            movi         a7, 600 /* 0x00000258 */              # 11c3: 72a258
            bltu         a6, a0, .Lbr107                       # 11c6: 073604
            add          a7, a0, a7 /* [.Ldata031]+0x258 */    # 11c9: 7a70
            s32i         a7, a12, 80 /* [.Ldata031]+0x258 -> [.Ldata031] */ # 11cb: 726c14
.Lbr107:    bgeu         a8, a3, .Lbr109                       # 11ce: 37b821
            l32i         a0, a12, 76 /* [.Ldata030] */         # 11d1: 022c13
            movi         a9, 0x00001837                        # 11d4: 91e3ff
            movi         a11, 0x00002197                       # 11d7: b1e3ff
            bgeu         a9, a0, .Lbr108                       # 11da: 07b907
            movi         a10, -200 /* 0xffffff38 */            # 11dd: a2af38
            add          a10, a0, a10 /* [.Ldata030]-0xc8 */   # 11e0: aaa0
            s32i         a10, a12, 76 /* [.Ldata030]-0xc8 -> [.Ldata030] */ # 11e2: a26c13
.Lbr108:    l32i         a0, a12, 80 /* [.Ldata031] */         # 11e5: 022c14
            movi         a2, -600 /* 0xfffffda8 */             # 11e8: 22ada8
            bgeu         a11, a0, .Lbr109                      # 11eb: 07bb04
            add          a2, a0, a2 /* [.Ldata031]-0x258 */    # 11ee: 2a20
            s32i         a2, a12, 80 /* [.Ldata031]-0x258 -> [.Ldata031] */ # 11f0: 226c14
.Lbr109:    movi         a3, 0 /* 0x00000000 */                # 11f3: 0c03
            s16i         a3, a12, 232 /* 0x0000 -> [.Ldata038] */ # 11f5: 325c74
            bltui        a13, 2, .Lbr110                       # 11f8: b62d09
            l32i         a4, sp, 0 /* [(local0)] */            # 11fb: 4801
            beqz         a4, .Lbr111                           # 11fd: 8c74
            call0        .Lfunc013                             # 11ff: 855fff
            j            .Lbr111                               # 1202: 860000
.Lbr110:    call0        .Lfunc008                             # 1205: c531ff
.Lbr111:    l32i         a12, sp, 8 /* [(local2)] */           # 1208: c821
            l32i         a13, sp, 12 /* [(local3)] */          # 120a: d831
            l32i         a0, sp, 4 /* [(local1)] */            # 120c: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 120e: 12c110
            ret                                                # 1211: 0df0

            .literal_position                                  # 1214: 50020000
                                                               # 1218: 00000000
                                                               # 121c: 58000000
                                                               # 1220: 60000000
                                                               # 1224: 00000000
                                                               # 1228: 00000000
                                                               # 122c: 00000000
                                                               # 1230: 00000000

# Function @ .irom0.text+0x1234
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc019:  addi         sp, sp, -16 /* (local0) */            # 1234: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1237: 0901
            call0        vTaskSuspendAll                       # 1239: 01faffc0
                                                               # 123d: 0000
            movi         a2, .Lstr038                          # 123f: 21f5ff
            call0        printf                                # 1242: 01f9ffc0
                                                               # 1246: 0000
            movi         a3, .Ldata002                         # 1248: 31f4ff
            l8ui         a0, a3, 53 /* [.Ldata017] */          # 124b: 020335
            l8ui         a2, a3, 55 /* [.Ldata019] */          # 124e: 220337
            extui        a0, a0, 1, 3                          # 1251: 000124
            bnei         a0, 5, .Lbr112                        # 1254: 665002
            beqi         a2, 8, .Lbr113                        # 1257: 268202
.Lbr112:    bnei         a0, 4, .Lbr117                        # 125a: 664022
.Lbr113:    bnei         a0, 5, .Lbr114                        # 125d: 665005
            l8ui         a4, a3, 55 /* [.Ldata019] */          # 1260: 420337
            beqi         a4, 8, .Lbr116                        # 1263: 268414
.Lbr114:    beqi         a0, 4, .Lbr116                        # 1266: 264011
            movi         a2, .Lstr006                          # 1269: 21ecff
            movi         a3, .Lstr007                          # 126c: 31edff
            movi         a4, 1640 /* 0x00000668 */             # 126f: 42a668
            call0        printf                                # 1272: 01eeffc0
                                                               # 1276: 0000
.Lbr115:    j            .Lbr115 /* (halt) */                  # 1278: 06ffff
.Lbr116:    movi         a2, 1 /* 0x00000001 */                # 127b: 0c12
            call0        .Lfunc018                             # 127d: 05efff
.Lbr117:    call0        xTaskResumeAll                        # 1280: 01ecffc0
                                                               # 1284: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 1286: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1288: 12c110
            ret                                                # 128b: 0df0

            .literal_position                                  # 1290: 00000000
                                                               # 1294: 00000000
                                                               # 1298: 00000000
                                                               # 129c: 00000000
                                                               # 12a0: 58000000
                                                               # 12a4: 60000000
                                                               # 12a8: 58000000
                                                               # 12ac: 60000000
                                                               # 12b0: 00000000
                                                               # 12b4: 00000000

# Function @ .irom0.text+0x12b8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc020:  movi         a4, 191 /* 0x000000bf */              # 12b8: 42a0bf
            movi         a2, .Ldata002                         # 12bb: 21f5ff
            addi         sp, sp, -16 /* (local0) */            # 12be: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 12c1: 0901
            l8ui         a3, a2, 53 /* [.Ldata017] */          # 12c3: 320235
            movi         a0, .Ldata001                         # 12c6: 01f3ff
            and          a3, a3, a4                            # 12c9: 403310
            l8ui         a0, a0, 0 /* [.Ldata001] */           # 12cc: 020000
            s8i          a3, a2, 53 /* a3 -> [.Ldata017] */    # 12cf: 324235
            bnei         a0, 2, .Lbr118                        # 12d2: 66200b
            call0        .Lfunc010                             # 12d5: 0541ff
            movi         a0, .Ldata001                         # 12d8: 01f1ff
            l8ui         a0, a0, 0 /* [.Ldata001] */           # 12db: 020000
            movi         a2, .Ldata002                         # 12de: 21eeff
.Lbr118:    bnei         a0, 1, .Lbr121                        # 12e1: 66102a
            l8ui         a0, a2, 53 /* [.Ldata017] */          # 12e4: 020235
            extui        a3, a0, 1, 3                          # 12e7: 003124
            beqi         a3, 5, .Lbr120                        # 12ea: 265311
            movi         a2, .Lstr006                          # 12ed: 21ecff
            movi         a3, .Lstr007                          # 12f0: 31edff
            movi         a4, 1656 /* 0x00000678 */             # 12f3: 42a678
            call0        printf                                # 12f6: 01eeffc0
                                                               # 12fa: 0000
.Lbr119:    j            .Lbr119 /* (halt) */                  # 12fc: 06ffff
.Lbr120:    bbci         a0, 4, .Lbr121                        # 12ff: 47600c
            l8ui         a4, a2, 58 /* [.Ldata022] */          # 1302: 42023a
            bnez         a4, .Lbr122                           # 1305: ccd4
            call0        .Lfunc004                             # 1307: 85f0fe
            beqz         a2, .Lbr124                           # 130a: 9ca2
            call0        .Lfunc007                             # 130c: 0518ff
.Lbr121:    l32i         a0, sp, 0 /* [(local0)] */            # 130f: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1311: 12c110
            ret                                                # 1314: 0df0
.Lbr122:    movi         a2, .Lstr006                          # 1316: 21e4ff
            movi         a3, .Lstr007                          # 1319: 31e4ff
            movi         a4, 1679 /* 0x0000068f */             # 131c: 42a68f
            call0        printf                                # 131f: 01e5ffc0
                                                               # 1323: 0000
.Lbr123:    j            .Lbr123 /* (halt) */                  # 1325: 06ffff
.Lbr124:    call0        .Lfunc008                             # 1328: 851fff
            j            .Lbr121                               # 132b: 06f8ff

            .literal_position                                  # 1330: 60020000
                                                               # 1334: 8c000000
                                                               # 1338: 00000000
                                                               # 133c: 00000000
                                                               # 1340: 00000000

# Function @ .irom0.text+0x1344
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
.Lfunc021:  movi         a2, .Lstr039                          # 1344: 21fbff
            addi         sp, sp, -16 /* (local0) */            # 1347: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 134a: 0911
            call0        printf                                # 134c: 01fbffc0
                                                               # 1350: 0000
            movi         a2, .Label004                         # 1352: 21f8ff
            s32i         a2, sp, 0 /* .Label004 -> [(local0)] */ # 1355: 2901
            call0        sdk_os_timer_disarm                   # 1357: 01f9ffc0
                                                               # 135b: 0000
            l32i         a2, sp, 0 /* [(local0)] */            # 135d: 2801
            movi         a3, 55 /* 0x00000037 */               # 135f: 3c73
            movi         a4, 0 /* 0x00000000 */                # 1361: 0c04
            call0        sdk_os_timer_arm                      # 1363: 01f7ffc0
                                                               # 1367: 0000
            l32i         a0, sp, 4 /* [(local1)] */            # 1369: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 136b: 12c110
            ret                                                # 136e: 0df0

            .literal_position                                  # 1370: 00000000

# Function @ .irom0.text+0x1374
            .global      sdk_pm_enable_gpio_wakeup
            .type        sdk_pm_enable_gpio_wakeup, @function
sdk_pm_enable_gpio_wakeup:
            movi         a3, .Ldata002                         # 1374: 31ffff
            l8ui         a2, a3, 52 /* [.Ldata016] */          # 1377: 220334
            movi         a4, 223 /* 0x000000df */              # 137a: 42a0df
            and          a2, a2, a4                            # 137d: 402210
            movi         a4, 32 /* 0x00000020 */               # 1380: 2c04
            or           a2, a2, a4                            # 1382: 402220
            s8i          a2, a3, 52 /* a2 -> [.Ldata016] */    # 1385: 224334
            ret                                                # 1388: 0df0

            .literal_position                                  # 138c: 00000000
                                                               # 1390: c4000000
                                                               # 1394: 58040000
                                                               # 1398: 00000000
                                                               # 139c: c4090000
                                                               # 13a0: 70170000
                                                               # 13a4: 50460000
                                                               # 13a8: 240f0000
                                                               # 13ac: 5c100000
                                                               # 13b0: 54000000
                                                               # 13b4: 34120000
                                                               # 13b8: 70000000
                                                               # 13bc: b8120000
                                                               # 13c0: 8c000000
                                                               # 13c4: 44130000
                                                               # 13c8: a8000000
                                                               # 13cc: 00000000
                                                               # 13d0: 881a0000
                                                               # 13d4: 74020000
                                                               # 13d8: 7c020000
                                                               # 13dc: 00000000
                                                               # 13e0: 00000000
                                                               # 13e4: 00000000
                                                               # 13e8: 00000000
                                                               # 13ec: 00000000
                                                               # 13f0: 00000000
                                                               # 13f4: 00000000
                                                               # 13f8: 00000000
                                                               # 13fc: 00000000
                                                               # 1400: 00000000

# Function @ .irom0.text+0x1404
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word[3]   @ -0x1c
#     (local2):  word      @ -0x10
#     (local3):  word[3]   @ -0xc
            .global      sdk_pm_attach
            .type        sdk_pm_attach, @function
sdk_pm_attach:
            movi         a5, 251 /* 0x000000fb */              # 1404: 52a0fb
            movi         a3, .Ldata002                         # 1407: 31e1ff
            movi         a2, 2 /* 0x00000002 */                # 140a: 0c22
            addi         sp, sp, -32 /* (local0) */            # 140c: 12c1e0
            s32i         a0, sp, 20 /* a0 -> [(local3)] */     # 140f: 0951
            s8i          a2, a3, 224 /* 0x02 -> [.Ldata032] */ # 1411: 2243e0
            l8ui         a4, a3, 52 /* [.Ldata016] */          # 1414: 420334
            movi         a2, .Label006                         # 1417: 21deff
            and          a4, a4, a5                            # 141a: 504410
            movi         a5, 4 /* 0x00000004 */                # 141d: 0c45
            or           a4, a4, a5                            # 141f: 504420
            s8i          a4, a3, 52 /* a4 -> [.Ldata016] */    # 1422: 424334
            movi         a5, 254 /* 0x000000fe */              # 1425: 52a0fe
            and          a4, a4, a5                            # 1428: 504410
            s8i          a4, a3, 52 /* a4 -> [.Ldata016] */    # 142b: 424334
            movi         a5, 253 /* 0x000000fd */              # 142e: 52a0fd
            and          a4, a4, a5                            # 1431: 504410
            s8i          a4, a3, 52 /* a4 -> [.Ldata016] */    # 1434: 424334
            movi         a5, 247 /* 0x000000f7 */              # 1437: 52a0f7
            and          a4, a4, a5                            # 143a: 504410
            movi         a5, 8 /* 0x00000008 */                # 143d: 0c85
            or           a4, a4, a5                            # 143f: 504420
            s8i          a4, a3, 52 /* a4 -> [.Ldata016] */    # 1442: 424334
            movi         a3, .Lfunc006                         # 1445: 31d3ff
            movi         a4, 0 /* 0x00000000 */                # 1448: 0c04
            call0        sdk_os_timer_setfn                    # 144a: 01e5ffc0
                                                               # 144e: 0000
            movi         a0, 223 /* 0x000000df */              # 1450: 02a0df
            movi         a3, 0 /* 0x00000000 */                # 1453: 0c03
            movi         a6, 1 /* 0x00000001 */                # 1455: 0c16
            movi         a8, 0x00004650                        # 1457: 81d3ff
            movi         a9, 0x00001770                        # 145a: 91d1ff
            movi         a10, 0x000009c4                       # 145d: a1cfff
            movi         a7, .Ldata002                         # 1460: 71ceff
            movi         a4, 2 /* 0x00000002 */                # 1463: 0c24
            s8i          a4, a7, 226 /* 0x02 -> [.Ldata034] */ # 1465: 4247e2
            s16i         a10, a7, 44 /* 0x09c4 -> [.Ldata012] */ # 1468: a25716
            s32i         a9, a7, 76 /* 0x00001770 -> [.Ldata030] */ # 146b: 926713
            s32i         a8, a7, 80 /* 0x00004650 -> [.Ldata031] */ # 146e: 826714
            s8i          a6, a7, 228 /* 0x01 -> [.Ldata036] */ # 1471: 6247e4
            s8i          a3, a7, 225 /* 0x00 -> [.Ldata033] */ # 1474: 3247e1
            s8i          a3, a7, 227 /* 0x00 -> [.Ldata035] */ # 1477: 3247e3
            s8i          a3, a7, 54 /* 0x00 -> [.Ldata018] */  # 147a: 324736
            l8ui         a2, a7, 52 /* [.Ldata016] */          # 147d: 220734
            l8ui         a11, a7, 53 /* [.Ldata017] */         # 1480: b20735
            and          a2, a2, a0                            # 1483: 002210
            and          a11, a11, a0                          # 1486: 00bb10
            s8i          a11, a7, 53 /* a11 -> [.Ldata017] */  # 1489: b24735
            s8i          a2, a7, 52 /* a2 -> [.Ldata016] */    # 148c: 224734
            movi         a3, 5 /* 0x00000005 */                # 148f: 0c53
            movi         a2, .Lfunc016                         # 1491: 21c5ff
            call0        sdk_ppRegisterTxCallback              # 1494: 01d4ffc0
                                                               # 1498: 0000
            movi         a2, .Lfunc017                         # 149a: 21c4ff
            movi         a3, 6 /* 0x00000006 */                # 149d: 0c63
            call0        sdk_ppRegisterTxCallback              # 149f: 01d2ffc0
                                                               # 14a3: 0000
            movi         a2, .Label002                         # 14a5: 21c2ff
            movi         a3, .Lfunc019                         # 14a8: 31c3ff
            movi         a4, 0 /* 0x00000000 */                # 14ab: 0c04
            call0        sdk_os_timer_setfn                    # 14ad: 01cfffc0
                                                               # 14b1: 0000
            movi         a2, .Label003                         # 14b3: 21c1ff
            movi         a3, .Lfunc020                         # 14b6: 31c1ff
            movi         a4, 0 /* 0x00000000 */                # 14b9: 0c04
            call0        sdk_os_timer_setfn                    # 14bb: 01cdffc0
                                                               # 14bf: 0000
            movi         a2, .Label004                         # 14c1: 21bfff
            movi         a3, .Lfunc021                         # 14c4: 31c0ff
            movi         a4, 0 /* 0x00000000 */                # 14c7: 0c04
            call0        sdk_os_timer_setfn                    # 14c9: 01caffc0
                                                               # 14cd: 0000
            movi         a2, .Label005                         # 14cf: 21beff
            movi         a3, sdk_pm_idle_sleep                 # 14d2: 31beff
            movi         a4, 0 /* 0x00000000 */                # 14d5: 0c04
            call0        sdk_os_timer_setfn                    # 14d7: 01c8ffc0
                                                               # 14db: 0000
            movi         a2, .Lfunc023                         # 14dd: 21bcff
            movi         a3, .Lstr040                          # 14e0: 31bdff
            movi         a4, 176 /* 0x000000b0 */              # 14e3: 42a0b0
            movi         a6, 1 /* 0x00000001 */                # 14e6: 0c16
            addi         a7, sp, 16 /* (local2) */             # 14e8: 72c110
            movi         a5, 0 /* 0x00000000 */                # 14eb: 0c05
            s32i         a5, sp, 0 /* 0x00000000 -> [(local0)] */ # 14ed: 5901
            s32i         a5, sp, 4 /* 0x00000000 -> [(local1)] */ # 14ef: 5911
            movi         a5, 0 /* 0x00000000 */                # 14f1: 0c05
            call0        xTaskGenericCreate                    # 14f3: 01c2ffc0
                                                               # 14f7: 0000
            movi         a2, .Lstr041                          # 14f9: 21b7ff
            l32i         a3, sp, 16 /* [(local2)] */           # 14fc: 3841
            movi         a4, 1 /* 0x00000001 */                # 14fe: 0c14
            movi         a5, 176 /* 0x000000b0 */              # 1500: 52a0b0
            call0        printf                                # 1503: 01bfffc0
                                                               # 1507: 0000
            movi         a7, .Ldata002                         # 1509: 71b4ff
            movi         a6, 1 /* 0x00000001 */                # 150c: 0c16
            s8i          a6, a7, 57 /* 0x01 -> [.Ldata021] */  # 150e: 624739
            call0        sdk_pm_reset_idle_sleep               # 1511: 050000
            l32i         a0, sp, 20 /* [(local3)] */           # 1514: 0851
            addi         sp, sp, 32 /* (top of frame) */       # 1516: 12c120
            ret                                                # 1519: 0df0

            .literal_position                                  # 151c: 00000000
                                                               # 1520: bc020000
                                                               # 1524: 8c000000
                                                               # 1528: 58000000
                                                               # 152c: 60000000
                                                               # 1530: ff0f00ff
                                                               # 1534: 00800100
                                                               # 1538: 00000000
                                                               # 153c: 41000000
                                                               # 1540: 000af23f
                                                               # 1544: f7ffff03
                                                               # 1548: 00000000
                                                               # 154c: a4020000
                                                               # 1550: 00000000
                                                               # 1554: 00000000
                                                               # 1558: 00000000
                                                               # 155c: 00000000
                                                               # 1560: 00000000
                                                               # 1564: 00000000
                                                               # 1568: 00000000
                                                               # 156c: 00000000
                                                               # 1570: 00000000
                                                               # 1574: 00000000

# Function @ .irom0.text+0x1578
# Local variables/stack:
#     (local0):  word[4]   @ -0x30
#     (local1):  word      @ -0x20
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word      @ -0x10
#     (local6):  word      @ -0xc
#     (local7):  word[2]   @ -0x8
            .global      sdk_pm_send_nullfunc
            .type        sdk_pm_send_nullfunc, @function
sdk_pm_send_nullfunc:
            movi         a5, 2 /* 0x00000002 */                # 1578: 0c25
            addi         sp, sp, -48 /* (local0) */            # 157a: 12c1d0
            movi         a3, .Ldata002                         # 157d: 31e7ff
            s32i         a0, sp, 40 /* a0 -> [(local7)] */     # 1580: 09a1
            movi         a0, 0 /* 0x00000000 */                # 1582: 0c00
            l8ui         a4, a3, 59 /* [.Ldata023] */          # 1584: 42033b
            s32i         a0, sp, 16 /* 0x00000000 -> [(local1)] */ # 1587: 0941
            bnez         a4, .Lbr126                           # 1589: dc74
            l8ui         a6, a3, 60 /* [.Ldata024] */          # 158b: 62033c
            beqz         a6, .Lbr125                           # 158e: 8c56
            mov          a5, a2 /* arg0 */                     # 1590: 5d02
            movi         a0, 1 /* 0x00000001 */                # 1592: 0c10
            j            .Lbr126                               # 1594: 060300
.Lbr125:    l8ui         a7, a3, 53 /* [.Ldata017] */          # 1597: 720335
            movi         a6, 1 /* 0x00000001 */                # 159a: 0c16
            srli         a7, a7, 7                             # 159c: 707741
            beqz         a7, .Lbr130                           # 159f: 162704
            mov          a0, a6 /* 0x00000001 */               # 15a2: 0d06
.Lbr126:    movnez       a5, a0, a2                            # 15a4: 205093
            s8i          a5, a3, 61 /* a5 -> [.Ldata025] */    # 15a7: 52433d
            j            .Lbr129                               # 15aa: 060c00
.Lbr127:    l32i         a9, sp, 32 /* [(local5)] */           # 15ad: 9881
            movi         a2, .Lstr043                          # 15af: 21dcff
            l32i         a9, a9, 32 /* [[(local5)]+0x20] */    # 15b2: 9889
            movi         a8, 64 /* 0x00000040 */               # 15b4: 4c08
            s8i          a8, a9, 14 /* 0x40 -> [[[(local5)]+0x20]+0xe] */ # 15b6: 82490e
            call0        printf                                # 15b9: 01e5ffc0
                                                               # 15bd: 0000
.Lbr128:    movi         a2, .Label004                         # 15bf: 21d9ff
            s32i         a2, sp, 20 /* .Label004 -> [(local2)] */ # 15c2: 2951
            call0        sdk_os_timer_disarm                   # 15c4: 01e4ffc0
                                                               # 15c8: 0000
            l32i         a2, sp, 20 /* [(local2)] */           # 15ca: 2851
            movi         a3, 55 /* 0x00000037 */               # 15cc: 3c73
            movi         a4, 0 /* 0x00000000 */                # 15ce: 0c04
            call0        sdk_os_timer_arm                      # 15d0: 01e2ffc0
                                                               # 15d4: 0000
            l32i         a2, sp, 32 /* [(local5)] */           # 15d6: 2881
            call0        sdk_ppTxPkt                           # 15d8: 01e1ffc0
                                                               # 15dc: 0000
.Lbr129:    l32i         a0, sp, 40 /* [(local7)] */           # 15de: 08a1
            addi         sp, sp, 48 /* (top of frame) */       # 15e0: 12c130
            ret                                                # 15e3: 0df0
.Lbr130:    s32i         a2, sp, 36 /* arg0 -> [(local6)] */   # 15e5: 2991
            s8i          a6, a3, 58 /* 0x01 -> [.Ldata022] */  # 15e7: 62433a
            s32i         a0, sp, 28 /* 0x00000000 -> [(local4)] */ # 15ea: 0971
            bnez         a2, .Lbr131                           # 15ec: cc42
            s8i          a6, a3, 60 /* 0x01 -> [.Ldata024] */  # 15ee: 62433c
            j            .Lbr132                               # 15f1: 860000
.Lbr131:    s8i          a6, a3, 59 /* 0x01 -> [.Ldata023] */  # 15f4: 62433b
.Lbr132:    addi         a2, sp, 16 /* (local1) */             # 15f7: 22c110
            movi         a3, 24 /* 0x00000018 */               # 15fa: 1c83
            movi         a4, 0 /* 0x00000000 */                # 15fc: 0c04
            call0        sdk_ieee80211_getmgtframe             # 15fe: 01d8ffc0
                                                               # 1602: 0000
            s32i         a2, sp, 32 /* a2 -> [(local5)] */     # 1604: 2981
            bnez         a2, .Lbr134                           # 1606: dc02
            movi         a2, .Lstr006                          # 1608: 21c8ff
            movi         a3, .Lstr007                          # 160b: 31c8ff
            movi         a4, 1818 /* 0x0000071a */             # 160e: 42a71a
            call0        printf                                # 1611: 01d4ffc0
                                                               # 1615: 0000
.Lbr133:    j            .Lbr133 /* (halt) */                  # 1617: 06ffff
.Lbr134:    l32i         a2, a2, 4                             # 161a: 2812
            movi         a3, 24 /* 0x00000018 */               # 161c: 1c83
            l32i         a2, a2, 4                             # 161e: 2812
            s32i         a2, sp, 24 /* a2 -> [(local3)] */     # 1620: 2961
            call0        bzero                                 # 1622: 01d1ffc0
                                                               # 1626: 0000
            movi         a5, 24 /* 0x00000018 */               # 1628: 1c85
            l32i         a4, sp, 32 /* [(local5)] */           # 162a: 4881
            l32i         a6, sp, 28 /* [(local4)] */           # 162c: 6871
            s16i         a6, a4, 22 /* [(local4)] -> [[(local5)]+0x16] */ # 162e: 62540b
            s16i         a5, a4, 20 /* 0x0018 -> [[(local5)]+0x14] */ # 1631: 52540a
            movi         a9, 64 /* 0x00000040 */               # 1634: 4c09
            movi         a0, 128 /* 0x00000080 */              # 1636: 02a080
            l32i         a4, a4, 4 /* [[(local5)]+0x4] */      # 1639: 4814
            memw                                               # 163b: c02000
            l8ui         a11, a4, 3 /* [[[(local5)]+0x4]+0x3] */ # 163e: b20403
            extui        a11, a11, 0, 7                        # 1641: b0b064
            or           a11, a11, a0                          # 1644: 00bb20
            memw                                               # 1647: c02000
            s8i          a11, a4, 3 /* a11 -> [[[(local5)]+0x4]+0x3] */ # 164a: b24403
            movi         a10, 191 /* 0x000000bf */             # 164d: a2a0bf
            memw                                               # 1650: c02000
            l8ui         a8, a4, 3 /* [[[(local5)]+0x4]+0x3] */ # 1653: 820403
            and          a8, a8, a10                           # 1656: a08810
            or           a8, a8, a9                            # 1659: 908820
            memw                                               # 165c: c02000
            s8i          a8, a4, 3 /* a8 -> [[[(local5)]+0x4]+0x3] */ # 165f: 824403
            movi         a7, 223 /* 0x000000df */              # 1662: 72a0df
            memw                                               # 1665: c02000
            l8ui         a5, a4, 3 /* [[[(local5)]+0x4]+0x3] */ # 1668: 520403
            and          a5, a5, a7                            # 166b: 705510
            or           a5, a5, a6                            # 166e: 605520
            memw                                               # 1671: c02000
            s8i          a5, a4, 3 /* a5 -> [[[(local5)]+0x4]+0x3] */ # 1674: 524403
            movi         a6, 0xff000fff                        # 1677: 61aeff
            movi         a5, 0x00018000                        # 167a: 51aeff
            memw                                               # 167d: c02000
            l16ui        a3, a4, 2 /* [[[(local5)]+0x4]+0x2] */ # 1680: 321401
            slli         a3, a3, 16                            # 1683: 003311
            memw                                               # 1686: c02000
            l16ui        a7, a4, 0 /* [[[(local5)]+0x4]] */    # 1689: 721400
            or           a3, a3, a7                            # 168c: 703320
            and          a3, a3, a6                            # 168f: 603310
            or           a3, a3, a5                            # 1692: 503320
            memw                                               # 1695: c02000
            s16i         a3, a4, 0 /* a3 -> [[[(local5)]+0x4]] */ # 1698: 325400
            extui        a3, a3, 16, 16                        # 169b: 3030f5
            memw                                               # 169e: c02000
            s16i         a3, a4, 2 /* a3 -> [[[(local5)]+0x4]+0x2] */ # 16a1: 325401
            movi         a2, 0 /* 0x00000000 */                # 16a4: 0c02
            call0        sdk_ic_get_addr                       # 16a6: 01b1ffc0
                                                               # 16aa: 0000
            l32i         a3, sp, 32 /* [(local5)] */           # 16ac: 3881
            movi         a4, 72 /* 0x00000048 */               # 16ae: 4c84
            movi         a5, 0 /* 0x00000000 */                # 16b0: 0c05
            mov          a6, a2                                # 16b2: 6d02
            movi         a8, .Label001                         # 16b4: 81a2ff
            movi         a2, sdk_g_ic                          # 16b7: 21a0ff
            mov          a7, a8 /* .Label001 */                # 16ba: 7d08
            l32i         a2, a2, 16 /* [sdk_g_ic+0x10] */      # 16bc: 2842
            s32i         a8, sp, 0 /* .Label001 -> [(local0)] */ # 16be: 8901
            call0        sdk_ieee80211_send_setup              # 16c0: 01acffc0
                                                               # 16c4: 0000
            l32i         a5, sp, 32 /* [(local5)] */           # 16c6: 5881
            movi         a6, 0x3ff20a00                        # 16c8: 619eff
            l32i         a7, a5, 32 /* [[(local5)]+0x20] */    # 16cb: 7885
            memw                                               # 16cd: c02000
            movi         a3, 6 /* 0x00000006 */                # 16d0: 0c63
            movi         a4, 240 /* 0x000000f0 */              # 16d2: 42a0f0
            movi         a9, 143 /* 0x0000008f */              # 16d5: 92a08f
            l8ui         a8, a7, 6 /* [[[(local5)]+0x20]+0x6] */ # 16d8: 820706
            l32i         a6, a6, 0x200 /* [0x3ff20c00] */      # 16db: 622680
            and          a8, a8, a9                            # 16de: 908810
            movi         a9, 253 /* 0x000000fd */              # 16e1: 92a0fd
            s8i          a8, a7, 6 /* a8 -> [[[(local5)]+0x20]+0x6] */ # 16e4: 824706
            l32i         a2, a5, 32 /* [[(local5)]+0x20] */    # 16e7: 2885
            s32i         a6, a7, 16 /* [0x3ff20c00] -> [[[(local5)]+0x20]+0x10] */ # 16e9: 6947
            l8ui         a0, a2, 4 /* [[[(local5)]+0x20]+0x4] */ # 16eb: 020204
            movi         a8, .Ldata002                         # 16ee: 8196ff
            and          a0, a0, a4                            # 16f1: 400010
            l32i         a4, sp, 28 /* [(local4)] */           # 16f4: 4871
            or           a0, a0, a3                            # 16f6: 300020
            s8i          a0, a2, 4 /* a0 -> [[[(local5)]+0x20]+0x4] */ # 16f9: 024204
            l32i         a7, a5, 32 /* [[(local5)]+0x20] */    # 16fc: 7885
            l32i         a3, sp, 36 /* [(local6)] */           # 16fe: 3891
            l32i         a11, a7, 0 /* [[[(local5)]+0x20]] */  # 1700: b807
            movi         a0, 0x03fffff7                        # 1702: 0190ff
            extui        a10, a11, 0, 6                        # 1705: b0a054
            srli         a11, a11, 6                           # 1708: b0b641
            and          a11, a11, a0                          # 170b: 00bb10
            slli         a11, a11, 6                           # 170e: a0bb11
            or           a10, a10, a11                         # 1711: b0aa20
            s32i         a10, a7, 0 /* a10 -> [[[(local5)]+0x20]] */ # 1714: a907
            l8ui         a6, a7, 0 /* [[[(local5)]+0x20]] */   # 1716: 620700
            l8ui         a8, a8, 64 /* [.Ldata028] */          # 1719: 820840
            and          a6, a6, a9                            # 171c: 906610
            extui        a8, a8, 0, 1                          # 171f: 808004
            slli         a8, a8, 1                             # 1722: f08811
            or           a6, a6, a8                            # 1725: 806620
            s8i          a6, a7, 0 /* a6 -> [[[(local5)]+0x20]] */ # 1728: 624700
            s32i         a4, a5, 24 /* [(local4)] -> [[(local5)]+0x18] */ # 172b: 4965
            beqz         a3, .Lbr127                           # 172d: 16c3e7
            movi         a2, .Lstr042                          # 1730: 2187ff
            l32i         a10, sp, 24 /* [(local3)] */          # 1733: a861
            l32i         a8, sp, 32 /* [(local5)] */           # 1735: 8881
            l8ui         a9, a10, 1 /* [[(local3)]+0x1] */     # 1737: 920a01
            movi         a11, 16 /* 0x00000010 */              # 173a: 1c0b
            or           a9, a9, a11                           # 173c: b09920
            s8i          a9, a10, 1 /* a9 -> [[(local3)]+0x1] */ # 173f: 924a01
            l32i         a8, a8, 32 /* [[(local5)]+0x20] */    # 1742: 8888
            movi         a7, 32 /* 0x00000020 */               # 1744: 2c07
            s8i          a7, a8, 14 /* 0x20 -> [[[(local5)]+0x20]+0xe] */ # 1746: 72480e
            call0        printf                                # 1749: 018affc0
                                                               # 174d: 0000
            j            .Lbr128                               # 174f: 069bff

            .literal_position                                  # 1754: 00000000

# Function @ .irom0.text+0x1758
            .global      sdk_pm_is_waked
            .type        sdk_pm_is_waked, @function
sdk_pm_is_waked:
            movi         a4, .Ldata002                         # 1758: 41ffff
            l8ui         a4, a4, 53 /* [.Ldata017] */          # 175b: 420435
            movi         a2, 0 /* 0x00000000 */                # 175e: 0c02
            extui        a3, a4, 1, 3                          # 1760: 403124
            bnei         a3, 7, .Lbr135                        # 1763: 667304
            bbci         a4, 5, .Lbr135                        # 1766: 576401
            movi         a2, 1 /* 0x00000001 */                # 1769: 0c12
.Lbr135:    extui        a2, a2, 0, 8                          # 176b: 202074
            ret                                                # 176e: 0df0

            .literal_position                                  # 1770: 00000000

# Function @ .irom0.text+0x1774
            .global      sdk_pm_is_open
            .type        sdk_pm_is_open, @function
sdk_pm_is_open:
            movi         a4, .Ldata002                         # 1774: 41ffff
            movi         a3, 1 /* 0x00000001 */                # 1777: 0c13
            l8ui         a4, a4, 53 /* [.Ldata017] */          # 1779: 420435
            movi         a2, 0 /* 0x00000000 */                # 177c: 0c02
            extui        a4, a4, 5, 1                          # 177e: 404504
            addi         a4, a4, -1                            # 1781: 0b44
            moveqz       a2, a3, a4                            # 1783: 402383
            ret                                                # 1786: 0df0

            .literal_position                                  # 1788: d4020000
                                                               # 178c: 00000000
                                                               # 1790: 00000000
                                                               # 1794: 00000000

# Function @ .irom0.text+0x1798
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pm_scan_lock
            .type        sdk_pm_scan_lock, @function
sdk_pm_scan_lock:
            movi         a2, .Label011                         # 1798: 21fcff
            addi         sp, sp, -16 /* (local0) */            # 179b: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 179e: 0901
            call0        printf                                # 17a0: 01fcffc0
                                                               # 17a4: 0000
            movi         a2, .Ldata002                         # 17a6: 21f9ff
            l8ui         a0, a2, 53 /* [.Ldata017] */          # 17a9: 020235
            movi         a3, 128 /* 0x00000080 */              # 17ac: 32a080
            extui        a0, a0, 0, 7                          # 17af: 000064
            or           a0, a0, a3                            # 17b2: 300020
            s8i          a0, a2, 53 /* a0 -> [.Ldata017] */    # 17b5: 024235
            call0        sdk_pp_disable_idle_timer             # 17b8: 01f7ffc0
                                                               # 17bc: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 17be: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 17c0: 12c110
            ret                                                # 17c3: 0df0

            .balign      4
# Function @ .irom0.text+0x17c8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pm_try_scan_unlock
            .type        sdk_pm_try_scan_unlock, @function
sdk_pm_try_scan_unlock:
            movi         a2, 0 /* 0x00000000 */                # 17c8: 0c02
            addi         sp, sp, -16 /* (local0) */            # 17ca: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 17cd: 0901
            call0        .Lfunc022                             # 17cf: 450600
            l32i         a0, sp, 0 /* [(local0)] */            # 17d2: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 17d4: 12c110
            ret                                                # 17d7: 0df0

            .literal_position                                  # 17dc: d8020000
                                                               # 17e0: 00000000
                                                               # 17e4: 34180000

# Function @ .irom0.text+0x17e8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pm_force_scan_unlock
            .type        sdk_pm_force_scan_unlock, @function
sdk_pm_force_scan_unlock:
            movi         a2, .Lstr044                          # 17e8: 21fdff
            addi         sp, sp, -16 /* (local0) */            # 17eb: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 17ee: 0901
            call0        printf                                # 17f0: 01fcffc0
                                                               # 17f4: 0000
            movi         a2, 0 /* 0x00000000 */                # 17f6: 0c02
            call0        .Lfunc022                             # 17f8: 01fbffc0
                                                               # 17fc: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 17fe: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1800: 12c110
            ret                                                # 1803: 0df0

            .literal_position                                  # 1808: 00000000
                                                               # 180c: e0020000
                                                               # 1810: 58000000
                                                               # 1814: 60000000
                                                               # 1818: 58000000
                                                               # 181c: 60000000
                                                               # 1820: 00000000
                                                               # 1824: 00000000
                                                               # 1828: 00000000
                                                               # 182c: 00000000
                                                               # 1830: 00000000

# Function @ .irom0.text+0x1834
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
.Lfunc022:  addi         sp, sp, -16 /* (local0) */            # 1834: 12c1f0
            movi         a2, .Lstr045                          # 1837: 21f5ff
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 183a: c911
            movi         a12, .Ldata002                        # 183c: c1f3ff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 183f: 0901
            l8ui         a3, a12, 53 /* [.Ldata017] */         # 1841: 320c35
            l8ui         a4, a12, 61 /* [.Ldata025] */         # 1844: 420c3d
            extui        a3, a3, 1, 3                          # 1847: 303124
            call0        printf                                # 184a: 01f5ffc0
                                                               # 184e: 0000
            l8ui         a0, a12, 53 /* [.Ldata017] */         # 1850: 020c35
            l8ui         a5, a12, 58 /* [.Ldata022] */         # 1853: 520c3a
            extui        a4, a0, 0, 7                          # 1856: 004064
            s8i          a4, a12, 53 /* a4 -> [.Ldata017] */   # 1859: 424c35
            bbci         a4, 5, .Lbr138                        # 185c: 576435
            bnez         a5, .Lbr138                           # 185f: fc25
            l8ui         a4, a12, 61 /* [.Ldata025] */         # 1861: 420c3d
            movi         a2, 0 /* 0x00000000 */                # 1864: 0c02
            bnei         a4, 1, .Lbr139                        # 1866: 661434
            s8i          a2, a12, 61 /* 0x00 -> [.Ldata025] */ # 1869: 224c3d
            extui        a6, a0, 1, 3                          # 186c: 006124
            beqi         a6, 1, .Lbr142                        # 186f: 26164f
            movi         a2, .Lstr006                          # 1872: 21e7ff
            movi         a3, .Lstr007                          # 1875: 31e7ff
            movi         a4, 1923 /* 0x00000783 */             # 1878: 42a783
            call0        printf                                # 187b: 01eaffc0
                                                               # 187f: 0000
.Lbr136:    j            .Lbr136 /* (halt) */                  # 1881: 06ffff
.Lbr137:    call0        sdk_pm_is_waked                       # 1884: 050000
            beqz         a2, .Lbr138                           # 1887: 8ca2
            call0        sdk_pp_disable_idle_timer             # 1889: 01e7ffc0
                                                               # 188d: 0000
            call0        sdk_pp_enable_idle_timer              # 188f: 01e7ffc0
                                                               # 1893: 0000
.Lbr138:    l32i         a12, sp, 4 /* [(local1)] */           # 1895: c811
            l32i         a0, sp, 0 /* [(local0)] */            # 1897: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1899: 12c110
            ret                                                # 189c: 0df0
.Lbr139:    bnei         a4, 2, .Lbr137                        # 189e: 6624e2
            s8i          a2, a12, 61 /* 0x00 -> [.Ldata025] */ # 18a1: 224c3d
            extui        a7, a0, 1, 3                          # 18a4: 007124
            beqi         a7, 6, .Lbr141                        # 18a7: 266711
            movi         a2, .Lstr006                          # 18aa: 21dbff
            movi         a3, .Lstr007                          # 18ad: 31dbff
            movi         a4, 1930 /* 0x0000078a */             # 18b0: 42a78a
            call0        printf                                # 18b3: 01dfffc0
                                                               # 18b7: 0000
.Lbr140:    j            .Lbr140 /* (halt) */                  # 18b9: 06ffff
.Lbr141:    call0        sdk_pm_send_nullfunc                  # 18bc: 050000
            j            .Lbr138                               # 18bf: 86f4ff
.Lbr142:    movi         a2, 1 /* 0x00000001 */                # 18c2: 0c12
            call0        sdk_pm_send_nullfunc                  # 18c4: 050000
            j            .Lbr138                               # 18c7: 86f2ff

            .literal_position                                  # 18cc: 00000000

# Function @ .irom0.text+0x18d0
            .global      sdk_pm_scan_unlocked
            .type        sdk_pm_scan_unlocked, @function
sdk_pm_scan_unlocked:
            movi         a4, .Ldata002                         # 18d0: 41ffff
            movi         a3, 1 /* 0x00000001 */                # 18d3: 0c13
            l8ui         a4, a4, 53 /* [.Ldata017] */          # 18d5: 420435
            movi         a2, 0 /* 0x00000000 */                # 18d8: 0c02
            srli         a4, a4, 7                             # 18da: 404741
            moveqz       a2, a3, a4                            # 18dd: 402383
            ret                                                # 18e0: 0df0

            .literal_position                                  # 18e4: 00000000

# Function @ .irom0.text+0x18e8
            .global      sdk_pm_allow_tx
            .type        sdk_pm_allow_tx, @function
sdk_pm_allow_tx:
            movi         a6, .Ldata002                         # 18e8: 61ffff
            l8ui         a4, a6, 53 /* [.Ldata017] */          # 18eb: 420635
            movi         a5, 1 /* 0x00000001 */                # 18ee: 0c15
            extui        a4, a4, 1, 3                          # 18f0: 404124
            beqi         a4, 7, .Lbr143                        # 18f3: 267409
            beqz         a4, .Lbr143                           # 18f6: 8c64
            l8ui         a7, a6, 64 /* [.Ldata028] */          # 18f8: 720640
            bne          a7, a2, .Lbr143                       # 18fb: 279701
            movi         a5, 0 /* 0x00000000 */                # 18fe: 0c05
.Lbr143:    extui        a2, a5, 0, 8                          # 1900: 502074
            ret                                                # 1903: 0df0

            .literal_position                                  # 1908: 00000000

# Function @ .irom0.text+0x190c
            .global      sdk_pm_assoc_parse
            .type        sdk_pm_assoc_parse, @function
sdk_pm_assoc_parse:
            l16ui        a3, a2, 2 /* [arg0+0x2] */            # 190c: 321201
            beqz         a3, .Lbr144                           # 190f: 8c23
            movi         a2, -1 /* 0xffffffff */               # 1911: 7cf2
            ret           /* 0xffffffff */                     # 1913: 0df0
.Lbr144:    l16ui        a4, a2, 4 /* [arg0+0x4] */            # 1915: 421202
            movi         a5, .Ldata002                         # 1918: 51fcff
            movi         a2, 0 /* 0x00000000 */                # 191b: 0c02
            s16i         a4, a5, 72 /* [arg0+0x4] -> [.Ldata029] */ # 191d: 425524
            ret           /* 0x00000000 */                     # 1920: 0df0

            .literal_position                                  # 1924: 00000000
                                                               # 1928: 00000000

# Function @ .irom0.text+0x192c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pm_set_addr
            .type        sdk_pm_set_addr, @function
sdk_pm_set_addr:
            addi         sp, sp, -16 /* (local0) */            # 192c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 192f: 0901
            movi         a0, .Ldata002                         # 1931: 01fcff
            movi         a4, 6 /* 0x00000006 */                # 1934: 0c64
            s8i          a2, a0, 64 /* arg0 -> [.Ldata028] */  # 1936: 224040
            addi         a2, a0, 65 /* .Label001 */            # 1939: 22c041
            call0        memcpy                                # 193c: 01fbffc0
                                                               # 1940: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 1942: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1944: 12c110
            ret                                                # 1947: 0df0

            .literal_position                                  # 194c: 00000000
                                                               # 1950: 00000000

# Function @ .irom0.text+0x1954
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pm_sleep_for
            .type        sdk_pm_sleep_for, @function
sdk_pm_sleep_for:
            addi         sp, sp, -16 /* (local0) */            # 1954: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1957: 0901
            movi         a0, .Ldata002                         # 1959: 01fcff
            l8ui         a3, a0, 53 /* [.Ldata017] */          # 195c: 320035
            bbci         a3, 5, .Lbr145                        # 195f: 576311
            movi         a4, 6 /* 0x00000006 */                # 1962: 0c64
            addi         a3, a0, 65 /* .Label001 */            # 1964: 32c041
            call0        memcmp                                # 1967: 01faffc0
                                                               # 196b: 0000
            bnez         a2, .Lbr145                           # 196d: cc32
            movi         a0, 1 /* 0x00000001 */                # 196f: 0c10
            j            .Lbr146                               # 1971: 460000
.Lbr145:    movi         a0, 0 /* 0x00000000 */                # 1974: 0c00
.Lbr146:    extui        a2, a0, 0, 8                          # 1976: 002074
            l32i         a0, sp, 0 /* [(local0)] */            # 1979: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 197b: 12c110
            ret                                                # 197e: 0df0

            .literal_position                                  # 1980: 00000000
                                                               # 1984: 40010000
                                                               # 1988: ec020000
                                                               # 198c: dc000000
                                                               # 1990: fc020000
                                                               # 1994: 00000000
                                                               # 1998: 00000000
                                                               # 199c: 00000000
                                                               # 19a0: 00000000
                                                               # 19a4: 00000000
                                                               # 19a8: 00000000

# Function @ .irom0.text+0x19ac
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .global      sdk_pm_post
            .type        sdk_pm_post, @function
sdk_pm_post:
            addi         sp, sp, -16 /* (local0) */            # 19ac: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 19af: 0911
            movi         a0, .Ldata002                         # 19b1: 01f3ff
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 19b4: c921
            l8ui         a0, a0, 57 /* [.Ldata021] */          # 19b6: 020039
            mov          a12, a2 /* arg0 */                    # 19b9: cd02
            beqz         a0, .Lbr150                           # 19bb: 168005
            call0        vPortEnterCritical                    # 19be: 01f5ffc0
                                                               # 19c2: 0000
            movi         a2, .Ldata042                         # 19c4: 21f0ff
            add          a2, a12, a2                           # 19c7: 2a2c
            l8ui         a0, a2, 0                             # 19c9: 020200
            beqz         a0, .Lbr148                           # 19cc: 8c90
            call0        vPortExitCritical                     # 19ce: 01f2ffc0
                                                               # 19d2: 0000
.Lbr147:    movi         a2, 0 /* 0x00000000 */                # 19d4: 0c02
            j            .Lbr150                               # 19d6: 460f00
.Lbr148:    addi         a3, a0, 1                             # 19d9: 1b30
            s8i          a3, a2, 0                             # 19db: 324200
            call0        vPortExitCritical                     # 19de: 01efffc0
                                                               # 19e2: 0000
            call0        .Lfunc001                             # 19e4: 4562fe
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 19e7: 2901
            bnez         a2, .Lbr149                           # 19e9: cc92
            movi         a2, .Lstr046                          # 19eb: 21e7ff
            call0        printf                                # 19ee: 01ecffc0
                                                               # 19f2: 0000
            l32i         a2, sp, 0 /* [(local0)] */            # 19f4: 2801
.Lbr149:    mov          a3, sp /* (local0) */                 # 19f6: 3d01
            movi         a4, .Label007                         # 19f8: 41e5ff
            s32i         a12, a2, 0                            # 19fb: c902
            movi         a5, 0 /* 0x00000000 */                # 19fd: 0c05
            l32i         a2, a4, 28 /* [.Ldata041] */          # 19ff: 2874
            movi         a4, 1 /* 0x00000001 */                # 1a01: 0c14
            call0        xQueueGenericSend                     # 1a03: 01e8ffc0
                                                               # 1a07: 0000
            beqi         a2, 1, .Lbr147                        # 1a09: 2612c7
            movi         a2, .Lstr047                          # 1a0c: 21e1ff
            call0        printf                                # 1a0f: 01e6ffc0
                                                               # 1a13: 0000
            movi         a2, 1 /* 0x00000001 */                # 1a15: 0c12
.Lbr150:    l32i         a12, sp, 8 /* [(local2)] */           # 1a17: c821
            l32i         a0, sp, 4 /* [(local1)] */            # 1a19: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 1a1b: 12c110
            ret                                                # 1a1e: 0df0

            .literal_position                                  # 1a20: 00000000
                                                               # 1a24: 00feef3f
                                                               # 1a28: c4000000
                                                               # 1a2c: 04030000
                                                               # 1a30: 00000000
                                                               # 1a34: 00000000
                                                               # 1a38: 40010000
                                                               # 1a3c: 40010000
                                                               # 1a40: 10030000
                                                               # 1a44: 40010000
                                                               # 1a48: 1c030000
                                                               # 1a4c: 00000000
                                                               # 1a50: 00000000
                                                               # 1a54: 00000000
                                                               # 1a58: 00000000
                                                               # 1a5c: 00000000
                                                               # 1a60: 00000000
                                                               # 1a64: 00000000
                                                               # 1a68: 00000000
                                                               # 1a6c: 00000000
                                                               # 1a70: 00000000
                                                               # 1a74: 00000000
                                                               # 1a78: 00000000
                                                               # 1a7c: 00000000
                                                               # 1a80: 00000000
                                                               # 1a84: 00000000

# Function @ .irom0.text+0x1a88
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
.Lfunc023:  movi         a2, 8 /* 0x00000008 */                # 1a88: 0c82
            movi         a3, 4 /* 0x00000004 */                # 1a8a: 0c43
            movi         a4, 0 /* 0x00000000 */                # 1a8c: 0c04
            addi         sp, sp, -32 /* (local0) */            # 1a8e: 12c1e0
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   # 1a91: e941
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   # 1a93: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 1a95: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 1a97: 0911
            call0        xQueueGenericCreate                   # 1a99: 01eeffc0
                                                               # 1a9d: 0000
            movi         a14, 0x3feffe00                       # 1a9f: e1e1ff
            movi         a7, .Ldata002                         # 1aa2: 71dfff
            movi         a13, .Label006                        # 1aa5: d1e0ff
            s32i         a2, a7, 248 /* a2 -> [.Ldata041] */   # 1aa8: 22673e
            addi         a12, a13, 16 /* .bss+0xd4 */          # 1aab: c2cd10
.Lbr151:    mov          a3, sp /* (local0) */                 # 1aae: 3d01
            movi         a4, -1 /* 0xffffffff */               # 1ab0: 7cf4
            movi         a5, 0 /* 0x00000000 */                # 1ab2: 0c05
            call0        xQueueGenericReceive                  # 1ab4: 01e9ffc0
                                                               # 1ab8: 0000
            bnei         a2, 1, .Lbr156                        # 1aba: 66127e
            l32i         a3, sp, 0 /* [(local0)] */            # 1abd: 3801
            movi         a2, .Lstr048                          # 1abf: 21dbff
            l32i         a3, a3, 0 /* [[(local0)]] */          # 1ac2: 3803
            call0        printf                                # 1ac4: 01e6ffc0
                                                               # 1ac8: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 1aca: 0801
            l32i         a0, a0, 0 /* [[(local0)]] */          # 1acc: 0800
            beqz         a0, .Lbr157                           # 1ace: 16f006
            addi         a2, a0, -1 /* [[(local0)]]-0x1 */     # 1ad1: 0b20
            beqz         a2, .Lbr158                           # 1ad3: 16220b
            bnei         a0, 2, .Lbr155                        # 1ad6: 66205f
            movi         a2, sdk_NMIIrqIsOn                    # 1ad9: 21d5ff
            l8ui         a2, a2, 0 /* [sdk_NMIIrqIsOn] */      # 1adc: 220200
            bnez         a2, .Lbr153                           # 1adf: ec82
            call0        vPortEnterCritical                    # 1ae1: 01dfffc0
                                                               # 1ae5: 0000
.Lbr152:    memw                                               # 1ae7: c02000
            l32i         a4, a14, 0x200 /* [0x3ff00000] */     # 1aea: 422e80
            movi         a5, -32 /* 0xffffffe0 */              # 1aed: 6c05
            and          a4, a4, a5                            # 1aef: 504410
            memw                                               # 1af2: c02000
            s32i         a4, a14, 0x200 /* a4 -> [0x3ff00000] */ # 1af5: 426e80
            memw                                               # 1af8: c02000
            l32i         a3, a14, 0x200 /* [0x3ff00000] */     # 1afb: 322e80
            bbsi         a3, 0, .Lbr152                        # 1afe: 07e3e5
            movi         a2, sdk_NMIIrqIsOn                    # 1b01: 21ccff
            l32i         a0, sp, 0 /* [(local0)] */            # 1b04: 0801
            l8ui         a2, a2, 0 /* [sdk_NMIIrqIsOn] */      # 1b06: 220200
            l32i         a0, a0, 0 /* [[(local0)]] */          # 1b09: 0800
.Lbr153:    movi         a4, .Ldata042                         # 1b0b: 41cbff
            add          a4, a0, a4                            # 1b0e: 4a40
            l8ui         a3, a4, 0                             # 1b10: 320400
            addi         a3, a3, -1                            # 1b13: 0b33
            s8i          a3, a4, 0                             # 1b15: 324400
            bnez         a2, .Lbr154                           # 1b18: dca2
            memw                                               # 1b1a: c02000
            l32i         a5, a14, 0x200 /* [0x3ff00000] */     # 1b1d: 522e80
            movi         a6, -32 /* 0xffffffe0 */              # 1b20: 6c06
            and          a5, a5, a6                            # 1b22: 605510
            movi         a6, 1 /* 0x00000001 */                # 1b25: 0c16
            or           a5, a5, a6                            # 1b27: 605520
            memw                                               # 1b2a: c02000
            s32i         a5, a14, 0x200 /* a5 -> [0x3ff00000] */ # 1b2d: 526e80
            call0        vPortExitCritical                     # 1b30: 01cdffc0
                                                               # 1b34: 0000
.Lbr154:    call0        sdk_pm_reset_idle_sleep               # 1b36: 050000
.Lbr155:    call0        .Lfunc002                             # 1b39: 4551fe
.Lbr156:    l32i         a2, a12, 36 /* [.Ldata041] */         # 1b3c: 289c
            j            .Lbr151                               # 1b3e: 06dbff
.Lbr157:    call0        vPortEnterCritical                    # 1b41: 01c9ffc0
                                                               # 1b45: 0000
            l32i         a8, sp, 0 /* [(local0)] */            # 1b47: 8801
            movi         a9, .Ldata042                         # 1b49: 91bcff
            l32i         a8, a8, 0 /* [[(local0)]] */          # 1b4c: 8808
            add          a8, a8, a9                            # 1b4e: 9a88
            l8ui         a7, a8, 0                             # 1b50: 720800
            addi         a7, a7, -1                            # 1b53: 0b77
            s8i          a7, a8, 0                             # 1b55: 724800
            call0        vPortExitCritical                     # 1b58: 01c5ffc0
                                                               # 1b5c: 0000
            movi         a2, .Lstr049                          # 1b5e: 21b8ff
            call0        printf                                # 1b61: 01c3ffc0
                                                               # 1b65: 0000
            movi         a2, 1 /* 0x00000001 */                # 1b67: 0c12
            call0        sdk_ppCheckTxIdle                     # 1b69: 01c2ffc0
                                                               # 1b6d: 0000
            bnez         a2, .Lbr155                           # 1b6f: 5662fc
            call0        sdk_pm_is_waked                       # 1b72: 050000
            beqz         a2, .Lbr155                           # 1b75: 1602fc
            l8ui         a10, a12, 16 /* [.Ldata036] */        # 1b78: a20c10
            bnei         a10, 1, .Lbr155                       # 1b7b: 661aba
            movi         a11, 1 /* 0x00000001 */               # 1b7e: 0c1b
            s8i          a11, a12, 33 /* 0x01 -> [.Ldata040] */ # 1b80: b24c21
            call0        .Lfunc009                             # 1b83: 85aefe
            j            .Lbr155                               # 1b86: c6ebff
.Lbr158:    call0        vPortEnterCritical                    # 1b89: 01bbffc0
                                                               # 1b8d: 0000
            l32i         a2, sp, 0 /* [(local0)] */            # 1b8f: 2801
            movi         a3, .Ldata042                         # 1b91: 31acff
            l32i         a2, a2, 0 /* [[(local0)]] */          # 1b94: 2802
            add          a2, a2, a3                            # 1b96: 3a22
            l8ui         a0, a2, 0                             # 1b98: 020200
            addi         a0, a0, -1                            # 1b9b: 0b00
            s8i          a0, a2, 0                             # 1b9d: 024200
            call0        vPortExitCritical                     # 1ba0: 01b7ffc0
                                                               # 1ba4: 0000
            movi         a2, .Lstr050                          # 1ba6: 21a8ff
            call0        printf                                # 1ba9: 01b5ffc0
                                                               # 1bad: 0000
            movi         a0, .Ldata002                         # 1baf: 01a7ff
            l8ui         a0, a0, 53 /* [.Ldata017] */          # 1bb2: 020035
            bbci         a0, 5, .Lbr155                        # 1bb5: 576080
            extui        a0, a0, 1, 3                          # 1bb8: 000124
            bnei         a0, 7, .Lbr159                        # 1bbb: 667002
            j            .Lbr155                               # 1bbe: c6ddff
.Lbr159:    bnei         a0, 6, .Lbr160                        # 1bc1: 666002
            j            .Lbr155                               # 1bc4: 46dcff
.Lbr160:    movi         a2, .Ldata001                         # 1bc7: 21a2ff
            l8ui         a2, a2, 0 /* [.Ldata001] */           # 1bca: 220200
            bnei         a2, 2, .Lbr162                        # 1bcd: 662217
            mov          a2, a13 /* .Label006 */               # 1bd0: 2d0d
            call0        sdk_os_timer_disarm                   # 1bd2: 01acffc0
                                                               # 1bd6: 0000
            call0        sdk_pm_rf_is_closed                   # 1bd8: 050000
            beqz         a2, .Lbr161                           # 1bdb: 8c32
            movi         a2, 2 /* 0x00000002 */                # 1bdd: 0c22
            call0        .Lfunc005                             # 1bdf: 0579fe
.Lbr161:    call0        .Lfunc013                             # 1be2: 45c1fe
            j            .Lbr155                               # 1be5: 06d4ff
.Lbr162:    call0        .Lfunc013                             # 1be8: c5c0fe
            j            .Lbr155                               # 1beb: 86d2ff

            .literal_position                                  # 1bf0: 00000000
                                                               # 1bf4: 00000000

# Function @ .irom0.text+0x1bf8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pm_get_idle_wait_time
            .type        sdk_pm_get_idle_wait_time, @function
sdk_pm_get_idle_wait_time:
            movi         a2, .Ldata002                         # 1bf8: 21feff
            addi         sp, sp, -16 /* (local0) */            # 1bfb: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1bfe: 0901
            l8ui         a2, a2, 64 /* [.Ldata028] */          # 1c00: 220240
            call0        sdk_rc_get_sta_trc                    # 1c03: 01fcffc0
                                                               # 1c07: 0000
            beqz         a2, .Lbr165                           # 1c09: ac62
            l8ui         a2, a2, 1                             # 1c0b: 220201
            movi         a3, 26 /* 0x0000001a */               # 1c0e: 1ca3
            slli         a0, a2, 24                            # 1c10: 800201
            srai         a0, a0, 24                            # 1c13: 000831
            bge          a3, a0, .Lbr163                       # 1c16: 07a304
            movi         a2, 80 /* 0x00000050 */               # 1c19: 5c02
            j            .Lbr164                               # 1c1b: 460300
.Lbr163:    movi         a3, 16 /* 0x00000010 */               # 1c1e: 1c03
            bge          a3, a0, .Lbr165                       # 1c20: 07a30f
            movi         a4, 127 /* 0x0000007f */              # 1c23: 42a07f
            beq          a2, a4, .Lbr165                       # 1c26: 471209
            movi         a2, 160 /* 0x000000a0 */              # 1c29: 22a0a0
.Lbr164:    l32i         a0, sp, 0 /* [(local0)] */            # 1c2c: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1c2e: 12c110
            ret                                                # 1c31: 0df0
.Lbr165:    movi         a2, 240 /* 0x000000f0 */              # 1c33: 22a0f0
            j            .Lbr164                               # 1c36: 86fcff

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Label008:  .word        0x00000a77                            #    0: 770a0000
.Lstr001:   .asciz       "sleep %s"                            #    4: 736c6565
                                                               #    8: 70202573
                                                               #    c: 00
            .balign      4
.Lstr002:   .asciz       "disable"                             #   10: 64697361
                                                               #   14: 626c6500
.Lstr003:   .asciz       "enable"                              #   18: 656e6162
                                                               #   1c: 6c6500
            .balign      4
.Lstr004:   .asciz       "\n light sleep is not supported now \n" #   20: 0a206c69
                                                               #   24: 67687420
                                                               #   28: 736c6565
                                                               #   2c: 70206973
                                                               #   30: 206e6f74
                                                               #   34: 20737570
                                                               #   38: 706f7274
                                                               #   3c: 6564206e
                                                               #   40: 6f77200a
                                                               #   44: 00
            .balign      4
.Lstr005:   .asciz       ",type: %d"                           #   48: 2c747970
                                                               #   4c: 653a2025
                                                               #   50: 6400
            .balign      4
.Label009:  .word        0x0000000a                            #   54: 0a000000
.Lstr006:   .asciz       "%s %u\n"                             #   58: 25732025
                                                               #   5c: 750a00
            .balign      4
.Lstr007:   .asciz       "pm.c"                                #   60: 706d2e63
                                                               #   64: 00
            .balign      4
.Lstr008:   .asciz       "pm wakeup st: %d, cause: %d\n"       #   68: 706d2077
                                                               #   6c: 616b6575
                                                               #   70: 70207374
                                                               #   74: 3a202564
                                                               #   78: 2c206361
                                                               #   7c: 7573653a
                                                               #   80: 2025640a
                                                               #   84: 00
            .balign      4
.Lstr009:   .asciz       "c_dt1\n"                             #   88: 635f6474
                                                               #   8c: 310a00
            .balign      4
.Lstr010:   .asciz       "o_dt1\n"                             #   90: 6f5f6474
                                                               #   94: 310a00
            .balign      4
.Lstr011:   .asciz       "SET IDLE CB\n"                       #   98: 53455420
                                                               #   9c: 49444c45
                                                               #   a0: 2043420a
                                                               #   a4: 00
            .balign      4
.Lstr012:   .asciz       "why %u %u %u %u\n"                   #   a8: 77687920
                                                               #   ac: 25752025
                                                               #   b0: 75202575
                                                               #   b4: 2025750a
                                                               #   b8: 00
            .balign      4
.Lstr013:   .asciz       "c_dt2\n"                             #   bc: 635f6474
                                                               #   c0: 320a00
            .balign      4
.Label010:  .byte        0x6f, 0x5f, 0x64, 0x74, 0x32, 0x0a, 0x00, 0x00
            .byte        0x25, 0x75, 0x20, 0x25, 0x75, 0x20, 0x25, 0x75
            .byte        0x20, 0x25, 0x75, 0x0a, 0x00, 0x00, 0x00, 0x00
.Lstr014:   .asciz       "c_dt3\n"                             #   dc: 635f6474
                                                               #   e0: 330a00
            .balign      4
.Lstr015:   .asciz       "o_dt3\n"                             #   e4: 6f5f6474
                                                               #   e8: 330a00
            .balign      4
.Lstr016:   .asciz       "SEND NULL Sleep\n"                   #   ec: 53454e44
                                                               #   f0: 204e554c
                                                               #   f4: 4c20536c
                                                               #   f8: 6565700a
                                                               #   fc: 00
            .balign      4
.Lstr017:   .asciz       "rf close,nulldata_send fail"         #  100: 72662063
                                                               #  104: 6c6f7365
                                                               #  108: 2c6e756c
                                                               #  10c: 6c646174
                                                               #  110: 615f7365
                                                               #  114: 6e642066
                                                               #  118: 61696c00
.Lstr018:   .asciz       "SEND NULL Wake\n"                    #  11c: 53454e44
                                                               #  120: 204e554c
                                                               #  124: 4c205761
                                                               #  128: 6b650a00
.Lstr019:   .asciz       "rf close,nulldata_false"             #  12c: 72662063
                                                               #  130: 6c6f7365
                                                               #  134: 2c6e756c
                                                               #  138: 6c646174
                                                               #  13c: 615f6661
                                                               #  140: 6c736500
.Lstr020:   .asciz       "Waked\n"                             #  144: 57616b65
                                                               #  148: 640a00
            .balign      4
.Lstr021:   .asciz       "c_dt4\n"                             #  14c: 635f6474
                                                               #  150: 340a00
            .balign      4
.Lstr022:   .asciz       "START WAKE UP\n"                     #  154: 53544152
                                                               #  158: 54205741
                                                               #  15c: 4b452055
                                                               #  160: 500a00
            .balign      4
.Lstr023:   .asciz       "c_dt5\n"                             #  164: 635f6474
                                                               #  168: 350a00
            .balign      4
.Lstr024:   .asciz       "pm close %d %d %u/%u\n"              #  16c: 706d2063
                                                               #  170: 6c6f7365
                                                               #  174: 20256420
                                                               #  178: 25642025
                                                               #  17c: 752f2575
                                                               #  180: 0a00
            .balign      4
.Lstr025:   .asciz       "pm open phy_2,type:%d %d %d\n"       #  184: 706d206f
                                                               #  188: 70656e20
                                                               #  18c: 7068795f
                                                               #  190: 322c7479
                                                               #  194: 70653a25
                                                               #  198: 64202564
                                                               #  19c: 2025640a
                                                               #  1a0: 00
            .balign      4
.Lstr026:   .asciz       "noTIM!!\n"                           #  1a4: 6e6f5449
                                                               #  1a8: 4d21210a
                                                               #  1ac: 00
            .balign      4
.Lstr027:   .asciz       "c_dt\n"                              #  1b0: 635f6474
                                                               #  1b4: 0a00
            .balign      4
.Lstr028:   .asciz       "why change %d %d\n"                  #  1b8: 77687920
                                                               #  1bc: 6368616e
                                                               #  1c0: 67652025
                                                               #  1c4: 64202564
                                                               #  1c8: 0a00
            .balign      4
.Lstr029:   .asciz       "bcn_go_slp1\n"                       #  1cc: 62636e5f
                                                               #  1d0: 676f5f73
                                                               #  1d4: 6c70310a
                                                               #  1d8: 00
            .balign      4
.Lstr030:   .asciz       "bcn_go_slp2\n"                       #  1dc: 62636e5f
                                                               #  1e0: 676f5f73
                                                               #  1e4: 6c70320a
                                                               #  1e8: 00
            .balign      4
.Lstr031:   .asciz       "offST%d"                             #  1ec: 6f666653
                                                               #  1f0: 54256400
.Lstr032:   .asciz       "GO_TO_SLEEP\n"                       #  1f4: 474f5f54
                                                               #  1f8: 4f5f534c
                                                               #  1fc: 4545500a
                                                               #  200: 00
            .balign      4
.Lstr033:   .asciz       "onST%d\n"                            #  204: 6f6e5354
                                                               #  208: 25640a00
.Lstr034:   .asciz       "NULL Sleep SENT CB\n"                #  20c: 4e554c4c
                                                               #  210: 20536c65
                                                               #  214: 65702053
                                                               #  218: 454e5420
                                                               #  21c: 43420a00
.Lstr035:   .asciz       "1tx_st:%d,%x\n"                      #  220: 3174785f
                                                               #  224: 73743a25
                                                               #  228: 642c2578
                                                               #  22c: 0a00
            .balign      4
.Lstr036:   .asciz       "NULL Wake SENT CB\n"                 #  230: 4e554c4c
                                                               #  234: 2057616b
                                                               #  238: 65205345
                                                               #  23c: 4e542043
                                                               #  240: 420a00
            .balign      4
.Lstr037:   .asciz       "MISS BCN\n"                          #  244: 4d495353
                                                               #  248: 2042434e
                                                               #  24c: 0a00
            .balign      4
.Lstr038:   .asciz       "dream_timout\n"                      #  250: 64726561
                                                               #  254: 6d5f7469
                                                               #  258: 6d6f7574
                                                               #  25c: 0a00
            .balign      4
.Lstr039:   .asciz       "null data timeout\n"                 #  260: 6e756c6c
                                                               #  264: 20646174
                                                               #  268: 61207469
                                                               #  26c: 6d656f75
                                                               #  270: 740a00
            .balign      4
.Lstr040:   .asciz       "pmTask"                              #  274: 706d5461
                                                               #  278: 736b00
            .balign      4
.Lstr041:   .asciz       "pm_task_hdl : %x, prio:%d, stack:%d\n" #  27c: 706d5f74
                                                               #  280: 61736b5f
                                                               #  284: 68646c20
                                                               #  288: 3a202578
                                                               #  28c: 2c207072
                                                               #  290: 696f3a25
                                                               #  294: 642c2073
                                                               #  298: 7461636b
                                                               #  29c: 3a25640a
                                                               #  2a0: 00
            .balign      4
.Lstr042:   .asciz       "NULL Sleep SEND done\n"              #  2a4: 4e554c4c
                                                               #  2a8: 20536c65
                                                               #  2ac: 65702053
                                                               #  2b0: 454e4420
                                                               #  2b4: 646f6e65
                                                               #  2b8: 0a00
            .balign      4
.Lstr043:   .asciz       "NULL Wake SEND done\n"               #  2bc: 4e554c4c
                                                               #  2c0: 2057616b
                                                               #  2c4: 65205345
                                                               #  2c8: 4e442064
                                                               #  2cc: 6f6e650a
                                                               #  2d0: 00
            .balign      4
.Label011:  .word        0x000a6c73                            #  2d4: 736c0a00
.Lstr044:   .asciz       "usl\n"                               #  2d8: 75736c0a
                                                               #  2dc: 00
            .balign      4
.Lstr045:   .asciz       "sul %d %d\n"                         #  2e0: 73756c20
                                                               #  2e4: 25642025
                                                               #  2e8: 640a00
            .balign      4
.Lstr046:   .asciz       "pm evt1 NULL\n"                      #  2ec: 706d2065
                                                               #  2f0: 76743120
                                                               #  2f4: 4e554c4c
                                                               #  2f8: 0a00
            .balign      4
.Lstr047:   .asciz       "PMQF"                                #  2fc: 504d5146
                                                               #  300: 00
            .balign      4
.Lstr048:   .asciz       "pm_sig: %x\n"                        #  304: 706d5f73
                                                               #  308: 69673a20
                                                               #  30c: 25780a00
.Lstr049:   .asciz       "SLEEP SIG\n"                         #  310: 534c4545
                                                               #  314: 50205349
                                                               #  318: 470a00
            .balign      4
.Lstr050:   .asciz       "WAKE SIG\n"                          #  31c: 57414b45
                                                               #  320: 20534947
                                                               #  324: 0a00

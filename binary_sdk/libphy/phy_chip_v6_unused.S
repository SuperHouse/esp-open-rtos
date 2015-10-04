
            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
            .balign      4
            .literal_position
            .global      sdk_chip_v6_set_sense
            .type        sdk_chip_v6_set_sense, @function
sdk_chip_v6_set_sense:
            ret           /* arg0 */                           #    0: 0df0

            .balign      4
# Function @ .irom0.text+0x4
            .balign      4
            .global      sdk_chip_v6_get_sense
            .type        sdk_chip_v6_get_sense, @function
sdk_chip_v6_get_sense:
            ret           /* arg0 */                           #    4: 0df0

            .balign      4
# Function @ .irom0.text+0x8
            .balign      4
            .global      sdk_chip_v6_unset_chanfreq
            .type        sdk_chip_v6_unset_chanfreq, @function
sdk_chip_v6_unset_chanfreq:
            movi         a2, 0 /* 0x00000000 */                #    8: 0c02
            ret           /* 0x00000000 */                     #    a: 0df0

            .literal_position                                  #    c: 00000000
                                                               #   10: 00000000
                                                               #   14: 00000000
                                                               #   18: 00000000
                                                               #   1c: 000e0060
                                                               #   20: 00000000
                                                               #   24: 00000000
                                                               #   28: 00000000
                                                               #   2c: 00000000

# Function @ .irom0.text+0x30
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
            .global      sdk_data_collect
            .type        sdk_data_collect, @function
sdk_data_collect:
            movi         a2, .Label001                         #   30: 21f7ff
            addi         sp, sp, -32 /* (local0) */            #   33: 12c1e0
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   #   36: c951
            s32i         a13, sp, 24 /* a13 -> [(local6)] */   #   38: d961
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     #   3a: 0941
            call0        ets_printf                            #   3c: 01f9ffc0
                                                               #   40: 0000
            movi         a2, sdk_chip6_sleep_params            #   42: 21f3ff
            movi         a3, sdk_chip6_sleep_params+0x168      #   45: 31f3ff
            movi         a4, 0 /* 0x00000000 */                #   48: 0c04
            call0        sdk_rtc_mem_backup                    #   4a: 01f6ffc0
                                                               #   4e: 0000
            movi         a3, 1 /* 0x00000001 */                #   50: 0c13
            movi         a4, 5 /* 0x00000005 */                #   52: 0c54
            movi         a5, 7 /* 0x00000007 */                #   54: 0c75
            movi         a13, sdk_g_phyFuns                    #   56: d1f0ff
            movi         a6, 0 /* 0x00000000 */                #   59: 0c06
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #   5b: 080d
            mov          a12, a2                               #   5d: cd02
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #   5f: 022025
            movi         a2, 98 /* 0x00000062 */               #   62: 22a062
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #   65: c00000
            movi         a3, 1 /* 0x00000001 */                #   68: 0c13
            movi         a4, 6 /* 0x00000006 */                #   6a: 0c64
            movi         a5, 4 /* 0x00000004 */                #   6c: 0c45
            movi         a6, 0 /* 0x00000000 */                #   6e: 0c06
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #   70: 080d
            s32i         a2, sp, 8 /* a2 -> [(local2)] */      #   72: 2921
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #   74: 022025
            movi         a2, 98 /* 0x00000062 */               #   77: 22a062
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #   7a: c00000
            movi         a3, 4 /* 0x00000004 */                #   7d: 0c43
            movi         a4, 3 /* 0x00000003 */                #   7f: 0c34
            movi         a5, 4 /* 0x00000004 */                #   81: 0c45
            movi         a6, 0 /* 0x00000000 */                #   83: 0c06
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #   85: 080d
            s32i         a2, sp, 12 /* a2 -> [(local3)] */     #   87: 2931
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #   89: 022025
            movi         a2, 103 /* 0x00000067 */              #   8c: 22a067
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #   8f: c00000
            movi         a3, 1 /* 0x00000001 */                #   92: 0c13
            movi         a4, 2 /* 0x00000002 */                #   94: 0c24
            movi         a5, 4 /* 0x00000004 */                #   96: 0c45
            movi         a6, 0 /* 0x00000000 */                #   98: 0c06
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #   9a: 080d
            mov          a13, a2                               #   9c: dd02
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #   9e: 022025
            movi         a2, 97 /* 0x00000061 */               #   a1: 22a061
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #   a4: c00000
            slli         a4, a2, 24                            #   a7: 804201
            slli         a3, a13, 16                           #   aa: 003d11
            l32i         a2, sp, 8 /* [(local2)] */            #   ad: 2821
            or           a3, a3, a4                            #   af: 403320
            l32i         a4, sp, 12 /* [(local3)] */           #   b2: 4831
            extui        a2, a2, 0, 8                          #   b4: 202074
            extui        a4, a4, 0, 8                          #   b7: 404074
            slli         a4, a4, 8                             #   ba: 804411
            or           a2, a2, a4                            #   bd: 402220
            mov          a4, a12                               #   c0: 4d0c
            or           a2, a2, a3                            #   c2: 302220
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #   c5: 2901
            mov          a3, sp /* (local0) */                 #   c7: 3d01
            mov          a2, sp /* (local0) */                 #   c9: 2d01
            call0        sdk_rtc_mem_backup                    #   cb: 01d7ffc0
                                                               #   cf: 0000
            movi         a5, 0x60000e00                        #   d1: 51d2ff
            memw                                               #   d4: c02000
            addi         a3, sp, 4 /* (local1) */              #   d7: 4b31
            add          a12, a12, a2                          #   d9: 2acc
            l32i         a5, a5, 0x3fc /* [0x600011fc] */      #   db: 5225ff
            s32i         a5, sp, 4 /* [0x600011fc] -> [(local1)] */ #   de: 5911
            addi         a2, sp, 4 /* (local1) */              #   e0: 4b21
            mov          a4, a12                               #   e2: 4d0c
            call0        sdk_rtc_mem_backup                    #   e4: 01d2ffc0
                                                               #   e8: 0000
            l32i         a0, sp, 16 /* [(local4)] */           #   ea: 0841
            add          a2, a2, a12                           #   ec: ca22
            l32i         a13, sp, 24 /* [(local6)] */          #   ee: d861
            l32i         a12, sp, 20 /* [(local5)] */          #   f0: c851
            addi         sp, sp, 32 /* (top of frame) */       #   f2: 12c120
            ret                                                #   f5: 0df0

            .literal_position                                  #   f8: 000af23f
                                                               #   fc: aa5555aa
                                                               #  100: 890f0000
                                                               #  104: ac540000
                                                               #  108: 20110000
                                                               #  10c: 6c0d0000
                                                               #  110: 00000000
                                                               #  114: 00000000
                                                               #  118: 00000000
                                                               #  11c: 00000000

# Function @ .irom0.text+0x120
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_operation_test
            .type        sdk_operation_test, @function
sdk_operation_test:
            addi         sp, sp, -16 /* (local0) */            #  120: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  123: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  125: d921
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  127: 0901
            movi         a2, 0x3ff20a00                        #  129: 21f3ff
            memw                                               #  12c: c02000
            movi         a3, 0x00000f89                        #  12f: 31f4ff
            movi         a4, 1234 /* 0x000004d2 */             #  132: 42a4d2
            l32i         a2, a2, 0x200 /* [0x3ff20c00] */      #  135: 222280
            movi         a5, 0xaa5555aa                        #  138: 51f1ff
            add          a4, a2, a4 /* [0x3ff20c00]+0x4d2 */   #  13b: 4a42
            xor          a4, a4, a5                            #  13d: 504430
            mull         a2, a2, a4                            #  140: 402282
            mull         a2, a2, a3                            #  143: 302282
            movi         a3, 0x000054ac                        #  146: 31efff
            call0        __udivsi3                             #  149: 01f1ffc0
                                                               #  14d: 0000
            movi         a3, 0x00001120                        #  14f: 31eeff
            mull         a2, a2, a3                            #  152: 302282
            movi         a3, 0x00000d6c                        #  155: 31edff
            call0        __udivsi3                             #  158: 01efffc0
                                                               #  15c: 0000
            movi         a12, 0 /* 0x00000000 */               #  15e: 0c0c
            movi         a13, 1000 /* 0x000003e8 */            #  160: d2a3e8
.Lbr001:    movi         a3, 999 /* 0x000003e7 */              #  163: 32a3e7
            call0        __udivsi3                             #  166: 01ecffc0
                                                               #  16a: 0000
            addi         a12, a12, 1                           #  16c: 1bcc
            movi         a4, 1120 /* 0x00000460 */             #  16e: 42a460
            mull         a2, a2, a4                            #  171: 402282
            bne          a12, a13, .Lbr001                     #  174: d79ceb
            movi         a12, 0 /* 0x00000000 */               #  177: 0c0c
.Lbr002:    movi         a3, 985 /* 0x000003d9 */              #  179: 32a3d9
            movi         a5, 860 /* 0x0000035c */              #  17c: 52a35c
            mull         a2, a2, a5                            #  17f: 502282
            call0        __udivsi3                             #  182: 01e6ffc0
                                                               #  186: 0000
            addi         a12, a12, 1                           #  188: 1bcc
            bne          a12, a13, .Lbr002                     #  18a: d79ceb
            l32i         a12, sp, 4 /* [(local1)] */           #  18d: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  18f: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  191: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  193: 12c110
            ret                                                #  196: 0df0

            .literal_position                                  #  198: 00060060

# Function @ .irom0.text+0x19c
            .balign      4
            .global      sdk_slop_wdt_feed
            .type        sdk_slop_wdt_feed, @function
sdk_slop_wdt_feed:
            movi         a2, 115 /* 0x00000073 */              #  19c: 22a073
            movi         a3, 0x60000600                        #  19f: 31feff
            memw                                               #  1a2: c02000
            s32i         a2, a3, 0x314 /* 0x00000073 -> [0x60000914] */ #  1a5: 2263c5
            ret           /* 0x00000073 */                     #  1a8: 0df0

            .literal_position                                  #  1ac: 04000000
                                                               #  1b0: 00feef3f
                                                               #  1b4: 00000000
                                                               #  1b8: 000af23f
                                                               #  1bc: 00060060
                                                               #  1c0: 00000000
                                                               #  1c4: 00000000
                                                               #  1c8: 00000000
                                                               #  1cc: 00000000
                                                               #  1d0: 00000000
                                                               #  1d4: 00000000
                                                               #  1d8: 00000000
                                                               #  1dc: 00000000

# Function @ .irom0.text+0x1e0
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      sdk_slop_test
            .type        sdk_slop_test, @function
sdk_slop_test:
            movi         a2, .Lstr001                          #  1e0: 21f3ff
            addi         sp, sp, -32 /* (local0) */            #  1e3: 12c1e0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  1e6: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  1e8: d921
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  1ea: e931
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  1ec: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  1ee: 0901
            call0        ets_printf                            #  1f0: 01f4ffc0
                                                               #  1f4: 0000
            movi         a10, 1 /* 0x00000001 */               #  1f6: 0c1a
            movi         a9, 0x3feffe00                        #  1f8: 91eeff
            memw                                               #  1fb: c02000
            l32i         a8, a9, 0x214 /* [0x3ff00014] */      #  1fe: 822985
            or           a8, a8, a10                           #  201: a08820
            memw                                               #  204: c02000
            movi         a2, 106 /* 0x0000006a */              #  207: 22a06a
            movi         a3, 2 /* 0x00000002 */                #  20a: 0c23
            movi         a4, 8 /* 0x00000008 */                #  20c: 0c84
            movi         a5, 4 /* 0x00000004 */                #  20e: 0c45
            movi         a0, sdk_g_phyFuns                     #  210: 01e9ff
            movi         a6, 0 /* 0x00000000 */                #  213: 0c06
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  215: 0800
            movi         a7, 0 /* 0x00000000 */                #  217: 0c07
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  219: 022027
            s32i         a8, a9, 0x214 /* a8 -> [0x3ff00014] */ #  21c: 826985
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  21f: c00000
            movi         a12, 0x3ff20a00                       #  222: c1e5ff
            memw                                               #  225: c02000
            l32i         a11, a12, 0x200 /* [0x3ff20c00] */    #  228: b22c80
            movi         a2, 14 /* 0x0000000e */               #  22b: 0ce2
            call0        sdk_RFChannelSel                      #  22d: 01e5ffc0
                                                               #  231: 0000
            movi         a13, 0 /* 0x00000000 */               #  233: 0c0d
            movi         a14, 0x60000600                       #  235: e1e1ff
            movi         a15, 200 /* 0x000000c8 */             #  238: f2a0c8
.Lbr003:    call0        sdk_slop_wdt_feed                     #  23b: 050000
            call0        sdk_operation_test                    #  23e: 050000
            memw                                               #  241: c02000
            s32i         a2, a14, 0x138 /* a2 -> [0x60000738] */ #  244: 226e4e
            movi         a2, 2 /* 0x00000002 */                #  247: 0c22
            call0        sdk_pm_set_sleep_mode                 #  249: 01dfffc0
                                                               #  24d: 0000
            movi         a2, 8 /* 0x00000008 */                #  24f: 0c82
            movi         a3, 0 /* 0x00000000 */                #  251: 0c03
            call0        sdk_pm_wakeup_opt                     #  253: 01deffc0
                                                               #  257: 0000
            movi         a2, 170 /* 0x000000aa */              #  259: 22a0aa
            call0        sdk_pm_set_sleep_cycles               #  25c: 01ddffc0
                                                               #  260: 0000
            memw                                               #  262: c02000
            movi         a2, 2 /* 0x00000002 */                #  265: 0c22
            l32i         a0, a12, 0x200 /* [0x3ff20c00] */     #  267: 022c80
            call0        sdk_pm_goto_sleep                     #  26a: 01daffc0
                                                               #  26e: 0000
            movi         a2, 2 /* 0x00000002 */                #  270: 0c22
            call0        sdk_pm_wait4wakeup                    #  272: 01d9ffc0
                                                               #  276: 0000
            movi         a2, 2 /* 0x00000002 */                #  278: 0c22
            movi         a3, 0 /* 0x00000000 */                #  27a: 0c03
            call0        sdk_pm_wakeup_init                    #  27c: 01d8ffc0
                                                               #  280: 0000
            memw                                               #  282: c02000
            l32i         a3, a12, 0x200 /* [0x3ff20c00] */     #  285: 322c80
            addi         a13, a13, 1                           #  288: 1bdd
            bne          a13, a15, .Lbr003                     #  28a: f79dad
            l32i         a12, sp, 4 /* [(local1)] */           #  28d: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  28f: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  291: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  293: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  295: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  297: 12c120
            ret                                                #  29a: 0df0

            .literal_position                                  #  29c: 000e0060
                                                               #  2a0: 10000000
                                                               #  2a4: 10000000
                                                               #  2a8: 00000000
                                                               #  2ac: 00000000
                                                               #  2b0: 00000000

# Function @ .irom0.text+0x2b4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wd_reset_cnt
            .type        sdk_wd_reset_cnt, @function
sdk_wd_reset_cnt:
            addi         sp, sp, -16 /* (local0) */            #  2b4: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  2b7: 0901
            call0        sdk_rtc_get_reset_reason              #  2b9: 01fbffc0
                                                               #  2bd: 0000
            movi         a0, 0x60000e00                        #  2bf: 01f7ff
            bnei         a2, 4, .Lbr004                        #  2c2: 664219
            memw                                               #  2c5: c02000
            l32i         a3, a0, 0x3fc /* [0x600011fc] */      #  2c8: 3220ff
            addi         a3, a3, 1 /* [0x600011fc]+0x1 */      #  2cb: 1b33
            memw                                               #  2cd: c02000
            movi         a2, .Lstr002                          #  2d0: 21f4ff
            s32i         a3, a0, 0x3fc /* [0x600011fc]+0x1 -> [0x600011fc] */ #  2d3: 3260ff
            call0        ets_printf                            #  2d6: 01f5ffc0
                                                               #  2da: 0000
            j            .Lbr006                               #  2dc: 860500
.Lbr004:    beqi         a2, 2, .Lbr005                        #  2df: 262202
            bnei         a2, 1, .Lbr006                        #  2e2: 661210
.Lbr005:    movi         a3, 0 /* 0x00000000 */                #  2e5: 0c03
            memw                                               #  2e7: c02000
            movi         a2, .Lstr002                          #  2ea: 21eeff
            s32i         a3, a0, 0x3fc /* 0x00000000 -> [0x600011fc] */ #  2ed: 3260ff
            call0        ets_printf                            #  2f0: 01f0ffc0
                                                               #  2f4: 0000
.Lbr006:    l32i         a0, sp, 0 /* [(local0)] */            #  2f6: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  2f8: 12c110
            ret                                                #  2fb: 0df0

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Label001:  .word        0x000a6364                            #    0: 64630a00
.Lstr001:   .asciz       "slop_test\n"                         #    4: 736c6f70
                                                               #    8: 5f746573
                                                               #    c: 740a00
            .balign      4
.Lstr002:   .asciz       "wd_reset %d\n"                       #   10: 77645f72
                                                               #   14: 65736574
                                                               #   18: 2025640a
                                                               #   1c: 00

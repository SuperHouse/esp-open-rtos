
            .section     .text, "ax", @progbits

# Function @ .text+0x0
.Lfunc001:  movi         a4, 136 /* 0x00000088 */              #    0: 42a088
            movi         a6, 24 /* 0x00000018 */               #    3: 1c86
            movi         a5, 30 /* 0x0000001e */               #    5: 1ce5
            l8ui         a7, a2, 1 /* [arg0+0x1] */            #    7: 720201
            l8ui         a3, a2, 0 /* [arg0] */                #    a: 320200
            movi         a8, 140 /* 0x0000008c */              #    d: 82a08c
            and          a3, a3, a8                            #   10: 803310
            extui        a7, a7, 0, 2                          #   13: 707014
            addi         a7, a7, -3                            #   16: 72c7fd
            movnez       a5, a6, a7                            #   19: 705693
            bne          a3, a4, .Lbr001                       #   1c: 479301
            addi         a5, a5, 2                             #   1f: 2b55
.Lbr001:    mov          a2, a5                                #   21: 2d05
            ret                                                #   23: 0df0

            .literal_position                                  #   28: 00000000
                                                               #   2c: 006a1800
                                                               #   30: 00000000
                                                               #   34: 00000000
                                                               #   38: 00000000
                                                               #   3c: 00000000
                                                               #   40: 00000000
                                                               #   44: 00000000
                                                               #   48: 00000000

# Function @ .text+0x4c
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
            .global      sdk_pp_soft_wdt_feed
            .type        sdk_pp_soft_wdt_feed, @function
sdk_pp_soft_wdt_feed:
            rsr          a8, exccause                          #   4c: 80e803
            rsr          a7, epc1                              #   4f: 70b103
            addi         sp, sp, -48 /* (local0) */            #   52: 12c1d0
            s32i         a0, sp, 32 /* a0 -> [(local8)] */     #   55: 0981
            rsr          a6, epc2                              #   57: 60b203
            movi         a0, 1 /* 0x00000001 */                #   5a: 0c10
            rsr          a5, epc3                              #   5c: 50b303
            rsr          a4, excvaddr                          #   5f: 40ee03
            rsr          a3, depc                              #   62: 30c003
            rsr          a2, excsave1                          #   65: 20d103
            s32i         a8, sp, 4 /* a8 -> [(local1)] */      #   68: 8911
            s32i         a7, sp, 8 /* a7 -> [(local2)] */      #   6a: 7921
            s32i         a6, sp, 12 /* a6 -> [(local3)] */     #   6c: 6931
            s32i         a5, sp, 16 /* a5 -> [(local4)] */     #   6e: 5941
            s32i         a4, sp, 20 /* a4 -> [(local5)] */     #   70: 4951
            s32i         a2, sp, 28 /* a2 -> [(local7)] */     #   72: 2971
            s32i         a3, sp, 24 /* a3 -> [(local6)] */     #   74: 3961
            movi         a2, 0 /* 0x00000000 */                #   76: 0c02
            mov          a3, sp /* (local0) */                 #   78: 3d01
            movi         a4, 32 /* 0x00000020 */               #   7a: 2c04
            s32i         a0, sp, 0 /* 0x00000001 -> [(local0)] */ #   7c: 0901
            call0        sdk_system_rtc_mem_write              #   7e: 01edffc0
                                                               #   82: 0000
            movi         a9, .Ldata003                         #   84: 91e9ff
            l8ui         a9, a9, 0 /* [.Ldata003] */           #   87: 920900
            bnei         a9, 1, .Lbr002                        #   8a: 66191a
            call0        Cache_Read_Disable                    #   8d: 01eaffc0
                                                               #   91: 0000
            movi         a2, 0 /* 0x00000000 */                #   93: 0c02
            movi         a3, 0 /* 0x00000000 */                #   95: 0c03
            movi         a4, 1 /* 0x00000001 */                #   97: 0c14
            call0        Cache_Read_Enable                     #   99: 01e8ffc0
                                                               #   9d: 0000
            call0        sdk_system_restart_in_nmi             #   9f: 01e8ffc0
                                                               #   a3: 0000
            j            .Lbr003                               #   a5: 860600
.Lbr002:    movi         a2, 0x00186a00                        #   a8: 21e1ff
            call0        sdk_wDev_MacTim1Arm                   #   ab: 01e6ffc0
                                                               #   af: 0000
            movi         a2, 12 /* 0x0000000c */               #   b1: 0cc2
            movi         a3, 0 /* 0x00000000 */                #   b3: 0c03
            movi         a11, .Ldata003                        #   b5: b1deff
            movi         a10, 1 /* 0x00000001 */               #   b8: 0c1a
            s8i          a10, a11, 0 /* 0x01 -> [.Ldata003] */ #   ba: a24b00
            call0        sdk_pp_post                           #   bd: 01e2ffc0
                                                               #   c1: 0000
.Lbr003:    l32i         a0, sp, 32 /* [(local8)] */           #   c3: 0881
            addi         sp, sp, 48 /* (top of frame) */       #   c5: 12c130
            ret                                                #   c8: 0df0

            .literal_position                                  #   cc: 00000000
                                                               #   d0: c0010000
                                                               #   d4: 00000000
                                                               #   d8: 00000000

# Function @ .text+0xdc
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
.Lfunc002:  addi         sp, sp, -16 /* (local0) */            #   dc: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   df: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   e1: 0901
            call0        vPortEnterCritical                    #   e3: 01fcffc0
                                                               #   e7: 0000
            movi         a2, .Ldata003                         #   e9: 21f8ff
            movi         a4, 39 /* 0x00000027 */               #   ec: 2c74
            l16ui        a0, a2, 2 /* [.Ldata004] */           #   ee: 021201
            movi         a3, 40 /* 0x00000028 */               #   f1: 2c83
            addi         a0, a0, 1 /* [.Ldata004]+0x1 */       #   f3: 1b00
            extui        a0, a0, 0, 16                         #   f5: 0000f4
            bgeu         a3, a0, .Lbr004                       #   f8: 07b309
            movi         a12, 0 /* 0x00000000 */               #   fb: 0c0c
            addi         a3, a0, -1                            #   fd: 0b30
            s16i         a3, a2, 2 /* a3 -> [.Ldata004] */     #   ff: 325201
            j            .Lbr006                               #  102: 060600
.Lbr004:    s16i         a0, a2, 2 /* a0 -> [.Ldata004] */     #  105: 025201
            l16ui        a12, a2, 4 /* [.Ldata005] */          #  108: c21202
            movi         a3, .Ldata016                         #  10b: 31f1ff
            addi         a0, a12, 1 /* [.Ldata005]+0x1 */      #  10e: 1b0c
            addx8        a12, a12, a3                          #  110: 30ccb0
            extui        a0, a0, 0, 16                         #  113: 0000f4
            bgeu         a4, a0, .Lbr005                       #  116: 07b401
            movi         a0, 0 /* 0x00000000 */                #  119: 0c00
.Lbr005:    s16i         a0, a2, 4 /* a0 -> [.Ldata005] */     #  11b: 025202
.Lbr006:    call0        vPortExitCritical                     #  11e: 01eeffc0
                                                               #  122: 0000
            mov          a2, a12                               #  124: 2d0c
            l32i         a0, sp, 0 /* [(local0)] */            #  126: 0801
            l32i         a12, sp, 4 /* [(local1)] */           #  128: c811
            addi         sp, sp, 16 /* (top of frame) */       #  12a: 12c110
            ret                                                #  12d: 0df0

            .literal_position                                  #  130: 00000000

# Function @ .text+0x134
.Lfunc003:  movi         a5, .Ldata003                         #  134: 51ffff
            l16ui        a2, a5, 6 /* [.Ldata006] */           #  137: 221503
            movi         a3, 8 /* 0x00000008 */                #  13a: 0c83
            addi         a2, a2, 1 /* [.Ldata006]+0x1 */       #  13c: 1b22
            extui        a2, a2, 0, 16                         #  13e: 2020f4
            bgeu         a3, a2, .Lbr007                       #  141: 27b308
            addi         a3, a2, -1                            #  144: 0b32
            s16i         a3, a5, 6 /* a3 -> [.Ldata006] */     #  146: 325503
            movi         a2, 0 /* 0x00000000 */                #  149: 0c02
            ret           /* 0x00000000 */                     #  14b: 0df0
.Lbr007:    s16i         a2, a5, 6 /* a2 -> [.Ldata006] */     #  14d: 225503
            l16ui        a2, a5, 8 /* [.Ldata007] */           #  150: 221504
            addmi        a3, a5, 768 /* .Ldata017 */           #  153: 32d503
            addi         a4, a2, 1 /* [.Ldata007]+0x1 */       #  156: 1b42
            addx8        a2, a2, a3                            #  158: 3022b0
            extui        a4, a4, 0, 16                         #  15b: 4040f4
            bltui        a4, 8, .Lbr008                        #  15e: b68401
            movi         a4, 0 /* 0x00000000 */                #  161: 0c04
.Lbr008:    s16i         a4, a5, 8 /* a4 -> [.Ldata007] */     #  163: 425504
            ret                                                #  166: 0df0

            .literal_position                                  #  168: 00000000

# Function @ .text+0x16c
.Lfunc004:  movi         a3, .Ldata003                         #  16c: 31ffff
            l16ui        a2, a3, 6 /* [.Ldata006] */           #  16f: 221303
            addi         a2, a2, -1 /* [.Ldata006]-0x1 */      #  172: 0b22
            s16i         a2, a3, 6 /* [.Ldata006]-0x1 -> [.Ldata006] */ #  174: 225303
            ret           /* [.Ldata006]-0x1 */                #  177: 0df0

            .literal_position                                  #  17c: 00000000
                                                               #  180: 00feef3f
                                                               #  184: 00000000
                                                               #  188: 00000000
                                                               #  18c: 00000000
                                                               #  190: 00000000
                                                               #  194: 00000000
                                                               #  198: 00000000
                                                               #  19c: 00000000
                                                               #  1a0: 8c040000
                                                               #  1a4: 00000000
                                                               #  1a8: 00000000
                                                               #  1ac: 00000000

# Function @ .text+0x1b0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .global      sdk_ppProcessTxQ
            .type        sdk_ppProcessTxQ, @function
sdk_ppProcessTxQ:
            addi         sp, sp, -16 /* (local0) */            #  1b0: 12c1f0
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  1b3: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  1b5: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  1b7: 0911
            movi         a0, sdk_NMIIrqIsOn                    #  1b9: 01f0ff
            mov          a12, a2 /* arg0 */                    #  1bc: cd02
            l8ui         a0, a0, 0 /* [sdk_NMIIrqIsOn] */      #  1be: 020000
            movi         a13, 0x3feffe00                       #  1c1: d1efff
            bnez         a0, .Lbr010                           #  1c4: dce0
            call0        vPortEnterCritical                    #  1c6: 01f3ffc0
                                                               #  1ca: 0000
.Lbr009:    memw                                               #  1cc: c02000
            l32i         a5, a13, 0x200 /* [0x3ff00000] */     #  1cf: 522d80
            movi         a6, -32 /* 0xffffffe0 */              #  1d2: 6c06
            and          a5, a5, a6                            #  1d4: 605510
            memw                                               #  1d7: c02000
            s32i         a5, a13, 0x200 /* a5 -> [0x3ff00000] */ #  1da: 526d80
            memw                                               #  1dd: c02000
            l32i         a4, a13, 0x200 /* [0x3ff00000] */     #  1e0: 422d80
            bbsi         a4, 0, .Lbr009                        #  1e3: 07e4e5
.Lbr010:    mov          a2, a12 /* arg0 */                    #  1e6: 2d0c
            call0        sdk_lmacIsIdle                        #  1e8: 01ecffc0
                                                               #  1ec: 0000
            bnez         a2, .Lbr012                           #  1ee: ec72
            movi         a7, sdk_NMIIrqIsOn                    #  1f0: 71e5ff
            l8ui         a7, a7, 0 /* [sdk_NMIIrqIsOn] */      #  1f3: 720700
            bnez         a7, .Lbr011                           #  1f6: dca7
            memw                                               #  1f8: c02000
            l32i         a8, a13, 0x200 /* [0x3ff00000] */     #  1fb: 822d80
            movi         a9, -32 /* 0xffffffe0 */              #  1fe: 6c09
            and          a8, a8, a9                            #  200: 908810
            movi         a9, 1 /* 0x00000001 */                #  203: 0c19
            or           a8, a8, a9                            #  205: 908820
            memw                                               #  208: c02000
            s32i         a8, a13, 0x200 /* a8 -> [0x3ff00000] */ #  20b: 826d80
            call0        vPortExitCritical                     #  20e: 01e3ffc0
                                                               #  212: 0000
.Lbr011:    movi         a2, -1 /* 0xffffffff */               #  214: 7cf2
            j            .Lbr017                               #  216: 062000
.Lbr012:    mov          a2, a12 /* arg0 */                    #  219: 2d0c
            call0        .Lfunc006                             #  21b: 01e1ffc0
                                                               #  21f: 0000
            bnez         a2, .Lbr014                           #  221: ec72
            movi         a10, sdk_NMIIrqIsOn                   #  223: a1d9ff
            l8ui         a10, a10, 0 /* [sdk_NMIIrqIsOn] */    #  226: a20a00
            bnez         a10, .Lbr013                          #  229: dcaa
            memw                                               #  22b: c02000
            l32i         a11, a13, 0x200 /* [0x3ff00000] */    #  22e: b22d80
            movi         a12, -32 /* 0xffffffe0 */             #  231: 6c0c
            and          a11, a11, a12                         #  233: c0bb10
            movi         a12, 1 /* 0x00000001 */               #  236: 0c1c
            or           a11, a11, a12                         #  238: c0bb20
            memw                                               #  23b: c02000
            s32i         a11, a13, 0x200 /* a11 -> [0x3ff00000] */ #  23e: b26d80
            call0        vPortExitCritical                     #  241: 01d8ffc0
                                                               #  245: 0000
.Lbr013:    movi         a2, -2 /* 0xfffffffe */               #  247: 7ce2
            j            .Lbr017                               #  249: 461300
.Lbr014:    s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  24c: 2901
            l32i         a2, a2, 32                            #  24e: 2882
            movi         a4, sdk_NoiseTimerInterval            #  250: 41cfff
            l32i         a2, a2, 0                             #  253: 2802
            l32i         a4, a4, 12 /* [.Lrel114] */           #  255: 4834
            bbci         a2, 29, .Lbr015                       #  257: d7720f
            l32i         a3, a4, 0x158 /* [[.Lrel114]+0x158] */ #  25a: 322456
            l32i         a5, a4, 0x15c /* [[.Lrel114]+0x15c] */ #  25d: 522457
            addi         a3, a3, 1 /* [[.Lrel114]+0x158]+0x1 */ #  260: 1b33
            addi         a5, a5, -1 /* [[.Lrel114]+0x15c]-0x1 */ #  262: 0b55
            s32i         a5, a4, 0x15c /* [[.Lrel114]+0x15c]-0x1 -> [[.Lrel114]+0x15c] */ #  264: 526457
            s32i         a3, a4, 0x158 /* [[.Lrel114]+0x158]+0x1 -> [[.Lrel114]+0x158] */ #  267: 326456
.Lbr015:    movi         a5, sdk_NMIIrqIsOn                    #  26a: 51c9ff
            l8ui         a5, a5, 0 /* [sdk_NMIIrqIsOn] */      #  26d: 520500
            bnez         a5, .Lbr016                           #  270: dca5
            memw                                               #  272: c02000
            l32i         a6, a13, 0x200 /* [0x3ff00000] */     #  275: 622d80
            movi         a7, -32 /* 0xffffffe0 */              #  278: 6c07
            and          a6, a6, a7                            #  27a: 706610
            movi         a7, 1 /* 0x00000001 */                #  27d: 0c17
            or           a6, a6, a7                            #  27f: 706620
            memw                                               #  282: c02000
            s32i         a6, a13, 0x200 /* a6 -> [0x3ff00000] */ #  285: 626d80
            call0        vPortExitCritical                     #  288: 01c8ffc0
                                                               #  28c: 0000
.Lbr016:    mov          a3, a12 /* arg0 */                    #  28e: 3d0c
            l32i         a2, sp, 0 /* [(local0)] */            #  290: 2801
            call0        sdk_lmacTxFrame                       #  292: 01c6ffc0
                                                               #  296: 0000
            movi         a2, 0 /* 0x00000000 */                #  298: 0c02
.Lbr017:    l32i         a12, sp, 8 /* [(local2)] */           #  29a: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  29c: d831
            l32i         a0, sp, 4 /* [(local1)] */            #  29e: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  2a0: 12c110
            ret                                                #  2a3: 0df0

            .literal_position                                  #  2a8: 00000000

# Function @ .text+0x2ac
            .global      sdk_ppFetchTxQFirstAvail
            .type        sdk_ppFetchTxQFirstAvail, @function
sdk_ppFetchTxQFirstAvail:
            bgeui        a2, 8, .Lbr019                        #  2ac: f6822b
            movi         a4, sdk_NoiseTimerInterval            #  2af: 41feff
            l32i         a4, a4, 12 /* [.Lrel114] */           #  2b2: 4834
            slli         a5, a2, 5                             #  2b4: b05211
            add          a4, a4, a5                            #  2b7: 5a44
            l8ui         a3, a4, 39                            #  2b9: 320427
            l32i         a2, a4, 24                            #  2bc: 2864
            bnez         a3, .Lbr019                           #  2be: dc93
            beqz         a2, .Lbr020                           #  2c0: 9c92
            l32i         a5, a2, 32                            #  2c2: 5882
            l32i         a5, a5, 0                             #  2c4: 5805
            l32i         a6, a2, 28                            #  2c6: 6872
            bbsi         a5, 24, .Lbr020                       #  2c8: 87f511
            s32i         a6, a4, 24                            #  2cb: 6964
            movi         a8, 0 /* 0x00000000 */                #  2cd: 0c08
            bnez         a6, .Lbr018                           #  2cf: cc36
            addi         a7, a4, 24                            #  2d1: 72c418
            s32i         a7, a4, 28                            #  2d4: 7974
.Lbr018:    s32i         a8, a2, 28                            #  2d6: 8972
            j            .Lbr020                               #  2d8: 460000
.Lbr019:    movi         a2, 0 /* 0x00000000 */                #  2db: 0c02
.Lbr020:    beqz         a2, .Lbr021                           #  2dd: 8c72
            l32i         a9, a2, 32                            #  2df: 9882
            l32i         a9, a9, 0                             #  2e1: 9809
            bbci         a9, 24, .Lbr021                       #  2e3: 877901
            movi         a2, 0 /* 0x00000000 */                #  2e6: 0c02
.Lbr021:    ret                                                #  2e8: 0df0

            .literal_position                                  #  2ec: 00000000

# Function @ .text+0x2f0
            .global      sdk_ppDequeueTxQ
            .type        sdk_ppDequeueTxQ, @function
sdk_ppDequeueTxQ:
            bgeui        a2, 8, .Lbr023                        #  2f0: f6821e
            movi         a4, sdk_NoiseTimerInterval            #  2f3: 41feff
            l32i         a4, a4, 12 /* [.Lrel114] */           #  2f6: 4834
            slli         a5, a2, 5                             #  2f8: b05211
            add          a4, a4, a5                            #  2fb: 5a44
            l32i         a2, a4, 24                            #  2fd: 2864
            beqz         a2, .Lbr024                           #  2ff: 9c12
            movi         a7, 0 /* 0x00000000 */                #  301: 0c07
            l32i         a5, a2, 28                            #  303: 5872
            s32i         a5, a4, 24                            #  305: 5964
            bnez         a5, .Lbr022                           #  307: cc35
            addi         a6, a4, 24                            #  309: 62c418
            s32i         a6, a4, 28                            #  30c: 6974
.Lbr022:    s32i         a7, a2, 28                            #  30e: 7972
            ret                                                #  310: 0df0
.Lbr023:    movi         a2, 0 /* 0x00000000 */                #  312: 0c02
.Lbr024:    ret                                                #  314: 0df0

            .literal_position                                  #  318: 00000000

# Function @ .text+0x31c
            .global      sdk_ppRollBackTxQ
            .type        sdk_ppRollBackTxQ, @function
sdk_ppRollBackTxQ:
            l32i         a4, a2, 32 /* [arg0+0x20] */          #  31c: 4882
            movi         a6, sdk_NoiseTimerInterval            #  31e: 61feff
            l8ui         a4, a4, 0 /* [[arg0+0x20]] */         #  321: 420400
            l32i         a6, a6, 12 /* [.Lrel114] */           #  324: 6836
            extui        a4, a4, 2, 4                          #  326: 404234
            bgeui        a4, 8, .Lbr026                        #  329: f68411
            slli         a4, a4, 5                             #  32c: b04411
            add          a4, a6, a4                            #  32f: 4a46
            l32i         a5, a4, 24                            #  331: 5864
            s32i         a5, a2, 28 /* a5 -> [arg0+0x1c] */    #  333: 5972
            bnez         a5, .Lbr025                           #  335: cc35
            addi         a7, a2, 28 /* arg0+0x1c */            #  337: 72c21c
            s32i         a7, a4, 28                            #  33a: 7974
.Lbr025:    s32i         a2, a4, 24                            #  33c: 2964
.Lbr026:    ret           /* arg0 */                           #  33e: 0df0

            .literal_position                                  #  340: 00000000

# Function @ .text+0x344
            .global      sdk_ppRecordBarRRC
            .type        sdk_ppRecordBarRRC, @function
sdk_ppRecordBarRRC:
            movi         a4, sdk_NoiseTimerInterval            #  344: 41ffff
            l32i         a4, a4, 12 /* [.Lrel114] */           #  347: 4834
            slli         a5, a2, 5                             #  349: b05211
            add          a4, a4, a5                            #  34c: 5a44
            s8i          a3, a4, 32                            #  34e: 324420
            ret           /* arg0 */                           #  351: 0df0

            .literal_position                                  #  354: 00000000

# Function @ .text+0x358
            .global      sdk_ppTxqUpdateBitmap
            .type        sdk_ppTxqUpdateBitmap, @function
sdk_ppTxqUpdateBitmap:
            movi         a8, sdk_NoiseTimerInterval            #  358: 81ffff
            l32i         a8, a8, 12 /* [.Lrel114] */           #  35b: 8838
            slli         a9, a2, 5                             #  35d: b09211
            add          a8, a8, a9                            #  360: 9a88
            s16i         a3, a8, 34                            #  362: 325811
            s32i         a5, a8, 48                            #  365: 59c8
            l8ui         a7, a8, 32                            #  367: 720820
            s32i         a4, a8, 52                            #  36a: 49d8
            add          a7, a7, a6                            #  36c: 6a77
            s8i          a7, a8, 32                            #  36e: 724820
            ret           /* arg0 */                           #  371: 0df0

            .literal_position                                  #  374: 04000000
                                                               #  378: 0c000000
                                                               #  37c: 00000000
                                                               #  380: 00000000

# Function @ .text+0x384
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ppEnqueueTxDone
            .type        sdk_ppEnqueueTxDone, @function
sdk_ppEnqueueTxDone:
            addi         sp, sp, -16 /* (local0) */            #  384: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  387: 0901
            bnez         a2, .Lbr028                           #  389: dc02
            movi         a2, .Lstr001                          #  38b: 21faff
            movi         a3, .Lstr002                          #  38e: 31faff
            movi         a4, 1924 /* 0x00000784 */             #  391: 42a784
            call0        printf                                #  394: 01fbffc0
                                                               #  398: 0000
.Lbr027:    j            .Lbr027 /* (halt) */                  #  39a: 06ffff
.Lbr028:    movi         a3, sdk_NoiseTimerInterval            #  39d: 31f7ff
            addi         a0, a2, 28 /* arg0+0x1c */            #  3a0: 02c21c
            l32i         a3, a3, 12 /* [.Lrel114] */           #  3a3: 3833
            movi         a5, 0 /* 0x00000000 */                #  3a5: 0c05
            l32i         a4, a3, 0x12c /* [[.Lrel114]+0x12c] */ #  3a7: 42234b
            s32i         a5, a2, 28 /* 0x00000000 -> [arg0+0x1c] */ #  3aa: 5972
            s32i         a2, a4, 0 /* arg0 -> [[[.Lrel114]+0x12c]] */ #  3ac: 2904
            s32i         a0, a3, 0x12c /* arg0+0x1c -> [[.Lrel114]+0x12c] */ #  3ae: 02634b
            l32i         a0, sp, 0 /* [(local0)] */            #  3b1: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  3b3: 12c110
            ret           /* arg0 */                           #  3b6: 0df0

            .literal_position                                  #  3b8: 00000000

# Function @ .text+0x3bc
            .global      sdk_ppEnqueueRxq
            .type        sdk_ppEnqueueRxq, @function
sdk_ppEnqueueRxq:
            movi         a4, sdk_NoiseTimerInterval            #  3bc: 41ffff
            addi         a3, a2, 28 /* arg0+0x1c */            #  3bf: 32c21c
            l32i         a4, a4, 12 /* [.Lrel114] */           #  3c2: 4834
            movi         a6, 0 /* 0x00000000 */                #  3c4: 0c06
            l32i         a5, a4, 0x134 /* [[.Lrel114]+0x134] */ #  3c6: 52244d
            s32i         a6, a2, 28 /* 0x00000000 -> [arg0+0x1c] */ #  3c9: 6972
            s32i         a2, a5, 0 /* arg0 -> [[[.Lrel114]+0x134]] */ #  3cb: 2905
            s32i         a3, a4, 0x134 /* arg0+0x1c -> [[.Lrel114]+0x134] */ #  3cd: 32644d
            ret           /* arg0 */                           #  3d0: 0df0

            .literal_position                                  #  3d4: 00000000
                                                               #  3d8: 00000000
                                                               #  3dc: 00000000
                                                               #  3e0: 00000000
                                                               #  3e4: 00000000

# Function @ .text+0x3e8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
.Lfunc005:  addi         sp, sp, -16 /* (local0) */            #  3e8: 12c1f0
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  3eb: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  3ed: c921
            movi         a12, sdk_NoiseTimerInterval           #  3ef: c1f9ff
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  3f2: 0911
            l32i         a0, a12, 12 /* [.Lrel114] */          #  3f4: 083c
            slli         a13, a2, 5                            #  3f6: b0d211
            add          a0, a0, a13                           #  3f9: da00
            l8ui         a0, a0, 36                            #  3fb: 020024
            beqz         a0, .Lbr030                           #  3fe: 9c30
            beqi         a0, 3, .Lbr030                        #  400: 263011
            bltui        a0, 3, .Lbr029                        #  403: b63009
            movi         a2, 1 /* 0x00000001 */                #  406: 0c12
            bltui        a0, 6, .Lbr031                        #  408: b6600b
            movi         a2, 0 /* 0x00000000 */                #  40b: 0c02
            j            .Lbr031                               #  40d: 860100
.Lbr029:    movi         a2, 3 /* 0x00000003 */                #  410: 0c32
            j            .Lbr031                               #  412: 460000
.Lbr030:    movi         a2, 2 /* 0x00000002 */                #  415: 0c22
.Lbr031:    call0        sdk_GetAccess                         #  417: 01f1ffc0
                                                               #  41b: 0000
            l32i         a5, a12, 12 /* [.Lrel114] */          #  41d: 583c
            mov          a0, a2                                #  41f: 0d02
            add          a5, a5, a13                           #  421: da55
            l8ui         a6, a5, 33                            #  423: 620521
            movi         a12, 0 /* 0x00000000 */               #  426: 0c0c
            bnez         a6, .Lbr033                           #  428: cc96
            l32i         a2, a5, 44                            #  42a: 28b5
            beqz         a2, .Lbr032                           #  42c: 8c32
            mov          a12, a2                               #  42e: cd02
            j            .Lbr033                               #  430: 460000
.Lbr032:    beqz         a6, .Lbr034                           #  433: 8cb6
.Lbr033:    l32i         a0, sp, 4 /* [(local1)] */            #  435: 0811
            mov          a2, a12                               #  437: 2d0c
            l32i         a13, sp, 12 /* [(local3)] */          #  439: d831
            l32i         a12, sp, 8 /* [(local2)] */           #  43b: c821
            addi         sp, sp, 16 /* (top of frame) */       #  43d: 12c110
            ret                                                #  440: 0df0
.Lbr034:    s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  442: 0901
.Lbr035:    l32i         a12, a5, 24                           #  444: c865
            movi         a0, 0 /* 0x00000000 */                #  446: 0c00
            beqz         a12, .Lbr033                          #  448: 169cfe
            l32i         a6, a12, 28                           #  44b: 687c
            s32i         a6, a5, 24                            #  44d: 6965
            bnez         a6, .Lbr036                           #  44f: cc36
            addi         a7, a5, 24                            #  451: 72c518
            s32i         a7, a5, 28                            #  454: 7975
.Lbr036:    mov          a2, a12                               #  456: 2d0c
            s32i         a0, a12, 28                           #  458: 097c
            call0        sdk_lmacMSDUAged                      #  45a: 01e1ffc0
                                                               #  45e: 0000
            beqz         a2, .Lbr033                           #  460: 1612fd
            mov          a3, a12                               #  463: 3d0c
            l32i         a2, sp, 0 /* [(local0)] */            #  465: 2801
            movi         a4, 0 /* 0x00000000 */                #  467: 0c04
            call0        sdk_lmacDiscardAgedMSDU               #  469: 01deffc0
                                                               #  46d: 0000
            movi         a5, sdk_NoiseTimerInterval            #  46f: 51daff
            l32i         a5, a5, 12 /* [.Lrel114] */           #  472: 5835
            add          a5, a5, a13                           #  474: da55
            j            .Lbr035                               #  476: 86f2ff

            .literal_position                                  #  47c: 00000000
                                                               #  480: 00000000
                                                               #  484: 00000000
                                                               #  488: 00000000

# Function @ .text+0x48c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
.Lfunc006:  addi         sp, sp, -32 /* (local0) */            #  48c: 12c1e0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  48f: c921
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  491: e941
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   #  493: f951
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  495: d931
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  497: 0911
            mov          a13, a2 /* arg0 */                    #  499: dd02
            call0        .Lfunc007                             #  49b: 050f00
            movi         a0, sdk_NoiseTimerInterval            #  49e: 01f7ff
            movi         a15, 1 /* 0x00000001 */               #  4a1: 0c1f
            l32i         a0, a0, 12 /* [.Lrel114] */           #  4a3: 0830
            slli         a14, a13, 2                           #  4a5: e0ed11
            add          a2, a13, a0                           #  4a8: 0a2d
            addx4        a4, a13, a0                           #  4aa: 004da0
            l32i         a4, a4, 4                             #  4ad: 4814
            l8ui         a2, a2, 20                            #  4af: 220214
            bnez         a13, .Lbr039                          #  4b2: ecfd
            ssr          a2                                    #  4b4: 000240
            srl          a3, a4                                #  4b7: 403091
            bbci         a3, 0, .Lbr037                        #  4ba: 07630a
            slli         a5, a2, 5                             #  4bd: b05211
            add          a5, a0, a5                            #  4c0: 5a50
            l8ui         a5, a5, 40                            #  4c2: 520528
            beqi         a5, 1, .Lbr039                        #  4c5: 26151c
.Lbr037:    movi         a12, 0 /* 0x00000000 */               #  4c8: 0c0c
            s32i         a2, sp, 24 /* a2 -> [(local6)] */     #  4ca: 2961
.Lbr038:    extui        a2, a12, 0, 8                         #  4cc: c02074
            call0        .Lfunc005                             #  4cf: 85f1ff
            bnez         a2, .Lbr044                           #  4d2: 563206
            addi         a12, a12, 1                           #  4d5: 1bcc
            bnei         a12, 2, .Lbr038                       #  4d7: 662cf1
            movi         a4, sdk_NoiseTimerInterval            #  4da: 41e9ff
            l32i         a4, a4, 12 /* [.Lrel114] */           #  4dd: 4834
            l32i         a2, sp, 24 /* [(local6)] */           #  4df: 2861
            add          a4, a4, a14                           #  4e1: ea44
            l32i         a4, a4, 4                             #  4e3: 4814
.Lbr039:    s32i         a13, sp, 0 /* arg0 -> [(local0)] */   #  4e5: d901
            ssl          a2                                    #  4e7: 001240
            sll          a12, a15                              #  4ea: 00cfa1
            addi         a12, a12, -1                          #  4ed: 0bcc
            and          a12, a4, a12                          #  4ef: c0c410
            xor          a14, a4, a12                          #  4f2: c0e430
.Lbr040:    neg          a13, a14                              #  4f5: e0d060
            and          a13, a13, a14                         #  4f8: e0dd10
            nsau         a13, a13                              #  4fb: d0fd40
            neg          a13, a13                              #  4fe: d0d060
            addi         a13, a13, 31                          #  501: d2cd1f
            bltz         a13, .Lbr045                          #  504: 960d04
            extui        a2, a13, 0, 8                         #  507: d02074
            call0        .Lfunc005                             #  50a: c5edff
            beqz         a2, .Lbr042                           #  50d: 9c52
            movi         a0, sdk_NoiseTimerInterval            #  50f: 01ddff
            l32i         a14, sp, 0 /* [(local0)] */           #  512: e801
            l32i         a0, a0, 12 /* [.Lrel114] */           #  514: 0830
            add          a14, a14, a0                          #  516: 0aee
            s8i          a13, a14, 20                          #  518: d24e14
.Lbr041:    slli         a3, a13, 5                            #  51b: b03d11
            add          a3, a0, a3                            #  51e: 3a30
            s8i          a15, a3, 40                           #  520: f24328
            j            .Lbr044                               #  523: 860400
.Lbr042:    movi         a5, -1 /* 0xffffffff */               #  526: 7cf5
            ssl          a13                                   #  528: 001d40
            sll          a4, a15                               #  52b: 004fa1
            xor          a4, a4, a5                            #  52e: 504430
            and          a14, a14, a4                          #  531: 40ee10
            j            .Lbr040                               #  534: 46efff
.Lbr043:    movi         a2, 0 /* 0x00000000 */                #  537: 0c02
.Lbr044:    l32i         a12, sp, 8 /* [(local2)] */           #  539: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  53b: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  53d: e841
            l32i         a15, sp, 20 /* [(local5)] */          #  53f: f851
            l32i         a0, sp, 4 /* [(local1)] */            #  541: 0811
            addi         sp, sp, 32 /* (top of frame) */       #  543: 12c120
            ret                                                #  546: 0df0
.Lbr045:    neg          a13, a12                              #  548: c0d060
            and          a13, a13, a12                         #  54b: c0dd10
            nsau         a13, a13                              #  54e: d0fd40
            neg          a13, a13                              #  551: d0d060
            addi         a13, a13, 31                          #  554: d2cd1f
            bltz         a13, .Lbr043                          #  557: 96cdfd
            extui        a2, a13, 0, 8                         #  55a: d02074
            call0        .Lfunc005                             #  55d: 85e8ff
            bnez         a2, .Lbr046                           #  560: ccf2
            movi         a0, -1 /* 0xffffffff */               #  562: 7cf0
            ssl          a13                                   #  564: 001d40
            sll          a14, a15                              #  567: 00efa1
            xor          a14, a14, a0                          #  56a: 00ee30
            and          a12, a12, a14                         #  56d: e0cc10
            j            .Lbr045                               #  570: 06f5ff
.Lbr046:    movi         a0, sdk_NoiseTimerInterval            #  573: 01c5ff
            l32i         a3, sp, 0 /* [(local0)] */            #  576: 3801
            l32i         a0, a0, 12 /* [.Lrel114] */           #  578: 0830
            add          a3, a3, a0                            #  57a: 0a33
            s8i          a13, a3, 20                           #  57c: d24314
            j            .Lbr041                               #  57f: 06e6ff

            .literal_position                                  #  584: 00000000
                                                               #  588: 00000000

# Function @ .text+0x58c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
.Lfunc007:  movi         a9, 1 /* 0x00000001 */                #  58c: 0c19
            addi         sp, sp, -16 /* (local0) */            #  58e: 12c1f0
            movi         a3, sdk_NoiseTimerInterval            #  591: 31fcff
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  594: 0921
            l32i         a0, a3, 12 /* [.Lrel114] */           #  596: 0833
            slli         a7, a2, 2                             #  598: e07211
            addx4        a6, a2, a0                            #  59b: 0062a0
            add          a5, a2, a0                            #  59e: 0a52
            l8ui         a5, a5, 20                            #  5a0: 520514
            l32i         a4, a6, 4                             #  5a3: 4816
            ssr          a5                                    #  5a5: 000540
            srl          a4, a4                                #  5a8: 404091
            bbsi         a4, 0, .Lbr047                        #  5ab: 07e402
            j            .Lbr050                               #  5ae: 462000
.Lbr047:    slli         a10, a5, 5                            #  5b1: b0a511
            add          a10, a0, a10                          #  5b4: aaa0
            l8ui         a8, a10, 40                           #  5b6: 820a28
            movi         a3, 0 /* 0x00000000 */                #  5b9: 0c03
            beqz         a8, .Lbr050                           #  5bb: 164807
            movi         a8, -1 /* 0xffffffff */               #  5be: 7cf8
            l32i         a11, a10, 24                          #  5c0: b86a
            s8i          a3, a10, 40                           #  5c2: 324a28
            bnez         a11, .Lbr048                          #  5c5: fcbb
            s32i         a7, sp, 4 /* a7 -> [(local1)] */      #  5c7: 7911
            s32i         a5, sp, 0 /* a5 -> [(local0)] */      #  5c9: 5901
            l32i         a4, a10, 44                           #  5cb: 48ba
            s32i         a2, sp, 12 /* arg0 -> [(local3)] */   #  5cd: 2931
            bnez         a4, .Lbr048                           #  5cf: fc14
            movi         a9, -1 /* 0xffffffff */               #  5d1: 7cf9
            l32i         a8, sp, 0 /* [(local0)] */            #  5d3: 8801
            movi         a7, 1 /* 0x00000001 */                #  5d5: 0c17
            ssl          a8                                    #  5d7: 001840
            l32i         a8, a6, 4                             #  5da: 8816
            sll          a7, a7                                #  5dc: 0077a1
            xor          a7, a7, a9                            #  5df: 907730
            and          a8, a8, a7                            #  5e2: 708810
            s32i         a8, a6, 4                             #  5e5: 8916
            l32i         a5, a0, 0 /* [[.Lrel114]] */          #  5e7: 5800
            movi         a2, 8 /* 0x00000008 */                #  5e9: 0c82
            and          a5, a5, a7                            #  5eb: 705510
            s32i         a5, a0, 0 /* a5 -> [[.Lrel114]] */    #  5ee: 5900
            call0        sdk_pp_post                           #  5f0: 050000
            l32i         a2, sp, 12 /* [(local3)] */           #  5f3: 2831
            l32i         a5, sp, 0 /* [(local0)] */            #  5f5: 5801
            movi         a8, -1 /* 0xffffffff */               #  5f7: 7cf8
            movi         a0, sdk_NoiseTimerInterval            #  5f9: 01e3ff
            l32i         a6, sp, 4 /* [(local1)] */            #  5fc: 6811
            l32i         a0, a0, 12 /* [.Lrel114] */           #  5fe: 0830
            movi         a9, 1 /* 0x00000001 */                #  600: 0c19
            add          a6, a6, a0                            #  602: 0a66
.Lbr048:    l32i         a3, a6, 4                             #  604: 3816
            beqz         a3, .Lbr050                           #  606: ac93
            ssl          a5                                    #  608: 001540
            sll          a5, a9                                #  60b: 0059a1
            xor          a4, a5, a8                            #  60e: 804530
            addi         a5, a5, -1                            #  611: 0b55
            and          a5, a3, a5                            #  613: 505310
            xor          a6, a3, a5                            #  616: 506330
            and          a4, a4, a6                            #  619: 604410
            neg          a3, a4                                #  61c: 403060
            and          a3, a3, a4                            #  61f: 403310
            nsau         a3, a3                                #  622: 30f340
            neg          a3, a3                                #  625: 303060
            addi         a3, a3, 31                            #  628: 32c31f
            bltz         a3, .Lbr051                           #  62b: 96b300
.Lbr049:    add          a6, a2, a0                            #  62e: 0a62
            s8i          a3, a6, 20                            #  630: 324614
.Lbr050:    l32i         a0, sp, 8 /* [(local2)] */            #  633: 0821
            addi         sp, sp, 16 /* (top of frame) */       #  635: 12c110
            ret                                                #  638: 0df0
.Lbr051:    neg          a3, a5                                #  63a: 503060
            and          a3, a3, a5                            #  63d: 503310
            nsau         a3, a3                                #  640: 30f340
            neg          a3, a3                                #  643: 303060
            addi         a3, a3, 31                            #  646: 32c31f
            bgez         a3, .Lbr049                           #  649: d613fe
            j            .Lbr050                               #  64c: c6f8ff

            .literal_position                                  #  650: 00000000

# Function @ .text+0x654
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
.Lfunc008:  movi         a11, 1 /* 0x00000001 */               #  654: 0c1b
            movi         a8, 0 /* 0x00000000 */                #  656: 0c08
            movi         a10, sdk_NoiseTimerInterval           #  658: a1feff
            addi         sp, sp, -16 /* (local0) */            #  65b: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  65e: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  660: d921
            l32i         a10, a10, 12 /* [.Lrel114] */         #  662: a83a
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  664: 0901
            addx4        a7, a5, a10                           #  666: a075a0
            l32i         a0, a7, 4                             #  669: 0817
            l32i         a13, a10, 0 /* [[.Lrel114]] */        #  66b: d80a
            bnez         a0, .Lbr054                           #  66d: 561004
            add          a9, a5, a10                           #  670: aa95
            l8ui         a9, a9, 20                            #  672: 920914
            ssr          a9                                    #  675: 000940
            srl          a12, a13                              #  678: d0c091
            bbsi         a12, 0, .Lbr054                       #  67b: 07ec33
            mov          a0, a9                                #  67e: 0d09
            ssl          a9                                    #  680: 001940
            slli         a5, a9, 5                             #  683: b05911
            add          a5, a10, a5                           #  686: 5a5a
            s8i          a4, a5, 36                            #  688: 424524
            s8i          a3, a5, 37                            #  68b: 324525
            s8i          a8, a5, 40                            #  68e: 824528
            s8i          a2, a5, 38                            #  691: 224526
            l32i         a2, a7, 4                             #  694: 2817
            sll          a3, a11                               #  696: 003ba1
            or           a2, a2, a3                            #  699: 302220
.Lbr052:    s32i         a2, a7, 4                             #  69c: 2917
            l32i         a6, a10, 0 /* [[.Lrel114]] */         #  69e: 680a
            or           a6, a6, a3                            #  6a0: 306620
            s32i         a6, a10, 0 /* a6 -> [[.Lrel114]] */   #  6a3: 690a
.Lbr053:    l32i         a12, sp, 4 /* [(local1)] */           #  6a5: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  6a7: d821
            mov          a2, a0                                #  6a9: 2d00
            l32i         a0, sp, 0 /* [(local0)] */            #  6ab: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  6ad: 12c110
            ret                                                #  6b0: 0df0
.Lbr054:    movi         a12, -1 /* 0xffffffff */              #  6b2: 7cfc
            neg          a8, a0                                #  6b4: 008060
            and          a8, a8, a0                            #  6b7: 008810
            nsau         a8, a8                                #  6ba: 80f840
            neg          a8, a8                                #  6bd: 808060
            addi         a8, a8, 31                            #  6c0: 82c81f
            bltz         a8, .Lbr056                           #  6c3: 968802
            slli         a9, a8, 5                             #  6c6: b09811
            add          a9, a10, a9                           #  6c9: 9a9a
            l8ui         a6, a9, 36                            #  6cb: 620924
            ssl          a8                                    #  6ce: 001840
            bne          a6, a4, .Lbr055                       #  6d1: 47960e
            l8ui         a6, a9, 37                            #  6d4: 620925
            l8ui         a7, a9, 38                            #  6d7: 720926
            bne          a6, a3, .Lbr055                       #  6da: 379605
            sub          a7, a7, a2                            #  6dd: 2077c0
            beqz         a7, .Lbr058                           #  6e0: 16c708
.Lbr055:    sll          a9, a11                               #  6e3: 009ba1
            xor          a9, a9, a12                           #  6e6: c09930
            and          a0, a0, a9                            #  6e9: 900010
            j            .Lbr054                               #  6ec: 86f0ff
.Lbr056:    movi         a12, 255 /* 0x000000ff */             #  6ef: c2a0ff
            movi         a8, 3 /* 0x00000003 */                #  6f2: 0c38
            add          a9, a5, a10                           #  6f4: aa95
            l8ui         a9, a9, 20                            #  6f6: 920914
            or           a8, a13, a8                           #  6f9: 808d20
            ssl          a9                                    #  6fc: 001940
            xor          a9, a8, a12                           #  6ff: c09830
            sll          a7, a11                               #  702: 007ba1
            addi         a7, a7, -1                            #  705: 0b77
            and          a7, a7, a9                            #  707: 907710
            nsau         a0, a7                                #  70a: 00f740
            movi         a9, 31 /* 0x0000001f */               #  70d: 1cf9
            sub          a0, a9, a0                            #  70f: 0009c0
            bgez         a0, .Lbr057                           #  712: d63001
            xor          a0, a8, a7                            #  715: 700830
            xor          a0, a0, a12                           #  718: c00030
            nsau         a0, a0                                #  71b: 00f040
            sub          a0, a9, a0                            #  71e: 0009c0
            bgez         a0, .Lbr057                           #  721: d64000
            movi         a0, 8 /* 0x00000008 */                #  724: 0c80
            j            .Lbr053                               #  726: c6deff
.Lbr057:    addx4        a7, a5, a10                           #  729: a075a0
            ssl          a0                                    #  72c: 001040
            sll          a8, a11                               #  72f: 008ba1
            addi         a8, a8, -1                            #  732: 0b88
            and          a5, a8, a13                           #  734: d05810
            nsau         a5, a5                                #  737: 50f540
            sub          a6, a9, a5                            #  73a: 5069c0
            bltz         a6, .Lbr059                           #  73d: 965603
            sub          a0, a0, a5                            #  740: 5000c0
            movi         a8, 0 /* 0x00000000 */                #  743: 0c08
            addi         a6, a0, 32                            #  745: 62c020
            addi         a0, a0, 33                            #  748: 02c021
            movgez       a0, a6, a6                            #  74b: 6006b3
            extui        a0, a0, 1, 8                          #  74e: 000174
            ssl          a0                                    #  751: 001040
            slli         a6, a0, 5                             #  754: b06011
            add          a6, a10, a6                           #  757: 6a6a
            s8i          a8, a6, 40                            #  759: 824628
            s8i          a3, a6, 37                            #  75c: 324625
            s8i          a4, a6, 36                            #  75f: 424624
            s8i          a2, a6, 38                            #  762: 224626
            l32i         a2, a7, 4                             #  765: 2817
            sll          a3, a11                               #  767: 003ba1
            or           a2, a2, a3                            #  76a: 302220
            j            .Lbr052                               #  76d: c6caff
.Lbr058:    extui        a0, a8, 0, 8                          #  770: 800074
            j            .Lbr053                               #  773: 86cbff
.Lbr059:    movi         a5, -1 /* 0xffffffff */               #  776: 7cf5
            xor          a5, a8, a5                            #  778: 505830
            and          a5, a13, a5                           #  77b: 505d10
            nsau         a5, a5                                #  77e: 50f540
            sub          a5, a0, a5                            #  781: 5050c0
            addi         a6, a5, 37                            #  784: 62c525
            addi         a5, a5, 38                            #  787: 52c526
            movgez       a5, a6, a6                            #  78a: 6056b3
            movi         a6, 0 /* 0x00000000 */                #  78d: 0c06
            srai         a5, a5, 1                             #  78f: 505121
            mov          a0, a5                                #  792: 0d05
            blti         a5, 8, .Lbr060                        #  794: a68502
            addi         a0, a5, -6                            #  797: 02c5fa
.Lbr060:    extui        a0, a0, 0, 8                          #  79a: 000074
            ssl          a0                                    #  79d: 001040
            slli         a5, a0, 5                             #  7a0: b05011
            add          a5, a10, a5                           #  7a3: 5a5a
            s8i          a4, a5, 36                            #  7a5: 424524
            s8i          a3, a5, 37                            #  7a8: 324525
            s8i          a6, a5, 40                            #  7ab: 624528
            s8i          a2, a5, 38                            #  7ae: 224526
            l32i         a2, a7, 4                             #  7b1: 2817
            sll          a3, a11                               #  7b3: 003ba1
            or           a2, a2, a3                            #  7b6: 302220
            j            .Lbr052                               #  7b9: c6b7ff

            .literal_position                                  #  7bc: 00000000
                                                               #  7c0: 00feef3f
                                                               #  7c4: 00000000
                                                               #  7c8: 00000000
                                                               #  7cc: 00000000
                                                               #  7d0: 00000000
                                                               #  7d4: 00000000
                                                               #  7d8: 00000000
                                                               #  7dc: 00000000
                                                               #  7e0: 00000000
                                                               #  7e4: 00000000
                                                               #  7e8: 00000000
                                                               #  7ec: 00000000

# Function @ .text+0x7f0
# Local variables/stack:
#     (local0):  word[2]   @ -0x34
#     (local1):  word      @ -0x2c
#     (local2):  word      @ -0x28
#     (local3):  word      @ -0x24
#     (local4):  word      @ -0x20
#     (local5):  word      @ -0x1c
#     (local6):  word      @ -0x18
#     (local7):  word      @ -0x14
#     (local8):  word[4]   @ -0x10
.Lfunc009:  addi         sp, sp, -80 /* (FP)-0x50 */           #  7f0: 12c1b0
            s32i         a15, sp, 52 /* a15 -> [(local5)] */   #  7f3: f9d1
            s32i         a13, sp, 44 /* a13 -> [(local3)] */   #  7f5: d9b1
            s32i         a0, sp, 36 /* a0 -> [(local1)] */     #  7f7: 0991
            s32i         a12, sp, 40 /* a12 -> [(local2)] */   #  7f9: c9a1
            s32i         a14, sp, 48 /* a14 -> [(local4)] */   #  7fb: e9c1
            movi         a14, sdk_NMIIrqIsOn                   #  7fd: e1efff
            mov          a12, a2 /* arg0 */                    #  800: cd02
            l8ui         a0, a14, 0 /* [sdk_NMIIrqIsOn] */     #  802: 020e00
            movi         a13, 0x3feffe00                       #  805: d1eeff
            bnez         a0, .Lbr062                           #  808: ec10
            call0        vPortEnterCritical                    #  80a: 01f2ffc0
                                                               #  80e: 0000
.Lbr061:    memw                                               #  810: c02000
            l32i         a4, a13, 0x200 /* [0x3ff00000] */     #  813: 422d80
            movi         a5, -32 /* 0xffffffe0 */              #  816: 6c05
            and          a4, a4, a5                            #  818: 504410
            memw                                               #  81b: c02000
            s32i         a4, a13, 0x200 /* a4 -> [0x3ff00000] */ #  81e: 426d80
            memw                                               #  821: c02000
            l32i         a3, a13, 0x200 /* [0x3ff00000] */     #  824: 322d80
            bbsi         a3, 0, .Lbr061                        #  827: 07e3e5
            l8ui         a0, a14, 0 /* [sdk_NMIIrqIsOn] */     #  82a: 020e00
.Lbr062:    movi         a15, sdk_NoiseTimerInterval           #  82d: f1e5ff
            l32i         a15, a15, 12 /* [.Lrel114] */         #  830: f83f
            l32i         a15, a15, 0 /* [[.Lrel114]] */        #  832: f80f
            bnez         a0, .Lbr063                           #  834: dca0
            memw                                               #  836: c02000
            l32i         a0, a13, 0x200 /* [0x3ff00000] */     #  839: 022d80
            movi         a2, -32 /* 0xffffffe0 */              #  83c: 6c02
            and          a0, a0, a2                            #  83e: 200010
            movi         a2, 1 /* 0x00000001 */                #  841: 0c12
            or           a0, a0, a2                            #  843: 200020
            memw                                               #  846: c02000
            s32i         a0, a13, 0x200 /* a0 -> [0x3ff00000] */ #  849: 026d80
            call0        vPortExitCritical                     #  84c: 01e3ffc0
                                                               #  850: 0000
.Lbr063:    movi         a4, 255 /* 0x000000ff */              #  852: 42a0ff
            movi         a3, 3 /* 0x00000003 */                #  855: 0c33
            or           a3, a15, a3                           #  857: 303f20
            xor          a3, a3, a4                            #  85a: 403330
            beqz         a3, .Lbr074                           #  85d: 160316
            movi         a0, sdk_NoiseTimerInterval            #  860: 01daff
            l32i         a0, a0, 12 /* [.Lrel114] */           #  863: 0830
            slli         a4, a12, 3                            #  865: d04c11
            addx8        a0, a12, a0                           #  868: 000cb0
            l32i         a15, a0, 0x118                        #  86b: f22046
            s32i         a4, sp, 56 /* a4 -> [(local6)] */     #  86e: 49e1
            beqz         a15, .Lbr074                          #  870: 16df14
            s32i         a15, sp, 28 /* a15 -> [(local0)] */   #  873: f971
            movi         a2, 280 /* 0x00000118 */              #  875: 22a118
            movi         a3, 0 /* 0x00000000 */                #  878: 0c03
            s32i         a3, a0, 0x118                         #  87a: 326046
            add          a2, a0, a2                            #  87d: 2a20
            s32i         a2, a0, 0x11c                         #  87f: 226047
.Lbr064:    mov          a12, a15                              #  882: cd0f
            beqz         a15, .Lbr072                          #  884: 168f12
            l32i         a15, a15, 28                          #  887: f87f
            movi         a6, 0 /* 0x00000000 */                #  889: 0c06
            s32i         a6, a12, 28                           #  88b: 697c
            l8ui         a5, a14, 0 /* [sdk_NMIIrqIsOn] */     #  88d: 520e00
            s32i         a15, sp, 28 /* a15 -> [(local0)] */   #  890: f971
            bnez         a5, .Lbr066                           #  892: dce5
            call0        vPortEnterCritical                    #  894: 01d2ffc0
                                                               #  898: 0000
            movi         a0, -32 /* 0xffffffe0 */              #  89a: 6c00
.Lbr065:    memw                                               #  89c: c02000
            l32i         a8, a13, 0x200 /* [0x3ff00000] */     #  89f: 822d80
            and          a8, a8, a0                            #  8a2: 008810
            memw                                               #  8a5: c02000
            s32i         a8, a13, 0x200 /* a8 -> [0x3ff00000] */ #  8a8: 826d80
            memw                                               #  8ab: c02000
            l32i         a7, a13, 0x200 /* [0x3ff00000] */     #  8ae: 722d80
            bbsi         a7, 0, .Lbr065                        #  8b1: 07e7e7
.Lbr066:    l32i         a3, a12, 24                           #  8b4: 386c
            l32i         a4, a12, 32                           #  8b6: 488c
            l8ui         a3, a3, 118                           #  8b8: 320376
            l8ui         a2, a4, 0                             #  8bb: 220400
            l8ui         a5, a4, 6                             #  8be: 520406
            extui        a2, a2, 1, 1                          #  8c1: 202104
            l8ui         a4, a4, 4                             #  8c4: 420404
            extui        a5, a5, 4, 3                          #  8c7: 505424
            extui        a4, a4, 0, 4                          #  8ca: 404034
            call0        .Lfunc008                             #  8cd: 45d8ff
            l8ui         a4, a14, 0 /* [sdk_NMIIrqIsOn] */     #  8d0: 420e00
            s32i         a2, sp, 60 /* a2 -> [(local7)] */     #  8d3: 29f1
            bnez         a4, .Lbr067                           #  8d5: dcc4
            memw                                               #  8d7: c02000
            l32i         a5, a13, 0x200 /* [0x3ff00000] */     #  8da: 522d80
            movi         a6, -32 /* 0xffffffe0 */              #  8dd: 6c06
            and          a5, a5, a6                            #  8df: 605510
            movi         a6, 1 /* 0x00000001 */                #  8e2: 0c16
            or           a5, a5, a6                            #  8e4: 605520
            memw                                               #  8e7: c02000
            s32i         a5, a13, 0x200 /* a5 -> [0x3ff00000] */ #  8ea: 526d80
            call0        vPortExitCritical                     #  8ed: 01bcffc0
                                                               #  8f1: 0000
            l32i         a2, sp, 60 /* [(local7)] */           #  8f3: 28f1
.Lbr067:    addi         a0, a12, 28                           #  8f5: 02cc1c
            bnei         a2, 8, .Lbr068                        #  8f8: 668217
            movi         a7, sdk_NoiseTimerInterval            #  8fb: 71b4ff
            l32i         a8, sp, 56 /* [(local6)] */           #  8fe: 88e1
            l32i         a7, a7, 12 /* [.Lrel114] */           #  900: 7837
            movi         a9, 0 /* 0x00000000 */                #  902: 0c09
            add          a7, a7, a8                            #  904: 8a77
            l32i         a8, a7, 0x11c                         #  906: 822747
            s32i         a9, a12, 28                           #  909: 997c
            s32i         a12, a8, 0                            #  90b: c908
            s32i         a0, a7, 0x11c                         #  90d: 026747
            j            .Lbr064                               #  910: 86dbff
.Lbr068:    movi         a3, 195 /* 0x000000c3 */              #  913: 32a0c3
            l32i         a10, a12, 32                          #  916: a88c
            extui        a11, a2, 0, 4                         #  918: 20b034
            l8ui         a9, a10, 0                            #  91b: 920a00
            slli         a11, a11, 2                           #  91e: e0bb11
            and          a9, a9, a3                            #  921: 309910
            or           a9, a9, a11                           #  924: b09920
            s8i          a9, a10, 0                            #  927: 924a00
            l8ui         a8, a14, 0 /* [sdk_NMIIrqIsOn] */     #  92a: 820e00
            s32i         a0, sp, 64 /* a0 -> [(local8)] */     #  92d: 026110
            bnez         a8, .Lbr070                           #  930: ec18
            call0        vPortEnterCritical                    #  932: 01acffc0
                                                               #  936: 0000
            l32i         a0, sp, 64 /* [(local8)] */           #  938: 022110
.Lbr069:    memw                                               #  93b: c02000
            l32i         a4, a13, 0x200 /* [0x3ff00000] */     #  93e: 422d80
            movi         a2, -32 /* 0xffffffe0 */              #  941: 6c02
            and          a4, a4, a2                            #  943: 204410
            memw                                               #  946: c02000
            s32i         a4, a13, 0x200 /* a4 -> [0x3ff00000] */ #  949: 426d80
            memw                                               #  94c: c02000
            l32i         a3, a13, 0x200 /* [0x3ff00000] */     #  94f: 322d80
            bbsi         a3, 0, .Lbr069                        #  952: 07e3e5
.Lbr070:    movi         a6, sdk_NoiseTimerInterval            #  955: 619eff
            l32i         a2, a12, 32                           #  958: 288c
            movi         a7, 0 /* 0x00000000 */                #  95a: 0c07
            s32i         a7, a12, 28                           #  95c: 797c
            l8ui         a8, a2, 0                             #  95e: 820200
            l32i         a6, a6, 12 /* [.Lrel114] */           #  961: 6836
            extui        a8, a8, 2, 4                          #  963: 808234
            slli         a8, a8, 5                             #  966: b08811
            add          a8, a6, a8                            #  969: 8a86
            l32i         a8, a8, 28                            #  96b: 8878
            s32i         a12, a8, 0                            #  96d: c908
            l8ui         a7, a2, 0                             #  96f: 720200
            extui        a7, a7, 2, 4                          #  972: 707234
            slli         a7, a7, 5                             #  975: b07711
            add          a6, a6, a7                            #  978: 7a66
            s32i         a0, a6, 28                            #  97a: 0976
            l8ui         a5, a14, 0 /* [sdk_NMIIrqIsOn] */     #  97c: 520e00
            bnez         a5, .Lbr071                           #  97f: dcc5
            memw                                               #  981: c02000
            l32i         a8, a13, 0x200 /* [0x3ff00000] */     #  984: 822d80
            movi         a9, -32 /* 0xffffffe0 */              #  987: 6c09
            and          a8, a8, a9                            #  989: 908810
            movi         a9, 1 /* 0x00000001 */                #  98c: 0c19
            or           a8, a8, a9                            #  98e: 908820
            memw                                               #  991: c02000
            s32i         a8, a13, 0x200 /* a8 -> [0x3ff00000] */ #  994: 826d80
            call0        vPortExitCritical                     #  997: 0194ffc0
                                                               #  99b: 0000
            l32i         a2, a12, 32                           #  99d: 288c
.Lbr071:    l8ui         a2, a2, 6                             #  99f: 220206
            movi         a3, 0 /* 0x00000000 */                #  9a2: 0c03
            extui        a2, a2, 4, 3                          #  9a4: 202424
            call0        sdk_pp_post                           #  9a7: 0191ffc0
                                                               #  9ab: 0000
            j            .Lbr064                               #  9ad: 46b4ff
.Lbr072:    movi         a2, 1 /* 0x00000001 */                #  9b0: 0c12
.Lbr073:    l32i         a12, sp, 40 /* [(local2)] */          #  9b2: c8a1
            l32i         a13, sp, 44 /* [(local3)] */          #  9b4: d8b1
            l32i         a14, sp, 48 /* [(local4)] */          #  9b6: e8c1
            l32i         a15, sp, 52 /* [(local5)] */          #  9b8: f8d1
            l32i         a0, sp, 36 /* [(local1)] */           #  9ba: 0891
            addi         sp, sp, 80 /* (top of frame) */       #  9bc: 12c150
            ret                                                #  9bf: 0df0
.Lbr074:    movi         a2, 0 /* 0x00000000 */                #  9c1: 0c02
            j            .Lbr073                               #  9c3: c6faff

            .literal_position                                  #  9c8: 51030000
                                                               #  9cc: 00000000

# Function @ .text+0x9d0
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
.Lfunc010:  addi         sp, sp, -32 /* (local0) */            #  9d0: 12c1e0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  9d3: 0901
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  9d5: e931
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  9d7: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  9d9: d921
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  9db: f941
            movi         a15, .Ldata020                        #  9dd: f1faff
            movi         a13, -1 /* 0xffffffff */              #  9e0: 7cfd
            l8ui         a12, a15, 0 /* [.Ldata020] */         #  9e2: c20f00
            movi         a14, 0 /* 0x00000000 */               #  9e5: 0c0e
.Lbr075:    mov          a2, a12                               #  9e7: 2d0c
            call0        sdk_pm_allow_tx                       #  9e9: 01f8ffc0
                                                               #  9ed: 0000
            beqz         a2, .Lbr076                           #  9ef: 8c62
            mov          a2, a12                               #  9f1: 2d0c
            call0        .Lfunc009                             #  9f3: c5dfff
            movnez       a13, a12, a2                          #  9f6: 20dc93
.Lbr076:    l8ui         a0, a15, 0 /* [.Ldata020] */          #  9f9: 020f00
            addi         a12, a12, 1                           #  9fc: 1bcc
            extui        a12, a12, 0, 8                        #  9fe: c0c074
            addi         a2, a12, -2                           #  a01: 22ccfe
            moveqz       a12, a14, a2                          #  a04: 20ce83
            bne          a0, a12, .Lbr075                      #  a07: c790dc
            l32i         a12, sp, 4 /* [(local1)] */           #  a0a: c811
            beqi         a13, -1, .Lbr078                      #  a0c: 260d0c
            addi         a0, a13, 1                            #  a0f: 1b0d
            extui        a2, a0, 0, 8                          #  a11: 002074
            beqi         a2, 2, .Lbr077                        #  a14: 262201
            mov          a14, a0                               #  a17: ed00
.Lbr077:    s8i          a14, a15, 0 /* a14 -> [.Ldata020] */  #  a19: e24f00
.Lbr078:    l32i         a13, sp, 8 /* [(local2)] */           #  a1c: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  a1e: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  a20: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  a22: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  a24: 12c120
            ret                                                #  a27: 0df0

            .literal_position                                  #  a2c: 00000000
                                                               #  a30: 00feef3f
                                                               #  a34: 00000000
                                                               #  a38: 00feef3f
                                                               #  a3c: 00000000
                                                               #  a40: 00000000
                                                               #  a44: 00000000
                                                               #  a48: 00000000
                                                               #  a4c: 00000000
                                                               #  a50: 00000000
                                                               #  a54: 00000000
                                                               #  a58: 00000000
                                                               #  a5c: 00000000
                                                               #  a60: 00000000
                                                               #  a64: 00000000
                                                               #  a68: 00000000

# Function @ .text+0xa6c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
.Lfunc011:  addi         sp, sp, -32 /* (local0) */            #  a6c: 12c1e0
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  a6f: c931
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  a71: 0921
            mov          a12, a2 /* arg0 */                    #  a73: cd02
            l32i         a0, a2, 16 /* [arg0+0x10] */          #  a75: 0842
            s32i         a0, sp, 4 /* [arg0+0x10] -> [(local1)] */ #  a77: 0911
            call0        .Lfunc010                             #  a79: 45f5ff
            l32i         a8, a12, 32 /* [arg0+0x20] */         #  a7c: 888c
            l8ui         a2, a8, 0 /* [[arg0+0x20]] */         #  a7e: 220800
            l32i         a3, a12, 24 /* [arg0+0x18] */         #  a81: 386c
            extui        a2, a2, 1, 1                          #  a83: 202104
            bnez         a3, .Lbr082                           #  a86: 56e305
            l32i         a3, a8, 0 /* [[arg0+0x20]] */         #  a89: 3808
            extui        a3, a3, 9, 1                          #  a8b: 303904
            bnez         a3, .Lbr090                           #  a8e: 561317
            call0        sdk_pm_allow_tx                       #  a91: 01eaffc0
                                                               #  a95: 0000
            l32i         a8, a12, 32 /* [arg0+0x20] */         #  a97: 888c
            bnez         a2, .Lbr079                           #  a99: cca2
            l8ui         a0, a8, 14 /* [[arg0+0x20]+0xe] */    #  a9b: 02080e
            beqi         a0, 32, .Lbr079                       #  a9e: 26c005
            addi         a4, a0, -64 /* [[arg0+0x20]+0xe]-0x40 */ #  aa1: 42c0c0
            bnez         a4, .Lbr092                           #  aa4: 563417
.Lbr079:    l8ui         a2, a8, 0 /* [[arg0+0x20]] */         #  aa7: 220800
            movi         a0, 195 /* 0x000000c3 */              #  aaa: 02a0c3
            and          a0, a2, a0                            #  aad: 000210
            extui        a2, a2, 1, 1                          #  ab0: 202104
            slli         a2, a2, 2                             #  ab3: e02211
            or           a0, a0, a2                            #  ab6: 200020
            s8i          a0, a8, 0 /* a0 -> [[arg0+0x20]] */   #  ab9: 024800
            l32i         a10, a12, 32 /* [arg0+0x20] */        #  abc: a88c
            l8ui         a9, a10, 6 /* [[arg0+0x20]+0x6] */    #  abe: 920a06
            movi         a11, 143 /* 0x0000008f */             #  ac1: b2a08f
            and          a9, a9, a11                           #  ac4: b09910
            s8i          a9, a10, 6 /* a9 -> [[arg0+0x20]+0x6] */ #  ac7: 924a06
            l32i         a6, a12, 32 /* [arg0+0x20] */         #  aca: 688c
            l8ui         a5, a6, 4 /* [[arg0+0x20]+0x4] */     #  acc: 520604
            movi         a7, 240 /* 0x000000f0 */              #  acf: 72a0f0
            and          a5, a5, a7                            #  ad2: 705510
            movi         a7, 7 /* 0x00000007 */                #  ad5: 0c77
            or           a5, a5, a7                            #  ad7: 705520
            s8i          a5, a6, 4 /* a5 -> [[arg0+0x20]+0x4] */ #  ada: 524604
.Lbr080:    movi         a2, 0 /* 0x00000000 */                #  add: 0c02
.Lbr081:    l32i         a12, sp, 12 /* [(local3)] */          #  adf: c831
            l32i         a0, sp, 8 /* [(local2)] */            #  ae1: 0821
            addi         sp, sp, 32 /* (top of frame) */       #  ae3: 12c120
            ret                                                #  ae6: 0df0
.Lbr082:    l32i         a3, sp, 4 /* [(local1)] */            #  ae8: 3811
            l8ui         a3, a3, 0 /* [[(local1)]] */          #  aea: 320300
            extui        a3, a3, 2, 2                          #  aed: 303214
            bnez         a3, .Lbr083                           #  af0: 563304
            call0        sdk_pm_allow_tx                       #  af3: 01d3ffc0
                                                               #  af7: 0000
            beqz         a2, .Lbr091                           #  af9: 163211
            l32i         a11, a12, 32 /* [arg0+0x20] */        #  afc: b88c
            l8ui         a0, a11, 0 /* [[arg0+0x20]] */        #  afe: 020b00
            movi         a10, 195 /* 0x000000c3 */             #  b01: a2a0c3
            and          a10, a0, a10                          #  b04: a0a010
            extui        a0, a0, 1, 1                          #  b07: 000104
            slli         a0, a0, 2                             #  b0a: e00011
            or           a10, a10, a0                          #  b0d: 00aa20
            s8i          a10, a11, 0 /* a10 -> [[arg0+0x20]] */ #  b10: a24b00
            l32i         a8, a12, 32 /* [arg0+0x20] */         #  b13: 888c
            l8ui         a7, a8, 6 /* [[arg0+0x20]+0x6] */     #  b15: 720806
            movi         a9, 143 /* 0x0000008f */              #  b18: 92a08f
            and          a7, a7, a9                            #  b1b: 907710
            s8i          a7, a8, 6 /* a7 -> [[arg0+0x20]+0x6] */ #  b1e: 724806
            l32i         a5, a12, 32 /* [arg0+0x20] */         #  b21: 588c
            l8ui         a4, a5, 4 /* [[arg0+0x20]+0x4] */     #  b23: 420504
            movi         a6, 240 /* 0x000000f0 */              #  b26: 62a0f0
            and          a4, a4, a6                            #  b29: 604410
            movi         a6, 7 /* 0x00000007 */                #  b2c: 0c76
            or           a4, a4, a6                            #  b2e: 604420
            s8i          a4, a5, 4 /* a4 -> [[arg0+0x20]+0x4] */ #  b31: 424504
            j            .Lbr080                               #  b34: 46e9ff
.Lbr083:    call0        sdk_pm_allow_tx                       #  b37: 01c3ffc0
                                                               #  b3b: 0000
            bnez         a2, .Lbr084                           #  b3d: dc02
            l32i         a11, a12, 32 /* [arg0+0x20] */        #  b3f: b88c
            l32i         a11, a11, 0 /* [[arg0+0x20]] */       #  b41: b80b
            bbci         a11, 19, .Lbr084                      #  b43: 377b0a
            movi         a2, 1 /* 0x00000001 */                #  b46: 0c12
            call0        sdk_pm_post                           #  b48: 01c0ffc0
                                                               #  b4c: 0000
            j            .Lbr089                               #  b4e: 062b00
.Lbr084:    movi         a0, sdk_NMIIrqIsOn                    #  b51: 01b6ff
            l8ui         a0, a0, 0 /* [sdk_NMIIrqIsOn] */      #  b54: 020000
            bnez         a0, .Lbr086                           #  b57: ec10
            call0        vPortEnterCritical                    #  b59: 01bcffc0
                                                               #  b5d: 0000
.Lbr085:    memw                                               #  b5f: c02000
            movi         a3, 0x3feffe00                        #  b62: 31b3ff
            l32i         a4, a3, 0x200 /* [0x3ff00000] */      #  b65: 422380
            movi         a5, -32 /* 0xffffffe0 */              #  b68: 6c05
            and          a4, a4, a5                            #  b6a: 504410
            memw                                               #  b6d: c02000
            s32i         a4, a3, 0x200 /* a4 -> [0x3ff00000] */ #  b70: 426380
            memw                                               #  b73: c02000
            l32i         a3, a3, 0x200 /* [0x3ff00000] */      #  b76: 322380
            bbsi         a3, 0, .Lbr085                        #  b79: 07e3e2
.Lbr086:    l32i         a3, a12, 24 /* [arg0+0x18] */         #  b7c: 386c
            l32i         a4, a12, 32 /* [arg0+0x20] */         #  b7e: 488c
            l8ui         a3, a3, 118 /* [[arg0+0x18]+0x76] */  #  b80: 320376
            l8ui         a2, a4, 0 /* [[arg0+0x20]] */         #  b83: 220400
            l8ui         a5, a4, 6 /* [[arg0+0x20]+0x6] */     #  b86: 520406
            extui        a2, a2, 1, 1                          #  b89: 202104
            l8ui         a4, a4, 4 /* [[arg0+0x20]+0x4] */     #  b8c: 420404
            extui        a5, a5, 4, 3                          #  b8f: 505424
            extui        a4, a4, 0, 4                          #  b92: 404034
            call0        .Lfunc008                             #  b95: c5abff
            movi         a4, sdk_NMIIrqIsOn                    #  b98: 41a7ff
            mov          a0, a2                                #  b9b: 0d02
            l8ui         a4, a4, 0 /* [sdk_NMIIrqIsOn] */      #  b9d: 420400
            s32i         a2, sp, 16 /* a2 -> [(local4)] */     #  ba0: 2941
            bnez         a4, .Lbr087                           #  ba2: dcf4
            memw                                               #  ba4: c02000
            movi         a6, 0x3feffe00                        #  ba7: 61a4ff
            l32i         a5, a6, 0x200 /* [0x3ff00000] */      #  baa: 522680
            movi         a7, -32 /* 0xffffffe0 */              #  bad: 6c07
            and          a5, a5, a7                            #  baf: 705510
            movi         a7, 1 /* 0x00000001 */                #  bb2: 0c17
            or           a5, a5, a7                            #  bb4: 705520
            memw                                               #  bb7: c02000
            s32i         a5, a6, 0x200 /* a5 -> [0x3ff00000] */ #  bba: 526680
            call0        vPortExitCritical                     #  bbd: 01a4ffc0
                                                               #  bc1: 0000
            l32i         a0, sp, 16 /* [(local4)] */           #  bc3: 0841
.Lbr087:    s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  bc5: 0901
            beqi         a0, 8, .Lbr089                        #  bc7: 268033
            l32i         a2, a12, 32 /* [arg0+0x20] */         #  bca: 288c
            l8ui         a2, a2, 0 /* [[arg0+0x20]] */         #  bcc: 220200
            extui        a2, a2, 1, 1                          #  bcf: 202104
            call0        sdk_pm_allow_tx                       #  bd2: 01a0ffc0
                                                               #  bd6: 0000
            beqz         a2, .Lbr088                           #  bd8: 9ca2
            movi         a6, 195 /* 0x000000c3 */              #  bda: 62a0c3
            l32i         a4, a12, 32 /* [arg0+0x20] */         #  bdd: 488c
            l32i         a5, sp, 0 /* [(local0)] */            #  bdf: 5801
            l8ui         a3, a4, 0 /* [[arg0+0x20]] */         #  be1: 320400
            extui        a5, a5, 0, 4                          #  be4: 505034
            slli         a5, a5, 2                             #  be7: e05511
            and          a3, a3, a6                            #  bea: 603310
            or           a3, a3, a5                            #  bed: 503320
            s8i          a3, a4, 0 /* a3 -> [[arg0+0x20]] */   #  bf0: 324400
            j            .Lbr080                               #  bf3: 86b9ff
.Lbr088:    movi         a2, 1 /* 0x00000001 */                #  bf6: 0c12
            call0        sdk_pm_post                           #  bf8: 0198ffc0
                                                               #  bfc: 0000
.Lbr089:    movi         a2, 1 /* 0x00000001 */                #  bfe: 0c12
            j            .Lbr081                               #  c00: c6b6ff
.Lbr090:    call0        sdk_pm_allow_tx                       #  c03: 0196ffc0
                                                               #  c07: 0000
            beqz         a2, .Lbr093                           #  c09: 9c92
            l32i         a8, a12, 32 /* [arg0+0x20] */         #  c0b: 888c
            j            .Lbr079                               #  c0d: 86a5ff
.Lbr091:    movi         a2, 1 /* 0x00000001 */                #  c10: 0c12
            call0        sdk_pm_post                           #  c12: 0193ffc0
                                                               #  c16: 0000
            j            .Lbr089                               #  c18: 86f8ff
.Lbr092:    movi         a2, 1 /* 0x00000001 */                #  c1b: 0c12
            call0        sdk_pm_post                           #  c1d: 0191ffc0
                                                               #  c21: 0000
            j            .Lbr089                               #  c23: c6f5ff
.Lbr093:    movi         a2, 1 /* 0x00000001 */                #  c26: 0c12
            call0        sdk_pm_post                           #  c28: 0190ffc0
                                                               #  c2c: 0000
            j            .Lbr089                               #  c2e: 06f3ff

            .balign      4
# Function @ .text+0xc34
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ppDiscardMPDU
            .type        sdk_ppDiscardMPDU, @function
sdk_ppDiscardMPDU:
            movi         a4, 0 /* 0x00000000 */                #  c34: 0c04
            addi         sp, sp, -16 /* (local0) */            #  c36: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  c39: 0901
            l32i         a3, a2, 32 /* [arg0+0x20] */          #  c3b: 3882
            movi         a0, 4 /* 0x00000004 */                #  c3d: 0c40
            s8i          a4, a3, 14 /* 0x00 -> [[arg0+0x20]+0xe] */ #  c3f: 42430e
            s8i          a0, a3, 15 /* 0x04 -> [[arg0+0x20]+0xf] */ #  c42: 02430f
            call0        sdk_ppEnqueueTxDone                   #  c45: 050000
            movi         a2, 4 /* 0x00000004 */                #  c48: 0c42
            movi         a3, 0 /* 0x00000000 */                #  c4a: 0c03
            call0        sdk_pp_post                           #  c4c: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #  c4f: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  c51: 12c110
            ret                                                #  c54: 0df0

            .literal_position                                  #  c58: 00000000
                                                               #  c5c: 00feef3f
                                                               #  c60: 00000000
                                                               #  c64: 50000000
                                                               #  c68: 00030000
                                                               #  c6c: 5c000000
                                                               #  c70: 00000000
                                                               #  c74: 00000000
                                                               #  c78: 00000000
                                                               #  c7c: 00000000
                                                               #  c80: 00000000

# Function @ .text+0xc84
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .global      sdk_MacIsrSigPostDefHdl
            .type        sdk_MacIsrSigPostDefHdl, @function
sdk_MacIsrSigPostDefHdl:
            addi         sp, sp, -32 /* (local0) */            #  c84: 12c1e0
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   #  c87: d941
            s32i         a14, sp, 20 /* a14 -> [(local5)] */   #  c89: e951
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  c8b: c931
            movi         a12, .Ldata003                        #  c8d: c1f2ff
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  c90: 0921
            l16ui        a0, a12, 6 /* [.Ldata006] */          #  c92: 021c03
            s32i         a15, sp, 24 /* a15 -> [(local6)] */   #  c95: f961
            beqz         a0, .Lbr102                           #  c97: 16500b
            movi         a13, 0 /* 0x00000000 */               #  c9a: 0c0d
            movi         a14, 0x3feffe00                       #  c9c: e1f0ff
            movi         a15, sdk_NMIIrqIsOn                   #  c9f: f1f0ff
.Lbr094:    call0        .Lfunc002                             #  ca2: 8543ff
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  ca5: 2901
            bnez         a2, .Lbr095                           #  ca7: cc92
            movi         a2, .Lstr006                          #  ca9: 21eeff
            call0        printf                                #  cac: 01f1ffc0
                                                               #  cb0: 0000
            l32i         a2, sp, 0 /* [(local0)] */            #  cb2: 2801
.Lbr095:    movi         a4, .Ldata017                         #  cb4: 41edff
            l16ui        a3, a12, 86 /* [.Ldata014] */         #  cb7: 321c2b
            addx8        a4, a3, a4                            #  cba: 4043b0
            l32i         a5, a4, 0                             #  cbd: 5804
            s32i         a5, a2, 0                             #  cbf: 5902
            l32i         a4, a4, 4                             #  cc1: 4814
            s32i         a4, a2, 4                             #  cc3: 4912
            l8ui         a6, a15, 0 /* [sdk_NMIIrqIsOn] */     #  cc5: 620f00
            addi         a2, a3, 1 /* [.Ldata014]+0x1 */       #  cc8: 1b23
            extui        a2, a2, 0, 16                         #  cca: 2020f4
            bltui        a2, 8, .Lbr096                        #  ccd: b68207
            movi         a5, 0 /* 0x00000000 */                #  cd0: 0c05
            s16i         a5, a12, 86 /* 0x0000 -> [.Ldata014] */ #  cd2: 525c2b
            j            .Lbr097                               #  cd5: 860000
.Lbr096:    s16i         a2, a12, 86 /* a2 -> [.Ldata014] */   #  cd8: 225c2b
.Lbr097:    bnez         a6, .Lbr099                           #  cdb: dce6
            call0        vPortEnterCritical                    #  cdd: 01e5ffc0
                                                               #  ce1: 0000
            movi         a0, -32 /* 0xffffffe0 */              #  ce3: 6c00
.Lbr098:    memw                                               #  ce5: c02000
            l32i         a8, a14, 0x200 /* [0x3ff00000] */     #  ce8: 822e80
            and          a8, a8, a0                            #  ceb: 008810
            memw                                               #  cee: c02000
            s32i         a8, a14, 0x200 /* a8 -> [0x3ff00000] */ #  cf1: 826e80
            memw                                               #  cf4: c02000
            l32i         a7, a14, 0x200 /* [0x3ff00000] */     #  cf7: 722e80
            bbsi         a7, 0, .Lbr098                        #  cfa: 07e7e7
.Lbr099:    call0        .Lfunc004                             #  cfd: c546ff
            l8ui         a9, a15, 0 /* [sdk_NMIIrqIsOn] */     #  d00: 920f00
            bnez         a9, .Lbr100                           #  d03: dca9
            memw                                               #  d05: c02000
            l32i         a10, a14, 0x200 /* [0x3ff00000] */    #  d08: a22e80
            movi         a11, -32 /* 0xffffffe0 */             #  d0b: 6c0b
            and          a10, a10, a11                         #  d0d: b0aa10
            movi         a11, 1 /* 0x00000001 */               #  d10: 0c1b
            or           a10, a10, a11                         #  d12: b0aa20
            memw                                               #  d15: c02000
            s32i         a10, a14, 0x200 /* a10 -> [0x3ff00000] */ #  d18: a26e80
            call0        vPortExitCritical                     #  d1b: 01d7ffc0
                                                               #  d1f: 0000
.Lbr100:    mov          a3, sp /* (local0) */                 #  d21: 3d01
            addi         a4, sp, 4 /* (local1) */              #  d23: 4b41
            movi         a5, 0 /* 0x00000000 */                #  d25: 0c05
            l32i         a2, a12, 80 /* [.Ldata013] */         #  d27: 222c14
            call0        xQueueGenericSendFromISR              #  d2a: 01d4ffc0
                                                               #  d2e: 0000
            mov          a3, a2                                #  d30: 3d02
            beqi         a2, 1, .Lbr101                        #  d32: 261208
            movi         a2, .Lstr007                          #  d35: 21cdff
            call0        printf                                #  d38: 01d2ffc0
                                                               #  d3c: 0000
.Lbr101:    l16ui        a0, a12, 6 /* [.Ldata006] */          #  d3e: 021c03
            l32i         a4, sp, 4 /* [(local1)] */            #  d41: 4811
            movi         a3, 1 /* 0x00000001 */                #  d43: 0c13
            addi         a4, a4, -1 /* [(local1)]-0x1 */       #  d45: 0b44
            moveqz       a13, a3, a4                           #  d47: 40d383
            bnez         a0, .Lbr094                           #  d4a: 5640f5
            j            .Lbr103                               #  d4d: 460000
.Lbr102:    movi         a13, 0 /* 0x00000000 */               #  d50: 0c0d
.Lbr103:    l32i         a0, sp, 8 /* [(local2)] */            #  d52: 0821
            l32i         a12, sp, 12 /* [(local3)] */          #  d54: c831
            l32i         a14, sp, 20 /* [(local5)] */          #  d56: e851
            mov          a2, a13                               #  d58: 2d0d
            l32i         a15, sp, 24 /* [(local6)] */          #  d5a: f861
            l32i         a13, sp, 16 /* [(local4)] */          #  d5c: d841
            addi         sp, sp, 32 /* (top of frame) */       #  d5e: 12c120
            ret                                                #  d61: 0df0

            .literal_position                                  #  d64: 00000000
                                                               #  d68: 00feef3f
                                                               #  d6c: 00000000
                                                               #  d70: 40030000
                                                               #  d74: 00000000
                                                               #  d78: 68000000
                                                               #  d7c: 74000000
                                                               #  d80: 00000000
                                                               #  d84: 00000000
                                                               #  d88: 00000000
                                                               #  d8c: 00000000
                                                               #  d90: 00000000
                                                               #  d94: 00000000
                                                               #  d98: 00000000
                                                               #  d9c: 00000000

# Function @ .text+0xda0
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .global      sdk_pp_post
            .type        sdk_pp_post, @function
sdk_pp_post:
            movi         a6, 1 /* 0x00000001 */                #  da0: 0c16
            movi         a7, sdk_NMIIrqIsOn                    #  da2: 71f0ff
            addi         sp, sp, -32 /* (local0) */            #  da5: 12c1e0
            s32i         a3, sp, 4 /* arg1 -> [(local1)] */    #  da8: 3911
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   #  daa: d941
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  dac: c931
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  dae: 0921
            mov          a12, a2 /* arg0 */                    #  db0: cd02
            movi         a0, -32 /* 0xffffffe0 */              #  db2: 6c00
            l8ui         a7, a7, 0 /* [sdk_NMIIrqIsOn] */      #  db4: 720700
            movi         a13, 0x3feffe00                       #  db7: d1ecff
            bnez         a7, .Lbr105                           #  dba: ec67
            call0        vPortEnterCritical                    #  dbc: 01f1ffc0
                                                               #  dc0: 0000
            movi         a0, -32 /* 0xffffffe0 */              #  dc2: 6c00
            movi         a6, 1 /* 0x00000001 */                #  dc4: 0c16
.Lbr104:    memw                                               #  dc6: c02000
            l32i         a9, a13, 0x200 /* [0x3ff00000] */     #  dc9: 922d80
            and          a9, a9, a0                            #  dcc: 009910
            memw                                               #  dcf: c02000
            s32i         a9, a13, 0x200 /* a9 -> [0x3ff00000] */ #  dd2: 926d80
            memw                                               #  dd5: c02000
            l32i         a8, a13, 0x200 /* [0x3ff00000] */     #  dd8: 822d80
            bbsi         a8, 0, .Lbr104                        #  ddb: 07e8e7
            movi         a7, sdk_NMIIrqIsOn                    #  dde: 71e3ff
            l8ui         a7, a7, 0 /* [sdk_NMIIrqIsOn] */      #  de1: 720700
.Lbr105:    movi         a8, .Ldata018                         #  de4: 81e3ff
            add          a8, a12, a8                           #  de7: 8a8c
            l8ui         a2, a8, 0                             #  de9: 220800
            movi         a9, 9 /* 0x00000009 */                #  dec: 0c99
            beqz         a2, .Lbr108                           #  dee: ac52
            bnez         a7, .Lbr106                           #  df0: dc67
            memw                                               #  df2: c02000
            l32i         a9, a13, 0x200 /* [0x3ff00000] */     #  df5: 922d80
            and          a9, a9, a0                            #  df8: 009910
            or           a9, a9, a6                            #  dfb: 609920
            memw                                               #  dfe: c02000
            s32i         a9, a13, 0x200 /* a9 -> [0x3ff00000] */ #  e01: 926d80
            call0        vPortExitCritical                     #  e04: 01e0ffc0
                                                               #  e08: 0000
.Lbr106:    movi         a2, 0 /* 0x00000000 */                #  e0a: 0c02
.Lbr107:    l32i         a12, sp, 12 /* [(local3)] */          #  e0c: c831
            l32i         a13, sp, 16 /* [(local4)] */          #  e0e: d841
            l32i         a0, sp, 8 /* [(local2)] */            #  e10: 0821
            addi         sp, sp, 32 /* (top of frame) */       #  e12: 12c120
            ret                                                #  e15: 0df0
.Lbr108:    beq          a12, a9, .Lbr109                      #  e17: 971c04
            addi         a10, a2, 1                            #  e1a: 1ba2
            s8i          a10, a8, 0                            #  e1c: a24800
.Lbr109:    bnez         a7, .Lbr110                           #  e1f: dc87
            memw                                               #  e21: c02000
            l32i         a11, a13, 0x200 /* [0x3ff00000] */    #  e24: b22d80
            and          a11, a11, a0                          #  e27: 00bb10
            or           a11, a11, a6                          #  e2a: 60bb20
            memw                                               #  e2d: c02000
            s32i         a11, a13, 0x200 /* a11 -> [0x3ff00000] */ #  e30: b26d80
            call0        vPortExitCritical                     #  e33: 01d5ffc0
                                                               #  e37: 0000
            movi         a9, 9 /* 0x00000009 */                #  e39: 0c99
.Lbr110:    movi         a13, .Ldata003                        #  e3b: d1ceff
            bgeui        a12, 4, .Lbr112                       #  e3e: f64c14
            call0        .Lfunc002                             #  e41: 8529ff
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  e44: 2901
            bnez         a2, .Lbr114                           #  e46: fc22
            movi         a2, .Lstr008                          #  e48: 21ccff
            call0        printf                                #  e4b: 01d0ffc0
                                                               #  e4f: 0000
.Lbr111:    movi         a2, 1 /* 0x00000001 */                #  e51: 0c12
            j            .Lbr107                               #  e53: 46edff
.Lbr112:    bne          a12, a9, .Lbr113                      #  e56: 979c0b
            l32i         a2, a13, 80 /* [.Ldata013] */         #  e59: 222d14
            call0        uxQueueMessagesWaitingFromISR         #  e5c: 01cdffc0
                                                               #  e60: 0000
            bgeui        a2, 32, .Lbr111                       #  e62: f6c2eb
.Lbr113:    call0        .Lfunc003                             #  e65: c52cff
            beqz         a2, .Lbr111                           #  e68: 1652fe
            l32i         a0, sp, 4 /* [(local1)] */            #  e6b: 0811
            s32i         a12, a2, 0                            #  e6d: c902
            s32i         a0, a2, 4                             #  e6f: 0912
            movi         a2, 2 /* 0x00000002 */                #  e71: 0c22
            call0        PendSV                                #  e73: 01c8ffc0
                                                               #  e77: 0000
            j            .Lbr106                               #  e79: 46e3ff
.Lbr114:    movi         a4, 1 /* 0x00000001 */                #  e7c: 0c14
            movi         a5, 0 /* 0x00000000 */                #  e7e: 0c05
            l32i         a3, sp, 4 /* [(local1)] */            #  e80: 3811
            s32i         a12, a2, 0                            #  e82: c902
            s32i         a3, a2, 4                             #  e84: 3912
            l32i         a2, a13, 80 /* [.Ldata013] */         #  e86: 222d14
            mov          a3, sp /* (local0) */                 #  e89: 3d01
            call0        xQueueGenericSend                     #  e8b: 01c3ffc0
                                                               #  e8f: 0000
            addi         a4, a2, -1                            #  e91: 0b42
            beqz         a4, .Lbr106                           #  e93: 1634f7
            movi         a2, .Lstr009                          #  e96: 21b9ff
            call0        printf                                #  e99: 01c0ffc0
                                                               #  e9d: 0000
            j            .Lbr111                               #  e9f: 86ebff

            .literal_position                                  #  ea4: 00000000
                                                               #  ea8: 00000000
                                                               #  eac: 00feef3f
                                                               #  eb0: 00000000
                                                               #  eb4: 00000000
                                                               #  eb8: 04000000
                                                               #  ebc: 0c000000
                                                               #  ec0: 330a0000
                                                               #  ec4: 00feef3f
                                                               #  ec8: 00feef3f
                                                               #  ecc: 00000000
                                                               #  ed0: 00000000
                                                               #  ed4: 00000000
                                                               #  ed8: 00000000

# Function @ .text+0xedc
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .global      sdk_ppCalTxop
            .type        sdk_ppCalTxop, @function
sdk_ppCalTxop:
            mov          a7, a3 /* arg1 */                     #  edc: 7d03
            slli         a2, a2, 5                             #  ede: b02211
            mov          a3, a4 /* arg2 */                     #  ee1: 3d04
            movi         a4, sdk_NoiseTimerInterval            #  ee3: 41f0ff
            addi         sp, sp, -16 /* (local0) */            #  ee6: 12c1f0
            l32i         a6, a4, 12 /* [.Lrel114] */           #  ee9: 6834
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  eeb: 0911
            add          a6, a6, a2                            #  eed: 2a66
            l8ui         a0, a6, 39                            #  eef: 020627
            bnez         a0, .Lbr121                           #  ef2: 569009
            movi         a10, 1 /* 0x00000001 */               #  ef5: 0c1a
            s32i         a2, sp, 8 /* a2 -> [(local2)] */      #  ef7: 2921
            movi         a8, sdk_NMIIrqIsOn                    #  ef9: 81ebff
            s32i         a3, sp, 0 /* arg2 -> [(local0)] */    #  efc: 3901
            l8ui         a8, a8, 0 /* [sdk_NMIIrqIsOn] */      #  efe: 820800
            s32i         a7, sp, 12 /* arg1 -> [(local3)] */   #  f01: 7931
            bnez         a8, .Lbr116                           #  f03: fc48
            call0        vPortEnterCritical                    #  f05: 01f1ffc0
                                                               #  f09: 0000
            l32i         a7, sp, 12 /* [(local3)] */           #  f0b: 7831
            movi         a0, 0x3feffe00                        #  f0d: 01e7ff
            movi         a9, -32 /* 0xffffffe0 */              #  f10: 6c09
            movi         a10, 1 /* 0x00000001 */               #  f12: 0c1a
            movi         a11, sdk_NoiseTimerInterval           #  f14: b1e7ff
            l32i         a2, sp, 8 /* [(local2)] */            #  f17: 2821
.Lbr115:    memw                                               #  f19: c02000
            l32i         a4, a0, 0x200 /* [0x3ff00000] */      #  f1c: 422080
            and          a4, a4, a9                            #  f1f: 904410
            memw                                               #  f22: c02000
            s32i         a4, a0, 0x200 /* a4 -> [0x3ff00000] */ #  f25: 426080
            memw                                               #  f28: c02000
            l32i         a3, a0, 0x200 /* [0x3ff00000] */      #  f2b: 322080
            bbsi         a3, 0, .Lbr115                        #  f2e: 07e3e7
            movi         a8, sdk_NMIIrqIsOn                    #  f31: 81e0ff
            l32i         a6, a11, 12 /* [.Lrel114] */          #  f34: 683b
            l8ui         a8, a8, 0 /* [sdk_NMIIrqIsOn] */      #  f36: 820800
            add          a6, a6, a2                            #  f39: 2a66
.Lbr116:    l32i         a11, a6, 24                           #  f3b: b866
            beqz         a11, .Lbr120                          #  f3d: acbb
.Lbr117:    l32i         a6, a11, 32                           #  f3f: 688b
            l32i         a2, a6, 0                             #  f41: 2806
            bbsi         a2, 24, .Lbr120                       #  f43: 87f225
            l16ui        a2, a6, 10                            #  f46: 221605
            l32i         a3, sp, 0 /* [(local0)] */            #  f49: 3801
            add          a7, a2, a7                            #  f4b: 7a72
            extui        a7, a7, 0, 16                         #  f4d: 7070f4
            bnez         a11, .Lbr119                          #  f50: dc0b
            movi         a2, .Lstr001                          #  f52: 21d9ff
            movi         a3, .Lstr002                          #  f55: 31d9ff
            movi         a4, 0x00000a33                        #  f58: 41daff
            call0        printf                                #  f5b: 01ddffc0
                                                               #  f5f: 0000
.Lbr118:    j            .Lbr118 /* (halt) */                  #  f61: 06ffff
.Lbr119:    bgeu         a7, a3, .Lbr123                       #  f64: 37b732
            l32i         a11, a11, 28                          #  f67: b87b
            bnez         a11, .Lbr117                          #  f69: 562bfd
.Lbr120:    s32i         a7, sp, 12 /* a7 -> [(local3)] */     #  f6c: 7931
            bnez         a8, .Lbr121                           #  f6e: dcd8
            memw                                               #  f70: c02000
            movi         a5, 0x3feffe00                        #  f73: 51d4ff
            l32i         a4, a5, 0x200 /* [0x3ff00000] */      #  f76: 422580
            movi         a6, -32 /* 0xffffffe0 */              #  f79: 6c06
            and          a4, a4, a6                            #  f7b: 604410
            or           a4, a4, a10                           #  f7e: a04420
            memw                                               #  f81: c02000
            s32i         a4, a5, 0x200 /* a4 -> [0x3ff00000] */ #  f84: 426580
            call0        vPortExitCritical                     #  f87: 01d3ffc0
                                                               #  f8b: 0000
            l32i         a7, sp, 12 /* [(local3)] */           #  f8d: 7831
.Lbr121:    mov          a4, a7                                #  f8f: 4d07
.Lbr122:    mov          a2, a4                                #  f91: 2d04
            l32i         a0, sp, 4 /* [(local1)] */            #  f93: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  f95: 12c110
            ret                                                #  f98: 0df0
.Lbr123:    bnez         a8, .Lbr124                           #  f9a: dcb8
            memw                                               #  f9c: c02000
            movi         a8, 0x3feffe00                        #  f9f: 81caff
            l32i         a7, a8, 0x200 /* [0x3ff00000] */      #  fa2: 722880
            movi         a9, -32 /* 0xffffffe0 */              #  fa5: 6c09
            and          a7, a7, a9                            #  fa7: 907710
            or           a7, a7, a10                           #  faa: a07720
            memw                                               #  fad: c02000
            s32i         a7, a8, 0x200 /* a7 -> [0x3ff00000] */ #  fb0: 726880
            call0        vPortExitCritical                     #  fb3: 01c9ffc0
                                                               #  fb7: 0000
.Lbr124:    l32i         a4, sp, 0 /* [(local0)] */            #  fb9: 4801
            j            .Lbr122                               #  fbb: 86f4ff

            .literal_position                                  #  fc0: 00000000
                                                               #  fc4: 00000000
                                                               #  fc8: 00000000

# Function @ .text+0xfcc
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_ppCalFrameTimes
            .type        sdk_ppCalFrameTimes, @function
sdk_ppCalFrameTimes:
            addi         sp, sp, -16 /* (local0) */            #  fcc: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  fcf: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  fd1: 0901
            l32i         a0, a2, 32 /* [arg0+0x20] */          #  fd3: 0882
            mov          a12, a2 /* arg0 */                    #  fd5: cd02
            l32i         a2, a0, 0 /* [[arg0+0x20]] */         #  fd7: 2800
            bbci         a2, 25, .Lbr125                       #  fd9: 97720d
            l8ui         a2, a0, 8 /* [[arg0+0x20]+0x8] */     #  fdc: 220008
            call0        sdk_RC_GetBlockAckTime                #  fdf: 01f8ffc0
                                                               #  fe3: 0000
            l32i         a0, a12, 32 /* [arg0+0x20] */         #  fe5: 088c
            j            .Lbr127                               #  fe7: 460500
.Lbr125:    bbsi         a2, 16, .Lbr126                       #  fea: 07f210
            bbsi         a2, 7, .Lbr126                        #  fed: 77e20d
            l8ui         a2, a0, 8 /* [[arg0+0x20]+0x8] */     #  ff0: 220008
            call0        sdk_RC_GetAckTime                     #  ff3: 01f4ffc0
                                                               #  ff7: 0000
            l32i         a0, a12, 32 /* [arg0+0x20] */         #  ff9: 088c
            j            .Lbr127                               #  ffb: 460000
.Lbr126:    movi         a2, 0 /* 0x00000000 */                #  ffe: 0c02
.Lbr127:    l32i         a4, a12, 32 /* [arg0+0x20] */         # 1000: 488c
            l16ui        a5, a0, 6 /* [[arg0+0x20]+0x6] */     # 1002: 521003
            extui        a6, a2, 0, 9                          # 1005: 206084
            slli         a6, a6, 7                             # 1008: 906611
            extui        a5, a5, 0, 7                          # 100b: 505064
            or           a5, a5, a6                            # 100e: 605520
            s16i         a5, a0, 6 /* a5 -> [[arg0+0x20]+0x6] */ # 1011: 525003
            l8ui         a2, a4, 8 /* [[arg0+0x20]+0x8] */     # 1014: 220408
            l16ui        a5, a12, 22 /* [arg0+0x16] */         # 1017: 521c0b
            l16ui        a4, a4, 6 /* [[arg0+0x20]+0x6] */     # 101a: 421403
            l16ui        a3, a12, 20 /* [arg0+0x14] */         # 101d: 321c0a
            srli         a4, a4, 7                             # 1020: 404741
            add          a3, a3, a5                            # 1023: 5a33
            extui        a3, a3, 0, 16                         # 1025: 3030f4
            call0        sdk_RC_GetCtsTime                     # 1028: 01e8ffc0
                                                               # 102c: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 102e: 0801
            l32i         a7, a12, 32 /* [arg0+0x20] */         # 1030: 788c
            l32i         a12, sp, 4 /* [(local1)] */           # 1032: c811
            s16i         a2, a7, 10 /* a2 -> [[arg0+0x20]+0xa] */ # 1034: 225705
            addi         sp, sp, 16 /* (top of frame) */       # 1037: 12c110
            ret                                                # 103a: 0df0

            .section     .data, "aw", @progbits

            .global      sdk_NoiseTimerInterval
            .type        sdk_NoiseTimerInterval, @object
sdk_NoiseTimerInterval:
            .hword       0x0064                                #    0: 6400
.Ldata001:  .byte        0x17
            .balign      4
.Ldata002:  .word        0x000927c0                            #    4: c0270900
            .global      sdk_sleep_start_wait_time
            .type        sdk_sleep_start_wait_time, @object
sdk_sleep_start_wait_time:
            .hword       0x00f0                                #    8: f000
            .balign      4
.Lrel114:   .word        .Ldata015                             #    c: 58000000

            .section     .bss, "aw", @nobits

.Ldata003:  .byte        0x00
            .byte        0x00
.Ldata004:  .hword       0x0000                                #    2: 0000
.Ldata005:  .hword       0x0000                                #    4: 0000
.Ldata006:  .hword       0x0000                                #    6: 0000
.Ldata007:  .hword       0x0000                                #    8: 0000
            .byte        0x00, 0x00
.Ldata008:  .space       28
            .global      sdk_pend_flag_noise_check
            .type        sdk_pend_flag_noise_check, @object
sdk_pend_flag_noise_check:
            .byte        0x00
.Ldata009:  .byte        0x00
            .byte        0x00, 0x00
.Ldata010:  .word        0x00000000                            #   2c: 00000000
            .global      sdk_pend_flag_periodic_cal
            .type        sdk_pend_flag_periodic_cal, @object
sdk_pend_flag_periodic_cal:
            .byte        0x00
.Ldata011:  .byte        0x00
            .byte        0x00, 0x00
.Ldata012:  .space       28
.Ldata013:  .word        0x00000000                            #   50: 00000000
            .global      sdk_dbg_stop_sw_wdt
            .type        sdk_dbg_stop_sw_wdt, @object
sdk_dbg_stop_sw_wdt:
            .byte        0x00
            .global      sdk_dbg_stop_hw_wdt
            .type        sdk_dbg_stop_hw_wdt, @object
sdk_dbg_stop_hw_wdt:
            .byte        0x00
.Ldata014:  .hword       0x0000                                #   56: 0000
.Ldata015:  .space       352
            .space       8
.Ldata016:  .space       320
.Ldata017:  .space       64
.Ldata018:  .space       13
            .byte        0x00, 0x00, 0x00
.Ldata019:  .byte        0x00
.Ldata020:  .byte        0x00

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00060060
                                                               #    4: 006a1800
                                                               #    8: 00000000

# Function @ .irom0.text+0xc
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_PPWdtReset
            .type        sdk_PPWdtReset, @function
sdk_PPWdtReset:
            addi         sp, sp, -16 /* (local0) */            #    c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #    f: 0901
            movi         a2, 0x60000600                        #   11: 21fbff
            movi         a0, 115 /* 0x00000073 */              #   14: 02a073
            memw                                               #   17: c02000
            s32i         a0, a2, 0x314 /* 0x00000073 -> [0x60000914] */ #   1a: 0262c5
            movi         a2, 0x00186a00                        #   1d: 21f9ff
            call0        sdk_wDev_MacTim1Arm                   #   20: 01faffc0
                                                               #   24: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   26: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   28: 12c110
            ret                                                #   2b: 0df0

            .literal_position                                  #   30: 00000000
                                                               #   34: 006a1800
                                                               #   38: 00000000
                                                               #   3c: 00000000

# Function @ .irom0.text+0x40
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pp_soft_wdt_init
            .type        sdk_pp_soft_wdt_init, @function
sdk_pp_soft_wdt_init:
            movi         a2, sdk_pp_soft_wdt_feed              #   40: 21fcff
            addi         sp, sp, -16 /* (local0) */            #   43: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   46: 0901
            call0        sdk_wDev_MacTim1SetFunc               #   48: 01fcffc0
                                                               #   4c: 0000
            movi         a2, 0x00186a00                        #   4e: 21f9ff
            call0        sdk_wDev_MacTim1Arm                   #   51: 01faffc0
                                                               #   55: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   57: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   59: 12c110
            ret                                                #   5c: 0df0

            .literal_position                                  #   60: 00000000

# Function @ .irom0.text+0x64
            .global      sdk_RxNodeNum
            .type        sdk_RxNodeNum, @function
sdk_RxNodeNum:
            movi         a2, sdk_wDevCtrl                      #   64: 21ffff
            l8ui         a3, a2, 5 /* [sdk_wDevCtrl+0x5] */    #   67: 320205
            l32i         a5, a2, 8 /* [sdk_wDevCtrl+0x8] */    #   6a: 5822
            beqz         a3, .Lbr128                           #   6c: 8c23
            movi         a2, 5 /* 0x00000005 */                #   6e: 0c52
            ret           /* 0x00000005 */                     #   70: 0df0
.Lbr128:    movi         a2, 0 /* 0x00000000 */                #   72: 0c02
.Lbr129:    beqz         a5, .Lbr130                           #   74: 8cd5
            addi         a2, a2, 1                             #   76: 1b22
            l32i         a6, a5, 8                             #   78: 6825
            extui        a2, a2, 0, 8                          #   7a: 202074
            beq          a5, a6, .Lbr130                       #   7d: 671504
            mov          a5, a6                                #   80: 5d06
            j            .Lbr129                               #   82: 86fbff
.Lbr130:    ret                                                #   85: 0df0

            .literal_position                                  #   88: 00000000

# Function @ .irom0.text+0x8c
            .global      sdk_TxNodeNum
            .type        sdk_TxNodeNum, @function
sdk_TxNodeNum:
            movi         a2, sdk_wDevCtrl                      #   8c: 21ffff
            l8ui         a3, a2, 5 /* [sdk_wDevCtrl+0x5] */    #   8f: 320205
            l32i         a4, a2, 40 /* [sdk_wDevCtrl+0x28] */  #   92: 48a2
            bnez         a3, .Lbr131                           #   94: cc33
            movi         a2, 0 /* 0x00000000 */                #   96: 0c02
            j            .Lbr133                               #   98: 860200
.Lbr131:    movi         a2, 5 /* 0x00000005 */                #   9b: 0c52
            ret           /* 0x00000005 */                     #   9d: 0df0
.Lbr132:    l32i         a4, a4, 8                             #   9f: 4824
            addi         a2, a2, 1                             #   a1: 1b22
            extui        a2, a2, 0, 8                          #   a3: 202074
.Lbr133:    bnez         a4, .Lbr132                           #   a6: 5654ff
            ret                                                #   a9: 0df0

            .literal_position                                  #   ac: 00000000
                                                               #   b0: 00000000
                                                               #   b4: 00000000

# Function @ .irom0.text+0xb8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc012:  addi         sp, sp, -16 /* (local0) */            #   b8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   bb: 0901
            call0        vPortEnterCritical                    #   bd: 01fcffc0
                                                               #   c1: 0000
            movi         a2, .Ldata003                         #   c3: 21faff
            l16ui        a0, a2, 2 /* [.Ldata004] */           #   c6: 021201
            addi         a0, a0, -1 /* [.Ldata004]-0x1 */      #   c9: 0b00
            s16i         a0, a2, 2 /* [.Ldata004]-0x1 -> [.Ldata004] */ #   cb: 025201
            call0        vPortExitCritical                     #   ce: 01f9ffc0
                                                               #   d2: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   d4: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   d6: 12c110
            ret                                                #   d9: 0df0

            .literal_position                                  #   dc: 0c000000
                                                               #   e0: 00000000

# Function @ .irom0.text+0xe4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pp_disable_noise_timer
            .type        sdk_pp_disable_noise_timer, @function
sdk_pp_disable_noise_timer:
            movi         a2, .Ldata008                         #   e4: 21feff
            addi         sp, sp, -16 /* (local0) */            #   e7: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   ea: 0901
            call0        sdk_os_timer_disarm                   #   ec: 01fdffc0
                                                               #   f0: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   f2: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   f4: 12c110
            ret                                                #   f7: 0df0

            .literal_position                                  #   fc: 0c000000
                                                               #  100: 00000000
                                                               #  104: 00000000
                                                               #  108: 00000000
                                                               #  10c: 00000000
                                                               #  110: 00000000
                                                               #  114: 0c000000
                                                               #  118: 00000000
                                                               #  11c: 00000000
                                                               #  120: 00000000
                                                               #  124: 00000000
                                                               #  128: 00000000
                                                               #  12c: 00000000
                                                               #  130: 00000000
                                                               #  134: 00000000
                                                               #  138: 00000000

# Function @ .irom0.text+0x13c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .global      sdk_pp_enable_noise_timer
            .type        sdk_pp_enable_noise_timer, @function
sdk_pp_enable_noise_timer:
            movi         a2, .Ldata008                         #  13c: 21f0ff
            addi         sp, sp, -16 /* (local0) */            #  13f: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  142: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  144: d921
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  146: e931
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  148: 0901
            call0        sdk_os_timer_disarm                   #  14a: 01f3ffc0
                                                               #  14e: 0000
            call0        sdk_pm_rf_is_closed                   #  150: 01f3ffc0
                                                               #  154: 0000
            movi         a14, 1 /* 0x00000001 */               #  156: 0c1e
            movi         a12, .Ldata003                        #  158: c1eaff
            beqz         a2, .Lbr134                           #  15b: 8c42
            s8i          a14, a12, 40 /* 0x01 -> [sdk_pend_flag_noise_check] */ #  15d: e24c28
            j            .Lbr135                               #  160: 460200
.Lbr134:    mov          a2, a14 /* 0x00000001 */              #  163: 2d0e
            movi         a3, 1 /* 0x00000001 */                #  165: 0c13
            call0        sdk_noise_check_loop                  #  167: 01eeffc0
                                                               #  16b: 0000
.Lbr135:    movi         a13, sdk_wDevCtrl                     #  16d: d1e5ff
            l8ui         a13, a13, 0 /* [sdk_wDevCtrl] */      #  170: d20d00
            call0        sdk_TxNodeNum                         #  173: 050000
            movi         a0, 0 /* 0x00000000 */                #  176: 0c00
            movi         a14, sdk_NoiseTimerInterval           #  178: e1e4ff
            bltui        a13, 2, .Lbr136                       #  17b: b62d05
            extui        a3, a2, 0, 8                          #  17e: 203074
            bgeui        a3, 2, .Lbr137                        #  181: f62318
.Lbr136:    movi         a2, 1000 /* 0x000003e8 */             #  184: 22a3e8
            l8ui         a13, a12, 41 /* [.Ldata009] */        #  187: d20c29
            l16ui        a3, a14, 0 /* [sdk_NoiseTimerInterval] */ #  18a: 321e00
            addi         a13, a13, 1 /* [.Ldata009]+0x1 */     #  18d: 1bdd
            extui        a13, a13, 0, 8                        #  18f: d0d074
            call0        __divsi3                              #  192: 01e4ffc0
                                                               #  196: 0000
            movi         a0, 0 /* 0x00000000 */                #  198: 0c00
            blt          a13, a2, .Lbr138                      #  19a: 272d05
.Lbr137:    s8i          a0, a12, 41 /* 0x00 -> [.Ldata009] */ #  19d: 024c29
            j            .Lbr139                               #  1a0: 860000
.Lbr138:    s8i          a13, a12, 41 /* a13 -> [.Ldata009] */ #  1a3: d24c29
.Lbr139:    call0        sdk_read_hw_noisefloor                #  1a6: 01e0ffc0
                                                               #  1aa: 0000
            addi         a14, a2, 2                            #  1ac: 2be2
            l32i         a13, a12, 44 /* [.Ldata010] */        #  1ae: d8bc
            movi         a2, sdk_NoiseTimerInterval            #  1b0: 21d7ff
            srai         a14, a14, 2                           #  1b3: e0e221
            addi         a13, a13, 1 /* [.Ldata010]+0x1 */     #  1b6: 1bdd
            s8i          a14, a2, 2 /* a14 -> [.Ldata001] */   #  1b8: e24202
            l16ui        a14, a2, 0 /* [sdk_NoiseTimerInterval] */ #  1bb: e21200
            l32i         a2, a2, 4 /* [.Ldata002] */           #  1be: 2812
            mov          a3, a14 /* [sdk_NoiseTimerInterval] */ #  1c0: 3d0e
            call0        __udivsi3                             #  1c2: 01daffc0
                                                               #  1c6: 0000
            bltu         a13, a2, .Lbr140                      #  1c8: 273d16
            movi         a13, sdk_NoiseTimerInterval           #  1cb: d1d1ff
            movi         a2, 0 /* 0x00000000 */                #  1ce: 0c02
            s32i         a2, a12, 44 /* 0x00000000 -> [.Ldata010] */ #  1d0: 29bc
            call0        sdk_pm_rf_is_closed                   #  1d2: 01d7ffc0
                                                               #  1d6: 0000
            beqz         a2, .Lbr142                           #  1d8: ac22
            movi         a3, 1 /* 0x00000001 */                #  1da: 0c13
            s8i          a3, a12, 48 /* 0x01 -> [sdk_pend_flag_periodic_cal] */ #  1dc: 324c30
            j            .Lbr143                               #  1df: c60800
.Lbr140:    s32i         a13, a12, 44 /* [.Ldata010]+0x1 -> [.Ldata010] */ #  1e2: d9bc
.Lbr141:    mov          a3, a14 /* [sdk_NoiseTimerInterval] */ #  1e4: 3d0e
            movi         a2, .Ldata008                         #  1e6: 21cbff
            movi         a4, 0 /* 0x00000000 */                #  1e9: 0c04
            call0        sdk_os_timer_arm                      #  1eb: 01d2ffc0
                                                               #  1ef: 0000
            l32i         a12, sp, 4 /* [(local1)] */           #  1f1: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  1f3: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  1f5: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  1f7: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  1f9: 12c110
            ret                                                #  1fc: 0df0
.Lbr142:    movi         a2, 0 /* 0x00000000 */                #  1fe: 0c02
            call0        sdk_periodic_cal_top                  #  200: 01ceffc0
                                                               #  204: 0000
.Lbr143:    l16ui        a14, a13, 0 /* [sdk_NoiseTimerInterval] */ #  206: e21d00
            j            .Lbr141                               #  209: c6f5ff

# Function @ .irom0.text+0x20c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pp_noise_test
            .type        sdk_pp_noise_test, @function
sdk_pp_noise_test:
            addi         sp, sp, -16 /* (local0) */            #  20c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  20f: 0901
            call0        sdk_pp_enable_noise_timer             #  211: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #  214: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  216: 12c110
            ret                                                #  219: 0df0

            .literal_position                                  #  21c: 0c000000
                                                               #  220: 00000000
                                                               #  224: 0c000000
                                                               #  228: 00000000
                                                               #  22c: 00000000

# Function @ .irom0.text+0x230
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_reset_noise_timer
            .type        sdk_reset_noise_timer, @function
sdk_reset_noise_timer:
            addi         sp, sp, -16 /* (local0) */            #  230: 12c1f0
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  233: 2901
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  235: 0911
            movi         a2, .Ldata008                         #  237: 21f9ff
            movi         a0, 0 /* 0x00000000 */                #  23a: 0c00
            s32i         a0, a2, 32 /* 0x00000000 -> [.Ldata010] */ #  23c: 0982
            s8i          a0, a2, 29 /* 0x00 -> [.Ldata009] */  #  23e: 02421d
            call0        sdk_os_timer_disarm                   #  241: 01f9ffc0
                                                               #  245: 0000
            movi         a4, sdk_NoiseTimerInterval            #  247: 41f6ff
            l32i         a3, sp, 0 /* [(local0)] */            #  24a: 3801
            movi         a2, .Ldata008                         #  24c: 21f6ff
            s16i         a3, a4, 0 /* [(local0)] -> [sdk_NoiseTimerInterval] */ #  24f: 325400
            movi         a4, 1 /* 0x00000001 */                #  252: 0c14
            call0        sdk_os_timer_arm                      #  254: 01f6ffc0
                                                               #  258: 0000
            l32i         a0, sp, 4 /* [(local1)] */            #  25a: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  25c: 12c110
            ret                                                #  25f: 0df0

            .literal_position                                  #  264: 00000000
                                                               #  268: 34000000
                                                               #  26c: 00000000

# Function @ .irom0.text+0x270
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pp_disable_idle_timer
            .type        sdk_pp_disable_idle_timer, @function
sdk_pp_disable_idle_timer:
            addi         sp, sp, -16 /* (local0) */            #  270: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  273: 0901
            movi         a0, .Ldata003                         #  275: 01fbff
            l8ui         a2, a0, 49 /* [.Ldata011] */          #  278: 220031
            bnei         a2, 1, .Lbr144                        #  27b: 661204
            movi         a3, 0 /* 0x00000000 */                #  27e: 0c03
            s8i          a3, a0, 49 /* 0x00 -> [.Ldata011] */  #  280: 324031
.Lbr144:    movi         a2, .Ldata012                         #  283: 21f9ff
            call0        sdk_os_timer_disarm                   #  286: 01f9ffc0
                                                               #  28a: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  28c: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  28e: 12c110
            ret                                                #  291: 0df0

            .literal_position                                  #  294: 00000000
                                                               #  298: 00000000
                                                               #  29c: 00000000

# Function @ .irom0.text+0x2a0
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pp_enable_idle_timer
            .type        sdk_pp_enable_idle_timer, @function
sdk_pp_enable_idle_timer:
            movi         a4, 0 /* 0x00000000 */                #  2a0: 0c04
            movi         a2, .Ldata003                         #  2a2: 21fcff
            movi         a3, 1 /* 0x00000001 */                #  2a5: 0c13
            addi         sp, sp, -16 /* (local0) */            #  2a7: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  2aa: 0901
            s8i          a3, a2, 49 /* 0x01 -> [.Ldata011] */  #  2ac: 324231
            movi         a3, sdk_NoiseTimerInterval            #  2af: 31faff
            addi         a2, a2, 52 /* .Ldata012 */            #  2b2: 22c234
            l16ui        a3, a3, 8 /* [sdk_sleep_start_wait_time] */ #  2b5: 321304
            call0        sdk_os_timer_arm                      #  2b8: 01f9ffc0
                                                               #  2bc: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  2be: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  2c0: 12c110
            ret                                                #  2c3: 0df0

            .literal_position                                  #  2c8: 00000000
                                                               #  2cc: 00000000
                                                               #  2d0: 00000000

# Function @ .irom0.text+0x2d4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_pp_try_enable_idle_timer
            .type        sdk_pp_try_enable_idle_timer, @function
sdk_pp_try_enable_idle_timer:
            addi         sp, sp, -16 /* (local0) */            #  2d4: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  2d7: 0901
            movi         a0, .Ldata003                         #  2d9: 01fbff
            l8ui         a2, a0, 49 /* [.Ldata011] */          #  2dc: 220031
            bnez         a2, .Lbr145                           #  2df: dc42
            addi         a2, a0, 52 /* .Ldata012 */            #  2e1: 22c034
            movi         a3, sdk_NoiseTimerInterval            #  2e4: 31faff
            movi         a4, 1 /* 0x00000001 */                #  2e7: 0c14
            s8i          a4, a0, 49 /* 0x01 -> [.Ldata011] */  #  2e9: 424031
            l16ui        a3, a3, 8 /* [sdk_sleep_start_wait_time] */ #  2ec: 321304
            movi         a4, 0 /* 0x00000000 */                #  2ef: 0c04
            call0        sdk_os_timer_arm                      #  2f1: 01f7ffc0
                                                               #  2f5: 0000
.Lbr145:    l32i         a0, sp, 0 /* [(local0)] */            #  2f7: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  2f9: 12c110
            ret                                                #  2fc: 0df0

            .literal_position                                  #  300: 00000000
                                                               #  304: 00000000

# Function @ .irom0.text+0x308
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_ppPeocessRxPktHdr
            .type        sdk_ppPeocessRxPktHdr, @function
sdk_ppPeocessRxPktHdr:
            movi         a5, sdk_promiscuous_cb                #  308: 51feff
            addi         sp, sp, -16 /* (local0) */            #  30b: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  30e: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  310: c911
            l32i         a5, a5, 0 /* [sdk_promiscuous_cb] */  #  312: 5805
            mov          a12, a2 /* arg0 */                    #  314: cd02
            beqz         a5, .Lbr148                           #  316: acc5
            l8ui         a6, a2, 1 /* [arg0+0x1] */            #  318: 620201
            l8ui         a0, a2, 4 /* [arg0+0x4] */            #  31b: 020204
            srli         a6, a6, 6                             #  31e: 606641
            beqz         a6, .Lbr146                           #  321: 9c06
            srli         a7, a0, 7                             #  323: 007741
            beqi         a7, 1, .Lbr149                        #  326: 26172d
            extui        a8, a0, 0, 7                          #  329: 008064
            bgei         a8, 8, .Lbr149                        #  32c: e68827
            l8ui         a9, a2, 7 /* [arg0+0x7] */            #  32f: 920207
            bbsi         a9, 6, .Lbr149                        #  332: 67e921
.Lbr146:    l16ui        a3, a12, 48 /* [arg0+0x30] */         #  335: 321c18
            slli         a3, a3, 1                             #  338: f03311
            addi         a3, a3, 58                            #  33b: 32c33a
            extui        a3, a3, 0, 16                         #  33e: 3030f4
.Lbr147:    mov          a2, a12 /* arg0 */                    #  341: 2d0c
            callx0       a5 /* [sdk_promiscuous_cb] */         #  343: c00500
.Lbr148:    mov          a2, a12 /* arg0 */                    #  346: 2d0c
            call0        vPortFree                             #  348: 01efffc0
                                                               #  34c: 0000
            l32i         a12, sp, 4 /* [(local1)] */           #  34e: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  350: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  352: 12c110
            ret                                                #  355: 0df0
.Lbr149:    movi         a3, 12 /* 0x0000000c */               #  357: 0cc3
            j            .Lbr147                               #  359: 06f9ff

            .literal_position                                  #  35c: 00feef3f
                                                               #  360: 00000000
                                                               #  364: 00000000
                                                               #  368: 40030000
                                                               #  36c: 40030000
                                                               #  370: 00060060
                                                               #  374: 40030000
                                                               #  378: 40030000
                                                               #  37c: 40030000
                                                               #  380: 40030000
                                                               #  384: 40030000
                                                               #  388: 00000000
                                                               #  38c: 00000000
                                                               #  390: 00000000
                                                               #  394: 00000000
                                                               #  398: 00000000
                                                               #  39c: 00000000
                                                               #  3a0: 00000000
                                                               #  3a4: 00000000
                                                               #  3a8: 00000000
                                                               #  3ac: 00000000
                                                               #  3b0: 000c0000
                                                               #  3b4: 00000000
                                                               #  3b8: 00000000
                                                               #  3bc: ac0d0000
                                                               #  3c0: 00000000
                                                               #  3c4: 00000000
                                                               #  3c8: 00000000
                                                               #  3cc: 00000000
                                                               #  3d0: 00000000
                                                               #  3d4: d0090000

# Function @ .irom0.text+0x3d8
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .global      sdk_ppTask
            .type        sdk_ppTask, @function
sdk_ppTask: movi         a2, 40 /* 0x00000028 */               #  3d8: 2c82
            movi         a3, 4 /* 0x00000004 */                #  3da: 0c43
            movi         a4, 0 /* 0x00000000 */                #  3dc: 0c04
            addi         sp, sp, -32 /* (local0) */            #  3de: 12c1e0
            s32i         a15, sp, 24 /* a15 -> [(local6)] */   #  3e1: f961
            s32i         a14, sp, 20 /* a14 -> [(local5)] */   #  3e3: e951
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   #  3e5: d941
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  3e7: c931
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  3e9: 0921
            call0        xQueueGenericCreate                   #  3eb: 01e7ffc0
                                                               #  3ef: 0000
            movi         a12, 0x3feffe00                       #  3f1: c1daff
            movi         a15, sdk_NMIIrqIsOn                   #  3f4: f1dbff
            movi         a13, .Ldata003                        #  3f7: d1dbff
            movi         a14, -32 /* 0xffffffe0 */             #  3fa: 6c0e
            s32i         a2, a13, 80 /* a2 -> [.Ldata013] */   #  3fc: 226d14
.Lbr150:    mov          a3, sp /* (local0) */                 #  3ff: 3d01
            movi         a4, -1 /* 0xffffffff */               #  401: 7cf4
            movi         a5, 0 /* 0x00000000 */                #  403: 0c05
            call0        xQueueGenericReceive                  #  405: 01e1ffc0
                                                               #  409: 0000
            bnei         a2, 1, .Lbr152                        #  40b: 66121f
            l32i         a2, sp, 0 /* [(local0)] */            #  40e: 2801
            l32i         a0, a2, 0 /* [[(local0)]] */          #  410: 0802
            bgeui        a0, 4, .Lbr153                        #  412: f6401e
            movi         a10, .Ldata018                        #  415: a1d4ff
            add          a10, a0, a10                          #  418: aaa0
            l8ui         a9, a10, 0                            #  41a: 920a00
            extui        a2, a0, 0, 8                          #  41d: 002074
            addi         a9, a9, -1                            #  420: 0b99
            s8i          a9, a10, 0                            #  422: 924a00
            call0        sdk_ppProcessTxQ                      #  425: 01daffc0
                                                               #  429: 0000
.Lbr151:    call0        .Lfunc012                             #  42b: c5c8ff
.Lbr152:    l32i         a2, a13, 80 /* [.Ldata013] */         #  42e: 222d14
            j            .Lbr150                               #  431: 86f2ff
.Lbr153:    addi         a11, a0, -4 /* [[(local0)]]-0x4 */    #  434: b2c0fc
            beqz         a11, .Lbr157                          #  437: 167b0b
            addi         a3, a0, -5 /* [[(local0)]]-0x5 */     #  43a: 32c0fb
            beqz         a3, .Lbr161                           #  43d: 16f310
            beqi         a0, 7, .Lbr151                        #  440: 2670e7
            addi         a4, a0, -8 /* [[(local0)]]-0x8 */     #  443: 42c0f8
            beqz         a4, .Lbr173                           #  446: 16d421
            addi         a5, a0, -9 /* [[(local0)]]-0x9 */     #  449: 52c0f7
            beqz         a5, .Lbr172                           #  44c: 16f520
            addi         a6, a0, -10 /* [[(local0)]]-0xa */    #  44f: 62c0f6
            beqz         a6, .Lbr165                           #  452: 166615
            addi         a7, a0, -11 /* [[(local0)]]-0xb */    #  455: 72c0f5
            beqz         a7, .Lbr169                           #  458: 16c71a
            bnei         a0, 12, .Lbr151                       #  45b: 66a0cc
            l8ui         a8, a15, 0 /* [sdk_NMIIrqIsOn] */     #  45e: 820f00
            bnez         a8, .Lbr155                           #  461: dcc8
            call0        vPortEnterCritical                    #  463: 01ccffc0
                                                               #  467: 0000
.Lbr154:    memw                                               #  469: c02000
            l32i         a10, a12, 0x200 /* [0x3ff00000] */    #  46c: a22c80
            and          a10, a10, a14                         #  46f: e0aa10
            memw                                               #  472: c02000
            s32i         a10, a12, 0x200 /* a10 -> [0x3ff00000] */ #  475: a26c80
            memw                                               #  478: c02000
            l32i         a9, a12, 0x200 /* [0x3ff00000] */     #  47b: 922c80
            bbsi         a9, 0, .Lbr154                        #  47e: 07e9e7
.Lbr155:    movi         a2, 32 /* 0x00000020 */               #  481: 2c02
            call0        zalloc                                #  483: 01c5ffc0
                                                               #  487: 0000
            mov          a3, a2                                #  489: 3d02
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      #  48b: 2911
            movi         a4, 32 /* 0x00000020 */               #  48d: 2c04
            movi         a2, 0 /* 0x00000000 */                #  48f: 0c02
            call0        sdk_system_rtc_mem_write              #  491: 01c2ffc0
                                                               #  495: 0000
            l32i         a2, sp, 4 /* [(local1)] */            #  497: 2811
            call0        free                                  #  499: 01c1ffc0
                                                               #  49d: 0000
            l8ui         a11, a13, 85 /* [sdk_dbg_stop_hw_wdt] */ #  49f: b20d55
            movi         a4, .Ldata018                         #  4a2: 41b2ff
            l8ui         a6, a13, 84 /* [sdk_dbg_stop_sw_wdt] */ #  4a5: 620d54
            movi         a5, 0 /* 0x00000000 */                #  4a8: 0c05
            l32i         a2, sp, 0 /* [(local0)] */            #  4aa: 2801
            l8ui         a3, a13, 0 /* [.Ldata003] */          #  4ac: 320d00
            l32i         a2, a2, 0 /* [[(local0)]] */          #  4af: 2802
            moveqz       a3, a5, a6                            #  4b1: 603583
            add          a2, a2, a4                            #  4b4: 4a22
            l8ui         a0, a2, 0                             #  4b6: 020200
            s8i          a3, a13, 0 /* a3 -> [.Ldata003] */    #  4b9: 324d00
            addi         a0, a0, -1                            #  4bc: 0b00
            s8i          a0, a2, 0                             #  4be: 024200
            bnez         a11, .Lbr156                          #  4c1: ccab
            memw                                               #  4c3: c02000
            movi         a4, 0x60000600                        #  4c6: 41aaff
            movi         a3, 115 /* 0x00000073 */              #  4c9: 32a073
            s32i         a3, a4, 0x314 /* 0x00000073 -> [0x60000914] */ #  4cc: 3264c5
.Lbr156:    l8ui         a5, a15, 0 /* [sdk_NMIIrqIsOn] */     #  4cf: 520f00
            bnez         a5, .Lbr151                           #  4d2: 5655f5
            memw                                               #  4d5: c02000
            l32i         a6, a12, 0x200 /* [0x3ff00000] */     #  4d8: 622c80
            movi         a7, 1 /* 0x00000001 */                #  4db: 0c17
            and          a6, a6, a14                           #  4dd: e06610
            or           a6, a6, a7                            #  4e0: 706620
            memw                                               #  4e3: c02000
            s32i         a6, a12, 0x200 /* a6 -> [0x3ff00000] */ #  4e6: 626c80
            call0        vPortExitCritical                     #  4e9: 01aeffc0
                                                               #  4ed: 0000
            j            .Lbr151                               #  4ef: 06ceff
.Lbr157:    l8ui         a2, a15, 0 /* [sdk_NMIIrqIsOn] */     #  4f2: 220f00
            bnez         a2, .Lbr159                           #  4f5: ec32
            call0        vPortEnterCritical                    #  4f7: 01acffc0
                                                               #  4fb: 0000
.Lbr158:    memw                                               #  4fd: c02000
            l32i         a8, a12, 0x200 /* [0x3ff00000] */     #  500: 822c80
            and          a8, a8, a14                           #  503: e08810
            memw                                               #  506: c02000
            s32i         a8, a12, 0x200 /* a8 -> [0x3ff00000] */ #  509: 826c80
            memw                                               #  50c: c02000
            l32i         a7, a12, 0x200 /* [0x3ff00000] */     #  50f: 722c80
            bbsi         a7, 0, .Lbr158                        #  512: 07e7e7
            l32i         a0, sp, 0 /* [(local0)] */            #  515: 0801
            l8ui         a2, a15, 0 /* [sdk_NMIIrqIsOn] */     #  517: 220f00
            l32i         a0, a0, 0 /* [[(local0)]] */          #  51a: 0800
.Lbr159:    movi         a4, .Ldata018                         #  51c: 4196ff
            add          a4, a0, a4                            #  51f: 4a40
            l8ui         a3, a4, 0                             #  521: 320400
            addi         a3, a3, -1                            #  524: 0b33
            s8i          a3, a4, 0                             #  526: 324400
            bnez         a2, .Lbr160                           #  529: dc82
            memw                                               #  52b: c02000
            l32i         a5, a12, 0x200 /* [0x3ff00000] */     #  52e: 522c80
            movi         a6, 1 /* 0x00000001 */                #  531: 0c16
            and          a5, a5, a14                           #  533: e05510
            or           a5, a5, a6                            #  536: 605520
            memw                                               #  539: c02000
            s32i         a5, a12, 0x200 /* a5 -> [0x3ff00000] */ #  53c: 526c80
            call0        vPortExitCritical                     #  53f: 019bffc0
                                                               #  543: 0000
.Lbr160:    movi         a2, 1 /* 0x00000001 */                #  545: 0c12
            call0        .Lfunc014                             #  547: 019affc0
                                                               #  54b: 0000
            j            .Lbr151                               #  54d: 86b6ff
.Lbr161:    l8ui         a2, a15, 0 /* [sdk_NMIIrqIsOn] */     #  550: 220f00
            bnez         a2, .Lbr163                           #  553: ec32
            call0        vPortEnterCritical                    #  555: 0197ffc0
                                                               #  559: 0000
.Lbr162:    memw                                               #  55b: c02000
            l32i         a7, a12, 0x200 /* [0x3ff00000] */     #  55e: 722c80
            and          a7, a7, a14                           #  561: e07710
            memw                                               #  564: c02000
            s32i         a7, a12, 0x200 /* a7 -> [0x3ff00000] */ #  567: 726c80
            memw                                               #  56a: c02000
            l32i         a6, a12, 0x200 /* [0x3ff00000] */     #  56d: 622c80
            bbsi         a6, 0, .Lbr162                        #  570: 07e6e7
            l32i         a0, sp, 0 /* [(local0)] */            #  573: 0801
            l8ui         a2, a15, 0 /* [sdk_NMIIrqIsOn] */     #  575: 220f00
            l32i         a0, a0, 0 /* [[(local0)]] */          #  578: 0800
.Lbr163:    movi         a4, .Ldata018                         #  57a: 417fff
            add          a4, a0, a4                            #  57d: 4a40
            l8ui         a3, a4, 0                             #  57f: 320400
            addi         a3, a3, -1                            #  582: 0b33
            s8i          a3, a4, 0                             #  584: 324400
            bnez         a2, .Lbr164                           #  587: dc82
            memw                                               #  589: c02000
            l32i         a5, a12, 0x200 /* [0x3ff00000] */     #  58c: 522c80
            movi         a6, 1 /* 0x00000001 */                #  58f: 0c16
            and          a5, a5, a14                           #  591: e05510
            or           a5, a5, a6                            #  594: 605520
            memw                                               #  597: c02000
            s32i         a5, a12, 0x200 /* a5 -> [0x3ff00000] */ #  59a: 526c80
            call0        vPortExitCritical                     #  59d: 0186ffc0
                                                               #  5a1: 0000
.Lbr164:    call0        .Lfunc015                             #  5a3: 0186ffc0
                                                               #  5a7: 0000
            j            .Lbr151                               #  5a9: 869fff
.Lbr165:    l8ui         a2, a15, 0 /* [sdk_NMIIrqIsOn] */     #  5ac: 220f00
            bnez         a2, .Lbr167                           #  5af: ec32
            call0        vPortEnterCritical                    #  5b1: 0183ffc0
                                                               #  5b5: 0000
.Lbr166:    memw                                               #  5b7: c02000
            l32i         a7, a12, 0x200 /* [0x3ff00000] */     #  5ba: 722c80
            and          a7, a7, a14                           #  5bd: e07710
            memw                                               #  5c0: c02000
            s32i         a7, a12, 0x200 /* a7 -> [0x3ff00000] */ #  5c3: 726c80
            memw                                               #  5c6: c02000
            l32i         a6, a12, 0x200 /* [0x3ff00000] */     #  5c9: 622c80
            bbsi         a6, 0, .Lbr166                        #  5cc: 07e6e7
            l32i         a0, sp, 0 /* [(local0)] */            #  5cf: 0801
            l8ui         a2, a15, 0 /* [sdk_NMIIrqIsOn] */     #  5d1: 220f00
            l32i         a0, a0, 0 /* [[(local0)]] */          #  5d4: 0800
.Lbr167:    movi         a4, .Ldata018                         #  5d6: 4169ff
            add          a4, a0, a4                            #  5d9: 4a40
            l8ui         a3, a4, 0                             #  5db: 320400
            addi         a3, a3, -1                            #  5de: 0b33
            s8i          a3, a4, 0                             #  5e0: 324400
            bnez         a2, .Lbr168                           #  5e3: dc82
            memw                                               #  5e5: c02000
            l32i         a5, a12, 0x200 /* [0x3ff00000] */     #  5e8: 522c80
            movi         a6, 1 /* 0x00000001 */                #  5eb: 0c16
            and          a5, a5, a14                           #  5ed: e05510
            or           a5, a5, a6                            #  5f0: 605520
            memw                                               #  5f3: c02000
            s32i         a5, a12, 0x200 /* a5 -> [0x3ff00000] */ #  5f6: 526c80
            call0        vPortExitCritical                     #  5f9: 0172ffc0
                                                               #  5fd: 0000
.Lbr168:    call0        sdk_pm_enable_gpio_wakeup             #  5ff: 0172ffc0
                                                               #  603: 0000
            j            .Lbr151                               #  605: 8688ff
.Lbr169:    l8ui         a2, a15, 0 /* [sdk_NMIIrqIsOn] */     #  608: 220f00
            bnez         a2, .Lbr171                           #  60b: ec32
            call0        vPortEnterCritical                    #  60d: 016fffc0
                                                               #  611: 0000
.Lbr170:    memw                                               #  613: c02000
            l32i         a7, a12, 0x200 /* [0x3ff00000] */     #  616: 722c80
            and          a7, a7, a14                           #  619: e07710
            memw                                               #  61c: c02000
            s32i         a7, a12, 0x200 /* a7 -> [0x3ff00000] */ #  61f: 726c80
            memw                                               #  622: c02000
            l32i         a6, a12, 0x200 /* [0x3ff00000] */     #  625: 622c80
            bbsi         a6, 0, .Lbr170                        #  628: 07e6e7
            l32i         a0, sp, 0 /* [(local0)] */            #  62b: 0801
            l8ui         a2, a15, 0 /* [sdk_NMIIrqIsOn] */     #  62d: 220f00
            l32i         a0, a0, 0 /* [[(local0)]] */          #  630: 0800
.Lbr171:    movi         a4, .Ldata018                         #  632: 4153ff
            add          a4, a0, a4                            #  635: 4a40
            l8ui         a3, a4, 0                             #  637: 320400
            addi         a3, a3, -1                            #  63a: 0b33
            s8i          a3, a4, 0                             #  63c: 324400
            bnez         a2, .Lbr151                           #  63f: 5682de
            memw                                               #  642: c02000
            l32i         a5, a12, 0x200 /* [0x3ff00000] */     #  645: 522c80
            movi         a6, 1 /* 0x00000001 */                #  648: 0c16
            and          a5, a5, a14                           #  64a: e05510
            or           a5, a5, a6                            #  64d: 605520
            memw                                               #  650: c02000
            s32i         a5, a12, 0x200 /* a5 -> [0x3ff00000] */ #  653: 526c80
            call0        vPortExitCritical                     #  656: 015effc0
                                                               #  65a: 0000
            j            .Lbr151                               #  65c: c672ff
.Lbr172:    l32i         a2, a2, 4 /* [[(local0)]+0x4] */      #  65f: 2812
            call0        sdk_ppPeocessRxPktHdr                 #  661: 050000
            j            .Lbr151                               #  664: c670ff
.Lbr173:    movi         a7, .Ldata018                         #  667: 7147ff
            add          a7, a0, a7                            #  66a: 7a70
            l8ui         a6, a7, 0                             #  66c: 620700
            addi         a6, a6, -1                            #  66f: 0b66
            s8i          a6, a7, 0                             #  671: 624700
            call0        .Lfunc010                             #  674: 0158ffc0
                                                               #  678: 0000
            j            .Lbr151                               #  67a: 466bff

            .literal_position                                  #  680: f7ffff03
                                                               #  684: 00008000
                                                               #  688: 00000000
                                                               #  68c: 00000000
                                                               #  690: 00080000
                                                               #  694: 00000000

# Function @ .irom0.text+0x698
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
.Lfunc013:  movi         a4, 2 /* 0x00000002 */                #  698: 0c24
            movi         a9, 12 /* 0x0000000c */               #  69a: 0cc9
            addi         sp, sp, -16 /* (local0) */            #  69c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  69f: 0901
            l32i         a7, a2, 16 /* [arg0+0x10] */          #  6a1: 7842
            l32i         a5, a2, 32 /* [arg0+0x20] */          #  6a3: 5882
            l8ui         a3, a7, 4 /* [[arg0+0x10]+0x4] */     #  6a5: 320704
            l32i         a0, a5, 0 /* [[arg0+0x20]] */         #  6a8: 0805
            bbci         a3, 0, .Lbr174                        #  6aa: 076310
            srli         a3, a0, 6                             #  6ad: 003641
            extui        a0, a0, 0, 6                          #  6b0: 000054
            or           a3, a3, a4                            #  6b3: 403320
            slli         a3, a3, 6                             #  6b6: a03311
            or           a0, a0, a3                            #  6b9: 300020
            s32i         a0, a5, 0 /* a0 -> [[arg0+0x20]] */   #  6bc: 0905
.Lbr174:    l8ui         a8, a7, 0 /* [[arg0+0x10]] */         #  6be: 820700
            movi         a6, 240 /* 0x000000f0 */              #  6c1: 62a0f0
            and          a4, a8, a9                            #  6c4: 904810
            and          a6, a8, a6                            #  6c7: 606810
            bnei         a4, 8, .Lbr179                        #  6ca: 668449
            extui        a8, a0, 0, 6                          #  6cd: 008054
            movi         a3, 8 /* 0x00000008 */                #  6d0: 0c83
            srli         a0, a0, 6                             #  6d2: 000641
            or           a0, a0, a3                            #  6d5: 300020
            slli         a0, a0, 6                             #  6d8: a00011
            or           a0, a8, a0                            #  6db: 000820
            s32i         a0, a5, 0 /* a0 -> [[arg0+0x20]] */   #  6de: 0905
            beqi         a6, 64, .Lbr175                       #  6e0: 26d605
            movi         a4, 192 /* 0x000000c0 */              #  6e3: 42a0c0
            bne          a6, a4, .Lbr176                       #  6e6: 479613
.Lbr175:    extui        a6, a0, 0, 6                          #  6e9: 006054
            movi         a3, 0x03fffff7                        #  6ec: 31e5ff
            srli         a0, a0, 6                             #  6ef: 000641
            and          a0, a0, a3                            #  6f2: 300010
            slli         a0, a0, 6                             #  6f5: a00011
            or           a0, a6, a0                            #  6f8: 000620
            s32i         a0, a5, 0 /* a0 -> [[arg0+0x20]] */   #  6fb: 0905
.Lbr176:    srli         a4, a0, 6                             #  6fd: 004641
.Lbr177:    l32i         a0, sp, 0 /* [(local0)] */            #  700: 0801
            bbci         a4, 18, .Lbr178                       #  702: 27740c
            l32i         a5, a2, 4                             #  705: 5812
            l16ui        a4, a7, 22                            #  707: 42170b
            l32i         a5, a5, 4                             #  70a: 5815
            srli         a4, a4, 4                             #  70c: 404441
            s8i          a4, a5, 3                             #  70f: 424503
.Lbr178:    addi         sp, sp, 16 /* (top of frame) */       #  712: 12c110
            ret                                                #  715: 0df0
.Lbr179:    bany         a8, a9, .Lbr176                       #  717: 9788e2
            srli         a4, a0, 6                             #  71a: 004641
            bnei         a6, 128, .Lbr182                      #  71d: 66e63b
            s32i         a7, sp, 4 /* [arg0+0x10] -> [(local1)] */ #  720: 7911
            extui        a9, a0, 0, 6                          #  722: 009054
            movi         a8, sdk_NoiseTimerInterval            #  725: 81d8ff
            movi         a10, 0x00800000                       #  728: a1d7ff
            l32i         a8, a8, 12 /* [.Lrel114] */           #  72b: 8838
            or           a10, a4, a10                          #  72d: a0a420
            slli         a10, a10, 6                           #  730: a0aa11
            or           a9, a9, a10                           #  733: a09920
            s32i         a9, a5, 0 /* a9 -> [[arg0+0x20]] */   #  736: 9905
            l32i         a6, a8, 0x15c /* [[.Lrel114]+0x15c] */ #  738: 622857
            s32i         a2, sp, 8 /* arg0 -> [(local2)] */    #  73b: 2921
            addi         a6, a6, 1 /* [[.Lrel114]+0x15c]+0x1 */ #  73d: 1b66
            s32i         a6, a8, 0x15c /* [[.Lrel114]+0x15c]+0x1 -> [[.Lrel114]+0x15c] */ #  73f: 626857
            bltui        a6, 6, .Lbr180                        #  742: b6660e
            movi         a2, .Label001                         #  745: 21d1ff
            call0        printf                                #  748: 01d3ffc0
                                                               #  74c: 0000
            l32i         a2, sp, 8 /* [(local2)] */            #  74e: 2821
            l32i         a5, a2, 32 /* [[(local2)]+0x20] */    #  750: 5882
            l32i         a7, sp, 4 /* [(local1)] */            #  752: 7811
.Lbr180:    l32i         a0, a5, 0                             #  754: 0805
.Lbr181:    srli         a4, a0, 6                             #  756: 004641
            j            .Lbr177                               #  759: c6e8ff
.Lbr182:    bnei         a6, 64, .Lbr177                       #  75c: 66d6a0
            bbsi         a0, 7, .Lbr177                        #  75f: 77e09d
            movi         a3, 0x00000800                        #  762: 31cbff
            extui        a0, a0, 0, 6                          #  765: 000054
            or           a3, a4, a3                            #  768: 303420
            slli         a3, a3, 6                             #  76b: a03311
            or           a0, a0, a3                            #  76e: 300020
            s32i         a0, a5, 0 /* a0 -> [[arg0+0x20]] */   #  771: 0905
            j            .Lbr181                               #  773: c6f7ff

            .literal_position                                  #  778: 04000000
                                                               #  77c: 0c000000
                                                               #  780: 00000000
                                                               #  784: 00feef3f
                                                               #  788: 00000000
                                                               #  78c: 00000000
                                                               #  790: 14000000
                                                               #  794: 00000000
                                                               #  798: dc130000
                                                               #  79c: 00000000
                                                               #  7a0: 00000000
                                                               #  7a4: 00000000
                                                               #  7a8: 00000000
                                                               #  7ac: 6c0a0000
                                                               #  7b0: 00000000
                                                               #  7b4: 00000000
                                                               #  7b8: 00000000
                                                               #  7bc: 00000000
                                                               #  7c0: 00000000
                                                               #  7c4: 00000000
                                                               #  7c8: 00000000

# Function @ .irom0.text+0x7cc
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .global      sdk_ppTxPkt
            .type        sdk_ppTxPkt, @function
sdk_ppTxPkt:
            addi         sp, sp, -32 /* (local0) */            #  7cc: 12c1e0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  7cf: d921
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  7d1: e931
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  7d3: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  7d5: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  7d7: c911
            l32i         a0, a2, 32 /* [arg0+0x20] */          #  7d9: 0882
            mov          a12, a2 /* arg0 */                    #  7db: cd02
            l8ui         a3, a0, 6 /* [[arg0+0x20]+0x6] */     #  7dd: 320006
            l8ui         a2, a0, 4 /* [[arg0+0x20]+0x4] */     #  7e0: 220004
            extui        a3, a3, 4, 3                          #  7e3: 303424
            extui        a2, a2, 0, 4                          #  7e6: 202034
            beqz         a2, .Lbr185                           #  7e9: 9c52
            beqi         a2, 3, .Lbr185                        #  7eb: 263213
            blti         a2, 3, .Lbr183                        #  7ee: a63209
            movi         a4, 1 /* 0x00000001 */                #  7f1: 0c14
            blti         a2, 6, .Lbr184                        #  7f3: a66206
            movi         a4, 0 /* 0x00000000 */                #  7f6: 0c04
            j            .Lbr184                               #  7f8: 460000
.Lbr183:    movi         a4, 3 /* 0x00000003 */                #  7fb: 0c34
.Lbr184:    mov          a2, a4                                #  7fd: 2d04
            j            .Lbr186                               #  7ff: 460000
.Lbr185:    movi         a2, 2 /* 0x00000002 */                #  802: 0c22
.Lbr186:    beq          a2, a3, .Lbr188                       #  804: 371211
            movi         a2, .Lstr001                          #  807: 21dcff
            movi         a3, .Lstr002                          #  80a: 31dcff
            movi         a4, 603 /* 0x0000025b */              #  80d: 42a25b
            call0        printf                                #  810: 01e1ffc0
                                                               #  814: 0000
.Lbr187:    j            .Lbr187 /* (halt) */                  #  816: 06ffff
.Lbr188:    mov          a2, a12 /* arg0 */                    #  819: 2d0c
            call0        .Lfunc013                             #  81b: c5e7ff
            mov          a2, a12 /* arg0 */                    #  81e: 2d0c
            call0        .Lfunc019                             #  820: 01deffc0
                                                               #  824: 0000
            movi         a15, -32 /* 0xffffffe0 */             #  826: 6c0f
            movi         a13, 0x3feffe00                       #  828: d1d7ff
            movi         a14, sdk_NMIIrqIsOn                   #  82b: e1d5ff
            addi         a4, a2, -1                            #  82e: 0b42
            beqz         a4, .Lbr198                           #  830: 169411
            l8ui         a5, a14, 0 /* [sdk_NMIIrqIsOn] */     #  833: 520e00
            bnez         a5, .Lbr190                           #  836: dcc5
            call0        vPortEnterCritical                    #  838: 01d9ffc0
                                                               #  83c: 0000
.Lbr189:    memw                                               #  83e: c02000
            l32i         a7, a13, 0x200 /* [0x3ff00000] */     #  841: 722d80
            and          a7, a7, a15                           #  844: f07710
            memw                                               #  847: c02000
            s32i         a7, a13, 0x200 /* a7 -> [0x3ff00000] */ #  84a: 726d80
            memw                                               #  84d: c02000
            l32i         a6, a13, 0x200 /* [0x3ff00000] */     #  850: 622d80
            bbsi         a6, 0, .Lbr189                        #  853: 07e6e7
.Lbr190:    l32i         a2, a12, 24 /* [arg0+0x18] */         #  856: 286c
            l32i         a3, a12, 32 /* [arg0+0x20] */         #  858: 388c
            call0        sdk_rcGetSched                        #  85a: 01d1ffc0
                                                               #  85e: 0000
            l8ui         a8, a14, 0 /* [sdk_NMIIrqIsOn] */     #  860: 820e00
            bnez         a8, .Lbr191                           #  863: dc88
            memw                                               #  865: c02000
            l32i         a9, a13, 0x200 /* [0x3ff00000] */     #  868: 922d80
            movi         a10, 1 /* 0x00000001 */               #  86b: 0c1a
            and          a9, a9, a15                           #  86d: f09910
            or           a9, a9, a10                           #  870: a09920
            memw                                               #  873: c02000
            s32i         a9, a13, 0x200 /* a9 -> [0x3ff00000] */ #  876: 926d80
            call0        vPortExitCritical                     #  879: 01caffc0
                                                               #  87d: 0000
.Lbr191:    mov          a2, a12 /* arg0 */                    #  87f: 2d0c
            call0        sdk_ppCalFrameTimes                   #  881: 01c9ffc0
                                                               #  885: 0000
            mov          a2, a12 /* arg0 */                    #  887: 2d0c
            call0        .Lfunc011                             #  889: 01c8ffc0
                                                               #  88d: 0000
            movi         a5, 0 /* 0x00000000 */                #  88f: 0c05
            movi         a4, sdk_NoiseTimerInterval            #  891: 41bdff
            bnez         a2, .Lbr195                           #  894: 56e207
            l8ui         a10, a14, 0 /* [sdk_NMIIrqIsOn] */    #  897: a20e00
            bnez         a10, .Lbr193                          #  89a: ec1a
            call0        vPortEnterCritical                    #  89c: 01c5ffc0
                                                               #  8a0: 0000
.Lbr192:    memw                                               #  8a2: c02000
            l32i         a0, a13, 0x200 /* [0x3ff00000] */     #  8a5: 022d80
            and          a0, a0, a15                           #  8a8: f00010
            memw                                               #  8ab: c02000
            s32i         a0, a13, 0x200 /* a0 -> [0x3ff00000] */ #  8ae: 026d80
            memw                                               #  8b1: c02000
            l32i         a11, a13, 0x200 /* [0x3ff00000] */    #  8b4: b22d80
            bbsi         a11, 0, .Lbr192                       #  8b7: 07ebe7
            movi         a4, sdk_NoiseTimerInterval            #  8ba: 41b4ff
            movi         a5, 0 /* 0x00000000 */                #  8bd: 0c05
.Lbr193:    l32i         a0, a12, 32 /* [arg0+0x20] */         #  8bf: 088c
            s32i         a5, a12, 28 /* 0x00000000 -> [arg0+0x1c] */ #  8c1: 597c
            l8ui         a8, a0, 0 /* [[arg0+0x20]] */         #  8c3: 820000
            l32i         a6, a4, 12 /* [.Lrel114] */           #  8c6: 6834
            extui        a8, a8, 2, 4                          #  8c8: 808234
            slli         a8, a8, 5                             #  8cb: b08811
            add          a8, a6, a8                            #  8ce: 8a86
            l32i         a8, a8, 28                            #  8d0: 8878
            s32i         a12, a8, 0                            #  8d2: c908
            l8ui         a7, a0, 0 /* [[arg0+0x20]] */         #  8d4: 720000
            addi         a3, a12, 28 /* arg0+0x1c */           #  8d7: 32cc1c
            extui        a7, a7, 2, 4                          #  8da: 707234
            slli         a7, a7, 5                             #  8dd: b07711
            add          a6, a6, a7                            #  8e0: 7a66
            s32i         a3, a6, 28                            #  8e2: 3976
            l8ui         a2, a14, 0 /* [sdk_NMIIrqIsOn] */     #  8e4: 220e00
            bnez         a2, .Lbr194                           #  8e7: dca2
            memw                                               #  8e9: c02000
            l32i         a9, a13, 0x200 /* [0x3ff00000] */     #  8ec: 922d80
            movi         a10, 1 /* 0x00000001 */               #  8ef: 0c1a
            and          a9, a9, a15                           #  8f1: f09910
            or           a9, a9, a10                           #  8f4: a09920
            memw                                               #  8f7: c02000
            s32i         a9, a13, 0x200 /* a9 -> [0x3ff00000] */ #  8fa: 926d80
            call0        vPortExitCritical                     #  8fd: 01adffc0
                                                               #  901: 0000
            l32i         a0, a12, 32 /* [arg0+0x20] */         #  903: 088c
.Lbr194:    l8ui         a2, a0, 6 /* [[arg0+0x20]+0x6] */     #  905: 220006
            movi         a3, 0 /* 0x00000000 */                #  908: 0c03
            extui        a2, a2, 4, 3                          #  90a: 202424
            call0        sdk_pp_post                           #  90d: 01aaffc0
                                                               #  911: 0000
            j            .Lbr202                               #  913: 862000
.Lbr195:    bnei         a2, 1, .Lbr197                        #  916: 661227
            l32i         a6, a12, 32 /* [arg0+0x20] */         #  919: 688c
            s32i         a5, a12, 28 /* 0x00000000 -> [arg0+0x1c] */ #  91b: 597c
            l8ui         a8, a6, 0 /* [[arg0+0x20]] */         #  91d: 820600
            l32i         a7, a4, 12 /* [.Lrel114] */           #  920: 7834
            extui        a8, a8, 1, 1                          #  922: 808104
            addx8        a8, a8, a7                            #  925: 7088b0
            l32i         a8, a8, 0x11c                         #  928: 822847
            s32i         a12, a8, 0                            #  92b: c908
            l8ui         a6, a6, 0 /* [[arg0+0x20]] */         #  92d: 620600
            addi         a3, a12, 28 /* arg0+0x1c */           #  930: 32cc1c
            extui        a6, a6, 1, 1                          #  933: 606104
            addx8        a6, a6, a7                            #  936: 7066b0
            s32i         a3, a6, 0x11c                         #  939: 326647
.Lbr196:    movi         a2, 0 /* 0x00000000 */                #  93c: 0c02
            j            .Lbr202                               #  93e: c61500
.Lbr197:    bnei         a2, 2, .Lbr196                        #  941: 6622f7
            movi         a2, .Lstr003                          #  944: 2193ff
            call0        printf                                #  947: 019dffc0
                                                               #  94b: 0000
.Lbr198:    l8ui         a9, a14, 0 /* [sdk_NMIIrqIsOn] */     #  94d: 920e00
            bnez         a9, .Lbr200                           #  950: dcc9
            call0        vPortEnterCritical                    #  952: 019bffc0
                                                               #  956: 0000
.Lbr199:    memw                                               #  958: c02000
            l32i         a11, a13, 0x200 /* [0x3ff00000] */    #  95b: b22d80
            and          a11, a11, a15                         #  95e: f0bb10
            memw                                               #  961: c02000
            s32i         a11, a13, 0x200 /* a11 -> [0x3ff00000] */ #  964: b26d80
            memw                                               #  967: c02000
            l32i         a10, a13, 0x200 /* [0x3ff00000] */    #  96a: a22d80
            bbsi         a10, 0, .Lbr199                       #  96d: 07eae7
.Lbr200:    mov          a2, a12 /* arg0 */                    #  970: 2d0c
            call0        sdk_ppDiscardMPDU                     #  972: 0194ffc0
                                                               #  976: 0000
            l8ui         a12, a14, 0 /* [sdk_NMIIrqIsOn] */    #  978: c20e00
            bnez         a12, .Lbr201                          #  97b: dc8c
            memw                                               #  97d: c02000
            l32i         a14, a13, 0x200 /* [0x3ff00000] */    #  980: e22d80
            movi         a0, 1 /* 0x00000001 */                #  983: 0c10
            and          a14, a14, a15                         #  985: f0ee10
            or           a14, a14, a0                          #  988: 00ee20
            memw                                               #  98b: c02000
            s32i         a14, a13, 0x200 /* a14 -> [0x3ff00000] */ #  98e: e26d80
            call0        vPortExitCritical                     #  991: 018dffc0
                                                               #  995: 0000
.Lbr201:    movi         a2, 1 /* 0x00000001 */                #  997: 0c12
.Lbr202:    l32i         a12, sp, 4 /* [(local1)] */           #  999: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  99b: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  99d: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  99f: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  9a1: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  9a3: 12c120
            ret                                                #  9a6: 0df0

            .literal_position                                  #  9a8: d0090000

# Function @ .irom0.text+0x9ac
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ppProcessWaitQ
            .type        sdk_ppProcessWaitQ, @function
sdk_ppProcessWaitQ:
            addi         sp, sp, -16 /* (local0) */            #  9ac: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  9af: 0901
            call0        .Lfunc010                             #  9b1: 01fdffc0
                                                               #  9b5: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  9b7: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  9b9: 12c110
            ret                                                #  9bc: 0df0

            .literal_position                                  #  9c0: 00000000

# Function @ .irom0.text+0x9c4
            .global      sdk_ppRegisterTxCallback
            .type        sdk_ppRegisterTxCallback, @function
sdk_ppRegisterTxCallback:
            movi         a7, sdk_NoiseTimerInterval            #  9c4: 71ffff
            movi         a8, 1 /* 0x00000001 */                #  9c7: 0c18
            l32i         a7, a7, 12 /* [.Lrel114] */           #  9c9: 7837
            movi         a6, 184 /* 0x000000b8 */              #  9cb: 62a0b8
            add          a6, a7, a6 /* [.Lrel114]+0xb8 */      #  9ce: 6a67
            l8ui         a5, a6, 128 /* [[.Lrel114]+0x138] */  #  9d0: 520680
            ssr          a3                                    #  9d3: 000340
            sra          a4, a5                                #  9d6: 5040b1
            bbci         a4, 0, .Lbr203                        #  9d9: 076403
            mov          a2, a8 /* 0x00000001 */               #  9dc: 2d08
            ret           /* 0x00000001 */                     #  9de: 0df0
.Lbr203:    ssl          a3                                    #  9e0: 001340
            addx4        a9, a3, a7                            #  9e3: 7093a0
            sll          a10, a8                               #  9e6: 00a8a1
            or           a10, a5, a10                          #  9e9: a0a520
            s8i          a10, a6, 128 /* a10 -> [[.Lrel114]+0x138] */ #  9ec: a24680
            s32i         a2, a9, 0x13c                         #  9ef: 22694f
            movi         a2, 0 /* 0x00000000 */                #  9f2: 0c02
            ret           /* 0x00000000 */                     #  9f4: 0df0

            .literal_position                                  #  9f8: 00000000
                                                               #  9fc: 00000000
                                                               #  a00: 00000000
                                                               #  a04: 00000000

# Function @ .irom0.text+0xa08
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_ppRecycleRxPkt
            .type        sdk_ppRecycleRxPkt, @function
sdk_ppRecycleRxPkt:
            addi         sp, sp, -16 /* (local0) */            #  a08: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  a0b: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  a0d: 0901
            mov          a12, a2 /* arg0 */                    #  a0f: cd02
            l32i         a2, a2, 4 /* [arg0+0x4] */            #  a11: 2812
            l32i         a3, a12, 16 /* [arg0+0x10] */         #  a13: 384c
            s32i         a3, a2, 4 /* [arg0+0x10] -> [[arg0+0x4]+0x4] */ #  a15: 3912
            l32i         a0, a12, 32 /* [arg0+0x20] */         #  a17: 088c
            l16ui        a0, a0, 0 /* [[arg0+0x20]] */         #  a19: 021000
            l16ui        a4, a12, 12 /* [arg0+0xc] */          #  a1c: 421c06
            extui        a0, a0, 0, 12                         #  a1f: 0000b4
            bbsi         a0, 4, .Lbr204                        #  a22: 47e00a
            l32i         a3, a12, 8 /* [arg0+0x8] */           #  a25: 382c
            call0        sdk_wDev_AppendRxBlocks               #  a27: 01f4ffc0
                                                               #  a2b: 0000
            j            .Lbr205                               #  a2d: 060800
.Lbr204:    addi         a3, a4, -1 /* [arg0+0xc]-0x1 */       #  a30: 0b34
            extui        a3, a3, 0, 16                         #  a32: 3030f4
            call0        lldesc_num2link                       #  a35: 01f1ffc0
                                                               #  a39: 0000
            mov          a3, a2                                #  a3b: 3d02
            l16ui        a4, a12, 12 /* [arg0+0xc] */          #  a3d: 421c06
            movi         a5, 0 /* 0x00000000 */                #  a40: 0c05
            addi         a4, a4, -1 /* [arg0+0xc]-0x1 */       #  a42: 0b44
            s32i         a5, a2, 8                             #  a44: 5922
            l32i         a2, a12, 4 /* [arg0+0x4] */           #  a46: 281c
            extui        a4, a4, 0, 16                         #  a48: 4040f4
            call0        sdk_wDev_AppendRxBlocks               #  a4b: 01edffc0
                                                               #  a4f: 0000
.Lbr205:    mov          a2, a12 /* arg0 */                    #  a51: 2d0c
            movi         a3, 7 /* 0x00000007 */                #  a53: 0c73
            call0        sdk_esf_buf_recycle                   #  a55: 01ebffc0
                                                               #  a59: 0000
            l32i         a12, sp, 4 /* [(local1)] */           #  a5b: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  a5d: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  a5f: 12c110
            ret                                                #  a62: 0df0

            .literal_position                                  #  a64: 00000000
                                                               #  a68: 00feef3f
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
            .global      sdk_ppCheckTxIdle
            .type        sdk_ppCheckTxIdle, @function
sdk_ppCheckTxIdle:
            addi         sp, sp, -16 /* (local0) */            #  a8c: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  a8f: d921
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  a91: e931
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  a93: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  a95: 0901
            mov          a12, a2 /* arg0 */                    #  a97: cd02
            movi         a0, sdk_NMIIrqIsOn                    #  a99: 01f2ff
            movi         a14, 0x3feffe00                       #  a9c: e1f3ff
            beqz         a2, .Lbr207                           #  a9f: ac32
            l8ui         a3, a0, 0 /* [sdk_NMIIrqIsOn] */      #  aa1: 320000
            bnez         a3, .Lbr207                           #  aa4: dce3
            call0        vPortEnterCritical                    #  aa6: 01f4ffc0
                                                               #  aaa: 0000
            movi         a2, -32 /* 0xffffffe0 */              #  aac: 6c02
.Lbr206:    memw                                               #  aae: c02000
            l32i         a5, a14, 0x200 /* [0x3ff00000] */     #  ab1: 522e80
            and          a5, a5, a2                            #  ab4: 205510
            memw                                               #  ab7: c02000
            s32i         a5, a14, 0x200 /* a5 -> [0x3ff00000] */ #  aba: 526e80
            memw                                               #  abd: c02000
            l32i         a4, a14, 0x200 /* [0x3ff00000] */     #  ac0: 422e80
            bbsi         a4, 0, .Lbr206                        #  ac3: 07e4e7
.Lbr207:    movi         a13, 0 /* 0x00000000 */               #  ac6: 0c0d
.Lbr208:    mov          a2, a13                               #  ac8: 2d0d
            call0        sdk_lmacIsIdle                        #  aca: 01ecffc0
                                                               #  ace: 0000
            beqz         a2, .Lbr214                           #  ad0: 16e207
            addi         a13, a13, 1                           #  ad3: 1bdd
            extui        a13, a13, 0, 8                        #  ad5: d0d074
            bnei         a13, 4, .Lbr208                       #  ad8: 664dec
            movi         a13, sdk_NoiseTimerInterval           #  adb: d1e4ff
.Lbr209:    l32i         a0, a13, 12 /* [.Lrel114] */          #  ade: 083d
            l32i         a6, a0, 0 /* [[.Lrel114]] */          #  ae0: 6800
            neg          a5, a6                                #  ae2: 605060
            and          a5, a5, a6                            #  ae5: 605510
            nsau         a5, a5                                #  ae8: 50f540
            neg          a5, a5                                #  aeb: 505060
            addi         a5, a5, 31                            #  aee: 52c51f
            bltz         a5, .Lbr217                           #  af1: 962509
            slli         a2, a5, 5                             #  af4: b02511
            add          a2, a0, a2                            #  af7: 2a20
            l32i         a7, a2, 24                            #  af9: 7862
            bnez         a7, .Lbr214                           #  afb: 563705
            l32i         a3, a2, 44                            #  afe: 38b2
            l8ui         a2, a2, 36                            #  b00: 220224
            bnez         a3, .Lbr214                           #  b03: 56b304
            beqz         a2, .Lbr212                           #  b06: 9c52
            beqi         a2, 3, .Lbr212                        #  b08: 263213
            bltui        a2, 3, .Lbr210                        #  b0b: b63209
            movi         a4, 1 /* 0x00000001 */                #  b0e: 0c14
            bltui        a2, 6, .Lbr211                        #  b10: b66206
            movi         a4, 0 /* 0x00000000 */                #  b13: 0c04
            j            .Lbr211                               #  b15: 460000
.Lbr210:    movi         a4, 3 /* 0x00000003 */                #  b18: 0c34
.Lbr211:    mov          a6, a4                                #  b1a: 6d04
            j            .Lbr213                               #  b1c: 460000
.Lbr212:    movi         a6, 2 /* 0x00000002 */                #  b1f: 0c26
.Lbr213:    movi         a2, 8 /* 0x00000008 */                #  b21: 0c82
            extui        a8, a5, 0, 8                          #  b23: 508074
            extui        a7, a6, 0, 8                          #  b26: 607074
            movi         a5, 1 /* 0x00000001 */                #  b29: 0c15
            ssl          a8                                    #  b2b: 001840
            addx4        a7, a7, a0                            #  b2e: 0077a0
            l32i         a6, a7, 4                             #  b31: 6817
            movi         a8, -1 /* 0xffffffff */               #  b33: 7cf8
            sll          a5, a5                                #  b35: 0055a1
            xor          a5, a5, a8                            #  b38: 805530
            and          a6, a6, a5                            #  b3b: 506610
            s32i         a6, a7, 4                             #  b3e: 6917
            l32i         a4, a0, 0 /* [[.Lrel114]] */          #  b40: 4800
            movi         a3, 0 /* 0x00000000 */                #  b42: 0c03
            and          a4, a4, a5                            #  b44: 504410
            s32i         a4, a0, 0 /* a4 -> [[.Lrel114]] */    #  b47: 4900
            call0        sdk_pp_post                           #  b49: 01cdffc0
                                                               #  b4d: 0000
            j            .Lbr209                               #  b4f: c6e2ff
.Lbr214:    beqz         a12, .Lbr215                          #  b52: ac2c
            movi         a9, sdk_NMIIrqIsOn                    #  b54: 91c7ff
            l8ui         a9, a9, 0 /* [sdk_NMIIrqIsOn] */      #  b57: 920900
            bnez         a9, .Lbr215                           #  b5a: dca9
            memw                                               #  b5c: c02000
            l32i         a10, a14, 0x200 /* [0x3ff00000] */    #  b5f: a22e80
            movi         a11, -32 /* 0xffffffe0 */             #  b62: 6c0b
            and          a10, a10, a11                         #  b64: b0aa10
            movi         a11, 1 /* 0x00000001 */               #  b67: 0c1b
            or           a10, a10, a11                         #  b69: b0aa20
            memw                                               #  b6c: c02000
            s32i         a10, a14, 0x200 /* a10 -> [0x3ff00000] */ #  b6f: a26e80
            call0        vPortExitCritical                     #  b72: 01c4ffc0
                                                               #  b76: 0000
.Lbr215:    movi         a2, 1 /* 0x00000001 */                #  b78: 0c12
.Lbr216:    l32i         a12, sp, 4 /* [(local1)] */           #  b7a: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  b7c: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  b7e: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  b80: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  b82: 12c110
            ret                                                #  b85: 0df0
.Lbr217:    l32i         a13, a0, 24 /* [[.Lrel114]+0x18] */   #  b87: d860
            bnez         a13, .Lbr214                          #  b89: 565dfc
            l32i         a2, a0, 56 /* [[.Lrel114]+0x38] */    #  b8c: 28e0
            bnez         a2, .Lbr214                           #  b8e: 5602fc
            l32i         a3, a0, 0x118 /* [[.Lrel114]+0x118] */ #  b91: 322046
            bnez         a3, .Lbr214                           #  b94: 56a3fb
            l32i         a4, a0, 0x120 /* [[.Lrel114]+0x120] */ #  b97: 422048
            bnez         a4, .Lbr214                           #  b9a: 5644fb
            beqz         a12, .Lbr218                          #  b9d: ac2c
            movi         a5, sdk_NMIIrqIsOn                    #  b9f: 51b5ff
            l8ui         a5, a5, 0 /* [sdk_NMIIrqIsOn] */      #  ba2: 520500
            bnez         a5, .Lbr218                           #  ba5: dca5
            memw                                               #  ba7: c02000
            l32i         a6, a14, 0x200 /* [0x3ff00000] */     #  baa: 622e80
            movi         a7, -32 /* 0xffffffe0 */              #  bad: 6c07
            and          a6, a6, a7                            #  baf: 706610
            movi         a7, 1 /* 0x00000001 */                #  bb2: 0c17
            or           a6, a6, a7                            #  bb4: 706620
            memw                                               #  bb7: c02000
            s32i         a6, a14, 0x200 /* a6 -> [0x3ff00000] */ #  bba: 626e80
            call0        vPortExitCritical                     #  bbd: 01b2ffc0
                                                               #  bc1: 0000
.Lbr218:    movi         a2, 0 /* 0x00000000 */                #  bc3: 0c02
            j            .Lbr216                               #  bc5: 46ecff

            .literal_position                                  #  bc8: 00000000
                                                               #  bcc: 00000000
                                                               #  bd0: 50030000
                                                               #  bd4: 50030000
                                                               #  bd8: 50030000
                                                               #  bdc: ffffff00
                                                               #  be0: ff0f00ff
                                                               #  be4: 00000000
                                                               #  be8: 00000000
                                                               #  bec: 00000000
                                                               #  bf0: 00000000
                                                               #  bf4: 00000000
                                                               #  bf8: 00000000
                                                               #  bfc: 00000000

# Function @ .irom0.text+0xc00
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
.Lfunc014:  movi         a9, 0 /* 0x00000000 */                #  c00: 0c09
            addi         sp, sp, -32 /* (local0) */            #  c02: 12c1e0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  c05: c921
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  c07: d931
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  c09: 0911
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  c0b: e941
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   #  c0d: f951
            s32i         a9, sp, 24 /* 0x00000000 -> [(local6)] */ #  c0f: 9961
            movi         a15, -1 /* 0xffffffff */              #  c11: 7cff
            movi         a14, 1 /* 0x00000001 */               #  c13: 0c1e
.Lbr219:    call0        .Lfunc017                             #  c15: 055400
            beqz         a2, .Lbr232                           #  c18: 16b214
            movi         a5, 184 /* 0x000000b8 */              #  c1b: 52a0b8
            l32i         a13, a2, 32                           #  c1e: d882
            movi         a0, sdk_NoiseTimerInterval            #  c20: 01eaff
            l8ui         a13, a13, 14                          #  c23: d20d0e
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  c26: 2901
.Lbr220:    neg          a12, a13                              #  c28: d0c060
            and          a12, a12, a13                         #  c2b: d0cc10
            nsau         a12, a12                              #  c2e: c0fc40
            neg          a12, a12                              #  c31: c0c060
            addi         a12, a12, 31                          #  c34: c2cc1f
            bltz         a12, .Lbr222                          #  c37: 96fc02
            l32i         a6, a0, 12 /* [.Lrel114] */           #  c3a: 6830
            add          a3, a6, a5 /* [.Lrel114]+0xb8 */      #  c3c: 5a36
            l8ui         a3, a3, 128 /* [[.Lrel114]+0x138] */  #  c3e: 320380
            ssr          a12                                   #  c41: 000c40
            srl          a3, a3                                #  c44: 303091
            bbci         a3, 0, .Lbr221                        #  c47: 076310
            addx4        a0, a12, a6                           #  c4a: 600ca0
            l32i         a0, a0, 0x13c                         #  c4d: 02204f
            l32i         a2, sp, 0 /* [(local0)] */            #  c50: 2801
            callx0       a0                                    #  c52: c00000
            movi         a0, sdk_NoiseTimerInterval            #  c55: 01ddff
            movi         a5, 184 /* 0x000000b8 */              #  c58: 52a0b8
.Lbr221:    ssl          a12                                   #  c5b: 001c40
            sll          a3, a14                               #  c5e: 003ea1
            xor          a3, a3, a15                           #  c61: f03330
            and          a13, a13, a3                          #  c64: 30dd10
            j            .Lbr220                               #  c67: 46efff
.Lbr222:    l32i         a5, sp, 0 /* [(local0)] */            #  c6a: 5801
            l32i         a5, a5, 32 /* [[(local0)]+0x20] */    #  c6c: 5885
            l32i         a4, a5, 0 /* [[[(local0)]+0x20]] */   #  c6e: 4805
            l8ui         a6, a5, 4 /* [[[(local0)]+0x20]+0x4] */ #  c70: 620504
            srli         a0, a4, 6                             #  c73: 400641
            bbsi         a4, 28, .Lbr224                       #  c76: c7f434
            movi         a5, .Ldata019                         #  c79: 51d5ff
            movi         a3, .Ldata019                         #  c7c: 31d7ff
            l8ui         a5, a5, 0 /* [.Ldata019] */           #  c7f: 520500
            srli         a6, a6, 4                             #  c82: 606441
            add          a5, a5, a6                            #  c85: 6a55
            extui        a5, a5, 0, 8                          #  c87: 505074
            bltui        a5, 5, .Lbr223                        #  c8a: b6551d
            movi         a2, 1 /* 0x00000001 */                #  c8d: 0c12
            movi         a3, 0 /* 0x00000000 */                #  c8f: 0c03
            movi         a7, .Ldata019                         #  c91: 71d0ff
            movi         a6, 0 /* 0x00000000 */                #  c94: 0c06
            s8i          a6, a7, 0 /* 0x00 -> [.Ldata019] */   #  c96: 624700
            call0        sdk_tx_pwctrl_background              #  c99: 01d5ffc0
                                                               #  c9d: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  c9f: 0801
            l32i         a0, a0, 32 /* [[(local0)]+0x20] */    #  ca1: 0880
            l32i         a0, a0, 0 /* [[[(local0)]+0x20]] */   #  ca3: 0800
            srli         a0, a0, 6                             #  ca5: 000641
            j            .Lbr224                               #  ca8: 860000
.Lbr223:    s8i          a5, a3, 0 /* a5 -> [.Ldata019] */     #  cab: 524300
.Lbr224:    bbci         a0, 13, .Lbr225                       #  cae: d76019
            l32i         a2, sp, 0 /* [(local0)] */            #  cb1: 2801
            l32i         a2, a2, 0 /* [[(local0)]] */          #  cb3: 2802
            call0        pbuf_free                             #  cb5: 01cfffc0
                                                               #  cb9: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  cbb: 0801
            l32i         a0, a0, 32 /* [[(local0)]+0x20] */    #  cbd: 0880
            movi         a3, 1 /* 0x00000001 */                #  cbf: 0c13
            l32i         a0, a0, 0 /* [[[(local0)]+0x20]] */   #  cc1: 0800
            s32i         a3, sp, 24 /* 0x00000001 -> [(local6)] */ #  cc3: 3961
            srli         a0, a0, 6                             #  cc5: 000641
            j            .Lbr228                               #  cc8: 860400
.Lbr225:    bbsi         a0, 14, .Lbr226                       #  ccb: e7e002
            j            .Lbr230                               #  cce: 062200
.Lbr226:    movi         a3, 4 /* 0x00000004 */                #  cd1: 0c43
            s32i         a3, sp, 24 /* 0x00000004 -> [(local6)] */ #  cd3: 3961
            j            .Lbr228                               #  cd5: 460100
.Lbr227:    extui        a4, a0, 21, 1                         #  cd8: 004505
            bnez         a4, .Lbr219                           #  cdb: 5664f3
.Lbr228:    bbci         a0, 23, .Lbr229                       #  cde: 77706b
            l32i         a7, sp, 0 /* [(local0)] */            #  ce1: 7801
            l16ui        a8, a7, 22 /* [[(local0)]+0x16] */    #  ce3: 82170b
            addi         a8, a8, -4 /* [[(local0)]+0x16]-0x4 */ #  ce6: 82c8fc
            s16i         a8, a7, 22 /* [[(local0)]+0x16]-0x4 -> [[(local0)]+0x16] */ #  ce9: 82570b
            l32i         a7, a7, 8 /* [[(local0)]+0x8] */      #  cec: 7827
            memw                                               #  cee: c02000
            l16ui        a8, a7, 2 /* [[[(local0)]+0x8]+0x2] */ #  cf1: 821701
            slli         a8, a8, 16                            #  cf4: 008811
            memw                                               #  cf7: c02000
            l16ui        a9, a7, 0 /* [[[(local0)]+0x8]] */    #  cfa: 921700
            or           a8, a8, a9                            #  cfd: 908820
            movi         a9, 0x00ffffff                        #  d00: 91b7ff
            and          a8, a8, a9                            #  d03: 908810
            srli         a8, a8, 12                            #  d06: 808c41
            addi         a8, a8, -4                            #  d09: 82c8fc
            extui        a8, a8, 0, 12                         #  d0c: 8080b4
            slli         a8, a8, 12                            #  d0f: 408811
            memw                                               #  d12: c02000
            l16ui        a6, a7, 2 /* [[[(local0)]+0x8]+0x2] */ #  d15: 621701
            slli         a6, a6, 16                            #  d18: 006611
            memw                                               #  d1b: c02000
            l16ui        a9, a7, 0 /* [[[(local0)]+0x8]] */    #  d1e: 921700
            or           a6, a6, a9                            #  d21: 906620
            movi         a9, 0xff000fff                        #  d24: 91afff
            and          a6, a6, a9                            #  d27: 906610
            or           a6, a6, a8                            #  d2a: 806620
            memw                                               #  d2d: c02000
            s16i         a6, a7, 0 /* a6 -> [[[(local0)]+0x8]] */ #  d30: 625700
            extui        a6, a6, 16, 16                        #  d33: 6060f5
            memw                                               #  d36: c02000
            movi         a5, sdk_PendFreeBcnEb                 #  d39: 51aaff
            s16i         a6, a7, 2 /* a6 -> [[[(local0)]+0x8]+0x2] */ #  d3c: 625701
            l8ui         a5, a5, 0 /* [sdk_PendFreeBcnEb] */   #  d3f: 520500
            beqz         a5, .Lbr219                           #  d42: 16f5ec
            movi         a10, sdk_PendFreeBcnEb                #  d45: a1a8ff
            movi         a9, 0 /* 0x00000000 */                #  d48: 0c09
            s8i          a9, a10, 0 /* 0x00 -> [sdk_PendFreeBcnEb] */ #  d4a: 924a00
.Lbr229:    l32i         a2, sp, 0 /* [(local0)] */            #  d4d: 2801
            l32i         a3, sp, 24 /* [(local6)] */           #  d4f: 3861
            call0        sdk_esf_buf_recycle                   #  d51: 01a9ffc0
                                                               #  d55: 0000
            j            .Lbr219                               #  d57: 86aeff
.Lbr230:    bbsi         a0, 15, .Lbr231                       #  d5a: f7e002
            j            .Lbr227                               #  d5d: c6ddff
.Lbr231:    movi         a11, 5 /* 0x00000005 */               #  d60: 0c5b
            s32i         a11, sp, 24 /* 0x00000005 -> [(local6)] */ #  d62: b961
            j            .Lbr228                               #  d64: 86ddff
.Lbr232:    movi         a2, 1 /* 0x00000001 */                #  d67: 0c12
            call0        sdk_ppCheckTxIdle                     #  d69: 050000
            movi         a0, sdk_g_ic                          #  d6c: 01a0ff
            l32i         a12, a0, 28 /* [sdk_g_ic+0x1c] */     #  d6f: c870
            bbci         a12, 14, .Lbr233                      #  d71: e76c09
            l32i         a2, a0, 4 /* [sdk_g_ic+0x4] */        #  d74: 2810
            addi         a2, a2, 4 /* [sdk_g_ic+0x4]+0x4 */    #  d76: 4b22
            call0        sdk_scan_connect_state                #  d78: 01a1ffc0
                                                               #  d7c: 0000
.Lbr233:    l32i         a12, sp, 8 /* [(local2)] */           #  d7e: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  d80: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  d82: e841
            l32i         a15, sp, 20 /* [(local5)] */          #  d84: f851
            l32i         a0, sp, 4 /* [(local1)] */            #  d86: 0811
            addi         sp, sp, 32 /* (top of frame) */       #  d88: 12c120
            ret                                                #  d8b: 0df0

            .literal_position                                  #  d90: 00000000
                                                               #  d94: 00000000
                                                               #  d98: 00000000
                                                               #  d9c: 00000000
                                                               #  da0: b80e0000
                                                               #  da4: 00000000
                                                               #  da8: 00000000

# Function @ .irom0.text+0xdac
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
.Lfunc015:  addi         sp, sp, -16 /* (local0) */            #  dac: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  daf: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  db1: d921
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  db3: e931
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  db5: 0901
            movi         a14, 245 /* 0x000000f5 */             #  db7: e2a0f5
            j            .Lbr235                               #  dba: 860000
.Lbr234:    call0        sdk_ppRecycleRxPkt                    #  dbd: 050000
.Lbr235:    call0        .Lfunc018                             #  dc0: 054300
            mov          a12, a2                               #  dc3: cd02
            beqz         a2, .Lbr243                           #  dc5: 167208
            l32i         a13, a2, 16                           #  dc8: d842
            l32i         a6, a2, 4                             #  dca: 6812
            addi         a5, a13, 12                           #  dcc: cb5d
            s32i         a5, a6, 4                             #  dce: 5916
            l8ui         a0, a13, 8                            #  dd0: 020d08
            beqz         a0, .Lbr236                           #  dd3: 8c10
            bne          a0, a14, .Lbr234                      #  dd5: e790e4
.Lbr236:    mov          a2, a12                               #  dd8: 2d0c
            mov          a3, a13                               #  dda: 3d0d
            call0        .Lfunc016                             #  ddc: 01f1ffc0
                                                               #  de0: 0000
            bnez         a2, .Lbr235                           #  de2: 56a2fd
            l8ui         a0, a13, 3                            #  de5: 020d03
            movi         a9, sdk_g_ic+0x180                    #  de8: 91eaff
            bbsi         a0, 4, .Lbr237                        #  deb: 47e002
            bbci         a0, 6, .Lbr238                        #  dee: 676004
.Lbr237:    srli         a8, a0, 7                             #  df1: 008741
            beqz         a8, .Lbr239                           #  df4: 8c48
.Lbr238:    l8ui         a9, a9, 84 /* [sdk_g_ic+0x1d4] */     #  df6: 920954
            bnei         a9, 1, .Lbr240                        #  df9: 66191c
.Lbr239:    mov          a3, a12                               #  dfc: 3d0c
            movi         a5, 0 /* 0x00000000 */                #  dfe: 0c05
            l32i         a4, a12, 16                           #  e00: 484c
            movi         a2, sdk_g_ic                          #  e02: 21e4ff
            l8ui         a4, a4, 0                             #  e05: 420400
            l32i         a2, a2, 16 /* [sdk_g_ic+0x10] */      #  e08: 2842
            slli         a4, a4, 24                            #  e0a: 804401
            srai         a4, a4, 24                            #  e0d: 404831
            call0        sdk_sta_input                         #  e10: 01e5ffc0
                                                               #  e14: 0000
            l8ui         a0, a13, 3                            #  e16: 020d03
.Lbr240:    bbsi         a0, 5, .Lbr241                        #  e19: 57e005
            srli         a3, a0, 7                             #  e1c: 003741
            beqz         a3, .Lbr235                           #  e1f: 16d3f9
.Lbr241:    movi         a4, sdk_TmpSTAAPCloseAP               #  e22: 41ddff
            l8ui         a4, a4, 0 /* [sdk_TmpSTAAPCloseAP] */ #  e25: 420400
            bnei         a4, 1, .Lbr242                        #  e28: 661407
            mov          a2, a12                               #  e2b: 2d0c
            call0        sdk_ppRecycleRxPkt                    #  e2d: 050000
            j            .Lbr235                               #  e30: 06e3ff
.Lbr242:    mov          a3, a12                               #  e33: 3d0c
            movi         a5, 0 /* 0x00000000 */                #  e35: 0c05
            l32i         a4, a12, 16                           #  e37: 484c
            movi         a2, sdk_g_ic                          #  e39: 21d8ff
            l8ui         a4, a4, 0                             #  e3c: 420400
            l32i         a2, a2, 20 /* [sdk_g_ic+0x14] */      #  e3f: 2852
            slli         a4, a4, 24                            #  e41: 804401
            srai         a4, a4, 24                            #  e44: 404831
            call0        sdk_hostap_input                      #  e47: 01d8ffc0
                                                               #  e4b: 0000
            j            .Lbr235                               #  e4d: c6dbff
.Lbr243:    l32i         a12, sp, 4 /* [(local1)] */           #  e50: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  e52: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  e54: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  e56: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  e58: 12c110
            ret                                                #  e5b: 0df0

            .literal_position                                  #  e60: 00000000
                                                               #  e64: 00000000
                                                               #  e68: 00000000
                                                               #  e6c: 34000000
                                                               #  e70: 00000000
                                                               #  e74: 00000000
                                                               #  e78: 00000000
                                                               #  e7c: 00000000
                                                               #  e80: 00000000
                                                               #  e84: 00000000
                                                               #  e88: 00000000
                                                               #  e8c: 00000000
                                                               #  e90: 00000000
                                                               #  e94: 00000000
                                                               #  e98: 00000000
                                                               #  e9c: 00000000
                                                               #  ea0: 00000000
                                                               #  ea4: 00000000
                                                               #  ea8: 00000000
                                                               #  eac: 00000000
                                                               #  eb0: 00000000
                                                               #  eb4: 00000000

# Function @ .irom0.text+0xeb8
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
.Lfunc016:  movi         a5, 240 /* 0x000000f0 */              #  eb8: 52a0f0
            addi         sp, sp, -48 /* (local0) */            #  ebb: 12c1d0
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   #  ebe: c941
            s32i         a2, sp, 36 /* arg0 -> [(local9)] */   #  ec0: 2991
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     #  ec2: 0931
            s32i         a14, sp, 24 /* a14 -> [(local6)] */   #  ec4: e961
            s32i         a15, sp, 28 /* a15 -> [(local7)] */   #  ec6: f971
            s32i         a13, sp, 20 /* a13 -> [(local5)] */   #  ec8: d951
            movi         a15, 12 /* 0x0000000c */              #  eca: 0ccf
            mov          a13, a3 /* arg1 */                    #  ecc: dd03
            l32i         a14, a2, 4 /* [arg0+0x4] */           #  ece: e812
            movi         a0, sdk_NoiseTimerInterval            #  ed0: 01e4ff
            l32i         a14, a14, 4 /* [[arg0+0x4]+0x4] */    #  ed3: e81e
            l8ui         a3, a0, 2 /* [.Ldata001] */           #  ed5: 320002
            l8ui         a4, a14, 0 /* [[[arg0+0x4]+0x4]] */   #  ed8: 420e00
            slli         a3, a3, 24                            #  edb: 803301
            and          a15, a4, a15                          #  ede: f0f410
            srai         a3, a3, 24                            #  ee1: 303831
            and          a4, a4, a5                            #  ee4: 504410
            s32i         a4, sp, 32 /* a4 -> [(local8)] */     #  ee7: 4981
            blti         a3, 1, .Lbr244                        #  ee9: a61310
            call0        sdk_read_hw_noisefloor                #  eec: 01e3ffc0
                                                               #  ef0: 0000
            movi         a0, sdk_NoiseTimerInterval            #  ef2: 01dcff
            addi         a3, a2, 2                             #  ef5: 2b32
            srai         a3, a3, 2                             #  ef7: 303221
            s8i          a3, a0, 2 /* a3 -> [.Ldata001] */     #  efa: 324002
.Lbr244:    s8i          a3, a13, 11 /* a3 -> [arg1+0xb] */    #  efd: 324d0b
            l8ui         a3, a13, 3 /* [arg1+0x3] */           #  f00: 320d03
            bbsi         a3, 4, .Lbr245                        #  f03: 47e305
            extui        a4, a3, 6, 1                          #  f06: 304604
            beqz         a4, .Lbr258                           #  f09: 161413
.Lbr245:    bbsi         a3, 5, .Lbr246                        #  f0c: 57e309
            srli         a6, a3, 7                             #  f0f: 306741
            bnez         a6, .Lbr246                           #  f12: cc36
            movi         a12, 0 /* 0x00000000 */               #  f14: 0c0c
            j            .Lbr247                               #  f16: 460000
.Lbr246:    movi         a12, 2 /* 0x00000002 */               #  f19: 0c2c
.Lbr247:    beqi         a15, 8, .Lbr248                       #  f1b: 268f02
            j            .Lbr251                               #  f1e: 862200
.Lbr248:    movi         a3, .Ldata003                         #  f21: 31d1ff
            l8ui         a7, a3, 49 /* [.Ldata011] */          #  f24: 720331
            bnei         a7, 1, .Lbr249                        #  f27: 661704
            movi         a8, 0 /* 0x00000000 */                #  f2a: 0c08
            s8i          a8, a3, 49 /* 0x00 -> [.Ldata011] */  #  f2c: 824331
.Lbr249:    movi         a2, .Ldata012                         #  f2f: 21cfff
            call0        sdk_os_timer_disarm                   #  f32: 01d2ffc0
                                                               #  f36: 0000
            call0        sdk_pm_is_waked                       #  f38: 01d2ffc0
                                                               #  f3c: 0000
            beqz         a2, .Lbr250                           #  f3e: 9cf2
            call0        sdk_pm_scan_unlocked                  #  f40: 01d1ffc0
                                                               #  f44: 0000
            beqz         a2, .Lbr250                           #  f46: 9c72
            movi         a3, sdk_NoiseTimerInterval            #  f48: 31cbff
            movi         a5, .Ldata003                         #  f4b: 51c9ff
            movi         a4, 1 /* 0x00000001 */                #  f4e: 0c14
            addi         a2, a5, 52 /* .Ldata012 */            #  f50: 22c534
            s8i          a4, a5, 49 /* 0x01 -> [.Ldata011] */  #  f53: 424531
            l16ui        a3, a3, 8 /* [sdk_sleep_start_wait_time] */ #  f56: 321304
            movi         a4, 0 /* 0x00000000 */                #  f59: 0c04
            call0        sdk_os_timer_arm                      #  f5b: 01cbffc0
                                                               #  f5f: 0000
.Lbr250:    bgeui        a12, 2, .Lbr253                       #  f61: f62c75
            mov          a2, a12                               #  f64: 2d0c
            addi         a3, a14, 10 /* [[arg0+0x4]+0x4]+0xa */ #  f66: ab3e
            s32i         a3, sp, 8 /* [[arg0+0x4]+0x4]+0xa -> [(local2)] */ #  f68: 3921
            call0        sdk_rc_get_trc                        #  f6a: 01c8ffc0
                                                               #  f6e: 0000
            l32i         a6, sp, 36 /* [(local9)] */           #  f70: 6891
            mov          a3, a13 /* arg1 */                    #  f72: 3d0d
            s32i         a2, a6, 24 /* a2 -> [[(local9)]+0x18] */ #  f74: 2966
            call0        sdk_rcUpdateRxDone                    #  f76: 01c6ffc0
                                                               #  f7a: 0000
            l8ui         a7, a13, 0 /* [arg1] */               #  f7c: 720d00
            mov          a2, a12                               #  f7f: 2d0c
            addi         a7, a7, 3 /* [arg1]+0x3 */            #  f81: 3b77
            s8i          a7, a13, 0 /* [arg1]+0x3 -> [arg1] */ #  f83: 724d00
            call0        sdk_ic_is_pure_sta                    #  f86: 01c3ffc0
                                                               #  f8a: 0000
            beqz         a2, .Lbr257                           #  f8c: 167209
            bnez         a15, .Lbr257                          #  f8f: 564f09
            mov          a2, a14 /* [[arg0+0x4]+0x4] */        #  f92: 2d0e
            call0        .Lfunc001                             #  f94: 01c1ffc0
                                                               #  f98: 0000
            l8ui         a8, a13, 1 /* [arg1+0x1] */           #  f9a: 820d01
            srli         a8, a8, 6                             #  f9d: 808641
            bnez         a8, .Lbr254                           #  fa0: 567804
            l16ui        a0, a13, 2 /* [arg1+0x2] */           #  fa3: 021d01
            extui        a0, a0, 0, 12                         #  fa6: 0000b4
            j            .Lbr255                               #  fa9: 461300
.Lbr251:    bnez         a15, .Lbr250                          #  fac: 561ffb
            l32i         a2, sp, 32 /* [(local8)] */           #  faf: 2881
            bnei         a2, 128, .Lbr250                      #  fb1: 66e2ac
            mov          a2, a14 /* [[arg0+0x4]+0x4] */        #  fb4: 2d0e
            call0        .Lfunc001                             #  fb6: 01b9ffc0
                                                               #  fba: 0000
            l8ui         a3, a13, 1 /* [arg1+0x1] */           #  fbc: 320d01
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      #  fbf: 2911
            srli         a3, a3, 6                             #  fc1: 303641
            bnez         a3, .Lbr261                           #  fc4: 568308
            l16ui        a4, a13, 2 /* [arg1+0x2] */           #  fc7: 421d01
            extui        a4, a4, 0, 12                         #  fca: 4040b4
            s32i         a4, sp, 0 /* a4 -> [(local0)] */      #  fcd: 4901
            j            .Lbr262                               #  fcf: 862300
.Lbr252:    mov          a2, a12                               #  fd2: 2d0c
            call0        sdk_ic_get_ptk_alg                    #  fd4: 01b3ffc0
                                                               #  fd8: 0000
.Lbr253:    movi         a2, 0 /* 0x00000000 */                #  fda: 0c02
            l32i         a12, sp, 16 /* [(local4)] */          #  fdc: c841
            l32i         a13, sp, 20 /* [(local5)] */          #  fde: d851
            l32i         a14, sp, 24 /* [(local6)] */          #  fe0: e861
            l32i         a15, sp, 28 /* [(local7)] */          #  fe2: f871
            l32i         a0, sp, 12 /* [(local3)] */           #  fe4: 0831
            addi         sp, sp, 48 /* (top of frame) */       #  fe6: 12c130
            ret           /* 0x00000000 */                     #  fe9: 0df0
.Lbr254:    l16ui        a0, a13, 6 /* [arg1+0x6] */           #  feb: 021d03
            l16ui        a3, a13, 4 /* [arg1+0x4] */           #  fee: 321d02
            slli         a0, a0, 16                            #  ff1: 000011
            or           a0, a0, a3                            #  ff4: 300020
            extui        a0, a0, 8, 16                         #  ff7: 0008f4
.Lbr255:    l32i         a3, sp, 32 /* [(local8)] */           #  ffa: 3881
            beqi         a3, 16, .Lbr256                       #  ffc: 26b304
            movi         a5, 48 /* 0x00000030 */               #  fff: 3c05
            bne          a3, a5, .Lbr257                       # 1001: 579322
.Lbr256:    sub          a3, a0, a2                            # 1004: 2030c0
            addi         a2, a14, 24 /* [[arg0+0x4]+0x4]+0x18 */ # 1007: 22ce18
            addi         a3, a3, -4                            # 100a: 32c3fc
            extui        a3, a3, 0, 16                         # 100d: 3030f4
            add          a3, a14, a3                           # 1010: 3a3e
            addi         a3, a3, 24                            # 1012: 32c318
            call0        sdk_pm_assoc_parse                    # 1015: 01a3ffc0
                                                               # 1019: 0000
            beqz         a2, .Lbr257                           # 101b: 8c82
            mov          a2, a12                               # 101d: 2d0c
            l32i         a3, sp, 8 /* [(local2)] */            # 101f: 3821
            call0        sdk_pm_set_addr                       # 1021: 01a1ffc0
                                                               # 1025: 0000
.Lbr257:    l8ui         a4, a14, 1 /* [[[arg0+0x4]+0x4]+0x1] */ # 1027: 420e01
            l8ui         a5, a14, 4 /* [[[arg0+0x4]+0x4]+0x4] */ # 102a: 520e04
            bbci         a4, 6, .Lbr253                        # 102d: 6764a9
            bbci         a5, 0, .Lbr252                        # 1030: 07659e
            mov          a2, a12                               # 1033: 2d0c
            call0        sdk_ic_get_gtk_alg                    # 1035: 019dffc0
                                                               # 1039: 0000
            j            .Lbr253                               # 103b: c6e6ff
.Lbr258:    bbsi         a3, 5, .Lbr259                        # 103e: 57e304
            srli         a6, a3, 7                             # 1041: 306741
            beqz         a6, .Lbr260                           # 1044: 8c36
.Lbr259:    movi         a12, 1 /* 0x00000001 */               # 1046: 0c1c
            j            .Lbr247                               # 1048: c6b3ff
.Lbr260:    movi         a12, 2 /* 0x00000002 */               # 104b: 0c2c
            j            .Lbr247                               # 104d: 86b2ff
.Lbr261:    l16ui        a7, a13, 6 /* [arg1+0x6] */           # 1050: 721d03
            l16ui        a8, a13, 4 /* [arg1+0x4] */           # 1053: 821d02
            slli         a7, a7, 16                            # 1056: 007711
            or           a7, a7, a8                            # 1059: 807720
            extui        a7, a7, 8, 16                         # 105c: 7078f4
            s32i         a7, sp, 0 /* a7 -> [(local0)] */      # 105f: 7901
.Lbr262:    addi         a2, a14, 10 /* [[arg0+0x4]+0x4]+0xa */ # 1061: ab2e
            call0        sdk_pm_sleep_for                      # 1063: 0193ffc0
                                                               # 1067: 0000
            beqz         a2, .Lbr250                           # 1069: 1642ef
            l32i         a2, sp, 36 /* [(local9)] */           # 106c: 2891
            l32i         a5, sp, 4 /* [(local1)] */            # 106e: 5811
            l32i         a4, sp, 0 /* [(local0)] */            # 1070: 4801
            addi         a3, a14, 24 /* [[arg0+0x4]+0x4]+0x18 */ # 1072: 32ce18
            sub          a4, a4, a5                            # 1075: 5044c0
            addi         a4, a4, -4                            # 1078: 42c4fc
            extui        a4, a4, 0, 16                         # 107b: 4040f4
            add          a4, a14, a4                           # 107e: 4a4e
            addi         a4, a4, 24                            # 1080: 42c418
            call0        sdk_pm_onBcnRx                        # 1083: 018cffc0
                                                               # 1087: 0000
            j            .Lbr250                               # 1089: 06b5ff

            .literal_position                                  # 108c: 00000000
                                                               # 1090: 00000000
                                                               # 1094: 00feef3f
                                                               # 1098: 00000000
                                                               # 109c: 00000000
                                                               # 10a0: 00feef3f
                                                               # 10a4: 00000000
                                                               # 10a8: 00000000

# Function @ .irom0.text+0x10ac
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .global      sdk_ppGetTxQFirstAvail_Locked
            .type        sdk_ppGetTxQFirstAvail_Locked, @function
sdk_ppGetTxQFirstAvail_Locked:
            addi         sp, sp, -16 /* (local0) */            # 10ac: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 10af: 0901
            bgeui        a2, 8, .Lbr265                        # 10b1: f68275
            movi         a7, sdk_NoiseTimerInterval            # 10b4: 71f6ff
            l32i         a0, a7, 12 /* [.Lrel114] */           # 10b7: 0837
            slli         a5, a2, 5                             # 10b9: b05211
            add          a0, a0, a5                            # 10bc: 5a00
            l8ui         a3, a0, 39                            # 10be: 320027
            bnez         a3, .Lbr265                           # 10c1: 565306
            movi         a4, sdk_NMIIrqIsOn                    # 10c4: 41f3ff
            l8ui         a4, a4, 0 /* [sdk_NMIIrqIsOn] */      # 10c7: 420400
            s32i         a5, sp, 4 /* a5 -> [(local1)] */      # 10ca: 5911
            bnez         a4, .Lbr264                           # 10cc: fc04
            call0        vPortEnterCritical                    # 10ce: 01f5ffc0
                                                               # 10d2: 0000
            movi         a2, 0x3feffe00                        # 10d4: 21f0ff
            movi         a6, -32 /* 0xffffffe0 */              # 10d7: 6c06
            movi         a5, sdk_NoiseTimerInterval            # 10d9: 51efff
            l32i         a7, sp, 4 /* [(local1)] */            # 10dc: 7811
.Lbr263:    memw                                               # 10de: c02000
            l32i         a9, a2, 0x200 /* [0x3ff00000] */      # 10e1: 922280
            and          a9, a9, a6                            # 10e4: 609910
            memw                                               # 10e7: c02000
            s32i         a9, a2, 0x200 /* a9 -> [0x3ff00000] */ # 10ea: 926280
            memw                                               # 10ed: c02000
            l32i         a8, a2, 0x200 /* [0x3ff00000] */      # 10f0: 822280
            bbsi         a8, 0, .Lbr263                        # 10f3: 07e8e7
            movi         a4, sdk_NMIIrqIsOn                    # 10f6: 41e9ff
            l32i         a0, a5, 12 /* [.Lrel114] */           # 10f9: 0835
            l8ui         a4, a4, 0 /* [sdk_NMIIrqIsOn] */      # 10fb: 420400
            add          a0, a0, a7                            # 10fe: 7a00
.Lbr264:    l32i         a0, a0, 24                            # 1100: 0860
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      # 1102: 0921
            bnez         a4, .Lbr266                           # 1104: ec44
            memw                                               # 1106: c02000
            movi         a6, 0x3feffe00                        # 1109: 61e5ff
            l32i         a5, a6, 0x200 /* [0x3ff00000] */      # 110c: 522680
            movi         a7, -32 /* 0xffffffe0 */              # 110f: 6c07
            and          a5, a5, a7                            # 1111: 705510
            movi         a7, 1 /* 0x00000001 */                # 1114: 0c17
            or           a5, a5, a7                            # 1116: 705520
            memw                                               # 1119: c02000
            s32i         a5, a6, 0x200 /* a5 -> [0x3ff00000] */ # 111c: 526680
            call0        vPortExitCritical                     # 111f: 01e2ffc0
                                                               # 1123: 0000
            l32i         a0, sp, 8 /* [(local2)] */            # 1125: 0821
            j            .Lbr266                               # 1127: 460000
.Lbr265:    movi         a0, 0 /* 0x00000000 */                # 112a: 0c00
.Lbr266:    beqz         a0, .Lbr267                           # 112c: 8c70
            l32i         a8, a0, 32                            # 112e: 8880
            l32i         a8, a8, 0                             # 1130: 8808
            bbci         a8, 24, .Lbr267                       # 1132: 877801
            movi         a0, 0 /* 0x00000000 */                # 1135: 0c00
.Lbr267:    mov          a2, a0                                # 1137: 2d00
            l32i         a0, sp, 0 /* [(local0)] */            # 1139: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 113b: 12c110
            ret                                                # 113e: 0df0

            .literal_position                                  # 1140: 00000000
                                                               # 1144: 00feef3f
                                                               # 1148: 00000000
                                                               # 114c: 00000000
                                                               # 1150: 00000000
                                                               # 1154: 00000000

# Function @ .irom0.text+0x1158
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
.Lfunc017:  movi         a4, -32 /* 0xffffffe0 */              # 1158: 6c04
            movi         a2, sdk_NMIIrqIsOn                    # 115a: 21f9ff
            addi         sp, sp, -16 /* (local0) */            # 115d: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 1160: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1162: 0901
            l8ui         a0, a2, 0 /* [sdk_NMIIrqIsOn] */      # 1164: 020200
            movi         a12, 0x3feffe00                       # 1167: c1f7ff
            bnez         a0, .Lbr269                           # 116a: ec10
            call0        vPortEnterCritical                    # 116c: 01f9ffc0
                                                               # 1170: 0000
            movi         a4, -32 /* 0xffffffe0 */              # 1172: 6c04
.Lbr268:    memw                                               # 1174: c02000
            l32i         a5, a12, 0x200 /* [0x3ff00000] */     # 1177: 522c80
            and          a5, a5, a4                            # 117a: 405510
            memw                                               # 117d: c02000
            s32i         a5, a12, 0x200 /* a5 -> [0x3ff00000] */ # 1180: 526c80
            memw                                               # 1183: c02000
            l32i         a3, a12, 0x200 /* [0x3ff00000] */     # 1186: 322c80
            bbsi         a3, 0, .Lbr268                        # 1189: 07e3e7
            movi         a2, sdk_NMIIrqIsOn                    # 118c: 21efff
.Lbr269:    movi         a5, sdk_NoiseTimerInterval            # 118f: 51efff
            l32i         a5, a5, 12 /* [.Lrel114] */           # 1192: 5835
            l32i         a0, a5, 0x128 /* [[.Lrel114]+0x128] */ # 1194: 02254a
            s32i         a0, sp, 8 /* [[.Lrel114]+0x128] -> [(local2)] */ # 1197: 0921
            beqz         a0, .Lbr271                           # 1199: 9c10
            movi         a8, 0 /* 0x00000000 */                # 119b: 0c08
            l32i         a6, a0, 28 /* [[[.Lrel114]+0x128]+0x1c] */ # 119d: 6870
            s32i         a6, a5, 0x128 /* [[[.Lrel114]+0x128]+0x1c] -> [[.Lrel114]+0x128] */ # 119f: 62654a
            bnez         a6, .Lbr270                           # 11a2: cc66
            movi         a7, 296 /* 0x00000128 */              # 11a4: 72a128
            add          a7, a5, a7 /* [.Lrel114]+0x128 */     # 11a7: 7a75
            s32i         a7, a5, 0x12c /* [.Lrel114]+0x128 -> [[.Lrel114]+0x12c] */ # 11a9: 72654b
.Lbr270:    s32i         a8, a0, 28 /* 0x00000000 -> [[[.Lrel114]+0x128]+0x1c] */ # 11ac: 8970
.Lbr271:    l8ui         a9, a2, 0 /* [sdk_NMIIrqIsOn] */      # 11ae: 920200
            bnez         a9, .Lbr272                           # 11b1: dca9
            memw                                               # 11b3: c02000
            l32i         a10, a12, 0x200 /* [0x3ff00000] */    # 11b6: a22c80
            movi         a11, 1 /* 0x00000001 */               # 11b9: 0c1b
            and          a10, a10, a4                          # 11bb: 40aa10
            or           a10, a10, a11                         # 11be: b0aa20
            memw                                               # 11c1: c02000
            s32i         a10, a12, 0x200 /* a10 -> [0x3ff00000] */ # 11c4: a26c80
            call0        vPortExitCritical                     # 11c7: 01e3ffc0
                                                               # 11cb: 0000
            l32i         a0, sp, 8 /* [(local2)] */            # 11cd: 0821
.Lbr272:    l32i         a12, sp, 4 /* [(local1)] */           # 11cf: c811
            mov          a2, a0                                # 11d1: 2d00
            l32i         a0, sp, 0 /* [(local0)] */            # 11d3: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 11d5: 12c110
            ret                                                # 11d8: 0df0

            .literal_position                                  # 11dc: 00000000
                                                               # 11e0: 00feef3f
                                                               # 11e4: 00000000
                                                               # 11e8: 00000000
                                                               # 11ec: 00000000
                                                               # 11f0: 00000000

# Function @ .irom0.text+0x11f4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
.Lfunc018:  movi         a4, -32 /* 0xffffffe0 */              # 11f4: 6c04
            movi         a2, sdk_NMIIrqIsOn                    # 11f6: 21f9ff
            addi         sp, sp, -16 /* (local0) */            # 11f9: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 11fc: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 11fe: 0901
            l8ui         a0, a2, 0 /* [sdk_NMIIrqIsOn] */      # 1200: 020200
            movi         a12, 0x3feffe00                       # 1203: c1f7ff
            bnez         a0, .Lbr274                           # 1206: ec10
            call0        vPortEnterCritical                    # 1208: 01f9ffc0
                                                               # 120c: 0000
            movi         a4, -32 /* 0xffffffe0 */              # 120e: 6c04
.Lbr273:    memw                                               # 1210: c02000
            l32i         a5, a12, 0x200 /* [0x3ff00000] */     # 1213: 522c80
            and          a5, a5, a4                            # 1216: 405510
            memw                                               # 1219: c02000
            s32i         a5, a12, 0x200 /* a5 -> [0x3ff00000] */ # 121c: 526c80
            memw                                               # 121f: c02000
            l32i         a3, a12, 0x200 /* [0x3ff00000] */     # 1222: 322c80
            bbsi         a3, 0, .Lbr273                        # 1225: 07e3e7
            movi         a2, sdk_NMIIrqIsOn                    # 1228: 21efff
.Lbr274:    movi         a5, sdk_NoiseTimerInterval            # 122b: 51efff
            l32i         a5, a5, 12 /* [.Lrel114] */           # 122e: 5835
            l32i         a0, a5, 0x130 /* [[.Lrel114]+0x130] */ # 1230: 02254c
            s32i         a0, sp, 8 /* [[.Lrel114]+0x130] -> [(local2)] */ # 1233: 0921
            beqz         a0, .Lbr276                           # 1235: 9c10
            movi         a8, 0 /* 0x00000000 */                # 1237: 0c08
            l32i         a6, a0, 28 /* [[[.Lrel114]+0x130]+0x1c] */ # 1239: 6870
            s32i         a6, a5, 0x130 /* [[[.Lrel114]+0x130]+0x1c] -> [[.Lrel114]+0x130] */ # 123b: 62654c
            bnez         a6, .Lbr275                           # 123e: cc66
            movi         a7, 304 /* 0x00000130 */              # 1240: 72a130
            add          a7, a5, a7 /* [.Lrel114]+0x130 */     # 1243: 7a75
            s32i         a7, a5, 0x134 /* [.Lrel114]+0x130 -> [[.Lrel114]+0x134] */ # 1245: 72654d
.Lbr275:    s32i         a8, a0, 28 /* 0x00000000 -> [[[.Lrel114]+0x130]+0x1c] */ # 1248: 8970
.Lbr276:    l8ui         a9, a2, 0 /* [sdk_NMIIrqIsOn] */      # 124a: 920200
            bnez         a9, .Lbr277                           # 124d: dca9
            memw                                               # 124f: c02000
            l32i         a10, a12, 0x200 /* [0x3ff00000] */    # 1252: a22c80
            movi         a11, 1 /* 0x00000001 */               # 1255: 0c1b
            and          a10, a10, a4                          # 1257: 40aa10
            or           a10, a10, a11                         # 125a: b0aa20
            memw                                               # 125d: c02000
            s32i         a10, a12, 0x200 /* a10 -> [0x3ff00000] */ # 1260: a26c80
            call0        vPortExitCritical                     # 1263: 01e3ffc0
                                                               # 1267: 0000
            l32i         a0, sp, 8 /* [(local2)] */            # 1269: 0821
.Lbr277:    l32i         a12, sp, 4 /* [(local1)] */           # 126b: c811
            mov          a2, a0                                # 126d: 2d00
            l32i         a0, sp, 0 /* [(local0)] */            # 126f: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1271: 12c110
            ret                                                # 1274: 0df0

            .literal_position                                  # 1278: 00000000
                                                               # 127c: 03080000
                                                               # 1280: 000e0060
                                                               # 1284: 00000000
                                                               # 1288: 20000000
                                                               # 128c: 28000000
                                                               # 1290: 0c000000
                                                               # 1294: 00000000
                                                               # 1298: 00000000
                                                               # 129c: 10270000
                                                               # 12a0: c0270900
                                                               # 12a4: 00000000
                                                               # 12a8: 00000000
                                                               # 12ac: 00000000
                                                               # 12b0: 00000000
                                                               # 12b4: 00000000

# Function @ .irom0.text+0x12b8
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word[3]   @ -0x1c
#     (local2):  word      @ -0x10
#     (local3):  word[3]   @ -0xc
            .global      sdk_pp_attach
            .type        sdk_pp_attach, @function
sdk_pp_attach:
            movi         a4, 0 /* 0x00000000 */                # 12b8: 0c04
            movi         a6, 1 /* 0x00000001 */                # 12ba: 0c16
            addi         sp, sp, -32 /* (local0) */            # 12bc: 12c1e0
            movi         a3, sdk_NoiseTimerInterval            # 12bf: 31eeff
            s32i         a0, sp, 20 /* a0 -> [(local3)] */     # 12c2: 0951
            movi         a0, 0 /* 0x00000000 */                # 12c4: 0c00
            l32i         a3, a3, 12 /* [.Lrel114] */           # 12c6: 3833
.Lbr278:    slli         a2, a0, 5                             # 12c8: b02011
            addi         a0, a0, 1                             # 12cb: 1b00
            add          a2, a3, a2                            # 12cd: 2a23
            s32i         a4, a2, 24                            # 12cf: 4962
            s8i          a4, a2, 39                            # 12d1: 424227
            extui        a0, a0, 0, 8                          # 12d4: 000074
            addi         a5, a2, 24                            # 12d7: 52c218
            s32i         a5, a2, 28                            # 12da: 5972
            bnei         a0, 8, .Lbr278                        # 12dc: 6680e8
            movi         a0, 0 /* 0x00000000 */                # 12df: 0c00
            movi         a5, 7 /* 0x00000007 */                # 12e1: 0c75
.Lbr279:    slli         a2, a0, 5                             # 12e3: b02011
            addi         a0, a0, 1                             # 12e6: 1b00
            add          a2, a3, a2                            # 12e8: 2a23
            s8i          a6, a2, 39                            # 12ea: 624227
            s8i          a5, a2, 36                            # 12ed: 524224
            extui        a0, a0, 0, 8                          # 12f0: 000074
            bnei         a0, 2, .Lbr279                        # 12f3: 6620ec
            s32i         a4, a3, 0 /* 0x00000000 -> [[.Lrel114]] */ # 12f6: 4903
            movi         a0, 0 /* 0x00000000 */                # 12f8: 0c00
.Lbr280:    addx2        a6, a0, a0                            # 12fa: 006090
            addx4        a5, a0, a3                            # 12fd: 3050a0
            s32i         a4, a5, 4                             # 1300: 4915
            slli         a6, a6, 1                             # 1302: f06611
            add          a5, a0, a3                            # 1305: 3a50
            addi         a2, a6, 3                             # 1307: 3b26
            movgez       a2, a6, a6                            # 1309: 6026b3
            addi         a0, a0, 1                             # 130c: 1b00
            extui        a0, a0, 0, 8                          # 130e: 000074
            srai         a2, a2, 2                             # 1311: 202221
            addi         a2, a2, 2                             # 1314: 2b22
            s8i          a2, a5, 20                            # 1316: 224514
            bnei         a0, 4, .Lbr280                        # 1319: 6640dd
            movi         a0, 0 /* 0x00000000 */                # 131c: 0c00
            movi         a6, 280 /* 0x00000118 */              # 131e: 62a118
.Lbr281:    addx8        a2, a0, a3                            # 1321: 3020b0
            s32i         a4, a2, 0x118                         # 1324: 426246
            addi         a0, a0, 1                             # 1327: 1b00
            add          a5, a2, a6                            # 1329: 6a52
            s32i         a5, a2, 0x11c                         # 132b: 526247
            extui        a0, a0, 0, 8                          # 132e: 000074
            bnei         a0, 2, .Lbr281                        # 1331: 6620ec
            s32i         a4, a3, 0x130 /* 0x00000000 -> [[.Lrel114]+0x130] */ # 1334: 42634c
            s32i         a4, a3, 0x128 /* 0x00000000 -> [[.Lrel114]+0x128] */ # 1337: 42634a
            movi         a9, 304 /* 0x00000130 */              # 133a: 92a130
            movi         a8, 296 /* 0x00000128 */              # 133d: 82a128
            add          a8, a3, a8 /* [.Lrel114]+0x128 */     # 1340: 8a83
            add          a9, a3, a9 /* [.Lrel114]+0x130 */     # 1342: 9a93
            s32i         a9, a3, 0x134 /* [.Lrel114]+0x130 -> [[.Lrel114]+0x134] */ # 1344: 92634d
            s32i         a8, a3, 0x12c /* [.Lrel114]+0x128 -> [[.Lrel114]+0x12c] */ # 1347: 82634b
            movi         a6, 0x00000803                        # 134a: 61ccff
            movi         a7, 0x60000e00                        # 134d: 71ccff
            memw                                               # 1350: c02000
            s32i         a6, a7, 0x3f8 /* 0x00000803 -> [0x600011f8] */ # 1353: 6267fe
            call0        sdk_esf_buf_setup                     # 1356: 01d4ffc0
                                                               # 135a: 0000
            movi         a2, sdk_ppTask                        # 135c: 21caff
            movi         a3, .Lstr004                          # 135f: 31caff
            movi         a4, 512 /* 0x00000200 */              # 1362: 42a200
            movi         a5, 0 /* 0x00000000 */                # 1365: 0c05
            movi         a6, 14 /* 0x0000000e */               # 1367: 0ce6
            addi         a7, sp, 16 /* (local2) */             # 1369: 72c110
            movi         a10, 0 /* 0x00000000 */               # 136c: 0c0a
            s32i         a10, sp, 0 /* 0x00000000 -> [(local0)] */ # 136e: a901
            s32i         a10, sp, 4 /* 0x00000000 -> [(local1)] */ # 1370: a911
            call0        xTaskGenericCreate                    # 1372: 01ceffc0
                                                               # 1376: 0000
            movi         a2, .Lstr005                          # 1378: 21c5ff
            l32i         a3, sp, 16 /* [(local2)] */           # 137b: 3841
            movi         a4, 14 /* 0x0000000e */               # 137d: 0ce4
            movi         a5, 512 /* 0x00000200 */              # 137f: 52a200
            call0        printf                                # 1382: 01cbffc0
                                                               # 1386: 0000
            movi         a2, .Ldata008                         # 1388: 21c2ff
            movi         a3, sdk_pp_noise_test                 # 138b: 31c2ff
            movi         a4, 0 /* 0x00000000 */                # 138e: 0c04
            movi         a0, sdk_NoiseTimerInterval            # 1390: 01c5ff
            movi         a6, sdk_chip6_phy_init_ctrl           # 1393: 61c1ff
            movi         a5, 0x00002710                        # 1396: 51c1ff
            l8ui         a6, a6, 106 /* [sdk_chip6_phy_init_ctrl+0x6a] */ # 1399: 62066a
            movi         a11, 0x000927c0                       # 139c: b1c1ff
            mul16u       a5, a6, a5                            # 139f: 5056c1
            movnez       a11, a5, a6                           # 13a2: 60b593
            s32i         a11, a0, 4 /* a11 -> [.Ldata002] */   # 13a5: b910
            call0        sdk_os_timer_setfn                    # 13a7: 01c3ffc0
                                                               # 13ab: 0000
            call0        sdk_pp_enable_noise_timer             # 13ad: 050000
            l32i         a0, sp, 20 /* [(local3)] */           # 13b0: 0851
            addi         sp, sp, 32 /* (top of frame) */       # 13b2: 12c120
            ret                                                # 13b5: 0df0

            .literal_position                                  # 13b8: ffffff00
                                                               # 13bc: ff0f00ff
                                                               # 13c0: 04000000
                                                               # 13c4: 0c000000
                                                               # 13c8: 1b0a0000
                                                               # 13cc: fcff0000
                                                               # 13d0: 00f00000
                                                               # 13d4: 0ff80000
                                                               # 13d8: 00000000

# Function @ .irom0.text+0x13dc
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc019:  addi         sp, sp, -16 /* (local0) */            # 13dc: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 13df: 0901
            l32i         a0, a2, 32 /* [arg0+0x20] */          # 13e1: 0882
            l32i         a5, a2, 24 /* [arg0+0x18] */          # 13e3: 5862
            l8ui         a0, a0, 13 /* [[arg0+0x20]+0xd] */    # 13e5: 02000d
            l16ui        a10, a2, 22 /* [arg0+0x16] */         # 13e8: a2120b
            extui        a0, a0, 0, 4                          # 13eb: 000034
            beqz         a0, .Lbr282                           # 13ee: 8cd0
            beqi         a0, 1, .Lbr283                        # 13f0: 261010
            addi         a3, a0, -2                            # 13f3: 32c0fe
            beqz         a3, .Lbr290                           # 13f6: 16830c
            addi         a4, a0, -3                            # 13f9: 42c0fd
            beqz         a4, .Lbr294                           # 13fc: 168412
.Lbr282:    movi         a0, 4 /* 0x00000004 */                # 13ff: 0c40
            j            .Lbr284                               # 1401: 460000
.Lbr283:    movi         a0, 8 /* 0x00000008 */                # 1404: 0c80
.Lbr284:    add          a10, a10, a0                          # 1406: 0aaa
            s16i         a10, a2, 22 /* a10 -> [arg0+0x16] */  # 1408: a2520b
            movi         a11, 0x00ffffff                       # 140b: b1ebff
            l32i         a8, a2, 8 /* [arg0+0x8] */            # 140e: 8822
            memw                                               # 1410: c02000
            l16ui        a9, a8, 2 /* [[arg0+0x8]+0x2] */      # 1413: 921801
            slli         a9, a9, 16                            # 1416: 009911
            memw                                               # 1419: c02000
            l16ui        a3, a8, 0 /* [[arg0+0x8]] */          # 141c: 321800
            movi         a10, 0xff000fff                       # 141f: a1e7ff
            or           a9, a9, a3                            # 1422: 309920
            and          a9, a9, a11                           # 1425: b09910
            srli         a9, a9, 12                            # 1428: 909c41
            add          a9, a9, a0                            # 142b: 0a99
            extui        a9, a9, 0, 12                         # 142d: 9090b4
            slli         a9, a9, 12                            # 1430: 409911
            memw                                               # 1433: c02000
            l16ui        a7, a8, 2 /* [[arg0+0x8]+0x2] */      # 1436: 721801
            slli         a7, a7, 16                            # 1439: 007711
            memw                                               # 143c: c02000
            l16ui        a11, a8, 0 /* [[arg0+0x8]] */         # 143f: b21800
            or           a7, a7, a11                           # 1442: b07720
            and          a7, a7, a10                           # 1445: a07710
            or           a7, a7, a9                            # 1448: 907720
            memw                                               # 144b: c02000
            s16i         a7, a8, 0 /* a7 -> [[arg0+0x8]] */    # 144e: 725800
            extui        a7, a7, 16, 16                        # 1451: 7070f5
            memw                                               # 1454: c02000
            l32i         a6, a2, 32 /* [arg0+0x20] */          # 1457: 6882
            movi         a3, 64 /* 0x00000040 */               # 1459: 4c03
            l32i         a6, a6, 0 /* [[arg0+0x20]] */         # 145b: 6806
            s16i         a7, a8, 2 /* a7 -> [[arg0+0x8]+0x2] */ # 145d: 725801
            bbci         a6, 24, .Lbr285                       # 1460: 877606
            bnez         a5, .Lbr288                           # 1463: ec35
            movi         a2, 1 /* 0x00000001 */                # 1465: 0c12
            j            .Lbr287                               # 1467: 060600
.Lbr285:    movi         a4, 191 /* 0x000000bf */              # 146a: 42a0bf
            l32i         a0, a2, 8 /* [arg0+0x8] */            # 146d: 0822
            memw                                               # 146f: c02000
            l8ui         a11, a0, 3 /* [[arg0+0x8]+0x3] */     # 1472: b20003
            and          a11, a11, a4                          # 1475: 40bb10
            or           a11, a11, a3                          # 1478: 30bb20
            memw                                               # 147b: c02000
            s8i          a11, a0, 3 /* a11 -> [[arg0+0x8]+0x3] */ # 147e: b24003
.Lbr286:    movi         a2, 0 /* 0x00000000 */                # 1481: 0c02
.Lbr287:    l32i         a0, sp, 0 /* [(local0)] */            # 1483: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1485: 12c110
            ret                                                # 1488: 0df0
.Lbr288:    movi         a6, 32 /* 0x00000020 */               # 148a: 2c06
            movi         a7, 223 /* 0x000000df */              # 148c: 72a0df
            l32i         a4, a2, 4 /* [arg0+0x4] */            # 148f: 4812
            memw                                               # 1491: c02000
            l8ui         a3, a4, 3 /* [[arg0+0x4]+0x3] */      # 1494: 320403
            and          a3, a3, a7                            # 1497: 703310
            or           a3, a3, a6                            # 149a: 603320
            memw                                               # 149d: c02000
            s8i          a3, a4, 3 /* a3 -> [[arg0+0x4]+0x3] */ # 14a0: 324403
            l32i         a0, a2, 32 /* [arg0+0x20] */          # 14a3: 0882
            l8ui         a0, a0, 13 /* [[arg0+0x20]+0xd] */    # 14a5: 02000d
            extui        a0, a0, 0, 4                          # 14a8: 000034
            beqi         a0, 3, .Lbr291                        # 14ab: 263018
            beqz         a0, .Lbr291                           # 14ae: 9c50
            movi         a2, .Lstr001                          # 14b0: 21c4ff
            movi         a3, .Lstr002                          # 14b3: 31c4ff
            movi         a4, 0x00000a1b                        # 14b6: 41c4ff
            call0        printf                                # 14b9: 01c7ffc0
                                                               # 14bd: 0000
.Lbr289:    j            .Lbr289 /* (halt) */                  # 14bf: 06ffff
.Lbr290:    movi         a0, 16 /* 0x00000010 */               # 14c2: 1c00
            j            .Lbr284                               # 14c4: 86cfff
.Lbr291:    movi         a4, 0x0000fffc                        # 14c7: 41c1ff
            l16ui        a3, a2, 22 /* [arg0+0x16] */          # 14ca: 32120b
            l32i         a2, a2, 4 /* [arg0+0x4] */            # 14cd: 2812
            add          a3, a3, a4 /* [arg0+0x16]+0xfffc */   # 14cf: 4a33
            l32i         a2, a2, 4 /* [[arg0+0x4]+0x4] */      # 14d1: 2812
            movi         a4, 0x0000f000                        # 14d3: 41bfff
            l16ui        a0, a2, 0 /* [[[arg0+0x4]+0x4]] */    # 14d6: 021200
            extui        a3, a3, 0, 12                         # 14d9: 3030b4
            and          a0, a0, a4                            # 14dc: 400010
            or           a0, a0, a3                            # 14df: 300020
            l8ui         a3, a2, 2 /* [[[arg0+0x4]+0x4]+0x2] */ # 14e2: 320202
            s16i         a0, a2, 0 /* a0 -> [[[arg0+0x4]+0x4]] */ # 14e5: 025200
            l8ui         a5, a5, 116 /* [[arg0+0x18]+0x74] */  # 14e8: 520574
            l8ui         a6, a2, 1 /* [[[arg0+0x4]+0x4]+0x1] */ # 14eb: 620201
            extui        a0, a0, 0, 12                         # 14ee: 0000b4
            addi         a8, a0, 4                             # 14f1: 4b80
            slli         a3, a3, 8                             # 14f3: 803311
            or           a3, a3, a6                            # 14f6: 603320
            blt          a5, a8, .Lbr292                       # 14f9: 872508
            sub          a0, a5, a0                            # 14fc: 0005c0
            srai         a0, a0, 2                             # 14ff: 000221
            j            .Lbr293                               # 1502: 460000
.Lbr292:    movi         a0, 0 /* 0x00000000 */                # 1505: 0c00
.Lbr293:    movi         a5, 0x0000f80f                        # 1507: 51b3ff
            extui        a4, a0, 0, 7                          # 150a: 004064
            slli         a4, a4, 4                             # 150d: c04411
            and          a3, a3, a5                            # 1510: 503310
            or           a3, a3, a4                            # 1513: 403320
            s8i          a3, a2, 1 /* a3 -> [[[arg0+0x4]+0x4]+0x1] */ # 1516: 324201
            movi         a4, 207 /* 0x000000cf */              # 1519: 42a0cf
            extui        a3, a3, 8, 8                          # 151c: 303874
            and          a3, a3, a4                            # 151f: 403310
            s8i          a3, a2, 2 /* a3 -> [[[arg0+0x4]+0x4]+0x2] */ # 1522: 324202
            j            .Lbr286                               # 1525: 06d6ff
.Lbr294:    movi         a0, 12 /* 0x0000000c */               # 1528: 0cc0
            j            .Lbr284                               # 152a: 06b6ff

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Label001:  .word        0x00000079                            #    0: 79000000
.Lstr001:   .asciz       "%s %u\n"                             #    4: 25732025
                                                               #    8: 750a00
            .balign      4
.Lstr002:   .asciz       "pp.c"                                #    c: 70702e63
                                                               #   10: 00
            .balign      4
.Lstr003:   .asciz       "map fail\n"                          #   14: 6d617020
                                                               #   18: 6661696c
                                                               #   1c: 0a00
            .balign      4
.Lstr004:   .asciz       "ppTask"                              #   20: 70705461
                                                               #   24: 736b00
            .balign      4
.Lstr005:   .asciz       "pp_task_hdl : %x, prio:%d, stack:%d\n" #   28: 70705f74
                                                               #   2c: 61736b5f
                                                               #   30: 68646c20
                                                               #   34: 3a202578
                                                               #   38: 2c207072
                                                               #   3c: 696f3a25
                                                               #   40: 642c2073
                                                               #   44: 7461636b
                                                               #   48: 3a25640a
                                                               #   4c: 00
            .balign      4
.Lstr006:   .asciz       "p e2 m f\n"                          #   50: 70206532
                                                               #   54: 206d2066
                                                               #   58: 0a00
            .balign      4
.Lstr007:   .asciz       "E_QF:%d!!"                           #   5c: 455f5146
                                                               #   60: 3a256421
                                                               #   64: 2100
            .balign      4
.Lstr008:   .asciz       "p e1 m f\n"                          #   68: 70206531
                                                               #   6c: 206d2066
                                                               #   70: 0a00
            .balign      4
.Lstr009:   .asciz       "E_UF!!!"                             #   74: 455f5546
                                                               #   78: 21212100

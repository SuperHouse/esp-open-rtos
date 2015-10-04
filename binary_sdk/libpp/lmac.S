
            .section     .text, "ax", @progbits

            .literal_position                                  #    0: 00000000

# Function @ .text+0x4
            .balign      4
            .global      sdk_lmacIsActive
            .type        sdk_lmacIsActive, @function
sdk_lmacIsActive:
            movi         a3, .Ldata001                         #    4: 31ffff
            l8ui         a3, a3, 0 /* [.Ldata001] */           #    7: 320300
            movi         a2, 1 /* 0x00000001 */                #    a: 0c12
            bltui        a3, 8, .Lbr001                        #    c: b68301
            movi         a2, 0 /* 0x00000000 */                #    f: 0c02
.Lbr001:    ret                                                #   11: 0df0

            .literal_position                                  #   14: 30000000

# Function @ .text+0x18
            .balign      4
            .global      sdk_lmacIsIdle
            .type        sdk_lmacIsIdle, @function
sdk_lmacIsIdle:
            movi         a3, 1 /* 0x00000001 */                #   18: 0c13
            movi         a5, .Label001                         #   1a: 51feff
            addx8        a4, a2, a2                            #   1d: 2042b0
            addx4        a4, a4, a5                            #   20: 5044a0
            l8ui         a4, a4, 17                            #   23: 420411
            movi         a2, 0 /* 0x00000000 */                #   26: 0c02
            moveqz       a2, a3, a4                            #   28: 402383
            ret                                                #   2b: 0df0

            .literal_position                                  #   30: 00000000
                                                               #   34: 00000000
                                                               #   38: 08000000
                                                               #   3c: 00000000
                                                               #   40: 00000000
                                                               #   44: 00000000

# Function @ .text+0x48
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc001:  addi         sp, sp, -16 /* (local0) */            #   48: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   4b: 0911
            movi         a0, .Ldata001                         #   4d: 01f8ff
            l32i         a0, a0, 36 /* [.Ldata010] */          #   50: 0890
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #   52: 2901
            bnez         a0, .Lbr003                           #   54: dc00
            movi         a2, .Lstr001                          #   56: 21f7ff
            movi         a3, .Lstr002                          #   59: 31f7ff
            movi         a4, 237 /* 0x000000ed */              #   5c: 42a0ed
            call0        printf                                #   5f: 01f7ffc0
                                                               #   63: 0000
.Lbr002:    j            .Lbr002 /* (halt) */                  #   65: 06ffff
.Lbr003:    mov          a2, a3 /* arg1 */                     #   68: 2d03
            movi         a3, 3 /* 0x00000003 */                #   6a: 0c33
            call0        sdk_wDev_SetFrameAckType              #   6c: 01f5ffc0
                                                               #   70: 0000
            l32i         a3, sp, 0 /* [(local0)] */            #   72: 3801
            s8i          a2, a3, 16 /* a2 -> [[(local0)]+0x10] */ #   74: 224310
            movi         a2, 10 /* 0x0000000a */               #   77: 0ca2
            call0        sdk_wDev_SetWaitingQueue              #   79: 01f2ffc0
                                                               #   7d: 0000
            l32i         a0, sp, 4 /* [(local1)] */            #   7f: 0811
            addi         sp, sp, 16 /* (top of frame) */       #   81: 12c110
            ret                                                #   84: 0df0

            .literal_position                                  #   88: 00000000
                                                               #   8c: 00000000
                                                               #   90: 08000000
                                                               #   94: 00000000
                                                               #   98: 00000000
                                                               #   9c: 00000000

# Function @ .text+0xa0
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc002:  addi         sp, sp, -16 /* (local0) */            #   a0: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   a3: 0901
            movi         a0, .Ldata001                         #   a5: 01f8ff
            l32i         a0, a0, 36 /* [.Ldata010] */          #   a8: 0890
            mov          a9, a2 /* arg0 */                     #   aa: 9d02
            bnez         a0, .Lbr005                           #   ac: dc00
            movi         a2, .Lstr001                          #   ae: 21f7ff
            movi         a3, .Lstr002                          #   b1: 31f7ff
            movi         a4, 248 /* 0x000000f8 */              #   b4: 42a0f8
            call0        printf                                #   b7: 01f7ffc0
                                                               #   bb: 0000
.Lbr004:    j            .Lbr004 /* (halt) */                  #   bd: 06ffff
.Lbr005:    mov          a2, a3 /* arg1 */                     #   c0: 2d03
            l8ui         a3, a9, 16 /* [arg0+0x10] */          #   c2: 320910
            call0        sdk_wDev_SetFrameAckType              #   c5: 01f4ffc0
                                                               #   c9: 0000
            movi         a2, 10 /* 0x0000000a */               #   cb: 0ca2
            call0        sdk_wDev_ClearWaitingQueue            #   cd: 01f3ffc0
                                                               #   d1: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   d3: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   d5: 12c110
            ret                                                #   d8: 0df0

            .balign      4
# Function @ .text+0xdc
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc003:  addi         sp, sp, -16 /* (local0) */            #   dc: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   df: 0901
            call0        .Lfunc004                             #   e1: c50400
            l32i         a0, sp, 0 /* [(local0)] */            #   e4: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   e6: 12c110
            ret                                                #   e9: 0df0

            .literal_position                                  #   ec: 00000000
                                                               #   f0: 00000000
                                                               #   f4: 08000000
                                                               #   f8: ffff0300
                                                               #   fc: 000af23f
                                                               #  100: 00000001
                                                               #  104: 00000010
                                                               #  108: 00000008
                                                               #  10c: 00004000
                                                               #  110: 00004000
                                                               #  114: 00000001
                                                               #  118: 00000010
                                                               #  11c: 00000008
                                                               #  120: 00000000
                                                               #  124: 00000000
                                                               #  128: 00000000
                                                               #  12c: 00000000

# Function @ .text+0x130
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
#     (local9):  word      @ -0xc
#     (local10): word      @ -0x8
#     (local11): word      @ -0x4
            .balign      4
.Lfunc004:  movi         a8, 0 /* 0x00000000 */                #  130: 0c08
            movi         a10, 128 /* 0x00000080 */             #  132: a2a080
            movi         a11, .Ldata001                        #  135: b1edff
            addi         sp, sp, -48 /* (local0) */            #  138: 12c1d0
            s32i         a0, sp, 20 /* a0 -> [(local5)] */     #  13b: 0951
            s32i         a14, sp, 32 /* a14 -> [(local8)] */   #  13d: e981
            s32i         a12, sp, 24 /* a12 -> [(local6)] */   #  13f: c961
            s32i         a13, sp, 28 /* a13 -> [(local7)] */   #  141: d971
            mov          a12, a2 /* arg0 */                    #  143: cd02
            mov          a13, a3 /* arg1 */                    #  145: dd03
            bnez         a3, .Lbr006                           #  147: cc33
            l32i         a14, a2, 0 /* [arg0] */               #  149: e802
            j            .Lbr007                               #  14b: 460000
.Lbr006:    l32i         a14, a11, 36 /* [.Ldata010] */        #  14e: e89b
.Lbr007:    l32i         a6, a14, 16                           #  150: 684e
            l16ui        a7, a14, 22                           #  152: 721e0b
            l32i         a0, a14, 32                           #  155: 088e
            l16ui        a5, a14, 20                           #  157: 521e0a
            l32i         a9, a0, 0                             #  15a: 9800
            l16ui        a3, a0, 6                             #  15c: 321003
            add          a5, a5, a7                            #  15f: 7a55
            extui        a5, a5, 0, 16                         #  161: 5050f4
            l8ui         a7, a12, 17 /* [arg0+0x11] */         #  164: 720c11
            srli         a3, a3, 7                             #  167: 303741
            srli         a2, a9, 6                             #  16a: 902641
            and          a10, a2, a10                          #  16d: a0a210
            bbci         a9, 13, .Lbr008                       #  170: d76904
            bbsi         a9, 12, .Lbr008                       #  173: c7e901
            movi         a8, 1 /* 0x00000001 */                #  176: 0c18
.Lbr008:    beqz         a7, .Lbr010                           #  178: 9c67
            beqi         a7, 3, .Lbr010                        #  17a: 263714
            beqi         a7, 2, .Lbr010                        #  17d: 262711
            movi         a2, .Lstr001                          #  180: 21dcff
            movi         a3, .Lstr002                          #  183: 31dcff
            movi         a4, 277 /* 0x00000115 */              #  186: 42a115
            call0        printf                                #  189: 01e5ffc0
                                                               #  18d: 0000
.Lbr009:    j            .Lbr009 /* (halt) */                  #  18f: 06ffff
.Lbr010:    movi         a7, 0 /* 0x00000000 */                #  192: 0c07
            s32i         a8, sp, 4 /* a8 -> [(local1)] */      #  194: 8911
            s32i         a5, sp, 12 /* a5 -> [(local3)] */     #  196: 5931
            movi         a4, 1 /* 0x00000001 */                #  198: 0c14
            s32i         a4, sp, 16 /* 0x00000001 -> [(local4)] */ #  19a: 4941
            bbci         a2, 22, .Lbr011                       #  19c: 677210
            movi         a8, 1 /* 0x00000001 */                #  19f: 0c18
            l32i         a0, a14, 32                           #  1a1: 088e
            movi         a5, 1 /* 0x00000001 */                #  1a3: 0c15
            l32i         a2, a0, 0                             #  1a5: 2800
            s16i         a3, a6, 2                             #  1a7: 325601
            srli         a2, a2, 6                             #  1aa: 202641
            j            .Lbr015                               #  1ad: c61500
.Lbr011:    l8ui         a4, a12, 11 /* [arg0+0xb] */          #  1b0: 420c0b
            bnez         a4, .Lbr012                           #  1b3: cc44
            l8ui         a5, a12, 13 /* [arg0+0xd] */          #  1b5: 520c0d
            beqz         a5, .Lbr044                           #  1b8: 161525
.Lbr012:    l16si        a9, a12, 22 /* [arg0+0x16] */         #  1bb: 929c0b
            l16si        a5, a12, 20 /* [arg0+0x14] */         #  1be: 529c0a
            l32i         a4, a11, 40 /* [.Ldata011] */         #  1c1: 48ab
            slli         a8, a3, 16                            #  1c3: 008311
            srai         a8, a8, 16                            #  1c6: 808031
            l32i         a4, a4, 32 /* [[.Ldata011]+0x20] */   #  1c9: 4884
            sub          a5, a5, a9                            #  1cb: 9055c0
            l16ui        a4, a4, 6 /* [[[.Ldata011]+0x20]+0x6] */ #  1ce: 421403
            s16i         a5, a12, 20 /* a5 -> [arg0+0x14] */   #  1d1: 525c0a
            l16si        a9, a12, 20 /* [arg0+0x14] */         #  1d4: 929c0a
            l16ui        a0, a0, 10                            #  1d7: 021005
            srli         a4, a4, 7                             #  1da: 404741
            add          a0, a0, a4                            #  1dd: 4a00
            sub          a0, a0, a3                            #  1df: 3000c0
            slli         a0, a0, 16                            #  1e2: 000011
            srai         a0, a0, 16                            #  1e5: 000031
            s16i         a0, a12, 22 /* a0 -> [arg0+0x16] */   #  1e8: 025c0b
            sub          a0, a9, a0                            #  1eb: 0009c0
            blt          a8, a0, .Lbr013                       #  1ee: 072808
            s16i         a3, a6, 2                             #  1f1: 325601
            s8i          a7, a12, 12 /* 0x00 -> [arg0+0xc] */  #  1f4: 724c0c
            j            .Lbr014                               #  1f7: 860000
.Lbr013:    s16i         a0, a6, 2                             #  1fa: 025601
.Lbr014:    l32i         a0, a14, 32                           #  1fd: 088e
            movi         a8, 0 /* 0x00000000 */                #  1ff: 0c08
            l32i         a2, a0, 0                             #  201: 2800
            movi         a5, 0 /* 0x00000000 */                #  203: 0c05
            srli         a2, a2, 6                             #  205: 202641
.Lbr015:    movi         a9, 256 /* 0x00000100 */              #  208: 92a100
            and          a3, a2, a9                            #  20b: 903210
            beqz         a5, .Lbr016                           #  20e: ac35
            s32i         a8, sp, 36 /* a8 -> [(local9)] */     #  210: 8991
            s32i         a7, sp, 40 /* a7 -> [(local10)] */    #  212: 79a1
            s32i         a6, sp, 44 /* a6 -> [(local11)] */    #  214: 69b1
            bbci         a2, 8, .Lbr016                        #  216: 87621b
            l8ui         a2, a0, 8                             #  219: 220008
            call0        sdk_RC_GetAckTime                     #  21c: 01c2ffc0
                                                               #  220: 0000
            l32i         a6, sp, 44 /* [(local11)] */          #  222: 68b1
            l32i         a7, sp, 40 /* [(local10)] */          #  224: 78a1
            l32i         a0, a14, 32                           #  226: 088e
            l32i         a8, sp, 36 /* [(local9)] */           #  228: 8891
            l32i         a2, a0, 0                             #  22a: 2800
            movi         a3, 256 /* 0x00000100 */              #  22c: 32a100
            srli         a2, a2, 6                             #  22f: 202641
            and          a3, a2, a3                            #  232: 303210
.Lbr016:    movi         a4, 1026 /* 0x00000402 */             #  235: 42a402
            bany         a2, a4, .Lbr017                       #  238: 47820b
            extui        a5, a2, 22, 1                         #  23b: 205605
            beqz         a5, .Lbr035                           #  23e: 16a518
            extui        a9, a2, 19, 1                         #  241: 209305
            bnez         a9, .Lbr035                           #  244: 564918
.Lbr017:    movi         a5, 0 /* 0x00000000 */                #  247: 0c05
            j            .Lbr019                               #  249: 460200
.Lbr018:    extui        a11, a2, 19, 1                        #  24c: 20b305
            l32i         a5, sp, 16 /* [(local4)] */           #  24f: 5841
            movi         a10, 2 /* 0x00000002 */               #  251: 0c2a
            movnez       a5, a10, a11                          #  253: b05a93
.Lbr019:    movi         a11, 0x0003ffff                       #  256: b1a8ff
            l32i         a9, a14, 4                            #  259: 981e
            l16ui        a10, a6, 2                            #  25b: a21601
            l16si        a14, a12, 20 /* [arg0+0x14] */        #  25e: e29c0a
            extui        a6, a5, 0, 3                          #  261: 506024
            slli         a6, a6, 24                            #  264: 806601
            slli         a10, a10, 16                          #  267: 00aa11
            and          a9, a9, a11                           #  26a: b09910
            l32i         a11, sp, 12 /* [(local3)] */          #  26d: b831
            movi         a5, 0x3ff20a00                        #  26f: 51a3ff
            extui        a11, a11, 0, 12                       #  272: b0b0b4
            beqz         a13, .Lbr037                          #  275: 163d16
            movi         a12, 0x01000000                       #  278: c1a2ff
            bbci         a2, 9, .Lbr020                        #  27b: 976201
            bnez         a8, .Lbr021                           #  27e: cc38
.Lbr020:    movi         a13, 0 /* 0x00000000 */               #  280: 0c0d
            j            .Lbr022                               #  282: 860000
.Lbr021:    movi         a13, 0x10000000                       #  285: d19fff
.Lbr022:    beqz         a3, .Lbr036                           #  288: 16b314
            beqz         a8, .Lbr036                           #  28b: 168814
            movi         a3, 0x08000000                        #  28e: 319eff
.Lbr023:    bgei         a14, 1, .Lbr024                       #  291: e61e0c
            l32i         a8, sp, 4 /* [(local1)] */            #  294: 8811
            extui        a8, a8, 0, 8                          #  296: 808074
            bnez         a8, .Lbr024                           #  299: cc48
            l8ui         a14, a0, 8                            #  29b: e20008
            bltui        a14, 16, .Lbr025                      #  29e: b6be04
.Lbr024:    movi         a2, 0 /* 0x00000000 */                #  2a1: 0c02
            j            .Lbr026                               #  2a3: 860000
.Lbr025:    movi         a2, 0x00400000                        #  2a6: 2199ff
.Lbr026:    or           a8, a13, a3                           #  2a9: 308d20
            or           a14, a2, a9                           #  2ac: 90e220
            or           a8, a6, a8                            #  2af: 808620
            mov          a2, a12 /* 0x01000000 */              #  2b2: 2d0c
            or           a8, a8, a14                           #  2b4: e08820
            memw                                               #  2b7: c02000
            s32i         a8, a5, 0x2dc /* a8 -> [0x3ff20cdc] */ #  2ba: 8265b7
            memw                                               #  2bd: c02000
            s32i         a10, a5, 0x2e8 /* a10 -> [0x3ff20ce8] */ #  2c0: a265ba
            l8ui         a6, a0, 12                            #  2c3: 62000c
            l8ui         a3, a0, 8                             #  2c6: 320008
            slli         a6, a6, 16                            #  2c9: 006611
            extui        a9, a3, 0, 4                          #  2cc: 309034
            slli         a9, a9, 12                            #  2cf: 409911
            or           a9, a11, a9                           #  2d2: 909b20
            bgeui        a3, 16, .Lbr027                       #  2d5: f6b301
            mov          a2, a7                                #  2d8: 2d07
.Lbr027:    or           a10, a2, a6                           #  2da: 60a220
            or           a9, a9, a10                           #  2dd: a09920
            memw                                               #  2e0: c02000
            s32i         a9, a5, 0x2e0 /* a9 -> [0x3ff20ce0] */ #  2e3: 9265b8
            l8ui         a3, a0, 8                             #  2e6: 320008
            movi         a2, 135 /* 0x00000087 */              #  2e9: 22a087
            bgeui        a3, 16, .Lbr028                       #  2ec: f6b302
            j            .Lbr034                               #  2ef: 063300
.Lbr028:    movi         a10, 8 /* 0x00000008 */               #  2f2: 0c8a
            l32i         a11, a0, 0                            #  2f4: b800
            l32i         a14, sp, 12 /* [(local3)] */          #  2f6: e831
            addi         a0, a3, -16                           #  2f8: 02c3f0
            slli         a14, a14, 8                           #  2fb: 80ee11
            extui        a12, a0, 0, 3                         #  2fe: 00c024
            extui        a11, a11, 28, 1                       #  301: b0bc05
            movnez       a7, a10, a11                          #  304: b07a93
            mov          a6, a7                                #  307: 6d07
            or           a12, a12, a14                         #  309: e0cc20
            bgei         a0, 8, .Lbr029                        #  30c: e68001
            movi         a2, 7 /* 0x00000007 */                #  30f: 0c72
.Lbr029:    or           a13, a2, a6                           #  311: 60d220
            slli         a13, a13, 24                          #  314: 80dd01
            or           a12, a12, a13                         #  317: d0cc20
            memw                                               #  31a: c02000
            s32i         a12, a5, 0x2e4 /* a12 -> [0x3ff20ce4] */ #  31d: c265b9
            j            .Lbr034                               #  320: c62600
.Lbr030:    movi         a3, 0x00400000                        #  323: 317bff
.Lbr031:    movi         a2, 0x01000000                        #  326: 217bff
            or           a4, a13, a8                           #  329: 804d20
            or           a14, a3, a9                           #  32c: 90e320
            or           a4, a6, a4                            #  32f: 404620
            l8ui         a6, a12, 4 /* [arg0+0x4] */           #  332: 620c04
            movi         a8, -24 /* 0xffffffe8 */              #  335: 6c88
            mul16s       a6, a8, a6                            #  337: 6068d1
            or           a4, a4, a14                           #  33a: e04420
            add          a6, a6, a5                            #  33d: 5a66
            memw                                               #  33f: c02000
            s32i         a4, a6, 0x3c4                         #  342: 4266f1
            l8ui         a3, a12, 4 /* [arg0+0x4] */           #  345: 320c04
            mul16s       a3, a8, a3                            #  348: 3038d1
            add          a3, a3, a5                            #  34b: 5a33
            memw                                               #  34d: c02000
            s32i         a10, a3, 0x3d0                        #  350: a263f4
            l8ui         a3, a0, 8                             #  353: 320008
            l8ui         a6, a0, 12                            #  356: 62000c
            l8ui         a14, a12, 4 /* [arg0+0x4] */          #  359: e20c04
            slli         a6, a6, 16                            #  35c: 006611
            mul16s       a8, a8, a14                           #  35f: e088d1
            add          a8, a8, a5                            #  362: 5a88
            bgeui        a3, 16, .Lbr032                       #  364: f6b301
            mov          a2, a7                                #  367: 2d07
.Lbr032:    or           a10, a2, a6                           #  369: 60a220
            extui        a9, a3, 0, 4                          #  36c: 309034
            slli         a9, a9, 12                            #  36f: 409911
            or           a9, a11, a9                           #  372: 909b20
            or           a9, a9, a10                           #  375: a09920
            memw                                               #  378: c02000
            s32i         a9, a8, 0x3c8                         #  37b: 9268f2
            l8ui         a3, a0, 8                             #  37e: 320008
            bltui        a3, 16, .Lbr034                       #  381: b6b33a
            movi         a2, 135 /* 0x00000087 */              #  384: 22a087
            movi         a13, 8 /* 0x00000008 */               #  387: 0c8d
            l8ui         a11, a12, 4 /* [arg0+0x4] */          #  389: b20c04
            movi         a10, -24 /* 0xffffffe8 */             #  38c: 6c8a
            l32i         a14, a0, 0                            #  38e: e800
            addi         a0, a3, -16                           #  390: 02c3f0
            extui        a14, a14, 28, 1                       #  393: e0ec05
            mul16s       a10, a10, a11                         #  396: b0aad1
            movnez       a7, a13, a14                          #  399: e07d93
            mov          a6, a7                                #  39c: 6d07
            add          a5, a10, a5                           #  39e: 5a5a
            bgei         a0, 8, .Lbr033                        #  3a0: e68001
            movi         a2, 7 /* 0x00000007 */                #  3a3: 0c72
.Lbr033:    extui        a3, a0, 0, 3                          #  3a5: 003024
            l32i         a7, sp, 12 /* [(local3)] */           #  3a8: 7831
            or           a4, a2, a6                            #  3aa: 604220
            slli         a4, a4, 24                            #  3ad: 804401
            slli         a7, a7, 8                             #  3b0: 807711
            or           a3, a3, a7                            #  3b3: 703320
            or           a3, a3, a4                            #  3b6: 403320
            memw                                               #  3b9: c02000
            s32i         a3, a5, 0x3cc                         #  3bc: 3265f3
.Lbr034:    l32i         a12, sp, 24 /* [(local6)] */          #  3bf: c861
            l32i         a13, sp, 28 /* [(local7)] */          #  3c1: d871
            l32i         a14, sp, 32 /* [(local8)] */          #  3c3: e881
            l32i         a0, sp, 20 /* [(local5)] */           #  3c5: 0851
            addi         sp, sp, 48 /* (top of frame) */       #  3c7: 12c130
            ret                                                #  3ca: 0df0
.Lbr035:    extui        a9, a2, 20, 1                         #  3cc: 209405
            beqz         a9, .Lbr018                           #  3cf: 1699e7
            movi         a5, 3 /* 0x00000003 */                #  3d2: 0c35
            j            .Lbr019                               #  3d4: 869fff
.Lbr036:    movi         a3, 0 /* 0x00000000 */                #  3d7: 0c03
            j            .Lbr023                               #  3d9: 06adff
.Lbr037:    bbci         a2, 9, .Lbr038                        #  3dc: 976201
            bnez         a8, .Lbr039                           #  3df: cc38
.Lbr038:    movi         a13, 0 /* 0x00000000 */               #  3e1: 0c0d
            j            .Lbr040                               #  3e3: 860000
.Lbr039:    movi         a13, 0x10000000                       #  3e6: d14cff
.Lbr040:    beqz         a3, .Lbr043                           #  3e9: 9cb3
            beqz         a8, .Lbr043                           #  3eb: 9c98
            movi         a8, 0x08000000                        #  3ed: 814bff
.Lbr041:    bgei         a14, 1, .Lbr042                       #  3f0: e61e0f
            l32i         a14, sp, 4 /* [(local1)] */           #  3f3: e811
            extui        a14, a14, 0, 8                        #  3f5: e0e074
            bnez         a14, .Lbr042                          #  3f8: cc7e
            l8ui         a2, a0, 8                             #  3fa: 220008
            bgeui        a2, 16, .Lbr042                       #  3fd: f6b202
            j            .Lbr030                               #  400: c6c7ff
.Lbr042:    movi         a3, 0 /* 0x00000000 */                #  403: 0c03
            j            .Lbr031                               #  405: 46c7ff
.Lbr043:    movi         a8, 0 /* 0x00000000 */                #  408: 0c08
            j            .Lbr041                               #  40a: 86f8ff
.Lbr044:    l16ui        a4, a12, 24 /* [arg0+0x18] */         #  40d: 421c0c
            beqz         a4, .Lbr052                           #  410: 164407
            s16i         a3, a6, 2                             #  413: 325601
            l32i         a0, a14, 32                           #  416: 088e
            mov          a2, a3                                #  418: 2d03
            l32i         a9, a0, 0                             #  41a: 9800
            s32i         a3, sp, 0 /* a3 -> [(local0)] */      #  41c: 3901
            bbsi         a9, 16, .Lbr046                       #  41e: 07f92a
            bbsi         a9, 7, .Lbr046                        #  421: 77e927
            s32i         a7, sp, 40 /* 0x00000000 -> [(local10)] */ #  424: 79a1
            s32i         a6, sp, 44 /* a6 -> [(local11)] */    #  426: 69b1
            bbci         a9, 28, .Lbr045                       #  428: c77906
            s32i         a7, sp, 40 /* 0x00000000 -> [(local10)] */ #  42b: 79a1
            s32i         a6, sp, 44 /* a6 -> [(local11)] */    #  42d: 69b1
            bbci         a9, 25, .Lbr046                       #  42f: 977919
.Lbr045:    l32i         a3, sp, 0 /* [(local0)] */            #  432: 3801
            l8ui         a2, a0, 0                             #  434: 220000
            l16ui        a4, a12, 24 /* [arg0+0x18] */         #  437: 421c0c
            extui        a2, a2, 2, 4                          #  43a: 202234
            call0        sdk_ppCalTxop                         #  43d: 013affc0
                                                               #  441: 0000
            l32i         a7, sp, 40 /* [(local10)] */          #  443: 78a1
            l32i         a6, sp, 44 /* [(local11)] */          #  445: 68b1
            l32i         a0, a14, 32                           #  447: 088e
            s16i         a2, a6, 2 /* a2 -> [[(local11)]+0x2] */ #  449: 225601
.Lbr046:    l32i         a4, sp, 0 /* [(local0)] */            #  44c: 4801
            extui        a4, a4, 0, 16                         #  44e: 4040f4
            bgeu         a4, a2, .Lbr047                       #  451: 27b40f
            s16i         a2, a12, 20 /* a2 -> [arg0+0x14] */   #  454: 225c0a
            l32i         a5, sp, 16 /* [(local4)] */           #  457: 5841
            s16i         a7, a12, 22 /* a7 -> [arg0+0x16] */   #  459: 725c0b
            s8i          a5, a12, 12 /* [(local4)] -> [arg0+0xc] */ #  45c: 524c0c
            movi         a5, 1 /* 0x00000001 */                #  45f: 0c15
            j            .Lbr048                               #  461: 060100
.Lbr047:    s16i         a7, a12, 20 /* a7 -> [arg0+0x14] */   #  464: 725c0a
            movi         a5, 0 /* 0x00000000 */                #  467: 0c05
.Lbr048:    l32i         a2, a0, 0                             #  469: 2800
            srli         a2, a2, 6                             #  46b: 202641
            j            .Lbr051                               #  46e: 460400
.Lbr049:    l8ui         a4, a0, 8                             #  471: 420008
            bltui        a4, 16, .Lbr050                       #  474: b6b409
            l32i         a0, a14, 32                           #  477: 088e
            l32i         a2, a0, 0                             #  479: 2800
            s16i         a3, a6, 2                             #  47b: 325601
            srli         a2, a2, 6                             #  47e: 202641
.Lbr050:    movi         a5, 0 /* 0x00000000 */                #  481: 0c05
.Lbr051:    movi         a8, 1 /* 0x00000001 */                #  483: 0c18
            j            .Lbr015                               #  485: c65fff
.Lbr052:    beqz         a10, .Lbr049                          #  488: 165afe
            s32i         a3, sp, 8 /* a3 -> [(local2)] */      #  48b: 3921
            s32i         a7, sp, 40 /* 0x00000000 -> [(local10)] */ #  48d: 79a1
            s32i         a6, sp, 44 /* a6 -> [(local11)] */    #  48f: 69b1
            bbsi         a2, 6, .Lbr049                        #  491: 67e2dc
            l8ui         a2, a0, 0                             #  494: 220000
            extui        a2, a2, 2, 4                          #  497: 202234
            call0        sdk_ppGetTxQFirstAvail_Locked         #  49a: 0124ffc0
                                                               #  49e: 0000
            l32i         a6, sp, 44 /* [(local11)] */          #  4a0: 68b1
            l32i         a3, sp, 8 /* [(local2)] */            #  4a2: 3821
            s32i         a3, sp, 0 /* [(local2)] -> [(local0)] */ #  4a4: 3901
            s16i         a3, a6, 2 /* [(local2)] -> [[(local11)]+0x2] */ #  4a6: 325601
            bnez         a2, .Lbr053                           #  4a9: cc32
            movi         a5, 0 /* 0x00000000 */                #  4ab: 0c05
            j            .Lbr054                               #  4ad: c60200
.Lbr053:    l32i         a4, a2, 32                            #  4b0: 4882
            l16ui        a4, a4, 10                            #  4b2: 421405
            movi         a5, 1 /* 0x00000001 */                #  4b5: 0c15
            add          a4, a4, a3                            #  4b7: 3a44
            s16i         a4, a6, 2 /* a4 -> [[(local11)]+0x2] */ #  4b9: 425601
.Lbr054:    l32i         a7, sp, 40 /* [(local10)] */          #  4bc: 78a1
            l32i         a0, a14, 32                           #  4be: 088e
            j            .Lbr048                               #  4c0: 46e9ff

            .literal_position                                  #  4c4: 00000000
                                                               #  4c8: 00feef3f
                                                               #  4cc: 00000000
                                                               #  4d0: 30000000
                                                               #  4d4: 00000000
                                                               #  4d8: 00000000

# Function @ .text+0x4dc
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
            .global      sdk_lmacSetAcParam
            .type        sdk_lmacSetAcParam, @function
sdk_lmacSetAcParam:
            addi         sp, sp, -32 /* (local0) */            #  4dc: 12c1e0
            s32i         a2, sp, 16 /* arg0 -> [(local4)] */   #  4df: 2941
            s32i         a3, sp, 20 /* arg1 -> [(local5)] */   #  4e1: 3951
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  4e3: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  4e5: d921
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  4e7: 0901
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  4e9: e931
            movi         a0, -32 /* 0xffffffe0 */              #  4eb: 6c00
            movi         a14, 0x3feffe00                       #  4ed: e1f6ff
            mov          a13, a4 /* arg2 */                    #  4f0: dd04
            mov          a12, a5 /* arg3 */                    #  4f2: cd05
            movi         a5, sdk_NMIIrqIsOn                    #  4f4: 51f4ff
            mov          a4, a6 /* arg4 */                     #  4f7: 4d06
            l8ui         a5, a5, 0 /* [sdk_NMIIrqIsOn] */      #  4f9: 520500
            s32i         a4, sp, 24 /* arg4 -> [(local6)] */   #  4fc: 4961
            bnez         a5, .Lbr056                           #  4fe: eca5
            call0        vPortEnterCritical                    #  500: 01f5ffc0
                                                               #  504: 0000
            movi         a0, -32 /* 0xffffffe0 */              #  506: 6c00
.Lbr055:    memw                                               #  508: c02000
            l32i         a8, a14, 0x200 /* [0x3ff00000] */     #  50b: 822e80
            and          a8, a8, a0                            #  50e: 008810
            memw                                               #  511: c02000
            s32i         a8, a14, 0x200 /* a8 -> [0x3ff00000] */ #  514: 826e80
            memw                                               #  517: c02000
            l32i         a7, a14, 0x200 /* [0x3ff00000] */     #  51a: 722e80
            bbsi         a7, 0, .Lbr055                        #  51d: 07e7e7
            l32i         a4, sp, 24 /* [(local6)] */           #  520: 4861
            l32i         a3, sp, 20 /* [(local5)] */           #  522: 3851
            movi         a5, sdk_NMIIrqIsOn                    #  524: 51eaff
            l32i         a2, sp, 16 /* [(local4)] */           #  527: 2841
            l8ui         a5, a5, 0 /* [sdk_NMIIrqIsOn] */      #  529: 520500
.Lbr056:    movi         a6, .Label001                         #  52c: 61e9ff
            addx8        a2, a2, a2                            #  52f: 2022b0
            addx4        a2, a2, a6                            #  532: 6022a0
            s8i          a13, a2, 7                            #  535: d24207
            s8i          a3, a2, 5                             #  538: 324205
            l8ui         a3, a2, 6                             #  53b: 320206
            s8i          a12, a2, 8                            #  53e: c24208
            bltu         a12, a3, .Lbr057                      #  541: 373c04
            bgeu         a3, a13, .Lbr058                      #  544: d7b304
            mov          a12, a13 /* arg2 */                   #  547: cd0d
.Lbr057:    s8i          a12, a2, 6                            #  549: c24206
.Lbr058:    s16i         a4, a2, 24                            #  54c: 42520c
            bnez         a5, .Lbr059                           #  54f: dc85
            memw                                               #  551: c02000
            l32i         a7, a14, 0x200 /* [0x3ff00000] */     #  554: 722e80
            movi         a8, 1 /* 0x00000001 */                #  557: 0c18
            and          a7, a7, a0                            #  559: 007710
            or           a7, a7, a8                            #  55c: 807720
            memw                                               #  55f: c02000
            s32i         a7, a14, 0x200 /* a7 -> [0x3ff00000] */ #  562: 726e80
            call0        vPortExitCritical                     #  565: 01dcffc0
                                                               #  569: 0000
.Lbr059:    l32i         a12, sp, 4 /* [(local1)] */           #  56b: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  56d: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  56f: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  571: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  573: 12c120
            ret                                                #  576: 0df0

            .literal_position                                  #  578: 00000000
                                                               #  57c: 00000000
                                                               #  580: 08000000
                                                               #  584: 00000000
                                                               #  588: 08000000
                                                               #  58c: 00000000
                                                               #  590: 00000000
                                                               #  594: 08000000
                                                               #  598: 00000000
                                                               #  59c: 00000000
                                                               #  5a0: 00000000
                                                               #  5a4: 78060000

# Function @ .text+0x5a8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_lmacProcessTXStartData
            .type        sdk_lmacProcessTXStartData, @function
sdk_lmacProcessTXStartData:
            addi         a3, a2, -10 /* arg0-0xa */            #  5a8: 32c2f6
            addi         sp, sp, -16 /* (local0) */            #  5ab: 12c1f0
            movi         a4, .Ldata001                         #  5ae: 41f2ff
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  5b1: 0911
            l8ui         a0, a4, 0 /* [.Ldata001] */           #  5b3: 020400
            mov          a5, a2 /* arg0 */                     #  5b6: 5d02
            moveqz       a5, a0, a3                            #  5b8: 305083
            extui        a0, a5, 0, 8                          #  5bb: 500074
            bltui        a0, 8, .Lbr061                        #  5be: b68011
            movi         a2, .Lstr001                          #  5c1: 21eeff
            movi         a3, .Lstr002                          #  5c4: 31efff
            movi         a4, 568 /* 0x00000238 */              #  5c7: 42a238
            call0        printf                                #  5ca: 01f3ffc0
                                                               #  5ce: 0000
.Lbr060:    j            .Lbr060 /* (halt) */                  #  5d0: 06ffff
.Lbr061:    addi         a3, a4, 48 /* .Label001 */            #  5d3: 32c430
            addx8        a0, a0, a0                            #  5d6: 0000b0
            addx4        a0, a0, a3                            #  5d9: 3000a0
            l8ui         a6, a0, 17                            #  5dc: 620011
            beqi         a6, 1, .Lbr063                        #  5df: 261611
            movi         a2, .Lstr001                          #  5e2: 21e8ff
            movi         a3, .Lstr002                          #  5e5: 31e8ff
            movi         a4, 576 /* 0x00000240 */              #  5e8: 42a240
            call0        printf                                #  5eb: 01ecffc0
                                                               #  5ef: 0000
.Lbr062:    j            .Lbr062 /* (halt) */                  #  5f1: 06ffff
.Lbr063:    s8i          a5, a4, 0 /* a5 -> [.Ldata001] */     #  5f4: 524400
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  5f7: 0901
            bnei         a2, 10, .Lbr064                       #  5f9: 669212
            mov          a2, a0                                #  5fc: 2d00
            mov          a3, a4 /* .Ldata001 */                #  5fe: 3d04
            l8ui         a3, a3, 44 /* [.Ldata012] */          #  600: 32032c
            call0        .Lfunc002                             #  603: c5a9ff
            l32i         a0, sp, 0 /* [(local0)] */            #  606: 0801
            movi         a5, .Ldata001                         #  608: 51e1ff
            movi         a4, 0 /* 0x00000000 */                #  60b: 0c04
            s32i         a4, a5, 36 /* 0x00000000 -> [.Ldata010] */ #  60d: 4995
.Lbr064:    l32i         a6, a0, 0                             #  60f: 6800
            bnez         a6, .Lbr066                           #  611: dc06
            movi         a2, .Lstr001                          #  613: 21dfff
            movi         a3, .Lstr002                          #  616: 31dfff
            movi         a4, 584 /* 0x00000248 */              #  619: 42a248
            call0        printf                                #  61c: 01e1ffc0
                                                               #  620: 0000
.Lbr065:    j            .Lbr065 /* (halt) */                  #  622: 06ffff
.Lbr066:    mov          a2, a0                                #  625: 2d00
            movi         a7, 2 /* 0x00000002 */                #  627: 0c27
            s8i          a7, a0, 17                            #  629: 724011
            call0        .Lfunc005                             #  62c: 01deffc0
                                                               #  630: 0000
            call0        sdk_lmacProcessCollisions             #  632: 050000
            l32i         a0, sp, 4 /* [(local1)] */            #  635: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  637: 12c110
            ret                                                #  63a: 0df0

            .literal_position                                  #  63c: 00000000
                                                               #  640: 08000000
                                                               #  644: 00000000
                                                               #  648: 00000000
                                                               #  64c: 08000000
                                                               #  650: 00000000
                                                               #  654: 08000000
                                                               #  658: 00000000
                                                               #  65c: 00000000
                                                               #  660: 00000000
                                                               #  664: 00000000
                                                               #  668: 00000000
                                                               #  66c: 00000000
                                                               #  670: 00000000
                                                               #  674: 00000000

# Function @ .text+0x678
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc005:  addi         sp, sp, -16 /* (local0) */            #  678: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  67b: c921
            mov          a12, a2 /* arg0 */                    #  67d: cd02
            l32i         a2, a2, 0 /* [arg0] */                #  67f: 2802
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  681: 0911
            bnez         a2, .Lbr068                           #  683: dc02
            movi         a2, .Lstr001                          #  685: 21edff
            movi         a3, .Lstr002                          #  688: 31eeff
            movi         a4, 607 /* 0x0000025f */              #  68b: 42a25f
            call0        printf                                #  68e: 01f4ffc0
                                                               #  692: 0000
.Lbr067:    j            .Lbr067 /* (halt) */                  #  694: 06ffff
.Lbr068:    movi         a4, .Ldata001                         #  697: 41ebff
            l32i         a0, a4, 40 /* [.Ldata011] */          #  69a: 08a4
            l32i         a3, a4, 36 /* [.Ldata010] */          #  69c: 3894
            beqz         a0, .Lbr070                           #  69e: 9c00
            movi         a2, .Lstr001                          #  6a0: 21eaff
            movi         a3, .Lstr002                          #  6a3: 31eaff
            movi         a4, 608 /* 0x00000260 */              #  6a6: 42a260
            call0        printf                                #  6a9: 01eeffc0
                                                               #  6ad: 0000
.Lbr069:    j            .Lbr069 /* (halt) */                  #  6af: 06ffff
.Lbr070:    beqz         a3, .Lbr072                           #  6b2: 9c03
            movi         a2, .Lstr001                          #  6b4: 21e7ff
            movi         a3, .Lstr002                          #  6b7: 31e7ff
            movi         a4, 609 /* 0x00000261 */              #  6ba: 42a261
            call0        printf                                #  6bd: 01eaffc0
                                                               #  6c1: 0000
.Lbr071:    j            .Lbr071 /* (halt) */                  #  6c3: 06ffff
.Lbr072:    s32i         a2, a4, 40 /* [arg0] -> [.Ldata011] */ #  6c6: 29a4
            l32i         a0, a2, 32 /* [[arg0]+0x20] */        #  6c8: 0882
            movi         a6, 0 /* 0x00000000 */                #  6ca: 0c06
            l32i         a5, a0, 0 /* [[[arg0]+0x20]] */       #  6cc: 5800
            s32i         a6, a12, 0 /* 0x00000000 -> [arg0] */ #  6ce: 690c
            bbsi         a5, 28, .Lbr077                       #  6d0: c7f567
            s32i         a2, sp, 0 /* [arg0] -> [(local0)] */  #  6d3: 2901
            l8ui         a7, a12, 11 /* [arg0+0xb] */          #  6d5: 720c0b
            l16ui        a10, a12, 24 /* [arg0+0x18] */        #  6d8: a21c0c
            bnez         a7, .Lbr073                           #  6db: cc97
            l16si        a8, a12, 20 /* [arg0+0x14] */         #  6dd: 829c0a
            blti         a8, 1, .Lbr073                        #  6e0: a61804
            movi         a9, 1 /* 0x00000001 */                #  6e3: 0c19
            s8i          a9, a12, 13 /* 0x01 -> [arg0+0xd] */  #  6e5: 924c0d
.Lbr073:    beqz         a10, .Lbr078                          #  6e8: 168a05
            l8ui         a11, a12, 11 /* [arg0+0xb] */         #  6eb: b20c0b
            l8ui         a2, a12, 12 /* [arg0+0xc] */          #  6ee: 220c0c
            beqz         a11, .Lbr074                          #  6f1: 8c0b
            bnez         a2, .Lbr075                           #  6f3: cc42
.Lbr074:    l8ui         a3, a12, 13 /* [arg0+0xd] */          #  6f5: 320c0d
            beqz         a3, .Lbr078                           #  6f8: 168304
.Lbr075:    l8ui         a2, a0, 0 /* [[[arg0]+0x20]] */       #  6fb: 220000
            extui        a2, a2, 2, 4                          #  6fe: 202234
            call0        sdk_ppFetchTxQFirstAvail              #  701: 01daffc0
                                                               #  705: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  707: 0801
            l32i         a0, a0, 32 /* [[(local0)]+0x20] */    #  709: 0880
            beqz         a2, .Lbr078                           #  70b: bc52
            l32i         a4, a0, 0 /* [[[(local0)]+0x20]] */   #  70d: 4800
            srli         a5, a4, 6                             #  70f: 405641
            bbsi         a4, 16, .Lbr076                       #  712: 07f419
            bbsi         a4, 7, .Lbr076                        #  715: 77e416
            movi         a3, .Ldata001                         #  718: 31d0ff
            s32i         a2, a3, 36 /* a2 -> [.Ldata010] */    #  71b: 2993
            mov          a2, a12 /* arg0 */                    #  71d: 2d0c
            movi         a3, 1 /* 0x00000001 */                #  71f: 0c13
            call0        .Lfunc003                             #  721: 859bff
            mov          a2, a12 /* arg0 */                    #  724: 2d0c
            movi         a3, 212 /* 0x000000d4 */              #  726: 32a0d4
            call0        .Lfunc001                             #  729: c591ff
            j            .Lbr077                               #  72c: c60200
.Lbr076:    bbci         a5, 5, .Lbr079                        #  72f: 57653f
            l8ui         a4, a0, 4 /* [[[(local0)]+0x20]+0x4] */ #  732: 420004
            srli         a4, a4, 4                             #  735: 404441
            bgei         a4, 2, .Lbr079                        #  738: e62436
.Lbr077:    l32i         a12, sp, 8 /* [(local2)] */           #  73b: c821
            l32i         a0, sp, 4 /* [(local1)] */            #  73d: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  73f: 12c110
            ret                                                #  742: 0df0
.Lbr078:    l32i         a4, a0, 0                             #  744: 4800
            bbci         a4, 13, .Lbr077                       #  746: d764f1
            bbsi         a4, 12, .Lbr077                       #  749: c7e4ee
            l8ui         a2, a0, 0                             #  74c: 220000
            extui        a2, a2, 2, 4                          #  74f: 202234
            call0        sdk_ppFetchTxQFirstAvail              #  752: 01c7ffc0
                                                               #  756: 0000
            beqz         a2, .Lbr077                           #  758: 16f2fd
            movi         a3, .Ldata001                         #  75b: 31c0ff
            s32i         a2, a3, 36 /* a2 -> [.Ldata010] */    #  75e: 2993
            mov          a2, a12 /* arg0 */                    #  760: 2d0c
            movi         a3, 1 /* 0x00000001 */                #  762: 0c13
            call0        .Lfunc003                             #  764: 4597ff
            mov          a2, a12 /* arg0 */                    #  767: 2d0c
            movi         a3, 212 /* 0x000000d4 */              #  769: 32a0d4
            call0        .Lfunc001                             #  76c: 858dff
            j            .Lbr077                               #  76f: 06f2ff
.Lbr079:    s32i         a2, a12, 0 /* a2 -> [arg0] */         #  772: 290c
            movi         a3, 0 /* 0x00000000 */                #  774: 0c03
            mov          a2, a12 /* arg0 */                    #  776: 2d0c
            call0        .Lfunc003                             #  778: 0596ff
            l8ui         a2, a12, 4 /* [arg0+0x4] */           #  77b: 220c04
            movi         a3, 0 /* 0x00000000 */                #  77e: 0c03
            movi         a4, 0 /* 0x00000000 */                #  780: 0c04
            call0        sdk_wDev_EnableTransmit               #  782: 01bcffc0
                                                               #  786: 0000
            j            .Lbr077                               #  788: c6ebff

            .literal_position                                  #  78c: 00000000
                                                               #  790: 08000000
                                                               #  794: 00000000
                                                               #  798: 00000000
                                                               #  79c: 08000000
                                                               #  7a0: 00000000
                                                               #  7a4: 08000000
                                                               #  7a8: 00000000
                                                               #  7ac: 00000000
                                                               #  7b0: 00000000
                                                               #  7b4: 4c0b0000

# Function @ .text+0x7b8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_lmacProcessTxSuccess
            .type        sdk_lmacProcessTxSuccess, @function
sdk_lmacProcessTxSuccess:
            addi         sp, sp, -16 /* (local0) */            #  7b8: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  7bb: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  7bd: 0901
            mov          a12, a3 /* arg1 */                    #  7bf: cd03
            call0        sdk_lmacIsActive                      #  7c1: 050000
            bnez         a2, .Lbr081                           #  7c4: dc02
            movi         a2, .Lstr001                          #  7c6: 21f1ff
            movi         a3, .Lstr002                          #  7c9: 31f1ff
            movi         a4, 668 /* 0x0000029c */              #  7cc: 42a29c
            call0        printf                                #  7cf: 01f6ffc0
                                                               #  7d3: 0000
.Lbr080:    j            .Lbr080 /* (halt) */                  #  7d5: 06ffff
.Lbr081:    movi         a2, .Ldata001                         #  7d8: 21efff
            l32i         a0, a2, 40 /* [.Ldata011] */          #  7db: 08a2
            l8ui         a4, a2, 0 /* [.Ldata001] */           #  7dd: 420200
            bnez         a0, .Lbr083                           #  7e0: dc00
            movi         a2, .Lstr001                          #  7e2: 21edff
            movi         a3, .Lstr002                          #  7e5: 31edff
            movi         a4, 671 /* 0x0000029f */              #  7e8: 42a29f
            call0        printf                                #  7eb: 01f0ffc0
                                                               #  7ef: 0000
.Lbr082:    j            .Lbr082 /* (halt) */                  #  7f1: 06ffff
.Lbr083:    l8ui         a5, a2, 0 /* [.Ldata001] */           #  7f4: 520200
            addi         a3, a2, 48 /* .Label001 */            #  7f7: 32c230
            addx8        a2, a4, a5                            #  7fa: 5024b0
            addx4        a2, a2, a3                            #  7fd: 3022a0
            l8ui         a3, a2, 17                            #  800: 320211
            beqi         a3, 2, .Lbr085                        #  803: 262311
            movi         a2, .Lstr001                          #  806: 21e6ff
            movi         a3, .Lstr002                          #  809: 31e6ff
            movi         a4, 672 /* 0x000002a0 */              #  80c: 42a2a0
            call0        printf                                #  80f: 01e8ffc0
                                                               #  813: 0000
.Lbr084:    j            .Lbr084 /* (halt) */                  #  815: 06ffff
.Lbr085:    l32i         a0, a0, 32 /* [[.Ldata011]+0x20] */   #  818: 0880
            movi         a6, 0 /* 0x00000000 */                #  81a: 0c06
            l32i         a3, a0, 0 /* [[[.Ldata011]+0x20]] */  #  81c: 3800
            movi         a8, 1026 /* 0x00000402 */             #  81e: 82a402
            srli         a7, a3, 6                             #  821: 307641
            bany         a7, a8, .Lbr086                       #  824: 878705
            bbci         a3, 28, .Lbr090                       #  827: c77351
            bbsi         a3, 25, .Lbr090                       #  82a: 97f34e
.Lbr086:    s8i          a6, a2, 9                             #  82d: 624209
            s8i          a6, a2, 10                            #  830: 62420a
            movi         a12, 127 /* 0x0000007f */             #  833: c2a07f
            l8ui         a9, a2, 7                             #  836: 920207
            s8i          a9, a2, 6                             #  839: 924206
.Lbr087:    l32i         a10, a0, 0 /* [[[.Ldata011]+0x20]] */ #  83c: a800
            s8i          a12, a0, 9 /* a12 -> [[[.Ldata011]+0x20]+0x9] */ #  83e: c24009
            bbci         a10, 11, .Lbr089                      #  841: b76a2a
            l8ui         a5, a0, 4 /* [[[.Ldata011]+0x20]+0x4] */ #  844: 520004
            srli         a3, a5, 4                             #  847: 503441
            bgei         a3, 2, .Lbr089                        #  84a: e62321
            addi         a12, a3, 1                            #  84d: 1bc3
            extui        a11, a5, 0, 4                         #  84f: 50b034
            movi         a3, 1 /* 0x00000001 */                #  852: 0c13
            extui        a12, a12, 0, 4                        #  854: c0c034
            slli         a12, a12, 4                           #  857: c0cc11
            or           a11, a11, a12                         #  85a: c0bb20
            s8i          a11, a0, 4 /* a11 -> [[[.Ldata011]+0x20]+0x4] */ #  85d: b24004
            call0        .Lfunc012                             #  860: 01d5ffc0
                                                               #  864: 0000
.Lbr088:    l32i         a12, sp, 4 /* [(local1)] */           #  866: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  868: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  86a: 12c110
            ret                                                #  86d: 0df0
.Lbr089:    movi         a3, 0 /* 0x00000000 */                #  86f: 0c03
            movi         a0, 5 /* 0x00000005 */                #  871: 0c50
            s8i          a0, a2, 17                            #  873: 024211
            call0        .Lfunc012                             #  876: 452d00
            j            .Lbr088                               #  879: 46faff
.Lbr090:    l8ui         a3, a2, 7                             #  87c: 320207
            bbsi         a7, 8, .Lbr091                        #  87f: 87e708
            s8i          a3, a2, 6                             #  882: 324206
            s8i          a6, a2, 9                             #  885: 624209
            j            .Lbr087                               #  888: 06ecff
.Lbr091:    s8i          a3, a2, 6                             #  88b: 324206
            s8i          a6, a2, 9                             #  88e: 624209
            s8i          a6, a2, 10                            #  891: 62420a
            j            .Lbr087                               #  894: 06e9ff

            .literal_position                                  #  898: 00000000

# Function @ .text+0x89c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
.Lfunc006:  addi         sp, sp, -32 /* (local0) */            #  89c: 12c1e0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  89f: 0901
            s32i         a5, sp, 20 /* arg3 -> [(local5)] */   #  8a1: 5951
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  8a3: f941
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  8a5: e931
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  8a7: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  8a9: d921
            mov          a12, a3 /* arg1 */                    #  8ab: cd03
            mov          a13, a4 /* arg2 */                    #  8ad: dd04
            mov          a14, a2 /* arg0 */                    #  8af: ed02
            mov          a15, a5 /* arg3 */                    #  8b1: fd05
.Lbr092:    l32i         a3, a14, 32 /* [arg0+0x20] */         #  8b3: 388e
            l32i         a2, a12, 32                           #  8b5: 288c
            addi         a3, a3, 1 /* [arg0+0x20]+0x1 */       #  8b7: 1b33
            s32i         a3, a14, 32 /* [arg0+0x20]+0x1 -> [arg0+0x20] */ #  8b9: 398e
            l32i         a0, a2, 0                             #  8bb: 0802
            s8i          a13, a2, 15                           #  8bd: d2420f
            bbci         a0, 13, .Lbr093                       #  8c0: d7600c
            bbsi         a0, 12, .Lbr093                       #  8c3: c7e009
            mov          a2, a12                               #  8c6: 2d0c
            movi         a3, 0 /* 0x00000000 */                #  8c8: 0c03
            call0        .Lfunc017                             #  8ca: 45f300
            j            .Lbr094                               #  8cd: 860100
.Lbr093:    mov          a3, a15 /* arg3 */                    #  8d0: 3d0f
            mov          a2, a12                               #  8d2: 2d0c
            call0        .Lfunc017                             #  8d4: 85f200
.Lbr094:    l32i         a2, a12, 32                           #  8d7: 288c
            l32i         a0, a2, 0                             #  8d9: 0802
            bbci         a0, 13, .Lbr095                       #  8db: d76013
            bbsi         a0, 12, .Lbr095                       #  8de: c7e010
            l8ui         a2, a2, 0                             #  8e1: 220200
            extui        a2, a2, 2, 4                          #  8e4: 202234
            call0        sdk_ppDequeueTxQ                      #  8e7: 01ecffc0
                                                               #  8eb: 0000
            mov          a12, a2                               #  8ed: cd02
            bnez         a2, .Lbr092                           #  8ef: 5602fc
.Lbr095:    l32i         a12, sp, 4 /* [(local1)] */           #  8f2: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  8f4: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  8f6: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  8f8: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  8fa: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  8fc: 12c120
            ret                                                #  8ff: 0df0

            .literal_position                                  #  904: 30000000

# Function @ .text+0x908
            .balign      4
            .global      sdk_GetAccess
            .type        sdk_GetAccess, @function
sdk_GetAccess:
            movi         a3, .Label001                         #  908: 31ffff
            addx8        a2, a2, a2                            #  90b: 2022b0
            addx4        a2, a2, a3                            #  90e: 3022a0
            ret                                                #  911: 0df0

            .balign      4
# Function @ .text+0x914
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_lmacDiscardAgedMSDU
            .type        sdk_lmacDiscardAgedMSDU, @function
sdk_lmacDiscardAgedMSDU:
            mov          a5, a4 /* arg2 */                     #  914: 5d04
            addi         sp, sp, -16 /* (local0) */            #  916: 12c1f0
            movi         a4, 4 /* 0x00000004 */                #  919: 0c44
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  91b: 0901
            call0        .Lfunc006                             #  91d: c5f7ff
            l32i         a0, sp, 0 /* [(local0)] */            #  920: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  922: 12c110
            ret                                                #  925: 0df0

            .balign      4
# Function @ .text+0x928
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_lmacRecycleMPDU
            .type        sdk_lmacRecycleMPDU, @function
sdk_lmacRecycleMPDU:
            mov          a6, a2 /* arg0 */                     #  928: 6d02
            addi         sp, sp, -16 /* (local0) */            #  92a: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  92d: 0901
            mov          a2, a3 /* arg1 */                     #  92f: 2d03
            movi         a0, 1 /* 0x00000001 */                #  931: 0c10
            mov          a3, a4 /* arg2 */                     #  933: 3d04
            l32i         a5, a6, 28 /* [arg0+0x1c] */          #  935: 5876
            l32i         a4, a2, 32 /* [arg1+0x20] */          #  937: 4882
            addi         a5, a5, 1 /* [arg0+0x1c]+0x1 */       #  939: 1b55
            s32i         a5, a6, 28 /* [arg0+0x1c]+0x1 -> [arg0+0x1c] */ #  93b: 5976
            s8i          a0, a4, 15 /* 0x01 -> [[arg1+0x20]+0xf] */ #  93d: 02440f
            call0        .Lfunc017                             #  940: c5eb00
            l32i         a0, sp, 0 /* [(local0)] */            #  943: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  945: 12c110
            ret                                                #  948: 0df0

            .literal_position                                  #  94c: 00000000
                                                               #  950: 08000000
                                                               #  954: 00000000
                                                               #  958: 00000000
                                                               #  95c: 00000000
                                                               #  960: 00000000

# Function @ .text+0x964
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc007:  addi         sp, sp, -16 /* (local0) */            #  964: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  967: 0911
            l8ui         a3, a2, 17 /* [arg0+0x11] */          #  969: 320211
            l32i         a0, a2, 0 /* [arg0] */                #  96c: 0802
            beqi         a3, 6, .Lbr097                        #  96e: 266311
            movi         a2, .Lstr001                          #  971: 21f6ff
            movi         a3, .Lstr002                          #  974: 31f7ff
            movi         a4, 744 /* 0x000002e8 */              #  977: 42a2e8
            call0        printf                                #  97a: 01f7ffc0
                                                               #  97e: 0000
.Lbr096:    j            .Lbr096 /* (halt) */                  #  980: 06ffff
.Lbr097:    movi         a5, 0 /* 0x00000000 */                #  983: 0c05
            s8i          a5, a2, 17 /* 0x00 -> [arg0+0x11] */  #  985: 524211
            l32i         a6, a0, 32 /* [[arg0]+0x20] */        #  988: 6880
            s32i         a0, sp, 0 /* [arg0] -> [(local0)] */  #  98a: 0901
            l32i         a4, a6, 0 /* [[[arg0]+0x20]] */       #  98c: 4806
            s32i         a5, a2, 0 /* 0x00000000 -> [arg0] */  #  98e: 5902
            bbci         a4, 27, .Lbr098                       #  990: b7742b
            l8ui         a2, a6, 0 /* [[[arg0]+0x20]] */       #  993: 220600
            l8ui         a3, a6, 4 /* [[[arg0]+0x20]+0x4] */   #  996: 320604
            extui        a2, a2, 2, 4                          #  999: 202234
            srli         a3, a3, 4                             #  99c: 303441
            addi         a3, a3, 2                             #  99f: 2b33
            extui        a3, a3, 0, 8                          #  9a1: 303074
            call0        sdk_ppRecordBarRRC                    #  9a4: 01eeffc0
                                                               #  9a8: 0000
            l32i         a3, sp, 0 /* [(local0)] */            #  9aa: 3801
            l32i         a3, a3, 32 /* [[(local0)]+0x20] */    #  9ac: 3883
            l8ui         a3, a3, 0 /* [[[(local0)]+0x20]] */   #  9ae: 320300
            movi         a2, 6 /* 0x00000006 */                #  9b1: 0c62
            extui        a3, a3, 2, 4                          #  9b3: 303234
            call0        sdk_pp_post                           #  9b6: 01eaffc0
                                                               #  9ba: 0000
            j            .Lbr100                               #  9bc: 460900
.Lbr098:    l32i         a0, sp, 0 /* [(local0)] */            #  9bf: 0801
            movi         a5, .Ldata001                         #  9c1: 51e4ff
            l8ui         a4, a6, 5 /* [[[arg0]+0x20]+0x5] */   #  9c4: 420605
            l8ui         a5, a5, 13 /* [.Ldata004] */          #  9c7: 52050d
            extui        a4, a4, 0, 6                          #  9ca: 404054
            bltu         a4, a5, .Lbr099                       #  9cd: 57340b
            movi         a4, 2 /* 0x00000002 */                #  9d0: 0c24
            movi         a5, 1 /* 0x00000001 */                #  9d2: 0c15
            mov          a3, a0 /* [(local0)] */               #  9d4: 3d00
            call0        .Lfunc006                             #  9d6: 45ecff
            j            .Lbr100                               #  9d9: 060200
.Lbr099:    movi         a4, 3 /* 0x00000003 */                #  9dc: 0c34
            movi         a5, 1 /* 0x00000001 */                #  9de: 0c15
            mov          a3, a0 /* [(local0)] */               #  9e0: 3d00
            call0        .Lfunc006                             #  9e2: 85ebff
.Lbr100:    l32i         a0, sp, 4 /* [(local1)] */            #  9e5: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  9e7: 12c110
            ret                                                #  9ea: 0df0

# Function @ .text+0x9ec
            .balign      4
.Lfunc008:  l8ui         a4, a2, 13 /* [arg0+0xd] */           #  9ec: 42020d
            movi         a5, 0 /* 0x00000000 */                #  9ef: 0c05
            beqz         a4, .Lbr101                           #  9f1: 8c44
            s8i          a3, a2, 11 /* arg1 -> [arg0+0xb] */   #  9f3: 32420b
            s8i          a5, a2, 13 /* 0x00 -> [arg0+0xd] */   #  9f6: 52420d
.Lbr101:    ret           /* arg0 */                           #  9f9: 0df0

            .literal_position                                  #  9fc: 00000000
                                                               #  a00: b0110000

# Function @ .text+0xa04
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc009:  addi         sp, sp, -16 /* (local0) */            #  a04: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  a07: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  a09: 0901
            l8ui         a0, a2, 11 /* [arg0+0xb] */           #  a0b: 02020b
            mov          a12, a2 /* arg0 */                    #  a0e: cd02
            beqz         a0, .Lbr104                           #  a10: acd0
            l8ui         a2, a2, 12 /* [arg0+0xc] */           #  a12: 22020c
            movi         a0, 0 /* 0x00000000 */                #  a15: 0c00
            beqz         a2, .Lbr102                           #  a17: 9c32
            l32i         a2, a12, 0 /* [arg0] */               #  a19: 280c
            l32i         a2, a2, 32 /* [[arg0]+0x20] */        #  a1b: 2882
            l8ui         a2, a2, 0 /* [[[arg0]+0x20]] */       #  a1d: 220200
            extui        a2, a2, 2, 4                          #  a20: 202234
            call0        sdk_ppFetchTxQFirstAvail              #  a23: 01f6ffc0
                                                               #  a27: 0000
            s32i         a2, a12, 0 /* a2 -> [arg0] */         #  a29: 290c
            j            .Lbr103                               #  a2b: c60000
.Lbr102:    mov          a2, a0 /* 0x00000000 */               #  a2e: 2d00
            s32i         a2, a12, 0 /* 0x00000000 -> [arg0] */ #  a30: 290c
.Lbr103:    beqz         a2, .Lbr106                           #  a32: ac02
            mov          a2, a12 /* arg0 */                    #  a34: 2d0c
            movi         a3, 0 /* 0x00000000 */                #  a36: 0c03
            call0        .Lfunc014                             #  a38: 01f2ffc0
                                                               #  a3c: 0000
            j            .Lbr105                               #  a3e: 860100
.Lbr104:    movi         a3, 0 /* 0x00000000 */                #  a41: 0c03
            call0        .Lfunc008                             #  a43: 85faff
            movi         a2, 0 /* 0x00000000 */                #  a46: 0c02
.Lbr105:    movi         a3, 9 /* 0x00000009 */                #  a48: 0c93
            l32i         a0, sp, 0 /* [(local0)] */            #  a4a: 0801
            s8i          a3, a12, 18 /* 0x09 -> [arg0+0x12] */ #  a4c: 324c12
            l32i         a12, sp, 4 /* [(local1)] */           #  a4f: c811
            addi         sp, sp, 16 /* (top of frame) */       #  a51: 12c110
            ret                                                #  a54: 0df0
.Lbr106:    movi         a2, 0 /* 0x00000000 */                #  a56: 0c02
            movi         a4, 0 /* 0x00000000 */                #  a58: 0c04
            s8i          a4, a12, 11 /* 0x00 -> [arg0+0xb] */  #  a5a: 424c0b
            j            .Lbr105                               #  a5d: c6f9ff

            .literal_position                                  #  a60: 00000000
                                                               #  a64: 00000000

# Function @ .text+0xa68
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc010:  addi         sp, sp, -16 /* (local0) */            #  a68: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  a6b: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  a6d: 0901
            l8ui         a0, a2, 11 /* [arg0+0xb] */           #  a6f: 02020b
            mov          a12, a2 /* arg0 */                    #  a72: cd02
            beqz         a0, .Lbr107                           #  a74: 8c60
            movi         a2, 0 /* 0x00000000 */                #  a76: 0c02
            s8i          a2, a12, 11 /* 0x00 -> [arg0+0xb] */  #  a78: 224c0b
            j            .Lbr108                               #  a7b: 060100
.Lbr107:    movi         a3, 0 /* 0x00000000 */                #  a7e: 0c03
            call0        .Lfunc008                             #  a80: 85f6ff
.Lbr108:    movi         a2, .Ldata001                         #  a83: 21f7ff
            l32i         a2, a2, 36 /* [.Ldata010] */          #  a86: 2892
            call0        sdk_ppRollBackTxQ                     #  a88: 01f7ffc0
                                                               #  a8c: 0000
            movi         a3, 12 /* 0x0000000c */               #  a8e: 0cc3
            l32i         a0, sp, 0 /* [(local0)] */            #  a90: 0801
            s8i          a3, a12, 18 /* 0x0c -> [arg0+0x12] */ #  a92: 324c12
            l32i         a12, sp, 4 /* [(local1)] */           #  a95: c811
            addi         sp, sp, 16 /* (top of frame) */       #  a97: 12c110
            ret                                                #  a9a: 0df0

            .literal_position                                  #  a9c: 00000000

# Function @ .text+0xaa0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc011:  movi         a3, 1 /* 0x00000001 */                #  aa0: 0c13
            addi         sp, sp, -16 /* (local0) */            #  aa2: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  aa5: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  aa7: c911
            movi         a0, .Ldata001                         #  aa9: 01fcff
            mov          a12, a2 /* arg0 */                    #  aac: cd02
            l32i         a0, a0, 36 /* [.Ldata010] */          #  aae: 0890
            s32i         a0, a2, 0 /* [.Ldata010] -> [arg0] */ #  ab0: 0902
            call0        .Lfunc014                             #  ab2: c56f00
            movi         a3, 11 /* 0x0000000b */               #  ab5: 0cb3
            l32i         a0, sp, 0 /* [(local0)] */            #  ab7: 0801
            s8i          a3, a12, 18 /* 0x0b -> [arg0+0x12] */ #  ab9: 324c12
            l32i         a12, sp, 4 /* [(local1)] */           #  abc: c811
            addi         sp, sp, 16 /* (top of frame) */       #  abe: 12c110
            ret                                                #  ac1: 0df0

            .literal_position                                  #  ac4: 00000000
                                                               #  ac8: 00000000
                                                               #  acc: 08000000
                                                               #  ad0: 00000000
                                                               #  ad4: 08000000
                                                               #  ad8: 00000000
                                                               #  adc: 08000000
                                                               #  ae0: 00000000
                                                               #  ae4: 08000000
                                                               #  ae8: 00000000
                                                               #  aec: 08000000
                                                               #  af0: 00000000
                                                               #  af4: 08000000
                                                               #  af8: 00000000
                                                               #  afc: 08000000
                                                               #  b00: 00000000
                                                               #  b04: 00000000
                                                               #  b08: b0110000
                                                               #  b0c: 00000000
                                                               #  b10: 00000000
                                                               #  b14: 00000000
                                                               #  b18: 00000000
                                                               #  b1c: 00000000
                                                               #  b20: 00000000
                                                               #  b24: b0110000
                                                               #  b28: b0110000
                                                               #  b2c: 00000000
                                                               #  b30: 00000000
                                                               #  b34: 00000000
                                                               #  b38: 00000000
                                                               #  b3c: 00000000
                                                               #  b40: 00000000
                                                               #  b44: 00000000
                                                               #  b48: 00000000

# Function @ .text+0xb4c
# Local variables/stack:
#     (local0):  hword     @ -0x2e
#     (local1):  word      @ -0x2c
#     (local2):  word      @ -0x28
#     (local3):  word      @ -0x24
#     (local4):  word      @ -0x20
#     (local5):  word      @ -0x1c
#     (local6):  word      @ -0x18
#     (local7):  word      @ -0x14
#     (local8):  word      @ -0x10
#     (local9):  word[3]   @ -0xc
            .balign      4
.Lfunc012:  movi         a4, 3 /* 0x00000003 */                #  b4c: 0c34
            movi         a5, 148 /* 0x00000094 */              #  b4e: 52a094
            addi         sp, sp, -48 /* (FP)-0x30 */           #  b51: 12c1d0
            s32i         a14, sp, 28 /* a14 -> [(local7)] */   #  b54: e971
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     #  b56: 0941
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   #  b58: c951
            s32i         a15, sp, 32 /* a15 -> [(local8)] */   #  b5a: f981
            s32i         a13, sp, 24 /* a13 -> [(local6)] */   #  b5c: d961
            movi         a15, 0 /* 0x00000000 */               #  b5e: 0c0f
            movi         a13, .Ldata001                        #  b60: d1d9ff
            mov          a12, a2 /* arg0 */                    #  b63: cd02
            l8ui         a0, a12, 17 /* [arg0+0x11] */         #  b65: 020c11
            mov          a2, a3 /* arg1 */                     #  b68: 2d03
            movi         a3, 212 /* 0x000000d4 */              #  b6a: 32a0d4
            bnez         a2, .Lbr111                           #  b6d: ec92
            movi         a14, 1 /* 0x00000001 */               #  b6f: 0c1e
            addi         a2, a0, -6 /* [arg0+0x11]-0x6 */      #  b71: 22c0fa
            bnez         a2, .Lbr118                           #  b74: 562209
            s8i          a15, a12, 17 /* 0x00 -> [arg0+0x11] */ #  b77: f24c11
            l32i         a0, a13, 40 /* [.Ldata011] */         #  b7a: 08ad
            l32i         a2, a12, 0 /* [arg0] */               #  b7c: 280c
            bnez         a0, .Lbr132                           #  b7e: 562018
            beqz         a2, .Lbr109                           #  b81: 8c32
            l32i         a3, a13, 36 /* [.Ldata010] */         #  b83: 389d
            beqz         a3, .Lbr151                           #  b85: 16e332
.Lbr109:    movi         a2, .Lstr001                          #  b88: 21d0ff
            movi         a3, .Lstr002                          #  b8b: 31d0ff
            movi         a4, 845 /* 0x0000034d */              #  b8e: 42a34d
            call0        printf                                #  b91: 01dbffc0
                                                               #  b95: 0000
.Lbr110:    j            .Lbr110 /* (halt) */                  #  b97: 06ffff
.Lbr111:    beqi         a0, 2, .Lbr113                        #  b9a: 262014
            beqi         a0, 1, .Lbr113                        #  b9d: 261011
            movi         a2, .Lstr001                          #  ba0: 21ccff
            movi         a3, .Lstr002                          #  ba3: 31ccff
            movi         a4, 960 /* 0x000003c0 */              #  ba6: 42a3c0
            call0        printf                                #  ba9: 01d6ffc0
                                                               #  bad: 0000
.Lbr112:    j            .Lbr112 /* (halt) */                  #  baf: 06ffff
.Lbr113:    l32i         a0, a13, 40 /* [.Ldata011] */         #  bb2: 08ad
            l32i         a6, a13, 36 /* [.Ldata010] */         #  bb4: 689d
            bnez         a0, .Lbr115                           #  bb6: dc70
            mov          a2, a12 /* arg0 */                    #  bb8: 2d0c
            movi         a3, 0 /* 0x00000000 */                #  bba: 0c03
            movi         a4, 3 /* 0x00000003 */                #  bbc: 0c34
            s8i          a4, a12, 17 /* 0x03 -> [arg0+0x11] */ #  bbe: 424c11
            call0        .Lfunc014                             #  bc1: 01d1ffc0
                                                               #  bc5: 0000
            mov          a14, a2                               #  bc7: ed02
            movi         a0, 5 /* 0x00000005 */                #  bc9: 0c50
.Lbr114:    s8i          a0, a12, 18 /* a0 -> [arg0+0x12] */   #  bcb: 024c12
            j            .Lbr123                               #  bce: 461a00
.Lbr115:    beqz         a6, .Lbr116                           #  bd1: 9ce6
            l32i         a7, a0, 32 /* [[.Ldata011]+0x20] */   #  bd3: 7880
            l32i         a7, a7, 0 /* [[[.Ldata011]+0x20]] */  #  bd5: 7807
            mov          a2, a12 /* arg0 */                    #  bd7: 2d0c
            extui        a7, a7, 25, 1                         #  bd9: 707905
            movnez       a3, a5, a7                            #  bdc: 703593
            call0        .Lfunc002                             #  bdf: 054cff
            l8ui         a8, a12, 14 /* [arg0+0xe] */          #  be2: 820c0e
            l32i         a2, a13, 36 /* [.Ldata010] */         #  be5: 289d
            bnez         a8, .Lbr126                           #  be7: 56e807
            call0        sdk_ppRollBackTxQ                     #  bea: 01c8ffc0
                                                               #  bee: 0000
            j            .Lbr127                               #  bf0: c61e00
.Lbr116:    l32i         a9, a12, 0 /* [arg0] */               #  bf3: 980c
            beqz         a9, .Lbr128                           #  bf5: 160909
            movi         a2, .Lstr001                          #  bf8: 21b8ff
            movi         a3, .Lstr002                          #  bfb: 31b8ff
            movi         a4, 979 /* 0x000003d3 */              #  bfe: 42a3d3
            call0        printf                                #  c01: 01c3ffc0
                                                               #  c05: 0000
.Lbr117:    j            .Lbr117 /* (halt) */                  #  c07: 06ffff
.Lbr118:    bnei         a0, 5, .Lbr120                        #  c0a: 665019
            l32i         a0, a13, 40 /* [.Ldata011] */         #  c0d: 08ad
            s8i          a15, a12, 17 /* 0x00 -> [arg0+0x11] */ #  c0f: f24c11
            bnez         a0, .Lbr131                           #  c12: 56200b
            movi         a2, .Lstr001                          #  c15: 21b2ff
            movi         a3, .Lstr002                          #  c18: 31b3ff
            movi         a4, 894 /* 0x0000037e */              #  c1b: 42a37e
            call0        printf                                #  c1e: 01bdffc0
                                                               #  c22: 0000
.Lbr119:    j            .Lbr119 /* (halt) */                  #  c24: 06ffff
.Lbr120:    movi         a2, .Lstr001                          #  c27: 21b0ff
            movi         a3, .Lstr002                          #  c2a: 31b0ff
            movi         a4, 954 /* 0x000003ba */              #  c2d: 42a3ba
            call0        printf                                #  c30: 01baffc0
                                                               #  c34: 0000
.Lbr121:    j            .Lbr121 /* (halt) */                  #  c36: 06ffff
.Lbr122:    movi         a14, 0 /* 0x00000000 */               #  c39: 0c0e
.Lbr123:    movi         a0, 0 /* 0x00000000 */                #  c3b: 0c00
.Lbr124:    s32i         a15, a13, 40 /* 0x00000000 -> [.Ldata011] */ #  c3d: f9ad
            l8ui         a10, a12, 13 /* [arg0+0xd] */         #  c3f: a20c0d
            l32i         a3, a13, 36 /* [.Ldata010] */         #  c42: 389d
            l8ui         a11, a13, 0 /* [.Ldata001] */         #  c44: b20d00
            movi         a2, 8 /* 0x00000008 */                #  c47: 0c82
            moveqz       a11, a2, a14                          #  c49: e0b283
            moveqz       a3, a15, a0                           #  c4c: 003f83
            s32i         a3, a13, 36 /* a3 -> [.Ldata010] */   #  c4f: 399d
            s8i          a11, a13, 0 /* a11 -> [.Ldata001] */  #  c51: b24d00
            beqz         a10, .Lbr135                          #  c54: 16ba10
            movi         a2, .Lstr001                          #  c57: 21a6ff
            movi         a3, .Lstr002                          #  c5a: 31a6ff
            movi         a4, 1003 /* 0x000003eb */             #  c5d: 42a3eb
            call0        printf                                #  c60: 01afffc0
                                                               #  c64: 0000
.Lbr125:    j            .Lbr125 /* (halt) */                  #  c66: 06ffff
.Lbr126:    call0        sdk_ppDiscardMPDU                     #  c69: 01adffc0
                                                               #  c6d: 0000
.Lbr127:    mov          a2, a12 /* arg0 */                    #  c6f: 2d0c
            movi         a3, 0 /* 0x00000000 */                #  c71: 0c03
            l32i         a4, a13, 40 /* [.Ldata011] */         #  c73: 48ad
            movi         a5, 3 /* 0x00000003 */                #  c75: 0c35
            s8i          a5, a12, 17 /* 0x03 -> [arg0+0x11] */ #  c77: 524c11
            s32i         a4, a12, 0 /* [.Ldata011] -> [arg0] */ #  c7a: 490c
            call0        .Lfunc014                             #  c7c: 01aaffc0
                                                               #  c80: 0000
            mov          a14, a2                               #  c82: ed02
            movi         a0, 6 /* 0x00000006 */                #  c84: 0c60
            j            .Lbr114                               #  c86: 46d0ff
.Lbr128:    l32i         a2, a0, 32 /* [[.Ldata011]+0x20] */   #  c89: 2880
            l32i         a6, a2, 0 /* [[[.Ldata011]+0x20]] */  #  c8b: 6802
            bbci         a6, 28, .Lbr129                       #  c8d: c77619
            l8ui         a2, a2, 4 /* [[[.Ldata011]+0x20]+0x4] */ #  c90: 220204
            srli         a2, a2, 4                             #  c93: 202441
            blti         a2, 1, .Lbr129                        #  c96: a61210
            l16ui        a6, a0, 22 /* [[.Ldata011]+0x16] */   #  c99: 62100b
            l16ui        a5, a0, 20 /* [[.Ldata011]+0x14] */   #  c9c: 52100a
            l16ui        a3, a13, 14 /* [.Ldata005] */         #  c9f: 321d07
            add          a5, a5, a6                            #  ca2: 6a55
            blt          a3, a5, .Lbr122                       #  ca4: 572391
            bgei         a2, 3, .Lbr122                        #  ca7: e6328e
.Lbr129:    s32i         a0, a12, 0 /* [.Ldata011] -> [arg0] */ #  caa: 090c
            l8ui         a7, a12, 11 /* [arg0+0xb] */          #  cac: 720c0b
            s8i          a4, a12, 17 /* 0x03 -> [arg0+0x11] */ #  caf: 424c11
            beqz         a7, .Lbr130                           #  cb2: 8c17
            s8i          a15, a12, 11 /* 0x00 -> [arg0+0xb] */ #  cb4: f24c0b
.Lbr130:    mov          a2, a12 /* arg0 */                    #  cb7: 2d0c
            movi         a3, 0 /* 0x00000000 */                #  cb9: 0c03
            call0        .Lfunc014                             #  cbb: 019bffc0
                                                               #  cbf: 0000
            mov          a14, a2                               #  cc1: ed02
            movi         a0, 7 /* 0x00000007 */                #  cc3: 0c70
            j            .Lbr114                               #  cc5: 86c0ff
.Lbr131:    l32i         a8, a13, 36 /* [.Ldata010] */         #  cc8: 889d
            beqz         a8, .Lbr134                           #  cca: 164805
            l32i         a9, a0, 32 /* [[.Ldata011]+0x20] */   #  ccd: 9880
            l32i         a9, a9, 0 /* [[[.Ldata011]+0x20]] */  #  ccf: 9809
            mov          a2, a12 /* arg0 */                    #  cd1: 2d0c
            extui        a9, a9, 25, 1                         #  cd3: 909905
            movnez       a3, a5, a9                            #  cd6: 903593
            s8i          a3, a13, 44 /* a3 -> [.Ldata012] */   #  cd9: 324d2c
            mov          a3, a14 /* 0x00000001 */              #  cdc: 3d0e
            call0        .Lfunc008                             #  cde: c5d0ff
            l8ui         a2, a12, 4 /* [arg0+0x4] */           #  ce1: 220c04
            l32i         a10, a13, 36 /* [.Ldata010] */        #  ce4: a89d
            s32i         a10, a12, 0 /* [.Ldata010] -> [arg0] */ #  ce6: a90c
            call0        sdk_Tx_Copy2Queue                     #  ce8: 0191ffc0
                                                               #  cec: 0000
            s8i          a14, a12, 17 /* 0x01 -> [arg0+0x11] */ #  cee: e24c11
            s8i          a15, a12, 18 /* 0x00 -> [arg0+0x12] */ #  cf1: f24c12
            mov          a2, a12 /* arg0 */                    #  cf4: 2d0c
            l32i         a3, a13, 40 /* [.Ldata011] */         #  cf6: 38ad
            movi         a4, 0 /* 0x00000000 */                #  cf8: 0c04
            call0        sdk_lmacRecycleMPDU                   #  cfa: 050000
            movi         a0, 1 /* 0x00000001 */                #  cfd: 0c10
            movi         a14, 1 /* 0x00000001 */               #  cff: 0c1e
            j            .Lbr124                               #  d01: 06ceff
.Lbr132:    l32i         a11, a13, 36 /* [.Ldata010] */        #  d04: b89d
            s32i         a0, sp, 12 /* [.Ldata011] -> [(local3)] */ #  d06: 0931
            beqz         a11, .Lbr138                          #  d08: 165b08
            s32i         a0, sp, 36 /* [.Ldata011] -> [(local9)] */ #  d0b: 0991
            beqz         a2, .Lbr150                           #  d0d: 161218
            movi         a2, .Lstr001                          #  d10: 217aff
            movi         a3, .Lstr002                          #  d13: 317aff
            movi         a4, 850 /* 0x00000352 */              #  d16: 42a352
            call0        printf                                #  d19: 0185ffc0
                                                               #  d1d: 0000
.Lbr133:    j            .Lbr133 /* (halt) */                  #  d1f: 06ffff
.Lbr134:    l32i         a2, a12, 0 /* [arg0] */               #  d22: 280c
            bnez         a2, .Lbr136                           #  d24: 56a204
            l32i         a3, a0, 32 /* [[.Ldata011]+0x20] */   #  d27: 3880
            l32i         a3, a3, 0 /* [[[.Ldata011]+0x20]] */  #  d29: 3803
            extui        a3, a3, 25, 1                         #  d2b: 303905
            beqz         a3, .Lbr146                           #  d2e: 162313
            mov          a2, sp /* (FP)-0x30 */                #  d31: 2d01
            addi         a3, sp, 2 /* (local0) */              #  d33: 2b31
            addi         a4, sp, 4 /* (local1) */              #  d35: 4b41
            addi         a5, sp, 8 /* (local2) */              #  d37: 8b51
            call0        sdk_wDev_GetBAInfo                    #  d39: 017effc0
                                                               #  d3d: 0000
            l32i         a5, sp, 8 /* [(local2)] */            #  d3f: 5821
            l32i         a0, a13, 40 /* [.Ldata011] */         #  d41: 08ad
            l32i         a4, sp, 4 /* [(local1)] */            #  d43: 4811
            l32i         a0, a0, 32 /* [[.Ldata011]+0x20] */   #  d45: 0880
            l16ui        a3, sp, 2 /* [(local0)] */            #  d47: 321101
            l8ui         a2, a0, 0 /* [[[.Ldata011]+0x20]] */  #  d4a: 220000
            l32i         a6, a0, 0 /* [[[.Ldata011]+0x20]] */  #  d4d: 6800
            extui        a2, a2, 2, 4                          #  d4f: 202234
            extui        a6, a6, 27, 1                         #  d52: 606b05
            bnez         a6, .Lbr144                           #  d55: 56b60d
            movi         a6, 0 /* 0x00000000 */                #  d58: 0c06
            call0        sdk_ppTxqUpdateBitmap                 #  d5a: 0177ffc0
                                                               #  d5e: 0000
            j            .Lbr145                               #  d60: 463800
.Lbr135:    l32i         a12, sp, 20 /* [(local5)] */          #  d63: c851
            l32i         a13, sp, 24 /* [(local6)] */          #  d65: d861
            l32i         a14, sp, 28 /* [(local7)] */          #  d67: e871
            l32i         a15, sp, 32 /* [(local8)] */          #  d69: f881
            l32i         a0, sp, 16 /* [(local4)] */           #  d6b: 0841
            addi         sp, sp, 48 /* (top of frame) */       #  d6d: 12c130
            ret           /* 0x00000008 */                     #  d70: 0df0
.Lbr136:    mov          a2, a12 /* arg0 */                    #  d72: 2d0c
            mov          a3, a14 /* 0x00000001 */              #  d74: 3d0e
            call0        .Lfunc008                             #  d76: 45c7ff
            s8i          a14, a12, 17 /* 0x01 -> [arg0+0x11] */ #  d79: e24c11
            l32i         a3, a13, 40 /* [.Ldata011] */         #  d7c: 38ad
            movi         a2, 4 /* 0x00000004 */                #  d7e: 0c42
            movi         a4, 0 /* 0x00000000 */                #  d80: 0c04
            s8i          a2, a12, 18 /* 0x04 -> [arg0+0x12] */ #  d82: 224c12
            mov          a2, a12 /* arg0 */                    #  d85: 2d0c
            call0        sdk_lmacRecycleMPDU                   #  d87: 050000
            movi         a14, 1 /* 0x00000001 */               #  d8a: 0c1e
.Lbr137:    movi         a0, 0 /* 0x00000000 */                #  d8c: 0c00
            j            .Lbr124                               #  d8e: c6aaff
.Lbr138:    bnez         a2, .Lbr140                           #  d91: dc72
            mov          a2, a12 /* arg0 */                    #  d93: 2d0c
            mov          a3, a15 /* 0x00000000 */              #  d95: 3d0f
            call0        .Lfunc008                             #  d97: 45c5ff
            l8ui         a3, a12, 11 /* [arg0+0xb] */          #  d9a: 320c0b
            beqz         a3, .Lbr139                           #  d9d: 8c13
            s8i          a15, a12, 11 /* 0x00 -> [arg0+0xb] */ #  d9f: f24c0b
.Lbr139:    movi         a14, 0 /* 0x00000000 */               #  da2: 0c0e
            movi         a4, 10 /* 0x0000000a */               #  da4: 0ca4
            s8i          a4, a12, 18 /* 0x0a -> [arg0+0x12] */ #  da6: 424c12
            j            .Lbr141                               #  da9: 860400
.Lbr140:    mov          a3, a14 /* 0x00000001 */              #  dac: 3d0e
            mov          a2, a12 /* arg0 */                    #  dae: 2d0c
            call0        .Lfunc008                             #  db0: 85c3ff
            movi         a14, 1 /* 0x00000001 */               #  db3: 0c1e
            movi         a5, 13 /* 0x0000000d */               #  db5: 0cd5
            movi         a6, 1 /* 0x00000001 */                #  db7: 0c16
            s8i          a6, a12, 17 /* 0x01 -> [arg0+0x11] */ #  db9: 624c11
            s8i          a5, a12, 18 /* 0x0d -> [arg0+0x12] */ #  dbc: 524c12
.Lbr141:    l32i         a0, sp, 12 /* [(local3)] */           #  dbf: 0831
            l32i         a0, a0, 32 /* [[(local3)]+0x20] */    #  dc1: 0880
            l32i         a7, a0, 0 /* [[[(local3)]+0x20]] */   #  dc3: 7800
            bbci         a7, 27, .Lbr142                       #  dc5: b7772b
            l8ui         a2, a0, 0 /* [[[(local3)]+0x20]] */   #  dc8: 220000
            l8ui         a3, a0, 4 /* [[[(local3)]+0x20]+0x4] */ #  dcb: 320004
            extui        a2, a2, 2, 4                          #  dce: 202234
            srli         a3, a3, 4                             #  dd1: 303441
            addi         a3, a3, 2                             #  dd4: 2b33
            extui        a3, a3, 0, 8                          #  dd6: 303074
            call0        sdk_ppRecordBarRRC                    #  dd9: 0158ffc0
                                                               #  ddd: 0000
            l32i         a3, sp, 12 /* [(local3)] */           #  ddf: 3831
            l32i         a3, a3, 32 /* [[(local3)]+0x20] */    #  de1: 3883
            l8ui         a3, a3, 0 /* [[[(local3)]+0x20]] */   #  de3: 320300
            movi         a2, 6 /* 0x00000006 */                #  de6: 0c62
            extui        a3, a3, 2, 4                          #  de8: 303234
            call0        sdk_pp_post                           #  deb: 0155ffc0
                                                               #  def: 0000
            j            .Lbr137                               #  df1: c6e5ff
.Lbr142:    l8ui         a6, a13, 13 /* [.Ldata004] */         #  df4: 620d0d
            l8ui         a8, a12, 17 /* [arg0+0x11] */         #  df7: 820c11
            movi         a7, 1 /* 0x00000001 */                #  dfa: 0c17
            l8ui         a2, a0, 5 /* [[[(local3)]+0x20]+0x5] */ #  dfc: 220005
            movi         a5, 0 /* 0x00000000 */                #  dff: 0c05
            extui        a4, a2, 0, 6                          #  e01: 204054
            moveqz       a5, a7, a8                            #  e04: 805783
            bltu         a4, a6, .Lbr143                       #  e07: 67340b
            l32i         a3, sp, 12 /* [(local3)] */           #  e0a: 3831
            mov          a2, a12 /* arg0 */                    #  e0c: 2d0c
            movi         a4, 2 /* 0x00000002 */                #  e0e: 0c24
            call0        .Lfunc006                             #  e10: 85a8ff
            j            .Lbr137                               #  e13: 46ddff
.Lbr143:    l8ui         a9, a0, 6 /* [[[(local3)]+0x20]+0x6] */ #  e16: 920006
            l8ui         a10, a13, 12 /* [.Ldata003] */        #  e19: a20d0c
            slli         a9, a9, 8                             #  e1c: 809911
            or           a9, a9, a2                            #  e1f: 209920
            extui        a9, a9, 6, 6                          #  e22: 909654
            bltu         a9, a10, .Lbr149                      #  e25: a7395d
            l32i         a3, sp, 12 /* [(local3)] */           #  e28: 3831
            mov          a2, a12 /* arg0 */                    #  e2a: 2d0c
            movi         a4, 3 /* 0x00000003 */                #  e2c: 0c34
            call0        .Lfunc006                             #  e2e: c5a6ff
            j            .Lbr137                               #  e31: c6d5ff
.Lbr144:    l8ui         a6, a0, 4 /* [[[.Ldata011]+0x20]+0x4] */ #  e34: 620004
            srli         a6, a6, 4                             #  e37: 606441
            addi         a6, a6, 1                             #  e3a: 1b66
            extui        a6, a6, 0, 8                          #  e3c: 606074
            call0        sdk_ppTxqUpdateBitmap                 #  e3f: 0141ffc0
                                                               #  e43: 0000
.Lbr145:    l32i         a3, a13, 40 /* [.Ldata011] */         #  e45: 38ad
            l32i         a3, a3, 32 /* [[.Ldata011]+0x20] */   #  e47: 3883
            l8ui         a3, a3, 0 /* [[[.Ldata011]+0x20]] */  #  e49: 320300
            movi         a2, 6 /* 0x00000006 */                #  e4c: 0c62
            extui        a3, a3, 2, 4                          #  e4e: 303234
            call0        sdk_pp_post                           #  e51: 013dffc0
                                                               #  e55: 0000
            mov          a2, a12 /* arg0 */                    #  e57: 2d0c
            movi         a3, 0 /* 0x00000000 */                #  e59: 0c03
            call0        .Lfunc008                             #  e5b: 05b9ff
            s8i          a14, a12, 18 /* 0x01 -> [arg0+0x12] */ #  e5e: e24c12
            j            .Lbr148                               #  e61: 060700
.Lbr146:    mov          a2, a12 /* arg0 */                    #  e64: 2d0c
            mov          a3, a15 /* 0x00000000 */              #  e66: 3d0f
            call0        .Lfunc008                             #  e68: 05b8ff
            l8ui         a4, a12, 11 /* [arg0+0xb] */          #  e6b: 420c0b
            beqz         a4, .Lbr147                           #  e6e: 8c14
            s8i          a15, a12, 11 /* 0x00 -> [arg0+0xb] */ #  e70: f24c0b
.Lbr147:    mov          a2, a12 /* arg0 */                    #  e73: 2d0c
            l32i         a3, a13, 40 /* [.Ldata011] */         #  e75: 38ad
            movi         a4, 1 /* 0x00000001 */                #  e77: 0c14
            movi         a5, 3 /* 0x00000003 */                #  e79: 0c35
            s8i          a5, a12, 18 /* 0x03 -> [arg0+0x12] */ #  e7b: 524c12
            call0        sdk_lmacRecycleMPDU                   #  e7e: 050000
.Lbr148:    movi         a14, 0 /* 0x00000000 */               #  e81: 0c0e
            j            .Lbr137                               #  e83: 46c1ff
.Lbr149:    l32i         a3, sp, 12 /* [(local3)] */           #  e86: 3831
            mov          a2, a12 /* arg0 */                    #  e88: 2d0c
            movi         a4, 4 /* 0x00000004 */                #  e8a: 0c44
            call0        .Lfunc006                             #  e8c: c5a0ff
            j            .Lbr137                               #  e8f: 46beff
.Lbr150:    l32i         a6, a0, 32 /* [[.Ldata011]+0x20] */   #  e92: 6880
            mov          a2, a12 /* arg0 */                    #  e94: 2d0c
            l32i         a6, a6, 0 /* [[[.Ldata011]+0x20]] */  #  e96: 6806
            mov          a14, a0 /* [.Ldata011] */             #  e98: ed00
            extui        a6, a6, 25, 1                         #  e9a: 606905
            movnez       a3, a5, a6                            #  e9d: 603593
            call0        .Lfunc002                             #  ea0: c51fff
            l32i         a0, a14, 32 /* [[.Ldata011]+0x20] */  #  ea3: 088e
            l32i         a0, a0, 0 /* [[[.Ldata011]+0x20]] */  #  ea5: 0800
            bbci         a0, 13, .Lbr152                       #  ea7: d76018
            bbsi         a0, 12, .Lbr152                       #  eaa: c7e015
            mov          a2, a12 /* arg0 */                    #  ead: 2d0c
            call0        .Lfunc010                             #  eaf: 85bbff
            movi         a14, 0 /* 0x00000000 */               #  eb2: 0c0e
            j            .Lbr141                               #  eb4: c6c1ff
.Lbr151:    s32i         a2, sp, 12 /* [arg0] -> [(local3)] */ #  eb7: 2931
            mov          a2, a12 /* arg0 */                    #  eb9: 2d0c
            call0        .Lfunc009                             #  ebb: 85b4ff
            mov          a14, a2                               #  ebe: ed02
            j            .Lbr141                               #  ec0: c6beff
.Lbr152:    mov          a2, a12 /* arg0 */                    #  ec3: 2d0c
            call0        .Lfunc011                             #  ec5: 85bdff
            mov          a14, a2                               #  ec8: ed02
            j            .Lbr141                               #  eca: 46bcff

            .literal_position                                  #  ed0: 00000000
                                                               #  ed4: 00000000
                                                               #  ed8: 00000000
                                                               #  edc: 00000000

# Function @ .text+0xee0
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      sdk_lmacProcessCollisions
            .type        sdk_lmacProcessCollisions, @function
sdk_lmacProcessCollisions:
            addi         sp, sp, -32 /* (local0) */            #  ee0: 12c1e0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  ee3: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  ee5: d921
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  ee7: e931
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  ee9: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  eeb: 0901
            call0        sdk_wDev_GetTxqCollisions             #  eed: 01f8ffc0
                                                               #  ef1: 0000
            mov          a12, a2                               #  ef3: cd02
            beqz         a2, .Lbr155                           #  ef5: bcc2
            movi         a15, 1 /* 0x00000001 */               #  ef7: 0c1f
            j            .Lbr154                               #  ef9: 060800
.Lbr153:    extui        a14, a13, 0, 8                        #  efc: d0e074
            mov          a2, a14                               #  eff: 2d0e
            call0        sdk_wDev_ProcessCollision             #  f01: 01f4ffc0
                                                               #  f05: 0000
            mov          a2, a14                               #  f07: 2d0e
            call0        sdk_lmacProcessCollision              #  f09: 01f3ffc0
                                                               #  f0d: 0000
            movi         a0, -1 /* 0xffffffff */               #  f0f: 7cf0
            ssl          a13                                   #  f11: 001d40
            sll          a2, a15                               #  f14: 002fa1
            xor          a2, a2, a0                            #  f17: 002230
            and          a12, a12, a2                          #  f1a: 20cc10
.Lbr154:    neg          a13, a12                              #  f1d: c0d060
            and          a13, a13, a12                         #  f20: c0dd10
            nsau         a13, a13                              #  f23: d0fd40
            neg          a13, a13                              #  f26: d0d060
            addi         a13, a13, 31                          #  f29: d2cd1f
            bgez         a13, .Lbr153                          #  f2c: d6cdfc
            call0        sdk_wDev_ClearTxqCollisions           #  f2f: 01ebffc0
                                                               #  f33: 0000
.Lbr155:    l32i         a12, sp, 4 /* [(local1)] */           #  f35: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  f37: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  f39: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  f3b: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  f3d: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  f3f: 12c120
            ret                                                #  f42: 0df0

            .literal_position                                  #  f44: 00000000
                                                               #  f48: 08000000
                                                               #  f4c: 30000000
                                                               #  f50: 00000000
                                                               #  f54: 08000000
                                                               #  f58: 00000000
                                                               #  f5c: 08000000
                                                               #  f60: 00000000
                                                               #  f64: 00000000
                                                               #  f68: 00000000
                                                               #  f6c: b4120000

# Function @ .text+0xf70
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_lmacProcessCollision
            .type        sdk_lmacProcessCollision, @function
sdk_lmacProcessCollision:
            addi         sp, sp, -16 /* (local0) */            #  f70: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  f73: 0901
            bltui        a2, 8, .Lbr157                        #  f75: b68211
            movi         a2, .Lstr001                          #  f78: 21f3ff
            movi         a3, .Lstr002                          #  f7b: 31f3ff
            movi         a4, 1035 /* 0x0000040b */             #  f7e: 42a40b
            call0        printf                                #  f81: 01f7ffc0
                                                               #  f85: 0000
.Lbr156:    j            .Lbr156 /* (halt) */                  #  f87: 06ffff
.Lbr157:    movi         a6, .Label001                         #  f8a: 61f0ff
            addx8        a2, a2, a2                            #  f8d: 2022b0
            addx4        a2, a2, a6                            #  f90: 6022a0
            l32i         a3, a2, 0                             #  f93: 3802
            bnez         a3, .Lbr159                           #  f95: dc03
            movi         a2, .Lstr001                          #  f97: 21eeff
            movi         a3, .Lstr002                          #  f9a: 31eeff
            movi         a4, 1037 /* 0x0000040d */             #  f9d: 42a40d
            call0        printf                                #  fa0: 01f1ffc0
                                                               #  fa4: 0000
.Lbr158:    j            .Lbr158 /* (halt) */                  #  fa6: 06ffff
.Lbr159:    l8ui         a4, a2, 17                            #  fa9: 420211
            beqi         a4, 1, .Lbr161                        #  fac: 261411
            movi         a2, .Lstr001                          #  faf: 21eaff
            movi         a3, .Lstr002                          #  fb2: 31eaff
            movi         a4, 1038 /* 0x0000040e */             #  fb5: 42a40e
            call0        printf                                #  fb8: 01ecffc0
                                                               #  fbc: 0000
.Lbr160:    j            .Lbr160 /* (halt) */                  #  fbe: 06ffff
.Lbr161:    l32i         a5, a3, 32                            #  fc1: 5883
            l16ui        a9, a3, 22                            #  fc3: 92130b
            l32i         a5, a5, 0                             #  fc6: 5805
            movi         a7, 768 /* 0x00000300 */              #  fc8: 72a300
            srli         a5, a5, 6                             #  fcb: 505641
            bany         a5, a7, .Lbr163                       #  fce: 77851a
            l16ui        a8, a3, 20                            #  fd1: 82130a
            addi         a7, a6, -48 /* .Ldata001 */           #  fd4: 72c6d0
            l16ui        a7, a7, 14 /* [.Ldata005] */          #  fd7: 721707
            add          a8, a8, a9                            #  fda: 9a88
            bge          a7, a8, .Lbr163                       #  fdc: 87a70c
            call0        .Lfunc015                             #  fdf: 01e3ffc0
                                                               #  fe3: 0000
.Lbr162:    l32i         a0, sp, 0 /* [(local0)] */            #  fe5: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  fe7: 12c110
            ret                                                #  fea: 0df0
.Lbr163:    movi         a4, 1 /* 0x00000001 */                #  fec: 0c14
            call0        .Lfunc013                             #  fee: c50300
            j            .Lbr162                               #  ff1: 06fcff

# Function @ .text+0xff4
            .balign      4
            .global      sdk_lmacMSDUAged
            .type        sdk_lmacMSDUAged, @function
sdk_lmacMSDUAged:
            movi         a2, 0 /* 0x00000000 */                #  ff4: 0c02
            ret           /* 0x00000000 */                     #  ff6: 0df0

            .literal_position                                  #  ff8: 00000000
                                                               #  ffc: 08000000
                                                               # 1000: 00000000
                                                               # 1004: 00000000
                                                               # 1008: 08000000
                                                               # 100c: 00000000
                                                               # 1010: 00000000
                                                               # 1014: 00000000
                                                               # 1018: 08000000
                                                               # 101c: 00000000
                                                               # 1020: 00000000
                                                               # 1024: 00000000
                                                               # 1028: 00000000

# Function @ .text+0x102c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc013:  addi         sp, sp, -16 /* (local0) */            # 102c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 102f: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 1031: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 1033: d921
            mov          a12, a2 /* arg0 */                    # 1035: cd02
            mov          a13, a3 /* arg1 */                    # 1037: dd03
            bnez         a3, .Lbr165                           # 1039: dc03
            movi         a2, .Lstr001                          # 103b: 21efff
            movi         a3, .Lstr002                          # 103e: 31efff
            movi         a4, 1067 /* 0x0000042b */             # 1041: 42a42b
            call0        printf                                # 1044: 01f6ffc0
                                                               # 1048: 0000
.Lbr164:    j            .Lbr164 /* (halt) */                  # 104a: 06ffff
.Lbr165:    movi         a0, .Ldata001                         # 104d: 01ecff
            l8ui         a7, a2, 9 /* [arg0+0x9] */            # 1050: 720209
            l8ui         a2, a0, 13 /* [.Ldata004] */          # 1053: 22000d
            mov          a3, a7 /* [arg0+0x9] */               # 1056: 3d07
            bgeu         a7, a2, .Lbr166                       # 1058: 27b70a
            addi         a3, a7, 1 /* [arg0+0x9]+0x1 */        # 105b: 1b37
            s8i          a3, a12, 9 /* [arg0+0x9]+0x1 -> [arg0+0x9] */ # 105d: 324c09
            l8ui         a2, a0, 13 /* [.Ldata004] */          # 1060: 22000d
            extui        a3, a3, 0, 8                          # 1063: 303074
.Lbr166:    bgeu         a3, a2, .Lbr167                       # 1066: 27b310
            l8ui         a2, a12, 6 /* [arg0+0x6] */           # 1069: 220c06
            l8ui         a5, a12, 8 /* [arg0+0x8] */           # 106c: 520c08
            addi         a6, a2, 1 /* [arg0+0x6]+0x1 */        # 106f: 1b62
            bgeu         a2, a5, .Lbr168                       # 1071: 57b20b
            s8i          a6, a12, 6 /* [arg0+0x6]+0x1 -> [arg0+0x6] */ # 1074: 624c06
            j            .Lbr168                               # 1077: 460100
.Lbr167:    l8ui         a7, a12, 7 /* [arg0+0x7] */           # 107a: 720c07
            s8i          a7, a12, 6 /* [arg0+0x7] -> [arg0+0x6] */ # 107d: 724c06
.Lbr168:    l32i         a11, a13, 32 /* [arg1+0x20] */        # 1080: b88d
            l8ui         a8, a0, 0 /* [.Ldata001] */           # 1082: 820000
            l8ui         a2, a11, 5 /* [[arg1+0x20]+0x5] */    # 1085: 220b05
            movi         a10, 192 /* 0x000000c0 */             # 1088: a2a0c0
            and          a10, a2, a10                          # 108b: a0a210
            extui        a2, a2, 0, 6                          # 108e: 202054
            addi         a2, a2, 1                             # 1091: 1b22
            extui        a2, a2, 0, 6                          # 1093: 202054
            or           a10, a10, a2                          # 1096: 20aa20
            s8i          a10, a11, 5 /* a10 -> [[arg1+0x20]+0x5] */ # 1099: a24b05
            l8ui         a9, a12, 4 /* [arg0+0x4] */           # 109c: 920c04
            bne          a8, a9, .Lbr170                       # 109f: 979828
            l32i         a2, a13, 32 /* [arg1+0x20] */         # 10a2: 288d
            l8ui         a7, a2, 4 /* [[arg1+0x20]+0x4] */     # 10a4: 720204
            l8ui         a11, a2, 5 /* [[arg1+0x20]+0x5] */    # 10a7: b20205
            srli         a3, a7, 4                             # 10aa: 703441
            beqz         a4, .Lbr169                           # 10ad: 8c94
            extui        a11, a11, 0, 6                        # 10af: b0b054
            bge          a3, a11, .Lbr171                      # 10b2: b7a317
            l32i         a4, a2, 0 /* [[arg1+0x20]] */         # 10b5: 4802
            bbsi         a4, 28, .Lbr171                       # 10b7: c7f412
.Lbr169:    extui        a5, a7, 0, 4                          # 10ba: 705034
            addi         a6, a3, 1                             # 10bd: 1b63
            extui        a6, a6, 0, 4                          # 10bf: 606034
            slli         a6, a6, 4                             # 10c2: c06611
            or           a5, a5, a6                            # 10c5: 605520
            s8i          a5, a2, 4 /* a5 -> [[arg1+0x20]+0x4] */ # 10c8: 524204
.Lbr170:    l32i         a2, a13, 32 /* [arg1+0x20] */         # 10cb: 288d
.Lbr171:    l8ui         a3, a12, 17 /* [arg0+0x11] */         # 10cd: 320c11
            beqi         a3, 2, .Lbr173                        # 10d0: 262314
            beqi         a3, 1, .Lbr173                        # 10d3: 261311
            movi         a2, .Lstr001                          # 10d6: 21cbff
            movi         a3, .Lstr002                          # 10d9: 31cbff
            movi         a4, 1084 /* 0x0000043c */             # 10dc: 42a43c
            call0        printf                                # 10df: 01d0ffc0
                                                               # 10e3: 0000
.Lbr172:    j            .Lbr172 /* (halt) */                  # 10e5: 06ffff
.Lbr173:    call0        sdk_rcReachRetryLimit                 # 10e8: 01cfffc0
                                                               # 10ec: 0000
            movi         a0, .Ldata001                         # 10ee: 01c7ff
            bnez         a2, .Lbr174                           # 10f1: dc62
            l32i         a7, a13, 32 /* [arg1+0x20] */         # 10f3: 788d
            l8ui         a7, a7, 5 /* [[arg1+0x20]+0x5] */     # 10f5: 720705
            l8ui         a8, a0, 13 /* [.Ldata004] */          # 10f8: 82000d
            extui        a7, a7, 0, 6                          # 10fb: 707054
            bgeu         a7, a8, .Lbr174                       # 10fe: 87b709
            mov          a2, a13 /* arg1 */                    # 1101: 2d0d
            call0        sdk_lmacMSDUAged                      # 1103: 050000
            movi         a0, .Ldata001                         # 1106: 01c2ff
            beqz         a2, .Lbr177                           # 1109: ac62
.Lbr174:    l8ui         a9, a12, 4 /* [arg0+0x4] */           # 110b: 920c04
            movi         a10, 6 /* 0x00000006 */               # 110e: 0c6a
            l8ui         a8, a0, 0 /* [.Ldata001] */           # 1110: 820000
            s8i          a10, a12, 17 /* 0x06 -> [arg0+0x11] */ # 1113: a24c11
            bne          a8, a9, .Lbr175                       # 1116: 979809
            mov          a2, a12 /* arg0 */                    # 1119: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 111b: 0c03
            call0        .Lfunc012                             # 111d: c5a2ff
            j            .Lbr176                               # 1120: 060100
.Lbr175:    mov          a2, a12 /* arg0 */                    # 1123: 2d0c
            call0        .Lfunc007                             # 1125: c583ff
.Lbr176:    l32i         a12, sp, 4 /* [(local1)] */           # 1128: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 112a: d821
            l32i         a0, sp, 0 /* [(local0)] */            # 112c: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 112e: 12c110
            ret                                                # 1131: 0df0
.Lbr177:    l8ui         a2, a12, 4 /* [arg0+0x4] */           # 1133: 220c04
            l8ui         a11, a0, 0 /* [.Ldata001] */          # 1136: b20000
            bne          a11, a2, .Lbr179                      # 1139: 279b25
            l32i         a3, a0, 40 /* [.Ldata011] */          # 113c: 38a0
            bne          a3, a13, .Lbr178                      # 113e: d79316
            l32i         a0, a13, 32 /* [arg1+0x20] */         # 1141: 088d
            l32i         a0, a0, 0 /* [[arg1+0x20]] */         # 1143: 0800
            bbsi         a0, 28, .Lbr178                       # 1145: c7f00f
            bbsi         a0, 27, .Lbr178                       # 1148: b7f00c
            l32i         a3, a13, 16 /* [arg1+0x10] */         # 114b: 384d
            l8ui         a2, a3, 1 /* [[arg1+0x10]+0x1] */     # 114d: 220301
            movi         a4, 8 /* 0x00000008 */                # 1150: 0c84
            or           a2, a2, a4                            # 1152: 402220
            s8i          a2, a3, 1 /* a2 -> [[arg1+0x10]+0x1] */ # 1155: 224301
.Lbr178:    mov          a2, a12 /* arg0 */                    # 1158: 2d0c
            movi         a3, 1 /* 0x00000001 */                # 115a: 0c13
            call0        .Lfunc012                             # 115c: c59eff
            j            .Lbr176                               # 115f: 46f1ff
.Lbr179:    l8ui         a5, a12, 17 /* [arg0+0x11] */         # 1162: 520c11
            beqi         a5, 1, .Lbr181                        # 1165: 261511
            movi         a2, .Lstr001                          # 1168: 21abff
            movi         a3, .Lstr002                          # 116b: 31abff
            movi         a4, 1119 /* 0x0000045f */             # 116e: 42a45f
            call0        printf                                # 1171: 01adffc0
                                                               # 1175: 0000
.Lbr180:    j            .Lbr180 /* (halt) */                  # 1177: 06ffff
.Lbr181:    mov          a2, a12 /* arg0 */                    # 117a: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 117c: 0c03
            movi         a6, 4 /* 0x00000004 */                # 117e: 0c46
            s8i          a6, a12, 17 /* 0x04 -> [arg0+0x11] */ # 1180: 624c11
            call0        .Lfunc014                             # 1183: c50200
            j            .Lbr176                               # 1186: 86e7ff

            .literal_position                                  # 118c: 00000000
                                                               # 1190: 00000000
                                                               # 1194: 00000000
                                                               # 1198: 00000000
                                                               # 119c: 00000000
                                                               # 11a0: c4170000
                                                               # 11a4: 00000000
                                                               # 11a8: 00000000
                                                               # 11ac: 00000000

# Function @ .text+0x11b0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc014:  addi         sp, sp, -16 /* (local0) */            # 11b0: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 11b3: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 11b5: 0911
            l8ui         a0, a2, 14 /* [arg0+0xe] */           # 11b7: 02020e
            mov          a12, a2 /* arg0 */                    # 11ba: cd02
            bnez         a0, .Lbr183                           # 11bc: ecd0
            l8ui         a0, a2, 11 /* [arg0+0xb] */           # 11be: 02020b
            beqz         a3, .Lbr184                           # 11c1: 161304
            beqz         a0, .Lbr186                           # 11c4: 162009
            l8ui         a2, a2, 4 /* [arg0+0x4] */            # 11c7: 220204
            call0        sdk_Tx_Copy2Queue                     # 11ca: 01f0ffc0
                                                               # 11ce: 0000
            movi         a3, 0 /* 0x00000000 */                # 11d0: 0c03
            movi         a2, 1 /* 0x00000001 */                # 11d2: 0c12
            movi         a4, 0 /* 0x00000000 */                # 11d4: 0c04
            s8i          a2, a12, 17 /* 0x01 -> [arg0+0x11] */ # 11d6: 224c11
            l8ui         a2, a12, 4 /* [arg0+0x4] */           # 11d9: 220c04
            call0        sdk_wDev_EnableTransmit               # 11dc: 01edffc0
                                                               # 11e0: 0000
            movi         a2, 1 /* 0x00000001 */                # 11e2: 0c12
.Lbr182:    l32i         a12, sp, 8 /* [(local2)] */           # 11e4: c821
            l32i         a0, sp, 4 /* [(local1)] */            # 11e6: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 11e8: 12c110
            ret                                                # 11eb: 0df0
.Lbr183:    movi         a3, 0 /* 0x00000000 */                # 11ed: 0c03
            s8i          a3, a2, 14 /* 0x00 -> [arg0+0xe] */   # 11ef: 32420e
            l32i         a2, a2, 0 /* [arg0] */                # 11f2: 2802
            call0        sdk_ppDiscardMPDU                     # 11f4: 01e8ffc0
                                                               # 11f8: 0000
            movi         a2, 0 /* 0x00000000 */                # 11fa: 0c02
            movi         a4, 0 /* 0x00000000 */                # 11fc: 0c04
            s32i         a4, a12, 0 /* 0x00000000 -> [arg0] */ # 11fe: 490c
            s8i          a4, a12, 17 /* 0x00 -> [arg0+0x11] */ # 1200: 424c11
            j            .Lbr182                               # 1203: 46f7ff
.Lbr184:    beqz         a0, .Lbr187                           # 1206: 165006
            l32i         a2, a2, 0 /* [arg0] */                # 1209: 2802
            l32i         a3, a2, 32 /* [[arg0]+0x20] */        # 120b: 3882
            l32i         a2, a2, 24 /* [[arg0]+0x18] */        # 120d: 2862
            l16ui        a4, a3, 6 /* [[[arg0]+0x20]+0x6] */   # 120f: 421303
            l8ui         a5, a3, 8 /* [[[arg0]+0x20]+0x8] */   # 1212: 520308
            s32i         a5, sp, 0 /* [[[arg0]+0x20]+0x8] -> [(local0)] */ # 1215: 5901
            srli         a4, a4, 7                             # 1217: 404741
            s16i         a4, a12, 22 /* a4 -> [arg0+0x16] */   # 121a: 425c0b
            call0        sdk_rcGetRate                         # 121d: 01deffc0
                                                               # 1221: 0000
            l32i         a2, a12, 0 /* [arg0] */               # 1223: 280c
            l32i         a0, a2, 32 /* [[arg0]+0x20] */        # 1225: 0882
            l32i         a7, sp, 0 /* [(local0)] */            # 1227: 7801
            l8ui         a6, a0, 8 /* [[[arg0]+0x20]+0x8] */   # 1229: 620008
            beq          a6, a7, .Lbr185                       # 122c: 771609
            call0        sdk_ppCalFrameTimes                   # 122f: 01dbffc0
                                                               # 1233: 0000
            l32i         a0, a12, 0 /* [arg0] */               # 1235: 080c
            l32i         a0, a0, 32 /* [[arg0]+0x20] */        # 1237: 0880
.Lbr185:    l16si        a2, a12, 22 /* [arg0+0x16] */         # 1239: 229c0b
            l16ui        a4, a0, 6 /* [[[arg0]+0x20]+0x6] */   # 123c: 421003
            l16ui        a3, a0, 10 /* [[[arg0]+0x20]+0xa] */  # 123f: 321005
            srli         a4, a4, 7                             # 1242: 404741
            sub          a3, a3, a4                            # 1245: 4033c0
            add          a2, a2, a3                            # 1248: 3a22
            s16i         a2, a12, 22 /* a2 -> [arg0+0x16] */   # 124a: 225c0b
            mov          a2, a12 /* arg0 */                    # 124d: 2d0c
            call0        .Lfunc016                             # 124f: 01d4ffc0
                                                               # 1253: 0000
            movi         a2, 1 /* 0x00000001 */                # 1255: 0c12
            j            .Lbr182                               # 1257: 46e2ff
.Lbr186:    movi         a3, 0 /* 0x00000000 */                # 125a: 0c03
            call0        .Lfunc008                             # 125c: c578ff
            l32i         a2, a12, 0 /* [arg0] */               # 125f: 280c
            l8ui         a3, a12, 4 /* [arg0+0x4] */           # 1261: 320c04
            call0        sdk_lmacTxFrame                       # 1264: 01d0ffc0
                                                               # 1268: 0000
            movi         a2, 0 /* 0x00000000 */                # 126a: 0c02
            j            .Lbr182                               # 126c: 06ddff
.Lbr187:    movi         a3, 0 /* 0x00000000 */                # 126f: 0c03
            call0        .Lfunc008                             # 1271: 8577ff
            l32i         a3, a12, 0 /* [arg0] */               # 1274: 380c
            l32i         a2, a3, 24 /* [[arg0]+0x18] */        # 1276: 2863
            l32i         a3, a3, 32 /* [[arg0]+0x20] */        # 1278: 3883
            call0        sdk_rcGetRate                         # 127a: 01cbffc0
                                                               # 127e: 0000
            l32i         a2, a12, 0 /* [arg0] */               # 1280: 280c
            l8ui         a3, a12, 4 /* [arg0+0x4] */           # 1282: 320c04
            call0        sdk_lmacTxFrame                       # 1285: 01c9ffc0
                                                               # 1289: 0000
            movi         a2, 0 /* 0x00000000 */                # 128b: 0c02
            j            .Lbr182                               # 128d: c6d4ff

            .literal_position                                  # 1290: 00000000
                                                               # 1294: 3ff00000
                                                               # 1298: 00000000
                                                               # 129c: 08000000
                                                               # 12a0: 00000000
                                                               # 12a4: 08000000
                                                               # 12a8: 00000000
                                                               # 12ac: 00000000
                                                               # 12b0: 00000000

# Function @ .text+0x12b4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc015:  addi         sp, sp, -16 /* (local0) */            # 12b4: 12c1f0
            l8ui         a5, a2, 10 /* [arg0+0xa] */           # 12b7: 52020a
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 12ba: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 12bc: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 12be: d921
            movi         a13, .Ldata001                        # 12c0: d1f4ff
            mov          a12, a2 /* arg0 */                    # 12c3: cd02
            l8ui         a0, a13, 12 /* [.Ldata003] */         # 12c5: 020d0c
            mov          a2, a5 /* [arg0+0xa] */               # 12c8: 2d05
            bgeu         a5, a0, .Lbr188                       # 12ca: 07b50a
            addi         a2, a5, 1 /* [arg0+0xa]+0x1 */        # 12cd: 1b25
            s8i          a2, a12, 10 /* [arg0+0xa]+0x1 -> [arg0+0xa] */ # 12cf: 224c0a
            l8ui         a0, a13, 12 /* [.Ldata003] */         # 12d2: 020d0c
            extui        a2, a2, 0, 8                          # 12d5: 202074
.Lbr188:    bgeu         a2, a0, .Lbr189                       # 12d8: 07b210
            l8ui         a0, a12, 6 /* [arg0+0x6] */           # 12db: 020c06
            l8ui         a3, a12, 8 /* [arg0+0x8] */           # 12de: 320c08
            addi         a4, a0, 1 /* [arg0+0x6]+0x1 */        # 12e1: 1b40
            bgeu         a0, a3, .Lbr190                       # 12e3: 37b00b
            s8i          a4, a12, 6 /* [arg0+0x6]+0x1 -> [arg0+0x6] */ # 12e6: 424c06
            j            .Lbr190                               # 12e9: 460100
.Lbr189:    l8ui         a5, a12, 7 /* [arg0+0x7] */           # 12ec: 520c07
            s8i          a5, a12, 6 /* [arg0+0x7] -> [arg0+0x6] */ # 12ef: 524c06
.Lbr190:    l32i         a2, a13, 40 /* [.Ldata011] */         # 12f2: 28ad
            l8ui         a6, a13, 0 /* [.Ldata001] */          # 12f4: 620d00
            l32i         a9, a2, 32 /* [[.Ldata011]+0x20] */   # 12f7: 9882
            movi         a8, 0x0000f03f                        # 12f9: 81e6ff
            l8ui         a10, a9, 6 /* [[[.Ldata011]+0x20]+0x6] */ # 12fc: a20906
            l8ui         a11, a9, 5 /* [[[.Ldata011]+0x20]+0x5] */ # 12ff: b20905
            slli         a10, a10, 8                           # 1302: 80aa11
            or           a10, a10, a11                         # 1305: b0aa20
            and          a8, a10, a8                           # 1308: 808a10
            extui        a10, a10, 6, 6                        # 130b: a0a654
            addi         a10, a10, 1                           # 130e: 1baa
            extui        a10, a10, 0, 6                        # 1310: a0a054
            slli         a10, a10, 6                           # 1313: a0aa11
            or           a8, a8, a10                           # 1316: a08820
            s8i          a8, a9, 5 /* a8 -> [[[.Ldata011]+0x20]+0x5] */ # 1319: 824905
            srli         a8, a8, 8                             # 131c: 808841
            s8i          a8, a9, 6 /* a8 -> [[[.Ldata011]+0x20]+0x6] */ # 131f: 824906
            l8ui         a7, a12, 4 /* [arg0+0x4] */           # 1322: 720c04
            bne          a6, a7, .Lbr191                       # 1325: 779618
            l32i         a0, a2, 32 /* [[.Ldata011]+0x20] */   # 1328: 0882
            l8ui         a3, a0, 4 /* [[[.Ldata011]+0x20]+0x4] */ # 132a: 320004
            extui        a11, a3, 0, 4                         # 132d: 30b034
            srli         a3, a3, 4                             # 1330: 303441
            addi         a3, a3, 1                             # 1333: 1b33
            extui        a3, a3, 0, 4                          # 1335: 303034
            slli         a3, a3, 4                             # 1338: c03311
            or           a11, a11, a3                          # 133b: 30bb20
            s8i          a11, a0, 4 /* a11 -> [[[.Ldata011]+0x20]+0x4] */ # 133e: b24004
.Lbr191:    l8ui         a0, a12, 17 /* [arg0+0x11] */         # 1341: 020c11
            beqi         a0, 2, .Lbr193                        # 1344: 262014
            beqi         a0, 1, .Lbr193                        # 1347: 261011
            movi         a2, .Lstr001                          # 134a: 21d3ff
            movi         a3, .Lstr002                          # 134d: 31d3ff
            movi         a4, 1201 /* 0x000004b1 */             # 1350: 42a4b1
            call0        printf                                # 1353: 01d5ffc0
                                                               # 1357: 0000
.Lbr192:    j            .Lbr192 /* (halt) */                  # 1359: 06ffff
.Lbr193:    l32i         a2, a2, 32 /* [[.Ldata011]+0x20] */   # 135c: 2882
            call0        sdk_rcReachRetryLimit                 # 135e: 01d3ffc0
                                                               # 1362: 0000
            bnez         a2, .Lbr194                           # 1364: dcc2
            l32i         a2, a13, 40 /* [.Ldata011] */         # 1366: 28ad
            l32i         a6, a2, 32 /* [[.Ldata011]+0x20] */   # 1368: 6882
            l8ui         a5, a13, 12 /* [.Ldata003] */         # 136a: 520d0c
            l8ui         a4, a6, 6 /* [[[.Ldata011]+0x20]+0x6] */ # 136d: 420606
            l8ui         a6, a6, 5 /* [[[.Ldata011]+0x20]+0x5] */ # 1370: 620605
            slli         a4, a4, 8                             # 1373: 804411
            or           a4, a4, a6                            # 1376: 604420
            extui        a4, a4, 6, 6                          # 1379: 404654
            bgeu         a4, a5, .Lbr194                       # 137c: 57b404
            call0        sdk_lmacMSDUAged                      # 137f: 050000
            beqz         a2, .Lbr197                           # 1382: ac62
.Lbr194:    l8ui         a8, a12, 4 /* [arg0+0x4] */           # 1384: 820c04
            movi         a9, 6 /* 0x00000006 */                # 1387: 0c69
            l8ui         a7, a13, 0 /* [.Ldata001] */          # 1389: 720d00
            s8i          a9, a12, 17 /* 0x06 -> [arg0+0x11] */ # 138c: 924c11
            bne          a7, a8, .Lbr195                       # 138f: 879709
            mov          a2, a12 /* arg0 */                    # 1392: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 1394: 0c03
            call0        .Lfunc012                             # 1396: 457bff
            j            .Lbr196                               # 1399: 060100
.Lbr195:    mov          a2, a12 /* arg0 */                    # 139c: 2d0c
            call0        .Lfunc007                             # 139e: 455cff
.Lbr196:    l32i         a12, sp, 4 /* [(local1)] */           # 13a1: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 13a3: d821
            l32i         a0, sp, 0 /* [(local0)] */            # 13a5: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 13a7: 12c110
            ret                                                # 13aa: 0df0
.Lbr197:    l8ui         a11, a12, 4 /* [arg0+0x4] */          # 13ac: b20c04
            l8ui         a10, a13, 0 /* [.Ldata001] */         # 13af: a20d00
            bne          a10, a11, .Lbr199                     # 13b2: b79a1f
            l32i         a2, a13, 40 /* [.Ldata011] */         # 13b5: 28ad
            l32i         a0, a2, 32 /* [[.Ldata011]+0x20] */   # 13b7: 0882
            l32i         a0, a0, 0 /* [[[.Ldata011]+0x20]] */  # 13b9: 0800
            bbsi         a0, 28, .Lbr198                       # 13bb: c7f00c
            l32i         a4, a2, 16 /* [[.Ldata011]+0x10] */   # 13be: 4842
            l8ui         a3, a4, 1 /* [[[.Ldata011]+0x10]+0x1] */ # 13c0: 320401
            movi         a5, 8 /* 0x00000008 */                # 13c3: 0c85
            or           a3, a3, a5                            # 13c5: 503320
            s8i          a3, a4, 1 /* a3 -> [[[.Ldata011]+0x10]+0x1] */ # 13c8: 324401
.Lbr198:    mov          a2, a12 /* arg0 */                    # 13cb: 2d0c
            movi         a3, 1 /* 0x00000001 */                # 13cd: 0c13
            call0        .Lfunc012                             # 13cf: c577ff
            j            .Lbr196                               # 13d2: c6f2ff
.Lbr199:    l8ui         a6, a12, 17 /* [arg0+0x11] */         # 13d5: 620c11
            beqi         a6, 1, .Lbr201                        # 13d8: 261611
            movi         a2, .Lstr001                          # 13db: 21b1ff
            movi         a3, .Lstr002                          # 13de: 31b1ff
            movi         a4, 1223 /* 0x000004c7 */             # 13e1: 42a4c7
            call0        printf                                # 13e4: 01b3ffc0
                                                               # 13e8: 0000
.Lbr200:    j            .Lbr200 /* (halt) */                  # 13ea: 06ffff
.Lbr201:    mov          a2, a12 /* arg0 */                    # 13ed: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 13ef: 0c03
            movi         a7, 4 /* 0x00000004 */                # 13f1: 0c47
            s8i          a7, a12, 17 /* 0x04 -> [arg0+0x11] */ # 13f3: 724c11
            call0        .Lfunc014                             # 13f6: 85dbff
            j            .Lbr196                               # 13f9: 06e9ff

            .literal_position                                  # 13fc: 30000000
                                                               # 1400: 00000000
                                                               # 1404: 08000000
                                                               # 1408: 00000000
                                                               # 140c: 08000000
                                                               # 1410: 00000000
                                                               # 1414: 00000000

# Function @ .text+0x1418
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_lmacProcessCtsTimeout
            .type        sdk_lmacProcessCtsTimeout, @function
sdk_lmacProcessCtsTimeout:
            movi         a3, .Label001                         # 1418: 31f9ff
            addi         sp, sp, -16 /* (local0) */            # 141b: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 141e: 0901
            addx8        a0, a2, a2                            # 1420: 2002b0
            addx4        a2, a0, a3                            # 1423: 3020a0
            l32i         a3, a2, 0                             # 1426: 3802
            bnez         a3, .Lbr203                           # 1428: dc03
            movi         a2, .Lstr001                          # 142a: 21f5ff
            movi         a3, .Lstr002                          # 142d: 31f5ff
            movi         a4, 1245 /* 0x000004dd */             # 1430: 42a4dd
            call0        printf                                # 1433: 01f7ffc0
                                                               # 1437: 0000
.Lbr202:    j            .Lbr202 /* (halt) */                  # 1439: 06ffff
.Lbr203:    l8ui         a4, a2, 17                            # 143c: 420211
            beqi         a4, 1, .Lbr205                        # 143f: 261411
            movi         a2, .Lstr001                          # 1442: 21f1ff
            movi         a3, .Lstr002                          # 1445: 31f1ff
            movi         a4, 1246 /* 0x000004de */             # 1448: 42a4de
            call0        printf                                # 144b: 01f2ffc0
                                                               # 144f: 0000
.Lbr204:    j            .Lbr204 /* (halt) */                  # 1451: 06ffff
.Lbr205:    movi         a4, 1 /* 0x00000001 */                # 1454: 0c14
            call0        .Lfunc013                             # 1456: 45bdff
            l32i         a0, sp, 0 /* [(local0)] */            # 1459: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 145b: 12c110
            ret                                                # 145e: 0df0

            .literal_position                                  # 1460: 00000000
                                                               # 1464: 08000000
                                                               # 1468: 00000000
                                                               # 146c: 00000000

# Function @ .text+0x1470
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_lmacProcessAckTimeout
            .type        sdk_lmacProcessAckTimeout, @function
sdk_lmacProcessAckTimeout:
            addi         sp, sp, -16 /* (local0) */            # 1470: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1473: 0901
            call0        sdk_lmacIsActive                      # 1475: 050000
            bnez         a2, .Lbr207                           # 1478: dc02
            movi         a2, .Lstr001                          # 147a: 21f9ff
            movi         a3, .Lstr002                          # 147d: 31f9ff
            movi         a4, 1263 /* 0x000004ef */             # 1480: 42a4ef
            call0        printf                                # 1483: 01faffc0
                                                               # 1487: 0000
.Lbr206:    j            .Lbr206 /* (halt) */                  # 1489: 06ffff
.Lbr207:    movi         a4, .Ldata001                         # 148c: 41f7ff
            l32i         a3, a4, 40 /* [.Ldata011] */          # 148f: 38a4
            l8ui         a2, a4, 0 /* [.Ldata001] */           # 1491: 220400
            l8ui         a5, a4, 0 /* [.Ldata001] */           # 1494: 520400
            l32i         a0, a3, 32 /* [[.Ldata011]+0x20] */   # 1497: 0883
            addi         a4, a4, 48 /* .Label001 */            # 1499: 42c430
            addx8        a2, a2, a5                            # 149c: 5022b0
            l32i         a0, a0, 0 /* [[[.Ldata011]+0x20]] */  # 149f: 0800
            addx4        a2, a2, a4                            # 14a1: 4022a0
            bbci         a0, 14, .Lbr208                       # 14a4: e76010
            movi         a6, 0 /* 0x00000000 */                # 14a7: 0c06
            l8ui         a7, a2, 7                             # 14a9: 720207
            s8i          a7, a2, 6                             # 14ac: 724206
            s8i          a6, a2, 9                             # 14af: 624209
            call0        .Lfunc015                             # 14b2: 05e0ff
            j            .Lbr209                               # 14b5: 060100
.Lbr208:    movi         a4, 0 /* 0x00000000 */                # 14b8: 0c04
            call0        .Lfunc013                             # 14ba: 05b7ff
.Lbr209:    l32i         a0, sp, 0 /* [(local0)] */            # 14bd: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 14bf: 12c110
            ret                                                # 14c2: 0df0

            .literal_position                                  # 14c4: 00000000

# Function @ .text+0x14c8
            .balign      4
            .global      sdk_lmacProcessRtsStart
            .type        sdk_lmacProcessRtsStart, @function
sdk_lmacProcessRtsStart:
            movi         a3, .Ldata001                         # 14c8: 31ffff
            s8i          a2, a3, 0 /* arg0 -> [.Ldata001] */   # 14cb: 224300
            ret           /* arg0 */                           # 14ce: 0df0

            .literal_position                                  # 14d0: 00000000
                                                               # 14d4: 08000000
                                                               # 14d8: 00000000
                                                               # 14dc: 00000000
                                                               # 14e0: 08000000
                                                               # 14e4: 10000000
                                                               # 14e8: 00000000
                                                               # 14ec: 08000000
                                                               # 14f0: 30000000
                                                               # 14f4: 00000000
                                                               # 14f8: 00000000
                                                               # 14fc: 00000000
                                                               # 1500: 00000000

# Function @ .text+0x1504
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_lmacProcessTxRtsError
            .type        sdk_lmacProcessTxRtsError, @function
sdk_lmacProcessTxRtsError:
            addi         sp, sp, -16 /* (local0) */            # 1504: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1507: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 1509: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 150b: d921
            mov          a12, a2 /* arg0 */                    # 150d: cd02
            mov          a13, a3 /* arg1 */                    # 150f: dd03
            call0        sdk_lmacIsActive                      # 1511: 050000
            bnez         a2, .Lbr211                           # 1514: dc02
            movi         a2, .Lstr001                          # 1516: 21eeff
            movi         a3, .Lstr002                          # 1519: 31eeff
            movi         a4, 1292 /* 0x0000050c */             # 151c: 42a50c
            call0        printf                                # 151f: 01f5ffc0
                                                               # 1523: 0000
.Lbr210:    j            .Lbr210 /* (halt) */                  # 1525: 06ffff
.Lbr211:    movi         a0, .Ldata001                         # 1528: 01ecff
            l8ui         a0, a0, 0 /* [.Ldata001] */           # 152b: 020000
            beq          a13, a0, .Lbr213                      # 152e: 071d11
            movi         a2, .Lstr001                          # 1531: 21eaff
            movi         a3, .Lstr002                          # 1534: 31ebff
            movi         a4, 1293 /* 0x0000050d */             # 1537: 42a50d
            call0        printf                                # 153a: 01efffc0
                                                               # 153e: 0000
.Lbr212:    j            .Lbr212 /* (halt) */                  # 1540: 06ffff
.Lbr213:    beqi         a12, 1, .Lbr217                       # 1543: 261c43
            beqi         a12, 3, .Lbr217                       # 1546: 263c40
            movi         a2, 17 /* 0x00000011 */               # 1549: 1c12
            blt          a2, a12, .Lbr214                      # 154b: c72202
            bgei         a12, 16, .Lbr216                      # 154e: e6bc22
.Lbr214:    movi         a3, 192 /* 0x000000c0 */              # 1551: 32a0c0
            beq          a12, a3, .Lbr216                      # 1554: 371c1c
            movi         a2, .Lstr003                          # 1557: 21e3ff
            mov          a3, a12 /* arg0 */                    # 155a: 3d0c
            call0        printf                                # 155c: 01e8ffc0
                                                               # 1560: 0000
            movi         a2, .Lstr001                          # 1562: 21e1ff
            movi         a3, .Lstr002                          # 1565: 31e1ff
            movi         a4, 1312 /* 0x00000520 */             # 1568: 42a520
            call0        printf                                # 156b: 01e5ffc0
                                                               # 156f: 0000
.Lbr215:    j            .Lbr215 /* (halt) */                  # 1571: 06ffff
.Lbr216:    movi         a4, 6 /* 0x00000006 */                # 1574: 0c64
            movi         a3, .Label001                         # 1576: 31deff
            addx8        a2, a0, a0                            # 1579: 0020b0
            addx4        a2, a2, a3                            # 157c: 3022a0
            s8i          a4, a2, 17                            # 157f: 424211
            movi         a3, 0 /* 0x00000000 */                # 1582: 0c03
            call0        .Lfunc012                             # 1584: 455cff
            j            .Lbr218                               # 1587: 060100
.Lbr217:    mov          a2, a13 /* arg1 */                    # 158a: 2d0d
            call0        sdk_lmacProcessCtsTimeout             # 158c: 050000
.Lbr218:    l32i         a12, sp, 4 /* [(local1)] */           # 158f: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 1591: d821
            l32i         a0, sp, 0 /* [(local0)] */            # 1593: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1595: 12c110
            ret                                                # 1598: 0df0

            .literal_position                                  # 159c: 00000000
                                                               # 15a0: 08000000
                                                               # 15a4: 24000000
                                                               # 15a8: 00000000
                                                               # 15ac: 08000000
                                                               # 15b0: 00000000
                                                               # 15b4: 00000000
                                                               # 15b8: 00000000
                                                               # 15bc: 00000000

# Function @ .text+0x15c0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_lmacProcessTxError
            .type        sdk_lmacProcessTxError, @function
sdk_lmacProcessTxError:
            addi         sp, sp, -16 /* (local0) */            # 15c0: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 15c3: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 15c5: 0901
            mov          a12, a2 /* arg0 */                    # 15c7: cd02
            call0        sdk_lmacIsActive                      # 15c9: 050000
            bnez         a2, .Lbr220                           # 15cc: dc02
            movi         a2, .Lstr001                          # 15ce: 21f3ff
            movi         a3, .Lstr002                          # 15d1: 31f3ff
            movi         a4, 1331 /* 0x00000533 */             # 15d4: 42a533
            call0        printf                                # 15d7: 01f7ffc0
                                                               # 15db: 0000
.Lbr219:    j            .Lbr219 /* (halt) */                  # 15dd: 06ffff
.Lbr220:    beqi         a12, 1, .Lbr225                       # 15e0: 261c52
            beqi         a12, 3, .Lbr225                       # 15e3: 263c4f
            movi         a0, 17 /* 0x00000011 */               # 15e6: 1c10
            blt          a0, a12, .Lbr221                      # 15e8: c72002
            bgei         a12, 16, .Lbr224                      # 15eb: e6bc28
.Lbr221:    movi         a2, 193 /* 0x000000c1 */              # 15ee: 22a0c1
            blt          a2, a12, .Lbr222                      # 15f1: c72205
            movi         a3, 192 /* 0x000000c0 */              # 15f4: 32a0c0
            bge          a12, a3, .Lbr224                      # 15f7: 37ac1c
.Lbr222:    movi         a2, .Lstr004                          # 15fa: 21eaff
            mov          a3, a12 /* arg0 */                    # 15fd: 3d0c
            call0        printf                                # 15ff: 01eeffc0
                                                               # 1603: 0000
            movi         a2, .Lstr001                          # 1605: 21e8ff
            movi         a3, .Lstr002                          # 1608: 31e9ff
            movi         a4, 1352 /* 0x00000548 */             # 160b: 42a548
            call0        printf                                # 160e: 01ebffc0
                                                               # 1612: 0000
.Lbr223:    j            .Lbr223 /* (halt) */                  # 1614: 06ffff
.Lbr224:    movi         a3, 0 /* 0x00000000 */                # 1617: 0c03
            movi         a5, .Ldata001                         # 1619: 51e5ff
            movi         a4, 6 /* 0x00000006 */                # 161c: 0c64
            l8ui         a2, a5, 0 /* [.Ldata001] */           # 161e: 220500
            l8ui         a6, a5, 0 /* [.Ldata001] */           # 1621: 620500
            addi         a5, a5, 48 /* .Label001 */            # 1624: 52c530
            addx8        a2, a2, a6                            # 1627: 6022b0
            addx4        a2, a2, a5                            # 162a: 5022a0
            s8i          a4, a2, 17                            # 162d: 424211
            call0        .Lfunc012                             # 1630: 8551ff
            j            .Lbr226                               # 1633: 860000
.Lbr225:    call0        sdk_lmacProcessAckTimeout             # 1636: 050000
.Lbr226:    l32i         a12, sp, 4 /* [(local1)] */           # 1639: c811
            l32i         a0, sp, 0 /* [(local0)] */            # 163b: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 163d: 12c110
            ret                                                # 1640: 0df0

            .literal_position                                  # 1644: 30000000
                                                               # 1648: 00000000
                                                               # 164c: 08000000
                                                               # 1650: 00000000
                                                               # 1654: 08000000
                                                               # 1658: 00000000
                                                               # 165c: 08000000
                                                               # 1660: 00000000
                                                               # 1664: ffefff03
                                                               # 1668: 3ff00000
                                                               # 166c: 00000000
                                                               # 1670: 00000000
                                                               # 1674: 00000000
                                                               # 1678: 00000000
                                                               # 167c: 00000000

# Function @ .text+0x1680
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_lmacTxFrame
            .type        sdk_lmacTxFrame, @function
sdk_lmacTxFrame:
            addi         sp, sp, -16 /* (local0) */            # 1680: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 1683: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 1685: 0911
            movi         a0, .Label001                         # 1687: 01efff
            addx8        a12, a3, a3                           # 168a: 30c3b0
            addx4        a12, a12, a0                          # 168d: 00cca0
            l8ui         a0, a12, 17                           # 1690: 020c11
            beqz         a0, .Lbr228                           # 1693: 9c60
            beqi         a0, 3, .Lbr228                        # 1695: 263014
            beqi         a0, 4, .Lbr230                        # 1698: 26402a
            movi         a2, .Lstr001                          # 169b: 21ebff
            movi         a3, .Lstr002                          # 169e: 31ebff
            movi         a4, 1511 /* 0x000005e7 */             # 16a1: 42a5e7
            call0        printf                                # 16a4: 01f2ffc0
                                                               # 16a8: 0000
.Lbr227:    j            .Lbr227 /* (halt) */                  # 16aa: 06ffff
.Lbr228:    beqi         a0, 4, .Lbr230                        # 16ad: 264015
            s32i         a2, a12, 0                            # 16b0: 290c
            bnez         a2, .Lbr232                           # 16b2: eca2
            movi         a2, .Lstr001                          # 16b4: 21e7ff
            movi         a3, .Lstr002                          # 16b7: 31e7ff
            movi         a4, 1519 /* 0x000005ef */             # 16ba: 42a5ef
            call0        printf                                # 16bd: 01ecffc0
                                                               # 16c1: 0000
.Lbr229:    j            .Lbr229 /* (halt) */                  # 16c3: 06ffff
.Lbr230:    l32i         a3, a12, 0                            # 16c6: 380c
            sub          a3, a3, a2                            # 16c8: 2033c0
            beqz         a3, .Lbr235                           # 16cb: 16a30b
            movi         a2, .Lstr001                          # 16ce: 21e2ff
            movi         a3, .Lstr002                          # 16d1: 31e2ff
            movi         a4, 1514 /* 0x000005ea */             # 16d4: 42a5ea
            call0        printf                                # 16d7: 01e7ffc0
                                                               # 16db: 0000
.Lbr231:    j            .Lbr231 /* (halt) */                  # 16dd: 06ffff
.Lbr232:    movi         a8, 256 /* 0x00000100 */              # 16e0: 82a100
            l16ui        a6, a2, 22 /* [arg0+0x16] */          # 16e3: 62120b
            l16ui        a5, a2, 20 /* [arg0+0x14] */          # 16e6: 52120a
            movi         a7, 0x03ffefff                        # 16e9: 71deff
            add          a5, a5, a6                            # 16ec: 6a55
            l32i         a6, a2, 32 /* [arg0+0x20] */          # 16ee: 6882
            movi         a4, .Ldata001                         # 16f0: 41dcff
            l32i         a3, a6, 0 /* [[arg0+0x20]] */         # 16f3: 3806
            l16ui        a4, a4, 14 /* [.Ldata005] */          # 16f5: 421407
            srli         a0, a3, 6                             # 16f8: 300641
            bge          a4, a5, .Lbr233                       # 16fb: 57a422
            bbsi         a3, 7, .Lbr233                        # 16fe: 77e31f
            or           a5, a0, a8                            # 1701: 805020
            extui        a4, a3, 0, 6                          # 1704: 304054
            slli         a5, a5, 6                             # 1707: a05511
            or           a4, a4, a5                            # 170a: 504420
            extui        a3, a4, 0, 6                          # 170d: 403054
            srli         a4, a4, 6                             # 1710: 404641
            and          a4, a4, a7                            # 1713: 704410
            slli         a4, a4, 6                             # 1716: a04411
            or           a3, a3, a4                            # 1719: 403320
            s32i         a3, a6, 0 /* a3 -> [[arg0+0x20]] */   # 171c: 3906
            srli         a0, a3, 6                             # 171e: 300641
.Lbr233:    bbci         a0, 12, .Lbr234                       # 1721: c7605d
            l8ui         a9, a12, 17                           # 1724: 920c11
            bnei         a9, 3, .Lbr234                        # 1727: 663957
            l8ui         a10, a6, 4 /* [[arg0+0x20]+0x4] */    # 172a: a20604
            srli         a10, a10, 4                           # 172d: a0a441
            blti         a10, 3, .Lbr234                       # 1730: a63a4e
            movi         a4, 0x0000f03f                        # 1733: 41cdff
            extui        a9, a3, 0, 6                          # 1736: 309054
            l8ui         a5, a6, 5 /* [[arg0+0x20]+0x5] */     # 1739: 520605
            or           a10, a0, a8                           # 173c: 80a020
            slli         a10, a10, 6                           # 173f: a0aa11
            extui        a11, a5, 0, 6                         # 1742: 50b054
            or           a9, a9, a10                           # 1745: a09920
            srli         a10, a9, 6                            # 1748: 90a641
            and          a10, a10, a7                          # 174b: 70aa10
            extui        a9, a9, 0, 6                          # 174e: 909054
            slli         a10, a10, 6                           # 1751: a0aa11
            or           a9, a9, a10                           # 1754: a09920
            l8ui         a10, a6, 6 /* [[arg0+0x20]+0x6] */    # 1757: a20606
            slli         a11, a11, 6                           # 175a: a0bb11
            slli         a10, a10, 8                           # 175d: 80aa11
            or           a10, a10, a5                          # 1760: 50aa20
            and          a10, a10, a4                          # 1763: 40aa10
            or           a10, a10, a11                         # 1766: b0aa20
            s8i          a10, a6, 5 /* a10 -> [[arg0+0x20]+0x5] */ # 1769: a24605
            srli         a10, a10, 8                           # 176c: a0a841
            s8i          a10, a6, 6 /* a10 -> [[arg0+0x20]+0x6] */ # 176f: a24606
            l32i         a4, a2, 32 /* [arg0+0x20] */          # 1772: 4882
            s32i         a9, a6, 0 /* a9 -> [[arg0+0x20]] */   # 1774: 9906
            l8ui         a11, a4, 5 /* [[arg0+0x20]+0x5] */    # 1776: b20405
            movi         a5, 192 /* 0x000000c0 */              # 1779: 52a0c0
            and          a11, a11, a5                          # 177c: 50bb10
            s8i          a11, a4, 5 /* a11 -> [[arg0+0x20]+0x5] */ # 177f: b24405
.Lbr234:    mov          a2, a12                               # 1782: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 1784: 0c03
            call0        .Lfunc004                             # 1786: 859afe
.Lbr235:    l8ui         a11, a12, 6                           # 1789: b20c06
            s32i         a11, sp, 0 /* a11 -> [(local0)] */    # 178c: b901
            call0        rand                                  # 178e: 01baffc0
                                                               # 1792: 0000
            l8ui         a3, a12, 5                            # 1794: 320c05
            l32i         a7, sp, 0 /* [(local0)] */            # 1797: 7801
            movi         a6, 31 /* 0x0000001f */               # 1799: 1cf6
            movi         a5, 1 /* 0x00000001 */                # 179b: 0c15
            s8i          a5, a12, 17                           # 179d: 524c11
            sub          a6, a6, a7                            # 17a0: 7066c0
            ssr          a6                                    # 17a3: 000640
            sra          a4, a2                                # 17a6: 2040b1
            l8ui         a2, a12, 4                            # 17a9: 220c04
            extui        a4, a4, 0, 16                         # 17ac: 4040f4
            call0        sdk_wDev_EnableTransmit               # 17af: 01b3ffc0
                                                               # 17b3: 0000
            l32i         a12, sp, 8 /* [(local2)] */           # 17b5: c821
            l32i         a0, sp, 4 /* [(local1)] */            # 17b7: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 17b9: 12c110
            ret                                                # 17bc: 0df0

            .literal_position                                  # 17c0: 00000000

# Function @ .text+0x17c4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc016:  movi         a3, 0 /* 0x00000000 */                # 17c4: 0c03
            addi         sp, sp, -16 /* (local0) */            # 17c6: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 17c9: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 17cb: 0901
            mov          a12, a2 /* arg0 */                    # 17cd: cd02
            call0        .Lfunc004                             # 17cf: 0596fe
            l8ui         a2, a12, 4 /* [arg0+0x4] */           # 17d2: 220c04
            movi         a3, 0 /* 0x00000000 */                # 17d5: 0c03
            movi         a4, 0 /* 0x00000000 */                # 17d7: 0c04
            movi         a0, 1 /* 0x00000001 */                # 17d9: 0c10
            s8i          a0, a12, 17 /* 0x01 -> [arg0+0x11] */ # 17db: 024c11
            call0        sdk_wDev_EnableTransmit               # 17de: 01f8ffc0
                                                               # 17e2: 0000
            l32i         a12, sp, 4 /* [(local1)] */           # 17e4: c811
            l32i         a0, sp, 0 /* [(local0)] */            # 17e6: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 17e8: 12c110
            ret                                                # 17eb: 0df0

            .literal_position                                  # 17f0: 00000000
                                                               # 17f4: 00000000
                                                               # 17f8: 00000000
                                                               # 17fc: 00000000

# Function @ .text+0x1800
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc017:  addi         sp, sp, -16 /* (local0) */            # 1800: 12c1f0
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    # 1803: 3901
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 1805: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 1807: 0911
            mov          a12, a2 /* arg0 */                    # 1809: cd02
            call0        sdk_ppEnqueueTxDone                   # 180b: 01f9ffc0
                                                               # 180f: 0000
            l32i         a3, a12, 32 /* [arg0+0x20] */         # 1811: 388c
            l32i         a0, a3, 0 /* [[arg0+0x20]] */         # 1813: 0803
            bbci         a0, 9, .Lbr236                        # 1815: 97600a
            bbsi         a0, 28, .Lbr236                       # 1818: c7f007
            l32i         a2, a12, 24 /* [arg0+0x18] */         # 181b: 286c
            call0        sdk_rcUpdateTxDone                    # 181d: 01f5ffc0
                                                               # 1821: 0000
.Lbr236:    movi         a2, 4 /* 0x00000004 */                # 1823: 0c42
            movi         a3, 0 /* 0x00000000 */                # 1825: 0c03
            call0        sdk_pp_post                           # 1827: 01f4ffc0
                                                               # 182b: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 182d: 0801
            beqz         a0, .Lbr237                           # 182f: 9c90
            l32i         a2, a12, 32 /* [arg0+0x20] */         # 1831: 288c
            l8ui         a2, a2, 6 /* [[arg0+0x20]+0x6] */     # 1833: 220206
            extui        a2, a2, 4, 3                          # 1836: 202424
            call0        sdk_lmacIsIdle                        # 1839: 050000
            beqz         a2, .Lbr237                           # 183c: 8cc2
            l32i         a2, a12, 32 /* [arg0+0x20] */         # 183e: 288c
            l8ui         a2, a2, 6 /* [[arg0+0x20]+0x6] */     # 1840: 220206
            extui        a2, a2, 4, 3                          # 1843: 202424
            call0        sdk_ppProcessTxQ                      # 1846: 01edffc0
                                                               # 184a: 0000
.Lbr237:    l32i         a12, sp, 8 /* [(local2)] */           # 184c: c821
            l32i         a0, sp, 4 /* [(local1)] */            # 184e: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 1850: 12c110
            ret                                                # 1853: 0df0

            .literal_position                                  # 1858: 00000000
                                                               # 185c: 00000000

# Function @ .text+0x1860
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_lmacRxDone
            .type        sdk_lmacRxDone, @function
sdk_lmacRxDone:
            addi         sp, sp, -16 /* (local0) */            # 1860: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1863: 0901
            call0        sdk_ppEnqueueRxq                      # 1865: 01fcffc0
                                                               # 1869: 0000
            movi         a2, 5 /* 0x00000005 */                # 186b: 0c52
            movi         a3, 0 /* 0x00000000 */                # 186d: 0c03
            call0        sdk_pp_post                           # 186f: 01fbffc0
                                                               # 1873: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 1875: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1877: 12c110
            ret                                                # 187a: 0df0

            .section     .bss, "aw", @nobits

.Ldata001:  .byte        0x00
            .byte        0x00, 0x00, 0x00
            .global      sdk_lmacConfMib
            .type        sdk_lmacConfMib, @object
sdk_lmacConfMib:
            .word        0x00000000                            #    4: 00000000
.Ldata002:  .word        0x00000000                            #    8: 00000000
.Ldata003:  .byte        0x00
.Ldata004:  .byte        0x00
.Ldata005:  .hword       0x0000                                #    e: 0000
.Ldata006:  .hword       0x0000                                #   10: 0000
            .balign      4
.Ldata007:  .hword       0x0000                                #   14: 0000

# NOTE: 4 non-alignment zero bytes skipped.

            .skip        6
.Ldata008:  .hword       0x0000                                #   1c: 0000
.Ldata009:  .hword       0x0000                                #   1e: 0000

# NOTE: 4 non-alignment zero bytes skipped.

            .skip        4
.Ldata010:  .word        0x00000000                            #   24: 00000000
.Ldata011:  .word        0x00000000                            #   28: 00000000
.Ldata012:  .byte        0x00
            .byte        0x00, 0x00, 0x00
.Label001:  .space       288

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 30000000

# Function @ .irom0.text+0x4
            .balign      4
            .global      sdk_lmacInitAc
            .type        sdk_lmacInitAc, @function
sdk_lmacInitAc:
            movi         a7, 0 /* 0x00000000 */                #    4: 0c07
            movi         a9, .Label001                         #    6: 91feff
            addx8        a8, a2, a2                            #    9: 2082b0
            addx4        a8, a8, a9                            #    c: 9088a0
            s8i          a2, a8, 4                             #    f: 224804
            s8i          a3, a8, 5                             #   12: 324805
            s8i          a5, a8, 8                             #   15: 524808
            s8i          a4, a8, 7                             #   18: 424807
            s8i          a4, a8, 6                             #   1b: 424806
            s16i         a6, a8, 24                            #   1e: 62580c
            s8i          a7, a8, 9                             #   21: 724809
            s8i          a7, a8, 10                            #   24: 72480a
            s8i          a7, a8, 17                            #   27: 724811
            s32i         a7, a8, 28                            #   2a: 7978
            s32i         a7, a8, 32                            #   2c: 7988
            ret           /* arg0 */                           #   2e: 0df0

            .literal_position                                  #   30: c00b0000
                                                               #   34: 00000000
                                                               #   38: 00000000
                                                               #   3c: 00000000

# Function @ .irom0.text+0x40
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_lmacInit
            .type        sdk_lmacInit, @function
sdk_lmacInit:
            addi         sp, sp, -16 /* (local0) */            #   40: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   43: 0901
            call0        .Lfunc018                             #   45: c50700
            movi         a2, 2 /* 0x00000002 */                #   48: 0c22
            movi         a3, 3 /* 0x00000003 */                #   4a: 0c33
            movi         a4, 4 /* 0x00000004 */                #   4c: 0c44
            movi         a5, 10 /* 0x0000000a */               #   4e: 0ca5
            movi         a6, 0 /* 0x00000000 */                #   50: 0c06
            call0        sdk_lmacInitAc                        #   52: 050000
            movi         a2, 3 /* 0x00000003 */                #   55: 0c32
            movi         a3, 7 /* 0x00000007 */                #   57: 0c73
            movi         a4, 4 /* 0x00000004 */                #   59: 0c44
            movi         a5, 10 /* 0x0000000a */               #   5b: 0ca5
            movi         a6, 0 /* 0x00000000 */                #   5d: 0c06
            call0        sdk_lmacInitAc                        #   5f: 050000
            movi         a2, 1 /* 0x00000001 */                #   62: 0c12
            movi         a3, 2 /* 0x00000002 */                #   64: 0c23
            movi         a4, 3 /* 0x00000003 */                #   66: 0c34
            movi         a5, 4 /* 0x00000004 */                #   68: 0c45
            movi         a6, 0x00000bc0                        #   6a: 61f1ff
            call0        sdk_lmacInitAc                        #   6d: 050000
            movi         a2, 0 /* 0x00000000 */                #   70: 0c02
            movi         a3, 2 /* 0x00000002 */                #   72: 0c23
            movi         a4, 2 /* 0x00000002 */                #   74: 0c24
            movi         a5, 3 /* 0x00000003 */                #   76: 0c35
            movi         a6, 1504 /* 0x000005e0 */             #   78: 62a5e0
            call0        sdk_lmacInitAc                        #   7b: 050000
            movi         a2, 4 /* 0x00000004 */                #   7e: 0c42
            movi         a3, 2 /* 0x00000002 */                #   80: 0c23
            movi         a4, 4 /* 0x00000004 */                #   82: 0c44
            movi         a5, 10 /* 0x0000000a */               #   84: 0ca5
            movi         a6, 0 /* 0x00000000 */                #   86: 0c06
            call0        sdk_lmacInitAc                        #   88: 050000
            movi         a2, 7 /* 0x00000007 */                #   8b: 0c72
            movi         a3, 2 /* 0x00000002 */                #   8d: 0c23
            movi         a4, 5 /* 0x00000005 */                #   8f: 0c54
            movi         a5, 10 /* 0x0000000a */               #   91: 0ca5
            movi         a6, 0 /* 0x00000000 */                #   93: 0c06
            call0        sdk_lmacInitAc                        #   95: 050000
            movi         a2, .Ldata001                         #   98: 21e7ff
            movi         a3, 8 /* 0x00000008 */                #   9b: 0c83
            s8i          a3, a2, 0 /* 0x08 -> [.Ldata001] */   #   9d: 324200
            l16ui        a2, a2, 28 /* [.Ldata008] */          #   a0: 22120e
            movi         a3, 1 /* 0x00000001 */                #   a3: 0c13
            call0        sdk_RC_SetBasicRate                   #   a5: 01e4ffc0
                                                               #   a9: 0000
            call0        sdk_rcAttach                          #   ab: 01e4ffc0
                                                               #   af: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   b1: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   b3: 12c110
            ret                                                #   b6: 0df0

            .literal_position                                  #   b8: 00000000
                                                               #   bc: 2a090000
                                                               #   c0: ff0f0000

# Function @ .irom0.text+0xc4
            .balign      4
.Lfunc018:  movi         a2, 0x00000fff                        #   c4: 21ffff
            movi         a4, 351 /* 0x0000015f */              #   c7: 42a15f
            movi         a5, 9 /* 0x00000009 */                #   ca: 0c95
            movi         a6, 0x0000092a                        #   cc: 61fcff
            movi         a7, 11 /* 0x0000000b */               #   cf: 0cb7
            movi         a3, .Ldata001                         #   d1: 31f9ff
            movi         a8, 512 /* 0x00000200 */              #   d4: 82a200
            s32i         a8, a3, 4 /* 0x00000200 -> [sdk_lmacConfMib] */ #   d7: 8913
            s32i         a8, a3, 8 /* 0x00000200 -> [.Ldata002] */ #   d9: 8923
            s8i          a7, a3, 13 /* 0x0b -> [.Ldata004] */  #   db: 72430d
            s8i          a7, a3, 12 /* 0x0b -> [.Ldata003] */  #   de: 72430c
            s16i         a6, a3, 16 /* 0x092a -> [.Ldata006] */ #   e1: 625308
            s16i         a6, a3, 14 /* 0x092a -> [.Ldata005] */ #   e4: 625307
            s16i         a5, a3, 20 /* 0x0009 -> [.Ldata007] */ #   e7: 52530a
            s16i         a4, a3, 28 /* 0x015f -> [.Ldata008] */ #   ea: 42530e
            s16i         a2, a3, 30 /* 0x0fff -> [.Ldata009] */ #   ed: 22530f
            ret           /* 0x00000fff */                     #   f0: 0df0

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "%s %u\n"                             #    0: 25732025
                                                               #    4: 750a00
            .balign      4
.Lstr002:   .asciz       "lmac.c"                              #    8: 6c6d6163
                                                               #    c: 2e6300
            .balign      4
.Lstr003:   .asciz       "tx rts error 0x%x\n"                 #   10: 74782072
                                                               #   14: 74732065
                                                               #   18: 72726f72
                                                               #   1c: 20307825
                                                               #   20: 780a00
            .balign      4
.Lstr004:   .asciz       "tx error 0x%x\n"                     #   24: 74782065
                                                               #   28: 72726f72
                                                               #   2c: 20307825
                                                               #   30: 780a00

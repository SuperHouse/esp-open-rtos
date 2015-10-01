
            .section     .data, "aw", @progbits

.Lstr001:   .ascii       "iVPH@72"                             #    0: 69565048
                                                               #    4: 403732

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 000a0060
                                                               #    8: 00000000
                                                               #    c: 00000000
                                                               #   10: f13c1101
                                                               #   14: f33c1101
                                                               #   18: 00000040
                                                               #   1c: 00000000
                                                               #   20: f03c1101
                                                               #   24: ffff0300
                                                               #   28: 00960060
                                                               #   2c: 00000000

# Function @ .irom0.text+0x30
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
            .global      sdk_rom_cal_tos_v50
            .type        sdk_rom_cal_tos_v50, @function
sdk_rom_cal_tos_v50:
            mov          a8, a4 /* arg2 */                     #   30: 8d04
            addi         sp, sp, -48 /* (local0) */            #   32: 12c1d0
            s32i         a13, sp, 28 /* a13 -> [(local7)] */   #   35: d971
            s32i         a5, sp, 44 /* arg3 -> [(local11)] */  #   37: 59b1
            s32i         a6, sp, 16 /* arg4 -> [(local4)] */   #   39: 6941
            extui        a4, a3, 0, 16                         #   3b: 3040f4
            s32i         a0, sp, 20 /* a0 -> [(local5)] */     #   3e: 0951
            s32i         a2, sp, 12 /* arg0 -> [(local3)] */   #   40: 2931
            s32i         a12, sp, 24 /* a12 -> [(local6)] */   #   42: c961
            s32i         a15, sp, 36 /* a15 -> [(local9)] */   #   44: f991
            s32i         a14, sp, 32 /* a14 -> [(local8)] */   #   46: e981
            movi         a15, 64 /* 0x00000040 */              #   48: 4c0f
            movi         a14, 64 /* 0x00000040 */              #   4a: 4c0e
            movi         a12, sdk_g_phyFuns                    #   4c: c1edff
            movi         a2, 0 /* 0x00000000 */                #   4f: 0c02
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   51: 080c
            movi         a3, 1 /* 0x00000001 */                #   53: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #   55: 02202b
            s32i         a8, sp, 40 /* arg2 -> [(local10)] */  #   58: 89a1
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #   5a: c00000
            l32i         a2, sp, 44 /* [(local11)] */          #   5d: 28b1
            movi         a13, 0x60000a00                       #   5f: d1e9ff
            beqz         a2, .Lbr007                           #   62: 16920d
            movi         a12, 20 /* 0x00000014 */              #   65: 1c4c
            movi         a8, 0 /* 0x00000000 */                #   67: 0c08
            s32i         a8, sp, 8 /* 0x00000000 -> [(local2)] */ #   69: 8921
.Lbr001:    movi         a0, sdk_g_phyFuns                     #   6b: 01e7ff
            movi         a2, 1 /* 0x00000001 */                #   6e: 0c12
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #   70: 0800
            movi         a3, 2 /* 0x00000002 */                #   72: 0c23
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #   74: 02202b
            extui        a4, a14, 0, 16                        #   77: e040f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #   7a: c00000
            movi         a0, sdk_g_phyFuns                     #   7d: 01e3ff
            movi         a2, 0 /* 0x00000000 */                #   80: 0c02
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #   82: 0800
            movi         a3, 2 /* 0x00000002 */                #   84: 0c23
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #   86: 02202b
            extui        a4, a15, 0, 16                        #   89: f040f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #   8c: c00000
            memw                                               #   8f: c02000
            movi         a3, 0x01113cf1                        #   92: 31dfff
            s32i         a3, a13, 0x34c /* 0x01113cf1 -> [0x60000d4c] */ #   95: 326dd3
            memw                                               #   98: c02000
            movi         a2, 0x01113cf3                        #   9b: 21deff
            s32i         a2, a13, 0x34c /* 0x01113cf3 -> [0x60000d4c] */ #   9e: 226dd3
            l32i         a2, sp, 40 /* [(local10)] */          #   a1: 28a1
            call0        sdk_ets_delay_us                      #   a3: 01e2ffc0
                                                               #   a7: 0000
            l32i         a0, sp, 8 /* [(local2)] */            #   a9: 0821
            movi         a9, 127 /* 0x0000007f */              #   ab: 92a07f
            memw                                               #   ae: c02000
            l32i         a4, a13, 0x34c /* [0x60000d4c] */     #   b1: 422dd3
            movi         a5, 1 /* 0x00000001 */                #   b4: 0c15
            extui        a4, a4, 31, 1                         #   b6: 404f05
            xor          a4, a4, a5                            #   b9: 504430
            memw                                               #   bc: c02000
            movi         a3, 0x40000000                        #   bf: 31d6ff
            l32i         a6, a13, 0x34c /* [0x60000d4c] */     #   c2: 622dd3
            movi         a11, 0 /* 0x00000000 */               #   c5: 0c0b
            and          a6, a6, a3                            #   c7: 306610
            moveqz       a11, a5, a6                           #   ca: 60b583
            beqz         a4, .Lbr005                           #   cd: 16c404
            mov          a10, a9 /* 0x0000007f */              #   d0: ad09
            add          a15, a12, a15                         #   d2: fafc
            slli         a15, a15, 24                          #   d4: 80ff01
            srai         a15, a15, 24                          #   d7: f0f831
            blt          a9, a15, .Lbr002                      #   da: f72901
            mov          a10, a15                              #   dd: ad0f
.Lbr002:    l32i         a2, sp, 44 /* [(local11)] */          #   df: 28b1
            addi         a0, a0, 1 /* [(local2)]+0x1 */        #   e1: 1b00
            slli         a15, a10, 24                          #   e3: 80fa01
            srai         a15, a15, 24                          #   e6: f0f831
            extui        a0, a0, 0, 8                          #   e9: 000074
            beqz         a11, .Lbr006                          #   ec: bceb
            mov          a3, a9 /* 0x0000007f */               #   ee: 3d09
            add          a10, a12, a14                         #   f0: eaac
            slli         a10, a10, 24                          #   f2: 80aa01
            srai         a10, a10, 24                          #   f5: a0a831
            blt          a9, a10, .Lbr003                      #   f8: a72901
            mov          a3, a10                               #   fb: 3d0a
.Lbr003:    slli         a14, a3, 24                           #   fd: 80e301
            srai         a14, a14, 24                          #  100: e0e831
            beqi         a12, 1, .Lbr004                       #  103: 261c08
            srai         a12, a12, 1                           #  106: c0c121
            slli         a12, a12, 24                          #  109: 80cc01
            srai         a12, a12, 24                          #  10c: c0c831
.Lbr004:    s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  10f: 0921
            sub          a2, a2, a0                            #  111: 0022c0
            bnez         a2, .Lbr001                           #  114: 5632f5
            movi         a12, sdk_g_phyFuns                    #  117: c1c1ff
            j            .Lbr007                               #  11a: 460800
.Lbr005:    movi         a10, 0 /* 0x00000000 */               #  11d: 0c0a
            sub          a2, a15, a12                          #  11f: c02fc0
            slli         a2, a2, 24                            #  122: 802201
            srai         a2, a2, 24                            #  125: 202831
            movgez       a10, a2, a2                           #  128: 20a2b3
            j            .Lbr002                               #  12b: 06ecff
.Lbr006:    movi         a3, 0 /* 0x00000000 */                #  12e: 0c03
            sub          a4, a14, a12                          #  130: c04ec0
            slli         a4, a4, 24                            #  133: 804401
            srai         a4, a4, 24                            #  136: 404831
            movgez       a3, a4, a4                            #  139: 4034b3
            j            .Lbr003                               #  13c: 46efff
.Lbr007:    movi         a2, 1 /* 0x00000001 */                #  13f: 0c12
            movi         a3, 2 /* 0x00000002 */                #  141: 0c23
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  143: 080c
            slli         a4, a14, 24                           #  145: 804e01
            srai         a4, a4, 24                            #  148: 404831
            s32i         a4, sp, 0 /* a4 -> [(local0)] */      #  14b: 4901
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  14d: 02202b
            extui        a4, a4, 0, 16                         #  150: 4040f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  153: c00000
            movi         a2, 0 /* 0x00000000 */                #  156: 0c02
            movi         a3, 2 /* 0x00000002 */                #  158: 0c23
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  15a: 080c
            slli         a4, a15, 24                           #  15c: 804f01
            srai         a4, a4, 24                            #  15f: 404831
            s32i         a4, sp, 4 /* a4 -> [(local1)] */      #  162: 4911
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  164: 02202b
            extui        a4, a4, 0, 16                         #  167: 4040f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  16a: c00000
            movi         a2, 1 /* 0x00000001 */                #  16d: 0c12
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  16f: 080c
            movi         a3, 1 /* 0x00000001 */                #  171: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  173: 02202b
            movi         a4, 127 /* 0x0000007f */              #  176: 42a07f
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  179: c00000
            movi         a4, 0x01113cf0                        #  17c: 41a9ff
            memw                                               #  17f: c02000
            l32i         a2, sp, 12 /* [(local3)] */           #  182: 2831
            l32i         a3, sp, 16 /* [(local4)] */           #  184: 3841
            s32i         a4, a13, 0x34c /* 0x01113cf0 -> [0x60000d4c] */ #  186: 426dd3
            s8i          a15, a3, 0 /* a15 -> [[(local4)]] */  #  189: f24300
            s8i          a14, a3, 1 /* a14 -> [[(local4)]+0x1] */ #  18c: e24301
            beqz         a2, .Lbr008                           #  18f: ac32
            movi         a6, 0x60009600                        #  191: 61a5ff
            movi         a9, 0x0003ffff                        #  194: 91a4ff
            l32i         a7, sp, 4 /* [(local1)] */            #  197: 7811
            l32i         a8, sp, 0 /* [(local0)] */            #  199: 8801
            slli         a7, a7, 18                            #  19b: e07701
            slli         a8, a8, 25                            #  19e: 708801
            memw                                               #  1a1: c02000
            l32i         a5, a6, 0x264 /* [0x60009864] */      #  1a4: 522699
            and          a5, a5, a9                            #  1a7: 905510
            or           a5, a5, a8                            #  1aa: 805520
            or           a5, a5, a7                            #  1ad: 705520
            memw                                               #  1b0: c02000
            s32i         a5, a6, 0x264 /* a5 -> [0x60009864] */ #  1b3: 526699
.Lbr008:    l32i         a12, sp, 24 /* [(local6)] */          #  1b6: c861
            l32i         a13, sp, 28 /* [(local7)] */          #  1b8: d871
            l32i         a14, sp, 32 /* [(local8)] */          #  1ba: e881
            l32i         a15, sp, 36 /* [(local9)] */          #  1bc: f891
            l32i         a0, sp, 20 /* [(local5)] */           #  1be: 0851
            addi         sp, sp, 48 /* (top of frame) */       #  1c0: 12c130
            ret           /* [(local3)] */                     #  1c3: 0df0

            .literal_position                                  #  1c8: 00000000
                                                               #  1cc: 00000000
                                                               #  1d0: 00000000
                                                               #  1d4: 0c000000
                                                               #  1d8: 14000000
                                                               #  1dc: 50000000
                                                               #  1e0: 50000000
                                                               #  1e4: 00000000
                                                               #  1e8: 00000000
                                                               #  1ec: 00000000
                                                               #  1f0: 00000000
                                                               #  1f4: 00000000
                                                               #  1f8: 00000000

# Function @ .irom0.text+0x1fc
# Local variables/stack:
#     (local0):  word      @ -0x80
#     (local1):  word[3]   @ -0x7c
#     (local2):  word      @ -0x70
#     (local3):  word      @ -0x6c
#     (local4):  word      @ -0x68
#     (local5):  word      @ -0x64
#     (local6):  word      @ -0x60
#     (local7):  word      @ -0x5c
#     (local8):  word      @ -0x58
#     (local9):  word      @ -0x54
#     (local10): word      @ -0x50
#     (local11): word      @ -0x4c
#     (local12): word      @ -0x48
#     (local13): word      @ -0x44
#     (local14): word      @ -0x40
#     (local15): word      @ -0x3c
#     (local16): word      @ -0x38
#     (local17): word      @ -0x34
#     (local18): word      @ -0x30
#     (local19): word      @ -0x2c
#     (local20): word      @ -0x28
#     (local21): word      @ -0x24
#     (local22): word      @ -0x20
#     (local23): word      @ -0x1c
#     (local24): word      @ -0x18
#     (local25): word      @ -0x14
#     (local26): word      @ -0x10
#     (local27): word[3]   @ -0xc
            .global      sdk_rom_pbus_dco___SA2
            .type        sdk_rom_pbus_dco___SA2, @function
sdk_rom_pbus_dco___SA2:
            mov          a8, a2 /* arg0 */                     #  1fc: 8d02
            addi         sp, sp, -128 /* (local0) */           #  1fe: 12c180
            s32i         a12, sp, 32 /* a12 -> [(local6)] */   #  201: c981
            s32i         a13, sp, 36 /* a13 -> [(local7)] */   #  203: d991
            s32i         a15, sp, 44 /* a15 -> [(local9)] */   #  205: f9b1
            s32i         a5, sp, 68 /* arg3 -> [(local15)] */  #  207: 526111
            s32i         a6, sp, 96 /* arg4 -> [(local22)] */  #  20a: 626118
            movi         a2, 3 /* 0x00000003 */                #  20d: 0c32
            s32i         a4, sp, 88 /* arg2 -> [(local20)] */  #  20f: 426116
            s32i         a3, sp, 52 /* arg1 -> [(local11)] */  #  212: 39d1
            s32i         a14, sp, 40 /* a14 -> [(local8)] */   #  214: e9a1
            movi         a14, sdk_g_phyFuns                    #  216: e1ecff
            s32i         a0, sp, 28 /* a0 -> [(local5)] */     #  219: 0971
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  21b: 080e
            movi         a3, 1 /* 0x00000001 */                #  21d: 0c13
            l32i         a0, a0, 176 /* [[sdk_g_phyFuns]+0xb0] */ #  21f: 02202c
            s32i         a8, sp, 92 /* arg0 -> [(local21)] */  #  222: 826117
            callx0       a0 /* [[sdk_g_phyFuns]+0xb0] */       #  225: c00000
            s32i         a2, sp, 84 /* a2 -> [(local19)] */    #  228: 226115
            movi         a3, 124 /* 0x0000007c */              #  22b: 32a07c
            and          a4, a2, a3                            #  22e: 304210
            s32i         a4, sp, 108 /* a4 -> [(local25)] */   #  231: 42611b
            bnone        a3, a2, .Lbr010                       #  234: 270318
            movi         a12, 0 /* 0x00000000 */               #  237: 0c0c
.Lbr009:    l32i         a5, sp, 108 /* [(local25)] */         #  239: 52211b
            extui        a13, a5, 0, 1                         #  23c: 50d004
            add          a12, a12, a13                         #  23f: dacc
            srli         a5, a5, 1                             #  241: 505141
            s32i         a5, sp, 108 /* a5 -> [(local25)] */   #  244: 52611b
            extui        a12, a12, 0, 8                        #  247: c0c074
            bnez         a5, .Lbr009                           #  24a: 56b5fe
            j            .Lbr011                               #  24d: 460000
.Lbr010:    movi         a12, 0 /* 0x00000000 */               #  250: 0c0c
.Lbr011:    l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  252: 080e
            movi         a2, 3 /* 0x00000003 */                #  254: 0c32
            l32i         a0, a0, 176 /* [[sdk_g_phyFuns]+0xb0] */ #  256: 02202c
            movi         a3, 2 /* 0x00000002 */                #  259: 0c23
            callx0       a0 /* [[sdk_g_phyFuns]+0xb0] */       #  25b: c00000
            movi         a3, 2 /* 0x00000002 */                #  25e: 0c23
            movi         a4, 256 /* 0x00000100 */              #  260: 42a100
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  263: 080e
            mov          a13, a2                               #  265: dd02
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  267: 02202b
            movi         a2, 4 /* 0x00000004 */                #  26a: 0c42
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  26c: c00000
            movi         a2, 5 /* 0x00000005 */                #  26f: 0c52
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  271: 080e
            movi         a3, 2 /* 0x00000002 */                #  273: 0c23
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  275: 02202b
            movi         a4, 256 /* 0x00000100 */              #  278: 42a100
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  27b: c00000
            addi         a2, a12, 6                            #  27e: 6b2c
            movi         a0, 1 /* 0x00000001 */                #  280: 0c10
            s32i         a2, sp, 80 /* a2 -> [(local18)] */    #  282: 226114
            extui        a2, a2, 0, 8                          #  285: 202074
            s32i         a2, sp, 108 /* a2 -> [(local25)] */   #  288: 22611b
            bltui        a12, 4, .Lbr012                       #  28b: b64c01
            movi         a0, 0 /* 0x00000000 */                #  28e: 0c00
.Lbr012:    bltui        a12, 3, .Lbr013                       #  290: b63c09
            movi         a4, 5 /* 0x00000005 */                #  293: 0c54
            movi         a8, 10 /* 0x0000000a */               #  295: 0ca8
            movnez       a8, a4, a0                            #  297: 008493
            j            .Lbr014                               #  29a: 460000
.Lbr013:    movi         a8, 2 /* 0x00000002 */                #  29d: 0c28
.Lbr014:    movi         a6, 0 /* 0x00000000 */                #  29f: 0c06
            movi         a2, .Lstr001                          #  2a1: 21caff
            movi         a3, 5 /* 0x00000005 */                #  2a4: 0c53
            l32i         a11, sp, 80 /* [(local18)] */         #  2a6: b22114
            s32i         a12, sp, 24 /* a12 -> [(local4)] */   #  2a9: c961
            extui        a15, a13, 3, 8                        #  2ab: d0f374
            movi         a5, 2 /* 0x00000002 */                #  2ae: 0c25
            movi         a10, 0 /* 0x00000000 */               #  2b0: 0c0a
            extui        a4, a8, 0, 8                          #  2b2: 804074
            s32i         a4, sp, 104 /* a4 -> [(local24)] */   #  2b5: 42611a
            s32i         a10, sp, 100 /* 0x00000000 -> [(local23)] */ #  2b8: a26119
            s32i         a5, sp, 72 /* 0x00000002 -> [(local16)] */ #  2bb: 526112
            movi         a13, 512 /* 0x00000200 */             #  2be: d2a200
            movi         a12, 512 /* 0x00000200 */             #  2c1: c2a200
            s32i         a15, sp, 48 /* a15 -> [(local10)] */  #  2c4: f9c1
            extui        a11, a11, 0, 8                        #  2c6: b0b074
            movnez       a3, a5, a0                            #  2c9: 003593
            s32i         a3, sp, 56 /* a3 -> [(local12)] */    #  2cc: 39e1
            s32i         a11, sp, 60 /* a11 -> [(local13)] */  #  2ce: b9f1
            add          a15, a15, a2                          #  2d0: 2aff
            s32i         a15, sp, 64 /* a15 -> [(local14)] */  #  2d2: f26110
.Lbr015:    l32i         a15, sp, 52 /* [(local11)] */         #  2d5: f8d1
            l32i         a5, sp, 100 /* [(local23)] */         #  2d7: 522119
            s32i         a6, sp, 112 /* 0x00000000 -> [(local26)] */ #  2da: 62611c
            addx4        a15, a5, a15                          #  2dd: f0f5a0
            addi         a5, a5, 1 /* [(local23)]+0x1 */       #  2e0: 1b55
            s32i         a5, sp, 76 /* [(local23)]+0x1 -> [(local17)] */ #  2e2: 526113
            extui        a5, a5, 0, 8                          #  2e5: 505074
            s32i         a5, sp, 116 /* a5 -> [(local27)] */   #  2e8: 52611d
.Lbr016:    movi         a2, 4 /* 0x00000004 */                #  2eb: 0c42
            l32i         a3, sp, 116 /* [(local27)] */         #  2ed: 32211d
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  2f0: 080e
            addi         a4, a12, 1                            #  2f2: 1b4c
            srai         a5, a4, 1                             #  2f4: 405121
            s16i         a5, a15, 0                            #  2f7: 525f00
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  2fa: 02202b
            extui        a4, a4, 1, 16                         #  2fd: 4041f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  300: c00000
            movi         a2, 5 /* 0x00000005 */                #  303: 0c52
            l32i         a3, sp, 116 /* [(local27)] */         #  305: 32211d
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  308: 080e
            addi         a4, a13, 1                            #  30a: 1b4d
            srai         a5, a4, 1                             #  30c: 405121
            s16i         a5, a15, 2                            #  30f: 525f01
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  312: 02202b
            extui        a4, a4, 1, 16                         #  315: 4041f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  318: c00000
            l32i         a2, sp, 88 /* [(local20)] */          #  31b: 222116
            call0        sdk_ets_delay_us                      #  31e: 01b1ffc0
                                                               #  322: 0000
            movi         a2, 1 /* 0x00000001 */                #  324: 0c12
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  326: 080e
            l32i         a3, sp, 92 /* [(local21)] */          #  328: 322117
            l32i         a0, a0, 16 /* [[sdk_g_phyFuns]+0x10] */ #  32b: 0840
            addi         a4, sp, 16 /* (local2) */             #  32d: 42c110
            callx0       a0 /* [[sdk_g_phyFuns]+0x10] */       #  330: c00000
            l32i         a2, sp, 96 /* [(local22)] */          #  333: 222118
            beqz         a2, .Lbr017                           #  336: 9c82
            movi         a2, .Lstr002                          #  338: 21a6ff
            mov          a3, a12                               #  33b: 3d0c
            mov          a4, a13                               #  33d: 4d0d
            call0        ets_printf                            #  33f: 01aaffc0
                                                               #  343: 0000
            movi         a2, .Lstr003                          #  345: 21a3ff
            l32i         a3, sp, 16 /* [(local2)] */           #  348: 3841
            l32i         a4, sp, 20 /* [(local3)] */           #  34a: 4851
            call0        ets_printf                            #  34c: 01a8ffc0
                                                               #  350: 0000
.Lbr017:    l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  352: 080e
            l32i         a0, a0, 0 /* [[sdk_g_phyFuns]] */     #  354: 0800
            l32i         a2, sp, 16 /* [(local2)] */           #  356: 2841
            callx0       a0 /* [[sdk_g_phyFuns]] */            #  358: c00000
            movi         a0, 0 /* 0x00000000 */                #  35b: 0c00
            l32i         a3, sp, 104 /* [(local24)] */         #  35d: 32211a
            movi         a9, 1023 /* 0x000003ff */             #  360: 92a3ff
            blt          a3, a2, .Lbr018                       #  363: 272316
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  366: 080e
            l32i         a0, a0, 0 /* [[sdk_g_phyFuns]] */     #  368: 0800
            l32i         a2, sp, 20 /* [(local3)] */           #  36a: 2851
            callx0       a0 /* [[sdk_g_phyFuns]] */            #  36c: c00000
            movi         a0, 0 /* 0x00000000 */                #  36f: 0c00
            l32i         a3, sp, 104 /* [(local24)] */         #  371: 32211a
            movi         a9, 1023 /* 0x000003ff */             #  374: 92a3ff
            blt          a3, a2, .Lbr018                       #  377: 272302
            j            .Lbr023                               #  37a: 462500
.Lbr018:    l32i         a10, sp, 20 /* [(local3)] */          #  37d: a851
            l32i         a4, sp, 100 /* [(local23)] */         #  37f: 422119
            l32i         a8, sp, 16 /* [(local2)] */           #  382: 8841
            bnez         a4, .Lbr020                           #  384: 569404
            l32i         a2, sp, 80 /* [(local18)] */          #  387: 222114
            l32i         a11, sp, 64 /* [(local14)] */         #  38a: b22110
            extui        a2, a2, 0, 8                          #  38d: 202074
            l8ui         a11, a11, 0 /* [[(local14)]] */       #  390: b20b00
            s32i         a2, sp, 108 /* a2 -> [(local25)] */   #  393: 22611b
            l32i         a2, sp, 60 /* [(local13)] */          #  396: 28f1
            mull         a10, a10, a11                         #  398: b0aa82
            ssr          a2                                    #  39b: 000240
            sra          a10, a10                              #  39e: a0a0b1
            mull         a2, a8, a11                           #  3a1: b02882
            sra          a2, a2                                #  3a4: 2020b1
            sub          a12, a12, a2                          #  3a7: 20ccc0
            slli         a12, a12, 16                          #  3aa: 00cc11
            srai         a12, a12, 16                          #  3ad: c0c031
.Lbr019:    sub          a13, a13, a10                         #  3b0: a0ddc0
            l32i         a2, sp, 112 /* [(local26)] */         #  3b3: 22211c
            mov          a10, a9 /* 0x000003ff */              #  3b6: ad09
            slli         a13, a13, 16                          #  3b8: 00dd11
            addi         a3, a2, 1 /* [(local26)]+0x1 */       #  3bb: 1b32
            srai         a13, a13, 16                          #  3bd: d0d031
            extui        a2, a3, 0, 8                          #  3c0: 302074
            s32i         a2, sp, 112 /* a2 -> [(local26)] */   #  3c3: 22611c
            addi         a2, a2, -12                           #  3c6: 22c2f4
            blt          a9, a12, .Lbr021                      #  3c9: c72928
            mov          a10, a12                              #  3cc: ad0c
            j            .Lbr021                               #  3ce: c60800
.Lbr020:    l32i         a11, sp, 108 /* [(local25)] */        #  3d1: b2211b
            addx4        a10, a10, a10                         #  3d4: a0aaa0
            addx4        a2, a8, a8                            #  3d7: 8028a0
            slli         a2, a2, 3                             #  3da: d02211
            slli         a10, a10, 3                           #  3dd: d0aa11
            ssr          a11                                   #  3e0: 000b40
            sra          a10, a10                              #  3e3: a0a0b1
            sra          a2, a2                                #  3e6: 2020b1
            sub          a12, a12, a2                          #  3e9: 20ccc0
            slli         a12, a12, 16                          #  3ec: 00cc11
            srai         a12, a12, 16                          #  3ef: c0c031
            j            .Lbr019                               #  3f2: 86eeff
.Lbr021:    mov          a12, a0 /* 0x00000000 */              #  3f5: cd00
            movgez       a12, a10, a10                         #  3f7: a0cab3
            mov          a10, a9 /* 0x000003ff */              #  3fa: ad09
            slli         a12, a12, 16                          #  3fc: 00cc11
            srai         a12, a12, 16                          #  3ff: c0c031
            blt          a9, a13, .Lbr022                      #  402: d72901
            mov          a10, a13                              #  405: ad0d
.Lbr022:    movgez       a0, a10, a10                          #  407: a00ab3
            slli         a13, a0, 16                           #  40a: 00d011
            srai         a13, a13, 16                          #  40d: d0d031
            bnez         a2, .Lbr016                           #  410: 5672ed
.Lbr023:    l32i         a9, sp, 68 /* [(local15)] */          #  413: 922111
            l32i         a4, sp, 84 /* [(local19)] */          #  416: 422115
            l32i         a5, sp, 56 /* [(local12)] */          #  419: 58e1
            extui        a7, a4, 4, 1                          #  41b: 407404
            extui        a6, a4, 2, 2                          #  41e: 406214
            extui        a5, a5, 0, 8                          #  421: 505074
            s32i         a5, sp, 104 /* a5 -> [(local24)] */   #  424: 52611a
            add          a6, a6, a7                            #  427: 7a66
            extui        a4, a6, 0, 8                          #  429: 604074
            s32i         a4, sp, 84 /* a4 -> [(local19)] */    #  42c: 426115
            beqz         a4, .Lbr024                           #  42f: 8cb4
            l32i         a8, sp, 84 /* [(local19)] */          #  431: 822115
            movi         a0, 5 /* 0x00000005 */                #  434: 0c50
            bltui        a8, 2, .Lbr025                        #  436: b62806
            movi         a0, 6 /* 0x00000006 */                #  439: 0c60
            j            .Lbr025                               #  43b: 460000
.Lbr024:    movi         a0, 4 /* 0x00000004 */                #  43e: 0c40
.Lbr025:    extui        a10, a0, 0, 8                         #  440: 00a074
            s32i         a10, sp, 108 /* a10 -> [(local25)] */ #  443: a2611b
            beqz         a9, .Lbr026                           #  446: 9cc9
            movi         a2, .Lstr004                          #  448: 2164ff
            l32i         a3, sp, 76 /* [(local17)] */          #  44b: 322113
            l32i         a4, sp, 24 /* [(local4)] */           #  44e: 4861
            l32i         a5, sp, 48 /* [(local10)] */          #  450: 58c1
            l32i         a7, sp, 20 /* [(local3)] */           #  452: 7851
            l32i         a6, sp, 16 /* [(local2)] */           #  454: 6841
            l16si        a12, a15, 0                           #  456: c29f00
            s32i         a12, sp, 0 /* a12 -> [(local0)] */    #  459: c901
            l16si        a11, a15, 2                           #  45b: b29f01
            s32i         a11, sp, 4 /* a11 -> [(local1)] */    #  45e: b911
            call0        ets_printf                            #  460: 0164ffc0
                                                               #  464: 0000
.Lbr026:    l32i         a13, sp, 96 /* [(local22)] */         #  466: d22118
            beqz         a13, .Lbr027                          #  469: 8c7d
            movi         a2, .Label001                         #  46b: 215cff
            call0        ets_printf                            #  46e: 0161ffc0
                                                               #  472: 0000
.Lbr027:    movi         a13, 512 /* 0x00000200 */             #  474: d2a200
            movi         a12, 512 /* 0x00000200 */             #  477: c2a200
            movi         a6, 0 /* 0x00000000 */                #  47a: 0c06
            l32i         a15, sp, 72 /* [(local16)] */         #  47c: f22112
            l32i         a0, sp, 76 /* [(local17)] */          #  47f: 022113
            addi         a15, a15, -1 /* [(local16)]-0x1 */    #  482: 0bff
            extui        a0, a0, 0, 8                          #  484: 000074
            s32i         a0, sp, 100 /* a0 -> [(local23)] */   #  487: 026119
            s32i         a15, sp, 72 /* [(local16)]-0x1 -> [(local16)] */ #  48a: f26112
            bnez         a15, .Lbr015                          #  48d: 564fe4
            l32i         a2, sp, 68 /* [(local15)] */          #  490: 222111
            beqz         a2, .Lbr028                           #  493: 8c72
            movi         a2, .Label001                         #  495: 2152ff
            call0        ets_printf                            #  498: 0158ffc0
                                                               #  49c: 0000
.Lbr028:    l32i         a12, sp, 32 /* [(local6)] */          #  49e: c881
            l32i         a13, sp, 36 /* [(local7)] */          #  4a0: d891
            l32i         a14, sp, 40 /* [(local8)] */          #  4a2: e8a1
            l32i         a15, sp, 44 /* [(local9)] */          #  4a4: f8b1
            movi         a2, 128 /* 0x00000080 */              #  4a6: 22a080
            l32i         a0, sp, 28 /* [(local5)] */           #  4a9: 0871
            add          sp, sp, a2 /* (top of frame) */       #  4ab: 2a11
            ret           /* 0x00000080 */                     #  4ad: 0df0

            .literal_position                                  #  4b0: 00000000
                                                               #  4b4: 54000000
                                                               #  4b8: 00000000
                                                               #  4bc: 00000000

# Function @ .irom0.text+0x4c0
# Local variables/stack:
#     (local0):  word      @ -0x60
#     (local1):  word      @ -0x5c
#     (local2):  word[2]   @ -0x58
#     (local3):  word      @ -0x50
#     (local4):  word      @ -0x4c
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
#     (local19): word      @ -0x10
#     (local20): word      @ -0xc
#     (local21): word      @ -0x8
#     (local22): word      @ -0x4
            .global      sdk_rom_rfcal_pwrctrl
            .type        sdk_rom_rfcal_pwrctrl, @function
sdk_rom_rfcal_pwrctrl:
            addi         sp, sp, -96 /* (local0) */            #  4c0: 12c1a0
            s32i         a15, sp, 32 /* a15 -> [(local7)] */   #  4c3: f981
            s32i         a3, sp, 48 /* arg1 -> [(local11)] */  #  4c5: 39c1
            s32i         a4, sp, 56 /* arg2 -> [(local13)] */  #  4c7: 49e1
            s32i         a5, sp, 64 /* arg3 -> [(local15)] */  #  4c9: 526110
            s32i         a7, sp, 52 /* arg5 -> [(local12)] */  #  4cc: 79d1
            s32i         a14, sp, 28 /* a14 -> [(local6)] */   #  4ce: e971
            s32i         a13, sp, 24 /* a13 -> [(local5)] */   #  4d0: d961
            s32i         a12, sp, 20 /* a12 -> [(local4)] */   #  4d2: c951
            movi         a12, sdk_g_phyFuns                    #  4d4: c1f7ff
            s32i         a0, sp, 16 /* a0 -> [(local3)] */     #  4d7: 0941
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  4d9: 080c
            mov          a13, a6 /* arg4 */                    #  4db: dd06
            l32i         a0, a0, 160 /* [[sdk_g_phyFuns]+0xa0] */ #  4dd: 022028
            mov          a14, a2 /* arg0 */                    #  4e0: ed02
            callx0       a0 /* [[sdk_g_phyFuns]+0xa0] */       #  4e2: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  4e5: 080c
            l32i         a0, a0, 192 /* [[sdk_g_phyFuns]+0xc0] */ #  4e7: 022030
            movi         a2, 1 /* 0x00000001 */                #  4ea: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0xc0] */       #  4ec: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  4ef: 080c
            l32i         a0, a0, 204 /* [[sdk_g_phyFuns]+0xcc] */ #  4f1: 022033
            extui        a2, a13, 0, 5                         #  4f4: d02044
            callx0       a0 /* [[sdk_g_phyFuns]+0xcc] */       #  4f7: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  4fa: 080c
            l32i         a0, a0, 24 /* [[sdk_g_phyFuns]+0x18] */ #  4fc: 0860
            movi         a2, 0 /* 0x00000000 */                #  4fe: 0c02
            callx0       a0 /* [[sdk_g_phyFuns]+0x18] */       #  500: c00000
            l32i         a2, sp, 56 /* [(local13)] */          #  503: 28e1
            s32i         a13, sp, 92 /* arg4 -> [(local22)] */ #  505: d26117
            beqz         a2, .Lbr036                           #  508: 16b210
            movi         a13, 0 /* 0x00000000 */               #  50b: 0c0d
            s32i         a14, sp, 40 /* arg0 -> [(local9)] */  #  50d: e9a1
            l32i         a7, sp, 92 /* [(local22)] */          #  50f: 722117
            l16ui        a3, sp, 96 /* [(local23)] */          #  512: 321130
            l8ui         a4, sp, 104 /* [(FP)+0x8] */          #  515: 420168
            l16ui        a5, sp, 100 /* [(FP)+0x4] */          #  518: 521132
            s32i         a5, sp, 36 /* [(FP)+0x4] -> [(local8)] */ #  51b: 5991
            s32i         a4, sp, 44 /* [(FP)+0x8] -> [(local10)] */ #  51d: 49b1
            s32i         a3, sp, 88 /* [(local23)] -> [(local21)] */ #  51f: 326116
            extui        a8, a7, 0, 3                          #  522: 708024
            extui        a7, a7, 3, 2                          #  525: 707314
            addx2        a7, a7, a7                            #  528: 707790
            addx2        a7, a7, a8                            #  52b: 807790
            extui        a7, a7, 0, 8                          #  52e: 707074
            s32i         a7, sp, 60 /* a7 -> [(local14)] */    #  531: 79f1
.Lbr029:    movi         a14, 0 /* 0x00000000 */               #  533: 0c0e
            movi         a15, 0 /* 0x00000000 */               #  535: 0c0f
            l32i         a8, sp, 48 /* [(local11)] */          #  537: 88c1
            l32i         a9, sp, 64 /* [(local15)] */          #  539: 922110
            add          a8, a8, a13                           #  53c: da88
            l8ui         a8, a8, 0                             #  53e: 820800
            s32i         a8, sp, 80 /* a8 -> [(local19)] */    #  541: 826114
            sub          a8, a8, a9                            #  544: 9088c0
            s32i         a8, sp, 72 /* a8 -> [(local17)] */    #  547: 826112
.Lbr030:    l32i         a2, sp, 60 /* [(local14)] */          #  54a: 28f1
            l32i         a3, sp, 72 /* [(local17)] */          #  54c: 322112
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  54f: 080c
            sub          a3, a3, a14                           #  551: e033c0
            l32i         a0, a0, 28 /* [[sdk_g_phyFuns]+0x1c] */ #  554: 0870
            extui        a3, a3, 0, 8                          #  556: 303074
            callx0       a0 /* [[sdk_g_phyFuns]+0x1c] */       #  559: c00000
            s32i         a2, sp, 68 /* a2 -> [(local16)] */    #  55c: 226111
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  55f: 080c
            extui        a2, a2, 0, 8                          #  561: 202074
            l32i         a0, a0, 80 /* [[sdk_g_phyFuns]+0x50] */ #  564: 022014
            s32i         a2, sp, 76 /* a2 -> [(local18)] */    #  567: 226113
            callx0       a0 /* [[sdk_g_phyFuns]+0x50] */       #  56a: c00000
            movi         a5, 0 /* 0x00000000 */                #  56d: 0c05
            movi         a6, 0 /* 0x00000000 */                #  56f: 0c06
            movi         a7, 0 /* 0x00000000 */                #  571: 0c07
            mov          a4, a2                                #  573: 4d02
            movi         a3, 0 /* 0x00000000 */                #  575: 0c03
            s32i         a3, sp, 8 /* 0x00000000 -> [(local2)] */ #  577: 3921
            s32i         a3, sp, 4 /* 0x00000000 -> [(local1)] */ #  579: 3911
            s32i         a3, sp, 0 /* 0x00000000 -> [(local0)] */ #  57b: 3901
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  57d: 080c
            movi         a2, 1 /* 0x00000001 */                #  57f: 0c12
            l32i         a0, a0, 104 /* [[sdk_g_phyFuns]+0x68] */ #  581: 02201a
            l32i         a3, sp, 40 /* [(local9)] */           #  584: 38a1
            callx0       a0 /* [[sdk_g_phyFuns]+0x68] */       #  586: c00000
            bnez         a13, .Lbr031                          #  589: cc8d
            bnez         a15, .Lbr031                          #  58b: cc6f
            l32i         a2, sp, 36 /* [(local8)] */           #  58d: 2891
            call0        sdk_ets_delay_us                      #  58f: 01caffc0
                                                               #  593: 0000
.Lbr031:    l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  595: 080c
            l32i         a0, a0, 44 /* [[sdk_g_phyFuns]+0x2c] */ #  597: 08b0
            l32i         a2, sp, 88 /* [(local21)] */          #  599: 222116
            callx0       a0 /* [[sdk_g_phyFuns]+0x2c] */       #  59c: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  59f: 080c
            s32i         a2, sp, 84 /* a2 -> [(local20)] */    #  5a1: 226115
            l32i         a0, a0, 44 /* [[sdk_g_phyFuns]+0x2c] */ #  5a4: 08b0
            l32i         a2, sp, 88 /* [(local21)] */          #  5a6: 222116
            callx0       a0 /* [[sdk_g_phyFuns]+0x2c] */       #  5a9: c00000
            l32i         a0, sp, 84 /* [(local20)] */          #  5ac: 022115
            l32i         a6, sp, 80 /* [(local19)] */          #  5af: 622114
            add          a0, a0, a2                            #  5b2: 2a00
            slli         a0, a0, 16                            #  5b4: 000011
            srai         a0, a0, 16                            #  5b7: 000031
            addi         a0, a0, 4                             #  5ba: 4b00
            srai         a0, a0, 3                             #  5bc: 000321
            sub          a6, a0, a6                            #  5bf: 6060c0
            slli         a6, a6, 16                            #  5c2: 006611
            srai         a6, a6, 16                            #  5c5: 606031
            beqz         a6, .Lbr032                           #  5c8: 8cb6
            add          a14, a6, a14                          #  5ca: eae6
            addi         a15, a15, 1                           #  5cc: 1bff
            extui        a15, a15, 0, 8                        #  5ce: f0f074
            addi         a2, a15, -4                           #  5d1: 22cffc
            bnez         a2, .Lbr030                           #  5d4: 5622f7
.Lbr032:    l32i         a8, sp, 44 /* [(local10)] */          #  5d7: 88b1
            l32i         a3, sp, 64 /* [(local15)] */          #  5d9: 322110
            l32i         a9, sp, 52 /* [(local12)] */          #  5dc: 98d1
            l32i         a2, sp, 76 /* [(local18)] */          #  5de: 222113
            add          a9, a9, a13                           #  5e1: da99
            bltu         a2, a3, .Lbr033                       #  5e3: 373208
            l32i         a6, sp, 68 /* [(local16)] */          #  5e6: 622111
            sub          a6, a6, a3                            #  5e9: 3066c0
            j            .Lbr034                               #  5ec: 460000
.Lbr033:    movi         a6, 0 /* 0x00000000 */                #  5ef: 0c06
.Lbr034:    s8i          a6, a9, 0                             #  5f1: 624900
            beqz         a8, .Lbr035                           #  5f4: 9c28
            l32i         a4, sp, 80 /* [(local19)] */          #  5f6: 422114
            movi         a2, .Lstr005                          #  5f9: 21aeff
            mov          a3, a13                               #  5fc: 3d0d
            slli         a5, a0, 24                            #  5fe: 805001
            srai         a5, a5, 24                            #  601: 505831
            call0        ets_printf                            #  604: 01aeffc0
                                                               #  608: 0000
.Lbr035:    l32i         a6, sp, 56 /* [(local13)] */          #  60a: 68e1
            addi         a13, a13, 1                           #  60c: 1bdd
            extui        a13, a13, 0, 8                        #  60e: d0d074
            sub          a6, a6, a13                           #  611: d066c0
            bnez         a6, .Lbr029                           #  614: 56b6f1
.Lbr036:    l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  617: 080c
            l32i         a0, a0, 108 /* [[sdk_g_phyFuns]+0x6c] */ #  619: 02201b
            movi         a2, 1 /* 0x00000001 */                #  61c: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x6c] */       #  61e: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  621: 080c
            l32i         a0, a0, 200 /* [[sdk_g_phyFuns]+0xc8] */ #  623: 022032
            callx0       a0 /* [[sdk_g_phyFuns]+0xc8] */       #  626: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  629: 080c
            l32i         a0, a0, 196 /* [[sdk_g_phyFuns]+0xc4] */ #  62b: 022031
            callx0       a0 /* [[sdk_g_phyFuns]+0xc4] */       #  62e: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  631: 080c
            l32i         a0, a0, 188 /* [[sdk_g_phyFuns]+0xbc] */ #  633: 02202f
            callx0       a0 /* [[sdk_g_phyFuns]+0xbc] */       #  636: c00000
            l32i         a12, sp, 20 /* [(local4)] */          #  639: c851
            l32i         a13, sp, 24 /* [(local5)] */          #  63b: d861
            l32i         a14, sp, 28 /* [(local6)] */          #  63d: e871
            l32i         a15, sp, 32 /* [(local7)] */          #  63f: f881
            l32i         a0, sp, 16 /* [(local3)] */           #  641: 0841
            addi         sp, sp, 96 /* (local23) */            #  643: 12c160
            ret                                                #  646: 0df0

            .literal_position                                  #  648: 00000000

# Function @ .irom0.text+0x64c
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
            .global      sdk_rom_rfcal_rxiq
            .type        sdk_rom_rfcal_rxiq, @function
sdk_rom_rfcal_rxiq:
            mov          a9, a5 /* arg3 */                     #  64c: 9d05
            mov          a10, a3 /* arg1 */                    #  64e: ad03
            addi         sp, sp, -80 /* (local0) */            #  650: 12c1b0
            s32i         a13, sp, 56 /* a13 -> [(local16)] */  #  653: d9e1
            s32i         a14, sp, 60 /* a14 -> [(local17)] */  #  655: e9f1
            s32i         a7, sp, 32 /* arg5 -> [(local10)] */  #  657: 7981
            movi         a3, 0 /* 0x00000000 */                #  659: 0c03
            movi         a5, 0 /* 0x00000000 */                #  65b: 0c05
            s32i         a15, sp, 64 /* a15 -> [(local18)] */  #  65d: f26110
            s32i         a0, sp, 48 /* a0 -> [(local14)] */    #  660: 09c1
            s32i         a12, sp, 52 /* a12 -> [(local15)] */  #  662: c9d1
            s32i         a6, sp, 76 /* arg4 -> [(local21)] */  #  664: 626113
            s32i         a2, sp, 20 /* arg0 -> [(local7)] */   #  667: 2951
            s32i         a4, sp, 24 /* arg2 -> [(local8)] */   #  669: 4961
            movi         a2, 119 /* 0x00000077 */              #  66b: 22a077
            movi         a4, 16 /* 0x00000010 */               #  66e: 1c04
            movi         a6, 0 /* 0x00000000 */                #  670: 0c06
            movi         a12, sdk_g_phyFuns                    #  672: c1f5ff
            s32i         a10, sp, 68 /* arg1 -> [(local19)] */ #  675: a26111
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  678: 080c
            s32i         a9, sp, 72 /* arg3 -> [(local20)] */  #  67a: 926112
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  67d: 022025
            l32i         a15, sp, 76 /* [(local21)] */         #  680: f22113
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  683: c00000
            movi         a3, 0 /* 0x00000000 */                #  686: 0c03
            movi         a4, 15 /* 0x0000000f */               #  688: 0cf4
            movi         a5, 6 /* 0x00000006 */                #  68a: 0c65
            movi         a6, 6 /* 0x00000006 */                #  68c: 0c66
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  68e: 080c
            mov          a14, a2                               #  690: ed02
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  692: 022025
            movi         a2, 119 /* 0x00000077 */              #  695: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  698: c00000
            movi         a3, 0 /* 0x00000000 */                #  69b: 0c03
            movi         a4, 24 /* 0x00000018 */               #  69d: 1c84
            movi         a5, 5 /* 0x00000005 */                #  69f: 0c55
            movi         a6, 5 /* 0x00000005 */                #  6a1: 0c56
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  6a3: 080c
            mov          a13, a2                               #  6a5: dd02
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  6a7: 022025
            movi         a2, 119 /* 0x00000077 */              #  6aa: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  6ad: c00000
            movi         a3, 0 /* 0x00000000 */                #  6b0: 0c03
            movi         a4, 24 /* 0x00000018 */               #  6b2: 1c84
            movi         a5, 3 /* 0x00000003 */                #  6b4: 0c35
            movi         a6, 3 /* 0x00000003 */                #  6b6: 0c36
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  6b8: 080c
            s32i         a2, sp, 36 /* a2 -> [(local11)] */    #  6ba: 2991
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  6bc: 022025
            movi         a2, 119 /* 0x00000077 */              #  6bf: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  6c2: c00000
            movi         a3, 0 /* 0x00000000 */                #  6c5: 0c03
            movi         a4, 9 /* 0x00000009 */                #  6c7: 0c94
            movi         a5, 7 /* 0x00000007 */                #  6c9: 0c75
            movi         a6, 0 /* 0x00000000 */                #  6cb: 0c06
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  6cd: 080c
            s32i         a2, sp, 40 /* a2 -> [(local12)] */    #  6cf: 29a1
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  6d1: 022025
            movi         a2, 119 /* 0x00000077 */              #  6d4: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  6d7: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  6da: 080c
            s32i         a2, sp, 28 /* a2 -> [(local9)] */     #  6dc: 2971
            l32i         a0, a0, 64 /* [[sdk_g_phyFuns]+0x40] */ #  6de: 022010
            movi         a2, 1 /* 0x00000001 */                #  6e1: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x40] */       #  6e3: c00000
            s8i          a14, sp, 16 /* a14 -> [(local3)] */   #  6e6: e24110
            s8i          a13, sp, 17 /* a13 -> [(local4)] */   #  6e9: d24111
            beqz         a15, .Lbr037                          #  6ec: 8ccf
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  6ee: 080c
            addi         a2, sp, 16 /* (local3) */             #  6f0: 22c110
            l32i         a0, a0, 0x114 /* [[sdk_g_phyFuns]+0x114] */ #  6f3: 022045
            addi         a3, sp, 17 /* (local4) */             #  6f6: 32c111
            callx0       a0 /* [[sdk_g_phyFuns]+0x114] */      #  6f9: c00000
.Lbr037:    movi         a2, 119 /* 0x00000077 */              #  6fc: 22a077
            movi         a3, 0 /* 0x00000000 */                #  6ff: 0c03
            movi         a4, 16 /* 0x00000010 */               #  701: 1c04
            movi         a5, 2 /* 0x00000002 */                #  703: 0c25
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  705: 080c
            movi         a6, 2 /* 0x00000002 */                #  707: 0c26
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  709: 022027
            movi         a7, 1 /* 0x00000001 */                #  70c: 0c17
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  70e: c00000
            s32i         a14, sp, 44 /* a14 -> [(local13)] */  #  711: e9b1
            movi         a2, 119 /* 0x00000077 */              #  713: 22a077
            movi         a3, 0 /* 0x00000000 */                #  716: 0c03
            movi         a4, 24 /* 0x00000018 */               #  718: 1c84
            movi         a5, 7 /* 0x00000007 */                #  71a: 0c75
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  71c: 080c
            movi         a7, 1 /* 0x00000001 */                #  71e: 0c17
            l8ui         a9, sp, 16 /* [(local3)] */           #  720: 920110
            l8ui         a8, sp, 17 /* [(local4)] */           #  723: 820111
            sub          a9, a9, a14                           #  726: e099c0
            sub          a8, a8, a13                           #  729: d088c0
            movnez       a8, a7, a8                            #  72c: 808793
            movnez       a9, a7, a9                            #  72f: 909793
            s8i          a9, sp, 16 /* a9 -> [(local3)] */     #  732: 924110
            s8i          a8, sp, 17 /* a8 -> [(local4)] */     #  735: 824111
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  738: 022027
            movi         a6, 7 /* 0x00000007 */                #  73b: 0c76
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  73d: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  740: 080c
            l32i         a14, sp, 68 /* [(local19)] */         #  742: e22111
            l32i         a0, a0, 80 /* [[sdk_g_phyFuns]+0x50] */ #  745: 022014
            l32i         a2, sp, 24 /* [(local8)] */           #  748: 2861
            callx0       a0 /* [[sdk_g_phyFuns]+0x50] */       #  74a: c00000
            movi         a5, 0 /* 0x00000000 */                #  74d: 0c05
            movi         a6, 0 /* 0x00000000 */                #  74f: 0c06
            movi         a7, 0 /* 0x00000000 */                #  751: 0c07
            mov          a4, a2                                #  753: 4d02
            movi         a3, 0 /* 0x00000000 */                #  755: 0c03
            s32i         a3, sp, 8 /* 0x00000000 -> [(local2)] */ #  757: 3921
            s32i         a3, sp, 4 /* 0x00000000 -> [(local1)] */ #  759: 3911
            s32i         a3, sp, 0 /* 0x00000000 -> [(local0)] */ #  75b: 3901
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  75d: 080c
            movi         a2, 1 /* 0x00000001 */                #  75f: 0c12
            l32i         a0, a0, 104 /* [[sdk_g_phyFuns]+0x68] */ #  761: 02201a
            mov          a3, a14 /* [(local19)] */             #  764: 3d0e
            callx0       a0 /* [[sdk_g_phyFuns]+0x68] */       #  766: c00000
            l32i         a2, sp, 20 /* [(local7)] */           #  769: 2851
            l32i         a7, sp, 32 /* [(local10)] */          #  76b: 7881
            addi         a6, sp, 19 /* (local6) */             #  76d: 62c113
            l8ui         a4, sp, 17 /* [(local4)] */           #  770: 420111
            l32i         a5, sp, 36 /* [(local11)] */          #  773: 5891
            l8ui         a3, sp, 16 /* [(local3)] */           #  775: 320110
            mov          a14, a5 /* [(local11)] */             #  778: ed05
            s32i         a15, sp, 4 /* [(local21)] -> [(local1)] */ #  77a: f911
            s32i         a6, sp, 0 /* (local6) -> [(local0)] */ #  77c: 6901
            s32i         a7, sp, 8 /* [(local10)] -> [(local2)] */ #  77e: 7921
            addi         a7, sp, 18 /* (local5) */             #  780: 72c112
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  783: 080c
            l32i         a6, sp, 40 /* [(local12)] */          #  785: 68a1
            l32i         a0, a0, 0x10c /* [[sdk_g_phyFuns]+0x10c] */ #  787: 022043
            mov          a15, a6 /* [(local12)] */             #  78a: fd06
            callx0       a0 /* [[sdk_g_phyFuns]+0x10c] */      #  78c: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  78f: 080c
            l32i         a0, a0, 108 /* [[sdk_g_phyFuns]+0x6c] */ #  791: 02201b
            movi         a2, 1 /* 0x00000001 */                #  794: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x6c] */       #  796: c00000
            l32i         a7, sp, 44 /* [(local13)] */          #  799: 78b1
            movi         a2, 119 /* 0x00000077 */              #  79b: 22a077
            movi         a3, 0 /* 0x00000000 */                #  79e: 0c03
            movi         a4, 16 /* 0x00000010 */               #  7a0: 1c04
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  7a2: 080c
            movi         a5, 0 /* 0x00000000 */                #  7a4: 0c05
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  7a6: 022027
            movi         a6, 0 /* 0x00000000 */                #  7a9: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  7ab: c00000
            mov          a7, a13                               #  7ae: 7d0d
            movi         a2, 119 /* 0x00000077 */              #  7b0: 22a077
            movi         a3, 0 /* 0x00000000 */                #  7b3: 0c03
            movi         a4, 15 /* 0x0000000f */               #  7b5: 0cf4
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  7b7: 080c
            movi         a5, 6 /* 0x00000006 */                #  7b9: 0c65
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  7bb: 022027
            movi         a6, 6 /* 0x00000006 */                #  7be: 0c66
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  7c0: c00000
            mov          a7, a14 /* [(local11)] */             #  7c3: 7d0e
            movi         a2, 119 /* 0x00000077 */              #  7c5: 22a077
            movi         a3, 0 /* 0x00000000 */                #  7c8: 0c03
            movi         a4, 24 /* 0x00000018 */               #  7ca: 1c84
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  7cc: 080c
            movi         a5, 5 /* 0x00000005 */                #  7ce: 0c55
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  7d0: 022027
            movi         a6, 5 /* 0x00000005 */                #  7d3: 0c56
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  7d5: c00000
            mov          a7, a15 /* [(local12)] */             #  7d8: 7d0f
            movi         a2, 119 /* 0x00000077 */              #  7da: 22a077
            movi         a3, 0 /* 0x00000000 */                #  7dd: 0c03
            movi         a4, 24 /* 0x00000018 */               #  7df: 1c84
            movi         a5, 3 /* 0x00000003 */                #  7e1: 0c35
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  7e3: 080c
            movi         a6, 3 /* 0x00000003 */                #  7e5: 0c36
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  7e7: 022027
            l32i         a13, sp, 28 /* [(local9)] */          #  7ea: d871
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  7ec: c00000
            mov          a7, a13 /* [(local9)] */              #  7ef: 7d0d
            movi         a2, 119 /* 0x00000077 */              #  7f1: 22a077
            movi         a3, 0 /* 0x00000000 */                #  7f4: 0c03
            movi         a4, 9 /* 0x00000009 */                #  7f6: 0c94
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  7f8: 080c
            movi         a5, 7 /* 0x00000007 */                #  7fa: 0c75
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  7fc: 022027
            movi         a6, 0 /* 0x00000000 */                #  7ff: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  801: c00000
            movi         a2, 119 /* 0x00000077 */              #  804: 22a077
            movi         a3, 0 /* 0x00000000 */                #  807: 0c03
            movi         a4, 24 /* 0x00000018 */               #  809: 1c84
            movi         a5, 7 /* 0x00000007 */                #  80b: 0c75
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  80d: 080c
            movi         a6, 7 /* 0x00000007 */                #  80f: 0c76
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  811: 022027
            movi         a7, 0 /* 0x00000000 */                #  814: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  816: c00000
            movi         a2, 119 /* 0x00000077 */              #  819: 22a077
            movi         a3, 0 /* 0x00000000 */                #  81c: 0c03
            movi         a4, 16 /* 0x00000010 */               #  81e: 1c04
            movi         a5, 2 /* 0x00000002 */                #  820: 0c25
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  822: 080c
            movi         a6, 2 /* 0x00000002 */                #  824: 0c26
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  826: 022027
            movi         a7, 0 /* 0x00000000 */                #  829: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  82b: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  82e: 080c
            l32i         a13, sp, 72 /* [(local20)] */         #  830: d22112
            l32i         a0, a0, 64 /* [[sdk_g_phyFuns]+0x40] */ #  833: 022010
            movi         a2, 0 /* 0x00000000 */                #  836: 0c02
            callx0       a0 /* [[sdk_g_phyFuns]+0x40] */       #  838: c00000
            l32i         a0, sp, 48 /* [(local14)] */          #  83b: 08c1
            l32i         a12, sp, 52 /* [(local15)] */         #  83d: c8d1
            l32i         a14, sp, 60 /* [(local17)] */         #  83f: e8f1
            l8ui         a3, sp, 18 /* [(local5)] */           #  841: 320112
            l32i         a15, sp, 64 /* [(local18)] */         #  844: f22110
            s8i          a3, a13, 0 /* [(local5)] -> [[(local20)]] */ #  847: 324d00
            l8ui         a2, sp, 19 /* [(local6)] */           #  84a: 220113
            s8i          a2, a13, 1 /* [(local6)] -> [[(local20)]+0x1] */ #  84d: 224d01
            l32i         a13, sp, 56 /* [(local16)] */         #  850: d8e1
            addi         sp, sp, 80 /* (top of frame) */       #  852: 12c150
            ret           /* [(local6)] */                     #  855: 0df0

            .literal_position                                  #  858: 00000000
                                                               #  85c: 00000000
                                                               #  860: 00000000
                                                               #  864: 00000000

# Function @ .irom0.text+0x868
# Local variables/stack:
#     (local0):  byte[4]   @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .global      sdk_rom_rfcal_rxiq_set_reg
            .type        sdk_rom_rfcal_rxiq_set_reg, @function
sdk_rom_rfcal_rxiq_set_reg:
            addi         sp, sp, -32 /* (local0) */            #  868: 12c1e0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  86b: c921
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  86d: d931
            s32i         a4, sp, 24 /* arg2 -> [(local6)] */   #  86f: 4961
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  871: 0911
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  873: e941
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   #  875: f951
            mov          a14, a5 /* arg3 */                    #  877: ed05
            mov          a15, a4 /* arg2 */                    #  879: fd04
            movi         a0, 15 /* 0x0000000f */               #  87b: 0cf0
            beqz         a5, .Lbr040                           #  87d: 9c95
            bgez         a2, .Lbr038                           #  87f: d6d200
            movi         a13, 1 /* 0x00000001 */               #  882: 0c1d
            neg          a12, a2                               #  884: 20c060
            slli         a12, a12, 24                          #  887: 80cc01
            srai         a12, a12, 24                          #  88a: c0c831
            j            .Lbr039                               #  88d: c60000
.Lbr038:    movi         a13, 0 /* 0x00000000 */               #  890: 0c0d
            mov          a12, a2 /* arg0 */                    #  892: cd02
.Lbr039:    s8i          a13, a3, 0 /* a13 -> [arg1] */        #  894: d24300
            j            .Lbr041                               #  897: 060100
.Lbr040:    mov          a12, a2 /* arg0 */                    #  89a: cd02
            l8ui         a13, sp, 0 /* [(local0)] */           #  89c: d20100
.Lbr041:    movi         a2, 31 /* 0x0000001f */               #  89f: 1cf2
            movnez       a2, a0, a15                           #  8a1: f02093
            movi         a0, sdk_g_phyFuns                     #  8a4: 01edff
            beqz         a14, .Lbr047                          #  8a7: 167e08
            bge          a12, a2, .Lbr042                      #  8aa: 27ac01
            mov          a2, a12                               #  8ad: 2d0c
.Lbr042:    l32i         a9, a0, 0 /* [sdk_g_phyFuns] */       #  8af: 9800
            slli         a12, a2, 24                           #  8b1: 80c201
            srai         a12, a12, 24                          #  8b4: c0c831
            l32i         a9, a9, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  8b7: 922927
            beqz         a15, .Lbr049                          #  8ba: 160f08
            movi         a2, 119 /* 0x00000077 */              #  8bd: 22a077
            movi         a3, 0 /* 0x00000000 */                #  8c0: 0c03
            movi         a4, 24 /* 0x00000018 */               #  8c2: 1c84
            movi         a5, 5 /* 0x00000005 */                #  8c4: 0c55
            movi         a6, 5 /* 0x00000005 */                #  8c6: 0c56
            mov          a7, a13                               #  8c8: 7d0d
            callx0       a9 /* [[sdk_g_phyFuns]+0x9c] */       #  8ca: c00900
            movi         a0, sdk_g_phyFuns                     #  8cd: 01e3ff
.Lbr043:    l32i         a9, a0, 0 /* [sdk_g_phyFuns] */       #  8d0: 9800
            l32i         a9, a9, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  8d2: 922927
            beqz         a15, .Lbr044                          #  8d5: 9c2f
            extui        a7, a12, 0, 5                         #  8d7: c07044
            movi         a2, 119 /* 0x00000077 */              #  8da: 22a077
            movi         a3, 0 /* 0x00000000 */                #  8dd: 0c03
            movi         a4, 25 /* 0x00000019 */               #  8df: 1c94
            movi         a5, 4 /* 0x00000004 */                #  8e1: 0c45
            movi         a6, 0 /* 0x00000000 */                #  8e3: 0c06
            callx0       a9 /* [[sdk_g_phyFuns]+0x9c] */       #  8e5: c00900
            j            .Lbr045                               #  8e8: 460a00
.Lbr044:    movi         a2, 119 /* 0x00000077 */              #  8eb: 22a077
            movi         a3, 0 /* 0x00000000 */                #  8ee: 0c03
            movi         a4, 25 /* 0x00000019 */               #  8f0: 1c94
            movi         a5, 7 /* 0x00000007 */                #  8f2: 0c75
            movi         a6, 5 /* 0x00000005 */                #  8f4: 0c56
            extui        a7, a12, 3, 3                         #  8f6: c07324
            callx0       a9 /* [[sdk_g_phyFuns]+0x9c] */       #  8f9: c00900
            extui        a7, a12, 0, 3                         #  8fc: c07024
            movi         a2, 119 /* 0x00000077 */              #  8ff: 22a077
            movi         a3, 0 /* 0x00000000 */                #  902: 0c03
            movi         a0, sdk_g_phyFuns                     #  904: 01d7ff
            movi         a4, 26 /* 0x0000001a */               #  907: 1ca4
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  909: 0800
            movi         a5, 2 /* 0x00000002 */                #  90b: 0c25
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  90d: 022027
            movi         a6, 0 /* 0x00000000 */                #  910: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  912: c00000
.Lbr045:    l32i         a0, sp, 4 /* [(local1)] */            #  915: 0811
            l32i         a15, sp, 20 /* [(local5)] */          #  917: f851
            bnone        a13, a14, .Lbr046                     #  919: e70d08
            neg          a12, a12                              #  91c: c0c060
            slli         a12, a12, 24                          #  91f: 80cc01
            srai         a12, a12, 24                          #  922: c0c831
.Lbr046:    l32i         a13, sp, 12 /* [(local3)] */          #  925: d831
            mov          a2, a12                               #  927: 2d0c
            l32i         a14, sp, 16 /* [(local4)] */          #  929: e841
            l32i         a12, sp, 8 /* [(local2)] */           #  92b: c821
            addi         sp, sp, 32 /* (top of frame) */       #  92d: 12c120
            ret                                                #  930: 0df0
.Lbr047:    bge          a2, a12, .Lbr050                      #  932: c7a21e
.Lbr048:    slli         a12, a2, 24                           #  935: 80c201
            srai         a12, a12, 24                          #  938: c0c831
            j            .Lbr043                               #  93b: 46e4ff
.Lbr049:    movi         a2, 119 /* 0x00000077 */              #  93e: 22a077
            movi         a3, 0 /* 0x00000000 */                #  941: 0c03
            movi         a4, 24 /* 0x00000018 */               #  943: 1c84
            movi         a5, 3 /* 0x00000003 */                #  945: 0c35
            movi         a6, 3 /* 0x00000003 */                #  947: 0c36
            mov          a7, a13                               #  949: 7d0d
            callx0       a9 /* [[sdk_g_phyFuns]+0x9c] */       #  94b: c00900
            movi         a0, sdk_g_phyFuns                     #  94e: 01c5ff
            j            .Lbr043                               #  951: c6deff
.Lbr050:    neg          a2, a2                                #  954: 202060
            bge          a12, a2, .Lbr051                      #  957: 27ac01
            mov          a12, a2                               #  95a: cd02
.Lbr051:    mov          a2, a12                               #  95c: 2d0c
            j            .Lbr048                               #  95e: c6f4ff

            .literal_position                                  #  964: 00000000
                                                               #  968: 00000000
                                                               #  96c: 00000000
                                                               #  970: 00000000
                                                               #  974: 00000000
                                                               #  978: 00000000
                                                               #  97c: 00000000
                                                               #  980: 00000000
                                                               #  984: 00000000
                                                               #  988: 00000000
                                                               #  98c: 8c000000
                                                               #  990: a8000000
                                                               #  994: 00000000
                                                               #  998: 00000000
                                                               #  99c: 00000000
                                                               #  9a0: 00000400
                                                               #  9a4: 00000000
                                                               #  9a8: 00000000
                                                               #  9ac: 00000000
                                                               #  9b0: 00000000
                                                               #  9b4: 00000000
                                                               #  9b8: 00000000

# Function @ .irom0.text+0x9bc
# Local variables/stack:
#     (local0):  word      @ -0x50
#     (local1):  word      @ -0x4c
#     (local2):  word[2]   @ -0x48
#     (local3):  byte[4]   @ -0x40
#     (local4):  word      @ -0x3c
#     (local5):  word      @ -0x38
#     (local6):  word      @ -0x34
#     (local7):  word      @ -0x30
#     (local8):  word      @ -0x2c
#     (local9):  word      @ -0x28
#     (local10): word      @ -0x24
#     (local11): word      @ -0x20
#     (local12): word      @ -0x1c
#     (local13): word      @ -0x18
#     (local14): word      @ -0x14
#     (local15): word      @ -0x10
#     (local16): word[3]   @ -0xc
            .global      sdk_rom_rfcal_txcap
            .type        sdk_rom_rfcal_txcap, @function
sdk_rom_rfcal_txcap:
            mov          a9, a2 /* arg0 */                     #  9bc: 9d02
            addi         sp, sp, -80 /* (local0) */            #  9be: 12c1b0
            s32i         a15, sp, 36 /* a15 -> [(local8)] */   #  9c1: f991
            s32i         a3, sp, 48 /* arg1 -> [(local11)] */  #  9c3: 39c1
            s32i         a7, sp, 56 /* arg5 -> [(local13)] */  #  9c5: 79e1
            s32i         a0, sp, 20 /* a0 -> [(local4)] */     #  9c7: 0951
            s32i         a14, sp, 32 /* a14 -> [(local7)] */   #  9c9: e981
            s32i         a12, sp, 24 /* a12 -> [(local5)] */   #  9cb: c961
            s32i         a13, sp, 28 /* a13 -> [(local6)] */   #  9cd: d971
            mov          a12, a6 /* arg4 */                    #  9cf: cd06
            mov          a13, a5 /* arg3 */                    #  9d1: dd05
            mov          a14, a4 /* arg2 */                    #  9d3: ed04
            movi         a0, sdk_g_phyFuns                     #  9d5: 01e3ff
            l32i         a2, a2, 0 /* [arg0] */                #  9d8: 2802
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  9da: 0800
            extui        a2, a2, 18, 1                         #  9dc: 202205
            bnez         a2, .Lbr065                           #  9df: 56921b
            s32i         a9, sp, 68 /* arg0 -> [(local16)] */  #  9e2: 926111
            l32i         a3, sp, 48 /* [(local11)] */          #  9e5: 38c1
            movi         a2, 0 /* 0x00000000 */                #  9e7: 0c02
            l32i         a0, a0, 160 /* [[sdk_g_phyFuns]+0xa0] */ #  9e9: 022028
            s32i         a2, a3, 0 /* 0x00000000 -> [[(local11)]] */ #  9ec: 2903
            callx0       a0 /* [[sdk_g_phyFuns]+0xa0] */       #  9ee: c00000
            movi         a0, sdk_g_phyFuns                     #  9f1: 01ddff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  9f4: 0800
            l32i         a0, a0, 192 /* [[sdk_g_phyFuns]+0xc0] */ #  9f6: 022030
            movi         a2, 1 /* 0x00000001 */                #  9f9: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0xc0] */       #  9fb: c00000
            movi         a0, sdk_g_phyFuns                     #  9fe: 01dbff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  a01: 0800
            l32i         a0, a0, 204 /* [[sdk_g_phyFuns]+0xcc] */ #  a03: 022033
            extui        a2, a14, 0, 5                         #  a06: e02044
            callx0       a0 /* [[sdk_g_phyFuns]+0xcc] */       #  a09: c00000
            movi         a0, sdk_g_phyFuns                     #  a0c: 01d9ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  a0f: 0800
            l32i         a0, a0, 24 /* [[sdk_g_phyFuns]+0x18] */ #  a11: 0860
            movi         a2, 0 /* 0x00000000 */                #  a13: 0c02
            callx0       a0 /* [[sdk_g_phyFuns]+0x18] */       #  a15: c00000
            movi         a0, sdk_g_phyFuns                     #  a18: 01d7ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  a1b: 0800
            l32i         a0, a0, 80 /* [[sdk_g_phyFuns]+0x50] */ #  a1d: 022014
            mov          a2, a12 /* arg4 */                    #  a20: 2d0c
            callx0       a0 /* [[sdk_g_phyFuns]+0x50] */       #  a22: c00000
            movi         a5, 0 /* 0x00000000 */                #  a25: 0c05
            movi         a6, 0 /* 0x00000000 */                #  a27: 0c06
            movi         a7, 0 /* 0x00000000 */                #  a29: 0c07
            mov          a4, a2                                #  a2b: 4d02
            movi         a0, sdk_g_phyFuns                     #  a2d: 01d2ff
            movi         a3, 0 /* 0x00000000 */                #  a30: 0c03
            s32i         a3, sp, 0 /* 0x00000000 -> [(local0)] */ #  a32: 3901
            s32i         a3, sp, 4 /* 0x00000000 -> [(local1)] */ #  a34: 3911
            s32i         a3, sp, 8 /* 0x00000000 -> [(local2)] */ #  a36: 3921
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  a38: 0800
            movi         a2, 1 /* 0x00000001 */                #  a3a: 0c12
            l32i         a0, a0, 104 /* [[sdk_g_phyFuns]+0x68] */ #  a3c: 02201a
            mov          a3, a13 /* arg3 */                    #  a3f: 3d0d
            callx0       a0 /* [[sdk_g_phyFuns]+0x68] */       #  a41: c00000
            movi         a13, 0 /* 0x00000000 */               #  a44: 0c0d
            l8ui         a4, sp, 80 /* [(local17)] */          #  a46: 420150
            movi         a5, 3 /* 0x00000003 */                #  a49: 0c35
            l8ui         a6, sp, 16 /* [(local3)] */           #  a4b: 620110
            s32i         a6, sp, 40 /* [(local3)] -> [(local9)] */ #  a4e: 69a1
            s32i         a5, sp, 44 /* 0x00000003 -> [(local10)] */ #  a50: 59b1
            s32i         a4, sp, 64 /* [(local17)] -> [(local15)] */ #  a52: 426110
.Lbr052:    beqz         a13, .Lbr053                          #  a55: 8cbd
            beqi         a13, 1, .Lbr053                       #  a57: 261d09
            bnei         a13, 2, .Lbr054                       #  a5a: 662d0a
            movi         a7, 7 /* 0x00000007 */                #  a5d: 0c77
            s32i         a7, sp, 40 /* 0x00000007 -> [(local9)] */ #  a5f: 79a1
            j            .Lbr054                               #  a61: c60000
.Lbr053:    movi         a8, 15 /* 0x0000000f */               #  a64: 0cf8
            s32i         a8, sp, 40 /* 0x0000000f -> [(local9)] */ #  a66: 89a1
.Lbr054:    movi         a15, 0 /* 0x00000000 */               #  a68: 0c0f
            movi         a12, 0 /* 0x00000000 */               #  a6a: 0c0c
            movi         a9, 0 /* 0x00000000 */                #  a6c: 0c09
            l32i         a10, sp, 40 /* [(local9)] */          #  a6e: a8a1
            s32i         a9, sp, 52 /* 0x00000000 -> [(local12)] */ #  a70: 99d1
            addi         a10, a10, 1 /* [(local9)]+0x1 */      #  a72: 1baa
            s32i         a10, sp, 60 /* [(local9)]+0x1 -> [(local14)] */ #  a74: a9f1
.Lbr055:    beqz         a13, .Lbr057                          #  a76: bcad
            beqi         a13, 1, .Lbr056                       #  a78: 261d1d
            bnei         a13, 2, .Lbr058                       #  a7b: 662d4d
            movi         a2, 107 /* 0x0000006b */              #  a7e: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  a81: 0c23
            movi         a4, 2 /* 0x00000002 */                #  a83: 0c24
            movi         a0, sdk_g_phyFuns                     #  a85: 01bdff
            movi         a5, 6 /* 0x00000006 */                #  a88: 0c65
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  a8a: 0800
            movi         a6, 4 /* 0x00000004 */                #  a8c: 0c46
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  a8e: 022027
            mov          a7, a12                               #  a91: 7d0c
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  a93: c00000
            j            .Lbr058                               #  a96: 860c00
.Lbr056:    movi         a2, 107 /* 0x0000006b */              #  a99: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  a9c: 0c23
            movi         a4, 2 /* 0x00000002 */                #  a9e: 0c24
            movi         a0, sdk_g_phyFuns                     #  aa0: 01b8ff
            movi         a5, 3 /* 0x00000003 */                #  aa3: 0c35
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  aa5: 0800
            movi         a6, 0 /* 0x00000000 */                #  aa7: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  aa9: 022027
            mov          a7, a12                               #  aac: 7d0c
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  aae: c00000
            j            .Lbr058                               #  ab1: c60500
.Lbr057:    movi         a2, 107 /* 0x0000006b */              #  ab4: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  ab7: 0c23
            movi         a4, 1 /* 0x00000001 */                #  ab9: 0c14
            movi         a0, sdk_g_phyFuns                     #  abb: 01b2ff
            movi         a5, 3 /* 0x00000003 */                #  abe: 0c35
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  ac0: 0800
            movi         a6, 0 /* 0x00000000 */                #  ac2: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  ac4: 022027
            mov          a7, a12                               #  ac7: 7d0c
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  ac9: c00000
.Lbr058:    movi         a0, sdk_g_phyFuns                     #  acc: 01afff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  acf: 0800
            l32i         a2, sp, 56 /* [(local13)] */          #  ad1: 28e1
            l32i         a0, a0, 112 /* [[sdk_g_phyFuns]+0x70] */ #  ad3: 02201c
            movi         a3, 10 /* 0x0000000a */               #  ad6: 0ca3
            callx0       a0 /* [[sdk_g_phyFuns]+0x70] */       #  ad8: c00000
            mov          a14, a2                               #  adb: ed02
            l32i         a2, sp, 64 /* [(local15)] */          #  add: 222110
            beqz         a2, .Lbr059                           #  ae0: 8cb2
            movi         a2, .Lstr006                          #  ae2: 21aaff
            mov          a3, a12                               #  ae5: 3d0c
            mov          a4, a14                               #  ae7: 4d0e
            call0        ets_printf                            #  ae9: 01b2ffc0
                                                               #  aed: 0000
.Lbr059:    l32i         a4, sp, 60 /* [(local14)] */          #  aef: 48f1
            bge          a15, a14, .Lbr060                     #  af1: e7af03
            mov          a15, a14                              #  af4: fd0e
            s32i         a12, sp, 52 /* a12 -> [(local12)] */  #  af6: c9d1
.Lbr060:    addi         a12, a12, 1                           #  af8: 1bcc
            extui        a12, a12, 0, 8                        #  afa: c0c074
            beq          a4, a12, .Lbr061                      #  afd: c71402
            j            .Lbr055                               #  b00: 86dcff
.Lbr061:    l32i         a14, sp, 64 /* [(local15)] */         #  b03: e22110
            beqz         a14, .Lbr062                          #  b06: 8cbe
            movi         a2, .Lstr007                          #  b08: 21a2ff
            mov          a3, a13                               #  b0b: 3d0d
            l32i         a4, sp, 52 /* [(local12)] */          #  b0d: 48d1
            call0        ets_printf                            #  b0f: 01aaffc0
                                                               #  b13: 0000
.Lbr062:    beqz         a13, .Lbr063                          #  b15: ac1d
            addi         a15, a13, -1                          #  b17: 0bfd
            beqz         a15, .Lbr067                          #  b19: 16ef0d
            bnei         a13, 2, .Lbr064                       #  b1c: 662d32
            movi         a2, 107 /* 0x0000006b */              #  b1f: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  b22: 0c23
            movi         a4, 2 /* 0x00000002 */                #  b24: 0c24
            movi         a0, sdk_g_phyFuns                     #  b26: 019bff
            movi         a5, 6 /* 0x00000006 */                #  b29: 0c65
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  b2b: 0800
            movi         a6, 4 /* 0x00000004 */                #  b2d: 0c46
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  b2f: 022027
            l32i         a7, sp, 52 /* [(local12)] */          #  b32: 78d1
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  b34: c00000
            j            .Lbr064                               #  b37: c60500
.Lbr063:    movi         a2, 107 /* 0x0000006b */              #  b3a: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  b3d: 0c23
            movi         a4, 1 /* 0x00000001 */                #  b3f: 0c14
            movi         a0, sdk_g_phyFuns                     #  b41: 0195ff
            movi         a5, 3 /* 0x00000003 */                #  b44: 0c35
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  b46: 0800
            movi         a6, 0 /* 0x00000000 */                #  b48: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  b4a: 022027
            l32i         a7, sp, 52 /* [(local12)] */          #  b4d: 78d1
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  b4f: c00000
.Lbr064:    l32i         a14, sp, 52 /* [(local12)] */         #  b52: e8d1
            l32i         a15, sp, 48 /* [(local11)] */         #  b54: f8c1
            slli         a2, a13, 3                            #  b56: d02d11
            ssl          a2                                    #  b59: 001240
            addi         a13, a13, 1                           #  b5c: 1bdd
            extui        a13, a13, 0, 8                        #  b5e: d0d074
            l32i         a0, a15, 0 /* [[(local11)]] */        #  b61: 080f
            l32i         a2, sp, 44 /* [(local10)] */          #  b63: 28b1
            sll          a0, a0                                #  b65: 0000a1
            addi         a2, a2, -1 /* [(local10)]-0x1 */      #  b68: 0b22
            s32i         a2, sp, 44 /* [(local10)]-0x1 -> [(local10)] */ #  b6a: 29b1
            or           a14, a14, a0                          #  b6c: 00ee20
            s32i         a14, a15, 0 /* a14 -> [[(local11)]] */ #  b6f: e90f
            bnez         a2, .Lbr052                           #  b71: 5602ee
            movi         a0, sdk_g_phyFuns                     #  b74: 018aff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  b77: 0800
            l32i         a0, a0, 108 /* [[sdk_g_phyFuns]+0x6c] */ #  b79: 02201b
            movi         a2, 1 /* 0x00000001 */                #  b7c: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x6c] */       #  b7e: c00000
            movi         a0, sdk_g_phyFuns                     #  b81: 0188ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  b84: 0800
            movi         a12, 0x00040000                       #  b86: c186ff
            l32i         a0, a0, 168 /* [[sdk_g_phyFuns]+0xa8] */ #  b89: 02202a
            l32i         a13, sp, 68 /* [(local16)] */         #  b8c: d22111
            callx0       a0 /* [[sdk_g_phyFuns]+0xa8] */       #  b8f: c00000
            l32i         a2, a13, 0 /* [[(local16)]] */        #  b92: 280d
            or           a2, a2, a12                           #  b94: c02220
            s32i         a2, a13, 0 /* a2 -> [[(local16)]] */  #  b97: 290d
            j            .Lbr066                               #  b99: c61300
.Lbr065:    movi         a2, 107 /* 0x0000006b */              #  b9c: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  b9f: 0c23
            movi         a4, 1 /* 0x00000001 */                #  ba1: 0c14
            movi         a5, 3 /* 0x00000003 */                #  ba3: 0c35
            l32i         a7, sp, 48 /* [(local11)] */          #  ba5: 78c1
            movi         a6, 0 /* 0x00000000 */                #  ba7: 0c06
            l32i         a7, a7, 0 /* [[(local11)]] */         #  ba9: 7807
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  bab: 022027
            extui        a7, a7, 16, 8                         #  bae: 707075
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  bb1: c00000
            movi         a2, 107 /* 0x0000006b */              #  bb4: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  bb7: 0c23
            movi         a4, 2 /* 0x00000002 */                #  bb9: 0c24
            movi         a5, 3 /* 0x00000003 */                #  bbb: 0c35
            movi         a6, 0 /* 0x00000000 */                #  bbd: 0c06
            movi         a0, sdk_g_phyFuns                     #  bbf: 017aff
            l32i         a7, sp, 48 /* [(local11)] */          #  bc2: 78c1
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  bc4: 0800
            l32i         a7, a7, 0 /* [[(local11)]] */         #  bc6: 7807
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  bc8: 022027
            extui        a7, a7, 8, 8                          #  bcb: 707874
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  bce: c00000
            movi         a2, 107 /* 0x0000006b */              #  bd1: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  bd4: 0c23
            movi         a4, 2 /* 0x00000002 */                #  bd6: 0c24
            movi         a5, 6 /* 0x00000006 */                #  bd8: 0c65
            movi         a0, sdk_g_phyFuns                     #  bda: 0174ff
            movi         a6, 4 /* 0x00000004 */                #  bdd: 0c46
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  bdf: 0800
            l32i         a7, sp, 48 /* [(local11)] */          #  be1: 78c1
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  be3: 022027
            l8ui         a7, a7, 0 /* [[(local11)]] */         #  be6: 720700
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  be9: c00000
.Lbr066:    l32i         a12, sp, 24 /* [(local5)] */          #  bec: c861
            l32i         a13, sp, 28 /* [(local6)] */          #  bee: d871
            l32i         a14, sp, 32 /* [(local7)] */          #  bf0: e881
            l32i         a15, sp, 36 /* [(local8)] */          #  bf2: f891
            l32i         a0, sp, 20 /* [(local4)] */           #  bf4: 0851
            addi         sp, sp, 80 /* (local17) */            #  bf6: 12c150
            ret                                                #  bf9: 0df0
.Lbr067:    movi         a2, 107 /* 0x0000006b */              #  bfb: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  bfe: 0c23
            movi         a4, 2 /* 0x00000002 */                #  c00: 0c24
            movi         a0, sdk_g_phyFuns                     #  c02: 016bff
            movi         a5, 3 /* 0x00000003 */                #  c05: 0c35
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  c07: 0800
            movi         a6, 0 /* 0x00000000 */                #  c09: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  c0b: 022027
            l32i         a7, sp, 52 /* [(local12)] */          #  c0e: 78d1
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  c10: c00000
            j            .Lbr064                               #  c13: c6ceff

            .literal_position                                  #  c18: 00960060
                                                               #  c1c: 00000000
                                                               #  c20: c0000000
                                                               #  c24: 009a0060
                                                               #  c28: 00000300
                                                               #  c2c: ffff00e0
                                                               #  c30: 00000200
                                                               #  c34: 00000000
                                                               #  c38: 00000000

# Function @ .irom0.text+0xc3c
# Local variables/stack:
#     (local0):  byte      @ -0x40
#     (local1):  byte[3]   @ -0x3f
#     (local2):  word      @ -0x3c
#     (local3):  word      @ -0x38
#     (local4):  word      @ -0x34
#     (local5):  word      @ -0x30
#     (local6):  word      @ -0x2c
#     (local7):  word      @ -0x28
#     (local8):  word      @ -0x24
#     (local9):  word      @ -0x20
#     (local10): word      @ -0x1c
#     (local11): word      @ -0x18
#     (local12): word      @ -0x14
#     (local13): word      @ -0x10
#     (local14): word      @ -0xc
#     (local15): word      @ -0x8
#     (local16): word      @ -0x4
            .global      sdk_rom_rfcal_txiq
            .type        sdk_rom_rfcal_txiq, @function
sdk_rom_rfcal_txiq:
            mov          a9, a3 /* arg1 */                     #  c3c: 9d03
            addi         sp, sp, -64 /* (local0) */            #  c3e: 12c1c0
            s32i         a12, sp, 40 /* a12 -> [(local11)] */  #  c41: c9a1
            s32i         a15, sp, 52 /* a15 -> [(local14)] */  #  c43: f9d1
            s32i         a4, sp, 60 /* arg2 -> [(local16)] */  #  c45: 49f1
            s32i         a5, sp, 24 /* arg3 -> [(local7)] */   #  c47: 5961
            s32i         a7, sp, 20 /* arg5 -> [(local6)] */   #  c49: 7951
            s32i         a0, sp, 36 /* a0 -> [(local10)] */    #  c4b: 0991
            s32i         a14, sp, 48 /* a14 -> [(local13)] */  #  c4d: e9c1
            s32i         a13, sp, 44 /* a13 -> [(local12)] */  #  c4f: d9b1
            movi         a14, 0x60009600                       #  c51: e1f1ff
            s32i         a9, sp, 12 /* arg1 -> [(local4)] */   #  c54: 9931
            mov          a13, a2 /* arg0 */                    #  c56: dd02
            mov          a2, a6 /* arg4 */                     #  c58: 2d06
            l32i         a0, a13, 0 /* [arg0] */               #  c5a: 080d
            s32i         a2, sp, 16 /* arg4 -> [(local5)] */   #  c5c: 2941
            extui        a0, a0, 17, 1                         #  c5e: 000105
            bnez         a0, .Lbr073                           #  c61: 568019
            l32i         a15, sp, 60 /* [(local16)] */         #  c64: f8f1
            movi         a2, 119 /* 0x00000077 */              #  c66: 22a077
            movi         a3, 0 /* 0x00000000 */                #  c69: 0c03
            movi         a12, sdk_g_phyFuns                    #  c6b: c1ecff
            movi         a4, 16 /* 0x00000010 */               #  c6e: 1c04
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  c70: 080c
            movi         a5, 0 /* 0x00000000 */                #  c72: 0c05
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  c74: 022025
            movi         a6, 0 /* 0x00000000 */                #  c77: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  c79: c00000
            movi         a3, 0 /* 0x00000000 */                #  c7c: 0c03
            movi         a4, 15 /* 0x0000000f */               #  c7e: 0cf4
            movi         a5, 6 /* 0x00000006 */                #  c80: 0c65
            movi         a6, 6 /* 0x00000006 */                #  c82: 0c66
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  c84: 080c
            s32i         a2, sp, 8 /* a2 -> [(local3)] */      #  c86: 2921
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  c88: 022025
            movi         a2, 119 /* 0x00000077 */              #  c8b: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  c8e: c00000
            movi         a3, 0 /* 0x00000000 */                #  c91: 0c03
            movi         a4, 9 /* 0x00000009 */                #  c93: 0c94
            movi         a5, 7 /* 0x00000007 */                #  c95: 0c75
            movi         a6, 0 /* 0x00000000 */                #  c97: 0c06
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  c99: 080c
            s32i         a2, sp, 28 /* a2 -> [(local8)] */     #  c9b: 2971
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  c9d: 022025
            movi         a2, 119 /* 0x00000077 */              #  ca0: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  ca3: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  ca6: 080c
            l32i         a0, a0, 160 /* [[sdk_g_phyFuns]+0xa0] */ #  ca8: 022028
            s32i         a2, sp, 4 /* a2 -> [(local2)] */      #  cab: 2911
            callx0       a0 /* [[sdk_g_phyFuns]+0xa0] */       #  cad: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  cb0: 080c
            l32i         a0, a0, 192 /* [[sdk_g_phyFuns]+0xc0] */ #  cb2: 022030
            movi         a2, 1 /* 0x00000001 */                #  cb5: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0xc0] */       #  cb7: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  cba: 080c
            l32i         a0, a0, 204 /* [[sdk_g_phyFuns]+0xcc] */ #  cbc: 022033
            extui        a2, a15, 0, 5                         #  cbf: f02044
            callx0       a0 /* [[sdk_g_phyFuns]+0xcc] */       #  cc2: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  cc5: 080c
            l32i         a0, a0, 24 /* [[sdk_g_phyFuns]+0x18] */ #  cc7: 0860
            movi         a2, 0 /* 0x00000000 */                #  cc9: 0c02
            callx0       a0 /* [[sdk_g_phyFuns]+0x18] */       #  ccb: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  cce: 080c
            l32i         a0, a0, 60 /* [[sdk_g_phyFuns]+0x3c] */ #  cd0: 08f0
            movi         a2, 1 /* 0x00000001 */                #  cd2: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x3c] */       #  cd4: c00000
            movi         a2, 119 /* 0x00000077 */              #  cd7: 22a077
            movi         a3, 0 /* 0x00000000 */                #  cda: 0c03
            movi         a4, 16 /* 0x00000010 */               #  cdc: 1c04
            movi         a5, 2 /* 0x00000002 */                #  cde: 0c25
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  ce0: 080c
            movi         a6, 2 /* 0x00000002 */                #  ce2: 0c26
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  ce4: 022027
            movi         a7, 1 /* 0x00000001 */                #  ce7: 0c17
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  ce9: c00000
            l8ui         a15, sp, 64 /* [(local17)] */         #  cec: f20140
            beqz         a15, .Lbr068                          #  cef: 8c9f
            movi         a2, .Lstr008                          #  cf1: 21cbff
            l32i         a3, sp, 16 /* [(local5)] */           #  cf4: 3841
            call0        ets_printf                            #  cf6: 01cfffc0
                                                               #  cfa: 0000
.Lbr068:    mov          a6, a15 /* [(local17)] */             #  cfc: 6d0f
            l32i         a2, sp, 16 /* [(local5)] */           #  cfe: 2841
            l32i         a3, sp, 24 /* [(local7)] */           #  d00: 3861
            l32i         a5, sp, 20 /* [(local6)] */           #  d02: 5851
            l8ui         a7, sp, 68 /* [(FP)+0x4] */           #  d04: 720144
            mov          a4, sp /* (local0) */                 #  d07: 4d01
            call0        sdk_txiq_cover                        #  d09: 01cbffc0
                                                               #  d0d: 0000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  d0f: 080c
            movi         a2, 1 /* 0x00000001 */                #  d11: 0c12
            l32i         a0, a0, 108 /* [[sdk_g_phyFuns]+0x6c] */ #  d13: 02201b
            l32i         a15, sp, 8 /* [(local3)] */           #  d16: f821
            callx0       a0 /* [[sdk_g_phyFuns]+0x6c] */       #  d18: c00000
            mov          a7, a15 /* [(local3)] */              #  d1b: 7d0f
            movi         a2, 119 /* 0x00000077 */              #  d1d: 22a077
            movi         a3, 0 /* 0x00000000 */                #  d20: 0c03
            movi         a4, 16 /* 0x00000010 */               #  d22: 1c04
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  d24: 080c
            movi         a5, 0 /* 0x00000000 */                #  d26: 0c05
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  d28: 022027
            movi         a6, 0 /* 0x00000000 */                #  d2b: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  d2d: c00000
            l32i         a7, sp, 28 /* [(local8)] */           #  d30: 7871
            movi         a2, 119 /* 0x00000077 */              #  d32: 22a077
            movi         a3, 0 /* 0x00000000 */                #  d35: 0c03
            movi         a4, 15 /* 0x0000000f */               #  d37: 0cf4
            movi         a5, 6 /* 0x00000006 */                #  d39: 0c65
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  d3b: 080c
            movi         a6, 6 /* 0x00000006 */                #  d3d: 0c66
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  d3f: 022027
            l32i         a15, sp, 4 /* [(local2)] */           #  d42: f811
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  d44: c00000
            mov          a7, a15 /* [(local2)] */              #  d47: 7d0f
            movi         a2, 119 /* 0x00000077 */              #  d49: 22a077
            movi         a3, 0 /* 0x00000000 */                #  d4c: 0c03
            movi         a4, 9 /* 0x00000009 */                #  d4e: 0c94
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  d50: 080c
            movi         a5, 7 /* 0x00000007 */                #  d52: 0c75
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  d54: 022027
            movi         a6, 0 /* 0x00000000 */                #  d57: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  d59: c00000
            movi         a2, 119 /* 0x00000077 */              #  d5c: 22a077
            movi         a3, 0 /* 0x00000000 */                #  d5f: 0c03
            movi         a4, 16 /* 0x00000010 */               #  d61: 1c04
            movi         a5, 2 /* 0x00000002 */                #  d63: 0c25
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  d65: 080c
            movi         a6, 2 /* 0x00000002 */                #  d67: 0c26
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  d69: 022027
            movi         a7, 0 /* 0x00000000 */                #  d6c: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  d6e: c00000
            movi         a5, 32 /* 0x00000020 */               #  d71: 2c05
            movi         a11, 0x60009a00                       #  d73: b1acff
            memw                                               #  d76: c02000
            l32i         a10, a11, 40 /* [0x60009a28] */       #  d79: a8ab
            or           a10, a10, a5                          #  d7b: 50aa20
            memw                                               #  d7e: c02000
            s32i         a10, a11, 40 /* a10 -> [0x60009a28] */ #  d81: a9ab
            movi         a8, 2 /* 0x00000002 */                #  d83: 0c28
            movi         a9, -16 /* 0xfffffff0 */              #  d85: 7c09
            memw                                               #  d87: c02000
            l32i         a7, a14, 0x23c /* [0x6000983c] */     #  d8a: 722e8f
            and          a7, a7, a9                            #  d8d: 907710
            or           a7, a7, a8                            #  d90: 807720
            memw                                               #  d93: c02000
            s32i         a7, a14, 0x23c /* a7 -> [0x6000983c] */ #  d96: 726e8f
            movi         a4, 1 /* 0x00000001 */                #  d99: 0c14
            movi         a6, -498 /* 0xfffffe0e */             #  d9b: 62ae0e
            memw                                               #  d9e: c02000
            l32i         a3, a14, 0x264 /* [0x60009864] */     #  da1: 322e99
            and          a3, a3, a6                            #  da4: 603310
            or           a3, a3, a4                            #  da7: 403320
            memw                                               #  daa: c02000
            movi         a4, 15 /* 0x0000000f */               #  dad: 0cf4
            s32i         a3, a14, 0x264 /* a3 -> [0x60009864] */ #  daf: 326e99
            l8ui         a2, sp, 0 /* [(local0)] */            #  db2: 220100
            movi         a0, -15 /* 0xfffffff1 */              #  db5: 7c10
            slli         a2, a2, 24                            #  db7: 802201
            srai         a2, a2, 24                            #  dba: 202831
            blt          a2, a0, .Lbr069                       #  dbd: 072201
            mov          a0, a2                                #  dc0: 0d02
.Lbr069:    movi         a2, -31 /* 0xffffffe1 */              #  dc2: 6c12
            blt          a4, a0, .Lbr070                       #  dc4: 072401
            mov          a4, a0                                #  dc7: 4d00
.Lbr070:    movi         a3, 31 /* 0x0000001f */               #  dc9: 1cf3
            s8i          a4, sp, 0 /* a4 -> [(local0)] */      #  dcb: 424100
            slli         a0, a4, 24                            #  dce: 800401
            l8ui         a4, sp, 1 /* [(local1)] */            #  dd1: 420101
            srai         a0, a0, 24                            #  dd4: 000831
            slli         a4, a4, 24                            #  dd7: 804401
            srai         a4, a4, 24                            #  dda: 404831
            blt          a4, a2, .Lbr071                       #  ddd: 272401
            mov          a2, a4                                #  de0: 2d04
.Lbr071:    mov          a4, a3 /* 0x0000001f */               #  de2: 4d03
            bgei         a2, 32, .Lbr072                       #  de4: e6c201
            mov          a4, a2                                #  de7: 4d02
.Lbr072:    s8i          a4, sp, 1 /* a4 -> [(local1)] */      #  de9: 424101
            slli         a2, a4, 24                            #  dec: 802401
            srai         a2, a2, 24                            #  def: 202831
            bgei         a0, 1, .Lbr075                        #  df2: e61045
            neg          a3, a0                                #  df5: 003060
            s32i         a3, sp, 56 /* a3 -> [(local15)] */    #  df8: 39e1
            j            .Lbr076                               #  dfa: 861000
.Lbr073:    l32i         a12, a3, 0 /* [arg1] */               #  dfd: c803
            srli         a15, a12, 8                           #  dff: c0f841
            slli         a12, a12, 24                          #  e02: 80cc01
            srai         a12, a12, 24                          #  e05: c0c831
.Lbr074:    slli         a0, a15, 24                           #  e08: 800f01
            movi         a2, 0x00030000                        #  e0b: 2187ff
            slli         a15, a12, 18                          #  e0e: e0fc01
            or           a15, a15, a2                          #  e11: 20ff20
            movi         a2, 0xe000ffff                        #  e14: 2186ff
            memw                                               #  e17: c02000
            l32i         a13, a14, 0x260 /* [0x60009860] */    #  e1a: d22e98
            and          a13, a13, a2                          #  e1d: 20dd10
            or           a13, a13, a0                          #  e20: 00dd20
            or           a13, a13, a15                         #  e23: f0dd20
            memw                                               #  e26: c02000
            l32i         a12, sp, 40 /* [(local11)] */         #  e29: c8a1
            s32i         a13, a14, 0x260 /* a13 -> [0x60009860] */ #  e2b: d26e98
            l32i         a15, sp, 52 /* [(local14)] */         #  e2e: f8d1
            l32i         a13, sp, 44 /* [(local12)] */         #  e30: d8b1
            l32i         a14, sp, 48 /* [(local13)] */         #  e32: e8c1
            l32i         a0, sp, 36 /* [(local10)] */          #  e34: 0891
            addi         sp, sp, 64 /* (local17) */            #  e36: 12c140
            ret           /* 0xe000ffff */                     #  e39: 0df0
.Lbr075:    sub          a3, a5, a0                            #  e3b: 0035c0
            s32i         a3, sp, 56 /* a3 -> [(local15)] */    #  e3e: 39e1
.Lbr076:    l32i         a15, sp, 56 /* [(local15)] */         #  e40: f8e1
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e42: 080c
            addi         a12, a2, 64                           #  e44: c2c240
            l32i         a0, a0, 168 /* [[sdk_g_phyFuns]+0xa8] */ #  e47: 02202a
            slli         a15, a15, 24                          #  e4a: 80ff01
            movgez       a12, a2, a2                           #  e4d: 20c2b3
            s32i         a12, sp, 32 /* a12 -> [(local9)] */   #  e50: c981
            srai         a15, a15, 24                          #  e52: f0f831
            slli         a12, a12, 24                          #  e55: 80cc01
            srai         a12, a12, 24                          #  e58: c0c831
            callx0       a0 /* [[sdk_g_phyFuns]+0xa8] */       #  e5b: c00000
            l32i         a4, sp, 32 /* [(local9)] */           #  e5e: 4881
            l32i         a5, sp, 56 /* [(local15)] */          #  e60: 58e1
            slli         a4, a4, 24                            #  e62: 804401
            slli         a5, a5, 24                            #  e65: 805501
            srai         a5, a5, 24                            #  e68: 505831
            srai         a4, a4, 24                            #  e6b: 404831
            slli         a5, a5, 8                             #  e6e: 805511
            or           a4, a4, a5                            #  e71: 504420
            l32i         a5, sp, 12 /* [(local4)] */           #  e74: 5831
            movi         a3, 0x00020000                        #  e76: 316eff
            s32i         a4, a5, 0 /* a4 -> [[(local4)]] */    #  e79: 4905
            l32i         a2, a13, 0 /* [arg0] */               #  e7b: 280d
            or           a2, a2, a3                            #  e7d: 302220
            s32i         a2, a13, 0 /* a2 -> [arg0] */         #  e80: 290d
            j            .Lbr074                               #  e82: 86e0ff

            .balign      4
# Function @ .irom0.text+0xe88
            .global      sdk_rom_rfcal_txiq_cover
            .type        sdk_rom_rfcal_txiq_cover, @function
sdk_rom_rfcal_txiq_cover:
            ret           /* arg0 */                           #  e88: 0df0

            .literal_position                                  #  e8c: 00000000
                                                               #  e90: 00000000
                                                               #  e94: 00000000

# Function @ .irom0.text+0xe98
# Local variables/stack:
#     (local0):  byte[4]   @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .global      sdk_rom_rfcal_txiq_set_reg
            .type        sdk_rom_rfcal_txiq_set_reg, @function
sdk_rom_rfcal_txiq_set_reg:
            addi         sp, sp, -32 /* (local0) */            #  e98: 12c1e0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  e9b: c921
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   #  e9d: f951
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  e9f: 0911
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  ea1: e941
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  ea3: d931
            mov          a14, a3 /* arg1 */                    #  ea5: ed03
            mov          a13, a4 /* arg2 */                    #  ea7: dd04
            movi         a0, 15 /* 0x0000000f */               #  ea9: 0cf0
            beqz         a4, .Lbr077                           #  eab: 8c84
            bltz         a2, .Lbr086                           #  ead: 961209
            movi         a15, 0 /* 0x00000000 */               #  eb0: 0c0f
            mov          a12, a2 /* arg0 */                    #  eb2: cd02
            j            .Lbr078                               #  eb4: 060100
.Lbr077:    mov          a12, a2 /* arg0 */                    #  eb7: cd02
            l8ui         a15, sp, 0 /* [(local0)] */           #  eb9: f20100
.Lbr078:    movi         a2, 31 /* 0x0000001f */               #  ebc: 1cf2
            movnez       a2, a0, a14                           #  ebe: e02093
            movi         a0, sdk_g_phyFuns                     #  ec1: 01f2ff
            beqz         a13, .Lbr084                          #  ec4: 16ed06
            bge          a12, a2, .Lbr079                      #  ec7: 27ac01
            mov          a2, a12                               #  eca: 2d0c
.Lbr079:    l32i         a9, a0, 0 /* [sdk_g_phyFuns] */       #  ecc: 9800
            slli         a12, a2, 24                           #  ece: 80c201
            srai         a12, a12, 24                          #  ed1: c0c831
            l32i         a9, a9, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  ed4: 922927
            beqz         a14, .Lbr087                          #  ed7: 165e07
            movi         a2, 119 /* 0x00000077 */              #  eda: 22a077
            movi         a3, 0 /* 0x00000000 */                #  edd: 0c03
            movi         a4, 16 /* 0x00000010 */               #  edf: 1c04
            movi         a5, 0 /* 0x00000000 */                #  ee1: 0c05
            movi         a6, 0 /* 0x00000000 */                #  ee3: 0c06
            mov          a7, a15                               #  ee5: 7d0f
            callx0       a9 /* [[sdk_g_phyFuns]+0x9c] */       #  ee7: c00900
            movi         a0, sdk_g_phyFuns                     #  eea: 01e9ff
.Lbr080:    l32i         a9, a0, 0 /* [sdk_g_phyFuns] */       #  eed: 9800
            l32i         a9, a9, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  eef: 922927
            beqz         a14, .Lbr081                          #  ef2: 9c2e
            extui        a7, a12, 0, 5                         #  ef4: c07044
            movi         a2, 119 /* 0x00000077 */              #  ef7: 22a077
            movi         a3, 0 /* 0x00000000 */                #  efa: 0c03
            movi         a4, 16 /* 0x00000010 */               #  efc: 1c04
            movi         a5, 7 /* 0x00000007 */                #  efe: 0c75
            movi         a6, 3 /* 0x00000003 */                #  f00: 0c36
            callx0       a9 /* [[sdk_g_phyFuns]+0x9c] */       #  f02: c00900
            j            .Lbr082                               #  f05: 060400
.Lbr081:    extui        a7, a12, 0, 6                         #  f08: c07054
            movi         a2, 119 /* 0x00000077 */              #  f0b: 22a077
            movi         a3, 0 /* 0x00000000 */                #  f0e: 0c03
            movi         a4, 17 /* 0x00000011 */               #  f10: 1c14
            movi         a5, 5 /* 0x00000005 */                #  f12: 0c55
            movi         a6, 0 /* 0x00000000 */                #  f14: 0c06
            callx0       a9 /* [[sdk_g_phyFuns]+0x9c] */       #  f16: c00900
.Lbr082:    l32i         a0, sp, 4 /* [(local1)] */            #  f19: 0811
            l32i         a14, sp, 16 /* [(local4)] */          #  f1b: e841
            bnone        a15, a13, .Lbr083                     #  f1d: d70f08
            neg          a12, a12                              #  f20: c0c060
            slli         a12, a12, 24                          #  f23: 80cc01
            srai         a12, a12, 24                          #  f26: c0c831
.Lbr083:    l32i         a13, sp, 12 /* [(local3)] */          #  f29: d831
            mov          a2, a12                               #  f2b: 2d0c
            l32i         a15, sp, 20 /* [(local5)] */          #  f2d: f851
            l32i         a12, sp, 8 /* [(local2)] */           #  f2f: c821
            addi         sp, sp, 32 /* (top of frame) */       #  f31: 12c120
            ret                                                #  f34: 0df0
.Lbr084:    bge          a2, a12, .Lbr088                      #  f36: c7a22c
.Lbr085:    slli         a12, a2, 24                           #  f39: 80c201
            srai         a12, a12, 24                          #  f3c: c0c831
            j            .Lbr080                               #  f3f: 86eaff
.Lbr086:    movi         a15, 1 /* 0x00000001 */               #  f42: 0c1f
            neg          a12, a2                               #  f44: 20c060
            slli         a12, a12, 24                          #  f47: 80cc01
            srai         a12, a12, 24                          #  f4a: c0c831
            j            .Lbr078                               #  f4d: c6daff
.Lbr087:    movi         a2, 119 /* 0x00000077 */              #  f50: 22a077
            movi         a3, 0 /* 0x00000000 */                #  f53: 0c03
            movi         a4, 15 /* 0x0000000f */               #  f55: 0cf4
            movi         a5, 6 /* 0x00000006 */                #  f57: 0c65
            movi         a6, 6 /* 0x00000006 */                #  f59: 0c66
            mov          a7, a15                               #  f5b: 7d0f
            callx0       a9 /* [[sdk_g_phyFuns]+0x9c] */       #  f5d: c00900
            movi         a0, sdk_g_phyFuns                     #  f60: 01cdff
            j            .Lbr080                               #  f63: 86e1ff
.Lbr088:    neg          a2, a2                                #  f66: 202060
            bge          a12, a2, .Lbr089                      #  f69: 27ac01
            mov          a12, a2                               #  f6c: cd02
.Lbr089:    mov          a2, a12                               #  f6e: 2d0c
            j            .Lbr085                               #  f70: 46f1ff

            .literal_position                                  #  f74: 00000000

# Function @ .irom0.text+0xf78
# Local variables/stack:
#     (local0):  word[4]   @ -0x50
#     (local1):  byte      @ -0x40
#     (local2):  byte      @ -0x3f
#     (local3):  byte      @ -0x3e
#     (local4):  byte      @ -0x3d
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
            .global      sdk_rom_rxiq_cover_mg_mp
            .type        sdk_rom_rxiq_cover_mg_mp, @function
sdk_rom_rxiq_cover_mg_mp:
            addi         sp, sp, -80 /* (local0) */            #  f78: 12c1b0
            s32i         a3, sp, 44 /* arg1 -> [(local11)] */  #  f7b: 39b1
            s32i         a4, sp, 48 /* arg2 -> [(local12)] */  #  f7d: 49c1
            s32i         a5, sp, 52 /* arg3 -> [(local13)] */  #  f7f: 59d1
            s32i         a6, sp, 56 /* arg4 -> [(local14)] */  #  f81: 69e1
            s32i         a7, sp, 20 /* arg5 -> [(local5)] */   #  f83: 7951
            s32i         a0, sp, 24 /* a0 -> [(local6)] */     #  f85: 0961
            s32i         a2, sp, 72 /* arg0 -> [(local18)] */  #  f87: 226112
            s32i         a15, sp, 40 /* a15 -> [(local10)] */  #  f8a: f9a1
            s32i         a14, sp, 36 /* a14 -> [(local9)] */   #  f8c: e991
            s32i         a13, sp, 32 /* a13 -> [(local8)] */   #  f8e: d981
            s32i         a12, sp, 28 /* a12 -> [(local7)] */   #  f90: c971
            movi         a13, 0 /* 0x00000000 */               #  f92: 0c0d
            movi         a12, 0 /* 0x00000000 */               #  f94: 0c0c
            movi         a14, sdk_g_phyFuns                    #  f96: e1f7ff
            l8ui         a15, sp, 84 /* [(FP)+0x4] */          #  f99: f20154
            movi         a2, 2 /* 0x00000002 */                #  f9c: 0c22
            s32i         a2, sp, 76 /* 0x00000002 -> [(local19)] */ #  f9e: 226113
            l32i         a0, sp, 72 /* [(local18)] */          #  fa1: 022112
            movi         a2, 1 /* 0x00000001 */                #  fa4: 0c12
            ssl          a0                                    #  fa6: 001040
            sll          a2, a2                                #  fa9: 0022a1
            l8ui         a0, sp, 88 /* [(FP)+0x8] */           #  fac: 020158
            s32i         a0, sp, 64 /* [(FP)+0x8] -> [(local16)] */ #  faf: 026110
            extui        a2, a2, 0, 16                         #  fb2: 2020f4
            s32i         a2, sp, 60 /* a2 -> [(local15)] */    #  fb5: 29f1
.Lbr090:    mov          a2, a12                               #  fb7: 2d0c
            addi         a3, sp, 16 /* (local1) */             #  fb9: 32c110
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  fbc: 080e
            movi         a4, 1 /* 0x00000001 */                #  fbe: 0c14
            l32i         a0, a0, 248 /* [[sdk_g_phyFuns]+0xf8] */ #  fc0: 02203e
            mov          a5, a15 /* [(FP)+0x4] */              #  fc3: 5d0f
            callx0       a0 /* [[sdk_g_phyFuns]+0xf8] */       #  fc5: c00000
            addi         a3, sp, 17 /* (local2) */             #  fc8: 32c111
            movi         a4, 0 /* 0x00000000 */                #  fcb: 0c04
            mov          a5, a15 /* [(FP)+0x4] */              #  fcd: 5d0f
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  fcf: 080e
            s32i         a2, sp, 68 /* a2 -> [(local17)] */    #  fd1: 226111
            l32i         a0, a0, 248 /* [[sdk_g_phyFuns]+0xf8] */ #  fd4: 02203e
            mov          a2, a13                               #  fd7: 2d0d
            callx0       a0 /* [[sdk_g_phyFuns]+0xf8] */       #  fd9: c00000
            l32i         a3, sp, 60 /* [(local15)] */          #  fdc: 38f1
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  fde: 080e
            mov          a12, a2                               #  fe0: cd02
            l32i         a0, a0, 52 /* [[sdk_g_phyFuns]+0x34] */ #  fe2: 08d0
            movi         a2, 1 /* 0x00000001 */                #  fe4: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x34] */       #  fe6: c00000
            l32i         a2, sp, 72 /* [(local18)] */          #  fe9: 222112
            l32i         a3, sp, 44 /* [(local11)] */          #  fec: 38b1
            l8ui         a5, sp, 17 /* [(local2)] */           #  fee: 520111
            l32i         a8, sp, 52 /* [(local13)] */          #  ff1: 88d1
            l8ui         a6, sp, 16 /* [(local1)] */           #  ff3: 620110
            movi         a9, 1 /* 0x00000001 */                #  ff6: 0c19
            sub          a6, a6, a8                            #  ff8: 8066c0
            l32i         a8, sp, 56 /* [(local14)] */          #  ffb: 88e1
            movnez       a6, a9, a6                            #  ffd: 606993
            s8i          a6, sp, 16 /* a6 -> [(local1)] */     # 1000: 624110
            sub          a5, a5, a8                            # 1003: 8055c0
            l32i         a8, sp, 64 /* [(local16)] */          # 1006: 822110
            movnez       a5, a9, a5                            # 1009: 505993
            s8i          a5, sp, 17 /* a5 -> [(local2)] */     # 100c: 524111
            s32i         a8, sp, 0 /* [(local16)] -> [(local0)] */ # 100f: 8901
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      # 1011: 080e
            l32i         a4, sp, 48 /* [(local12)] */          # 1013: 48c1
            l32i         a0, a0, 72 /* [[sdk_g_phyFuns]+0x48] */ # 1015: 022012
            addi         a7, sp, 18 /* (local3) */             # 1018: 72c112
            callx0       a0 /* [[sdk_g_phyFuns]+0x48] */       # 101b: c00000
            l32i         a3, sp, 68 /* [(local17)] */          # 101e: 322111
            l8ui         a13, sp, 19 /* [(local4)] */          # 1021: d20113
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      # 1024: 080e
            l8ui         a2, sp, 18 /* [(local3)] */           # 1026: 220112
            l32i         a0, a0, 48 /* [[sdk_g_phyFuns]+0x30] */ # 1029: 08c0
            slli         a2, a2, 24                            # 102b: 802201
            slli         a13, a13, 24                          # 102e: 80dd01
            srai         a13, a13, 24                          # 1031: d0d831
            srai         a2, a2, 24                            # 1034: 202831
            add          a2, a2, a3                            # 1037: 3a22
            sub          a13, a12, a13                         # 1039: d0dcc0
            slli         a13, a13, 24                          # 103c: 80dd01
            srai         a13, a13, 24                          # 103f: d0d831
            slli         a12, a2, 24                           # 1042: 80c201
            srai         a12, a12, 24                          # 1045: c0c831
            callx0       a0 /* [[sdk_g_phyFuns]+0x30] */       # 1048: c00000
            l32i         a2, sp, 76 /* [(local19)] */          # 104b: 222113
            addi         a2, a2, -1 /* [(local19)]-0x1 */      # 104e: 0b22
            s32i         a2, sp, 76 /* [(local19)]-0x1 -> [(local19)] */ # 1050: 226113
            bnez         a2, .Lbr090                           # 1053: 5602f6
            movi         a2, 15 /* 0x0000000f */               # 1056: 0cf2
            movi         a0, -15 /* 0xfffffff1 */              # 1058: 7c10
            blt          a12, a0, .Lbr091                      # 105a: 072c01
            mov          a0, a12                               # 105d: 0d0c
.Lbr091:    blt          a2, a0, .Lbr092                       # 105f: 072201
            mov          a2, a0                                # 1062: 2d00
.Lbr092:    movi         a0, -31 /* 0xffffffe1 */              # 1064: 6c10
            slli         a12, a2, 24                           # 1066: 80c201
            srai         a12, a12, 24                          # 1069: c0c831
            movi         a2, 31 /* 0x0000001f */               # 106c: 1cf2
            blt          a13, a0, .Lbr093                      # 106e: 072d01
            mov          a0, a13                               # 1071: 0d0d
.Lbr093:    blt          a2, a0, .Lbr094                       # 1073: 072201
            mov          a2, a0                                # 1076: 2d00
.Lbr094:    addi         a3, sp, 16 /* (local1) */             # 1078: 32c110
            movi         a4, 1 /* 0x00000001 */                # 107b: 0c14
            mov          a5, a15 /* [(FP)+0x4] */              # 107d: 5d0f
            slli         a13, a2, 24                           # 107f: 80d201
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      # 1082: 080e
            srai         a13, a13, 24                          # 1084: d0d831
            l32i         a0, a0, 248 /* [[sdk_g_phyFuns]+0xf8] */ # 1087: 02203e
            mov          a2, a12                               # 108a: 2d0c
            callx0       a0 /* [[sdk_g_phyFuns]+0xf8] */       # 108c: c00000
            mov          a5, a15 /* [(FP)+0x4] */              # 108f: 5d0f
            mov          a2, a13                               # 1091: 2d0d
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      # 1093: 080e
            addi         a3, sp, 17 /* (local2) */             # 1095: 32c111
            l32i         a0, a0, 248 /* [[sdk_g_phyFuns]+0xf8] */ # 1098: 02203e
            movi         a4, 0 /* 0x00000000 */                # 109b: 0c04
            callx0       a0 /* [[sdk_g_phyFuns]+0xf8] */       # 109d: c00000
            l32i         a0, sp, 24 /* [(local6)] */           # 10a0: 0861
            l32i         a14, sp, 36 /* [(local9)] */          # 10a2: e891
            l32i         a15, sp, 40 /* [(local10)] */         # 10a4: f8a1
            l32i         a3, sp, 20 /* [(local5)] */           # 10a6: 3851
            l32i         a2, sp, 80 /* [(local20)] */          # 10a8: 222114
            s8i          a12, a3, 0 /* a12 -> [[(local5)]] */  # 10ab: c24300
            s8i          a13, a2, 0 /* a13 -> [[(local20)]] */ # 10ae: d24200
            l32i         a12, sp, 28 /* [(local7)] */          # 10b1: c871
            l32i         a13, sp, 32 /* [(local8)] */          # 10b3: d881
            addi         sp, sp, 80 /* (local20) */            # 10b5: 12c150
            ret           /* [(local20)] */                    # 10b8: 0df0

            .literal_position                                  # 10bc: d8000000
                                                               # 10c0: e0000000
                                                               # 10c4: 50000000
                                                               # 10c8: 00000000
                                                               # 10cc: 00020060
                                                               # 10d0: 00000000
                                                               # 10d4: 00000000
                                                               # 10d8: 00000000

# Function @ .irom0.text+0x10dc
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .global      sdk_rom_set_txbb_atten
            .type        sdk_rom_set_txbb_atten, @function
sdk_rom_set_txbb_atten:
            addi         sp, sp, -32 /* (local0) */            # 10dc: 12c1e0
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   # 10df: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 10e1: 0901
            s32i         a2, sp, 20 /* arg0 -> [(local5)] */   # 10e3: 2951
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   # 10e5: e931
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 10e7: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 10e9: d921
            mov          a12, a4 /* arg2 */                    # 10eb: cd04
            mov          a13, a5 /* arg3 */                    # 10ed: dd05
            mov          a14, a3 /* arg1 */                    # 10ef: ed03
            beqz         a6, .Lbr097                           # 10f1: bc66
            movi         a2, .Lstr009                          # 10f3: 21f2ff
            call0        ets_printf                            # 10f6: 01f6ffc0
                                                               # 10fa: 0000
            s32i         a13, sp, 24 /* arg3 -> [(local6)] */  # 10fc: d961
            beqz         a14, .Lbr096                          # 10fe: ac0e
            mov          a15, a13 /* arg3 */                   # 1100: fd0d
            movi         a13, 0 /* 0x00000000 */               # 1102: 0c0d
.Lbr095:    add          a3, a12, a13                          # 1104: da3c
            add          a4, a15, a13                          # 1106: da4f
            l8ui         a4, a4, 0                             # 1108: 420400
            l8ui         a3, a3, 0                             # 110b: 320300
            movi         a2, .Lstr010                          # 110e: 21ecff
            sub          a3, a3, a4                            # 1111: 4033c0
            call0        ets_printf                            # 1114: 01f0ffc0
                                                               # 1118: 0000
            addi         a13, a13, 1                           # 111a: 1bdd
            extui        a13, a13, 0, 8                        # 111c: d0d074
            bne          a14, a13, .Lbr095                     # 111f: d79ee1
.Lbr096:    movi         a2, .Label001                         # 1122: 21e8ff
            call0        ets_printf                            # 1125: 01ecffc0
                                                               # 1129: 0000
.Lbr097:    movi         a2, 119 /* 0x00000077 */              # 112b: 22a077
            movi         a3, 0 /* 0x00000000 */                # 112e: 0c03
            movi         a4, 9 /* 0x00000009 */                # 1130: 0c94
            movi         a0, sdk_g_phyFuns                     # 1132: 01e5ff
            movi         a5, 7 /* 0x00000007 */                # 1135: 0c75
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1137: 0800
            movi         a6, 0 /* 0x00000000 */                # 1139: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 113b: 022027
            movi         a7, 0 /* 0x00000000 */                # 113e: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 1140: c00000
            l32i         a0, sp, 20 /* [(local5)] */           # 1143: 0851
            movi         a13, 0 /* 0x00000000 */               # 1145: 0c0d
            movi         a9, 24 /* 0x00000018 */               # 1147: 1c89
            movi         a6, 256 /* 0x00000100 */              # 1149: 62a100
            movi         a5, -256 /* 0xffffff00 */             # 114c: 52af00
            movi         a3, 0x60000200                        # 114f: 31dfff
            movi         a10, -134 /* 0xffffff7a */            # 1152: a2af7a
.Lbr098:    addx4        a15, a13, a3                          # 1155: 30fda0
            bgeui        a13, 8, .Lbr099                       # 1158: f68d0a
            l8ui         a4, a12, 0 /* [arg2] */               # 115b: 420c00
            l8ui         a2, a0, 0 /* [[(local5)]] */          # 115e: 220000
            add          a2, a2, a4                            # 1161: 4a22
            j            .Lbr100                               # 1163: c60200
.Lbr099:    add          a2, a0, a13                           # 1166: da20
            add          a2, a2, a10                           # 1168: aa22
            l8ui         a2, a2, 127                           # 116a: 22027f
            add          a2, a2, a12                           # 116d: ca22
            l8ui         a2, a2, 0                             # 116f: 220200
.Lbr100:    sub          a4, a6, a2                            # 1172: 2046c0
            extui        a4, a4, 0, 8                          # 1175: 404074
            memw                                               # 1178: c02000
            l32i         a14, a15, 0x304                       # 117b: e22fc1
            and          a14, a14, a5                          # 117e: 50ee10
            or           a14, a14, a4                          # 1181: 40ee20
            memw                                               # 1184: c02000
            s32i         a14, a15, 0x304                       # 1187: e26fc1
            addi         a13, a13, 1                           # 118a: 1bdd
            extui        a13, a13, 0, 8                        # 118c: d0d074
            bne          a13, a9, .Lbr098                      # 118f: 979dc2
            l32i         a12, sp, 4 /* [(local1)] */           # 1192: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 1194: d821
            l32i         a14, sp, 12 /* [(local3)] */          # 1196: e831
            l32i         a15, sp, 16 /* [(local4)] */          # 1198: f841
            l32i         a0, sp, 0 /* [(local0)] */            # 119a: 0801
            addi         sp, sp, 32 /* (top of frame) */       # 119c: 12c120
            ret                                                # 119f: 0df0

            .literal_position                                  # 11a4: 0000001f
                                                               # 11a8: 00960060
                                                               # 11ac: 0000fc00
                                                               # 11b0: 00000000
                                                               # 11b4: 00000000

# Function @ .irom0.text+0x11b8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_rom_set_txiq_cal
            .type        sdk_rom_set_txiq_cal, @function
sdk_rom_set_txiq_cal:
            addi         sp, sp, -16 /* (local0) */            # 11b8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 11bb: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 11bd: c911
            movi         a5, 0x1f000000                        # 11bf: 51f9ff
            mov          a12, a3 /* arg1 */                    # 11c2: cd03
            movi         a0, 0x60009600                        # 11c4: 01f9ff
            memw                                               # 11c7: c02000
            l32i         a3, a0, 0x260 /* [0x60009860] */      # 11ca: 322098
            movi         a4, 0x00fc0000                        # 11cd: 41f7ff
            and          a3, a3, a5                            # 11d0: 503310
            extui        a3, a3, 24, 8                         # 11d3: 303875
            slli         a3, a3, 24                            # 11d6: 803301
            srai         a3, a3, 24                            # 11d9: 303831
            memw                                               # 11dc: c02000
            l32i         a0, a0, 0x260 /* [0x60009860] */      # 11df: 022098
            and          a0, a0, a4                            # 11e2: 400010
            extui        a0, a0, 18, 14                        # 11e5: 0002d5
            slli         a0, a0, 24                            # 11e8: 800001
            srai         a0, a0, 24                            # 11eb: 000831
            blti         a3, 16, .Lbr101                       # 11ee: a6b302
            addi         a3, a3, -32                           # 11f1: 32c3e0
.Lbr101:    blti         a0, 32, .Lbr102                       # 11f4: a6c008
            addi         a0, a0, -64                           # 11f7: 02c0c0
            slli         a0, a0, 24                            # 11fa: 800001
            srai         a0, a0, 24                            # 11fd: 000831
.Lbr102:    movi         a5, 0 /* 0x00000000 */                # 1200: 0c05
            neg          a4, a3                                # 1202: 304060
            movi         a6, 0 /* 0x00000000 */                # 1205: 0c06
            extui        a3, a0, 31, 1                         # 1207: 003f05
            extui        a4, a4, 7, 1                          # 120a: 404704
            s8i          a4, a2, 0 /* a4 -> [arg0] */          # 120d: 424200
            movi         a0, sdk_g_phyFuns                     # 1210: 01e8ff
            movi         a4, 16 /* 0x00000010 */               # 1213: 1c04
            s8i          a3, a12, 0 /* a3 -> [arg1] */         # 1215: 324c00
            movi         a3, 0 /* 0x00000000 */                # 1218: 0c03
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 121a: 0800
            l8ui         a7, a2, 0 /* [arg0] */                # 121c: 720200
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 121f: 022027
            movi         a2, 119 /* 0x00000077 */              # 1222: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 1225: c00000
            l8ui         a7, a12, 0 /* [arg1] */               # 1228: 720c00
            movi         a2, 119 /* 0x00000077 */              # 122b: 22a077
            movi         a3, 0 /* 0x00000000 */                # 122e: 0c03
            movi         a0, sdk_g_phyFuns                     # 1230: 01e1ff
            movi         a4, 15 /* 0x0000000f */               # 1233: 0cf4
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1235: 0800
            movi         a5, 6 /* 0x00000006 */                # 1237: 0c65
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 1239: 022027
            movi         a6, 6 /* 0x00000006 */                # 123c: 0c66
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 123e: c00000
            l32i         a12, sp, 4 /* [(local1)] */           # 1241: c811
            l32i         a0, sp, 0 /* [(local0)] */            # 1243: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1245: 12c110
            ret                                                # 1248: 0df0

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr002:   .asciz       " (%d,%d) "                           #    0: 20282564
                                                               #    4: 2c256429
                                                               #    8: 2000
            .balign      4
.Lstr003:   .asciz       "%d,%d "                              #    c: 25642c25
                                                               #   10: 642000
            .balign      4
.Lstr004:   .asciz       "stage %d: CGAIN=%d FGAIN=%d, DC_OS=(%d,%d), DAC=(%d,%d) \n" #   14: 73746167
                                                               #   18: 65202564
                                                               #   1c: 3a204347
                                                               #   20: 41494e3d
                                                               #   24: 25642046
                                                               #   28: 4741494e
                                                               #   2c: 3d25642c
                                                               #   30: 2044435f
                                                               #   34: 4f533d28
                                                               #   38: 25642c25
                                                               #   3c: 64292c20
                                                               #   40: 4441433d
                                                               #   44: 2825642c
                                                               #   48: 25642920
                                                               #   4c: 0a00
            .balign      4
.Label001:  .word        0x0000000a                            #   50: 0a000000
.Lstr005:   .asciz       "pwctrl: rate_i=%d, target_power=%d, detect_power=%d\n" #   54: 70776374
                                                               #   58: 726c3a20
                                                               #   5c: 72617465
                                                               #   60: 5f693d25
                                                               #   64: 642c2074
                                                               #   68: 61726765
                                                               #   6c: 745f706f
                                                               #   70: 7765723d
                                                               #   74: 25642c20
                                                               #   78: 64657465
                                                               #   7c: 63745f70
                                                               #   80: 6f776572
                                                               #   84: 3d25640a
                                                               #   88: 00
            .balign      4
.Lstr006:   .asciz       "num_k=%d, power_out=%d, "            #   8c: 6e756d5f
                                                               #   90: 6b3d2564
                                                               #   94: 2c20706f
                                                               #   98: 7765725f
                                                               #   9c: 6f75743d
                                                               #   a0: 25642c20
                                                               #   a4: 00
            .balign      4
.Lstr007:   .asciz       "reg_i=%d, indata=%d\n"               #   a8: 7265675f
                                                               #   ac: 693d2564
                                                               #   b0: 2c20696e
                                                               #   b4: 64617461
                                                               #   b8: 3d25640a
                                                               #   bc: 00
            .balign      4
.Lstr008:   .asciz       "txiq: tone_atten=%d\n"               #   c0: 74786971
                                                               #   c4: 3a20746f
                                                               #   c8: 6e655f61
                                                               #   cc: 7474656e
                                                               #   d0: 3d25640a
                                                               #   d4: 00
            .balign      4
.Lstr009:   .asciz       "bt, "                                #   d8: 62742c20
                                                               #   dc: 00
            .balign      4
.Lstr010:   .asciz       "%d, "                                #   e0: 25642c20
                                                               #   e4: 00

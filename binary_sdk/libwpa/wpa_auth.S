
            .section     .text, "ax", @progbits

# Function @ .text+0x0
            .balign      4
            .literal_position
.Lfunc001:  movi         a4, 1 /* 0x00000001 */                #    0: 0c14
            beqi         a2, 2, .Lbr001                        #    2: 262207
            beqi         a2, 64, .Lbr001                       #    5: 26d204
            beqi         a2, 0x100, .Lbr001                    #    8: 26f201
            movi         a4, 0 /* 0x00000000 */                #    b: 0c04
.Lbr001:    mov          a2, a4                                #    d: 2d04
            ret                                                #    f: 0df0

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000
                                                               #    8: 00000000
                                                               #    c: 00000000
                                                               #   10: 00000000
                                                               #   14: 00000000
                                                               #   18: 00000000
                                                               #   1c: 00000000
                                                               #   20: 00000000
                                                               #   24: 00000000
                                                               #   28: 00000000
                                                               #   2c: 00000000
                                                               #   30: 00000000
                                                               #   34: 00000000
                                                               #   38: 00000000

# Function @ .irom0.text+0x3c
# Local variables/stack:
#     (local0):  word[12]  @ -0x60
#     (local1):  word      @ -0x30
#     (local2):  word      @ -0x2c
#     (local3):  word      @ -0x28
#     (local4):  word      @ -0x24
#     (local5):  word      @ -0x20
#     (local6):  word      @ -0x1c
#     (local7):  word      @ -0x18
#     (local8):  word      @ -0x14
#     (local9):  word[4]   @ -0x10
            .balign      4
.Lfunc002:  addi         sp, sp, -96 /* (local0) */            #   3c: 12c1a0
            s32i         a15, sp, 76 /* a15 -> [(local8)] */   #   3f: f26113
            s32i         a7, sp, 56 /* arg5 -> [(local3)] */   #   42: 79e1
            s32i         a14, sp, 72 /* a14 -> [(local7)] */   #   44: e26112
            s32i         a0, sp, 60 /* a0 -> [(local4)] */     #   47: 09f1
            s32i         a12, sp, 64 /* a12 -> [(local5)] */   #   49: c26110
            s32i         a13, sp, 68 /* a13 -> [(local6)] */   #   4c: d26111
            mov          a12, a4 /* arg2 */                    #   4f: cd04
            mov          a13, a5 /* arg3 */                    #   51: dd05
            l8ui         a0, a5, 0 /* [arg3] */                #   53: 020500
            mov          a14, a6 /* arg4 */                    #   56: ed06
            bbci         a0, 0, .Lbr002                        #   58: 07601d
            mov          a2, a5 /* arg3 */                     #   5b: 2d05
            addi         a15, a6, 2 /* arg4+0x2 */             #   5d: 2bf6
            s32i         a6, sp, 48 /* arg4 -> [(local1)] */   #   5f: 69c1
            s32i         a15, sp, 52 /* arg4+0x2 -> [(local2)] */ #   61: f9d1
            extui        a15, a15, 0, 8                        #   63: f0f074
            call0        sdk_cnx_node_search                   #   66: 01eaffc0
                                                               #   6a: 0000
            l32i         a0, sp, 52 /* [(local2)] */           #   6c: 08d1
            extui        a0, a0, 0, 8                          #   6e: 000074
            addi         a0, a0, -1                            #   71: 0b00
            s8i          a0, a2, 233                           #   73: 0242e9
            j            .Lbr005                               #   76: 060700
.Lbr002:    beqi         a4, 1, .Lbr003                        #   79: 261412
            beqi         a4, 5, .Lbr003                        #   7c: 26540f
            mov          a2, a5 /* arg3 */                     #   7f: 2d05
            call0        sdk_cnx_node_search                   #   81: 01e4ffc0
                                                               #   85: 0000
            l8ui         a0, a2, 232                           #   87: 0202e8
            addi         a0, a0, 1                             #   8a: 1b00
            j            .Lbr004                               #   8c: 460000
.Lbr003:    addi         a0, a14, 9 /* arg4+0x9 */             #   8f: 9b0e
.Lbr004:    extui        a15, a0, 0, 8                         #   91: 00f074
            s32i         a14, sp, 48 /* arg4 -> [(local1)] */  #   94: e9c1
.Lbr005:    addi         a14, a15, 1                           #   96: 1bef
            bnez         a12, .Lbr006                          #   98: cc9c
            mov          a2, a14                               #   9a: 2d0e
            call0        sdk_ic_remove_key                     #   9c: 01dfffc0
                                                               #   a0: 0000
            j            .Lbr013                               #   a2: 062a00
.Lbr006:    l32i         a2, sp, 96 /* [(local10)] */          #   a5: 222118
            s32i         a2, sp, 80 /* [(local10)] -> [(local9)] */ #   a8: 226114
            bnei         a12, 2, .Lbr007                       #   ab: 662c2f
            addi         a2, sp, 16 /* (FP)-0x50 */            #   ae: 22c110
            l32i         a3, sp, 56 /* [(local3)] */           #   b1: 38e1
            movi         a4, 24 /* 0x00000018 */               #   b3: 1c84
            call0        memcpy                                #   b5: 01d9ffc0
                                                               #   b9: 0000
            addi         a2, sp, 32 /* (FP)-0x40 */            #   bb: 22c120
            l32i         a3, sp, 56 /* [(local3)] */           #   be: 38e1
            movi         a4, 8 /* 0x00000008 */                #   c0: 0c84
            addi         a3, a3, 24 /* [(local3)]+0x18 */      #   c2: 32c318
            call0        memcpy                                #   c5: 01d6ffc0
                                                               #   c9: 0000
            addi         a2, sp, 40 /* (FP)-0x38 */            #   cb: 22c128
            l32i         a3, sp, 56 /* [(local3)] */           #   ce: 38e1
            movi         a4, 8 /* 0x00000008 */                #   d0: 0c84
            addi         a3, a3, 16 /* [(local3)]+0x10 */      #   d2: 32c310
            call0        memcpy                                #   d5: 01d3ffc0
                                                               #   d9: 0000
            j            .Lbr008                               #   db: 460300
.Lbr007:    addi         a2, sp, 16 /* (FP)-0x50 */            #   de: 22c110
            l32i         a3, sp, 56 /* [(local3)] */           #   e1: 38e1
            l32i         a4, sp, 80 /* [(local9)] */           #   e3: 422114
            call0        memcpy                                #   e6: 01d0ffc0
                                                               #   ea: 0000
.Lbr008:    mov          a5, a13 /* arg3 */                    #   ec: 5d0d
            movi         a2, 1 /* 0x00000001 */                #   ee: 0c12
            mov          a3, a12 /* arg2 */                    #   f0: 3d0c
            mov          a6, a14                               #   f2: 6d0e
            l32i         a4, sp, 80 /* [(local9)] */           #   f4: 422114
            addi         a7, sp, 16 /* (FP)-0x50 */            #   f7: 72c110
            s32i         a4, sp, 0 /* [(local9)] -> [(local0)] */ #   fa: 4901
            l32i         a4, sp, 48 /* [(local1)] */           #   fc: 48c1
            call0        sdk_ic_set_key                        #   fe: 01cbffc0
                                                               #  102: 0000
            movi         a5, sdk_g_ic                          #  104: 51bfff
            addx4        a15, a15, a5                          #  107: 50ffa0
            l32i         a2, a15, 0x18c                        #  10a: 222f63
            beqz         a2, .Lbr009                           #  10d: 8c42
            call0        free                                  #  10f: 01c8ffc0
                                                               #  113: 0000
.Lbr009:    movi         a2, 160 /* 0x000000a0 */              #  115: 22a0a0
            call0        malloc                                #  118: 01c7ffc0
                                                               #  11c: 0000
            mov          a13, a2                               #  11e: dd02
            s32i         a2, a15, 0x18c                        #  120: 226f63
            movi         a3, 160 /* 0x000000a0 */              #  123: 32a0a0
            call0        bzero                                 #  126: 01c4ffc0
                                                               #  12a: 0000
            bnei         a12, 2, .Lbr010                       #  12c: 662c12
            movi         a6, 1 /* 0x00000001 */                #  12f: 0c16
            movi         a7, 0 /* 0x00000000 */                #  131: 0c07
            movi         a8, sdk_tkip                          #  133: 81b4ff
            s32i         a8, a13, 152                          #  136: 826d26
            s32i         a7, a13, 148                          #  139: 726d25
            s32i         a6, a13, 144                          #  13c: 626d24
            j            .Lbr012                               #  13f: 060200
.Lbr010:    bnei         a12, 3, .Lbr014                       #  142: 663c1d
            movi         a0, sdk_ccmp                          #  145: 01b0ff
.Lbr011:    s32i         a0, a13, 152                          #  148: 026d26
.Lbr012:    s16i         a14, a13, 0                           #  14b: e25d00
.Lbr013:    movi         a2, 0 /* 0x00000000 */                #  14e: 0c02
            l32i         a12, sp, 64 /* [(local5)] */          #  150: c22110
            l32i         a13, sp, 68 /* [(local6)] */          #  153: d22111
            l32i         a14, sp, 72 /* [(local7)] */          #  156: e22112
            l32i         a15, sp, 76 /* [(local8)] */          #  159: f22113
            l32i         a0, sp, 60 /* [(local4)] */           #  15c: 08f1
            addi         sp, sp, 96 /* (local10) */            #  15e: 12c160
            ret           /* 0x00000000 */                     #  161: 0df0
.Lbr014:    beqi         a12, 1, .Lbr015                       #  163: 261c02
            bnei         a12, 5, .Lbr012                       #  166: 665ce1
.Lbr015:    movi         a0, sdk_wep                           #  169: 01a8ff
            j            .Lbr011                               #  16c: 06f6ff

            .balign      4
# Function @ .irom0.text+0x170
            .balign      4
            .global      sdk_wpa_auth_for_each_sta
            .type        sdk_wpa_auth_for_each_sta, @function
sdk_wpa_auth_for_each_sta:
            movi         a2, 0 /* 0x00000000 */                #  170: 0c02
            ret           /* 0x00000000 */                     #  172: 0df0

# Function @ .irom0.text+0x174
            .balign      4
.Lfunc003:  ret           /* arg0 */                           #  174: 0df0

            .balign      4
# Function @ .irom0.text+0x178
            .balign      4
.Lfunc004:  movi         a2, 0 /* 0x00000000 */                #  178: 0c02
            ret           /* 0x00000000 */                     #  17a: 0df0

            .literal_position                                  #  17c: 84010000
                                                               #  180: 00000000

# Function @ .irom0.text+0x184
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
.Lfunc005:  addi         sp, sp, -32 /* (local0) */            #  184: 12c1e0
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  187: e931
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  189: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  18b: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  18d: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  18f: c911
            l32i         a12, a2, 0 /* [arg0] */               #  191: c802
            mov          a13, a2 /* arg0 */                    #  193: dd02
            beqz         a12, .Lbr018                          #  195: 9c9c
            movi         a14, 0 /* 0x00000000 */               #  197: 0c0e
            movi         a15, 1 /* 0x00000001 */               #  199: 0c1f
.Lbr016:    s32i         a15, a12, 16                          #  19b: f94c
.Lbr017:    s32i         a14, a12, 200                         #  19d: e26c32
            mov          a2, a13 /* arg0 */                    #  1a0: 2d0d
            mov          a3, a12                               #  1a2: 3d0c
            call0        .Lfunc047                             #  1a4: 85cc01
            l32i         a0, a12, 200                          #  1a7: 022c32
            bnez         a0, .Lbr017                           #  1aa: 56f0fe
            l32i         a12, a12, 0                           #  1ad: c80c
            bnez         a12, .Lbr016                          #  1af: 568cfe
.Lbr018:    l32i         a2, a13, 20 /* [arg0+0x14] */         #  1b2: 285d
            beqz         a2, .Lbr019                           #  1b4: 8cd2
            mov          a5, a13 /* arg0 */                    #  1b6: 5d0d
            movi         a3, 0 /* 0x00000000 */                #  1b8: 0c03
            movi         a4, .Lfunc005                         #  1ba: 41f0ff
            movi         a6, 0 /* 0x00000000 */                #  1bd: 0c06
            call0        sdk_eloop_register_timeout            #  1bf: 01f0ffc0
                                                               #  1c3: 0000
.Lbr019:    l32i         a12, sp, 4 /* [(local1)] */           #  1c5: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  1c7: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  1c9: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  1cb: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  1cd: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  1cf: 12c120
            ret                                                #  1d2: 0df0

# Function @ .irom0.text+0x1d4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc006:  mov          a2, a3 /* arg1 */                     #  1d4: 2d03
            addi         sp, sp, -16 /* (local0) */            #  1d6: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  1d9: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  1db: 0901
            mov          a12, a3 /* arg1 */                    #  1dd: cd03
            call0        .Lfunc010                             #  1df: 453100
            mov          a2, a12 /* arg1 */                    #  1e2: 2d0c
            call0        .Lfunc048                             #  1e4: 05cd01
            l32i         a12, sp, 4 /* [(local1)] */           #  1e7: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  1e9: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  1eb: 12c110
            ret                                                #  1ee: 0df0

            .literal_position                                  #  1f0: 00000000
                                                               #  1f4: 00000000
                                                               #  1f8: 00000000
                                                               #  1fc: 00000000
                                                               #  200: 00000000
                                                               #  204: 00000000
                                                               #  208: 00000000

# Function @ .irom0.text+0x20c
# Local variables/stack:
#     (local0):  word[20]  @ -0x70
#     (local1):  word      @ -0x20
#     (local2):  word      @ -0x1c
#     (local3):  word[3]   @ -0x18
#     (local4):  word[3]   @ -0xc
            .balign      4
.Lfunc007:  addi         sp, sp, -112 /* (local0) */           #  20c: 12c190
            s32i         a0, sp, 84 /* a0 -> [(local2)] */     #  20f: 026115
            s32i         a12, sp, 88 /* a12 -> [(local3)] */   #  212: c26116
            s32i         a2, sp, 80 /* arg0 -> [(local1)] */   #  215: 226114
            mov          a12, a3 /* arg1 */                    #  218: cd03
            addi         a2, a3, 72 /* arg1+0x48 */            #  21a: 22c348
            movi         a3, 32 /* 0x00000020 */               #  21d: 2c03
            call0        os_get_random                         #  21f: 01f5ffc0
                                                               #  223: 0000
            bltz         a2, .Lbr021                           #  225: 962206
            s32i         a12, sp, 100 /* arg1 -> [(local4)] */ #  228: c26119
            addi         a2, sp, 16 /* (FP)-0x60 */            #  22b: 22c110
            l32i         a3, sp, 80 /* [(local1)] */           #  22e: 322114
            movi         a4, 6 /* 0x00000006 */                #  231: 0c64
            addi         a3, a3, 88 /* [(local1)]+0x58 */      #  233: 32c358
            call0        memcpy                                #  236: 01f0ffc0
                                                               #  23a: 0000
            addi         a2, sp, 22 /* (FP)-0x5a */            #  23c: 22c116
            call0        sdk_wpa_get_ntp_timestamp             #  23f: 01efffc0
                                                               #  243: 0000
            addi         a2, sp, 30 /* (FP)-0x52 */            #  245: 22c11e
            movi         a4, 4 /* 0x00000004 */                #  248: 0c44
            addi         a3, sp, 100 /* (local4) */            #  24a: 32c164
            call0        memcpy                                #  24d: 01ecffc0
                                                               #  251: 0000
            addi         a2, sp, 48 /* (FP)-0x40 */            #  253: 22c130
            movi         a3, 32 /* 0x00000020 */               #  256: 2c03
            call0        os_get_random                         #  258: 01ebffc0
                                                               #  25c: 0000
            bltz         a2, .Lbr021                           #  25e: 969202
            addi         a7, a12, 36 /* arg1+0x24 */           #  261: 72cc24
            addi         a2, sp, 48 /* (FP)-0x40 */            #  264: 22c130
            movi         a3, 32 /* 0x00000020 */               #  267: 2c03
            addi         a5, sp, 16 /* (FP)-0x60 */            #  269: 52c110
            movi         a4, 32 /* 0x00000020 */               #  26c: 2c04
            movi         a6, 18 /* 0x00000012 */               #  26e: 1c26
            s32i         a4, sp, 0 /* 0x00000020 -> [(local0)] */ #  270: 4901
            movi         a4, .Lstr001                          #  272: 41dfff
            call0        sdk_sha1_prf                          #  275: 01e4ffc0
                                                               #  279: 0000
            bltz         a2, .Lbr021                           #  27b: 96c200
            movi         a2, 0 /* 0x00000000 */                #  27e: 0c02
.Lbr020:    l32i         a12, sp, 88 /* [(local3)] */          #  280: c22116
            l32i         a0, sp, 84 /* [(local2)] */           #  283: 022115
            addi         sp, sp, 112 /* (top of frame) */      #  286: 12c170
            ret                                                #  289: 0df0
.Lbr021:    movi         a2, -1 /* 0xffffffff */               #  28b: 7cf2
            j            .Lbr020                               #  28d: c6fbff

            .literal_position                                  #  290: 00000000
                                                               #  294: 00000000
                                                               #  298: 00000000
                                                               #  29c: 701e0000

# Function @ .irom0.text+0x2a0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
.Lfunc008:  addi         sp, sp, -16 /* (local0) */            #  2a0: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  2a3: c921
            s32i         a4, sp, 0 /* arg2 -> [(local0)] */    #  2a5: 4901
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  2a7: d931
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  2a9: 0911
            mov          a13, a2 /* arg0 */                    #  2ab: dd02
            movi         a2, 212 /* 0x000000d4 */              #  2ad: 22a0d4
            call0        zalloc                                #  2b0: 01f8ffc0
                                                               #  2b4: 0000
            mov          a12, a2                               #  2b6: cd02
            beqz         a2, .Lbr022                           #  2b8: 9ce2
            movi         a0, 1 /* 0x00000001 */                #  2ba: 0c10
            s32i         a0, a2, 32                            #  2bc: 0982
            l32i         a2, a13, 16 /* [arg0+0x10] */         #  2be: 284d
            call0        sdk_wpa_cipher_key_len                #  2c0: 01f5ffc0
                                                               #  2c4: 0000
            s32i         a2, a12, 20                           #  2c6: 295c
            mov          a3, a12                               #  2c8: 3d0c
            mov          a2, a13 /* arg0 */                    #  2ca: 2d0d
            call0        .Lfunc007                             #  2cc: c5f3ff
            bgez         a2, .Lbr023                           #  2cf: d6c200
            mov          a2, a12                               #  2d2: 2d0c
            call0        free                                  #  2d4: 01f1ffc0
                                                               #  2d8: 0000
.Lbr022:    movi         a12, 0 /* 0x00000000 */               #  2da: 0c0c
            j            .Lbr024                               #  2dc: 060700
.Lbr023:    movi         a3, 1 /* 0x00000001 */                #  2df: 0c13
            l32i         a2, sp, 0 /* [(local0)] */            #  2e1: 2801
            s32i         a3, a12, 8                            #  2e3: 392c
            bnez         a2, .Lbr024                           #  2e5: dc32
            mov          a2, a13 /* arg0 */                    #  2e7: 2d0d
            mov          a3, a12                               #  2e9: 3d0c
            call0        .Lfunc047                             #  2eb: 01ecffc0
                                                               #  2ef: 0000
            mov          a2, a13 /* arg0 */                    #  2f1: 2d0d
            mov          a3, a12                               #  2f3: 3d0c
            movi         a4, 0 /* 0x00000000 */                #  2f5: 0c04
            s32i         a4, a12, 8                            #  2f7: 492c
            call0        .Lfunc047                             #  2f9: 45b701
.Lbr024:    l32i         a0, sp, 4 /* [(local1)] */            #  2fc: 0811
            mov          a2, a12                               #  2fe: 2d0c
            l32i         a13, sp, 12 /* [(local3)] */          #  300: d831
            l32i         a12, sp, 8 /* [(local2)] */           #  302: c821
            addi         sp, sp, 16 /* (top of frame) */       #  304: 12c110
            ret                                                #  307: 0df0

            .literal_position                                  #  30c: 00000000
                                                               #  310: 00000000
                                                               #  314: 00000000
                                                               #  318: 00000000
                                                               #  31c: 00000000
                                                               #  320: 00000000
                                                               #  324: 00000000

# Function @ .irom0.text+0x328
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_wpa_init
            .type        sdk_wpa_init, @function
sdk_wpa_init:
            mov          a6, a2 /* arg0 */                     #  328: 6d02
            addi         sp, sp, -16 /* (local0) */            #  32a: 12c1f0
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  32d: c931
            movi         a2, 96 /* 0x00000060 */               #  32f: 22a060
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    #  332: 3901
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  334: 0921
            s32i         a6, sp, 4 /* arg0 -> [(local1)] */    #  336: 6911
            call0        zalloc                                #  338: 01f5ffc0
                                                               #  33c: 0000
            mov          a12, a2                               #  33e: cd02
            beqz         a2, .Lbr026                           #  340: 16b204
            l32i         a3, sp, 4 /* [(local1)] */            #  343: 3811
            addi         a2, a2, 88                            #  345: 22c258
            movi         a4, 6 /* 0x00000006 */                #  348: 0c64
            call0        memcpy                                #  34a: 01f1ffc0
                                                               #  34e: 0000
            l32i         a3, sp, 0 /* [(local0)] */            #  350: 3801
            addi         a2, a12, 4                            #  352: 4b2c
            movi         a4, 76 /* 0x0000004c */               #  354: 4cc4
            call0        memcpy                                #  356: 01efffc0
                                                               #  35a: 0000
            mov          a2, a12                               #  35c: 2d0c
            call0        sdk_wpa_auth_gen_wpa_ie               #  35e: 01eeffc0
                                                               #  362: 0000
            beqz         a2, .Lbr025                           #  364: 8c92
            mov          a2, a12                               #  366: 2d0c
            call0        free                                  #  368: 01edffc0
                                                               #  36c: 0000
            j            .Lbr026                               #  36e: 460700
.Lbr025:    mov          a2, a12                               #  371: 2d0c
            movi         a3, 0 /* 0x00000000 */                #  373: 0c03
            movi         a4, 0 /* 0x00000000 */                #  375: 0c04
            call0        .Lfunc008                             #  377: 85f2ff
            s32i         a2, a12, 0                            #  37a: 290c
            bnez         a2, .Lbr027                           #  37c: dc12
            l32i         a2, a12, 80                           #  37e: 222c14
            call0        free                                  #  381: 01e7ffc0
                                                               #  385: 0000
            mov          a2, a12                               #  387: 2d0c
            call0        free                                  #  389: 01e6ffc0
                                                               #  38d: 0000
.Lbr026:    movi         a12, 0 /* 0x00000000 */               #  38f: 0c0c
.Lbr027:    mov          a2, a12                               #  391: 2d0c
            l32i         a0, sp, 8 /* [(local2)] */            #  393: 0821
            l32i         a12, sp, 12 /* [(local3)] */          #  395: c831
            addi         sp, sp, 16 /* (top of frame) */       #  397: 12c110
            ret                                                #  39a: 0df0

            .literal_position                                  #  39c: 00000000
                                                               #  3a0: 00000000

# Function @ .irom0.text+0x3a4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_wpa_auth_sta_init
            .type        sdk_wpa_auth_sta_init, @function
sdk_wpa_auth_sta_init:
            mov          a5, a2 /* arg0 */                     #  3a4: 5d02
            addi         sp, sp, -16 /* (local0) */            #  3a6: 12c1f0
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  3a9: c931
            movi         a2, 412 /* 0x0000019c */              #  3ab: 22a19c
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    #  3ae: 3901
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  3b0: 0921
            s32i         a5, sp, 4 /* arg0 -> [(local1)] */    #  3b2: 5911
            call0        zalloc                                #  3b4: 01faffc0
                                                               #  3b8: 0000
            mov          a12, a2                               #  3ba: cd02
            bnez         a2, .Lbr028                           #  3bc: cc32
            movi         a12, 0 /* 0x00000000 */               #  3be: 0c0c
            j            .Lbr029                               #  3c0: c60400
.Lbr028:    l32i         a3, sp, 0 /* [(local0)] */            #  3c3: 3801
            addi         a2, a2, 8                             #  3c5: 8b22
            movi         a4, 6 /* 0x00000006 */                #  3c7: 0c64
            call0        memcpy                                #  3c9: 01f5ffc0
                                                               #  3cd: 0000
            l32i         a0, sp, 4 /* [(local1)] */            #  3cf: 0811
            s32i         a0, a12, 0                            #  3d1: 090c
            l32i         a0, a0, 0 /* [[(local1)]] */          #  3d3: 0800
            s32i         a0, a12, 4                            #  3d5: 091c
.Lbr029:    mov          a2, a12                               #  3d7: 2d0c
            l32i         a0, sp, 8 /* [(local2)] */            #  3d9: 0821
            l32i         a12, sp, 12 /* [(local3)] */          #  3db: c831
            addi         sp, sp, 16 /* (top of frame) */       #  3dd: 12c110
            ret                                                #  3e0: 0df0

            .literal_position                                  #  3e4: 00000000
                                                               #  3e8: b81e0000
                                                               #  3ec: b81e0000

# Function @ .irom0.text+0x3f0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wpa_auth_sta_associated
            .type        sdk_wpa_auth_sta_associated, @function
sdk_wpa_auth_sta_associated:
            addi         sp, sp, -16 /* (local0) */            #  3f0: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  3f3: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  3f5: 0901
            mov          a12, a3 /* arg1 */                    #  3f7: cd03
            beqz         a2, .Lbr033                           #  3f9: 168206
            l32i         a0, a2, 4 /* [arg0+0x4] */            #  3fc: 0812
            beqz         a0, .Lbr033                           #  3fe: 163006
            beqz         a3, .Lbr033                           #  401: 160306
            movi         a2, 244 /* 0x000000f4 */              #  404: 22a0f4
            add          a2, a3, a2 /* arg1+0xf4 */            #  407: 2a23
            l8ui         a0, a2, 128 /* [arg1+0x174] */        #  409: 020280
            bbci         a0, 3, .Lbr030                        #  40c: 37601d
            movi         a2, 252 /* 0x000000fc */              #  40f: 22a0fc
            movi         a4, 48 /* 0x00000030 */               #  412: 3c04
            add          a2, a3, a2 /* arg1+0xfc */            #  414: 2a23
            movi         a3, 0 /* 0x00000000 */                #  416: 0c03
            call0        memset                                #  418: 01f3ffc0
                                                               #  41c: 0000
            mov          a2, a12 /* arg1 */                    #  41e: 2d0c
            movi         a3, 1 /* 0x00000001 */                #  420: 0c13
            s32i         a3, a12, 36 /* 0x00000001 -> [arg1+0x24] */ #  422: 399c
            call0        .Lfunc048                             #  424: 01f1ffc0
                                                               #  428: 0000
            j            .Lbr032                               #  42a: 860b00
.Lbr030:    movi         a4, 1 /* 0x00000001 */                #  42d: 0c14
            movi         a6, 8 /* 0x00000008 */                #  42f: 0c86
            movi         a5, 247 /* 0x000000f7 */              #  431: 52a0f7
            and          a5, a0, a5                            #  434: 505010
            or           a5, a5, a6                            #  437: 605520
            s8i          a5, a2, 128 /* a5 -> [arg1+0x174] */  #  43a: 524280
            s32i         a4, a3, 24 /* 0x00000001 -> [arg1+0x18] */ #  43d: 4963
            mov          a2, a3 /* arg1 */                     #  43f: 2d03
            call0        .Lfunc048                             #  441: 01eaffc0
                                                               #  445: 0000
            bnei         a2, 1, .Lbr031                        #  447: 661204
            movi         a2, 1 /* 0x00000001 */                #  44a: 0c12
            j            .Lbr032                               #  44c: 060300
.Lbr031:    mov          a2, a12 /* arg1 */                    #  44f: 2d0c
            movi         a6, 0 /* 0x00000000 */                #  451: 0c06
            movi         a7, 1 /* 0x00000001 */                #  453: 0c17
            s32i         a7, a12, 32 /* 0x00000001 -> [arg1+0x20] */ #  455: 798c
            s32i         a6, a12, 24 /* 0x00000000 -> [arg1+0x18] */ #  457: 696c
            call0        .Lfunc048                             #  459: c5a501
.Lbr032:    l32i         a12, sp, 4 /* [(local1)] */           #  45c: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  45e: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  460: 12c110
            ret                                                #  463: 0df0
.Lbr033:    movi         a2, -1 /* 0xffffffff */               #  465: 7cf2
            j            .Lbr032                               #  467: 46fcff

            .balign      4
# Function @ .irom0.text+0x46c
            .balign      4
            .global      sdk_wpa_auth_sta_no_wpa
            .type        sdk_wpa_auth_sta_no_wpa, @function
sdk_wpa_auth_sta_no_wpa:
            beqz         a2, .Lbr034                           #  46c: 8c32
            movi         a3, 0 /* 0x00000000 */                #  46e: 0c03
            s32i         a3, a2, 0x194 /* 0x00000000 -> [arg0+0x194] */ #  470: 326265
.Lbr034:    ret           /* arg0 */                           #  473: 0df0

            .literal_position                                  #  478: 00000000
                                                               #  47c: 00000000
                                                               #  480: 00000000

# Function @ .irom0.text+0x484
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc009:  addi         sp, sp, -16 /* (local0) */            #  484: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  487: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  489: 0901
            l32i         a0, a2, 72 /* [arg0+0x48] */          #  48b: 022212
            mov          a12, a2 /* arg0 */                    #  48e: cd02
            beqz         a0, .Lbr035                           #  490: 8cb0
            l32i         a4, a2, 4 /* [arg0+0x4] */            #  492: 4812
            l32i         a3, a4, 12 /* [[arg0+0x4]+0xc] */     #  494: 3834
            movi         a2, 0 /* 0x00000000 */                #  496: 0c02
            addi         a3, a3, -1 /* [[arg0+0x4]+0xc]-0x1 */ #  498: 0b33
            s32i         a3, a4, 12 /* [[arg0+0x4]+0xc]-0x1 -> [[arg0+0x4]+0xc] */ #  49a: 3934
            s32i         a2, a12, 72 /* 0x00000000 -> [arg0+0x48] */ #  49c: 226c12
.Lbr035:    l32i         a2, a12, 0x16c /* [arg0+0x16c] */     #  49f: 222c5b
            call0        free                                  #  4a2: 01f5ffc0
                                                               #  4a6: 0000
            l32i         a2, a12, 0x184 /* [arg0+0x184] */     #  4a8: 222c61
            call0        free                                  #  4ab: 01f4ffc0
                                                               #  4af: 0000
            mov          a2, a12 /* arg0 */                    #  4b1: 2d0c
            call0        free                                  #  4b3: 01f3ffc0
                                                               #  4b7: 0000
            l32i         a12, sp, 4 /* [(local1)] */           #  4b9: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  4bb: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  4bd: 12c110
            ret                                                #  4c0: 0df0

            .balign      4
# Function @ .irom0.text+0x4c4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wpa_auth_sta_deinit
            .type        sdk_wpa_auth_sta_deinit, @function
sdk_wpa_auth_sta_deinit:
            addi         sp, sp, -16 /* (local0) */            #  4c4: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  4c7: 0901
            beqz         a2, .Lbr037                           #  4c9: 9cd2
            movi         a4, 244 /* 0x000000f4 */              #  4cb: 42a0f4
            add          a4, a2, a4 /* arg0+0xf4 */            #  4ce: 4a42
            l8ui         a0, a4, 128 /* [arg0+0x174] */        #  4d0: 020480
            movi         a6, 4 /* 0x00000004 */                #  4d3: 0c46
            bbci         a0, 1, .Lbr036                        #  4d5: 17600e
            movi         a5, 251 /* 0x000000fb */              #  4d8: 52a0fb
            and          a5, a0, a5                            #  4db: 505010
            or           a5, a5, a6                            #  4de: 605520
            s8i          a5, a4, 128 /* a5 -> [arg0+0x174] */  #  4e1: 524480
            j            .Lbr037                               #  4e4: 860000
.Lbr036:    call0        .Lfunc009                             #  4e7: c5f9ff
.Lbr037:    l32i         a0, sp, 0 /* [(local0)] */            #  4ea: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  4ec: 12c110
            ret                                                #  4ef: 0df0

            .balign      4
# Function @ .irom0.text+0x4f4
            .balign      4
.Lfunc010:  beqz         a2, .Lbr038                           #  4f4: 8c82
            movi         a3, 0 /* 0x00000000 */                #  4f6: 0c03
            movi         a4, 1 /* 0x00000001 */                #  4f8: 0c14
            s32i         a4, a2, 0x160 /* 0x00000001 -> [arg0+0x160] */ #  4fa: 426258
            s32i         a3, a2, 236 /* 0x00000000 -> [arg0+0xec] */ #  4fd: 32623b
.Lbr038:    ret           /* arg0 */                           #  500: 0df0

            .literal_position                                  #  504: 00000000

# Function @ .irom0.text+0x508
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
.Lfunc011:  addi         sp, sp, -16 /* (local0) */            #  508: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  50b: 0911
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  50d: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  50f: c921
            mov          a13, a3 /* arg1 */                    #  511: dd03
            mov          a12, a2 /* arg0 */                    #  513: cd02
            addi         a0, a2, 48 /* arg0+0x30 */            #  515: 02c230
            s32i         a0, sp, 0 /* arg0+0x30 -> [(local0)] */ #  518: 0901
.Lbr039:    l32i         a2, a12, 8                            #  51a: 282c
            beqz         a2, .Lbr041                           #  51c: 9c82
            mov          a2, a13 /* arg1 */                    #  51e: 2d0d
            mov          a3, a12                               #  520: 3d0c
            movi         a4, 8 /* 0x00000008 */                #  522: 0c84
            call0        memcmp                                #  524: 01f8ffc0
                                                               #  528: 0000
            bnez         a2, .Lbr040                           #  52a: cc32
            movi         a2, 1 /* 0x00000001 */                #  52c: 0c12
            j            .Lbr042                               #  52e: 060200
.Lbr040:    l32i         a3, sp, 0 /* [(local0)] */            #  531: 3801
            addi         a12, a12, 12                          #  533: cbcc
            bne          a12, a3, .Lbr039                      #  535: 379ce1
.Lbr041:    movi         a2, 0 /* 0x00000000 */                #  538: 0c02
.Lbr042:    l32i         a12, sp, 8 /* [(local2)] */           #  53a: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  53c: d831
            l32i         a0, sp, 4 /* [(local1)] */            #  53e: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  540: 12c110
            ret                                                #  543: 0df0

            .literal_position                                  #  548: 00000000

# Function @ .irom0.text+0x54c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
.Lfunc012:  addi         sp, sp, -16 /* (local0) */            #  54c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  54f: 0901
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  551: e931
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  553: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  555: c911
            mov          a13, a3 /* arg1 */                    #  557: dd03
            mov          a12, a2 /* arg0 */                    #  559: cd02
            addi         a14, a2, 48 /* arg0+0x30 */           #  55b: e2c230
            movi         a0, 0 /* 0x00000000 */                #  55e: 0c00
.Lbr043:    l32i         a2, a12, 8                            #  560: 282c
            beqz         a2, .Lbr045                           #  562: 9c22
            beqz         a13, .Lbr044                          #  564: 8ced
            mov          a2, a13 /* arg1 */                    #  566: 2d0d
            mov          a3, a12                               #  568: 3d0c
            movi         a4, 8 /* 0x00000008 */                #  56a: 0c84
            call0        memcmp                                #  56c: 01f7ffc0
                                                               #  570: 0000
            movi         a0, 0 /* 0x00000000 */                #  572: 0c00
            bnez         a2, .Lbr045                           #  574: cc02
.Lbr044:    s32i         a0, a12, 8                            #  576: 092c
.Lbr045:    addi         a12, a12, 12                          #  578: cbcc
            bne          a12, a14, .Lbr043                     #  57a: e79ce2
            l32i         a12, sp, 4 /* [(local1)] */           #  57d: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  57f: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  581: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  583: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  585: 12c110
            ret                                                #  588: 0df0

            .balign      4
# Function @ .irom0.text+0x58c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc013:  mov          a2, a3 /* arg1 */                     #  58c: 2d03
            addi         sp, sp, -16 /* (local0) */            #  58e: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  591: 0901
            call0        .Lfunc010                             #  593: 05f6ff
            movi         a2, 0 /* 0x00000000 */                #  596: 0c02
            l32i         a0, sp, 0 /* [(local0)] */            #  598: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  59a: 12c110
            ret           /* 0x00000000 */                     #  59d: 0df0

            .literal_position                                  #  5a0: 00280000
                                                               #  5a4: 00080000
                                                               #  5a8: 00080000
                                                               #  5ac: 600a0000
                                                               #  5b0: 84010000
                                                               #  5b4: 00000000
                                                               #  5b8: 00000000
                                                               #  5bc: 9c0f0000
                                                               #  5c0: 00000000
                                                               #  5c4: 00000000
                                                               #  5c8: 00000000
                                                               #  5cc: 00000000
                                                               #  5d0: 00000000
                                                               #  5d4: 00000000
                                                               #  5d8: 00000000
                                                               #  5dc: 00000000
                                                               #  5e0: b81e0000
                                                               #  5e4: 00000000
                                                               #  5e8: 00000000
                                                               #  5ec: 00000000
                                                               #  5f0: 00000000

# Function @ .irom0.text+0x5f4
# Local variables/stack:
#     (local0):  word      @ -0x60
#     (local1):  word      @ -0x5c
#     (local2):  word      @ -0x58
#     (local3):  word[4]   @ -0x54
#     (local4):  word[2]   @ -0x44
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
#     (local17): word[3]   @ -0xc
            .balign      4
            .global      sdk_wpa_receive
            .type        sdk_wpa_receive, @function
sdk_wpa_receive:
            mov          a9, a2 /* arg0 */                     #  5f4: 9d02
            mov          a6, a4 /* arg2 */                     #  5f6: 6d04
            addi         sp, sp, -96 /* (local0) */            #  5f8: 12c1a0
            s32i         a13, sp, 72 /* a13 -> [(local14)] */  #  5fb: d26112
            s32i         a14, sp, 76 /* a14 -> [(local15)] */  #  5fe: e26113
            s32i         a15, sp, 80 /* a15 -> [(local16)] */  #  601: f26114
            s32i         a12, sp, 68 /* a12 -> [(local13)] */  #  604: c26111
            s32i         a0, sp, 64 /* a0 -> [(local12)] */    #  607: 026110
            mov          a12, a3 /* arg1 */                    #  60a: cd03
            beqz         a2, .Lbr048                           #  60c: 165206
            l32i         a0, a2, 4 /* [arg0+0x4] */            #  60f: 0812
            beqz         a0, .Lbr048                           #  611: 160006
            beqz         a3, .Lbr048                           #  614: 16d305
            movi         a3, 98 /* 0x00000062 */               #  617: 32a062
            bgeu         a3, a5, .Lbr048                       #  61a: 57b357
            l8ui         a15, a4, 6 /* [arg2+0x6] */           #  61d: f20406
            l8ui         a3, a4, 97 /* [arg2+0x61] */          #  620: 320461
            l8ui         a0, a4, 5 /* [arg2+0x5] */            #  623: 020405
            slli         a3, a3, 8                             #  626: 803311
            slli         a0, a0, 8                             #  629: 800011
            or           a15, a15, a0                          #  62c: 00ff20
            l8ui         a0, a4, 98 /* [arg2+0x62] */          #  62f: 020462
            addi         a4, a5, -99 /* arg3-0x63 */           #  632: 42c59d
            or           a0, a0, a3                            #  635: 300020
            extui        a0, a0, 0, 16                         #  638: 0000f4
            bltu         a4, a0, .Lbr048                       #  63b: 073436
            movi         a11, 254 /* 0x000000fe */             #  63e: b2a0fe
            s32i         a6, sp, 84 /* arg2 -> [(local17)] */  #  641: 626115
            l8ui         a10, a6, 4 /* [arg2+0x4] */           #  644: a20604
            s32i         a0, sp, 36 /* a0 -> [(local5)] */     #  647: 0991
            s32i         a5, sp, 48 /* arg3 -> [(local8)] */   #  649: 59c1
            s32i         a9, sp, 40 /* arg0 -> [(local6)] */   #  64b: 99a1
            movi         a14, 176 /* 0x000000b0 */             #  64d: e2a0b0
            l32i         a3, a12, 0x18c /* [arg1+0x18c] */     #  650: 322c63
            add          a14, a12, a14 /* arg1+0xb0 */         #  653: eaec
            bnei         a3, 2, .Lbr047                        #  655: 662319
            beq          a10, a11, .Lbr046                     #  658: b71a02
            bnei         a10, 2, .Lbr048                       #  65b: 662a16
.Lbr046:    movi         a2, 0x00002800                        #  65e: 21d0ff
            movi         a6, 0x00000800                        #  661: 61d0ff
            bnall        a15, a2, .Lbr049                      #  664: 27cf21
            extui        a3, a15, 10, 1                        #  667: f03a04
            beqz         a3, .Lbr061                           #  66a: 169318
            movi         a13, 6 /* 0x00000006 */               #  66d: 0c6d
            j            .Lbr051                               #  66f: 860a00
.Lbr047:    beq          a10, a11, .Lbr046                     #  672: b71ae8
.Lbr048:    l32i         a12, sp, 68 /* [(local13)] */         #  675: c22111
            l32i         a13, sp, 72 /* [(local14)] */         #  678: d22112
            l32i         a14, sp, 76 /* [(local15)] */         #  67b: e22113
            l32i         a15, sp, 80 /* [(local16)] */         #  67e: f22114
            l32i         a0, sp, 64 /* [(local12)] */          #  681: 022110
            addi         sp, sp, 96 /* (top of frame) */       #  684: 12c160
            ret                                                #  687: 0df0
.Lbr049:    extui        a4, a15, 13, 1                        #  689: f04d04
            beqz         a4, .Lbr062                           #  68c: 16c416
            movi         a13, 5 /* 0x00000005 */               #  68f: 0c5d
            j            .Lbr051                               #  691: 060200
.Lbr050:    movi         a5, 0 /* 0x00000000 */                #  694: 0c05
            l32i         a7, sp, 36 /* [(local5)] */           #  696: 7891
            movi         a13, 1 /* 0x00000001 */               #  698: 0c1d
            movnez       a13, a5, a7                           #  69a: 70d593
.Lbr051:    beqi         a13, 3, .Lbr052                       #  69d: 263d07
            beqz         a13, .Lbr052                          #  6a0: 8c4d
            beqi         a13, 1, .Lbr052                       #  6a2: 261d02
            bnei         a13, 2, .Lbr055                       #  6a5: 662d25
.Lbr052:    l32i         a0, a14, 224 /* [arg1+0x190] */       #  6a8: 022e38
            beqi         a0, 8, .Lbr053                        #  6ab: 268002
            bnei         a0, 64, .Lbr055                       #  6ae: 66d01c
.Lbr053:    mov          a2, a12 /* arg1 */                    #  6b1: 2d0c
            call0        .Lfunc004                             #  6b3: 45acff
            beqz         a2, .Lbr054                           #  6b6: 8c42
            extui        a8, a15, 0, 3                         #  6b8: f08024
            bnei         a8, 3, .Lbr048                        #  6bb: 6638b6
.Lbr054:    mov          a2, a12 /* arg1 */                    #  6be: 2d0c
            call0        .Lfunc004                             #  6c0: 45abff
            movi         a6, 0x00000800                        #  6c3: 61b9ff
            bnez         a2, .Lbr055                           #  6c6: cc42
            extui        a9, a15, 0, 3                         #  6c8: f09024
            bnei         a9, 2, .Lbr048                        #  6cb: 6629a6
.Lbr055:    and          a10, a15, a6                          #  6ce: 60af10
            s32i         a10, sp, 60 /* a10 -> [(local11)] */  #  6d1: a9f1
            bnone        a15, a6, .Lbr056                      #  6d3: 670f19
            l32i         a0, a12, 0x180 /* [arg1+0x180] */     #  6d6: 022c60
            beqz         a0, .Lbr056                           #  6d9: 9c30
            movi         a4, 8 /* 0x00000008 */                #  6db: 0c84
            l32i         a2, sp, 84 /* [(local17)] */          #  6dd: 222115
            movi         a3, 373 /* 0x00000175 */              #  6e0: 32a175
            add          a3, a12, a3 /* arg1+0x175 */          #  6e3: 3a3c
            addi         a2, a2, 9 /* [(local17)]+0x9 */       #  6e5: 9b22
            call0        memcmp                                #  6e7: 01b3ffc0
                                                               #  6eb: 0000
            blti         a2, 1, .Lbr048                        #  6ed: a61284
.Lbr056:    l32i         a3, sp, 60 /* [(local11)] */          #  6f0: 38f1
            bnez         a3, .Lbr057                           #  6f2: 567305
            l32i         a3, sp, 84 /* [(local17)] */          #  6f5: 322115
            movi         a2, 252 /* 0x000000fc */              #  6f8: 22a0fc
            add          a2, a12, a2 /* arg1+0xfc */           #  6fb: 2a2c
            addi         a3, a3, 9 /* [(local17)]+0x9 */       #  6fd: 9b33
            s32i         a3, sp, 56 /* [(local17)]+0x9 -> [(local10)] */ #  6ff: 39e1
            call0        .Lfunc011                             #  701: 45e0ff
            bnez         a2, .Lbr057                           #  704: 565204
            bnez         a13, .Lbr084                          #  707: 562d29
            l32i         a3, sp, 56 /* [(local10)] */          #  70a: 38e1
            movi         a2, 300 /* 0x0000012c */              #  70c: 22a12c
            add          a2, a12, a2 /* arg1+0x12c */          #  70f: 2a2c
            s32i         a2, sp, 52 /* arg1+0x12c -> [(local9)] */ #  711: 29d1
            call0        .Lfunc011                             #  713: 45dfff
            beqz         a2, .Lbr083                           #  716: 167227
            l32i         a3, a12, 16 /* [arg1+0x10] */         #  719: 384c
            addi         a3, a3, -10 /* [arg1+0x10]-0xa */     #  71b: 32c3f6
            bnez         a3, .Lbr083                           #  71e: 56f326
            addi         a2, a12, 108 /* arg1+0x6c */          #  721: 22cc6c
            l32i         a3, sp, 84 /* [(local17)] */          #  724: 322115
            movi         a4, 32 /* 0x00000020 */               #  727: 2c04
            addi         a3, a3, 17 /* [(local17)]+0x11 */     #  729: 32c311
            call0        memcmp                                #  72c: 01a3ffc0
                                                               #  730: 0000
            beqz         a2, .Lbr083                           #  732: 16b225
            l32i         a2, sp, 52 /* [(local9)] */           #  735: 28d1
            movi         a5, 191 /* 0x000000bf */              #  737: 52a0bf
            l8ui         a4, a14, 196 /* [arg1+0x174] */       #  73a: 420ec4
            l32i         a3, sp, 56 /* [(local10)] */          #  73d: 38e1
            and          a4, a4, a5                            #  73f: 504410
            movi         a5, 64 /* 0x00000040 */               #  742: 4c05
            or           a4, a4, a5                            #  744: 504420
            s8i          a4, a14, 196 /* a4 -> [arg1+0x174] */ #  747: 424ec4
            call0        .Lfunc012                             #  74a: 05e0ff
.Lbr057:    beqz         a13, .Lbr063                          #  74d: 163d0b
            addi         a6, a13, -1                           #  750: 0b6d
            beqz         a6, .Lbr065                           #  752: 16760d
            addi         a7, a13, -2                           #  755: 72cdfe
            beqz         a7, .Lbr071                           #  758: 160719
            beqi         a13, 3, .Lbr058                       #  75b: 263d08
            bgeui        a13, 7, .Lbr058                       #  75e: f67d05
            bltui        a13, 4, .Lbr058                       #  761: b64d02
            j            .Lbr048                               #  764: 46c3ff
.Lbr058:    extui        a8, a15, 7, 1                         #  767: f08704
            bnez         a8, .Lbr048                           #  76a: 5678f0
            extui        a9, a15, 8, 1                         #  76d: f09804
            beqz         a9, .Lbr048                           #  770: 1619f0
            movi         a0, 0 /* 0x00000000 */                #  773: 0c00
            l32i         a10, a14, 60 /* [arg1+0xec] */        #  775: a8fe
            s32i         a0, a12, 68 /* 0x00000000 -> [arg1+0x44] */ #  777: 026c11
            beqz         a10, .Lbr059                          #  77a: acea
            l8ui         a11, a14, 196 /* [arg1+0x174] */      #  77c: b20ec4
            bbsi         a11, 6, .Lbr059                       #  77f: 67eb29
            l32i         a3, sp, 84 /* [(local17)] */          #  782: 322115
            l32i         a4, sp, 48 /* [(local8)] */           #  785: 48c1
            movi         a2, 172 /* 0x000000ac */              #  787: 22a0ac
            add          a2, a12, a2 /* arg1+0xac */           #  78a: 2a2c
            call0        .Lfunc017                             #  78c: 018cffc0
                                                               #  790: 0000
            bnez         a2, .Lbr048                           #  792: 56f2ed
            movi         a2, .Lfunc015                         #  795: 2185ff
            movi         a3, 1 /* 0x00000001 */                #  798: 0c13
            mov          a4, a12 /* arg1 */                    #  79a: 4d0c
            s32i         a3, a12, 68 /* 0x00000001 -> [arg1+0x44] */ #  79c: 326c11
            l32i         a3, sp, 40 /* [(local6)] */           #  79f: 38a1
            call0        sdk_eloop_cancel_timeout              #  7a1: 0187ffc0
                                                               #  7a5: 0000
            movi         a4, 0 /* 0x00000000 */                #  7a7: 0c04
            s32i         a4, a14, 232 /* 0x00000000 -> [arg1+0x198] */ #  7a9: 426e3a
.Lbr059:    l32i         a5, sp, 60 /* [(local11)] */          #  7ac: 58f1
            beqz         a5, .Lbr080                           #  7ae: 16051a
            l32i         a6, a12, 68 /* [arg1+0x44] */         #  7b1: 622c11
            beqz         a6, .Lbr048                           #  7b4: 16d6eb
            movi         a4, 8 /* 0x00000008 */                #  7b7: 0c84
            movi         a3, 1 /* 0x00000001 */                #  7b9: 0c13
            movi         a2, 373 /* 0x00000175 */              #  7bb: 22a175
            s32i         a3, a12, 0x180 /* 0x00000001 -> [arg1+0x180] */ #  7be: 326c60
            l32i         a3, sp, 84 /* [(local17)] */          #  7c1: 322115
            add          a2, a12, a2 /* arg1+0x175 */          #  7c4: 2a2c
            addi         a3, a3, 9 /* [(local17)]+0x9 */       #  7c6: 9b33
            call0        memcpy                                #  7c8: 017fffc0
                                                               #  7cc: 0000
            l32i         a0, sp, 36 /* [(local5)] */           #  7ce: 0891
            addi         a4, a13, -6                           #  7d0: 42cdfa
            beqz         a4, .Lbr048                           #  7d3: 16e4e9
            l32i         a13, sp, 40 /* [(local6)] */          #  7d6: d8a1
            movi         a6, 8 /* 0x00000008 */                #  7d8: 0c86
            and          a6, a15, a6                           #  7da: 606f10
            bbci         a15, 10, .Lbr067                      #  7dd: a76f67
            mov          a2, a13 /* [(local6)] */              #  7e0: 2d0d
            mov          a3, a12 /* arg1 */                    #  7e2: 3d0c
            movi         a7, 1 /* 0x00000001 */                #  7e4: 0c17
            movi         a4, 0 /* 0x00000000 */                #  7e6: 0c04
            moveqz       a4, a7, a6                            #  7e8: 604783
            call0        .Lfunc013                             #  7eb: 05daff
            blti         a2, 1, .Lbr060                        #  7ee: a61202
            j            .Lbr048                               #  7f1: 06a0ff
.Lbr060:    j            .Lbr070                               #  7f4: 462200
.Lbr061:    movi         a13, 4 /* 0x00000004 */               #  7f7: 0c4d
            j            .Lbr051                               #  7f9: 06a8ff
.Lbr062:    bbci         a15, 11, .Lbr066                      #  7fc: b76f3d
            movi         a13, 3 /* 0x00000003 */               #  7ff: 0c3d
            j            .Lbr051                               #  801: 06a6ff
.Lbr063:    l32i         a0, a12, 16 /* [arg1+0x10] */         #  804: 084c
            beqi         a0, 7, .Lbr064                        #  806: 267011
            beqi         a0, 8, .Lbr064                        #  809: 26800e
            l8ui         a8, a14, 196 /* [arg1+0x174] */       #  80c: 820ec4
            extui        a8, a8, 6, 1                          #  80f: 808604
            beqz         a8, .Lbr048                           #  812: 16f8e5
            addi         a9, a0, -10 /* [arg1+0x10]-0xa */     #  815: 92c0f6
            bnez         a9, .Lbr048                           #  818: 5699e5
.Lbr064:    l32i         a10, a12, 4 /* [arg1+0x4] */          #  81b: a81c
            l32i         a10, a10, 208 /* [[arg1+0x4]+0xd0] */ #  81d: a22a34
            beqz         a10, .Lbr072                          #  820: 167a0d
            l32i         a2, sp, 40 /* [(local6)] */           #  823: 28a1
            addi         a3, a12, 8 /* arg1+0x8 */             #  825: 8b3c
            call0        .Lfunc003                             #  827: c594ff
            j            .Lbr048                               #  82a: c691ff
.Lbr065:    l32i         a11, a12, 16 /* [arg1+0x10] */        #  82d: b84c
            addi         a11, a11, -10 /* [arg1+0x10]-0xa */   #  82f: b2cbf6
            bnez         a11, .Lbr048                          #  832: 56fbe3
            l32i         a0, a14, 60 /* [arg1+0xec] */         #  835: 08fe
            bnez         a0, .Lbr058                           #  837: 56c0f2
            j            .Lbr048                               #  83a: c68dff
.Lbr066:    extui        a2, a15, 3, 1                         #  83d: f02304
            bnez         a2, .Lbr050                           #  840: 5602e5
            movi         a13, 2 /* 0x00000002 */               #  843: 0c2d
            j            .Lbr051                               #  845: 0695ff
.Lbr067:    movi         a3, 8 /* 0x00000008 */                #  848: 0c83
            bnone        a15, a3, .Lbr068                      #  84a: 370f07
            mov          a2, a12 /* arg1 */                    #  84d: 2d0c
            call0        .Lfunc010                             #  84f: 45caff
            j            .Lbr070                               #  852: c60a00
.Lbr068:    beqz         a0, .Lbr069                           #  855: 9c40
            mov          a4, sp /* (local0) */                 #  857: 4d01
            l32i         a2, sp, 84 /* [(local17)] */          #  859: 222115
            mov          a3, a0 /* [(local5)] */               #  85c: 3d00
            addi         a2, a2, 99 /* [(local17)]+0x63 */     #  85e: 22c263
            call0        sdk_wpa_parse_kde_ies                 #  861: 0159ffc0
                                                               #  865: 0000
            bnez         a2, .Lbr069                           #  867: cc22
            l32i         a3, sp, 28 /* [(local4)] */           #  869: 3871
            bnez         a3, .Lbr070                           #  86b: dc23
.Lbr069:    movi         a2, .Lfunc005                         #  86d: 2150ff
            mov          a3, a13 /* [(local6)] */              #  870: 3d0d
            movi         a4, 0 /* 0x00000000 */                #  872: 0c04
            call0        sdk_eloop_cancel_timeout              #  874: 0156ffc0
                                                               #  878: 0000
            mov          a2, a13 /* [(local6)] */              #  87a: 2d0d
            movi         a3, 0 /* 0x00000000 */                #  87c: 0c03
            call0        .Lfunc005                             #  87e: 4590ff
.Lbr070:    l32i         a2, a14, 188 /* [arg1+0x16c] */       #  881: 222e2f
            call0        free                                  #  884: 0153ffc0
                                                               #  888: 0000
            l32i         a2, sp, 48 /* [(local8)] */           #  88a: 28c1
            call0        malloc                                #  88c: 0152ffc0
                                                               #  890: 0000
            s32i         a2, a14, 188 /* a2 -> [arg1+0x16c] */ #  892: 226e2f
            beqz         a2, .Lbr048                           #  895: 16c2dd
            l32i         a3, sp, 84 /* [(local17)] */          #  898: 322115
            l32i         a4, sp, 48 /* [(local8)] */           #  89b: 48c1
            call0        memcpy                                #  89d: 014effc0
                                                               #  8a1: 0000
            addi         a2, a12, 108 /* arg1+0x6c */          #  8a3: 22cc6c
            extui        a6, a15, 3, 1                         #  8a6: f06304
            movi         a7, 1 /* 0x00000001 */                #  8a9: 0c17
            movi         a5, 1 /* 0x00000001 */                #  8ab: 0c15
            l32i         a4, sp, 60 /* [(local11)] */          #  8ad: 48f1
            movi         a9, 223 /* 0x000000df */              #  8af: 92a0df
            l8ui         a8, a14, 196 /* [arg1+0x174] */       #  8b2: 820ec4
            l32i         a3, sp, 84 /* [(local17)] */          #  8b5: 322115
            l32i         a10, sp, 48 /* [(local8)] */          #  8b8: a8c1
            s32i         a10, a14, 192 /* [(local8)] -> [arg1+0x170] */ #  8ba: a26e30
            addi         a3, a3, 17 /* [(local17)]+0x11 */     #  8bd: 32c311
            and          a8, a8, a9                            #  8c0: 908810
            movnez       a4, a5, a4                            #  8c3: 404593
            extui        a9, a15, 9, 1                         #  8c6: f09904
            slli         a9, a9, 5                             #  8c9: b09911
            or           a8, a8, a9                            #  8cc: 908820
            s8i          a8, a14, 196 /* a8 -> [arg1+0x174] */ #  8cf: 824ec4
            s32i         a7, a12, 56 /* 0x00000001 -> [arg1+0x38] */ #  8d2: 79ec
            s32i         a4, a12, 64 /* a4 -> [arg1+0x40] */   #  8d4: 426c10
            s32i         a6, a12, 60 /* a6 -> [arg1+0x3c] */   #  8d7: 69fc
            movi         a4, 32 /* 0x00000020 */               #  8d9: 2c04
            call0        memcpy                                #  8db: 0140ffc0
                                                               #  8df: 0000
            mov          a2, a12 /* arg1 */                    #  8e1: 2d0c
            call0        .Lfunc048                             #  8e3: 013fffc0
                                                               #  8e7: 0000
            j            .Lbr048                               #  8e9: 0662ff
.Lbr071:    l32i         a11, a12, 20 /* [arg1+0x14] */        #  8ec: b85c
            addi         a11, a11, -1 /* [arg1+0x14]-0x1 */    #  8ee: 0bbb
            bnez         a11, .Lbr048                          #  8f0: 561bd8
            l32i         a0, a14, 60 /* [arg1+0xec] */         #  8f3: 08fe
            bnez         a0, .Lbr058                           #  8f5: 56e0e6
            j            .Lbr048                               #  8f8: 465eff
.Lbr072:    l32i         a3, sp, 36 /* [(local5)] */           #  8fb: 3891
            l32i         a2, sp, 84 /* [(local17)] */          #  8fd: 222115
            mov          a4, sp /* (local0) */                 #  900: 4d01
            addi         a2, a2, 99 /* [(local17)]+0x63 */     #  902: 22c263
            call0        sdk_wpa_parse_kde_ies                 #  905: 0137ffc0
                                                               #  909: 0000
            bltz         a2, .Lbr048                           #  90b: 9662d6
            l32i         a5, sp, 8 /* [(local2)] */            #  90e: 5821
            bnez         a5, .Lbr073                           #  910: cc55
            l32i         a5, sp, 0 /* [(local0)] */            #  912: 5801
            l32i         a6, sp, 4 /* [(local1)] */            #  914: 6811
            j            .Lbr074                               #  916: 460000
.Lbr073:    l32i         a6, sp, 12 /* [(local3)] */           #  919: 6831
.Lbr074:    l32i         a3, a14, 220 /* [arg1+0x18c] */       #  91b: 322e37
            bnei         a3, 2, .Lbr076                        #  91e: 66230e
            l32i         a8, a14, 228 /* [arg1+0x194] */       #  921: 822e39
            movi         a0, 1 /* 0x00000001 */                #  924: 0c10
            beqi         a8, 64, .Lbr075                       #  926: 26d804
            beqi         a8, 32, .Lbr075                       #  929: 26c801
            movi         a0, 0 /* 0x00000000 */                #  92c: 0c00
.Lbr075:    bnez         a0, .Lbr077                           #  92e: cc30
.Lbr076:    movi         a2, 0 /* 0x00000000 */                #  930: 0c02
            j            .Lbr078                               #  932: 460000
.Lbr077:    movi         a2, 1 /* 0x00000001 */                #  935: 0c12
.Lbr078:    l32i         a3, a14, 212 /* [arg1+0x184] */       #  937: 322e35
            beqz         a3, .Lbr079                           #  93a: 8ca3
            l32i         a4, a14, 216 /* [arg1+0x188] */       #  93c: 422e36
            call0        sdk_wpa_compare_rsn_ie                #  93f: 012affc0
                                                               #  943: 0000
            beqz         a2, .Lbr058                           #  945: 16e2e1
.Lbr079:    l32i         a2, sp, 40 /* [(local6)] */           #  948: 28a1
            addi         a3, a12, 8 /* arg1+0x8 */             #  94a: 8b3c
            call0        .Lfunc003                             #  94c: 4582ff
            j            .Lbr048                               #  94f: 8648ff
.Lbr080:    l32i         a3, sp, 84 /* [(local17)] */          #  952: 322115
            movi         a2, 252 /* 0x000000fc */              #  955: 22a0fc
            add          a2, a12, a2 /* arg1+0xfc */           #  958: 2a2c
            s32i         a2, sp, 44 /* arg1+0xfc -> [(local7)] */ #  95a: 29b1
            addi         a3, a3, 9 /* [(local17)]+0x9 */       #  95c: 9b33
            call0        .Lfunc012                             #  95e: c5beff
            movi         a0, 300 /* 0x0000012c */              #  961: 02a12c
            add          a0, a12, a0 /* arg1+0x12c */          #  964: 0a0c
            bnez         a13, .Lbr081                          #  966: ccfd
            movi         a4, 48 /* 0x00000030 */               #  968: 3c04
            l32i         a13, sp, 44 /* [(local7)] */          #  96a: d8b1
            mov          a2, a0 /* arg1+0x12c */               #  96c: 2d00
            mov          a3, a13 /* [(local7)] */              #  96e: 3d0d
            call0        memcpy                                #  970: 011fffc0
                                                               #  974: 0000
            j            .Lbr082                               #  976: 460300
.Lbr081:    l32i         a13, sp, 44 /* [(local7)] */          #  979: d8b1
            movi         a3, 0 /* 0x00000000 */                #  97b: 0c03
            movi         a4, 48 /* 0x00000030 */               #  97d: 3c04
            mov          a2, a0 /* arg1+0x12c */               #  97f: 2d00
            call0        memset                                #  981: 011bffc0
                                                               #  985: 0000
.Lbr082:    mov          a2, a13 /* [(local7)] */              #  987: 2d0d
            movi         a3, 0 /* 0x00000000 */                #  989: 0c03
            call0        .Lfunc012                             #  98b: 05bcff
            j            .Lbr070                               #  98e: c6bbff
.Lbr083:    bnez         a13, .Lbr084                          #  991: cc8d
            l32i         a3, sp, 56 /* [(local10)] */          #  993: 38e1
            movi         a2, 300 /* 0x0000012c */              #  995: 22a12c
            add          a2, a12, a2 /* arg1+0x12c */          #  998: 2a2c
            call0        .Lfunc011                             #  99a: c5b6ff
.Lbr084:    mov          a3, a12 /* arg1 */                    #  99d: 3d0c
            addi         a0, a12, 48 /* arg1+0x30 */           #  99f: 02cc30
.Lbr085:    addmi        a5, a3, 256                           #  9a2: 52d301
            l8ui         a4, a5, 7                             #  9a5: 420507
            l8ui         a6, a5, 6                             #  9a8: 620506
            slli         a4, a4, 8                             #  9ab: 804411
            or           a4, a4, a6                            #  9ae: 604420
            slli         a4, a4, 8                             #  9b1: 804411
            l8ui         a6, a5, 5                             #  9b4: 620505
            l8ui         a5, a5, 4                             #  9b7: 520504
            or           a4, a4, a6                            #  9ba: 604420
            slli         a4, a4, 8                             #  9bd: 804411
            or           a4, a4, a5                            #  9c0: 504420
            beqz         a4, .Lbr048                           #  9c3: 16e4ca
            addi         a3, a3, 12                            #  9c6: cb33
            bne          a3, a0, .Lbr085                       #  9c8: 0793d6
            j            .Lbr048                               #  9cb: 8629ff

            .literal_position                                  #  9d0: 00000000
                                                               #  9d4: 00000000
                                                               #  9d8: 00000000
                                                               #  9dc: 00000000
                                                               #  9e0: 00000000

# Function @ .irom0.text+0x9e4
# Local variables/stack:
#     (local0):  word[20]  @ -0x70
#     (local1):  word      @ -0x20
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word      @ -0x10
#     (local6):  word      @ -0xc
#     (local7):  word[2]   @ -0x8
            .balign      4
.Lfunc014:  addi         sp, sp, -112 /* (local0) */           #  9e4: 12c190
            s32i         a5, sp, 88 /* arg3 -> [(local3)] */   #  9e7: 526116
            s32i         a6, sp, 92 /* arg4 -> [(local4)] */   #  9ea: 626117
            s32i         a7, sp, 96 /* arg5 -> [(local5)] */   #  9ed: 726118
            s32i         a0, sp, 104 /* a0 -> [(local7)] */    #  9f0: 02611a
            s32i         a3, sp, 84 /* arg1 -> [(local2)] */   #  9f3: 326115
            s32i         a2, sp, 80 /* arg0 -> [(local1)] */   #  9f6: 226114
            mov          a3, a4 /* arg2 */                     #  9f9: 3d04
            addi         a2, sp, 16 /* (FP)-0x60 */            #  9fb: 22c110
            movi         a4, 6 /* 0x00000006 */                #  9fe: 0c64
            call0        memcpy                                #  a00: 01f4ffc0
                                                               #  a04: 0000
            l32i         a3, sp, 88 /* [(local3)] */           #  a06: 322116
            addi         a2, sp, 22 /* (FP)-0x5a */            #  a09: 22c116
            movi         a4, 32 /* 0x00000020 */               #  a0c: 2c04
            call0        memcpy                                #  a0e: 01f1ffc0
                                                               #  a12: 0000
            addi         a2, sp, 54 /* (FP)-0x3a */            #  a14: 22c136
            call0        sdk_wpa_get_ntp_timestamp             #  a17: 01f0ffc0
                                                               #  a1b: 0000
            addi         a2, sp, 62 /* (FP)-0x32 */            #  a1d: 22c13e
            movi         a3, 16 /* 0x00000010 */               #  a20: 1c03
            call0        os_get_random                         #  a22: 01eeffc0
                                                               #  a26: 0000
            l32i         a4, sp, 84 /* [(local2)] */           #  a28: 422115
            l32i         a7, sp, 92 /* [(local4)] */           #  a2b: 722117
            movi         a3, 32 /* 0x00000020 */               #  a2e: 2c03
            addi         a5, sp, 16 /* (FP)-0x60 */            #  a30: 52c110
            movi         a6, 62 /* 0x0000003e */               #  a33: 3ce6
            s32i         a2, sp, 100 /* a2 -> [(local6)] */    #  a35: 226119
            l32i         a0, sp, 96 /* [(local5)] */           #  a38: 022118
            l32i         a2, sp, 80 /* [(local1)] */           #  a3b: 222114
            s32i         a0, sp, 0 /* [(local5)] -> [(local0)] */ #  a3e: 0901
            call0        sdk_sha1_prf                          #  a40: 01e8ffc0
                                                               #  a44: 0000
            movi         a4, -1 /* 0xffffffff */               #  a46: 7cf4
            l32i         a5, sp, 100 /* [(local6)] */          #  a48: 522119
            l32i         a3, sp, 104 /* [(local7)] */          #  a4b: 32211a
            movi         a0, 0 /* 0x00000000 */                #  a4e: 0c00
            addi         sp, sp, 112 /* (top of frame) */      #  a50: 12c170
            movltz       a0, a4, a5                            #  a53: 5004a3
            movltz       a0, a4, a2                            #  a56: 2004a3
            mov          a2, a0                                #  a59: 2d00
            mov          a0, a3 /* [(local7)] */               #  a5b: 0d03
            ret                                                #  a5d: 0df0

            .balign      4
# Function @ .irom0.text+0xa60
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc015:  mov          a2, a3 /* arg1 */                     #  a60: 2d03
            addi         sp, sp, -16 /* (local0) */            #  a62: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  a65: 0901
            movi         a3, 0 /* 0x00000000 */                #  a67: 0c03
            movi         a0, 1 /* 0x00000001 */                #  a69: 0c10
            s32i         a3, a2, 0x198 /* 0x00000000 -> [arg1+0x198] */ #  a6b: 326266
            s32i         a0, a2, 52 /* 0x00000001 -> [arg1+0x34] */ #  a6e: 09d2
            call0        .Lfunc048                             #  a70: 454401
            l32i         a0, sp, 0 /* [(local0)] */            #  a73: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  a75: 12c110
            ret                                                #  a78: 0df0

            .literal_position                                  #  a7c: 00100000
                                                               #  a80: 00000000
                                                               #  a84: 888effff
                                                               #  a88: 8effff00
                                                               #  a8c: 00000000
                                                               #  a90: 00000000
                                                               #  a94: 00000000
                                                               #  a98: 00000000
                                                               #  a9c: 00000000
                                                               #  aa0: 00000000
                                                               #  aa4: 00000000
                                                               #  aa8: 00000000
                                                               #  aac: 00000000
                                                               #  ab0: 00000000
                                                               #  ab4: 00000000
                                                               #  ab8: 00000000
                                                               #  abc: 00000000
                                                               #  ac0: 00000000
                                                               #  ac4: 00000000
                                                               #  ac8: 00000000
                                                               #  acc: 00000000
                                                               #  ad0: 00000000
                                                               #  ad4: 00000000
                                                               #  ad8: 00000000
                                                               #  adc: 00000000
                                                               #  ae0: 00000000
                                                               #  ae4: 00000000
                                                               #  ae8: 00000000
                                                               #  aec: 00000000
                                                               #  af0: 00000000
                                                               #  af4: 00000000
                                                               #  af8: 00000000
                                                               #  afc: 00000000
                                                               #  b00: 00000000
                                                               #  b04: 00000000

# Function @ .irom0.text+0xb08
# Local variables/stack:
#     (local0):  word      @ -0x60
#     (local1):  word      @ -0x5c
#     (local2):  word      @ -0x58
#     (local3):  word      @ -0x54
#     (local4):  word      @ -0x50
#     (local5):  word      @ -0x4c
#     (local6):  word      @ -0x48
#     (local7):  word      @ -0x44
#     (local8):  word      @ -0x40
#     (local9):  word      @ -0x3c
#     (local10): word      @ -0x38
#     (local11): word      @ -0x34
#     (local12): word      @ -0x30
#     (local13): word      @ -0x2c
#     (local14): word      @ -0x28
#     (local15): word      @ -0x24
#     (local16): word      @ -0x20
#     (local17): word      @ -0x1c
#     (local18): word      @ -0x18
#     (local19): word      @ -0x14
#     (local20): word      @ -0x10
#     (local21): word      @ -0xc
#     (local22): word[2]   @ -0x8
            .balign      4
            .global      sdk___wpa_send_eapol
            .type        sdk___wpa_send_eapol, @function
sdk___wpa_send_eapol:
            addi         sp, sp, -128 /* (FP)-0x80 */          #  b08: 12c180
            s32i         a15, sp, 76 /* a15 -> [(local11)] */  #  b0b: f26113
            s32i         a0, sp, 60 /* a0 -> [(local7)] */     #  b0e: 09f1
            s32i         a2, sp, 120 /* arg0 -> [(local22)] */ #  b10: 22611e
            s32i         a5, sp, 116 /* arg3 -> [(local21)] */ #  b13: 52611d
            s32i         a6, sp, 112 /* arg4 -> [(local20)] */ #  b16: 62611c
            s32i         a7, sp, 32 /* arg5 -> [(local0)] */   #  b19: 7981
            s32i         a12, sp, 64 /* a12 -> [(local8)] */   #  b1b: c26110
            s32i         a13, sp, 68 /* a13 -> [(local9)] */   #  b1e: d26111
            s32i         a14, sp, 72 /* a14 -> [(local10)] */  #  b21: e26112
            mov          a13, a3 /* arg1 */                    #  b24: dd03
            l32i         a3, sp, 140 /* [(FP)+0xc] */          #  b26: 322123
            mov          a14, a4 /* arg2 */                    #  b29: ed04
            beqz         a3, .Lbr109                           #  b2b: 169335
            mov          a12, a3 /* [(FP)+0xc] */              #  b2e: cd03
            j            .Lbr087                               #  b30: 460000
.Lbr086:    movi         a12, 3 /* 0x00000003 */               #  b33: 0c3c
.Lbr087:    addi         a4, a12, -2                           #  b35: 42ccfe
            movi         a0, 8 /* 0x00000008 */                #  b38: 0c80
            l32i         a15, sp, 128 /* [(local23)] */        #  b3a: f22120
            s32i         a15, sp, 96 /* [(local23)] -> [(local16)] */ #  b3d: f26118
            and          a5, a14, a0                           #  b40: 005e10
            s32i         a5, sp, 52 /* a5 -> [(local5)] */     #  b43: 59d1
            beqz         a4, .Lbr108                           #  b45: 16a431
            addi         a2, a12, -3                           #  b48: 22ccfd
            beqz         a2, .Lbr108                           #  b4b: 164231
.Lbr088:    movi         a3, 0 /* 0x00000000 */                #  b4e: 0c03
            s32i         a3, sp, 48 /* 0x00000000 -> [(local4)] */ #  b50: 39c1
.Lbr089:    s32i         a12, sp, 44 /* a12 -> [(local3)] */   #  b52: c9b1
            addi         a2, a15, 99                           #  b54: 22cf63
            s32i         a2, sp, 56 /* a2 -> [(local6)] */     #  b57: 29e1
            call0        zalloc                                #  b59: 01ccffc0
                                                               #  b5d: 0000
            l32i         a9, sp, 120 /* [(local22)] */         #  b5f: 92211e
            mov          a12, a2                               #  b62: cd02
            beqz         a2, .Lbr107                           #  b64: 16622e
            movi         a6, 2 /* 0x00000002 */                #  b67: 0c26
            movi         a5, 254 /* 0x000000fe */              #  b69: 52a0fe
            movi         a8, 3 /* 0x00000003 */                #  b6c: 0c38
            l32i         a4, sp, 136 /* [(FP)+0x8] */          #  b6e: 422122
            addi         a11, a15, 95                          #  b71: b2cf5f
            extui        a10, a11, 8, 8                        #  b74: b0a874
            s32i         a4, sp, 84 /* [(FP)+0x8] -> [(local13)] */ #  b77: 426115
            extui        a11, a11, 0, 8                        #  b7a: b0b074
            slli         a11, a11, 8                           #  b7d: 80bb11
            or           a10, a10, a11                         #  b80: b0aa20
            l32i         a11, a9, 44 /* [[(local22)]+0x2c] */  #  b83: b8b9
            s8i          a10, a2, 2                            #  b85: a24202
            s8i          a11, a2, 0                            #  b88: b24200
            s8i          a8, a2, 1                             #  b8b: 824201
            l32i         a0, a13, 0x18c /* [arg1+0x18c] */     #  b8e: 022d63
            srli         a10, a10, 8                           #  b91: a0a841
            addi         a7, a0, -2 /* [arg1+0x18c]-0x2 */     #  b94: 72c0fe
            moveqz       a5, a6, a7                            #  b97: 705683
            s8i          a5, a2, 4                             #  b9a: 524204
            l32i         a5, sp, 44 /* [(local3)] */           #  b9d: 58b1
            s8i          a10, a2, 3                            #  b9f: a24203
            or           a14, a14, a5                          #  ba2: 50ee20
            beqz         a4, .Lbr090                           #  ba5: 8c74
            bnei         a0, 2, .Lbr091                        #  ba7: 662008
            movi         a2, 0x00001000                        #  baa: 21b4ff
            or           a14, a14, a2                          #  bad: 20ee20
.Lbr090:    beqi         a0, 2, .Lbr092                        #  bb0: 262008
.Lbr091:    l32i         a3, sp, 132 /* [(FP)+0x4] */          #  bb3: 322121
            slli         a3, a3, 4                             #  bb6: c03311
            or           a14, a14, a3                          #  bb9: 30ee20
.Lbr092:    s8i          a14, a12, 6                           #  bbc: e24c06
            srli         a5, a14, 8                            #  bbf: e05841
            l32i         a4, sp, 52 /* [(local5)] */           #  bc2: 48d1
            s8i          a5, a12, 5                            #  bc4: 524c05
            bnez         a4, .Lbr093                           #  bc7: cc64
            l32i         a6, a9, 16 /* [[(local22)]+0x10] */   #  bc9: 6849
            s32i         a6, sp, 92 /* [[(local22)]+0x10] -> [(local15)] */ #  bcb: 626117
            j            .Lbr094                               #  bce: 460100
.Lbr093:    l32i         a7, a13, 0x190 /* [arg1+0x190] */     #  bd1: 722d64
            s32i         a7, sp, 92 /* [arg1+0x190] -> [(local15)] */ #  bd4: 726117
.Lbr094:    l32i         a2, sp, 92 /* [(local15)] */          #  bd7: 222117
            call0        sdk_wpa_cipher_key_len                #  bda: 01adffc0
                                                               #  bde: 0000
            srli         a8, a2, 8                             #  be0: 208841
            s8i          a8, a12, 7                            #  be3: 824c07
            l32i         a2, sp, 92 /* [(local15)] */          #  be6: 222117
            call0        sdk_wpa_cipher_key_len                #  be9: 01aaffc0
                                                               #  bed: 0000
            s8i          a2, a12, 8                            #  bef: 224c08
            s32i         a15, sp, 80 /* a15 -> [(local12)] */  #  bf2: f26114
            bbci         a14, 13, .Lbr095                      #  bf5: d76e0a
            s32i         a15, sp, 80 /* a15 -> [(local12)] */  #  bf8: f26114
            movi         a9, 0 /* 0x00000000 */                #  bfb: 0c09
            s8i          a9, a12, 7                            #  bfd: 924c07
            s8i          a9, a12, 8                            #  c00: 924c08
.Lbr095:    movi         a0, 252 /* 0x000000fc */              #  c03: 02a0fc
            movi         a2, 288 /* 0x00000120 */              #  c06: 22a120
            movi         a15, 276 /* 0x00000114 */             #  c09: f2a114
            addi         a3, a13, 36 /* arg1+0x24 */           #  c0c: 32cd24
            s32i         a3, sp, 104 /* arg1+0x24 -> [(local18)] */ #  c0f: 32611a
            add          a15, a13, a15 /* arg1+0x114 */        #  c12: fafd
            add          a2, a13, a2 /* arg1+0x120 */          #  c14: 2a2d
            add          a0, a13, a0 /* arg1+0xfc */           #  c16: 0a0d
            s32i         a0, sp, 100 /* arg1+0xfc -> [(local17)] */ #  c18: 026119
            s32i         a2, sp, 108 /* arg1+0x120 -> [(local19)] */ #  c1b: 22611b
.Lbr096:    l32i         a2, sp, 108 /* [(local19)] */         #  c1e: 22211b
            l32i         a5, sp, 104 /* [(local18)] */         #  c21: 52211a
            mov          a3, a15                               #  c24: 3d0f
            l8ui         a4, a5, 251 /* [[(local18)]+0xfb] */  #  c26: 4205fb
            l8ui         a6, a5, 250 /* [[(local18)]+0xfa] */  #  c29: 6205fa
            slli         a4, a4, 8                             #  c2c: 804411
            or           a4, a4, a6                            #  c2f: 604420
            l8ui         a6, a5, 249 /* [[(local18)]+0xf9] */  #  c32: 6205f9
            slli         a4, a4, 8                             #  c35: 804411
            or           a4, a4, a6                            #  c38: 604420
            l8ui         a6, a5, 248 /* [[(local18)]+0xf8] */  #  c3b: 6205f8
            slli         a4, a4, 8                             #  c3e: 804411
            addmi        a5, a5, 256 /* [(local18)]+0x100 */   #  c41: 52d501
            or           a4, a4, a6                            #  c44: 604420
            s8i          a4, a5, 4 /* a4 -> [[(local18)]+0x104] */ #  c47: 424504
            srli         a4, a4, 8                             #  c4a: 404841
            s8i          a4, a5, 5 /* a4 -> [[(local18)]+0x105] */ #  c4d: 424505
            srli         a4, a4, 8                             #  c50: 404841
            s8i          a4, a5, 6 /* a4 -> [[(local18)]+0x106] */ #  c53: 424506
            srli         a4, a4, 8                             #  c56: 404841
            s8i          a4, a5, 7 /* a4 -> [[(local18)]+0x107] */ #  c59: 424507
            movi         a4, 8 /* 0x00000008 */                #  c5c: 0c84
            call0        memcpy                                #  c5e: 018effc0
                                                               #  c62: 0000
            addi         a15, a15, -12                         #  c64: f2cff4
            l32i         a6, sp, 100 /* [(local17)] */         #  c67: 622119
            l32i         a5, sp, 108 /* [(local19)] */         #  c6a: 52211b
            l32i         a7, sp, 104 /* [(local18)] */         #  c6d: 72211a
            addi         a5, a5, -12 /* [(local19)]-0xc */     #  c70: 52c5f4
            addi         a7, a7, -12 /* [(local18)]-0xc */     #  c73: 72c7f4
            s32i         a7, sp, 104 /* [(local18)]-0xc -> [(local18)] */ #  c76: 72611a
            s32i         a5, sp, 108 /* [(local19)]-0xc -> [(local19)] */ #  c79: 52611b
            bne          a5, a6, .Lbr096                       #  c7c: 67959e
            mov          a2, a6 /* [(local17)] */              #  c7f: 2d06
            movi         a3, 8 /* 0x00000008 */                #  c81: 0c83
            call0        sdk_inc_byte_array                    #  c83: 0186ffc0
                                                               #  c87: 0000
            l32i         a15, sp, 116 /* [(local21)] */        #  c89: f2211d
            l32i         a3, sp, 100 /* [(local17)] */         #  c8c: 322119
            addi         a2, a12, 9                            #  c8f: 9b2c
            movi         a4, 8 /* 0x00000008 */                #  c91: 0c84
            call0        memcpy                                #  c93: 0183ffc0
                                                               #  c97: 0000
            movi         a10, 1 /* 0x00000001 */               #  c99: 0c1a
            addmi        a9, a13, 256 /* arg1+0x100 */         #  c9b: 92dd01
            movi         a8, 0 /* 0x00000000 */                #  c9e: 0c08
            s8i          a8, a9, 5 /* 0x00 -> [arg1+0x105] */  #  ca0: 824905
            s8i          a10, a9, 4 /* 0x01 -> [arg1+0x104] */ #  ca3: a24904
            movi         a8, 0 /* 0x00000000 */                #  ca6: 0c08
            s8i          a8, a9, 6 /* 0x00 -> [arg1+0x106] */  #  ca8: 824906
            movi         a8, 0 /* 0x00000000 */                #  cab: 0c08
            s8i          a8, a9, 7 /* 0x00 -> [arg1+0x107] */  #  cad: 824907
            l32i         a9, sp, 112 /* [(local20)] */         #  cb0: 92211c
            beqz         a9, .Lbr097                           #  cb3: 8cb9
            mov          a3, a9 /* [(local20)] */              #  cb5: 3d09
            addi         a2, a12, 17                           #  cb7: 22cc11
            movi         a4, 32 /* 0x00000020 */               #  cba: 2c04
            call0        memcpy                                #  cbc: 017affc0
                                                               #  cc0: 0000
.Lbr097:    beqz         a15, .Lbr098                          #  cc2: 8cbf
            mov          a3, a15 /* [(local21)] */             #  cc4: 3d0f
            addi         a2, a12, 65                           #  cc6: 22cc41
            movi         a4, 8 /* 0x00000008 */                #  cc9: 0c84
            call0        memcpy                                #  ccb: 0177ffc0
                                                               #  ccf: 0000
.Lbr098:    l32i         a11, sp, 32 /* [(local0)] */          #  cd1: b881
            l32i         a3, sp, 32 /* [(local0)] */           #  cd3: 3881
            beqz         a11, .Lbr099                          #  cd5: ac0b
            l32i         a15, sp, 84 /* [(local13)] */         #  cd7: f22115
            bnez         a15, .Lbr100                          #  cda: ec1f
            addi         a2, a12, 99                           #  cdc: 22cc63
            mov          a3, a11 /* [(local0)] */              #  cdf: 3d0b
            l32i         a4, sp, 96 /* [(local16)] */          #  ce1: 422118
            call0        memcpy                                #  ce4: 0172ffc0
                                                               #  ce8: 0000
            l32i         a0, sp, 96 /* [(local16)] */          #  cea: 022118
            s8i          a0, a12, 98                           #  ced: 024c62
            srli         a0, a0, 8                             #  cf0: 000841
            s8i          a0, a12, 97                           #  cf3: 024c61
            j            .Lbr104                               #  cf6: 862f00
.Lbr099:    l32i         a2, sp, 84 /* [(local13)] */          #  cf9: 222115
            beqz         a2, .Lbr104                           #  cfc: 16820b
.Lbr100:    beqz         a3, .Lbr104                           #  cff: 16530b
            l32i         a2, sp, 80 /* [(local12)] */          #  d02: 222114
            call0        zalloc                                #  d05: 016affc0
                                                               #  d09: 0000
            mov          a15, a2                               #  d0b: fd02
            bnez         a2, .Lbr101                           #  d0d: cc92
            mov          a2, a12                               #  d0f: 2d0c
            call0        free                                  #  d11: 0168ffc0
                                                               #  d15: 0000
            j            .Lbr107                               #  d17: c64c00
.Lbr101:    l32i         a3, sp, 32 /* [(local0)] */           #  d1a: 3881
            l32i         a4, sp, 96 /* [(local16)] */          #  d1c: 422118
            call0        memcpy                                #  d1f: 0166ffc0
                                                               #  d23: 0000
            l32i         a4, sp, 48 /* [(local4)] */           #  d25: 48c1
            beqz         a4, .Lbr102                           #  d27: 8c94
            l32i         a6, sp, 96 /* [(local16)] */          #  d29: 622118
            movi         a5, -35 /* 0xffffffdd */              #  d2c: 52afdd
            add          a6, a15, a6                           #  d2f: 6a6f
            s8i          a5, a6, 0                             #  d31: 524600
.Lbr102:    l32i         a7, sp, 44 /* [(local3)] */           #  d34: 78b1
            movi         a0, 188 /* 0x000000bc */              #  d36: 02a0bc
            addi         a7, a7, -2 /* [(local3)]-0x2 */       #  d39: 72c7fe
            beqz         a7, .Lbr110                           #  d3c: 160716
            l32i         a8, sp, 44 /* [(local3)] */           #  d3f: 88b1
            addi         a8, a8, -3 /* [(local3)]-0x3 */       #  d41: 82c8fd
            beqz         a8, .Lbr110                           #  d44: 168815
            movi         a4, 16 /* 0x00000010 */               #  d47: 1c04
            l32i         a3, a13, 4 /* [arg1+0x4] */           #  d49: 381d
            addi         a2, a12, 49                           #  d4b: 22cc31
            s32i         a2, sp, 36 /* a2 -> [(local1)] */     #  d4e: 2991
            addi         a3, a3, 52 /* [arg1+0x4]+0x34 */      #  d50: 32c334
            call0        memcpy                                #  d53: 015affc0
                                                               #  d57: 0000
            l32i         a2, a13, 4 /* [arg1+0x4] */           #  d59: 281d
            movi         a3, 32 /* 0x00000020 */               #  d5b: 2c03
            addi         a2, a2, 36 /* [arg1+0x4]+0x24 */      #  d5d: 22c224
            call0        sdk_inc_byte_array                    #  d60: 0158ffc0
                                                               #  d64: 0000
            l32i         a3, sp, 36 /* [(local1)] */           #  d66: 3891
            mov          a2, sp /* (FP)-0x80 */                #  d68: 2d01
            movi         a4, 16 /* 0x00000010 */               #  d6a: 1c04
            call0        memcpy                                #  d6c: 0156ffc0
                                                               #  d70: 0000
            addi         a2, sp, 16 /* (FP)-0x70 */            #  d72: 22c110
            movi         a4, 16 /* 0x00000010 */               #  d75: 1c04
            movi         a3, 188 /* 0x000000bc */              #  d77: 32a0bc
            add          a3, a13, a3 /* arg1+0xbc */           #  d7a: 3a3d
            call0        memcpy                                #  d7c: 0153ffc0
                                                               #  d80: 0000
            mov          a3, a15                               #  d82: 3d0f
            l32i         a4, sp, 80 /* [(local12)] */          #  d84: 422114
            addi         a2, a12, 99                           #  d87: 22cc63
            s32i         a2, sp, 40 /* a2 -> [(local2)] */     #  d8a: 29a1
            call0        memcpy                                #  d8c: 0150ffc0
                                                               #  d90: 0000
            mov          a2, sp /* (FP)-0x80 */                #  d92: 2d01
            movi         a3, 32 /* 0x00000020 */               #  d94: 2c03
            movi         a4, 256 /* 0x00000100 */              #  d96: 42a100
            l32i         a5, sp, 40 /* [(local2)] */           #  d99: 58a1
            l32i         a6, sp, 80 /* [(local12)] */          #  d9b: 622114
            call0        sdk_rc4_skip                          #  d9e: 014cffc0
                                                               #  da2: 0000
.Lbr103:    mov          a2, a15                               #  da4: 2d0f
            l32i         a4, sp, 80 /* [(local12)] */          #  da6: 422114
            s8i          a4, a12, 98                           #  da9: 424c62
            srli         a4, a4, 8                             #  dac: 404841
            s8i          a4, a12, 97                           #  daf: 424c61
            call0        free                                  #  db2: 0148ffc0
                                                               #  db6: 0000
.Lbr104:    bbci         a14, 8, .Lbr106                       #  db8: 876e23
            l32i         a5, a13, 236 /* [arg1+0xec] */        #  dbb: 522d3b
            bnez         a5, .Lbr105                           #  dbe: cc95
            mov          a2, a12                               #  dc0: 2d0c
            call0        free                                  #  dc2: 0145ffc0
                                                               #  dc6: 0000
            j            .Lbr107                               #  dc8: 862000
.Lbr105:    l32i         a3, sp, 44 /* [(local3)] */           #  dcb: 38b1
            mov          a4, a12                               #  dcd: 4d0c
            l32i         a5, sp, 56 /* [(local6)] */           #  dcf: 58e1
            addi         a6, a12, 81                           #  dd1: 62cc51
            movi         a2, 172 /* 0x000000ac */              #  dd4: 22a0ac
            add          a2, a13, a2 /* arg1+0xac */           #  dd7: 2a2d
            call0        sdk_wpa_eapol_key_mic                 #  dd9: 0140ffc0
                                                               #  ddd: 0000
.Lbr106:    movi         a2, 3 /* 0x00000003 */                #  ddf: 0c32
            movi         a5, sdk_g_ic                          #  de1: 5127ff
            movi         a3, 256 /* 0x00000100 */              #  de4: 32a100
            l32i         a5, a5, 20 /* [sdk_g_ic+0x14] */      #  de7: 5855
            movi         a4, 0 /* 0x00000000 */                #  de9: 0c04
            l32i         a5, a5, 0 /* [[sdk_g_ic+0x14]] */     #  deb: 5805
            s32i         a5, sp, 88 /* [[sdk_g_ic+0x14]] -> [(local14)] */ #  ded: 526116
            call0        pbuf_alloc                            #  df0: 013cffc0
                                                               #  df4: 0000
            addi         a3, a13, 8 /* arg1+0x8 */             #  df6: 8b3d
            mov          a15, a2                               #  df8: fd02
            l32i         a14, a2, 4                            #  dfa: e812
            movi         a4, 6 /* 0x00000006 */                #  dfc: 0c64
            mov          a2, a14                               #  dfe: 2d0e
            call0        memcpy                                #  e00: 0139ffc0
                                                               #  e04: 0000
            l32i         a13, sp, 56 /* [(local6)] */          #  e06: d8e1
            addi         a2, a14, 6                            #  e08: 6b2e
            l32i         a3, sp, 88 /* [(local14)] */          #  e0a: 322116
            movi         a4, 6 /* 0x00000006 */                #  e0d: 0c64
            addi         a3, a3, 41 /* [(local14)]+0x29 */     #  e0f: 32c329
            call0        memcpy                                #  e12: 0135ffc0
                                                               #  e16: 0000
            l32i         a2, a15, 4                            #  e18: 281f
            movi         a4, 0xffff8e88                        #  e1a: 411aff
            movi         a3, 0x00ffff8e                        #  e1d: 311aff
            s8i          a4, a14, 12                           #  e20: 424e0c
            mov          a4, a13 /* [(local6)] */              #  e23: 4d0d
            s8i          a3, a14, 13                           #  e25: 324e0d
            addi         a2, a2, 14                            #  e28: eb22
            mov          a3, a12                               #  e2a: 3d0c
            call0        memcpy                                #  e2c: 0130ffc0
                                                               #  e30: 0000
            mov          a3, a15                               #  e32: 3d0f
            l32i         a5, sp, 80 /* [(local12)] */          #  e34: 522114
            l32i         a2, sp, 88 /* [(local14)] */          #  e37: 222116
            addi         a5, a5, 113 /* [(local12)]+0x71 */    #  e3a: 52c571
            s16i         a5, a15, 10                           #  e3d: 525f05
            call0        sdk_ieee80211_output_pbuf             #  e40: 012cffc0
                                                               #  e44: 0000
            mov          a2, a12                               #  e46: 2d0c
            call0        free                                  #  e48: 012bffc0
                                                               #  e4c: 0000
.Lbr107:    l32i         a12, sp, 64 /* [(local8)] */          #  e4e: c22110
            l32i         a13, sp, 68 /* [(local9)] */          #  e51: d22111
            l32i         a14, sp, 72 /* [(local10)] */         #  e54: e22112
            l32i         a15, sp, 76 /* [(local11)] */         #  e57: f22113
            movi         a2, 128 /* 0x00000080 */              #  e5a: 22a080
            l32i         a0, sp, 60 /* [(local7)] */           #  e5d: 08f1
            add          sp, sp, a2 /* (local23) */            #  e5f: 2a11
            ret           /* 0x00000080 */                     #  e61: 0df0
.Lbr108:    l32i         a6, sp, 136 /* [(FP)+0x8] */          #  e63: 622122
            beqz         a6, .Lbr088                           #  e66: 1646ce
            l32i         a2, sp, 96 /* [(local16)] */          #  e69: 222118
            movi         a3, 8 /* 0x00000008 */                #  e6c: 0c83
            call0        __modsi3                              #  e6e: 0122ffc0
                                                               #  e72: 0000
            l32i         a15, sp, 96 /* [(local16)] */         #  e74: f22118
            movi         a0, 8 /* 0x00000008 */                #  e77: 0c80
            sub          a0, a0, a2                            #  e79: 2000c0
            movnez       a2, a0, a2                            #  e7c: 202093
            s32i         a2, sp, 48 /* a2 -> [(local4)] */     #  e7f: 29c1
            add          a15, a15, a2                          #  e81: 2aff
            addi         a15, a15, 8                           #  e83: 8bff
            j            .Lbr089                               #  e85: 4632ff
.Lbr109:    mov          a2, a13 /* arg1 */                    #  e88: 2d0d
            call0        .Lfunc004                             #  e8a: c52eff
            bnez         a2, .Lbr086                           #  e8d: 5622ca
            movi         a2, 2 /* 0x00000002 */                #  e90: 0c22
            l32i         a3, a13, 0x190 /* [arg1+0x190] */     #  e92: 322d64
            movi         a12, 1 /* 0x00000001 */               #  e95: 0c1c
            addi         a3, a3, -2 /* [arg1+0x190]-0x2 */     #  e97: 32c3fe
            movnez       a12, a2, a3                           #  e9a: 30c293
            j            .Lbr087                               #  e9d: 0625ff
.Lbr110:    addi         a5, a12, 99                           #  ea0: 52cc63
            l32i         a3, sp, 80 /* [(local12)] */          #  ea3: 322114
            add          a2, a13, a0 /* arg1+0xbc */           #  ea6: 0a2d
            addi         a4, a3, -8 /* [(local12)]-0x8 */      #  ea8: 42c3f8
            addi         a3, a3, -1 /* [(local12)]-0x1 */      #  eab: 0b33
            movgez       a3, a4, a4                            #  ead: 4034b3
            srai         a3, a3, 3                             #  eb0: 303321
            mov          a4, a15                               #  eb3: 4d0f
            call0        sdk_aes_wrap                          #  eb5: 0111ffc0
                                                               #  eb9: 0000
            beqz         a2, .Lbr103                           #  ebb: 1652ee
            mov          a2, a12                               #  ebe: 2d0c
            call0        free                                  #  ec0: 0110ffc0
                                                               #  ec4: 0000
            mov          a2, a15                               #  ec6: 2d0f
            call0        free                                  #  ec8: 010fffc0
                                                               #  ecc: 0000
            j            .Lbr107                               #  ece: 06dfff

            .literal_position                                  #  ed4: 600a0000
                                                               #  ed8: 00000000
                                                               #  edc: 00000000
                                                               #  ee0: 00000000

# Function @ .irom0.text+0xee4
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
            .balign      4
.Lfunc016:  addi         sp, sp, -48 /* (local0) */            #  ee4: 12c1d0
            s32i         a15, sp, 32 /* a15 -> [(local8)] */   #  ee7: f981
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     #  ee9: 0941
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   #  eeb: c951
            s32i         a13, sp, 24 /* a13 -> [(local6)] */   #  eed: d961
            s32i         a14, sp, 28 /* a14 -> [(local7)] */   #  eef: e971
            mov          a13, a4 /* arg2 */                    #  ef1: dd04
            mov          a14, a2 /* arg0 */                    #  ef3: ed02
            mov          a12, a3 /* arg1 */                    #  ef5: cd03
            beqz         a3, .Lbr115                           #  ef7: 16e307
            l32i         a3, sp, 52 /* [(FP)+0x4] */           #  efa: 38d1
            l32i         a2, sp, 56 /* [(FP)+0x8] */           #  efc: 28e1
            l32i         a4, sp, 48 /* [(local9)] */           #  efe: 48c1
            movi         a0, 0 /* 0x00000000 */                #  f00: 0c00
            s32i         a0, sp, 12 /* 0x00000000 -> [(local3)] */ #  f02: 0931
            s32i         a4, sp, 0 /* [(local9)] -> [(local0)] */ #  f04: 4901
            s32i         a2, sp, 8 /* [(FP)+0x8] -> [(local2)] */ #  f06: 2921
            s32i         a3, sp, 4 /* [(FP)+0x4] -> [(local1)] */ #  f08: 3911
            mov          a2, a14 /* arg0 */                    #  f0a: 2d0e
            mov          a3, a12 /* arg1 */                    #  f0c: 3d0c
            mov          a4, a13 /* arg2 */                    #  f0e: 4d0d
            call0        sdk___wpa_send_eapol                  #  f10: 050000
            l32i         a5, a12, 44 /* [arg1+0x2c] */         #  f13: 58bc
            l32i         a2, a12, 48 /* [arg1+0x30] */         #  f15: 28cc
            movi         a6, 1 /* 0x00000001 */                #  f17: 0c16
            movi         a0, 8 /* 0x00000008 */                #  f19: 0c80
            and          a0, a13, a0                           #  f1b: 000d10
            mov          a4, a0                                #  f1e: 4d00
            movnez       a4, a6, a0                            #  f20: 004693
            movnez       a2, a5, a4                            #  f23: 402593
            bnei         a2, 1, .Lbr111                        #  f26: 661207
            l32i         a3, a14, 68 /* [arg0+0x44] */         #  f29: 322e11
            movi         a5, 100 /* 0x00000064 */              #  f2c: 52a064
            bnez         a3, .Lbr112                           #  f2f: cc43
.Lbr111:    movi         a15, 1000 /* 0x000003e8 */            #  f31: f2a3e8
            j            .Lbr113                               #  f34: 460100
.Lbr112:    movi         a15, 500 /* 0x000001f4 */             #  f37: f2a1f4
            movnez       a15, a5, a4                           #  f3a: 40f593
.Lbr113:    beqz         a0, .Lbr114                           #  f3d: 8c90
            bnei         a2, 1, .Lbr114                        #  f3f: 661207
            bbsi         a13, 8, .Lbr114                       #  f42: 87ed04
            movi         a6, 1 /* 0x00000001 */                #  f45: 0c16
            s32i         a6, a12, 0x198 /* 0x00000001 -> [arg1+0x198] */ #  f47: 626c66
.Lbr114:    mov          a2, a15                               #  f4a: 2d0f
            movi         a3, 1000 /* 0x000003e8 */             #  f4c: 32a3e8
            call0        __divsi3                              #  f4f: 01e2ffc0
                                                               #  f53: 0000
            mov          a13, a2                               #  f55: dd02
            movi         a3, 1000 /* 0x000003e8 */             #  f57: 32a3e8
            mov          a2, a15                               #  f5a: 2d0f
            call0        __modsi3                              #  f5c: 01e0ffc0
                                                               #  f60: 0000
            mov          a6, a12 /* arg1 */                    #  f62: 6d0c
            mov          a5, a14 /* arg0 */                    #  f64: 5d0e
            mov          a3, a2                                #  f66: 3d02
            movi         a4, 1000 /* 0x000003e8 */             #  f68: 42a3e8
            mov          a2, a13                               #  f6b: 2d0d
            mull         a3, a3, a4                            #  f6d: 403382
            movi         a4, .Lfunc015                         #  f70: 41d9ff
            call0        sdk_eloop_register_timeout            #  f73: 01dbffc0
                                                               #  f77: 0000
.Lbr115:    l32i         a12, sp, 20 /* [(local5)] */          #  f79: c851
            l32i         a13, sp, 24 /* [(local6)] */          #  f7b: d861
            l32i         a14, sp, 28 /* [(local7)] */          #  f7d: e871
            l32i         a15, sp, 32 /* [(local8)] */          #  f7f: f881
            l32i         a0, sp, 16 /* [(local4)] */           #  f81: 0841
            addi         sp, sp, 48 /* (local9) */             #  f83: 12c130
            ret                                                #  f86: 0df0

            .literal_position                                  #  f88: 00000000
                                                               #  f8c: 00000000
                                                               #  f90: 00000000
                                                               #  f94: 00000000
                                                               #  f98: 00000000

# Function @ .irom0.text+0xf9c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
.Lfunc017:  addi         sp, sp, -48 /* (FP)-0x30 */           #  f9c: 12c1d0
            s32i         a12, sp, 28 /* a12 -> [(local3)] */   #  f9f: c971
            s32i         a2, sp, 20 /* arg0 -> [(local1)] */   #  fa1: 2951
            s32i         a0, sp, 24 /* a0 -> [(local2)] */     #  fa3: 0961
            s32i         a14, sp, 36 /* a14 -> [(local5)] */   #  fa5: e991
            s32i         a13, sp, 32 /* a13 -> [(local4)] */   #  fa7: d981
            mov          a14, a3 /* arg1 */                    #  fa9: ed03
            mov          a13, a4 /* arg2 */                    #  fab: dd04
            movi         a0, 98 /* 0x00000062 */               #  fad: 02a062
            bltu         a0, a4, .Lbr119                       #  fb0: 473021
            movi         a2, -1 /* 0xffffffff */               #  fb3: 7cf2
            j            .Lbr118                               #  fb5: c60300
.Lbr116:    movi         a13, -1 /* 0xffffffff */              #  fb8: 7cfd
.Lbr117:    mov          a2, a12 /* arg1+0x51 */               #  fba: 2d0c
            mov          a3, sp /* (FP)-0x30 */                #  fbc: 3d01
            movi         a4, 16 /* 0x00000010 */               #  fbe: 1c04
            call0        memcpy                                #  fc0: 01f2ffc0
                                                               #  fc4: 0000
            mov          a2, a13                               #  fc6: 2d0d
.Lbr118:    l32i         a12, sp, 28 /* [(local3)] */          #  fc8: c871
            l32i         a13, sp, 32 /* [(local4)] */          #  fca: d881
            l32i         a14, sp, 36 /* [(local5)] */          #  fcc: e891
            l32i         a0, sp, 24 /* [(local2)] */           #  fce: 0861
            addi         sp, sp, 48 /* (top of frame) */       #  fd0: 12c130
            ret                                                #  fd3: 0df0
.Lbr119:    movi         a4, 16 /* 0x00000010 */               #  fd5: 1c04
            l8ui         a2, a3, 6 /* [arg1+0x6] */            #  fd7: 220306
            addi         a12, a3, 81 /* arg1+0x51 */           #  fda: c2c351
            s32i         a2, sp, 16 /* [arg1+0x6] -> [(local0)] */ #  fdd: 2941
            mov          a2, sp /* (FP)-0x30 */                #  fdf: 2d01
            mov          a3, a12 /* arg1+0x51 */               #  fe1: 3d0c
            call0        memcpy                                #  fe3: 01eaffc0
                                                               #  fe7: 0000
            mov          a2, a12 /* arg1+0x51 */               #  fe9: 2d0c
            movi         a3, 0 /* 0x00000000 */                #  feb: 0c03
            movi         a4, 16 /* 0x00000010 */               #  fed: 1c04
            call0        memset                                #  fef: 01e8ffc0
                                                               #  ff3: 0000
            mov          a5, a13 /* arg2 */                    #  ff5: 5d0d
            mov          a4, a14 /* arg1 */                    #  ff7: 4d0e
            l32i         a2, sp, 20 /* [(local1)] */           #  ff9: 2851
            l32i         a3, sp, 16 /* [(local0)] */           #  ffb: 3841
            mov          a6, a12 /* arg1+0x51 */               #  ffd: 6d0c
            extui        a3, a3, 0, 3                          #  fff: 303024
            call0        sdk_wpa_eapol_key_mic                 # 1002: 01e4ffc0
                                                               # 1006: 0000
            bnez         a2, .Lbr116                           # 1008: 56c2fa
            mov          a2, sp /* (FP)-0x30 */                # 100b: 2d01
            mov          a3, a12 /* arg1+0x51 */               # 100d: 3d0c
            movi         a4, 16 /* 0x00000010 */               # 100f: 1c04
            call0        memcmp                                # 1011: 01e1ffc0
                                                               # 1015: 0000
            bnez         a2, .Lbr116                           # 1017: 56d2f9
            movi         a13, 0 /* 0x00000000 */               # 101a: 0c0d
            j            .Lbr117                               # 101c: 86e6ff

            .literal_position                                  # 1020: d4010000
                                                               # 1024: 00000000
                                                               # 1028: 00000000

# Function @ .irom0.text+0x102c
# Local variables/stack:
#     (local0):  word[4]   @ -0x20
#     (local1):  word      @ -0x10
#     (local2):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wpa_remove_ptk
            .type        sdk_wpa_remove_ptk, @function
sdk_wpa_remove_ptk:
            movi         a4, 64 /* 0x00000040 */               # 102c: 4c04
            movi         a3, 0 /* 0x00000000 */                # 102e: 0c03
            addi         sp, sp, -32 /* (local0) */            # 1030: 12c1e0
            s32i         a12, sp, 20 /* a12 -> [(local2)] */   # 1033: c951
            s32i         a0, sp, 16 /* a0 -> [(local1)] */     # 1035: 0941
            mov          a12, a2 /* arg0 */                    # 1037: cd02
            s32i         a3, a2, 236 /* 0x00000000 -> [arg0+0xec] */ # 1039: 32623b
            movi         a2, 172 /* 0x000000ac */              # 103c: 22a0ac
            add          a2, a12, a2 /* arg0+0xac */           # 103f: 2a2c
            call0        memset                                # 1041: 01f8ffc0
                                                               # 1045: 0000
            movi         a4, 0 /* 0x00000000 */                # 1047: 0c04
            addi         a5, a12, 8 /* arg0+0x8 */             # 1049: 8b5c
            movi         a6, 0 /* 0x00000000 */                # 104b: 0c06
            l32i         a2, a12, 0 /* [arg0] */               # 104d: 280c
            movi         a3, 0 /* 0x00000000 */                # 104f: 0c03
            movi         a7, 0 /* 0x00000000 */                # 1051: 0c07
            s32i         a3, sp, 0 /* 0x00000000 -> [(local0)] */ # 1053: 3901
            movi         a3, 0 /* 0x00000000 */                # 1055: 0c03
            call0        .Lfunc002                             # 1057: 45fefe
            l32i         a3, a12, 0 /* [arg0] */               # 105a: 380c
            movi         a4, 0 /* 0x00000000 */                # 105c: 0c04
            movi         a2, .Lfunc006                         # 105e: 21f0ff
            s32i         a4, a12, 240 /* 0x00000000 -> [arg0+0xf0] */ # 1061: 426c3c
            mov          a4, a12 /* arg0 */                    # 1064: 4d0c
            call0        sdk_eloop_cancel_timeout              # 1066: 01f0ffc0
                                                               # 106a: 0000
            l32i         a12, sp, 20 /* [(local2)] */          # 106c: c851
            l32i         a0, sp, 16 /* [(local1)] */           # 106e: 0841
            addi         sp, sp, 32 /* (top of frame) */       # 1070: 12c120
            ret                                                # 1073: 0df0

            .literal_position                                  # 1078: 00000000
                                                               # 107c: b81e0000

# Function @ .irom0.text+0x1080
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_wpa_auth_sm_event
            .type        sdk_wpa_auth_sm_event, @function
sdk_wpa_auth_sm_event:
            addi         sp, sp, -16 /* (local0) */            # 1080: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1083: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 1085: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 1087: d921
            mov          a12, a2 /* arg0 */                    # 1089: cd02
            mov          a13, a3 /* arg1 */                    # 108b: dd03
            bnez         a2, .Lbr120                           # 108d: cc32
            movi         a2, -1 /* 0xffffffff */               # 108f: 7cf2
            j            .Lbr126                               # 1091: c61e00
.Lbr120:    movi         a2, 0 /* 0x00000000 */                # 1094: 0c02
            bltui        a3, 2, .Lbr124                        # 1096: b62352
            movi         a0, 1 /* 0x00000001 */                # 1099: 0c10
            bgeui        a3, 4, .Lbr121                        # 109b: f64302
            bgeui        a3, 2, .Lbr127                        # 109e: f62379
.Lbr121:    bgeui        a13, 6, .Lbr124                       # 10a1: f66d47
            bltui        a13, 4, .Lbr124                       # 10a4: b64d44
            movi         a5, 244 /* 0x000000f4 */              # 10a7: 52a0f4
            add          a5, a12, a5 /* arg0+0xf4 */           # 10aa: 5a5c
            l8ui         a3, a5, 128 /* [arg0+0x174] */        # 10ac: 320580
            bbsi         a3, 3, .Lbr122                        # 10af: 37e324
            mov          a2, a12 /* arg0 */                    # 10b2: 2d0c
            movi         a6, 1 /* 0x00000001 */                # 10b4: 0c16
            movi         a8, 8 /* 0x00000008 */                # 10b6: 0c88
            movi         a7, 247 /* 0x000000f7 */              # 10b8: 72a0f7
            and          a7, a3, a7                            # 10bb: 707310
            or           a7, a7, a8                            # 10be: 807720
            s8i          a7, a5, 128 /* a7 -> [arg0+0x174] */  # 10c1: 724580
            s32i         a6, a12, 24 /* 0x00000001 -> [arg0+0x18] */ # 10c4: 696c
            call0        .Lfunc048                             # 10c6: 05df00
            beqi         a2, 1, .Lbr128                        # 10c9: 261253
            movi         a8, 0 /* 0x00000000 */                # 10cc: 0c08
            movi         a9, 1 /* 0x00000001 */                # 10ce: 0c19
            s32i         a9, a12, 32 /* 0x00000001 -> [arg0+0x20] */ # 10d0: 998c
            s32i         a8, a12, 24 /* 0x00000000 -> [arg0+0x18] */ # 10d2: 896c
            j            .Lbr124                               # 10d4: 060500
.Lbr122:    l32i         a10, a12, 72 /* [arg0+0x48] */        # 10d7: a22c12
            beqz         a10, .Lbr123                          # 10da: 8cca
            l32i         a3, a12, 4 /* [arg0+0x4] */           # 10dc: 381c
            l32i         a11, a3, 12 /* [[arg0+0x4]+0xc] */    # 10de: b833
            addi         a11, a11, -1 /* [[arg0+0x4]+0xc]-0x1 */ # 10e0: 0bbb
            s32i         a11, a3, 12 /* [[arg0+0x4]+0xc]-0x1 -> [[arg0+0x4]+0xc] */ # 10e2: b933
            s32i         a2, a12, 72 /* 0x00000000 -> [arg0+0x48] */ # 10e4: 226c12
            s32i         a0, a12, 0x168 /* 0x00000001 -> [arg0+0x168] */ # 10e7: 026c5a
.Lbr123:    s32i         a0, a12, 36 /* 0x00000001 -> [arg0+0x24] */ # 10ea: 099c
.Lbr124:    movi         a4, 64 /* 0x00000040 */               # 10ec: 4c04
            movi         a2, 172 /* 0x000000ac */              # 10ee: 22a0ac
            movi         a3, 0 /* 0x00000000 */                # 10f1: 0c03
            s32i         a3, a12, 236 /* 0x00000000 -> [arg0+0xec] */ # 10f3: 326c3b
            add          a2, a12, a2 /* arg0+0xac */           # 10f6: 2a2c
            movi         a3, 0 /* 0x00000000 */                # 10f8: 0c03
            call0        memset                                # 10fa: 01dfffc0
                                                               # 10fe: 0000
            beqi         a13, 5, .Lbr125                       # 1100: 265d04
            mov          a2, a12 /* arg0 */                    # 1103: 2d0c
            call0        sdk_wpa_remove_ptk                    # 1105: 050000
.Lbr125:    mov          a2, a12 /* arg0 */                    # 1108: 2d0c
            call0        .Lfunc048                             # 110a: 01dcffc0
                                                               # 110e: 0000
.Lbr126:    l32i         a12, sp, 4 /* [(local1)] */           # 1110: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 1112: d821
            l32i         a0, sp, 0 /* [(local0)] */            # 1114: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1116: 12c110
            ret                                                # 1119: 0df0
.Lbr127:    s32i         a0, a12, 28 /* 0x00000001 -> [arg0+0x1c] */ # 111b: 097c
            j            .Lbr124                               # 111d: c6f2ff
.Lbr128:    movi         a2, 1 /* 0x00000001 */                # 1120: 0c12
            j            .Lbr126                               # 1122: 86faff

            .literal_position                                  # 1128: 00000000

# Function @ .irom0.text+0x112c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
.Lfunc018:  movi         a5, 180 /* 0x000000b4 */              # 112c: 52a0b4
            addi         sp, sp, -16 /* (local0) */            # 112f: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 1132: d921
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   # 1134: e931
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1136: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 1138: c911
            movi         a0, 1 /* 0x00000001 */                # 113a: 0c10
            mov          a12, a2 /* arg0 */                    # 113c: cd02
            movi         a14, 0 /* 0x00000000 */               # 113e: 0c0e
            movi         a2, 254 /* 0x000000fe */              # 1140: 22a0fe
            beqz         a3, .Lbr129                           # 1143: 8c73
            l32i         a3, a12, 16 /* [arg0+0x10] */         # 1145: 384c
            add          a13, a12, a5 /* arg0+0xb4 */          # 1147: 5adc
            bnez         a3, .Lbr129                           # 1149: cc13
            j            .Lbr130                               # 114b: 460300
.Lbr129:    add          a13, a12, a5 /* arg0+0xb4 */          # 114e: 5adc
            l8ui         a4, a13, 192 /* [arg0+0x174] */       # 1150: 420dc0
            and          a4, a4, a2                            # 1153: 204410
            or           a4, a4, a0                            # 1156: 004420
            s8i          a4, a13, 192 /* a4 -> [arg0+0x174] */ # 1159: 424dc0
.Lbr130:    l32i         a5, a12, 24 /* [arg0+0x18] */         # 115c: 586c
            s32i         a14, a12, 16 /* 0x00000000 -> [arg0+0x10] */ # 115e: e94c
            beqz         a5, .Lbr131                           # 1160: 8c75
            l8ui         a6, a13, 192 /* [arg0+0x174] */       # 1162: 620dc0
            and          a6, a6, a2                            # 1165: 206610
            s8i          a6, a13, 192 /* a6 -> [arg0+0x174] */ # 1168: 624dc0
.Lbr131:    l32i         a7, a12, 72 /* [arg0+0x48] */         # 116b: 722c12
            s32i         a14, a13, 64 /* 0x00000000 -> [arg0+0xf4] */ # 116e: e26d10
            beqz         a7, .Lbr132                           # 1171: 8c67
            l32i         a9, a12, 4 /* [arg0+0x4] */           # 1173: 981c
            l32i         a8, a9, 12 /* [[arg0+0x4]+0xc] */     # 1175: 8839
            addi         a8, a8, -1 /* [[arg0+0x4]+0xc]-0x1 */ # 1177: 0b88
            s32i         a8, a9, 12 /* [[arg0+0x4]+0xc]-0x1 -> [[arg0+0x4]+0xc] */ # 1179: 8939
.Lbr132:    l32i         a9, a13, 216 /* [arg0+0x18c] */       # 117b: 922d36
            s32i         a14, a12, 72 /* 0x00000000 -> [arg0+0x48] */ # 117e: e26c12
            bnei         a9, 1, .Lbr133                        # 1181: 661902
            s32i         a14, a12, 0x15c /* 0x00000000 -> [arg0+0x15c] */ # 1184: e26c57
.Lbr133:    mov          a2, a12 /* arg0 */                    # 1187: 2d0c
            s32i         a0, a12, 248 /* 0x00000001 -> [arg0+0xf8] */ # 1189: 026c3e
            call0        sdk_wpa_remove_ptk                    # 118c: 050000
            s32i         a14, a12, 44 /* 0x00000000 -> [arg0+0x2c] */ # 118f: e9bc
            l32i         a2, a13, 224 /* [arg0+0x194] */       # 1191: 222d38
            call0        .Lfunc001                             # 1194: 01e5ffc0
                                                               # 1198: 0000
            l32i         a12, sp, 4 /* [(local1)] */           # 119a: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 119c: d821
            l32i         a14, sp, 12 /* [(local3)] */          # 119e: e831
            l32i         a0, sp, 0 /* [(local0)] */            # 11a0: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 11a2: 12c110
            ret                                                # 11a5: 0df0

            .balign      4
# Function @ .irom0.text+0x11a8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc019:  addi         sp, sp, -16 /* (local0) */            # 11a8: 12c1f0
            mov          a5, a2 /* arg0 */                     # 11ab: 5d02
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 11ad: 0901
            movi         a0, 1 /* 0x00000001 */                # 11af: 0c10
            beqz         a3, .Lbr134                           # 11b1: 8c33
            l32i         a2, a2, 16 /* [arg0+0x10] */          # 11b3: 2842
            beqi         a2, 1, .Lbr135                        # 11b5: 261213
.Lbr134:    movi         a4, 244 /* 0x000000f4 */              # 11b8: 42a0f4
            add          a4, a5, a4 /* arg0+0xf4 */            # 11bb: 4a45
            l8ui         a3, a4, 128 /* [arg0+0x174] */        # 11bd: 320480
            movi         a6, 254 /* 0x000000fe */              # 11c0: 62a0fe
            and          a3, a3, a6                            # 11c3: 603310
            or           a3, a3, a0                            # 11c6: 003320
            s8i          a3, a4, 128 /* a3 -> [arg0+0x174] */  # 11c9: 324480
.Lbr135:    l32i         a2, a5, 0 /* [arg0] */                # 11cc: 2805
            addi         a3, a5, 8 /* arg0+0x8 */              # 11ce: 8b35
            s32i         a0, a5, 16 /* 0x00000001 -> [arg0+0x10] */ # 11d0: 0945
            movi         a6, 0 /* 0x00000000 */                # 11d2: 0c06
            s32i         a6, a5, 40 /* 0x00000000 -> [arg0+0x28] */ # 11d4: 69a5
            call0        .Lfunc003                             # 11d6: c5f9fe
            l32i         a0, sp, 0 /* [(local0)] */            # 11d9: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 11db: 12c110
            ret                                                # 11de: 0df0

# Function @ .irom0.text+0x11e0
            .balign      4
.Lfunc020:  movi         a7, 2 /* 0x00000002 */                # 11e0: 0c27
            beqz         a3, .Lbr136                           # 11e2: 8c33
            l32i         a3, a2, 16 /* [arg0+0x10] */          # 11e4: 3842
            beqi         a3, 2, .Lbr137                        # 11e6: 262315
.Lbr136:    movi         a5, 244 /* 0x000000f4 */              # 11e9: 52a0f4
            add          a5, a2, a5 /* arg0+0xf4 */            # 11ec: 5a52
            l8ui         a4, a5, 128 /* [arg0+0x174] */        # 11ee: 420580
            movi         a6, 254 /* 0x000000fe */              # 11f1: 62a0fe
            and          a4, a4, a6                            # 11f4: 604410
            movi         a6, 1 /* 0x00000001 */                # 11f7: 0c16
            or           a4, a4, a6                            # 11f9: 604420
            s8i          a4, a5, 128 /* a4 -> [arg0+0x174] */  # 11fc: 424580
.Lbr137:    s32i         a7, a2, 16 /* 0x00000002 -> [arg0+0x10] */ # 11ff: 7942
            movi         a6, 0 /* 0x00000000 */                # 1201: 0c06
            s32i         a6, a2, 28 /* 0x00000000 -> [arg0+0x1c] */ # 1203: 6972
            ret           /* arg0 */                           # 1205: 0df0

            .literal_position                                  # 1208: 00000000

# Function @ .irom0.text+0x120c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc021:  addi         sp, sp, -16 /* (local0) */            # 120c: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 120f: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1211: 0901
            mov          a12, a2 /* arg0 */                    # 1213: cd02
            beqz         a3, .Lbr138                           # 1215: 8c33
            l32i         a0, a2, 16 /* [arg0+0x10] */          # 1217: 0842
            beqi         a0, 3, .Lbr139                        # 1219: 263015
.Lbr138:    movi         a3, 244 /* 0x000000f4 */              # 121c: 32a0f4
            add          a3, a12, a3 /* arg0+0xf4 */           # 121f: 3a3c
            l8ui         a2, a3, 128 /* [arg0+0x174] */        # 1221: 220380
            movi         a4, 254 /* 0x000000fe */              # 1224: 42a0fe
            and          a2, a2, a4                            # 1227: 402210
            movi         a4, 1 /* 0x00000001 */                # 122a: 0c14
            or           a2, a2, a4                            # 122c: 402220
            s8i          a2, a3, 128 /* a2 -> [arg0+0x174] */  # 122f: 224380
.Lbr139:    movi         a4, 64 /* 0x00000040 */               # 1232: 4c04
            movi         a2, 172 /* 0x000000ac */              # 1234: 22a0ac
            movi         a3, 3 /* 0x00000003 */                # 1237: 0c33
            s32i         a3, a12, 16 /* 0x00000003 -> [arg0+0x10] */ # 1239: 394c
            add          a2, a12, a2 /* arg0+0xac */           # 123b: 2a2c
            movi         a3, 0 /* 0x00000000 */                # 123d: 0c03
            call0        memset                                # 123f: 01f2ffc0
                                                               # 1243: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 1245: 0801
            movi         a4, 0 /* 0x00000000 */                # 1247: 0c04
            s32i         a4, a12, 236 /* 0x00000000 -> [arg0+0xec] */ # 1249: 426c3b
            s32i         a4, a12, 32 /* 0x00000000 -> [arg0+0x20] */ # 124c: 498c
            l32i         a12, sp, 4 /* [(local1)] */           # 124e: c811
            addi         sp, sp, 16 /* (top of frame) */       # 1250: 12c110
            ret                                                # 1253: 0df0

            .balign      4
# Function @ .irom0.text+0x1258
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc022:  addi         sp, sp, -16 /* (local0) */            # 1258: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 125b: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 125d: d921
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 125f: 0901
            mov          a13, a2 /* arg0 */                    # 1261: dd02
            l32i         a0, a3, 204 /* [arg1+0xcc] */         # 1263: 022333
            mov          a12, a3 /* arg1 */                    # 1266: cd03
            bnez         a0, .Lbr140                           # 1268: dcd0
            movi         a3, 1 /* 0x00000001 */                # 126a: 0c13
            movi         a2, 0 /* 0x00000000 */                # 126c: 0c02
            s32i         a2, a12, 208 /* 0x00000000 -> [arg1+0xd0] */ # 126e: 226c34
            s32i         a3, a12, 204 /* 0x00000001 -> [arg1+0xcc] */ # 1271: 326c33
            mov          a2, a13 /* arg0 */                    # 1274: 2d0d
            mov          a3, a12 /* arg1 */                    # 1276: 3d0c
            call0        .Lfunc007                             # 1278: 05f9fe
            mov          a2, a13 /* arg0 */                    # 127b: 2d0d
            mov          a3, a12 /* arg1 */                    # 127d: 3d0c
            call0        .Lfunc041                             # 127f: 85a500
            mov          a3, a12 /* arg1 */                    # 1282: 3d0c
            mov          a2, a13 /* arg0 */                    # 1284: 2d0d
            call0        .Lfunc045                             # 1286: 05b800
.Lbr140:    l32i         a12, sp, 4 /* [(local1)] */           # 1289: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 128b: d821
            l32i         a0, sp, 0 /* [(local0)] */            # 128d: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 128f: 12c110
            ret                                                # 1292: 0df0

            .literal_position                                  # 1294: 00000000

# Function @ .irom0.text+0x1298
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc023:  addi         sp, sp, -16 /* (local0) */            # 1298: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 129b: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 129d: 0901
            mov          a12, a2 /* arg0 */                    # 129f: cd02
            beqz         a3, .Lbr141                           # 12a1: 8c33
            l32i         a0, a2, 16 /* [arg0+0x10] */          # 12a3: 0842
            beqi         a0, 4, .Lbr142                        # 12a5: 264015
.Lbr141:    movi         a3, 244 /* 0x000000f4 */              # 12a8: 32a0f4
            add          a3, a12, a3 /* arg0+0xf4 */           # 12ab: 3a3c
            l8ui         a2, a3, 128 /* [arg0+0x174] */        # 12ad: 220380
            movi         a4, 254 /* 0x000000fe */              # 12b0: 42a0fe
            and          a2, a2, a4                            # 12b3: 402210
            movi         a4, 1 /* 0x00000001 */                # 12b6: 0c14
            or           a2, a2, a4                            # 12b8: 402220
            s8i          a2, a3, 128 /* a2 -> [arg0+0x174] */  # 12bb: 224380
.Lbr142:    l32i         a2, a12, 0 /* [arg0] */               # 12be: 280c
            l32i         a3, a12, 4 /* [arg0+0x4] */           # 12c0: 381c
            movi         a4, 4 /* 0x00000004 */                # 12c2: 0c44
            s32i         a4, a12, 16 /* 0x00000004 -> [arg0+0x10] */ # 12c4: 494c
            call0        .Lfunc022                             # 12c6: 05f9ff
            addi         a2, a12, 76 /* arg0+0x4c */           # 12c9: 22cc4c
            movi         a3, 32 /* 0x00000020 */               # 12cc: 2c03
            call0        os_get_random                         # 12ce: 01f1ffc0
                                                               # 12d2: 0000
            beqz         a2, .Lbr143                           # 12d4: 8c82
            l32i         a2, a12, 0 /* [arg0] */               # 12d6: 280c
            addi         a3, a12, 8 /* arg0+0x8 */             # 12d8: 8b3c
            call0        .Lfunc003                             # 12da: 85e9fe
            j            .Lbr144                               # 12dd: 460100
.Lbr143:    movi         a5, 0 /* 0x00000000 */                # 12e0: 0c05
            s32i         a5, a12, 36 /* 0x00000000 -> [arg0+0x24] */ # 12e2: 599c
            s32i         a5, a12, 44 /* 0x00000000 -> [arg0+0x2c] */ # 12e4: 59bc
.Lbr144:    l32i         a12, sp, 4 /* [(local1)] */           # 12e6: c811
            l32i         a0, sp, 0 /* [(local0)] */            # 12e8: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 12ea: 12c110
            ret                                                # 12ed: 0df0

            .balign      4
# Function @ .irom0.text+0x12f0
            .balign      4
.Lfunc024:  movi         a7, 5 /* 0x00000005 */                # 12f0: 0c57
            beqz         a3, .Lbr145                           # 12f2: 8c33
            l32i         a3, a2, 16 /* [arg0+0x10] */          # 12f4: 3842
            beqi         a3, 5, .Lbr146                        # 12f6: 265315
.Lbr145:    movi         a5, 244 /* 0x000000f4 */              # 12f9: 52a0f4
            add          a5, a2, a5 /* arg0+0xf4 */            # 12fc: 5a52
            l8ui         a4, a5, 128 /* [arg0+0x174] */        # 12fe: 420580
            movi         a6, 254 /* 0x000000fe */              # 1301: 62a0fe
            and          a4, a4, a6                            # 1304: 604410
            movi         a6, 1 /* 0x00000001 */                # 1307: 0c16
            or           a4, a4, a6                            # 1309: 604420
            s8i          a4, a5, 128 /* a4 -> [arg0+0x174] */  # 130c: 424580
.Lbr146:    s32i         a7, a2, 16 /* 0x00000005 -> [arg0+0x10] */ # 130f: 7942
            movi         a6, 0 /* 0x00000000 */                # 1311: 0c06
            s32i         a6, a2, 0x180 /* 0x00000000 -> [arg0+0x180] */ # 1313: 626260
            ret           /* arg0 */                           # 1316: 0df0

            .literal_position                                  # 1318: 00000000
                                                               # 131c: 00000000
                                                               # 1320: 00000000

# Function @ .irom0.text+0x1324
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc025:  addi         sp, sp, -16 /* (local0) */            # 1324: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 1327: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1329: 0901
            mov          a12, a2 /* arg0 */                    # 132b: cd02
            beqz         a3, .Lbr147                           # 132d: 8c33
            l32i         a0, a2, 16 /* [arg0+0x10] */          # 132f: 0842
            beqi         a0, 6, .Lbr148                        # 1331: 266015
.Lbr147:    movi         a3, 244 /* 0x000000f4 */              # 1334: 32a0f4
            add          a3, a12, a3 /* arg0+0xf4 */           # 1337: 3a3c
            l8ui         a2, a3, 128 /* [arg0+0x174] */        # 1339: 220380
            movi         a4, 254 /* 0x000000fe */              # 133c: 42a0fe
            and          a2, a2, a4                            # 133f: 402210
            movi         a4, 1 /* 0x00000001 */                # 1342: 0c14
            or           a2, a2, a4                            # 1344: 402220
            s8i          a2, a3, 128 /* a2 -> [arg0+0x174] */  # 1347: 224380
.Lbr148:    addi         a3, a12, 8 /* arg0+0x8 */             # 134a: 8b3c
            movi         a2, sdk_g_ic                          # 134c: 21f3ff
            movi         a4, 0 /* 0x00000000 */                # 134f: 0c04
            l32i         a2, a2, 20 /* [sdk_g_ic+0x14] */      # 1351: 2852
            movi         a5, 6 /* 0x00000006 */                # 1353: 0c65
            l32i         a2, a2, 180 /* [[sdk_g_ic+0x14]+0xb4] */ # 1355: 22222d
            s32i         a5, a12, 16 /* 0x00000006 -> [arg0+0x10] */ # 1358: 594c
            l32i         a2, a2, 4 /* [[[sdk_g_ic+0x14]+0xb4]+0x4] */ # 135a: 2812
            call0        sdk_hostapd_get_psk                   # 135c: 01f0ffc0
                                                               # 1360: 0000
            beqz         a2, .Lbr149                           # 1362: 8cd2
            mov          a3, a2                                # 1364: 3d02
            movi         a4, 32 /* 0x00000020 */               # 1366: 2c04
            movi         a2, 140 /* 0x0000008c */              # 1368: 22a08c
            add          a2, a12, a2 /* arg0+0x8c */           # 136b: 2a2c
            call0        memcpy                                # 136d: 01ecffc0
                                                               # 1371: 0000
.Lbr149:    movi         a3, 0 /* 0x00000000 */                # 1373: 0c03
            l32i         a0, sp, 0 /* [(local0)] */            # 1375: 0801
            s32i         a3, a12, 0x180 /* 0x00000000 -> [arg0+0x180] */ # 1377: 326c60
            l32i         a12, sp, 4 /* [(local1)] */           # 137a: c811
            addi         sp, sp, 16 /* (top of frame) */       # 137c: 12c110
            ret                                                # 137f: 0df0

            .literal_position                                  # 1384: a1400000
                                                               # 1388: 00000000

# Function @ .irom0.text+0x138c
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word      @ -0x3c
#     (local2):  word[2]   @ -0x38
#     (local3):  byte      @ -0x30
#     (local4):  byte      @ -0x2f
#     (local5):  byte      @ -0x2e
#     (local6):  byte      @ -0x2d
#     (local7):  byte      @ -0x2c
#     (local8):  byte[27]  @ -0x2b
#     (local9):  word      @ -0x10
#     (local10): word[3]   @ -0xc
            .balign      4
.Lfunc026:  movi         a5, 7 /* 0x00000007 */                # 138c: 0c75
            addi         sp, sp, -64 /* (local0) */            # 138e: 12c1c0
            s32i         a12, sp, 52 /* a12 -> [(local10)] */  # 1391: c9d1
            s32i         a0, sp, 48 /* a0 -> [(local9)] */     # 1393: 09c1
            mov          a12, a2 /* arg0 */                    # 1395: cd02
            beqz         a3, .Lbr150                           # 1397: 8c33
            l32i         a0, a2, 16 /* [arg0+0x10] */          # 1399: 0842
            beqi         a0, 7, .Lbr151                        # 139b: 267015
.Lbr150:    movi         a3, 244 /* 0x000000f4 */              # 139e: 32a0f4
            add          a3, a12, a3 /* arg0+0xf4 */           # 13a1: 3a3c
            l8ui         a2, a3, 128 /* [arg0+0x174] */        # 13a3: 220380
            movi         a4, 254 /* 0x000000fe */              # 13a6: 42a0fe
            and          a2, a2, a4                            # 13a9: 402210
            movi         a4, 1 /* 0x00000001 */                # 13ac: 0c14
            or           a2, a2, a4                            # 13ae: 402220
            s8i          a2, a3, 128 /* a2 -> [arg0+0x174] */  # 13b1: 224380
.Lbr151:    s32i         a5, a12, 16 /* 0x00000007 -> [arg0+0x10] */ # 13b4: 594c
            l32i         a4, a12, 44 /* [arg0+0x2c] */         # 13b6: 48bc
            movi         a0, 0 /* 0x00000000 */                # 13b8: 0c00
            s32i         a0, a12, 0x160 /* 0x00000000 -> [arg0+0x160] */ # 13ba: 026c58
            s32i         a0, a12, 52 /* 0x00000000 -> [arg0+0x34] */ # 13bd: 09dc
            addi         a4, a4, 1 /* [arg0+0x2c]+0x1 */       # 13bf: 1b44
            s32i         a4, a12, 44 /* [arg0+0x2c]+0x1 -> [arg0+0x2c] */ # 13c1: 49bc
            bgei         a4, 5, .Lbr155                        # 13c3: e65474
            l32i         a6, a12, 0x18c /* [arg0+0x18c] */     # 13c6: 622c63
            l32i         a8, a12, 0x194 /* [arg0+0x194] */     # 13c9: 822c65
            bnei         a6, 2, .Lbr153                        # 13cc: 662652
            movi         a7, 0x000040a1                        # 13cf: 71edff
            movi         a2, 15 /* 0x0000000f */               # 13d2: 0cf2
            bnone        a7, a8, .Lbr153                       # 13d4: 87074a
            movi         a3, -84 /* 0xffffffac */              # 13d7: 32afac
            movi         a4, 4 /* 0x00000004 */                # 13da: 0c44
            movi         a9, -35 /* 0xffffffdd */              # 13dc: 92afdd
            movi         a11, 20 /* 0x00000014 */              # 13df: 1c4b
            addi         a10, sp, 16 /* (local3) */            # 13e1: a2c110
            s8i          a0, a10, 2 /* 0x00 -> [(local5)] */   # 13e4: 024a02
            s8i          a2, a10, 3 /* 0x0f -> [(local6)] */   # 13e7: 224a03
            s8i          a11, a10, 1 /* 0x14 -> [(local4)] */  # 13ea: b24a01
            s8i          a9, a10, 0 /* 0xdd -> [(local3)] */   # 13ed: 924a00
            s8i          a4, a10, 5 /* 0x04 -> [(local8)] */   # 13f0: 424a05
            s8i          a3, a10, 4 /* 0xac -> [(local7)] */   # 13f3: 324a04
            l32i         a2, a12, 0x194 /* [arg0+0x194] */     # 13f6: 222c65
            movi         a7, 1 /* 0x00000001 */                # 13f9: 0c17
            beqi         a2, 0x100, .Lbr152                    # 13fb: 26f204
            beqi         a2, 128, .Lbr152                      # 13fe: 26e201
            mov          a7, a0 /* 0x00000000 */               # 1401: 7d00
.Lbr152:    movi         a3, 32 /* 0x00000020 */               # 1403: 2c03
            addi         a5, a12, 8 /* arg0+0x8 */             # 1405: 8b5c
            addi         a6, sp, 22 /* (FP)-0x2a */            # 1407: 62c116
            l32i         a4, a12, 0 /* [arg0] */               # 140a: 480c
            movi         a2, 140 /* 0x0000008c */              # 140c: 22a08c
            add          a2, a12, a2 /* arg0+0x8c */           # 140f: 2a2c
            addi         a4, a4, 88 /* [arg0]+0x58 */          # 1411: 42c458
            call0        sdk_rsn_pmkid                         # 1414: 01ddffc0
                                                               # 1418: 0000
            movi         a0, 22 /* 0x00000016 */               # 141a: 1c60
            addi         a7, sp, 16 /* (local3) */             # 141c: 72c110
            j            .Lbr154                               # 141f: 460000
.Lbr153:    movi         a7, 0 /* 0x00000000 */                # 1422: 0c07
.Lbr154:    addi         a6, a12, 76 /* arg0+0x4c */           # 1424: 62cc4c
            movi         a4, 136 /* 0x00000088 */              # 1427: 42a088
            movi         a5, 0 /* 0x00000000 */                # 142a: 0c05
            movi         a3, 0 /* 0x00000000 */                # 142c: 0c03
            l32i         a2, a12, 0 /* [arg0] */               # 142e: 280c
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1430: 0901
            s32i         a3, sp, 4 /* 0x00000000 -> [(local1)] */ # 1432: 3911
            s32i         a3, sp, 8 /* 0x00000000 -> [(local2)] */ # 1434: 3921
            mov          a3, a12 /* arg0 */                    # 1436: 3d0c
            call0        .Lfunc016                             # 1438: 85aaff
.Lbr155:    l32i         a12, sp, 52 /* [(local10)] */         # 143b: c8d1
            l32i         a0, sp, 48 /* [(local9)] */           # 143d: 08c1
            addi         sp, sp, 64 /* (top of frame) */       # 143f: 12c140
            ret                                                # 1442: 0df0

            .literal_position                                  # 1444: 10000000
                                                               # 1448: 00000000

# Function @ .irom0.text+0x144c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
.Lfunc027:  mov          a7, a2 /* arg0 */                     # 144c: 7d02
            addi         sp, sp, -32 /* (local0) */            # 144e: 12c1e0
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     # 1451: 0941
            mov          a2, a3 /* arg1 */                     # 1453: 2d03
            l32i         a3, a7, 0x194 /* [arg0+0x194] */      # 1455: 322765
            movi         a0, 1 /* 0x00000001 */                # 1458: 0c10
            beqi         a3, 0x100, .Lbr156                    # 145a: 26f304
            beqi         a3, 128, .Lbr156                      # 145d: 26e301
            movi         a0, 0 /* 0x00000000 */                # 1460: 0c00
.Lbr156:    movi         a3, 32 /* 0x00000020 */               # 1462: 2c03
            movi         a9, 48 /* 0x00000030 */               # 1464: 3c09
            movi         a8, 64 /* 0x00000040 */               # 1466: 4c08
            addi         a6, a7, 108 /* arg0+0x6c */           # 1468: 62c76c
            l32i         a5, a7, 0 /* [arg0] */                # 146b: 5807
            l32i         a10, a7, 0x190 /* [arg0+0x190] */     # 146d: a22764
            addi         a5, a5, 88 /* [arg0]+0x58 */          # 1470: 52c558
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     # 1473: 0931
            s32i         a4, sp, 4 /* arg2 -> [(local1)] */    # 1475: 4911
            addi         a10, a10, -2 /* [arg0+0x190]-0x2 */   # 1477: a2cafe
            movi         a4, .Lstr002                          # 147a: 41f2ff
            s32i         a6, sp, 0 /* arg0+0x6c -> [(local0)] */ # 147d: 6901
            movnez       a8, a9, a10                           # 147f: a08993
            addi         a6, a7, 8 /* arg0+0x8 */              # 1482: 8b67
            s32i         a8, sp, 8 /* a8 -> [(local2)] */      # 1484: 8921
            addi         a7, a7, 76 /* arg0+0x4c */            # 1486: 72c74c
            call0        sdk_wpa_pmk_to_ptk                    # 1489: 01efffc0
                                                               # 148d: 0000
            movi         a2, 0 /* 0x00000000 */                # 148f: 0c02
            l32i         a0, sp, 16 /* [(local4)] */           # 1491: 0841
            addi         sp, sp, 32 /* (top of frame) */       # 1493: 12c120
            ret           /* 0x00000000 */                     # 1496: 0df0

            .literal_position                                  # 1498: 00000000
                                                               # 149c: 600a0000
                                                               # 14a0: 00000000
                                                               # 14a4: 00000000
                                                               # 14a8: 00000000
                                                               # 14ac: 00000000
                                                               # 14b0: 00000000
                                                               # 14b4: 00000000
                                                               # 14b8: 00000000

# Function @ .irom0.text+0x14bc
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
.Lfunc028:  movi         a7, 191 /* 0x000000bf */              # 14bc: 72a0bf
            movi         a8, 8 /* 0x00000008 */                # 14bf: 0c88
            addi         sp, sp, -96 /* (FP)-0x60 */           # 14c1: 12c1a0
            s32i         a15, sp, 80 /* a15 -> [(local4)] */   # 14c4: f26114
            s32i         a14, sp, 76 /* a14 -> [(local3)] */   # 14c7: e26113
            s32i         a12, sp, 68 /* a12 -> [(local1)] */   # 14ca: c26111
            s32i         a0, sp, 64 /* a0 -> [(local0)] */     # 14cd: 026110
            s32i         a13, sp, 72 /* a13 -> [(local2)] */   # 14d0: d26112
            movi         a0, 1 /* 0x00000001 */                # 14d3: 0c10
            movi         a13, 0 /* 0x00000000 */               # 14d5: 0c0d
            mov          a12, a2 /* arg0 */                    # 14d7: cd02
            movi         a14, 140 /* 0x0000008c */             # 14d9: e2a08c
            movi         a2, 244 /* 0x000000f4 */              # 14dc: 22a0f4
            addi         a15, a12, 8 /* arg0+0x8 */            # 14df: 8bfc
            beqz         a3, .Lbr157                           # 14e1: 8c83
            l32i         a3, a12, 16 /* [arg0+0x10] */         # 14e3: 384c
            bnei         a3, 8, .Lbr157                        # 14e5: 668304
            add          a2, a12, a2 /* arg0+0xf4 */           # 14e8: 2a2c
            j            .Lbr158                               # 14ea: 060400
.Lbr157:    add          a2, a12, a2 /* arg0+0xf4 */           # 14ed: 2a2c
            l8ui         a4, a2, 128 /* [arg0+0x174] */        # 14ef: 420280
            movi         a5, 254 /* 0x000000fe */              # 14f2: 52a0fe
            and          a4, a4, a5                            # 14f5: 504410
            or           a4, a4, a0                            # 14f8: 004420
            s8i          a4, a2, 128 /* a4 -> [arg0+0x174] */  # 14fb: 424280
.Lbr158:    s32i         a8, a12, 16 /* 0x00000008 -> [arg0+0x10] */ # 14fe: 894c
            s32i         a13, a12, 56 /* 0x00000000 -> [arg0+0x38] */ # 1500: d9ec
            l8ui         a6, a2, 128 /* [arg0+0x174] */        # 1502: 620280
            add          a14, a12, a14 /* arg0+0x8c */         # 1505: eaec
            and          a6, a6, a7                            # 1507: 706610
            s8i          a6, a2, 128 /* a6 -> [arg0+0x174] */  # 150a: 624280
.Lbr159:    l32i         a2, a12, 0x194 /* [arg0+0x194] */     # 150d: 222c65
            call0        .Lfunc001                             # 1510: 01e4ffc0
                                                               # 1514: 0000
            beqz         a2, .Lbr160                           # 1516: 9c92
            movi         a2, sdk_g_ic                          # 1518: 21e0ff
            l32i         a2, a2, 20 /* [sdk_g_ic+0x14] */      # 151b: 2852
            mov          a4, a13                               # 151d: 4d0d
            l32i         a2, a2, 180 /* [[sdk_g_ic+0x14]+0xb4] */ # 151f: 22222d
            mov          a3, a15 /* arg0+0x8 */                # 1522: 3d0f
            l32i         a2, a2, 4 /* [[[sdk_g_ic+0x14]+0xb4]+0x4] */ # 1524: 2812
            call0        sdk_hostapd_get_psk                   # 1526: 01dfffc0
                                                               # 152a: 0000
            mov          a13, a2                               # 152c: dd02
            bnez         a2, .Lbr161                           # 152e: cc32
            j            .Lbr162                               # 1530: 060900
.Lbr160:    mov          a13, a14 /* arg0+0x8c */              # 1533: dd0e
.Lbr161:    mov          a2, a12 /* arg0 */                    # 1535: 2d0c
            mov          a3, a13                               # 1537: 3d0d
            mov          a4, sp /* (FP)-0x60 */                # 1539: 4d01
            call0        .Lfunc027                             # 153b: 05f1ff
            mov          a2, sp /* (FP)-0x60 */                # 153e: 2d01
            l32i         a3, a12, 0x16c /* [arg0+0x16c] */     # 1540: 322c5b
            l32i         a4, a12, 0x170 /* [arg0+0x170] */     # 1543: 422c5c
            call0        .Lfunc017                             # 1546: 45a5ff
            beqz         a2, .Lbr166                           # 1549: 163206
            l32i         a2, a12, 0x194 /* [arg0+0x194] */     # 154c: 222c65
            call0        .Lfunc001                             # 154f: 01d6ffc0
                                                               # 1553: 0000
            bnez         a2, .Lbr159                           # 1555: 5642fb
.Lbr162:    movi         a0, 0 /* 0x00000000 */                # 1558: 0c00
.Lbr163:    beqz         a0, .Lbr165                           # 155a: bce0
            movi         a2, .Lfunc015                         # 155c: 21d0ff
            movi         a3, 0 /* 0x00000000 */                # 155f: 0c03
            mov          a4, a12 /* arg0 */                    # 1561: 4d0c
            s32i         a3, a12, 0x198 /* 0x00000000 -> [arg0+0x198] */ # 1563: 326c66
            l32i         a3, a12, 0 /* [arg0] */               # 1566: 380c
            call0        sdk_eloop_cancel_timeout              # 1568: 01d1ffc0
                                                               # 156c: 0000
            l32i         a2, a12, 0x194 /* [arg0+0x194] */     # 156e: 222c65
            call0        .Lfunc001                             # 1571: 01cfffc0
                                                               # 1575: 0000
            beqz         a2, .Lbr164                           # 1577: 8ca2
            mov          a3, a13                               # 1579: 3d0d
            mov          a2, a14 /* arg0+0x8c */               # 157b: 2d0e
            movi         a4, 32 /* 0x00000020 */               # 157d: 2c04
            call0        memcpy                                # 157f: 01cdffc0
                                                               # 1583: 0000
.Lbr164:    mov          a3, sp /* (FP)-0x60 */                # 1585: 3d01
            movi         a4, 64 /* 0x00000040 */               # 1587: 4c04
            movi         a2, 172 /* 0x000000ac */              # 1589: 22a0ac
            movi         a13, 1 /* 0x00000001 */               # 158c: 0c1d
            s32i         a13, a12, 68 /* 0x00000001 -> [arg0+0x44] */ # 158e: d26c11
            add          a2, a12, a2 /* arg0+0xac */           # 1591: 2a2c
            call0        memcpy                                # 1593: 01c9ffc0
                                                               # 1597: 0000
            s32i         a13, a12, 236 /* 0x00000001 -> [arg0+0xec] */ # 1599: d26c3b
.Lbr165:    l32i         a12, sp, 68 /* [(local1)] */          # 159c: c22111
            l32i         a13, sp, 72 /* [(local2)] */          # 159f: d22112
            l32i         a14, sp, 76 /* [(local3)] */          # 15a2: e22113
            l32i         a15, sp, 80 /* [(local4)] */          # 15a5: f22114
            l32i         a0, sp, 64 /* [(local0)] */           # 15a8: 022110
            addi         sp, sp, 96 /* (top of frame) */       # 15ab: 12c160
            ret                                                # 15ae: 0df0
.Lbr166:    movi         a0, 1 /* 0x00000001 */                # 15b0: 0c10
            j            .Lbr163                               # 15b2: 06e9ff

            .balign      4
# Function @ .irom0.text+0x15b8
            .balign      4
.Lfunc029:  movi         a6, 9 /* 0x00000009 */                # 15b8: 0c96
            beqz         a3, .Lbr167                           # 15ba: 8c33
            l32i         a3, a2, 16 /* [arg0+0x10] */          # 15bc: 3842
            beq          a3, a6, .Lbr168                       # 15be: 671315
.Lbr167:    movi         a5, 244 /* 0x000000f4 */              # 15c1: 52a0f4
            add          a5, a2, a5 /* arg0+0xf4 */            # 15c4: 5a52
            l8ui         a4, a5, 128 /* [arg0+0x174] */        # 15c6: 420580
            movi         a7, 254 /* 0x000000fe */              # 15c9: 72a0fe
            and          a4, a4, a7                            # 15cc: 704410
            movi         a7, 1 /* 0x00000001 */                # 15cf: 0c17
            or           a4, a4, a7                            # 15d1: 704420
            s8i          a4, a5, 128 /* a4 -> [arg0+0x174] */  # 15d4: 424580
.Lbr168:    s32i         a6, a2, 16 /* 0x00000009 -> [arg0+0x10] */ # 15d7: 6942
            movi         a7, 0 /* 0x00000000 */                # 15d9: 0c07
            s32i         a7, a2, 44 /* 0x00000000 -> [arg0+0x2c] */ # 15db: 79b2
            ret           /* arg0 */                           # 15dd: 0df0

            .balign      4
# Function @ .irom0.text+0x15e0
            .balign      4
.Lfunc030:  movi         a2, 0 /* 0x00000000 */                # 15e0: 0c02
            ret           /* 0x00000000 */                     # 15e2: 0df0

# Function @ .irom0.text+0x15e4
            .balign      4
.Lfunc031:  mov          a2, a3 /* arg1 */                     # 15e4: 2d03
            ret           /* arg1 */                           # 15e6: 0df0

            .literal_position                                  # 15e8: 01ac0f00
                                                               # 15ec: 00000000
                                                               # 15f0: 00000000
                                                               # 15f4: 00000000
                                                               # 15f8: 00000000
                                                               # 15fc: 00000000
                                                               # 1600: 00000000

# Function @ .irom0.text+0x1604
# Local variables/stack:
#     (local0):  word      @ -0x80
#     (local1):  word      @ -0x7c
#     (local2):  word[14]  @ -0x78
#     (local3):  byte      @ -0x40
#     (local4):  byte[3]   @ -0x3f
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
#     (local16): word[4]   @ -0x10
            .balign      4
.Lfunc032:  movi         a4, 1 /* 0x00000001 */                # 1604: 0c14
            movi         a8, 10 /* 0x0000000a */               # 1606: 0ca8
            addi         sp, sp, -128 /* (local0) */           # 1608: 12c180
            s32i         a13, sp, 100 /* a13 -> [(local13)] */ # 160b: d26119
            s32i         a15, sp, 108 /* a15 -> [(local15)] */ # 160e: f2611b
            s32i         a12, sp, 96 /* a12 -> [(local12)] */  # 1611: c26118
            s32i         a14, sp, 104 /* a14 -> [(local14)] */ # 1614: e2611a
            s32i         a0, sp, 92 /* a0 -> [(local11)] */    # 1617: 026117
            l32i         a14, a2, 4 /* [arg0+0x4] */           # 161a: e812
            movi         a0, 244 /* 0x000000f4 */              # 161c: 02a0f4
            mov          a12, a2 /* arg0 */                    # 161f: cd02
            beqz         a3, .Lbr169                           # 1621: 8c33
            l32i         a2, a2, 16 /* [arg0+0x10] */          # 1623: 2842
            beqi         a2, 10, .Lbr170                       # 1625: 269210
.Lbr169:    add          a5, a12, a0 /* arg0+0xf4 */           # 1628: 0a5c
            l8ui         a3, a5, 128 /* [arg0+0x174] */        # 162a: 320580
            movi         a6, 254 /* 0x000000fe */              # 162d: 62a0fe
            and          a3, a3, a6                            # 1630: 603310
            or           a3, a3, a4                            # 1633: 403320
            s8i          a3, a5, 128 /* a3 -> [arg0+0x174] */  # 1636: 324580
.Lbr170:    s32i         a8, a12, 16 /* 0x0000000a -> [arg0+0x10] */ # 1639: 894c
            l32i         a7, a12, 44 /* [arg0+0x2c] */         # 163b: 78bc
            movi         a3, 0 /* 0x00000000 */                # 163d: 0c03
            s32i         a3, a12, 52 /* 0x00000000 -> [arg0+0x34] */ # 163f: 39dc
            addi         a7, a7, 1 /* [arg0+0x2c]+0x1 */       # 1641: 1b77
            s32i         a7, a12, 44 /* [arg0+0x2c]+0x1 -> [arg0+0x2c] */ # 1643: 79bc
            blti         a7, 5, .Lbr171                        # 1645: a65702
            j            .Lbr177                               # 1648: 864b00
.Lbr171:    addi         a2, sp, 16 /* (FP)-0x70 */            # 164b: 22c110
            movi         a4, 8 /* 0x00000008 */                # 164e: 0c84
            call0        memset                                # 1650: 01e7ffc0
                                                               # 1654: 0000
            l32i         a0, a12, 0 /* [arg0] */               # 1656: 080c
            l32i         a2, a12, 0x18c /* [arg0+0x18c] */     # 1658: 222c63
            l32i         a15, a0, 80 /* [[arg0]+0x50] */       # 165b: f22014
            l32i         a13, a0, 84 /* [[arg0]+0x54] */       # 165e: d22015
            bnei         a2, 1, .Lbr172                        # 1661: 66121d
            l32i         a9, a0, 4 /* [[arg0]+0x4] */          # 1664: 9810
            bbci         a9, 1, .Lbr172                        # 1666: 176918
            l8ui         a4, a15, 1 /* [[[arg0]+0x50]+0x1] */  # 1669: 420f01
            addi         a10, a4, 2 /* [[[arg0]+0x50]+0x1]+0x2 */ # 166c: 2ba4
            bge          a10, a13, .Lbr172                     # 166e: d7aa10
            l8ui         a11, a15, 0 /* [[[arg0]+0x50]] */     # 1671: b20f00
            movi         a3, 48 /* 0x00000030 */               # 1674: 3c03
            bne          a11, a3, .Lbr172                      # 1676: 379b08
            add          a15, a4, a15                          # 1679: faf4
            l8ui         a13, a15, 3                           # 167b: d20f03
            addi         a15, a15, 2                           # 167e: 2bff
            addi         a13, a13, 2                           # 1680: 2bdd
.Lbr172:    s32i         a14, sp, 68 /* [arg0+0x4] -> [(local5)] */ # 1682: e26111
            bnei         a2, 2, .Lbr174                        # 1685: 662241
            mov          a4, a14 /* [arg0+0x4] */              # 1688: 4d0e
            l32i         a2, a14, 24 /* [[arg0+0x4]+0x18] */   # 168a: 286e
            l32i         a3, a0, 72 /* [[arg0]+0x48] */        # 168c: 322012
            slli         a14, a2, 5                            # 168f: b0e211
            add          a14, a4, a14                          # 1692: eae4
            addi         a14, a14, 72                          # 1694: e2ce48
            l32i         a4, a4, 20 /* [[arg0+0x4]+0x14] */    # 1697: 4854
            s32i         a4, sp, 112 /* [[arg0+0x4]+0x14] -> [(local16)] */ # 1699: 42611c
            beqz         a3, .Lbr173                           # 169c: 9c43
            addi         a2, sp, 32 /* (FP)-0x60 */            # 169e: 22c120
            mov          a3, a4 /* [[arg0+0x4]+0x14] */        # 16a1: 3d04
            call0        os_get_random                         # 16a3: 01d3ffc0
                                                               # 16a7: 0000
            bltz         a2, .Lbr177                           # 16a9: 96d20c
            l32i         a2, sp, 68 /* [(local5)] */           # 16ac: 222111
            addi         a14, sp, 32 /* (FP)-0x60 */           # 16af: e2c120
            l32i         a2, a2, 24 /* [[(local5)]+0x18] */    # 16b2: 2862
.Lbr173:    s32i         a2, sp, 88 /* a2 -> [(local10)] */    # 16b4: 226116
            movi         a3, 1 /* 0x00000001 */                # 16b7: 0c13
            addi         a4, sp, 16 /* (FP)-0x70 */            # 16b9: 42c110
            movi         a5, 1 /* 0x00000001 */                # 16bc: 0c15
            s32i         a5, sp, 76 /* 0x00000001 -> [(local7)] */ # 16be: 526113
            s32i         a4, sp, 80 /* (FP)-0x70 -> [(local8)] */ # 16c1: 426114
            s32i         a3, sp, 84 /* 0x00000001 -> [(local9)] */ # 16c4: 326115
            j            .Lbr175                               # 16c7: c60800
.Lbr174:    movi         a14, 0 /* 0x00000000 */               # 16ca: 0c0e
            movi         a7, 244 /* 0x000000f4 */              # 16cc: 72a0f4
            movi         a8, 0 /* 0x00000000 */                # 16cf: 0c08
            movi         a9, 0 /* 0x00000000 */                # 16d1: 0c09
            movi         a10, 0 /* 0x00000000 */               # 16d3: 0c0a
            s32i         a10, sp, 80 /* 0x00000000 -> [(local8)] */ # 16d5: a26114
            s32i         a9, sp, 88 /* 0x00000000 -> [(local10)] */ # 16d8: 926116
            s32i         a8, sp, 112 /* 0x00000000 -> [(local16)] */ # 16db: 82611c
            add          a7, a12, a7 /* arg0+0xf4 */           # 16de: 7a7c
            movi         a8, 0 /* 0x00000000 */                # 16e0: 0c08
            l8ui         a7, a7, 128 /* [arg0+0x174] */        # 16e2: 720780
            s32i         a8, sp, 84 /* 0x00000000 -> [(local9)] */ # 16e5: 826115
            extui        a7, a7, 5, 1                          # 16e8: 707504
            s32i         a7, sp, 76 /* a7 -> [(local7)] */     # 16eb: 726113
.Lbr175:    mov          a2, a12 /* arg0 */                    # 16ee: 2d0c
            call0        .Lfunc030                             # 16f0: c5eeff
            s32i         a15, sp, 72 /* a15 -> [(local6)] */   # 16f3: f26112
            l32i         a11, sp, 112 /* [(local16)] */        # 16f6: b2211c
            add          a2, a2, a13                           # 16f9: da22
            add          a11, a2, a11                          # 16fb: bab2
            addi         a11, a11, 8                           # 16fd: 8bbb
            movnez       a2, a11, a14                          # 16ff: e02b93
            call0        malloc                                # 1702: 01bcffc0
                                                               # 1706: 0000
            mov          a15, a2                               # 1708: fd02
            beqz         a2, .Lbr177                           # 170a: 16c206
            l32i         a3, sp, 72 /* [(local6)] */           # 170d: 322112
            mov          a4, a13                               # 1710: 4d0d
            call0        memcpy                                # 1712: 01b9ffc0
                                                               # 1716: 0000
            add          a3, a13, a15                          # 1718: fa3d
            beqz         a14, .Lbr176                          # 171a: ac3e
            mov          a6, a14                               # 171c: 6d0e
            addi         a4, sp, 64 /* (local3) */             # 171e: 42c140
            movi         a5, 2 /* 0x00000002 */                # 1721: 0c25
            l32i         a7, sp, 112 /* [(local16)] */         # 1723: 72211c
            l32i         a13, sp, 88 /* [(local10)] */         # 1726: d22116
            mov          a2, a3                                # 1729: 2d03
            movi         a0, 0 /* 0x00000000 */                # 172b: 0c00
            movi         a3, 0x000fac01                        # 172d: 31aeff
            s8i          a0, sp, 65 /* 0x00 -> [(local4)] */   # 1730: 024141
            extui        a13, a13, 0, 2                        # 1733: d0d014
            s8i          a13, sp, 64 /* a13 -> [(local3)] */   # 1736: d24140
            call0        sdk_wpa_add_kde                       # 1739: 01b0ffc0
                                                               # 173d: 0000
            mov          a3, a2                                # 173f: 3d02
.Lbr176:    mov          a2, a12 /* arg0 */                    # 1741: 2d0c
            call0        .Lfunc031                             # 1743: 05eaff
            l32i         a5, sp, 80 /* [(local8)] */           # 1746: 522114
            mov          a3, a12 /* arg0 */                    # 1749: 3d0c
            addi         a6, a12, 76 /* arg0+0x4c */           # 174b: 62cc4c
            l32i         a8, sp, 76 /* [(local7)] */           # 174e: 822113
            movi         a7, 968 /* 0x000003c8 */              # 1751: 72a3c8
            movi         a4, 456 /* 0x000001c8 */              # 1754: 42a1c8
            l32i         a10, sp, 84 /* [(local9)] */          # 1757: a22115
            l32i         a11, sp, 88 /* [(local10)] */         # 175a: b22116
            mov          a9, a2                                # 175d: 9d02
            sub          a9, a9, a15                           # 175f: f099c0
            l32i         a2, a12, 0 /* [arg0] */               # 1762: 280c
            s32i         a11, sp, 4 /* [(local10)] -> [(local1)] */ # 1764: b911
            s32i         a10, sp, 8 /* [(local9)] -> [(local2)] */ # 1766: a921
            movnez       a4, a7, a8                            # 1768: 804793
            s32i         a9, sp, 0 /* a9 -> [(local0)] */      # 176b: 9901
            mov          a7, a15                               # 176d: 7d0f
            call0        .Lfunc016                             # 176f: 4577ff
            mov          a2, a15                               # 1772: 2d0f
            call0        free                                  # 1774: 01a3ffc0
                                                               # 1778: 0000
.Lbr177:    l32i         a12, sp, 96 /* [(local12)] */         # 177a: c22118
            l32i         a13, sp, 100 /* [(local13)] */        # 177d: d22119
            l32i         a14, sp, 104 /* [(local14)] */        # 1780: e2211a
            l32i         a15, sp, 108 /* [(local15)] */        # 1783: f2211b
            movi         a2, 128 /* 0x00000080 */              # 1786: 22a080
            l32i         a0, sp, 92 /* [(local11)] */          # 1789: 022117
            add          sp, sp, a2 /* (top of frame) */       # 178c: 2a11
            ret           /* 0x00000080 */                     # 178e: 0df0

            .literal_position                                  # 1790: d4010000
                                                               # 1794: d4010000
                                                               # 1798: 00000000
                                                               # 179c: 00000000
                                                               # 17a0: 00000000
                                                               # 17a4: 00000000
                                                               # 17a8: 00000000
                                                               # 17ac: 00000000

# Function @ .irom0.text+0x17b0
# Local variables/stack:
#     (local0):  word[4]   @ -0x30
#     (local1):  word      @ -0x20
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word[4]   @ -0x10
            .balign      4
.Lfunc033:  addi         sp, sp, -48 /* (local0) */            # 17b0: 12c1d0
            s32i         a13, sp, 32 /* a13 -> [(local5)] */   # 17b3: d981
            s32i         a12, sp, 28 /* a12 -> [(local4)] */   # 17b5: c971
            s32i         a0, sp, 24 /* a0 -> [(local3)] */     # 17b7: 0961
            mov          a12, a2 /* arg0 */                    # 17b9: cd02
            movi         a0, 11 /* 0x0000000b */               # 17bb: 0cb0
            movi         a13, 1 /* 0x00000001 */               # 17bd: 0c1d
            beqz         a3, .Lbr178                           # 17bf: 8c33
            l32i         a2, a2, 16 /* [arg0+0x10] */          # 17c1: 2842
            beq          a2, a0, .Lbr179                       # 17c3: 071213
.Lbr178:    movi         a4, 244 /* 0x000000f4 */              # 17c6: 42a0f4
            add          a4, a12, a4 /* arg0+0xf4 */           # 17c9: 4a4c
            l8ui         a3, a4, 128 /* [arg0+0x174] */        # 17cb: 320480
            movi         a5, 254 /* 0x000000fe */              # 17ce: 52a0fe
            and          a3, a3, a5                            # 17d1: 503310
            or           a3, a3, a13                           # 17d4: d03320
            s8i          a3, a4, 128 /* a3 -> [arg0+0x174] */  # 17d7: 324480
.Lbr179:    s32i         a0, a12, 16 /* 0x0000000b -> [arg0+0x10] */ # 17da: 094c
            l32i         a5, a12, 248 /* [arg0+0xf8] */        # 17dc: 522c3e
            movi         a0, 0 /* 0x00000000 */                # 17df: 0c00
            s32i         a0, a12, 56 /* 0x00000000 -> [arg0+0x38] */ # 17e1: 09ec
            beqz         a5, .Lbr182                           # 17e3: 167506
            l32i         a2, a12, 0x190 /* [arg0+0x190] */     # 17e6: 222c64
            call0        sdk_wpa_cipher_to_alg                 # 17e9: 01ecffc0
                                                               # 17ed: 0000
            s32i         a2, sp, 20 /* a2 -> [(local2)] */     # 17ef: 2951
            l32i         a2, a12, 0x190 /* [arg0+0x190] */     # 17f1: 222c64
            call0        sdk_wpa_cipher_key_len                # 17f4: 01ebffc0
                                                               # 17f8: 0000
            l32i         a4, sp, 20 /* [(local2)] */           # 17fa: 4851
            movi         a3, 0 /* 0x00000000 */                # 17fc: 0c03
            movi         a6, 0 /* 0x00000000 */                # 17fe: 0c06
            mov          a8, a2                                # 1800: 8d02
            addi         a5, a12, 8 /* arg0+0x8 */             # 1802: 8b5c
            movi         a7, 204 /* 0x000000cc */              # 1804: 72a0cc
            add          a7, a12, a7 /* arg0+0xcc */           # 1807: 7a7c
            s32i         a5, sp, 16 /* arg0+0x8 -> [(local1)] */ # 1809: 5941
            l32i         a2, a12, 0 /* [arg0] */               # 180b: 280c
            s32i         a8, sp, 0 /* a8 -> [(local0)] */      # 180d: 8901
            call0        .Lfunc002                             # 180f: c582fe
            beqz         a2, .Lbr180                           # 1812: 8c82
            l32i         a2, a12, 0 /* [arg0] */               # 1814: 280c
            l32i         a3, sp, 16 /* [(local1)] */           # 1816: 3841
            call0        .Lfunc003                             # 1818: 8595fe
            j            .Lbr185                               # 181b: 061400
.Lbr180:    l32i         a3, a12, 0 /* [arg0] */               # 181e: 380c
            s32i         a13, a12, 240 /* 0x00000001 -> [arg0+0xf0] */ # 1820: d26c3c
            l32i         a9, a3, 32 /* [[arg0]+0x20] */        # 1823: 9883
            beqz         a9, .Lbr181                           # 1825: 9ca9
            movi         a2, .Lfunc006                         # 1827: 21daff
            mov          a4, a12 /* arg0 */                    # 182a: 4d0c
            call0        sdk_eloop_cancel_timeout              # 182c: 01deffc0
                                                               # 1830: 0000
            movi         a3, 0 /* 0x00000000 */                # 1832: 0c03
            movi         a4, .Lfunc006                         # 1834: 41d8ff
            l32i         a5, a12, 0 /* [arg0] */               # 1837: 580c
            mov          a6, a12 /* arg0 */                    # 1839: 6d0c
            l32i         a2, a5, 32 /* [[arg0]+0x20] */        # 183b: 2885
            call0        sdk_eloop_register_timeout            # 183d: 01daffc0
                                                               # 1841: 0000
.Lbr181:    l32i         a2, a12, 0x194 /* [arg0+0x194] */     # 1843: 222c65
            call0        .Lfunc001                             # 1846: 01d9ffc0
                                                               # 184a: 0000
            movi         a0, 0 /* 0x00000000 */                # 184c: 0c00
.Lbr182:    l32i         a10, a12, 0x18c /* [arg0+0x18c] */    # 184e: a22c63
            bnei         a10, 1, .Lbr183                       # 1851: 661a05
            s32i         a13, a12, 0x15c /* 0x00000001 -> [arg0+0x15c] */ # 1854: d26c57
            j            .Lbr184                               # 1857: 860000
.Lbr183:    s32i         a13, a12, 0x164 /* 0x00000001 -> [arg0+0x164] */ # 185a: d26c59
.Lbr184:    movi         a12, sdk_g_ic                         # 185d: c1ceff
            l32i         a12, a12, 20 /* [sdk_g_ic+0x14] */    # 1860: c85c
            l32i         a12, a12, 136 /* [[sdk_g_ic+0x14]+0x88] */ # 1862: c22c22
            l32i         a11, a12, 8 /* [[[sdk_g_ic+0x14]+0x88]+0x8] */ # 1865: b82c
            s8i          a0, a12, 24 /* 0x00 -> [[[sdk_g_ic+0x14]+0x88]+0x18] */ # 1867: 024c18
            or           a11, a11, a13                         # 186a: d0bb20
            s32i         a11, a12, 8 /* a11 -> [[[sdk_g_ic+0x14]+0x88]+0x8] */ # 186d: b92c
.Lbr185:    l32i         a12, sp, 28 /* [(local4)] */          # 186f: c871
            l32i         a13, sp, 32 /* [(local5)] */          # 1871: d881
            l32i         a0, sp, 24 /* [(local3)] */           # 1873: 0861
            addi         sp, sp, 48 /* (top of frame) */       # 1875: 12c130
            ret                                                # 1878: 0df0

            .literal_position                                  # 187c: 01190000
                                                               # 1880: 00000000
                                                               # 1884: 00000000
                                                               # 1888: 00000000

# Function @ .irom0.text+0x188c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc034:  addi         sp, sp, -16 /* (local0) */            # 188c: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 188f: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1891: 0901
            l32i         a0, a2, 24 /* [arg0+0x18] */          # 1893: 0862
            mov          a12, a2 /* arg0 */                    # 1895: cd02
            beqz         a0, .Lbr187                           # 1897: 8cc0
            movi         a3, 0 /* 0x00000000 */                # 1899: 0c03
            call0        .Lfunc018                             # 189b: 0589ff
.Lbr186:    l32i         a12, sp, 4 /* [(local1)] */           # 189e: c811
            l32i         a0, sp, 0 /* [(local0)] */            # 18a0: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 18a2: 12c110
            ret                                                # 18a5: 0df0
.Lbr187:    l32i         a2, a2, 40 /* [arg0+0x28] */          # 18a7: 28a2
            beqz         a2, .Lbr188                           # 18a9: 8c82
            mov          a2, a12 /* arg0 */                    # 18ab: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 18ad: 0c03
            call0        .Lfunc019                             # 18af: 858fff
            j            .Lbr186                               # 18b2: 06faff
.Lbr188:    l32i         a3, a12, 28 /* [arg0+0x1c] */         # 18b5: 387c
            l32i         a4, a12, 32 /* [arg0+0x20] */         # 18b7: 488c
            beqz         a3, .Lbr189                           # 18b9: 8c83
            mov          a2, a12 /* arg0 */                    # 18bb: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 18bd: 0c03
            call0        .Lfunc020                             # 18bf: 0592ff
            j            .Lbr186                               # 18c2: 06f6ff
.Lbr189:    beqz         a4, .Lbr190                           # 18c5: 8c84
            mov          a2, a12 /* arg0 */                    # 18c7: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 18c9: 0c03
            call0        .Lfunc021                             # 18cb: 0594ff
            j            .Lbr186                               # 18ce: 06f3ff
.Lbr190:    l32i         a5, a12, 36 /* [arg0+0x24] */         # 18d1: 589c
            beqz         a5, .Lbr191                           # 18d3: 8c85
            mov          a2, a12 /* arg0 */                    # 18d5: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 18d7: 0c03
            call0        .Lfunc023                             # 18d9: c59bff
            j            .Lbr186                               # 18dc: 86efff
.Lbr191:    l32i         a6, a12, 0x160 /* [arg0+0x160] */     # 18df: 622c58
            movi         a4, 244 /* 0x000000f4 */              # 18e2: 42a0f4
            beqz         a6, .Lbr192                           # 18e5: 8c86
            mov          a2, a12 /* arg0 */                    # 18e7: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 18e9: 0c03
            call0        .Lfunc026                             # 18eb: 05aaff
            j            .Lbr186                               # 18ee: 06ebff
.Lbr192:    l32i         a0, a12, 16 /* [arg0+0x10] */         # 18f1: 084c
            movi         a8, .Lfunc035                         # 18f3: 81e2ff
            bgeui        a0, 12, .Lbr186                       # 18f6: f6a0a4
            addx2        a7, a0, a0                            # 18f9: 007090
            add          a7, a7, a8                            # 18fc: 8a77
            jx           a7                                    # 18fe: a00700

# Function @ .irom0.text+0x1901
            .balign      4
.Lfunc035:  j            .Lbr186                               # 1901: 46e6ff

# NOTE: The following is apparently unreferenced code/data
            .word        0x86002ec6                            # 1904: c62e0086
            .word        0x2846002b                            # 1908: 2b004628
            .word        0x00220600                            # 190c: 00062200
            .word        0xc6001ec6                            # 1910: c61e00c6
            .word        0x0e860015                            # 1914: 1500860e
            .word        0x0009c600                            # 1918: 00c60900
            .word        0x86000686                            # 191c: 86060086
            .word        0xde060000                            # 1920: 000006de
            .byte        0xff                                  # 1924: ff

# Function @ .irom0.text+0x1925
            .balign      4
            add          a9, a12, a4                           # 1925: 4a9c
            l8ui         a9, a9, 128                           # 1927: 920980
            extui        a9, a9, 6, 1                          # 192a: 909604
            beqz         a9, .Lbr194                           # 192d: 16b90a
            mov          a2, a12                               # 1930: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 1932: 0c03
            call0        .Lfunc028                             # 1934: 45b8ff
            j            .Lbr186                               # 1937: c6d8ff
            mov          a2, a12                               # 193a: 2d0c
            movi         a3, 0                                 # 193c: 0c03
            call0        .Lfunc032                             # 193e: 45ccff
            j            .Lbr186                               # 1941: 46d6ff
            l32i         a10, a12, 68                          # 1944: a22c11
            beqz         a10, .Lbr198                          # 1947: 16aa0d
            mov          a2, a12                               # 194a: 2d0c
            movi         a3, 0                                 # 194c: 0c03
            call0        .Lfunc029                             # 194e: 85c6ff
            j            .Lbr186                               # 1951: 46d2ff
            l32i         a11, a12, 56                          # 1954: b8ec
            beqz         a11, .Lbr193                          # 1956: 163b07
            l32i         a0, a12, 64                           # 1959: 022c10
            bnez         a0, .Lbr193                           # 195c: 56d006
            l32i         a2, a12, 60                           # 195f: 28fc
            beqz         a2, .Lbr193                           # 1961: 168206
            mov          a2, a12                               # 1964: 2d0c
            movi         a3, 0                                 # 1966: 0c03
            call0        .Lfunc028                             # 1968: 05b5ff
            j            .Lbr186                               # 196b: c6cbff
            movi         a2, None                              # 196e: 21c4ff
            l32i         a2, a2, 20                            # 1971: 2852
            addi         a3, a12, 8                            # 1973: 8b3c
            l32i         a2, a2, 180                           # 1975: 22222d
            movi         a4, 0                                 # 1978: 0c04
            l32i         a2, a2, 4                             # 197a: 2812
            call0        None                                  # 197c: 01c2ffc0
                                                               # 1980: 0000
            beqz         a2, .Lbr200                           # 1982: 16520c
            mov          a2, a12                               # 1985: 2d0c
            movi         a3, 0                                 # 1987: 0c03
            call0        .Lfunc026                             # 1989: 05a0ff
            j            .Lbr186                               # 198c: 86c3ff
            mov          a2, a12                               # 198f: 2d0c
            movi         a3, 0                                 # 1991: 0c03
            call0        .Lfunc019                             # 1993: 4581ff
            j            .Lbr186                               # 1996: 06c1ff
            l32i         a2, a12, 0x194                        # 1999: 222c65
            call0        None                                  # 199c: 01bbffc0
                                                               # 19a0: 0000
            beqz         a2, .Lbr186                           # 19a2: 1682ef
            mov          a2, a12                               # 19a5: 2d0c
            movi         a3, 0                                 # 19a7: 0c03
            call0        .Lfunc025                             # 19a9: 8597ff
            j            .Lbr186                               # 19ac: 86bbff
            mov          a2, a12                               # 19af: 2d0c
            movi         a3, 0                                 # 19b1: 0c03
            call0        .Lfunc023                             # 19b3: 458eff
            j            .Lbr186                               # 19b6: 06b9ff
            mov          a2, a12                               # 19b9: 2d0c
            movi         a3, 0                                 # 19bb: 0c03
            call0        .Lfunc018                             # 19bd: c576ff
            j            .Lbr186                               # 19c0: 86b6ff
            mov          a2, a12                               # 19c3: 2d0c
            movi         a3, 0                                 # 19c5: 0c03
            call0        .Lfunc020                             # 19c7: 8581ff
            j            .Lbr186                               # 19ca: 06b4ff
.Lbr193:    l32i         a3, a12, 44                           # 19cd: 38bc
            blti         a3, 5, .Lbr196                        # 19cf: a65334
            mov          a2, a12                               # 19d2: 2d0c
            movi         a3, 0                                 # 19d4: 0c03
            call0        .Lfunc019                             # 19d6: 057dff
            j            .Lbr186                               # 19d9: 46b0ff
.Lbr194:    l32i         a4, a12, 56                           # 19dc: 48ec
            beqz         a4, .Lbr195                           # 19de: 9c64
            l32i         a5, a12, 64                           # 19e0: 522c10
            bnez         a5, .Lbr195                           # 19e3: dc15
            l32i         a6, a12, 60                           # 19e5: 68fc
            beqz         a6, .Lbr195                           # 19e7: 8cd6
            l32i         a7, a12, 68                           # 19e9: 722c11
            beqz         a7, .Lbr195                           # 19ec: 8c87
            mov          a2, a12                               # 19ee: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 19f0: 0c03
            call0        .Lfunc033                             # 19f2: c5dbff
            j            .Lbr186                               # 19f5: 46a9ff
.Lbr195:    l32i         a8, a12, 44                           # 19f8: 88bc
            blti         a8, 5, .Lbr197                        # 19fa: a65818
            mov          a2, a12                               # 19fd: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 19ff: 0c03
            call0        .Lfunc019                             # 1a01: 457aff
            j            .Lbr186                               # 1a04: 86a5ff
.Lbr196:    l32i         a9, a12, 52                           # 1a07: 98dc
            beqz         a9, .Lbr186                           # 1a09: 1619e9
            mov          a2, a12                               # 1a0c: 2d0c
            movi         a3, 0                                 # 1a0e: 0c03
            call0        .Lfunc026                             # 1a10: 8597ff
            j            .Lbr186                               # 1a13: c6a1ff
.Lbr197:    l32i         a10, a12, 52                          # 1a16: a8dc
            beqz         a10, .Lbr186                          # 1a18: 162ae8
            mov          a2, a12                               # 1a1b: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 1a1d: 0c03
            call0        .Lfunc032                             # 1a1f: 45beff
            j            .Lbr186                               # 1a22: 069eff
.Lbr198:    l32i         a11, a12, 56                          # 1a25: b8ec
            beqz         a11, .Lbr199                          # 1a27: 9c1b
            l32i         a0, a12, 64                           # 1a29: 022c10
            bnez         a0, .Lbr199                           # 1a2c: ccc0
            l32i         a2, a12, 60                           # 1a2e: 28fc
            beqz         a2, .Lbr199                           # 1a30: 8c82
            mov          a2, a12                               # 1a32: 2d0c
            movi         a3, 0                                 # 1a34: 0c03
            call0        .Lfunc028                             # 1a36: 45a8ff
            j            .Lbr186                               # 1a39: 4698ff
.Lbr199:    l32i         a3, a12, 52                           # 1a3c: 38dc
            beqz         a3, .Lbr186                           # 1a3e: 16c3e5
            mov          a2, a12                               # 1a41: 2d0c
            movi         a3, 0                                 # 1a43: 0c03
            call0        .Lfunc026                             # 1a45: 4594ff
            j            .Lbr186                               # 1a48: 8694ff
.Lbr200:    mov          a2, a12                               # 1a4b: 2d0c
            movi         a3, 0                                 # 1a4d: 0c03
            call0        .Lfunc019                             # 1a4f: 8575ff
            j            .Lbr186                               # 1a52: 0692ff

            .balign      4
# Function @ .irom0.text+0x1a58
            .balign      4
.Lfunc036:  movi         a7, 254 /* 0x000000fe */              # 1a58: 72a0fe
            movi         a6, 244 /* 0x000000f4 */              # 1a5b: 62a0f4
            beqz         a3, .Lbr201                           # 1a5e: 8c23
            l32i         a3, a2, 20 /* [arg0+0x14] */          # 1a60: 3852
            beqz         a3, .Lbr202                           # 1a62: 8ce3
.Lbr201:    add          a5, a2, a6 /* arg0+0xf4 */            # 1a64: 6a52
            l8ui         a4, a5, 128 /* [arg0+0x174] */        # 1a66: 420580
            movi         a8, 1 /* 0x00000001 */                # 1a69: 0c18
            and          a4, a4, a7                            # 1a6b: 704410
            or           a4, a4, a8                            # 1a6e: 804420
            s8i          a4, a5, 128 /* a4 -> [arg0+0x174] */  # 1a71: 424580
.Lbr202:    movi         a5, 0 /* 0x00000000 */                # 1a74: 0c05
            l32i         a8, a2, 24 /* [arg0+0x18] */          # 1a76: 8862
            s32i         a5, a2, 20 /* 0x00000000 -> [arg0+0x14] */ # 1a78: 5952
            beqz         a8, .Lbr203                           # 1a7a: 8c98
            add          a10, a2, a6 /* arg0+0xf4 */           # 1a7c: 6aa2
            l8ui         a9, a10, 128 /* [arg0+0x174] */       # 1a7e: 920a80
            and          a9, a9, a7                            # 1a81: 709910
            s8i          a9, a10, 128 /* a9 -> [arg0+0x174] */ # 1a84: 924a80
.Lbr203:    s32i         a5, a2, 48 /* 0x00000000 -> [arg0+0x30] */ # 1a87: 59c2
            ret           /* arg0 */                           # 1a89: 0df0

            .literal_position                                  # 1a8c: 01ac0f00
                                                               # 1a90: 00000000
                                                               # 1a94: 00000000
                                                               # 1a98: 00000000
                                                               # 1a9c: 00000000
                                                               # 1aa0: 00000000

# Function @ .irom0.text+0x1aa4
# Local variables/stack:
#     (local0):  word      @ -0x60
#     (local1):  word      @ -0x5c
#     (local2):  word[14]  @ -0x58
#     (local3):  byte      @ -0x20
#     (local4):  byte[3]   @ -0x1f
#     (local5):  word      @ -0x1c
#     (local6):  word      @ -0x18
#     (local7):  word      @ -0x14
#     (local8):  word      @ -0x10
#     (local9):  word[3]   @ -0xc
            .balign      4
.Lfunc037:  addi         sp, sp, -96 /* (local0) */            # 1aa4: 12c1a0
            s32i         a14, sp, 84 /* a14 -> [(local9)] */   # 1aa7: e26115
            s32i         a13, sp, 80 /* a13 -> [(local8)] */   # 1aaa: d26114
            s32i         a12, sp, 76 /* a12 -> [(local7)] */   # 1aad: c26113
            s32i         a0, sp, 72 /* a0 -> [(local6)] */     # 1ab0: 026112
            mov          a12, a2 /* arg0 */                    # 1ab3: cd02
            movi         a0, 1 /* 0x00000001 */                # 1ab5: 0c10
            l32i         a13, a2, 4 /* [arg0+0x4] */           # 1ab7: d812
            beqz         a3, .Lbr204                           # 1ab9: 8c33
            l32i         a2, a2, 20 /* [arg0+0x14] */          # 1abb: 2852
            beqi         a2, 1, .Lbr205                        # 1abd: 261213
.Lbr204:    movi         a4, 244 /* 0x000000f4 */              # 1ac0: 42a0f4
            add          a4, a12, a4 /* arg0+0xf4 */           # 1ac3: 4a4c
            l8ui         a3, a4, 128 /* [arg0+0x174] */        # 1ac5: 320480
            movi         a5, 254 /* 0x000000fe */              # 1ac8: 52a0fe
            and          a3, a3, a5                            # 1acb: 503310
            or           a3, a3, a0                            # 1ace: 003320
            s8i          a3, a4, 128 /* a3 -> [arg0+0x174] */  # 1ad1: 324480
.Lbr205:    l32i         a5, a12, 48 /* [arg0+0x30] */         # 1ad4: 58cc
            s32i         a0, a12, 20 /* 0x00000001 -> [arg0+0x14] */ # 1ad6: 095c
            addi         a5, a5, 1 /* [arg0+0x30]+0x1 */       # 1ad8: 1b55
            s32i         a5, a12, 48 /* [arg0+0x30]+0x1 -> [arg0+0x30] */ # 1ada: 59cc
            blti         a5, 5, .Lbr206                        # 1adc: a65502
            j            .Lbr211                               # 1adf: 863000
.Lbr206:    l32i         a6, a12, 0x18c /* [arg0+0x18c] */     # 1ae2: 622c63
            movi         a14, 0 /* 0x00000000 */               # 1ae5: 0c0e
            bnei         a6, 1, .Lbr207                        # 1ae7: 661602
            s32i         a14, a12, 0x15c /* 0x00000000 -> [arg0+0x15c] */ # 1aea: e26c57
.Lbr207:    s32i         a14, a12, 52 /* 0x00000000 -> [arg0+0x34] */ # 1aed: e9dc
            addi         a2, sp, 16 /* (FP)-0x50 */            # 1aef: 22c110
            movi         a3, 0 /* 0x00000000 */                # 1af2: 0c03
            movi         a4, 8 /* 0x00000008 */                # 1af4: 0c84
            call0        memset                                # 1af6: 01e6ffc0
                                                               # 1afa: 0000
            l32i         a7, a12, 0 /* [arg0] */               # 1afc: 780c
            l32i         a0, a13, 24 /* [[arg0+0x4]+0x18] */   # 1afe: 086d
            l32i         a7, a7, 72 /* [[arg0]+0x48] */        # 1b00: 722712
            slli         a0, a0, 5                             # 1b03: b00011
            add          a0, a13, a0                           # 1b06: 0a0d
            addi         a0, a0, 72                            # 1b08: 02c048
            beqz         a7, .Lbr208                           # 1b0b: 8cf7
            addi         a2, sp, 32 /* (FP)-0x40 */            # 1b0d: 22c120
            l32i         a3, a13, 20 /* [[arg0+0x4]+0x14] */   # 1b10: 385d
            call0        os_get_random                         # 1b12: 01e0ffc0
                                                               # 1b16: 0000
            bltz         a2, .Lbr211                           # 1b18: 969208
            addi         a0, sp, 32 /* (FP)-0x40 */            # 1b1b: 02c120
.Lbr208:    l32i         a8, a12, 0x18c /* [arg0+0x18c] */     # 1b1e: 822c63
            s32i         a0, sp, 68 /* a0 -> [(local5)] */     # 1b21: 026111
            bnei         a8, 2, .Lbr209                        # 1b24: 66283f
            mov          a2, a12 /* arg0 */                    # 1b27: 2d0c
            call0        .Lfunc030                             # 1b29: 45abff
            l32i         a3, a13, 20 /* [[arg0+0x4]+0x14] */   # 1b2c: 385d
            add          a2, a3, a2                            # 1b2e: 2a23
            addi         a2, a2, 8                             # 1b30: 8b22
            call0        malloc                                # 1b32: 01d9ffc0
                                                               # 1b36: 0000
            mov          a14, a2                               # 1b38: ed02
            beqz         a2, .Lbr211                           # 1b3a: 167206
            l32i         a6, sp, 68 /* [(local5)] */           # 1b3d: 622111
            movi         a3, 0x000fac01                        # 1b40: 31d3ff
            l32i         a4, a13, 24 /* [[arg0+0x4]+0x18] */   # 1b43: 486d
            movi         a5, 0 /* 0x00000000 */                # 1b45: 0c05
            s8i          a5, sp, 65 /* 0x00 -> [(local4)] */   # 1b47: 524141
            extui        a4, a4, 0, 2                          # 1b4a: 404014
            s8i          a4, sp, 64 /* a4 -> [(local3)] */     # 1b4d: 424140
            movi         a5, 2 /* 0x00000002 */                # 1b50: 0c25
            addi         a4, sp, 64 /* (local3) */             # 1b52: 42c140
            l32i         a7, a13, 20 /* [[arg0+0x4]+0x14] */   # 1b55: 785d
            call0        sdk_wpa_add_kde                       # 1b57: 01d1ffc0
                                                               # 1b5b: 0000
            mov          a3, a2                                # 1b5d: 3d02
            mov          a2, a12 /* arg0 */                    # 1b5f: 2d0c
            call0        .Lfunc031                             # 1b61: 05a8ff
            j            .Lbr210                               # 1b64: 460100
.Lbr209:    l32i         a2, a13, 20 /* [[arg0+0x4]+0x14] */   # 1b67: 285d
            mov          a14, a0                               # 1b69: ed00
            add          a2, a2, a0                            # 1b6b: 0a22
.Lbr210:    movi         a3, 1 /* 0x00000001 */                # 1b6d: 0c13
            l32i         a7, a12, 248 /* [arg0+0xf8] */        # 1b6f: 722c3e
            movi         a5, 960 /* 0x000003c0 */              # 1b72: 52a3c0
            movi         a4, 896 /* 0x00000380 */              # 1b75: 42a380
            sub          a9, a2, a14                           # 1b78: e092c0
            movi         a6, 168 /* 0x000000a8 */              # 1b7b: 62a0a8
            add          a6, a13, a6 /* [arg0+0x4]+0xa8 */     # 1b7e: 6a6d
            l32i         a2, a12, 0 /* [arg0] */               # 1b80: 280c
            moveqz       a4, a5, a7                            # 1b82: 704583
            s32i         a9, sp, 0 /* a9 -> [(local0)] */      # 1b85: 9901
            addi         a5, sp, 16 /* (FP)-0x50 */            # 1b87: 52c110
            mov          a7, a14                               # 1b8a: 7d0e
            l32i         a8, a13, 24 /* [[arg0+0x4]+0x18] */   # 1b8c: 886d
            s32i         a3, sp, 8 /* 0x00000001 -> [(local2)] */ # 1b8e: 3921
            s32i         a8, sp, 4 /* [[arg0+0x4]+0x18] -> [(local1)] */ # 1b90: 8911
            mov          a3, a12 /* arg0 */                    # 1b92: 3d0c
            call0        .Lfunc016                             # 1b94: c534ff
            l32i         a10, a12, 0x18c /* [arg0+0x18c] */    # 1b97: a22c63
            bnei         a10, 2, .Lbr211                       # 1b9a: 662a07
            mov          a2, a14                               # 1b9d: 2d0e
            call0        free                                  # 1b9f: 01c0ffc0
                                                               # 1ba3: 0000
.Lbr211:    l32i         a12, sp, 76 /* [(local7)] */          # 1ba5: c22113
            l32i         a13, sp, 80 /* [(local8)] */          # 1ba8: d22114
            l32i         a14, sp, 84 /* [(local9)] */          # 1bab: e22115
            l32i         a0, sp, 72 /* [(local6)] */           # 1bae: 022112
            addi         sp, sp, 96 /* (top of frame) */       # 1bb1: 12c160
            ret                                                # 1bb4: 0df0

            .balign      4
# Function @ .irom0.text+0x1bb8
            .balign      4
.Lfunc038:  movi         a5, 1 /* 0x00000001 */                # 1bb8: 0c15
            movi         a8, 2 /* 0x00000002 */                # 1bba: 0c28
            beqz         a3, .Lbr212                           # 1bbc: 8c33
            l32i         a3, a2, 20 /* [arg0+0x14] */          # 1bbe: 3852
            beqi         a3, 2, .Lbr213                        # 1bc0: 262313
.Lbr212:    movi         a6, 244 /* 0x000000f4 */              # 1bc3: 62a0f4
            add          a6, a2, a6 /* arg0+0xf4 */            # 1bc6: 6a62
            l8ui         a4, a6, 128 /* [arg0+0x174] */        # 1bc8: 420680
            movi         a7, 254 /* 0x000000fe */              # 1bcb: 72a0fe
            and          a4, a4, a7                            # 1bce: 704410
            or           a4, a4, a5                            # 1bd1: 504420
            s8i          a4, a6, 128 /* a4 -> [arg0+0x174] */  # 1bd4: 424680
.Lbr213:    s32i         a8, a2, 20 /* 0x00000002 -> [arg0+0x14] */ # 1bd7: 8952
            movi         a6, 0 /* 0x00000000 */                # 1bd9: 0c06
            l32i         a7, a2, 72 /* [arg0+0x48] */          # 1bdb: 722212
            s32i         a6, a2, 56 /* 0x00000000 -> [arg0+0x38] */ # 1bde: 69e2
            beqz         a7, .Lbr214                           # 1be0: 8c67
            l32i         a10, a2, 4 /* [arg0+0x4] */           # 1be2: a812
            l32i         a9, a10, 12 /* [[arg0+0x4]+0xc] */    # 1be4: 983a
            addi         a9, a9, -1 /* [[arg0+0x4]+0xc]-0x1 */ # 1be6: 0b99
            s32i         a9, a10, 12 /* [[arg0+0x4]+0xc]-0x1 -> [[arg0+0x4]+0xc] */ # 1be8: 993a
.Lbr214:    s32i         a6, a2, 72 /* 0x00000000 -> [arg0+0x48] */ # 1bea: 626212
            s32i         a6, a2, 48 /* 0x00000000 -> [arg0+0x30] */ # 1bed: 69c2
            s32i         a5, a2, 0x164 /* 0x00000001 -> [arg0+0x164] */ # 1bef: 526259
            ret           /* arg0 */                           # 1bf2: 0df0

# Function @ .irom0.text+0x1bf4
            .balign      4
.Lfunc039:  movi         a5, 1 /* 0x00000001 */                # 1bf4: 0c15
            movi         a8, 3 /* 0x00000003 */                # 1bf6: 0c38
            beqz         a3, .Lbr215                           # 1bf8: 8c33
            l32i         a3, a2, 20 /* [arg0+0x14] */          # 1bfa: 3852
            beqi         a3, 3, .Lbr216                        # 1bfc: 263313
.Lbr215:    movi         a6, 244 /* 0x000000f4 */              # 1bff: 62a0f4
            add          a6, a2, a6 /* arg0+0xf4 */            # 1c02: 6a62
            l8ui         a4, a6, 128 /* [arg0+0x174] */        # 1c04: 420680
            movi         a7, 254 /* 0x000000fe */              # 1c07: 72a0fe
            and          a4, a4, a7                            # 1c0a: 704410
            or           a4, a4, a5                            # 1c0d: 504420
            s8i          a4, a6, 128 /* a4 -> [arg0+0x174] */  # 1c10: 424680
.Lbr216:    l32i         a7, a2, 72 /* [arg0+0x48] */          # 1c13: 722212
            s32i         a8, a2, 20 /* 0x00000003 -> [arg0+0x14] */ # 1c16: 8952
            beqz         a7, .Lbr217                           # 1c18: 8c67
            l32i         a10, a2, 4 /* [arg0+0x4] */           # 1c1a: a812
            l32i         a9, a10, 12 /* [[arg0+0x4]+0xc] */    # 1c1c: 983a
            addi         a9, a9, -1 /* [[arg0+0x4]+0xc]-0x1 */ # 1c1e: 0b99
            s32i         a9, a10, 12 /* [[arg0+0x4]+0xc]-0x1 -> [[arg0+0x4]+0xc] */ # 1c20: 993a
.Lbr217:    s32i         a5, a2, 40 /* 0x00000001 -> [arg0+0x28] */ # 1c22: 59a2
            movi         a10, 0 /* 0x00000000 */               # 1c24: 0c0a
            s32i         a10, a2, 72 /* 0x00000000 -> [arg0+0x48] */ # 1c26: a26212
            ret           /* arg0 */                           # 1c29: 0df0

            .balign      4
# Function @ .irom0.text+0x1c2c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc040:  addi         sp, sp, -16 /* (local0) */            # 1c2c: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 1c2f: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1c31: 0901
            l32i         a0, a2, 24 /* [arg0+0x18] */          # 1c33: 0862
            mov          a12, a2 /* arg0 */                    # 1c35: cd02
            bnez         a0, .Lbr218                           # 1c37: dcd0
            l32i         a2, a2, 0x168 /* [arg0+0x168] */      # 1c39: 22225a
            bnez         a2, .Lbr218                           # 1c3c: dc82
            l32i         a0, a12, 20 /* [arg0+0x14] */         # 1c3e: 085c
            beqz         a0, .Lbr220                           # 1c40: ac90
            beqi         a0, 1, .Lbr222                        # 1c42: 261042
            addi         a3, a0, -2 /* [arg0+0x14]-0x2 */      # 1c45: 32c0fe
            beqz         a3, .Lbr225                           # 1c48: 166307
            bnei         a0, 3, .Lbr219                        # 1c4b: 663015
            mov          a2, a12 /* arg0 */                    # 1c4e: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 1c50: 0c03
            call0        .Lfunc036                             # 1c52: 45e0ff
            j            .Lbr219                               # 1c55: c60200
.Lbr218:    mov          a2, a12 /* arg0 */                    # 1c58: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 1c5a: 0c03
            call0        .Lfunc036                             # 1c5c: 85dfff
            movi         a4, 0 /* 0x00000000 */                # 1c5f: 0c04
            s32i         a4, a12, 0x168 /* 0x00000000 -> [arg0+0x168] */ # 1c61: 426c5a
.Lbr219:    l32i         a12, sp, 4 /* [(local1)] */           # 1c64: c811
            l32i         a0, sp, 0 /* [(local0)] */            # 1c66: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1c68: 12c110
            ret                                                # 1c6b: 0df0
.Lbr220:    l32i         a5, a12, 72 /* [arg0+0x48] */         # 1c6d: 522c12
            bnez         a5, .Lbr221                           # 1c70: cca5
            l32i         a6, a12, 0x18c /* [arg0+0x18c] */     # 1c72: 622c63
            bnei         a6, 1, .Lbr219                        # 1c75: 6616eb
            l32i         a7, a12, 0x15c /* [arg0+0x15c] */     # 1c78: 722c57
            beqz         a7, .Lbr219                           # 1c7b: 1657fe
.Lbr221:    mov          a2, a12 /* arg0 */                    # 1c7e: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 1c80: 0c03
            call0        .Lfunc037                             # 1c82: 05e2ff
            j            .Lbr219                               # 1c85: c6f6ff
.Lbr222:    l32i         a8, a12, 56 /* [arg0+0x38] */         # 1c88: 88ec
            l32i         a0, a12, 48 /* [arg0+0x30] */         # 1c8a: 08cc
            beqz         a8, .Lbr223                           # 1c8c: 9c68
            l32i         a9, a12, 64 /* [arg0+0x40] */         # 1c8e: 922c10
            bnez         a9, .Lbr223                           # 1c91: dc19
            l32i         a10, a12, 60 /* [arg0+0x3c] */        # 1c93: a8fc
            bnez         a10, .Lbr223                          # 1c95: ccda
            l32i         a11, a12, 68 /* [arg0+0x44] */        # 1c97: b22c11
            beqz         a11, .Lbr223                          # 1c9a: 8c8b
            mov          a2, a12 /* arg0 */                    # 1c9c: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 1c9e: 0c03
            call0        .Lfunc038                             # 1ca0: 45f1ff
            j            .Lbr219                               # 1ca3: 46efff
.Lbr223:    blti         a0, 5, .Lbr224                        # 1ca6: a65009
            mov          a2, a12 /* arg0 */                    # 1ca9: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 1cab: 0c03
            call0        .Lfunc039                             # 1cad: 45f4ff
            j            .Lbr219                               # 1cb0: 06ecff
.Lbr224:    l32i         a2, a12, 52 /* [arg0+0x34] */         # 1cb3: 28dc
            beqz         a2, .Lbr219                           # 1cb5: 16b2fa
            mov          a2, a12 /* arg0 */                    # 1cb8: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 1cba: 0c03
            call0        .Lfunc037                             # 1cbc: 45deff
            j            .Lbr219                               # 1cbf: 46e8ff
.Lbr225:    mov          a2, a12 /* arg0 */                    # 1cc2: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 1cc4: 0c03
            call0        .Lfunc036                             # 1cc6: 05d9ff
            j            .Lbr219                               # 1cc9: c6e5ff

            .literal_position                                  # 1ccc: 28000000
                                                               # 1cd0: 00000000
                                                               # 1cd4: 00000000

# Function @ .irom0.text+0x1cd8
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
.Lfunc041:  movi         a4, 32 /* 0x00000020 */               # 1cd8: 2c04
            addi         sp, sp, -32 /* (local0) */            # 1cda: 12c1e0
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     # 1cdd: 0931
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   # 1cdf: c941
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    # 1ce1: 2901
            mov          a12, a3 /* arg1 */                    # 1ce3: cd03
            movi         a2, 168 /* 0x000000a8 */              # 1ce5: 22a0a8
            add          a2, a3, a2 /* arg1+0xa8 */            # 1ce8: 2a23
            s32i         a2, sp, 4 /* arg1+0xa8 -> [(local1)] */ # 1cea: 2911
            addi         a3, a3, 36 /* arg1+0x24 */            # 1cec: 32c324
            s32i         a3, sp, 8 /* arg1+0x24 -> [(local2)] */ # 1cef: 3921
            call0        memcpy                                # 1cf1: 01f7ffc0
                                                               # 1cf5: 0000
            l32i         a2, sp, 8 /* [(local2)] */            # 1cf7: 2821
            movi         a3, 32 /* 0x00000020 */               # 1cf9: 2c03
            call0        sdk_inc_byte_array                    # 1cfb: 01f6ffc0
                                                               # 1cff: 0000
            l32i         a5, sp, 4 /* [(local1)] */            # 1d01: 5811
            addi         a2, a12, 72 /* arg1+0x48 */           # 1d03: 22cc48
            l32i         a7, a12, 20 /* [arg1+0x14] */         # 1d06: 785c
            movi         a3, .Lstr003                          # 1d08: 31f1ff
            l32i         a4, sp, 0 /* [(local0)] */            # 1d0b: 4801
            l32i         a6, a12, 24 /* [arg1+0x18] */         # 1d0d: 686c
            addi         a4, a4, 88 /* [(local0)]+0x58 */      # 1d0f: 42c458
            slli         a6, a6, 5                             # 1d12: b06611
            add          a6, a12, a6                           # 1d15: 6a6c
            addi         a6, a6, 72                            # 1d17: 62c648
            call0        .Lfunc014                             # 1d1a: 85ccfe
            l32i         a5, sp, 12 /* [(local3)] */           # 1d1d: 5831
            l32i         a12, sp, 16 /* [(local4)] */          # 1d1f: c841
            movi         a6, -1 /* 0xffffffff */               # 1d21: 7cf6
            movi         a0, 0 /* 0x00000000 */                # 1d23: 0c00
            movltz       a0, a6, a2                            # 1d25: 2006a3
            addi         sp, sp, 32 /* (top of frame) */       # 1d28: 12c120
            mov          a2, a0                                # 1d2b: 2d00
            mov          a0, a5 /* [(local3)] */               # 1d2d: 0d05
            ret                                                # 1d2f: 0df0

            .literal_position                                  # 1d34: 00000000

# Function @ .irom0.text+0x1d38
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc042:  movi         a4, 64 /* 0x00000040 */               # 1d38: 4c04
            addi         sp, sp, -16 /* (local0) */            # 1d3a: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 1d3d: 0911
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 1d3f: c921
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    # 1d41: 2901
            mov          a12, a3 /* arg1 */                    # 1d43: cd03
            addi         a2, a12, 104 /* arg1+0x68 */          # 1d45: 22cc68
            movi         a3, 0 /* 0x00000000 */                # 1d48: 0c03
            s32i         a3, a12, 200 /* 0x00000000 -> [arg1+0xc8] */ # 1d4a: 326c32
            s32i         a3, a12, 68 /* 0x00000000 -> [arg1+0x44] */ # 1d4d: 326c11
            call0        memset                                # 1d50: 01f9ffc0
                                                               # 1d54: 0000
            mov          a3, a12 /* arg1 */                    # 1d56: 3d0c
            movi         a0, 2 /* 0x00000002 */                # 1d58: 0c20
            movi         a2, 1 /* 0x00000001 */                # 1d5a: 0c12
            s32i         a2, a12, 24 /* 0x00000001 -> [arg1+0x18] */ # 1d5c: 296c
            s32i         a0, a12, 28 /* 0x00000002 -> [arg1+0x1c] */ # 1d5e: 097c
            l32i         a2, sp, 0 /* [(local0)] */            # 1d60: 2801
            call0        .Lfunc041                             # 1d62: 45f7ff
            l32i         a12, sp, 8 /* [(local2)] */           # 1d65: c821
            l32i         a0, sp, 4 /* [(local1)] */            # 1d67: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 1d69: 12c110
            ret                                                # 1d6c: 0df0

            .balign      4
# Function @ .irom0.text+0x1d70
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc043:  addi         sp, sp, -16 /* (local0) */            # 1d70: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1d73: 0901
            beqz         a3, .Lbr226                           # 1d75: 8c33
            l32i         a0, a2, 4 /* [arg0+0x4] */            # 1d77: 0812
            bne          a0, a3, .Lbr228                       # 1d79: 379029
.Lbr226:    l32i         a3, a2, 16 /* [arg0+0x10] */          # 1d7c: 3842
            movi         a4, 11 /* 0x0000000b */               # 1d7e: 0cb4
            beq          a3, a4, .Lbr227                       # 1d80: 471307
            movi         a0, 0 /* 0x00000000 */                # 1d83: 0c00
            s32i         a0, a2, 72 /* 0x00000000 -> [arg0+0x48] */ # 1d85: 026212
            j            .Lbr229                               # 1d88: 060700
.Lbr227:    addmi        a5, a2, 256 /* arg0+0x100 */          # 1d8b: 52d201
            l8ui         a5, a5, 116 /* [arg0+0x174] */        # 1d8e: 520574
            srli         a5, a5, 7                             # 1d91: 505741
            bnez         a5, .Lbr228                           # 1d94: cce5
            l32i         a8, a2, 4 /* [arg0+0x4] */            # 1d96: 8812
            l32i         a7, a8, 12 /* [[arg0+0x4]+0xc] */     # 1d98: 7838
            movi         a6, 1 /* 0x00000001 */                # 1d9a: 0c16
            addi         a7, a7, 1 /* [[arg0+0x4]+0xc]+0x1 */  # 1d9c: 1b77
            s32i         a7, a8, 12 /* [[arg0+0x4]+0xc]+0x1 -> [[arg0+0x4]+0xc] */ # 1d9e: 7938
            s32i         a6, a2, 72 /* 0x00000001 -> [arg0+0x48] */ # 1da0: 626212
            call0        .Lfunc048                             # 1da3: 451100
.Lbr228:    movi         a0, 0 /* 0x00000000 */                # 1da6: 0c00
.Lbr229:    mov          a2, a0 /* 0x00000000 */               # 1da8: 2d00
            l32i         a0, sp, 0 /* [(local0)] */            # 1daa: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1dac: 12c110
            ret           /* 0x00000000 */                     # 1daf: 0df0

            .literal_position                                  # 1db4: 701d0000

# Function @ .irom0.text+0x1db8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc044:  movi         a4, 1 /* 0x00000001 */                # 1db8: 0c14
            addi         sp, sp, -16 /* (local0) */            # 1dba: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 1dbd: d921
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1dbf: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 1dc1: c911
            movi         a0, 0 /* 0x00000000 */                # 1dc3: 0c00
            mov          a12, a3 /* arg1 */                    # 1dc5: cd03
            s32i         a4, a3, 200 /* 0x00000001 -> [arg1+0xc8] */ # 1dc7: 426332
            mov          a13, a2 /* arg0 */                    # 1dca: dd02
            s32i         a4, a3, 68 /* 0x00000001 -> [arg1+0x44] */ # 1dcc: 426311
            l32i         a2, a3, 28 /* [arg1+0x1c] */          # 1dcf: 2873
            l32i         a3, a3, 24 /* [arg1+0x18] */          # 1dd1: 3863
            s32i         a2, a12, 24 /* [arg1+0x1c] -> [arg1+0x18] */ # 1dd3: 296c
            s32i         a3, a12, 28 /* [arg1+0x18] -> [arg1+0x1c] */ # 1dd5: 397c
            mov          a2, a13 /* arg0 */                    # 1dd7: 2d0d
            mov          a3, a12 /* arg1 */                    # 1dd9: 3d0c
            s32i         a0, a12, 16 /* 0x00000000 -> [arg1+0x10] */ # 1ddb: 094c
            call0        .Lfunc041                             # 1ddd: 85efff
            l32i         a5, a12, 12 /* [arg1+0xc] */          # 1de0: 583c
            movi         a6, 0 /* 0x00000000 */                # 1de2: 0c06
            beqz         a5, .Lbr230                           # 1de4: 8c05
            s32i         a6, a12, 12 /* 0x00000000 -> [arg1+0xc] */ # 1de6: 693c
.Lbr230:    mov          a4, a12 /* arg1 */                    # 1de8: 4d0c
            mov          a2, a13 /* arg0 */                    # 1dea: 2d0d
            movi         a3, .Lfunc043                         # 1dec: 31f2ff
            call0        sdk_wpa_auth_for_each_sta             # 1def: 050000
            l32i         a12, sp, 4 /* [(local1)] */           # 1df2: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 1df4: d821
            l32i         a0, sp, 0 /* [(local0)] */            # 1df6: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1df8: 12c110
            ret                                                # 1dfb: 0df0

            .literal_position                                  # 1e00: 3c000000
                                                               # 1e04: 00000000

# Function @ .irom0.text+0x1e08
# Local variables/stack:
#     (local0):  word[4]   @ -0x20
#     (local1):  word      @ -0x10
#     (local2):  word      @ -0xc
#     (local3):  word[2]   @ -0x8
            .balign      4
.Lfunc045:  addi         sp, sp, -32 /* (local0) */            # 1e08: 12c1e0
            s32i         a3, sp, 16 /* arg1 -> [(local1)] */   # 1e0b: 3941
            s32i         a12, sp, 24 /* a12 -> [(local3)] */   # 1e0d: c961
            s32i         a0, sp, 20 /* a0 -> [(local2)] */     # 1e0f: 0951
            mov          a12, a2 /* arg0 */                    # 1e11: cd02
            l32i         a2, a2, 16 /* [arg0+0x10] */          # 1e13: 2842
            call0        sdk_wpa_cipher_to_alg                 # 1e15: 01fbffc0
                                                               # 1e19: 0000
            movi         a5, .Label001                         # 1e1b: 51f9ff
            mov          a4, a2                                # 1e1e: 4d02
            l32i         a7, sp, 16 /* [(local1)] */           # 1e20: 7841
            mov          a2, a12 /* arg0 */                    # 1e22: 2d0c
            l32i         a3, a7, 4 /* [[(local1)]+0x4] */      # 1e24: 3817
            l32i         a6, a7, 24 /* [[(local1)]+0x18] */    # 1e26: 6867
            l32i         a9, a7, 20 /* [[(local1)]+0x14] */    # 1e28: 9857
            slli         a8, a6, 5                             # 1e2a: b08611
            s32i         a9, sp, 0 /* [[(local1)]+0x14] -> [(local0)] */ # 1e2d: 9901
            add          a7, a7, a8                            # 1e2f: 8a77
            addi         a7, a7, 72                            # 1e31: 72c748
            call0        .Lfunc002                             # 1e34: 4520fe
            l32i         a10, sp, 20 /* [(local2)] */          # 1e37: a851
            l32i         a12, sp, 24 /* [(local3)] */          # 1e39: c861
            movi         a11, -1 /* 0xffffffff */              # 1e3b: 7cfb
            movi         a0, 0 /* 0x00000000 */                # 1e3d: 0c00
            movltz       a0, a11, a2                           # 1e3f: 200ba3
            addi         sp, sp, 32 /* (top of frame) */       # 1e42: 12c120
            mov          a2, a0                                # 1e45: 2d00
            mov          a0, a10 /* [(local2)] */              # 1e47: 0d0a
            ret                                                # 1e49: 0df0

            .balign      4
# Function @ .irom0.text+0x1e4c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc046:  movi         a4, 1 /* 0x00000001 */                # 1e4c: 0c14
            addi         sp, sp, -16 /* (local0) */            # 1e4e: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1e51: 0901
            s32i         a4, a3, 200 /* 0x00000001 -> [arg1+0xc8] */ # 1e53: 426332
            movi         a0, 2 /* 0x00000002 */                # 1e56: 0c20
            s32i         a0, a3, 68 /* 0x00000002 -> [arg1+0x44] */ # 1e58: 026311
            call0        .Lfunc045                             # 1e5b: c5faff
            movi         a6, 0 /* 0x00000000 */                # 1e5e: 0c06
            l32i         a5, sp, 0 /* [(local0)] */            # 1e60: 5801
            movi         a0, -1 /* 0xffffffff */               # 1e62: 7cf0
            addi         sp, sp, 16 /* (top of frame) */       # 1e64: 12c110
            movgez       a0, a6, a2                            # 1e67: 2006b3
            mov          a2, a0                                # 1e6a: 2d00
            mov          a0, a5 /* [(local0)] */               # 1e6c: 0d05
            ret                                                # 1e6e: 0df0

# Function @ .irom0.text+0x1e70
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc047:  addi         sp, sp, -16 /* (local0) */            # 1e70: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1e73: 0901
            l32i         a0, a3, 8 /* [arg1+0x8] */            # 1e75: 0823
            beqz         a0, .Lbr232                           # 1e77: 8c80
            call0        .Lfunc042                             # 1e79: c5ebff
.Lbr231:    l32i         a0, sp, 0 /* [(local0)] */            # 1e7c: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1e7e: 12c110
            ret                                                # 1e81: 0df0
.Lbr232:    l32i         a0, a3, 68 /* [arg1+0x44] */          # 1e83: 022311
            bnez         a0, .Lbr233                           # 1e86: cc80
            l32i         a4, a3, 32 /* [arg1+0x20] */          # 1e88: 4883
            beqz         a4, .Lbr233                           # 1e8a: 8c44
            call0        .Lfunc046                             # 1e8c: c5fbff
            j            .Lbr231                               # 1e8f: 46faff
.Lbr233:    bnei         a0, 2, .Lbr234                        # 1e92: 662009
            l32i         a5, a3, 16 /* [arg1+0x10] */          # 1e95: 5843
            beqz         a5, .Lbr234                           # 1e97: 8c45
            call0        .Lfunc044                             # 1e99: c5f1ff
            j            .Lbr231                               # 1e9c: 06f7ff
.Lbr234:    bnei         a0, 1, .Lbr231                        # 1e9f: 6610d9
            l32i         a6, a3, 12 /* [arg1+0xc] */           # 1ea2: 6833
            l32i         a7, a3, 16 /* [arg1+0x10] */          # 1ea4: 7843
            bnez         a6, .Lbr235                           # 1ea6: cc46
            call0        .Lfunc046                             # 1ea8: 05faff
            j            .Lbr231                               # 1eab: 46f3ff
.Lbr235:    beqz         a7, .Lbr231                           # 1eae: 16a7fc
            call0        .Lfunc044                             # 1eb1: 45f0ff
            j            .Lbr231                               # 1eb4: 06f1ff

            .balign      4
# Function @ .irom0.text+0x1eb8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc048:  addi         sp, sp, -16 /* (local0) */            # 1eb8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1ebb: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 1ebd: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 1ebf: d921
            mov          a12, a2 /* arg0 */                    # 1ec1: cd02
            beqz         a2, .Lbr240                           # 1ec3: 16b207
            movi         a13, 244 /* 0x000000f4 */             # 1ec6: d2a0f4
            add          a13, a2, a13 /* arg0+0xf4 */          # 1ec9: dad2
            l8ui         a0, a13, 128 /* [arg0+0x174] */       # 1ecb: 020d80
            movi         a2, 2 /* 0x00000002 */                # 1ece: 0c22
            bbsi         a0, 1, .Lbr240                        # 1ed0: 17e06e
            movi         a3, 253 /* 0x000000fd */              # 1ed3: 32a0fd
            and          a0, a0, a3                            # 1ed6: 300010
            or           a0, a0, a2                            # 1ed9: 200020
            s8i          a0, a13, 128 /* a0 -> [arg0+0x174] */ # 1edc: 024d80
.Lbr236:    bbsi         a0, 2, .Lbr237                        # 1edf: 27e027
            movi         a8, 254 /* 0x000000fe */              # 1ee2: 82a0fe
            and          a8, a0, a8                            # 1ee5: 808010
            s8i          a8, a13, 128 /* a8 -> [arg0+0x174] */ # 1ee8: 824d80
            l32i         a7, a12, 0 /* [arg0] */               # 1eeb: 780c
            mov          a2, a12 /* arg0 */                    # 1eed: 2d0c
            l32i         a7, a7, 0 /* [[arg0]] */              # 1eef: 7807
            movi         a6, 0 /* 0x00000000 */                # 1ef1: 0c06
            s32i         a6, a7, 200 /* 0x00000000 -> [[[arg0]]+0xc8] */ # 1ef3: 626732
            call0        .Lfunc034                             # 1ef6: 4599ff
            l8ui         a0, a13, 128 /* [arg0+0x174] */       # 1ef9: 020d80
            bbsi         a0, 2, .Lbr237                        # 1efc: 27e00a
            mov          a2, a12 /* arg0 */                    # 1eff: 2d0c
            call0        .Lfunc040                             # 1f01: 85d2ff
            l8ui         a0, a13, 128 /* [arg0+0x174] */       # 1f04: 020d80
            bbci         a0, 2, .Lbr239                        # 1f07: 27601d
.Lbr237:    movi         a9, 253 /* 0x000000fd */              # 1f0a: 92a0fd
            and          a9, a0, a9                            # 1f0d: 909010
            s8i          a9, a13, 128 /* a9 -> [arg0+0x174] */ # 1f10: 924d80
            bbci         a9, 2, .Lbr240                        # 1f13: 27692b
            mov          a2, a12 /* arg0 */                    # 1f16: 2d0c
            call0        .Lfunc009                             # 1f18: 8556fe
            movi         a2, 1 /* 0x00000001 */                # 1f1b: 0c12
.Lbr238:    l32i         a12, sp, 4 /* [(local1)] */           # 1f1d: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 1f1f: d821
            l32i         a0, sp, 0 /* [(local0)] */            # 1f21: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1f23: 12c110
            ret                                                # 1f26: 0df0
.Lbr239:    l32i         a2, a12, 0 /* [arg0] */               # 1f28: 280c
            l32i         a3, a12, 4 /* [arg0+0x4] */           # 1f2a: 381c
            call0        .Lfunc047                             # 1f2c: 05f4ff
            l8ui         a0, a13, 128 /* [arg0+0x174] */       # 1f2f: 020d80
            bbsi         a0, 0, .Lbr236                        # 1f32: 07e0a9
            l32i         a10, a12, 0 /* [arg0] */              # 1f35: a80c
            l32i         a10, a10, 0 /* [[arg0]] */            # 1f37: a80a
            l32i         a10, a10, 200 /* [[[arg0]]+0xc8] */   # 1f39: a22a32
            bnez         a10, .Lbr236                          # 1f3c: 56faf9
            j            .Lbr237                               # 1f3f: c6f1ff
.Lbr240:    movi         a2, 0 /* 0x00000000 */                # 1f42: 0c02
            j            .Lbr238                               # 1f44: 46f5ff

            .section     .rodata, "a", @progbits

            .word        0x00000064                            #    0: 64000000
            .word        0x000001f4                            #    4: f4010000
            .word        0x000003e8                            #    8: e8030000
            .byte        0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "Init Counter"                        #    0: 496e6974
                                                               #    4: 20436f75
                                                               #    8: 6e746572
                                                               #    c: 00
            .balign      4
.Lstr002:   .asciz       "Pairwise key expansion"              #   10: 50616972
                                                               #   14: 77697365
                                                               #   18: 206b6579
                                                               #   1c: 20657870
                                                               #   20: 616e7369
                                                               #   24: 6f6e00
            .balign      4
.Lstr003:   .asciz       "Group key expansion"                 #   28: 47726f75
                                                               #   2c: 70206b65
                                                               #   30: 79206578
                                                               #   34: 70616e73
                                                               #   38: 696f6e00
.Label001:  .byte        0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00

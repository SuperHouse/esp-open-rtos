
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000

# Function @ .irom0.text+0x8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_wpa_parse_wpa_ie
            .type        sdk_wpa_parse_wpa_ie, @function
sdk_wpa_parse_wpa_ie:
            addi         sp, sp, -16 /* (local0) */            #    8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #    b: 0901
            beqz         a3, .Lbr001                           #    d: 8cf3
            l8ui         a0, a2, 0 /* [arg0] */                #    f: 020200
            movi         a5, 48 /* 0x00000030 */               #   12: 3c05
            bne          a0, a5, .Lbr001                       #   14: 579008
            call0        sdk_wpa_parse_wpa_ie_rsn              #   17: 01faffc0
                                                               #   1b: 0000
            j            .Lbr002                               #   1d: 460100
.Lbr001:    call0        sdk_wpa_parse_wpa_ie_wpa              #   20: 01f9ffc0
                                                               #   24: 0000
.Lbr002:    l32i         a0, sp, 0 /* [(local0)] */            #   26: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   28: 12c110
            ret                                                #   2b: 0df0

            .literal_position                                  #   30: 01f25000
                                                               #   34: 04ac0f00
                                                               #   38: 01ac0f00
                                                               #   3c: 03ac0f00

# Function @ .irom0.text+0x40
.Lfunc001:  l8ui         a7, a2, 1 /* [arg0+0x1] */            #   40: 720201
            l8ui         a5, a2, 5 /* [arg0+0x5] */            #   43: 520205
            bnez         a7, .Lbr003                           #   46: cc27
            movi         a2, 1 /* 0x00000001 */                #   48: 0c12
            ret           /* 0x00000001 */                     #   4a: 0df0
.Lbr003:    bltui        a7, 6, .Lbr004                        #   4c: b66737
            l8ui         a8, a2, 2 /* [arg0+0x2] */            #   4f: 820202
            l8ui         a9, a2, 3 /* [arg0+0x3] */            #   52: 920203
            l8ui         a6, a2, 4 /* [arg0+0x4] */            #   55: 620204
            slli         a9, a9, 16                            #   58: 009911
            slli         a6, a6, 8                             #   5b: 806611
            slli         a8, a8, 24                            #   5e: 808801
            or           a5, a5, a6                            #   61: 605520
            movi         a6, 0x0050f201                        #   64: 61f3ff
            or           a8, a8, a9                            #   67: 908820
            or           a5, a5, a8                            #   6a: 805520
            bne          a5, a6, .Lbr004                       #   6d: 679516
            l8ui         a8, a2, 6 /* [arg0+0x6] */            #   70: 820206
            bnei         a8, 1, .Lbr004                        #   73: 661810
            l8ui         a9, a2, 7 /* [arg0+0x7] */            #   76: 920207
            bnez         a9, .Lbr004                           #   79: cca9
            s32i         a2, a4, 0 /* arg0 -> [arg2] */        #   7b: 2904
            l8ui         a10, a2, 1 /* [arg0+0x1] */           #   7d: a20201
            addi         a10, a10, 2 /* [arg0+0x1]+0x2 */      #   80: 2baa
            s32i         a10, a4, 4 /* [arg0+0x1]+0x2 -> [arg2+0x4] */ #   82: a914
            j            .Lbr007                               #   84: c61f00
.Lbr004:    addi         a11, a2, 5 /* arg0+0x5 */             #   87: 5bb2
            bgeu         a11, a3, .Lbr005                      #   89: 37bb2f
            movi         a3, 19 /* 0x00000013 */               #   8c: 1c33
            bgeu         a3, a7, .Lbr005                       #   8e: 77b32a
            l8ui         a5, a2, 5 /* [arg0+0x5] */            #   91: 520205
            l8ui         a8, a2, 2 /* [arg0+0x2] */            #   94: 820202
            l8ui         a9, a2, 3 /* [arg0+0x3] */            #   97: 920203
            l8ui         a6, a2, 4 /* [arg0+0x4] */            #   9a: 620204
            slli         a9, a9, 16                            #   9d: 009911
            slli         a6, a6, 8                             #   a0: 806611
            slli         a8, a8, 24                            #   a3: 808801
            or           a5, a5, a6                            #   a6: 605520
            movi         a6, 0x000fac04                        #   a9: 61e2ff
            or           a8, a8, a9                            #   ac: 908820
            or           a5, a5, a8                            #   af: 805520
            bne          a5, a6, .Lbr005                       #   b2: 679506
            addi         a7, a2, 6 /* arg0+0x6 */              #   b5: 6b72
            s32i         a7, a4, 16 /* arg0+0x6 -> [arg2+0x10] */ #   b7: 7944
            j            .Lbr007                               #   b9: 861200
.Lbr005:    bltui        a7, 7, .Lbr007                        #   bc: b67747
            movi         a8, 0x000fac01                        #   bf: 81deff
            l8ui         a6, a2, 3 /* [arg0+0x3] */            #   c2: 620203
            l8ui         a5, a2, 4 /* [arg0+0x4] */            #   c5: 520204
            l8ui         a3, a2, 5 /* [arg0+0x5] */            #   c8: 320205
            slli         a5, a5, 8                             #   cb: 805511
            or           a3, a3, a5                            #   ce: 503320
            l8ui         a5, a2, 2 /* [arg0+0x2] */            #   d1: 520202
            slli         a6, a6, 16                            #   d4: 006611
            slli         a5, a5, 24                            #   d7: 805501
            or           a5, a5, a6                            #   da: 605520
            or           a3, a3, a5                            #   dd: 503320
            bne          a3, a8, .Lbr006                       #   e0: 87930e
            addi         a7, a2, 6 /* arg0+0x6 */              #   e3: 6b72
            s32i         a7, a4, 20 /* arg0+0x6 -> [arg2+0x14] */ #   e5: 7954
            l8ui         a6, a2, 1 /* [arg0+0x1] */            #   e7: 620201
            addi         a6, a6, -4 /* [arg0+0x1]-0x4 */       #   ea: 62c6fc
            s32i         a6, a4, 24 /* [arg0+0x1]-0x4 -> [arg2+0x18] */ #   ed: 6964
            j            .Lbr007                               #   ef: 060500
.Lbr006:    bltui        a7, 7, .Lbr007                        #   f2: b67711
            movi         a8, 0x000fac03                        #   f5: 81d1ff
            bne          a3, a8, .Lbr007                       #   f8: 87930b
            addi         a10, a2, 6 /* arg0+0x6 */             #   fb: 6ba2
            s32i         a10, a4, 28 /* arg0+0x6 -> [arg2+0x1c] */ #   fd: a974
            l8ui         a9, a2, 1 /* [arg0+0x1] */            #   ff: 920201
            addi         a9, a9, -4 /* [arg0+0x1]-0x4 */       #  102: 92c9fc
            s32i         a9, a4, 32 /* [arg0+0x1]-0x4 -> [arg2+0x20] */ #  105: 9984
.Lbr007:    movi         a2, 0 /* 0x00000000 */                #  107: 0c02
            ret           /* 0x00000000 */                     #  109: 0df0

            .literal_position                                  #  10c: 00000000

# Function @ .irom0.text+0x110
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .global      sdk_wpa_supplicant_parse_ies
            .type        sdk_wpa_supplicant_parse_ies, @function
sdk_wpa_supplicant_parse_ies:
            addi         sp, sp, -32 /* (local0) */            #  110: 12c1e0
            s32i         a15, sp, 24 /* a15 -> [(local6)] */   #  113: f961
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  115: 0921
            s32i         a14, sp, 20 /* a14 -> [(local5)] */   #  117: e951
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   #  119: d941
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  11b: c931
            mov          a13, a4 /* arg2 */                    #  11d: dd04
            mov          a12, a2 /* arg0 */                    #  11f: cd02
            mov          a14, a3 /* arg1 */                    #  121: ed03
            mov          a2, a4 /* arg2 */                     #  123: 2d04
            movi         a3, 0 /* 0x00000000 */                #  125: 0c03
            movi         a4, 36 /* 0x00000024 */               #  127: 2c44
            call0        memset                                #  129: 01f8ffc0
                                                               #  12d: 0000
            s32i         a13, sp, 4 /* arg2 -> [(local1)] */   #  12f: d911
            blti         a14, 2, .Lbr015                       #  131: a62e70
            movi         a15, 48 /* 0x00000030 */              #  134: 3c0f
            movi         a2, 0 /* 0x00000000 */                #  136: 0c02
            add          a13, a12, a14                         #  138: eadc
            movi         a14, 221 /* 0x000000dd */             #  13a: e2a0dd
            addi         a0, a13, -1                           #  13d: 0b0d
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  13f: 0901
.Lbr008:    l8ui         a0, a12, 0                            #  141: 020c00
            l8ui         a3, a12, 1                            #  144: 320c01
            bne          a0, a14, .Lbr009                      #  147: e7900c
            l32i         a3, sp, 0 /* [(local0)] */            #  14a: 3801
            beq          a3, a12, .Lbr014                      #  14c: c71346
            l8ui         a3, a12, 1                            #  14f: 320c01
            bnez         a3, .Lbr009                           #  152: cc13
            j            .Lbr014                               #  154: 860f00
.Lbr009:    add          a3, a3, a12                           #  157: ca33
            addi         a3, a3, 2                             #  159: 2b33
            bltu         a13, a3, .Lbr013                      #  15b: 373d35
            bne          a0, a15, .Lbr012                      #  15e: f7901b
            l32i         a5, sp, 4 /* [(local1)] */            #  161: 5811
            s32i         a12, a5, 8 /* a12 -> [[(local1)]+0x8] */ #  163: c925
            l8ui         a4, a12, 1                            #  165: 420c01
            addi         a4, a4, 2                             #  168: 2b44
            s32i         a4, a5, 12 /* a4 -> [[(local1)]+0xc] */ #  16a: 4935
.Lbr010:    l8ui         a3, a12, 1                            #  16c: 320c01
            add          a3, a3, a12                           #  16f: ca33
            addi         a3, a3, 2                             #  171: 2b33
.Lbr011:    mov          a12, a3                               #  173: cd03
            addi         a4, a3, 1                             #  175: 1b43
            bltu         a4, a13, .Lbr008                      #  177: d734c6
            j            .Lbr014                               #  17a: 060600
.Lbr012:    bne          a0, a14, .Lbr011                      #  17d: e790f2
            mov          a2, a12                               #  180: 2d0c
            mov          a3, a13                               #  182: 3d0d
            l32i         a4, sp, 4 /* [(local1)] */            #  184: 4811
            call0        .Lfunc001                             #  186: 85ebff
            bltz         a2, .Lbr014                           #  189: 969200
            blti         a2, 1, .Lbr010                        #  18c: a612dc
            movi         a2, 0 /* 0x00000000 */                #  18f: 0c02
            j            .Lbr014                               #  191: 460000
.Lbr013:    movi         a2, -1 /* 0xffffffff */               #  194: 7cf2
.Lbr014:    l32i         a12, sp, 12 /* [(local3)] */          #  196: c831
            l32i         a13, sp, 16 /* [(local4)] */          #  198: d841
            l32i         a14, sp, 20 /* [(local5)] */          #  19a: e851
            l32i         a15, sp, 24 /* [(local6)] */          #  19c: f861
            l32i         a0, sp, 8 /* [(local2)] */            #  19e: 0821
            addi         sp, sp, 32 /* (top of frame) */       #  1a0: 12c120
            ret                                                #  1a3: 0df0
.Lbr015:    movi         a2, 0 /* 0x00000000 */                #  1a5: 0c02
            j            .Lbr014                               #  1a7: c6faff

            .balign      4
# Function @ .irom0.text+0x1ac
.Lfunc002:  movi         a7, 23 /* 0x00000017 */               #  1ac: 1c77
            bgeu         a7, a3, .Lbr023                       #  1ae: 37b774
            movi         a9, 4 /* 0x00000004 */                #  1b1: 0c49
            movi         a8, -35 /* 0xffffffdd */              #  1b3: 82afdd
            movi         a3, 1 /* 0x00000001 */                #  1b6: 0c13
            movi         a11, -14 /* 0xfffffff2 */             #  1b8: 7c2b
            movi         a10, 80 /* 0x00000050 */              #  1ba: 5c0a
            s8i          a10, a2, 3 /* 0x50 -> [arg0+0x3] */   #  1bc: a24203
            s8i          a11, a2, 4 /* 0xf2 -> [arg0+0x4] */   #  1bf: b24204
            s8i          a3, a2, 5 /* 0x01 -> [arg0+0x5] */    #  1c2: 324205
            s8i          a8, a2, 0 /* 0xdd -> [arg0] */        #  1c5: 824200
            s8i          a3, a2, 6 /* 0x01 -> [arg0+0x6] */    #  1c8: 324206
            movi         a8, 0 /* 0x00000000 */                #  1cb: 0c08
            s8i          a8, a2, 2 /* 0x00 -> [arg0+0x2] */    #  1cd: 824202
            s8i          a8, a2, 7 /* 0x00 -> [arg0+0x7] */    #  1d0: 824207
            bnei         a5, 8, .Lbr017                        #  1d3: 66850e
            s8i          a9, a2, 11 /* 0x04 -> [arg0+0xb] */   #  1d6: 92420b
.Lbr016:    s8i          a8, a2, 8 /* 0x00 -> [arg0+0x8] */    #  1d9: 824208
            s8i          a10, a2, 9 /* 0x50 -> [arg0+0x9] */   #  1dc: a24209
            s8i          a11, a2, 10 /* 0xf2 -> [arg0+0xa] */  #  1df: b2420a
            j            .Lbr020                               #  1e2: c60600
.Lbr017:    bnei         a5, 2, .Lbr018                        #  1e5: 662507
            movi         a5, 2 /* 0x00000002 */                #  1e8: 0c25
            s8i          a5, a2, 11 /* 0x02 -> [arg0+0xb] */   #  1ea: 52420b
            j            .Lbr016                               #  1ed: 06faff
.Lbr018:    bnei         a5, 0x100, .Lbr021                    #  1f0: 66f51e
            s8i          a8, a2, 8 /* 0x00 -> [arg0+0x8] */    #  1f3: 824208
            s8i          a10, a2, 9 /* 0x50 -> [arg0+0x9] */   #  1f6: a24209
            s8i          a11, a2, 10 /* 0xf2 -> [arg0+0xa] */  #  1f9: b2420a
            movi         a5, 5 /* 0x00000005 */                #  1fc: 0c55
.Lbr019:    s8i          a5, a2, 11 /* a5 -> [arg0+0xb] */     #  1fe: 52420b
.Lbr020:    s8i          a3, a2, 12 /* 0x01 -> [arg0+0xc] */   #  201: 32420c
            s8i          a8, a2, 13 /* 0x00 -> [arg0+0xd] */   #  204: 82420d
            beqi         a4, 8, .Lbr025                        #  207: 268424
            bnei         a4, 2, .Lbr024                        #  20a: 66241c
            movi         a9, 2 /* 0x00000002 */                #  20d: 0c29
            j            .Lbr025                               #  20f: 060700
.Lbr021:    bnei         a5, 128, .Lbr023                      #  212: 66e510
            s8i          a8, a2, 8 /* 0x00 -> [arg0+0x8] */    #  215: 824208
            s8i          a10, a2, 9 /* 0x50 -> [arg0+0x9] */   #  218: a24209
            s8i          a11, a2, 10 /* 0xf2 -> [arg0+0xa] */  #  21b: b2420a
            mov          a5, a3 /* 0x00000001 */               #  21e: 5d03
            j            .Lbr019                               #  220: 86f6ff
.Lbr022:    beqi         a6, 16, .Lbr026                       #  223: 26b625
.Lbr023:    movi         a2, -1 /* 0xffffffff */               #  226: 7cf2
            ret           /* 0xffffffff */                     #  228: 0df0
.Lbr024:    bnei         a4, 1, .Lbr023                        #  22a: 6614f8
            mov          a9, a8 /* 0x00000000 */               #  22d: 9d08
.Lbr025:    s8i          a9, a2, 17 /* a9 -> [arg0+0x11] */    #  22f: 924211
            s8i          a8, a2, 14 /* 0x00 -> [arg0+0xe] */   #  232: 82420e
            s8i          a10, a2, 15 /* 0x50 -> [arg0+0xf] */  #  235: a2420f
            s8i          a11, a2, 16 /* 0xf2 -> [arg0+0x10] */ #  238: b24210
            s8i          a3, a2, 18 /* 0x01 -> [arg0+0x12] */  #  23b: 324212
            s8i          a8, a2, 19 /* 0x00 -> [arg0+0x13] */  #  23e: 824213
            beqi         a6, 1, .Lbr027                        #  241: 261609
            bnei         a6, 2, .Lbr022                        #  244: 6626db
            movi         a3, 2 /* 0x00000002 */                #  247: 0c23
            j            .Lbr027                               #  249: 460000
.Lbr026:    mov          a3, a8 /* 0x00000000 */               #  24c: 3d08
.Lbr027:    s8i          a8, a2, 20 /* 0x00 -> [arg0+0x14] */  #  24e: 824214
            s8i          a10, a2, 21 /* 0x50 -> [arg0+0x15] */ #  251: a24215
            s8i          a11, a2, 22 /* 0xf2 -> [arg0+0x16] */ #  254: b24216
            movi         a6, 22 /* 0x00000016 */               #  257: 1c66
            s8i          a3, a2, 23 /* a3 -> [arg0+0x17] */    #  259: 324217
            s8i          a6, a2, 1 /* 0x16 -> [arg0+0x1] */    #  25c: 624201
            movi         a2, 24 /* 0x00000018 */               #  25f: 1c82
            ret           /* 0x00000018 */                     #  261: 0df0

            .balign      4
# Function @ .irom0.text+0x264
.Lfunc003:  movi         a7, 21 /* 0x00000015 */               #  264: 1c57
            bgeu         a7, a3, .Lbr035                       #  266: 37b771
            movi         a10, -84 /* 0xffffffac */             #  269: a2afac
            movi         a9, 4 /* 0x00000004 */                #  26c: 0c49
            movi         a3, 1 /* 0x00000001 */                #  26e: 0c13
            movi         a11, 48 /* 0x00000030 */              #  270: 3c0b
            movi         a8, 0 /* 0x00000000 */                #  272: 0c08
            s8i          a8, a2, 3 /* 0x00 -> [arg0+0x3] */    #  274: 824203
            s8i          a11, a2, 0 /* 0x30 -> [arg0] */       #  277: b24200
            s8i          a3, a2, 2 /* 0x01 -> [arg0+0x2] */    #  27a: 324202
            movi         a11, 15 /* 0x0000000f */              #  27d: 0cfb
            bnei         a5, 8, .Lbr029                        #  27f: 66850e
            s8i          a9, a2, 7 /* 0x04 -> [arg0+0x7] */    #  282: 924207
.Lbr028:    s8i          a8, a2, 4 /* 0x00 -> [arg0+0x4] */    #  285: 824204
            s8i          a11, a2, 5 /* 0x0f -> [arg0+0x5] */   #  288: b24205
            s8i          a10, a2, 6 /* 0xac -> [arg0+0x6] */   #  28b: a24206
            j            .Lbr032                               #  28e: c60600
.Lbr029:    bnei         a5, 2, .Lbr030                        #  291: 662507
            movi         a5, 2 /* 0x00000002 */                #  294: 0c25
            s8i          a5, a2, 7 /* 0x02 -> [arg0+0x7] */    #  296: 524207
            j            .Lbr028                               #  299: 06faff
.Lbr030:    bnei         a5, 0x100, .Lbr036                    #  29c: 66f53f
            s8i          a8, a2, 4 /* 0x00 -> [arg0+0x4] */    #  29f: 824204
            s8i          a11, a2, 5 /* 0x0f -> [arg0+0x5] */   #  2a2: b24205
            s8i          a10, a2, 6 /* 0xac -> [arg0+0x6] */   #  2a5: a24206
            movi         a5, 5 /* 0x00000005 */                #  2a8: 0c55
.Lbr031:    s8i          a5, a2, 7 /* a5 -> [arg0+0x7] */      #  2aa: 524207
.Lbr032:    s8i          a3, a2, 8 /* 0x01 -> [arg0+0x8] */    #  2ad: 324208
            s8i          a8, a2, 9 /* 0x00 -> [arg0+0x9] */    #  2b0: 824209
            beqi         a4, 8, .Lbr034                        #  2b3: 26840c
            bnei         a4, 2, .Lbr033                        #  2b6: 662404
            movi         a9, 2 /* 0x00000002 */                #  2b9: 0c29
            j            .Lbr034                               #  2bb: 060100
.Lbr033:    bnei         a4, 1, .Lbr035                        #  2be: 661419
            mov          a9, a8 /* 0x00000000 */               #  2c1: 9d08
.Lbr034:    s8i          a9, a2, 13 /* a9 -> [arg0+0xd] */     #  2c3: 92420d
            s8i          a8, a2, 10 /* 0x00 -> [arg0+0xa] */   #  2c6: 82420a
            s8i          a11, a2, 11 /* 0x0f -> [arg0+0xb] */  #  2c9: b2420b
            s8i          a10, a2, 12 /* 0xac -> [arg0+0xc] */  #  2cc: a2420c
            s8i          a3, a2, 14 /* 0x01 -> [arg0+0xe] */   #  2cf: 32420e
            s8i          a8, a2, 15 /* 0x00 -> [arg0+0xf] */   #  2d2: 82420f
            beqi         a6, 1, .Lbr038                        #  2d5: 261619
            beqi         a6, 2, .Lbr037                        #  2d8: 262614
.Lbr035:    movi         a2, -1 /* 0xffffffff */               #  2db: 7cf2
            ret           /* 0xffffffff */                     #  2dd: 0df0
.Lbr036:    bnei         a5, 128, .Lbr035                      #  2df: 66e5f8
            s8i          a8, a2, 4 /* 0x00 -> [arg0+0x4] */    #  2e2: 824204
            s8i          a11, a2, 5 /* 0x0f -> [arg0+0x5] */   #  2e5: b24205
            s8i          a10, a2, 6 /* 0xac -> [arg0+0x6] */   #  2e8: a24206
            mov          a5, a3 /* 0x00000001 */               #  2eb: 5d03
            j            .Lbr031                               #  2ed: 46eeff
.Lbr037:    movi         a3, 2 /* 0x00000002 */                #  2f0: 0c23
.Lbr038:    s8i          a11, a2, 17 /* 0x0f -> [arg0+0x11] */ #  2f2: b24211
            s8i          a10, a2, 18 /* 0xac -> [arg0+0x12] */ #  2f5: a24212
            s8i          a3, a2, 19 /* a3 -> [arg0+0x13] */    #  2f8: 324213
            s8i          a8, a2, 16 /* 0x00 -> [arg0+0x10] */  #  2fb: 824210
            s8i          a8, a2, 21 /* 0x00 -> [arg0+0x15] */  #  2fe: 824215
            movi         a6, 20 /* 0x00000014 */               #  301: 1c46
            s8i          a8, a2, 20 /* 0x00 -> [arg0+0x14] */  #  303: 824214
            s8i          a6, a2, 1 /* 0x14 -> [arg0+0x1] */    #  306: 624201
            movi         a2, 22 /* 0x00000016 */               #  309: 1c62
            ret           /* 0x00000016 */                     #  30b: 0df0

            .balign      4
# Function @ .irom0.text+0x310
# Local variables/stack:
#     (local0):  word[4]   @ -0x20
#     (local1):  word[4]   @ -0x10
            .global      sdk_wpa_gen_wpa_ie
            .type        sdk_wpa_gen_wpa_ie, @function
sdk_wpa_gen_wpa_ie:
            addi         sp, sp, -32 /* (local0) */            #  310: 12c1e0
            mov          a9, a3 /* arg1 */                     #  313: 9d03
            l32i         a5, a2, 0x118 /* [arg0+0x118] */      #  315: 522246
            l32i         a6, a2, 0x11c /* [arg0+0x11c] */      #  318: 622247
            mov          a3, a4 /* arg2 */                     #  31b: 3d04
            s32i         a0, sp, 16 /* a0 -> [(local1)] */     #  31d: 0941
            l32i         a0, a2, 0x164 /* [arg0+0x164] */      #  31f: 022259
            l32i         a4, a2, 0x114 /* [arg0+0x114] */      #  322: 422245
            bnei         a0, 2, .Lbr039                        #  325: 66200c
            l32i         a7, a2, 0x120 /* [arg0+0x120] */      #  328: 722248
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  32b: 2901
            mov          a2, a9 /* arg1 */                     #  32d: 2d09
            call0        .Lfunc003                             #  32f: 45f3ff
            j            .Lbr040                               #  332: 060100
.Lbr039:    mov          a2, a9 /* arg1 */                     #  335: 2d09
            call0        .Lfunc002                             #  337: 45e7ff
.Lbr040:    l32i         a0, sp, 16 /* [(local1)] */           #  33a: 0841
            addi         sp, sp, 32 /* (top of frame) */       #  33c: 12c120
            ret                                                #  33f: 0df0

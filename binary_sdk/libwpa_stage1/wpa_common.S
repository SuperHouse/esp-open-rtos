
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00ac0f00
                                                               #    4: 01ac0f00
                                                               #    8: 02ac0f00
                                                               #    c: 04ac0f00
                                                               #   10: 05ac0f00

# Function @ .irom0.text+0x14
            .balign      4
.Lfunc001:  movi         a3, 0x000fac00                        #   14: 31fbff
            l8ui         a7, a2, 1 /* [arg0+0x1] */            #   17: 720201
            l8ui         a6, a2, 2 /* [arg0+0x2] */            #   1a: 620202
            l8ui         a5, a2, 3 /* [arg0+0x3] */            #   1d: 520203
            slli         a6, a6, 8                             #   20: 806611
            or           a5, a5, a6                            #   23: 605520
            l8ui         a6, a2, 0 /* [arg0] */                #   26: 620200
            slli         a7, a7, 16                            #   29: 007711
            slli         a6, a6, 24                            #   2c: 806601
            or           a6, a6, a7                            #   2f: 706620
            or           a5, a5, a6                            #   32: 605520
            bne          a5, a3, .Lbr001                       #   35: 379503
            movi         a2, 1 /* 0x00000001 */                #   38: 0c12
            ret           /* 0x00000001 */                     #   3a: 0df0
.Lbr001:    movi         a7, 0x000fac01                        #   3c: 71f2ff
            movi         a8, 0x000fac02                        #   3f: 81f2ff
            bne          a5, a7, .Lbr002                       #   42: 779504
            movi         a2, 128 /* 0x00000080 */              #   45: 22a080
            ret           /* 0x00000080 */                     #   48: 0df0
.Lbr002:    bne          a5, a8, .Lbr003                       #   4a: 879503
            movi         a2, 2 /* 0x00000002 */                #   4d: 0c22
            ret           /* 0x00000002 */                     #   4f: 0df0
.Lbr003:    movi         a9, 0x000fac04                        #   51: 91eeff
            movi         a10, 0 /* 0x00000000 */               #   54: 0c0a
            beq          a5, a9, .Lbr004                       #   56: 97150d
            movi         a11, 0x000fac05                       #   59: b1edff
            movi         a2, 256 /* 0x00000100 */              #   5c: 22a100
            sub          a11, a5, a11                          #   5f: b0b5c0
            movnez       a2, a10, a11                          #   62: b02a93
            ret                                                #   65: 0df0
.Lbr004:    movi         a2, 8 /* 0x00000008 */                #   67: 0c82
            ret           /* 0x00000008 */                     #   69: 0df0

            .literal_position                                  #   6c: 01ac0f00
                                                               #   70: 02ac0f00

# Function @ .irom0.text+0x74
            .balign      4
.Lfunc002:  movi         a3, 0x000fac01                        #   74: 31feff
            l8ui         a7, a2, 1 /* [arg0+0x1] */            #   77: 720201
            l8ui         a6, a2, 2 /* [arg0+0x2] */            #   7a: 620202
            l8ui         a5, a2, 3 /* [arg0+0x3] */            #   7d: 520203
            slli         a6, a6, 8                             #   80: 806611
            or           a5, a5, a6                            #   83: 605520
            l8ui         a6, a2, 0 /* [arg0] */                #   86: 620200
            slli         a7, a7, 16                            #   89: 007711
            slli         a6, a6, 24                            #   8c: 806601
            or           a6, a6, a7                            #   8f: 706620
            or           a5, a5, a6                            #   92: 605520
            beq          a5, a3, .Lbr005                       #   95: 37150e
            movi         a7, 0 /* 0x00000000 */                #   98: 0c07
            movi         a8, 0x000fac02                        #   9a: 81f5ff
            movi         a2, 2 /* 0x00000002 */                #   9d: 0c22
            sub          a8, a5, a8                            #   9f: 8085c0
            movnez       a2, a7, a8                            #   a2: 802793
            ret                                                #   a5: 0df0
.Lbr005:    movi         a2, 1 /* 0x00000001 */                #   a7: 0c12
            ret           /* 0x00000001 */                     #   a9: 0df0

            .literal_position                                  #   ac: 00f25000
                                                               #   b0: 01f25000
                                                               #   b4: 02f25000
                                                               #   b8: 04f25000
                                                               #   bc: 05f25000

# Function @ .irom0.text+0xc0
            .balign      4
.Lfunc003:  movi         a3, 0x0050f200                        #   c0: 31fbff
            l8ui         a7, a2, 1 /* [arg0+0x1] */            #   c3: 720201
            l8ui         a6, a2, 2 /* [arg0+0x2] */            #   c6: 620202
            l8ui         a5, a2, 3 /* [arg0+0x3] */            #   c9: 520203
            slli         a6, a6, 8                             #   cc: 806611
            or           a5, a5, a6                            #   cf: 605520
            l8ui         a6, a2, 0 /* [arg0] */                #   d2: 620200
            slli         a7, a7, 16                            #   d5: 007711
            slli         a6, a6, 24                            #   d8: 806601
            or           a6, a6, a7                            #   db: 706620
            or           a5, a5, a6                            #   de: 605520
            bne          a5, a3, .Lbr006                       #   e1: 379503
            movi         a2, 1 /* 0x00000001 */                #   e4: 0c12
            ret           /* 0x00000001 */                     #   e6: 0df0
.Lbr006:    movi         a7, 0x0050f201                        #   e8: 71f2ff
            movi         a8, 0x0050f202                        #   eb: 81f2ff
            bne          a5, a7, .Lbr007                       #   ee: 779504
            movi         a2, 128 /* 0x00000080 */              #   f1: 22a080
            ret           /* 0x00000080 */                     #   f4: 0df0
.Lbr007:    bne          a5, a8, .Lbr008                       #   f6: 879503
            movi         a2, 2 /* 0x00000002 */                #   f9: 0c22
            ret           /* 0x00000002 */                     #   fb: 0df0
.Lbr008:    movi         a9, 0x0050f204                        #   fd: 91eeff
            movi         a10, 0 /* 0x00000000 */               #  100: 0c0a
            beq          a5, a9, .Lbr009                       #  102: 97150d
            movi         a11, 0x0050f205                       #  105: b1edff
            movi         a2, 256 /* 0x00000100 */              #  108: 22a100
            sub          a11, a5, a11                          #  10b: b0b5c0
            movnez       a2, a10, a11                          #  10e: b02a93
            ret                                                #  111: 0df0
.Lbr009:    movi         a2, 8 /* 0x00000008 */                #  113: 0c82
            ret           /* 0x00000008 */                     #  115: 0df0

            .literal_position                                  #  118: 01f25000
                                                               #  11c: 02f25000
                                                               #  120: 00f25000

# Function @ .irom0.text+0x124
            .balign      4
.Lfunc004:  movi         a3, 0x0050f201                        #  124: 31fdff
            l8ui         a7, a2, 1 /* [arg0+0x1] */            #  127: 720201
            l8ui         a6, a2, 2 /* [arg0+0x2] */            #  12a: 620202
            l8ui         a5, a2, 3 /* [arg0+0x3] */            #  12d: 520203
            slli         a6, a6, 8                             #  130: 806611
            or           a5, a5, a6                            #  133: 605520
            l8ui         a6, a2, 0 /* [arg0] */                #  136: 620200
            slli         a7, a7, 16                            #  139: 007711
            slli         a6, a6, 24                            #  13c: 806601
            or           a6, a6, a7                            #  13f: 706620
            or           a5, a5, a6                            #  142: 605520
            bne          a5, a3, .Lbr010                       #  145: 379503
            movi         a2, 1 /* 0x00000001 */                #  148: 0c12
            ret           /* 0x00000001 */                     #  14a: 0df0
.Lbr010:    movi         a7, 0x0050f202                        #  14c: 71f4ff
            movi         a8, 0 /* 0x00000000 */                #  14f: 0c08
            beq          a5, a7, .Lbr011                       #  151: 77150c
            movi         a9, 0x0050f200                        #  154: 91f3ff
            movi         a2, 16 /* 0x00000010 */               #  157: 1c02
            sub          a9, a5, a9                            #  159: 9095c0
            movnez       a2, a8, a9                            #  15c: 902893
            ret                                                #  15f: 0df0
.Lbr011:    movi         a2, 2 /* 0x00000002 */                #  161: 0c22
            ret           /* 0x00000002 */                     #  163: 0df0

            .literal_position                                  #  168: 00000000

# Function @ .irom0.text+0x16c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
            .global      wpa_parse_wpa_ie_rsn
            .type        wpa_parse_wpa_ie_rsn, @function
wpa_parse_wpa_ie_rsn:
            addi         sp, sp, -32 /* (local0) */            #  16c: 12c1e0
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   #  16f: f951
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  171: 0911
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  173: c921
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  175: e941
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  177: d931
            mov          a14, a4 /* arg2 */                    #  179: ed04
            mov          a13, a2 /* arg0 */                    #  17b: dd02
            mov          a12, a3 /* arg1 */                    #  17d: cd03
            mov          a2, a4 /* arg2 */                     #  17f: 2d04
            movi         a3, 0 /* 0x00000000 */                #  181: 0c03
            movi         a4, 32 /* 0x00000020 */               #  183: 2c04
            call0        memset                                #  185: 01f8ffc0
                                                               #  189: 0000
            movi         a15, 0 /* 0x00000000 */               #  18b: 0c0f
            movi         a0, 1 /* 0x00000001 */                #  18d: 0c10
            movi         a2, 2 /* 0x00000002 */                #  18f: 0c22
            movi         a3, 8 /* 0x00000008 */                #  191: 0c83
            s32i         a3, a14, 4 /* 0x00000008 -> [arg2+0x4] */ #  193: 391e
            s32i         a3, a14, 8 /* 0x00000008 -> [arg2+0x8] */ #  195: 392e
            s32i         a2, a14, 0 /* 0x00000002 -> [arg2] */ #  197: 290e
            s32i         a0, a14, 12 /* 0x00000001 -> [arg2+0xc] */ #  199: 093e
            s32i         a15, a14, 16 /* 0x00000000 -> [arg2+0x10] */ #  19b: f94e
            s32i         a15, a14, 24 /* 0x00000000 -> [arg2+0x18] */ #  19d: f96e
            s32i         a15, a14, 20 /* 0x00000000 -> [arg2+0x14] */ #  19f: f95e
            s32i         a15, a14, 28 /* 0x00000000 -> [arg2+0x1c] */ #  1a1: f97e
            beqz         a12, .Lbr014                          #  1a3: bc8c
            bltui        a12, 4, .Lbr014                       #  1a5: b64c36
            l8ui         a4, a13, 0 /* [arg0] */               #  1a8: 420d00
            movi         a5, 48 /* 0x00000030 */               #  1ab: 3c05
            bne          a4, a5, .Lbr012                       #  1ad: 57941d
            l8ui         a6, a13, 1 /* [arg0+0x1] */           #  1b0: 620d01
            addi         a7, a12, -2 /* arg1-0x2 */            #  1b3: 72ccfe
            bne          a6, a7, .Lbr012                       #  1b6: 779614
            l8ui         a9, a13, 3 /* [arg0+0x3] */           #  1b9: 920d03
            l8ui         a8, a13, 2 /* [arg0+0x2] */           #  1bc: 820d02
            slli         a9, a9, 8                             #  1bf: 809911
            or           a8, a8, a9                            #  1c2: 908820
            slli         a8, a8, 16                            #  1c5: 008811
            srai         a8, a8, 16                            #  1c8: 808031
            beqi         a8, 1, .Lbr015                        #  1cb: 261815
.Lbr012:    movi         a2, -2 /* 0xfffffffe */               #  1ce: 7ce2
.Lbr013:    l32i         a12, sp, 8 /* [(local2)] */           #  1d0: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  1d2: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  1d4: e841
            l32i         a15, sp, 20 /* [(local5)] */          #  1d6: f851
            l32i         a0, sp, 4 /* [(local1)] */            #  1d8: 0811
            addi         sp, sp, 32 /* (top of frame) */       #  1da: 12c120
            ret                                                #  1dd: 0df0
.Lbr014:    movi         a2, -1 /* 0xffffffff */               #  1df: 7cf2
            j            .Lbr013                               #  1e1: c6faff
.Lbr015:    addi         a13, a13, 4 /* arg0+0x4 */            #  1e4: 4bdd
            addi         a10, a12, -4 /* arg1-0x4 */           #  1e6: a2ccfc
            s32i         a10, sp, 0 /* arg1-0x4 -> [(local0)] */ #  1e9: a901
            mov          a12, a10 /* arg1-0x4 */               #  1eb: cd0a
            bgei         a10, 4, .Lbr016                       #  1ed: e64a02
            j            .Lbr026                               #  1f0: 063700
.Lbr016:    mov          a2, a13 /* arg0+0x4 */                #  1f3: 2d0d
            call0        .Lfunc001                             #  1f5: c5e1ff
            addi         a13, a13, 4 /* arg0+0x8 */            #  1f8: 4bdd
            l32i         a12, sp, 0 /* [(local0)] */           #  1fa: c801
            s32i         a2, a14, 8 /* a2 -> [arg2+0x8] */     #  1fc: 292e
            addi         a12, a12, -4 /* [(local0)]-0x4 */     #  1fe: c2ccfc
.Lbr017:    bgei         a12, 2, .Lbr018                       #  201: e62c02
            j            .Lbr030                               #  204: 063700
.Lbr018:    addi         a12, a12, -2                          #  207: c2ccfe
            s32i         a15, a14, 4 /* 0x00000000 -> [arg2+0x4] */ #  20a: f91e
            l8ui         a0, a13, 0                            #  20c: 020d00
            l8ui         a2, a13, 1                            #  20f: 220d01
            addi         a13, a13, 2                           #  212: 2bdd
            slli         a2, a2, 8                             #  214: 802211
            or           a0, a0, a2                            #  217: 200020
            extui        a0, a0, 0, 16                         #  21a: 0000f4
            s32i         a0, sp, 24 /* a0 -> [(local6)] */     #  21d: 0961
            beqz         a0, .Lbr032                           #  21f: 16300d
            slli         a3, a0, 2                             #  222: e03011
            bge          a12, a3, .Lbr019                      #  225: 37ac02
            j            .Lbr032                               #  228: 863200
.Lbr019:    blti         a0, 1, .Lbr021                        #  22b: a61019
            movi         a15, 0 /* 0x00000000 */               #  22e: 0c0f
.Lbr020:    mov          a2, a13                               #  230: 2d0d
            call0        .Lfunc001                             #  232: 05deff
            addi         a13, a13, 4                           #  235: 4bdd
            addi         a12, a12, -4                          #  237: c2ccfc
            addi         a15, a15, 1                           #  23a: 1bff
            l32i         a6, a14, 4 /* [arg2+0x4] */           #  23c: 681e
            l32i         a5, sp, 24 /* [(local6)] */           #  23e: 5861
            or           a6, a6, a2                            #  240: 206620
            s32i         a6, a14, 4 /* a6 -> [arg2+0x4] */     #  243: 691e
            bne          a5, a15, .Lbr020                      #  245: f795e7
.Lbr021:    movi         a15, 0 /* 0x00000000 */               #  248: 0c0f
            bgei         a12, 2, .Lbr022                       #  24a: e62c02
            j            .Lbr031                               #  24d: 462700
.Lbr022:    addi         a12, a12, -2                          #  250: c2ccfe
            s32i         a15, a14, 12 /* 0x00000000 -> [arg2+0xc] */ #  253: f93e
            l8ui         a7, a13, 0                            #  255: 720d00
            l8ui         a8, a13, 1                            #  258: 820d01
            addi         a13, a13, 2                           #  25b: 2bdd
            slli         a8, a8, 8                             #  25d: 808811
            or           a7, a7, a8                            #  260: 807720
            extui        a7, a7, 0, 16                         #  263: 7070f4
            s32i         a7, sp, 24 /* a7 -> [(local6)] */     #  266: 7961
            beqz         a7, .Lbr033                           #  268: 16f708
            slli         a9, a7, 2                             #  26b: e09711
            bge          a12, a9, .Lbr023                      #  26e: 97ac02
            j            .Lbr033                               #  271: 862100
.Lbr023:    blti         a7, 1, .Lbr025                        #  274: a61719
            movi         a15, 0 /* 0x00000000 */               #  277: 0c0f
.Lbr024:    mov          a2, a13                               #  279: 2d0d
            call0        .Lfunc002                             #  27b: 85dfff
            addi         a13, a13, 4                           #  27e: 4bdd
            addi         a12, a12, -4                          #  280: c2ccfc
            addi         a15, a15, 1                           #  283: 1bff
            l32i         a0, a14, 12 /* [arg2+0xc] */          #  285: 083e
            l32i         a11, sp, 24 /* [(local6)] */          #  287: b861
            or           a0, a0, a2                            #  289: 200020
            s32i         a0, a14, 12 /* a0 -> [arg2+0xc] */    #  28c: 093e
            bne          a11, a15, .Lbr024                     #  28e: f79be7
.Lbr025:    movi         a15, 0 /* 0x00000000 */               #  291: 0c0f
            blti         a12, 2, .Lbr029                       #  293: a62c48
            addi         a12, a12, -2                          #  296: c2ccfe
            l8ui         a2, a13, 0                            #  299: 220d00
            l8ui         a3, a13, 1                            #  29c: 320d01
            addi         a13, a13, 2                           #  29f: 2bdd
            slli         a3, a3, 8                             #  2a1: 803311
            or           a2, a2, a3                            #  2a4: 302220
            extui        a2, a2, 0, 16                         #  2a7: 2020f4
            s32i         a2, a14, 16 /* a2 -> [arg2+0x10] */   #  2aa: 294e
            blti         a12, 2, .Lbr029                       #  2ac: a62c2f
            addi         a4, a12, -2                           #  2af: 42ccfe
            l8ui         a6, a13, 1                            #  2b2: 620d01
            l8ui         a5, a13, 0                            #  2b5: 520d00
            slli         a6, a6, 8                             #  2b8: 806611
            or           a5, a5, a6                            #  2bb: 605520
            extui        a5, a5, 0, 16                         #  2be: 5050f4
            s32i         a5, a14, 20 /* a5 -> [arg2+0x14] */   #  2c1: 595e
            slli         a5, a5, 4                             #  2c3: c05511
            bge          a4, a5, .Lbr028                       #  2c6: 57a411
            s32i         a15, a14, 20 /* 0x00000000 -> [arg2+0x14] */ #  2c9: f95e
            movi         a2, -9 /* 0xfffffff7 */               #  2cb: 7c72
            j            .Lbr013                               #  2cd: c6bfff
.Lbr026:    bgei         a10, 1, .Lbr027                       #  2d0: e61a02
            j            .Lbr017                               #  2d3: 86caff
.Lbr027:    movi         a2, -3 /* 0xfffffffd */               #  2d6: 7cd2
            j            .Lbr013                               #  2d8: 06bdff
.Lbr028:    addi         a7, a13, 2                            #  2db: 2b7d
            s32i         a7, a14, 24 /* a7 -> [arg2+0x18] */   #  2dd: 796e
.Lbr029:    movi         a2, 0 /* 0x00000000 */                #  2df: 0c02
            j            .Lbr013                               #  2e1: c6baff
.Lbr030:    addi         a8, a12, -1                           #  2e4: 0b8c
            bnez         a8, .Lbr021                           #  2e6: 56e8f5
            movi         a2, -5 /* 0xfffffffb */               #  2e9: 7cb2
            j            .Lbr013                               #  2eb: 46b8ff
.Lbr031:    bnei         a12, 1, .Lbr025                       #  2ee: 661c9f
            movi         a2, -7 /* 0xfffffff9 */               #  2f1: 7c92
            j            .Lbr013                               #  2f3: 46b6ff
.Lbr032:    movi         a2, -4 /* 0xfffffffc */               #  2f6: 7cc2
            j            .Lbr013                               #  2f8: 06b5ff
.Lbr033:    movi         a2, -6 /* 0xfffffffa */               #  2fb: 7ca2
            j            .Lbr013                               #  2fd: c6b3ff

            .literal_position                                  #  300: 01f25000
                                                               #  304: 00000000

# Function @ .irom0.text+0x308
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
            .global      wpa_parse_wpa_ie_wpa
            .type        wpa_parse_wpa_ie_wpa, @function
wpa_parse_wpa_ie_wpa:
            addi         sp, sp, -32 /* (local0) */            #  308: 12c1e0
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  30b: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  30d: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  30f: c911
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  311: e931
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  313: d921
            mov          a14, a4 /* arg2 */                    #  315: ed04
            mov          a13, a2 /* arg0 */                    #  317: dd02
            mov          a12, a3 /* arg1 */                    #  319: cd03
            mov          a2, a4 /* arg2 */                     #  31b: 2d04
            movi         a3, 0 /* 0x00000000 */                #  31d: 0c03
            movi         a4, 32 /* 0x00000020 */               #  31f: 2c04
            call0        memset                                #  321: 01f8ffc0
                                                               #  325: 0000
            movi         a0, 1 /* 0x00000001 */                #  327: 0c10
            movi         a2, 2 /* 0x00000002 */                #  329: 0c22
            s32i         a2, a14, 4 /* 0x00000002 -> [arg2+0x4] */ #  32b: 291e
            s32i         a0, a14, 0 /* 0x00000001 -> [arg2] */ #  32d: 090e
            s32i         a0, a14, 12 /* 0x00000001 -> [arg2+0xc] */ #  32f: 093e
            s32i         a2, a14, 8 /* 0x00000002 -> [arg2+0x8] */ #  331: 292e
            movi         a0, 0 /* 0x00000000 */                #  333: 0c00
            s32i         a0, a14, 16 /* 0x00000000 -> [arg2+0x10] */ #  335: 094e
            s32i         a0, a14, 24 /* 0x00000000 -> [arg2+0x18] */ #  337: 096e
            s32i         a0, a14, 20 /* 0x00000000 -> [arg2+0x14] */ #  339: 095e
            s32i         a0, a14, 28 /* 0x00000000 -> [arg2+0x1c] */ #  33b: 097e
            beqz         a12, .Lbr036                          #  33d: 16ec05
            bltui        a12, 8, .Lbr036                       #  340: b68c5b
            l8ui         a3, a13, 0 /* [arg0] */               #  343: 320d00
            movi         a4, 221 /* 0x000000dd */              #  346: 42a0dd
            bne          a3, a4, .Lbr034                       #  349: 479341
            l8ui         a5, a13, 1 /* [arg0+0x1] */           #  34c: 520d01
            addi         a6, a12, -2 /* arg1-0x2 */            #  34f: 62ccfe
            bne          a5, a6, .Lbr034                       #  352: 679538
            l8ui         a7, a13, 5 /* [arg0+0x5] */           #  355: 720d05
            l8ui         a9, a13, 2 /* [arg0+0x2] */           #  358: 920d02
            l8ui         a10, a13, 3 /* [arg0+0x3] */          #  35b: a20d03
            l8ui         a8, a13, 4 /* [arg0+0x4] */           #  35e: 820d04
            slli         a10, a10, 16                          #  361: 00aa11
            slli         a8, a8, 8                             #  364: 808811
            slli         a9, a9, 24                            #  367: 809901
            or           a7, a7, a8                            #  36a: 807720
            movi         a8, 0x0050f201                        #  36d: 81e4ff
            or           a9, a9, a10                           #  370: a09920
            or           a7, a7, a9                            #  373: 907720
            bne          a7, a8, .Lbr034                       #  376: 879714
            l8ui         a10, a13, 7 /* [arg0+0x7] */          #  379: a20d07
            l8ui         a9, a13, 6 /* [arg0+0x6] */           #  37c: 920d06
            slli         a10, a10, 8                           #  37f: 80aa11
            or           a9, a9, a10                           #  382: a09920
            slli         a9, a9, 16                            #  385: 009911
            srai         a9, a9, 16                            #  388: 909031
            beqi         a9, 1, .Lbr037                        #  38b: 261915
.Lbr034:    movi         a2, -2 /* 0xfffffffe */               #  38e: 7ce2
.Lbr035:    l32i         a12, sp, 4 /* [(local1)] */           #  390: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  392: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  394: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  396: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  398: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  39a: 12c120
            ret                                                #  39d: 0df0
.Lbr036:    movi         a2, -1 /* 0xffffffff */               #  39f: 7cf2
            j            .Lbr035                               #  3a1: c6faff
.Lbr037:    addi         a13, a13, 8 /* arg0+0x8 */            #  3a4: 8bdd
            addi         a15, a12, -8 /* arg1-0x8 */           #  3a6: f2ccf8
            mov          a12, a15 /* arg1-0x8 */               #  3a9: cd0f
            bgei         a15, 4, .Lbr038                       #  3ab: e64f02
            j            .Lbr047                               #  3ae: 062d00
.Lbr038:    mov          a2, a13 /* arg0+0x8 */                #  3b1: 2d0d
            call0        .Lfunc003                             #  3b3: c5d0ff
            movi         a0, 0 /* 0x00000000 */                #  3b6: 0c00
            addi         a13, a13, 4 /* arg0+0xc */            #  3b8: 4bdd
            addi         a12, a15, -4 /* arg1-0xc */           #  3ba: c2cffc
            s32i         a2, a14, 8 /* a2 -> [arg2+0x8] */     #  3bd: 292e
.Lbr039:    bgei         a12, 2, .Lbr040                       #  3bf: e62c02
            j            .Lbr049                               #  3c2: c62a00
.Lbr040:    addi         a12, a12, -2                          #  3c5: c2ccfe
            s32i         a0, a14, 4 /* 0x00000000 -> [arg2+0x4] */ #  3c8: 091e
            l8ui         a15, a13, 0                           #  3ca: f20d00
            l8ui         a2, a13, 1                            #  3cd: 220d01
            addi         a13, a13, 2                           #  3d0: 2bdd
            slli         a2, a2, 8                             #  3d2: 802211
            or           a15, a15, a2                          #  3d5: 20ff20
            extui        a15, a15, 0, 16                       #  3d8: f0f0f4
            beqz         a15, .Lbr051                          #  3db: 162f0a
            slli         a3, a15, 2                            #  3de: e03f11
            bge          a12, a3, .Lbr041                      #  3e1: 37ac02
            j            .Lbr051                               #  3e4: 462600
.Lbr041:    blti         a15, 1, .Lbr043                       #  3e7: a61f1f
            movi         a4, 0 /* 0x00000000 */                #  3ea: 0c04
            s32i         a4, sp, 20 /* 0x00000000 -> [(local5)] */ #  3ec: 4951
.Lbr042:    mov          a2, a13                               #  3ee: 2d0d
            call0        .Lfunc003                             #  3f0: c5ccff
            addi         a13, a13, 4                           #  3f3: 4bdd
            addi         a12, a12, -4                          #  3f5: c2ccfc
            l32i         a5, sp, 20 /* [(local5)] */           #  3f8: 5851
            l32i         a6, a14, 4 /* [arg2+0x4] */           #  3fa: 681e
            addi         a5, a5, 1 /* [(local5)]+0x1 */        #  3fc: 1b55
            or           a6, a6, a2                            #  3fe: 206620
            s32i         a6, a14, 4 /* a6 -> [arg2+0x4] */     #  401: 691e
            s32i         a5, sp, 20 /* [(local5)]+0x1 -> [(local5)] */ #  403: 5951
            bne          a15, a5, .Lbr042                      #  405: 579fe5
            movi         a0, 0 /* 0x00000000 */                #  408: 0c00
.Lbr043:    blti         a12, 2, .Lbr050                       #  40a: a62c6b
            addi         a12, a12, -2                          #  40d: c2ccfe
            s32i         a0, a14, 12 /* 0x00000000 -> [arg2+0xc] */ #  410: 093e
            l8ui         a15, a13, 0                           #  412: f20d00
            l8ui         a2, a13, 1                            #  415: 220d01
            addi         a13, a13, 2                           #  418: 2bdd
            slli         a2, a2, 8                             #  41a: 802211
            or           a15, a15, a2                          #  41d: 20ff20
            extui        a15, a15, 0, 16                       #  420: f0f0f4
            beqz         a15, .Lbr052                          #  423: 16ff05
            slli         a3, a15, 2                            #  426: e03f11
            blt          a12, a3, .Lbr052                      #  429: 372c59
            blti         a15, 1, .Lbr045                       #  42c: a61f1d
            movi         a4, 0 /* 0x00000000 */                #  42f: 0c04
            s32i         a4, sp, 20 /* 0x00000000 -> [(local5)] */ #  431: 4951
.Lbr044:    mov          a2, a13                               #  433: 2d0d
            call0        .Lfunc004                             #  435: c5ceff
            addi         a13, a13, 4                           #  438: 4bdd
            addi         a12, a12, -4                          #  43a: c2ccfc
            l32i         a5, sp, 20 /* [(local5)] */           #  43d: 5851
            l32i         a6, a14, 12 /* [arg2+0xc] */          #  43f: 683e
            addi         a5, a5, 1 /* [(local5)]+0x1 */        #  441: 1b55
            or           a6, a6, a2                            #  443: 206620
            s32i         a6, a14, 12 /* a6 -> [arg2+0xc] */    #  446: 693e
            s32i         a5, sp, 20 /* [(local5)]+0x1 -> [(local5)] */ #  448: 5951
            bne          a15, a5, .Lbr044                      #  44a: 579fe5
.Lbr045:    blti         a12, 2, .Lbr046                       #  44d: a62c10
            l8ui         a8, a13, 1                            #  450: 820d01
            l8ui         a7, a13, 0                            #  453: 720d00
            slli         a8, a8, 8                             #  456: 808811
            or           a7, a7, a8                            #  459: 807720
            extui        a7, a7, 0, 16                         #  45c: 7070f4
            s32i         a7, a14, 16 /* a7 -> [arg2+0x10] */   #  45f: 794e
.Lbr046:    movi         a2, 0 /* 0x00000000 */                #  461: 0c02
            j            .Lbr035                               #  463: 46caff
.Lbr047:    bgei         a15, 1, .Lbr048                       #  466: e61f02
            j            .Lbr039                               #  469: 86d4ff
.Lbr048:    movi         a2, -3 /* 0xfffffffd */               #  46c: 7cd2
            j            .Lbr035                               #  46e: 86c7ff
.Lbr049:    bnei         a12, 1, .Lbr043                       #  471: 661c95
            movi         a2, -5 /* 0xfffffffb */               #  474: 7cb2
            j            .Lbr035                               #  476: 86c5ff
.Lbr050:    bnei         a12, 1, .Lbr045                       #  479: 661cd0
            movi         a2, -7 /* 0xfffffff9 */               #  47c: 7c92
            j            .Lbr035                               #  47e: 86c3ff
.Lbr051:    movi         a2, -4 /* 0xfffffffc */               #  481: 7cc2
            j            .Lbr035                               #  483: 46c2ff
.Lbr052:    movi         a2, -6 /* 0xfffffffa */               #  486: 7ca2
            j            .Lbr035                               #  488: 06c1ff

            .literal_position                                  #  48c: 00000000
                                                               #  490: 00000000
                                                               #  494: 00000000

# Function @ .irom0.text+0x498
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      wpa_eapol_key_mic
            .type        wpa_eapol_key_mic, @function
wpa_eapol_key_mic:
            addi         sp, sp, -48 /* (FP)-0x30 */           #  498: 12c1d0
            s32i         a0, sp, 36 /* a0 -> [(local1)] */     #  49b: 0991
            beqi         a3, 1, .Lbr054                        #  49d: 261309
            s32i         a6, sp, 32 /* arg4 -> [(local0)] */   #  4a0: 6981
            beqi         a3, 2, .Lbr056                        #  4a2: 262313
.Lbr053:    movi         a2, -1 /* 0xffffffff */               #  4a5: 7cf2
            j            .Lbr055                               #  4a7: c60100
.Lbr054:    movi         a3, 16 /* 0x00000010 */               #  4aa: 1c03
            call0        hmac_md5                              #  4ac: 01f8ffc0
                                                               #  4b0: 0000
.Lbr055:    l32i         a0, sp, 36 /* [(local1)] */           #  4b2: 0891
            addi         sp, sp, 48 /* (top of frame) */       #  4b4: 12c130
            ret                                                #  4b7: 0df0
.Lbr056:    movi         a3, 16 /* 0x00000010 */               #  4b9: 1c03
            mov          a6, sp /* (FP)-0x30 */                #  4bb: 6d01
            call0        hmac_sha1                             #  4bd: 01f4ffc0
                                                               #  4c1: 0000
            bnez         a2, .Lbr053                           #  4c3: 56e2fd
            l32i         a2, sp, 32 /* [(local0)] */           #  4c6: 2881
            mov          a3, sp /* (FP)-0x30 */                #  4c8: 3d01
            movi         a4, 16 /* 0x00000010 */               #  4ca: 1c04
            call0        memcpy                                #  4cc: 01f2ffc0
                                                               #  4d0: 0000
            movi         a2, 0 /* 0x00000000 */                #  4d2: 0c02
            j            .Lbr055                               #  4d4: 86f6ff

            .literal_position                                  #  4d8: 00000000

# Function @ .irom0.text+0x4dc
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      wpa_compare_rsn_ie
            .type        wpa_compare_rsn_ie, @function
wpa_compare_rsn_ie:
            addi         sp, sp, -16 /* (local0) */            #  4dc: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  4df: 0901
            beqz         a3, .Lbr057                           #  4e1: 9c43
            beqz         a5, .Lbr057                           #  4e3: 9c25
            bne          a4, a6, .Lbr057                       #  4e5: 679410
            mov          a2, a3 /* arg1 */                     #  4e8: 2d03
            mov          a3, a5 /* arg3 */                     #  4ea: 3d05
            call0        memcmp                                #  4ec: 01fbffc0
                                                               #  4f0: 0000
            bnez         a2, .Lbr057                           #  4f2: cc32
            movi         a2, 0 /* 0x00000000 */                #  4f4: 0c02
            j            .Lbr058                               #  4f6: 460000
.Lbr057:    movi         a2, -1 /* 0xffffffff */               #  4f9: 7cf2
.Lbr058:    l32i         a0, sp, 0 /* [(local0)] */            #  4fb: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  4fd: 12c110
            ret                                                #  500: 0df0

            .literal_position                                  #  504: 00000000
                                                               #  508: 00000000
                                                               #  50c: 00000000
                                                               #  510: 00000000
                                                               #  514: 00000000
                                                               #  518: 00000000
                                                               #  51c: 00000000
                                                               #  520: 00000000
                                                               #  524: 00000000
                                                               #  528: 00000000
                                                               #  52c: 00000000

# Function @ .irom0.text+0x530
# Local variables/stack:
#     (local0):  word[24]  @ -0x80
#     (local1):  word      @ -0x20
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word      @ -0x10
#     (local6):  word      @ -0xc
#     (local7):  word      @ -0x8
#     (local8):  word      @ -0x4
            .balign      4
            .global      wpa_pmk_to_ptk
            .type        wpa_pmk_to_ptk, @function
wpa_pmk_to_ptk:
            addi         sp, sp, -128 /* (local0) */           #  530: 12c180
            s32i         a15, sp, 124 /* a15 -> [(local8)] */  #  533: f2611f
            s32i         a0, sp, 108 /* a0 -> [(local4)] */    #  536: 02611b
            s32i         a4, sp, 104 /* arg2 -> [(local3)] */  #  539: 42611a
            s32i         a13, sp, 116 /* a13 -> [(local6)] */  #  53c: d2611d
            s32i         a14, sp, 120 /* a14 -> [(local7)] */  #  53f: e2611e
            s32i         a3, sp, 100 /* arg1 -> [(local2)] */  #  542: 326119
            s32i         a12, sp, 112 /* a12 -> [(local5)] */  #  545: c2611c
            s32i         a2, sp, 96 /* arg0 -> [(local1)] */   #  548: 226118
            mov          a12, a7 /* arg5 */                    #  54b: cd07
            mov          a2, a5 /* arg3 */                     #  54d: 2d05
            mov          a3, a6 /* arg4 */                     #  54f: 3d06
            mov          a14, a5 /* arg3 */                    #  551: ed05
            mov          a13, a6 /* arg4 */                    #  553: dd06
            movi         a4, 6 /* 0x00000006 */                #  555: 0c64
            call0        memcmp                                #  557: 01ebffc0
                                                               #  55b: 0000
            addi         a15, sp, 22 /* (FP)-0x6a */           #  55d: f2c116
            bgez         a2, .Lbr059                           #  560: d6b201
            mov          a3, a14 /* arg3 */                    #  563: 3d0e
            addi         a2, sp, 16 /* (FP)-0x70 */            #  565: 22c110
            movi         a4, 6 /* 0x00000006 */                #  568: 0c64
            call0        memcpy                                #  56a: 01e7ffc0
                                                               #  56e: 0000
            mov          a3, a13 /* arg4 */                    #  570: 3d0d
            mov          a2, a15 /* (FP)-0x6a */               #  572: 2d0f
            movi         a4, 6 /* 0x00000006 */                #  574: 0c64
            call0        memcpy                                #  576: 01e5ffc0
                                                               #  57a: 0000
            j            .Lbr060                               #  57c: 060600
.Lbr059:    mov          a3, a13 /* arg4 */                    #  57f: 3d0d
            addi         a2, sp, 16 /* (FP)-0x70 */            #  581: 22c110
            movi         a4, 6 /* 0x00000006 */                #  584: 0c64
            call0        memcpy                                #  586: 01e2ffc0
                                                               #  58a: 0000
            mov          a3, a14 /* arg3 */                    #  58c: 3d0e
            mov          a2, a15 /* (FP)-0x6a */               #  58e: 2d0f
            movi         a4, 6 /* 0x00000006 */                #  590: 0c64
            call0        memcpy                                #  592: 01e0ffc0
                                                               #  596: 0000
.Lbr060:    mov          a2, a12 /* arg5 */                    #  598: 2d0c
            l32i         a14, sp, 128 /* [(local9)] */         #  59a: e22120
            movi         a4, 32 /* 0x00000020 */               #  59d: 2c04
            mov          a3, a14 /* [(local9)] */              #  59f: 3d0e
            call0        memcmp                                #  5a1: 01ddffc0
                                                               #  5a5: 0000
            addi         a13, sp, 60 /* (FP)-0x44 */           #  5a7: d2c13c
            mov          a15, a2                               #  5aa: fd02
            addi         a2, sp, 28 /* (FP)-0x64 */            #  5ac: 22c11c
            bgez         a15, .Lbr061                          #  5af: d68f01
            mov          a3, a12 /* arg5 */                    #  5b2: 3d0c
            movi         a4, 32 /* 0x00000020 */               #  5b4: 2c04
            call0        memcpy                                #  5b6: 01d9ffc0
                                                               #  5ba: 0000
            mov          a3, a14 /* [(local9)] */              #  5bc: 3d0e
            mov          a2, a13 /* (FP)-0x44 */               #  5be: 2d0d
            movi         a4, 32 /* 0x00000020 */               #  5c0: 2c04
            call0        memcpy                                #  5c2: 01d7ffc0
                                                               #  5c6: 0000
            j            .Lbr062                               #  5c8: 460500
.Lbr061:    mov          a3, a14 /* [(local9)] */              #  5cb: 3d0e
            movi         a4, 32 /* 0x00000020 */               #  5cd: 2c04
            call0        memcpy                                #  5cf: 01d5ffc0
                                                               #  5d3: 0000
            mov          a3, a12 /* arg5 */                    #  5d5: 3d0c
            mov          a2, a13 /* (FP)-0x44 */               #  5d7: 2d0d
            movi         a4, 32 /* 0x00000020 */               #  5d9: 2c04
            call0        memcpy                                #  5db: 01d3ffc0
                                                               #  5df: 0000
.Lbr062:    l32i         a2, sp, 96 /* [(local1)] */           #  5e1: 222118
            l32i         a3, sp, 100 /* [(local2)] */          #  5e4: 322119
            l32i         a4, sp, 104 /* [(local3)] */          #  5e7: 42211a
            l32i         a7, sp, 132 /* [(FP)+0x4] */          #  5ea: 722121
            addi         a5, sp, 16 /* (FP)-0x70 */            #  5ed: 52c110
            movi         a6, 76 /* 0x0000004c */               #  5f0: 4cc6
            l32i         a0, sp, 136 /* [(FP)+0x8] */          #  5f2: 022122
            s32i         a0, sp, 0 /* [(FP)+0x8] -> [(local0)] */ #  5f5: 0901
            call0        sha1_prf                              #  5f7: 01cdffc0
                                                               #  5fb: 0000
            l32i         a12, sp, 112 /* [(local5)] */         #  5fd: c2211c
            l32i         a13, sp, 116 /* [(local6)] */         #  600: d2211d
            l32i         a14, sp, 120 /* [(local7)] */         #  603: e2211e
            l32i         a15, sp, 124 /* [(local8)] */         #  606: f2211f
            movi         a2, 128 /* 0x00000080 */              #  609: 22a080
            l32i         a0, sp, 108 /* [(local4)] */          #  60c: 02211b
            add          sp, sp, a2 /* (local9) */             #  60f: 2a11
            ret           /* 0x00000080 */                     #  611: 0df0

            .literal_position                                  #  614: 00000000
                                                               #  618: 00000000
                                                               #  61c: 00000000
                                                               #  620: 00000000

# Function @ .irom0.text+0x624
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word      @ -0x3c
#     (local2):  word[10]  @ -0x38
#     (local3):  word      @ -0x10
#     (local4):  word[3]   @ -0xc
            .balign      4
            .global      rsn_pmkid
            .type        rsn_pmkid, @function
rsn_pmkid:  addi         sp, sp, -64 /* (local0) */            #  624: 12c1c0
            addi         a7, sp, 16 /* (FP)-0x30 */            #  627: 72c110
            s32i         a0, sp, 52 /* a0 -> [(local4)] */     #  62a: 09d1
            s32i         a6, sp, 48 /* arg4 -> [(local3)] */   #  62c: 69c1
            s32i         a4, sp, 4 /* arg2 -> [(local1)] */    #  62e: 4911
            s32i         a5, sp, 8 /* arg3 -> [(local2)] */    #  630: 5921
            movi         a4, 3 /* 0x00000003 */                #  632: 0c34
            mov          a5, sp /* (local0) */                 #  634: 5d01
            movi         a6, .Ldata001                         #  636: 61f8ff
            movi         a0, .Lstr001                          #  639: 01f6ff
            s32i         a0, sp, 0 /* .Lstr001 -> [(local0)] */ #  63c: 0901
            call0        hmac_sha1_vector                      #  63e: 01f7ffc0
                                                               #  642: 0000
            l32i         a2, sp, 48 /* [(local3)] */           #  644: 28c1
            addi         a3, sp, 16 /* (FP)-0x30 */            #  646: 32c110
            movi         a4, 16 /* 0x00000010 */               #  649: 1c04
            call0        memcpy                                #  64b: 01f5ffc0
                                                               #  64f: 0000
            l32i         a0, sp, 52 /* [(local4)] */           #  651: 08d1
            addi         sp, sp, 64 /* (top of frame) */       #  653: 12c140
            ret                                                #  656: 0df0

# Function @ .irom0.text+0x658
            .balign      4
            .global      wpa_cipher_key_len
            .type        wpa_cipher_key_len, @function
wpa_cipher_key_len:
            beqi         a2, 2, .Lbr063                        #  658: 262214
            beqi         a2, 8, .Lbr064                        #  65b: 268215
            beqi         a2, 64, .Lbr064                       #  65e: 26d212
            beqi         a2, 128, .Lbr065                      #  661: 26e213
            addmi        a4, a2, -256 /* arg0-0x100 */         #  664: 42d2ff
            movi         a3, 13 /* 0x0000000d */               #  667: 0cd3
            movi         a2, 0 /* 0x00000000 */                #  669: 0c02
            moveqz       a2, a3, a4                            #  66b: 402383
            ret                                                #  66e: 0df0
.Lbr063:    movi         a2, 32 /* 0x00000020 */               #  670: 2c02
            ret           /* 0x00000020 */                     #  672: 0df0
.Lbr064:    movi         a2, 16 /* 0x00000010 */               #  674: 1c02
            ret           /* 0x00000010 */                     #  676: 0df0
.Lbr065:    movi         a2, 5 /* 0x00000005 */                #  678: 0c52
            ret           /* 0x00000005 */                     #  67a: 0df0

# Function @ .irom0.text+0x67c
            .balign      4
            .global      wpa_cipher_to_alg
            .type        wpa_cipher_to_alg, @function
wpa_cipher_to_alg:
            beqi         a2, 2, .Lbr066                        #  67c: 26220f
            beqi         a2, 8, .Lbr068                        #  67f: 268214
            beqi         a2, 64, .Lbr069                       #  682: 26d215
            beqi         a2, 128, .Lbr067                      #  685: 26e20a
            beqi         a2, 0x100, .Lbr067                    #  688: 26f207
            movi         a2, 0 /* 0x00000000 */                #  68b: 0c02
            ret           /* 0x00000000 */                     #  68d: 0df0
.Lbr066:    movi         a2, 2 /* 0x00000002 */                #  68f: 0c22
            ret           /* 0x00000002 */                     #  691: 0df0
.Lbr067:    movi         a2, 6 /* 0x00000006 */                #  693: 0c62
            ret           /* 0x00000006 */                     #  695: 0df0
.Lbr068:    movi         a2, 3 /* 0x00000003 */                #  697: 0c32
            ret           /* 0x00000003 */                     #  699: 0df0
.Lbr069:    movi         a2, 9 /* 0x00000009 */                #  69b: 0c92
            ret           /* 0x00000009 */                     #  69d: 0df0

            .literal_position                                  #  6a0: 04f25000
                                                               #  6a4: 04ac0f00
                                                               #  6a8: 08ac0f00
                                                               #  6ac: 02f25000
                                                               #  6b0: 02ac0f00
                                                               #  6b4: 05f25000
                                                               #  6b8: 05ac0f00
                                                               #  6bc: 01f25000
                                                               #  6c0: 01ac0f00
                                                               #  6c4: 00f25000
                                                               #  6c8: 00ac0f00

# Function @ .irom0.text+0x6cc
            .balign      4
            .global      wpa_cipher_to_suite
            .type        wpa_cipher_to_suite, @function
wpa_cipher_to_suite:
            bbci         a3, 3, .Lbr073                        #  6cc: 376314
            movi         a5, 0x000fac04                        #  6cf: 51f5ff
            movi         a3, 0x0050f204                        #  6d2: 31f3ff
.Lbr070:    addi         a4, a2, -2 /* arg0-0x2 */             #  6d5: 42c2fe
            moveqz       a3, a5, a4                            #  6d8: 403583
            j            .Lbr072                               #  6db: 460000
.Lbr071:    movi         a3, 0 /* 0x00000000 */                #  6de: 0c03
.Lbr072:    mov          a2, a3                                #  6e0: 2d03
            ret                                                #  6e2: 0df0
.Lbr073:    bbci         a3, 6, .Lbr074                        #  6e4: 676305
            movi         a3, 0x000fac08                        #  6e7: 31f0ff
            j            .Lbr072                               #  6ea: 86fcff
.Lbr074:    bbci         a3, 1, .Lbr075                        #  6ed: 176308
            movi         a5, 0x000fac02                        #  6f0: 51f0ff
            movi         a3, 0x0050f202                        #  6f3: 31eeff
            j            .Lbr070                               #  6f6: c6f6ff
.Lbr075:    bbci         a3, 8, .Lbr076                        #  6f9: 876308
            movi         a5, 0x000fac05                        #  6fc: 51efff
            movi         a3, 0x0050f205                        #  6ff: 31edff
            j            .Lbr070                               #  702: c6f3ff
.Lbr076:    bbci         a3, 7, .Lbr077                        #  705: 776308
            movi         a5, 0x000fac01                        #  708: 51eeff
            movi         a3, 0x0050f201                        #  70b: 31ecff
            j            .Lbr070                               #  70e: c6f0ff
.Lbr077:    bbci         a3, 0, .Lbr071                        #  711: 0763c9
            movi         a5, 0x000fac00                        #  714: 51edff
            movi         a3, 0x0050f200                        #  717: 31ebff
            j            .Lbr070                               #  71a: c6edff

            .balign      4
# Function @ .irom0.text+0x720
            .balign      4
            .global      rsn_cipher_put_suites
            .type        rsn_cipher_put_suites, @function
rsn_cipher_put_suites:
            movi         a8, 15 /* 0x0000000f */               #  720: 0cf8
            movi         a9, 8 /* 0x00000008 */                #  722: 0c89
            movi         a7, -84 /* 0xffffffac */              #  724: 72afac
            movi         a6, 0 /* 0x00000000 */                #  727: 0c06
            bbci         a3, 3, .Lbr078                        #  729: 376314
            movi         a5, 1 /* 0x00000001 */                #  72c: 0c15
            s8i          a6, a2, 0 /* 0x00 -> [arg0] */        #  72e: 624200
            s8i          a8, a2, 1 /* 0x0f -> [arg0+0x1] */    #  731: 824201
            movi         a4, 4 /* 0x00000004 */                #  734: 0c44
            s8i          a7, a2, 2 /* 0xac -> [arg0+0x2] */    #  736: 724202
            s8i          a4, a2, 3 /* 0x04 -> [arg0+0x3] */    #  739: 424203
            addi         a2, a2, 4 /* arg0+0x4 */              #  73c: 4b22
            j            .Lbr079                               #  73e: 460000
.Lbr078:    mov          a5, a6 /* 0x00000000 */               #  741: 5d06
.Lbr079:    bbci         a3, 6, .Lbr080                        #  743: 67630f
            addi         a5, a5, 1                             #  746: 1b55
            s8i          a9, a2, 3                             #  748: 924203
            s8i          a6, a2, 0                             #  74b: 624200
            s8i          a8, a2, 1                             #  74e: 824201
            s8i          a7, a2, 2                             #  751: 724202
            addi         a2, a2, 4                             #  754: 4b22
.Lbr080:    movi         a9, 2 /* 0x00000002 */                #  756: 0c29
            bbci         a3, 1, .Lbr081                        #  758: 17630f
            addi         a5, a5, 1                             #  75b: 1b55
            s8i          a9, a2, 3                             #  75d: 924203
            s8i          a6, a2, 0                             #  760: 624200
            s8i          a8, a2, 1                             #  763: 824201
            s8i          a7, a2, 2                             #  766: 724202
            addi         a2, a2, 4                             #  769: 4b22
.Lbr081:    bbci         a3, 0, .Lbr082                        #  76b: 07630d
            s8i          a8, a2, 1                             #  76e: 824201
            s8i          a7, a2, 2                             #  771: 724202
            s8i          a6, a2, 0                             #  774: 624200
            s8i          a6, a2, 3                             #  777: 624203
            addi         a5, a5, 1                             #  77a: 1b55
.Lbr082:    mov          a2, a5                                #  77c: 2d05
            ret                                                #  77e: 0df0

# Function @ .irom0.text+0x780
            .balign      4
            .global      wpa_cipher_put_suites
            .type        wpa_cipher_put_suites, @function
wpa_cipher_put_suites:
            movi         a8, -14 /* 0xfffffff2 */              #  780: 7c28
            movi         a7, 80 /* 0x00000050 */               #  782: 5c07
            movi         a9, 2 /* 0x00000002 */                #  784: 0c29
            movi         a6, 0 /* 0x00000000 */                #  786: 0c06
            bbci         a3, 3, .Lbr083                        #  788: 376314
            movi         a5, 1 /* 0x00000001 */                #  78b: 0c15
            s8i          a6, a2, 0 /* 0x00 -> [arg0] */        #  78d: 624200
            s8i          a7, a2, 1 /* 0x50 -> [arg0+0x1] */    #  790: 724201
            movi         a4, 4 /* 0x00000004 */                #  793: 0c44
            s8i          a8, a2, 2 /* 0xf2 -> [arg0+0x2] */    #  795: 824202
            s8i          a4, a2, 3 /* 0x04 -> [arg0+0x3] */    #  798: 424203
            addi         a2, a2, 4 /* arg0+0x4 */              #  79b: 4b22
            j            .Lbr084                               #  79d: 460000
.Lbr083:    mov          a5, a6 /* 0x00000000 */               #  7a0: 5d06
.Lbr084:    bbci         a3, 1, .Lbr085                        #  7a2: 17630f
            addi         a5, a5, 1                             #  7a5: 1b55
            s8i          a9, a2, 3                             #  7a7: 924203
            s8i          a6, a2, 0                             #  7aa: 624200
            s8i          a7, a2, 1                             #  7ad: 724201
            s8i          a8, a2, 2                             #  7b0: 824202
            addi         a2, a2, 4                             #  7b3: 4b22
.Lbr085:    bbci         a3, 0, .Lbr086                        #  7b5: 07630d
            s8i          a7, a2, 1                             #  7b8: 724201
            s8i          a8, a2, 2                             #  7bb: 824202
            s8i          a6, a2, 0                             #  7be: 624200
            s8i          a6, a2, 3                             #  7c1: 624203
            addi         a5, a5, 1                             #  7c4: 1b55
.Lbr086:    mov          a2, a5                                #  7c6: 2d05
            ret                                                #  7c8: 0df0

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "PMK Name"                            #    0: 504d4b20
                                                               #    4: 4e616d65
                                                               #    8: 00

            .section     .rodata, "a", @progbits

.Ldata001:  .byte        0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
            .byte        0x06, 0x00, 0x00, 0x00

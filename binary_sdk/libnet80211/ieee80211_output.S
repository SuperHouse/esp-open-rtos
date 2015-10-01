
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 8e880000
                                                               #    4: 00000000
                                                               #    8: 000af23f
                                                               #    c: ff0f00ff
                                                               #   10: 00000000
                                                               #   14: 00060060
                                                               #   18: 00000000
                                                               #   1c: 00000000
                                                               #   20: c0120000
                                                               #   24: 84090000
                                                               #   28: 00000000
                                                               #   2c: dc060000
                                                               #   30: 00000000
                                                               #   34: 00000000
                                                               #   38: 00000000
                                                               #   3c: 00000000
                                                               #   40: 00000000
                                                               #   44: 00000000

# Function @ .irom0.text+0x48
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word      @ -0x8
#     (local7):  word      @ -0x4
            .global      sdk_ieee80211_output_pbuf
            .type        sdk_ieee80211_output_pbuf, @function
sdk_ieee80211_output_pbuf:
            addi         sp, sp, -32 /* (local0) */            #   48: 12c1e0
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   #   4b: c951
            s32i         a14, sp, 28 /* a14 -> [(local7)] */   #   4d: e971
            s32i         a13, sp, 24 /* a13 -> [(local6)] */   #   4f: d961
            l32i         a13, a2, 28 /* [arg0+0x1c] */         #   51: d872
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     #   53: 0941
            l32i         a0, a13, 60 /* [[arg0+0x1c]+0x3c] */  #   55: 08fd
            mov          a14, a3 /* arg1 */                    #   57: ed03
            addi         a0, a0, -5 /* [[arg0+0x1c]+0x3c]-0x5 */ #   59: 02c0fb
            bnez         a0, .Lbr005                           #   5c: 56c00b
            beqz         a3, .Lbr005                           #   5f: 16930b
            l32i         a2, a14, 4 /* [arg1+0x4] */           #   62: 281e
            l32i         a3, a13, 176 /* [[arg0+0x1c]+0xb0] */ #   64: 322d2c
            s32i         a2, sp, 8 /* [arg1+0x4] -> [(local2)] */ #   67: 2921
            bnez         a3, .Lbr001                           #   69: cc43
            l32i         a12, a13, 136 /* [[arg0+0x1c]+0x88] */ #   6b: c22d22
            j            .Lbr002                               #   6e: 460200
.Lbr001:    s32i         a2, sp, 8 /* [arg1+0x4] -> [(local2)] */ #   71: 2921
            call0        sdk_cnx_node_search                   #   73: 01eaffc0
                                                               #   77: 0000
            mov          a12, a2                               #   79: cd02
.Lbr002:    beqz         a12, .Lbr005                          #   7b: 16dc09
            l16ui        a4, a12, 26                           #   7e: 421c0d
            bnez         a4, .Lbr003                           #   81: cc64
            l32i         a5, a12, 8                            #   83: 582c
            extui        a5, a5, 17, 1                         #   85: 505105
            bnez         a5, .Lbr005                           #   88: 560509
.Lbr003:    mov          a2, a12                               #   8b: 2d0c
            movi         a6, 1 /* 0x00000001 */                #   8d: 0c16
            l32i         a9, sp, 8 /* [(local2)] */            #   8f: 9821
            movi         a3, 0 /* 0x00000000 */                #   91: 0c03
            l8ui         a8, a9, 13 /* [[(local2)]+0xd] */     #   93: 82090d
            l8ui         a9, a9, 12 /* [[(local2)]+0xc] */     #   96: 92090c
            slli         a8, a8, 8                             #   99: 808811
            or           a8, a8, a9                            #   9c: 908820
            extui        a7, a8, 8, 8                          #   9f: 807874
            extui        a8, a8, 0, 8                          #   a2: 808074
            slli         a8, a8, 8                             #   a5: 808811
            or           a7, a7, a8                            #   a8: 807720
            movi         a8, 0x0000888e                        #   ab: 81d5ff
            extui        a7, a7, 0, 16                         #   ae: 7070f4
            sub          a7, a7, a8                            #   b1: 8077c0
            moveqz       a3, a6, a7                            #   b4: 703683
            s32i         a3, sp, 4 /* a3 -> [(local1)] */      #   b7: 3911
            call0        .Lfunc005                             #   b9: 01d9ffc0
                                                               #   bd: 0000
            beqz         a2, .Lbr005                           #   bf: 169205
            s32i         a12, a13, 136 /* a12 -> [[arg0+0x1c]+0x88] */ #   c2: c26d22
            mov          a2, a12                               #   c5: 2d0c
            mov          a3, a14 /* arg1 */                    #   c7: 3d0e
            call0        .Lfunc002                             #   c9: 01d6ffc0
                                                               #   cd: 0000
            movi         a3, 1 /* 0x00000001 */                #   cf: 0c13
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #   d1: 2901
            movi         a4, 0 /* 0x00000000 */                #   d3: 0c04
            mov          a2, a14 /* arg1 */                    #   d5: 2d0e
            call0        sdk_esf_buf_alloc                     #   d7: 01d4ffc0
                                                               #   db: 0000
            mov          a3, a2                                #   dd: 3d02
            beqz         a2, .Lbr005                           #   df: bc92
            movi         a5, 4 /* 0x00000004 */                #   e1: 0c45
            l32i         a10, sp, 4 /* [(local1)] */           #   e3: a811
            movi         a0, 8 /* 0x00000008 */                #   e5: 0c80
            beqz         a10, .Lbr004                          #   e7: 9cba
            l32i         a2, a2, 32                            #   e9: 2882
            l32i         a4, a2, 0                             #   eb: 4802
            srli         a6, a4, 6                             #   ed: 406641
            extui        a4, a4, 0, 6                          #   f0: 404054
            or           a6, a6, a5                            #   f3: 506620
            slli         a6, a6, 6                             #   f6: a06611
            or           a4, a4, a6                            #   f9: 604420
            s32i         a4, a2, 0                             #   fc: 4902
            l32i         a11, a13, 176 /* [[arg0+0x1c]+0xb0] */ #   fe: b22d2c
            bnez         a11, .Lbr004                          #  101: cc1b
            s8i          a0, a2, 14                            #  103: 02420e
.Lbr004:    mov          a2, a13 /* [arg0+0x1c] */             #  106: 2d0d
            call0        .Lfunc001                             #  108: 01c9ffc0
                                                               #  10c: 0000
            l32i         a5, sp, 0 /* [(local0)] */            #  10e: 5801
            s32i         a2, sp, 12 /* a2 -> [(local3)] */     #  110: 2931
            bnez         a2, .Lbr007                           #  112: dc52
            movi         a3, 1 /* 0x00000001 */                #  114: 0c13
            call0        sdk_esf_buf_recycle                   #  116: 01c6ffc0
                                                               #  11a: 0000
.Lbr005:    movi         a2, 1 /* 0x00000001 */                #  11c: 0c12
.Lbr006:    l32i         a12, sp, 20 /* [(local5)] */          #  11e: c851
            l32i         a13, sp, 24 /* [(local6)] */          #  120: d861
            l32i         a14, sp, 28 /* [(local7)] */          #  122: e871
            l32i         a0, sp, 16 /* [(local4)] */           #  124: 0841
            addi         sp, sp, 32 /* (top of frame) */       #  126: 12c120
            ret                                                #  129: 0df0
.Lbr007:    s32i         a2, sp, 12 /* a2 -> [(local3)] */     #  12b: 2931
            movi         a11, 8 /* 0x00000008 */               #  12d: 0c8b
            movi         a3, 1 /* 0x00000001 */                #  12f: 0c13
            l32i         a7, a2, 32                            #  131: 7882
            movi         a8, sdk_g_ic                          #  133: 81b4ff
            l32i         a10, a7, 0                            #  136: a807
            l32i         a6, a8, 16 /* [sdk_g_ic+0x10] */      #  138: 6848
            extui        a9, a10, 0, 6                         #  13a: a09054
            sub          a6, a6, a13                           #  13d: d066c0
            movnez       a6, a3, a6                            #  140: 606393
            srli         a10, a10, 6                           #  143: a0a641
            or           a10, a10, a11                         #  146: b0aa20
            movi         a3, 143 /* 0x0000008f */              #  149: 32a08f
            l8ui         a11, a7, 6                            #  14c: b20706
            slli         a10, a10, 6                           #  14f: a0aa11
            or           a9, a9, a10                           #  152: a09920
            and          a11, a11, a3                          #  155: 30bb10
            s32i         a9, a7, 0                             #  158: 9907
            extui        a3, a5, 0, 3                          #  15a: 503024
            bnez         a6, .Lbr008                           #  15d: cc36
            movi         a0, 0 /* 0x00000000 */                #  15f: 0c00
            j            .Lbr009                               #  161: 860000
.Lbr008:    l16ui        a0, a12, 26                           #  164: 021c0d
.Lbr009:    l32i         a10, sp, 12 /* [(local3)] */          #  167: a831
            slli         a3, a3, 4                             #  169: c03311
            or           a11, a11, a3                          #  16c: 30bb20
            s8i          a11, a7, 6                            #  16f: b24706
            beqz         a5, .Lbr011                           #  172: 9c35
            bnei         a5, 1, .Lbr010                        #  174: 661504
            movi         a5, 5 /* 0x00000005 */                #  177: 0c55
            j            .Lbr012                               #  179: 860300
.Lbr010:    addi         a7, a5, -3 /* [(local0)]-0x3 */       #  17c: 72c5fd
            movi         a4, 1 /* 0x00000001 */                #  17f: 0c14
            movi         a5, 0 /* 0x00000000 */                #  181: 0c05
            moveqz       a5, a4, a7                            #  183: 705483
            j            .Lbr012                               #  186: 460000
.Lbr011:    movi         a5, 6 /* 0x00000006 */                #  189: 0c65
.Lbr012:    l32i         a9, a10, 32 /* [[(local3)]+0x20] */   #  18b: 988a
            extui        a11, a5, 0, 4                         #  18d: 50b034
            l8ui         a8, a9, 4 /* [[[(local3)]+0x20]+0x4] */ #  190: 820904
            movi         a3, 240 /* 0x000000f0 */              #  193: 32a0f0
            and          a8, a8, a3                            #  196: 308810
            or           a8, a8, a11                           #  199: b08820
            s8i          a8, a9, 4 /* a8 -> [[[(local3)]+0x20]+0x4] */ #  19c: 824904
            movi         a7, 0x3ff20a00                        #  19f: 719aff
            movi         a5, 0 /* 0x00000000 */                #  1a2: 0c05
            l32i         a3, a10, 32 /* [[(local3)]+0x20] */   #  1a4: 388a
            memw                                               #  1a6: c02000
            movi         a4, 254 /* 0x000000fe */              #  1a9: 42a0fe
            l8ui         a11, a3, 0 /* [[[(local3)]+0x20]] */  #  1ac: b20300
            l32i         a7, a7, 0x200 /* [0x3ff20c00] */      #  1af: 722780
            s32i         a7, a3, 16 /* [0x3ff20c00] -> [[[(local3)]+0x20]+0x10] */ #  1b2: 7943
            and          a11, a11, a4                          #  1b4: 40bb10
            s8i          a11, a3, 0 /* a11 -> [[[(local3)]+0x20]] */ #  1b7: b24300
            movi         a3, 253 /* 0x000000fd */              #  1ba: 32a0fd
            l32i         a10, a10, 32 /* [[(local3)]+0x20] */  #  1bd: a88a
            extui        a11, a6, 0, 1                         #  1bf: 60b004
            l8ui         a9, a10, 0 /* [[[(local3)]+0x20]] */  #  1c2: 920a00
            slli         a11, a11, 1                           #  1c5: f0bb11
            and          a9, a9, a3                            #  1c8: 309910
            or           a9, a9, a11                           #  1cb: b09920
            s8i          a9, a10, 0 /* a9 -> [[[(local3)]+0x20]] */ #  1ce: 924a00
            l16ui        a8, a12, 26                           #  1d1: 821c0d
            beqz         a8, .Lbr019                           #  1d4: 16280f
            l32i         a4, sp, 12 /* [(local3)] */           #  1d7: 4831
            l32i         a4, a4, 32 /* [[(local3)]+0x20] */    #  1d9: 4884
            l32i         a4, a4, 0 /* [[[(local3)]+0x20]] */   #  1db: 4804
            extui        a4, a4, 7, 1                          #  1dd: 404704
            bnez         a4, .Lbr019                           #  1e0: 56640e
            extui        a2, a0, 0, 8                          #  1e3: 002074
            call0        sdk_rc_get_trc_by_index               #  1e6: 0193ffc0
                                                               #  1ea: 0000
            movi         a5, 0 /* 0x00000000 */                #  1ec: 0c05
.Lbr013:    l32i         a6, sp, 12 /* [(local3)] */           #  1ee: 6831
            l16ui        a10, a6, 22 /* [[(local3)]+0x16] */   #  1f0: a2160b
            l16ui        a9, a6, 20 /* [[(local3)]+0x14] */    #  1f3: 92160a
            s32i         a2, a6, 24 /* a2 -> [[(local3)]+0x18] */ #  1f6: 2966
            add          a9, a9, a10                           #  1f8: aa99
            l32i         a8, a6, 4 /* [[(local3)]+0x4] */      #  1fa: 8816
            movi         a10, 128 /* 0x00000080 */             #  1fc: a2a080
            memw                                               #  1ff: c02000
            l8ui         a7, a8, 3 /* [[[(local3)]+0x4]+0x3] */ #  202: 720803
            extui        a7, a7, 0, 7                          #  205: 707064
            or           a7, a7, a10                           #  208: a07720
            memw                                               #  20b: c02000
            s8i          a7, a8, 3 /* a7 -> [[[(local3)]+0x4]+0x3] */ #  20e: 724803
            movi         a4, 191 /* 0x000000bf */              #  211: 42a0bf
            movi         a3, 64 /* 0x00000040 */               #  214: 4c03
            memw                                               #  216: c02000
            l8ui         a0, a8, 3 /* [[[(local3)]+0x4]+0x3] */ #  219: 020803
            and          a0, a0, a4                            #  21c: 400010
            or           a0, a0, a3                            #  21f: 300020
            memw                                               #  222: c02000
            s8i          a0, a8, 3 /* a0 -> [[[(local3)]+0x4]+0x3] */ #  225: 024803
            movi         a11, 223 /* 0x000000df */             #  228: b2a0df
            memw                                               #  22b: c02000
            l8ui         a10, a8, 3 /* [[[(local3)]+0x4]+0x3] */ #  22e: a20803
            and          a10, a10, a11                         #  231: b0aa10
            or           a10, a10, a5                          #  234: 50aa20
            memw                                               #  237: c02000
            s8i          a10, a8, 3 /* a10 -> [[[(local3)]+0x4]+0x3] */ #  23a: a24803
            extui        a9, a9, 0, 12                         #  23d: 9090b4
            slli         a9, a9, 12                            #  240: 409911
            movi         a10, 0xff000fff                       #  243: a172ff
            memw                                               #  246: c02000
            l16ui        a7, a8, 2 /* [[[(local3)]+0x4]+0x2] */ #  249: 721801
            slli         a7, a7, 16                            #  24c: 007711
            memw                                               #  24f: c02000
            l16ui        a11, a8, 0 /* [[[(local3)]+0x4]] */   #  252: b21800
            or           a7, a7, a11                           #  255: b07720
            and          a7, a7, a10                           #  258: a07710
            or           a7, a7, a9                            #  25b: 907720
            memw                                               #  25e: c02000
            s16i         a7, a8, 0 /* a7 -> [[[(local3)]+0x4]] */ #  261: 725800
            extui        a7, a7, 16, 16                        #  264: 7070f5
            memw                                               #  267: c02000
            l32i         a6, a6, 32 /* [[(local3)]+0x20] */    #  26a: 6886
            l32i         a6, a6, 0 /* [[[(local3)]+0x20]] */   #  26c: 6806
            s16i         a7, a8, 2 /* a7 -> [[[(local3)]+0x4]+0x2] */ #  26e: 725801
            bbsi         a6, 8, .Lbr014                        #  271: 87e607
            mov          a2, a14 /* arg1 */                    #  274: 2d0e
            call0        pbuf_ref                              #  276: 0170ffc0
                                                               #  27a: 0000
.Lbr014:    l32i         a11, a12, 8                           #  27c: b82c
            bbci         a11, 4, .Lbr016                       #  27e: 476b14
            l32i         a14, a13, 176 /* [[arg0+0x1c]+0xb0] */ #  281: e22d2c
            bnei         a14, 1, .Lbr016                       #  284: 661e0e
            mov          a2, a12                               #  287: 2d0c
            l32i         a3, sp, 12 /* [(local3)] */           #  289: 3831
            call0        sdk_ieee80211_pwrsave                 #  28b: 016cffc0
                                                               #  28f: 0000
.Lbr015:    movi         a2, 0 /* 0x00000000 */                #  291: 0c02
            j            .Lbr006                               #  293: c6a1ff
.Lbr016:    call0        sdk_chm_check_same_channel            #  296: 016affc0
                                                               #  29a: 0000
            beqz         a2, .Lbr017                           #  29c: 8c92
            l32i         a2, sp, 12 /* [(local3)] */           #  29e: 2831
            call0        sdk_ppTxPkt                           #  2a0: 0169ffc0
                                                               #  2a4: 0000
            j            .Lbr018                               #  2a6: 460500
.Lbr017:    movi         a2, 0 /* 0x00000000 */                #  2a9: 0c02
            movi         a6, 0 /* 0x00000000 */                #  2ab: 0c06
            l32i         a4, sp, 12 /* [(local3)] */           #  2ad: 4831
            movi         a3, sdk_g_ic                          #  2af: 3158ff
            addi         a0, a4, 28 /* [(local3)]+0x1c */      #  2b2: 02c41c
            l32i         a5, a3, 0x1c4 /* [sdk_g_ic+0x1c4] */  #  2b5: 522371
            s32i         a6, a4, 28 /* 0x00000000 -> [[(local3)]+0x1c] */ #  2b8: 6974
            s32i         a4, a5, 0 /* [(local3)] -> [[sdk_g_ic+0x1c4]] */ #  2ba: 4905
            s32i         a0, a3, 0x1c4 /* [(local3)]+0x1c -> [sdk_g_ic+0x1c4] */ #  2bc: 026371
.Lbr018:    beqz         a2, .Lbr020                           #  2bf: 8cc2
            slli         a2, a2, 24                            #  2c1: 802201
            srai         a2, a2, 24                            #  2c4: 202831
            j            .Lbr006                               #  2c7: c694ff
.Lbr019:    mov          a2, a5 /* 0x00000000 */               #  2ca: 2d05
            j            .Lbr013                               #  2cc: 86c7ff
.Lbr020:    movi         a3, 0x60000600                        #  2cf: 3151ff
            memw                                               #  2d2: c02000
            movi         a4, sdk_g_ic                          #  2d5: 4150ff
            l32i         a3, a3, 36 /* [0x60000624] */         #  2d8: 3893
            s32i         a3, a4, 0x164 /* [0x60000624] -> [sdk_g_ic+0x164] */ #  2da: 326459
            j            .Lbr015                               #  2dd: 06ecff

            .literal_position                                  #  2e0: 00000000
                                                               #  2e4: 00000000
                                                               #  2e8: 00000000
                                                               #  2ec: 00000000
                                                               #  2f0: 00000000
                                                               #  2f4: 00000000
                                                               #  2f8: 00000000
                                                               #  2fc: 00000000
                                                               #  300: 00000000
                                                               #  304: 00000000

# Function @ .irom0.text+0x308
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
            .global      sdk_ieee80211_send_setup
            .type        sdk_ieee80211_send_setup, @function
sdk_ieee80211_send_setup:
            movi         a9, 1 /* 0x00000001 */                #  308: 0c19
            addi         sp, sp, -48 /* (local0) */            #  30a: 12c1d0
            s32i         a5, sp, 4 /* arg3 -> [(local1)] */    #  30d: 5911
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  30f: c931
            s32i         a15, sp, 24 /* a15 -> [(local6)] */   #  311: f961
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  313: 0921
            s32i         a3, sp, 32 /* arg1 -> [(local8)] */   #  315: 3981
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   #  317: d941
            s32i         a14, sp, 20 /* a14 -> [(local5)] */   #  319: e951
            mov          a13, a7 /* arg5 */                    #  31b: dd07
            mov          a14, a2 /* arg0 */                    #  31d: ed02
            movi         a3, 12 /* 0x0000000c */               #  31f: 0cc3
            and          a3, a4, a3                            #  321: 303410
            l8ui         a0, a14, 176 /* [arg0+0xb0] */        #  324: 020eb0
            l32i         a15, sp, 32 /* [(local8)] */          #  327: f881
            mov          a2, a6 /* arg4 */                     #  329: 2d06
            l32i         a8, a14, 136 /* [arg0+0x88] */        #  32b: 822e22
            s32i         a8, sp, 28 /* [arg0+0x88] -> [(local7)] */ #  32e: 8971
            s32i         a2, sp, 0 /* arg4 -> [(local0)] */    #  330: 2901
            l32i         a12, a15, 16 /* [[(local8)]+0x10] */  #  332: c84f
            slli         a7, a0, 24                            #  334: 807001
            s8i          a4, a12, 0 /* arg2 -> [[[(local8)]+0x10]] */ #  337: 424c00
            srai         a4, a7, 24                            #  33a: 704831
            bnei         a3, 8, .Lbr021                        #  33d: 668332
            beqz         a0, .Lbr026                           #  340: 16300c
            bnei         a4, 1, .Lbr023                        #  343: 66145d
            addi         a2, a12, 4 /* [[(local8)]+0x10]+0x4 */ #  346: 4b2c
            movi         a4, 2 /* 0x00000002 */                #  348: 0c24
            mov          a3, a13 /* arg5 */                    #  34a: 3d0d
            s8i          a4, a12, 1 /* 0x02 -> [[[(local8)]+0x10]+0x1] */ #  34c: 424c01
            movi         a4, 6 /* 0x00000006 */                #  34f: 0c64
            call0        memcpy                                #  351: 01e4ffc0
                                                               #  355: 0000
            addi         a2, a12, 10 /* [[(local8)]+0x10]+0xa */ #  357: ab2c
            movi         a4, 6 /* 0x00000006 */                #  359: 0c64
            l32i         a3, sp, 48 /* [(local9)] */           #  35b: 38c1
            call0        memcpy                                #  35d: 01e2ffc0
                                                               #  361: 0000
            l32i         a3, sp, 0 /* [(local0)] */            #  363: 3801
            addi         a2, a12, 16 /* [[(local8)]+0x10]+0x10 */ #  365: 22cc10
            movi         a4, 6 /* 0x00000006 */                #  368: 0c64
            call0        memcpy                                #  36a: 01e0ffc0
                                                               #  36e: 0000
            j            .Lbr023                               #  370: 060c00
.Lbr021:    bnez         a0, .Lbr022                           #  373: cc30
            l32i         a4, a14, 140 /* [arg0+0x8c] */        #  375: 422e23
            s32i         a4, sp, 28 /* [arg0+0x8c] -> [(local7)] */ #  378: 4971
.Lbr022:    addi         a2, a12, 4 /* [[(local8)]+0x10]+0x4 */ #  37a: 4b2c
            mov          a3, a13 /* arg5 */                    #  37c: 3d0d
            movi         a4, 6 /* 0x00000006 */                #  37e: 0c64
            movi         a5, 0 /* 0x00000000 */                #  380: 0c05
            s8i          a5, a12, 1 /* 0x00 -> [[[(local8)]+0x10]+0x1] */ #  382: 524c01
            call0        memcpy                                #  385: 01daffc0
                                                               #  389: 0000
            l32i         a3, sp, 0 /* [(local0)] */            #  38b: 3801
            addi         a2, a12, 10 /* [[(local8)]+0x10]+0xa */ #  38d: ab2c
            movi         a4, 6 /* 0x00000006 */                #  38f: 0c64
            call0        memcpy                                #  391: 01d8ffc0
                                                               #  395: 0000
            addi         a2, a12, 16 /* [[(local8)]+0x10]+0x10 */ #  397: 22cc10
            movi         a4, 6 /* 0x00000006 */                #  39a: 0c64
            l32i         a3, sp, 48 /* [(local9)] */           #  39c: 38c1
            call0        memcpy                                #  39e: 01d6ffc0
                                                               #  3a2: 0000
.Lbr023:    movi         a4, 0 /* 0x00000000 */                #  3a4: 0c04
            s16i         a4, a12, 2 /* 0x0000 -> [[[(local8)]+0x10]+0x2] */ #  3a6: 425c01
            beqz         a14, .Lbr024                          #  3a9: 9c3e
            l32i         a8, sp, 28 /* [(local7)] */           #  3ab: 8871
            l32i         a7, sp, 4 /* [(local1)] */            #  3ad: 7811
            addx2        a7, a7, a8                            #  3af: 807790
            l16ui        a5, a7, 124                           #  3b2: 52173e
            addi         a6, a5, 1                             #  3b5: 1b65
            s16i         a6, a7, 124                           #  3b7: 62573e
            slli         a5, a5, 4                             #  3ba: c05511
            s16i         a5, a12, 22 /* a5 -> [[[(local8)]+0x10]+0x16] */ #  3bd: 525c0b
.Lbr024:    l32i         a0, a15, 32 /* [[(local8)]+0x20] */   #  3c0: 088f
            l8ui         a9, a13, 0 /* [arg5] */               #  3c2: 920d00
            l32i         a15, sp, 24 /* [(local6)] */          #  3c5: f861
            bbci         a9, 0, .Lbr025                        #  3c7: 076926
            movi         a12, 1024 /* 0x00000400 */            #  3ca: c2a400
            l32i         a13, a0, 0 /* [[[(local8)]+0x20]] */  #  3cd: d800
            movi         a14, 2 /* 0x00000002 */               #  3cf: 0c2e
            extui        a11, a13, 0, 6                        #  3d1: d0b054
            srli         a13, a13, 6                           #  3d4: d0d641
            or           a13, a13, a14                         #  3d7: e0dd20
            slli         a13, a13, 6                           #  3da: a0dd11
            or           a11, a11, a13                         #  3dd: d0bb20
            extui        a10, a11, 0, 6                        #  3e0: b0a054
            srli         a11, a11, 6                           #  3e3: b0b641
            or           a11, a11, a12                         #  3e6: c0bb20
            slli         a11, a11, 6                           #  3e9: a0bb11
            or           a10, a10, a11                         #  3ec: b0aa20
            s32i         a10, a0, 0 /* a10 -> [[[(local8)]+0x20]] */ #  3ef: a900
.Lbr025:    l32i         a12, sp, 12 /* [(local3)] */          #  3f1: c831
            movi         a14, sdk_g_ic                         #  3f3: e1bbff
            l32i         a13, sp, 16 /* [(local4)] */          #  3f6: d841
            l8ui         a14, a14, 125 /* [sdk_g_ic+0x7d] */   #  3f8: e20e7d
            s8i          a14, a0, 8 /* [sdk_g_ic+0x7d] -> [[[(local8)]+0x20]+0x8] */ #  3fb: e24008
            l32i         a14, sp, 20 /* [(local5)] */          #  3fe: e851
            l32i         a0, sp, 8 /* [(local2)] */            #  400: 0821
            addi         sp, sp, 48 /* (local9) */             #  402: 12c130
            ret                                                #  405: 0df0
.Lbr026:    s8i          a9, a12, 1 /* 0x01 -> [[[(local8)]+0x10]+0x1] */ #  407: 924c01
            l32i         a3, sp, 48 /* [(local9)] */           #  40a: 38c1
            addi         a2, a12, 4 /* [[(local8)]+0x10]+0x4 */ #  40c: 4b2c
            movi         a4, 6 /* 0x00000006 */                #  40e: 0c64
            call0        memcpy                                #  410: 01bbffc0
                                                               #  414: 0000
            l32i         a3, sp, 0 /* [(local0)] */            #  416: 3801
            addi         a2, a12, 10 /* [[(local8)]+0x10]+0xa */ #  418: ab2c
            movi         a4, 6 /* 0x00000006 */                #  41a: 0c64
            call0        memcpy                                #  41c: 01b9ffc0
                                                               #  420: 0000
            addi         a2, a12, 16 /* [[(local8)]+0x10]+0x10 */ #  422: 22cc10
            mov          a3, a13 /* arg5 */                    #  425: 3d0d
            movi         a4, 6 /* 0x00000006 */                #  427: 0c64
            call0        memcpy                                #  429: 01b6ffc0
                                                               #  42d: 0000
            j            .Lbr023                               #  42f: 46dcff

            .literal_position                                  #  434: ff0f00ff
                                                               #  438: ff3fffff
                                                               #  43c: 00000000
                                                               #  440: 00000000
                                                               #  444: 00000000

# Function @ .irom0.text+0x448
# Local variables/stack:
#     (local0):  word[4]   @ -0x20
#     (local1):  word      @ -0x10
#     (local2):  word      @ -0xc
#     (local3):  word[2]   @ -0x8
            .global      sdk_ieee80211_mgmt_output
            .type        sdk_ieee80211_mgmt_output, @function
sdk_ieee80211_mgmt_output:
            movi         a9, 64 /* 0x00000040 */               #  448: 4c09
            addi         sp, sp, -32 /* (local0) */            #  44a: 12c1e0
            movi         a8, 128 /* 0x00000080 */              #  44d: 82a080
            l32i         a6, a2, 0 /* [arg0] */                #  450: 6802
            l32i         a7, a2, 136 /* [arg0+0x88] */         #  452: 722222
            s32i         a12, sp, 24 /* a12 -> [(local3)] */   #  455: c961
            s32i         a0, sp, 20 /* a0 -> [(local2)] */     #  457: 0951
            mov          a12, a3 /* arg1 */                    #  459: cd03
            l16ui        a3, a3, 22 /* [arg1+0x16] */          #  45b: 32130b
            l16ui        a0, a12, 20 /* [arg1+0x14] */         #  45e: 021c0a
            l32i         a11, a12, 4 /* [arg1+0x4] */          #  461: b81c
            add          a0, a0, a3                            #  463: 3a00
            memw                                               #  465: c02000
            l8ui         a5, a11, 3 /* [[arg1+0x4]+0x3] */     #  468: 520b03
            extui        a5, a5, 0, 7                          #  46b: 505064
            or           a5, a5, a8                            #  46e: 805520
            memw                                               #  471: c02000
            s8i          a5, a11, 3 /* a5 -> [[arg1+0x4]+0x3] */ #  474: 524b03
            movi         a3, 191 /* 0x000000bf */              #  477: 32a0bf
            memw                                               #  47a: c02000
            l8ui         a8, a11, 3 /* [[arg1+0x4]+0x3] */     #  47d: 820b03
            and          a8, a8, a3                            #  480: 308810
            or           a8, a8, a9                            #  483: 908820
            memw                                               #  486: c02000
            s8i          a8, a11, 3 /* a8 -> [[arg1+0x4]+0x3] */ #  489: 824b03
            movi         a5, 223 /* 0x000000df */              #  48c: 52a0df
            memw                                               #  48f: c02000
            l8ui         a3, a11, 3 /* [[arg1+0x4]+0x3] */     #  492: 320b03
            and          a3, a3, a5                            #  495: 503310
            memw                                               #  498: c02000
            s8i          a3, a11, 3 /* a3 -> [[arg1+0x4]+0x3] */ #  49b: 324b03
            extui        a0, a0, 0, 12                         #  49e: 0000b4
            movi         a3, 0xff000fff                        #  4a1: 31e4ff
            slli         a0, a0, 12                            #  4a4: 400011
            memw                                               #  4a7: c02000
            l16ui        a8, a11, 2 /* [[arg1+0x4]+0x2] */     #  4aa: 821b01
            slli         a8, a8, 16                            #  4ad: 008811
            memw                                               #  4b0: c02000
            l16ui        a5, a11, 0 /* [[arg1+0x4]] */         #  4b3: 521b00
            or           a8, a8, a5                            #  4b6: 508820
            and          a8, a8, a3                            #  4b9: 308810
            or           a8, a8, a0                            #  4bc: 008820
            memw                                               #  4bf: c02000
            s16i         a8, a11, 0 /* a8 -> [[arg1+0x4]] */   #  4c2: 825b00
            extui        a8, a8, 16, 16                        #  4c5: 8080f5
            memw                                               #  4c8: c02000
            addi         a6, a6, 41 /* [arg0]+0x29 */          #  4cb: 62c629
            l32i         a0, a2, 176 /* [arg0+0xb0] */         #  4ce: 02222c
            l32i         a3, a12, 16 /* [arg1+0x10] */         #  4d1: 384c
            s32i         a3, sp, 16 /* [arg1+0x10] -> [(local1)] */ #  4d3: 3941
            s16i         a8, a11, 2 /* a8 -> [[arg1+0x4]+0x2] */ #  4d5: 825b01
            bnez         a0, .Lbr027                           #  4d8: cca0
            s32i         a7, sp, 0 /* [arg0+0x88] -> [(local0)] */ #  4da: 7901
            mov          a3, a12 /* arg1 */                    #  4dc: 3d0c
            movi         a5, 16 /* 0x00000010 */               #  4de: 1c05
            call0        sdk_ieee80211_send_setup              #  4e0: 050000
            j            .Lbr029                               #  4e3: 060500
.Lbr027:    movi         a8, 0xffff3fff                        #  4e6: 81d4ff
            l16ui        a5, a7, 26 /* [[arg0+0x88]+0x1a] */   #  4e9: 52170d
            bany         a5, a8, .Lbr028                       #  4ec: 878502
            addi         a7, a2, 64 /* arg0+0x40 */            #  4ef: 72c240
.Lbr028:    s32i         a6, sp, 0 /* [arg0]+0x29 -> [(local0)] */ #  4f2: 6901
            mov          a3, a12 /* arg1 */                    #  4f4: 3d0c
            movi         a5, 16 /* 0x00000010 */               #  4f6: 1c05
            call0        sdk_ieee80211_send_setup              #  4f8: 050000
.Lbr029:    l32i         a9, a12, 32 /* [arg1+0x20] */         #  4fb: 988c
            l32i         a11, sp, 16 /* [(local1)] */          #  4fd: b841
            l32i         a9, a9, 0 /* [[arg1+0x20]] */         #  4ff: 9809
            movi         a0, 64 /* 0x00000040 */               #  501: 4c00
            bbci         a9, 6, .Lbr030                        #  503: 676908
            l8ui         a10, a11, 1 /* [[(local1)]+0x1] */    #  506: a20b01
            or           a10, a10, a0                          #  509: 00aa20
            s8i          a10, a11, 1 /* a10 -> [[(local1)]+0x1] */ #  50c: a24b01
.Lbr030:    call0        sdk_chm_check_same_channel            #  50f: 01ccffc0
                                                               #  513: 0000
            beqz         a2, .Lbr031                           #  515: 8c92
            mov          a2, a12 /* arg1 */                    #  517: 2d0c
            call0        sdk_ppTxPkt                           #  519: 01caffc0
                                                               #  51d: 0000
            j            .Lbr032                               #  51f: c60400
.Lbr031:    movi         a2, 0 /* 0x00000000 */                #  522: 0c02
            addi         a3, a12, 28 /* arg1+0x1c */           #  524: 32cc1c
            movi         a4, sdk_g_ic                          #  527: 41c5ff
            movi         a6, 0 /* 0x00000000 */                #  52a: 0c06
            l32i         a5, a4, 0x1c4 /* [sdk_g_ic+0x1c4] */  #  52c: 522471
            s32i         a6, a12, 28 /* 0x00000000 -> [arg1+0x1c] */ #  52f: 697c
            s32i         a12, a5, 0 /* arg1 -> [[sdk_g_ic+0x1c4]] */ #  531: c905
            s32i         a3, a4, 0x1c4 /* arg1+0x1c -> [sdk_g_ic+0x1c4] */ #  533: 326471
.Lbr032:    l32i         a12, sp, 24 /* [(local3)] */          #  536: c861
            l32i         a0, sp, 20 /* [(local2)] */           #  538: 0851
            addi         sp, sp, 32 /* (top of frame) */       #  53a: 12c120
            ret                                                #  53d: 0df0

            .balign      4
# Function @ .irom0.text+0x540
            .global      sdk_ieee80211_tx_mgt_cb
            .type        sdk_ieee80211_tx_mgt_cb, @function
sdk_ieee80211_tx_mgt_cb:
            ret           /* arg0 */                           #  540: 0df0

            .literal_position                                  #  544: 00000000
                                                               #  548: 000af23f
                                                               #  54c: 00000000
                                                               #  550: 00000000
                                                               #  554: 00000000
                                                               #  558: 00000000
                                                               #  55c: 00000000

# Function @ .irom0.text+0x560
# Local variables/stack:
#     (local0):  word[4]   @ -0x30
#     (local1):  word      @ -0x20
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word      @ -0x10
#     (local6):  word      @ -0xc
#     (local7):  word      @ -0x8
#     (local8):  word      @ -0x4
            .global      sdk_ieee80211_send_nulldata
            .type        sdk_ieee80211_send_nulldata, @function
sdk_ieee80211_send_nulldata:
            movi         a3, 24 /* 0x00000018 */               #  560: 1c83
            movi         a5, 66 /* 0x00000042 */               #  562: 4c25
            addi         sp, sp, -48 /* (local0) */            #  564: 12c1d0
            s32i         a12, sp, 32 /* a12 -> [(local5)] */   #  567: c981
            s32i         a15, sp, 44 /* a15 -> [(local8)] */   #  569: f9b1
            s32i         a0, sp, 28 /* a0 -> [(local4)] */     #  56b: 0971
            s32i         a13, sp, 36 /* a13 -> [(local6)] */   #  56d: d991
            s32i         a14, sp, 40 /* a14 -> [(local7)] */   #  56f: e9a1
            l32i         a13, a2, 136 /* [arg0+0x88] */        #  571: d22222
            mov          a14, a2 /* arg0 */                    #  574: ed02
            l32i         a0, a14, 0 /* [arg0] */               #  576: 080e
            s32i         a0, sp, 20 /* [arg0] -> [(local2)] */ #  578: 0951
            l32i         a4, a13, 8 /* [[arg0+0x88]+0x8] */    #  57a: 482d
            movi         a2, 26 /* 0x0000001a */               #  57c: 1ca2
            and          a4, a4, a5                            #  57e: 504410
            movnez       a3, a2, a4                            #  581: 403293
            s32i         a3, sp, 24 /* a3 -> [(local3)] */     #  584: 3961
            addi         a2, sp, 16 /* (local1) */             #  586: 22c110
            movi         a4, 0 /* 0x00000000 */                #  589: 0c04
            s32i         a4, sp, 16 /* 0x00000000 -> [(local1)] */ #  58b: 4941
            call0        sdk_ieee80211_getmgtframe             #  58d: 01f0ffc0
                                                               #  591: 0000
            mov          a12, a2                               #  593: cd02
            bnez         a2, .Lbr033                           #  595: cc32
            movi         a2, 1 /* 0x00000001 */                #  597: 0c12
            j            .Lbr042                               #  599: 063f00
.Lbr033:    l32i         a15, a2, 16                           #  59c: f842
            l32i         a6, sp, 20 /* [(local2)] */           #  59e: 6851
            l32i         a8, a13, 8 /* [[arg0+0x88]+0x8] */    #  5a0: 882d
            l32i         a7, sp, 24 /* [(local3)] */           #  5a2: 7861
            s16i         a7, a2, 20                            #  5a4: 72520a
            addi         a6, a6, 41 /* [(local2)]+0x29 */      #  5a7: 62c629
            addi         a7, a14, 64 /* arg0+0x40 */           #  5aa: 72ce40
            bbci         a8, 1, .Lbr035                        #  5ad: 176822
            s32i         a13, sp, 0 /* [arg0+0x88] -> [(local0)] */ #  5b0: d901
            mov          a2, a14 /* arg0 */                    #  5b2: 2d0e
            mov          a3, a12                               #  5b4: 3d0c
            movi         a4, 200 /* 0x000000c8 */              #  5b6: 42a0c8
            movi         a5, 0 /* 0x00000000 */                #  5b9: 0c05
            call0        sdk_ieee80211_send_setup              #  5bb: 050000
            movi         a2, 0 /* 0x00000000 */                #  5be: 0c02
            s8i          a2, a15, 24                           #  5c0: 224f18
            l8ui         a8, a13, 105 /* [[arg0+0x88]+0x69] */ #  5c3: 820d69
            movi         a0, 32 /* 0x00000020 */               #  5c6: 2c00
            beqz         a8, .Lbr034                           #  5c8: 8c18
            s8i          a0, a15, 24                           #  5ca: 024f18
.Lbr034:    s8i          a2, a15, 25                           #  5cd: 224f19
            j            .Lbr036                               #  5d0: 860300
.Lbr035:    s32i         a13, sp, 0 /* [arg0+0x88] -> [(local0)] */ #  5d3: d901
            mov          a2, a14 /* arg0 */                    #  5d5: 2d0e
            mov          a3, a12                               #  5d7: 3d0c
            movi         a4, 72 /* 0x00000048 */               #  5d9: 4c84
            movi         a5, 16 /* 0x00000010 */               #  5db: 1c05
            call0        sdk_ieee80211_send_setup              #  5dd: 050000
            movi         a0, 32 /* 0x00000020 */               #  5e0: 2c00
.Lbr036:    movi         a3, 16 /* 0x00000010 */               #  5e2: 1c03
            l32i         a9, a13, 8 /* [[arg0+0x88]+0x8] */    #  5e4: 982d
            movi         a4, sdk_g_ic                          #  5e6: 41d7ff
            bbci         a9, 4, .Lbr037                        #  5e9: 476908
            l8ui         a10, a15, 1                           #  5ec: a20f01
            or           a10, a10, a3                          #  5ef: 30aa20
            s8i          a10, a15, 1                           #  5f2: a24f01
.Lbr037:    movi         a15, 0 /* 0x00000000 */               #  5f5: 0c0f
            movi         a11, 1 /* 0x00000001 */               #  5f7: 0c1b
            l32i         a7, a12, 32                           #  5f9: 788c
            l32i         a2, a4, 16 /* [sdk_g_ic+0x10] */      #  5fb: 2844
            l8ui         a6, a7, 6                             #  5fd: 620706
            sub          a2, a2, a14                           #  600: e022c0
            movnez       a2, a11, a2                           #  603: 202b93
            bnez         a2, .Lbr038                           #  606: cc32
            movi         a3, 0 /* 0x00000000 */                #  608: 0c03
            j            .Lbr039                               #  60a: 860000
.Lbr038:    l16ui        a3, a13, 26 /* [[arg0+0x88]+0x1a] */  #  60d: 321d0d
.Lbr039:    movi         a8, 143 /* 0x0000008f */              #  610: 82a08f
            and          a6, a6, a8                            #  613: 806610
            or           a6, a6, a0                            #  616: 006620
            s8i          a6, a7, 6                             #  619: 624706
            l32i         a4, a12, 32                           #  61c: 488c
            l8ui         a14, a4, 4                            #  61e: e20404
            movi         a5, 240 /* 0x000000f0 */              #  621: 52a0f0
            and          a14, a14, a5                          #  624: 50ee10
            s8i          a14, a4, 4                            #  627: e24404
            movi         a11, 0x3ff20a00                       #  62a: b1c7ff
            l32i         a9, a12, 32                           #  62d: 988c
            memw                                               #  62f: c02000
            l32i         a11, a11, 0x200 /* [0x3ff20c00] */    #  632: b22b80
            movi         a10, 254 /* 0x000000fe */             #  635: a2a0fe
            extui        a7, a2, 0, 1                          #  638: 207004
            l8ui         a8, a9, 0                             #  63b: 820900
            slli         a7, a7, 1                             #  63e: f07711
            and          a8, a8, a10                           #  641: a08810
            s8i          a8, a9, 0                             #  644: 824900
            l32i         a6, a12, 32                           #  647: 688c
            s32i         a11, a9, 16                           #  649: b949
            l8ui         a5, a6, 0                             #  64b: 520600
            movi         a8, 253 /* 0x000000fd */              #  64e: 82a0fd
            and          a5, a5, a8                            #  651: 805510
            or           a5, a5, a7                            #  654: 705520
            s8i          a5, a6, 0                             #  657: 524600
            l16ui        a4, a13, 26 /* [[arg0+0x88]+0x1a] */  #  65a: 421d0d
            mov          a2, a15 /* 0x00000000 */              #  65d: 2d0f
            beqz         a4, .Lbr043                           #  65f: 165404
            l32i         a9, a12, 32                           #  662: 988c
            l32i         a9, a9, 0                             #  664: 9809
            bbsi         a9, 7, .Lbr043                        #  666: 77e93e
            extui        a2, a3, 0, 8                          #  669: 302074
            call0        sdk_rc_get_trc_by_index               #  66c: 01baffc0
                                                               #  670: 0000
.Lbr040:    s32i         a2, a12, 24                           #  672: 296c
            call0        sdk_chm_check_same_channel            #  674: 01b9ffc0
                                                               #  678: 0000
            beqz         a2, .Lbr041                           #  67a: 8c92
            mov          a2, a12                               #  67c: 2d0c
            call0        sdk_ppTxPkt                           #  67e: 01b7ffc0
                                                               #  682: 0000
            j            .Lbr042                               #  684: 460400
.Lbr041:    movi         a2, 0 /* 0x00000000 */                #  687: 0c02
            movi         a11, sdk_g_ic                         #  689: b1b0ff
            addi         a10, a12, 28                          #  68c: a2cc1c
            l32i         a13, a11, 0x1c4 /* [sdk_g_ic+0x1c4] */ #  68f: d22b71
            s32i         a15, a12, 28                          #  692: f97c
            s32i         a12, a13, 0 /* a12 -> [[sdk_g_ic+0x1c4]] */ #  694: c90d
            s32i         a10, a11, 0x1c4 /* a10 -> [sdk_g_ic+0x1c4] */ #  696: a26b71
.Lbr042:    l32i         a12, sp, 32 /* [(local5)] */          #  699: c881
            l32i         a13, sp, 36 /* [(local6)] */          #  69b: d891
            l32i         a14, sp, 40 /* [(local7)] */          #  69d: e8a1
            l32i         a15, sp, 44 /* [(local8)] */          #  69f: f8b1
            l32i         a0, sp, 28 /* [(local4)] */           #  6a1: 0871
            addi         sp, sp, 48 /* (top of frame) */       #  6a3: 12c130
            ret                                                #  6a6: 0df0
.Lbr043:    j            .Lbr040                               #  6a8: 86f1ff

            .literal_position                                  #  6ac: f2ff0000
                                                               #  6b0: e8ff0000
                                                               #  6b4: 00000000
                                                               #  6b8: 00000000
                                                               #  6bc: 00000000
                                                               #  6c0: 00000000
                                                               #  6c4: 00000000
                                                               #  6c8: 00000000
                                                               #  6cc: 00000000
                                                               #  6d0: 00000000
                                                               #  6d4: 00000000
                                                               #  6d8: 00000000

# Function @ .irom0.text+0x6dc
# Local variables/stack:
#     (local0):  byte[12]  @ -0x40
#     (local1):  hword[2]  @ -0x34
#     (local2):  word      @ -0x30
#     (local3):  word      @ -0x2c
#     (local4):  word      @ -0x28
#     (local5):  word      @ -0x24
#     (local6):  word      @ -0x20
#     (local7):  word      @ -0x1c
#     (local8):  word      @ -0x18
#     (local9):  word      @ -0x14
#     (local10): word      @ -0x10
#     (local11): word[3]   @ -0xc
.Lfunc001:  movi         a4, 14 /* 0x0000000e */               #  6dc: 0ce4
            addi         sp, sp, -64 /* (local0) */            #  6de: 12c1c0
            s32i         a2, sp, 52 /* arg0 -> [(local11)] */  #  6e1: 29d1
            s32i         a0, sp, 20 /* a0 -> [(local3)] */     #  6e3: 0951
            s32i         a12, sp, 36 /* a12 -> [(local7)] */   #  6e5: c991
            s32i         a14, sp, 44 /* a14 -> [(local9)] */   #  6e7: e9b1
            s32i         a15, sp, 48 /* a15 -> [(local10)] */  #  6e9: f9c1
            s32i         a13, sp, 40 /* a13 -> [(local8)] */   #  6eb: d9a1
            mov          a15, a2 /* arg0 */                    #  6ed: fd02
            l32i         a13, a2, 136 /* [arg0+0x88] */        #  6ef: d22222
            l8ui         a14, a2, 176 /* [arg0+0xb0] */        #  6f2: e202b0
            mov          a12, a3 /* arg1 */                    #  6f5: cd03
            l32i         a0, a2, 0 /* [arg0] */                #  6f7: 0802
            s32i         a0, sp, 16 /* [arg0] -> [(local2)] */ #  6f9: 0941
            l32i         a3, a3, 4 /* [arg1+0x4] */            #  6fb: 3813
            slli         a14, a14, 24                          #  6fd: 80ee01
            l32i         a3, a3, 4 /* [[arg1+0x4]+0x4] */      #  700: 3813
            srai         a14, a14, 24                          #  702: e0e831
            mov          a2, sp /* (local0) */                 #  705: 2d01
            call0        memcpy                                #  707: 01ecffc0
                                                               #  70b: 0000
            movi         a7, 2 /* 0x00000002 */                #  70d: 0c27
            movi         a6, 0x0000fff2                        #  70f: 61e7ff
            l32i         a3, a12, 4 /* [arg1+0x4] */           #  712: 381c
            l16ui        a4, a12, 22 /* [arg1+0x16] */         #  714: 421c0b
            l32i         a5, a3, 4 /* [[arg1+0x4]+0x4] */      #  717: 5813
            add          a4, a4, a6 /* [arg1+0x16]+0xfff2 */   #  719: 6a44
            addi         a5, a5, 14 /* [[arg1+0x4]+0x4]+0xe */ #  71b: eb55
            s32i         a5, a3, 4 /* [[arg1+0x4]+0x4]+0xe -> [[arg1+0x4]+0x4] */ #  71d: 5913
            s16i         a4, a12, 22 /* [arg1+0x16]+0xfff2 -> [arg1+0x16] */ #  71f: 425c0b
            movi         a4, 0 /* 0x00000000 */                #  722: 0c04
            bnei         a14, 1, .Lbr044                       #  724: 661e1a
            l8ui         a9, sp, 0 /* [(local0)] */            #  727: 920100
            bbci         a9, 0, .Lbr044                        #  72a: 076914
            l32i         a11, a12, 32 /* [arg1+0x20] */        #  72d: b88c
            l32i         a0, a11, 0 /* [[arg1+0x20]] */        #  72f: 080b
            extui        a10, a0, 0, 6                         #  731: 00a054
            srli         a0, a0, 6                             #  734: 000641
            or           a0, a0, a7                            #  737: 700020
            slli         a0, a0, 6                             #  73a: a00011
            or           a10, a10, a0                          #  73d: 00aa20
            s32i         a10, a11, 0 /* a10 -> [[arg1+0x20]] */ #  740: a90b
.Lbr044:    movi         a0, 0 /* 0x00000000 */                #  742: 0c00
            movi         a11, -86 /* 0xffffffaa */             #  744: b2afaa
            movi         a9, 26 /* 0x0000001a */               #  747: 1ca9
            movi         a8, 24 /* 0x00000018 */               #  749: 1c88
            s32i         a4, sp, 32 /* 0x00000000 -> [(local6)] */ #  74b: 4981
            l32i         a2, a13, 8 /* [[arg0+0x88]+0x8] */    #  74d: 282d
            movi         a4, 170 /* 0x000000aa */              #  74f: 42a0aa
            bbci         a2, 1, .Lbr045                        #  752: 17620a
            l32i         a5, a12, 32 /* [arg1+0x20] */         #  755: 588c
            l32i         a5, a5, 0 /* [[arg1+0x20]] */         #  757: 5805
            movi         a6, 1 /* 0x00000001 */                #  759: 0c16
            bbsi         a5, 8, .Lbr045                        #  75b: 87e501
            s32i         a6, sp, 32 /* 0x00000001 -> [(local6)] */ #  75e: 6981
.Lbr045:    movi         a5, 3 /* 0x00000003 */                #  760: 0c35
            l32i         a10, sp, 32 /* [(local6)] */          #  762: a881
            l16ui        a6, a12, 22 /* [arg1+0x16] */         #  764: 621c0b
            movnez       a8, a9, a10                           #  767: a08993
            addi         a6, a6, 8 /* [arg1+0x16]+0x8 */       #  76a: 8b66
            l32i         a10, a3, 4 /* [[arg1+0x4]+0x4] */     #  76c: a813
            s16i         a8, a12, 20 /* a8 -> [arg1+0x14] */   #  76e: 825c0a
            addi         a2, a10, -8 /* [[arg1+0x4]+0x4]-0x8 */ #  771: 22caf8
            s32i         a2, a3, 4 /* [[arg1+0x4]+0x4]-0x8 -> [[arg1+0x4]+0x4] */ #  774: 2913
            addi         a10, a10, -2 /* [[arg1+0x4]+0x4]-0x2 */ #  776: a2cafe
            s16i         a6, a12, 22 /* [arg1+0x16]+0x8 -> [arg1+0x16] */ #  779: 625c0b
            movi         a6, 8 /* 0x00000008 */                #  77c: 0c86
            s8i          a11, a2, 1 /* 0xaa -> [[[arg1+0x4]+0x4]-0x7] */ #  77e: b24201
            s8i          a4, a2, 0 /* 0xaa -> [[[arg1+0x4]+0x4]-0x8] */ #  781: 424200
            s8i          a5, a2, 2 /* 0x03 -> [[[arg1+0x4]+0x4]-0x6] */ #  784: 524202
            s8i          a0, a2, 3 /* 0x00 -> [[[arg1+0x4]+0x4]-0x5] */ #  787: 024203
            s8i          a0, a2, 4 /* 0x00 -> [[[arg1+0x4]+0x4]-0x4] */ #  78a: 024204
            s8i          a0, a2, 5 /* 0x00 -> [[[arg1+0x4]+0x4]-0x3] */ #  78d: 024205
            l32i         a8, a13, 8 /* [[arg0+0x88]+0x8] */    #  790: 882d
            l16ui        a9, sp, 12 /* [(local1)] */           #  792: 921106
            s8i          a9, a10, 0 /* [(local1)] -> [[[arg1+0x4]+0x4]-0x2] */ #  795: 924a00
            srli         a9, a9, 8                             #  798: 909841
            s8i          a9, a10, 1 /* a9 -> [[[arg1+0x4]+0x4]-0x1] */ #  79b: 924a01
            bbci         a8, 0, .Lbr046                        #  79e: 076820
            l32i         a11, a15, 72 /* [arg0+0x48] */        #  7a1: b22f12
            bbci         a11, 4, .Lbr046                       #  7a4: 476b1a
            l32i         a2, a12, 32 /* [arg1+0x20] */         #  7a7: 288c
            l32i         a2, a2, 0 /* [[arg1+0x20]] */         #  7a9: 2802
            bbci         a2, 8, .Lbr050                        #  7ab: 87625e
            l32i         a3, a12, 4 /* [arg1+0x4] */           #  7ae: 381c
            l32i         a4, a3, 4 /* [[arg1+0x4]+0x4] */      #  7b0: 4813
            memw                                               #  7b2: c02000
            l8ui         a4, a4, 14 /* [[[arg1+0x4]+0x4]+0xe] */ #  7b5: 42040e
            movi         a5, 0 /* 0x00000000 */                #  7b8: 0c05
            bbci         a4, 3, .Lbr050                        #  7ba: 37644f
            s32i         a5, sp, 28 /* 0x00000000 -> [(local5)] */ #  7bd: 5971
            j            .Lbr047                               #  7bf: c60000
.Lbr046:    s32i         a0, sp, 28 /* 0x00000000 -> [(local5)] */ #  7c2: 0971
            l32i         a3, a12, 4 /* [arg1+0x4] */           #  7c4: 381c
.Lbr047:    movi         a2, 0x0000ffe8                        #  7c6: 21baff
            l16ui        a10, a12, 22 /* [arg1+0x16] */        #  7c9: a21c0b
            l32i         a11, a3, 4 /* [[arg1+0x4]+0x4] */     #  7cc: b813
            addi         a10, a10, 24 /* [arg1+0x16]+0x18 */   #  7ce: a2ca18
            add          a10, a10, a2 /* [arg1+0x16]+0x10000 */ #  7d1: 2aaa
            addi         a11, a11, -24 /* [[arg1+0x4]+0x4]-0x18 */ #  7d3: b2cbe8
            s32i         a11, a3, 4 /* [[arg1+0x4]+0x4]-0x18 -> [[arg1+0x4]+0x4] */ #  7d6: b913
            s32i         a11, a12, 16 /* [[arg1+0x4]+0x4]-0x18 -> [arg1+0x10] */ #  7d8: b94c
            l32i         a9, a3, 4 /* [[arg1+0x4]+0x4] */      #  7da: 9813
            s32i         a9, sp, 24 /* [[arg1+0x4]+0x4] -> [(local4)] */ #  7dc: 9961
            s16i         a10, a12, 22 /* [arg1+0x16]+0x10000 -> [arg1+0x16] */ #  7de: a25c0b
            s8i          a6, a9, 0 /* 0x08 -> [[[arg1+0x4]+0x4]] */ #  7e1: 624900
            s16i         a0, a9, 2 /* 0x0000 -> [[[arg1+0x4]+0x4]+0x2] */ #  7e4: 025901
            beqz         a14, .Lbr051                          #  7e7: bc9e
            addi         a2, a14, -1                           #  7e9: 0b2e
            beqz         a2, .Lbr061                           #  7eb: 16c213
            beqz         a12, .Lbr048                          #  7ee: 8c8c
            mov          a2, a12 /* arg1 */                    #  7f0: 2d0c
            movi         a3, 1 /* 0x00000001 */                #  7f2: 0c13
            call0        sdk_esf_buf_recycle                   #  7f4: 01b2ffc0
                                                               #  7f8: 0000
.Lbr048:    movi         a12, 0 /* 0x00000000 */               #  7fa: 0c0c
.Lbr049:    l32i         a0, sp, 20 /* [(local3)] */           #  7fc: 0851
            l32i         a13, sp, 40 /* [(local8)] */          #  7fe: d8a1
            l32i         a14, sp, 44 /* [(local9)] */          #  800: e8b1
            mov          a2, a12                               #  802: 2d0c
            l32i         a15, sp, 48 /* [(local10)] */         #  804: f8c1
            l32i         a12, sp, 36 /* [(local7)] */          #  806: c891
            addi         sp, sp, 64 /* (top of frame) */       #  808: 12c140
            ret                                                #  80b: 0df0
.Lbr050:    mov          a2, a15 /* arg0 */                    #  80d: 2d0f
            mov          a3, a12 /* arg1 */                    #  80f: 3d0c
            call0        sdk_ieee80211_crypto_encap            #  811: 01abffc0
                                                               #  815: 0000
            movi         a0, 0 /* 0x00000000 */                #  817: 0c00
            movi         a6, 8 /* 0x00000008 */                #  819: 0c86
            movi         a7, 2 /* 0x00000002 */                #  81b: 0c27
            s32i         a2, sp, 28 /* a2 -> [(local5)] */     #  81d: 2971
            l32i         a3, a12, 4 /* [arg1+0x4] */           #  81f: 381c
            j            .Lbr047                               #  821: 46e8ff
.Lbr051:    movi         a14, 0 /* 0x00000000 */               #  824: 0c0e
            l32i         a2, sp, 24 /* [(local4)] */           #  826: 2861
            movi         a3, 1 /* 0x00000001 */                #  828: 0c13
            movi         a4, 6 /* 0x00000006 */                #  82a: 0c64
            s8i          a3, a2, 1 /* 0x01 -> [[(local4)]+0x1] */ #  82c: 324201
            addi         a2, a2, 4 /* [(local4)]+0x4 */        #  82f: 4b22
            mov          a3, a13 /* [arg0+0x88] */             #  831: 3d0d
            call0        memcpy                                #  833: 01a4ffc0
                                                               #  837: 0000
            addi         a3, sp, 6 /* (FP)-0x3a */             #  839: 6b31
            l32i         a2, sp, 24 /* [(local4)] */           #  83b: 2861
            movi         a4, 6 /* 0x00000006 */                #  83d: 0c64
            addi         a2, a2, 10 /* [(local4)]+0xa */       #  83f: ab22
            call0        memcpy                                #  841: 01a1ffc0
                                                               #  845: 0000
            mov          a3, sp /* (local0) */                 #  847: 3d01
            l32i         a2, sp, 24 /* [(local4)] */           #  849: 2861
            movi         a4, 6 /* 0x00000006 */                #  84b: 0c64
            addi         a2, a2, 16 /* [(local4)]+0x10 */      #  84d: 22c210
            call0        memcpy                                #  850: 019fffc0
                                                               #  854: 0000
.Lbr052:    l32i         a3, a12, 32 /* [arg1+0x20] */         #  856: 388c
            movi         a6, 32 /* 0x00000020 */               #  858: 2c06
            l32i         a3, a3, 0 /* [[arg1+0x20]] */         #  85a: 3803
            movi         a8, 128 /* 0x00000080 */              #  85c: 82a080
            bbci         a3, 22, .Lbr053                       #  85f: 67730a
            l32i         a5, sp, 24 /* [(local4)] */           #  862: 5861
            l8ui         a4, a5, 1 /* [[(local4)]+0x1] */      #  864: 420501
            or           a4, a4, a6                            #  867: 604420
            s8i          a4, a5, 1 /* a4 -> [[(local4)]+0x1] */ #  86a: 424501
.Lbr053:    l32i         a5, sp, 32 /* [(local6)] */           #  86d: 5881
            beqz         a5, .Lbr064                           #  86f: 16e50f
            l32i         a0, a12, 32 /* [arg1+0x20] */         #  872: 088c
            l8ui         a0, a0, 6 /* [[arg1+0x20]+0x6] */     #  874: 020006
            extui        a0, a0, 4, 3                          #  877: 000424
            beqz         a0, .Lbr055                           #  87a: 9c30
            bnei         a0, 1, .Lbr054                        #  87c: 661004
            movi         a3, 5 /* 0x00000005 */                #  87f: 0c53
            j            .Lbr056                               #  881: 860300
.Lbr054:    addi         a4, a0, -3                            #  884: 42c0fd
            movi         a2, 1 /* 0x00000001 */                #  887: 0c12
            movi         a3, 0 /* 0x00000000 */                #  889: 0c03
            moveqz       a3, a2, a4                            #  88b: 403283
            j            .Lbr056                               #  88e: 460000
.Lbr055:    movi         a3, 6 /* 0x00000006 */                #  891: 0c63
.Lbr056:    addx2        a5, a0, a0                            #  893: 005090
            addx2        a5, a5, a13                           #  896: d05590
            extui        a0, a3, 0, 4                          #  899: 300034
            s8i          a0, a14, 0 /* a0 -> [0x00000000] */   #  89c: 024e00
            l8ui         a5, a5, 93                            #  89f: 52055d
            beqz         a5, .Lbr057                           #  8a2: 8c45
            or           a7, a0, a6                            #  8a4: 607020
            s8i          a7, a14, 0 /* a7 -> [0x00000000] */   #  8a7: 724e00
.Lbr057:    l32i         a0, sp, 24 /* [(local4)] */           #  8aa: 0861
            s8i          a14, a14, 1 /* 0x00 -> [0x00000001] */ #  8ac: e24e01
            l8ui         a11, a0, 0 /* [[(local4)]] */         #  8af: b20000
            addx2        a10, a3, a13                          #  8b2: d0a390
            or           a11, a11, a8                          #  8b5: 80bb20
            s8i          a11, a0, 0 /* a11 -> [[(local4)]] */  #  8b8: b24000
            l16ui        a3, a10, 124                          #  8bb: 321a3e
            addi         a9, a3, 1                             #  8be: 1b93
            s16i         a9, a10, 124                          #  8c0: 925a3e
.Lbr058:    movi         a9, 240 /* 0x000000f0 */              #  8c3: 92a0f0
            l32i         a13, sp, 28 /* [(local5)] */          #  8c6: d871
            slli         a14, a3, 4                            #  8c8: c0e311
            l32i         a0, sp, 24 /* [(local4)] */           #  8cb: 0861
            movi         a3, sdk_g_ic                          #  8cd: 3179ff
            s16i         a14, a0, 22 /* a14 -> [[(local4)]+0x16] */ #  8d0: e2500b
            beqz         a13, .Lbr063                          #  8d3: 16fd08
            movi         a6, 1 /* 0x00000001 */                #  8d6: 0c16
            l32i         a11, sp, 24 /* [(local4)] */          #  8d8: b861
            l32i         a7, sp, 28 /* [(local5)] */           #  8da: 7871
            l8ui         a10, a11, 1 /* [[(local4)]+0x1] */    #  8dc: a20b01
            movi         a13, 64 /* 0x00000040 */              #  8df: 4c0d
            or           a10, a10, a13                         #  8e1: d0aa20
            s8i          a10, a11, 1 /* a10 -> [[(local4)]+0x1] */ #  8e4: a24b01
            l32i         a0, a12, 32 /* [arg1+0x20] */         #  8e7: 088c
            l32i         a2, a3, 20 /* [sdk_g_ic+0x14] */      #  8e9: 2853
            l32i         a5, a0, 0 /* [[arg1+0x20]] */         #  8eb: 5800
            l16ui        a7, a7, 0 /* [[(local5)]] */          #  8ed: 721700
            extui        a4, a5, 0, 6                          #  8f0: 504054
            srli         a5, a5, 6                             #  8f3: 505641
            or           a5, a5, a6                            #  8f6: 605520
            slli         a5, a5, 6                             #  8f9: a05511
            or           a4, a4, a5                            #  8fc: 504420
            s32i         a4, a0, 0 /* a4 -> [[arg1+0x20]] */   #  8ff: 4900
            bne          a2, a15, .Lbr062                      #  901: f7925c
            or           a5, a7, a8                            #  904: 805720
.Lbr059:    l32i         a4, sp, 28 /* [(local5)] */           #  907: 4871
            s8i          a5, a0, 12 /* a5 -> [[arg1+0x20]+0xc] */ #  909: 52400c
            l32i         a4, a4, 152 /* [[(local5)]+0x98] */   #  90c: 422426
            l8ui         a2, a0, 13 /* [[arg1+0x20]+0xd] */    #  90f: 22000d
            l32i         a4, a4, 0 /* [[[(local5)]+0x98]] */   #  912: 4804
            and          a2, a2, a9                            #  914: 902210
            extui        a4, a4, 0, 4                          #  917: 404034
            or           a2, a2, a4                            #  91a: 402220
.Lbr060:    s8i          a2, a0, 13 /* a2 -> [[arg1+0x20]+0xd] */ #  91d: 22400d
            l32i         a6, a12, 32 /* [arg1+0x20] */         #  920: 688c
            l8ui         a5, a3, 124 /* [sdk_g_ic+0x7c] */     #  922: 52037c
            s8i          a5, a6, 8 /* [sdk_g_ic+0x7c] -> [[arg1+0x20]+0x8] */ #  925: 524608
            j            .Lbr049                               #  928: 06b4ff
.Lbr061:    l32i         a14, sp, 16 /* [(local2)] */          #  92b: e841
            mov          a3, sp /* (local0) */                 #  92d: 3d01
            l32i         a2, sp, 24 /* [(local4)] */           #  92f: 2861
            movi         a4, 6 /* 0x00000006 */                #  931: 0c64
            s8i          a7, a2, 1 /* 0x02 -> [[(local4)]+0x1] */ #  933: 724201
            addi         a2, a2, 4 /* [(local4)]+0x4 */        #  936: 4b22
            call0        memcpy                                #  938: 0166ffc0
                                                               #  93c: 0000
            addi         a3, a14, 41 /* [(local2)]+0x29 */     #  93e: 32ce29
            l32i         a2, sp, 24 /* [(local4)] */           #  941: 2861
            movi         a4, 6 /* 0x00000006 */                #  943: 0c64
            addi         a2, a2, 10 /* [(local4)]+0xa */       #  945: ab22
            call0        memcpy                                #  947: 0163ffc0
                                                               #  94b: 0000
            movi         a14, 0 /* 0x00000000 */               #  94d: 0c0e
            addi         a3, sp, 6 /* (FP)-0x3a */             #  94f: 6b31
            l32i         a2, sp, 24 /* [(local4)] */           #  951: 2861
            movi         a4, 6 /* 0x00000006 */                #  953: 0c64
            addi         a2, a2, 16 /* [(local4)]+0x10 */      #  955: 22c210
            call0        memcpy                                #  958: 0160ffc0
                                                               #  95c: 0000
            j            .Lbr052                               #  95e: 06bdff
.Lbr062:    mov          a5, a7 /* [[(local5)]] */             #  961: 5d07
            j            .Lbr059                               #  963: 06e8ff
.Lbr063:    l32i         a0, a12, 32 /* [arg1+0x20] */         #  966: 088c
            l8ui         a2, a0, 13 /* [[arg1+0x20]+0xd] */    #  968: 22000d
            and          a2, a2, a9                            #  96b: 902210
            j            .Lbr060                               #  96e: c6eaff
.Lbr064:    l16ui        a3, a13, 156 /* [[arg0+0x88]+0x9c] */ #  971: 321d4e
            addi         a4, a3, 1 /* [[arg0+0x88]+0x9c]+0x1 */ #  974: 1b43
            s16i         a4, a13, 156 /* [[arg0+0x88]+0x9c]+0x1 -> [[arg0+0x88]+0x9c] */ #  976: 425d4e
            j            .Lbr058                               #  979: 86d1ff

            .literal_position                                  #  97c: 888e0000
                                                               #  980: 00000000

# Function @ .irom0.text+0x984
.Lfunc002:  l32i         a6, a3, 4 /* [arg1+0x4] */            #  984: 6813
            movi         a4, 0x00008e88                        #  986: 41fdff
            l8ui         a5, a6, 13 /* [[arg1+0x4]+0xd] */     #  989: 52060d
            l8ui         a7, a6, 12 /* [[arg1+0x4]+0xc] */     #  98c: 72060c
            slli         a5, a5, 8                             #  98f: 805511
            or           a3, a5, a7                            #  992: 703520
            bne          a3, a4, .Lbr065                       #  995: 479304
            movi         a3, 0 /* 0x00000000 */                #  998: 0c03
            j            .Lbr066                               #  99a: 860100
.Lbr065:    l32i         a7, a2, 8 /* [arg0+0x8] */            #  99d: 7822
            bbsi         a7, 1, .Lbr067                        #  99f: 17e705
            movi         a3, 2 /* 0x00000002 */                #  9a2: 0c23
.Lbr066:    mov          a2, a3                                #  9a4: 2d03
            ret                                                #  9a6: 0df0
.Lbr067:    bnei         a3, 8, .Lbr068                        #  9a8: 668317
            l8ui         a5, a6, 14 /* [[arg1+0x4]+0xe] */     #  9ab: 52060e
            srli         a5, a5, 5                             #  9ae: 505541
            beqz         a5, .Lbr072                           #  9b1: acf5
            beqi         a5, 3, .Lbr072                        #  9b3: 26352d
            bltui        a5, 3, .Lbr071                        #  9b6: b63525
            movi         a3, 1 /* 0x00000001 */                #  9b9: 0c13
            bltui        a5, 6, .Lbr069                        #  9bb: b66506
            movi         a3, 0 /* 0x00000000 */                #  9be: 0c03
            j            .Lbr069                               #  9c0: 460000
.Lbr068:    movi         a3, 2 /* 0x00000002 */                #  9c3: 0c23
.Lbr069:    movi         a5, .Ldata001                         #  9c5: 51eeff
.Lbr070:    beqi         a3, 3, .Lbr066                        #  9c8: 2633d8
            addx2        a6, a3, a3                            #  9cb: 306390
            addx2        a6, a6, a2                            #  9ce: 206690
            l8ui         a6, a6, 88                            #  9d1: 620658
            beqz         a6, .Lbr066                           #  9d4: 16c6fc
            add          a3, a3, a5                            #  9d7: 5a33
            l8ui         a3, a3, 0                             #  9d9: 320300
            j            .Lbr070                               #  9dc: 06faff
.Lbr071:    movi         a3, 3 /* 0x00000003 */                #  9df: 0c33
            j            .Lbr069                               #  9e1: 06f8ff
.Lbr072:    movi         a3, 2 /* 0x00000002 */                #  9e4: 0c23
            j            .Lbr069                               #  9e6: c6f6ff

            .literal_position                                  #  9ec: 00000000

# Function @ .irom0.text+0x9f0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .global      sdk_ieee80211_add_rates
            .type        sdk_ieee80211_add_rates, @function
sdk_ieee80211_add_rates:
            addi         sp, sp, -16 /* (local0) */            #  9f0: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  9f3: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  9f5: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  9f7: 0901
            mov          a12, a2 /* arg0 */                    #  9f9: cd02
            movi         a0, 1 /* 0x00000001 */                #  9fb: 0c10
            s8i          a0, a2, 0 /* 0x01 -> [arg0] */        #  9fd: 024200
            l8ui         a0, a3, 0 /* [arg1] */                #  a00: 020300
            movi         a13, 8 /* 0x00000008 */               #  a03: 0c8d
            blt          a13, a0, .Lbr073                      #  a05: 072d01
            mov          a13, a0 /* [arg1] */                  #  a08: dd00
.Lbr073:    s8i          a13, a12, 1 /* a13 -> [arg0+0x1] */   #  a0a: d24c01
            addi         a3, a3, 1 /* arg1+0x1 */              #  a0d: 1b33
            addi         a2, a12, 2 /* arg0+0x2 */             #  a0f: 2b2c
            mov          a4, a13                               #  a11: 4d0d
            call0        memcpy                                #  a13: 01f6ffc0
                                                               #  a17: 0000
            add          a2, a13, a12                          #  a19: ca2d
            l32i         a0, sp, 0 /* [(local0)] */            #  a1b: 0801
            l32i         a12, sp, 4 /* [(local1)] */           #  a1d: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  a1f: d821
            addi         a2, a2, 2                             #  a21: 2b22
            addi         sp, sp, 16 /* (top of frame) */       #  a23: 12c110
            ret                                                #  a26: 0df0

            .literal_position                                  #  a28: 00000000

# Function @ .irom0.text+0xa2c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .global      sdk_ieee80211_add_xrates
            .type        sdk_ieee80211_add_xrates, @function
sdk_ieee80211_add_xrates:
            addi         sp, sp, -16 /* (local0) */            #  a2c: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  a2f: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  a31: 0911
            mov          a12, a2 /* arg0 */                    #  a33: cd02
            l8ui         a0, a3, 0 /* [arg1] */                #  a35: 020300
            movi         a2, 8 /* 0x00000008 */                #  a38: 0c82
            bgeu         a2, a0, .Lbr074                       #  a3a: 07b21c
            addi         a3, a3, 9 /* arg1+0x9 */              #  a3d: 9b33
            addi         a2, a12, 2 /* arg0+0x2 */             #  a3f: 2b2c
            movi         a5, 50 /* 0x00000032 */               #  a41: 3c25
            addi         a4, a0, -8 /* [arg1]-0x8 */           #  a43: 42c0f8
            s32i         a4, sp, 0 /* [arg1]-0x8 -> [(local0)] */ #  a46: 4901
            s8i          a5, a12, 0 /* 0x32 -> [arg0] */       #  a48: 524c00
            s8i          a4, a12, 1 /* [arg1]-0x8 -> [arg0+0x1] */ #  a4b: 424c01
            call0        memcpy                                #  a4e: 01f6ffc0
                                                               #  a52: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  a54: 0801
            add          a12, a0, a12                          #  a56: cac0
            addi         a12, a12, 2                           #  a58: 2bcc
.Lbr074:    mov          a2, a12                               #  a5a: 2d0c
            l32i         a0, sp, 4 /* [(local1)] */            #  a5c: 0811
            l32i         a12, sp, 8 /* [(local2)] */           #  a5e: c821
            addi         sp, sp, 16 /* (top of frame) */       #  a60: 12c110
            ret                                                #  a63: 0df0

            .literal_position                                  #  a68: 00000000

# Function @ .irom0.text+0xa6c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
.Lfunc003:  addi         sp, sp, -16 /* (local0) */            #  a6c: 12c1f0
            s8i          a4, a2, 1 /* arg2 -> [arg0+0x1] */    #  a6f: 424201
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  a72: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  a74: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  a76: c911
            mov          a13, a2 /* arg0 */                    #  a78: dd02
            mov          a12, a4 /* arg2 */                    #  a7a: cd04
            movi         a0, 0 /* 0x00000000 */                #  a7c: 0c00
            s8i          a0, a2, 0 /* 0x00 -> [arg0] */        #  a7e: 024200
            beqz         a4, .Lbr075                           #  a81: 8c64
            addi         a2, a2, 2 /* arg0+0x2 */              #  a83: 2b22
            call0        memcpy                                #  a85: 01f8ffc0
                                                               #  a89: 0000
.Lbr075:    add          a2, a13, a12                          #  a8b: ca2d
            l32i         a0, sp, 0 /* [(local0)] */            #  a8d: 0801
            l32i         a12, sp, 4 /* [(local1)] */           #  a8f: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  a91: d821
            addi         a2, a2, 2                             #  a93: 2b22
            addi         sp, sp, 16 /* (top of frame) */       #  a95: 12c110
            ret                                                #  a98: 0df0

            .balign      4
# Function @ .irom0.text+0xa9c
.Lfunc004:  movi         a5, 1 /* 0x00000001 */                #  a9c: 0c15
            movi         a4, 42 /* 0x0000002a */               #  a9e: 2ca4
            s8i          a4, a2, 0 /* 0x2a -> [arg0] */        #  aa0: 424200
            s8i          a5, a2, 1 /* 0x01 -> [arg0+0x1] */    #  aa3: 524201
            l32i         a5, a3, 28 /* [arg1+0x1c] */          #  aa6: 5873
            movi         a3, 2 /* 0x00000002 */                #  aa8: 0c23
            bbci         a5, 20, .Lbr076                       #  aaa: 477502
            j            .Lbr077                               #  aad: 460000
.Lbr076:    movi         a3, 0 /* 0x00000000 */                #  ab0: 0c03
.Lbr077:    bbci         a5, 21, .Lbr078                       #  ab2: 577504
            movi         a6, 4 /* 0x00000004 */                #  ab5: 0c46
            or           a3, a3, a6                            #  ab7: 603320
.Lbr078:    s8i          a3, a2, 2 /* a3 -> [arg0+0x2] */      #  aba: 324202
            addi         a2, a2, 3 /* arg0+0x3 */              #  abd: 3b22
            ret           /* arg0+0x3 */                       #  abf: 0df0

            .literal_position                                  #  ac4: 00000000
                                                               #  ac8: 00000000
                                                               #  acc: 00000000
                                                               #  ad0: 00000000
                                                               #  ad4: ff0f00ff
                                                               #  ad8: 000af23f
                                                               #  adc: 00000000
                                                               #  ae0: 00000000
                                                               #  ae4: 00000000
                                                               #  ae8: 00000000
                                                               #  aec: 00000000

# Function @ .irom0.text+0xaf0
# Local variables/stack:
#     (local0):  word[4]   @ -0x40
#     (local1):  word      @ -0x30
#     (local2):  word      @ -0x2c
#     (local3):  word      @ -0x28
#     (local4):  word      @ -0x24
#     (local5):  word      @ -0x20
#     (local6):  word      @ -0x1c
#     (local7):  word      @ -0x18
#     (local8):  word      @ -0x14
#     (local9):  word      @ -0x10
#     (local10): word      @ -0xc
#     (local11): word[2]   @ -0x8
            .global      sdk_ieee80211_send_probereq
            .type        sdk_ieee80211_send_probereq, @function
sdk_ieee80211_send_probereq:
            addi         sp, sp, -64 /* (local0) */            #  af0: 12c1c0
            s32i         a12, sp, 52 /* a12 -> [(local10)] */  #  af3: c9d1
            s32i         a3, sp, 36 /* arg1 -> [(local6)] */   #  af5: 3991
            s32i         a5, sp, 28 /* arg3 -> [(local4)] */   #  af7: 5971
            s32i         a6, sp, 24 /* arg4 -> [(local3)] */   #  af9: 6961
            s32i         a7, sp, 20 /* arg5 -> [(local2)] */   #  afb: 7951
            s32i         a0, sp, 48 /* a0 -> [(local9)] */     #  afd: 09c1
            movi         a0, sdk_g_ic                          #  aff: 01f1ff
            s32i         a4, sp, 32 /* arg2 -> [(local5)] */   #  b02: 4981
            l32i         a2, a0, 0x168 /* [sdk_g_ic+0x168] */  #  b04: 22205a
            l32i         a9, a0, 16 /* [sdk_g_ic+0x10] */      #  b07: 9840
            bnez         a2, .Lbr079                           #  b09: cc32
            movi         a4, 53 /* 0x00000035 */               #  b0b: 3c54
            j            .Lbr080                               #  b0d: 460100
.Lbr079:    l16ui        a4, a2, 0 /* [[sdk_g_ic+0x168]] */    #  b10: 421200
            addi         a4, a4, 53 /* [[sdk_g_ic+0x168]]+0x35 */ #  b13: 42c435
.Lbr080:    addi         a2, sp, 16 /* (local1) */             #  b16: 22c110
            movi         a3, 24 /* 0x00000018 */               #  b19: 1c83
            s32i         a9, sp, 44 /* [sdk_g_ic+0x10] -> [(local8)] */ #  b1b: 99b1
            call0        sdk_ieee80211_getmgtframe             #  b1d: 01f0ffc0
                                                               #  b21: 0000
            mov          a12, a2                               #  b23: cd02
            bnez         a2, .Lbr083                           #  b25: dcc2
            movi         a2, sdk_g_ic                          #  b27: 21e8ff
            l32i         a2, a2, 0x168 /* [sdk_g_ic+0x168] */  #  b2a: 22225a
            movi         a3, 0 /* 0x00000000 */                #  b2d: 0c03
            bnez         a2, .Lbr081                           #  b2f: cc12
            j            .Lbr082                               #  b31: 860000
.Lbr081:    l16ui        a3, a2, 0 /* [[sdk_g_ic+0x168]] */    #  b34: 321200
.Lbr082:    movi         a2, .Lstr001                          #  b37: 21e5ff
            call0        printf                                #  b3a: 01eaffc0
                                                               #  b3e: 0000
            movi         a2, 1 /* 0x00000001 */                #  b40: 0c12
            j            .Lbr085                               #  b42: 464f00
.Lbr083:    movi         a3, 24 /* 0x00000018 */               #  b45: 1c83
            l32i         a4, sp, 20 /* [(local2)] */           #  b47: 4851
            s16i         a3, a2, 20                            #  b49: 32520a
            l32i         a2, sp, 16 /* [(local1)] */           #  b4c: 2841
            l32i         a3, sp, 24 /* [(local3)] */           #  b4e: 3861
            call0        .Lfunc003                             #  b50: 85f1ff
            s32i         a2, sp, 16 /* a2 -> [(local1)] */     #  b53: 2941
            movi         a3, sdk_g_ic+0x2c                     #  b55: 31deff
            s32i         a3, sp, 40 /* sdk_g_ic+0x2c -> [(local7)] */ #  b58: 39a1
            call0        sdk_ieee80211_add_rates               #  b5a: 050000
            s32i         a2, sp, 16 /* a2 -> [(local1)] */     #  b5d: 2941
            l32i         a3, sp, 40 /* [(local7)] */           #  b5f: 38a1
            call0        sdk_ieee80211_add_xrates              #  b61: 050000
            l16ui        a8, a12, 20                           #  b64: 821c0a
            s32i         a2, sp, 16 /* a2 -> [(local1)] */     #  b67: 2941
            l32i         a7, a12, 4                            #  b69: 781c
            movi         a4, 0 /* 0x00000000 */                #  b6b: 0c04
            l32i         a9, a7, 4                             #  b6d: 9817
            s32i         a4, sp, 56 /* 0x00000000 -> [(local11)] */ #  b6f: 49e1
            add          a9, a8, a9                            #  b71: 9a98
            sub          a9, a2, a9                            #  b73: 9092c0
            s16i         a9, a12, 22                           #  b76: 925c0b
            movi         a3, 128 /* 0x00000080 */              #  b79: 32a080
            add          a8, a8, a9                            #  b7c: 9a88
            memw                                               #  b7e: c02000
            l8ui         a2, a7, 3                             #  b81: 220703
            extui        a2, a2, 0, 7                          #  b84: 202064
            or           a2, a2, a3                            #  b87: 302220
            memw                                               #  b8a: c02000
            s8i          a2, a7, 3                             #  b8d: 224703
            movi         a0, 191 /* 0x000000bf */              #  b90: 02a0bf
            movi         a4, 64 /* 0x00000040 */               #  b93: 4c04
            memw                                               #  b95: c02000
            l8ui         a11, a7, 3                            #  b98: b20703
            and          a11, a11, a0                          #  b9b: 00bb10
            or           a11, a11, a4                          #  b9e: 40bb20
            memw                                               #  ba1: c02000
            s8i          a11, a7, 3                            #  ba4: b24703
            movi         a10, 223 /* 0x000000df */             #  ba7: a2a0df
            memw                                               #  baa: c02000
            l8ui         a9, a7, 3                             #  bad: 920703
            and          a9, a9, a10                           #  bb0: a09910
            memw                                               #  bb3: c02000
            s8i          a9, a7, 3                             #  bb6: 924703
            extui        a8, a8, 0, 12                         #  bb9: 8080b4
            slli         a8, a8, 12                            #  bbc: 408811
            movi         a9, 0xff000fff                        #  bbf: 91c5ff
            memw                                               #  bc2: c02000
            l16ui        a6, a7, 2                             #  bc5: 621701
            slli         a6, a6, 16                            #  bc8: 006611
            memw                                               #  bcb: c02000
            l16ui        a10, a7, 0                            #  bce: a21700
            or           a6, a6, a10                           #  bd1: a06620
            and          a6, a6, a9                            #  bd4: 906610
            or           a6, a6, a8                            #  bd7: 806620
            memw                                               #  bda: c02000
            s16i         a6, a7, 0                             #  bdd: 625700
            extui        a6, a6, 16, 16                        #  be0: 6060f5
            memw                                               #  be3: c02000
            l32i         a2, sp, 44 /* [(local8)] */           #  be6: 28b1
            mov          a3, a12                               #  be8: 3d0c
            s16i         a6, a7, 2                             #  bea: 625701
            l32i         a5, sp, 28 /* [(local4)] */           #  bed: 5871
            l32i         a6, sp, 36 /* [(local6)] */           #  bef: 6891
            l32i         a7, sp, 32 /* [(local5)] */           #  bf1: 7881
            s32i         a5, sp, 0 /* [(local4)] -> [(local0)] */ #  bf3: 5901
            movi         a5, 16 /* 0x00000010 */               #  bf5: 1c05
            call0        sdk_ieee80211_send_setup              #  bf7: 050000
            movi         a7, 7 /* 0x00000007 */                #  bfa: 0c77
            movi         a3, 16 /* 0x00000010 */               #  bfc: 1c03
            l32i         a10, a12, 32                          #  bfe: a88c
            movi         a4, 143 /* 0x0000008f */              #  c00: 42a08f
            l32i         a11, a10, 0                           #  c03: b80a
            l8ui         a2, a10, 6                            #  c05: 220a06
            extui        a9, a11, 0, 6                         #  c08: b09054
            and          a2, a2, a4                            #  c0b: 402210
            srli         a11, a11, 6                           #  c0e: b0b641
            s8i          a2, a10, 6                            #  c11: 224a06
            l32i         a6, a12, 32                           #  c14: 688c
            or           a11, a11, a3                          #  c16: 30bb20
            slli         a11, a11, 6                           #  c19: a0bb11
            or           a9, a9, a11                           #  c1c: b09920
            s32i         a9, a10, 0                            #  c1f: 990a
            l8ui         a5, a6, 4                             #  c21: 520604
            movi         a8, 240 /* 0x000000f0 */              #  c24: 82a0f0
            and          a5, a5, a8                            #  c27: 805510
            or           a5, a5, a7                            #  c2a: 705520
            s8i          a5, a6, 4                             #  c2d: 524604
            l32i         a0, sp, 56 /* [(local11)] */          #  c30: 08e1
            movi         a4, 0x3ff20a00                        #  c32: 41a9ff
            l32i         a5, a12, 32                           #  c35: 588c
            memw                                               #  c37: c02000
            l32i         a4, a4, 0x200 /* [0x3ff20c00] */      #  c3a: 422480
            l8ui         a6, a5, 0                             #  c3d: 620500
            movi         a7, 254 /* 0x000000fe */              #  c40: 72a0fe
            and          a6, a6, a7                            #  c43: 706610
            s8i          a6, a5, 0                             #  c46: 624500
            l32i         a2, a12, 32                           #  c49: 288c
            s32i         a4, a5, 16                            #  c4b: 4945
            l8ui         a11, a2, 0                            #  c4d: b20200
            movi         a3, 253 /* 0x000000fd */              #  c50: 32a0fd
            and          a11, a11, a3                          #  c53: 30bb10
            s8i          a11, a2, 0                            #  c56: b24200
            l32i         a2, a12, 32                           #  c59: 288c
            l32i         a10, a2, 0                            #  c5b: a802
            bbci         a10, 7, .Lbr086                       #  c5d: 776a2b
.Lbr084:    movi         a5, 1 /* 0x00000001 */                #  c60: 0c15
            l8ui         a6, sp, 64 /* [(local12)] */          #  c62: 620140
            movi         a7, sdk_g_ic                          #  c65: 719dff
            s32i         a0, a12, 24                           #  c68: 096c
            l8ui         a7, a7, 125 /* [sdk_g_ic+0x7d] */     #  c6a: 72077d
            ssl          a6                                    #  c6d: 001640
            sll          a5, a5                                #  c70: 0055a1
            s8i          a7, a2, 8                             #  c73: 724208
            s8i          a5, a2, 14                            #  c76: 52420e
            mov          a2, a12                               #  c79: 2d0c
            call0        sdk_ppTxPkt                           #  c7b: 019bffc0
                                                               #  c7f: 0000
            movi         a2, 0 /* 0x00000000 */                #  c81: 0c02
.Lbr085:    l32i         a12, sp, 52 /* [(local10)] */         #  c83: c8d1
            l32i         a0, sp, 48 /* [(local9)] */           #  c85: 08c1
            addi         sp, sp, 64 /* (local12) */            #  c87: 12c140
            ret                                                #  c8a: 0df0
.Lbr086:    movi         a2, 0 /* 0x00000000 */                #  c8c: 0c02
            call0        sdk_rc_get_trc_by_index               #  c8e: 0197ffc0
                                                               #  c92: 0000
            mov          a0, a2                                #  c94: 0d02
            l32i         a2, a12, 32                           #  c96: 288c
            j            .Lbr084                               #  c98: 06f1ff

            .literal_position                                  #  c9c: 00000000

# Function @ .irom0.text+0xca0
            .global      sdk_ieee80211_getcapinfo
            .type        sdk_ieee80211_getcapinfo, @function
sdk_ieee80211_getcapinfo:
            movi         a7, 16 /* 0x00000010 */               #  ca0: 1c07
            l32i         a2, a2, 0 /* [arg0] */                #  ca2: 2802
            movi         a5, sdk_g_ic                          #  ca4: 51feff
            movi         a3, 1 /* 0x00000001 */                #  ca7: 0c13
            l32i         a5, a5, 20 /* [sdk_g_ic+0x14] */      #  ca9: 5855
            movi         a4, 0 /* 0x00000000 */                #  cab: 0c04
            l32i         a6, a5, 176 /* [[sdk_g_ic+0x14]+0xb0] */ #  cad: 62252c
            l32i         a5, a5, 72 /* [[sdk_g_ic+0x14]+0x48] */ #  cb0: 522512
            addi         a6, a6, -1 /* [[sdk_g_ic+0x14]+0xb0]-0x1 */ #  cb3: 0b66
            moveqz       a4, a3, a6                            #  cb5: 604383
            bbci         a5, 4, .Lbr087                        #  cb8: 476505
            or           a4, a4, a7                            #  cbb: 704420
            extui        a4, a4, 0, 16                         #  cbe: 4040f4
.Lbr087:    bbci         a5, 18, .Lbr088                       #  cc1: 27750a
            bbci         a2, 7, .Lbr088                        #  cc4: 776207
            movi         a6, 32 /* 0x00000020 */               #  cc7: 2c06
            or           a4, a4, a6                            #  cc9: 604420
            extui        a4, a4, 0, 16                         #  ccc: 4040f4
.Lbr088:    movi         a6, 1024 /* 0x00000400 */             #  ccf: 62a400
            bbci         a5, 10, .Lbr089                       #  cd2: a76505
            or           a4, a4, a6                            #  cd5: 604420
            extui        a4, a4, 0, 16                         #  cd8: 4040f4
.Lbr089:    movi         a6, 256 /* 0x00000100 */              #  cdb: 62a100
            bbci         a2, 8, .Lbr090                        #  cde: 876208
            bbci         a5, 30, .Lbr090                       #  ce1: e77505
            or           a4, a4, a6                            #  ce4: 604420
            extui        a4, a4, 0, 16                         #  ce7: 4040f4
.Lbr090:    mov          a2, a4                                #  cea: 2d04
            ret                                                #  cec: 0df0

            .literal_position                                  #  cf0: 00000000
                                                               #  cf4: 00000000
                                                               #  cf8: 00000000
                                                               #  cfc: 00000000
                                                               #  d00: 000af23f
                                                               #  d04: 00000000
                                                               #  d08: 00000000
                                                               #  d0c: 00000000
                                                               #  d10: 10800000
                                                               #  d14: 20000000
                                                               #  d18: 00000000
                                                               #  d1c: 00000000
                                                               #  d20: 00000000
                                                               #  d24: 00000000
                                                               #  d28: 00000000
                                                               #  d2c: 00000000
                                                               #  d30: 00000000
                                                               #  d34: 00000000
                                                               #  d38: 00000000
                                                               #  d3c: 00000000
                                                               #  d40: 00000000
                                                               #  d44: 00000000
                                                               #  d48: 00000000
                                                               #  d4c: 00000000
                                                               #  d50: 00000000
                                                               #  d54: 00000000
                                                               #  d58: 00000000
                                                               #  d5c: 00000000
                                                               #  d60: 00000000
                                                               #  d64: 00000000
                                                               #  d68: 00000000

# Function @ .irom0.text+0xd6c
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
#     (local21): word[3]   @ -0xc
            .global      sdk_ieee80211_send_mgmt
            .type        sdk_ieee80211_send_mgmt, @function
sdk_ieee80211_send_mgmt:
            movi         a8, 192 /* 0x000000c0 */              #  d6c: 82a0c0
            movi         a10, sdk_g_ic+0x18a                   #  d6f: a1e0ff
            movi         a9, 24 /* 0x00000018 */               #  d72: 1c89
            movi         a6, sdk_g_ic+0x2c                     #  d74: 61e0ff
            mov          a7, a4 /* arg2 */                     #  d77: 7d04
            addi         sp, sp, -96 /* (local0) */            #  d79: 12c1a0
            s32i         a13, sp, 60 /* a13 -> [(local15)] */  #  d7c: d9f1
            s32i         a0, sp, 52 /* a0 -> [(local13)] */    #  d7e: 09d1
            movi         a4, 2 /* 0x00000002 */                #  d80: 0c24
            s32i         a15, sp, 68 /* a15 -> [(local17)] */  #  d82: f26111
            s32i         a12, sp, 56 /* a12 -> [(local14)] */  #  d85: c9e1
            s32i         a14, sp, 64 /* a14 -> [(local16)] */  #  d87: e26110
            mov          a12, a2 /* arg0 */                    #  d8a: cd02
            mov          a14, a3 /* arg1 */                    #  d8c: ed03
            addi         a15, a6, -44 /* sdk_g_ic */           #  d8e: f2c6d4
            l32i         a3, a2, 136 /* [arg0+0x88] */         #  d91: 322222
            s32i         a3, sp, 76 /* [arg0+0x88] -> [(local19)] */ #  d94: 326113
            beqz         a14, .Lbr100                          #  d97: 168e0b
            addi         a5, a14, -16 /* arg1-0x10 */          #  d9a: 52cef0
            beqz         a5, .Lbr105                           #  d9d: 16d50d
            addi         a11, a14, -32 /* arg1-0x20 */         #  da0: b2cee0
            beqz         a11, .Lbr100                          #  da3: 16cb0a
            addi         a13, a14, -48 /* arg1-0x30 */         #  da6: d2ced0
            beqz         a13, .Lbr105                          #  da9: 161d0d
            movi         a0, 160 /* 0x000000a0 */              #  dac: 02a0a0
            sub          a0, a14, a0 /* arg1-0xa0 */           #  daf: 000ec0
            beqz         a0, .Lbr139                           #  db2: 16704d
            movi         a2, 176 /* 0x000000b0 */              #  db5: 22a0b0
            sub          a2, a14, a2 /* arg1-0xb0 */           #  db8: 202ec0
            beqz         a2, .Lbr126                           #  dbb: 16323b
            bne          a14, a8, .Lbr093                      #  dbe: 879e48
            mov          a3, a9 /* 0x00000018 */               #  dc1: 3d09
            mov          a2, sp /* (local0) */                 #  dc3: 2d01
            s32i         a7, sp, 8 /* arg2 -> [(local2)] */    #  dc5: 7921
            call0        sdk_ieee80211_getmgtframe             #  dc7: 01d4ffc0
                                                               #  dcb: 0000
            mov          a13, a2                               #  dcd: dd02
            beqz         a2, .Lbr096                           #  dcf: 167205
            s32i         a12, sp, 44 /* arg0 -> [(local11)] */ #  dd2: c9b1
            movi         a5, -2 /* 0xfffffffe */               #  dd4: 7ce5
            movi         a6, 2 /* 0x00000002 */                #  dd6: 0c26
            l32i         a7, sp, 8 /* [(local2)] */            #  dd8: 7821
            l32i         a8, sp, 0 /* [(local0)] */            #  dda: 8801
            l32i         a4, sp, 76 /* [(local19)] */          #  ddc: 422113
            movi         a9, 24 /* 0x00000018 */               #  ddf: 1c89
            l32i         a3, a4, 8 /* [[(local19)]+0x8] */     #  de1: 3824
            s16i         a9, a2, 20                            #  de3: 92520a
            s16i         a7, a8, 0 /* [(local2)] -> [[(local0)]] */ #  de6: 725800
            s16i         a6, a2, 22                            #  de9: 62520b
            and          a3, a3, a5                            #  dec: 503310
            s32i         a3, a4, 8 /* a3 -> [[(local19)]+0x8] */ #  def: 3924
            j            .Lbr113                               #  df1: 065e00
.Lbr091:    l16ui        a0, a0, 0 /* [[sdk_g_ic+0x16c]] */    #  df4: 021000
.Lbr092:    add          a4, a2, a4                            #  df7: 4a42
            movi         a3, 24 /* 0x00000018 */               #  df9: 1c83
            mov          a2, sp /* (local0) */                 #  dfb: 2d01
            add          a4, a0, a4                            #  dfd: 4a40
            call0        sdk_ieee80211_getmgtframe             #  dff: 01c7ffc0
                                                               #  e03: 0000
            mov          a13, a2                               #  e05: dd02
            bnez         a2, .Lbr114                           #  e07: 56f21d
.Lbr093:    beqz         a13, .Lbr096                          #  e0a: 9ccd
            l32i         a0, a13, 32                           #  e0c: 088d
            movi         a3, 4 /* 0x00000004 */                #  e0e: 0c43
            l32i         a0, a0, 0                             #  e10: 0800
            movi         a2, 5 /* 0x00000005 */                #  e12: 0c52
            bbci         a0, 20, .Lbr094                       #  e14: 477002
            j            .Lbr095                               #  e17: c60100
.Lbr094:    l32i         a3, sp, 4 /* [(local1)] */            #  e1a: 3811
            extui        a4, a0, 21, 1                         #  e1c: 004505
            movnez       a3, a2, a4                            #  e1f: 403293
.Lbr095:    mov          a2, a13                               #  e22: 2d0d
            call0        sdk_esf_buf_recycle                   #  e24: 01bfffc0
                                                               #  e28: 0000
.Lbr096:    movi         a2, 1 /* 0x00000001 */                #  e2a: 0c12
            j            .Lbr099                               #  e2c: 860400
.Lbr097:    movi         a5, 0 /* 0x00000000 */                #  e2f: 0c05
            s32i         a5, a13, 24                           #  e31: 596d
.Lbr098:    mov          a4, a14 /* arg1 */                    #  e33: 4d0e
            mov          a3, a13                               #  e35: 3d0d
            mov          a2, a12 /* [(local11)] */             #  e37: 2d0c
            l8ui         a6, a15, 125 /* [sdk_g_ic+0x7d] */    #  e39: 620f7d
            s8i          a6, a0, 8                             #  e3c: 624008
            call0        sdk_ieee80211_mgmt_output             #  e3f: 050000
.Lbr099:    l32i         a12, sp, 56 /* [(local14)] */         #  e42: c8e1
            l32i         a13, sp, 60 /* [(local15)] */         #  e44: d8f1
            l32i         a14, sp, 64 /* [(local16)] */         #  e46: e22110
            l32i         a15, sp, 68 /* [(local17)] */         #  e49: f22111
            l32i         a0, sp, 52 /* [(local13)] */          #  e4c: 08d1
            addi         sp, sp, 96 /* (top of frame) */       #  e4e: 12c160
            ret                                                #  e51: 0df0
.Lbr100:    l32i         a0, a15, 0x174 /* [sdk_g_ic+0x174] */ #  e53: 022f5d
            bnez         a0, .Lbr101                           #  e56: cc40
            movi         a2, 164 /* 0x000000a4 */              #  e58: 22a0a4
            j            .Lbr102                               #  e5b: c60100
.Lbr101:    l16ui        a2, a0, 0 /* [[sdk_g_ic+0x174]] */    #  e5e: 221000
            movi         a3, 164 /* 0x000000a4 */              #  e61: 32a0a4
            add          a2, a2, a3 /* [[sdk_g_ic+0x174]]+0xa4 */ #  e64: 3a22
.Lbr102:    l32i         a0, a15, 0x178 /* [sdk_g_ic+0x178] */ #  e66: 022f5e
            bnez         a0, .Lbr103                           #  e69: cc30
            movi         a4, 0 /* 0x00000000 */                #  e6b: 0c04
            j            .Lbr104                               #  e6d: 860000
.Lbr103:    l16ui        a4, a0, 0 /* [[sdk_g_ic+0x178]] */    #  e70: 421000
.Lbr104:    l32i         a0, a15, 0x16c /* [sdk_g_ic+0x16c] */ #  e73: 022f5b
            bnez         a0, .Lbr091                           #  e76: 56a0f7
            movi         a0, 0 /* 0x00000000 */                #  e79: 0c00
            j            .Lbr092                               #  e7b: 06deff
.Lbr105:    l32i         a0, a15, 0x170 /* [sdk_g_ic+0x170] */ #  e7e: 022f5c
            bnez         a0, .Lbr106                           #  e81: cc40
            movi         a4, 111 /* 0x0000006f */              #  e83: 42a06f
            j            .Lbr107                               #  e86: 460100
.Lbr106:    l16ui        a4, a0, 0 /* [[sdk_g_ic+0x170]] */    #  e89: 421000
            addi         a4, a4, 111 /* [[sdk_g_ic+0x170]]+0x6f */ #  e8c: 42c46f
.Lbr107:    mov          a2, sp /* (local0) */                 #  e8f: 2d01
            movi         a3, 24 /* 0x00000018 */               #  e91: 1c83
            s32i         a7, sp, 8 /* arg2 -> [(local2)] */    #  e93: 7921
            call0        sdk_ieee80211_getmgtframe             #  e95: 01a3ffc0
                                                               #  e99: 0000
            s32i         a2, sp, 48 /* a2 -> [(local12)] */    #  e9b: 29c1
            mov          a13, a2                               #  e9d: dd02
            beqz         a2, .Lbr093                           #  e9f: 1672f6
            movi         a3, sdk_g_ic+0x280                    #  ea2: 3195ff
            movi         a4, 24 /* 0x00000018 */               #  ea5: 1c84
            s16i         a4, a2, 20                            #  ea7: 42520a
            l8ui         a2, a3, 141 /* [sdk_g_ic+0x30d] */    #  eaa: 22038d
            l8ui         a3, a3, 141 /* [sdk_g_ic+0x30d] */    #  ead: 32038d
            addx2        a2, a2, a3                            #  eb0: 302290
            addx4        a2, a2, a15                           #  eb3: f022a0
            addi         a2, a2, 120                           #  eb6: 22c278
            call0        sdk_ieee80211_getcapinfo              #  eb9: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #  ebc: 0801
            l32i         a5, sp, 8 /* [(local2)] */            #  ebe: 5821
            s16i         a2, a0, 0 /* a2 -> [[(local0)]] */    #  ec0: 225000
            s16i         a5, a0, 2 /* [(local2)] -> [[(local0)]+0x2] */ #  ec3: 525001
            addi         a2, a0, 4 /* [(local0)]+0x4 */        #  ec6: 4b20
            s32i         a2, sp, 0 /* [(local0)]+0x4 -> [(local0)] */ #  ec8: 2901
            bnez         a5, .Lbr108                           #  eca: cc75
            l32i         a6, sp, 76 /* [(local19)] */          #  ecc: 622113
            l16ui        a6, a6, 26 /* [[(local19)]+0x1a] */   #  ecf: 62160d
            s16i         a6, a0, 4 /* [[(local19)]+0x1a] -> [[(local0)]+0x4] */ #  ed2: 625002
.Lbr108:    movi         a3, sdk_g_ic+0x2c                     #  ed5: 3189ff
            addi         a2, a2, 2 /* [(local0)]+0x6 */        #  ed8: 2b22
            s32i         a2, sp, 0 /* [(local0)]+0x6 -> [(local0)] */ #  eda: 2901
            s32i         a3, sp, 40 /* sdk_g_ic+0x2c -> [(local10)] */ #  edc: 39a1
            call0        sdk_ieee80211_add_rates               #  ede: 050000
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  ee1: 2901
            l32i         a3, sp, 40 /* [(local10)] */          #  ee3: 38a1
            s32i         a12, sp, 44 /* arg0 -> [(local11)] */ #  ee5: c9b1
            call0        sdk_ieee80211_add_xrates              #  ee7: 050000
            mov          a12, a2                               #  eea: cd02
            l32i         a0, sp, 76 /* [(local19)] */          #  eec: 022113
            movi         a3, 192 /* 0x000000c0 */              #  eef: 32a0c0
            l32i         a0, a0, 8 /* [[(local19)]+0x8] */     #  ef2: 0820
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  ef4: 2901
            and          a0, a0, a3                            #  ef6: 300010
            bnei         a0, 64, .Lbr109                       #  ef9: 66d020
            l32i         a3, sp, 44 /* [(local11)] */          #  efc: 38b1
            call0        sdk_ieee80211_add_htcap               #  efe: 018affc0
                                                               #  f02: 0000
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  f04: 2901
            l32i         a3, sp, 44 /* [(local11)] */          #  f06: 38b1
            call0        sdk_ieee80211_add_htinfo              #  f08: 0189ffc0
                                                               #  f0c: 0000
            l32i         a0, sp, 76 /* [(local19)] */          #  f0e: 022113
            mov          a12, a2                               #  f11: cd02
            l32i         a0, a0, 8 /* [[(local19)]+0x8] */     #  f13: 0820
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  f15: 2901
            movi         a2, 192 /* 0x000000c0 */              #  f17: 22a0c0
            and          a0, a0, a2                            #  f1a: 200010
.Lbr109:    movi         a2, 192 /* 0x000000c0 */              #  f1d: 22a0c0
            bne          a0, a2, .Lbr110                       #  f20: 279017
            mov          a2, a12                               #  f23: 2d0c
            l32i         a3, sp, 44 /* [(local11)] */          #  f25: 38b1
            call0        sdk_ieee80211_add_htcap_vendor        #  f27: 0182ffc0
                                                               #  f2b: 0000
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  f2d: 2901
            l32i         a3, sp, 44 /* [(local11)] */          #  f2f: 38b1
            call0        sdk_ieee80211_add_htinfo_vendor       #  f31: 0180ffc0
                                                               #  f35: 0000
            mov          a12, a2                               #  f37: cd02
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  f39: 2901
.Lbr110:    l32i         a3, a15, 0x170 /* [sdk_g_ic+0x170] */ #  f3b: 322f5c
            s32i         a3, sp, 36 /* [sdk_g_ic+0x170] -> [(local9)] */ #  f3e: 3991
            beqz         a3, .Lbr111                           #  f40: 9c63
            mov          a4, a3 /* [sdk_g_ic+0x170] */         #  f42: 4d03
            mov          a2, a12                               #  f44: 2d0c
            addi         a3, a3, 2 /* [sdk_g_ic+0x170]+0x2 */  #  f46: 2b33
            l16ui        a4, a4, 0 /* [[sdk_g_ic+0x170]] */    #  f48: 421400
            call0        memcpy                                #  f4b: 017bffc0
                                                               #  f4f: 0000
            l32i         a5, sp, 36 /* [(local9)] */           #  f51: 5891
            l16ui        a5, a5, 0 /* [[(local9)]] */          #  f53: 521500
            add          a12, a5, a12                          #  f56: cac5
            s32i         a12, sp, 0 /* a12 -> [(local0)] */    #  f58: c901
.Lbr111:    l32i         a0, sp, 48 /* [(local12)] */          #  f5a: 08c1
            l32i         a4, a0, 4 /* [[(local12)]+0x4] */     #  f5c: 4810
            l16ui        a0, a0, 20 /* [[(local12)]+0x14] */   #  f5e: 02100a
.Lbr112:    l32i         a2, a4, 4                             #  f61: 2814
            l32i         a3, sp, 48 /* [(local12)] */          #  f63: 38c1
            add          a2, a0, a2                            #  f65: 2a20
            sub          a2, a12, a2                           #  f67: 202cc0
            s16i         a2, a3, 22 /* a2 -> [[(local12)]+0x16] */ #  f6a: 22530b
.Lbr113:    movi         a8, 0x3ff20a00                        #  f6d: 8164ff
            movi         a5, 7 /* 0x00000007 */                #  f70: 0c75
            movi         a6, 240 /* 0x000000f0 */              #  f72: 62a0f0
            l32i         a9, a13, 32                           #  f75: 988d
            l32i         a2, a15, 16 /* [sdk_g_ic+0x10] */     #  f77: 284f
            l8ui         a7, a9, 6                             #  f79: 720906
            movi         a10, 143 /* 0x0000008f */             #  f7c: a2a08f
            and          a7, a7, a10                           #  f7f: a07710
            s8i          a7, a9, 6                             #  f82: 724906
            l32i         a4, a13, 32                           #  f85: 488d
            l32i         a12, sp, 44 /* [(local11)] */         #  f87: c8b1
            l8ui         a3, a4, 4                             #  f89: 320404
            sub          a2, a2, a12                           #  f8c: c022c0
            and          a3, a3, a6                            #  f8f: 603310
            or           a3, a3, a5                            #  f92: 503320
            s8i          a3, a4, 4                             #  f95: 324404
            movi         a9, 1 /* 0x00000001 */                #  f98: 0c19
            movnez       a2, a9, a2                            #  f9a: 202993
            l32i         a9, a13, 32                           #  f9d: 988d
            memw                                               #  f9f: c02000
            l32i         a3, sp, 76 /* [(local19)] */          #  fa2: 322113
            movi         a7, 253 /* 0x000000fd */              #  fa5: 72a0fd
            extui        a6, a2, 0, 1                          #  fa8: 206004
            l32i         a8, a8, 0x200 /* [0x3ff20c00] */      #  fab: 822880
            l8ui         a10, a9, 0                            #  fae: a20900
            movi         a11, 254 /* 0x000000fe */             #  fb1: b2a0fe
            and          a10, a10, a11                         #  fb4: b0aa10
            s8i          a10, a9, 0                            #  fb7: a24900
            l32i         a5, a13, 32                           #  fba: 588d
            s32i         a8, a9, 16                            #  fbc: 8949
            l8ui         a4, a5, 0                             #  fbe: 420500
            slli         a6, a6, 1                             #  fc1: f06611
            and          a4, a4, a7                            #  fc4: 704410
            or           a4, a4, a6                            #  fc7: 604420
            s8i          a4, a5, 0                             #  fca: 424500
            l16ui        a3, a3, 26 /* [[(local19)]+0x1a] */   #  fcd: 32130d
            l32i         a0, a13, 32                           #  fd0: 088d
            beqz         a3, .Lbr097                           #  fd2: 1693e5
            l32i         a11, a0, 0                            #  fd5: b800
            extui        a11, a11, 7, 1                        #  fd7: b0b704
            bnez         a11, .Lbr097                          #  fda: 561be5
            call0        sdk_rc_get_trc_by_index               #  fdd: 0157ffc0
                                                               #  fe1: 0000
            s32i         a2, a13, 24                           #  fe3: 296d
            l32i         a0, a13, 32                           #  fe5: 088d
            j            .Lbr098                               #  fe7: 0692ff
.Lbr114:    movi         a5, 1 /* 0x00000001 */                #  fea: 0c15
            movi         a0, 17 /* 0x00000011 */               #  fec: 1c10
            l32i         a4, sp, 76 /* [(local19)] */          #  fee: 422113
            movi         a6, sdk_g_ic+0x18a                    #  ff1: 6144ff
            movi         a8, 24 /* 0x00000018 */               #  ff4: 1c88
            s16i         a8, a2, 20                            #  ff6: 82520a
            s32i         a6, sp, 72 /* sdk_g_ic+0x18a -> [(local18)] */ #  ff9: 626112
            l32i         a2, a15, 28 /* [sdk_g_ic+0x1c] */     #  ffc: 287f
            l32i         a4, a4, 120 /* [[(local19)]+0x78] */  #  ffe: 42241e
            l8ui         a6, a6, 128 /* [sdk_g_ic+0x20a] */    # 1001: 620680
            l32i         a4, a4, 0 /* [[[(local19)]+0x78]] */  # 1004: 4804
            moveqz       a0, a5, a6                            # 1006: 600583
            bbci         a2, 18, .Lbr115                       # 1009: 277207
            bbci         a4, 7, .Lbr115                        # 100c: 776404
            movi         a9, 32 /* 0x00000020 */               # 100f: 2c09
            or           a0, a0, a9                            # 1011: 900020
.Lbr115:    movi         a10, 192 /* 0x000000c0 */             # 1014: a2a0c0
            ball         a4, a10, .Lbr116                      # 1017: a74405
            movi         a11, 1152 /* 0x00000480 */            # 101a: b2a480
            bnall        a4, a11, .Lbr117                      # 101d: b7c40a
.Lbr116:    l32i         a2, a15, 32 /* [sdk_g_ic+0x20] */     # 1020: 288f
            bbci         a2, 14, .Lbr117                       # 1022: e76205
            movi         a3, 1024 /* 0x00000400 */             # 1025: 32a400
            or           a0, a0, a3                            # 1028: 300020
.Lbr117:    l32i         a2, sp, 0 /* [(local0)] */            # 102b: 2801
            l32i         a3, sp, 76 /* [(local19)] */          # 102d: 322113
            addi         a4, a2, 2 /* [(local0)]+0x2 */        # 1030: 2b42
            s16i         a0, a2, 0 /* a0 -> [[(local0)]] */    # 1032: 025200
            l16ui        a3, a3, 28 /* [[(local19)]+0x1c] */   # 1035: 32130e
            s32i         a4, sp, 0 /* [(local0)]+0x2 -> [(local0)] */ # 1038: 4901
            s16i         a3, a2, 2 /* [[(local19)]+0x1c] -> [[(local0)]+0x2] */ # 103a: 325201
            addi         a2, a2, 4 /* [(local0)]+0x4 */        # 103d: 4b22
            s32i         a2, sp, 0 /* [(local0)]+0x4 -> [(local0)] */ # 103f: 2901
            bnei         a14, 32, .Lbr118                      # 1041: 66ce10
            l32i         a3, sp, 76 /* [(local19)] */          # 1044: 322113
            movi         a4, 6 /* 0x00000006 */                # 1047: 0c64
            call0        memcpy                                # 1049: 013dffc0
                                                               # 104d: 0000
            l32i         a2, sp, 0 /* [(local0)] */            # 104f: 2801
            addi         a2, a2, 6 /* [(local0)]+0x6 */        # 1051: 6b22
            s32i         a2, sp, 0 /* [(local0)]+0x6 -> [(local0)] */ # 1053: 2901
.Lbr118:    l32i         a5, sp, 72 /* [(local18)] */          # 1055: 522112
            movi         a3, sdk_g_ic+0x1e8                    # 1058: 312cff
            l16ui        a4, a5, 92 /* [[(local18)]+0x5c] */   # 105b: 42152e
            l16ui        a5, a5, 90 /* [[(local18)]+0x5a] */   # 105e: 52152d
            slli         a4, a4, 16                            # 1061: 004411
            or           a4, a4, a5                            # 1064: 504420
            call0        .Lfunc003                             # 1067: 45a0ff
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 106a: 2901
            movi         a3, sdk_g_ic+0x2c                     # 106c: 3128ff
            s32i         a3, sp, 40 /* sdk_g_ic+0x2c -> [(local10)] */ # 106f: 39a1
            call0        sdk_ieee80211_add_rates               # 1071: 050000
            l32i         a0, sp, 72 /* [(local18)] */          # 1074: 022112
            mov          a4, a2                                # 1077: 4d02
            l8ui         a0, a0, 127 /* [[(local18)]+0x7f] */  # 1079: 02007f
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 107c: 2901
            beqi         a0, 4, .Lbr119                        # 107e: 264005
            beqi         a0, 5, .Lbr119                        # 1081: 265002
            bnei         a0, 7, .Lbr120                        # 1084: 667024
.Lbr119:    l32i         a0, a15, 0x178 /* [sdk_g_ic+0x178] */ # 1087: 022f5e
            s32i         a4, sp, 28 /* a4 -> [(local7)] */     # 108a: 4971
            beqz         a0, .Lbr120                           # 108c: 9cc0
            l32i         a2, sp, 28 /* [(local7)] */           # 108e: 2871
            l8ui         a4, a0, 3 /* [[sdk_g_ic+0x178]+0x3] */ # 1090: 420003
            addi         a3, a0, 2 /* [sdk_g_ic+0x178]+0x2 */  # 1093: 2b30
            s32i         a3, sp, 20 /* [sdk_g_ic+0x178]+0x2 -> [(local5)] */ # 1095: 3951
            addi         a4, a4, 2 /* [[sdk_g_ic+0x178]+0x3]+0x2 */ # 1097: 2b44
            call0        memcpy                                # 1099: 012affc0
                                                               # 109d: 0000
            l32i         a2, sp, 20 /* [(local5)] */           # 109f: 2851
            l32i         a3, sp, 28 /* [(local7)] */           # 10a1: 3871
            l8ui         a2, a2, 1 /* [[(local5)]+0x1] */      # 10a3: 220201
            add          a2, a2, a3                            # 10a6: 3a22
            addi         a2, a2, 2                             # 10a8: 2b22
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 10aa: 2901
.Lbr120:    l32i         a3, sp, 40 /* [(local10)] */          # 10ac: 38a1
            s32i         a12, sp, 44 /* arg0 -> [(local11)] */ # 10ae: c9b1
            call0        sdk_ieee80211_add_xrates              # 10b0: 050000
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 10b3: 2901
            l32i         a4, sp, 72 /* [(local18)] */          # 10b5: 422112
            mov          a12, a2                               # 10b8: cd02
            addmi        a4, a4, 768 /* [(local18)]+0x300 */   # 10ba: 42d403
            addi         a4, a4, 127 /* [(local18)]+0x37f */   # 10bd: 42c47f
            addi         a4, a4, 3 /* [(local18)]+0x382 */     # 10c0: 3b44
            l16ui        a3, a4, 2 /* [[(local18)]+0x384] */   # 10c2: 321401
            l16ui        a4, a4, 0 /* [[(local18)]+0x382] */   # 10c5: 421400
            slli         a3, a3, 16                            # 10c8: 003311
            or           a3, a3, a4                            # 10cb: 403320
            bbci         a3, 19, .Lbr121                       # 10ce: 377316
            l32i         a6, sp, 44 /* [(local11)] */          # 10d1: 68b1
            l32i         a6, a6, 72 /* [[(local11)]+0x48] */   # 10d3: 622612
            movi         a5, 192 /* 0x000000c0 */              # 10d6: 52a0c0
            bnone        a5, a6, .Lbr121                       # 10d9: 67050b
            l32i         a3, sp, 44 /* [(local11)] */          # 10dc: 38b1
            call0        sdk_ieee80211_add_htcap               # 10de: 011affc0
                                                               # 10e2: 0000
            mov          a12, a2                               # 10e4: cd02
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 10e6: 2901
.Lbr121:    l32i         a0, sp, 72 /* [(local18)] */          # 10e8: 022112
            l8ui         a0, a0, 127 /* [[(local18)]+0x7f] */  # 10eb: 02007f
            beqi         a0, 2, .Lbr122                        # 10ee: 262005
            beqi         a0, 3, .Lbr122                        # 10f1: 263002
            bnei         a0, 6, .Lbr123                        # 10f4: 666020
.Lbr122:    l32i         a0, a15, 0x174 /* [sdk_g_ic+0x174] */ # 10f7: 022f5d
            beqz         a0, .Lbr123                           # 10fa: 9ca0
            mov          a2, a12                               # 10fc: 2d0c
            l8ui         a4, a0, 3 /* [[sdk_g_ic+0x174]+0x3] */ # 10fe: 420003
            addi         a3, a0, 2 /* [sdk_g_ic+0x174]+0x2 */  # 1101: 2b30
            s32i         a3, sp, 24 /* [sdk_g_ic+0x174]+0x2 -> [(local6)] */ # 1103: 3961
            addi         a4, a4, 2 /* [[sdk_g_ic+0x174]+0x3]+0x2 */ # 1105: 2b44
            call0        memcpy                                # 1107: 0111ffc0
                                                               # 110b: 0000
            l32i         a0, sp, 24 /* [(local6)] */           # 110d: 0861
            l8ui         a0, a0, 1 /* [[(local6)]+0x1] */      # 110f: 020001
            add          a12, a0, a12                          # 1112: cac0
            addi         a12, a12, 2                           # 1114: 2bcc
            s32i         a12, sp, 0 /* a12 -> [(local0)] */    # 1116: c901
.Lbr123:    l32i         a3, sp, 72 /* [(local18)] */          # 1118: 322112
            addmi        a3, a3, 768 /* [(local18)]+0x300 */   # 111b: 32d303
            addi         a3, a3, 127 /* [(local18)]+0x37f */   # 111e: 32c37f
            addi         a3, a3, 3 /* [(local18)]+0x382 */     # 1121: 3b33
            l16ui        a2, a3, 2 /* [[(local18)]+0x384] */   # 1123: 221301
            l16ui        a3, a3, 0 /* [[(local18)]+0x382] */   # 1126: 321300
            slli         a2, a2, 16                            # 1129: 002211
            or           a2, a2, a3                            # 112c: 302220
            bbci         a2, 28, .Lbr124                       # 112f: c77218
            l32i         a5, sp, 44 /* [(local11)] */          # 1132: 58b1
            l32i         a5, a5, 72 /* [[(local11)]+0x48] */   # 1134: 522512
            movi         a4, 192 /* 0x000000c0 */              # 1137: 42a0c0
            bnone        a4, a5, .Lbr124                       # 113a: 57040d
            mov          a2, a12                               # 113d: 2d0c
            l32i         a3, sp, 44 /* [(local11)] */          # 113f: 38b1
            call0        sdk_ieee80211_add_htcap_vendor        # 1141: 0103ffc0
                                                               # 1145: 0000
            mov          a12, a2                               # 1147: cd02
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 1149: 2901
.Lbr124:    l32i         a6, a15, 0x16c /* [sdk_g_ic+0x16c] */ # 114b: 622f5b
            s32i         a6, sp, 32 /* [sdk_g_ic+0x16c] -> [(local8)] */ # 114e: 6981
            beqz         a6, .Lbr125                           # 1150: 9c46
            mov          a2, a12                               # 1152: 2d0c
            addi         a3, a6, 2 /* [sdk_g_ic+0x16c]+0x2 */  # 1154: 2b36
            l16ui        a4, a6, 0 /* [[sdk_g_ic+0x16c]] */    # 1156: 421600
            call0        memcpy                                # 1159: 01fefec0
                                                               # 115d: 0000
            l32i         a5, sp, 32 /* [(local8)] */           # 115f: 5881
            l16ui        a5, a5, 0 /* [[(local8)]] */          # 1161: 521500
            add          a12, a5, a12                          # 1164: cac5
            s32i         a12, sp, 0 /* a12 -> [(local0)] */    # 1166: c901
.Lbr125:    s32i         a13, sp, 48 /* a13 -> [(local12)] */  # 1168: d9c1
            l32i         a4, a13, 4                            # 116a: 481d
            l16ui        a0, a13, 20                           # 116c: 021d0a
            j            .Lbr112                               # 116f: 867bff
.Lbr126:    movi         a6, 0 /* 0x00000000 */                # 1172: 0c06
            extui        a0, a7, 0, 16                         # 1174: 7000f4
            beqi         a0, 2, .Lbr127                        # 1177: 262002
            bnei         a0, 3, .Lbr128                        # 117a: 663007
.Lbr127:    l32i         a11, a12, 84 /* [arg0+0x54] */        # 117d: b22c15
            movi         a8, 1 /* 0x00000001 */                # 1180: 0c18
            movnez       a6, a8, a11                           # 1182: b06893
.Lbr128:    movi         a8, 1 /* 0x00000001 */                # 1185: 0c18
            bnez         a6, .Lbr131                           # 1187: cce6
            bgei         a0, 3, .Lbr130                        # 1189: e6300a
            bnei         a0, 1, .Lbr129                        # 118c: 661005
            l8ui         a13, a10, 126 /* [sdk_g_ic+0x208] */  # 118f: d20a7e
            beqi         a13, 2, .Lbr130                       # 1192: 262d01
.Lbr129:    movi         a8, 0 /* 0x00000000 */                # 1195: 0c08
.Lbr130:    beqz         a6, .Lbr132                           # 1197: 8c86
.Lbr131:    srai         a0, a7, 16                            # 1199: 700031
            bnez         a0, .Lbr132                           # 119c: cc30
            movi         a3, 28 /* 0x0000001c */               # 119e: 1cc3
            j            .Lbr133                               # 11a0: 460000
.Lbr132:    movi         a3, 24 /* 0x00000018 */               # 11a3: 1c83
.Lbr133:    beqz         a6, .Lbr134                           # 11a5: 8c96
            srai         a2, a7, 16                            # 11a7: 702031
            bnez         a2, .Lbr134                           # 11aa: cc42
            movi         a4, 136 /* 0x00000088 */              # 11ac: 42a088
            j            .Lbr135                               # 11af: 460000
.Lbr134:    movi         a4, 6 /* 0x00000006 */                # 11b2: 0c64
.Lbr135:    mov          a2, sp /* (local0) */                 # 11b4: 2d01
            s32i         a8, sp, 16 /* a8 -> [(local4)] */     # 11b6: 8941
            s32i         a6, sp, 12 /* a6 -> [(local3)] */     # 11b8: 6931
            s32i         a7, sp, 8 /* arg2 -> [(local2)] */    # 11ba: 7921
            call0        sdk_ieee80211_getmgtframe             # 11bc: 01e7fec0
                                                               # 11c0: 0000
            mov          a0, a2                                # 11c2: 0d02
            mov          a13, a2                               # 11c4: dd02
            beqz         a2, .Lbr093                           # 11c6: 1602c4
            l32i         a3, sp, 12 /* [(local3)] */           # 11c9: 3831
            l32i         a4, sp, 8 /* [(local2)] */            # 11cb: 4821
            movi         a6, 1 /* 0x00000001 */                # 11cd: 0c16
            movi         a7, 24 /* 0x00000018 */               # 11cf: 1c87
            l32i         a5, sp, 16 /* [(local4)] */           # 11d1: 5841
            s16i         a7, a2, 20                            # 11d3: 72520a
            l32i         a2, sp, 0 /* [(local0)] */            # 11d6: 2801
            movnez       a5, a6, a5                            # 11d8: 505693
            s16i         a4, a2, 2 /* [(local2)] -> [[(local0)]+0x2] */ # 11db: 425201
            s16i         a5, a2, 0 /* a5 -> [[(local0)]] */    # 11de: 525200
            srai         a4, a4, 16                            # 11e1: 404031
            s16i         a4, a2, 4 /* a4 -> [[(local0)]+0x4] */ # 11e4: 425202
            beqz         a3, .Lbr138                           # 11e7: 168309
            s32i         a0, sp, 84 /* a0 -> [(local21)] */    # 11ea: 026115
            bnez         a4, .Lbr138                           # 11ed: 562409
            l32i         a3, a12, 84 /* [arg0+0x54] */         # 11f0: 322c15
            movi         a4, 128 /* 0x00000080 */              # 11f3: 42a080
            movi         a8, 0x00008010                        # 11f6: 81c6fe
            mov          a13, a0                               # 11f9: dd00
            s16i         a8, a2, 6 /* 0x8010 -> [[(local0)]+0x6] */ # 11fb: 825203
            addi         a2, a2, 8 /* [(local0)]+0x8 */        # 11fe: 8b22
            call0        memcpy                                # 1200: 01d7fec0
                                                               # 1204: 0000
            mov          a2, a12 /* arg0 */                    # 1206: 2d0c
            mov          a3, a13                               # 1208: 3d0d
            l32i         a10, a13, 4                           # 120a: a81d
            movi         a11, 136 /* 0x00000088 */             # 120c: b2a088
            l32i         a9, a10, 4                            # 120f: 981a
            s16i         a11, a13, 22                          # 1211: b25d0b
            addi         a9, a9, 28                            # 1214: 92c91c
            s32i         a9, a10, 4                            # 1217: 991a
            call0        sdk_ieee80211_crypto_encap            # 1219: 01d1fec0
                                                               # 121d: 0000
            l16ui        a3, a13, 22                           # 121f: 321d0b
            l32i         a4, a13, 4                            # 1222: 481d
            s32i         a2, sp, 80 /* a2 -> [(local20)] */    # 1224: 226114
            l32i         a0, a4, 4                             # 1227: 0814
            movi         a2, .Lstr002                          # 1229: 21bafe
            addi         a0, a0, -24                           # 122c: 02c0e8
            s32i         a0, a4, 4                             # 122f: 0914
            s32i         a0, a13, 16                           # 1231: 094d
            call0        printf                                # 1233: 01ccfec0
                                                               # 1237: 0000
            l32i         a4, sp, 80 /* [(local20)] */          # 1239: 422114
            l32i         a0, a13, 32                           # 123c: 088d
            beqz         a4, .Lbr140                           # 123e: 162407
            l32i         a3, a15, 20 /* [sdk_g_ic+0x14] */     # 1241: 385f
            l16ui        a2, a4, 0 /* [[(local20)]] */         # 1243: 221400
            l32i         a6, a0, 0                             # 1246: 6800
            movi         a7, 1 /* 0x00000001 */                # 1248: 0c17
            extui        a5, a6, 0, 6                          # 124a: 605054
            srli         a6, a6, 6                             # 124d: 606641
            or           a6, a6, a7                            # 1250: 706620
            slli         a6, a6, 6                             # 1253: a06611
            or           a5, a5, a6                            # 1256: 605520
            s32i         a5, a0, 0                             # 1259: 5900
            bne          a3, a12, .Lbr136                      # 125b: c79305
            movi         a7, 128 /* 0x00000080 */              # 125e: 72a080
            or           a2, a2, a7                            # 1261: 702220
.Lbr136:    movi         a5, 240 /* 0x000000f0 */              # 1264: 52a0f0
            s8i          a2, a0, 12                            # 1267: 22400c
            l32i         a3, a4, 152 /* [[(local20)]+0x98] */  # 126a: 322426
            l8ui         a2, a0, 13                            # 126d: 22000d
            l32i         a3, a3, 0 /* [[[(local20)]+0x98]] */  # 1270: 3803
            and          a2, a2, a5                            # 1272: 502210
            extui        a3, a3, 0, 4                          # 1275: 303034
            or           a2, a2, a3                            # 1278: 302220
.Lbr137:    s8i          a2, a0, 13                            # 127b: 22400d
            s32i         a12, sp, 44 /* arg0 -> [(local11)] */ # 127e: c9b1
            j            .Lbr113                               # 1280: 463aff
.Lbr138:    s32i         a12, sp, 44 /* arg0 -> [(local11)] */ # 1283: c9b1
            movi         a4, 6 /* 0x00000006 */                # 1285: 0c64
            s16i         a4, a0, 22                            # 1287: 42500b
            j            .Lbr113                               # 128a: c637ff
.Lbr139:    mov          a3, a9 /* 0x00000018 */               # 128d: 3d09
            mov          a2, sp /* (local0) */                 # 128f: 2d01
            s32i         a7, sp, 8 /* arg2 -> [(local2)] */    # 1291: 7921
            call0        sdk_ieee80211_getmgtframe             # 1293: 01b5fec0
                                                               # 1297: 0000
            mov          a13, a2                               # 1299: dd02
            beqz         a2, .Lbr096                           # 129b: 16b2b8
            s32i         a12, sp, 44 /* arg0 -> [(local11)] */ # 129e: c9b1
            movi         a5, 2 /* 0x00000002 */                # 12a0: 0c25
            l32i         a6, sp, 8 /* [(local2)] */            # 12a2: 6821
            l32i         a7, sp, 0 /* [(local0)] */            # 12a4: 7801
            movi         a8, 24 /* 0x00000018 */               # 12a6: 1c88
            s16i         a8, a2, 20                            # 12a8: 82520a
            s16i         a6, a7, 0 /* [(local2)] -> [[(local0)]] */ # 12ab: 625700
            s16i         a5, a2, 22                            # 12ae: 52520b
            j            .Lbr113                               # 12b1: 062eff
.Lbr140:    l8ui         a2, a0, 13                            # 12b4: 22000d
            movi         a3, 240 /* 0x000000f0 */              # 12b7: 32a0f0
            and          a2, a2, a3                            # 12ba: 302210
            j            .Lbr137                               # 12bd: 86eeff

# Function @ .irom0.text+0x12c0
.Lfunc005:  l8ui         a2, a2, 24 /* [arg0+0x18] */          # 12c0: 220218
            beqz         a2, .Lbr141                           # 12c3: 8c32
            bnei         a2, 1, .Lbr142                        # 12c5: 661205
            beqz         a3, .Lbr142                           # 12c8: 8c23
.Lbr141:    movi         a2, 1 /* 0x00000001 */                # 12ca: 0c12
            ret           /* 0x00000001 */                     # 12cc: 0df0
.Lbr142:    movi         a2, 0 /* 0x00000000 */                # 12ce: 0c02
            ret           /* 0x00000000 */                     # 12d0: 0df0

            .literal_position                                  # 12d4: 00000000
                                                               # 12d8: 00000000
                                                               # 12dc: 00000000
                                                               # 12e0: 00000000
                                                               # 12e4: 80080000
                                                               # 12e8: 00000700
                                                               # 12ec: 00000700
                                                               # 12f0: 00000000
                                                               # 12f4: 00000000
                                                               # 12f8: 00000000
                                                               # 12fc: 00000000
                                                               # 1300: 00000000
                                                               # 1304: 00000000
                                                               # 1308: 00000000
                                                               # 130c: 00000000
                                                               # 1310: 00000000
                                                               # 1314: 00000000

# Function @ .irom0.text+0x1318
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
            .global      sdk_ieee80211_alloc_proberesp
            .type        sdk_ieee80211_alloc_proberesp, @function
sdk_ieee80211_alloc_proberesp:
            addi         sp, sp, -48 /* (local0) */            # 1318: 12c1d0
            s32i         a15, sp, 36 /* a15 -> [(local9)] */   # 131b: f991
            s32i         a3, sp, 8 /* arg1 -> [(local2)] */    # 131d: 3921
            s32i         a0, sp, 20 /* a0 -> [(local5)] */     # 131f: 0951
            s32i         a14, sp, 32 /* a14 -> [(local8)] */   # 1321: e981
            s32i         a13, sp, 28 /* a13 -> [(local7)] */   # 1323: d971
            s32i         a12, sp, 24 /* a12 -> [(local6)] */   # 1325: c961
            mov          a13, a2 /* arg0 */                    # 1327: dd02
            movi         a12, 132 /* 0x00000084 */             # 1329: c2a084
            movi         a14, sdk_g_ic+0x28d                   # 132c: e1eaff
            movi         a0, sdk_g_ic                          # 132f: 01eaff
            l8ui         a6, a14, 128 /* [sdk_g_ic+0x30d] */   # 1332: 620e80
            l32i         a5, a0, 0x16c /* [sdk_g_ic+0x16c] */  # 1335: 52205b
            addi         a6, a6, -1 /* [sdk_g_ic+0x30d]-0x1 */ # 1338: 0b66
            extui        a6, a6, 0, 8                          # 133a: 606074
            addx2        a6, a6, a6                            # 133d: 606690
            addx4        a6, a6, a0                            # 1340: 0066a0
            add          a12, a6, a12                          # 1343: cac6
            s32i         a12, a2, 188 /* a12 -> [arg0+0xbc] */ # 1345: c2622f
            bnez         a5, .Lbr143                           # 1348: cc35
            movi         a2, 0 /* 0x00000000 */                # 134a: 0c02
            j            .Lbr144                               # 134c: 860000
.Lbr143:    l16ui        a2, a5, 0 /* [[sdk_g_ic+0x16c]] */    # 134f: 221500
.Lbr144:    movi         a3, 24 /* 0x00000018 */               # 1352: 1c83
            s32i         a6, sp, 12 /* a6 -> [(local3)] */     # 1354: 6931
            addi         a5, a14, -5 /* sdk_g_ic+0x288 */      # 1356: 52cefb
            l8ui         a4, a5, 3 /* [sdk_g_ic+0x28b] */      # 1359: 420503
            l8ui         a7, a5, 2 /* [sdk_g_ic+0x28a] */      # 135c: 720502
            slli         a4, a4, 8                             # 135f: 804411
            or           a4, a4, a7                            # 1362: 704420
            slli         a4, a4, 8                             # 1365: 804411
            l8ui         a7, a5, 1 /* [sdk_g_ic+0x289] */      # 1368: 720501
            l8ui         a5, a5, 0 /* [sdk_g_ic+0x288] */      # 136b: 520500
            or           a4, a4, a7                            # 136e: 704420
            slli         a4, a4, 8                             # 1371: 804411
            or           a4, a4, a5                            # 1374: 504420
            add          a4, a4, a2                            # 1377: 2a44
            movi         a5, 206 /* 0x000000ce */              # 1379: 52a0ce
            mov          a2, sp /* (local0) */                 # 137c: 2d01
            add          a4, a4, a5                            # 137e: 5a44
            call0        sdk_ieee80211_getmgtframe             # 1380: 01ddffc0
                                                               # 1384: 0000
            mov          a15, a2                               # 1386: fd02
            bnez         a2, .Lbr145                           # 1388: cc32
            movi         a2, 0 /* 0x00000000 */                # 138a: 0c02
            j            .Lbr151                               # 138c: c65f00
.Lbr145:    movi         a3, 0 /* 0x00000000 */                # 138f: 0c03
            movi         a5, 24 /* 0x00000018 */               # 1391: 1c85
            movi         a4, 8 /* 0x00000008 */                # 1393: 0c84
            s16i         a5, a2, 20                            # 1395: 52520a
            l32i         a2, sp, 0 /* [(local0)] */            # 1398: 2801
            call0        memset                                # 139a: 01d7ffc0
                                                               # 139e: 0000
            l32i         a6, sp, 0 /* [(local0)] */            # 13a0: 6801
            movi         a7, 100 /* 0x00000064 */              # 13a2: 72a064
            mov          a2, a12                               # 13a5: 2d0c
            s16i         a7, a6, 8 /* 0x0064 -> [[(local0)]+0x8] */ # 13a7: 725604
            addi         a6, a6, 10 /* [(local0)]+0xa */       # 13aa: ab66
            s32i         a6, sp, 0 /* [(local0)]+0xa -> [(local0)] */ # 13ac: 6901
            call0        sdk_ieee80211_getcapinfo              # 13ae: 050000
            addi         a5, a14, -5 /* sdk_g_ic+0x288 */      # 13b1: 52cefb
            l8ui         a4, a5, 3 /* [sdk_g_ic+0x28b] */      # 13b4: 420503
            l8ui         a6, a5, 2 /* [sdk_g_ic+0x28a] */      # 13b7: 620502
            slli         a4, a4, 8                             # 13ba: 804411
            or           a4, a4, a6                            # 13bd: 604420
            l8ui         a6, a5, 1 /* [sdk_g_ic+0x289] */      # 13c0: 620501
            slli         a4, a4, 8                             # 13c3: 804411
            l8ui         a5, a5, 0 /* [sdk_g_ic+0x288] */      # 13c6: 520500
            or           a4, a4, a6                            # 13c9: 604420
            slli         a4, a4, 8                             # 13cc: 804411
            or           a4, a4, a5                            # 13cf: 504420
            l32i         a5, sp, 0 /* [(local0)] */            # 13d2: 5801
            movi         a3, sdk_g_ic+0x28c                    # 13d4: 31c2ff
            s16i         a2, a5, 0 /* a2 -> [[(local0)]] */    # 13d7: 225500
            addi         a2, a5, 2 /* [(local0)]+0x2 */        # 13da: 2b25
            s32i         a2, sp, 0 /* [(local0)]+0x2 -> [(local0)] */ # 13dc: 2901
            call0        .Lfunc003                             # 13de: c568ff
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 13e1: 2901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 13e3: c911
            movi         a3, sdk_g_ic+0x2c                     # 13e5: 31beff
            s32i         a3, sp, 16 /* sdk_g_ic+0x2c -> [(local4)] */ # 13e8: 3941
            call0        sdk_ieee80211_add_rates               # 13ea: 050000
            mov          a12, a2                               # 13ed: cd02
            l32i         a5, sp, 12 /* [(local3)] */           # 13ef: 5831
            movi         a6, 0x00000880                        # 13f1: 61bcff
            l32i         a5, a5, 132 /* [[(local3)]+0x84] */   # 13f4: 522521
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 13f7: 2901
            ball         a5, a6, .Lbr146                       # 13f9: 674528
            movi         a10, 3 /* 0x00000003 */               # 13fc: 0c3a
            s8i          a10, a2, 0                            # 13fe: a24200
            l32i         a8, sp, 0 /* [(local0)] */            # 1401: 8801
            movi         a7, 1 /* 0x00000001 */                # 1403: 0c17
            addi         a9, a8, 1 /* [(local0)]+0x1 */        # 1405: 1b98
            s32i         a9, sp, 0 /* [(local0)]+0x1 -> [(local0)] */ # 1407: 9901
            s8i          a7, a8, 1 /* 0x01 -> [[(local0)]+0x1] */ # 1409: 724801
            l32i         a6, sp, 0 /* [(local0)] */            # 140c: 6801
            l32i         a2, sp, 4 /* [(local1)] */            # 140e: 2811
            addi         a6, a6, 1 /* [(local0)]+0x1 */        # 1410: 1b66
            s32i         a6, sp, 0 /* [(local0)]+0x1 -> [(local0)] */ # 1412: 6901
            call0        sdk_ieee80211_chan2ieee               # 1414: 01baffc0
                                                               # 1418: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 141a: 0801
            s8i          a2, a0, 0 /* a2 -> [[(local0)]] */    # 141c: 224000
            l32i         a12, sp, 0 /* [(local0)] */           # 141f: c801
            addi         a12, a12, 1 /* [(local0)]+0x1 */      # 1421: 1bcc
            s32i         a12, sp, 0 /* [(local0)]+0x1 -> [(local0)] */ # 1423: c901
.Lbr146:    mov          a2, a12                               # 1425: 2d0c
            l32i         a3, sp, 16 /* [(local4)] */           # 1427: 3841
            call0        sdk_ieee80211_add_xrates              # 1429: 050000
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 142c: 2901
            l32i         a0, a13, 180 /* [arg0+0xb4] */        # 142e: 022d2d
            mov          a12, a2                               # 1431: cd02
            beqz         a0, .Lbr147                           # 1433: 9cc0
            l32i         a0, a0, 24 /* [[arg0+0xb4]+0x18] */   # 1435: 0860
            l32i         a3, a0, 80 /* [[[arg0+0xb4]+0x18]+0x50] */ # 1437: 322014
            beqz         a3, .Lbr147                           # 143a: 9c53
            l32i         a4, a0, 84 /* [[[arg0+0xb4]+0x18]+0x54] */ # 143c: 422015
            call0        memcpy                                # 143f: 01b0ffc0
                                                               # 1443: 0000
            l32i         a12, a13, 180 /* [arg0+0xb4] */       # 1445: c22d2d
            l32i         a12, a12, 24 /* [[arg0+0xb4]+0x18] */ # 1448: c86c
            l32i         a0, sp, 0 /* [(local0)] */            # 144a: 0801
            l32i         a12, a12, 84 /* [[[arg0+0xb4]+0x18]+0x54] */ # 144c: c22c15
            add          a12, a12, a0                          # 144f: 0acc
            s32i         a12, sp, 0 /* a12 -> [(local0)] */    # 1451: c901
.Lbr147:    l32i         a3, a13, 188 /* [arg0+0xbc] */        # 1453: 322d2f
            movi         a6, 0x00070000                        # 1456: 61a4ff
            l32i         a3, a3, 0 /* [[arg0+0xbc]] */         # 1459: 3803
            movi         a0, 192 /* 0x000000c0 */              # 145b: 02a0c0
            and          a2, a3, a6                            # 145e: 602310
            bnone        a3, a6, .Lbr148                       # 1461: 670330
            l32i         a4, sp, 8 /* [(local2)] */            # 1464: 4821
            beqi         a4, 1, .Lbr148                        # 1466: 26142b
            l32i         a5, a13, 72 /* [arg0+0x48] */         # 1469: 522d12
            bnone        a0, a5, .Lbr148                       # 146c: 570025
            mov          a2, a12                               # 146f: 2d0c
            mov          a3, a13 /* arg0 */                    # 1471: 3d0d
            call0        sdk_ieee80211_add_htcap               # 1473: 01a4ffc0
                                                               # 1477: 0000
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 1479: 2901
            mov          a3, a13 /* arg0 */                    # 147b: 3d0d
            call0        sdk_ieee80211_add_htinfo              # 147d: 01a2ffc0
                                                               # 1481: 0000
            mov          a12, a2                               # 1483: cd02
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 1485: 2901
            l32i         a2, a13, 188 /* [arg0+0xbc] */        # 1487: 222d2f
            movi         a3, 0x00070000                        # 148a: 3198ff
            l32i         a2, a2, 0 /* [[arg0+0xbc]] */         # 148d: 2802
            movi         a0, 192 /* 0x000000c0 */              # 148f: 02a0c0
            and          a2, a2, a3                            # 1492: 302210
.Lbr148:    beqz         a2, .Lbr149                           # 1495: 166204
            addmi        a4, a14, 512 /* sdk_g_ic+0x48d */     # 1498: 42de02
            l8ui         a3, a4, 130 /* [sdk_g_ic+0x50f] */    # 149b: 320482
            l8ui         a5, a4, 129 /* [sdk_g_ic+0x50e] */    # 149e: 520481
            slli         a3, a3, 8                             # 14a1: 803311
            or           a3, a3, a5                            # 14a4: 503320
            slli         a3, a3, 8                             # 14a7: 803311
            l8ui         a5, a4, 128 /* [sdk_g_ic+0x50d] */    # 14aa: 520480
            l8ui         a4, a4, 127 /* [sdk_g_ic+0x50c] */    # 14ad: 42047f
            or           a3, a3, a5                            # 14b0: 503320
            slli         a3, a3, 8                             # 14b3: 803311
            or           a3, a3, a4                            # 14b6: 403320
            bbci         a3, 28, .Lbr149                       # 14b9: c77322
            l32i         a4, sp, 8 /* [(local2)] */            # 14bc: 4821
            beqi         a4, 1, .Lbr149                        # 14be: 26141d
            l32i         a5, a13, 72 /* [arg0+0x48] */         # 14c1: 522d12
            bnone        a0, a5, .Lbr149                       # 14c4: 570017
            mov          a2, a12                               # 14c7: 2d0c
            mov          a3, a13 /* arg0 */                    # 14c9: 3d0d
            call0        sdk_ieee80211_add_htcap_vendor        # 14cb: 0190ffc0
                                                               # 14cf: 0000
            mov          a3, a13 /* arg0 */                    # 14d1: 3d0d
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 14d3: 2901
            call0        sdk_ieee80211_add_htinfo_vendor       # 14d5: 018effc0
                                                               # 14d9: 0000
            mov          a12, a2                               # 14db: cd02
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 14dd: 2901
.Lbr149:    movi         a13, sdk_g_ic                         # 14df: d184ff
            l32i         a13, a13, 0x16c /* [sdk_g_ic+0x16c] */ # 14e2: d22d5b
            beqz         a13, .Lbr150                          # 14e5: 9c2d
            mov          a2, a12                               # 14e7: 2d0c
            addi         a3, a13, 2 /* [sdk_g_ic+0x16c]+0x2 */ # 14e9: 2b3d
            l16ui        a4, a13, 0 /* [[sdk_g_ic+0x16c]] */   # 14eb: 421d00
            call0        memcpy                                # 14ee: 0189ffc0
                                                               # 14f2: 0000
            l16ui        a14, a13, 0 /* [[sdk_g_ic+0x16c]] */  # 14f4: e21d00
            add          a12, a14, a12                         # 14f7: cace
            s32i         a12, sp, 0 /* a12 -> [(local0)] */    # 14f9: c901
.Lbr150:    mov          a2, a15                               # 14fb: 2d0f
            l32i         a0, a15, 4                            # 14fd: 081f
            movi         a3, 24 /* 0x00000018 */               # 14ff: 1c83
            l32i         a0, a0, 4                             # 1501: 0810
            s16i         a3, a15, 20                           # 1503: 325f0a
            sub          a0, a12, a0                           # 1506: 000cc0
            addi         a0, a0, -24                           # 1509: 02c0e8
            s16i         a0, a15, 22                           # 150c: 025f0b
.Lbr151:    l32i         a12, sp, 24 /* [(local6)] */          # 150f: c861
            l32i         a13, sp, 28 /* [(local7)] */          # 1511: d871
            l32i         a14, sp, 32 /* [(local8)] */          # 1513: e881
            l32i         a15, sp, 36 /* [(local9)] */          # 1515: f891
            l32i         a0, sp, 20 /* [(local5)] */           # 1517: 0851
            addi         sp, sp, 48 /* (top of frame) */       # 1519: 12c130
            ret                                                # 151c: 0df0

            .literal_position                                  # 1520: 00000000
                                                               # 1524: ff0f00ff
                                                               # 1528: 000af23f
                                                               # 152c: 00000000
                                                               # 1530: 00000000
                                                               # 1534: 00000000

# Function @ .irom0.text+0x1538
# Local variables/stack:
#     (local0):  word[4]   @ -0x30
#     (local1):  word      @ -0x20
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word[4]   @ -0x10
            .global      sdk_ieee80211_send_proberesp
            .type        sdk_ieee80211_send_proberesp, @function
sdk_ieee80211_send_proberesp:
            mov          a6, a3 /* arg1 */                     # 1538: 6d03
            addi         sp, sp, -48 /* (local0) */            # 153a: 12c1d0
            s32i         a12, sp, 28 /* a12 -> [(local4)] */   # 153d: c971
            mov          a3, a4 /* arg2 */                     # 153f: 3d04
            s32i         a13, sp, 32 /* a13 -> [(local5)] */   # 1541: d981
            s32i         a0, sp, 24 /* a0 -> [(local3)] */     # 1543: 0961
            mov          a13, a2 /* arg0 */                    # 1545: dd02
            s32i         a6, sp, 16 /* arg1 -> [(local1)] */   # 1547: 6941
            l32i         a0, a2, 0 /* [arg0] */                # 1549: 0802
            s32i         a0, sp, 20 /* [arg0] -> [(local2)] */ # 154b: 0951
            call0        sdk_ieee80211_alloc_proberesp         # 154d: 050000
            mov          a12, a2                               # 1550: cd02
            bnez         a2, .Lbr154                           # 1552: ec22
            movi         a2, 1 /* 0x00000001 */                # 1554: 0c12
            j            .Lbr153                               # 1556: c60400
.Lbr152:    movi         a2, 0 /* 0x00000000 */                # 1559: 0c02
            addi         a3, a12, 28                           # 155b: 32cc1c
            movi         a4, sdk_g_ic                          # 155e: 41f0ff
            movi         a6, 0 /* 0x00000000 */                # 1561: 0c06
            l32i         a5, a4, 0x1c4 /* [sdk_g_ic+0x1c4] */  # 1563: 522471
            s32i         a6, a12, 28                           # 1566: 697c
            s32i         a12, a5, 0 /* a12 -> [[sdk_g_ic+0x1c4]] */ # 1568: c905
            s32i         a3, a4, 0x1c4 /* a3 -> [sdk_g_ic+0x1c4] */ # 156a: 326471
.Lbr153:    l32i         a12, sp, 28 /* [(local4)] */          # 156d: c871
            l32i         a13, sp, 32 /* [(local5)] */          # 156f: d881
            l32i         a0, sp, 24 /* [(local3)] */           # 1571: 0861
            addi         sp, sp, 48 /* (top of frame) */       # 1573: 12c130
            ret                                                # 1576: 0df0
.Lbr154:    movi         a7, 128 /* 0x00000080 */              # 1578: 72a080
            l16ui        a0, a2, 22                            # 157b: 02120b
            l16ui        a11, a2, 20                           # 157e: b2120a
            l32i         a10, a2, 4                            # 1581: a812
            add          a11, a11, a0                          # 1583: 0abb
            memw                                               # 1585: c02000
            l8ui         a6, a10, 3                            # 1588: 620a03
            extui        a6, a6, 0, 7                          # 158b: 606064
            or           a6, a6, a7                            # 158e: 706620
            memw                                               # 1591: c02000
            s8i          a6, a10, 3                            # 1594: 624a03
            movi         a4, 64 /* 0x00000040 */               # 1597: 4c04
            movi         a5, 191 /* 0x000000bf */              # 1599: 52a0bf
            memw                                               # 159c: c02000
            l8ui         a3, a10, 3                            # 159f: 320a03
            and          a3, a3, a5                            # 15a2: 503310
            or           a3, a3, a4                            # 15a5: 403320
            memw                                               # 15a8: c02000
            s8i          a3, a10, 3                            # 15ab: 324a03
            movi         a2, 223 /* 0x000000df */              # 15ae: 22a0df
            memw                                               # 15b1: c02000
            l8ui         a0, a10, 3                            # 15b4: 020a03
            and          a0, a0, a2                            # 15b7: 200010
            memw                                               # 15ba: c02000
            s8i          a0, a10, 3                            # 15bd: 024a03
            extui        a11, a11, 0, 12                       # 15c0: b0b0b4
            movi         a0, 0xff000fff                        # 15c3: 01d8ff
            slli         a11, a11, 12                          # 15c6: 40bb11
            memw                                               # 15c9: c02000
            l16ui        a9, a10, 2                            # 15cc: 921a01
            slli         a9, a9, 16                            # 15cf: 009911
            memw                                               # 15d2: c02000
            l16ui        a2, a10, 0                            # 15d5: 221a00
            or           a9, a9, a2                            # 15d8: 209920
            and          a9, a9, a0                            # 15db: 009910
            or           a9, a9, a11                           # 15de: b09920
            memw                                               # 15e1: c02000
            s16i         a9, a10, 0                            # 15e4: 925a00
            extui        a9, a9, 16, 16                        # 15e7: 9090f5
            memw                                               # 15ea: c02000
            l32i         a7, sp, 16 /* [(local1)] */           # 15ed: 7841
            mov          a2, a13 /* arg0 */                    # 15ef: 2d0d
            mov          a3, a12                               # 15f1: 3d0c
            movi         a4, 80 /* 0x00000050 */               # 15f3: 5c04
            movi         a5, 16 /* 0x00000010 */               # 15f5: 1c05
            l32i         a8, sp, 20 /* [(local2)] */           # 15f7: 8851
            s16i         a9, a10, 2                            # 15f9: 925a01
            addi         a8, a8, 41 /* [(local2)]+0x29 */      # 15fc: 82c829
            mov          a6, a8 /* [(local2)]+0x29 */          # 15ff: 6d08
            s32i         a8, sp, 0 /* [(local2)]+0x29 -> [(local0)] */ # 1601: 8901
            call0        sdk_ieee80211_send_setup              # 1603: 050000
            l32i         a0, a13, 136 /* [arg0+0x88] */        # 1606: 022d22
            l32i         a4, a12, 32                           # 1609: 488c
            movi         a7, 143 /* 0x0000008f */              # 160b: 72a08f
            l32i         a5, a4, 0                             # 160e: 5804
            l8ui         a6, a4, 6                             # 1610: 620406
            extui        a3, a5, 0, 6                          # 1613: 503054
            and          a6, a6, a7                            # 1616: 706610
            srli         a5, a5, 6                             # 1619: 505641
            s8i          a6, a4, 6                             # 161c: 624406
            l32i         a10, a12, 32                          # 161f: a88c
            movi         a6, 16 /* 0x00000010 */               # 1621: 1c06
            or           a5, a5, a6                            # 1623: 605520
            slli         a5, a5, 6                             # 1626: a05511
            or           a3, a3, a5                            # 1629: 503320
            s32i         a3, a4, 0                             # 162c: 3904
            l8ui         a9, a10, 4                            # 162e: 920a04
            movi         a11, 240 /* 0x000000f0 */             # 1631: b2a0f0
            and          a9, a9, a11                           # 1634: b09910
            movi         a11, 7 /* 0x00000007 */               # 1637: 0c7b
            or           a9, a9, a11                           # 1639: b09920
            s8i          a9, a10, 4                            # 163c: 924a04
            movi         a8, 0x3ff20a00                        # 163f: 81baff
            movi         a6, 2 /* 0x00000002 */                # 1642: 0c26
            l32i         a9, a12, 32                           # 1644: 988c
            memw                                               # 1646: c02000
            l32i         a8, a8, 0x200 /* [0x3ff20c00] */      # 1649: 822880
            l8ui         a10, a9, 0                            # 164c: a20900
            movi         a11, 254 /* 0x000000fe */             # 164f: b2a0fe
            and          a10, a10, a11                         # 1652: b0aa10
            s8i          a10, a9, 0                            # 1655: a24900
            l32i         a5, a12, 32                           # 1658: 588c
            s32i         a8, a9, 16                            # 165a: 8949
            l8ui         a4, a5, 0                             # 165c: 420500
            movi         a7, 253 /* 0x000000fd */              # 165f: 72a0fd
            and          a4, a4, a7                            # 1662: 704410
            or           a4, a4, a6                            # 1665: 604420
            s8i          a4, a5, 0                             # 1668: 424500
            l32i         a3, a12, 32                           # 166b: 388c
            l32i         a3, a3, 0                             # 166d: 3803
            movi         a8, 0 /* 0x00000000 */                # 166f: 0c08
            bbsi         a3, 7, .Lbr155                        # 1671: 77e304
            l16ui        a0, a0, 26 /* [[arg0+0x88]+0x1a] */   # 1674: 02100d
            bnez         a0, .Lbr156                           # 1677: cc30
.Lbr155:    s32i         a8, a12, 24                           # 1679: 896c
            j            .Lbr157                               # 167b: 860200
.Lbr156:    extui        a2, a0, 0, 8                          # 167e: 002074
            call0        sdk_rc_get_trc_by_index               # 1681: 01aaffc0
                                                               # 1685: 0000
            s32i         a2, a12, 24                           # 1687: 296c
.Lbr157:    call0        sdk_chm_check_same_channel            # 1689: 01a9ffc0
                                                               # 168d: 0000
            beqz         a2, .Lbr152                           # 168f: 1662ec
            mov          a2, a12                               # 1692: 2d0c
            call0        sdk_ppTxPkt                           # 1694: 01a8ffc0
                                                               # 1698: 0000
            j            .Lbr153                               # 169a: c6b3ff

            .literal_position                                  # 16a0: 00000000
                                                               # 16a4: 00000000
                                                               # 16a8: 00000000
                                                               # 16ac: 00000000
                                                               # 16b0: 00000000
                                                               # 16b4: 00000000
                                                               # 16b8: 80080000
                                                               # 16bc: 00000000
                                                               # 16c0: 00000700
                                                               # 16c4: 00000000
                                                               # 16c8: 00000000
                                                               # 16cc: 00000000
                                                               # 16d0: 00000000
                                                               # 16d4: 00000000
                                                               # 16d8: 00000000
                                                               # 16dc: 00000000
                                                               # 16e0: 00000000
                                                               # 16e4: 00000000
                                                               # 16e8: 00000000

# Function @ .irom0.text+0x16ec
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
#     (local10): word[2]   @ -0x8
.Lfunc006:  addi         sp, sp, -48 /* (local0) */            # 16ec: 12c1d0
            s32i         a15, sp, 32 /* a15 -> [(local8)] */   # 16ef: f981
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   # 16f1: c951
            s32i         a13, sp, 24 /* a13 -> [(local6)] */   # 16f3: d961
            s32i         a14, sp, 28 /* a14 -> [(local7)] */   # 16f5: e971
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     # 16f7: 0941
            s32i         a2, sp, 8 /* arg0 -> [(local2)] */    # 16f9: 2921
            movi         a0, 132 /* 0x00000084 */              # 16fb: 02a084
            mov          a2, a4 /* arg2 */                     # 16fe: 2d04
            mov          a14, a4 /* arg2 */                    # 1700: ed04
            mov          a13, a5 /* arg3 */                    # 1702: dd05
            mov          a12, a3 /* arg1 */                    # 1704: cd03
            movi         a15, sdk_g_ic+0x26e                   # 1706: f1e6ff
            movi         a3, 0 /* 0x00000000 */                # 1709: 0c03
            s32i         a15, sp, 36 /* sdk_g_ic+0x26e -> [(local9)] */ # 170b: f991
            movi         a5, sdk_g_ic                          # 170d: 51e5ff
            l8ui         a15, a15, 159 /* [sdk_g_ic+0x30d] */  # 1710: f20f9f
            movi         a4, 48 /* 0x00000030 */               # 1713: 3c04
            addi         a15, a15, -1 /* [sdk_g_ic+0x30d]-0x1 */ # 1715: 0bff
            extui        a15, a15, 0, 8                        # 1717: f0f074
            addx2        a15, a15, a15                         # 171a: f0ff90
            addx4        a15, a15, a5                          # 171d: 50ffa0
            add          a0, a15, a0                           # 1720: 0a0f
            s32i         a0, sp, 40 /* a0 -> [(local10)] */    # 1722: 09a1
            s32i         a0, a13, 188 /* a0 -> [arg3+0xbc] */  # 1724: 026d2f
            call0        memset                                # 1727: 01e7ffc0
                                                               # 172b: 0000
            mov          a2, a12 /* arg1 */                    # 172d: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 172f: 0c03
            movi         a4, 8 /* 0x00000008 */                # 1731: 0c84
            call0        memset                                # 1733: 01e5ffc0
                                                               # 1737: 0000
            l32i         a2, sp, 40 /* [(local10)] */          # 1739: 28a1
            movi         a0, sdk_g_ic+0x446                    # 173b: 01dbff
            s32i         a0, sp, 4 /* sdk_g_ic+0x446 -> [(local1)] */ # 173e: 0911
            l16ui        a0, a0, 254 /* [sdk_g_ic+0x544] */    # 1740: 02107f
            s16i         a0, a12, 8 /* [sdk_g_ic+0x544] -> [arg1+0x8] */ # 1743: 025c04
            call0        sdk_ieee80211_getcapinfo              # 1746: 050000
            movi         a5, sdk_g_ic                          # 1749: 51d8ff
            movi         a7, 0 /* 0x00000000 */                # 174c: 0c07
            addi         a4, a12, 10 /* arg1+0xa */            # 174e: ab4c
            s32i         a4, a14, 4 /* arg1+0xa -> [arg2+0x4] */ # 1750: 491e
            s8i          a7, a12, 12 /* 0x00 -> [arg1+0xc] */  # 1752: 724c0c
            l32i         a3, a5, 28 /* [sdk_g_ic+0x1c] */      # 1755: 3875
            s16i         a2, a12, 10 /* a2 -> [arg1+0xa] */    # 1757: 225c05
            bbsi         a3, 27, .Lbr158                       # 175a: b7f32f
            l32i         a6, sp, 36 /* [(local9)] */           # 175d: 6891
            addi         a2, a12, 14 /* arg1+0xe */            # 175f: eb2c
            l16ui        a8, a6, 28 /* [[(local9)]+0x1c] */    # 1761: 82160e
            l16ui        a9, a6, 26 /* [[(local9)]+0x1a] */    # 1764: 92160d
            slli         a8, a8, 16                            # 1767: 008811
            or           a8, a8, a9                            # 176a: 908820
            s8i          a8, a12, 13 /* a8 -> [arg1+0xd] */    # 176d: 824c0d
            l16ui        a4, a6, 28 /* [[(local9)]+0x1c] */    # 1770: 42160e
            l16ui        a8, a6, 26 /* [[(local9)]+0x1a] */    # 1773: 82160d
            slli         a4, a4, 16                            # 1776: 004411
            l8ui         a6, a6, 161 /* [[(local9)]+0xa1] */   # 1779: 6206a1
            or           a4, a4, a8                            # 177c: 804420
            bnei         a6, 1, .Lbr159                        # 177f: 661612
            movi         a3, 0 /* 0x00000000 */                # 1782: 0c03
            call0        memset                                # 1784: 01d2ffc0
                                                               # 1788: 0000
            j            .Lbr160                               # 178a: 060400
.Lbr158:    mov          a0, a12 /* arg1 */                    # 178d: 0d0c
            s8i          a7, a12, 13 /* 0x00 -> [arg1+0xd] */  # 178f: 724c0d
            j            .Lbr161                               # 1792: 060600
.Lbr159:    movi         a3, sdk_g_ic+0x28c                    # 1795: 31c6ff
            call0        memcpy                                # 1798: 01ceffc0
                                                               # 179c: 0000
.Lbr160:    l32i         a2, sp, 36 /* [(local9)] */           # 179e: 2891
            l16ui        a0, a2, 28 /* [[(local9)]+0x1c] */    # 17a0: 02120e
            l16ui        a2, a2, 26 /* [[(local9)]+0x1a] */    # 17a3: 22120d
            slli         a0, a0, 16                            # 17a6: 000011
            or           a0, a0, a2                            # 17a9: 200020
            add          a0, a0, a12                           # 17ac: ca00
.Lbr161:    addi         a2, a0, 14                            # 17ae: eb20
            movi         a3, sdk_g_ic+0x2c                     # 17b0: 31c1ff
            s32i         a3, sp, 12 /* sdk_g_ic+0x2c -> [(local3)] */ # 17b3: 3931
            call0        sdk_ieee80211_add_rates               # 17b5: 050000
            mov          a12, a2                               # 17b8: cd02
            movi         a4, 0x00000880                        # 17ba: 41bfff
            l32i         a3, a15, 132                          # 17bd: 322f21
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 17c0: 2901
            ball         a3, a4, .Lbr162                       # 17c2: 474318
            movi         a6, 3 /* 0x00000003 */                # 17c5: 0c36
            movi         a8, 1 /* 0x00000001 */                # 17c7: 0c18
            s8i          a8, a2, 1                             # 17c9: 824201
            s8i          a6, a2, 0                             # 17cc: 624200
            l32i         a2, sp, 40 /* [(local10)] */          # 17cf: 28a1
            call0        sdk_ieee80211_chan2ieee               # 17d1: 01c0ffc0
                                                               # 17d5: 0000
            l32i         a9, sp, 0 /* [(local0)] */            # 17d7: 9801
            addi         a12, a9, 3 /* [(local0)]+0x3 */       # 17d9: 3bc9
            s8i          a2, a9, 2 /* a2 -> [[(local0)]+0x2] */ # 17db: 224902
.Lbr162:    movi         a5, 192 /* 0x000000c0 */              # 17de: 52a0c0
            l32i         a10, a13, 176 /* [arg3+0xb0] */       # 17e1: a22d2c
            s32i         a12, a14, 12 /* a12 -> [arg2+0xc] */  # 17e4: c93e
            bnei         a10, 1, .Lbr163                       # 17e6: 661a20
            movi         a11, 1 /* 0x00000001 */               # 17e9: 0c1b
            movi         a4, 0 /* 0x00000000 */                # 17eb: 0c04
            movi         a3, 2 /* 0x00000002 */                # 17ed: 0c23
            movi         a2, 4 /* 0x00000004 */                # 17ef: 0c42
            movi         a0, 5 /* 0x00000005 */                # 17f1: 0c50
            s8i          a0, a12, 0                            # 17f3: 024c00
            s8i          a2, a12, 1                            # 17f6: 224c01
            s8i          a3, a12, 3                            # 17f9: 324c03
            s8i          a4, a12, 2                            # 17fc: 424c02
            s8i          a4, a12, 4                            # 17ff: 424c04
            s8i          a4, a12, 5                            # 1802: 424c05
            s16i         a11, a14, 24 /* 0x0001 -> [arg2+0x18] */ # 1805: b25e0c
            addi         a12, a12, 6                           # 1808: 6bcc
.Lbr163:    l32i         a0, a15, 132                          # 180a: 022f21
            s32i         a12, a14, 20 /* a12 -> [arg2+0x14] */ # 180d: c95e
            ball         a0, a5, .Lbr164                       # 180f: 574005
            movi         a6, 1152 /* 0x00000480 */             # 1812: 62a480
            bnall        a0, a6, .Lbr165                       # 1815: 67c00b
.Lbr164:    mov          a2, a12                               # 1818: 2d0c
            s32i         a12, a14, 28 /* a12 -> [arg2+0x1c] */ # 181a: c97e
            movi         a3, sdk_g_ic                          # 181c: 31a8ff
            call0        .Lfunc004                             # 181f: c527ff
            mov          a12, a2                               # 1822: cd02
.Lbr165:    mov          a2, a12                               # 1824: 2d0c
            l32i         a3, sp, 12 /* [(local3)] */           # 1826: 3831
            call0        sdk_ieee80211_add_xrates              # 1828: 050000
            mov          a15, a2                               # 182b: fd02
            l32i         a0, a13, 180 /* [arg3+0xb4] */        # 182d: 022d2d
            mov          a12, a2                               # 1830: cd02
            beqz         a0, .Lbr166                           # 1832: 9c80
            l32i         a0, a0, 24 /* [[arg3+0xb4]+0x18] */   # 1834: 0860
            l32i         a3, a0, 80 /* [[[arg3+0xb4]+0x18]+0x50] */ # 1836: 322014
            beqz         a3, .Lbr166                           # 1839: 9c13
            l32i         a4, a0, 84 /* [[[arg3+0xb4]+0x18]+0x54] */ # 183b: 422015
            call0        memcpy                                # 183e: 01a6ffc0
                                                               # 1842: 0000
            l32i         a12, a13, 180 /* [arg3+0xb4] */       # 1844: c22d2d
            l32i         a12, a12, 24 /* [[arg3+0xb4]+0x18] */ # 1847: c86c
            l32i         a12, a12, 84 /* [[[arg3+0xb4]+0x18]+0x54] */ # 1849: c22c15
            add          a12, a12, a15                         # 184c: facc
.Lbr166:    l32i         a2, a13, 188 /* [arg3+0xbc] */        # 184e: 222d2f
            movi         a15, 0x00070000                       # 1851: f19bff
            l32i         a2, a2, 0 /* [[arg3+0xbc]] */         # 1854: 2802
            and          a0, a2, a15                           # 1856: f00210
            bnone        a2, a15, .Lbr167                      # 1859: f7021d
            mov          a2, a12                               # 185c: 2d0c
            mov          a3, a13 /* arg3 */                    # 185e: 3d0d
            call0        sdk_ieee80211_add_htcap               # 1860: 019fffc0
                                                               # 1864: 0000
            s32i         a2, a14, 32 /* a2 -> [arg2+0x20] */   # 1866: 298e
            mov          a3, a13 /* arg3 */                    # 1868: 3d0d
            call0        sdk_ieee80211_add_htinfo              # 186a: 019dffc0
                                                               # 186e: 0000
            l32i         a0, a13, 188 /* [arg3+0xbc] */        # 1870: 022d2f
            l32i         a0, a0, 0 /* [[arg3+0xbc]] */         # 1873: 0800
            mov          a12, a2                               # 1875: cd02
            and          a0, a0, a15                           # 1877: f00010
.Lbr167:    beqz         a0, .Lbr168                           # 187a: ac90
            l32i         a3, sp, 4 /* [(local1)] */            # 187c: 3811
            addi         a3, a3, 127 /* [(local1)]+0x7f */     # 187e: 32c37f
            addi         a3, a3, 71 /* [(local1)]+0xc6 */      # 1881: 32c347
            l16ui        a2, a3, 2 /* [[(local1)]+0xc8] */     # 1884: 221301
            l16ui        a3, a3, 0 /* [[(local1)]+0xc6] */     # 1887: 321300
            slli         a2, a2, 16                            # 188a: 002211
            or           a2, a2, a3                            # 188d: 302220
            bbci         a2, 28, .Lbr168                       # 1890: c77213
            mov          a2, a12                               # 1893: 2d0c
            mov          a3, a13 /* arg3 */                    # 1895: 3d0d
            call0        sdk_ieee80211_add_htcap_vendor        # 1897: 0193ffc0
                                                               # 189b: 0000
            mov          a3, a13 /* arg3 */                    # 189d: 3d0d
            call0        sdk_ieee80211_add_htinfo_vendor       # 189f: 0192ffc0
                                                               # 18a3: 0000
            mov          a12, a2                               # 18a5: cd02
.Lbr168:    l32i         a0, sp, 16 /* [(local4)] */           # 18a7: 0841
            l32i         a13, sp, 24 /* [(local6)] */          # 18a9: d861
            l32i         a15, sp, 32 /* [(local8)] */          # 18ab: f881
            l32i         a5, sp, 8 /* [(local2)] */            # 18ad: 5821
            l32i         a7, a14, 20 /* [arg2+0x14] */         # 18af: 785e
            l32i         a6, a5, 4 /* [[(local2)]+0x4] */      # 18b1: 6815
            sub          a7, a12, a7                           # 18b3: 707cc0
            l32i         a6, a6, 4 /* [[[(local2)]+0x4]+0x4] */ # 18b6: 6816
            s16i         a7, a14, 26 /* a7 -> [arg2+0x1a] */   # 18b8: 725e0d
            l16ui        a4, a5, 20 /* [[(local2)]+0x14] */    # 18bb: 42150a
            l32i         a14, sp, 28 /* [(local7)] */          # 18be: e871
            add          a4, a4, a6                            # 18c0: 6a44
            sub          a4, a12, a4                           # 18c2: 404cc0
            s16i         a4, a5, 22 /* a4 -> [[(local2)]+0x16] */ # 18c5: 42550b
            l32i         a12, sp, 20 /* [(local5)] */          # 18c8: c851
            addi         sp, sp, 48 /* (top of frame) */       # 18ca: 12c130
            ret                                                # 18cd: 0df0

            .literal_position                                  # 18d0: 00000000
                                                               # 18d4: ff0f00ff
                                                               # 18d8: 28000000
                                                               # 18dc: 000af23f
                                                               # 18e0: 00000000

# Function @ .irom0.text+0x18e4
# Local variables/stack:
#     (local0):  word[4]   @ -0x30
#     (local1):  word      @ -0x20
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word      @ -0x10
#     (local6):  word[3]   @ -0xc
            .global      sdk_ieee80211_beacon_alloc
            .type        sdk_ieee80211_beacon_alloc, @function
sdk_ieee80211_beacon_alloc:
            movi         a4, sdk_g_ic                          # 18e4: 41fbff
            mov          a10, a3 /* arg1 */                    # 18e7: ad03
            addi         sp, sp, -48 /* (local0) */            # 18e9: 12c1d0
            s32i         a13, sp, 36 /* a13 -> [(local6)] */   # 18ec: d991
            movi         a3, 24 /* 0x00000018 */               # 18ee: 1c83
            s32i         a0, sp, 28 /* a0 -> [(local4)] */     # 18f0: 0971
            l32i         a5, a2, 0 /* [arg0] */                # 18f2: 5802
            s32i         a12, sp, 32 /* a12 -> [(local5)] */   # 18f4: c981
            s32i         a10, sp, 20 /* arg1 -> [(local2)] */  # 18f6: a951
            l32i         a4, a4, 0x288 /* [sdk_g_ic+0x288] */  # 18f8: 4224a2
            mov          a12, a2 /* arg0 */                    # 18fb: cd02
            s32i         a5, sp, 24 /* [arg0] -> [(local3)] */ # 18fd: 5961
            addi         a2, sp, 16 /* (local1) */             # 18ff: 22c110
            movi         a5, 141 /* 0x0000008d */              # 1902: 52a08d
            add          a4, a4, a5 /* [sdk_g_ic+0x288]+0x8d */ # 1905: 5a44
            call0        sdk_ieee80211_getmgtframe             # 1907: 01f6ffc0
                                                               # 190b: 0000
            mov          a13, a2                               # 190d: dd02
            bnez         a2, .Lbr169                           # 190f: cc32
            movi         a13, 0 /* 0x00000000 */               # 1911: 0c0d
            j            .Lbr170                               # 1913: c64200
.Lbr169:    l32i         a4, sp, 20 /* [(local2)] */           # 1916: 4851
            mov          a5, a12 /* arg0 */                    # 1918: 5d0c
            l32i         a3, sp, 16 /* [(local1)] */           # 191a: 3841
            movi         a6, 24 /* 0x00000018 */               # 191c: 1c86
            s16i         a6, a2, 20                            # 191e: 62520a
            call0        .Lfunc006                             # 1921: 85dcff
            movi         a4, 128 /* 0x00000080 */              # 1924: 42a080
            l16ui        a0, a13, 22                           # 1927: 021d0b
            l16ui        a11, a13, 20                          # 192a: b21d0a
            l32i         a10, a13, 4                           # 192d: a81d
            add          a11, a11, a0                          # 192f: 0abb
            memw                                               # 1931: c02000
            l8ui         a7, a10, 3                            # 1934: 720a03
            extui        a7, a7, 0, 7                          # 1937: 707064
            or           a7, a7, a4                            # 193a: 407720
            memw                                               # 193d: c02000
            s8i          a7, a10, 3                            # 1940: 724a03
            movi         a5, 64 /* 0x00000040 */               # 1943: 4c05
            movi         a6, 191 /* 0x000000bf */              # 1945: 62a0bf
            memw                                               # 1948: c02000
            l8ui         a3, a10, 3                            # 194b: 320a03
            and          a3, a3, a6                            # 194e: 603310
            or           a3, a3, a5                            # 1951: 503320
            memw                                               # 1954: c02000
            s8i          a3, a10, 3                            # 1957: 324a03
            movi         a2, 223 /* 0x000000df */              # 195a: 22a0df
            memw                                               # 195d: c02000
            l8ui         a0, a10, 3                            # 1960: 020a03
            and          a0, a0, a2                            # 1963: 200010
            memw                                               # 1966: c02000
            s8i          a0, a10, 3                            # 1969: 024a03
            extui        a11, a11, 0, 12                       # 196c: b0b0b4
            movi         a0, 0xff000fff                        # 196f: 01d9ff
            slli         a11, a11, 12                          # 1972: 40bb11
            memw                                               # 1975: c02000
            l16ui        a9, a10, 2                            # 1978: 921a01
            slli         a9, a9, 16                            # 197b: 009911
            memw                                               # 197e: c02000
            l16ui        a2, a10, 0                            # 1981: 221a00
            or           a9, a9, a2                            # 1984: 209920
            and          a9, a9, a0                            # 1987: 009910
            or           a9, a9, a11                           # 198a: b09920
            memw                                               # 198d: c02000
            s16i         a9, a10, 0                            # 1990: 925a00
            extui        a9, a9, 16, 16                        # 1993: 9090f5
            memw                                               # 1996: c02000
            mov          a2, a12 /* arg0 */                    # 1999: 2d0c
            mov          a3, a13                               # 199b: 3d0d
            movi         a5, 16 /* 0x00000010 */               # 199d: 1c05
            movi         a7, .Label001                         # 199f: 71ceff
            s16i         a9, a10, 2                            # 19a2: 925a01
            l32i         a8, sp, 24 /* [(local3)] */           # 19a5: 8861
            l32i         a9, a12, 144 /* [arg0+0x90] */        # 19a7: 922c24
            s32i         a9, a12, 136 /* [arg0+0x90] -> [arg0+0x88] */ # 19aa: 926c22
            addi         a8, a8, 41 /* [(local3)]+0x29 */      # 19ad: 82c829
            mov          a6, a8 /* [(local3)]+0x29 */          # 19b0: 6d08
            s32i         a8, sp, 0 /* [(local3)]+0x29 -> [(local0)] */ # 19b2: 8901
            call0        sdk_ieee80211_send_setup              # 19b4: 050000
            l32i         a6, a13, 32                           # 19b7: 688d
            l8ui         a5, a6, 6                             # 19b9: 520606
            movi         a7, 143 /* 0x0000008f */              # 19bc: 72a08f
            and          a5, a5, a7                            # 19bf: 705510
            s8i          a5, a6, 6                             # 19c2: 524606
            l32i         a2, a13, 32                           # 19c5: 288d
            movi         a3, 7 /* 0x00000007 */                # 19c7: 0c73
            l8ui         a0, a2, 4                             # 19c9: 020204
            movi         a4, 240 /* 0x000000f0 */              # 19cc: 42a0f0
            and          a0, a0, a4                            # 19cf: 400010
            or           a0, a0, a3                            # 19d2: 300020
            s8i          a0, a2, 4                             # 19d5: 024204
            movi         a12, 0x3ff20a00                       # 19d8: c1c1ff
            movi         a6, 16 /* 0x00000010 */               # 19db: 1c06
            l32i         a0, a13, 32                           # 19dd: 088d
            memw                                               # 19df: c02000
            movi         a7, 0 /* 0x00000000 */                # 19e2: 0c07
            movi         a10, 2 /* 0x00000002 */               # 19e4: 0c2a
            l32i         a12, a12, 0x200 /* [0x3ff20c00] */    # 19e6: c22c80
            l8ui         a2, a0, 0                             # 19e9: 220000
            movi         a3, 254 /* 0x000000fe */              # 19ec: 32a0fe
            and          a2, a2, a3                            # 19ef: 302210
            s8i          a2, a0, 0                             # 19f2: 224000
            l32i         a9, a13, 32                           # 19f5: 988d
            s32i         a12, a0, 16                           # 19f7: c940
            l8ui         a8, a9, 0                             # 19f9: 820900
            movi         a11, 253 /* 0x000000fd */             # 19fc: b2a0fd
            and          a8, a8, a11                           # 19ff: b08810
            or           a8, a8, a10                           # 1a02: a08820
            s8i          a8, a9, 0                             # 1a05: 824900
            l32i         a4, a13, 32                           # 1a08: 488d
            s32i         a7, a13, 24                           # 1a0a: 796d
            l32i         a5, a4, 0                             # 1a0c: 5804
            s8i          a6, a4, 14                            # 1a0e: 62440e
            extui        a3, a5, 0, 6                          # 1a11: 503054
            srli         a5, a5, 6                             # 1a14: 505641
            or           a5, a5, a6                            # 1a17: 605520
            slli         a5, a5, 6                             # 1a1a: a05511
            or           a3, a3, a5                            # 1a1d: 503320
            s32i         a3, a4, 0                             # 1a20: 3904
.Lbr170:    l32i         a0, sp, 28 /* [(local4)] */           # 1a22: 0871
            mov          a2, a13                               # 1a24: 2d0d
            l32i         a12, sp, 32 /* [(local5)] */          # 1a26: c881
            l32i         a13, sp, 36 /* [(local6)] */          # 1a28: d891
            addi         sp, sp, 48 /* (top of frame) */       # 1a2a: 12c130
            ret                                                # 1a2d: 0df0

            .section     .rodata, "a", @progbits

.Ldata001:  .word        0x01020303                            #    0: 03030201

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "no buf for probe, ie len %d\n"       #    0: 6e6f2062
                                                               #    4: 75662066
                                                               #    8: 6f722070
                                                               #    c: 726f6265
                                                               #   10: 2c206965
                                                               #   14: 206c656e
                                                               #   18: 2025640a
                                                               #   1c: 00
            .balign      4
.Lstr002:   .asciz       "eb %d\n"                             #   20: 65622025
                                                               #   24: 640a00
            .balign      4
.Label001:  .byte        0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00

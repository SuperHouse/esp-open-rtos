
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000
                                                               #    8: 00000000

# Function @ .irom0.text+0xc
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_ieee80211_deliver_data
            .type        sdk_ieee80211_deliver_data, @function
sdk_ieee80211_deliver_data:
            addi         sp, sp, -16 /* (local0) */            #    c: 12c1f0
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #    f: 0921
            l32i         a0, a2, 0 /* [arg0] */                #   11: 0802
            s32i         a0, sp, 0 /* [arg0] -> [(local0)] */  #   13: 0901
            l8ui         a0, a0, 47 /* [[arg0]+0x2f] */        #   15: 02002f
            s32i         a3, sp, 4 /* arg1 -> [(local1)] */    #   18: 3911
            bbsi         a0, 4, .Lbr001                        #   1a: 47e00e
            s32i         a3, sp, 4 /* arg1 -> [(local1)] */    #   1d: 3911
            beqz         a3, .Lbr002                           #   1f: acc3
            mov          a2, a3 /* arg1 */                     #   21: 2d03
            call0        sdk_ppRecycleRxPkt                    #   23: 01f7ffc0
                                                               #   27: 0000
            j            .Lbr002                               #   29: 860800
.Lbr001:    movi         a2, 3 /* 0x00000003 */                #   2c: 0c32
            l16ui        a3, a3, 22 /* [arg1+0x16] */          #   2e: 32130b
            movi         a4, 2 /* 0x00000002 */                #   31: 0c24
            call0        pbuf_alloc                            #   33: 01f4ffc0
                                                               #   37: 0000
            l32i         a4, sp, 4 /* [(local1)] */            #   39: 4811
            l32i         a5, a4, 4 /* [[(local1)]+0x4] */      #   3b: 5814
            mov          a3, a2                                #   3d: 3d02
            l32i         a5, a5, 4 /* [[[(local1)]+0x4]+0x4] */ #   3f: 5815
            s32i         a5, a2, 4                             #   41: 5912
            s32i         a2, a4, 0 /* a2 -> [[(local1)]] */    #   43: 2904
            s32i         a4, a2, 16                            #   45: 4942
            l32i         a2, sp, 0 /* [(local0)] */            #   47: 2801
            call0        ethernetif_input                      #   49: 01efffc0
                                                               #   4d: 0000
.Lbr002:    l32i         a0, sp, 8 /* [(local2)] */            #   4f: 0821
            addi         sp, sp, 16 /* (top of frame) */       #   51: 12c110
            ret                                                #   54: 0df0

            .literal_position                                  #   58: 80f30000
                                                               #   5c: 81370000
                                                               #   60: f8ff0000
                                                               #   64: 00000000
                                                               #   68: 00000000
                                                               #   6c: 00000000
                                                               #   70: 00000000
                                                               #   74: 00000000
                                                               #   78: 00000000
                                                               #   7c: 00000000
                                                               #   80: 00000000

# Function @ .irom0.text+0x84
# Local variables/stack:
#     (local0):  byte[31]  @ -0x2f
#     (local1):  word      @ -0x10
#     (local2):  word      @ -0xc
#     (local3):  word[2]   @ -0x8
            .balign      4
            .global      sdk_ieee80211_decap
            .type        sdk_ieee80211_decap, @function
sdk_ieee80211_decap:
            addi         sp, sp, -48 /* (FP)-0x30 */           #   84: 12c1d0
            s32i         a12, sp, 40 /* a12 -> [(local3)] */   #   87: c9a1
            s32i         a0, sp, 36 /* a0 -> [(local2)] */     #   89: 0991
            mov          a12, a2 /* arg0 */                    #   8b: cd02
            addi         a0, a5, 14 /* arg3+0xe */             #   8d: eb05
            bgeu         a4, a0, .Lbr003                       #   8f: 07b40a
            call0        sdk_ppRecycleRxPkt                    #   92: 01f4ffc0
                                                               #   96: 0000
            movi         a12, 0 /* 0x00000000 */               #   98: 0c0c
            j            .Lbr008                               #   9a: 063100
.Lbr003:    mov          a4, a5 /* arg3 */                     #   9d: 4d05
            mov          a2, sp /* (FP)-0x30 */                #   9f: 2d01
            call0        memcpy                                #   a1: 01f1ffc0
                                                               #   a5: 0000
            l32i         a3, a12, 4 /* [arg0+0x4] */           #   a7: 381c
            l32i         a0, a3, 4 /* [[arg0+0x4]+0x4] */      #   a9: 0813
            movi         a2, 170 /* 0x000000aa */              #   ab: 22a0aa
            l8ui         a4, a0, 0 /* [[[arg0+0x4]+0x4]] */    #   ae: 420000
            l8ui         a5, a0, 1 /* [[[arg0+0x4]+0x4]+0x1] */ #   b1: 520001
            bne          a4, a2, .Lbr004                       #   b4: 27942f
            bne          a5, a2, .Lbr004                       #   b7: 27952c
            l8ui         a6, a0, 2 /* [[[arg0+0x4]+0x4]+0x2] */ #   ba: 620002
            bnei         a6, 3, .Lbr004                        #   bd: 663626
            l8ui         a7, a0, 3 /* [[[arg0+0x4]+0x4]+0x3] */ #   c0: 720003
            bnez         a7, .Lbr004                           #   c3: ec07
            l8ui         a8, a0, 4 /* [[[arg0+0x4]+0x4]+0x4] */ #   c5: 820004
            bnez         a8, .Lbr004                           #   c8: dcb8
            l8ui         a9, a0, 5 /* [[[arg0+0x4]+0x4]+0x5] */ #   ca: 920005
            bnez         a9, .Lbr004                           #   cd: dc69
            movi         a10, 0x0000f380                       #   cf: a1e2ff
            l8ui         a4, a0, 7 /* [[[arg0+0x4]+0x4]+0x7] */ #   d2: 420007
            l8ui         a5, a0, 6 /* [[[arg0+0x4]+0x4]+0x6] */ #   d5: 520006
            slli         a4, a4, 8                             #   d8: 804411
            or           a4, a4, a5                            #   db: 504420
            beq          a4, a10, .Lbr004                      #   de: a71405
            movi         a5, 0x00003781                        #   e1: 51deff
            bne          a4, a5, .Lbr005                       #   e4: 579413
.Lbr004:    l16ui        a6, a12, 22 /* [arg0+0x16] */         #   e7: 621c0b
            l32i         a7, a3, 4 /* [[arg0+0x4]+0x4] */      #   ea: 7813
            s32i         a7, sp, 32 /* [[arg0+0x4]+0x4] -> [(local1)] */ #   ec: 7981
            addi         a6, a6, 14 /* [arg0+0x16]+0xe */      #   ee: eb66
            addi         a7, a7, -14 /* [[arg0+0x4]+0x4]-0xe */ #   f0: 72c7f2
            s32i         a7, a3, 4 /* [[arg0+0x4]+0x4]-0xe -> [[arg0+0x4]+0x4] */ #   f3: 7913
            s16i         a6, a12, 22 /* [arg0+0x16]+0xe -> [arg0+0x16] */ #   f5: 625c0b
            j            .Lbr006                               #   f8: 060800
.Lbr005:    srli         a8, a4, 8                             #   fb: 408841
            movi         a10, 0x0000fff8                       #   fe: a1d8ff
            l16ui        a9, a12, 22 /* [arg0+0x16] */         #  101: 921c0b
            addi         a2, a0, 8 /* [[arg0+0x4]+0x4]+0x8 */  #  104: 8b20
            addi         a11, a0, -6 /* [[arg0+0x4]+0x4]-0x6 */ #  106: b2c0fa
            s32i         a11, sp, 32 /* [[arg0+0x4]+0x4]-0x6 -> [(local1)] */ #  109: b981
            s32i         a2, a3, 4 /* [[arg0+0x4]+0x4]+0x8 -> [[arg0+0x4]+0x4] */ #  10b: 2913
            s32i         a11, a3, 4 /* [[arg0+0x4]+0x4]-0x6 -> [[arg0+0x4]+0x4] */ #  10d: b913
            add          a9, a9, a10 /* [arg0+0x16]+0xfff8 */  #  10f: aa99
            addi         a9, a9, 14 /* [arg0+0x16]+0x10006 */  #  111: eb99
            s16i         a9, a12, 22 /* [arg0+0x16]+0x10006 -> [arg0+0x16] */ #  113: 925c0b
            s8i          a4, a0, 6 /* a4 -> [[[arg0+0x4]+0x4]+0x6] */ #  116: 424006
            s8i          a8, a0, 7 /* a8 -> [[[arg0+0x4]+0x4]+0x7] */ #  119: 824007
.Lbr006:    l8ui         a0, sp, 1 /* [(local0)] */            #  11c: 020101
            extui        a0, a0, 0, 2                          #  11f: 000014
            beqz         a0, .Lbr007                           #  122: ac20
            beqi         a0, 1, .Lbr009                        #  124: 261045
            bnei         a0, 2, .Lbr008                        #  127: 662037
            l32i         a2, sp, 32 /* [(local1)] */           #  12a: 2881
            addi         a3, sp, 4 /* (FP)-0x2c */             #  12c: 4b31
            movi         a4, 6 /* 0x00000006 */                #  12e: 0c64
            call0        memcpy                                #  130: 01cfffc0
                                                               #  134: 0000
            addi         a3, sp, 16 /* (FP)-0x20 */            #  136: 32c110
            l32i         a2, sp, 32 /* [(local1)] */           #  139: 2881
            movi         a4, 6 /* 0x00000006 */                #  13b: 0c64
            addi         a2, a2, 6 /* [(local1)]+0x6 */        #  13d: 6b22
            call0        memcpy                                #  13f: 01ccffc0
                                                               #  143: 0000
            j            .Lbr008                               #  145: 460600
.Lbr007:    l32i         a2, sp, 32 /* [(local1)] */           #  148: 2881
            addi         a3, sp, 4 /* (FP)-0x2c */             #  14a: 4b31
            movi         a4, 6 /* 0x00000006 */                #  14c: 0c64
            call0        memcpy                                #  14e: 01c9ffc0
                                                               #  152: 0000
            addi         a3, sp, 10 /* (FP)-0x26 */            #  154: ab31
            l32i         a2, sp, 32 /* [(local1)] */           #  156: 2881
            movi         a4, 6 /* 0x00000006 */                #  158: 0c64
            addi         a2, a2, 6 /* [(local1)]+0x6 */        #  15a: 6b22
            call0        memcpy                                #  15c: 01c7ffc0
                                                               #  160: 0000
.Lbr008:    mov          a2, a12                               #  162: 2d0c
            l32i         a0, sp, 36 /* [(local2)] */           #  164: 0891
            l32i         a12, sp, 40 /* [(local3)] */          #  166: c8a1
            addi         sp, sp, 48 /* (top of frame) */       #  168: 12c130
            ret                                                #  16b: 0df0
.Lbr009:    l32i         a2, sp, 32 /* [(local1)] */           #  16d: 2881
            addi         a3, sp, 16 /* (FP)-0x20 */            #  16f: 32c110
            movi         a4, 6 /* 0x00000006 */                #  172: 0c64
            call0        memcpy                                #  174: 01c2ffc0
                                                               #  178: 0000
            addi         a3, sp, 10 /* (FP)-0x26 */            #  17a: ab31
            l32i         a2, sp, 32 /* [(local1)] */           #  17c: 2881
            movi         a4, 6 /* 0x00000006 */                #  17e: 0c64
            addi         a2, a2, 6 /* [(local1)]+0x6 */        #  180: 6b22
            call0        memcpy                                #  182: 01bfffc0
                                                               #  186: 0000
            j            .Lbr008                               #  188: 86f5ff

            .literal_position                                  #  18c: 00000000
                                                               #  190: 00000000
                                                               #  194: 00000000

# Function @ .irom0.text+0x198
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_ieee80211_setup_rates
            .type        sdk_ieee80211_setup_rates, @function
sdk_ieee80211_setup_rates:
            addi         sp, sp, -16 /* (local0) */            #  198: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  19b: 0901
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  19d: e931
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  19f: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  1a1: c911
            mov          a13, a4 /* arg2 */                    #  1a3: dd04
            mov          a12, a2 /* arg0 */                    #  1a5: cd02
            mov          a14, a3 /* arg1 */                    #  1a7: ed03
            addi         a2, a2, 71 /* arg0+0x47 */            #  1a9: 22c247
            movi         a3, 0 /* 0x00000000 */                #  1ac: 0c03
            movi         a4, 16 /* 0x00000010 */               #  1ae: 1c04
            call0        memset                                #  1b0: 01f7ffc0
                                                               #  1b4: 0000
            addi         a3, a14, 2 /* arg1+0x2 */             #  1b6: 2b3e
            addi         a2, a12, 72 /* arg0+0x48 */           #  1b8: 22cc48
            l8ui         a4, a14, 1 /* [arg1+0x1] */           #  1bb: 420e01
            s8i          a4, a12, 71 /* [arg1+0x1] -> [arg0+0x47] */ #  1be: 424c47
            call0        memcpy                                #  1c1: 01f3ffc0
                                                               #  1c5: 0000
            beqz         a13, .Lbr011                          #  1c7: ac8d
            l8ui         a0, a12, 71 /* [arg0+0x47] */         #  1c9: 020c47
            l8ui         a14, a13, 1 /* [arg2+0x1] */          #  1cc: e20d01
            add          a2, a14, a0                           #  1cf: 0a2e
            blti         a2, 16, .Lbr010                       #  1d1: a6b207
            movi         a14, 15 /* 0x0000000f */              #  1d4: 0cfe
            sub          a14, a14, a0                          #  1d6: 00eec0
            extui        a14, a14, 0, 8                        #  1d9: e0e074
.Lbr010:    addi         a3, a13, 2 /* arg2+0x2 */             #  1dc: 2b3d
            mov          a4, a14                               #  1de: 4d0e
            add          a2, a0, a12                           #  1e0: ca20
            addi         a2, a2, 72                            #  1e2: 22c248
            call0        memcpy                                #  1e5: 01ebffc0
                                                               #  1e9: 0000
            l8ui         a3, a12, 71 /* [arg0+0x47] */         #  1eb: 320c47
            add          a3, a3, a14                           #  1ee: ea33
            s8i          a3, a12, 71 /* a3 -> [arg0+0x47] */   #  1f0: 324c47
.Lbr011:    movi         a2, 0 /* 0x00000000 */                #  1f3: 0c02
            l32i         a12, sp, 4 /* [(local1)] */           #  1f5: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  1f7: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  1f9: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  1fb: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  1fd: 12c110
            ret           /* 0x00000000 */                     #  200: 0df0

            .literal_position                                  #  204: 00000000

# Function @ .irom0.text+0x208
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_ieee80211_alloc_challenge
            .type        sdk_ieee80211_alloc_challenge, @function
sdk_ieee80211_alloc_challenge:
            addi         sp, sp, -16 /* (local0) */            #  208: 12c1f0
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  20b: 2901
            l32i         a2, a2, 84 /* [arg0+0x54] */          #  20d: 222215
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  210: 0911
            bnez         a2, .Lbr012                           #  212: ccc2
            movi         a2, 128 /* 0x00000080 */              #  214: 22a080
            call0        malloc                                #  217: 01fbffc0
                                                               #  21b: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  21d: 0801
            s32i         a2, a0, 84 /* a2 -> [[(local0)]+0x54] */ #  21f: 226015
.Lbr012:    l32i         a0, sp, 4 /* [(local1)] */            #  222: 0811
            movi         a3, 1 /* 0x00000001 */                #  224: 0c13
            movnez       a2, a3, a2                            #  226: 202393
            addi         sp, sp, 16 /* (top of frame) */       #  229: 12c110
            ret                                                #  22c: 0df0

            .literal_position                                  #  230: 00000000
                                                               #  234: 0050f202
                                                               #  238: 0050f201
                                                               #  23c: 00904c33
                                                               #  240: 00904c34
                                                               #  244: 00000000
                                                               #  248: 00000000

# Function @ .irom0.text+0x24c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
            .global      sdk_ieee80211_parse_beacon
            .type        sdk_ieee80211_parse_beacon, @function
sdk_ieee80211_parse_beacon:
            addi         sp, sp, -32 /* (local0) */            #  24c: 12c1e0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  24f: 0911
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  251: c921
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   #  253: f951
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  255: e941
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  257: d931
            mov          a14, a2 /* arg0 */                    #  259: ed02
            l32i         a13, a2, 4 /* [arg0+0x4] */           #  25b: d812
            l16ui        a15, a2, 22 /* [arg0+0x16] */         #  25d: f2120b
            l32i         a13, a13, 4 /* [[arg0+0x4]+0x4] */    #  260: d81d
            mov          a12, a3 /* arg1 */                    #  262: cd03
            add          a15, a15, a13                         #  264: daff
            addi         a15, a15, 24                          #  266: f2cf18
            sub          a5, a15, a13                          #  269: d05fc0
            addi         a0, a5, -24                           #  26c: 02c5e8
            bgei         a0, 12, .Lbr013                       #  26f: e6a002
            j            .Lbr044                               #  272: 068d00
.Lbr013:    mov          a2, a3 /* arg1 */                     #  275: 2d03
            s32i         a5, sp, 0 /* a5 -> [(local0)] */      #  277: 5901
            movi         a3, 72 /* 0x00000048 */               #  279: 4c83
            call0        bzero                                 #  27b: 01f2ffc0
                                                               #  27f: 0000
            addi         a5, a13, 24 /* [[arg0+0x4]+0x4]+0x18 */ #  281: 52cd18
            l16ui        a4, a13, 32 /* [[[arg0+0x4]+0x4]+0x20] */ #  284: 421d10
            s16i         a4, a12, 6 /* [[[arg0+0x4]+0x4]+0x20] -> [arg1+0x6] */ #  287: 425c03
            l16ui        a3, a13, 34 /* [[[arg0+0x4]+0x4]+0x22] */ #  28a: 321d11
            s32i         a5, a12, 24 /* [[arg0+0x4]+0x4]+0x18 -> [arg1+0x18] */ #  28d: 596c
            addi         a13, a13, 36 /* [[arg0+0x4]+0x4]+0x24 */ #  28f: d2cd24
            l32i         a2, a14, 32 /* [arg0+0x20] */         #  292: 288e
            s16i         a3, a12, 2 /* [[[arg0+0x4]+0x4]+0x22] -> [arg1+0x2] */ #  294: 325c01
            l32i         a2, a2, 8 /* [[arg0+0x20]+0x8] */     #  297: 2822
            call0        sdk_ieee80211_chan2ieee               #  299: 01ebffc0
                                                               #  29d: 0000
            s32i         a13, a12, 12 /* [[arg0+0x4]+0x4]+0x24 -> [arg1+0xc] */ #  29f: d93c
            movi         a6, 221 /* 0x000000dd */              #  2a1: 62a0dd
            s8i          a2, a12, 1 /* a2 -> [arg1+0x1] */     #  2a4: 224c01
            l32i         a7, sp, 0 /* [(local0)] */            #  2a7: 7801
            extui        a3, a2, 0, 8                          #  2a9: 203074
            s8i          a3, a12, 0 /* a3 -> [arg1] */         #  2ac: 324c00
            addi         a7, a7, -36 /* [(local0)]-0x24 */     #  2af: 72c7dc
            s32i         a7, a12, 16 /* [(local0)]-0x24 -> [arg1+0x10] */ #  2b2: 794c
            bgei         a7, 2, .Lbr014                        #  2b4: e62702
            j            .Lbr045                               #  2b7: 067d00
.Lbr014:    movi         a8, 0x02f25000                        #  2ba: 81deff
            movi         a10, 50 /* 0x00000032 */              #  2bd: 3c2a
            movi         a11, 45 /* 0x0000002d */              #  2bf: 2cdb
            movi         a9, sdk_g_ic+0x1d8                    #  2c1: 91dbff
            sub          a2, a15, a13                          #  2c4: d02fc0
.Lbr015:    l8ui         a0, a13, 1                            #  2c7: 020d01
            mov          a7, a13                               #  2ca: 7d0d
            addi         a4, a0, 2                             #  2cc: 2b40
            bge          a2, a4, .Lbr016                       #  2ce: 47a202
            j            .Lbr044                               #  2d1: 467500
.Lbr016:    l8ui         a2, a13, 0                            #  2d4: 220d00
            movi         a5, 32 /* 0x00000020 */               #  2d7: 2c05
            bgei         a2, 32, .Lbr017                       #  2d9: e6c202
            j            .Lbr037                               #  2dc: 065e00
.Lbr017:    bge          a5, a2, .Lbr020                       #  2df: 27a50d
            bge          a2, a10, .Lbr018                      #  2e2: a7a202
            j            .Lbr034                               #  2e5: c64f00
.Lbr018:    blt          a10, a2, .Lbr021                      #  2e8: 272a11
            s32i         a13, a12, 40 /* a13 -> [arg1+0x28] */ #  2eb: d9ac
.Lbr019:    l8ui         a0, a7, 1                             #  2ed: 020701
.Lbr020:    add          a13, a0, a7                           #  2f0: 7ad0
            addi         a13, a13, 2                           #  2f2: 2bdd
            sub          a2, a15, a13                          #  2f4: d02fc0
            bgei         a2, 2, .Lbr015                        #  2f7: e622cc
            j            .Lbr045                               #  2fa: 466c00
.Lbr021:    bge          a2, a6, .Lbr022                       #  2fd: 67a202
            j            .Lbr033                               #  300: 064600
.Lbr022:    blt          a6, a2, .Lbr020                       #  303: 2726e9
            movi         a2, 0 /* 0x00000000 */                #  306: 0c02
            bltui        a0, 4, .Lbr023                        #  308: b64025
            l8ui         a5, a13, 3                            #  30b: 520d03
            l8ui         a4, a13, 2                            #  30e: 420d02
            slli         a5, a5, 8                             #  311: 805511
            l8ui         a13, a13, 5                           #  314: d20d05
            or           a4, a4, a5                            #  317: 504420
            l8ui         a5, a7, 4                             #  31a: 520704
            slli         a13, a13, 24                          #  31d: 80dd01
            slli         a5, a5, 16                            #  320: 005511
            or           a5, a5, a13                           #  323: d05520
            or           a4, a4, a5                            #  326: 504420
            movi         a5, 0x01f25000                        #  329: 51c3ff
            bne          a4, a5, .Lbr023                       #  32c: 579401
            movi         a2, 1 /* 0x00000001 */                #  32f: 0c12
.Lbr023:    beqz         a2, .Lbr025                           #  331: 8c62
            s32i         a7, a12, 48 /* a7 -> [arg1+0x30] */   #  333: 79cc
.Lbr024:    l8ui         a0, a7, 1                             #  335: 020701
            j            .Lbr020                               #  338: 06edff
.Lbr025:    movi         a2, 0 /* 0x00000000 */                #  33b: 0c02
            bltui        a0, 6, .Lbr026                        #  33d: b66028
            l8ui         a5, a7, 5                             #  340: 520705
            l8ui         a4, a7, 3                             #  343: 420703
            l8ui         a13, a7, 2                            #  346: d20702
            slli         a4, a4, 8                             #  349: 804411
            or           a13, a13, a4                          #  34c: 40dd20
            l8ui         a4, a7, 4                             #  34f: 420704
            slli         a5, a5, 24                            #  352: 805501
            slli         a4, a4, 16                            #  355: 004411
            or           a4, a4, a5                            #  358: 504420
            or           a13, a13, a4                          #  35b: 40dd20
            bne          a13, a8, .Lbr026                      #  35e: 879d07
            l8ui         a5, a7, 6                             #  361: 520706
            bnei         a5, 1, .Lbr026                        #  364: 661501
            movi         a2, 1 /* 0x00000001 */                #  367: 0c12
.Lbr026:    bnez         a2, .Lbr028                           #  369: ece2
            movi         a2, 0 /* 0x00000000 */                #  36b: 0c02
            bltui        a0, 6, .Lbr027                        #  36d: b66028
            l8ui         a5, a7, 5                             #  370: 520705
            l8ui         a4, a7, 3                             #  373: 420703
            l8ui         a13, a7, 2                            #  376: d20702
            slli         a4, a4, 8                             #  379: 804411
            or           a13, a13, a4                          #  37c: 40dd20
            l8ui         a4, a7, 4                             #  37f: 420704
            slli         a5, a5, 24                            #  382: 805501
            slli         a4, a4, 16                            #  385: 004411
            or           a4, a4, a5                            #  388: 504420
            or           a13, a13, a4                          #  38b: 40dd20
            bne          a13, a8, .Lbr027                      #  38e: 879d07
            l8ui         a13, a7, 6                            #  391: d20706
            movi         a5, 1 /* 0x00000001 */                #  394: 0c15
            moveqz       a2, a5, a13                           #  396: d02583
.Lbr027:    beqz         a2, .Lbr029                           #  399: 8c32
.Lbr028:    s32i         a7, a12, 56 /* a7 -> [arg1+0x38] */   #  39b: 79ec
            j            .Lbr024                               #  39d: 06e5ff
.Lbr029:    l32i         a2, a9, 0x334 /* [sdk_g_ic+0x50c] */  #  3a0: 2229cd
            extui        a2, a2, 28, 1                         #  3a3: 202c05
            beqz         a2, .Lbr020                           #  3a6: 1662f4
            movi         a2, 0 /* 0x00000000 */                #  3a9: 0c02
            bltui        a0, 4, .Lbr030                        #  3ab: b64025
            l8ui         a13, a7, 5                            #  3ae: d20705
            l8ui         a5, a7, 3                             #  3b1: 520703
            l8ui         a4, a7, 2                             #  3b4: 420702
            slli         a5, a5, 8                             #  3b7: 805511
            or           a4, a4, a5                            #  3ba: 504420
            l8ui         a5, a7, 4                             #  3bd: 520704
            slli         a13, a13, 24                          #  3c0: 80dd01
            slli         a5, a5, 16                            #  3c3: 005511
            or           a5, a5, a13                           #  3c6: d05520
            or           a4, a4, a5                            #  3c9: 504420
            movi         a5, 0x334c9000                        #  3cc: 519cff
            bne          a4, a5, .Lbr030                       #  3cf: 579401
            movi         a2, 1 /* 0x00000001 */                #  3d2: 0c12
.Lbr030:    beqz         a2, .Lbr031                           #  3d4: 8cb2
            l32i         a13, a12, 60 /* [arg1+0x3c] */        #  3d6: d8fc
            bnez         a13, .Lbr020                          #  3d8: 564df1
            s32i         a7, a12, 60 /* a7 -> [arg1+0x3c] */   #  3db: 79fc
            l8ui         a0, a7, 1                             #  3dd: 020701
            j            .Lbr020                               #  3e0: 06c3ff
.Lbr031:    movi         a2, 0 /* 0x00000000 */                #  3e3: 0c02
            bltui        a0, 4, .Lbr032                        #  3e5: b64025
            l8ui         a13, a7, 5                            #  3e8: d20705
            l8ui         a5, a7, 3                             #  3eb: 520703
            l8ui         a4, a7, 2                             #  3ee: 420702
            slli         a5, a5, 8                             #  3f1: 805511
            or           a4, a4, a5                            #  3f4: 504420
            l8ui         a5, a7, 4                             #  3f7: 520704
            slli         a13, a13, 24                          #  3fa: 80dd01
            slli         a5, a5, 16                            #  3fd: 005511
            or           a5, a5, a13                           #  400: d05520
            or           a4, a4, a5                            #  403: 504420
            movi         a5, 0x344c9000                        #  406: 518eff
            bne          a4, a5, .Lbr032                       #  409: 579401
            movi         a2, 1 /* 0x00000001 */                #  40c: 0c12
.Lbr032:    beqz         a2, .Lbr020                           #  40e: 16e2ed
            l32i         a13, a12, 64 /* [arg1+0x40] */        #  411: d22c10
            bnez         a13, .Lbr020                          #  414: 568ded
            s32i         a7, a12, 60 /* a7 -> [arg1+0x3c] */   #  417: 79fc
            j            .Lbr024                               #  419: 06c6ff
.Lbr033:    addi         a4, a2, -61                           #  41c: 42c2c3
            bnez         a4, .Lbr020                           #  41f: 56d4ec
            s32i         a13, a12, 64 /* a13 -> [arg1+0x40] */ #  422: d26c10
            j            .Lbr019                               #  425: 06b1ff
.Lbr034:    blt          a2, a11, .Lbr036                      #  428: b72212
            blt          a11, a2, .Lbr035                      #  42b: 272b04
            s32i         a13, a12, 60 /* a13 -> [arg1+0x3c] */ #  42e: d9fc
            j            .Lbr019                               #  430: 46aeff
.Lbr035:    addi         a5, a2, -48                           #  433: 52c2d0
            bnez         a5, .Lbr020                           #  436: 5665eb
            s32i         a13, a12, 52 /* a13 -> [arg1+0x34] */ #  439: d9dc
            j            .Lbr019                               #  43b: 86abff
.Lbr036:    addi         a13, a2, -42                          #  43e: d2c2d6
            bnez         a13, .Lbr020                          #  441: 56bdea
            addi         a2, a0, -1                            #  444: 0b20
            bnez         a2, .Lbr020                           #  446: 5662ea
            l8ui         a4, a7, 2                             #  449: 420702
            movi         a5, 256 /* 0x00000100 */              #  44c: 52a100
            or           a4, a4, a5                            #  44f: 504420
            s16i         a4, a12, 4 /* a4 -> [arg1+0x4] */     #  452: 425c02
            j            .Lbr019                               #  455: 06a5ff
.Lbr037:    blti         a2, 4, .Lbr041                        #  458: a6422c
            bgei         a2, 5, .Lbr038                        #  45b: e65202
            j            .Lbr020                               #  45e: 86a3ff
.Lbr038:    blti         a2, 6, .Lbr040                        #  461: a66210
            bgei         a2, 7, .Lbr039                        #  464: e67202
            j            .Lbr020                               #  467: 46a1ff
.Lbr039:    addi         a13, a2, -7                           #  46a: d2c2f9
            bnez         a13, .Lbr020                          #  46d: 56fde7
            s32i         a7, a12, 28 /* a7 -> [arg1+0x1c] */   #  470: 797c
            j            .Lbr019                               #  472: c69dff
.Lbr040:    addi         a4, a2, -5                            #  475: 42c2fb
            bnez         a4, .Lbr020                           #  478: 5644e7
            s32i         a13, a12, 20 /* a13 -> [arg1+0x14] */ #  47b: d95c
            l32i         a5, a14, 16 /* [arg0+0x10] */         #  47d: 584e
            sub          a5, a13, a5                           #  47f: 505dc0
            s8i          a5, a12, 8 /* a5 -> [arg1+0x8] */     #  482: 524c08
            j            .Lbr019                               #  485: 0699ff
.Lbr041:    blti         a2, 1, .Lbr043                        #  488: a61216
            bgei         a2, 2, .Lbr042                        #  48b: e62204
            s32i         a13, a12, 36 /* a13 -> [arg1+0x24] */ #  48e: d99c
            j            .Lbr019                               #  490: 4696ff
.Lbr042:    addi         a13, a2, -3                           #  493: d2c2fd
            bnez         a13, .Lbr020                          #  496: 566de5
            l8ui         a3, a7, 2                             #  499: 320702
            s8i          a3, a12, 0 /* a3 -> [arg1] */         #  49c: 324c00
            j            .Lbr019                               #  49f: 8692ff
.Lbr043:    bnez         a2, .Lbr020                           #  4a2: 56a2e4
            s32i         a13, a12, 32 /* a13 -> [arg1+0x20] */ #  4a5: d98c
            j            .Lbr019                               #  4a7: 8690ff
.Lbr044:    movi         a2, 1 /* 0x00000001 */                #  4aa: 0c12
            j            .Lbr054                               #  4ac: 862100
.Lbr045:    l32i         a0, a12, 36 /* [arg1+0x24] */         #  4af: 089c
            l32i         a7, a12, 40 /* [arg1+0x28] */         #  4b1: 78ac
            beqz         a0, .Lbr055                           #  4b3: 16e008
            l8ui         a14, a0, 1 /* [[arg1+0x24]+0x1] */    #  4b6: e20001
            bltui        a14, 16, .Lbr046                      #  4b9: b6be02
            j            .Lbr055                               #  4bc: 462100
.Lbr046:    movi         a2, 0 /* 0x00000000 */                #  4bf: 0c02
.Lbr047:    beqz         a0, .Lbr048                           #  4c1: 9c30
            beqz         a7, .Lbr048                           #  4c3: 9c17
            l8ui         a4, a7, 1 /* [[arg1+0x28]+0x1] */     #  4c5: 420701
            l8ui         a5, a0, 1 /* [[arg1+0x24]+0x1] */     #  4c8: 520001
            movi         a15, 15 /* 0x0000000f */              #  4cb: 0cff
            sub          a15, a15, a5                          #  4cd: 50ffc0
            bge          a15, a4, .Lbr048                      #  4d0: 47af04
            movi         a7, 4 /* 0x00000004 */                #  4d3: 0c47
            or           a2, a2, a7                            #  4d5: 702220
.Lbr048:    movi         a7, 8 /* 0x00000008 */                #  4d8: 0c87
            l32i         a0, a12, 32 /* [arg1+0x20] */         #  4da: 088c
            l8ui         a10, a12, 1 /* [arg1+0x1] */          #  4dc: a20c01
            beqz         a0, .Lbr049                           #  4df: 8c60
            l8ui         a9, a0, 1 /* [[arg1+0x20]+0x1] */     #  4e1: 920001
            movi         a8, 32 /* 0x00000020 */               #  4e4: 2c08
            bgeu         a8, a9, .Lbr050                       #  4e6: 97b802
.Lbr049:    or           a2, a2, a7                            #  4e9: 702220
.Lbr050:    l32i         a0, a12, 28 /* [arg1+0x1c] */         #  4ec: 087c
            beq          a10, a3, .Lbr051                      #  4ee: 371a04
            movi         a11, 32 /* 0x00000020 */              #  4f1: 2c0b
            or           a2, a2, a11                           #  4f3: b02220
.Lbr051:    movi         a3, 0 /* 0x00000000 */                #  4f6: 0c03
            beqz         a0, .Lbr052                           #  4f8: 8c60
            l8ui         a13, a0, 1 /* [[arg1+0x1c]+0x1] */    #  4fa: d20001
            bgeui        a13, 3, .Lbr052                       #  4fd: f63d01
            s32i         a3, a12, 28 /* 0x00000000 -> [arg1+0x1c] */ #  500: 397c
.Lbr052:    l32i         a0, a12, 60 /* [arg1+0x3c] */         #  502: 08fc
            movi         a8, 26 /* 0x0000001a */               #  504: 1ca8
            beqz         a0, .Lbr053                           #  506: 9c30
            l8ui         a14, a0, 1 /* [[arg1+0x3c]+0x1] */    #  508: e20001
            movi         a4, 30 /* 0x0000001e */               #  50b: 1ce4
            l8ui         a5, a0, 0 /* [[arg1+0x3c]] */         #  50d: 520000
            mov          a15, a8 /* 0x0000001a */              #  510: fd08
            sub          a5, a5, a6 /* [[arg1+0x3c]]-0xdd */   #  512: 6055c0
            moveqz       a15, a4, a5                           #  515: 50f483
            bgeu         a14, a15, .Lbr053                     #  518: f7be01
            s32i         a3, a12, 60 /* 0x00000000 -> [arg1+0x3c] */ #  51b: 39fc
.Lbr053:    l32i         a0, a12, 64 /* [arg1+0x40] */         #  51d: 022c10
            movi         a9, 22 /* 0x00000016 */               #  520: 1c69
            beqz         a0, .Lbr054                           #  522: 9c00
            l8ui         a10, a0, 0 /* [[arg1+0x40]] */        #  524: a20000
            l8ui         a7, a0, 1 /* [[arg1+0x40]+0x1] */     #  527: 720001
            sub          a10, a10, a6 /* [[arg1+0x40]]-0xdd */ #  52a: 60aac0
            moveqz       a9, a8, a10                           #  52d: a09883
            bgeu         a7, a9, .Lbr054                       #  530: 97b702
            s32i         a3, a12, 64 /* 0x00000000 -> [arg1+0x40] */ #  533: 326c10
.Lbr054:    l32i         a12, sp, 8 /* [(local2)] */           #  536: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  538: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  53a: e841
            l32i         a15, sp, 20 /* [(local5)] */          #  53c: f851
            l32i         a0, sp, 4 /* [(local1)] */            #  53e: 0811
            addi         sp, sp, 32 /* (top of frame) */       #  540: 12c120
            ret                                                #  543: 0df0
.Lbr055:    movi         a2, 2 /* 0x00000002 */                #  545: 0c22
            j            .Lbr047                               #  547: 86ddff

            .literal_position                                  #  54c: 0050f200
                                                               #  550: 0050f201
                                                               #  554: 0050f202
                                                               #  558: 0050f204
                                                               #  55c: 0050f205

# Function @ .irom0.text+0x560
            .balign      4
.Lfunc001:  movi         a4, 0x00f25000                        #  560: 41fbff
            l8ui         a7, a2, 3 /* [arg0+0x3] */            #  563: 720203
            l8ui         a6, a2, 1 /* [arg0+0x1] */            #  566: 620201
            l8ui         a5, a2, 0 /* [arg0] */                #  569: 520200
            slli         a6, a6, 8                             #  56c: 806611
            or           a5, a5, a6                            #  56f: 605520
            l8ui         a6, a2, 2 /* [arg0+0x2] */            #  572: 620202
            slli         a7, a7, 24                            #  575: 807701
            slli         a6, a6, 16                            #  578: 006611
            or           a6, a6, a7                            #  57b: 706620
            or           a2, a5, a6                            #  57e: 602520
            beq          a2, a4, .Lbr059                       #  581: 471231
            movi         a7, 0x01f25000                        #  584: 71f3ff
            movi         a8, 0x02f25000                        #  587: 81f3ff
            beq          a2, a7, .Lbr058                       #  58a: 77121d
            beq          a2, a8, .Lbr060                       #  58d: 871229
            movi         a9, 0x04f25000                        #  590: 91f2ff
            movi         a10, 0x05f25000                       #  593: a1f2ff
            beq          a2, a9, .Lbr061                       #  596: 971224
            beq          a2, a10, .Lbr056                      #  599: a71203
            movi         a2, 32 /* 0x00000020 */               #  59c: 2c02
            ret           /* 0x00000020 */                     #  59e: 0df0
.Lbr056:    beqz         a3, .Lbr057                           #  5a0: 8c33
            movi         a11, 13 /* 0x0000000d */              #  5a2: 0cdb
            s8i          a11, a3, 0 /* 0x0d -> [arg1] */       #  5a4: b24300
.Lbr057:    movi         a2, 6 /* 0x00000006 */                #  5a7: 0c62
            ret           /* 0x00000006 */                     #  5a9: 0df0
.Lbr058:    beqz         a3, .Lbr057                           #  5ab: 1683ff
            movi         a2, 5 /* 0x00000005 */                #  5ae: 0c52
            s8i          a2, a3, 0 /* 0x05 -> [arg1] */        #  5b0: 224300
            j            .Lbr057                               #  5b3: 06fcff
.Lbr059:    movi         a2, 0 /* 0x00000000 */                #  5b6: 0c02
            ret           /* 0x00000000 */                     #  5b8: 0df0
.Lbr060:    movi         a2, 1 /* 0x00000001 */                #  5ba: 0c12
            ret           /* 0x00000001 */                     #  5bc: 0df0
.Lbr061:    movi         a2, 3 /* 0x00000003 */                #  5be: 0c32
            ret           /* 0x00000003 */                     #  5c0: 0df0

            .literal_position                                  #  5c4: 0050f200
                                                               #  5c8: 0050f201
                                                               #  5cc: 0050f202

# Function @ .irom0.text+0x5d0
            .balign      4
.Lfunc002:  movi         a3, 0x00f25000                        #  5d0: 31fdff
            l8ui         a6, a2, 3 /* [arg0+0x3] */            #  5d3: 620203
            l8ui         a5, a2, 1 /* [arg0+0x1] */            #  5d6: 520201
            l8ui         a4, a2, 0 /* [arg0] */                #  5d9: 420200
            slli         a5, a5, 8                             #  5dc: 805511
            or           a4, a4, a5                            #  5df: 504420
            l8ui         a5, a2, 2 /* [arg0+0x2] */            #  5e2: 520202
            slli         a6, a6, 24                            #  5e5: 806601
            slli         a5, a5, 16                            #  5e8: 005511
            or           a5, a5, a6                            #  5eb: 605520
            or           a2, a4, a5                            #  5ee: 502420
            beq          a2, a3, .Lbr062                       #  5f1: 37120b
            movi         a6, 0x01f25000                        #  5f4: 61f5ff
            movi         a7, 0x02f25000                        #  5f7: 71f5ff
            beq          a2, a6, .Lbr064                       #  5fa: 67120a
            beq          a2, a7, .Lbr063                       #  5fd: 771203
.Lbr062:    movi         a2, 0 /* 0x00000000 */                #  600: 0c02
            ret           /* 0x00000000 */                     #  602: 0df0
.Lbr063:    movi         a2, 2 /* 0x00000002 */                #  604: 0c22
            ret           /* 0x00000002 */                     #  606: 0df0
.Lbr064:    movi         a2, 1 /* 0x00000001 */                #  608: 0c12
            ret           /* 0x00000001 */                     #  60a: 0df0

            .literal_position                                  #  60c: 000fac00
                                                               #  610: 000fac01
                                                               #  614: 000fac02
                                                               #  618: 000fac03
                                                               #  61c: 000fac04
                                                               #  620: 000fac05

# Function @ .irom0.text+0x624
            .balign      4
.Lfunc003:  movi         a4, 0x00ac0f00                        #  624: 41faff
            l8ui         a7, a2, 3 /* [arg0+0x3] */            #  627: 720203
            l8ui         a6, a2, 1 /* [arg0+0x1] */            #  62a: 620201
            l8ui         a5, a2, 0 /* [arg0] */                #  62d: 520200
            slli         a6, a6, 8                             #  630: 806611
            or           a5, a5, a6                            #  633: 605520
            l8ui         a6, a2, 2 /* [arg0+0x2] */            #  636: 620202
            slli         a7, a7, 24                            #  639: 807701
            slli         a6, a6, 16                            #  63c: 006611
            or           a6, a6, a7                            #  63f: 706620
            or           a2, a5, a6                            #  642: 602520
            beq          a2, a4, .Lbr068                       #  645: 471237
            movi         a7, 0x01ac0f00                        #  648: 71f2ff
            movi         a8, 0x02ac0f00                        #  64b: 81f2ff
            beq          a2, a7, .Lbr067                       #  64e: 771223
            beq          a2, a8, .Lbr069                       #  651: 87122f
            movi         a9, 0x03ac0f00                        #  654: 91f1ff
            movi         a10, 0x04ac0f00                       #  657: a1f1ff
            beq          a2, a9, .Lbr070                       #  65a: 97122a
            beq          a2, a10, .Lbr071                      #  65d: a7122b
            movi         a11, 0x05ac0f00                       #  660: b1f0ff
            beq          a2, a11, .Lbr065                      #  663: b71203
            movi         a2, 32 /* 0x00000020 */               #  666: 2c02
            ret           /* 0x00000020 */                     #  668: 0df0
.Lbr065:    beqz         a3, .Lbr066                           #  66a: 8c33
            movi         a2, 13 /* 0x0000000d */               #  66c: 0cd2
            s8i          a2, a3, 0 /* 0x0d -> [arg1] */        #  66e: 224300
.Lbr066:    movi         a2, 6 /* 0x00000006 */                #  671: 0c62
            ret           /* 0x00000006 */                     #  673: 0df0
.Lbr067:    beqz         a3, .Lbr066                           #  675: 1683ff
            movi         a4, 5 /* 0x00000005 */                #  678: 0c54
            s8i          a4, a3, 0 /* 0x05 -> [arg1] */        #  67a: 424300
            j            .Lbr066                               #  67d: 06fcff
.Lbr068:    movi         a2, 0 /* 0x00000000 */                #  680: 0c02
            ret           /* 0x00000000 */                     #  682: 0df0
.Lbr069:    movi         a2, 1 /* 0x00000001 */                #  684: 0c12
            ret           /* 0x00000001 */                     #  686: 0df0
.Lbr070:    movi         a2, 2 /* 0x00000002 */                #  688: 0c22
            ret           /* 0x00000002 */                     #  68a: 0df0
.Lbr071:    movi         a2, 3 /* 0x00000003 */                #  68c: 0c32
            ret           /* 0x00000003 */                     #  68e: 0df0

            .literal_position                                  #  690: 000fac00
                                                               #  694: 000fac01
                                                               #  698: 000fac02

# Function @ .irom0.text+0x69c
            .balign      4
.Lfunc004:  movi         a3, 0x00ac0f00                        #  69c: 31fdff
            l8ui         a6, a2, 3 /* [arg0+0x3] */            #  69f: 620203
            l8ui         a5, a2, 1 /* [arg0+0x1] */            #  6a2: 520201
            l8ui         a4, a2, 0 /* [arg0] */                #  6a5: 420200
            slli         a5, a5, 8                             #  6a8: 805511
            or           a4, a4, a5                            #  6ab: 504420
            l8ui         a5, a2, 2 /* [arg0+0x2] */            #  6ae: 520202
            slli         a6, a6, 24                            #  6b1: 806601
            slli         a5, a5, 16                            #  6b4: 005511
            or           a5, a5, a6                            #  6b7: 605520
            or           a2, a4, a5                            #  6ba: 502420
            beq          a2, a3, .Lbr072                       #  6bd: 37120b
            movi         a6, 0x01ac0f00                        #  6c0: 61f5ff
            movi         a7, 0x02ac0f00                        #  6c3: 71f5ff
            beq          a2, a6, .Lbr074                       #  6c6: 67120a
            beq          a2, a7, .Lbr073                       #  6c9: 771203
.Lbr072:    movi         a2, 0 /* 0x00000000 */                #  6cc: 0c02
            ret           /* 0x00000000 */                     #  6ce: 0df0
.Lbr073:    movi         a2, 2 /* 0x00000002 */                #  6d0: 0c22
            ret           /* 0x00000002 */                     #  6d2: 0df0
.Lbr074:    movi         a2, 1 /* 0x00000001 */                #  6d4: 0c12
            ret           /* 0x00000001 */                     #  6d6: 0df0

            .literal_position                                  #  6d8: 00000000

# Function @ .irom0.text+0x6dc
# Local variables/stack:
#     (local0):  byte[4]   @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word      @ -0x8
#     (local7):  word      @ -0x4
            .balign      4
            .global      sdk_ieee80211_parse_wpa
            .type        sdk_ieee80211_parse_wpa, @function
sdk_ieee80211_parse_wpa:
            movi         a5, 0 /* 0x00000000 */                #  6dc: 0c05
            addi         sp, sp, -32 /* (local0) */            #  6de: 12c1e0
            s32i         a0, sp, 24 /* a0 -> [(local6)] */     #  6e1: 0961
            s8i          a5, sp, 0 /* 0x00 -> [(local0)] */    #  6e3: 524100
            l32i         a0, a2, 48 /* [arg0+0x30] */          #  6e6: 08c2
            beqz         a0, .Lbr075                           #  6e8: 9c50
            s32i         a0, sp, 16 /* [arg0+0x30] -> [(local4)] */ #  6ea: 0941
            l8ui         a3, a0, 7 /* [[arg0+0x30]+0x7] */     #  6ec: 320007
            l8ui         a2, a0, 6 /* [[arg0+0x30]+0x6] */     #  6ef: 220006
            slli         a3, a3, 8                             #  6f2: 803311
            or           a2, a2, a3                            #  6f5: 302220
            slli         a2, a2, 16                            #  6f8: 002211
            srai         a2, a2, 16                            #  6fb: 202031
            beqi         a2, 1, .Lbr078                        #  6fe: 261210
.Lbr075:    mov          a2, a5 /* 0x00000000 */               #  701: 2d05
            j            .Lbr077                               #  703: 060100
.Lbr076:    bltz         a0, .Lbr087                           #  706: 96300e
            movi         a2, 1 /* 0x00000001 */                #  709: 0c12
.Lbr077:    l32i         a0, sp, 24 /* [(local6)] */           #  70b: 0861
            addi         sp, sp, 32 /* (top of frame) */       #  70d: 12c120
            ret                                                #  710: 0df0
.Lbr078:    mov          a3, sp /* (local0) */                 #  712: 3d01
            addi         a2, a0, 8 /* [arg0+0x30]+0x8 */       #  714: 8b20
            movi         a4, 3 /* 0x00000003 */                #  716: 0c34
            l8ui         a6, a0, 1 /* [[arg0+0x30]+0x1] */     #  718: 620001
            movi         a5, sdk_g_ic+0x188                    #  71b: 51efff
            s32i         a5, sp, 20 /* sdk_g_ic+0x188 -> [(local5)] */ #  71e: 5951
            addi         a6, a6, -6 /* [[arg0+0x30]+0x1]-0x6 */ #  720: 62c6fa
            s32i         a6, sp, 4 /* [[arg0+0x30]+0x1]-0x6 -> [(local1)] */ #  723: 6911
            s8i          a4, a5, 128 /* 0x03 -> [sdk_g_ic+0x208] */ #  725: 424580
            call0        .Lfunc001                             #  728: 45e3ff
            movi         a5, 0 /* 0x00000000 */                #  72b: 0c05
            l32i         a6, sp, 16 /* [(local4)] */           #  72d: 6841
            l32i         a0, sp, 4 /* [(local1)] */            #  72f: 0811
            l32i         a7, sp, 20 /* [(local5)] */           #  731: 7851
            addi         a0, a0, -6 /* [(local1)]-0x6 */       #  733: 02c0fa
            s8i          a2, a7, 132 /* a2 -> [[(local5)]+0x84] */ #  736: 224784
            l8ui         a7, a6, 13 /* [[(local4)]+0xd] */     #  739: 72060d
            l8ui         a6, a6, 12 /* [[(local4)]+0xc] */     #  73c: 62060c
            slli         a7, a7, 8                             #  73f: 807711
            or           a6, a6, a7                            #  742: 706620
            extui        a6, a6, 0, 16                         #  745: 6060f4
.Lbr079:    beqz         a0, .Lbr082                           #  748: bc80
            s32i         a5, sp, 12 /* a5 -> [(local3)] */     #  74a: 5931
            s32i         a6, sp, 28 /* a6 -> [(local7)] */     #  74c: 6971
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  74e: 0911
            extui        a8, a5, 0, 16                         #  750: 5080f4
            bgeu         a8, a6, .Lbr082                       #  753: 67b82d
            l32i         a3, sp, 16 /* [(local4)] */           #  756: 3841
            l32i         a2, sp, 12 /* [(local3)] */           #  758: 2831
            addx4        a2, a2, a3                            #  75a: 3022a0
            addi         a2, a2, 14                            #  75d: eb22
            mov          a3, sp /* (local0) */                 #  75f: 3d01
            call0        .Lfunc001                             #  761: c5dfff
            l32i         a0, sp, 20 /* [(local5)] */           #  764: 0851
            l32i         a6, sp, 28 /* [(local7)] */           #  766: 6871
            l8ui         a0, a0, 130 /* [[(local5)]+0x82] */   #  768: 020082
            l32i         a5, sp, 12 /* [(local3)] */           #  76b: 5831
            beqz         a0, .Lbr080                           #  76d: 8c10
            bnei         a0, 1, .Lbr081                        #  76f: 661004
.Lbr080:    l32i         a3, sp, 20 /* [(local5)] */           #  772: 3851
            s8i          a2, a3, 130 /* a2 -> [[(local5)]+0x82] */ #  774: 224382
.Lbr081:    l32i         a0, sp, 4 /* [(local1)] */            #  777: 0811
            addi         a4, a5, 1 /* [(local3)]+0x1 */        #  779: 1b45
            extui        a5, a4, 0, 8                          #  77b: 405074
            addi         a0, a0, -4 /* [(local1)]-0x4 */       #  77e: 02c0fc
            j            .Lbr079                               #  781: c6f0ff
.Lbr082:    blti         a0, 1, .Lbr087                        #  784: a61065
            movi         a5, 0 /* 0x00000000 */                #  787: 0c05
            l32i         a7, sp, 16 /* [(local4)] */           #  789: 7841
            addi         a0, a0, -2                            #  78b: 02c0fe
            addx4        a6, a6, a7                            #  78e: 7066a0
            addi         a2, a6, 16                            #  791: 22c610
            l8ui         a7, a6, 15                            #  794: 72060f
            l8ui         a6, a6, 14                            #  797: 62060e
            slli         a7, a7, 8                             #  79a: 807711
            or           a6, a6, a7                            #  79d: 706620
            extui        a6, a6, 0, 16                         #  7a0: 6060f4
.Lbr083:    beqz         a0, .Lbr076                           #  7a3: 16f0f5
            s32i         a6, sp, 28 /* a6 -> [(local7)] */     #  7a6: 6971
            s32i         a5, sp, 12 /* a5 -> [(local3)] */     #  7a8: 5931
            s32i         a2, sp, 8 /* a2 -> [(local2)] */      #  7aa: 2921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  7ac: 0911
            extui        a9, a5, 0, 16                         #  7ae: 5090f4
            bltu         a9, a6, .Lbr084                       #  7b1: 673902
            j            .Lbr076                               #  7b4: 86d3ff
.Lbr084:    l32i         a2, sp, 8 /* [(local2)] */            #  7b7: 2821
            call0        .Lfunc002                             #  7b9: 45e1ff
            bnei         a2, 1, .Lbr085                        #  7bc: 661209
            l32i         a11, sp, 20 /* [(local5)] */          #  7bf: b851
            movi         a10, 2 /* 0x00000002 */               #  7c1: 0c2a
            s8i          a10, a11, 129 /* 0x02 -> [[(local5)]+0x81] */ #  7c3: a24b81
            j            .Lbr086                               #  7c6: 860300
.Lbr085:    l32i         a2, sp, 8 /* [(local2)] */            #  7c9: 2821
            call0        .Lfunc002                             #  7cb: 45e0ff
            bnei         a2, 2, .Lbr086                        #  7ce: 662206
            l32i         a2, sp, 20 /* [(local5)] */           #  7d1: 2851
            movi         a0, 3 /* 0x00000003 */                #  7d3: 0c30
            s8i          a0, a2, 129 /* 0x03 -> [[(local5)]+0x81] */ #  7d5: 024281
.Lbr086:    l32i         a6, sp, 28 /* [(local7)] */           #  7d8: 6871
            l32i         a5, sp, 12 /* [(local3)] */           #  7da: 5831
            l32i         a2, sp, 8 /* [(local2)] */            #  7dc: 2821
            l32i         a0, sp, 4 /* [(local1)] */            #  7de: 0811
            addi         a2, a2, 4 /* [(local2)]+0x4 */        #  7e0: 4b22
            addi         a0, a0, -4 /* [(local1)]-0x4 */       #  7e2: 02c0fc
            addi         a3, a5, 1 /* [(local3)]+0x1 */        #  7e5: 1b35
            extui        a5, a3, 0, 8                          #  7e7: 305074
            j            .Lbr083                               #  7ea: 46edff
.Lbr087:    movi         a2, 0 /* 0x00000000 */                #  7ed: 0c02
            j            .Lbr077                               #  7ef: 06c6ff

            .literal_position                                  #  7f4: 00000000

# Function @ .irom0.text+0x7f8
# Local variables/stack:
#     (local0):  byte[4]   @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word      @ -0x8
#     (local7):  word      @ -0x4
            .balign      4
            .global      sdk_ieee80211_parse_rsn
            .type        sdk_ieee80211_parse_rsn, @function
sdk_ieee80211_parse_rsn:
            movi         a4, 0 /* 0x00000000 */                #  7f8: 0c04
            addi         sp, sp, -32 /* (local0) */            #  7fa: 12c1e0
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   #  7fd: d941
            s32i         a14, sp, 20 /* a14 -> [(local5)] */   #  7ff: e951
            s32i         a15, sp, 24 /* a15 -> [(local6)] */   #  801: f961
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  803: c931
            s8i          a4, sp, 0 /* 0x00 -> [(local0)] */    #  805: 424100
            l32i         a12, a2, 52 /* [arg0+0x34] */         #  808: c8d2
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  80a: 0921
            beqz         a12, .Lbr088                          #  80c: 9c9c
            l8ui         a5, a12, 1 /* [[arg0+0x34]+0x1] */    #  80e: 520c01
            l8ui         a2, a12, 3 /* [[arg0+0x34]+0x3] */    #  811: 220c03
            blti         a5, 10, .Lbr088                       #  814: a69511
            l8ui         a0, a12, 2 /* [[arg0+0x34]+0x2] */    #  817: 020c02
            slli         a2, a2, 8                             #  81a: 802211
            or           a0, a0, a2                            #  81d: 200020
            slli         a0, a0, 16                            #  820: 000011
            srai         a0, a0, 16                            #  823: 000031
            beqi         a0, 1, .Lbr092                        #  826: 26101b
.Lbr088:    mov          a2, a4 /* 0x00000000 */               #  829: 2d04
            j            .Lbr091                               #  82b: c60100
.Lbr089:    bgei         a13, 2, .Lbr090                       #  82e: e62d02
            j            .Lbr101                               #  831: 862e00
.Lbr090:    movi         a2, 1 /* 0x00000001 */                #  834: 0c12
.Lbr091:    l32i         a12, sp, 12 /* [(local3)] */          #  836: c831
            l32i         a13, sp, 16 /* [(local4)] */          #  838: d841
            l32i         a14, sp, 20 /* [(local5)] */          #  83a: e851
            l32i         a15, sp, 24 /* [(local6)] */          #  83c: f861
            l32i         a0, sp, 8 /* [(local2)] */            #  83e: 0821
            addi         sp, sp, 32 /* (top of frame) */       #  840: 12c120
            ret                                                #  843: 0df0
.Lbr092:    addi         a2, a12, 4 /* [arg0+0x34]+0x4 */      #  845: 4b2c
            movi         a15, sdk_g_ic+0x188                   #  847: f1ebff
            movi         a3, 3 /* 0x00000003 */                #  84a: 0c33
            s32i         a5, sp, 28 /* [[arg0+0x34]+0x1] -> [(local7)] */ #  84c: 5971
            s8i          a3, a15, 128 /* 0x03 -> [sdk_g_ic+0x208] */ #  84e: 324f80
            mov          a3, sp /* (local0) */                 #  851: 3d01
            call0        .Lfunc003                             #  853: 05ddff
            movi         a14, 0 /* 0x00000000 */               #  856: 0c0e
            l32i         a13, sp, 28 /* [(local7)] */          #  858: d871
            s8i          a2, a15, 132 /* a2 -> [sdk_g_ic+0x20c] */ #  85a: 224f84
            l8ui         a4, a12, 8 /* [[arg0+0x34]+0x8] */    #  85d: 420c08
            l8ui         a5, a12, 9 /* [[arg0+0x34]+0x9] */    #  860: 520c09
            addi         a13, a13, -8 /* [(local7)]-0x8 */     #  863: d2cdf8
            addi         a12, a12, 10 /* [arg0+0x34]+0xa */    #  866: abcc
            slli         a5, a5, 8                             #  868: 805511
            or           a4, a4, a5                            #  86b: 504420
            extui        a4, a4, 0, 16                         #  86e: 4040f4
            s32i         a4, sp, 4 /* a4 -> [(local1)] */      #  871: 4911
.Lbr093:    l32i         a2, sp, 4 /* [(local1)] */            #  873: 2811
            extui        a0, a14, 0, 16                        #  875: e000f4
            bgeu         a0, a2, .Lbr096                       #  878: 27b020
            beqz         a13, .Lbr096                          #  87b: 9cdd
            mov          a2, a12                               #  87d: 2d0c
            mov          a3, sp /* (local0) */                 #  87f: 3d01
            call0        .Lfunc003                             #  881: 05daff
            addi         a13, a13, -4                          #  884: d2cdfc
            l8ui         a0, a15, 130 /* [sdk_g_ic+0x20a] */   #  887: 020f82
            addi         a12, a12, 4                           #  88a: 4bcc
            beqz         a0, .Lbr094                           #  88c: 8c10
            bnei         a0, 1, .Lbr095                        #  88e: 661002
.Lbr094:    s8i          a2, a15, 130 /* a2 -> [sdk_g_ic+0x20a] */ #  891: 224f82
.Lbr095:    addi         a14, a14, 1                           #  894: 1bee
            extui        a14, a14, 0, 8                        #  896: e0e074
            j            .Lbr093                               #  899: 86f5ff
.Lbr096:    blti         a13, 1, .Lbr101                       #  89c: a61d4f
            movi         a14, 0 /* 0x00000000 */               #  89f: 0c0e
            addi         a13, a13, -2                          #  8a1: d2cdfe
            l8ui         a0, a12, 0                            #  8a4: 020c00
            l8ui         a2, a12, 1                            #  8a7: 220c01
            addi         a12, a12, 2                           #  8aa: 2bcc
            slli         a2, a2, 8                             #  8ac: 802211
            or           a0, a0, a2                            #  8af: 200020
            extui        a0, a0, 0, 16                         #  8b2: 0000f4
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  8b5: 0911
.Lbr097:    beqz         a13, .Lbr089                          #  8b7: 163df7
            l32i         a6, sp, 4 /* [(local1)] */            #  8ba: 6811
            extui        a5, a14, 0, 16                        #  8bc: e050f4
            bltu         a5, a6, .Lbr098                       #  8bf: 673502
            j            .Lbr089                               #  8c2: 06daff
.Lbr098:    mov          a2, a12                               #  8c5: 2d0c
            call0        .Lfunc004                             #  8c7: 45ddff
            bnei         a2, 1, .Lbr099                        #  8ca: 661207
            movi         a7, 4 /* 0x00000004 */                #  8cd: 0c47
            s8i          a7, a15, 129 /* 0x04 -> [sdk_g_ic+0x209] */ #  8cf: 724f81
            j            .Lbr100                               #  8d2: 060300
.Lbr099:    mov          a2, a12                               #  8d5: 2d0c
            call0        .Lfunc004                             #  8d7: 45dcff
            bnei         a2, 2, .Lbr100                        #  8da: 662204
            movi         a8, 5 /* 0x00000005 */                #  8dd: 0c58
            s8i          a8, a15, 129 /* 0x05 -> [sdk_g_ic+0x209] */ #  8df: 824f81
.Lbr100:    addi         a12, a12, 4                           #  8e2: 4bcc
            addi         a13, a13, -4                          #  8e4: d2cdfc
            addi         a14, a14, 1                           #  8e7: 1bee
            extui        a14, a14, 0, 8                        #  8e9: e0e074
            j            .Lbr097                               #  8ec: c6f1ff
.Lbr101:    movi         a2, 0 /* 0x00000000 */                #  8ef: 0c02
            j            .Lbr091                               #  8f1: 46d0ff

# Function @ .irom0.text+0x8f4
            .balign      4
            .global      sdk_ieee80211_parse_action
            .type        sdk_ieee80211_parse_action, @function
sdk_ieee80211_parse_action:
            l32i         a4, a3, 4 /* [arg1+0x4] */            #  8f4: 4813
            l16ui        a2, a3, 22 /* [arg1+0x16] */          #  8f6: 22130b
            l32i         a3, a4, 4 /* [[arg1+0x4]+0x4] */      #  8f9: 3814
            add          a2, a2, a3                            #  8fb: 3a22
            addi         a2, a2, 24                            #  8fd: 22c218
            sub          a2, a2, a3                            #  900: 3022c0
            addi         a2, a2, -24                           #  903: 22c2e8
            bltui        a2, 2, .Lbr104                        #  906: b6221c
            l8ui         a5, a3, 24 /* [[[arg1+0x4]+0x4]+0x18] */ #  909: 520318
            beqi         a5, 3, .Lbr105                        #  90c: 26351a
            bnei         a5, 7, .Lbr102                        #  90f: 66750a
            l8ui         a3, a3, 25 /* [[[arg1+0x4]+0x4]+0x19] */ #  912: 320319
            beqz         a3, .Lbr106                           #  915: ac33
            bnei         a3, 1, .Lbr102                        #  917: 661302
            bltui        a2, 3, .Lbr104                        #  91a: b63208
.Lbr102:    movi         a2, 0 /* 0x00000000 */                #  91d: 0c02
            ret           /* 0x00000000 */                     #  91f: 0df0
.Lbr103:    movi         a5, 8 /* 0x00000008 */                #  921: 0c85
            bltu         a5, a2, .Lbr102                       #  923: 2735f6
.Lbr104:    movi         a2, -1 /* 0xffffffff */               #  926: 7cf2
            ret           /* 0xffffffff */                     #  928: 0df0
.Lbr105:    l8ui         a3, a3, 25 /* [[[arg1+0x4]+0x4]+0x19] */ #  92a: 320319
            beqz         a3, .Lbr103                           #  92d: 1603ff
            beqi         a3, 1, .Lbr107                        #  930: 26130e
            bnei         a3, 2, .Lbr102                        #  933: 6623e6
            bltui        a2, 6, .Lbr104                        #  936: b662ec
            j            .Lbr102                               #  939: 06f8ff
.Lbr106:    bltui        a2, 3, .Lbr104                        #  93c: b632e6
            j            .Lbr102                               #  93f: 86f6ff
.Lbr107:    movi         a6, 8 /* 0x00000008 */                #  942: 0c86
            bgeu         a6, a2, .Lbr104                       #  944: 27b6de
            j            .Lbr102                               #  947: 86f4ff

            .balign      4
# Function @ .irom0.text+0x94c
            .balign      4
            .global      sdk_ieee80211_setup_rateset
            .type        sdk_ieee80211_setup_rateset, @function
sdk_ieee80211_setup_rateset:
            movi         a2, 0 /* 0x00000000 */                #  94c: 0c02
            ret           /* 0x00000000 */                     #  94e: 0df0

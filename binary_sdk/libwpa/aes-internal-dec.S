
            .section     .bss, "aw", @nobits

.Ldata001:  .space       176

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000
                                                               #    8: 00000000

# Function @ .irom0.text+0xc
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_rijndaelKeySetupDec
            .type        sdk_rijndaelKeySetupDec, @function
sdk_rijndaelKeySetupDec:
            addi         sp, sp, -16 /* (local0) */            #    c: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #    f: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   11: 0901
            mov          a12, a2 /* arg0 */                    #   13: cd02
            call0        sdk_rijndaelKeySetupEnc               #   15: 01fcffc0
                                                               #   19: 0000
            mov          a6, a12 /* arg0 */                    #   1b: 6d0c
            movi         a3, 40 /* 0x00000028 */               #   1d: 2c83
            movi         a2, 0 /* 0x00000000 */                #   1f: 0c02
            movi         a0, 160 /* 0x000000a0 */              #   21: 02a0a0
            add          a0, a12, a0 /* arg0+0xa0 */           #   24: 0a0c
.Lbr001:    addi         a3, a3, -4                            #   26: 32c3fc
            addi         a2, a2, 4                             #   29: 4b22
            l32i         a11, a6, 0                            #   2b: b806
            l32i         a4, a0, 0                             #   2d: 4800
            addi         a0, a0, -16                           #   2f: 02c0f0
            s32i         a4, a6, 0                             #   32: 4906
            l32i         a10, a0, 20                           #   34: a850
            s32i         a11, a0, 16                           #   36: b940
            l32i         a9, a6, 4                             #   38: 9816
            s32i         a10, a6, 4                            #   3a: a916
            l32i         a8, a0, 24                            #   3c: 8860
            s32i         a9, a0, 20                            #   3e: 9950
            l32i         a7, a6, 8                             #   40: 7826
            s32i         a8, a6, 8                             #   42: 8926
            l32i         a5, a0, 28                            #   44: 5870
            s32i         a7, a0, 24                            #   46: 7960
            l32i         a4, a6, 12                            #   48: 4836
            s32i         a5, a6, 12                            #   4a: 5936
            s32i         a4, a0, 28                            #   4c: 4970
            addi         a6, a6, 16                            #   4e: 62c610
            blt          a2, a3, .Lbr001                       #   51: 3722d1
            movi         a2, 1 /* 0x00000001 */                #   54: 0c12
            movi         a9, sdk_Te0                           #   56: 91eaff
            movi         a8, sdk_Td0                           #   59: 81eaff
            addi         a12, a12, 16 /* arg0+0x10 */          #   5c: c2cc10
            mov          a0, a12 /* arg0+0x10 */               #   5f: 0d0c
.Lbr002:    addi         a2, a2, 1                             #   61: 1b22
            addi         a6, a12, 16                           #   63: 62cc10
            addi         a12, a12, 16                          #   66: c2cc10
.Lbr003:    l32i         a10, a0, 0                            #   69: a800
            ssai         24                                    #   6b: 104840
            extui        a11, a10, 0, 8                        #   6e: a0b074
            extui        a7, a10, 8, 8                         #   71: a07874
            extui        a5, a10, 24, 8                        #   74: a05875
            addx4        a5, a5, a9                            #   77: 9055a0
            addx4        a7, a7, a9                            #   7a: 9077a0
            addx4        a11, a11, a9                          #   7d: 90bba0
            l32i         a11, a11, 0                           #   80: b80b
            l32i         a7, a7, 0                             #   82: 7807
            l32i         a5, a5, 0                             #   84: 5805
            extui        a10, a10, 16, 8                       #   86: a0a075
            extui        a5, a5, 8, 8                          #   89: 505874
            extui        a7, a7, 8, 8                          #   8c: 707874
            extui        a11, a11, 8, 8                        #   8f: b0b874
            addx4        a10, a10, a9                          #   92: 90aaa0
            l32i         a10, a10, 0                           #   95: a80a
            addx4        a11, a11, a8                          #   97: 80bba0
            addx4        a7, a7, a8                            #   9a: 8077a0
            addx4        a5, a5, a8                            #   9d: 8055a0
            l32i         a5, a5, 0                             #   a0: 5805
            l32i         a7, a7, 0                             #   a2: 7807
            l32i         a11, a11, 0                           #   a4: b80b
            extui        a10, a10, 8, 8                        #   a6: a0a874
            src          a11, a11, a11                         #   a9: b0bb81
            addx4        a10, a10, a8                          #   ac: 80aaa0
            l32i         a10, a10, 0                           #   af: a80a
            ssai         16                                    #   b1: 104040
            src          a7, a7, a7                            #   b4: 707781
            xor          a7, a7, a11                           #   b7: b07730
            ssai         8                                     #   ba: 004840
            src          a10, a10, a10                         #   bd: a0aa81
            xor          a5, a5, a10                           #   c0: a05530
            xor          a5, a5, a7                            #   c3: 705530
            s32i         a5, a0, 0                             #   c6: 5900
            addi         a0, a0, 4                             #   c8: 4b00
            bne          a0, a6, .Lbr003                       #   ca: 67909b
            mov          a0, a12                               #   cd: 0d0c
            bnei         a2, 10, .Lbr002                       #   cf: 66928e
            l32i         a12, sp, 4 /* [(local1)] */           #   d2: c811
            l32i         a0, sp, 0 /* [(local0)] */            #   d4: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   d6: 12c110
            ret                                                #   d9: 0df0

            .literal_position                                  #   dc: 00000000
                                                               #   e0: 00000000

# Function @ .irom0.text+0xe4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_aes_decrypt_init
            .type        sdk_aes_decrypt_init, @function
sdk_aes_decrypt_init:
            addi         sp, sp, -16 /* (local0) */            #   e4: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   e7: 0901
            beqi         a3, 16, .Lbr004                       #   e9: 26b304
            movi         a2, 0 /* 0x00000000 */                #   ec: 0c02
            j            .Lbr005                               #   ee: 860200
.Lbr004:    mov          a3, a2 /* arg0 */                     #   f1: 3d02
            movi         a2, .Ldata001                         #   f3: 21faff
            call0        sdk_rijndaelKeySetupDec               #   f6: 050000
            movi         a2, .Ldata001                         #   f9: 21f9ff
.Lbr005:    l32i         a0, sp, 0 /* [(local0)] */            #   fc: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   fe: 12c110
            ret                                                #  101: 0df0

            .literal_position                                  #  104: 00000000
                                                               #  108: 00000000
                                                               #  10c: 00000000
                                                               #  110: 00000000
                                                               #  114: 00000000

# Function @ .irom0.text+0x118
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word      @ -0x3c
#     (local2):  word      @ -0x38
#     (local3):  word      @ -0x34
#     (local4):  word      @ -0x30
#     (local5):  word      @ -0x2c
#     (local6):  word      @ -0x28
#     (local7):  word      @ -0x24
#     (local8):  word      @ -0x20
#     (local9):  word      @ -0x1c
#     (local10): word[4]   @ -0x18
#     (local11): word[2]   @ -0x8
            .balign      4
.Lfunc001:  movi         a11, sdk_Td0                          #  118: b1fbff
            mov          a5, a12                               #  11b: 5d0c
            addi         sp, sp, -64 /* (local0) */            #  11d: 12c1c0
            mov          a12, a2 /* arg0 */                    #  120: cd02
            l8ui         a6, a3, 1 /* [arg1+0x1] */            #  122: 620301
            l8ui         a7, a3, 9 /* [arg1+0x9] */            #  125: 720309
            l8ui         a8, a3, 14 /* [arg1+0xe] */           #  128: 82030e
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  12b: 0921
            s32i         a15, sp, 24 /* a15 -> [(local6)] */   #  12d: f961
            s32i         a4, sp, 4 /* arg2 -> [(local1)] */    #  12f: 4911
            s32i         a14, sp, 20 /* a14 -> [(local5)] */   #  131: e951
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   #  133: d941
            s32i         a5, sp, 12 /* a5 -> [(local3)] */     #  135: 5931
            l8ui         a13, a3, 3 /* [arg1+0x3] */           #  137: d20303
            l8ui         a14, a3, 11 /* [arg1+0xb] */          #  13a: e2030b
            l8ui         a4, a3, 0 /* [arg1] */                #  13d: 420300
            l32i         a15, a2, 8 /* [arg0+0x8] */           #  140: f822
            l32i         a0, a2, 0 /* [arg0] */                #  142: 0802
            slli         a8, a8, 8                             #  144: 808811
            slli         a7, a7, 16                            #  147: 007711
            slli         a6, a6, 16                            #  14a: 006611
            l32i         a2, a2, 4 /* [arg0+0x4] */            #  14d: 2812
            slli         a4, a4, 24                            #  14f: 804401
            xor          a14, a14, a15                         #  152: f0ee30
            xor          a4, a4, a6                            #  155: 604430
            xor          a13, a13, a0                          #  158: 00dd30
            l8ui         a6, a3, 8 /* [arg1+0x8] */            #  15b: 620308
            l8ui         a0, a3, 4 /* [arg1+0x4] */            #  15e: 020304
            l8ui         a15, a3, 7 /* [arg1+0x7] */           #  161: f20307
            slli         a0, a0, 24                            #  164: 800001
            xor          a15, a15, a2                          #  167: 20ff30
            slli         a6, a6, 24                            #  16a: 806601
            xor          a6, a6, a7                            #  16d: 706630
            l8ui         a2, a3, 5 /* [arg1+0x5] */            #  170: 220305
            l8ui         a7, a3, 13 /* [arg1+0xd] */           #  173: 72030d
            slli         a2, a2, 16                            #  176: 002211
            xor          a0, a0, a2                            #  179: 200030
            l8ui         a2, a3, 12 /* [arg1+0xc] */           #  17c: 22030c
            slli         a7, a7, 16                            #  17f: 007711
            slli         a2, a2, 24                            #  182: 802201
            xor          a2, a2, a7                            #  185: 702230
            xor          a2, a2, a8                            #  188: 802230
            l8ui         a7, a3, 10 /* [arg1+0xa] */           #  18b: 72030a
            l8ui         a8, a3, 6 /* [arg1+0x6] */            #  18e: 820306
            slli         a7, a7, 8                             #  191: 807711
            xor          a6, a6, a7                            #  194: 706630
            slli         a8, a8, 8                             #  197: 808811
            l8ui         a7, a3, 2 /* [arg1+0x2] */            #  19a: 720302
            xor          a0, a0, a8                            #  19d: 800030
            xor          a15, a15, a0                          #  1a0: 00ff30
            slli         a7, a7, 8                             #  1a3: 807711
            l8ui         a0, a3, 15 /* [arg1+0xf] */           #  1a6: 02030f
            xor          a4, a4, a7                            #  1a9: 704430
            xor          a13, a13, a4                          #  1ac: 40dd30
            l32i         a4, a12, 12 /* [arg0+0xc] */          #  1af: 483c
            xor          a14, a14, a6                          #  1b1: 60ee30
            xor          a0, a0, a4                            #  1b4: 400030
            xor          a0, a0, a2                            #  1b7: 200030
            movi         a2, 5 /* 0x00000005 */                #  1ba: 0c52
.Lbr006:    addi         a2, a2, -1                            #  1bc: 0b22
            ssai         8                                     #  1be: 004840
            extui        a5, a14, 24, 8                        #  1c1: e05875
            extui        a7, a15, 16, 8                        #  1c4: f07075
            extui        a8, a14, 0, 8                         #  1c7: e08074
            extui        a6, a0, 8, 8                          #  1ca: 006874
            extui        a10, a13, 16, 8                       #  1cd: d0a075
            extui        a3, a15, 0, 8                         #  1d0: f03074
            extui        a9, a0, 16, 8                         #  1d3: 009075
            extui        a4, a14, 8, 8                         #  1d6: e04874
            addx4        a4, a4, a11                           #  1d9: b044a0
            addx4        a9, a9, a11                           #  1dc: b099a0
            addx4        a3, a3, a11                           #  1df: b033a0
            addx4        a10, a10, a11                         #  1e2: b0aaa0
            addx4        a6, a6, a11                           #  1e5: b066a0
            addx4        a8, a8, a11                           #  1e8: b088a0
            addx4        a7, a7, a11                           #  1eb: b077a0
            addx4        a5, a5, a11                           #  1ee: b055a0
            l32i         a5, a5, 0                             #  1f1: 5805
            l32i         a7, a7, 0                             #  1f3: 7807
            l32i         a8, a8, 0                             #  1f5: 8808
            l32i         a6, a6, 0                             #  1f7: 6806
            l32i         a10, a10, 0                           #  1f9: a80a
            l32i         a3, a3, 0                             #  1fb: 3803
            l32i         a9, a9, 0                             #  1fd: 9809
            l32i         a4, a4, 0                             #  1ff: 4804
            src          a9, a9, a9                            #  201: 909981
            ssai         16                                    #  204: 104040
            src          a4, a4, a4                            #  207: 404481
            s32i         a4, sp, 32 /* a4 -> [(local8)] */     #  20a: 4981
            ssai         24                                    #  20c: 104840
            extui        a4, a13, 8, 8                         #  20f: d04874
            src          a3, a3, a3                            #  212: 303381
            s32i         a3, sp, 36 /* a3 -> [(local9)] */     #  215: 3991
            ssai         8                                     #  217: 004840
            addx4        a4, a4, a11                           #  21a: b044a0
            l32i         a4, a4, 0                             #  21d: 4804
            src          a10, a10, a10                         #  21f: a0aa81
            extui        a3, a15, 8, 8                         #  222: f03874
            addx4        a3, a3, a11                           #  225: b033a0
            ssai         16                                    #  228: 104040
            src          a6, a6, a6                            #  22b: 606681
            l32i         a3, a3, 0                             #  22e: 3803
            ssai         24                                    #  230: 104840
            src          a8, a8, a8                            #  233: 808881
            s32i         a8, sp, 40 /* a8 -> [(local10)] */    #  236: 89a1
            ssai         8                                     #  238: 004840
            extui        a8, a14, 16, 8                        #  23b: e08075
            src          a7, a7, a7                            #  23e: 707781
            l32i         a14, a12, 24                          #  241: e86c
            xor          a5, a5, a7                            #  243: 705530
            ssai         16                                    #  246: 104040
            addx4        a8, a8, a11                           #  249: b088a0
            l32i         a8, a8, 0                             #  24c: 8808
            src          a4, a4, a4                            #  24e: 404481
            extui        a7, a0, 24, 8                         #  251: 007875
            ssai         24                                    #  254: 104840
            xor          a4, a4, a5                            #  257: 504430
            addx4        a7, a7, a11                           #  25a: b077a0
            l32i         a7, a7, 0                             #  25d: 7807
            extui        a5, a0, 0, 8                          #  25f: 005074
            addx4        a5, a5, a11                           #  262: b055a0
            l32i         a5, a5, 0                             #  265: 5805
            l32i         a0, a12, 16                           #  267: 084c
            src          a5, a5, a5                            #  269: 505581
            xor          a14, a14, a5                          #  26c: 50ee30
            ssai         8                                     #  26f: 004840
            src          a8, a8, a8                            #  272: 808881
            xor          a14, a14, a4                          #  275: 40ee30
            ssai         16                                    #  278: 104040
            xor          a7, a7, a8                            #  27b: 807730
            extui        a4, a13, 0, 8                         #  27e: d04074
            addx4        a4, a4, a11                           #  281: b044a0
            extui        a8, a15, 24, 8                        #  284: f08875
            src          a3, a3, a3                            #  287: 303381
            l32i         a15, a12, 20                          #  28a: f85c
            ssai         24                                    #  28c: 104840
            l32i         a4, a4, 0                             #  28f: 4804
            xor          a3, a3, a7                            #  291: 703330
            addx4        a8, a8, a11                           #  294: b088a0
            l32i         a8, a8, 0                             #  297: 8808
            l32i         a7, sp, 32 /* [(local8)] */           #  299: 7881
            xor          a8, a8, a10                           #  29b: a08830
            src          a4, a4, a4                            #  29e: 404481
            xor          a6, a6, a8                            #  2a1: 806630
            extui        a8, a13, 24, 8                        #  2a4: d08875
            l32i         a13, a12, 28                          #  2a7: d87c
            addx4        a8, a8, a11                           #  2a9: b088a0
            addi         a12, a12, 32                          #  2ac: c2cc20
            l32i         a8, a8, 0                             #  2af: 8808
            xor          a13, a13, a4                          #  2b1: 40dd30
            xor          a8, a8, a9                            #  2b4: 908830
            xor          a7, a7, a8                            #  2b7: 807730
            l32i         a8, sp, 36 /* [(local9)] */           #  2ba: 8891
            xor          a13, a13, a3                          #  2bc: 30dd30
            xor          a0, a0, a8                            #  2bf: 800030
            xor          a0, a0, a7                            #  2c2: 700030
            l32i         a7, sp, 40 /* [(local10)] */          #  2c5: 78a1
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  2c7: 0901
            xor          a15, a15, a7                          #  2c9: 70ff30
            xor          a15, a15, a6                          #  2cc: 60ff30
            beqz         a2, .Lbr007                           #  2cf: 162210
            ssai         8                                     #  2d2: 004840
            extui        a5, a14, 24, 8                        #  2d5: e05875
            extui        a4, a15, 16, 8                        #  2d8: f04075
            extui        a7, a14, 0, 8                         #  2db: e07074
            extui        a6, a13, 8, 8                         #  2de: d06874
            extui        a3, a0, 16, 8                         #  2e1: 003075
            extui        a8, a15, 0, 8                         #  2e4: f08074
            extui        a9, a14, 8, 8                         #  2e7: e09874
            extui        a10, a13, 16, 8                       #  2ea: d0a075
            addx4        a10, a10, a11                         #  2ed: b0aaa0
            addx4        a9, a9, a11                           #  2f0: b099a0
            addx4        a8, a8, a11                           #  2f3: b088a0
            addx4        a3, a3, a11                           #  2f6: b033a0
            addx4        a6, a6, a11                           #  2f9: b066a0
            addx4        a7, a7, a11                           #  2fc: b077a0
            addx4        a4, a4, a11                           #  2ff: b044a0
            addx4        a5, a5, a11                           #  302: b055a0
            l32i         a5, a5, 0                             #  305: 5805
            l32i         a4, a4, 0                             #  307: 4804
            l32i         a7, a7, 0                             #  309: 7807
            l32i         a6, a6, 0                             #  30b: 6806
            l32i         a3, a3, 0                             #  30d: 3803
            l32i         a8, a8, 0                             #  30f: 8808
            l32i         a9, a9, 0                             #  311: 9809
            l32i         a10, a10, 0                           #  313: a80a
            extui        a14, a14, 16, 8                       #  315: e0e075
            src          a10, a10, a10                         #  318: a0aa81
            addx4        a14, a14, a11                         #  31b: b0eea0
            ssai         16                                    #  31e: 104040
            src          a9, a9, a9                            #  321: 909981
            ssai         24                                    #  324: 104840
            src          a8, a8, a8                            #  327: 808881
            l32i         a14, a14, 0                           #  32a: e80e
            ssai         8                                     #  32c: 004840
            src          a3, a3, a3                            #  32f: 303381
            ssai         16                                    #  332: 104040
            src          a6, a6, a6                            #  335: 606681
            ssai         24                                    #  338: 104840
            src          a7, a7, a7                            #  33b: 707781
            ssai         8                                     #  33e: 004840
            src          a4, a4, a4                            #  341: 404481
            xor          a5, a5, a4                            #  344: 405530
            extui        a4, a0, 8, 8                          #  347: 004874
            addx4        a4, a4, a11                           #  34a: b044a0
            l32i         a4, a4, 0                             #  34d: 4804
            ssai         16                                    #  34f: 104040
            src          a4, a4, a4                            #  352: 404481
            xor          a4, a4, a5                            #  355: 504430
            ssai         24                                    #  358: 104840
            extui        a5, a13, 0, 8                         #  35b: d05074
            extui        a13, a13, 24, 8                       #  35e: d0d875
            addx4        a5, a5, a11                           #  361: b055a0
            l32i         a5, a5, 0                             #  364: 5805
            addx4        a13, a13, a11                         #  366: b0dda0
            src          a5, a5, a5                            #  369: 505581
            l32i         a13, a13, 0                           #  36c: d80d
            ssai         8                                     #  36e: 004840
            src          a14, a14, a14                         #  371: e0ee81
            xor          a13, a13, a14                         #  374: e0dd30
            extui        a14, a15, 24, 8                       #  377: f0e875
            addx4        a14, a14, a11                         #  37a: b0eea0
            l32i         a14, a14, 0                           #  37d: e80e
            ssai         16                                    #  37f: 104040
            xor          a14, a14, a3                          #  382: 30ee30
            extui        a3, a15, 8, 8                         #  385: f03874
            xor          a6, a6, a14                           #  388: e06630
            l32i         a15, a12, 4                           #  38b: f81c
            extui        a14, a0, 24, 8                        #  38d: 00e875
            addx4        a3, a3, a11                           #  390: b033a0
            l32i         a3, a3, 0                             #  393: 3803
            addx4        a14, a14, a11                         #  395: b0eea0
            l32i         a14, a14, 0                           #  398: e80e
            xor          a15, a15, a7                          #  39a: 70ff30
            xor          a15, a15, a6                          #  39d: 60ff30
            src          a3, a3, a3                            #  3a0: 303381
            xor          a3, a3, a13                           #  3a3: d03330
            xor          a14, a14, a10                         #  3a6: a0ee30
            l32i         a13, a12, 0                           #  3a9: d80c
            xor          a14, a9, a14                          #  3ab: e0e930
            xor          a13, a13, a8                          #  3ae: 80dd30
            xor          a13, a13, a14                         #  3b1: e0dd30
            l32i         a14, a12, 8                           #  3b4: e82c
            ssai         24                                    #  3b6: 104840
            xor          a14, a14, a5                          #  3b9: 50ee30
            xor          a14, a14, a4                          #  3bc: 40ee30
            extui        a4, a0, 0, 8                          #  3bf: 004074
            addx4        a4, a4, a11                           #  3c2: b044a0
            l32i         a4, a4, 0                             #  3c5: 4804
            l32i         a0, a12, 12                           #  3c7: 083c
            src          a4, a4, a4                            #  3c9: 404481
            xor          a0, a0, a4                            #  3cc: 400030
            xor          a0, a0, a3                            #  3cf: 300030
            j            .Lbr006                               #  3d2: 8679ff
.Lbr007:    movi         a2, 256 /* 0x00000100 */              #  3d5: 22a100
            call0        malloc                                #  3d8: 014dffc0
                                                               #  3dc: 0000
            s32i         a2, sp, 28 /* a2 -> [(local7)] */     #  3de: 2971
            movi         a3, sdk_Td4s_rom                      #  3e0: 314aff
            movi         a4, 256 /* 0x00000100 */              #  3e3: 42a100
            call0        memcpy                                #  3e6: 014affc0
                                                               #  3ea: 0000
            extui        a6, a13, 24, 8                        #  3ec: d06875
            extui        a0, a14, 24, 8                        #  3ef: e00875
            extui        a4, a13, 0, 8                         #  3f2: d04074
            extui        a3, a15, 16, 8                        #  3f5: f03075
            extui        a11, a15, 8, 8                        #  3f8: f0b874
            extui        a10, a14, 16, 8                       #  3fb: e0a075
            l32i         a9, sp, 0 /* [(local0)] */            #  3fe: 9801
            l32i         a2, sp, 28 /* [(local7)] */           #  400: 2871
            extui        a5, a9, 24, 8                         #  402: 905875
            extui        a7, a9, 16, 8                         #  405: 907075
            extui        a8, a9, 8, 8                          #  408: 908874
            add          a10, a2, a10                          #  40b: aaa2
            add          a11, a2, a11                          #  40d: bab2
            add          a3, a2, a3                            #  40f: 3a32
            add          a4, a2, a4                            #  411: 4a42
            add          a0, a2, a0                            #  413: 0a02
            add          a8, a2, a8                            #  415: 8a82
            add          a7, a2, a7                            #  417: 7a72
            add          a6, a2, a6                            #  419: 6a62
            add          a5, a2, a5                            #  41b: 5a52
            l8ui         a5, a5, 0                             #  41d: 520500
            s32i         a6, sp, 32 /* a6 -> [(local8)] */     #  420: 6981
            s32i         a7, sp, 56 /* a7 -> [(local11)] */    #  422: 79e1
            s32i         a8, sp, 36 /* a8 -> [(local9)] */     #  424: 8991
            extui        a9, a9, 0, 8                          #  426: 909074
            extui        a8, a13, 16, 8                        #  429: d08075
            extui        a7, a13, 8, 8                         #  42c: d07874
            extui        a6, a14, 0, 8                         #  42f: e06074
            add          a6, a2, a6                            #  432: 6a62
            add          a7, a2, a7                            #  434: 7a72
            slli         a5, a5, 24                            #  436: 805501
            add          a8, a2, a8                            #  439: 8a82
            add          a9, a2, a9                            #  43b: 9a92
            s32i         a9, sp, 40 /* a9 -> [(local10)] */    #  43d: 99a1
            extui        a13, a15, 0, 8                        #  43f: f0d074
            extui        a9, a15, 24, 8                        #  442: f09875
            add          a13, a2, a13                          #  445: dad2
            extui        a15, a14, 8, 8                        #  447: e0f874
            add          a9, a2, a9                            #  44a: 9a92
            l8ui         a14, a13, 0                           #  44c: e20d00
            add          a15, a2, a15                          #  44f: faf2
            l8ui         a15, a15, 0                           #  451: f20f00
            l32i         a13, a12, 0                           #  454: d80c
            slli         a15, a15, 8                           #  456: 80ff11
            xor          a14, a14, a15                         #  459: f0ee30
            l8ui         a15, a8, 0                            #  45c: f20800
            l32i         a8, sp, 4 /* [(local1)] */            #  45f: 8811
            slli         a15, a15, 16                          #  461: 00ff11
            xor          a15, a15, a5                          #  464: 50ff30
            xor          a14, a14, a15                         #  467: f0ee30
            xor          a13, a13, a14                         #  46a: e0dd30
            s8i          a13, a8, 3 /* a13 -> [[(local1)]+0x3] */ #  46d: d24803
            extui        a14, a13, 16, 16                      #  470: d0e0f5
            extui        a15, a13, 24, 8                       #  473: d0f875
            s8i          a15, a8, 0 /* a15 -> [[(local1)]] */  #  476: f24800
            s8i          a14, a8, 1 /* a14 -> [[(local1)]+0x1] */ #  479: e24801
            l32i         a15, sp, 36 /* [(local9)] */          #  47c: f891
            srli         a13, a13, 8                           #  47e: d0d841
            s8i          a13, a8, 2 /* a13 -> [[(local1)]+0x2] */ #  481: d24802
            l32i         a5, a12, 4                            #  484: 581c
            l8ui         a7, a7, 0                             #  486: 720700
            l8ui         a6, a6, 0                             #  489: 620600
            slli         a7, a7, 8                             #  48c: 807711
            xor          a6, a6, a7                            #  48f: 706630
            l32i         a7, sp, 56 /* [(local11)] */          #  492: 78e1
            l8ui         a9, a9, 0                             #  494: 920900
            l8ui         a7, a7, 0 /* [[(local11)]] */         #  497: 720700
            slli         a9, a9, 24                            #  49a: 809901
            slli         a7, a7, 16                            #  49d: 007711
            xor          a7, a7, a9                            #  4a0: 907730
            l32i         a9, sp, 40 /* [(local10)] */          #  4a3: 98a1
            xor          a6, a6, a7                            #  4a5: 706630
            xor          a5, a5, a6                            #  4a8: 605530
            s8i          a5, a8, 7 /* a5 -> [[(local1)]+0x7] */ #  4ab: 524807
            extui        a6, a5, 16, 16                        #  4ae: 5060f5
            extui        a7, a5, 24, 8                         #  4b1: 507875
            s8i          a7, a8, 4 /* a7 -> [[(local1)]+0x4] */ #  4b4: 724804
            s8i          a6, a8, 5 /* a6 -> [[(local1)]+0x5] */ #  4b7: 624805
            srli         a5, a5, 8                             #  4ba: 505841
            s8i          a5, a8, 6 /* a5 -> [[(local1)]+0x6] */ #  4bd: 524806
            l32i         a13, a12, 8                           #  4c0: d82c
            l8ui         a0, a0, 0                             #  4c2: 020000
            l8ui         a15, a15, 0 /* [[(local9)]] */        #  4c5: f20f00
            l8ui         a14, a4, 0                            #  4c8: e20400
            slli         a15, a15, 8                           #  4cb: 80ff11
            xor          a14, a14, a15                         #  4ce: f0ee30
            l8ui         a15, a3, 0                            #  4d1: f20300
            slli         a0, a0, 24                            #  4d4: 800001
            slli         a15, a15, 16                          #  4d7: 00ff11
            xor          a15, a15, a0                          #  4da: 00ff30
            xor          a14, a14, a15                         #  4dd: f0ee30
            xor          a13, a13, a14                         #  4e0: e0dd30
            s8i          a13, a8, 11 /* a13 -> [[(local1)]+0xb] */ #  4e3: d2480b
            extui        a14, a13, 16, 16                      #  4e6: d0e0f5
            extui        a15, a13, 24, 8                       #  4e9: d0f875
            s8i          a15, a8, 8 /* a15 -> [[(local1)]+0x8] */ #  4ec: f24808
            s8i          a14, a8, 9 /* a14 -> [[(local1)]+0x9] */ #  4ef: e24809
            srli         a13, a13, 8                           #  4f2: d0d841
            s8i          a13, a8, 10 /* a13 -> [[(local1)]+0xa] */ #  4f5: d2480a
            l32i         a7, a12, 12                           #  4f8: 783c
            l8ui         a11, a11, 0                           #  4fa: b20b00
            l8ui         a9, a9, 0 /* [[(local10)]] */         #  4fd: 920900
            slli         a11, a11, 8                           #  500: 80bb11
            xor          a9, a9, a11                           #  503: b09930
            l32i         a11, sp, 32 /* [(local8)] */          #  506: b881
            l8ui         a10, a10, 0                           #  508: a20a00
            l8ui         a11, a11, 0 /* [[(local8)]] */        #  50b: b20b00
            slli         a10, a10, 16                          #  50e: 00aa11
            slli         a11, a11, 24                          #  511: 80bb01
            xor          a10, a10, a11                         #  514: b0aa30
            xor          a9, a9, a10                           #  517: a09930
            xor          a7, a7, a9                            #  51a: 907730
            s8i          a7, a8, 15 /* a7 -> [[(local1)]+0xf] */ #  51d: 72480f
            extui        a9, a7, 16, 16                        #  520: 7090f5
            extui        a10, a7, 24, 8                        #  523: 70a875
            s8i          a10, a8, 12 /* a10 -> [[(local1)]+0xc] */ #  526: a2480c
            s8i          a9, a8, 13 /* a9 -> [[(local1)]+0xd] */ #  529: 92480d
            srli         a7, a7, 8                             #  52c: 707841
            s8i          a7, a8, 14 /* a7 -> [[(local1)]+0xe] */ #  52f: 72480e
            call0        free                                  #  532: 01f8fec0
                                                               #  536: 0000
            l32i         a12, sp, 12 /* [(local3)] */          #  538: c831
            l32i         a13, sp, 16 /* [(local4)] */          #  53a: d841
            l32i         a14, sp, 20 /* [(local5)] */          #  53c: e851
            l32i         a15, sp, 24 /* [(local6)] */          #  53e: f861
            l32i         a0, sp, 8 /* [(local2)] */            #  540: 0821
            addi         sp, sp, 64 /* (top of frame) */       #  542: 12c140
            ret                                                #  545: 0df0

            .balign      4
# Function @ .irom0.text+0x548
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_aes_decrypt
            .type        sdk_aes_decrypt, @function
sdk_aes_decrypt:
            addi         sp, sp, -16 /* (local0) */            #  548: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  54b: 0901
            call0        .Lfunc001                             #  54d: 85bcff
            l32i         a0, sp, 0 /* [(local0)] */            #  550: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  552: 12c110
            ret                                                #  555: 0df0

            .literal_position                                  #  558: 00000000

# Function @ .irom0.text+0x55c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_aes_decrypt_deinit
            .type        sdk_aes_decrypt_deinit, @function
sdk_aes_decrypt_deinit:
            movi         a3, 0 /* 0x00000000 */                #  55c: 0c03
            movi         a4, 176 /* 0x000000b0 */              #  55e: 42a0b0
            addi         sp, sp, -16 /* (local0) */            #  561: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  564: 0901
            call0        memset                                #  566: 01fcffc0
                                                               #  56a: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  56c: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  56e: 12c110
            ret                                                #  571: 0df0

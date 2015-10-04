
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000

# Function @ .irom0.text+0x4
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      sdk_rom_ana_inf_gating_en
            .type        sdk_rom_ana_inf_gating_en, @function
sdk_rom_ana_inf_gating_en:
            addi         sp, sp, -32 /* (local0) */            #    4: 12c1e0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #    7: 0911
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    #    9: 3901
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #    b: c921
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #    d: d931
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #    f: e941
            mov          a13, a2 /* arg0 */                    #   11: dd02
            mov          a14, a4 /* arg2 */                    #   13: ed04
            movi         a12, sdk_g_phyFuns                    #   15: c1faff
            beqz         a2, .Lbr001                           #   18: 16220f
            movi         a2, 119 /* 0x00000077 */              #   1b: 22a077
            movi         a3, 0 /* 0x00000000 */                #   1e: 0c03
            movi         a4, 28 /* 0x0000001c */               #   20: 1cc4
            movi         a5, 0 /* 0x00000000 */                #   22: 0c05
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   24: 080c
            movi         a6, 0 /* 0x00000000 */                #   26: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #   28: 022027
            movi         a7, 0 /* 0x00000000 */                #   2b: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #   2d: c00000
            movi         a2, 119 /* 0x00000077 */              #   30: 22a077
            movi         a3, 0 /* 0x00000000 */                #   33: 0c03
            movi         a4, 26 /* 0x0000001a */               #   35: 1ca4
            movi         a5, 4 /* 0x00000004 */                #   37: 0c45
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   39: 080c
            movi         a6, 4 /* 0x00000004 */                #   3b: 0c46
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #   3d: 022027
            movi         a7, 0 /* 0x00000000 */                #   40: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #   42: c00000
            movi         a2, 119 /* 0x00000077 */              #   45: 22a077
            movi         a3, 0 /* 0x00000000 */                #   48: 0c03
            movi         a4, 26 /* 0x0000001a */               #   4a: 1ca4
            movi         a5, 4 /* 0x00000004 */                #   4c: 0c45
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   4e: 080c
            movi         a6, 4 /* 0x00000004 */                #   50: 0c46
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #   52: 022027
            movi         a7, 1 /* 0x00000001 */                #   55: 0c17
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #   57: c00000
            movi         a2, 119 /* 0x00000077 */              #   5a: 22a077
            movi         a3, 0 /* 0x00000000 */                #   5d: 0c03
            movi         a4, 26 /* 0x0000001a */               #   5f: 1ca4
            movi         a5, 5 /* 0x00000005 */                #   61: 0c55
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   63: 080c
            movi         a6, 5 /* 0x00000005 */                #   65: 0c56
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #   67: 022027
            movi         a7, 0 /* 0x00000000 */                #   6a: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #   6c: c00000
            movi         a2, 119 /* 0x00000077 */              #   6f: 22a077
            movi         a3, 0 /* 0x00000000 */                #   72: 0c03
            movi         a4, 26 /* 0x0000001a */               #   74: 1ca4
            movi         a5, 5 /* 0x00000005 */                #   76: 0c55
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   78: 080c
            movi         a6, 5 /* 0x00000005 */                #   7a: 0c56
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #   7c: 022027
            movi         a7, 1 /* 0x00000001 */                #   7f: 0c17
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #   81: c00000
            movi         a2, 119 /* 0x00000077 */              #   84: 22a077
            movi         a3, 0 /* 0x00000000 */                #   87: 0c03
            movi         a4, 0 /* 0x00000000 */                #   89: 0c04
            movi         a5, 7 /* 0x00000007 */                #   8b: 0c75
            movi         a6, 0 /* 0x00000000 */                #   8d: 0c06
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   8f: 080c
            l32i         a7, sp, 0 /* [(local0)] */            #   91: 7801
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #   93: 022027
            extui        a7, a7, 12, 8                         #   96: 707c74
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #   99: c00000
            movi         a2, 119 /* 0x00000077 */              #   9c: 22a077
            movi         a3, 0 /* 0x00000000 */                #   9f: 0c03
            movi         a4, 1 /* 0x00000001 */                #   a1: 0c14
            movi         a5, 7 /* 0x00000007 */                #   a3: 0c75
            movi         a6, 0 /* 0x00000000 */                #   a5: 0c06
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   a7: 080c
            l32i         a7, sp, 0 /* [(local0)] */            #   a9: 7801
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #   ab: 022027
            extui        a7, a7, 4, 8                          #   ae: 707474
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #   b1: c00000
            movi         a2, 119 /* 0x00000077 */              #   b4: 22a077
            movi         a3, 0 /* 0x00000000 */                #   b7: 0c03
            movi         a4, 2 /* 0x00000002 */                #   b9: 0c24
            movi         a5, 3 /* 0x00000003 */                #   bb: 0c35
            movi         a6, 0 /* 0x00000000 */                #   bd: 0c06
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   bf: 080c
            l32i         a7, sp, 0 /* [(local0)] */            #   c1: 7801
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #   c3: 022027
            extui        a7, a7, 0, 4                          #   c6: 707034
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #   c9: c00000
            movi         a2, 119 /* 0x00000077 */              #   cc: 22a077
            movi         a3, 0 /* 0x00000000 */                #   cf: 0c03
            movi         a4, 4 /* 0x00000004 */                #   d1: 0c44
            movi         a5, 7 /* 0x00000007 */                #   d3: 0c75
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   d5: 080c
            movi         a6, 0 /* 0x00000000 */                #   d7: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #   d9: 022027
            extui        a7, a14, 0, 8                         #   dc: e07074
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #   df: c00000
            movi         a2, 119 /* 0x00000077 */              #   e2: 22a077
            movi         a3, 0 /* 0x00000000 */                #   e5: 0c03
            movi         a4, 3 /* 0x00000003 */                #   e7: 0c34
            movi         a5, 7 /* 0x00000007 */                #   e9: 0c75
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #   eb: 080c
            movi         a6, 0 /* 0x00000000 */                #   ed: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #   ef: 022027
            extui        a7, a14, 8, 8                         #   f2: e07874
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #   f5: c00000
            extui        a7, a14, 16, 4                        #   f8: e07035
            movi         a2, 119 /* 0x00000077 */              #   fb: 22a077
            movi         a3, 0 /* 0x00000000 */                #   fe: 0c03
            movi         a4, 2 /* 0x00000002 */                #  100: 0c24
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  102: 080c
            movi         a5, 7 /* 0x00000007 */                #  104: 0c75
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  106: 022027
            movi         a6, 4 /* 0x00000004 */                #  109: 0c46
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  10b: c00000
.Lbr001:    movi         a4, 15 /* 0x0000000f */               #  10e: 0cf4
            movi         a5, 3 /* 0x00000003 */                #  110: 0c35
            movi         a6, 3 /* 0x00000003 */                #  112: 0c36
            extui        a3, a13, 0, 1                         #  114: d03004
            movi         a2, 1 /* 0x00000001 */                #  117: 0c12
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  119: 080c
            movi         a14, 0 /* 0x00000000 */               #  11b: 0c0e
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  11d: 022027
            moveqz       a14, a2, a3                           #  120: 30e283
            mov          a7, a14                               #  123: 7d0e
            movi         a2, 119 /* 0x00000077 */              #  125: 22a077
            movi         a3, 0 /* 0x00000000 */                #  128: 0c03
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  12a: c00000
            mov          a7, a14                               #  12d: 7d0e
            movi         a2, 119 /* 0x00000077 */              #  12f: 22a077
            movi         a3, 0 /* 0x00000000 */                #  132: 0c03
            movi         a4, 24 /* 0x00000018 */               #  134: 1c84
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  136: 080c
            movi         a5, 0 /* 0x00000000 */                #  138: 0c05
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  13a: 022027
            movi         a6, 0 /* 0x00000000 */                #  13d: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  13f: c00000
            mov          a7, a13 /* arg0 */                    #  142: 7d0d
            movi         a2, 119 /* 0x00000077 */              #  144: 22a077
            movi         a3, 0 /* 0x00000000 */                #  147: 0c03
            movi         a4, 28 /* 0x0000001c */               #  149: 1cc4
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  14b: 080c
            movi         a5, 0 /* 0x00000000 */                #  14d: 0c05
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  14f: 022027
            movi         a6, 0 /* 0x00000000 */                #  152: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  154: c00000
            l32i         a12, sp, 8 /* [(local2)] */           #  157: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  159: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  15b: e841
            l32i         a0, sp, 4 /* [(local1)] */            #  15d: 0811
            addi         sp, sp, 32 /* (top of frame) */       #  15f: 12c120
            ret                                                #  162: 0df0

            .literal_position                                  #  164: 00000000
                                                               #  168: fe010000
                                                               #  16c: b4090000
                                                               #  170: 62020000
                                                               #  174: 00000000
                                                               #  178: 00000000
                                                               #  17c: 6c090000
                                                               #  180: a8090000
                                                               #  184: a3090000
                                                               #  188: 9e090000
                                                               #  18c: 99090000
                                                               #  190: 94090000
                                                               #  194: 8f090000
                                                               #  198: 8a090000
                                                               #  19c: 85090000
                                                               #  1a0: 80090000
                                                               #  1a4: 7b090000
                                                               #  1a8: 76090000
                                                               #  1ac: 71090000
                                                               #  1b0: c3030000
                                                               #  1b4: 00000000

# Function @ .irom0.text+0x1b8
# Local variables/stack:
#     (local0):  byte      @ -0x30
#     (local1):  byte      @ -0x2f
#     (local2):  byte[2]   @ -0x2e
#     (local3):  word      @ -0x2c
#     (local4):  word      @ -0x28
#     (local5):  word      @ -0x24
#     (local6):  word      @ -0x20
#     (local7):  word      @ -0x1c
#     (local8):  word      @ -0x18
#     (local9):  word      @ -0x14
#     (local10): word      @ -0x10
#     (local11): word[3]   @ -0xc
            .balign      4
            .global      sdk_rom_set_channel_freq
            .type        sdk_rom_set_channel_freq, @function
sdk_rom_set_channel_freq:
            addi         sp, sp, -48 /* (local0) */            #  1b8: 12c1d0
            s32i         a12, sp, 20 /* a12 -> [(local7)] */   #  1bb: c951
            s32i         a3, sp, 12 /* arg1 -> [(local5)] */   #  1bd: 3931
            s32i         a6, sp, 8 /* arg4 -> [(local4)] */    #  1bf: 6921
            s32i         a7, sp, 32 /* arg5 -> [(local10)] */  #  1c1: 7981
            s32i         a5, sp, 4 /* arg3 -> [(local3)] */    #  1c3: 5911
            s32i         a0, sp, 16 /* a0 -> [(local6)] */     #  1c5: 0941
            s32i         a13, sp, 24 /* a13 -> [(local8)] */   #  1c7: d961
            s32i         a14, sp, 28 /* a14 -> [(local9)] */   #  1c9: e971
            mov          a13, a2 /* arg0 */                    #  1cb: dd02
            blti         a2, 1, .Lbr002                        #  1cd: a6120c
            movi         a0, 13 /* 0x0000000d */               #  1d0: 0cd0
            blt          a0, a2, .Lbr002                       #  1d2: 272007
            addi         a14, a2, -1 /* arg0-0x1 */            #  1d5: 0be2
            extui        a14, a14, 0, 8                        #  1d7: e0e074
            j            .Lbr003                               #  1da: 460000
.Lbr002:    movi         a14, 13 /* 0x0000000d */              #  1dd: 0cde
.Lbr003:    movi         a12, sdk_g_phyFuns                    #  1df: c1e1ff
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  1e2: 080c
            l32i         a0, a0, 220 /* [[sdk_g_phyFuns]+0xdc] */ #  1e4: 022037
            s32i         a4, sp, 36 /* arg2 -> [(local11)] */  #  1e7: 4991
            callx0       a0 /* [[sdk_g_phyFuns]+0xdc] */       #  1e9: c00000
            l32i         a0, sp, 36 /* [(local11)] */          #  1ec: 0891
            movi         a2, 14 /* 0x0000000e */               #  1ee: 0ce2
            bgeu         a13, a2, .Lbr004                      #  1f0: 27bd34
            movi         a4, .Lfunc001                         #  1f3: 41ddff
            addx2        a3, a13, a13                          #  1f6: d03d90
            add          a3, a3, a4                            #  1f9: 4a33
            jx           a3                                    #  1fb: a00300
.Lfunc001:  j            .Lbr004                               #  1fe: 860900
            j            .Lbr016                               #  201: 465300
            j            .Lbr028                               #  204: 866400
            j            .Lbr027                               #  207: 466200
            j            .Lbr026                               #  20a: 066000
            j            .Lbr025                               #  20d: c65d00
            j            .Lbr024                               #  210: 865b00
            j            .Lbr023                               #  213: 465900
            j            .Lbr022                               #  216: 065700
            j            .Lbr021                               #  219: c65400
            j            .Lbr020                               #  21c: 865200
            j            .Lbr019                               #  21f: 465000
            j            .Lbr018                               #  222: 064e00
            j            .Lbr017                               #  225: c64b00
.Lbr004:    movi         a12, 0x000009b4                       #  228: c1d1ff
.Lbr005:    addx2        a4, a14, a0                           #  22b: 004e90
            l16si        a4, a4, 0                             #  22e: 429400
            ssr          a14                                   #  231: 000e40
            bnez         a4, .Lbr007                           #  234: 564405
            l32i         a5, sp, 12 /* [(local5)] */           #  237: 5831
            movi         a0, 59 /* 0x0000003b */               #  239: 3cb0
            beqz         a5, .Lbr029                           #  23b: 161516
            movi         a6, 91 /* 0x0000005b */               #  23e: 5cb6
            movi         a10, 93 /* 0x0000005d */              #  240: 5cda
            movi         a3, 94 /* 0x0000005e */               #  242: 5ce3
            movi         a11, 118 /* 0x00000076 */             #  244: b2a076
            movi         a14, -125 /* 0xffffff83 */            #  247: e2af83
            movi         a4, -73 /* 0xffffffb7 */              #  24a: 42afb7
            movi         a5, 92 /* 0x0000005c */               #  24d: 5cc5
            movi         a7, 14 /* 0x0000000e */               #  24f: 0ce7
            bltu         a13, a7, .Lbr006                      #  251: 773d02
            j            .Lbr013                               #  254: 863300
.Lbr006:    movi         a9, .Lfunc002                         #  257: 91c6ff
            addx2        a8, a13, a13                          #  25a: d08d90
            add          a8, a8, a9                            #  25d: 9a88
            jx           a8                                    #  25f: a00800
.Lfunc002:  j            .Lbr013                               #  262: 063000
            j            .Lbr009                               #  265: c62000
            j            .Lbr014                               #  268: 863200
            j            .Lbr047                               #  26b: c68200
            j            .Lbr046                               #  26e: 467f00
            j            .Lbr045                               #  271: 867b00
            j            .Lbr015                               #  274: 063300
            j            .Lbr044                               #  277: 067800
            j            .Lbr042                               #  27a: c67300
            j            .Lbr041                               #  27d: c66f00
            j            .Lbr039                               #  280: 466c00
            j            .Lbr038                               #  283: 066800
            j            .Lbr037                               #  286: 866400
            j            .Lbr036                               #  289: 066100
.Lbr007:    l32i         a10, sp, 4 /* [(local3)] */           #  28c: a811
            l32i         a13, sp, 8 /* [(local4)] */           #  28e: d821
            l32i         a10, a10, 0 /* [[(local3)]] */        #  290: a80a
            addx4        a13, a14, a13                         #  292: d0dea0
            srl          a10, a10                              #  295: a0a091
            bbsi         a10, 0, .Lbr008                       #  298: 07ea3b
            movi         a0, sdk_g_phyFuns                     #  29b: 01b6ff
            l32i         a3, sp, 12 /* [(local5)] */           #  29e: 3831
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  2a0: 0800
            mov          a2, a12 /* 0x000009b4 */              #  2a2: 2d0c
            l32i         a0, a0, 228 /* [[sdk_g_phyFuns]+0xe4] */ #  2a4: 022039
            mov          a5, sp /* (local0) */                 #  2a7: 5d01
            callx0       a0 /* [[sdk_g_phyFuns]+0xe4] */       #  2a9: c00000
            ssl          a14                                   #  2ac: 001e40
            movi         a4, 1 /* 0x00000001 */                #  2af: 0c14
            l32i         a3, sp, 4 /* [(local3)] */            #  2b1: 3811
            l8ui         a5, sp, 2 /* [(local2)] */            #  2b3: 520102
            l8ui         a7, sp, 1 /* [(local1)] */            #  2b6: 720101
            l8ui         a6, sp, 0 /* [(local0)] */            #  2b9: 620100
            slli         a7, a7, 8                             #  2bc: 807711
            slli         a6, a6, 16                            #  2bf: 006611
            or           a6, a6, a7                            #  2c2: 706620
            or           a5, a5, a6                            #  2c5: 605520
            s32i         a5, a13, 0                            #  2c8: 590d
            l32i         a2, a3, 0 /* [[(local3)]] */          #  2ca: 2803
            sll          a4, a4                                #  2cc: 0044a1
            or           a2, a2, a4                            #  2cf: 402220
            s32i         a2, a3, 0 /* a2 -> [[(local3)]] */    #  2d2: 2903
            j            .Lbr012                               #  2d4: 060800
.Lbr008:    l32i         a9, a13, 0                            #  2d7: 980d
            extui        a9, a9, 16, 16                        #  2d9: 9090f5
            s8i          a9, sp, 0 /* a9 -> [(local0)] */      #  2dc: 924100
            l32i         a8, a13, 0                            #  2df: 880d
            srli         a8, a8, 8                             #  2e1: 808841
            s8i          a8, sp, 1 /* a8 -> [(local1)] */      #  2e4: 824101
            l32i         a0, a13, 0                            #  2e7: 080d
            j            .Lbr011                               #  2e9: 060200
.Lbr009:    s8i          a6, sp, 0                             #  2ec: 624100
            movi         a3, -79                               #  2ef: 32afb1
.Lbr010:    s8i          a3, sp, 1                             #  2f2: 324101
.Lbr011:    s8i          a0, sp, 2 /* a0 -> [(local2)] */      #  2f5: 024102
.Lbr012:    movi         a14, sdk_g_phyFuns                    #  2f8: e1a0ff
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  2fb: 080e
            l32i         a0, a0, 224 /* [[sdk_g_phyFuns]+0xe0] */ #  2fd: 022038
            mov          a2, sp /* (local0) */                 #  300: 2d01
            callx0       a0 /* [[sdk_g_phyFuns]+0xe0] */       #  302: c00000
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  305: 080e
            l32i         a0, a0, 216 /* [[sdk_g_phyFuns]+0xd8] */ #  307: 022036
            l32i         a13, sp, 32 /* [(local10)] */         #  30a: d881
            callx0       a0 /* [[sdk_g_phyFuns]+0xd8] */       #  30c: c00000
            mov          a2, a13 /* [(local10)] */             #  30f: 2d0d
            call0        sdk_ets_delay_us                      #  311: 01a8ffc0
                                                               #  315: 0000
            l32i         a0, sp, 16 /* [(local6)] */           #  317: 0841
            l32i         a13, sp, 24 /* [(local8)] */          #  319: d861
            mov          a2, a12 /* 0x000009b4 */              #  31b: 2d0c
            l32i         a14, sp, 28 /* [(local9)] */          #  31d: e871
            l32i         a12, sp, 20 /* [(local7)] */          #  31f: c851
            addi         sp, sp, 48 /* (top of frame) */       #  321: 12c130
            ret           /* 0x000009b4 */                     #  324: 0df0
.Lbr013:    mov          a0, a11 /* 0x00000076 */              #  326: 0d0b
            movi         a3, 95 /* 0x0000005f */               #  328: 5cf3
            movi         a2, 98 /* 0x00000062 */               #  32a: 22a062
            s8i          a2, sp, 1 /* 0x62 -> [(local1)] */    #  32d: 224101
            s8i          a3, sp, 0 /* 0x5f -> [(local0)] */    #  330: 324100
            j            .Lbr011                               #  333: 86efff
.Lbr014:    s8i          a6, sp, 0                             #  336: 624100
            movi         a0, -33                               #  339: 02afdf
            movi         a4, -14                               #  33c: 7c24
            s8i          a4, sp, 1                             #  33e: 424101
            j            .Lbr011                               #  341: 06ecff
.Lbr015:    s8i          a5, sp, 0                             #  344: 524100
            movi         a0, 111                               #  347: 02a06f
            movi         a6, -7                                #  34a: 7c96
            s8i          a6, sp, 1                             #  34c: 624101
            j            .Lbr011                               #  34f: 86e8ff
.Lbr016:    movi         a12, None                             #  352: c18aff
            j            .Lbr005                               #  355: 86b4ff
.Lbr017:    movi         a12, None                             #  358: c18aff
            j            .Lbr005                               #  35b: 06b3ff
.Lbr018:    movi         a12, None                             #  35e: c189ff
            j            .Lbr005                               #  361: 86b1ff
.Lbr019:    movi         a12, None                             #  364: c189ff
            j            .Lbr005                               #  367: 06b0ff
.Lbr020:    movi         a12, None                             #  36a: c188ff
            j            .Lbr005                               #  36d: 86aeff
.Lbr021:    movi         a12, None                             #  370: c188ff
            j            .Lbr005                               #  373: 06adff
.Lbr022:    movi         a12, None                             #  376: c187ff
            j            .Lbr005                               #  379: 86abff
.Lbr023:    movi         a12, None                             #  37c: c187ff
            j            .Lbr005                               #  37f: 06aaff
.Lbr024:    movi         a12, None                             #  382: c186ff
            j            .Lbr005                               #  385: 86a8ff
.Lbr025:    movi         a12, None                             #  388: c186ff
            j            .Lbr005                               #  38b: 06a7ff
.Lbr026:    movi         a12, None                             #  38e: c185ff
            j            .Lbr005                               #  391: 86a5ff
.Lbr027:    movi         a12, None                             #  394: c185ff
            j            .Lbr005                               #  397: 06a4ff
.Lbr028:    movi         a12, None                             #  39a: c184ff
            j            .Lbr005                               #  39d: 86a2ff
.Lbr029:    movi         a6, 17 /* 0x00000011 */               #  3a0: 1c16
            movi         a10, -26 /* 0xffffffe6 */             #  3a2: 6c6a
            movi         a5, -69 /* 0xffffffbb */              #  3a4: 52afbb
            movi         a14, -111 /* 0xffffff91 */            #  3a7: e2af91
            movi         a3, 102 /* 0x00000066 */              #  3aa: 32a066
            movi         a7, 50 /* 0x00000032 */               #  3ad: 3c27
            movi         a11, 49 /* 0x00000031 */              #  3af: 3c1b
            movi         a4, 48 /* 0x00000030 */               #  3b1: 3c04
            movi         a8, 14 /* 0x0000000e */               #  3b3: 0ce8
            bgeu         a13, a8, .Lbr030                      #  3b5: 87bd34
            movi         a2, .Lfunc003                         #  3b8: 217eff
            addx2        a9, a13, a13                          #  3bb: d09d90
            add          a9, a9, a2                            #  3be: 2a99
            jx           a9                                    #  3c0: a00900
.Lfunc003:  j            .Lbr030                               #  3c3: 860900
            j            .Lbr034                               #  3c6: 060f00
            j            .Lbr031                               #  3c9: c60900
            j            .Lbr053                               #  3cc: 463500
            j            .Lbr054                               #  3cf: 863500
            j            .Lbr056                               #  3d2: c63800
            j            .Lbr032                               #  3d5: 460800
            j            .Lbr048                               #  3d8: c62a00
            j            .Lbr049                               #  3db: 062b00
            j            .Lbr055                               #  3de: 063400
            j            .Lbr050                               #  3e1: 862a00
            j            .Lbr051                               #  3e4: c62b00
            j            .Lbr052                               #  3e7: 062c00
            j            .Lbr033                               #  3ea: 860500
.Lbr030:    mov          a4, a7 /* 0x00000032 */               #  3ed: 4d07
            movi         a6, -52 /* 0xffffffcc */              #  3ef: 62afcc
            mov          a14, a6 /* 0xffffffcc */              #  3f2: ed06
.Lbr031:    mov          a5, a6 /* 0xffffffcc */               #  3f4: 5d06
            mov          a0, a14 /* 0xffffffcc */              #  3f6: 0d0e
            mov          a11, a4 /* 0x00000032 */              #  3f8: bd04
.Lbr032:    mov          a3, a5 /* 0xffffffcc */               #  3fa: 3d05
            mov          a4, a11 /* 0x00000032 */              #  3fc: 4d0b
            s8i          a0, sp, 1 /* 0xcc -> [(local1)] */    #  3fe: 024101
            j            .Lbr035                               #  401: 060100
.Lbr033:    mov          a4, a7                                #  404: 4d07
.Lbr034:    s8i          a3, sp, 1                             #  406: 324101
.Lbr035:    mov          a0, a3 /* 0xffffffcc */               #  409: 0d03
            s8i          a4, sp, 0 /* 0x32 -> [(local0)] */    #  40b: 424100
            j            .Lbr011                               #  40e: c6b8ff
.Lbr036:    s8i          a3, sp, 0                             #  411: 324100
            movi         a0, -20                               #  414: 6cc0
            movi         a3, -60                               #  416: 32afc4
            j            .Lbr010                               #  419: 46b5ff
.Lbr037:    s8i          a3, sp, 0                             #  41c: 324100
            s8i          a14, sp, 1                            #  41f: e24101
            movi         a0, 72                                #  422: 4c80
            j            .Lbr011                               #  424: 46b3ff
.Lbr038:    s8i          a3, sp, 0                             #  427: 324100
            movi         a0, -92                               #  42a: 02afa4
            movi         a4, 65                                #  42d: 4c14
            s8i          a4, sp, 1                             #  42f: 424101
            j            .Lbr011                               #  432: c6afff
.Lbr039:    movi         a0, 0                                 #  435: 0c00
            s8i          a0, sp, 1                             #  437: 024101
.Lbr040:    s8i          a3, sp, 0                             #  43a: 324100
            j            .Lbr011                               #  43d: 06adff
.Lbr041:    mov          a0, a6                                #  440: 0d06
            mov          a3, a10                               #  442: 3d0a
            movi         a5, -66                               #  444: 52afbe
            s8i          a5, sp, 1                             #  447: 524101
            j            .Lbr040                               #  44a: 06fbff
.Lbr042:    s8i          a10, sp, 0                            #  44d: a24100
            movi         a0, 124                               #  450: 02a07c
.Lbr043:    s8i          a0, sp, 1                             #  453: 024101
            mov          a0, a4                                #  456: 0d04
            j            .Lbr011                               #  458: 46a6ff
.Lbr044:    s8i          a10, sp, 0                            #  45b: a24100
            movi         a4, 19                                #  45e: 1c34
            j            .Lbr043                               #  460: c6fbff
.Lbr045:    s8i          a5, sp, 0                             #  463: 524100
            s8i          a4, sp, 1                             #  466: 424101
            movi         a0, -53                               #  469: 02afcb
            j            .Lbr011                               #  46c: 46a1ff
.Lbr046:    s8i          a5, sp, 0                             #  46f: 524100
            s8i          a11, sp, 1                            #  472: b24101
            movi         a0, 39                                #  475: 2c70
            j            .Lbr011                               #  477: 869eff
.Lbr047:    mov          a0, a14                               #  47a: 0d0e
            s8i          a5, sp, 0                             #  47c: 524100
            movi         a6, 52                                #  47f: 3c46
            s8i          a6, sp, 1                             #  481: 624101
            j            .Lbr011                               #  484: 469bff
.Lbr048:    mov          a6, a3                                #  487: 6d03
            mov          a14, a6                               #  489: ed06
.Lbr049:    mov          a3, a6                                #  48b: 3d06
            mov          a10, a14                              #  48d: ad0e
.Lbr050:    mov          a4, a11                               #  48f: 4d0b
            s8i          a10, sp, 1                            #  491: a24101
            j            .Lbr035                               #  494: 46dcff
.Lbr051:    mov          a5, a6                                #  497: 5d06
            mov          a0, a5                                #  499: 0d05
.Lbr052:    mov          a3, a5                                #  49b: 3d05
            mov          a4, a7                                #  49d: 4d07
            s8i          a0, sp, 1                             #  49f: 024101
            j            .Lbr035                               #  4a2: c6d8ff
.Lbr053:    mov          a3, a5                                #  4a5: 3d05
            mov          a10, a3                               #  4a7: ad03
.Lbr054:    mov          a5, a3                                #  4a9: 5d03
            mov          a0, a10                               #  4ab: 0d0a
            mov          a11, a4                               #  4ad: bd04
            j            .Lbr032                               #  4af: c6d1ff
.Lbr055:    mov          a3, a5                                #  4b2: 3d05
            mov          a10, a3                               #  4b4: ad03
            j            .Lbr050                               #  4b6: 46f5ff
.Lbr056:    mov          a5, a6                                #  4b9: 5d06
            mov          a0, a5                                #  4bb: 0d05
            j            .Lbr032                               #  4bd: 46ceff

            .literal_position                                  #  4c0: 00000000
                                                               #  4c4: 5d050000
                                                               #  4c8: 000af23f
                                                               #  4cc: 00000000
                                                               #  4d0: 60090000
                                                               #  4d4: 00000000
                                                               #  4d8: 009a0060
                                                               #  4dc: 08520000
                                                               #  4e0: 00600000
                                                               #  4e4: 0000e03f
                                                               #  4e8: 99994940
                                                               #  4ec: 9a999999
                                                               #  4f0: 9999e940
                                                               #  4f4: 9a999999
                                                               #  4f8: 00960060
                                                               #  4fc: ffff0f00
                                                               #  500: 000000c0
                                                               #  504: 00000000
                                                               #  508: 00000000
                                                               #  50c: 00000000
                                                               #  510: 00000000
                                                               #  514: 00000000
                                                               #  518: 00000000
                                                               #  51c: 00000000
                                                               #  520: 00000000

# Function @ .irom0.text+0x524
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word      @ -0x8
#     (local7):  word      @ -0x4
            .balign      4
            .global      sdk_rom_chip_50_set_channel
            .type        sdk_rom_chip_50_set_channel, @function
sdk_rom_chip_50_set_channel:
            addi         sp, sp, -32 /* (local0) */            #  524: 12c1e0
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  527: 0921
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   #  529: d941
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  52b: c931
            s32i         a14, sp, 20 /* a14 -> [(local5)] */   #  52d: e951
            mov          a12, a2 /* arg0 */                    #  52f: cd02
            mov          a14, a4 /* arg2 */                    #  531: ed04
            movi         a13, sdk_g_phyFuns                    #  533: d1e3ff
            mov          a4, a5 /* arg3 */                     #  536: 4d05
            s32i         a14, sp, 28 /* arg2 -> [(local7)] */  #  538: e971
            mov          a5, a6 /* arg4 */                     #  53a: 5d06
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  53c: 080d
            mov          a6, a7 /* arg5 */                     #  53e: 6d07
            l32i         a0, a0, 128 /* [[sdk_g_phyFuns]+0x80] */ #  540: 022020
            l16ui        a7, sp, 32 /* [(local8)] */           #  543: 721110
            callx0       a0 /* [[sdk_g_phyFuns]+0x80] */       #  546: c00000
            mov          a3, a2                                #  549: 3d02
            l32i         a0, sp, 28 /* [(local7)] */           #  54b: 0871
            movi         a8, 14 /* 0x0000000e */               #  54d: 0ce8
            bgeu         a12, a8, .Lbr057                      #  54f: 87bc34
            movi         a10, .Lfunc004                        #  552: a1dcff
            addx2        a9, a12, a12                          #  555: c09c90
            add          a9, a9, a10                           #  558: aa99
            jx           a9                                    #  55a: a00900
.Lfunc004:  j            .Lbr057                               #  55d: 860900
            j            .Lbr066                               #  560: c65200
            j            .Lbr078                               #  563: 066d00
            j            .Lbr077                               #  566: 066a00
            j            .Lbr076                               #  569: 066700
            j            .Lbr075                               #  56c: 066400
            j            .Lbr074                               #  56f: 066100
            j            .Lbr073                               #  572: 065e00
            j            .Lbr072                               #  575: 065b00
            j            .Lbr071                               #  578: 065800
            j            .Lbr070                               #  57b: 065500
            j            .Lbr069                               #  57e: 065200
            j            .Lbr068                               #  581: 064f00
            j            .Lbr067                               #  584: 064c00
.Lbr057:    movi         a13, 106 /* 0x0000006a */             #  587: d2a06a
            movi         a14, 264 /* 0x00000108 */             #  58a: e2a108
.Lbr058:    beqz         a0, .Lbr060                           #  58d: 161004
            movi         a11, 0x3ff20a00                       #  590: b1ceff
            memw                                               #  593: c02000
            l32i         a11, a11, 0x270 /* [0x3ff20c70] */    #  596: b22b9c
            s32i         a3, sp, 24 /* a3 -> [(local6)] */     #  599: 3961
            bbsi         a11, 1, .Lbr059                       #  59b: 17eb15
            movi         a2, 103 /* 0x00000067 */              #  59e: 22a067
            movi         a0, sdk_g_phyFuns                     #  5a1: 01caff
            movi         a3, 4 /* 0x00000004 */                #  5a4: 0c43
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  5a6: 0800
            movi         a4, 7 /* 0x00000007 */                #  5a8: 0c74
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  5aa: 022026
            movi         a5, 4 /* 0x00000004 */                #  5ad: 0c45
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  5af: c00000
            l32i         a3, sp, 24 /* [(local6)] */           #  5b2: 3861
.Lbr059:    movi         a2, 1 /* 0x00000001 */                #  5b4: 0c12
            movi         a0, sdk_g_phyFuns                     #  5b6: 01c7ff
            movi         a4, 0x00000960                        #  5b9: 41c5ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  5bc: 0800
            mull         a3, a3, a14                           #  5be: e03382
            l32i         a0, a0, 124 /* [[sdk_g_phyFuns]+0x7c] */ #  5c1: 02201f
            mul16u       a4, a14, a4                           #  5c4: 404ec1
            callx0       a0 /* [[sdk_g_phyFuns]+0x7c] */       #  5c7: c00000
            movi         a2, 5 /* 0x00000005 */                #  5ca: 0c52
            call0        sdk_ets_delay_us                      #  5cc: 01ceffc0
                                                               #  5d0: 0000
.Lbr060:    movi         a5, 0x60009a00                        #  5d2: 51c1ff
            movi         a7, 0x00005208                        #  5d5: 71c1ff
            movi         a6, 0x00006000                        #  5d8: 61c2ff
            add          a7, a13, a7 /* 0x00005272 */          #  5db: 7a7d
            slli         a7, a7, 17                            #  5dd: f07701
            memw                                               #  5e0: c02000
            l32i         a4, a5, 0x114 /* [0x60009b14] */      #  5e3: 422545
            extui        a4, a4, 0, 13                         #  5e6: 4040c4
            or           a4, a4, a7                            #  5e9: 704420
            or           a4, a4, a6                            #  5ec: 604420
            memw                                               #  5ef: c02000
            s32i         a4, a5, 0x114 /* a4 -> [0x60009b14] */ #  5f2: 426545
            addi         a2, a12, -5 /* arg0-0x5 */            #  5f5: 22ccfb
            beqz         a2, .Lbr063                           #  5f8: 16420a
            beqi         a12, 6, .Lbr061                       #  5fb: 266c1e
            addi         a8, a12, -7 /* arg0-0x7 */            #  5fe: 82ccf9
            beqz         a8, .Lbr064                           #  601: 16080a
            addi         a9, a12, -8 /* arg0-0x8 */            #  604: 92ccf8
            beqz         a9, .Lbr065                           #  607: 16f909
            addi         a10, a12, -13 /* arg0-0xd */          #  60a: a2ccf3
            beqz         a10, .Lbr063                          #  60d: 16fa08
            addi         a13, a12, -14 /* arg0-0xe */          #  610: d2ccf2
            movi         a11, -4 /* 0xfffffffc */              #  613: 7ccb
            movi         a2, 0 /* 0x00000000 */                #  615: 0c02
            moveqz       a2, a11, a13                          #  617: d02b83
            j            .Lbr062                               #  61a: 460000
.Lbr061:    movi         a2, 3 /* 0x00000003 */                #  61d: 0c32
.Lbr062:    movi         a13, 0x3fe00000                       #  61f: d1b1ff
            movi         a12, 0 /* 0x00000000 */               #  622: 0c0c
            call0        __floatsidf                           #  624: 01b9ffc0
                                                               #  628: 0000
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      #  62a: 2911
            s32i         a3, sp, 0 /* a3 -> [(local0)] */      #  62c: 3901
            movi         a5, 0x40499999                        #  62e: 51aeff
            movi         a4, 0x9999999a                        #  631: 41aeff
            call0        __muldf3                              #  634: 01b6ffc0
                                                               #  638: 0000
            mov          a5, a13 /* 0x3fe00000 */              #  63a: 5d0d
            mov          a4, a12 /* 0x00000000 */              #  63c: 4d0c
            call0        __adddf3                              #  63e: 01b4ffc0
                                                               #  642: 0000
            call0        __fixdfsi                             #  644: 01b4ffc0
                                                               #  648: 0000
            l32i         a3, sp, 0 /* [(local0)] */            #  64a: 3801
            movi         a5, 0x40e99999                        #  64c: 51a9ff
            mov          a14, a2                               #  64f: ed02
            movi         a4, 0x9999999a                        #  651: 41a8ff
            l32i         a2, sp, 4 /* [(local1)] */            #  654: 2811
            call0        __muldf3                              #  656: 01b0ffc0
                                                               #  65a: 0000
            mov          a4, a12 /* 0x00000000 */              #  65c: 4d0c
            mov          a5, a13 /* 0x3fe00000 */              #  65e: 5d0d
            call0        __adddf3                              #  660: 01afffc0
                                                               #  664: 0000
            movi         a12, 0x60009600                       #  666: c1a4ff
            call0        __fixdfsi                             #  669: 01adffc0
                                                               #  66d: 0000
            movi         a0, 0x000fffff                        #  66f: 01a3ff
            extui        a3, a14, 0, 10                        #  672: e03094
            and          a0, a2, a0                            #  675: 000210
            slli         a3, a3, 20                            #  678: c03301
            movi         a2, 0xc0000000                        #  67b: 21a1ff
            memw                                               #  67e: c02000
            l32i         a14, a12, 0x2a0 /* [0x600098a0] */    #  681: e22ca8
            and          a14, a14, a2                          #  684: 20ee10
            or           a14, a14, a3                          #  687: 30ee20
            or           a14, a14, a0                          #  68a: 00ee20
            memw                                               #  68d: c02000
            s32i         a14, a12, 0x2a0 /* a14 -> [0x600098a0] */ #  690: e26ca8
            l32i         a13, sp, 16 /* [(local4)] */          #  693: d841
            l32i         a12, sp, 12 /* [(local3)] */          #  695: c831
            l32i         a14, sp, 20 /* [(local5)] */          #  697: e851
            l32i         a0, sp, 8 /* [(local2)] */            #  699: 0821
            addi         sp, sp, 32 /* (local8) */             #  69b: 12c120
            ret           /* 0xc0000000 */                     #  69e: 0df0
.Lbr063:    movi         a2, 8 /* 0x00000008 */                #  6a0: 0c82
            j            .Lbr062                               #  6a2: 46deff
.Lbr064:    movi         a2, -2 /* 0xfffffffe */               #  6a5: 7ce2
            j            .Lbr062                               #  6a7: 06ddff
.Lbr065:    movi         a2, -7 /* 0xfffffff9 */               #  6aa: 7c92
            j            .Lbr062                               #  6ac: c6dbff
.Lbr066:    movi         a14, 265                              #  6af: e2a109
            movi         a13, 737                              #  6b2: d2a2e1
            j            .Lbr058                               #  6b5: 06b5ff
.Lbr067:    movi         a14, 264                              #  6b8: e2a108
            movi         a13, 209                              #  6bb: d2a0d1
            j            .Lbr058                               #  6be: c6b2ff
.Lbr068:    movi         a14, 264                              #  6c1: e2a108
            movi         a13, 252                              #  6c4: d2a0fc
            j            .Lbr058                               #  6c7: 86b0ff
.Lbr069:    movi         a14, 258                              #  6ca: e2a102
            movi         a13, 295                              #  6cd: d2a127
            j            .Lbr058                               #  6d0: 46aeff
.Lbr070:    movi         a14, 257                              #  6d3: e2a101
            movi         a13, 339                              #  6d6: d2a153
            j            .Lbr058                               #  6d9: 06acff
.Lbr071:    movi         a14, 264                              #  6dc: e2a108
            movi         a13, 382                              #  6df: d2a17e
            j            .Lbr058                               #  6e2: c6a9ff
.Lbr072:    movi         a14, 283                              #  6e5: e2a11b
            movi         a13, 426                              #  6e8: d2a1aa
            j            .Lbr058                               #  6eb: 86a7ff
.Lbr073:    movi         a14, 255                              #  6ee: e2a0ff
            movi         a13, 470                              #  6f1: d2a1d6
            j            .Lbr058                               #  6f4: 46a5ff
.Lbr074:    movi         a14, 269                              #  6f7: e2a10d
            movi         a13, 514                              #  6fa: d2a202
            j            .Lbr058                               #  6fd: 06a3ff
.Lbr075:    movi         a14, 265                              #  700: e2a109
            movi         a13, 558                              #  703: d2a22e
            j            .Lbr058                               #  706: c6a0ff
.Lbr076:    movi         a14, 265                              #  709: e2a109
            movi         a13, 602                              #  70c: d2a25a
            j            .Lbr058                               #  70f: 869eff
.Lbr077:    movi         a14, 264                              #  712: e2a108
            movi         a13, 647                              #  715: d2a287
            j            .Lbr058                               #  718: 469cff
.Lbr078:    movi         a14, 261                              #  71b: e2a105
            movi         a13, 692                              #  71e: d2a2b4
            j            .Lbr058                               #  721: 069aff

            .literal_position                                  #  724: 00000000

# Function @ .irom0.text+0x728
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_rom_chip_v5_rx_init
            .type        sdk_rom_chip_v5_rx_init, @function
sdk_rom_chip_v5_rx_init:
            movi         a2, 97 /* 0x00000061 */               #  728: 22a061
            movi         a3, 1 /* 0x00000001 */                #  72b: 0c13
            addi         sp, sp, -16 /* (local0) */            #  72d: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  730: c911
            movi         a12, sdk_g_phyFuns                    #  732: c1fcff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  735: 0901
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  737: 080c
            movi         a4, 8 /* 0x00000008 */                #  739: 0c84
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  73b: 022026
            movi         a5, 17 /* 0x00000011 */               #  73e: 1c15
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  740: c00000
            movi         a2, 97 /* 0x00000061 */               #  743: 22a061
            movi         a3, 1 /* 0x00000001 */                #  746: 0c13
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  748: 080c
            movi         a4, 6 /* 0x00000006 */                #  74a: 0c64
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  74c: 022026
            movi         a5, 21 /* 0x00000015 */               #  74f: 1c55
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  751: c00000
            movi         a2, 97 /* 0x00000061 */               #  754: 22a061
            movi         a3, 1 /* 0x00000001 */                #  757: 0c13
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  759: 080c
            movi         a4, 7 /* 0x00000007 */                #  75b: 0c74
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  75d: 022026
            movi         a5, 81 /* 0x00000051 */               #  760: 5c15
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  762: c00000
            movi         a2, 100 /* 0x00000064 */              #  765: 22a064
            movi         a3, 0 /* 0x00000000 */                #  768: 0c03
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  76a: 080c
            movi         a4, 4 /* 0x00000004 */                #  76c: 0c44
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  76e: 022026
            movi         a5, 121 /* 0x00000079 */              #  771: 52a079
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  774: c00000
            movi         a2, 100 /* 0x00000064 */              #  777: 22a064
            movi         a3, 0 /* 0x00000000 */                #  77a: 0c03
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  77c: 080c
            movi         a4, 7 /* 0x00000007 */                #  77e: 0c74
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  780: 022026
            movi         a5, 123 /* 0x0000007b */              #  783: 52a07b
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  786: c00000
            l32i         a12, sp, 4 /* [(local1)] */           #  789: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  78b: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  78d: 12c110
            ret                                                #  790: 0df0

            .literal_position                                  #  794: 00000000

# Function @ .irom0.text+0x798
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_rom_chip_v5_tx_init
            .type        sdk_rom_chip_v5_tx_init, @function
sdk_rom_chip_v5_tx_init:
            movi         a2, 107 /* 0x0000006b */              #  798: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  79b: 0c23
            addi         sp, sp, -16 /* (local0) */            #  79d: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  7a0: c911
            movi         a12, sdk_g_phyFuns                    #  7a2: c1fcff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  7a5: 0901
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  7a7: 080c
            movi         a4, 1 /* 0x00000001 */                #  7a9: 0c14
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  7ab: 022026
            movi         a5, 104 /* 0x00000068 */              #  7ae: 52a068
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  7b1: c00000
            movi         a2, 107 /* 0x0000006b */              #  7b4: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  7b7: 0c23
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  7b9: 080c
            movi         a4, 2 /* 0x00000002 */                #  7bb: 0c24
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  7bd: 022026
            movi         a5, 15 /* 0x0000000f */               #  7c0: 0cf5
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  7c2: c00000
            movi         a2, 107 /* 0x0000006b */              #  7c5: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  7c8: 0c23
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  7ca: 080c
            movi         a4, 3 /* 0x00000003 */                #  7cc: 0c34
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  7ce: 022026
            movi         a5, 168 /* 0x000000a8 */              #  7d1: 52a0a8
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  7d4: c00000
            movi         a2, 107 /* 0x0000006b */              #  7d7: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  7da: 0c23
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  7dc: 080c
            movi         a4, 4 /* 0x00000004 */                #  7de: 0c44
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  7e0: 022026
            movi         a5, 6 /* 0x00000006 */                #  7e3: 0c65
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  7e5: c00000
            movi         a2, 107 /* 0x0000006b */              #  7e8: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  7eb: 0c23
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  7ed: 080c
            movi         a4, 5 /* 0x00000005 */                #  7ef: 0c54
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  7f1: 022026
            movi         a5, 8 /* 0x00000008 */                #  7f4: 0c85
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  7f6: c00000
            movi         a2, 107 /* 0x0000006b */              #  7f9: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  7fc: 0c23
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  7fe: 080c
            movi         a4, 6 /* 0x00000006 */                #  800: 0c64
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  802: 022026
            movi         a5, 184 /* 0x000000b8 */              #  805: 52a0b8
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  808: c00000
            movi         a2, 107 /* 0x0000006b */              #  80b: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  80e: 0c23
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  810: 080c
            movi         a4, 7 /* 0x00000007 */                #  812: 0c74
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  814: 022026
            movi         a5, 91 /* 0x0000005b */               #  817: 5cb5
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  819: c00000
            movi         a2, 107 /* 0x0000006b */              #  81c: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  81f: 0c23
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  821: 080c
            movi         a4, 8 /* 0x00000008 */                #  823: 0c84
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  825: 022026
            movi         a5, 4 /* 0x00000004 */                #  828: 0c45
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  82a: c00000
            movi         a2, 107 /* 0x0000006b */              #  82d: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  830: 0c23
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  832: 080c
            movi         a4, 9 /* 0x00000009 */                #  834: 0c94
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  836: 022026
            movi         a5, 0 /* 0x00000000 */                #  839: 0c05
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  83b: c00000
            movi         a2, 107 /* 0x0000006b */              #  83e: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  841: 0c23
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  843: 080c
            movi         a4, 10 /* 0x0000000a */               #  845: 0ca4
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  847: 022026
            movi         a5, 116 /* 0x00000074 */              #  84a: 52a074
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  84d: c00000
            movi         a2, 107 /* 0x0000006b */              #  850: 22a06b
            movi         a3, 2 /* 0x00000002 */                #  853: 0c23
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  855: 080c
            movi         a4, 11 /* 0x0000000b */               #  857: 0cb4
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  859: 022026
            movi         a5, 7 /* 0x00000007 */                #  85c: 0c75
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  85e: c00000
            l32i         a12, sp, 4 /* [(local1)] */           #  861: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  863: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  865: 12c110
            ret                                                #  868: 0df0

            .literal_position                                  #  86c: 000a0060

# Function @ .irom0.text+0x870
            .balign      4
            .global      sdk_rom_i2c_readReg
            .type        sdk_rom_i2c_readReg, @function
sdk_rom_i2c_readReg:
            movi         a8, 0x60000a00                        #  870: 81ffff
            slli         a6, a4, 8                             #  873: 806411
            slli         a7, a3, 2                             #  876: e07311
            or           a6, a2, a6                            #  879: 606220
            add          a2, a7, a8                            #  87c: 8a27
            memw                                               #  87e: c02000
            s32i         a6, a2, 0x300                         #  881: 6262c0
            memw                                               #  884: c02000
            l32i         a5, a2, 0x300                         #  887: 5222c0
            bbci         a5, 25, .Lbr080                       #  88a: 977508
.Lbr079:    memw                                               #  88d: c02000
            l32i         a7, a2, 0x300                         #  890: 7222c0
            bbsi         a7, 25, .Lbr079                       #  893: 97f7f6
.Lbr080:    memw                                               #  896: c02000
            l32i         a2, a2, 0x300                         #  899: 2222c0
            extui        a2, a2, 16, 8                         #  89c: 202075
            ret                                                #  89f: 0df0

            .literal_position                                  #  8a4: 00000000

# Function @ .irom0.text+0x8a8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_rom_i2c_readReg_Mask
            .type        sdk_rom_i2c_readReg_Mask, @function
sdk_rom_i2c_readReg_Mask:
            addi         sp, sp, -16 /* (local0) */            #  8a8: 12c1f0
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  8ab: 0921
            movi         a0, sdk_g_phyFuns                     #  8ad: 01fdff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  8b0: 0800
            s32i         a5, sp, 0 /* arg3 -> [(local0)] */    #  8b2: 5901
            l32i         a0, a0, 144 /* [[sdk_g_phyFuns]+0x90] */ #  8b4: 022024
            s32i         a6, sp, 4 /* arg4 -> [(local1)] */    #  8b7: 6911
            callx0       a0 /* [[sdk_g_phyFuns]+0x90] */       #  8b9: c00000
            l32i         a4, sp, 0 /* [(local0)] */            #  8bc: 4801
            l32i         a5, sp, 4 /* [(local1)] */            #  8be: 5811
            l32i         a0, sp, 8 /* [(local2)] */            #  8c0: 0821
            ssr          a5                                    #  8c2: 000540
            addi         sp, sp, 16 /* (top of frame) */       #  8c5: 12c110
            sra          a3, a2                                #  8c8: 2030b1
            sub          a4, a4, a5                            #  8cb: 5044c0
            movi         a2, 1 /* 0x00000001 */                #  8ce: 0c12
            addi         a4, a4, 1                             #  8d0: 1b44
            ssl          a4                                    #  8d2: 001440
            sll          a2, a2                                #  8d5: 0022a1
            addi         a2, a2, -1                            #  8d8: 0b22
            and          a2, a2, a3                            #  8da: 302210
            extui        a2, a2, 0, 8                          #  8dd: 202074
            ret                                                #  8e0: 0df0

            .literal_position                                  #  8e4: 00000001
                                                               #  8e8: 000a0060

# Function @ .irom0.text+0x8ec
            .balign      4
            .global      sdk_rom_i2c_writeReg
            .type        sdk_rom_i2c_writeReg, @function
sdk_rom_i2c_writeReg:
            slli         a8, a5, 16                            #  8ec: 008511
            slli         a7, a4, 8                             #  8ef: 807411
            movi         a9, 0x60000a00                        #  8f2: 91fdff
            or           a7, a7, a8                            #  8f5: 807720
            movi         a8, 0x01000000                        #  8f8: 81fbff
            or           a7, a2, a7                            #  8fb: 707220
            or           a7, a7, a8                            #  8fe: 807720
            slli         a8, a3, 2                             #  901: e08311
            add          a2, a8, a9                            #  904: 9a28
            memw                                               #  906: c02000
            s32i         a7, a2, 0x300                         #  909: 7262c0
            memw                                               #  90c: c02000
            l32i         a6, a2, 0x300                         #  90f: 6222c0
            bbci         a6, 25, .Lbr082                       #  912: 977608
.Lbr081:    memw                                               #  915: c02000
            l32i         a9, a2, 0x300                         #  918: 9222c0
            bbsi         a9, 25, .Lbr081                       #  91b: 97f9f6
.Lbr082:    ret                                                #  91e: 0df0

            .literal_position                                  #  920: 00000000
                                                               #  924: 00000000

# Function @ .irom0.text+0x928
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
            .global      sdk_rom_i2c_writeReg_Mask
            .type        sdk_rom_i2c_writeReg_Mask, @function
sdk_rom_i2c_writeReg_Mask:
            addi         sp, sp, -32 /* (local0) */            #  928: 12c1e0
            s32i         a5, sp, 0 /* arg3 -> [(local0)] */    #  92b: 5901
            s32i         a6, sp, 4 /* arg4 -> [(local1)] */    #  92d: 6911
            s32i         a7, sp, 8 /* arg5 -> [(local2)] */    #  92f: 7921
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   #  931: c941
            s32i         a13, sp, 20 /* a13 -> [(local5)] */   #  933: d951
            s32i         a14, sp, 24 /* a14 -> [(local6)] */   #  935: e961
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     #  937: 0931
            movi         a0, sdk_g_phyFuns                     #  939: 01f9ff
            mov          a14, a2 /* arg0 */                    #  93c: ed02
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  93e: 0800
            mov          a13, a3 /* arg1 */                    #  940: dd03
            l32i         a0, a0, 144 /* [[sdk_g_phyFuns]+0x90] */ #  942: 022024
            mov          a12, a4 /* arg2 */                    #  945: cd04
            callx0       a0 /* [[sdk_g_phyFuns]+0x90] */       #  947: c00000
            mov          a4, a12 /* arg2 */                    #  94a: 4d0c
            mov          a3, a13 /* arg1 */                    #  94c: 3d0d
            movi         a5, 1 /* 0x00000001 */                #  94e: 0c15
            l32i         a8, sp, 0 /* [(local0)] */            #  950: 8801
            l32i         a6, sp, 8 /* [(local2)] */            #  952: 6821
            movi         a0, sdk_g_phyFuns                     #  954: 01f4ff
            l32i         a7, sp, 4 /* [(local1)] */            #  957: 7811
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  959: 0800
            ssl          a7                                    #  95b: 001740
            sll          a6, a6                                #  95e: 0066a1
            sub          a8, a8, a7                            #  961: 7088c0
            addi         a8, a8, 1                             #  964: 1b88
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  966: 022026
            ssl          a8                                    #  969: 001840
            sll          a5, a5                                #  96c: 0055a1
            ssl          a7                                    #  96f: 001740
            addi         a5, a5, -1                            #  972: 0b55
            movi         a7, -1 /* 0xffffffff */               #  974: 7cf7
            sll          a5, a5                                #  976: 0055a1
            xor          a5, a5, a7                            #  979: 705530
            and          a5, a2, a5                            #  97c: 505210
            mov          a2, a14 /* arg0 */                    #  97f: 2d0e
            or           a5, a5, a6                            #  981: 605520
            extui        a5, a5, 0, 8                          #  984: 505074
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  987: c00000
            l32i         a12, sp, 16 /* [(local4)] */          #  98a: c841
            l32i         a13, sp, 20 /* [(local5)] */          #  98c: d851
            l32i         a14, sp, 24 /* [(local6)] */          #  98e: e861
            l32i         a0, sp, 12 /* [(local3)] */           #  990: 0831
            addi         sp, sp, 32 /* (top of frame) */       #  992: 12c120
            ret                                                #  995: 0df0

            .literal_position                                  #  998: 00020060
                                                               #  99c: 000af23f
                                                               #  9a0: 00000000
                                                               #  9a4: 00000008
                                                               #  9a8: 009a0060
                                                               #  9ac: 00020060
                                                               #  9b0: 00000000

# Function @ .irom0.text+0x9b4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_rom_pbus_debugmode
            .type        sdk_rom_pbus_debugmode, @function
sdk_rom_pbus_debugmode:
            addi         sp, sp, -16 /* (local0) */            #  9b4: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  9b7: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  9b9: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  9bb: c911
            mov          a5, a0                                #  9bd: 5d00
            movi         a2, 0x60000200                        #  9bf: 21f6ff
            memw                                               #  9c2: c02000
            l32i         a2, a2, 0x394 /* [0x60000594] */      #  9c5: 2222e5
            movi         a6, 0x3ff20a00                        #  9c8: 61f5ff
            bbsi         a2, 0, .Lbr084                        #  9cb: 07e241
            memw                                               #  9ce: c02000
            l32i         a6, a6, 0x270 /* [0x3ff20c70] */      #  9d1: 62269c
            bbci         a6, 1, .Lbr084                        #  9d4: 176638
            movi         a12, sdk_g_phyFuns                    #  9d7: c1f2ff
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  9da: 080c
            l32i         a0, a0, 116 /* [[sdk_g_phyFuns]+0x74] */ #  9dc: 02201d
            callx0       a0 /* [[sdk_g_phyFuns]+0x74] */       #  9df: c00000
            movi         a2, 5 /* 0x00000005 */                #  9e2: 0c52
            call0        sdk_ets_delay_us                      #  9e4: 01f3ffc0
                                                               #  9e8: 0000
            movi         a13, 388 /* 0x00000184 */             #  9ea: d2a184
.Lbr083:    l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  9ed: 080c
            movi         a2, 2 /* 0x00000002 */                #  9ef: 0c22
            l32i         a0, a0, 176 /* [[sdk_g_phyFuns]+0xb0] */ #  9f1: 02202c
            movi         a3, 1 /* 0x00000001 */                #  9f4: 0c13
            callx0       a0 /* [[sdk_g_phyFuns]+0xb0] */       #  9f6: c00000
            bnall        a2, a13, .Lbr083                      #  9f9: d7c2f0
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  9fc: 080c
            movi         a2, 3 /* 0x00000003 */                #  9fe: 0c32
            l32i         a0, a0, 176 /* [[sdk_g_phyFuns]+0xb0] */ #  a00: 02202c
            movi         a3, 2 /* 0x00000002 */                #  a03: 0c23
            callx0       a0 /* [[sdk_g_phyFuns]+0xb0] */       #  a05: c00000
            movi         a3, 6 /* 0x00000006 */                #  a08: 0c63
            and          a2, a2, a3                            #  a0a: 302210
            bnei         a2, 6, .Lbr083                        #  a0d: 6662dc
.Lbr084:    movi         a9, 0x08000000                        #  a10: 91e5ff
            movi         a8, 0x60009a00                        #  a13: 81e5ff
            memw                                               #  a16: c02000
            l32i         a7, a8, 0x108 /* [0x60009b08] */      #  a19: 722842
            or           a7, a7, a9                            #  a1c: 907720
            memw                                               #  a1f: c02000
            s32i         a7, a8, 0x108 /* a7 -> [0x60009b08] */ #  a22: 726842
            memw                                               #  a25: c02000
            movi         a5, 0x60000200                        #  a28: 51e1ff
            l32i         a4, a5, 0x394 /* [0x60000594] */      #  a2b: 4225e5
            movi         a6, 1 /* 0x00000001 */                #  a2e: 0c16
            or           a4, a4, a6                            #  a30: 604420
            memw                                               #  a33: c02000
            s32i         a4, a5, 0x394 /* a4 -> [0x60000594] */ #  a36: 4265e5
            l32i         a12, sp, 4 /* [(local1)] */           #  a39: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  a3b: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  a3d: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  a3f: 12c110
            ret                                                #  a42: 0df0

            .literal_position                                  #  a44: 00000000
                                                               #  a48: 00000000
                                                               #  a4c: 00000000

# Function @ .irom0.text+0xa50
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_rom_pbus_enter_debugmode
            .type        sdk_rom_pbus_enter_debugmode, @function
sdk_rom_pbus_enter_debugmode:
            addi         sp, sp, -16 /* (local0) */            #  a50: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  a53: 0911
            movi         a0, sdk_g_phyFuns                     #  a55: 01fbff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  a58: 0800
            l32i         a0, a0, 160 /* [[sdk_g_phyFuns]+0xa0] */ #  a5a: 022028
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  a5d: 2901
            callx0       a0 /* [[sdk_g_phyFuns]+0xa0] */       #  a5f: c00000
            movi         a0, sdk_g_phyFuns                     #  a62: 01f9ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  a65: 0800
            l32i         a0, a0, 192 /* [[sdk_g_phyFuns]+0xc0] */ #  a67: 022030
            movi         a2, 1 /* 0x00000001 */                #  a6a: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0xc0] */       #  a6c: c00000
            movi         a0, sdk_g_phyFuns                     #  a6f: 01f7ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  a72: 0800
            l32i         a0, a0, 208 /* [[sdk_g_phyFuns]+0xd0] */ #  a74: 022034
            l32i         a2, sp, 0 /* [(local0)] */            #  a77: 2801
            callx0       a0 /* [[sdk_g_phyFuns]+0xd0] */       #  a79: c00000
            l32i         a0, sp, 4 /* [(local1)] */            #  a7c: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  a7e: 12c110
            ret                                                #  a81: 0df0

            .literal_position                                  #  a84: 00000000
                                                               #  a88: 00000000
                                                               #  a8c: 00000000

# Function @ .irom0.text+0xa90
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_rom_pbus_exit_debugmode
            .type        sdk_rom_pbus_exit_debugmode, @function
sdk_rom_pbus_exit_debugmode:
            addi         sp, sp, -16 /* (local0) */            #  a90: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  a93: 0901
            movi         a0, sdk_g_phyFuns                     #  a95: 01fbff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  a98: 0800
            l32i         a0, a0, 200 /* [[sdk_g_phyFuns]+0xc8] */ #  a9a: 022032
            callx0       a0 /* [[sdk_g_phyFuns]+0xc8] */       #  a9d: c00000
            movi         a0, sdk_g_phyFuns                     #  aa0: 01faff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  aa3: 0800
            l32i         a0, a0, 196 /* [[sdk_g_phyFuns]+0xc4] */ #  aa5: 022031
            callx0       a0 /* [[sdk_g_phyFuns]+0xc4] */       #  aa8: c00000
            movi         a0, sdk_g_phyFuns                     #  aab: 01f8ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  aae: 0800
            l32i         a0, a0, 188 /* [[sdk_g_phyFuns]+0xbc] */ #  ab0: 02202f
            callx0       a0 /* [[sdk_g_phyFuns]+0xbc] */       #  ab3: c00000
            l32i         a0, sp, 0 /* [(local0)] */            #  ab6: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  ab8: 12c110
            ret                                                #  abb: 0df0

            .literal_position                                  #  ac0: 0100ffff
                                                               #  ac4: 00020060

# Function @ .irom0.text+0xac8
            .balign      4
            .global      sdk_rom_pbus_force_test
            .type        sdk_rom_pbus_force_test, @function
sdk_rom_pbus_force_test:
            slli         a9, a3, 14                            #  ac8: 209311
            movi         a10, 0xffff0001                       #  acb: a1fdff
            movi         a8, 2 /* 0x00000002 */                #  ace: 0c28
            slli         a7, a2, 2                             #  ad0: e07211
            or           a7, a7, a8                            #  ad3: 807720
            movi         a2, 0x60000200                        #  ad6: 21fbff
            slli         a8, a4, 5                             #  ad9: b08411
            memw                                               #  adc: c02000
            l32i         a6, a2, 0x394 /* [0x60000594] */      #  adf: 6222e5
            and          a6, a6, a10                           #  ae2: a06610
            or           a6, a6, a9                            #  ae5: 906620
            or           a6, a6, a8                            #  ae8: 806620
            or           a6, a6, a7                            #  aeb: 706620
            memw                                               #  aee: c02000
            s32i         a6, a2, 0x394 /* a6 -> [0x60000594] */ #  af1: 6262e5
            memw                                               #  af4: c02000
            l32i         a5, a2, 0x3a0 /* [0x600005a0] */      #  af7: 5222e8
            bgez         a5, .Lbr086                           #  afa: d68500
.Lbr085:    memw                                               #  afd: c02000
            l32i         a9, a2, 0x3a0 /* [0x600005a0] */      #  b00: 9222e8
            bltz         a9, .Lbr085                           #  b03: 9669ff
.Lbr086:    movi         a11, -3 /* 0xfffffffd */              #  b06: 7cdb
            memw                                               #  b08: c02000
            l32i         a10, a2, 0x394 /* [0x60000594] */     #  b0b: a222e5
            and          a10, a10, a11                         #  b0e: b0aa10
            memw                                               #  b11: c02000
            s32i         a10, a2, 0x394 /* a10 -> [0x60000594] */ #  b14: a262e5
            ret           /* 0x60000200 */                     #  b17: 0df0

            .literal_position                                  #  b1c: 00000000
                                                               #  b20: a4050060
                                                               #  b24: 00000000
                                                               #  b28: 00000000

# Function @ .irom0.text+0xb2c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_rom_pbus_rd
            .type        sdk_rom_pbus_rd, @function
sdk_rom_pbus_rd:
            addi         a4, a3, -4 /* arg1-0x4 */             #  b2c: 42c3fc
            addi         sp, sp, -16 /* (local0) */            #  b2f: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  b32: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  b34: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  b36: d921
            movi         a0, 2 /* 0x00000002 */                #  b38: 0c20
            movi         a13, .Ldata001                        #  b3a: d1f8ff
            addi         a12, a3, -1 /* arg1-0x1 */            #  b3d: 0bc3
            add          a13, a2, a13                          #  b3f: dad2
            l8ui         a13, a13, 0                           #  b41: d20d00
            moveqz       a12, a0, a4                           #  b44: 40c083
            add          a12, a12, a13                         #  b47: dacc
            extui        a12, a12, 0, 8                        #  b49: c0c074
            beqi         a12, 12, .Lbr087                      #  b4c: 26ac17
            mov          a2, a12                               #  b4f: 2d0c
            movi         a3, 3 /* 0x00000003 */                #  b51: 0c33
            call0        __umodsi3                             #  b53: 01f4ffc0
                                                               #  b57: 0000
            movi         a13, 18 /* 0x00000012 */              #  b59: 1c2d
            extui        a0, a2, 0, 8                          #  b5b: 200074
            addx8        a0, a0, a0                            #  b5e: 0000b0
            sub          a13, a13, a0                          #  b61: 00ddc0
            j            .Lbr088                               #  b64: 460000
.Lbr087:    movi         a13, 0 /* 0x00000000 */               #  b67: 0c0d
.Lbr088:    mov          a2, a12                               #  b69: 2d0c
            movi         a3, 3 /* 0x00000003 */                #  b6b: 0c33
            call0        __udivsi3                             #  b6d: 01eeffc0
                                                               #  b71: 0000
            extui        a2, a2, 0, 8                          #  b73: 202074
            movi         a3, 0x600005a4                        #  b76: 31eaff
            slli         a2, a2, 2                             #  b79: e02211
            add          a2, a2, a3                            #  b7c: 3a22
            memw                                               #  b7e: c02000
            l32i         a0, sp, 0 /* [(local0)] */            #  b81: 0801
            l32i         a12, sp, 4 /* [(local1)] */           #  b83: c811
            ssr          a13                                   #  b85: 000d40
            l32i         a2, a2, 0                             #  b88: 2802
            l32i         a13, sp, 8 /* [(local2)] */           #  b8a: d821
            srl          a2, a2                                #  b8c: 202091
            extui        a2, a2, 0, 9                          #  b8f: 202084
            addi         sp, sp, 16 /* (top of frame) */       #  b92: 12c110
            ret                                                #  b95: 0df0

            .literal_position                                  #  b98: 00000000

# Function @ .irom0.text+0xb9c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
            .global      sdk_rom_pbus_set_rxgain
            .type        sdk_rom_pbus_set_rxgain, @function
sdk_rom_pbus_set_rxgain:
            movi         a3, 2 /* 0x00000002 */                #  b9c: 0c23
            addi         sp, sp, -32 /* (local0) */            #  b9e: 12c1e0
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   #  ba1: c941
            s32i         a13, sp, 20 /* a13 -> [(local5)] */   #  ba3: d951
            movi         a13, sdk_g_phyFuns                    #  ba5: d1fcff
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     #  ba8: 0931
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  baa: 080d
            mov          a12, a2 /* arg0 */                    #  bac: cd02
            l32i         a0, a0, 176 /* [[sdk_g_phyFuns]+0xb0] */ #  bae: 02202c
            movi         a2, 3 /* 0x00000003 */                #  bb1: 0c32
            callx0       a0 /* [[sdk_g_phyFuns]+0xb0] */       #  bb3: c00000
            movi         a3, 1 /* 0x00000001 */                #  bb6: 0c13
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  bb8: 080d
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  bba: 2901
            l32i         a0, a0, 176 /* [[sdk_g_phyFuns]+0xb0] */ #  bbc: 02202c
            movi         a2, 2 /* 0x00000002 */                #  bbf: 0c22
            callx0       a0 /* [[sdk_g_phyFuns]+0xb0] */       #  bc1: c00000
            movi         a3, 1 /* 0x00000001 */                #  bc4: 0c13
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  bc6: 080d
            extui        a6, a12, 6, 1                         #  bc8: c06604
            extui        a7, a12, 7, 1                         #  bcb: c07704
            extui        a4, a12, 8, 1                         #  bce: c04804
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      #  bd1: 2911
            extui        a5, a12, 3, 1                         #  bd3: c05304
            movi         a2, 3 /* 0x00000003 */                #  bd6: 0c32
            slli         a5, a5, 6                             #  bd8: a05511
            slli         a4, a4, 1                             #  bdb: f04411
            slli         a7, a7, 2                             #  bde: e07711
            slli         a6, a6, 3                             #  be1: d06611
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  be4: 02202b
            or           a6, a6, a7                            #  be7: 706620
            s32i         a4, sp, 8 /* a4 -> [(local2)] */      #  bea: 4921
            extui        a7, a12, 4, 1                         #  bec: c07404
            slli         a7, a7, 5                             #  bef: b07711
            or           a5, a5, a7                            #  bf2: 705520
            extui        a7, a12, 5, 1                         #  bf5: c07504
            slli         a7, a7, 4                             #  bf8: c07711
            or           a5, a5, a7                            #  bfb: 705520
            or           a5, a5, a6                            #  bfe: 605520
            extui        a6, a12, 9, 1                         #  c01: c06904
            or           a4, a4, a6                            #  c04: 604420
            or           a4, a4, a5                            #  c07: 504420
            extui        a4, a4, 0, 16                         #  c0a: 4040f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  c0d: c00000
            movi         a2, 3 /* 0x00000003 */                #  c10: 0c32
            movi         a3, 2 /* 0x00000002 */                #  c12: 0c23
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  c14: 080d
            l32i         a4, sp, 0 /* [(local0)] */            #  c16: 4801
            movi         a5, 455 /* 0x000001c7 */              #  c18: 52a1c7
            and          a4, a4, a5                            #  c1b: 504410
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  c1e: 02202b
            extui        a5, a12, 0, 3                         #  c21: c05024
            slli         a5, a5, 3                             #  c24: d05511
            or           a4, a4, a5                            #  c27: 504420
            extui        a4, a4, 0, 16                         #  c2a: 4040f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  c2d: c00000
            movi         a2, 2 /* 0x00000002 */                #  c30: 0c22
            movi         a3, 1 /* 0x00000001 */                #  c32: 0c13
            l32i         a4, sp, 8 /* [(local2)] */            #  c34: 4821
            movi         a7, 389 /* 0x00000185 */              #  c36: 72a185
            l32i         a5, sp, 4 /* [(local1)] */            #  c39: 5811
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  c3b: 080d
            extui        a6, a12, 11, 4                        #  c3d: c06b34
            slli         a6, a6, 3                             #  c40: d06611
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  c43: 02202b
            and          a5, a5, a7                            #  c46: 705510
            or           a5, a5, a6                            #  c49: 605520
            or           a4, a4, a5                            #  c4c: 504420
            extui        a4, a4, 0, 16                         #  c4f: 4040f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  c52: c00000
            l32i         a12, sp, 16 /* [(local4)] */          #  c55: c841
            l32i         a13, sp, 20 /* [(local5)] */          #  c57: d851
            l32i         a0, sp, 12 /* [(local3)] */           #  c59: 0831
            addi         sp, sp, 32 /* (top of frame) */       #  c5b: 12c120
            ret                                                #  c5e: 0df0

            .literal_position                                  #  c60: 00000000

# Function @ .irom0.text+0xc64
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_rom_pbus_set_txgain
            .type        sdk_rom_pbus_set_txgain, @function
sdk_rom_pbus_set_txgain:
            movi         a3, 1 /* 0x00000001 */                #  c64: 0c13
            extui        a4, a2, 7, 2                          #  c66: 204714
            extui        a5, a2, 0, 5                          #  c69: 205044
            addi         sp, sp, -16 /* (local0) */            #  c6c: 12c1f0
            extui        a6, a2, 5, 2                          #  c6f: 206514
            slli         a6, a6, 2                             #  c72: e06611
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  c75: 0901
            slli         a5, a5, 4                             #  c77: c05511
            movi         a0, sdk_g_phyFuns                     #  c7a: 01f9ff
            movi         a2, 4 /* 0x00000004 */                #  c7d: 0c42
            or           a5, a5, a6                            #  c7f: 605520
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  c82: 0800
            or           a4, a4, a5                            #  c84: 504420
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  c87: 02202b
            extui        a4, a4, 0, 16                         #  c8a: 4040f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  c8d: c00000
            l32i         a0, sp, 0 /* [(local0)] */            #  c90: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  c92: 12c110
            ret                                                #  c95: 0df0

            .literal_position                                  #  c98: 009a0060
                                                               #  c9c: 00020060
                                                               #  ca0: fffffff7
                                                               #  ca4: 00000000

# Function @ .irom0.text+0xca8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_rom_pbus_workmode
            .type        sdk_rom_pbus_workmode, @function
sdk_rom_pbus_workmode:
            addi         sp, sp, -16 /* (local0) */            #  ca8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  cab: 0901
            movi         a7, -2 /* 0xfffffffe */               #  cad: 7ce7
            movi         a3, 0x60009a00                        #  caf: 31faff
            movi         a6, 0x60000200                        #  cb2: 61faff
            memw                                               #  cb5: c02000
            l32i         a5, a6, 0x394 /* [0x60000594] */      #  cb8: 5226e5
            and          a5, a5, a7                            #  cbb: 705510
            memw                                               #  cbe: c02000
            s32i         a5, a6, 0x394 /* a5 -> [0x60000594] */ #  cc1: 5266e5
            movi         a4, 0xf7ffffff                        #  cc4: 41f7ff
            memw                                               #  cc7: c02000
            l32i         a2, a3, 0x108 /* [0x60009b08] */      #  cca: 222342
            and          a2, a2, a4                            #  ccd: 402210
            memw                                               #  cd0: c02000
            movi         a0, sdk_g_phyFuns                     #  cd3: 01f4ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  cd6: 0800
            l32i         a0, a0, 120 /* [[sdk_g_phyFuns]+0x78] */ #  cd8: 02201e
            s32i         a2, a3, 0x108 /* a2 -> [0x60009b08] */ #  cdb: 226342
            callx0       a0 /* [[sdk_g_phyFuns]+0x78] */       #  cde: c00000
            l32i         a0, sp, 0 /* [(local0)] */            #  ce1: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  ce3: 12c110
            ret                                                #  ce6: 0df0

            .literal_position                                  #  ce8: 00000000
                                                               #  cec: 00000000
                                                               #  cf0: 00000000

# Function @ .irom0.text+0xcf4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_rom_pbus_xpd_rx_off
            .type        sdk_rom_pbus_xpd_rx_off, @function
sdk_rom_pbus_xpd_rx_off:
            movi         a3, 1 /* 0x00000001 */                #  cf4: 0c13
            movi         a4, 128 /* 0x00000080 */              #  cf6: 42a080
            addi         sp, sp, -16 /* (local0) */            #  cf9: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  cfc: 0901
            movi         a0, sdk_g_phyFuns                     #  cfe: 01faff
            add          a4, a2, a4 /* arg0+0x80 */            #  d01: 4a42
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  d03: 0800
            extui        a4, a4, 0, 16                         #  d05: 4040f4
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  d08: 02202b
            movi         a2, 2 /* 0x00000002 */                #  d0b: 0c22
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  d0d: c00000
            movi         a0, sdk_g_phyFuns                     #  d10: 01f7ff
            movi         a2, 3 /* 0x00000003 */                #  d13: 0c32
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  d15: 0800
            movi         a3, 1 /* 0x00000001 */                #  d17: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  d19: 02202b
            movi         a4, 0 /* 0x00000000 */                #  d1c: 0c04
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  d1e: c00000
            movi         a0, sdk_g_phyFuns                     #  d21: 01f3ff
            movi         a2, 3 /* 0x00000003 */                #  d24: 0c32
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  d26: 0800
            movi         a3, 2 /* 0x00000002 */                #  d28: 0c23
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  d2a: 02202b
            movi         a4, 0 /* 0x00000000 */                #  d2d: 0c04
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  d2f: c00000
            l32i         a0, sp, 0 /* [(local0)] */            #  d32: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  d34: 12c110
            ret                                                #  d37: 0df0

            .literal_position                                  #  d3c: 00000000
                                                               #  d40: 00000000

# Function @ .irom0.text+0xd44
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_rom_pbus_xpd_rx_on
            .type        sdk_rom_pbus_xpd_rx_on, @function
sdk_rom_pbus_xpd_rx_on:
            addi         sp, sp, -16 /* (local0) */            #  d44: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  d47: 0901
            movi         a0, sdk_g_phyFuns                     #  d49: 01fcff
            movi         a2, 2 /* 0x00000002 */                #  d4c: 0c22
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  d4e: 0800
            movi         a3, 1 /* 0x00000001 */                #  d50: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  d52: 02202b
            movi         a4, 388 /* 0x00000184 */              #  d55: 42a184
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  d58: c00000
            movi         a0, sdk_g_phyFuns                     #  d5b: 01f9ff
            movi         a2, 3 /* 0x00000003 */                #  d5e: 0c32
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  d60: 0800
            movi         a3, 2 /* 0x00000002 */                #  d62: 0c23
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  d64: 02202b
            movi         a4, 6 /* 0x00000006 */                #  d67: 0c64
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  d69: c00000
            l32i         a0, sp, 0 /* [(local0)] */            #  d6c: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  d6e: 12c110
            ret                                                #  d71: 0df0

            .literal_position                                  #  d74: 00000000
                                                               #  d78: 00000000
                                                               #  d7c: 00000000

# Function @ .irom0.text+0xd80
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_rom_pbus_xpd_tx_off
            .type        sdk_rom_pbus_xpd_tx_off, @function
sdk_rom_pbus_xpd_tx_off:
            addi         sp, sp, -16 /* (local0) */            #  d80: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  d83: 0901
            movi         a0, sdk_g_phyFuns                     #  d85: 01fbff
            movi         a2, 6 /* 0x00000006 */                #  d88: 0c62
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  d8a: 0800
            movi         a3, 1 /* 0x00000001 */                #  d8c: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  d8e: 02202b
            movi         a4, 0 /* 0x00000000 */                #  d91: 0c04
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  d93: c00000
            movi         a0, sdk_g_phyFuns                     #  d96: 01f8ff
            movi         a2, 1 /* 0x00000001 */                #  d99: 0c12
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  d9b: 0800
            movi         a3, 1 /* 0x00000001 */                #  d9d: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  d9f: 02202b
            movi         a4, 12 /* 0x0000000c */               #  da2: 0cc4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  da4: c00000
            movi         a0, sdk_g_phyFuns                     #  da7: 01f5ff
            movi         a2, 2 /* 0x00000002 */                #  daa: 0c22
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  dac: 0800
            movi         a3, 1 /* 0x00000001 */                #  dae: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  db0: 02202b
            movi         a4, 128 /* 0x00000080 */              #  db3: 42a080
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  db6: c00000
            l32i         a0, sp, 0 /* [(local0)] */            #  db9: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  dbb: 12c110
            ret                                                #  dbe: 0df0

            .literal_position                                  #  dc0: 00000000

# Function @ .irom0.text+0xdc4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_rom_pbus_xpd_tx_on
            .type        sdk_rom_pbus_xpd_tx_on, @function
sdk_rom_pbus_xpd_tx_on:
            movi         a3, 1 /* 0x00000001 */                #  dc4: 0c13
            movi         a4, 129 /* 0x00000081 */              #  dc6: 42a081
            addi         sp, sp, -16 /* (local0) */            #  dc9: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  dcc: c921
            movi         a12, sdk_g_phyFuns                    #  dce: c1fcff
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  dd1: 0911
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  dd3: 080c
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  dd5: 2901
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  dd7: 02202b
            movi         a2, 2 /* 0x00000002 */                #  dda: 0c22
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  ddc: c00000
            movi         a2, 7 /* 0x00000007 */                #  ddf: 0c72
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  de1: 080c
            movi         a3, 1 /* 0x00000001 */                #  de3: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  de5: 02202b
            movi         a4, 95 /* 0x0000005f */               #  de8: 5cf4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  dea: c00000
            l32i         a4, sp, 0 /* [(local0)] */            #  ded: 4801
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  def: 080c
            movi         a2, 0 /* 0x00000000 */                #  df1: 0c02
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  df3: 02202b
            movi         a3, 1 /* 0x00000001 */                #  df6: 0c13
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  df8: c00000
            movi         a2, 1 /* 0x00000001 */                #  dfb: 0c12
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  dfd: 080c
            movi         a3, 1 /* 0x00000001 */                #  dff: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  e01: 02202b
            movi         a4, 127 /* 0x0000007f */              #  e04: 42a07f
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  e07: c00000
            movi         a2, 6 /* 0x00000006 */                #  e0a: 0c62
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e0c: 080c
            movi         a3, 1 /* 0x00000001 */                #  e0e: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  e10: 02202b
            movi         a4, 127 /* 0x0000007f */              #  e13: 42a07f
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  e16: c00000
            l32i         a12, sp, 8 /* [(local2)] */           #  e19: c821
            l32i         a0, sp, 4 /* [(local1)] */            #  e1b: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  e1d: 12c110
            ret                                                #  e20: 0df0

            .literal_position                                  #  e24: 00000000

# Function @ .irom0.text+0xe28
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_rom_pbus_xpd_tx_on__low_gain
            .type        sdk_rom_pbus_xpd_tx_on__low_gain, @function
sdk_rom_pbus_xpd_tx_on__low_gain:
            movi         a3, 1 /* 0x00000001 */                #  e28: 0c13
            movi         a4, 129 /* 0x00000081 */              #  e2a: 42a081
            addi         sp, sp, -16 /* (local0) */            #  e2d: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  e30: c921
            movi         a12, sdk_g_phyFuns                    #  e32: c1fcff
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  e35: 0911
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e37: 080c
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  e39: 2901
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  e3b: 02202b
            movi         a2, 2 /* 0x00000002 */                #  e3e: 0c22
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  e40: c00000
            movi         a2, 7 /* 0x00000007 */                #  e43: 0c72
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e45: 080c
            movi         a3, 1 /* 0x00000001 */                #  e47: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  e49: 02202b
            movi         a4, 0 /* 0x00000000 */                #  e4c: 0c04
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  e4e: c00000
            l32i         a4, sp, 0 /* [(local0)] */            #  e51: 4801
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e53: 080c
            movi         a2, 0 /* 0x00000000 */                #  e55: 0c02
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  e57: 02202b
            movi         a3, 1 /* 0x00000001 */                #  e5a: 0c13
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  e5c: c00000
            movi         a2, 1 /* 0x00000001 */                #  e5f: 0c12
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e61: 080c
            movi         a3, 1 /* 0x00000001 */                #  e63: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  e65: 02202b
            movi         a4, 127 /* 0x0000007f */              #  e68: 42a07f
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  e6b: c00000
            movi         a2, 6 /* 0x00000006 */                #  e6e: 0c62
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e70: 080c
            movi         a3, 1 /* 0x00000001 */                #  e72: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  e74: 02202b
            movi         a4, 127 /* 0x0000007f */              #  e77: 42a07f
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  e7a: c00000
            l32i         a12, sp, 8 /* [(local2)] */           #  e7d: c821
            l32i         a0, sp, 4 /* [(local1)] */            #  e7f: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  e81: 12c110
            ret                                                #  e84: 0df0

            .literal_position                                  #  e88: ffffffc3
                                                               #  e8c: 00060060

# Function @ .irom0.text+0xe90
            .balign      4
            .global      sdk_rom_phy_reset_req
            .type        sdk_rom_phy_reset_req, @function
sdk_rom_phy_reset_req:
            movi         a4, 0xc3ffffff                        #  e90: 41feff
            movi         a3, 0x60000600                        #  e93: 31feff
            memw                                               #  e96: c02000
            l32i         a2, a3, 0x110 /* [0x60000710] */      #  e99: 222344
            and          a2, a2, a4                            #  e9c: 402210
            memw                                               #  e9f: c02000
            s32i         a2, a3, 0x110 /* a2 -> [0x60000710] */ #  ea2: 226344
            ret                                                #  ea5: 0df0

            .literal_position                                  #  ea8: 00000000
                                                               #  eac: 00000000
                                                               #  eb0: 00000000

# Function @ .irom0.text+0xeb4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_rom_restart_cal
            .type        sdk_rom_restart_cal, @function
sdk_rom_restart_cal:
            movi         a2, 98 /* 0x00000062 */               #  eb4: 22a062
            addi         sp, sp, -16 /* (local0) */            #  eb7: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  eba: 0901
            movi         a0, sdk_g_phyFuns                     #  ebc: 01fbff
            movi         a3, 1 /* 0x00000001 */                #  ebf: 0c13
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  ec1: 0800
            movi         a4, 0 /* 0x00000000 */                #  ec3: 0c04
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  ec5: 022026
            movi         a5, 95 /* 0x0000005f */               #  ec8: 5cf5
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  eca: c00000
            movi         a2, 98 /* 0x00000062 */               #  ecd: 22a062
            movi         a0, sdk_g_phyFuns                     #  ed0: 01f7ff
            movi         a3, 1 /* 0x00000001 */                #  ed3: 0c13
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  ed5: 0800
            movi         a4, 0 /* 0x00000000 */                #  ed7: 0c04
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  ed9: 022026
            movi         a5, 127 /* 0x0000007f */              #  edc: 52a07f
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  edf: c00000
            movi         a2, 98 /* 0x00000062 */               #  ee2: 22a062
            movi         a0, sdk_g_phyFuns                     #  ee5: 01f2ff
            movi         a3, 1 /* 0x00000001 */                #  ee8: 0c13
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  eea: 0800
            movi         a4, 0 /* 0x00000000 */                #  eec: 0c04
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  eee: 022026
            movi         a5, 63 /* 0x0000003f */               #  ef1: 3cf5
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  ef3: c00000
            l32i         a0, sp, 0 /* [(local0)] */            #  ef6: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  ef8: 12c110
            ret                                                #  efb: 0df0

            .literal_position                                  #  f00: 00000000

# Function @ .irom0.text+0xf04
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_rom_rfpll_reset
            .type        sdk_rom_rfpll_reset, @function
sdk_rom_rfpll_reset:
            movi         a2, 98 /* 0x00000062 */               #  f04: 22a062
            movi         a3, 1 /* 0x00000001 */                #  f07: 0c13
            addi         sp, sp, -16 /* (local0) */            #  f09: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  f0c: c911
            movi         a12, sdk_g_phyFuns                    #  f0e: c1fcff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  f11: 0901
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  f13: 080c
            movi         a4, 10 /* 0x0000000a */               #  f15: 0ca4
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  f17: 022026
            movi         a5, 166 /* 0x000000a6 */              #  f1a: 52a0a6
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  f1d: c00000
            movi         a2, 98 /* 0x00000062 */               #  f20: 22a062
            movi         a3, 1 /* 0x00000001 */                #  f23: 0c13
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  f25: 080c
            movi         a4, 10 /* 0x0000000a */               #  f27: 0ca4
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  f29: 022026
            movi         a5, 167 /* 0x000000a7 */              #  f2c: 52a0a7
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  f2f: c00000
            movi         a2, 98 /* 0x00000062 */               #  f32: 22a062
            movi         a3, 1 /* 0x00000001 */                #  f35: 0c13
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  f37: 080c
            movi         a4, 10 /* 0x0000000a */               #  f39: 0ca4
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  f3b: 022026
            movi         a5, 165 /* 0x000000a5 */              #  f3e: 52a0a5
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  f41: c00000
            movi         a2, 99 /* 0x00000063 */               #  f44: 22a063
            movi         a3, 0 /* 0x00000000 */                #  f47: 0c03
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  f49: 080c
            movi         a4, 1 /* 0x00000001 */                #  f4b: 0c14
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  f4d: 022026
            movi         a5, 243 /* 0x000000f3 */              #  f50: 52a0f3
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  f53: c00000
            movi         a2, 98 /* 0x00000062 */               #  f56: 22a062
            movi         a3, 1 /* 0x00000001 */                #  f59: 0c13
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  f5b: 080c
            movi         a4, 11 /* 0x0000000b */               #  f5d: 0cb4
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  f5f: 022026
            movi         a5, 192 /* 0x000000c0 */              #  f62: 52a0c0
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  f65: c00000
            l32i         a12, sp, 4 /* [(local1)] */           #  f68: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  f6a: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  f6c: 12c110
            ret                                                #  f6f: 0df0

            .literal_position                                  #  f74: 00000000

# Function @ .irom0.text+0xf78
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_rom_write_rfpll_sdm
            .type        sdk_rom_write_rfpll_sdm, @function
sdk_rom_write_rfpll_sdm:
            movi         a3, 0 /* 0x00000000 */                #  f78: 0c03
            movi         a4, 0 /* 0x00000000 */                #  f7a: 0c04
            movi         a5, 7 /* 0x00000007 */                #  f7c: 0c75
            addi         sp, sp, -16 /* (local0) */            #  f7e: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  f81: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  f83: d921
            movi         a13, sdk_g_phyFuns                    #  f85: d1fbff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  f88: 0901
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  f8a: 080d
            mov          a12, a2 /* arg0 */                    #  f8c: cd02
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  f8e: 022026
            movi         a2, 99 /* 0x00000063 */               #  f91: 22a063
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  f94: c00000
            movi         a2, 99 /* 0x00000063 */               #  f97: 22a063
            movi         a3, 0 /* 0x00000000 */                #  f9a: 0c03
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  f9c: 080d
            movi         a4, 3 /* 0x00000003 */                #  f9e: 0c34
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  fa0: 022026
            l8ui         a5, a12, 0 /* [arg0] */               #  fa3: 520c00
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  fa6: c00000
            movi         a2, 99 /* 0x00000063 */               #  fa9: 22a063
            movi         a3, 0 /* 0x00000000 */                #  fac: 0c03
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  fae: 080d
            movi         a4, 4 /* 0x00000004 */                #  fb0: 0c44
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  fb2: 022026
            l8ui         a5, a12, 1 /* [arg0+0x1] */           #  fb5: 520c01
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  fb8: c00000
            l8ui         a5, a12, 2 /* [arg0+0x2] */           #  fbb: 520c02
            movi         a2, 99 /* 0x00000063 */               #  fbe: 22a063
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  fc1: 080d
            movi         a3, 0 /* 0x00000000 */                #  fc3: 0c03
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  fc5: 022026
            movi         a4, 5 /* 0x00000005 */                #  fc8: 0c54
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  fca: c00000
            movi         a2, 99 /* 0x00000063 */               #  fcd: 22a063
            movi         a3, 0 /* 0x00000000 */                #  fd0: 0c03
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      #  fd2: 080d
            movi         a4, 0 /* 0x00000000 */                #  fd4: 0c04
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ #  fd6: 022026
            movi         a5, 23 /* 0x00000017 */               #  fd9: 1c75
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       #  fdb: c00000
            l32i         a12, sp, 4 /* [(local1)] */           #  fde: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  fe0: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  fe2: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  fe4: 12c110
            ret                                                #  fe7: 0df0

            .literal_position                                  #  fec: 000040c0
                                                               #  ff0: 00000840
                                                               #  ff4: 0000da40
                                                               #  ff8: 0000e440
                                                               #  ffc: 00008043
                                                               # 1000: 00000000
                                                               # 1004: 00000000
                                                               # 1008: 00000000
                                                               # 100c: 00000000
                                                               # 1010: 00000000
                                                               # 1014: 00000000
                                                               # 1018: 00000000
                                                               # 101c: 00000000
                                                               # 1020: 00000000
                                                               # 1024: 00000000
                                                               # 1028: 00000000
                                                               # 102c: 00000000
                                                               # 1030: 00000000
                                                               # 1034: 00000000
                                                               # 1038: 00000000
                                                               # 103c: 00000000
                                                               # 1040: 00000000
                                                               # 1044: 00000000
                                                               # 1048: 00000000

# Function @ .irom0.text+0x104c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      sdk_rom_rfpll_set_freq
            .type        sdk_rom_rfpll_set_freq, @function
sdk_rom_rfpll_set_freq:
            addi         sp, sp, -32 /* (local0) */            # 104c: 12c1e0
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    # 104f: 3901
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 1051: 0911
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   # 1053: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 1055: c921
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   # 1057: e941
            mov          a12, a5 /* arg3 */                    # 1059: cd05
            movi         a14, 0xc0400000                       # 105b: e1e4ff
            movi         a13, 0 /* 0x00000000 */               # 105e: 0c0d
            slli         a0, a2, 10                            # 1060: 600211
            add          a0, a4, a0                            # 1063: 0a04
            slli         a2, a0, 2                             # 1065: e02011
            call0        __floatunsidf                         # 1068: 01e6ffc0
                                                               # 106c: 0000
            movi         a5, 0x40080000                        # 106e: 51e0ff
            movi         a4, 0 /* 0x00000000 */                # 1071: 0c04
            call0        __divdf3                              # 1073: 01e4ffc0
                                                               # 1077: 0000
            call0        __truncdfsf2                          # 1079: 01e3ffc0
                                                               # 107d: 0000
            call0        __extendsfdf2                         # 107f: 01e3ffc0
                                                               # 1083: 0000
            l32i         a4, sp, 0 /* [(local0)] */            # 1085: 4801
            beqz         a4, .Lbr089                           # 1087: 9ce4
            movi         a5, 0x40da0000                        # 1089: 51daff
            movi         a4, 0 /* 0x00000000 */                # 108c: 0c04
            call0        __divdf3                              # 108e: 01e0ffc0
                                                               # 1092: 0000
            mov          a4, a13 /* 0x00000000 */              # 1094: 4d0d
            mov          a5, a14 /* 0xc0400000 */              # 1096: 5d0e
            call0        __adddf3                              # 1098: 01dfffc0
                                                               # 109c: 0000
            call0        __truncdfsf2                          # 109e: 01deffc0
                                                               # 10a2: 0000
            mov          a14, a2                               # 10a4: ed02
            j            .Lbr090                               # 10a6: 060700
.Lbr089:    movi         a5, 0x40e40000                        # 10a9: 51d3ff
            movi         a4, 0 /* 0x00000000 */                # 10ac: 0c04
            call0        __divdf3                              # 10ae: 01dbffc0
                                                               # 10b2: 0000
            mov          a4, a13 /* 0x00000000 */              # 10b4: 4d0d
            mov          a5, a14 /* 0xc0400000 */              # 10b6: 5d0e
            call0        __adddf3                              # 10b8: 01daffc0
                                                               # 10bc: 0000
            call0        __truncdfsf2                          # 10be: 01d9ffc0
                                                               # 10c2: 0000
            mov          a14, a2                               # 10c4: ed02
.Lbr090:    movi         a13, 0x43800000                       # 10c6: d1cdff
            mov          a2, a14                               # 10c9: 2d0e
            call0        __fixunssfsi                          # 10cb: 01d7ffc0
                                                               # 10cf: 0000
            s8i          a2, a12, 0 /* a2 -> [arg3] */         # 10d1: 224c00
            extui        a2, a2, 0, 8                          # 10d4: 202074
            call0        __floatsisf                           # 10d7: 01d5ffc0
                                                               # 10db: 0000
            mov          a3, a2                                # 10dd: 3d02
            mov          a2, a14                               # 10df: 2d0e
            call0        __subsf3                              # 10e1: 01d3ffc0
                                                               # 10e5: 0000
            mov          a3, a13 /* 0x43800000 */              # 10e7: 3d0d
            call0        __mulsf3                              # 10e9: 01d2ffc0
                                                               # 10ed: 0000
            mov          a14, a2                               # 10ef: ed02
            call0        __fixunssfsi                          # 10f1: 01d1ffc0
                                                               # 10f5: 0000
            s8i          a2, a12, 1 /* a2 -> [arg3+0x1] */     # 10f7: 224c01
            extui        a2, a2, 0, 8                          # 10fa: 202074
            call0        __floatsisf                           # 10fd: 01cfffc0
                                                               # 1101: 0000
            mov          a3, a2                                # 1103: 3d02
            mov          a2, a14                               # 1105: 2d0e
            call0        __subsf3                              # 1107: 01ceffc0
                                                               # 110b: 0000
            mov          a3, a13 /* 0x43800000 */              # 110d: 3d0d
            call0        __mulsf3                              # 110f: 01cdffc0
                                                               # 1113: 0000
            call0        __fixunssfsi                          # 1115: 01ccffc0
                                                               # 1119: 0000
            l32i         a0, sp, 4 /* [(local1)] */            # 111b: 0811
            l32i         a13, sp, 12 /* [(local3)] */          # 111d: d831
            s8i          a2, a12, 2 /* a2 -> [arg3+0x2] */     # 111f: 224c02
            l32i         a14, sp, 16 /* [(local4)] */          # 1122: e841
            l32i         a12, sp, 8 /* [(local2)] */           # 1124: c821
            addi         sp, sp, 32 /* (top of frame) */       # 1126: 12c120
            ret                                                # 1129: 0df0

            .section     .rodata, "a", @progbits

.Ldata001:  .byte        0x00, 0x02, 0x04, 0x05, 0x07, 0x09, 0x0b, 0x0c
            .byte        0x00, 0x00, 0x80, 0x43

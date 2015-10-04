
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000

# Function @ .irom0.text+0x8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc001:  movi         a4, -35 /* 0xffffffdd */              #    8: 42afdd
            movi         a5, 0 /* 0x00000000 */                #    b: 0c05
            addi         sp, sp, -16 /* (local0) */            #    d: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #   10: d921
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   12: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   14: c911
            movi         a0, 80 /* 0x00000050 */               #   16: 5c00
            mov          a12, a3 /* arg1 */                    #   18: cd03
            s8i          a5, a3, 7 /* 0x00 -> [arg1+0x7] */    #   1a: 524307
            s8i          a5, a3, 2 /* 0x00 -> [arg1+0x2] */    #   1d: 524302
            mov          a13, a2 /* arg0 */                    #   20: dd02
            s8i          a4, a3, 0 /* 0xdd -> [arg1] */        #   22: 424300
            movi         a2, 1 /* 0x00000001 */                #   25: 0c12
            s8i          a2, a3, 6 /* 0x01 -> [arg1+0x6] */    #   27: 224306
            s8i          a2, a3, 5 /* 0x01 -> [arg1+0x5] */    #   2a: 224305
            movi         a3, -14 /* 0xfffffff2 */              #   2d: 7c23
            s8i          a0, a12, 3 /* 0x50 -> [arg1+0x3] */   #   2f: 024c03
            s8i          a3, a12, 4 /* 0xf2 -> [arg1+0x4] */   #   32: 324c04
            l32i         a3, a13, 12 /* [arg0+0xc] */          #   35: 383d
            call0        sdk_wpa_cipher_to_suite               #   37: 01f2ffc0
                                                               #   3b: 0000
            beqz         a2, .Lbr005                           #   3d: 169208
            s8i          a2, a12, 11 /* a2 -> [arg1+0xb] */    #   40: 224c0b
            extui        a6, a2, 24, 8                         #   43: 206875
            extui        a7, a2, 16, 16                        #   46: 2070f5
            srli         a8, a2, 8                             #   49: 208841
            s8i          a8, a12, 10 /* a8 -> [arg1+0xa] */    #   4c: 824c0a
            s8i          a7, a12, 9 /* a7 -> [arg1+0x9] */     #   4f: 724c09
            s8i          a6, a12, 8 /* a6 -> [arg1+0x8] */     #   52: 624c08
            addi         a2, a12, 14 /* arg1+0xe */            #   55: eb2c
            l32i         a3, a13, 8 /* [arg0+0x8] */           #   57: 382d
            call0        sdk_wpa_cipher_put_suites             #   59: 01eaffc0
                                                               #   5d: 0000
            movi         a0, 80 /* 0x00000050 */               #   5f: 5c00
            movi         a3, -14 /* 0xfffffff2 */              #   61: 7c23
            movi         a5, 0 /* 0x00000000 */                #   63: 0c05
            beqz         a2, .Lbr005                           #   65: 161206
            s8i          a2, a12, 12 /* a2 -> [arg1+0xc] */    #   68: 224c0c
            srli         a9, a2, 8                             #   6b: 209841
            addx4        a8, a2, a12                           #   6e: c082a0
            addi         a6, a8, 16                            #   71: 62c810
            s8i          a9, a12, 13 /* a9 -> [arg1+0xd] */    #   74: 924c0d
            l32i         a7, a13, 4 /* [arg0+0x4] */           #   77: 781d
            movi         a9, 2 /* 0x00000002 */                #   79: 0c29
            bbci         a7, 0, .Lbr001                        #   7b: 076717
            movi         a2, 1 /* 0x00000001 */                #   7e: 0c12
            addi         a6, a8, 20                            #   80: 62c814
            s8i          a3, a8, 18                            #   83: 324812
            s8i          a0, a8, 17                            #   86: 024811
            s8i          a5, a8, 16                            #   89: 524810
            movi         a10, 1 /* 0x00000001 */               #   8c: 0c1a
            s8i          a10, a8, 19                           #   8e: a24813
            l32i         a7, a13, 4 /* [arg0+0x4] */           #   91: 781d
            j            .Lbr002                               #   93: 460000
.Lbr001:    movi         a2, 0 /* 0x00000000 */                #   96: 0c02
.Lbr002:    bbci         a7, 1, .Lbr003                        #   98: 17670f
            addi         a2, a2, 1                             #   9b: 1b22
            s8i          a5, a6, 0                             #   9d: 524600
            s8i          a0, a6, 1                             #   a0: 024601
            s8i          a3, a6, 2                             #   a3: 324602
            s8i          a9, a6, 3                             #   a6: 924603
            addi         a6, a6, 4                             #   a9: 4b66
.Lbr003:    beqz         a2, .Lbr005                           #   ab: 9cb2
            s8i          a2, a8, 14                            #   ad: 22480e
            srli         a13, a2, 8                            #   b0: 20d841
            s8i          a13, a8, 15                           #   b3: d2480f
            sub          a2, a6, a12                           #   b6: c026c0
            addi         a11, a2, -2                           #   b9: b2c2fe
            s8i          a11, a12, 1 /* a11 -> [arg1+0x1] */   #   bc: b24c01
.Lbr004:    l32i         a12, sp, 4 /* [(local1)] */           #   bf: c811
            l32i         a13, sp, 8 /* [(local2)] */           #   c1: d821
            l32i         a0, sp, 0 /* [(local0)] */            #   c3: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   c5: 12c110
            ret                                                #   c8: 0df0
.Lbr005:    movi         a2, -1 /* 0xffffffff */               #   ca: 7cf2
            j            .Lbr004                               #   cc: c6fbff

            .literal_position                                  #   d0: 00000000
                                                               #   d4: 00000000
                                                               #   d8: 00000000

# Function @ .irom0.text+0xdc
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wpa_write_rsn_ie
            .type        sdk_wpa_write_rsn_ie, @function
sdk_wpa_write_rsn_ie:
            addi         sp, sp, -32 /* (local0) */            #   dc: 12c1e0
            s32i         a4, sp, 0 /* arg2 -> [(local0)] */    #   df: 4901
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #   e1: c921
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #   e3: d931
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #   e5: e941
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   e7: 0911
            mov          a14, a5 /* arg3 */                    #   e9: ed05
            movi         a0, 0 /* 0x00000000 */                #   eb: 0c00
            mov          a13, a3 /* arg1 */                    #   ed: dd03
            mov          a12, a2 /* arg0 */                    #   ef: cd02
            movi         a3, 48 /* 0x00000030 */               #   f1: 3c03
            movi         a2, 1 /* 0x00000001 */                #   f3: 0c12
            s8i          a0, a13, 3 /* 0x00 -> [arg1+0x3] */   #   f5: 024d03
            s8i          a2, a13, 2 /* 0x01 -> [arg1+0x2] */   #   f8: 224d02
            s8i          a3, a13, 0 /* 0x30 -> [arg1] */       #   fb: 324d00
            movi         a2, 2 /* 0x00000002 */                #   fe: 0c22
            l32i         a3, a12, 12 /* [arg0+0xc] */          #  100: 383c
            call0        sdk_wpa_cipher_to_suite               #  102: 01f3ffc0
                                                               #  106: 0000
            beqz         a2, .Lbr011                           #  108: 16520d
            s8i          a2, a13, 7 /* a2 -> [arg1+0x7] */     #  10b: 224d07
            extui        a4, a2, 24, 8                         #  10e: 204875
            extui        a5, a2, 16, 16                        #  111: 2050f5
            srli         a6, a2, 8                             #  114: 206841
            s8i          a6, a13, 6 /* a6 -> [arg1+0x6] */     #  117: 624d06
            s8i          a5, a13, 5 /* a5 -> [arg1+0x5] */     #  11a: 524d05
            s8i          a4, a13, 4 /* a4 -> [arg1+0x4] */     #  11d: 424d04
            addi         a2, a13, 10 /* arg1+0xa */            #  120: ab2d
            l32i         a3, a12, 32 /* [arg0+0x20] */         #  122: 388c
            call0        sdk_rsn_cipher_put_suites             #  124: 01ecffc0
                                                               #  128: 0000
            movi         a0, 0 /* 0x00000000 */                #  12a: 0c00
            movi         a10, 1 /* 0x00000001 */               #  12c: 0c1a
            beqz         a2, .Lbr011                           #  12e: 16f20a
            movi         a8, -84 /* 0xffffffac */              #  131: 82afac
            movi         a9, 15 /* 0x0000000f */               #  134: 0cf9
            movi         a11, 2 /* 0x00000002 */               #  136: 0c2b
            addx4        a5, a2, a13                           #  138: d052a0
            s8i          a2, a13, 8 /* a2 -> [arg1+0x8] */     #  13b: 224d08
            srli         a7, a2, 8                             #  13e: 207841
            s8i          a7, a13, 9 /* a7 -> [arg1+0x9] */     #  141: 724d09
            l32i         a7, a12, 4 /* [arg0+0x4] */           #  144: 781c
            addi         a2, a5, 12                            #  146: cb25
            bbci         a7, 0, .Lbr006                        #  148: 076715
            movi         a3, 1 /* 0x00000001 */                #  14b: 0c13
            addi         a2, a5, 16                            #  14d: 22c510
            s8i          a0, a5, 12                            #  150: 02450c
            s8i          a9, a5, 13                            #  153: 92450d
            s8i          a8, a5, 14                            #  156: 82450e
            s8i          a10, a5, 15                           #  159: a2450f
            l32i         a7, a12, 4 /* [arg0+0x4] */           #  15c: 781c
            j            .Lbr007                               #  15e: 460000
.Lbr006:    movi         a3, 0 /* 0x00000000 */                #  161: 0c03
.Lbr007:    bbci         a7, 1, .Lbr008                        #  163: 17670f
            addi         a3, a3, 1                             #  166: 1b33
            s8i          a9, a2, 1                             #  168: 924201
            s8i          a8, a2, 2                             #  16b: 824202
            s8i          a11, a2, 3                            #  16e: b24203
            s8i          a0, a2, 0                             #  171: 024200
            addi         a2, a2, 4                             #  174: 4b22
.Lbr008:    beqz         a3, .Lbr011                           #  176: 167306
            movi         a9, 12 /* 0x0000000c */               #  179: 0cc9
            movi         a4, 0 /* 0x00000000 */                #  17b: 0c04
            movi         a8, 1 /* 0x00000001 */                #  17d: 0c18
            s8i          a3, a5, 10                            #  17f: 32450a
            srli         a7, a3, 8                             #  182: 307841
            s8i          a7, a5, 11                            #  185: 72450b
            l32i         a6, a12, 36 /* [arg0+0x24] */         #  188: 689c
            movi         a11, 512 /* 0x00000200 */             #  18a: b2a200
            moveqz       a8, a4, a6                            #  18d: 608483
            l32i         a4, a12, 44 /* [arg0+0x2c] */         #  190: 48bc
            or           a11, a8, a11                          #  192: b0b820
            movnez       a8, a11, a4                           #  195: 408b93
            l32i         a11, a12, 48 /* [arg0+0x30] */        #  198: b8cc
            or           a9, a8, a9                            #  19a: 909820
            movnez       a8, a9, a11                           #  19d: b08993
            s8i          a8, a2, 0                             #  1a0: 824200
            srli         a8, a8, 8                             #  1a3: 808841
            s8i          a8, a2, 1                             #  1a6: 824201
            addi         a2, a2, 2                             #  1a9: 2b22
            beqz         a14, .Lbr009                          #  1ab: 9cce
            l32i         a8, sp, 0 /* [(local0)] */            #  1ad: 8801
            addi         a12, a2, 18                           #  1af: c2c212
            add          a8, a13, a8                           #  1b2: 8a8d
            bltu         a8, a12, .Lbr011                      #  1b4: c73829
            mov          a3, a14 /* arg3 */                    #  1b7: 3d0e
            s8i          a0, a2, 1                             #  1b9: 024201
            s8i          a10, a2, 0                            #  1bc: a24200
            movi         a4, 16 /* 0x00000010 */               #  1bf: 1c04
            addi         a2, a2, 2                             #  1c1: 2b22
            call0        memcpy                                #  1c3: 01c5ffc0
                                                               #  1c7: 0000
            mov          a2, a12                               #  1c9: 2d0c
.Lbr009:    sub          a2, a2, a13                           #  1cb: d022c0
            addi         a9, a2, -2                            #  1ce: 92c2fe
            s8i          a9, a13, 1 /* a9 -> [arg1+0x1] */     #  1d1: 924d01
.Lbr010:    l32i         a12, sp, 8 /* [(local2)] */           #  1d4: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  1d6: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  1d8: e841
            l32i         a0, sp, 4 /* [(local1)] */            #  1da: 0811
            addi         sp, sp, 32 /* (top of frame) */       #  1dc: 12c120
            ret                                                #  1df: 0df0
.Lbr011:    movi         a2, -1 /* 0xffffffff */               #  1e1: 7cf2
            j            .Lbr010                               #  1e3: 46fbff

            .literal_position                                  #  1e8: 00000000
                                                               #  1ec: 00000000
                                                               #  1f0: 00000000

# Function @ .irom0.text+0x1f4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_wpa_auth_gen_wpa_ie
            .type        sdk_wpa_auth_gen_wpa_ie, @function
sdk_wpa_auth_gen_wpa_ie:
            movi         a3, 144 /* 0x00000090 */              #  1f4: 32a090
            sub          sp, sp, a3 /* (FP)-0x90 */            #  1f7: 3011c0
            s32i         a12, sp, 132 /* a12 -> [(local1)] */  #  1fa: c26121
            s32i         a0, sp, 128 /* a0 -> [(local0)] */    #  1fd: 026120
            mov          a12, a2 /* arg0 */                    #  200: cd02
            l32i         a2, a2, 4 /* [arg0+0x4] */            #  202: 2812
            s32i         a13, sp, 136 /* a13 -> [(local2)] */  #  204: d26122
            bbci         a2, 1, .Lbr012                        #  207: 176215
            addi         a2, a12, 4 /* arg0+0x4 */             #  20a: 4b2c
            mov          a3, sp /* (FP)-0x90 */                #  20c: 3d01
            movi         a4, 128 /* 0x00000080 */              #  20e: 42a080
            movi         a5, 0 /* 0x00000000 */                #  211: 0c05
            call0        sdk_wpa_write_rsn_ie                  #  213: 050000
            bltz         a2, .Lbr016                           #  216: 96c204
            add          a13, a2, sp                           #  219: 1ad2
            l32i         a2, a12, 4 /* [arg0+0x4] */           #  21b: 281c
            j            .Lbr013                               #  21d: 460000
.Lbr012:    mov          a13, sp /* (FP)-0x90 */               #  220: dd01
.Lbr013:    bbci         a2, 0, .Lbr014                        #  222: 076213
            addi         a2, a12, 4 /* arg0+0x4 */             #  225: 4b2c
            mov          a3, a13                               #  227: 3d0d
            movi         a5, 128 /* 0x00000080 */              #  229: 52a080
            sub          a4, sp, a13                           #  22c: d041c0
            add          a4, a4, a5                            #  22f: 5a44
            call0        .Lfunc001                             #  231: 45ddff
            bltz         a2, .Lbr016                           #  234: 96e202
            add          a13, a2, a13                          #  237: dad2
.Lbr014:    l32i         a2, a12, 80 /* [arg0+0x50] */         #  239: 222c14
            call0        free                                  #  23c: 01ebffc0
                                                               #  240: 0000
            sub          a13, a13, sp                          #  242: 10ddc0
            mov          a2, a13                               #  245: 2d0d
            call0        malloc                                #  247: 01e9ffc0
                                                               #  24b: 0000
            s32i         a2, a12, 80 /* a2 -> [arg0+0x50] */   #  24d: 226c14
            bnez         a2, .Lbr015                           #  250: cc32
            movi         a2, -1 /* 0xffffffff */               #  252: 7cf2
            j            .Lbr016                               #  254: 860300
.Lbr015:    mov          a3, sp /* (FP)-0x90 */                #  257: 3d01
            mov          a4, a13                               #  259: 4d0d
            call0        memcpy                                #  25b: 01e5ffc0
                                                               #  25f: 0000
            s32i         a13, a12, 84 /* a13 -> [arg0+0x54] */ #  261: d26c15
            movi         a2, 0 /* 0x00000000 */                #  264: 0c02
.Lbr016:    l32i         a12, sp, 132 /* [(local1)] */         #  266: c22121
            l32i         a13, sp, 136 /* [(local2)] */         #  269: d22122
            movi         a3, 144 /* 0x00000090 */              #  26c: 32a090
            l32i         a0, sp, 128 /* [(local0)] */          #  26f: 022120
            add          sp, sp, a3 /* (top of frame) */       #  272: 3a11
            ret                                                #  274: 0df0

            .literal_position                                  #  278: 00000000
                                                               #  27c: 00000000

# Function @ .irom0.text+0x280
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wpa_add_kde
            .type        sdk_wpa_add_kde, @function
sdk_wpa_add_kde:
            addi         sp, sp, -32 /* (local0) */            #  280: 12c1e0
            s32i         a6, sp, 20 /* arg4 -> [(local5)] */   #  283: 6951
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  285: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  287: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  289: c911
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  28b: f941
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  28d: e931
            mov          a15, a6 /* arg4 */                    #  28f: fd06
            mov          a14, a5 /* arg3 */                    #  291: ed05
            mov          a12, a2 /* arg0 */                    #  293: cd02
            mov          a13, a7 /* arg5 */                    #  295: dd07
            mov          a2, a3 /* arg1 */                     #  297: 2d03
            movi         a7, -35 /* 0xffffffdd */              #  299: 72afdd
            s8i          a7, a12, 0 /* 0xdd -> [arg0] */       #  29c: 724c00
            s8i          a2, a12, 5 /* arg1 -> [arg0+0x5] */   #  29f: 224c05
            mov          a3, a4 /* arg2 */                     #  2a2: 3d04
            add          a0, a14, a13                          #  2a4: da0e
            extui        a5, a2, 16, 16                        #  2a6: 2050f5
            extui        a6, a2, 24, 8                         #  2a9: 206875
            s8i          a6, a12, 2 /* a6 -> [arg0+0x2] */     #  2ac: 624c02
            s8i          a5, a12, 3 /* a5 -> [arg0+0x3] */     #  2af: 524c03
            addi         a0, a0, 4                             #  2b2: 4b00
            srli         a4, a2, 8                             #  2b4: 204841
            s8i          a4, a12, 4 /* a4 -> [arg0+0x4] */     #  2b7: 424c04
            s8i          a0, a12, 1 /* a0 -> [arg0+0x1] */     #  2ba: 024c01
            mov          a4, a14 /* arg3 */                    #  2bd: 4d0e
            addi         a2, a12, 6 /* arg0+0x6 */             #  2bf: 6b2c
            call0        memcpy                                #  2c1: 01edffc0
                                                               #  2c5: 0000
            add          a12, a12, a14                         #  2c7: eacc
            addi         a12, a12, 6                           #  2c9: 6bcc
            beqz         a15, .Lbr017                          #  2cb: 8ccf
            mov          a3, a15 /* arg4 */                    #  2cd: 3d0f
            mov          a2, a12                               #  2cf: 2d0c
            mov          a4, a13 /* arg5 */                    #  2d1: 4d0d
            call0        memcpy                                #  2d3: 01eaffc0
                                                               #  2d7: 0000
            add          a12, a12, a13                         #  2d9: dacc
.Lbr017:    l32i         a0, sp, 0 /* [(local0)] */            #  2db: 0801
            l32i         a13, sp, 8 /* [(local2)] */           #  2dd: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  2df: e831
            mov          a2, a12                               #  2e1: 2d0c
            l32i         a15, sp, 16 /* [(local4)] */          #  2e3: f841
            l32i         a12, sp, 4 /* [(local1)] */           #  2e5: c811
            addi         sp, sp, 32 /* (top of frame) */       #  2e7: 12c120
            ret                                                #  2ea: 0df0

            .literal_position                                  #  2ec: 00000000
                                                               #  2f0: 00000000
                                                               #  2f4: 00000000
                                                               #  2f8: 00000000
                                                               #  2fc: 00000000
                                                               #  300: 00000000
                                                               #  304: 00000000
                                                               #  308: 00000000
                                                               #  30c: 00000000

# Function @ .irom0.text+0x310
# Local variables/stack:
#     (local0):  word      @ -0x3c
#     (local1):  word      @ -0x38
#     (local2):  word[5]   @ -0x34
#     (local3):  word      @ -0x20
#     (local4):  word      @ -0x1c
#     (local5):  word      @ -0x18
#     (local6):  word      @ -0x14
#     (local7):  word      @ -0x10
#     (local8):  word      @ -0xc
#     (local9):  word      @ -0x8
#     (local10): word      @ -0x4
            .balign      4
            .global      sdk_wpa_validate_wpa_ie
            .type        sdk_wpa_validate_wpa_ie, @function
sdk_wpa_validate_wpa_ie:
            addi         sp, sp, -64 /* (FP)-0x40 */           #  310: 12c1c0
            s32i         a15, sp, 60 /* a15 -> [(local10)] */  #  313: f9f1
            s32i         a0, sp, 44 /* a0 -> [(local6)] */     #  315: 09b1
            s32i         a13, sp, 52 /* a13 -> [(local8)] */   #  317: d9d1
            s32i         a12, sp, 48 /* a12 -> [(local7)] */   #  319: c9c1
            s32i         a14, sp, 56 /* a14 -> [(local9)] */   #  31b: e9e1
            mov          a12, a3 /* arg1 */                    #  31d: cd03
            mov          a14, a4 /* arg2 */                    #  31f: ed04
            mov          a13, a2 /* arg0 */                    #  321: dd02
            mov          a2, a5 /* arg3 */                     #  323: 2d05
            beqz         a13, .Lbr018                          #  325: 9cdd
            beqz         a3, .Lbr018                           #  327: 9cb3
            beqz         a4, .Lbr019                           #  329: 9ce4
            beqz         a5, .Lbr019                           #  32b: 9cc5
            l32i         a5, a13, 4 /* [arg0+0x4] */           #  32d: 581d
            movi         a15, 2 /* 0x00000002 */               #  32f: 0c2f
            l8ui         a6, a4, 0 /* [arg2] */                #  331: 620400
            movi         a3, 1 /* 0x00000001 */                #  334: 0c13
            addi         a6, a6, -48 /* [arg2]-0x30 */         #  336: 62c6d0
            moveqz       a3, a15, a6                           #  339: 603f83
            mov          a0, a3                                #  33c: 0d03
            bany         a5, a3, .Lbr021                       #  33e: 37851a
            movi         a2, 10 /* 0x0000000a */               #  341: 0ca2
            j            .Lbr020                               #  343: 860100
.Lbr018:    movi         a2, 5 /* 0x00000005 */                #  346: 0c52
            j            .Lbr020                               #  348: 460000
.Lbr019:    movi         a2, 1 /* 0x00000001 */                #  34b: 0c12
.Lbr020:    l32i         a12, sp, 48 /* [(local7)] */          #  34d: c8c1
            l32i         a13, sp, 52 /* [(local8)] */          #  34f: d8d1
            l32i         a14, sp, 56 /* [(local9)] */          #  351: e8e1
            l32i         a15, sp, 60 /* [(local10)] */         #  353: f8f1
            l32i         a0, sp, 44 /* [(local6)] */           #  355: 08b1
            addi         sp, sp, 64 /* (top of frame) */       #  357: 12c140
            ret                                                #  35a: 0df0
.Lbr021:    s32i         a0, sp, 32 /* a0 -> [(local3)] */     #  35c: 0981
            s32i         a2, sp, 40 /* arg3 -> [(local5)] */   #  35e: 29a1
            bnei         a3, 2, .Lbr022                        #  360: 662324
            mov          a2, a4 /* arg2 */                     #  363: 2d04
            l32i         a3, sp, 40 /* [(local5)] */           #  365: 38a1
            mov          a4, sp /* (FP)-0x40 */                #  367: 4d01
            call0        sdk_wpa_parse_wpa_ie_rsn              #  369: 01e0ffc0
                                                               #  36d: 0000
            s32i         a2, sp, 36 /* a2 -> [(local4)] */     #  36f: 2991
            l32i         a3, sp, 4 /* [(local0)] */            #  371: 3811
            movi         a2, 2 /* 0x00000002 */                #  373: 0c22
            call0        sdk_wpa_cipher_to_suite               #  375: 01deffc0
                                                               #  379: 0000
            movi         a2, 2 /* 0x00000002 */                #  37b: 0c22
            l32i         a3, sp, 8 /* [(local1)] */            #  37d: 3821
            call0        sdk_wpa_cipher_to_suite               #  37f: 01ddffc0
                                                               #  383: 0000
            j            .Lbr023                               #  385: 460800
.Lbr022:    mov          a2, a4 /* arg2 */                     #  388: 2d04
            l32i         a3, sp, 40 /* [(local5)] */           #  38a: 38a1
            mov          a4, sp /* (FP)-0x40 */                #  38c: 4d01
            call0        sdk_wpa_parse_wpa_ie_wpa              #  38e: 01daffc0
                                                               #  392: 0000
            s32i         a2, sp, 36 /* a2 -> [(local4)] */     #  394: 2991
            l32i         a3, sp, 4 /* [(local0)] */            #  396: 3811
            movi         a2, 1 /* 0x00000001 */                #  398: 0c12
            call0        sdk_wpa_cipher_to_suite               #  39a: 01d8ffc0
                                                               #  39e: 0000
            movi         a2, 1 /* 0x00000001 */                #  3a0: 0c12
            l32i         a3, sp, 8 /* [(local1)] */            #  3a2: 3821
            call0        sdk_wpa_cipher_to_suite               #  3a4: 01d7ffc0
                                                               #  3a8: 0000
.Lbr023:    l32i         a7, sp, 36 /* [(local4)] */           #  3aa: 7891
            l32i         a9, sp, 8 /* [(local1)] */            #  3ac: 9821
            bnez         a7, .Lbr019                           #  3ae: 5697f9
            l32i         a8, a13, 16 /* [arg0+0x10] */         #  3b1: 884d
            l32i         a11, sp, 12 /* [(local2)] */          #  3b3: b831
            beq          a8, a9, .Lbr024                       #  3b5: 971804
            movi         a2, 2 /* 0x00000002 */                #  3b8: 0c22
            j            .Lbr020                               #  3ba: c6e3ff
.Lbr024:    l32i         a10, a13, 8 /* [arg0+0x8] */          #  3bd: a82d
            and          a0, a10, a11                          #  3bf: b00a10
            bany         a10, a11, .Lbr025                     #  3c2: b78a04
            movi         a2, 4 /* 0x00000004 */                #  3c5: 0c42
            j            .Lbr020                               #  3c7: 86e0ff
.Lbr025:    l32i         a2, sp, 32 /* [(local3)] */           #  3ca: 2881
            bbci         a0, 0, .Lbr026                        #  3cc: 076007
            movi         a0, 1 /* 0x00000001 */                #  3cf: 0c10
            s32i         a0, a12, 0x194 /* 0x00000001 -> [arg1+0x194] */ #  3d1: 026c65
            j            .Lbr027                               #  3d4: 860000
.Lbr026:    s32i         a15, a12, 0x194 /* 0x00000002 -> [arg1+0x194] */ #  3d7: f26c65
.Lbr027:    l32i         a0, sp, 4 /* [(local0)] */            #  3da: 0811
            bnei         a2, 2, .Lbr032                        #  3dc: 662248
            l32i         a9, a13, 36 /* [arg0+0x24] */         #  3df: 989d
.Lbr028:    and          a8, a9, a0                            #  3e1: 008910
            bnone        a9, a0, .Lbr034                       #  3e4: 070959
            movi         a0, 8 /* 0x00000008 */                #  3e7: 0c80
            bbsi         a8, 3, .Lbr029                        #  3e9: 37e806
            movi         a0, 64 /* 0x00000040 */               #  3ec: 4c00
            bbsi         a8, 6, .Lbr029                        #  3ee: 67e801
            mov          a0, a15 /* 0x00000002 */              #  3f1: 0d0f
.Lbr029:    s32i         a0, a12, 0x190 /* a0 -> [arg1+0x190] */ #  3f3: 026c64
            l8ui         a3, a14, 0 /* [arg2] */               #  3f6: 320e00
            movi         a4, 48 /* 0x00000030 */               #  3f9: 3c04
            beq          a3, a4, .Lbr030                       #  3fb: 471301
            movi         a15, 1 /* 0x00000001 */               #  3fe: 0c1f
.Lbr030:    l32i         a2, a12, 0x184 /* [arg1+0x184] */     #  400: 222c61
            s32i         a15, a12, 0x18c /* a15 -> [arg1+0x18c] */ #  403: f26c63
            beqz         a2, .Lbr031                           #  406: 8c62
            l32i         a6, sp, 40 /* [(local5)] */           #  408: 68a1
            l32i         a5, a12, 0x188 /* [arg1+0x188] */     #  40a: 522c62
            bgeu         a5, a6, .Lbr033                       #  40d: 67b51c
.Lbr031:    call0        free                                  #  410: 01bdffc0
                                                               #  414: 0000
            l32i         a2, sp, 40 /* [(local5)] */           #  416: 28a1
            call0        malloc                                #  418: 01bcffc0
                                                               #  41c: 0000
            s32i         a2, a12, 0x184 /* a2 -> [arg1+0x184] */ #  41e: 226c61
            bnez         a2, .Lbr033                           #  421: cc82
            movi         a2, 6 /* 0x00000006 */                #  423: 0c62
            j            .Lbr020                               #  425: 06c9ff
.Lbr032:    l32i         a9, a13, 12 /* [arg0+0xc] */          #  428: 983d
            j            .Lbr028                               #  42a: c6ecff
.Lbr033:    mov          a3, a14 /* arg2 */                    #  42d: 3d0e
            l32i         a4, sp, 40 /* [(local5)] */           #  42f: 48a1
            call0        memcpy                                #  431: 01b6ffc0
                                                               #  435: 0000
            movi         a2, 0 /* 0x00000000 */                #  437: 0c02
            l32i         a7, sp, 40 /* [(local5)] */           #  439: 78a1
            s32i         a7, a12, 0x188 /* [(local5)] -> [arg1+0x188] */ #  43b: 726c62
            j            .Lbr020                               #  43e: c6c2ff
.Lbr034:    movi         a2, 3 /* 0x00000003 */                #  441: 0c32
            j            .Lbr020                               #  443: 86c1ff

            .literal_position                                  #  448: 01f25000
                                                               #  44c: 04ac0f00
                                                               #  450: 01ac0f00
                                                               #  454: 03ac0f00

# Function @ .irom0.text+0x458
            .balign      4
.Lfunc002:  l8ui         a7, a2, 1 /* [arg0+0x1] */            #  458: 720201
            l8ui         a5, a2, 5 /* [arg0+0x5] */            #  45b: 520205
            bnez         a7, .Lbr035                           #  45e: cc27
            movi         a2, 1 /* 0x00000001 */                #  460: 0c12
            ret           /* 0x00000001 */                     #  462: 0df0
.Lbr035:    bltui        a7, 6, .Lbr036                        #  464: b66737
            l8ui         a8, a2, 2 /* [arg0+0x2] */            #  467: 820202
            l8ui         a9, a2, 3 /* [arg0+0x3] */            #  46a: 920203
            l8ui         a6, a2, 4 /* [arg0+0x4] */            #  46d: 620204
            slli         a9, a9, 16                            #  470: 009911
            slli         a6, a6, 8                             #  473: 806611
            slli         a8, a8, 24                            #  476: 808801
            or           a5, a5, a6                            #  479: 605520
            movi         a6, 0x0050f201                        #  47c: 61f3ff
            or           a8, a8, a9                            #  47f: 908820
            or           a5, a5, a8                            #  482: 805520
            bne          a5, a6, .Lbr036                       #  485: 679516
            l8ui         a8, a2, 6 /* [arg0+0x6] */            #  488: 820206
            bnei         a8, 1, .Lbr036                        #  48b: 661810
            l8ui         a9, a2, 7 /* [arg0+0x7] */            #  48e: 920207
            bnez         a9, .Lbr036                           #  491: cca9
            s32i         a2, a4, 0 /* arg0 -> [arg2] */        #  493: 2904
            l8ui         a10, a2, 1 /* [arg0+0x1] */           #  495: a20201
            addi         a10, a10, 2 /* [arg0+0x1]+0x2 */      #  498: 2baa
            s32i         a10, a4, 4 /* [arg0+0x1]+0x2 -> [arg2+0x4] */ #  49a: a914
            j            .Lbr039                               #  49c: c61f00
.Lbr036:    addi         a11, a2, 5 /* arg0+0x5 */             #  49f: 5bb2
            bgeu         a11, a3, .Lbr037                      #  4a1: 37bb2f
            movi         a3, 19 /* 0x00000013 */               #  4a4: 1c33
            bgeu         a3, a7, .Lbr037                       #  4a6: 77b32a
            l8ui         a5, a2, 5 /* [arg0+0x5] */            #  4a9: 520205
            l8ui         a8, a2, 2 /* [arg0+0x2] */            #  4ac: 820202
            l8ui         a9, a2, 3 /* [arg0+0x3] */            #  4af: 920203
            l8ui         a6, a2, 4 /* [arg0+0x4] */            #  4b2: 620204
            slli         a9, a9, 16                            #  4b5: 009911
            slli         a6, a6, 8                             #  4b8: 806611
            slli         a8, a8, 24                            #  4bb: 808801
            or           a5, a5, a6                            #  4be: 605520
            movi         a6, 0x000fac04                        #  4c1: 61e2ff
            or           a8, a8, a9                            #  4c4: 908820
            or           a5, a5, a8                            #  4c7: 805520
            bne          a5, a6, .Lbr037                       #  4ca: 679506
            addi         a7, a2, 6 /* arg0+0x6 */              #  4cd: 6b72
            s32i         a7, a4, 16 /* arg0+0x6 -> [arg2+0x10] */ #  4cf: 7944
            j            .Lbr039                               #  4d1: 861200
.Lbr037:    bltui        a7, 7, .Lbr039                        #  4d4: b67747
            movi         a8, 0x000fac01                        #  4d7: 81deff
            l8ui         a6, a2, 3 /* [arg0+0x3] */            #  4da: 620203
            l8ui         a5, a2, 4 /* [arg0+0x4] */            #  4dd: 520204
            l8ui         a3, a2, 5 /* [arg0+0x5] */            #  4e0: 320205
            slli         a5, a5, 8                             #  4e3: 805511
            or           a3, a3, a5                            #  4e6: 503320
            l8ui         a5, a2, 2 /* [arg0+0x2] */            #  4e9: 520202
            slli         a6, a6, 16                            #  4ec: 006611
            slli         a5, a5, 24                            #  4ef: 805501
            or           a5, a5, a6                            #  4f2: 605520
            or           a3, a3, a5                            #  4f5: 503320
            bne          a3, a8, .Lbr038                       #  4f8: 87930e
            addi         a7, a2, 6 /* arg0+0x6 */              #  4fb: 6b72
            s32i         a7, a4, 20 /* arg0+0x6 -> [arg2+0x14] */ #  4fd: 7954
            l8ui         a6, a2, 1 /* [arg0+0x1] */            #  4ff: 620201
            addi         a6, a6, -4 /* [arg0+0x1]-0x4 */       #  502: 62c6fc
            s32i         a6, a4, 24 /* [arg0+0x1]-0x4 -> [arg2+0x18] */ #  505: 6964
            j            .Lbr039                               #  507: 060500
.Lbr038:    bltui        a7, 7, .Lbr039                        #  50a: b67711
            movi         a8, 0x000fac03                        #  50d: 81d1ff
            bne          a3, a8, .Lbr039                       #  510: 87930b
            addi         a10, a2, 6 /* arg0+0x6 */             #  513: 6ba2
            s32i         a10, a4, 28 /* arg0+0x6 -> [arg2+0x1c] */ #  515: a974
            l8ui         a9, a2, 1 /* [arg0+0x1] */            #  517: 920201
            addi         a9, a9, -4 /* [arg0+0x1]-0x4 */       #  51a: 92c9fc
            s32i         a9, a4, 32 /* [arg0+0x1]-0x4 -> [arg2+0x20] */ #  51d: 9984
.Lbr039:    movi         a2, 0 /* 0x00000000 */                #  51f: 0c02
            ret           /* 0x00000000 */                     #  521: 0df0

            .literal_position                                  #  524: 00000000

# Function @ .irom0.text+0x528
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
            .global      sdk_wpa_parse_kde_ies
            .type        sdk_wpa_parse_kde_ies, @function
sdk_wpa_parse_kde_ies:
            addi         sp, sp, -32 /* (local0) */            #  528: 12c1e0
            s32i         a15, sp, 24 /* a15 -> [(local6)] */   #  52b: f961
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  52d: 0921
            s32i         a14, sp, 20 /* a14 -> [(local5)] */   #  52f: e951
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   #  531: d941
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  533: c931
            mov          a13, a4 /* arg2 */                    #  535: dd04
            mov          a12, a2 /* arg0 */                    #  537: cd02
            mov          a14, a3 /* arg1 */                    #  539: ed03
            mov          a2, a4 /* arg2 */                     #  53b: 2d04
            movi         a3, 0 /* 0x00000000 */                #  53d: 0c03
            movi         a4, 36 /* 0x00000024 */               #  53f: 2c44
            call0        memset                                #  541: 01f8ffc0
                                                               #  545: 0000
            s32i         a13, sp, 4 /* arg2 -> [(local1)] */   #  547: d911
            blti         a14, 2, .Lbr047                       #  549: a62e70
            movi         a15, 48 /* 0x00000030 */              #  54c: 3c0f
            movi         a2, 0 /* 0x00000000 */                #  54e: 0c02
            add          a13, a12, a14                         #  550: eadc
            movi         a14, 221 /* 0x000000dd */             #  552: e2a0dd
            addi         a0, a13, -1                           #  555: 0b0d
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  557: 0901
.Lbr040:    l8ui         a0, a12, 0                            #  559: 020c00
            l8ui         a3, a12, 1                            #  55c: 320c01
            bne          a0, a14, .Lbr041                      #  55f: e7900c
            l32i         a3, sp, 0 /* [(local0)] */            #  562: 3801
            beq          a3, a12, .Lbr046                      #  564: c71346
            l8ui         a3, a12, 1                            #  567: 320c01
            bnez         a3, .Lbr041                           #  56a: cc13
            j            .Lbr046                               #  56c: 860f00
.Lbr041:    add          a3, a3, a12                           #  56f: ca33
            addi         a3, a3, 2                             #  571: 2b33
            bltu         a13, a3, .Lbr045                      #  573: 373d35
            bne          a0, a15, .Lbr044                      #  576: f7901b
            l32i         a5, sp, 4 /* [(local1)] */            #  579: 5811
            s32i         a12, a5, 8 /* a12 -> [[(local1)]+0x8] */ #  57b: c925
            l8ui         a4, a12, 1                            #  57d: 420c01
            addi         a4, a4, 2                             #  580: 2b44
            s32i         a4, a5, 12 /* a4 -> [[(local1)]+0xc] */ #  582: 4935
.Lbr042:    l8ui         a3, a12, 1                            #  584: 320c01
            add          a3, a3, a12                           #  587: ca33
            addi         a3, a3, 2                             #  589: 2b33
.Lbr043:    mov          a12, a3                               #  58b: cd03
            addi         a4, a3, 1                             #  58d: 1b43
            bltu         a4, a13, .Lbr040                      #  58f: d734c6
            j            .Lbr046                               #  592: 060600
.Lbr044:    bne          a0, a14, .Lbr043                      #  595: e790f2
            mov          a2, a12                               #  598: 2d0c
            mov          a3, a13                               #  59a: 3d0d
            l32i         a4, sp, 4 /* [(local1)] */            #  59c: 4811
            call0        .Lfunc002                             #  59e: 85ebff
            bltz         a2, .Lbr046                           #  5a1: 969200
            blti         a2, 1, .Lbr042                        #  5a4: a612dc
            movi         a2, 0 /* 0x00000000 */                #  5a7: 0c02
            j            .Lbr046                               #  5a9: 460000
.Lbr045:    movi         a2, -1 /* 0xffffffff */               #  5ac: 7cf2
.Lbr046:    l32i         a12, sp, 12 /* [(local3)] */          #  5ae: c831
            l32i         a13, sp, 16 /* [(local4)] */          #  5b0: d841
            l32i         a14, sp, 20 /* [(local5)] */          #  5b2: e851
            l32i         a15, sp, 24 /* [(local6)] */          #  5b4: f861
            l32i         a0, sp, 8 /* [(local2)] */            #  5b6: 0821
            addi         sp, sp, 32 /* (top of frame) */       #  5b8: 12c120
            ret                                                #  5bb: 0df0
.Lbr047:    movi         a2, 0 /* 0x00000000 */                #  5bd: 0c02
            j            .Lbr046                               #  5bf: c6faff

            .balign      4
# Function @ .irom0.text+0x5c4
            .balign      4
            .global      sdk_wpa_auth_uses_mfp
            .type        sdk_wpa_auth_uses_mfp, @function
sdk_wpa_auth_uses_mfp:
            beqz         a2, .Lbr048                           #  5c4: 8c92
            addmi        a2, a2, 256 /* arg0+0x100 */          #  5c6: 22d201
            l8ui         a2, a2, 116 /* [arg0+0x174] */        #  5c9: 220274
            extui        a2, a2, 4, 1                          #  5cc: 202404
            ret                                                #  5cf: 0df0
.Lbr048:    movi         a2, 0 /* 0x00000000 */                #  5d1: 0c02
            ret           /* 0x00000000 */                     #  5d3: 0df0

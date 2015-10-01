
            .section     .bss, "aw", @nobits

            .global      sdk_interface_mask
            .type        sdk_interface_mask, @object
sdk_interface_mask:
            .byte        0x00
            .space       15
            .global      sdk_if_ctrl
            .type        sdk_if_ctrl, @object
sdk_if_ctrl:
            .space       32

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 10000000

# Function @ .irom0.text+0x4
            .global      sdk_ic_get_addr
            .type        sdk_ic_get_addr, @function
sdk_ic_get_addr:
            movi         a3, sdk_if_ctrl                       #    4: 31ffff
            slli         a2, a2, 4                             #    7: c02211
            add          a2, a3, a2                            #    a: 2a23
            ret                                                #    c: 0df0

            .literal_position                                  #   10: 10000000

# Function @ .irom0.text+0x14
            .global      sdk_ic_set_opmode
            .type        sdk_ic_set_opmode, @function
sdk_ic_set_opmode:
            movi         a5, sdk_if_ctrl                       #   14: 51ffff
            slli         a6, a2, 4                             #   17: c06211
            add          a5, a5, a6                            #   1a: 6a55
            s32i         a3, a5, 8                             #   1c: 3925
            s8i          a4, a5, 12                            #   1e: 42450c
            ret           /* arg0 */                           #   21: 0df0

            .literal_position                                  #   24: 10000000
                                                               #   28: 00000000
                                                               #   2c: 00000000
                                                               #   30: 00000000

# Function @ .irom0.text+0x34
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .global      sdk_ic_enable_interface
            .type        sdk_ic_enable_interface, @function
sdk_ic_enable_interface:
            addi         sp, sp, -16 /* (local0) */            #   34: 12c1f0
            s32i         a5, sp, 4 /* arg3 -> [(local1)] */    #   37: 5911
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #   39: 0921
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #   3b: c931
            s32i         a4, sp, 0 /* arg2 -> [(local0)] */    #   3d: 4901
            mov          a12, a2 /* arg0 */                    #   3f: cd02
            movi         a2, sdk_if_ctrl                       #   41: 21f8ff
            slli         a4, a12, 4                            #   44: c04c11
            add          a2, a2, a4                            #   47: 4a22
            movi         a4, 6 /* 0x00000006 */                #   49: 0c64
            call0        memcpy                                #   4b: 01f8ffc0
                                                               #   4f: 0000
            mov          a2, a12 /* arg0 */                    #   51: 2d0c
            l32i         a3, sp, 0 /* [(local0)] */            #   53: 3801
            l32i         a4, sp, 4 /* [(local1)] */            #   55: 4811
            call0        sdk_ic_set_opmode                     #   57: 050000
            ssl          a12                                   #   5a: 001c40
            movi         a5, sdk_interface_mask                #   5d: 51f2ff
            movi         a3, 1 /* 0x00000001 */                #   60: 0c13
            l8ui         a2, a5, 0 /* [sdk_interface_mask] */  #   62: 220500
            sll          a3, a3                                #   65: 0033a1
            or           a2, a2, a3                            #   68: 302220
            extui        a2, a2, 0, 8                          #   6b: 202074
            s8i          a2, a5, 0 /* a2 -> [sdk_interface_mask] */ #   6e: 224500
            call0        __popcountsi2                         #   71: 01efffc0
                                                               #   75: 0000
            extui        a2, a2, 0, 8                          #   77: 202074
            l32i         a12, sp, 12 /* [(local3)] */          #   7a: c831
            l32i         a0, sp, 8 /* [(local2)] */            #   7c: 0821
            addi         sp, sp, 16 /* (top of frame) */       #   7e: 12c110
            ret                                                #   81: 0df0

            .literal_position                                  #   84: 00000000

# Function @ .irom0.text+0x88
            .global      sdk_ic_interface_enabled
            .type        sdk_ic_interface_enabled, @function
sdk_ic_interface_enabled:
            movi         a3, sdk_interface_mask                #   88: 31ffff
            l8ui         a3, a3, 0 /* [sdk_interface_mask] */  #   8b: 320300
            ssr          a2                                    #   8e: 000240
            srl          a2, a3                                #   91: 302091
            extui        a2, a2, 0, 1                          #   94: 202004
            ret                                                #   97: 0df0

            .literal_position                                  #   9c: 00000000
                                                               #   a0: 00000000
                                                               #   a4: 00000000
                                                               #   a8: 00000000
                                                               #   ac: 00000000

# Function @ .irom0.text+0xb0
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ic_disable_interface
            .type        sdk_ic_disable_interface, @function
sdk_ic_disable_interface:
            addi         sp, sp, -16 /* (local0) */            #   b0: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   b3: 0901
            movi         a0, sdk_interface_mask                #   b5: 01f9ff
            movi         a4, 1 /* 0x00000001 */                #   b8: 0c14
            l8ui         a0, a0, 0 /* [sdk_interface_mask] */  #   ba: 020000
            ssr          a2                                    #   bd: 000240
            srl          a3, a0                                #   c0: 003091
            bbci         a3, 0, .Lbr001                        #   c3: 07631f
            ssl          a2                                    #   c6: 001240
            sll          a3, a4                                #   c9: 0034a1
            movi         a4, -1 /* 0xffffffff */               #   cc: 7cf4
            xor          a3, a3, a4                            #   ce: 403330
            movi         a4, sdk_interface_mask                #   d1: 41f3ff
            and          a3, a0, a3                            #   d4: 303010
            s8i          a3, a4, 0 /* a3 -> [sdk_interface_mask] */ #   d7: 324400
            call0        sdk_rc_disable_trc_by_interface       #   da: 01f3ffc0
                                                               #   de: 0000
            movi         a0, sdk_interface_mask                #   e0: 01f1ff
            l8ui         a0, a0, 0 /* [sdk_interface_mask] */  #   e3: 020000
.Lbr001:    mov          a2, a0 /* [sdk_interface_mask] */     #   e6: 2d00
            call0        __popcountsi2                         #   e8: 01f1ffc0
                                                               #   ec: 0000
            extui        a2, a2, 0, 8                          #   ee: 202074
            l32i         a0, sp, 0 /* [(local0)] */            #   f1: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   f3: 12c110
            ret                                                #   f6: 0df0

            .literal_position                                  #   f8: 10000000

# Function @ .irom0.text+0xfc
            .global      sdk_ic_is_pure_sta
            .type        sdk_ic_is_pure_sta, @function
sdk_ic_is_pure_sta:
            movi         a4, sdk_if_ctrl                       #   fc: 41ffff
            slli         a5, a2, 4                             #   ff: c05211
            add          a4, a4, a5                            #  102: 5a44
            l32i         a3, a4, 8                             #  104: 3824
            movi         a2, 0 /* 0x00000000 */                #  106: 0c02
            beqi         a3, 1, .Lbr002                        #  108: 261307
            l8ui         a7, a4, 12                            #  10b: 72040c
            movi         a6, 1 /* 0x00000001 */                #  10e: 0c16
            moveqz       a2, a6, a7                            #  110: 702683
.Lbr002:    extui        a2, a2, 0, 8                          #  113: 202074
            ret                                                #  116: 0df0

            .literal_position                                  #  118: 10000000

# Function @ .irom0.text+0x11c
            .global      sdk_ic_get_ptk_alg
            .type        sdk_ic_get_ptk_alg, @function
sdk_ic_get_ptk_alg:
            movi         a3, sdk_if_ctrl                       #  11c: 31ffff
            slli         a2, a2, 4                             #  11f: c02211
            add          a2, a3, a2                            #  122: 2a23
            l8ui         a2, a2, 13                            #  124: 22020d
            ret                                                #  127: 0df0

            .literal_position                                  #  12c: 10000000

# Function @ .irom0.text+0x130
            .global      sdk_ic_get_gtk_alg
            .type        sdk_ic_get_gtk_alg, @function
sdk_ic_get_gtk_alg:
            movi         a3, sdk_if_ctrl                       #  130: 31ffff
            slli         a2, a2, 4                             #  133: c02211
            add          a2, a3, a2                            #  136: 2a23
            l8ui         a2, a2, 14                            #  138: 22020e
            ret                                                #  13b: 0df0

            .literal_position                                  #  140: 10000000

# Function @ .irom0.text+0x144
            .global      sdk_ic_set_ptk_alg
            .type        sdk_ic_set_ptk_alg, @function
sdk_ic_set_ptk_alg:
            movi         a4, sdk_if_ctrl                       #  144: 41ffff
            slli         a5, a2, 4                             #  147: c05211
            add          a4, a4, a5                            #  14a: 5a44
            s8i          a3, a4, 13                            #  14c: 32440d
            ret           /* arg0 */                           #  14f: 0df0

            .literal_position                                  #  154: 10000000

# Function @ .irom0.text+0x158
            .global      sdk_ic_set_gtk_alg
            .type        sdk_ic_set_gtk_alg, @function
sdk_ic_set_gtk_alg:
            movi         a4, sdk_if_ctrl                       #  158: 41ffff
            slli         a5, a2, 4                             #  15b: c05211
            add          a4, a4, a5                            #  15e: 5a44
            s8i          a3, a4, 14                            #  160: 32440e
            ret           /* arg0 */                           #  163: 0df0

            .literal_position                                  #  168: 10000000

# Function @ .irom0.text+0x16c
            .global      sdk_ic_interface_is_p2p
            .type        sdk_ic_interface_is_p2p, @function
sdk_ic_interface_is_p2p:
            movi         a3, sdk_if_ctrl                       #  16c: 31ffff
            slli         a2, a2, 4                             #  16f: c02211
            add          a2, a3, a2                            #  172: 2a23
            l8ui         a2, a2, 12                            #  174: 22020c
            ret                                                #  177: 0df0

            .literal_position                                  #  17c: 00000000
                                                               #  180: 00000000

# Function @ .irom0.text+0x184
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
.Lfunc001:  movi         a3, 0 /* 0x00000000 */                #  184: 0c03
            addi         sp, sp, -16 /* (local0) */            #  186: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  189: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  18b: 0901
            mov          a12, a2 /* arg0 */                    #  18d: cd02
            call0        sdk_ic_set_ptk_alg                    #  18f: 050000
            mov          a2, a12 /* arg0 */                    #  192: 2d0c
            movi         a3, 0 /* 0x00000000 */                #  194: 0c03
            call0        sdk_ic_set_gtk_alg                    #  196: 050000
            mov          a2, a12 /* arg0 */                    #  199: 2d0c
            call0        sdk_wDev_Crypto_Disable               #  19b: 01f8ffc0
                                                               #  19f: 0000
            mov          a3, a12 /* arg0 */                    #  1a1: 3d0c
            movi         a2, 1 /* 0x00000001 */                #  1a3: 0c12
            movi         a4, 0 /* 0x00000000 */                #  1a5: 0c04
            call0        sdk_wDev_SetRxPolicy                  #  1a7: 01f6ffc0
                                                               #  1ab: 0000
            l32i         a12, sp, 4 /* [(local1)] */           #  1ad: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  1af: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  1b1: 12c110
            ret                                                #  1b4: 0df0

            .literal_position                                  #  1b8: 00000000
                                                               #  1bc: 00000000
                                                               #  1c0: 00000000
                                                               #  1c4: 00000000
                                                               #  1c8: 00000000

# Function @ .irom0.text+0x1cc
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
.Lfunc002:  addi         sp, sp, -16 /* (local0) */            #  1cc: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  1cf: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  1d1: 0901
            mov          a12, a2 /* arg0 */                    #  1d3: cd02
            movi         a2, .Lstr001                          #  1d5: 21f8ff
            mov          a3, a12 /* arg0 */                    #  1d8: 3d0c
            call0        printf                                #  1da: 01f8ffc0
                                                               #  1de: 0000
            movi         a2, 0 /* 0x00000000 */                #  1e0: 0c02
            mov          a3, a12 /* arg0 */                    #  1e2: 3d0c
            movi         a4, 0 /* 0x00000000 */                #  1e4: 0c04
            call0        sdk_wDev_SetRxPolicy                  #  1e6: 01f6ffc0
                                                               #  1ea: 0000
            mov          a2, a12 /* arg0 */                    #  1ec: 2d0c
            call0        sdk_ic_disable_interface              #  1ee: 050000
            bnez         a2, .Lbr003                           #  1f1: cca2
            call0        sdk_wDevDisableRx                     #  1f3: 01f4ffc0
                                                               #  1f7: 0000
            call0        sdk_pm_force_scan_unlock              #  1f9: 01f3ffc0
                                                               #  1fd: 0000
.Lbr003:    l32i         a12, sp, 4 /* [(local1)] */           #  1ff: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  201: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  203: 12c110
            ret                                                #  206: 0df0

            .literal_position                                  #  208: 0c000000
                                                               #  20c: 18000000
                                                               #  210: 00000000
                                                               #  214: 00000000
                                                               #  218: 00000000
                                                               #  21c: 00000000

# Function @ .irom0.text+0x220
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .global      sdk_ic_set_vif
            .type        sdk_ic_set_vif, @function
sdk_ic_set_vif:
            addi         sp, sp, -32 /* (local0) */            #  220: 12c1e0
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  223: 0921
            s32i         a5, sp, 4 /* arg3 -> [(local1)] */    #  225: 5911
            s32i         a6, sp, 0 /* arg4 -> [(local0)] */    #  227: 6901
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  229: c931
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   #  22b: d941
            mov          a12, a2 /* arg0 */                    #  22d: cd02
            mov          a13, a4 /* arg2 */                    #  22f: dd04
            bnei         a3, 2, .Lbr004                        #  231: 662316
            movi         a2, .Lstr002                          #  234: 21f5ff
            mov          a3, a12 /* arg0 */                    #  237: 3d0c
            call0        printf                                #  239: 01f5ffc0
                                                               #  23d: 0000
            mov          a2, a12 /* arg0 */                    #  23f: 2d0c
            l32i         a3, sp, 4 /* [(local1)] */            #  241: 3811
            l32i         a4, sp, 0 /* [(local0)] */            #  243: 4801
            call0        sdk_ic_set_opmode                     #  245: 050000
            j            .Lbr007                               #  248: 860d00
.Lbr004:    bnei         a3, 1, .Lbr006                        #  24b: 661330
            movi         a2, .Lstr003                          #  24e: 21efff
            mov          a3, a12 /* arg0 */                    #  251: 3d0c
            call0        printf                                #  253: 01f0ffc0
                                                               #  257: 0000
            mov          a2, a12 /* arg0 */                    #  259: 2d0c
            mov          a3, a13 /* arg2 */                    #  25b: 3d0d
            call0        sdk_wDev_SetMacAddress                #  25d: 01eeffc0
                                                               #  261: 0000
            mov          a3, a13 /* arg2 */                    #  263: 3d0d
            mov          a2, a12 /* arg0 */                    #  265: 2d0c
            l32i         a4, sp, 4 /* [(local1)] */            #  267: 4811
            l32i         a5, sp, 0 /* [(local0)] */            #  269: 5801
            call0        sdk_ic_enable_interface               #  26b: 050000
            bnei         a2, 1, .Lbr005                        #  26e: 661205
            call0        sdk_wDevEnableRx                      #  271: 01eaffc0
                                                               #  275: 0000
.Lbr005:    mov          a2, a12 /* arg0 */                    #  277: 2d0c
            call0        .Lfunc001                             #  279: 85f0ff
            j            .Lbr007                               #  27c: 860000
.Lbr006:    call0        .Lfunc002                             #  27f: c5f4ff
.Lbr007:    l32i         a12, sp, 12 /* [(local3)] */          #  282: c831
            l32i         a13, sp, 16 /* [(local4)] */          #  284: d841
            l32i         a0, sp, 8 /* [(local2)] */            #  286: 0821
            addi         sp, sp, 32 /* (top of frame) */       #  288: 12c120
            ret                                                #  28b: 0df0

            .literal_position                                  #  290: 24000000
                                                               #  294: 00000000
                                                               #  298: 00feef3f
                                                               #  29c: 00000000
                                                               #  2a0: 00000000
                                                               #  2a4: 00000000
                                                               #  2a8: 00000000
                                                               #  2ac: 00000000
                                                               #  2b0: 00000000
                                                               #  2b4: 00000000

# Function @ .irom0.text+0x2b8
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .global      sdk_ic_set_sta
            .type        sdk_ic_set_sta, @function
sdk_ic_set_sta:
            addi         sp, sp, -32 /* (local0) */            #  2b8: 12c1e0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  2bb: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  2bd: 0911
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  2bf: e941
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  2c1: d931
            mov          a14, a6 /* arg4 */                    #  2c3: ed06
            mov          a13, a2 /* arg0 */                    #  2c5: dd02
            beqz         a3, .Lbr010                           #  2c7: 169308
            mov          a3, a4 /* arg2 */                     #  2ca: 3d04
            s32i         a7, sp, 0 /* arg5 -> [(local0)] */    #  2cc: 7901
            mov          a4, a5 /* arg3 */                     #  2ce: 4d05
            mov          a5, a6 /* arg4 */                     #  2d0: 5d06
            call0        sdk_rc_enable_trc                     #  2d2: 01f3ffc0
                                                               #  2d6: 0000
            mov          a12, a2                               #  2d8: cd02
            mov          a3, a14 /* arg4 */                    #  2da: 3d0e
            movi         a2, .Lstr004                          #  2dc: 21edff
            call0        printf                                #  2df: 01f1ffc0
                                                               #  2e3: 0000
            beqz         a12, .Lbr011                          #  2e5: 165c07
            mov          a2, a13 /* arg0 */                    #  2e8: 2d0d
            call0        sdk_ic_interface_is_p2p               #  2ea: 050000
            movi         a14, -32 /* 0xffffffe0 */             #  2ed: 6c0e
            l32i         a4, sp, 0 /* [(local0)] */            #  2ef: 4801
            mov          a0, a2                                #  2f1: 0d02
            s32i         a2, sp, 20 /* a2 -> [(local5)] */     #  2f3: 2951
            movi         a2, sdk_NMIIrqIsOn                    #  2f5: 21e7ff
            s32i         a4, a12, 92                           #  2f8: 426c17
            l8ui         a2, a2, 0 /* [sdk_NMIIrqIsOn] */      #  2fb: 220200
            movi         a13, 0x3feffe00                       #  2fe: d1e6ff
            bnez         a2, .Lbr009                           #  301: dce2
            call0        vPortEnterCritical                    #  303: 01e9ffc0
                                                               #  307: 0000
.Lbr008:    memw                                               #  309: c02000
            l32i         a6, a13, 0x200 /* [0x3ff00000] */     #  30c: 622d80
            and          a6, a6, a14                           #  30f: e06610
            memw                                               #  312: c02000
            s32i         a6, a13, 0x200 /* a6 -> [0x3ff00000] */ #  315: 626d80
            memw                                               #  318: c02000
            l32i         a5, a13, 0x200 /* [0x3ff00000] */     #  31b: 522d80
            bbsi         a5, 0, .Lbr008                        #  31e: 07e5e7
            l32i         a0, sp, 20 /* [(local5)] */           #  321: 0851
.Lbr009:    mov          a2, a12                               #  323: 2d0c
            movi         a3, 0 /* 0x00000000 */                #  325: 0c03
            mov          a4, a0                                #  327: 4d00
            call0        sdk_rcUpdatePhyMode                   #  329: 01e0ffc0
                                                               #  32d: 0000
            movi         a7, sdk_NMIIrqIsOn                    #  32f: 71dbff
            l8ui         a7, a7, 0 /* [sdk_NMIIrqIsOn] */      #  332: 720700
            bnez         a7, .Lbr011                           #  335: ec57
            memw                                               #  337: c02000
            l32i         a8, a13, 0x200 /* [0x3ff00000] */     #  33a: 822d80
            movi         a9, 1 /* 0x00000001 */                #  33d: 0c19
            and          a8, a8, a14                           #  33f: e08810
            or           a8, a8, a9                            #  342: 908820
            memw                                               #  345: c02000
            s32i         a8, a13, 0x200 /* a8 -> [0x3ff00000] */ #  348: 826d80
            call0        vPortExitCritical                     #  34b: 01d9ffc0
                                                               #  34f: 0000
            j            .Lbr011                               #  351: 460200
.Lbr010:    mov          a3, a4 /* arg2 */                     #  354: 3d04
            mov          a4, a5 /* arg3 */                     #  356: 4d05
            call0        sdk_rc_disable_trc                    #  358: 01d7ffc0
                                                               #  35c: 0000
.Lbr011:    l32i         a12, sp, 8 /* [(local2)] */           #  35e: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  360: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  362: e841
            l32i         a0, sp, 4 /* [(local1)] */            #  364: 0811
            addi         sp, sp, 32 /* (top of frame) */       #  366: 12c120
            ret                                                #  369: 0df0

            .literal_position                                  #  36c: 34000000
                                                               #  370: 3c000000
                                                               #  374: 2c000000
                                                               #  378: 00000000
                                                               #  37c: 00000000
                                                               #  380: 00000000
                                                               #  384: 00000000
                                                               #  388: 00000000

# Function @ .irom0.text+0x38c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_ic_bss_info_update
            .type        sdk_ic_bss_info_update, @function
sdk_ic_bss_info_update:
            addi         sp, sp, -16 /* (local0) */            #  38c: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  38f: 0911
            bnei         a4, 2, .Lbr012                        #  391: 662412
            s32i         a5, sp, 0 /* arg3 -> [(local0)] */    #  394: 5901
            beqz         a5, .Lbr015                           #  396: bcb5
            mov          a4, a3 /* arg1 */                     #  398: 4d03
            mov          a3, a2 /* arg0 */                     #  39a: 3d02
            movi         a2, 2 /* 0x00000002 */                #  39c: 0c22
            call0        sdk_wDev_SetRxPolicy                  #  39e: 01f6ffc0
                                                               #  3a2: 0000
            j            .Lbr016                               #  3a4: 060c00
.Lbr012:    bnei         a4, 1, .Lbr013                        #  3a7: 661417
            mov          a4, a3 /* arg1 */                     #  3aa: 4d03
            mov          a3, a2 /* arg0 */                     #  3ac: 3d02
            movi         a2, 2 /* 0x00000002 */                #  3ae: 0c22
            call0        sdk_wDev_SetRxPolicy                  #  3b0: 01f3ffc0
                                                               #  3b4: 0000
            movi         a2, .Lstr006                          #  3b6: 21edff
            call0        printf                                #  3b9: 01f1ffc0
                                                               #  3bd: 0000
            j            .Lbr014                               #  3bf: c60200
.Lbr013:    call0        .Lfunc001                             #  3c2: 05dcff
            movi         a2, .Lstr007                          #  3c5: 21eaff
            call0        printf                                #  3c8: 01efffc0
                                                               #  3cc: 0000
.Lbr014:    l32i         a0, sp, 4 /* [(local1)] */            #  3ce: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  3d0: 12c110
            ret                                                #  3d3: 0df0
.Lbr015:    call0        .Lfunc001                             #  3d5: c5daff
.Lbr016:    movi         a2, .Lstr005                          #  3d8: 21e7ff
            l32i         a3, sp, 0 /* [(local0)] */            #  3db: 3801
            call0        printf                                #  3dd: 01eaffc0
                                                               #  3e1: 0000
            j            .Lbr014                               #  3e3: c6f9ff

            .literal_position                                  #  3e8: 00000000
                                                               #  3ec: 00000000

# Function @ .irom0.text+0x3f0
# Local variables/stack:
#     (local0):  word[4]   @ -0x30
#     (local1):  word      @ -0x20
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word      @ -0x10
#     (local6):  word      @ -0xc
#     (local7):  word[2]   @ -0x8
            .global      sdk_ic_set_key
            .type        sdk_ic_set_key, @function
sdk_ic_set_key:
            addi         sp, sp, -48 /* (local0) */            #  3f0: 12c1d0
            s32i         a0, sp, 28 /* a0 -> [(local4)] */     #  3f3: 0971
            s32i         a4, sp, 16 /* arg2 -> [(local1)] */   #  3f5: 4941
            s32i         a5, sp, 20 /* arg3 -> [(local2)] */   #  3f7: 5951
            s32i         a7, sp, 24 /* arg5 -> [(local3)] */   #  3f9: 7961
            s32i         a14, sp, 40 /* a14 -> [(local7)] */   #  3fb: e9a1
            s32i         a13, sp, 36 /* a13 -> [(local6)] */   #  3fd: d991
            s32i         a12, sp, 32 /* a12 -> [(local5)] */   #  3ff: c981
            mov          a13, a2 /* arg0 */                    #  401: dd02
            mov          a12, a3 /* arg1 */                    #  403: cd03
            mov          a14, a6 /* arg4 */                    #  405: ed06
            bltui        a6, 6, .Lbr017                        #  407: b66605
            call0        sdk_ic_set_ptk_alg                    #  40a: 050000
            j            .Lbr019                               #  40d: 460400
.Lbr017:    bnez         a3, .Lbr018                           #  410: ccb3
            call0        sdk_ic_set_ptk_alg                    #  412: 050000
            mov          a2, a13 /* arg0 */                    #  415: 2d0d
            mov          a3, a12 /* arg1 */                    #  417: 3d0c
            call0        sdk_ic_set_gtk_alg                    #  419: 050000
            j            .Lbr019                               #  41c: 860000
.Lbr018:    call0        sdk_ic_set_gtk_alg                    #  41f: 050000
.Lbr019:    mov          a6, a14 /* arg4 */                    #  422: 6d0e
            l32i         a4, sp, 16 /* [(local1)] */           #  424: 4841
            l32i         a5, sp, 20 /* [(local2)] */           #  426: 5851
            l32i         a7, sp, 24 /* [(local3)] */           #  428: 7861
            mov          a2, a12 /* arg1 */                    #  42a: 2d0c
            mov          a3, a13 /* arg0 */                    #  42c: 3d0d
            l8ui         a0, sp, 48 /* [(local8)] */           #  42e: 020130
            s32i         a0, sp, 0 /* [(local8)] -> [(local0)] */ #  431: 0901
            call0        sdk_wDev_Insert_KeyEntry              #  433: 01edffc0
                                                               #  437: 0000
            mov          a3, a12 /* arg1 */                    #  439: 3d0c
            mov          a2, a13 /* arg0 */                    #  43b: 2d0d
            call0        sdk_wDev_Crypto_Conf                  #  43d: 01ebffc0
                                                               #  441: 0000
            l32i         a12, sp, 32 /* [(local5)] */          #  443: c881
            l32i         a13, sp, 36 /* [(local6)] */          #  445: d891
            l32i         a14, sp, 40 /* [(local7)] */          #  447: e8a1
            l32i         a0, sp, 28 /* [(local4)] */           #  449: 0871
            addi         sp, sp, 48 /* (local8) */             #  44b: 12c130
            ret                                                #  44e: 0df0

            .literal_position                                  #  450: 00000000

# Function @ .irom0.text+0x454
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ic_remove_key
            .type        sdk_ic_remove_key, @function
sdk_ic_remove_key:
            addi         sp, sp, -16 /* (local0) */            #  454: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  457: 0901
            call0        sdk_wDev_remove_KeyEntry              #  459: 01fdffc0
                                                               #  45d: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  45f: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  461: 12c110
            ret                                                #  464: 0df0

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "del if%d\n"                          #    0: 64656c20
                                                               #    4: 69662564
                                                               #    8: 0a00
            .balign      4
.Lstr002:   .asciz       "chg if%d\n"                          #    c: 63686720
                                                               #   10: 69662564
                                                               #   14: 0a00
            .balign      4
.Lstr003:   .asciz       "add if%d\n"                          #   18: 61646420
                                                               #   1c: 69662564
                                                               #   20: 0a00
            .balign      4
.Lstr004:   .asciz       "aid %d\n"                            #   24: 61696420
                                                               #   28: 25640a00
.Lstr005:   .asciz       "bcn %d\n"                            #   2c: 62636e20
                                                               #   30: 25640a00
.Lstr006:   .asciz       "cnt \n"                              #   34: 636e7420
                                                               #   38: 0a00
            .balign      4
.Lstr007:   .asciz       "uncnt \n"                            #   3c: 756e636e
                                                               #   40: 74200a00

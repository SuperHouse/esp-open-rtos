
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000804
                                                               #    4: 0c110000
                                                               #    8: 48090000
                                                               #    c: d4090000
                                                               #   10: 00000000
                                                               #   14: 00000000

# Function @ .irom0.text+0x18
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ieee80211_ht_attach
            .type        sdk_ieee80211_ht_attach, @function
sdk_ieee80211_ht_attach:
            movi         a3, 0 /* 0x00000000 */                #   18: 0c03
            movi         a7, 28 /* 0x0000001c */               #   1a: 1cc7
            movi         a6, 0x04080000                        #   1c: 61f9ff
            movi         a5, 700 /* 0x000002bc */              #   1f: 52a2bc
            addi         sp, sp, -16 /* (local0) */            #   22: 12c1f0
            movi         a4, 1174 /* 0x00000496 */             #   25: 42a496
            add          a4, a2, a4 /* arg0+0x496 */           #   28: 4a42
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   2a: 0901
            add          a5, a2, a5 /* arg0+0x2bc */           #   2c: 5a52
            movi         a0, 1 /* 0x00000001 */                #   2e: 0c10
            s32i         a6, a5, 0x250 /* 0x04080000 -> [arg0+0x50c] */ #   30: 626594
            movi         a2, 3 /* 0x00000003 */                #   33: 0c32
            movi         a6, 0x0000110c                        #   35: 61f3ff
            addmi        a5, a5, 512 /* arg0+0x4bc */          #   38: 52d502
            s16i         a7, a5, 86 /* 0x001c -> [arg0+0x512] */ #   3b: 72552b
            s16i         a3, a5, 88 /* 0x0000 -> [arg0+0x514] */ #   3e: 32552c
            s16i         a6, a5, 84 /* 0x110c -> [arg0+0x510] */ #   41: 62552a
            s8i          a0, a4, 128 /* 0x01 -> [arg0+0x516] */ #   44: 024480
            s8i          a0, a4, 129 /* 0x01 -> [arg0+0x517] */ #   47: 024481
            movi         a4, .Lfunc008                         #   4a: 41efff
            call0        sdk_ieee80211_recv_action_register    #   4d: 01f0ffc0
                                                               #   51: 0000
            movi         a2, 3 /* 0x00000003 */                #   53: 0c32
            movi         a3, 1 /* 0x00000001 */                #   55: 0c13
            movi         a4, .Lfunc009                         #   57: 41edff
            call0        sdk_ieee80211_send_action_register    #   5a: 01eeffc0
                                                               #   5e: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   60: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   62: 12c110
            ret                                                #   65: 0df0

            .literal_position                                  #   68: 400c0000

# Function @ .irom0.text+0x6c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_ieee80211_ht_node_init
            .type        sdk_ieee80211_ht_node_init, @function
sdk_ieee80211_ht_node_init:
            addi         sp, sp, -16 /* (local0) */            #   6c: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   6f: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   71: 0901
            l32i         a0, a2, 72 /* [arg0+0x48] */          #   73: 022212
            mov          a12, a2 /* arg0 */                    #   76: cd02
            bbci         a0, 6, .Lbr001                        #   78: 676002
            call0        sdk_ieee80211_ht_node_cleanup         #   7b: 050000
.Lbr001:    movi         a0, 0 /* 0x00000000 */                #   7e: 0c00
            extui        a4, a12, 16, 16                       #   80: c040f5
            movi         a2, 206 /* 0x000000ce */              #   83: 22a0ce
            add          a2, a12, a2 /* arg0+0xce */           #   86: 2a2c
.Lbr002:    s16i         a12, a2, 122                          #   88: c2523d
            s16i         a4, a2, 124                           #   8b: 42523e
            s8i          a0, a2, 128                           #   8e: 024280
            addi         a2, a2, 80                            #   91: 22c250
            addi         a0, a0, 1                             #   94: 1b00
            bnei         a0, 4, .Lbr002                        #   96: 6640ee
            movi         a4, 0x00000c40                        #   99: 41f3ff
            l32i         a3, a12, 72 /* [arg0+0x48] */         #   9c: 322c12
            l32i         a0, sp, 0 /* [(local0)] */            #   9f: 0801
            or           a3, a3, a4                            #   a1: 403320
            s32i         a3, a12, 72 /* a3 -> [arg0+0x48] */   #   a4: 326c12
            l32i         a12, sp, 4 /* [(local1)] */           #   a7: c811
            addi         sp, sp, 16 /* (top of frame) */       #   a9: 12c110
            ret                                                #   ac: 0df0

            .balign      4
# Function @ .irom0.text+0xb0
            .global      sdk_ieee80211_ht_node_cleanup
            .type        sdk_ieee80211_ht_node_cleanup, @function
sdk_ieee80211_ht_node_cleanup:
            movi         a5, -65 /* 0xffffffbf */              #   b0: 52afbf
            l32i         a4, a2, 72 /* [arg0+0x48] */          #   b3: 422212
            movi         a3, 0 /* 0x00000000 */                #   b6: 0c03
            s16i         a3, a2, 192 /* 0x0000 -> [arg0+0xc0] */ #   b8: 325260
            and          a4, a4, a5                            #   bb: 504410
            s32i         a4, a2, 72 /* a4 -> [arg0+0x48] */    #   be: 426212
            ret           /* arg0 */                           #   c1: 0df0

            .literal_position                                  #   c4: fffff8ff
                                                               #   c8: 00000000

# Function @ .irom0.text+0xcc
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc001:  addi         sp, sp, -16 /* (local0) */            #   cc: 12c1f0
            movi         a5, 0xfff8ffff                        #   cf: 51fdff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   d2: 0901
            l32i         a0, a3, 0 /* [arg1] */                #   d4: 0803
            l16ui        a3, a3, 4 /* [arg1+0x4] */            #   d6: 321302
            and          a0, a0, a5                            #   d9: 500010
            or           a4, a4, a0                            #   dc: 004420
            call0        sdk_ieee80211_find_channel            #   df: 01faffc0
                                                               #   e3: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   e5: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   e7: 12c110
            ret                                                #   ea: 0df0

# Function @ .irom0.text+0xec
            .global      sdk_ieee80211_parse_htcap
            .type        sdk_ieee80211_parse_htcap, @function
sdk_ieee80211_parse_htcap:
            l32i         a6, a2, 72 /* [arg0+0x48] */          #   ec: 622212
            l8ui         a4, a3, 0 /* [arg1] */                #   ef: 420300
            movi         a5, 221 /* 0x000000dd */              #   f2: 52a0dd
            bne          a4, a5, .Lbr003                       #   f5: 57940d
            addi         a3, a3, 4 /* arg1+0x4 */              #   f8: 4b33
            movi         a7, 128 /* 0x00000080 */              #   fa: 72a080
            or           a7, a6, a7                            #   fd: 707620
            s32i         a7, a2, 72 /* a7 -> [arg0+0x48] */    #  100: 726212
            j            .Lbr004                               #  103: c60100
.Lbr003:    movi         a8, 64 /* 0x00000040 */               #  106: 4c08
            or           a8, a6, a8                            #  108: 808620
            s32i         a8, a2, 72 /* a8 -> [arg0+0x48] */    #  10b: 826212
.Lbr004:    l8ui         a11, a3, 3                            #  10e: b20303
            l8ui         a10, a3, 2                            #  111: a20302
            slli         a11, a11, 8                           #  114: 80bb11
            or           a10, a10, a11                         #  117: b0aa20
            s16i         a10, a2, 192 /* a10 -> [arg0+0xc0] */ #  11a: a25260
            l8ui         a9, a3, 4                             #  11d: 920304
            s8i          a9, a2, 194 /* a9 -> [arg0+0xc2] */   #  120: 9242c2
            ret           /* arg0 */                           #  123: 0df0

            .balign      4
# Function @ .irom0.text+0x128
.Lfunc002:  l8ui         a7, a3, 2 /* [arg1+0x2] */            #  128: 720302
            s8i          a7, a2, 195 /* [arg1+0x2] -> [arg0+0xc3] */ #  12b: 7242c3
            l8ui         a6, a3, 3 /* [arg1+0x3] */            #  12e: 620303
            extui        a6, a6, 0, 2                          #  131: 606014
            s8i          a6, a2, 196 /* a6 -> [arg0+0xc4] */   #  134: 6242c4
            l8ui         a5, a3, 4 /* [arg1+0x4] */            #  137: 520304
            extui        a5, a5, 0, 2                          #  13a: 505014
            s8i          a5, a2, 197 /* a5 -> [arg0+0xc5] */   #  13d: 5242c5
            l8ui         a4, a3, 6 /* [arg1+0x6] */            #  140: 420306
            extui        a4, a4, 0, 7                          #  143: 404064
            s8i          a4, a2, 198 /* a4 -> [arg0+0xc6] */   #  146: 4242c6
            ret           /* arg0 */                           #  149: 0df0

            .literal_position                                  #  14c: fffff8ff
                                                               #  150: 00000600
                                                               #  154: 00000000
                                                               #  158: 00000000
                                                               #  15c: 00000100
                                                               #  160: 00000000

# Function @ .irom0.text+0x164
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
.Lfunc003:  movi         a4, 0xfff8ffff                        #  164: 41faff
            addi         sp, sp, -16 /* (local0) */            #  167: 12c1f0
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  16a: e931
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  16c: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  16e: d921
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  170: 0901
            mov          a13, a3 /* arg1 */                    #  172: dd03
            l32i         a0, a2, 188 /* [arg0+0xbc] */         #  174: 02222f
            mov          a12, a2 /* arg0 */                    #  177: cd02
            l32i         a2, a0, 0 /* [[arg0+0xbc]] */         #  179: 2800
            movi         a14, 0x00060000                       #  17b: e1f5ff
            and          a4, a2, a4                            #  17e: 404210
            or           a4, a3, a4                            #  181: 404320
            beq          a4, a2, .Lbr007                       #  184: 27142b
            movi         a2, sdk_g_ic                          #  187: 21f3ff
            l16ui        a3, a0, 4 /* [[arg0+0xbc]+0x4] */     #  18a: 321002
            call0        sdk_ieee80211_find_channel            #  18d: 01f4ffc0
                                                               #  191: 0000
            bnez         a2, .Lbr005                           #  193: ccd2
            bnone        a14, a13, .Lbr005                     #  195: d70e0b
            movi         a2, sdk_g_ic                          #  198: 21f0ff
            l32i         a3, a12, 188 /* [arg0+0xbc] */        #  19b: 322c2f
            movi         a4, 0x00010000                        #  19e: 41efff
            call0        .Lfunc001                             #  1a1: 85f2ff
.Lbr005:    l32i         a0, a12, 188 /* [arg0+0xbc] */        #  1a4: 022c2f
            beqz         a2, .Lbr006                           #  1a7: 8c62
            beq          a0, a2, .Lbr006                       #  1a9: 271004
            mov          a0, a2                                #  1ac: 0d02
            s32i         a2, a12, 188 /* a2 -> [arg0+0xbc] */  #  1ae: 226c2f
.Lbr006:    l32i         a2, a0, 0                             #  1b1: 2800
.Lbr007:    l32i         a0, sp, 0 /* [(local0)] */            #  1b3: 0801
            l32i         a13, sp, 8 /* [(local2)] */           #  1b5: d821
            movi         a6, 40 /* 0x00000028 */               #  1b7: 2c86
            movi         a5, 20 /* 0x00000014 */               #  1b9: 1c45
            and          a7, a2, a14                           #  1bb: e07210
            movnez       a5, a6, a7                            #  1be: 705693
            l32i         a14, sp, 12 /* [(local3)] */          #  1c1: e831
            s8i          a5, a12, 199 /* a5 -> [arg0+0xc7] */  #  1c3: 524cc7
            l32i         a12, sp, 4 /* [(local1)] */           #  1c6: c811
            addi         sp, sp, 16 /* (top of frame) */       #  1c8: 12c110
            ret                                                #  1cb: 0df0

            .literal_position                                  #  1d0: 00000000
                                                               #  1d4: 00100000
                                                               #  1d8: ffdfffff
                                                               #  1dc: ffefffff
                                                               #  1e0: ff7ffeff
                                                               #  1e4: 00000000
                                                               #  1e8: 00800000
                                                               #  1ec: 00000100
                                                               #  1f0: 00000200
                                                               #  1f4: 00000400
                                                               #  1f8: fffff8ff
                                                               #  1fc: 00400000
                                                               #  200: ffbfffff
                                                               #  204: 00200000

# Function @ .irom0.text+0x208
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .global      sdk_ieee80211_ht_updateparams
            .type        sdk_ieee80211_ht_updateparams, @function
sdk_ieee80211_ht_updateparams:
            addi         sp, sp, -32 /* (local0) */            #  208: 12c1e0
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  20b: e931
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  20d: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  20f: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  211: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  213: c911
            mov          a13, a4 /* arg2 */                    #  215: dd04
            mov          a12, a2 /* arg0 */                    #  217: cd02
            call0        sdk_ieee80211_parse_htcap             #  219: 050000
            l32i         a0, a12, 72 /* [arg0+0x48] */         #  21c: 022c12
            movi         a14, sdk_g_ic+0x238                   #  21f: e1ecff
            l16ui        a2, a12, 192 /* [arg0+0xc0] */        #  222: 221c60
            addmi        a3, a14, 512 /* sdk_g_ic+0x438 */     #  225: 32de02
            l16ui        a3, a3, 216 /* [sdk_g_ic+0x510] */    #  228: 32136c
            movi         a8, 12 /* 0x0000000c */               #  22b: 0cc8
            bnone        a8, a3, .Lbr010                       #  22d: 370823
            movi         a4, 0x00001000                        #  230: 41e9ff
            movi         a3, 0xffffdfff                        #  233: 31e9ff
            and          a7, a2, a8                            #  236: 807210
            bany         a2, a8, .Lbr008                       #  239: 878202
            j            .Lbr018                               #  23c: c63100
.Lbr008:    addi         a5, a7, -4                            #  23f: 52c7fc
            beqz         a5, .Lbr019                           #  242: 16a50c
            movi         a4, 0xffffefff                        #  245: 41e5ff
            and          a0, a0, a4                            #  248: 400010
            s32i         a0, a12, 72 /* a0 -> [arg0+0x48] */   #  24b: 026c12
            and          a0, a0, a3                            #  24e: 300010
.Lbr009:    s32i         a0, a12, 72 /* a0 -> [arg0+0x48] */   #  251: 026c12
.Lbr010:    movi         a15, 0x00010000                       #  254: f1e6ff
            movi         a5, 0xfffe7fff                        #  257: 51e2ff
            movi         a3, sdk_g_ic+0x200                    #  25a: 31e2ff
            and          a0, a0, a5                            #  25d: 500010
            s32i         a0, a12, 72 /* a0 -> [arg0+0x48] */   #  260: 026c12
            bbci         a2, 5, .Lbr011                        #  263: 57620e
            l32i         a6, a3, 0x30c /* [sdk_g_ic+0x50c] */  #  266: 6223c3
            movi         a7, 0x00008000                        #  269: 71dfff
            bbci         a6, 26, .Lbr011                       #  26c: a77605
            or           a0, a0, a7                            #  26f: 700020
            s32i         a0, a12, 72 /* a0 -> [arg0+0x48] */   #  272: 026c12
.Lbr011:    bbci         a2, 6, .Lbr012                        #  275: 67620b
            l32i         a8, a3, 0x30c /* [sdk_g_ic+0x50c] */  #  278: 8223c3
            or           a9, a0, a15                           #  27b: f09020
            bbci         a8, 27, .Lbr012                       #  27e: b77802
            s32i         a9, a12, 72 /* a9 -> [arg0+0x48] */   #  281: 926c12
.Lbr012:    l8ui         a10, a13, 0 /* [arg2] */              #  284: a20d00
            movi         a11, 221 /* 0x000000dd */             #  287: b2a0dd
            bne          a10, a11, .Lbr013                     #  28a: b79a01
            addi         a13, a13, 4 /* arg2+0x4 */            #  28d: 4bdd
.Lbr013:    mov          a2, a12 /* arg0 */                    #  28f: 2d0c
            mov          a3, a13                               #  291: 3d0d
            call0        .Lfunc002                             #  293: 45e9ff
            l8ui         a2, a13, 3                            #  296: 220d03
            l32i         a0, a14, 0x2d4 /* [sdk_g_ic+0x50c] */ #  299: 022eb5
            movi         a3, 0 /* 0x00000000 */                #  29c: 0c03
            extui        a4, a0, 19, 1                         #  29e: 004305
            movnez       a3, a15, a4                           #  2a1: 403f93
            bbci         a2, 2, .Lbr015                        #  2a4: 276217
            bbci         a0, 24, .Lbr015                       #  2a7: 877014
            l8ui         a0, a12, 196 /* [arg0+0xc4] */        #  2aa: 020cc4
            movi         a5, 0x00040000                        #  2ad: 51d1ff
            bnei         a0, 1, .Lbr014                        #  2b0: 661005
            movi         a3, 0x00020000                        #  2b3: 31cfff
            j            .Lbr015                               #  2b6: 460100
.Lbr014:    addi         a6, a0, -3 /* [arg0+0xc4]-0x3 */      #  2b9: 62c0fd
            moveqz       a3, a5, a6                            #  2bc: 603583
.Lbr015:    l32i         a8, a12, 188 /* [arg0+0xbc] */        #  2bf: 822c2f
            movi         a9, 0xfff8ffff                        #  2c2: 91cdff
            l32i         a7, a8, 0 /* [[arg0+0xbc]] */         #  2c5: 7808
            mov          a2, a12 /* arg0 */                    #  2c7: 2d0c
            and          a7, a7, a9                            #  2c9: 907710
            or           a7, a3, a7                            #  2cc: 707320
            s32i         a7, a8, 0 /* a7 -> [[arg0+0xbc]] */   #  2cf: 7908
            call0        .Lfunc003                             #  2d1: 05e9ff
            l32i         a15, sp, 16 /* [(local4)] */          #  2d4: f841
            l8ui         a10, a13, 3                           #  2d6: a20d03
            l32i         a13, sp, 8 /* [(local2)] */           #  2d9: d821
            bbci         a10, 3, .Lbr017                       #  2db: 376a1c
            l32i         a11, a14, 0x2d4 /* [sdk_g_ic+0x50c] */ #  2de: b22eb5
            movi         a2, 0x00004000                        #  2e1: 21c6ff
            bbci         a11, 29, .Lbr017                      #  2e4: d77b13
            l32i         a0, a12, 72 /* [arg0+0x48] */         #  2e7: 022c12
            or           a0, a0, a2                            #  2ea: 200020
.Lbr016:    s32i         a0, a12, 72 /* a0 -> [arg0+0x48] */   #  2ed: 026c12
            l32i         a14, sp, 12 /* [(local3)] */          #  2f0: e831
            l32i         a12, sp, 4 /* [(local1)] */           #  2f2: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  2f4: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  2f6: 12c120
            ret                                                #  2f9: 0df0
.Lbr017:    movi         a2, 0xffffbfff                        #  2fb: 21c1ff
            l32i         a0, a12, 72 /* [arg0+0x48] */         #  2fe: 022c12
            and          a0, a0, a2                            #  301: 200010
            j            .Lbr016                               #  304: 46f9ff
.Lbr018:    or           a0, a0, a4                            #  307: 400020
            and          a0, a0, a3                            #  30a: 300010
            j            .Lbr009                               #  30d: 06d0ff
.Lbr019:    movi         a3, 0x00002000                        #  310: 31bdff
            or           a0, a0, a4                            #  313: 400020
            or           a0, a0, a3                            #  316: 300020
            j            .Lbr009                               #  319: 06cdff

            .literal_position                                  #  31c: 00000000
                                                               #  320: 00000001
                                                               #  324: 00000000
                                                               #  328: 00000000

# Function @ .irom0.text+0x32c
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
            .global      sdk_ieee80211_setup_htrates
            .type        sdk_ieee80211_setup_htrates, @function
sdk_ieee80211_setup_htrates:
            addi         sp, sp, -48 /* (local0) */            #  32c: 12c1d0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  32f: c921
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  331: d931
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  333: 0911
            s32i         a2, sp, 36 /* arg0 -> [(local9)] */   #  335: 2991
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  337: e941
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   #  339: f951
            mov          a14, a3 /* arg1 */                    #  33b: ed03
            mov          a15, a2 /* arg0 */                    #  33d: fd02
            movi         a3, -1 /* 0xffffffff */               #  33f: 7cf3
            movi         a2, sdk_g_ic+0x14c                    #  341: 21f6ff
            s32i         a2, sp, 24 /* sdk_g_ic+0x14c -> [(local6)] */ #  344: 2961
            l8ui         a0, a2, 130 /* [sdk_g_ic+0x1ce] */    #  346: 020282
            l32i         a2, a2, 124 /* [sdk_g_ic+0x1c8] */    #  349: 22221f
            addx8        a3, a0, a3                            #  34c: 3030b0
            s32i         a3, sp, 32 /* a3 -> [(local8)] */     #  34f: 3981
            bbci         a2, 23, .Lbr022                       #  351: 77721b
            movi         a3, 38 /* 0x00000026 */               #  354: 2c63
            l32i         a2, sp, 0 /* [(local0)] */            #  356: 2801
            bgeui        a0, 2, .Lbr020                        #  358: f62001
            mov          a3, a2 /* [(local0)] */               #  35b: 3d02
.Lbr020:    movi         a2, 52 /* 0x00000034 */               #  35d: 3c42
            bgeui        a0, 3, .Lbr021                        #  35f: f63001
            mov          a2, a3                                #  362: 2d03
.Lbr021:    movi         a3, 76 /* 0x0000004c */               #  364: 4cc3
            s32i         a3, sp, 28 /* 0x0000004c -> [(local7)] */ #  366: 3971
            bgeui        a0, 4, .Lbr023                        #  368: f64008
            s32i         a2, sp, 28 /* a2 -> [(local7)] */     #  36b: 2971
            j            .Lbr023                               #  36d: c60000
.Lbr022:    movi         a5, 0 /* 0x00000000 */                #  370: 0c05
            s32i         a5, sp, 28 /* 0x00000000 -> [(local7)] */ #  372: 5971
.Lbr023:    movi         a3, 0 /* 0x00000000 */                #  374: 0c03
            movi         a4, 128 /* 0x00000080 */              #  376: 42a080
            movi         a2, 200 /* 0x000000c8 */              #  379: 22a0c8
            add          a2, a15, a2 /* arg0+0xc8 */           #  37c: 2a2f
            call0        memset                                #  37e: 01e9ffc0
                                                               #  382: 0000
            beqz         a14, .Lbr030                          #  384: 164e06
            movi         a12, 0 /* 0x00000000 */               #  387: 0c0c
            l8ui         a3, a14, 0 /* [arg1] */               #  389: 320e00
            movi         a4, 221 /* 0x000000dd */              #  38c: 42a0dd
            bne          a3, a4, .Lbr024                       #  38f: 479301
            addi         a14, a14, 4 /* arg1+0x4 */            #  392: 4bee
.Lbr024:    movi         a13, 127 /* 0x0000007f */             #  394: d2a07f
.Lbr025:    mov          a2, a12                               #  397: 2d0c
            movi         a3, 8 /* 0x00000008 */                #  399: 0c83
            call0        __modsi3                              #  39b: 01e3ffc0
                                                               #  39f: 0000
            addi         a6, a12, 7                            #  3a1: 7b6c
            movgez       a6, a12, a12                          #  3a3: c06cb3
            srai         a6, a6, 3                             #  3a6: 606321
            add          a6, a14, a6                           #  3a9: 6a6e
            l8ui         a6, a6, 5                             #  3ab: 620605
            ssr          a2                                    #  3ae: 000240
            sra          a6, a6                                #  3b1: 6060b1
            bbci         a6, 0, .Lbr029                        #  3b4: 07662f
            l8ui         a0, a15, 200 /* [arg0+0xc8] */        #  3b7: 020fc8
            beq          a0, a13, .Lbr030                      #  3ba: d7102e
            bgei         a12, 32, .Lbr026                      #  3bd: e6cc04
            l32i         a7, sp, 32 /* [(local8)] */           #  3c0: 7881
            blt          a7, a12, .Lbr029                      #  3c2: c72721
.Lbr026:    bnei         a12, 32, .Lbr027                      #  3c5: 66cc0a
            l32i         a8, sp, 24 /* [(local6)] */           #  3c8: 8861
            movi         a9, 0x01000000                        #  3ca: 91d5ff
            l32i         a8, a8, 124 /* [[(local6)]+0x7c] */   #  3cd: 82281f
            bnone        a8, a9, .Lbr029                       #  3d0: 970813
.Lbr027:    movi         a9, 32 /* 0x00000020 */               #  3d3: 2c09
            bge          a9, a12, .Lbr028                      #  3d5: c7a904
            l32i         a10, sp, 28 /* [(local7)] */          #  3d8: a871
            blt          a10, a12, .Lbr029                     #  3da: c72a09
.Lbr028:    add          a11, a0, a15                          #  3dd: fab0
            addi         a2, a0, 1 /* [arg0+0xc8]+0x1 */       #  3df: 1b20
            s8i          a2, a15, 200 /* [arg0+0xc8]+0x1 -> [arg0+0xc8] */ #  3e1: 224fc8
            s8i          a12, a11, 201                         #  3e4: c24bc9
.Lbr029:    addi         a12, a12, 1                           #  3e7: 1bcc
            bne          a12, a13, .Lbr025                     #  3e9: d79caa
.Lbr030:    movi         a2, 0 /* 0x00000000 */                #  3ec: 0c02
            l32i         a12, sp, 8 /* [(local2)] */           #  3ee: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  3f0: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  3f2: e841
            l32i         a15, sp, 20 /* [(local5)] */          #  3f4: f851
            l32i         a0, sp, 4 /* [(local1)] */            #  3f6: 0811
            addi         sp, sp, 48 /* (top of frame) */       #  3f8: 12c130
            ret           /* 0x00000000 */                     #  3fb: 0df0

            .literal_position                                  #  400: 00000000

# Function @ .irom0.text+0x404
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .global      sdk_ieee80211_setup_basic_htrates
            .type        sdk_ieee80211_setup_basic_htrates, @function
sdk_ieee80211_setup_basic_htrates:
            addi         sp, sp, -32 /* (local0) */            #  404: 12c1e0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  407: c911
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  409: e931
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  40b: f941
            s32i         a3, sp, 20 /* arg1 -> [(local5)] */   #  40d: 3951
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  40f: d921
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  411: 0901
            mov          a13, a2 /* arg0 */                    #  413: dd02
            l8ui         a0, a3, 0 /* [arg1] */                #  415: 020300
            movi         a2, 221 /* 0x000000dd */              #  418: 22a0dd
            bne          a0, a2, .Lbr031                       #  41b: 279003
            addi         a2, a3, 4 /* arg1+0x4 */              #  41e: 4b23
            s32i         a2, sp, 20 /* arg1+0x4 -> [(local5)] */ #  420: 2951
.Lbr031:    l8ui         a12, a13, 200 /* [arg0+0xc8] */       #  422: c20dc8
            beqz         a12, .Lbr036                          #  425: 16cc04
            movi         a14, 0 /* 0x00000000 */               #  428: 0c0e
            movi         a15, 128 /* 0x00000080 */             #  42a: f2a080
.Lbr032:    mov          a2, a14                               #  42d: 2d0e
            movi         a3, 8 /* 0x00000008 */                #  42f: 0c83
            call0        __modsi3                              #  431: 01f3ffc0
                                                               #  435: 0000
            movi         a0, 127 /* 0x0000007f */              #  437: 02a07f
            l32i         a4, sp, 20 /* [(local5)] */           #  43a: 4851
            addi         a5, a14, 7                            #  43c: 7b5e
            movgez       a5, a14, a14                          #  43e: e05eb3
            srai         a5, a5, 3                             #  441: 505321
            add          a4, a4, a5                            #  444: 5a44
            l8ui         a4, a4, 8                             #  446: 420408
            ssr          a2                                    #  449: 000240
            sra          a4, a4                                #  44c: 4040b1
            bbci         a4, 0, .Lbr035                        #  44f: 07641d
            blti         a12, 1, .Lbr035                       #  452: a61c1a
            movi         a2, 0 /* 0x00000000 */                #  455: 0c02
.Lbr033:    add          a7, a2, a13                           #  457: da72
            l8ui         a6, a7, 201                           #  459: 6207c9
            addi         a2, a2, 1                             #  45c: 1b22
            extui        a8, a6, 0, 7                          #  45e: 608064
            bne          a14, a8, .Lbr034                      #  461: 879e08
            or           a9, a6, a15                           #  464: f09620
            s8i          a9, a7, 201                           #  467: 9247c9
            l8ui         a12, a13, 200 /* [arg0+0xc8] */       #  46a: c20dc8
.Lbr034:    blt          a2, a12, .Lbr033                      #  46d: c722e6
.Lbr035:    addi         a14, a14, 1                           #  470: 1bee
            bne          a14, a0, .Lbr032                      #  472: 079eb7
.Lbr036:    l32i         a12, sp, 4 /* [(local1)] */           #  475: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  477: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  479: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  47b: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  47d: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  47f: 12c120
            ret                                                #  482: 0df0

            .literal_position                                  #  484: 00000000
                                                               #  488: 00000000
                                                               #  48c: 00000000
                                                               #  490: 00000000

# Function @ .irom0.text+0x494
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
.Lfunc004:  movi         a7, 1174 /* 0x00000496 */             #  494: 72a496
            movi         a5, 332 /* 0x0000014c */              #  497: 52a14c
            addi         sp, sp, -32 /* (local0) */            #  49a: 12c1e0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  49d: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  49f: c911
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  4a1: f941
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  4a3: e931
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  4a5: 0901
            add          a5, a2, a5 /* arg0+0x14c */           #  4a7: 5a52
            s32i         a5, sp, 20 /* arg0+0x14c -> [(local5)] */ #  4a9: 5951
            movi         a0, 1 /* 0x00000001 */                #  4ab: 0c10
            mov          a14, a3 /* arg1 */                    #  4ad: ed03
            movi         a15, 384 /* 0x00000180 */             #  4af: f2a180
            add          a15, a2, a15 /* arg0+0x180 */         #  4b2: faf2
            add          a2, a2, a7 /* arg0+0x496 */           #  4b4: 7a22
            l8ui         a6, a2, 128 /* [arg0+0x516] */        #  4b6: 620280
            s8i          a6, a5, 130 /* [arg0+0x516] -> [arg0+0x1ce] */ #  4b9: 624582
            l8ui         a4, a2, 129 /* [arg0+0x517] */        #  4bc: 420281
            s8i          a4, a5, 129 /* [arg0+0x517] -> [arg0+0x1cd] */ #  4bf: 424581
            l8ui         a3, a15, 77 /* [arg0+0x1cd] */        #  4c2: 320f4d
            s32i         a2, sp, 24 /* arg0+0x496 -> [(local6)] */ #  4c5: 2961
            slli         a3, a3, 3                             #  4c7: d03311
            blti         a3, 1, .Lbr038                        #  4ca: a61333
            movi         a12, 0 /* 0x00000000 */               #  4cd: 0c0c
.Lbr037:    mov          a2, a12                               #  4cf: 2d0c
            movi         a3, 8 /* 0x00000008 */                #  4d1: 0c83
            addi         a13, a12, 7                           #  4d3: 7bdc
            movgez       a13, a12, a12                         #  4d5: c0dcb3
            srai         a13, a13, 3                           #  4d8: d0d321
            add          a13, a14, a13                         #  4db: dade
            call0        __modsi3                              #  4dd: 01e9ffc0
                                                               #  4e1: 0000
            l8ui         a3, a13, 0                            #  4e3: 320d00
            ssl          a2                                    #  4e6: 001240
            movi         a0, 1 /* 0x00000001 */                #  4e9: 0c10
            sll          a4, a0                                #  4eb: 0040a1
            or           a3, a3, a4                            #  4ee: 403320
            s8i          a3, a13, 0                            #  4f1: 324d00
            l8ui         a2, a15, 77 /* [arg0+0x1cd] */        #  4f4: 220f4d
            addi         a12, a12, 1                           #  4f7: 1bcc
            slli         a2, a2, 3                             #  4f9: d02211
            blt          a12, a2, .Lbr037                      #  4fc: 272ccf
            l32i         a2, sp, 24 /* [(local6)] */           #  4ff: 2861
.Lbr038:    l16ui        a5, a2, 120                           #  501: 52123c
            l16ui        a6, a2, 118                           #  504: 62123b
            slli         a5, a5, 16                            #  507: 005511
            l32i         a2, sp, 20 /* [(local5)] */           #  50a: 2851
            or           a5, a5, a6                            #  50c: 605520
            l32i         a2, a2, 124 /* [[(local5)]+0x7c] */   #  50f: 22221f
            bbci         a5, 24, .Lbr039                       #  512: 877510
            bbci         a2, 22, .Lbr039                       #  515: 67720d
            l8ui         a3, a14, 4 /* [arg1+0x4] */           #  518: 320e04
            l32i         a2, sp, 20 /* [(local5)] */           #  51b: 2851
            or           a3, a3, a0                            #  51d: 003320
            s8i          a3, a14, 4 /* a3 -> [arg1+0x4] */     #  520: 324e04
            l32i         a2, a2, 124 /* [[(local5)]+0x7c] */   #  523: 22221f
.Lbr039:    extui        a4, a2, 21, 1                         #  526: 204505
            beqz         a4, .Lbr045                           #  529: 16940a
            l32i         a2, sp, 20 /* [(local5)] */           #  52c: 2851
            movi         a12, 33 /* 0x00000021 */              #  52e: 2c1c
            l8ui         a2, a2, 129 /* [[(local5)]+0x81] */   #  530: 220281
            movi         a15, 39 /* 0x00000027 */              #  533: 2c7f
            bltui        a2, 2, .Lbr041                        #  535: b6222e
.Lbr040:    mov          a2, a12                               #  538: 2d0c
            movi         a3, 8 /* 0x00000008 */                #  53a: 0c83
            addi         a13, a12, 7                           #  53c: 7bdc
            movgez       a13, a12, a12                         #  53e: c0dcb3
            srai         a13, a13, 3                           #  541: d0d321
            add          a13, a14, a13                         #  544: dade
            call0        __modsi3                              #  546: 01d0ffc0
                                                               #  54a: 0000
            addi         a12, a12, 1                           #  54c: 1bcc
            ssl          a2                                    #  54e: 001240
            movi         a0, 1 /* 0x00000001 */                #  551: 0c10
            l8ui         a2, a13, 0                            #  553: 220d00
            sll          a3, a0                                #  556: 0030a1
            or           a2, a2, a3                            #  559: 302220
            s8i          a2, a13, 0                            #  55c: 224d00
            bne          a12, a15, .Lbr040                     #  55f: f79cd5
            l32i         a2, sp, 20 /* [(local5)] */           #  562: 2851
            l8ui         a2, a2, 129 /* [[(local5)]+0x81] */   #  564: 220281
.Lbr041:    bltui        a2, 3, .Lbr043                        #  567: b6322d
            movi         a15, 53 /* 0x00000035 */              #  56a: 3c5f
            movi         a12, 39 /* 0x00000027 */              #  56c: 2c7c
.Lbr042:    mov          a2, a12                               #  56e: 2d0c
            movi         a3, 8 /* 0x00000008 */                #  570: 0c83
            addi         a13, a12, 7                           #  572: 7bdc
            movgez       a13, a12, a12                         #  574: c0dcb3
            srai         a13, a13, 3                           #  577: d0d321
            add          a13, a14, a13                         #  57a: dade
            call0        __modsi3                              #  57c: 01c4ffc0
                                                               #  580: 0000
            addi         a12, a12, 1                           #  582: 1bcc
            ssl          a2                                    #  584: 001240
            movi         a0, 1 /* 0x00000001 */                #  587: 0c10
            l8ui         a2, a13, 0                            #  589: 220d00
            sll          a3, a0                                #  58c: 0030a1
            or           a2, a2, a3                            #  58f: 302220
            s8i          a2, a13, 0                            #  592: 224d00
            bne          a12, a15, .Lbr042                     #  595: f79cd5
.Lbr043:    l32i         a2, sp, 20 /* [(local5)] */           #  598: 2851
            l8ui         a2, a2, 130 /* [[(local5)]+0x82] */   #  59a: 220282
            bltui        a2, 4, .Lbr046                        #  59d: b6423a
            movi         a12, 53 /* 0x00000035 */              #  5a0: 3c5c
            movi         a15, 77 /* 0x0000004d */              #  5a2: 4cdf
.Lbr044:    mov          a2, a12                               #  5a4: 2d0c
            movi         a3, 8 /* 0x00000008 */                #  5a6: 0c83
            addi         a13, a12, 7                           #  5a8: 7bdc
            movgez       a13, a12, a12                         #  5aa: c0dcb3
            srai         a13, a13, 3                           #  5ad: d0d321
            add          a13, a14, a13                         #  5b0: dade
            call0        __modsi3                              #  5b2: 01b7ffc0
                                                               #  5b6: 0000
            addi         a12, a12, 1                           #  5b8: 1bcc
            ssl          a2                                    #  5ba: 001240
            l8ui         a0, a13, 0                            #  5bd: 020d00
            movi         a2, 1 /* 0x00000001 */                #  5c0: 0c12
            sll          a2, a2                                #  5c2: 0022a1
            or           a0, a0, a2                            #  5c5: 200020
            s8i          a0, a13, 0                            #  5c8: 024d00
            bne          a12, a15, .Lbr044                     #  5cb: f79cd5
            l32i         a2, sp, 20 /* [(local5)] */           #  5ce: 2851
            l8ui         a2, a2, 130 /* [[(local5)]+0x82] */   #  5d0: 220282
            j            .Lbr046                               #  5d3: 060100
.Lbr045:    l32i         a2, sp, 20 /* [(local5)] */           #  5d6: 2851
            l8ui         a2, a2, 130 /* [[(local5)]+0x82] */   #  5d8: 220282
.Lbr046:    l32i         a12, sp, 4 /* [(local1)] */           #  5db: c811
            l32i         a0, sp, 20 /* [(local5)] */           #  5dd: 0851
            l32i         a13, sp, 8 /* [(local2)] */           #  5df: d821
            l8ui         a3, a0, 129 /* [[(local5)]+0x81] */   #  5e1: 320081
            l32i         a15, sp, 16 /* [(local4)] */          #  5e4: f841
            beq          a3, a2, .Lbr047                       #  5e6: 271317
            l32i         a4, a0, 124 /* [[(local5)]+0x7c] */   #  5e9: 42201f
            movi         a3, 3 /* 0x00000003 */                #  5ec: 0c33
            addi         a0, a2, -1 /* [[(local5)]+0x82]-0x1 */ #  5ee: 0b02
            slli         a0, a0, 2                             #  5f0: e00011
            or           a0, a0, a3                            #  5f3: 300020
            bbci         a4, 23, .Lbr048                       #  5f6: 777409
            movi         a2, 16 /* 0x00000010 */               #  5f9: 1c02
            or           a0, a0, a2                            #  5fb: 200020
            j            .Lbr048                               #  5fe: 460000
.Lbr047:    movi         a0, 1 /* 0x00000001 */                #  601: 0c10
.Lbr048:    s8i          a0, a14, 12 /* a0 -> [arg1+0xc] */    #  603: 024e0c
            l32i         a14, sp, 12 /* [(local3)] */          #  606: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  608: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  60a: 12c120
            ret                                                #  60d: 0df0

            .literal_position                                  #  610: 00000000
                                                               #  614: 00000000
                                                               #  618: 00000400
                                                               #  61c: 00000100
                                                               #  620: 00000200
                                                               #  624: fdff0000
                                                               #  628: dfff0000
                                                               #  62c: bfff0000
                                                               #  630: ffff0000
                                                               #  634: 00000200
                                                               #  638: 00000400
                                                               #  63c: fdff0000
                                                               #  640: 00000000

# Function @ .irom0.text+0x644
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
.Lfunc005:  addi         sp, sp, -48 /* (local0) */            #  644: 12c1d0
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     #  647: 0941
            s32i         a14, sp, 28 /* a14 -> [(local7)] */   #  649: e971
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   #  64b: c951
            s32i         a13, sp, 24 /* a13 -> [(local6)] */   #  64d: d961
            movi         a12, sdk_g_ic                         #  64f: c1f1ff
            mov          a13, a2 /* arg0 */                    #  652: dd02
            movi         a14, sdk_g_ic+0x23c                   #  654: e1efff
            mov          a2, a3 /* arg1 */                     #  657: 2d03
            l32i         a5, a14, 0x2d0 /* [sdk_g_ic+0x50c] */ #  659: 522eb4
            addmi        a0, a14, 512 /* sdk_g_ic+0x43c */     #  65c: 02de02
            l16ui        a0, a0, 212 /* [sdk_g_ic+0x510] */    #  65f: 02106a
            extui        a6, a5, 20, 2                         #  662: 506415
            bbci         a5, 19, .Lbr049                       #  665: 37750b
            movi         a4, 0x00040000                        #  668: 41ecff
            l32i         a3, a12, 0x1c8 /* [sdk_g_ic+0x1c8] */ #  66b: 322c72
            or           a3, a3, a4                            #  66e: 403320
            s32i         a3, a12, 0x1c8 /* a3 -> [sdk_g_ic+0x1c8] */ #  671: 326c72
.Lbr049:    extui        a9, a5, 22, 2                         #  674: 509615
            beqz         a6, .Lbr050                           #  677: 8ca6
            movi         a8, 0x00010000                        #  679: 81e8ff
            l32i         a7, a12, 0x1c8 /* [sdk_g_ic+0x1c8] */ #  67c: 722c72
            or           a7, a7, a8                            #  67f: 807720
            s32i         a7, a12, 0x1c8 /* a7 -> [sdk_g_ic+0x1c8] */ #  682: 726c72
.Lbr050:    movi         a7, 0x0000fffd                        #  685: 71e7ff
            l32i         a3, a2, 188 /* [arg1+0xbc] */         #  688: 32222f
            beqz         a9, .Lbr051                           #  68b: 8ca9
            movi         a11, 0x00020000                       #  68d: b1e4ff
            l32i         a10, a12, 0x1c8 /* [sdk_g_ic+0x1c8] */ #  690: a22c72
            or           a10, a10, a11                         #  693: b0aa20
            s32i         a10, a12, 0x1c8 /* a10 -> [sdk_g_ic+0x1c8] */ #  696: a26c72
.Lbr051:    l32i         a4, a2, 176 /* [arg1+0xb0] */         #  699: 42222c
            movi         a10, 2 /* 0x00000002 */               #  69c: 0c2a
            bnez         a4, .Lbr052                           #  69e: dc04
            extui        a6, a5, 24, 1                         #  6a0: 506805
            addmi        a8, a14, 512 /* sdk_g_ic+0x43c */     #  6a3: 82de02
            l16ui        a8, a8, 214 /* [sdk_g_ic+0x512] */    #  6a6: 82186b
            beqz         a6, .Lbr058                           #  6a9: 160609
            or           a0, a0, a10                           #  6ac: a00020
            j            .Lbr059                               #  6af: 462300
.Lbr052:    movi         a6, 0 /* 0x00000000 */                #  6b2: 0c06
            movi         a2, 0 /* 0x00000000 */                #  6b4: 0c02
            and          a8, a0, a7                            #  6b6: 708010
            l32i         a11, a3, 0 /* [[arg1+0xbc]] */        #  6b9: b803
            or           a0, a0, a10                           #  6bb: a00020
            extui        a11, a11, 17, 2                       #  6be: b0b115
            moveqz       a0, a8, a11                           #  6c1: b00883
.Lbr053:    movi         a3, 28 /* 0x0000001c */               #  6c4: 1cc3
            bbsi         a5, 26, .Lbr054                       #  6c6: a7f508
            movi         a4, 0x0000ffdf                        #  6c9: 41d7ff
            and          a0, a0, a4                            #  6cc: 400010
            j            .Lbr055                               #  6cf: 060100
.Lbr054:    movi         a7, 32 /* 0x00000020 */               #  6d2: 2c07
            or           a0, a0, a7                            #  6d4: 700020
.Lbr055:    bbci         a5, 27, .Lbr057                       #  6d7: b77557
            bbci         a0, 1, .Lbr057                        #  6da: 176054
            movi         a8, 64 /* 0x00000040 */               #  6dd: 4c08
            or           a0, a0, a8                            #  6df: 800020
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  6e2: 0901
.Lbr056:    movi         a4, 23 /* 0x00000017 */               #  6e4: 1c74
            extui        a9, a2, 0, 2                          #  6e6: 209014
            slli         a10, a6, 2                            #  6e9: e0a611
            l32i         a11, sp, 0 /* [(local0)] */           #  6ec: b801
            s8i          a11, a13, 0 /* [(local0)] -> [arg0] */ #  6ee: b24d00
            and          a10, a10, a3                          #  6f1: 30aa10
            addi         a2, a13, 3 /* arg0+0x3 */             #  6f4: 3b2d
            movi         a3, 0 /* 0x00000000 */                #  6f6: 0c03
            s32i         a2, sp, 12 /* arg0+0x3 -> [(local3)] */ #  6f8: 2931
            or           a9, a9, a10                           #  6fa: a09920
            srli         a11, a11, 8                           #  6fd: b0b841
            s8i          a11, a13, 1 /* a11 -> [arg0+0x1] */   #  700: b24d01
            s8i          a9, a13, 2 /* a9 -> [arg0+0x2] */     #  703: 924d02
            call0        memset                                #  706: 01ceffc0
                                                               #  70a: 0000
            mov          a2, a12 /* sdk_g_ic */                #  70c: 2d0c
            l32i         a3, sp, 12 /* [(local3)] */           #  70e: 3831
            call0        .Lfunc004                             #  710: 05d8ff
            l32i         a0, sp, 16 /* [(local4)] */           #  713: 0841
            addi         a2, a13, 26 /* arg0+0x1a */           #  715: 22cd1a
            addmi        a12, a14, 512 /* sdk_g_ic+0x43c */    #  718: c2de02
            l16ui        a12, a12, 216 /* [sdk_g_ic+0x514] */  #  71b: c21c6c
            s8i          a12, a13, 19 /* [sdk_g_ic+0x514] -> [arg0+0x13] */ #  71e: c24d13
            l32i         a14, sp, 28 /* [(local7)] */          #  721: e871
            srli         a12, a12, 8                           #  723: c0c841
            s8i          a12, a13, 20 /* a12 -> [arg0+0x14] */ #  726: c24d14
            l32i         a12, sp, 20 /* [(local5)] */          #  729: c851
            l32i         a13, sp, 24 /* [(local6)] */          #  72b: d861
            addi         sp, sp, 48 /* (top of frame) */       #  72d: 12c130
            ret           /* arg0+0x1a */                      #  730: 0df0
.Lbr057:    movi         a4, 0x0000ffbf                        #  732: 41beff
            and          a0, a0, a4                            #  735: 400010
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  738: 0901
            j            .Lbr056                               #  73a: 86e9ff
.Lbr058:    and          a0, a0, a7                            #  73d: 700010
.Lbr059:    srli         a11, a8, 2                            #  740: 80b241
            l8ui         a6, a2, 194 /* [arg1+0xc2] */         #  743: 6202c2
            extui        a9, a8, 0, 2                          #  746: 809014
            srli         a4, a6, 2                             #  749: 604241
            extui        a5, a6, 0, 2                          #  74c: 605014
            s32i         a5, sp, 8 /* a5 -> [(local2)] */      #  74f: 5921
            bge          a9, a5, .Lbr060                       #  751: 57a901
            s32i         a9, sp, 8 /* a9 -> [(local2)] */      #  754: 9921
.Lbr060:    s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  756: 0901
            s32i         a2, sp, 4 /* arg1 -> [(local1)] */    #  758: 2911
            movi         a5, 28 /* 0x0000001c */               #  75a: 1cc5
            and          a4, a4, a5                            #  75c: 504410
            and          a11, a11, a5                          #  75f: 50bb10
            blt          a11, a4, .Lbr061                      #  762: 472b01
            mov          a6, a8 /* [sdk_g_ic+0x512] */         #  765: 6d08
.Lbr061:    extui        a8, a6, 2, 3                          #  767: 608224
            movi         a5, 0x0000ffff                        #  76a: 51b1ff
            s32i         a8, sp, 32 /* a8 -> [(local8)] */     #  76d: 8981
            beq          a3, a5, .Lbr062                       #  76f: 571323
            mov          a2, a12 /* sdk_g_ic */                #  772: 2d0c
            movi         a4, 0x00020000                        #  774: 41b0ff
            call0        .Lfunc001                             #  777: 4595ff
            l32i         a0, sp, 0 /* [(local0)] */            #  77a: 0801
            bnez         a2, .Lbr062                           #  77c: dc62
            mov          a2, a12 /* sdk_g_ic */                #  77e: 2d0c
            l32i         a3, sp, 4 /* [(local1)] */            #  780: 3811
            movi         a4, 0x00040000                        #  782: 41adff
            l32i         a3, a3, 188 /* [[(local1)]+0xbc] */   #  785: 32232f
            call0        .Lfunc001                             #  788: 0594ff
            movi         a4, 0x0000fffd                        #  78b: 41acff
            l32i         a0, sp, 0 /* [(local0)] */            #  78e: 0801
            and          a4, a0, a4                            #  790: 404010
            moveqz       a0, a4, a2                            #  793: 200483
.Lbr062:    l32i         a2, sp, 8 /* [(local2)] */            #  796: 2821
            l32i         a6, sp, 32 /* [(local8)] */           #  798: 6881
            l32i         a5, a14, 0x2d0 /* [sdk_g_ic+0x50c] */ #  79a: 522eb4
            j            .Lbr053                               #  79d: c6c8ff

# Function @ .irom0.text+0x7a0
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ieee80211_add_htcap
            .type        sdk_ieee80211_add_htcap, @function
sdk_ieee80211_add_htcap:
            addi         sp, sp, -16 /* (local0) */            #  7a0: 12c1f0
            movi         a4, 45 /* 0x0000002d */               #  7a3: 2cd4
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  7a5: 0901
            movi         a0, 26 /* 0x0000001a */               #  7a7: 1ca0
            s8i          a4, a2, 0 /* 0x2d -> [arg0] */        #  7a9: 424200
            s8i          a0, a2, 1 /* 0x1a -> [arg0+0x1] */    #  7ac: 024201
            addi         a2, a2, 2 /* arg0+0x2 */              #  7af: 2b22
            call0        .Lfunc005                             #  7b1: 05e9ff
            l32i         a0, sp, 0 /* [(local0)] */            #  7b4: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  7b6: 12c110
            ret                                                #  7b9: 0df0

            .balign      4
# Function @ .irom0.text+0x7bc
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ieee80211_add_htcap_vendor
            .type        sdk_ieee80211_add_htcap_vendor, @function
sdk_ieee80211_add_htcap_vendor:
            movi         a4, 76 /* 0x0000004c */               #  7bc: 4cc4
            movi         a5, -112 /* 0xffffff90 */             #  7be: 52af90
            movi         a6, 0 /* 0x00000000 */                #  7c1: 0c06
            movi         a7, 30 /* 0x0000001e */               #  7c3: 1ce7
            movi         a8, -35 /* 0xffffffdd */              #  7c5: 82afdd
            addi         sp, sp, -16 /* (local0) */            #  7c8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  7cb: 0901
            s8i          a8, a2, 0 /* 0xdd -> [arg0] */        #  7cd: 824200
            s8i          a7, a2, 1 /* 0x1e -> [arg0+0x1] */    #  7d0: 724201
            s8i          a6, a2, 2 /* 0x00 -> [arg0+0x2] */    #  7d3: 624202
            s8i          a5, a2, 3 /* 0x90 -> [arg0+0x3] */    #  7d6: 524203
            movi         a0, 51 /* 0x00000033 */               #  7d9: 3c30
            s8i          a4, a2, 4 /* 0x4c -> [arg0+0x4] */    #  7db: 424204
            s8i          a0, a2, 5 /* 0x33 -> [arg0+0x5] */    #  7de: 024205
            addi         a2, a2, 6 /* arg0+0x6 */              #  7e1: 6b22
            call0        .Lfunc005                             #  7e3: 05e6ff
            l32i         a0, sp, 0 /* [(local0)] */            #  7e6: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  7e8: 12c110
            ret                                                #  7eb: 0df0

            .literal_position                                  #  7f0: 00000000

# Function @ .irom0.text+0x7f4
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
.Lfunc006:  addi         sp, sp, -32 /* (local0) */            #  7f4: 12c1e0
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   #  7f7: f951
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  7f9: 0911
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  7fb: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  7fd: c921
            mov          a13, a3 /* arg1 */                    #  7ff: dd03
            l8ui         a3, a3, 0 /* [arg1] */                #  801: 320300
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  804: e941
            blti         a3, 1, .Lbr065                        #  806: a61341
            movi         a14, 126 /* 0x0000007e */             #  809: e2a07e
            movi         a12, 0 /* 0x00000000 */               #  80c: 0c0c
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  80e: 2901
.Lbr063:    add          a4, a12, a13                          #  810: da4c
            l8ui         a4, a4, 1                             #  812: 420401
            extui        a2, a4, 0, 7                          #  815: 402064
            bbci         a4, 7, .Lbr064                        #  818: 77642a
            blt          a14, a2, .Lbr064                      #  81b: 272e27
            movi         a3, 8 /* 0x00000008 */                #  81e: 0c83
            l32i         a15, sp, 0 /* [(local0)] */           #  820: f801
            addi         a0, a2, 7                             #  822: 7b02
            movgez       a0, a2, a2                            #  824: 2002b3
            srai         a0, a0, 3                             #  827: 000321
            add          a15, a15, a0                          #  82a: 0aff
            call0        __modsi3                              #  82c: 01f1ffc0
                                                               #  830: 0000
            movi         a0, 1 /* 0x00000001 */                #  832: 0c10
            ssl          a2                                    #  834: 001240
            l8ui         a2, a15, 0                            #  837: 220f00
            sll          a3, a0                                #  83a: 0030a1
            or           a2, a2, a3                            #  83d: 302220
            s8i          a2, a15, 0                            #  840: 224f00
            l8ui         a3, a13, 0 /* [arg1] */               #  843: 320d00
.Lbr064:    addi         a12, a12, 1                           #  846: 1bcc
            blt          a12, a3, .Lbr063                      #  848: 372cc4
.Lbr065:    l32i         a12, sp, 8 /* [(local2)] */           #  84b: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  84d: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  84f: e841
            l32i         a15, sp, 20 /* [(local5)] */          #  851: f851
            l32i         a0, sp, 4 /* [(local1)] */            #  853: 0811
            addi         sp, sp, 32 /* (top of frame) */       #  855: 12c120
            ret                                                #  858: 0df0

            .literal_position                                  #  85c: 00000000
                                                               #  860: 00000000
                                                               #  864: 00000000

# Function @ .irom0.text+0x868
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
.Lfunc007:  movi         a4, 22 /* 0x00000016 */               #  868: 1c64
            addi         sp, sp, -16 /* (local0) */            #  86a: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  86d: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  86f: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  871: c911
            mov          a13, a3 /* arg1 */                    #  873: dd03
            mov          a12, a2 /* arg0 */                    #  875: cd02
            movi         a3, 0 /* 0x00000000 */                #  877: 0c03
            call0        memset                                #  879: 01f9ffc0
                                                               #  87d: 0000
            l32i         a2, a13, 188 /* [arg1+0xbc] */        #  87f: 222d2f
            call0        sdk_ieee80211_chan2ieee               #  882: 01f8ffc0
                                                               #  886: 0000
            movi         a0, sdk_g_ic+0x224                    #  888: 01f5ff
            s8i          a2, a12, 0 /* a2 -> [arg0] */         #  88b: 224c00
            l32i         a0, a0, 0x2e8 /* [sdk_g_ic+0x50c] */  #  88e: 0220ba
            movi         a2, 8 /* 0x00000008 */                #  891: 0c82
            bbci         a0, 29, .Lbr070                       #  893: d77044
            movi         a0, 8 /* 0x00000008 */                #  896: 0c80
.Lbr066:    s8i          a2, a12, 1 /* a2 -> [arg0+0x1] */     #  898: 224c01
            l32i         a2, a13, 188 /* [arg1+0xbc] */        #  89b: 222d2f
            l32i         a2, a2, 0 /* [[arg1+0xbc]] */         #  89e: 2802
            bbci         a2, 17, .Lbr071                       #  8a0: 17723e
            movi         a2, 1 /* 0x00000001 */                #  8a3: 0c12
.Lbr067:    or           a0, a0, a2                            #  8a5: 200020
.Lbr068:    s8i          a0, a12, 1 /* a0 -> [arg0+0x1] */     #  8a8: 024c01
            l32i         a3, a13, 188 /* [arg1+0xbc] */        #  8ab: 322d2f
            movi         a4, 4 /* 0x00000004 */                #  8ae: 0c44
            l32i         a3, a3, 0 /* [[arg1+0xbc]] */         #  8b0: 3803
            or           a4, a0, a4                            #  8b2: 404020
            extui        a3, a3, 17, 2                         #  8b5: 303115
            beqz         a3, .Lbr069                           #  8b8: 8c13
            s8i          a4, a12, 1 /* a4 -> [arg0+0x1] */     #  8ba: 424c01
.Lbr069:    addi         a2, a12, 6 /* arg0+0x6 */             #  8bd: 6b2c
            movi         a3, 200 /* 0x000000c8 */              #  8bf: 32a0c8
            l8ui         a4, a13, 197 /* [arg1+0xc5] */        #  8c2: 420dc5
            s8i          a4, a12, 2 /* [arg1+0xc5] -> [arg0+0x2] */ #  8c5: 424c02
            add          a3, a13, a3 /* arg1+0xc8 */           #  8c8: 3a3d
            call0        .Lfunc006                             #  8ca: 85f2ff
            l32i         a0, sp, 0 /* [(local0)] */            #  8cd: 0801
            addi         a2, a12, 22 /* arg0+0x16 */           #  8cf: 22cc16
            l32i         a13, sp, 8 /* [(local2)] */           #  8d2: d821
            l32i         a12, sp, 4 /* [(local1)] */           #  8d4: c811
            addi         sp, sp, 16 /* (top of frame) */       #  8d6: 12c110
            ret           /* arg0+0x16 */                      #  8d9: 0df0
.Lbr070:    movi         a0, 0 /* 0x00000000 */                #  8db: 0c00
            movi         a2, 0 /* 0x00000000 */                #  8dd: 0c02
            j            .Lbr066                               #  8df: 46edff
.Lbr071:    bbci         a2, 18, .Lbr068                       #  8e2: 2772c2
            movi         a2, 3 /* 0x00000003 */                #  8e5: 0c32
            j            .Lbr067                               #  8e7: 86eeff

            .balign      4
# Function @ .irom0.text+0x8ec
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ieee80211_add_htinfo
            .type        sdk_ieee80211_add_htinfo, @function
sdk_ieee80211_add_htinfo:
            addi         sp, sp, -16 /* (local0) */            #  8ec: 12c1f0
            movi         a4, 61 /* 0x0000003d */               #  8ef: 3cd4
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  8f1: 0901
            movi         a0, 22 /* 0x00000016 */               #  8f3: 1c60
            s8i          a4, a2, 0 /* 0x3d -> [arg0] */        #  8f5: 424200
            s8i          a0, a2, 1 /* 0x16 -> [arg0+0x1] */    #  8f8: 024201
            addi         a2, a2, 2 /* arg0+0x2 */              #  8fb: 2b22
            call0        .Lfunc007                             #  8fd: 85f6ff
            l32i         a0, sp, 0 /* [(local0)] */            #  900: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  902: 12c110
            ret                                                #  905: 0df0

            .balign      4
# Function @ .irom0.text+0x908
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ieee80211_add_htinfo_vendor
            .type        sdk_ieee80211_add_htinfo_vendor, @function
sdk_ieee80211_add_htinfo_vendor:
            movi         a4, 76 /* 0x0000004c */               #  908: 4cc4
            movi         a5, -112 /* 0xffffff90 */             #  90a: 52af90
            movi         a6, 0 /* 0x00000000 */                #  90d: 0c06
            movi         a7, 26 /* 0x0000001a */               #  90f: 1ca7
            movi         a8, -35 /* 0xffffffdd */              #  911: 82afdd
            addi         sp, sp, -16 /* (local0) */            #  914: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  917: 0901
            s8i          a8, a2, 0 /* 0xdd -> [arg0] */        #  919: 824200
            s8i          a7, a2, 1 /* 0x1a -> [arg0+0x1] */    #  91c: 724201
            s8i          a6, a2, 2 /* 0x00 -> [arg0+0x2] */    #  91f: 624202
            s8i          a5, a2, 3 /* 0x90 -> [arg0+0x3] */    #  922: 524203
            movi         a0, 52 /* 0x00000034 */               #  925: 3c40
            s8i          a4, a2, 4 /* 0x4c -> [arg0+0x4] */    #  927: 424204
            s8i          a0, a2, 5 /* 0x34 -> [arg0+0x5] */    #  92a: 024205
            addi         a2, a2, 6 /* arg0+0x6 */              #  92d: 6b22
            call0        .Lfunc007                             #  92f: 85f3ff
            l32i         a0, sp, 0 /* [(local0)] */            #  932: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  934: 12c110
            ret                                                #  937: 0df0

            .literal_position                                  #  93c: 00000000
                                                               #  940: c0ff0000
                                                               #  944: 00000000

# Function @ .irom0.text+0x948
# Local variables/stack:
#     (local0):  hword     @ -0x20
#     (local1):  hword     @ -0x1e
#     (local2):  hword     @ -0x1c
#     (local3):  hword     @ -0x1a
#     (local4):  hword[4]  @ -0x18
#     (local5):  word[4]   @ -0x10
.Lfunc008:  addi         sp, sp, -32 /* (local0) */            #  948: 12c1e0
            l8ui         a5, a4, 2 /* [arg2+0x2] */            #  94b: 520402
            s32i         a0, sp, 16 /* a0 -> [(local5)] */     #  94e: 0941
            l8ui         a3, a4, 4 /* [arg2+0x4] */            #  950: 320404
            l8ui         a0, a4, 3 /* [arg2+0x3] */            #  953: 020403
            slli         a3, a3, 8                             #  956: 803311
            movi         a4, 0 /* 0x00000000 */                #  959: 0c04
            or           a0, a0, a3                            #  95b: 300020
            l32i         a3, a2, 72 /* [arg0+0x48] */          #  95e: 322212
            s16i         a5, sp, 0 /* [arg2+0x2] -> [(local0)] */ #  961: 525100
            bbci         a3, 10, .Lbr072                       #  964: a7630e
            movi         a5, sdk_g_ic+0x224                    #  967: 51f5ff
            l32i         a5, a5, 0x2e8 /* [sdk_g_ic+0x50c] */  #  96a: 5225ba
            bbci         a5, 21, .Lbr072                       #  96d: 577505
            s16i         a4, sp, 2 /* 0x0000 -> [(local1)] */  #  970: 425101
            j            .Lbr073                               #  973: 060100
.Lbr072:    movi         a6, 37 /* 0x00000025 */               #  976: 2c56
            s16i         a6, sp, 2 /* 0x0025 -> [(local1)] */  #  978: 625101
.Lbr073:    movi         a3, 3 /* 0x00000003 */                #  97b: 0c33
            mov          a5, sp /* (local0) */                 #  97d: 5d01
            s16i         a4, sp, 6 /* 0x0000 -> [(local3)] */  #  97f: 425103
            s16i         a4, sp, 8 /* 0x0000 -> [(local4)] */  #  982: 425104
            movi         a9, 0x0000ffc0                        #  985: 91eeff
            extui        a8, a0, 6, 10                         #  988: 008694
            extui        a7, a0, 2, 4                          #  98b: 007234
            slli         a7, a7, 2                             #  98e: e07711
            slli         a8, a8, 6                             #  991: a08811
            and          a8, a8, a9                            #  994: 908810
            movi         a4, 1 /* 0x00000001 */                #  997: 0c14
            movi         a9, 60 /* 0x0000003c */               #  999: 3cc9
            and          a7, a7, a9                            #  99b: 907710
            or           a7, a7, a8                            #  99e: 807720
            movi         a8, 2 /* 0x00000002 */                #  9a1: 0c28
            or           a7, a7, a8                            #  9a3: 807720
            s16i         a7, sp, 4 /* a7 -> [(local2)] */      #  9a6: 725102
            call0        sdk_ieee80211_send_action             #  9a9: 01e6ffc0
                                                               #  9ad: 0000
            movi         a2, 0 /* 0x00000000 */                #  9af: 0c02
            l32i         a0, sp, 16 /* [(local5)] */           #  9b1: 0841
            addi         sp, sp, 32 /* (top of frame) */       #  9b3: 12c120
            ret           /* 0x00000000 */                     #  9b6: 0df0

            .literal_position                                  #  9b8: 000af23f
                                                               #  9bc: 00000000
                                                               #  9c0: 00000000
                                                               #  9c4: 00000000
                                                               #  9c8: 00000000
                                                               #  9cc: 00000000
                                                               #  9d0: 00000000

# Function @ .irom0.text+0x9d4
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
.Lfunc009:  mov          a7, a2 /* arg0 */                     #  9d4: 7d02
            mov          a8, a3 /* arg1 */                     #  9d6: 8d03
            addi         sp, sp, -32 /* (local0) */            #  9d8: 12c1e0
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   #  9db: c941
            movi         a3, 24 /* 0x00000018 */               #  9dd: 1c83
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     #  9df: 0931
            s32i         a13, sp, 20 /* a13 -> [(local5)] */   #  9e1: d951
            s32i         a14, sp, 24 /* a14 -> [(local6)] */   #  9e3: e961
            mov          a13, a5 /* arg3 */                    #  9e5: dd05
            mov          a2, sp /* (local0) */                 #  9e7: 2d01
            s32i         a8, sp, 8 /* arg1 -> [(local2)] */    #  9e9: 8921
            mov          a14, a4 /* arg2 */                    #  9eb: ed04
            s32i         a7, sp, 4 /* arg0 -> [(local1)] */    #  9ed: 7911
            movi         a4, 9 /* 0x00000009 */                #  9ef: 0c94
            call0        sdk_ieee80211_getmgtframe             #  9f1: 01f4ffc0
                                                               #  9f5: 0000
            mov          a12, a2                               #  9f7: cd02
            beqz         a2, .Lbr078                           #  9f9: 16f213
            l32i         a7, sp, 0 /* [(local0)] */            #  9fc: 7801
            l32i         a6, sp, 8 /* [(local2)] */            #  9fe: 6821
            s8i          a6, a7, 0 /* [(local2)] -> [[(local0)]] */ #  a00: 624700
            l32i         a4, sp, 0 /* [(local0)] */            #  a03: 4801
            addi         a5, a4, 1 /* [(local0)]+0x1 */        #  a05: 1b54
            s32i         a5, sp, 0 /* [(local0)]+0x1 -> [(local0)] */ #  a07: 5901
            s8i          a14, a4, 1 /* arg2 -> [[(local0)]+0x1] */ #  a09: e24401
            l32i         a2, sp, 0 /* [(local0)] */            #  a0c: 2801
            l16ui        a0, a13, 0 /* [arg3] */               #  a0e: 021d00
            addi         a3, a2, 1 /* [(local0)]+0x1 */        #  a11: 1b32
            s32i         a3, sp, 0 /* [(local0)]+0x1 -> [(local0)] */ #  a13: 3901
            s8i          a0, a2, 1 /* [arg3] -> [[(local0)]+0x1] */ #  a15: 024201
            l32i         a3, sp, 0 /* [(local0)] */            #  a18: 3801
            addi         a0, a3, 1 /* [(local0)]+0x1 */        #  a1a: 1b03
            s32i         a0, sp, 0 /* [(local0)]+0x1 -> [(local0)] */ #  a1c: 0901
            bnei         a14, 1, .Lbr074                       #  a1e: 661e16
            l16ui        a4, a13, 2 /* [arg3+0x2] */           #  a21: 421d01
            s8i          a4, a3, 1 /* [arg3+0x2] -> [[(local0)]+0x1] */ #  a24: 424301
            l16ui        a2, a13, 2 /* [arg3+0x2] */           #  a27: 221d01
            l32i         a4, sp, 0 /* [(local0)] */            #  a2a: 4801
            srli         a2, a2, 8                             #  a2c: 202841
            s8i          a2, a4, 1 /* a2 -> [[(local0)]+0x1] */ #  a2f: 224401
            l32i         a0, sp, 0 /* [(local0)] */            #  a32: 0801
            addi         a0, a0, 2 /* [(local0)]+0x2 */        #  a34: 2b00
            s32i         a0, sp, 0 /* [(local0)]+0x2 -> [(local0)] */ #  a36: 0901
.Lbr074:    movi         a11, 1 /* 0x00000001 */               #  a38: 0c1b
            l16ui        a10, a13, 4 /* [arg3+0x4] */          #  a3a: a21d02
            s8i          a10, a0, 0                            #  a3d: a24000
            l16ui        a9, a13, 4 /* [arg3+0x4] */           #  a40: 921d02
            l32i         a10, sp, 0 /* [(local0)] */           #  a43: a801
            srli         a9, a9, 8                             #  a45: 909841
            s8i          a9, a10, 1 /* a9 -> [[(local0)]+0x1] */ #  a48: 924a01
            movi         a10, 0x3ff20a00                       #  a4b: a1dbff
            movi         a9, 24 /* 0x00000018 */               #  a4e: 1c89
            l32i         a7, sp, 0 /* [(local0)] */            #  a50: 7801
            l16ui        a6, a13, 6 /* [arg3+0x6] */           #  a52: 621d03
            addi         a8, a7, 2 /* [(local0)]+0x2 */        #  a55: 2b87
            s32i         a8, sp, 0 /* [(local0)]+0x2 -> [(local0)] */ #  a57: 8901
            s8i          a6, a7, 2 /* [arg3+0x6] -> [[(local0)]+0x2] */ #  a59: 624702
            l16ui        a5, a13, 6 /* [arg3+0x6] */           #  a5c: 521d03
            l32i         a6, sp, 0 /* [(local0)] */            #  a5f: 6801
            srli         a5, a5, 8                             #  a61: 505841
            s8i          a5, a6, 1 /* a5 -> [[(local0)]+0x1] */ #  a64: 524601
            movi         a5, 7 /* 0x00000007 */                #  a67: 0c75
            l32i         a3, sp, 0 /* [(local0)] */            #  a69: 3801
            movi         a6, 16 /* 0x00000010 */               #  a6b: 1c06
            addi         a0, a3, 2 /* [(local0)]+0x2 */        #  a6d: 2b03
            s32i         a0, sp, 0 /* [(local0)]+0x2 -> [(local0)] */ #  a6f: 0901
            bnez         a14, .Lbr075                          #  a71: dc5e
            l16ui        a4, a13, 8 /* [arg3+0x8] */           #  a73: 421d04
            s8i          a4, a3, 2 /* [arg3+0x8] -> [[(local0)]+0x2] */ #  a76: 424302
            l16ui        a2, a13, 8 /* [arg3+0x8] */           #  a79: 221d04
            l32i         a4, sp, 0 /* [(local0)] */            #  a7c: 4801
            srli         a2, a2, 8                             #  a7e: 202841
            s8i          a2, a4, 1 /* a2 -> [[(local0)]+0x1] */ #  a81: 224401
            l32i         a0, sp, 0 /* [(local0)] */            #  a84: 0801
            addi         a0, a0, 2 /* [(local0)]+0x2 */        #  a86: 2b00
            s32i         a0, sp, 0 /* [(local0)]+0x2 -> [(local0)] */ #  a88: 0901
.Lbr075:    movi         a14, 143 /* 0x0000008f */             #  a8a: e2a08f
            l32i         a3, a12, 4                            #  a8d: 381c
            movi         a13, sdk_g_ic                         #  a8f: d1cbff
            l32i         a8, a12, 32                           #  a92: 888c
            l32i         a2, a13, 16 /* [sdk_g_ic+0x10] */     #  a94: 284d
            l32i         a4, a8, 0                             #  a96: 4808
            l32i         a3, a3, 4                             #  a98: 3813
            extui        a7, a4, 0, 6                          #  a9a: 407054
            sub          a3, a0, a3                            #  a9d: 3030c0
            s16i         a9, a12, 20                           #  aa0: 925c0a
            addi         a3, a3, -24                           #  aa3: 32c3e8
            srli         a4, a4, 6                             #  aa6: 404641
            or           a0, a4, a6                            #  aa9: 600420
            s16i         a3, a12, 22                           #  aac: 325c0b
            l8ui         a9, a8, 6                             #  aaf: 920806
            slli         a0, a0, 6                             #  ab2: a00011
            or           a7, a7, a0                            #  ab5: 007720
            and          a9, a9, a14                           #  ab8: e09910
            s8i          a9, a8, 6                             #  abb: 924806
            l32i         a4, a12, 32                           #  abe: 488c
            s32i         a7, a8, 0                             #  ac0: 7908
            l8ui         a3, a4, 4                             #  ac2: 320404
            movi         a6, 240 /* 0x000000f0 */              #  ac5: 62a0f0
            and          a3, a3, a6                            #  ac8: 603310
            or           a3, a3, a5                            #  acb: 503320
            l32i         a5, sp, 4 /* [(local1)] */            #  ace: 5811
            s8i          a3, a4, 4                             #  ad0: 324404
            sub          a2, a2, a5                            #  ad3: 5022c0
            movnez       a2, a11, a2                           #  ad6: 202b93
            l32i         a11, a12, 32                          #  ad9: b88c
            memw                                               #  adb: c02000
            movi         a9, 253 /* 0x000000fd */              #  ade: 92a0fd
            extui        a8, a2, 0, 1                          #  ae1: 208004
            l32i         a10, a10, 0x200 /* [0x3ff20c00] */    #  ae4: a22a80
            l8ui         a14, a11, 0                           #  ae7: e20b00
            movi         a0, 254 /* 0x000000fe */              #  aea: 02a0fe
            and          a14, a14, a0                          #  aed: 00ee10
            s8i          a14, a11, 0                           #  af0: e24b00
            l32i         a7, a12, 32                           #  af3: 788c
            s32i         a10, a11, 16                          #  af5: a94b
            l8ui         a6, a7, 0                             #  af7: 620700
            slli         a8, a8, 1                             #  afa: f08811
            and          a6, a6, a9                            #  afd: 906610
            or           a6, a6, a8                            #  b00: 806620
            s8i          a6, a7, 0                             #  b03: 624700
            l32i         a5, a5, 136 /* [[(local1)]+0x88] */   #  b06: 522522
            l16ui        a5, a5, 26 /* [[[(local1)]+0x88]+0x1a] */ #  b09: 52150d
            l32i         a0, a12, 32                           #  b0c: 088c
            beqz         a5, .Lbr076                           #  b0e: 9c05
            l32i         a4, a0, 0                             #  b10: 4800
            bbsi         a4, 7, .Lbr076                        #  b12: 77e40c
            call0        sdk_rc_get_trc_by_index               #  b15: 01acffc0
                                                               #  b19: 0000
            s32i         a2, a12, 24                           #  b1b: 296c
            l32i         a0, a12, 32                           #  b1d: 088c
            j            .Lbr077                               #  b1f: c60000
.Lbr076:    movi         a5, 0 /* 0x00000000 */                #  b22: 0c05
            s32i         a5, a12, 24                           #  b24: 596c
.Lbr077:    mov          a3, a12                               #  b26: 3d0c
            l32i         a2, sp, 4 /* [(local1)] */            #  b28: 2811
            movi         a4, 208 /* 0x000000d0 */              #  b2a: 42a0d0
            l8ui         a6, a13, 125 /* [sdk_g_ic+0x7d] */    #  b2d: 620d7d
            s8i          a6, a0, 8                             #  b30: 624008
            call0        sdk_ieee80211_mgmt_output             #  b33: 01a6ffc0
                                                               #  b37: 0000
            j            .Lbr079                               #  b39: 860200
.Lbr078:    movi         a2, .Lstr001                          #  b3c: 21a1ff
            call0        printf                                #  b3f: 01a4ffc0
                                                               #  b43: 0000
            movi         a2, 1 /* 0x00000001 */                #  b45: 0c12
.Lbr079:    l32i         a12, sp, 16 /* [(local4)] */          #  b47: c841
            l32i         a13, sp, 20 /* [(local5)] */          #  b49: d851
            l32i         a14, sp, 24 /* [(local6)] */          #  b4b: e861
            l32i         a0, sp, 12 /* [(local3)] */           #  b4d: 0831
            addi         sp, sp, 32 /* (top of frame) */       #  b4f: 12c120
            ret                                                #  b52: 0df0

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "no buf for action frame\n"           #    0: 6e6f2062
                                                               #    4: 75662066
                                                               #    8: 6f722061
                                                               #    c: 6374696f
                                                               #   10: 6e206672
                                                               #   14: 616d650a
                                                               #   18: 00

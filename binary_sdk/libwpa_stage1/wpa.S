
            .section     .bss, "aw", @nobits

.Ldata001:  .space       32
.Ldata002:  .word        0x00000000                            #   20: 00000000

# NOTE: 172 non-alignment zero bytes skipped.

            .skip        172
.Label001:  .space       40
.Ldata003:  .word        0x00000000                            #   f8: 00000000
.Label002:  .space       8
.Ldata004:  .word        0x00000000                            #  104: 00000000

# NOTE: 12 non-alignment zero bytes skipped.

            .skip        12
.Ldata005:  .word        0x00000000                            #  114: 00000000
.Ldata006:  .word        0x00000000                            #  118: 00000000
.Ldata007:  .word        0x00000000                            #  11c: 00000000

# NOTE: 8 non-alignment zero bytes skipped.

            .skip        8
.Ldata008:  .word        0x00000000                            #  128: 00000000
.Label003:  .space       28
.Ldata009:  .word        0x00000000                            #  148: 00000000
.Ldata010:  .word        0x00000000                            #  14c: 00000000
.Ldata011:  .byte        0x00
            .balign      4
.Ldata012:  .word        0x00000000                            #  154: 00000000
.Label004:  .space       6
.Label005:  .space       6
.Ldata013:  .word        0x00000000                            #  164: 00000000
.Ldata014:  .word        0x00000000                            #  168: 00000000

# NOTE: 16 non-alignment zero bytes skipped.

            .skip        16
.Ldata015:  .word        0x00000000                            #  17c: 00000000

# NOTE: 68 non-alignment zero bytes skipped.

            .skip        68
.Ldata016:  .word        0x00000000                            #  1c4: 00000000

# NOTE: 68 non-alignment zero bytes skipped.

            .skip        68
.Ldata017:  .word        0x00000000                            #  20c: 00000000

# NOTE: 4 non-alignment zero bytes skipped.

            .skip        4
.Ldata018:  .word        0x00000000                            #  214: 00000000
.Ldata019:  .word        0x00000000                            #  218: 00000000
.Ldata020:  .word        0x00000000                            #  21c: 00000000
.Ldata021:  .word        0x00000000                            #  220: 00000000
.Ldata022:  .word        0x00000000                            #  224: 00000000

# NOTE: 56 non-alignment zero bytes skipped.

            .skip        56
.Ldata023:  .space       26

            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
            .balign      4
            .literal_position
.Lfunc001:  ret           /* arg0 */                           #    0: 0df0

            .literal_position                                  #    4: 00000000
                                                               #    8: 00000000
                                                               #    c: 00000000
                                                               #   10: 00000000
                                                               #   14: 00000000
                                                               #   18: 00000000
                                                               #   1c: 00000000

# Function @ .irom0.text+0x20
# Local variables/stack:
#     (local0):  hword[2]  @ -0x24
#     (local1):  word      @ -0x20
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word      @ -0x10
#     (local6):  word      @ -0xc
#     (local7):  word      @ -0x8
#     (local8):  word      @ -0x4
            .balign      4
.Lfunc002:  addi         sp, sp, -48 /* (FP)-0x30 */           #   20: 12c1d0
            s32i         a14, sp, 44 /* a14 -> [(local8)] */   #   23: e9b1
            s32i         a6, sp, 28 /* arg4 -> [(local4)] */   #   25: 6971
            s32i         a4, sp, 20 /* arg2 -> [(local2)] */   #   27: 4951
            s32i         a0, sp, 32 /* a0 -> [(local5)] */     #   29: 0981
            s32i         a12, sp, 36 /* a12 -> [(local6)] */   #   2b: c991
            s32i         a13, sp, 40 /* a13 -> [(local7)] */   #   2d: d9a1
            mov          a12, a2 /* arg0 */                    #   2f: cd02
            mov          a13, a5 /* arg3 */                    #   31: dd05
            l8ui         a8, a13, 1 /* [arg3+0x1] */           #   33: 820d01
            l8ui         a9, a13, 3 /* [arg3+0x3] */           #   36: 920d03
            l8ui         a10, a13, 5 /* [arg3+0x5] */          #   39: a20d05
            l8ui         a0, a13, 4 /* [arg3+0x4] */           #   3c: 020d04
            mov          a5, a7 /* arg5 */                     #   3f: 5d07
            mov          a2, a3 /* arg1 */                     #   41: 2d03
            s32i         a2, sp, 24 /* arg1 -> [(local3)] */   #   43: 2961
            s32i         a5, sp, 16 /* arg5 -> [(local1)] */   #   45: 5941
            l8ui         a3, a13, 0 /* [arg3] */               #   47: 320d00
            l8ui         a7, a13, 2 /* [arg3+0x2] */           #   4a: 720d02
            or           a0, a0, a10                           #   4d: a00020
            or           a7, a7, a9                            #   50: 907720
            or           a3, a3, a8                            #   53: 803320
            or           a3, a3, a7                            #   56: 703320
            or           a0, a0, a3                            #   59: 300020
            extui        a0, a0, 0, 8                          #   5c: 000074
            bnez         a0, .Lbr001                           #   5f: fca0
            movi         a0, 227 /* 0x000000e3 */              #   61: 02a0e3
            add          a0, a12, a0 /* arg0+0xe3 */           #   64: 0a0c
            l8ui         a2, a0, 124 /* [arg0+0x15f] */        #   66: 22007c
            l8ui         a14, a0, 123 /* [arg0+0x15e] */       #   69: e2007b
            l8ui         a4, a0, 128 /* [arg0+0x163] */        #   6c: 420080
            l8ui         a11, a0, 127 /* [arg0+0x162] */       #   6f: b2007f
            l8ui         a3, a0, 126 /* [arg0+0x161] */        #   72: 32007e
            or           a11, a11, a4                          #   75: 40bb20
            l8ui         a0, a0, 125 /* [arg0+0x160] */        #   78: 02007d
            or           a14, a14, a2                          #   7b: 20ee20
            or           a0, a0, a3                            #   7e: 300020
            or           a14, a14, a0                          #   81: 00ee20
            or           a11, a11, a14                         #   84: e0bb20
            extui        a11, a11, 0, 8                        #   87: b0b074
            bnez         a11, .Lbr001                          #   8a: ccfb
            movi         a4, 6 /* 0x00000006 */                #   8c: 0c64
            movi         a13, 350 /* 0x0000015e */             #   8e: d2a15e
            add          a13, a12, a13 /* arg0+0x15e */        #   91: dadc
            mov          a2, a13 /* arg0+0x15e */              #   93: 2d0d
            mov          a3, a13 /* arg0+0x15e */              #   95: 3d0d
            call0        memcpy                                #   97: 01dbffc0
                                                               #   9b: 0000
.Lbr001:    l32i         a6, sp, 52 /* [(FP)+0x4] */           #   9d: 68d1
            l32i         a14, sp, 48 /* [(local9)] */          #   9f: e8c1
            beqz         a6, .Lbr002                           #   a1: 8cf6
            l32i         a2, sp, 24 /* [(local3)] */           #   a3: 2861
            l32i         a3, sp, 20 /* [(local2)] */           #   a5: 3851
            l32i         a4, sp, 16 /* [(local1)] */           #   a7: 4841
            mov          a5, a14 /* [(local9)] */              #   a9: 5d0e
            call0        wpa_eapol_key_mic                     #   ab: 01d7ffc0
                                                               #   af: 0000
            bnez         a2, .Lbr003                           #   b1: 564206
.Lbr002:    mov          a2, sp /* (FP)-0x30 */                #   b4: 2d01
            movi         a3, 0 /* 0x00000000 */                #   b6: 0c03
            movi         a4, 14 /* 0x0000000e */               #   b8: 0ce4
            call0        memset                                #   ba: 01d4ffc0
                                                               #   be: 0000
            mov          a3, a13                               #   c0: 3d0d
            mov          a2, sp /* (FP)-0x30 */                #   c2: 2d01
            movi         a4, 6 /* 0x00000006 */                #   c4: 0c64
            call0        memcpy                                #   c6: 01d2ffc0
                                                               #   ca: 0000
            addi         a2, sp, 6 /* (FP)-0x2a */             #   cc: 6b21
            movi         a4, 6 /* 0x00000006 */                #   ce: 0c64
            movi         a3, 344 /* 0x00000158 */              #   d0: 32a158
            add          a3, a12, a3 /* arg0+0x158 */          #   d3: 3a3c
            call0        memcpy                                #   d5: 01cfffc0
                                                               #   d9: 0000
            addi         a4, a14, 14 /* [(local9)]+0xe */      #   db: eb4e
            l32i         a7, sp, 28 /* [(local4)] */           #   dd: 7871
            l32i         a5, a12, 0x210 /* [arg0+0x210] */     #   df: 522c84
            extui        a6, a7, 8, 8                          #   e2: 706874
            l32i         a13, a5, 4 /* [[arg0+0x210]+0x4] */   #   e5: d815
            extui        a7, a7, 0, 8                          #   e7: 707074
            slli         a7, a7, 8                             #   ea: 807711
            or           a6, a6, a7                            #   ed: 706620
            s16i         a6, sp, 12 /* a6 -> [(local0)] */     #   f0: 625106
            s16i         a4, a5, 10 /* [(local9)]+0xe -> [[arg0+0x210]+0xa] */ #   f3: 425505
            beqz         a13, .Lbr003                          #   f6: 9cfd
            mov          a2, a13 /* [[arg0+0x210]+0x4] */      #   f8: 2d0d
            mov          a3, sp /* (FP)-0x30 */                #   fa: 3d01
            movi         a4, 14 /* 0x0000000e */               #   fc: 0ce4
            call0        memcpy                                #   fe: 01c6ffc0
                                                               #  102: 0000
            mov          a4, a14 /* [(local9)] */              #  104: 4d0e
            addi         a2, a13, 14 /* [[arg0+0x210]+0x4]+0xe */ #  106: eb2d
            l32i         a3, sp, 16 /* [(local1)] */           #  108: 3841
            call0        memcpy                                #  10a: 01c4ffc0
                                                               #  10e: 0000
            l32i         a0, a12, 0x214 /* [arg0+0x214] */     #  110: 022c85
            l32i         a2, a12, 0x210 /* [arg0+0x210] */     #  113: 222c84
            callx0       a0 /* [arg0+0x214] */                 #  116: c00000
.Lbr003:    l32i         a12, sp, 36 /* [(local6)] */          #  119: c891
            l32i         a13, sp, 40 /* [(local7)] */          #  11b: d8a1
            l32i         a14, sp, 44 /* [(local8)] */          #  11d: e8b1
            l32i         a0, sp, 32 /* [(local5)] */           #  11f: 0881
            addi         sp, sp, 48 /* (local9) */             #  121: 12c130
            ret                                                #  124: 0df0

            .literal_position                                  #  128: 00080000
                                                               #  12c: 8e880000
                                                               #  130: 00000000
                                                               #  134: 00000000
                                                               #  138: 00000000
                                                               #  13c: 00000000

# Function @ .irom0.text+0x140
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word[5]   @ -0x3c
#     (local2):  word      @ -0x28
#     (local3):  word      @ -0x24
#     (local4):  word      @ -0x20
#     (local5):  word      @ -0x1c
#     (local6):  word      @ -0x18
#     (local7):  word      @ -0x14
#     (local8):  word      @ -0x10
#     (local9):  word      @ -0xc
#     (local10): word      @ -0x8
#     (local11): word      @ -0x4
            .balign      4
.Lfunc003:  movi         a6, 1 /* 0x00000001 */                #  140: 0c16
            addi         sp, sp, -64 /* (local0) */            #  142: 12c1c0
            s32i         a13, sp, 60 /* a13 -> [(local11)] */  #  145: d9f1
            s32i         a3, sp, 44 /* arg1 -> [(local7)] */   #  147: 39b1
            s32i         a4, sp, 40 /* arg2 -> [(local6)] */   #  149: 49a1
            l32i         a7, a2, 0x11c /* [arg0+0x11c] */      #  14b: 722247
            s32i         a12, sp, 56 /* a12 -> [(local10)] */  #  14e: c9e1
            s32i         a0, sp, 52 /* a0 -> [(local9)] */     #  150: 09d1
            mov          a12, a2 /* arg0 */                    #  152: cd02
            movi         a0, 2 /* 0x00000002 */                #  154: 0c20
            beqi         a7, 64, .Lbr004                       #  156: 26d704
            beqi         a7, 32, .Lbr004                       #  159: 26c701
            movi         a6, 0 /* 0x00000000 */                #  15c: 0c06
.Lbr004:    bnez         a6, .Lbr006                           #  15e: dc86
            movi         a2, 1 /* 0x00000001 */                #  160: 0c12
            beqi         a7, 0x100, .Lbr005                    #  162: 26f704
            beqi         a7, 128, .Lbr005                      #  165: 26e701
            movi         a2, 0 /* 0x00000000 */                #  168: 0c02
.Lbr005:    bnez         a2, .Lbr006                           #  16a: ccc2
            l32i         a2, a12, 0x114 /* [arg0+0x114] */     #  16c: 222c45
            movi         a13, 1 /* 0x00000001 */               #  16f: 0c1d
            addi         a2, a2, -8 /* [arg0+0x114]-0x8 */     #  171: 22c2f8
            moveqz       a13, a0, a2                           #  174: 20d083
            j            .Lbr007                               #  177: 460000
.Lbr006:    movi         a13, 3 /* 0x00000003 */               #  17a: 0c3d
.Lbr007:    addi         a2, sp, 16 /* (FP)-0x30 */            #  17c: 22c110
            movi         a4, 6 /* 0x00000006 */                #  17f: 0c64
            movi         a3, 350 /* 0x0000015e */              #  181: 32a15e
            add          a3, a12, a3 /* arg0+0x15e */          #  184: 3a3c
            call0        memcpy                                #  186: 01eaffc0
                                                               #  18a: 0000
            mov          a2, a12 /* arg0 */                    #  18c: 2d0c
            movi         a3, 3 /* 0x00000003 */                #  18e: 0c33
            movi         a4, 0 /* 0x00000000 */                #  190: 0c04
            movi         a5, 95 /* 0x0000005f */               #  192: 5cf5
            addi         a6, sp, 24 /* (local2) */             #  194: 62c118
            addi         a7, sp, 28 /* (local3) */             #  197: 72c11c
            call0        wpa_sm_alloc_eapol                    #  19a: 01e6ffc0
                                                               #  19e: 0000
            s32i         a2, sp, 48 /* a2 -> [(local8)] */     #  1a0: 29c1
            beqz         a2, .Lbr010                           #  1a2: 16220a
            l32i         a2, sp, 40 /* [(local6)] */           #  1a5: 28a1
            movi         a3, 1536 /* 0x00000600 */             #  1a7: 32a600
            l32i         a10, sp, 28 /* [(local3)] */          #  1aa: a871
            movi         a11, 2 /* 0x00000002 */               #  1ac: 0c2b
            movi         a9, 254 /* 0x000000fe */              #  1ae: 92a0fe
            movi         a4, 256 /* 0x00000100 */              #  1b1: 42a100
            l32i         a0, a12, 0x164 /* [arg0+0x164] */     #  1b4: 022c59
            movi         a8, 0x00000800                        #  1b7: 81dcff
            addi         a0, a0, -2 /* [arg0+0x164]-0x2 */     #  1ba: 02c0fe
            or           a8, a13, a8                           #  1bd: 808d20
            or           a4, a8, a4                            #  1c0: 404820
            moveqz       a9, a11, a0                           #  1c3: 009b83
            s8i          a9, a10, 0 /* a9 -> [[(local3)]] */   #  1c6: 924a00
            l32i         a5, a12, 176 /* [arg0+0xb0] */        #  1c9: 522c2c
            l32i         a11, sp, 28 /* [(local3)] */          #  1cc: b871
            movnez       a8, a4, a5                            #  1ce: 508493
            l32i         a4, sp, 44 /* [(local7)] */           #  1d1: 48b1
            or           a3, a8, a3                            #  1d3: 303820
            movi         a5, 0 /* 0x00000000 */                #  1d6: 0c05
            movnez       a8, a3, a4                            #  1d8: 408393
            movi         a4, 8 /* 0x00000008 */                #  1db: 0c84
            or           a0, a8, a4                            #  1dd: 400820
            movnez       a8, a0, a2                            #  1e0: 208093
            srli         a10, a8, 8                            #  1e3: 80a841
            s8i          a10, a11, 1 /* a10 -> [[(local3)]+0x1] */ #  1e6: a24b01
            l32i         a9, sp, 28 /* [(local3)] */           #  1e9: 9871
            movi         a3, 264 /* 0x00000108 */              #  1eb: 32a108
            s8i          a8, a9, 2 /* a8 -> [[(local3)]+0x2] */ #  1ee: 824902
            l32i         a7, sp, 28 /* [(local3)] */           #  1f1: 7871
            add          a3, a12, a3 /* arg0+0x108 */          #  1f3: 3a3c
            s8i          a5, a7, 3 /* 0x00 -> [[(local3)]+0x3] */ #  1f5: 524703
            l32i         a6, sp, 28 /* [(local3)] */           #  1f8: 6871
            s32i         a3, sp, 36 /* arg0+0x108 -> [(local5)] */ #  1fa: 3991
            s8i          a5, a6, 4 /* 0x00 -> [[(local3)]+0x4] */ #  1fc: 524604
            l32i         a2, sp, 28 /* [(local3)] */           #  1ff: 2871
            s32i         a8, sp, 32 /* a8 -> [(local4)] */     #  201: 8981
            addi         a2, a2, 5 /* [(local3)]+0x5 */        #  203: 5b22
            call0        memcpy                                #  205: 01ccffc0
                                                               #  209: 0000
            l32i         a2, sp, 36 /* [(local5)] */           #  20b: 2891
            movi         a3, 8 /* 0x00000008 */                #  20d: 0c83
            call0        inc_byte_array                        #  20f: 01cbffc0
                                                               #  213: 0000
            l32i         a5, sp, 28 /* [(local3)] */           #  215: 5871
            movi         a3, 0 /* 0x00000000 */                #  217: 0c03
            s8i          a3, a5, 93 /* 0x00 -> [[(local3)]+0x5d] */ #  219: 32455d
            l32i         a4, sp, 28 /* [(local3)] */           #  21c: 4871
            l32i         a2, sp, 32 /* [(local4)] */           #  21e: 2881
            s8i          a3, a4, 94 /* 0x00 -> [[(local3)]+0x5e] */ #  220: 32445e
            bbci         a2, 8, .Lbr008                        #  223: 876207
            l32i         a0, sp, 28 /* [(local3)] */           #  226: 0871
            addi         a0, a0, 77 /* [(local3)]+0x4d */      #  228: 02c04d
            j            .Lbr009                               #  22b: 460000
.Lbr008:    movi         a0, 0 /* 0x00000000 */                #  22e: 0c00
.Lbr009:    mov          a4, a13                               #  230: 4d0d
            addi         a3, a12, 48 /* arg0+0x30 */           #  232: 32cc30
            l32i         a7, sp, 48 /* [(local8)] */           #  235: 78c1
            addi         a5, sp, 16 /* (FP)-0x30 */            #  237: 52c110
            movi         a6, 0x0000888e                        #  23a: 61bcff
            l32i         a2, sp, 24 /* [(local2)] */           #  23d: 2861
            s32i         a2, sp, 0 /* [(local2)] -> [(local0)] */ #  23f: 2901
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  241: 0911
            mov          a2, a12 /* arg0 */                    #  243: 2d0c
            call0        .Lfunc002                             #  245: 85ddff
.Lbr010:    l32i         a12, sp, 56 /* [(local10)] */         #  248: c8e1
            l32i         a13, sp, 60 /* [(local11)] */         #  24a: d8f1
            l32i         a0, sp, 52 /* [(local9)] */           #  24c: 08d1
            addi         sp, sp, 64 /* (top of frame) */       #  24e: 12c140
            ret                                                #  251: 0df0

            .balign      4
# Function @ .irom0.text+0x254
            .balign      4
.Lfunc004:  movi         a3, 1 /* 0x00000001 */                #  254: 0c13
            l32i         a4, a2, 32 /* [arg0+0x20] */          #  256: 4882
            movi         a2, 0 /* 0x00000000 */                #  258: 0c02
            moveqz       a2, a3, a4                            #  25a: 402383
            ret                                                #  25d: 0df0

            .literal_position                                  #  260: 8e880000
                                                               #  264: 00000000
                                                               #  268: 00000000
                                                               #  26c: 00000000
                                                               #  270: 00000000
                                                               #  274: 00000000

# Function @ .irom0.text+0x278
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word[3]   @ -0x3c
#     (local2):  word      @ -0x30
#     (local3):  word      @ -0x2c
#     (local4):  word      @ -0x28
#     (local5):  word      @ -0x24
#     (local6):  word      @ -0x20
#     (local7):  word      @ -0x1c
#     (local8):  word      @ -0x18
#     (local9):  word      @ -0x14
#     (local10): word      @ -0x10
#     (local11): word      @ -0xc
#     (local12): word[2]   @ -0x8
            .balign      4
.Lfunc005:  addi         sp, sp, -64 /* (local0) */            #  278: 12c1c0
            s32i         a0, sp, 44 /* a0 -> [(local9)] */     #  27b: 09b1
            s32i         a3, sp, 40 /* arg1 -> [(local8)] */   #  27d: 39a1
            s32i         a6, sp, 36 /* arg4 -> [(local7)] */   #  27f: 6991
            s32i         a13, sp, 52 /* a13 -> [(local11)] */  #  281: d9d1
            s32i         a14, sp, 56 /* a14 -> [(local12)] */  #  283: e9e1
            s32i         a12, sp, 48 /* a12 -> [(local10)] */  #  285: c9c1
            mov          a14, a5 /* arg3 */                    #  287: ed05
            mov          a12, a2 /* arg0 */                    #  289: cd02
            mov          a13, a7 /* arg5 */                    #  28b: dd07
            mov          a2, a4 /* arg2 */                     #  28d: 2d04
            s32i         a2, sp, 32 /* arg2 -> [(local6)] */   #  28f: 2981
            beqz         a7, .Lbr011                           #  291: ac07
            mov          a2, a12 /* arg0 */                    #  293: 2d0c
            movi         a3, 3 /* 0x00000003 */                #  295: 0c33
            movi         a4, 0 /* 0x00000000 */                #  297: 0c04
            addi         a6, sp, 16 /* (local2) */             #  299: 62c110
            addi         a7, sp, 20 /* (local3) */             #  29c: 72c114
            l32i         a5, sp, 64 /* [(local13)] */          #  29f: 522110
            s32i         a5, sp, 28 /* [(local13)] -> [(local5)] */ #  2a2: 5971
            addi         a5, a5, 95 /* [(local13)]+0x5f */     #  2a4: 52c55f
            extui        a5, a5, 0, 16                         #  2a7: 5050f4
            call0        wpa_sm_alloc_eapol                    #  2aa: 01eeffc0
                                                               #  2ae: 0000
            mov          a0, a2                                #  2b0: 0d02
            bnez         a2, .Lbr015                           #  2b2: 567207
.Lbr011:    movi         a2, -1 /* 0xffffffff */               #  2b5: 7cf2
            j            .Lbr014                               #  2b7: 461900
.Lbr012:    addi         a2, a9, 3 /* [(local3)]+0x3 */        #  2ba: 3b29
            l32i         a3, sp, 32 /* [(local6)] */           #  2bc: 3881
            movi         a4, 2 /* 0x00000002 */                #  2be: 0c24
            addi         a3, a3, 3 /* [(local6)]+0x3 */        #  2c0: 3b33
            call0        memcpy                                #  2c2: 01e9ffc0
                                                               #  2c6: 0000
.Lbr013:    movi         a4, 8 /* 0x00000008 */                #  2c8: 0c84
            l32i         a3, sp, 32 /* [(local6)] */           #  2ca: 3881
            l32i         a2, sp, 20 /* [(local3)] */           #  2cc: 2851
            addi         a3, a3, 5 /* [(local6)]+0x5 */        #  2ce: 5b33
            addi         a2, a2, 5 /* [(local3)]+0x5 */        #  2d0: 5b22
            call0        memcpy                                #  2d2: 01e6ffc0
                                                               #  2d6: 0000
            l32i         a4, sp, 28 /* [(local5)] */           #  2d8: 4871
            l32i         a6, sp, 20 /* [(local3)] */           #  2da: 6851
            srli         a5, a4, 8                             #  2dc: 405841
            s8i          a5, a6, 93 /* a5 -> [[(local3)]+0x5d] */ #  2df: 52465d
            l32i         a3, sp, 20 /* [(local3)] */           #  2e2: 3851
            s8i          a4, a3, 94 /* [(local5)] -> [[(local3)]+0x5e] */ #  2e4: 42435e
            l32i         a2, sp, 20 /* [(local3)] */           #  2e7: 2851
            mov          a3, a13 /* arg5 */                    #  2e9: 3d0d
            addi         a2, a2, 95 /* [(local3)]+0x5f */      #  2eb: 22c25f
            call0        memcpy                                #  2ee: 01e0ffc0
                                                               #  2f2: 0000
            l32i         a3, sp, 36 /* [(local7)] */           #  2f4: 3891
            l32i         a2, sp, 20 /* [(local3)] */           #  2f6: 2851
            movi         a4, 32 /* 0x00000020 */               #  2f8: 2c04
            addi         a2, a2, 13 /* [(local3)]+0xd */       #  2fa: db22
            call0        memcpy                                #  2fc: 01deffc0
                                                               #  300: 0000
            mov          a4, a14 /* arg3 */                    #  302: 4d0e
            mov          a2, a12 /* arg0 */                    #  304: 2d0c
            l32i         a5, sp, 40 /* [(local8)] */           #  306: 58a1
            l32i         a7, sp, 24 /* [(local4)] */           #  308: 7861
            l32i         a3, sp, 68 /* [(FP)+0x4] */           #  30a: 322111
            l32i         a9, sp, 16 /* [(local2)] */           #  30d: 9841
            s32i         a9, sp, 0 /* [(local2)] -> [(local0)] */ #  30f: 9901
            l32i         a8, sp, 20 /* [(local3)] */           #  311: 8851
            movi         a6, 0x0000888e                        #  313: 61d3ff
            addi         a8, a8, 77 /* [(local3)]+0x4d */      #  316: 82c84d
            s32i         a8, sp, 4 /* [(local3)]+0x4d -> [(local1)] */ #  319: 8911
            call0        .Lfunc002                             #  31b: 45d0ff
            movi         a2, 0 /* 0x00000000 */                #  31e: 0c02
.Lbr014:    l32i         a12, sp, 48 /* [(local10)] */         #  320: c8c1
            l32i         a13, sp, 52 /* [(local11)] */         #  322: d8d1
            l32i         a14, sp, 56 /* [(local12)] */         #  324: e8e1
            l32i         a0, sp, 44 /* [(local9)] */           #  326: 08b1
            addi         sp, sp, 64 /* (local13) */            #  328: 12c140
            ret                                                #  32b: 0df0
.Lbr015:    l32i         a10, sp, 20 /* [(local3)] */          #  32d: a851
            movi         a11, 2 /* 0x00000002 */               #  32f: 0c2b
            movi         a9, 254 /* 0x000000fe */              #  331: 92a0fe
            movi         a5, 264 /* 0x00000108 */              #  334: 52a108
            l32i         a2, a12, 0x164 /* [arg0+0x164] */     #  337: 222c59
            or           a5, a14, a5                           #  33a: 505e20
            addi         a2, a2, -2 /* [arg0+0x164]-0x2 */     #  33d: 22c2fe
            moveqz       a9, a11, a2                           #  340: 209b83
            s8i          a9, a10, 0 /* a9 -> [[(local3)]] */   #  343: 924a00
            l32i         a8, sp, 20 /* [(local3)] */           #  346: 8851
            srli         a7, a5, 8                             #  348: 507841
            s8i          a7, a8, 1 /* a7 -> [[(local3)]+0x1] */ #  34b: 724801
            l32i         a6, sp, 20 /* [(local3)] */           #  34e: 6851
            s32i         a0, sp, 24 /* a0 -> [(local4)] */     #  350: 0961
            s8i          a5, a6, 2 /* a5 -> [[(local3)]+0x2] */ #  352: 524602
            l32i         a4, a12, 0x164 /* [arg0+0x164] */     #  355: 422c59
            l32i         a9, sp, 20 /* [(local3)] */           #  358: 9851
            addi         a4, a4, -2 /* [arg0+0x164]-0x2 */     #  35a: 42c4fe
            bnez         a4, .Lbr012                           #  35d: 5694f5
            movi         a6, 0 /* 0x00000000 */                #  360: 0c06
            s8i          a6, a9, 3 /* 0x00 -> [[(local3)]+0x3] */ #  362: 624903
            l32i         a7, sp, 20 /* [(local3)] */           #  365: 7851
            s8i          a6, a7, 4 /* 0x00 -> [[(local3)]+0x4] */ #  367: 624704
            j            .Lbr013                               #  36a: 86d6ff

            .literal_position                                  #  370: 00000000
                                                               #  374: 00000000

# Function @ .irom0.text+0x378
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
.Lfunc006:  addi         sp, sp, -32 /* (local0) */            #  378: 12c1e0
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     #  37b: 0941
            l32i         a6, a2, 0x11c /* [arg0+0x11c] */      #  37d: 622247
            movi         a0, 1 /* 0x00000001 */                #  380: 0c10
            beqi         a6, 0x100, .Lbr016                    #  382: 26f604
            beqi         a6, 128, .Lbr016                      #  385: 26e601
            movi         a0, 0 /* 0x00000000 */                #  388: 0c00
.Lbr016:    movi         a7, 48 /* 0x00000030 */               #  38a: 3c07
            movi         a6, 64 /* 0x00000040 */               #  38c: 4c06
            l32i         a3, a2, 32 /* [arg0+0x20] */          #  38e: 3882
            addi         a9, a4, 13 /* arg2+0xd */             #  390: db94
            l32i         a8, a2, 0x114 /* [arg0+0x114] */      #  392: 822245
            movi         a4, .Lstr001                          #  395: 41f6ff
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     #  398: 0931
            s32i         a5, sp, 4 /* arg3 -> [(local1)] */    #  39a: 5911
            addi         a8, a8, -8 /* [arg0+0x114]-0x8 */     #  39c: 82c8f8
            s32i         a9, sp, 0 /* arg2+0xd -> [(local0)] */ #  39f: 9901
            moveqz       a6, a7, a8                            #  3a1: 806783
            movi         a5, 344 /* 0x00000158 */              #  3a4: 52a158
            add          a5, a2, a5 /* arg0+0x158 */           #  3a7: 5a52
            s32i         a6, sp, 8 /* a6 -> [(local2)] */      #  3a9: 6921
            movi         a7, 184 /* 0x000000b8 */              #  3ab: 72a0b8
            add          a7, a2, a7 /* arg0+0xb8 */            #  3ae: 7a72
            movi         a6, 350 /* 0x0000015e */              #  3b0: 62a15e
            add          a6, a2, a6 /* arg0+0x15e */           #  3b3: 6a62
            call0        wpa_pmk_to_ptk                        #  3b5: 01efffc0
                                                               #  3b9: 0000
            movi         a2, 0 /* 0x00000000 */                #  3bb: 0c02
            l32i         a0, sp, 16 /* [(local4)] */           #  3bd: 0841
            addi         sp, sp, 32 /* (top of frame) */       #  3bf: 12c120
            ret           /* 0x00000000 */                     #  3c2: 0df0

            .literal_position                                  #  3c4: 00000000
                                                               #  3c8: 00000000
                                                               #  3cc: 00000000
                                                               #  3d0: 00000000
                                                               #  3d4: 00000000

# Function @ .irom0.text+0x3d8
# Local variables/stack:
#     (local0):  word      @ -0x50
#     (local1):  word[12]  @ -0x4c
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word      @ -0x10
#     (local6):  word      @ -0xc
#     (local7):  word      @ -0x8
#     (local8):  word      @ -0x4
            .balign      4
.Lfunc007:  addi         sp, sp, -80 /* (local0) */            #  3d8: 12c1b0
            s32i         a3, sp, 56 /* arg1 -> [(local3)] */   #  3db: 39e1
            s32i         a5, sp, 60 /* arg3 -> [(local4)] */   #  3dd: 59f1
            s32i         a0, sp, 68 /* a0 -> [(local6)] */     #  3df: 026111
            s32i         a12, sp, 72 /* a12 -> [(local7)] */   #  3e2: c26112
            s32i         a13, sp, 76 /* a13 -> [(local8)] */   #  3e5: d26113
            mov          a12, a2 /* arg0 */                    #  3e8: cd02
            mov          a13, a4 /* arg2 */                    #  3ea: dd04
            movi         a2, 6 /* 0x00000006 */                #  3ec: 0c62
            call0        wpa_sm_set_state                      #  3ee: 050000
            addi         a2, sp, 16 /* (FP)-0x40 */            #  3f1: 22c110
            movi         a3, 0 /* 0x00000000 */                #  3f4: 0c03
            movi         a4, 36 /* 0x00000024 */               #  3f6: 2c44
            call0        memset                                #  3f8: 01f3ffc0
                                                               #  3fc: 0000
            l32i         a0, a12, 0x164 /* [arg0+0x164] */     #  3fe: 022c59
            bnei         a0, 2, .Lbr017                        #  401: 66201a
            addi         a2, a13, 95 /* arg2+0x5f */           #  404: 22cd5f
            l8ui         a4, a13, 93 /* [arg2+0x5d] */         #  407: 420d5d
            l8ui         a3, a13, 94 /* [arg2+0x5e] */         #  40a: 320d5e
            slli         a4, a4, 8                             #  40d: 804411
            or           a3, a3, a4                            #  410: 403320
            extui        a3, a3, 0, 16                         #  413: 3030f4
            addi         a4, sp, 16 /* (FP)-0x40 */            #  416: 42c110
            call0        wpa_supplicant_parse_ies              #  419: 01ebffc0
                                                               #  41d: 0000
.Lbr017:    mov          a2, a12 /* arg0 */                    #  41f: 2d0c
            call0        .Lfunc004                             #  421: 05e3ff
            movi         a5, -2 /* 0xfffffffe */               #  424: 7ce5
            beq          a2, a5, .Lbr020                       #  426: 571274
            bnez         a2, .Lbr019                           #  429: 567206
            l32i         a6, a12, 248 /* [arg0+0xf8] */        #  42c: 622c3e
            movi         a8, 184 /* 0x000000b8 */              #  42f: 82a0b8
            add          a8, a12, a8 /* arg0+0xb8 */           #  432: 8a8c
            s32i         a8, sp, 64 /* arg0+0xb8 -> [(local5)] */ #  434: 826110
            beqz         a6, .Lbr018                           #  437: 9c06
            mov          a2, a8 /* arg0+0xb8 */                #  439: 2d08
            movi         a3, 32 /* 0x00000020 */               #  43b: 2c03
            call0        os_get_random                         #  43d: 01e3ffc0
                                                               #  441: 0000
            bnez         a2, .Lbr019                           #  443: 56d204
            movi         a9, 0 /* 0x00000000 */                #  446: 0c09
            s32i         a9, a12, 248 /* 0x00000000 -> [arg0+0xf8] */ #  448: 926c3e
.Lbr018:    mov          a2, a12 /* arg0 */                    #  44b: 2d0c
            l32i         a3, sp, 56 /* [(local3)] */           #  44d: 38e1
            mov          a4, a13 /* arg2 */                    #  44f: 4d0d
            addi         a5, a12, 112 /* arg0+0x70 */          #  451: 52cc70
            s32i         a5, sp, 52 /* arg0+0x70 -> [(local2)] */ #  454: 59d1
            call0        .Lfunc006                             #  456: 05f2ff
            mov          a2, a12 /* arg0 */                    #  459: 2d0c
            l32i         a4, sp, 52 /* [(local2)] */           #  45b: 48d1
            l32i         a5, a12, 0x14c /* [arg0+0x14c] */     #  45d: 522c53
            movi         a7, 0 /* 0x00000000 */                #  460: 0c07
            movi         a6, 1 /* 0x00000001 */                #  462: 0c16
            movi         a3, 350 /* 0x0000015e */              #  464: 32a15e
            add          a3, a12, a3 /* arg0+0x15e */          #  467: 3a3c
            s32i         a6, a12, 180 /* 0x00000001 -> [arg0+0xb4] */ #  469: 626c2d
            s32i         a7, a12, 176 /* 0x00000000 -> [arg0+0xb0] */ #  46c: 726c2c
            l32i         a6, sp, 64 /* [(local5)] */           #  46f: 622110
            l32i         a7, a12, 0x148 /* [arg0+0x148] */     #  472: 722c52
            s32i         a5, sp, 0 /* [arg0+0x14c] -> [(local0)] */ #  475: 5901
            s32i         a4, sp, 4 /* [(local2)] -> [(local1)] */ #  477: 4911
            l32i         a5, sp, 60 /* [(local4)] */           #  479: 58f1
            mov          a4, a13 /* arg2 */                    #  47b: 4d0d
            call0        .Lfunc005                             #  47d: 85dfff
            bnez         a2, .Lbr019                           #  480: dc02
            addi         a3, a13, 13 /* arg2+0xd */            #  482: db3d
            movi         a4, 32 /* 0x00000020 */               #  484: 2c04
            movi         a2, 216 /* 0x000000d8 */              #  486: 22a0d8
            add          a2, a12, a2 /* arg0+0xd8 */           #  489: 2a2c
            call0        memcpy                                #  48b: 01d1ffc0
                                                               #  48f: 0000
            j            .Lbr020                               #  491: 460200
.Lbr019:    mov          a2, a12 /* arg0 */                    #  494: 2d0c
            movi         a3, 1 /* 0x00000001 */                #  496: 0c13
            call0        wpa_sm_deauthenticate                 #  498: 01cfffc0
                                                               #  49c: 0000
.Lbr020:    l32i         a12, sp, 72 /* [(local7)] */          #  49e: c22112
            l32i         a13, sp, 76 /* [(local8)] */          #  4a1: d22113
            l32i         a0, sp, 68 /* [(local6)] */           #  4a4: 022111
            addi         sp, sp, 80 /* (top of frame) */       #  4a7: 12c150
            ret                                                #  4aa: 0df0

# Function @ .irom0.text+0x4ac
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc008:  movi         a3, 0 /* 0x00000000 */                #  4ac: 0c03
            movi         a4, 1 /* 0x00000001 */                #  4ae: 0c14
            addi         sp, sp, -16 /* (local0) */            #  4b0: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  4b3: 0901
            call0        .Lfunc003                             #  4b5: 85c8ff
            l32i         a0, sp, 0 /* [(local0)] */            #  4b8: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  4ba: 12c110
            ret                                                #  4bd: 0df0

            .literal_position                                  #  4c0: ac040000
                                                               #  4c4: ac040000
                                                               #  4c8: 00000000
                                                               #  4cc: 00000000

# Function @ .irom0.text+0x4d0
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
.Lfunc009:  addi         sp, sp, -32 /* (local0) */            #  4d0: 12c1e0
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   #  4d3: c951
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     #  4d5: 0941
            l32i         a0, a2, 0x114 /* [arg0+0x114] */      #  4d7: 022245
            mov          a12, a2 /* arg0 */                    #  4da: cd02
            beqi         a0, 1, .Lbr025                        #  4dc: 261064
            beqi         a0, 2, .Lbr021                        #  4df: 262009
            bnei         a0, 8, .Lbr023                        #  4e2: 668035
            movi         a3, 3 /* 0x00000003 */                #  4e5: 0c33
            movi         a0, 16 /* 0x00000010 */               #  4e7: 1c00
            j            .Lbr022                               #  4e9: c60000
.Lbr021:    movi         a0, 32 /* 0x00000020 */               #  4ec: 2c00
            movi         a3, 2 /* 0x00000002 */                #  4ee: 0c23
.Lbr022:    movi         a5, 8 /* 0x00000008 */                #  4f0: 0c85
            addi         a4, a12, 80 /* arg0+0x50 */           #  4f2: 42cc50
            movi         a6, 5 /* 0x00000005 */                #  4f5: 0c56
            movi         a7, 408 /* 0x00000198 */              #  4f7: 72a198
            movi         a2, 380 /* 0x0000017c */              #  4fa: 22a17c
            add          a2, a12, a2 /* arg0+0x17c */          #  4fd: 2a2c
            add          a7, a12, a7 /* arg0+0x198 */          #  4ff: 7a7c
            s32i         a6, a12, 0x20c /* 0x00000005 -> [arg0+0x20c] */ #  501: 626c83
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  504: 0921
            s32i         a4, sp, 4 /* arg0+0x50 -> [(local1)] */ #  506: 4911
            s32i         a5, sp, 0 /* 0x00000008 -> [(local0)] */ #  508: 5901
            s32i         a6, sp, 12 /* 0x00000005 -> [(local3)] */ #  50a: 6931
            movi         a5, 0 /* 0x00000000 */                #  50c: 0c05
            movi         a6, 1 /* 0x00000001 */                #  50e: 0c16
            movi         a4, 350 /* 0x0000015e */              #  510: 42a15e
            add          a4, a12, a4 /* arg0+0x15e */          #  513: 4a4c
            call0        .Lfunc032                             #  515: 85f000
            bgez         a2, .Lbr024                           #  518: d64200
.Lbr023:    movi         a2, -1 /* 0xffffffff */               #  51b: 7cf2
            j            .Lbr026                               #  51d: 460900
.Lbr024:    l32i         a7, a12, 0x154 /* [arg0+0x154] */     #  520: 722c55
            beqz         a7, .Lbr025                           #  523: 9cd7
            mov          a3, a12 /* arg0 */                    #  525: 3d0c
            movi         a2, .Lfunc008                         #  527: 21e6ff
            movi         a4, 0 /* 0x00000000 */                #  52a: 0c04
            call0        eloop_cancel_timeout                  #  52c: 01e7ffc0
                                                               #  530: 0000
            mov          a5, a12 /* arg0 */                    #  532: 5d0c
            movi         a4, .Lfunc008                         #  534: 41e4ff
            l32i         a2, a12, 0x154 /* [arg0+0x154] */     #  537: 222c55
            movi         a3, 0 /* 0x00000000 */                #  53a: 0c03
            movi         a6, 0 /* 0x00000000 */                #  53c: 0c06
            call0        eloop_register_timeout                #  53e: 01e3ffc0
                                                               #  542: 0000
.Lbr025:    movi         a2, 0 /* 0x00000000 */                #  544: 0c02
.Lbr026:    l32i         a12, sp, 20 /* [(local5)] */          #  546: c851
            l32i         a0, sp, 16 /* [(local4)] */           #  548: 0841
            addi         sp, sp, 32 /* (top of frame) */       #  54a: 12c120
            ret                                                #  54d: 0df0

            .balign      4
# Function @ .irom0.text+0x550
            .balign      4
.Lfunc010:  movi         a8, 6 /* 0x00000006 */                #  550: 0c68
            beqi         a2, 2, .Lbr029                        #  552: 26221c
            beqi         a2, 8, .Lbr030                        #  555: 268226
            movi         a9, 0 /* 0x00000000 */                #  558: 0c09
            beqi         a2, 128, .Lbr032                      #  55a: 26e231
            beqi         a2, 0x100, .Lbr027                    #  55d: 26f203
            movi         a2, -1 /* 0xffffffff */               #  560: 7cf2
            ret           /* 0xffffffff */                     #  562: 0df0
.Lbr027:    movi         a2, 13 /* 0x0000000d */               #  564: 0cd2
            bne          a3, a2, .Lbr028                       #  566: 279304
            movi         a3, 12 /* 0x0000000c */               #  569: 0cc3
            blt          a3, a4, .Lbr033                       #  56b: 47232d
.Lbr028:    movi         a2, -1 /* 0xffffffff */               #  56e: 7cf2
            ret           /* 0xffffffff */                     #  570: 0df0
.Lbr029:    bnei         a3, 32, .Lbr028                       #  572: 66c3f8
            blti         a4, 32, .Lbr028                       #  575: a6c4f5
            s32i         a8, a5, 0 /* 0x00000006 -> [arg3] */  #  578: 8905
            movi         a2, 2 /* 0x00000002 */                #  57a: 0c22
            j            .Lbr031                               #  57c: 460200
.Lbr030:    bnei         a3, 16, .Lbr028                       #  57f: 66b3eb
            blti         a4, 16, .Lbr028                       #  582: a6b4e8
            s32i         a8, a5, 0 /* 0x00000006 -> [arg3] */  #  585: 8905
            movi         a2, 3 /* 0x00000003 */                #  587: 0c32
.Lbr031:    s32i         a2, a6, 0 /* a2 -> [arg4] */          #  589: 2906
            movi         a2, 0 /* 0x00000000 */                #  58b: 0c02
            ret           /* 0x00000000 */                     #  58d: 0df0
.Lbr032:    bnei         a3, 5, .Lbr028                        #  58f: 6653db
            blti         a4, 5, .Lbr028                        #  592: a654d8
            s32i         a9, a5, 0 /* 0x00000000 -> [arg3] */  #  595: 9905
            movi         a3, 1 /* 0x00000001 */                #  597: 0c13
            j            .Lbr034                               #  599: c60000
.Lbr033:    s32i         a9, a5, 0 /* 0x00000000 -> [arg3] */  #  59c: 9905
            movi         a3, 5 /* 0x00000005 */                #  59e: 0c53
.Lbr034:    mov          a2, a9 /* 0x00000000 */               #  5a0: 2d09
            s32i         a3, a6, 0 /* a3 -> [arg4] */          #  5a2: 3906
            ret           /* 0x00000000 */                     #  5a4: 0df0

            .literal_position                                  #  5a8: 00000000

# Function @ .irom0.text+0x5ac
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
.Lfunc011:  addi         sp, sp, -16 /* (local0) */            #  5ac: 12c1f0
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    #  5af: 3901
            s32i         a4, sp, 4 /* arg2 -> [(local1)] */    #  5b1: 4911
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  5b3: c931
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  5b5: 0921
            mov          a12, a2 /* arg0 */                    #  5b7: cd02
            movi         a2, 9 /* 0x00000009 */                #  5b9: 0c92
            call0        wpa_sm_set_state                      #  5bb: 050000
            l32i         a0, a12, 0x224 /* [arg0+0x224] */     #  5be: 022c89
            callx0       a0 /* [arg0+0x224] */                 #  5c1: c00000
            l32i         a2, sp, 4 /* [(local1)] */            #  5c4: 2811
            beqz         a2, .Lbr036                           #  5c6: ac32
            l32i         a3, sp, 0 /* [(local0)] */            #  5c8: 3801
            mov          a2, a12 /* arg0 */                    #  5ca: 2d0c
            movi         a4, 3 /* 0x00000003 */                #  5cc: 0c34
            movi         a5, 1 /* 0x00000001 */                #  5ce: 0c15
            call0        wpa_sm_mlme_setprotection             #  5d0: 01f6ffc0
                                                               #  5d4: 0000
            l32i         a2, a12, 0x11c /* [arg0+0x11c] */     #  5d6: 222c47
            movi         a0, 1 /* 0x00000001 */                #  5d9: 0c10
            beqi         a2, 2, .Lbr035                        #  5db: 262207
            beqi         a2, 64, .Lbr035                       #  5de: 26d204
            beqi         a2, 0x100, .Lbr035                    #  5e1: 26f201
            movi         a0, 0 /* 0x00000000 */                #  5e4: 0c00
.Lbr035:    beqz         a0, .Lbr036                           #  5e6: 8c30
            movi         a2, 1 /* 0x00000001 */                #  5e8: 0c12
            call0        .Lfunc001                             #  5ea: 45a1ff
.Lbr036:    l32i         a12, sp, 12 /* [(local3)] */          #  5ed: c831
            l32i         a0, sp, 8 /* [(local2)] */            #  5ef: 0821
            addi         sp, sp, 16 /* (top of frame) */       #  5f1: 12c110
            ret                                                #  5f4: 0df0

            .literal_position                                  #  5f8: 00000000
                                                               #  5fc: 00000000
                                                               #  600: 00000000
                                                               #  604: 20140000

# Function @ .irom0.text+0x608
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word      @ -0x3c
#     (local2):  word      @ -0x38
#     (local3):  word[9]   @ -0x34
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
.Lfunc012:  addi         sp, sp, -64 /* (local0) */            #  608: 12c1c0
            s32i         a0, sp, 48 /* a0 -> [(local4)] */     #  60b: 09c1
            s32i         a13, sp, 56 /* a13 -> [(local6)] */   #  60d: d9e1
            s32i         a12, sp, 52 /* a12 -> [(local5)] */   #  60f: c9d1
            mov          a13, a2 /* arg0 */                    #  611: dd02
            mov          a12, a3 /* arg1 */                    #  613: cd03
            l32i         a0, a2, 0x118 /* [arg0+0x118] */      #  615: 022246
            addi         a3, a3, 16 /* arg1+0x10 */            #  618: 32c310
            bnei         a0, 2, .Lbr037                        #  61b: 662029
            addi         a2, sp, 16 /* (FP)-0x30 */            #  61e: 22c110
            movi         a4, 16 /* 0x00000010 */               #  621: 1c04
            call0        memcpy                                #  623: 01f5ffc0
                                                               #  627: 0000
            addi         a2, sp, 32 /* (FP)-0x20 */            #  629: 22c120
            addi         a3, a12, 32 /* arg1+0x20 */           #  62c: 32cc20
            movi         a4, 8 /* 0x00000008 */                #  62f: 0c84
            call0        memcpy                                #  631: 01f2ffc0
                                                               #  635: 0000
            addi         a2, sp, 40 /* (FP)-0x18 */            #  637: 22c128
            addi         a3, a12, 40 /* arg1+0x28 */           #  63a: 32cc28
            movi         a4, 8 /* 0x00000008 */                #  63d: 0c84
            call0        memcpy                                #  63f: 01f0ffc0
                                                               #  643: 0000
            addi         a3, sp, 16 /* (FP)-0x30 */            #  645: 32c110
.Lbr037:    l32i         a6, a13, 0x114 /* [arg0+0x114] */     #  648: 622d45
            l32i         a11, a12, 12 /* [arg1+0xc] */         #  64b: b83c
            movi         a7, 480 /* 0x000001e0 */              #  64d: 72a1e0
            movi         a4, 350 /* 0x0000015e */              #  650: 42a15e
            movi         a2, 452 /* 0x000001c4 */              #  653: 22a1c4
            add          a2, a13, a2 /* arg0+0x1c4 */          #  656: 2a2d
            add          a4, a13, a4 /* arg0+0x15e */          #  658: 4a4d
            add          a7, a13, a7 /* arg0+0x1e0 */          #  65a: 7a7d
            s32i         a11, a13, 0x20c /* [arg1+0xc] -> [arg0+0x20c] */ #  65c: b26d83
            l32i         a5, a12, 12 /* [arg1+0xc] */          #  65f: 583c
            l32i         a10, a12, 0 /* [arg1] */              #  661: a80c
            l32i         a9, a12, 8 /* [arg1+0x8] */           #  663: 982c
            l32i         a0, a12, 48 /* [arg1+0x30] */         #  665: 08cc
            bnei         a6, 1, .Lbr039                        #  667: 661619
            s32i         a9, sp, 0 /* [arg1+0x8] -> [(local0)] */ #  66a: 9901
            s32i         a11, sp, 12 /* [arg1+0xc] -> [(local3)] */ #  66c: b931
            movi         a6, 1 /* 0x00000001 */                #  66e: 0c16
            s32i         a3, sp, 4 /* a3 -> [(local1)] */      #  670: 3911
            s32i         a0, sp, 8 /* [arg1+0x30] -> [(local2)] */ #  672: 0921
            mov          a3, a10 /* [arg1] */                  #  674: 3d0a
            call0        .Lfunc032                             #  676: 01e3ffc0
                                                               #  67a: 0000
            bgez         a2, .Lbr040                           #  67c: d66201
.Lbr038:    movi         a2, -1 /* 0xffffffff */               #  67f: 7cf2
            j            .Lbr041                               #  681: c60400
.Lbr039:    l32i         a6, a12, 4 /* [arg1+0x4] */           #  684: 681c
            s32i         a9, sp, 0 /* [arg1+0x8] -> [(local0)] */ #  686: 9901
            s32i         a11, sp, 12 /* [arg1+0xc] -> [(local3)] */ #  688: b931
            s32i         a3, sp, 4 /* a3 -> [(local1)] */      #  68a: 3911
            s32i         a0, sp, 8 /* [arg1+0x30] -> [(local2)] */ #  68c: 0921
            mov          a3, a10 /* [arg1] */                  #  68e: 3d0a
            call0        .Lfunc032                             #  690: c5d800
            bltz         a2, .Lbr038                           #  693: 9682fe
.Lbr040:    movi         a2, 0 /* 0x00000000 */                #  696: 0c02
.Lbr041:    l32i         a12, sp, 52 /* [(local5)] */          #  698: c8d1
            l32i         a13, sp, 56 /* [(local6)] */          #  69a: d8e1
            l32i         a0, sp, 48 /* [(local4)] */           #  69c: 08c1
            addi         sp, sp, 64 /* (top of frame) */       #  69e: 12c140
            ret                                                #  6a1: 0df0

            .balign      4
# Function @ .irom0.text+0x6a4
            .balign      4
.Lfunc013:  mov          a5, a2 /* arg0 */                     #  6a4: 5d02
            mov          a2, a3 /* arg1 */                     #  6a6: 2d03
            beqz         a3, .Lbr042                           #  6a8: 8c63
            l32i         a3, a5, 0x114 /* [arg0+0x114] */      #  6aa: 322545
            beqi         a3, 1, .Lbr042                        #  6ad: 261301
            movi         a2, 0 /* 0x00000000 */                #  6b0: 0c02
.Lbr042:    ret                                                #  6b2: 0df0

            .literal_position                                  #  6b4: 00000000
                                                               #  6b8: 00000000

# Function @ .irom0.text+0x6bc
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
.Lfunc014:  addi         sp, sp, -32 /* (local0) */            #  6bc: 12c1e0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  6bf: 0911
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  6c1: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  6c3: c921
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  6c5: e941
            mov          a12, a2 /* arg0 */                    #  6c7: cd02
            mov          a14, a3 /* arg1 */                    #  6c9: ed03
            mov          a13, a4 /* arg2 */                    #  6cb: dd04
            movi         a3, 0 /* 0x00000000 */                #  6cd: 0c03
            movi         a4, 52 /* 0x00000034 */               #  6cf: 3c44
            movi         a2, 552 /* 0x00000228 */              #  6d1: 22a228
            add          a2, a12, a2 /* arg0+0x228 */          #  6d4: 2a2c
            s32i         a2, sp, 0 /* arg0+0x228 -> [(local0)] */ #  6d6: 2901
            call0        memset                                #  6d8: 01f7ffc0
                                                               #  6dc: 0000
            bltui        a13, 2, .Lbr043                       #  6de: b62d48
            addi         a13, a13, -2 /* arg2-0x2 */           #  6e1: d2cdfe
            movi         a3, 32 /* 0x00000020 */               #  6e4: 2c03
            bltu         a3, a13, .Lbr043                      #  6e6: d73340
            l8ui         a4, a14, 0 /* [arg1] */               #  6e9: 420e00
            extui        a4, a4, 0, 2                          #  6ec: 404014
            s32i         a4, a12, 0x234 /* a4 -> [arg0+0x234] */ #  6ef: 426c8d
            l8ui         a3, a14, 0 /* [arg1] */               #  6f2: 320e00
            mov          a2, a12 /* arg0 */                    #  6f5: 2d0c
            extui        a3, a3, 2, 1                          #  6f7: 303204
            call0        .Lfunc013                             #  6fa: 85faff
            addi         a3, a14, 2 /* arg1+0x2 */             #  6fd: 2b3e
            s32i         a2, a12, 0x22c /* a2 -> [arg0+0x22c] */ #  6ff: 226c8b
            mov          a4, a13 /* arg2-0x2 */                #  702: 4d0d
            movi         a2, 568 /* 0x00000238 */              #  704: 22a238
            add          a2, a12, a2 /* arg0+0x238 */          #  707: 2a2c
            call0        memcpy                                #  709: 01ebffc0
                                                               #  70d: 0000
            mov          a4, a13 /* arg2-0x2 */                #  70f: 4d0d
            s32i         a13, a12, 0x258 /* arg2-0x2 -> [arg0+0x258] */ #  711: d26c96
            mov          a3, a13 /* arg2-0x2 */                #  714: 3d0d
            l32i         a2, a12, 0x118 /* [arg0+0x118] */     #  716: 222c46
            l32i         a6, sp, 0 /* [(local0)] */            #  719: 6801
            movi         a5, 560 /* 0x00000230 */              #  71b: 52a230
            add          a5, a12, a5 /* arg0+0x230 */          #  71e: 5a5c
            call0        .Lfunc010                             #  720: c5e2ff
            bnez         a2, .Lbr043                           #  723: cc32
            movi         a2, 0 /* 0x00000000 */                #  725: 0c02
            j            .Lbr044                               #  727: 460000
.Lbr043:    movi         a2, -1 /* 0xffffffff */               #  72a: 7cf2
.Lbr044:    l32i         a12, sp, 8 /* [(local2)] */           #  72c: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  72e: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  730: e841
            l32i         a0, sp, 4 /* [(local1)] */            #  732: 0811
            addi         sp, sp, 32 /* (top of frame) */       #  734: 12c120
            ret                                                #  737: 0df0

            .literal_position                                  #  73c: 00000000

# Function @ .irom0.text+0x740
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc015:  movi         a3, 17 /* 0x00000011 */               #  740: 1c13
            addi         sp, sp, -16 /* (local0) */            #  742: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  745: 0901
            call0        wpa_sm_disassociate                   #  747: 01fdffc0
                                                               #  74b: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  74d: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  74f: 12c110
            ret                                                #  752: 0df0

# Function @ .irom0.text+0x754
            .balign      4
.Lfunc016:  movi         a2, 0 /* 0x00000000 */                #  754: 0c02
            ret           /* 0x00000000 */                     #  756: 0df0

            .literal_position                                  #  758: 00000000
                                                               #  75c: 00000000
                                                               #  760: 00000000

# Function @ .irom0.text+0x764
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
.Lfunc017:  addi         sp, sp, -32 /* (local0) */            #  764: 12c1e0
            s32i         a14, sp, 20 /* a14 -> [(local5)] */   #  767: e951
            s32i         a15, sp, 24 /* a15 -> [(local6)] */   #  769: f961
            s32i         a3, sp, 4 /* arg1 -> [(local1)] */    #  76b: 3911
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  76d: c931
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   #  76f: d941
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  771: 0921
            mov          a13, a4 /* arg2 */                    #  773: dd04
            l32i         a0, a2, 0x16c /* [arg0+0x16c] */      #  775: 02225b
            mov          a12, a2 /* arg0 */                    #  778: cd02
            bnez         a0, .Lbr045                           #  77a: ccb0
            l32i         a2, a2, 0x170 /* [arg0+0x170] */      #  77c: 22225c
            bnez         a2, .Lbr045                           #  77f: cc62
            mov          a2, a12 /* arg0 */                    #  781: 2d0c
            call0        wpa_sm_get_beacon_ie                  #  783: 01f5ffc0
                                                               #  787: 0000
.Lbr045:    l32i         a15, a13, 0 /* [arg2] */              #  789: f80d
            l32i         a14, a13, 8 /* [arg2+0x8] */          #  78b: e82d
            bnez         a15, .Lbr047                          #  78d: ccef
            bnez         a14, .Lbr046                          #  78f: ccae
            l32i         a3, a12, 0x16c /* [arg0+0x16c] */     #  791: 322c5b
            bnez         a3, .Lbr051                           #  794: 561306
            l32i         a4, a12, 0x170 /* [arg0+0x170] */     #  797: 422c5c
            bnez         a4, .Lbr051                           #  79a: 56b405
.Lbr046:    beqz         a15, .Lbr048                          #  79d: 9cbf
.Lbr047:    l32i         a3, a12, 0x16c /* [arg0+0x16c] */     #  79f: 322c5b
            l32i         a5, a12, 0x174 /* [arg0+0x174] */     #  7a2: 522c5d
            beqz         a3, .Lbr048                           #  7a5: 9c33
            l32i         a0, a13, 4 /* [arg2+0x4] */           #  7a7: 081d
            s32i         a0, sp, 0 /* [arg2+0x4] -> [(local0)] */ #  7a9: 0901
            bne          a5, a0, .Lbr050                       #  7ab: 079538
            mov          a2, a15 /* [arg2] */                  #  7ae: 2d0f
            mov          a4, a0 /* [arg2+0x4] */               #  7b0: 4d00
            call0        memcmp                                #  7b2: 01eaffc0
                                                               #  7b6: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  7b8: 0801
            bnez         a2, .Lbr050                           #  7ba: ec92
.Lbr048:    beqz         a14, .Lbr054                          #  7bc: 16ce05
            l32i         a3, a12, 0x170 /* [arg0+0x170] */     #  7bf: 322c5c
            movi         a2, 1 /* 0x00000001 */                #  7c2: 0c12
            beqz         a3, .Lbr054                           #  7c4: 164305
            l32i         a0, a12, 0x11c /* [arg0+0x11c] */     #  7c7: 022c47
            beqi         a0, 64, .Lbr049                       #  7ca: 26d004
            beqi         a0, 32, .Lbr049                       #  7cd: 26c001
            movi         a2, 0 /* 0x00000000 */                #  7d0: 0c02
.Lbr049:    mov          a5, a14 /* [arg2+0x8] */              #  7d2: 5d0e
            l32i         a4, a12, 0x178 /* [arg0+0x178] */     #  7d4: 422c5e
            l32i         a6, a13, 12 /* [arg2+0xc] */          #  7d7: 683d
            call0        wpa_compare_rsn_ie                    #  7d9: 01e1ffc0
                                                               #  7dd: 0000
            beqz         a2, .Lbr054                           #  7df: bc92
            l32i         a15, a13, 0 /* [arg2] */              #  7e1: f80d
            l32i         a14, a13, 8 /* [arg2+0x8] */          #  7e3: e82d
            l32i         a0, a13, 4 /* [arg2+0x4] */           #  7e5: 081d
.Lbr050:    mov          a6, a14 /* [arg2+0x8] */              #  7e7: 6d0e
            mov          a4, a15 /* [arg2] */                  #  7e9: 4d0f
            mov          a2, a12 /* arg0 */                    #  7eb: 2d0c
            l32i         a3, sp, 4 /* [(local1)] */            #  7ed: 3811
            l32i         a7, a13, 12 /* [arg2+0xc] */          #  7ef: 783d
            mov          a5, a0                                #  7f1: 5d00
            call0        .Lfunc015                             #  7f3: c5f4ff
            j            .Lbr052                               #  7f6: 860300
.Lbr051:    mov          a6, a14 /* [arg2+0x8] */              #  7f9: 6d0e
            mov          a4, a15 /* [arg2] */                  #  7fb: 4d0f
            mov          a2, a12 /* arg0 */                    #  7fd: 2d0c
            l32i         a3, sp, 4 /* [(local1)] */            #  7ff: 3811
            l32i         a5, a13, 4 /* [arg2+0x4] */           #  801: 581d
            l32i         a7, a13, 12 /* [arg2+0xc] */          #  803: 783d
            call0        .Lfunc015                             #  805: 85f3ff
.Lbr052:    movi         a2, -1 /* 0xffffffff */               #  808: 7cf2
            j            .Lbr053                               #  80a: c6ffff
.Lbr053:    l32i         a12, sp, 12 /* [(local3)] */          #  80d: c831
            l32i         a13, sp, 16 /* [(local4)] */          #  80f: d841
            l32i         a14, sp, 20 /* [(local5)] */          #  811: e851
            l32i         a15, sp, 24 /* [(local6)] */          #  813: f861
            l32i         a0, sp, 8 /* [(local2)] */            #  815: 0821
            addi         sp, sp, 32 /* (top of frame) */       #  817: 12c120
            ret                                                #  81a: 0df0
.Lbr054:    l32i         a6, a12, 0x164 /* [arg0+0x164] */     #  81c: 622c59
            movi         a2, 0 /* 0x00000000 */                #  81f: 0c02
            bnei         a6, 1, .Lbr053                        #  821: 6616e8
            l32i         a14, a13, 8 /* [arg2+0x8] */          #  824: e82d
            beqz         a14, .Lbr053                          #  826: 163efe
            l32i         a7, a12, 0x170 /* [arg0+0x170] */     #  829: 722c5c
            bnez         a7, .Lbr053                           #  82c: 56d7fd
            l32i         a8, a12, 0x124 /* [arg0+0x124] */     #  82f: 822c49
            beqz         a8, .Lbr053                           #  832: 1678fd
            mov          a6, a14 /* [arg2+0x8] */              #  835: 6d0e
            mov          a2, a12 /* arg0 */                    #  837: 2d0c
            l32i         a3, sp, 4 /* [(local1)] */            #  839: 3811
            l32i         a4, a13, 0 /* [arg2] */               #  83b: 480d
            l32i         a5, a13, 4 /* [arg2+0x4] */           #  83d: 581d
            l32i         a7, a13, 12 /* [arg2+0xc] */          #  83f: 783d
            call0        .Lfunc015                             #  841: c5efff
            j            .Lbr052                               #  844: 06f0ff

            .literal_position                                  #  848: 8e880000
                                                               #  84c: 00000000
                                                               #  850: 00000000
                                                               #  854: 00000000
                                                               #  858: 00000000

# Function @ .irom0.text+0x85c
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word[3]   @ -0x3c
#     (local2):  word      @ -0x30
#     (local3):  word      @ -0x2c
#     (local4):  word      @ -0x28
#     (local5):  word      @ -0x24
#     (local6):  word      @ -0x20
#     (local7):  word      @ -0x1c
#     (local8):  word      @ -0x18
#     (local9):  word      @ -0x14
#     (local10): word      @ -0x10
#     (local11): word      @ -0xc
#     (local12): word[2]   @ -0x8
            .balign      4
.Lfunc018:  addi         sp, sp, -64 /* (local0) */            #  85c: 12c1c0
            s32i         a0, sp, 36 /* a0 -> [(local7)] */     #  85f: 0991
            s32i         a15, sp, 52 /* a15 -> [(local11)] */  #  861: f9d1
            s32i         a14, sp, 48 /* a14 -> [(local10)] */  #  863: e9c1
            s32i         a13, sp, 44 /* a13 -> [(local9)] */   #  865: d9b1
            s32i         a7, sp, 56 /* arg5 -> [(local12)] */  #  867: 79e1
            s32i         a6, sp, 32 /* arg4 -> [(local6)] */   #  869: 6981
            s32i         a12, sp, 40 /* a12 -> [(local8)] */   #  86b: c9a1
            s32i         a3, sp, 28 /* arg1 -> [(local5)] */   #  86d: 3971
            mov          a12, a2 /* arg0 */                    #  86f: cd02
            movi         a3, 3 /* 0x00000003 */                #  871: 0c33
            addi         a6, sp, 16 /* (local2) */             #  873: 62c110
            addi         a7, sp, 20 /* (local3) */             #  876: 72c114
            mov          a13, a5 /* arg3 */                    #  879: dd05
            mov          a14, a4 /* arg2 */                    #  87b: ed04
            l32i         a15, sp, 64 /* [(local13)] */         #  87d: f22110
            movi         a4, 0 /* 0x00000000 */                #  880: 0c04
            addi         a5, a15, 95 /* [(local13)]+0x5f */    #  882: 52cf5f
            extui        a5, a5, 0, 16                         #  885: 5050f4
            call0        wpa_sm_alloc_eapol                    #  888: 01f1ffc0
                                                               #  88c: 0000
            mov          a0, a2                                #  88e: 0d02
            bnez         a2, .Lbr055                           #  890: cc32
            movi         a2, -1 /* 0xffffffff */               #  892: 7cf2
            j            .Lbr059                               #  894: 462700
.Lbr055:    l32i         a8, sp, 20 /* [(local3)] */           #  897: 8851
            movi         a4, 264 /* 0x00000108 */              #  899: 42a108
            movi         a9, 2 /* 0x00000002 */                #  89c: 0c29
            movi         a7, 254 /* 0x000000fe */              #  89e: 72a0fe
            l32i         a10, a12, 0x164 /* [arg0+0x164] */    #  8a1: a22c59
            l32i         a3, sp, 32 /* [(local6)] */           #  8a4: 3881
            movi         a5, 512 /* 0x00000200 */              #  8a6: 52a200
            and          a3, a3, a5                            #  8a9: 503310
            addi         a10, a10, -2 /* [arg0+0x164]-0x2 */   #  8ac: a2cafe
            moveqz       a7, a9, a10                           #  8af: a07983
            or           a3, a13, a3                           #  8b2: 303d20
            or           a3, a3, a4                            #  8b5: 403320
            s8i          a7, a8, 0 /* a7 -> [[(local3)]] */    #  8b8: 724800
            l32i         a6, sp, 20 /* [(local3)] */           #  8bb: 6851
            srli         a5, a3, 8                             #  8bd: 305841
            s8i          a5, a6, 1 /* a5 -> [[(local3)]+0x1] */ #  8c0: 524601
            l32i         a4, sp, 20 /* [(local3)] */           #  8c3: 4851
            s32i         a0, sp, 24 /* a0 -> [(local4)] */     #  8c5: 0961
            s8i          a3, a4, 2 /* a3 -> [[(local3)]+0x2] */ #  8c7: 324402
            l32i         a2, a12, 0x164 /* [arg0+0x164] */     #  8ca: 222c59
            l32i         a4, sp, 20 /* [(local3)] */           #  8cd: 4851
            bnei         a2, 2, .Lbr056                        #  8cf: 66220c
            movi         a6, 0 /* 0x00000000 */                #  8d2: 0c06
            s8i          a6, a4, 3 /* 0x00 -> [[(local3)]+0x3] */ #  8d4: 624403
            l32i         a7, sp, 20 /* [(local3)] */           #  8d7: 7851
            s8i          a6, a7, 4 /* 0x00 -> [[(local3)]+0x4] */ #  8d9: 624704
            j            .Lbr057                               #  8dc: c60200
.Lbr056:    addi         a2, a4, 3 /* [(local3)]+0x3 */        #  8df: 3b24
            addi         a3, a14, 3 /* arg2+0x3 */             #  8e1: 3b3e
            movi         a4, 2 /* 0x00000002 */                #  8e3: 0c24
            call0        memcpy                                #  8e5: 01daffc0
                                                               #  8e9: 0000
.Lbr057:    addi         a3, a14, 5 /* arg2+0x5 */             #  8eb: 5b3e
            l32i         a2, sp, 20 /* [(local3)] */           #  8ed: 2851
            movi         a4, 8 /* 0x00000008 */                #  8ef: 0c84
            addi         a2, a2, 5 /* [(local3)]+0x5 */        #  8f1: 5b22
            call0        memcpy                                #  8f3: 01d8ffc0
                                                               #  8f7: 0000
            l32i         a6, sp, 20 /* [(local3)] */           #  8f9: 6851
            srli         a5, a15, 8                            #  8fb: f05841
            s8i          a5, a6, 93 /* a5 -> [[(local3)]+0x5d] */ #  8fe: 52465d
            l32i         a4, sp, 20 /* [(local3)] */           #  901: 4851
            l32i         a3, sp, 56 /* [(local12)] */          #  903: 38e1
            s8i          a15, a4, 94 /* [(local13)] -> [[(local3)]+0x5e] */ #  905: f2445e
            beqz         a3, .Lbr058                           #  908: 8cb3
            l32i         a2, sp, 20 /* [(local3)] */           #  90a: 2851
            mov          a4, a15 /* [(local13)] */             #  90c: 4d0f
            addi         a2, a2, 95 /* [(local3)]+0x5f */      #  90e: 22c25f
            call0        memcpy                                #  911: 01d1ffc0
                                                               #  915: 0000
.Lbr058:    mov          a4, a13 /* arg3 */                    #  917: 4d0d
            mov          a2, a12 /* arg0 */                    #  919: 2d0c
            l32i         a5, sp, 28 /* [(local5)] */           #  91b: 5871
            l32i         a7, sp, 24 /* [(local4)] */           #  91d: 7861
            l32i         a3, sp, 68 /* [(FP)+0x4] */           #  91f: 322111
            l32i         a9, sp, 16 /* [(local2)] */           #  922: 9841
            s32i         a9, sp, 0 /* [(local2)] -> [(local0)] */ #  924: 9901
            l32i         a8, sp, 20 /* [(local3)] */           #  926: 8851
            movi         a6, 0x0000888e                        #  928: 61c8ff
            addi         a8, a8, 77 /* [(local3)]+0x4d */      #  92b: 82c84d
            s32i         a8, sp, 4 /* [(local3)]+0x4d -> [(local1)] */ #  92e: 8911
            call0        .Lfunc002                             #  930: c56eff
            movi         a2, 0 /* 0x00000000 */                #  933: 0c02
.Lbr059:    l32i         a12, sp, 40 /* [(local8)] */          #  935: c8a1
            l32i         a13, sp, 44 /* [(local9)] */          #  937: d8b1
            l32i         a14, sp, 48 /* [(local10)] */         #  939: e8c1
            l32i         a15, sp, 52 /* [(local11)] */         #  93b: f8d1
            l32i         a0, sp, 36 /* [(local7)] */           #  93d: 0891
            addi         sp, sp, 64 /* (local13) */            #  93f: 12c140
            ret                                                #  942: 0df0

            .literal_position                                  #  944: 00000000
                                                               #  948: 00000000
                                                               #  94c: 00000000

# Function @ .irom0.text+0x950
# Local variables/stack:
#     (local0):  word      @ -0x18
#     (local1):  word      @ -0x14
#     (local2):  word      @ -0x10
#     (local3):  word[3]   @ -0xc
            .balign      4
.Lfunc019:  addi         sp, sp, -32 /* (FP)-0x20 */           #  950: 12c1e0
            s32i         a0, sp, 16 /* a0 -> [(local2)] */     #  953: 0941
            s32i         a4, sp, 8 /* arg2 -> [(local0)] */    #  955: 4921
            s32i         a3, sp, 12 /* arg1 -> [(local1)] */   #  957: 3931
            s32i         a12, sp, 20 /* a12 -> [(local3)] */   #  959: c951
            movi         a3, .Ldata024                         #  95b: 31faff
            mov          a12, a2 /* arg0 */                    #  95e: cd02
            movi         a4, 8 /* 0x00000008 */                #  960: 0c84
            mov          a2, sp /* (FP)-0x20 */                #  962: 2d01
            call0        memcpy                                #  964: 01f9ffc0
                                                               #  968: 0000
            l32i         a0, a12, 0x164 /* [arg0+0x164] */     #  96a: 022c59
            l32i         a3, sp, 12 /* [(local1)] */           #  96d: 3831
            bnei         a0, 2, .Lbr060                        #  96f: 662004
            mov          a3, sp /* (FP)-0x20 */                #  972: 3d01
            j            .Lbr061                               #  974: 860000
.Lbr060:    addi         a3, a3, 61 /* [(local1)]+0x3d */      #  977: 32c33d
.Lbr061:    l32i         a5, sp, 8 /* [(local0)] */            #  97a: 5821
            movi         a4, 480 /* 0x000001e0 */              #  97c: 42a1e0
            movi         a2, 408 /* 0x00000198 */              #  97f: 22a198
            moveqz       a2, a4, a5                            #  982: 502483
            add          a2, a12, a2                           #  985: 2a2c
            movi         a4, 8 /* 0x00000008 */                #  987: 0c84
            call0        memcpy                                #  989: 01f0ffc0
                                                               #  98d: 0000
            l32i         a12, sp, 20 /* [(local3)] */          #  98f: c851
            l32i         a0, sp, 16 /* [(local2)] */           #  991: 0841
            addi         sp, sp, 32 /* (top of frame) */       #  993: 12c120
            ret                                                #  996: 0df0

            .literal_position                                  #  998: 00000000
                                                               #  99c: 00000000
                                                               #  9a0: 00000000

# Function @ .irom0.text+0x9a4
# Local variables/stack:
#     (local0):  word      @ -0x50
#     (local1):  word[8]   @ -0x4c
#     (local2):  word      @ -0x2c
#     (local3):  word[3]   @ -0x28
#     (local4):  word      @ -0x1c
#     (local5):  word      @ -0x18
#     (local6):  word      @ -0x14
#     (local7):  word      @ -0x10
#     (local8):  word      @ -0xc
#     (local9):  word      @ -0x8
#     (local10): word      @ -0x4
            .balign      4
.Lfunc020:  addi         sp, sp, -80 /* (local0) */            #  9a4: 12c1b0
            s32i         a14, sp, 76 /* a14 -> [(local10)] */  #  9a7: e26113
            s32i         a4, sp, 56 /* arg2 -> [(local5)] */   #  9aa: 49e1
            s32i         a0, sp, 64 /* a0 -> [(local7)] */     #  9ac: 026110
            s32i         a12, sp, 68 /* a12 -> [(local8)] */   #  9af: c26111
            s32i         a13, sp, 72 /* a13 -> [(local9)] */   #  9b2: d26112
            mov          a12, a2 /* arg0 */                    #  9b5: cd02
            mov          a13, a3 /* arg1 */                    #  9b7: dd03
            movi         a2, 7 /* 0x00000007 */                #  9b9: 0c72
            call0        wpa_sm_set_state                      #  9bb: 050000
            addi         a2, a13, 95 /* arg1+0x5f */           #  9be: 22cd5f
            l8ui         a14, a13, 2 /* [arg1+0x2] */          #  9c1: e20d02
            l8ui         a3, a13, 94 /* [arg1+0x5e] */         #  9c4: 320d5e
            l8ui         a0, a13, 1 /* [arg1+0x1] */           #  9c7: 020d01
            l8ui         a4, a13, 93 /* [arg1+0x5d] */         #  9ca: 420d5d
            slli         a0, a0, 8                             #  9cd: 800011
            slli         a4, a4, 8                             #  9d0: 804411
            or           a3, a3, a4                            #  9d3: 403320
            or           a14, a14, a0                          #  9d6: 00ee20
            extui        a14, a14, 0, 16                       #  9d9: e0e0f4
            extui        a3, a3, 0, 16                         #  9dc: 3030f4
            addi         a4, sp, 16 /* (FP)-0x40 */            #  9df: 42c110
            call0        wpa_supplicant_parse_ies              #  9e2: 01edffc0
                                                               #  9e6: 0000
            l32i         a5, sp, 36 /* [(local2)] */           #  9e8: 5891
            beqz         a5, .Lbr064                           #  9ea: 9cc5
            bbsi         a14, 12, .Lbr064                      #  9ec: c7ee1a
.Lbr062:    mov          a2, a12 /* arg0 */                    #  9ef: 2d0c
            movi         a3, 1 /* 0x00000001 */                #  9f1: 0c13
            call0        wpa_sm_deauthenticate                 #  9f3: 01eaffc0
                                                               #  9f7: 0000
.Lbr063:    l32i         a12, sp, 68 /* [(local8)] */          #  9f9: c22111
            l32i         a13, sp, 72 /* [(local9)] */          #  9fc: d22112
            l32i         a14, sp, 76 /* [(local10)] */         #  9ff: e22113
            l32i         a0, sp, 64 /* [(local7)] */           #  a02: 022110
            addi         sp, sp, 80 /* (top of frame) */       #  a05: 12c150
            ret                                                #  a08: 0df0
.Lbr064:    mov          a2, a12 /* arg0 */                    #  a0a: 2d0c
            addi         a4, sp, 16 /* (FP)-0x40 */            #  a0c: 42c110
            movi         a3, 350 /* 0x0000015e */              #  a0f: 32a15e
            add          a3, a12, a3 /* arg0+0x15e */          #  a12: 3a3c
            s32i         a3, sp, 52 /* arg0+0x15e -> [(local4)] */ #  a14: 39d1
            call0        .Lfunc017                             #  a16: c5d4ff
            bltz         a2, .Lbr062                           #  a19: 9622fd
            addi         a3, a13, 13 /* arg1+0xd */            #  a1c: db3d
            movi         a4, 32 /* 0x00000020 */               #  a1e: 2c04
            movi         a2, 216 /* 0x000000d8 */              #  a20: 22a0d8
            add          a2, a12, a2 /* arg0+0xd8 */           #  a23: 2a2c
            call0        memcmp                                #  a25: 01deffc0
                                                               #  a29: 0000
            bnez         a2, .Lbr062                           #  a2b: 5602fc
            l8ui         a2, a13, 3 /* [arg1+0x3] */           #  a2e: 220d03
            l8ui         a0, a13, 4 /* [arg1+0x4] */           #  a31: 020d04
            slli         a2, a2, 8                             #  a34: 802211
            or           a0, a0, a2                            #  a37: 200020
            movi         a2, 172 /* 0x000000ac */              #  a3a: 22a0ac
            add          a2, a12, a2 /* arg0+0xac */           #  a3d: 2a2c
            s32i         a2, sp, 60 /* arg0+0xac -> [(local6)] */ #  a3f: 29f1
            l32i         a2, a12, 0x114 /* [arg0+0x114] */     #  a41: 222c45
            extui        a0, a0, 0, 16                         #  a44: 0000f4
            beqi         a2, 2, .Lbr065                        #  a47: 262208
            bnei         a2, 8, .Lbr066                        #  a4a: 668208
            beqi         a0, 16, .Lbr066                       #  a4d: 26b005
            j            .Lbr062                               #  a50: c6e6ff
.Lbr065:    bnei         a0, 32, .Lbr062                       #  a53: 66c098
.Lbr066:    l32i         a3, sp, 60 /* [(local6)] */           #  a56: 38f1
            movi         a4, 1 /* 0x00000001 */                #  a58: 0c14
            mov          a2, a12 /* arg0 */                    #  a5a: 2d0c
            s32i         a4, a3, 76 /* 0x00000001 -> [[(local6)]+0x4c] */ #  a5c: 426313
            mov          a3, a13 /* arg1 */                    #  a5f: 3d0d
            call0        .Lfunc019                             #  a61: c5eeff
            movi         a4, 0 /* 0x00000000 */                #  a64: 0c04
            l32i         a6, sp, 60 /* [(local6)] */           #  a66: 68f1
            l32i         a5, sp, 36 /* [(local2)] */           #  a68: 5891
            s16i         a14, a6, 0x1b0 /* a14 -> [[(local6)]+0x1b0] */ #  a6a: e256d8
            s32i         a4, a6, 0x1ac /* 0x00000000 -> [[(local6)]+0x1ac] */ #  a6d: 42666b
            beqz         a5, .Lbr067                           #  a70: 9c35
            mov          a2, a12 /* arg0 */                    #  a72: 2d0c
            mov          a3, a13 /* arg1 */                    #  a74: 3d0d
            call0        .Lfunc019                             #  a76: 85edff
            mov          a2, a12 /* arg0 */                    #  a79: 2d0c
            l32i         a3, sp, 36 /* [(local2)] */           #  a7b: 3891
            l32i         a4, sp, 40 /* [(local3)] */           #  a7d: 48a1
            mov          a5, a14                               #  a7f: 5d0e
            call0        .Lfunc014                             #  a81: 85c3ff
            bltz         a2, .Lbr062                           #  a84: 9672f6
.Lbr067:    mov          a2, a12 /* arg0 */                    #  a87: 2d0c
            addi         a3, sp, 16 /* (FP)-0x40 */            #  a89: 32c110
            call0        .Lfunc016                             #  a8c: 45ccff
            bltz         a2, .Lbr062                           #  a8f: 96c2f5
            mov          a6, a14                               #  a92: 6d0e
            mov          a4, a13 /* arg1 */                    #  a94: 4d0d
            l32i         a3, sp, 52 /* [(local4)] */           #  a96: 38d1
            l32i         a5, sp, 56 /* [(local5)] */           #  a98: 58e1
            mov          a2, a12 /* arg0 */                    #  a9a: 2d0c
            movi         a8, 0 /* 0x00000000 */                #  a9c: 0c08
            addi         a7, a12, 48 /* arg0+0x30 */           #  a9e: 72cc30
            s32i         a7, sp, 4 /* arg0+0x30 -> [(local1)] */ #  aa1: 7911
            s32i         a8, sp, 0 /* 0x00000000 -> [(local0)] */ #  aa3: 8901
            movi         a7, 0 /* 0x00000000 */                #  aa5: 0c07
            call0        .Lfunc018                             #  aa7: 45dbff
            bnez         a2, .Lbr062                           #  aaa: 5612f4
            j            .Lbr063                               #  aad: 06d2ff

            .literal_position                                  #  ab0: 00000000
                                                               #  ab4: 00000000

# Function @ .irom0.text+0xab8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
.Lfunc021:  addi         sp, sp, -16 /* (local0) */            #  ab8: 12c1f0
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  abb: c931
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  abd: 0921
            mov          a12, a2 /* arg0 */                    #  abf: cd02
            movi         a0, 348 /* 0x0000015c */              #  ac1: 02a15c
            add          a0, a2, a0 /* arg0+0x15c */           #  ac4: 0a02
            s32i         a0, sp, 0 /* arg0+0x15c -> [(local0)] */ #  ac6: 0901
            l16ui        a0, a0, 0x100 /* [arg0+0x25c] */      #  ac8: 021080
            s32i         a0, sp, 4 /* [arg0+0x25c] -> [(local1)] */ #  acb: 0911
            bbci         a0, 6, .Lbr068                        #  acd: 676005
            call0        .Lfunc009                             #  ad0: c59fff
            bnez         a2, .Lbr072                           #  ad3: 560205
.Lbr068:    movi         a2, 8 /* 0x00000008 */                #  ad6: 0c82
            call0        wpa_sm_set_state                      #  ad8: 01f6ffc0
                                                               #  adc: 0000
            l32i         a2, sp, 0 /* [(local0)] */            #  ade: 2801
            l32i         a2, a2, 252 /* [[(local0)]+0xfc] */   #  ae0: 22223f
            movi         a0, 350 /* 0x0000015e */              #  ae3: 02a15e
            beqz         a2, .Lbr069                           #  ae6: 9cf2
            mov          a2, a12 /* arg0 */                    #  ae8: 2d0c
            movi         a3, 552 /* 0x00000228 */              #  aea: 32a228
            add          a3, a12, a3 /* arg0+0x228 */          #  aed: 3a3c
            call0        .Lfunc012                             #  aef: 85b1ff
            bnez         a2, .Lbr072                           #  af2: fc12
            mov          a2, a12 /* arg0 */                    #  af4: 2d0c
            movi         a5, 512 /* 0x00000200 */              #  af6: 52a200
            l32i         a4, sp, 4 /* [(local1)] */            #  af9: 4811
            movi         a3, 350 /* 0x0000015e */              #  afb: 32a15e
            add          a3, a12, a3 /* arg0+0x15e */          #  afe: 3a3c
            and          a4, a4, a5                            #  b00: 504410
            call0        .Lfunc011                             #  b03: 85aaff
            movi         a0, 350 /* 0x0000015e */              #  b06: 02a15e
.Lbr069:    l32i         a6, sp, 4 /* [(local1)] */            #  b09: 6811
            bbci         a6, 9, .Lbr070                        #  b0b: 97660d
            mov          a2, a12 /* arg0 */                    #  b0e: 2d0c
            movi         a4, 1 /* 0x00000001 */                #  b10: 0c14
            movi         a5, 1 /* 0x00000001 */                #  b12: 0c15
            add          a3, a12, a0 /* arg0+0x15e */          #  b14: 0a3c
            call0        wpa_sm_mlme_setprotection             #  b16: 01e7ffc0
                                                               #  b1a: 0000
.Lbr070:    movi         a2, 0 /* 0x00000000 */                #  b1c: 0c02
.Lbr071:    l32i         a12, sp, 12 /* [(local3)] */          #  b1e: c831
            l32i         a0, sp, 8 /* [(local2)] */            #  b20: 0821
            addi         sp, sp, 16 /* (top of frame) */       #  b22: 12c110
            ret                                                #  b25: 0df0
.Lbr072:    movi         a2, 1 /* 0x00000001 */                #  b27: 0c12
            j            .Lbr071                               #  b29: 46fcff

            .literal_position                                  #  b2c: 00000000
                                                               #  b30: 00000000

# Function @ .irom0.text+0xb34
# Local variables/stack:
#     (local0):  word      @ -0x2c
#     (local1):  word[3]   @ -0x28
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word[4]   @ -0x10
            .balign      4
.Lfunc022:  addi         sp, sp, -64 /* (FP)-0x40 */           #  b34: 12c1c0
            s32i         a5, sp, 36 /* arg3 -> [(local2)] */   #  b37: 5991
            s32i         a0, sp, 40 /* a0 -> [(local3)] */     #  b39: 09a1
            s32i         a13, sp, 48 /* a13 -> [(local5)] */   #  b3b: d9c1
            s32i         a12, sp, 44 /* a12 -> [(local4)] */   #  b3d: c9b1
            mov          a13, a2 /* arg0 */                    #  b3f: dd02
            mov          a2, a3 /* arg1 */                     #  b41: 2d03
            mov          a12, a6 /* arg4 */                    #  b43: cd06
            mov          a3, a4 /* arg2 */                     #  b45: 3d04
            mov          a4, sp /* (FP)-0x40 */                #  b47: 4d01
            call0        wpa_supplicant_parse_ies              #  b49: 01f8ffc0
                                                               #  b4d: 0000
            l32i         a0, sp, 20 /* [(local0)] */           #  b4f: 0851
            l32i         a2, sp, 36 /* [(local2)] */           #  b51: 2891
            beqz         a0, .Lbr073                           #  b53: 8c10
            bbsi         a2, 12, .Lbr074                       #  b55: c7e204
.Lbr073:    movi         a2, -1 /* 0xffffffff */               #  b58: 7cf2
            j            .Lbr075                               #  b5a: c61300
.Lbr074:    beqz         a0, .Lbr073                           #  b5d: 1670ff
            addi         a5, a12, 8 /* arg4+0x8 */             #  b60: 8b5c
            l32i         a4, sp, 24 /* [(local1)] */           #  b62: 4861
            mov          a6, a12 /* arg4 */                    #  b64: 6d0c
            addi         a4, a4, -2 /* [(local1)]-0x2 */       #  b66: 42c4fe
            mov          a3, a4 /* [(local1)]-0x2 */           #  b69: 3d04
            s32i         a4, a12, 48 /* [(local1)]-0x2 -> [arg4+0x30] */ #  b6b: 49cc
            l32i         a2, a13, 0x118 /* [arg0+0x118] */     #  b6d: 222d46
            call0        .Lfunc010                             #  b70: c59dff
            bnez         a2, .Lbr073                           #  b73: 5612fe
            l32i         a3, sp, 20 /* [(local0)] */           #  b76: 3851
            l8ui         a4, a3, 0 /* [[(local0)]] */          #  b78: 420300
            extui        a4, a4, 0, 2                          #  b7b: 404014
            s32i         a4, a12, 12 /* a4 -> [arg4+0xc] */    #  b7e: 493c
            l8ui         a3, a3, 0 /* [[(local0)]] */          #  b80: 320300
            mov          a2, a13 /* arg0 */                    #  b83: 2d0d
            extui        a3, a3, 2, 1                          #  b85: 303204
            call0        .Lfunc013                             #  b88: 85b1ff
            s32i         a2, a12, 4 /* a2 -> [arg4+0x4] */     #  b8b: 291c
            l32i         a4, sp, 24 /* [(local1)] */           #  b8d: 4861
            movi         a5, 32 /* 0x00000020 */               #  b8f: 2c05
            addi         a4, a4, -2 /* [(local1)]-0x2 */       #  b91: 42c4fe
            bltu         a5, a4, .Lbr073                       #  b94: 4735c0
            l32i         a3, sp, 20 /* [(local0)] */           #  b97: 3851
            addi         a2, a12, 16 /* arg4+0x10 */           #  b99: 22cc10
            addi         a3, a3, 2 /* [(local0)]+0x2 */        #  b9c: 2b33
            call0        memcpy                                #  b9e: 01e4ffc0
                                                               #  ba2: 0000
            mov          a2, a13 /* arg0 */                    #  ba4: 2d0d
            mov          a3, sp /* (FP)-0x40 */                #  ba6: 3d01
            call0        .Lfunc016                             #  ba8: 85baff
            movi         a2, 0 /* 0x00000000 */                #  bab: 0c02
.Lbr075:    l32i         a12, sp, 44 /* [(local4)] */          #  bad: c8b1
            l32i         a13, sp, 48 /* [(local5)] */          #  baf: d8c1
            l32i         a0, sp, 40 /* [(local3)] */           #  bb1: 08a1
            addi         sp, sp, 64 /* (top of frame) */       #  bb3: 12c140
            ret                                                #  bb6: 0df0

            .literal_position                                  #  bb8: 00000000
                                                               #  bbc: 00000000
                                                               #  bc0: 00000000
                                                               #  bc4: 00000000
                                                               #  bc8: 00000000

# Function @ .irom0.text+0xbcc
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
.Lfunc023:  addi         sp, sp, -64 /* (FP)-0x40 */           #  bcc: 12c1c0
            s32i         a0, sp, 44 /* a0 -> [(local3)] */     #  bcf: 09b1
            s32i         a15, sp, 60 /* a15 -> [(local7)] */   #  bd1: f9f1
            s32i         a14, sp, 56 /* a14 -> [(local6)] */   #  bd3: e9e1
            s32i         a13, sp, 52 /* a13 -> [(local5)] */   #  bd5: d9d1
            s32i         a12, sp, 48 /* a12 -> [(local4)] */   #  bd7: c9c1
            l32i         a13, sp, 64 /* [(local8)] */          #  bd9: d22110
            mov          a12, a4 /* arg2 */                    #  bdc: cd04
            mov          a14, a3 /* arg1 */                    #  bde: ed03
            mov          a4, a7 /* arg5 */                     #  be0: 4d07
            mov          a15, a12 /* arg2 */                   #  be2: fd0c
            l8ui         a7, a14, 3 /* [arg1+0x3] */           #  be4: 720e03
            l8ui         a3, a3, 4 /* [arg1+0x4] */            #  be7: 320304
            slli         a7, a7, 8                             #  bea: 807711
            or           a3, a3, a7                            #  bed: 703320
            extui        a3, a3, 0, 16                         #  bf0: 3030f4
            s32i         a3, a13, 48 /* a3 -> [[(local8)]+0x30] */ #  bf3: 39cd
            bgeu         a6, a12, .Lbr080                      #  bf5: c7b649
.Lbr076:    movi         a0, -1 /* 0xffffffff */               #  bf8: 7cf0
            j            .Lbr079                               #  bfa: c60c00
.Lbr077:    l32i         a8, sp, 36 /* [(local1)] */           #  bfd: 8891
            movi         a9, 7 /* 0x00000007 */                #  bff: 0c79
            bnei         a8, 2, .Lbr076                        #  c01: 6628f3
            bany         a9, a12, .Lbr076                      #  c04: c789f0
            movi         a10, 32 /* 0x00000020 */              #  c07: 2c0a
            bltu         a10, a15, .Lbr076                     #  c09: f73aeb
            srli         a3, a15, 3                            #  c0c: f03341
            addi         a4, a14, 95 /* arg1+0x5f */           #  c0f: 42ce5f
            l32i         a2, sp, 32 /* [(local0)] */           #  c12: 2881
            addi         a5, a13, 16 /* [(local8)]+0x10 */     #  c14: 52cd10
            addi         a2, a2, 64 /* [(local0)]+0x40 */      #  c17: 22c240
            call0        aes_unwrap                            #  c1a: 01e7ffc0
                                                               #  c1e: 0000
            bnez         a2, .Lbr076                           #  c20: 5642fd
.Lbr078:    l32i         a3, sp, 40 /* [(local2)] */           #  c23: 38a1
            l32i         a2, sp, 32 /* [(local0)] */           #  c25: 2881
            extui        a3, a3, 6, 1                          #  c27: 303604
            call0        .Lfunc013                             #  c2a: 85a7ff
            movi         a0, 0 /* 0x00000000 */                #  c2d: 0c00
            s32i         a2, a13, 4 /* a2 -> [[(local8)]+0x4] */ #  c2f: 291d
.Lbr079:    l32i         a12, sp, 48 /* [(local4)] */          #  c31: c8c1
            l32i         a13, sp, 52 /* [(local5)] */          #  c33: d8d1
            l32i         a14, sp, 56 /* [(local6)] */          #  c35: e8e1
            l32i         a15, sp, 60 /* [(local7)] */          #  c37: f8f1
            mov          a2, a0                                #  c39: 2d00
            l32i         a0, sp, 44 /* [(local3)] */           #  c3b: 08b1
            addi         sp, sp, 64 /* (local8) */             #  c3d: 12c140
            ret                                                #  c40: 0df0
.Lbr080:    s32i         a4, sp, 36 /* arg5 -> [(local1)] */   #  c42: 4991
            s32i         a5, sp, 40 /* arg3 -> [(local2)] */   #  c44: 59a1
            s32i         a2, sp, 32 /* arg0 -> [(local0)] */   #  c46: 2981
            bnei         a4, 2, .Lbr081                        #  c48: 662405
            bltui        a12, 8, .Lbr076                       #  c4b: b68ca9
            addi         a15, a12, -8 /* arg2-0x8 */           #  c4e: f2ccf8
.Lbr081:    mov          a4, a15                               #  c51: 4d0f
            addi         a5, a13, 8 /* [(local8)]+0x8 */       #  c53: 8b5d
            l32i         a2, sp, 32 /* [(local0)] */           #  c55: 2881
            mov          a6, a13 /* [(local8)] */              #  c57: 6d0d
            l32i         a2, a2, 0x118 /* [[(local0)]+0x118] */ #  c59: 222246
            call0        .Lfunc010                             #  c5c: 058fff
            bnez         a2, .Lbr076                           #  c5f: 5652f9
            l32i         a4, sp, 40 /* [(local2)] */           #  c62: 48a1
            l32i         a3, sp, 36 /* [(local1)] */           #  c64: 3891
            extui        a4, a4, 4, 2                          #  c66: 404414
            s32i         a4, a13, 12 /* a4 -> [[(local8)]+0xc] */ #  c69: 493d
            bnei         a3, 1, .Lbr077                        #  c6b: 66138e
            mov          a2, sp /* (FP)-0x40 */                #  c6e: 2d01
            addi         a3, a14, 45 /* arg1+0x2d */           #  c70: 32ce2d
            movi         a4, 16 /* 0x00000010 */               #  c73: 1c04
            call0        memcpy                                #  c75: 01d1ffc0
                                                               #  c79: 0000
            addi         a2, sp, 16 /* (FP)-0x30 */            #  c7b: 22c110
            l32i         a3, sp, 32 /* [(local0)] */           #  c7e: 3881
            movi         a4, 16 /* 0x00000010 */               #  c80: 1c04
            addi         a3, a3, 64 /* [(local0)]+0x40 */      #  c82: 32c340
            call0        memcpy                                #  c85: 01ceffc0
                                                               #  c89: 0000
            movi         a4, 32 /* 0x00000020 */               #  c8b: 2c04
            bgeu         a4, a12, .Lbr082                      #  c8d: c7b402
            j            .Lbr076                               #  c90: 06d9ff
.Lbr082:    addi         a3, a14, 95 /* arg1+0x5f */           #  c93: 32ce5f
            mov          a4, a12 /* arg2 */                    #  c96: 4d0c
            addi         a14, a13, 16 /* [(local8)]+0x10 */    #  c98: e2cd10
            mov          a2, a14 /* [(local8)]+0x10 */         #  c9b: 2d0e
            call0        memcpy                                #  c9d: 01c9ffc0
                                                               #  ca1: 0000
            mov          a6, a12 /* arg2 */                    #  ca3: 6d0c
            mov          a5, a14 /* [(local8)]+0x10 */         #  ca5: 5d0e
            mov          a2, sp /* (FP)-0x40 */                #  ca7: 2d01
            movi         a3, 32 /* 0x00000020 */               #  ca9: 2c03
            movi         a4, 256 /* 0x00000100 */              #  cab: 42a100
            call0        rc4_skip                              #  cae: 01c6ffc0
                                                               #  cb2: 0000
            bnez         a2, .Lbr076                           #  cb4: 5602f4
            j            .Lbr078                               #  cb7: 06daff

            .literal_position                                  #  cbc: 8e880000
                                                               #  cc0: 00000000
                                                               #  cc4: 00000000
                                                               #  cc8: 00000000

# Function @ .irom0.text+0xccc
# Local variables/stack:
#     (local0):  word      @ -0x30
#     (local1):  word[3]   @ -0x2c
#     (local2):  word      @ -0x20
#     (local3):  word      @ -0x1c
#     (local4):  word      @ -0x18
#     (local5):  word      @ -0x14
#     (local6):  word      @ -0x10
#     (local7):  word      @ -0xc
#     (local8):  word      @ -0x8
#     (local9):  word      @ -0x4
            .balign      4
.Lfunc024:  addi         sp, sp, -48 /* (local0) */            #  ccc: 12c1d0
            addi         a6, sp, 16 /* (local2) */             #  ccf: 62c110
            addi         a7, sp, 20 /* (local3) */             #  cd2: 72c114
            s32i         a0, sp, 32 /* a0 -> [(local6)] */     #  cd5: 0981
            s32i         a13, sp, 40 /* a13 -> [(local8)] */   #  cd7: d9a1
            s32i         a14, sp, 44 /* a14 -> [(local9)] */   #  cd9: e9b1
            s32i         a12, sp, 36 /* a12 -> [(local7)] */   #  cdb: c991
            s32i         a5, sp, 28 /* arg3 -> [(local5)] */   #  cdd: 5971
            mov          a12, a2 /* arg0 */                    #  cdf: cd02
            movi         a5, 95 /* 0x0000005f */               #  ce1: 5cf5
            mov          a14, a3 /* arg1 */                    #  ce3: ed03
            mov          a13, a4 /* arg2 */                    #  ce5: dd04
            movi         a3, 3 /* 0x00000003 */                #  ce7: 0c33
            movi         a4, 0 /* 0x00000000 */                #  ce9: 0c04
            call0        wpa_sm_alloc_eapol                    #  ceb: 01f5ffc0
                                                               #  cef: 0000
            mov          a0, a2                                #  cf1: 0d02
            bnez         a2, .Lbr083                           #  cf3: cc32
            movi         a2, -1 /* 0xffffffff */               #  cf5: 7cf2
            j            .Lbr086                               #  cf7: 462300
.Lbr083:    l32i         a9, sp, 20 /* [(local3)] */           #  cfa: 9851
            movi         a4, 768 /* 0x00000300 */              #  cfc: 42a300
            movi         a10, 2 /* 0x00000002 */               #  cff: 0c2a
            movi         a8, 254 /* 0x000000fe */              #  d01: 82a0fe
            l32i         a11, a12, 0x164 /* [arg0+0x164] */    #  d04: b22c59
            l32i         a3, sp, 28 /* [(local5)] */           #  d07: 3871
            movi         a5, 48 /* 0x00000030 */               #  d09: 3c05
            and          a3, a3, a5                            #  d0b: 503310
            addi         a11, a11, -2 /* [arg0+0x164]-0x2 */   #  d0e: b2cbfe
            moveqz       a8, a10, a11                          #  d11: b08a83
            or           a3, a13, a3                           #  d14: 303d20
            or           a3, a3, a4                            #  d17: 403320
            s8i          a8, a9, 0 /* a8 -> [[(local3)]] */    #  d1a: 824900
            l32i         a7, sp, 20 /* [(local3)] */           #  d1d: 7851
            srli         a6, a3, 8                             #  d1f: 306841
            s8i          a6, a7, 1 /* a6 -> [[(local3)]+0x1] */ #  d22: 624701
            l32i         a4, sp, 20 /* [(local3)] */           #  d25: 4851
            s32i         a0, sp, 24 /* a0 -> [(local4)] */     #  d27: 0961
            s8i          a3, a4, 2 /* a3 -> [[(local3)]+0x2] */ #  d29: 324402
            l32i         a2, a12, 0x164 /* [arg0+0x164] */     #  d2c: 222c59
            l32i         a5, sp, 20 /* [(local3)] */           #  d2f: 5851
            bnei         a2, 2, .Lbr084                        #  d31: 66220c
            movi         a6, 0 /* 0x00000000 */                #  d34: 0c06
            s8i          a6, a5, 3 /* 0x00 -> [[(local3)]+0x3] */ #  d36: 624503
            l32i         a7, sp, 20 /* [(local3)] */           #  d39: 7851
            s8i          a6, a7, 4 /* 0x00 -> [[(local3)]+0x4] */ #  d3b: 624704
            j            .Lbr085                               #  d3e: c60200
.Lbr084:    addi         a2, a5, 3 /* [(local3)]+0x3 */        #  d41: 3b25
            addi         a3, a14, 3 /* arg1+0x3 */             #  d43: 3b3e
            movi         a4, 2 /* 0x00000002 */                #  d45: 0c24
            call0        memcpy                                #  d47: 01dfffc0
                                                               #  d4b: 0000
.Lbr085:    addi         a3, a14, 5 /* arg1+0x5 */             #  d4d: 5b3e
            l32i         a2, sp, 20 /* [(local3)] */           #  d4f: 2851
            movi         a4, 8 /* 0x00000008 */                #  d51: 0c84
            addi         a2, a2, 5 /* [(local3)]+0x5 */        #  d53: 5b22
            call0        memcpy                                #  d55: 01dcffc0
                                                               #  d59: 0000
            mov          a4, a13 /* arg2 */                    #  d5b: 4d0d
            l32i         a7, sp, 24 /* [(local4)] */           #  d5d: 7861
            mov          a2, a12 /* arg0 */                    #  d5f: 2d0c
            addi         a3, a12, 48 /* arg0+0x30 */           #  d61: 32cc30
            movi         a6, 0x0000888e                        #  d64: 61d6ff
            l32i         a11, sp, 20 /* [(local3)] */          #  d67: b851
            movi         a9, 0 /* 0x00000000 */                #  d69: 0c09
            s8i          a9, a11, 93 /* 0x00 -> [[(local3)]+0x5d] */ #  d6b: 924b5d
            l32i         a10, sp, 20 /* [(local3)] */          #  d6e: a851
            movi         a5, 350 /* 0x0000015e */              #  d70: 52a15e
            s8i          a9, a10, 94 /* 0x00 -> [[(local3)]+0x5e] */ #  d73: 924a5e
            l32i         a8, sp, 16 /* [(local2)] */           #  d76: 8841
            s32i         a8, sp, 0 /* [(local2)] -> [(local0)] */ #  d78: 8901
            l32i         a8, sp, 20 /* [(local3)] */           #  d7a: 8851
            add          a5, a12, a5 /* arg0+0x15e */          #  d7c: 5a5c
            addi         a8, a8, 77 /* [(local3)]+0x4d */      #  d7e: 82c84d
            s32i         a8, sp, 4 /* [(local3)]+0x4d -> [(local1)] */ #  d81: 8911
            call0        .Lfunc002                             #  d83: c529ff
            movi         a2, 0 /* 0x00000000 */                #  d86: 0c02
.Lbr086:    l32i         a12, sp, 36 /* [(local7)] */          #  d88: c891
            l32i         a13, sp, 40 /* [(local8)] */          #  d8a: d8a1
            l32i         a14, sp, 44 /* [(local9)] */          #  d8c: e8b1
            l32i         a0, sp, 32 /* [(local6)] */           #  d8e: 0881
            addi         sp, sp, 48 /* (top of frame) */       #  d90: 12c130
            ret                                                #  d93: 0df0

            .literal_position                                  #  d98: 00000000
                                                               #  d9c: 00000000
                                                               #  da0: 00000000

# Function @ .irom0.text+0xda4
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
            .balign      4
.Lfunc025:  movi         a3, 0 /* 0x00000000 */                #  da4: 0c03
            addi         sp, sp, -48 /* (local0) */            #  da6: 12c1d0
            s32i         a14, sp, 40 /* a14 -> [(local7)] */   #  da9: e9a1
            s32i         a5, sp, 24 /* arg3 -> [(local3)] */   #  dab: 5961
            s32i         a6, sp, 16 /* arg4 -> [(local1)] */   #  dad: 6941
            s32i         a0, sp, 28 /* a0 -> [(local4)] */     #  daf: 0971
            s32i         a15, sp, 44 /* a15 -> [(local8)] */   #  db1: f9b1
            s32i         a12, sp, 32 /* a12 -> [(local5)] */   #  db3: c981
            s32i         a13, sp, 36 /* a13 -> [(local6)] */   #  db5: d991
            mov          a12, a2 /* arg0 */                    #  db7: cd02
            mov          a13, a4 /* arg2 */                    #  db9: dd04
            movi         a15, 552 /* 0x00000228 */             #  dbb: f2a228
            movi         a4, 52 /* 0x00000034 */               #  dbe: 3c44
            add          a15, a2, a15 /* arg0+0x228 */         #  dc0: faf2
            mov          a2, a15 /* arg0+0x228 */              #  dc2: 2d0f
            call0        memset                                #  dc4: 01f5ffc0
                                                               #  dc8: 0000
            l8ui         a14, a13, 2 /* [arg2+0x2] */          #  dca: e20d02
            l8ui         a4, a13, 94 /* [arg2+0x5e] */         #  dcd: 420d5e
            l8ui         a0, a13, 1 /* [arg2+0x1] */           #  dd0: 020d01
            l8ui         a5, a13, 93 /* [arg2+0x5d] */         #  dd3: 520d5d
            slli         a0, a0, 8                             #  dd6: 800011
            slli         a5, a5, 8                             #  dd9: 805511
            or           a4, a4, a5                            #  ddc: 504420
            or           a14, a14, a0                          #  ddf: 00ee20
            extui        a14, a14, 0, 16                       #  de2: e0e0f4
            movi         a0, 228 /* 0x000000e4 */              #  de5: 02a0e4
            add          a0, a12, a0 /* arg0+0xe4 */           #  de8: 0a0c
            s32i         a0, sp, 20 /* arg0+0xe4 -> [(local2)] */ #  dea: 0951
            l32i         a0, a12, 0x164 /* [arg0+0x164] */     #  dec: 022c59
            extui        a4, a4, 0, 16                         #  def: 4040f4
            bnei         a0, 2, .Lbr087                        #  df2: 662010
            mov          a6, a15 /* arg0+0x228 */              #  df5: 6d0f
            mov          a2, a12 /* arg0 */                    #  df7: 2d0c
            addi         a3, a13, 95 /* arg2+0x5f */           #  df9: 32cd5f
            mov          a5, a14                               #  dfc: 5d0e
            call0        .Lfunc022                             #  dfe: 45d3ff
            mov          a15, a2                               #  e01: fd02
            j            .Lbr088                               #  e03: 060400
.Lbr087:    s32i         a15, sp, 0 /* arg0+0x228 -> [(local0)] */ #  e06: f901
            l32i         a6, sp, 24 /* [(local3)] */           #  e08: 6861
            mov          a2, a12 /* arg0 */                    #  e0a: 2d0c
            mov          a3, a13 /* arg2 */                    #  e0c: 3d0d
            mov          a5, a14                               #  e0e: 5d0e
            l32i         a7, sp, 16 /* [(local1)] */           #  e10: 7841
            call0        .Lfunc023                             #  e12: 85dbff
            mov          a15, a2                               #  e15: fd02
.Lbr088:    movi         a2, 8 /* 0x00000008 */                #  e17: 0c82
            call0        wpa_sm_set_state                      #  e19: 01e0ffc0
                                                               #  e1d: 0000
            bnez         a15, .Lbr089                          #  e1f: dcbf
            l32i         a15, sp, 16 /* [(local1)] */          #  e21: f841
            mov          a2, a12 /* arg0 */                    #  e23: 2d0c
            mov          a3, a13 /* arg2 */                    #  e25: 3d0d
            movi         a4, 0 /* 0x00000000 */                #  e27: 0c04
            call0        .Lfunc019                             #  e29: 45b2ff
            mov          a5, a14                               #  e2c: 5d0e
            mov          a4, a15 /* [(local1)] */              #  e2e: 4d0f
            mov          a3, a13 /* arg2 */                    #  e30: 3d0d
            l32i         a6, sp, 20 /* [(local2)] */           #  e32: 6851
            mov          a2, a12 /* arg0 */                    #  e34: 2d0c
            s16i         a14, a6, 0x178 /* a14 -> [[(local2)]+0x178] */ #  e36: e256bc
            call0        .Lfunc024                             #  e39: 05e9ff
            beqz         a2, .Lbr090                           #  e3c: 8c82
.Lbr089:    mov          a2, a12 /* arg0 */                    #  e3e: 2d0c
            movi         a3, 1 /* 0x00000001 */                #  e40: 0c13
            call0        wpa_sm_deauthenticate                 #  e42: 01d7ffc0
                                                               #  e46: 0000
.Lbr090:    l32i         a12, sp, 32 /* [(local5)] */          #  e48: c881
            l32i         a13, sp, 36 /* [(local6)] */          #  e4a: d891
            l32i         a14, sp, 40 /* [(local7)] */          #  e4c: e8a1
            l32i         a15, sp, 44 /* [(local8)] */          #  e4e: f8b1
            l32i         a0, sp, 28 /* [(local4)] */           #  e50: 0871
            addi         sp, sp, 48 /* (top of frame) */       #  e52: 12c130
            ret                                                #  e55: 0df0

            .balign      4
# Function @ .irom0.text+0xe58
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
.Lfunc026:  movi         a3, 1 /* 0x00000001 */                #  e58: 0c13
            addi         sp, sp, -16 /* (local0) */            #  e5a: 12c1f0
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  e5d: c931
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  e5f: 0921
            mov          a12, a2 /* arg0 */                    #  e61: cd02
            movi         a0, 228 /* 0x000000e4 */              #  e63: 02a0e4
            add          a0, a2, a0 /* arg0+0xe4 */            #  e66: 0a02
            l32i         a4, a0, 132 /* [arg0+0x168] */        #  e68: 422021
            l16ui        a2, a0, 0x178 /* [arg0+0x25c] */      #  e6b: 2210bc
            s32i         a2, sp, 0 /* [arg0+0x25c] -> [(local0)] */ #  e6e: 2901
            l32i         a0, a0, 0x174 /* [arg0+0x258] */      #  e70: 02205d
            addi         a4, a4, -9 /* [arg0+0x168]-0x9 */     #  e73: 42c4f7
            movi         a2, 0 /* 0x00000000 */                #  e76: 0c02
            moveqz       a2, a3, a4                            #  e78: 402383
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      #  e7b: 2911
            beqz         a0, .Lbr091                           #  e7d: 9c60
            mov          a2, a12 /* arg0 */                    #  e7f: 2d0c
            movi         a3, 552 /* 0x00000228 */              #  e81: 32a228
            add          a3, a12, a3 /* arg0+0x228 */          #  e84: 3a3c
            call0        .Lfunc012                             #  e86: 0578ff
            bnez         a2, .Lbr091                           #  e89: cca2
            l32i         a4, sp, 4 /* [(local1)] */            #  e8b: 4811
            beqz         a4, .Lbr093                           #  e8d: 9c14
            movi         a2, 9 /* 0x00000009 */                #  e8f: 0c92
            call0        wpa_sm_set_state                      #  e91: 050000
            j            .Lbr094                               #  e94: 060700
.Lbr091:    movi         a2, 1 /* 0x00000001 */                #  e97: 0c12
.Lbr092:    l32i         a12, sp, 12 /* [(local3)] */          #  e99: c831
            l32i         a0, sp, 8 /* [(local2)] */            #  e9b: 0821
            addi         sp, sp, 16 /* (top of frame) */       #  e9d: 12c110
            ret                                                #  ea0: 0df0
.Lbr093:    mov          a2, a12 /* arg0 */                    #  ea2: 2d0c
            movi         a5, 512 /* 0x00000200 */              #  ea4: 52a200
            l32i         a4, sp, 0 /* [(local0)] */            #  ea7: 4801
            movi         a3, 350 /* 0x0000015e */              #  ea9: 32a15e
            add          a3, a12, a3 /* arg0+0x15e */          #  eac: 3a3c
            and          a4, a4, a5                            #  eae: 504410
            call0        .Lfunc011                             #  eb1: 856fff
.Lbr094:    movi         a2, 0 /* 0x00000000 */                #  eb4: 0c02
            j            .Lbr092                               #  eb6: c6f7ff

            .literal_position                                  #  ebc: 00000000
                                                               #  ec0: 00000000
                                                               #  ec4: 00000000
                                                               #  ec8: 00000000
                                                               #  ecc: 00000000
                                                               #  ed0: 00000000
                                                               #  ed4: 00000000
                                                               #  ed8: 00000000
                                                               #  edc: 00000000
                                                               #  ee0: 00000000

# Function @ .irom0.text+0xee4
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
.Lfunc027:  addi         sp, sp, -48 /* (FP)-0x30 */           #  ee4: 12c1d0
            s32i         a5, sp, 40 /* arg3 -> [(local6)] */   #  ee7: 59a1
            s32i         a6, sp, 44 /* arg4 -> [(local7)] */   #  ee9: 69b1
            s32i         a0, sp, 20 /* a0 -> [(local1)] */     #  eeb: 0951
            s32i         a13, sp, 28 /* a13 -> [(local3)] */   #  eed: d971
            s32i         a12, sp, 24 /* a12 -> [(local2)] */   #  eef: c961
            s32i         a4, sp, 36 /* arg2 -> [(local5)] */   #  ef1: 4991
            s32i         a14, sp, 32 /* a14 -> [(local4)] */   #  ef3: e981
            movi         a4, 16 /* 0x00000010 */               #  ef5: 1c04
            mov          a14, a3 /* arg1 */                    #  ef7: ed03
            mov          a12, a2 /* arg0 */                    #  ef9: cd02
            addi         a13, a3, 77 /* arg1+0x4d */           #  efb: d2c34d
            mov          a2, sp /* (FP)-0x30 */                #  efe: 2d01
            mov          a3, a13 /* arg1+0x4d */               #  f00: 3d0d
            call0        memcpy                                #  f02: 01eeffc0
                                                               #  f06: 0000
            l32i         a2, a12, 180 /* [arg0+0xb4] */        #  f08: 222c2d
            beqz         a2, .Lbr095                           #  f0b: bc12
            mov          a2, a13 /* arg1+0x4d */               #  f0d: 2d0d
            movi         a3, 0 /* 0x00000000 */                #  f0f: 0c03
            movi         a4, 16 /* 0x00000010 */               #  f11: 1c04
            call0        memset                                #  f13: 01ebffc0
                                                               #  f17: 0000
            l32i         a3, sp, 36 /* [(local5)] */           #  f19: 3891
            l32i         a4, sp, 40 /* [(local6)] */           #  f1b: 48a1
            l32i         a5, sp, 44 /* [(local7)] */           #  f1d: 58b1
            mov          a6, a13 /* arg1+0x4d */               #  f1f: 6d0d
            addi         a2, a12, 112 /* arg0+0x70 */          #  f21: 22cc70
            s32i         a2, sp, 16 /* arg0+0x70 -> [(local0)] */ #  f24: 2941
            call0        wpa_eapol_key_mic                     #  f26: 01e7ffc0
                                                               #  f2a: 0000
            mov          a2, sp /* (FP)-0x30 */                #  f2c: 2d01
            mov          a3, a13 /* arg1+0x4d */               #  f2e: 3d0d
            movi         a4, 16 /* 0x00000010 */               #  f30: 1c04
            call0        memcmp                                #  f32: 01e5ffc0
                                                               #  f36: 0000
            beqz         a2, .Lbr102                           #  f38: 166207
            movi         a2, 0 /* 0x00000000 */                #  f3b: 0c02
            j            .Lbr096                               #  f3d: 460000
.Lbr095:    movi         a2, 0 /* 0x00000000 */                #  f40: 0c02
.Lbr096:    bnez         a2, .Lbr100                           #  f42: fc82
            l32i         a3, a12, 176 /* [arg0+0xb0] */        #  f44: 322c2c
            beqz         a3, .Lbr099                           #  f47: bc03
            mov          a2, a13 /* arg1+0x4d */               #  f49: 2d0d
            movi         a3, 0 /* 0x00000000 */                #  f4b: 0c03
            movi         a4, 16 /* 0x00000010 */               #  f4d: 1c04
            call0        memset                                #  f4f: 01dfffc0
                                                               #  f53: 0000
            addi         a2, a12, 48 /* arg0+0x30 */           #  f55: 22cc30
            l32i         a3, sp, 36 /* [(local5)] */           #  f58: 3891
            l32i         a4, sp, 40 /* [(local6)] */           #  f5a: 48a1
            l32i         a5, sp, 44 /* [(local7)] */           #  f5c: 58b1
            mov          a6, a13 /* arg1+0x4d */               #  f5e: 6d0d
            call0        wpa_eapol_key_mic                     #  f60: 01dcffc0
                                                               #  f64: 0000
            mov          a3, a13 /* arg1+0x4d */               #  f66: 3d0d
            mov          a2, sp /* (FP)-0x30 */                #  f68: 2d01
            movi         a4, 16 /* 0x00000010 */               #  f6a: 1c04
            call0        memcmp                                #  f6c: 01daffc0
                                                               #  f70: 0000
            beqz         a2, .Lbr098                           #  f72: 8c32
.Lbr097:    movi         a2, -1 /* 0xffffffff */               #  f74: 7cf2
            j            .Lbr101                               #  f76: c60a00
.Lbr098:    movi         a2, 1 /* 0x00000001 */                #  f79: 0c12
.Lbr099:    beqz         a2, .Lbr097                           #  f7b: 1652ff
.Lbr100:    movi         a4, 8 /* 0x00000008 */                #  f7e: 0c84
            addi         a13, a14, 5 /* arg1+0x5 */            #  f80: 5bde
            movi         a2, 252 /* 0x000000fc */              #  f82: 22a0fc
            add          a2, a12, a2 /* arg0+0xfc */           #  f85: 2a2c
            mov          a3, a13 /* arg1+0x5 */                #  f87: 3d0d
            call0        memcpy                                #  f89: 01d3ffc0
                                                               #  f8d: 0000
            movi         a4, 8 /* 0x00000008 */                #  f8f: 0c84
            movi         a2, 264 /* 0x00000108 */              #  f91: 22a108
            movi         a3, 1 /* 0x00000001 */                #  f94: 0c13
            s32i         a3, a12, 0x104 /* 0x00000001 -> [arg0+0x104] */ #  f96: 326c41
            add          a2, a12, a2 /* arg0+0x108 */          #  f99: 2a2c
            mov          a3, a13 /* arg1+0x5 */                #  f9b: 3d0d
            call0        memcpy                                #  f9d: 01cfffc0
                                                               #  fa1: 0000
            movi         a2, 0 /* 0x00000000 */                #  fa3: 0c02
.Lbr101:    l32i         a12, sp, 24 /* [(local2)] */          #  fa5: c861
            l32i         a13, sp, 28 /* [(local3)] */          #  fa7: d871
            l32i         a14, sp, 32 /* [(local4)] */          #  fa9: e881
            l32i         a0, sp, 20 /* [(local1)] */           #  fab: 0851
            addi         sp, sp, 48 /* (top of frame) */       #  fad: 12c130
            ret                                                #  fb0: 0df0
.Lbr102:    l32i         a3, sp, 16 /* [(local0)] */           #  fb2: 3841
            addi         a2, a12, 48 /* arg0+0x30 */           #  fb4: 22cc30
            movi         a5, 1 /* 0x00000001 */                #  fb7: 0c15
            movi         a4, 0 /* 0x00000000 */                #  fb9: 0c04
            s32i         a4, a12, 180 /* 0x00000000 -> [arg0+0xb4] */ #  fbb: 426c2d
            s32i         a5, a12, 176 /* 0x00000001 -> [arg0+0xb0] */ #  fbe: 526c2c
            movi         a4, 64 /* 0x00000040 */               #  fc1: 4c04
            call0        memcpy                                #  fc3: 01c7ffc0
                                                               #  fc7: 0000
            movi         a2, 1 /* 0x00000001 */                #  fc9: 0c12
            j            .Lbr096                               #  fcb: c6dcff

            .literal_position                                  #  fd0: 00000000
                                                               #  fd4: 00000000
                                                               #  fd8: 00000000
                                                               #  fdc: 00000000
                                                               #  fe0: 00000000

# Function @ .irom0.text+0xfe4
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
.Lfunc028:  addi         sp, sp, -64 /* (FP)-0x40 */           #  fe4: 12c1c0
            s32i         a0, sp, 48 /* a0 -> [(local4)] */     #  fe7: 09c1
            s32i         a13, sp, 56 /* a13 -> [(local6)] */   #  fe9: d9e1
            s32i         a12, sp, 52 /* a12 -> [(local5)] */   #  feb: c9d1
            mov          a13, a2 /* arg0 */                    #  fed: dd02
            mov          a12, a3 /* arg1 */                    #  fef: cd03
            l8ui         a2, a3, 93 /* [arg1+0x5d] */          #  ff1: 22035d
            l8ui         a0, a3, 94 /* [arg1+0x5e] */          #  ff4: 02035e
            slli         a2, a2, 8                             #  ff7: 802211
            or           a0, a0, a2                            #  ffa: 200020
            l32i         a2, a13, 176 /* [arg0+0xb0] */        #  ffd: 222d2c
            extui        a0, a0, 0, 16                         # 1000: 0000f4
            bnez         a2, .Lbr108                           # 1003: 566205
.Lbr103:    movi         a2, -1 /* 0xffffffff */               # 1006: 7cf2
            j            .Lbr107                               # 1008: 861100
.Lbr104:    beqi         a4, 2, .Lbr105                        # 100b: 262402
            bnei         a4, 3, .Lbr103                        # 100e: 6634f4
.Lbr105:    s32i         a0, sp, 32 /* a0 -> [(local0)] */     # 1011: 0981
            movi         a3, 7 /* 0x00000007 */                # 1013: 0c73
            bany         a3, a0, .Lbr103                       # 1015: 0783ed
            addi         a2, a13, 64 /* arg0+0x40 */           # 1018: 22cd40
            addi         a3, a0, -8                            # 101b: 32c0f8
            addi         a5, a12, 103 /* arg1+0x67 */          # 101e: 52cc67
            addi         a4, a12, 95 /* arg1+0x5f */           # 1021: 42cc5f
            s32i         a4, sp, 40 /* arg1+0x5f -> [(local2)] */ # 1024: 49a1
            s32i         a5, sp, 44 /* arg1+0x67 -> [(local3)] */ # 1026: 59b1
            s32i         a3, sp, 36 /* a3 -> [(local1)] */     # 1028: 3991
            extui        a13, a3, 0, 16                        # 102a: 30d0f4
            extui        a3, a3, 3, 13                         # 102d: 3033c4
            call0        aes_unwrap                            # 1030: 01e8ffc0
                                                               # 1034: 0000
            bnez         a2, .Lbr103                           # 1036: 56c2fc
            l32i         a2, sp, 40 /* [(local2)] */           # 1039: 28a1
            l32i         a3, sp, 44 /* [(local3)] */           # 103b: 38b1
            mov          a4, a13                               # 103d: 4d0d
            call0        memcpy                                # 103f: 01e5ffc0
                                                               # 1043: 0000
            srli         a4, a13, 8                            # 1045: d04841
            l32i         a5, sp, 36 /* [(local1)] */           # 1048: 5891
            s8i          a5, a12, 94 /* [(local1)] -> [arg1+0x5e] */ # 104a: 524c5e
            s8i          a4, a12, 93 /* a4 -> [arg1+0x5d] */   # 104d: 424c5d
.Lbr106:    movi         a2, 0 /* 0x00000000 */                # 1050: 0c02
.Lbr107:    l32i         a12, sp, 52 /* [(local5)] */          # 1052: c8d1
            l32i         a13, sp, 56 /* [(local6)] */          # 1054: d8e1
            l32i         a0, sp, 48 /* [(local4)] */           # 1056: 08c1
            addi         sp, sp, 64 /* (top of frame) */       # 1058: 12c140
            ret                                                # 105b: 0df0
.Lbr108:    s32i         a0, sp, 32 /* a0 -> [(local0)] */     # 105d: 0981
            bnei         a4, 1, .Lbr104                        # 105f: 6614a8
            mov          a2, sp /* (FP)-0x40 */                # 1062: 2d01
            addi         a3, a3, 45 /* arg1+0x2d */            # 1064: 32c32d
            movi         a4, 16 /* 0x00000010 */               # 1067: 1c04
            call0        memcpy                                # 1069: 01dbffc0
                                                               # 106d: 0000
            addi         a3, a13, 64 /* arg0+0x40 */           # 106f: 32cd40
            addi         a2, sp, 16 /* (FP)-0x30 */            # 1072: 22c110
            movi         a4, 16 /* 0x00000010 */               # 1075: 1c04
            call0        memcpy                                # 1077: 01d9ffc0
                                                               # 107b: 0000
            addi         a5, a12, 95 /* arg1+0x5f */           # 107d: 52cc5f
            mov          a2, sp /* (FP)-0x40 */                # 1080: 2d01
            movi         a3, 32 /* 0x00000020 */               # 1082: 2c03
            movi         a4, 256 /* 0x00000100 */              # 1084: 42a100
            l32i         a6, sp, 32 /* [(local0)] */           # 1087: 6881
            call0        rc4_skip                              # 1089: 01d5ffc0
                                                               # 108d: 0000
            bnez         a2, .Lbr103                           # 108f: 5632f7
            j            .Lbr106                               # 1092: 86eeff

            .balign      4
# Function @ .irom0.text+0x1098
            .balign      4
.Lfunc029:  ret           /* arg0 */                           # 1098: 0df0

            .literal_position                                  # 109c: 00000000
                                                               # 10a0: fc000000
                                                               # 10a4: 80200000
                                                               # 10a8: 00000000

# Function @ .irom0.text+0x10ac
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
            .global      wpa_sm_rx_eapol
            .type        wpa_sm_rx_eapol, @function
wpa_sm_rx_eapol:
            mov          a5, a2 /* arg0 */                     # 10ac: 5d02
            addi         sp, sp, -48 /* (local0) */            # 10ae: 12c1d0
            s32i         a13, sp, 20 /* a13 -> [(local5)] */   # 10b1: d951
            s32i         a14, sp, 24 /* a14 -> [(local6)] */   # 10b3: e961
            s32i         a15, sp, 28 /* a15 -> [(local7)] */   # 10b5: f971
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   # 10b7: c941
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     # 10b9: 0931
            mov          a12, a3 /* arg1 */                    # 10bb: cd03
            movi         a0, 98 /* 0x00000062 */               # 10bd: 02a062
            bltu         a0, a4, .Lbr109                       # 10c0: 473004
            movi         a2, 0 /* 0x00000000 */                # 10c3: 0c02
            j            .Lbr113                               # 10c5: 861200
.Lbr109:    l8ui         a3, a3, 1 /* [arg1+0x1] */            # 10c8: 320301
            l8ui         a2, a12, 3 /* [arg1+0x3] */           # 10cb: 220c03
            l8ui         a6, a12, 2 /* [arg1+0x2] */           # 10ce: 620c02
            slli         a2, a2, 8                             # 10d1: 802211
            or           a2, a2, a6                            # 10d4: 602220
            bnei         a3, 3, .Lbr110                        # 10d7: 663322
            addi         a3, a4, -4 /* arg2-0x4 */             # 10da: 32c4fc
            extui        a6, a2, 8, 8                          # 10dd: 206874
            extui        a7, a2, 0, 8                          # 10e0: 207074
            slli         a7, a7, 8                             # 10e3: 807711
            or           a6, a6, a7                            # 10e6: 706620
            bltu         a3, a6, .Lbr110                       # 10e9: 673310
            movi         a8, 94 /* 0x0000005e */               # 10ec: 5ce8
            bgeu         a8, a6, .Lbr110                       # 10ee: 67b80b
            l8ui         a0, a12, 4 /* [arg1+0x4] */           # 10f1: 020c04
            movi         a9, 254 /* 0x000000fe */              # 10f4: 92a0fe
            beq          a0, a9, .Lbr114                       # 10f7: 971027
            beqi         a0, 2, .Lbr114                        # 10fa: 262024
.Lbr110:    movi         a2, 0 /* 0x00000000 */                # 10fd: 0c02
            j            .Lbr113                               # 10ff: 060400
.Lbr111:    l32i         a10, sp, 0 /* [(local0)] */           # 1102: a801
            beqz         a10, .Lbr112                          # 1104: 8c9a
            mov          a6, a13                               # 1106: 6d0d
            mov          a4, a15 /* arg1+0x4 */                # 1108: 4d0f
            mov          a2, a14 /* .Ldata001 */               # 110a: 2d0e
            l32i         a3, sp, 4 /* [(local1)] */            # 110c: 3811
            call0        .Lfunc025                             # 110e: 45c9ff
.Lbr112:    movi         a2, 1 /* 0x00000001 */                # 1111: 0c12
.Lbr113:    l32i         a12, sp, 16 /* [(local4)] */          # 1113: c841
            l32i         a13, sp, 20 /* [(local5)] */          # 1115: d851
            l32i         a14, sp, 24 /* [(local6)] */          # 1117: e861
            l32i         a15, sp, 28 /* [(local7)] */          # 1119: f871
            l32i         a0, sp, 12 /* [(local3)] */           # 111b: 0831
            addi         sp, sp, 48 /* (top of frame) */       # 111d: 12c130
            ret                                                # 1120: 0df0
.Lbr114:    movi         a2, 0 /* 0x00000000 */                # 1122: 0c02
            s32i         a6, sp, 8 /* a6 -> [(local2)] */      # 1124: 6921
            s32i         a5, sp, 4 /* arg0 -> [(local1)] */    # 1126: 5911
            addi         a15, a12, 4 /* arg1+0x4 */            # 1128: 4bfc
            mov          a3, a15 /* arg1+0x4 */                # 112a: 3d0f
            call0        .Lfunc029                             # 112c: 85f6ff
            l8ui         a2, a12, 5 /* [arg1+0x5] */           # 112f: 220c05
            l8ui         a0, a12, 6 /* [arg1+0x6] */           # 1132: 020c06
            slli         a2, a2, 8                             # 1135: 802211
            or           a0, a0, a2                            # 1138: 200020
            extui        a13, a0, 0, 3                         # 113b: 00d024
            beqi         a13, 1, .Lbr116                       # 113e: 261d07
            beqi         a13, 2, .Lbr116                       # 1141: 262d04
.Lbr115:    movi         a2, -1 /* 0xffffffff */               # 1144: 7cf2
            j            .Lbr113                               # 1146: 46f2ff
.Lbr116:    movi         a14, .Ldata001                        # 1149: e1d4ff
            l32i         a3, a14, 0x114 /* [.Ldata005] */      # 114c: 322e45
            bnei         a3, 8, .Lbr117                        # 114f: 66830b
            beqi         a13, 2, .Lbr117                       # 1152: 262d08
            l32i         a4, a14, 0x118 /* [.Ldata006] */      # 1155: 422e46
            beqi         a4, 8, .Lbr115                        # 1158: 2684e8
            bbsi         a0, 3, .Lbr115                        # 115b: 37e0e5
.Lbr117:    l32i         a5, a14, 0x104 /* [.Ldata004] */      # 115e: 522e41
            s32i         a0, sp, 32 /* a0 -> [(local8)] */     # 1161: 0981
            beqz         a5, .Lbr118                           # 1163: 9c05
            addi         a2, a12, 9 /* arg1+0x9 */             # 1165: 9b2c
            movi         a3, .Label002                         # 1167: 31ceff
            movi         a4, 8 /* 0x00000008 */                # 116a: 0c84
            call0        memcmp                                # 116c: 01cfffc0
                                                               # 1170: 0000
            l32i         a0, sp, 32 /* [(local8)] */           # 1172: 0881
            blti         a2, 1, .Lbr115                        # 1174: a612cc
.Lbr118:    movi         a6, 0x00002080                        # 1177: 61cbff
            bnone        a0, a6, .Lbr115                       # 117a: 6700c6
            bbsi         a0, 11, .Lbr115                       # 117d: b7e0c3
            s32i         a0, sp, 32 /* a0 -> [(local8)] */     # 1180: 0981
            movi         a7, 256 /* 0x00000100 */              # 1182: 72a100
            and          a7, a0, a7                            # 1185: 707010
            s32i         a7, sp, 0 /* a7 -> [(local0)] */      # 1188: 7901
            bbci         a0, 8, .Lbr119                        # 118a: 876013
            mov          a2, a14 /* .Ldata001 */               # 118d: 2d0e
            mov          a3, a15 /* arg1+0x4 */                # 118f: 3d0f
            mov          a4, a13                               # 1191: 4d0d
            l32i         a6, sp, 8 /* [(local2)] */            # 1193: 6821
            mov          a5, a12 /* arg1 */                    # 1195: 5d0c
            addi         a6, a6, 4 /* [(local2)]+0x4 */        # 1197: 4b66
            call0        .Lfunc027                             # 1199: 85d4ff
            l32i         a0, sp, 32 /* [(local8)] */           # 119c: 0881
            bnez         a2, .Lbr115                           # 119e: 5622fa
.Lbr119:    l8ui         a5, a12, 98 /* [arg1+0x62] */         # 11a1: 520c62
            l32i         a7, sp, 8 /* [(local2)] */            # 11a4: 7821
            l8ui         a6, a12, 97 /* [arg1+0x61] */         # 11a6: 620c61
            addi         a7, a7, -95 /* [(local2)]-0x5f */     # 11a9: 72c7a1
            slli         a6, a6, 8                             # 11ac: 806611
            or           a5, a5, a6                            # 11af: 605520
            extui        a5, a5, 0, 16                         # 11b2: 5050f4
            bltu         a7, a5, .Lbr115                       # 11b5: 57378b
            l32i         a8, a14, 0x164 /* [.Ldata013] */      # 11b8: 822e59
            bnei         a8, 2, .Lbr120                        # 11bb: 662821
            s32i         a0, sp, 32 /* a0 -> [(local8)] */     # 11be: 0981
            bbci         a0, 12, .Lbr120                       # 11c0: c7601c
            mov          a2, a14 /* .Ldata001 */               # 11c3: 2d0e
            mov          a3, a15 /* arg1+0x4 */                # 11c5: 3d0f
            mov          a4, a13                               # 11c7: 4d0d
            call0        .Lfunc028                             # 11c9: 85e1ff
            bnez         a2, .Lbr115                           # 11cc: 5642f7
            l32i         a0, sp, 32 /* [(local8)] */           # 11cf: 0881
            l8ui         a6, a12, 97 /* [arg1+0x61] */         # 11d1: 620c61
            l8ui         a5, a12, 98 /* [arg1+0x62] */         # 11d4: 520c62
            slli         a6, a6, 8                             # 11d7: 806611
            or           a5, a5, a6                            # 11da: 605520
            extui        a5, a5, 0, 16                         # 11dd: 5050f4
.Lbr120:    extui        a7, a0, 3, 1                          # 11e0: 007304
            beqz         a7, .Lbr111                           # 11e3: 16b7f1
            movi         a8, 48 /* 0x00000030 */               # 11e6: 3c08
            bnone        a0, a8, .Lbr121                       # 11e8: 870002
            j            .Lbr115                               # 11eb: 46d5ff
.Lbr121:    l32i         a9, sp, 0 /* [(local0)] */            # 11ee: 9801
            beqz         a9, .Lbr122                           # 11f0: 8ca9
            mov          a4, a13                               # 11f2: 4d0d
            mov          a3, a15 /* arg1+0x4 */                # 11f4: 3d0f
            mov          a2, a14 /* .Ldata001 */               # 11f6: 2d0e
            call0        .Lfunc020                             # 11f8: 857aff
            j            .Lbr112                               # 11fb: 86c4ff
.Lbr122:    mov          a5, a13                               # 11fe: 5d0d
            mov          a4, a15 /* arg1+0x4 */                # 1200: 4d0f
            mov          a2, a14 /* .Ldata001 */               # 1202: 2d0e
            l32i         a3, sp, 4 /* [(local1)] */            # 1204: 3811
            call0        .Lfunc007                             # 1206: 051dff
            j            .Lbr112                               # 1209: 06c1ff

            .literal_position                                  # 120c: d0000000

# Function @ .irom0.text+0x1210
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      wpa_register
            .type        wpa_register, @function
wpa_register:
            movi         a8, .Label001                         # 1210: 81ffff
            movi         a2, 1 /* 0x00000001 */                # 1213: 0c12
            addi         sp, sp, -16 /* (local0) */            # 1215: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1218: 0901
            s8i          a2, a8, 128 /* 0x01 -> [.Ldata011] */ # 121a: 224880
            s32i         a3, a8, 0x144 /* arg1 -> [.Ldata018] */ # 121d: 326851
            s32i         a4, a8, 0x148 /* arg2 -> [.Ldata019] */ # 1220: 426852
            s32i         a5, a8, 0x14c /* arg3 -> [.Ldata020] */ # 1223: 526853
            s32i         a6, a8, 0x150 /* arg4 -> [.Ldata021] */ # 1226: 626854
            s32i         a7, a8, 0x154 /* arg5 -> [.Ldata022] */ # 1229: 726855
            movi         a0, 0 /* 0x00000000 */                # 122c: 0c00
            s32i         a0, a8, 0x13c /* 0x00000000 -> [.Ldata017] */ # 122e: 02684f
            call0        wpa_sm_set_state                      # 1231: 050000
            l32i         a0, sp, 0 /* [(local0)] */            # 1234: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1236: 12c110
            ret                                                # 1239: 0df0

            .literal_position                                  # 123c: 00000000

# Function @ .irom0.text+0x1240
            .balign      4
            .global      wpa_set_profile
            .type        wpa_set_profile, @function
wpa_set_profile:
            movi         a4, .Ldata001                         # 1240: 41ffff
            movi         a3, 2 /* 0x00000002 */                # 1243: 0c23
            s32i         a2, a4, 0x164 /* arg0 -> [.Ldata013] */ # 1245: 226459
            s32i         a3, a4, 0x11c /* 0x00000002 -> [.Ldata007] */ # 1248: 326447
            ret           /* arg0 */                           # 124b: 0df0

            .literal_position                                  # 1250: 00000000
                                                               # 1254: 00000000
                                                               # 1258: 00000000

# Function @ .irom0.text+0x125c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      wpa_set_pmk
            .type        wpa_set_pmk, @function
wpa_set_pmk:
            movi         a4, 32 /* 0x00000020 */               # 125c: 2c04
            mov          a3, a2 /* arg0 */                     # 125e: 3d02
            addi         sp, sp, -16 /* (local0) */            # 1260: 12c1f0
            movi         a2, .Ldata001                         # 1263: 21fbff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1266: 0901
            call0        memcpy                                # 1268: 01fcffc0
                                                               # 126c: 0000
            movi         a2, .Ldata001                         # 126e: 21f9ff
            movi         a0, 32 /* 0x00000020 */               # 1271: 2c00
            s32i         a0, a2, 32 /* 0x00000020 -> [.Ldata002] */ # 1273: 0982
            l32i         a0, sp, 0 /* [(local0)] */            # 1275: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1277: 12c110
            ret           /* .Ldata001 */                      # 127a: 0df0

            .literal_position                                  # 127c: 00000000
                                                               # 1280: fc000000
                                                               # 1284: 00000000
                                                               # 1288: 58010000
                                                               # 128c: 5e010000
                                                               # 1290: 60020000
                                                               # 1294: 00000000
                                                               # 1298: 00000000
                                                               # 129c: 00000000
                                                               # 12a0: 00000000
                                                               # 12a4: e0130000
                                                               # 12a8: 00000000
                                                               # 12ac: 68130000

# Function @ .irom0.text+0x12b0
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      wpa_set_bss
            .type        wpa_set_bss, @function
wpa_set_bss:
            ssl          a4                                    # 12b0: 001440
            addi         sp, sp, -32 /* (local0) */            # 12b3: 12c1e0
            s32i         a6, sp, 8 /* arg4 -> [(local2)] */    # 12b6: 6921
            s32i         a7, sp, 12 /* arg5 -> [(local3)] */   # 12b8: 7931
            movi         a4, 8 /* 0x00000008 */                # 12ba: 0c84
            s32i         a3, sp, 4 /* arg1 -> [(local1)] */    # 12bc: 3911
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     # 12be: 0941
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    # 12c0: 2901
            movi         a0, .Ldata001                         # 12c2: 01eeff
            movi         a2, 1 /* 0x00000001 */                # 12c5: 0c12
            sll          a3, a2                                # 12c7: 0032a1
            s32i         a3, a0, 0x114 /* a3 -> [.Ldata005] */ # 12ca: 326045
            ssl          a5                                    # 12cd: 001540
            movi         a3, 0 /* 0x00000000 */                # 12d0: 0c03
            sll          a2, a2                                # 12d2: 0022a1
            s32i         a2, a0, 0x118 /* a2 -> [.Ldata006] */ # 12d5: 226046
            s32i         a3, a0, 0x104 /* 0x00000000 -> [.Ldata004] */ # 12d8: 326041
            movi         a2, .Label002                         # 12db: 21e9ff
            call0        memset                                # 12de: 01eeffc0
                                                               # 12e2: 0000
            l32i         a3, sp, 0 /* [(local0)] */            # 12e4: 3801
            movi         a2, .Label004                         # 12e6: 21e8ff
            movi         a6, 0 /* 0x00000000 */                # 12e9: 0c06
            movi         a5, .Ldata001                         # 12eb: 51e6ff
            movi         a4, 1 /* 0x00000001 */                # 12ee: 0c14
            s32i         a4, a5, 248 /* 0x00000001 -> [.Ldata003] */ # 12f0: 42653e
            s32i         a6, a5, 0x154 /* 0x00000000 -> [.Ldata012] */ # 12f3: 626555
            movi         a4, 6 /* 0x00000006 */                # 12f6: 0c64
            call0        memcpy                                # 12f8: 01e9ffc0
                                                               # 12fc: 0000
            l32i         a3, sp, 4 /* [(local1)] */            # 12fe: 3811
            movi         a2, .Label005                         # 1300: 21e3ff
            movi         a4, 6 /* 0x00000006 */                # 1303: 0c64
            call0        memcpy                                # 1305: 01e6ffc0
                                                               # 1309: 0000
            movi         a2, .Ldata023                         # 130b: 21e1ff
            call0        .Lfunc031                             # 130e: 01e5ffc0
                                                               # 1312: 0000
            movi         a4, .Ldata001                         # 1314: 41e0ff
            mov          a2, a4 /* .Ldata001 */                # 1317: 2d04
            l32i         a3, a4, 0x148 /* [.Ldata009] */       # 1319: 322452
            l32i         a4, a4, 0x14c /* [.Ldata010] */       # 131c: 422453
            call0        wpa_gen_wpa_ie                        # 131f: 01e2ffc0
                                                               # 1323: 0000
            l32i         a2, sp, 8 /* [(local2)] */            # 1325: 2821
            l32i         a3, sp, 12 /* [(local3)] */           # 1327: 3831
            l32i         a4, sp, 32 /* [(local5)] */           # 1329: 4881
            call0        .Lfunc030                             # 132b: 01e0ffc0
                                                               # 132f: 0000
            l32i         a0, sp, 16 /* [(local4)] */           # 1331: 0841
            addi         sp, sp, 32 /* (local5) */             # 1333: 12c120
            ret                                                # 1336: 0df0

            .literal_position                                  # 1338: 00000000
                                                               # 133c: 00000000
                                                               # 1340: 00000000
                                                               # 1344: 00000000
                                                               # 1348: 00100000
                                                               # 134c: 00000000
                                                               # 1350: 00000000
                                                               # 1354: 00000000
                                                               # 1358: 00000000
                                                               # 135c: 00000000
                                                               # 1360: 00000000
                                                               # 1364: 00000000

# Function @ .irom0.text+0x1368
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc030:  addi         sp, sp, -16 /* (local0) */            # 1368: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 136b: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 136d: 0911
            beqz         a2, .Lbr125                           # 136f: 16e205
            movi         a0, g_ic+0x180                        # 1372: 01f1ff
            l8ui         a0, a0, 142 /* [g_ic+0x20e] */        # 1375: 02008e
            movi         a12, g_ic+0x250                       # 1378: c1f1ff
            beqz         a0, .Lbr124                           # 137b: bcf0
            addi         a2, a12, -65 /* g_ic+0x20f */         # 137d: 22ccbf
            s32i         a2, sp, 0 /* g_ic+0x20f -> [(local0)] */ # 1380: 2901
            call0        strlen                                # 1382: 01f3ffc0
                                                               # 1386: 0000
            bnei         a2, 64, .Lbr123                       # 1388: 66d20e
            l32i         a2, sp, 0 /* [(local0)] */            # 138b: 2801
            mov          a3, a12 /* g_ic+0x250 */              # 138d: 3d0c
            movi         a4, 32 /* 0x00000020 */               # 138f: 2c04
            call0        hexstr2bin                            # 1391: 01f0ffc0
                                                               # 1395: 0000
            j            .Lbr124                               # 1397: c60800
.Lbr123:    call0        system_overclock                      # 139a: 01efffc0
                                                               # 139e: 0000
            l32i         a2, sp, 0 /* [(local0)] */            # 13a0: 2801
            movi         a3, g_ic+0x1e8                        # 13a2: 31e8ff
            movi         a5, 0x00001000                        # 13a5: 51e8ff
            mov          a6, a12 /* g_ic+0x250 */              # 13a8: 6d0c
            movi         a4, g_ic                              # 13aa: 41e5ff
            movi         a7, 32 /* 0x00000020 */               # 13ad: 2c07
            l32i         a4, a4, 0x1e4 /* [g_ic+0x1e4] */      # 13af: 422479
            call0        pbkdf2_sha1                           # 13b2: 01eaffc0
                                                               # 13b6: 0000
            call0        system_restoreclock                   # 13b8: 01eaffc0
                                                               # 13bc: 0000
.Lbr124:    mov          a3, a12 /* g_ic+0x250 */              # 13be: 3d0c
            movi         a12, .Ldata001                        # 13c0: c1e3ff
            movi         a4, 32 /* 0x00000020 */               # 13c3: 2c04
            mov          a2, a12 /* .Ldata001 */               # 13c5: 2d0c
            call0        memcpy                                # 13c7: 01e7ffc0
                                                               # 13cb: 0000
            movi         a5, 32 /* 0x00000020 */               # 13cd: 2c05
            s32i         a5, a12, 32 /* 0x00000020 -> [.Ldata002] */ # 13cf: 598c
.Lbr125:    l32i         a12, sp, 8 /* [(local2)] */           # 13d1: c821
            l32i         a0, sp, 4 /* [(local1)] */            # 13d3: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 13d5: 12c110
            ret                                                # 13d8: 0df0

            .literal_position                                  # 13dc: 00000000

# Function @ .irom0.text+0x13e0
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc031:  mov          a3, a2 /* arg0 */                     # 13e0: 3d02
            addi         sp, sp, -16 /* (local0) */            # 13e2: 12c1f0
            movi         a6, .Ldata001                         # 13e5: 61fdff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 13e8: 0901
            addi         a0, a2, 2 /* arg0+0x2 */              # 13ea: 2b02
            l32i         a2, a6, 0x164 /* [.Ldata013] */       # 13ec: 222659
            s32i         a0, a6, 0x148 /* arg0+0x2 -> [.Ldata009] */ # 13ef: 026652
            bnei         a2, 1, .Lbr127                        # 13f2: 661216
            movi         a4, 24 /* 0x00000018 */               # 13f5: 1c84
            movi         a0, 24 /* 0x00000018 */               # 13f7: 1c80
.Lbr126:    s32i         a0, a6, 0x14c /* a0 -> [.Ldata010] */ # 13f9: 026653
            l32i         a0, a6, 0x218 /* [.Ldata019] */       # 13fc: 022686
            extui        a2, a2, 0, 8                          # 13ff: 202074
            callx0       a0 /* [.Ldata019] */                  # 1402: c00000
            l32i         a0, sp, 0 /* [(local0)] */            # 1405: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1407: 12c110
            ret                                                # 140a: 0df0
.Lbr127:    movi         a0, 22 /* 0x00000016 */               # 140c: 1c60
            movi         a4, 22 /* 0x00000016 */               # 140e: 1c64
            j            .Lbr126                               # 1410: 46f9ff

            .literal_position                                  # 1414: 00000000
                                                               # 1418: 00000000
                                                               # 141c: 00000000

# Function @ .irom0.text+0x1420
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word      @ -0x3c
#     (local2):  word[2]   @ -0x38
#     (local3):  word      @ -0x30
#     (local4):  word      @ -0x2c
#     (local5):  word      @ -0x28
#     (local6):  word      @ -0x24
#     (local7):  word      @ -0x20
#     (local8):  word      @ -0x1c
#     (local9):  word      @ -0x18
#     (local10): word      @ -0x14
#     (local11): word[4]   @ -0x10
            .balign      4
.Lfunc032:  addi         sp, sp, -64 /* (local0) */            # 1420: 12c1c0
            s32i         a4, sp, 40 /* arg2 -> [(local9)] */   # 1423: 49a1
            s32i         a5, sp, 44 /* arg3 -> [(local10)] */  # 1425: 59b1
            s32i         a7, sp, 16 /* arg5 -> [(local3)] */   # 1427: 7941
            s32i         a6, sp, 48 /* arg4 -> [(local11)] */  # 1429: 69c1
            s32i         a15, sp, 36 /* a15 -> [(local8)] */   # 142b: f991
            s32i         a13, sp, 28 /* a13 -> [(local6)] */   # 142d: d971
            s32i         a0, sp, 20 /* a0 -> [(local4)] */     # 142f: 0951
            s32i         a14, sp, 32 /* a14 -> [(local7)] */   # 1431: e981
            s32i         a12, sp, 24 /* a12 -> [(local5)] */   # 1433: c961
            mov          a14, a2 /* arg0 */                    # 1435: ed02
            mov          a12, a3 /* arg1 */                    # 1437: cd03
            movi         a0, 0 /* 0x00000000 */                # 1439: 0c00
            l32i         a13, sp, 72 /* [(FP)+0x8] */          # 143b: d22112
            l32i         a15, sp, 48 /* [(local11)] */         # 143e: f8c1
            bnei         a3, 2, .Lbr128                        # 1440: 662304
            bnei         a13, 32, .Lbr128                      # 1443: 66cd01
            s32i         a0, a2, 0 /* 0x00000000 -> [arg0] */  # 1446: 0902
.Lbr128:    s32i         a12, a14, 8 /* arg1 -> [arg0+0x8] */  # 1448: c92e
            addi         a2, a14, 12 /* arg0+0xc */            # 144a: cb2e
            l32i         a3, sp, 40 /* [(local9)] */           # 144c: 38a1
            movi         a4, 6 /* 0x00000006 */                # 144e: 0c64
            s32i         a0, a14, 4 /* 0x00000000 -> [arg0+0x4] */ # 1450: 091e
            call0        memcpy                                # 1452: 01f1ffc0
                                                               # 1456: 0000
            l32i         a2, sp, 44 /* [(local10)] */          # 1458: 28b1
            s32i         a15, a14, 24 /* [(local11)] -> [arg0+0x18] */ # 145a: f96e
            s32i         a2, a14, 20 /* [(local10)] -> [arg0+0x14] */ # 145c: 295e
            addi         a2, a14, 38 /* arg0+0x26 */           # 145e: 22ce26
            l32i         a14, sp, 68 /* [(FP)+0x4] */          # 1461: e22111
            mov          a4, a13 /* [(FP)+0x8] */              # 1464: 4d0d
            mov          a3, a14 /* [(FP)+0x4] */              # 1466: 3d0e
            call0        memcpy                                # 1468: 01edffc0
                                                               # 146c: 0000
            mov          a5, a15 /* [(local11)] */             # 146e: 5d0f
            mov          a2, a12 /* arg1 */                    # 1470: 2d0c
            l32i         a3, sp, 40 /* [(local9)] */           # 1472: 38a1
            l32i         a4, sp, 44 /* [(local10)] */          # 1474: 48b1
            l32i         a7, sp, 64 /* [(local12)] */          # 1476: 722110
            s32i         a14, sp, 0 /* [(FP)+0x4] -> [(local0)] */ # 1479: e901
            s32i         a13, sp, 4 /* [(FP)+0x8] -> [(local1)] */ # 147b: d911
            movi         a0, .Ldata001                         # 147d: 01e5ff
            l32i         a6, sp, 76 /* [(FP)+0xc] */           # 1480: 622113
            s32i         a6, sp, 8 /* [(FP)+0xc] -> [(local2)] */ # 1483: 6921
            l32i         a0, a0, 0x21c /* [.Ldata020] */       # 1485: 022087
            l32i         a6, sp, 16 /* [(local3)] */           # 1488: 6841
            callx0       a0 /* [.Ldata020] */                  # 148a: c00000
            movi         a2, 0 /* 0x00000000 */                # 148d: 0c02
            l32i         a12, sp, 24 /* [(local5)] */          # 148f: c861
            l32i         a13, sp, 28 /* [(local6)] */          # 1491: d871
            l32i         a14, sp, 32 /* [(local7)] */          # 1493: e881
            l32i         a15, sp, 36 /* [(local8)] */          # 1495: f891
            l32i         a0, sp, 20 /* [(local4)] */           # 1497: 0851
            addi         sp, sp, 64 /* (local12) */            # 1499: 12c140
            ret           /* 0x00000000 */                     # 149c: 0df0

            .literal_position                                  # 14a0: 00000000

# Function @ .irom0.text+0x14a4
            .balign      4
.Lfunc033:  movi         a3, .Ldata001                         # 14a4: 31ffff
            movi         a2, 0 /* 0x00000000 */                # 14a7: 0c02
            s32i         a2, a3, 0x17c /* 0x00000000 -> [.Ldata015] */ # 14a9: 22635f
            s32i         a2, a3, 0x1c4 /* 0x00000000 -> [.Ldata016] */ # 14ac: 226371
            ret           /* 0x00000000 */                     # 14af: 0df0

            .literal_position                                  # 14b4: 00000000

# Function @ .irom0.text+0x14b8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc034:  addi         sp, sp, -16 /* (local0) */            # 14b8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 14bb: 0901
            movi         a0, .Ldata001                         # 14bd: 01fdff
            l32i         a2, a0, 0x128 /* [.Ldata008] */       # 14c0: 22204a
            beqz         a2, .Lbr129                           # 14c3: 8c62
            movi         a2, 0 /* 0x00000000 */                # 14c5: 0c02
            s32i         a2, a0, 0x128 /* 0x00000000 -> [.Ldata008] */ # 14c7: 22604a
            call0        .Lfunc033                             # 14ca: 85fdff
.Lbr129:    movi         a2, 0 /* 0x00000000 */                # 14cd: 0c02
            call0        wpa_sm_set_state                      # 14cf: 050000
            l32i         a0, sp, 0 /* [(local0)] */            # 14d2: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 14d4: 12c110
            ret                                                # 14d7: 0df0

            .literal_position                                  # 14dc: 00000000
                                                               # 14e0: c4010000
                                                               # 14e4: 2c010000
                                                               # 14e8: 00000000
                                                               # 14ec: 00000000
                                                               # 14f0: 10270000
                                                               # 14f4: b8140000
                                                               # 14f8: 60ea0000
                                                               # 14fc: 00000000
                                                               # 1500: a4140000
                                                               # 1504: 60ea0000
                                                               # 1508: 00000000
                                                               # 150c: 00000000
                                                               # 1510: 00000000
                                                               # 1514: 00000000
                                                               # 1518: 00000000
                                                               # 151c: 00000000
                                                               # 1520: 00000000

# Function @ .irom0.text+0x1524
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      pp_michael_mic_failure
            .type        pp_michael_mic_failure, @function
pp_michael_mic_failure:
            movi         a4, .Ldata016                         # 1524: 41efff
            addi         sp, sp, -16 /* (local0) */            # 1527: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 152a: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 152c: 0901
            movi         a12, .Label003                        # 152e: c1edff
            movi         a0, .Ldata001                         # 1531: 01eaff
            addi         a5, a4, -72 /* .Ldata015 */           # 1534: 52c4b8
            l32i         a3, a0, 0x1c4 /* [.Ldata016] */       # 1537: 322071
            l32i         a0, a0, 0x17c /* [.Ldata015] */       # 153a: 02205f
            moveqz       a5, a4, a2                            # 153d: 205483
            add          a0, a0, a3                            # 1540: 3a00
            beqz         a0, .Lbr130                           # 1542: 167004
            movi         a2, 11 /* 0x0000000b */               # 1545: 0cb2
            call0        wpa_sm_set_state                      # 1547: 01f0ffc0
                                                               # 154b: 0000
            movi         a2, .Ldata001                         # 154d: 21e6ff
            movi         a3, 1 /* 0x00000001 */                # 1550: 0c13
            movi         a4, 0 /* 0x00000000 */                # 1552: 0c04
            call0        .Lfunc003                             # 1554: 85befe
            movi         a3, .Ldata001                         # 1557: 31e5ff
            movi         a2, 1 /* 0x00000001 */                # 155a: 0c12
            s32i         a2, a3, 0x128 /* 0x00000001 -> [.Ldata008] */ # 155c: 22634a
            movi         a2, 0x00002710                        # 155f: 21e4ff
            call0        os_delay_us                           # 1562: 01eaffc0
                                                               # 1566: 0000
            mov          a2, a12 /* .Label003 */               # 1568: 2d0c
            call0        os_timer_disarm                       # 156a: 01e9ffc0
                                                               # 156e: 0000
            mov          a2, a12 /* .Label003 */               # 1570: 2d0c
            movi         a3, .Lfunc034                         # 1572: 31e0ff
            movi         a4, 0 /* 0x00000000 */                # 1575: 0c04
            call0        os_timer_setfn                        # 1577: 01e7ffc0
                                                               # 157b: 0000
            mov          a2, a12 /* .Label003 */               # 157d: 2d0c
            movi         a3, 0x0000ea60                        # 157f: 31deff
            movi         a4, 0 /* 0x00000000 */                # 1582: 0c04
            call0        os_timer_arm                          # 1584: 01e5ffc0
                                                               # 1588: 0000
            j            .Lbr131                               # 158a: 860b00
.Lbr130:    l32i         a4, a5, 0                             # 158d: 4805
            movi         a2, 10 /* 0x0000000a */               # 158f: 0ca2
            addi         a4, a4, 1                             # 1591: 1b44
            s32i         a4, a5, 0                             # 1593: 4905
            call0        wpa_sm_set_state                      # 1595: 050000
            movi         a2, .Ldata001                         # 1598: 21d9ff
            movi         a3, 1 /* 0x00000001 */                # 159b: 0c13
            movi         a4, 0 /* 0x00000000 */                # 159d: 0c04
            call0        .Lfunc003                             # 159f: 05bafe
            mov          a2, a12 /* .Label003 */               # 15a2: 2d0c
            movi         a3, .Lfunc033                         # 15a4: 31d7ff
            movi         a4, 0 /* 0x00000000 */                # 15a7: 0c04
            call0        os_timer_setfn                        # 15a9: 01dcffc0
                                                               # 15ad: 0000
            mov          a2, a12 /* .Label003 */               # 15af: 2d0c
            movi         a3, 0x0000ea60                        # 15b1: 31d4ff
            movi         a4, 0 /* 0x00000000 */                # 15b4: 0c04
            call0        os_timer_arm                          # 15b6: 01daffc0
                                                               # 15ba: 0000
.Lbr131:    l32i         a12, sp, 4 /* [(local1)] */           # 15bc: c811
            l32i         a0, sp, 0 /* [(local0)] */            # 15be: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 15c0: 12c110
            ret                                                # 15c3: 0df0

            .literal_position                                  # 15c8: 00000000
                                                               # 15cc: 00000000
                                                               # 15d0: 00000000
                                                               # 15d4: 00000000

# Function @ .irom0.text+0x15d8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      eapol_txcb
            .type        eapol_txcb, @function
eapol_txcb: addi         sp, sp, -16 /* (local0) */            # 15d8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 15db: 0901
            movi         a0, g_ic                              # 15dd: 01faff
            l32i         a0, a0, 16 /* [g_ic+0x10] */          # 15e0: 0840
            l32i         a0, a0, 60 /* [[g_ic+0x10]+0x3c] */   # 15e2: 08f0
            bnei         a0, 5, .Lbr134                        # 15e4: 665020
            movi         a0, .Ldata001                         # 15e7: 01f9ff
            l32i         a3, a0, 0x168 /* [.Ldata014] */       # 15ea: 32205a
            beqi         a3, 6, .Lbr132                        # 15ed: 26630a
            beqi         a3, 7, .Lbr136                        # 15f0: 267320
            beqi         a3, 8, .Lbr137                        # 15f3: 268325
            movi         a2, 11 /* 0x0000000b */               # 15f6: 0cb2
            beq          a3, a2, .Lbr135                       # 15f8: 271313
.Lbr132:    movi         a3, 0 /* 0x00000000 */                # 15fb: 0c03
.Lbr133:    beqz         a3, .Lbr134                           # 15fd: 8c73
            movi         a2, .Ldata001                         # 15ff: 21f4ff
            call0        wpa_sm_deauthenticate                 # 1602: 01f4ffc0
                                                               # 1606: 0000
.Lbr134:    l32i         a0, sp, 0 /* [(local0)] */            # 1608: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 160a: 12c110
            ret                                                # 160d: 0df0
.Lbr135:    movi         a3, 14 /* 0x0000000e */               # 160f: 0ce3
            j            .Lbr133                               # 1611: 06faff
.Lbr136:    mov          a2, a0 /* .Ldata001 */                # 1614: 2d00
            call0        .Lfunc021                             # 1616: 054aff
            j            .Lbr138                               # 1619: 060100
.Lbr137:    mov          a2, a0 /* .Ldata001 */                # 161c: 2d00
            call0        .Lfunc026                             # 161e: 8583ff
.Lbr138:    extui        a3, a2, 0, 8                          # 1621: 203074
            j            .Lbr133                               # 1624: 46f5ff

            .literal_position                                  # 1628: 00000000
                                                               # 162c: 2c010000
                                                               # 1630: 00000000
                                                               # 1634: 00000000

# Function @ .irom0.text+0x1638
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      wpa_sm_set_state
            .type        wpa_sm_set_state, @function
wpa_sm_set_state:
            addi         sp, sp, -16 /* (local0) */            # 1638: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 163b: 0901
            movi         a0, .Ldata001                         # 163d: 01faff
            l32i         a3, a0, 0x168 /* [.Ldata014] */       # 1640: 32205a
            s32i         a2, sp, 4 /* arg0 -> [(local1)] */    # 1643: 2911
            bnei         a3, 10, .Lbr139                       # 1645: 66930d
            movi         a2, .Label003                         # 1648: 21f9ff
            call0        os_timer_disarm                       # 164b: 01faffc0
                                                               # 164f: 0000
            movi         a0, .Ldata001                         # 1651: 01f7ff
            l32i         a2, sp, 4 /* [(local1)] */            # 1654: 2811
.Lbr139:    s32i         a2, a0, 0x168 /* a2 -> [.Ldata014] */ # 1656: 22605a
            l32i         a0, sp, 0 /* [(local0)] */            # 1659: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 165b: 12c110
            ret                                                # 165e: 0df0

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "Pairwise key expansion"              #    0: 50616972
                                                               #    4: 77697365
                                                               #    8: 206b6579
                                                               #    c: 20657870
                                                               #   10: 616e7369
                                                               #   14: 6f6e00

            .section     .rodata, "a", @progbits

.Ldata024:  .space       8

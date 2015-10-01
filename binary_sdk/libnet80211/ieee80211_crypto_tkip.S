
            .section     .data, "aw", @progbits

            .global      sdk_tkip
            .type        sdk_tkip, @object
sdk_tkip:   .word        0x00000002                            #    0: 02000000
.Ldata001:  .word        0x00000008                            #    4: 08000000

# NOTE: The following is apparently unreferenced code/data
            .word        0x0000000c                            #    8: 0c000000
            .word        0x00000008                            #    c: 08000000

.Lrel001:   .word        .Lfunc001                             #   10: 08000000
.Lrel002:   .word        .Lfunc002                             #   14: a0000000

            .section     .bss, "aw", @nobits

.Ldata002:  .word        0x00000000                            #    0: 00000000
.Ldata003:  .word        0x00000000                            #    4: 00000000

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000

# Function @ .irom0.text+0x8
.Lfunc001:  movi         a5, sdk_g_ic                          #    8: 51feff
            ssai         8                                     #    b: 004840
            l32i         a5, a5, 28 /* [sdk_g_ic+0x1c] */      #    e: 5875
            movi         a11, sdk_tkip                         #   10: b1fdff
            bbci         a5, 26, .Lbr001                       #   13: a77503
            movi         a2, 0 /* 0x00000000 */                #   16: 0c02
            ret           /* 0x00000000 */                     #   18: 0df0
.Lbr001:    l32i         a7, a2, 148 /* [arg0+0x94] */         #   1a: 722225
            l16ui        a10, a3, 22 /* [arg1+0x16] */         #   1d: a2130b
            l32i         a5, a3, 4 /* [arg1+0x4] */            #   20: 5813
            l32i         a9, a11, 4 /* [.Ldata001] */          #   22: 981b
            l32i         a8, a5, 4 /* [[arg1+0x4]+0x4] */      #   24: 8815
            l32i         a11, a11, 4 /* [.Ldata001] */         #   26: b81b
            sub          a8, a8, a9                            #   28: 9088c0
            l32i         a9, a2, 144 /* [arg0+0x90] */         #   2b: 922224
            add          a10, a10, a11                         #   2e: baaa
            src          a7, a7, a9                            #   30: 907781
            movi         a9, 95 /* 0x0000005f */               #   33: 5cf9
            s32i         a8, a5, 4 /* a8 -> [[arg1+0x4]+0x4] */ #   35: 8915
            s16i         a10, a3, 22 /* a10 -> [arg1+0x16] */  #   37: a2530b
            and          a9, a7, a9                            #   3a: 909710
            movi         a10, 32 /* 0x00000020 */              #   3d: 2c0a
            or           a6, a4, a10                           #   3f: a06420
            s8i          a7, a8, 0                             #   42: 724800
            or           a9, a9, a10                           #   45: a09920
            s8i          a9, a8, 1                             #   48: 924801
            l32i         a5, a2, 144 /* [arg0+0x90] */         #   4b: 522224
            s8i          a6, a8, 3                             #   4e: 624803
            s8i          a5, a8, 2                             #   51: 524802
            l32i         a4, a2, 144 /* [arg0+0x90] */         #   54: 422224
            l32i         a3, a2, 148 /* [arg0+0x94] */         #   57: 322225
            ssai         16                                    #   5a: 104040
            src          a3, a3, a4                            #   5d: 403381
            s8i          a3, a8, 4                             #   60: 324804
            l32i         a11, a2, 144 /* [arg0+0x90] */        #   63: b22224
            l32i         a10, a2, 148 /* [arg0+0x94] */        #   66: a22225
            ssai         24                                    #   69: 104840
            src          a10, a10, a11                         #   6c: b0aa81
            s8i          a10, a8, 5                            #   6f: a24805
            l32i         a9, a2, 148 /* [arg0+0x94] */         #   72: 922225
            s8i          a9, a8, 6                             #   75: 924806
            l32i         a7, a2, 148 /* [arg0+0x94] */         #   78: 722225
            srli         a7, a7, 8                             #   7b: 707841
            s8i          a7, a8, 7                             #   7e: 724807
            l32i         a6, a2, 144 /* [arg0+0x90] */         #   81: 622224
            l32i         a3, a2, 148 /* [arg0+0x94] */         #   84: 322225
            addi         a4, a6, 1 /* [arg0+0x90]+0x1 */       #   87: 1b46
            bgeu         a4, a6, .Lbr002                       #   89: 67b401
            addi         a3, a3, 1 /* [arg0+0x94]+0x1 */       #   8c: 1b33
.Lbr002:    s32i         a3, a2, 148 /* a3 -> [arg0+0x94] */   #   8e: 326225
            s32i         a4, a2, 144 /* [arg0+0x90]+0x1 -> [arg0+0x90] */ #   91: 426224
            movi         a2, 1 /* 0x00000001 */                #   94: 0c12
            ret           /* 0x00000001 */                     #   96: 0df0

            .literal_position                                  #   98: 00000000
                                                               #   9c: 00000000

# Function @ .irom0.text+0xa0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
.Lfunc002:  addi         sp, sp, -16 /* (local0) */            #   a0: 12c1f0
            l32i         a8, a3, 4 /* [arg1+0x4] */            #   a3: 8813
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   a5: 0911
            l32i         a0, a8, 4 /* [[arg1+0x4]+0x4] */      #   a7: 0818
            movi         a6, sdk_g_ic                          #   a9: 61fbff
            add          a7, a4, a0                            #   ac: 0a74
            l8ui         a5, a7, 3                             #   ae: 520703
            l32i         a6, a6, 28 /* [sdk_g_ic+0x1c] */      #   b1: 6876
            extui        a5, a5, 5, 1                          #   b3: 505504
            beqz         a5, .Lbr007                           #   b6: 169509
            extui        a6, a6, 26, 1                         #   b9: 606a05
            bnez         a6, .Lbr007                           #   bc: 563609
            l8ui         a6, a7, 6                             #   bf: 620706
            l8ui         a5, a7, 7                             #   c2: 520707
            l8ui         a9, a0, 0 /* [[[arg1+0x4]+0x4]] */    #   c5: 920000
            movi         a10, 140 /* 0x0000008c */             #   c8: a2a08c
            and          a9, a9, a10                           #   cb: a09910
            slli         a5, a5, 8                             #   ce: 805511
            or           a5, a5, a6                            #   d1: 605520
            movi         a10, 136 /* 0x00000088 */             #   d4: a2a088
            l8ui         a6, a7, 0                             #   d7: 620700
            bne          a9, a10, .Lbr003                      #   da: a79911
            l8ui         a11, a0, 1 /* [[[arg1+0x4]+0x4]+0x1] */ #   dd: b20001
            extui        a11, a11, 0, 2                        #   e0: b0b014
            addi         a11, a11, -3                          #   e3: b2cbfd
            bnez         a11, .Lbr009                          #   e6: 564b07
            l8ui         a0, a0, 30 /* [[[arg1+0x4]+0x4]+0x1e] */ #   e9: 02001e
            j            .Lbr010                               #   ec: 461c00
.Lbr003:    movi         a0, 16 /* 0x00000010 */               #   ef: 1c00
.Lbr004:    slli         a6, a6, 8                             #   f1: 806611
            l8ui         a9, a7, 2                             #   f4: 920702
            l8ui         a10, a7, 5                            #   f7: a20705
            l8ui         a11, a7, 4                            #   fa: b20704
            slli         a10, a10, 24                          #   fd: 80aa01
            slli         a11, a11, 16                          #  100: 00bb11
            extui        a7, a5, 0, 16                         #  103: 5070f4
            or           a6, a6, a9                            #  106: 906620
            or           a11, a11, a6                          #  109: 60bb20
            addx8        a9, a0, a2                            #  10c: 2090b0
            or           a10, a10, a11                         #  10f: b0aa20
            movi         a11, .Ldata002                        #  112: b1e2ff
            s32i         a9, sp, 0 /* a9 -> [(local0)] */      #  115: 9901
            s32i         a7, a11, 4 /* a7 -> [.Ldata003] */    #  117: 791b
            s32i         a10, a11, 0 /* a10 -> [.Ldata002] */  #  119: a90b
            l32i         a11, a9, 8                            #  11b: b829
            l32i         a9, a9, 12                            #  11d: 9839
            movi         a0, 0 /* 0x00000000 */                #  11f: 0c00
            bltu         a9, a7, .Lbr006                       #  121: 773907
            bne          a9, a7, .Lbr005                       #  124: 779902
            bltu         a11, a10, .Lbr006                     #  127: a73b01
.Lbr005:    movi         a0, 1 /* 0x00000001 */                #  12a: 0c10
.Lbr006:    bnez         a0, .Lbr007                           #  12c: ec30
            l32i         a0, sp, 0 /* [(local0)] */            #  12e: 0801
            l16ui        a11, a3, 22 /* [arg1+0x16] */         #  130: b2130b
            s32i         a10, a0, 8 /* a10 -> [[(local0)]+0x8] */ #  133: a920
            s32i         a7, a0, 12 /* a7 -> [[(local0)]+0xc] */ #  135: 7930
            l32i         a0, a2, 152 /* [arg0+0x98] */         #  137: 022226
            l32i         a6, a8, 4 /* [[arg1+0x4]+0x4] */      #  13a: 6818
            l32i         a5, a0, 4 /* [[arg0+0x98]+0x4] */     #  13c: 5810
            l32i         a0, a0, 8 /* [[arg0+0x98]+0x8] */     #  13e: 0820
            add          a9, a4, a5                            #  140: 5a94
            add          a6, a6, a9                            #  142: 9a66
            add          a0, a0, a5                            #  144: 5a00
            sub          a11, a11, a0                          #  146: 00bbc0
            s32i         a6, a8, 4 /* a6 -> [[arg1+0x4]+0x4] */ #  149: 6918
            movi         a0, 1 /* 0x00000001 */                #  14b: 0c10
            s16i         a11, a3, 22 /* a11 -> [arg1+0x16] */  #  14d: b2530b
            j            .Lbr008                               #  150: 460000
.Lbr007:    movi         a0, 0 /* 0x00000000 */                #  153: 0c00
.Lbr008:    mov          a2, a0                                #  155: 2d00
            l32i         a0, sp, 4 /* [(local1)] */            #  157: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  159: 12c110
            ret                                                #  15c: 0df0
.Lbr009:    l8ui         a0, a0, 24 /* [[[arg1+0x4]+0x4]+0x18] */ #  15e: 020018
.Lbr010:    extui        a0, a0, 0, 4                          #  161: 000034
            j            .Lbr004                               #  164: 46e2ff

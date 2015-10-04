
            .section     .data, "aw", @progbits

            .global      sdk_ccmp
            .type        sdk_ccmp, @object
sdk_ccmp:   .word        0x00000003                            #    0: 03000000
.Ldata001:  .word        0x00000008                            #    4: 08000000

# NOTE: The following is apparently unreferenced code/data
            .word        0x00000008                            #    8: 08000000
            .word        0x00000000                            #    c: 00000000

.Lrel001:   .word        .Lfunc001                             #   10: 04000000
.Lrel002:   .word        .Lfunc002                             #   14: 80000000

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000

# Function @ .irom0.text+0x4
            .balign      4
.Lfunc001:  ssai         8                                     #    4: 004840
            l32i         a5, a2, 144 /* [arg0+0x90] */         #    7: 522224
            l16ui        a6, a3, 22 /* [arg1+0x16] */          #    a: 62130b
            movi         a7, sdk_ccmp                          #    d: 71fcff
            l32i         a9, a3, 4 /* [arg1+0x4] */            #   10: 9813
            l32i         a10, a7, 4 /* [.Ldata001] */          #   12: a817
            l32i         a7, a7, 4 /* [.Ldata001] */           #   14: 7817
            l32i         a8, a9, 4 /* [[arg1+0x4]+0x4] */      #   16: 8819
            add          a6, a6, a7                            #   18: 7a66
            sub          a8, a8, a10                           #   1a: a088c0
            addi         a7, a5, 1 /* [arg0+0x90]+0x1 */       #   1d: 1b75
            s32i         a8, a9, 4 /* a8 -> [[arg1+0x4]+0x4] */ #   1f: 8919
            s16i         a6, a3, 22 /* a6 -> [arg1+0x16] */    #   21: 62530b
            movi         a9, 32 /* 0x00000020 */               #   24: 2c09
            or           a11, a4, a9                           #   26: 90b420
            s32i         a7, a2, 144 /* [arg0+0x90]+0x1 -> [arg0+0x90] */ #   29: 726224
            l32i         a3, a2, 148 /* [arg0+0x94] */         #   2c: 322225
            bgeu         a7, a5, .Lbr001                       #   2f: 57b701
            addi         a3, a3, 1 /* [arg0+0x94]+0x1 */       #   32: 1b33
.Lbr001:    movi         a5, 0 /* 0x00000000 */                #   34: 0c05
            s32i         a3, a2, 148 /* a3 -> [arg0+0x94] */   #   36: 326225
            s8i          a7, a8, 0                             #   39: 724800
            l32i         a6, a2, 148 /* [arg0+0x94] */         #   3c: 622225
            l32i         a10, a2, 144 /* [arg0+0x90] */        #   3f: a22224
            s8i          a5, a8, 2                             #   42: 524802
            s8i          a11, a8, 3                            #   45: b24803
            src          a6, a6, a10                           #   48: a06681
            s8i          a6, a8, 1                             #   4b: 624801
            l32i         a11, a2, 144 /* [arg0+0x90] */        #   4e: b22224
            l32i         a10, a2, 148 /* [arg0+0x94] */        #   51: a22225
            ssai         16                                    #   54: 104040
            src          a10, a10, a11                         #   57: b0aa81
            s8i          a10, a8, 4                            #   5a: a24804
            l32i         a6, a2, 144 /* [arg0+0x90] */         #   5d: 622224
            l32i         a5, a2, 148 /* [arg0+0x94] */         #   60: 522225
            ssai         24                                    #   63: 104840
            src          a5, a5, a6                            #   66: 605581
            s8i          a5, a8, 5                             #   69: 524805
            l32i         a11, a2, 148 /* [arg0+0x94] */        #   6c: b22225
            s8i          a11, a8, 6                            #   6f: b24806
            l32i         a10, a2, 148 /* [arg0+0x94] */        #   72: a22225
            movi         a2, 1 /* 0x00000001 */                #   75: 0c12
            srli         a10, a10, 8                           #   77: a0a841
            s8i          a10, a8, 7                            #   7a: a24807
            ret           /* 0x00000001 */                     #   7d: 0df0

            .balign      4
# Function @ .irom0.text+0x80
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc002:  addi         sp, sp, -16 /* (local0) */            #   80: 12c1f0
            l32i         a8, a3, 4 /* [arg1+0x4] */            #   83: 8813
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   85: 0911
            l32i         a0, a8, 4 /* [[arg1+0x4]+0x4] */      #   87: 0818
            add          a7, a4, a0                            #   89: 0a74
            l8ui         a5, a7, 3                             #   8b: 520703
            movi         a9, 140 /* 0x0000008c */              #   8e: 92a08c
            extui        a5, a5, 5, 1                          #   91: 505504
            beqz         a5, .Lbr006                           #   94: 169508
            l8ui         a5, a7, 6                             #   97: 520706
            l8ui         a11, a7, 7                            #   9a: b20707
            l8ui         a6, a0, 0 /* [[[arg1+0x4]+0x4]] */    #   9d: 620000
            slli         a11, a11, 8                           #   a0: 80bb11
            and          a6, a6, a9                            #   a3: 906610
            or           a11, a11, a5                          #   a6: 50bb20
            l8ui         a5, a7, 4                             #   a9: 520704
            movi         a9, 136 /* 0x00000088 */              #   ac: 92a088
            slli         a5, a5, 16                            #   af: 005511
            bne          a6, a9, .Lbr002                       #   b2: 979611
            l8ui         a10, a0, 1 /* [[[arg1+0x4]+0x4]+0x1] */ #   b5: a20001
            extui        a10, a10, 0, 2                        #   b8: a0a014
            addi         a10, a10, -3                          #   bb: a2cafd
            bnez         a10, .Lbr008                          #   be: 56aa06
            l8ui         a0, a0, 30 /* [[[arg1+0x4]+0x4]+0x1e] */ #   c1: 02001e
            j            .Lbr009                               #   c4: c61900
.Lbr002:    movi         a0, 16 /* 0x00000010 */               #   c7: 1c00
.Lbr003:    l8ui         a9, a7, 0                             #   c9: 920700
            l8ui         a10, a7, 5                            #   cc: a20705
            l8ui         a6, a7, 1                             #   cf: 620701
            slli         a10, a10, 24                          #   d2: 80aa01
            slli         a6, a6, 8                             #   d5: 806611
            or           a6, a6, a9                            #   d8: 906620
            extui        a7, a11, 0, 16                        #   db: b070f4
            addx8        a9, a0, a2                            #   de: 2090b0
            or           a5, a5, a6                            #   e1: 605520
            movi         a0, 0 /* 0x00000000 */                #   e4: 0c00
            s32i         a9, sp, 0 /* a9 -> [(local0)] */      #   e6: 9901
            l32i         a11, a9, 8                            #   e8: b829
            l32i         a9, a9, 12                            #   ea: 9839
            or           a10, a10, a5                          #   ec: 50aa20
            bltu         a9, a7, .Lbr005                       #   ef: 773907
            bne          a9, a7, .Lbr004                       #   f2: 779902
            bltu         a11, a10, .Lbr005                     #   f5: a73b01
.Lbr004:    movi         a0, 1 /* 0x00000001 */                #   f8: 0c10
.Lbr005:    bnez         a0, .Lbr006                           #   fa: ec30
            l32i         a11, sp, 0 /* [(local0)] */           #   fc: b801
            l16ui        a9, a3, 22 /* [arg1+0x16] */          #   fe: 92130b
            s32i         a10, a11, 8 /* a10 -> [[(local0)]+0x8] */ #  101: a92b
            s32i         a7, a11, 12 /* a7 -> [[(local0)]+0xc] */ #  103: 793b
            l32i         a11, a2, 152 /* [arg0+0x98] */        #  105: b22226
            l32i         a5, a8, 4 /* [[arg1+0x4]+0x4] */      #  108: 5818
            l32i         a0, a11, 4 /* [[arg0+0x98]+0x4] */    #  10a: 081b
            l32i         a11, a11, 8 /* [[arg0+0x98]+0x8] */   #  10c: b82b
            add          a6, a4, a0                            #  10e: 0a64
            add          a11, a11, a0                          #  110: 0abb
            add          a5, a5, a6                            #  112: 6a55
            movi         a0, 1 /* 0x00000001 */                #  114: 0c10
            s32i         a5, a8, 4 /* a5 -> [[arg1+0x4]+0x4] */ #  116: 5918
            sub          a9, a9, a11                           #  118: b099c0
            s16i         a9, a3, 22 /* a9 -> [arg1+0x16] */    #  11b: 92530b
            j            .Lbr007                               #  11e: 460000
.Lbr006:    movi         a0, 0 /* 0x00000000 */                #  121: 0c00
.Lbr007:    mov          a2, a0                                #  123: 2d00
            l32i         a0, sp, 4 /* [(local1)] */            #  125: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  127: 12c110
            ret                                                #  12a: 0df0
.Lbr008:    l8ui         a0, a0, 24 /* [[[arg1+0x4]+0x4]+0x18] */ #  12c: 020018
.Lbr009:    extui        a0, a0, 0, 4                          #  12f: 000034
            j            .Lbr003                               #  132: c6e4ff


            .section     .data, "aw", @progbits

            .global      sdk_wep
            .type        sdk_wep, @object
sdk_wep:    .word        0x00000001                            #    0: 01000000
.Ldata001:  .word        0x00000004                            #    4: 04000000

# NOTE: The following is apparently unreferenced code/data
            .word        0x00000004                            #    8: 04000000
            .word        0x00000000                            #    c: 00000000

.Lrel001:   .word        .Lfunc001                             #   10: 04000000
.Lrel002:   .word        .Lfunc002                             #   14: 60000000

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000

# Function @ .irom0.text+0x4
.Lfunc001:  bnez         a3, .Lbr001                           #    4: cc33
            movi         a3, 0 /* 0x00000000 */                #    6: 0c03
            j            .Lbr003                               #    8: 461300
.Lbr001:    l32i         a5, a2, 144 /* [arg0+0x90] */         #    b: 522224
            l16ui        a6, a3, 22 /* [arg1+0x16] */          #    e: 62130b
            movi         a7, sdk_wep                           #   11: 71fbff
            l32i         a8, a3, 4 /* [arg1+0x4] */            #   14: 8813
            l32i         a10, a7, 4 /* [.Ldata001] */          #   16: a817
            l32i         a7, a7, 4 /* [.Ldata001] */           #   18: 7817
            l32i         a9, a8, 4 /* [[arg1+0x4]+0x4] */      #   1a: 9818
            add          a6, a6, a7                            #   1c: 7a66
            sub          a9, a9, a10                           #   1e: a099c0
            l32i         a7, a2, 148 /* [arg0+0x94] */         #   21: 722225
            s32i         a9, a8, 4 /* a9 -> [[arg1+0x4]+0x4] */ #   24: 9918
            s16i         a6, a3, 22 /* a6 -> [arg1+0x16] */    #   26: 62530b
            addi         a8, a5, 1 /* [arg0+0x90]+0x1 */       #   29: 1b85
            bgeu         a8, a5, .Lbr002                       #   2b: 57b801
            addi         a7, a7, 1 /* [arg0+0x94]+0x1 */       #   2e: 1b77
.Lbr002:    movi         a3, 1 /* 0x00000001 */                #   30: 0c13
            s32i         a7, a2, 148 /* a7 -> [arg0+0x94] */   #   32: 726225
            s32i         a8, a2, 144 /* [arg0+0x90]+0x1 -> [arg0+0x90] */ #   35: 826224
            ssai         16                                    #   38: 104040
            src          a6, a7, a8                            #   3b: 806781
            s8i          a6, a9, 2                             #   3e: 624902
            l32i         a5, a2, 144 /* [arg0+0x90] */         #   41: 522224
            l32i         a11, a2, 148 /* [arg0+0x94] */        #   44: b22225
            ssai         8                                     #   47: 004840
            src          a11, a11, a5                          #   4a: 50bb81
            s8i          a11, a9, 1                            #   4d: b24901
            l32i         a10, a2, 144 /* [arg0+0x90] */        #   50: a22224
            s8i          a10, a9, 0                            #   53: a24900
            s8i          a4, a9, 3                             #   56: 424903
.Lbr003:    mov          a2, a3                                #   59: 2d03
            ret                                                #   5b: 0df0

            .balign      4
# Function @ .irom0.text+0x60
.Lfunc002:  l32i         a5, a2, 152 /* [arg0+0x98] */         #   60: 522226
            l32i         a8, a3, 4 /* [arg1+0x4] */            #   63: 8813
            l16ui        a2, a3, 22 /* [arg1+0x16] */          #   65: 22130b
            l32i         a7, a8, 4 /* [[arg1+0x4]+0x4] */      #   68: 7818
            l32i         a6, a5, 4 /* [[arg0+0x98]+0x4] */     #   6a: 6815
            l32i         a5, a5, 8 /* [[arg0+0x98]+0x8] */     #   6c: 5825
            add          a9, a4, a6                            #   6e: 6a94
            add          a7, a7, a9                            #   70: 9a77
            add          a5, a5, a6                            #   72: 6a55
            sub          a2, a2, a5                            #   74: 5022c0
            s32i         a7, a8, 4 /* a7 -> [[arg1+0x4]+0x4] */ #   77: 7918
            s16i         a2, a3, 22 /* a2 -> [arg1+0x16] */    #   79: 22530b
            movi         a2, 1 /* 0x00000001 */                #   7c: 0c12
            ret           /* 0x00000001 */                     #   7e: 0df0

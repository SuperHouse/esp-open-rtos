
            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
            .global      sdk_ieee80211_crypto_attach
            .type        sdk_ieee80211_crypto_attach, @function
sdk_ieee80211_crypto_attach:
            ret           /* arg0 */                           #    0: 0df0

            .balign      4
# Function @ .irom0.text+0x4
            .global      sdk_ieee80211_crypto_available
            .type        sdk_ieee80211_crypto_available, @function
sdk_ieee80211_crypto_available:
            movi         a2, 0 /* 0x00000000 */                #    4: 0c02
            ret           /* 0x00000000 */                     #    6: 0df0

# Function @ .irom0.text+0x8
            .global      sdk_ieee80211_crypto_setkey
            .type        sdk_ieee80211_crypto_setkey, @function
sdk_ieee80211_crypto_setkey:
            movi         a2, 0 /* 0x00000000 */                #    8: 0c02
            ret           /* 0x00000000 */                     #    a: 0df0

            .literal_position                                  #    c: 00000000

# Function @ .irom0.text+0x10
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_ieee80211_crypto_encap
            .type        sdk_ieee80211_crypto_encap, @function
sdk_ieee80211_crypto_encap:
            addi         sp, sp, -16 /* (local0) */            #   10: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   13: 0911
            l32i         a4, a3, 32 /* [arg1+0x20] */          #   15: 4883
            l32i         a0, a2, 136 /* [arg0+0x88] */         #   17: 022222
            l32i         a4, a4, 0 /* [[arg1+0x20]] */         #   1a: 4804
            movi         a2, sdk_g_ic                          #   1c: 21fcff
            bbci         a4, 7, .Lbr003                        #   1f: 776434
            l8ui         a0, a0, 233 /* [[arg0+0x88]+0xe9] */  #   22: 0200e9
            bltui        a0, 2, .Lbr001                        #   25: b62004
            addi         a6, a0, -1 /* [[arg0+0x88]+0xe9]-0x1 */ #   28: 0b60
            j            .Lbr002                               #   2a: 460000
.Lbr001:    mov          a6, a0 /* [[arg0+0x88]+0xe9] */       #   2d: 6d00
.Lbr002:    addx4        a2, a0, a2                            #   2f: 2020a0
            l32i         a2, a2, 0x190                         #   32: 222264
            slli         a4, a6, 6                             #   35: a04611
            l32i         a0, a2, 152                           #   38: 022226
            extui        a4, a4, 0, 8                          #   3b: 404074
            l32i         a0, a0, 16                            #   3e: 0840
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #   40: 2901
            callx0       a0                                    #   42: c00000
            l32i         a4, sp, 0 /* [(local0)] */            #   45: 4801
            l32i         a3, sp, 4 /* [(local1)] */            #   47: 3811
            movi         a0, 0 /* 0x00000000 */                #   49: 0c00
            addi         sp, sp, 16 /* (top of frame) */       #   4b: 12c110
            movnez       a0, a4, a2                            #   4e: 200493
            mov          a2, a0                                #   51: 2d00
            mov          a0, a3 /* [(local1)] */               #   53: 0d03
            ret                                                #   55: 0df0
.Lbr003:    movi         a6, 0 /* 0x00000000 */                #   57: 0c06
            l8ui         a0, a0, 232 /* [[arg0+0x88]+0xe8] */  #   59: 0200e8
            j            .Lbr002                               #   5c: c6f3ff

            .literal_position                                  #   60: 00000000

# Function @ .irom0.text+0x64
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_ieee80211_crypto_decap
            .type        sdk_ieee80211_crypto_decap, @function
sdk_ieee80211_crypto_decap:
            addi         sp, sp, -16 /* (local0) */            #   64: 12c1f0
            l16ui        a5, a3, 22 /* [arg1+0x16] */          #   67: 52130b
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   6a: 0911
            l16ui        a0, a3, 20 /* [arg1+0x14] */          #   6c: 02130a
            movi         a6, sdk_g_ic                          #   6f: 61fcff
            add          a0, a0, a5                            #   72: 5a00
            bltui        a0, 32, .Lbr005                       #   74: b6c020
            l32i         a0, a3, 4 /* [arg1+0x4] */            #   77: 0813
            l32i         a0, a0, 4 /* [[arg1+0x4]+0x4] */      #   79: 0810
            l8ui         a7, a0, 4 /* [[[arg1+0x4]+0x4]+0x4] */ #   7b: 720004
            add          a0, a4, a0                            #   7e: 0a04
            bbci         a7, 0, .Lbr008                        #   80: 076731
            l8ui         a0, a0, 3                             #   83: 020003
            extui        a0, a0, 6, 2                          #   86: 000614
            addi         a0, a0, -1                            #   89: 0b00
            extui        a0, a0, 0, 8                          #   8b: 000074
.Lbr004:    addx4        a2, a0, a6                            #   8e: 6020a0
            l32i         a2, a2, 0x190                         #   91: 222264
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #   94: 2901
            bnez         a2, .Lbr006                           #   96: cc32
.Lbr005:    movi         a2, 0 /* 0x00000000 */                #   98: 0c02
            j            .Lbr007                               #   9a: 060400
.Lbr006:    l32i         a0, a2, 152                           #   9d: 022226
            l32i         a0, a0, 20                            #   a0: 0850
            callx0       a0                                    #   a2: c00000
            mov          a4, a2                                #   a5: 4d02
            l32i         a3, sp, 0 /* [(local0)] */            #   a7: 3801
            movi         a2, 0 /* 0x00000000 */                #   a9: 0c02
            movnez       a2, a3, a4                            #   ab: 402393
.Lbr007:    l32i         a0, sp, 4 /* [(local1)] */            #   ae: 0811
            addi         sp, sp, 16 /* (top of frame) */       #   b0: 12c110
            ret                                                #   b3: 0df0
.Lbr008:    l32i         a0, a2, 136 /* [arg0+0x88] */         #   b5: 022222
            l8ui         a0, a0, 232 /* [[arg0+0x88]+0xe8] */  #   b8: 0200e8
            j            .Lbr004                               #   bb: c6f3ff

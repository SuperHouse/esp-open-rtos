
            .section     .data, "aw", @progbits

.Lrel001:   .word        .irom0.text                           #    0: 00000000
.Lrel002:   .word        .irom0.text                           #    4: 00000000
.Lrel003:   .word        .irom0.text                           #    8: 00000000
.Lrel004:   .word        .irom0.text                           #    c: 00000000
.Lrel005:   .word        .Lfunc002                             #   10: bc000000
.Lrel006:   .word        .Lfunc002                             #   14: bc000000
.Lrel007:   .word        .Lfunc002                             #   18: bc000000

            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
.Lfunc001:  movi         a2, -1 /* 0xffffffff */               #    0: 7cf2
            ret           /* 0xffffffff */                     #    2: 0df0

            .literal_position                                  #    4: 0c000000
                                                               #    8: 00000000
                                                               #    c: 08000000

# Function @ .irom0.text+0x10
            .global      sdk_ieee80211_send_action_register
            .type        sdk_ieee80211_send_action_register, @function
sdk_ieee80211_send_action_register:
            beqi         a2, 3, .Lbr003                        #   10: 26321a
            beqi         a2, 7, .Lbr004                        #   13: 267220
            movi         a5, 127 /* 0x0000007f */              #   16: 52a07f
            bne          a2, a5, .Lbr002                       #   19: 57920d
            bnez         a3, .Lbr002                           #   1c: cca3
            movi         a2, .Lrel004                          #   1e: 21f9ff
.Lbr001:    addx4        a6, a3, a2                            #   21: 2063a0
            s32i         a4, a6, 0                             #   24: 4906
            movi         a2, 0 /* 0x00000000 */                #   26: 0c02
            ret           /* 0x00000000 */                     #   28: 0df0
.Lbr002:    movi         a2, -1 /* 0xffffffff */               #   2a: 7cf2
            ret           /* 0xffffffff */                     #   2c: 0df0
.Lbr003:    bgeui        a3, 2, .Lbr002                        #   2e: f623f8
            movi         a2, .Lrel001                          #   31: 21f5ff
            j            .Lbr001                               #   34: 46faff
.Lbr004:    bnez         a3, .Lbr002                           #   37: 56f3fe
            movi         a2, .Lrel003                          #   3a: 21f4ff
            j            .Lbr001                               #   3d: 06f8ff

            .literal_position                                  #   40: 00000000

# Function @ .irom0.text+0x44
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ieee80211_send_action_unregister
            .type        sdk_ieee80211_send_action_unregister, @function
sdk_ieee80211_send_action_unregister:
            movi         a4, .Lfunc001                         #   44: 41ffff
            addi         sp, sp, -16 /* (local0) */            #   47: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   4a: 0901
            call0        sdk_ieee80211_send_action_register    #   4c: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #   4f: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   51: 12c110
            ret                                                #   54: 0df0

            .literal_position                                  #   58: 00000000
                                                               #   5c: 0c000000
                                                               #   60: 08000000
                                                               #   64: 00000000

# Function @ .irom0.text+0x68
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ieee80211_send_action
            .type        sdk_ieee80211_send_action, @function
sdk_ieee80211_send_action:
            addi         sp, sp, -16 /* (local0) */            #   68: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   6b: 0901
            movi         a0, .Lfunc001                         #   6d: 01faff
            beqi         a3, 3, .Lbr005                        #   70: 263315
            beqi         a3, 7, .Lbr009                        #   73: 267326
            movi         a6, 127 /* 0x0000007f */              #   76: 62a07f
            bne          a3, a6, .Lbr006                       #   79: 67930f
            bnez         a4, .Lbr008                           #   7c: dc84
            movi         a7, .Lrel004                          #   7e: 71f7ff
            addx4        a7, a4, a7                            #   81: 7074a0
            l32i         a7, a7, 0                             #   84: 7807
            j            .Lbr007                               #   86: 060100
.Lbr005:    bltui        a4, 2, .Lbr011                        #   89: b62422
.Lbr006:    mov          a7, a0 /* .Lfunc001 */                #   8c: 7d00
.Lbr007:    callx0       a7                                    #   8e: c00700
            l32i         a0, sp, 0 /* [(local0)] */            #   91: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   93: 12c110
            ret                                                #   96: 0df0
.Lbr008:    mov          a7, a0 /* .Lfunc001 */                #   98: 7d00
            j            .Lbr007                               #   9a: 06fcff
.Lbr009:    bnez         a4, .Lbr010                           #   9d: cc94
            movi         a7, .Lrel003                          #   9f: 71f0ff
            addx4        a7, a4, a7                            #   a2: 7074a0
            l32i         a7, a7, 0                             #   a5: 7807
            j            .Lbr007                               #   a7: c6f8ff
.Lbr010:    mov          a7, a0 /* .Lfunc001 */                #   aa: 7d00
            j            .Lbr007                               #   ac: 86f7ff
.Lbr011:    movi         a7, .Lrel001                          #   af: 71edff
            addx4        a7, a4, a7                            #   b2: 7074a0
            l32i         a7, a7, 0                             #   b5: 7807
            j            .Lbr007                               #   b7: c6f4ff

            .balign      4
# Function @ .irom0.text+0xbc
.Lfunc002:  movi         a2, -1 /* 0xffffffff */               #   bc: 7cf2
            ret           /* 0xffffffff */                     #   be: 0df0

            .literal_position                                  #   c0: 18000000
                                                               #   c4: 10000000
                                                               #   c8: 14000000

# Function @ .irom0.text+0xcc
            .global      sdk_ieee80211_recv_action_register
            .type        sdk_ieee80211_recv_action_register, @function
sdk_ieee80211_recv_action_register:
            beqi         a2, 3, .Lbr014                        #   cc: 26321a
            beqi         a2, 7, .Lbr015                        #   cf: 267220
            movi         a5, 127 /* 0x0000007f */              #   d2: 52a07f
            bne          a2, a5, .Lbr013                       #   d5: 57920d
            bnez         a3, .Lbr013                           #   d8: cca3
            movi         a2, .Lrel007                          #   da: 21f9ff
.Lbr012:    addx4        a6, a3, a2                            #   dd: 2063a0
            s32i         a4, a6, 0                             #   e0: 4906
            movi         a2, 0 /* 0x00000000 */                #   e2: 0c02
            ret           /* 0x00000000 */                     #   e4: 0df0
.Lbr013:    movi         a2, -1 /* 0xffffffff */               #   e6: 7cf2
            ret           /* 0xffffffff */                     #   e8: 0df0
.Lbr014:    bnez         a3, .Lbr013                           #   ea: 5683ff
            movi         a2, .Lrel005                          #   ed: 21f5ff
            j            .Lbr012                               #   f0: 46faff
.Lbr015:    bnez         a3, .Lbr013                           #   f3: 56f3fe
            movi         a2, .Lrel006                          #   f6: 21f4ff
            j            .Lbr012                               #   f9: 06f8ff

            .literal_position                                  #   fc: bc000000

# Function @ .irom0.text+0x100
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ieee80211_recv_action_unregister
            .type        sdk_ieee80211_recv_action_unregister, @function
sdk_ieee80211_recv_action_unregister:
            movi         a4, .Lfunc002                         #  100: 41ffff
            addi         sp, sp, -16 /* (local0) */            #  103: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  106: 0901
            call0        sdk_ieee80211_recv_action_register    #  108: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #  10b: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  10d: 12c110
            ret                                                #  110: 0df0

            .literal_position                                  #  114: bc000000
                                                               #  118: 18000000
                                                               #  11c: 14000000
                                                               #  120: 10000000

# Function @ .irom0.text+0x124
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_ieee80211_recv_action
            .type        sdk_ieee80211_recv_action, @function
sdk_ieee80211_recv_action:
            addi         sp, sp, -16 /* (local0) */            #  124: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  127: 0901
            l8ui         a0, a4, 0 /* [arg2] */                #  129: 020400
            movi         a8, .Lfunc002                         #  12c: 81faff
            beqi         a0, 3, .Lbr016                        #  12f: 26301a
            beqi         a0, 7, .Lbr020                        #  132: 26702b
            movi         a6, 127 /* 0x0000007f */              #  135: 62a07f
            bne          a0, a6, .Lbr017                       #  138: 679016
            l8ui         a0, a4, 1 /* [arg2+0x1] */            #  13b: 020401
            mov          a7, a8 /* .Lfunc002 */                #  13e: 7d08
            bnez         a0, .Lbr019                           #  140: dca0
            movi         a7, .Lrel007                          #  142: 71f5ff
            addx4        a7, a0, a7                            #  145: 7070a0
            l32i         a7, a7, 0                             #  148: 7807
            j            .Lbr018                               #  14a: 860100
.Lbr016:    l8ui         a0, a4, 1 /* [arg2+0x1] */            #  14d: 020401
            beqz         a0, .Lbr022                           #  150: ac20
.Lbr017:    mov          a7, a8 /* .Lfunc002 */                #  152: 7d08
.Lbr018:    callx0       a7                                    #  154: c00700
            l32i         a0, sp, 0 /* [(local0)] */            #  157: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  159: 12c110
            ret                                                #  15c: 0df0
.Lbr019:    j            .Lbr018                               #  15e: 86fcff
.Lbr020:    l8ui         a0, a4, 1 /* [arg2+0x1] */            #  161: 020401
            mov          a7, a8 /* .Lfunc002 */                #  164: 7d08
            bnez         a0, .Lbr021                           #  166: cc90
            movi         a7, .Lrel006                          #  168: 71edff
            addx4        a7, a0, a7                            #  16b: 7070a0
            l32i         a7, a7, 0                             #  16e: 7807
            j            .Lbr018                               #  170: 06f8ff
.Lbr021:    j            .Lbr018                               #  173: 46f7ff
.Lbr022:    movi         a7, .Lrel005                          #  176: 71eaff
            addx4        a7, a0, a7                            #  179: 7070a0
            l32i         a7, a7, 0                             #  17c: 7807
            j            .Lbr018                               #  17e: 86f4ff

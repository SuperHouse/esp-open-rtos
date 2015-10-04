
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000
                                                               #    8: 00000000
                                                               #    c: 00000000
                                                               #   10: 00000000
                                                               #   14: 00000000
                                                               #   18: 00000000

# Function @ .irom0.text+0x1c
# Local variables/stack:
#     (local0):  word      @ -0x80
#     (local1):  word[7]   @ -0x7c
#     (local2):  word      @ -0x60
#     (local3):  word[7]   @ -0x5c
#     (local4):  word      @ -0x40
#     (local5):  word      @ -0x3c
#     (local6):  word      @ -0x38
#     (local7):  word      @ -0x34
#     (local8):  word      @ -0x30
#     (local9):  word[3]   @ -0x2c
#     (local10): word      @ -0x20
#     (local11): word[7]   @ -0x1c
            .balign      4
            .global      hmac_md5_vector
            .type        hmac_md5_vector, @function
hmac_md5_vector:
            movi         a8, 208 /* 0x000000d0 */              #   1c: 82a0d0
            sub          sp, sp, a8 /* (FP)-0xd0 */            #   1f: 8011c0
            s32i         a3, sp, 180 /* arg1 -> [(local11)] */ #   22: 32612d
            s32i         a2, sp, 176 /* arg0 -> [(local10)] */ #   25: 22612c
            s32i         a0, sp, 148 /* a0 -> [(local5)] */    #   28: 026125
            s32i         a13, sp, 156 /* a13 -> [(local7)] */  #   2b: d26127
            s32i         a12, sp, 152 /* a12 -> [(local6)] */  #   2e: c26126
            s32i         a14, sp, 160 /* a14 -> [(local8)] */  #   31: e26128
            mov          a12, a5 /* arg3 */                    #   34: cd05
            mov          a14, a4 /* arg2 */                    #   36: ed04
            mov          a13, a6 /* arg4 */                    #   38: dd06
            movi         a0, 180 /* 0x000000b4 */              #   3a: 02a0b4
            add          a0, sp, a0 /* (local11) */            #   3d: 0a01
            movi         a6, 176 /* 0x000000b0 */              #   3f: 62a0b0
            add          a6, sp, a6 /* (local10) */            #   42: 6a61
            bltui        a4, 6, .Lbr001                        #   44: b66402
            j            .Lbr006                               #   47: 062500
.Lbr001:    s32i         a7, sp, 144 /* arg5 -> [(local4)] */  #   4a: 726124
            movi         a2, 64 /* 0x00000040 */               #   4d: 4c02
            bgeu         a2, a3, .Lbr002                       #   4f: 37b218
            mov          a3, a6 /* (local10) */                #   52: 3d06
            movi         a2, 1 /* 0x00000001 */                #   54: 0c12
            mov          a5, sp /* (FP)-0xd0 */                #   56: 5d01
            mov          a4, a0 /* (local11) */                #   58: 4d00
            call0        md5_vector                            #   5a: 01e9ffc0
                                                               #   5e: 0000
            bnez         a2, .Lbr006                           #   60: 56b207
            s32i         sp, sp, 176 /* (FP)-0xd0 -> [(local10)] */ #   63: 12612c
            movi         a6, 16 /* 0x00000010 */               #   66: 1c06
            s32i         a6, sp, 180 /* 0x00000010 -> [(local11)] */ #   68: 62612d
.Lbr002:    addi         a2, sp, 16 /* (FP)-0xc0 */            #   6b: 22c110
            movi         a3, 0 /* 0x00000000 */                #   6e: 0c03
            movi         a4, 64 /* 0x00000040 */               #   70: 4c04
            call0        memset                                #   72: 01e4ffc0
                                                               #   76: 0000
            l32i         a3, sp, 176 /* [(local10)] */         #   78: 32212c
            l32i         a4, sp, 180 /* [(local11)] */         #   7b: 42212d
            addi         a2, sp, 16 /* (FP)-0xc0 */            #   7e: 22c110
            s32i         a14, sp, 164 /* arg2 -> [(local9)] */ #   81: e26129
            call0        memcpy                                #   84: 01e1ffc0
                                                               #   88: 0000
            l32i         a4, sp, 164 /* [(local9)] */          #   8a: 422129
            addi         a0, sp, 16 /* (FP)-0xc0 */            #   8d: 02c110
            addi         a14, sp, 80 /* (local0) */            #   90: e2c150
            movi         a2, 54 /* 0x00000036 */               #   93: 3c62
            movi         a6, 64 /* 0x00000040 */               #   95: 4c06
            s32i         a6, sp, 112 /* 0x00000040 -> [(local2)] */ #   97: 62611c
            addi         a6, sp, 16 /* (FP)-0xc0 */            #   9a: 62c110
            s32i         a6, sp, 80 /* (FP)-0xc0 -> [(local0)] */ #   9d: 626114
.Lbr003:    l8ui         a5, a0, 0                             #   a0: 520000
            xor          a5, a5, a2                            #   a3: 205530
            s8i          a5, a0, 0                             #   a6: 524000
            addi         a0, a0, 1                             #   a9: 1b00
            bne          a0, a14, .Lbr003                      #   ab: e790f1
            beqz         a4, .Lbr005                           #   ae: 9ca4
            addi         a0, sp, 112 /* (local2) */            #   b0: 02c170
            addi         a2, sp, 80 /* (local0) */             #   b3: 22c150
            addx4        a3, a4, a12                           #   b6: c034a0
.Lbr004:    l32i         a7, a13, 0                            #   b9: 780d
            l32i         a8, a12, 0                            #   bb: 880c
            addi         a13, a13, 4                           #   bd: 4bdd
            addi         a12, a12, 4                           #   bf: 4bcc
            s32i         a8, a2, 4                             #   c1: 8912
            s32i         a7, a0, 4                             #   c3: 7910
            addi         a2, a2, 4                             #   c5: 4b22
            addi         a0, a0, 4                             #   c7: 4b00
            bne          a12, a3, .Lbr004                      #   c9: 379cec
.Lbr005:    addi         a3, sp, 80 /* (local0) */             #   cc: 32c150
            addi         a2, a4, 1 /* [(local9)]+0x1 */        #   cf: 1b24
            l32i         a5, sp, 144 /* [(local4)] */          #   d1: 522124
            addi         a4, sp, 112 /* (local2) */            #   d4: 42c170
            call0        md5_vector                            #   d7: 01cdffc0
                                                               #   db: 0000
            beqz         a2, .Lbr007                           #   dd: 8c32
.Lbr006:    movi         a2, -1 /* 0xffffffff */               #   df: 7cf2
            j            .Lbr009                               #   e1: 861400
.Lbr007:    addi         a2, sp, 16 /* (FP)-0xc0 */            #   e4: 22c110
            movi         a3, 0 /* 0x00000000 */                #   e7: 0c03
            movi         a4, 64 /* 0x00000040 */               #   e9: 4c04
            call0        memset                                #   eb: 01c9ffc0
                                                               #   ef: 0000
            l32i         a3, sp, 176 /* [(local10)] */         #   f1: 32212c
            l32i         a4, sp, 180 /* [(local11)] */         #   f4: 42212d
            addi         a2, sp, 16 /* (FP)-0xc0 */            #   f7: 22c110
            call0        memcpy                                #   fa: 01c6ffc0
                                                               #   fe: 0000
            addi         a0, sp, 16 /* (FP)-0xc0 */            #  100: 02c110
            movi         a2, 92 /* 0x0000005c */               #  103: 5cc2
.Lbr008:    l8ui         a5, a0, 0                             #  105: 520000
            xor          a5, a5, a2                            #  108: 205530
            s8i          a5, a0, 0                             #  10b: 524000
            addi         a0, a0, 1                             #  10e: 1b00
            bne          a0, a14, .Lbr008                      #  110: e790f1
            movi         a2, 2 /* 0x00000002 */                #  113: 0c22
            addi         a3, sp, 80 /* (local0) */             #  115: 32c150
            addi         a4, sp, 112 /* (local2) */            #  118: 42c170
            movi         a6, 16 /* 0x00000010 */               #  11b: 1c06
            l32i         a5, sp, 144 /* [(local4)] */          #  11d: 522124
            movi         a7, 64 /* 0x00000040 */               #  120: 4c07
            addi         a8, sp, 16 /* (FP)-0xc0 */            #  122: 82c110
            s32i         a8, sp, 80 /* (FP)-0xc0 -> [(local0)] */ #  125: 826114
            s32i         a7, sp, 112 /* 0x00000040 -> [(local2)] */ #  128: 72611c
            s32i         a5, sp, 84 /* [(local4)] -> [(local1)] */ #  12b: 526115
            s32i         a6, sp, 116 /* 0x00000010 -> [(local3)] */ #  12e: 62611d
            call0        md5_vector                            #  131: 01b9ffc0
                                                               #  135: 0000
.Lbr009:    l32i         a12, sp, 152 /* [(local6)] */         #  137: c22126
            l32i         a13, sp, 156 /* [(local7)] */         #  13a: d22127
            l32i         a14, sp, 160 /* [(local8)] */         #  13d: e22128
            movi         a3, 208 /* 0x000000d0 */              #  140: 32a0d0
            l32i         a0, sp, 148 /* [(local5)] */          #  143: 022125
            add          sp, sp, a3 /* (top of frame) */       #  146: 3a11
            ret                                                #  148: 0df0

            .balign      4
# Function @ .irom0.text+0x14c
# Local variables/stack:
#     (local0):  word[6]   @ -0x30
#     (local1):  word      @ -0x18
#     (local2):  word[5]   @ -0x14
            .balign      4
            .global      hmac_md5
            .type        hmac_md5, @function
hmac_md5:   mov          a7, a6 /* arg4 */                     #  14c: 7d06
            mov          a9, a5 /* arg3 */                     #  14e: 9d05
            addi         sp, sp, -48 /* (local0) */            #  150: 12c1d0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  153: 0901
            s32i         a4, sp, 24 /* arg2 -> [(local1)] */   #  155: 4961
            addi         a5, sp, 24 /* (local1) */             #  157: 52c118
            addi         a6, sp, 28 /* (local2) */             #  15a: 62c11c
            s32i         a9, sp, 28 /* arg3 -> [(local2)] */   #  15d: 9971
            movi         a4, 1 /* 0x00000001 */                #  15f: 0c14
            call0        hmac_md5_vector                       #  161: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #  164: 0801
            addi         sp, sp, 48 /* (top of frame) */       #  166: 12c130
            ret                                                #  169: 0df0

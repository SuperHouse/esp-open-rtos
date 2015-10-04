
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000
                                                               #    8: 00000000
                                                               #    c: 00000000
                                                               #   10: 00000000
                                                               #   14: 00000000
                                                               #   18: 00000000
                                                               #   1c: 00000000
                                                               #   20: 00000000

# Function @ .irom0.text+0x24
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
#     (local9):  word      @ -0xc
#     (local10): word      @ -0x8
#     (local11): word      @ -0x4
            .balign      4
            .global      sdk_aes_wrap
            .type        sdk_aes_wrap, @function
sdk_aes_wrap:
            addi         sp, sp, -64 /* (FP)-0x40 */           #   24: 12c1c0
            s32i         a15, sp, 32 /* a15 -> [(local4)] */   #   27: f981
            s32i         a0, sp, 16 /* a0 -> [(local0)] */     #   29: 0941
            s32i         a12, sp, 20 /* a12 -> [(local1)] */   #   2b: c951
            s32i         a13, sp, 24 /* a13 -> [(local2)] */   #   2d: d961
            s32i         a14, sp, 28 /* a14 -> [(local3)] */   #   2f: e971
            s32i         a3, sp, 48 /* arg1 -> [(local8)] */   #   31: 39c1
            mov          a14, a5 /* arg3 */                    #   33: ed05
            movi         a3, 166 /* 0x000000a6 */              #   35: 32a0a6
            mov          a13, a2 /* arg0 */                    #   38: dd02
            mov          a12, a4 /* arg2 */                    #   3a: cd04
            mov          a2, a5 /* arg3 */                     #   3c: 2d05
            movi         a4, 8 /* 0x00000008 */                #   3e: 0c84
            call0        memset                                #   40: 01f0ffc0
                                                               #   44: 0000
            mov          a3, a12 /* arg2 */                    #   46: 3d0c
            l32i         a4, sp, 48 /* [(local8)] */           #   48: 48c1
            addi         a2, a14, 8 /* arg3+0x8 */             #   4a: 8b2e
            s32i         a2, sp, 40 /* arg3+0x8 -> [(local6)] */ #   4c: 29a1
            slli         a4, a4, 3                             #   4e: d04411
            call0        memcpy                                #   51: 01ecffc0
                                                               #   55: 0000
            mov          a2, a13 /* arg0 */                    #   57: 2d0d
            movi         a3, 16 /* 0x00000010 */               #   59: 1c03
            call0        sdk_aes_encrypt_init                  #   5b: 01ebffc0
                                                               #   5f: 0000
            bnez         a2, .Lbr001                           #   61: cc32
            movi         a2, -1 /* 0xffffffff */               #   63: 7cf2
            j            .Lbr005                               #   65: c62200
.Lbr001:    addi         a15, sp, 8 /* (FP)-0x38 */            #   68: 8bf1
            s32i         a2, sp, 56 /* a2 -> [(local10)] */    #   6a: 29e1
            l32i         a6, sp, 48 /* [(local8)] */           #   6c: 68c1
            movi         a5, 0 /* 0x00000000 */                #   6e: 0c05
            movi         a7, 0 /* 0x00000000 */                #   70: 0c07
            s32i         a7, sp, 52 /* 0x00000000 -> [(local9)] */ #   72: 79d1
            s32i         a5, sp, 44 /* 0x00000000 -> [(local7)] */ #   74: 59b1
            addi         a6, a6, 1 /* [(local8)]+0x1 */        #   76: 1b66
            s32i         a6, sp, 36 /* [(local8)]+0x1 -> [(local5)] */ #   78: 6991
.Lbr002:    l32i         a8, sp, 48 /* [(local8)] */           #   7a: 88c1
            l32i         a12, sp, 40 /* [(local6)] */          #   7c: c8a1
            blti         a8, 1, .Lbr004                        #   7e: a61857
            l32i         a9, sp, 52 /* [(local9)] */           #   81: 98d1
            l32i         a10, sp, 36 /* [(local5)] */          #   83: a891
            addi         a13, a9, 1 /* [(local9)]+0x1 */       #   85: 1bd9
            add          a9, a9, a10                           #   87: aa99
            s32i         a9, sp, 60 /* a9 -> [(local11)] */    #   89: 99f1
.Lbr003:    mov          a2, sp /* (FP)-0x40 */                #   8b: 2d01
            mov          a3, a14 /* arg3 */                    #   8d: 3d0e
            movi         a4, 8 /* 0x00000008 */                #   8f: 0c84
            call0        memcpy                                #   91: 01deffc0
                                                               #   95: 0000
            mov          a2, a15 /* (FP)-0x38 */               #   97: 2d0f
            mov          a3, a12                               #   99: 3d0c
            movi         a4, 8 /* 0x00000008 */                #   9b: 0c84
            call0        memcpy                                #   9d: 01dcffc0
                                                               #   a1: 0000
            l32i         a2, sp, 56 /* [(local10)] */          #   a3: 28e1
            mov          a3, sp /* (FP)-0x40 */                #   a5: 3d01
            mov          a4, sp /* (FP)-0x40 */                #   a7: 4d01
            call0        sdk_aes_encrypt                       #   a9: 01daffc0
                                                               #   ad: 0000
            mov          a2, a14 /* arg3 */                    #   af: 2d0e
            mov          a3, sp /* (FP)-0x40 */                #   b1: 3d01
            movi         a4, 8 /* 0x00000008 */                #   b3: 0c84
            call0        memcpy                                #   b5: 01d8ffc0
                                                               #   b9: 0000
            mov          a2, a12                               #   bb: 2d0c
            mov          a3, a15 /* (FP)-0x38 */               #   bd: 3d0f
            l8ui         a11, a14, 7 /* [arg3+0x7] */          #   bf: b20e07
            movi         a4, 8 /* 0x00000008 */                #   c2: 0c84
            xor          a11, a13, a11                         #   c4: b0bd30
            s8i          a11, a14, 7 /* a11 -> [arg3+0x7] */   #   c7: b24e07
            call0        memcpy                                #   ca: 01d4ffc0
                                                               #   ce: 0000
            addi         a12, a12, 8                           #   d0: 8bcc
            l32i         a0, sp, 60 /* [(local11)] */          #   d2: 08f1
            addi         a13, a13, 1                           #   d4: 1bdd
            bne          a13, a0, .Lbr003                      #   d6: 079db1
.Lbr004:    l32i         a4, sp, 48 /* [(local8)] */           #   d9: 48c1
            l32i         a2, sp, 44 /* [(local7)] */           #   db: 28b1
            l32i         a3, sp, 52 /* [(local9)] */           #   dd: 38d1
            addi         a2, a2, 1 /* [(local7)]+0x1 */        #   df: 1b22
            s32i         a2, sp, 44 /* [(local7)]+0x1 -> [(local7)] */ #   e1: 29b1
            add          a3, a3, a4                            #   e3: 4a33
            s32i         a3, sp, 52 /* a3 -> [(local9)] */     #   e5: 39d1
            bnei         a2, 6, .Lbr002                        #   e7: 66628f
            l32i         a2, sp, 56 /* [(local10)] */          #   ea: 28e1
            call0        sdk_aes_encrypt_deinit                #   ec: 01cdffc0
                                                               #   f0: 0000
            movi         a2, 0 /* 0x00000000 */                #   f2: 0c02
.Lbr005:    l32i         a12, sp, 20 /* [(local1)] */          #   f4: c851
            l32i         a13, sp, 24 /* [(local2)] */          #   f6: d861
            l32i         a14, sp, 28 /* [(local3)] */          #   f8: e871
            l32i         a15, sp, 32 /* [(local4)] */          #   fa: f881
            l32i         a0, sp, 16 /* [(local0)] */           #   fc: 0841
            addi         sp, sp, 64 /* (top of frame) */       #   fe: 12c140
            ret                                                #  101: 0df0

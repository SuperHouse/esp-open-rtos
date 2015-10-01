
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000
                                                               #    8: 00000000
                                                               #    c: 00000000
                                                               #   10: 00000000

# Function @ .irom0.text+0x14
# Local variables/stack:
#     (local0):  word      @ -0x90
#     (local1):  word      @ -0x8c
#     (local2):  word      @ -0x88
#     (local3):  word      @ -0x84
#     (local4):  byte      @ -0x80
#     (local5):  byte      @ -0x7f
#     (local6):  byte      @ -0x7e
#     (local7):  byte[77]  @ -0x7d
#     (local8):  word      @ -0x30
#     (local9):  word      @ -0x2c
#     (local10): word      @ -0x28
#     (local11): word      @ -0x24
#     (local12): word      @ -0x20
#     (local13): word      @ -0x1c
#     (local14): word      @ -0x18
#     (local15): word      @ -0x14
#     (local16): word[4]   @ -0x10
.Lfunc001:  movi         a8, 144 /* 0x00000090 */              #   14: 82a090
            sub          sp, sp, a8 /* (local0) */             #   17: 8011c0
            s32i         a5, sp, 124 /* arg3 -> [(local15)] */ #   1a: 52611f
            s32i         a7, sp, 96 /* arg5 -> [(local8)] */   #   1d: 726118
            s32i         a0, sp, 100 /* a0 -> [(local9)] */    #   20: 026119
            s32i         a3, sp, 128 /* arg1 -> [(local16)] */ #   23: 326120
            s32i         a15, sp, 116 /* a15 -> [(local13)] */ #   26: f2611d
            s32i         a14, sp, 112 /* a14 -> [(local12)] */ #   29: e2611c
            s32i         a12, sp, 104 /* a12 -> [(local10)] */ #   2c: c2611a
            s32i         a13, sp, 108 /* a13 -> [(local11)] */ #   2f: d2611b
            mov          a12, a6 /* arg4 */                    #   32: cd06
            mov          a13, a4 /* arg2 */                    #   34: dd04
            mov          a14, a2 /* arg0 */                    #   36: ed02
            l32i         a15, sp, 128 /* [(local16)] */        #   38: f22120
            call0        strlen                                #   3b: 01f1ffc0
                                                               #   3f: 0000
            s32i         a15, sp, 0 /* [(local16)] -> [(local0)] */ #   41: f901
            s32i         a13, sp, 8 /* arg2 -> [(local2)] */   #   43: d921
            addi         a6, sp, 8 /* (local2) */              #   45: 8b61
            addi         a7, sp, 32 /* (FP)-0x70 */            #   47: 72c120
            s8i          a12, sp, 19 /* arg4 -> [(local7)] */  #   4a: c24113
            extui        a5, a12, 24, 8                        #   4d: c05875
            extui        a4, a12, 16, 16                       #   50: c040f5
            srli         a3, a12, 8                            #   53: c03841
            movi         a0, 4 /* 0x00000004 */                #   56: 0c40
            s32i         a0, sp, 12 /* 0x00000004 -> [(local3)] */ #   58: 0931
            s8i          a3, sp, 18 /* a3 -> [(local6)] */     #   5a: 324112
            s8i          a4, sp, 17 /* a4 -> [(local5)] */     #   5d: 424111
            s8i          a5, sp, 16 /* a5 -> [(local4)] */     #   60: 524110
            movi         a4, 2 /* 0x00000002 */                #   63: 0c24
            mov          a5, sp /* (local0) */                 #   65: 5d01
            mov          a12, a2                               #   67: cd02
            addi         a2, sp, 16 /* (local4) */             #   69: 22c110
            mov          a3, a12                               #   6c: 3d0c
            s32i         a2, sp, 4 /* (local4) -> [(local1)] */ #   6e: 2911
            mov          a2, a14 /* arg0 */                    #   70: 2d0e
            call0        sdk_hmac_sha1_vector                  #   72: 01e4ffc0
                                                               #   76: 0000
            bnez         a2, .Lbr005                           #   78: 569207
            addi         a3, sp, 32 /* (FP)-0x70 */            #   7b: 32c120
            movi         a4, 20 /* 0x00000014 */               #   7e: 1c44
            l32i         a15, sp, 96 /* [(local8)] */          #   80: f22118
            s32i         a12, sp, 120 /* a12 -> [(local14)] */ #   83: c2611e
            mov          a2, a15 /* [(local8)] */              #   86: 2d0f
            call0        memcpy                                #   88: 01e0ffc0
                                                               #   8c: 0000
            l32i         a6, sp, 124 /* [(local15)] */         #   8e: 62211f
            blti         a6, 2, .Lbr003                        #   91: a62648
            addi         a12, a15, 20 /* [(local8)]+0x14 */    #   94: c2cf14
            movi         a13, 1 /* 0x00000001 */               #   97: 0c1d
.Lbr001:    mov          a2, a14 /* arg0 */                    #   99: 2d0e
            l32i         a3, sp, 120 /* [(local14)] */         #   9b: 32211e
            addi         a4, sp, 32 /* (FP)-0x70 */            #   9e: 42c120
            movi         a5, 20 /* 0x00000014 */               #   a1: 1c45
            addi         a6, sp, 64 /* (FP)-0x50 */            #   a3: 62c140
            call0        sdk_hmac_sha1                         #   a6: 01d9ffc0
                                                               #   aa: 0000
            bnez         a2, .Lbr005                           #   ac: 565204
            addi         a2, sp, 32 /* (FP)-0x70 */            #   af: 22c120
            addi         a3, sp, 64 /* (FP)-0x50 */            #   b2: 32c140
            movi         a4, 20 /* 0x00000014 */               #   b5: 1c44
            call0        memcpy                                #   b7: 01d6ffc0
                                                               #   bb: 0000
            mov          a2, a15 /* [(local8)] */              #   bd: 2d0f
            addi         a0, sp, 64 /* (FP)-0x50 */            #   bf: 02c140
            l32i         a9, sp, 124 /* [(local15)] */         #   c2: 92211f
            addi         a13, a13, 1                           #   c5: 1bdd
.Lbr002:    l8ui         a7, a2, 0                             #   c7: 720200
            l8ui         a8, a0, 0                             #   ca: 820000
            addi         a0, a0, 1                             #   cd: 1b00
            xor          a7, a7, a8                            #   cf: 807730
            s8i          a7, a2, 0                             #   d2: 724200
            addi         a2, a2, 1                             #   d5: 1b22
            bne          a2, a12, .Lbr002                      #   d7: c792ec
            bne          a9, a13, .Lbr001                      #   da: d799bb
.Lbr003:    movi         a2, 0 /* 0x00000000 */                #   dd: 0c02
.Lbr004:    l32i         a12, sp, 104 /* [(local10)] */        #   df: c2211a
            l32i         a13, sp, 108 /* [(local11)] */        #   e2: d2211b
            l32i         a14, sp, 112 /* [(local12)] */        #   e5: e2211c
            l32i         a15, sp, 116 /* [(local13)] */        #   e8: f2211d
            movi         a3, 144 /* 0x00000090 */              #   eb: 32a090
            l32i         a0, sp, 100 /* [(local9)] */          #   ee: 022119
            add          sp, sp, a3 /* (top of frame) */       #   f1: 3a11
            ret                                                #   f3: 0df0
.Lbr005:    movi         a2, -1 /* 0xffffffff */               #   f5: 7cf2
            j            .Lbr004                               #   f7: 06f9ff

            .literal_position                                  #   fc: 00000000

# Function @ .irom0.text+0x100
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
            .global      sdk_pbkdf2_sha1
            .type        sdk_pbkdf2_sha1, @function
sdk_pbkdf2_sha1:
            addi         sp, sp, -80 /* (FP)-0x50 */           #  100: 12c1b0
            s32i         a14, sp, 44 /* a14 -> [(local3)] */   #  103: e9b1
            s32i         a0, sp, 32 /* a0 -> [(local0)] */     #  105: 0981
            s32i         a2, sp, 52 /* arg0 -> [(local5)] */   #  107: 29d1
            s32i         a3, sp, 56 /* arg1 -> [(local6)] */   #  109: 39e1
            s32i         a4, sp, 60 /* arg2 -> [(local7)] */   #  10b: 49f1
            s32i         a5, sp, 64 /* arg3 -> [(local8)] */   #  10d: 526110
            s32i         a15, sp, 48 /* a15 -> [(local4)] */   #  110: f9c1
            s32i         a13, sp, 40 /* a13 -> [(local2)] */   #  112: d9a1
            s32i         a12, sp, 36 /* a12 -> [(local1)] */   #  114: c991
            mov          a13, a6 /* arg4 */                    #  116: dd06
            mov          a12, a7 /* arg5 */                    #  118: cd07
            beqz         a7, .Lbr009                           #  11a: bc67
            movi         a15, 0 /* 0x00000000 */               #  11c: 0c0f
.Lbr006:    l32i         a2, sp, 52 /* [(local5)] */           #  11e: 28d1
            l32i         a3, sp, 56 /* [(local6)] */           #  120: 38e1
            l32i         a4, sp, 60 /* [(local7)] */           #  122: 48f1
            l32i         a5, sp, 64 /* [(local8)] */           #  124: 522110
            mov          a7, sp /* (FP)-0x50 */                #  127: 7d01
            addi         a15, a15, 1                           #  129: 1bff
            mov          a6, a15                               #  12b: 6d0f
            call0        .Lfunc001                             #  12d: 45eeff
            beqz         a2, .Lbr007                           #  130: 8c32
            movi         a2, -1 /* 0xffffffff */               #  132: 7cf2
            j            .Lbr010                               #  134: 860700
.Lbr007:    movi         a2, 20 /* 0x00000014 */               #  137: 1c42
            mov          a14, a2 /* 0x00000014 */              #  139: ed02
            bltu         a2, a12, .Lbr008                      #  13b: c73201
            mov          a14, a12                              #  13e: ed0c
.Lbr008:    mov          a2, a13                               #  140: 2d0d
            mov          a3, sp /* (FP)-0x50 */                #  142: 3d01
            mov          a4, a14                               #  144: 4d0e
            call0        memcpy                                #  146: 01edffc0
                                                               #  14a: 0000
            add          a13, a13, a14                         #  14c: eadd
            sub          a12, a12, a14                         #  14e: e0ccc0
            bnez         a12, .Lbr006                          #  151: 569cfc
.Lbr009:    movi         a2, 0 /* 0x00000000 */                #  154: 0c02
.Lbr010:    l32i         a12, sp, 36 /* [(local1)] */          #  156: c891
            l32i         a13, sp, 40 /* [(local2)] */          #  158: d8a1
            l32i         a14, sp, 44 /* [(local3)] */          #  15a: e8b1
            l32i         a15, sp, 48 /* [(local4)] */          #  15c: f8c1
            l32i         a0, sp, 32 /* [(local0)] */           #  15e: 0881
            addi         sp, sp, 80 /* (top of frame) */       #  160: 12c150
            ret                                                #  163: 0df0

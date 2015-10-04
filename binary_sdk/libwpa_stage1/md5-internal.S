
            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
# Local variables/stack:
#     (local0):  word      @ -0x18
#     (local1):  word      @ -0x14
#     (local2):  word      @ -0x10
#     (local3):  word      @ -0xc
#     (local4):  word      @ -0x8
#     (local5):  word      @ -0x4
            .balign      4
            .literal_position
            .global      md5_vector
            .type        md5_vector, @function
md5_vector: addi         sp, sp, -112 /* (FP)-0x70 */          #    0: 12c190
            s32i         a3, sp, 88 /* arg1 -> [(local0)] */   #    3: 326116
            s32i         a0, sp, 92 /* a0 -> [(local1)] */     #    6: 026117
            s32i         a13, sp, 100 /* a13 -> [(local3)] */  #    9: d26119
            s32i         a12, sp, 96 /* a12 -> [(local2)] */   #    c: c26118
            s32i         a14, sp, 104 /* a14 -> [(local4)] */  #    f: e2611a
            mov          a12, a4 /* arg2 */                    #   12: cd04
            mov          a14, a2 /* arg0 */                    #   14: ed02
            mov          a13, a5 /* arg3 */                    #   16: dd05
            mov          a2, sp /* (FP)-0x70 */                #   18: 2d01
            call0        MD5Init                               #   1a: 050000
            s32i         a13, sp, 108 /* arg3 -> [(local5)] */ #   1d: d2611b
            beqz         a14, .Lbr002                          #   20: 9c4e
            l32i         a13, sp, 88 /* [(local0)] */          #   22: d22116
            addx4        a14, a14, a13                         #   25: d0eea0
.Lbr001:    mov          a2, sp /* (FP)-0x70 */                #   28: 2d01
            l32i         a3, a13, 0                            #   2a: 380d
            l32i         a4, a12, 0                            #   2c: 480c
            call0        MD5Update                             #   2e: 050000
            addi         a12, a12, 4                           #   31: 4bcc
            addi         a13, a13, 4                           #   33: 4bdd
            bne          a13, a14, .Lbr001                     #   35: e79def
.Lbr002:    l32i         a2, sp, 108 /* [(local5)] */          #   38: 22211b
            mov          a3, sp /* (FP)-0x70 */                #   3b: 3d01
            call0        MD5Final                              #   3d: 050000
            movi         a2, 0 /* 0x00000000 */                #   40: 0c02
            l32i         a12, sp, 96 /* [(local2)] */          #   42: c22118
            l32i         a13, sp, 100 /* [(local3)] */         #   45: d22119
            l32i         a14, sp, 104 /* [(local4)] */         #   48: e2211a
            l32i         a0, sp, 92 /* [(local1)] */           #   4b: 022117
            addi         sp, sp, 112 /* (top of frame) */      #   4e: 12c170
            ret           /* 0x00000000 */                     #   51: 0df0

            .literal_position                                  #   54: 01234567
                                                               #   58: 89abcdef
                                                               #   5c: fedcba98
                                                               #   60: 76543210

# Function @ .irom0.text+0x64
            .balign      4
            .global      MD5Init
            .type        MD5Init, @function
MD5Init:    movi         a3, 0x10325476                        #   64: 31ffff
            movi         a4, 0x98badcfe                        #   67: 41fdff
            movi         a5, 0xefcdab89                        #   6a: 51fbff
            movi         a6, 0x67452301                        #   6d: 61f9ff
            movi         a7, 0 /* 0x00000000 */                #   70: 0c07
            s32i         a7, a2, 16 /* 0x00000000 -> [arg0+0x10] */ #   72: 7942
            s32i         a7, a2, 20 /* 0x00000000 -> [arg0+0x14] */ #   74: 7952
            s32i         a6, a2, 0 /* 0x67452301 -> [arg0] */  #   76: 6902
            s32i         a5, a2, 4 /* 0xefcdab89 -> [arg0+0x4] */ #   78: 5912
            s32i         a4, a2, 8 /* 0x98badcfe -> [arg0+0x8] */ #   7a: 4922
            s32i         a3, a2, 12 /* 0x10325476 -> [arg0+0xc] */ #   7c: 3932
            ret           /* arg0 */                           #   7e: 0df0

            .literal_position                                  #   80: 00000000
                                                               #   84: 00000000
                                                               #   88: f8020000
                                                               #   8c: 00000000
                                                               #   90: 00000000

# Function @ .irom0.text+0x94
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
            .global      MD5Update
            .type        MD5Update, @function
MD5Update:  addi         sp, sp, -48 /* (local0) */            #   94: 12c1d0
            s32i         a14, sp, 24 /* a14 -> [(local6)] */   #   97: e961
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     #   99: 0931
            s32i         a2, sp, 32 /* arg0 -> [(local8)] */   #   9b: 2981
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   #   9d: c941
            s32i         a13, sp, 20 /* a13 -> [(local5)] */   #   9f: d951
            s32i         a15, sp, 28 /* a15 -> [(local7)] */   #   a1: f971
            mov          a13, a4 /* arg2 */                    #   a3: dd04
            mov          a15, a2 /* arg0 */                    #   a5: fd02
            mov          a12, a3 /* arg1 */                    #   a7: cd03
            l32i         a2, a2, 16 /* [arg0+0x10] */          #   a9: 2842
            l32i         a0, a15, 20 /* [arg0+0x14] */         #   ab: 085f
            extui        a7, a2, 3, 6                          #   ad: 207354
            addx8        a3, a4, a2                            #   b0: 2034b0
            s32i         a3, a15, 16 /* a3 -> [arg0+0x10] */   #   b3: 394f
            extui        a4, a13, 29, 3                        #   b5: d04d25
            bgeu         a3, a2, .Lbr003                       #   b8: 27b303
            addi         a0, a0, 1 /* [arg0+0x14]+0x1 */       #   bb: 1b00
            s32i         a0, a15, 20 /* [arg0+0x14]+0x1 -> [arg0+0x14] */ #   bd: 095f
.Lbr003:    add          a4, a0, a4                            #   bf: 4a40
            s32i         a4, a15, 20 /* a4 -> [arg0+0x14] */   #   c1: 495f
            beqz         a7, .Lbr005                           #   c3: bcf7
            movi         a4, 64 /* 0x00000040 */               #   c5: 4c04
            add          a2, a7, a15                           #   c7: fa27
            addi         a2, a2, 24                            #   c9: 22c218
            sub          a4, a4, a7                            #   cc: 7044c0
            bgeu         a13, a4, .Lbr004                      #   cf: 47bd0c
            mov          a4, a13 /* arg2 */                    #   d2: 4d0d
            mov          a3, a12 /* arg1 */                    #   d4: 3d0c
            call0        memcpy                                #   d6: 01eaffc0
                                                               #   da: 0000
            j            .Lbr009                               #   dc: 461900
.Lbr004:    mov          a3, a12 /* arg1 */                    #   df: 3d0c
            s32i         a7, sp, 8 /* a7 -> [(local2)] */      #   e1: 7921
            call0        memcpy                                #   e3: 01e8ffc0
                                                               #   e7: 0000
            mov          a2, a15 /* arg0 */                    #   e9: 2d0f
            addi         a14, a15, 24 /* arg0+0x18 */          #   eb: e2cf18
            mov          a3, a14 /* arg0+0x18 */               #   ee: 3d0e
            call0        .Lfunc001                             #   f0: 01e6ffc0
                                                               #   f4: 0000
            l32i         a0, sp, 8 /* [(local2)] */            #   f6: 0821
            add          a13, a0, a13                          #   f8: dad0
            sub          a12, a12, a0                          #   fa: 00ccc0
            addi         a12, a12, 64                          #   fd: c2cc40
            addi         a13, a13, -64                         #  100: d2cdc0
            j            .Lbr006                               #  103: 860000
.Lbr005:    addi         a14, a15, 24 /* arg0+0x18 */          #  106: e2cf18
.Lbr006:    bltui        a13, 64, .Lbr008                      #  109: b6dd2c
            s32i         a13, sp, 0 /* a13 -> [(local0)] */    #  10c: d901
            srli         a2, a13, 6                            #  10e: d02641
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      #  111: 2911
.Lbr007:    mov          a2, a14 /* arg0+0x18 */               #  113: 2d0e
            mov          a3, a12                               #  115: 3d0c
            movi         a4, 64 /* 0x00000040 */               #  117: 4c04
            call0        memcpy                                #  119: 01dcffc0
                                                               #  11d: 0000
            mov          a2, a15 /* arg0 */                    #  11f: 2d0f
            mov          a3, a14 /* arg0+0x18 */               #  121: 3d0e
            call0        .Lfunc001                             #  123: 451d00
            addi         a12, a12, 64                          #  126: c2cc40
            addi         a13, a13, -64                         #  129: d2cdc0
            bgeui        a13, 64, .Lbr007                      #  12c: f6dde3
            l32i         a15, sp, 4 /* [(local1)] */           #  12f: f811
            l32i         a13, sp, 0 /* [(local0)] */           #  131: d801
            slli         a15, a15, 6                           #  133: a0ff11
            sub          a13, a13, a15                         #  136: f0ddc0
.Lbr008:    mov          a4, a13                               #  139: 4d0d
            mov          a3, a12                               #  13b: 3d0c
            mov          a2, a14 /* arg0+0x18 */               #  13d: 2d0e
            call0        memcpy                                #  13f: 01d4ffc0
                                                               #  143: 0000
.Lbr009:    l32i         a12, sp, 16 /* [(local4)] */          #  145: c841
            l32i         a13, sp, 20 /* [(local5)] */          #  147: d851
            l32i         a14, sp, 24 /* [(local6)] */          #  149: e861
            l32i         a15, sp, 28 /* [(local7)] */          #  14b: f871
            l32i         a0, sp, 12 /* [(local3)] */           #  14d: 0831
            addi         sp, sp, 48 /* (top of frame) */       #  14f: 12c130
            ret                                                #  152: 0df0

            .literal_position                                  #  154: 00000000
                                                               #  158: f8020000
                                                               #  15c: 00000000
                                                               #  160: 00000000
                                                               #  164: 00000000

# Function @ .irom0.text+0x168
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      MD5Final
            .type        MD5Final, @function
MD5Final:   movi         a4, 63 /* 0x0000003f */               #  168: 3cf4
            addi         sp, sp, -16 /* (local0) */            #  16a: 12c1f0
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  16d: 2901
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  16f: 0911
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  171: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  173: c921
            addi         a13, a3, 24 /* arg1+0x18 */           #  175: d2c318
            mov          a12, a3 /* arg1 */                    #  178: cd03
            l32i         a0, a12, 16 /* [arg1+0x10] */         #  17a: 084c
            movi         a3, -128 /* 0xffffff80 */             #  17c: 32af80
            extui        a0, a0, 3, 6                          #  17f: 000354
            add          a2, a12, a0                           #  182: 0a2c
            sub          a4, a4, a0                            #  184: 0044c0
            s8i          a3, a2, 24                            #  187: 324218
            addi         a2, a2, 25                            #  18a: 22c219
            bgeui        a4, 8, .Lbr010                        #  18d: f68420
            movi         a3, 0 /* 0x00000000 */                #  190: 0c03
            call0        memset                                #  192: 01f0ffc0
                                                               #  196: 0000
            mov          a2, a12 /* arg1 */                    #  198: 2d0c
            mov          a3, a13 /* arg1+0x18 */               #  19a: 3d0d
            call0        .Lfunc001                             #  19c: 01efffc0
                                                               #  1a0: 0000
            mov          a2, a13 /* arg1+0x18 */               #  1a2: 2d0d
            movi         a3, 0 /* 0x00000000 */                #  1a4: 0c03
            movi         a4, 56 /* 0x00000038 */               #  1a6: 3c84
            call0        memset                                #  1a8: 01edffc0
                                                               #  1ac: 0000
            j            .Lbr011                               #  1ae: 060300
.Lbr010:    movi         a3, 0 /* 0x00000000 */                #  1b1: 0c03
            movi         a4, 55 /* 0x00000037 */               #  1b3: 3c74
            sub          a4, a4, a0                            #  1b5: 0044c0
            call0        memset                                #  1b8: 01eaffc0
                                                               #  1bc: 0000
.Lbr011:    mov          a3, a13 /* arg1+0x18 */               #  1be: 3d0d
            mov          a2, a12 /* arg1 */                    #  1c0: 2d0c
            l32i         a5, a12, 20 /* [arg1+0x14] */         #  1c2: 585c
            l32i         a6, a12, 16 /* [arg1+0x10] */         #  1c4: 684c
            s32i         a6, a12, 80 /* [arg1+0x10] -> [arg1+0x50] */ #  1c6: 626c14
            s32i         a5, a12, 84 /* [arg1+0x14] -> [arg1+0x54] */ #  1c9: 526c15
            call0        .Lfunc001                             #  1cc: 851200
            l32i         a2, sp, 0 /* [(local0)] */            #  1cf: 2801
            mov          a3, a12 /* arg1 */                    #  1d1: 3d0c
            movi         a4, 16 /* 0x00000010 */               #  1d3: 1c04
            call0        memcpy                                #  1d5: 01e3ffc0
                                                               #  1d9: 0000
            movi         a3, 0 /* 0x00000000 */                #  1db: 0c03
            movi         a2, 0 /* 0x00000000 */                #  1dd: 0c02
            movi         a0, 1 /* 0x00000001 */                #  1df: 0c10
            l32i         a13, sp, 12 /* [(local3)] */          #  1e1: d831
.Lbr012:    addi         a0, a0, -1                            #  1e3: 0b00
            add          a7, a2, a12                           #  1e5: ca72
            s32i         a3, a7, 0                             #  1e7: 3907
            addi         a2, a2, 4                             #  1e9: 4b22
            bgei         a0, 1, .Lbr012                        #  1eb: e610f4
            l32i         a12, sp, 8 /* [(local2)] */           #  1ee: c821
            l32i         a0, sp, 4 /* [(local1)] */            #  1f0: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  1f2: 12c110
            ret                                                #  1f5: 0df0

            .literal_position                                  #  1f8: 78a46ad7
                                                               #  1fc: 56b7c7e8
                                                               #  200: db702024
                                                               #  204: eecebdc1
                                                               #  208: af0f7cf5
                                                               #  20c: 2ac68747
                                                               #  210: 134630a8
                                                               #  214: 019546fd
                                                               #  218: d8988069
                                                               #  21c: aff7448b
                                                               #  220: b15bffff
                                                               #  224: bed75c89
                                                               #  228: 2211906b
                                                               #  22c: 937198fd
                                                               #  230: 8e4379a6
                                                               #  234: 2108b449
                                                               #  238: 62251ef6
                                                               #  23c: 40b340c0
                                                               #  240: 515a5e26
                                                               #  244: aac7b6e9
                                                               #  248: 5d102fd6
                                                               #  24c: 53144402
                                                               #  250: 81e6a1d8
                                                               #  254: c8fbd3e7
                                                               #  258: e6cde121
                                                               #  25c: d60737c3
                                                               #  260: 870dd5f4
                                                               #  264: ed145a45
                                                               #  268: 05e9e3a9
                                                               #  26c: f8a3effc
                                                               #  270: d9026f67
                                                               #  274: 8a4c2a8d
                                                               #  278: 4239faff
                                                               #  27c: 81f67187
                                                               #  280: 22619d6d
                                                               #  284: 0c38e5fd
                                                               #  288: 44eabea4
                                                               #  28c: a9cfde4b
                                                               #  290: 604bbbf6
                                                               #  294: 70bcbfbe
                                                               #  298: c67e9b28
                                                               #  29c: fa27a1ea
                                                               #  2a0: 8530efd4
                                                               #  2a4: 051d8804
                                                               #  2a8: 39d0d4d9
                                                               #  2ac: e599dbe6
                                                               #  2b0: f87ca21f
                                                               #  2b4: 6556acc4
                                                               #  2b8: 442229f4
                                                               #  2bc: 97ff2a43
                                                               #  2c0: a72394ab
                                                               #  2c4: 39a093fc
                                                               #  2c8: c3595b65
                                                               #  2cc: 92cc0c8f
                                                               #  2d0: 7df4efff
                                                               #  2d4: d15d8485
                                                               #  2d8: 4f7ea86f
                                                               #  2dc: e0e62cfe
                                                               #  2e0: 144301a3
                                                               #  2e4: a111084e
                                                               #  2e8: 827e53f7
                                                               #  2ec: 35f23abd
                                                               #  2f0: bbd2d72a
                                                               #  2f4: 91d386eb

# Function @ .irom0.text+0x2f8
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
.Lfunc001:  addi         sp, sp, -32 /* (local0) */            #  2f8: 12c1e0
            ssai         25                                    #  2fb: 104940
            l32i         a6, a3, 28 /* [arg1+0x1c] */          #  2fe: 6873
            l32i         a4, a3, 20 /* [arg1+0x14] */          #  300: 4853
            l32i         a10, a3, 8 /* [arg1+0x8] */           #  302: a823
            l32i         a7, a3, 0 /* [arg1] */                #  304: 7803
            l32i         a9, a2, 4 /* [arg0+0x4] */            #  306: 9812
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  308: 0901
            l32i         a8, a2, 8 /* [arg0+0x8] */            #  30a: 8822
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  30c: e931
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  30e: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  310: d921
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  312: f941
            l32i         a13, a3, 4 /* [arg1+0x4] */           #  314: d813
            movi         a15, 0xd76aa478                       #  316: f1b8ff
            l32i         a12, a2, 12 /* [arg0+0xc] */          #  319: c832
            l32i         a14, a2, 0 /* [arg0] */               #  31b: e802
            xor          a0, a12, a8                           #  31d: 800c30
            and          a0, a9, a0                            #  320: 000910
            xor          a0, a12, a0                           #  323: 000c30
            add          a0, a7, a0                            #  326: 0a07
            add          a14, a14, a0                          #  328: 0aee
            add          a14, a14, a15                         #  32a: faee
            src          a14, a14, a14                         #  32c: e0ee81
            xor          a15, a8, a9                           #  32f: 90f830
            ssai         20                                    #  332: 104440
            add          a14, a9, a14                          #  335: eae9
            and          a15, a14, a15                         #  337: f0fe10
            xor          a11, a9, a14                          #  33a: e0b930
            xor          a15, a8, a15                          #  33d: f0f830
            add          a13, a13, a15                         #  340: fadd
            add          a12, a12, a13                         #  342: dacc
            movi         a13, 0xe8c7b756                       #  344: d1aeff
            l32i         a15, a3, 16 /* [arg1+0x10] */         #  347: f843
            add          a12, a12, a13                         #  349: dacc
            src          a12, a12, a12                         #  34b: c0cc81
            add          a12, a14, a12                         #  34e: cace
            ssai         15                                    #  350: 004f40
            and          a11, a12, a11                         #  353: b0bc10
            xor          a11, a9, a11                          #  356: b0b930
            add          a11, a10, a11                         #  359: baba
            add          a8, a8, a11                           #  35b: ba88
            movi         a11, 0x242070db                       #  35d: b1a8ff
            xor          a13, a14, a12                         #  360: c0de30
            add          a8, a8, a11                           #  363: ba88
            l32i         a11, a3, 12 /* [arg1+0xc] */          #  365: b833
            src          a8, a8, a8                            #  367: 808881
            add          a8, a12, a8                           #  36a: 8a8c
            ssai         10                                    #  36c: 004a40
            and          a13, a8, a13                          #  36f: d0d810
            xor          a13, a14, a13                         #  372: d0de30
            add          a11, a11, a13                         #  375: dabb
            add          a9, a9, a11                           #  377: ba99
            movi         a11, 0xc1bdceee                       #  379: b1a2ff
            xor          a0, a8, a12                           #  37c: c00830
            add          a9, a9, a11                           #  37f: ba99
            l32i         a11, a3, 24 /* [arg1+0x18] */         #  381: b863
            src          a9, a9, a9                            #  383: 909981
            add          a9, a8, a9                            #  386: 9a98
            ssai         25                                    #  388: 104940
            and          a0, a9, a0                            #  38b: 000910
            xor          a0, a12, a0                           #  38e: 000c30
            add          a15, a15, a0                          #  391: 0aff
            add          a14, a14, a15                         #  393: faee
            movi         a15, 0xf57c0faf                       #  395: f19cff
            xor          a13, a9, a8                           #  398: 80d930
            add          a14, a14, a15                         #  39b: faee
            src          a14, a14, a14                         #  39d: e0ee81
            l32i         a15, a3, 32 /* [arg1+0x20] */         #  3a0: f883
            add          a14, a9, a14                          #  3a2: eae9
            and          a13, a14, a13                         #  3a4: d0de10
            xor          a13, a8, a13                          #  3a7: d0d830
            add          a13, a4, a13                          #  3aa: dad4
            add          a12, a12, a13                         #  3ac: dacc
            movi         a13, 0x4787c62a                       #  3ae: d197ff
            ssai         20                                    #  3b1: 104440
            add          a12, a12, a13                         #  3b4: dacc
            src          a12, a12, a12                         #  3b6: c0cc81
            xor          a13, a14, a9                          #  3b9: 90de30
            add          a12, a14, a12                         #  3bc: cace
            and          a13, a12, a13                         #  3be: d0dc10
            xor          a13, a9, a13                          #  3c1: d0d930
            add          a11, a11, a13                         #  3c4: dabb
            add          a8, a8, a11                           #  3c6: ba88
            movi         a11, 0xa8304613                       #  3c8: b192ff
            ssai         15                                    #  3cb: 004f40
            add          a8, a8, a11                           #  3ce: ba88
            xor          a11, a14, a12                         #  3d0: c0be30
            src          a8, a8, a8                            #  3d3: 808881
            add          a8, a12, a8                           #  3d6: 8a8c
            ssai         10                                    #  3d8: 004a40
            and          a11, a8, a11                          #  3db: b0b810
            xor          a11, a14, a11                         #  3de: b0be30
            add          a11, a6, a11                          #  3e1: bab6
            add          a9, a9, a11                           #  3e3: ba99
            movi         a11, 0xfd469501                       #  3e5: b18bff
            xor          a0, a8, a12                           #  3e8: c00830
            add          a9, a9, a11                           #  3eb: ba99
            src          a9, a9, a9                            #  3ed: 909981
            l32i         a11, a3, 36 /* [arg1+0x24] */         #  3f0: b893
            ssai         25                                    #  3f2: 104940
            add          a9, a8, a9                            #  3f5: 9a98
            and          a0, a9, a0                            #  3f7: 000910
            xor          a13, a9, a8                           #  3fa: 80d930
            xor          a0, a12, a0                           #  3fd: 000c30
            add          a15, a15, a0                          #  400: 0aff
            add          a14, a14, a15                         #  402: faee
            movi         a15, 0x698098d8                       #  404: f185ff
            l32i         a0, a3, 48 /* [arg1+0x30] */          #  407: 08c3
            add          a14, a14, a15                         #  409: faee
            src          a14, a14, a14                         #  40b: e0ee81
            add          a14, a9, a14                          #  40e: eae9
            ssai         20                                    #  410: 104440
            and          a13, a14, a13                         #  413: d0de10
            xor          a13, a8, a13                          #  416: d0d830
            add          a13, a11, a13                         #  419: dadb
            add          a12, a12, a13                         #  41b: dacc
            movi         a13, 0x8b44f7af                       #  41d: d17fff
            xor          a15, a14, a9                          #  420: 90fe30
            add          a12, a12, a13                         #  423: dacc
            l32i         a13, a3, 40 /* [arg1+0x28] */         #  425: d8a3
            src          a12, a12, a12                         #  427: c0cc81
            add          a12, a14, a12                         #  42a: cace
            ssai         15                                    #  42c: 004f40
            and          a15, a12, a15                         #  42f: f0fc10
            xor          a15, a9, a15                          #  432: f0f930
            add          a13, a13, a15                         #  435: fadd
            add          a8, a8, a13                           #  437: da88
            movi         a13, 0xffff5bb1                       #  439: d179ff
            l32i         a15, a3, 44 /* [arg1+0x2c] */         #  43c: f8b3
            add          a8, a8, a13                           #  43e: da88
            xor          a13, a14, a12                         #  440: c0de30
            src          a8, a8, a8                            #  443: 808881
            add          a8, a12, a8                           #  446: 8a8c
            ssai         10                                    #  448: 004a40
            and          a13, a8, a13                          #  44b: d0d810
            xor          a13, a14, a13                         #  44e: d0de30
            add          a13, a15, a13                         #  451: dadf
            add          a9, a9, a13                           #  453: da99
            movi         a13, 0x895cd7be                       #  455: d173ff
            xor          a5, a8, a12                           #  458: c05830
            add          a9, a9, a13                           #  45b: da99
            l32i         a13, a3, 52 /* [arg1+0x34] */         #  45d: d8d3
            src          a9, a9, a9                            #  45f: 909981
            add          a9, a8, a9                            #  462: 9a98
            ssai         25                                    #  464: 104940
            and          a5, a9, a5                            #  467: 505910
            xor          a5, a12, a5                           #  46a: 505c30
            add          a0, a0, a5                            #  46d: 5a00
            add          a14, a14, a0                          #  46f: 0aee
            movi         a0, 0x6b901122                        #  471: 016dff
            l32i         a5, a3, 56 /* [arg1+0x38] */          #  474: 58e3
            add          a14, a14, a0                          #  476: 0aee
            src          a14, a14, a14                         #  478: e0ee81
            xor          a0, a9, a8                            #  47b: 800930
            add          a14, a9, a14                          #  47e: eae9
            and          a0, a14, a0                           #  480: 000e10
            xor          a0, a8, a0                            #  483: 000830
            add          a13, a13, a0                          #  486: 0add
            add          a12, a12, a13                         #  488: dacc
            movi         a13, 0xfd987193                       #  48a: d168ff
            ssai         20                                    #  48d: 104440
            add          a12, a12, a13                         #  490: dacc
            xor          a13, a14, a9                          #  492: 90de30
            src          a12, a12, a12                         #  495: c0cc81
            add          a12, a14, a12                         #  498: cace
            ssai         15                                    #  49a: 004f40
            and          a13, a12, a13                         #  49d: d0dc10
            xor          a13, a9, a13                          #  4a0: d0d930
            add          a13, a5, a13                          #  4a3: dad5
            add          a8, a8, a13                           #  4a5: da88
            movi         a13, 0xa679438e                       #  4a7: d162ff
            xor          a0, a14, a12                          #  4aa: c00e30
            add          a8, a8, a13                           #  4ad: da88
            l32i         a13, a3, 60 /* [arg1+0x3c] */         #  4af: d8f3
            src          a8, a8, a8                            #  4b1: 808881
            add          a8, a12, a8                           #  4b4: 8a8c
            ssai         10                                    #  4b6: 004a40
            and          a0, a8, a0                            #  4b9: 000810
            xor          a0, a14, a0                           #  4bc: 000e30
            add          a13, a13, a0                          #  4bf: 0add
            add          a9, a9, a13                           #  4c1: da99
            movi         a13, 0x49b40821                       #  4c3: d15cff
            l32i         a0, a3, 4 /* [arg1+0x4] */            #  4c6: 0813
            add          a9, a9, a13                           #  4c8: da99
            src          a9, a9, a9                            #  4ca: 909981
            add          a9, a8, a9                            #  4cd: 9a98
            ssai         27                                    #  4cf: 104b40
            xor          a13, a9, a8                           #  4d2: 80d930
            and          a13, a12, a13                         #  4d5: d0dc10
            xor          a13, a8, a13                          #  4d8: d0d830
            add          a0, a0, a13                           #  4db: da00
            add          a14, a14, a0                          #  4dd: 0aee
            movi         a0, 0xf61e2562                        #  4df: 0156ff
            l32i         a13, a3, 24 /* [arg1+0x18] */         #  4e2: d863
            add          a14, a14, a0                          #  4e4: 0aee
            src          a14, a14, a14                         #  4e6: e0ee81
            add          a14, a9, a14                          #  4e9: eae9
            xor          a0, a14, a9                           #  4eb: 900e30
            and          a0, a8, a0                            #  4ee: 000810
            xor          a0, a9, a0                            #  4f1: 000930
            add          a13, a13, a0                          #  4f4: 0add
            add          a12, a12, a13                         #  4f6: dacc
            movi         a13, 0xc040b340                       #  4f8: d151ff
            ssai         23                                    #  4fb: 104740
            add          a12, a12, a13                         #  4fe: dacc
            src          a12, a12, a12                         #  500: c0cc81
            add          a12, a14, a12                         #  503: cace
            xor          a13, a14, a12                         #  505: c0de30
            and          a13, a9, a13                          #  508: d0d910
            xor          a13, a14, a13                         #  50b: d0de30
            add          a13, a15, a13                         #  50e: dadf
            add          a8, a8, a13                           #  510: da88
            movi         a13, 0x265e5a51                       #  512: d14bff
            ssai         18                                    #  515: 104240
            add          a8, a8, a13                           #  518: da88
            src          a8, a8, a8                            #  51a: 808881
            add          a8, a12, a8                           #  51d: 8a8c
            xor          a13, a8, a12                          #  51f: c0d830
            and          a13, a14, a13                         #  522: d0de10
            xor          a13, a12, a13                         #  525: d0dc30
            add          a13, a7, a13                          #  528: dad7
            add          a9, a9, a13                           #  52a: da99
            movi         a13, 0xe9b6c7aa                       #  52c: d146ff
            ssai         12                                    #  52f: 004c40
            add          a9, a9, a13                           #  532: da99
            src          a9, a9, a9                            #  534: 909981
            l32i         a13, a3, 40 /* [arg1+0x28] */         #  537: d8a3
            add          a9, a8, a9                            #  539: 9a98
            xor          a0, a9, a8                            #  53b: 800930
            and          a0, a12, a0                           #  53e: 000c10
            xor          a0, a8, a0                            #  541: 000830
            add          a0, a4, a0                            #  544: 0a04
            add          a14, a14, a0                          #  546: 0aee
            movi         a0, 0xd62f105d                        #  548: 0140ff
            ssai         27                                    #  54b: 104b40
            add          a14, a14, a0                          #  54e: 0aee
            src          a14, a14, a14                         #  550: e0ee81
            add          a14, a9, a14                          #  553: eae9
            xor          a0, a14, a9                           #  555: 900e30
            and          a0, a8, a0                            #  558: 000810
            xor          a0, a9, a0                            #  55b: 000930
            add          a13, a13, a0                          #  55e: 0add
            add          a12, a12, a13                         #  560: dacc
            movi         a13, 0x02441453                       #  562: d13aff
            ssai         23                                    #  565: 104740
            add          a12, a12, a13                         #  568: dacc
            src          a12, a12, a12                         #  56a: c0cc81
            l32i         a13, a3, 60 /* [arg1+0x3c] */         #  56d: d8f3
            add          a12, a14, a12                         #  56f: cace
            xor          a0, a14, a12                          #  571: c00e30
            and          a0, a9, a0                            #  574: 000910
            xor          a0, a14, a0                           #  577: 000e30
            add          a13, a13, a0                          #  57a: 0add
            add          a8, a8, a13                           #  57c: da88
            movi         a13, 0xd8a1e681                       #  57e: d134ff
            ssai         18                                    #  581: 104240
            add          a8, a8, a13                           #  584: da88
            src          a8, a8, a8                            #  586: 808881
            l32i         a13, a3, 16 /* [arg1+0x10] */         #  589: d843
            add          a8, a12, a8                           #  58b: 8a8c
            xor          a0, a8, a12                           #  58d: c00830
            and          a0, a14, a0                           #  590: 000e10
            xor          a0, a12, a0                           #  593: 000c30
            add          a13, a13, a0                          #  596: 0add
            add          a9, a9, a13                           #  598: da99
            movi         a13, 0xe7d3fbc8                       #  59a: d12eff
            ssai         12                                    #  59d: 004c40
            add          a9, a9, a13                           #  5a0: da99
            src          a9, a9, a9                            #  5a2: 909981
            add          a9, a8, a9                            #  5a5: 9a98
            xor          a0, a9, a8                            #  5a7: 800930
            and          a0, a12, a0                           #  5aa: 000c10
            xor          a0, a8, a0                            #  5ad: 000830
            add          a0, a11, a0                           #  5b0: 0a0b
            add          a14, a14, a0                          #  5b2: 0aee
            movi         a0, 0x21e1cde6                        #  5b4: 0129ff
            ssai         27                                    #  5b7: 104b40
            add          a14, a14, a0                          #  5ba: 0aee
            src          a14, a14, a14                         #  5bc: e0ee81
            add          a14, a9, a14                          #  5bf: eae9
            xor          a13, a14, a9                          #  5c1: 90de30
            and          a13, a8, a13                          #  5c4: d0d810
            xor          a13, a9, a13                          #  5c7: d0d930
            add          a13, a5, a13                          #  5ca: dad5
            add          a12, a12, a13                         #  5cc: dacc
            movi         a13, 0xc33707d6                       #  5ce: d123ff
            ssai         23                                    #  5d1: 104740
            add          a12, a12, a13                         #  5d4: dacc
            src          a12, a12, a12                         #  5d6: c0cc81
            l32i         a13, a3, 12 /* [arg1+0xc] */          #  5d9: d833
            add          a12, a14, a12                         #  5db: cace
            xor          a0, a14, a12                          #  5dd: c00e30
            and          a0, a9, a0                            #  5e0: 000910
            xor          a0, a14, a0                           #  5e3: 000e30
            add          a13, a13, a0                          #  5e6: 0add
            add          a8, a8, a13                           #  5e8: da88
            movi         a13, 0xf4d50d87                       #  5ea: d11dff
            ssai         18                                    #  5ed: 104240
            add          a8, a8, a13                           #  5f0: da88
            l32i         a13, a3, 32 /* [arg1+0x20] */         #  5f2: d883
            src          a8, a8, a8                            #  5f4: 808881
            add          a8, a12, a8                           #  5f7: 8a8c
            ssai         12                                    #  5f9: 004c40
            xor          a0, a8, a12                           #  5fc: c00830
            and          a0, a14, a0                           #  5ff: 000e10
            xor          a0, a12, a0                           #  602: 000c30
            add          a13, a13, a0                          #  605: 0add
            add          a9, a9, a13                           #  607: da99
            movi         a13, 0x455a14ed                       #  609: d116ff
            l32i         a0, a3, 52 /* [arg1+0x34] */          #  60c: 08d3
            add          a9, a9, a13                           #  60e: da99
            src          a9, a9, a9                            #  610: 909981
            add          a9, a8, a9                            #  613: 9a98
            xor          a13, a9, a8                           #  615: 80d930
            and          a13, a12, a13                         #  618: d0dc10
            xor          a13, a8, a13                          #  61b: d0d830
            add          a0, a0, a13                           #  61e: da00
            add          a14, a14, a0                          #  620: 0aee
            movi         a0, 0xa9e3e905                        #  622: 0111ff
            ssai         27                                    #  625: 104b40
            add          a14, a14, a0                          #  628: 0aee
            src          a14, a14, a14                         #  62a: e0ee81
            add          a14, a9, a14                          #  62d: eae9
            xor          a13, a14, a9                          #  62f: 90de30
            and          a13, a8, a13                          #  632: d0d810
            xor          a13, a9, a13                          #  635: d0d930
            add          a13, a10, a13                         #  638: dada
            add          a12, a12, a13                         #  63a: dacc
            movi         a13, 0xfcefa3f8                       #  63c: d10cff
            ssai         23                                    #  63f: 104740
            add          a12, a12, a13                         #  642: dacc
            src          a12, a12, a12                         #  644: c0cc81
            add          a12, a14, a12                         #  647: cace
            xor          a13, a14, a12                         #  649: c0de30
            and          a13, a9, a13                          #  64c: d0d910
            xor          a13, a14, a13                         #  64f: d0de30
            add          a13, a6, a13                          #  652: dad6
            add          a8, a8, a13                           #  654: da88
            movi         a13, 0x676f02d9                       #  656: d106ff
            ssai         18                                    #  659: 104240
            add          a8, a8, a13                           #  65c: da88
            src          a8, a8, a8                            #  65e: 808881
            l32i         a13, a3, 48 /* [arg1+0x30] */         #  661: d8c3
            add          a8, a12, a8                           #  663: 8a8c
            xor          a0, a8, a12                           #  665: c00830
            and          a0, a14, a0                           #  668: 000e10
            xor          a0, a12, a0                           #  66b: 000c30
            add          a13, a13, a0                          #  66e: 0add
            add          a9, a9, a13                           #  670: da99
            movi         a13, 0x8d2a4c8a                       #  672: d100ff
            ssai         12                                    #  675: 004c40
            add          a9, a9, a13                           #  678: da99
            src          a9, a9, a9                            #  67a: 909981
            l32i         a13, a3, 32 /* [arg1+0x20] */         #  67d: d883
            add          a9, a8, a9                            #  67f: 9a98
            xor          a0, a9, a8                            #  681: 800930
            xor          a0, a12, a0                           #  684: 000c30
            add          a0, a4, a0                            #  687: 0a04
            add          a14, a14, a0                          #  689: 0aee
            movi         a0, 0xfffa3942                        #  68b: 01fbfe
            ssai         28                                    #  68e: 104c40
            add          a14, a14, a0                          #  691: 0aee
            src          a14, a14, a14                         #  693: e0ee81
            add          a14, a9, a14                          #  696: eae9
            ssai         21                                    #  698: 104540
            xor          a0, a14, a9                           #  69b: 900e30
            xor          a0, a8, a0                            #  69e: 000830
            add          a13, a13, a0                          #  6a1: 0add
            add          a12, a12, a13                         #  6a3: dacc
            movi         a13, 0x8771f681                       #  6a5: d1f5fe
            l32i         a0, a3, 4 /* [arg1+0x4] */            #  6a8: 0813
            add          a12, a12, a13                         #  6aa: dacc
            src          a12, a12, a12                         #  6ac: c0cc81
            add          a12, a14, a12                         #  6af: cace
            xor          a13, a14, a12                         #  6b1: c0de30
            xor          a13, a9, a13                          #  6b4: d0d930
            add          a13, a15, a13                         #  6b7: dadf
            add          a8, a8, a13                           #  6b9: da88
            movi         a13, 0x6d9d6122                       #  6bb: d1f1fe
            ssai         16                                    #  6be: 104040
            add          a8, a8, a13                           #  6c1: da88
            src          a8, a8, a8                            #  6c3: 808881
            add          a8, a12, a8                           #  6c6: 8a8c
            xor          a13, a8, a12                          #  6c8: c0d830
            xor          a13, a14, a13                         #  6cb: d0de30
            add          a13, a5, a13                          #  6ce: dad5
            add          a9, a9, a13                           #  6d0: da99
            movi         a13, 0xfde5380c                       #  6d2: d1ecfe
            ssai         9                                     #  6d5: 004940
            add          a9, a9, a13                           #  6d8: da99
            src          a9, a9, a9                            #  6da: 909981
            add          a9, a8, a9                            #  6dd: 9a98
            ssai         28                                    #  6df: 104c40
            xor          a13, a9, a8                           #  6e2: 80d930
            xor          a13, a12, a13                         #  6e5: d0dc30
            add          a0, a0, a13                           #  6e8: da00
            add          a14, a14, a0                          #  6ea: 0aee
            movi         a0, 0xa4beea44                        #  6ec: 01e7fe
            l32i         a13, a3, 16 /* [arg1+0x10] */         #  6ef: d843
            add          a14, a14, a0                          #  6f1: 0aee
            src          a14, a14, a14                         #  6f3: e0ee81
            add          a14, a9, a14                          #  6f6: eae9
            xor          a0, a14, a9                           #  6f8: 900e30
            xor          a0, a8, a0                            #  6fb: 000830
            add          a13, a13, a0                          #  6fe: 0add
            add          a12, a12, a13                         #  700: dacc
            movi         a13, 0x4bdecfa9                       #  702: d1e2fe
            ssai         21                                    #  705: 104540
            add          a12, a12, a13                         #  708: dacc
            src          a12, a12, a12                         #  70a: c0cc81
            add          a12, a14, a12                         #  70d: cace
            xor          a13, a14, a12                         #  70f: c0de30
            xor          a13, a9, a13                          #  712: d0d930
            add          a13, a6, a13                          #  715: dad6
            add          a8, a8, a13                           #  717: da88
            movi         a13, 0xf6bb4b60                       #  719: d1ddfe
            ssai         16                                    #  71c: 104040
            add          a8, a8, a13                           #  71f: da88
            l32i         a13, a3, 40 /* [arg1+0x28] */         #  721: d8a3
            src          a8, a8, a8                            #  723: 808881
            add          a8, a12, a8                           #  726: 8a8c
            ssai         9                                     #  728: 004940
            xor          a0, a8, a12                           #  72b: c00830
            xor          a0, a14, a0                           #  72e: 000e30
            add          a13, a13, a0                          #  731: 0add
            add          a9, a9, a13                           #  733: da99
            movi         a13, 0xbebfbc70                       #  735: d1d7fe
            l32i         a0, a3, 52 /* [arg1+0x34] */          #  738: 08d3
            add          a9, a9, a13                           #  73a: da99
            src          a9, a9, a9                            #  73c: 909981
            add          a9, a8, a9                            #  73f: 9a98
            xor          a13, a9, a8                           #  741: 80d930
            xor          a13, a12, a13                         #  744: d0dc30
            add          a0, a0, a13                           #  747: da00
            add          a14, a14, a0                          #  749: 0aee
            movi         a0, 0x289b7ec6                        #  74b: 01d3fe
            ssai         28                                    #  74e: 104c40
            add          a14, a14, a0                          #  751: 0aee
            src          a14, a14, a14                         #  753: e0ee81
            add          a14, a9, a14                          #  756: eae9
            xor          a13, a14, a9                          #  758: 90de30
            xor          a13, a8, a13                          #  75b: d0d830
            add          a13, a7, a13                          #  75e: dad7
            add          a12, a12, a13                         #  760: dacc
            movi         a13, 0xeaa127fa                       #  762: d1cefe
            ssai         21                                    #  765: 104540
            add          a12, a12, a13                         #  768: dacc
            src          a12, a12, a12                         #  76a: c0cc81
            l32i         a13, a3, 12 /* [arg1+0xc] */          #  76d: d833
            add          a12, a14, a12                         #  76f: cace
            xor          a0, a14, a12                          #  771: c00e30
            xor          a0, a9, a0                            #  774: 000930
            add          a13, a13, a0                          #  777: 0add
            add          a8, a8, a13                           #  779: da88
            movi         a13, 0xd4ef3085                       #  77b: d1c9fe
            ssai         16                                    #  77e: 104040
            add          a8, a8, a13                           #  781: da88
            src          a8, a8, a8                            #  783: 808881
            l32i         a13, a3, 24 /* [arg1+0x18] */         #  786: d863
            add          a8, a12, a8                           #  788: 8a8c
            xor          a0, a8, a12                           #  78a: c00830
            xor          a0, a14, a0                           #  78d: 000e30
            add          a13, a13, a0                          #  790: 0add
            add          a9, a9, a13                           #  792: da99
            movi         a13, 0x04881d05                       #  794: d1c4fe
            ssai         9                                     #  797: 004940
            add          a9, a9, a13                           #  79a: da99
            src          a9, a9, a9                            #  79c: 909981
            l32i         a13, a3, 48 /* [arg1+0x30] */         #  79f: d8c3
            add          a9, a8, a9                            #  7a1: 9a98
            xor          a0, a9, a8                            #  7a3: 800930
            xor          a0, a12, a0                           #  7a6: 000c30
            add          a0, a11, a0                           #  7a9: 0a0b
            add          a14, a14, a0                          #  7ab: 0aee
            movi         a0, 0xd9d4d039                        #  7ad: 01befe
            ssai         28                                    #  7b0: 104c40
            add          a14, a14, a0                          #  7b3: 0aee
            src          a14, a14, a14                         #  7b5: e0ee81
            add          a14, a9, a14                          #  7b8: eae9
            ssai         21                                    #  7ba: 104540
            xor          a0, a14, a9                           #  7bd: 900e30
            xor          a0, a8, a0                            #  7c0: 000830
            add          a13, a13, a0                          #  7c3: 0add
            add          a12, a12, a13                         #  7c5: dacc
            movi         a13, 0xe6db99e5                       #  7c7: d1b9fe
            l32i         a0, a3, 60 /* [arg1+0x3c] */          #  7ca: 08f3
            add          a12, a12, a13                         #  7cc: dacc
            src          a12, a12, a12                         #  7ce: c0cc81
            add          a12, a14, a12                         #  7d1: cace
            xor          a13, a14, a12                         #  7d3: c0de30
            xor          a13, a9, a13                          #  7d6: d0d930
            add          a13, a0, a13                          #  7d9: dad0
            add          a8, a8, a13                           #  7db: da88
            movi         a13, 0x1fa27cf8                       #  7dd: d1b4fe
            ssai         16                                    #  7e0: 104040
            add          a8, a8, a13                           #  7e3: da88
            src          a8, a8, a8                            #  7e5: 808881
            add          a8, a12, a8                           #  7e8: 8a8c
            xor          a13, a8, a12                          #  7ea: c0d830
            xor          a13, a14, a13                         #  7ed: d0de30
            add          a13, a10, a13                         #  7f0: dada
            add          a9, a9, a13                           #  7f2: da99
            movi         a13, 0xc4ac5665                       #  7f4: d1b0fe
            ssai         9                                     #  7f7: 004940
            add          a9, a9, a13                           #  7fa: da99
            src          a9, a9, a9                            #  7fc: 909981
            movi         a13, -1 /* 0xffffffff */              #  7ff: 7cfd
            xor          a13, a12, a13                         #  801: d0dc30
            add          a9, a8, a9                            #  804: 9a98
            ssai         26                                    #  806: 104a40
            or           a13, a9, a13                          #  809: d0d920
            xor          a13, a8, a13                          #  80c: d0d830
            add          a7, a7, a13                           #  80f: da77
            add          a14, a14, a7                          #  811: 7aee
            movi         a7, 0xf4292244                        #  813: 71a9fe
            movi         a13, -1 /* 0xffffffff */              #  816: 7cfd
            add          a14, a14, a7                          #  818: 7aee
            xor          a7, a8, a13                           #  81a: d07830
            src          a14, a14, a14                         #  81d: e0ee81
            add          a14, a9, a14                          #  820: eae9
            ssai         22                                    #  822: 104640
            or           a7, a14, a7                           #  825: 707e20
            xor          a7, a9, a7                            #  828: 707930
            add          a6, a6, a7                            #  82b: 7a66
            add          a12, a12, a6                          #  82d: 6acc
            movi         a6, 0x432aff97                        #  82f: 61a3fe
            l32i         a7, a2, 4 /* [arg0+0x4] */            #  832: 7812
            add          a12, a12, a6                          #  834: 6acc
            src          a12, a12, a12                         #  836: c0cc81
            xor          a6, a9, a13                           #  839: d06930
            add          a12, a14, a12                         #  83c: cace
            or           a6, a12, a6                           #  83e: 606c20
            xor          a6, a14, a6                           #  841: 606e30
            add          a5, a5, a6                            #  844: 6a55
            add          a8, a8, a5                            #  846: 5a88
            movi         a5, 0xab9423a7                        #  848: 519efe
            ssai         17                                    #  84b: 104140
            add          a8, a8, a5                            #  84e: 5a88
            xor          a5, a14, a13                          #  850: d05e30
            src          a8, a8, a8                            #  853: 808881
            add          a8, a12, a8                           #  856: 8a8c
            ssai         11                                    #  858: 004b40
            or           a5, a8, a5                            #  85b: 505820
            xor          a5, a12, a5                           #  85e: 505c30
            add          a4, a4, a5                            #  861: 5a44
            add          a9, a9, a4                            #  863: 4a99
            movi         a4, 0xfc93a039                        #  865: 4197fe
            xor          a5, a12, a13                          #  868: d05c30
            add          a9, a9, a4                            #  86b: 4a99
            l32i         a4, a3, 48 /* [arg1+0x30] */          #  86d: 48c3
            src          a9, a9, a9                            #  86f: 909981
            add          a9, a8, a9                            #  872: 9a98
            ssai         26                                    #  874: 104a40
            or           a5, a9, a5                            #  877: 505920
            xor          a5, a8, a5                            #  87a: 505830
            add          a4, a4, a5                            #  87d: 5a44
            add          a14, a14, a4                          #  87f: 4aee
            movi         a4, 0x655b59c3                        #  881: 4191fe
            xor          a5, a8, a13                           #  884: d05830
            add          a14, a14, a4                          #  887: 4aee
            l32i         a4, a3, 12 /* [arg1+0xc] */           #  889: 4833
            src          a14, a14, a14                         #  88b: e0ee81
            add          a14, a9, a14                          #  88e: eae9
            ssai         22                                    #  890: 104640
            or           a5, a14, a5                           #  893: 505e20
            xor          a5, a9, a5                            #  896: 505930
            add          a4, a4, a5                            #  899: 5a44
            add          a12, a12, a4                          #  89b: 4acc
            movi         a4, 0x8f0ccc92                        #  89d: 418bfe
            xor          a5, a9, a13                           #  8a0: d05930
            add          a12, a12, a4                          #  8a3: 4acc
            l32i         a4, a3, 40 /* [arg1+0x28] */          #  8a5: 48a3
            src          a12, a12, a12                         #  8a7: c0cc81
            add          a12, a14, a12                         #  8aa: cace
            ssai         17                                    #  8ac: 104140
            or           a5, a12, a5                           #  8af: 505c20
            xor          a5, a14, a5                           #  8b2: 505e30
            add          a4, a4, a5                            #  8b5: 5a44
            add          a8, a8, a4                            #  8b7: 4a88
            movi         a4, 0xffeff47d                        #  8b9: 4185fe
            xor          a5, a14, a13                          #  8bc: d05e30
            add          a8, a8, a4                            #  8bf: 4a88
            l32i         a4, a3, 4 /* [arg1+0x4] */            #  8c1: 4813
            src          a8, a8, a8                            #  8c3: 808881
            add          a8, a12, a8                           #  8c6: 8a8c
            ssai         11                                    #  8c8: 004b40
            or           a5, a8, a5                            #  8cb: 505820
            xor          a5, a12, a5                           #  8ce: 505c30
            add          a4, a4, a5                            #  8d1: 5a44
            add          a9, a9, a4                            #  8d3: 4a99
            movi         a4, 0x85845dd1                        #  8d5: 417ffe
            xor          a5, a12, a13                          #  8d8: d05c30
            add          a9, a9, a4                            #  8db: 4a99
            src          a9, a9, a9                            #  8dd: 909981
            l32i         a4, a3, 32 /* [arg1+0x20] */          #  8e0: 4883
            add          a9, a8, a9                            #  8e2: 9a98
            or           a5, a9, a5                            #  8e4: 505920
            xor          a5, a8, a5                            #  8e7: 505830
            add          a4, a4, a5                            #  8ea: 5a44
            add          a14, a14, a4                          #  8ec: 4aee
            movi         a4, 0x6fa87e4f                        #  8ee: 417afe
            ssai         26                                    #  8f1: 104a40
            add          a14, a14, a4                          #  8f4: 4aee
            xor          a4, a8, a13                           #  8f6: d04830
            src          a14, a14, a14                         #  8f9: e0ee81
            add          a14, a9, a14                          #  8fc: eae9
            ssai         22                                    #  8fe: 104640
            or           a4, a14, a4                           #  901: 404e20
            xor          a4, a9, a4                            #  904: 404930
            add          a0, a0, a4                            #  907: 4a00
            add          a12, a12, a0                          #  909: 0acc
            movi         a0, 0xfe2ce6e0                        #  90b: 0174fe
            xor          a4, a9, a13                           #  90e: d04930
            add          a12, a12, a0                          #  911: 0acc
            l32i         a0, a3, 24 /* [arg1+0x18] */          #  913: 0863
            src          a12, a12, a12                         #  915: c0cc81
            add          a12, a14, a12                         #  918: cace
            ssai         17                                    #  91a: 104140
            or           a4, a12, a4                           #  91d: 404c20
            xor          a4, a14, a4                           #  920: 404e30
            add          a0, a0, a4                            #  923: 4a00
            add          a8, a8, a0                            #  925: 0a88
            movi         a0, 0xa3014314                        #  927: 016efe
            xor          a4, a14, a13                          #  92a: d04e30
            add          a8, a8, a0                            #  92d: 0a88
            l32i         a0, a3, 52 /* [arg1+0x34] */          #  92f: 08d3
            src          a8, a8, a8                            #  931: 808881
            add          a8, a12, a8                           #  934: 8a8c
            ssai         11                                    #  936: 004b40
            or           a4, a8, a4                            #  939: 404820
            xor          a4, a12, a4                           #  93c: 404c30
            add          a0, a0, a4                            #  93f: 4a00
            add          a9, a9, a0                            #  941: 0a99
            movi         a0, 0x4e0811a1                        #  943: 0168fe
            xor          a4, a12, a13                          #  946: d04c30
            add          a9, a9, a0                            #  949: 0a99
            l32i         a0, a3, 16 /* [arg1+0x10] */          #  94b: 0843
            src          a9, a9, a9                            #  94d: 909981
            add          a9, a8, a9                            #  950: 9a98
            ssai         26                                    #  952: 104a40
            or           a4, a9, a4                            #  955: 404920
            xor          a4, a8, a4                            #  958: 404830
            add          a0, a0, a4                            #  95b: 4a00
            add          a14, a14, a0                          #  95d: 0aee
            movi         a0, 0xf7537e82                        #  95f: 0162fe
            l32i         a4, a2, 0 /* [arg0] */                #  962: 4802
            add          a14, a14, a0                          #  964: 0aee
            src          a14, a14, a14                         #  966: e0ee81
            xor          a0, a8, a13                           #  969: d00830
            ssai         22                                    #  96c: 104640
            add          a14, a9, a14                          #  96f: eae9
            add          a4, a4, a14                           #  971: ea44
            or           a0, a14, a0                           #  973: 000e20
            xor          a0, a9, a0                            #  976: 000930
            s32i         a4, a2, 0 /* a4 -> [arg0] */          #  979: 4902
            add          a15, a15, a0                          #  97b: 0aff
            add          a12, a12, a15                         #  97d: facc
            movi         a15, 0xbd3af235                       #  97f: f15bfe
            l32i         a0, sp, 0 /* [(local0)] */            #  982: 0801
            add          a12, a12, a15                         #  984: facc
            l32i         a15, a2, 12 /* [arg0+0xc] */          #  986: f832
            src          a12, a12, a12                         #  988: c0cc81
            add          a12, a14, a12                         #  98b: cace
            add          a15, a15, a12                         #  98d: caff
            ssai         17                                    #  98f: 104140
            s32i         a15, a2, 12 /* a15 -> [arg0+0xc] */   #  992: f932
            xor          a15, a9, a13                          #  994: d0f930
            xor          a13, a14, a13                         #  997: d0de30
            or           a15, a12, a15                         #  99a: f0fc20
            xor          a14, a14, a15                         #  99d: f0ee30
            add          a10, a10, a14                         #  9a0: eaaa
            l32i         a15, sp, 16 /* [(local4)] */          #  9a2: f841
            add          a8, a8, a10                           #  9a4: aa88
            movi         a10, 0x2ad7d2bb                       #  9a6: a152fe
            l32i         a14, a2, 8 /* [arg0+0x8] */           #  9a9: e822
            add          a8, a8, a10                           #  9ab: aa88
            src          a8, a8, a8                            #  9ad: 808881
            movi         a10, 0xeb86d391                       #  9b0: a151fe
            ssai         11                                    #  9b3: 004b40
            add          a8, a12, a8                           #  9b6: 8a8c
            add          a14, a14, a8                          #  9b8: 8aee
            or           a13, a8, a13                          #  9ba: d0d820
            xor          a12, a12, a13                         #  9bd: d0cc30
            s32i         a14, a2, 8 /* a14 -> [arg0+0x8] */    #  9c0: e922
            l32i         a13, sp, 8 /* [(local2)] */           #  9c2: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  9c4: e831
            add          a11, a11, a12                         #  9c6: cabb
            add          a9, a9, a11                           #  9c8: ba99
            l32i         a12, sp, 4 /* [(local1)] */           #  9ca: c811
            add          a9, a9, a10                           #  9cc: aa99
            src          a9, a9, a9                            #  9ce: 909981
            add          a8, a8, a9                            #  9d1: 9a88
            add          a7, a7, a8                            #  9d3: 8a77
            s32i         a7, a2, 4 /* a7 -> [arg0+0x4] */      #  9d5: 7912
            addi         sp, sp, 32 /* (top of frame) */       #  9d7: 12c120
            ret           /* arg0 */                           #  9da: 0df0

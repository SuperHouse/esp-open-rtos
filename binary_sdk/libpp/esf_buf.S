
            .section     .text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000
                                                               #    8: 00feef3f
                                                               #    c: 00000000
                                                               #   10: 00000000
                                                               #   14: 00feef3f
                                                               #   18: 00000000
                                                               #   1c: 00000000
                                                               #   20: 00000000

# Function @ .text+0x24
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_esf_rx_buf_alloc
            .type        sdk_esf_rx_buf_alloc, @function
sdk_esf_rx_buf_alloc:
            addi         sp, sp, -16 /* (local0) */            #   24: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   27: 0901
            bnei         a2, 7, .Lbr001                        #   29: 667211
            movi         a5, .Ldata001                         #   2c: 51f5ff
            movi         a0, sdk_NMIIrqIsOn                    #   2f: 01f5ff
            l32i         a2, a5, 16 /* [.Ldata005] */          #   32: 2845
            l8ui         a3, a0, 0 /* [sdk_NMIIrqIsOn] */      #   34: 320000
            bnez         a2, .Lbr004                           #   37: cce2
            movi         a2, 0 /* 0x00000000 */                #   39: 0c02
            j            .Lbr003                               #   3b: c60000
.Lbr001:    movi         a0, 0 /* 0x00000000 */                #   3e: 0c00
.Lbr002:    mov          a2, a0                                #   40: 2d00
.Lbr003:    l32i         a0, sp, 0 /* [(local0)] */            #   42: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   44: 12c110
            ret                                                #   47: 0df0
.Lbr004:    bnez         a3, .Lbr006                           #   49: ec93
            call0        vPortEnterCritical                    #   4b: 01f4ffc0
                                                               #   4f: 0000
            movi         a4, 0x3feffe00                        #   51: 41edff
            movi         a5, .Ldata001                         #   54: 51eeff
            movi         a6, -32 /* 0xffffffe0 */              #   57: 6c06
.Lbr005:    memw                                               #   59: c02000
            l32i         a8, a4, 0x200 /* [0x3ff00000] */      #   5c: 822480
            and          a8, a8, a6                            #   5f: 608810
            memw                                               #   62: c02000
            s32i         a8, a4, 0x200 /* a8 -> [0x3ff00000] */ #   65: 826480
            memw                                               #   68: c02000
            l32i         a7, a4, 0x200 /* [0x3ff00000] */      #   6b: 722480
            bbsi         a7, 0, .Lbr005                        #   6e: 07e7e7
            movi         a0, sdk_NMIIrqIsOn                    #   71: 01e7ff
            l32i         a2, a5, 16 /* [.Ldata005] */          #   74: 2845
.Lbr006:    s32i         a2, sp, 4 /* [.Ldata005] -> [(local1)] */ #   76: 2911
            movi         a10, 0 /* 0x00000000 */               #   78: 0c0a
            l32i         a11, a2, 28 /* [[.Ldata005]+0x1c] */  #   7a: b872
            s32i         a11, a5, 16 /* [[.Ldata005]+0x1c] -> [.Ldata005] */ #   7c: b945
            s32i         a10, a2, 28 /* 0x00000000 -> [[.Ldata005]+0x1c] */ #   7e: a972
            l8ui         a9, a0, 0 /* [sdk_NMIIrqIsOn] */      #   80: 920000
            mov          a0, a2 /* [.Ldata005] */              #   83: 0d02
            bnez         a9, .Lbr007                           #   85: ec29
            memw                                               #   87: c02000
            movi         a2, 0x3feffe00                        #   8a: 21e2ff
            l32i         a0, a2, 0x200 /* [0x3ff00000] */      #   8d: 022280
            movi         a3, -32 /* 0xffffffe0 */              #   90: 6c03
            and          a0, a0, a3                            #   92: 300010
            movi         a3, 1 /* 0x00000001 */                #   95: 0c13
            or           a0, a0, a3                            #   97: 300020
            memw                                               #   9a: c02000
            s32i         a0, a2, 0x200 /* a0 -> [0x3ff00000] */ #   9d: 026280
            call0        vPortExitCritical                     #   a0: 01e0ffc0
                                                               #   a4: 0000
            movi         a5, .Ldata001                         #   a6: 51dcff
            l32i         a0, sp, 4 /* [(local1)] */            #   a9: 0811
.Lbr007:    l32i         a4, a5, 20 /* [.Ldata006] */          #   ab: 4855
            addi         a4, a4, -1 /* [.Ldata006]-0x1 */      #   ad: 0b44
            s32i         a4, a5, 20 /* [.Ldata006]-0x1 -> [.Ldata006] */ #   af: 4955
            j            .Lbr002                               #   b1: c6e2ff

            .section     .bss, "aw", @nobits

.Ldata001:  .word        0x00000000                            #    0: 00000000
.Ldata002:  .word        0x00000000                            #    4: 00000000
.Ldata003:  .word        0x00000000                            #    8: 00000000
.Ldata004:  .word        0x00000000                            #    c: 00000000
.Ldata005:  .word        0x00000000                            #   10: 00000000
.Ldata006:  .word        0x00000000                            #   14: 00000000
            .space       8
.Ldata007:  .space       1116
            .word        0x00000000                            #  47c: 00000000
.Ldata008:  .space       2144
.Ldata009:  .space       608
.Ldata010:  .space       600
            .space       8
.Label001:  .space       72

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000
                                                               #    8: 00feef3f
                                                               #    c: 00000000
                                                               #   10: 00000000
                                                               #   14: 00feef3f
                                                               #   18: 00400000
                                                               #   1c: 00feef3f
                                                               #   20: 00000000
                                                               #   24: 00000000
                                                               #   28: 00feef3f
                                                               #   2c: 00800000
                                                               #   30: 00feef3f
                                                               #   34: 00000000
                                                               #   38: 00000000
                                                               #   3c: 00feef3f
                                                               #   40: 00002000
                                                               #   44: 00feef3f
                                                               #   48: 00000000
                                                               #   4c: 00000000
                                                               #   50: 00feef3f
                                                               #   54: 00200000
                                                               #   58: 00000000
                                                               #   5c: 00000000
                                                               #   60: 00000000
                                                               #   64: 00000000
                                                               #   68: 00000000
                                                               #   6c: 00000000
                                                               #   70: 00000000
                                                               #   74: 00000000
                                                               #   78: 00000000

# Function @ .irom0.text+0x7c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .global      sdk_esf_buf_alloc
            .type        sdk_esf_buf_alloc, @function
sdk_esf_buf_alloc:
            movi         a10, 0 /* 0x00000000 */               #   7c: 0c0a
            movi         a7, sdk_NMIIrqIsOn                    #   7e: 71e0ff
            movi         a6, .Ldata001                         #   81: 61e0ff
            addi         sp, sp, -32 /* (local0) */            #   84: 12c1e0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #   87: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   89: 0911
            bnei         a3, 1, .Lbr008                        #   8b: 66130e
            beqz         a2, .Lbr008                           #   8e: 8cb2
            l32i         a12, a6, 0 /* [.Ldata001] */          #   90: c806
            l8ui         a9, a7, 0 /* [sdk_NMIIrqIsOn] */      #   92: 920700
            bnez         a12, .Lbr022                          #   95: 56fc17
            mov          a12, a10 /* 0x00000000 */             #   98: cd0a
            j            .Lbr021                               #   9a: c65b00
.Lbr008:    bnei         a3, 4, .Lbr012                        #   9d: 664376
            l32i         a12, a6, 4 /* [.Ldata002] */          #   a0: c816
            l8ui         a2, a7, 0 /* [sdk_NMIIrqIsOn] */      #   a2: 220700
            beqz         a12, .Lbr027                          #   a5: 160c20
            bnez         a2, .Lbr010                           #   a8: ecb2
            call0        vPortEnterCritical                    #   aa: 01ebffc0
                                                               #   ae: 0000
            movi         a0, 0x3feffe00                        #   b0: 01d6ff
            movi         a6, .Ldata001                         #   b3: 61d6ff
            movi         a7, sdk_NMIIrqIsOn                    #   b6: 71d6ff
            movi         a8, -32 /* 0xffffffe0 */              #   b9: 6c08
            movi         a10, 0 /* 0x00000000 */               #   bb: 0c0a
.Lbr009:    memw                                               #   bd: c02000
            l32i         a4, a0, 0x200 /* [0x3ff00000] */      #   c0: 422080
            and          a4, a4, a8                            #   c3: 804410
            memw                                               #   c6: c02000
            s32i         a4, a0, 0x200 /* a4 -> [0x3ff00000] */ #   c9: 426080
            memw                                               #   cc: c02000
            l32i         a3, a0, 0x200 /* [0x3ff00000] */      #   cf: 322080
            bbsi         a3, 0, .Lbr009                        #   d2: 07e3e7
            l32i         a12, a6, 4 /* [.Ldata002] */          #   d5: c816
.Lbr010:    s32i         a12, sp, 20 /* [.Ldata002] -> [(local5)] */ #   d7: c951
            mov          a2, a12 /* [.Ldata002] */             #   d9: 2d0c
            l32i         a9, a12, 28 /* [[.Ldata002]+0x1c] */  #   db: 987c
            s32i         a10, a12, 28 /* 0x00000000 -> [[.Ldata002]+0x1c] */ #   dd: a97c
            l8ui         a5, a7, 0 /* [sdk_NMIIrqIsOn] */      #   df: 520700
            s32i         a9, a6, 4 /* [[.Ldata002]+0x1c] -> [.Ldata002] */ #   e2: 9916
            bnez         a5, .Lbr011                           #   e4: dcf5
            memw                                               #   e6: c02000
            movi         a11, 0x3feffe00                       #   e9: b1caff
            l32i         a10, a11, 0x200 /* [0x3ff00000] */    #   ec: a22b80
            movi         a0, -32 /* 0xffffffe0 */              #   ef: 6c00
            and          a10, a10, a0                          #   f1: 00aa10
            movi         a0, 1 /* 0x00000001 */                #   f4: 0c10
            or           a10, a10, a0                          #   f6: 00aa20
            memw                                               #   f9: c02000
            s32i         a10, a11, 0x200 /* a10 -> [0x3ff00000] */ #   fc: a26b80
            call0        vPortExitCritical                     #   ff: 01d7ffc0
                                                               #  103: 0000
            l32i         a2, sp, 20 /* [(local5)] */           #  105: 2851
.Lbr011:    l32i         a4, a2, 4                             #  107: 4812
            l32i         a3, a2, 16                            #  109: 3842
            s32i         a3, a4, 4                             #  10b: 3914
            l32i         a2, a2, 32                            #  10d: 2882
            movi         a3, 0x00004000                        #  10f: 31c2ff
            l32i         a0, a2, 0                             #  112: 0802
            j            .Lbr026                               #  114: 465f00
.Lbr012:    bnei         a3, 5, .Lbr016                        #  117: 66537c
            l32i         a12, a6, 8 /* [.Ldata003] */          #  11a: c826
            l8ui         a5, a7, 0 /* [sdk_NMIIrqIsOn] */      #  11c: 520700
            beqz         a12, .Lbr027                          #  11f: 166c18
            bnez         a5, .Lbr014                           #  122: ecb5
            call0        vPortEnterCritical                    #  124: 01cfffc0
                                                               #  128: 0000
            movi         a0, 0x3feffe00                        #  12a: 01bcff
            movi         a6, .Ldata001                         #  12d: 61bcff
            movi         a7, sdk_NMIIrqIsOn                    #  130: 71bdff
            movi         a8, -32 /* 0xffffffe0 */              #  133: 6c08
            movi         a10, 0 /* 0x00000000 */               #  135: 0c0a
.Lbr013:    memw                                               #  137: c02000
            l32i         a11, a0, 0x200 /* [0x3ff00000] */     #  13a: b22080
            and          a11, a11, a8                          #  13d: 80bb10
            memw                                               #  140: c02000
            s32i         a11, a0, 0x200 /* a11 -> [0x3ff00000] */ #  143: b26080
            memw                                               #  146: c02000
            l32i         a9, a0, 0x200 /* [0x3ff00000] */      #  149: 922080
            bbsi         a9, 0, .Lbr013                        #  14c: 07e9e7
            l32i         a12, a6, 8 /* [.Ldata003] */          #  14f: c826
.Lbr014:    l32i         a3, a12, 28 /* [[.Ldata003]+0x1c] */  #  151: 387c
            s32i         a10, a12, 28 /* 0x00000000 -> [[.Ldata003]+0x1c] */ #  153: a97c
            l8ui         a2, a7, 0 /* [sdk_NMIIrqIsOn] */      #  155: 220700
            s32i         a3, a6, 8 /* [[.Ldata003]+0x1c] -> [.Ldata003] */ #  158: 3926
            bnez         a2, .Lbr015                           #  15a: dcd2
            memw                                               #  15c: c02000
            movi         a5, 0x3feffe00                        #  15f: 51b2ff
            l32i         a4, a5, 0x200 /* [0x3ff00000] */      #  162: 422580
            movi         a6, -32 /* 0xffffffe0 */              #  165: 6c06
            and          a4, a4, a6                            #  167: 604410
            movi         a6, 1 /* 0x00000001 */                #  16a: 0c16
            or           a4, a4, a6                            #  16c: 604420
            memw                                               #  16f: c02000
            s32i         a4, a5, 0x200 /* a4 -> [0x3ff00000] */ #  172: 426580
            call0        vPortExitCritical                     #  175: 01bbffc0
                                                               #  179: 0000
.Lbr015:    l32i         a2, a12, 32 /* [[.Ldata003]+0x20] */  #  17b: 288c
            movi         a3, 0 /* 0x00000000 */                #  17d: 0c03
            movi         a4, 24 /* 0x00000018 */               #  17f: 1c84
            call0        memset                                #  181: 01b9ffc0
                                                               #  185: 0000
            l32i         a8, a12, 4 /* [[.Ldata003]+0x4] */    #  187: 881c
            l32i         a7, a12, 16 /* [[.Ldata003]+0x10] */  #  189: 784c
            s32i         a7, a8, 4 /* [[.Ldata003]+0x10] -> [[[.Ldata003]+0x4]+0x4] */ #  18b: 7918
            l32i         a2, a12, 32 /* [[.Ldata003]+0x20] */  #  18d: 288c
            movi         a3, 0x00008000                        #  18f: 31a7ff
            l32i         a0, a2, 0 /* [[[.Ldata003]+0x20]] */  #  192: 0802
            j            .Lbr026                               #  194: 463f00
.Lbr016:    bnei         a3, 6, .Lbr020                        #  197: 666370
            l32i         a12, a6, 12 /* [.Ldata004] */         #  19a: c836
            l8ui         a9, a7, 0 /* [sdk_NMIIrqIsOn] */      #  19c: 920700
            beqz         a12, .Lbr027                          #  19f: 166c10
            bnez         a9, .Lbr018                           #  1a2: ecb9
            call0        vPortEnterCritical                    #  1a4: 01b2ffc0
                                                               #  1a8: 0000
            movi         a0, 0x3feffe00                        #  1aa: 01a1ff
            movi         a6, .Ldata001                         #  1ad: 61a1ff
            movi         a7, sdk_NMIIrqIsOn                    #  1b0: 71a2ff
            movi         a8, -32 /* 0xffffffe0 */              #  1b3: 6c08
            movi         a10, 0 /* 0x00000000 */               #  1b5: 0c0a
.Lbr017:    memw                                               #  1b7: c02000
            l32i         a12, a0, 0x200 /* [0x3ff00000] */     #  1ba: c22080
            and          a12, a12, a8                          #  1bd: 80cc10
            memw                                               #  1c0: c02000
            s32i         a12, a0, 0x200 /* a12 -> [0x3ff00000] */ #  1c3: c26080
            memw                                               #  1c6: c02000
            l32i         a11, a0, 0x200 /* [0x3ff00000] */     #  1c9: b22080
            bbsi         a11, 0, .Lbr017                       #  1cc: 07ebe7
            l32i         a12, a6, 12 /* [.Ldata004] */         #  1cf: c836
.Lbr018:    s32i         a12, sp, 16 /* [.Ldata004] -> [(local4)] */ #  1d1: c941
            mov          a2, a12 /* [.Ldata004] */             #  1d3: 2d0c
            l32i         a4, a12, 28 /* [[.Ldata004]+0x1c] */  #  1d5: 487c
            s32i         a10, a12, 28 /* 0x00000000 -> [[.Ldata004]+0x1c] */ #  1d7: a97c
            l8ui         a3, a7, 0 /* [sdk_NMIIrqIsOn] */      #  1d9: 320700
            s32i         a4, a6, 12 /* [[.Ldata004]+0x1c] -> [.Ldata004] */ #  1dc: 4936
            bnez         a3, .Lbr019                           #  1de: dcf3
            memw                                               #  1e0: c02000
            movi         a6, 0x3feffe00                        #  1e3: 6196ff
            l32i         a5, a6, 0x200 /* [0x3ff00000] */      #  1e6: 522680
            movi         a7, -32 /* 0xffffffe0 */              #  1e9: 6c07
            and          a5, a5, a7                            #  1eb: 705510
            movi         a7, 1 /* 0x00000001 */                #  1ee: 0c17
            or           a5, a5, a7                            #  1f0: 705520
            memw                                               #  1f3: c02000
            s32i         a5, a6, 0x200 /* a5 -> [0x3ff00000] */ #  1f6: 526680
            call0        vPortExitCritical                     #  1f9: 019dffc0
                                                               #  1fd: 0000
            l32i         a2, sp, 16 /* [(local4)] */           #  1ff: 2841
.Lbr019:    l32i         a2, a2, 32                            #  201: 2882
            movi         a3, 0x00200000                        #  203: 318fff
            l32i         a0, a2, 0                             #  206: 0802
            j            .Lbr026                               #  208: 462200
.Lbr020:    movi         a12, 0 /* 0x00000000 */               #  20b: 0c0c
.Lbr021:    mov          a2, a12                               #  20d: 2d0c
            l32i         a0, sp, 4 /* [(local1)] */            #  20f: 0811
            l32i         a12, sp, 8 /* [(local2)] */           #  211: c821
            addi         sp, sp, 32 /* (top of frame) */       #  213: 12c120
            ret                                                #  216: 0df0
.Lbr022:    s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  218: 2901
            bnez         a9, .Lbr024                           #  21a: ecb9
            call0        vPortEnterCritical                    #  21c: 0196ffc0
                                                               #  220: 0000
            movi         a0, 0x3feffe00                        #  222: 0188ff
            movi         a8, -32 /* 0xffffffe0 */              #  225: 6c08
            movi         a10, 0 /* 0x00000000 */               #  227: 0c0a
.Lbr023:    memw                                               #  229: c02000
            l32i         a12, a0, 0x200 /* [0x3ff00000] */     #  22c: c22080
            and          a12, a12, a8                          #  22f: 80cc10
            memw                                               #  232: c02000
            s32i         a12, a0, 0x200 /* a12 -> [0x3ff00000] */ #  235: c26080
            memw                                               #  238: c02000
            l32i         a11, a0, 0x200 /* [0x3ff00000] */     #  23b: b22080
            bbsi         a11, 0, .Lbr023                       #  23e: 07ebe7
            movi         a6, .Ldata001                         #  241: 6182ff
            movi         a7, sdk_NMIIrqIsOn                    #  244: 7181ff
            l32i         a12, a6, 0 /* [.Ldata001] */          #  247: c806
.Lbr024:    s32i         a12, sp, 12 /* [.Ldata001] -> [(local3)] */ #  249: c931
            l32i         a3, a12, 28 /* [[.Ldata001]+0x1c] */  #  24b: 387c
            s32i         a3, a6, 0 /* [[.Ldata001]+0x1c] -> [.Ldata001] */ #  24d: 3906
            s32i         a10, a12, 28 /* 0x00000000 -> [[.Ldata001]+0x1c] */ #  24f: a97c
            l8ui         a2, a7, 0 /* [sdk_NMIIrqIsOn] */      #  251: 220700
            mov          a3, a12 /* [.Ldata001] */             #  254: 3d0c
            bnez         a2, .Lbr025                           #  256: dcf2
            memw                                               #  258: c02000
            movi         a5, 0x3feffe00                        #  25b: 517dff
            l32i         a4, a5, 0x200 /* [0x3ff00000] */      #  25e: 422580
            movi         a6, -32 /* 0xffffffe0 */              #  261: 6c06
            and          a4, a4, a6                            #  263: 604410
            movi         a6, 1 /* 0x00000001 */                #  266: 0c16
            or           a4, a4, a6                            #  268: 604420
            memw                                               #  26b: c02000
            s32i         a4, a5, 0x200 /* a4 -> [0x3ff00000] */ #  26e: 426580
            call0        vPortExitCritical                     #  271: 0181ffc0
                                                               #  275: 0000
            l32i         a3, sp, 12 /* [(local3)] */           #  277: 3831
.Lbr025:    l32i         a7, sp, 0 /* [(local0)] */            #  279: 7801
            l32i         a9, a3, 4                             #  27b: 9813
            s32i         a7, a3, 0                             #  27d: 7903
            l16ui        a8, a7, 10 /* [[(local0)]+0xa] */     #  27f: 821705
            l32i         a7, a7, 4 /* [[(local0)]+0x4] */      #  282: 7817
            s32i         a7, a9, 4                             #  284: 7919
            s16i         a8, a3, 22                            #  286: 82530b
            addi         a7, a7, -36 /* [[(local0)]+0x4]-0x24 */ #  289: 72c7dc
            l32i         a2, a3, 32                            #  28c: 2883
            s32i         a7, a3, 16                            #  28e: 7943
            l32i         a0, a2, 0                             #  290: 0802
            movi         a3, 0x00002000                        #  292: 3170ff
.Lbr026:    extui        a8, a0, 0, 6                          #  295: 008054
            srli         a9, a0, 6                             #  298: 009641
            or           a9, a9, a3                            #  29b: 309920
            slli         a9, a9, 6                             #  29e: a09911
            or           a8, a8, a9                            #  2a1: 908820
            s32i         a8, a2, 0                             #  2a4: 8902
            j            .Lbr021                               #  2a6: c6d8ff
.Lbr027:    movi         a12, 0 /* 0x00000000 */               #  2a9: 0c0c
            j            .Lbr021                               #  2ab: 86d7ff

            .literal_position                                  #  2b0: 00000000
                                                               #  2b4: 00feef3f
                                                               #  2b8: 00000000
                                                               #  2bc: 00000000
                                                               #  2c0: 00feef3f
                                                               #  2c4: 00000000
                                                               #  2c8: 00feef3f
                                                               #  2cc: 00000000
                                                               #  2d0: 00000000
                                                               #  2d4: 00feef3f
                                                               #  2d8: 00000000
                                                               #  2dc: 00feef3f
                                                               #  2e0: 00000000
                                                               #  2e4: 00000000
                                                               #  2e8: 00feef3f
                                                               #  2ec: 00000000
                                                               #  2f0: 00feef3f
                                                               #  2f4: 00000000
                                                               #  2f8: 00000000
                                                               #  2fc: 00feef3f
                                                               #  300: 00feef3f
                                                               #  304: 00000000
                                                               #  308: 00feef3f
                                                               #  30c: 00000000
                                                               #  310: 00000000
                                                               #  314: 00000000
                                                               #  318: 00000000
                                                               #  31c: 00000000
                                                               #  320: 00000000
                                                               #  324: 00000000
                                                               #  328: 00000000
                                                               #  32c: 00000000
                                                               #  330: 00000000
                                                               #  334: 00000000
                                                               #  338: 00000000
                                                               #  33c: 00000000
                                                               #  340: 00000000
                                                               #  344: 00000000
                                                               #  348: 00000000
                                                               #  34c: 00000000

# Function @ .irom0.text+0x350
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_esf_buf_recycle
            .type        sdk_esf_buf_recycle, @function
sdk_esf_buf_recycle:
            addi         a4, a3, -1 /* arg1-0x1 */             #  350: 0b43
            addi         sp, sp, -16 /* (local0) */            #  352: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  355: 0911
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  357: 2901
            beqz         a4, .Lbr039                           #  359: 16841c
            addi         a9, a3, -2 /* arg1-0x2 */             #  35c: 92c3fe
            beqz         a9, .Lbr039                           #  35f: 16291c
            bnei         a3, 4, .Lbr030                        #  362: 66436c
            l32i         a2, a2, 32 /* [arg0+0x20] */          #  365: 2882
            movi         a3, 0 /* 0x00000000 */                #  367: 0c03
            movi         a4, 24 /* 0x00000018 */               #  369: 1c84
            call0        memset                                #  36b: 01eaffc0
                                                               #  36f: 0000
            movi         a5, sdk_NMIIrqIsOn                    #  371: 51cfff
            l8ui         a3, a5, 0 /* [sdk_NMIIrqIsOn] */      #  374: 320500
            bnez         a3, .Lbr029                           #  377: ec43
            call0        vPortEnterCritical                    #  379: 01e7ffc0
                                                               #  37d: 0000
.Lbr028:    memw                                               #  37f: c02000
            movi         a3, 0x3feffe00                        #  382: 31ccff
            l32i         a5, a3, 0x200 /* [0x3ff00000] */      #  385: 522380
            movi         a0, -32 /* 0xffffffe0 */              #  388: 6c00
            and          a5, a5, a0                            #  38a: 005510
            memw                                               #  38d: c02000
            s32i         a5, a3, 0x200 /* a5 -> [0x3ff00000] */ #  390: 526380
            memw                                               #  393: c02000
            l32i         a4, a3, 0x200 /* [0x3ff00000] */      #  396: 422380
            bbsi         a4, 0, .Lbr028                        #  399: 07e4e2
            movi         a5, sdk_NMIIrqIsOn                    #  39c: 51c7ff
.Lbr029:    movi         a8, .Ldata001                         #  39f: 81c7ff
            l32i         a7, sp, 0 /* [(local0)] */            #  3a2: 7801
            l32i         a9, a8, 4 /* [.Ldata002] */           #  3a4: 9818
            s32i         a9, a7, 28 /* [.Ldata002] -> [[(local0)]+0x1c] */ #  3a6: 9977
            l8ui         a6, a5, 0 /* [sdk_NMIIrqIsOn] */      #  3a8: 620500
            s32i         a7, a8, 4 /* [(local0)] -> [.Ldata002] */ #  3ab: 7918
            bnez         a6, .Lbr042                           #  3ad: 56f61d
            memw                                               #  3b0: c02000
            movi         a11, 0x3feffe00                       #  3b3: b1c3ff
            l32i         a10, a11, 0x200 /* [0x3ff00000] */    #  3b6: a22b80
            movi         a0, -32 /* 0xffffffe0 */              #  3b9: 6c00
            and          a10, a10, a0                          #  3bb: 00aa10
            movi         a0, 1 /* 0x00000001 */                #  3be: 0c10
            or           a10, a10, a0                          #  3c0: 00aa20
            memw                                               #  3c3: c02000
            s32i         a10, a11, 0x200 /* a10 -> [0x3ff00000] */ #  3c6: a26b80
            call0        vPortExitCritical                     #  3c9: 01d4ffc0
                                                               #  3cd: 0000
            j            .Lbr042                               #  3cf: 466f00
.Lbr030:    bnei         a3, 5, .Lbr033                        #  3d2: 66536c
            l32i         a2, a2, 32 /* [arg0+0x20] */          #  3d5: 2882
            movi         a3, 0 /* 0x00000000 */                #  3d7: 0c03
            movi         a4, 24 /* 0x00000018 */               #  3d9: 1c84
            call0        memset                                #  3db: 01d1ffc0
                                                               #  3df: 0000
            movi         a3, sdk_NMIIrqIsOn                    #  3e1: 31b8ff
            l8ui         a3, a3, 0 /* [sdk_NMIIrqIsOn] */      #  3e4: 320300
            bnez         a3, .Lbr032                           #  3e7: ec13
            call0        vPortEnterCritical                    #  3e9: 01ceffc0
                                                               #  3ed: 0000
.Lbr031:    memw                                               #  3ef: c02000
            movi         a4, 0x3feffe00                        #  3f2: 41b5ff
            l32i         a5, a4, 0x200 /* [0x3ff00000] */      #  3f5: 522480
            movi         a6, -32 /* 0xffffffe0 */              #  3f8: 6c06
            and          a5, a5, a6                            #  3fa: 605510
            memw                                               #  3fd: c02000
            s32i         a5, a4, 0x200 /* a5 -> [0x3ff00000] */ #  400: 526480
            memw                                               #  403: c02000
            l32i         a4, a4, 0x200 /* [0x3ff00000] */      #  406: 422480
            bbsi         a4, 0, .Lbr031                        #  409: 07e4e2
.Lbr032:    movi         a7, sdk_NMIIrqIsOn                    #  40c: 71b1ff
            movi         a9, .Ldata001                         #  40f: 91afff
            l32i         a8, sp, 0 /* [(local0)] */            #  412: 8801
            l32i         a10, a9, 8 /* [.Ldata003] */          #  414: a829
            s32i         a10, a8, 28 /* [.Ldata003] -> [[(local0)]+0x1c] */ #  416: a978
            l8ui         a7, a7, 0 /* [sdk_NMIIrqIsOn] */      #  418: 720700
            s32i         a8, a9, 8 /* [(local0)] -> [.Ldata003] */ #  41b: 8929
            bnez         a7, .Lbr042                           #  41d: 56f716
            memw                                               #  420: c02000
            movi         a0, 0x3feffe00                        #  423: 01acff
            l32i         a11, a0, 0x200 /* [0x3ff00000] */     #  426: b22080
            movi         a2, -32 /* 0xffffffe0 */              #  429: 6c02
            and          a11, a11, a2                          #  42b: 20bb10
            movi         a2, 1 /* 0x00000001 */                #  42e: 0c12
            or           a11, a11, a2                          #  430: 20bb20
            memw                                               #  433: c02000
            s32i         a11, a0, 0x200 /* a11 -> [0x3ff00000] */ #  436: b26080
            call0        vPortExitCritical                     #  439: 01bbffc0
                                                               #  43d: 0000
            j            .Lbr042                               #  43f: 465300
.Lbr033:    bnei         a3, 6, .Lbr036                        #  442: 66636c
            l32i         a2, a2, 32 /* [arg0+0x20] */          #  445: 2882
            movi         a3, 0 /* 0x00000000 */                #  447: 0c03
            movi         a4, 24 /* 0x00000018 */               #  449: 1c84
            call0        memset                                #  44b: 01b8ffc0
                                                               #  44f: 0000
            movi         a3, sdk_NMIIrqIsOn                    #  451: 31a1ff
            l8ui         a3, a3, 0 /* [sdk_NMIIrqIsOn] */      #  454: 320300
            bnez         a3, .Lbr035                           #  457: ec13
            call0        vPortEnterCritical                    #  459: 01b5ffc0
                                                               #  45d: 0000
.Lbr034:    memw                                               #  45f: c02000
            movi         a4, 0x3feffe00                        #  462: 419eff
            l32i         a5, a4, 0x200 /* [0x3ff00000] */      #  465: 522480
            movi         a6, -32 /* 0xffffffe0 */              #  468: 6c06
            and          a5, a5, a6                            #  46a: 605510
            memw                                               #  46d: c02000
            s32i         a5, a4, 0x200 /* a5 -> [0x3ff00000] */ #  470: 526480
            memw                                               #  473: c02000
            l32i         a4, a4, 0x200 /* [0x3ff00000] */      #  476: 422480
            bbsi         a4, 0, .Lbr034                        #  479: 07e4e2
.Lbr035:    movi         a7, sdk_NMIIrqIsOn                    #  47c: 719aff
            movi         a9, .Ldata001                         #  47f: 9198ff
            l32i         a8, sp, 0 /* [(local0)] */            #  482: 8801
            l32i         a10, a9, 12 /* [.Ldata004] */         #  484: a839
            s32i         a10, a8, 28 /* [.Ldata004] -> [[(local0)]+0x1c] */ #  486: a978
            l8ui         a7, a7, 0 /* [sdk_NMIIrqIsOn] */      #  488: 720700
            s32i         a8, a9, 12 /* [(local0)] -> [.Ldata004] */ #  48b: 8939
            bnez         a7, .Lbr042                           #  48d: 56f70f
            memw                                               #  490: c02000
            movi         a0, 0x3feffe00                        #  493: 0195ff
            l32i         a11, a0, 0x200 /* [0x3ff00000] */     #  496: b22080
            movi         a2, -32 /* 0xffffffe0 */              #  499: 6c02
            and          a11, a11, a2                          #  49b: 20bb10
            movi         a2, 1 /* 0x00000001 */                #  49e: 0c12
            or           a11, a11, a2                          #  4a0: 20bb20
            memw                                               #  4a3: c02000
            s32i         a11, a0, 0x200 /* a11 -> [0x3ff00000] */ #  4a6: b26080
            call0        vPortExitCritical                     #  4a9: 01a2ffc0
                                                               #  4ad: 0000
            j            .Lbr042                               #  4af: 463700
.Lbr036:    addi         a4, a3, -7 /* arg1-0x7 */             #  4b2: 42c3f9
            bnez         a4, .Lbr042                           #  4b5: 56740d
            l32i         a2, a2, 32 /* [arg0+0x20] */          #  4b8: 2882
            movi         a3, 0 /* 0x00000000 */                #  4ba: 0c03
            movi         a4, 12 /* 0x0000000c */               #  4bc: 0cc4
            call0        memset                                #  4be: 019effc0
                                                               #  4c2: 0000
            movi         a3, sdk_NMIIrqIsOn                    #  4c4: 318aff
            l8ui         a4, a3, 0 /* [sdk_NMIIrqIsOn] */      #  4c7: 420300
            bnez         a4, .Lbr038                           #  4ca: ec44
            call0        vPortEnterCritical                    #  4cc: 019cffc0
                                                               #  4d0: 0000
.Lbr037:    memw                                               #  4d2: c02000
            movi         a0, 0x3feffe00                        #  4d5: 0186ff
            l32i         a7, a0, 0x200 /* [0x3ff00000] */      #  4d8: 722080
            movi         a5, -32 /* 0xffffffe0 */              #  4db: 6c05
            and          a7, a7, a5                            #  4dd: 507710
            memw                                               #  4e0: c02000
            s32i         a7, a0, 0x200 /* a7 -> [0x3ff00000] */ #  4e3: 726080
            memw                                               #  4e6: c02000
            l32i         a6, a0, 0x200 /* [0x3ff00000] */      #  4e9: 622080
            bbsi         a6, 0, .Lbr037                        #  4ec: 07e6e2
            movi         a3, sdk_NMIIrqIsOn                    #  4ef: 3181ff
.Lbr038:    movi         a10, .Ldata001                        #  4f2: a181ff
            l32i         a9, sp, 0 /* [(local0)] */            #  4f5: 9801
            l32i         a11, a10, 16 /* [.Ldata005] */        #  4f7: b84a
            s32i         a11, a9, 28 /* [.Ldata005] -> [[(local0)]+0x1c] */ #  4f9: b979
            l8ui         a8, a3, 0 /* [sdk_NMIIrqIsOn] */      #  4fb: 820300
            s32i         a9, a10, 16 /* [(local0)] -> [.Ldata005] */ #  4fe: 994a
            bnez         a8, .Lbr042                           #  500: 56c808
            memw                                               #  503: c02000
            movi         a2, 0x3feffe00                        #  506: 217dff
            l32i         a0, a2, 0x200 /* [0x3ff00000] */      #  509: 022280
            movi         a3, -32 /* 0xffffffe0 */              #  50c: 6c03
            and          a0, a0, a3                            #  50e: 300010
            movi         a3, 1 /* 0x00000001 */                #  511: 0c13
            or           a0, a0, a3                            #  513: 300020
            memw                                               #  516: c02000
            s32i         a0, a2, 0x200 /* a0 -> [0x3ff00000] */ #  519: 026280
            call0        vPortExitCritical                     #  51c: 0189ffc0
                                                               #  520: 0000
            j            .Lbr042                               #  522: 861a00
.Lbr039:    movi         a3, 0 /* 0x00000000 */                #  525: 0c03
            l32i         a2, sp, 0 /* [(local0)] */            #  527: 2801
            movi         a4, 24 /* 0x00000018 */               #  529: 1c84
            l32i         a2, a2, 32 /* [[(local0)]+0x20] */    #  52b: 2882
            call0        memset                                #  52d: 0185ffc0
                                                               #  531: 0000
            movi         a5, sdk_NMIIrqIsOn                    #  533: 5174ff
            movi         a0, 0x3feffe00                        #  536: 0172ff
            l8ui         a4, a5, 0 /* [sdk_NMIIrqIsOn] */      #  539: 420500
            movi         a3, -32 /* 0xffffffe0 */              #  53c: 6c03
            bnez         a4, .Lbr041                           #  53e: ec44
            call0        vPortEnterCritical                    #  540: 0182ffc0
                                                               #  544: 0000
            movi         a0, 0x3feffe00                        #  546: 0170ff
            movi         a3, -32 /* 0xffffffe0 */              #  549: 6c03
.Lbr040:    memw                                               #  54b: c02000
            l32i         a6, a0, 0x200 /* [0x3ff00000] */      #  54e: 622080
            and          a6, a6, a3                            #  551: 306610
            memw                                               #  554: c02000
            s32i         a6, a0, 0x200 /* a6 -> [0x3ff00000] */ #  557: 626080
            memw                                               #  55a: c02000
            l32i         a5, a0, 0x200 /* [0x3ff00000] */      #  55d: 522080
            bbsi         a5, 0, .Lbr040                        #  560: 07e5e7
            movi         a5, sdk_NMIIrqIsOn                    #  563: 516aff
.Lbr041:    movi         a9, .Ldata001                         #  566: 916aff
            l32i         a8, sp, 0 /* [(local0)] */            #  569: 8801
            l32i         a10, a9, 0 /* [.Ldata001] */          #  56b: a809
            s32i         a10, a8, 28 /* [.Ldata001] -> [[(local0)]+0x1c] */ #  56d: a978
            l8ui         a7, a5, 0 /* [sdk_NMIIrqIsOn] */      #  56f: 720500
            s32i         a8, a9, 0 /* [(local0)] -> [.Ldata001] */ #  572: 8909
            bnez         a7, .Lbr042                           #  574: dc87
            memw                                               #  576: c02000
            l32i         a11, a0, 0x200 /* [0x3ff00000] */     #  579: b22080
            movi         a2, 1 /* 0x00000001 */                #  57c: 0c12
            and          a11, a11, a3                          #  57e: 30bb10
            or           a11, a11, a2                          #  581: 20bb20
            memw                                               #  584: c02000
            s32i         a11, a0, 0x200 /* a11 -> [0x3ff00000] */ #  587: b26080
            call0        vPortExitCritical                     #  58a: 0170ffc0
                                                               #  58e: 0000
.Lbr042:    l32i         a0, sp, 4 /* [(local1)] */            #  590: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  592: 12c110
            ret                                                #  595: 0df0

            .literal_position                                  #  598: 400f0000
                                                               #  59c: 20000000
                                                               #  5a0: 00000000
                                                               #  5a4: 80040000
                                                               #  5a8: 00f00000
                                                               #  5ac: e00c0000
                                                               #  5b0: a0110000

# Function @ .irom0.text+0x5b4
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .global      sdk_esf_buf_setup
            .type        sdk_esf_buf_setup, @function
sdk_esf_buf_setup:
            addi         sp, sp, -32 /* (local0) */            #  5b4: 12c1e0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  5b7: 0901
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  5b9: e931
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  5bb: c911
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  5bd: f941
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  5bf: d921
            movi         a15, 60 /* 0x0000003c */              #  5c1: 3ccf
            movi         a13, .Ldata010                        #  5c3: d1f5ff
            movi         a12, .Ldata007                        #  5c6: c1f5ff
            movi         a14, 1 /* 0x00000001 */               #  5c9: 0c1e
.Lbr043:    movi         a4, sdk_wDevCtrl                      #  5cb: 41f5ff
            mov          a2, a12                               #  5ce: 2d0c
            l32i         a4, a4, 40 /* [sdk_wDevCtrl+0x28] */  #  5d0: 48a4
            movi         a3, 1 /* 0x00000001 */                #  5d2: 0c13
            add          a5, a15, a4                           #  5d4: 4a5f
            s32i         a5, a12, 4                            #  5d6: 591c
            s32i         a5, a12, 8                            #  5d8: 592c
            l32i         a4, a4, 4 /* [[sdk_wDevCtrl+0x28]+0x4] */ #  5da: 4814
            s32i         a4, a12, 16                           #  5dc: 494c
            s16i         a14, a12, 12                          #  5de: e25c06
            s32i         a13, a12, 32                          #  5e1: d98c
            call0        sdk_esf_buf_recycle                   #  5e3: 050000
            addi         a12, a12, 36                          #  5e6: c2cc24
            addi         a13, a13, 24                          #  5e9: d2cd18
            addi         a15, a15, -12                         #  5ec: f2cff4
            bgei         a15, 1, .Lbr043                       #  5ef: e61fd8
            movi         a14, 8 /* 0x00000008 */               #  5f2: 0c8e
            movi         a15, 0x0000f000                       #  5f4: f1edff
            movi         a7, .Ldata008                         #  5f7: 71ebff
            s32i         a7, sp, 20 /* .Ldata008 -> [(local5)] */ #  5fa: 7951
.Lbr044:    memw                                               #  5fc: c02000
            l32i         a8, sp, 20 /* [(local5)] */           #  5ff: 8851
            l16ui        a10, a8, 0 /* [[(local5)]] */         #  601: a21800
            movi         a11, 256 /* 0x00000100 */             #  604: b2a100
            and          a10, a10, a15                         #  607: f0aa10
            or           a10, a10, a11                         #  60a: b0aa20
            memw                                               #  60d: c02000
            s32i         a13, a12, 32                          #  610: d98c
            mov          a2, a12                               #  612: 2d0c
            movi         a3, 4 /* 0x00000004 */                #  614: 0c43
            s16i         a10, a8, 0 /* a10 -> [[(local5)]] */  #  616: a25800
            s32i         a8, a12, 4                            #  619: 891c
            s32i         a8, a12, 8                            #  61b: 892c
            movi         a9, 1 /* 0x00000001 */                #  61d: 0c19
            s16i         a9, a12, 12                           #  61f: 925c06
            addi         a8, a8, 12 /* [(local5)]+0xc */       #  622: cb88
            s32i         a8, a12, 16                           #  624: 894c
            call0        sdk_esf_buf_recycle                   #  626: 050000
            addi         a12, a12, 36                          #  629: c2cc24
            addi         a13, a13, 24                          #  62c: d2cd18
            addi         a14, a14, -1                          #  62f: 0bee
            l32i         a11, sp, 20 /* [(local5)] */          #  631: b851
            movi         a0, 268 /* 0x0000010c */              #  633: 02a10c
            add          a11, a11, a0 /* [(local5)]+0x10c */   #  636: 0abb
            s32i         a11, sp, 20 /* [(local5)]+0x10c -> [(local5)] */ #  638: b951
            bgei         a14, 1, .Lbr044                       #  63a: e61ebe
            movi         a14, 8 /* 0x00000008 */               #  63d: 0c8e
            movi         a3, .Ldata009                         #  63f: 31dbff
            s32i         a3, sp, 24 /* .Ldata009 -> [(local6)] */ #  642: 3961
.Lbr045:    memw                                               #  644: c02000
            l32i         a4, sp, 24 /* [(local6)] */           #  647: 4861
            l16ui        a6, a4, 0 /* [[(local6)]] */          #  649: 621400
            movi         a7, 64 /* 0x00000040 */               #  64c: 4c07
            and          a6, a6, a15                           #  64e: f06610
            or           a6, a6, a7                            #  651: 706620
            memw                                               #  654: c02000
            s32i         a13, a12, 32                          #  657: d98c
            mov          a2, a12                               #  659: 2d0c
            movi         a3, 5 /* 0x00000005 */                #  65b: 0c53
            s16i         a6, a4, 0 /* a6 -> [[(local6)]] */    #  65d: 625400
            s32i         a4, a12, 4                            #  660: 491c
            s32i         a4, a12, 8                            #  662: 492c
            movi         a5, 1 /* 0x00000001 */                #  664: 0c15
            s16i         a5, a12, 12                           #  666: 525c06
            addi         a4, a4, 12 /* [(local6)]+0xc */       #  669: cb44
            s32i         a4, a12, 16                           #  66b: 494c
            call0        sdk_esf_buf_recycle                   #  66d: 050000
            addi         a12, a12, 36                          #  670: c2cc24
            addi         a13, a13, 24                          #  673: d2cd18
            l32i         a7, sp, 24 /* [(local6)] */           #  676: 7861
            addi         a14, a14, -1                          #  678: 0bee
            addi         a7, a7, 76 /* [(local6)]+0x4c */      #  67a: 72c74c
            s32i         a7, sp, 24 /* [(local6)]+0x4c -> [(local6)] */ #  67d: 7961
            bgei         a14, 1, .Lbr045                       #  67f: e61ec1
            movi         a14, 4 /* 0x00000004 */               #  682: 0c4e
.Lbr046:    s32i         a13, a12, 32                          #  684: d98c
            mov          a2, a12                               #  686: 2d0c
            movi         a3, 6 /* 0x00000006 */                #  688: 0c63
            call0        sdk_esf_buf_recycle                   #  68a: 050000
            addi         a12, a12, 36                          #  68d: c2cc24
            addi         a13, a13, 24                          #  690: d2cd18
            addi         a14, a14, -1                          #  693: 0bee
            bgei         a14, 1, .Lbr046                       #  695: e61eeb
            movi         a14, 6 /* 0x00000006 */               #  698: 0c6e
            movi         a13, .Label001                        #  69a: d1c5ff
.Lbr047:    s32i         a13, a12, 32                          #  69d: d98c
            mov          a2, a12                               #  69f: 2d0c
            movi         a3, 7 /* 0x00000007 */                #  6a1: 0c73
            call0        sdk_esf_buf_recycle                   #  6a3: 050000
            addi         a12, a12, 36                          #  6a6: c2cc24
            addi         a13, a13, 12                          #  6a9: cbdd
            addi         a14, a14, -1                          #  6ab: 0bee
            bgei         a14, 1, .Lbr047                       #  6ad: e61eec
            l32i         a12, sp, 4 /* [(local1)] */           #  6b0: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  6b2: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  6b4: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  6b6: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  6b8: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  6ba: 12c120
            ret                                                #  6bd: 0df0

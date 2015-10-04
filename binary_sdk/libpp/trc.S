
            .section     .text, "ax", @progbits

# Function @ .text+0x0
            .balign      4
            .literal_position
.Lfunc001:  sub          a6, a2, a3                            #    0: 3062c0
            bltu         a2, a3, .Lbr001                       #    3: 373203
            mov          a2, a6                                #    6: 2d06
            ret                                                #    8: 0df0
.Lbr001:    addi         a2, a6, -1                            #    a: 0b26
            ret                                                #    c: 0df0

            .literal_position                                  #   10: 22000000

# Function @ .text+0x14
            .balign      4
.Lfunc002:  bgeui        a2, 16, .Lbr002                       #   14: f6b23a
            movi         a4, .Lfunc003                         #   17: 41feff
            addx2        a3, a2, a2                            #   1a: 203290
            add          a3, a3, a4                            #   1d: 4a33
            jx           a3                                    #   1f: a00300
.Lfunc003:  j            .Lbr013                               #   22: 461600
            j            .Lbr012                               #   25: 861400
            j            .Lbr011                               #   28: c61200
            j            .Lbr002                               #   2b: c60800
            j            .Lbr002                               #   2e: 060800
            j            .Lbr012                               #   31: 861100
            j            .Lbr011                               #   34: c60f00
            j            .Lbr002                               #   37: c60500
            j            .Lbr010                               #   3a: 460d00
            j            .Lbr009                               #   3d: 860b00
            j            .Lbr008                               #   40: c60900
            j            .Lbr007                               #   43: 060800
            j            .Lbr003                               #   46: 460300
            j            .Lbr006                               #   49: 860500
            j            .Lbr005                               #   4c: c60300
            j            .Lbr004                               #   4f: 060200
.Lbr002:    movi         a2, 255 /* 0x000000ff */              #   52: 22a0ff
            ret           /* 0x000000ff */                     #   55: 0df0
.Lbr003:    movi         a2, 0                                 #   57: 0c02
            ret                                                #   59: 0df0
.Lbr004:    movi         a2, 6                                 #   5b: 0c62
            ret                                                #   5d: 0df0
.Lbr005:    movi         a2, 4                                 #   5f: 0c42
            ret                                                #   61: 0df0
.Lbr006:    movi         a2, 2                                 #   63: 0c22
            ret                                                #   65: 0df0
.Lbr007:    movi         a2, 7                                 #   67: 0c72
            ret                                                #   69: 0df0
.Lbr008:    movi         a2, 5                                 #   6b: 0c52
            ret                                                #   6d: 0df0
.Lbr009:    movi         a2, 3                                 #   6f: 0c32
            ret                                                #   71: 0df0
.Lbr010:    movi         a2, 1                                 #   73: 0c12
            ret                                                #   75: 0df0
.Lbr011:    movi         a2, 8                                 #   77: 0c82
            ret                                                #   79: 0df0
.Lbr012:    movi         a2, 9                                 #   7b: 0c92
            ret                                                #   7d: 0df0
.Lbr013:    movi         a2, 10                                #   7f: 0ca2
            ret                                                #   81: 0df0

            .balign      4
# Function @ .text+0x84
            .balign      4
.Lfunc004:  beqz         a2, .Lbr017                           #   84: ac12
            beqi         a2, 1, .Lbr015                        #   86: 261217
            beqi         a2, 2, .Lbr016                        #   89: 262218
            beqi         a2, 3, .Lbr014                        #   8c: 26320d
            beqi         a2, 5, .Lbr015                        #   8f: 26520e
            beqi         a2, 6, .Lbr016                        #   92: 26620f
            beqi         a2, 7, .Lbr014                        #   95: 267204
            movi         a2, 255 /* 0x000000ff */              #   98: 22a0ff
            ret           /* 0x000000ff */                     #   9b: 0df0
.Lbr014:    movi         a2, 0 /* 0x00000000 */                #   9d: 0c02
            ret           /* 0x00000000 */                     #   9f: 0df0
.Lbr015:    movi         a2, 2 /* 0x00000002 */                #   a1: 0c22
            ret           /* 0x00000002 */                     #   a3: 0df0
.Lbr016:    movi         a2, 1 /* 0x00000001 */                #   a5: 0c12
            ret           /* 0x00000001 */                     #   a7: 0df0
.Lbr017:    movi         a2, 3 /* 0x00000003 */                #   a9: 0c32
            ret           /* 0x00000003 */                     #   ab: 0df0

            .literal_position                                  #   b0: 20a10700

# Function @ .text+0xb4
            .balign      4
.Lfunc005:  movi         a3, 0x0007a120                        #   b4: 31ffff
            l32i         a5, a2, 96 /* [arg0+0x60] */          #   b7: 522218
            movi         a4, 0 /* 0x00000000 */                #   ba: 0c04
            s8i          a4, a5, 11 /* 0x00 -> [[arg0+0x60]+0xb] */ #   bc: 42450b
            s32i         a4, a2, 40 /* 0x00000000 -> [arg0+0x28] */ #   bf: 49a2
            s32i         a4, a2, 36 /* 0x00000000 -> [arg0+0x24] */ #   c1: 4992
            s32i         a4, a2, 56 /* 0x00000000 -> [arg0+0x38] */ #   c3: 49e2
            s8i          a4, a2, 22 /* 0x00 -> [arg0+0x16] */  #   c5: 424216
            s8i          a4, a2, 23 /* 0x00 -> [arg0+0x17] */  #   c8: 424217
            s8i          a4, a2, 6 /* 0x00 -> [arg0+0x6] */    #   cb: 424206
            s32i         a3, a2, 88 /* 0x0007a120 -> [arg0+0x58] */ #   ce: 326216
            ret           /* arg0 */                           #   d1: 0df0

            .literal_position                                  #   d4: 000af23f

# Function @ .text+0xd8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc006:  addi         sp, sp, -16 /* (local0) */            #   d8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   db: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #   dd: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   df: c911
            mov          a13, a3 /* arg1 */                    #   e1: dd03
            mov          a12, a2 /* arg0 */                    #   e3: cd02
            call0        .Lfunc005                             #   e5: c5fcff
            l32i         a0, a12, 96 /* [arg0+0x60] */         #   e8: 022c18
            movi         a4, 0x3ff20a00                        #   eb: 41faff
            l8ui         a3, a0, 10 /* [[arg0+0x60]+0xa] */    #   ee: 32000a
            l8ui         a2, a12, 5 /* [arg0+0x5] */           #   f1: 220c05
            add          a3, a3, a13                           #   f4: da33
            blt          a2, a3, .Lbr019                       #   f6: 37221b
            addx2        a2, a13, a13                          #   f9: d02d90
.Lbr018:    addx4        a5, a2, a0                            #   fc: 0052a0
            s32i         a5, a12, 96 /* a5 -> [arg0+0x60] */   #   ff: 526c18
            memw                                               #  102: c02000
            l32i         a0, sp, 0 /* [(local0)] */            #  105: 0801
            l32i         a4, a4, 0x200 /* [0x3ff20c00] */      #  107: 422480
            s32i         a4, a12, 44 /* [0x3ff20c00] -> [arg0+0x2c] */ #  10a: 49bc
            l32i         a13, sp, 8 /* [(local2)] */           #  10c: d821
            l32i         a12, sp, 4 /* [(local1)] */           #  10e: c811
            addi         sp, sp, 16 /* (top of frame) */       #  110: 12c110
            ret                                                #  113: 0df0
.Lbr019:    addx2        a2, a2, a2                            #  115: 202290
            l32i         a0, a12, 104 /* [arg0+0x68] */        #  118: 022c1a
            j            .Lbr018                               #  11b: 46f7ff

            .balign      4
# Function @ .text+0x120
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc007:  movi         a6, 10 /* 0x0000000a */               #  120: 0ca6
            addi         sp, sp, -16 /* (local0) */            #  122: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  125: 0901
            l32i         a4, a2, 96 /* [arg0+0x60] */          #  127: 422218
            l32i         a0, a2, 40 /* [arg0+0x28] */          #  12a: 08a2
            l8ui         a4, a4, 1 /* [[arg0+0x60]+0x1] */     #  12c: 420401
            addi         a0, a0, 1 /* [arg0+0x28]+0x1 */       #  12f: 1b00
            bltu         a4, a3, .Lbr024                       #  131: 37342b
            l32i         a4, a2, 36 /* [arg0+0x24] */          #  134: 4892
            s32i         a0, a2, 40 /* [arg0+0x28]+0x1 -> [arg0+0x28] */ #  136: 09a2
            add          a0, a3, a4                            #  138: 4a03
            addi         a0, a0, 1                             #  13a: 1b00
.Lbr020:    s32i         a0, a2, 36 /* a0 -> [arg0+0x24] */    #  13c: 0992
            bgeui        a3, 6, .Lbr025                        #  13e: f66329
            bgeui        a3, 3, .Lbr021                        #  141: f63309
            movi         a0, 0 /* 0x00000000 */                #  144: 0c00
            movi         a5, 0 /* 0x00000000 */                #  146: 0c05
            s8i          a5, a2, 6 /* 0x00 -> [arg0+0x6] */    #  148: 524206
            j            .Lbr022                               #  14b: 860000
.Lbr021:    l8ui         a0, a2, 6 /* [arg0+0x6] */            #  14e: 020206
.Lbr022:    bgeu         a6, a0, .Lbr023                       #  151: 07b604
            movi         a3, 1 /* 0x00000001 */                #  154: 0c13
            call0        .Lfunc006                             #  156: 05f8ff
.Lbr023:    l32i         a0, sp, 0 /* [(local0)] */            #  159: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  15b: 12c110
            ret                                                #  15e: 0df0
.Lbr024:    l32i         a4, a2, 36 /* [arg0+0x24] */          #  160: 4892
            s32i         a0, a2, 40 /* [arg0+0x28]+0x1 -> [arg0+0x28] */ #  162: 09a2
            add          a0, a3, a4                            #  164: 4a03
            addi         a0, a0, 2                             #  166: 2b00
            j            .Lbr020                               #  168: 06f4ff
.Lbr025:    l8ui         a0, a2, 6 /* [arg0+0x6] */            #  16b: 020206
            addi         a0, a0, 1 /* [arg0+0x6]+0x1 */        #  16e: 1b00
            extui        a0, a0, 0, 8                          #  170: 000074
            s8i          a0, a2, 6 /* a0 -> [arg0+0x6] */      #  173: 024206
            j            .Lbr022                               #  176: c6f5ff

            .balign      4
# Function @ .text+0x17c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_rcUpdateTxDone
            .type        sdk_rcUpdateTxDone, @function
sdk_rcUpdateTxDone:
            addi         sp, sp, -16 /* (local0) */            #  17c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  17f: 0901
            beqz         a2, .Lbr029                           #  181: 16b207
            l32i         a0, a2, 96 /* [arg0+0x60] */          #  184: 022218
            beqz         a0, .Lbr029                           #  187: 165007
            l32i         a4, a3, 20 /* [arg1+0x14] */          #  18a: 4853
            bne          a4, a0, .Lbr029                       #  18c: 079470
            l32i         a5, a2, 56 /* [arg0+0x38] */          #  18f: 58e2
            addi         a5, a5, 1 /* [arg0+0x38]+0x1 */       #  191: 1b55
            s32i         a5, a2, 56 /* [arg0+0x38]+0x1 -> [arg0+0x38] */ #  193: 59e2
            l8ui         a5, a3, 15 /* [arg1+0xf] */           #  195: 52030f
            bnei         a5, 1, .Lbr028                        #  198: 66155e
            l8ui         a6, a2, 20 /* [arg0+0x14] */          #  19b: 620214
            movi         a8, 127 /* 0x0000007f */              #  19e: 82a07f
            bbsi         a6, 2, .Lbr027                        #  1a1: 27e649
            l8ui         a0, a3, 9 /* [arg1+0x9] */            #  1a4: 020309
            movi         a7, 0 /* 0x00000000 */                #  1a7: 0c07
            slli         a6, a0, 24                            #  1a9: 806001
            srai         a6, a6, 24                            #  1ac: 606831
            beq          a6, a8, .Lbr027                       #  1af: 87163b
            l8ui         a9, a2, 0 /* [arg0] */                #  1b2: 920200
            s8i          a0, a2, 0 /* [arg1+0x9] -> [arg0] */  #  1b5: 024200
            slli         a0, a9, 24                            #  1b8: 800901
            addi         a9, a9, -127 /* [arg0]-0x7f */        #  1bb: 92c981
            srai         a0, a0, 24                            #  1be: 000831
            add          a0, a6, a0                            #  1c1: 0a06
            srai         a0, a0, 1                             #  1c3: 000121
            moveqz       a0, a7, a9                            #  1c6: 900783
            slli         a6, a0, 24                            #  1c9: 806001
            l8ui         a7, a2, 1 /* [arg0+0x1] */            #  1cc: 720201
            srai         a6, a6, 24                            #  1cf: 606831
            beq          a7, a8, .Lbr026                       #  1d2: 871715
            slli         a4, a7, 24                            #  1d5: 804701
            srai         a4, a4, 24                            #  1d8: 404831
            addx2        a4, a4, a4                            #  1db: 404490
            add          a4, a6, a4                            #  1de: 4a46
            slli         a4, a4, 2                             #  1e0: e04411
            addi         a0, a4, 15                            #  1e3: fb04
            movgez       a0, a4, a4                            #  1e5: 4004b3
            srai         a0, a0, 4                             #  1e8: 000421
.Lbr026:    s8i          a0, a2, 1 /* a0 -> [arg0+0x1] */      #  1eb: 024201
.Lbr027:    l8ui         a3, a3, 4 /* [arg1+0x4] */            #  1ee: 320304
            srli         a3, a3, 4                             #  1f1: 303441
            call0        .Lfunc007                             #  1f4: 85f2ff
            j            .Lbr029                               #  1f7: 460100
.Lbr028:    beqi         a5, 2, .Lbr030                        #  1fa: 262509
            beqi         a5, 3, .Lbr030                        #  1fd: 263506
.Lbr029:    l32i         a0, sp, 0 /* [(local0)] */            #  200: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  202: 12c110
            ret                                                #  205: 0df0
.Lbr030:    l8ui         a3, a0, 8 /* [[arg0+0x60]+0x8] */     #  207: 320008
            call0        .Lfunc007                             #  20a: 45f1ff
            j            .Lbr029                               #  20d: c6fbff

# Function @ .text+0x210
            .balign      4
            .global      sdk_rcUpdateRxDone
            .type        sdk_rcUpdateRxDone, @function
sdk_rcUpdateRxDone:
            l8ui         a6, a3, 0 /* [arg1] */                #  210: 620300
            slli         a4, a6, 24                            #  213: 804601
            srai         a3, a4, 24                            #  216: 403831
            beqz         a2, .Lbr034                           #  219: 16b204
            l8ui         a5, a2, 20 /* [arg0+0x14] */          #  21c: 520214
            movi         a8, 127 /* 0x0000007f */              #  21f: 82a07f
            bbsi         a5, 0, .Lbr034                        #  222: 07e542
            l8ui         a7, a2, 2 /* [arg0+0x2] */            #  225: 720202
            bne          a7, a8, .Lbr031                       #  228: 879707
            s8i          a6, a2, 2 /* [arg1] -> [arg0+0x2] */  #  22b: 624202
            movi         a6, 0 /* 0x00000000 */                #  22e: 0c06
            j            .Lbr032                               #  230: 460500
.Lbr031:    s8i          a6, a2, 2 /* [arg1] -> [arg0+0x2] */  #  233: 624202
            slli         a6, a7, 24                            #  236: 806701
            srai         a6, a6, 24                            #  239: 606831
            add          a6, a3, a6                            #  23c: 6a63
            srai         a6, a6, 1                             #  23e: 606121
            slli         a6, a6, 24                            #  241: 806601
            srai         a6, a6, 24                            #  244: 606831
            mov          a3, a6                                #  247: 3d06
.Lbr032:    l8ui         a7, a2, 3 /* [arg0+0x3] */            #  249: 720203
            beq          a7, a8, .Lbr033                       #  24c: 871715
            slli         a4, a7, 24                            #  24f: 804701
            srai         a4, a4, 24                            #  252: 404831
            addx2        a4, a4, a4                            #  255: 404490
            add          a4, a6, a4                            #  258: 4a46
            slli         a4, a4, 2                             #  25a: e04411
            addi         a3, a4, 15                            #  25d: fb34
            movgez       a3, a4, a4                            #  25f: 4034b3
            srai         a3, a3, 4                             #  262: 303421
.Lbr033:    s8i          a3, a2, 3 /* a3 -> [arg0+0x3] */      #  265: 324203
.Lbr034:    ret           /* arg0 */                           #  268: 0df0

            .balign      4
# Function @ .text+0x26c
            .balign      4
            .global      sdk_rcUpdateDataRxDone
            .type        sdk_rcUpdateDataRxDone, @function
sdk_rcUpdateDataRxDone:
            ret           /* arg0 */                           #  26c: 0df0

            .literal_position                                  #  270: 64000000
                                                               #  274: 00000000
                                                               #  278: 00100000
                                                               #  27c: 24010000
                                                               #  280: 00082000
                                                               #  284: 00000000
                                                               #  288: 00000000
                                                               #  28c: 94050000

# Function @ .text+0x290
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_rcGetSched
            .type        sdk_rcGetSched, @function
sdk_rcGetSched:
            addi         sp, sp, -16 /* (local0) */            #  290: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  293: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  295: 0901
            mov          a12, a2 /* arg0 */                    #  297: cd02
            mov          a2, a3 /* arg1 */                     #  299: 2d03
            beqz         a12, .Lbr035                          #  29b: 9c1c
            l32i         a0, a12, 96 /* [arg0+0x60] */         #  29d: 022c18
            beqz         a0, .Lbr035                           #  2a0: 8cc0
            l32i         a0, a3, 0 /* [arg1] */                #  2a2: 0803
            srli         a3, a0, 6                             #  2a4: 003641
            bbci         a0, 7, .Lbr040                        #  2a7: 776043
            l32i         a0, a12, 100 /* [arg0+0x64] */        #  2aa: 022c19
            j            .Lbr036                               #  2ad: 060200
.Lbr035:    l8ui         a3, a2, 0 /* [arg1] */                #  2b0: 320200
            movi         a0, .Label001                         #  2b3: 01efff
            bbci         a3, 0, .Lbr041                        #  2b6: 07635f
.Lbr036:    s32i         a2, sp, 8 /* a2 -> [(local2)] */      #  2b9: 2921
            s32i         a0, a2, 20                            #  2bb: 0952
            bnez         a0, .Lbr037                           #  2bd: cc90
            movi         a2, .Lstr001                          #  2bf: 21edff
            call0        printf                                #  2c2: 01f1ffc0
                                                               #  2c6: 0000
            l32i         a2, sp, 8 /* [(local2)] */            #  2c8: 2821
.Lbr037:    beqz         a12, .Lbr038                          #  2ca: 8cfc
            l8ui         a4, a12, 20 /* [arg0+0x14] */         #  2cc: 420c14
            l8ui         a0, a12, 7 /* [arg0+0x7] */           #  2cf: 020c07
            bbci         a4, 6, .Lbr038                        #  2d2: 676407
            l32i         a5, a2, 0                             #  2d5: 5802
            bbci         a5, 9, .Lbr038                        #  2d7: 976502
            j            .Lbr039                               #  2da: 060100
.Lbr038:    l32i         a0, a2, 20                            #  2dd: 0852
            l8ui         a0, a0, 0                             #  2df: 020000
.Lbr039:    l32i         a12, sp, 4 /* [(local1)] */           #  2e2: c811
            s8i          a0, a2, 8                             #  2e4: 024208
            l32i         a0, sp, 0 /* [(local0)] */            #  2e7: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  2e9: 12c110
            ret                                                #  2ec: 0df0
.Lbr040:    s32i         a2, sp, 8 /* arg1 -> [(local2)] */    #  2ee: 2921
            bbci         a0, 9, .Lbr042                        #  2f0: 97602b
            mov          a2, a12 /* arg0 */                    #  2f3: 2d0c
            call0        .Lfunc010                             #  2f5: 01e5ffc0
                                                               #  2f9: 0000
            l32i         a2, sp, 8 /* [(local2)] */            #  2fb: 2821
            l32i         a0, a12, 96 /* [arg0+0x60] */         #  2fd: 022c18
            l32i         a4, a2, 0 /* [[(local2)]] */          #  300: 4802
            movi         a5, 0x00001000                        #  302: 51ddff
            extui        a3, a4, 0, 6                          #  305: 403054
            srli         a4, a4, 6                             #  308: 404641
            or           a4, a4, a5                            #  30b: 504420
            slli         a4, a4, 6                             #  30e: a04411
            or           a3, a3, a4                            #  311: 403320
            s32i         a3, a2, 0 /* a3 -> [[(local2)]] */    #  314: 3902
            j            .Lbr036                               #  316: c6e7ff
.Lbr041:    movi         a0, .Label003                         #  319: 01d8ff
            j            .Lbr036                               #  31c: 46e6ff
.Lbr042:    movi         a5, 0x00200800                        #  31f: 51d8ff
            bnone        a5, a3, .Lbr043                       #  322: 37050a
            l32i         a6, a12, 92 /* [arg0+0x5c] */         #  325: 622c17
            movi         a0, .Ldata001                         #  328: 01d7ff
            beqz         a6, .Lbr043                           #  32b: 8c16
            j            .Lbr036                               #  32d: 06e2ff
.Lbr043:    l32i         a0, a12, 100 /* [arg0+0x64] */        #  330: 022c19
            j            .Lbr036                               #  333: 86e0ff

            .balign      4
# Function @ .text+0x338
            .balign      4
            .global      sdk_rcGetRate
            .type        sdk_rcGetRate, @function
sdk_rcGetRate:
            l32i         a4, a3, 0 /* [arg1] */                #  338: 4803
            movi         a6, 0 /* 0x00000000 */                #  33a: 0c06
            srli         a11, a4, 6                            #  33c: 40b641
            bbsi         a4, 28, .Lbr047                       #  33f: c7f42a
            movi         a7, 0 /* 0x00000000 */                #  342: 0c07
            l8ui         a8, a3, 4 /* [arg1+0x4] */            #  344: 820304
            l32i         a9, a3, 20 /* [arg1+0x14] */          #  347: 9853
            srli         a8, a8, 4                             #  349: 808441
.Lbr044:    addx2        a10, a6, a9                           #  34c: 90a690
            l8ui         a4, a10, 1                            #  34f: 420a01
            addi         a6, a6, 1                             #  352: 1b66
            add          a7, a4, a7                            #  354: 7a74
            extui        a7, a7, 0, 8                          #  356: 707074
            bge          a8, a7, .Lbr048                       #  359: 77a812
            beqz         a2, .Lbr045                           #  35c: 8c72
            l8ui         a5, a2, 20 /* [arg0+0x14] */          #  35e: 520214
            bbci         a5, 6, .Lbr045                        #  361: 676502
            bbsi         a11, 3, .Lbr049                       #  364: 37eb10
.Lbr045:    l8ui         a2, a10, 0                            #  367: 220a00
.Lbr046:    s8i          a2, a3, 8 /* a2 -> [arg1+0x8] */      #  36a: 224308
.Lbr047:    ret                                                #  36d: 0df0
.Lbr048:    extui        a6, a6, 0, 8                          #  36f: 606074
            bnei         a6, 4, .Lbr044                        #  372: 6646d6
            j            .Lbr047                               #  375: 06fdff
.Lbr049:    l8ui         a2, a2, 7 /* [arg0+0x7] */            #  378: 220207
            j            .Lbr046                               #  37b: c6faff

            .literal_position                                  #  380: 95030000

# Function @ .text+0x384
            .balign      4
.Lfunc008:  movi         a6, 255 /* 0x000000ff */              #  384: 62a0ff
            bgeui        a3, 32, .Lbr052                       #  387: f6c37c
            movi         a5, .Lfunc009                         #  38a: 51fdff
            addx2        a4, a3, a3                            #  38d: 304390
            add          a4, a4, a5                            #  390: 5a44
            jx           a4                                    #  392: a00400
.Lfunc009:  j            .Lbr052                               #  395: 861b00
            j            .Lbr086                               #  398: c66c00
            j            .Lbr083                               #  39b: c66400
            j            .Lbr080                               #  39e: 465c00
            j            .Lbr052                               #  3a1: 861800
            j            .Lbr086                               #  3a4: c66900
            j            .Lbr083                               #  3a7: c66100
            j            .Lbr080                               #  3aa: 465900
            j            .Lbr077                               #  3ad: c65000
            j            .Lbr074                               #  3b0: 464800
            j            .Lbr071                               #  3b3: 464000
            j            .Lbr068                               #  3b6: c63700
            j            .Lbr065                               #  3b9: 462f00
            j            .Lbr062                               #  3bc: c62600
            j            .Lbr059                               #  3bf: 461e00
            j            .Lbr056                               #  3c2: 461600
            j            .Lbr068                               #  3c5: 063400
            j            .Lbr071                               #  3c8: 063b00
            j            .Lbr059                               #  3cb: 461b00
            j            .Lbr074                               #  3ce: c64000
            j            .Lbr062                               #  3d1: 862100
            j            .Lbr077                               #  3d4: 064700
            j            .Lbr065                               #  3d7: c62700
            j            .Lbr054                               #  3da: 060d00
            j            .Lbr068                               #  3dd: 062e00
            j            .Lbr071                               #  3e0: 063500
            j            .Lbr059                               #  3e3: 461500
            j            .Lbr074                               #  3e6: c63a00
            j            .Lbr062                               #  3e9: 861b00
            j            .Lbr077                               #  3ec: 064100
            j            .Lbr065                               #  3ef: c62100
            j            .Lbr054                               #  3f2: 060700
.Lbr050:    addi         a3, a2, -33                           #  3f5: 32c2df
            addi         a2, a2, -32                           #  3f8: 22c2e0
            movgez       a2, a3, a3                            #  3fb: 3023b3
            srai         a2, a2, 1                             #  3fe: 202121
            addx2        a2, a2, a2                            #  401: 202290
.Lbr051:    extui        a2, a2, 0, 8                          #  404: 202074
.Lbr052:    movi         a3, 32 /* 0x00000020 */               #  407: 2c03
            bgeu         a3, a2, .Lbr053                       #  409: 27b303
            mov          a2, a3 /* 0x00000020 */               #  40c: 2d03
            ret           /* 0x00000020 */                     #  40e: 0df0
.Lbr053:    ret           /* arg0 */                           #  410: 0df0
.Lbr054:    movi         a4, 33                                #  412: 2c14
            bgeu         a4, a2, .Lbr055                       #  414: 27b402
            bne          a2, a6, .Lbr050                       #  417: 6792da
.Lbr055:    movi         a2, 0                                 #  41a: 0c02
            j            .Lbr051                               #  41c: 06f9ff
.Lbr056:    bltui        a2, 10, .Lbr057                       #  41f: b69202
            bne          a2, a6, .Lbr058                       #  422: 679204
.Lbr057:    movi         a2, 0                                 #  425: 0c02
            j            .Lbr051                               #  427: 46f6ff
.Lbr058:    addi         a3, a2, -9                            #  42a: 32c2f7
            addi         a2, a2, -8                            #  42d: 22c2f8
            movgez       a2, a3, a3                            #  430: 3023b3
            srai         a2, a2, 1                             #  433: 202121
            addx2        a2, a2, a2                            #  436: 202290
            j            .Lbr051                               #  439: c6f1ff
.Lbr059:    movi         a4, 13                                #  43c: 0cd4
            bgeu         a4, a2, .Lbr060                       #  43e: 27b402
            bne          a2, a6, .Lbr061                       #  441: 679204
.Lbr060:    movi         a2, 0                                 #  444: 0c02
            j            .Lbr051                               #  446: 86eeff
.Lbr061:    addi         a3, a2, -13                           #  449: 32c2f3
            addi         a2, a2, -12                           #  44c: 22c2f4
            movgez       a2, a3, a3                            #  44f: 3023b3
            srai         a2, a2, 1                             #  452: 202121
            addx2        a2, a2, a2                            #  455: 202290
            j            .Lbr051                               #  458: 06eaff
.Lbr062:    movi         a4, 21                                #  45b: 1c54
            bgeu         a4, a2, .Lbr063                       #  45d: 27b402
            bne          a2, a6, .Lbr064                       #  460: 679204
.Lbr063:    movi         a2, 0                                 #  463: 0c02
            j            .Lbr051                               #  465: c6e6ff
.Lbr064:    addi         a3, a2, -21                           #  468: 32c2eb
            addi         a2, a2, -20                           #  46b: 22c2ec
            movgez       a2, a3, a3                            #  46e: 3023b3
            srai         a2, a2, 1                             #  471: 202121
            addx2        a2, a2, a2                            #  474: 202290
            j            .Lbr051                               #  477: 46e2ff
.Lbr065:    movi         a4, 29                                #  47a: 1cd4
            bgeu         a4, a2, .Lbr066                       #  47c: 27b402
            bne          a2, a6, .Lbr067                       #  47f: 679204
.Lbr066:    movi         a2, 0                                 #  482: 0c02
            j            .Lbr051                               #  484: 06dfff
.Lbr067:    addi         a3, a2, -29                           #  487: 32c2e3
            addi         a2, a2, -28                           #  48a: 22c2e4
            movgez       a2, a3, a3                            #  48d: 3023b3
            srai         a2, a2, 1                             #  490: 202121
            addx2        a2, a2, a2                            #  493: 202290
            j            .Lbr051                               #  496: 86daff
.Lbr068:    movi         a4, 8                                 #  499: 0c84
            bgeu         a4, a2, .Lbr069                       #  49b: 27b402
            bne          a2, a6, .Lbr070                       #  49e: 679204
.Lbr069:    movi         a2, 0                                 #  4a1: 0c02
            j            .Lbr051                               #  4a3: 46d7ff
.Lbr070:    addi         a3, a2, -8                            #  4a6: 32c2f8
            addi         a2, a2, -7                            #  4a9: 22c2f9
            movgez       a2, a3, a3                            #  4ac: 3023b3
            srai         a2, a2, 1                             #  4af: 202121
            addx2        a2, a2, a2                            #  4b2: 202290
            j            .Lbr051                               #  4b5: c6d2ff
.Lbr071:    bltui        a2, 12, .Lbr072                       #  4b8: b6a202
            bne          a2, a6, .Lbr073                       #  4bb: 679204
.Lbr072:    movi         a2, 0                                 #  4be: 0c02
            j            .Lbr051                               #  4c0: 06d0ff
.Lbr073:    addi         a3, a2, -11                           #  4c3: 32c2f5
            addi         a2, a2, -10                           #  4c6: 22c2f6
            movgez       a2, a3, a3                            #  4c9: 3023b3
            srai         a2, a2, 1                             #  4cc: 202121
            addx2        a2, a2, a2                            #  4cf: 202290
            j            .Lbr051                               #  4d2: 86cbff
.Lbr074:    movi         a4, 16                                #  4d5: 1c04
            bgeu         a4, a2, .Lbr075                       #  4d7: 27b402
            bne          a2, a6, .Lbr076                       #  4da: 679204
.Lbr075:    movi         a2, 0                                 #  4dd: 0c02
            j            .Lbr051                               #  4df: 46c8ff
.Lbr076:    addi         a3, a2, -16                           #  4e2: 32c2f0
            addi         a2, a2, -15                           #  4e5: 22c2f1
            movgez       a2, a3, a3                            #  4e8: 3023b3
            srai         a2, a2, 1                             #  4eb: 202121
            addx2        a2, a2, a2                            #  4ee: 202290
            j            .Lbr051                               #  4f1: c6c3ff
.Lbr077:    movi         a4, 26                                #  4f4: 1ca4
            bgeu         a4, a2, .Lbr078                       #  4f6: 27b402
            bne          a2, a6, .Lbr079                       #  4f9: 679204
.Lbr078:    movi         a2, 0                                 #  4fc: 0c02
            j            .Lbr051                               #  4fe: 86c0ff
.Lbr079:    addi         a3, a2, -26                           #  501: 32c2e6
            addi         a2, a2, -25                           #  504: 22c2e7
            movgez       a2, a3, a3                            #  507: 3023b3
            srai         a2, a2, 1                             #  50a: 202121
            addx2        a2, a2, a2                            #  50d: 202290
            j            .Lbr051                               #  510: 06bcff
.Lbr080:    movi         a4, 14                                #  513: 0ce4
            bgeu         a4, a2, .Lbr081                       #  515: 27b402
            bne          a2, a6, .Lbr082                       #  518: 679204
.Lbr081:    movi         a2, 0                                 #  51b: 0c02
            j            .Lbr051                               #  51d: c6b8ff
.Lbr082:    addi         a3, a2, -14                           #  520: 32c2f2
            addi         a2, a2, -13                           #  523: 22c2f3
            movgez       a2, a3, a3                            #  526: 3023b3
            srai         a2, a2, 1                             #  529: 202121
            addx2        a2, a2, a2                            #  52c: 202290
            j            .Lbr051                               #  52f: 46b4ff
.Lbr083:    bltui        a2, 12, .Lbr084                       #  532: b6a202
            bne          a2, a6, .Lbr085                       #  535: 679204
.Lbr084:    movi         a2, 0                                 #  538: 0c02
            j            .Lbr051                               #  53a: 86b1ff
.Lbr085:    addi         a3, a2, -11                           #  53d: 32c2f5
            addi         a2, a2, -10                           #  540: 22c2f6
            movgez       a2, a3, a3                            #  543: 3023b3
            srai         a2, a2, 1                             #  546: 202121
            addx2        a2, a2, a2                            #  549: 202290
            j            .Lbr051                               #  54c: 06adff
.Lbr086:    movi         a4, 10                                #  54f: 0ca4
            bgeu         a4, a2, .Lbr087                       #  551: 27b402
            bne          a2, a6, .Lbr088                       #  554: 679204
.Lbr087:    movi         a2, 0                                 #  557: 0c02
            j            .Lbr051                               #  559: c6a9ff
.Lbr088:    addi         a3, a2, -10                           #  55c: 32c2f6
            addi         a2, a2, -9                            #  55f: 22c2f7
            movgez       a2, a3, a3                            #  562: 3023b3
            srai         a2, a2, 1                             #  565: 202121
            addx2        a2, a2, a2                            #  568: 202290
            j            .Lbr051                               #  56b: 46a5ff

            .literal_position                                  #  570: 000af23f
                                                               #  574: 9f860100
                                                               #  578: 00000000
                                                               #  57c: 00000000
                                                               #  580: 00093d00
                                                               #  584: 20a10700
                                                               #  588: 000af23f
                                                               #  58c: a0860100
                                                               #  590: 00000000

# Function @ .text+0x594
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
.Lfunc010:  addi         sp, sp, -32 /* (local0) */            #  594: 12c1e0
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  597: d931
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  599: 0911
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  59b: e941
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  59d: c921
            mov          a12, a2 /* arg0 */                    #  59f: cd02
            movi         a14, 0x3ff20a00                       #  5a1: e1f3ff
            memw                                               #  5a4: c02000
            l32i         a13, a14, 0x200 /* [0x3ff20c00] */    #  5a7: d22e80
            l32i         a3, a2, 52 /* [arg0+0x34] */          #  5aa: 38d2
            mov          a2, a13 /* [0x3ff20c00] */            #  5ac: 2d0d
            call0        .Lfunc001                             #  5ae: 05a5ff
            l32i         a3, a12, 36 /* [arg0+0x24] */         #  5b1: 389c
            movi         a0, 99 /* 0x00000063 */               #  5b3: 02a063
            beqz         a3, .Lbr097                           #  5b6: 16c30d
            l32i         a4, a12, 56 /* [arg0+0x38] */         #  5b9: 48ec
            movi         a5, 0x0001869f                        #  5bb: 51eeff
            bltu         a0, a4, .Lbr089                       #  5be: 473005
            bltu         a5, a2, .Lbr089                       #  5c1: 273502
            j            .Lbr097                               #  5c4: 863300
.Lbr089:    s32i         a13, a12, 52 /* [0x3ff20c00] -> [arg0+0x34] */ #  5c7: d9dc
            movi         a14, .Ldata006                        #  5c9: e1ebff
            l32i         a2, a12, 40 /* [arg0+0x28] */         #  5cc: 28ac
            l32i         a4, a14, 0 /* [.Ldata006] */          #  5ce: 480e
            slli         a2, a2, 7                             #  5d0: 902211
            addi         a4, a4, 1 /* [.Ldata006]+0x1 */       #  5d3: 1b44
            s32i         a4, a14, 0 /* [.Ldata006]+0x1 -> [.Ldata006] */ #  5d5: 490e
            call0        __udivsi3                             #  5d7: 01eeffc0
                                                               #  5db: 0000
            extui        a2, a2, 0, 8                          #  5dd: 202074
            l8ui         a0, a12, 23 /* [arg0+0x17] */         #  5e0: 020c17
            s8i          a2, a12, 22 /* a2 -> [arg0+0x16] */   #  5e3: 224c16
            beqz         a0, .Lbr094                           #  5e6: 168007
            add          a5, a2, a0                            #  5e9: 0a52
            l32i         a3, a12, 48 /* [arg0+0x30] */         #  5eb: 38cc
            mov          a2, a13 /* [0x3ff20c00] */            #  5ed: 2d0d
            srai         a5, a5, 1                             #  5ef: 505121
            s8i          a5, a12, 23 /* a5 -> [arg0+0x17] */   #  5f2: 524c17
            call0        .Lfunc001                             #  5f5: 85a0ff
            l8ui         a14, a12, 23 /* [arg0+0x17] */        #  5f8: e20c17
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  5fb: 2901
            l32i         a3, a12, 96 /* [arg0+0x60] */         #  5fd: 322c18
            l8ui         a2, a12, 1 /* [arg0+0x1] */           #  600: 220c01
            l8ui         a3, a3, 0 /* [[arg0+0x60]] */         #  603: 320300
            call0        .Lfunc008                             #  606: c5d7ff
            l32i         a0, a12, 96 /* [arg0+0x60] */         #  609: 022c18
            extui        a2, a2, 1, 8                          #  60c: 202174
            l8ui         a3, a0, 9 /* [[arg0+0x60]+0x9] */     #  60f: 320009
            movi         a5, 64 /* 0x00000040 */               #  612: 4c05
            bnez         a3, .Lbr090                           #  614: ccd3
            movi         a4, 90 /* 0x0000005a */               #  616: 5ca4
            sub          a4, a4, a2                            #  618: 2044c0
            movi         a2, 1 /* 0x00000001 */                #  61b: 0c12
            bltu         a4, a14, .Lbr093                      #  61d: e7342f
            movi         a2, 0 /* 0x00000000 */                #  620: 0c02
            j            .Lbr093                               #  622: 860a00
.Lbr090:    bltu         a5, a3, .Lbr091                       #  625: 37350f
            movi         a6, 100 /* 0x00000064 */              #  628: 62a064
            sub          a6, a6, a2                            #  62b: 2066c0
            movi         a2, 1 /* 0x00000001 */                #  62e: 0c12
            bltu         a6, a14, .Lbr093                      #  630: e7361c
            movi         a2, 0 /* 0x00000000 */                #  633: 0c02
            j            .Lbr093                               #  635: c60500
.Lbr091:    movi         a6, 0 /* 0x00000000 */                #  638: 0c06
            movi         a7, 110 /* 0x0000006e */              #  63a: 72a06e
            sub          a7, a7, a2                            #  63d: 2077c0
            bgeu         a7, a14, .Lbr092                      #  640: e7b709
            sub          a8, a3, a2                            #  643: 2083c0
            addi         a8, a8, 2                             #  646: 2b88
            bgeu         a8, a14, .Lbr092                      #  648: e7b801
            movi         a6, 1 /* 0x00000001 */                #  64b: 0c16
.Lbr092:    extui        a2, a6, 0, 8                          #  64d: 602074
.Lbr093:    movi         a14, 1 /* 0x00000001 */               #  650: 0c1e
            beqz         a2, .Lbr098                           #  652: 16b204
            l32i         a10, sp, 0 /* [(local0)] */           #  655: a801
            l32i         a9, a12, 88 /* [arg0+0x58] */         #  657: 922c16
            bgeu         a9, a10, .Lbr098                      #  65a: a7b943
            mov          a0, a14 /* 0x00000001 */              #  65d: 0d0e
            j            .Lbr103                               #  65f: 062600
.Lbr094:    l32i         a0, a12, 96 /* [arg0+0x60] */         #  662: 022c18
            l8ui         a0, a0, 9 /* [[arg0+0x60]+0x9] */     #  665: 020009
            movi         a3, 128 /* 0x00000080 */              #  668: 32a080
            addx2        a0, a0, a0                            #  66b: 000090
            add          a0, a0, a3                            #  66e: 3a00
            extui        a0, a0, 2, 8                          #  670: 000274
            s8i          a0, a12, 23 /* a0 -> [arg0+0x17] */   #  673: 024c17
            bgeu         a0, a2, .Lbr095                       #  676: 27b007
            add          a3, a2, a0                            #  679: 0a32
            srai         a3, a3, 1                             #  67b: 303121
            s8i          a3, a12, 23 /* a3 -> [arg0+0x17] */   #  67e: 324c17
.Lbr095:    movi         a4, 0 /* 0x00000000 */                #  681: 0c04
            s32i         a4, a12, 40 /* 0x00000000 -> [arg0+0x28] */ #  683: 49ac
            s32i         a4, a12, 36 /* 0x00000000 -> [arg0+0x24] */ #  685: 499c
            s32i         a4, a12, 56 /* 0x00000000 -> [arg0+0x38] */ #  687: 49ec
.Lbr096:    l32i         a12, sp, 8 /* [(local2)] */           #  689: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  68b: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  68d: e841
            l32i         a0, sp, 4 /* [(local1)] */            #  68f: 0811
            addi         sp, sp, 32 /* (top of frame) */       #  691: 12c120
            ret                                                #  694: 0df0
.Lbr097:    l32i         a2, a12, 72 /* [arg0+0x48] */         #  696: 222c12
            l32i         a3, a12, 52 /* [arg0+0x34] */         #  699: 38dc
            call0        .Lfunc001                             #  69b: 4596ff
            j            .Lbr096                               #  69e: c6f9ff
.Lbr098:    l8ui         a5, a0, 11 /* [[arg0+0x60]+0xb] */    #  6a1: 52000b
            movi         a6, .Ldata006                         #  6a4: 61b6ff
            bbsi         a5, 0, .Lbr099                        #  6a7: 07e507
            l32i         a6, a6, 0 /* [.Ldata006] */           #  6aa: 6806
            extui        a6, a6, 0, 2                          #  6ac: 606014
            bnez         a6, .Lbr095                           #  6af: 56e6fc
.Lbr099:    l8ui         a2, a12, 1 /* [arg0+0x1] */           #  6b2: 220c01
            l8ui         a3, a0, 0 /* [[arg0+0x60]] */         #  6b5: 320000
            call0        .Lfunc008                             #  6b8: 85ccff
            l8ui         a7, a12, 23 /* [arg0+0x17] */         #  6bb: 720c17
            l32i         a0, a12, 96 /* [arg0+0x60] */         #  6be: 022c18
            extui        a9, a2, 1, 8                          #  6c1: 209174
            l8ui         a8, a0, 9 /* [[arg0+0x60]+0x9] */     #  6c4: 820009
            l8ui         a2, a0, 11 /* [[arg0+0x60]+0xb] */    #  6c7: 22000b
            sub          a8, a8, a9                            #  6ca: 9088c0
            bge          a7, a8, .Lbr101                       #  6cd: 87a716
            bbci         a2, 0, .Lbr100                        #  6d0: 07620e
            l32i         a0, a12, 88 /* [arg0+0x58] */         #  6d3: 022c16
            movi         a10, 0x003d0900                       #  6d6: a1aaff
            bltu         a10, a0, .Lbr100                      #  6d9: 073a05
            slli         a11, a0, 1                            #  6dc: f0b011
            s32i         a11, a12, 88 /* a11 -> [arg0+0x58] */ #  6df: b26c16
.Lbr100:    movi         a0, 2 /* 0x00000002 */                #  6e2: 0c20
            j            .Lbr103                               #  6e4: c60400
.Lbr101:    bbci         a2, 0, .Lbr102                        #  6e7: 07620e
            movi         a3, 0x0007a120                        #  6ea: 31a6ff
            movi         a4, 254 /* 0x000000fe */              #  6ed: 42a0fe
            and          a4, a2, a4                            #  6f0: 404210
            s8i          a4, a0, 11 /* a4 -> [[arg0+0x60]+0xb] */ #  6f3: 42400b
            s32i         a3, a12, 88 /* 0x0007a120 -> [arg0+0x58] */ #  6f6: 326c16
.Lbr102:    movi         a0, 0 /* 0x00000000 */                #  6f9: 0c00
.Lbr103:    bnei         a0, 1, .Lbr105                        #  6fb: 661030
            mov          a2, a12 /* arg0 */                    #  6fe: 2d0c
            call0        .Lfunc005                             #  700: 059bff
            l32i         a0, a12, 96 /* [arg0+0x60] */         #  703: 022c18
            l8ui         a5, a12, 4 /* [arg0+0x4] */           #  706: 520c04
            l8ui         a6, a0, 10 /* [[arg0+0x60]+0xa] */    #  709: 62000a
            bltu         a5, a6, .Lbr104                       #  70c: 673502
            j            .Lbr095                               #  70f: 86dbff
.Lbr104:    addi         a9, a0, -12 /* [arg0+0x60]-0xc */     #  712: 92c0f4
            s32i         a9, a12, 96 /* [arg0+0x60]-0xc -> [arg0+0x60] */ #  715: 926c18
            l8ui         a8, a9, 11 /* [[arg0+0x60]-0x1] */    #  718: 82090b
            or           a8, a8, a14                           #  71b: e08820
            s8i          a8, a9, 11 /* a8 -> [[arg0+0x60]-0x1] */ #  71e: 82490b
            memw                                               #  721: c02000
            movi         a7, 0x3ff20a00                        #  724: 7199ff
            l32i         a7, a7, 0x200 /* [0x3ff20c00] */      #  727: 722780
            s32i         a7, a12, 48 /* [0x3ff20c00] -> [arg0+0x30] */ #  72a: 79cc
            j            .Lbr095                               #  72c: 46d4ff
.Lbr105:    addi         a9, a0, -2                            #  72f: 92c0fe
            bnez         a9, .Lbr095                           #  732: 56b9f4
            mov          a2, a13 /* [0x3ff20c00] */            #  735: 2d0d
            l32i         a3, a12, 44 /* [arg0+0x2c] */         #  737: 38bc
            call0        .Lfunc001                             #  739: 458cff
            movi         a10, 0x000186a0                       #  73c: a194ff
            bltu         a10, a2, .Lbr106                      #  73f: 273a02
            j            .Lbr095                               #  742: c6ceff
.Lbr106:    mov          a2, a12 /* arg0 */                    #  745: 2d0c
            movi         a3, 1 /* 0x00000001 */                #  747: 0c13
            call0        .Lfunc006                             #  749: c598ff
            j            .Lbr095                               #  74c: 46ccff

            .balign      4
# Function @ .text+0x750
            .balign      4
            .global      sdk_rcReachRetryLimit
            .type        sdk_rcReachRetryLimit, @function
sdk_rcReachRetryLimit:
            l8ui         a3, a2, 4 /* [arg0+0x4] */            #  750: 320204
            l32i         a4, a2, 20 /* [arg0+0x14] */          #  753: 4852
            movi         a2, 1 /* 0x00000001 */                #  755: 0c12
            l8ui         a4, a4, 8 /* [[arg0+0x14]+0x8] */     #  757: 420408
            srli         a3, a3, 4                             #  75a: 303441
            bge          a3, a4, .Lbr107                       #  75d: 47a301
            movi         a2, 0 /* 0x00000000 */                #  760: 0c02
.Lbr107:    ret                                                #  762: 0df0

            .literal_position                                  #  764: 00000000

# Function @ .text+0x768
            .balign      4
            .global      sdk_trc_NeedRTS
            .type        sdk_trc_NeedRTS, @function
sdk_trc_NeedRTS:
            l32i         a5, a2, 32 /* [arg0+0x20] */          #  768: 5882
            l8ui         a5, a5, 8 /* [[arg0+0x20]+0x8] */     #  76a: 520508
            beqz         a5, .Lbr108                           #  76d: bce5
            beqi         a5, 1, .Lbr111                        #  76f: 261552
            beqi         a5, 5, .Lbr111                        #  772: 26554f
            addi         a6, a5, -10 /* [[arg0+0x20]+0x8]-0xa */ #  775: 62c5f6
            beqz         a6, .Lbr115                           #  778: 165607
            movi         a7, 11 /* 0x0000000b */               #  77b: 0cb7
            beq          a5, a7, .Lbr113                       #  77d: 77155a
            addi         a8, a5, -15 /* [[arg0+0x20]+0x8]-0xf */ #  780: 82c5f1
            beqz         a8, .Lbr117                           #  783: 160808
            beqi         a5, 16, .Lbr113                       #  786: 26b551
            movi         a9, 17 /* 0x00000011 */               #  789: 1c19
            beq          a5, a9, .Lbr115                       #  78b: 971562
            movi         a10, 24 /* 0x00000018 */              #  78e: 1c8a
            beq          a5, a10, .Lbr113                      #  790: a71547
            movi         a11, 25 /* 0x00000019 */              #  793: 1c9b
            beq          a5, a11, .Lbr115                      #  795: b71558
            l16ui        a5, a2, 22 /* [arg0+0x16] */          #  798: 52120b
            l16ui        a4, a2, 20 /* [arg0+0x14] */          #  79b: 42120a
            movi         a3, sdk_lmacConfMib                   #  79e: 31f1ff
            movi         a2, 1 /* 0x00000001 */                #  7a1: 0c12
            l16ui        a3, a3, 10 /* [sdk_lmacConfMib+0xa] */ #  7a3: 321305
            add          a4, a4, a5                            #  7a6: 5a44
            blt          a3, a4, .Lbr110                       #  7a8: 472317
            movi         a2, 0 /* 0x00000000 */                #  7ab: 0c02
            ret           /* 0x00000000 */                     #  7ad: 0df0
.Lbr108:    movi         a5, 1 /* 0x00000001 */                #  7af: 0c15
            l16ui        a8, a2, 22 /* [arg0+0x16] */          #  7b1: 82120b
            l16ui        a7, a2, 20 /* [arg0+0x14] */          #  7b4: 72120a
            movi         a6, 625 /* 0x00000271 */              #  7b7: 62a271
            add          a7, a7, a8                            #  7ba: 8a77
            blt          a6, a7, .Lbr109                       #  7bc: 772601
            movi         a5, 0 /* 0x00000000 */                #  7bf: 0c05
.Lbr109:    mov          a2, a5                                #  7c1: 2d05
.Lbr110:    ret                                                #  7c3: 0df0
.Lbr111:    movi         a5, 1 /* 0x00000001 */                #  7c5: 0c15
            l16ui        a11, a2, 22 /* [arg0+0x16] */         #  7c7: b2120b
            l16ui        a10, a2, 20 /* [arg0+0x14] */         #  7ca: a2120a
            movi         a9, 1000 /* 0x000003e8 */             #  7cd: 92a3e8
            add          a10, a10, a11                         #  7d0: baaa
            blt          a9, a10, .Lbr112                      #  7d2: a72901
            movi         a5, 0 /* 0x00000000 */                #  7d5: 0c05
.Lbr112:    mov          a2, a5                                #  7d7: 2d05
            ret                                                #  7d9: 0df0
.Lbr113:    movi         a5, 1 /* 0x00000001 */                #  7db: 0c15
            l16ui        a6, a2, 22 /* [arg0+0x16] */          #  7dd: 62120b
            l16ui        a4, a2, 20 /* [arg0+0x14] */          #  7e0: 42120a
            movi         a3, 700 /* 0x000002bc */              #  7e3: 32a2bc
            add          a4, a4, a6                            #  7e6: 6a44
            blt          a3, a4, .Lbr114                       #  7e8: 472301
            movi         a5, 0 /* 0x00000000 */                #  7eb: 0c05
.Lbr114:    mov          a2, a5                                #  7ed: 2d05
            ret                                                #  7ef: 0df0
.Lbr115:    movi         a5, 1 /* 0x00000001 */                #  7f1: 0c15
            l16ui        a9, a2, 22 /* [arg0+0x16] */          #  7f3: 92120b
            l16ui        a8, a2, 20 /* [arg0+0x14] */          #  7f6: 82120a
            movi         a7, 1120 /* 0x00000460 */             #  7f9: 72a460
            add          a8, a8, a9                            #  7fc: 9a88
            blt          a7, a8, .Lbr116                       #  7fe: 872701
            movi         a5, 0 /* 0x00000000 */                #  801: 0c05
.Lbr116:    mov          a2, a5                                #  803: 2d05
            ret                                                #  805: 0df0
.Lbr117:    movi         a5, 1 /* 0x00000001 */                #  807: 0c15
            l16ui        a3, a2, 22 /* [arg0+0x16] */          #  809: 32120b
            l16ui        a11, a2, 20 /* [arg0+0x14] */         #  80c: b2120a
            movi         a10, 1050 /* 0x0000041a */            #  80f: a2a41a
            add          a11, a11, a3                          #  812: 3abb
            blt          a10, a11, .Lbr118                     #  814: b72a01
            movi         a5, 0 /* 0x00000000 */                #  817: 0c05
.Lbr118:    mov          a2, a5                                #  819: 2d05
            ret                                                #  81b: 0df0

            .section     .data, "aw", @progbits

.Ldata001:  .byte        0x0b, 0x02, 0x0b, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
.Ldata002:  .byte        0x0c, 0x02, 0x08, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x72, 0x00, 0x00, 0x08, 0x02, 0x0d, 0x02
            .byte        0x0b, 0x02, 0x00, 0x05, 0x0b, 0x65, 0x00, 0x00
            .byte        0x0d, 0x02, 0x09, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x5c, 0x00, 0x00, 0x09, 0x02, 0x0e, 0x02
            .byte        0x0b, 0x02, 0x00, 0x05, 0x0b, 0x58, 0x00, 0x00
            .byte        0x0e, 0x02, 0x0a, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x52, 0x00, 0x00, 0x0a, 0x02, 0x0f, 0x02
            .byte        0x0b, 0x02, 0x0b, 0x05, 0x0b, 0x4b, 0x00, 0x00
            .byte        0x0f, 0x02, 0x0b, 0x02, 0x0b, 0x02, 0x0b, 0x05
            .byte        0x0b, 0x38, 0x00, 0x00
.Label001:  .byte        0x0b, 0x02, 0x0b, 0x02, 0x0b, 0x02, 0x0b, 0x05
            .byte        0x0b, 0x40, 0x00, 0x00
.Ldata003:  .byte        0x0c, 0x02, 0x08, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x72, 0x00, 0x00, 0x08, 0x02, 0x0d, 0x02
            .byte        0x0b, 0x02, 0x00, 0x05, 0x0b, 0x65, 0x00, 0x00
            .byte        0x0d, 0x02, 0x09, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x5c, 0x00, 0x00, 0x09, 0x02, 0x0e, 0x02
            .byte        0x0b, 0x02, 0x00, 0x05, 0x0b, 0x58, 0x00, 0x00
            .byte        0x0e, 0x02, 0x0a, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x52, 0x00, 0x00, 0x0a, 0x02, 0x0b, 0x02
            .byte        0x05, 0x02, 0x00, 0x05, 0x0b, 0x4b, 0x00, 0x00
            .byte        0x0f, 0x02, 0x0b, 0x02, 0x05, 0x02, 0x00, 0x05
            .byte        0x0b, 0x38, 0x00, 0x00
.Label002:  .byte        0x0b, 0x02, 0x05, 0x02, 0x00, 0x02, 0x00, 0x05
            .byte        0x0b, 0x40, 0x00, 0x00, 0x06, 0x02, 0x05, 0x02
            .byte        0x00, 0x02, 0x00, 0x05, 0x0b, 0x39, 0x00, 0x00
            .byte        0x05, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x05
            .byte        0x0b, 0x39, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02
            .byte        0x00, 0x02, 0x00, 0x05, 0x0b, 0x00, 0x00, 0x00
            .byte        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            .byte        0x00, 0x00, 0x00, 0x00
.Ldata004:  .byte        0x07, 0x02, 0x06, 0x02, 0x05, 0x02, 0x00, 0x05
            .byte        0x0b, 0x40, 0x00, 0x00, 0x06, 0x02, 0x05, 0x02
            .byte        0x00, 0x02, 0x00, 0x05, 0x0b, 0x39, 0x00, 0x00
            .byte        0x05, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x05
            .byte        0x0b, 0x39, 0x00, 0x00
.Label003:  .byte        0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x05
            .byte        0x0b, 0x00, 0x00, 0x00
.Ldata005:  .byte        0x1f, 0x02, 0x16, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x72, 0x00, 0x00, 0x17, 0x02, 0x15, 0x02
            .byte        0x0b, 0x02, 0x00, 0x05, 0x0b, 0x72, 0x00, 0x00
            .byte        0x16, 0x02, 0x14, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x72, 0x00, 0x00, 0x15, 0x02, 0x13, 0x02
            .byte        0x0b, 0x02, 0x00, 0x05, 0x0b, 0x60, 0x00, 0x00
            .byte        0x14, 0x02, 0x12, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x55, 0x00, 0x00, 0x13, 0x02, 0x12, 0x02
            .byte        0x0b, 0x02, 0x00, 0x05, 0x0b, 0x4b, 0x00, 0x00
            .byte        0x12, 0x02, 0x11, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x40, 0x00, 0x00, 0x11, 0x02, 0x0b, 0x02
            .byte        0x05, 0x02, 0x00, 0x05, 0x0b, 0x3b, 0x00, 0x00
            .byte        0x10, 0x02, 0x0b, 0x02, 0x05, 0x02, 0x00, 0x05
            .byte        0x0b, 0x32, 0x00, 0x00, 0x06, 0x02, 0x05, 0x02
            .byte        0x00, 0x02, 0x00, 0x05, 0x0b, 0x39, 0x00, 0x00
            .byte        0x05, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x05
            .byte        0x0b, 0x39, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02
            .byte        0x00, 0x02, 0x00, 0x05, 0x0b, 0x00, 0x00, 0x00
.Label004:  .byte        0x1f, 0x02, 0x16, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x72, 0x00, 0x00, 0x17, 0x02, 0x15, 0x02
            .byte        0x0b, 0x02, 0x00, 0x05, 0x0b, 0x72, 0x00, 0x00
            .byte        0x16, 0x02, 0x14, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x72, 0x00, 0x00, 0x15, 0x02, 0x13, 0x02
            .byte        0x0b, 0x02, 0x00, 0x05, 0x0b, 0x60, 0x00, 0x00
            .byte        0x14, 0x02, 0x12, 0x02, 0x0b, 0x02, 0x00, 0x05
            .byte        0x0b, 0x55, 0x00, 0x00, 0x13, 0x02, 0x12, 0x02
            .byte        0x0b, 0x02, 0x00, 0x05, 0x0b, 0x4b, 0x00, 0x00
            .byte        0x12, 0x02, 0x11, 0x02, 0x10, 0x02, 0x0b, 0x05
            .byte        0x0b, 0x40, 0x00, 0x00, 0x11, 0x02, 0x10, 0x02
            .byte        0x0b, 0x02, 0x0b, 0x05, 0x0b, 0x3b, 0x00, 0x00
            .byte        0x10, 0x02, 0x0b, 0x02, 0x0b, 0x02, 0x0b, 0x05
            .byte        0x0b, 0x32, 0x00, 0x00

            .section     .bss, "aw", @nobits

.Ldata006:  .word        0x00000000                            #    0: 00000000
.Ldata007:  .hword       0x0000                                #    4: 0000
            .byte        0x00, 0x00
.Ldata008:  .hword       0x0000                                #    8: 0000
            .balign      4
            .word        0x00000000                            #    c: 00000000
.Label005:  .space       600

            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
            .balign      4
.Lfunc011:  beqz         a3, .Lbr120                           #    0: 8cd3
            movi         a6, 0 /* 0x00000000 */                #    2: 0c06
.Lbr119:    s8i          a6, a2, 10                            #    4: 62420a
            addi         a2, a2, 12                            #    7: cb22
            addi         a6, a6, 1                             #    9: 1b66
            extui        a6, a6, 0, 8                          #    b: 606074
            bne          a3, a6, .Lbr119                       #    e: 6793f2
.Lbr120:    ret                                                #   11: 0df0

            .literal_position                                  #   14: 84000000
                                                               #   18: 24010000
                                                               #   1c: 70000000
                                                               #   20: 14000000
                                                               #   24: c4000000
                                                               #   28: b4000000

# Function @ .irom0.text+0x2c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_rcUpdatePhyMode
            .type        sdk_rcUpdatePhyMode, @function
sdk_rcUpdatePhyMode:
            movi         a8, 3 /* 0x00000003 */                #   2c: 0c38
            movi         a7, 0 /* 0x00000000 */                #   2e: 0c07
            addi         sp, sp, -16 /* (local0) */            #   30: 12c1f0
            movi         a6, .Lfunc004                         #   33: 61f8ff
            s8i          a3, a2, 21 /* arg1 -> [arg0+0x15] */  #   36: 324215
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   39: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   3b: c911
            movi         a0, .Label003                         #   3d: 01f6ff
            mov          a12, a2 /* arg0 */                    #   40: cd02
            l32i         a2, a2, 92 /* [arg0+0x5c] */          #   42: 222217
            addi         a9, a0, -36 /* .Ldata004 */           #   45: 92c0dc
            beqz         a2, .Lbr125                           #   48: 164207
            beqi         a2, 1, .Lbr122                        #   4b: 261231
            s32i         a9, a12, 104 /* .Ldata004 -> [arg0+0x68] */ #   4e: 926c1a
            s8i          a7, a12, 4 /* 0x00 -> [arg0+0x4] */   #   51: 724c04
            s8i          a8, a12, 5 /* 0x03 -> [arg0+0x5] */   #   54: 824c05
            s32i         a6, a12, 108 /* .Lfunc004 -> [arg0+0x6c] */ #   57: 626c1b
            s32i         a0, a12, 96 /* .Label003 -> [arg0+0x60] */ #   5a: 026c18
.Lbr121:    mov          a2, a12 /* arg0 */                    #   5d: 2d0c
            s32i         a0, a12, 100 /* a0 -> [arg0+0x64] */  #   5f: 026c19
            call0        .Lfunc005                             #   62: 01f1ffc0
                                                               #   66: 0000
            movi         a0, 127 /* 0x0000007f */              #   68: 02a07f
            s8i          a0, a12, 0 /* 0x7f -> [arg0] */       #   6b: 024c00
            s8i          a0, a12, 1 /* 0x7f -> [arg0+0x1] */   #   6e: 024c01
            s8i          a0, a12, 2 /* 0x7f -> [arg0+0x2] */   #   71: 024c02
            s8i          a0, a12, 3 /* 0x7f -> [arg0+0x3] */   #   74: 024c03
            l32i         a12, sp, 4 /* [(local1)] */           #   77: c811
            l32i         a0, sp, 0 /* [(local0)] */            #   79: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   7b: 12c110
            ret                                                #   7e: 0df0
.Lbr122:    s8i          a7, a12, 4 /* 0x00 -> [arg0+0x4] */   #   80: 724c04
            movi         a11, .Label002                        #   83: b1e8ff
            movi         a9, 7 /* 0x00000007 */                #   86: 0c79
            movi         a6, 10 /* 0x0000000a */               #   88: 0ca6
            movi         a5, .Ldata003                         #   8a: 51e4ff
            movi         a10, .Lfunc002                        #   8d: a1e4ff
            s32i         a10, a12, 108 /* .Lfunc002 -> [arg0+0x6c] */ #   90: a26c1b
            addi         a2, a5, -96 /* .Ldata002 */           #   93: 22c5a0
            movnez       a6, a9, a4                            #   96: 406993
            s8i          a6, a12, 5 /* a6 -> [arg0+0x5] */     #   99: 624c05
            moveqz       a2, a5, a4                            #   9c: 402583
            s32i         a2, a12, 104 /* a2 -> [arg0+0x68] */  #   9f: 226c1a
            bgei         a3, 12, .Lbr126                       #   a2: e6a32c
            movi         a0, 10 /* 0x0000000a */               #   a5: 0ca0
.Lbr123:    beqz         a4, .Lbr124                           #   a7: 8c34
            bltui        a0, 8, .Lbr124                        #   a9: b68001
            movi         a0, 7 /* 0x00000007 */                #   ac: 0c70
.Lbr124:    addx2        a0, a0, a0                            #   ae: 000090
            addx4        a0, a0, a2                            #   b1: 2000a0
            s32i         a0, a12, 96 /* a0 -> [arg0+0x60] */   #   b4: 026c18
            addi         a0, a11, -96 /* .Label001 */          #   b7: 02cba0
            moveqz       a0, a11, a4                           #   ba: 400b83
            j            .Lbr121                               #   bd: 06e7ff
.Lbr125:    s32i         a9, a12, 104 /* .Ldata004 -> [arg0+0x68] */ #   c0: 926c1a
            s8i          a7, a12, 4 /* 0x00 -> [arg0+0x4] */   #   c3: 724c04
            s8i          a8, a12, 5 /* 0x03 -> [arg0+0x5] */   #   c6: 824c05
            s32i         a6, a12, 108 /* .Lfunc004 -> [arg0+0x6c] */ #   c9: 626c1b
            s32i         a0, a12, 96 /* .Label003 -> [arg0+0x60] */ #   cc: 026c18
            j            .Lbr121                               #   cf: 86e2ff
.Lbr126:    movi         a5, 16 /* 0x00000010 */               #   d2: 1c05
            blt          a5, a3, .Lbr127                       #   d4: 372504
            movi         a0, 5 /* 0x00000005 */                #   d7: 0c50
            j            .Lbr123                               #   d9: 86f2ff
.Lbr127:    movi         a6, 21 /* 0x00000015 */               #   dc: 1c56
            blt          a6, a3, .Lbr128                       #   de: 372604
            mov          a0, a8 /* 0x00000003 */               #   e1: 0d08
            j            .Lbr123                               #   e3: 06f0ff
.Lbr128:    movi         a0, 2 /* 0x00000002 */                #   e6: 0c20
            movi         a8, 30 /* 0x0000001e */               #   e8: 1ce8
            blt          a3, a8, .Lbr123                       #   ea: 8723b9
            mov          a0, a7 /* 0x00000000 */               #   ed: 0d07
            j            .Lbr123                               #   ef: 06edff

            .literal_position                                  #   f4: 00000000
                                                               #   f8: 30010000
                                                               #   fc: c0010000
                                                               #  100: 70000000
                                                               #  104: 10000000
                                                               #  108: 00010000

# Function @ .irom0.text+0x10c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_rcAttach
            .type        sdk_rcAttach, @function
sdk_rcAttach:
            movi         a4, .Ldata006                         #  10c: 41faff
            movi         a5, 0 /* 0x00000000 */                #  10f: 0c05
            addi         sp, sp, -16 /* (local0) */            #  111: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  114: 0901
            s16i         a5, a4, 4 /* 0x0000 -> [.Ldata007] */ #  116: 525402
            addi         a0, a4, 8 /* .Ldata008 */             #  119: 8b04
            addi         a4, a4, 12 /* .bss+0xc */             #  11b: cb44
.Lbr129:    s16i         a5, a0, 0                             #  11d: 525000
            addi         a0, a0, 2                             #  120: 2b00
            bne          a0, a4, .Lbr129                       #  122: 4790f7
            movi         a2, .Ldata005                         #  125: 21f4ff
            movi         a3, 12 /* 0x0000000c */               #  128: 0cc3
            call0        .Lfunc011                             #  12a: 45edff
            movi         a2, .Label004                         #  12d: 21f3ff
            movi         a3, 9 /* 0x00000009 */                #  130: 0c93
            call0        .Lfunc011                             #  132: c5ecff
            movi         a2, .Ldata003                         #  135: 21f2ff
            movi         a3, 11 /* 0x0000000b */               #  138: 0cb3
            call0        .Lfunc011                             #  13a: 45ecff
            movi         a2, .Ldata002                         #  13d: 21f1ff
            movi         a3, 8 /* 0x00000008 */                #  140: 0c83
            call0        .Lfunc011                             #  142: c5ebff
            movi         a2, .Ldata004                         #  145: 21f0ff
            movi         a3, 4 /* 0x00000004 */                #  148: 0c43
            call0        .Lfunc011                             #  14a: 45ebff
            l32i         a0, sp, 0 /* [(local0)] */            #  14d: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  14f: 12c110
            ret                                                #  152: 0df0

            .literal_position                                  #  154: 10000000

# Function @ .irom0.text+0x158
            .balign      4
            .global      sdk_rcGetTrc
            .type        sdk_rcGetTrc, @function
sdk_rcGetTrc:
            movi         a2, .Label005                         #  158: 21ffff
            ret           /* .Label005 */                      #  15b: 0df0

            .balign      4
# Function @ .irom0.text+0x160
            .balign      4
            .global      sdk_trc_onDisconnect
            .type        sdk_trc_onDisconnect, @function
sdk_trc_onDisconnect:
            ret           /* arg0 */                           #  160: 0df0

            .balign      4
# Function @ .irom0.text+0x164
            .balign      4
            .global      sdk_trc_onScanStart
            .type        sdk_trc_onScanStart, @function
sdk_trc_onScanStart:
            beqz         a2, .Lbr130                           #  164: 9ca2
            l8ui         a3, a2, 20 /* [arg0+0x14] */          #  166: 320214
            movi         a4, 254 /* 0x000000fe */              #  169: 42a0fe
            and          a3, a3, a4                            #  16c: 403310
            movi         a4, 1 /* 0x00000001 */                #  16f: 0c14
            or           a3, a3, a4                            #  171: 403320
            movi         a4, 251 /* 0x000000fb */              #  174: 42a0fb
            and          a3, a3, a4                            #  177: 403310
            movi         a4, 4 /* 0x00000004 */                #  17a: 0c44
            or           a3, a3, a4                            #  17c: 403320
            s8i          a3, a2, 20 /* a3 -> [arg0+0x14] */    #  17f: 324214
.Lbr130:    ret           /* arg0 */                           #  182: 0df0

# Function @ .irom0.text+0x184
            .balign      4
            .global      sdk_trc_onScanDone
            .type        sdk_trc_onScanDone, @function
sdk_trc_onScanDone:
            beqz         a2, .Lbr131                           #  184: 9c02
            l8ui         a3, a2, 20 /* [arg0+0x14] */          #  186: 320214
            movi         a4, 254 /* 0x000000fe */              #  189: 42a0fe
            and          a3, a3, a4                            #  18c: 403310
            movi         a4, 251 /* 0x000000fb */              #  18f: 42a0fb
            and          a3, a3, a4                            #  192: 403310
            s8i          a3, a2, 20 /* a3 -> [arg0+0x14] */    #  195: 324214
.Lbr131:    ret           /* arg0 */                           #  198: 0df0

            .literal_position                                  #  19c: 10000000
                                                               #  1a0: 00000000
                                                               #  1a4: 08000000
                                                               #  1a8: 18000000
                                                               #  1ac: 00000000
                                                               #  1b0: 00000000
                                                               #  1b4: 00000000
                                                               #  1b8: 00000000
                                                               #  1bc: 00000000

# Function @ .irom0.text+0x1c0
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
            .global      sdk_rc_enable_trc
            .type        sdk_rc_enable_trc, @function
sdk_rc_enable_trc:
            movi         a9, 1 /* 0x00000001 */                #  1c0: 0c19
            ssr          a4                                    #  1c2: 000440
            movi         a7, .Label005                         #  1c5: 71f5ff
            addi         sp, sp, -48 /* (local0) */            #  1c8: 12c1d0
            s32i         a13, sp, 20 /* a13 -> [(local5)] */   #  1cb: d951
            s32i         a5, sp, 4 /* arg3 -> [(local1)] */    #  1cd: 5911
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    #  1cf: 3901
            s32i         a14, sp, 24 /* a14 -> [(local6)] */   #  1d1: e961
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   #  1d3: c941
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     #  1d5: 0931
            mov          a12, a4                               #  1d7: cd04
            addi         a8, a7, -16 /* .Ldata006 */           #  1d9: 82c7f0
            l16ui        a0, a8, 4 /* [.Ldata007] */           #  1dc: 021802
            addi         a4, a7, -8 /* .Ldata008 */            #  1df: 42c7f8
            addx2        a4, a2, a4                            #  1e2: 404290
            l16ui        a14, a4, 0                            #  1e5: e21400
            srl          a6, a0                                #  1e8: 006091
            bbci         a6, 0, .Lbr133                        #  1eb: 07663c
            s32i         a4, sp, 28 /* a4 -> [(local7)] */     #  1ee: 4971
            s32i         a0, sp, 32 /* [.Ldata007] -> [(local8)] */ #  1f0: 0981
            ssr          a12                                   #  1f2: 000c40
            srl          a5, a14                               #  1f5: e05091
            bbci         a5, 0, .Lbr132                        #  1f8: 076521
            l32i         a3, sp, 0 /* [(local0)] */            #  1fb: 3801
            movi         a4, 6 /* 0x00000006 */                #  1fd: 0c64
            movi         a13, 120 /* 0x00000078 */             #  1ff: d2a078
            mul16u       a13, a13, a12                         #  202: c0ddc1
            add          a13, a7, a13                          #  205: dad7
            addi         a2, a13, 26                           #  207: 22cd1a
            s32i         a2, sp, 8 /* a2 -> [(local2)] */      #  20a: 2921
            call0        memcmp                                #  20c: 01e8ffc0
                                                               #  210: 0000
            l32i         a0, sp, 32 /* [(local8)] */           #  212: 0881
            l32i         a4, sp, 28 /* [(local7)] */           #  214: 4871
            movi         a8, .Ldata006                         #  216: 81e2ff
            movi         a9, 1 /* 0x00000001 */                #  219: 0c19
            beqz         a2, .Lbr134                           #  21b: 9cb2
.Lbr132:    movi         a2, .Lstr002                          #  21d: 21e1ff
            call0        printf                                #  220: 01e4ffc0
                                                               #  224: 0000
            movi         a13, 0 /* 0x00000000 */               #  226: 0c0d
            j            .Lbr135                               #  228: 861200
.Lbr133:    addi         a3, a7, 26 /* .bss+0x2a */            #  22b: 32c71a
            movi         a2, 120 /* 0x00000078 */              #  22e: 22a078
            mul16u       a2, a2, a12                           #  231: c022c1
            add          a13, a2, a7                           #  234: 7ad2
            add          a2, a2, a3                            #  236: 3a22
            s32i         a2, sp, 8 /* a2 -> [(local2)] */      #  238: 2921
.Lbr134:    ssl          a12                                   #  23a: 001c40
            mov          a2, a13                               #  23d: 2d0d
            sll          a3, a9                                #  23f: 0039a1
            or           a5, a3, a0                            #  242: 005320
            or           a3, a3, a14                           #  245: e03320
            s16i         a5, a8, 4 /* a5 -> [.Ldata007] */     #  248: 525802
            s16i         a3, a4, 0                             #  24b: 325400
            movi         a3, 120 /* 0x00000078 */              #  24e: 32a078
            call0        bzero                                 #  251: 01d8ffc0
                                                               #  255: 0000
            s8i          a12, a13, 118                         #  257: c24d76
            l32i         a2, sp, 8 /* [(local2)] */            #  25a: 2821
            l32i         a3, sp, 0 /* [(local0)] */            #  25c: 3801
            movi         a4, 6 /* 0x00000006 */                #  25e: 0c64
            l32i         a6, sp, 4 /* [(local1)] */            #  260: 6811
            s16i         a6, a13, 32                           #  262: 625d10
            call0        memcpy                                #  265: 01d4ffc0
                                                               #  269: 0000
            mov          a3, a12                               #  26b: 3d0c
            movi         a2, .Lstr003                          #  26d: 21ceff
            call0        printf                                #  270: 01d3ffc0
                                                               #  274: 0000
.Lbr135:    l32i         a0, sp, 12 /* [(local3)] */           #  276: 0831
            l32i         a12, sp, 16 /* [(local4)] */          #  278: c841
            mov          a2, a13                               #  27a: 2d0d
            l32i         a14, sp, 24 /* [(local6)] */          #  27c: e861
            l32i         a13, sp, 20 /* [(local5)] */          #  27e: d851
            addi         sp, sp, 48 /* (top of frame) */       #  280: 12c130
            ret                                                #  283: 0df0

            .literal_position                                  #  288: 00000000

# Function @ .irom0.text+0x28c
            .balign      4
            .global      sdk_rc_get_mask
            .type        sdk_rc_get_mask, @function
sdk_rc_get_mask:
            movi         a2, .Ldata006                         #  28c: 21ffff
            l8ui         a2, a2, 4 /* [.Ldata007] */           #  28f: 220204
            ret           /* [.Ldata007] */                    #  292: 0df0

            .literal_position                                  #  294: 08000000
                                                               #  298: 00000000
                                                               #  29c: 20000000
                                                               #  2a0: 2c000000
                                                               #  2a4: 00000000
                                                               #  2a8: 00000000
                                                               #  2ac: 00000000

# Function @ .irom0.text+0x2b0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_rc_disable_trc
            .type        sdk_rc_disable_trc, @function
sdk_rc_disable_trc:
            addi         sp, sp, -16 /* (local0) */            #  2b0: 12c1f0
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  2b3: 0921
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  2b5: c931
            movi         a0, .Ldata008                         #  2b7: 01f7ff
            mov          a12, a4 /* arg2 */                    #  2ba: cd04
            ssr          a12                                   #  2bc: 000c40
            addx2        a4, a2, a0                            #  2bf: 004290
            s32i         a4, sp, 0 /* a4 -> [(local0)] */      #  2c2: 4901
            l16ui        a4, a4, 0                             #  2c4: 421400
            s32i         a4, sp, 4 /* a4 -> [(local1)] */      #  2c7: 4911
            srl          a4, a4                                #  2c9: 404091
            bbci         a4, 0, .Lbr136                        #  2cc: 076445
            addi         a2, a0, 8 /* .Label005 */             #  2cf: 8b20
            movi         a4, 120 /* 0x00000078 */              #  2d1: 42a078
            mul16s       a4, a4, a12                           #  2d4: c044d1
            add          a2, a2, a4                            #  2d7: 4a22
            addi         a2, a2, 26                            #  2d9: 22c21a
            movi         a4, 6 /* 0x00000006 */                #  2dc: 0c64
            call0        memcmp                                #  2de: 01f1ffc0
                                                               #  2e2: 0000
            bnez         a2, .Lbr136                           #  2e4: ecd2
            movi         a2, .Lstr004                          #  2e6: 21edff
            l32i         a9, sp, 0 /* [(local0)] */            #  2e9: 9801
            movi         a8, -1 /* 0xffffffff */               #  2eb: 7cf8
            movi         a6, .Ldata006                         #  2ed: 61eaff
            ssl          a12                                   #  2f0: 001c40
            movi         a7, 1 /* 0x00000001 */                #  2f3: 0c17
            sll          a7, a7                                #  2f5: 0077a1
            l16ui        a5, a6, 4 /* [.Ldata007] */           #  2f8: 521602
            xor          a7, a7, a8                            #  2fb: 807730
            l32i         a8, sp, 4 /* [(local1)] */            #  2fe: 8811
            and          a5, a5, a7                            #  300: 705510
            s16i         a5, a6, 4 /* a5 -> [.Ldata007] */     #  303: 525602
            and          a8, a8, a7                            #  306: 708810
            s16i         a8, a9, 0 /* a8 -> [[(local0)]] */    #  309: 825900
            call0        printf                                #  30c: 01e7ffc0
                                                               #  310: 0000
            j            .Lbr137                               #  312: 060200
.Lbr136:    movi         a2, .Lstr005                          #  315: 21e2ff
            call0        printf                                #  318: 01e5ffc0
                                                               #  31c: 0000
.Lbr137:    l32i         a12, sp, 12 /* [(local3)] */          #  31e: c831
            l32i         a0, sp, 8 /* [(local2)] */            #  320: 0821
            addi         sp, sp, 16 /* (top of frame) */       #  322: 12c110
            ret                                                #  325: 0df0

            .literal_position                                  #  328: 00000000

# Function @ .irom0.text+0x32c
            .balign      4
            .global      sdk_rc_disable_trc_by_interface
            .type        sdk_rc_disable_trc_by_interface, @function
sdk_rc_disable_trc_by_interface:
            movi         a6, .Ldata006                         #  32c: 61ffff
            movi         a3, 0 /* 0x00000000 */                #  32f: 0c03
            l16ui        a7, a6, 4 /* [.Ldata007] */           #  331: 721602
            addi         a4, a6, 8 /* .Ldata008 */             #  334: 8b46
            addx2        a4, a2, a4                            #  336: 404290
            l16ui        a5, a4, 0                             #  339: 521400
            s16i         a3, a4, 0                             #  33c: 325400
            xor          a5, a5, a7                            #  33f: 705530
            s16i         a5, a6, 4 /* a5 -> [.Ldata007] */     #  342: 525602
            ret           /* arg0 */                           #  345: 0df0

            .literal_position                                  #  348: 08000000
                                                               #  34c: 10000000
                                                               #  350: 00000000

# Function @ .irom0.text+0x354
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_rc_get_sta_trc
            .type        sdk_rc_get_sta_trc, @function
sdk_rc_get_sta_trc:
            addi         sp, sp, -16 /* (local0) */            #  354: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  357: 0911
            movi         a0, .Ldata008                         #  359: 01fbff
            addx2        a0, a2, a0                            #  35c: 000290
            l16ui        a2, a0, 0                             #  35f: 221000
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  362: 2901
            call0        __popcountsi2                         #  364: 01fbffc0
                                                               #  368: 0000
            movi         a5, 120 /* 0x00000078 */              #  36a: 52a078
            l32i         a4, sp, 0 /* [(local0)] */            #  36d: 4801
            l32i         a0, sp, 4 /* [(local1)] */            #  36f: 0811
            neg          a3, a4                                #  371: 403060
            addi         sp, sp, 16 /* (top of frame) */       #  374: 12c110
            and          a3, a3, a4                            #  377: 403310
            addi         a4, a2, -1                            #  37a: 0b42
            nsau         a3, a3                                #  37c: 30f340
            neg          a3, a3                                #  37f: 303060
            movi         a2, .Label005                         #  382: 21f2ff
            addi         a3, a3, 31                            #  385: 32c31f
            mull         a3, a3, a5                            #  388: 503382
            add          a2, a2, a3                            #  38b: 3a22
            movi         a3, 0 /* 0x00000000 */                #  38d: 0c03
            movnez       a2, a3, a4                            #  38f: 402393
            ret                                                #  392: 0df0

            .literal_position                                  #  394: 08000000
                                                               #  398: 10000000
                                                               #  39c: 00000000

# Function @ .irom0.text+0x3a0
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      sdk_rc_get_trc
            .type        sdk_rc_get_trc, @function
sdk_rc_get_trc:
            addi         sp, sp, -32 /* (local0) */            #  3a0: 12c1e0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  3a3: d921
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  3a5: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  3a7: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  3a9: c911
            movi         a12, .Ldata008                        #  3ab: c1faff
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  3ae: e931
            addx2        a12, a2, a12                          #  3b0: c0c290
            l8ui         a12, a12, 0                           #  3b3: c20c00
            mov          a14, a3 /* arg1 */                    #  3b6: ed03
.Lbr138:    neg          a13, a12                              #  3b8: c0d060
            and          a13, a13, a12                         #  3bb: c0dd10
            nsau         a13, a13                              #  3be: d0fd40
            neg          a13, a13                              #  3c1: d0d060
            addi         a13, a13, 31                          #  3c4: d2cd1f
            bltz         a13, .Lbr139                          #  3c7: 96fd02
            mov          a3, a14 /* arg1 */                    #  3ca: 3d0e
            movi         a4, 6 /* 0x00000006 */                #  3cc: 0c64
            movi         a15, .Label005                        #  3ce: f1f2ff
            movi         a0, 120 /* 0x00000078 */              #  3d1: 02a078
            mull         a0, a13, a0                           #  3d4: 000d82
            add          a15, a15, a0                          #  3d7: 0aff
            addi         a2, a15, 26                           #  3d9: 22cf1a
            call0        memcmp                                #  3dc: 01f0ffc0
                                                               #  3e0: 0000
            beqz         a2, .Lbr141                           #  3e2: ac52
            movi         a0, -1 /* 0xffffffff */               #  3e4: 7cf0
            ssl          a13                                   #  3e6: 001d40
            movi         a15, 1 /* 0x00000001 */               #  3e9: 0c1f
            sll          a15, a15                              #  3eb: 00ffa1
            xor          a15, a15, a0                          #  3ee: 00ff30
            and          a12, a12, a15                         #  3f1: f0cc10
            extui        a12, a12, 0, 8                        #  3f4: c0c074
            j            .Lbr138                               #  3f7: 46efff
.Lbr139:    movi         a2, 0 /* 0x00000000 */                #  3fa: 0c02
.Lbr140:    l32i         a12, sp, 4 /* [(local1)] */           #  3fc: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  3fe: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  400: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  402: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  404: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  406: 12c120
            ret                                                #  409: 0df0
.Lbr141:    mov          a2, a15                               #  40b: 2d0f
            j            .Lbr140                               #  40d: c6faff

            .literal_position                                  #  410: 00000000

# Function @ .irom0.text+0x414
            .balign      4
            .global      sdk_rc_get_trc_by_index
            .type        sdk_rc_get_trc_by_index, @function
sdk_rc_get_trc_by_index:
            movi         a4, .Ldata006                         #  414: 41ffff
            ssr          a2                                    #  417: 000240
            l16ui        a3, a4, 4 /* [.Ldata007] */           #  41a: 321402
            addi         a5, a4, 16 /* .Label005 */            #  41d: 52c410
            srl          a3, a3                                #  420: 303091
            bbci         a3, 0, .Lbr142                        #  423: 076309
            movi         a3, 120 /* 0x00000078 */              #  426: 32a078
            mul16u       a2, a3, a2                            #  429: 2023c1
            add          a2, a5, a2                            #  42c: 2a25
            ret                                                #  42e: 0df0
.Lbr142:    movi         a2, 0 /* 0x00000000 */                #  430: 0c02
            ret           /* 0x00000000 */                     #  432: 0df0

            .literal_position                                  #  434: 00000000
                                                               #  438: 00000000
                                                               #  43c: 00000000

# Function @ .irom0.text+0x440
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_rc_only_sta_trc
            .type        sdk_rc_only_sta_trc, @function
sdk_rc_only_sta_trc:
            movi         a2, .Ldata006                         #  440: 21fdff
            addi         sp, sp, -16 /* (local0) */            #  443: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  446: 0901
            l16ui        a2, a2, 4 /* [.Ldata007] */           #  448: 221202
            call0        __popcountsi2                         #  44b: 01fcffc0
                                                               #  44f: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  451: 0801
            bnei         a2, 1, .Lbr143                        #  453: 66120f
            movi         a4, .Ldata006                         #  456: 41f8ff
            movi         a3, 1 /* 0x00000001 */                #  459: 0c13
            l16ui        a4, a4, 8 /* [.Ldata008] */           #  45b: 421404
            movi         a2, 0 /* 0x00000000 */                #  45e: 0c02
            moveqz       a2, a3, a4                            #  460: 402383
            j            .Lbr144                               #  463: 460000
.Lbr143:    movi         a2, -1 /* 0xffffffff */               #  466: 7cf2
.Lbr144:    addi         sp, sp, 16 /* (top of frame) */       #  468: 12c110
            ret                                                #  46b: 0df0

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "==dl\n"                              #    0: 3d3d646c
                                                               #    4: 0a00
            .balign      4
.Lstr002:   .asciz       "add mismatch\n"                      #    8: 61646420
                                                               #    c: 6d69736d
                                                               #   10: 61746368
                                                               #   14: 0a00
            .balign      4
.Lstr003:   .asciz       "add %d\n"                            #   18: 61646420
                                                               #   1c: 25640a00
.Lstr004:   .asciz       "rm match\n"                          #   20: 726d206d
                                                               #   24: 61746368
                                                               #   28: 0a00
            .balign      4
.Lstr005:   .asciz       "rm mismatch\n"                       #   2c: 726d206d
                                                               #   30: 69736d61
                                                               #   34: 7463680a
                                                               #   38: 00

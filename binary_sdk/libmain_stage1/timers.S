
            .section     .bss, "aw", @nobits

.Ldata001:  .word        0x00000000                            #    0: 00000000
.Ldata002:  .byte        0x00

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000
                                                               #    8: 00000000
                                                               #    c: 00000000
                                                               #   10: 00000000

# Function @ .irom0.text+0x14
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
            .global      os_timer_setfn
            .type        os_timer_setfn, @function
os_timer_setfn:
            addi         sp, sp, -32 /* (local0) */            #   14: 12c1e0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   17: 0901
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #   19: e931
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #   1b: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   1d: c911
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #   1f: f941
            movi         a15, .Ldata001                        #   21: f1f7ff
            mov          a12, a2 /* arg0 */                    #   24: cd02
            l32i         a13, a15, 0 /* [.Ldata001] */         #   26: d80f
            mov          a14, a4 /* arg2 */                    #   28: ed04
            beqz         a13, .Lbr006                          #   2a: 16fd04
.Lbr001:    l32i         a0, a13, 4                            #   2d: 081d
            bne          a0, a12, .Lbr005                      #   2f: c79041
            l32i         a2, a12, 24 /* [arg0+0x18] */         #   32: 286c
            l32i         a4, a12, 16 /* [arg0+0x10] */         #   34: 484c
            bne          a2, a14, .Lbr002                      #   36: e79202
            beq          a4, a3, .Lbr007                       #   39: 37145f
.Lbr002:    l32i         a2, a12, 4 /* [arg0+0x4] */           #   3c: 281c
            s32i         a3, sp, 20 /* arg1 -> [(local5)] */   #   3e: 3951
            beqz         a2, .Lbr004                           #   40: ac32
            movi         a3, 3 /* 0x00000003 */                #   42: 0c33
            movi         a4, 0 /* 0x00000000 */                #   44: 0c04
            movi         a5, 0 /* 0x00000000 */                #   46: 0c05
            movi         a6, 50 /* 0x00000032 */               #   48: 3c26
            call0        xTimerGenericCommand                  #   4a: 01efffc0
                                                               #   4e: 0000
            l32i         a3, sp, 20 /* [(local5)] */           #   50: 3851
            bnez         a2, .Lbr003                           #   52: cc92
            movi         a2, .Lstr001                          #   54: 21ecff
            call0        printf                                #   57: 01edffc0
                                                               #   5b: 0000
            l32i         a3, sp, 20 /* [(local5)] */           #   5d: 3851
.Lbr003:    l8ui         a5, a15, 4 /* [.Ldata002] */          #   5f: 520f04
            addi         a5, a5, -1 /* [.Ldata002]-0x1 */      #   62: 0b55
            s8i          a5, a15, 4 /* [.Ldata002]-0x1 -> [.Ldata002] */ #   64: 524f04
.Lbr004:    s32i         a3, a12, 16 /* a3 -> [arg0+0x10] */   #   67: 394c
            s32i         a14, a12, 24 /* arg2 -> [arg0+0x18] */ #   69: e96c
            movi         a6, 0 /* 0x00000000 */                #   6b: 0c06
            s32i         a6, a12, 4 /* 0x00000000 -> [arg0+0x4] */ #   6d: 691c
            s32i         a6, a12, 12 /* 0x00000000 -> [arg0+0xc] */ #   6f: 693c
            j            .Lbr007                               #   71: c60900
.Lbr005:    l32i         a0, a13, 0                            #   74: 080d
            beqz         a0, .Lbr006                           #   76: 8c30
            mov          a13, a0                               #   78: dd00
            bnez         a0, .Lbr001                           #   7a: 56f0fa
.Lbr006:    s32i         a3, a12, 16 /* arg1 -> [arg0+0x10] */ #   7d: 394c
            s32i         a14, a12, 24 /* arg2 -> [arg0+0x18] */ #   7f: e96c
            movi         a2, 8 /* 0x00000008 */                #   81: 0c82
            movi         a7, 0 /* 0x00000000 */                #   83: 0c07
            s32i         a7, a12, 4 /* 0x00000000 -> [arg0+0x4] */ #   85: 791c
            s32i         a7, a12, 12 /* 0x00000000 -> [arg0+0xc] */ #   87: 793c
            call0        pvPortMalloc                          #   89: 01e1ffc0
                                                               #   8d: 0000
            s32i         a12, a2, 4                            #   8f: c912
            movi         a9, 0 /* 0x00000000 */                #   91: 0c09
            l32i         a8, a15, 0 /* [.Ldata001] */          #   93: 880f
            s32i         a9, a2, 0                             #   95: 9902
            movnez       a15, a13, a8                          #   97: 80fd93
            s32i         a2, a15, 0                            #   9a: 290f
.Lbr007:    l32i         a12, sp, 4 /* [(local1)] */           #   9c: c811
            l32i         a13, sp, 8 /* [(local2)] */           #   9e: d821
            l32i         a14, sp, 12 /* [(local3)] */          #   a0: e831
            l32i         a15, sp, 16 /* [(local4)] */          #   a2: f841
            l32i         a0, sp, 0 /* [(local0)] */            #   a4: 0801
            addi         sp, sp, 32 /* (top of frame) */       #   a6: 12c120
            ret                                                #   a9: 0df0

            .literal_position                                  #   ac: 00000000
                                                               #   b0: 18000000
                                                               #   b4: 00000000
                                                               #   b8: 00000000
                                                               #   bc: 00000000
                                                               #   c0: 00000000
                                                               #   c4: 00000000
                                                               #   c8: 00000000
                                                               #   cc: 00000000

# Function @ .irom0.text+0xd0
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      os_timer_arm
            .type        os_timer_arm, @function
os_timer_arm:
            addi         sp, sp, -32 /* (local0) */            #   d0: 12c1e0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   d3: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #   d5: d921
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #   d7: f941
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   d9: c911
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #   db: e931
            mov          a12, a2 /* arg0 */                    #   dd: cd02
            mov          a14, a3 /* arg1 */                    #   df: ed03
            l32i         a15, a2, 4 /* [arg0+0x4] */           #   e1: f812
            mov          a13, a4 /* arg2 */                    #   e3: dd04
            bnez         a15, .Lbr008                          #   e5: ecff
            s8i          a4, a2, 20 /* arg2 -> [arg0+0x14] */  #   e7: 424214
            s32i         a3, a2, 12 /* arg1 -> [arg0+0xc] */   #   ea: 3932
            mov          a2, a3 /* arg1 */                     #   ec: 2d03
            movi         a3, 10 /* 0x0000000a */               #   ee: 0ca3
            call0        __udivsi3                             #   f0: 01f1ffc0
                                                               #   f4: 0000
            mov          a4, a13 /* arg2 */                    #   f6: 4d0d
            l32i         a5, a12, 24 /* [arg0+0x18] */         #   f8: 586c
            mov          a3, a2                                #   fa: 3d02
            l32i         a6, a12, 16 /* [arg0+0x10] */         #   fc: 684c
            movi         a2, 0 /* 0x00000000 */                #   fe: 0c02
            call0        xTimerCreate                          #  100: 01eeffc0
                                                               #  104: 0000
            movi         a3, .Ldata001                         #  106: 31e9ff
            mov          a15, a2                               #  109: fd02
            l8ui         a0, a3, 4 /* [.Ldata002] */           #  10b: 020304
            s32i         a2, a12, 4 /* a2 -> [arg0+0x4] */     #  10e: 291c
            addi         a0, a0, 1 /* [.Ldata002]+0x1 */       #  110: 1b00
            s8i          a0, a3, 4 /* [.Ldata002]+0x1 -> [.Ldata002] */ #  112: 024304
            beqz         a2, .Lbr011                           #  115: 16c204
.Lbr008:    l8ui         a3, a12, 20 /* [arg0+0x14] */         #  118: 320c14
            beq          a3, a13, .Lbr009                      #  11b: d71304
            s8i          a13, a12, 20 /* arg2 -> [arg0+0x14] */ #  11e: d24c14
            s32i         a13, a15, 28                          #  121: d97f
.Lbr009:    l32i         a4, a12, 12 /* [arg0+0xc] */          #  123: 483c
            beq          a4, a14, .Lbr010                      #  125: e7141b
            mov          a2, a14 /* arg1 */                    #  128: 2d0e
            s32i         a14, a12, 12 /* arg1 -> [arg0+0xc] */ #  12a: e93c
            movi         a3, 10 /* 0x0000000a */               #  12c: 0ca3
            call0        __udivsi3                             #  12e: 01e3ffc0
                                                               #  132: 0000
            movi         a3, 2 /* 0x00000002 */                #  134: 0c23
            movi         a5, 0 /* 0x00000000 */                #  136: 0c05
            mov          a4, a2                                #  138: 4d02
            movi         a6, 10 /* 0x0000000a */               #  13a: 0ca6
            mov          a2, a15                               #  13c: 2d0f
            call0        xTimerGenericCommand                  #  13e: 01e0ffc0
                                                               #  142: 0000
.Lbr010:    call0        xTaskGetTickCount                     #  144: 01e0ffc0
                                                               #  148: 0000
            movi         a3, 0 /* 0x00000000 */                #  14a: 0c03
            movi         a5, 0 /* 0x00000000 */                #  14c: 0c05
            mov          a4, a2                                #  14e: 4d02
            movi         a6, 50 /* 0x00000032 */               #  150: 3c26
            l32i         a2, a12, 4 /* [arg0+0x4] */           #  152: 281c
            call0        xTimerGenericCommand                  #  154: 01ddffc0
                                                               #  158: 0000
            bnez         a2, .Lbr011                           #  15a: cc72
            movi         a2, .Lstr002                          #  15c: 21d5ff
            call0        printf                                #  15f: 01dbffc0
                                                               #  163: 0000
.Lbr011:    l32i         a12, sp, 4 /* [(local1)] */           #  165: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  167: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  169: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  16b: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  16d: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  16f: 12c120
            ret                                                #  172: 0df0

            .literal_position                                  #  174: 2c000000
                                                               #  178: 00000000
                                                               #  17c: 00000000

# Function @ .irom0.text+0x180
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      os_timer_disarm
            .type        os_timer_disarm, @function
os_timer_disarm:
            addi         sp, sp, -16 /* (local0) */            #  180: 12c1f0
            l32i         a2, a2, 4 /* [arg0+0x4] */            #  183: 2812
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  185: 0901
            beqz         a2, .Lbr012                           #  187: 9c72
            movi         a3, 1 /* 0x00000001 */                #  189: 0c13
            movi         a4, 0 /* 0x00000000 */                #  18b: 0c04
            movi         a5, 0 /* 0x00000000 */                #  18d: 0c05
            movi         a6, 50 /* 0x00000032 */               #  18f: 3c26
            call0        xTimerGenericCommand                  #  191: 01f9ffc0
                                                               #  195: 0000
            bnez         a2, .Lbr012                           #  197: cc72
            movi         a2, .Lstr003                          #  199: 21f6ff
            call0        printf                                #  19c: 01f8ffc0
                                                               #  1a0: 0000
.Lbr012:    l32i         a0, sp, 0 /* [(local0)] */            #  1a2: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  1a4: 12c110
            ret                                                #  1a7: 0df0

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "Timer Delete Failed\n"               #    0: 54696d65
                                                               #    4: 72204465
                                                               #    8: 6c657465
                                                               #    c: 20466169
                                                               #   10: 6c65640a
                                                               #   14: 00
            .balign      4
.Lstr002:   .asciz       "Timer Start Failed\n"                #   18: 54696d65
                                                               #   1c: 72205374
                                                               #   20: 61727420
                                                               #   24: 4661696c
                                                               #   28: 65640a00
.Lstr003:   .asciz       "Timer Stop Failed\n"                 #   2c: 54696d65
                                                               #   30: 72205374
                                                               #   34: 6f702046
                                                               #   38: 61696c65
                                                               #   3c: 640a00

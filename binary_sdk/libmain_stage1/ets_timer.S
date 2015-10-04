
            .section     .text, "ax", @progbits

            .literal_position                                  #    0: 00000000

# Function @ .text+0x4
            .balign      4
.Lfunc001:  movi         a5, .Ldata001                         #    4: 51ffff
            l8ui         a2, a5, 0 /* [.Ldata001] */           #    7: 220500
            addi         a3, a5, 32 /* .bss+0x20 */            #    a: 32c520
            addi         a2, a2, 1 /* [.Ldata001]+0x1 */       #    d: 1b22
            extui        a2, a2, 0, 8                          #    f: 202074
            bltui        a2, 5, .Lbr001                        #   12: b65208
            addi         a3, a2, -1                            #   15: 0b32
            s8i          a3, a5, 0 /* a3 -> [.Ldata001] */     #   17: 324500
            movi         a2, 0 /* 0x00000000 */                #   1a: 0c02
            ret           /* 0x00000000 */                     #   1c: 0df0
.Lbr001:    s8i          a2, a5, 0 /* a2 -> [.Ldata001] */     #   1e: 224500
            l8ui         a2, a5, 1 /* [.Ldata002] */           #   21: 220501
            addi         a4, a2, 1 /* [.Ldata002]+0x1 */       #   24: 1b42
            addx8        a2, a2, a3                            #   26: 3022b0
            extui        a4, a4, 0, 8                          #   29: 404074
            bltui        a4, 4, .Lbr002                        #   2c: b64401
            movi         a4, 0 /* 0x00000000 */                #   2f: 0c04
.Lbr002:    s8i          a4, a5, 1 /* a4 -> [.Ldata002] */     #   31: 424501
            ret                                                #   34: 0df0

            .literal_position                                  #   38: 24000000
                                                               #   3c: 00000000
                                                               #   40: 30000000
                                                               #   44: 00000000
                                                               #   48: 00000000
                                                               #   4c: 00000000
                                                               #   50: 00000000

# Function @ .text+0x54
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc002:  addi         sp, sp, -16 /* (local0) */            #   54: 12c1f0
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #   57: 0921
            call0        .Lfunc001                             #   59: 85faff
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #   5c: 2901
            bnez         a2, .Lbr003                           #   5e: cca2
            movi         a2, .Lstr004                          #   60: 21f6ff
            call0        printf                                #   63: 01f8ffc0
                                                               #   67: 0000
            j            .Lbr005                               #   69: 060b00
.Lbr003:    mov          a3, sp /* (local0) */                 #   6c: 3d01
            addi         a4, sp, 4 /* (local1) */              #   6e: 4b41
            movi         a5, 0 /* 0x00000000 */                #   70: 0c05
            s32i         a5, a2, 0                             #   72: 5902
            movi         a2, .Ldata001                         #   74: 21f2ff
            s32i         a5, sp, 4 /* 0x00000000 -> [(local1)] */ #   77: 5911
            l32i         a2, a2, 16 /* [.Ldata004] */          #   79: 2842
            call0        xQueueGenericSendFromISR              #   7b: 01f3ffc0
                                                               #   7f: 0000
            mov          a3, a2                                #   81: 3d02
            beqi         a2, 1, .Lbr004                        #   83: 261208
            movi         a2, .Lstr005                          #   86: 21eeff
            call0        printf                                #   89: 01f0ffc0
                                                               #   8d: 0000
.Lbr004:    l32i         a3, sp, 4 /* [(local1)] */            #   8f: 3811
            beqz         a3, .Lbr005                           #   91: 8c43
            call0        vTaskSwitchContext                    #   93: 01efffc0
                                                               #   97: 0000
.Lbr005:    l32i         a0, sp, 8 /* [(local2)] */            #   99: 0821
            addi         sp, sp, 16 /* (top of frame) */       #   9b: 12c110
            ret                                                #   9e: 0df0

            .section     .bss, "aw", @nobits

.Ldata001:  .byte        0x00
.Ldata002:  .byte        0x00
            .byte        0x00, 0x00
.Ldata003:  .word        0x00000000                            #    4: 00000000
            .global      debug_timer
            .type        debug_timer, @object
debug_timer:
            .word        0x00000000                            #    8: 00000000
            .global      debug_timerfn
            .type        debug_timerfn, @object
debug_timerfn:
            .word        0x00000000                            #    c: 00000000
.Ldata004:  .word        0x00000000                            #   10: 00000000
            .space       44

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000
                                                               #    8: 00000000

# Function @ .irom0.text+0xc
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc003:  addi         sp, sp, -16 /* (local0) */            #    c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #    f: 0901
            call0        vPortEnterCritical                    #   11: 01fcffc0
                                                               #   15: 0000
            movi         a2, .Ldata001                         #   17: 21faff
            l8ui         a0, a2, 0 /* [.Ldata001] */           #   1a: 020200
            addi         a0, a0, -1 /* [.Ldata001]-0x1 */      #   1d: 0b00
            s8i          a0, a2, 0 /* [.Ldata001]-0x1 -> [.Ldata001] */ #   1f: 024200
            call0        vPortExitCritical                     #   22: 01f9ffc0
                                                               #   26: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   28: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   2a: 12c110
            ret                                                #   2d: 0df0

            .literal_position                                  #   30: 00060060

# Function @ .irom0.text+0x34
            .balign      4
.Lfunc004:  movi         a3, 0x60000600                        #   34: 31ffff
            memw                                               #   37: c02000
            s32i         a2, a3, 48 /* arg0 -> [0x60000630] */ #   3a: 29c3
            ret           /* arg0 */                           #   3c: 0df0

            .literal_position                                  #   40: 00060060

# Function @ .irom0.text+0x44
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc005:  addi         sp, sp, -16 /* (local0) */            #   44: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   47: 0901
            movi         a4, 0x60000600                        #   49: 41fdff
            memw                                               #   4c: c02000
            l32i         a4, a4, 36 /* [0x60000624] */         #   4f: 4894
            sub          a0, a2, a4                            #   51: 4002c0
            addi         a3, a0, -40                           #   54: 32c0d8
            bgei         a3, 1, .Lbr007                        #   57: e61314
            bgei         a0, 1, .Lbr006                        #   5a: e61008
            addi         a2, a4, 40 /* [0x60000624]+0x28 */    #   5d: 22c428
            call0        .Lfunc004                             #   60: 05fdff
            j            .Lbr008                               #   63: c60200
.Lbr006:    addi         a2, a2, 44 /* arg0+0x2c */            #   66: 22c22c
            call0        .Lfunc004                             #   69: 85fcff
            j            .Lbr008                               #   6c: 860000
.Lbr007:    call0        .Lfunc004                             #   6f: 45fcff
.Lbr008:    l32i         a0, sp, 0 /* [(local0)] */            #   72: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   74: 12c110
            ret                                                #   77: 0df0

            .balign      4
# Function @ .irom0.text+0x7c
            .balign      4
            .global      ets_timer_setfn
            .type        ets_timer_setfn, @function
ets_timer_setfn:
            s32i         a3, a2, 16 /* arg1 -> [arg0+0x10] */  #   7c: 3942
            s32i         a4, a2, 24 /* arg2 -> [arg0+0x18] */  #   7e: 4962
            movi         a5, -1 /* 0xffffffff */               #   80: 7cf5
            movi         a6, 0 /* 0x00000000 */                #   82: 0c06
            s32i         a6, a2, 8 /* 0x00000000 -> [arg0+0x8] */ #   84: 6922
            s32i         a6, a2, 12 /* 0x00000000 -> [arg0+0xc] */ #   86: 6932
            s32i         a5, a2, 0 /* 0xffffffff -> [arg0] */  #   88: 5902
            ret           /* arg0 */                           #   8a: 0df0

            .literal_position                                  #   8c: 00000000
                                                               #   90: 00000000
                                                               #   94: 08000000
                                                               #   98: 00000000

# Function @ .irom0.text+0x9c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc006:  addi         sp, sp, -16 /* (local0) */            #   9c: 12c1f0
            movi         a6, .Ldata001                         #   9f: 61fbff
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   a2: 0911
            l32i         a0, a6, 4 /* [.Ldata003] */           #   a4: 0816
            movi         a5, 0 /* 0x00000000 */                #   a6: 0c05
            beqz         a0, .Lbr010                           #   a8: 9c00
.Lbr009:    l32i         a4, a0, 8                             #   aa: 4820
            sub          a4, a2, a4                            #   ac: 4042c0
            blti         a4, 1, .Lbr011                        #   af: a6140b
            mov          a5, a0                                #   b2: 5d00
            l32i         a0, a0, 0                             #   b4: 0800
            bnez         a0, .Lbr009                           #   b6: 5600ff
            j            .Lbr011                               #   b9: 460000
.Lbr010:    movi         a5, 0 /* 0x00000000 */                #   bc: 0c05
.Lbr011:    s32i         a3, sp, 0 /* arg1 -> [(local0)] */    #   be: 3901
            s32i         a0, a3, 0 /* a0 -> [arg1] */          #   c0: 0903
            s32i         a2, a3, 8 /* arg0 -> [arg1+0x8] */    #   c2: 2923
            beqz         a5, .Lbr012                           #   c4: 8c35
            s32i         a3, a5, 0                             #   c6: 3905
            j            .Lbr013                               #   c8: 060200
.Lbr012:    l32i         a5, sp, 0 /* [(local0)] */            #   cb: 5801
            s32i         a5, a6, 4 /* [(local0)] -> [.Ldata003] */ #   cd: 5916
            call0        .Lfunc005                             #   cf: 45f7ff
            l32i         a3, sp, 0 /* [(local0)] */            #   d2: 3801
.Lbr013:    l32i         a6, a3, 0                             #   d4: 6803
            l32i         a0, sp, 4 /* [(local1)] */            #   d6: 0811
            bne          a6, a3, .Lbr015                       #   d8: 379611
            movi         a2, .Lstr001                          #   db: 21edff
            movi         a3, .Lstr002                          #   de: 31edff
            movi         a4, 209 /* 0x000000d1 */              #   e1: 42a0d1
            call0        ets_printf                            #   e4: 01edffc0
                                                               #   e8: 0000
.Lbr014:    j            .Lbr014 /* (halt) */                  #   ea: 06ffff
.Lbr015:    addi         sp, sp, 16 /* (top of frame) */       #   ed: 12c110
            ret                                                #   f0: 0df0

            .literal_position                                  #   f4: 14000000
                                                               #   f8: 404b4c00
                                                               #   fc: 40420f00
                                                               #  100: 00060060
                                                               #  104: 00000000
                                                               #  108: 00000000
                                                               #  10c: 00000000
                                                               #  110: 00000000

# Function @ .irom0.text+0x114
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      ets_timer_arm_ms_us
            .type        ets_timer_arm_ms_us, @function
ets_timer_arm_ms_us:
            addi         sp, sp, -16 /* (local0) */            #  114: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  117: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  119: d921
            mov          a12, a2 /* arg0 */                    #  11b: cd02
            mov          a2, a3 /* arg1 */                     #  11d: 2d03
            mov          a3, a4 /* arg2 */                     #  11f: 3d04
            l32i         a4, a12, 0 /* [arg0] */               #  121: 480c
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  123: 0901
            beqi         a4, -1, .Lbr017                       #  125: 26040d
            movi         a2, .Lstr003                          #  128: 21f3ff
            mov          a3, a12 /* arg0 */                    #  12b: 3d0c
            call0        printf                                #  12d: 01f5ffc0
                                                               #  131: 0000
.Lbr016:    j            .Lbr016 /* (halt) */                  #  133: 06ffff
.Lbr017:    bnei         a5, 1, .Lbr018                        #  136: 661505
            movi         a0, 1000 /* 0x000003e8 */             #  139: 02a3e8
            mull         a2, a2, a0                            #  13c: 002282
.Lbr018:    beqz         a2, .Lbr020                           #  13f: ace2
            s32i         a3, sp, 12 /* arg2 -> [(local3)] */   #  141: 3931
            movi         a4, 858 /* 0x0000035a */              #  143: 42a35a
            bgeu         a4, a2, .Lbr019                       #  146: 27b411
            srli         a13, a2, 2                            #  149: 20d241
            extui        a0, a2, 0, 2                          #  14c: 200014
            addx4        a0, a0, a0                            #  14f: 0000a0
            addx4        a13, a13, a13                         #  152: d0dda0
            addx4        a13, a13, a0                          #  155: 00dda0
            j            .Lbr021                               #  158: c60500
.Lbr019:    movi         a4, 0x004c4b40                        #  15b: 41e7ff
            movi         a3, 0x000f4240                        #  15e: 31e7ff
            mull         a2, a2, a4                            #  161: 402282
            call0        __udivsi3                             #  164: 01e9ffc0
                                                               #  168: 0000
            mov          a13, a2                               #  16a: dd02
            l32i         a3, sp, 12 /* [(local3)] */           #  16c: 3831
            j            .Lbr021                               #  16e: 460000
.Lbr020:    movi         a13, 0 /* 0x00000000 */               #  171: 0c0d
.Lbr021:    beqz         a3, .Lbr022                           #  173: 8c03
            s32i         a13, a12, 12 /* a13 -> [arg0+0xc] */  #  175: d93c
.Lbr022:    call0        vPortEnterCritical                    #  177: 01e5ffc0
                                                               #  17b: 0000
            mov          a3, a12 /* arg0 */                    #  17d: 3d0c
            movi         a2, 0x60000600                        #  17f: 21e0ff
            memw                                               #  182: c02000
            l32i         a2, a2, 36 /* [0x60000624] */         #  185: 2892
            add          a2, a13, a2                           #  187: 2a2d
            call0        .Lfunc006                             #  189: 05f1ff
            call0        vPortExitCritical                     #  18c: 01e1ffc0
                                                               #  190: 0000
            l32i         a12, sp, 4 /* [(local1)] */           #  192: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  194: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  196: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  198: 12c110
            ret                                                #  19b: 0df0

            .balign      4
# Function @ .irom0.text+0x1a0
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      ets_timer_arm_us
            .type        ets_timer_arm_us, @function
ets_timer_arm_us:
            movi         a5, 0 /* 0x00000000 */                #  1a0: 0c05
            addi         sp, sp, -16 /* (local0) */            #  1a2: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  1a5: 0901
            call0        ets_timer_arm_ms_us                   #  1a7: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #  1aa: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  1ac: 12c110
            ret                                                #  1af: 0df0

            .balign      4
# Function @ .irom0.text+0x1b4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      ets_timer_arm
            .type        ets_timer_arm, @function
ets_timer_arm:
            movi         a5, 1 /* 0x00000001 */                #  1b4: 0c15
            addi         sp, sp, -16 /* (local0) */            #  1b6: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  1b9: 0901
            call0        ets_timer_arm_ms_us                   #  1bb: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #  1be: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  1c0: 12c110
            ret                                                #  1c3: 0df0

            .literal_position                                  #  1c8: 00000000
                                                               #  1cc: 00000000
                                                               #  1d0: 00000000

# Function @ .irom0.text+0x1d4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      ets_timer_disarm
            .type        ets_timer_disarm, @function
ets_timer_disarm:
            addi         sp, sp, -16 /* (local0) */            #  1d4: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  1d7: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  1d9: 0901
            mov          a12, a2 /* arg0 */                    #  1db: cd02
            call0        vPortEnterCritical                    #  1dd: 01fbffc0
                                                               #  1e1: 0000
            movi         a5, .Ldata001                         #  1e3: 51f9ff
            l32i         a0, a5, 4 /* [.Ldata003] */           #  1e6: 0815
            movi         a2, 0 /* 0x00000000 */                #  1e8: 0c02
            beqz         a0, .Lbr024                           #  1ea: 8cb0
.Lbr023:    beq          a12, a0, .Lbr025                      #  1ec: 071c0b
            mov          a2, a0                                #  1ef: 2d00
            l32i         a0, a0, 0                             #  1f1: 0800
            bnez         a0, .Lbr023                           #  1f3: 5650ff
            j            .Lbr027                               #  1f6: 860300
.Lbr024:    movi         a2, 0 /* 0x00000000 */                #  1f9: 0c02
.Lbr025:    beqz         a0, .Lbr027                           #  1fb: 8c90
            l32i         a0, a0, 0                             #  1fd: 0800
            bnez         a2, .Lbr026                           #  1ff: cc32
            s32i         a0, a5, 4 /* a0 -> [.Ldata003] */     #  201: 0915
            j            .Lbr027                               #  203: 460000
.Lbr026:    s32i         a0, a2, 0                             #  206: 0902
.Lbr027:    call0        vPortExitCritical                     #  208: 01f2ffc0
                                                               #  20c: 0000
            movi         a0, 0 /* 0x00000000 */                #  20e: 0c00
            movi         a2, -1 /* 0xffffffff */               #  210: 7cf2
            s32i         a2, a12, 0 /* 0xffffffff -> [arg0] */ #  212: 290c
            s32i         a0, a12, 12 /* 0x00000000 -> [arg0+0xc] */ #  214: 093c
            l32i         a12, sp, 4 /* [(local1)] */           #  216: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  218: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  21a: 12c110
            ret           /* 0xffffffff */                     #  21d: 0df0

            .literal_position                                  #  220: 00000000
                                                               #  224: 08000000
                                                               #  228: 00000000

# Function @ .irom0.text+0x22c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      ets_timer_done
            .type        ets_timer_done, @function
ets_timer_done:
            addi         sp, sp, -16 /* (local0) */            #  22c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  22f: 0901
            l32i         a0, a2, 0 /* [arg0] */                #  231: 0802
            beqi         a0, -1, .Lbr029                       #  233: 260011
            movi         a2, .Lstr001                          #  236: 21faff
            movi         a3, .Lstr002                          #  239: 31faff
            movi         a4, 288 /* 0x00000120 */              #  23c: 42a120
            call0        ets_printf                            #  23f: 01faffc0
                                                               #  243: 0000
.Lbr028:    j            .Lbr028 /* (halt) */                  #  245: 06ffff
.Lbr029:    movi         a3, 0 /* 0x00000000 */                #  248: 0c03
            movi         a4, 0 /* 0x00000000 */                #  24a: 0c04
            call0        ets_timer_setfn                       #  24c: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #  24f: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  251: 12c110
            ret                                                #  254: 0df0

            .literal_position                                  #  258: 00060060
                                                               #  25c: 00000000
                                                               #  260: 00000000
                                                               #  264: 00000000
                                                               #  268: 00060060
                                                               #  26c: 00000000
                                                               #  270: 00000000
                                                               #  274: 00000000
                                                               #  278: 00000000

# Function @ .irom0.text+0x27c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      ets_timer_handler_isr
            .type        ets_timer_handler_isr, @function
ets_timer_handler_isr:
            addi         sp, sp, -16 /* (local0) */            #  27c: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  27f: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  281: 0901
            call0        vPortEnterCritical                    #  283: 01faffc0
                                                               #  287: 0000
            movi         a3, 0x60000600                        #  289: 31f3ff
            memw                                               #  28c: c02000
            movi         a0, .Ldata001                         #  28f: 01f3ff
            l32i         a5, a3, 36 /* [0x60000624] */         #  292: 5893
.Lbr030:    l32i         a12, a0, 4 /* [.Ldata003] */          #  294: c810
            beqz         a12, .Lbr033                          #  296: 162c05
            l32i         a2, a12, 8 /* [[.Ldata003]+0x8] */    #  299: 282c
            sub          a4, a2, a5                            #  29b: 5042c0
            bgei         a4, 1, .Lbr032                        #  29e: e61445
            movi         a5, -1 /* 0xffffffff */               #  2a1: 7cf5
            movi         a7, .Ldata001                         #  2a3: 71efff
            l32i         a8, a12, 16 /* [[.Ldata003]+0x10] */  #  2a6: 884c
            s32i         a8, a7, 12 /* [[.Ldata003]+0x10] -> [debug_timerfn] */ #  2a8: 8937
            s32i         a12, a7, 8 /* [.Ldata003] -> [debug_timer] */ #  2aa: c927
            l32i         a6, a12, 0 /* [[.Ldata003]] */        #  2ac: 680c
            s32i         a6, a7, 4 /* [[.Ldata003]] -> [.Ldata003] */ #  2ae: 6917
            s32i         a5, a12, 0 /* 0xffffffff -> [[.Ldata003]] */ #  2b0: 590c
            call0        vPortExitCritical                     #  2b2: 01efffc0
                                                               #  2b6: 0000
            l32i         a0, a12, 16 /* [[.Ldata003]+0x10] */  #  2b8: 084c
            l32i         a2, a12, 24 /* [[.Ldata003]+0x18] */  #  2ba: 286c
            callx0       a0 /* [[.Ldata003]+0x10] */           #  2bc: c00000
            call0        vPortEnterCritical                    #  2bf: 01edffc0
                                                               #  2c3: 0000
            l32i         a2, a12, 0 /* [[.Ldata003]] */        #  2c5: 280c
            l32i         a0, a12, 12 /* [[.Ldata003]+0xc] */   #  2c7: 083c
            bnei         a2, -1, .Lbr031                       #  2c9: 66020c
            beqz         a0, .Lbr031                           #  2cc: 8c90
            l32i         a2, a12, 8 /* [[.Ldata003]+0x8] */    #  2ce: 282c
            mov          a3, a12 /* [.Ldata003] */             #  2d0: 3d0c
            add          a2, a2, a0                            #  2d2: 0a22
            s32i         a2, a12, 8 /* a2 -> [[.Ldata003]+0x8] */ #  2d4: 292c
            call0        .Lfunc006                             #  2d6: 45dcff
.Lbr031:    movi         a0, .Ldata001                         #  2d9: 01e2ff
            memw                                               #  2dc: c02000
            movi         a3, 0x60000600                        #  2df: 31e2ff
            l32i         a5, a3, 36 /* [0x60000624] */         #  2e2: 5893
            j            .Lbr030                               #  2e4: 06ebff
.Lbr032:    beqz         a12, .Lbr033                          #  2e7: 8c1c
            call0        .Lfunc005                             #  2e9: 85d5ff
.Lbr033:    call0        vPortExitCritical                     #  2ec: 01e3ffc0
                                                               #  2f0: 0000
            l32i         a12, sp, 4 /* [(local1)] */           #  2f2: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  2f4: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  2f6: 12c110
            ret                                                #  2f9: 0df0

            .literal_position                                  #  2fc: 00000000
                                                               #  300: 00000000

# Function @ .irom0.text+0x304
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc007:  addi         sp, sp, -16 /* (local0) */            #  304: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  307: c921
            movi         a12, .Ldata001                        #  309: c1fcff
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  30c: 0911
.Lbr034:    l32i         a2, a12, 16 /* [.Ldata004] */         #  30e: 284c
            mov          a3, sp /* (local0) */                 #  310: 3d01
            movi         a4, -1 /* 0xffffffff */               #  312: 7cf4
            movi         a5, 0 /* 0x00000000 */                #  314: 0c05
            call0        xQueueGenericReceive                  #  316: 01faffc0
                                                               #  31a: 0000
            bnei         a2, 1, .Lbr034                        #  31c: 6612ee
            l32i         a0, sp, 0 /* [(local0)] */            #  31f: 0801
            l32i         a0, a0, 0 /* [[(local0)]] */          #  321: 0800
            bnez         a0, .Lbr035                           #  323: cc30
            movi         a2, 0 /* 0x00000000 */                #  325: 0c02
            call0        ets_timer_handler_isr                 #  327: 050000
.Lbr035:    call0        .Lfunc003                             #  32a: 05ceff
            j            .Lbr034                               #  32d: 46f7ff

            .literal_position                                  #  330: 00000000
                                                               #  334: 54000000
                                                               #  338: 00000000
                                                               #  33c: 40000000
                                                               #  340: 04030000
                                                               #  344: 50000000
                                                               #  348: 00feef3f
                                                               #  34c: 00060060
                                                               #  350: 00000000
                                                               #  354: 00000000
                                                               #  358: 00000000
                                                               #  35c: 00000000
                                                               #  360: 00000000

# Function @ .irom0.text+0x364
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word[3]   @ -0x1c
#     (local2):  word      @ -0x10
#     (local3):  word[3]   @ -0xc
            .balign      4
            .global      ets_timer_init
            .type        ets_timer_init, @function
ets_timer_init:
            movi         a3, .Lfunc002                         #  364: 31f4ff
            addi         sp, sp, -32 /* (local0) */            #  367: 12c1e0
            movi         a2, .Ldata001                         #  36a: 21f1ff
            s32i         a0, sp, 20 /* a0 -> [(local3)] */     #  36d: 0951
            movi         a0, 0 /* 0x00000000 */                #  36f: 0c00
            s32i         a0, a2, 4 /* 0x00000000 -> [.Ldata003] */ #  371: 0912
            movi         a2, 10 /* 0x0000000a */               #  373: 0ca2
            call0        _xt_isr_attach                        #  375: 01f6ffc0
                                                               #  379: 0000
            movi         a2, 4 /* 0x00000004 */                #  37b: 0c42
            movi         a3, 4 /* 0x00000004 */                #  37d: 0c43
            movi         a4, 0 /* 0x00000000 */                #  37f: 0c04
            call0        xQueueGenericCreate                   #  381: 01f4ffc0
                                                               #  385: 0000
            movi         a5, 0 /* 0x00000000 */                #  387: 0c05
            movi         a6, 12 /* 0x0000000c */               #  389: 0cc6
            addi         a7, sp, 16 /* (local2) */             #  38b: 72c110
            movi         a4, .Ldata001                         #  38e: 41eaff
            movi         a3, 0 /* 0x00000000 */                #  391: 0c03
            s32i         a2, a4, 16 /* a2 -> [.Ldata004] */    #  393: 2944
            movi         a4, 200 /* 0x000000c8 */              #  395: 42a0c8
            s32i         a3, sp, 0 /* 0x00000000 -> [(local0)] */ #  398: 3901
            s32i         a3, sp, 4 /* 0x00000000 -> [(local1)] */ #  39a: 3911
            movi         a2, .Lfunc007                         #  39c: 21e9ff
            movi         a3, .Lstr006                          #  39f: 31e7ff
            call0        xTaskGenericCreate                    #  3a2: 01edffc0
                                                               #  3a6: 0000
            movi         a2, .Lstr007                          #  3a8: 21e7ff
            l32i         a3, sp, 16 /* [(local2)] */           #  3ab: 3841
            movi         a4, 12 /* 0x0000000c */               #  3ad: 0cc4
            movi         a5, 200 /* 0x000000c8 */              #  3af: 52a0c8
            call0        printf                                #  3b2: 01eaffc0
                                                               #  3b6: 0000
            movi         a6, 0x3feffe00                        #  3b8: 61e4ff
            movi         a9, 0x60000600                        #  3bb: 91e4ff
            memw                                               #  3be: c02000
            movi         a8, 0 /* 0x00000000 */                #  3c1: 0c08
            s32i         a8, a9, 48 /* 0x00000000 -> [0x60000630] */ #  3c3: 89c9
            movi         a10, 132 /* 0x00000084 */             #  3c5: a2a084
            memw                                               #  3c8: c02000
            s32i         a10, a9, 40 /* 0x00000084 -> [0x60000628] */ #  3cb: a9a9
            memw                                               #  3cd: c02000
            s32i         a8, a9, 32 /* 0x00000000 -> [0x60000620] */ #  3d0: 8989
            movi         a7, 4 /* 0x00000004 */                #  3d2: 0c47
            memw                                               #  3d4: c02000
            l32i         a5, a6, 0x204 /* [0x3ff00004] */      #  3d7: 522681
            or           a5, a5, a7                            #  3da: 705520
            memw                                               #  3dd: c02000
            s32i         a5, a6, 0x204 /* a5 -> [0x3ff00004] */ #  3e0: 526681
            movi         a2, 1024 /* 0x00000400 */             #  3e3: 22a400
            call0        _xt_isr_unmask                        #  3e6: 01deffc0
                                                               #  3ea: 0000
            l32i         a0, sp, 20 /* [(local3)] */           #  3ec: 0851
            addi         sp, sp, 32 /* (top of frame) */       #  3ee: 12c120
            ret                                                #  3f1: 0df0

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "%s %s \n"                            #    0: 25732025
                                                               #    4: 73200a00
.Lstr002:   .asciz       "ets_timer.c"                         #    8: 6574735f
                                                               #    c: 74696d65
                                                               #   10: 722e6300
.Lstr003:   .asciz       "arm new %x %x\n"                     #   14: 61726d20
                                                               #   18: 6e657720
                                                               #   1c: 25782025
                                                               #   20: 780a00
            .balign      4
.Lstr004:   .asciz       "TIMQ_NUL\n"                          #   24: 54494d51
                                                               #   28: 5f4e554c
                                                               #   2c: 0a00
            .balign      4
.Lstr005:   .asciz       "TIMQ_FL:%d!!"                        #   30: 54494d51
                                                               #   34: 5f464c3a
                                                               #   38: 25642121
                                                               #   3c: 00
            .balign      4
.Lstr006:   .asciz       "rtc_timer_task"                      #   40: 7274635f
                                                               #   44: 74696d65
                                                               #   48: 725f7461
                                                               #   4c: 736b00
            .balign      4
.Lstr007:   .asciz       "frc2_timer_task_hdl:%x, prio:%d, stack:%d\n" #   50: 66726332
                                                               #   54: 5f74696d
                                                               #   58: 65725f74
                                                               #   5c: 61736b5f
                                                               #   60: 68646c3a
                                                               #   64: 25782c20
                                                               #   68: 7072696f
                                                               #   6c: 3a25642c
                                                               #   70: 20737461
                                                               #   74: 636b3a25
                                                               #   78: 640a00

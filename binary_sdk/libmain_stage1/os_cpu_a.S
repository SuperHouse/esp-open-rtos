
            .section     .text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000
                                                               #    8: 00000000
                                                               #    c: 00000000
                                                               #   10: 00000000

# Function @ .text+0x14
# Local variables/stack:
#     (local0):  word      @ -0x50
#     (local1):  word      @ -0x4c
#     (local2):  word      @ -0x48
#     (local3):  word      @ -0x44
#     (local4):  word[16]  @ -0x40
            .balign      4
            .global      vPortYield
            .type        vPortYield, @function
vPortYield: wsr          a0, excsave1                          #   14: 00d113
            addi         sp, sp, -80 /* (local0) */            #   17: 12c1b0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   1a: 0911
            addi         a0, sp, 80 /* (top of frame) */       #   1c: 02c150
            s32i         a0, sp, 16 /* (top of frame) -> [(local4)] */ #   1f: 0941
            rsr          a0, ps                                #   21: 00e603
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #   24: 0921
            rsr          a0, excsave1                          #   26: 00d103
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     #   29: 0931
            movi         a0, _xt_user_exit                     #   2b: 01f5ff
            s32i         a0, sp, 0 /* _xt_user_exit -> [(local0)] */ #   2e: 0901
            call0        _xt_int_enter                         #   30: 050000
            call0        vPortEnterCritical                    #   33: 01f4ffc0
                                                               #   37: 0000
            call0        vTaskSwitchContext                    #   39: 01f3ffc0
                                                               #   3d: 0000
            call0        vPortExitCritical                     #   3f: 01f3ffc0
                                                               #   43: 0000
            call0        _xt_int_exit                          #   45: 01f2ffc0
                                                               #   49: 0000
            ret                                                #   4b: 0df0

            .literal_position                                  #   50: 00000000
                                                               #   54: 00000000
                                                               #   58: 00000000
                                                               #   5c: 00000000
                                                               #   60: 00000000
                                                               #   64: 00350c00
                                                               #   68: 00000000
                                                               #   6c: 00000000
                                                               #   70: 00350c00

# Function @ .text+0x74
            .balign      4
            .global      _xt_int_enter
            .type        _xt_int_enter, @function
_xt_int_enter:
            s32i         a12, sp, 60 /* a12 -> [(FP)+0x3c] */  #   74: c9f1
            s32i         a13, sp, 64 /* a13 -> [(FP)+0x40] */  #   76: d26110
            mov          a12, a0                               #   79: cd00
            call0        _xt_context_save                      #   7b: 01f5ffc0
                                                               #   7f: 0000
            movi         a0, pxCurrentTCB                      #   81: 01f4ff
            l32i         a0, a0, 0 /* [pxCurrentTCB] */        #   84: 0800
            s32i         sp, a0, 0 /* (top of frame) -> [[pxCurrentTCB]] */ #   86: 1900
            mov          a0, a12                               #   88: 0d0c
            ret                                                #   8a: 0df0

# Function @ .text+0x8c
            .balign      4
            .global      _xt_int_exit
            .type        _xt_int_exit, @function
_xt_int_exit:
            s32i         a14, sp, 68 /* a14 -> [(FP)+0x44] */  #   8c: e26111
            s32i         a15, sp, 72 /* a15 -> [(FP)+0x48] */  #   8f: f26112
            movi         sp, pxCurrentTCB                      #   92: 11f1ff
            l32i         sp, sp, 0 /* [pxCurrentTCB] */        #   95: 1801
            l32i         sp, sp, 0 /* [[pxCurrentTCB]] */      #   97: 1801
            movi         a14, pxCurrentTCB                     #   99: e1f0ff
            l32i         a14, a14, 0 /* [pxCurrentTCB] */      #   9c: e80e
            addi         a15, sp, 80 /* [[pxCurrentTCB]]+0x50 */ #   9e: f2c150
            s32i         a15, a14, 0 /* [[pxCurrentTCB]]+0x50 -> [[pxCurrentTCB]] */ #   a1: f90e
            call0        _xt_context_restore                   #   a3: 01efffc0
                                                               #   a7: 0000
            l32i         a14, sp, 68 /* [[[pxCurrentTCB]]+0x44] */ #   a9: e22111
            l32i         a15, sp, 72 /* [[[pxCurrentTCB]]+0x48] */ #   ac: f22112
            l32i         a0, sp, 0 /* [[[pxCurrentTCB]]] */    #   af: 0801
            ret                                                #   b1: 0df0

            .balign      4
# Function @ .text+0xb4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      _xt_timer_int
            .type        _xt_timer_int, @function
_xt_timer_int:
            addi         sp, sp, -16 /* (local0) */            #   b4: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   b7: 0901
.Lbr001:    movi         a2, 0x000c3500                        #   b9: 21eaff
            rsr          a3, ccompare0                         #   bc: 30f003
            add          a4, a3, a2                            #   bf: 2a43
            wsr          a4, ccompare0                         #   c1: 40f013
            esync                                              #   c4: 202000
            s32i         a2, sp, 4 /* 0x000c3500 -> [(local1)] */ #   c7: 2911
            s32i         a3, sp, 8 /* a3 -> [(local2)] */      #   c9: 3921
            call0        xPortSysTickHandle                    #   cb: 01e7ffc0
                                                               #   cf: 0000
            l32i         a2, sp, 4 /* [(local1)] */            #   d1: 2811
            l32i         a3, sp, 8 /* [(local2)] */            #   d3: 3821
            esync                                              #   d5: 202000
            rsr          a4, ccount                            #   d8: 40ea03
            sub          a4, a4, a3                            #   db: 3044c0
            blt          a2, a4, .Lbr001                       #   de: 4722d7
            l32i         a0, sp, 0 /* [(local0)] */            #   e1: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   e3: 12c110
            ret           /* [(local1)] */                     #   e6: 0df0

# Function @ .text+0xe8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      _xt_timer_int1
            .type        _xt_timer_int1, @function
_xt_timer_int1:
            addi         sp, sp, -16 /* (local0) */            #   e8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   eb: 0901
            s32i         a2, sp, 4 /* arg0 -> [(local1)] */    #   ed: 2911
            s32i         a3, sp, 8 /* arg1 -> [(local2)] */    #   ef: 3921
            call0        vTaskSwitchContext                    #   f1: 01deffc0
                                                               #   f5: 0000
            l32i         a2, sp, 4 /* [(local1)] */            #   f7: 2811
            l32i         a3, sp, 8 /* [(local2)] */            #   f9: 3821
            l32i         a0, sp, 0 /* [(local0)] */            #   fb: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   fd: 12c110
            ret           /* [(local1)] */                     #  100: 0df0

            .balign      4
# Function @ .text+0x104
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      _xt_tick_timer_init
            .type        _xt_tick_timer_init, @function
_xt_tick_timer_init:
            addi         sp, sp, -16 /* (local0) */            #  104: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  107: 0901
            movi         a3, 0x000c3500                        #  109: 31d9ff
            rsr          a2, ccount                            #  10c: 20ea03
            add          a2, a2, a3                            #  10f: 3a22
            wsr          a2, ccompare0                         #  111: 20f013
            movi         a2, 0 /* 0x00000000 */                #  114: 0c02
            xsr          a2, intenable                         #  116: 20e461
            movi         a3, 64 /* 0x00000040 */               #  119: 4c03
            or           a2, a2, a3                            #  11b: 302220
            wsr          a2, intenable                         #  11e: 20e413
            l32i         a0, sp, 0 /* [(local0)] */            #  121: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  123: 12c110
            ret                                                #  126: 0df0

# Function @ .text+0x128
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      _xt_isr_unmask
            .type        _xt_isr_unmask, @function
_xt_isr_unmask:
            addi         sp, sp, -16 /* (local0) */            #  128: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  12b: 0901
            movi         a3, 0 /* 0x00000000 */                #  12d: 0c03
            xsr          a3, intenable                         #  12f: 30e461
            or           a3, a2, a3                            #  132: 303220
            wsr          a3, intenable                         #  135: 30e413
            l32i         a0, sp, 0 /* [(local0)] */            #  138: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  13a: 12c110
            ret           /* arg0 */                           #  13d: 0df0

            .balign      4
# Function @ .text+0x140
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      _xt_isr_mask
            .type        _xt_isr_mask, @function
_xt_isr_mask:
            addi         sp, sp, -16 /* (local0) */            #  140: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  143: 0901
            movi         a3, 0 /* 0x00000000 */                #  145: 0c03
            xsr          a3, intenable                         #  147: 30e461
            and          a3, a2, a3                            #  14a: 303210
            wsr          a3, intenable                         #  14d: 30e413
            l32i         a0, sp, 0 /* [(local0)] */            #  150: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  152: 12c110
            ret           /* arg0 */                           #  155: 0df0

            .balign      4
# Function @ .text+0x158
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      _xt_read_ints
            .type        _xt_read_ints, @function
_xt_read_ints:
            addi         sp, sp, -16 /* (local0) */            #  158: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  15b: 0901
            rsr          a2, interrupt                         #  15d: 20e203
            l32i         a0, sp, 0 /* [(local0)] */            #  160: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  162: 12c110
            ret                                                #  165: 0df0

            .balign      4
# Function @ .text+0x168
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      _xt_clear_ints
            .type        _xt_clear_ints, @function
_xt_clear_ints:
            addi         sp, sp, -16 /* (local0) */            #  168: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  16b: 0901
            wsr          a2, intclear                          #  16d: 20e313
            l32i         a0, sp, 0 /* [(local0)] */            #  170: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  172: 12c110
            ret                                                #  175: 0df0

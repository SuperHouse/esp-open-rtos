
            .section     .text, "ax", @progbits

# Function @ .text+0x0
            .balign      4
            .literal_position
            .global      _xt_context_save
            .type        _xt_context_save, @function
_xt_context_save:
            s32i         a2, sp, 20 /* arg0 -> [(FP)+0x14] */  #    0: 2951
            s32i         a3, sp, 24 /* arg1 -> [(FP)+0x18] */  #    2: 3961
            s32i         a4, sp, 28 /* arg2 -> [(FP)+0x1c] */  #    4: 4971
            s32i         a5, sp, 32 /* arg3 -> [(FP)+0x20] */  #    6: 5981
            s32i         a6, sp, 36 /* arg4 -> [(FP)+0x24] */  #    8: 6991
            s32i         a7, sp, 40 /* arg5 -> [(FP)+0x28] */  #    a: 79a1
            s32i         a8, sp, 44 /* a8 -> [(FP)+0x2c] */    #    c: 89b1
            s32i         a9, sp, 48 /* a9 -> [(FP)+0x30] */    #    e: 99c1
            s32i         a10, sp, 52 /* a10 -> [(FP)+0x34] */  #   10: a9d1
            s32i         a11, sp, 56 /* a11 -> [(FP)+0x38] */  #   12: b9e1
            rsr          a3, sar                               #   14: 300303
            s32i         a3, sp, 76 /* a3 -> [(FP)+0x4c] */    #   17: 326113
            ret           /* arg0 */                           #   1a: 0df0

# Function @ .text+0x1c
            .balign      4
            .global      _xt_context_restore
            .type        _xt_context_restore, @function
_xt_context_restore:
            l32i         a3, sp, 76 /* [(FP)+0x4c] */          #   1c: 322113
            l32i         a2, sp, 20 /* [(FP)+0x14] */          #   1f: 2851
            wsr          a3, sar                               #   21: 300313
            l32i         a3, sp, 24 /* [(FP)+0x18] */          #   24: 3861
            l32i         a4, sp, 28 /* [(FP)+0x1c] */          #   26: 4871
            l32i         a5, sp, 32 /* [(FP)+0x20] */          #   28: 5881
            l32i         a6, sp, 36 /* [(FP)+0x24] */          #   2a: 6891
            l32i         a7, sp, 40 /* [(FP)+0x28] */          #   2c: 78a1
            l32i         a8, sp, 44 /* [(FP)+0x2c] */          #   2e: 88b1
            l32i         a9, sp, 48 /* [(FP)+0x30] */          #   30: 98c1
            l32i         a10, sp, 52 /* [(FP)+0x34] */         #   32: a8d1
            l32i         a11, sp, 56 /* [(FP)+0x38] */         #   34: b8e1
            l32i         a12, sp, 60 /* [(FP)+0x3c] */         #   36: c8f1
            l32i         a13, sp, 64 /* [(FP)+0x40] */         #   38: d22110
            ret           /* [(FP)+0x14] */                    #   3b: 0df0

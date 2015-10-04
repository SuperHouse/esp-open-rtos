
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000

# Function @ .irom0.text+0x4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      ieee80211_getmgtframe
            .type        ieee80211_getmgtframe, @function
ieee80211_getmgtframe:
            movi         a5, -4 /* 0xfffffffc */               #    4: 7cc5
            addi         sp, sp, -16 /* (local0) */            #    6: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #    9: 0911
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #    b: c921
            movi         a0, 256 /* 0x00000100 */              #    d: 02a100
            mov          a12, a3 /* arg1 */                    #   10: cd03
            add          a3, a3, a4                            #   12: 4a33
            addi         a3, a3, 3                             #   14: 3b33
            and          a4, a3, a5                            #   16: 504310
            bgeu         a0, a4, .Lbr001                       #   19: 47b004
            movi         a2, 0 /* 0x00000000 */                #   1c: 0c02
            j            .Lbr003                               #   1e: 860700
.Lbr001:    movi         a3, 4 /* 0x00000004 */                #   21: 0c43
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #   23: 2901
            movi         a5, 65 /* 0x00000041 */               #   25: 4c15
            bgeu         a4, a5, .Lbr002                       #   27: 57b401
            movi         a3, 5 /* 0x00000005 */                #   2a: 0c53
.Lbr002:    movi         a2, 0 /* 0x00000000 */                #   2c: 0c02
            call0        esf_buf_alloc                         #   2e: 01f4ffc0
                                                               #   32: 0000
            beqz         a2, .Lbr003                           #   34: 8c82
            l32i         a6, a2, 4                             #   36: 6812
            l32i         a6, a6, 4                             #   38: 6816
            l32i         a7, sp, 0 /* [(local0)] */            #   3a: 7801
            add          a6, a12, a6                           #   3c: 6a6c
            s32i         a6, a7, 0 /* a6 -> [[(local0)]] */    #   3e: 6907
.Lbr003:    l32i         a12, sp, 8 /* [(local2)] */           #   40: c821
            l32i         a0, sp, 4 /* [(local1)] */            #   42: 0811
            addi         sp, sp, 16 /* (top of frame) */       #   44: 12c110
            ret                                                #   47: 0df0

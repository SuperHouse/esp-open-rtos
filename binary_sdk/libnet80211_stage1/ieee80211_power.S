
            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
            .balign      4
            .literal_position
            .global      ieee80211_psq_init
            .type        ieee80211_psq_init, @function
ieee80211_psq_init:
            movi         a6, 0 /* 0x00000000 */                #    0: 0c06
            movi         a5, 0 /* 0x00000000 */                #    2: 0c05
            movi         a4, 1 /* 0x00000001 */                #    4: 0c14
.Lbr001:    addi         a4, a4, -1                            #    6: 0b44
            add          a3, a5, a2                            #    8: 2a35
            s32i         a6, a3, 0                             #    a: 6903
            addi         a5, a5, 4                             #    c: 4b55
            bgei         a4, 1, .Lbr001                        #    e: e614f4
            movi         a4, 10 /* 0x0000000a */               #   11: 0ca4
            s32i         a4, a2, 4 /* 0x0000000a -> [arg0+0x4] */ #   13: 4912
            ret           /* arg0 */                           #   15: 0df0

            .balign      4
# Function @ .irom0.text+0x18
            .balign      4
            .global      ieee80211_psq_cleanup
            .type        ieee80211_psq_cleanup, @function
ieee80211_psq_cleanup:
            ret           /* arg0 */                           #   18: 0df0

            .literal_position                                  #   1c: 00000000

# Function @ .irom0.text+0x20
            .balign      4
            .global      ieee80211_set_tim
            .type        ieee80211_set_tim, @function
ieee80211_set_tim:
            movi         a10, 1 /* 0x00000001 */               #   20: 0c1a
            l16ui        a6, a2, 26 /* [arg0+0x1a] */          #   22: 62120d
            movi         a8, g_ic+0x152                        #   25: 81fdff
            extui        a7, a6, 0, 3                          #   28: 607024
            extui        a6, a6, 3, 11                         #   2b: 6063a4
            add          a6, a6, a8                            #   2e: 8a66
            l8ui         a5, a6, 128                           #   30: 520680
            ssr          a7                                    #   33: 000740
            sra          a4, a5                                #   36: 5040b1
            extui        a4, a4, 0, 1                          #   39: 404004
            sub          a2, a3, a4                            #   3c: 4023c0
            movnez       a2, a10, a2                           #   3f: 202a93
            beqz         a2, .Lbr002                           #   42: 9c52
            movi         a11, -1 /* 0xffffffff */              #   44: 7cfb
            ssl          a7                                    #   46: 001740
            sll          a9, a10                               #   49: 009aa1
            or           a8, a9, a5                            #   4c: 508920
            xor          a9, a9, a11                           #   4f: b09930
            and          a9, a5, a9                            #   52: 909510
            moveqz       a8, a9, a3                            #   55: 308983
            s8i          a8, a6, 128                           #   58: 824680
.Lbr002:    ret                                                #   5b: 0df0

            .literal_position                                  #   60: 00000000
                                                               #   64: 00000000

# Function @ .irom0.text+0x68
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      ieee80211_pwrsave
            .type        ieee80211_pwrsave, @function
ieee80211_pwrsave:
            mov          a6, a2 /* arg0 */                     #   68: 6d02
            addi         sp, sp, -16 /* (local0) */            #   6a: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   6d: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   6f: 0901
            l32i         a2, a2, 196 /* [arg0+0xc4] */         #   71: 222231
            l32i         a0, a6, 192 /* [arg0+0xc0] */         #   74: 022630
            mov          a12, a3 /* arg1 */                    #   77: cd03
            blt          a0, a2, .Lbr003                       #   79: 27201e
            l32i         a3, a6, 200 /* [arg0+0xc8] */         #   7c: 322632
            l32i         a2, a12, 0 /* [arg1] */               #   7f: 280c
            addi         a3, a3, 1 /* [arg0+0xc8]+0x1 */       #   81: 1b33
            s32i         a3, a6, 200 /* [arg0+0xc8]+0x1 -> [arg0+0xc8] */ #   83: 326632
            call0        pbuf_free                             #   86: 01f6ffc0
                                                               #   8a: 0000
            mov          a2, a12 /* arg1 */                    #   8c: 2d0c
            movi         a3, 1 /* 0x00000001 */                #   8e: 0c13
            call0        esf_buf_recycle                       #   90: 01f5ffc0
                                                               #   94: 0000
            movi         a2, 1 /* 0x00000001 */                #   96: 0c12
            j            .Lbr007                               #   98: 060b00
.Lbr003:    addi         a4, a0, 1 /* [arg0+0xc0]+0x1 */       #   9b: 1b40
            movi         a7, 0 /* 0x00000000 */                #   9d: 0c07
            l32i         a5, a6, 212 /* [arg0+0xd4] */         #   9f: 522635
            l32i         a2, a6, 208 /* [arg0+0xd0] */         #   a2: 222634
            addi         a5, a5, 1 /* [arg0+0xd4]+0x1 */       #   a5: 1b55
            bnez         a2, .Lbr004                           #   a7: cc42
            s32i         a3, a6, 204 /* arg1 -> [arg0+0xcc] */ #   a9: 326633
            j            .Lbr005                               #   ac: 460000
.Lbr004:    s32i         a3, a2, 28 /* arg1 -> [[arg0+0xd0]+0x1c] */ #   af: 3972
.Lbr005:    s32i         a7, a12, 28 /* 0x00000000 -> [arg1+0x1c] */ #   b1: 797c
            s32i         a12, a6, 208 /* arg1 -> [arg0+0xd0] */ #   b3: c26634
            s32i         a4, a6, 192 /* [arg0+0xc0]+0x1 -> [arg0+0xc0] */ #   b6: 426630
            s32i         a5, a6, 212 /* [arg0+0xd4]+0x1 -> [arg0+0xd4] */ #   b9: 526635
            bnei         a4, 1, .Lbr006                        #   bc: 661406
            mov          a2, a6 /* arg0 */                     #   bf: 2d06
            movi         a3, 1 /* 0x00000001 */                #   c1: 0c13
            call0        ieee80211_set_tim                     #   c3: 050000
.Lbr006:    movi         a2, 0 /* 0x00000000 */                #   c6: 0c02
.Lbr007:    l32i         a12, sp, 4 /* [(local1)] */           #   c8: c811
            l32i         a0, sp, 0 /* [(local0)] */            #   ca: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   cc: 12c110
            ret                                                #   cf: 0df0

            .literal_position                                  #   d4: 00000000
                                                               #   d8: 00000000
                                                               #   dc: 00000000

# Function @ .irom0.text+0xe0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
.Lfunc001:  addi         sp, sp, -16 /* (local0) */            #   e0: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   e3: 0901
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #   e5: e931
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   e7: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #   e9: d921
            mov          a12, a2 /* arg0 */                    #   eb: cd02
            l32i         a13, a2, 204 /* [arg0+0xcc] */        #   ed: d22233
            movi         a14, 0 /* 0x00000000 */               #   f0: 0c0e
            bnez         a13, .Lbr008                          #   f2: cc1d
            j            .Lbr012                               #   f4: 061000
.Lbr008:    l32i         a2, a13, 28 /* [[arg0+0xcc]+0x1c] */  #   f7: 287d
            s32i         a2, a12, 204 /* [[arg0+0xcc]+0x1c] -> [arg0+0xcc] */ #   f9: 226c33
            call0        chm_check_same_channel                #   fc: 01f7ffc0
                                                               #  100: 0000
            beqz         a2, .Lbr009                           #  102: 8c92
            mov          a2, a13 /* [arg0+0xcc] */             #  104: 2d0d
            call0        ppTxPkt                               #  106: 01f5ffc0
                                                               #  10a: 0000
            j            .Lbr010                               #  10c: c60300
.Lbr009:    movi         a5, g_ic                              #  10f: 51f1ff
            addi         a4, a13, 28 /* [arg0+0xcc]+0x1c */    #  112: 42cd1c
            l32i         a6, a5, 0x1c4 /* [g_ic+0x1c4] */      #  115: 622571
            s32i         a14, a13, 28 /* 0x00000000 -> [[arg0+0xcc]+0x1c] */ #  118: e97d
            s32i         a13, a6, 0 /* [arg0+0xcc] -> [[g_ic+0x1c4]] */ #  11a: d906
            s32i         a4, a5, 0x1c4 /* [arg0+0xcc]+0x1c -> [g_ic+0x1c4] */ #  11c: 426571
.Lbr010:    l32i         a7, a12, 192 /* [arg0+0xc0] */        #  11f: 722c30
            l32i         a13, a12, 204 /* [arg0+0xcc] */       #  122: d22c33
            addi         a7, a7, -1 /* [arg0+0xc0]-0x1 */      #  125: 0b77
            s32i         a7, a12, 192 /* [arg0+0xc0]-0x1 -> [arg0+0xc0] */ #  127: 726c30
            beqz         a13, .Lbr011                          #  12a: 8c1d
            j            .Lbr008                               #  12c: c6f1ff
.Lbr011:    s32i         a14, a12, 208 /* 0x00000000 -> [arg0+0xd0] */ #  12f: e26c34
            s32i         a14, a12, 204 /* 0x00000000 -> [arg0+0xcc] */ #  132: e26c33
            s32i         a14, a12, 212 /* 0x00000000 -> [arg0+0xd4] */ #  135: e26c35
.Lbr012:    l32i         a0, sp, 0 /* [(local0)] */            #  138: 0801
            s32i         a14, a12, 192 /* 0x00000000 -> [arg0+0xc0] */ #  13a: e26c30
            l32i         a13, sp, 8 /* [(local2)] */           #  13d: d821
            l32i         a12, sp, 4 /* [(local1)] */           #  13f: c811
            l32i         a14, sp, 12 /* [(local3)] */          #  141: e831
            addi         sp, sp, 16 /* (top of frame) */       #  143: 12c110
            ret                                                #  146: 0df0

# Function @ .irom0.text+0x148
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      ieee80211_node_pwrsave
            .type        ieee80211_node_pwrsave, @function
ieee80211_node_pwrsave:
            addi         sp, sp, -16 /* (local0) */            #  148: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  14b: 0911
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  14d: 2901
            l32i         a0, a2, 8 /* [arg0+0x8] */            #  14f: 0822
            beqz         a3, .Lbr013                           #  151: 8c83
            movi         a3, 16 /* 0x00000010 */               #  153: 1c03
            or           a3, a0, a3                            #  155: 303020
            s32i         a3, a2, 8 /* a3 -> [arg0+0x8] */      #  158: 3922
            j            .Lbr014                               #  15a: c60500
.Lbr013:    movi         a3, 0 /* 0x00000000 */                #  15d: 0c03
            movi         a4, -17 /* 0xffffffef */              #  15f: 6cf4
            and          a4, a0, a4                            #  161: 404010
            s32i         a4, a2, 8 /* a4 -> [arg0+0x8] */      #  164: 4922
            call0        ieee80211_set_tim                     #  166: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #  169: 0801
            l32i         a5, a0, 192 /* [[(local0)]+0xc0] */   #  16b: 522030
            beqz         a5, .Lbr014                           #  16e: 8c35
            mov          a2, a0 /* [(local0)] */               #  170: 2d00
            call0        .Lfunc001                             #  172: c5f6ff
.Lbr014:    l32i         a0, sp, 4 /* [(local1)] */            #  175: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  177: 12c110
            ret                                                #  17a: 0df0

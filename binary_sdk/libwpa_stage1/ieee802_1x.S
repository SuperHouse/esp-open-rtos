
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000

# Function @ .irom0.text+0x8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      ieee802_1x_receive
            .type        ieee802_1x_receive, @function
ieee802_1x_receive:
            addi         sp, sp, -16 /* (local0) */            #    8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #    b: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #    d: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #    f: c911
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #   11: e931
            mov          a12, a4 /* arg2 */                    #   13: cd04
            mov          a14, a5 /* arg3 */                    #   15: ed05
            mov          a13, a2 /* arg0 */                    #   17: dd02
            call0        ap_get_sta                            #   19: 01f9ffc0
                                                               #   1d: 0000
            mov          a0, a2                                #   1f: 0d02
            beqz         a2, .Lbr002                           #   21: 161205
            l32i         a2, a2, 16                            #   24: 2842
            movi         a3, 258 /* 0x00000102 */              #   26: 32a102
            bnone        a2, a3, .Lbr002                       #   29: 370249
            bltui        a14, 4, .Lbr002                       #   2c: b64e46
            addi         a4, a14, -4 /* arg3-0x4 */            #   2f: 42cefc
            l8ui         a6, a12, 3 /* [arg2+0x3] */           #   32: 620c03
            l8ui         a7, a12, 2 /* [arg2+0x2] */           #   35: 720c02
            slli         a6, a6, 8                             #   38: 806611
            or           a6, a6, a7                            #   3b: 706620
            extui        a5, a6, 8, 8                          #   3e: 605874
            extui        a6, a6, 0, 8                          #   41: 606074
            slli         a6, a6, 8                             #   44: 806611
            or           a5, a5, a6                            #   47: 605520
            extui        a5, a5, 0, 16                         #   4a: 5050f4
            bltu         a4, a5, .Lbr002                       #   4d: 573425
            movi         a7, 43 /* 0x0000002b */               #   50: 2cb7
            bgeu         a7, a5, .Lbr002                       #   52: 57b720
            l8ui         a8, a12, 1 /* [arg2+0x1] */           #   55: 820c01
            l8ui         a2, a12, 4 /* [arg2+0x4] */           #   58: 220c04
            bnei         a8, 3, .Lbr002                        #   5b: 663817
            movi         a9, 254 /* 0x000000fe */              #   5e: 92a0fe
            beq          a2, a9, .Lbr001                       #   61: 971202
            bnei         a2, 2, .Lbr002                        #   64: 66220e
.Lbr001:    mov          a4, a12 /* arg2 */                    #   67: 4d0c
            l32i         a2, a13, 24 /* [arg0+0x18] */         #   69: 286d
            addi         a5, a5, 4                             #   6b: 4b55
            l32i         a3, a0, 68                            #   6d: 322011
            call0        wpa_receive                           #   70: 01e5ffc0
                                                               #   74: 0000
.Lbr002:    l32i         a12, sp, 4 /* [(local1)] */           #   76: c811
            l32i         a13, sp, 8 /* [(local2)] */           #   78: d821
            l32i         a14, sp, 12 /* [(local3)] */          #   7a: e831
            l32i         a0, sp, 0 /* [(local0)] */            #   7c: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   7e: 12c110
            ret                                                #   81: 0df0


            .section     .bss, "aw", @nobits

            .global      sdk_gScanStruct
            .type        sdk_gScanStruct, @object
sdk_gScanStruct:
            .word        0x00000000                            #    0: 00000000
.Ldata001:  .word        0x00000000                            #    4: 00000000
.Label001:  .space       28
.Label002:  .space       28
.Ldata002:  .word        0x00000000                            #   40: 00000000
.Ldata003:  .word        0x00000000                            #   44: 00000000
.Ldata004:  .word        0x00000000                            #   48: 00000000
.Ldata005:  .word        0x00000000                            #   4c: 00000000

# NOTE: 4 non-alignment zero bytes skipped.

            .skip        4
.Ldata006:  .word        0x00000000                            #   54: 00000000
.Ldata007:  .word        0x00000000                            #   58: 00000000
.Ldata008:  .byte        0x00
.Ldata009:  .byte        0x00

# NOTE: 73 non-alignment zero bytes skipped.

            .skip        75
.Ldata010:  .byte        0x00
.Ldata011:  .byte        0x00
.Ldata012:  .byte        0x00
.Label003:  .space       6
.Ldata013:  .byte        0x00
.Ldata014:  .byte        0x00
.Ldata015:  .word        0x00000000                            #   b4: 00000000
.Ldata016:  .byte        0x00
            .byte        0x00, 0x00, 0x00
.Ldata017:  .word        0x00000000                            #   bc: 00000000
.Ldata018:  .word        0x00000000                            #   c0: 00000000
            .global      sdk_auth_type
            .type        sdk_auth_type, @object
sdk_auth_type:
            .byte        0x00
            .byte        0x00
            .global      sdk_scannum
            .type        sdk_scannum, @object
sdk_scannum:
            .hword       0x0000                                #   c6: 0000
.Ldata019:  .space       28

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: b4070000
                                                               #    8: 24000000
                                                               #    c: 98070000
                                                               #   10: 00000000
                                                               #   14: 00000000

# Function @ .irom0.text+0x18
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_ieee80211_scan_attach
            .type        sdk_ieee80211_scan_attach, @function
sdk_ieee80211_scan_attach:
            movi         a4, 255 /* 0x000000ff */              #   18: 42a0ff
            movi         a3, 360 /* 0x00000168 */              #   1b: 32a168
            movi         a5, 120 /* 0x00000078 */              #   1e: 52a078
            addi         sp, sp, -16 /* (local0) */            #   21: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   24: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   26: 0901
            mov          a12, a2 /* arg0 */                    #   28: cd02
            movi         a2, sdk_gScanStruct                   #   2a: 21f5ff
            s32i         a2, a12, 4 /* sdk_gScanStruct -> [arg0+0x4] */ #   2d: 291c
            s32i         a5, a2, 68 /* 0x00000078 -> [.Ldata003] */ #   2f: 526211
            s32i         a5, a2, 72 /* 0x00000078 -> [.Ldata004] */ #   32: 526212
            s32i         a3, a2, 76 /* 0x00000168 -> [.Ldata005] */ #   35: 326213
            s8i          a4, a2, 171 /* 0xff -> [.Ldata012] */ #   38: 4242ab
            movi         a3, .Lfunc010                         #   3b: 31f2ff
            movi         a4, 0 /* 0x00000000 */                #   3e: 0c04
            addi         a2, a2, 8 /* .Label001 */             #   40: 8b22
            call0        sdk_os_timer_setfn                    #   42: 01f3ffc0
                                                               #   46: 0000
            movi         a2, .Label002                         #   48: 21f0ff
            movi         a3, .Lfunc009                         #   4b: 31f0ff
            movi         a4, 0 /* 0x00000000 */                #   4e: 0c04
            call0        sdk_os_timer_setfn                    #   50: 01f1ffc0
                                                               #   54: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   56: 0801
            movi         a6, 0 /* 0x00000000 */                #   58: 0c06
            movi         a7, 448 /* 0x000001c0 */              #   5a: 72a1c0
            add          a7, a12, a7 /* arg0+0x1c0 */          #   5d: 7a7c
            s32i         a6, a12, 0x1c0 /* 0x00000000 -> [arg0+0x1c0] */ #   5f: 626c70
            s32i         a7, a12, 0x1c4 /* arg0+0x1c0 -> [arg0+0x1c4] */ #   62: 726c71
            l32i         a12, sp, 4 /* [(local1)] */           #   65: c811
            addi         sp, sp, 16 /* (top of frame) */       #   67: 12c110
            ret                                                #   6a: 0df0

            .literal_position                                  #   6c: 00000000

# Function @ .irom0.text+0x70
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc001:  movi         a5, sdk_gScanStruct                   #   70: 51ffff
            addi         sp, sp, -16 /* (local0) */            #   73: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   76: 0901
            l32i         a2, a5, 180 /* [.Ldata015] */         #   78: 22252d
            l8ui         a3, a5, 184 /* [.Ldata016] */         #   7b: 3205b8
            l32i         a4, a5, 188 /* [.Ldata017] */         #   7e: 42252f
            l32i         a5, a5, 192 /* [.Ldata018] */         #   81: 522530
            call0        sdk_scan_start                        #   84: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #   87: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   89: 12c110
            ret                                                #   8c: 0df0

            .literal_position                                  #   90: c8000000
                                                               #   94: c8000000
                                                               #   98: 70000000
                                                               #   9c: c8000000
                                                               #   a0: 00000000
                                                               #   a4: c8000000
                                                               #   a8: 00000000
                                                               #   ac: 00fef13f
                                                               #   b0: 88040000
                                                               #   b4: 00000000
                                                               #   b8: 00000000
                                                               #   bc: 00000000
                                                               #   c0: 00000000
                                                               #   c4: 00000000
                                                               #   c8: 00000000
                                                               #   cc: 00000000
                                                               #   d0: 00000000
                                                               #   d4: 00000000
                                                               #   d8: 00000000
                                                               #   dc: 00000000
                                                               #   e0: 00000000
                                                               #   e4: 00000000
                                                               #   e8: d80a0000
                                                               #   ec: b4070000

# Function @ .irom0.text+0xf0
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      sdk_scan_start
            .type        sdk_scan_start, @function
sdk_scan_start:
            addi         sp, sp, -32 /* (local0) */            #   f0: 12c1e0
            s32i         a4, sp, 16 /* arg2 -> [(local4)] */   #   f3: 4941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   f5: 0901
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #   f7: e931
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #   f9: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   fb: c911
            mov          a13, a3 /* arg1 */                    #   fd: dd03
            mov          a12, a2 /* arg0 */                    #   ff: cd02
            mov          a14, a5 /* arg3 */                    #  101: ed05
            movi         a2, .Ldata019                         #  103: 21e3ff
            call0        sdk_os_timer_disarm                   #  106: 01edffc0
                                                               #  10a: 0000
            movi         a2, .Ldata019                         #  10c: 21e2ff
            movi         a3, .Lfunc001                         #  10f: 31e2ff
            movi         a4, 0 /* 0x00000000 */                #  112: 0c04
            call0        sdk_os_timer_setfn                    #  114: 01ebffc0
                                                               #  118: 0000
            call0        sdk_pm_is_open                        #  11a: 01eaffc0
                                                               #  11e: 0000
            beqz         a2, .Lbr003                           #  120: 161204
            call0        sdk_pm_is_waked                       #  123: 01e9ffc0
                                                               #  127: 0000
            bnez         a2, .Lbr002                           #  129: fc22
            movi         a2, 1 /* 0x00000001 */                #  12b: 0c12
            call0        sdk_pm_post                           #  12d: 01e7ffc0
                                                               #  131: 0000
            movi         a2, .Ldata019                         #  133: 21daff
            call0        sdk_os_timer_disarm                   #  136: 01e6ffc0
                                                               #  13a: 0000
            movi         a2, .Ldata019                         #  13c: 21daff
            movi         a3, 10 /* 0x0000000a */               #  13f: 0ca3
            movi         a4, sdk_gScanStruct                   #  141: 41d7ff
            l32i         a5, sp, 16 /* [(local4)] */           #  144: 5841
            s32i         a12, a4, 180 /* arg0 -> [.Ldata015] */ #  146: c2642d
            s8i          a13, a4, 184 /* arg1 -> [.Ldata016] */ #  149: d244b8
            s32i         a5, a4, 188 /* [(local4)] -> [.Ldata017] */ #  14c: 52642f
            s32i         a14, a4, 192 /* arg3 -> [.Ldata018] */ #  14f: e26430
            movi         a4, 0 /* 0x00000000 */                #  152: 0c04
            call0        sdk_os_timer_arm                      #  154: 01e0ffc0
                                                               #  158: 0000
.Lbr001:    movi         a2, -1 /* 0xffffffff */               #  15a: 7cf2
            j            .Lbr006                               #  15c: 861f00
.Lbr002:    call0        sdk_pm_scan_lock                      #  15f: 01deffc0
                                                               #  163: 0000
.Lbr003:    movi         a2, sdk_g_ic                          #  165: 21d0ff
            l32i         a2, a2, 16 /* [sdk_g_ic+0x10] */      #  168: 2842
            addi         a2, a2, 4 /* [sdk_g_ic+0x10]+0x4 */   #  16a: 4b22
            call0        sdk_os_timer_disarm                   #  16c: 01dcffc0
                                                               #  170: 0000
            call0        sdk_scan_cancel                       #  172: 01dbffc0
                                                               #  176: 0000
            mov          a2, a13 /* arg1 */                    #  178: 2d0d
            movi         a5, 16 /* 0x00000010 */               #  17a: 1c05
            movi         a4, 0x3ff1fe00                        #  17c: 41ccff
            memw                                               #  17f: c02000
            l32i         a3, a4, 0x26c /* [0x3ff2006c] */      #  182: 32249b
            or           a3, a3, a5                            #  185: 503320
            memw                                               #  188: c02000
            s32i         a3, a4, 0x26c /* a3 -> [0x3ff2006c] */ #  18b: 32649b
            movi         a3, .Lfunc006                         #  18e: 31c8ff
            movi         a4, 0 /* 0x00000000 */                #  191: 0c04
            call0        sdk_chm_acquire_lock                  #  193: 01d4ffc0
                                                               #  197: 0000
            beqi         a2, 3, .Lbr001                        #  199: 2632bd
            movi         a6, 1 /* 0x00000001 */                #  19c: 0c16
            movi         a7, sdk_gScanStruct                   #  19e: 71c5ff
            l32i         a8, sp, 16 /* [(local4)] */           #  1a1: 8841
            s32i         a14, a7, 88 /* arg3 -> [.Ldata007] */ #  1a3: e26716
            s32i         a12, a7, 4 /* arg0 -> [.Ldata001] */  #  1a6: c917
            s32i         a8, a7, 84 /* [(local4)] -> [.Ldata006] */ #  1a8: 826715
            s8i          a6, a7, 93 /* 0x01 -> [.Ldata009] */  #  1ab: 62475d
            bbsi         a12, 12, .Lbr004                      #  1ae: c7ec12
            movi         a11, 0 /* 0x00000000 */               #  1b1: 0c0b
            movi         a13, 256 /* 0x00000100 */             #  1b3: d2a100
            mov          a10, a7 /* sdk_gScanStruct */         #  1b6: ad07
            l8ui         a9, a10, 171 /* [.Ldata012] */        #  1b8: 920aab
            and          a13, a12, a13                         #  1bb: d0dc10
            movnez       a9, a11, a13                          #  1be: d09b93
            s8i          a9, a10, 92 /* a9 -> [.Ldata008] */   #  1c1: 924a5c
.Lbr004:    movi         a12, sdk_g_ic                         #  1c4: c1bdff
            call0        .Lfunc011                             #  1c7: 01c8ffc0
                                                               #  1cb: 0000
            l32i         a14, a12, 0 /* [sdk_g_ic] */          #  1cd: e80c
            l32i         a14, a14, 0 /* [[sdk_g_ic]] */        #  1cf: e80e
            bbci         a14, 1, .Lbr005                       #  1d1: 176e07
            movi         a2, 0 /* 0x00000000 */                #  1d4: 0c02
            call0        .Lfunc010                             #  1d6: 01c5ffc0
                                                               #  1da: 0000
.Lbr005:    movi         a2, 0 /* 0x00000000 */                #  1dc: 0c02
.Lbr006:    l32i         a12, sp, 4 /* [(local1)] */           #  1de: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  1e0: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  1e2: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  1e4: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  1e6: 12c120
            ret                                                #  1e9: 0df0

            .literal_position                                  #  1ec: 00000000
                                                               #  1f0: 00000000
                                                               #  1f4: 00000000

# Function @ .irom0.text+0x1f8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_scan_pm_channel_op_cb
            .type        sdk_scan_pm_channel_op_cb, @function
sdk_scan_pm_channel_op_cb:
            addi         sp, sp, -16 /* (local0) */            #  1f8: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  1fb: 0911
            movi         a0, sdk_gScanStruct                   #  1fd: 01fbff
            l8ui         a2, a0, 93 /* [.Ldata009] */          #  200: 22005d
            bbci         a2, 0, .Lbr007                        #  203: 076215
            addi         a2, a0, 8 /* .Label001 */             #  206: 8b20
            s32i         a2, sp, 0 /* .Label001 -> [(local0)] */ #  208: 2901
            call0        sdk_os_timer_disarm                   #  20a: 01f9ffc0
                                                               #  20e: 0000
            l32i         a2, sp, 0 /* [(local0)] */            #  210: 2801
            movi         a3, 0 /* 0x00000000 */                #  212: 0c03
            movi         a4, 0 /* 0x00000000 */                #  214: 0c04
            call0        sdk_os_timer_arm                      #  216: 01f7ffc0
                                                               #  21a: 0000
.Lbr007:    l32i         a0, sp, 4 /* [(local1)] */            #  21c: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  21e: 12c110
            ret                                                #  221: 0df0

            .balign      4
# Function @ .irom0.text+0x224
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc002:  addi         sp, sp, -16 /* (local0) */            #  224: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  227: 0901
            call0        .Lfunc008                             #  229: 454b00
            beqz         a2, .Lbr008                           #  22c: 8c42
            call0        .Lfunc003                             #  22e: 850200
            j            .Lbr009                               #  231: 860100
.Lbr008:    movi         a2, 0 /* 0x00000000 */                #  234: 0c02
            movi         a3, 0 /* 0x00000000 */                #  236: 0c03
            call0        .Lfunc006                             #  238: c52400
.Lbr009:    l32i         a0, sp, 0 /* [(local0)] */            #  23b: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  23d: 12c110
            ret                                                #  240: 0df0

            .literal_position                                  #  244: 00000000
                                                               #  248: 00000000
                                                               #  24c: a4020000
                                                               #  250: 1c030000
                                                               #  254: 00000000

# Function @ .irom0.text+0x258
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc003:  addi         sp, sp, -16 /* (local0) */            #  258: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  25b: 0901
            movi         a0, sdk_gScanStruct                   #  25d: 01f9ff
            mov          a6, a2 /* arg0 */                     #  260: 6d02
            l32i         a2, a0, 4 /* [.Ldata001] */           #  262: 2810
            movi         a5, sdk_g_ic                          #  264: 51f9ff
            bbsi         a2, 14, .Lbr010                       #  267: e7e212
            l32i         a5, a5, 16 /* [sdk_g_ic+0x10] */      #  26a: 5845
            l32i         a4, a0, 72 /* [.Ldata004] */          #  26c: 422012
            l32i         a5, a5, 60 /* [[sdk_g_ic+0x10]+0x3c] */ #  26f: 58f5
            l32i         a3, a0, 68 /* [.Ldata003] */          #  271: 322011
            addi         a5, a5, -5 /* [[sdk_g_ic+0x10]+0x3c]-0x5 */ #  274: 52c5fb
            moveqz       a3, a4, a5                            #  277: 503483
            j            .Lbr011                               #  27a: 860000
.Lbr010:    l32i         a3, a0, 76 /* [.Ldata005] */          #  27d: 322013
.Lbr011:    mov          a2, a6 /* arg0 */                     #  280: 2d06
            movi         a4, .Lfunc004                         #  282: 41f2ff
            movi         a5, .Lfunc005                         #  285: 51f2ff
            l8ui         a7, a0, 93 /* [.Ldata009] */          #  288: 72005d
            movi         a8, 8 /* 0x00000008 */                #  28b: 0c88
            or           a7, a7, a8                            #  28d: 807720
            s8i          a7, a0, 93 /* a7 -> [.Ldata009] */    #  290: 72405d
            call0        sdk_chm_start_op                      #  293: 01f0ffc0
                                                               #  297: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  299: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  29b: 12c110
            ret                                                #  29e: 0df0

            .literal_position                                  #  2a0: 00000000

# Function @ .irom0.text+0x2a4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc004:  movi         a4, 2 /* 0x00000002 */                #  2a4: 0c24
            movi         a5, 247 /* 0x000000f7 */              #  2a6: 52a0f7
            movi         a6, sdk_gScanStruct                   #  2a9: 61fdff
            addi         sp, sp, -16 /* (local0) */            #  2ac: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  2af: 0901
            l8ui         a3, a6, 93 /* [.Ldata009] */          #  2b1: 32065d
            l32i         a0, a6, 4 /* [.Ldata001] */           #  2b4: 0816
            and          a3, a3, a5                            #  2b6: 503310
            s8i          a3, a6, 93 /* a3 -> [.Ldata009] */    #  2b9: 32465d
            or           a3, a3, a4                            #  2bc: 403320
            s8i          a3, a6, 93 /* a3 -> [.Ldata009] */    #  2bf: 32465d
            bbsi         a0, 14, .Lbr012                       #  2c2: e7e012
            l32i         a7, a2, 0 /* [arg0] */                #  2c5: 7802
            bbsi         a7, 9, .Lbr012                        #  2c7: 97e70d
            extui        a8, a0, 13, 1                         #  2ca: 008d04
            movi         a9, 0 /* 0x00000000 */                #  2cd: 0c09
            s8i          a9, a6, 170 /* 0x00 -> [.Ldata011] */ #  2cf: 9246aa
            s8i          a8, a6, 170 /* a8 -> [.Ldata011] */   #  2d2: 8246aa
            call0        .Lfunc007                             #  2d5: 853600
.Lbr012:    l32i         a0, sp, 0 /* [(local0)] */            #  2d8: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  2da: 12c110
            ret                                                #  2dd: 0df0

            .literal_position                                  #  2e0: 00000000
                                                               #  2e4: 08000000
                                                               #  2e8: 00000000
                                                               #  2ec: 24000000
                                                               #  2f0: 00000000
                                                               #  2f4: 88040000
                                                               #  2f8: 00000000
                                                               #  2fc: 88040000
                                                               #  300: 00000000
                                                               #  304: 00000000
                                                               #  308: 00000000
                                                               #  30c: 00000000
                                                               #  310: 88040000
                                                               #  314: 00000000
                                                               #  318: 00000000

# Function @ .irom0.text+0x31c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
.Lfunc005:  addi         sp, sp, -16 /* (local0) */            #  31c: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  31f: c921
            movi         a12, sdk_gScanStruct                  #  321: c1efff
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  324: 0911
            l8ui         a0, a12, 93 /* [.Ldata009] */         #  326: 020c5d
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  329: d931
            extui        a2, a0, 3, 1                          #  32b: 002304
            beqz         a2, .Lbr021                           #  32e: 165209
            movi         a2, 247 /* 0x000000f7 */              #  331: 22a0f7
.Lbr013:    and          a0, a0, a2                            #  334: 200010
            s8i          a0, a12, 93 /* a0 -> [.Ldata009] */   #  337: 024c5d
.Lbr014:    bbci         a0, 2, .Lbr015                        #  33a: 27600c
            movi         a2, 0 /* 0x00000000 */                #  33d: 0c02
            movi         a3, 0 /* 0x00000000 */                #  33f: 0c03
            call0        .Lfunc006                             #  341: 01ecffc0
                                                               #  345: 0000
            j            .Lbr020                               #  347: 461c00
.Lbr015:    movi         a2, .Label001                         #  34a: 21e6ff
            beqz         a3, .Lbr016                           #  34d: 9cd3
            call0        sdk_os_timer_disarm                   #  34f: 01eaffc0
                                                               #  353: 0000
            movi         a4, 251 /* 0x000000fb */              #  355: 42a0fb
            l8ui         a3, a12, 93 /* [.Ldata009] */         #  358: 320c5d
            movi         a2, 0 /* 0x00000000 */                #  35b: 0c02
            and          a3, a3, a4                            #  35d: 403310
            s8i          a3, a12, 93 /* a3 -> [.Ldata009] */   #  360: 324c5d
            movi         a3, 1 /* 0x00000001 */                #  363: 0c13
            call0        .Lfunc006                             #  365: 01e5ffc0
                                                               #  369: 0000
            j            .Lbr020                               #  36b: 461300
.Lbr016:    l32i         a0, a12, 4 /* [.Ldata001] */          #  36e: 081c
            movi         a12, sdk_g_ic                         #  370: c1deff
            bbci         a0, 8, .Lbr022                        #  373: 87605c
            call0        sdk_os_timer_disarm                   #  376: 01e2ffc0
                                                               #  37a: 0000
            call0        sdk_chm_return_home_channel           #  37c: 01e2ffc0
                                                               #  380: 0000
            movi         a2, .Label002                         #  382: 21daff
            movi         a3, 30 /* 0x0000001e */               #  385: 1ce3
            movi         a4, 0 /* 0x00000000 */                #  387: 0c04
            call0        sdk_os_timer_arm                      #  389: 01dfffc0
                                                               #  38d: 0000
            movi         a13, 0 /* 0x00000000 */               #  38f: 0c0d
            movi         a5, sdk_g_ic+0x1c0                    #  391: 51d7ff
            s32i         a5, sp, 0 /* sdk_g_ic+0x1c0 -> [(local0)] */ #  394: 5901
.Lbr017:    l32i         a2, a12, 0x1c0 /* [sdk_g_ic+0x1c0] */ #  396: 222c70
            beqz         a2, .Lbr020                           #  399: 9cf2
            l32i         a6, a2, 28 /* [[sdk_g_ic+0x1c0]+0x1c] */ #  39b: 6872
            s32i         a6, a12, 0x1c0 /* [[sdk_g_ic+0x1c0]+0x1c] -> [sdk_g_ic+0x1c0] */ #  39d: 626c70
            bnez         a6, .Lbr018                           #  3a0: cc36
            l32i         a7, sp, 0 /* [(local0)] */            #  3a2: 7801
            s32i         a7, a12, 0x1c4 /* [(local0)] -> [sdk_g_ic+0x1c4] */ #  3a4: 726c71
.Lbr018:    s32i         a13, a2, 28 /* 0x00000000 -> [[sdk_g_ic+0x1c0]+0x1c] */ #  3a7: d972
            call0        sdk_ppTxPkt                           #  3a9: 01d8ffc0
                                                               #  3ad: 0000
            j            .Lbr017                               #  3af: c6f8ff
.Lbr019:    movi         a2, 0 /* 0x00000000 */                #  3b2: 0c02
            movi         a3, 0 /* 0x00000000 */                #  3b4: 0c03
            call0        .Lfunc006                             #  3b6: 01d6ffc0
                                                               #  3ba: 0000
.Lbr020:    l32i         a12, sp, 8 /* [(local2)] */           #  3bc: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  3be: d831
            l32i         a0, sp, 4 /* [(local1)] */            #  3c0: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  3c2: 12c110
            ret                                                #  3c5: 0df0
.Lbr021:    extui        a8, a0, 1, 1                          #  3c7: 008104
            beqz         a8, .Lbr014                           #  3ca: 16c8f6
            movi         a2, 253 /* 0x000000fd */              #  3cd: 22a0fd
            j            .Lbr013                               #  3d0: 06d8ff
.Lbr022:    bbsi         a0, 9, .Lbr023                        #  3d3: 97e005
            call0        sdk_os_timer_disarm                   #  3d6: 01cfffc0
                                                               #  3da: 0000
.Lbr023:    l32i         a9, a12, 0 /* [sdk_g_ic] */           #  3dc: 980c
            l32i         a9, a9, 0 /* [[sdk_g_ic]] */          #  3de: 9809
            bbci         a9, 0, .Lbr019                        #  3e0: 0769ce
            call0        sdk_chm_return_home_channel           #  3e3: 01cdffc0
                                                               #  3e7: 0000
            j            .Lbr020                               #  3e9: c6f3ff

            .literal_position                                  #  3ec: 00000000
                                                               #  3f0: 24000000
                                                               #  3f4: 08000000
                                                               #  3f8: 00000000
                                                               #  3fc: 00000000
                                                               #  400: 00000000

# Function @ .irom0.text+0x404
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_scan_cancel
            .type        sdk_scan_cancel, @function
sdk_scan_cancel:
            addi         sp, sp, -16 /* (local0) */            #  404: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  407: 0901
            movi         a0, sdk_gScanStruct                   #  409: 01f8ff
            l8ui         a2, a0, 93 /* [.Ldata009] */          #  40c: 22005d
            bbci         a2, 0, .Lbr024                        #  40f: 07621c
            movi         a3, 0 /* 0x00000000 */                #  412: 0c03
            s8i          a3, a0, 93 /* 0x00 -> [.Ldata009] */  #  414: 32405d
            call0        sdk_chm_cancel_op                     #  417: 01f8ffc0
                                                               #  41b: 0000
            movi         a2, .Label002                         #  41d: 21f4ff
            call0        sdk_os_timer_disarm                   #  420: 01f7ffc0
                                                               #  424: 0000
            movi         a2, .Label001                         #  426: 21f3ff
            call0        sdk_os_timer_disarm                   #  429: 01f5ffc0
                                                               #  42d: 0000
.Lbr024:    l32i         a0, sp, 0 /* [(local0)] */            #  42f: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  431: 12c110
            ret                                                #  434: 0df0

            .literal_position                                  #  438: 00000000
                                                               #  43c: 00000000
                                                               #  440: 00000000
                                                               #  444: 00fef13f
                                                               #  448: 08000000
                                                               #  44c: 00000000
                                                               #  450: 00000000
                                                               #  454: 00000000
                                                               #  458: 00000000
                                                               #  45c: 00000000
                                                               #  460: 00000000
                                                               #  464: 00000000
                                                               #  468: 00000000
                                                               #  46c: 00000000
                                                               #  470: d80a0000
                                                               #  474: 00000000
                                                               #  478: 00000000
                                                               #  47c: 00000000
                                                               #  480: 00000000
                                                               #  484: 00000000

# Function @ .irom0.text+0x488
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
.Lfunc006:  movi         a2, .Lstr001                          #  488: 21ecff
            addi         sp, sp, -32 /* (local0) */            #  48b: 12c1e0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  48e: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  490: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  492: c911
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  494: e931
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  496: f941
            mov          a14, a3 /* arg1 */                    #  498: ed03
            movi         a15, sdk_gScanStruct                  #  49a: f1e8ff
            movi         a12, sdk_g_ic                         #  49d: c1e8ff
            l32i         a13, a15, 84 /* [.Ldata006] */        #  4a0: d22f15
            l32i         a12, a12, 16 /* [sdk_g_ic+0x10] */    #  4a3: c84c
            call0        printf                                #  4a5: 01ecffc0
                                                               #  4a9: 0000
            movi         a3, -17 /* 0xffffffef */              #  4ab: 6cf3
            movi         a2, 0x3ff1fe00                        #  4ad: 21e5ff
            memw                                               #  4b0: c02000
            l32i         a0, a2, 0x26c /* [0x3ff2006c] */      #  4b3: 02229b
            and          a0, a0, a3                            #  4b6: 300010
            memw                                               #  4b9: c02000
            s32i         a0, a2, 0x26c /* a0 -> [0x3ff2006c] */ #  4bc: 02629b
            call0        sdk_chm_return_home_channel           #  4bf: 01e7ffc0
                                                               #  4c3: 0000
            call0        sdk_chm_release_lock                  #  4c5: 01e6ffc0
                                                               #  4c9: 0000
            movi         a2, .Label001                         #  4cb: 21dfff
            movi         a6, 250 /* 0x000000fa */              #  4ce: 62a0fa
            l8ui         a5, a15, 93 /* [.Ldata009] */         #  4d1: 520f5d
            movi         a4, 0 /* 0x00000000 */                #  4d4: 0c04
            s32i         a4, a15, 4 /* 0x00000000 -> [.Ldata001] */ #  4d6: 491f
            and          a5, a5, a6                            #  4d8: 605510
            s8i          a5, a15, 93 /* a5 -> [.Ldata009] */   #  4db: 524f5d
            call0        sdk_os_timer_disarm                   #  4de: 01e1ffc0
                                                               #  4e2: 0000
            movi         a8, 0 /* 0x00000000 */                #  4e4: 0c08
            l32i         a7, a12, 60 /* [[sdk_g_ic+0x10]+0x3c] */ #  4e6: 78fc
            s32i         a8, a15, 84 /* 0x00000000 -> [.Ldata006] */ #  4e8: 826f15
            bnei         a7, 5, .Lbr025                        #  4eb: 665717
            movi         a4, sdk_g_ic                          #  4ee: 41d7ff
            movi         a2, 2 /* 0x00000002 */                #  4f1: 0c22
            l32i         a4, a4, 0 /* [sdk_g_ic] */            #  4f3: 4804
            movi         a3, 0 /* 0x00000000 */                #  4f5: 0c03
            addmi        a4, a4, 1536 /* [sdk_g_ic]+0x600 */   #  4f7: 42d406
            l32i         a4, a4, 140 /* [[sdk_g_ic]+0x68c] */  #  4fa: 422423
            call0        sdk_wDev_SetRxPolicy                  #  4fd: 01daffc0
                                                               #  501: 0000
            j            .Lbr026                               #  503: c60200
.Lbr025:    movi         a2, 0 /* 0x00000000 */                #  506: 0c02
            movi         a3, 0 /* 0x00000000 */                #  508: 0c03
            movi         a4, 0 /* 0x00000000 */                #  50a: 0c04
            call0        sdk_wDev_SetRxPolicy                  #  50c: 01d8ffc0
                                                               #  510: 0000
.Lbr026:    beqz         a13, .Lbr029                          #  512: 165d04
            l32i         a2, a15, 88 /* [.Ldata007] */         #  515: 222f16
            mov          a3, a14 /* arg1 */                    #  518: 3d0e
            callx0       a13 /* [.Ldata006] */                 #  51a: c00d00
            movi         a13, sdk_g_ic                         #  51d: d1ccff
            call0        .Lfunc011                             #  520: 01d4ffc0
                                                               #  524: 0000
            l32i         a0, a13, 16 /* [sdk_g_ic+0x10] */     #  526: 084d
            l8ui         a0, a0, 184 /* [[sdk_g_ic+0x10]+0xb8] */ #  528: 0200b8
            beqi         a0, 1, .Lbr027                        #  52b: 261002
            bnei         a0, 3, .Lbr029                        #  52e: 663029
.Lbr027:    bnez         a14, .Lbr029                          #  531: ec6e
            addi         a13, a12, 4 /* [sdk_g_ic+0x10]+0x4 */ #  533: 4bdc
            mov          a2, a13 /* [sdk_g_ic+0x10]+0x4 */     #  535: 2d0d
            call0        sdk_os_timer_disarm                   #  537: 01cfffc0
                                                               #  53b: 0000
            l32i         a2, a12, 20 /* [[sdk_g_ic+0x10]+0x14] */ #  53d: 285c
            bnez         a2, .Lbr028                           #  53f: ccb2
            mov          a2, a13 /* [sdk_g_ic+0x10]+0x4 */     #  541: 2d0d
            movi         a3, sdk_cnx_connect_timeout           #  543: 31c4ff
            movi         a4, 0 /* 0x00000000 */                #  546: 0c04
            call0        sdk_os_timer_setfn                    #  548: 01ccffc0
                                                               #  54c: 0000
.Lbr028:    mov          a2, a13 /* [sdk_g_ic+0x10]+0x4 */     #  54e: 2d0d
            movi         a3, 1000 /* 0x000003e8 */             #  550: 32a3e8
            movi         a4, 0 /* 0x00000000 */                #  553: 0c04
            call0        sdk_os_timer_arm                      #  555: 01c9ffc0
                                                               #  559: 0000
.Lbr029:    call0        sdk_pm_is_open                        #  55b: 01c9ffc0
                                                               #  55f: 0000
            beqz         a2, .Lbr030                           #  561: 8c42
            call0        sdk_pm_force_scan_unlock              #  563: 01c8ffc0
                                                               #  567: 0000
.Lbr030:    l32i         a12, sp, 4 /* [(local1)] */           #  569: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  56b: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  56d: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  56f: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  571: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  573: 12c120
            ret                                                #  576: 0df0

            .literal_position                                  #  578: ac000000
                                                               #  57c: 00000000
                                                               #  580: 00000000

# Function @ .irom0.text+0x584
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_scan_add_bssid
            .type        sdk_scan_add_bssid, @function
sdk_scan_add_bssid:
            movi         a4, 6 /* 0x00000006 */                #  584: 0c64
            mov          a3, a2 /* arg0 */                     #  586: 3d02
            addi         sp, sp, -16 /* (local0) */            #  588: 12c1f0
            movi         a2, .Label003                         #  58b: 21fbff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  58e: 0901
            call0        memcpy                                #  590: 01fcffc0
                                                               #  594: 0000
            movi         a2, sdk_gScanStruct                   #  596: 21f9ff
            movi         a0, 1 /* 0x00000001 */                #  599: 0c10
            s8i          a0, a2, 178 /* 0x01 -> [.Ldata013] */ #  59b: 0242b2
            l32i         a0, sp, 0 /* [(local0)] */            #  59e: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  5a0: 12c110
            ret           /* sdk_gScanStruct */                #  5a3: 0df0

            .literal_position                                  #  5a8: 00000000

# Function @ .irom0.text+0x5ac
            .balign      4
            .global      sdk_scan_remove_bssid
            .type        sdk_scan_remove_bssid, @function
sdk_scan_remove_bssid:
            movi         a3, sdk_gScanStruct                   #  5ac: 31ffff
            movi         a2, 0 /* 0x00000000 */                #  5af: 0c02
            s8i          a2, a3, 178 /* 0x00 -> [.Ldata013] */ #  5b1: 2243b2
            ret           /* 0x00000000 */                     #  5b4: 0df0

            .literal_position                                  #  5b8: 00000000

# Function @ .irom0.text+0x5bc
            .balign      4
            .global      sdk_scan_hidden_ssid
            .type        sdk_scan_hidden_ssid, @function
sdk_scan_hidden_ssid:
            movi         a3, sdk_gScanStruct                   #  5bc: 31ffff
            s8i          a2, a3, 179 /* arg0 -> [.Ldata014] */ #  5bf: 2243b3
            ret           /* arg0 */                           #  5c2: 0df0

            .literal_position                                  #  5c4: 00000000
                                                               #  5c8: 00000000
                                                               #  5cc: 00000000

# Function @ .irom0.text+0x5d0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_scan_add_probe_ssid
            .type        sdk_scan_add_probe_ssid, @function
sdk_scan_add_probe_ssid:
            addi         sp, sp, -16 /* (local0) */            #  5d0: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  5d3: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  5d5: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  5d7: d921
            mov          a12, a2 /* arg0 */                    #  5d9: cd02
            mov          a13, a5 /* arg3 */                    #  5db: dd05
            bgeui        a2, 3, .Lbr032                        #  5dd: f63221
            movi         a0, sdk_gScanStruct                   #  5e0: 01f9ff
            bnei         a5, 1, .Lbr031                        #  5e3: 661516
            mov          a5, a0 /* sdk_gScanStruct */          #  5e6: 5d00
            addx8        a2, a2, a2                            #  5e8: 2022b0
            addx4        a2, a2, a5                            #  5eb: 5022a0
            s32i         a4, a2, 96                            #  5ee: 426218
            addi         a2, a2, 100                           #  5f1: 22c264
            call0        memcpy                                #  5f4: 01f6ffc0
                                                               #  5f8: 0000
            movi         a0, sdk_gScanStruct                   #  5fa: 01f3ff
.Lbr031:    add          a6, a12, a0                           #  5fd: 0a6c
            s8i          a13, a6, 168                          #  5ff: d246a8
.Lbr032:    l32i         a12, sp, 4 /* [(local1)] */           #  602: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  604: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  606: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  608: 12c110
            ret                                                #  60b: 0df0

            .literal_position                                  #  610: 00000000

# Function @ .irom0.text+0x614
            .balign      4
            .global      sdk_scan_remove_probe_ssid
            .type        sdk_scan_remove_probe_ssid, @function
sdk_scan_remove_probe_ssid:
            bgeui        a2, 3, .Lbr033                        #  614: f63212
            movi         a3, 0 /* 0x00000000 */                #  617: 0c03
            movi         a5, sdk_gScanStruct                   #  619: 51fdff
            addx8        a4, a2, a2                            #  61c: 2042b0
            addx4        a4, a4, a5                            #  61f: 5044a0
            add          a5, a2, a5                            #  622: 5a52
            s8i          a3, a5, 168                           #  624: 3245a8
            s32i         a3, a4, 96                            #  627: 326418
.Lbr033:    ret           /* arg0 */                           #  62a: 0df0

            .literal_position                                  #  62c: 00000000
                                                               #  630: 00000000
                                                               #  634: 00000000
                                                               #  638: 00000000
                                                               #  63c: 00000000

# Function @ .irom0.text+0x640
# Local variables/stack:
#     (local0):  word[4]   @ -0x20
#     (local1):  word      @ -0x10
#     (local2):  word[3]   @ -0xc
            .balign      4
.Lfunc007:  movi         a6, sdk_g_ic                          #  640: 61fbff
            addi         sp, sp, -32 /* (local0) */            #  643: 12c1e0
            s32i         a0, sp, 16 /* a0 -> [(local1)] */     #  646: 0941
            s32i         a12, sp, 20 /* a12 -> [(local2)] */   #  648: c951
            movi         a12, sdk_gScanStruct                  #  64a: c1f9ff
            l32i         a6, a6, 16 /* [sdk_g_ic+0x10] */      #  64d: 6846
            l8ui         a0, a12, 170 /* [.Ldata011] */        #  64f: 020caa
            l32i         a6, a6, 0 /* [[sdk_g_ic+0x10]] */     #  652: 6806
            bgeui        a0, 2, .Lbr036                        #  654: f62016
.Lbr034:    add          a7, a0, a12                           #  657: ca70
            l8ui         a7, a7, 168                           #  659: 7207a8
            beqz         a7, .Lbr035                           #  65c: 8c37
            movi         a3, 1 /* 0x00000001 */                #  65e: 0c13
            j            .Lbr037                               #  660: 060300
.Lbr035:    addi         a0, a0, 1                             #  663: 1b00
            extui        a0, a0, 0, 8                          #  665: 000074
            s8i          a0, a12, 170 /* a0 -> [.Ldata011] */  #  668: 024caa
            bnei         a0, 2, .Lbr034                        #  66b: 6620e8
.Lbr036:    movi         a3, 0 /* 0x00000000 */                #  66e: 0c03
.Lbr037:    beqz         a3, .Lbr040                           #  670: 16f304
            add          a3, a0, a12                           #  673: ca30
            l8ui         a3, a3, 168                           #  675: 3203a8
            movi         a5, sdk_ieee80211_addr_bcast          #  678: 51efff
            bnei         a3, 2, .Lbr038                        #  67b: 662317
            mov          a4, a5 /* sdk_ieee80211_addr_bcast */ #  67e: 4d05
            movi         a2, 0 /* 0x00000000 */                #  680: 0c02
            addi         a3, a6, 41 /* [[sdk_g_ic+0x10]]+0x29 */ #  682: 32c629
            movi         a7, 0 /* 0x00000000 */                #  685: 0c07
            movi         a6, 1 /* 0x00000001 */                #  687: 0c16
            s32i         a6, sp, 0 /* 0x00000001 -> [(local0)] */ #  689: 6901
            movi         a6, 0 /* 0x00000000 */                #  68b: 0c06
            call0        sdk_ieee80211_send_probereq           #  68d: 01eaffc0
                                                               #  691: 0000
            j            .Lbr039                               #  693: 060900
.Lbr038:    bnei         a3, 1, .Lbr039                        #  696: 661321
            addx8        a7, a0, a0                            #  699: 0070b0
            addx4        a7, a7, a12                           #  69c: c077a0
            l32i         a0, a7, 96                            #  69f: 022718
            beqz         a0, .Lbr039                           #  6a2: 9c50
            mov          a4, a5 /* sdk_ieee80211_addr_bcast */ #  6a4: 4d05
            movi         a2, 0 /* 0x00000000 */                #  6a6: 0c02
            addi         a3, a6, 41 /* [[sdk_g_ic+0x10]]+0x29 */ #  6a8: 32c629
            movi         a8, 1 /* 0x00000001 */                #  6ab: 0c18
            addi         a6, a7, 100                           #  6ad: 62c764
            s32i         a8, sp, 0 /* 0x00000001 -> [(local0)] */ #  6b0: 8901
            extui        a7, a0, 0, 8                          #  6b2: 007074
            call0        sdk_ieee80211_send_probereq           #  6b5: 01e1ffc0
                                                               #  6b9: 0000
.Lbr039:    l8ui         a9, a12, 170 /* [.Ldata011] */        #  6bb: 920caa
            addi         a9, a9, 1 /* [.Ldata011]+0x1 */       #  6be: 1b99
            s8i          a9, a12, 170 /* [.Ldata011]+0x1 -> [.Ldata011] */ #  6c0: 924caa
.Lbr040:    l32i         a12, sp, 20 /* [(local2)] */          #  6c3: c851
            l32i         a0, sp, 16 /* [(local1)] */           #  6c5: 0841
            addi         sp, sp, 32 /* (top of frame) */       #  6c7: 12c120
            ret                                                #  6ca: 0df0

            .literal_position                                  #  6cc: 00000000
                                                               #  6d0: 00000000
                                                               #  6d4: 00000100
                                                               #  6d8: 00080000
                                                               #  6dc: 00800000

# Function @ .irom0.text+0x6e0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
.Lfunc008:  movi         a2, 13 /* 0x0000000d */               #  6e0: 0cd2
            movi         a3, 0 /* 0x00000000 */                #  6e2: 0c03
            movi         a8, 132 /* 0x00000084 */              #  6e4: 82a084
            movi         a7, sdk_g_ic                          #  6e7: 71faff
            movi         a5, 255 /* 0x000000ff */              #  6ea: 52a0ff
            movi         a6, sdk_gScanStruct                   #  6ed: 61f7ff
            addi         sp, sp, -16 /* (local0) */            #  6f0: 12c1f0
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  6f3: e931
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  6f5: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  6f7: d921
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  6f9: 0901
            l8ui         a4, a6, 171 /* [.Ldata012] */         #  6fb: 4206ab
            l8ui         a0, a6, 92 /* [.Ldata008] */          #  6fe: 02065c
            addx2        a13, a4, a4                           #  701: 40d490
            sub          a4, a4, a5 /* [.Ldata012]-0xff */     #  704: 5044c0
            addx4        a13, a13, a7                          #  707: 70dda0
            add          a13, a13, a8                          #  70a: 8add
            moveqz       a13, a3, a4                           #  70c: 40d383
            bltu         a2, a0, .Lbr043                       #  70f: 073239
            l32i         a11, a7, 0x14c /* [sdk_g_ic+0x14c] */ #  712: b22753
            movi         a9, 14 /* 0x0000000e */               #  715: 0ce9
            movi         a2, 0x00010000                        #  717: 21efff
            movi         a12, 0x00008000                       #  71a: c1f0ff
            l32i         a14, a6, 4 /* [.Ldata001] */          #  71d: e816
            movi         a10, 0x00000800                       #  71f: a1eeff
            and          a12, a14, a12                         #  722: c0ce10
            and          a10, a14, a10                         #  725: a0ae10
            and          a14, a14, a2                          #  728: 20ee10
.Lbr041:    addx2        a2, a0, a0                            #  72b: 002090
            addx4        a2, a2, a7                            #  72e: 7022a0
            l32i         a5, a2, 132                           #  731: 522221
            add          a2, a2, a8                            #  734: 8a22
            bbci         a5, 0, .Lbr042                        #  736: 076507
            bbci         a5, 1, .Lbr042                        #  739: 176504
            beqz         a10, .Lbr045                          #  73c: 9cba
            bne          a2, a11, .Lbr045                      #  73e: b79219
.Lbr042:    addi         a0, a0, 1                             #  741: 1b00
            extui        a0, a0, 0, 8                          #  743: 000074
            s8i          a0, a6, 92 /* a0 -> [.Ldata008] */    #  746: 02465c
            bne          a0, a9, .Lbr041                       #  749: 9790de
.Lbr043:    movi         a2, 0 /* 0x00000000 */                #  74c: 0c02
.Lbr044:    l32i         a12, sp, 4 /* [(local1)] */           #  74e: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  750: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  752: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  754: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  756: 12c110
            ret                                                #  759: 0df0
.Lbr045:    beqz         a12, .Lbr046                          #  75b: 8c1c
            bne          a2, a13, .Lbr042                      #  75d: d792e0
.Lbr046:    beqz         a14, .Lbr047                          #  760: 8c1e
            bbsi         a5, 9, .Lbr042                        #  762: 97e5db
.Lbr047:    addi         a3, a0, 1                             #  765: 1b30
            s8i          a3, a6, 92 /* a3 -> [.Ldata008] */    #  767: 32465c
            j            .Lbr044                               #  76a: 06f8ff

            .literal_position                                  #  770: 00000000

# Function @ .irom0.text+0x774
            .balign      4
            .global      sdk_scan_clear_channles
            .type        sdk_scan_clear_channles, @function
sdk_scan_clear_channles:
            movi         a4, 0 /* 0x00000000 */                #  774: 0c04
            movi         a7, sdk_g_ic                          #  776: 71feff
            movi         a6, -3 /* 0xfffffffd */               #  779: 7cd6
            movi         a5, 14 /* 0x0000000e */               #  77b: 0ce5
.Lbr048:    addi         a8, a4, 1                             #  77d: 1b84
            addx2        a3, a4, a4                            #  77f: 403490
            addx4        a3, a3, a7                            #  782: 7033a0
            l32i         a2, a3, 132                           #  785: 222321
            extui        a4, a8, 0, 8                          #  788: 804074
            and          a2, a2, a6                            #  78b: 602210
            s32i         a2, a3, 132                           #  78e: 226321
            bne          a4, a5, .Lbr048                       #  791: 5794e8
            ret                                                #  794: 0df0

            .balign      4
# Function @ .irom0.text+0x798
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc009:  addi         sp, sp, -16 /* (local0) */            #  798: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  79b: 0901
            call0        .Lfunc002                             #  79d: 45a8ff
            l32i         a0, sp, 0 /* [(local0)] */            #  7a0: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  7a2: 12c110
            ret                                                #  7a5: 0df0

            .literal_position                                  #  7a8: 00000000
                                                               #  7ac: 00000000
                                                               #  7b0: 00000000

# Function @ .irom0.text+0x7b4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc010:  addi         sp, sp, -16 /* (local0) */            #  7b4: 12c1f0
            movi         a6, sdk_gScanStruct                   #  7b7: 61fcff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  7ba: 0901
            l8ui         a0, a6, 93 /* [.Ldata009] */          #  7bc: 02065d
            addi         a2, a6, 8 /* .Label001 */             #  7bf: 8b26
            bbci         a0, 0, .Lbr051                        #  7c1: 076024
            movi         a3, 10 /* 0x0000000a */               #  7c4: 0ca3
            bnone        a3, a0, .Lbr049                       #  7c6: 07030c
            movi         a3, 0 /* 0x00000000 */                #  7c9: 0c03
            movi         a4, 0 /* 0x00000000 */                #  7cb: 0c04
            call0        sdk_os_timer_arm                      #  7cd: 01f7ffc0
                                                               #  7d1: 0000
            j            .Lbr051                               #  7d3: 860400
.Lbr049:    l32i         a4, a6, 4 /* [.Ldata001] */           #  7d6: 4816
            bbci         a4, 9, .Lbr050                        #  7d8: 97640a
            l32i         a3, a6, 64 /* [.Ldata002] */          #  7db: 322610
            movi         a4, 0 /* 0x00000000 */                #  7de: 0c04
            call0        sdk_os_timer_arm                      #  7e0: 01f4ffc0
                                                               #  7e4: 0000
.Lbr050:    call0        .Lfunc002                             #  7e6: c5a3ff
.Lbr051:    l32i         a0, sp, 0 /* [(local0)] */            #  7e9: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  7eb: 12c110
            ret                                                #  7ee: 0df0

            .literal_position                                  #  7f0: 00000000

# Function @ .irom0.text+0x7f4
            .balign      4
            .global      sdk_scan_set_desChan
            .type        sdk_scan_set_desChan, @function
sdk_scan_set_desChan:
            movi         a4, sdk_gScanStruct                   #  7f4: 41ffff
            addi         a3, a2, -1 /* arg0-0x1 */             #  7f7: 0b32
            s8i          a3, a4, 171 /* arg0-0x1 -> [.Ldata012] */ #  7f9: 3244ab
            ret           /* arg0 */                           #  7fc: 0df0

            .literal_position                                  #  800: 00000000

# Function @ .irom0.text+0x804
            .balign      4
            .global      sdk_scan_get_type
            .type        sdk_scan_get_type, @function
sdk_scan_get_type:
            movi         a2, sdk_gScanStruct                   #  804: 21ffff
            l32i         a2, a2, 4 /* [.Ldata001] */           #  807: 2812
            ret           /* [.Ldata001] */                    #  809: 0df0

            .literal_position                                  #  80c: 00000000
                                                               #  810: ffbfffff

# Function @ .irom0.text+0x814
            .balign      4
            .global      sdk_cannel_scan_connect_state
            .type        sdk_cannel_scan_connect_state, @function
sdk_cannel_scan_connect_state:
            movi         a4, sdk_g_ic                          #  814: 41feff
            l32i         a3, a4, 28 /* [sdk_g_ic+0x1c] */      #  817: 3874
            movi         a2, 0xffffbfff                        #  819: 21fdff
            bbci         a3, 14, .Lbr052                       #  81c: e76304
            and          a2, a3, a2                            #  81f: 202310
            s32i         a2, a4, 28 /* a2 -> [sdk_g_ic+0x1c] */ #  822: 2974
.Lbr052:    ret                                                #  824: 0df0

            .literal_position                                  #  828: 00000000
                                                               #  82c: ffbfffff
                                                               #  830: 0c000000
                                                               #  834: 00400000
                                                               #  838: 00000000
                                                               #  83c: 00000000

# Function @ .irom0.text+0x840
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_scan_connect_state
            .type        sdk_scan_connect_state, @function
sdk_scan_connect_state:
            addi         sp, sp, -16 /* (local0) */            #  840: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  843: 0911
            l32i         a0, a2, 0 /* [arg0] */                #  845: 0802
            movi         a2, 1 /* 0x00000001 */                #  847: 0c12
            s32i         a0, sp, 0 /* [arg0] -> [(local0)] */  #  849: 0901
            call0        sdk_ppCheckTxIdle                     #  84b: 01fbffc0
                                                               #  84f: 0000
            movi         a4, sdk_g_ic                          #  851: 41f5ff
            movi         a5, 0x00004000                        #  854: 51f8ff
            l32i         a0, a4, 28 /* [sdk_g_ic+0x1c] */      #  857: 0874
            bnez         a2, .Lbr053                           #  859: dcd2
            movi         a3, 0xffffbfff                        #  85b: 31f4ff
            movi         a2, .Label004                         #  85e: 21f4ff
            and          a3, a0, a3                            #  861: 303010
            s32i         a3, a4, 28 /* a3 -> [sdk_g_ic+0x1c] */ #  864: 3974
            call0        ets_printf                            #  866: 01f5ffc0
                                                               #  86a: 0000
            l32i         a2, sp, 0 /* [(local0)] */            #  86c: 2801
            movi         a3, 3 /* 0x00000003 */                #  86e: 0c33
            movi         a4, 0 /* 0x00000000 */                #  870: 0c04
            movi         a5, 0 /* 0x00000000 */                #  872: 0c05
            call0        sdk_scan_start                        #  874: 050000
            j            .Lbr054                               #  877: 060100
.Lbr053:    or           a5, a0, a5                            #  87a: 505020
            s32i         a5, a4, 28 /* a5 -> [sdk_g_ic+0x1c] */ #  87d: 5974
.Lbr054:    l32i         a0, sp, 4 /* [(local1)] */            #  87f: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  881: 12c110
            ret                                                #  884: 0df0

            .balign      4
# Function @ .irom0.text+0x888
            .balign      4
            .global      sdk_scan_check_hidden
            .type        sdk_scan_check_hidden, @function
sdk_scan_check_hidden:
            l8ui         a6, a2, 1 /* [arg0+0x1] */            #  888: 620201
            movi         a5, 0 /* 0x00000000 */                #  88b: 0c05
            beqz         a6, .Lbr057                           #  88d: 9c16
.Lbr055:    add          a3, a2, a5                            #  88f: 5a32
            l8ui         a3, a3, 2                             #  891: 320302
            addi         a5, a5, 1                             #  894: 1b55
            beqz         a3, .Lbr056                           #  896: 8c23
            movi         a2, 0 /* 0x00000000 */                #  898: 0c02
            ret           /* 0x00000000 */                     #  89a: 0df0
.Lbr056:    extui        a5, a5, 0, 8                          #  89c: 505074
            bne          a6, a5, .Lbr055                       #  89f: 5796ec
.Lbr057:    movi         a2, 1 /* 0x00000001 */                #  8a2: 0c12
            ret           /* 0x00000001 */                     #  8a4: 0df0

            .literal_position                                  #  8a8: 00000000
                                                               #  8ac: 00000000
                                                               #  8b0: 00000000
                                                               #  8b4: 00000000
                                                               #  8b8: 00000000
                                                               #  8bc: 00000000
                                                               #  8c0: 00000000
                                                               #  8c4: 00000000
                                                               #  8c8: 00000000
                                                               #  8cc: 10000000
                                                               #  8d0: 00000000
                                                               #  8d4: 00000000
                                                               #  8d8: 00000000
                                                               #  8dc: 00000000
                                                               #  8e0: 00000000
                                                               #  8e4: 00000000
                                                               #  8e8: 00000000
                                                               #  8ec: 00000000
                                                               #  8f0: 00000000
                                                               #  8f4: 00000000
                                                               #  8f8: 00000000
                                                               #  8fc: 00000000
                                                               #  900: 00000000
                                                               #  904: 00000000

# Function @ .irom0.text+0x908
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word      @ -0x8
#     (local7):  word      @ -0x4
            .balign      4
            .global      sdk_scan_profile_check
            .type        sdk_scan_profile_check, @function
sdk_scan_profile_check:
            addi         sp, sp, -32 /* (local0) */            #  908: 12c1e0
            s32i         a0, sp, 24 /* a0 -> [(local6)] */     #  90b: 0961
            movi         a0, sdk_g_ic                          #  90d: 01e6ff
            s32i         a12, sp, 28 /* a12 -> [(local7)] */   #  910: c971
            l32i         a4, a0, 16 /* [sdk_g_ic+0x10] */      #  912: 4840
            mov          a12, a3 /* arg1 */                    #  914: cd03
            l32i         a3, a4, 72 /* [[sdk_g_ic+0x10]+0x48] */ #  916: 322412
            movi         a5, -17 /* 0xffffffef */              #  919: 6cf5
            and          a3, a3, a5                            #  91b: 503310
            s32i         a3, a4, 72 /* a3 -> [[sdk_g_ic+0x10]+0x48] */ #  91e: 326412
            l8ui         a0, a0, 24 /* [sdk_g_ic+0x18] */      #  921: 020018
            s32i         a2, sp, 16 /* arg0 -> [(local4)] */   #  924: 2941
            addi         a0, a0, -2 /* [sdk_g_ic+0x18]-0x2 */  #  926: 02c0fe
            beqz         a0, .Lbr063                           #  929: 16d00c
            l32i         a2, a12, 32 /* [arg1+0x20] */         #  92c: 288c
            call0        sdk_scan_check_hidden                 #  92e: 050000
            movi         a0, sdk_g_ic+0x201                    #  931: 01deff
            bnez         a2, .Lbr059                           #  934: fcf2
            s32i         a0, sp, 8 /* sdk_g_ic+0x201 -> [(local2)] */ #  936: 0921
            l32i         a3, a12, 32 /* [arg1+0x20] */         #  938: 388c
            addi         a5, a0, -29 /* sdk_g_ic+0x1e4 */      #  93a: 52c0e3
            l8ui         a4, a5, 3 /* [sdk_g_ic+0x1e7] */      #  93d: 420503
            l8ui         a6, a5, 2 /* [sdk_g_ic+0x1e6] */      #  940: 620502
            slli         a4, a4, 8                             #  943: 804411
            or           a4, a4, a6                            #  946: 604420
            slli         a4, a4, 8                             #  949: 804411
            l8ui         a6, a5, 1 /* [sdk_g_ic+0x1e5] */      #  94c: 620501
            l8ui         a5, a5, 0 /* [sdk_g_ic+0x1e4] */      #  94f: 520500
            or           a4, a4, a6                            #  952: 604420
            l8ui         a6, a3, 1 /* [[arg1+0x20]+0x1] */     #  955: 620301
            slli         a4, a4, 8                             #  958: 804411
            or           a4, a4, a5                            #  95b: 504420
            bne          a4, a6, .Lbr058                       #  95e: 679410
            addi         a3, a3, 2 /* [arg1+0x20]+0x2 */       #  961: 2b33
            mov          a2, a0 /* sdk_g_ic+0x201 */           #  963: 2d00
            addi         a2, a2, -25 /* sdk_g_ic+0x1e8 */      #  965: 22c2e7
            call0        memcmp                                #  968: 01deffc0
                                                               #  96c: 0000
            l32i         a0, sp, 8 /* [(local2)] */            #  96e: 0821
            beqz         a2, .Lbr059                           #  970: 8c32
.Lbr058:    movi         a2, 0 /* 0x00000000 */                #  972: 0c02
            j            .Lbr064                               #  974: 062100
.Lbr059:    l8ui         a3, a0, 128                           #  977: 320080
            bnei         a3, 1, .Lbr060                        #  97a: 661319
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  97d: 0921
            beqz         a3, .Lbr058                           #  97f: 16f3fe
            movi         a2, sdk_g_ic+0x282                    #  982: 21cbff
            l32i         a3, sp, 16 /* [(local4)] */           #  985: 3841
            movi         a4, 6 /* 0x00000006 */                #  987: 0c64
            addi         a3, a3, 16 /* [(local4)]+0x10 */      #  989: 32c310
            call0        memcmp                                #  98c: 01d6ffc0
                                                               #  990: 0000
            l32i         a0, sp, 8 /* [(local2)] */            #  992: 0821
            bnez         a2, .Lbr058                           #  994: 56a2fd
.Lbr060:    l16ui        a4, a12, 2 /* [arg1+0x2] */           #  997: 421c01
            movi         a3, 240 /* 0x000000f0 */              #  99a: 32a0f0
            bbsi         a4, 1, .Lbr058                        #  99d: 17e4d1
            movi         a2, sdk_gScanStruct                   #  9a0: 21c5ff
            movi         a8, 0 /* 0x00000000 */                #  9a3: 0c08
            s8i          a8, a0, 12                            #  9a5: 82400c
            s8i          a8, a0, 11                            #  9a8: 82400b
            s8i          a8, a0, 10                            #  9ab: 82400a
            l8ui         a7, a2, 196 /* [sdk_auth_type] */     #  9ae: 7202c4
            s8i          a8, a0, 9                             #  9b1: 824009
            extui        a7, a7, 0, 4                          #  9b4: 707034
            slli         a8, a7, 4                             #  9b7: c08711
            or           a7, a7, a8                            #  9ba: 807720
            s8i          a7, a2, 196 /* a7 -> [sdk_auth_type] */ #  9bd: 7242c4
            movi         a8, 1 /* 0x00000001 */                #  9c0: 0c18
            s8i          a8, a0, 8                             #  9c2: 824008
            s8i          a8, a0, 7                             #  9c5: 824007
            l32i         a5, a12, 52 /* [arg1+0x34] */         #  9c8: 58dc
            s32i         a8, sp, 20 /* 0x00000001 -> [(local5)] */ #  9ca: 8951
            beqz         a5, .Lbr065                           #  9cc: bc55
            movi         a10, sdk_g_ic                         #  9ce: a1baff
            l32i         a10, a10, 16 /* [sdk_g_ic+0x10] */    #  9d1: a84a
            mov          a2, a12 /* arg1 */                    #  9d3: 2d0c
            l32i         a9, a10, 72 /* [[sdk_g_ic+0x10]+0x48] */ #  9d5: 922a12
            movi         a11, 16 /* 0x00000010 */              #  9d8: 1c0b
            or           a9, a9, a11                           #  9da: b09920
            s32i         a9, a10, 72 /* a9 -> [[sdk_g_ic+0x10]+0x48] */ #  9dd: 926a12
            call0        sdk_ieee80211_parse_rsn               #  9e0: 01c2ffc0
                                                               #  9e4: 0000
            movi         a2, sdk_gScanStruct                   #  9e6: 21b5ff
.Lbr061:    l8ui         a0, a2, 196 /* [sdk_auth_type] */     #  9e9: 0202c4
            movi         a3, 240 /* 0x000000f0 */              #  9ec: 32a0f0
            and          a0, a0, a3                            #  9ef: 300010
            l32i         a3, sp, 20 /* [(local5)] */           #  9f2: 3851
            or           a0, a0, a3                            #  9f4: 300020
.Lbr062:    s8i          a0, a2, 196 /* a0 -> [sdk_auth_type] */ #  9f7: 0242c4
.Lbr063:    movi         a2, 1 /* 0x00000001 */                #  9fa: 0c12
.Lbr064:    l32i         a12, sp, 28 /* [(local7)] */          #  9fc: c871
            l32i         a0, sp, 24 /* [(local6)] */           #  9fe: 0861
            addi         sp, sp, 32 /* (top of frame) */       #  a00: 12c120
            ret                                                #  a03: 0df0
.Lbr065:    l32i         a5, a12, 48 /* [arg1+0x30] */         #  a05: 58cc
            beqz         a5, .Lbr066                           #  a07: ac05
            movi         a7, sdk_g_ic                          #  a09: 71adff
            l32i         a7, a7, 16 /* [sdk_g_ic+0x10] */      #  a0c: 7847
            mov          a2, a12 /* arg1 */                    #  a0e: 2d0c
            l32i         a6, a7, 72 /* [[sdk_g_ic+0x10]+0x48] */ #  a10: 622712
            movi         a8, 16 /* 0x00000010 */               #  a13: 1c08
            or           a6, a6, a8                            #  a15: 806620
            s32i         a6, a7, 72 /* a6 -> [[sdk_g_ic+0x10]+0x48] */ #  a18: 626712
            call0        sdk_ieee80211_parse_wpa               #  a1b: 01b4ffc0
                                                               #  a1f: 0000
            movi         a2, sdk_gScanStruct                   #  a21: 21a8ff
            movi         a8, 2 /* 0x00000002 */                #  a24: 0c28
            s32i         a8, sp, 20 /* 0x00000002 -> [(local5)] */ #  a26: 8951
            j            .Lbr061                               #  a28: 46efff
.Lbr066:    l16ui        a9, a12, 2 /* [arg1+0x2] */           #  a2b: 921c01
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  a2e: 0921
            bbci         a9, 4, .Lbr067                        #  a30: 476934
            movi         a12, sdk_g_ic+0x20f                   #  a33: c1a5ff
            mov          a2, a12 /* sdk_g_ic+0x20f */          #  a36: 2d0c
            call0        strlen                                #  a38: 01aeffc0
                                                               #  a3c: 0000
            s32i         a12, sp, 12 /* sdk_g_ic+0x20f -> [(local3)] */ #  a3e: c931
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  a40: 2901
            mov          a3, sp /* (local0) */                 #  a42: 3d01
            mov          a2, a12 /* sdk_g_ic+0x20f */          #  a44: 2d0c
            call0        sdk_wpa_config_parse_string           #  a46: 01abffc0
                                                               #  a4a: 0000
            mov          a12, a2                               #  a4c: cd02
            bnez         a2, .Lbr068                           #  a4e: dcc2
            movi         a2, .Lstr002                          #  a50: 219fff
            l32i         a3, sp, 12 /* [(local3)] */           #  a53: 3831
            call0        printf                                #  a55: 01a8ffc0
                                                               #  a59: 0000
            movi         a11, sdk_g_ic                         #  a5b: b19dff
            l32i         a11, a11, 16 /* [sdk_g_ic+0x10] */    #  a5e: b84b
            movi         a10, 2 /* 0x00000002 */               #  a60: 0c2a
            s8i          a10, a11, 186 /* 0x02 -> [[sdk_g_ic+0x10]+0xba] */ #  a62: a24bba
            j            .Lbr058                               #  a65: 46c2ff
.Lbr067:    and          a0, a7, a3                            #  a68: 300710
            j            .Lbr062                               #  a6b: 06e2ff
.Lbr068:    l32i         a0, sp, 0 /* [(local0)] */            #  a6e: 0801
            bnei         a0, 5, .Lbr071                        #  a70: 66504b
            movi         a0, 7 /* 0x00000007 */                #  a73: 0c70
.Lbr069:    l32i         a2, sp, 8 /* [(local2)] */            #  a75: 2821
            s8i          a0, a2, 9 /* a0 -> [[(local2)]+0x9] */ #  a77: 024209
.Lbr070:    movi         a3, 16 /* 0x00000010 */               #  a7a: 1c03
            movi         a2, sdk_g_ic+0x271                    #  a7c: 2196ff
            s32i         a2, sp, 4 /* sdk_g_ic+0x271 -> [(local1)] */ #  a7f: 2911
            call0        bzero                                 #  a81: 019effc0
                                                               #  a85: 0000
            l32i         a2, sp, 4 /* [(local1)] */            #  a87: 2811
            mov          a3, a12                               #  a89: 3d0c
            l32i         a4, sp, 0 /* [(local0)] */            #  a8b: 4801
            call0        memcpy                                #  a8d: 019cffc0
                                                               #  a91: 0000
            mov          a2, a12                               #  a93: 2d0c
            call0        free                                  #  a95: 019bffc0
                                                               #  a99: 0000
            movi         a6, sdk_g_ic                          #  a9b: 618fff
            movi         a3, 3 /* 0x00000003 */                #  a9e: 0c33
            l32i         a6, a6, 16 /* [sdk_g_ic+0x10] */      #  aa0: 6846
            movi         a2, sdk_gScanStruct                   #  aa2: 218eff
            l32i         a5, a6, 72 /* [[sdk_g_ic+0x10]+0x48] */ #  aa5: 522612
            movi         a7, 16 /* 0x00000010 */               #  aa8: 1c07
            or           a5, a5, a7                            #  aaa: 705520
            s32i         a5, a6, 72 /* a5 -> [[sdk_g_ic+0x10]+0x48] */ #  aad: 526612
            l8ui         a0, a2, 196 /* [sdk_auth_type] */     #  ab0: 0202c4
            movi         a4, 240 /* 0x000000f0 */              #  ab3: 42a0f0
            and          a0, a0, a4                            #  ab6: 400010
            or           a0, a0, a3                            #  ab9: 300020
            j            .Lbr062                               #  abc: c6cdff
.Lbr071:    movi         a7, 13 /* 0x0000000d */               #  abf: 0cd7
            bne          a0, a7, .Lbr070                       #  ac1: 7790b5
            movi         a0, 8 /* 0x00000008 */                #  ac4: 0c80
            j            .Lbr069                               #  ac6: c6eaff

            .literal_position                                  #  acc: 00000000
                                                               #  ad0: 00000000
                                                               #  ad4: 00000000

# Function @ .irom0.text+0xad8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc011:  addi         sp, sp, -16 /* (local0) */            #  ad8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  adb: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  add: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  adf: c911
            movi         a12, sdk_g_ic                         #  ae1: c1fbff
            movi         a13, sdk_g_ic+0x180                   #  ae4: d1faff
.Lbr072:    l32i         a2, a12, 0x180 /* [sdk_g_ic+0x180] */ #  ae7: 222c60
            beqz         a2, .Lbr074                           #  aea: 9c12
            l32i         a0, a2, 0 /* [[sdk_g_ic+0x180]] */    #  aec: 0802
            s32i         a0, a12, 0x180 /* [[sdk_g_ic+0x180]] -> [sdk_g_ic+0x180] */ #  aee: 026c60
            bnez         a0, .Lbr073                           #  af1: cc10
            s32i         a13, a12, 0x184 /* sdk_g_ic+0x180 -> [sdk_g_ic+0x184] */ #  af3: d26c61
.Lbr073:    call0        vPortFree                             #  af6: 01f7ffc0
                                                               #  afa: 0000
            j            .Lbr072                               #  afc: c6f9ff
.Lbr074:    l32i         a12, sp, 4 /* [(local1)] */           #  aff: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  b01: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  b03: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  b05: 12c110
            ret           /* [sdk_g_ic+0x180] */               #  b08: 0df0

            .literal_position                                  #  b0c: 00000000
                                                               #  b10: 00000000

# Function @ .irom0.text+0xb14
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc012:  addi         sp, sp, -16 /* (local0) */            #  b14: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  b17: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  b19: d921
            movi         a13, sdk_g_ic                         #  b1b: d1fcff
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  b1e: c911
            l32i         a13, a13, 0x180 /* [sdk_g_ic+0x180] */ #  b20: d22d60
            mov          a12, a2 /* arg0 */                    #  b23: cd02
            beqz         a13, .Lbr077                          #  b25: 9c6d
.Lbr075:    mov          a3, a12 /* arg0 */                    #  b27: 3d0c
            addi         a2, a13, 4                            #  b29: 4b2d
            movi         a4, 6 /* 0x00000006 */                #  b2b: 0c64
            call0        memcmp                                #  b2d: 01f8ffc0
                                                               #  b31: 0000
            bnez         a2, .Lbr076                           #  b33: cc32
            movi         a2, 1 /* 0x00000001 */                #  b35: 0c12
            j            .Lbr078                               #  b37: 860100
.Lbr076:    l32i         a13, a13, 0                           #  b3a: d80d
            bnez         a13, .Lbr075                          #  b3c: 567dfe
.Lbr077:    movi         a2, 0 /* 0x00000000 */                #  b3f: 0c02
.Lbr078:    l32i         a12, sp, 4 /* [(local1)] */           #  b41: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  b43: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  b45: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  b47: 12c110
            ret                                                #  b4a: 0df0

            .literal_position                                  #  b4c: 00000000
                                                               #  b50: 00feef3f
                                                               #  b54: 00000000
                                                               #  b58: 00000000
                                                               #  b5c: 00000000
                                                               #  b60: 00000000
                                                               #  b64: 00000000
                                                               #  b68: 00000000
                                                               #  b6c: 00000000
                                                               #  b70: 00000000
                                                               #  b74: 00000000
                                                               #  b78: 00000000

# Function @ .irom0.text+0xb7c
# Local variables/stack:
#     (local0):  word[3]   @ -0x50
#     (local1):  word[5]   @ -0x44
#     (local2):  word[3]   @ -0x30
#     (local3):  word[5]   @ -0x24
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word      @ -0x8
#     (local7):  word      @ -0x4
            .balign      4
.Lfunc013:  addi         sp, sp, -80 /* (local0) */            #  b7c: 12c1b0
            s32i         a0, sp, 64 /* a0 -> [(local4)] */     #  b7f: 026110
            s32i         a14, sp, 76 /* a14 -> [(local7)] */   #  b82: e26113
            s32i         a12, sp, 68 /* a12 -> [(local5)] */   #  b85: c26111
            s32i         a13, sp, 72 /* a13 -> [(local6)] */   #  b88: d26112
            mov          a12, a3 /* arg1 */                    #  b8b: cd03
            mov          a13, a2 /* arg0 */                    #  b8d: dd02
            mov          a14, a4 /* arg2 */                    #  b8f: ed04
            movi         a2, 52 /* 0x00000034 */               #  b91: 3c42
            call0        zalloc                                #  b93: 01f3ffc0
                                                               #  b97: 0000
            addi         a3, a13, 10 /* arg0+0xa */            #  b99: ab3d
            movi         a4, 6 /* 0x00000006 */                #  b9b: 0c64
            mov          a13, a2                               #  b9d: dd02
            addi         a2, a2, 4                             #  b9f: 4b22
            call0        memcpy                                #  ba1: 01f0ffc0
                                                               #  ba5: 0000
            l32i         a2, a12, 32 /* [arg1+0x20] */         #  ba7: 288c
            call0        sdk_scan_check_hidden                 #  ba9: 050000
            movi         a0, 1 /* 0x00000001 */                #  bac: 0c10
            bnei         a2, 1, .Lbr079                        #  bae: 661205
            s8i          a0, a13, 48                           #  bb1: 024d30
            j            .Lbr080                               #  bb4: c60400
.Lbr079:    movi         a5, 0 /* 0x00000000 */                #  bb7: 0c05
            s8i          a5, a13, 48                           #  bb9: 524d30
            l32i         a4, a12, 32 /* [arg1+0x20] */         #  bbc: 488c
            addi         a2, a13, 10                           #  bbe: ab2d
            addi         a3, a4, 2 /* [arg1+0x20]+0x2 */       #  bc0: 2b34
            l8ui         a4, a4, 1 /* [[arg1+0x20]+0x1] */     #  bc2: 420401
            call0        strncpy                               #  bc5: 01e8ffc0
                                                               #  bc9: 0000
.Lbr080:    l8ui         a6, a12, 0 /* [arg1] */               #  bcb: 620c00
            s8i          a6, a13, 42                           #  bce: 624d2a
            s8i          a14, a13, 43                          #  bd1: e24d2b
            l32i         a2, a12, 48 /* [arg1+0x30] */         #  bd4: 28cc
            movi         a14, 0 /* 0x00000000 */               #  bd6: 0c0e
            beqz         a2, .Lbr081                           #  bd8: 9c22
            l8ui         a3, a2, 1 /* [[arg1+0x30]+0x1] */     #  bda: 320201
            mov          a4, sp /* (local0) */                 #  bdd: 4d01
            addi         a3, a3, 2 /* [[arg1+0x30]+0x1]+0x2 */ #  bdf: 2b33
            call0        sdk_wpa_parse_wpa_ie                  #  be1: 01e2ffc0
                                                               #  be5: 0000
            l32i         a14, sp, 0 /* [(local0)] */           #  be7: e801
            l32i         a0, sp, 12 /* [(local1)] */           #  be9: 0831
            j            .Lbr082                               #  beb: 460000
.Lbr081:    movi         a0, 0 /* 0x00000000 */                #  bee: 0c00
.Lbr082:    l32i         a2, a12, 52 /* [arg1+0x34] */         #  bf0: 28dc
            beqz         a2, .Lbr083                           #  bf2: 9c32
            l8ui         a3, a2, 1 /* [[arg1+0x34]+0x1] */     #  bf4: 320201
            addi         a4, sp, 32 /* (local2) */             #  bf7: 42c120
            addi         a3, a3, 2 /* [[arg1+0x34]+0x1]+0x2 */ #  bfa: 2b33
            call0        sdk_wpa_parse_wpa_ie                  #  bfc: 01ddffc0
                                                               #  c00: 0000
            l32i         a4, sp, 32 /* [(local2)] */           #  c02: 4881
            l32i         a0, sp, 44 /* [(local3)] */           #  c04: 08b1
            or           a14, a4, a14                          #  c06: e0e420
.Lbr083:    beqz         a0, .Lbr088                           #  c09: 16a007
            beqi         a0, 2, .Lbr088                        #  c0c: 262077
.Lbr084:    movi         a0, sdk_NMIIrqIsOn                    #  c0f: 01cfff
            movi         a14, -32 /* 0xffffffe0 */             #  c12: 6c0e
            l8ui         a5, a0, 0 /* [sdk_NMIIrqIsOn] */      #  c14: 520000
            movi         a12, 0x3feffe00                       #  c17: c1ceff
            bnez         a5, .Lbr086                           #  c1a: dcf5
            call0        vPortEnterCritical                    #  c1c: 01d6ffc0
                                                               #  c20: 0000
.Lbr085:    memw                                               #  c22: c02000
            l32i         a7, a12, 0x200 /* [0x3ff00000] */     #  c25: 722c80
            and          a7, a7, a14                           #  c28: e07710
            memw                                               #  c2b: c02000
            s32i         a7, a12, 0x200 /* a7 -> [0x3ff00000] */ #  c2e: 726c80
            memw                                               #  c31: c02000
            l32i         a6, a12, 0x200 /* [0x3ff00000] */     #  c34: 622c80
            bbsi         a6, 0, .Lbr085                        #  c37: 07e6e7
            movi         a0, sdk_NMIIrqIsOn                    #  c3a: 01c6ff
.Lbr086:    movi         a3, 0 /* 0x00000000 */                #  c3d: 0c03
            movi         a10, sdk_gScanStruct                  #  c3f: a1c6ff
            movi         a11, sdk_g_ic                         #  c42: b1c6ff
            l16ui        a9, a10, 198 /* [sdk_scannum] */      #  c45: 921a63
            l32i         a2, a11, 0x184 /* [sdk_g_ic+0x184] */ #  c48: 222b61
            addi         a9, a9, 1 /* [sdk_scannum]+0x1 */     #  c4b: 1b99
            s32i         a3, a13, 0                            #  c4d: 390d
            s32i         a13, a2, 0 /* a13 -> [[sdk_g_ic+0x184]] */ #  c4f: d902
            s32i         a13, a11, 0x184 /* a13 -> [sdk_g_ic+0x184] */ #  c51: d26b61
            l8ui         a8, a0, 0 /* [sdk_NMIIrqIsOn] */      #  c54: 820000
            s16i         a9, a10, 198 /* [sdk_scannum]+0x1 -> [sdk_scannum] */ #  c57: 925a63
            bnez         a8, .Lbr087                           #  c5a: dc88
            memw                                               #  c5c: c02000
            l32i         a4, a12, 0x200 /* [0x3ff00000] */     #  c5f: 422c80
            movi         a5, 1 /* 0x00000001 */                #  c62: 0c15
            and          a4, a4, a14                           #  c64: e04410
            or           a4, a4, a5                            #  c67: 504420
            memw                                               #  c6a: c02000
            s32i         a4, a12, 0x200 /* a4 -> [0x3ff00000] */ #  c6d: 426c80
            call0        vPortExitCritical                     #  c70: 01c2ffc0
                                                               #  c74: 0000
.Lbr087:    l32i         a12, sp, 68 /* [(local5)] */          #  c76: c22111
            l32i         a13, sp, 72 /* [(local6)] */          #  c79: d22112
            l32i         a14, sp, 76 /* [(local7)] */          #  c7c: e22113
            l32i         a0, sp, 64 /* [(local4)] */           #  c7f: 022110
            addi         sp, sp, 80 /* (top of frame) */       #  c82: 12c150
            ret                                                #  c85: 0df0
.Lbr088:    beqz         a14, .Lbr091                          #  c87: 9c1e
            beqi         a14, 1, .Lbr092                       #  c89: 261e1a
            beqi         a14, 2, .Lbr093                       #  c8c: 262e1c
            beqi         a14, 3, .Lbr089                       #  c8f: 263e02
            j            .Lbr084                               #  c92: 46deff
.Lbr089:    movi         a0, 4 /* 0x00000004 */                #  c95: 0c40
.Lbr090:    s32i         a0, a13, 44                           #  c97: 09bd
            j            .Lbr084                               #  c99: 86dcff
.Lbr091:    l16ui        a5, a12, 2 /* [arg1+0x2] */           #  c9c: 521c01
            bbci         a5, 4, .Lbr094                        #  c9f: 47650e
            movi         a0, 1 /* 0x00000001 */                #  ca2: 0c10
            j            .Lbr090                               #  ca4: c6fbff
.Lbr092:    movi         a0, 2 /* 0x00000002 */                #  ca7: 0c20
            j            .Lbr090                               #  ca9: 86faff
.Lbr093:    movi         a0, 3 /* 0x00000003 */                #  cac: 0c30
            j            .Lbr090                               #  cae: 46f9ff
.Lbr094:    movi         a0, 0 /* 0x00000000 */                #  cb1: 0c00
            j            .Lbr090                               #  cb3: 06f8ff

            .literal_position                                  #  cb8: 00000000
                                                               #  cbc: ac000000
                                                               #  cc0: ac000000
                                                               #  cc4: 00000000
                                                               #  cc8: 00000000
                                                               #  ccc: 00000000
                                                               #  cd0: 00000000
                                                               #  cd4: 00000000
                                                               #  cd8: 00000000
                                                               #  cdc: ac000000
                                                               #  ce0: 00000000
                                                               #  ce4: 00000000
                                                               #  ce8: 00000000
                                                               #  cec: 00000000
                                                               #  cf0: 00000000
                                                               #  cf4: 00000000
                                                               #  cf8: 00000000
                                                               #  cfc: 00000000
                                                               #  d00: 00000000
                                                               #  d04: 00000000
                                                               #  d08: 00000000
                                                               #  d0c: 00000000
                                                               #  d10: 00000000
                                                               #  d14: 00000000
                                                               #  d18: 00000000
                                                               #  d1c: 00000000
                                                               #  d20: 00000000
                                                               #  d24: 00000000
                                                               #  d28: 00000000
                                                               #  d2c: 00000000
                                                               #  d30: 00000000
                                                               #  d34: 00000000
                                                               #  d38: 00000000

# Function @ .irom0.text+0xd3c
# Local variables/stack:
#     (local0):  word      @ -0x30
#     (local1):  word      @ -0x2c
#     (local2):  word      @ -0x28
#     (local3):  word      @ -0x24
#     (local4):  word      @ -0x20
#     (local5):  word      @ -0x1c
#     (local6):  word      @ -0x18
#     (local7):  word      @ -0x14
#     (local8):  word      @ -0x10
#     (local9):  word      @ -0xc
#     (local10): word      @ -0x8
#     (local11): word      @ -0x4
            .balign      4
            .global      sdk_scan_parse_beacon
            .type        sdk_scan_parse_beacon, @function
sdk_scan_parse_beacon:
            addi         sp, sp, -96 /* (FP)-0x60 */           #  d3c: 12c1a0
            s32i         a2, sp, 60 /* arg0 -> [(local3)] */   #  d3f: 29f1
            s32i         a4, sp, 68 /* arg2 -> [(local5)] */   #  d41: 426111
            s32i         a0, sp, 72 /* a0 -> [(local6)] */     #  d44: 026112
            s32i         a14, sp, 84 /* a14 -> [(local9)] */   #  d47: e26115
            s32i         a13, sp, 80 /* a13 -> [(local8)] */   #  d4a: d26114
            s32i         a12, sp, 76 /* a12 -> [(local7)] */   #  d4d: c26113
            s32i         a15, sp, 88 /* a15 -> [(local10)] */  #  d50: f26116
            mov          a12, a3 /* arg1 */                    #  d53: cd03
            movi         a15, sdk_gScanStruct                  #  d55: f1d8ff
            l32i         a13, a2, 32 /* [arg0+0x20] */         #  d58: d882
            l32i         a14, a2, 16 /* [arg0+0x10] */         #  d5a: e842
            l32i         a13, a13, 8 /* [[arg0+0x20]+0x8] */   #  d5c: d82d
            l8ui         a14, a14, 0 /* [[arg0+0x10]] */       #  d5e: e20e00
            l8ui         a0, a15, 179 /* [.Ldata014] */        #  d61: 020fb3
            slli         a14, a14, 24                          #  d64: 80ee01
            srai         a14, a14, 24                          #  d67: e0e831
            bnez         a0, .Lbr095                           #  d6a: ccc0
            l32i         a0, a3, 32 /* [arg1+0x20] */          #  d6c: 0883
            l8ui         a2, a0, 1 /* [[arg1+0x20]+0x1] */     #  d6e: 220001
            l8ui         a3, a0, 2 /* [[arg1+0x20]+0x2] */     #  d71: 320002
            beqz         a2, .Lbr102                           #  d74: 165212
            beqz         a3, .Lbr102                           #  d77: 162312
.Lbr095:    mov          a2, a13 /* [[arg0+0x20]+0x8] */       #  d7a: 2d0d
            call0        sdk_ieee80211_chan2ieee               #  d7c: 01d9ffc0
                                                               #  d80: 0000
            l8ui         a4, a12, 0 /* [arg1] */               #  d82: 420c00
            s32i         a14, sp, 56 /* a14 -> [(local2)] */   #  d85: e9e1
            beq          a2, a4, .Lbr096                       #  d87: 471204
            movi         a2, -1 /* 0xffffffff */               #  d8a: 7cf2
            j            .Lbr103                               #  d8c: c64300
.Lbr096:    l32i         a14, sp, 60 /* [(local3)] */          #  d8f: e8f1
            l32i         a14, a14, 4 /* [[(local3)]+0x4] */    #  d91: e81e
            l32i         a5, a15, 84 /* [.Ldata006] */         #  d93: 522f15
            l32i         a14, a14, 4 /* [[[(local3)]+0x4]+0x4] */ #  d96: e81e
            beqz         a5, .Lbr098                           #  d98: 166507
            l32i         a0, a15, 88 /* [.Ldata007] */         #  d9b: 022f16
            beqz         a0, .Lbr098                           #  d9e: 160007
            addi         a2, a14, 10 /* [[[(local3)]+0x4]+0x4]+0xa */ #  da1: ab2e
            s32i         a2, sp, 48 /* [[[(local3)]+0x4]+0x4]+0xa -> [(local0)] */ #  da3: 29c1
            call0        .Lfunc012                             #  da5: c5d6ff
            bnez         a2, .Lbr098                           #  da8: 566206
            l8ui         a2, a15, 93 /* [.Ldata009] */         #  dab: 220f5d
            bbci         a2, 0, .Lbr098                        #  dae: 076260
            movi         a0, .Label003                         #  db1: 01c2ff
            l8ui         a6, a15, 169 /* [.Ldata010] */        #  db4: 620fa9
            addi         a2, a0, -36 /* .bss+0x88 */           #  db7: 22c0dc
            addi         a3, a6, -1 /* [.Ldata010]-0x1 */      #  dba: 0b36
            bnez         a3, .Lbr110                           #  dbc: 56e320
            l8ui         a4, a15, 178 /* [.Ldata013] */        #  dbf: 420fb2
            addi         a4, a4, -1 /* [.Ldata013]-0x1 */      #  dc2: 0b44
            bnez         a4, .Lbr111                           #  dc4: 566423
            l32i         a4, a12, 32 /* [arg1+0x20] */         #  dc7: 488c
            addi         a3, a4, 2 /* [arg1+0x20]+0x2 */       #  dc9: 2b34
            l8ui         a4, a4, 1 /* [[arg1+0x20]+0x1] */     #  dcb: 420401
            call0        strncmp                               #  dce: 01c5ffc0
                                                               #  dd2: 0000
            bnez         a2, .Lbr098                           #  dd4: fca2
            movi         a2, .Label003                         #  dd6: 21baff
            l32i         a3, sp, 48 /* [(local0)] */           #  dd9: 38c1
            movi         a4, 6 /* 0x00000006 */                #  ddb: 0c64
            call0        memcmp                                #  ddd: 01c2ffc0
                                                               #  de1: 0000
            bnez         a2, .Lbr098                           #  de3: ecb2
            mov          a2, a14 /* [[[(local3)]+0x4]+0x4] */  #  de5: 2d0e
            mov          a3, a12 /* arg1 */                    #  de7: 3d0c
            l32i         a4, sp, 56 /* [(local2)] */           #  de9: 48e1
            l16ui        a5, a13, 4 /* [[[arg0+0x20]+0x8]+0x4] */ #  deb: 521d02
            addi         a4, a4, -96 /* [(local2)]-0x60 */     #  dee: 42c4a0
            slli         a4, a4, 24                            #  df1: 804401
            srai         a4, a4, 24                            #  df4: 404831
            call0        .Lfunc013                             #  df7: 45d8ff
            j            .Lbr098                               #  dfa: 060500
.Lbr097:    mov          a2, a14 /* [[[(local3)]+0x4]+0x4] */  #  dfd: 2d0e
            mov          a3, a12 /* arg1 */                    #  dff: 3d0c
            l32i         a4, sp, 56 /* [(local2)] */           #  e01: 48e1
            l16ui        a5, a13, 4 /* [[[arg0+0x20]+0x8]+0x4] */ #  e03: 521d02
            addi         a4, a4, -96 /* [(local2)]-0x60 */     #  e06: 42c4a0
            slli         a4, a4, 24                            #  e09: 804401
            srai         a4, a4, 24                            #  e0c: 404831
            call0        .Lfunc013                             #  e0f: c5d6ff
.Lbr098:    movi         a5, sdk_g_ic+0x180                    #  e12: 51acff
            movi         a0, sdk_g_ic                          #  e15: 01acff
            l8ui         a5, a5, 84 /* [sdk_g_ic+0x1d4] */     #  e18: 520554
            l32i         a6, a0, 0x1e4 /* [sdk_g_ic+0x1e4] */  #  e1b: 622079
            beqi         a5, 1, .Lbr102                        #  e1e: 26157b
            beqz         a6, .Lbr100                           #  e21: 169604
            l32i         a8, a12, 32 /* [arg1+0x20] */         #  e24: 888c
            beqz         a8, .Lbr100                           #  e26: 164804
            addi         a2, a14, 16 /* [[[(local3)]+0x4]+0x4]+0x10 */ #  e29: 22ce10
            s32i         a2, sp, 52 /* [[[(local3)]+0x4]+0x4]+0x10 -> [(local1)] */ #  e2c: 29d1
            call0        sdk_cnx_rc_search                     #  e2e: 01afffc0
                                                               #  e32: 0000
            s32i         a2, sp, 92 /* a2 -> [(local11)] */    #  e34: 226117
            bnez         a2, .Lbr105                           #  e37: 563208
            l32i         a0, a12, 32 /* [arg1+0x20] */         #  e3a: 088c
            movi         a9, sdk_g_ic                          #  e3c: 91a4ff
            l8ui         a4, a0, 1 /* [[arg1+0x20]+0x1] */     #  e3f: 420001
            l32i         a9, a9, 0x1e4 /* [sdk_g_ic+0x1e4] */  #  e42: 922979
            bne          a9, a4, .Lbr099                       #  e45: 47990d
            movi         a2, sdk_g_ic+0x1e8                    #  e48: 21a2ff
            addi         a3, a0, 2 /* [arg1+0x20]+0x2 */       #  e4b: 2b30
            call0        memcmp                                #  e4d: 01a8ffc0
                                                               #  e51: 0000
            beqz         a2, .Lbr105                           #  e53: 167206
.Lbr099:    movi         a10, sdk_g_ic+0x201                   #  e56: a19fff
            l8ui         a10, a10, 128 /* [sdk_g_ic+0x281] */  #  e59: a20a80
            beqz         a10, .Lbr100                          #  e5c: 8cea
            movi         a2, sdk_g_ic+0x282                    #  e5e: 219eff
            l32i         a3, sp, 52 /* [(local1)] */           #  e61: 38d1
            movi         a4, 6 /* 0x00000006 */                #  e63: 0c64
            call0        memcmp                                #  e65: 01a3ffc0
                                                               #  e69: 0000
            beqz         a2, .Lbr105                           #  e6b: 16f204
.Lbr100:    movi         a14, 0 /* 0x00000000 */               #  e6e: 0c0e
.Lbr101:    addx8        a2, a14, a14                          #  e70: e02eb0
            addx4        a2, a2, a15                           #  e73: f022a0
            l32i         a4, a2, 96                            #  e76: 422218
            beqz         a4, .Lbr104                           #  e79: bc64
            l32i         a0, a12, 32 /* [arg1+0x20] */         #  e7b: 088c
            beqz         a0, .Lbr104                           #  e7d: bc20
            l8ui         a3, a0, 1 /* [[arg1+0x20]+0x1] */     #  e7f: 320001
            bne          a4, a3, .Lbr104                       #  e82: 37942d
            addi         a2, a2, 100                           #  e85: 22c264
            addi         a3, a0, 2 /* [arg1+0x20]+0x2 */       #  e88: 2b30
            call0        memcmp                                #  e8a: 019bffc0
                                                               #  e8e: 0000
            bnez         a2, .Lbr104                           #  e90: dcf2
            l8ui         a4, a13, 8 /* [[[arg0+0x20]+0x8]+0x8] */ #  e92: 420d08
            movi         a5, 4 /* 0x00000004 */                #  e95: 0c45
            or           a4, a4, a5                            #  e97: 504420
            s8i          a4, a13, 8 /* a4 -> [[[arg0+0x20]+0x8]+0x8] */ #  e9a: 424d08
.Lbr102:    movi         a2, 0 /* 0x00000000 */                #  e9d: 0c02
.Lbr103:    l32i         a12, sp, 76 /* [(local7)] */          #  e9f: c22113
            l32i         a13, sp, 80 /* [(local8)] */          #  ea2: d22114
            l32i         a14, sp, 84 /* [(local9)] */          #  ea5: e22115
            l32i         a15, sp, 88 /* [(local10)] */         #  ea8: f22116
            l32i         a0, sp, 72 /* [(local6)] */           #  eab: 022112
            addi         sp, sp, 96 /* (top of frame) */       #  eae: 12c160
            ret                                                #  eb1: 0df0
.Lbr104:    addi         a14, a14, 1                           #  eb3: 1bee
            extui        a14, a14, 0, 8                        #  eb5: e0e074
            bnei         a14, 2, .Lbr101                       #  eb8: 662eb4
            j            .Lbr102                               #  ebb: 86f7ff
.Lbr105:    mov          a2, a14 /* [[[(local3)]+0x4]+0x4] */  #  ebe: 2d0e
            mov          a3, a12 /* arg1 */                    #  ec0: 3d0c
            l32i         a4, sp, 68 /* [(local5)] */           #  ec2: 422111
            call0        sdk_scan_profile_check                #  ec5: 050000
            beqz         a2, .Lbr109                           #  ec8: 16120f
            l32i         a4, a12, 32 /* [arg1+0x20] */         #  ecb: 488c
            mov          a2, sp /* (FP)-0x60 */                #  ecd: 2d01
            addi         a3, a4, 2 /* [arg1+0x20]+0x2 */       #  ecf: 2b34
            l8ui         a4, a4, 1 /* [[arg1+0x20]+0x1] */     #  ed1: 420401
            call0        strncpy                               #  ed4: 018affc0
                                                               #  ed8: 0000
            l32i         a7, a12, 32 /* [arg1+0x20] */         #  eda: 788c
            l32i         a5, sp, 92 /* [(local11)] */          #  edc: 522117
            l8ui         a7, a7, 1 /* [[arg1+0x20]+0x1] */     #  edf: 720701
            movi         a6, 0 /* 0x00000000 */                #  ee2: 0c06
            add          a7, a7, sp                            #  ee4: 1a77
            s8i          a6, a7, 0                             #  ee6: 624700
            bnez         a5, .Lbr106                           #  ee9: 560507
            l32i         a2, sp, 52 /* [(local1)] */           #  eec: 28d1
            call0        sdk_cnx_bss_alloc                     #  eee: 0184ffc0
                                                               #  ef2: 0000
            s32i         a2, sp, 64 /* a2 -> [(local4)] */     #  ef4: 226110
            movi         a3, 272 /* 0x00000110 */              #  ef7: 32a110
            call0        bzero                                 #  efa: 0182ffc0
                                                               #  efe: 0000
            l32i         a3, sp, 56 /* [(local2)] */           #  f00: 38e1
            movi         a4, 2 /* 0x00000002 */                #  f02: 0c24
            l32i         a2, sp, 64 /* [(local4)] */           #  f04: 222110
            l8ui         a8, a13, 8 /* [[[arg0+0x20]+0x8]+0x8] */ #  f07: 820d08
            movi         a9, 8 /* 0x00000008 */                #  f0a: 0c89
            or           a8, a8, a9                            #  f0c: 908820
            s8i          a8, a13, 8 /* a8 -> [[[arg0+0x20]+0x8]+0x8] */ #  f0f: 824d08
            s32i         a13, a2, 120 /* [[arg0+0x20]+0x8] -> [[(local4)]+0x78] */ #  f12: d2621e
            call0        sdk_cnx_rc_update_rssi                #  f15: 017cffc0
                                                               #  f19: 0000
            l32i         a2, sp, 64 /* [(local4)] */           #  f1b: 222110
            movi         a3, 10 /* 0x0000000a */               #  f1e: 0ca3
            movi         a4, 0 /* 0x00000000 */                #  f20: 0c04
            call0        sdk_cnx_rc_update_state_metric        #  f22: 017affc0
                                                               #  f26: 0000
            l32i         a2, sp, 64 /* [(local4)] */           #  f28: 222110
            movi         a3, 5 /* 0x00000005 */                #  f2b: 0c53
            movi         a4, 0 /* 0x00000000 */                #  f2d: 0c04
            call0        sdk_cnx_rc_update_age                 #  f2f: 0178ffc0
                                                               #  f33: 0000
            mov          a4, a14 /* [[[(local3)]+0x4]+0x4] */  #  f35: 4d0e
            l32i         a2, sp, 64 /* [(local4)] */           #  f37: 222110
            mov          a3, a12 /* arg1 */                    #  f3a: 3d0c
            call0        sdk_cnx_update_bss                    #  f3c: 0176ffc0
                                                               #  f40: 0000
            mov          a3, a12 /* arg1 */                    #  f42: 3d0c
            l32i         a14, sp, 64 /* [(local4)] */          #  f44: e22110
            l32i         a4, sp, 68 /* [(local5)] */           #  f47: 422111
            mov          a2, a14 /* [(local4)] */              #  f4a: 2d0e
            call0        sdk_cnx_update_bss_more               #  f4c: 0173ffc0
                                                               #  f50: 0000
            mov          a2, a14 /* [(local4)] */              #  f52: 2d0e
            call0        sdk_cnx_add_rc                        #  f54: 0172ffc0
                                                               #  f58: 0000
            j            .Lbr108                               #  f5a: 461200
.Lbr106:    mov          a2, a5 /* [(local11)] */              #  f5d: 2d05
            s32i         a13, a5, 120 /* [[arg0+0x20]+0x8] -> [[(local11)]+0x78] */ #  f5f: d2651e
            l32i         a3, sp, 56 /* [(local2)] */           #  f62: 38e1
            movi         a4, 2 /* 0x00000002 */                #  f64: 0c24
            call0        sdk_cnx_rc_update_rssi                #  f66: 016effc0
                                                               #  f6a: 0000
            l32i         a2, sp, 92 /* [(local11)] */          #  f6c: 222117
            movi         a3, 6 /* 0x00000006 */                #  f6f: 0c63
            movi         a4, 1 /* 0x00000001 */                #  f71: 0c14
            call0        sdk_cnx_rc_update_state_metric        #  f73: 016cffc0
                                                               #  f77: 0000
            l32i         a2, sp, 92 /* [(local11)] */          #  f79: 222117
            movi         a3, 5 /* 0x00000005 */                #  f7c: 0c53
            movi         a4, 0 /* 0x00000000 */                #  f7e: 0c04
            call0        sdk_cnx_rc_update_age                 #  f80: 016affc0
                                                               #  f84: 0000
            l32i         a0, a12, 20 /* [arg1+0x14] */         #  f86: 085c
            beqz         a0, .Lbr107                           #  f88: 8cd0
            l32i         a11, sp, 92 /* [(local11)] */         #  f8a: b22117
            l8ui         a14, a0, 2 /* [[arg1+0x14]+0x2] */    #  f8d: e20002
            s8i          a14, a11, 37 /* [[arg1+0x14]+0x2] -> [[(local11)]+0x25] */ #  f90: e24b25
            l8ui         a10, a0, 3 /* [[arg1+0x14]+0x3] */    #  f93: a20003
            s8i          a10, a11, 36 /* [[arg1+0x14]+0x3] -> [[(local11)]+0x24] */ #  f96: a24b24
.Lbr107:    l32i         a2, sp, 92 /* [(local11)] */          #  f99: 222117
            mov          a3, a12 /* arg1 */                    #  f9c: 3d0c
            l32i         a4, sp, 68 /* [(local5)] */           #  f9e: 422111
            call0        sdk_cnx_update_bss_more               #  fa1: 0162ffc0
                                                               #  fa5: 0000
.Lbr108:    l32i         a0, a15, 4 /* [.Ldata001] */          #  fa7: 081f
            extui        a0, a0, 10, 1                         #  fa9: 000a04
            beqz         a0, .Lbr100                           #  fac: 16e0eb
            l8ui         a2, a15, 93 /* [.Ldata009] */         #  faf: 220f5d
            movi         a3, 4 /* 0x00000004 */                #  fb2: 0c43
            or           a2, a2, a3                            #  fb4: 302220
            s8i          a2, a15, 93 /* a2 -> [.Ldata009] */   #  fb7: 224f5d
            j            .Lbr100                               #  fba: 06acff
.Lbr109:    l32i         a4, sp, 92 /* [(local11)] */          #  fbd: 422117
            beqz         a4, .Lbr100                           #  fc0: 16a4ea
            mov          a2, a4 /* [(local11)] */              #  fc3: 2d04
            call0        sdk_cnx_remove_rc                     #  fc5: 015affc0
                                                               #  fc9: 0000
            j            .Lbr100                               #  fcb: c6a7ff
.Lbr110:    l8ui         a5, a15, 178 /* [.Ldata013] */        #  fce: 520fb2
            addi         a5, a5, -1 /* [.Ldata013]-0x1 */      #  fd1: 0b55
            bnez         a5, .Lbr097                           #  fd3: 5665e2
            movi         a2, .Label003                         #  fd6: 2141ff
            l32i         a3, sp, 48 /* [(local0)] */           #  fd9: 38c1
            movi         a4, 6 /* 0x00000006 */                #  fdb: 0c64
            call0        memcmp                                #  fdd: 0155ffc0
                                                               #  fe1: 0000
            bnez         a2, .Lbr098                           #  fe3: 56b2e2
            mov          a2, a14 /* [[[(local3)]+0x4]+0x4] */  #  fe6: 2d0e
            mov          a3, a12 /* arg1 */                    #  fe8: 3d0c
            l32i         a4, sp, 56 /* [(local2)] */           #  fea: 48e1
            l16ui        a5, a13, 4 /* [[[arg0+0x20]+0x8]+0x4] */ #  fec: 521d02
            addi         a4, a4, -96 /* [(local2)]-0x60 */     #  fef: 42c4a0
            slli         a4, a4, 24                            #  ff2: 804401
            srai         a4, a4, 24                            #  ff5: 404831
            call0        .Lfunc013                             #  ff8: 05b8ff
            j            .Lbr098                               #  ffb: c684ff
.Lbr111:    bnei         a6, 1, .Lbr110                        #  ffe: 6616cc
            l32i         a4, a12, 32 /* [arg1+0x20] */         # 1001: 488c
            addi         a3, a4, 2 /* [arg1+0x20]+0x2 */       # 1003: 2b34
            l8ui         a4, a4, 1 /* [[arg1+0x20]+0x1] */     # 1005: 420401
            call0        strncmp                               # 1008: 014cffc0
                                                               # 100c: 0000
            bnez         a2, .Lbr098                           # 100e: 5602e0
            mov          a2, a14 /* [[[(local3)]+0x4]+0x4] */  # 1011: 2d0e
            mov          a3, a12 /* arg1 */                    # 1013: 3d0c
            l32i         a4, sp, 56 /* [(local2)] */           # 1015: 48e1
            l16ui        a5, a13, 4 /* [[[arg0+0x20]+0x8]+0x4] */ # 1017: 521d02
            addi         a4, a4, -96 /* [(local2)]-0x60 */     # 101a: 42c4a0
            slli         a4, a4, 24                            # 101d: 804401
            srai         a4, a4, 24                            # 1020: 404831
            call0        .Lfunc013                             # 1023: 85b5ff
            j            .Lbr098                               # 1026: 067aff

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "scandone\n"                          #    0: 7363616e
                                                               #    4: 646f6e65
                                                               #    8: 0a00
            .balign      4
.Label004:  .word        0x000a6762                            #    c: 62670a00
.Lstr002:   .asciz       "Invalid WEP key %s\n"                #   10: 496e7661
                                                               #   14: 6c696420
                                                               #   18: 57455020
                                                               #   1c: 6b657920
                                                               #   20: 25730a00

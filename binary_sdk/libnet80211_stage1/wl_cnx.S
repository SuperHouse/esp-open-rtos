
            .section     .bss, "aw", @nobits

.Ldata001:  .word        0x00000000                            #    0: 00000000
.Ldata002:  .word        0x00000000                            #    4: 00000000

# NOTE: 1128 non-alignment zero bytes skipped.

            .skip        1128
.Label001:  .word        0x00000000                            #  470: 00000000
.Label002:  .space       268
.Label003:  .space       140
.Label004:  .space       124
.Ldata003:  .byte        0x00
.Ldata004:  .byte        0x00
.Ldata005:  .byte        0x00
            .balign      4
.Ldata006:  .word        0x00000000                            #  68c: 00000000
.Ldata007:  .word        0x00000000                            #  690: 00000000
.Ldata008:  .word        0x00000000                            #  694: 00000000
.Ldata009:  .word        0x00000000                            #  698: 00000000

# NOTE: 176 non-alignment zero bytes skipped.

            .skip        176
.Ldata010:  .byte        0x00

# NOTE: 16 non-alignment zero bytes skipped.

            .skip        19
            .global      sta_con_timer
            .type        sta_con_timer, @object
sta_con_timer:
            .space       28
            .global      g_cnx_probe_rc_list_cb
            .type        g_cnx_probe_rc_list_cb, @object
g_cnx_probe_rc_list_cb:
            .word        0x00000000                            #  77c: 00000000

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000
                                                               #    8: 88060000
                                                               #    c: 18040000
                                                               #   10: 00000000
                                                               #   14: 00000000

# Function @ .irom0.text+0x18
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      cnx_attach
            .type        cnx_attach, @function
cnx_attach: movi         a3, 1888 /* 0x00000760 */             #   18: 32a760
            addi         sp, sp, -16 /* (local0) */            #   1b: 12c1f0
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #   1e: 2901
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   20: 0911
            movi         a2, .Ldata001                         #   22: 21f7ff
            call0        bzero                                 #   25: 01faffc0
                                                               #   29: 0000
            movi         a2, .Ldata003                         #   2b: 21f7ff
            movi         a0, 15 /* 0x0000000f */               #   2e: 0cf0
            l32i         a7, sp, 0 /* [(local0)] */            #   30: 7801
            movi         a4, .Ldata001                         #   32: 41f4ff
            movi         a5, 2 /* 0x00000002 */                #   35: 0c25
            l32i         a3, a4, 0 /* [.Ldata001] */           #   37: 3804
            mov          a6, a4 /* .Ldata001 */                #   39: 6d04
            or           a3, a3, a5                            #   3b: 503320
            s32i         a6, a7, 0 /* .Ldata001 -> [[(local0)]] */ #   3e: 6907
            s8i          a0, a2, 0 /* 0x0f -> [.Ldata003] */   #   40: 024200
            s32i         a3, a4, 0 /* a3 -> [.Ldata001] */     #   43: 3904
            movi         a2, .Lfunc004                         #   45: 21f1ff
            movi         a3, 0 /* 0x00000000 */                #   48: 0c03
            call0        ppRegisterTxCallback                  #   4a: 01f2ffc0
                                                               #   4e: 0000
            l32i         a0, sp, 4 /* [(local1)] */            #   50: 0811
            addi         sp, sp, 16 /* (top of frame) */       #   52: 12c110
            ret                                                #   55: 0df0

            .literal_position                                  #   58: 00000000
                                                               #   5c: 00000000
                                                               #   60: 00000000

# Function @ .irom0.text+0x64
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      cnx_sta_connect_led_timer_cb
            .type        cnx_sta_connect_led_timer_cb, @function
cnx_sta_connect_led_timer_cb:
            movi         a4, 1 /* 0x00000001 */                #   64: 0c14
            movi         a3, 0 /* 0x00000000 */                #   66: 0c03
            movi         a5, g_ic+0x180                        #   68: 51fcff
            addi         sp, sp, -16 /* (local0) */            #   6b: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   6e: 0901
            l8ui         a2, a5, 99 /* [g_ic+0x1e3] */         #   70: 220563
            l8ui         a5, a5, 98 /* [g_ic+0x1e2] */         #   73: 520562
            extui        a6, a2, 0, 1                          #   76: 206004
            moveqz       a3, a4, a6                            #   79: 603483
            ssl          a5                                    #   7c: 001540
            sll          a2, a2                                #   7f: 0022a1
            movi         a5, 0 /* 0x00000000 */                #   82: 0c05
            sll          a4, a4                                #   84: 0044a1
            sll          a3, a3                                #   87: 0033a1
            call0        gpio_output_set                       #   8a: 01f5ffc0
                                                               #   8e: 0000
            movi         a8, 1 /* 0x00000001 */                #   90: 0c18
            movi         a6, 0 /* 0x00000000 */                #   92: 0c06
            movi         a7, g_ic+0x180                        #   94: 71f2ff
            l32i         a0, sp, 0 /* [(local0)] */            #   97: 0801
            l8ui         a9, a7, 99 /* [g_ic+0x1e3] */         #   99: 920763
            addi         sp, sp, 16 /* (top of frame) */       #   9c: 12c110
            extui        a9, a9, 0, 1                          #   9f: 909004
            moveqz       a6, a8, a9                            #   a2: 906883
            s8i          a6, a7, 99 /* a6 -> [g_ic+0x1e3] */   #   a5: 624763
            ret                                                #   a8: 0df0

            .literal_position                                  #   ac: 00000000
                                                               #   b0: 60070000
                                                               #   b4: 60070000
                                                               #   b8: 00000000
                                                               #   bc: 60070000
                                                               #   c0: 00fef13f
                                                               #   c4: 00840000
                                                               #   c8: 04000000
                                                               #   cc: 00c00000
                                                               #   d0: 00000000
                                                               #   d4: 00000000
                                                               #   d8: 00000000
                                                               #   dc: 00000000
                                                               #   e0: 00000000
                                                               #   e4: 00000000
                                                               #   e8: 00000000
                                                               #   ec: 00000000

# Function @ .irom0.text+0xf0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      cnx_sta_connect_cmd
            .type        cnx_sta_connect_cmd, @function
cnx_sta_connect_cmd:
            addi         sp, sp, -16 /* (local0) */            #   f0: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #   f3: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   f5: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   f7: 0901
            movi         a0, g_ic+0x180                        #   f9: 01ecff
            mov          a12, a2 /* arg0 */                    #   fc: cd02
            l8ui         a2, a0, 97 /* [g_ic+0x1e1] */         #   fe: 220061
            mov          a13, a3 /* arg1 */                    #  101: dd03
            bnei         a2, 1, .Lbr001                        #  103: 661229
            l8ui         a3, a0, 96 /* [g_ic+0x1e0] */         #  106: 320060
            bnei         a3, 1, .Lbr001                        #  109: 661323
            movi         a2, sta_con_timer                     #  10c: 21e9ff
            call0        os_timer_disarm                       #  10f: 01f0ffc0
                                                               #  113: 0000
            movi         a2, sta_con_timer                     #  115: 21e7ff
            movi         a3, cnx_sta_connect_led_timer_cb      #  118: 31e8ff
            movi         a4, 0 /* 0x00000000 */                #  11b: 0c04
            call0        os_timer_setfn                        #  11d: 01edffc0
                                                               #  121: 0000
            movi         a2, sta_con_timer                     #  123: 21e6ff
            movi         a3, 50 /* 0x00000032 */               #  126: 3c23
            movi         a4, 1 /* 0x00000001 */                #  128: 0c14
            call0        os_timer_arm                          #  12a: 01ebffc0
                                                               #  12e: 0000
.Lbr001:    movi         a7, 16 /* 0x00000010 */               #  130: 1c07
            movi         a6, 0x3ff1fe00                        #  132: 61e3ff
            memw                                               #  135: c02000
            l32i         a5, a6, 0x26c /* [0x3ff2006c] */      #  138: 52269b
            or           a5, a5, a7                            #  13b: 705520
            memw                                               #  13e: c02000
            s32i         a5, a6, 0x26c /* a5 -> [0x3ff2006c] */ #  141: 52669b
            l8ui         a4, a12, 169 /* [arg0+0xa9] */        #  144: 420ca9
            beqz         a4, .Lbr002                           #  147: 9c04
            movi         a2, 2 /* 0x00000002 */                #  149: 0c22
            movi         a3, 0 /* 0x00000000 */                #  14b: 0c03
            movi         a4, 170 /* 0x000000aa */              #  14d: 42a0aa
            add          a4, a12, a4 /* arg0+0xaa */           #  150: 4a4c
            call0        wDev_SetRxPolicy                      #  152: 01e2ffc0
                                                               #  156: 0000
            j            .Lbr003                               #  158: c60200
.Lbr002:    movi         a2, 0 /* 0x00000000 */                #  15b: 0c02
            movi         a3, 0 /* 0x00000000 */                #  15d: 0c03
            movi         a4, 0 /* 0x00000000 */                #  15f: 0c04
            call0        wDev_SetRxPolicy                      #  161: 01dfffc0
                                                               #  165: 0000
.Lbr003:    call0        scan_remove_bssid                     #  167: 01dfffc0
                                                               #  16b: 0000
            beqz         a13, .Lbr004                          #  16d: 8ccd
            mov          a2, a13 /* arg1 */                    #  16f: 2d0d
            call0        scan_set_desChan                      #  171: 01ddffc0
                                                               #  175: 0000
            movi         a13, 0x00008400                       #  177: d1d3ff
            j            .Lbr005                               #  17a: 860000
.Lbr004:    movi         a13, 1295 /* 0x0000050f */            #  17d: d2a50f
.Lbr005:    movi         a5, .Ldata002                         #  180: 51d2ff
            l32i         a5, a5, 0 /* [.Ldata002] */           #  183: 5805
            movi         a6, 0x0000c000                        #  185: 61d1ff
            bbci         a5, 0, .Lbr006                        #  188: 076505
            or           a13, a13, a6                          #  18b: 60dd20
            j            .Lbr007                               #  18e: c60300
.Lbr006:    addi         a3, a12, 16 /* arg0+0x10 */           #  191: 32cc10
            l8ui         a4, a12, 12 /* [arg0+0xc] */          #  194: 420c0c
            movi         a2, 0 /* 0x00000000 */                #  197: 0c02
            movi         a5, 1 /* 0x00000001 */                #  199: 0c15
            call0        scan_add_probe_ssid                   #  19b: 01d4ffc0
                                                               #  19f: 0000
.Lbr007:    mov          a2, a13                               #  1a1: 2d0d
            call0        .Lfunc001                             #  1a3: 851500
            l32i         a12, sp, 4 /* [(local1)] */           #  1a6: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  1a8: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  1aa: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  1ac: 12c110
            ret                                                #  1af: 0df0

            .literal_position                                  #  1b4: 00000000
                                                               #  1b8: 00000000
                                                               #  1bc: 00800000
                                                               #  1c0: 00000000
                                                               #  1c4: 00000000
                                                               #  1c8: 00000000
                                                               #  1cc: 00000000
                                                               #  1d0: 00000000
                                                               #  1d4: 00000000
                                                               #  1d8: 00000000
                                                               #  1dc: 00000000
                                                               #  1e0: 00000000
                                                               #  1e4: 00000000
                                                               #  1e8: 00000000
                                                               #  1ec: 00000000
                                                               #  1f0: 00000000
                                                               #  1f4: 00000000

# Function @ .irom0.text+0x1f8
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      cnx_sta_scan_cmd
            .type        cnx_sta_scan_cmd, @function
cnx_sta_scan_cmd:
            addi         sp, sp, -32 /* (local0) */            #  1f8: 12c1e0
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  1fb: d931
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    #  1fd: 3901
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  1ff: c921
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  201: e941
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  203: 0911
            movi         a0, gScanStruct                       #  205: 01ebff
            mov          a14, a4 /* arg2 */                    #  208: ed04
            l8ui         a0, a0, 93 /* [gScanStruct+0x5d] */   #  20a: 02005d
            mov          a12, a2 /* arg0 */                    #  20d: cd02
            bbci         a0, 0, .Lbr008                        #  20f: 07600d
            movi         a2, g_ic                              #  212: 21e9ff
            l32i         a2, a2, 16 /* [g_ic+0x10] */          #  215: 2842
            l8ui         a2, a2, 184 /* [[g_ic+0x10]+0xb8] */  #  217: 2202b8
            addi         a2, a2, -5 /* [[g_ic+0x10]+0xb8]-0x5 */ #  21a: 22c2fb
            beqz         a2, .Lbr018                           #  21d: 16920b
.Lbr008:    bnez         a12, .Lbr009                          #  220: fc8c
            movi         a2, 1 /* 0x00000001 */                #  222: 0c12
            movi         a3, 0 /* 0x00000000 */                #  224: 0c03
            movi         a4, 0 /* 0x00000000 */                #  226: 0c04
            movi         a5, 2 /* 0x00000002 */                #  228: 0c25
            call0        scan_add_probe_ssid                   #  22a: 01e5ffc0
                                                               #  22e: 0000
            call0        scan_remove_bssid                     #  230: 01e5ffc0
                                                               #  234: 0000
            movi         a2, 0 /* 0x00000000 */                #  236: 0c02
            call0        scan_hidden_ssid                      #  238: 01e4ffc0
                                                               #  23c: 0000
            movi         a2, 0 /* 0x00000000 */                #  23e: 0c02
            movi         a3, 0 /* 0x00000000 */                #  240: 0c03
            movi         a4, 0 /* 0x00000000 */                #  242: 0c04
            call0        wDev_SetRxPolicy                      #  244: 01e2ffc0
                                                               #  248: 0000
            mov          a5, a14 /* arg2 */                    #  24a: 5d0e
            movi         a2, 271 /* 0x0000010f */              #  24c: 22a10f
            movi         a3, 3 /* 0x00000003 */                #  24f: 0c33
            l32i         a4, sp, 0 /* [(local0)] */            #  251: 4801
            call0        scan_start                            #  253: 01dfffc0
                                                               #  257: 0000
            j            .Lbr018                               #  259: 461f00
.Lbr009:    l32i         a13, a12, 0 /* [arg0] */              #  25c: d80c
            beqz         a13, .Lbr010                          #  25e: 9c8d
            mov          a2, a13 /* [arg0] */                  #  260: 2d0d
            call0        strlen                                #  262: 01dcffc0
                                                               #  266: 0000
            mov          a3, a13 /* [arg0] */                  #  268: 3d0d
            extui        a4, a2, 0, 8                          #  26a: 204074
            movi         a5, 1 /* 0x00000001 */                #  26d: 0c15
            movi         a2, 1 /* 0x00000001 */                #  26f: 0c12
            call0        scan_add_probe_ssid                   #  271: 01d9ffc0
                                                               #  275: 0000
            j            .Lbr011                               #  277: 460300
.Lbr010:    movi         a2, 1 /* 0x00000001 */                #  27a: 0c12
            movi         a3, 0 /* 0x00000000 */                #  27c: 0c03
            movi         a4, 0 /* 0x00000000 */                #  27e: 0c04
            movi         a5, 2 /* 0x00000002 */                #  280: 0c25
            call0        scan_add_probe_ssid                   #  282: 01d6ffc0
                                                               #  286: 0000
.Lbr011:    l32i         a2, a12, 4 /* [arg0+0x4] */           #  288: 281c
            beqz         a2, .Lbr012                           #  28a: 8c72
            call0        scan_add_bssid                        #  28c: 01d5ffc0
                                                               #  290: 0000
            j            .Lbr013                               #  292: 460100
.Lbr012:    call0        scan_remove_bssid                     #  295: 01d3ffc0
                                                               #  299: 0000
.Lbr013:    l8ui         a2, a12, 8 /* [arg0+0x8] */           #  29b: 220c08
            movi         a3, 13 /* 0x0000000d */               #  29e: 0cd3
            beqz         a2, .Lbr014                           #  2a0: 8cd2
            bltu         a3, a2, .Lbr014                       #  2a2: 27330b
            call0        scan_set_desChan                      #  2a5: 01d0ffc0
                                                               #  2a9: 0000
            movi         a13, 0x00008000                       #  2ab: d1c4ff
            j            .Lbr015                               #  2ae: 860000
.Lbr014:    movi         a13, 271 /* 0x0000010f */             #  2b1: d2a10f
.Lbr015:    l8ui         a4, a12, 9 /* [arg0+0x9] */           #  2b4: 420c09
            beqz         a4, .Lbr016                           #  2b7: 8c94
            movi         a2, 1 /* 0x00000001 */                #  2b9: 0c12
            call0        scan_hidden_ssid                      #  2bb: 01ccffc0
                                                               #  2bf: 0000
            j            .Lbr017                               #  2c1: c60100
.Lbr016:    movi         a2, 0 /* 0x00000000 */                #  2c4: 0c02
            call0        scan_hidden_ssid                      #  2c6: 01caffc0
                                                               #  2ca: 0000
.Lbr017:    mov          a5, a14 /* arg2 */                    #  2cc: 5d0e
            mov          a2, a13                               #  2ce: 2d0d
            movi         a3, 3 /* 0x00000003 */                #  2d0: 0c33
            l32i         a4, sp, 0 /* [(local0)] */            #  2d2: 4801
            call0        scan_start                            #  2d4: 01c8ffc0
                                                               #  2d8: 0000
.Lbr018:    l32i         a12, sp, 8 /* [(local2)] */           #  2da: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  2dc: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  2de: e841
            l32i         a0, sp, 4 /* [(local1)] */            #  2e0: 0811
            addi         sp, sp, 32 /* (top of frame) */       #  2e2: 12c120
            ret                                                #  2e5: 0df0

            .literal_position                                  #  2e8: 00000000
                                                               #  2ec: 00000000
                                                               #  2f0: 00000000
                                                               #  2f4: 00000000
                                                               #  2f8: 5c030000

# Function @ .irom0.text+0x2fc
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc001:  addi         sp, sp, -16 /* (local0) */            #  2fc: 12c1f0
            movi         a5, g_ic                              #  2ff: 51faff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  302: 0901
            l32i         a0, a5, 16 /* [g_ic+0x10] */          #  304: 0845
            movi         a4, 1 /* 0x00000001 */                #  306: 0c14
            l8ui         a3, a0, 185 /* [[g_ic+0x10]+0xb9] */  #  308: 3200b9
            movi         a6, 16 /* 0x00000010 */               #  30b: 1c06
            bnez         a3, .Lbr019                           #  30d: cc33
            s8i          a4, a0, 186 /* 0x01 -> [[g_ic+0x10]+0xba] */ #  30f: 4240ba
            l32i         a0, a5, 16 /* [g_ic+0x10] */          #  312: 0845
.Lbr019:    movi         a5, .Ldata001                         #  314: 51f6ff
            s8i          a4, a0, 184 /* 0x01 -> [[g_ic+0x10]+0xb8] */ #  317: 4240b8
            l32i         a4, a5, 0 /* [.Ldata001] */           #  31a: 4805
            or           a4, a4, a6                            #  31c: 604420
            s32i         a4, a5, 0 /* a4 -> [.Ldata001] */     #  31f: 4905
            movi         a4, cnx_start_handoff_cb              #  321: 41f3ff
            beqz         a2, .Lbr020                           #  324: 8cb2
            movi         a3, 2 /* 0x00000002 */                #  326: 0c23
            movi         a5, 0 /* 0x00000000 */                #  328: 0c05
            call0        scan_start                            #  32a: 01f2ffc0
                                                               #  32e: 0000
            j            .Lbr021                               #  330: 460200
.Lbr020:    mov          a2, a4 /* cnx_start_handoff_cb */     #  333: 2d04
            movi         a3, 0 /* 0x00000000 */                #  335: 0c03
            call0        .Lfunc002                             #  337: 01f0ffc0
                                                               #  33b: 0000
.Lbr021:    l32i         a0, sp, 0 /* [(local0)] */            #  33d: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  33f: 12c110
            ret                                                #  342: 0df0

            .literal_position                                  #  344: 70040000
                                                               #  348: 80050000
                                                               #  34c: 00000000
                                                               #  350: 70040000
                                                               #  354: 900b0000
                                                               #  358: bc030000

# Function @ .irom0.text+0x35c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc002:  movi         a3, .Lfunc005                         #  35c: 31faff
            movi         a4, 0 /* 0x00000000 */                #  35f: 0c04
            addi         sp, sp, -16 /* (local0) */            #  361: 12c1f0
            mov          a6, a2 /* arg0 */                     #  364: 6d02
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  366: 0901
            movi         a0, .Label003                         #  368: 01f8ff
            movi         a2, 2 /* 0x00000002 */                #  36b: 0c22
            s32i         a6, a0, 0x1fc /* arg0 -> [g_cnx_probe_rc_list_cb] */ #  36d: 62607f
            call0        chm_acquire_lock                      #  370: 01f7ffc0
                                                               #  374: 0000
            beqz         a2, .Lbr025                           #  376: 9c62
            movi         a2, 1 /* 0x00000001 */                #  378: 0c12
            j            .Lbr024                               #  37a: c60200
.Lbr022:    movi         a2, 0 /* 0x00000000 */                #  37d: 0c02
            movi         a3, 0 /* 0x00000000 */                #  37f: 0c03
            call0        .Lfunc005                             #  381: 01f3ffc0
                                                               #  385: 0000
.Lbr023:    movi         a2, 2 /* 0x00000002 */                #  387: 0c22
.Lbr024:    l32i         a0, sp, 0 /* [(local0)] */            #  389: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  38b: 12c110
            ret                                                #  38e: 0df0
.Lbr025:    call0        .Lfunc011                             #  390: 01f1ffc0
                                                               #  394: 0000
            beqz         a2, .Lbr022                           #  396: 1632fe
            movi         a3, 0 /* 0x00000000 */                #  399: 0c03
            call0        .Lfunc003                             #  39b: 01efffc0
                                                               #  39f: 0000
            j            .Lbr023                               #  3a1: 86f8ff

            .literal_position                                  #  3a4: 00000000
                                                               #  3a8: bc030000
                                                               #  3ac: 00000000
                                                               #  3b0: 00000000
                                                               #  3b4: 00000000
                                                               #  3b8: 00000000

# Function @ .irom0.text+0x3bc
# Local variables/stack:
#     (local0):  word[4]   @ -0x20
#     (local1):  word      @ -0x10
#     (local2):  word      @ -0xc
#     (local3):  word[2]   @ -0x8
            .balign      4
.Lfunc003:  addi         sp, sp, -32 /* (local0) */            #  3bc: 12c1e0
            s32i         a0, sp, 20 /* a0 -> [(local2)] */     #  3bf: 0951
            movi         a0, g_ic                              #  3c1: 01f8ff
            s32i         a12, sp, 24 /* a12 -> [(local3)] */   #  3c4: c961
            l32i         a0, a0, 16 /* [g_ic+0x10] */          #  3c6: 0840
            mov          a12, a2 /* arg0 */                    #  3c8: cd02
            l32i         a0, a0, 0 /* [[g_ic+0x10]] */         #  3ca: 0800
            s32i         a0, sp, 16 /* [[g_ic+0x10]] -> [(local1)] */ #  3cc: 0941
            call0        chm_get_current_channel               #  3ce: 01f8ffc0
                                                               #  3d2: 0000
            l32i         a0, a12, 120 /* [arg0+0x78] */        #  3d4: 022c1e
            beq          a2, a0, .Lbr026                       #  3d7: 071213
            mov          a6, a12 /* arg0 */                    #  3da: 6d0c
            movi         a3, 0 /* 0x00000000 */                #  3dc: 0c03
            movi         a4, .Lfunc003                         #  3de: 41f2ff
            movi         a5, 0 /* 0x00000000 */                #  3e1: 0c05
            mov          a2, a0 /* [arg0+0x78] */              #  3e3: 2d00
            call0        chm_start_op                          #  3e5: 01f3ffc0
                                                               #  3e9: 0000
            j            .Lbr027                               #  3eb: 460700
.Lbr026:    mov          a5, a12 /* arg0 */                    #  3ee: 5d0c
            mov          a2, a12 /* arg0 */                    #  3f0: 2d0c
            mov          a4, a12 /* arg0 */                    #  3f2: 4d0c
            movi         a8, 0 /* 0x00000000 */                #  3f4: 0c08
            l32i         a3, sp, 16 /* [(local1)] */           #  3f6: 3841
            movi         a6, g_ic+0x1e8                        #  3f8: 61edff
            addi         a3, a3, 41 /* [(local1)]+0x29 */      #  3fb: 32c329
            addi         a7, a6, -104 /* g_ic+0x180 */         #  3fe: 72c698
            l8ui         a7, a7, 100 /* [g_ic+0x1e4] */        #  401: 720764
            s32i         a8, sp, 0 /* 0x00000000 -> [(local0)] */ #  404: 8901
            call0        ieee80211_send_probereq               #  406: 01ecffc0
                                                               #  40a: 0000
.Lbr027:    l32i         a12, sp, 24 /* [(local3)] */          #  40c: c861
            l32i         a0, sp, 20 /* [(local2)] */           #  40e: 0851
            addi         sp, sp, 32 /* (top of frame) */       #  410: 12c120
            ret                                                #  413: 0df0

            .balign      4
# Function @ .irom0.text+0x418
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc004:  addi         sp, sp, -16 /* (local0) */            #  418: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  41b: c911
            mov          a12, a2 /* arg0 */                    #  41d: cd02
            l32i         a2, a2, 16 /* [arg0+0x10] */          #  41f: 2842
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  421: 0901
            addi         a2, a2, 16 /* [arg0+0x10]+0x10 */     #  423: 22c210
            call0        cnx_rc_search                         #  426: 050000
            beqz         a2, .Lbr029                           #  429: 9c72
            l32i         a3, a12, 32 /* [arg0+0x20] */         #  42b: 388c
            l8ui         a3, a3, 15 /* [[arg0+0x20]+0xf] */    #  42d: 32030f
            bnei         a3, 1, .Lbr028                        #  430: 661309
            movi         a3, 5 /* 0x00000005 */                #  433: 0c53
            movi         a4, 0 /* 0x00000000 */                #  435: 0c04
            call0        cnx_rc_update_age                     #  437: 050000
            j            .Lbr029                               #  43a: 860100
.Lbr028:    movi         a3, -3 /* 0xfffffffd */               #  43d: 7cd3
            movi         a4, 1 /* 0x00000001 */                #  43f: 0c14
            call0        cnx_rc_update_state_metric            #  441: 050000
.Lbr029:    call0        .Lfunc011                             #  444: 857400
            beqz         a2, .Lbr030                           #  447: 8c62
            movi         a3, 0 /* 0x00000000 */                #  449: 0c03
            call0        .Lfunc003                             #  44b: 05f7ff
            j            .Lbr031                               #  44e: 860100
.Lbr030:    movi         a2, 0 /* 0x00000000 */                #  451: 0c02
            movi         a3, 0 /* 0x00000000 */                #  453: 0c03
            call0        .Lfunc005                             #  455: 850100
.Lbr031:    l32i         a12, sp, 4 /* [(local1)] */           #  458: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  45a: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  45c: 12c110
            ret                                                #  45f: 0df0

            .literal_position                                  #  464: 0c060000
                                                               #  468: 00000000
                                                               #  46c: 00000000

# Function @ .irom0.text+0x470
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc005:  addi         sp, sp, -16 /* (local0) */            #  470: 12c1f0
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    #  473: 3901
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  475: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  477: 0911
            movi         a12, .Label004                        #  479: c1faff
            movi         a0, 0 /* 0x00000000 */                #  47c: 0c00
            s8i          a0, a12, 126 /* 0x00 -> [.Ldata005] */ #  47e: 024c7e
            l32i         a12, a12, 0x170 /* [g_cnx_probe_rc_list_cb] */ #  481: c22c5c
            call0        chm_return_home_channel               #  484: 01f9ffc0
                                                               #  488: 0000
            call0        chm_release_lock                      #  48a: 01f8ffc0
                                                               #  48e: 0000
            beqz         a12, .Lbr032                          #  490: 8c7c
            l32i         a3, sp, 0 /* [(local0)] */            #  492: 3801
            l32i         a0, a12, 0 /* [[g_cnx_probe_rc_list_cb]] */ #  494: 080c
            movi         a2, 0 /* 0x00000000 */                #  496: 0c02
            callx0       a0 /* [[g_cnx_probe_rc_list_cb]] */   #  498: c00000
.Lbr032:    l32i         a12, sp, 8 /* [(local2)] */           #  49b: c821
            l32i         a0, sp, 4 /* [(local1)] */            #  49d: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  49f: 12c110
            ret                                                #  4a2: 0df0

            .literal_position                                  #  4a4: 00000000
                                                               #  4a8: 00000000
                                                               #  4ac: 00000000
                                                               #  4b0: 0000ffff
                                                               #  4b4: 000e0060
                                                               #  4b8: 00000000
                                                               #  4bc: 00000000
                                                               #  4c0: 00000000

# Function @ .irom0.text+0x4c4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      cnx_connect_timeout
            .type        cnx_connect_timeout, @function
cnx_connect_timeout:
            addi         sp, sp, -16 /* (local0) */            #  4c4: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  4c7: 0911
            movi         a0, g_ic                              #  4c9: 01f6ff
            movi         a2, .Lstr001                          #  4cc: 21f7ff
            l32i         a0, a0, 16 /* [g_ic+0x10] */          #  4cf: 0840
            s32i         a0, sp, 0 /* [g_ic+0x10] -> [(local0)] */ #  4d1: 0901
            call0        printf                                #  4d3: 01faffc0
                                                               #  4d7: 0000
            l32i         a2, sp, 0 /* [(local0)] */            #  4d9: 2801
            l32i         a2, a2, 60 /* [[(local0)]+0x3c] */    #  4db: 28f2
            beqz         a2, .Lbr033                           #  4dd: 8cb2
            movi         a2, g_ic                              #  4df: 21f3ff
            movi         a3, 0 /* 0x00000000 */                #  4e2: 0c03
            movi         a4, 1 /* 0x00000001 */                #  4e4: 0c14
            call0        ieee80211_sta_new_state               #  4e6: 01f6ffc0
                                                               #  4ea: 0000
.Lbr033:    movi         a5, 0xffff0000                        #  4ec: 51f1ff
            movi         a3, 0x60000e00                        #  4ef: 31f1ff
            memw                                               #  4f2: c02000
            l32i         a4, a3, 0x3f4 /* [0x600011f4] */      #  4f5: 4223fd
            and          a4, a4, a5                            #  4f8: 504410
            extui        a4, a4, 16, 16                        #  4fb: 4040f5
            memw                                               #  4fe: c02000
            l32i         a3, a3, 0x3f4 /* [0x600011f4] */      #  501: 3223fd
            movi         a2, g_ic+0x1d8                        #  504: 21edff
            extui        a3, a3, 0, 8                          #  507: 303074
            bnei         a4, 1, .Lbr034                        #  50a: 66140c
            movi         a6, 13 /* 0x0000000d */               #  50d: 0cd6
            bgeu         a6, a3, .Lbr036                       #  50f: 37b613
            movi         a3, 0 /* 0x00000000 */                #  512: 0c03
            call0        cnx_sta_connect_cmd                   #  514: 050000
            j            .Lbr035                               #  517: 060100
.Lbr034:    movi         a3, 0 /* 0x00000000 */                #  51a: 0c03
            call0        cnx_sta_connect_cmd                   #  51c: 050000
.Lbr035:    l32i         a0, sp, 4 /* [(local1)] */            #  51f: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  521: 12c110
            ret                                                #  524: 0df0
.Lbr036:    call0        cnx_sta_connect_cmd                   #  526: 050000
            j            .Lbr035                               #  529: 86fcff

# Function @ .irom0.text+0x52c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      cnx_start_handoff_cb
            .type        cnx_start_handoff_cb, @function
cnx_start_handoff_cb:
            addi         sp, sp, -16 /* (local0) */            #  52c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  52f: 0901
            bnez         a3, .Lbr037                           #  531: cc13
            call0        .Lfunc006                             #  533: 850500
.Lbr037:    l32i         a0, sp, 0 /* [(local0)] */            #  536: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  538: 12c110
            ret                                                #  53b: 0df0

            .literal_position                                  #  540: 00000000
                                                               #  544: 00000000
                                                               #  548: 00000000
                                                               #  54c: 00000000
                                                               #  550: 0c000000
                                                               #  554: 00000000
                                                               #  558: 00000100
                                                               #  55c: 000e0060
                                                               #  560: 00000000
                                                               #  564: 00000000
                                                               #  568: 98060000
                                                               #  56c: 00000000
                                                               #  570: 00000000
                                                               #  574: 00000000
                                                               #  578: 00000000
                                                               #  57c: 00000000
                                                               #  580: 00000000
                                                               #  584: 00000000
                                                               #  588: 00000000

# Function @ .irom0.text+0x58c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc006:  movi         a3, 16 /* 0x00000010 */               #  58c: 1c03
            movi         a2, .Ldata001                         #  58e: 21ecff
            addi         sp, sp, -16 /* (local0) */            #  591: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  594: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  596: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  598: 0901
            movi         a12, g_ic                             #  59a: c1eaff
            l32i         a0, a2, 0 /* [.Ldata001] */           #  59d: 0802
            l32i         a12, a12, 16 /* [g_ic+0x10] */        #  59f: c84c
            or           a0, a0, a3                            #  5a1: 300020
            s32i         a0, a2, 0 /* a0 -> [.Ldata001] */     #  5a4: 0902
            call0        .Lfunc009                             #  5a6: 453b00
            addi         a12, a12, 4 /* [g_ic+0x10]+0x4 */     #  5a9: 4bcc
            movi         a13, cnx_connect_timeout              #  5ab: d1e7ff
            bnez         a2, .Lbr039                           #  5ae: 560205
            movi         a0, g_ic                              #  5b1: 01e6ff
            l32i         a0, a0, 16 /* [g_ic+0x10] */          #  5b4: 0840
            l8ui         a0, a0, 186 /* [[g_ic+0x10]+0xba] */  #  5b6: 0200ba
            beqi         a0, 2, .Lbr038                        #  5b9: 262013
            movi         a2, 3 /* 0x00000003 */                #  5bc: 0c32
            call0        sta_status_set                        #  5be: 01ebffc0
                                                               #  5c2: 0000
            movi         a2, .Lstr002                          #  5c4: 21e3ff
            movi         a3, g_ic+0x1e8                        #  5c7: 31e3ff
            call0        printf                                #  5ca: 01e9ffc0
                                                               #  5ce: 0000
.Lbr038:    movi         a2, 0x00010000                        #  5d0: 21e2ff
            movi         a3, 0x60000e00                        #  5d3: 31e2ff
            memw                                               #  5d6: c02000
            s32i         a2, a3, 0x3f4 /* 0x00010000 -> [0x600011f4] */ #  5d9: 2263fd
            mov          a2, a12 /* [g_ic+0x10]+0x4 */         #  5dc: 2d0c
            call0        os_timer_disarm                       #  5de: 01e5ffc0
                                                               #  5e2: 0000
            mov          a3, a13 /* cnx_connect_timeout */     #  5e4: 3d0d
            mov          a2, a12 /* [g_ic+0x10]+0x4 */         #  5e6: 2d0c
            movi         a4, 0 /* 0x00000000 */                #  5e8: 0c04
            call0        os_timer_setfn                        #  5ea: 01e3ffc0
                                                               #  5ee: 0000
            mov          a2, a12 /* [g_ic+0x10]+0x4 */         #  5f0: 2d0c
            movi         a3, 1000 /* 0x000003e8 */             #  5f2: 32a3e8
            movi         a4, 0 /* 0x00000000 */                #  5f5: 0c04
            call0        os_timer_arm                          #  5f7: 01e1ffc0
                                                               #  5fb: 0000
            movi         a2, 0 /* 0x00000000 */                #  5fd: 0c02
            j            .Lbr042                               #  5ff: 860d00
.Lbr039:    call0        .Lfunc007                             #  602: 850900
            mov          a13, a2                               #  605: dd02
            mov          a2, a12 /* [g_ic+0x10]+0x4 */         #  607: 2d0c
            call0        os_timer_disarm                       #  609: 01ddffc0
                                                               #  60d: 0000
            movi         a3, cnx_connect_timeout               #  60f: 31d4ff
            mov          a2, a12 /* [g_ic+0x10]+0x4 */         #  612: 2d0c
            movi         a4, 0 /* 0x00000000 */                #  614: 0c04
            call0        os_timer_setfn                        #  616: 01dbffc0
                                                               #  61a: 0000
            mov          a2, a12 /* [g_ic+0x10]+0x4 */         #  61c: 2d0c
            movi         a3, 1000 /* 0x000003e8 */             #  61e: 32a3e8
            movi         a4, 0 /* 0x00000000 */                #  621: 0c04
            call0        os_timer_arm                          #  623: 01d9ffc0
                                                               #  627: 0000
            bnez         a13, .Lbr043                          #  629: dc7d
            movi         a2, .Ldata001                         #  62b: 21ceff
            l32i         a0, a2, 0 /* [.Ldata001] */           #  62e: 0802
            movi         a3, -17 /* 0xffffffef */              #  630: 6cf3
            and          a0, a0, a3                            #  632: 300010
.Lbr040:    s32i         a0, a2, 0                             #  635: 0902
.Lbr041:    mov          a2, a13                               #  637: 2d0d
.Lbr042:    l32i         a12, sp, 4 /* [(local1)] */           #  639: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  63b: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  63d: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  63f: 12c110
            ret                                                #  642: 0df0
.Lbr043:    bnei         a13, 1, .Lbr041                       #  644: 661def
            movi         a2, .Ldata009                         #  647: 21c8ff
            l32i         a0, a2, 0 /* [.Ldata009] */           #  64a: 0802
            movi         a3, 320 /* 0x00000140 */              #  64c: 32a140
            or           a0, a0, a3                            #  64f: 300020
            j            .Lbr040                               #  652: c6f7ff

            .literal_position                                  #  658: 8c060000
                                                               #  65c: 98060000
                                                               #  660: 00000000
                                                               #  664: 00feef3f
                                                               #  668: 00000000
                                                               #  66c: 00000000
                                                               #  670: 00feef3f
                                                               #  674: 00060060
                                                               #  678: 94060000
                                                               #  67c: e8070000
                                                               #  680: e8070000
                                                               #  684: 00000000
                                                               #  688: 00000000
                                                               #  68c: 00000000
                                                               #  690: 00000000
                                                               #  694: 00000000
                                                               #  698: 00000000

# Function @ .irom0.text+0x69c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc007:  addi         sp, sp, -16 /* (local0) */            #  69c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  69f: 0901
            movi         a0, .Ldata006                         #  6a1: 01edff
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  6a4: c911
            l32i         a0, a0, 0 /* [.Ldata006] */           #  6a6: 0800
            mov          a12, a2 /* arg0 */                    #  6a8: cd02
            beqz         a0, .Lbr044                           #  6aa: 9cf0
            bne          a2, a0, .Lbr044                       #  6ac: 07921d
            call0        chm_get_current_channel               #  6af: 01f5ffc0
                                                               #  6b3: 0000
            l32i         a3, a12, 120 /* [arg0+0x78] */        #  6b5: 322c1e
            bne          a3, a2, .Lbr044                       #  6b8: 279311
            movi         a6, .Ldata009                         #  6bb: 61e8ff
            movi         a2, 0 /* 0x00000000 */                #  6be: 0c02
            l32i         a5, a6, 0 /* [.Ldata009] */           #  6c0: 5806
            movi         a7, 320 /* 0x00000140 */              #  6c2: 72a140
            or           a5, a5, a7                            #  6c5: 705520
            s32i         a5, a6, 0 /* a5 -> [.Ldata009] */     #  6c8: 5906
            j            .Lbr049                               #  6ca: 462400
.Lbr044:    beqz         a12, .Lbr048                          #  6cd: 16cc08
            movi         a0, NMIIrqIsOn                        #  6d0: 01e4ff
            movi         a3, 4 /* 0x00000004 */                #  6d3: 0c43
            s8i          a3, a12, 232 /* 0x04 -> [arg0+0xe8] */ #  6d5: 324ce8
            l8ui         a0, a0, 0 /* [NMIIrqIsOn] */          #  6d8: 020000
            bnez         a0, .Lbr046                           #  6db: ec70
            call0        vPortEnterCritical                    #  6dd: 01eaffc0
                                                               #  6e1: 0000
            movi         a2, 0x3feffe00                        #  6e3: 21e0ff
            movi         a4, -32 /* 0xffffffe0 */              #  6e6: 6c04
.Lbr045:    memw                                               #  6e8: c02000
            l32i         a6, a2, 0x200 /* [0x3ff00000] */      #  6eb: 622280
            and          a6, a6, a4                            #  6ee: 406610
            memw                                               #  6f1: c02000
            s32i         a6, a2, 0x200 /* a6 -> [0x3ff00000] */ #  6f4: 626280
            memw                                               #  6f7: c02000
            l32i         a5, a2, 0x200 /* [0x3ff00000] */      #  6fa: 522280
            bbsi         a5, 0, .Lbr045                        #  6fd: 07e5e7
            movi         a0, NMIIrqIsOn                        #  700: 01daff
            l8ui         a0, a0, 0 /* [NMIIrqIsOn] */          #  703: 020000
.Lbr046:    movi         a5, g_ic+0x100                        #  706: 51d9ff
            l32i         a3, a12, 120 /* [arg0+0x78] */        #  709: 322c1e
            s32i         a3, a5, 76 /* [arg0+0x78] -> [g_ic+0x14c] */ #  70c: 326513
            bnez         a0, .Lbr047                           #  70f: dcd0
            memw                                               #  711: c02000
            movi         a7, 0x3feffe00                        #  714: 71d7ff
            l32i         a6, a7, 0x200 /* [0x3ff00000] */      #  717: 622780
            movi         a8, -32 /* 0xffffffe0 */              #  71a: 6c08
            and          a6, a6, a8                            #  71c: 806610
            movi         a8, 1 /* 0x00000001 */                #  71f: 0c18
            or           a6, a6, a8                            #  721: 806620
            memw                                               #  724: c02000
            s32i         a6, a7, 0x200 /* a6 -> [0x3ff00000] */ #  727: 626780
            call0        vPortExitCritical                     #  72a: 01d8ffc0
                                                               #  72e: 0000
.Lbr047:    movi         a9, 0x60000600                        #  730: 91d1ff
            memw                                               #  733: c02000
            movi         a10, .Ldata008                        #  736: a1d0ff
            l32i         a9, a9, 36 /* [0x60000624] */         #  739: 9899
            s32i         a9, a10, 0 /* [0x60000624] -> [.Ldata008] */ #  73b: 990a
            call0        chm_get_current_channel               #  73d: 01d4ffc0
                                                               #  741: 0000
            l32i         a10, a12, 120 /* [arg0+0x78] */       #  743: a22c1e
            beq          a10, a2, .Lbr050                      #  746: 271a1e
            movi         a3, .Lfunc008                         #  749: 31ccff
            movi         a2, 3 /* 0x00000003 */                #  74c: 0c32
            mov          a4, a12 /* arg0 */                    #  74e: 4d0c
            call0        chm_acquire_lock                      #  750: 01d1ffc0
                                                               #  754: 0000
            beqz         a2, .Lbr052                           #  756: 9ca2
            movi         a2, 1 /* 0x00000001 */                #  758: 0c12
            j            .Lbr049                               #  75a: 460000
.Lbr048:    movi         a2, 1 /* 0x00000001 */                #  75d: 0c12
.Lbr049:    l32i         a12, sp, 4 /* [(local1)] */           #  75f: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  761: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  763: 12c110
            ret                                                #  766: 0df0
.Lbr050:    mov          a2, a12 /* arg0 */                    #  768: 2d0c
            movi         a3, 0 /* 0x00000000 */                #  76a: 0c03
            call0        .Lfunc008                             #  76c: 850700
.Lbr051:    movi         a2, 2 /* 0x00000002 */                #  76f: 0c22
            j            .Lbr049                               #  771: 86faff
.Lbr052:    mov          a6, a12 /* arg0 */                    #  774: 6d0c
            l32i         a2, a12, 120 /* [arg0+0x78] */        #  776: 222c1e
            movi         a5, .Lfunc008                         #  779: 51c1ff
            movi         a3, 0 /* 0x00000000 */                #  77c: 0c03
            mov          a4, a5 /* .Lfunc008 */                #  77e: 4d05
            call0        chm_start_op                          #  780: 01c6ffc0
                                                               #  784: 0000
            j            .Lbr051                               #  786: 46f9ff

            .literal_position                                  #  78c: 00000000
                                                               #  790: 00000000
                                                               #  794: 00000000
                                                               #  798: 00000000
                                                               #  79c: 90060000
                                                               #  7a0: 00000000
                                                               #  7a4: 4c070000
                                                               #  7a8: 00000000
                                                               #  7ac: 00000000
                                                               #  7b0: 00000000
                                                               #  7b4: 00000000
                                                               #  7b8: 00000000
                                                               #  7bc: 00000000
                                                               #  7c0: 00000000
                                                               #  7c4: 00000000
                                                               #  7c8: 00000000
                                                               #  7cc: 00000000
                                                               #  7d0: 00000000
                                                               #  7d4: 00000000
                                                               #  7d8: 00000000
                                                               #  7dc: 00000000
                                                               #  7e0: 00000000
                                                               #  7e4: 00000000

# Function @ .irom0.text+0x7e8
# Local variables/stack:
#     (local0):  word      @ -0x30
#     (local1):  word      @ -0x2c
#     (local2):  word[4]   @ -0x28
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word      @ -0x10
#     (local6):  word[3]   @ -0xc
            .balign      4
.Lfunc008:  movi         a4, 8 /* 0x00000008 */                #  7e8: 0c84
            addi         sp, sp, -48 /* (local0) */            #  7ea: 12c1d0
            s32i         a0, sp, 32 /* a0 -> [(local5)] */     #  7ed: 0981
            s32i         a12, sp, 36 /* a12 -> [(local6)] */   #  7ef: c991
            s32i         a3, sp, 28 /* arg1 -> [(local4)] */   #  7f1: 3971
            mov          a12, a2 /* arg0 */                    #  7f3: cd02
            movi         a3, .Ldata011                         #  7f5: 31e5ff
            addi         a2, sp, 16 /* (FP)-0x20 */            #  7f8: 22c110
            call0        memcpy                                #  7fb: 01ecffc0
                                                               #  7ff: 0000
            call0        chm_release_lock                      #  801: 01ebffc0
                                                               #  805: 0000
            l32i         a0, sp, 28 /* [(local4)] */           #  807: 0871
            bnez         a0, .Lbr057                           #  809: 56a008
            movi         a2, 6 /* 0x00000006 */                #  80c: 0c62
            call0        wDev_remove_KeyEntry                  #  80e: 01e9ffc0
                                                               #  812: 0000
            movi         a2, 7 /* 0x00000007 */                #  814: 0c72
            call0        wDev_remove_KeyEntry                  #  816: 01e8ffc0
                                                               #  81a: 0000
            movi         a2, 8 /* 0x00000008 */                #  81c: 0c82
            call0        wDev_remove_KeyEntry                  #  81e: 01e7ffc0
                                                               #  822: 0000
            movi         a2, 9 /* 0x00000009 */                #  824: 0c92
            call0        wDev_remove_KeyEntry                  #  826: 01e6ffc0
                                                               #  82a: 0000
            movi         a0, g_ic+0x180                        #  82c: 01d9ff
            l8ui         a2, a0, 137 /* [g_ic+0x209] */        #  82f: 220089
            movi         a3, g_ic+0x271                        #  832: 31ddff
            beqi         a2, 1, .Lbr058                        #  835: 261267
            movi         a2, g_ic                              #  838: 21d7ff
            call0        wpa_config_profile                    #  83b: 01e2ffc0
                                                               #  83f: 0000
            movi         a2, g_ic                              #  841: 21d5ff
            mov          a3, a12 /* arg0 */                    #  844: 3d0c
            call0        wpa_config_bss                        #  846: 01e0ffc0
                                                               #  84a: 0000
.Lbr053:    call0        scan_get_type                         #  84c: 01e0ffc0
                                                               #  850: 0000
            movi         a0, .Ldata007                         #  852: 01d2ff
            l32i         a0, a0, 0 /* [.Ldata007] */           #  855: 0800
            beqz         a0, .Lbr054                           #  857: 9cc0
            l8ui         a2, a0, 0 /* [[.Ldata007]] */         #  859: 220000
            bnez         a2, .Lbr055                           #  85c: dcc2
            l8ui         a3, a0, 1 /* [[.Ldata007]+0x1] */     #  85e: 320001
            bnez         a3, .Lbr055                           #  861: dc73
            l8ui         a4, a0, 2 /* [[.Ldata007]+0x2] */     #  863: 420002
            bnez         a4, .Lbr055                           #  866: dc24
            l8ui         a5, a0, 3 /* [[.Ldata007]+0x3] */     #  868: 520003
            bnez         a5, .Lbr055                           #  86b: ccd5
            l8ui         a6, a0, 4 /* [[.Ldata007]+0x4] */     #  86d: 620004
            bnez         a6, .Lbr055                           #  870: cc86
            l8ui         a7, a0, 5 /* [[.Ldata007]+0x5] */     #  872: 720005
            bnez         a7, .Lbr055                           #  875: cc37
.Lbr054:    movi         a4, 0 /* 0x00000000 */                #  877: 0c04
            j            .Lbr056                               #  879: 460000
.Lbr055:    movi         a4, 1 /* 0x00000001 */                #  87c: 0c14
.Lbr056:    movi         a3, g_ic+0x1d8                        #  87e: 31c8ff
            beqz         a4, .Lbr061                           #  881: 16c40a
            movi         a8, .Ldata010                         #  884: 81c8ff
            l8ui         a8, a8, 0 /* [.Ldata010] */           #  887: 820800
            beqz         a8, .Lbr061                           #  88a: 16380a
            mov          a2, a12 /* arg0 */                    #  88d: 2d0c
            movi         a5, 0 /* 0x00000000 */                #  88f: 0c05
            call0        ieee80211_mlme_connect_bss            #  891: 01cfffc0
                                                               #  895: 0000
.Lbr057:    l32i         a12, sp, 36 /* [(local6)] */          #  897: c891
            l32i         a0, sp, 32 /* [(local5)] */           #  899: 0881
            addi         sp, sp, 48 /* (top of frame) */       #  89b: 12c130
            ret                                                #  89e: 0df0
.Lbr058:    l8ui         a2, a0, 138 /* [g_ic+0x20a] */        #  8a0: 22008a
            bnei         a2, 7, .Lbr060                        #  8a3: 667243
            movi         a2, 1 /* 0x00000001 */                #  8a6: 0c12
            movi         a4, 0 /* 0x00000000 */                #  8a8: 0c04
            movi         a5, 1 /* 0x00000001 */                #  8aa: 0c15
            addi         a6, sp, 16 /* (FP)-0x20 */            #  8ac: 62c110
            movi         a7, 8 /* 0x00000008 */                #  8af: 0c87
            s32i         a3, sp, 0 /* g_ic+0x271 -> [(local0)] */ #  8b1: 3901
            s32i         a3, sp, 24 /* g_ic+0x271 -> [(local3)] */ #  8b3: 3961
            movi         a9, 5 /* 0x00000005 */                #  8b5: 0c59
            s32i         a9, sp, 4 /* 0x00000005 -> [(local1)] */ #  8b7: 9911
            s32i         a9, sp, 8 /* 0x00000005 -> [(local2)] */ #  8b9: 9921
            mov          a3, a12 /* arg0 */                    #  8bb: 3d0c
            call0        ppInstallKey                          #  8bd: 01c5ffc0
                                                               #  8c1: 0000
            movi         a2, 1 /* 0x00000001 */                #  8c3: 0c12
            mov          a3, a12 /* arg0 */                    #  8c5: 3d0c
            movi         a4, 1 /* 0x00000001 */                #  8c7: 0c14
            movi         a5, 1 /* 0x00000001 */                #  8c9: 0c15
            addi         a6, sp, 16 /* (FP)-0x20 */            #  8cb: 62c110
            movi         a7, 8 /* 0x00000008 */                #  8ce: 0c87
            l32i         a0, sp, 24 /* [(local3)] */           #  8d0: 0861
            movi         a10, 6 /* 0x00000006 */               #  8d2: 0c6a
            movi         a11, 5 /* 0x00000005 */               #  8d4: 0c5b
            s32i         a11, sp, 4 /* 0x00000005 -> [(local1)] */ #  8d6: b911
            s32i         a10, sp, 8 /* 0x00000006 -> [(local2)] */ #  8d8: a921
            s32i         a0, sp, 0 /* [(local3)] -> [(local0)] */ #  8da: 0901
            call0        ppInstallKey                          #  8dc: 01bfffc0
                                                               #  8e0: 0000
.Lbr059:    movi         a2, 5 /* 0x00000005 */                #  8e2: 0c52
            s8i          a2, a12, 233 /* 0x05 -> [arg0+0xe9] */ #  8e4: 224ce9
            j            .Lbr053                               #  8e7: 46d8ff
.Lbr060:    addi         a4, a2, -8 /* [g_ic+0x20a]-0x8 */     #  8ea: 42c2f8
            bnez         a4, .Lbr053                           #  8ed: 56b4f5
            movi         a2, 5 /* 0x00000005 */                #  8f0: 0c52
            movi         a4, 0 /* 0x00000000 */                #  8f2: 0c04
            movi         a7, 8 /* 0x00000008 */                #  8f4: 0c87
            s32i         a3, sp, 0 /* g_ic+0x271 -> [(local0)] */ #  8f6: 3901
            s32i         a3, sp, 24 /* g_ic+0x271 -> [(local3)] */ #  8f8: 3961
            movi         a5, 5 /* 0x00000005 */                #  8fa: 0c55
            movi         a6, 13 /* 0x0000000d */               #  8fc: 0cd6
            s32i         a6, sp, 4 /* 0x0000000d -> [(local1)] */ #  8fe: 6911
            s32i         a5, sp, 8 /* 0x00000005 -> [(local2)] */ #  900: 5921
            mov          a3, a12 /* arg0 */                    #  902: 3d0c
            movi         a5, 1 /* 0x00000001 */                #  904: 0c15
            addi         a6, sp, 16 /* (FP)-0x20 */            #  906: 62c110
            call0        ppInstallKey                          #  909: 01b4ffc0
                                                               #  90d: 0000
            movi         a2, 5 /* 0x00000005 */                #  90f: 0c52
            mov          a3, a12 /* arg0 */                    #  911: 3d0c
            movi         a4, 1 /* 0x00000001 */                #  913: 0c14
            movi         a5, 1 /* 0x00000001 */                #  915: 0c15
            addi         a6, sp, 16 /* (FP)-0x20 */            #  917: 62c110
            movi         a8, 13 /* 0x0000000d */               #  91a: 0cd8
            movi         a7, 6 /* 0x00000006 */                #  91c: 0c67
            l32i         a9, sp, 24 /* [(local3)] */           #  91e: 9861
            s32i         a9, sp, 0 /* [(local3)] -> [(local0)] */ #  920: 9901
            s32i         a7, sp, 8 /* 0x00000006 -> [(local2)] */ #  922: 7921
            s32i         a8, sp, 4 /* 0x0000000d -> [(local1)] */ #  924: 8911
            movi         a7, 8 /* 0x00000008 */                #  926: 0c87
            call0        ppInstallKey                          #  928: 01aeffc0
                                                               #  92c: 0000
            j            .Lbr059                               #  92e: 06ecff
.Lbr061:    mov          a2, a12 /* arg0 */                    #  931: 2d0c
            movi         a5, 1 /* 0x00000001 */                #  933: 0c15
            call0        ieee80211_mlme_connect_bss            #  935: 01abffc0
                                                               #  939: 0000
            j            .Lbr057                               #  93b: 06d6ff

            .literal_position                                  #  940: 89060000
                                                               #  944: 00000000
                                                               #  948: 00000000
                                                               #  94c: 74040000
                                                               #  950: 74040000
                                                               #  954: 89060000
                                                               #  958: 00000000

# Function @ .irom0.text+0x95c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
.Lfunc009:  addi         sp, sp, -32 /* (local0) */            #  95c: 12c1e0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  95f: c911
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  961: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  963: 0901
            movi         a0, .Ldata004                         #  965: 01f6ff
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  968: d921
            l8ui         a0, a0, 0 /* [.Ldata004] */           #  96a: 020000
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  96d: e931
            beqz         a0, .Lbr065                           #  96f: 169006
            movi         a14, 0 /* 0x00000000 */               #  972: 0c0e
            movi         a13, 0 /* 0x00000000 */               #  974: 0c0d
            movi         a15, g_ic+0x201                       #  976: f1f3ff
            movi         a0, .Label002                         #  979: 01f4ff
            movi         a2, 0 /* 0x00000000 */                #  97c: 0c02
            movi         a3, g_ic+0x282                        #  97e: 31f2ff
            s32i         a3, sp, 24 /* g_ic+0x282 -> [(local6)] */ #  981: 3961
            s32i         a2, sp, 20 /* 0x00000000 -> [(local5)] */ #  983: 2951
.Lbr062:    l8ui         a4, a15, 128 /* [g_ic+0x281] */       #  985: 420f80
            addx4        a2, a13, a0                           #  988: 002da0
            addmi        a2, a2, 256                           #  98b: 22d201
            l8ui         a12, a2, 255                          #  98e: c202ff
            l8ui         a3, a2, 254                           #  991: 3202fe
            slli         a12, a12, 8                           #  994: 80cc11
            or           a12, a12, a3                          #  997: 30cc20
            slli         a12, a12, 8                           #  99a: 80cc11
            l8ui         a3, a2, 253                           #  99d: 3202fd
            l8ui         a2, a2, 252                           #  9a0: 2202fc
            or           a12, a12, a3                          #  9a3: 30cc20
            slli         a12, a12, 8                           #  9a6: 80cc11
            or           a12, a12, a2                          #  9a9: 20cc20
            beqz         a4, .Lbr063                           #  9ac: 8cc4
            l32i         a2, sp, 24 /* [(local6)] */           #  9ae: 2861
            mov          a3, a12                               #  9b0: 3d0c
            movi         a4, 6 /* 0x00000006 */                #  9b2: 0c64
            call0        memcmp                                #  9b4: 01e9ffc0
                                                               #  9b8: 0000
            beqz         a2, .Lbr067                           #  9ba: ac42
.Lbr063:    mov          a2, a12                               #  9bc: 2d0c
            call0        .Lfunc010                             #  9be: 850300
            movi         a0, .Label002                         #  9c1: 01e3ff
            movi         a4, .Ldata004                         #  9c4: 41e4ff
            addi         a13, a13, 1                           #  9c7: 1bdd
            extui        a13, a13, 0, 8                        #  9c9: d0d074
            l8ui         a4, a4, 0 /* [.Ldata004] */           #  9cc: 420400
            bgeu         a14, a2, .Lbr064                      #  9cf: 27be03
            mov          a14, a2                               #  9d2: ed02
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   #  9d4: c951
.Lbr064:    bltu         a13, a4, .Lbr062                      #  9d6: 473dab
            j            .Lbr066                               #  9d9: c60000
.Lbr065:    movi         a5, 0 /* 0x00000000 */                #  9dc: 0c05
            s32i         a5, sp, 20 /* 0x00000000 -> [(local5)] */ #  9de: 5951
.Lbr066:    l32i         a12, sp, 20 /* [(local5)] */          #  9e0: c851
.Lbr067:    l32i         a0, sp, 0 /* [(local0)] */            #  9e2: 0801
            l32i         a13, sp, 8 /* [(local2)] */           #  9e4: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  9e6: e831
            mov          a2, a12                               #  9e8: 2d0c
            l32i         a15, sp, 16 /* [(local4)] */          #  9ea: f841
            l32i         a12, sp, 4 /* [(local1)] */           #  9ec: c811
            addi         sp, sp, 32 /* (top of frame) */       #  9ee: 12c120
            ret                                                #  9f1: 0df0

            .literal_position                                  #  9f4: 88060000

# Function @ .irom0.text+0x9f8
            .balign      4
.Lfunc010:  movi         a5, .Ldata003                         #  9f8: 51ffff
            l8ui         a5, a5, 0 /* [.Ldata003] */           #  9fb: 520500
            bbci         a5, 0, .Lbr068                        #  9fe: 07651a
            l8ui         a4, a2, 115 /* [arg0+0x73] */         #  a01: 420273
            l8ui         a6, a2, 112 /* [arg0+0x70] */         #  a04: 620270
            slli         a4, a4, 24                            #  a07: 804401
            srai         a4, a4, 24                            #  a0a: 404831
            bbci         a5, 1, .Lbr070                        #  a0d: 17651c
            slli         a6, a6, 24                            #  a10: 806601
            srai         a6, a6, 24                            #  a13: 606831
            mul16s       a4, a4, a6                            #  a16: 6044d1
            j            .Lbr070                               #  a19: 060400
.Lbr068:    bbci         a5, 1, .Lbr069                        #  a1c: 17650b
            l8ui         a4, a2, 112 /* [arg0+0x70] */         #  a1f: 420270
            slli         a4, a4, 24                            #  a22: 804401
            srai         a4, a4, 24                            #  a25: 404831
            j            .Lbr070                               #  a28: 460000
.Lbr069:    movi         a4, 0 /* 0x00000000 */                #  a2b: 0c04
.Lbr070:    bbci         a5, 2, .Lbr071                        #  a2d: 276509
            beqz         a4, .Lbr071                           #  a30: 8c64
            l8ui         a7, a2, 113 /* [arg0+0x71] */         #  a32: 720271
            addi         a6, a4, 2                             #  a35: 2b64
            movnez       a4, a6, a7                            #  a37: 704693
.Lbr071:    bbci         a5, 3, .Lbr072                        #  a3a: 376508
            l8ui         a9, a2, 118 /* [arg0+0x76] */         #  a3d: 920276
            slli         a8, a4, 1                             #  a40: f08411
            movnez       a4, a8, a9                            #  a43: 904893
.Lbr072:    mov          a2, a4                                #  a46: 2d04
            ret                                                #  a48: 0df0

            .literal_position                                  #  a4c: 00000000
                                                               #  a50: 8c060000
                                                               #  a54: 00000000

# Function @ .irom0.text+0xa58
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
            .global      cnx_bss_alloc
            .type        cnx_bss_alloc, @function
cnx_bss_alloc:
            addi         sp, sp, -32 /* (local0) */            #  a58: 12c1e0
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  a5b: e931
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  a5d: 0901
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  a5f: f941
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  a61: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  a63: d921
            movi         a12, 0 /* 0x00000000 */               #  a65: 0c0c
            movi         a13, 0 /* 0x00000000 */               #  a67: 0c0d
            movi         a15, .Ldata001                        #  a69: f1f8ff
            movi         a0, -1 /* 0xffffffff */               #  a6c: 7cf0
            s32i         a0, sp, 20 /* 0xffffffff -> [(local5)] */ #  a6e: 0951
.Lbr073:    movi         a0, 272 /* 0x00000110 */              #  a70: 02a110
            mul16u       a0, a12, a0                           #  a73: 000cc1
            add          a0, a15, a0                           #  a76: 0a0f
            l8ui         a2, a0, 16                            #  a78: 220010
            addi         a14, a0, 16                           #  a7b: e2c010
            bnez         a2, .Lbr077                           #  a7e: 562206
            l8ui         a2, a0, 17                            #  a81: 220011
            l8ui         a3, a0, 18                            #  a84: 320012
            bnez         a2, .Lbr077                           #  a87: 569205
            bnez         a3, .Lbr077                           #  a8a: 566305
            l8ui         a4, a0, 19                            #  a8d: 420013
            bnez         a4, .Lbr077                           #  a90: 560405
            l8ui         a5, a0, 20                            #  a93: 520014
            bnez         a5, .Lbr077                           #  a96: 56a504
            l8ui         a6, a0, 21                            #  a99: 620015
            bnez         a6, .Lbr077                           #  a9c: 564604
            addi         a13, a0, 16                           #  a9f: d2c010
.Lbr074:    l8ui         a7, a13, 0                            #  aa2: 720d00
            l8ui         a8, a13, 1                            #  aa5: 820d01
            bnez         a7, .Lbr075                           #  aa8: dc47
            bnez         a8, .Lbr075                           #  aaa: dc28
            l8ui         a9, a13, 2                            #  aac: 920d02
            l8ui         a10, a13, 3                           #  aaf: a20d03
            bnez         a9, .Lbr075                           #  ab2: cca9
            bnez         a10, .Lbr075                          #  ab4: cc8a
            l8ui         a11, a13, 4                           #  ab6: b20d04
            l8ui         a12, a13, 5                           #  ab9: c20d05
            bnez         a11, .Lbr075                          #  abc: cc0b
            beqz         a12, .Lbr076                          #  abe: 8c6c
.Lbr075:    mov          a2, a13                               #  ac0: 2d0d
            call0        cnx_remove_rc                         #  ac2: 01e4ffc0
                                                               #  ac6: 0000
.Lbr076:    l32i         a0, sp, 0 /* [(local0)] */            #  ac8: 0801
            l32i         a12, sp, 4 /* [(local1)] */           #  aca: c811
            mov          a2, a13                               #  acc: 2d0d
            l8ui         a14, a13, 6                           #  ace: e20d06
            movi         a15, 1 /* 0x00000001 */               #  ad1: 0c1f
            or           a14, a14, a15                         #  ad3: f0ee20
            s8i          a14, a13, 6                           #  ad6: e24d06
            l32i         a15, sp, 16 /* [(local4)] */          #  ad9: f841
            l32i         a13, sp, 8 /* [(local2)] */           #  adb: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  add: e831
            addi         sp, sp, 32 /* (top of frame) */       #  adf: 12c120
            ret                                                #  ae2: 0df0
.Lbr077:    movi         a2, .Ldata006                         #  ae4: 21dbff
            l32i         a2, a2, 0 /* [.Ldata006] */           #  ae7: 2802
            beq          a2, a14, .Lbr078                      #  ae9: e7120d
            mov          a2, a14                               #  aec: 2d0e
            call0        .Lfunc010                             #  aee: 85f0ff
            l32i         a3, sp, 20 /* [(local5)] */           #  af1: 3851
            bgeu         a2, a3, .Lbr078                       #  af3: 37b203
            mov          a13, a14                              #  af6: dd0e
            s32i         a2, sp, 20 /* a2 -> [(local5)] */     #  af8: 2951
.Lbr078:    addi         a12, a12, 1                           #  afa: 1bcc
            extui        a12, a12, 0, 8                        #  afc: c0c074
            addi         a5, a12, -6                           #  aff: 52ccfa
            bnez         a5, .Lbr073                           #  b02: 56a5f6
            j            .Lbr074                               #  b05: 46e6ff

            .literal_position                                  #  b08: 89060000
                                                               #  b0c: 74040000
                                                               #  b10: 00000000

# Function @ .irom0.text+0xb14
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      cnx_rc_search
            .type        cnx_rc_search, @function
cnx_rc_search:
            addi         sp, sp, -32 /* (local0) */            #  b14: 12c1e0
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  b17: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  b19: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  b1b: c911
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  b1d: e931
            movi         a14, .Ldata004                        #  b1f: e1faff
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  b22: d921
            l8ui         a14, a14, 0 /* [.Ldata004] */         #  b24: e20e00
            mov          a13, a2 /* arg0 */                    #  b27: dd02
            beqz         a14, .Lbr081                          #  b29: 163e04
            movi         a12, 0 /* 0x00000000 */               #  b2c: 0c0c
.Lbr079:    mov          a3, a13 /* arg0 */                    #  b2e: 3d0d
            movi         a0, .Label002                         #  b30: 01f7ff
            movi         a4, 6 /* 0x00000006 */                #  b33: 0c64
            addx4        a0, a12, a0                           #  b35: 000ca0
            addmi        a0, a0, 256                           #  b38: 02d001
            l8ui         a15, a0, 255                          #  b3b: f200ff
            l8ui         a2, a0, 254                           #  b3e: 2200fe
            slli         a15, a15, 8                           #  b41: 80ff11
            or           a15, a15, a2                          #  b44: 20ff20
            slli         a15, a15, 8                           #  b47: 80ff11
            l8ui         a2, a0, 253                           #  b4a: 2200fd
            l8ui         a0, a0, 252                           #  b4d: 0200fc
            or           a15, a15, a2                          #  b50: 20ff20
            slli         a15, a15, 8                           #  b53: 80ff11
            or           a15, a15, a0                          #  b56: 00ff20
            mov          a2, a15                               #  b59: 2d0f
            call0        memcmp                                #  b5b: 01edffc0
                                                               #  b5f: 0000
            bnez         a2, .Lbr080                           #  b61: cc32
            mov          a2, a15                               #  b63: 2d0f
            j            .Lbr082                               #  b65: 460200
.Lbr080:    addi         a12, a12, 1                           #  b68: 1bcc
            extui        a12, a12, 0, 8                        #  b6a: c0c074
            bne          a14, a12, .Lbr079                     #  b6d: c79ebd
.Lbr081:    movi         a2, 0 /* 0x00000000 */                #  b70: 0c02
.Lbr082:    l32i         a12, sp, 4 /* [(local1)] */           #  b72: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  b74: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  b76: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  b78: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  b7a: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  b7c: 12c120
            ret                                                #  b7f: 0df0

            .literal_position                                  #  b84: 8a060000
                                                               #  b88: 74040000
                                                               #  b8c: 8a060000

# Function @ .irom0.text+0xb90
            .balign      4
.Lfunc011:  movi         a6, .Ldata005                         #  b90: 61fdff
            l8ui         a5, a6, 0 /* [.Ldata005] */           #  b93: 520600
            addi         a6, a6, -1 /* .Ldata004 */            #  b96: 0b66
            l8ui         a6, a6, 0 /* [.Ldata004] */           #  b98: 620600
            movi         a7, .Label002                         #  b9b: 71fbff
            bgeu         a5, a6, .Lbr084                       #  b9e: 67b539
.Lbr083:    movi         a9, .Ldata005                         #  ba1: 91faff
            addx4        a3, a5, a7                            #  ba4: 7035a0
            addmi        a3, a3, 256                           #  ba7: 32d301
            addi         a5, a5, 1                             #  baa: 1b55
            extui        a5, a5, 0, 8                          #  bac: 505074
            l8ui         a2, a3, 255                           #  baf: 2203ff
            l8ui         a4, a3, 254                           #  bb2: 4203fe
            slli         a2, a2, 8                             #  bb5: 802211
            or           a2, a2, a4                            #  bb8: 402220
            slli         a2, a2, 8                             #  bbb: 802211
            l8ui         a4, a3, 253                           #  bbe: 4203fd
            l8ui         a3, a3, 252                           #  bc1: 3203fc
            s8i          a5, a9, 0 /* a5 -> [.Ldata005] */     #  bc4: 524900
            or           a2, a2, a4                            #  bc7: 402220
            slli         a2, a2, 8                             #  bca: 802211
            or           a2, a2, a3                            #  bcd: 302220
            l32i         a8, a2, 120                           #  bd0: 82221e
            l32i         a8, a8, 0                             #  bd3: 8808
            bbci         a8, 9, .Lbr085                        #  bd5: 976804
            bne          a5, a6, .Lbr083                       #  bd8: 6795c5
.Lbr084:    movi         a2, 0 /* 0x00000000 */                #  bdb: 0c02
.Lbr085:    ret                                                #  bdd: 0df0

            .literal_position                                  #  be0: 89060000
                                                               #  be4: 74040000
                                                               #  be8: 70040000
                                                               #  bec: 89060000

# Function @ .irom0.text+0xbf0
            .balign      4
            .global      cnx_add_rc
            .type        cnx_add_rc, @function
cnx_add_rc: movi         a6, .Ldata004                         #  bf0: 61fcff
            l8ui         a6, a6, 0 /* [.Ldata004] */           #  bf3: 620600
            movi         a10, .Label002                        #  bf6: a1fbff
            bltui        a6, 6, .Lbr086                        #  bf9: b66603
            movi         a2, -1 /* 0xffffffff */               #  bfc: 7cf2
            ret           /* 0xffffffff */                     #  bfe: 0df0
.Lbr086:    bltui        a6, 2, .Lbr087                        #  c00: b62602
            j            .Lbr094                               #  c03: 462500
.Lbr087:    srli         a7, a2, 8                             #  c06: 207841
            addx4        a8, a6, a10                           #  c09: a086a0
            addmi        a8, a8, 256                           #  c0c: 82d801
            s8i          a7, a8, 253                           #  c0f: 7248fd
            s8i          a2, a8, 252                           #  c12: 2248fc
            srli         a7, a7, 8                             #  c15: 707841
            s8i          a7, a8, 254                           #  c18: 7248fe
            srli         a7, a7, 8                             #  c1b: 707841
            s8i          a7, a8, 255                           #  c1e: 7248ff
            j            .Lbr093                               #  c21: 061a00
.Lbr088:    movi         a5, 0 /* 0x00000000 */                #  c24: 0c05
.Lbr089:    addx4        a8, a5, a10                           #  c26: a085a0
.Lbr090:    addi         a9, a5, 1                             #  c29: 1b95
            bge          a9, a6, .Lbr092                       #  c2b: 67a946
            movi         a10, .Label001                        #  c2e: a1eeff
.Lbr091:    addx4        a11, a6, a10                          #  c31: a0b6a0
            addmi        a3, a11, 256                          #  c34: 32db01
            addi         a6, a6, -1                            #  c37: 0b66
            extui        a6, a6, 0, 8                          #  c39: 606074
            addmi        a11, a11, 512                         #  c3c: b2db02
            l8ui         a7, a3, 255                           #  c3f: 7203ff
            l8ui         a4, a3, 254                           #  c42: 4203fe
            slli         a7, a7, 8                             #  c45: 807711
            or           a7, a7, a4                            #  c48: 407720
            l8ui         a4, a3, 253                           #  c4b: 4203fd
            slli         a7, a7, 8                             #  c4e: 807711
            or           a7, a7, a4                            #  c51: 407720
            l8ui         a3, a3, 252                           #  c54: 3203fc
            slli         a7, a7, 8                             #  c57: 807711
            or           a7, a7, a3                            #  c5a: 307720
            s8i          a7, a11, 0                            #  c5d: 724b00
            srli         a7, a7, 8                             #  c60: 707841
            s8i          a7, a11, 1                            #  c63: 724b01
            srli         a7, a7, 8                             #  c66: 707841
            s8i          a7, a11, 2                            #  c69: 724b02
            srli         a7, a7, 8                             #  c6c: 707841
            s8i          a7, a11, 3                            #  c6f: 724b03
            blt          a9, a6, .Lbr091                       #  c72: 6729bb
.Lbr092:    srli         a9, a2, 8                             #  c75: 209841
            addmi        a10, a8, 512                          #  c78: a2d802
            s8i          a2, a10, 0                            #  c7b: 224a00
            s8i          a9, a10, 1                            #  c7e: 924a01
            srli         a9, a9, 8                             #  c81: 909841
            s8i          a9, a10, 2                            #  c84: 924a02
            srli         a9, a9, 8                             #  c87: 909841
            s8i          a9, a10, 3                            #  c8a: 924a03
.Lbr093:    movi         a11, .Ldata004                        #  c8d: b1d7ff
            l8ui         a10, a11, 0 /* [.Ldata004] */         #  c90: a20b00
            movi         a2, 0 /* 0x00000000 */                #  c93: 0c02
            addi         a10, a10, 1 /* [.Ldata004]+0x1 */     #  c95: 1baa
            s8i          a10, a11, 0 /* [.Ldata004]+0x1 -> [.Ldata004] */ #  c97: a24b00
            ret           /* 0x00000000 */                     #  c9a: 0df0
.Lbr094:    beqz         a6, .Lbr088                           #  c9c: 1646f8
            movi         a5, 0 /* 0x00000000 */                #  c9f: 0c05
            l32i         a9, a2, 120 /* [arg0+0x78] */         #  ca1: 92221e
.Lbr095:    addx4        a8, a5, a10                           #  ca4: a085a0
            addmi        a3, a8, 256                           #  ca7: 32d801
            l8ui         a11, a3, 255                          #  caa: b203ff
            l8ui         a4, a3, 254                           #  cad: 4203fe
            slli         a11, a11, 8                           #  cb0: 80bb11
            or           a11, a11, a4                          #  cb3: 40bb20
            slli         a11, a11, 8                           #  cb6: 80bb11
            l8ui         a4, a3, 253                           #  cb9: 4203fd
            l8ui         a3, a3, 252                           #  cbc: 3203fc
            or           a11, a11, a4                          #  cbf: 40bb20
            slli         a11, a11, 8                           #  cc2: 80bb11
            or           a11, a11, a3                          #  cc5: 30bb20
            l32i         a11, a11, 120                         #  cc8: b22b1e
            sub          a11, a11, a9                          #  ccb: 90bbc0
            beqz         a11, .Lbr090                          #  cce: 167bf5
            addi         a5, a5, 1                             #  cd1: 1b55
            extui        a5, a5, 0, 8                          #  cd3: 505074
            bne          a5, a6, .Lbr095                       #  cd6: 6795ca
            j            .Lbr089                               #  cd9: 46d2ff

            .literal_position                                  #  cdc: 89060000
                                                               #  ce0: 74040000
                                                               #  ce4: 89060000
                                                               #  ce8: 89060000
                                                               #  cec: 00000000

# Function @ .irom0.text+0xcf0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      cnx_remove_rc
            .type        cnx_remove_rc, @function
cnx_remove_rc:
            movi         a5, .Ldata004                         #  cf0: 51fbff
            addi         sp, sp, -16 /* (local0) */            #  cf3: 12c1f0
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  cf6: e931
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  cf8: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  cfa: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  cfc: d921
            l8ui         a5, a5, 0 /* [.Ldata004] */           #  cfe: 520500
            movi         a13, .Label002                        #  d01: d1f7ff
            beqz         a5, .Lbr098                           #  d04: 160506
            movi         a12, 0 /* 0x00000000 */               #  d07: 0c0c
.Lbr096:    addx4        a14, a12, a13                         #  d09: d0eca0
            addmi        a7, a14, 256                          #  d0c: 72de01
            l8ui         a6, a7, 255                           #  d0f: 6207ff
            l8ui         a8, a7, 254                           #  d12: 8207fe
            slli         a6, a6, 8                             #  d15: 806611
            or           a6, a6, a8                            #  d18: 806620
            slli         a6, a6, 8                             #  d1b: 806611
            l8ui         a8, a7, 253                           #  d1e: 8207fd
            l8ui         a7, a7, 252                           #  d21: 7207fc
            or           a6, a6, a8                            #  d24: 806620
            slli         a6, a6, 8                             #  d27: 806611
            or           a6, a6, a7                            #  d2a: 706620
            bne          a6, a2, .Lbr097                       #  d2d: 27962c
            movi         a3, 272 /* 0x00000110 */              #  d30: 32a110
            call0        bzero                                 #  d33: 01eeffc0
                                                               #  d37: 0000
            movi         a7, .Ldata004                         #  d39: 71eaff
            movi         a6, 0 /* 0x00000000 */                #  d3c: 0c06
            addmi        a8, a14, 256                          #  d3e: 82de01
            movi         a9, 0 /* 0x00000000 */                #  d41: 0c09
            s8i          a9, a8, 254                           #  d43: 9248fe
            s8i          a9, a8, 253                           #  d46: 9248fd
            s8i          a9, a8, 252                           #  d49: 9248fc
            s8i          a6, a8, 255                           #  d4c: 6248ff
            l8ui         a5, a7, 0 /* [.Ldata004] */           #  d4f: 520700
            addi         a5, a5, -1 /* [.Ldata004]-0x1 */      #  d52: 0b55
            extui        a5, a5, 0, 8                          #  d54: 505074
            s8i          a5, a7, 0 /* a5 -> [.Ldata004] */     #  d57: 524700
            j            .Lbr099                               #  d5a: 060300
.Lbr097:    addi         a12, a12, 1                           #  d5d: 1bcc
            extui        a12, a12, 0, 8                        #  d5f: c0c074
            bne          a5, a12, .Lbr096                      #  d62: c795a3
            j            .Lbr099                               #  d65: 460000
.Lbr098:    movi         a12, 0 /* 0x00000000 */               #  d68: 0c0c
.Lbr099:    bgeu         a12, a5, .Lbr101                      #  d6a: 57bc49
            movi         a5, .Ldata004                         #  d6d: 51deff
.Lbr100:    addx4        a0, a12, a13                          #  d70: d00ca0
            addmi        a2, a0, 512                           #  d73: 22d002
            addi         a12, a12, 1                           #  d76: 1bcc
            addmi        a0, a0, 256                           #  d78: 02d001
            l8ui         a14, a2, 3                            #  d7b: e20203
            l8ui         a3, a2, 2                             #  d7e: 320202
            slli         a14, a14, 8                           #  d81: 80ee11
            or           a14, a14, a3                          #  d84: 30ee20
            l8ui         a3, a2, 1                             #  d87: 320201
            slli         a14, a14, 8                           #  d8a: 80ee11
            l8ui         a2, a2, 0                             #  d8d: 220200
            or           a14, a14, a3                          #  d90: 30ee20
            slli         a14, a14, 8                           #  d93: 80ee11
            or           a14, a14, a2                          #  d96: 20ee20
            s8i          a14, a0, 252                          #  d99: e240fc
            srli         a14, a14, 8                           #  d9c: e0e841
            s8i          a14, a0, 253                          #  d9f: e240fd
            srli         a14, a14, 8                           #  da2: e0e841
            s8i          a14, a0, 254                          #  da5: e240fe
            srli         a14, a14, 8                           #  da8: e0e841
            s8i          a14, a0, 255                          #  dab: e240ff
            l8ui         a14, a5, 0 /* [.Ldata004] */          #  dae: e20500
            extui        a12, a12, 0, 8                        #  db1: c0c074
            bltu         a12, a14, .Lbr100                     #  db4: e73cb8
.Lbr101:    l32i         a12, sp, 4 /* [(local1)] */           #  db7: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  db9: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  dbb: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  dbd: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  dbf: 12c110
            ret                                                #  dc2: 0df0

# Function @ .irom0.text+0xdc4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      cnx_rc_update_rssi
            .type        cnx_rc_update_rssi, @function
cnx_rc_update_rssi:
            addi         sp, sp, -16 /* (local0) */            #  dc4: 12c1f0
            s8i          a3, a2, 114 /* arg1 -> [arg0+0x72] */ #  dc7: 324272
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  dca: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  dcc: 0901
            mov          a12, a2 /* arg0 */                    #  dce: cd02
            l8ui         a0, a2, 112 /* [arg0+0x70] */         #  dd0: 020270
            bnez         a4, .Lbr102                           #  dd3: cc34
            mov          a2, a3 /* arg1 */                     #  dd5: 2d03
            j            .Lbr103                               #  dd7: c60600
.Lbr102:    slli         a5, a0, 24                            #  dda: 805001
            addx2        a6, a3, a3                            #  ddd: 306390
            addi         a4, a6, 15                            #  de0: fb46
            srai         a5, a5, 24                            #  de2: 505831
            addx2        a2, a5, a5                            #  de5: 502590
            movgez       a4, a6, a6                            #  de8: 6046b3
            srai         a4, a4, 4                             #  deb: 404421
            addx4        a2, a2, a5                            #  dee: 5022a0
            add          a2, a2, a4                            #  df1: 4a22
            moveqz       a2, a3, a0                            #  df3: 002383
.Lbr103:    beqz         a0, .Lbr104                           #  df6: ac70
            sub          a7, a2, a0                            #  df8: 0072c0
            l8ui         a9, a12, 113 /* [arg0+0x71] */        #  dfb: 920c71
            slli         a11, a0, 24                           #  dfe: 80b001
            srai         a11, a11, 24                          #  e01: b0b831
            addx4        a8, a9, a9                            #  e04: 9089a0
            sub          a11, a2, a11                          #  e07: b0b2c0
            addx2        a11, a11, a11                         #  e0a: b0bb90
            slli         a11, a11, 1                           #  e0d: f0bb11
            addi         a10, a11, 15                          #  e10: fbab
            movgez       a10, a11, a11                         #  e12: b0abb3
            srai         a10, a10, 4                           #  e15: a0a421
            addx2        a8, a8, a10                           #  e18: a08890
            movnez       a7, a8, a9                            #  e1b: 907893
            s8i          a7, a12, 113 /* a7 -> [arg0+0x71] */  #  e1e: 724c71
.Lbr104:    s8i          a2, a12, 112 /* a2 -> [arg0+0x70] */  #  e21: 224c70
            extui        a0, a2, 0, 8                          #  e24: 200074
            bnez         a0, .Lbr105                           #  e27: cc50
            mov          a2, a12 /* arg0 */                    #  e29: 2d0c
            movi         a3, 4 /* 0x00000004 */                #  e2b: 0c43
            call0        .Lfunc014                             #  e2d: 054d00
.Lbr105:    l8ui         a2, a12, 113 /* [arg0+0x71] */        #  e30: 220c71
            bbci         a2, 7, .Lbr106                        #  e33: 776206
            mov          a2, a12 /* arg0 */                    #  e36: 2d0c
            movi         a3, 8 /* 0x00000008 */                #  e38: 0c83
            call0        .Lfunc014                             #  e3a: 454c00
.Lbr106:    l32i         a12, sp, 4 /* [(local1)] */           #  e3d: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  e3f: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  e41: 12c110
            ret                                                #  e44: 0df0

            .literal_position                                  #  e48: 8c060000
                                                               #  e4c: 8c060000

# Function @ .irom0.text+0xe50
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      cnx_rc_update_state_metric
            .type        cnx_rc_update_state_metric, @function
cnx_rc_update_state_metric:
            addi         sp, sp, -16 /* (local0) */            #  e50: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  e53: 0901
            bnei         a4, 1, .Lbr108                        #  e55: 661410
            l8ui         a4, a2, 115 /* [arg0+0x73] */         #  e58: 420273
            add          a4, a3, a4                            #  e5b: 4a43
            slli         a0, a4, 24                            #  e5d: 800401
.Lbr107:    s8i          a4, a2, 115 /* a4 -> [arg0+0x73] */   #  e60: 424273
            srai         a0, a0, 24                            #  e63: 000831
            j            .Lbr110                               #  e66: 860400
.Lbr108:    bnez         a4, .Lbr109                           #  e69: cc64
            slli         a0, a3, 24                            #  e6b: 800301
            mov          a4, a3 /* arg1 */                     #  e6e: 4d03
            j            .Lbr107                               #  e70: 06fbff
.Lbr109:    l8ui         a0, a2, 115 /* [arg0+0x73] */         #  e73: 020273
            slli         a0, a0, 24                            #  e76: 800001
            srai         a0, a0, 24                            #  e79: 000831
.Lbr110:    movi         a5, .Ldata006                         #  e7c: 51f3ff
            movi         a4, 15 /* 0x0000000f */               #  e7f: 0cf4
            bgez         a0, .Lbr111                           #  e81: d66000
            movi         a0, 0 /* 0x00000000 */                #  e84: 0c00
            movi         a3, 0 /* 0x00000000 */                #  e86: 0c03
            s8i          a3, a2, 115 /* 0x00 -> [arg0+0x73] */ #  e88: 324273
.Lbr111:    l32i         a5, a5, 0 /* [.Ldata006] */           #  e8b: 5805
            movi         a3, 10 /* 0x0000000a */               #  e8d: 0ca3
            sub          a5, a5, a2                            #  e8f: 2055c0
            moveqz       a3, a4, a5                            #  e92: 503483
            bge          a3, a0, .Lbr112                       #  e95: 07a304
            mov          a0, a3                                #  e98: 0d03
            s8i          a3, a2, 115 /* a3 -> [arg0+0x73] */   #  e9a: 324273
.Lbr112:    extui        a6, a0, 0, 8                          #  e9d: 006074
            bnez         a6, .Lbr114                           #  ea0: dc16
            movi         a7, .Ldata006                         #  ea2: 71eaff
            l32i         a7, a7, 0 /* [.Ldata006] */           #  ea5: 7807
            bne          a7, a2, .Lbr113                       #  ea7: 279707
            movi         a3, 2 /* 0x00000002 */                #  eaa: 0c23
            call0        .Lfunc014                             #  eac: 054500
            j            .Lbr114                               #  eaf: 860000
.Lbr113:    call0        cnx_remove_rc                         #  eb2: 050000
.Lbr114:    l32i         a0, sp, 0 /* [(local0)] */            #  eb5: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  eb7: 12c110
            ret                                                #  eba: 0df0

# Function @ .irom0.text+0xebc
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      cnx_rc_update_age
            .type        cnx_rc_update_age, @function
cnx_rc_update_age:
            addi         sp, sp, -16 /* (local0) */            #  ebc: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  ebf: 0901
            beqz         a4, .Lbr115                           #  ec1: 8c64
            l8ui         a0, a2, 117 /* [arg0+0x75] */         #  ec3: 020275
            bnei         a4, 1, .Lbr116                        #  ec6: 661407
            add          a3, a3, a0                            #  ec9: 0a33
.Lbr115:    extui        a0, a3, 0, 8                          #  ecb: 300074
            s8i          a0, a2, 117 /* a0 -> [arg0+0x75] */   #  ece: 024275
.Lbr116:    bnez         a0, .Lbr117                           #  ed1: cc30
            movi         a3, 1 /* 0x00000001 */                #  ed3: 0c13
            call0        .Lfunc014                             #  ed5: 854200
.Lbr117:    l32i         a0, sp, 0 /* [(local0)] */            #  ed8: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  eda: 12c110
            ret                                                #  edd: 0df0

            .literal_position                                  #  ee0: 00000000
                                                               #  ee4: 00000000

# Function @ .irom0.text+0xee8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      cnx_update_bss
            .type        cnx_update_bss, @function
cnx_update_bss:
            addi         sp, sp, -16 /* (local0) */            #  ee8: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  eeb: 0911
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    #  eed: 3901
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  eef: c921
            addi         a3, a4, 16 /* arg2+0x10 */            #  ef1: 32c410
            mov          a12, a2 /* arg0 */                    #  ef4: cd02
            movi         a4, 6 /* 0x00000006 */                #  ef6: 0c64
            call0        memcpy                                #  ef8: 01faffc0
                                                               #  efc: 0000
            addi         a2, a12, 71 /* arg0+0x47 */           #  efe: 22cc47
            l32i         a4, sp, 0 /* [(local0)] */            #  f01: 4801
            movi         a5, 15 /* 0x0000000f */               #  f03: 0cf5
            l32i         a3, a4, 36 /* [[(local0)]+0x24] */    #  f05: 3894
            l32i         a4, a4, 40 /* [[(local0)]+0x28] */    #  f07: 48a4
            call0        ieee80211_setup_rateset               #  f09: 01f6ffc0
                                                               #  f0d: 0000
            l32i         a12, sp, 8 /* [(local2)] */           #  f0f: c821
            l32i         a0, sp, 4 /* [(local1)] */            #  f11: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  f13: 12c110
            ret                                                #  f16: 0df0

            .literal_position                                  #  f18: 8c060000
                                                               #  f1c: 00000000
                                                               #  f20: 00000000
                                                               #  f24: 00000000
                                                               #  f28: 00000000
                                                               #  f2c: 00000000
                                                               #  f30: 00000000
                                                               #  f34: 00000000
                                                               #  f38: 00000000
                                                               #  f3c: 00000000
                                                               #  f40: 00000000
                                                               #  f44: 00000000
                                                               #  f48: 00000000
                                                               #  f4c: 00000000
                                                               #  f50: 00000000
                                                               #  f54: 00000000
                                                               #  f58: 00000000
                                                               #  f5c: 00000000
                                                               #  f60: 00000000

# Function @ .irom0.text+0xf64
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      cnx_update_bss_more
            .type        cnx_update_bss_more, @function
cnx_update_bss_more:
            movi         a5, .Ldata006                         #  f64: 51edff
            addi         sp, sp, -32 /* (local0) */            #  f67: 12c1e0
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  f6a: f941
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  f6c: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  f6e: 0901
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  f70: e931
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  f72: d921
            movi         a14, 0 /* 0x00000000 */               #  f74: 0c0e
            mov          a13, a3 /* arg1 */                    #  f76: dd03
            l16ui        a0, a3, 6 /* [arg1+0x6] */            #  f78: 021303
            mov          a12, a2 /* arg0 */                    #  f7b: cd02
            l32i         a5, a5, 0 /* [.Ldata006] */           #  f7d: 5805
            l16ui        a2, a2, 28 /* [arg0+0x1c] */          #  f7f: 22120e
            sub          a5, a5, a12                           #  f82: c055c0
            movi         a3, 1 /* 0x00000001 */                #  f85: 0c13
            moveqz       a14, a3, a5                           #  f87: 50e383
            beq          a2, a0, .Lbr118                       #  f8a: 071202
            s16i         a0, a12, 28 /* [arg1+0x6] -> [arg0+0x1c] */ #  f8d: 025c0e
.Lbr118:    bnez         a4, .Lbr120                           #  f90: dc74
            l32i         a3, a13, 20 /* [arg1+0x14] */         #  f92: 385d
            beqz         a3, .Lbr120                           #  f94: 9c33
            beqz         a14, .Lbr119                          #  f96: 8c5e
            mov          a2, a12 /* arg0 */                    #  f98: 2d0c
            call0        .Lfunc012                             #  f9a: 451600
            l32i         a3, a13, 20 /* [arg1+0x14] */         #  f9d: 385d
.Lbr119:    l8ui         a7, a3, 2 /* [[arg1+0x14]+0x2] */     #  f9f: 720302
            s8i          a7, a12, 37 /* [[arg1+0x14]+0x2] -> [arg0+0x25] */ #  fa2: 724c25
            l8ui         a6, a3, 3 /* [[arg1+0x14]+0x3] */     #  fa5: 620303
            s8i          a6, a12, 36 /* [[arg1+0x14]+0x3] -> [arg0+0x24] */ #  fa8: 624c24
.Lbr120:    addi         a2, a12, 16 /* arg0+0x10 */           #  fab: 22cc10
            movi         a4, 8 /* 0x00000008 */                #  fae: 0c84
            l32i         a3, a13, 24 /* [arg1+0x18] */         #  fb0: 386d
            l16ui        a8, a13, 4 /* [arg1+0x4] */           #  fb2: 821d02
            s16i         a8, a12, 34 /* [arg1+0x4] -> [arg0+0x22] */ #  fb5: 825c11
            call0        memcpy                                #  fb8: 01e0ffc0
                                                               #  fbc: 0000
            movi         a2, 1024 /* 0x00000400 */             #  fbe: 22a400
            l16ui        a0, a13, 2 /* [arg1+0x2] */           #  fc1: 021d01
            l16ui        a9, a12, 30 /* [arg0+0x1e] */         #  fc4: 921c0f
            movi         a15, g_ic                             #  fc7: f1d5ff
            xor          a9, a9, a0                            #  fca: 009930
            bbci         a9, 10, .Lbr121                       #  fcd: a7690f
            beqz         a14, .Lbr121                          #  fd0: 8cce
            and          a3, a0, a2                            #  fd2: 203010
            mov          a2, a15 /* g_ic */                    #  fd5: 2d0f
            call0        ieee80211_set_shortslottime           #  fd7: 01d9ffc0
                                                               #  fdb: 0000
            l16ui        a0, a13, 2 /* [arg1+0x2] */           #  fdd: 021d01
.Lbr121:    l32i         a3, a13, 56 /* [arg1+0x38] */         #  fe0: 38ed
            s16i         a0, a12, 30 /* [arg1+0x2] -> [arg0+0x1e] */ #  fe2: 025c0f
            beqz         a3, .Lbr122                           #  fe5: 9c93
            mov          a2, a12 /* arg0 */                    #  fe7: 2d0c
            call0        ieee80211_parse_wmeparams             #  fe9: 01d5ffc0
                                                               #  fed: 0000
            blti         a2, 1, .Lbr123                        #  fef: a6121f
            beqz         a14, .Lbr123                          #  ff2: 9cce
            mov          a2, a12 /* arg0 */                    #  ff4: 2d0c
            addi         a3, a12, 87 /* arg0+0x57 */           #  ff6: 32cc57
            call0        ieee80211_wme_updateparams            #  ff9: 01d2ffc0
                                                               #  ffd: 0000
            j            .Lbr123                               #  fff: c60300
.Lbr122:    l8ui         a10, a12, 87 /* [arg0+0x57] */        # 1002: a20c57
            beqz         a10, .Lbr123                          # 1005: 8c9a
            addi         a2, a12, 87 /* arg0+0x57 */           # 1007: 22cc57
            movi         a3, 25 /* 0x00000019 */               # 100a: 1c93
            call0        bzero                                 # 100c: 01cfffc0
                                                               # 1010: 0000
.Lbr123:    l32i         a3, a13, 52 /* [arg1+0x34] */         # 1012: 38dd
            movi         a15, g_ic+0x189                       # 1014: f1c3ff
            beqz         a3, .Lbr124                           # 1017: 8ca3
            l8ui         a0, a15, 128 /* [g_ic+0x209] */       # 1019: 020f80
            beqi         a0, 4, .Lbr126                        # 101c: 264023
            beqi         a0, 5, .Lbr126                        # 101f: 265020
            beqi         a0, 7, .Lbr126                        # 1022: 26701d
.Lbr124:    l32i         a3, a13, 48 /* [arg1+0x30] */         # 1025: 38cd
            l8ui         a0, a15, 128 /* [g_ic+0x209] */       # 1027: 020f80
            beqz         a3, .Lbr125                           # 102a: 9c03
            addi         a11, a0, -2 /* [g_ic+0x209]-0x2 */    # 102c: b2c0fe
            beqz         a11, .Lbr130                          # 102f: 164b0b
            addi         a14, a0, -3 /* [g_ic+0x209]-0x3 */    # 1032: e2c0fd
            beqz         a14, .Lbr130                          # 1035: 16ee0a
            addi         a2, a0, -6 /* [g_ic+0x209]-0x6 */     # 1038: 22c0fa
            beqz         a2, .Lbr130                           # 103b: 16820a
.Lbr125:    movi         a14, 0 /* 0x00000000 */               # 103e: 0c0e
            j            .Lbr127                               # 1040: 860400
.Lbr126:    l8ui         a14, a3, 1 /* [[arg1+0x34]+0x1] */    # 1043: e20301
            addi         a2, a12, 39 /* arg0+0x27 */           # 1046: 22cc27
            addi         a14, a14, 2 /* [[arg1+0x34]+0x1]+0x2 */ # 1049: 2bee
            extui        a14, a14, 0, 8                        # 104b: e0e074
            mov          a4, a14                               # 104e: 4d0e
            call0        memcpy                                # 1050: 01bfffc0
                                                               # 1054: 0000
.Lbr127:    s8i          a14, a12, 38 /* a14 -> [arg0+0x26] */ # 1056: e24c26
            l32i         a3, a13, 60 /* [arg1+0x3c] */         # 1059: 38fd
            l32i         a4, a13, 64 /* [arg1+0x40] */         # 105b: 422d10
            beqz         a3, .Lbr128                           # 105e: bc53
            beqz         a4, .Lbr128                           # 1060: bc34
            addmi        a2, a15, 768 /* g_ic+0x489 */         # 1062: 22df03
            l8ui         a0, a2, 134 /* [g_ic+0x50f] */        # 1065: 020286
            l8ui         a5, a2, 133 /* [g_ic+0x50e] */        # 1068: 520285
            slli         a0, a0, 8                             # 106b: 800011
            or           a0, a0, a5                            # 106e: 500020
            slli         a0, a0, 8                             # 1071: 800011
            l8ui         a5, a2, 132 /* [g_ic+0x50d] */        # 1074: 520284
            l8ui         a2, a2, 131 /* [g_ic+0x50c] */        # 1077: 220283
            or           a0, a0, a5                            # 107a: 500020
            slli         a0, a0, 8                             # 107d: 800011
            or           a0, a0, a2                            # 1080: 200020
            bbci         a0, 19, .Lbr128                       # 1083: 377010
            movi         a2, g_ic                              # 1086: 21a7ff
            l32i         a2, a2, 16 /* [g_ic+0x10] */          # 1089: 2842
            l32i         a5, a12, 120 /* [arg0+0x78] */        # 108b: 522c1e
            s32i         a5, a2, 188 /* [arg0+0x78] -> [[g_ic+0x10]+0xbc] */ # 108e: 52622f
            call0        ieee80211_ht_updateparams             # 1091: 01afffc0
                                                               # 1095: 0000
.Lbr128:    movi         a3, gScanStruct                       # 1097: 31a4ff
            movi         a4, auth_type                         # 109a: 41a4ff
            l8ui         a3, a3, 93 /* [gScanStruct+0x5d] */   # 109d: 32035d
            l8ui         a4, a4, 0 /* [auth_type] */           # 10a0: 420400
            bbsi         a3, 0, .Lbr129                        # 10a3: 07e331
            extui        a5, a4, 4, 4                          # 10a6: 405434
            extui        a4, a4, 0, 4                          # 10a9: 404034
            beq          a4, a5, .Lbr129                       # 10ac: 571428
            movi         a12, g_ic                             # 10af: c1a0ff
            l32i         a12, a12, 16 /* [g_ic+0x10] */        # 10b2: c84c
            addi         a12, a12, 4 /* [g_ic+0x10]+0x4 */     # 10b4: 4bcc
            mov          a2, a12 /* [g_ic+0x10]+0x4 */         # 10b6: 2d0c
            call0        os_timer_disarm                       # 10b8: 01a7ffc0
                                                               # 10bc: 0000
            mov          a2, a12 /* [g_ic+0x10]+0x4 */         # 10be: 2d0c
            movi         a3, cnx_connect_timeout               # 10c0: 319dff
            movi         a4, 0 /* 0x00000000 */                # 10c3: 0c04
            call0        os_timer_setfn                        # 10c5: 01a4ffc0
                                                               # 10c9: 0000
            mov          a2, a12 /* [g_ic+0x10]+0x4 */         # 10cb: 2d0c
            movi         a3, 1000 /* 0x000003e8 */             # 10cd: 32a3e8
            movi         a4, 0 /* 0x00000000 */                # 10d0: 0c04
            call0        os_timer_arm                          # 10d2: 01a2ffc0
                                                               # 10d6: 0000
.Lbr129:    l32i         a12, sp, 4 /* [(local1)] */           # 10d8: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 10da: d821
            l32i         a14, sp, 12 /* [(local3)] */          # 10dc: e831
            l32i         a15, sp, 16 /* [(local4)] */          # 10de: f841
            l32i         a0, sp, 0 /* [(local0)] */            # 10e0: 0801
            addi         sp, sp, 32 /* (top of frame) */       # 10e2: 12c120
            ret                                                # 10e5: 0df0
.Lbr130:    l8ui         a14, a3, 1 /* [[arg1+0x30]+0x1] */    # 10e7: e20301
            addi         a2, a12, 39 /* arg0+0x27 */           # 10ea: 22cc27
            addi         a14, a14, 2 /* [[arg1+0x30]+0x1]+0x2 */ # 10ed: 2bee
            extui        a14, a14, 0, 8                        # 10ef: e0e074
            mov          a4, a14                               # 10f2: 4d0e
            call0        memcpy                                # 10f4: 019bffc0
                                                               # 10f8: 0000
            j            .Lbr127                               # 10fa: 06d6ff

            .balign      4
# Function @ .irom0.text+0x1100
            .balign      4
.Lfunc012:  ret           /* arg0 */                           # 1100: 0df0

            .literal_position                                  # 1104: 00000000
                                                               # 1108: 00000000
                                                               # 110c: 90060000
                                                               # 1110: 8c060000
                                                               # 1114: 00000000
                                                               # 1118: 00000000
                                                               # 111c: 00000000
                                                               # 1120: 00000000
                                                               # 1124: 00000000
                                                               # 1128: 00000000
                                                               # 112c: 00000000
                                                               # 1130: 00000000
                                                               # 1134: 00000000
                                                               # 1138: 00000000

# Function @ .irom0.text+0x113c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word[3]   @ -0x1c
#     (local2):  word      @ -0x10
#     (local3):  word      @ -0xc
#     (local4):  word      @ -0x8
#     (local5):  word      @ -0x4
            .balign      4
            .global      cnx_sta_leave
            .type        cnx_sta_leave, @function
cnx_sta_leave:
            addi         sp, sp, -32 /* (local0) */            # 113c: 12c1e0
            s32i         a0, sp, 16 /* a0 -> [(local2)] */     # 113f: 0941
            s32i         a13, sp, 24 /* a13 -> [(local4)] */   # 1141: d961
            s32i         a12, sp, 20 /* a12 -> [(local3)] */   # 1143: c951
            s32i         a14, sp, 28 /* a14 -> [(local5)] */   # 1145: e971
            mov          a12, a3 /* arg1 */                    # 1147: cd03
            mov          a14, a2 /* arg0 */                    # 1149: ed02
            l32i         a13, a2, 0 /* [arg0] */               # 114b: d802
            call0        ieee80211_phy_type_get                # 114d: 01f1ffc0
                                                               # 1151: 0000
            movi         a3, 0 /* 0x00000000 */                # 1153: 0c03
            mov          a4, a12 /* arg1 */                    # 1155: 4d0c
            movi         a5, 0 /* 0x00000000 */                # 1157: 0c05
            l16ui        a6, a12, 26 /* [arg1+0x1a] */         # 1159: 621c0d
            movi         a7, 0 /* 0x00000000 */                # 115c: 0c07
            s32i         a7, sp, 0 /* 0x00000000 -> [(local0)] */ # 115e: 7901
            s32i         a7, sp, 4 /* 0x00000000 -> [(local1)] */ # 1160: 7911
            extui        a6, a6, 0, 12                         # 1162: 6060b4
            mov          a7, a2                                # 1165: 7d02
            movi         a2, 0 /* 0x00000000 */                # 1167: 0c02
            call0        ic_set_sta                            # 1169: 01ebffc0
                                                               # 116d: 0000
            mov          a2, a13 /* [arg0] */                  # 116f: 2d0d
            call0        netif_set_down                        # 1171: 01eaffc0
                                                               # 1175: 0000
            l8ui         a8, a13, 47 /* [[arg0]+0x2f] */       # 1177: 820d2f
            bbci         a8, 3, .Lbr131                        # 117a: 37680f
            mov          a2, a13 /* [arg0] */                  # 117d: 2d0d
            call0        dhcp_release                          # 117f: 01e8ffc0
                                                               # 1183: 0000
            mov          a2, a13 /* [arg0] */                  # 1185: 2d0d
            call0        dhcp_stop                             # 1187: 01e7ffc0
                                                               # 118b: 0000
.Lbr131:    movi         a13, g_ic                             # 118d: d1ddff
            l8ui         a2, a12, 232 /* [arg1+0xe8] */        # 1190: 220ce8
            addx4        a2, a2, a13                           # 1193: d022a0
            l32i         a2, a2, 0x190                         # 1196: 222264
            call0        free                                  # 1199: 01e3ffc0
                                                               # 119d: 0000
            l8ui         a3, a12, 232 /* [arg1+0xe8] */        # 119f: 320ce8
            movi         a0, 0 /* 0x00000000 */                # 11a2: 0c00
            addx4        a3, a3, a13                           # 11a4: d033a0
            s32i         a0, a3, 0x190                         # 11a7: 026364
            l32i         a2, a13, 0x190 /* [g_ic+0x190] */     # 11aa: 222d64
            beqz         a2, .Lbr132                           # 11ad: 8c92
            call0        free                                  # 11af: 01dfffc0
                                                               # 11b3: 0000
            movi         a0, 0 /* 0x00000000 */                # 11b5: 0c00
            s32i         a0, a13, 0x190 /* 0x00000000 -> [g_ic+0x190] */ # 11b7: 026d64
.Lbr132:    l32i         a2, a13, 0x194 /* [g_ic+0x194] */     # 11ba: 222d65
            beqz         a2, .Lbr133                           # 11bd: 8c92
            call0        free                                  # 11bf: 01dcffc0
                                                               # 11c3: 0000
            movi         a4, 0 /* 0x00000000 */                # 11c5: 0c04
            s32i         a4, a13, 0x194 /* 0x00000000 -> [g_ic+0x194] */ # 11c7: 426d65
.Lbr133:    call0        scan_cancel                           # 11ca: 01daffc0
                                                               # 11ce: 0000
            movi         a2, 0 /* 0x00000000 */                # 11d0: 0c02
            movi         a3, 0 /* 0x00000000 */                # 11d2: 0c03
            movi         a4, 0 /* 0x00000000 */                # 11d4: 0c04
            call0        wDev_SetRxPolicy                      # 11d6: 01d8ffc0
                                                               # 11da: 0000
            movi         a6, .Ldata001                         # 11dc: 61cbff
            movi         a5, 2 /* 0x00000002 */                # 11df: 0c25
            s32i         a5, a6, 0 /* 0x00000002 -> [.Ldata001] */ # 11e1: 5906
            l8ui         a0, a12, 6 /* [arg1+0x6] */           # 11e3: 020c06
            bbci         a0, 1, .Lbr134                        # 11e6: 176016
            mov          a2, a12 /* arg1 */                    # 11e9: 2d0c
            movi         a3, -7 /* 0xfffffff9 */               # 11eb: 7c93
            movi         a4, 1 /* 0x00000001 */                # 11ed: 0c14
            movi         a7, 253 /* 0x000000fd */              # 11ef: 72a0fd
            and          a7, a0, a7                            # 11f2: 707010
            s8i          a7, a12, 6 /* a7 -> [arg1+0x6] */     # 11f5: 724c06
            call0        cnx_rc_update_state_metric            # 11f8: 050000
            movi         a8, .Ldata007                         # 11fb: 81c4ff
            s32i         a12, a8, 0 /* arg1 -> [.Ldata007] */  # 11fe: c908
.Lbr134:    movi         a13, 0 /* 0x00000000 */               # 1200: 0c0d
            mov          a2, a12 /* arg1 */                    # 1202: 2d0c
            call0        cnx_remove_rc                         # 1204: 050000
            l32i         a0, sp, 16 /* [(local2)] */           # 1207: 0841
            movi         a11, .Ldata006                        # 1209: b1c1ff
            l32i         a9, a12, 8 /* [arg1+0x8] */           # 120c: 982c
            movi         a10, -2 /* 0xfffffffe */              # 120e: 7cea
            and          a9, a9, a10                           # 1210: a09910
            s32i         a13, a11, 0 /* 0x00000000 -> [.Ldata006] */ # 1213: d90b
            s32i         a9, a12, 8 /* a9 -> [arg1+0x8] */     # 1215: 992c
            s32i         a13, a14, 136 /* 0x00000000 -> [arg0+0x88] */ # 1217: d26e22
            l32i         a12, sp, 20 /* [(local3)] */          # 121a: c851
            l32i         a13, sp, 24 /* [(local4)] */          # 121c: d861
            l32i         a14, sp, 28 /* [(local5)] */          # 121e: e871
            addi         sp, sp, 32 /* (top of frame) */       # 1220: 12c120
            ret                                                # 1223: 0df0

            .literal_position                                  # 1228: 30000000
                                                               # 122c: 00000000
                                                               # 1230: 00000000
                                                               # 1234: 00000000
                                                               # 1238: 00000000

# Function @ .irom0.text+0x123c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc013:  movi         a2, .Lstr003                          # 123c: 21fbff
            addi         sp, sp, -16 /* (local0) */            # 123f: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1242: 0901
            call0        printf                                # 1244: 01fcffc0
                                                               # 1248: 0000
            movi         a2, g_ic                              # 124a: 21f8ff
            l32i         a7, a2, 16 /* [g_ic+0x10] */          # 124d: 7842
            movi         a0, 0 /* 0x00000000 */                # 124f: 0c00
            s8i          a0, a7, 184 /* 0x00 -> [[g_ic+0x10]+0xb8] */ # 1251: 0247b8
            l32i         a6, a2, 16 /* [g_ic+0x10] */          # 1254: 6842
            movi         a4, 1 /* 0x00000001 */                # 1256: 0c14
            s8i          a0, a6, 186 /* 0x00 -> [[g_ic+0x10]+0xba] */ # 1258: 0246ba
            l32i         a5, a2, 16 /* [g_ic+0x10] */          # 125b: 5842
            mov          a3, a0 /* 0x00000000 */               # 125d: 3d00
            s8i          a0, a5, 185 /* 0x00 -> [[g_ic+0x10]+0xb9] */ # 125f: 0245b9
            call0        ieee80211_sta_new_state               # 1262: 01f5ffc0
                                                               # 1266: 0000
            movi         a2, g_ic+0x1d8                        # 1268: 21f2ff
            movi         a3, 0 /* 0x00000000 */                # 126b: 0c03
            call0        cnx_sta_connect_cmd                   # 126d: 050000
            l32i         a0, sp, 0 /* [(local0)] */            # 1270: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1272: 12c110
            ret                                                # 1275: 0df0

            .literal_position                                  # 1278: 3c120000
                                                               # 127c: 10270000
                                                               # 1280: 00000000
                                                               # 1284: 00000000
                                                               # 1288: 00000000
                                                               # 128c: 00000000
                                                               # 1290: 00000000
                                                               # 1294: 00000000

# Function @ .irom0.text+0x1298
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word[3]   @ -0x1c
#     (local2):  word      @ -0x10
#     (local3):  word      @ -0xc
#     (local4):  word      @ -0x8
#     (local5):  word      @ -0x4
            .balign      4
            .global      cnx_sta_associated
            .type        cnx_sta_associated, @function
cnx_sta_associated:
            addi         sp, sp, -32 /* (local0) */            # 1298: 12c1e0
            s32i         a3, sp, 16 /* arg1 -> [(local2)] */   # 129b: 3941
            s32i         a12, sp, 28 /* a12 -> [(local5)] */   # 129d: c971
            s32i         a0, sp, 24 /* a0 -> [(local4)] */     # 129f: 0961
            mov          a12, a2 /* arg0 */                    # 12a1: cd02
            call0        ieee80211_phy_type_get                # 12a3: 01f7ffc0
                                                               # 12a7: 0000
            movi         a3, 1 /* 0x00000001 */                # 12a9: 0c13
            movi         a5, 0 /* 0x00000000 */                # 12ab: 0c05
            l32i         a4, sp, 16 /* [(local2)] */           # 12ad: 4841
            movi         a7, 0 /* 0x00000000 */                # 12af: 0c07
            l16ui        a6, a4, 26 /* [[(local2)]+0x1a] */    # 12b1: 62140d
            s32i         a7, sp, 0 /* 0x00000000 -> [(local0)] */ # 12b4: 7901
            s32i         a7, sp, 4 /* 0x00000000 -> [(local1)] */ # 12b6: 7911
            extui        a6, a6, 0, 12                         # 12b8: 6060b4
            mov          a7, a2                                # 12bb: 7d02
            movi         a2, 0 /* 0x00000000 */                # 12bd: 0c02
            call0        ic_set_sta                            # 12bf: 01f1ffc0
                                                               # 12c3: 0000
            addi         a2, a12, 32 /* arg0+0x20 */           # 12c5: 22cc20
            s32i         a2, sp, 20 /* arg0+0x20 -> [(local3)] */ # 12c8: 2951
            call0        os_timer_disarm                       # 12ca: 01efffc0
                                                               # 12ce: 0000
            l32i         a2, sp, 20 /* [(local3)] */           # 12d0: 2851
            movi         a3, .Lfunc013                         # 12d2: 31e9ff
            movi         a4, 0 /* 0x00000000 */                # 12d5: 0c04
            call0        os_timer_setfn                        # 12d7: 01edffc0
                                                               # 12db: 0000
            addi         a12, a12, 4 /* arg0+0x4 */            # 12dd: 4bcc
            mov          a2, a12 /* arg0+0x4 */                # 12df: 2d0c
            call0        os_timer_disarm                       # 12e1: 01ebffc0
                                                               # 12e5: 0000
            mov          a2, a12 /* arg0+0x4 */                # 12e7: 2d0c
            movi         a3, 0x00002710                        # 12e9: 31e4ff
            movi         a4, 0 /* 0x00000000 */                # 12ec: 0c04
            call0        os_timer_arm                          # 12ee: 01e9ffc0
                                                               # 12f2: 0000
            l32i         a12, sp, 28 /* [(local5)] */          # 12f4: c871
            l32i         a0, sp, 24 /* [(local4)] */           # 12f6: 0861
            addi         sp, sp, 32 /* (top of frame) */       # 12f8: 12c120
            ret                                                # 12fb: 0df0

            .balign      4
# Function @ .irom0.text+0x1300
            .balign      4
.Lfunc014:  ret           /* arg0 */                           # 1300: 0df0

            .literal_position                                  # 1304: 00000000
                                                               # 1308: 00000000
                                                               # 130c: 00000000
                                                               # 1310: 00000000

# Function @ .irom0.text+0x1314
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      cnx_node_alloc
            .type        cnx_node_alloc, @function
cnx_node_alloc:
            movi         a6, g_ic+0x280                        # 1314: 61fcff
            addi         sp, sp, -16 /* (local0) */            # 1317: 12c1f0
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   # 131a: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 131c: c921
            l8ui         a6, a6, 144 /* [g_ic+0x310] */        # 131e: 620690
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 1321: 0911
            addi         a6, a6, 2 /* [g_ic+0x310]+0x2 */      # 1323: 2b66
            blti         a6, 2, .Lbr137                        # 1325: a6263b
            movi         a0, g_ic                              # 1328: 01f8ff
            movi         a12, 1 /* 0x00000001 */               # 132b: 0c1c
            l32i         a0, a0, 20 /* [g_ic+0x14] */          # 132d: 0850
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    # 132f: 2901
.Lbr135:    addx4        a13, a12, a0                          # 1331: 00dca0
            l32i         a2, a13, 144                          # 1334: 222d24
            bnez         a2, .Lbr136                           # 1337: ec12
            movi         a2, 272 /* 0x00000110 */              # 1339: 22a110
            call0        zalloc                                # 133c: 01f4ffc0
                                                               # 1340: 0000
            movi         a4, 6 /* 0x00000006 */                # 1342: 0c64
            addi         a3, a12, 7                            # 1344: 7b3c
            s32i         a2, a13, 144                          # 1346: 226d24
            mov          a12, a2                               # 1349: cd02
            s8i          a3, a2, 232                           # 134b: 3242e8
            l32i         a3, sp, 0 /* [(local0)] */            # 134e: 3801
            l32i         a2, a13, 144                          # 1350: 222d24
            call0        memcpy                                # 1353: 01efffc0
                                                               # 1357: 0000
            j            .Lbr138                               # 1359: 460200
.Lbr136:    addi         a12, a12, 1                           # 135c: 1bcc
            extui        a12, a12, 0, 8                        # 135e: c0c074
            bne          a6, a12, .Lbr135                      # 1361: c796cc
.Lbr137:    movi         a12, 0 /* 0x00000000 */               # 1364: 0c0c
.Lbr138:    l32i         a0, sp, 4 /* [(local1)] */            # 1366: 0811
            mov          a2, a12                               # 1368: 2d0c
            l32i         a13, sp, 12 /* [(local3)] */          # 136a: d831
            l32i         a12, sp, 8 /* [(local2)] */           # 136c: c821
            addi         sp, sp, 16 /* (top of frame) */       # 136e: 12c110
            ret                                                # 1371: 0df0

            .literal_position                                  # 1374: 00000000
                                                               # 1378: 00000000
                                                               # 137c: 00000000
                                                               # 1380: 00000000
                                                               # 1384: 00000000
                                                               # 1388: 00000000
                                                               # 138c: 00000000

# Function @ .irom0.text+0x1390
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      cnx_node_remove
            .type        cnx_node_remove, @function
cnx_node_remove:
            movi         a6, g_ic+0x280                        # 1390: 61f9ff
            addi         sp, sp, -16 /* (local0) */            # 1393: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 1396: d921
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1398: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 139a: c911
            l8ui         a6, a6, 144 /* [g_ic+0x310] */        # 139c: 620690
            mov          a12, a2 /* arg0 */                    # 139f: cd02
            addi         a6, a6, 2 /* [g_ic+0x310]+0x2 */      # 13a1: 2b66
            blti         a6, 2, .Lbr140                        # 13a3: a62647
            movi         a0, g_ic                              # 13a6: 01f4ff
            l32i         a5, a0, 20 /* [g_ic+0x14] */          # 13a9: 5850
            movi         a2, 1 /* 0x00000001 */                # 13ab: 0c12
.Lbr139:    addx4        a13, a2, a5                           # 13ad: 50d2a0
            l32i         a7, a13, 144                          # 13b0: 722d24
            addi         a2, a2, 1                             # 13b3: 1b22
            bne          a7, a12, .Lbr141                      # 13b5: c79740
            l32i         a2, a12, 228 /* [arg0+0xe4] */        # 13b8: 222c39
            call0        wpa_auth_sta_deinit                   # 13bb: 01f2ffc0
                                                               # 13bf: 0000
            movi         a3, g_ic                              # 13c1: 31eeff
            l8ui         a2, a12, 232 /* [arg0+0xe8] */        # 13c4: 220ce8
            addx4        a2, a2, a3                            # 13c7: 3022a0
            l32i         a2, a2, 0x190                         # 13ca: 222264
            call0        free                                  # 13cd: 01eeffc0
                                                               # 13d1: 0000
            mov          a2, a12 /* arg0 */                    # 13d3: 2d0c
            movi         a6, g_ic                              # 13d5: 61eaff
            l8ui         a5, a12, 232 /* [arg0+0xe8] */        # 13d8: 520ce8
            movi         a4, 0 /* 0x00000000 */                # 13db: 0c04
            addx4        a5, a5, a6                            # 13dd: 6055a0
            s32i         a4, a5, 0x190                         # 13e0: 426564
            call0        free                                  # 13e3: 01eaffc0
                                                               # 13e7: 0000
            movi         a7, 0 /* 0x00000000 */                # 13e9: 0c07
            s32i         a7, a13, 144                          # 13eb: 726d24
.Lbr140:    l32i         a12, sp, 4 /* [(local1)] */           # 13ee: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 13f0: d821
            l32i         a0, sp, 0 /* [(local0)] */            # 13f2: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 13f4: 12c110
            ret                                                # 13f7: 0df0
.Lbr141:    extui        a2, a2, 0, 8                          # 13f9: 202074
            bne          a6, a2, .Lbr139                       # 13fc: 2796ad
            j            .Lbr140                               # 13ff: c6faff

            .literal_position                                  # 1404: 00000000
                                                               # 1408: 00000000
                                                               # 140c: 00000000

# Function @ .irom0.text+0x1410
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
            .global      cnx_node_search
            .type        cnx_node_search, @function
cnx_node_search:
            addi         sp, sp, -32 /* (local0) */            # 1410: 12c1e0
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   # 1413: d931
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 1415: 0911
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   # 1417: f951
            movi         a15, g_ic+0x280                       # 1419: f1faff
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 141c: c921
            l8ui         a15, a15, 144 /* [g_ic+0x310] */      # 141e: f20f90
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   # 1421: e941
            addi         a15, a15, 2 /* [g_ic+0x310]+0x2 */    # 1423: 2bff
            blti         a15, 1, .Lbr144                       # 1425: a61f26
            movi         a14, g_ic                             # 1428: e1f8ff
            movi         a12, 0 /* 0x00000000 */               # 142b: 0c0c
            l32i         a14, a14, 20 /* [g_ic+0x14] */        # 142d: e85e
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    # 142f: 2901
.Lbr142:    addx4        a13, a12, a14                         # 1431: e0dca0
            l32i         a13, a13, 144                         # 1434: d22d24
            beqz         a13, .Lbr143                          # 1437: 8ccd
            l32i         a2, sp, 0 /* [(local0)] */            # 1439: 2801
            mov          a3, a13                               # 143b: 3d0d
            movi         a4, 6 /* 0x00000006 */                # 143d: 0c64
            call0        memcmp                                # 143f: 01f3ffc0
                                                               # 1443: 0000
            beqz         a2, .Lbr145                           # 1445: 8c82
.Lbr143:    addi         a12, a12, 1                           # 1447: 1bcc
            extui        a12, a12, 0, 8                        # 1449: c0c074
            bne          a15, a12, .Lbr142                     # 144c: c79fe1
.Lbr144:    movi         a13, 0 /* 0x00000000 */               # 144f: 0c0d
.Lbr145:    l32i         a0, sp, 4 /* [(local1)] */            # 1451: 0811
            l32i         a12, sp, 8 /* [(local2)] */           # 1453: c821
            l32i         a14, sp, 16 /* [(local4)] */          # 1455: e841
            mov          a2, a13                               # 1457: 2d0d
            l32i         a15, sp, 20 /* [(local5)] */          # 1459: f851
            l32i         a13, sp, 12 /* [(local3)] */          # 145b: d831
            addi         sp, sp, 32 /* (top of frame) */       # 145d: 12c120
            ret                                                # 1460: 0df0

            .literal_position                                  # 1464: ff3fffff
                                                               # 1468: 78000000
                                                               # 146c: 40000000
                                                               # 1470: 80000000
                                                               # 1474: 00000000
                                                               # 1478: 00000000
                                                               # 147c: 00000000
                                                               # 1480: 00000000
                                                               # 1484: 00000000
                                                               # 1488: 00000000

# Function @ .irom0.text+0x148c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word[2]   @ -0x18
#     (local3):  word      @ -0x10
#     (local4):  word      @ -0xc
#     (local5):  word[2]   @ -0x8
            .balign      4
            .global      cnx_node_leave
            .type        cnx_node_leave, @function
cnx_node_leave:
            addi         sp, sp, -32 /* (local0) */            # 148c: 12c1e0
            s32i         a0, sp, 20 /* a0 -> [(local4)] */     # 148f: 0951
            s32i         a12, sp, 24 /* a12 -> [(local5)] */   # 1491: c961
            s32i         a2, sp, 16 /* arg0 -> [(local3)] */   # 1493: 2941
            mov          a12, a3 /* arg1 */                    # 1495: cd03
            movi         a2, 236 /* 0x000000ec */              # 1497: 22a0ec
            add          a2, a3, a2 /* arg1+0xec */            # 149a: 2a23
            call0        os_timer_disarm                       # 149c: 01f7ffc0
                                                               # 14a0: 0000
            l32i         a3, sp, 16 /* [(local3)] */           # 14a2: 3841
            l32i         a3, a3, 144 /* [[(local3)]+0x90] */   # 14a4: 322324
            movi         a5, 0xffff3fff                        # 14a7: 51efff
            sub          a3, a3, a12                           # 14aa: c033c0
            beqz         a3, .Lbr149                           # 14ad: 169308
            l16ui        a4, a12, 26 /* [arg1+0x1a] */         # 14b0: 421c0d
            and          a0, a4, a5                            # 14b3: 500410
            bnone        a4, a5, .Lbr146                       # 14b6: 570426
            movi         a2, .Lstr004                          # 14b9: 21ecff
            movi         a8, .Lstr005                          # 14bc: 81ebff
            l8ui         a7, a12, 4 /* [arg1+0x4] */           # 14bf: 720c04
            l8ui         a6, a12, 3 /* [arg1+0x3] */           # 14c2: 620c03
            l8ui         a5, a12, 2 /* [arg1+0x2] */           # 14c5: 520c02
            l8ui         a4, a12, 1 /* [arg1+0x1] */           # 14c8: 420c01
            l8ui         a3, a12, 0 /* [arg1] */               # 14cb: 320c00
            l8ui         a9, a12, 5 /* [arg1+0x5] */           # 14ce: 920c05
            s32i         a9, sp, 0 /* [arg1+0x5] -> [(local0)] */ # 14d1: 9901
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      # 14d3: 0921
            s32i         a8, sp, 4 /* .Lstr005 -> [(local1)] */ # 14d5: 8911
            call0        printf                                # 14d7: 01e9ffc0
                                                               # 14db: 0000
            j            .Lbr147                               # 14dd: 060200
.Lbr146:    movi         a2, .Lstr006                          # 14e0: 21e4ff
            call0        printf                                # 14e3: 01e7ffc0
                                                               # 14e7: 0000
.Lbr147:    l16ui        a10, a12, 26 /* [arg1+0x1a] */        # 14e9: a21c0d
            beqz         a10, .Lbr148                          # 14ec: 165a04
            call0        ieee80211_phy_type_get                # 14ef: 01e5ffc0
                                                               # 14f3: 0000
            movi         a3, 0 /* 0x00000000 */                # 14f5: 0c03
            mov          a4, a12 /* arg1 */                    # 14f7: 4d0c
            l16ui        a6, a12, 26 /* [arg1+0x1a] */         # 14f9: 621c0d
            movi         a7, 0 /* 0x00000000 */                # 14fc: 0c07
            s32i         a7, sp, 0 /* 0x00000000 -> [(local0)] */ # 14fe: 7901
            s32i         a7, sp, 4 /* 0x00000000 -> [(local1)] */ # 1500: 7911
            extui        a6, a6, 0, 12                         # 1502: 6060b4
            mov          a5, a6                                # 1505: 5d06
            mov          a7, a2                                # 1507: 7d02
            movi         a2, 1 /* 0x00000001 */                # 1509: 0c12
            call0        ic_set_sta                            # 150b: 01dfffc0
                                                               # 150f: 0000
            movi         a8, 0 /* 0x00000000 */                # 1511: 0c08
            movi         a0, -1 /* 0xffffffff */               # 1513: 7cf0
            movi         a11, 1 /* 0x00000001 */               # 1515: 0c1b
            movi         a10, g_ic                             # 1517: a1d7ff
            l16ui        a2, a12, 26 /* [arg1+0x1a] */         # 151a: 221c0d
            l16ui        a9, a10, 0x1d0 /* [g_ic+0x1d0] */     # 151d: 921ae8
            extui        a2, a2, 0, 5                          # 1520: 202044
            ssl          a2                                    # 1523: 001240
            sll          a11, a11                              # 1526: 00bba1
            xor          a11, a11, a0                          # 1529: 00bb30
            and          a9, a9, a11                           # 152c: b09910
            s16i         a9, a10, 0x1d0 /* a9 -> [g_ic+0x1d0] */ # 152f: 925ae8
            s16i         a8, a12, 26 /* 0x0000 -> [arg1+0x1a] */ # 1532: 825c0d
.Lbr148:    mov          a2, a12 /* arg1 */                    # 1535: 2d0c
            call0        cnx_node_remove                       # 1537: 050000
.Lbr149:    l32i         a12, sp, 24 /* [(local5)] */          # 153a: c861
            l32i         a0, sp, 20 /* [(local4)] */           # 153c: 0851
            addi         sp, sp, 32 /* (top of frame) */       # 153e: 12c120
            ret                                                # 1541: 0df0

            .literal_position                                  # 1544: 00000000
                                                               # 1548: 80000000
                                                               # 154c: 00000000
                                                               # 1550: 00000000
                                                               # 1554: 00c00000
                                                               # 1558: 40000000
                                                               # 155c: 94000000
                                                               # 1560: ff3fffff
                                                               # 1564: 00000000
                                                               # 1568: 00000000
                                                               # 156c: 00000000
                                                               # 1570: 00000000
                                                               # 1574: 00000000
                                                               # 1578: 00000000
                                                               # 157c: 00000000
                                                               # 1580: 00000000
                                                               # 1584: 00000000
                                                               # 1588: 00000000
                                                               # 158c: 00000000
                                                               # 1590: 00000000
                                                               # 1594: 00000000
                                                               # 1598: 00000000
                                                               # 159c: 00000000

# Function @ .irom0.text+0x15a0
# Local variables/stack:
#     (local0):  word      @ -0x30
#     (local1):  word      @ -0x2c
#     (local2):  word[2]   @ -0x28
#     (local3):  word      @ -0x20
#     (local4):  word      @ -0x1c
#     (local5):  word      @ -0x18
#     (local6):  word      @ -0x14
#     (local7):  word[4]   @ -0x10
            .balign      4
            .global      cnx_node_join
            .type        cnx_node_join, @function
cnx_node_join:
            addi         sp, sp, -48 /* (local0) */            # 15a0: 12c1d0
            s32i         a0, sp, 20 /* a0 -> [(local4)] */     # 15a3: 0951
            s32i         a12, sp, 24 /* a12 -> [(local5)] */   # 15a5: c961
            s32i         a13, sp, 28 /* a13 -> [(local6)] */   # 15a7: d971
            s32i         a14, sp, 32 /* a14 -> [(local7)] */   # 15a9: e981
            mov          a13, a3 /* arg1 */                    # 15ab: dd03
            mov          a14, a2 /* arg0 */                    # 15ad: ed02
            mov          a12, a4 /* arg2 */                    # 15af: cd04
            mov          a2, a3 /* arg1 */                     # 15b1: 2d03
            movi         a4, 6 /* 0x00000006 */                # 15b3: 0c64
            movi         a3, ieee80211_addr_bcast              # 15b5: 31e3ff
            call0        memcmp                                # 15b8: 01ecffc0
                                                               # 15bc: 0000
            bnez         a2, .Lbr150                           # 15be: dcd2
            mov          a3, a12 /* arg2 */                    # 15c0: 3d0c
            mov          a2, a14 /* arg0 */                    # 15c2: 2d0e
            movi         a4, 17 /* 0x00000011 */               # 15c4: 1c14
            call0        ieee80211_send_mgmt                   # 15c6: 01e9ffc0
                                                               # 15ca: 0000
            movi         a2, .Lstr006                          # 15cc: 21dfff
            call0        printf                                # 15cf: 01e8ffc0
                                                               # 15d3: 0000
            mov          a3, a13 /* arg1 */                    # 15d5: 3d0d
            mov          a2, a14 /* arg0 */                    # 15d7: 2d0e
            call0        cnx_node_leave                        # 15d9: 050000
            j            .Lbr157                               # 15dc: 064c00
.Lbr150:    l16ui        a9, a13, 26 /* [arg1+0x1a] */         # 15df: 921d0d
            movi         a0, 1 /* 0x00000001 */                # 15e2: 0c10
            bnez         a9, .Lbr155                           # 15e4: 567907
            s32i         a12, sp, 16 /* arg2 -> [(local3)] */  # 15e7: c941
            movi         a6, g_ic                              # 15e9: 61d9ff
            movi         a5, g_ic+0x280                        # 15ec: 51d8ff
            movi         a4, g_ic+0x290                        # 15ef: 41ddff
            l8ui         a5, a5, 144 /* [g_ic+0x310] */        # 15f2: 520590
            l8ui         a4, a4, 128 /* [g_ic+0x310] */        # 15f5: 420480
            addi         a5, a5, 1 /* [g_ic+0x310]+0x1 */      # 15f8: 1b55
            bgei         a5, 2, .Lbr151                        # 15fa: e62502
            j            .Lbr158                               # 15fd: 064700
.Lbr151:    l16ui        a2, a6, 0x1d0 /* [g_ic+0x1d0] */      # 1600: 2216e8
            mov          a12, a0 /* 0x00000001 */              # 1603: cd00
.Lbr152:    extui        a8, a12, 0, 5                         # 1605: c08044
            ssr          a8                                    # 1608: 000840
            sra          a7, a2                                # 160b: 2070b1
            bbsi         a7, 0, .Lbr153                        # 160e: 07e702
            j            .Lbr159                               # 1611: 864200
.Lbr153:    addi         a12, a12, 1                           # 1614: 1bcc
            extui        a12, a12, 0, 16                       # 1616: c0c0f4
            bne          a5, a12, .Lbr152                      # 1619: c795e8
            j            .Lbr159                               # 161c: c63f00
.Lbr154:    movi         a3, 0x0000c000                        # 161f: 31cdff
            movi         a2, 1 /* 0x00000001 */                # 1622: 0c12
            or           a3, a12, a3                           # 1624: 303c20
            s16i         a3, a13, 26 /* a3 -> [arg1+0x1a] */   # 1627: 325d0d
            l16ui        a0, a6, 0x1d0 /* [g_ic+0x1d0] */      # 162a: 0216e8
            extui        a3, a3, 0, 5                          # 162d: 303044
            ssl          a3                                    # 1630: 001340
            sll          a2, a2                                # 1633: 0022a1
            or           a0, a0, a2                            # 1636: 200020
            s16i         a0, a6, 0x1d0 /* a0 -> [g_ic+0x1d0] */ # 1639: 0256e8
            call0        ieee80211_phy_type_get                # 163c: 01ceffc0
                                                               # 1640: 0000
            mov          a6, a12                               # 1642: 6d0c
            mov          a5, a12                               # 1644: 5d0c
            movi         a3, 1 /* 0x00000001 */                # 1646: 0c13
            mov          a7, a2                                # 1648: 7d02
            movi         a4, 0 /* 0x00000000 */                # 164a: 0c04
            s32i         a4, sp, 0 /* 0x00000000 -> [(local0)] */ # 164c: 4901
            s32i         a4, sp, 4 /* 0x00000000 -> [(local1)] */ # 164e: 4911
            movi         a2, 1 /* 0x00000001 */                # 1650: 0c12
            mov          a4, a13 /* arg1 */                    # 1652: 4d0d
            call0        ic_set_sta                            # 1654: 01c9ffc0
                                                               # 1658: 0000
            l32i         a12, sp, 16 /* [(local3)] */          # 165a: c841
            l16ui        a9, a13, 26 /* [arg1+0x1a] */         # 165c: 921d0d
.Lbr155:    movi         a2, .Lstr004                          # 165f: 21beff
            movi         a8, .Lstr007                          # 1662: 81beff
            l8ui         a3, a13, 0 /* [arg1] */               # 1665: 320d00
            l8ui         a4, a13, 1 /* [arg1+0x1] */           # 1668: 420d01
            l8ui         a5, a13, 2 /* [arg1+0x2] */           # 166b: 520d02
            l8ui         a6, a13, 3 /* [arg1+0x3] */           # 166e: 620d03
            l8ui         a7, a13, 4 /* [arg1+0x4] */           # 1671: 720d04
            movi         a11, 0xffff3fff                       # 1674: b1bbff
            l8ui         a10, a13, 5 /* [arg1+0x5] */          # 1677: a20d05
            and          a9, a9, a11                           # 167a: b09910
            s32i         a10, sp, 0 /* [arg1+0x5] -> [(local0)] */ # 167d: a901
            s32i         a9, sp, 8 /* a9 -> [(local2)] */      # 167f: 9921
            s32i         a8, sp, 4 /* .Lstr007 -> [(local1)] */ # 1681: 8911
            call0        printf                                # 1683: 01beffc0
                                                               # 1687: 0000
            l32i         a2, a14, 136 /* [arg0+0x88] */        # 1689: 222e22
            mov          a3, a13 /* arg1 */                    # 168c: 3d0d
            movi         a4, 6 /* 0x00000006 */                # 168e: 0c64
            call0        memcpy                                # 1690: 01bcffc0
                                                               # 1694: 0000
            mov          a3, a12                               # 1696: 3d0c
            l32i         a2, a14, 136 /* [arg0+0x88] */        # 1698: 222e22
            l16ui        a0, a13, 26 /* [arg1+0x1a] */         # 169b: 021d0d
            movi         a4, 0 /* 0x00000000 */                # 169e: 0c04
            s16i         a0, a2, 26 /* [arg1+0x1a] -> [[arg0+0x88]+0x1a] */ # 16a0: 02520d
            mov          a2, a14 /* arg0 */                    # 16a3: 2d0e
            call0        ieee80211_send_mgmt                   # 16a5: 01b7ffc0
                                                               # 16a9: 0000
            l32i         a2, a14, 136 /* [arg0+0x88] */        # 16ab: 222e22
            movi         a3, 255 /* 0x000000ff */              # 16ae: 32a0ff
            movi         a4, 6 /* 0x00000006 */                # 16b1: 0c64
            call0        memset                                # 16b3: 01b5ffc0
                                                               # 16b7: 0000
            l32i         a4, a14, 136 /* [arg0+0x88] */        # 16b9: 422e22
            movi         a3, 0 /* 0x00000000 */                # 16bc: 0c03
            l32i         a0, a14, 180 /* [arg0+0xb4] */        # 16be: 022e2d
            s16i         a3, a4, 26 /* 0x0000 -> [[arg0+0x88]+0x1a] */ # 16c1: 32540d
            beqz         a0, .Lbr157                           # 16c4: 168004
            l32i         a2, a0, 24 /* [[arg0+0xb4]+0x18] */   # 16c7: 2860
            l32i         a5, a2, 4 /* [[[arg0+0xb4]+0x18]+0x4] */ # 16c9: 5812
            beqz         a5, .Lbr156                           # 16cb: bc35
            l32i         a2, a13, 228 /* [arg1+0xe4] */        # 16cd: 222d39
            call0        wpa_auth_sta_deinit                   # 16d0: 01afffc0
                                                               # 16d4: 0000
            l32i         a2, a14, 180 /* [arg0+0xb4] */        # 16d6: 222e2d
            mov          a3, a13 /* arg1 */                    # 16d9: 3d0d
            l32i         a2, a2, 24 /* [[arg0+0xb4]+0x18] */   # 16db: 2862
            call0        wpa_auth_sta_init                     # 16dd: 01acffc0
                                                               # 16e1: 0000
            s32i         a2, a13, 228 /* a2 -> [arg1+0xe4] */  # 16e3: 226d39
            beqz         a2, .Lbr157                           # 16e6: ac62
            mov          a3, a2                                # 16e8: 3d02
            l32i         a4, a14, 180 /* [arg0+0xb4] */        # 16ea: 422e2d
            l8ui         a5, a13, 38 /* [arg1+0x26] */         # 16ed: 520d26
            l32i         a2, a4, 24 /* [[arg0+0xb4]+0x18] */   # 16f0: 2864
            addi         a4, a13, 39 /* arg1+0x27 */           # 16f2: 42cd27
            call0        wpa_validate_wpa_ie                   # 16f5: 01a7ffc0
                                                               # 16f9: 0000
            bnez         a2, .Lbr157                           # 16fb: dc12
            l32i         a2, a14, 180 /* [arg0+0xb4] */        # 16fd: 222e2d
            l32i         a2, a2, 24 /* [[arg0+0xb4]+0x18] */   # 1700: 2862
.Lbr156:    l32i         a3, a13, 228 /* [arg1+0xe4] */        # 1702: 322d39
            call0        wpa_auth_sta_associated               # 1705: 01a4ffc0
                                                               # 1709: 0000
            movi         a3, 1 /* 0x00000001 */                # 170b: 0c13
            s8i          a3, a13, 24 /* 0x01 -> [arg1+0x18] */ # 170d: 324d18
.Lbr157:    l32i         a12, sp, 24 /* [(local5)] */          # 1710: c861
            l32i         a13, sp, 28 /* [(local6)] */          # 1712: d871
            l32i         a14, sp, 32 /* [(local7)] */          # 1714: e881
            l32i         a0, sp, 20 /* [(local4)] */           # 1716: 0851
            addi         sp, sp, 48 /* (top of frame) */       # 1718: 12c130
            ret                                                # 171b: 0df0
.Lbr158:    mov          a12, a0 /* 0x00000001 */              # 171d: cd00
.Lbr159:    addi         a4, a4, 1 /* [g_ic+0x310]+0x1 */      # 171f: 1b44
            bge          a12, a4, .Lbr160                      # 1721: 47ac02
            j            .Lbr154                               # 1724: c6bdff
.Lbr160:    l32i         a3, sp, 16 /* [(local3)] */           # 1727: 3841
            mov          a2, a14 /* arg0 */                    # 1729: 2d0e
            movi         a4, 17 /* 0x00000011 */               # 172b: 1c14
            call0        ieee80211_send_mgmt                   # 172d: 019bffc0
                                                               # 1731: 0000
            mov          a3, a13 /* arg1 */                    # 1733: 3d0d
            mov          a2, a14 /* arg0 */                    # 1735: 2d0e
            call0        cnx_node_leave                        # 1737: 050000
            j            .Lbr157                               # 173a: 86f4ff

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "reconnect\n"                         #    0: 7265636f
                                                               #    4: 6e6e6563
                                                               #    8: 740a00
            .balign      4
.Lstr002:   .asciz       "no %s found, reconnect after 1s\n"   #    c: 6e6f2025
                                                               #   10: 7320666f
                                                               #   14: 756e642c
                                                               #   18: 20726563
                                                               #   1c: 6f6e6e65
                                                               #   20: 63742061
                                                               #   24: 66746572
                                                               #   28: 2031730a
                                                               #   2c: 00
            .balign      4
.Lstr003:   .asciz       "beacon timeout\n"                    #   30: 62656163
                                                               #   34: 6f6e2074
                                                               #   38: 696d656f
                                                               #   3c: 75740a00
.Lstr004:   .asciz       "station: %02x:%02x:%02x:%02x:%02x:%02x %s, AID = %d\n" #   40: 73746174
                                                               #   44: 696f6e3a
                                                               #   48: 20253032
                                                               #   4c: 783a2530
                                                               #   50: 32783a25
                                                               #   54: 3032783a
                                                               #   58: 25303278
                                                               #   5c: 3a253032
                                                               #   60: 783a2530
                                                               #   64: 32782025
                                                               #   68: 732c2041
                                                               #   6c: 4944203d
                                                               #   70: 2025640a
                                                               #   74: 00
            .balign      4
.Lstr005:   .asciz       "leave"                               #   78: 6c656176
                                                               #   7c: 6500
            .balign      4
.Lstr006:   .asciz       "max connection!\n"                   #   80: 6d617820
                                                               #   84: 636f6e6e
                                                               #   88: 65637469
                                                               #   8c: 6f6e210a
                                                               #   90: 00
            .balign      4
.Lstr007:   .asciz       "join"                                #   94: 6a6f696e
                                                               #   98: 00

            .section     .rodata, "a", @progbits

.Ldata011:  .space       8

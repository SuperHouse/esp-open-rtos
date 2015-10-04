
            .section     .data, "aw", @progbits

            .global      sdk_dpd_index
            .type        sdk_dpd_index, @object
sdk_dpd_index:
            .byte        0xff, 0xf0, 0xe3, 0xd6, 0xca, 0xbf, 0xb4, 0xaa
            .byte        0xa1, 0x98, 0x8f, 0x87, 0x80, 0x78, 0x72, 0x6b
            .byte        0x65, 0x60, 0x5a, 0x55, 0x51, 0x4c, 0x48, 0x44
            .byte        0x40, 0x3c, 0x39, 0x36, 0x33, 0x30, 0x2d, 0x2b
            .byte        0x28, 0x26, 0x24, 0x22, 0x20, 0x1e, 0x1d, 0x1b
            .byte        0x19, 0x18, 0x17, 0x15, 0x14, 0x13, 0x12, 0x11
            .byte        0x10, 0x0f, 0x0e, 0x0e, 0x0d, 0x0c, 0x0b, 0x0b
            .byte        0x0a, 0x0a, 0x09, 0x09, 0x08, 0x08, 0x07, 0x07
            .byte        0x06, 0x06, 0x06, 0x05, 0x05, 0x05, 0x05, 0x04
            .byte        0x04, 0x04, 0x04, 0x03, 0x03, 0x03, 0x03, 0x03
            .byte        0x03, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02
            .byte        0x02, 0x02, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
            .global      sdk_dpd_db2linear
            .type        sdk_dpd_db2linear, @object
sdk_dpd_db2linear:
            .byte        0x00, 0x04, 0x0f, 0x04, 0x1e, 0x04, 0x2d, 0x04
            .byte        0x3d, 0x04, 0x4c, 0x04, 0x5c, 0x04, 0x6d, 0x04
            .byte        0x7d, 0x04, 0x8e, 0x04, 0x9e, 0x04, 0xb0, 0x04
            .byte        0xc1, 0x04, 0xd3, 0x04, 0xe5, 0x04, 0xf7, 0x04
            .byte        0x09, 0x05, 0x1c, 0x05, 0x2f, 0x05, 0x42, 0x05
            .byte        0x56, 0x05, 0x69, 0x05, 0x7d, 0x05, 0x92, 0x05

            .section     .bss, "aw", @nobits

            .global      sdk_loop_pwctrl_pwdet_error_accum_high_power
            .type        sdk_loop_pwctrl_pwdet_error_accum_high_power, @object
sdk_loop_pwctrl_pwdet_error_accum_high_power:
            .hword       0x0000                                #    0: 0000
            .global      sdk_tx_pwctrl_pk_num
            .type        sdk_tx_pwctrl_pk_num, @object
sdk_tx_pwctrl_pk_num:
            .byte        0x00
            .global      sdk_loop_pwctrl_correct_atten_high_power
            .type        sdk_loop_pwctrl_correct_atten_high_power, @object
sdk_loop_pwctrl_correct_atten_high_power:
            .byte        0x00
            .global      sdk_tx_pwctrl_set_chan_flag
            .type        sdk_tx_pwctrl_set_chan_flag, @object
sdk_tx_pwctrl_set_chan_flag:
            .byte        0x00
            .global      sdk_rxiq_cover_fail_num
            .type        sdk_rxiq_cover_fail_num, @object
sdk_rxiq_cover_fail_num:
            .byte        0x00

            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
            .balign      4
            .literal_position
            .global      sdk_txbbgain2dcoindex
            .type        sdk_txbbgain2dcoindex, @function
sdk_txbbgain2dcoindex:
            beqi         a2, 4, .Lbr003                        #    0: 264214
            beqi         a2, 16, .Lbr001                       #    3: 26b209
            movi         a3, 18 /* 0x00000012 */               #    6: 1c23
            beq          a2, a3, .Lbr004                       #    8: 371210
            movi         a4, 20 /* 0x00000014 */               #    b: 1c44
            beq          a2, a4, .Lbr002                       #    d: 471203
.Lbr001:    movi         a2, 1 /* 0x00000001 */                #   10: 0c12
            ret           /* 0x00000001 */                     #   12: 0df0
.Lbr002:    movi         a2, 3 /* 0x00000003 */                #   14: 0c32
            ret           /* 0x00000003 */                     #   16: 0df0
.Lbr003:    movi         a2, 0 /* 0x00000000 */                #   18: 0c02
            ret           /* 0x00000000 */                     #   1a: 0df0
.Lbr004:    movi         a2, 2 /* 0x00000002 */                #   1c: 0c22
            ret           /* 0x00000002 */                     #   1e: 0df0

# Function @ .irom0.text+0x20
            .balign      4
            .global      sdk_dcoindex2txbbgain
            .type        sdk_dcoindex2txbbgain, @function
sdk_dcoindex2txbbgain:
            beqz         a2, .Lbr007                           #   20: 8cf2
            beqi         a2, 1, .Lbr005                        #   22: 261205
            beqi         a2, 2, .Lbr008                        #   25: 26220e
            beqi         a2, 3, .Lbr006                        #   28: 263203
.Lbr005:    movi         a2, 16 /* 0x00000010 */               #   2b: 1c02
            ret           /* 0x00000010 */                     #   2d: 0df0
.Lbr006:    movi         a2, 20 /* 0x00000014 */               #   2f: 1c42
            ret           /* 0x00000014 */                     #   31: 0df0
.Lbr007:    movi         a2, 4 /* 0x00000004 */                #   33: 0c42
            ret           /* 0x00000004 */                     #   35: 0df0
.Lbr008:    movi         a2, 18 /* 0x00000012 */               #   37: 1c22
            ret           /* 0x00000012 */                     #   39: 0df0

            .literal_position                                  #   3c: 00000000
                                                               #   40: 00000000
                                                               #   44: 00000000
                                                               #   48: 00000000
                                                               #   4c: 00000800
                                                               #   50: 00000000

# Function @ .irom0.text+0x54
# Local variables/stack:
#     (local0):  byte      @ -0x20
#     (local1):  byte[3]   @ -0x1f
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word      @ -0x10
#     (local6):  word[3]   @ -0xc
            .balign      4
            .global      sdk_init_cal_dcoffset
            .type        sdk_init_cal_dcoffset, @function
sdk_init_cal_dcoffset:
            addi         sp, sp, -32 /* (local0) */            #   54: 12c1e0
            s32i         a13, sp, 12 /* a13 -> [(local4)] */   #   57: d931
            s32i         a15, sp, 20 /* a15 -> [(local6)] */   #   59: f951
            s32i         a12, sp, 8 /* a12 -> [(local3)] */    #   5b: c921
            s32i         a14, sp, 16 /* a14 -> [(local5)] */   #   5d: e941
            s32i         a0, sp, 4 /* a0 -> [(local2)] */      #   5f: 0911
            mov          a14, a3 /* arg1 */                    #   61: ed03
            l32i         a0, a2, 0 /* [arg0] */                #   63: 0802
            mov          a12, a2 /* arg0 */                    #   65: cd02
            extui        a0, a0, 19, 1                         #   67: 000305
            bnez         a0, .Lbr010                           #   6a: 56e008
            movi         a15, sdk_g_phyFuns                    #   6d: f1f3ff
            movi         a2, sdk_tx_rf_ana_gain                #   70: 21f4ff
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #   73: 080f
            l16ui        a2, a2, 0 /* [sdk_tx_rf_ana_gain] */  #   75: 221200
            l32i         a0, a0, 164 /* [[sdk_g_phyFuns]+0xa4] */ #   78: 022029
            extui        a2, a2, 0, 5                          #   7b: 202044
            callx0       a0 /* [[sdk_g_phyFuns]+0xa4] */       #   7e: c00000
            movi         a2, 1 /* 0x00000001 */                #   81: 0c12
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #   83: 080f
            movi         a3, 1 /* 0x00000001 */                #   85: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #   87: 02202b
            movi         a4, 31 /* 0x0000001f */               #   8a: 1cf4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #   8c: c00000
            movi         a13, 0 /* 0x00000000 */               #   8f: 0c0d
.Lbr009:    mov          a2, a13                               #   91: 2d0d
            call0        sdk_dcoindex2txbbgain                 #   93: 050000
            movi         a4, 500 /* 0x000001f4 */              #   96: 42a1f4
            movi         a5, 12 /* 0x0000000c */               #   99: 0cc5
            mov          a6, sp /* (local0) */                 #   9b: 6d01
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #   9d: 080f
            mov          a3, a2                                #   9f: 3d02
            l32i         a0, a0, 232 /* [[sdk_g_phyFuns]+0xe8] */ #   a1: 02203a
            movi         a2, 0 /* 0x00000000 */                #   a4: 0c02
            callx0       a0 /* [[sdk_g_phyFuns]+0xe8] */       #   a6: c00000
            l8ui         a0, sp, 0 /* [(local0)] */            #   a9: 020100
            l8ui         a2, sp, 1 /* [(local1)] */            #   ac: 220101
            slli         a0, a0, 24                            #   af: 800001
            slli         a2, a2, 24                            #   b2: 802201
            srai         a2, a2, 24                            #   b5: 202831
            srai         a0, a0, 24                            #   b8: 000831
            slli         a2, a2, 8                             #   bb: 802211
            or           a0, a0, a2                            #   be: 200020
            addx2        a2, a13, a14                          #   c1: e02d90
            s16i         a0, a2, 0                             #   c4: 025200
            addi         a13, a13, 1                           #   c7: 1bdd
            extui        a13, a13, 0, 8                        #   c9: d0d074
            bnei         a13, 4, .Lbr009                       #   cc: 664dc1
            mov          a3, sp /* (local0) */                 #   cf: 3d01
            movi         a2, sdk_tx_rf_ana_gain                #   d1: 21dcff
            movi         a4, 1 /* 0x00000001 */                #   d4: 0c14
            l16ui        a2, a2, 0 /* [sdk_tx_rf_ana_gain] */  #   d6: 221200
            call0        sdk_set_txdc_pbus                     #   d9: 01ddffc0
                                                               #   dd: 0000
            movi         a2, sdk_tx_rf_ana_gain                #   df: 21daff
            mov          a3, sp /* (local0) */                 #   e2: 3d01
            l16ui        a2, a2, 0 /* [sdk_tx_rf_ana_gain] */  #   e4: 221200
            call0        sdk_set_rfanagain_dc_reg              #   e7: 050000
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      #   ea: 080f
            l32i         a0, a0, 168 /* [[sdk_g_phyFuns]+0xa8] */ #   ec: 02202a
            movi         a13, 0x00080000                       #   ef: d1d7ff
            callx0       a0 /* [[sdk_g_phyFuns]+0xa8] */       #   f2: c00000
            l32i         a2, a12, 0 /* [arg0] */               #   f5: 280c
            or           a2, a2, a13                           #   f7: d02220
            s32i         a2, a12, 0 /* a2 -> [arg0] */         #   fa: 290c
.Lbr010:    l32i         a12, sp, 8 /* [(local3)] */           #   fc: c821
            l32i         a13, sp, 12 /* [(local4)] */          #   fe: d831
            l32i         a14, sp, 16 /* [(local5)] */          #  100: e841
            l32i         a15, sp, 20 /* [(local6)] */          #  102: f851
            l32i         a0, sp, 4 /* [(local2)] */            #  104: 0811
            addi         sp, sp, 32 /* (top of frame) */       #  106: 12c120
            ret                                                #  109: 0df0

            .literal_position                                  #  10c: ff00f0ff
                                                               #  110: 00020060
                                                               #  114: ff3f00f0
                                                               #  118: 00c0ffff

# Function @ .irom0.text+0x11c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_set_rfanagain_dc_reg
            .type        sdk_set_rfanagain_dc_reg, @function
sdk_set_rfanagain_dc_reg:
            slli         a9, a2, 8                             #  11c: 809211
            movi         a8, 0xfff000ff                        #  11f: 81fbff
            movi         a7, 0x60000200                        #  122: 71fbff
            movi         a11, 0xf0003fff                       #  125: b1fbff
            movi         a10, 0xffffc000                       #  128: a1fcff
            addi         sp, sp, -16 /* (local0) */            #  12b: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  12e: c911
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  130: e931
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  132: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  134: d921
            movi         a0, 0 /* 0x00000000 */                #  136: 0c00
            movi         a13, 24 /* 0x00000018 */              #  138: 1c8d
.Lbr011:    addx4        a5, a0, a7                            #  13a: 7050a0
            memw                                               #  13d: c02000
            l32i         a4, a5, 0x304                         #  140: 4225c1
            and          a4, a4, a8                            #  143: 804410
            or           a4, a4, a9                            #  146: 904420
            memw                                               #  149: c02000
            s32i         a4, a5, 0x304                         #  14c: 4265c1
            srli         a2, a0, 1                             #  14f: 002141
            addx4        a2, a2, a7                            #  152: 7022a0
            l8ui         a6, a3, 1 /* [arg1+0x1] */            #  155: 620301
            l8ui         a5, a3, 0 /* [arg1] */                #  158: 520300
            slli         a6, a6, 24                            #  15b: 806601
            slli         a5, a5, 24                            #  15e: 805501
            srai         a5, a5, 24                            #  161: 505831
            srai         a6, a6, 24                            #  164: 606831
            bbci         a0, 0, .Lbr012                        #  167: 07601d
            slli         a14, a5, 14                           #  16a: 20e511
            slli         a4, a6, 21                            #  16d: b04601
            memw                                               #  170: c02000
            l32i         a12, a2, 0x204                        #  173: c22281
            and          a12, a12, a11                         #  176: b0cc10
            or           a12, a12, a4                          #  179: 40cc20
            or           a12, a12, a14                         #  17c: e0cc20
            memw                                               #  17f: c02000
            s32i         a12, a2, 0x204                        #  182: c26281
            j            .Lbr013                               #  185: c60500
.Lbr012:    slli         a4, a6, 7                             #  188: 904611
            memw                                               #  18b: c02000
            l32i         a14, a2, 0x204                        #  18e: e22281
            and          a14, a14, a10                         #  191: a0ee10
            or           a14, a14, a4                          #  194: 40ee20
            or           a14, a14, a5                          #  197: 50ee20
            memw                                               #  19a: c02000
            s32i         a14, a2, 0x204                        #  19d: e26281
.Lbr013:    addi         a0, a0, 1                             #  1a0: 1b00
            extui        a0, a0, 0, 8                          #  1a2: 000074
            bne          a0, a13, .Lbr011                      #  1a5: d79091
            l32i         a12, sp, 4 /* [(local1)] */           #  1a8: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  1aa: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  1ac: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  1ae: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  1b0: 12c110
            ret                                                #  1b3: 0df0

            .literal_position                                  #  1b8: 00000000
                                                               #  1bc: 00000000
                                                               #  1c0: 00000000

# Function @ .irom0.text+0x1c4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_set_txdc_pbus
            .type        sdk_set_txdc_pbus, @function
sdk_set_txdc_pbus:
            extui        a2, a2, 0, 5                          #  1c4: 202044
            addi         sp, sp, -16 /* (local0) */            #  1c7: 12c1f0
            s32i         a4, sp, 0 /* arg2 -> [(local0)] */    #  1ca: 4901
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  1cc: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  1ce: 0911
            mov          a12, a3 /* arg1 */                    #  1d0: cd03
            call0        sdk_txbbgain2dcoindex                 #  1d2: 050000
            movi         a4, sdk_chip6_sleep_params            #  1d5: 41f8ff
            addx2        a2, a2, a4                            #  1d8: 402290
            l16ui        a3, a2, 4                             #  1db: 321202
            s8i          a3, a12, 0 /* a3 -> [arg1] */         #  1de: 324c00
            l16ui        a2, a2, 4                             #  1e1: 221202
            l32i         a0, sp, 0 /* [(local0)] */            #  1e4: 0801
            srli         a2, a2, 8                             #  1e6: 202841
            s8i          a2, a12, 1 /* a2 -> [arg1+0x1] */     #  1e9: 224c01
            beqz         a0, .Lbr014                           #  1ec: bc40
            movi         a2, 0 /* 0x00000000 */                #  1ee: 0c02
            movi         a3, 2 /* 0x00000002 */                #  1f0: 0c23
            l8ui         a4, a12, 0 /* [arg1] */               #  1f2: 420c00
            movi         a0, sdk_g_phyFuns                     #  1f5: 01f1ff
            slli         a4, a4, 24                            #  1f8: 804401
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  1fb: 0800
            srai         a4, a4, 24                            #  1fd: 404831
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  200: 02202b
            extui        a4, a4, 0, 16                         #  203: 4040f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  206: c00000
            movi         a2, 1 /* 0x00000001 */                #  209: 0c12
            movi         a3, 2 /* 0x00000002 */                #  20b: 0c23
            l8ui         a4, a12, 1 /* [arg1+0x1] */           #  20d: 420c01
            movi         a0, sdk_g_phyFuns                     #  210: 01ecff
            slli         a4, a4, 24                            #  213: 804401
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  216: 0800
            srai         a4, a4, 24                            #  218: 404831
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  21b: 02202b
            extui        a4, a4, 0, 16                         #  21e: 4040f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  221: c00000
.Lbr014:    l32i         a12, sp, 8 /* [(local2)] */           #  224: c821
            l32i         a0, sp, 4 /* [(local1)] */            #  226: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  228: 12c110
            ret                                                #  22b: 0df0

            .balign      4
# Function @ .irom0.text+0x230
            .balign      4
            .global      sdk_get_rf_gain_qdb
            .type        sdk_get_rf_gain_qdb, @function
sdk_get_rf_gain_qdb:
            beqi         a2, 1, .Lbr015                        #  230: 261214
            beqi         a2, 2, .Lbr016                        #  233: 262215
            beqi         a2, 3, .Lbr017                        #  236: 263216
            beqi         a2, 4, .Lbr018                        #  239: 264217
            addi         a4, a2, -5 /* arg0-0x5 */             #  23c: 42c2fb
            movi         a3, 6 /* 0x00000006 */                #  23f: 0c63
            movi         a2, 5 /* 0x00000005 */                #  241: 0c52
            moveqz       a2, a3, a4                            #  243: 402383
            ret                                                #  246: 0df0
.Lbr015:    movi         a2, 14 /* 0x0000000e */               #  248: 0ce2
            ret           /* 0x0000000e */                     #  24a: 0df0
.Lbr016:    movi         a2, 10 /* 0x0000000a */               #  24c: 0ca2
            ret           /* 0x0000000a */                     #  24e: 0df0
.Lbr017:    movi         a2, 8 /* 0x00000008 */                #  250: 0c82
            ret           /* 0x00000008 */                     #  252: 0df0
.Lbr018:    movi         a2, 7 /* 0x00000007 */                #  254: 0c72
            ret           /* 0x00000007 */                     #  256: 0df0

# Function @ .irom0.text+0x258
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
            .global      sdk_correct_rf_ana_gain
            .type        sdk_correct_rf_ana_gain, @function
sdk_correct_rf_ana_gain:
            addi         sp, sp, -32 /* (local0) */            #  258: 12c1e0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  25b: 0901
            s32i         a3, sp, 20 /* arg1 -> [(local5)] */   #  25d: 3951
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  25f: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  261: d921
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  263: f941
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  265: e931
            mov          a15, a3 /* arg1 */                    #  267: fd03
            mov          a14, a2 /* arg0 */                    #  269: ed02
            l16ui        a13, a3, 0 /* [arg1] */               #  26b: d21300
            l8ui         a2, a2, 0 /* [arg0] */                #  26e: 220200
            extui        a12, a13, 9, 3                        #  271: d0c924
            extui        a3, a13, 0, 4                         #  274: d03034
            slli         a0, a2, 24                            #  277: 800201
            srai         a0, a0, 24                            #  27a: 000831
            extui        a13, a13, 4, 1                        #  27d: d0d404
            addx2        a13, a13, a13                         #  280: d0dd90
            addx2        a13, a13, a3                          #  283: 30dd90
            extui        a13, a13, 0, 8                        #  286: d0d074
            blti         a0, 1, .Lbr025                        #  289: a6107c
            bnei         a13, 4, .Lbr019                       #  28c: 664d10
            addi         a0, a0, -8                            #  28f: 02c0f8
            addi         a13, a13, 2                           #  292: 2bdd
            extui        a13, a13, 0, 8                        #  294: d0d074
            s8i          a0, a14, 0 /* a0 -> [arg0] */         #  297: 024e00
            slli         a0, a0, 24                            #  29a: 800001
            srai         a0, a0, 24                            #  29d: 000831
.Lbr019:    blti         a0, 1, .Lbr023                        #  2a0: a6103e
            bgeui        a12, 7, .Lbr021                       #  2a3: f67c1e
.Lbr020:    mov          a2, a12                               #  2a6: 2d0c
            call0        sdk_get_rf_gain_qdb                   #  2a8: 050000
            l8ui         a0, a14, 0 /* [arg0] */               #  2ab: 020e00
            addi         a12, a12, 1                           #  2ae: 1bcc
            extui        a12, a12, 0, 8                        #  2b0: c0c074
            sub          a0, a0, a2                            #  2b3: 2000c0
            s8i          a0, a14, 0 /* a0 -> [arg0] */         #  2b6: 024e00
            slli         a0, a0, 24                            #  2b9: 800001
            srai         a0, a0, 24                            #  2bc: 000831
            blti         a0, 1, .Lbr023                        #  2bf: a6101f
            bnei         a12, 7, .Lbr020                       #  2c2: 667ce0
.Lbr021:    blti         a0, 1, .Lbr023                        #  2c5: a61019
            bgeui        a13, 10, .Lbr023                      #  2c8: f69d16
.Lbr022:    addi         a0, a0, -8                            #  2cb: 02c0f8
            addi         a13, a13, 2                           #  2ce: 2bdd
            extui        a13, a13, 0, 8                        #  2d0: d0d074
            s8i          a0, a14, 0 /* a0 -> [arg0] */         #  2d3: 024e00
            slli         a0, a0, 24                            #  2d6: 800001
            srai         a0, a0, 24                            #  2d9: 000831
            blti         a0, 1, .Lbr023                        #  2dc: a61002
            bltui        a13, 10, .Lbr022                      #  2df: b69de8
.Lbr023:    slli         a14, a12, 4                           #  2e2: c0ec11
            l32i         a0, sp, 0 /* [(local0)] */            #  2e5: 0801
            l32i         a12, sp, 4 /* [(local1)] */           #  2e7: c811
            addi         a14, a14, 15                          #  2e9: fbee
            extui        a14, a14, 0, 8                        #  2eb: e0e074
            slli         a14, a14, 5                           #  2ee: b0ee11
            bltui        a13, 6, .Lbr024                       #  2f1: b66d04
            addi         a13, a13, 10                          #  2f4: abdd
            extui        a13, a13, 0, 8                        #  2f6: d0d074
.Lbr024:    add          a14, a13, a14                         #  2f9: eaed
            s16i         a14, a15, 0 /* a14 -> [arg1] */       #  2fb: e25f00
            l32i         a13, sp, 8 /* [(local2)] */           #  2fe: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  300: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  302: f841
            addi         sp, sp, 32 /* (top of frame) */       #  304: 12c120
            ret                                                #  307: 0df0
.Lbr025:    bbci         a2, 7, .Lbr023                        #  309: 7762d5
            bltui        a13, 7, .Lbr027                       #  30c: b67d16
.Lbr026:    addi         a13, a13, -2                          #  30f: d2cdfe
            addi         a2, a0, 8                             #  312: 8b20
            s8i          a2, a14, 0 /* a2 -> [arg0] */         #  314: 224e00
            extui        a13, a13, 0, 8                        #  317: d0d074
            slli         a0, a2, 24                            #  31a: 800201
            srai         a0, a0, 24                            #  31d: 000831
            bbci         a2, 7, .Lbr027                        #  320: 776202
            bgeui        a13, 7, .Lbr026                       #  323: f67de8
.Lbr027:    bgez         a0, .Lbr023                           #  326: d680fb
            bltui        a12, 2, .Lbr029                       #  329: b62c1d
.Lbr028:    addi         a12, a12, -1                          #  32c: 0bcc
            extui        a12, a12, 0, 8                        #  32e: c0c074
            mov          a2, a12                               #  331: 2d0c
            call0        sdk_get_rf_gain_qdb                   #  333: 050000
            l8ui         a3, a14, 0 /* [arg0] */               #  336: 320e00
            add          a2, a3, a2                            #  339: 2a23
            s8i          a2, a14, 0 /* a2 -> [arg0] */         #  33b: 224e00
            slli         a0, a2, 24                            #  33e: 800201
            srai         a0, a0, 24                            #  341: 000831
            bbci         a2, 7, .Lbr029                        #  344: 776202
            bnei         a12, 1, .Lbr028                       #  347: 661ce1
.Lbr029:    bgez         a0, .Lbr023                           #  34a: d640f9
            bnei         a13, 6, .Lbr023                       #  34d: 666d91
            addi         a13, a13, -2                          #  350: d2cdfe
            addi         a2, a0, 8                             #  353: 8b20
            s8i          a2, a14, 0 /* a2 -> [arg0] */         #  355: 224e00
            extui        a13, a13, 0, 8                        #  358: d0d074
            j            .Lbr023                               #  35b: c6e0ff

            .literal_position                                  #  360: 00000000
                                                               #  364: 00000000

# Function @ .irom0.text+0x368
# Local variables/stack:
#     (local0):  hword     @ -0x1e
#     (local1):  hword     @ -0x1c
#     (local2):  hword     @ -0x1a
#     (local3):  hword     @ -0x18
#     (local4):  hword     @ -0x16
#     (local5):  hword     @ -0x14
#     (local6):  hword     @ -0x12
#     (local7):  word      @ -0x10
#     (local8):  word      @ -0xc
#     (local9):  word      @ -0x8
#     (local10): word      @ -0x4
            .balign      4
            .global      sdk_get_sar_dout
            .type        sdk_get_sar_dout, @function
sdk_get_sar_dout:
            addi         sp, sp, -32 /* (FP)-0x20 */           #  368: 12c1e0
            s32i         a2, sp, 16 /* arg0 -> [(local7)] */   #  36b: 2941
            s32i         a0, sp, 28 /* a0 -> [(local10)] */    #  36d: 0971
            mov          a2, sp /* (FP)-0x20 */                #  36f: 2d01
            call0        sdk_read_sar_dout                     #  371: 050000
            movi         a3, 3 /* 0x00000003 */                #  374: 0c33
            l16ui        a5, sp, 6 /* [(local2)] */            #  376: 521103
            l16ui        a11, sp, 4 /* [(local1)] */           #  379: b21102
            l16ui        a8, sp, 2 /* [(local0)] */            #  37c: 821101
            l16ui        a10, sp, 14 /* [(local6)] */          #  37f: a21107
            l16ui        a7, sp, 12 /* [(local5)] */           #  382: 721106
            l16ui        a9, sp, 10 /* [(local4)] */           #  385: 921105
            l16ui        a6, sp, 8 /* [(local3)] */            #  388: 621104
            movi         a0, sdk_g_phyFuns                     #  38b: 01f5ff
            movi         a4, 0 /* 0x00000000 */                #  38e: 0c04
            mov          a2, a4 /* 0x00000000 */               #  390: 2d04
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  392: 0800
            add          a6, a6, a9                            #  394: 9a66
            add          a7, a7, a10                           #  396: aa77
            add          a8, a8, a11                           #  398: ba88
            l32i         a0, a0, 56 /* [[sdk_g_phyFuns]+0x38] */ #  39a: 08e0
            add          a5, a5, a8                            #  39c: 8a55
            addx2        a7, a7, a7                            #  39e: 707790
            addx2        a6, a6, a6                            #  3a1: 606690
            sub          a6, a6, a7                            #  3a4: 7066c0
            subx2        a5, a5, a7                            #  3a7: 7055d0
            slli         a5, a5, 16                            #  3aa: 005511
            slli         a6, a6, 16                            #  3ad: 006611
            srai         a6, a6, 16                            #  3b0: 606031
            srai         a5, a5, 16                            #  3b3: 505031
            movgez       a2, a5, a5                            #  3b6: 5025b3
            movgez       a4, a6, a6                            #  3b9: 6046b3
            slli         a4, a4, 16                            #  3bc: 004411
            slli         a2, a2, 16                            #  3bf: 002211
            srai         a2, a2, 16                            #  3c2: 202031
            srai         a4, a4, 16                            #  3c5: 404031
            s32i         a4, sp, 20 /* a4 -> [(local8)] */     #  3c8: 4951
            callx0       a0 /* [[sdk_g_phyFuns]+0x38] */       #  3ca: c00000
            movi         a0, sdk_g_phyFuns                     #  3cd: 01e5ff
            movi         a3, 3 /* 0x00000003 */                #  3d0: 0c33
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  3d2: 0800
            s32i         a2, sp, 24 /* a2 -> [(local9)] */     #  3d4: 2961
            l32i         a0, a0, 56 /* [[sdk_g_phyFuns]+0x38] */ #  3d6: 08e0
            l32i         a2, sp, 20 /* [(local8)] */           #  3d8: 2851
            callx0       a0 /* [[sdk_g_phyFuns]+0x38] */       #  3da: c00000
            l32i         a3, sp, 24 /* [(local9)] */           #  3dd: 3861
            l32i         a0, sp, 28 /* [(local10)] */          #  3df: 0871
            sub          a3, a3, a2                            #  3e1: 2033c0
            l32i         a2, sp, 16 /* [(local7)] */           #  3e4: 2841
            addi         sp, sp, 32 /* (top of frame) */       #  3e6: 12c120
            add          a2, a2, a3                            #  3e9: 3a22
            slli         a2, a2, 16                            #  3eb: 002211
            srai         a2, a2, 16                            #  3ee: 202031
            ret                                                #  3f1: 0df0

            .literal_position                                  #  3f4: 00000000
                                                               #  3f8: 00000000
                                                               #  3fc: f00b0000
                                                               #  400: 00000000
                                                               #  404: 00000000
                                                               #  408: 00000000
                                                               #  40c: 00000000
                                                               #  410: 00000000
                                                               #  414: 00000000

# Function @ .irom0.text+0x418
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word[3]   @ -0x1c
#     (local2):  byte[2]   @ -0xe
#     (local3):  word      @ -0xc
#     (local4):  word[2]   @ -0x8
            .balign      4
            .global      sdk_cal_rf_ana_gain
            .type        sdk_cal_rf_ana_gain, @function
sdk_cal_rf_ana_gain:
            movi         a3, 1 /* 0x00000001 */                #  418: 0c13
            movi         a4, 95 /* 0x0000005f */               #  41a: 5cf4
            movi         a2, 0x00000bf0                        #  41c: 21f8ff
            addi         sp, sp, -32 /* (local0) */            #  41f: 12c1e0
            s32i         a12, sp, 24 /* a12 -> [(local4)] */   #  422: c961
            s32i         a0, sp, 20 /* a0 -> [(local3)] */     #  424: 0951
            movi         a12, sdk_tx_rf_ana_gain               #  426: c1f4ff
            movi         a0, sdk_g_phyFuns                     #  429: 01f2ff
            s16i         a2, a12, 0 /* 0x0bf0 -> [sdk_tx_rf_ana_gain] */ #  42c: 225c00
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  42f: 0800
            s16i         a2, a12, 0 /* 0x0bf0 -> [sdk_tx_rf_ana_gain] */ #  431: 225c00
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  434: 02202b
            movi         a2, 7 /* 0x00000007 */                #  437: 0c72
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  439: c00000
            movi         a2, 0 /* 0x00000000 */                #  43c: 0c02
            movi         a0, sdk_g_phyFuns                     #  43e: 01f0ff
            movi         a3, 1 /* 0x00000001 */                #  441: 0c13
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  443: 0800
            l16ui        a4, a12, 0 /* [sdk_tx_rf_ana_gain] */ #  445: 421c00
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  448: 02202b
            extui        a4, a4, 0, 5                          #  44b: 404044
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  44e: c00000
            l16ui        a2, a12, 0 /* [sdk_tx_rf_ana_gain] */ #  451: 221c00
            addi         a3, sp, 16 /* (FP)-0x10 */            #  454: 32c110
            movi         a4, 1 /* 0x00000001 */                #  457: 0c14
            call0        sdk_set_txdc_pbus                     #  459: 050000
            movi         a2, 64 /* 0x00000040 */               #  45c: 4c02
            movi         a3, sdk_chip6_sleep_params+0x6d       #  45e: 31e9ff
            movi         a4, 1 /* 0x00000001 */                #  461: 0c14
            movi         a5, 31 /* 0x0000001f */               #  463: 1cf5
            addi         a7, sp, 18 /* (local2) */             #  465: 72c112
            movi         a8, sdk_pwctrl_debug                  #  468: 81e8ff
            l16ui        a6, a12, 0 /* [sdk_tx_rf_ana_gain] */ #  46b: 621c00
            movi         a9, 312 /* 0x00000138 */              #  46e: 92a138
            extui        a6, a6, 0, 5                          #  471: 606044
            s32i         a9, sp, 0 /* 0x00000138 -> [(local0)] */ #  474: 9901
            l8ui         a8, a8, 0 /* [sdk_pwctrl_debug] */    #  476: 820800
            s32i         a8, sp, 4 /* [sdk_pwctrl_debug] -> [(local1)] */ #  479: 8911
            call0        sdk_ram_rfcal_pwrctrl                 #  47b: 050000
            l8ui         a0, sp, 18 /* [(local2)] */           #  47e: 020112
            movi         a7, 36 /* 0x00000024 */               #  481: 2c47
            slli         a0, a0, 24                            #  483: 800001
            srai         a0, a0, 24                            #  486: 000831
            blt          a7, a0, .Lbr030                       #  489: 072702
            bgei         a0, 12, .Lbr031                       #  48c: e6a039
.Lbr030:    movi         a2, 24 /* 0x00000018 */               #  48f: 1c82
            mov          a3, a12 /* sdk_tx_rf_ana_gain */      #  491: 3d0c
            sub          a2, a2, a0                            #  493: 0022c0
            s8i          a2, sp, 18 /* a2 -> [(local2)] */     #  496: 224112
            addi         a2, sp, 18 /* (local2) */             #  499: 22c112
            call0        sdk_correct_rf_ana_gain               #  49c: 050000
            movi         a2, 7 /* 0x00000007 */                #  49f: 0c72
            movi         a0, sdk_g_phyFuns                     #  4a1: 01daff
            movi         a3, 1 /* 0x00000001 */                #  4a4: 0c13
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  4a6: 0800
            l16ui        a4, a12, 0 /* [sdk_tx_rf_ana_gain] */ #  4a8: 421c00
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  4ab: 02202b
            srli         a4, a4, 5                             #  4ae: 404541
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  4b1: c00000
            movi         a2, 0 /* 0x00000000 */                #  4b4: 0c02
            movi         a0, sdk_g_phyFuns                     #  4b6: 01d6ff
            movi         a3, 1 /* 0x00000001 */                #  4b9: 0c13
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  4bb: 0800
            l16ui        a4, a12, 0 /* [sdk_tx_rf_ana_gain] */ #  4bd: 421c00
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ #  4c0: 02202b
            extui        a4, a4, 0, 5                          #  4c3: 404044
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       #  4c6: c00000
.Lbr031:    l16ui        a2, a12, 0 /* [sdk_tx_rf_ana_gain] */ #  4c9: 221c00
            addi         a3, sp, 16 /* (FP)-0x10 */            #  4cc: 32c110
            movi         a4, 1 /* 0x00000001 */                #  4cf: 0c14
            call0        sdk_set_txdc_pbus                     #  4d1: 050000
            l16ui        a2, a12, 0 /* [sdk_tx_rf_ana_gain] */ #  4d4: 221c00
            addi         a3, sp, 16 /* (FP)-0x10 */            #  4d7: 32c110
            call0        sdk_set_rfanagain_dc_reg              #  4da: 050000
            l32i         a0, sp, 20 /* [(local3)] */           #  4dd: 0851
            l16ui        a2, a12, 0 /* [sdk_tx_rf_ana_gain] */ #  4df: 221c00
            movi         a3, sdk_chip6_sleep_params            #  4e2: 31ccff
            l32i         a12, sp, 24 /* [(local4)] */          #  4e5: c861
            s16i         a2, a3, 118 /* [sdk_tx_rf_ana_gain] -> [sdk_chip6_sleep_params+0x76] */ #  4e7: 22533b
            addi         sp, sp, 32 /* (top of frame) */       #  4ea: 12c120
            ret           /* [sdk_tx_rf_ana_gain] */           #  4ed: 0df0

            .literal_position                                  #  4f0: 00000000

# Function @ .irom0.text+0x4f4
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word[2]   @ -0x18
#     (local3):  word      @ -0x10
#     (local4):  word      @ -0xc
#     (local5):  word      @ -0x8
#     (local6):  word      @ -0x4
            .balign      4
            .global      sdk_meas_tone_pwr_db
            .type        sdk_meas_tone_pwr_db, @function
sdk_meas_tone_pwr_db:
            movi         a5, 0 /* 0x00000000 */                #  4f4: 0c05
            movi         a6, 0 /* 0x00000000 */                #  4f6: 0c06
            movi         a7, 0 /* 0x00000000 */                #  4f8: 0c07
            extui        a4, a2, 0, 8                          #  4fa: 204074
            movi         a3, 0 /* 0x00000000 */                #  4fd: 0c03
            addi         sp, sp, -32 /* (local0) */            #  4ff: 12c1e0
            s32i         a12, sp, 20 /* a12 -> [(local4)] */   #  502: c951
            s32i         a13, sp, 24 /* a13 -> [(local5)] */   #  504: d961
            s32i         a0, sp, 16 /* a0 -> [(local3)] */     #  506: 0941
            s32i         a14, sp, 28 /* a14 -> [(local6)] */   #  508: e971
            s32i         a3, sp, 8 /* 0x00000000 -> [(local2)] */ #  50a: 3921
            s32i         a3, sp, 4 /* 0x00000000 -> [(local1)] */ #  50c: 3911
            movi         a14, sdk_g_phyFuns                    #  50e: e1f8ff
            s32i         a3, sp, 0 /* 0x00000000 -> [(local0)] */ #  511: 3901
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  513: 080e
            movi         a2, 1 /* 0x00000001 */                #  515: 0c12
            l32i         a0, a0, 104 /* [[sdk_g_phyFuns]+0x68] */ #  517: 02201a
            movi         a3, 64 /* 0x00000040 */               #  51a: 4c03
            callx0       a0 /* [[sdk_g_phyFuns]+0x68] */       #  51c: c00000
            movi         a13, 0 /* 0x00000000 */               #  51f: 0c0d
            movi         a12, 0 /* 0x00000000 */               #  521: 0c0c
.Lbr032:    l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  523: 080e
            l32i         a0, a0, 44 /* [[sdk_g_phyFuns]+0x2c] */ #  525: 08b0
            movi         a2, 312 /* 0x00000138 */              #  527: 22a138
            callx0       a0 /* [[sdk_g_phyFuns]+0x2c] */       #  52a: c00000
            addi         a13, a13, 1                           #  52d: 1bdd
            add          a12, a2, a12                          #  52f: cac2
            slli         a12, a12, 16                          #  531: 00cc11
            srai         a12, a12, 16                          #  534: c0c031
            bnei         a13, 4, .Lbr032                       #  537: 664de8
            l32i         a0, a14, 0 /* [sdk_g_phyFuns] */      #  53a: 080e
            l32i         a0, a0, 108 /* [[sdk_g_phyFuns]+0x6c] */ #  53c: 02201b
            movi         a2, 1 /* 0x00000001 */                #  53f: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x6c] */       #  541: c00000
            l32i         a0, sp, 16 /* [(local3)] */           #  544: 0841
            l32i         a13, sp, 24 /* [(local5)] */          #  546: d861
            addi         a3, a12, 4                            #  548: 4b3c
            addi         a2, a12, 11                           #  54a: bb2c
            l32i         a14, sp, 28 /* [(local6)] */          #  54c: e871
            l32i         a12, sp, 20 /* [(local4)] */          #  54e: c851
            movgez       a2, a3, a3                            #  550: 3023b3
            srai         a2, a2, 3                             #  553: 202321
            addi         sp, sp, 32 /* (top of frame) */       #  556: 12c120
            slli         a2, a2, 16                            #  559: 002211
            srai         a2, a2, 16                            #  55c: 202031
            ret                                                #  55f: 0df0

            .literal_position                                  #  564: 00000000
                                                               #  568: 00000000

# Function @ .irom0.text+0x56c
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word[3]   @ -0x3c
#     (local2):  byte[4]   @ -0x30
#     (local3):  word      @ -0x2c
#     (local4):  word      @ -0x28
#     (local5):  word      @ -0x24
#     (local6):  word      @ -0x20
#     (local7):  word      @ -0x1c
#     (local8):  word      @ -0x18
#     (local9):  word      @ -0x14
#     (local10): word      @ -0x10
#     (local11): word      @ -0xc
#     (local12): word      @ -0x8
#     (local13): word      @ -0x4
            .balign      4
            .global      sdk_tx_pwr_backoff
            .type        sdk_tx_pwr_backoff, @function
sdk_tx_pwr_backoff:
            movi         a4, 1 /* 0x00000001 */                #  56c: 0c14
            movi         a5, 31 /* 0x0000001f */               #  56e: 1cf5
            movi         a8, 312 /* 0x00000138 */              #  570: 82a138
            movi         a6, sdk_tx_rf_ana_gain                #  573: 61fdff
            addi         sp, sp, -64 /* (local0) */            #  576: 12c1c0
            s32i         a12, sp, 24 /* a12 -> [(local4)] */   #  579: c961
            s32i         a13, sp, 28 /* a13 -> [(local5)] */   #  57b: d971
            s32i         a14, sp, 32 /* a14 -> [(local6)] */   #  57d: e981
            s32i         a15, sp, 36 /* a15 -> [(local7)] */   #  57f: f991
            addi         a7, sp, 16 /* (local2) */             #  581: 72c110
            s32i         a2, sp, 48 /* arg0 -> [(local10)] */  #  584: 29c1
            s32i         a0, sp, 20 /* a0 -> [(local3)] */     #  586: 0951
            movi         a2, 64 /* 0x00000040 */               #  588: 4c02
            l32i         a3, sp, 48 /* [(local10)] */          #  58a: 38c1
            movi         a0, sdk_pwctrl_debug                  #  58c: 01f6ff
            l16ui        a6, a6, 0 /* [sdk_tx_rf_ana_gain] */  #  58f: 621600
            s32i         a8, sp, 0 /* 0x00000138 -> [(local0)] */ #  592: 8901
            extui        a6, a6, 0, 5                          #  594: 606044
            l8ui         a0, a0, 0 /* [sdk_pwctrl_debug] */    #  597: 020000
            s32i         a0, sp, 4 /* [sdk_pwctrl_debug] -> [(local1)] */ #  59a: 0911
            call0        sdk_ram_rfcal_pwrctrl                 #  59c: 050000
            movi         a14, 0 /* 0x00000000 */               #  59f: 0c0e
            movi         a0, 0 /* 0x00000000 */                #  5a1: 0c00
            movi         a15, 111 /* 0x0000006f */             #  5a3: f2a06f
            l8ui         a7, sp, 16 /* [(local2)] */           #  5a6: 720110
            l32i         a6, sp, 48 /* [(local10)] */          #  5a9: 68c1
            movi         a10, 0 /* 0x00000000 */               #  5ab: 0c0a
            s32i         a10, sp, 52 /* 0x00000000 -> [(local11)] */ #  5ad: a9d1
            l8ui         a8, a6, 5 /* [[(local10)]+0x5] */     #  5af: 820605
            slli         a7, a7, 24                            #  5b2: 807701
            l8ui         a6, a6, 0 /* [[(local10)]] */         #  5b5: 620600
            srai         a7, a7, 24                            #  5b8: 707831
            addi         a7, a7, 31                            #  5bb: 72c71f
            s8i          a7, sp, 16 /* a7 -> [(local2)] */     #  5be: 724110
            sub          a6, a6, a8                            #  5c1: 8066c0
            slli         a6, a6, 16                            #  5c4: 006611
            srai         a6, a6, 16                            #  5c7: 606031
            slli         a7, a6, 1                             #  5ca: f07611
            addi         a8, a7, -7                            #  5cd: 82c7f9
            s32i         a8, sp, 44 /* a8 -> [(local9)] */     #  5d0: 89b1
            addi         a7, a7, -8                            #  5d2: 72c7f8
            slli         a7, a7, 16                            #  5d5: 007711
            srai         a7, a7, 16                            #  5d8: 707031
            s32i         a7, sp, 40 /* a7 -> [(local8)] */     #  5db: 79a1
.Lbr033:    l8ui         a3, sp, 16 /* [(local2)] */           #  5dd: 320110
            mov          a2, a15 /* 0x0000006f */              #  5e0: 2d0f
            slli         a3, a3, 24                            #  5e2: 803301
            srai         a3, a3, 24                            #  5e5: 303831
            add          a0, a3, a0                            #  5e8: 0a03
            s8i          a0, sp, 16 /* a0 -> [(local2)] */     #  5ea: 024110
            add          a12, a6, a0                           #  5ed: 0ac6
            slli         a0, a0, 24                            #  5ef: 800001
            srai         a0, a0, 24                            #  5f2: 000831
            blt          a15, a0, .Lbr034                      #  5f5: 072f01
            mov          a2, a0                                #  5f8: 2d00
.Lbr034:    s8i          a2, sp, 16 /* a2 -> [(local2)] */     #  5fa: 224110
            s32i         a6, sp, 60 /* a6 -> [(local13)] */    #  5fd: 69f1
            call0        sdk_meas_tone_pwr_db                  #  5ff: 050000
            slli         a4, a12, 24                           #  602: 804c01
            mov          a13, a2                               #  605: dd02
            movi         a12, 1 /* 0x00000001 */               #  607: 0c1c
            srai         a4, a4, 24                            #  609: 404831
            s32i         a4, sp, 56 /* a4 -> [(local12)] */    #  60c: 49e1
            blt          a15, a4, .Lbr035                      #  60e: 472f01
            movi         a12, 0 /* 0x00000000 */               #  611: 0c0c
.Lbr035:    l32i         a2, sp, 56 /* [(local12)] */          #  613: 28e1
            movnez       a2, a15, a12                          #  615: c02f93
            call0        sdk_meas_tone_pwr_db                  #  618: 050000
            l32i         a5, sp, 44 /* [(local9)] */           #  61b: 58b1
            sub          a7, a13, a2                           #  61d: 207dc0
            slli         a0, a7, 16                            #  620: 000711
            srai         a0, a0, 16                            #  623: 000031
            blt          a0, a5, .Lbr036                       #  626: 572005
            movi         a3, 168 /* 0x000000a8 */              #  629: 32a0a8
            bge          a3, a13, .Lbr039                      #  62c: d7a351
.Lbr036:    beqz         a14, .Lbr037                          #  62f: 8cee
            l32i         a4, sp, 52 /* [(local11)] */          #  631: 48d1
            l32i         a5, sp, 40 /* [(local8)] */           #  633: 58a1
            blt          a4, a0, .Lbr037                       #  635: 072408
            blt          a0, a5, .Lbr037                       #  638: 572005
            movi         a6, 168 /* 0x000000a8 */              #  63b: 62a0a8
            bge          a6, a13, .Lbr039                      #  63e: d7a63f
.Lbr037:    movi         a8, 80 /* 0x00000050 */               #  641: 5c08
            blt          a2, a8, .Lbr039                       #  643: 87223a
            l32i         a9, sp, 56 /* [(local12)] */          #  646: 98e1
            l32i         a6, sp, 60 /* [(local13)] */          #  648: 68f1
            movnez       a9, a15, a12                          #  64a: c09f93
            beq          a9, a15, .Lbr039                      #  64d: f71930
            addi         a14, a14, 1                           #  650: 1bee
            slli         a2, a7, 16                            #  652: 002711
            movi         a10, 2 /* 0x00000002 */               #  655: 0c2a
            addi         a9, a0, 1                             #  657: 1b90
            addi         a8, a0, 2                             #  659: 2b80
            movgez       a8, a9, a9                            #  65b: 9089b3
            mov          a0, a10 /* 0x00000002 */              #  65e: 0d0a
            srai         a8, a8, 1                             #  660: 808121
            sub          a8, a6, a8                            #  663: 8086c0
            addi         a8, a8, -1                            #  666: 0b88
            slli         a8, a8, 24                            #  668: 808801
            srai         a8, a8, 24                            #  66b: 808831
            blti         a8, 2, .Lbr038                        #  66e: a62801
            mov          a0, a8                                #  671: 0d08
.Lbr038:    extui        a14, a14, 0, 8                        #  673: e0e074
            srai         a2, a2, 16                            #  676: 202031
            s32i         a2, sp, 52 /* a2 -> [(local11)] */    #  679: 29d1
            addi         a10, a14, -10                         #  67b: a2cef6
            bnez         a10, .Lbr033                          #  67e: 56baf5
.Lbr039:    l32i         a0, sp, 48 /* [(local10)] */          #  681: 08c1
            l32i         a12, sp, 24 /* [(local4)] */          #  683: c861
            l8ui         a0, a0, 0 /* [[(local10)]] */         #  685: 020000
            l32i         a15, sp, 36 /* [(local7)] */          #  688: f891
            slli         a3, a0, 1                             #  68a: f03011
            bge          a13, a3, .Lbr041                      #  68d: 37ad1f
            beqz         a14, .Lbr041                          #  690: 9cce
            subx2        a2, a0, a13                           #  692: d020d0
            addi         a3, a2, 1                             #  695: 1b32
            addi         a2, a2, 2                             #  697: 2b22
            movgez       a2, a3, a3                            #  699: 3023b3
            srai         a2, a2, 1                             #  69c: 202121
            slli         a2, a2, 16                            #  69f: 002211
            srai         a2, a2, 16                            #  6a2: 202031
.Lbr040:    l32i         a13, sp, 28 /* [(local5)] */          #  6a5: d871
            l32i         a14, sp, 32 /* [(local6)] */          #  6a7: e881
            l32i         a0, sp, 20 /* [(local3)] */           #  6a9: 0851
            addi         sp, sp, 64 /* (top of frame) */       #  6ab: 12c140
            ret                                                #  6ae: 0df0
.Lbr041:    movi         a2, 0 /* 0x00000000 */                #  6b0: 0c02
            j            .Lbr040                               #  6b2: c6fbff

            .literal_position                                  #  6b8: 00000000
                                                               #  6bc: 00000000

# Function @ .irom0.text+0x6c0
            .balign      4
            .global      sdk_get_fcc_1m2m_pwr_offset
            .type        sdk_get_fcc_1m2m_pwr_offset, @function
sdk_get_fcc_1m2m_pwr_offset:
            beqz         a2, .Lbr042                           #  6c0: 8ca2
            beqi         a3, 2, .Lbr044                        #  6c2: 26230c
            beqi         a3, 3, .Lbr044                        #  6c5: 263309
            beqi         a3, 6, .Lbr044                        #  6c8: 266306
            beqi         a3, 7, .Lbr044                        #  6cb: 267303
.Lbr042:    movi         a2, 0 /* 0x00000000 */                #  6ce: 0c02
.Lbr043:    ret                                                #  6d0: 0df0
.Lbr044:    movi         a2, sdk_chip6_phy_init_ctrl           #  6d2: 21f9ff
            movi         a4, sdk_chip6_sleep_params            #  6d5: 41f9ff
            l8ui         a3, a2, 78 /* [sdk_chip6_phy_init_ctrl+0x4e] */ #  6d8: 32024e
            l8ui         a4, a4, 78 /* [sdk_chip6_sleep_params+0x4e] */ #  6db: 42044e
            l8ui         a2, a2, 77 /* [sdk_chip6_phy_init_ctrl+0x4d] */ #  6de: 22024d
            slli         a4, a4, 24                            #  6e1: 804401
            slli         a3, a3, 24                            #  6e4: 803301
            srai         a3, a3, 24                            #  6e7: 303831
            srai         a4, a4, 24                            #  6ea: 404831
            slli         a2, a2, 24                            #  6ed: 802201
            srai         a2, a2, 24                            #  6f0: 202831
            bgei         a4, 7, .Lbr043                        #  6f3: e674d9
            mov          a2, a3                                #  6f6: 2d03
            ret                                                #  6f8: 0df0

            .literal_position                                  #  6fc: 00020060

# Function @ .irom0.text+0x700
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
            .global      sdk_ram_set_txbb_atten
            .type        sdk_ram_set_txbb_atten, @function
sdk_ram_set_txbb_atten:
            addi         sp, sp, -48 /* (local0) */            #  700: 12c1d0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  703: 0911
            s32i         a3, sp, 24 /* arg1 -> [(local6)] */   #  705: 3961
            s32i         a6, sp, 28 /* arg4 -> [(local7)] */   #  707: 6971
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  709: 2901
            s32i         a4, sp, 32 /* arg2 -> [(local8)] */   #  70b: 4981
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   #  70d: f951
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  70f: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  711: c921
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  713: e941
            movi         a12, 0 /* 0x00000000 */               #  715: 0c0c
            movi         a14, 24 /* 0x00000018 */              #  717: 1c8e
            movi         a13, 0x60000200                       #  719: d1f8ff
            l32i         a15, sp, 32 /* [(local8)] */          #  71c: f881
.Lbr045:    mov          a2, a12                               #  71e: 2d0c
            l32i         a3, sp, 0 /* [(local0)] */            #  720: 3801
            call0        sdk_get_target_power_offset           #  722: 050000
            add          a0, a2, a15                           #  725: fa02
            l8ui         a0, a0, 0                             #  727: 020000
            l32i         a4, sp, 24 /* [(local6)] */           #  72a: 4861
            slli         a0, a0, 24                            #  72c: 800001
            srai         a0, a0, 24                            #  72f: 000831
            bgeui        a12, 8, .Lbr046                       #  732: f68c04
            add          a4, a0, a4                            #  735: 4a40
            j            .Lbr047                               #  737: 060200
.Lbr046:    l32i         a5, sp, 28 /* [(local7)] */           #  73a: 5871
            mov          a4, a5 /* [(local7)] */               #  73c: 4d05
            bge          a5, a0, .Lbr047                       #  73e: 07a501
            mov          a4, a0                                #  741: 4d00
.Lbr047:    movi         a0, -256 /* 0xffffff00 */             #  743: 02af00
            addx4        a3, a12, a13                          #  746: d03ca0
            neg          a8, a4                                #  749: 408060
            mov          a4, a14 /* 0x00000018 */              #  74c: 4d0e
            slli         a8, a8, 24                            #  74e: 808801
            srai         a8, a8, 24                            #  751: 808831
            blt          a14, a8, .Lbr048                      #  754: 872e01
            mov          a4, a8                                #  757: 4d08
.Lbr048:    extui        a5, a4, 0, 8                          #  759: 405074
            memw                                               #  75c: c02000
            l32i         a2, a3, 0x304                         #  75f: 2223c1
            and          a2, a2, a0                            #  762: 002210
            or           a2, a2, a5                            #  765: 502220
            memw                                               #  768: c02000
            s32i         a2, a3, 0x304                         #  76b: 2263c1
            addi         a12, a12, 1                           #  76e: 1bcc
            extui        a12, a12, 0, 8                        #  770: c0c074
            bne          a12, a14, .Lbr045                     #  773: e79ca7
            l32i         a12, sp, 8 /* [(local2)] */           #  776: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  778: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  77a: e841
            l32i         a15, sp, 20 /* [(local5)] */          #  77c: f851
            l32i         a0, sp, 4 /* [(local1)] */            #  77e: 0811
            addi         sp, sp, 48 /* (top of frame) */       #  780: 12c130
            ret                                                #  783: 0df0

            .literal_position                                  #  788: 00002c00
                                                               #  78c: 000000f0
                                                               #  790: 00000000
                                                               #  794: 00020060
                                                               #  798: fffffff0
                                                               #  79c: 00020060
                                                               #  7a0: 00000000

# Function @ .irom0.text+0x7a4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_txiq_get_mis_pwr
            .type        sdk_txiq_get_mis_pwr, @function
sdk_txiq_get_mis_pwr:
            movi         a9, 0xf0000000                        #  7a4: 91faff
            slli         a8, a2, 26                            #  7a7: 608201
            addi         sp, sp, -16 /* (local0) */            #  7aa: 12c1f0
            movi         a7, 256 /* 0x00000100 */              #  7ad: 72a100
            sub          a7, a7, a3                            #  7b0: 3077c0
            s32i         a6, sp, 4 /* arg4 -> [(local1)] */    #  7b3: 6911
            s32i         a5, sp, 0 /* arg3 -> [(local0)] */    #  7b5: 5901
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  7b7: c931
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  7b9: 0921
            mov          a12, a2 /* arg0 */                    #  7bb: cd02
            movi         a0, sdk_g_phyFuns                     #  7bd: 01f4ff
            movi         a5, 0x60000200                        #  7c0: 51f5ff
            movi         a6, 0x002c0000                        #  7c3: 61f1ff
            extui        a7, a7, 0, 8                          #  7c6: 707074
            slli         a7, a7, 10                            #  7c9: 607711
            or           a6, a4, a6                            #  7cc: 606420
            memw                                               #  7cf: c02000
            l32i         a2, a5, 0x3b8 /* [0x600005b8] */      #  7d2: 2225ee
            and          a2, a2, a9                            #  7d5: 902210
            or           a2, a2, a8                            #  7d8: 802220
            or           a2, a2, a7                            #  7db: 702220
            or           a2, a2, a6                            #  7de: 602220
            memw                                               #  7e1: c02000
            movi         a3, 10 /* 0x0000000a */               #  7e4: 0ca3
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  7e6: 0800
            s32i         a2, a5, 0x3b8 /* a2 -> [0x600005b8] */ #  7e8: 2265ee
            l32i         a0, a0, 112 /* [[sdk_g_phyFuns]+0x70] */ #  7eb: 02201c
            movi         a2, 4 /* 0x00000004 */                #  7ee: 0c42
            callx0       a0 /* [[sdk_g_phyFuns]+0x70] */       #  7f0: c00000
            slli         a5, a12, 3                            #  7f3: d05c11
            extui        a7, a12, 0, 1                         #  7f6: c07004
            movi         a6, 1 /* 0x00000001 */                #  7f9: 0c16
            l32i         a8, sp, 0 /* [(local0)] */            #  7fb: 8801
            movi         a4, 0 /* 0x00000000 */                #  7fd: 0c04
            s16i         a2, a8, 0 /* a2 -> [[(local0)]] */    #  7ff: 225800
            moveqz       a4, a6, a7                            #  802: 704683
            or           a4, a4, a5                            #  805: 504420
            slli         a4, a4, 24                            #  808: 804401
            movi         a5, 0xf0ffffff                        #  80b: 51e3ff
            memw                                               #  80e: c02000
            movi         a3, 0x60000200                        #  811: 31e2ff
            l32i         a2, a3, 0x3b8 /* [0x600005b8] */      #  814: 2223ee
            and          a2, a2, a5                            #  817: 502210
            or           a2, a2, a4                            #  81a: 402220
            memw                                               #  81d: c02000
            movi         a0, sdk_g_phyFuns                     #  820: 01e0ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  823: 0800
            s32i         a2, a3, 0x3b8 /* a2 -> [0x600005b8] */ #  825: 2263ee
            movi         a2, 4 /* 0x00000004 */                #  828: 0c42
            l32i         a0, a0, 112 /* [[sdk_g_phyFuns]+0x70] */ #  82a: 02201c
            movi         a3, 10 /* 0x0000000a */               #  82d: 0ca3
            callx0       a0 /* [[sdk_g_phyFuns]+0x70] */       #  82f: c00000
            l32i         a0, sp, 8 /* [(local2)] */            #  832: 0821
            l32i         a9, sp, 4 /* [(local1)] */            #  834: 9811
            l32i         a12, sp, 12 /* [(local3)] */          #  836: c831
            s16i         a2, a9, 0 /* a2 -> [[(local1)]] */    #  838: 225900
            addi         sp, sp, 16 /* (top of frame) */       #  83b: 12c110
            ret                                                #  83e: 0df0

            .literal_position                                  #  840: 00000000
                                                               #  844: 00000000
                                                               #  848: 00000000
                                                               #  84c: 00000000
                                                               #  850: 00000000
                                                               #  854: 00200000
                                                               #  858: 00000000
                                                               #  85c: 00000000
                                                               #  860: 00000000
                                                               #  864: 00000000
                                                               #  868: 00000000
                                                               #  86c: 00000000

# Function @ .irom0.text+0x870
# Local variables/stack:
#     (local0):  hword     @ -0x50
#     (local1):  hword     @ -0x4e
#     (local2):  word      @ -0x4c
#     (local3):  word      @ -0x48
#     (local4):  word      @ -0x44
#     (local5):  word      @ -0x40
#     (local6):  word      @ -0x3c
#     (local7):  word      @ -0x38
#     (local8):  word      @ -0x34
#     (local9):  word      @ -0x30
#     (local10): word      @ -0x2c
#     (local11): word      @ -0x28
#     (local12): word      @ -0x24
#     (local13): word      @ -0x20
#     (local14): word      @ -0x1c
#     (local15): word      @ -0x18
#     (local16): word      @ -0x14
#     (local17): word[4]   @ -0x10
            .balign      4
            .global      sdk_txiq_cover
            .type        sdk_txiq_cover, @function
sdk_txiq_cover:
            mov          a9, a3 /* arg1 */                     #  870: 9d03
            movi         a11, 0 /* 0x00000000 */               #  872: 0c0b
            addi         sp, sp, -80 /* (local0) */            #  874: 12c1b0
            s32i         a6, sp, 36 /* arg4 -> [(local10)] */  #  877: 6991
            s32i         a5, sp, 64 /* arg3 -> [(local17)] */  #  879: 526110
            s32i         a15, sp, 24 /* a15 -> [(local7)] */   #  87c: f961
            s32i         a2, sp, 48 /* arg0 -> [(local13)] */  #  87e: 29c1
            s32i         a0, sp, 8 /* a0 -> [(local3)] */      #  880: 0921
            s32i         a12, sp, 12 /* a12 -> [(local4)] */   #  882: c931
            s32i         a13, sp, 16 /* a13 -> [(local5)] */   #  884: d941
            s32i         a14, sp, 20 /* a14 -> [(local6)] */   #  886: e951
            mov          a13, a4 /* arg2 */                    #  888: dd04
            movi         a14, 0 /* 0x00000000 */               #  88a: 0c0e
            movi         a12, 0 /* 0x00000000 */               #  88c: 0c0c
            s32i         a11, sp, 56 /* 0x00000000 -> [(local15)] */ #  88e: b9e1
            s32i         a9, sp, 4 /* arg1 -> [(local2)] */    #  890: 9911
            movi         a0, 0 /* 0x00000000 */                #  892: 0c00
            movi         a2, 0 /* 0x00000000 */                #  894: 0c02
            l32i         a15, sp, 64 /* [(local17)] */         #  896: f22110
            l32i         a3, sp, 48 /* [(local13)] */          #  899: 38c1
            s32i         a2, sp, 60 /* 0x00000000 -> [(local16)] */ #  89b: 29f1
            s32i         a0, sp, 52 /* 0x00000000 -> [(local14)] */ #  89d: 09d1
            movi         a2, 7 /* 0x00000007 */                #  89f: 0c72
            movi         a0, 3 /* 0x00000003 */                #  8a1: 0c30
            addi         a3, a3, -12 /* [(local13)]-0xc */     #  8a3: 32c3f4
            movnez       a0, a2, a7                            #  8a6: 700293
            extui        a3, a3, 0, 8                          #  8a9: 303074
            s32i         a3, sp, 44 /* a3 -> [(local12)] */    #  8ac: 39b1
            s32i         a0, sp, 40 /* a0 -> [(local11)] */    #  8ae: 09a1
.Lbr049:    bgeui        a12, 3, .Lbr050                       #  8b0: f63c45
            mov          a4, a15 /* [(local17)] */             #  8b3: 4d0f
            movi         a0, sdk_g_phyFuns                     #  8b5: 01e2ff
            movi         a3, 128 /* 0x00000080 */              #  8b8: 32a080
            mul16s       a2, a14, a14                          #  8bb: e02ed1
            add          a2, a2, a3                            #  8be: 3a22
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  8c0: 0800
            l32i         a3, sp, 60 /* [(local16)] */          #  8c2: 38f1
            srai         a2, a2, 8                             #  8c4: 202821
            s32i         a2, sp, 32 /* a2 -> [(local9)] */     #  8c7: 2981
            l32i         a0, a0, 0x108 /* [[sdk_g_phyFuns]+0x108] */ #  8c9: 022042
            add          a2, a2, a3                            #  8cc: 3a22
            movi         a3, 1 /* 0x00000001 */                #  8ce: 0c13
            slli         a2, a2, 24                            #  8d0: 802201
            srai         a2, a2, 24                            #  8d3: 202831
            callx0       a0 /* [[sdk_g_phyFuns]+0x108] */      #  8d6: c00000
            mov          a4, a15 /* [(local17)] */             #  8d9: 4d0f
            l32i         a3, sp, 32 /* [(local9)] */           #  8db: 3881
            movi         a0, sdk_g_phyFuns                     #  8dd: 01d9ff
            sub          a3, a2, a3                            #  8e0: 3032c0
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  8e3: 0800
            mov          a2, a14                               #  8e5: 2d0e
            slli         a3, a3, 24                            #  8e7: 803301
            srai         a3, a3, 24                            #  8ea: 303831
            s32i         a3, sp, 60 /* a3 -> [(local16)] */    #  8ed: 39f1
            l32i         a0, a0, 0x108 /* [[sdk_g_phyFuns]+0x108] */ #  8ef: 022042
            movi         a3, 0 /* 0x00000000 */                #  8f2: 0c03
            callx0       a0 /* [[sdk_g_phyFuns]+0x108] */      #  8f4: c00000
            mov          a14, a2                               #  8f7: ed02
.Lbr050:    movi         a2, 1 /* 0x00000001 */                #  8f9: 0c12
            l32i         a3, sp, 44 /* [(local12)] */          #  8fb: 38b1
            l32i         a4, sp, 4 /* [(local2)] */            #  8fd: 4811
            mov          a5, sp /* (local0) */                 #  8ff: 5d01
            addi         a6, sp, 2 /* (local1) */              #  901: 2b61
            call0        sdk_txiq_get_mis_pwr                  #  903: 050000
            l16si        a7, sp, 2 /* [(local1)] */            #  906: 729101
            l16si        a5, sp, 0 /* [(local0)] */            #  909: 529100
            mov          a0, a7 /* [(local1)] */               #  90c: 0d07
            bge          a5, a7, .Lbr051                       #  90e: 77a501
            mov          a0, a5 /* [(local0)] */               #  911: 0d05
.Lbr051:    movi         a4, 1 /* 0x00000001 */                #  913: 0c14
            slli         a3, a0, 16                            #  915: 003011
            sub          a2, a7, a5                            #  918: 5027c0
            slli         a2, a2, 11                            #  91b: 502211
            srai         a3, a3, 16                            #  91e: 303031
            moveqz       a3, a4, a0                            #  921: 003483
            call0        __divsi3                              #  924: 01d0ffc0
                                                               #  928: 0000
            addi         a0, a2, 16                            #  92a: 02c210
            srai         a0, a0, 5                             #  92d: 000521
            s8i          a0, a13, 0 /* a0 -> [arg2] */         #  930: 024d00
            beqz         a15, .Lbr052                          #  933: 8c9f
            l32i         a2, sp, 60 /* [(local16)] */          #  935: 28f1
            bgez         a2, .Lbr052                           #  937: d65200
            neg          a3, a0                                #  93a: 003060
            s8i          a3, a13, 0 /* a3 -> [arg2] */         #  93d: 324d00
.Lbr052:    movi         a2, 0 /* 0x00000000 */                #  940: 0c02
            l32i         a3, sp, 48 /* [(local13)] */          #  942: 38c1
            l32i         a4, sp, 4 /* [(local2)] */            #  944: 4811
            mov          a5, sp /* (local0) */                 #  946: 5d01
            addi         a6, sp, 2 /* (local1) */              #  948: 2b61
            call0        sdk_txiq_get_mis_pwr                  #  94a: 050000
            l16si        a3, sp, 2 /* [(local1)] */            #  94d: 329101
            l16si        a4, sp, 0 /* [(local0)] */            #  950: 429100
            sub          a2, a4, a3                            #  953: 3024c0
            add          a3, a3, a4                            #  956: 4a33
            slli         a2, a2, 12                            #  958: 402211
            movi         a4, 1 /* 0x00000001 */                #  95b: 0c14
            slli         a3, a3, 16                            #  95d: 003311
            srai         a3, a3, 16                            #  960: 303031
            moveqz       a3, a4, a3                            #  963: 303483
            call0        __divsi3                              #  966: 01c0ffc0
                                                               #  96a: 0000
            addi         a5, a2, 16                            #  96c: 52c210
            srai         a5, a5, 5                             #  96f: 505521
            s8i          a5, a13, 1 /* a5 -> [arg2+0x1] */     #  972: 524d01
            beqz         a15, .Lbr053                          #  975: 8c7f
            bgez         a14, .Lbr053                          #  977: d65e00
            neg          a5, a5                                #  97a: 505060
            s8i          a5, a13, 1 /* a5 -> [arg2+0x1] */     #  97d: 524d01
.Lbr053:    l8ui         a0, a13, 0 /* [arg2] */               #  980: 020d00
            l32i         a2, sp, 60 /* [(local16)] */          #  983: 28f1
            slli         a0, a0, 24                            #  985: 800001
            srai         a0, a0, 24                            #  988: 000831
            bgeui        a12, 3, .Lbr054                       #  98b: f63c16
            sub          a14, a14, a5                          #  98e: 50eec0
            sub          a3, a2, a0                            #  991: 0032c0
            slli         a3, a3, 24                            #  994: 803301
            slli         a14, a14, 24                          #  997: 80ee01
            srai         a14, a14, 24                          #  99a: e0e831
            srai         a2, a3, 24                            #  99d: 302831
            s32i         a2, sp, 60 /* a2 -> [(local16)] */    #  9a0: 29f1
            j            .Lbr056                               #  9a2: 461a00
.Lbr054:    l32i         a2, sp, 52 /* [(local14)] */          #  9a5: 28d1
            l32i         a4, sp, 56 /* [(local15)] */          #  9a7: 48e1
            add          a3, a5, a2                            #  9a9: 2a35
            add          a6, a0, a4                            #  9ab: 4a60
            slli         a6, a6, 24                            #  9ad: 806601
            slli         a3, a3, 24                            #  9b0: 803301
            srai         a2, a3, 24                            #  9b3: 302831
            srai         a4, a6, 24                            #  9b6: 604831
            s32i         a4, sp, 56 /* a4 -> [(local15)] */    #  9b9: 49e1
            s32i         a2, sp, 52 /* a2 -> [(local14)] */    #  9bb: 29d1
            bnei         a12, 6, .Lbr056                       #  9bd: 666c4e
            l32i         a3, sp, 60 /* [(local16)] */          #  9c0: 38f1
            l32i         a2, sp, 56 /* [(local15)] */          #  9c2: 28e1
            movi         a0, sdk_g_phyFuns                     #  9c4: 01a1ff
            addi         a2, a2, 2 /* [(local15)]+0x2 */       #  9c7: 2b22
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  9c9: 0800
            srai         a2, a2, 2                             #  9cb: 202221
            sub          a4, a3, a2                            #  9ce: 2043c0
            slli         a4, a4, 24                            #  9d1: 804401
            srai         a3, a4, 24                            #  9d4: 403831
            s32i         a3, sp, 60 /* a3 -> [(local16)] */    #  9d7: 39f1
            l32i         a3, sp, 52 /* [(local14)] */          #  9d9: 38d1
            l32i         a0, a0, 0 /* [[sdk_g_phyFuns]] */     #  9db: 0800
            addi         a3, a3, 2 /* [(local14)]+0x2 */       #  9dd: 2b33
            srai         a3, a3, 2                             #  9df: 303221
            s32i         a3, sp, 28 /* a3 -> [(local8)] */     #  9e2: 3971
            sub          a14, a14, a3                          #  9e4: 30eec0
            slli         a14, a14, 24                          #  9e7: 80ee01
            srai         a14, a14, 24                          #  9ea: e0e831
            callx0       a0 /* [[sdk_g_phyFuns]] */            #  9ed: c00000
            bgei         a2, 5, .Lbr055                        #  9f0: e6520e
            movi         a0, sdk_g_phyFuns                     #  9f3: 0196ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  9f6: 0800
            l32i         a0, a0, 0 /* [[sdk_g_phyFuns]] */     #  9f8: 0800
            l32i         a2, sp, 28 /* [(local8)] */           #  9fa: 2871
            callx0       a0 /* [[sdk_g_phyFuns]] */            #  9fc: c00000
            blti         a2, 5, .Lbr056                        #  9ff: a6520c
.Lbr055:    movi         a3, sdk_check_result                  #  a02: 3193ff
            movi         a4, 0x00002000                        #  a05: 4193ff
            l32i         a2, a3, 0 /* [sdk_check_result] */    #  a08: 2803
            or           a2, a2, a4                            #  a0a: 402220
            s32i         a2, a3, 0 /* a2 -> [sdk_check_result] */ #  a0d: 2903
.Lbr056:    l32i         a5, sp, 36 /* [(local10)] */          #  a0f: 5891
            beqz         a5, .Lbr057                           #  a11: 9c95
            movi         a2, .Lstr001                          #  a13: 2191ff
            l8ui         a4, a13, 1 /* [arg2+0x1] */           #  a16: 420d01
            l8ui         a3, a13, 0 /* [arg2] */               #  a19: 320d00
            slli         a4, a4, 24                            #  a1c: 804401
            slli         a3, a3, 24                            #  a1f: 803301
            srai         a3, a3, 24                            #  a22: 303831
            srai         a4, a4, 24                            #  a25: 404831
            call0        ets_printf                            #  a28: 0191ffc0
                                                               #  a2c: 0000
.Lbr057:    l32i         a5, sp, 40 /* [(local11)] */          #  a2e: 58a1
            addi         a12, a12, 1                           #  a30: 1bcc
            extui        a12, a12, 0, 8                        #  a32: c0c074
            sub          a5, a5, a12                           #  a35: c055c0
            bnez         a5, .Lbr049                           #  a38: 5645e7
            movi         a3, 1 /* 0x00000001 */                #  a3b: 0c13
            mov          a4, a15 /* [(local17)] */             #  a3d: 4d0f
            movi         a0, sdk_g_phyFuns                     #  a3f: 0187ff
            l32i         a2, sp, 60 /* [(local16)] */          #  a42: 28f1
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  a44: 0800
            slli         a2, a2, 24                            #  a46: 802201
            l32i         a0, a0, 0x108 /* [[sdk_g_phyFuns]+0x108] */ #  a49: 022042
            srai         a2, a2, 24                            #  a4c: 202831
            callx0       a0 /* [[sdk_g_phyFuns]+0x108] */      #  a4f: c00000
            mov          a4, a15 /* [(local17)] */             #  a52: 4d0f
            movi         a0, sdk_g_phyFuns                     #  a54: 0183ff
            movi         a3, 0 /* 0x00000000 */                #  a57: 0c03
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       #  a59: 0800
            slli         a2, a14, 24                           #  a5b: 802e01
            l32i         a0, a0, 0x108 /* [[sdk_g_phyFuns]+0x108] */ #  a5e: 022042
            srai         a2, a2, 24                            #  a61: 202831
            callx0       a0 /* [[sdk_g_phyFuns]+0x108] */      #  a64: c00000
            l32i         a0, sp, 8 /* [(local3)] */            #  a67: 0821
            l32i         a12, sp, 12 /* [(local4)] */          #  a69: c831
            l32i         a15, sp, 24 /* [(local7)] */          #  a6b: f861
            s8i          a14, a13, 1 /* a14 -> [arg2+0x1] */   #  a6d: e24d01
            l32i         a2, sp, 60 /* [(local16)] */          #  a70: 28f1
            s8i          a2, a13, 0 /* [(local16)] -> [arg2] */ #  a72: 224d00
            l32i         a14, sp, 20 /* [(local6)] */          #  a75: e851
            l32i         a13, sp, 16 /* [(local5)] */          #  a77: d841
            addi         sp, sp, 80 /* (top of frame) */       #  a79: 12c150
            ret           /* [(local16)] */                    #  a7c: 0df0

            .literal_position                                  #  a80: 00000000
                                                               #  a84: 0c000000
                                                               #  a88: 00000300
                                                               #  a8c: ffff00e0
                                                               #  a90: 009a0060
                                                               #  a94: 00960060
                                                               #  a98: 00000200
                                                               #  a9c: 00000000
                                                               #  aa0: 00000000

# Function @ .irom0.text+0xaa4
# Local variables/stack:
#     (local0):  byte      @ -0x3e
#     (local1):  byte      @ -0x3d
#     (local2):  word      @ -0x3c
#     (local3):  word      @ -0x38
#     (local4):  word      @ -0x34
#     (local5):  word      @ -0x30
#     (local6):  word      @ -0x2c
#     (local7):  word      @ -0x28
#     (local8):  word      @ -0x24
#     (local9):  word      @ -0x20
#     (local10): word      @ -0x1c
#     (local11): word      @ -0x18
#     (local12): word      @ -0x14
#     (local13): word      @ -0x10
#     (local14): word[3]   @ -0xc
            .balign      4
            .global      sdk_ram_rfcal_txiq
            .type        sdk_ram_rfcal_txiq, @function
sdk_ram_rfcal_txiq:
            mov          a9, a3 /* arg1 */                     #  aa4: 9d03
            addi         sp, sp, -64 /* (FP)-0x40 */           #  aa6: 12c1c0
            s32i         a12, sp, 36 /* a12 -> [(local10)] */  #  aa9: c991
            s32i         a15, sp, 48 /* a15 -> [(local13)] */  #  aab: f9c1
            s32i         a5, sp, 52 /* arg3 -> [(local14)] */  #  aad: 59d1
            s32i         a6, sp, 12 /* arg4 -> [(local4)] */   #  aaf: 6931
            s32i         a4, sp, 8 /* arg2 -> [(local3)] */    #  ab1: 4921
            s32i         a0, sp, 32 /* a0 -> [(local9)] */     #  ab3: 0981
            s32i         a13, sp, 40 /* a13 -> [(local11)] */  #  ab5: d9a1
            s32i         a14, sp, 44 /* a14 -> [(local12)] */  #  ab7: e9b1
            mov          a13, a2 /* arg0 */                    #  ab9: dd02
            mov          a14, a7 /* arg5 */                    #  abb: ed07
            l32i         a0, a2, 0 /* [arg0] */                #  abd: 0802
            s32i         a9, sp, 4 /* arg1 -> [(local2)] */    #  abf: 9911
            extui        a0, a0, 17, 1                         #  ac1: 000105
            bnez         a0, .Lbr064                           #  ac4: 56d018
            l32i         a15, sp, 52 /* [(local14)] */         #  ac7: f8d1
            movi         a2, 119 /* 0x00000077 */              #  ac9: 22a077
            movi         a3, 0 /* 0x00000000 */                #  acc: 0c03
            movi         a12, sdk_g_phyFuns                    #  ace: c1ecff
            movi         a4, 16 /* 0x00000010 */               #  ad1: 1c04
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  ad3: 080c
            movi         a5, 0 /* 0x00000000 */                #  ad5: 0c05
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  ad7: 022025
            movi         a6, 0 /* 0x00000000 */                #  ada: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  adc: c00000
            movi         a3, 0 /* 0x00000000 */                #  adf: 0c03
            movi         a4, 15 /* 0x0000000f */               #  ae1: 0cf4
            movi         a5, 6 /* 0x00000006 */                #  ae3: 0c65
            movi         a6, 6 /* 0x00000006 */                #  ae5: 0c66
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  ae7: 080c
            s32i         a2, sp, 20 /* a2 -> [(local6)] */     #  ae9: 2951
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  aeb: 022025
            movi         a2, 119 /* 0x00000077 */              #  aee: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  af1: c00000
            movi         a3, 0 /* 0x00000000 */                #  af4: 0c03
            movi         a4, 9 /* 0x00000009 */                #  af6: 0c94
            movi         a5, 7 /* 0x00000007 */                #  af8: 0c75
            movi         a6, 0 /* 0x00000000 */                #  afa: 0c06
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  afc: 080c
            s32i         a2, sp, 24 /* a2 -> [(local7)] */     #  afe: 2961
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  b00: 022025
            movi         a2, 119 /* 0x00000077 */              #  b03: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  b06: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  b09: 080c
            l32i         a0, a0, 160 /* [[sdk_g_phyFuns]+0xa0] */ #  b0b: 022028
            s32i         a2, sp, 28 /* a2 -> [(local8)] */     #  b0e: 2971
            callx0       a0 /* [[sdk_g_phyFuns]+0xa0] */       #  b10: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  b13: 080c
            l32i         a0, a0, 192 /* [[sdk_g_phyFuns]+0xc0] */ #  b15: 022030
            movi         a2, 1 /* 0x00000001 */                #  b18: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0xc0] */       #  b1a: c00000
            l32i         a2, sp, 8 /* [(local3)] */            #  b1d: 2821
            extui        a2, a2, 0, 12                         #  b1f: 2020b4
            call0        sdk_ram_pbus_xpd_tx_on                #  b22: 01deffc0
                                                               #  b26: 0000
            l32i         a2, sp, 8 /* [(local3)] */            #  b28: 2821
            mov          a3, sp /* (FP)-0x40 */                #  b2a: 3d01
            movi         a4, 1 /* 0x00000001 */                #  b2c: 0c14
            call0        sdk_set_txdc_pbus                     #  b2e: 050000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  b31: 080c
            l32i         a0, a0, 24 /* [[sdk_g_phyFuns]+0x18] */ #  b33: 0860
            movi         a2, 0 /* 0x00000000 */                #  b35: 0c02
            callx0       a0 /* [[sdk_g_phyFuns]+0x18] */       #  b37: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  b3a: 080c
            l32i         a0, a0, 60 /* [[sdk_g_phyFuns]+0x3c] */ #  b3c: 08f0
            movi         a2, 1 /* 0x00000001 */                #  b3e: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x3c] */       #  b40: c00000
            movi         a2, 119 /* 0x00000077 */              #  b43: 22a077
            movi         a3, 0 /* 0x00000000 */                #  b46: 0c03
            movi         a4, 9 /* 0x00000009 */                #  b48: 0c94
            movi         a5, 7 /* 0x00000007 */                #  b4a: 0c75
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  b4c: 080c
            movi         a6, 0 /* 0x00000000 */                #  b4e: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  b50: 022027
            movi         a7, 0 /* 0x00000000 */                #  b53: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  b55: c00000
            movi         a2, 119 /* 0x00000077 */              #  b58: 22a077
            movi         a3, 0 /* 0x00000000 */                #  b5b: 0c03
            movi         a4, 16 /* 0x00000010 */               #  b5d: 1c04
            movi         a5, 2 /* 0x00000002 */                #  b5f: 0c25
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  b61: 080c
            movi         a6, 2 /* 0x00000002 */                #  b63: 0c26
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  b65: 022027
            movi         a7, 1 /* 0x00000001 */                #  b68: 0c17
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  b6a: c00000
            l32i         a2, sp, 12 /* [(local4)] */           #  b6d: 2831
            l8ui         a7, sp, 68 /* [(FP)+0x4] */           #  b6f: 720144
            mov          a3, a15 /* [(local14)] */             #  b72: 3d0f
            addi         a4, sp, 2 /* (local0) */              #  b74: 2b41
            l8ui         a15, sp, 64 /* [(local15)] */         #  b76: f20140
            mov          a5, a14 /* arg5 */                    #  b79: 5d0e
            mov          a6, a15 /* [(local15)] */             #  b7b: 6d0f
            call0        sdk_txiq_cover                        #  b7d: 050000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  b80: 080c
            l32i         a0, a0, 108 /* [[sdk_g_phyFuns]+0x6c] */ #  b82: 02201b
            movi         a2, 1 /* 0x00000001 */                #  b85: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x6c] */       #  b87: c00000
            movi         a2, 119 /* 0x00000077 */              #  b8a: 22a077
            movi         a3, 0 /* 0x00000000 */                #  b8d: 0c03
            movi         a4, 16 /* 0x00000010 */               #  b8f: 1c04
            movi         a5, 0 /* 0x00000000 */                #  b91: 0c05
            movi         a6, 0 /* 0x00000000 */                #  b93: 0c06
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  b95: 080c
            l32i         a7, sp, 20 /* [(local6)] */           #  b97: 7851
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  b99: 022027
            s32i         a7, sp, 16 /* [(local6)] -> [(local5)] */ #  b9c: 7941
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  b9e: c00000
            l32i         a7, sp, 24 /* [(local7)] */           #  ba1: 7861
            movi         a2, 119 /* 0x00000077 */              #  ba3: 22a077
            movi         a3, 0 /* 0x00000000 */                #  ba6: 0c03
            movi         a4, 15 /* 0x0000000f */               #  ba8: 0cf4
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  baa: 080c
            movi         a5, 6 /* 0x00000006 */                #  bac: 0c65
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  bae: 022027
            movi         a6, 6 /* 0x00000006 */                #  bb1: 0c66
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  bb3: c00000
            l32i         a7, sp, 28 /* [(local8)] */           #  bb6: 7871
            movi         a2, 119 /* 0x00000077 */              #  bb8: 22a077
            movi         a3, 0 /* 0x00000000 */                #  bbb: 0c03
            movi         a4, 9 /* 0x00000009 */                #  bbd: 0c94
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  bbf: 080c
            movi         a5, 7 /* 0x00000007 */                #  bc1: 0c75
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  bc3: 022027
            movi         a6, 0 /* 0x00000000 */                #  bc6: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  bc8: c00000
            movi         a2, 119 /* 0x00000077 */              #  bcb: 22a077
            movi         a3, 0 /* 0x00000000 */                #  bce: 0c03
            movi         a4, 16 /* 0x00000010 */               #  bd0: 1c04
            movi         a5, 2 /* 0x00000002 */                #  bd2: 0c25
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  bd4: 080c
            movi         a6, 2 /* 0x00000002 */                #  bd6: 0c26
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  bd8: 022027
            movi         a7, 0 /* 0x00000000 */                #  bdb: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  bdd: c00000
            movi         a2, 15 /* 0x0000000f */               #  be0: 0cf2
            l8ui         a4, sp, 2 /* [(local0)] */            #  be2: 420102
            movi         a0, -15 /* 0xfffffff1 */              #  be5: 7c10
            slli         a4, a4, 24                            #  be7: 804401
            srai         a4, a4, 24                            #  bea: 404831
            blt          a4, a0, .Lbr058                       #  bed: 072401
            mov          a0, a4                                #  bf0: 0d04
.Lbr058:    l8ui         a4, sp, 3 /* [(local1)] */            #  bf2: 420103
            blt          a2, a0, .Lbr059                       #  bf5: 072201
            mov          a2, a0                                #  bf8: 2d00
.Lbr059:    movi         a0, -31 /* 0xffffffe1 */              #  bfa: 6c10
            s8i          a2, sp, 2 /* a2 -> [(local0)] */      #  bfc: 224102
            slli         a4, a4, 24                            #  bff: 804401
            slli         a3, a2, 24                            #  c02: 803201
            srai         a3, a3, 24                            #  c05: 303831
            srai         a4, a4, 24                            #  c08: 404831
            movi         a2, 31 /* 0x0000001f */               #  c0b: 1cf2
            blt          a4, a0, .Lbr060                       #  c0d: 072401
            mov          a0, a4                                #  c10: 0d04
.Lbr060:    blt          a2, a0, .Lbr061                       #  c12: 072201
            mov          a2, a0                                #  c15: 2d00
.Lbr061:    s8i          a2, sp, 3 /* a2 -> [(local1)] */      #  c17: 224103
            slli         a4, a2, 24                            #  c1a: 804201
            srai         a4, a4, 24                            #  c1d: 404831
            beqz         a14, .Lbr062                          #  c20: 8cee
            l32i         a5, sp, 16 /* [(local5)] */           #  c22: 5841
            beqz         a5, .Lbr062                           #  c24: 8ca5
            neg          a3, a3                                #  c26: 303060
            s8i          a3, sp, 2 /* a3 -> [(local0)] */      #  c29: 324102
            slli         a3, a3, 24                            #  c2c: 803301
            srai         a3, a3, 24                            #  c2f: 303831
.Lbr062:    beqz         a15, .Lbr063                          #  c32: 8cdf
            movi         a2, .Lstr002                          #  c34: 2194ff
            call0        ets_printf                            #  c37: 019affc0
                                                               #  c3b: 0000
            l8ui         a4, sp, 3 /* [(local1)] */            #  c3d: 420103
            l8ui         a3, sp, 2 /* [(local0)] */            #  c40: 320102
.Lbr063:    extui        a5, a3, 7, 1                          #  c43: 305704
            slli         a14, a3, 24                           #  c46: 80e301
            srai         a14, a14, 24                          #  c49: e0e831
            beqz         a5, .Lbr066                           #  c4c: 166508
            addi         a14, a3, 32                           #  c4f: e2c320
            j            .Lbr066                               #  c52: 062000
.Lbr064:    l16ui        a12, a3, 0 /* [arg1] */               #  c55: c21300
            srli         a14, a12, 8                           #  c58: c0e841
            slli         a12, a12, 24                          #  c5b: 80cc01
            srai         a12, a12, 24                          #  c5e: c0c831
.Lbr065:    movi         a6, 0x60009a00                        #  c61: 618bff
            slli         a10, a14, 24                          #  c64: 80ae01
            movi         a11, 0x00030000                       #  c67: b188ff
            slli         a9, a12, 18                           #  c6a: e09c01
            or           a9, a9, a11                           #  c6d: b09920
            movi         a14, 0x60009600                       #  c70: e189ff
            movi         a11, 0xe000ffff                       #  c73: b186ff
            memw                                               #  c76: c02000
            l32i         a8, a14, 0x260 /* [0x60009860] */     #  c79: 822e98
            and          a8, a8, a11                           #  c7c: b08810
            or           a8, a8, a10                           #  c7f: a08820
            or           a8, a8, a9                            #  c82: 908820
            memw                                               #  c85: c02000
            s32i         a8, a14, 0x260 /* a8 -> [0x60009860] */ #  c88: 826e98
            movi         a7, 32 /* 0x00000020 */               #  c8b: 2c07
            memw                                               #  c8d: c02000
            l32i         a5, a6, 40 /* [0x60009a28] */         #  c90: 58a6
            or           a5, a5, a7                            #  c92: 705520
            memw                                               #  c95: c02000
            s32i         a5, a6, 40 /* a5 -> [0x60009a28] */   #  c98: 59a6
            movi         a4, -16 /* 0xfffffff0 */              #  c9a: 7c04
            movi         a3, 2 /* 0x00000002 */                #  c9c: 0c23
            memw                                               #  c9e: c02000
            l32i         a2, a14, 0x23c /* [0x6000983c] */     #  ca1: 222e8f
            and          a2, a2, a4                            #  ca4: 402210
            or           a2, a2, a3                            #  ca7: 302220
            memw                                               #  caa: c02000
            s32i         a2, a14, 0x23c /* a2 -> [0x6000983c] */ #  cad: 226e8f
            movi         a0, -498 /* 0xfffffe0e */             #  cb0: 02ae0e
            movi         a15, 1 /* 0x00000001 */               #  cb3: 0c1f
            memw                                               #  cb5: c02000
            l32i         a13, a14, 0x264 /* [0x60009864] */    #  cb8: d22e99
            and          a13, a13, a0                          #  cbb: 00dd10
            or           a13, a13, a15                         #  cbe: f0dd20
            memw                                               #  cc1: c02000
            l32i         a12, sp, 36 /* [(local10)] */         #  cc4: c891
            s32i         a13, a14, 0x264 /* a13 -> [0x60009864] */ #  cc6: d26e99
            l32i         a15, sp, 48 /* [(local13)] */         #  cc9: f8c1
            l32i         a13, sp, 40 /* [(local11)] */         #  ccb: d8a1
            l32i         a14, sp, 44 /* [(local12)] */         #  ccd: e8b1
            l32i         a0, sp, 32 /* [(local9)] */           #  ccf: 0881
            addi         sp, sp, 64 /* (local15) */            #  cd1: 12c140
            ret                                                #  cd4: 0df0
.Lbr066:    slli         a15, a4, 24                           #  cd6: 80f401
            srai         a15, a15, 24                          #  cd9: f0f831
            bbci         a4, 7, .Lbr067                        #  cdc: 776402
            addi         a15, a4, 64                           #  cdf: f2c440
.Lbr067:    l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  ce2: 080c
            slli         a12, a15, 24                          #  ce4: 80cf01
            l32i         a0, a0, 168 /* [[sdk_g_phyFuns]+0xa8] */ #  ce7: 02202a
            srai         a12, a12, 24                          #  cea: c0c831
            callx0       a0 /* [[sdk_g_phyFuns]+0xa8] */       #  ced: c00000
            movi         a3, 0x00020000                        #  cf0: 316aff
            l32i         a2, a13, 0 /* [arg0] */               #  cf3: 280d
            slli         a4, a15, 24                           #  cf5: 804f01
            slli         a5, a14, 8                            #  cf8: 805e11
            srai         a4, a4, 24                            #  cfb: 404831
            or           a4, a4, a5                            #  cfe: 504420
            l32i         a5, sp, 4 /* [(local2)] */            #  d01: 5811
            or           a2, a2, a3                            #  d03: 302220
            s16i         a4, a5, 0 /* a4 -> [[(local2)]] */    #  d06: 425500
            s32i         a2, a13, 0 /* a2 -> [arg0] */         #  d09: 290d
            j            .Lbr065                               #  d0b: 86d4ff

            .literal_position                                  #  d10: 00000000
                                                               #  d14: 00000000
                                                               #  d18: 00000000
                                                               #  d1c: 00000000
                                                               #  d20: 00000000
                                                               #  d24: 00000001
                                                               #  d28: 00008000
                                                               #  d2c: 00000000
                                                               #  d30: 00000000
                                                               #  d34: 00000000
                                                               #  d38: 00000000

# Function @ .irom0.text+0xd3c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_rc_cal
            .type        sdk_rc_cal, @function
sdk_rc_cal: addi         sp, sp, -16 /* (local0) */            #  d3c: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  d3f: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  d41: c911
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  d43: e931
            movi         a14, sdk_chip6_sleep_params           #  d45: e1f2ff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  d48: 0901
            l32i         a0, a14, 0 /* [sdk_chip6_sleep_params] */ #  d4a: 080e
            movi         a12, sdk_g_phyFuns                    #  d4c: c1f2ff
            bbsi         a0, 23, .Lbr068                       #  d4f: 77f035
            movi         a2, 106 /* 0x0000006a */              #  d52: 22a06a
            movi         a3, 2 /* 0x00000002 */                #  d55: 0c23
            movi         a4, 0 /* 0x00000000 */                #  d57: 0c04
            movi         a5, 5 /* 0x00000005 */                #  d59: 0c55
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  d5b: 080c
            movi         a6, 4 /* 0x00000004 */                #  d5d: 0c46
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  d5f: 022027
            movi         a7, 0 /* 0x00000000 */                #  d62: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  d64: c00000
            movi         a9, sdk_chip6_phy_init_ctrl           #  d67: 91ecff
            l32i         a10, a12, 0 /* [sdk_g_phyFuns] */     #  d6a: a80c
            l8ui         a2, a9, 1 /* [sdk_chip6_phy_init_ctrl+0x1] */ #  d6c: 220901
            l32i         a10, a10, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  d6f: a22a27
            beqz         a2, .Lbr070                           #  d72: 16d204
            movi         a2, 106 /* 0x0000006a */              #  d75: 22a06a
            movi         a3, 2 /* 0x00000002 */                #  d78: 0c23
            movi         a4, 4 /* 0x00000004 */                #  d7a: 0c44
            movi         a5, 7 /* 0x00000007 */                #  d7c: 0c75
            movi         a6, 4 /* 0x00000004 */                #  d7e: 0c46
            movi         a7, 1 /* 0x00000001 */                #  d80: 0c17
            callx0       a10 /* [[sdk_g_phyFuns]+0x9c] */      #  d82: c00a00
            j            .Lbr071                               #  d85: 861200
.Lbr068:    l8ui         a13, a14, 74 /* [sdk_chip6_sleep_params+0x4a] */ #  d88: d20e4a
.Lbr069:    movi         a2, 97 /* 0x00000061 */               #  d8b: 22a061
            movi         a3, 1 /* 0x00000001 */                #  d8e: 0c13
            movi         a4, 2 /* 0x00000002 */                #  d90: 0c24
            movi         a5, 4 /* 0x00000004 */                #  d92: 0c45
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  d94: 080c
            movi         a6, 0 /* 0x00000000 */                #  d96: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  d98: 022027
            mov          a7, a13                               #  d9b: 7d0d
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  d9d: c00000
            l8ui         a7, a14, 75 /* [sdk_chip6_sleep_params+0x4b] */ #  da0: 720e4b
            movi         a2, 102 /* 0x00000066 */              #  da3: 22a066
            movi         a3, 3 /* 0x00000003 */                #  da6: 0c33
            movi         a4, 1 /* 0x00000001 */                #  da8: 0c14
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  daa: 080c
            movi         a5, 5 /* 0x00000005 */                #  dac: 0c55
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  dae: 022027
            movi         a6, 0 /* 0x00000000 */                #  db1: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  db3: c00000
            l32i         a12, sp, 4 /* [(local1)] */           #  db6: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  db8: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  dba: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  dbc: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  dbe: 12c110
            ret                                                #  dc1: 0df0
.Lbr070:    movi         a2, 106 /* 0x0000006a */              #  dc3: 22a06a
            movi         a3, 2 /* 0x00000002 */                #  dc6: 0c23
            movi         a4, 4 /* 0x00000004 */                #  dc8: 0c44
            movi         a5, 7 /* 0x00000007 */                #  dca: 0c75
            movi         a6, 4 /* 0x00000004 */                #  dcc: 0c46
            movi         a7, 2 /* 0x00000002 */                #  dce: 0c27
            callx0       a10 /* [[sdk_g_phyFuns]+0x9c] */      #  dd0: c00a00
.Lbr071:    movi         a2, 104 /* 0x00000068 */              #  dd3: 22a068
            movi         a3, 3 /* 0x00000003 */                #  dd6: 0c33
            movi         a4, 1 /* 0x00000001 */                #  dd8: 0c14
            movi         a5, 0 /* 0x00000000 */                #  dda: 0c05
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  ddc: 080c
            movi         a6, 0 /* 0x00000000 */                #  dde: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  de0: 022027
            movi         a7, 1 /* 0x00000001 */                #  de3: 0c17
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  de5: c00000
            movi         a2, 106 /* 0x0000006a */              #  de8: 22a06a
            movi         a3, 2 /* 0x00000002 */                #  deb: 0c23
            movi         a4, 6 /* 0x00000006 */                #  ded: 0c64
            movi         a5, 4 /* 0x00000004 */                #  def: 0c45
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  df1: 080c
            movi         a6, 0 /* 0x00000000 */                #  df3: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  df5: 022027
            movi         a7, 8 /* 0x00000008 */                #  df8: 0c87
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  dfa: c00000
            movi         a2, 106 /* 0x0000006a */              #  dfd: 22a06a
            movi         a3, 2 /* 0x00000002 */                #  e00: 0c23
            movi         a4, 4 /* 0x00000004 */                #  e02: 0c44
            movi         a5, 0 /* 0x00000000 */                #  e04: 0c05
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e06: 080c
            movi         a6, 0 /* 0x00000000 */                #  e08: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  e0a: 022027
            movi         a7, 1 /* 0x00000001 */                #  e0d: 0c17
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  e0f: c00000
            movi         a2, 106 /* 0x0000006a */              #  e12: 22a06a
            movi         a3, 2 /* 0x00000002 */                #  e15: 0c23
            movi         a4, 3 /* 0x00000003 */                #  e17: 0c34
            movi         a5, 6 /* 0x00000006 */                #  e19: 0c65
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e1b: 080c
            movi         a6, 6 /* 0x00000006 */                #  e1d: 0c66
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  e1f: 022027
            movi         a7, 1 /* 0x00000001 */                #  e22: 0c17
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  e24: c00000
            movi         a2, 106 /* 0x0000006a */              #  e27: 22a06a
            movi         a3, 2 /* 0x00000002 */                #  e2a: 0c23
            movi         a4, 4 /* 0x00000004 */                #  e2c: 0c44
            movi         a5, 3 /* 0x00000003 */                #  e2e: 0c35
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e30: 080c
            movi         a6, 3 /* 0x00000003 */                #  e32: 0c36
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  e34: 022027
            movi         a7, 0 /* 0x00000000 */                #  e37: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  e39: c00000
            movi         a2, 106 /* 0x0000006a */              #  e3c: 22a06a
            movi         a3, 2 /* 0x00000002 */                #  e3f: 0c23
            movi         a4, 4 /* 0x00000004 */                #  e41: 0c44
            movi         a5, 3 /* 0x00000003 */                #  e43: 0c35
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e45: 080c
            movi         a6, 3 /* 0x00000003 */                #  e47: 0c36
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  e49: 022027
            movi         a7, 1 /* 0x00000001 */                #  e4c: 0c17
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  e4e: c00000
            movi         a2, 100 /* 0x00000064 */              #  e51: 22a064
            call0        sdk_ets_delay_us                      #  e54: 01b6ffc0
                                                               #  e58: 0000
            movi         a2, 106 /* 0x0000006a */              #  e5a: 22a06a
            movi         a3, 2 /* 0x00000002 */                #  e5d: 0c23
            movi         a4, 5 /* 0x00000005 */                #  e5f: 0c54
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e61: 080c
            movi         a5, 5 /* 0x00000005 */                #  e63: 0c55
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ #  e65: 022025
            movi         a6, 0 /* 0x00000000 */                #  e68: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       #  e6a: c00000
            movi         a3, 3 /* 0x00000003 */                #  e6d: 0c33
            movi         a4, 1 /* 0x00000001 */                #  e6f: 0c14
            movi         a5, 0 /* 0x00000000 */                #  e71: 0c05
            movi         a6, 0 /* 0x00000000 */                #  e73: 0c06
            movi         a7, 0 /* 0x00000000 */                #  e75: 0c07
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      #  e77: 080c
            mov          a13, a2                               #  e79: dd02
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ #  e7b: 022027
            movi         a2, 104 /* 0x00000068 */              #  e7e: 22a068
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       #  e81: c00000
            movi         a0, sdk_chip6_phy_init_ctrl           #  e84: 01a6ff
            movi         a4, sdk_check_result                  #  e87: 41a6ff
            l8ui         a6, a0, 1 /* [sdk_chip6_phy_init_ctrl+0x1] */ #  e8a: 620001
            bltui        a13, 3, .Lbr072                       #  e8d: b63d04
            movi         a2, 60 /* 0x0000003c */               #  e90: 3cc2
            bgeu         a2, a13, .Lbr073                      #  e92: d7b209
.Lbr072:    movi         a5, 0x01000000                        #  e95: 51a3ff
            l32i         a3, a4, 0 /* [sdk_check_result] */    #  e98: 3804
            or           a3, a3, a5                            #  e9a: 503320
            s32i         a3, a4, 0 /* a3 -> [sdk_check_result] */ #  e9d: 3904
.Lbr073:    beqz         a6, .Lbr075                           #  e9f: bcb6
            movi         a3, 30 /* 0x0000001e */               #  ea1: 1ce3
            slli         a2, a13, 4                            #  ea3: c02d11
            addi         a2, a2, -39                           #  ea6: 22c2d9
            call0        __divsi3                              #  ea9: 01a1ffc0
                                                               #  ead: 0000
.Lbr074:    subx8        a3, a13, a13                          #  eaf: d03df0
            extui        a13, a2, 0, 8                         #  eb2: 20d074
            s8i          a13, a14, 74 /* a13 -> [sdk_chip6_sleep_params+0x4a] */ #  eb5: d24e4a
            slli         a2, a3, 2                             #  eb8: e02311
            extui        a2, a2, 0, 16                         #  ebb: 2020f4
            movi         a3, 9 /* 0x00000009 */                #  ebe: 0c93
            call0        __udivsi3                             #  ec0: 019dffc0
                                                               #  ec4: 0000
            movi         a6, 0x00800000                        #  ec6: 6198ff
            l32i         a5, a14, 0 /* [sdk_chip6_sleep_params] */ #  ec9: 580e
            extui        a4, a2, 0, 8                          #  ecb: 204074
            addi         a4, a4, 2                             #  ece: 2b44
            srai         a4, a4, 2                             #  ed0: 404221
            s8i          a4, a14, 75 /* a4 -> [sdk_chip6_sleep_params+0x4b] */ #  ed3: 424e4b
            or           a5, a5, a6                            #  ed6: 605520
            s32i         a5, a14, 0 /* a5 -> [sdk_chip6_sleep_params] */ #  ed9: 590e
            j            .Lbr069                               #  edb: 06abff
.Lbr075:    movi         a3, 20 /* 0x00000014 */               #  ede: 1c43
            addx4        a2, a13, a13                          #  ee0: d02da0
            addx2        a2, a2, a13                           #  ee3: d02290
            addi         a2, a2, -14                           #  ee6: 22c2f2
            call0        __divsi3                              #  ee9: 0193ffc0
                                                               #  eed: 0000
            j            .Lbr074                               #  eef: 06efff

            .literal_position                                  #  ef4: 00000000
                                                               #  ef8: 00000000
                                                               #  efc: 00000000
                                                               #  f00: 300f0000

# Function @ .irom0.text+0xf04
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_get_target_power_offset
            .type        sdk_get_target_power_offset, @function
sdk_get_target_power_offset:
            addi         sp, sp, -16 /* (local0) */            #  f04: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  f07: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  f09: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  f0b: d921
            mov          a12, a2 /* arg0 */                    #  f0d: cd02
            mov          a13, a3 /* arg1 */                    #  f0f: dd03
            movi         a2, sdk_chip6_sleep_params            #  f11: 21f8ff
            mov          a3, a12 /* arg0 */                    #  f14: 3d0c
            l8ui         a2, a2, 110 /* [sdk_chip6_sleep_params+0x6e] */ #  f16: 22026e
            call0        sdk_get_fcc_1m2m_pwr_offset           #  f19: 050000
            movi         a0, sdk_chip6_sleep_params            #  f1c: 01f7ff
            movi         a6, sdk_chip6_phy_init_ctrl           #  f1f: 61f7ff
            bgeui        a12, 16, .Lbr076                      #  f22: f6bc3a
            movi         a4, .Lfunc001                         #  f25: 41f6ff
            addx2        a3, a12, a12                          #  f28: c03c90
            add          a3, a3, a4                            #  f2b: 4a33
            jx           a3                                    #  f2d: a00300
.Lfunc001:  j            .Lbr085                               #  f30: 462300
            j            .Lbr085                               #  f33: 862200
            j            .Lbr093                               #  f36: c62d00
            j            .Lbr093                               #  f39: 062d00
            j            .Lbr085                               #  f3c: 462000
            j            .Lbr085                               #  f3f: 861f00
            j            .Lbr093                               #  f42: c62a00
            j            .Lbr093                               #  f45: 062a00
            j            .Lbr092                               #  f48: c62700
            j            .Lbr091                               #  f4b: 862500
            j            .Lbr090                               #  f4e: 462300
            j            .Lbr086                               #  f51: 861c00
            j            .Lbr089                               #  f54: 462000
            j            .Lbr088                               #  f57: 061e00
            j            .Lbr087                               #  f5a: c61b00
            j            .Lbr086                               #  f5d: 861900
.Lbr076:    add          a3, a12, a13                          #  f60: da3c
            addmi        a3, a3, -256                          #  f62: 32d3ff
            l8ui         a3, a3, 240                           #  f65: 3203f0
.Lbr077:    l8ui         a0, a0, 78 /* [sdk_chip6_sleep_params+0x4e] */ #  f68: 02004e
            bgeui        a12, 8, .Lbr078                       #  f6b: f68c0a
            l8ui         a4, a6, 97 /* [sdk_chip6_phy_init_ctrl+0x61] */ #  f6e: 420661
            bnez         a4, .Lbr082                           #  f71: fcb4
            l8ui         a3, a13, 0 /* [arg1] */               #  f73: 320d00
            j            .Lbr082                               #  f76: 860d00
.Lbr078:    slli         a0, a0, 24                            #  f79: 800001
            srai         a0, a0, 24                            #  f7c: 000831
            beqi         a0, 1, .Lbr079                        #  f7f: 261017
            movi         a2, 11 /* 0x0000000b */               #  f82: 0cb2
            beq          a0, a2, .Lbr083                       #  f84: 27102d
            movi         a4, 13 /* 0x0000000d */               #  f87: 0cd4
            beq          a0, a4, .Lbr084                       #  f89: 47102e
            addi         a7, a0, -14                           #  f8c: 72c0f2
            l8ui         a5, a6, 35 /* [sdk_chip6_phy_init_ctrl+0x23] */ #  f8f: 520623
            movi         a2, 0 /* 0x00000000 */                #  f92: 0c02
            moveqz       a2, a5, a7                            #  f94: 702583
            j            .Lbr080                               #  f97: 860000
.Lbr079:    l8ui         a2, a6, 32 /* [sdk_chip6_phy_init_ctrl+0x20] */ #  f9a: 220620
.Lbr080:    l32i         a12, sp, 4 /* [(local1)] */           #  f9d: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  f9f: d821
            extui        a0, a3, 0, 8                          #  fa1: 300074
            bgeu         a2, a0, .Lbr081                       #  fa4: 07b201
            mov          a2, a0                                #  fa7: 2d00
.Lbr081:    l32i         a0, sp, 0 /* [(local0)] */            #  fa9: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  fab: 12c110
            ret                                                #  fae: 0df0
.Lbr082:    add          a3, a2, a3                            #  fb0: 3a32
            j            .Lbr078                               #  fb2: c6f0ff
.Lbr083:    l8ui         a2, a6, 33 /* [sdk_chip6_phy_init_ctrl+0x21] */ #  fb5: 220621
            j            .Lbr080                               #  fb8: 46f8ff
.Lbr084:    l8ui         a2, a6, 34 /* [sdk_chip6_phy_init_ctrl+0x22] */ #  fbb: 220622
            j            .Lbr080                               #  fbe: c6f6ff
.Lbr085:    l8ui         a3, a6, 99                            #  fc1: 320663
            j            .Lbr077                               #  fc4: 06e8ff
.Lbr086:    l8ui         a3, a13, 0                            #  fc7: 320d00
            j            .Lbr077                               #  fca: 86e6ff
.Lbr087:    l8ui         a3, a13, 2                            #  fcd: 320d02
            j            .Lbr077                               #  fd0: 06e5ff
.Lbr088:    l8ui         a3, a13, 4                            #  fd3: 320d04
            j            .Lbr077                               #  fd6: 86e3ff
.Lbr089:    l8ui         a3, a13, 6                            #  fd9: 320d06
            j            .Lbr077                               #  fdc: 06e2ff
.Lbr090:    l8ui         a3, a13, 1                            #  fdf: 320d01
            j            .Lbr077                               #  fe2: 86e0ff
.Lbr091:    l8ui         a3, a13, 3                            #  fe5: 320d03
            j            .Lbr077                               #  fe8: 06dfff
.Lbr092:    l8ui         a3, a13, 5                            #  feb: 320d05
            j            .Lbr077                               #  fee: 86ddff
.Lbr093:    l8ui         a3, a6, 98                            #  ff1: 320662
            j            .Lbr077                               #  ff4: 06dcff

            .balign      4
# Function @ .irom0.text+0xff8
            .balign      4
            .global      sdk_get_pwctrl_correct
            .type        sdk_get_pwctrl_correct, @function
sdk_get_pwctrl_correct:
            addi         a6, a4, 2 /* arg2+0x2 */              #  ff8: 2b64
            l16si        a8, a3, 0 /* [arg1] */                #  ffa: 829300
            ssr          a4                                    #  ffd: 000440
            sra          a9, a8                                # 1000: 8090b1
            sub          a8, a8, a9                            # 1003: 9088c0
            ssl          a6                                    # 1006: 001640
            add          a8, a2, a8                            # 1009: 8a82
            sll          a2, a5                                # 100b: 0025a1
            slli         a8, a8, 16                            # 100e: 008811
            srai         a8, a8, 16                            # 1011: 808031
            s16i         a8, a3, 0 /* a8 -> [arg1] */          # 1014: 825300
            blt          a8, a2, .Lbr096                       # 1017: 272814
            sub          a4, a8, a2                            # 101a: 2048c0
            neg          a2, a5                                # 101d: 502060
            slli         a2, a2, 24                            # 1020: 802201
            srai         a2, a2, 24                            # 1023: 202831
.Lbr094:    s16i         a4, a3, 0 /* a4 -> [arg1] */          # 1026: 425300
            ret                                                # 1029: 0df0
.Lbr095:    movi         a2, 0 /* 0x00000000 */                # 102b: 0c02
            ret           /* 0x00000000 */                     # 102d: 0df0
.Lbr096:    neg          a4, a2                                # 102f: 204060
            blt          a4, a8, .Lbr095                       # 1032: 8724f5
            add          a4, a8, a2                            # 1035: 2a48
            slli         a2, a5, 24                            # 1037: 802501
            srai         a2, a2, 24                            # 103a: 202831
            j            .Lbr094                               # 103d: 46f9ff

            .literal_position                                  # 1040: 000a0060
                                                               # 1044: 00000000
                                                               # 1048: 00000000
                                                               # 104c: 00020060
                                                               # 1050: 2c000000
                                                               # 1054: 00000000
                                                               # 1058: 00000000
                                                               # 105c: f30f0000
                                                               # 1060: 00000000
                                                               # 1064: 00000000
                                                               # 1068: 00000000
                                                               # 106c: 00000000
                                                               # 1070: 00000000
                                                               # 1074: 00000000
                                                               # 1078: 00000000
                                                               # 107c: 4c000000
                                                               # 1080: 00000000
                                                               # 1084: 00020060
                                                               # 1088: 00000000
                                                               # 108c: 00000000
                                                               # 1090: 00000000
                                                               # 1094: 00000000
                                                               # 1098: 00000000
                                                               # 109c: 00000000

# Function @ .irom0.text+0x10a0
# Local variables/stack:
#     (local0):  word      @ -0x70
#     (local1):  word      @ -0x6c
#     (local2):  word      @ -0x68
#     (local3):  word      @ -0x64
#     (local4):  word      @ -0x60
#     (local5):  word      @ -0x5c
#     (local6):  word[2]   @ -0x58
#     (local7):  byte[16]  @ -0x50
#     (local8):  word      @ -0x40
#     (local9):  word      @ -0x3c
#     (local10): word      @ -0x38
#     (local11): word      @ -0x34
#     (local12): word      @ -0x30
#     (local13): word      @ -0x2c
#     (local14): word      @ -0x28
#     (local15): word      @ -0x24
#     (local16): word      @ -0x20
#     (local17): word      @ -0x1c
#     (local18): word      @ -0x18
#     (local19): word      @ -0x14
#     (local20): word      @ -0x10
#     (local21): word      @ -0xc
#     (local22): word[2]   @ -0x8
            .balign      4
            .global      sdk_tx_pwctrl_cal
            .type        sdk_tx_pwctrl_cal, @function
sdk_tx_pwctrl_cal:
            addi         sp, sp, -112 /* (local0) */           # 10a0: 12c190
            s32i         a15, sp, 96 /* a15 -> [(local20)] */  # 10a3: f26118
            s32i         a0, sp, 80 /* a0 -> [(local16)] */    # 10a6: 026114
            s32i         a2, sp, 68 /* arg0 -> [(local13)] */  # 10a9: 226111
            s32i         a5, sp, 72 /* arg3 -> [(local14)] */  # 10ac: 526112
            s32i         a6, sp, 100 /* arg4 -> [(local21)] */ # 10af: 626119
            s32i         a12, sp, 84 /* a12 -> [(local17)] */  # 10b2: c26115
            s32i         a14, sp, 92 /* a14 -> [(local19)] */  # 10b5: e26117
            s32i         a13, sp, 88 /* a13 -> [(local18)] */  # 10b8: d26116
            mov          a13, a4 /* arg2 */                    # 10bb: dd04
            mov          a14, a3 /* arg1 */                    # 10bd: ed03
            movi         a12, 0x60000a00                       # 10bf: c1e0ff
            memw                                               # 10c2: c02000
            l32i         a12, a12, 0x360 /* [0x60000d60] */    # 10c5: c22cd8
            movi         a2, 312 /* 0x00000138 */              # 10c8: 22a138
            extui        a12, a12, 24, 5                       # 10cb: c0c845
            call0        sdk_get_sar_dout                      # 10ce: 050000
            s32i         a2, sp, 76 /* a2 -> [(local15)] */    # 10d1: 226113
            bgeui        a12, 8, .Lbr097                       # 10d4: f68c0a
            movi         a2, -1 /* 0xffffffff */               # 10d7: 7cf2
            xor          a2, a12, a2                           # 10d9: 202c30
            extui        a2, a2, 0, 3                          # 10dc: 202024
            j            .Lbr098                               # 10df: 460000
.Lbr097:    mov          a2, a12                               # 10e2: 2d0c
.Lbr098:    mov          a3, a14 /* arg1 */                    # 10e4: 3d0e
            call0        sdk_get_target_power_offset           # 10e6: 050000
            movi         a15, sdk_loop_pwctrl_pwdet_error_accum_high_power # 10e9: f1d6ff
            movi         a14, sdk_chip6_sleep_params           # 10ec: e1d7ff
            movi         a3, -32 /* 0xffffffe0 */              # 10ef: 6c03
            l32i         a4, sp, 76 /* [(local15)] */          # 10f1: 422113
            mov          a0, a2                                # 10f4: 0d02
            l32i         a5, sp, 68 /* [(local13)] */          # 10f6: 522111
            movi         a10, 32 /* 0x00000020 */              # 10f9: 2c0a
            add          a5, a2, a5                            # 10fb: 5a52
            s32i         a5, sp, 64 /* a5 -> [(local12)] */    # 10fd: 526110
            l8ui         a5, a5, 0                             # 1100: 520500
            mov          a2, a10 /* 0x00000020 */              # 1103: 2d0a
            slli         a5, a5, 2                             # 1105: e05511
            sub          a4, a4, a5                            # 1108: 5044c0
            slli         a4, a4, 16                            # 110b: 004411
            srai         a4, a4, 16                            # 110e: 404031
            blt          a4, a3, .Lbr099                       # 1111: 372401
            mov          a3, a4                                # 1114: 3d04
.Lbr099:    s32i         a0, sp, 56 /* a0 -> [(local10)] */    # 1116: 09e1
            l32i         a6, a14, 0 /* [sdk_chip6_sleep_params] */ # 1118: 680e
            blt          a10, a3, .Lbr100                      # 111a: 372a01
            mov          a2, a3                                # 111d: 2d03
.Lbr100:    slli         a8, a2, 16                            # 111f: 008211
            srai         a8, a8, 16                            # 1122: 808031
            bbci         a6, 29, .Lbr101                       # 1125: d77619
            s32i         a0, sp, 56 /* a0 -> [(local10)] */    # 1128: 09e1
            bnez         a0, .Lbr101                           # 112a: dc40
            mov          a2, a8                                # 112c: 2d08
            s32i         a8, sp, 48 /* a8 -> [(local8)] */     # 112e: 89c1
            mov          a3, a15 /* sdk_loop_pwctrl_pwdet_error_accum_high_power */ # 1130: 3d0f
            movi         a4, 4 /* 0x00000004 */                # 1132: 0c44
            movi         a5, 2 /* 0x00000002 */                # 1134: 0c25
            s32i         a13, sp, 52 /* arg2 -> [(local9)] */  # 1136: d9d1
            call0        sdk_get_pwctrl_correct                # 1138: 050000
            mov          a0, a2                                # 113b: 0d02
            movi         a13, 0 /* 0x00000000 */               # 113d: 0c0d
            j            .Lbr106                               # 113f: 061100
.Lbr101:    mov          a3, a13 /* arg2 */                    # 1142: 3d0d
            mov          a2, a8                                # 1144: 2d08
            s32i         a8, sp, 48 /* a8 -> [(local8)] */     # 1146: 89c1
            s32i         a13, sp, 52 /* arg2 -> [(local9)] */  # 1148: d9d1
            movi         a4, 4 /* 0x00000004 */                # 114a: 0c44
            movi         a5, 2 /* 0x00000002 */                # 114c: 0c25
            call0        sdk_get_pwctrl_correct                # 114e: 050000
            l32i         a9, sp, 56 /* [(local10)] */          # 1151: 98e1
            mov          a13, a2                               # 1153: dd02
            bnez         a9, .Lbr117                           # 1155: 564919
            l32i         a10, sp, 48 /* [(local8)] */          # 1158: a8c1
            bgei         a10, 1, .Lbr102                       # 115a: e61a02
            j            .Lbr117                               # 115d: 066300
.Lbr102:    blti         a10, 16, .Lbr103                      # 1160: a6ba02
            j            .Lbr117                               # 1163: 866100
.Lbr103:    bnez         a2, .Lbr117                           # 1166: 563218
            l8ui         a0, a15, 2 /* [sdk_tx_pwctrl_pk_num] */ # 1169: 020f02
            addi         a0, a0, 1 /* [sdk_tx_pwctrl_pk_num]+0x1 */ # 116c: 1b00
            extui        a0, a0, 0, 8                          # 116e: 000074
.Lbr104:    s8i          a0, a15, 2 /* a0 -> [sdk_tx_pwctrl_pk_num] */ # 1171: 024f02
            movi         a2, 20 /* 0x00000014 */               # 1174: 1c42
            bne          a0, a2, .Lbr105                       # 1176: 27900b
            movi         a13, -2 /* 0xfffffffe */              # 1179: 7ced
            l32i         a4, sp, 52 /* [(local9)] */           # 117b: 48d1
            movi         a3, 0 /* 0x00000000 */                # 117d: 0c03
            s8i          a3, a15, 2 /* 0x00 -> [sdk_tx_pwctrl_pk_num] */ # 117f: 324f02
            s16i         a3, a4, 0 /* 0x0000 -> [[(local9)]] */ # 1182: 325400
.Lbr105:    movi         a0, 0 /* 0x00000000 */                # 1185: 0c00
.Lbr106:    l32i         a6, sp, 100 /* [(local21)] */         # 1187: 622119
            beqz         a13, .Lbr107                          # 118a: 8c6d
            movi         a5, 0 /* 0x00000000 */                # 118c: 0c05
            s8i          a5, a15, 3 /* 0x00 -> [sdk_loop_pwctrl_correct_atten_high_power] */ # 118e: 524f03
            s16i         a5, a15, 0 /* 0x0000 -> [sdk_loop_pwctrl_pwdet_error_accum_high_power] */ # 1191: 525f00
.Lbr107:    s32i         a0, sp, 104 /* a0 -> [(local22)] */   # 1194: 02611a
            beqz         a6, .Lbr108                           # 1197: bc36
            movi         a2, .Lstr003                          # 1199: 21adff
            mov          a3, a12                               # 119c: 3d0c
            l32i         a4, sp, 48 /* [(local8)] */           # 119e: 48c1
            l16si        a6, a15, 0 /* [sdk_loop_pwctrl_pwdet_error_accum_high_power] */ # 11a0: 629f00
            movi         a7, 0x60000200                        # 11a3: 71aaff
            l32i         a5, sp, 52 /* [(local9)] */           # 11a6: 58d1
            addx4        a7, a12, a7                           # 11a8: 707ca0
            l16si        a5, a5, 0 /* [[(local9)]] */          # 11ab: 529500
            memw                                               # 11ae: c02000
            l8ui         a8, a14, 78 /* [sdk_chip6_sleep_params+0x4e] */ # 11b1: 820e4e
            l32i         a7, a7, 0x304                         # 11b4: 7227c1
            slli         a8, a8, 24                            # 11b7: 808801
            slli         a7, a7, 24                            # 11ba: 807701
            srai         a7, a7, 24                            # 11bd: 707831
            srai         a8, a8, 24                            # 11c0: 808831
            s32i         a8, sp, 0 /* a8 -> [(local0)] */      # 11c3: 8901
            call0        ets_printf                            # 11c5: 01b2ffc0
                                                               # 11c9: 0000
            l32i         a0, sp, 104 /* [(local22)] */         # 11cb: 02211a
.Lbr108:    l32i         a6, sp, 72 /* [(local14)] */          # 11ce: 622112
            beqz         a6, .Lbr116                           # 11d1: 164610
            s32i         a12, sp, 60 /* a12 -> [(local11)] */  # 11d4: c9f1
            bnez         a13, .Lbr109                          # 11d6: cc3d
            s32i         a12, sp, 60 /* a12 -> [(local11)] */  # 11d8: c9f1
            beqz         a0, .Lbr116                           # 11da: 16b00f
.Lbr109:    movi         a5, 0 /* 0x00000000 */                # 11dd: 0c05
            mov          a15, a13                              # 11df: fd0d
            movi         a10, sdk_loop_pwctrl_pwdet_error_accum_high_power # 11e1: a19cff
            l8ui         a2, a14, 120 /* [sdk_chip6_sleep_params+0x78] */ # 11e4: 220e78
            movi         a12, 127 /* 0x0000007f */             # 11e7: c2a07f
            slli         a2, a2, 24                            # 11ea: 802201
            srai         a2, a2, 24                            # 11ed: 202831
.Lbr110:    addx2        a9, a5, a5                            # 11f0: 509590
            slli         a7, a12, 24                           # 11f3: 807c01
            srai         a7, a7, 24                            # 11f6: 707831
            addi         a5, a5, 1                             # 11f9: 1b55
            addx2        a9, a9, a14                           # 11fb: e09990
            l8ui         a9, a9, 85                            # 11fe: 920955
            extui        a5, a5, 0, 8                          # 1201: 505074
            slli         a9, a9, 24                            # 1204: 809901
            srai         a9, a9, 24                            # 1207: 909831
            bge          a9, a7, .Lbr111                       # 120a: 77a901
            mov          a12, a9                               # 120d: cd09
.Lbr111:    bnei         a5, 4, .Lbr110                        # 120f: 6645dd
            movi         a5, sdk_tx_rf_ana_gain                # 1212: 5191ff
            add          a12, a2, a12                          # 1215: cac2
            slli         a12, a12, 24                          # 1217: 80cc01
            srai         a12, a12, 24                          # 121a: c0c831
            beqz         a13, .Lbr114                          # 121d: 168d09
            movi         a4, 36 /* 0x00000024 */               # 1220: 2c44
            sub          a9, a12, a13                          # 1222: d09cc0
            slli         a9, a9, 24                            # 1225: 809901
            srai         a9, a9, 24                            # 1228: 909831
            bge          a4, a9, .Lbr112                       # 122b: 97a40b
            s32i         a0, sp, 104 /* a0 -> [(local22)] */   # 122e: 02611a
            l16ui        a2, a5, 0 /* [sdk_tx_rf_ana_gain] */  # 1231: 221500
            movi         a11, 996 /* 0x000003e4 */             # 1234: b2a3e4
            bltu         a11, a2, .Lbr113                      # 1237: 273b0e
.Lbr112:    bgei         a9, 12, .Lbr114                       # 123a: e6a97b
            l16ui        a4, a5, 0 /* [sdk_tx_rf_ana_gain] */  # 123d: 421500
            movi         a3, 0x00000ff3                        # 1240: 3187ff
            s32i         a0, sp, 104 /* a0 -> [(local22)] */   # 1243: 02611a
            bltu         a3, a4, .Lbr114                       # 1246: 47336f
.Lbr113:    addi         a2, sp, 32 /* (local7) */             # 1249: 22c120
            movi         a3, sdk_tx_rf_ana_gain                # 124c: 3185ff
            movi         a5, 24 /* 0x00000018 */               # 124f: 1c85
            sub          a5, a5, a9                            # 1251: 9055c0
            s8i          a5, sp, 32 /* a5 -> [(local7)] */     # 1254: 524120
            call0        sdk_correct_rf_ana_gain               # 1257: 050000
            l8ui         a6, a14, 121 /* [sdk_chip6_sleep_params+0x79] */ # 125a: 620e79
            l8ui         a7, sp, 32 /* [(local7)] */           # 125d: 720120
            movi         a4, sdk_chip6_sleep_params+0x180      # 1260: 4181ff
            movi         a2, sdk_tx_rf_ana_gain                # 1263: 2181ff
            sub          a8, a13, a12                          # 1266: c08dc0
            addi         a8, a8, 24                            # 1269: 82c818
            l16ui        a2, a2, 0 /* [sdk_tx_rf_ana_gain] */  # 126c: 221200
            l8ui         a3, a4, 74 /* [sdk_chip6_sleep_params+0x1ca] */ # 126f: 32044a
            slli         a7, a7, 24                            # 1272: 807701
            slli         a6, a6, 24                            # 1275: 806601
            srai         a6, a6, 24                            # 1278: 606831
            srai         a7, a7, 24                            # 127b: 707831
            slli         a3, a3, 24                            # 127e: 803301
            sub          a5, a8, a7                            # 1281: 7058c0
            add          a6, a6, a5                            # 1284: 5a66
            srai         a3, a3, 24                            # 1286: 303831
            sub          a7, a7, a8                            # 1289: 8077c0
            add          a15, a15, a7                          # 128c: 7aff
            add          a3, a3, a5                            # 128e: 5a33
            s8i          a6, a14, 121 /* a6 -> [sdk_chip6_sleep_params+0x79] */ # 1290: 624e79
            s8i          a3, a4, 74 /* a3 -> [sdk_chip6_sleep_params+0x1ca] */ # 1293: 32444a
            addi         a3, sp, 34 /* (FP)-0x4e */            # 1296: 32c122
            movi         a4, 0 /* 0x00000000 */                # 1299: 0c04
            call0        sdk_set_txdc_pbus                     # 129b: 050000
            movi         a2, sdk_tx_rf_ana_gain                # 129e: 2173ff
            addi         a3, sp, 34 /* (FP)-0x4e */            # 12a1: 32c122
            l16ui        a2, a2, 0 /* [sdk_tx_rf_ana_gain] */  # 12a4: 221200
            call0        sdk_set_rfanagain_dc_reg              # 12a7: 050000
            l32i         a0, sp, 104 /* [(local22)] */         # 12aa: 02211a
            movi         a5, sdk_tx_rf_ana_gain                # 12ad: 5171ff
            movi         a10, sdk_loop_pwctrl_pwdet_error_accum_high_power # 12b0: a170ff
            l16ui        a3, a5, 0 /* [sdk_tx_rf_ana_gain] */  # 12b3: 321500
            s16i         a3, a14, 118 /* [sdk_tx_rf_ana_gain] -> [sdk_chip6_sleep_params+0x76] */ # 12b6: 325e3b
.Lbr114:    sub          a9, a12, a15                          # 12b9: f09cc0
            movnez       a15, a0, a0                           # 12bc: 00f093
            slli         a9, a9, 24                            # 12bf: 809901
            srai         a9, a9, 24                            # 12c2: 909831
            slli         a4, a15, 24                           # 12c5: 804f01
            srai         a15, a4, 24                           # 12c8: 40f831
            bgez         a15, .Lbr115                          # 12cb: d64f00
            movi         a11, 70 /* 0x00000046 */              # 12ce: 4c6b
            bge          a11, a9, .Lbr118                      # 12d0: 97ab1e
.Lbr115:    blti         a15, 1, .Lbr116                       # 12d3: a61f02
            bgei         a9, 12, .Lbr118                       # 12d6: e6a918
.Lbr116:    l32i         a12, sp, 84 /* [(local17)] */         # 12d9: c22115
            l32i         a13, sp, 88 /* [(local18)] */         # 12dc: d22116
            l32i         a14, sp, 92 /* [(local19)] */         # 12df: e22117
            l32i         a15, sp, 96 /* [(local20)] */         # 12e2: f22118
            l32i         a0, sp, 80 /* [(local16)] */          # 12e5: 022114
            addi         sp, sp, 112 /* (top of frame) */      # 12e8: 12c170
            ret                                                # 12eb: 0df0
.Lbr117:    movi         a0, 0 /* 0x00000000 */                # 12ed: 0c00
            j            .Lbr104                               # 12ef: 869fff
.Lbr118:    beqz         a0, .Lbr121                           # 12f2: ac90
            movi         a13, 8 /* 0x00000008 */               # 12f4: 0c8d
            l8ui         a11, a10, 3 /* [sdk_loop_pwctrl_correct_atten_high_power] */ # 12f6: b20a03
            movi         a9, -8 /* 0xfffffff8 */               # 12f9: 7c89
            slli         a11, a11, 24                          # 12fb: 80bb01
            srai         a11, a11, 24                          # 12fe: b0b831
            sub          a11, a11, a0                          # 1301: 00bbc0
            s8i          a11, a10, 3 /* a11 -> [sdk_loop_pwctrl_correct_atten_high_power] */ # 1304: b24a03
            slli         a11, a11, 24                          # 1307: 80bb01
            srai         a11, a11, 24                          # 130a: b0b831
            blt          a11, a9, .Lbr119                      # 130d: 972b01
            mov          a9, a11                               # 1310: 9d0b
.Lbr119:    mov          a0, a13 /* 0x00000008 */              # 1312: 0d0d
            blt          a13, a9, .Lbr120                      # 1314: 972d01
            mov          a0, a9                                # 1317: 0d09
.Lbr120:    s8i          a0, a10, 3 /* a0 -> [sdk_loop_pwctrl_correct_atten_high_power] */ # 1319: 024a03
            j            .Lbr122                               # 131c: 460b00
.Lbr121:    l8ui         a3, a14, 120 /* [sdk_chip6_sleep_params+0x78] */ # 131f: 320e78
            movi         a0, sdk_chip6_sleep_params+0x180      # 1322: 0155ff
            l8ui         a2, a14, 121 /* [sdk_chip6_sleep_params+0x79] */ # 1325: 220e79
            l8ui         a13, a0, 74 /* [sdk_chip6_sleep_params+0x1ca] */ # 1328: d2004a
            slli         a2, a2, 24                            # 132b: 802201
            slli         a3, a3, 24                            # 132e: 803301
            srai         a3, a3, 24                            # 1331: 303831
            srai         a2, a2, 24                            # 1334: 202831
            slli         a13, a13, 24                          # 1337: 80dd01
            add          a2, a2, a15                           # 133a: fa22
            sub          a3, a3, a15                           # 133c: f033c0
            s8i          a3, a14, 120 /* a3 -> [sdk_chip6_sleep_params+0x78] */ # 133f: 324e78
            s8i          a2, a14, 121 /* a2 -> [sdk_chip6_sleep_params+0x79] */ # 1342: 224e79
            srai         a13, a13, 24                          # 1345: d0d831
            add          a13, a13, a15                         # 1348: fadd
            s8i          a13, a0, 74 /* a13 -> [sdk_chip6_sleep_params+0x1ca] */ # 134a: d2404a
.Lbr122:    l8ui         a2, a14, 78 /* [sdk_chip6_sleep_params+0x4e] */ # 134d: 220e4e
            addi         a3, sp, 40 /* (FP)-0x48 */            # 1350: 32c128
            call0        sdk_tx_atten_set_interp               # 1353: 0150ffc0
                                                               # 1357: 0000
            call0        sdk_dpd_scale_set                     # 1359: 014fffc0
                                                               # 135d: 0000
            l32i         a15, sp, 100 /* [(local21)] */        # 135f: f22119
            beqz         a15, .Lbr116                          # 1362: 163ff7
            movi         a2, .Lstr004                          # 1365: 2145ff
            l8ui         a5, a14, 120 /* [sdk_chip6_sleep_params+0x78] */ # 1368: 520e78
            l8ui         a3, a14, 121 /* [sdk_chip6_sleep_params+0x79] */ # 136b: 320e79
            movi         a4, sdk_chip6_sleep_params+0x180      # 136e: 4144ff
            slli         a3, a3, 24                            # 1371: 803301
            l8ui         a4, a4, 74 /* [sdk_chip6_sleep_params+0x1ca] */ # 1374: 42044a
            slli         a5, a5, 24                            # 1377: 805501
            srai         a5, a5, 24                            # 137a: 505831
            slli         a4, a4, 24                            # 137d: 804401
            srai         a3, a3, 24                            # 1380: 303831
            srai         a4, a4, 24                            # 1383: 404831
            memw                                               # 1386: c02000
            l32i         a8, sp, 60 /* [(local11)] */          # 1389: 88f1
            l32i         a11, sp, 64 /* [(local12)] */         # 138b: b22110
            l32i         a13, sp, 48 /* [(local8)] */          # 138e: d8c1
            movi         a7, sdk_tx_rf_ana_gain                # 1390: 713eff
            movi         a10, 0x60000200                       # 1393: a13cff
            l16ui        a7, a7, 0 /* [sdk_tx_rf_ana_gain] */  # 1396: 721700
            l32i         a6, a10, 0x360 /* [0x60000560] */     # 1399: 622ad8
            s32i         a13, sp, 0 /* [(local8)] -> [(local0)] */ # 139c: d901
            l8ui         a11, a11, 0 /* [[(local12)]] */       # 139e: b20b00
            s32i         a11, sp, 4 /* [[(local12)]] -> [(local1)] */ # 13a1: b911
            s32i         a8, sp, 8 /* [(local11)] -> [(local2)] */ # 13a3: 8921
            l8ui         a9, a14, 78 /* [sdk_chip6_sleep_params+0x4e] */ # 13a5: 920e4e
            slli         a6, a6, 24                            # 13a8: 806601
            slli         a9, a9, 24                            # 13ab: 809901
            srai         a9, a9, 24                            # 13ae: 909831
            s32i         a9, sp, 12 /* a9 -> [(local3)] */     # 13b1: 9931
            srai         a6, a6, 24                            # 13b3: 606831
            neg          a6, a6                                # 13b6: 606060
            addx4        a8, a8, a10                           # 13b9: a088a0
            memw                                               # 13bc: c02000
            l32i         a8, a8, 0x304                         # 13bf: 8228c1
            movi         a0, sdk_loop_pwctrl_pwdet_error_accum_high_power # 13c2: 0132ff
            slli         a8, a8, 24                            # 13c5: 808801
            srai         a8, a8, 24                            # 13c8: 808831
            s32i         a8, sp, 16 /* a8 -> [(local4)] */     # 13cb: 8941
            l8ui         a0, a0, 3 /* [sdk_loop_pwctrl_correct_atten_high_power] */ # 13cd: 020003
            s32i         a12, sp, 24 /* a12 -> [(local6)] */   # 13d0: c961
            slli         a0, a0, 24                            # 13d2: 800001
            srai         a0, a0, 24                            # 13d5: 000831
            s32i         a0, sp, 20 /* a0 -> [(local5)] */     # 13d8: 0951
            call0        ets_printf                            # 13da: 0130ffc0
                                                               # 13de: 0000
            j            .Lbr116                               # 13e0: 46bdff

            .literal_position                                  # 13e4: ffffdfff
                                                               # 13e8: 000a0060
                                                               # 13ec: ffff7fff

# Function @ .irom0.text+0x13f0
            .balign      4
            .global      sdk_tx_pwctrl_bg_init
            .type        sdk_tx_pwctrl_bg_init, @function
sdk_tx_pwctrl_bg_init:
            movi         a4, 0xffdfffff                        # 13f0: 41fdff
            movi         a6, -2 /* 0xfffffffe */               # 13f3: 7ce6
            movi         a3, 0x60000a00                        # 13f5: 31fcff
            memw                                               # 13f8: c02000
            l32i         a2, a3, 0x35c /* [0x60000d5c] */      # 13fb: 2223d7
            and          a2, a2, a4                            # 13fe: 402210
            memw                                               # 1401: c02000
            s32i         a2, a3, 0x35c /* a2 -> [0x60000d5c] */ # 1404: 2263d7
            movi         a11, 0xff7fffff                       # 1407: b1f9ff
            memw                                               # 140a: c02000
            l32i         a10, a3, 0x35c /* [0x60000d5c] */     # 140d: a223d7
            and          a10, a10, a11                         # 1410: b0aa10
            memw                                               # 1413: c02000
            s32i         a10, a3, 0x35c /* a10 -> [0x60000d5c] */ # 1416: a263d7
            memw                                               # 1419: c02000
            l32i         a9, a3, 0x350 /* [0x60000d50] */      # 141c: 9223d4
            and          a9, a9, a6                            # 141f: 609910
            memw                                               # 1422: c02000
            s32i         a9, a3, 0x350 /* a9 -> [0x60000d50] */ # 1425: 9263d4
            movi         a8, 2 /* 0x00000002 */                # 1428: 0c28
            memw                                               # 142a: c02000
            l32i         a7, a3, 0x360 /* [0x60000d60] */      # 142d: 7223d8
            or           a7, a7, a8                            # 1430: 807720
            memw                                               # 1433: c02000
            s32i         a7, a3, 0x360 /* a7 -> [0x60000d60] */ # 1436: 7263d8
            memw                                               # 1439: c02000
            l32i         a5, a3, 0x360 /* [0x60000d60] */      # 143c: 5223d8
            and          a5, a5, a6                            # 143f: 605510
            memw                                               # 1442: c02000
            s32i         a5, a3, 0x360 /* a5 -> [0x60000d60] */ # 1445: 5263d8
            movi         a4, 1 /* 0x00000001 */                # 1448: 0c14
            memw                                               # 144a: c02000
            l32i         a2, a3, 0x360 /* [0x60000d60] */      # 144d: 2223d8
            or           a2, a2, a4                            # 1450: 402220
            memw                                               # 1453: c02000
            s32i         a2, a3, 0x360 /* a2 -> [0x60000d60] */ # 1456: 2263d8
            ret                                                # 1459: 0df0

            .literal_position                                  # 145c: 00000000
                                                               # 1460: 00000000
                                                               # 1464: 000a0060
                                                               # 1468: 00000000
                                                               # 146c: 00000000
                                                               # 1470: 00000000
                                                               # 1474: 00000000
                                                               # 1478: 00000000
                                                               # 147c: 00000000
                                                               # 1480: 00000000
                                                               # 1484: 00000000
                                                               # 1488: 00000000
                                                               # 148c: 00000000
                                                               # 1490: b0000000
                                                               # 1494: 00000000
                                                               # 1498: 00000000
                                                               # 149c: 00000000
                                                               # 14a0: 00000000
                                                               # 14a4: 00000000
                                                               # 14a8: 00000000
                                                               # 14ac: 00000000
                                                               # 14b0: 00000000

# Function @ .irom0.text+0x14b4
# Local variables/stack:
#     (local0):  word      @ -0x18
#     (local1):  word      @ -0x14
#     (local2):  word      @ -0x10
#     (local3):  word      @ -0xc
#     (local4):  word      @ -0x8
#     (local5):  word      @ -0x4
            .balign      4
            .global      sdk_tx_pwctrl_background
            .type        sdk_tx_pwctrl_background, @function
sdk_tx_pwctrl_background:
            addi         sp, sp, -32 /* (FP)-0x20 */           # 14b4: 12c1e0
            s32i         a0, sp, 28 /* a0 -> [(local5)] */     # 14b7: 0971
            movi         a0, sdk_chip6_phy_init_ctrl           # 14b9: 01e8ff
            l8ui         a0, a0, 100 /* [sdk_chip6_phy_init_ctrl+0x64] */ # 14bc: 020064
            movi         a5, 0x60000a00                        # 14bf: 51e9ff
            extui        a0, a0, 0, 1                          # 14c2: 000004
            bnez         a0, .Lbr127                           # 14c5: 56d00b
            movi         a0, sdk_chip6_sleep_params            # 14c8: 01e6ff
            memw                                               # 14cb: c02000
            l32i         a4, a5, 0x350 /* [0x60000d50] */      # 14ce: 4225d4
            s32i         a3, sp, 20 /* arg1 -> [(local3)] */   # 14d1: 3951
            bbsi         a4, 31, .Lbr126                       # 14d3: f7f463
            memw                                               # 14d6: c02000
            l32i         a6, a5, 0x350 /* [0x60000d50] */      # 14d9: 6225d4
            movi         a7, sdk_loop_pwctrl_pwdet_error_accum_high_power # 14dc: 71e3ff
            extui        a6, a6, 24, 3                         # 14df: 606825
            bnez         a6, .Lbr126                           # 14e2: 564605
            l8ui         a7, a7, 4 /* [sdk_tx_pwctrl_set_chan_flag] */ # 14e5: 720704
            bnez         a7, .Lbr126                           # 14e8: 56e704
            l8ui         a8, a0, 78 /* [sdk_chip6_sleep_params+0x4e] */ # 14eb: 82004e
            s32i         a2, sp, 24 /* arg0 -> [(local4)] */   # 14ee: 2961
            bltui        a8, 7, .Lbr123                        # 14f0: b67802
            j            .Lbr128                               # 14f3: 862500
.Lbr123:    movi         a3, sdk_chip6_sleep_params            # 14f6: 31ddff
            addi         a2, a8, -1 /* [sdk_chip6_sleep_params+0x4e]-0x1 */ # 14f9: 0b28
            l16si        a4, a3, 12 /* [sdk_chip6_sleep_params+0xc] */ # 14fb: 429306
            l16si        a3, a3, 14 /* [sdk_chip6_sleep_params+0xe] */ # 14fe: 329307
            s32i         a4, sp, 16 /* [sdk_chip6_sleep_params+0xc] -> [(local2)] */ # 1501: 4941
            sub          a3, a3, a4                            # 1503: 4033c0
            mull         a2, a2, a3                            # 1506: 302282
            movi         a3, 5 /* 0x00000005 */                # 1509: 0c53
            call0        __divsi3                              # 150b: 01e4ffc0
                                                               # 150f: 0000
            l32i         a0, sp, 16 /* [(local2)] */           # 1511: 0841
            add          a0, a0, a2                            # 1513: 2a00
            j            .Lbr125                               # 1515: 460000
.Lbr124:    mov          a0, a9 /* [sdk_chip6_sleep_params+0x12] */ # 1518: 0d09
.Lbr125:    mov          a2, sp /* (FP)-0x20 */                # 151a: 2d01
            movi         a3, sdk_chip6_sleep_params+0x68       # 151c: 31d5ff
            slli         a4, a0, 16                            # 151f: 004011
            srai         a4, a4, 16                            # 1522: 404031
            call0        sdk_target_power_add_backoff          # 1525: 01deffc0
                                                               # 1529: 0000
            mov          a2, sp /* (FP)-0x20 */                # 152b: 2d01
            movi         a3, sdk_chip6_phy_init_ctrl+0x2a      # 152d: 31d1ff
            movi         a4, sdk_chip6_sleep_params+0x1cc      # 1530: 41d2ff
            l32i         a5, sp, 24 /* [(local4)] */           # 1533: 5861
            l32i         a6, sp, 20 /* [(local3)] */           # 1535: 6851
            call0        sdk_tx_pwctrl_cal                     # 1537: 050000
.Lbr126:    call0        sdk_tx_pwctrl_bg_init                 # 153a: 050000
            movi         a3, sdk_loop_pwctrl_pwdet_error_accum_high_power # 153d: 31cfff
            movi         a2, 0 /* 0x00000000 */                # 1540: 0c02
            movi         a0, sdk_g_phyFuns                     # 1542: 01cfff
            s8i          a2, a3, 4 /* 0x00 -> [sdk_tx_pwctrl_set_chan_flag] */ # 1545: 224304
            movi         a2, sdk_chip6_sleep_params+0x180      # 1548: 21cfff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 154b: 0800
            l8ui         a2, a2, 74 /* [sdk_chip6_sleep_params+0x1ca] */ # 154d: 22024a
            l32i         a0, a0, 0 /* [[sdk_g_phyFuns]] */     # 1550: 0800
            slli         a2, a2, 24                            # 1552: 802201
            srai         a2, a2, 24                            # 1555: 202831
            callx0       a0 /* [[sdk_g_phyFuns]] */            # 1558: c00000
            blti         a2, 8, .Lbr127                        # 155b: a68227
            movi         a2, 0 /* 0x00000000 */                # 155e: 0c02
            movi         a5, sdk_chip6_sleep_params+0x180      # 1560: 51caff
            movi         a4, 0 /* 0x00000000 */                # 1563: 0c04
            s8i          a4, a5, 74 /* 0x00 -> [sdk_chip6_sleep_params+0x1ca] */ # 1565: 42454a
            call0        sdk_periodic_cal_top                  # 1568: 01cfffc0
                                                               # 156c: 0000
            movi         a7, sdk_chip6_sleep_params            # 156e: 71c7ff
            l32i         a3, a7, 0x1d4 /* [sdk_chip6_sleep_params+0x1d4] */ # 1571: 322775
            l32i         a6, sp, 20 /* [(local3)] */           # 1574: 6851
            addi         a3, a3, 1 /* [sdk_chip6_sleep_params+0x1d4]+0x1 */ # 1576: 1b33
            s32i         a3, a7, 0x1d4 /* [sdk_chip6_sleep_params+0x1d4]+0x1 -> [sdk_chip6_sleep_params+0x1d4] */ # 1578: 326775
            beqz         a6, .Lbr127                           # 157b: 8c76
            movi         a2, .Lstr005                          # 157d: 21c4ff
            call0        ets_printf                            # 1580: 01caffc0
                                                               # 1584: 0000
.Lbr127:    l32i         a0, sp, 28 /* [(local5)] */           # 1586: 0871
            addi         sp, sp, 32 /* (top of frame) */       # 1588: 12c120
            ret                                                # 158b: 0df0
.Lbr128:    bgeui        a8, 12, .Lbr129                       # 158d: f6a822
            movi         a3, sdk_chip6_sleep_params            # 1590: 31c1ff
            addi         a2, a8, -6 /* [sdk_chip6_sleep_params+0x4e]-0x6 */ # 1593: 22c8fa
            l16si        a4, a3, 14 /* [sdk_chip6_sleep_params+0xe] */ # 1596: 429307
            l16si        a3, a3, 16 /* [sdk_chip6_sleep_params+0x10] */ # 1599: 329308
            s32i         a4, sp, 12 /* [sdk_chip6_sleep_params+0xe] -> [(local1)] */ # 159c: 4931
            sub          a3, a3, a4                            # 159e: 4033c0
            mull         a2, a2, a3                            # 15a1: 302282
            movi         a3, 5 /* 0x00000005 */                # 15a4: 0c53
            call0        __divsi3                              # 15a6: 01c1ffc0
                                                               # 15aa: 0000
            l32i         a0, sp, 12 /* [(local1)] */           # 15ac: 0831
            add          a0, a0, a2                            # 15ae: 2a00
            j            .Lbr125                               # 15b0: 86d9ff
.Lbr129:    l16si        a9, a0, 18 /* [sdk_chip6_sleep_params+0x12] */ # 15b3: 929009
            movi         a2, 13 /* 0x0000000d */               # 15b6: 0cd2
            bgeu         a2, a8, .Lbr130                       # 15b8: 87b202
            j            .Lbr124                               # 15bb: 46d6ff
.Lbr130:    movi         a3, sdk_chip6_sleep_params            # 15be: 31b6ff
            addx4        a2, a8, a8                            # 15c1: 8028a0
            addi         a2, a2, -55                           # 15c4: 22c2c9
            l16si        a3, a3, 16 /* [sdk_chip6_sleep_params+0x10] */ # 15c7: 329308
            s32i         a3, sp, 8 /* [sdk_chip6_sleep_params+0x10] -> [(local0)] */ # 15ca: 3921
            sub          a3, a9, a3                            # 15cc: 3039c0
            mull         a2, a2, a3                            # 15cf: 302282
            movi         a3, 22 /* 0x00000016 */               # 15d2: 1c63
            call0        __divsi3                              # 15d4: 01b7ffc0
                                                               # 15d8: 0000
            l32i         a0, sp, 8 /* [(local0)] */            # 15da: 0821
            add          a0, a0, a2                            # 15dc: 2a00
            j            .Lbr125                               # 15de: 06ceff

            .literal_position                                  # 15e4: 000a0060
                                                               # 15e8: 000f0000

# Function @ .irom0.text+0x15ec
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_read_sar_dout
            .type        sdk_read_sar_dout, @function
sdk_read_sar_dout:
            movi         a9, 0x60000a00                        # 15ec: 91feff
            movi         a8, 0x00000f00                        # 15ef: 81feff
            movi         a11, 0 /* 0x00000000 */               # 15f2: 0c0b
            addi         sp, sp, -16 /* (local0) */            # 15f4: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 15f7: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 15f9: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 15fb: d921
            movi         a0, 0 /* 0x00000000 */                # 15fd: 0c00
            movi         a13, 255 /* 0x000000ff */             # 15ff: d2a0ff
            movi         a12, -1 /* 0xffffffff */              # 1602: 7cfc
.Lbr131:    addx4        a6, a0, a9                            # 1604: 9060a0
            addx2        a7, a0, a2                            # 1607: 207090
            mov          a5, a13 /* 0x000000ff */              # 160a: 5d0d
            mov          a10, a11 /* 0x00000000 */             # 160c: ad0b
            memw                                               # 160e: c02000
            movi         a3, 279 /* 0x00000117 */              # 1611: 32a117
            l32i         a6, a6, 0x380                         # 1614: 6226e0
            addi         a0, a0, 1                             # 1617: 1b00
            extui        a0, a0, 0, 8                          # 1619: 000074
            xor          a6, a6, a12                           # 161c: c06630
            extui        a4, a6, 0, 8                          # 161f: 604074
            addi         a4, a4, -21                           # 1622: 42c4eb
            extui        a6, a6, 0, 11                         # 1625: 6060a4
            s16i         a6, a7, 0                             # 1628: 625700
            movgez       a10, a4, a4                           # 162b: 40a4b3
            mull         a10, a10, a3                          # 162e: 30aa82
            and          a3, a6, a8                            # 1631: 803610
            srai         a10, a10, 8                           # 1634: a0a821
            blt          a13, a10, .Lbr132                     # 1637: a72d01
            mov          a5, a10                               # 163a: 5d0a
.Lbr132:    add          a3, a5, a3                            # 163c: 3a35
            s16i         a3, a7, 0                             # 163e: 325700
            bnei         a0, 8, .Lbr131                        # 1641: 6680bf
            l32i         a12, sp, 4 /* [(local1)] */           # 1644: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 1646: d821
            l32i         a0, sp, 0 /* [(local0)] */            # 1648: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 164a: 12c110
            ret           /* arg0 */                           # 164d: 0df0

            .literal_position                                  # 1650: 000a0060
                                                               # 1654: 00000000

# Function @ .irom0.text+0x1658
# Local variables/stack:
#     (local0):  hword     @ -0x1e
#     (local1):  hword     @ -0x1c
#     (local2):  hword     @ -0x1a
#     (local3):  hword     @ -0x18
#     (local4):  hword     @ -0x16
#     (local5):  hword     @ -0x14
#     (local6):  hword     @ -0x12
#     (local7):  word      @ -0x10
#     (local8):  word      @ -0xc
#     (local9):  word[2]   @ -0x8
            .balign      4
            .global      sdk_ram_get_fm_sar_dout
            .type        sdk_ram_get_fm_sar_dout, @function
sdk_ram_get_fm_sar_dout:
            addi         sp, sp, -32 /* (FP)-0x20 */           # 1658: 12c1e0
            s32i         a0, sp, 24 /* a0 -> [(local9)] */     # 165b: 0961
            s32i         a3, sp, 16 /* arg1 -> [(local7)] */   # 165d: 3941
            s32i         a2, sp, 20 /* arg0 -> [(local8)] */   # 165f: 2951
            movi         a5, -3 /* 0xfffffffd */               # 1661: 7cd5
            movi         a2, 0x60000a00                        # 1663: 21fbff
            memw                                               # 1666: c02000
            l32i         a4, a2, 0x350 /* [0x60000d50] */      # 1669: 4222d4
            and          a4, a4, a5                            # 166c: 504410
            memw                                               # 166f: c02000
            s32i         a4, a2, 0x350 /* a4 -> [0x60000d50] */ # 1672: 4262d4
            movi         a3, 2 /* 0x00000002 */                # 1675: 0c23
            memw                                               # 1677: c02000
            l32i         a0, a2, 0x350 /* [0x60000d50] */      # 167a: 0222d4
            or           a0, a0, a3                            # 167d: 300020
            memw                                               # 1680: c02000
            s32i         a0, a2, 0x350 /* a0 -> [0x60000d50] */ # 1683: 0262d4
            movi         a2, 25 /* 0x00000019 */               # 1686: 1c92
            call0        sdk_ets_delay_us                      # 1688: 01f3ffc0
                                                               # 168c: 0000
            mov          a2, sp /* (FP)-0x20 */                # 168e: 2d01
            call0        sdk_read_sar_dout                     # 1690: 050000
            l32i         a2, sp, 20 /* [(local8)] */           # 1693: 2851
            l16ui        a0, sp, 6 /* [(local2)] */            # 1695: 021103
            l16ui        a4, sp, 4 /* [(local1)] */            # 1698: 421102
            l16ui        a3, sp, 2 /* [(local0)] */            # 169b: 321101
            l16ui        a9, sp, 14 /* [(local6)] */           # 169e: 921107
            l16ui        a7, sp, 10 /* [(local4)] */           # 16a1: 721105
            l16ui        a6, sp, 8 /* [(local3)] */            # 16a4: 621104
            l16ui        a8, sp, 12 /* [(local5)] */           # 16a7: 821106
            add          a6, a6, a7                            # 16aa: 7a66
            add          a8, a8, a9                            # 16ac: 9a88
            add          a3, a3, a4                            # 16ae: 4a33
            add          a0, a0, a3                            # 16b0: 3a00
            addx2        a8, a8, a8                            # 16b2: 808890
            addx2        a6, a6, a6                            # 16b5: 606690
            extui        a6, a6, 0, 16                         # 16b8: 6060f4
            extui        a7, a8, 0, 16                         # 16bb: 8070f4
            slli         a9, a0, 1                             # 16be: f09011
            extui        a9, a9, 0, 16                         # 16c1: 9090f4
            bltu         a9, a7, .Lbr133                       # 16c4: 773905
            subx2        a8, a0, a8                            # 16c7: 8080d0
            j            .Lbr134                               # 16ca: 460000
.Lbr133:    movi         a8, 0 /* 0x00000000 */                # 16cd: 0c08
.Lbr134:    s16i         a8, a2, 0 /* a8 -> [[(local8)]] */    # 16cf: 825200
            l32i         a0, sp, 16 /* [(local7)] */           # 16d2: 0841
            bltu         a6, a7, .Lbr135                       # 16d4: 773605
            sub          a2, a6, a7                            # 16d7: 7026c0
            j            .Lbr136                               # 16da: 460000
.Lbr135:    movi         a2, 0 /* 0x00000000 */                # 16dd: 0c02
.Lbr136:    s16i         a2, a0, 0 /* a2 -> [[(local7)]] */    # 16df: 225000
            l32i         a0, sp, 24 /* [(local9)] */           # 16e2: 0861
            addi         sp, sp, 32 /* (top of frame) */       # 16e4: 12c120
            ret                                                # 16e7: 0df0

            .literal_position                                  # 16ec: 00000000
                                                               # 16f0: 000a0060
                                                               # 16f4: 00000000
                                                               # 16f8: 00000000
                                                               # 16fc: f13c1101
                                                               # 1700: f33c1101
                                                               # 1704: 00000040
                                                               # 1708: 00000000
                                                               # 170c: f03c1101
                                                               # 1710: ffff0300
                                                               # 1714: 00960060
                                                               # 1718: 00000000

# Function @ .irom0.text+0x171c
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word      @ -0x3c
#     (local2):  word      @ -0x38
#     (local3):  word      @ -0x34
#     (local4):  word      @ -0x30
#     (local5):  word      @ -0x2c
#     (local6):  word      @ -0x28
#     (local7):  word      @ -0x24
#     (local8):  word      @ -0x20
#     (local9):  word      @ -0x1c
#     (local10): word      @ -0x18
#     (local11): word      @ -0x14
#     (local12): word      @ -0x10
#     (local13): word[3]   @ -0xc
            .balign      4
            .global      sdk_ram_cal_tos_v60
            .type        sdk_ram_cal_tos_v60, @function
sdk_ram_cal_tos_v60:
            extui        a4, a3, 0, 16                         # 171c: 3040f4
            addi         sp, sp, -64 /* (local0) */            # 171f: 12c1c0
            s32i         a12, sp, 24 /* a12 -> [(local6)] */   # 1722: c961
            s32i         a14, sp, 32 /* a14 -> [(local8)] */   # 1724: e981
            s32i         a15, sp, 36 /* a15 -> [(local9)] */   # 1726: f991
            s32i         a5, sp, 52 /* arg3 -> [(local13)] */  # 1728: 59d1
            s32i         a6, sp, 16 /* arg4 -> [(local4)] */   # 172a: 6941
            movi         a3, 1 /* 0x00000001 */                # 172c: 0c13
            s32i         a13, sp, 28 /* a13 -> [(local7)] */   # 172e: d971
            movi         a13, sdk_g_phyFuns                    # 1730: d1efff
            s32i         a0, sp, 20 /* a0 -> [(local5)] */     # 1733: 0951
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      # 1735: 080d
            s32i         a2, sp, 12 /* arg0 -> [(local3)] */   # 1737: 2931
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ # 1739: 02202b
            movi         a2, 0 /* 0x00000000 */                # 173c: 0c02
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       # 173e: c00000
            l32i         a2, sp, 52 /* [(local13)] */          # 1741: 28d1
            movi         a12, 0x60000a00                       # 1743: c1ebff
            beqz         a2, .Lbr146                           # 1746: 165212
            movi         a15, 64 /* 0x00000040 */              # 1749: 4c0f
            movi         a14, 1 /* 0x00000001 */               # 174b: 0c1e
            addi         a13, a2, -4 /* [(local13)]-0x4 */     # 174d: d2c2fc
            movi         a7, 64 /* 0x00000040 */               # 1750: 4c07
            movi         a8, 28 /* 0x0000001c */               # 1752: 1cc8
            movi         a9, 0 /* 0x00000000 */                # 1754: 0c09
            movi         a10, 0 /* 0x00000000 */               # 1756: 0c0a
            movi         a11, 0 /* 0x00000000 */               # 1758: 0c0b
            s32i         a11, sp, 8 /* 0x00000000 -> [(local2)] */ # 175a: b921
            s32i         a10, sp, 44 /* 0x00000000 -> [(local11)] */ # 175c: a9b1
            s32i         a9, sp, 48 /* 0x00000000 -> [(local12)] */ # 175e: 99c1
            s32i         a8, sp, 4 /* 0x0000001c -> [(local1)] */ # 1760: 8911
            s32i         a7, sp, 0 /* 0x00000040 -> [(local0)] */ # 1762: 7901
            s32i         a13, sp, 40 /* [(local13)]-0x4 -> [(local10)] */ # 1764: d9a1
            movi         a13, 0 /* 0x00000000 */               # 1766: 0c0d
.Lbr137:    movi         a2, 1 /* 0x00000001 */                # 1768: 0c12
            movi         a0, sdk_g_phyFuns                     # 176a: 01e2ff
            movi         a3, 2 /* 0x00000002 */                # 176d: 0c23
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 176f: 0800
            l32i         a4, sp, 0 /* [(local0)] */            # 1771: 4801
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ # 1773: 02202b
            extui        a4, a4, 0, 16                         # 1776: 4040f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       # 1779: c00000
            movi         a0, sdk_g_phyFuns                     # 177c: 01dfff
            movi         a2, 0 /* 0x00000000 */                # 177f: 0c02
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1781: 0800
            movi         a3, 2 /* 0x00000002 */                # 1783: 0c23
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ # 1785: 02202b
            extui        a4, a15, 0, 16                        # 1788: f040f4
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       # 178b: c00000
            memw                                               # 178e: c02000
            movi         a3, 0x01113cf1                        # 1791: 31daff
            s32i         a3, a12, 0x34c /* 0x01113cf1 -> [0x60000d4c] */ # 1794: 326cd3
            memw                                               # 1797: c02000
            movi         a2, 0x01113cf3                        # 179a: 21d9ff
            s32i         a2, a12, 0x34c /* 0x01113cf3 -> [0x60000d4c] */ # 179d: 226cd3
            movi         a2, 2 /* 0x00000002 */                # 17a0: 0c22
            call0        sdk_ets_delay_us                      # 17a2: 01ddffc0
                                                               # 17a6: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 17a8: 0801
            l32i         a3, sp, 4 /* [(local1)] */            # 17aa: 3811
            l32i         a8, sp, 8 /* [(local2)] */            # 17ac: 8821
            movi         a7, 0x40000000                        # 17ae: 71d5ff
            movi         a5, 127 /* 0x0000007f */              # 17b1: 52a07f
.Lbr138:    mov          a4, a13 /* 0x00000000 */              # 17b4: 4d0d
            memw                                               # 17b6: c02000
            l32i         a6, a12, 0x34c /* [0x60000d4c] */     # 17b9: 622cd3
            extui        a6, a6, 24, 8                         # 17bc: 606875
            moveqz       a4, a14, a6                           # 17bf: 604e83
            bnez         a4, .Lbr138                           # 17c2: 56e4fe
            memw                                               # 17c5: c02000
            l32i         a9, a12, 0x34c /* [0x60000d4c] */     # 17c8: 922cd3
            movi         a11, 1 /* 0x00000001 */               # 17cb: 0c1b
            extui        a9, a9, 31, 1                         # 17cd: 909f05
            xor          a9, a9, a11                           # 17d0: b09930
            memw                                               # 17d3: c02000
            l32i         a2, a12, 0x34c /* [0x60000d4c] */     # 17d6: 222cd3
            movi         a10, 0 /* 0x00000000 */               # 17d9: 0c0a
            and          a2, a2, a7                            # 17db: 702210
            moveqz       a10, a11, a2                          # 17de: 20ab83
            beqz         a9, .Lbr140                           # 17e1: 9c29
            mov          a9, a5 /* 0x0000007f */               # 17e3: 9d05
            add          a15, a3, a15                          # 17e5: faf3
            slli         a15, a15, 16                          # 17e7: 00ff11
            srai         a15, a15, 16                          # 17ea: f0f031
            blt          a5, a15, .Lbr139                      # 17ed: f72501
            mov          a9, a15                               # 17f0: 9d0f
.Lbr139:    mov          a15, a9                               # 17f2: fd09
            j            .Lbr141                               # 17f4: 460300
.Lbr140:    sub          a2, a15, a3                           # 17f7: 302fc0
            mov          a15, a13 /* 0x00000000 */             # 17fa: fd0d
            slli         a2, a2, 16                            # 17fc: 002211
            srai         a2, a2, 16                            # 17ff: 202031
            movgez       a15, a2, a2                           # 1802: 20f2b3
.Lbr141:    beqz         a10, .Lbr143                          # 1805: 9c2a
            mov          a9, a5 /* 0x0000007f */               # 1807: 9d05
            add          a0, a3, a0                            # 1809: 0a03
            slli         a0, a0, 16                            # 180b: 000011
            srai         a0, a0, 16                            # 180e: 000031
            blt          a5, a0, .Lbr142                       # 1811: 072501
            mov          a9, a0                                # 1814: 9d00
.Lbr142:    mov          a0, a9                                # 1816: 0d09
            j            .Lbr144                               # 1818: 460300
.Lbr143:    sub          a2, a0, a3                            # 181b: 3020c0
            mov          a0, a13 /* 0x00000000 */              # 181e: 0d0d
            slli         a2, a2, 16                            # 1820: 002211
            srai         a2, a2, 16                            # 1823: 202031
            movgez       a0, a2, a2                            # 1826: 2002b3
.Lbr144:    s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1829: 0901
            l32i         a4, sp, 40 /* [(local10)] */          # 182b: 48a1
            addi         a7, a3, -2 /* [(local1)]-0x2 */       # 182d: 72c3fe
            srai         a6, a3, 1                             # 1830: 306121
            addi         a6, a6, 1                             # 1833: 1b66
            movi         a3, 1 /* 0x00000001 */                # 1835: 0c13
            slli         a6, a6, 24                            # 1837: 806601
            srai         a6, a6, 24                            # 183a: 606831
            movnez       a3, a6, a7                            # 183d: 703693
            s32i         a3, sp, 4 /* a3 -> [(local1)] */      # 1840: 3911
            blt          a8, a4, .Lbr145                       # 1842: 472817
            l32i         a7, sp, 44 /* [(local11)] */          # 1845: 78b1
            l32i         a10, sp, 48 /* [(local12)] */         # 1847: a8c1
            add          a9, a7, a0                            # 1849: 0a97
            add          a11, a10, a15                         # 184b: faba
            slli         a11, a11, 16                          # 184d: 00bb11
            slli         a9, a9, 16                            # 1850: 009911
            srai         a7, a9, 16                            # 1853: 907031
            srai         a10, a11, 16                          # 1856: b0a031
            s32i         a10, sp, 48 /* a10 -> [(local12)] */  # 1859: a9c1
            s32i         a7, sp, 44 /* a7 -> [(local11)] */    # 185b: 79b1
.Lbr145:    l32i         a10, sp, 52 /* [(local13)] */         # 185d: a8d1
            addi         a8, a8, 1 /* [(local2)]+0x1 */        # 185f: 1b88
            extui        a8, a8, 0, 8                          # 1861: 808074
            s32i         a8, sp, 8 /* a8 -> [(local2)] */      # 1864: 8921
            sub          a10, a10, a8                          # 1866: 80aac0
            bnez         a10, .Lbr137                          # 1869: 56baef
            j            .Lbr147                               # 186c: c60100
.Lbr146:    movi         a9, 0 /* 0x00000000 */                # 186f: 0c09
            movi         a10, 0 /* 0x00000000 */               # 1871: 0c0a
            s32i         a10, sp, 44 /* 0x00000000 -> [(local11)] */ # 1873: a9b1
            s32i         a9, sp, 48 /* 0x00000000 -> [(local12)] */ # 1875: 99c1
.Lbr147:    movi         a2, 1 /* 0x00000001 */                # 1877: 0c12
            movi         a3, 2 /* 0x00000002 */                # 1879: 0c23
            l32i         a15, sp, 44 /* [(local11)] */         # 187b: f8b1
            movi         a13, sdk_g_phyFuns                    # 187d: d1a2ff
            addi         a15, a15, 2 /* [(local11)]+0x2 */     # 1880: 2bff
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      # 1882: 080d
            extui        a4, a15, 2, 16                        # 1884: f042f4
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ # 1887: 02202b
            srai         a15, a15, 2                           # 188a: f0f221
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       # 188d: c00000
            movi         a2, 0 /* 0x00000000 */                # 1890: 0c02
            movi         a3, 2 /* 0x00000002 */                # 1892: 0c23
            l32i         a14, sp, 48 /* [(local12)] */         # 1894: e8c1
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      # 1896: 080d
            addi         a14, a14, 2 /* [(local12)]+0x2 */     # 1898: 2bee
            extui        a4, a14, 2, 16                        # 189a: e042f4
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ # 189d: 02202b
            srai         a14, a14, 2                           # 18a0: e0e221
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       # 18a3: c00000
            movi         a2, 1 /* 0x00000001 */                # 18a6: 0c12
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      # 18a8: 080d
            movi         a3, 1 /* 0x00000001 */                # 18aa: 0c13
            l32i         a0, a0, 172 /* [[sdk_g_phyFuns]+0xac] */ # 18ac: 02202b
            movi         a4, 127 /* 0x0000007f */              # 18af: 42a07f
            callx0       a0 /* [[sdk_g_phyFuns]+0xac] */       # 18b2: c00000
            movi         a4, 0x01113cf0                        # 18b5: 4195ff
            memw                                               # 18b8: c02000
            l32i         a2, sp, 12 /* [(local3)] */           # 18bb: 2831
            l32i         a3, sp, 16 /* [(local4)] */           # 18bd: 3841
            s32i         a4, a12, 0x34c /* 0x01113cf0 -> [0x60000d4c] */ # 18bf: 426cd3
            s8i          a14, a3, 0 /* a14 -> [[(local4)]] */  # 18c2: e24300
            s8i          a15, a3, 1 /* a15 -> [[(local4)]+0x1] */ # 18c5: f24301
            beqz         a2, .Lbr148                           # 18c8: 9cf2
            movi         a9, 0x0003ffff                        # 18ca: 9191ff
            slli         a7, a14, 18                           # 18cd: e07e01
            slli         a8, a15, 25                           # 18d0: 708f01
            movi         a6, 0x60009600                        # 18d3: 6190ff
            memw                                               # 18d6: c02000
            l32i         a5, a6, 0x264 /* [0x60009864] */      # 18d9: 522699
            and          a5, a5, a9                            # 18dc: 905510
            or           a5, a5, a8                            # 18df: 805520
            or           a5, a5, a7                            # 18e2: 705520
            memw                                               # 18e5: c02000
            s32i         a5, a6, 0x264 /* a5 -> [0x60009864] */ # 18e8: 526699
.Lbr148:    l32i         a12, sp, 24 /* [(local6)] */          # 18eb: c861
            l32i         a13, sp, 28 /* [(local7)] */          # 18ed: d871
            l32i         a14, sp, 32 /* [(local8)] */          # 18ef: e881
            l32i         a15, sp, 36 /* [(local9)] */          # 18f1: f891
            l32i         a0, sp, 20 /* [(local5)] */           # 18f3: 0851
            addi         sp, sp, 64 /* (top of frame) */       # 18f5: 12c140
            ret           /* [(local3)] */                     # 18f8: 0df0

            .balign      4
# Function @ .irom0.text+0x18fc
            .balign      4
            .global      sdk_ram_get_bb_atten
            .type        sdk_ram_get_bb_atten, @function
sdk_ram_get_bb_atten:
            movi         a4, 0 /* 0x00000000 */                # 18fc: 0c04
            addi         a5, a2, 8 /* arg0+0x8 */              # 18fe: 8b52
            movi         a2, 127 /* 0x0000007f */              # 1900: 22a07f
            subx4        a5, a5, a3                            # 1903: 3055e0
            slli         a5, a5, 16                            # 1906: 005511
            srai         a5, a5, 16                            # 1909: 505031
            movgez       a4, a5, a5                            # 190c: 5045b3
            slli         a4, a4, 16                            # 190f: 004411
            srai         a3, a4, 16                            # 1912: 403031
            bgei         a3, 128, .Lbr149                      # 1915: e6e301
            mov          a2, a3                                # 1918: 2d03
.Lbr149:    slli         a2, a2, 24                            # 191a: 802201
            srai         a2, a2, 24                            # 191d: 202831
            ret                                                # 1920: 0df0

            .literal_position                                  # 1924: 00000000
                                                               # 1928: 00000000
                                                               # 192c: 00000000
                                                               # 1930: 00000000
                                                               # 1934: 00000000
                                                               # 1938: 00000000
                                                               # 193c: c8000000
                                                               # 1940: e4000000
                                                               # 1944: 00000000
                                                               # 1948: 00000000
                                                               # 194c: 00000000
                                                               # 1950: 00000000
                                                               # 1954: 00000000
                                                               # 1958: 00000000

# Function @ .irom0.text+0x195c
# Local variables/stack:
#     (local0):  word      @ -0x50
#     (local1):  word      @ -0x4c
#     (local2):  word[2]   @ -0x48
#     (local3):  byte[4]   @ -0x40
#     (local4):  word      @ -0x3c
#     (local5):  word      @ -0x38
#     (local6):  word      @ -0x34
#     (local7):  word      @ -0x30
#     (local8):  word      @ -0x2c
#     (local9):  word      @ -0x28
#     (local10): word      @ -0x24
#     (local11): word      @ -0x20
#     (local12): word      @ -0x1c
#     (local13): word      @ -0x18
#     (local14): word      @ -0x14
#     (local15): word[4]   @ -0x10
            .balign      4
            .global      sdk_ram_rfcal_txcap
            .type        sdk_ram_rfcal_txcap, @function
sdk_ram_rfcal_txcap:
            movi         a7, 0 /* 0x00000000 */                # 195c: 0c07
            addi         sp, sp, -80 /* (local0) */            # 195e: 12c1b0
            s32i         a14, sp, 32 /* a14 -> [(local7)] */   # 1961: e981
            s32i         a15, sp, 36 /* a15 -> [(local8)] */   # 1963: f991
            s32i         a13, sp, 28 /* a13 -> [(local6)] */   # 1965: d971
            s32i         a0, sp, 20 /* a0 -> [(local4)] */     # 1967: 0951
            s32i         a12, sp, 24 /* a12 -> [(local5)] */   # 1969: c961
            s32i         a6, sp, 40 /* arg4 -> [(local9)] */   # 196b: 69a1
            s32i         a4, sp, 56 /* arg2 -> [(local13)] */  # 196d: 49e1
            s32i         a5, sp, 64 /* arg3 -> [(local15)] */  # 196f: 526110
            movi         a4, 9 /* 0x00000009 */                # 1972: 0c94
            movi         a5, 7 /* 0x00000007 */                # 1974: 0c75
            movi         a6, 0 /* 0x00000000 */                # 1976: 0c06
            mov          a12, a3 /* arg1 */                    # 1978: cd03
            movi         a0, sdk_g_phyFuns                     # 197a: 01eaff
            mov          a13, a2 /* arg0 */                    # 197d: dd02
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 197f: 0800
            movi         a2, 119 /* 0x00000077 */              # 1981: 22a077
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 1984: 022027
            movi         a3, 0 /* 0x00000000 */                # 1987: 0c03
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 1989: c00000
            mov          a4, a12 /* arg1 */                    # 198c: 4d0c
            mov          a3, a13 /* arg0 */                    # 198e: 3d0d
            movi         a5, 0 /* 0x00000000 */                # 1990: 0c05
            movi         a6, 0 /* 0x00000000 */                # 1992: 0c06
            movi         a0, sdk_g_phyFuns                     # 1994: 01e5ff
            movi         a2, 0 /* 0x00000000 */                # 1997: 0c02
            s32i         a2, sp, 0 /* 0x00000000 -> [(local0)] */ # 1999: 2901
            s32i         a2, sp, 4 /* 0x00000000 -> [(local1)] */ # 199b: 2911
            s32i         a2, sp, 8 /* 0x00000000 -> [(local2)] */ # 199d: 2921
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 199f: 0800
            movi         a7, 0 /* 0x00000000 */                # 19a1: 0c07
            l32i         a0, a0, 104 /* [[sdk_g_phyFuns]+0x68] */ # 19a3: 02201a
            movi         a2, 1 /* 0x00000001 */                # 19a6: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x68] */       # 19a8: c00000
            movi         a12, 0 /* 0x00000000 */               # 19ab: 0c0c
            movi         a3, 3 /* 0x00000003 */                # 19ad: 0c33
            l8ui         a5, sp, 16 /* [(local3)] */           # 19af: 520110
            s32i         a5, sp, 44 /* [(local3)] -> [(local10)] */ # 19b2: 59b1
            s32i         a3, sp, 48 /* 0x00000003 -> [(local11)] */ # 19b4: 39c1
.Lbr150:    movi         a13, 0 /* 0x00000000 */               # 19b6: 0c0d
            movi         a15, 0 /* 0x00000000 */               # 19b8: 0c0f
            l32i         a9, sp, 40 /* [(local9)] */           # 19ba: 98a1
            movi         a8, 0 /* 0x00000000 */                # 19bc: 0c08
            beqz         a12, .Lbr151                          # 19be: 8c4c
            beqi         a12, 1, .Lbr152                       # 19c0: 261c09
            bnei         a12, 2, .Lbr153                       # 19c3: 662c0a
.Lbr151:    movi         a6, 7 /* 0x00000007 */                # 19c6: 0c76
            s32i         a6, sp, 44 /* 0x00000007 -> [(local10)] */ # 19c8: 69b1
            j            .Lbr153                               # 19ca: c60000
.Lbr152:    movi         a7, 15 /* 0x0000000f */               # 19cd: 0cf7
            s32i         a7, sp, 44 /* 0x0000000f -> [(local10)] */ # 19cf: 79b1
.Lbr153:    l32i         a10, sp, 44 /* [(local10)] */         # 19d1: a8b1
            add          a9, a9, a12                           # 19d3: ca99
            s32i         a9, sp, 52 /* a9 -> [(local12)] */    # 19d5: 99d1
            s8i          a8, a9, 0                             # 19d7: 824900
            addi         a10, a10, 1 /* [(local10)]+0x1 */     # 19da: 1baa
            s32i         a10, sp, 60 /* [(local10)]+0x1 -> [(local14)] */ # 19dc: a9f1
.Lbr154:    beqz         a12, .Lbr156                          # 19de: bcac
            beqi         a12, 1, .Lbr155                       # 19e0: 261c1d
            bnei         a12, 2, .Lbr157                       # 19e3: 662c53
            movi         a2, 107 /* 0x0000006b */              # 19e6: 22a06b
            movi         a3, 2 /* 0x00000002 */                # 19e9: 0c23
            movi         a4, 2 /* 0x00000002 */                # 19eb: 0c24
            movi         a0, sdk_g_phyFuns                     # 19ed: 01cfff
            movi         a5, 6 /* 0x00000006 */                # 19f0: 0c65
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 19f2: 0800
            movi         a6, 4 /* 0x00000004 */                # 19f4: 0c46
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 19f6: 022027
            mov          a7, a13                               # 19f9: 7d0d
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 19fb: c00000
            j            .Lbr157                               # 19fe: 060e00
.Lbr155:    movi         a2, 107 /* 0x0000006b */              # 1a01: 22a06b
            movi         a3, 2 /* 0x00000002 */                # 1a04: 0c23
            movi         a4, 2 /* 0x00000002 */                # 1a06: 0c24
            movi         a0, sdk_g_phyFuns                     # 1a08: 01caff
            movi         a5, 3 /* 0x00000003 */                # 1a0b: 0c35
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1a0d: 0800
            movi         a6, 0 /* 0x00000000 */                # 1a0f: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 1a11: 022027
            mov          a7, a13                               # 1a14: 7d0d
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 1a16: c00000
            j            .Lbr157                               # 1a19: 460700
.Lbr156:    movi         a2, 107 /* 0x0000006b */              # 1a1c: 22a06b
            movi         a3, 2 /* 0x00000002 */                # 1a1f: 0c23
            movi         a4, 1 /* 0x00000001 */                # 1a21: 0c14
            movi         a5, 3 /* 0x00000003 */                # 1a23: 0c35
            movi         a6, 0 /* 0x00000000 */                # 1a25: 0c06
            movi         a0, sdk_g_phyFuns                     # 1a27: 01c3ff
            movi         a7, 1 /* 0x00000001 */                # 1a2a: 0c17
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1a2c: 0800
            addx2        a7, a13, a7                           # 1a2e: 707d90
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 1a31: 022027
            extui        a7, a7, 0, 8                          # 1a34: 707074
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 1a37: c00000
.Lbr157:    movi         a0, sdk_g_phyFuns                     # 1a3a: 01bfff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1a3d: 0800
            l32i         a2, sp, 56 /* [(local13)] */          # 1a3f: 28e1
            l32i         a0, a0, 112 /* [[sdk_g_phyFuns]+0x70] */ # 1a41: 02201c
            movi         a3, 10 /* 0x0000000a */               # 1a44: 0ca3
            callx0       a0 /* [[sdk_g_phyFuns]+0x70] */       # 1a46: c00000
            mov          a14, a2                               # 1a49: ed02
            l32i         a2, sp, 64 /* [(local15)] */          # 1a4b: 222110
            beqz         a2, .Lbr158                           # 1a4e: 8cb2
            movi         a2, .Lstr006                          # 1a50: 21bbff
            mov          a3, a13                               # 1a53: 3d0d
            mov          a4, a14                               # 1a55: 4d0e
            call0        ets_printf                            # 1a57: 01bfffc0
                                                               # 1a5b: 0000
.Lbr158:    bge          a15, a14, .Lbr159                     # 1a5d: e7af0e
            mov          a15, a14                              # 1a60: fd0e
            l32i         a4, sp, 52 /* [(local12)] */          # 1a62: 48d1
            movi         a3, 1 /* 0x00000001 */                # 1a64: 0c13
            addx2        a3, a13, a3                           # 1a66: 303d90
            movnez       a3, a13, a12                          # 1a69: c03d93
            s8i          a3, a4, 0 /* a3 -> [[(local12)]] */   # 1a6c: 324400
.Lbr159:    l32i         a4, sp, 60 /* [(local14)] */          # 1a6f: 48f1
            addi         a13, a13, 1                           # 1a71: 1bdd
            extui        a13, a13, 0, 8                        # 1a73: d0d074
            sub          a4, a4, a13                           # 1a76: d044c0
            bnez         a4, .Lbr154                           # 1a79: 5614f6
            l32i         a14, sp, 64 /* [(local15)] */         # 1a7c: e22110
            beqz         a14, .Lbr160                          # 1a7f: 8cee
            movi         a2, .Lstr007                          # 1a81: 21afff
            l32i         a4, sp, 52 /* [(local12)] */          # 1a84: 48d1
            mov          a3, a12                               # 1a86: 3d0c
            l8ui         a4, a4, 0 /* [[(local12)]] */         # 1a88: 420400
            call0        ets_printf                            # 1a8b: 01b3ffc0
                                                               # 1a8f: 0000
.Lbr160:    beqz         a12, .Lbr161                          # 1a91: ac2c
            beqi         a12, 1, .Lbr163                       # 1a93: 261c65
            bnei         a12, 2, .Lbr162                       # 1a96: 662c38
            movi         a2, 107 /* 0x0000006b */              # 1a99: 22a06b
            movi         a3, 2 /* 0x00000002 */                # 1a9c: 0c23
            movi         a4, 2 /* 0x00000002 */                # 1a9e: 0c24
            movi         a5, 6 /* 0x00000006 */                # 1aa0: 0c65
            movi         a0, sdk_g_phyFuns                     # 1aa2: 01a8ff
            movi         a6, 4 /* 0x00000004 */                # 1aa5: 0c46
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1aa7: 0800
            l32i         a7, sp, 52 /* [(local12)] */          # 1aa9: 78d1
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 1aab: 022027
            l8ui         a7, a7, 0 /* [[(local12)]] */         # 1aae: 720700
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 1ab1: c00000
            j            .Lbr162                               # 1ab4: 860600
.Lbr161:    movi         a2, 107 /* 0x0000006b */              # 1ab7: 22a06b
            movi         a3, 2 /* 0x00000002 */                # 1aba: 0c23
            movi         a4, 1 /* 0x00000001 */                # 1abc: 0c14
            movi         a5, 3 /* 0x00000003 */                # 1abe: 0c35
            movi         a0, sdk_g_phyFuns                     # 1ac0: 01a2ff
            movi         a6, 0 /* 0x00000000 */                # 1ac3: 0c06
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1ac5: 0800
            l32i         a7, sp, 52 /* [(local12)] */          # 1ac7: 78d1
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 1ac9: 022027
            l8ui         a7, a7, 0 /* [[(local12)]] */         # 1acc: 720700
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 1acf: c00000
.Lbr162:    l32i         a2, sp, 48 /* [(local11)] */          # 1ad2: 28c1
            addi         a12, a12, 1                           # 1ad4: 1bcc
            extui        a12, a12, 0, 8                        # 1ad6: c0c074
            addi         a2, a2, -1 /* [(local11)]-0x1 */      # 1ad9: 0b22
            s32i         a2, sp, 48 /* [(local11)]-0x1 -> [(local11)] */ # 1adb: 29c1
            bnez         a2, .Lbr150                           # 1add: 5652ed
            movi         a0, sdk_g_phyFuns                     # 1ae0: 019bff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1ae3: 0800
            l32i         a0, a0, 108 /* [[sdk_g_phyFuns]+0x6c] */ # 1ae5: 02201b
            movi         a2, 1 /* 0x00000001 */                # 1ae8: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x6c] */       # 1aea: c00000
            l32i         a12, sp, 24 /* [(local5)] */          # 1aed: c861
            l32i         a13, sp, 28 /* [(local6)] */          # 1aef: d871
            l32i         a14, sp, 32 /* [(local7)] */          # 1af1: e881
            l32i         a15, sp, 36 /* [(local8)] */          # 1af3: f891
            l32i         a0, sp, 20 /* [(local4)] */           # 1af5: 0851
            addi         sp, sp, 80 /* (top of frame) */       # 1af7: 12c150
            ret                                                # 1afa: 0df0
.Lbr163:    movi         a2, 107 /* 0x0000006b */              # 1afc: 22a06b
            movi         a3, 2 /* 0x00000002 */                # 1aff: 0c23
            movi         a4, 2 /* 0x00000002 */                # 1b01: 0c24
            movi         a5, 3 /* 0x00000003 */                # 1b03: 0c35
            movi         a0, sdk_g_phyFuns                     # 1b05: 0192ff
            movi         a6, 0 /* 0x00000000 */                # 1b08: 0c06
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1b0a: 0800
            l32i         a7, sp, 52 /* [(local12)] */          # 1b0c: 78d1
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 1b0e: 022027
            l8ui         a7, a7, 0 /* [[(local12)]] */         # 1b11: 720700
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 1b14: c00000
            j            .Lbr162                               # 1b17: c6edff

            .literal_position                                  # 1b1c: 00000000
                                                               # 1b20: 00000000
                                                               # 1b24: 00000000
                                                               # 1b28: 00000000
                                                               # 1b2c: fc000000
                                                               # 1b30: 00000000
                                                               # 1b34: 00000000
                                                               # 1b38: 00000000
                                                               # 1b3c: 00000000

# Function @ .irom0.text+0x1b40
# Local variables/stack:
#     (local0):  word      @ -0x60
#     (local1):  word      @ -0x5c
#     (local2):  word[2]   @ -0x58
#     (local3):  word      @ -0x50
#     (local4):  word      @ -0x4c
#     (local5):  word      @ -0x48
#     (local6):  word      @ -0x44
#     (local7):  word      @ -0x40
#     (local8):  word      @ -0x3c
#     (local9):  word      @ -0x38
#     (local10): word      @ -0x34
#     (local11): word      @ -0x30
#     (local12): word      @ -0x2c
#     (local13): word      @ -0x28
#     (local14): word      @ -0x24
#     (local15): word      @ -0x20
#     (local16): word      @ -0x1c
#     (local17): word      @ -0x18
#     (local18): word      @ -0x14
#     (local19): word      @ -0x10
#     (local20): word[3]   @ -0xc
            .balign      4
            .global      sdk_ram_rfcal_pwrctrl
            .type        sdk_ram_rfcal_pwrctrl, @function
sdk_ram_rfcal_pwrctrl:
            addi         sp, sp, -96 /* (local0) */            # 1b40: 12c1a0
            s32i         a15, sp, 32 /* a15 -> [(local7)] */   # 1b43: f981
            s32i         a0, sp, 16 /* a0 -> [(local3)] */     # 1b45: 0941
            s32i         a13, sp, 24 /* a13 -> [(local5)] */   # 1b47: d961
            s32i         a12, sp, 20 /* a12 -> [(local4)] */   # 1b49: c951
            s32i         a14, sp, 28 /* a14 -> [(local6)] */   # 1b4b: e971
            s32i         a7, sp, 52 /* arg5 -> [(local12)] */  # 1b4d: 79d1
            s32i         a5, sp, 56 /* arg3 -> [(local13)] */  # 1b4f: 59e1
            s32i         a3, sp, 44 /* arg1 -> [(local10)] */  # 1b51: 39b1
            s32i         a4, sp, 48 /* arg2 -> [(local11)] */  # 1b53: 49c1
            movi         a3, 0 /* 0x00000000 */                # 1b55: 0c03
            movi         a4, 9 /* 0x00000009 */                # 1b57: 0c94
            movi         a5, 7 /* 0x00000007 */                # 1b59: 0c75
            movi         a7, 0 /* 0x00000000 */                # 1b5b: 0c07
            mov          a14, a6 /* arg4 */                    # 1b5d: ed06
            movi         a12, sdk_g_phyFuns                    # 1b5f: c1efff
            mov          a13, a2 /* arg0 */                    # 1b62: dd02
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 1b64: 080c
            movi         a2, 119 /* 0x00000077 */              # 1b66: 22a077
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 1b69: 022027
            movi         a6, 0 /* 0x00000000 */                # 1b6c: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 1b6e: c00000
            l32i         a2, sp, 48 /* [(local11)] */          # 1b71: 28c1
            beqz         a2, .Lbr174                           # 1b73: 167215
            movi         a15, -128 /* 0xffffff80 */            # 1b76: f2af80
            movi         a11, 0 /* 0x00000000 */               # 1b79: 0c0b
            extui        a6, a14, 0, 3                         # 1b7b: e06024
            extui        a5, a14, 3, 2                         # 1b7e: e05314
            s32i         a13, sp, 36 /* arg0 -> [(local8)] */  # 1b81: d991
            l16ui        a3, sp, 96 /* [(local21)] */          # 1b83: 321130
            l8ui         a4, sp, 100 /* [(FP)+0x4] */          # 1b86: 420164
            movi         a8, 0 /* 0x00000000 */                # 1b89: 0c08
            s32i         a8, sp, 84 /* 0x00000000 -> [(local20)] */ # 1b8b: 826115
            s32i         a4, sp, 40 /* [(FP)+0x4] -> [(local9)] */ # 1b8e: 49a1
            s32i         a3, sp, 80 /* [(local21)] -> [(local19)] */ # 1b90: 326114
            movi         a13, 127 /* 0x0000007f */             # 1b93: d2a07f
            addx2        a5, a5, a5                            # 1b96: 505590
            movi         a14, 0 /* 0x00000000 */               # 1b99: 0c0e
            addx2        a5, a5, a6                            # 1b9b: 605590
            extui        a5, a5, 0, 8                          # 1b9e: 505074
            s32i         a5, sp, 60 /* a5 -> [(local14)] */    # 1ba1: 59f1
.Lbr164:    l32i         a10, sp, 84 /* [(local20)] */         # 1ba3: a22115
            l32i         a9, sp, 44 /* [(local10)] */          # 1ba6: 98b1
            s32i         a11, sp, 72 /* 0x00000000 -> [(local17)] */ # 1ba8: b26112
            add          a9, a9, a10                           # 1bab: aa99
            l32i         a10, sp, 56 /* [(local13)] */         # 1bad: a8e1
            l8ui         a9, a9, 0                             # 1baf: 920900
            s32i         a9, sp, 68 /* a9 -> [(local16)] */    # 1bb2: 926111
            sub          a9, a9, a10                           # 1bb5: a099c0
            s32i         a9, sp, 64 /* a9 -> [(local15)] */    # 1bb8: 926110
.Lbr165:    l32i         a3, sp, 64 /* [(local15)] */          # 1bbb: 322110
            l32i         a2, sp, 60 /* [(local14)] */          # 1bbe: 28f1
            sub          a3, a3, a14                           # 1bc0: e033c0
            slli         a3, a3, 24                            # 1bc3: 803301
            srai         a3, a3, 24                            # 1bc6: 303831
            call0        sdk_ram_get_bb_atten                  # 1bc9: 050000
            movi         a0, 0 /* 0x00000000 */                # 1bcc: 0c00
            movgez       a0, a2, a2                            # 1bce: 2002b3
            slli         a12, a0, 24                           # 1bd1: 80c001
            srai         a12, a12, 24                          # 1bd4: c0c831
            bge          a13, a12, .Lbr166                     # 1bd7: c7ad04
            addi         a12, a13, -1                          # 1bda: 0bcd
            j            .Lbr167                               # 1bdc: 060100
.Lbr166:    bge          a12, a15, .Lbr167                     # 1bdf: f7ac01
            addi         a12, a15, 1                           # 1be2: 1bcf
.Lbr167:    movi         a2, 1 /* 0x00000001 */                # 1be4: 0c12
            l32i         a3, sp, 36 /* [(local8)] */           # 1be6: 3891
            extui        a4, a12, 0, 8                         # 1be8: c04074
            movi         a5, 0 /* 0x00000000 */                # 1beb: 0c05
            movi         a0, sdk_g_phyFuns                     # 1bed: 01ccff
            movi         a6, 0 /* 0x00000000 */                # 1bf0: 0c06
            s32i         a6, sp, 0 /* 0x00000000 -> [(local0)] */ # 1bf2: 6901
            s32i         a6, sp, 4 /* 0x00000000 -> [(local1)] */ # 1bf4: 6911
            s32i         a6, sp, 8 /* 0x00000000 -> [(local2)] */ # 1bf6: 6921
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1bf8: 0800
            movi         a7, 0 /* 0x00000000 */                # 1bfa: 0c07
            l32i         a0, a0, 104 /* [[sdk_g_phyFuns]+0x68] */ # 1bfc: 02201a
            movi         a6, 0 /* 0x00000000 */                # 1bff: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x68] */       # 1c01: c00000
            movi         a0, sdk_g_phyFuns                     # 1c04: 01c8ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1c07: 0800
            l32i         a0, a0, 44 /* [[sdk_g_phyFuns]+0x2c] */ # 1c09: 08b0
            l32i         a2, sp, 80 /* [(local19)] */          # 1c0b: 222114
            callx0       a0 /* [[sdk_g_phyFuns]+0x2c] */       # 1c0e: c00000
            movi         a0, sdk_g_phyFuns                     # 1c11: 01c5ff
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 1c14: 0800
            s32i         a2, sp, 76 /* a2 -> [(local18)] */    # 1c16: 226113
            l32i         a0, a0, 44 /* [[sdk_g_phyFuns]+0x2c] */ # 1c19: 08b0
            l32i         a2, sp, 80 /* [(local19)] */          # 1c1b: 222114
            callx0       a0 /* [[sdk_g_phyFuns]+0x2c] */       # 1c1e: c00000
            l32i         a0, sp, 76 /* [(local18)] */          # 1c21: 022113
            l32i         a6, sp, 68 /* [(local16)] */          # 1c24: 622111
            add          a0, a0, a2                            # 1c27: 2a00
            slli         a0, a0, 16                            # 1c29: 000011
            srai         a0, a0, 16                            # 1c2c: 000031
            addi         a0, a0, 4                             # 1c2f: 4b00
            srai         a0, a0, 3                             # 1c31: 000321
            sub          a6, a0, a6                            # 1c34: 6060c0
            slli         a6, a6, 16                            # 1c37: 006611
            srai         a6, a6, 16                            # 1c3a: 606031
            bgei         a6, 1, .Lbr168                        # 1c3d: e61608
            slli         a13, a12, 24                          # 1c40: 80dc01
            srai         a13, a13, 24                          # 1c43: d0d831
            j            .Lbr169                               # 1c46: 460100
.Lbr168:    slli         a15, a12, 24                          # 1c49: 80fc01
            srai         a15, a15, 24                          # 1c4c: f0f831
.Lbr169:    beqz         a6, .Lbr171                           # 1c4f: ac46
            beqi         a6, -1, .Lbr171                       # 1c51: 260622
            slli         a2, a12, 24                           # 1c54: 802c01
            srai         a2, a2, 24                            # 1c57: 202831
            bnez         a2, .Lbr170                           # 1c5a: cc12
            bltz         a6, .Lbr171                           # 1c5c: 967601
.Lbr170:    addi         a3, a15, 1                            # 1c5f: 1b3f
            beq          a13, a3, .Lbr171                      # 1c61: 371d12
            l32i         a4, sp, 72 /* [(local17)] */          # 1c64: 422112
            add          a14, a6, a14                          # 1c67: eae6
            addi         a5, a4, 1 /* [(local17)]+0x1 */       # 1c69: 1b54
            extui        a4, a5, 0, 8                          # 1c6b: 504074
            s32i         a4, sp, 72 /* a4 -> [(local17)] */    # 1c6e: 426112
            addi         a4, a4, -10                           # 1c71: 42c4f6
            bnez         a4, .Lbr165                           # 1c74: 5634f4
.Lbr171:    l32i         a9, sp, 40 /* [(local9)] */           # 1c77: 98a1
            l32i         a11, sp, 84 /* [(local20)] */         # 1c79: b22115
            l32i         a7, sp, 56 /* [(local13)] */          # 1c7c: 78e1
            l32i         a10, sp, 52 /* [(local12)] */         # 1c7e: a8d1
            sub          a7, a12, a7                           # 1c80: 707cc0
            add          a10, a10, a11                         # 1c83: baaa
            slli         a6, a7, 24                            # 1c85: 806701
            srai         a6, a6, 24                            # 1c88: 606831
            s8i          a7, a10, 0                            # 1c8b: 724a00
            movi         a7, -24 /* 0xffffffe8 */              # 1c8e: 6c87
            bge          a6, a7, .Lbr172                       # 1c90: 77a606
            movi         a6, -24 /* 0xffffffe8 */              # 1c93: 6c86
            movi         a8, -24 /* 0xffffffe8 */              # 1c95: 6c88
            s8i          a8, a10, 0                            # 1c97: 824a00
.Lbr172:    beqz         a9, .Lbr173                           # 1c9a: 9c39
            l32i         a4, sp, 68 /* [(local16)] */          # 1c9c: 422111
            movi         a2, .Lstr008                          # 1c9f: 21a3ff
            l32i         a3, sp, 84 /* [(local20)] */          # 1ca2: 322115
            slli         a5, a0, 24                            # 1ca5: 805001
            srai         a5, a5, 24                            # 1ca8: 505831
            call0        ets_printf                            # 1cab: 01a4ffc0
                                                               # 1caf: 0000
.Lbr173:    movi         a15, -128 /* 0xffffff80 */            # 1cb1: f2af80
            movi         a13, 127 /* 0x0000007f */             # 1cb4: d2a07f
            movi         a14, 0 /* 0x00000000 */               # 1cb7: 0c0e
            movi         a11, 0 /* 0x00000000 */               # 1cb9: 0c0b
            l32i         a7, sp, 84 /* [(local20)] */          # 1cbb: 722115
            l32i         a6, sp, 48 /* [(local11)] */          # 1cbe: 68c1
            addi         a8, a7, 1 /* [(local20)]+0x1 */       # 1cc0: 1b87
            extui        a7, a8, 0, 8                          # 1cc2: 807074
            s32i         a7, sp, 84 /* a7 -> [(local20)] */    # 1cc5: 726115
            sub          a6, a6, a7                            # 1cc8: 7066c0
            bnez         a6, .Lbr164                           # 1ccb: 5646ed
.Lbr174:    movi         a12, sdk_g_phyFuns                    # 1cce: c198ff
            movi         a9, 50 /* 0x00000032 */               # 1cd1: 3c29
            l32i         a3, sp, 52 /* [(local12)] */          # 1cd3: 38d1
            l32i         a2, sp, 48 /* [(local11)] */          # 1cd5: 28c1
            l8ui         a10, a3, 0 /* [[(local12)]] */        # 1cd7: a20300
            add          a2, a2, a3                            # 1cda: 3a22
            slli         a10, a10, 24                          # 1cdc: 80aa01
            addi         a2, a2, -128                          # 1cdf: 22c280
            l8ui         a0, a2, 127                           # 1ce2: 02027f
            srai         a10, a10, 24                          # 1ce5: a0a831
            slli         a0, a0, 24                            # 1ce8: 800001
            srai         a0, a0, 24                            # 1ceb: 000831
            sub          a10, a0, a10                          # 1cee: a0a0c0
            bge          a9, a10, .Lbr175                      # 1cf1: a7a905
            addi         a4, a0, -50                           # 1cf4: 42c0ce
            s8i          a4, a3, 0 /* a4 -> [[(local12)]] */   # 1cf7: 424300
.Lbr175:    movi         a6, sdk_chip6_phy_init_ctrl           # 1cfa: 618eff
            l8ui         a6, a6, 94 /* [sdk_chip6_phy_init_ctrl+0x5e] */ # 1cfd: 62065e
            beqz         a6, .Lbr177                           # 1d00: bc66
            l32i         a5, sp, 48 /* [(local11)] */          # 1d02: 58c1
            addi         a5, a5, -1 /* [(local11)]-0x1 */      # 1d04: 0b55
            blti         a5, 1, .Lbr177                        # 1d06: a61530
            movi         a6, sdk_chip6_sleep_params            # 1d09: 618bff
            movi         a7, 0 /* 0x00000000 */                # 1d0c: 0c07
            l32i         a4, sp, 48 /* [(local11)] */          # 1d0e: 48c1
            s32i         a7, sp, 84 /* 0x00000000 -> [(local20)] */ # 1d10: 726115
            add          a4, a4, a6                            # 1d13: 6a44
.Lbr176:    l32i         a8, sp, 84 /* [(local20)] */          # 1d15: 822115
            l8ui         a11, a4, 103                          # 1d18: b20467
            add          a13, a8, a6                           # 1d1b: 6ad8
            l8ui         a13, a13, 104                         # 1d1d: d20d68
            l8ui         a10, a2, 127                          # 1d20: a2027f
            sub          a11, a11, a13                         # 1d23: d0bbc0
            add          a10, a10, a11                         # 1d26: baaa
            l32i         a11, sp, 52 /* [(local12)] */         # 1d28: b8d1
            addi         a9, a8, 1 /* [(local20)]+0x1 */       # 1d2a: 1b98
            add          a11, a11, a8                          # 1d2c: 8abb
            s8i          a10, a11, 0                           # 1d2e: a24b00
            extui        a8, a9, 0, 8                          # 1d31: 908074
            s32i         a8, sp, 84 /* a8 -> [(local20)] */    # 1d34: 826115
            bne          a5, a8, .Lbr176                       # 1d37: 8795da
.Lbr177:    l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 1d3a: 080c
            l32i         a0, a0, 108 /* [[sdk_g_phyFuns]+0x6c] */ # 1d3c: 02201b
            movi         a2, 1 /* 0x00000001 */                # 1d3f: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x6c] */       # 1d41: c00000
            l32i         a12, sp, 20 /* [(local4)] */          # 1d44: c851
            l32i         a13, sp, 24 /* [(local5)] */          # 1d46: d861
            l32i         a14, sp, 28 /* [(local6)] */          # 1d48: e871
            l32i         a15, sp, 32 /* [(local7)] */          # 1d4a: f881
            l32i         a0, sp, 16 /* [(local3)] */           # 1d4c: 0841
            addi         sp, sp, 96 /* (local21) */            # 1d4e: 12c160
            ret                                                # 1d51: 0df0

            .literal_position                                  # 1d54: 00020060
                                                               # 1d58: 44010000
                                                               # 1d5c: 00020060
                                                               # 1d60: 00000000
                                                               # 1d64: 00000000
                                                               # 1d68: 00000000
                                                               # 1d6c: 00000000
                                                               # 1d70: 00000000
                                                               # 1d74: 00000000
                                                               # 1d78: 00000000
                                                               # 1d7c: 00000000
                                                               # 1d80: 00000000

# Function @ .irom0.text+0x1d84
# Local variables/stack:
#     (local0):  word      @ -0x60
#     (local1):  word      @ -0x5c
#     (local2):  word      @ -0x58
#     (local3):  word      @ -0x54
#     (local4):  word      @ -0x50
#     (local5):  word      @ -0x4c
#     (local6):  word      @ -0x48
#     (local7):  word      @ -0x44
#     (local8):  word      @ -0x40
#     (local9):  word      @ -0x3c
#     (local10): word      @ -0x38
#     (local11): word      @ -0x34
#     (local12): word      @ -0x30
#     (local13): word      @ -0x2c
#     (local14): word      @ -0x28
#     (local15): word      @ -0x24
#     (local16): word      @ -0x20
#     (local17): word      @ -0x1c
#     (local18): word      @ -0x18
#     (local19): word      @ -0x14
#     (local20): word      @ -0x10
#     (local21): word[3]   @ -0xc
            .balign      4
            .global      sdk_ram_rxiq_get_mis
            .type        sdk_ram_rxiq_get_mis, @function
sdk_ram_rxiq_get_mis:
            addi         a8, a2, -2 /* arg0-0x2 */             # 1d84: 82c2fe
            addi         sp, sp, -96 /* (local0) */            # 1d87: 12c1a0
            s32i         a12, sp, 40 /* a12 -> [(local10)] */  # 1d8a: c9a1
            s32i         a14, sp, 48 /* a14 -> [(local12)] */  # 1d8c: e9c1
            s32i         a15, sp, 52 /* a15 -> [(local13)] */  # 1d8e: f9d1
            s32i         a0, sp, 36 /* a0 -> [(local9)] */     # 1d90: 0991
            s32i         a6, sp, 56 /* arg4 -> [(local14)] */  # 1d92: 69e1
            s32i         a5, sp, 76 /* arg3 -> [(local19)] */  # 1d94: 526113
            s32i         a13, sp, 44 /* a13 -> [(local11)] */  # 1d97: d9b1
            s32i         a8, sp, 4 /* arg0-0x2 -> [(local1)] */ # 1d99: 8911
            movi         a13, 0x60000200                       # 1d9b: d1eeff
            memw                                               # 1d9e: c02000
            l32i         a9, a13, 0x380 /* [0x60000580] */     # 1da1: 922de0
            ssr          a8                                    # 1da4: 000840
            sra          a9, a9                                # 1da7: 9090b1
            memw                                               # 1daa: c02000
            l32i         a10, a13, 0x38c /* [0x6000058c] */    # 1dad: a22de3
            ssr          a8                                    # 1db0: 000840
            sra          a10, a10                              # 1db3: a0a0b1
            sub          a15, a9, a10                          # 1db6: a0f9c0
            memw                                               # 1db9: c02000
            l32i         a6, a13, 0x388 /* [0x60000588] */     # 1dbc: 622de2
            ssr          a8                                    # 1dbf: 000840
            sra          a6, a6                                # 1dc2: 6060b1
            memw                                               # 1dc5: c02000
            s32i         a7, sp, 0 /* arg5 -> [(local0)] */    # 1dc8: 7901
            l32i         a0, a13, 0x384 /* [0x60000584] */     # 1dca: 022de1
            ssr          a8                                    # 1dcd: 000840
            add          a9, a9, a10                           # 1dd0: aa99
            mov          a2, a9                                # 1dd2: 2d09
            l32i         a8, sp, 56 /* [(local14)] */          # 1dd4: 88e1
            sra          a0, a0                                # 1dd6: 0000b1
            add          a14, a6, a0                           # 1dd9: 0ae6
            xor          a8, a5, a8                            # 1ddb: 808530
            sub          a0, a0, a6                            # 1dde: 6000c0
            mov          a12, a0                               # 1de1: cd00
            xor          a6, a3, a4                            # 1de3: 406330
            xor          a6, a6, a8                            # 1de6: 806630
            extui        a6, a6, 0, 8                          # 1de9: 606074
            beqz         a6, .Lbr178                           # 1dec: 8c66
            mov          a12, a14                              # 1dee: cd0e
            mov          a2, a15                               # 1df0: 2d0f
            mov          a14, a0                               # 1df2: ed00
            mov          a15, a9                               # 1df4: fd09
.Lbr178:    s32i         a2, sp, 64 /* a2 -> [(local16)] */    # 1df6: 226110
            srai         a13, a12, 31                          # 1df9: c0df31
            mov          a4, a2                                # 1dfc: 4d02
            srai         a5, a2, 31                            # 1dfe: 205f31
            s32i         a5, sp, 60 /* a5 -> [(local15)] */    # 1e01: 59f1
            mov          a3, a5                                # 1e03: 3d05
            call0        __muldi3                              # 1e05: 01d6ffc0
                                                               # 1e09: 0000
            mov          a5, a13                               # 1e0b: 5d0d
            mov          a4, a12                               # 1e0d: 4d0c
            s32i         a3, sp, 12 /* a3 -> [(local3)] */     # 1e0f: 3931
            s32i         a2, sp, 16 /* a2 -> [(local4)] */     # 1e11: 2941
            mov          a3, a13                               # 1e13: 3d0d
            mov          a2, a12                               # 1e15: 2d0c
            call0        __muldi3                              # 1e17: 01d3ffc0
                                                               # 1e1b: 0000
            movi         a6, 0 /* 0x00000000 */                # 1e1d: 0c06
            movi         a0, 1 /* 0x00000001 */                # 1e1f: 0c10
            movi         a7, 0 /* 0x00000000 */                # 1e21: 0c07
            l32i         a5, sp, 12 /* [(local3)] */           # 1e23: 5831
            l32i         a11, sp, 16 /* [(local4)] */          # 1e25: b841
            add          a5, a5, a3                            # 1e27: 3a55
            add          a4, a11, a2                           # 1e29: 2a4b
            moveqz       a7, a0, a4                            # 1e2b: 407083
            bgeu         a4, a11, .Lbr179                      # 1e2e: b7b401
            addi         a5, a5, 1                             # 1e31: 1b55
.Lbr179:    mov          a11, a4                               # 1e33: bd04
            mov          a10, a5                               # 1e35: ad05
            moveqz       a6, a0, a5                            # 1e37: 506083
            bnone        a6, a7, .Lbr180                       # 1e3a: 770603
            mov          a11, a0 /* 0x00000001 */              # 1e3d: bd00
            movi         a10, 0 /* 0x00000000 */               # 1e3f: 0c0a
.Lbr180:    mov          a4, a15                               # 1e41: 4d0f
            s32i         a15, sp, 24 /* a15 -> [(local6)] */   # 1e43: f961
            s32i         a14, sp, 72 /* a14 -> [(local18)] */  # 1e45: e26112
            l32i         a3, sp, 60 /* [(local15)] */          # 1e48: 38f1
            l32i         a2, sp, 64 /* [(local16)] */          # 1e4a: 222110
            s32i         a10, sp, 80 /* a10 -> [(local20)] */  # 1e4d: a26114
            s32i         a11, sp, 84 /* a11 -> [(local21)] */  # 1e50: b26115
            srai         a8, a14, 31                           # 1e53: e08f31
            srai         a5, a15, 31                           # 1e56: f05f31
            s32i         a5, sp, 20 /* a5 -> [(local5)] */     # 1e59: 5951
            s32i         a8, sp, 68 /* a8 -> [(local17)] */    # 1e5b: 826111
            call0        __muldi3                              # 1e5e: 01c2ffc0
                                                               # 1e62: 0000
            l32i         a14, sp, 84 /* [(local21)] */         # 1e64: e22115
            l32i         a15, sp, 80 /* [(local20)] */         # 1e67: f22114
            l32i         a5, sp, 68 /* [(local17)] */          # 1e6a: 522111
            l32i         a4, sp, 72 /* [(local18)] */          # 1e6d: 422112
            s32i         a3, sp, 28 /* a3 -> [(local7)] */     # 1e70: 3971
            s32i         a2, sp, 32 /* a2 -> [(local8)] */     # 1e72: 2981
            mov          a3, a13                               # 1e74: 3d0d
            mov          a2, a12                               # 1e76: 2d0c
            call0        __muldi3                              # 1e78: 01bdffc0
                                                               # 1e7c: 0000
            l32i         a0, sp, 28 /* [(local7)] */           # 1e7e: 0871
            sub          a0, a0, a3                            # 1e80: 3000c0
            l32i         a3, sp, 32 /* [(local8)] */           # 1e83: 3881
            sub          a10, a3, a2                           # 1e85: 20a3c0
            bgeu         a3, a10, .Lbr181                      # 1e88: a7b301
            addi         a0, a0, -1                            # 1e8b: 0b00
.Lbr181:    slli         a2, a10, 9                            # 1e8d: 702a11
            mov          a5, a15 /* [(local20)] */             # 1e90: 5d0f
            mov          a4, a14 /* [(local21)] */             # 1e92: 4d0e
            ssai         23                                    # 1e94: 104740
            src          a3, a0, a10                           # 1e97: a03081
            call0        __divdi3                              # 1e9a: 01b5ffc0
                                                               # 1e9e: 0000
            l32i         a3, sp, 0 /* [(local0)] */            # 1ea0: 3801
            slli         a4, a2, 24                            # 1ea2: 804201
            l32i         a5, sp, 56 /* [(local14)] */          # 1ea5: 58e1
            srai         a4, a4, 24                            # 1ea7: 404831
            addi         a4, a4, 1                             # 1eaa: 1b44
            srai         a4, a4, 1                             # 1eac: 404121
            neg          a2, a4                                # 1eaf: 402060
            moveqz       a2, a4, a5                            # 1eb2: 502483
            l32i         a5, sp, 20 /* [(local5)] */           # 1eb5: 5851
            l32i         a4, sp, 24 /* [(local6)] */           # 1eb7: 4861
            s8i          a2, a3, 0 /* a2 -> [[(local0)]] */    # 1eb9: 224300
            s32i         a2, sp, 8 /* a2 -> [(local2)] */      # 1ebc: 2921
            mov          a3, a13                               # 1ebe: 3d0d
            mov          a2, a12                               # 1ec0: 2d0c
            call0        __muldi3                              # 1ec2: 01acffc0
                                                               # 1ec6: 0000
            l32i         a5, sp, 68 /* [(local17)] */          # 1ec8: 522111
            l32i         a4, sp, 72 /* [(local18)] */          # 1ecb: 422112
            mov          a13, a3                               # 1ece: dd03
            mov          a12, a2                               # 1ed0: cd02
            l32i         a3, sp, 60 /* [(local15)] */          # 1ed2: 38f1
            l32i         a2, sp, 64 /* [(local16)] */          # 1ed4: 222110
            call0        __muldi3                              # 1ed7: 01a8ffc0
                                                               # 1edb: 0000
            add          a0, a13, a3                           # 1edd: 3a0d
            add          a2, a12, a2                           # 1edf: 2a2c
            bgeu         a2, a12, .Lbr182                      # 1ee1: c7b201
            addi         a0, a0, 1                             # 1ee4: 1b00
.Lbr182:    mov          a4, a14 /* [(local21)] */             # 1ee6: 4d0e
            mov          a5, a15 /* [(local20)] */             # 1ee8: 5d0f
            l32i         a12, sp, 0 /* [(local0)] */           # 1eea: c801
            ssai         23                                    # 1eec: 104740
            l32i         a13, sp, 76 /* [(local19)] */         # 1eef: d22113
            src          a3, a0, a2                            # 1ef2: 203081
            slli         a2, a2, 9                             # 1ef5: 702211
            call0        __divdi3                              # 1ef8: 01a1ffc0
                                                               # 1efc: 0000
            l8ui         a5, sp, 96 /* [(local22)] */          # 1efe: 520160
            slli         a6, a2, 24                            # 1f01: 806201
            srai         a6, a6, 24                            # 1f04: 606831
            addi         a6, a6, 1                             # 1f07: 1b66
            srai         a6, a6, 1                             # 1f09: 606121
            neg          a0, a6                                # 1f0c: 600060
            moveqz       a0, a6, a13                           # 1f0f: d00683
            s8i          a0, a12, 1 /* a0 -> [[(local0)]+0x1] */ # 1f12: 024c01
            beqz         a5, .Lbr183                           # 1f15: ac65
            movi         a2, .Lstr009                          # 1f17: 2190ff
            memw                                               # 1f1a: c02000
            movi         a3, 0x60000200                        # 1f1d: 318fff
            l32i         a4, sp, 4 /* [(local1)] */            # 1f20: 4811
            slli         a5, a0, 24                            # 1f22: 805001
            srai         a5, a5, 24                            # 1f25: 505831
            ssr          a4                                    # 1f28: 000440
            l32i         a3, a3, 0x3e4 /* [0x600005e4] */      # 1f2b: 3223f9
            l32i         a4, sp, 8 /* [(local2)] */            # 1f2e: 4821
            sra          a3, a3                                # 1f30: 3030b1
            slli         a4, a4, 24                            # 1f33: 804401
            srai         a4, a4, 24                            # 1f36: 404831
            call0        ets_printf                            # 1f39: 0191ffc0
                                                               # 1f3d: 0000
.Lbr183:    l32i         a12, sp, 40 /* [(local10)] */         # 1f3f: c8a1
            l32i         a13, sp, 44 /* [(local11)] */         # 1f41: d8b1
            l32i         a14, sp, 48 /* [(local12)] */         # 1f43: e8c1
            l32i         a15, sp, 52 /* [(local13)] */         # 1f45: f8d1
            l32i         a0, sp, 36 /* [(local9)] */           # 1f47: 0891
            addi         sp, sp, 96 /* (local22) */            # 1f49: 12c160
            ret                                                # 1f4c: 0df0

            .literal_position                                  # 1f50: 00000000
                                                               # 1f54: 00400000
                                                               # 1f58: 00000000
                                                               # 1f5c: 00000000

# Function @ .irom0.text+0x1f60
# Local variables/stack:
#     (local0):  word[4]   @ -0x50
#     (local1):  byte      @ -0x40
#     (local2):  byte      @ -0x3f
#     (local3):  byte      @ -0x3e
#     (local4):  byte      @ -0x3d
#     (local5):  word      @ -0x3c
#     (local6):  word      @ -0x38
#     (local7):  word      @ -0x34
#     (local8):  word      @ -0x30
#     (local9):  word      @ -0x2c
#     (local10): word      @ -0x28
#     (local11): word      @ -0x24
#     (local12): word      @ -0x20
#     (local13): word      @ -0x1c
#     (local14): word      @ -0x18
#     (local15): word      @ -0x14
#     (local16): word      @ -0x10
#     (local17): word      @ -0xc
#     (local18): word      @ -0x8
#     (local19): word      @ -0x4
            .balign      4
            .global      sdk_ram_rxiq_cover_mg_mp
            .type        sdk_ram_rxiq_cover_mg_mp, @function
sdk_ram_rxiq_cover_mg_mp:
            mov          a9, a3 /* arg1 */                     # 1f60: 9d03
            addi         sp, sp, -80 /* (local0) */            # 1f62: 12c1b0
            s32i         a7, sp, 28 /* arg5 -> [(local7)] */   # 1f65: 7971
            s32i         a4, sp, 20 /* arg2 -> [(local5)] */   # 1f67: 4951
            s32i         a6, sp, 72 /* arg4 -> [(local18)] */  # 1f69: 626112
            s32i         a5, sp, 68 /* arg3 -> [(local17)] */  # 1f6c: 526111
            s32i         a0, sp, 32 /* a0 -> [(local8)] */     # 1f6f: 0981
            s32i         a2, sp, 64 /* arg0 -> [(local16)] */  # 1f71: 226110
            s32i         a15, sp, 48 /* a15 -> [(local12)] */  # 1f74: f9c1
            s32i         a13, sp, 40 /* a13 -> [(local10)] */  # 1f76: d9a1
            s32i         a14, sp, 44 /* a14 -> [(local11)] */  # 1f78: e9b1
            s32i         a12, sp, 36 /* a12 -> [(local9)] */   # 1f7a: c991
            movi         a14, 0 /* 0x00000000 */               # 1f7c: 0c0e
            movi         a12, 0 /* 0x00000000 */               # 1f7e: 0c0c
            movi         a13, sdk_g_phyFuns                    # 1f80: d1f4ff
            l8ui         a15, sp, 84 /* [(FP)+0x4] */          # 1f83: f20154
            s32i         a9, sp, 24 /* arg1 -> [(local6)] */   # 1f86: 9961
            movi         a2, 2 /* 0x00000002 */                # 1f88: 0c22
            l32i         a0, sp, 64 /* [(local16)] */          # 1f8a: 022110
            s32i         a2, sp, 76 /* 0x00000002 -> [(local19)] */ # 1f8d: 226113
            l32i         a5, sp, 72 /* [(local18)] */          # 1f90: 522112
            l32i         a6, sp, 68 /* [(local17)] */          # 1f93: 622111
            s8i          a6, sp, 16 /* [(local17)] -> [(local1)] */ # 1f96: 624110
            s8i          a5, sp, 17 /* [(local18)] -> [(local2)] */ # 1f99: 524111
            movi         a2, 1 /* 0x00000001 */                # 1f9c: 0c12
            ssl          a0                                    # 1f9e: 001040
            sll          a2, a2                                # 1fa1: 0022a1
            l8ui         a0, sp, 88 /* [(FP)+0x8] */           # 1fa4: 020158
            s32i         a0, sp, 56 /* [(FP)+0x8] -> [(local14)] */ # 1fa7: 09e1
            extui        a2, a2, 0, 16                         # 1fa9: 2020f4
            s32i         a2, sp, 52 /* a2 -> [(local13)] */    # 1fac: 29d1
.Lbr184:    movi         a4, 1 /* 0x00000001 */                # 1fae: 0c14
            mov          a5, a15 /* [(FP)+0x4] */              # 1fb0: 5d0f
            movi         a3, 128 /* 0x00000080 */              # 1fb2: 32a080
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      # 1fb5: 080d
            mul16s       a2, a12, a12                          # 1fb7: c02cd1
            l32i         a0, a0, 248 /* [[sdk_g_phyFuns]+0xf8] */ # 1fba: 02203e
            add          a2, a2, a3                            # 1fbd: 3a22
            srai         a2, a2, 8                             # 1fbf: 202821
            addi         a3, sp, 16 /* (local1) */             # 1fc2: 32c110
            s32i         a2, sp, 60 /* a2 -> [(local15)] */    # 1fc5: 29f1
            sub          a2, a14, a2                           # 1fc7: 202ec0
            slli         a2, a2, 24                            # 1fca: 802201
            srai         a2, a2, 24                            # 1fcd: 202831
            callx0       a0 /* [[sdk_g_phyFuns]+0xf8] */       # 1fd0: c00000
            addi         a3, sp, 17 /* (local2) */             # 1fd3: 32c111
            movi         a4, 0 /* 0x00000000 */                # 1fd6: 0c04
            mov          a5, a15 /* [(FP)+0x4] */              # 1fd8: 5d0f
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      # 1fda: 080d
            mov          a14, a2                               # 1fdc: ed02
            l32i         a0, a0, 248 /* [[sdk_g_phyFuns]+0xf8] */ # 1fde: 02203e
            mov          a2, a12                               # 1fe1: 2d0c
            callx0       a0 /* [[sdk_g_phyFuns]+0xf8] */       # 1fe3: c00000
            l32i         a3, sp, 52 /* [(local13)] */          # 1fe6: 38d1
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      # 1fe8: 080d
            mov          a12, a2                               # 1fea: cd02
            l32i         a0, a0, 52 /* [[sdk_g_phyFuns]+0x34] */ # 1fec: 08d0
            movi         a2, 1 /* 0x00000001 */                # 1fee: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x34] */       # 1ff0: c00000
            l32i         a2, sp, 64 /* [(local16)] */          # 1ff3: 222110
            l32i         a3, sp, 24 /* [(local6)] */           # 1ff6: 3861
            l8ui         a5, sp, 17 /* [(local2)] */           # 1ff8: 520111
            l32i         a8, sp, 68 /* [(local17)] */          # 1ffb: 822111
            l8ui         a6, sp, 16 /* [(local1)] */           # 1ffe: 620110
            movi         a9, 1 /* 0x00000001 */                # 2001: 0c19
            sub          a6, a6, a8                            # 2003: 8066c0
            l32i         a8, sp, 72 /* [(local18)] */          # 2006: 822112
            movnez       a6, a9, a6                            # 2009: 606993
            s8i          a6, sp, 16 /* a6 -> [(local1)] */     # 200c: 624110
            sub          a5, a5, a8                            # 200f: 8055c0
            l32i         a8, sp, 56 /* [(local14)] */          # 2012: 88e1
            movnez       a5, a9, a5                            # 2014: 505993
            s8i          a5, sp, 17 /* a5 -> [(local2)] */     # 2017: 524111
            s32i         a8, sp, 0 /* [(local14)] -> [(local0)] */ # 201a: 8901
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      # 201c: 080d
            l32i         a4, sp, 20 /* [(local5)] */           # 201e: 4851
            l32i         a0, a0, 72 /* [[sdk_g_phyFuns]+0x48] */ # 2020: 022012
            addi         a7, sp, 18 /* (local3) */             # 2023: 72c112
            callx0       a0 /* [[sdk_g_phyFuns]+0x48] */       # 2026: c00000
            l32i         a2, sp, 60 /* [(local15)] */          # 2029: 28f1
            l8ui         a0, sp, 18 /* [(local3)] */           # 202b: 020112
            add          a2, a14, a2                           # 202e: 2a2e
            slli         a14, a0, 24                           # 2030: 80e001
            l8ui         a0, sp, 19 /* [(local4)] */           # 2033: 020113
            srai         a14, a14, 24                          # 2036: e0e831
            add          a14, a14, a2                          # 2039: 2aee
            slli         a0, a0, 24                            # 203b: 800001
            slli         a14, a14, 24                          # 203e: 80ee01
            srai         a14, a14, 24                          # 2041: e0e831
            srai         a0, a0, 24                            # 2044: 000831
            sub          a12, a12, a0                          # 2047: 00ccc0
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      # 204a: 080d
            slli         a12, a12, 24                          # 204c: 80cc01
            l32i         a0, a0, 48 /* [[sdk_g_phyFuns]+0x30] */ # 204f: 08c0
            srai         a12, a12, 24                          # 2051: c0c831
            callx0       a0 /* [[sdk_g_phyFuns]+0x30] */       # 2054: c00000
            l32i         a3, sp, 76 /* [(local19)] */          # 2057: 322113
            addi         a3, a3, -1 /* [(local19)]-0x1 */      # 205a: 0b33
            s32i         a3, sp, 76 /* [(local19)]-0x1 -> [(local19)] */ # 205c: 326113
            bnez         a3, .Lbr184                           # 205f: 56b3f4
            l8ui         a2, sp, 18 /* [(local3)] */           # 2062: 220112
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      # 2065: 080d
            slli         a2, a2, 24                            # 2067: 802201
            l32i         a0, a0, 0 /* [[sdk_g_phyFuns]] */     # 206a: 0800
            srai         a2, a2, 24                            # 206c: 202831
            callx0       a0 /* [[sdk_g_phyFuns]] */            # 206f: c00000
            bgei         a2, 5, .Lbr185                        # 2072: e65212
            l8ui         a2, sp, 19 /* [(local4)] */           # 2075: 220113
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      # 2078: 080d
            slli         a2, a2, 24                            # 207a: 802201
            l32i         a0, a0, 0 /* [[sdk_g_phyFuns]] */     # 207d: 0800
            srai         a2, a2, 24                            # 207f: 202831
            callx0       a0 /* [[sdk_g_phyFuns]] */            # 2082: c00000
            blti         a2, 5, .Lbr186                        # 2085: a65217
.Lbr185:    movi         a7, 0x00004000                        # 2088: 71b3ff
            movi         a4, sdk_check_result                  # 208b: 41b3ff
            movi         a6, sdk_loop_pwctrl_pwdet_error_accum_high_power # 208e: 61b3ff
            l32i         a3, a4, 0 /* [sdk_check_result] */    # 2091: 3804
            l8ui         a5, a6, 5 /* [sdk_rxiq_cover_fail_num] */ # 2093: 520605
            or           a3, a3, a7                            # 2096: 703320
            addi         a5, a5, 1 /* [sdk_rxiq_cover_fail_num]+0x1 */ # 2099: 1b55
            s8i          a5, a6, 5 /* [sdk_rxiq_cover_fail_num]+0x1 -> [sdk_rxiq_cover_fail_num] */ # 209b: 524605
            s32i         a3, a4, 0 /* a3 -> [sdk_check_result] */ # 209e: 3904
.Lbr186:    movi         a2, 15 /* 0x0000000f */               # 20a0: 0cf2
            movi         a0, -15 /* 0xfffffff1 */              # 20a2: 7c10
            blt          a14, a0, .Lbr187                      # 20a4: 072e01
            mov          a0, a14                               # 20a7: 0d0e
.Lbr187:    blt          a2, a0, .Lbr188                       # 20a9: 072201
            mov          a2, a0                                # 20ac: 2d00
.Lbr188:    movi         a0, -31 /* 0xffffffe1 */              # 20ae: 6c10
            slli         a14, a2, 24                           # 20b0: 80e201
            srai         a14, a14, 24                          # 20b3: e0e831
            movi         a2, 31 /* 0x0000001f */               # 20b6: 1cf2
            blt          a12, a0, .Lbr189                      # 20b8: 072c01
            mov          a0, a12                               # 20bb: 0d0c
.Lbr189:    blt          a2, a0, .Lbr190                       # 20bd: 072201
            mov          a2, a0                                # 20c0: 2d00
.Lbr190:    addi         a3, sp, 16 /* (local1) */             # 20c2: 32c110
            movi         a4, 1 /* 0x00000001 */                # 20c5: 0c14
            mov          a5, a15 /* [(FP)+0x4] */              # 20c7: 5d0f
            slli         a12, a2, 24                           # 20c9: 80c201
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      # 20cc: 080d
            srai         a12, a12, 24                          # 20ce: c0c831
            l32i         a0, a0, 248 /* [[sdk_g_phyFuns]+0xf8] */ # 20d1: 02203e
            mov          a2, a14                               # 20d4: 2d0e
            callx0       a0 /* [[sdk_g_phyFuns]+0xf8] */       # 20d6: c00000
            mov          a5, a15 /* [(FP)+0x4] */              # 20d9: 5d0f
            mov          a2, a12                               # 20db: 2d0c
            l32i         a0, a13, 0 /* [sdk_g_phyFuns] */      # 20dd: 080d
            addi         a3, sp, 17 /* (local2) */             # 20df: 32c111
            l32i         a0, a0, 248 /* [[sdk_g_phyFuns]+0xf8] */ # 20e2: 02203e
            movi         a4, 0 /* 0x00000000 */                # 20e5: 0c04
            callx0       a0 /* [[sdk_g_phyFuns]+0xf8] */       # 20e7: c00000
            l32i         a0, sp, 32 /* [(local8)] */           # 20ea: 0881
            l32i         a13, sp, 40 /* [(local10)] */         # 20ec: d8a1
            l32i         a15, sp, 48 /* [(local12)] */         # 20ee: f8c1
            l32i         a3, sp, 28 /* [(local7)] */           # 20f0: 3871
            l32i         a2, sp, 80 /* [(local20)] */          # 20f2: 222114
            s8i          a14, a3, 0 /* a14 -> [[(local7)]] */  # 20f5: e24300
            s8i          a12, a2, 0 /* a12 -> [[(local20)]] */ # 20f8: c24200
            l32i         a14, sp, 44 /* [(local11)] */         # 20fb: e8b1
            l32i         a12, sp, 36 /* [(local9)] */          # 20fd: c891
            addi         sp, sp, 80 /* (local20) */            # 20ff: 12c150
            ret           /* [(local20)] */                    # 2102: 0df0

            .literal_position                                  # 2104: 00000000

# Function @ .irom0.text+0x2108
# Local variables/stack:
#     (local0):  word      @ -0x50
#     (local1):  word      @ -0x4c
#     (local2):  word[2]   @ -0x48
#     (local3):  byte      @ -0x40
#     (local4):  byte      @ -0x3f
#     (local5):  byte      @ -0x3e
#     (local6):  byte      @ -0x3d
#     (local7):  word      @ -0x3c
#     (local8):  word      @ -0x38
#     (local9):  word      @ -0x34
#     (local10): word      @ -0x30
#     (local11): word      @ -0x2c
#     (local12): word      @ -0x28
#     (local13): word      @ -0x24
#     (local14): word      @ -0x20
#     (local15): word      @ -0x1c
#     (local16): word      @ -0x18
#     (local17): word      @ -0x14
#     (local18): word      @ -0x10
#     (local19): word      @ -0xc
#     (local20): word      @ -0x8
#     (local21): word      @ -0x4
            .balign      4
            .global      sdk_ram_rfcal_rxiq
            .type        sdk_ram_rfcal_rxiq, @function
sdk_ram_rfcal_rxiq:
            mov          a9, a5 /* arg3 */                     # 2108: 9d05
            mov          a10, a3 /* arg1 */                    # 210a: ad03
            addi         sp, sp, -80 /* (local0) */            # 210c: 12c1b0
            s32i         a13, sp, 56 /* a13 -> [(local16)] */  # 210f: d9e1
            s32i         a14, sp, 60 /* a14 -> [(local17)] */  # 2111: e9f1
            s32i         a7, sp, 32 /* arg5 -> [(local10)] */  # 2113: 7981
            movi         a3, 0 /* 0x00000000 */                # 2115: 0c03
            movi         a5, 0 /* 0x00000000 */                # 2117: 0c05
            s32i         a15, sp, 64 /* a15 -> [(local18)] */  # 2119: f26110
            s32i         a0, sp, 48 /* a0 -> [(local14)] */    # 211c: 09c1
            s32i         a12, sp, 52 /* a12 -> [(local15)] */  # 211e: c9d1
            s32i         a6, sp, 76 /* arg4 -> [(local21)] */  # 2120: 626113
            s32i         a2, sp, 20 /* arg0 -> [(local7)] */   # 2123: 2951
            s32i         a4, sp, 24 /* arg2 -> [(local8)] */   # 2125: 4961
            movi         a2, 119 /* 0x00000077 */              # 2127: 22a077
            movi         a4, 16 /* 0x00000010 */               # 212a: 1c04
            movi         a6, 0 /* 0x00000000 */                # 212c: 0c06
            movi         a12, sdk_g_phyFuns                    # 212e: c1f5ff
            s32i         a10, sp, 68 /* arg1 -> [(local19)] */ # 2131: a26111
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 2134: 080c
            s32i         a9, sp, 72 /* arg3 -> [(local20)] */  # 2136: 926112
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ # 2139: 022025
            l32i         a15, sp, 76 /* [(local21)] */         # 213c: f22113
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       # 213f: c00000
            movi         a3, 0 /* 0x00000000 */                # 2142: 0c03
            movi         a4, 15 /* 0x0000000f */               # 2144: 0cf4
            movi         a5, 6 /* 0x00000006 */                # 2146: 0c65
            movi         a6, 6 /* 0x00000006 */                # 2148: 0c66
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 214a: 080c
            mov          a14, a2                               # 214c: ed02
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ # 214e: 022025
            movi         a2, 119 /* 0x00000077 */              # 2151: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       # 2154: c00000
            movi         a3, 0 /* 0x00000000 */                # 2157: 0c03
            movi         a4, 24 /* 0x00000018 */               # 2159: 1c84
            movi         a5, 5 /* 0x00000005 */                # 215b: 0c55
            movi         a6, 5 /* 0x00000005 */                # 215d: 0c56
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 215f: 080c
            mov          a13, a2                               # 2161: dd02
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ # 2163: 022025
            movi         a2, 119 /* 0x00000077 */              # 2166: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       # 2169: c00000
            movi         a3, 0 /* 0x00000000 */                # 216c: 0c03
            movi         a4, 24 /* 0x00000018 */               # 216e: 1c84
            movi         a5, 3 /* 0x00000003 */                # 2170: 0c35
            movi         a6, 3 /* 0x00000003 */                # 2172: 0c36
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 2174: 080c
            s32i         a2, sp, 36 /* a2 -> [(local11)] */    # 2176: 2991
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ # 2178: 022025
            movi         a2, 119 /* 0x00000077 */              # 217b: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       # 217e: c00000
            movi         a3, 0 /* 0x00000000 */                # 2181: 0c03
            movi         a4, 9 /* 0x00000009 */                # 2183: 0c94
            movi         a5, 7 /* 0x00000007 */                # 2185: 0c75
            movi         a6, 0 /* 0x00000000 */                # 2187: 0c06
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 2189: 080c
            s32i         a2, sp, 40 /* a2 -> [(local12)] */    # 218b: 29a1
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ # 218d: 022025
            movi         a2, 119 /* 0x00000077 */              # 2190: 22a077
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       # 2193: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 2196: 080c
            s32i         a2, sp, 28 /* a2 -> [(local9)] */     # 2198: 2971
            l32i         a0, a0, 64 /* [[sdk_g_phyFuns]+0x40] */ # 219a: 022010
            movi         a2, 1 /* 0x00000001 */                # 219d: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x40] */       # 219f: c00000
            s8i          a14, sp, 16 /* a14 -> [(local3)] */   # 21a2: e24110
            s8i          a13, sp, 17 /* a13 -> [(local4)] */   # 21a5: d24111
            beqz         a15, .Lbr191                          # 21a8: 8ccf
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 21aa: 080c
            addi         a2, sp, 16 /* (local3) */             # 21ac: 22c110
            l32i         a0, a0, 0x114 /* [[sdk_g_phyFuns]+0x114] */ # 21af: 022045
            addi         a3, sp, 17 /* (local4) */             # 21b2: 32c111
            callx0       a0 /* [[sdk_g_phyFuns]+0x114] */      # 21b5: c00000
.Lbr191:    movi         a2, 119 /* 0x00000077 */              # 21b8: 22a077
            movi         a3, 0 /* 0x00000000 */                # 21bb: 0c03
            movi         a4, 16 /* 0x00000010 */               # 21bd: 1c04
            movi         a5, 2 /* 0x00000002 */                # 21bf: 0c25
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 21c1: 080c
            movi         a6, 2 /* 0x00000002 */                # 21c3: 0c26
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 21c5: 022027
            movi         a7, 1 /* 0x00000001 */                # 21c8: 0c17
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 21ca: c00000
            s32i         a14, sp, 44 /* a14 -> [(local13)] */  # 21cd: e9b1
            movi         a2, 119 /* 0x00000077 */              # 21cf: 22a077
            movi         a3, 0 /* 0x00000000 */                # 21d2: 0c03
            movi         a4, 24 /* 0x00000018 */               # 21d4: 1c84
            movi         a5, 7 /* 0x00000007 */                # 21d6: 0c75
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 21d8: 080c
            movi         a7, 1 /* 0x00000001 */                # 21da: 0c17
            l8ui         a9, sp, 16 /* [(local3)] */           # 21dc: 920110
            l8ui         a8, sp, 17 /* [(local4)] */           # 21df: 820111
            sub          a9, a9, a14                           # 21e2: e099c0
            sub          a8, a8, a13                           # 21e5: d088c0
            movnez       a8, a7, a8                            # 21e8: 808793
            movnez       a9, a7, a9                            # 21eb: 909793
            s8i          a9, sp, 16 /* a9 -> [(local3)] */     # 21ee: 924110
            s8i          a8, sp, 17 /* a8 -> [(local4)] */     # 21f1: 824111
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 21f4: 022027
            movi         a6, 7 /* 0x00000007 */                # 21f7: 0c76
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 21f9: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 21fc: 080c
            l32i         a14, sp, 68 /* [(local19)] */         # 21fe: e22111
            l32i         a0, a0, 80 /* [[sdk_g_phyFuns]+0x50] */ # 2201: 022014
            l32i         a2, sp, 24 /* [(local8)] */           # 2204: 2861
            callx0       a0 /* [[sdk_g_phyFuns]+0x50] */       # 2206: c00000
            movi         a5, 0 /* 0x00000000 */                # 2209: 0c05
            movi         a6, 0 /* 0x00000000 */                # 220b: 0c06
            movi         a7, 0 /* 0x00000000 */                # 220d: 0c07
            mov          a4, a2                                # 220f: 4d02
            movi         a3, 0 /* 0x00000000 */                # 2211: 0c03
            s32i         a3, sp, 8 /* 0x00000000 -> [(local2)] */ # 2213: 3921
            s32i         a3, sp, 4 /* 0x00000000 -> [(local1)] */ # 2215: 3911
            s32i         a3, sp, 0 /* 0x00000000 -> [(local0)] */ # 2217: 3901
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 2219: 080c
            movi         a2, 1 /* 0x00000001 */                # 221b: 0c12
            l32i         a0, a0, 104 /* [[sdk_g_phyFuns]+0x68] */ # 221d: 02201a
            mov          a3, a14 /* [(local19)] */             # 2220: 3d0e
            callx0       a0 /* [[sdk_g_phyFuns]+0x68] */       # 2222: c00000
            l32i         a2, sp, 20 /* [(local7)] */           # 2225: 2851
            l32i         a7, sp, 32 /* [(local10)] */          # 2227: 7881
            addi         a6, sp, 19 /* (local6) */             # 2229: 62c113
            l8ui         a4, sp, 17 /* [(local4)] */           # 222c: 420111
            l32i         a5, sp, 36 /* [(local11)] */          # 222f: 5891
            l8ui         a3, sp, 16 /* [(local3)] */           # 2231: 320110
            mov          a14, a5 /* [(local11)] */             # 2234: ed05
            s32i         a15, sp, 4 /* [(local21)] -> [(local1)] */ # 2236: f911
            s32i         a6, sp, 0 /* (local6) -> [(local0)] */ # 2238: 6901
            s32i         a7, sp, 8 /* [(local10)] -> [(local2)] */ # 223a: 7921
            addi         a7, sp, 18 /* (local5) */             # 223c: 72c112
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 223f: 080c
            l32i         a6, sp, 40 /* [(local12)] */          # 2241: 68a1
            l32i         a0, a0, 0x10c /* [[sdk_g_phyFuns]+0x10c] */ # 2243: 022043
            mov          a15, a6 /* [(local12)] */             # 2246: fd06
            callx0       a0 /* [[sdk_g_phyFuns]+0x10c] */      # 2248: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 224b: 080c
            l32i         a0, a0, 108 /* [[sdk_g_phyFuns]+0x6c] */ # 224d: 02201b
            movi         a2, 1 /* 0x00000001 */                # 2250: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0x6c] */       # 2252: c00000
            l32i         a7, sp, 44 /* [(local13)] */          # 2255: 78b1
            movi         a2, 119 /* 0x00000077 */              # 2257: 22a077
            movi         a3, 0 /* 0x00000000 */                # 225a: 0c03
            movi         a4, 16 /* 0x00000010 */               # 225c: 1c04
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 225e: 080c
            movi         a5, 0 /* 0x00000000 */                # 2260: 0c05
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 2262: 022027
            movi         a6, 0 /* 0x00000000 */                # 2265: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 2267: c00000
            mov          a7, a13                               # 226a: 7d0d
            movi         a2, 119 /* 0x00000077 */              # 226c: 22a077
            movi         a3, 0 /* 0x00000000 */                # 226f: 0c03
            movi         a4, 15 /* 0x0000000f */               # 2271: 0cf4
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 2273: 080c
            movi         a5, 6 /* 0x00000006 */                # 2275: 0c65
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 2277: 022027
            movi         a6, 6 /* 0x00000006 */                # 227a: 0c66
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 227c: c00000
            mov          a7, a14 /* [(local11)] */             # 227f: 7d0e
            movi         a2, 119 /* 0x00000077 */              # 2281: 22a077
            movi         a3, 0 /* 0x00000000 */                # 2284: 0c03
            movi         a4, 24 /* 0x00000018 */               # 2286: 1c84
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 2288: 080c
            movi         a5, 5 /* 0x00000005 */                # 228a: 0c55
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 228c: 022027
            movi         a6, 5 /* 0x00000005 */                # 228f: 0c56
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 2291: c00000
            mov          a7, a15 /* [(local12)] */             # 2294: 7d0f
            movi         a2, 119 /* 0x00000077 */              # 2296: 22a077
            movi         a3, 0 /* 0x00000000 */                # 2299: 0c03
            movi         a4, 24 /* 0x00000018 */               # 229b: 1c84
            movi         a5, 3 /* 0x00000003 */                # 229d: 0c35
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 229f: 080c
            movi         a6, 3 /* 0x00000003 */                # 22a1: 0c36
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 22a3: 022027
            l32i         a13, sp, 28 /* [(local9)] */          # 22a6: d871
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 22a8: c00000
            mov          a7, a13 /* [(local9)] */              # 22ab: 7d0d
            movi         a2, 119 /* 0x00000077 */              # 22ad: 22a077
            movi         a3, 0 /* 0x00000000 */                # 22b0: 0c03
            movi         a4, 9 /* 0x00000009 */                # 22b2: 0c94
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 22b4: 080c
            movi         a5, 7 /* 0x00000007 */                # 22b6: 0c75
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 22b8: 022027
            movi         a6, 0 /* 0x00000000 */                # 22bb: 0c06
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 22bd: c00000
            movi         a2, 119 /* 0x00000077 */              # 22c0: 22a077
            movi         a3, 0 /* 0x00000000 */                # 22c3: 0c03
            movi         a4, 24 /* 0x00000018 */               # 22c5: 1c84
            movi         a5, 7 /* 0x00000007 */                # 22c7: 0c75
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 22c9: 080c
            movi         a6, 7 /* 0x00000007 */                # 22cb: 0c76
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 22cd: 022027
            movi         a7, 0 /* 0x00000000 */                # 22d0: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 22d2: c00000
            movi         a2, 119 /* 0x00000077 */              # 22d5: 22a077
            movi         a3, 0 /* 0x00000000 */                # 22d8: 0c03
            movi         a4, 16 /* 0x00000010 */               # 22da: 1c04
            movi         a5, 2 /* 0x00000002 */                # 22dc: 0c25
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 22de: 080c
            movi         a6, 2 /* 0x00000002 */                # 22e0: 0c26
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 22e2: 022027
            movi         a7, 0 /* 0x00000000 */                # 22e5: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 22e7: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 22ea: 080c
            l32i         a13, sp, 72 /* [(local20)] */         # 22ec: d22112
            l32i         a0, a0, 64 /* [[sdk_g_phyFuns]+0x40] */ # 22ef: 022010
            movi         a2, 0 /* 0x00000000 */                # 22f2: 0c02
            callx0       a0 /* [[sdk_g_phyFuns]+0x40] */       # 22f4: c00000
            l32i         a0, sp, 48 /* [(local14)] */          # 22f7: 08c1
            l32i         a12, sp, 52 /* [(local15)] */         # 22f9: c8d1
            l32i         a14, sp, 60 /* [(local17)] */         # 22fb: e8f1
            l8ui         a3, sp, 18 /* [(local5)] */           # 22fd: 320112
            l32i         a15, sp, 64 /* [(local18)] */         # 2300: f22110
            s8i          a3, a13, 0 /* [(local5)] -> [[(local20)]] */ # 2303: 324d00
            l8ui         a2, sp, 19 /* [(local6)] */           # 2306: 220113
            s8i          a2, a13, 1 /* [(local6)] -> [[(local20)]+0x1] */ # 2309: 224d01
            l32i         a13, sp, 56 /* [(local16)] */         # 230c: d8e1
            addi         sp, sp, 80 /* (top of frame) */       # 230e: 12c150
            ret           /* [(local6)] */                     # 2311: 0df0

            .literal_position                                  # 2314: 00020060
                                                               # 2318: 00000000
                                                               # 231c: 00000000

# Function @ .irom0.text+0x2320
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_dpd_scale_set
            .type        sdk_dpd_scale_set, @function
sdk_dpd_scale_set:
            addi         sp, sp, -16 /* (local0) */            # 2320: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 2323: 0901
            movi         a5, 0x60000200                        # 2325: 51fbff
            memw                                               # 2328: c02000
            movi         a2, 119 /* 0x00000077 */              # 232b: 22a077
            movi         a3, 0 /* 0x00000000 */                # 232e: 0c03
            movi         a4, 8 /* 0x00000008 */                # 2330: 0c84
            l32i         a5, a5, 0x360 /* [0x60000560] */      # 2332: 5225d8
            movi         a6, sdk_chip6_sleep_params            # 2335: 61f8ff
            movi         a0, sdk_g_phyFuns                     # 2338: 01f9ff
            l8ui         a6, a6, 111 /* [sdk_chip6_sleep_params+0x6f] */ # 233b: 62066f
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 233e: 0800
            neg          a5, a5                                # 2340: 505060
            slli         a5, a5, 24                            # 2343: 805501
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ # 2346: 022026
            srai         a5, a5, 24                            # 2349: 505831
            slli         a6, a6, 24                            # 234c: 806601
            srai         a6, a6, 24                            # 234f: 606831
            sub          a5, a5, a6                            # 2352: 6055c0
            addi         a5, a5, -24                           # 2355: 52c5e8
            extui        a5, a5, 0, 8                          # 2358: 505074
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       # 235b: c00000
            l32i         a0, sp, 0 /* [(local0)] */            # 235e: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 2360: 12c110
            ret                                                # 2363: 0df0

            .literal_position                                  # 2368: 00000000

# Function @ .irom0.text+0x236c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_dpd_mem_write
            .type        sdk_dpd_mem_write, @function
sdk_dpd_mem_write:
            mov          a5, a3 /* arg1 */                     # 236c: 5d03
            addi         sp, sp, -16 /* (local0) */            # 236e: 12c1f0
            movi         a3, 0 /* 0x00000000 */                # 2371: 0c03
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 2373: 0901
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   # 2375: e931
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 2377: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 2379: c911
            mov          a13, a4 /* arg2 */                    # 237b: dd04
            movi         a12, sdk_g_phyFuns                    # 237d: c1faff
            mov          a14, a2 /* arg0 */                    # 2380: ed02
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 2382: 080c
            movi         a2, 119 /* 0x00000077 */              # 2384: 22a077
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ # 2387: 022026
            movi         a4, 27 /* 0x0000001b */               # 238a: 1cb4
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       # 238c: c00000
            movi         a2, 119 /* 0x00000077 */              # 238f: 22a077
            movi         a3, 0 /* 0x00000000 */                # 2392: 0c03
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 2394: 080c
            movi         a4, 5 /* 0x00000005 */                # 2396: 0c54
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ # 2398: 022026
            extui        a5, a14, 4, 8                         # 239b: e05474
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       # 239e: c00000
            extui        a5, a14, 0, 4                         # 23a1: e05034
            movi         a2, 119 /* 0x00000077 */              # 23a4: 22a077
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 23a7: 080c
            movi         a3, 0 /* 0x00000000 */                # 23a9: 0c03
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ # 23ab: 022026
            movi         a4, 6 /* 0x00000006 */                # 23ae: 0c64
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       # 23b0: c00000
            movi         a2, 119 /* 0x00000077 */              # 23b3: 22a077
            movi         a3, 0 /* 0x00000000 */                # 23b6: 0c03
            movi         a4, 15 /* 0x0000000f */               # 23b8: 0cf4
            movi         a5, 4 /* 0x00000004 */                # 23ba: 0c45
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 23bc: 080c
            or           a5, a13, a5                           # 23be: 505d20
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ # 23c1: 022026
            extui        a5, a5, 0, 8                          # 23c4: 505074
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       # 23c7: c00000
            mov          a5, a13 /* arg2 */                    # 23ca: 5d0d
            movi         a2, 119 /* 0x00000077 */              # 23cc: 22a077
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 23cf: 080c
            movi         a3, 0 /* 0x00000000 */                # 23d1: 0c03
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ # 23d3: 022026
            movi         a4, 15 /* 0x0000000f */               # 23d6: 0cf4
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       # 23d8: c00000
            l32i         a12, sp, 4 /* [(local1)] */           # 23db: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 23dd: d821
            l32i         a14, sp, 12 /* [(local3)] */          # 23df: e831
            l32i         a0, sp, 0 /* [(local0)] */            # 23e1: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 23e3: 12c110
            ret                                                # 23e6: 0df0

            .literal_position                                  # 23e8: 000af23f
                                                               # 23ec: 00000000
                                                               # 23f0: 00000000
                                                               # 23f4: 00000000
                                                               # 23f8: 00020060
                                                               # 23fc: 68010000
                                                               # 2400: 00000000
                                                               # 2404: 00000000
                                                               # 2408: 60000000
                                                               # 240c: 00000000
                                                               # 2410: 00000000
                                                               # 2414: 00000000
                                                               # 2418: 00000010
                                                               # 241c: 00000000
                                                               # 2420: 00000000
                                                               # 2424: 00000000
                                                               # 2428: 00000000
                                                               # 242c: 00000000

# Function @ .irom0.text+0x2430
# Local variables/stack:
#     (local0):  hword     @ -0x82
#     (local1):  byte[47]  @ -0x80
#     (local2):  byte      @ -0x51
#     (local3):  hword[2]  @ -0x50
#     (local4):  word      @ -0x4c
#     (local5):  word      @ -0x48
#     (local6):  word      @ -0x44
#     (local7):  word      @ -0x40
#     (local8):  word      @ -0x3c
#     (local9):  word      @ -0x38
#     (local10): word      @ -0x34
#     (local11): word      @ -0x30
#     (local12): word      @ -0x2c
#     (local13): word      @ -0x28
#     (local14): word      @ -0x24
#     (local15): word      @ -0x20
#     (local16): word      @ -0x1c
#     (local17): word      @ -0x18
#     (local18): word      @ -0x14
#     (local19): word      @ -0x10
#     (local20): word      @ -0xc
#     (local21): word[2]   @ -0x8
            .balign      4
            .global      sdk_dpd_init
            .type        sdk_dpd_init, @function
sdk_dpd_init:
            movi         a3, 240 /* 0x000000f0 */              # 2430: 32a0f0
            sub          sp, sp, a3 /* (FP)-0xf0 */            # 2433: 3011c0
            s32i         a0, sp, 172 /* a0 -> [(local6)] */    # 2436: 02612b
            s32i         a14, sp, 184 /* a14 -> [(local9)] */  # 2439: e2612e
            s32i         a13, sp, 180 /* a13 -> [(local8)] */  # 243c: d2612d
            s32i         a15, sp, 188 /* a15 -> [(local10)] */ # 243f: f2612f
            s32i         a2, sp, 192 /* arg0 -> [(local11)] */ # 2442: 226130
            s32i         a12, sp, 176 /* a12 -> [(local7)] */  # 2445: c2612c
            movi         a12, sdk_g_phyFuns                    # 2448: c1e9ff
            movi         a2, 0x3ff20a00                        # 244b: 21e7ff
            movi         a15, sdk_chip6_sleep_params           # 244e: f1e8ff
            memw                                               # 2451: c02000
            l32i         a0, a15, 0 /* [sdk_chip6_sleep_params] */ # 2454: 080f
            l32i         a2, a2, 0x200 /* [0x3ff20c00] */      # 2456: 222280
            extui        a0, a0, 28, 1                         # 2459: 000c05
            bnez         a0, .Lbr206                           # 245c: 568026
            movi         a2, 6 /* 0x00000006 */                # 245f: 0c62
            mov          a3, sp /* (FP)-0xf0 */                # 2461: 3d01
            call0        sdk_tx_atten_set_interp               # 2463: 01efffc0
                                                               # 2467: 0000
            movi         a2, 119 /* 0x00000077 */              # 2469: 22a077
            movi         a3, 0 /* 0x00000000 */                # 246c: 0c03
            movi         a4, 15 /* 0x0000000f */               # 246e: 0cf4
            movi         a5, 1 /* 0x00000001 */                # 2470: 0c15
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 2472: 080c
            movi         a6, 1 /* 0x00000001 */                # 2474: 0c16
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 2476: 022027
            movi         a7, 1 /* 0x00000001 */                # 2479: 0c17
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 247b: c00000
            movi         a2, 107 /* 0x0000006b */              # 247e: 22a06b
            movi         a3, 2 /* 0x00000002 */                # 2481: 0c23
            movi         a4, 10 /* 0x0000000a */               # 2483: 0ca4
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 2485: 080c
            movi         a5, 5 /* 0x00000005 */                # 2487: 0c55
            l32i         a0, a0, 148 /* [[sdk_g_phyFuns]+0x94] */ # 2489: 022025
            movi         a6, 4 /* 0x00000004 */                # 248c: 0c46
            callx0       a0 /* [[sdk_g_phyFuns]+0x94] */       # 248e: c00000
            movi         a3, 2 /* 0x00000002 */                # 2491: 0c23
            movi         a4, 10 /* 0x0000000a */               # 2493: 0ca4
            movi         a5, 5 /* 0x00000005 */                # 2495: 0c55
            movi         a6, 4 /* 0x00000004 */                # 2497: 0c46
            movi         a7, 2 /* 0x00000002 */                # 2499: 0c27
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 249b: 080c
            s32i         a2, sp, 168 /* a2 -> [(local5)] */    # 249d: 22612a
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 24a0: 022027
            movi         a2, 107 /* 0x0000006b */              # 24a3: 22a06b
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 24a6: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 24a9: 080c
            l32i         a0, a0, 160 /* [[sdk_g_phyFuns]+0xa0] */ # 24ab: 022028
            callx0       a0 /* [[sdk_g_phyFuns]+0xa0] */       # 24ae: c00000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 24b1: 080c
            l32i         a0, a0, 192 /* [[sdk_g_phyFuns]+0xc0] */ # 24b3: 022030
            movi         a2, 1 /* 0x00000001 */                # 24b6: 0c12
            callx0       a0 /* [[sdk_g_phyFuns]+0xc0] */       # 24b8: c00000
            movi         a2, sdk_tx_rf_ana_gain                # 24bb: 21ceff
            l16ui        a2, a2, 0 /* [sdk_tx_rf_ana_gain] */  # 24be: 221200
            call0        sdk_ram_pbus_xpd_tx_on                # 24c1: 01d8ffc0
                                                               # 24c5: 0000
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 24c7: 080c
            l32i         a0, a0, 24 /* [[sdk_g_phyFuns]+0x18] */ # 24c9: 0860
            movi         a2, 0 /* 0x00000000 */                # 24cb: 0c02
            callx0       a0 /* [[sdk_g_phyFuns]+0x18] */       # 24cd: c00000
            movi         a13, 0x60000200                       # 24d0: d1caff
            memw                                               # 24d3: c02000
            addi         a14, sp, 112 /* (local1) */           # 24d6: e2c170
            movi         a4, 95 /* 0x0000005f */               # 24d9: 5cf4
            l32i         a13, a13, 0x360 /* [0x60000560] */    # 24db: d22dd8
            movi         a2, 48 /* 0x00000030 */               # 24de: 3c02
            movi         a8, 0 /* 0x00000000 */                # 24e0: 0c08
            movi         a9, 0 /* 0x00000000 */                # 24e2: 0c09
            addmi        a12, sp, -256 /* (FP)-0x1f0 */        # 24e4: c2d1ff
            addi         a12, a12, 16 /* (FP)-0x1e0 */         # 24e7: c2cc10
            s32i         a9, sp, 200 /* 0x00000000 -> [(local13)] */ # 24ea: 926132
            s32i         a8, sp, 204 /* 0x00000000 -> [(local14)] */ # 24ed: 826133
            s32i         a2, sp, 212 /* 0x00000030 -> [(local16)] */ # 24f0: 226135
            neg          a13, a13                              # 24f3: d0d060
            s8i          a13, a15, 111 /* a13 -> [sdk_chip6_sleep_params+0x6f] */ # 24f6: d24f6f
            addi         a13, a13, 31                          # 24f9: d2cd1f
            slli         a13, a13, 24                          # 24fc: 80dd01
            srai         a13, a13, 24                          # 24ff: d0d831
            s32i         a13, sp, 208 /* a13 -> [(local15)] */ # 2502: d26134
            movi         a13, 0 /* 0x00000000 */               # 2505: 0c0d
.Lbr192:    l32i         a3, sp, 208 /* [(local15)] */         # 2507: 322134
            mov          a0, a4 /* 0x0000005f */               # 250a: 0d04
            sub          a3, a3, a13                           # 250c: d033c0
            slli         a3, a3, 24                            # 250f: 803301
            srai         a3, a3, 24                            # 2512: 303831
            blt          a4, a3, .Lbr193                       # 2515: 372401
            mov          a0, a3                                # 2518: 0d03
.Lbr193:    movi         a2, 0 /* 0x00000000 */                # 251a: 0c02
            movgez       a2, a0, a0                            # 251c: 0020b3
            slli         a2, a2, 24                            # 251f: 802201
            srai         a2, a2, 24                            # 2522: 202831
            s32i         a2, sp, 216 /* a2 -> [(local17)] */   # 2525: 226136
            call0        sdk_meas_tone_pwr_db                  # 2528: 050000
            mov          a4, a2                                # 252b: 4d02
            l32i         a0, sp, 208 /* [(local15)] */         # 252d: 022134
            l32i         a2, sp, 216 /* [(local17)] */         # 2530: 222136
            addx2        a15, a13, a12                         # 2533: c0fd90
            sub          a0, a0, a2                            # 2536: 2000c0
            slli         a0, a0, 1                             # 2539: f00011
            bgeui        a13, 4, .Lbr194                       # 253c: f64d18
            s16i         a4, a15, 0x100                        # 253f: 425f80
            l32i         a3, sp, 204 /* [(local14)] */         # 2542: 322133
            sub          a5, a4, a0                            # 2545: 0054c0
            add          a5, a3, a5                            # 2548: 5a53
            slli         a5, a5, 16                            # 254a: 005511
            srai         a3, a5, 16                            # 254d: 503031
            s32i         a3, sp, 204 /* a3 -> [(local14)] */   # 2550: 326133
            mov          a5, a4                                # 2553: 5d04
            j            .Lbr196                               # 2555: 460800
.Lbr194:    bnei         a13, 4, .Lbr195                       # 2558: 664d10
            l32i         a6, sp, 204 /* [(local14)] */         # 255b: 622133
            addi         a7, a6, 2 /* [(local14)]+0x2 */       # 255e: 2b76
            srai         a7, a7, 2                             # 2560: 707221
            slli         a7, a7, 16                            # 2563: 007711
            srai         a6, a7, 16                            # 2566: 706031
            s32i         a6, sp, 204 /* a6 -> [(local14)] */   # 2569: 626133
.Lbr195:    l32i         a5, sp, 204 /* [(local14)] */         # 256c: 522133
            add          a5, a0, a5                            # 256f: 5a50
            slli         a5, a5, 16                            # 2571: 005511
            srai         a5, a5, 16                            # 2574: 505031
            s16i         a5, a15, 0x100                        # 2577: 525f80
.Lbr196:    l32i         a6, sp, 200 /* [(local13)] */         # 257a: 622132
            sub          a0, a5, a4                            # 257d: 4005c0
            bnez         a6, .Lbr197                           # 2580: dc16
            slli         a6, a0, 16                            # 2582: 006011
            srai         a6, a6, 16                            # 2585: 606031
            blti         a6, 2, .Lbr197                        # 2588: a62609
            movi         a7, 1 /* 0x00000001 */                # 258b: 0c17
            addi         a8, a6, -1                            # 258d: 0b86
            s32i         a8, sp, 196 /* a8 -> [(local12)] */   # 258f: 826131
            s32i         a7, sp, 200 /* 0x00000001 -> [(local13)] */ # 2592: 726132
.Lbr197:    l32i         a7, sp, 192 /* [(local11)] */         # 2595: 722130
            movi         a2, 0 /* 0x00000000 */                # 2598: 0c02
            l32i         a6, sp, 196 /* [(local12)] */         # 259a: 622131
            movi         a9, 8 /* 0x00000008 */                # 259d: 0c89
            sub          a6, a0, a6                            # 259f: 6060c0
            mov          a0, a9 /* 0x00000008 */               # 25a2: 0d09
            slli         a6, a6, 16                            # 25a4: 006611
            srai         a6, a6, 16                            # 25a7: 606031
            blt          a9, a6, .Lbr198                       # 25aa: 672901
            mov          a0, a6                                # 25ad: 0d06
.Lbr198:    movgez       a2, a0, a0                            # 25af: 0020b3
            slli         a0, a2, 16                            # 25b2: 000211
            srai         a0, a0, 16                            # 25b5: 000031
            s32i         a0, sp, 164 /* a0 -> [(local4)] */    # 25b8: 026129
            beqz         a7, .Lbr199                           # 25bb: 8cf7
            movi         a2, .Lstr010                          # 25bd: 218fff
            l32i         a3, sp, 216 /* [(local17)] */         # 25c0: 322136
            mov          a6, a0                                # 25c3: 6d00
            call0        ets_printf                            # 25c5: 0198ffc0
                                                               # 25c9: 0000
            l32i         a0, sp, 164 /* [(local4)] */          # 25cb: 022129
.Lbr199:    s16i         a0, a15, 0x100                        # 25ce: 025f80
            movi         a3, sdk_dpd_index                     # 25d1: 318bff
            l32i         a2, sp, 216 /* [(local17)] */         # 25d4: 222136
            movi         a4, 95 /* 0x0000005f */               # 25d7: 5cf4
            add          a2, a2, a3                            # 25d9: 3a22
            add          a3, a13, a14                          # 25db: ea3d
            l8ui         a2, a2, 0                             # 25dd: 220200
            addi         a13, a13, 1                           # 25e0: 1bdd
            s8i          a2, a3, 0                             # 25e2: 224300
            l32i         a3, sp, 212 /* [(local16)] */         # 25e5: 322135
            extui        a13, a13, 0, 16                       # 25e8: d0d0f4
            addi         a3, a3, -1 /* [(local16)]-0x1 */      # 25eb: 0b33
            s32i         a3, sp, 212 /* [(local16)]-0x1 -> [(local16)] */ # 25ed: 326135
            bnez         a3, .Lbr192                           # 25f0: 5633f1
            j            .Lbr213                               # 25f3: c66a00
.Lbr200:    addi         a6, a13, 1                            # 25f6: 1b6d
            addx2        a5, a13, a12                          # 25f8: c05d90
            l16si        a4, a5, 0x100                         # 25fb: 429580
            extui        a13, a6, 0, 16                        # 25fe: 60d0f4
            addx2        a4, a4, a2                            # 2601: 204490
            l16si        a4, a4, 0                             # 2604: 429400
            s16i         a4, a5, 0x100                         # 2607: 425580
            bne          a13, a0, .Lbr200                      # 260a: 079de8
            movi         a2, 119 /* 0x00000077 */              # 260d: 22a077
            movi         a3, 0 /* 0x00000000 */                # 2610: 0c03
            movi         a4, 15 /* 0x0000000f */               # 2612: 0cf4
            movi         a5, 1 /* 0x00000001 */                # 2614: 0c15
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      # 2616: 080f
            movi         a6, 1 /* 0x00000001 */                # 2618: 0c16
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 261a: 022027
            movi         a7, 0 /* 0x00000000 */                # 261d: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 261f: c00000
            movi         a2, 119 /* 0x00000077 */              # 2622: 22a077
            movi         a3, 0 /* 0x00000000 */                # 2625: 0c03
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      # 2627: 080f
            movi         a4, 7 /* 0x00000007 */                # 2629: 0c74
            l32i         a0, a0, 152 /* [[sdk_g_phyFuns]+0x98] */ # 262b: 022026
            movi         a5, 0 /* 0x00000000 */                # 262e: 0c05
            callx0       a0 /* [[sdk_g_phyFuns]+0x98] */       # 2630: c00000
            movi         a2, 119 /* 0x00000077 */              # 2633: 22a077
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      # 2636: 080f
            movi         a3, 0 /* 0x00000000 */                # 2638: 0c03
            l32i         a0, a0, 144 /* [[sdk_g_phyFuns]+0x90] */ # 263a: 022024
            movi         a4, 15 /* 0x0000000f */               # 263d: 0cf4
            callx0       a0 /* [[sdk_g_phyFuns]+0x90] */       # 263f: c00000
            l16ui        a15, sp, 160 /* [(local3)] */         # 2642: f21150
            movi         a12, 0 /* 0x00000000 */               # 2645: 0c0c
            movi         a13, 0 /* 0x00000000 */               # 2647: 0c0d
            movi         a3, 251 /* 0x000000fb */              # 2649: 32a0fb
            movi         a4, 256 /* 0x00000100 */              # 264c: 42a100
            l8ui         a10, sp, 112 /* [(local1)] */         # 264f: a20170
            s32i         a10, sp, 220 /* [(local1)] -> [(local18)] */ # 2652: a26137
            s32i         a4, sp, 228 /* 0x00000100 -> [(local20)] */ # 2655: 426139
            and          a2, a2, a3                            # 2658: 302210
            s32i         a2, sp, 224 /* a2 -> [(local19)] */   # 265b: 226138
.Lbr201:    l32i         a11, sp, 220 /* [(local18)] */        # 265e: b22137
            l8ui         a2, sp, 159 /* [(local2)] */          # 2661: 22019f
            bltu         a13, a11, .Lbr202                     # 2664: b73d02
            j            .Lbr207                               # 2667: 462800
.Lbr202:    movi         a15, 1024 /* 0x00000400 */            # 266a: f2a400
.Lbr203:    movi         a0, 1024 /* 0x00000400 */             # 266d: 02a400
            movi         a2, 2047 /* 0x000007ff */             # 2670: 22a7ff
            mov          a5, a2 /* 0x000007ff */               # 2673: 5d02
            mov          a3, a0 /* 0x00000400 */               # 2675: 3d00
            bltu         a2, a15, .Lbr204                      # 2677: f73201
            mov          a5, a15                               # 267a: 5d0f
.Lbr204:    bltu         a5, a0, .Lbr205                       # 267c: 073501
            mov          a3, a5                                # 267f: 3d05
.Lbr205:    extui        a15, a3, 0, 16                        # 2681: 30f0f4
            l32i         a4, sp, 224 /* [(local19)] */         # 2684: 422138
            extui        a3, a13, 0, 8                         # 2687: d03074
            mov          a2, a15                               # 268a: 2d0f
            call0        sdk_dpd_mem_write                     # 268c: 050000
            l32i         a0, sp, 228 /* [(local20)] */         # 268f: 022139
            addi         a13, a13, 1                           # 2692: 1bdd
            extui        a13, a13, 0, 16                       # 2694: d0d0f4
            addi         a0, a0, -1 /* [(local20)]-0x1 */      # 2697: 0b00
            s32i         a0, sp, 228 /* [(local20)]-0x1 -> [(local20)] */ # 2699: 026139
            bnez         a0, .Lbr201                           # 269c: 56e0fb
            l32i         a7, sp, 168 /* [(local5)] */          # 269f: 72212a
            movi         a2, 107 /* 0x0000006b */              # 26a2: 22a06b
            movi         a3, 2 /* 0x00000002 */                # 26a5: 0c23
            movi         a0, sdk_g_phyFuns                     # 26a7: 0159ff
            movi         a4, 10 /* 0x0000000a */               # 26aa: 0ca4
            l32i         a0, a0, 0 /* [sdk_g_phyFuns] */       # 26ac: 0800
            movi         a5, 5 /* 0x00000005 */                # 26ae: 0c55
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 26b0: 022027
            movi         a6, 4 /* 0x00000004 */                # 26b3: 0c46
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 26b5: c00000
            movi         a3, sdk_chip6_sleep_params            # 26b8: 3157ff
            movi         a4, 0x10000000                        # 26bb: 4157ff
            l32i         a2, a3, 0 /* [sdk_chip6_sleep_params] */ # 26be: 2803
            movi         a12, sdk_g_phyFuns                    # 26c0: c154ff
            or           a2, a2, a4                            # 26c3: 402220
            s32i         a2, a3, 0 /* a2 -> [sdk_chip6_sleep_params] */ # 26c6: 2903
.Lbr206:    movi         a2, 119 /* 0x00000077 */              # 26c8: 22a077
            movi         a3, 0 /* 0x00000000 */                # 26cb: 0c03
            movi         a4, 15 /* 0x0000000f */               # 26cd: 0cf4
            movi         a5, 1 /* 0x00000001 */                # 26cf: 0c15
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 26d1: 080c
            movi         a6, 1 /* 0x00000001 */                # 26d3: 0c16
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 26d5: 022027
            movi         a7, 0 /* 0x00000000 */                # 26d8: 0c07
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 26da: c00000
            call0        sdk_dpd_scale_set                     # 26dd: 050000
            movi         a2, 119 /* 0x00000077 */              # 26e0: 22a077
            movi         a3, 0 /* 0x00000000 */                # 26e3: 0c03
            movi         a4, 27 /* 0x0000001b */               # 26e5: 1cb4
            movi         a5, 7 /* 0x00000007 */                # 26e7: 0c75
            l32i         a0, a12, 0 /* [sdk_g_phyFuns] */      # 26e9: 080c
            movi         a6, 0 /* 0x00000000 */                # 26eb: 0c06
            l32i         a0, a0, 156 /* [[sdk_g_phyFuns]+0x9c] */ # 26ed: 022027
            movi         a7, 255 /* 0x000000ff */              # 26f0: 72a0ff
            callx0       a0 /* [[sdk_g_phyFuns]+0x9c] */       # 26f3: c00000
            l32i         a12, sp, 176 /* [(local7)] */         # 26f6: c2212c
            l32i         a13, sp, 180 /* [(local8)] */         # 26f9: d2212d
            l32i         a14, sp, 184 /* [(local9)] */         # 26fc: e2212e
            l32i         a15, sp, 188 /* [(local10)] */        # 26ff: f2212f
            movi         a2, 240 /* 0x000000f0 */              # 2702: 22a0f0
            l32i         a0, sp, 172 /* [(local6)] */          # 2705: 02212b
            add          sp, sp, a2 /* (top of frame) */       # 2708: 2a11
            ret           /* 0x000000f0 */                     # 270a: 0df0
.Lbr207:    bgeu         a2, a13, .Lbr208                      # 270c: d7b205
            l16ui        a15, sp, 110 /* [(local0)] */         # 270f: f21137
            j            .Lbr203                               # 2712: c6d5ff
.Lbr208:    addi         a2, sp, -16 /* (FP)-0x100 */          # 2715: 22c1f0
            add          a2, a12, a2                           # 2718: 2a2c
            l8ui         a0, a2, 128                           # 271a: 020280
            add          a3, a12, a14                          # 271d: ea3c
            bgeu         a0, a13, .Lbr210                      # 271f: d7b01d
            l8ui         a3, a3, 0                             # 2722: 320300
            bgeu         a3, a13, .Lbr211                      # 2725: d7b357
.Lbr209:    addi         a12, a12, 1                           # 2728: 1bcc
            extui        a12, a12, 0, 8                        # 272a: c0c074
            add          a4, a12, a14                          # 272d: ea4c
            l8ui         a4, a4, 0                             # 272f: 420400
            bltu         a4, a13, .Lbr209                      # 2732: d734f2
            addi         a0, sp, -16 /* (FP)-0x100 */          # 2735: 02c1f0
            add          a0, a12, a0                           # 2738: 0a0c
            l8ui         a0, a0, 128                           # 273a: 020080
            j            .Lbr211                               # 273d: c60f00
.Lbr210:    s32i         a0, sp, 232 /* a0 -> [(local21)] */   # 2740: 02613a
            bgeu         a13, a0, .Lbr211                      # 2743: 07bd39
            movi         a5, 1 /* 0x00000001 */                # 2746: 0c15
            l8ui         a4, a2, 127                           # 2748: 42027f
            addmi        a2, sp, -256 /* (FP)-0x1f0 */         # 274b: 22d1ff
            sub          a3, a0, a4                            # 274e: 4030c0
            addi         a2, a2, 16 /* (FP)-0x1e0 */           # 2751: 22c210
            sub          a4, a13, a4                           # 2754: 404dc0
            addx2        a2, a12, a2                           # 2757: 202c90
            extui        a3, a3, 0, 8                          # 275a: 303074
            l16si        a15, a2, 254                          # 275d: f2927f
            l16si        a2, a2, 0x100                         # 2760: 229280
            moveqz       a3, a5, a3                            # 2763: 303583
            sub          a2, a2, a15                           # 2766: f022c0
            slli         a2, a2, 16                            # 2769: 002211
            srai         a2, a2, 16                            # 276c: 202031
            mull         a2, a2, a4                            # 276f: 402282
            call0        __divsi3                              # 2772: 012effc0
                                                               # 2776: 0000
            l32i         a0, sp, 232 /* [(local21)] */         # 2778: 02213a
            add          a15, a15, a2                          # 277b: 2aff
            extui        a15, a15, 0, 16                       # 277d: f0f0f4
.Lbr211:    sub          a2, a0, a13                           # 2780: d020c0
            bnez         a2, .Lbr203                           # 2783: 5662ee
            movi         a3, 46 /* 0x0000002e */               # 2786: 2ce3
            addmi        a15, sp, -256 /* (FP)-0x1f0 */        # 2788: f2d1ff
            addi         a15, a15, 16 /* (FP)-0x1e0 */         # 278b: f2cf10
            addx2        a15, a12, a15                         # 278e: f0fc90
            l16ui        a15, a15, 0x100                       # 2791: f21f80
            bgeu         a3, a12, .Lbr212                      # 2794: c7b302
            j            .Lbr203                               # 2797: 86b4ff
.Lbr212:    addi         a12, a12, 1                           # 279a: 1bcc
            extui        a12, a12, 0, 8                        # 279c: c0c074
            j            .Lbr203                               # 279f: 86b2ff
.Lbr213:    movi         a15, sdk_g_phyFuns                    # 27a2: f11eff
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      # 27a5: 080f
            l32i         a0, a0, 200 /* [[sdk_g_phyFuns]+0xc8] */ # 27a7: 022032
            callx0       a0 /* [[sdk_g_phyFuns]+0xc8] */       # 27aa: c00000
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      # 27ad: 080f
            l32i         a0, a0, 196 /* [[sdk_g_phyFuns]+0xc4] */ # 27af: 022031
            callx0       a0 /* [[sdk_g_phyFuns]+0xc4] */       # 27b2: c00000
            l32i         a0, a15, 0 /* [sdk_g_phyFuns] */      # 27b5: 080f
            l32i         a0, a0, 188 /* [[sdk_g_phyFuns]+0xbc] */ # 27b7: 02202f
            callx0       a0 /* [[sdk_g_phyFuns]+0xbc] */       # 27ba: c00000
            movi         a13, 47 /* 0x0000002f */              # 27bd: 2cfd
.Lbr214:    addx2        a15, a13, a12                         # 27bf: c0fd90
            l16si        a2, a15, 254                          # 27c2: 229f7f
            addi         a13, a13, -1                          # 27c5: 0bdd
            l16si        a5, a15, 0x100                        # 27c7: 529f80
            extui        a13, a13, 0, 16                       # 27ca: d0d0f4
            bge          a5, a2, .Lbr215                       # 27cd: 27a502
            s16i         a5, a15, 254                          # 27d0: 525f7f
.Lbr215:    bnez         a13, .Lbr214                          # 27d3: 568dfe
            movi         a0, 48 /* 0x00000030 */               # 27d6: 3c00
            movi         a15, sdk_g_phyFuns                    # 27d8: f10bff
            movi         a13, 0 /* 0x00000000 */               # 27db: 0c0d
            movi         a2, sdk_dpd_db2linear                 # 27dd: 210aff
            j            .Lbr200                               # 27e0: 8684ff

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "%3d,%3d; "                           #    0: 2533642c
                                                               #    4: 2533643b
                                                               #    8: 2000
            .balign      4
.Lstr002:   .asciz       "txiq_gain=%d, txiq_phase=%d\n"       #    c: 74786971
                                                               #   10: 5f676169
                                                               #   14: 6e3d2564
                                                               #   18: 2c207478
                                                               #   1c: 69715f70
                                                               #   20: 68617365
                                                               #   24: 3d25640a
                                                               #   28: 00
            .balign      4
.Lstr003:   .asciz       "TXPW1, %d, %d, %d, %d, %d, %d\n"     #   2c: 54585057
                                                               #   30: 312c2025
                                                               #   34: 642c2025
                                                               #   38: 642c2025
                                                               #   3c: 642c2025
                                                               #   40: 642c2025
                                                               #   44: 642c2025
                                                               #   48: 640a00
            .balign      4
.Lstr004:   .asciz       "TX_PWCTRL, tot_p=%d, docal_p=%d, coatt=%d, att=%d, rf_g=%x, error=%d, %d, %d, %d, %d, hpc=%d, %d\n" #   4c: 54585f50
                                                               #   50: 57435452
                                                               #   54: 4c2c2074
                                                               #   58: 6f745f70
                                                               #   5c: 3d25642c
                                                               #   60: 20646f63
                                                               #   64: 616c5f70
                                                               #   68: 3d25642c
                                                               #   6c: 20636f61
                                                               #   70: 74743d25
                                                               #   74: 642c2061
                                                               #   78: 74743d25
                                                               #   7c: 642c2072
                                                               #   80: 665f673d
                                                               #   84: 25782c20
                                                               #   88: 6572726f
                                                               #   8c: 723d2564
                                                               #   90: 2c202564
                                                               #   94: 2c202564
                                                               #   98: 2c202564
                                                               #   9c: 2c202564
                                                               #   a0: 2c206870
                                                               #   a4: 633d2564
                                                               #   a8: 2c202564
                                                               #   ac: 0a00
            .balign      4
.Lstr005:   .asciz       "periodic_cal num: %d\n"              #   b0: 70657269
                                                               #   b4: 6f646963
                                                               #   b8: 5f63616c
                                                               #   bc: 206e756d
                                                               #   c0: 3a202564
                                                               #   c4: 0a00
            .balign      4
.Lstr006:   .asciz       "num_k=%d, power_out=%d, "            #   c8: 6e756d5f
                                                               #   cc: 6b3d2564
                                                               #   d0: 2c20706f
                                                               #   d4: 7765725f
                                                               #   d8: 6f75743d
                                                               #   dc: 25642c20
                                                               #   e0: 00
            .balign      4
.Lstr007:   .asciz       "reg_i=%d, indata=%d, "               #   e4: 7265675f
                                                               #   e8: 693d2564
                                                               #   ec: 2c20696e
                                                               #   f0: 64617461
                                                               #   f4: 3d25642c
                                                               #   f8: 2000
            .balign      4
.Lstr008:   .asciz       "pwctrl: rate_i=%d, target_power=%d, detect_power=%d, rate_atten=%d, " #   fc: 70776374
                                                               #  100: 726c3a20
                                                               #  104: 72617465
                                                               #  108: 5f693d25
                                                               #  10c: 642c2074
                                                               #  110: 61726765
                                                               #  114: 745f706f
                                                               #  118: 7765723d
                                                               #  11c: 25642c20
                                                               #  120: 64657465
                                                               #  124: 63745f70
                                                               #  128: 6f776572
                                                               #  12c: 3d25642c
                                                               #  130: 20726174
                                                               #  134: 655f6174
                                                               #  138: 74656e3d
                                                               #  13c: 25642c20
                                                               #  140: 00
            .balign      4
.Lstr009:   .asciz       "rxiq_get_mis: total_pwr=%d, %d-%d, " #  144: 72786971
                                                               #  148: 5f676574
                                                               #  14c: 5f6d6973
                                                               #  150: 3a20746f
                                                               #  154: 74616c5f
                                                               #  158: 7077723d
                                                               #  15c: 25642c20
                                                               #  160: 25642d25
                                                               #  164: 642c2000
.Lstr010:   .asciz       "%d, %d, %d, %d, "                    #  168: 25642c20
                                                               #  16c: 25642c20
                                                               #  170: 25642c20
                                                               #  174: 25642c20
                                                               #  178: 00

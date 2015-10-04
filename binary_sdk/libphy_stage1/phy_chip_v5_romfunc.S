
            .section     .text, "ax", @progbits

            .literal_position                                  #    0: 00000000

# Function @ .text+0x4
            .balign      4
            .global      phy_get_romfuncs
            .type        phy_get_romfuncs, @function
phy_get_romfuncs:
            movi         a2, g_phyFuns                         #    4: 21ffff
            l32i         a2, a2, 0 /* [g_phyFuns] */           #    7: 2802
            ret           /* [g_phyFuns] */                    #    9: 0df0

            .section     .data, "aw", @progbits

            .global      g_phyFuns
            .type        g_phyFuns, @object
g_phyFuns:  .word        g_phyFuns_instance                    #    0: 00000000
            .global      g_phyFuns_instance
            .type        g_phyFuns_instance, @object
g_phyFuns_instance:
            .word        rom_abs_temp                          #    4: 00000000
.Lrel002:   .word        rom_chip_v5_disable_cca               #    8: 00000000
.Lrel003:   .word        rom_chip_v5_enable_cca                #    c: 00000000
.Lrel004:   .word        rom_chip_v5_sense_backoff             #   10: 00000000
.Lrel005:   .word        rom_dc_iq_est                         #   14: 00000000

# NOTE: 4 non-alignment zero bytes skipped.

            .skip        4
.Lrel006:   .word        rom_en_pwdet                          #   1c: 00000000
.Lrel007:   .word        rom_get_bb_atten                      #   20: 00000000
.Lrel008:   .word        rom_get_corr_power                    #   24: 00000000
.Lrel009:   .word        rom_get_fm_sar_dout                   #   28: 00000000
.Lrel010:   .word        rom_get_noisefloor                    #   2c: 00000000
.Lrel011:   .word        rom_get_power_db                      #   30: 00000000
.Lrel012:   .word        rom_iq_est_disable                    #   34: 00000000
.Lrel013:   .word        rom_iq_est_enable                     #   38: 00000000
.Lrel014:   .word        rom_linear_to_db                      #   3c: 00000000
.Lrel015:   .word        rom_set_txclk_en                      #   40: 00000000
.Lrel016:   .word        rom_set_rxclk_en                      #   44: 00000000
.Lrel017:   .word        rom_mhz2ieee                          #   48: 00000000
.Lrel018:   .word        rom_rxiq_get_mis                      #   4c: 00000000
.Lrel019:   .word        rom_sar_init                          #   50: 00000000
.Lrel020:   .word        rom_set_ana_inf_tx_scale              #   54: 00000000
.Lrel021:   .word        rom_set_loopback_gain                 #   58: 00000000
.Lrel022:   .word        rom_set_noise_floor                   #   5c: 00000000

# NOTE: 8 non-alignment zero bytes skipped.

            .skip        8
.Lrel023:   .word        rom_start_noisefloor                  #   68: 00000000
.Lrel024:   .word        rom_start_tx_tone                     #   6c: 00000000
.Lrel025:   .word        rom_stop_tx_tone                      #   70: 00000000
.Lrel026:   .word        rom_txtone_linear_pwr                 #   74: 00000000
.Lrel027:   .word        rom_tx_mac_disable                    #   78: 00000000
.Lrel028:   .word        rom_tx_mac_enable                     #   7c: 00000000
.Lrel029:   .word        rom_ana_inf_gating_en                 #   80: 00000000
.Lrel030:   .word        rom_set_channel_freq                  #   84: 00000000
.Lrel031:   .word        rom_chip_50_set_channel               #   88: 00000000
.Lrel032:   .word        rom_chip_v5_rx_init                   #   8c: 00000000
.Lrel033:   .word        rom_chip_v5_tx_init                   #   90: 00000000
.Lrel034:   .word        rom_i2c_readReg                       #   94: 00000000
.Lrel035:   .word        rom_i2c_readReg_Mask                  #   98: 00000000
.Lrel036:   .word        rom_i2c_writeReg                      #   9c: 00000000
.Lrel037:   .word        rom_i2c_writeReg_Mask                 #   a0: 00000000
.Lrel038:   .word        rom_pbus_debugmode                    #   a4: 00000000
.Lrel039:   .word        rom_pbus_enter_debugmode              #   a8: 00000000
.Lrel040:   .word        rom_pbus_exit_debugmode               #   ac: 00000000
.Lrel041:   .word        rom_pbus_force_test                   #   b0: 00000000
.Lrel042:   .word        rom_pbus_rd                           #   b4: 00000000
.Lrel043:   .word        rom_pbus_set_rxgain                   #   b8: 00000000
.Lrel044:   .word        rom_pbus_set_txgain                   #   bc: 00000000
.Lrel045:   .word        rom_pbus_workmode                     #   c0: 00000000
.Lrel046:   .word        rom_pbus_xpd_rx_off                   #   c4: 00000000
.Lrel047:   .word        rom_pbus_xpd_rx_on                    #   c8: 00000000
.Lrel048:   .word        rom_pbus_xpd_tx_off                   #   cc: 00000000
.Lrel049:   .word        rom_pbus_xpd_tx_on                    #   d0: 00000000
.Lrel050:   .word        rom_pbus_xpd_tx_on__low_gain          #   d4: 00000000
.Lrel051:   .word        rom_phy_reset_req                     #   d8: 00000000
.Lrel052:   .word        rom_restart_cal                       #   dc: 00000000
.Lrel053:   .word        rom_rfpll_reset                       #   e0: 00000000
.Lrel054:   .word        rom_write_rfpll_sdm                   #   e4: 00000000
.Lrel055:   .word        rom_rfpll_set_freq                    #   e8: 00000000
.Lrel056:   .word        rom_cal_tos_v50                       #   ec: 00000000
.Lrel057:   .word        rom_pbus_dco___SA2                    #   f0: 00000000
.Lrel058:   .word        rom_rfcal_pwrctrl                     #   f4: 00000000
.Lrel059:   .word        rom_rfcal_rxiq                        #   f8: 00000000
.Lrel060:   .word        rom_rfcal_rxiq_set_reg                #   fc: 00000000
.Lrel061:   .word        rom_rfcal_txcap                       #  100: 00000000
.Lrel062:   .word        rom_rfcal_txiq                        #  104: 00000000
.Lrel063:   .word        rom_rfcal_txiq_cover                  #  108: 00000000
.Lrel064:   .word        rom_rfcal_txiq_set_reg                #  10c: 00000000
.Lrel065:   .word        rom_rxiq_cover_mg_mp                  #  110: 00000000
.Lrel066:   .word        rom_set_txbb_atten                    #  114: 00000000
.Lrel067:   .word        rom_set_txiq_cal                      #  118: 00000000

            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
            .balign      4
            .global      rom_abs_temp
            .type        rom_abs_temp, @function
rom_abs_temp:
            neg          a4, a2                                #    0: 204060
            movgez       a4, a2, a2                            #    3: 2042b3
            mov          a2, a4                                #    6: 2d04
            ret                                                #    8: 0df0

            .literal_position                                  #    c: 00000010
                                                               #   10: 009a0060

# Function @ .irom0.text+0x14
            .balign      4
            .global      rom_chip_v5_disable_cca
            .type        rom_chip_v5_disable_cca, @function
rom_chip_v5_disable_cca:
            movi         a4, 0x10000000                        #   14: 41feff
            movi         a3, 0x60009a00                        #   17: 31feff
            memw                                               #   1a: c02000
            l32i         a2, a3, 0x100 /* [0x60009b00] */      #   1d: 222340
            or           a2, a2, a4                            #   20: 402220
            memw                                               #   23: c02000
            s32i         a2, a3, 0x100 /* a2 -> [0x60009b00] */ #   26: 226340
            ret                                                #   29: 0df0

            .literal_position                                  #   2c: ffffffef
                                                               #   30: 009a0060

# Function @ .irom0.text+0x34
            .balign      4
            .global      rom_chip_v5_enable_cca
            .type        rom_chip_v5_enable_cca, @function
rom_chip_v5_enable_cca:
            movi         a4, 0xefffffff                        #   34: 41feff
            movi         a3, 0x60009a00                        #   37: 31feff
            memw                                               #   3a: c02000
            l32i         a2, a3, 0x100 /* [0x60009b00] */      #   3d: 222340
            and          a2, a2, a4                            #   40: 402210
            memw                                               #   43: c02000
            s32i         a2, a3, 0x100 /* a2 -> [0x60009b00] */ #   46: 226340
            ret                                                #   49: 0df0

            .literal_position                                  #   4c: 00fc0100
                                                               #   50: ff03feff
                                                               #   54: 009a0060

# Function @ .irom0.text+0x58
            .balign      4
            .global      rom_chip_v5_sense_backoff
            .type        rom_chip_v5_sense_backoff, @function
rom_chip_v5_sense_backoff:
            movi         a3, 0xfffe03ff                        #   58: 31feff
            movi         a7, 0x60009a00                        #   5b: 71feff
            slli         a5, a2, 24                            #   5e: 805201
            srai         a5, a5, 24                            #   61: 505831
            bbsi         a2, 7, .Lbr001                        #   64: 77e205
            slli         a4, a2, 10                            #   67: 604211
            j            .Lbr002                               #   6a: 860000
.Lbr001:    movi         a4, 0x0001fc00                        #   6d: 41f7ff
.Lbr002:    memw                                               #   70: c02000
            l32i         a11, a7, 0x228 /* [0x60009c28] */     #   73: b2278a
            and          a11, a11, a3                          #   76: 30bb10
            or           a11, a11, a4                          #   79: 40bb20
            memw                                               #   7c: c02000
            s32i         a11, a7, 0x228 /* a11 -> [0x60009c28] */ #   7f: b2678a
            movi         a10, 254 /* 0x000000fe */             #   82: a2a0fe
            slli         a8, a2, 1                             #   85: f08211
            movi         a9, -255 /* 0xffffff01 */             #   88: 92af01
            movltz       a8, a10, a5                           #   8b: 508aa3
            memw                                               #   8e: c02000
            l32i         a6, a7, 0x324 /* [0x60009d24] */      #   91: 6227c9
            and          a6, a6, a9                            #   94: 906610
            or           a6, a6, a8                            #   97: 806620
            memw                                               #   9a: c02000
            s32i         a6, a7, 0x324 /* a6 -> [0x60009d24] */ #   9d: 6267c9
            ret           /* arg0 */                           #   a0: 0df0

            .literal_position                                  #   a4: 00000000
                                                               #   a8: 00020060
                                                               #   ac: 00020060
                                                               #   b0: 00000000
                                                               #   b4: 00000000
                                                               #   b8: 00000000

# Function @ .irom0.text+0xbc
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      rom_dc_iq_est
            .type        rom_dc_iq_est, @function
rom_dc_iq_est:
            addi         sp, sp, -16 /* (local0) */            #   bc: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #   bf: d921
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   c1: 0901
            movi         a0, g_phyFuns                         #   c3: 01f8ff
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   c6: c911
            l32i         a0, a0, 0 /* [g_phyFuns] */           #   c8: 0800
            mov          a12, a4 /* arg2 */                    #   ca: cd04
            l32i         a0, a0, 52 /* [[g_phyFuns]+0x34] */   #   cc: 08d0
            mov          a13, a3 /* arg1 */                    #   ce: dd03
            callx0       a0 /* [[g_phyFuns]+0x34] */           #   d0: c00000
            addi         a13, a13, 1 /* arg1+0x1 */            #   d3: 1bdd
            movi         a2, 0x60000200                        #   d5: 21f4ff
            memw                                               #   d8: c02000
            l32i         a2, a2, 0x3dc /* [0x600005dc] */      #   db: 2222f7
            mov          a3, a13 /* arg1+0x1 */                #   de: 3d0d
            srai         a2, a2, 6                             #   e0: 202621
            call0        __divsi3                              #   e3: 01f4ffc0
                                                               #   e7: 0000
            s32i         a2, a12, 0 /* a2 -> [arg2] */         #   e9: 290c
            mov          a3, a13 /* arg1+0x1 */                #   eb: 3d0d
            memw                                               #   ed: c02000
            movi         a2, 0x60000200                        #   f0: 21efff
            l32i         a2, a2, 0x3e0 /* [0x600005e0] */      #   f3: 2222f8
            srai         a2, a2, 6                             #   f6: 202621
            call0        __divsi3                              #   f9: 01efffc0
                                                               #   fd: 0000
            movi         a0, g_phyFuns                         #   ff: 01ecff
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  102: 0800
            l32i         a0, a0, 48 /* [[g_phyFuns]+0x30] */   #  104: 08c0
            s32i         a2, a12, 4 /* a2 -> [arg2+0x4] */     #  106: 291c
            callx0       a0 /* [[g_phyFuns]+0x30] */           #  108: c00000
            l32i         a12, sp, 4 /* [(local1)] */           #  10b: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  10d: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  10f: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  111: 12c110
            ret                                                #  114: 0df0

            .literal_position                                  #  118: 00000000
                                                               #  11c: ffffdfff
                                                               #  120: 000a0060
                                                               #  124: ffff7fff

# Function @ .irom0.text+0x128
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      rom_en_pwdet
            .type        rom_en_pwdet, @function
rom_en_pwdet:
            addi         sp, sp, -16 /* (local0) */            #  128: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  12b: 0901
            movi         a0, g_phyFuns                         #  12d: 01faff
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  130: 0800
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  132: c911
            l32i         a0, a0, 76 /* [[g_phyFuns]+0x4c] */   #  134: 022013
            mov          a12, a2 /* arg0 */                    #  137: cd02
            callx0       a0 /* [[g_phyFuns]+0x4c] */           #  139: c00000
            movi         a6, 0xffdfffff                        #  13c: 61f8ff
            movi         a2, 0x60000a00                        #  13f: 21f8ff
            memw                                               #  142: c02000
            l32i         a5, a2, 0x35c /* [0x60000d5c] */      #  145: 5222d7
            and          a5, a5, a6                            #  148: 605510
            memw                                               #  14b: c02000
            s32i         a5, a2, 0x35c /* a5 -> [0x60000d5c] */ #  14e: 5262d7
            movi         a4, 0xff7fffff                        #  151: 41f4ff
            memw                                               #  154: c02000
            l32i         a3, a2, 0x35c /* [0x60000d5c] */      #  157: 3222d7
            and          a3, a3, a4                            #  15a: 403310
            memw                                               #  15d: c02000
            s32i         a3, a2, 0x35c /* a3 -> [0x60000d5c] */ #  160: 3262d7
            bnez         a12, .Lbr003                          #  163: dc2c
            movi         a8, -2 /* 0xfffffffe */               #  165: 7ce8
            memw                                               #  167: c02000
            l32i         a7, a2, 0x350 /* [0x60000d50] */      #  16a: 7222d4
            and          a7, a7, a8                            #  16d: 807710
            memw                                               #  170: c02000
            s32i         a7, a2, 0x350 /* a7 -> [0x60000d50] */ #  173: 7262d4
            j            .Lbr004                               #  176: c60400
.Lbr003:    bnei         a12, 1, .Lbr004                       #  179: 661c10
            movi         a10, 1 /* 0x00000001 */               #  17c: 0c1a
            memw                                               #  17e: c02000
            l32i         a9, a2, 0x350 /* [0x60000d50] */      #  181: 9222d4
            or           a9, a9, a10                           #  184: a09920
            memw                                               #  187: c02000
            s32i         a9, a2, 0x350 /* a9 -> [0x60000d50] */ #  18a: 9262d4
.Lbr004:    l32i         a12, sp, 4 /* [(local1)] */           #  18d: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  18f: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  191: 12c110
            ret           /* 0x60000a00 */                     #  194: 0df0

            .balign      4
# Function @ .irom0.text+0x198
            .balign      4
            .global      rom_get_bb_atten
            .type        rom_get_bb_atten, @function
rom_get_bb_atten:
            movi         a4, 0 /* 0x00000000 */                #  198: 0c04
            addi         a5, a2, 8 /* arg0+0x8 */              #  19a: 8b52
            movi         a2, 127 /* 0x0000007f */              #  19c: 22a07f
            subx4        a5, a5, a3                            #  19f: 3055e0
            slli         a5, a5, 16                            #  1a2: 005511
            srai         a5, a5, 16                            #  1a5: 505031
            movgez       a4, a5, a5                            #  1a8: 5045b3
            slli         a4, a4, 16                            #  1ab: 004411
            srai         a3, a4, 16                            #  1ae: 403031
            bgei         a3, 128, .Lbr005                      #  1b1: e6e301
            mov          a2, a3                                #  1b4: 2d03
.Lbr005:    slli         a2, a2, 24                            #  1b6: 802201
            srai         a2, a2, 24                            #  1b9: 202831
            ret                                                #  1bc: 0df0

            .literal_position                                  #  1c0: 00020060

# Function @ .irom0.text+0x1c4
            .balign      4
            .global      rom_get_corr_power
            .type        rom_get_corr_power, @function
rom_get_corr_power:
            movi         a7, 0x60000200                        #  1c4: 71ffff
            memw                                               #  1c7: c02000
            l32i         a4, a7, 0x380 /* [0x60000580] */      #  1ca: 4227e0
            srai         a4, a4, 18                            #  1cd: 404231
            memw                                               #  1d0: c02000
            l32i         a5, a7, 0x384 /* [0x60000584] */      #  1d3: 5227e1
            srai         a5, a5, 18                            #  1d6: 505231
            memw                                               #  1d9: c02000
            l32i         a10, a7, 0x388 /* [0x60000588] */     #  1dc: a227e2
            srai         a10, a10, 18                          #  1df: a0a231
            memw                                               #  1e2: c02000
            l32i         a11, a7, 0x38c /* [0x6000058c] */     #  1e5: b227e3
            addi         a8, a3, -2 /* arg1-0x2 */             #  1e8: 82c3fe
            srai         a11, a11, 18                          #  1eb: b0b231
            memw                                               #  1ee: c02000
            l32i         a6, a7, 0x3dc /* [0x600005dc] */      #  1f1: 6227f7
            ssr          a8                                    #  1f4: 000840
            sra          a6, a6                                #  1f7: 6060b1
            memw                                               #  1fa: c02000
            l32i         a9, a7, 0x3e0 /* [0x600005e0] */      #  1fd: 9227f8
            ssr          a8                                    #  200: 000840
            sra          a9, a9                                #  203: 9090b1
            memw                                               #  206: c02000
            ssr          a8                                    #  209: 000840
            l32i         a7, a7, 0x3e4 /* [0x600005e4] */      #  20c: 7227f9
            mull         a9, a9, a9                            #  20f: 909982
            mull         a6, a6, a6                            #  212: 606682
            add          a4, a4, a11                           #  215: ba44
            sub          a5, a5, a10                           #  217: a055c0
            mull         a5, a5, a5                            #  21a: 505582
            mull         a4, a4, a4                            #  21d: 404482
            add          a6, a6, a9                            #  220: 9a66
            sra          a7, a7                                #  222: 7070b1
            s32i         a7, a2, 0 /* a7 -> [arg0] */          #  225: 7902
            add          a4, a4, a5                            #  227: 5a44
            srai         a6, a6, 16                            #  229: 606031
            s32i         a6, a2, 8 /* a6 -> [arg0+0x8] */      #  22c: 6922
            movi         a5, -22 /* 0xffffffea */              #  22e: 6ca5
            addx2        a5, a3, a5                            #  230: 505390
            ssr          a5                                    #  233: 000540
            sra          a4, a4                                #  236: 4040b1
            s32i         a4, a2, 4 /* a4 -> [arg0+0x4] */      #  239: 4912
            ret           /* arg0 */                           #  23b: 0df0

            .literal_position                                  #  240: 000a0060
                                                               #  244: 00000000

# Function @ .irom0.text+0x248
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
            .global      rom_get_fm_sar_dout
            .type        rom_get_fm_sar_dout, @function
rom_get_fm_sar_dout:
            addi         sp, sp, -32 /* (FP)-0x20 */           #  248: 12c1e0
            s32i         a0, sp, 16 /* a0 -> [(local7)] */     #  24b: 0941
            s32i         a12, sp, 20 /* a12 -> [(local8)] */   #  24d: c951
            mov          a5, a2 /* arg0 */                     #  24f: 5d02
            movi         a6, -3 /* 0xfffffffd */               #  251: 7cd6
            movi         a12, 0x60000a00                       #  253: c1fbff
            memw                                               #  256: c02000
            l32i         a4, a12, 0x350 /* [0x60000d50] */     #  259: 422cd4
            and          a4, a4, a6                            #  25c: 604410
            memw                                               #  25f: c02000
            s32i         a4, a12, 0x350 /* a4 -> [0x60000d50] */ #  262: 426cd4
            movi         a2, 2 /* 0x00000002 */                #  265: 0c22
            memw                                               #  267: c02000
            l32i         a0, a12, 0x350 /* [0x60000d50] */     #  26a: 022cd4
            or           a0, a0, a2                            #  26d: 200020
            memw                                               #  270: c02000
            movi         a2, 25 /* 0x00000019 */               #  273: 1c92
            s32i         a5, sp, 24 /* arg0 -> [(local9)] */   #  275: 5961
            s32i         a3, sp, 28 /* arg1 -> [(local10)] */  #  277: 3971
            s32i         a0, a12, 0x350 /* a0 -> [0x60000d50] */ #  279: 026cd4
            call0        ets_delay_us                          #  27c: 01f2ffc0
                                                               #  280: 0000
            l32i         a0, sp, 28 /* [(local10)] */          #  282: 0871
            l32i         a2, sp, 24 /* [(local9)] */           #  284: 2861
            movi         a3, 0 /* 0x00000000 */                #  286: 0c03
            mov          a6, sp /* (FP)-0x20 */                #  288: 6d01
.Lbr006:    addx4        a7, a3, a12                           #  28a: c073a0
            addx2        a8, a3, a6                            #  28d: 608390
            memw                                               #  290: c02000
            l32i         a7, a7, 0x380                         #  293: 7227e0
            addi         a3, a3, 1                             #  296: 1b33
            extui        a3, a3, 0, 8                          #  298: 303074
            extui        a7, a7, 0, 12                         #  29b: 7070b4
            neg          a7, a7                                #  29e: 707060
            addmi        a7, a7, 2048                          #  2a1: 72d708
            s16i         a7, a8, 0                             #  2a4: 725800
            bnei         a3, 8, .Lbr006                        #  2a7: 6683df
            l16ui        a8, sp, 8 /* [(local3)] */            #  2aa: 821104
            l16ui        a11, sp, 6 /* [(local2)] */           #  2ad: b21103
            l16ui        a10, sp, 14 /* [(local6)] */          #  2b0: a21107
            l16ui        a3, sp, 4 /* [(local1)] */            #  2b3: 321102
            l16ui        a12, sp, 2 /* [(local0)] */           #  2b6: c21101
            l16ui        a9, sp, 12 /* [(local5)] */           #  2b9: 921106
            add          a12, a12, a3                          #  2bc: 3acc
            add          a9, a9, a10                           #  2be: aa99
            addx2        a9, a9, a9                            #  2c0: 909990
            add          a11, a11, a12                         #  2c3: cabb
            l16ui        a10, sp, 10 /* [(local4)] */          #  2c5: a21105
            l32i         a12, sp, 20 /* [(local8)] */          #  2c8: c851
            add          a8, a8, a10                           #  2ca: aa88
            subx2        a11, a11, a9                          #  2cc: 90bbd0
            s16i         a11, a2, 0 /* a11 -> [[(local9)]] */  #  2cf: b25200
            addx2        a8, a8, a8                            #  2d2: 808890
            sub          a8, a8, a9                            #  2d5: 9088c0
            s16i         a8, a0, 0 /* a8 -> [[(local10)]] */   #  2d8: 825000
            l32i         a0, sp, 16 /* [(local7)] */           #  2db: 0841
            addi         sp, sp, 32 /* (top of frame) */       #  2dd: 12c120
            ret           /* [(local9)] */                     #  2e0: 0df0

            .literal_position                                  #  2e4: 009a0060

# Function @ .irom0.text+0x2e8
            .balign      4
            .global      rom_get_noisefloor
            .type        rom_get_noisefloor, @function
rom_get_noisefloor:
            movi         a2, 0x60009a00                        #  2e8: 21ffff
            memw                                               #  2eb: c02000
            l32i         a2, a2, 0x164 /* [0x60009b64] */      #  2ee: 222259
            extui        a2, a2, 20, 12                        #  2f1: 2024b5
            srli         a2, a2, 3                             #  2f4: 202341
            addmi        a2, a2, -512                          #  2f7: 22d2fe
            slli         a2, a2, 16                            #  2fa: 002211
            srai         a2, a2, 16                            #  2fd: 202031
            ret                                                #  300: 0df0

            .literal_position                                  #  304: 00000000
                                                               #  308: 00000000
                                                               #  30c: 00000000

# Function @ .irom0.text+0x310
# Local variables/stack:
#     (local0):  hword     @ -0x10
#     (local1):  hword     @ -0xe
#     (local2):  word      @ -0xc
#     (local3):  word      @ -0x8
#     (local4):  word      @ -0x4
            .balign      4
            .global      rom_get_power_db
            .type        rom_get_power_db, @function
rom_get_power_db:
            addi         sp, sp, -16 /* (local0) */            #  310: 12c1f0
            s32i         a0, sp, 12 /* a0 -> [(local4)] */     #  313: 0931
            movi         a0, g_phyFuns                         #  315: 01fbff
            addi         a3, sp, 2 /* (local1) */              #  318: 2b31
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  31a: 0800
            s32i         a2, sp, 4 /* arg0 -> [(local2)] */    #  31c: 2911
            l32i         a0, a0, 36 /* [[g_phyFuns]+0x24] */   #  31e: 0890
            mov          a2, sp /* (local0) */                 #  320: 2d01
            callx0       a0 /* [[g_phyFuns]+0x24] */           #  322: c00000
            movi         a0, g_phyFuns                         #  325: 01f8ff
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  328: 0800
            l16si        a2, sp, 0 /* [(local0)] */            #  32a: 229100
            l32i         a0, a0, 56 /* [[g_phyFuns]+0x38] */   #  32d: 08e0
            movi         a3, 3 /* 0x00000003 */                #  32f: 0c33
            callx0       a0 /* [[g_phyFuns]+0x38] */           #  331: c00000
            movi         a0, g_phyFuns                         #  334: 01f6ff
            movi         a3, 3 /* 0x00000003 */                #  337: 0c33
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  339: 0800
            s32i         a2, sp, 8 /* a2 -> [(local3)] */      #  33b: 2921
            l32i         a0, a0, 56 /* [[g_phyFuns]+0x38] */   #  33d: 08e0
            l16si        a2, sp, 2 /* [(local1)] */            #  33f: 229101
            callx0       a0 /* [[g_phyFuns]+0x38] */           #  342: c00000
            l32i         a3, sp, 8 /* [(local3)] */            #  345: 3821
            l32i         a0, sp, 12 /* [(local4)] */           #  347: 0831
            sub          a3, a3, a2                            #  349: 2033c0
            l32i         a2, sp, 4 /* [(local2)] */            #  34c: 2811
            addi         sp, sp, 16 /* (top of frame) */       #  34e: 12c110
            add          a2, a2, a3                            #  351: 3a22
            slli         a2, a2, 16                            #  353: 002211
            srai         a2, a2, 16                            #  356: 202031
            ret                                                #  359: 0df0

            .literal_position                                  #  35c: 0100faff
                                                               #  360: 00100000
                                                               #  364: 00020060

# Function @ .irom0.text+0x368
            .balign      4
            .global      rom_iq_est_disable
            .type        rom_iq_est_disable, @function
rom_iq_est_disable:
            movi         a7, 0xfffa0001                        #  368: 71fdff
            movi         a6, 0x00001000                        #  36b: 61fdff
            movi         a3, 0x60000200                        #  36e: 31fdff
            memw                                               #  371: c02000
            l32i         a5, a3, 0x37c /* [0x6000057c] */      #  374: 5223df
            and          a5, a5, a7                            #  377: 705510
            or           a5, a5, a6                            #  37a: 605520
            memw                                               #  37d: c02000
            s32i         a5, a3, 0x37c /* a5 -> [0x6000057c] */ #  380: 5263df
            movi         a4, -2 /* 0xfffffffe */               #  383: 7ce4
            memw                                               #  385: c02000
            l32i         a2, a3, 0x37c /* [0x6000057c] */      #  388: 2223df
            and          a2, a2, a4                            #  38b: 402210
            memw                                               #  38e: c02000
            s32i         a2, a3, 0x37c /* a2 -> [0x6000057c] */ #  391: 2263df
            ret                                                #  394: 0df0

            .literal_position                                  #  398: 00020060
                                                               #  39c: 0100faff

# Function @ .irom0.text+0x3a0
            .balign      4
            .global      rom_iq_est_enable
            .type        rom_iq_est_enable, @function
rom_iq_est_enable:
            movi         a9, 1 /* 0x00000001 */                #  3a0: 0c19
            movi         a5, 0x60000200                        #  3a2: 51fdff
            memw                                               #  3a5: c02000
            l32i         a8, a5, 0x37c /* [0x6000057c] */      #  3a8: 8225df
            or           a8, a8, a9                            #  3ab: 908820
            memw                                               #  3ae: c02000
            s32i         a8, a5, 0x37c /* a8 -> [0x6000057c] */ #  3b1: 8265df
            extui        a7, a3, 0, 15                         #  3b4: 3070e4
            movi         a8, 2 /* 0x00000002 */                #  3b7: 0c28
            slli         a7, a7, 2                             #  3b9: e07711
            movi         a9, 0xfffa0001                        #  3bc: 91f8ff
            or           a7, a7, a8                            #  3bf: 807720
            slli         a8, a2, 18                            #  3c2: e08201
            memw                                               #  3c5: c02000
            l32i         a6, a5, 0x37c /* [0x6000057c] */      #  3c8: 6225df
            and          a6, a6, a9                            #  3cb: 906610
            or           a6, a6, a8                            #  3ce: 806620
            or           a6, a6, a7                            #  3d1: 706620
            memw                                               #  3d4: c02000
            s32i         a6, a5, 0x37c /* a6 -> [0x6000057c] */ #  3d7: 6265df
            memw                                               #  3da: c02000
            l32i         a4, a5, 0x37c /* [0x6000057c] */      #  3dd: 4225df
            bltz         a4, .Lbr008                           #  3e0: 968400
.Lbr007:    memw                                               #  3e3: c02000
            l32i         a10, a5, 0x37c /* [0x6000057c] */     #  3e6: a225df
            bgez         a10, .Lbr007                          #  3e9: d66aff
.Lbr008:    ret           /* arg0 */                           #  3ec: 0df0

            .literal_position                                  #  3f0: 00000000
                                                               #  3f4: 00000000

# Function @ .irom0.text+0x3f8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      rom_linear_to_db
            .type        rom_linear_to_db, @function
rom_linear_to_db:
            movi         a4, 16 /* 0x00000010 */               #  3f8: 1c04
            addi         sp, sp, -32 /* (FP)-0x20 */           #  3fa: 12c1e0
            s32i         a0, sp, 16 /* a0 -> [(local0)] */     #  3fd: 0941
            s32i         a13, sp, 24 /* a13 -> [(local2)] */   #  3ff: d961
            s32i         a12, sp, 20 /* a12 -> [(local1)] */   #  401: c951
            mov          a13, a2 /* arg0 */                    #  403: dd02
            mov          a12, a3 /* arg1 */                    #  405: cd03
            mov          a2, sp /* (FP)-0x20 */                #  407: 2d01
            movi         a3, .Ldata001                         #  409: 31f9ff
            call0        memcpy                                #  40c: 01faffc0
                                                               #  410: 0000
            bgeui        a12, 3, .Lbr009                       #  412: f63c0d
            movi         a0, 3 /* 0x00000003 */                #  415: 0c30
            sub          a0, a0, a12                           #  417: c000c0
            ssl          a0                                    #  41a: 001040
            sll          a0, a13                               #  41d: 000da1
            j            .Lbr010                               #  420: 060200
.Lbr009:    addi         a2, a12, -3 /* arg1-0x3 */            #  423: 22ccfd
            ssr          a2                                    #  426: 000240
            sra          a0, a13                               #  429: d000b1
.Lbr010:    l32i         a12, sp, 20 /* [(local1)] */          #  42c: c851
            l32i         a13, sp, 24 /* [(local2)] */          #  42e: d861
            nsau         a3, a0                                #  430: 30f040
            movi         a2, 28 /* 0x0000001c */               #  433: 1cc2
            sub          a2, a2, a3                            #  435: 3022c0
            slli         a2, a2, 24                            #  438: 802201
            srai         a2, a2, 24                            #  43b: 202831
            bgei         a2, 1, .Lbr011                        #  43e: e61207
            extui        a0, a0, 0, 4                          #  441: 000034
            movi         a2, 0 /* 0x00000000 */                #  444: 0c02
            j            .Lbr012                               #  446: 860200
.Lbr011:    addi         a3, a2, -1                            #  449: 0b32
            ssr          a3                                    #  44b: 000340
            sra          a0, a0                                #  44e: 0000b1
            extui        a0, a0, 0, 4                          #  451: 000034
.Lbr012:    slli         a4, a2, 5                             #  454: b04211
            add          a5, a0, sp                            #  457: 1a50
            slli         a3, a2, 4                             #  459: c03211
            l32i         a0, sp, 16 /* [(local0)] */           #  45c: 0841
            add          a3, a3, a4                            #  45e: 4a33
            l8ui         a2, a5, 0                             #  460: 220500
            addi         sp, sp, 32 /* (top of frame) */       #  463: 12c120
            add          a2, a2, a3                            #  466: 3a22
            slli         a2, a2, 16                            #  468: 002211
            srai         a2, a2, 16                            #  46b: 202031
            ret                                                #  46e: 0df0

            .literal_position                                  #  470: 00000000
                                                               #  474: 00000000

# Function @ .irom0.text+0x478
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      rom_set_txclk_en
            .type        rom_set_txclk_en, @function
rom_set_txclk_en:
            movi         a3, 0 /* 0x00000000 */                #  478: 0c03
            movi         a4, 28 /* 0x0000001c */               #  47a: 1cc4
            movi         a5, 6 /* 0x00000006 */                #  47c: 0c65
            movi         a6, 6 /* 0x00000006 */                #  47e: 0c66
            addi         sp, sp, -16 /* (local0) */            #  480: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  483: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  485: 0901
            movi         a0, g_phyFuns                         #  487: 01faff
            mov          a12, a2 /* arg0 */                    #  48a: cd02
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  48c: 0800
            movi         a2, 119 /* 0x00000077 */              #  48e: 22a077
            l32i         a0, a0, 156 /* [[g_phyFuns]+0x9c] */  #  491: 022027
            mov          a7, a12 /* arg0 */                    #  494: 7d0c
            callx0       a0 /* [[g_phyFuns]+0x9c] */           #  496: c00000
            mov          a7, a12 /* arg0 */                    #  499: 7d0c
            movi         a2, 124 /* 0x0000007c */              #  49b: 22a07c
            movi         a3, 1 /* 0x00000001 */                #  49e: 0c13
            movi         a0, g_phyFuns                         #  4a0: 01f5ff
            movi         a4, 21 /* 0x00000015 */               #  4a3: 1c54
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  4a5: 0800
            movi         a5, 0 /* 0x00000000 */                #  4a7: 0c05
            l32i         a0, a0, 156 /* [[g_phyFuns]+0x9c] */  #  4a9: 022027
            movi         a6, 0 /* 0x00000000 */                #  4ac: 0c06
            callx0       a0 /* [[g_phyFuns]+0x9c] */           #  4ae: c00000
            l32i         a12, sp, 4 /* [(local1)] */           #  4b1: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  4b3: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  4b5: 12c110
            ret                                                #  4b8: 0df0

            .literal_position                                  #  4bc: 00000000
                                                               #  4c0: 00000000

# Function @ .irom0.text+0x4c4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      rom_set_rxclk_en
            .type        rom_set_rxclk_en, @function
rom_set_rxclk_en:
            movi         a3, 0 /* 0x00000000 */                #  4c4: 0c03
            movi         a4, 28 /* 0x0000001c */               #  4c6: 1cc4
            movi         a5, 5 /* 0x00000005 */                #  4c8: 0c55
            movi         a6, 5 /* 0x00000005 */                #  4ca: 0c56
            addi         sp, sp, -16 /* (local0) */            #  4cc: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  4cf: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  4d1: 0901
            movi         a0, g_phyFuns                         #  4d3: 01faff
            mov          a12, a2 /* arg0 */                    #  4d6: cd02
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  4d8: 0800
            movi         a2, 119 /* 0x00000077 */              #  4da: 22a077
            l32i         a0, a0, 156 /* [[g_phyFuns]+0x9c] */  #  4dd: 022027
            mov          a7, a12 /* arg0 */                    #  4e0: 7d0c
            callx0       a0 /* [[g_phyFuns]+0x9c] */           #  4e2: c00000
            mov          a7, a12 /* arg0 */                    #  4e5: 7d0c
            movi         a2, 124 /* 0x0000007c */              #  4e7: 22a07c
            movi         a3, 1 /* 0x00000001 */                #  4ea: 0c13
            movi         a0, g_phyFuns                         #  4ec: 01f5ff
            movi         a4, 21 /* 0x00000015 */               #  4ef: 1c54
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  4f1: 0800
            movi         a5, 1 /* 0x00000001 */                #  4f3: 0c15
            l32i         a0, a0, 156 /* [[g_phyFuns]+0x9c] */  #  4f5: 022027
            movi         a6, 1 /* 0x00000001 */                #  4f8: 0c16
            callx0       a0 /* [[g_phyFuns]+0x9c] */           #  4fa: c00000
            l32i         a12, sp, 4 /* [(local1)] */           #  4fd: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  4ff: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  501: 12c110
            ret                                                #  504: 0df0

            .literal_position                                  #  508: b4090000
                                                               #  50c: b3090000
                                                               #  510: 99f6ffff
                                                               #  514: 30f6ffff
                                                               #  518: 00000000
                                                               #  51c: 00000000
                                                               #  520: 00000000

# Function @ .irom0.text+0x524
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      rom_mhz2ieee
            .type        rom_mhz2ieee, @function
rom_mhz2ieee:
            movi         a6, 0x000009b3                        #  524: 61faff
            movi         a7, 0xfffff699                        #  527: 71faff
            addi         sp, sp, -16 /* (local0) */            #  52a: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  52d: 0901
            movi         a0, 0x000009b4                        #  52f: 01f6ff
            bbci         a3, 7, .Lbr016                        #  532: 776321
            beq          a2, a0, .Lbr018                       #  535: 071243
            bltu         a6, a2, .Lbr017                       #  538: 27362e
            add          a2, a2, a7 /* arg0+0xfffff699 */      #  53b: 7a22
            movi         a3, 5 /* 0x00000005 */                #  53d: 0c53
            call0        __divsi3                              #  53f: 01f6ffc0
                                                               #  543: 0000
.Lbr013:    slli         a2, a2, 24                            #  545: 802201
            srai         a2, a2, 24                            #  548: 202831
            j            .Lbr015                               #  54b: 460000
.Lbr014:    movi         a2, -1 /* 0xffffffff */               #  54e: 7cf2
.Lbr015:    l32i         a0, sp, 0 /* [(local0)] */            #  550: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  552: 12c110
            ret                                                #  555: 0df0
.Lbr016:    beq          a2, a0, .Lbr018                       #  557: 071221
            bltu         a6, a2, .Lbr014                       #  55a: 2736f0
            add          a2, a2, a7 /* arg0+0xfffff699 */      #  55d: 7a22
            movi         a3, 5 /* 0x00000005 */                #  55f: 0c53
            call0        __divsi3                              #  561: 01eeffc0
                                                               #  565: 0000
            j            .Lbr013                               #  567: 86f6ff
.Lbr017:    movi         a4, 0xfffff630                        #  56a: 41eaff
            movi         a3, 20 /* 0x00000014 */               #  56d: 1c43
            add          a2, a2, a4 /* arg0+0xfffff630 */      #  56f: 4a22
            call0        __divsi3                              #  571: 01ebffc0
                                                               #  575: 0000
            addi         a2, a2, 15                            #  577: fb22
            j            .Lbr013                               #  579: 06f2ff
.Lbr018:    movi         a2, 14 /* 0x0000000e */               #  57c: 0ce2
            j            .Lbr015                               #  57e: 86f3ff

            .literal_position                                  #  584: 00020060
                                                               #  588: 00000000
                                                               #  58c: 00000000
                                                               #  590: 00000000
                                                               #  594: 00000000

# Function @ .irom0.text+0x598
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
#     (local10): word[2]   @ -0x8
            .balign      4
            .global      rom_rxiq_get_mis
            .type        rom_rxiq_get_mis, @function
rom_rxiq_get_mis:
            addi         sp, sp, -48 /* (local0) */            #  598: 12c1d0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  59b: c921
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  59d: d931
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  59f: e941
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   #  5a1: f951
            s32i         a5, sp, 24 /* arg3 -> [(local6)] */   #  5a3: 5961
            s32i         a7, sp, 32 /* arg5 -> [(local8)] */   #  5a5: 7981
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  5a7: 0911
            s32i         a6, sp, 28 /* arg4 -> [(local7)] */   #  5a9: 6971
            addi         a6, a2, -2 /* arg0-0x2 */             #  5ab: 62c2fe
            movi         a0, 0x60000200                        #  5ae: 01f5ff
            memw                                               #  5b1: c02000
            l32i         a7, a0, 0x380 /* [0x60000580] */      #  5b4: 7220e0
            ssr          a6                                    #  5b7: 000640
            sra          a7, a7                                #  5ba: 7070b1
            memw                                               #  5bd: c02000
            l32i         a8, a0, 0x38c /* [0x6000058c] */      #  5c0: 8220e3
            ssr          a6                                    #  5c3: 000640
            sra          a8, a8                                #  5c6: 8080b1
            sub          a15, a7, a8                           #  5c9: 80f7c0
            memw                                               #  5cc: c02000
            l32i         a5, a0, 0x388 /* [0x60000588] */      #  5cf: 5220e2
            ssr          a6                                    #  5d2: 000640
            sra          a5, a5                                #  5d5: 5050b1
            memw                                               #  5d8: c02000
            movi         a9, 0 /* 0x00000000 */                #  5db: 0c09
            l32i         a0, a0, 0x384 /* [0x60000584] */      #  5dd: 0220e1
            ssr          a6                                    #  5e0: 000640
            add          a2, a7, a8                            #  5e3: 8a27
            mov          a13, a2                               #  5e5: dd02
            movi         a8, 0 /* 0x00000000 */                #  5e7: 0c08
            l32i         a7, sp, 28 /* [(local7)] */           #  5e9: 7871
            l32i         a6, sp, 24 /* [(local6)] */           #  5eb: 6861
            sra          a0, a0                                #  5ed: 0000b1
            add          a14, a5, a0                           #  5f0: 0ae5
            xor          a6, a6, a7                            #  5f2: 706630
            sub          a0, a0, a5                            #  5f5: 5000c0
            mov          a12, a0                               #  5f8: cd00
            xor          a5, a3, a4                            #  5fa: 405330
            xor          a5, a5, a6                            #  5fd: 605530
            extui        a5, a5, 0, 8                          #  600: 505074
            beqz         a5, .Lbr019                           #  603: 8c65
            mov          a12, a14                              #  605: cd0e
            mov          a13, a15                              #  607: dd0f
            mov          a14, a0                               #  609: ed00
            mov          a15, a2                               #  60b: fd02
.Lbr019:    movi         a0, 1 /* 0x00000001 */                #  60d: 0c10
            mull         a11, a12, a12                         #  60f: c0bc82
            mull         a10, a13, a13                         #  612: d0ad82
            add          a10, a10, a11                         #  615: baaa
            s32i         a10, sp, 40 /* a10 -> [(local10)] */  #  617: a9a1
            moveqz       a9, a0, a10                           #  619: a09083
            srai         a10, a10, 31                          #  61c: a0af31
            s32i         a10, sp, 36 /* a10 -> [(local9)] */   #  61f: a991
            moveqz       a8, a0, a10                           #  621: a08083
            bnone        a8, a9, .Lbr020                       #  624: 970805
            s32i         a0, sp, 40 /* 0x00000001 -> [(local10)] */ #  627: 09a1
            movi         a2, 0 /* 0x00000000 */                #  629: 0c02
            s32i         a2, sp, 36 /* 0x00000000 -> [(local9)] */ #  62b: 2991
.Lbr020:    l32i         a5, sp, 36 /* [(local9)] */           #  62d: 5891
            mull         a4, a14, a12                          #  62f: c04e82
            mull         a3, a15, a13                          #  632: d03f82
            sub          a3, a3, a4                            #  635: 4033c0
            slli         a2, a3, 9                             #  638: 702311
            l32i         a4, sp, 40 /* [(local10)] */          #  63b: 48a1
            srai         a3, a3, 23                            #  63d: 303731
            call0        __divdi3                              #  640: 01d3ffc0
                                                               #  644: 0000
            l32i         a7, sp, 28 /* [(local7)] */           #  646: 7871
            mull         a4, a14, a13                          #  648: d04e82
            mull         a3, a15, a12                          #  64b: c03f82
            slli         a6, a2, 24                            #  64e: 806201
            srai         a6, a6, 24                            #  651: 606831
            add          a3, a3, a4                            #  654: 4a33
            addi         a6, a6, 1                             #  656: 1b66
            l32i         a4, sp, 40 /* [(local10)] */          #  658: 48a1
            slli         a2, a3, 9                             #  65a: 702311
            srai         a6, a6, 1                             #  65d: 606121
            neg          a5, a6                                #  660: 605060
            srai         a3, a3, 23                            #  663: 303731
            moveqz       a5, a6, a7                            #  666: 705683
            l32i         a6, sp, 32 /* [(local8)] */           #  669: 6881
            s32i         a5, sp, 0 /* a5 -> [(local0)] */      #  66b: 5901
            s8i          a5, a6, 0 /* a5 -> [[(local8)]] */    #  66d: 524600
            l32i         a5, sp, 36 /* [(local9)] */           #  670: 5891
            call0        __divdi3                              #  672: 01c7ffc0
                                                               #  676: 0000
            slli         a8, a2, 24                            #  678: 808201
            l32i         a9, sp, 24 /* [(local6)] */           #  67b: 9861
            srai         a8, a8, 24                            #  67d: 808831
            addi         a8, a8, 1                             #  680: 1b88
            srai         a8, a8, 1                             #  682: 808121
            neg          a0, a8                                #  685: 800060
            moveqz       a0, a8, a9                            #  688: 900883
            l32i         a8, sp, 32 /* [(local8)] */           #  68b: 8881
            l8ui         a7, sp, 48 /* [(local11)] */          #  68d: 720130
            s8i          a0, a8, 1 /* a0 -> [[(local8)]+0x1] */ #  690: 024801
            beqz         a7, .Lbr021                           #  693: 9c97
            l32i         a5, sp, 36 /* [(local9)] */           #  695: 5891
            l32i         a4, sp, 40 /* [(local10)] */          #  697: 48a1
            movi         a2, .Lstr001                          #  699: 21bbff
            l32i         a6, sp, 0 /* [(local0)] */            #  69c: 6801
            slli         a7, a0, 24                            #  69e: 807001
            srai         a7, a7, 24                            #  6a1: 707831
            slli         a6, a6, 24                            #  6a4: 806601
            srai         a6, a6, 24                            #  6a7: 606831
            call0        ets_printf                            #  6aa: 01baffc0
                                                               #  6ae: 0000
.Lbr021:    l32i         a12, sp, 8 /* [(local2)] */           #  6b0: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  6b2: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  6b4: e841
            l32i         a15, sp, 20 /* [(local5)] */          #  6b6: f851
            l32i         a0, sp, 4 /* [(local1)] */            #  6b8: 0811
            addi         sp, sp, 48 /* (local11) */            #  6ba: 12c130
            ret                                                #  6bd: 0df0

            .literal_position                                  #  6c0: 00000002
                                                               #  6c4: 00000000
                                                               #  6c8: 00060060
                                                               #  6cc: 00000000

# Function @ .irom0.text+0x6d0
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      rom_sar_init
            .type        rom_sar_init, @function
rom_sar_init:
            addi         sp, sp, -16 /* (local0) */            #  6d0: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  6d3: 0901
            movi         a4, 0x02000000                        #  6d5: 41faff
            movi         a3, 0x60000600                        #  6d8: 31fcff
            movi         a0, g_phyFuns                         #  6db: 01faff
            memw                                               #  6de: c02000
            l32i         a2, a3, 0x110 /* [0x60000710] */      #  6e1: 222344
            or           a2, a2, a4                            #  6e4: 402220
            memw                                               #  6e7: c02000
            movi         a4, 0 /* 0x00000000 */                #  6ea: 0c04
            movi         a5, 4 /* 0x00000004 */                #  6ec: 0c45
            movi         a6, 4 /* 0x00000004 */                #  6ee: 0c46
            movi         a7, 1 /* 0x00000001 */                #  6f0: 0c17
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  6f2: 0800
            s32i         a2, a3, 0x110 /* a2 -> [0x60000710] */ #  6f4: 226344
            movi         a2, 108 /* 0x0000006c */              #  6f7: 22a06c
            l32i         a0, a0, 156 /* [[g_phyFuns]+0x9c] */  #  6fa: 022027
            movi         a3, 2 /* 0x00000002 */                #  6fd: 0c23
            callx0       a0 /* [[g_phyFuns]+0x9c] */           #  6ff: c00000
            movi         a2, 108 /* 0x0000006c */              #  702: 22a06c
            movi         a3, 2 /* 0x00000002 */                #  705: 0c23
            movi         a4, 1 /* 0x00000001 */                #  707: 0c14
            movi         a0, g_phyFuns                         #  709: 01f0ff
            movi         a5, 1 /* 0x00000001 */                #  70c: 0c15
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  70e: 0800
            movi         a6, 0 /* 0x00000000 */                #  710: 0c06
            l32i         a0, a0, 156 /* [[g_phyFuns]+0x9c] */  #  712: 022027
            movi         a7, 2 /* 0x00000002 */                #  715: 0c27
            callx0       a0 /* [[g_phyFuns]+0x9c] */           #  717: c00000
            l32i         a0, sp, 0 /* [(local0)] */            #  71a: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  71c: 12c110
            ret                                                #  71f: 0df0

            .literal_position                                  #  724: 00000000

# Function @ .irom0.text+0x728
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      rom_set_ana_inf_tx_scale
            .type        rom_set_ana_inf_tx_scale, @function
rom_set_ana_inf_tx_scale:
            addi         sp, sp, -16 /* (local0) */            #  728: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  72b: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  72d: 0901
            bltui        a2, 64, .Lbr022                       #  72f: b6d20a
            movi         a12, 63 /* 0x0000003f */              #  732: 3cfc
            sub          a7, a12, a2                           #  734: 207cc0
            extui        a7, a7, 0, 8                          #  737: 707074
            j            .Lbr023                               #  73a: c60000
.Lbr022:    movi         a7, 0 /* 0x00000000 */                #  73d: 0c07
            mov          a12, a2 /* arg0 */                    #  73f: cd02
.Lbr023:    movi         a2, 119 /* 0x00000077 */              #  741: 22a077
            movi         a3, 0 /* 0x00000000 */                #  744: 0c03
            movi         a0, g_phyFuns                         #  746: 01f7ff
            movi         a4, 9 /* 0x00000009 */                #  749: 0c94
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  74b: 0800
            movi         a5, 7 /* 0x00000007 */                #  74d: 0c75
            l32i         a0, a0, 156 /* [[g_phyFuns]+0x9c] */  #  74f: 022027
            movi         a6, 0 /* 0x00000000 */                #  752: 0c06
            callx0       a0 /* [[g_phyFuns]+0x9c] */           #  754: c00000
            mov          a2, a12                               #  757: 2d0c
            l32i         a0, sp, 0 /* [(local0)] */            #  759: 0801
            l32i         a12, sp, 4 /* [(local1)] */           #  75b: c811
            addi         sp, sp, 16 /* (top of frame) */       #  75d: 12c110
            ret                                                #  760: 0df0

            .literal_position                                  #  764: 00000000

# Function @ .irom0.text+0x768
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
            .global      rom_set_loopback_gain
            .type        rom_set_loopback_gain, @function
rom_set_loopback_gain:
            addi         sp, sp, -32 /* (local0) */            #  768: 12c1e0
            s32i         a5, sp, 12 /* arg3 -> [(local3)] */   #  76b: 5931
            s32i         a4, sp, 8 /* arg2 -> [(local2)] */    #  76d: 4921
            s32i         a3, sp, 4 /* arg1 -> [(local1)] */    #  76f: 3911
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     #  771: 0941
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  773: 2901
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   #  775: c951
            movi         a12, g_phyFuns                        #  777: c1fbff
            movi         a2, 2 /* 0x00000002 */                #  77a: 0c22
            l32i         a0, a12, 0 /* [g_phyFuns] */          #  77c: 080c
            movi         a3, 1 /* 0x00000001 */                #  77e: 0c13
            l32i         a0, a0, 172 /* [[g_phyFuns]+0xac] */  #  780: 02202b
            movi         a4, 389 /* 0x00000185 */              #  783: 42a185
            callx0       a0 /* [[g_phyFuns]+0xac] */           #  786: c00000
            l32i         a4, sp, 0 /* [(local0)] */            #  789: 4801
            l32i         a0, a12, 0 /* [g_phyFuns] */          #  78b: 080c
            movi         a2, 7 /* 0x00000007 */                #  78d: 0c72
            l32i         a0, a0, 172 /* [[g_phyFuns]+0xac] */  #  78f: 02202b
            movi         a3, 1 /* 0x00000001 */                #  792: 0c13
            callx0       a0 /* [[g_phyFuns]+0xac] */           #  794: c00000
            l32i         a4, sp, 4 /* [(local1)] */            #  797: 4811
            l32i         a0, a12, 0 /* [g_phyFuns] */          #  799: 080c
            movi         a2, 2 /* 0x00000002 */                #  79b: 0c22
            l32i         a0, a0, 172 /* [[g_phyFuns]+0xac] */  #  79d: 02202b
            movi         a3, 1 /* 0x00000001 */                #  7a0: 0c13
            callx0       a0 /* [[g_phyFuns]+0xac] */           #  7a2: c00000
            l32i         a4, sp, 8 /* [(local2)] */            #  7a5: 4821
            l32i         a0, a12, 0 /* [g_phyFuns] */          #  7a7: 080c
            movi         a2, 3 /* 0x00000003 */                #  7a9: 0c32
            l32i         a0, a0, 172 /* [[g_phyFuns]+0xac] */  #  7ab: 02202b
            movi         a3, 1 /* 0x00000001 */                #  7ae: 0c13
            callx0       a0 /* [[g_phyFuns]+0xac] */           #  7b0: c00000
            l32i         a4, sp, 12 /* [(local3)] */           #  7b3: 4831
            l32i         a0, a12, 0 /* [g_phyFuns] */          #  7b5: 080c
            movi         a2, 3 /* 0x00000003 */                #  7b7: 0c32
            l32i         a0, a0, 172 /* [[g_phyFuns]+0xac] */  #  7b9: 02202b
            movi         a3, 2 /* 0x00000002 */                #  7bc: 0c23
            callx0       a0 /* [[g_phyFuns]+0xac] */           #  7be: c00000
            l32i         a12, sp, 20 /* [(local5)] */          #  7c1: c851
            l32i         a0, sp, 16 /* [(local4)] */           #  7c3: 0841
            addi         sp, sp, 32 /* (top of frame) */       #  7c5: 12c120
            ret                                                #  7c8: 0df0

            .literal_position                                  #  7cc: 009a0060
                                                               #  7d0: fd7ffdff

# Function @ .irom0.text+0x7d4
            .balign      4
            .global      rom_set_noise_floor
            .type        rom_set_noise_floor, @function
rom_set_noise_floor:
            movi         a9, -512 /* 0xfffffe00 */             #  7d4: 92ae00
            slli         a8, a2, 1                             #  7d7: f08211
            movi         a4, 0x60009a00                        #  7da: 41fcff
            addmi        a8, a8, 512                           #  7dd: 82d802
            extui        a8, a8, 0, 9                          #  7e0: 808084
            memw                                               #  7e3: c02000
            l32i         a7, a4, 0x164 /* [0x60009b64] */      #  7e6: 722459
            and          a7, a7, a9                            #  7e9: 907710
            or           a7, a7, a8                            #  7ec: 807720
            memw                                               #  7ef: c02000
            s32i         a7, a4, 0x164 /* a7 -> [0x60009b64] */ #  7f2: 726459
            movi         a6, 0xfffd7ffd                        #  7f5: 61f6ff
            movi         a5, 2 /* 0x00000002 */                #  7f8: 0c25
            memw                                               #  7fa: c02000
            l32i         a3, a4, 0x160 /* [0x60009b60] */      #  7fd: 322458
            and          a3, a3, a6                            #  800: 603310
            or           a3, a3, a5                            #  803: 503320
            memw                                               #  806: c02000
            s32i         a3, a4, 0x160 /* a3 -> [0x60009b60] */ #  809: 326458
            ret           /* arg0 */                           #  80c: 0df0

            .literal_position                                  #  810: 00f0ffff
                                                               #  814: 009a0060
                                                               #  818: 02800200

# Function @ .irom0.text+0x81c
            .balign      4
            .global      rom_start_noisefloor
            .type        rom_start_noisefloor, @function
rom_start_noisefloor:
            movi         a9, 0xfffff000                        #  81c: 91fdff
            movi         a7, 416 /* 0x000001a0 */              #  81f: 72a1a0
            extui        a8, a2, 0, 3                          #  822: 208024
            movi         a4, 0x60009a00                        #  825: 41fbff
            slli         a8, a8, 9                             #  828: 708811
            memw                                               #  82b: c02000
            l32i         a6, a4, 0x164 /* [0x60009b64] */      #  82e: 622459
            and          a6, a6, a9                            #  831: 906610
            or           a6, a6, a8                            #  834: 806620
            or           a6, a6, a7                            #  837: 706620
            memw                                               #  83a: c02000
            s32i         a6, a4, 0x164 /* a6 -> [0x60009b64] */ #  83d: 626459
            movi         a5, 0x00028002                        #  840: 51f6ff
            memw                                               #  843: c02000
            l32i         a3, a4, 0x160 /* [0x60009b60] */      #  846: 322458
            or           a3, a3, a5                            #  849: 503320
            memw                                               #  84c: c02000
            s32i         a3, a4, 0x160 /* a3 -> [0x60009b60] */ #  84f: 326458
            ret           /* arg0 */                           #  852: 0df0

            .literal_position                                  #  854: 00000000
                                                               #  858: 00020060
                                                               #  85c: 000000f0
                                                               #  860: 000000e0

# Function @ .irom0.text+0x864
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
            .global      rom_start_tx_tone
            .type        rom_start_tx_tone, @function
rom_start_tx_tone:
            addi         sp, sp, -32 /* (local0) */            #  864: 12c1e0
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    #  867: 3901
            s32i         a4, sp, 4 /* arg2 -> [(local1)] */    #  869: 4911
            s32i         a6, sp, 8 /* arg4 -> [(local2)] */    #  86b: 6921
            s32i         a7, sp, 12 /* arg5 -> [(local3)] */   #  86d: 7931
            s32i         a13, sp, 24 /* a13 -> [(local6)] */   #  86f: d961
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   #  871: c951
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     #  873: 0941
            movi         a0, g_phyFuns                         #  875: 01f7ff
            mov          a12, a5 /* arg3 */                    #  878: cd05
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  87a: 0800
            mov          a13, a2 /* arg0 */                    #  87c: dd02
            l32i         a0, a0, 60 /* [[g_phyFuns]+0x3c] */   #  87e: 08f0
            movi         a2, 1 /* 0x00000001 */                #  880: 0c12
            callx0       a0 /* [[g_phyFuns]+0x3c] */           #  882: c00000
            movi         a11, 0 /* 0x00000000 */               #  885: 0c0b
            movi         a5, 256 /* 0x00000100 */              #  887: 52a100
            movi         a0, 0x60000200                        #  88a: 01f3ff
            movi         a2, 0xf0000000                        #  88d: 21f3ff
            beqz         a13, .Lbr024                          #  890: ac6d
            l32i         a6, sp, 4 /* [(local1)] */            #  892: 6811
            l32i         a4, sp, 0 /* [(local0)] */            #  894: 4801
            sub          a6, a5, a6                            #  896: 6065c0
            extui        a6, a6, 0, 8                          #  899: 606074
            slli         a6, a6, 10                            #  89c: 606611
            or           a4, a4, a6                            #  89f: 604420
            slli         a6, a13, 18                           #  8a2: e06d01
            memw                                               #  8a5: c02000
            l32i         a3, a0, 0x3b8 /* [0x600005b8] */      #  8a8: 3220ee
            and          a3, a3, a2                            #  8ab: 203310
            or           a3, a3, a6                            #  8ae: 603320
            or           a3, a3, a4                            #  8b1: 403320
            memw                                               #  8b4: c02000
            s32i         a3, a0, 0x3b8 /* a3 -> [0x600005b8] */ #  8b7: 3260ee
.Lbr024:    beqz         a12, .Lbr025                          #  8ba: ac9c
            l32i         a9, sp, 12 /* [(local3)] */           #  8bc: 9831
            l32i         a8, sp, 8 /* [(local2)] */            #  8be: 8821
            sub          a9, a5, a9                            #  8c0: 9095c0
            extui        a9, a9, 0, 8                          #  8c3: 909074
            slli         a9, a9, 10                            #  8c6: 609911
            or           a8, a8, a9                            #  8c9: 908820
            slli         a9, a12, 18                           #  8cc: e09c01
            memw                                               #  8cf: c02000
            l32i         a7, a0, 0x3bc /* [0x600005bc] */      #  8d2: 7220ef
            and          a7, a7, a2                            #  8d5: 207710
            or           a7, a7, a11                           #  8d8: b07720
            or           a7, a7, a9                            #  8db: 907720
            or           a7, a7, a8                            #  8de: 807720
            memw                                               #  8e1: c02000
            s32i         a7, a0, 0x3bc /* a7 -> [0x600005bc] */ #  8e4: 7260ef
.Lbr025:    l8ui         a2, sp, 32 /* [(local7)] */           #  8e7: 220120
            movi         a8, 0xe0000000                        #  8ea: 81ddff
            beqz         a2, .Lbr026                           #  8ed: ace2
            slli         a7, a2, 28                            #  8ef: 407201
            slli         a6, a2, 18                            #  8f2: e06201
            l8ui         a9, sp, 40 /* [(FP)+0x8] */           #  8f5: 920128
            l16si        a4, sp, 36 /* [(FP)+0x4] */           #  8f8: 429112
            sub          a9, a5, a9                            #  8fb: 9095c0
            extui        a9, a9, 0, 8                          #  8fe: 909074
            slli         a9, a9, 10                            #  901: 609911
            or           a4, a4, a9                            #  904: 904420
            memw                                               #  907: c02000
            l32i         a3, a0, 0x3c4 /* [0x600005c4] */      #  90a: 3220f1
            and          a3, a3, a8                            #  90d: 803310
            or           a3, a3, a7                            #  910: 703320
            or           a3, a3, a6                            #  913: 603320
            or           a3, a3, a4                            #  916: 403320
            memw                                               #  919: c02000
            s32i         a3, a0, 0x3c4 /* a3 -> [0x600005c4] */ #  91c: 3260f1
.Lbr026:    l32i         a12, sp, 20 /* [(local5)] */          #  91f: c851
            l32i         a13, sp, 24 /* [(local6)] */          #  921: d861
            l32i         a0, sp, 16 /* [(local4)] */           #  923: 0841
            addi         sp, sp, 32 /* (local7) */             #  925: 12c120
            ret           /* [(local7)] */                     #  928: 0df0

            .literal_position                                  #  92c: fffffbff
                                                               #  930: 00020060
                                                               #  934: 00000000

# Function @ .irom0.text+0x938
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      rom_stop_tx_tone
            .type        rom_stop_tx_tone, @function
rom_stop_tx_tone:
            addi         sp, sp, -16 /* (local0) */            #  938: 12c1f0
            movi         a4, 0xfffbffff                        #  93b: 41fcff
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  93e: 0901
            movi         a0, 0x60000200                        #  940: 01fcff
            beqi         a2, 1, .Lbr027                        #  943: 261235
            beqi         a2, 2, .Lbr030                        #  946: 262266
            beqi         a2, 3, .Lbr029                        #  949: 263251
            memw                                               #  94c: c02000
            l32i         a5, a0, 0x3b8 /* [0x600005b8] */      #  94f: 5220ee
            and          a5, a5, a4                            #  952: 405510
            memw                                               #  955: c02000
            s32i         a5, a0, 0x3b8 /* a5 -> [0x600005b8] */ #  958: 5260ee
            memw                                               #  95b: c02000
            l32i         a3, a0, 0x3bc /* [0x600005bc] */      #  95e: 3220ef
            and          a3, a3, a4                            #  961: 403310
            memw                                               #  964: c02000
            s32i         a3, a0, 0x3bc /* a3 -> [0x600005bc] */ #  967: 3260ef
            memw                                               #  96a: c02000
            l32i         a2, a0, 0x3c4 /* [0x600005c4] */      #  96d: 2220f1
            and          a2, a2, a4                            #  970: 402210
            memw                                               #  973: c02000
            s32i         a2, a0, 0x3c4 /* a2 -> [0x600005c4] */ #  976: 2260f1
            j            .Lbr028                               #  979: 860300
.Lbr027:    memw                                               #  97c: c02000
            l32i         a6, a0, 0x3b8 /* [0x600005b8] */      #  97f: 6220ee
            and          a6, a6, a4                            #  982: 406610
            memw                                               #  985: c02000
            s32i         a6, a0, 0x3b8 /* a6 -> [0x600005b8] */ #  988: 6260ee
.Lbr028:    movi         a0, g_phyFuns                         #  98b: 01eaff
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  98e: 0800
            l32i         a0, a0, 60 /* [[g_phyFuns]+0x3c] */   #  990: 08f0
            movi         a2, 0 /* 0x00000000 */                #  992: 0c02
            callx0       a0 /* [[g_phyFuns]+0x3c] */           #  994: c00000
            l32i         a0, sp, 0 /* [(local0)] */            #  997: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  999: 12c110
            ret                                                #  99c: 0df0
.Lbr029:    memw                                               #  99e: c02000
            l32i         a2, a0, 0x3c4 /* [0x600005c4] */      #  9a1: 2220f1
            and          a2, a2, a4                            #  9a4: 402210
            memw                                               #  9a7: c02000
            s32i         a2, a0, 0x3c4 /* a2 -> [0x600005c4] */ #  9aa: 2260f1
            j            .Lbr028                               #  9ad: 86f6ff
.Lbr030:    memw                                               #  9b0: c02000
            l32i         a3, a0, 0x3bc /* [0x600005bc] */      #  9b3: 3220ef
            and          a3, a3, a4                            #  9b6: 403310
            memw                                               #  9b9: c02000
            s32i         a3, a0, 0x3bc /* a3 -> [0x600005bc] */ #  9bc: 3260ef
            j            .Lbr028                               #  9bf: 06f2ff

            .literal_position                                  #  9c4: 00000000
                                                               #  9c8: 00000000

# Function @ .irom0.text+0x9cc
# Local variables/stack:
#     (local0):  hword     @ -0x20
#     (local1):  hword     @ -0x1e
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word      @ -0x10
#     (local6):  word      @ -0xc
#     (local7):  word[2]   @ -0x8
            .balign      4
            .global      rom_txtone_linear_pwr
            .type        rom_txtone_linear_pwr, @function
rom_txtone_linear_pwr:
            addi         sp, sp, -32 /* (local0) */            #  9cc: 12c1e0
            s32i         a0, sp, 4 /* a0 -> [(local2)] */      #  9cf: 0911
            s32i         a3, sp, 24 /* arg1 -> [(local7)] */   #  9d1: 3961
            s32i         a15, sp, 20 /* a15 -> [(local6)] */   #  9d3: f951
            s32i         a13, sp, 12 /* a13 -> [(local4)] */   #  9d5: d931
            s32i         a14, sp, 16 /* a14 -> [(local5)] */   #  9d7: e941
            s32i         a12, sp, 8 /* a12 -> [(local3)] */    #  9d9: c921
            mov          a14, a2 /* arg0 */                    #  9db: ed02
            beqz         a2, .Lbr032                           #  9dd: bcf2
            movi         a12, 0 /* 0x00000000 */               #  9df: 0c0c
            movi         a13, 0 /* 0x00000000 */               #  9e1: 0c0d
            mov          a15, a3 /* arg1 */                    #  9e3: fd03
.Lbr031:    movi         a0, g_phyFuns                         #  9e5: 01f7ff
            l32i         a0, a0, 0 /* [g_phyFuns] */           #  9e8: 0800
            mov          a2, sp /* (local0) */                 #  9ea: 2d01
            l32i         a0, a0, 36 /* [[g_phyFuns]+0x24] */   #  9ec: 0890
            addi         a3, sp, 2 /* (local1) */              #  9ee: 2b31
            callx0       a0 /* [[g_phyFuns]+0x24] */           #  9f0: c00000
            movi         a4, 1 /* 0x00000001 */                #  9f3: 0c14
            l16si        a3, sp, 2 /* [(local1)] */            #  9f5: 329101
            l16si        a2, sp, 0 /* [(local0)] */            #  9f8: 229100
            ssl          a15                                   #  9fb: 001f40
            sll          a2, a2                                #  9fe: 0022a1
            moveqz       a3, a4, a3                            #  a01: 303483
            s16i         a3, sp, 2 /* a3 -> [(local1)] */      #  a04: 325101
            call0        __divsi3                              #  a07: 01f0ffc0
                                                               #  a0b: 0000
            add          a12, a12, a2                          #  a0d: 2acc
            addi         a13, a13, 1                           #  a0f: 1bdd
            extui        a13, a13, 0, 8                        #  a11: d0d074
            slli         a12, a12, 16                          #  a14: 00cc11
            srai         a12, a12, 16                          #  a17: c0c031
            bne          a14, a13, .Lbr031                     #  a1a: d79ec7
            j            .Lbr033                               #  a1d: 460000
.Lbr032:    movi         a12, 0 /* 0x00000000 */               #  a20: 0c0c
.Lbr033:    l32i         a0, sp, 4 /* [(local2)] */            #  a22: 0811
            l32i         a13, sp, 12 /* [(local4)] */          #  a24: d831
            l32i         a14, sp, 16 /* [(local5)] */          #  a26: e841
            mov          a2, a12                               #  a28: 2d0c
            l32i         a15, sp, 20 /* [(local6)] */          #  a2a: f851
            l32i         a12, sp, 8 /* [(local3)] */           #  a2c: c821
            addi         sp, sp, 32 /* (top of frame) */       #  a2e: 12c120
            ret                                                #  a31: 0df0

            .literal_position                                  #  a34: 000af23f
                                                               #  a38: 0000807f

# Function @ .irom0.text+0xa3c
            .balign      4
            .global      rom_tx_mac_disable
            .type        rom_tx_mac_disable, @function
rom_tx_mac_disable:
            movi         a3, 0x3ff20a00                        #  a3c: 31feff
            memw                                               #  a3f: c02000
            l32i         a5, a3, 0x3e0 /* [0x3ff20de0] */      #  a42: 5223f8
            movi         a7, 0x7f800000                        #  a45: 71fcff
            srli         a6, a5, 1                             #  a48: 506141
            and          a6, a6, a7                            #  a4b: 706610
            movi         a7, 252 /* 0x000000fc */              #  a4e: 72a0fc
            and          a5, a5, a7                            #  a51: 705510
            or           a5, a5, a6                            #  a54: 605520
            movi         a6, 3 /* 0x00000003 */                #  a57: 0c36
            or           a5, a5, a6                            #  a59: 605520
            memw                                               #  a5c: c02000
            s32i         a5, a3, 0x3e0 /* a5 -> [0x3ff20de0] */ #  a5f: 5263f8
            movi         a4, -2 /* 0xfffffffe */               #  a62: 7ce4
            memw                                               #  a64: c02000
            l32i         a2, a3, 0x294 /* [0x3ff20c94] */      #  a67: 2223a5
            and          a2, a2, a4                            #  a6a: 402210
            memw                                               #  a6d: c02000
            s32i         a2, a3, 0x294 /* a2 -> [0x3ff20c94] */ #  a70: 2263a5
            ret                                                #  a73: 0df0

            .literal_position                                  #  a78: 000af23f
                                                               #  a7c: 0000807f

# Function @ .irom0.text+0xa80
            .balign      4
            .global      rom_tx_mac_enable
            .type        rom_tx_mac_enable, @function
rom_tx_mac_enable:
            movi         a3, 0x3ff20a00                        #  a80: 31feff
            memw                                               #  a83: c02000
            l32i         a5, a3, 0x3e0 /* [0x3ff20de0] */      #  a86: 5223f8
            movi         a7, 0x7f800000                        #  a89: 71fcff
            srli         a6, a5, 1                             #  a8c: 506141
            and          a6, a6, a7                            #  a8f: 706610
            movi         a7, 252 /* 0x000000fc */              #  a92: 72a0fc
            and          a5, a5, a7                            #  a95: 705510
            or           a5, a5, a6                            #  a98: 605520
            memw                                               #  a9b: c02000
            s32i         a5, a3, 0x3e0 /* a5 -> [0x3ff20de0] */ #  a9e: 5263f8
            movi         a4, 1 /* 0x00000001 */                #  aa1: 0c14
            memw                                               #  aa3: c02000
            l32i         a2, a3, 0x294 /* [0x3ff20c94] */      #  aa6: 2223a5
            or           a2, a2, a4                            #  aa9: 402220
            memw                                               #  aac: c02000
            s32i         a2, a3, 0x294 /* a2 -> [0x3ff20c94] */ #  aaf: 2263a5
            ret                                                #  ab2: 0df0

            .section     .rodata, "a", @progbits

.Ldata001:  .byte        0x00, 0x04, 0x08, 0x0c, 0x10, 0x13, 0x16, 0x19
            .byte        0x1c, 0x1f, 0x22, 0x24, 0x27, 0x29, 0x2c, 0x2e

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "rxiq_get_mis: s_pwr=%lld, %d-%d, "   #    0: 72786971
                                                               #    4: 5f676574
                                                               #    8: 5f6d6973
                                                               #    c: 3a20735f
                                                               #   10: 7077723d
                                                               #   14: 256c6c64
                                                               #   18: 2c202564
                                                               #   1c: 2d25642c
                                                               #   20: 2000

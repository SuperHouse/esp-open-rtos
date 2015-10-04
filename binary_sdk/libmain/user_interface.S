
            .section     .text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00feef3f
                                                               #    8: 000a0060
                                                               #    c: 80000040
                                                               #   10: 00000000
                                                               #   14: 00000000
                                                               #   18: 00000000
                                                               #   1c: 00000000

# Function @ .text+0x20
# Local variables/stack:
#     (local0):  word[8]   @ -0x30
#     (local1):  word      @ -0x10
#     (local2):  word[3]   @ -0xc
            .balign      4
            .global      sdk_system_restart_in_nmi
            .type        sdk_system_restart_in_nmi, @function
sdk_system_restart_in_nmi:
            movi         a2, 0 /* 0x00000000 */                #   20: 0c02
            movi         a4, 32 /* 0x00000020 */               #   22: 2c04
            addi         sp, sp, -48 /* (local0) */            #   24: 12c1d0
            s32i         a12, sp, 36 /* a12 -> [(local2)] */   #   27: c991
            mov          a3, sp /* (local0) */                 #   29: 3d01
            s32i         a0, sp, 32 /* a0 -> [(local1)] */     #   2b: 0981
            call0        sdk_system_rtc_mem_read               #   2d: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #   30: 0801
            beqi         a0, 2, .Lbr001                        #   32: 26201b
            mov          a2, sp /* (local0) */                 #   35: 2d01
            movi         a3, 0 /* 0x00000000 */                #   37: 0c03
            movi         a4, 32 /* 0x00000020 */               #   39: 2c04
            call0        memset                                #   3b: 01f5ffc0
                                                               #   3f: 0000
            movi         a2, 0 /* 0x00000000 */                #   41: 0c02
            movi         a3, 3 /* 0x00000003 */                #   43: 0c33
            movi         a4, 32 /* 0x00000020 */               #   45: 2c04
            s32i         a3, sp, 0 /* 0x00000003 -> [(local0)] */ #   47: 3901
            mov          a3, sp /* (local0) */                 #   49: 3d01
            call0        sdk_system_rtc_mem_write              #   4b: 01f2ffc0
                                                               #   4f: 0000
.Lbr001:    movi         a4, sdk_NMIIrqIsOn                    #   51: 41ebff
            l8ui         a4, a4, 0 /* [sdk_NMIIrqIsOn] */      #   54: 420400
            movi         a12, 0x3feffe00                       #   57: c1ebff
            bnez         a4, .Lbr003                           #   5a: dce4
            call0        vPortEnterCritical                    #   5c: 01efffc0
                                                               #   60: 0000
            movi         a0, -32 /* 0xffffffe0 */              #   62: 6c00
.Lbr002:    memw                                               #   64: c02000
            l32i         a6, a12, 0x200 /* [0x3ff00000] */     #   67: 622c80
            and          a6, a6, a0                            #   6a: 006610
            memw                                               #   6d: c02000
            s32i         a6, a12, 0x200 /* a6 -> [0x3ff00000] */ #   70: 626c80
            memw                                               #   73: c02000
            l32i         a5, a12, 0x200 /* [0x3ff00000] */     #   76: 522c80
            bbsi         a5, 0, .Lbr002                        #   79: 07e5e7
.Lbr003:    movi         a10, 0x60000a00                       #   7c: a1e3ff
            memw                                               #   7f: c02000
            l32i         a3, a10, 0x348 /* [0x60000d48] */     #   82: 322ad2
            movi         a4, 3 /* 0x00000003 */                #   85: 0c34
            or           a3, a3, a4                            #   87: 403320
            memw                                               #   8a: c02000
            s32i         a3, a10, 0x348 /* a3 -> [0x60000d48] */ #   8d: 326ad2
            movi         a2, 256 /* 0x00000100 */              #   90: 22a100
            memw                                               #   93: c02000
            l32i         a0, a12, 0x218 /* [0x3ff00018] */     #   96: 022c86
            or           a0, a0, a2                            #   99: 200020
            memw                                               #   9c: c02000
            s32i         a0, a12, 0x218 /* a0 -> [0x3ff00018] */ #   9f: 026c86
            movi         a11, -4 /* 0xfffffffc */              #   a2: 7ccb
            memw                                               #   a4: c02000
            l32i         a9, a10, 0x348 /* [0x60000d48] */     #   a7: 922ad2
            and          a9, a9, a11                           #   aa: b09910
            memw                                               #   ad: c02000
            s32i         a9, a10, 0x348 /* a9 -> [0x60000d48] */ #   b0: 926ad2
            movi         a8, -257 /* 0xfffffeff */             #   b3: 82aeff
            memw                                               #   b6: c02000
            l32i         a7, a12, 0x218 /* [0x3ff00018] */     #   b9: 722c86
            and          a7, a7, a8                            #   bc: 807710
            memw                                               #   bf: c02000
            s32i         a7, a12, 0x218 /* a7 -> [0x3ff00018] */ #   c2: 726c86
            call0        Cache_Read_Disable                    #   c5: 01d5ffc0
                                                               #   c9: 0000
            movi         a3, -25 /* 0xffffffe7 */              #   cb: 6c73
            memw                                               #   cd: c02000
            l32i         a2, a12, 0x224 /* [0x3ff00024] */     #   d0: 222c89
            and          a2, a2, a3                            #   d3: 302210
            memw                                               #   d6: c02000
            movi         a0, 0x40000080                        #   d9: 01ccff
            s32i         a2, a12, 0x224 /* a2 -> [0x3ff00024] */ #   dc: 226c89
            callx0       a0 /* 0x40000080 */                   #   df: c00000
            l32i         a12, sp, 36 /* [(local2)] */          #   e2: c891
            l32i         a0, sp, 32 /* [(local1)] */           #   e4: 0881
            addi         sp, sp, 48 /* (top of frame) */       #   e6: 12c130
            ret                                                #   e9: 0df0

            .literal_position                                  #   ec: 000e0060

# Function @ .text+0xf0
            .balign      4
            .global      sdk_system_rtc_mem_write
            .type        sdk_system_rtc_mem_write, @function
sdk_system_rtc_mem_write:
            movi         a5, 191 /* 0x000000bf */              #   f0: 52a0bf
            bltu         a5, a2, .Lbr004                       #   f3: 273512
            movi         a7, 3 /* 0x00000003 */                #   f6: 0c37
            extui        a6, a3, 0, 2                          #   f8: 306014
            bnez         a6, .Lbr004                           #   fb: cca6
            slli         a9, a2, 2                             #   fd: e09211
            movi         a8, 768 /* 0x00000300 */              #  100: 82a300
            sub          a8, a8, a9                            #  103: 9088c0
            bge          a8, a4, .Lbr005                       #  106: 47a803
.Lbr004:    movi         a2, 0 /* 0x00000000 */                #  109: 0c02
            ret           /* 0x00000000 */                     #  10b: 0df0
.Lbr005:    bnone        a7, a4, .Lbr006                       #  10d: 47070a
            movi         a5, 4 /* 0x00000004 */                #  110: 0c45
            srli         a4, a4, 2                             #  112: 404241
            addx4        a4, a4, a5                            #  115: 5044a0
            extui        a4, a4, 0, 16                         #  118: 4040f4
.Lbr006:    srli         a8, a4, 2                             #  11b: 408241
            beqz         a8, .Lbr008                           #  11e: 9ce8
            movi         a7, 0x60000e00                        #  120: 71f3ff
            movi         a4, 0 /* 0x00000000 */                #  123: 0c04
.Lbr007:    add          a6, a2, a4                            #  125: 4a62
            addx4        a5, a4, a3                            #  127: 3054a0
            addx4        a6, a6, a7                            #  12a: 7066a0
            memw                                               #  12d: c02000
            l32i         a5, a5, 0                             #  130: 5805
            memw                                               #  132: c02000
            s32i         a5, a6, 0x300                         #  135: 5266c0
            addi         a4, a4, 1                             #  138: 1b44
            extui        a4, a4, 0, 8                          #  13a: 404074
            bltu         a4, a8, .Lbr007                       #  13d: 8734e4
.Lbr008:    movi         a2, 1 /* 0x00000001 */                #  140: 0c12
            ret           /* 0x00000001 */                     #  142: 0df0

            .literal_position                                  #  144: 000e0060

# Function @ .text+0x148
            .balign      4
            .global      sdk_system_rtc_mem_read
            .type        sdk_system_rtc_mem_read, @function
sdk_system_rtc_mem_read:
            movi         a5, 191 /* 0x000000bf */              #  148: 52a0bf
            bltu         a5, a2, .Lbr009                       #  14b: 273512
            movi         a7, 3 /* 0x00000003 */                #  14e: 0c37
            extui        a6, a3, 0, 2                          #  150: 306014
            bnez         a6, .Lbr009                           #  153: cca6
            slli         a9, a2, 2                             #  155: e09211
            movi         a8, 768 /* 0x00000300 */              #  158: 82a300
            sub          a8, a8, a9                            #  15b: 9088c0
            bge          a8, a4, .Lbr010                       #  15e: 47a803
.Lbr009:    movi         a2, 0 /* 0x00000000 */                #  161: 0c02
            ret           /* 0x00000000 */                     #  163: 0df0
.Lbr010:    bnone        a7, a4, .Lbr011                       #  165: 47070a
            movi         a5, 4 /* 0x00000004 */                #  168: 0c45
            srli         a4, a4, 2                             #  16a: 404241
            addx4        a4, a4, a5                            #  16d: 5044a0
            extui        a4, a4, 0, 16                         #  170: 4040f4
.Lbr011:    srli         a8, a4, 2                             #  173: 408241
            beqz         a8, .Lbr013                           #  176: 9ce8
            movi         a7, 0x60000e00                        #  178: 71f3ff
            movi         a4, 0 /* 0x00000000 */                #  17b: 0c04
.Lbr012:    add          a5, a2, a4                            #  17d: 4a52
            addx4        a6, a4, a3                            #  17f: 3064a0
            addx4        a5, a5, a7                            #  182: 7055a0
            memw                                               #  185: c02000
            l32i         a5, a5, 0x300                         #  188: 5225c0
            memw                                               #  18b: c02000
            s32i         a5, a6, 0                             #  18e: 5906
            addi         a4, a4, 1                             #  190: 1b44
            extui        a4, a4, 0, 8                          #  192: 404074
            bltu         a4, a8, .Lbr012                       #  195: 8734e4
.Lbr013:    movi         a2, 1 /* 0x00000001 */                #  198: 0c12
            ret           /* 0x00000001 */                     #  19a: 0df0

            .section     .data, "aw", @progbits

            .global      sdk_dhcpc_flag
            .type        sdk_dhcpc_flag, @object
sdk_dhcpc_flag:
            .byte        0x01

            .section     .bss, "aw", @nobits

.Ldata001:  .byte        0x00
            .byte        0x00, 0x00, 0x00
.Ldata002:  .space       18
.Label001:  .space       8
.Label002:  .byte        0x00, 0x00
.Ldata003:  .byte        0x00
.Ldata004:  .byte        0x00
.Ldata005:  .byte        0x00
.Ldata006:  .space       103
.Ldata007:  .byte        0x00
            .byte        0x00
.Ldata008:  .space       15
.Label003:  .space       93
.Ldata009:  .byte        0x00
            .global      sdk_cpu_overclock
            .type        sdk_cpu_overclock, @object
sdk_cpu_overclock:
            .byte        0x00
            .byte        0x00, 0x00
            .global      sdk_rst_if
            .type        sdk_rst_if, @object
sdk_rst_if: .space       32
            .global      sdk_promiscuous_cb
            .type        sdk_promiscuous_cb, @object
sdk_promiscuous_cb:
            .word        0x00000000                            #  11c: 00000000
.Ldata010:  .space       10
            .space       6
.Ldata011:  .byte        0x00

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 04000000
                                                               #    4: 04000000
                                                               #    8: 28010000
                                                               #    c: 00000000
                                                               #   10: 1e000000
                                                               #   14: 04000000
                                                               #   18: 04000000
                                                               #   1c: 1e000000
                                                               #   20: 00000000
                                                               #   24: 1e000000
                                                               #   28: 9b000000
                                                               #   2c: 00000000
                                                               #   30: 00000000
                                                               #   34: 00000000
                                                               #   38: 00000000
                                                               #   3c: 00000000
                                                               #   40: 00000000
                                                               #   44: 00000000

# Function @ .irom0.text+0x48
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc001:  addi         sp, sp, -16 /* (local0) */            #   48: 12c1f0
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #   4b: 2901
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   4d: 0911
            call0        sdk_pm_is_open                        #   4f: 01f7ffc0
                                                               #   53: 0000
            beqz         a2, .Lbr015                           #   55: bc02
            movi         a3, .Ldata002                         #   57: 31eaff
            addi         a3, a3, -4 /* .Ldata001 */            #   5a: 32c3fc
            l8ui         a3, a3, 0 /* [.Ldata001] */           #   5d: 320300
            bnez         a3, .Lbr014                           #   60: dc43
            movi         a2, .Ldata002                         #   62: 21e8ff
            movi         a3, .Lfunc002                         #   65: 31e8ff
            movi         a4, 0 /* 0x00000000 */                #   68: 0c04
            call0        sdk_os_timer_setfn                    #   6a: 01f1ffc0
                                                               #   6e: 0000
            movi         a5, .Ldata001                         #   70: 51e7ff
            movi         a4, 1 /* 0x00000001 */                #   73: 0c14
            s8i          a4, a5, 0 /* 0x01 -> [.Ldata001] */   #   75: 424500
.Lbr014:    call0        sdk_pm_is_waked                       #   78: 01efffc0
                                                               #   7c: 0000
            movi         a5, .Label002                         #   7e: 51e4ff
            l8ui         a0, a5, 2 /* [.Ldata003] */           #   81: 020502
            beqz         a2, .Lbr019                           #   84: 9c42
            beqi         a0, 1, .Lbr019                        #   86: 261012
.Lbr015:    movi         a2, 0 /* 0x00000000 */                #   89: 0c02
            j            .Lbr018                               #   8b: 860100
.Lbr016:    l32i         a6, sp, 0 /* [(local0)] */            #   8e: 6801
            s8i          a6, a0, 132                           #   90: 624084
.Lbr017:    movi         a2, -1 /* 0xffffffff */               #   93: 7cf2
.Lbr018:    l32i         a0, sp, 4 /* [(local1)] */            #   95: 0811
            addi         sp, sp, 16 /* (top of frame) */       #   97: 12c110
            ret                                                #   9a: 0df0
.Lbr019:    bnez         a0, .Lbr020                           #   9c: ec40
            movi         a2, 1 /* 0x00000001 */                #   9e: 0c12
            call0        sdk_pm_post                           #   a0: 01e6ffc0
                                                               #   a4: 0000
            movi         a2, .Ldata002                         #   a6: 21dbff
            call0        sdk_os_timer_disarm                   #   a9: 01e4ffc0
                                                               #   ad: 0000
            movi         a2, .Ldata002                         #   af: 21daff
            movi         a3, 10 /* 0x0000000a */               #   b2: 0ca3
            movi         a4, 0 /* 0x00000000 */                #   b4: 0c04
            call0        sdk_os_timer_arm                      #   b6: 01e2ffc0
                                                               #   ba: 0000
            movi         a5, .Label002                         #   bc: 51d8ff
            movi         a7, 1 /* 0x00000001 */                #   bf: 0c17
            s8i          a7, a5, 2 /* 0x01 -> [.Ldata003] */   #   c1: 724502
.Lbr020:    l8ui         a0, a5, 3 /* [.Ldata004] */           #   c4: 020503
            movi         a8, 10 /* 0x0000000a */               #   c7: 0ca8
            addi         a0, a0, 1 /* [.Ldata004]+0x1 */       #   c9: 1b00
            extui        a0, a0, 0, 8                          #   cb: 000074
            s8i          a0, a5, 3 /* a0 -> [.Ldata004] */     #   ce: 024503
            bgeu         a8, a0, .Lbr021                       #   d1: 07b810
            movi         a2, .Lstr001                          #   d4: 21d3ff
            call0        printf                                #   d7: 01dbffc0
                                                               #   db: 0000
            movi         a5, .Label002                         #   dd: 51d1ff
            movi         a0, 10 /* 0x0000000a */               #   e0: 0ca0
            s8i          a0, a5, 3 /* 0x0a -> [.Ldata004] */   #   e2: 024503
.Lbr021:    l8ui         a2, a5, 4 /* [.Ldata005] */           #   e5: 220504
            movi         a3, .Label003                         #   e8: 31d0ff
            add          a2, a2, a0                            #   eb: 0a22
            add          a0, a2, a3                            #   ed: 3a02
            addi         a2, a2, -1                            #   ef: 0b22
            blti         a2, 10, .Lbr016                       #   f1: a69299
            l32i         a3, sp, 0 /* [(local0)] */            #   f4: 3801
            s8i          a3, a0, 122                           #   f6: 32407a
            j            .Lbr017                               #   f9: 86e5ff

            .literal_position                                  #   fc: 16000000
                                                               #  100: 20010000
                                                               #  104: 8c000000
                                                               #  108: 23000000
                                                               #  10c: 04000000
                                                               #  110: 00000000
                                                               #  114: 00000000
                                                               #  118: 00000000
                                                               #  11c: 00000000
                                                               #  120: 00000000
                                                               #  124: 00000000

# Function @ .irom0.text+0x128
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
.Lfunc002:  addi         sp, sp, -16 /* (local0) */            #  128: 12c1f0
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  12b: e931
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  12d: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  12f: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  131: c911
            movi         a12, .Label001                        #  133: c1f2ff
            movi         a13, 0 /* 0x00000000 */               #  136: 0c0d
            l8ui         a0, a12, 11 /* [.Ldata004] */         #  138: 020c0b
            s8i          a13, a12, 10 /* 0x00 -> [.Ldata003] */ #  13b: d24c0a
            beqz         a0, .Lbr034                           #  13e: 16f007
            movi         a14, .Ldata010                        #  141: e1efff
.Lbr022:    call0        sdk_pm_is_waked                       #  144: 01f3ffc0
                                                               #  148: 0000
            bnez         a2, .Lbr023                           #  14a: cc72
            call0        sdk_pm_is_open                        #  14c: 01f2ffc0
                                                               #  150: 0000
            bnez         a2, .Lbr033                           #  152: 568206
.Lbr023:    l8ui         a4, a12, 12 /* [.Ldata005] */         #  155: 420c0c
            add          a0, a4, a14                           #  158: ea04
            l8ui         a0, a0, 0                             #  15a: 020000
            beqi         a0, 1, .Lbr030                        #  15d: 26104e
            beqi         a0, 2, .Lbr029                        #  160: 262045
            beqi         a0, 3, .Lbr028                        #  163: 263039
            beqi         a0, 4, .Lbr027                        #  166: 264030
            beqi         a0, 5, .Lbr026                        #  169: 265024
            bnei         a0, 6, .Lbr025                        #  16c: 666008
            movi         a2, .Ldata008                         #  16f: 21e5ff
            call0        sdk_wifi_softap_set_config            #  172: 050000
.Lbr024:    l8ui         a4, a12, 12 /* [.Ldata005] */         #  175: 420c0c
.Lbr025:    l8ui         a0, a12, 11 /* [.Ldata004] */         #  178: 020c0b
            addi         a4, a4, 1 /* [.Ldata005]+0x1 */       #  17b: 1b44
            extui        a4, a4, 0, 8                          #  17d: 404074
            addi         a0, a0, -1 /* [.Ldata004]-0x1 */      #  180: 0b00
            extui        a0, a0, 0, 8                          #  182: 000074
            s8i          a0, a12, 11 /* a0 -> [.Ldata004] */   #  185: 024c0b
            bnei         a4, 10, .Lbr031                       #  188: 669429
            s8i          a13, a12, 12 /* 0x00 -> [.Ldata005] */ #  18b: d24c0c
            j            .Lbr032                               #  18e: 860900
.Lbr026:    l8ui         a2, a12, 116 /* [.Ldata007] */        #  191: 220c74
            call0        sdk_wifi_set_opmode                   #  194: 050000
            j            .Lbr024                               #  197: 86f6ff
.Lbr027:    call0        sdk_system_restart                    #  19a: 050000
            j            .Lbr024                               #  19d: 06f5ff
.Lbr028:    movi         a2, .Ldata006                         #  1a0: 21daff
            call0        sdk_wifi_station_set_config           #  1a3: 050000
            j            .Lbr024                               #  1a6: c6f2ff
.Lbr029:    call0        sdk_wifi_station_connect              #  1a9: 050000
            j            .Lbr024                               #  1ac: 46f1ff
.Lbr030:    call0        sdk_wifi_station_disconnect           #  1af: 050000
            j            .Lbr024                               #  1b2: c6efff
.Lbr031:    s8i          a4, a12, 12 /* a4 -> [.Ldata005] */   #  1b5: 424c0c
.Lbr032:    bnez         a0, .Lbr022                           #  1b8: 5680f8
            j            .Lbr034                               #  1bb: 860000
.Lbr033:    l8ui         a0, a12, 11 /* [.Ldata004] */         #  1be: 020c0b
.Lbr034:    movi         a14, .Ldata002                        #  1c1: e1d2ff
            bnez         a0, .Lbr036                           #  1c4: dc60
            mov          a2, a14 /* .Ldata002 */               #  1c6: 2d0e
            call0        sdk_os_timer_disarm                   #  1c8: 01d4ffc0
                                                               #  1cc: 0000
.Lbr035:    l32i         a0, sp, 0 /* [(local0)] */            #  1ce: 0801
            s8i          a13, a12, 10 /* a13 -> [.Ldata003] */ #  1d0: d24c0a
            l32i         a14, sp, 12 /* [(local3)] */          #  1d3: e831
            l32i         a12, sp, 4 /* [(local1)] */           #  1d5: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  1d7: d821
            addi         sp, sp, 16 /* (top of frame) */       #  1d9: 12c110
            ret                                                #  1dc: 0df0
.Lbr036:    movi         a2, 1 /* 0x00000001 */                #  1de: 0c12
            call0        sdk_pm_post                           #  1e0: 01cfffc0
                                                               #  1e4: 0000
            mov          a2, a14 /* .Ldata002 */               #  1e6: 2d0e
            call0        sdk_os_timer_disarm                   #  1e8: 01ceffc0
                                                               #  1ec: 0000
            mov          a2, a14 /* .Ldata002 */               #  1ee: 2d0e
            movi         a3, 10 /* 0x0000000a */               #  1f0: 0ca3
            movi         a4, 0 /* 0x00000000 */                #  1f2: 0c04
            call0        sdk_os_timer_arm                      #  1f4: 01ccffc0
                                                               #  1f8: 0000
            movi         a13, 1 /* 0x00000001 */               #  1fa: 0c1d
            j            .Lbr035                               #  1fc: 86f3ff

            .literal_position                                  #  200: 00000000

# Function @ .irom0.text+0x204
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_pp_recycle_rx_pkt
            .type        sdk_system_pp_recycle_rx_pkt, @function
sdk_system_pp_recycle_rx_pkt:
            addi         sp, sp, -16 /* (local0) */            #  204: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  207: 0901
            call0        sdk_ppRecycleRxPkt                    #  209: 01fdffc0
                                                               #  20d: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  20f: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  211: 12c110
            ret                                                #  214: 0df0

            .literal_position                                  #  218: 00000000

# Function @ .irom0.text+0x21c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_adc_read
            .type        sdk_system_adc_read, @function
sdk_system_adc_read:
            movi         a2, 0 /* 0x00000000 */                #  21c: 0c02
            addi         sp, sp, -16 /* (local0) */            #  21e: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  221: 0901
            call0        sdk_test_tout                         #  223: 01fdffc0
                                                               #  227: 0000
            extui        a2, a2, 0, 16                         #  229: 2020f4
            l32i         a0, sp, 0 /* [(local0)] */            #  22c: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  22e: 12c110
            ret                                                #  231: 0df0

            .literal_position                                  #  234: 00060060
                                                               #  238: 00000000
                                                               #  23c: 00000000
                                                               #  240: 00000000
                                                               #  244: 00000000
                                                               #  248: 00000000
                                                               #  24c: 00000000
                                                               #  250: 00000000

# Function @ .irom0.text+0x254
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_restart
            .type        sdk_system_restart, @function
sdk_system_restart:
            addi         sp, sp, -16 /* (local0) */            #  254: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  257: 0901
            call0        sdk_wifi_get_opmode                   #  259: 050000
            beqi         a2, 2, .Lbr037                        #  25c: 262205
            call0        sdk_wifi_station_stop                 #  25f: 01f7ffc0
                                                               #  263: 0000
.Lbr037:    call0        sdk_wifi_get_opmode                   #  265: 01f6ffc0
                                                               #  269: 0000
            beqi         a2, 1, .Lbr038                        #  26b: 261205
            call0        sdk_wifi_softap_stop                  #  26e: 01f5ffc0
                                                               #  272: 0000
.Lbr038:    movi         a2, 6 /* 0x00000006 */                #  274: 0c62
            call0        vTaskDelay                            #  276: 01f4ffc0
                                                               #  27a: 0000
            movi         a4, 128 /* 0x00000080 */              #  27c: 42a080
            movi         a3, 0x60000600                        #  27f: 31edff
            memw                                               #  282: c02000
            l32i         a2, a3, 0x204 /* [0x60000804] */      #  285: 222381
            or           a2, a2, a4                            #  288: 402220
            memw                                               #  28b: c02000
            s32i         a2, a3, 0x204 /* a2 -> [0x60000804] */ #  28e: 226381
            movi         a2, sdk_system_restart_in_nmi         #  291: 21e9ff
            call0        sdk_wDev_MacTim1SetFunc               #  294: 01eeffc0
                                                               #  298: 0000
            movi         a2, 3 /* 0x00000003 */                #  29a: 0c32
            call0        sdk_wDev_MacTim1Arm                   #  29c: 01edffc0
                                                               #  2a0: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  2a2: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  2a4: 12c110
            ret                                                #  2a7: 0df0

            .literal_position                                  #  2ac: 00000000
                                                               #  2b0: 00000000
                                                               #  2b4: 00000000
                                                               #  2b8: 00000000
                                                               #  2bc: 00000000
                                                               #  2c0: 00000000

# Function @ .irom0.text+0x2c4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_system_restore
            .type        sdk_system_restore, @function
sdk_system_restore:
            movi         a2, 880 /* 0x00000370 */              #  2c4: 22a370
            addi         sp, sp, -16 /* (local0) */            #  2c7: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  2ca: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  2cc: 0901
            call0        malloc                                #  2ce: 01f8ffc0
                                                               #  2d2: 0000
            mov          a12, a2                               #  2d4: cd02
            movi         a3, 255 /* 0x000000ff */              #  2d6: 32a0ff
            movi         a4, 880 /* 0x00000370 */              #  2d9: 42a370
            call0        memset                                #  2dc: 01f6ffc0
                                                               #  2e0: 0000
            mov          a2, a12                               #  2e2: 2d0c
            movi         a3, sdk_g_ic+0x1d8                    #  2e4: 31f2ff
            movi         a4, 8 /* 0x00000008 */                #  2e7: 0c84
            call0        memcpy                                #  2e9: 01f3ffc0
                                                               #  2ed: 0000
            mov          a2, a12                               #  2ef: 2d0c
            call0        sdk_wifi_param_save_protect           #  2f1: 01f2ffc0
                                                               #  2f5: 0000
            mov          a2, a12                               #  2f7: 2d0c
            call0        free                                  #  2f9: 01f1ffc0
                                                               #  2fd: 0000
            l32i         a12, sp, 4 /* [(local1)] */           #  2ff: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  301: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  303: 12c110
            ret                                                #  306: 0df0

            .literal_position                                  #  308: 00000000

# Function @ .irom0.text+0x30c
            .balign      4
            .global      sdk_system_get_boot_version
            .type        sdk_system_get_boot_version, @function
sdk_system_get_boot_version:
            movi         a2, sdk_g_ic+0x159                    #  30c: 21ffff
            l8ui         a2, a2, 128 /* [sdk_g_ic+0x1d9] */    #  30f: 220280
            extui        a2, a2, 0, 5                          #  312: 202044
            ret                                                #  315: 0df0

            .literal_position                                  #  318: 28000000
                                                               #  31c: 00000000

# Function @ .irom0.text+0x320
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc003:  addi         sp, sp, -16 /* (local0) */            #  320: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  323: 0901
            call0        sdk_system_get_boot_version           #  325: 050000
            bltui        a2, 3, .Lbr040                        #  328: b6320d
            movi         a0, 31 /* 0x0000001f */               #  32b: 1cf0
            beq          a2, a0, .Lbr040                       #  32d: 071208
            movi         a2, 1 /* 0x00000001 */                #  330: 0c12
.Lbr039:    l32i         a0, sp, 0 /* [(local0)] */            #  332: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  334: 12c110
            ret                                                #  337: 0df0
.Lbr040:    movi         a2, .Lstr002                          #  339: 21f7ff
            call0        printf                                #  33c: 01f8ffc0
                                                               #  340: 0000
            movi         a2, 0 /* 0x00000000 */                #  342: 0c02
            j            .Lbr039                               #  344: 86faff

            .literal_position                                  #  348: 00000000

# Function @ .irom0.text+0x34c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_get_test_result
            .type        sdk_system_get_test_result, @function
sdk_system_get_test_result:
            addi         sp, sp, -16 /* (local0) */            #  34c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  34f: 0901
            call0        .Lfunc003                             #  351: c5fcff
            movi         a0, -1 /* 0xffffffff */               #  354: 7cf0
            movi         a4, sdk_g_ic+0x159                    #  356: 41fcff
            l32i         a3, sp, 0 /* [(local0)] */            #  359: 3801
            l8ui         a4, a4, 128 /* [sdk_g_ic+0x1d9] */    #  35b: 420480
            addi         sp, sp, 16 /* (top of frame) */       #  35e: 12c110
            extui        a4, a4, 5, 1                          #  361: 404504
            movnez       a0, a4, a2                            #  364: 200493
            mov          a2, a0                                #  367: 2d00
            mov          a0, a3 /* [(local0)] */               #  369: 0d03
            ret                                                #  36b: 0df0

            .literal_position                                  #  370: 00000000
                                                               #  374: 00100000
                                                               #  378: 00000000

# Function @ .irom0.text+0x37c
# Local variables/stack:
#     (local0):  byte[5]   @ -0xd
#     (local1):  hword[2]  @ -0x8
#     (local2):  word      @ -0x4
            .balign      4
            .global      sdk_system_get_userbin_addr
            .type        sdk_system_get_userbin_addr, @function
sdk_system_get_userbin_addr:
            addi         sp, sp, -16 /* (FP)-0x10 */           #  37c: 12c1f0
            s32i         a0, sp, 12 /* a0 -> [(local2)] */     #  37f: 0931
            movi         a0, sdk_g_ic+0x159                    #  381: 01fbff
            l8ui         a3, a0, 128 /* [sdk_g_ic+0x1d9] */    #  384: 320080
            l8ui         a4, a0, 127 /* [sdk_g_ic+0x1d8] */    #  387: 42007f
            srli         a3, a3, 7                             #  38a: 303741
            bnez         a3, .Lbr041                           #  38d: dc93
            bbci         a4, 2, .Lbr046                        #  38f: 276454
            l8ui         a2, a0, 132 /* [sdk_g_ic+0x1dd] */    #  392: 220084
            l8ui         a4, a0, 134 /* [sdk_g_ic+0x1df] */    #  395: 420086
            l8ui         a3, a0, 133 /* [sdk_g_ic+0x1de] */    #  398: 320085
            slli         a4, a4, 16                            #  39b: 004411
            slli         a3, a3, 8                             #  39e: 803311
            or           a3, a3, a4                            #  3a1: 403320
            or           a2, a2, a3                            #  3a4: 302220
            j            .Lbr045                               #  3a7: 460d00
.Lbr041:    call0        sdk_system_upgrade_userbin_check      #  3aa: 050000
            bnez         a2, .Lbr042                           #  3ad: cc42
            movi         a2, 0x00001000                        #  3af: 21f1ff
            j            .Lbr045                               #  3b2: 860a00
.Lbr042:    movi         a2, 0 /* 0x00000000 */                #  3b5: 0c02
            mov          a3, sp /* (FP)-0x10 */                #  3b7: 3d01
            movi         a4, 8 /* 0x00000008 */                #  3b9: 0c84
            call0        sdk_spi_flash_read                    #  3bb: 01efffc0
                                                               #  3bf: 0000
            l8ui         a0, sp, 3 /* [(local0)] */            #  3c1: 020103
            movi         a2, 65 /* 0x00000041 */               #  3c4: 4c12
            srli         a0, a0, 4                             #  3c6: 000441
            blti         a0, 2, .Lbr043                        #  3c9: a62008
            bgei         a0, 5, .Lbr043                        #  3cc: e65005
            movi         a0, 129 /* 0x00000081 */              #  3cf: 02a081
            j            .Lbr044                               #  3d2: c60100
.Lbr043:    addi         a3, a0, -1                            #  3d5: 0b30
            l16ui        a0, sp, 8 /* [(local1)] */            #  3d7: 021104
            moveqz       a0, a2, a3                            #  3da: 300283
.Lbr044:    slli         a2, a0, 12                            #  3dd: 402011
.Lbr045:    l32i         a0, sp, 12 /* [(local2)] */           #  3e0: 0831
            addi         sp, sp, 16 /* (top of frame) */       #  3e2: 12c110
            ret                                                #  3e5: 0df0
.Lbr046:    l8ui         a2, a0, 129 /* [sdk_g_ic+0x1da] */    #  3e7: 220081
            l8ui         a4, a0, 131 /* [sdk_g_ic+0x1dc] */    #  3ea: 420083
            l8ui         a3, a0, 130 /* [sdk_g_ic+0x1db] */    #  3ed: 320082
            slli         a4, a4, 16                            #  3f0: 004411
            slli         a3, a3, 8                             #  3f3: 803311
            or           a3, a3, a4                            #  3f6: 403320
            or           a2, a2, a3                            #  3f9: 302220
            j            .Lbr045                               #  3fc: 06f8ff

            .literal_position                                  #  400: 00000000

# Function @ .irom0.text+0x404
            .balign      4
            .global      sdk_system_get_boot_mode
            .type        sdk_system_get_boot_mode, @function
sdk_system_get_boot_mode:
            movi         a5, sdk_g_ic+0x159                    #  404: 51ffff
            l8ui         a5, a5, 128 /* [sdk_g_ic+0x1d9] */    #  407: 520580
            movi         a6, 31 /* 0x0000001f */               #  40a: 1cf6
            extui        a2, a5, 0, 5                          #  40c: 502044
            blti         a2, 3, .Lbr047                        #  40f: a63207
            beq          a2, a6, .Lbr047                       #  412: 671204
            srli         a2, a5, 7                             #  415: 502741
            ret                                                #  418: 0df0
.Lbr047:    movi         a2, 1 /* 0x00000001 */                #  41a: 0c12
            ret           /* 0x00000001 */                     #  41c: 0df0

            .literal_position                                  #  420: 44000000
                                                               #  424: 00000000
                                                               #  428: 64000000
                                                               #  42c: 9c000000
                                                               #  430: 7c000000
                                                               #  434: 00000000
                                                               #  438: 00000000
                                                               #  43c: 00000000
                                                               #  440: 00000000
                                                               #  444: 00000000
                                                               #  448: 00000000
                                                               #  44c: 00000000

# Function @ .irom0.text+0x450
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_system_restart_enhance
            .type        sdk_system_restart_enhance, @function
sdk_system_restart_enhance:
            addi         sp, sp, -16 /* (local0) */            #  450: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  453: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  455: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  457: d921
            mov          a12, a2 /* arg0 */                    #  459: cd02
            mov          a13, a3 /* arg1 */                    #  45b: dd03
            call0        .Lfunc003                             #  45d: 05ecff
            beqz         a2, .Lbr050                           #  460: 169207
            bnez         a12, .Lbr048                          #  463: 569c05
            call0        sdk_system_get_userbin_addr           #  466: 050000
            mov          a12, a2                               #  469: cd02
            mov          a3, a13 /* arg1 */                    #  46b: 3d0d
            movi         a2, .Lstr003                          #  46d: 21ecff
            call0        printf                                #  470: 01f2ffc0
                                                               #  474: 0000
            movi         a4, 251 /* 0x000000fb */              #  476: 42a0fb
            srli         a6, a12, 8                            #  479: c06841
            extui        a7, a12, 16, 16                       #  47c: c070f5
            srli         a8, a13, 8                            #  47f: d08841
            movi         a3, sdk_g_ic+0x159                    #  482: 31e8ff
            extui        a9, a13, 16, 16                       #  485: d090f5
            s8i          a13, a3, 132 /* arg1 -> [sdk_g_ic+0x1dd] */ #  488: d24384
            s8i          a9, a3, 134 /* a9 -> [sdk_g_ic+0x1df] */ #  48b: 924386
            s8i          a8, a3, 133 /* a8 -> [sdk_g_ic+0x1de] */ #  48e: 824385
            s8i          a12, a3, 129 /* a12 -> [sdk_g_ic+0x1da] */ #  491: c24381
            s8i          a7, a3, 131 /* a7 -> [sdk_g_ic+0x1dc] */ #  494: 724383
            s8i          a6, a3, 130 /* a6 -> [sdk_g_ic+0x1db] */ #  497: 624382
            l8ui         a2, a3, 127 /* [sdk_g_ic+0x1d8] */    #  49a: 22037f
            l8ui         a5, a3, 128 /* [sdk_g_ic+0x1d9] */    #  49d: 520380
            and          a2, a2, a4                            #  4a0: 402210
            extui        a5, a5, 0, 7                          #  4a3: 505064
            movi         a4, 4 /* 0x00000004 */                #  4a6: 0c44
            s8i          a5, a3, 128 /* a5 -> [sdk_g_ic+0x1d9] */ #  4a8: 524380
            or           a2, a2, a4                            #  4ab: 402220
            s8i          a2, a3, 127 /* a2 -> [sdk_g_ic+0x1d8] */ #  4ae: 22437f
            addi         a2, a3, 127 /* sdk_g_ic+0x1d8 */      #  4b1: 22c37f
            call0        sdk_wifi_param_save_protect           #  4b4: 01e2ffc0
                                                               #  4b8: 0000
            call0        sdk_system_restart                    #  4ba: 050000
            j            .Lbr053                               #  4bd: 861700
.Lbr048:    bnei         a12, 1, .Lbr049                       #  4c0: 661c10
            call0        sdk_system_get_test_result            #  4c3: 050000
            bnez         a2, .Lbr052                           #  4c6: ec02
            movi         a2, .Lstr004                          #  4c8: 21d8ff
            call0        printf                                #  4cb: 01ddffc0
                                                               #  4cf: 0000
            j            .Lbr050                               #  4d1: 060200
.Lbr049:    movi         a2, .Lstr006                          #  4d4: 21d6ff
            call0        printf                                #  4d7: 01dbffc0
                                                               #  4db: 0000
.Lbr050:    movi         a2, 0 /* 0x00000000 */                #  4dd: 0c02
.Lbr051:    l32i         a12, sp, 4 /* [(local1)] */           #  4df: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  4e1: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  4e3: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  4e5: 12c110
            ret                                                #  4e8: 0df0
.Lbr052:    movi         a2, .Lstr005                          #  4ea: 21d1ff
            mov          a3, a13 /* arg1 */                    #  4ed: 3d0d
            call0        printf                                #  4ef: 01d6ffc0
                                                               #  4f3: 0000
            movi         a12, 191 /* 0x000000bf */             #  4f5: c2a0bf
            extui        a2, a13, 16, 16                       #  4f8: d020f5
            movi         a11, sdk_g_ic+0x159                   #  4fb: b1ceff
            srli         a0, a13, 8                            #  4fe: d00841
            s8i          a13, a11, 129 /* arg1 -> [sdk_g_ic+0x1da] */ #  501: d24b81
            s8i          a0, a11, 130 /* a0 -> [sdk_g_ic+0x1db] */ #  504: 024b82
            s8i          a2, a11, 131 /* a2 -> [sdk_g_ic+0x1dc] */ #  507: 224b83
            l8ui         a10, a11, 128 /* [sdk_g_ic+0x1d9] */  #  50a: a20b80
            addi         a2, a11, 127 /* sdk_g_ic+0x1d8 */     #  50d: 22cb7f
            and          a10, a10, a12                         #  510: c0aa10
            s8i          a10, a11, 128 /* a10 -> [sdk_g_ic+0x1d9] */ #  513: a24b80
            call0        sdk_wifi_param_save_protect           #  516: 01cdffc0
                                                               #  51a: 0000
            call0        sdk_system_restart                    #  51c: 050000
.Lbr053:    movi         a2, 1 /* 0x00000001 */                #  51f: 0c12
            j            .Lbr051                               #  521: 86eeff

            .literal_position                                  #  524: 00000000

# Function @ .irom0.text+0x528
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_system_upgrade_userbin_set
            .type        sdk_system_upgrade_userbin_set, @function
sdk_system_upgrade_userbin_set:
            addi         sp, sp, -16 /* (local0) */            #  528: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  52b: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  52d: 0901
            mov          a12, a2 /* arg0 */                    #  52f: cd02
            call0        sdk_system_get_boot_version           #  531: 050000
            bltui        a12, 2, .Lbr054                       #  534: b62c04
            movi         a2, 0 /* 0x00000000 */                #  537: 0c02
            j            .Lbr058                               #  539: c60900
.Lbr054:    movi         a5, sdk_g_ic+0x158                    #  53c: 51faff
            beqi         a2, 2, .Lbr055                        #  53f: 262204
            movi         a0, 31 /* 0x0000001f */               #  542: 1cf0
            bne          a2, a0, .Lbr056                       #  544: 079208
.Lbr055:    extui        a4, a12, 0, 4                         #  547: c04034
            movi         a0, 240 /* 0x000000f0 */              #  54a: 02a0f0
            j            .Lbr057                               #  54d: 460100
.Lbr056:    extui        a4, a12, 0, 2                         #  550: c04014
            movi         a0, 252 /* 0x000000fc */              #  553: 02a0fc
.Lbr057:    l8ui         a3, a5, 128 /* [sdk_g_ic+0x1d8] */    #  556: 320580
            movi         a2, 1 /* 0x00000001 */                #  559: 0c12
            and          a3, a3, a0                            #  55b: 003310
            or           a3, a3, a4                            #  55e: 403320
            s8i          a3, a5, 128 /* a3 -> [sdk_g_ic+0x1d8] */ #  561: 324580
.Lbr058:    l32i         a12, sp, 4 /* [(local1)] */           #  564: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  566: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  568: 12c110
            ret                                                #  56b: 0df0

            .literal_position                                  #  570: 00000000

# Function @ .irom0.text+0x574
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_upgrade_userbin_check
            .type        sdk_system_upgrade_userbin_check, @function
sdk_system_upgrade_userbin_check:
            addi         sp, sp, -16 /* (local0) */            #  574: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  577: 0901
            call0        sdk_system_get_boot_version           #  579: 050000
            movi         a0, sdk_g_ic+0x158                    #  57c: 01fdff
            movi         a3, 31 /* 0x0000001f */               #  57f: 1cf3
            beq          a2, a3, .Lbr062                       #  581: 37121d
            beqi         a2, 2, .Lbr062                        #  584: 26221a
            l8ui         a0, a0, 128 /* [sdk_g_ic+0x1d8] */    #  587: 020080
            extui        a4, a0, 0, 2                          #  58a: 004014
            bnei         a4, 1, .Lbr061                        #  58d: 66140b
            bbsi         a0, 2, .Lbr063                        #  590: 27e017
.Lbr059:    movi         a2, 0 /* 0x00000000 */                #  593: 0c02
.Lbr060:    l32i         a0, sp, 0 /* [(local0)] */            #  595: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  597: 12c110
            ret                                                #  59a: 0df0
.Lbr061:    bbsi         a0, 2, .Lbr059                        #  59c: 27e0f3
            j            .Lbr063                               #  59f: 060200
.Lbr062:    l8ui         a5, a0, 128 /* [sdk_g_ic+0x1d8] */    #  5a2: 520080
            extui        a5, a5, 0, 4                          #  5a5: 505034
            bnei         a5, 1, .Lbr059                        #  5a8: 6615e7
.Lbr063:    movi         a2, 1 /* 0x00000001 */                #  5ab: 0c12
            j            .Lbr060                               #  5ad: 06f9ff

            .literal_position                                  #  5b0: 00000000

# Function @ .irom0.text+0x5b4
            .balign      4
            .global      sdk_system_upgrade_flag_set
            .type        sdk_system_upgrade_flag_set, @function
sdk_system_upgrade_flag_set:
            bgeui        a2, 3, .Lbr064                        #  5b4: f6320a
            movi         a3, .Ldata001                         #  5b7: 31feff
            movi         a4, 1 /* 0x00000001 */                #  5ba: 0c14
            s8i          a2, a3, 248 /* arg0 -> [.Ldata009] */ #  5bc: 2243f8
            j            .Lbr065                               #  5bf: 460000
.Lbr064:    movi         a4, 0 /* 0x00000000 */                #  5c2: 0c04
.Lbr065:    mov          a2, a4                                #  5c4: 2d04
            ret                                                #  5c6: 0df0

            .literal_position                                  #  5c8: 00000000

# Function @ .irom0.text+0x5cc
            .balign      4
            .global      sdk_system_upgrade_flag_check
            .type        sdk_system_upgrade_flag_check, @function
sdk_system_upgrade_flag_check:
            movi         a2, .Ldata001                         #  5cc: 21ffff
            l8ui         a2, a2, 248 /* [.Ldata009] */         #  5cf: 2202f8
            ret           /* [.Ldata009] */                    #  5d2: 0df0

            .literal_position                                  #  5d4: 00000000
                                                               #  5d8: c4000000
                                                               #  5dc: 00000000
                                                               #  5e0: b4000000
                                                               #  5e4: 00000000
                                                               #  5e8: c4000000
                                                               #  5ec: c8000000
                                                               #  5f0: c8000000
                                                               #  5f4: 00000000
                                                               #  5f8: 00000000
                                                               #  5fc: 00000000
                                                               #  600: 00000000
                                                               #  604: 00000000

# Function @ .irom0.text+0x608
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_system_upgrade_reboot
            .type        sdk_system_upgrade_reboot, @function
sdk_system_upgrade_reboot:
            addi         sp, sp, -16 /* (local0) */            #  608: 12c1f0
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  60b: 0921
            call0        sdk_system_get_boot_version           #  60d: 050000
            movi         a0, .Ldata001                         #  610: 01f1ff
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      #  613: 2911
            l8ui         a0, a0, 248 /* [.Ldata009] */         #  615: 0200f8
            movi         a2, 0 /* 0x00000000 */                #  618: 0c02
            beqi         a0, 2, .Lbr069                        #  61a: 262038
            j            .Lbr068                               #  61d: 860b00
.Lbr066:    l8ui         a2, a0, 128 /* [sdk_g_ic+0x1d8] */    #  620: 220080
            s32i         a0, sp, 0 /* sdk_g_ic+0x158 -> [(local0)] */ #  623: 0901
            extui        a2, a2, 0, 4                          #  625: 202034
            addi         a2, a2, -1                            #  628: 0b22
            bnez         a2, .Lbr071                           #  62a: 569209
            movi         a2, .Label004                         #  62d: 21eaff
            call0        printf                                #  630: 01f1ffc0
                                                               #  634: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  636: 0801
            l8ui         a2, a0, 128 /* [[(local0)]+0x80] */   #  638: 220080
            movi         a3, 240 /* 0x000000f0 */              #  63b: 32a0f0
            and          a2, a2, a3                            #  63e: 302210
.Lbr067:    s8i          a2, a0, 128 /* a2 -> [[(local0)]+0x80] */ #  641: 224080
            movi         a2, sdk_g_ic+0x1d8                    #  644: 21e6ff
            call0        sdk_wifi_param_save_protect           #  647: 050000
            call0        sdk_system_restart                    #  64a: 050000
            movi         a2, 1 /* 0x00000001 */                #  64d: 0c12
.Lbr068:    l32i         a0, sp, 8 /* [(local2)] */            #  64f: 0821
            addi         sp, sp, 16 /* (top of frame) */       #  651: 12c110
            ret                                                #  654: 0df0
.Lbr069:    movi         a2, .Lstr007                          #  656: 21e2ff
            call0        printf                                #  659: 01e7ffc0
                                                               #  65d: 0000
            l32i         a4, sp, 4 /* [(local1)] */            #  65f: 4811
            movi         a0, sdk_g_ic+0x158                    #  661: 01e0ff
            beqi         a4, 2, .Lbr066                        #  664: 2624b8
            movi         a6, 31 /* 0x0000001f */               #  667: 1cf6
            beq          a4, a6, .Lbr066                       #  669: 6714b3
            s32i         a0, sp, 0 /* sdk_g_ic+0x158 -> [(local0)] */ #  66c: 0901
            movi         a10, 128 /* 0x00000080 */             #  66e: a2a080
            movi         a8, 4 /* 0x00000004 */                #  671: 0c48
            movi         a11, 251 /* 0x000000fb */             #  673: b2a0fb
            l8ui         a9, a0, 129 /* [sdk_g_ic+0x1d9] */    #  676: 920081
            l8ui         a7, a0, 128 /* [sdk_g_ic+0x1d8] */    #  679: 720080
            extui        a9, a9, 0, 7                          #  67c: 909064
            and          a7, a7, a11                           #  67f: b07710
            or           a7, a7, a8                            #  682: 807720
            or           a9, a9, a10                           #  685: a09920
            s8i          a9, a0, 129 /* a9 -> [sdk_g_ic+0x1d9] */ #  688: 924081
            s8i          a7, a0, 128 /* a7 -> [sdk_g_ic+0x1d8] */ #  68b: 724080
            extui        a7, a7, 0, 2                          #  68e: 707014
            bnei         a7, 1, .Lbr070                        #  691: 661716
            movi         a2, .Label004                         #  694: 21d5ff
            call0        printf                                #  697: 01d9ffc0
                                                               #  69b: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  69d: 0801
            l8ui         a2, a0, 128 /* [[(local0)]+0x80] */   #  69f: 220080
            movi         a3, 252 /* 0x000000fc */              #  6a2: 32a0fc
            and          a2, a2, a3                            #  6a5: 302210
            j            .Lbr067                               #  6a8: 46e5ff
.Lbr070:    movi         a2, .Label005                         #  6ab: 21d0ff
            call0        printf                                #  6ae: 01d4ffc0
                                                               #  6b2: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  6b4: 0801
            l8ui         a2, a0, 128 /* [[(local0)]+0x80] */   #  6b6: 220080
            movi         a3, 252 /* 0x000000fc */              #  6b9: 32a0fc
            and          a2, a2, a3                            #  6bc: 302210
            movi         a3, 1 /* 0x00000001 */                #  6bf: 0c13
            or           a2, a2, a3                            #  6c1: 302220
            j            .Lbr067                               #  6c4: 46deff
.Lbr071:    movi         a2, .Label005                         #  6c7: 21caff
            call0        printf                                #  6ca: 01ceffc0
                                                               #  6ce: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  6d0: 0801
            l8ui         a2, a0, 128 /* [[(local0)]+0x80] */   #  6d2: 220080
            movi         a3, 240 /* 0x000000f0 */              #  6d5: 32a0f0
            and          a2, a2, a3                            #  6d8: 302210
            movi         a3, 1 /* 0x00000001 */                #  6db: 0c13
            or           a2, a2, a3                            #  6dd: 302220
            j            .Lbr067                               #  6e0: 46d7ff

            .literal_position                                  #  6e4: 40420f00
                                                               #  6e8: cc000000
                                                               #  6ec: 0000ff00
                                                               #  6f0: 00feff5f
                                                               #  6f4: 000e0060
                                                               #  6f8: 00001000
                                                               #  6fc: 00060060
                                                               #  700: ffbfffff
                                                               #  704: 10000100
                                                               #  708: ff01ffff
                                                               #  70c: 00fc0000
                                                               #  710: c8400600
                                                               #  714: 00feef3f
                                                               #  718: 00001000
                                                               #  71c: 00000000
                                                               #  720: 00000000
                                                               #  724: 00000000
                                                               #  728: 00000000
                                                               #  72c: 00000000
                                                               #  730: 00000000

# Function @ .irom0.text+0x734
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc004:  movi         a3, 0x000f4240                        #  734: 31ecff
            addi         sp, sp, -16 /* (local0) */            #  737: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  73a: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  73c: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  73e: 0901
            mov          a12, a2 /* arg0 */                    #  740: cd02
            call0        __udivsi3                             #  742: 01f6ffc0
                                                               #  746: 0000
            mov          a3, a2                                #  748: 3d02
            movi         a2, .Lstr008                          #  74a: 21e7ff
            call0        printf                                #  74d: 01f4ffc0
                                                               #  751: 0000
            movi         a0, 0x00ff0000                        #  753: 01e6ff
            movi         a2, 0x5ffffe00                        #  756: 21e6ff
            memw                                               #  759: c02000
            l32i         a3, a2, 0x21c /* [0x6000001c] */      #  75c: 322287
            bnone        a0, a3, .Lbr073                       #  75f: 370008
.Lbr072:    memw                                               #  762: c02000
            l32i         a4, a2, 0x21c /* [0x6000001c] */      #  765: 422287
            bany         a4, a0, .Lbr072                       #  768: 0784f6
.Lbr073:    movi         a2, 0x60000e00                        #  76b: 21e2ff
            memw                                               #  76e: c02000
            l32i         a5, a2, 0x11c /* [0x60000f1c] */      #  771: 522247
            bnone        a0, a5, .Lbr075                       #  774: 570008
.Lbr074:    memw                                               #  777: c02000
            l32i         a6, a2, 0x11c /* [0x60000f1c] */      #  77a: 622247
            bany         a6, a0, .Lbr074                       #  77d: 0786f6
.Lbr075:    movi         a7, 0x00100000                        #  780: 71deff
            movi         a3, 0 /* 0x00000000 */                #  783: 0c03
            movi         a8, 8 /* 0x00000008 */                #  785: 0c88
            movi         a13, 0x60000600                       #  787: d1ddff
            memw                                               #  78a: c02000
            s32i         a3, a13, 0x100 /* 0x00000000 -> [0x60000700] */ #  78d: 326d40
            movi         a2, 0xffffbfff                        #  790: 21dcff
            memw                                               #  793: c02000
            l32i         a0, a13, 0x100 /* [0x60000700] */     #  796: 022d40
            and          a0, a0, a2                            #  799: 200010
            memw                                               #  79c: c02000
            s32i         a0, a13, 0x100 /* a0 -> [0x60000700] */ #  79f: 026d40
            movi         a11, 48 /* 0x00000030 */              #  7a2: 3c0b
            memw                                               #  7a4: c02000
            l32i         a10, a13, 0x100 /* [0x60000700] */    #  7a7: a22d40
            or           a10, a10, a11                         #  7aa: b0aa20
            memw                                               #  7ad: c02000
            s32i         a10, a13, 0x100 /* a10 -> [0x60000700] */ #  7b0: a26d40
            movi         a9, 4 /* 0x00000004 */                #  7b3: 0c49
            memw                                               #  7b5: c02000
            s32i         a9, a13, 0x144 /* 0x00000004 -> [0x60000744] */ #  7b8: 926d51
            movi         a6, 0x00010010                        #  7bb: 61d2ff
            memw                                               #  7be: c02000
            s32i         a6, a13, 0x10c /* 0x00010010 -> [0x6000070c] */ #  7c1: 626d43
            movi         a5, 0xffff01ff                        #  7c4: 51d1ff
            movi         a4, 0x0000fc00                        #  7c7: 41d1ff
            memw                                               #  7ca: c02000
            l32i         a3, a13, 0x148 /* [0x60000748] */     #  7cd: 322d52
            and          a3, a3, a5                            #  7d0: 503310
            or           a3, a3, a4                            #  7d3: 403320
            memw                                               #  7d6: c02000
            s32i         a3, a13, 0x148 /* a3 -> [0x60000748] */ #  7d9: 326d52
            movi         a2, -512 /* 0xfffffe00 */             #  7dc: 22ae00
            movi         a0, 128 /* 0x00000080 */              #  7df: 02a080
            memw                                               #  7e2: c02000
            l32i         a11, a13, 0x148 /* [0x60000748] */    #  7e5: b22d52
            and          a11, a11, a2                          #  7e8: 20bb10
            or           a11, a11, a0                          #  7eb: 00bb20
            memw                                               #  7ee: c02000
            s32i         a11, a13, 0x148 /* a11 -> [0x60000748] */ #  7f1: b26d52
            movi         a10, 136 /* 0x00000088 */             #  7f4: a2a088
            memw                                               #  7f7: c02000
            l32i         a9, a13, 0x11c /* [0x6000071c] */     #  7fa: 922d47
            add          a9, a9, a10 /* [0x6000071c]+0x88 */   #  7fd: aa99
            memw                                               #  7ff: c02000
            s32i         a9, a13, 0x104 /* [0x6000071c]+0x88 -> [0x60000704] */ #  802: 926d41
            memw                                               #  805: c02000
            s32i         a8, a13, 0x118 /* 0x00000008 -> [0x60000718] */ #  808: 826d46
            memw                                               #  80b: c02000
            s32i         a7, a13, 0x108 /* 0x00100000 -> [0x60000708] */ #  80e: 726d42
            movi         a2, 200 /* 0x000000c8 */              #  811: 22a0c8
            call0        sdk_os_delay_us                       #  814: 01c4ffc0
                                                               #  818: 0000
            movi         a7, 3 /* 0x00000003 */                #  81a: 0c37
            movi         a8, 17 /* 0x00000011 */               #  81c: 1c18
            memw                                               #  81e: c02000
            s32i         a8, a13, 0x19c /* 0x00000011 -> [0x6000079c] */ #  821: 826d67
            memw                                               #  824: c02000
            s32i         a7, a13, 0x1a0 /* 0x00000003 -> [0x600007a0] */ #  827: 726d68
            movi         a6, 0x000640c8                        #  82a: 61b9ff
            memw                                               #  82d: c02000
            s32i         a6, a13, 0x10c /* 0x000640c8 -> [0x6000070c] */ #  830: 626d43
            movi         a5, -49 /* 0xffffffcf */              #  833: 52afcf
            memw                                               #  836: c02000
            l32i         a4, a13, 0x100 /* [0x60000700] */     #  839: 422d40
            and          a4, a4, a5                            #  83c: 504410
            memw                                               #  83f: c02000
            s32i         a4, a13, 0x100 /* a4 -> [0x60000700] */ #  842: 426d40
            call0        sdk_pm_rtc_clock_cali_proc            #  845: 01b8ffc0
                                                               #  849: 0000
            mov          a2, a12 /* arg0 */                    #  84b: 2d0c
            call0        sdk_pm_set_sleep_time                 #  84d: 01b7ffc0
                                                               #  851: 0000
            movi         a10, 0x3feffe00                       #  853: a1b0ff
            memw                                               #  856: c02000
            movi         a2, 17 /* 0x00000011 */               #  859: 1c12
            s32i         a2, a13, 0x19c /* 0x00000011 -> [0x6000079c] */ #  85b: 226d67
            memw                                               #  85e: c02000
            movi         a0, 3 /* 0x00000003 */                #  861: 0c30
            s32i         a0, a13, 0x1a0 /* 0x00000003 -> [0x600007a0] */ #  863: 026d68
            movi         a11, -2 /* 0xfffffffe */              #  866: 7ceb
            memw                                               #  868: c02000
            l32i         a9, a10, 0x204 /* [0x3ff00004] */     #  86b: 922a81
            and          a9, a9, a11                           #  86e: b09910
            memw                                               #  871: c02000
            s32i         a9, a10, 0x204 /* a9 -> [0x3ff00004] */ #  874: 926a81
            movi         a2, 256 /* 0x00000100 */              #  877: 22a100
            call0        sdk__xt_isr_mask                      #  87a: 01adffc0
                                                               #  87e: 0000
            movi         a0, 0x00100000                        #  880: 01a6ff
            movi         a4, -1 /* 0xffffffff */               #  883: 7cf4
            memw                                               #  885: c02000
            s32i         a4, a13, 0x140 /* 0xffffffff -> [0x60000740] */ #  888: 426d50
            movi         a3, 32 /* 0x00000020 */               #  88b: 2c03
            memw                                               #  88d: c02000
            s32i         a3, a13, 0x144 /* 0x00000020 -> [0x60000744] */ #  890: 326d51
            memw                                               #  893: c02000
            movi         a2, 0 /* 0x00000000 */                #  896: 0c02
            s32i         a2, a13, 0x110 /* 0x00000000 -> [0x60000710] */ #  898: 226d44
            bnez         a12, .Lbr076                          #  89b: cc7c
            memw                                               #  89d: c02000
            s32i         a2, a13, 0x118 /* 0x00000000 -> [0x60000718] */ #  8a0: 226d46
            j            .Lbr077                               #  8a3: c60100
.Lbr076:    memw                                               #  8a6: c02000
            movi         a5, 8 /* 0x00000008 */                #  8a9: 0c85
            s32i         a5, a13, 0x118 /* 0x00000008 -> [0x60000718] */ #  8ab: 526d46
.Lbr077:    memw                                               #  8ae: c02000
            s32i         a0, a13, 0x108 /* 0x00100000 -> [0x60000708] */ #  8b1: 026d42
            l32i         a12, sp, 4 /* [(local1)] */           #  8b4: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  8b6: d821
            l32i         a0, sp, 0 /* [(local0)] */            #  8b8: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  8ba: 12c110
            ret           /* 0x00000000 */                     #  8bd: 0df0

            .literal_position                                  #  8c0: 00000000
                                                               #  8c4: 00000000
                                                               #  8c8: 34070000
                                                               #  8cc: 00000000
                                                               #  8d0: 00000000
                                                               #  8d4: 00000000
                                                               #  8d8: 00000000
                                                               #  8dc: 00000000
                                                               #  8e0: 00000000
                                                               #  8e4: 00000000

# Function @ .irom0.text+0x8e8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_system_deep_sleep
            .type        sdk_system_deep_sleep, @function
sdk_system_deep_sleep:
            addi         sp, sp, -16 /* (local0) */            #  8e8: 12c1f0
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  8eb: 2901
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  8ed: 0911
            call0        sdk_wifi_get_opmode                   #  8ef: 050000
            beqi         a2, 2, .Lbr078                        #  8f2: 262205
            call0        sdk_wifi_station_stop                 #  8f5: 01f6ffc0
                                                               #  8f9: 0000
.Lbr078:    call0        sdk_wifi_get_opmode                   #  8fb: 01f6ffc0
                                                               #  8ff: 0000
            beqi         a2, 1, .Lbr079                        #  901: 261205
            call0        sdk_wifi_softap_stop                  #  904: 01f5ffc0
                                                               #  908: 0000
.Lbr079:    movi         a2, sdk_sta_con_timer                 #  90a: 21edff
            call0        sdk_os_timer_disarm                   #  90d: 01f3ffc0
                                                               #  911: 0000
            movi         a2, sdk_sta_con_timer                 #  913: 21ecff
            movi         a3, .Lfunc004                         #  916: 31ecff
            l32i         a4, sp, 0 /* [(local0)] */            #  919: 4801
            call0        sdk_os_timer_setfn                    #  91b: 01f1ffc0
                                                               #  91f: 0000
            movi         a2, sdk_sta_con_timer                 #  921: 21eaff
            movi         a3, 100 /* 0x00000064 */              #  924: 32a064
            movi         a4, 0 /* 0x00000000 */                #  927: 0c04
            call0        sdk_os_timer_arm                      #  929: 01eeffc0
                                                               #  92d: 0000
            l32i         a0, sp, 4 /* [(local1)] */            #  92f: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  931: 12c110
            ret                                                #  934: 0df0

            .literal_position                                  #  938: 00feef3f
                                                               #  93c: 00000000
                                                               #  940: 00000000

# Function @ .irom0.text+0x944
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_update_cpu_freq
            .type        sdk_system_update_cpu_freq, @function
sdk_system_update_cpu_freq:
            addi         sp, sp, -16 /* (local0) */            #  944: 12c1f0
            movi         a5, 80 /* 0x00000050 */               #  947: 5c05
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  949: 0901
            movi         a0, 0x3feffe00                        #  94b: 01fbff
            bne          a2, a5, .Lbr080                       #  94e: 57921b
            movi         a3, -2 /* 0xfffffffe */               #  951: 7ce3
            memw                                               #  953: c02000
            l32i         a2, a0, 0x214 /* [0x3ff00014] */      #  956: 222085
            and          a2, a2, a3                            #  959: 302210
            memw                                               #  95c: c02000
            s32i         a2, a0, 0x214 /* a2 -> [0x3ff00014] */ #  95f: 226085
            mov          a2, a5 /* 0x00000050 */               #  962: 2d05
            call0        sdk_os_update_cpu_frequency           #  964: 01f6ffc0
                                                               #  968: 0000
            j            .Lbr081                               #  96a: 860700
.Lbr080:    movi         a5, 160 /* 0x000000a0 */              #  96d: 52a0a0
            bne          a2, a5, .Lbr082                       #  970: 57921d
            mov          a2, a5 /* 0x000000a0 */               #  973: 2d05
            movi         a6, 1 /* 0x00000001 */                #  975: 0c16
            memw                                               #  977: c02000
            l32i         a4, a0, 0x214 /* [0x3ff00014] */      #  97a: 422085
            or           a4, a4, a6                            #  97d: 604420
            memw                                               #  980: c02000
            s32i         a4, a0, 0x214 /* a4 -> [0x3ff00014] */ #  983: 426085
            call0        sdk_os_update_cpu_frequency           #  986: 01eeffc0
                                                               #  98a: 0000
.Lbr081:    movi         a2, 1 /* 0x00000001 */                #  98c: 0c12
            j            .Lbr083                               #  98e: 460000
.Lbr082:    movi         a2, 0 /* 0x00000000 */                #  991: 0c02
.Lbr083:    l32i         a0, sp, 0 /* [(local0)] */            #  993: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  995: 12c110
            ret                                                #  998: 0df0

            .literal_position                                  #  99c: 00000000

# Function @ .irom0.text+0x9a0
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_get_cpu_freq
            .type        sdk_system_get_cpu_freq, @function
sdk_system_get_cpu_freq:
            addi         sp, sp, -16 /* (local0) */            #  9a0: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  9a3: 0901
            call0        sdk_os_get_cpu_frequency              #  9a5: 01fdffc0
                                                               #  9a9: 0000
            extui        a2, a2, 0, 8                          #  9ab: 202074
            l32i         a0, sp, 0 /* [(local0)] */            #  9ae: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  9b0: 12c110
            ret                                                #  9b3: 0df0

            .literal_position                                  #  9b8: 00000000

# Function @ .irom0.text+0x9bc
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_overclock
            .type        sdk_system_overclock, @function
sdk_system_overclock:
            addi         sp, sp, -16 /* (local0) */            #  9bc: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  9bf: 0901
            call0        sdk_system_get_cpu_freq               #  9c1: 050000
            movi         a0, 80 /* 0x00000050 */               #  9c4: 5c00
            bne          a2, a0, .Lbr084                       #  9c6: 079212
            movi         a3, .Ldata001                         #  9c9: 31fbff
            movi         a2, 1 /* 0x00000001 */                #  9cc: 0c12
            s8i          a2, a3, 249 /* 0x01 -> [sdk_cpu_overclock] */ #  9ce: 2243f9
            movi         a2, 160 /* 0x000000a0 */              #  9d1: 22a0a0
            call0        sdk_system_update_cpu_freq            #  9d4: 050000
            movi         a2, 1 /* 0x00000001 */                #  9d7: 0c12
            j            .Lbr085                               #  9d9: 460000
.Lbr084:    movi         a2, 0 /* 0x00000000 */                #  9dc: 0c02
.Lbr085:    l32i         a0, sp, 0 /* [(local0)] */            #  9de: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  9e0: 12c110
            ret                                                #  9e3: 0df0

            .literal_position                                  #  9e8: 00000000

# Function @ .irom0.text+0x9ec
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_restoreclock
            .type        sdk_system_restoreclock, @function
sdk_system_restoreclock:
            addi         sp, sp, -16 /* (local0) */            #  9ec: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  9ef: 0901
            call0        sdk_system_get_cpu_freq               #  9f1: 050000
            movi         a0, 160 /* 0x000000a0 */              #  9f4: 02a0a0
            bne          a2, a0, .Lbr086                       #  9f7: 079217
            movi         a0, .Ldata001                         #  9fa: 01fbff
            l8ui         a2, a0, 249 /* [sdk_cpu_overclock] */ #  9fd: 2200f9
            bnei         a2, 1, .Lbr086                        #  a00: 66120e
            movi         a2, 80 /* 0x00000050 */               #  a03: 5c02
            movi         a3, 0 /* 0x00000000 */                #  a05: 0c03
            s8i          a3, a0, 249 /* 0x00 -> [sdk_cpu_overclock] */ #  a07: 3240f9
            call0        sdk_system_update_cpu_freq            #  a0a: 050000
            movi         a2, 1 /* 0x00000001 */                #  a0d: 0c12
            j            .Lbr087                               #  a0f: 460000
.Lbr086:    movi         a2, 0 /* 0x00000000 */                #  a12: 0c02
.Lbr087:    l32i         a0, sp, 0 /* [(local0)] */            #  a14: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  a16: 12c110
            ret                                                #  a19: 0df0

            .literal_position                                  #  a1c: 00000000
                                                               #  a20: 000af23f

# Function @ .irom0.text+0xa24
            .balign      4
            .global      sdk_system_get_time
            .type        sdk_system_get_time, @function
sdk_system_get_time:
            movi         a3, sdk_WdevTimOffSet                 #  a24: 31feff
            movi         a2, 0x3ff20a00                        #  a27: 21feff
            l32i         a3, a3, 0 /* [sdk_WdevTimOffSet] */   #  a2a: 3803
            memw                                               #  a2c: c02000
            l32i         a2, a2, 0x200 /* [0x3ff20c00] */      #  a2f: 222280
            add          a2, a2, a3                            #  a32: 3a22
            ret                                                #  a34: 0df0

            .literal_position                                  #  a38: 000af23f

# Function @ .irom0.text+0xa3c
            .balign      4
            .global      sdk_system_relative_time
            .type        sdk_system_relative_time, @function
sdk_system_relative_time:
            movi         a3, 0x3ff20a00                        #  a3c: 31ffff
            memw                                               #  a3f: c02000
            l32i         a3, a3, 0x200 /* [0x3ff20c00] */      #  a42: 322380
            sub          a2, a3, a2                            #  a45: 2023c0
            ret                                                #  a48: 0df0

            .literal_position                                  #  a4c: 00000000
                                                               #  a50: e0000000
                                                               #  a54: 10010000
                                                               #  a58: 00000000
                                                               #  a5c: 00000000
                                                               #  a60: 00000000
                                                               #  a64: 00000000
                                                               #  a68: 00000000
                                                               #  a6c: 00000000
                                                               #  a70: 00000000

# Function @ .irom0.text+0xa74
# Local variables/stack:
#     (local0):  word      @ -0x30
#     (local1):  word      @ -0x2c
#     (local2):  word      @ -0x28
#     (local3):  word      @ -0x24
#     (local4):  word      @ -0x20
#     (local5):  word      @ -0x1c
#     (local6):  word[2]   @ -0x18
#     (local7):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_station_got_ip_set
            .type        sdk_system_station_got_ip_set, @function
sdk_system_station_got_ip_set:
            mov          a10, a3 /* arg1 */                    #  a74: ad03
            addi         sp, sp, -48 /* (local0) */            #  a76: 12c1d0
            mov          a6, a2 /* arg0 */                     #  a79: 6d02
            mov          a9, a4 /* arg2 */                     #  a7b: 9d04
            movi         a2, .Lstr009                          #  a7d: 21f4ff
            movi         a4, sdk_g_ic                          #  a80: 41f3ff
            s32i         a0, sp, 32 /* a0 -> [(local7)] */     #  a83: 0981
            l32i         a4, a4, 16 /* [sdk_g_ic+0x10] */      #  a85: 4844
            movi         a3, 5 /* 0x00000005 */                #  a87: 0c53
            s8i          a3, a4, 186 /* 0x05 -> [[sdk_g_ic+0x10]+0xba] */ #  a89: 3244ba
            l8ui         a7, a10, 0 /* [arg1] */               #  a8c: 720a00
            l8ui         a3, a6, 0 /* [arg0] */                #  a8f: 320600
            l8ui         a4, a6, 1 /* [arg0+0x1] */            #  a92: 420601
            l8ui         a5, a6, 2 /* [arg0+0x2] */            #  a95: 520602
            l8ui         a0, a10, 1 /* [arg1+0x1] */           #  a98: 020a01
            l8ui         a6, a6, 3 /* [arg0+0x3] */            #  a9b: 620603
            s32i         a0, sp, 0 /* [arg1+0x1] -> [(local0)] */ #  a9e: 0901
            l8ui         a11, a10, 2 /* [arg1+0x2] */          #  aa0: b20a02
            s32i         a11, sp, 4 /* [arg1+0x2] -> [(local1)] */ #  aa3: b911
            l8ui         a8, a10, 3 /* [arg1+0x3] */           #  aa5: 820a03
            s32i         a8, sp, 8 /* [arg1+0x3] -> [(local2)] */ #  aa8: 8921
            l8ui         a0, a9, 0 /* [arg2] */                #  aaa: 020900
            s32i         a0, sp, 12 /* [arg2] -> [(local3)] */ #  aad: 0931
            l8ui         a11, a9, 1 /* [arg2+0x1] */           #  aaf: b20901
            s32i         a11, sp, 16 /* [arg2+0x1] -> [(local4)] */ #  ab2: b941
            l8ui         a8, a9, 2 /* [arg2+0x2] */            #  ab4: 820902
            s32i         a8, sp, 20 /* [arg2+0x2] -> [(local5)] */ #  ab7: 8951
            l8ui         a0, a9, 3 /* [arg2+0x3] */            #  ab9: 020903
            s32i         a0, sp, 24 /* [arg2+0x3] -> [(local6)] */ #  abc: 0961
            call0        printf                                #  abe: 01e9ffc0
                                                               #  ac2: 0000
            movi         a2, .Label006                         #  ac4: 21e4ff
            call0        printf                                #  ac7: 01e8ffc0
                                                               #  acb: 0000
            movi         a0, sdk_g_ic+0x180                    #  acd: 01e2ff
            l8ui         a5, a0, 97 /* [sdk_g_ic+0x1e1] */     #  ad0: 520061
            l8ui         a6, a0, 96 /* [sdk_g_ic+0x1e0] */     #  ad3: 620060
            bnei         a5, 1, .Lbr088                        #  ad6: 661525
            bnei         a6, 1, .Lbr088                        #  ad9: 661622
            movi         a2, sdk_sta_con_timer                 #  adc: 21e0ff
            call0        sdk_os_timer_disarm                   #  adf: 01e3ffc0
                                                               #  ae3: 0000
            movi         a2, 0 /* 0x00000000 */                #  ae5: 0c02
            movi         a6, sdk_g_ic+0x180                    #  ae7: 61deff
            movi         a5, 0 /* 0x00000000 */                #  aea: 0c05
            l8ui         a6, a6, 98 /* [sdk_g_ic+0x1e2] */     #  aec: 620662
            movi         a4, 1 /* 0x00000001 */                #  aef: 0c14
            ssl          a6                                    #  af1: 001640
            sll          a4, a4                                #  af4: 0044a1
            mov          a3, a4                                #  af7: 3d04
            call0        sdk_gpio_output_set                   #  af9: 01ddffc0
                                                               #  afd: 0000
.Lbr088:    l32i         a0, sp, 32 /* [(local7)] */           #  aff: 0881
            addi         sp, sp, 48 /* (top of frame) */       #  b01: 12c130
            ret                                                #  b04: 0df0

            .literal_position                                  #  b08: 00000000
                                                               #  b0c: 00000000
                                                               #  b10: 14010000
                                                               #  b14: 30010000
                                                               #  b18: 00000000
                                                               #  b1c: 00000000
                                                               #  b20: 14010000
                                                               #  b24: 38010000
                                                               #  b28: 00000000
                                                               #  b2c: 00000000
                                                               #  b30: 14010000
                                                               #  b34: 40010000
                                                               #  b38: 00000000
                                                               #  b3c: 00c0ff3f
                                                               #  b40: 14010000
                                                               #  b44: 48010000
                                                               #  b48: 00c0ff3f
                                                               #  b4c: 00000000
                                                               #  b50: 00000000
                                                               #  b54: 00000000
                                                               #  b58: 00000000

# Function @ .irom0.text+0xb5c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_print_meminfo
            .type        sdk_system_print_meminfo, @function
sdk_system_print_meminfo:
            movi         a2, .Lstr010                          #  b5c: 21edff
            movi         a3, .Lstr011                          #  b5f: 31edff
            movi         a5, _data_end                         #  b62: 51eaff
            movi         a6, _data_start                       #  b65: 61e8ff
            addi         sp, sp, -16 /* (local0) */            #  b68: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  b6b: 0901
            mov          a4, a6 /* _data_start */              #  b6d: 4d06
            sub          a6, a5, a6                            #  b6f: 6065c0
            call0        printf                                #  b72: 01f6ffc0
                                                               #  b76: 0000
            movi         a2, .Lstr010                          #  b78: 21eaff
            movi         a3, .Lstr012                          #  b7b: 31eaff
            movi         a6, _rodata_start                     #  b7e: 61e6ff
            movi         a5, _rodata_end                       #  b81: 51e6ff
            mov          a4, a6 /* _rodata_start */            #  b84: 4d06
            sub          a6, a5, a6                            #  b86: 6065c0
            call0        printf                                #  b89: 01f1ffc0
                                                               #  b8d: 0000
            movi         a2, .Lstr010                          #  b8f: 21e8ff
            movi         a3, .Lstr013                          #  b92: 31e8ff
            movi         a6, _bss_start                        #  b95: 61e4ff
            movi         a5, _bss_end                          #  b98: 51e5ff
            mov          a4, a6 /* _bss_start */               #  b9b: 4d06
            sub          a6, a5, a6                            #  b9d: 6065c0
            call0        printf                                #  ba0: 01edffc0
                                                               #  ba4: 0000
            movi         a2, .Lstr010                          #  ba6: 21e6ff
            movi         a3, .Lstr014                          #  ba9: 31e6ff
            movi         a5, 0x3fffc000                        #  bac: 51e7ff
            movi         a7, _heap_start                       #  baf: 71e2ff
            movi         a6, 0x3fffc000                        #  bb2: 61e2ff
            mov          a4, a7 /* _heap_start */              #  bb5: 4d07
            sub          a6, a6, a7                            #  bb7: 7066c0
            call0        printf                                #  bba: 01e7ffc0
                                                               #  bbe: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  bc0: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  bc2: 12c110
            ret                                                #  bc5: 0df0

            .literal_position                                  #  bc8: 00000000

# Function @ .irom0.text+0xbcc
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_get_free_heap_size
            .type        sdk_system_get_free_heap_size, @function
sdk_system_get_free_heap_size:
            addi         sp, sp, -16 /* (local0) */            #  bcc: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  bcf: 0901
            call0        xPortGetFreeHeapSize                  #  bd1: 01fdffc0
                                                               #  bd5: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  bd7: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  bd9: 12c110
            ret                                                #  bdc: 0df0

            .literal_position                                  #  be0: 000000ff
                                                               #  be4: 00feef3f
                                                               #  be8: ffffff00

# Function @ .irom0.text+0xbec
            .balign      4
            .global      sdk_system_get_chip_id
            .type        sdk_system_get_chip_id, @function
sdk_system_get_chip_id:
            movi         a4, 0xff000000                        #  bec: 41fdff
            movi         a2, 0x3feffe00                        #  bef: 21fdff
            memw                                               #  bf2: c02000
            l32i         a3, a2, 0x250 /* [0x3ff00050] */      #  bf5: 322294
            and          a3, a3, a4                            #  bf8: 403310
            movi         a4, 0x00ffffff                        #  bfb: 41fbff
            memw                                               #  bfe: c02000
            l32i         a2, a2, 0x254 /* [0x3ff00054] */      #  c01: 222295
            ssai         24                                    #  c04: 104840
            and          a2, a2, a4                            #  c07: 402210
            src          a2, a2, a3                            #  c0a: 302281
            ret                                                #  c0d: 0df0

            .literal_position                                  #  c10: 00000000

# Function @ .irom0.text+0xc14
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_rtc_clock_cali_proc
            .type        sdk_system_rtc_clock_cali_proc, @function
sdk_system_rtc_clock_cali_proc:
            addi         sp, sp, -16 /* (local0) */            #  c14: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  c17: 0901
            call0        sdk_pm_rtc_clock_cali_proc            #  c19: 01fdffc0
                                                               #  c1d: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #  c1f: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  c21: 12c110
            ret                                                #  c24: 0df0

            .literal_position                                  #  c28: 00060060

# Function @ .irom0.text+0xc2c
            .balign      4
            .global      sdk_system_get_rtc_time
            .type        sdk_system_get_rtc_time, @function
sdk_system_get_rtc_time:
            movi         a2, 0x60000600                        #  c2c: 21ffff
            memw                                               #  c2f: c02000
            l32i         a2, a2, 0x11c /* [0x6000071c] */      #  c32: 222247
            ret           /* [0x6000071c] */                   #  c35: 0df0

            .literal_position                                  #  c38: fc000000

# Function @ .irom0.text+0xc3c
            .balign      4
            .global      sdk_system_get_rst_info
            .type        sdk_system_get_rst_info, @function
sdk_system_get_rst_info:
            movi         a2, sdk_rst_if                        #  c3c: 21ffff
            ret           /* sdk_rst_if */                     #  c3f: 0df0

            .literal_position                                  #  c44: 00000000

# Function @ .irom0.text+0xc48
            .balign      4
.Lfunc005:  bltui        a2, 2, .Lbr089                        #  c48: b62203
            movi         a2, 0 /* 0x00000000 */                #  c4b: 0c02
            ret           /* 0x00000000 */                     #  c4d: 0df0
.Lbr089:    movi         a4, sdk_g_ic                          #  c4f: 41fdff
            l32i         a3, a4, 16 /* [sdk_g_ic+0x10] */      #  c52: 3844
            l32i         a4, a4, 20 /* [sdk_g_ic+0x14] */      #  c54: 4854
            moveqz       a4, a3, a2                            #  c56: 204383
            beqz         a4, .Lbr090                           #  c59: 8c24
            l32i         a2, a4, 0                             #  c5b: 2804
            ret                                                #  c5d: 0df0
.Lbr090:    movi         a2, 0 /* 0x00000000 */                #  c5f: 0c02
            ret           /* 0x00000000 */                     #  c61: 0df0

            .literal_position                                  #  c64: 00000000
                                                               #  c68: 00000000
                                                               #  c6c: 00000000
                                                               #  c70: 00000000
                                                               #  c74: 00000000

# Function @ .irom0.text+0xc78
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wifi_station_dhcpc_start
            .type        sdk_wifi_station_dhcpc_start, @function
sdk_wifi_station_dhcpc_start:
            movi         a2, 0 /* 0x00000000 */                #  c78: 0c02
            addi         sp, sp, -16 /* (local0) */            #  c7a: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  c7d: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  c7f: 0901
            call0        .Lfunc005                             #  c81: 45fcff
            mov          a12, a2                               #  c84: cd02
            call0        sdk_wifi_get_opmode                   #  c86: 050000
            beqi         a2, 2, .Lbr093                        #  c89: 26223f
            movi         a0, sdk_dhcpc_flag                    #  c8c: 01f6ff
            beqz         a12, .Lbr091                          #  c8f: acbc
            l8ui         a2, a0, 0 /* [sdk_dhcpc_flag] */      #  c91: 220000
            bnez         a2, .Lbr091                           #  c94: ec62
            mov          a2, a12                               #  c96: 2d0c
            movi         a5, sdk_info                          #  c98: 51f4ff
            movi         a6, 0 /* 0x00000000 */                #  c9b: 0c06
            s32i         a6, a5, 12 /* 0x00000000 -> [sdk_info+0xc] */ #  c9d: 6935
            s32i         a6, a5, 16 /* 0x00000000 -> [sdk_info+0x10] */ #  c9f: 6945
            s32i         a6, a5, 20 /* 0x00000000 -> [sdk_info+0x14] */ #  ca1: 6955
            addi         a3, a5, 12 /* sdk_info+0xc */         #  ca3: cb35
            addi         a4, a5, 16 /* sdk_info+0x10 */        #  ca5: 42c510
            addi         a5, a5, 20 /* sdk_info+0x14 */        #  ca8: 52c514
            call0        netif_set_addr                        #  cab: 01f1ffc0
                                                               #  caf: 0000
            mov          a2, a12                               #  cb1: 2d0c
            call0        dhcp_start                            #  cb3: 01f0ffc0
                                                               #  cb7: 0000
            movi         a0, sdk_dhcpc_flag                    #  cb9: 01ecff
            bnez         a2, .Lbr093                           #  cbc: ccc2
.Lbr091:    movi         a2, 1 /* 0x00000001 */                #  cbe: 0c12
            s8i          a2, a0, 0 /* 0x01 -> [sdk_dhcpc_flag] */ #  cc0: 224000
.Lbr092:    l32i         a12, sp, 4 /* [(local1)] */           #  cc3: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  cc5: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  cc7: 12c110
            ret                                                #  cca: 0df0
.Lbr093:    movi         a2, 0 /* 0x00000000 */                #  ccc: 0c02
            j            .Lbr092                               #  cce: 46fcff

            .literal_position                                  #  cd4: 00000000
                                                               #  cd8: 00000000
                                                               #  cdc: 00000000

# Function @ .irom0.text+0xce0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wifi_station_dhcpc_stop
            .type        sdk_wifi_station_dhcpc_stop, @function
sdk_wifi_station_dhcpc_stop:
            movi         a2, 0 /* 0x00000000 */                #  ce0: 0c02
            addi         sp, sp, -16 /* (local0) */            #  ce2: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  ce5: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  ce7: 0901
            call0        .Lfunc005                             #  ce9: c5f5ff
            mov          a12, a2                               #  cec: cd02
            call0        sdk_wifi_get_opmode                   #  cee: 050000
            bnei         a2, 2, .Lbr094                        #  cf1: 662204
            movi         a2, 0 /* 0x00000000 */                #  cf4: 0c02
            j            .Lbr096                               #  cf6: 060700
.Lbr094:    movi         a0, sdk_dhcpc_flag                    #  cf9: 01f6ff
            beqz         a12, .Lbr095                          #  cfc: 8cfc
            l8ui         a2, a0, 0 /* [sdk_dhcpc_flag] */      #  cfe: 220000
            bnei         a2, 1, .Lbr095                        #  d01: 66120a
            mov          a2, a12                               #  d04: 2d0c
            call0        dhcp_stop                             #  d06: 01f5ffc0
                                                               #  d0a: 0000
            movi         a0, sdk_dhcpc_flag                    #  d0c: 01f3ff
.Lbr095:    movi         a2, 1 /* 0x00000001 */                #  d0f: 0c12
            movi         a3, 0 /* 0x00000000 */                #  d11: 0c03
            s8i          a3, a0, 0 /* 0x00 -> [sdk_dhcpc_flag] */ #  d13: 324000
.Lbr096:    l32i         a12, sp, 4 /* [(local1)] */           #  d16: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  d18: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  d1a: 12c110
            ret                                                #  d1d: 0df0

            .literal_position                                  #  d20: 00000000

# Function @ .irom0.text+0xd24
            .balign      4
            .global      sdk_wifi_station_dhcpc_status
            .type        sdk_wifi_station_dhcpc_status, @function
sdk_wifi_station_dhcpc_status:
            movi         a2, sdk_dhcpc_flag                    #  d24: 21ffff
            l8ui         a2, a2, 0 /* [sdk_dhcpc_flag] */      #  d27: 220200
            ret           /* [sdk_dhcpc_flag] */               #  d2a: 0df0

            .literal_position                                  #  d2c: 00000000
                                                               #  d30: 00000000

# Function @ .irom0.text+0xd34
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
.Lfunc006:  addi         sp, sp, -16 /* (local0) */            #  d34: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  d37: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  d39: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  d3b: 0901
            mov          a12, a2 /* arg0 */                    #  d3d: cd02
            bnei         a2, 1, .Lbr097                        #  d3f: 661205
            movi         a2, sdk_g_ic+0x1d8                    #  d42: 21faff
            j            .Lbr098                               #  d45: 860000
.Lbr097:    call0        .Lfunc009                             #  d48: c52e00
.Lbr098:    l8ui         a13, a2, 8                            #  d4b: d20208
            bltui        a13, 4, .Lbr099                       #  d4e: b64d01
            movi         a13, 2 /* 0x00000002 */               #  d51: 0c2d
.Lbr099:    beqi         a12, 1, .Lbr100                       #  d53: 261c05
            call0        free                                  #  d56: 01f6ffc0
                                                               #  d5a: 0000
.Lbr100:    l32i         a0, sp, 0 /* [(local0)] */            #  d5c: 0801
            extui        a2, a13, 0, 8                         #  d5e: d02074
            l32i         a12, sp, 4 /* [(local1)] */           #  d61: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  d63: d821
            addi         sp, sp, 16 /* (top of frame) */       #  d65: 12c110
            ret                                                #  d68: 0df0

            .balign      4
# Function @ .irom0.text+0xd6c
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_get_opmode
            .type        sdk_wifi_get_opmode, @function
sdk_wifi_get_opmode:
            movi         a2, 1 /* 0x00000001 */                #  d6c: 0c12
            addi         sp, sp, -16 /* (local0) */            #  d6e: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  d71: 0901
            call0        .Lfunc006                             #  d73: 05fcff
            l32i         a0, sp, 0 /* [(local0)] */            #  d76: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  d78: 12c110
            ret                                                #  d7b: 0df0

            .balign      4
# Function @ .irom0.text+0xd80
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_get_opmode_default
            .type        sdk_wifi_get_opmode_default, @function
sdk_wifi_get_opmode_default:
            movi         a2, 0 /* 0x00000000 */                #  d80: 0c02
            addi         sp, sp, -16 /* (local0) */            #  d82: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  d85: 0901
            call0        .Lfunc006                             #  d87: c5faff
            l32i         a0, sp, 0 /* [(local0)] */            #  d8a: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  d8c: 12c110
            ret                                                #  d8f: 0df0

            .literal_position                                  #  d94: 00000000
                                                               #  d98: 00000000
                                                               #  d9c: 00000000
                                                               #  da0: 00000000
                                                               #  da4: 00000000
                                                               #  da8: 00000000
                                                               #  dac: 00000000
                                                               #  db0: 00000000

# Function @ .irom0.text+0xdb4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
.Lfunc007:  addi         sp, sp, -16 /* (local0) */            #  db4: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  db7: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  db9: 0901
            mov          a12, a2 /* arg0 */                    #  dbb: cd02
            movi         a0, 1 /* 0x00000001 */                #  dbd: 0c10
            bgeui        a2, 4, .Lbr101                        #  dbf: f64201
            movi         a0, 0 /* 0x00000000 */                #  dc2: 0c00
.Lbr101:    movi         a2, 2 /* 0x00000002 */                #  dc4: 0c22
            movnez       a12, a2, a0                           #  dc6: 00c293
            beqi         a12, 1, .Lbr102                       #  dc9: 261c01
            bnez         a12, .Lbr103                          #  dcc: cc4c
.Lbr102:    call0        sdk_wifi_softap_stop                  #  dce: 01f2ffc0
                                                               #  dd2: 0000
.Lbr103:    beqi         a12, 2, .Lbr104                       #  dd4: 262c01
            bnez         a12, .Lbr105                          #  dd7: cc4c
.Lbr104:    call0        sdk_wifi_station_stop                 #  dd9: 01f0ffc0
                                                               #  ddd: 0000
.Lbr105:    mov          a2, a12                               #  ddf: 2d0c
            call0        sdk_wifi_mode_set                     #  de1: 01efffc0
                                                               #  de5: 0000
            beqi         a12, 1, .Lbr106                       #  de7: 261c02
            bnei         a12, 3, .Lbr107                       #  dea: 663c05
.Lbr106:    call0        sdk_wifi_station_start                #  ded: 01edffc0
                                                               #  df1: 0000
.Lbr107:    beqi         a12, 2, .Lbr108                       #  df3: 262c02
            bnei         a12, 3, .Lbr109                       #  df6: 663c05
.Lbr108:    call0        sdk_wifi_softap_start                 #  df9: 01ebffc0
                                                               #  dfd: 0000
.Lbr109:    beqz         a12, .Lbr111                          #  dff: 9cbc
            movi         a0, sdk_g_ic                          #  e01: 01e4ff
            beqi         a12, 1, .Lbr110                       #  e04: 261c0c
            l32i         a2, a0, 20 /* [sdk_g_ic+0x14] */      #  e07: 2850
            l32i         a2, a2, 0 /* [[sdk_g_ic+0x14]] */     #  e09: 2802
            call0        netif_set_default                     #  e0b: 01e8ffc0
                                                               #  e0f: 0000
            j            .Lbr111                               #  e11: 460200
.Lbr110:    l32i         a2, a0, 16 /* [sdk_g_ic+0x10] */      #  e14: 2840
            l32i         a2, a2, 0 /* [[sdk_g_ic+0x10]] */     #  e16: 2802
            call0        netif_set_default                     #  e18: 01e6ffc0
                                                               #  e1c: 0000
.Lbr111:    l32i         a12, sp, 4 /* [(local1)] */           #  e1e: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  e20: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  e22: 12c110
            ret                                                #  e25: 0df0

            .literal_position                                  #  e28: 00000000
                                                               #  e2c: 00000000
                                                               #  e30: 00000000
                                                               #  e34: 00000000

# Function @ .irom0.text+0xe38
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_wifi_set_opmode_local
            .type        sdk_wifi_set_opmode_local, @function
sdk_wifi_set_opmode_local:
            addi         sp, sp, -16 /* (local0) */            #  e38: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  e3b: 0911
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  e3d: c921
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    #  e3f: 3901
            mov          a12, a2 /* arg0 */                    #  e41: cd02
            bltui        a2, 4, .Lbr116                        #  e43: b64238
            movi         a2, 0 /* 0x00000000 */                #  e46: 0c02
            j            .Lbr115                               #  e48: 860a00
.Lbr112:    movi         a0, sdk_g_ic+0x160                    #  e4b: 01f7ff
            movi         a3, sdk_user_init_flag                #  e4e: 31f7ff
            l8ui         a2, a0, 128 /* [sdk_g_ic+0x1e0] */    #  e51: 220080
            l8ui         a3, a3, 0 /* [sdk_user_init_flag] */  #  e54: 320300
            beq          a2, a12, .Lbr114                      #  e57: c71219
            s32i         a0, sp, 12 /* sdk_g_ic+0x160 -> [(local3)] */ #  e5a: 0931
            bnei         a3, 1, .Lbr113                        #  e5c: 661306
            mov          a2, a12 /* arg0 */                    #  e5f: 2d0c
            call0        .Lfunc007                             #  e61: 05f5ff
            l32i         a0, sp, 12 /* [(local3)] */           #  e64: 0831
.Lbr113:    l32i         a4, sp, 0 /* [(local0)] */            #  e66: 4801
            s8i          a12, a0, 128                          #  e68: c24080
            bnei         a4, 1, .Lbr114                        #  e6b: 661405
            movi         a2, sdk_g_ic+0x1d8                    #  e6e: 21f0ff
            call0        sdk_wifi_param_save_protect           #  e71: 050000
.Lbr114:    movi         a2, 1 /* 0x00000001 */                #  e74: 0c12
.Lbr115:    l32i         a12, sp, 8 /* [(local2)] */           #  e76: c821
            l32i         a0, sp, 4 /* [(local1)] */            #  e78: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  e7a: 12c110
            ret                                                #  e7d: 0df0
.Lbr116:    movi         a2, 5 /* 0x00000005 */                #  e7f: 0c52
            call0        .Lfunc001                             #  e81: 451cff
            bnei         a2, -1, .Lbr112                       #  e84: 6602c3
            movi         a5, .Ldata001                         #  e87: 51ebff
            s8i          a12, a5, 138 /* arg0 -> [.Ldata007] */ #  e8a: c2458a
            j            .Lbr114                               #  e8d: c6f8ff

# Function @ .irom0.text+0xe90
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_set_opmode
            .type        sdk_wifi_set_opmode, @function
sdk_wifi_set_opmode:
            movi         a3, 1 /* 0x00000001 */                #  e90: 0c13
            addi         sp, sp, -16 /* (local0) */            #  e92: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  e95: 0901
            call0        sdk_wifi_set_opmode_local             #  e97: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #  e9a: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  e9c: 12c110
            ret                                                #  e9f: 0df0

            .balign      4
# Function @ .irom0.text+0xea4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_set_opmode_current
            .type        sdk_wifi_set_opmode_current, @function
sdk_wifi_set_opmode_current:
            movi         a3, 0 /* 0x00000000 */                #  ea4: 0c03
            addi         sp, sp, -16 /* (local0) */            #  ea6: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  ea9: 0901
            call0        sdk_wifi_set_opmode_local             #  eab: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #  eae: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  eb0: 12c110
            ret                                                #  eb3: 0df0

            .balign      4
# Function @ .irom0.text+0xeb8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_system_get_checksum
            .type        sdk_system_get_checksum, @function
sdk_system_get_checksum:
            addi         sp, sp, -16 /* (local0) */            #  eb8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  ebb: 0901
            beqz         a3, .Lbr118                           #  ebd: 9c93
            movi         a0, 239 /* 0x000000ef */              #  ebf: 02a0ef
            movi         a6, 0 /* 0x00000000 */                #  ec2: 0c06
.Lbr117:    addi         a5, a6, 1                             #  ec4: 1b56
            add          a4, a2, a6                            #  ec6: 6a42
            l8ui         a4, a4, 0                             #  ec8: 420400
            extui        a6, a5, 0, 16                         #  ecb: 5060f4
            xor          a0, a4, a0                            #  ece: 000430
            extui        a0, a0, 0, 8                          #  ed1: 000074
            bne          a3, a6, .Lbr117                       #  ed4: 6793ec
            j            .Lbr119                               #  ed7: 860000
.Lbr118:    movi         a0, 239 /* 0x000000ef */              #  eda: 02a0ef
.Lbr119:    mov          a2, a0                                #  edd: 2d00
            l32i         a0, sp, 0 /* [(local0)] */            #  edf: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  ee1: 12c110
            ret                                                #  ee4: 0df0

            .literal_position                                  #  ee8: 50010000
                                                               #  eec: 00000000
                                                               #  ef0: 00000000
                                                               #  ef4: 00000000
                                                               #  ef8: 00000000
                                                               #  efc: 00000000
                                                               #  f00: 00000000
                                                               #  f04: 00000000

# Function @ .irom0.text+0xf08
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
.Lfunc008:  addi         sp, sp, -32 /* (local0) */            #  f08: 12c1e0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  f0b: d921
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #  f0d: f941
            s32i         a4, sp, 24 /* arg2 -> [(local6)] */   #  f0f: 4961
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  f11: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  f13: c911
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  f15: e931
            s32i         a2, sp, 20 /* arg0 -> [(local5)] */   #  f17: 2951
            mov          a14, a3 /* arg1 */                    #  f19: ed03
            mov          a2, a5 /* arg3 */                     #  f1b: 2d05
            mov          a12, a5 /* arg3 */                    #  f1d: cd05
            call0        malloc                                #  f1f: 01f3ffc0
                                                               #  f23: 0000
            mov          a13, a2                               #  f25: dd02
            l32i         a0, sp, 20 /* [(local5)] */           #  f27: 0851
            l32i         a15, sp, 24 /* [(local6)] */          #  f29: f861
            mull         a14, a0, a14                          #  f2b: e0e082
            j            .Lbr121                               #  f2e: 060200
.Lbr120:    movi         a2, .Lstr015                          #  f31: 21edff
            call0        printf                                #  f34: 01efffc0
                                                               #  f38: 0000
.Lbr121:    l32i         a2, sp, 20 /* [(local5)] */           #  f3a: 2851
            call0        sdk_spi_flash_erase_sector            #  f3c: 01eeffc0
                                                               #  f40: 0000
            mov          a2, a14                               #  f42: 2d0e
            mov          a3, a15 /* [(local6)] */              #  f44: 3d0f
            mov          a4, a12 /* arg3 */                    #  f46: 4d0c
            call0        sdk_spi_flash_write                   #  f48: 01ecffc0
                                                               #  f4c: 0000
            mov          a2, a14                               #  f4e: 2d0e
            mov          a3, a13                               #  f50: 3d0d
            mov          a4, a12 /* arg3 */                    #  f52: 4d0c
            call0        sdk_spi_flash_read                    #  f54: 01eaffc0
                                                               #  f58: 0000
            mov          a2, a13                               #  f5a: 2d0d
            mov          a3, a15 /* [(local6)] */              #  f5c: 3d0f
            mov          a4, a12 /* arg3 */                    #  f5e: 4d0c
            call0        memcmp                                #  f60: 01e8ffc0
                                                               #  f64: 0000
            bnez         a2, .Lbr120                           #  f66: 5672fc
            mov          a2, a13                               #  f69: 2d0d
            call0        free                                  #  f6b: 01e6ffc0
                                                               #  f6f: 0000
            l32i         a12, sp, 4 /* [(local1)] */           #  f71: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  f73: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  f75: e831
            l32i         a15, sp, 16 /* [(local4)] */          #  f77: f841
            l32i         a0, sp, 0 /* [(local0)] */            #  f79: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  f7b: 12c120
            ret                                                #  f7e: 0df0

            .literal_position                                  #  f80: 00000000
                                                               #  f84: aa55aa55
                                                               #  f88: 00000000
                                                               #  f8c: 00000000

# Function @ .irom0.text+0xf90
# Local variables/stack:
#     (local0):  byte[4]   @ -0x30
#     (local1):  word      @ -0x2c
#     (local2):  word[5]   @ -0x28
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word      @ -0x8
#     (local7):  word      @ -0x4
            .balign      4
            .global      sdk_wifi_param_save_protect
            .type        sdk_wifi_param_save_protect, @function
sdk_wifi_param_save_protect:
            addi         sp, sp, -48 /* (local0) */            #  f90: 12c1d0
            s32i         a13, sp, 44 /* a13 -> [(local7)] */   #  f93: d9b1
            s32i         a12, sp, 40 /* a12 -> [(local6)] */   #  f95: c9a1
            mov          a13, a2 /* arg0 */                    #  f97: dd02
            movi         a2, sdk_flashchip                     #  f99: 21f9ff
            s32i         a0, sp, 36 /* a0 -> [(local5)] */     #  f9c: 0991
            l32i         a12, a2, 12 /* [sdk_flashchip+0xc] */ #  f9e: c832
            l32i         a2, a2, 4 /* [sdk_flashchip+0x4] */   #  fa0: 2812
            mov          a3, a12 /* [sdk_flashchip+0xc] */     #  fa2: 3d0c
            call0        __udivsi3                             #  fa4: 01f9ffc0
                                                               #  fa8: 0000
            movi         a4, 28 /* 0x0000001c */               #  faa: 1cc4
            addi         a3, a2, -4                            #  fac: 32c2fc
            s32i         a3, sp, 28 /* a3 -> [(local3)] */     #  faf: 3971
            addi         a2, a2, -1                            #  fb1: 0b22
            s32i         a2, sp, 32 /* a2 -> [(local4)] */     #  fb3: 2981
            mov          a3, sp /* (local0) */                 #  fb5: 3d01
            mull         a2, a2, a12                           #  fb7: c02282
            call0        sdk_spi_flash_read                    #  fba: 01f4ffc0
                                                               #  fbe: 0000
            l8ui         a5, sp, 0 /* [(local0)] */            #  fc0: 520100
            movi         a4, 1 /* 0x00000001 */                #  fc3: 0c14
            movi         a3, 0 /* 0x00000000 */                #  fc5: 0c03
            l32i         a2, sp, 28 /* [(local3)] */           #  fc7: 2871
            moveqz       a3, a4, a5                            #  fc9: 503483
            mov          a4, a13 /* arg0 */                    #  fcc: 4d0d
            movi         a5, 880 /* 0x00000370 */              #  fce: 52a370
            s8i          a3, sp, 0 /* a3 -> [(local0)] */      #  fd1: 324100
            add          a2, a2, a3                            #  fd4: 3a22
            addi         a2, a2, 1                             #  fd6: 1b22
            mov          a3, a12 /* [sdk_flashchip+0xc] */     #  fd8: 3d0c
            call0        .Lfunc008                             #  fda: c5f2ff
            movi         a4, 28 /* 0x0000001c */               #  fdd: 1cc4
            movi         a6, 1 /* 0x00000001 */                #  fdf: 0c16
            l32i         a7, sp, 8 /* [(local2)] */            #  fe1: 7821
            l8ui         a5, sp, 0 /* [(local0)] */            #  fe3: 520100
            movi         a8, 0x55aa55aa                        #  fe6: 81e7ff
            s32i         a8, sp, 4 /* 0x55aa55aa -> [(local1)] */ #  fe9: 8911
            addx4        a5, a5, sp                            #  feb: 1055a0
            addi         a7, a7, 1 /* [(local2)]+0x1 */        #  fee: 1b77
            movnez       a6, a7, a7                            #  ff0: 706793
            s32i         a6, sp, 8 /* a6 -> [(local2)] */      #  ff3: 6921
            s32i         a4, a5, 12                            #  ff5: 4935
            l8ui         a3, sp, 0 /* [(local0)] */            #  ff7: 320100
            mov          a2, a13 /* arg0 */                    #  ffa: 2d0d
            addx4        a3, a3, sp                            #  ffc: 1033a0
            l16ui        a3, a3, 12                            #  fff: 321306
            call0        sdk_system_get_checksum               # 1002: 050000
            mov          a3, a12 /* [sdk_flashchip+0xc] */     # 1005: 3d0c
            mov          a4, sp /* (local0) */                 # 1007: 4d01
            l8ui         a9, sp, 0 /* [(local0)] */            # 1009: 920100
            movi         a5, 28 /* 0x0000001c */               # 100c: 1cc5
            addx4        a9, a9, sp                            # 100e: 1099a0
            s32i         a2, a9, 20                            # 1011: 2959
            l32i         a2, sp, 32 /* [(local4)] */           # 1013: 2881
            call0        .Lfunc008                             # 1015: 05efff
            l32i         a12, sp, 40 /* [(local6)] */          # 1018: c8a1
            l32i         a13, sp, 44 /* [(local7)] */          # 101a: d8b1
            l32i         a0, sp, 36 /* [(local5)] */           # 101c: 0891
            addi         sp, sp, 48 /* (top of frame) */       # 101e: 12c130
            ret                                                # 1021: 0df0

            .literal_position                                  # 1024: 00000000
                                                               # 1028: 00000000
                                                               # 102c: 00000000
                                                               # 1030: 00000000
                                                               # 1034: 00000000

# Function @ .irom0.text+0x1038
# Local variables/stack:
#     (local0):  byte[28]  @ -0x30
#     (local1):  word      @ -0x14
#     (local2):  word      @ -0x10
#     (local3):  word      @ -0xc
#     (local4):  word[2]   @ -0x8
            .balign      4
.Lfunc009:  movi         a2, sdk_flashchip                     # 1038: 21fbff
            addi         sp, sp, -48 /* (local0) */            # 103b: 12c1d0
            s32i         a12, sp, 32 /* a12 -> [(local2)] */   # 103e: c981
            s32i         a13, sp, 36 /* a13 -> [(local3)] */   # 1040: d991
            s32i         a14, sp, 40 /* a14 -> [(local4)] */   # 1042: e9a1
            s32i         a0, sp, 28 /* a0 -> [(local1)] */     # 1044: 0971
            l32i         a14, a2, 12 /* [sdk_flashchip+0xc] */ # 1046: e832
            l32i         a2, a2, 4 /* [sdk_flashchip+0x4] */   # 1048: 2812
            mov          a3, a14 /* [sdk_flashchip+0xc] */     # 104a: 3d0e
            call0        __udivsi3                             # 104c: 01f7ffc0
                                                               # 1050: 0000
            addi         a13, a2, -4                           # 1052: d2c2fc
            movi         a2, 880 /* 0x00000370 */              # 1055: 22a370
            call0        malloc                                # 1058: 01f5ffc0
                                                               # 105c: 0000
            mov          a3, sp /* (local0) */                 # 105e: 3d01
            mov          a12, a2                               # 1060: cd02
            movi         a4, 28 /* 0x0000001c */               # 1062: 1cc4
            addi         a2, a13, 3                            # 1064: 3b2d
            mull         a2, a14, a2                           # 1066: 202e82
            call0        sdk_spi_flash_read                    # 1069: 01f1ffc0
                                                               # 106d: 0000
            movi         a4, 880 /* 0x00000370 */              # 106f: 42a370
            l8ui         a2, sp, 0 /* [(local0)] */            # 1072: 220100
            movi         a3, 1 /* 0x00000001 */                # 1075: 0c13
            movnez       a2, a3, a2                            # 1077: 202393
            s8i          a2, sp, 0 /* a2 -> [(local0)] */      # 107a: 224100
            mov          a3, a12                               # 107d: 3d0c
            add          a2, a13, a2                           # 107f: 2a2d
            addi         a2, a2, 1                             # 1081: 1b22
            mull         a2, a14, a2                           # 1083: 202e82
            call0        sdk_spi_flash_read                    # 1086: 01ebffc0
                                                               # 108a: 0000
            l32i         a0, sp, 28 /* [(local1)] */           # 108c: 0871
            l32i         a13, sp, 36 /* [(local3)] */          # 108e: d891
            mov          a2, a12                               # 1090: 2d0c
            l32i         a14, sp, 40 /* [(local4)] */          # 1092: e8a1
            l32i         a12, sp, 32 /* [(local2)] */          # 1094: c881
            addi         sp, sp, 48 /* (top of frame) */       # 1096: 12c130
            ret                                                # 1099: 0df0

            .literal_position                                  # 109c: 00000000
                                                               # 10a0: 00000000
                                                               # 10a4: 00000000
                                                               # 10a8: 00000000
                                                               # 10ac: 00000000
                                                               # 10b0: 00000000
                                                               # 10b4: 00000000

# Function @ .irom0.text+0x10b8
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
.Lfunc010:  addi         sp, sp, -32 /* (local0) */            # 10b8: 12c1e0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 10bb: c911
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   # 10bd: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 10bf: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 10c1: d921
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   # 10c3: e931
            mov          a13, a2 /* arg0 */                    # 10c5: dd02
            mov          a14, a3 /* arg1 */                    # 10c7: ed03
            bnez         a2, .Lbr122                           # 10c9: cc32
            movi         a2, 0 /* 0x00000000 */                # 10cb: 0c02
            j            .Lbr128                               # 10cd: 461c00
.Lbr122:    bnei         a3, 1, .Lbr123                        # 10d0: 661305
            movi         a12, sdk_g_ic+0x1d8                   # 10d3: c1f2ff
            j            .Lbr124                               # 10d6: 060100
.Lbr123:    call0        .Lfunc009                             # 10d9: c5f5ff
            mov          a12, a2                               # 10dc: cd02
.Lbr124:    l32i         a0, a12, 12                           # 10de: 083c
            addi         a15, a12, 55                          # 10e0: f2cc37
            bnei         a0, -1, .Lbr125                       # 10e3: 660013
            addi         a2, a12, 12                           # 10e6: cb2c
            movi         a3, 36 /* 0x00000024 */               # 10e8: 2c43
            call0        bzero                                 # 10ea: 01edffc0
                                                               # 10ee: 0000
            mov          a2, a15                               # 10f0: 2d0f
            movi         a3, 64 /* 0x00000040 */               # 10f2: 4c03
            call0        bzero                                 # 10f4: 01ecffc0
                                                               # 10f8: 0000
.Lbr125:    l8ui         a2, a12, 169                          # 10fa: 220ca9
            movi         a3, 0 /* 0x00000000 */                # 10fd: 0c03
            bltui        a2, 2, .Lbr126                        # 10ff: b62202
            s8i          a3, a12, 169                          # 1102: 324ca9
.Lbr126:    mov          a2, a13 /* arg0 */                    # 1105: 2d0d
            addi         a3, a12, 16                           # 1107: 32cc10
            movi         a4, 32 /* 0x00000020 */               # 110a: 2c04
            call0        memcpy                                # 110c: 01e7ffc0
                                                               # 1110: 0000
            mov          a3, a15                               # 1112: 3d0f
            addi         a2, a13, 32 /* arg0+0x20 */           # 1114: 22cd20
            movi         a4, 64 /* 0x00000040 */               # 1117: 4c04
            call0        memcpy                                # 1119: 01e4ffc0
                                                               # 111d: 0000
            addi         a2, a13, 97 /* arg0+0x61 */           # 111f: 22cd61
            movi         a3, 170 /* 0x000000aa */              # 1122: 32a0aa
            l8ui         a4, a12, 169                          # 1125: 420ca9
            s8i          a4, a13, 96 /* a4 -> [arg0+0x60] */   # 1128: 424d60
            add          a3, a12, a3                           # 112b: 3a3c
            movi         a4, 6 /* 0x00000006 */                # 112d: 0c64
            call0        memcpy                                # 112f: 01e0ffc0
                                                               # 1133: 0000
            beqi         a14, 1, .Lbr127                       # 1135: 261e07
            mov          a2, a12                               # 1138: 2d0c
            call0        free                                  # 113a: 01deffc0
                                                               # 113e: 0000
.Lbr127:    movi         a2, 1 /* 0x00000001 */                # 1140: 0c12
.Lbr128:    l32i         a12, sp, 4 /* [(local1)] */           # 1142: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 1144: d821
            l32i         a14, sp, 12 /* [(local3)] */          # 1146: e831
            l32i         a15, sp, 16 /* [(local4)] */          # 1148: f841
            l32i         a0, sp, 0 /* [(local0)] */            # 114a: 0801
            addi         sp, sp, 32 /* (top of frame) */       # 114c: 12c120
            ret                                                # 114f: 0df0

            .balign      4
# Function @ .irom0.text+0x1154
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_station_get_config
            .type        sdk_wifi_station_get_config, @function
sdk_wifi_station_get_config:
            movi         a3, 1 /* 0x00000001 */                # 1154: 0c13
            addi         sp, sp, -16 /* (local0) */            # 1156: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1159: 0901
            call0        .Lfunc010                             # 115b: c5f5ff
            l32i         a0, sp, 0 /* [(local0)] */            # 115e: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1160: 12c110
            ret                                                # 1163: 0df0

            .balign      4
# Function @ .irom0.text+0x1168
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_station_get_config_default
            .type        sdk_wifi_station_get_config_default, @function
sdk_wifi_station_get_config_default:
            movi         a3, 0 /* 0x00000000 */                # 1168: 0c03
            addi         sp, sp, -16 /* (local0) */            # 116a: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 116d: 0901
            call0        .Lfunc010                             # 116f: 85f4ff
            l32i         a0, sp, 0 /* [(local0)] */            # 1172: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1174: 12c110
            ret                                                # 1177: 0df0

            .literal_position                                  # 117c: 00000000
                                                               # 1180: 00000000
                                                               # 1184: 00000000
                                                               # 1188: 00000000
                                                               # 118c: 00000000
                                                               # 1190: 00000000
                                                               # 1194: 00000000
                                                               # 1198: 00000000

# Function @ .irom0.text+0x119c
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
            .global      sdk_wifi_station_get_ap_info
            .type        sdk_wifi_station_get_ap_info, @function
sdk_wifi_station_get_ap_info:
            movi         a8, sdk_g_ic+0x280                    # 119c: 81f8ff
            addi         sp, sp, -32 /* (local0) */            # 119f: 12c1e0
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   # 11a2: d931
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   # 11a4: f951
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   # 11a6: e941
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 11a8: c921
            s32i         a8, sp, 24 /* sdk_g_ic+0x280 -> [(local6)] */ # 11aa: 8961
            l8ui         a8, a8, 148 /* [sdk_g_ic+0x314] */    # 11ac: 820894
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 11af: 0911
            beqz         a8, .Lbr131                           # 11b1: 16a808
            movi         a0, 255 /* 0x000000ff */              # 11b4: 02a0ff
            movi         a12, 0 /* 0x00000000 */               # 11b7: 0c0c
            movi         a14, 0 /* 0x00000000 */               # 11b9: 0c0e
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    # 11bb: 2901
            l32i         a5, sp, 24 /* [(local6)] */           # 11bd: 5861
            movi         a7, 100 /* 0x00000064 */              # 11bf: 72a064
            addi         a5, a5, 28 /* [(local6)]+0x1c */      # 11c2: 52c51c
.Lbr129:    mul16u       a7, a12, a7                           # 11c5: 707cc1
            add          a9, a7, a5                            # 11c8: 5a97
            l8ui         a9, a9, 128                           # 11ca: 920980
            beq          a9, a0, .Lbr130                       # 11cd: 071960
            movi         a4, 32 /* 0x00000020 */               # 11d0: 2c04
            movi         a3, 796 /* 0x0000031c */              # 11d2: 32a31c
            movi         a15, sdk_g_ic                         # 11d5: f1eaff
            l32i         a0, sp, 0 /* [(local0)] */            # 11d8: 0801
            movi         a13, 103 /* 0x00000067 */             # 11da: d2a067
            mul16u       a13, a14, a13                         # 11dd: d0dec1
            add          a13, a13, a0                          # 11e0: 0add
            add          a15, a7, a15                          # 11e2: faf7
            add          a3, a15, a3                           # 11e4: 3a3f
            mov          a2, a13                               # 11e6: 2d0d
            call0        memcpy                                # 11e8: 01eaffc0
                                                               # 11ec: 0000
            addi         a2, a13, 32                           # 11ee: 22cd20
            movi         a4, 64 /* 0x00000040 */               # 11f1: 4c04
            movi         a3, 828 /* 0x0000033c */              # 11f3: 32a33c
            add          a3, a15, a3                           # 11f6: 3a3f
            call0        memcpy                                # 11f8: 01e7ffc0
                                                               # 11fc: 0000
            addi         a2, a13, 97                           # 11fe: 22cd61
            subx8        a15, a12, a12                         # 1201: c0fcf0
            movi         a3, sdk_g_ic                          # 1204: 31e0ff
            movi         a4, 1313 /* 0x00000521 */             # 1207: 42a521
            add          a3, a3, a4 /* sdk_g_ic+0x521 */       # 120a: 4a33
            add          a3, a15, a3                           # 120c: 3a3f
            movi         a4, 6 /* 0x00000006 */                # 120e: 0c64
            call0        memcpy                                # 1210: 01e2ffc0
                                                               # 1214: 0000
            movi         a0, 255 /* 0x000000ff */              # 1216: 02a0ff
            movi         a5, sdk_g_ic+0x29c                    # 1219: 51dbff
            l32i         a8, sp, 24 /* [(local6)] */           # 121c: 8861
            addi         a14, a14, 1                           # 121e: 1bee
            movi         a6, sdk_g_ic+0x4a0                    # 1220: 61dbff
            extui        a14, a14, 0, 8                        # 1223: e0e074
            add          a2, a15, a6                           # 1226: 6a2f
            l8ui         a2, a2, 128                           # 1228: 220280
            s8i          a2, a13, 96                           # 122b: 224d60
            l8ui         a8, a8, 148 /* [[(local6)]+0x94] */   # 122e: 820894
.Lbr130:    movi         a7, 100 /* 0x00000064 */              # 1231: 72a064
            addi         a12, a12, 1                           # 1234: 1bcc
            extui        a12, a12, 0, 8                        # 1236: c0c074
            bltu         a12, a8, .Lbr129                      # 1239: 873c88
            j            .Lbr132                               # 123c: 460000
.Lbr131:    movi         a14, 0 /* 0x00000000 */               # 123f: 0c0e
.Lbr132:    l32i         a0, sp, 4 /* [(local1)] */            # 1241: 0811
            l32i         a12, sp, 8 /* [(local2)] */           # 1243: c821
            l32i         a13, sp, 12 /* [(local3)] */          # 1245: d831
            mov          a2, a14                               # 1247: 2d0e
            l32i         a15, sp, 20 /* [(local5)] */          # 1249: f851
            l32i         a14, sp, 16 /* [(local4)] */          # 124b: e841
            addi         sp, sp, 32 /* (top of frame) */       # 124d: 12c120
            ret                                                # 1250: 0df0

            .literal_position                                  # 1254: 00000000
                                                               # 1258: 00000000

# Function @ .irom0.text+0x125c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wifi_station_ap_number_set
            .type        sdk_wifi_station_ap_number_set, @function
sdk_wifi_station_ap_number_set:
            addi         sp, sp, -16 /* (local0) */            # 125c: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 125f: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1261: 0901
            mov          a12, a2 /* arg0 */                    # 1263: cd02
            bgeui        a2, 6, .Lbr135                        # 1265: f66224
            beqz         a2, .Lbr135                           # 1268: ac12
            call0        sdk_wifi_get_opmode                   # 126a: 050000
            beqi         a2, 2, .Lbr135                        # 126d: 26221c
            movi         a0, sdk_g_ic+0x294                    # 1270: 01f9ff
            l8ui         a2, a0, 128 /* [sdk_g_ic+0x314] */    # 1273: 220080
            beq          a2, a12, .Lbr133                      # 1276: c71208
            movi         a2, sdk_g_ic+0x1d8                    # 1279: 21f7ff
            s8i          a12, a0, 128 /* arg0 -> [sdk_g_ic+0x314] */ # 127c: c24080
            call0        sdk_wifi_param_save_protect           # 127f: 050000
.Lbr133:    movi         a2, 1 /* 0x00000001 */                # 1282: 0c12
.Lbr134:    l32i         a12, sp, 4 /* [(local1)] */           # 1284: c811
            l32i         a0, sp, 0 /* [(local0)] */            # 1286: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1288: 12c110
            ret                                                # 128b: 0df0
.Lbr135:    movi         a2, 0 /* 0x00000000 */                # 128d: 0c02
            j            .Lbr134                               # 128f: 46fcff

            .literal_position                                  # 1294: 00000000
                                                               # 1298: 00000000
                                                               # 129c: 00000000
                                                               # 12a0: 00000000
                                                               # 12a4: 00000000
                                                               # 12a8: 00000100
                                                               # 12ac: 000e0060
                                                               # 12b0: 00000000
                                                               # 12b4: 00000000
                                                               # 12b8: 00000000
                                                               # 12bc: 00000000
                                                               # 12c0: 00000000
                                                               # 12c4: 00000000
                                                               # 12c8: 00000000
                                                               # 12cc: 00000000
                                                               # 12d0: 00000000
                                                               # 12d4: 00000000
                                                               # 12d8: 00000000

# Function @ .irom0.text+0x12dc
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
.Lfunc011:  addi         sp, sp, -32 /* (local0) */            # 12dc: 12c1e0
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   # 12df: d941
            s32i         a4, sp, 0 /* arg2 -> [(local0)] */    # 12e1: 4901
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      # 12e3: 0921
            s32i         a14, sp, 20 /* a14 -> [(local5)] */   # 12e5: e951
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   # 12e7: c931
            s32i         a15, sp, 24 /* a15 -> [(local6)] */   # 12e9: f961
            mov          a12, a2 /* arg0 */                    # 12eb: cd02
            movi         a15, sdk_g_ic+0x295                   # 12ed: f1e9ff
            mov          a14, a3 /* arg1 */                    # 12f0: ed03
            s8i          a3, a15, 128 /* arg1 -> [sdk_g_ic+0x315] */ # 12f2: 324f80
            call0        strlen                                # 12f5: 01f2ffc0
                                                               # 12f9: 0000
            movi         a0, 32 /* 0x00000020 */               # 12fb: 2c00
            movi         a3, sdk_g_ic                          # 12fd: 31e6ff
            movi         a13, 100 /* 0x00000064 */             # 1300: d2a064
            mul16s       a13, a13, a14                         # 1303: e0ddd1
            add          a13, a3, a13                          # 1306: dad3
            bltu         a0, a2, .Lbr136                       # 1308: 273001
            mov          a0, a2                                # 130b: 0d02
.Lbr136:    mov          a3, a12 /* arg0 */                    # 130d: 3d0c
            movi         a4, 32 /* 0x00000020 */               # 130f: 2c04
            s32i         a0, a13, 0x318                        # 1311: 026dc6
            movi         a2, 796 /* 0x0000031c */              # 1314: 22a31c
            add          a2, a13, a2                           # 1317: 2a2d
            call0        memcpy                                # 1319: 01eaffc0
                                                               # 131d: 0000
            movi         a4, 64 /* 0x00000040 */               # 131f: 4c04
            addi         a3, a12, 32 /* arg0+0x20 */           # 1321: 32cc20
            movi         a2, 828 /* 0x0000033c */              # 1324: 22a33c
            add          a2, a13, a2                           # 1327: 2a2d
            s32i         a3, sp, 4 /* arg0+0x20 -> [(local1)] */ # 1329: 3911
            call0        memcpy                                # 132b: 01e7ffc0
                                                               # 132f: 0000
            movi         a2, sdk_g_ic+0x1e8                    # 1331: 21dbff
            l32i         a3, a13, 0x318                        # 1334: 322dc6
            movi         a4, sdk_g_ic+0xc0                     # 1337: 41d9ff
            s32i         a4, sp, 28 /* sdk_g_ic+0xc0 -> [(local7)] */ # 133a: 4971
            s32i         a3, a4, 0x124 /* a3 -> [sdk_g_ic+0x1e4] */ # 133c: 326449
            mov          a3, a12 /* arg0 */                    # 133f: 3d0c
            movi         a4, 32 /* 0x00000020 */               # 1341: 2c04
            call0        memcpy                                # 1343: 01e2ffc0
                                                               # 1347: 0000
            l32i         a3, sp, 4 /* [(local1)] */            # 1349: 3811
            movi         a2, sdk_g_ic+0x20f                    # 134b: 21d6ff
            movi         a4, 64 /* 0x00000040 */               # 134e: 4c04
            l32i         a13, sp, 28 /* [(local7)] */          # 1350: d871
            call0        memcpy                                # 1352: 01dfffc0
                                                               # 1356: 0000
            addmi        a6, a15, -256 /* sdk_g_ic+0x195 */    # 1358: 62dfff
            movi         a3, 0 /* 0x00000000 */                # 135b: 0c03
            addmi        a7, a13, 256 /* [(local7)]+0x100 */   # 135d: 72dd01
            movi         a2, 1 /* 0x00000001 */                # 1360: 0c12
            s8i          a2, a7, 78 /* 0x01 -> [[(local7)]+0x14e] */ # 1362: 22474e
            s8i          a3, a6, 186 /* 0x00 -> [sdk_g_ic+0x24f] */ # 1365: 3246ba
            movi         a4, 0x00010000                        # 1368: 41d0ff
            movi         a5, 0x60000e00                        # 136b: 51d0ff
            memw                                               # 136e: c02000
            movi         a0, sdk_g_ic+0x4a0                    # 1371: 01cfff
            subx8        a13, a14, a14                         # 1374: e0def0
            s32i         a4, a5, 0x3f4 /* 0x00010000 -> [0x600011f4] */ # 1377: 4265fd
            l8ui         a5, a12, 96 /* [arg0+0x60] */         # 137a: 520c60
            add          a0, a13, a0                           # 137d: 0a0d
            bnei         a5, 1, .Lbr137                        # 137f: 66152f
            movi         a4, 6 /* 0x00000006 */                # 1382: 0c64
            addi         a12, a12, 97 /* arg0+0x61 */          # 1384: c2cc61
            addmi        a8, a15, -256 /* sdk_g_ic+0x195 */    # 1387: 82dfff
            s8i          a2, a8, 236 /* 0x01 -> [sdk_g_ic+0x281] */ # 138a: 2248ec
            mov          a3, a12 /* arg0+0x61 */               # 138d: 3d0c
            s8i          a2, a0, 128                           # 138f: 224080
            movi         a2, sdk_g_ic+0x282                    # 1392: 21c8ff
            call0        memcpy                                # 1395: 01cfffc0
                                                               # 1399: 0000
            movi         a3, 1313 /* 0x00000521 */             # 139b: 32a521
            movi         a2, sdk_g_ic                          # 139e: 21c6ff
            movi         a4, 6 /* 0x00000006 */                # 13a1: 0c64
            add          a2, a2, a3 /* sdk_g_ic+0x521 */       # 13a3: 3a22
            mov          a3, a12 /* arg0+0x61 */               # 13a5: 3d0c
            add          a2, a13, a2                           # 13a7: 2a2d
            call0        memcpy                                # 13a9: 01cbffc0
                                                               # 13ad: 0000
            j            .Lbr138                               # 13af: 060200
.Lbr137:    addmi        a4, a15, -256 /* sdk_g_ic+0x195 */    # 13b2: 42dfff
            s8i          a3, a4, 236 /* 0x00 -> [sdk_g_ic+0x281] */ # 13b5: 3244ec
            s8i          a3, a0, 128                           # 13b8: 324080
.Lbr138:    l32i         a5, sp, 0 /* [(local0)] */            # 13bb: 5801
            bnei         a5, 1, .Lbr139                        # 13bd: 661505
            movi         a2, sdk_g_ic+0x1d8                    # 13c0: 21bfff
            call0        sdk_wifi_param_save_protect           # 13c3: 050000
.Lbr139:    l32i         a12, sp, 12 /* [(local3)] */          # 13c6: c831
            l32i         a13, sp, 16 /* [(local4)] */          # 13c8: d841
            l32i         a14, sp, 20 /* [(local5)] */          # 13ca: e851
            l32i         a15, sp, 24 /* [(local6)] */          # 13cc: f861
            l32i         a0, sp, 8 /* [(local2)] */            # 13ce: 0821
            addi         sp, sp, 32 /* (top of frame) */       # 13d0: 12c120
            ret                                                # 13d3: 0df0

            .literal_position                                  # 13d8: 30010000
                                                               # 13dc: 23000000
                                                               # 13e0: 00000000
                                                               # 13e4: 00000000
                                                               # 13e8: 00000000
                                                               # 13ec: 00000000
                                                               # 13f0: 00000000
                                                               # 13f4: 00000000
                                                               # 13f8: 00000000
                                                               # 13fc: 00000000

# Function @ .irom0.text+0x1400
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
.Lfunc012:  addi         sp, sp, -48 /* (local0) */            # 1400: 12c1d0
            s32i         a13, sp, 24 /* a13 -> [(local6)] */   # 1403: d961
            s32i         a15, sp, 32 /* a15 -> [(local8)] */   # 1405: f981
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     # 1407: 0941
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   # 1409: c951
            s32i         a14, sp, 28 /* a14 -> [(local7)] */   # 140b: e971
            mov          a12, a3 /* arg1 */                    # 140d: cd03
            mov          a14, a2 /* arg0 */                    # 140f: ed02
            beqz         a2, .Lbr140                           # 1411: 8c42
            call0        sdk_wifi_get_opmode                   # 1413: 050000
            bnei         a2, 2, .Lbr145                        # 1416: 662234
.Lbr140:    movi         a2, 0 /* 0x00000000 */                # 1419: 0c02
            j            .Lbr144                               # 141b: 060800
.Lbr141:    movi         a15, .Ldata011                        # 141e: f1eeff
            l8ui         a3, a15, 0 /* [.Ldata011] */          # 1421: 320f00
            l32i         a12, sp, 8 /* [(local2)] */           # 1424: c821
            bne          a13, a3, .Lbr142                      # 1426: 379d04
            movi         a3, 0 /* 0x00000000 */                # 1429: 0c03
            s8i          a3, a15, 0 /* 0x00 -> [.Ldata011] */  # 142b: 324f00
.Lbr142:    mov          a4, a12 /* [(local2)] */              # 142e: 4d0c
            mov          a2, a14 /* arg0 */                    # 1430: 2d0e
            call0        .Lfunc011                             # 1432: 85eaff
            l8ui         a0, a15, 0 /* [.Ldata011] */          # 1435: 020f00
            addi         a0, a0, 1 /* [.Ldata011]+0x1 */       # 1438: 1b00
            s8i          a0, a15, 0 /* [.Ldata011]+0x1 -> [.Ldata011] */ # 143a: 024f00
.Lbr143:    movi         a2, 1 /* 0x00000001 */                # 143d: 0c12
.Lbr144:    l32i         a12, sp, 20 /* [(local5)] */          # 143f: c851
            l32i         a13, sp, 24 /* [(local6)] */          # 1441: d861
            l32i         a14, sp, 28 /* [(local7)] */          # 1443: e871
            l32i         a15, sp, 32 /* [(local8)] */          # 1445: f881
            l32i         a0, sp, 16 /* [(local4)] */           # 1447: 0841
            addi         sp, sp, 48 /* (top of frame) */       # 1449: 12c130
            ret                                                # 144c: 0df0
.Lbr145:    movi         a2, 3 /* 0x00000003 */                # 144e: 0c32
            call0        .Lfunc001                             # 1450: 45bffe
            bnei         a2, -1, .Lbr146                       # 1453: 660210
            mov          a3, a14 /* arg0 */                    # 1456: 3d0e
            movi         a2, .Ldata006                         # 1458: 21e1ff
            movi         a4, 103 /* 0x00000067 */              # 145b: 42a067
            call0        memcpy                                # 145e: 01e4ffc0
                                                               # 1462: 0000
            j            .Lbr143                               # 1464: 46f5ff
.Lbr146:    movi         a0, sdk_g_ic+0x294                    # 1467: 01deff
            l8ui         a13, a0, 128 /* [sdk_g_ic+0x314] */   # 146a: d20080
            s32i         a12, sp, 8 /* arg1 -> [(local2)] */   # 146d: c921
            beqz         a13, .Lbr141                          # 146f: 16bdfa
            movi         a12, 0 /* 0x00000000 */               # 1472: 0c0c
            s32i         a0, sp, 0 /* sdk_g_ic+0x294 -> [(local0)] */ # 1474: 0901
            addi         a6, a14, 97 /* arg0+0x61 */           # 1476: 62ce61
            addi         a7, a14, 32 /* arg0+0x20 */           # 1479: 72ce20
            s32i         a7, sp, 12 /* arg0+0x20 -> [(local3)] */ # 147c: 7931
            s32i         a6, sp, 4 /* arg0+0x61 -> [(local1)] */ # 147e: 6911
.Lbr147:    mov          a3, a14 /* arg0 */                    # 1480: 3d0e
            movi         a4, 32 /* 0x00000020 */               # 1482: 2c04
            movi         a2, 796 /* 0x0000031c */              # 1484: 22a31c
            movi         a15, sdk_g_ic                         # 1487: f1d7ff
            movi         a0, 100 /* 0x00000064 */              # 148a: 02a064
            mul16u       a0, a12, a0                           # 148d: 000cc1
            add          a15, a15, a0                          # 1490: 0aff
            add          a2, a15, a2                           # 1492: 2a2f
            call0        memcmp                                # 1494: 01d8ffc0
                                                               # 1498: 0000
            bnez         a2, .Lbr149                           # 149a: 569204
            l32i         a3, sp, 12 /* [(local3)] */           # 149d: 3831
            movi         a4, 64 /* 0x00000040 */               # 149f: 4c04
            movi         a2, 828 /* 0x0000033c */              # 14a1: 22a33c
            add          a2, a15, a2                           # 14a4: 2a2f
            call0        memcmp                                # 14a6: 01d4ffc0
                                                               # 14aa: 0000
            bnez         a2, .Lbr149                           # 14ac: fc72
            l8ui         a3, a14, 96 /* [arg0+0x60] */         # 14ae: 320e60
            movi         a0, 1 /* 0x00000001 */                # 14b1: 0c10
            bnei         a3, 1, .Lbr148                        # 14b3: 661320
            subx8        a3, a12, a12                          # 14b6: c03cf0
            movi         a2, sdk_g_ic                          # 14b9: 21cbff
            movi         a4, 6 /* 0x00000006 */                # 14bc: 0c64
            add          a2, a2, a3                            # 14be: 3a22
            movi         a3, 1313 /* 0x00000521 */             # 14c0: 32a521
            add          a2, a2, a3                            # 14c3: 3a22
            l32i         a3, sp, 4 /* [(local1)] */            # 14c5: 3811
            call0        memcmp                                # 14c7: 01cdffc0
                                                               # 14cb: 0000
            movi         a4, 1 /* 0x00000001 */                # 14cd: 0c14
            movi         a0, 0 /* 0x00000000 */                # 14cf: 0c00
            moveqz       a0, a4, a2                            # 14d1: 200483
            j            .Lbr148                               # 14d4: c6ffff
.Lbr148:    beqz         a0, .Lbr149                           # 14d7: 8cc0
            l32i         a5, sp, 0 /* [(local0)] */            # 14d9: 5801
            l8ui         a5, a5, 129 /* [[(local0)]+0x81] */   # 14db: 520581
            extui        a6, a12, 0, 8                         # 14de: c06074
            sub          a5, a5, a6                            # 14e1: 6055c0
            beqz         a5, .Lbr143                           # 14e4: 1655f5
.Lbr149:    addi         a12, a12, 1                           # 14e7: 1bcc
            extui        a12, a12, 0, 8                        # 14e9: c0c074
            bne          a13, a12, .Lbr147                     # 14ec: c79d90
            beqz         a13, .Lbr141                          # 14ef: 16bdf2
            movi         a0, 255 /* 0x000000ff */              # 14f2: 02a0ff
            movi         a2, sdk_g_ic+0x29c                    # 14f5: 21bdff
            movi         a12, 0 /* 0x00000000 */               # 14f8: 0c0c
.Lbr150:    movi         a15, 100 /* 0x00000064 */             # 14fa: f2a064
            mul16u       a15, a12, a15                         # 14fd: f0fcc1
            add          a15, a2, a15                          # 1500: faf2
            l8ui         a15, a15, 128                         # 1502: f20f80
            bne          a15, a0, .Lbr151                      # 1505: 079f0b
            mov          a3, a12                               # 1508: 3d0c
            mov          a2, a14 /* arg0 */                    # 150a: 2d0e
            l32i         a4, sp, 8 /* [(local2)] */            # 150c: 4821
            call0        .Lfunc011                             # 150e: c5dcff
            j            .Lbr143                               # 1511: 06caff
.Lbr151:    addi         a12, a12, 1                           # 1514: 1bcc
            extui        a12, a12, 0, 8                        # 1516: c0c074
            bne          a13, a12, .Lbr150                     # 1519: c79ddd
            j            .Lbr141                               # 151c: 86bfff

            .balign      4
# Function @ .irom0.text+0x1520
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_station_set_config
            .type        sdk_wifi_station_set_config, @function
sdk_wifi_station_set_config:
            movi         a3, 1 /* 0x00000001 */                # 1520: 0c13
            addi         sp, sp, -16 /* (local0) */            # 1522: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1525: 0901
            call0        .Lfunc012                             # 1527: 85edff
            l32i         a0, sp, 0 /* [(local0)] */            # 152a: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 152c: 12c110
            ret                                                # 152f: 0df0

            .balign      4
# Function @ .irom0.text+0x1534
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_station_set_config_current
            .type        sdk_wifi_station_set_config_current, @function
sdk_wifi_station_set_config_current:
            movi         a3, 0 /* 0x00000000 */                # 1534: 0c03
            addi         sp, sp, -16 /* (local0) */            # 1536: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1539: 0901
            call0        .Lfunc012                             # 153b: 45ecff
            l32i         a0, sp, 0 /* [(local0)] */            # 153e: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1540: 12c110
            ret                                                # 1543: 0df0

            .literal_position                                  # 1548: 00000000

# Function @ .irom0.text+0x154c
            .balign      4
            .global      sdk_wifi_station_get_current_ap_id
            .type        sdk_wifi_station_get_current_ap_id, @function
sdk_wifi_station_get_current_ap_id:
            movi         a2, sdk_g_ic+0x295                    # 154c: 21ffff
            l8ui         a2, a2, 128 /* [sdk_g_ic+0x315] */    # 154f: 220280
            movi         a3, 255 /* 0x000000ff */              # 1552: 32a0ff
            beq          a2, a3, .Lbr152                       # 1555: 371201
            ret           /* [sdk_g_ic+0x315] */               # 1558: 0df0
.Lbr152:    movi         a2, 0 /* 0x00000000 */                # 155a: 0c02
            ret           /* 0x00000000 */                     # 155c: 0df0

            .literal_position                                  # 1560: 00000000

# Function @ .irom0.text+0x1564
            .balign      4
            .global      sdk_wifi_station_ap_check
            .type        sdk_wifi_station_ap_check, @function
sdk_wifi_station_ap_check:
            blti         a2, 1, .Lbr154                        # 1564: a61222
            movi         a8, 255 /* 0x000000ff */              # 1567: 82a0ff
            movi         a9, 200 /* 0x000000c8 */              # 156a: 92a0c8
            movi         a6, 0 /* 0x00000000 */                # 156d: 0c06
            movi         a5, sdk_g_ic+0x29c                    # 156f: 51fcff
            movi         a7, 100 /* 0x00000064 */              # 1572: 72a064
            mul16s       a7, a7, a2                            # 1575: 2077d1
            add          a7, a7, a5                            # 1578: 5a77
.Lbr153:    l8ui         a10, a5, 128                          # 157a: a20580
            addi         a6, a6, 2                             # 157d: 2b66
            bne          a10, a8, .Lbr157                      # 157f: 879a10
            add          a5, a5, a9                            # 1582: 9a55
            bltu         a5, a7, .Lbr153                       # 1584: 7735f2
            j            .Lbr155                               # 1587: 460000
.Lbr154:    movi         a6, 0 /* 0x00000000 */                # 158a: 0c06
.Lbr155:    bne          a6, a2, .Lbr156                       # 158c: 279601
            movi         a2, 0 /* 0x00000000 */                # 158f: 0c02
.Lbr156:    ret                                                # 1591: 0df0
.Lbr157:    movi         a2, 1 /* 0x00000001 */                # 1593: 0c12
            ret           /* 0x00000001 */                     # 1595: 0df0

            .literal_position                                  # 1598: 00000000
                                                               # 159c: 00000000
                                                               # 15a0: 64010000
                                                               # 15a4: 00000000
                                                               # 15a8: 00000000
                                                               # 15ac: 00000000
                                                               # 15b0: 00000000
                                                               # 15b4: 00000100
                                                               # 15b8: 000e0060
                                                               # 15bc: 00000000
                                                               # 15c0: 00000000
                                                               # 15c4: 00000000
                                                               # 15c8: 00000000
                                                               # 15cc: 00000000
                                                               # 15d0: 00000000
                                                               # 15d4: 00000000

# Function @ .irom0.text+0x15d8
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wifi_station_ap_change
            .type        sdk_wifi_station_ap_change, @function
sdk_wifi_station_ap_change:
            addi         sp, sp, -32 /* (local0) */            # 15d8: 12c1e0
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      # 15db: 0921
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   # 15dd: d941
            s32i         a14, sp, 20 /* a14 -> [(local5)] */   # 15df: e951
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   # 15e1: c931
            movi         a14, sdk_g_ic+0x294                   # 15e3: e1edff
            mov          a12, a2 /* arg0 */                    # 15e6: cd02
            l8ui         a13, a14, 128 /* [sdk_g_ic+0x314] */  # 15e8: d20e80
            call0        sdk_wifi_get_opmode                   # 15eb: 050000
            beqi         a2, 2, .Lbr159                        # 15ee: 262235
            bgeu         a12, a13, .Lbr159                     # 15f1: d7bc32
            mov          a2, a13 /* [sdk_g_ic+0x314] */        # 15f4: 2d0d
            call0        sdk_wifi_station_ap_check             # 15f6: 050000
            beqz         a2, .Lbr159                           # 15f9: aca2
            movi         a0, sdk_g_ic+0x29c                    # 15fb: 01e8ff
            movi         a13, 100 /* 0x00000064 */             # 15fe: d2a064
            mul16s       a13, a13, a12                         # 1601: c0ddd1
            s32i         a13, sp, 4 /* a13 -> [(local1)] */    # 1604: d911
            add          a13, a13, a0                          # 1606: 0add
            l8ui         a0, a13, 128                          # 1608: 020d80
            movi         a2, 255 /* 0x000000ff */              # 160b: 22a0ff
            beq          a0, a2, .Lbr159                       # 160e: 271015
            movi         a2, .Lstr016                          # 1611: 21e3ff
            mov          a3, a12 /* arg0 */                    # 1614: 3d0c
            call0        printf                                # 1616: 01ecffc0
                                                               # 161a: 0000
            l8ui         a0, a14, 129 /* [sdk_g_ic+0x315] */   # 161c: 020e81
            bne          a0, a12, .Lbr161                      # 161f: c79013
.Lbr158:    movi         a2, 1 /* 0x00000001 */                # 1622: 0c12
            j            .Lbr160                               # 1624: 460000
.Lbr159:    movi         a2, 0 /* 0x00000000 */                # 1627: 0c02
.Lbr160:    l32i         a12, sp, 12 /* [(local3)] */          # 1629: c831
            l32i         a13, sp, 16 /* [(local4)] */          # 162b: d841
            l32i         a14, sp, 20 /* [(local5)] */          # 162d: e851
            l32i         a0, sp, 8 /* [(local2)] */            # 162f: 0821
            addi         sp, sp, 32 /* (top of frame) */       # 1631: 12c120
            ret                                                # 1634: 0df0
.Lbr161:    movi         a4, 32 /* 0x00000020 */               # 1636: 2c04
            movi         a0, sdk_g_ic                          # 1638: 01dcff
            s8i          a12, a14, 129 /* arg0 -> [sdk_g_ic+0x315] */ # 163b: c24e81
            movi         a3, sdk_g_ic+0xc0                     # 163e: 31d9ff
            s32i         a3, sp, 0 /* sdk_g_ic+0xc0 -> [(local0)] */ # 1641: 3901
            l32i         a2, a13, 124                          # 1643: 222d1f
            s32i         a2, a3, 0x124 /* a2 -> [sdk_g_ic+0x1e4] */ # 1646: 226349
            l32i         a13, sp, 4 /* [(local1)] */           # 1649: d811
            movi         a2, sdk_g_ic+0x1e8                    # 164b: 21d8ff
            movi         a3, 796 /* 0x0000031c */              # 164e: 32a31c
            add          a13, a13, a0                          # 1651: 0add
            add          a3, a13, a3                           # 1653: 3a3d
            call0        memcpy                                # 1655: 01ddffc0
                                                               # 1659: 0000
            movi         a2, sdk_g_ic+0x20f                    # 165b: 21d5ff
            movi         a4, 64 /* 0x00000040 */               # 165e: 4c04
            movi         a3, 828 /* 0x0000033c */              # 1660: 32a33c
            add          a3, a13, a3                           # 1663: 3a3d
            call0        memcpy                                # 1665: 01daffc0
                                                               # 1669: 0000
            movi         a11, 1 /* 0x00000001 */               # 166b: 0c1b
            addmi        a10, a14, -256 /* sdk_g_ic+0x194 */   # 166d: a2deff
            l32i         a13, sp, 0 /* [(local0)] */           # 1670: d801
            movi         a9, 0 /* 0x00000000 */                # 1672: 0c09
            addmi        a13, a13, 256 /* [(local0)]+0x100 */  # 1674: d2dd01
            s8i          a9, a10, 187 /* 0x00 -> [sdk_g_ic+0x24f] */ # 1677: 924abb
            s8i          a11, a13, 78 /* 0x01 -> [[(local0)]+0x14e] */ # 167a: b24d4e
            movi         a7, 0x00010000                        # 167d: 71cdff
            movi         a8, 0x60000e00                        # 1680: 81ceff
            memw                                               # 1683: c02000
            movi         a2, sdk_g_ic+0x282                    # 1686: 21cfff
            movi         a6, sdk_g_ic+0x4a0                    # 1689: 61ccff
            subx8        a3, a12, a12                          # 168c: c03cf0
            movi         a5, 1313 /* 0x00000521 */             # 168f: 52a521
            s32i         a7, a8, 0x3f4 /* 0x00010000 -> [0x600011f4] */ # 1692: 7268fd
            movi         a4, sdk_g_ic                          # 1695: 41caff
            addmi        a7, a14, -256 /* sdk_g_ic+0x194 */    # 1698: 72deff
            add          a4, a4, a5 /* sdk_g_ic+0x521 */       # 169b: 5a44
            add          a6, a3, a6                            # 169d: 6a63
            l8ui         a6, a6, 128                           # 169f: 620680
            add          a3, a3, a4                            # 16a2: 4a33
            s8i          a6, a7, 237 /* a6 -> [sdk_g_ic+0x281] */ # 16a4: 6247ed
            movi         a4, 6 /* 0x00000006 */                # 16a7: 0c64
            call0        memcpy                                # 16a9: 01caffc0
                                                               # 16ad: 0000
            call0        sdk_wifi_station_disconnect           # 16af: 050000
            call0        sdk_wifi_station_connect              # 16b2: 050000
            j            .Lbr158                               # 16b5: 46daff

            .literal_position                                  # 16b8: 00000000
                                                               # 16bc: 00000000
                                                               # 16c0: 00000000
                                                               # 16c4: 00000000

# Function @ .irom0.text+0x16c8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_wifi_station_scan
            .type        sdk_wifi_station_scan, @function
sdk_wifi_station_scan:
            addi         sp, sp, -16 /* (local0) */            # 16c8: 12c1f0
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     # 16cb: 0931
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    # 16cd: 2901
            movi         a0, sdk_g_ic                          # 16cf: 01faff
            s32i         a3, sp, 4 /* arg1 -> [(local1)] */    # 16d2: 3911
            l32i         a0, a0, 16 /* [sdk_g_ic+0x10] */      # 16d4: 0840
            s32i         a0, sp, 8 /* [sdk_g_ic+0x10] -> [(local2)] */ # 16d6: 0921
            call0        sdk_wifi_get_opmode                   # 16d8: 050000
            beqi         a2, 2, .Lbr163                        # 16db: 262221
            l32i         a2, sp, 8 /* [(local2)] */            # 16de: 2821
            beqz         a2, .Lbr163                           # 16e0: 9cc2
            l32i         a2, sp, 0 /* [(local0)] */            # 16e2: 2801
            movi         a5, sdk_scannum                       # 16e4: 51f6ff
            movi         a4, 0 /* 0x00000000 */                # 16e7: 0c04
            l32i         a3, sp, 4 /* [(local1)] */            # 16e9: 3811
            s16i         a4, a5, 0 /* 0x0000 -> [sdk_scannum] */ # 16eb: 425500
            movi         a4, sdk_g_ic+0x180                    # 16ee: 41f4ff
            call0        sdk_cnx_sta_scan_cmd                  # 16f1: 01f4ffc0
                                                               # 16f5: 0000
            movi         a2, 1 /* 0x00000001 */                # 16f7: 0c12
.Lbr162:    l32i         a0, sp, 12 /* [(local3)] */           # 16f9: 0831
            addi         sp, sp, 16 /* (top of frame) */       # 16fb: 12c110
            ret                                                # 16fe: 0df0
.Lbr163:    movi         a2, 0 /* 0x00000000 */                # 1700: 0c02
            j            .Lbr162                               # 1702: c6fcff

            .literal_position                                  # 1708: 00000000

# Function @ .irom0.text+0x170c
            .balign      4
            .global      sdk_wifi_station_get_auto_connect
            .type        sdk_wifi_station_get_auto_connect, @function
sdk_wifi_station_get_auto_connect:
            movi         a3, sdk_g_ic+0x498                    # 170c: 31ffff
            l8ui         a3, a3, 128 /* [sdk_g_ic+0x518] */    # 170f: 320380
            movi         a4, 1 /* 0x00000001 */                # 1712: 0c14
            bgeui        a3, 2, .Lbr164                        # 1714: f62301
            mov          a4, a3 /* [sdk_g_ic+0x518] */         # 1717: 4d03
.Lbr164:    extui        a2, a4, 0, 8                          # 1719: 402074
            ret                                                # 171c: 0df0

            .literal_position                                  # 1720: 00000000
                                                               # 1724: 00000000

# Function @ .irom0.text+0x1728
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wifi_station_set_auto_connect
            .type        sdk_wifi_station_set_auto_connect, @function
sdk_wifi_station_set_auto_connect:
            addi         sp, sp, -16 /* (local0) */            # 1728: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 172b: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 172d: 0901
            mov          a12, a2 /* arg0 */                    # 172f: cd02
            bgeui        a2, 2, .Lbr165                        # 1731: f62205
            call0        sdk_wifi_get_opmode                   # 1734: 050000
            bnei         a2, 2, .Lbr166                        # 1737: 662204
.Lbr165:    movi         a2, 0 /* 0x00000000 */                # 173a: 0c02
            j            .Lbr168                               # 173c: c60400
.Lbr166:    movi         a0, sdk_g_ic+0x498                    # 173f: 01f8ff
            l8ui         a2, a0, 128 /* [sdk_g_ic+0x518] */    # 1742: 220080
            beq          a2, a12, .Lbr167                      # 1745: c71208
            movi         a2, sdk_g_ic+0x1d8                    # 1748: 21f7ff
            s8i          a12, a0, 128 /* arg0 -> [sdk_g_ic+0x518] */ # 174b: c24080
            call0        sdk_wifi_param_save_protect           # 174e: 050000
.Lbr167:    movi         a2, 1 /* 0x00000001 */                # 1751: 0c12
.Lbr168:    l32i         a12, sp, 4 /* [(local1)] */           # 1753: c811
            l32i         a0, sp, 0 /* [(local0)] */            # 1755: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1757: 12c110
            ret                                                # 175a: 0df0

            .literal_position                                  # 175c: 00000000
                                                               # 1760: 00000000
                                                               # 1764: 0000ffff
                                                               # 1768: 000e0060
                                                               # 176c: 00000000
                                                               # 1770: 00000000
                                                               # 1774: 00000000
                                                               # 1778: 00000000

# Function @ .irom0.text+0x177c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wifi_station_connect
            .type        sdk_wifi_station_connect, @function
sdk_wifi_station_connect:
            addi         sp, sp, -16 /* (local0) */            # 177c: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 177f: 0911
            movi         a0, sdk_g_ic                          # 1781: 01f6ff
            l32i         a0, a0, 16 /* [sdk_g_ic+0x10] */      # 1784: 0840
            s32i         a0, sp, 0 /* [sdk_g_ic+0x10] -> [(local0)] */ # 1786: 0901
            call0        sdk_wifi_get_opmode                   # 1788: 050000
            beqi         a2, 2, .Lbr169                        # 178b: 262254
            l32i         a2, sp, 0 /* [(local0)] */            # 178e: 2801
            beqz         a2, .Lbr169                           # 1790: 16f204
            movi         a2, 2 /* 0x00000002 */                # 1793: 0c22
            call0        .Lfunc001                             # 1795: 058bfe
            beqi         a2, -1, .Lbr171                       # 1798: 260254
            movi         a0, sdk_g_ic                          # 179b: 01f1ff
            l32i         a4, a0, 16 /* [sdk_g_ic+0x10] */      # 179e: 4840
            movi         a2, 0 /* 0x00000000 */                # 17a0: 0c02
            s8i          a2, a4, 184 /* 0x00 -> [[sdk_g_ic+0x10]+0xb8] */ # 17a2: 2244b8
            l32i         a3, a0, 16 /* [sdk_g_ic+0x10] */      # 17a5: 3840
            s8i          a2, a3, 185 /* 0x00 -> [[sdk_g_ic+0x10]+0xb9] */ # 17a7: 2243b9
            l32i         a0, a0, 0x1e4 /* [sdk_g_ic+0x1e4] */  # 17aa: 022079
            beqi         a0, -1, .Lbr171                       # 17ad: 26003f
            beqz         a0, .Lbr171                           # 17b0: bcc0
            movi         a6, 0xffff0000                        # 17b2: 61ecff
            movi         a3, 0x60000e00                        # 17b5: 31ecff
            memw                                               # 17b8: c02000
            l32i         a5, a3, 0x3f4 /* [0x600011f4] */      # 17bb: 5223fd
            and          a5, a5, a6                            # 17be: 605510
            extui        a5, a5, 16, 16                        # 17c1: 5050f5
            memw                                               # 17c4: c02000
            l32i         a3, a3, 0x3f4 /* [0x600011f4] */      # 17c7: 3223fd
            movi         a2, sdk_g_ic+0x1d8                    # 17ca: 21e8ff
            extui        a3, a3, 0, 8                          # 17cd: 303074
            bnei         a5, 1, .Lbr170                        # 17d0: 661514
            movi         a7, 13 /* 0x0000000d */               # 17d3: 0cd7
            bgeu         a7, a3, .Lbr173                       # 17d5: 37b720
            movi         a3, 0 /* 0x00000000 */                # 17d8: 0c03
            call0        sdk_cnx_sta_connect_cmd               # 17da: 01e5ffc0
                                                               # 17de: 0000
            j            .Lbr171                               # 17e0: 060300
.Lbr169:    movi         a2, 0 /* 0x00000000 */                # 17e3: 0c02
            j            .Lbr172                               # 17e5: 460200
.Lbr170:    movi         a3, 0 /* 0x00000000 */                # 17e8: 0c03
            call0        sdk_cnx_sta_connect_cmd               # 17ea: 01e2ffc0
                                                               # 17ee: 0000
.Lbr171:    movi         a2, 1 /* 0x00000001 */                # 17f0: 0c12
.Lbr172:    l32i         a0, sp, 4 /* [(local1)] */            # 17f2: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 17f4: 12c110
            ret                                                # 17f7: 0df0
.Lbr173:    call0        sdk_cnx_sta_connect_cmd               # 17f9: 01dfffc0
                                                               # 17fd: 0000
            j            .Lbr171                               # 17ff: 46fbff

            .literal_position                                  # 1804: 00000000
                                                               # 1808: 00000000
                                                               # 180c: 00000000
                                                               # 1810: 00000000
                                                               # 1814: 00000000

# Function @ .irom0.text+0x1818
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wifi_station_disconnect
            .type        sdk_wifi_station_disconnect, @function
sdk_wifi_station_disconnect:
            addi         sp, sp, -16 /* (local0) */            # 1818: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 181b: 0911
            movi         a0, sdk_g_ic                          # 181d: 01f9ff
            l32i         a0, a0, 16 /* [sdk_g_ic+0x10] */      # 1820: 0840
            s32i         a0, sp, 0 /* [sdk_g_ic+0x10] -> [(local0)] */ # 1822: 0901
            call0        sdk_wifi_get_opmode                   # 1824: 050000
            beqi         a2, 2, .Lbr174                        # 1827: 262232
            l32i         a2, sp, 0 /* [(local0)] */            # 182a: 2801
            beqz         a2, .Lbr174                           # 182c: acd2
            movi         a2, 1 /* 0x00000001 */                # 182e: 0c12
            call0        .Lfunc001                             # 1830: 4581fe
            movi         a0, sdk_g_ic                          # 1833: 01f5ff
            beqi         a2, -1, .Lbr176                       # 1836: 260236
            l32i         a7, a0, 16 /* [sdk_g_ic+0x10] */      # 1839: 7840
            movi         a3, 0 /* 0x00000000 */                # 183b: 0c03
            s8i          a3, a7, 184 /* 0x00 -> [[sdk_g_ic+0x10]+0xb8] */ # 183d: 3247b8
            l32i         a6, a0, 16 /* [sdk_g_ic+0x10] */      # 1840: 6840
            s8i          a3, a6, 186 /* 0x00 -> [[sdk_g_ic+0x10]+0xba] */ # 1842: 3246ba
            l32i         a5, a0, 16 /* [sdk_g_ic+0x10] */      # 1845: 5840
            s8i          a3, a5, 185 /* 0x00 -> [[sdk_g_ic+0x10]+0xb9] */ # 1847: 3245b9
            l32i         a2, a0, 16 /* [sdk_g_ic+0x10] */      # 184a: 2840
            l32i         a4, a2, 60 /* [[sdk_g_ic+0x10]+0x3c] */ # 184c: 48f2
            beqz         a4, .Lbr175                           # 184e: 9c04
            movi         a4, 0 /* 0x00000000 */                # 1850: 0c04
            mov          a2, a0 /* sdk_g_ic */                 # 1852: 2d00
            call0        sdk_ieee80211_sta_new_state           # 1854: 01eeffc0
                                                               # 1858: 0000
            j            .Lbr176                               # 185a: 860400
.Lbr174:    movi         a2, 0 /* 0x00000000 */                # 185d: 0c02
            j            .Lbr177                               # 185f: c60300
.Lbr175:    addi         a2, a2, 4 /* [sdk_g_ic+0x10]+0x4 */   # 1862: 4b22
            call0        sdk_os_timer_disarm                   # 1864: 01ebffc0
                                                               # 1868: 0000
            call0        sdk_scan_cancel                       # 186a: 01eaffc0
                                                               # 186e: 0000
.Lbr176:    movi         a2, 1 /* 0x00000001 */                # 1870: 0c12
.Lbr177:    l32i         a0, sp, 4 /* [(local1)] */            # 1872: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 1874: 12c110
            ret                                                # 1877: 0df0

            .literal_position                                  # 187c: 00000000
                                                               # 1880: 00000000

# Function @ .irom0.text+0x1884
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wifi_station_get_connect_status
            .type        sdk_wifi_station_get_connect_status, @function
sdk_wifi_station_get_connect_status:
            addi         sp, sp, -16 /* (local0) */            # 1884: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 1887: 0911
            movi         a0, sdk_g_ic                          # 1889: 01fcff
            l32i         a0, a0, 16 /* [sdk_g_ic+0x10] */      # 188c: 0840
            s32i         a0, sp, 0 /* [sdk_g_ic+0x10] -> [(local0)] */ # 188e: 0901
            call0        sdk_wifi_get_opmode                   # 1890: 050000
            l32i         a0, sp, 4 /* [(local1)] */            # 1893: 0811
            beqi         a2, 2, .Lbr179                        # 1895: 262210
            l32i         a2, sp, 0 /* [(local0)] */            # 1898: 2801
            beqz         a2, .Lbr179                           # 189a: 8cb2
            movi         a2, sdk_g_ic                          # 189c: 21f9ff
            l32i         a2, a2, 16 /* [sdk_g_ic+0x10] */      # 189f: 2842
            l8ui         a2, a2, 186 /* [[sdk_g_ic+0x10]+0xba] */ # 18a1: 2202ba
.Lbr178:    addi         sp, sp, 16 /* (top of frame) */       # 18a4: 12c110
            ret                                                # 18a7: 0df0
.Lbr179:    movi         a2, 255 /* 0x000000ff */              # 18a9: 22a0ff
            j            .Lbr178                               # 18ac: 06fdff

            .literal_position                                  # 18b0: 00000000
                                                               # 18b4: 00000000

# Function @ .irom0.text+0x18b8
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_softap_cacl_mac
            .type        sdk_wifi_softap_cacl_mac, @function
sdk_wifi_softap_cacl_mac:
            addi         sp, sp, -32 /* (local0) */            # 18b8: 12c1e0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 18bb: c911
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   # 18bd: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 18bf: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 18c1: d921
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   # 18c3: e931
            mov          a13, a2 /* arg0 */                    # 18c5: dd02
            mov          a14, a3 /* arg1 */                    # 18c7: ed03
            beqz         a2, .Lbr183                           # 18c9: 164204
            beqz         a3, .Lbr183                           # 18cc: 161304
            movi         a4, 6 /* 0x00000006 */                # 18cf: 0c64
            call0        memcpy                                # 18d1: 01f7ffc0
                                                               # 18d5: 0000
            movi         a12, 0 /* 0x00000000 */               # 18d7: 0c0c
            movi         a15, 2 /* 0x00000002 */               # 18d9: 0c2f
.Lbr180:    mov          a2, a13 /* arg0 */                    # 18db: 2d0d
            mov          a3, a14 /* arg1 */                    # 18dd: 3d0e
            movi         a4, 6 /* 0x00000006 */                # 18df: 0c64
            l8ui         a0, a14, 0 /* [arg1] */               # 18e1: 020e00
            slli         a5, a12, 2                            # 18e4: e05c11
            or           a0, a0, a15                           # 18e7: f00020
            xor          a0, a0, a5                            # 18ea: 500030
            s8i          a0, a13, 0 /* a0 -> [arg0] */         # 18ed: 024d00
            call0        strncmp                               # 18f0: 01f1ffc0
                                                               # 18f4: 0000
            bnez         a2, .Lbr181                           # 18f6: cc62
            addi         a12, a12, 1                           # 18f8: 1bcc
            extui        a12, a12, 0, 8                        # 18fa: c0c074
            bnei         a12, 64, .Lbr180                      # 18fd: 66dcda
.Lbr181:    movi         a2, 1 /* 0x00000001 */                # 1900: 0c12
.Lbr182:    l32i         a12, sp, 4 /* [(local1)] */           # 1902: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 1904: d821
            l32i         a14, sp, 12 /* [(local3)] */          # 1906: e831
            l32i         a15, sp, 16 /* [(local4)] */          # 1908: f841
            l32i         a0, sp, 0 /* [(local0)] */            # 190a: 0801
            addi         sp, sp, 32 /* (top of frame) */       # 190c: 12c120
            ret                                                # 190f: 0df0
.Lbr183:    movi         a2, 0 /* 0x00000000 */                # 1911: 0c02
            j            .Lbr182                               # 1913: c6faff

            .literal_position                                  # 1918: 00000000
                                                               # 191c: 00000000
                                                               # 1920: 00000000
                                                               # 1924: 00000000
                                                               # 1928: 80010000
                                                               # 192c: 00000000
                                                               # 1930: 00000000
                                                               # 1934: 00000000

# Function @ .irom0.text+0x1938
# Local variables/stack:
#     (local0):  byte      @ -0xd
#     (local1):  byte      @ -0xc
#     (local2):  byte[3]   @ -0xb
#     (local3):  word[2]   @ -0x8
            .balign      4
            .global      sdk_wifi_softap_set_default_ssid
            .type        sdk_wifi_softap_set_default_ssid, @function
sdk_wifi_softap_set_default_ssid:
            movi         a2, 1 /* 0x00000001 */                # 1938: 0c12
            addi         sp, sp, -16 /* (FP)-0x10 */           # 193a: 12c1f0
            mov          a3, sp /* (FP)-0x10 */                # 193d: 3d01
            s32i         a0, sp, 8 /* a0 -> [(local3)] */      # 193f: 0921
            call0        sdk_wifi_get_macaddr                  # 1941: 050000
            movi         a0, sdk_g_ic                          # 1944: 01f5ff
            movi         a2, sdk_g_ic+0x280                    # 1947: 21f5ff
            l32i         a0, a0, 0x288 /* [sdk_g_ic+0x288] */  # 194a: 0220a2
            l8ui         a2, a2, 12 /* [sdk_g_ic+0x28c] */     # 194d: 22020c
            beqi         a0, -1, .Lbr184                       # 1950: 260005
            movi         a3, 255 /* 0x000000ff */              # 1953: 32a0ff
            bne          a2, a3, .Lbr185                       # 1956: 379227
.Lbr184:    movi         a2, sdk_g_ic+0x288                    # 1959: 21f1ff
            movi         a3, 36 /* 0x00000024 */               # 195c: 2c43
            call0        bzero                                 # 195e: 01f4ffc0
                                                               # 1962: 0000
            movi         a2, sdk_g_ic+0x28c                    # 1964: 21f0ff
            movi         a3, .Lstr017                          # 1967: 31f0ff
            l8ui         a4, sp, 3 /* [(local0)] */            # 196a: 420103
            l8ui         a5, sp, 4 /* [(local1)] */            # 196d: 520104
            l8ui         a6, sp, 5 /* [(local2)] */            # 1970: 620105
            call0        sprintf                               # 1973: 01f0ffc0
                                                               # 1977: 0000
            movi         a4, sdk_g_ic+0x100                    # 1979: 41ecff
            movi         a3, 10 /* 0x0000000a */               # 197c: 0ca3
            s32i         a3, a4, 0x188 /* 0x0000000a -> [sdk_g_ic+0x288] */ # 197e: 326462
.Lbr185:    movi         a2, 1 /* 0x00000001 */                # 1981: 0c12
            l32i         a0, sp, 8 /* [(local3)] */            # 1983: 0821
            addi         sp, sp, 16 /* (top of frame) */       # 1985: 12c110
            ret           /* 0x00000001 */                     # 1988: 0df0

            .literal_position                                  # 198c: 00000000
                                                               # 1990: 60ea0000
                                                               # 1994: 80010000
                                                               # 1998: 00000000
                                                               # 199c: 00000000
                                                               # 19a0: 00000000
                                                               # 19a4: 00000000
                                                               # 19a8: 00000000
                                                               # 19ac: 00000000
                                                               # 19b0: 00000000

# Function @ .irom0.text+0x19b4
# Local variables/stack:
#     (local0):  byte      @ -0x2d
#     (local1):  byte      @ -0x2c
#     (local2):  byte[3]   @ -0x2b
#     (local3):  word      @ -0x28
#     (local4):  word      @ -0x24
#     (local5):  word      @ -0x20
#     (local6):  word      @ -0x1c
#     (local7):  word      @ -0x18
#     (local8):  word      @ -0x14
#     (local9):  word      @ -0x10
#     (local10): word[3]   @ -0xc
            .balign      4
.Lfunc013:  addi         sp, sp, -48 /* (FP)-0x30 */           # 19b4: 12c1d0
            s32i         a13, sp, 20 /* a13 -> [(local6)] */   # 19b7: d951
            s32i         a14, sp, 24 /* a14 -> [(local7)] */   # 19b9: e961
            s32i         a15, sp, 28 /* a15 -> [(local8)] */   # 19bb: f971
            s32i         a12, sp, 16 /* a12 -> [(local5)] */   # 19bd: c941
            s32i         a0, sp, 12 /* a0 -> [(local4)] */     # 19bf: 0931
            mov          a12, a2 /* arg0 */                    # 19c1: cd02
            bnez         a2, .Lbr186                           # 19c3: cc32
            movi         a2, 0 /* 0x00000000 */                # 19c5: 0c02
            j            .Lbr202                               # 19c7: 062f00
.Lbr186:    s32i         a3, sp, 8 /* arg1 -> [(local3)] */    # 19ca: 3921
            bnei         a3, 1, .Lbr187                        # 19cc: 661305
            movi         a13, sdk_g_ic+0x1d8                   # 19cf: d1efff
            j            .Lbr188                               # 19d2: 060100
.Lbr187:    call0        .Lfunc009                             # 19d5: 0566ff
            mov          a13, a2                               # 19d8: dd02
.Lbr188:    movi         a15, 0 /* 0x00000000 */               # 19da: 0c0f
            addi         a14, a13, 116                         # 19dc: e2cd74
            l8ui         a0, a14, 194                          # 19df: 020ec2
            movi         a2, 212 /* 0x000000d4 */              # 19e2: 22a0d4
            bltui        a0, 5, .Lbr189                        # 19e5: b65002
            j            .Lbr203                               # 19e8: 862a00
.Lbr189:    addi         a3, a0, -1                            # 19eb: 0b30
            beqz         a3, .Lbr203                           # 19ed: 16530a
            s32i         a0, a12, 100 /* a0 -> [arg0+0x64] */  # 19f0: 026c19
            add          a4, a13, a2                           # 19f3: 2a4d
            s32i         a4, sp, 32 /* a4 -> [(local9)] */     # 19f5: 4981
.Lbr190:    l32i         a6, a14, 60                           # 19f7: 68fe
            movi         a5, 180 /* 0x000000b4 */              # 19f9: 52a0b4
            addi         a6, a6, 1                             # 19fc: 1b66
            beqz         a6, .Lbr204                           # 19fe: 16660a
            l8ui         a7, a14, 64                           # 1a01: 720e40
            movi         a8, 255 /* 0x000000ff */              # 1a04: 82a0ff
            sub          a7, a7, a8                            # 1a07: 8077c0
            beqz         a7, .Lbr204                           # 1a0a: 16a709
            add          a0, a13, a5                           # 1a0d: 5a0d
.Lbr191:    mov          a2, a12 /* arg0 */                    # 1a0f: 2d0c
            movi         a4, 32 /* 0x00000020 */               # 1a11: 2c04
            mov          a3, a0                                # 1a13: 3d00
            call0        memcpy                                # 1a15: 01e0ffc0
                                                               # 1a19: 0000
            l32i         a3, sp, 32 /* [(local9)] */           # 1a1b: 3881
            addi         a2, a12, 32 /* arg0+0x20 */           # 1a1d: 22cc20
            movi         a4, 64 /* 0x00000040 */               # 1a20: 4c04
            call0        memcpy                                # 1a22: 01deffc0
                                                               # 1a26: 0000
            l32i         a0, a14, 60                           # 1a28: 08fe
            movi         a9, 32 /* 0x00000020 */               # 1a2a: 2c09
            blt          a9, a0, .Lbr192                       # 1a2c: 072902
            bgei         a0, 1, .Lbr193                        # 1a2f: e61005
.Lbr192:    s8i          a15, a12, 96 /* 0x00 -> [arg0+0x60] */ # 1a32: f24c60
            j            .Lbr194                               # 1a35: 860000
.Lbr193:    s8i          a0, a12, 96 /* a0 -> [arg0+0x60] */   # 1a38: 024c60
.Lbr194:    l8ui         a0, a14, 193                          # 1a3b: 020ec1
            movi         a10, 14 /* 0x0000000e */              # 1a3e: 0cea
            bltu         a10, a0, .Lbr195                      # 1a40: 073a01
            bnez         a0, .Lbr196                           # 1a43: cc00
.Lbr195:    movi         a0, 1 /* 0x00000001 */                # 1a45: 0c10
.Lbr196:    s8i          a0, a12, 97 /* a0 -> [arg0+0x61] */   # 1a47: 024c61
            l8ui         a0, a14, 195                          # 1a4a: 020ec3
            bgeui        a0, 2, .Lbr197                        # 1a4d: f62001
            mov          a15, a0                               # 1a50: fd00
.Lbr197:    s8i          a15, a12, 104 /* a15 -> [arg0+0x68] */ # 1a52: f24c68
            l8ui         a0, a14, 196                          # 1a55: 020ec4
            movi         a11, 0x0000ea60                       # 1a58: b1ceff
            bltui        a0, 5, .Lbr198                        # 1a5b: b65001
            movi         a0, 4 /* 0x00000004 */                # 1a5e: 0c40
.Lbr198:    s8i          a0, a12, 105 /* a0 -> [arg0+0x69] */  # 1a60: 024c69
            addmi        a0, a13, 768                          # 1a63: 02dd03
            l16ui        a0, a0, 108                           # 1a66: 021036
            l32i         a3, sp, 8 /* [(local3)] */            # 1a69: 3821
            bltu         a11, a0, .Lbr199                      # 1a6b: 073b05
            movi         a2, 99 /* 0x00000063 */               # 1a6e: 22a063
            bltu         a2, a0, .Lbr200                       # 1a71: 073202
.Lbr199:    movi         a0, 100 /* 0x00000064 */              # 1a74: 02a064
.Lbr200:    s16i         a0, a12, 106 /* a0 -> [arg0+0x6a] */  # 1a77: 025c35
            beqi         a3, 1, .Lbr201                        # 1a7a: 261307
            mov          a2, a13                               # 1a7d: 2d0d
            call0        free                                  # 1a7f: 01c8ffc0
                                                               # 1a83: 0000
.Lbr201:    movi         a2, 1 /* 0x00000001 */                # 1a85: 0c12
.Lbr202:    l32i         a12, sp, 16 /* [(local5)] */          # 1a87: c841
            l32i         a13, sp, 20 /* [(local6)] */          # 1a89: d851
            l32i         a14, sp, 24 /* [(local7)] */          # 1a8b: e861
            l32i         a15, sp, 28 /* [(local8)] */          # 1a8d: f871
            l32i         a0, sp, 12 /* [(local4)] */           # 1a8f: 0831
            addi         sp, sp, 48 /* (top of frame) */       # 1a91: 12c130
            ret                                                # 1a94: 0df0
.Lbr203:    s32i         a15, a12, 100 /* 0x00000000 -> [arg0+0x64] */ # 1a96: f26c19
            movi         a3, 64 /* 0x00000040 */               # 1a99: 4c03
            add          a2, a13, a2                           # 1a9b: 2a2d
            s32i         a2, sp, 32 /* a2 -> [(local9)] */     # 1a9d: 2981
            call0        bzero                                 # 1a9f: 01c1ffc0
                                                               # 1aa3: 0000
            j            .Lbr190                               # 1aa5: 86d3ff
.Lbr204:    movi         a2, 1 /* 0x00000001 */                # 1aa8: 0c12
            mov          a3, sp /* (FP)-0x30 */                # 1aaa: 3d01
            call0        sdk_wifi_get_macaddr                  # 1aac: 01bfffc0
                                                               # 1ab0: 0000
            movi         a3, 36 /* 0x00000024 */               # 1ab2: 2c43
            movi         a2, 176 /* 0x000000b0 */              # 1ab4: 22a0b0
            add          a2, a13, a2                           # 1ab7: 2a2d
            call0        bzero                                 # 1ab9: 01bcffc0
                                                               # 1abd: 0000
            movi         a3, .Lstr017                          # 1abf: 31b5ff
            l8ui         a4, sp, 3 /* [(local0)] */            # 1ac2: 420103
            l8ui         a5, sp, 4 /* [(local1)] */            # 1ac5: 520104
            l8ui         a6, sp, 5 /* [(local2)] */            # 1ac8: 620105
            movi         a2, 180 /* 0x000000b4 */              # 1acb: 22a0b4
            add          a2, a13, a2                           # 1ace: 2a2d
            s32i         a2, sp, 36 /* a2 -> [(local10)] */    # 1ad0: 2991
            call0        sprintf                               # 1ad2: 01b7ffc0
                                                               # 1ad6: 0000
            l32i         a0, sp, 36 /* [(local10)] */          # 1ad8: 0891
            movi         a3, 10 /* 0x0000000a */               # 1ada: 0ca3
            s32i         a3, a14, 60                           # 1adc: 39fe
            j            .Lbr191                               # 1ade: 46cbff

            .balign      4
# Function @ .irom0.text+0x1ae4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_softap_get_config
            .type        sdk_wifi_softap_get_config, @function
sdk_wifi_softap_get_config:
            movi         a3, 1 /* 0x00000001 */                # 1ae4: 0c13
            addi         sp, sp, -16 /* (local0) */            # 1ae6: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1ae9: 0901
            call0        .Lfunc013                             # 1aeb: 85ecff
            l32i         a0, sp, 0 /* [(local0)] */            # 1aee: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1af0: 12c110
            ret                                                # 1af3: 0df0

            .balign      4
# Function @ .irom0.text+0x1af8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_softap_get_config_default
            .type        sdk_wifi_softap_get_config_default, @function
sdk_wifi_softap_get_config_default:
            movi         a3, 0 /* 0x00000000 */                # 1af8: 0c03
            addi         sp, sp, -16 /* (local0) */            # 1afa: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1afd: 0901
            call0        .Lfunc013                             # 1aff: 45ebff
            l32i         a0, sp, 0 /* [(local0)] */            # 1b02: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1b04: 12c110
            ret                                                # 1b07: 0df0

            .literal_position                                  # 1b0c: 8c000000
                                                               # 1b10: 00000000
                                                               # 1b14: 60ea0000
                                                               # 1b18: 00000000
                                                               # 1b1c: 00900100
                                                               # 1b20: 00000000
                                                               # 1b24: 00100000
                                                               # 1b28: 00000000
                                                               # 1b2c: 00000000
                                                               # 1b30: 00000000
                                                               # 1b34: 00000000
                                                               # 1b38: 00000000
                                                               # 1b3c: 00000000
                                                               # 1b40: 00000000
                                                               # 1b44: 00000000
                                                               # 1b48: 00000000
                                                               # 1b4c: 00000000
                                                               # 1b50: 00000000
                                                               # 1b54: 00000000
                                                               # 1b58: 00000000
                                                               # 1b5c: 00000000
                                                               # 1b60: 00000000
                                                               # 1b64: 00000000
                                                               # 1b68: 00000000
                                                               # 1b6c: 00000000
                                                               # 1b70: 00000000
                                                               # 1b74: 00000000
                                                               # 1b78: 00000000
                                                               # 1b7c: 00000000
                                                               # 1b80: 00000000
                                                               # 1b84: 00000000

# Function @ .irom0.text+0x1b88
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
.Lfunc014:  addi         sp, sp, -48 /* (local0) */            # 1b88: 12c1d0
            s32i         a14, sp, 24 /* a14 -> [(local6)] */   # 1b8b: e961
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     # 1b8d: 0931
            s32i         a13, sp, 20 /* a13 -> [(local5)] */   # 1b8f: d951
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   # 1b91: c941
            mov          a13, a3 /* arg1 */                    # 1b93: dd03
            mov          a12, a2 /* arg0 */                    # 1b95: cd02
            beqz         a2, .Lbr206                           # 1b97: bc12
            call0        sdk_wifi_get_opmode                   # 1b99: 050000
            beqi         a2, 1, .Lbr206                        # 1b9c: 26122c
            movi         a2, 6 /* 0x00000006 */                # 1b9f: 0c62
            call0        .Lfunc001                             # 1ba1: 454afe
            addi         a0, a2, 1                             # 1ba4: 1b02
            bnez         a0, .Lbr219                           # 1ba6: 56c00e
            mov          a3, a12 /* arg0 */                    # 1ba9: 3d0c
            movi         a2, .Ldata008                         # 1bab: 21d8ff
            movi         a4, 108 /* 0x0000006c */              # 1bae: 42a06c
            call0        memcpy                                # 1bb1: 01e6ffc0
                                                               # 1bb5: 0000
            j            .Lbr217                               # 1bb7: 063300
.Lbr205:    mov          a2, a14 /* arg0+0x20 */               # 1bba: 2d0e
            movi         a3, sdk_g_ic+0x2ed                    # 1bbc: 31d5ff
            movi         a4, 32 /* 0x00000020 */               # 1bbf: 2c04
            call0        sdk_hexstr2bin                        # 1bc1: 01e3ffc0
                                                               # 1bc5: 0000
            addi         a2, a2, 1                             # 1bc7: 1b22
            bnez         a2, .Lbr223                           # 1bc9: 567211
.Lbr206:    movi         a2, 0 /* 0x00000000 */                # 1bcc: 0c02
            j            .Lbr218                               # 1bce: c62d00
.Lbr207:    s8i          a8, a13, 160 /* [arg0+0x64] -> [sdk_g_ic+0x30e] */ # 1bd1: 824da0
.Lbr208:    l8ui         a7, a12, 97 /* [arg0+0x61] */         # 1bd4: 720c61
            movi         a3, 14 /* 0x0000000e */               # 1bd7: 0ce3
            bltu         a3, a7, .Lbr209                       # 1bd9: 773301
            bnez         a7, .Lbr210                           # 1bdc: cc07
.Lbr209:    movi         a7, 1 /* 0x00000001 */                # 1bde: 0c17
.Lbr210:    s8i          a7, a13, 159 /* a7 -> [sdk_g_ic+0x30d] */ # 1be0: 724d9f
            l8ui         a5, a12, 104 /* [arg0+0x68] */        # 1be3: 520c68
            bgeui        a5, 2, .Lbr211                        # 1be6: f62501
            mov          a0, a5 /* [arg0+0x68] */              # 1be9: 0d05
.Lbr211:    s8i          a0, a13, 161 /* a0 -> [sdk_g_ic+0x30f] */ # 1beb: 024da1
            l8ui         a0, a12, 105 /* [arg0+0x69] */        # 1bee: 020c69
            movi         a4, 0x0000ea60                        # 1bf1: 41c8ff
            bltui        a0, 5, .Lbr212                        # 1bf4: b65001
            movi         a0, 4 /* 0x00000004 */                # 1bf7: 0c40
.Lbr212:    s8i          a0, a13, 162 /* a0 -> [sdk_g_ic+0x310] */ # 1bf9: 024da2
            l16ui        a2, a12, 106 /* [arg0+0x6a] */        # 1bfc: 221c35
            bltu         a4, a2, .Lbr213                       # 1bff: 273408
            movi         a5, 99 /* 0x00000063 */               # 1c02: 52a063
            bgeu         a5, a2, .Lbr213                       # 1c05: 27b502
            j            .Lbr229                               # 1c08: 065200
.Lbr213:    movi         a2, 100 /* 0x00000064 */              # 1c0b: 22a064
            movi         a0, 100 /* 0x00000064 */              # 1c0e: 02a064
.Lbr214:    movi         a6, sdk_g_ic+0x446                    # 1c11: 61c1ff
            movi         a3, 100 /* 0x00000064 */              # 1c14: 32a064
            s16i         a0, a6, 254 /* a0 -> [sdk_g_ic+0x544] */ # 1c17: 02567f
            call0        __udivsi3                             # 1c1a: 01ceffc0
                                                               # 1c1e: 0000
            movi         a3, 0x00019000                        # 1c20: 31bfff
            extui        a2, a2, 0, 16                         # 1c23: 2020f4
            mull         a2, a2, a3                            # 1c26: 302282
            call0        sdk_wDev_Set_Beacon_Int               # 1c29: 01cbffc0
                                                               # 1c2d: 0000
            l32i         a4, a12, 100 /* [arg0+0x64] */        # 1c2f: 422c19
            bltui        a4, 2, .Lbr215                        # 1c32: b62433
            mov          a2, a14 /* [(local7)] */              # 1c35: 2d0e
            call0        strlen                                # 1c37: 01c9ffc0
                                                               # 1c3b: 0000
            bgeui        a2, 64, .Lbr215                       # 1c3d: f6d228
            l32i         a5, sp, 8 /* [(local2)] */            # 1c40: 5821
            bnei         a5, 1, .Lbr215                        # 1c42: 661523
            call0        sdk_system_overclock                  # 1c45: 050000
            mov          a2, a14 /* [(local7)] */              # 1c48: 2d0e
            l32i         a3, sp, 4 /* [(local1)] */            # 1c4a: 3811
            movi         a6, sdk_g_ic+0x2ed                    # 1c4c: 61b5ff
            movi         a7, 32 /* 0x00000020 */               # 1c4f: 2c07
            l16ui        a4, a13, 28 /* [sdk_g_ic+0x28a] */    # 1c51: 421d0e
            l16ui        a5, a13, 26 /* [sdk_g_ic+0x288] */    # 1c54: 521d0d
            slli         a4, a4, 16                            # 1c57: 004411
            or           a4, a4, a5                            # 1c5a: 504420
            movi         a5, 0x00001000                        # 1c5d: 51b1ff
            call0        sdk_pbkdf2_sha1                       # 1c60: 01c0ffc0
                                                               # 1c64: 0000
            call0        sdk_system_restoreclock               # 1c66: 050000
.Lbr215:    l32i         a5, sp, 0 /* [(local0)] */            # 1c69: 5801
            bnei         a5, 1, .Lbr216                        # 1c6b: 661505
            movi         a2, sdk_g_ic+0x1d8                    # 1c6e: 21aeff
            call0        sdk_wifi_param_save_protect           # 1c71: 050000
.Lbr216:    movi         a6, sdk_g_ic                          # 1c74: 61aeff
            l32i         a6, a6, 20 /* [sdk_g_ic+0x14] */      # 1c77: 6856
            beqz         a6, .Lbr217                           # 1c79: 8ca6
            call0        sdk_wifi_softap_stop                  # 1c7b: 01baffc0
                                                               # 1c7f: 0000
            call0        sdk_wifi_softap_start                 # 1c81: 01b9ffc0
                                                               # 1c85: 0000
.Lbr217:    movi         a2, 1 /* 0x00000001 */                # 1c87: 0c12
.Lbr218:    l32i         a12, sp, 16 /* [(local4)] */          # 1c89: c841
            l32i         a13, sp, 20 /* [(local5)] */          # 1c8b: d851
            l32i         a14, sp, 24 /* [(local6)] */          # 1c8d: e861
            l32i         a0, sp, 12 /* [(local3)] */           # 1c8f: 0831
            addi         sp, sp, 48 /* (top of frame) */       # 1c91: 12c130
            ret                                                # 1c94: 0df0
.Lbr219:    mov          a3, a12 /* arg0 */                    # 1c96: 3d0c
            movi         a4, 32 /* 0x00000020 */               # 1c98: 2c04
            s32i         a13, sp, 0 /* arg1 -> [(local0)] */   # 1c9a: d901
            movi         a2, sdk_g_ic+0x28c                    # 1c9c: 21a5ff
            s32i         a2, sp, 4 /* sdk_g_ic+0x28c -> [(local1)] */ # 1c9f: 2911
            call0        memcmp                                # 1ca1: 01b2ffc0
                                                               # 1ca5: 0000
            addi         a14, a12, 32 /* arg0+0x20 */          # 1ca7: e2cc20
            l32i         a13, a12, 100 /* [arg0+0x64] */       # 1caa: d22c19
            bnez         a2, .Lbr220                           # 1cad: dc02
            movi         a2, sdk_g_ic+0x2ac                    # 1caf: 21a1ff
            mov          a3, a14 /* arg0+0x20 */               # 1cb2: 3d0e
            movi         a4, 64 /* 0x00000040 */               # 1cb4: 4c04
            call0        memcmp                                # 1cb6: 01aeffc0
                                                               # 1cba: 0000
            s32i         a13, sp, 32 /* [arg0+0x64] -> [(local8)] */ # 1cbc: d981
            beqz         a2, .Lbr230                           # 1cbe: 167209
.Lbr220:    movi         a9, 1 /* 0x00000001 */                # 1cc1: 0c19
            s32i         a9, sp, 8 /* 0x00000001 -> [(local2)] */ # 1cc3: 9921
.Lbr221:    bltui        a13, 2, .Lbr223                       # 1cc5: b62d1b
            mov          a2, a14 /* arg0+0x20 */               # 1cc8: 2d0e
            call0        strlen                                # 1cca: 01aaffc0
                                                               # 1cce: 0000
            bgeui        a2, 8, .Lbr222                        # 1cd0: f68202
            j            .Lbr206                               # 1cd3: 46bdff
.Lbr222:    mov          a2, a14 /* arg0+0x20 */               # 1cd6: 2d0e
            call0        strlen                                # 1cd8: 01a8ffc0
                                                               # 1cdc: 0000
            bltui        a2, 64, .Lbr223                       # 1cde: b6d202
            j            .Lbr205                               # 1ce1: 46b5ff
.Lbr223:    l8ui         a11, a12, 0 /* [arg0] */              # 1ce4: b20c00
            movi         a0, 255 /* 0x000000ff */              # 1ce7: 02a0ff
            bne          a11, a0, .Lbr224                      # 1cea: 079b0e
            l8ui         a13, a12, 1 /* [arg0+0x1] */          # 1ced: d20c01
            bne          a13, a0, .Lbr224                      # 1cf0: 079d08
            call0        sdk_wifi_softap_set_default_ssid      # 1cf3: 050000
            movi         a13, sdk_g_ic+0x26e                   # 1cf6: d190ff
            j            .Lbr227                               # 1cf9: 060c00
.Lbr224:    l8ui         a0, a12, 96 /* [arg0+0x60] */         # 1cfc: 020c60
            bnez         a0, .Lbr225                           # 1cff: cc90
            mov          a2, a12 /* arg0 */                    # 1d01: 2d0c
            call0        strlen                                # 1d03: 019effc0
                                                               # 1d07: 0000
            extui        a0, a2, 0, 8                          # 1d09: 200074
.Lbr225:    movi         a13, sdk_g_ic+0x26e                   # 1d0c: d18cff
            movi         a8, 32 /* 0x00000020 */               # 1d0f: 2c08
            movi         a2, 33 /* 0x00000021 */               # 1d11: 2c12
            bltu         a0, a2, .Lbr226                       # 1d13: 273001
            mov          a0, a8 /* 0x00000020 */               # 1d16: 0d08
.Lbr226:    l32i         a2, sp, 4 /* [(local1)] */            # 1d18: 2811
            movi         a4, 32 /* 0x00000020 */               # 1d1a: 2c04
            extui        a3, a0, 16, 16                        # 1d1c: 0030f5
            s16i         a0, a13, 26 /* a0 -> [sdk_g_ic+0x288] */ # 1d1f: 025d0d
            s16i         a3, a13, 28 /* a3 -> [sdk_g_ic+0x28a] */ # 1d22: 325d0e
            mov          a3, a12 /* arg0 */                    # 1d25: 3d0c
            call0        memcpy                                # 1d27: 0196ffc0
                                                               # 1d2b: 0000
.Lbr227:    mov          a3, a14 /* arg0+0x20 */               # 1d2d: 3d0e
            movi         a4, 64 /* 0x00000040 */               # 1d2f: 4c04
            movi         a2, sdk_g_ic+0x2ac                    # 1d31: 2183ff
            s32i         a2, sp, 28 /* sdk_g_ic+0x2ac -> [(local7)] */ # 1d34: 2971
            call0        memcpy                                # 1d36: 0193ffc0
                                                               # 1d3a: 0000
            movi         a0, 0 /* 0x00000000 */                # 1d3c: 0c00
            s8i          a0, a13, 126 /* 0x00 -> [sdk_g_ic+0x2ec] */ # 1d3e: 024d7e
            l32i         a8, a12, 100 /* [arg0+0x64] */        # 1d41: 822c19
            l32i         a14, sp, 28 /* [(local7)] */          # 1d44: e871
            bgeui        a8, 5, .Lbr228                        # 1d46: f65804
            addi         a5, a8, -1 /* [arg0+0x64]-0x1 */      # 1d49: 0b58
            bnez         a5, .Lbr207                           # 1d4b: 5625e8
.Lbr228:    s8i          a0, a13, 160 /* 0x00 -> [sdk_g_ic+0x30e] */ # 1d4e: 024da0
            j            .Lbr208                               # 1d51: c69fff
.Lbr229:    mov          a0, a2 /* [arg0+0x6a] */              # 1d54: 0d02
            j            .Lbr214                               # 1d56: c6adff
.Lbr230:    movi         a13, sdk_g_ic+0x26e                   # 1d59: d17aff
            l32i         a8, sp, 32 /* [(local8)] */           # 1d5c: 8881
            l8ui         a0, a13, 160 /* [sdk_g_ic+0x30e] */   # 1d5e: 020da0
            beq          a8, a0, .Lbr232                       # 1d61: 071813
            mov          a13, a8 /* [(local8)] */              # 1d64: dd08
            bnez         a0, .Lbr231                           # 1d66: cc70
            beqi         a8, 2, .Lbr234                        # 1d68: 26283f
            beqi         a8, 3, .Lbr234                        # 1d6b: 26383c
            beqi         a8, 4, .Lbr234                        # 1d6e: 264839
.Lbr231:    movi         a6, 0 /* 0x00000000 */                # 1d71: 0c06
            s32i         a6, sp, 8 /* 0x00000000 -> [(local2)] */ # 1d73: 6921
            j            .Lbr221                               # 1d75: 06d3ff
.Lbr232:    l8ui         a9, a13, 159 /* [sdk_g_ic+0x30d] */   # 1d78: 920d9f
            l8ui         a7, a12, 97 /* [arg0+0x61] */         # 1d7b: 720c61
            bne          a7, a9, .Lbr233                       # 1d7e: 979720
            l8ui         a11, a13, 162 /* [sdk_g_ic+0x310] */  # 1d81: b20da2
            l8ui         a10, a12, 105 /* [arg0+0x69] */       # 1d84: a20c69
            bne          a10, a11, .Lbr233                     # 1d87: b79a17
            l8ui         a2, a13, 161 /* [sdk_g_ic+0x30f] */   # 1d8a: 220da1
            l8ui         a0, a12, 104 /* [arg0+0x68] */        # 1d8d: 020c68
            bne          a0, a2, .Lbr233                       # 1d90: 27900e
            movi         a4, sdk_g_ic+0x446                    # 1d93: 416dff
            l16ui        a3, a12, 106 /* [arg0+0x6a] */        # 1d96: 321c35
            l16ui        a4, a4, 254 /* [sdk_g_ic+0x544] */    # 1d99: 42147f
            sub          a3, a3, a4                            # 1d9c: 4033c0
            beqz         a3, .Lbr217                           # 1d9f: 1643ee
.Lbr233:    l32i         a13, sp, 32 /* [(local8)] */          # 1da2: d881
            movi         a5, 0 /* 0x00000000 */                # 1da4: 0c05
            s32i         a5, sp, 8 /* 0x00000000 -> [(local2)] */ # 1da6: 5921
            j            .Lbr221                               # 1da8: 46c6ff
.Lbr234:    movi         a6, 1 /* 0x00000001 */                # 1dab: 0c16
            s32i         a6, sp, 8 /* 0x00000001 -> [(local2)] */ # 1dad: 6921
            j            .Lbr221                               # 1daf: 86c4ff

            .balign      4
# Function @ .irom0.text+0x1db4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_softap_set_config
            .type        sdk_wifi_softap_set_config, @function
sdk_wifi_softap_set_config:
            movi         a3, 1 /* 0x00000001 */                # 1db4: 0c13
            addi         sp, sp, -16 /* (local0) */            # 1db6: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1db9: 0901
            call0        .Lfunc014                             # 1dbb: c5dcff
            l32i         a0, sp, 0 /* [(local0)] */            # 1dbe: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1dc0: 12c110
            ret                                                # 1dc3: 0df0

            .balign      4
# Function @ .irom0.text+0x1dc8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_softap_set_config_current
            .type        sdk_wifi_softap_set_config_current, @function
sdk_wifi_softap_set_config_current:
            movi         a3, 0 /* 0x00000000 */                # 1dc8: 0c03
            addi         sp, sp, -16 /* (local0) */            # 1dca: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1dcd: 0901
            call0        .Lfunc014                             # 1dcf: 85dbff
            l32i         a0, sp, 0 /* [(local0)] */            # 1dd2: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1dd4: 12c110
            ret                                                # 1dd7: 0df0

            .literal_position                                  # 1ddc: 00000000
                                                               # 1de0: 00000000
                                                               # 1de4: 00000000

# Function @ .irom0.text+0x1de8
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
            .global      sdk_wifi_softap_set_station_info
            .type        sdk_wifi_softap_set_station_info, @function
sdk_wifi_softap_set_station_info:
            addi         sp, sp, -32 /* (local0) */            # 1de8: 12c1e0
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   # 1deb: d941
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      # 1ded: 0921
            s32i         a15, sp, 24 /* a15 -> [(local6)] */   # 1def: f961
            movi         a15, sdk_g_ic+0x280                   # 1df1: f1faff
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   # 1df4: c931
            l8ui         a15, a15, 144 /* [sdk_g_ic+0x310] */  # 1df6: f20f90
            s32i         a14, sp, 20 /* a14 -> [(local5)] */   # 1df9: e951
            addi         a15, a15, 2 /* [sdk_g_ic+0x310]+0x2 */ # 1dfb: 2bff
            blti         a15, 2, .Lbr237                       # 1dfd: a62f34
            movi         a12, 1 /* 0x00000001 */               # 1e00: 0c1c
            movi         a14, sdk_g_ic                         # 1e02: e1f7ff
            s32i         a3, sp, 4 /* arg1 -> [(local1)] */    # 1e05: 3911
            l32i         a14, a14, 20 /* [sdk_g_ic+0x14] */    # 1e07: e85e
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    # 1e09: 2901
.Lbr235:    addx4        a13, a12, a14                         # 1e0b: e0dca0
            l32i         a13, a13, 144                         # 1e0e: d22d24
            beqz         a13, .Lbr236                          # 1e11: 9c8d
            l32i         a2, sp, 0 /* [(local0)] */            # 1e13: 2801
            mov          a3, a13                               # 1e15: 3d0d
            movi         a4, 6 /* 0x00000006 */                # 1e17: 0c64
            call0        memcmp                                # 1e19: 01f2ffc0
                                                               # 1e1d: 0000
            bnez         a2, .Lbr236                           # 1e1f: cca2
            l32i         a14, sp, 4 /* [(local1)] */           # 1e21: e811
            movi         a2, 1 /* 0x00000001 */                # 1e23: 0c12
            l32i         a14, a14, 0 /* [[(local1)]] */        # 1e25: e80e
            s32i         a14, a13, 0x10c                       # 1e27: e26d43
            j            .Lbr238                               # 1e2a: 460200
.Lbr236:    addi         a12, a12, 1                           # 1e2d: 1bcc
            extui        a12, a12, 0, 8                        # 1e2f: c0c074
            bne          a15, a12, .Lbr235                     # 1e32: c79fd5
.Lbr237:    movi         a2, 0 /* 0x00000000 */                # 1e35: 0c02
.Lbr238:    l32i         a12, sp, 12 /* [(local3)] */          # 1e37: c831
            l32i         a13, sp, 16 /* [(local4)] */          # 1e39: d841
            l32i         a14, sp, 20 /* [(local5)] */          # 1e3b: e851
            l32i         a15, sp, 24 /* [(local6)] */          # 1e3d: f861
            l32i         a0, sp, 8 /* [(local2)] */            # 1e3f: 0821
            addi         sp, sp, 32 /* (top of frame) */       # 1e41: 12c120
            ret                                                # 1e44: 0df0

            .literal_position                                  # 1e48: 00000000
                                                               # 1e4c: 00000000
                                                               # 1e50: 00000000
                                                               # 1e54: 00000000
                                                               # 1e58: 00000000
                                                               # 1e5c: 00000000
                                                               # 1e60: 00000000

# Function @ .irom0.text+0x1e64
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_softap_get_station_info
            .type        sdk_wifi_softap_get_station_info, @function
sdk_wifi_softap_get_station_info:
            addi         sp, sp, -32 /* (local0) */            # 1e64: 12c1e0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 1e67: c911
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   # 1e69: e931
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1e6b: 0901
            movi         a0, sdk_g_ic                          # 1e6d: 01f6ff
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 1e70: d921
            l32i         a13, a0, 20 /* [sdk_g_ic+0x14] */     # 1e72: d850
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   # 1e74: f941
            bnez         a13, .Lbr239                          # 1e76: cc3d
            movi         a2, 0 /* 0x00000000 */                # 1e78: 0c02
            j            .Lbr243                               # 1e7a: 461900
.Lbr239:    movi         a2, sdk_g_ic+0x188                    # 1e7d: 21f3ff
            movi         a5, sdk_g_ic+0x280                    # 1e80: 51f4ff
            s32i         a2, a0, 0x18c /* sdk_g_ic+0x188 -> [sdk_g_ic+0x18c] */ # 1e83: 226063
            movi         a2, 0 /* 0x00000000 */                # 1e86: 0c02
            l8ui         a7, a5, 144 /* [sdk_g_ic+0x310] */    # 1e88: 720590
            s32i         a2, a0, 0x188 /* 0x00000000 -> [sdk_g_ic+0x188] */ # 1e8b: 226062
            addi         a6, a7, 2 /* [sdk_g_ic+0x310]+0x2 */  # 1e8e: 2b67
            blti         a6, 2, .Lbr243                        # 1e90: a6264f
            movi         a12, 1 /* 0x00000001 */               # 1e93: 0c1c
.Lbr240:    addx4        a14, a12, a13                         # 1e95: d0eca0
            l32i         a4, a14, 144                          # 1e98: 422e24
            beqz         a4, .Lbr242                           # 1e9b: bc94
            l32i         a3, a4, 0x10c                         # 1e9d: 322443
            beqz         a3, .Lbr241                           # 1ea0: bc23
            movi         a2, 16 /* 0x00000010 */               # 1ea2: 1c02
            call0        zalloc                                # 1ea4: 01eeffc0
                                                               # 1ea8: 0000
            l32i         a3, a14, 144                          # 1eaa: 322e24
            mov          a15, a2                               # 1ead: fd02
            movi         a4, 6 /* 0x00000006 */                # 1eaf: 0c64
            addi         a2, a2, 4                             # 1eb1: 4b22
            call0        memcpy                                # 1eb3: 01ebffc0
                                                               # 1eb7: 0000
            movi         a2, 0 /* 0x00000000 */                # 1eb9: 0c02
            l32i         a5, a14, 144                          # 1ebb: 522e24
            movi         a0, sdk_g_ic                          # 1ebe: 01e5ff
            l32i         a5, a5, 0x10c                         # 1ec1: 522543
            l32i         a4, a0, 0x18c /* [sdk_g_ic+0x18c] */  # 1ec4: 422063
            s32i         a2, a15, 0                            # 1ec7: 290f
            s32i         a5, a15, 12                           # 1ec9: 593f
            movi         a5, sdk_g_ic+0x280                    # 1ecb: 51e3ff
            s32i         a15, a4, 0 /* a15 -> [[sdk_g_ic+0x18c]] */ # 1ece: f904
            l8ui         a7, a5, 144 /* [sdk_g_ic+0x310] */    # 1ed0: 720590
            s32i         a15, a0, 0x18c /* a15 -> [sdk_g_ic+0x18c] */ # 1ed3: f26063
.Lbr241:    addi         a6, a7, 2 /* [sdk_g_ic+0x310]+0x2 */  # 1ed6: 2b67
.Lbr242:    addi         a12, a12, 1                           # 1ed8: 1bcc
            extui        a12, a12, 0, 8                        # 1eda: c0c074
            blt          a12, a6, .Lbr240                      # 1edd: 672cb4
            l32i         a2, a0, 0x188 /* [sdk_g_ic+0x188] */  # 1ee0: 222062
.Lbr243:    l32i         a12, sp, 4 /* [(local1)] */           # 1ee3: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 1ee5: d821
            l32i         a14, sp, 12 /* [(local3)] */          # 1ee7: e831
            l32i         a15, sp, 16 /* [(local4)] */          # 1ee9: f841
            l32i         a0, sp, 0 /* [(local0)] */            # 1eeb: 0801
            addi         sp, sp, 32 /* (top of frame) */       # 1eed: 12c120
            ret                                                # 1ef0: 0df0

            .literal_position                                  # 1ef4: 00000000
                                                               # 1ef8: 00000000
                                                               # 1efc: 00000000

# Function @ .irom0.text+0x1f00
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_wifi_softap_free_station_info
            .type        sdk_wifi_softap_free_station_info, @function
sdk_wifi_softap_free_station_info:
            addi         sp, sp, -16 /* (local0) */            # 1f00: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1f03: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 1f05: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 1f07: c911
            movi         a12, sdk_g_ic                         # 1f09: c1fbff
            movi         a13, sdk_g_ic+0x188                   # 1f0c: d1faff
.Lbr244:    l32i         a2, a12, 0x188 /* [sdk_g_ic+0x188] */ # 1f0f: 222c62
            beqz         a2, .Lbr246                           # 1f12: 9c12
            l32i         a0, a2, 0 /* [[sdk_g_ic+0x188]] */    # 1f14: 0802
            s32i         a0, a12, 0x188 /* [[sdk_g_ic+0x188]] -> [sdk_g_ic+0x188] */ # 1f16: 026c62
            bnez         a0, .Lbr245                           # 1f19: cc10
            s32i         a13, a12, 0x18c /* sdk_g_ic+0x188 -> [sdk_g_ic+0x18c] */ # 1f1b: d26c63
.Lbr245:    call0        free                                  # 1f1e: 01f7ffc0
                                                               # 1f22: 0000
            j            .Lbr244                               # 1f24: c6f9ff
.Lbr246:    l32i         a12, sp, 4 /* [(local1)] */           # 1f27: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 1f29: d821
            l32i         a0, sp, 0 /* [(local0)] */            # 1f2b: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 1f2d: 12c110
            ret           /* [sdk_g_ic+0x188] */               # 1f30: 0df0

            .literal_position                                  # 1f34: 00000000
                                                               # 1f38: 94010000
                                                               # 1f3c: 00000000
                                                               # 1f40: 00000000
                                                               # 1f44: 00000000
                                                               # 1f48: 00000000
                                                               # 1f4c: 00000000
                                                               # 1f50: 00000000
                                                               # 1f54: 00000000

# Function @ .irom0.text+0x1f58
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wifi_softap_deauth
            .type        sdk_wifi_softap_deauth, @function
sdk_wifi_softap_deauth:
            addi         sp, sp, -32 /* (local0) */            # 1f58: 12c1e0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 1f5b: c911
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   # 1f5d: f941
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 1f5f: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 1f61: d921
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   # 1f63: e931
            movi         a13, sdk_g_ic                         # 1f65: d1f3ff
            mov          a14, a2 /* arg0 */                    # 1f68: ed02
            l32i         a13, a13, 20 /* [sdk_g_ic+0x14] */    # 1f6a: d85d
            call0        sdk_wifi_get_opmode                   # 1f6c: 050000
            addi         a15, a2, -1                           # 1f6f: 0bf2
            beqz         a15, .Lbr255                          # 1f71: 16cf08
            beqz         a13, .Lbr255                          # 1f74: 169d08
            addi         a2, a13, 64 /* [sdk_g_ic+0x14]+0x40 */ # 1f77: 22cd40
            l32i         a12, a13, 136 /* [[sdk_g_ic+0x14]+0x88] */ # 1f7a: c22d22
            l32i         a0, a13, 144 /* [[sdk_g_ic+0x14]+0x90] */ # 1f7d: 022d24
            s32i         a0, a13, 136 /* [[sdk_g_ic+0x14]+0x90] -> [[sdk_g_ic+0x14]+0x88] */ # 1f80: 026d22
            bnez         a14, .Lbr247                          # 1f83: ccce
            movi         a3, .Label007                         # 1f85: 31ecff
            movi         a4, 6 /* 0x00000006 */                # 1f88: 0c64
            call0        memcpy                                # 1f8a: 01eeffc0
                                                               # 1f8e: 0000
            j            .Lbr248                               # 1f90: 460200
.Lbr247:    mov          a3, a14 /* arg0 */                    # 1f93: 3d0e
            movi         a4, 6 /* 0x00000006 */                # 1f95: 0c64
            call0        memcpy                                # 1f97: 01ecffc0
                                                               # 1f9b: 0000
.Lbr248:    mov          a2, a13 /* [sdk_g_ic+0x14] */         # 1f9d: 2d0d
            movi         a3, 192 /* 0x000000c0 */              # 1f9f: 32a0c0
            movi         a4, 2 /* 0x00000002 */                # 1fa2: 0c24
            call0        sdk_ieee80211_send_mgmt               # 1fa4: 01eaffc0
                                                               # 1fa8: 0000
            movi         a0, sdk_g_ic+0x280                    # 1faa: 01e4ff
            s32i         a12, a13, 136 /* [[sdk_g_ic+0x14]+0x88] -> [[sdk_g_ic+0x14]+0x88] */ # 1fad: c26d22
            l8ui         a0, a0, 144 /* [sdk_g_ic+0x310] */    # 1fb0: 020090
            movi         a12, 1 /* 0x00000001 */               # 1fb3: 0c1c
            addi         a2, a0, 2 /* [sdk_g_ic+0x310]+0x2 */  # 1fb5: 2b20
            blti         a2, 2, .Lbr253                        # 1fb7: a62235
.Lbr249:    addx4        a15, a12, a13                         # 1fba: d0fca0
            l32i         a15, a15, 144                         # 1fbd: f22f24
            beqz         a15, .Lbr252                          # 1fc0: ac4f
            s32i         a0, sp, 20 /* a0 -> [(local5)] */     # 1fc2: 0951
            beqz         a14, .Lbr250                          # 1fc4: 8cee
            mov          a2, a14 /* arg0 */                    # 1fc6: 2d0e
            mov          a3, a15                               # 1fc8: 3d0f
            movi         a4, 6 /* 0x00000006 */                # 1fca: 0c64
            call0        memcmp                                # 1fcc: 01e1ffc0
                                                               # 1fd0: 0000
            l32i         a0, sp, 20 /* [(local5)] */           # 1fd2: 0851
            bnez         a2, .Lbr251                           # 1fd4: cce2
.Lbr250:    mov          a3, a15                               # 1fd6: 3d0f
            mov          a2, a13 /* [sdk_g_ic+0x14] */         # 1fd8: 2d0d
            call0        sdk_cnx_node_leave                    # 1fda: 01deffc0
                                                               # 1fde: 0000
            movi         a0, sdk_g_ic+0x280                    # 1fe0: 01d8ff
            l8ui         a0, a0, 144 /* [sdk_g_ic+0x310] */    # 1fe3: 020090
.Lbr251:    addi         a2, a0, 2                             # 1fe6: 2b20
.Lbr252:    addi         a12, a12, 1                           # 1fe8: 1bcc
            extui        a12, a12, 0, 8                        # 1fea: c0c074
            blt          a12, a2, .Lbr249                      # 1fed: 272cc9
.Lbr253:    movi         a2, 1 /* 0x00000001 */                # 1ff0: 0c12
.Lbr254:    l32i         a12, sp, 4 /* [(local1)] */           # 1ff2: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 1ff4: d821
            l32i         a14, sp, 12 /* [(local3)] */          # 1ff6: e831
            l32i         a15, sp, 16 /* [(local4)] */          # 1ff8: f841
            l32i         a0, sp, 0 /* [(local0)] */            # 1ffa: 0801
            addi         sp, sp, 32 /* (top of frame) */       # 1ffc: 12c120
            ret                                                # 1fff: 0df0
.Lbr255:    movi         a2, 0 /* 0x00000000 */                # 2001: 0c02
            j            .Lbr254                               # 2003: c6faff

            .literal_position                                  # 2008: 00000000

# Function @ .irom0.text+0x200c
            .balign      4
            .global      sdk_wifi_get_phy_mode
            .type        sdk_wifi_get_phy_mode, @function
sdk_wifi_get_phy_mode:
            movi         a2, sdk_g_ic+0x234                    # 200c: 21ffff
            l32i         a2, a2, 0x2e8 /* [sdk_g_ic+0x51c] */  # 200f: 2222ba
            ret           /* [sdk_g_ic+0x51c] */               # 2012: 0df0

            .literal_position                                  # 2014: 00000000
                                                               # 2018: 00000000
                                                               # 201c: 00000000
                                                               # 2020: 00000000
                                                               # 2024: 00000000
                                                               # 2028: 00000000
                                                               # 202c: 00000000
                                                               # 2030: 00000000
                                                               # 2034: 00000000
                                                               # 2038: 00000000
                                                               # 203c: 00000000

# Function @ .irom0.text+0x2040
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_wifi_set_phy_mode
            .type        sdk_wifi_set_phy_mode, @function
sdk_wifi_set_phy_mode:
            addi         sp, sp, -16 /* (local0) */            # 2040: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    # 2043: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 2045: 0911
            mov          a12, a2 /* arg0 */                    # 2047: cd02
            beqz         a2, .Lbr263                           # 2049: 160208
            bgeui        a2, 4, .Lbr263                        # 204c: f6427d
            movi         a0, sdk_g_ic+0x200                    # 204f: 01f1ff
            l32i         a0, a0, 0x31c /* [sdk_g_ic+0x51c] */  # 2052: 0220c7
            beq          a0, a2, .Lbr261                       # 2055: 271069
            call0        sdk_wifi_get_opmode                   # 2058: 050000
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      # 205b: 2901
            movi         a2, sdk_g_ic+0x200                    # 205d: 21eeff
            s32i         a12, a2, 0x31c /* arg0 -> [sdk_g_ic+0x51c] */ # 2060: c262c7
            addi         a2, a2, -40 /* sdk_g_ic+0x1d8 */      # 2063: 22c2d8
            call0        sdk_wifi_param_save_protect           # 2066: 050000
            movi         a3, sdk_user_init_flag                # 2069: 31ecff
            l8ui         a3, a3, 0 /* [sdk_user_init_flag] */  # 206c: 320300
            bnei         a3, 1, .Lbr256                        # 206f: 66130b
            call0        sdk_wifi_station_stop                 # 2072: 01edffc0
                                                               # 2076: 0000
            call0        sdk_wifi_softap_stop                  # 2078: 01edffc0
                                                               # 207c: 0000
.Lbr256:    mov          a2, a12 /* arg0 */                    # 207e: 2d0c
            call0        sdk_ieee80211_phy_init                # 2080: 01ecffc0
                                                               # 2084: 0000
            movi         a5, sdk_g_ic+0x200                    # 2086: 51e6ff
            movi         a4, 0 /* 0x00000000 */                # 2089: 0c04
            s32i         a4, a5, 0x30c /* 0x00000000 -> [sdk_g_ic+0x50c] */ # 208b: 4265c3
            bnei         a12, 3, .Lbr257                       # 208e: 663c08
            addmi        a2, a5, -512 /* sdk_g_ic */           # 2091: 22d5fe
            call0        sdk_ieee80211_ht_attach               # 2094: 01e8ffc0
                                                               # 2098: 0000
.Lbr257:    movi         a6, sdk_user_init_flag                # 209a: 61e2ff
            l32i         a7, sp, 0 /* [(local0)] */            # 209d: 7801
            l8ui         a6, a6, 0 /* [sdk_user_init_flag] */  # 209f: 620600
            mov          a12, a7 /* [(local0)] */              # 20a2: cd07
            bnei         a6, 1, .Lbr261                        # 20a4: 66161a
            beqi         a7, 1, .Lbr258                        # 20a7: 261702
            bnei         a7, 3, .Lbr259                        # 20aa: 663708
.Lbr258:    call0        sdk_wifi_station_start                # 20ad: 01e2ffc0
                                                               # 20b1: 0000
            call0        sdk_wifi_station_connect              # 20b3: 050000
.Lbr259:    beqi         a12, 2, .Lbr260                       # 20b6: 262c02
            bnei         a12, 3, .Lbr261                       # 20b9: 663c05
.Lbr260:    call0        sdk_wifi_softap_start                 # 20bc: 01e0ffc0
                                                               # 20c0: 0000
.Lbr261:    movi         a2, 1 /* 0x00000001 */                # 20c2: 0c12
.Lbr262:    l32i         a12, sp, 8 /* [(local2)] */           # 20c4: c821
            l32i         a0, sp, 4 /* [(local1)] */            # 20c6: 0811
            addi         sp, sp, 16 /* (top of frame) */       # 20c8: 12c110
            ret                                                # 20cb: 0df0
.Lbr263:    movi         a2, 0 /* 0x00000000 */                # 20cd: 0c02
            j            .Lbr262                               # 20cf: 46fcff

            .literal_position                                  # 20d4: 00000000

# Function @ .irom0.text+0x20d8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_set_sleep_type
            .type        sdk_wifi_set_sleep_type, @function
sdk_wifi_set_sleep_type:
            addi         sp, sp, -16 /* (local0) */            # 20d8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 20db: 0901
            bltui        a2, 3, .Lbr264                        # 20dd: b63204
            movi         a2, 0 /* 0x00000000 */                # 20e0: 0c02
            j            .Lbr265                               # 20e2: 860200
.Lbr264:    extui        a2, a2, 0, 8                          # 20e5: 202074
            call0        sdk_pm_set_sleep_type_from_upper      # 20e8: 01fbffc0
                                                               # 20ec: 0000
            movi         a2, 1 /* 0x00000001 */                # 20ee: 0c12
.Lbr265:    l32i         a0, sp, 0 /* [(local0)] */            # 20f0: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 20f2: 12c110
            ret                                                # 20f5: 0df0

            .balign      4
# Function @ .irom0.text+0x20f8
            .balign      4
            .global      sdk_wifi_get_sleep_type
            .type        sdk_wifi_get_sleep_type, @function
sdk_wifi_get_sleep_type:
            ret           /* arg0 */                           # 20f8: 0df0

            .literal_position                                  # 20fc: 00000000

# Function @ .irom0.text+0x2100
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_get_channel
            .type        sdk_wifi_get_channel, @function
sdk_wifi_get_channel:
            addi         sp, sp, -16 /* (local0) */            # 2100: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 2103: 0901
            call0        sdk_chm_get_current_channel           # 2105: 01fdffc0
                                                               # 2109: 0000
            l8ui         a2, a2, 6                             # 210b: 220206
            l32i         a0, sp, 0 /* [(local0)] */            # 210e: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 2110: 12c110
            ret                                                # 2113: 0df0

            .literal_position                                  # 2118: 00000000
                                                               # 211c: 00000000

# Function @ .irom0.text+0x2120
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_set_channel
            .type        sdk_wifi_set_channel, @function
sdk_wifi_set_channel:
            addi         sp, sp, -16 /* (local0) */            # 2120: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 2123: 0901
            movi         a0, 14 /* 0x0000000e */               # 2125: 0ce0
            bgeu         a0, a2, .Lbr266                       # 2127: 27b004
            movi         a2, 0 /* 0x00000000 */                # 212a: 0c02
            j            .Lbr267                               # 212c: c60400
.Lbr266:    movi         a3, sdk_g_ic                          # 212f: 31faff
            addx2        a2, a2, a2                            # 2132: 202290
            addx4        a2, a2, a3                            # 2135: 3022a0
            addi         a2, a2, 120                           # 2138: 22c278
            call0        sdk_chm_set_current_channel           # 213b: 01f8ffc0
                                                               # 213f: 0000
            movi         a2, 1 /* 0x00000001 */                # 2141: 0c12
.Lbr267:    l32i         a0, sp, 0 /* [(local0)] */            # 2143: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 2145: 12c110
            ret                                                # 2148: 0df0

            .literal_position                                  # 214c: 00fef13f
                                                               # 2150: 00000000

# Function @ .irom0.text+0x2154
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_wifi_promiscuous_set_mac
            .type        sdk_wifi_promiscuous_set_mac, @function
sdk_wifi_promiscuous_set_mac:
            addi         sp, sp, -16 /* (local0) */            # 2154: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 2157: 0901
            mov          a3, a2 /* arg0 */                     # 2159: 3d02
            movi         a8, 1 /* 0x00000001 */                # 215b: 0c18
            movi         a2, 0x3ff1fe00                        # 215d: 21fbff
            memw                                               # 2160: c02000
            l32i         a7, a2, 0x26c /* [0x3ff2006c] */      # 2163: 72229b
            or           a7, a7, a8                            # 2166: 807720
            memw                                               # 2169: c02000
            s32i         a7, a2, 0x26c /* a7 -> [0x3ff2006c] */ # 216c: 72629b
            movi         a6, 2 /* 0x00000002 */                # 216f: 0c26
            memw                                               # 2171: c02000
            l32i         a5, a2, 0x26c /* [0x3ff2006c] */      # 2174: 52229b
            or           a5, a5, a6                            # 2177: 605520
            memw                                               # 217a: c02000
            s32i         a5, a2, 0x26c /* a5 -> [0x3ff2006c] */ # 217d: 52629b
            movi         a4, 4 /* 0x00000004 */                # 2180: 0c44
            memw                                               # 2182: c02000
            l32i         a0, a2, 0x26c /* [0x3ff2006c] */      # 2185: 02229b
            or           a0, a0, a4                            # 2188: 400020
            memw                                               # 218b: c02000
            s32i         a0, a2, 0x26c /* a0 -> [0x3ff2006c] */ # 218e: 02629b
            movi         a2, 0 /* 0x00000000 */                # 2191: 0c02
            call0        sdk_wDev_SetMacAddress                # 2193: 01efffc0
                                                               # 2197: 0000
            l32i         a0, sp, 0 /* [(local0)] */            # 2199: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 219b: 12c110
            ret                                                # 219e: 0df0

            .literal_position                                  # 21a0: 00fef13f
                                                               # 21a4: 00000000
                                                               # 21a8: 00000000
                                                               # 21ac: 00000000
                                                               # 21b0: 00000000
                                                               # 21b4: 00000000
                                                               # 21b8: 00000000
                                                               # 21bc: 00000000
                                                               # 21c0: 00000000
                                                               # 21c4: 00000000
                                                               # 21c8: 00000000

# Function @ .irom0.text+0x21cc
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wifi_promiscuous_enable
            .type        sdk_wifi_promiscuous_enable, @function
sdk_wifi_promiscuous_enable:
            addi         sp, sp, -16 /* (local0) */            # 21cc: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 21cf: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 21d1: 0901
            movi         a12, 0x3ff1fe00                       # 21d3: c1f3ff
            beqz         a2, .Lbr268                           # 21d6: 16f204
            call0        sdk_wDevDisableRx                     # 21d9: 01f5ffc0
                                                               # 21dd: 0000
            movi         a11, -2 /* 0xfffffffe */              # 21df: 7ceb
            memw                                               # 21e1: c02000
            l32i         a10, a12, 0x26c /* [0x3ff2006c] */    # 21e4: a22c9b
            and          a10, a10, a11                         # 21e7: b0aa10
            memw                                               # 21ea: c02000
            s32i         a10, a12, 0x26c /* a10 -> [0x3ff2006c] */ # 21ed: a26c9b
            movi         a9, -3 /* 0xfffffffd */               # 21f0: 7cd9
            memw                                               # 21f2: c02000
            l32i         a8, a12, 0x26c /* [0x3ff2006c] */     # 21f5: 822c9b
            and          a8, a8, a9                            # 21f8: 908810
            memw                                               # 21fb: c02000
            s32i         a8, a12, 0x26c /* a8 -> [0x3ff2006c] */ # 21fe: 826c9b
            movi         a7, -5 /* 0xfffffffb */               # 2201: 7cb7
            memw                                               # 2203: c02000
            l32i         a6, a12, 0x26c /* [0x3ff2006c] */     # 2206: 622c9b
            and          a6, a6, a7                            # 2209: 706610
            memw                                               # 220c: c02000
            s32i         a6, a12, 0x26c /* a6 -> [0x3ff2006c] */ # 220f: 626c9b
            movi         a5, sdk_g_ic+0x180                    # 2212: 51e4ff
            movi         a4, 1 /* 0x00000001 */                # 2215: 0c14
            s8i          a4, a5, 84 /* 0x01 -> [sdk_g_ic+0x1d4] */ # 2217: 424554
            call0        sdk_wdev_go_sniffer                   # 221a: 01e6ffc0
                                                               # 221e: 0000
            call0        sdk_wDevEnableRx                      # 2220: 01e6ffc0
                                                               # 2224: 0000
            j            .Lbr269                               # 2226: c61500
.Lbr268:    call0        sdk_wDevDisableRx                     # 2229: 01e4ffc0
                                                               # 222d: 0000
            call0        sdk_wdev_exit_sniffer                 # 222f: 01e4ffc0
                                                               # 2233: 0000
            memw                                               # 2235: c02000
            l32i         a5, a12, 0x26c /* [0x3ff2006c] */     # 2238: 522c9b
            movi         a6, 1 /* 0x00000001 */                # 223b: 0c16
            or           a5, a5, a6                            # 223d: 605520
            memw                                               # 2240: c02000
            s32i         a5, a12, 0x26c /* a5 -> [0x3ff2006c] */ # 2243: 526c9b
            movi         a4, 2 /* 0x00000002 */                # 2246: 0c24
            memw                                               # 2248: c02000
            l32i         a3, a12, 0x26c /* [0x3ff2006c] */     # 224b: 322c9b
            or           a3, a3, a4                            # 224e: 403320
            memw                                               # 2251: c02000
            s32i         a3, a12, 0x26c /* a3 -> [0x3ff2006c] */ # 2254: 326c9b
            movi         a2, 4 /* 0x00000004 */                # 2257: 0c42
            memw                                               # 2259: c02000
            l32i         a0, a12, 0x26c /* [0x3ff2006c] */     # 225c: 022c9b
            or           a0, a0, a2                            # 225f: 200020
            memw                                               # 2262: c02000
            movi         a2, 0 /* 0x00000000 */                # 2265: 0c02
            movi         a3, sdk_info+0x1e                     # 2267: 31d0ff
            s32i         a0, a12, 0x26c /* a0 -> [0x3ff2006c] */ # 226a: 026c9b
            call0        sdk_wDev_SetMacAddress                # 226d: 01d5ffc0
                                                               # 2271: 0000
            movi         a8, sdk_g_ic+0x180                    # 2273: 81ceff
            movi         a7, 0 /* 0x00000000 */                # 2276: 0c07
            s8i          a7, a8, 84 /* 0x00 -> [sdk_g_ic+0x1d4] */ # 2278: 724854
            call0        sdk_wDevEnableRx                      # 227b: 01d3ffc0
                                                               # 227f: 0000
.Lbr269:    l32i         a12, sp, 4 /* [(local1)] */           # 2281: c811
            l32i         a0, sp, 0 /* [(local0)] */            # 2283: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 2285: 12c110
            ret                                                # 2288: 0df0

            .literal_position                                  # 228c: 00000000

# Function @ .irom0.text+0x2290
            .balign      4
            .global      sdk_wifi_set_promiscuous_rx_cb
            .type        sdk_wifi_set_promiscuous_rx_cb, @function
sdk_wifi_set_promiscuous_rx_cb:
            movi         a3, .Ldata001                         # 2290: 31ffff
            s32i         a2, a3, 0x11c /* arg0 -> [sdk_promiscuous_cb] */ # 2293: 226347
            ret           /* arg0 */                           # 2296: 0df0

            .literal_position                                  # 2298: 00000000
                                                               # 229c: 00000000
                                                               # 22a0: 00000000

# Function @ .irom0.text+0x22a4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_wifi_get_ip_info
            .type        sdk_wifi_get_ip_info, @function
sdk_wifi_get_ip_info:
            addi         sp, sp, -16 /* (local0) */            # 22a4: 12c1f0
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 22a7: d921
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 22a9: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 22ab: c911
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   # 22ad: e931
            mov          a12, a3 /* arg1 */                    # 22af: cd03
            mov          a14, a2 /* arg0 */                    # 22b1: ed02
            call0        .Lfunc005                             # 22b3: 4599fe
            mov          a13, a2                               # 22b6: dd02
            bgeui        a14, 2, .Lbr273                       # 22b8: f62e41
            beqz         a12, .Lbr273                          # 22bb: bcec
            beqz         a2, .Lbr270                           # 22bd: ac52
            mov          a2, a12 /* arg1 */                    # 22bf: 2d0c
            addi         a3, a13, 4                            # 22c1: 4b3d
            movi         a4, 4 /* 0x00000004 */                # 22c3: 0c44
            call0        memcpy                                # 22c5: 01f4ffc0
                                                               # 22c9: 0000
            addi         a2, a12, 4 /* arg1+0x4 */             # 22cb: 4b2c
            addi         a3, a13, 8                            # 22cd: 8b3d
            movi         a4, 4 /* 0x00000004 */                # 22cf: 0c44
            call0        memcpy                                # 22d1: 01f2ffc0
                                                               # 22d5: 0000
            addi         a2, a12, 8 /* arg1+0x8 */             # 22d7: 8b2c
            addi         a3, a13, 12                           # 22d9: cb3d
            movi         a4, 4 /* 0x00000004 */                # 22db: 0c44
            call0        memcpy                                # 22dd: 01f0ffc0
                                                               # 22e1: 0000
            j            .Lbr271                               # 22e3: c60100
.Lbr270:    movi         a0, 0 /* 0x00000000 */                # 22e6: 0c00
            s32i         a0, a12, 0 /* 0x00000000 -> [arg1] */ # 22e8: 090c
            s32i         a0, a12, 4 /* 0x00000000 -> [arg1+0x4] */ # 22ea: 091c
            s32i         a0, a12, 8 /* 0x00000000 -> [arg1+0x8] */ # 22ec: 092c
.Lbr271:    movi         a2, 1 /* 0x00000001 */                # 22ee: 0c12
.Lbr272:    l32i         a12, sp, 4 /* [(local1)] */           # 22f0: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 22f2: d821
            l32i         a14, sp, 12 /* [(local3)] */          # 22f4: e831
            l32i         a0, sp, 0 /* [(local0)] */            # 22f6: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 22f8: 12c110
            ret                                                # 22fb: 0df0
.Lbr273:    movi         a2, 0 /* 0x00000000 */                # 22fd: 0c02
            j            .Lbr272                               # 22ff: 46fbff

            .literal_position                                  # 2304: 00000000
                                                               # 2308: 00000000
                                                               # 230c: 00000000
                                                               # 2310: 00000000
                                                               # 2314: 00000000
                                                               # 2318: 00000000
                                                               # 231c: 00000000
                                                               # 2320: 00000000
                                                               # 2324: 00000000
                                                               # 2328: 00000000
                                                               # 232c: 00000000
                                                               # 2330: 00000000
                                                               # 2334: 00000000
                                                               # 2338: 00000000
                                                               # 233c: 00000000

# Function @ .irom0.text+0x2340
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_wifi_set_ip_info
            .type        sdk_wifi_set_ip_info, @function
sdk_wifi_set_ip_info:
            addi         sp, sp, -16 /* (local0) */            # 2340: 12c1f0
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   # 2343: e931
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 2345: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 2347: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 2349: d921
            mov          a12, a3 /* arg1 */                    # 234b: cd03
            mov          a13, a2 /* arg0 */                    # 234d: dd02
            call0        .Lfunc005                             # 234f: 858ffe
            mov          a14, a2                               # 2352: ed02
            bgeui        a13, 2, .Lbr274                       # 2354: f62d15
            beqz         a12, .Lbr274                          # 2357: 9c2c
            bnez         a13, .Lbr275                          # 2359: dc5d
            movi         a0, sdk_dhcpc_flag                    # 235b: 01eaff
            movi         a2, sdk_user_init_flag                # 235e: 21eaff
            l8ui         a0, a0, 0 /* [sdk_dhcpc_flag] */      # 2361: 020000
            l8ui         a2, a2, 0 /* [sdk_user_init_flag] */  # 2364: 220200
            bnei         a0, 1, .Lbr279                        # 2367: 66104d
            bnei         a2, 1, .Lbr279                        # 236a: 66124a
.Lbr274:    movi         a2, 0 /* 0x00000000 */                # 236d: 0c02
            j            .Lbr278                               # 236f: 060e00
.Lbr275:    movi         a2, sdk_info                          # 2372: 21e6ff
            mov          a3, a12 /* arg1 */                    # 2375: 3d0c
            movi         a4, 4 /* 0x00000004 */                # 2377: 0c44
            call0        memcpy                                # 2379: 01eaffc0
                                                               # 237d: 0000
            movi         a2, sdk_info+0x4                      # 237f: 21e4ff
            addi         a3, a12, 4 /* arg1+0x4 */             # 2382: 4b3c
            movi         a4, 4 /* 0x00000004 */                # 2384: 0c44
            call0        memcpy                                # 2386: 01e8ffc0
                                                               # 238a: 0000
            movi         a2, sdk_info+0x8                      # 238c: 21e2ff
            addi         a3, a12, 8 /* arg1+0x8 */             # 238f: 8b3c
            movi         a4, 4 /* 0x00000004 */                # 2391: 0c44
            call0        memcpy                                # 2393: 01e6ffc0
                                                               # 2397: 0000
.Lbr276:    beqz         a14, .Lbr277                          # 2399: 8cce
            mov          a2, a14                               # 239b: 2d0e
            mov          a3, a12 /* arg1 */                    # 239d: 3d0c
            addi         a4, a12, 4 /* arg1+0x4 */             # 239f: 4b4c
            addi         a5, a12, 8 /* arg1+0x8 */             # 23a1: 8b5c
            call0        netif_set_addr                        # 23a3: 01e3ffc0
                                                               # 23a7: 0000
.Lbr277:    movi         a2, 1 /* 0x00000001 */                # 23a9: 0c12
.Lbr278:    l32i         a12, sp, 4 /* [(local1)] */           # 23ab: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 23ad: d821
            l32i         a14, sp, 12 /* [(local3)] */          # 23af: e831
            l32i         a0, sp, 0 /* [(local0)] */            # 23b1: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 23b3: 12c110
            ret                                                # 23b6: 0df0
.Lbr279:    bnez         a13, .Lbr275                          # 23b8: 566dfb
            movi         a2, sdk_info+0xc                      # 23bb: 21d7ff
            mov          a3, a12 /* arg1 */                    # 23be: 3d0c
            movi         a4, 4 /* 0x00000004 */                # 23c0: 0c44
            call0        memcpy                                # 23c2: 01dcffc0
                                                               # 23c6: 0000
            movi         a2, sdk_info+0x10                     # 23c8: 21d5ff
            addi         a3, a12, 4 /* arg1+0x4 */             # 23cb: 4b3c
            movi         a4, 4 /* 0x00000004 */                # 23cd: 0c44
            call0        memcpy                                # 23cf: 01daffc0
                                                               # 23d3: 0000
            movi         a2, sdk_info+0x14                     # 23d5: 21d2ff
            addi         a3, a12, 8 /* arg1+0x8 */             # 23d8: 8b3c
            movi         a4, 4 /* 0x00000004 */                # 23da: 0c44
            call0        memcpy                                # 23dc: 01d8ffc0
                                                               # 23e0: 0000
            j            .Lbr276                               # 23e2: c6ecff

            .literal_position                                  # 23e8: 00000000
                                                               # 23ec: 00000000
                                                               # 23f0: 00000000
                                                               # 23f4: 00000000
                                                               # 23f8: 00000000

# Function @ .irom0.text+0x23fc
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_wifi_get_macaddr
            .type        sdk_wifi_get_macaddr, @function
sdk_wifi_get_macaddr:
            addi         sp, sp, -16 /* (local0) */            # 23fc: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 23ff: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 2401: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 2403: c911
            mov          a13, a3 /* arg1 */                    # 2405: dd03
            mov          a12, a2 /* arg0 */                    # 2407: cd02
            call0        .Lfunc005                             # 2409: c583fe
            mov          a0, a2                                # 240c: 0d02
            bgeui        a12, 2, .Lbr280                       # 240e: f62c13
            beqz         a13, .Lbr280                          # 2411: 9c0d
            beqz         a2, .Lbr284                           # 2413: acd2
            mov          a2, a13 /* arg1 */                    # 2415: 2d0d
            movi         a4, 6 /* 0x00000006 */                # 2417: 0c64
            addi         a3, a0, 41                            # 2419: 32c029
            call0        memcpy                                # 241c: 01f5ffc0
                                                               # 2420: 0000
            j            .Lbr282                               # 2422: 460400
.Lbr280:    movi         a2, 0 /* 0x00000000 */                # 2425: 0c02
            j            .Lbr283                               # 2427: 860300
.Lbr281:    mov          a2, a13 /* arg1 */                    # 242a: 2d0d
            movi         a3, sdk_info+0x18                     # 242c: 31efff
            movi         a4, 6 /* 0x00000006 */                # 242f: 0c64
            call0        memcpy                                # 2431: 01f0ffc0
                                                               # 2435: 0000
.Lbr282:    movi         a2, 1 /* 0x00000001 */                # 2437: 0c12
.Lbr283:    l32i         a12, sp, 4 /* [(local1)] */           # 2439: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 243b: d821
            l32i         a0, sp, 0 /* [(local0)] */            # 243d: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 243f: 12c110
            ret                                                # 2442: 0df0
.Lbr284:    bnez         a12, .Lbr281                          # 2444: 562cfe
            mov          a2, a13 /* arg1 */                    # 2447: 2d0d
            movi         a3, sdk_info+0x1e                     # 2449: 31e8ff
            movi         a4, 6 /* 0x00000006 */                # 244c: 0c64
            call0        memcpy                                # 244e: 01eaffc0
                                                               # 2452: 0000
            j            .Lbr282                               # 2454: c6f7ff

            .literal_position                                  # 2458: 00000000
                                                               # 245c: 00000000
                                                               # 2460: 00000000
                                                               # 2464: 00000000
                                                               # 2468: 00000000
                                                               # 246c: 00000000
                                                               # 2470: 00000000
                                                               # 2474: 00000000
                                                               # 2478: 00000000
                                                               # 247c: 00000000
                                                               # 2480: 00000000
                                                               # 2484: 00000000

# Function @ .irom0.text+0x2488
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_wifi_set_macaddr
            .type        sdk_wifi_set_macaddr, @function
sdk_wifi_set_macaddr:
            addi         sp, sp, -16 /* (local0) */            # 2488: 12c1f0
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   # 248b: e931
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 248d: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 248f: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 2491: d921
            mov          a12, a3 /* arg1 */                    # 2493: cd03
            mov          a13, a2 /* arg0 */                    # 2495: dd02
            call0        .Lfunc005                             # 2497: 057bfe
            mov          a14, a2                               # 249a: ed02
            bgeui        a13, 2, .Lbr285                       # 249c: f62d09
            beqz         a12, .Lbr285                          # 249f: 8c6c
            bnez         a13, .Lbr287                          # 24a1: dc3d
            call0        sdk_wifi_get_opmode                   # 24a3: 050000
            bnei         a2, 2, .Lbr289                        # 24a6: 662251
.Lbr285:    movi         a2, 0 /* 0x00000000 */                # 24a9: 0c02
.Lbr286:    l32i         a12, sp, 4 /* [(local1)] */           # 24ab: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 24ad: d821
            l32i         a14, sp, 12 /* [(local3)] */          # 24af: e831
            l32i         a0, sp, 0 /* [(local0)] */            # 24b1: 0801
            addi         sp, sp, 16 /* (top of frame) */       # 24b3: 12c110
            ret                                                # 24b6: 0df0
.Lbr287:    call0        sdk_wifi_get_opmode                   # 24b8: 050000
            beqi         a2, 1, .Lbr285                        # 24bb: 2612ea
            mov          a3, a12 /* arg1 */                    # 24be: 3d0c
            movi         a13, sdk_info+0x18                    # 24c0: d1e6ff
            movi         a4, 6 /* 0x00000006 */                # 24c3: 0c64
            mov          a2, a13 /* sdk_info+0x18 */           # 24c5: 2d0d
            call0        memcmp                                # 24c7: 01e6ffc0
                                                               # 24cb: 0000
            beqz         a2, .Lbr288                           # 24cd: ac52
            mov          a2, a13 /* sdk_info+0x18 */           # 24cf: 2d0d
            mov          a3, a12 /* arg1 */                    # 24d1: 3d0c
            movi         a4, 6 /* 0x00000006 */                # 24d3: 0c64
            call0        memcpy                                # 24d5: 01e3ffc0
                                                               # 24d9: 0000
            beqz         a14, .Lbr288                          # 24db: 9c7e
            mov          a3, a12 /* arg1 */                    # 24dd: 3d0c
            addi         a2, a14, 41                           # 24df: 22ce29
            movi         a4, 6 /* 0x00000006 */                # 24e2: 0c64
            call0        memcpy                                # 24e4: 01e1ffc0
                                                               # 24e8: 0000
            call0        sdk_wifi_softap_stop                  # 24ea: 01e0ffc0
                                                               # 24ee: 0000
            call0        sdk_wifi_softap_start                 # 24f0: 01e0ffc0
                                                               # 24f4: 0000
.Lbr288:    movi         a2, 1 /* 0x00000001 */                # 24f6: 0c12
            j            .Lbr286                               # 24f8: c6ebff
.Lbr289:    mov          a3, a12 /* arg1 */                    # 24fb: 3d0c
            movi         a13, sdk_info+0x1e                    # 24fd: d1d7ff
            movi         a4, 6 /* 0x00000006 */                # 2500: 0c64
            mov          a2, a13 /* sdk_info+0x1e */           # 2502: 2d0d
            call0        memcmp                                # 2504: 01dcffc0
                                                               # 2508: 0000
            beqz         a2, .Lbr288                           # 250a: 1682fe
            mov          a2, a13 /* sdk_info+0x1e */           # 250d: 2d0d
            mov          a3, a12 /* arg1 */                    # 250f: 3d0c
            movi         a4, 6 /* 0x00000006 */                # 2511: 0c64
            call0        memcpy                                # 2513: 01d9ffc0
                                                               # 2517: 0000
            beqz         a14, .Lbr288                          # 2519: 169efd
            mov          a3, a12 /* arg1 */                    # 251c: 3d0c
            addi         a2, a14, 41                           # 251e: 22ce29
            movi         a4, 6 /* 0x00000006 */                # 2521: 0c64
            call0        memcpy                                # 2523: 01d6ffc0
                                                               # 2527: 0000
            call0        sdk_wifi_station_stop                 # 2529: 01d5ffc0
                                                               # 252d: 0000
            call0        sdk_wifi_station_start                # 252f: 01d5ffc0
                                                               # 2533: 0000
            call0        sdk_wifi_station_connect              # 2535: 050000
            j            .Lbr288                               # 2538: 86eeff

            .literal_position                                  # 253c: 00000000

# Function @ .irom0.text+0x2540
            .balign      4
            .global      sdk_wifi_status_led_install
            .type        sdk_wifi_status_led_install, @function
sdk_wifi_status_led_install:
            extui        a6, a4, 0, 2                          # 2540: 406014
            movi         a8, 1 /* 0x00000001 */                # 2543: 0c18
            movi         a9, sdk_g_ic+0x161                    # 2545: 91fdff
            movi         a7, 4 /* 0x00000004 */                # 2548: 0c47
            and          a7, a4, a7                            # 254a: 707410
            s8i          a2, a9, 129 /* arg0 -> [sdk_g_ic+0x1e2] */ # 254d: 224981
            s8i          a8, a9, 130 /* 0x01 -> [sdk_g_ic+0x1e3] */ # 2550: 824982
            s8i          a8, a9, 128 /* 0x01 -> [sdk_g_ic+0x1e1] */ # 2553: 824980
            slli         a7, a7, 2                             # 2556: e07711
            or           a6, a6, a7                            # 2559: 706620
            slli         a6, a6, 4                             # 255c: c06611
            movi         a7, -305 /* 0xfffffecf */             # 255f: 72aecf
            memw                                               # 2562: c02000
            l32i         a5, a3, 0 /* [arg1] */                # 2565: 5803
            and          a5, a5, a7                            # 2567: 705510
            or           a5, a5, a6                            # 256a: 605520
            memw                                               # 256d: c02000
            s32i         a5, a3, 0 /* a5 -> [arg1] */          # 2570: 5903
            ret           /* arg0 */                           # 2572: 0df0

            .literal_position                                  # 2574: 0000ff00
                                                               # 2578: 00feff5f
                                                               # 257c: 000e0060
                                                               # 2580: 00feef3f
                                                               # 2584: 00060060

# Function @ .irom0.text+0x2588
            .balign      4
            .global      sdk_system_uart_swap
            .type        sdk_system_uart_swap, @function
sdk_system_uart_swap:
            movi         a4, 0x00ff0000                        # 2588: 41fbff
            movi         a5, 0x5ffffe00                        # 258b: 51fbff
            memw                                               # 258e: c02000
            l32i         a2, a5, 0x21c /* [0x6000001c] */      # 2591: 222587
            bnone        a4, a2, .Lbr291                       # 2594: 270408
.Lbr290:    memw                                               # 2597: c02000
            l32i         a3, a5, 0x21c /* [0x6000001c] */      # 259a: 322587
            bany         a3, a4, .Lbr290                       # 259d: 4783f6
.Lbr291:    movi         a5, 0x60000e00                        # 25a0: 51f7ff
            memw                                               # 25a3: c02000
            l32i         a6, a5, 0x11c /* [0x60000f1c] */      # 25a6: 622547
            bnone        a4, a6, .Lbr293                       # 25a9: 670408
.Lbr292:    memw                                               # 25ac: c02000
            l32i         a7, a5, 0x11c /* [0x60000f1c] */      # 25af: 722547
            bany         a7, a4, .Lbr292                       # 25b2: 4787f6
.Lbr293:    movi         a9, 0x3feffe00                        # 25b5: 91f2ff
            movi         a4, -305 /* 0xfffffecf */             # 25b8: 42aecf
            movi         a3, 256 /* 0x00000100 */              # 25bb: 32a100
            movi         a2, 0x60000600                        # 25be: 21f1ff
            memw                                               # 25c1: c02000
            l32i         a5, a2, 0x208 /* [0x60000808] */      # 25c4: 522282
            and          a5, a5, a4                            # 25c7: 405510
            or           a5, a5, a3                            # 25ca: 305520
            memw                                               # 25cd: c02000
            s32i         a5, a2, 0x208 /* a5 -> [0x60000808] */ # 25d0: 526282
            memw                                               # 25d3: c02000
            l32i         a11, a2, 0x210 /* [0x60000810] */     # 25d6: b22284
            and          a11, a11, a4                          # 25d9: 40bb10
            or           a11, a11, a3                          # 25dc: 30bb20
            memw                                               # 25df: c02000
            s32i         a11, a2, 0x210 /* a11 -> [0x60000810] */ # 25e2: b26284
            movi         a10, 4 /* 0x00000004 */               # 25e5: 0c4a
            memw                                               # 25e7: c02000
            l32i         a8, a9, 0x228 /* [0x3ff00028] */      # 25ea: 82298a
            or           a8, a8, a10                           # 25ed: a08820
            memw                                               # 25f0: c02000
            s32i         a8, a9, 0x228 /* a8 -> [0x3ff00028] */ # 25f3: 82698a
            ret           /* 0x60000600 */                     # 25f6: 0df0

            .literal_position                                  # 25f8: 9c010000

# Function @ .irom0.text+0x25fc
            .balign      4
            .global      sdk_system_get_sdk_version
            .type        sdk_system_get_sdk_version, @function
sdk_system_get_sdk_version:
            movi         a2, .Lstr018                          # 25fc: 21ffff
            ret           /* .Lstr018 */                       # 25ff: 0df0

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "DEFERRED FUNC NUMBER IS BIGGER THAN 10\n" #    0: 44454645
                                                               #    4: 52524544
                                                               #    8: 2046554e
                                                               #    c: 43204e55
                                                               #   10: 4d424552
                                                               #   14: 20495320
                                                               #   18: 42494747
                                                               #   1c: 45522054
                                                               #   20: 48414e20
                                                               #   24: 31300a00
.Lstr002:   .asciz       "failed: need boot >= 1.3\n"          #   28: 6661696c
                                                               #   2c: 65643a20
                                                               #   30: 6e656564
                                                               #   34: 20626f6f
                                                               #   38: 74203e3d
                                                               #   3c: 20312e33
                                                               #   40: 0a00
            .balign      4
.Lstr003:   .asciz       "restart to use user bin @ %x\n"      #   44: 72657374
                                                               #   48: 61727420
                                                               #   4c: 746f2075
                                                               #   50: 73652075
                                                               #   54: 73657220
                                                               #   58: 62696e20
                                                               #   5c: 40202578
                                                               #   60: 0a00
            .balign      4
.Lstr004:   .asciz       "test already passed.\n"              #   64: 74657374
                                                               #   68: 20616c72
                                                               #   6c: 65616479
                                                               #   70: 20706173
                                                               #   74: 7365642e
                                                               #   78: 0a00
            .balign      4
.Lstr005:   .asciz       "reboot to use test bin @ %x\n"       #   7c: 7265626f
                                                               #   80: 6f742074
                                                               #   84: 6f207573
                                                               #   88: 65207465
                                                               #   8c: 73742062
                                                               #   90: 696e2040
                                                               #   94: 2025780a
                                                               #   98: 00
            .balign      4
.Lstr006:   .asciz       "don't supported type.\n"             #   9c: 646f6e27
                                                               #   a0: 74207375
                                                               #   a4: 70706f72
                                                               #   a8: 74656420
                                                               #   ac: 74797065
                                                               #   b0: 2e0a00
            .balign      4
.Lstr007:   .asciz       "reboot to use"                       #   b4: 7265626f
                                                               #   b8: 6f742074
                                                               #   bc: 6f207573
                                                               #   c0: 6500
            .balign      4
.Label004:  .word        0x00000a31                            #   c4: 310a0000
.Label005:  .word        0x00000a32                            #   c8: 320a0000
.Lstr008:   .asciz       "deep sleep %ds\n\n"                  #   cc: 64656570
                                                               #   d0: 20736c65
                                                               #   d4: 65702025
                                                               #   d8: 64730a0a
                                                               #   dc: 00
            .balign      4
.Lstr009:   .asciz       "ip:%d.%d.%d.%d,mask:%d.%d.%d.%d,gw:%d.%d.%d.%d" #   e0: 69703a25
                                                               #   e4: 642e2564
                                                               #   e8: 2e25642e
                                                               #   ec: 25642c6d
                                                               #   f0: 61736b3a
                                                               #   f4: 25642e25
                                                               #   f8: 642e2564
                                                               #   fc: 2e25642c
                                                               #  100: 67773a25
                                                               #  104: 642e2564
                                                               #  108: 2e25642e
                                                               #  10c: 256400
            .balign      4
.Label006:  .word        0x0000000a                            #  110: 0a000000
.Lstr010:   .asciz       "%s: 0x%x ~ 0x%x, len: %d\n"          #  114: 25733a20
                                                               #  118: 30782578
                                                               #  11c: 207e2030
                                                               #  120: 7825782c
                                                               #  124: 206c656e
                                                               #  128: 3a202564
                                                               #  12c: 0a00
            .balign      4
.Lstr011:   .asciz       "data  "                              #  130: 64617461
                                                               #  134: 202000
            .balign      4
.Lstr012:   .asciz       "rodata"                              #  138: 726f6461
                                                               #  13c: 746100
            .balign      4
.Lstr013:   .asciz       "bss   "                              #  140: 62737320
                                                               #  144: 202000
            .balign      4
.Lstr014:   .asciz       "heap  "                              #  148: 68656170
                                                               #  14c: 202000
            .balign      4
.Lstr015:   .asciz       "[W]sec %d error\n"                   #  150: 5b575d73
                                                               #  154: 65632025
                                                               #  158: 64206572
                                                               #  15c: 726f720a
                                                               #  160: 00
            .balign      4
.Lstr016:   .asciz       "current_router_id is %d\n"           #  164: 63757272
                                                               #  168: 656e745f
                                                               #  16c: 726f7574
                                                               #  170: 65725f69
                                                               #  174: 64206973
                                                               #  178: 2025640a
                                                               #  17c: 00
            .balign      4
.Lstr017:   .asciz       "ESP_%02X%02X%02X"                    #  180: 4553505f
                                                               #  184: 25303258
                                                               #  188: 25303258
                                                               #  18c: 25303258
                                                               #  190: 00
            .balign      4
.Label007:  .byte        0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00
.Lstr018:   .asciz       "0.9.9"                               #  19c: 302e392e
                                                               #  1a0: 3900

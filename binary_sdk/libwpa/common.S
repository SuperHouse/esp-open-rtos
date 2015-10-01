
            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
            .global      sdk_inc_byte_array
            .type        sdk_inc_byte_array, @function
sdk_inc_byte_array:
            addi         a3, a3, -1 /* arg1-0x1 */             #    0: 0b33
            bltz         a3, .Lbr002                           #    2: 965301
            add          a3, a3, a2                            #    5: 2a33
            addi         a2, a2, -1 /* arg0-0x1 */             #    7: 0b22
.Lbr001:    l8ui         a4, a3, 0                             #    9: 420300
            addi         a4, a4, 1                             #    c: 1b44
            extui        a4, a4, 0, 8                          #    e: 404074
            s8i          a4, a3, 0                             #   11: 424300
            bnez         a4, .Lbr002                           #   14: cc34
            addi         a3, a3, -1                            #   16: 0b33
            bne          a3, a2, .Lbr001                       #   18: 2793ed
.Lbr002:    ret                                                #   1b: 0df0

            .balign      4
# Function @ .irom0.text+0x20
.Lfunc001:  movi         a3, 47 /* 0x0000002f */               #   20: 2cf3
            bgeu         a3, a2, .Lbr003                       #   22: 27b309
            movi         a4, 57 /* 0x00000039 */               #   25: 3c94
            bltu         a4, a2, .Lbr003                       #   27: 273404
            addi         a2, a2, -48 /* arg0-0x30 */           #   2a: 22c2d0
            ret           /* arg0-0x30 */                      #   2d: 0df0
.Lbr003:    movi         a5, 96 /* 0x00000060 */               #   2f: 52a060
            bgeu         a5, a2, .Lbr004                       #   32: 27b50a
            movi         a6, 102 /* 0x00000066 */              #   35: 62a066
            bltu         a6, a2, .Lbr004                       #   38: 273604
            addi         a2, a2, -87 /* arg0-0x57 */           #   3b: 22c2a9
            ret           /* arg0-0x57 */                      #   3e: 0df0
.Lbr004:    movi         a7, 64 /* 0x00000040 */               #   40: 4c07
            bgeu         a7, a2, .Lbr005                       #   42: 27b709
            movi         a8, 70 /* 0x00000046 */               #   45: 4c68
            bltu         a8, a2, .Lbr005                       #   47: 273804
            addi         a2, a2, -55 /* arg0-0x37 */           #   4a: 22c2c9
            ret           /* arg0-0x37 */                      #   4d: 0df0
.Lbr005:    movi         a2, -1 /* 0xffffffff */               #   4f: 7cf2
            ret           /* 0xffffffff */                     #   51: 0df0

            .balign      4
# Function @ .irom0.text+0x54
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .global      sdk_hex2byte
            .type        sdk_hex2byte, @function
            .literal_position
sdk_hex2byte:
            addi         sp, sp, -16 /* (local0) */            #   54: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #   57: c921
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   59: 0911
            mov          a12, a2 /* arg0 */                    #   5b: cd02
            l8ui         a2, a2, 0 /* [arg0] */                #   5d: 220200
            call0        .Lfunc001                             #   60: c5fbff
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #   63: 2901
            bltz         a2, .Lbr007                           #   65: 969201
            l8ui         a2, a12, 1 /* [arg0+0x1] */           #   68: 220c01
            call0        .Lfunc001                             #   6b: 45fbff
            bltz         a2, .Lbr007                           #   6e: 960201
            l32i         a0, sp, 0 /* [(local0)] */            #   71: 0801
            slli         a0, a0, 4                             #   73: c00011
            or           a2, a2, a0                            #   76: 002220
.Lbr006:    l32i         a12, sp, 8 /* [(local2)] */           #   79: c821
            l32i         a0, sp, 4 /* [(local1)] */            #   7b: 0811
            addi         sp, sp, 16 /* (top of frame) */       #   7d: 12c110
            ret                                                #   80: 0df0
.Lbr007:    movi         a2, -1 /* 0xffffffff */               #   82: 7cf2
            j            .Lbr006                               #   84: 46fcff

            .balign      4
# Function @ .irom0.text+0x88
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .global      sdk_hexstr2bin
            .type        sdk_hexstr2bin, @function
sdk_hexstr2bin:
            addi         sp, sp, -32 /* (local0) */            #   88: 12c1e0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   8b: 0901
            s32i         a4, sp, 20 /* arg2 -> [(local5)] */   #   8d: 4951
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #   8f: e931
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   #   91: f941
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   93: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #   95: d921
            mov          a12, a2 /* arg0 */                    #   97: cd02
            mov          a13, a3 /* arg1 */                    #   99: dd03
            mov          a15, a4 /* arg2 */                    #   9b: fd04
            beqz         a4, .Lbr010                           #   9d: 9c94
            movi         a14, 0 /* 0x00000000 */               #   9f: 0c0e
.Lbr008:    mov          a2, a12                               #   a1: 2d0c
            call0        sdk_hex2byte                          #   a3: 050000
            bgez         a2, .Lbr009                           #   a6: d64200
            movi         a2, -1 /* 0xffffffff */               #   a9: 7cf2
            j            .Lbr011                               #   ab: 460300
.Lbr009:    addi         a12, a12, 2                           #   ae: 2bcc
            s8i          a2, a13, 0                            #   b0: 224d00
            addi         a14, a14, 1                           #   b3: 1bee
            addi         a13, a13, 1                           #   b5: 1bdd
            bne          a15, a14, .Lbr008                     #   b7: e79fe6
.Lbr010:    movi         a2, 0 /* 0x00000000 */                #   ba: 0c02
.Lbr011:    l32i         a12, sp, 4 /* [(local1)] */           #   bc: c811
            l32i         a13, sp, 8 /* [(local2)] */           #   be: d821
            l32i         a14, sp, 12 /* [(local3)] */          #   c0: e831
            l32i         a15, sp, 16 /* [(local4)] */          #   c2: f841
            l32i         a0, sp, 0 /* [(local0)] */            #   c4: 0801
            addi         sp, sp, 32 /* (top of frame) */       #   c6: 12c120
            ret                                                #   c9: 0df0

            .literal_position                                  #   cc: 00ff0000
                                                               #   d0: 807eaa83
                                                               #   d4: c7100000
                                                               #   d8: 00ff0000
                                                               #   dc: 00000000
                                                               #   e0: 00000000
                                                               #   e4: 00000000

# Function @ .irom0.text+0xe8
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word[3]   @ -0xc
            .global      sdk_wpa_get_ntp_timestamp
            .type        sdk_wpa_get_ntp_timestamp, @function
sdk_wpa_get_ntp_timestamp:
            addi         sp, sp, -32 /* (local0) */            #   e8: 12c1e0
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   #   eb: c951
            s32i         a0, sp, 16 /* a0 -> [(local4)] */     #   ed: 0941
            mov          a12, a2 /* arg0 */                    #   ef: cd02
            mov          a2, sp /* (local0) */                 #   f1: 2d01
            call0        sdk_os_get_time                       #   f3: 01faffc0
                                                               #   f7: 0000
            mov          a2, a12 /* arg0 */                    #   f9: 2d0c
            addi         a3, sp, 8 /* (local2) */              #   fb: 8b31
            movi         a4, 4 /* 0x00000004 */                #   fd: 0c44
            movi         a8, 0x0000ff00                        #   ff: 81f3ff
            movi         a6, 0x000010c7                        #  102: 61f4ff
            movi         a5, 0x83aa7e80                        #  105: 51f2ff
            l32i         a9, sp, 4 /* [(local1)] */            #  108: 9811
            l32i         a0, sp, 0 /* [(local0)] */            #  10a: 0801
            srli         a10, a9, 9                            #  10c: 90a941
            srli         a11, a9, 5                            #  10f: 90b541
            add          a0, a0, a5 /* [(local0)]+0x83aa7e80 */ #  112: 5a00
            slli         a5, a0, 24                            #  114: 805001
            mull         a9, a9, a6                            #  117: 609982
            and          a7, a0, a8                            #  11a: 807010
            extui        a6, a0, 24, 8                         #  11d: 006875
            sub          a9, a9, a11                           #  120: b099c0
            slli         a7, a7, 8                             #  123: 807711
            or           a5, a5, a7                            #  126: 705520
            sub          a9, a9, a10                           #  129: a099c0
            s32i         a9, sp, 12 /* a9 -> [(local3)] */     #  12c: 9931
            srli         a0, a0, 8                             #  12e: 000841
            and          a0, a0, a8                            #  131: 800010
            or           a0, a0, a6                            #  134: 600020
            or           a0, a0, a5                            #  137: 500020
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  13a: 0921
            call0        memcpy                                #  13c: 01e9ffc0
                                                               #  140: 0000
            addi         a2, a12, 4 /* arg0+0x4 */             #  142: 4b2c
            addi         a3, sp, 8 /* (local2) */              #  144: 8b31
            movi         a4, 4 /* 0x00000004 */                #  146: 0c44
            l32i         a9, sp, 12 /* [(local3)] */           #  148: 9831
            movi         a8, 0x0000ff00                        #  14a: 81e3ff
            srli         a7, a9, 8                             #  14d: 907841
            and          a7, a7, a8                            #  150: 807710
            and          a10, a9, a8                           #  153: 80a910
            slli         a10, a10, 8                           #  156: 80aa11
            slli         a8, a9, 24                            #  159: 808901
            or           a8, a8, a10                           #  15c: a08820
            extui        a9, a9, 24, 8                         #  15f: 909875
            or           a7, a7, a9                            #  162: 907720
            or           a7, a7, a8                            #  165: 807720
            s32i         a7, sp, 8 /* a7 -> [(local2)] */      #  168: 7921
            call0        memcpy                                #  16a: 01deffc0
                                                               #  16e: 0000
            l32i         a12, sp, 20 /* [(local5)] */          #  170: c851
            l32i         a0, sp, 16 /* [(local4)] */           #  172: 0841
            addi         sp, sp, 32 /* (top of frame) */       #  174: 12c120
            ret                                                #  177: 0df0

            .literal_position                                  #  17c: 00000000
                                                               #  180: 00000000
                                                               #  184: 00000000
                                                               #  188: 00000000
                                                               #  18c: 00000000
                                                               #  190: 00000000
                                                               #  194: 00000000
                                                               #  198: 00000000
                                                               #  19c: 00000000
                                                               #  1a0: 00000000

# Function @ .irom0.text+0x1a4
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .global      sdk_wpa_config_parse_string
            .type        sdk_wpa_config_parse_string, @function
sdk_wpa_config_parse_string:
            addi         sp, sp, -32 /* (local0) */            #  1a4: 12c1e0
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  1a7: e941
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  1a9: 0911
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  1ab: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  1ad: c921
            mov          a13, a3 /* arg1 */                    #  1af: dd03
            mov          a12, a2 /* arg0 */                    #  1b1: cd02
            l8ui         a0, a2, 0 /* [arg0] */                #  1b3: 020200
            movi         a2, 34 /* 0x00000022 */               #  1b6: 2c22
            bne          a0, a2, .Lbr012                       #  1b8: 27901a
            mov          a2, a12 /* arg0 */                    #  1bb: 2d0c
            call0        strlen                                #  1bd: 01efffc0
                                                               #  1c1: 0000
            addi         a3, a2, -7                            #  1c3: 32c2f9
            beqz         a3, .Lbr018                           #  1c6: 169308
            mov          a2, a12 /* arg0 */                    #  1c9: 2d0c
            call0        strlen                                #  1cb: 01edffc0
                                                               #  1cf: 0000
            movi         a4, 15 /* 0x0000000f */               #  1d1: 0cf4
            beq          a2, a4, .Lbr018                       #  1d3: 47127c
.Lbr012:    mov          a2, a12 /* arg0 */                    #  1d6: 2d0c
            call0        strlen                                #  1d8: 01ebffc0
                                                               #  1dc: 0000
            beqi         a2, 5, .Lbr017                        #  1de: 26524f
            movi         a5, 13 /* 0x0000000d */               #  1e1: 0cd5
            beq          a2, a5, .Lbr017                       #  1e3: 57124a
            beqi         a2, 10, .Lbr013                       #  1e6: 269204
            movi         a6, 26 /* 0x0000001a */               #  1e9: 1ca6
            bne          a2, a6, .Lbr014                       #  1eb: 679223
.Lbr013:    srli         a2, a2, 1                             #  1ee: 202141
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  1f1: 2901
            addi         a2, a2, 1                             #  1f3: 1b22
            call0        malloc                                #  1f5: 01e4ffc0
                                                               #  1f9: 0000
            mov          a14, a2                               #  1fb: ed02
            beqz         a2, .Lbr014                           #  1fd: 9c12
            mov          a2, a12 /* arg0 */                    #  1ff: 2d0c
            mov          a3, a14                               #  201: 3d0e
            l32i         a4, sp, 0 /* [(local0)] */            #  203: 4801
            call0        sdk_hexstr2bin                        #  205: 050000
            beqz         a2, .Lbr015                           #  208: 8cb2
            mov          a2, a14                               #  20a: 2d0e
            call0        free                                  #  20c: 01e0ffc0
                                                               #  210: 0000
.Lbr014:    movi         a14, 0 /* 0x00000000 */               #  212: 0c0e
            j            .Lbr016                               #  214: 860200
.Lbr015:    l32i         a3, sp, 0 /* [(local0)] */            #  217: 3801
            movi         a4, 0 /* 0x00000000 */                #  219: 0c04
            add          a5, a3, a14                           #  21b: ea53
            s8i          a4, a5, 0                             #  21d: 424500
            s32i         a3, a13, 0 /* [(local0)] -> [arg1] */ #  220: 390d
.Lbr016:    l32i         a0, sp, 4 /* [(local1)] */            #  222: 0811
            l32i         a12, sp, 8 /* [(local2)] */           #  224: c821
            mov          a2, a14                               #  226: 2d0e
            l32i         a13, sp, 12 /* [(local3)] */          #  228: d831
            l32i         a14, sp, 16 /* [(local4)] */          #  22a: e841
            addi         sp, sp, 32 /* (top of frame) */       #  22c: 12c120
            ret                                                #  22f: 0df0
.Lbr017:    s32i         a2, a13, 0 /* a2 -> [arg1] */         #  231: 290d
            addi         a2, a2, 1                             #  233: 1b22
            call0        malloc                                #  235: 01d6ffc0
                                                               #  239: 0000
            mov          a3, a12 /* arg0 */                    #  23b: 3d0c
            mov          a14, a2                               #  23d: ed02
            l32i         a4, a13, 0 /* [arg1] */               #  23f: 480d
            call0        memcpy                                #  241: 01d4ffc0
                                                               #  245: 0000
            l32i         a7, a13, 0 /* [arg1] */               #  247: 780d
            movi         a6, 0 /* 0x00000000 */                #  249: 0c06
            add          a7, a7, a14                           #  24b: ea77
            s8i          a6, a7, 0                             #  24d: 624700
            j            .Lbr016                               #  250: 86f3ff
.Lbr018:    movi         a3, 34 /* 0x00000022 */               #  253: 2c23
            addi         a14, a12, 1 /* arg0+0x1 */            #  255: 1bec
            mov          a2, a14 /* arg0+0x1 */                #  257: 2d0e
            call0        strrchr                               #  259: 01cfffc0
                                                               #  25d: 0000
            beqz         a2, .Lbr014                           #  25f: 16f2fa
            sub          a2, a2, a12                           #  262: c022c0
            addi         a8, a2, -1                            #  265: 0b82
            s32i         a8, a13, 0 /* a8 -> [arg1] */         #  267: 890d
            call0        malloc                                #  269: 01ccffc0
                                                               #  26d: 0000
            mov          a12, a2                               #  26f: cd02
            beqz         a2, .Lbr014                           #  271: 16d2f9
            mov          a3, a14 /* arg0+0x1 */                #  274: 3d0e
            l32i         a4, a13, 0 /* [arg1] */               #  276: 480d
            call0        memcpy                                #  278: 01caffc0
                                                               #  27c: 0000
            mov          a14, a12                              #  27e: ed0c
            l32i         a10, a13, 0 /* [arg1] */              #  280: a80d
            movi         a9, 0 /* 0x00000000 */                #  282: 0c09
            add          a10, a10, a12                         #  284: caaa
            s8i          a9, a10, 0                            #  286: 924a00
            j            .Lbr016                               #  289: 46e5ff

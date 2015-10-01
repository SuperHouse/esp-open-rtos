
            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
# Local variables/stack:
#     (local0):  word      @ -0x24
#     (local1):  word      @ -0x20
#     (local2):  word      @ -0x1c
#     (local3):  word      @ -0x18
#     (local4):  word      @ -0x14
#     (local5):  word[4]   @ -0x10
            .global      sdk_sha1_vector
            .type        sdk_sha1_vector, @function
            .literal_position
sdk_sha1_vector:
            addi         sp, sp, -128 /* (FP)-0x80 */          #    0: 12c180
            s32i         a3, sp, 92 /* arg1 -> [(local0)] */   #    3: 326117
            s32i         a0, sp, 96 /* a0 -> [(local1)] */     #    6: 026118
            s32i         a13, sp, 104 /* a13 -> [(local3)] */  #    9: d2611a
            s32i         a12, sp, 100 /* a12 -> [(local2)] */  #    c: c26119
            s32i         a14, sp, 108 /* a14 -> [(local4)] */  #    f: e2611b
            mov          a12, a4 /* arg2 */                    #   12: cd04
            mov          a14, a2 /* arg0 */                    #   14: ed02
            mov          a13, a5 /* arg3 */                    #   16: dd05
            mov          a2, sp /* (FP)-0x80 */                #   18: 2d01
            call0        sdk_SHA1Init                          #   1a: 050000
            s32i         a13, sp, 112 /* arg3 -> [(local5)] */ #   1d: d2611c
            beqz         a14, .Lbr002                          #   20: 9c4e
            l32i         a13, sp, 92 /* [(local0)] */          #   22: d22117
            addx4        a14, a14, a13                         #   25: d0eea0
.Lbr001:    mov          a2, sp /* (FP)-0x80 */                #   28: 2d01
            l32i         a3, a13, 0                            #   2a: 380d
            l32i         a4, a12, 0                            #   2c: 480c
            call0        sdk_SHA1Update                        #   2e: 050000
            addi         a12, a12, 4                           #   31: 4bcc
            addi         a13, a13, 4                           #   33: 4bdd
            bne          a13, a14, .Lbr001                     #   35: e79def
.Lbr002:    l32i         a2, sp, 112 /* [(local5)] */          #   38: 22211c
            mov          a3, sp /* (FP)-0x80 */                #   3b: 3d01
            call0        sdk_SHA1Final                         #   3d: 050000
            movi         a2, 0 /* 0x00000000 */                #   40: 0c02
            l32i         a12, sp, 100 /* [(local2)] */         #   42: c22119
            l32i         a13, sp, 104 /* [(local3)] */         #   45: d2211a
            l32i         a14, sp, 108 /* [(local4)] */         #   48: e2211b
            movi         a3, 128 /* 0x00000080 */              #   4b: 32a080
            l32i         a0, sp, 96 /* [(local1)] */           #   4e: 022118
            add          sp, sp, a3 /* (top of frame) */       #   51: 3a11
            ret           /* 0x00000000 */                     #   53: 0df0

            .literal_position                                  #   58: ff00ff00
                                                               #   5c: 00ff00ff
                                                               #   60: 9979825a
                                                               #   64: a1ebd96e
                                                               #   68: a1ebd96e
                                                               #   6c: dcbc1b8f
                                                               #   70: dcbc1b8f
                                                               #   74: dcbc1b8f
                                                               #   78: dcbc1b8f
                                                               #   7c: dcbc1b8f
                                                               #   80: dcbc1b8f
                                                               #   84: dcbc1b8f
                                                               #   88: dcbc1b8f
                                                               #   8c: dcbc1b8f
                                                               #   90: d6c162ca
                                                               #   94: d6c162ca
                                                               #   98: d6c162ca
                                                               #   9c: d6c162ca
                                                               #   a0: d6c162ca
                                                               #   a4: d6c162ca
                                                               #   a8: d6c162ca
                                                               #   ac: d6c162ca
                                                               #   b0: d6c162ca
                                                               #   b4: d6c162ca
                                                               #   b8: d6c162ca
                                                               #   bc: d6c162ca
                                                               #   c0: 00000000
                                                               #   c4: 00000000

# Function @ .irom0.text+0xc8
# Local variables/stack:
#     (local0):  word      @ -0x130
#     (local1):  word      @ -0x12c
#     (local2):  word      @ -0x128
#     (local3):  word      @ -0x124
#     (local4):  word      @ -0x120
#     (local5):  word      @ -0x11c
#     (local6):  word      @ -0x118
#     (local7):  word      @ -0x114
#     (local8):  word      @ -0x110
#     (local9):  word      @ -0x10c
#     (local10): word      @ -0x108
#     (local11): word      @ -0x104
#     (local12): word      @ -0x100
#     (local13): word      @ -0xfc
#     (local14): word      @ -0xf8
#     (local15): word      @ -0xf4
#     (local16): word      @ -0xf0
#     (local17): word      @ -0xec
#     (local18): word      @ -0xe8
#     (local19): word      @ -0xe4
#     (local20): word      @ -0xe0
#     (local21): word      @ -0xdc
#     (local22): word      @ -0xd8
#     (local23): word      @ -0xd4
#     (local24): word      @ -0xd0
#     (local25): word      @ -0xcc
#     (local26): word      @ -0xc8
#     (local27): word      @ -0xc4
#     (local28): word      @ -0xc0
#     (local29): word      @ -0xbc
#     (local30): word      @ -0xb8
#     (local31): word      @ -0xb4
#     (local32): word      @ -0xb0
#     (local33): word      @ -0xac
#     (local34): word      @ -0xa8
#     (local35): word      @ -0xa4
#     (local36): word      @ -0xa0
#     (local37): word      @ -0x9c
#     (local38): word      @ -0x98
#     (local39): word      @ -0x94
#     (local40): word      @ -0x90
#     (local41): word      @ -0x8c
#     (local42): word      @ -0x88
#     (local43): word      @ -0x84
#     (local44): word      @ -0x80
#     (local45): word      @ -0x7c
#     (local46): word      @ -0x78
#     (local47): word      @ -0x74
#     (local48): word      @ -0x70
#     (local49): word      @ -0x6c
#     (local50): word      @ -0x68
#     (local51): word      @ -0x64
#     (local52): word      @ -0x60
#     (local53): word      @ -0x5c
#     (local54): word      @ -0x58
#     (local55): word      @ -0x54
#     (local56): word      @ -0x50
#     (local57): word      @ -0x4c
#     (local58): word      @ -0x48
#     (local59): word      @ -0x44
#     (local60): word      @ -0x40
#     (local61): word      @ -0x3c
#     (local62): word      @ -0x38
#     (local63): word      @ -0x34
#     (local64): word      @ -0x30
#     (local65): word      @ -0x2c
#     (local66): word      @ -0x28
#     (local67): word      @ -0x24
#     (local68): word      @ -0x20
#     (local69): word      @ -0x1c
#     (local70): word      @ -0x18
#     (local71): word      @ -0x14
#     (local72): word[4]   @ -0x10
            .global      sdk_SHA1Transform
            .type        sdk_SHA1Transform, @function
sdk_SHA1Transform:
            movi         a4, 304 /* 0x00000130 */              #   c8: 42a130
            sub          sp, sp, a4 /* (local0) */             #   cb: 4011c0
            movi         a4, 64 /* 0x00000040 */               #   ce: 4c04
            s32i         a12, sp, 116 /* a12 -> [(local29)] */ #   d0: c2611d
            s32i         a0, sp, 112 /* a0 -> [(local28)] */   #   d3: 02611c
            mov          a12, a2 /* arg0 */                    #   d6: cd02
            mov          a2, sp /* (local0) */                 #   d8: 2d01
            call0        memcpy                                #   da: 01f9ffc0
                                                               #   de: 0000
            s32i         a12, sp, 132 /* arg0 -> [(local33)] */ #   e0: c26121
            movi         a6, 0x5a827999                        #   e3: 61dfff
            l32i         a2, a12, 4 /* [arg0+0x4] */           #   e6: 281c
            l32i         a7, sp, 4 /* [(local1)] */            #   e8: 7811
            s32i         a15, sp, 128 /* a15 -> [(local32)] */ #   ea: f26120
            l32i         a5, a12, 0 /* [arg0] */               #   ed: 580c
            movi         a4, 0xff00ff00                        #   ef: 41dbff
            movi         a8, 0x00ff00ff                        #   f2: 81d9ff
            ssai         24                                    #   f5: 104840
            s32i         a14, sp, 124 /* a14 -> [(local31)] */ #   f8: e2611f
            s32i         a13, sp, 120 /* a13 -> [(local30)] */ #   fb: d2611e
            l32i         a14, sp, 0 /* [(local0)] */           #   fe: e801
            l32i         a13, a12, 16 /* [arg0+0x10] */        #  100: d84c
            src          a0, a14, a14                          #  102: e00e81
            and          a0, a0, a8                            #  105: 800010
            ssai         8                                     #  108: 004840
            src          a14, a14, a14                         #  10b: e0ee81
            and          a14, a14, a4                          #  10e: 40ee10
            ssai         27                                    #  111: 104b40
            src          a15, a5, a5                           #  114: 50f581
            or           a14, a14, a0                          #  117: 00ee20
            s32i         a14, sp, 0x100 /* a14 -> [(local64)] */ #  11a: e26140
            l32i         a0, a12, 12 /* [arg0+0xc] */          #  11d: 083c
            ssai         24                                    #  11f: 104840
            src          a9, a7, a7                            #  122: 709781
            and          a9, a9, a8                            #  125: 809910
            ssai         8                                     #  128: 004840
            src          a7, a7, a7                            #  12b: 707781
            and          a7, a7, a4                            #  12e: 407710
            ssai         2                                     #  131: 004240
            src          a11, a2, a2                           #  134: 20b281
            or           a7, a7, a9                            #  137: 907720
            s32i         a7, sp, 252 /* a7 -> [(local63)] */   #  13a: 72613f
            l32i         a9, a12, 8 /* [arg0+0x8] */           #  13d: 982c
            ssai         27                                    #  13f: 104b40
            xor          a3, a9, a0                            #  142: 003930
            and          a2, a2, a3                            #  145: 302210
            xor          a2, a0, a2                            #  148: 202030
            add          a14, a14, a2                          #  14b: 2aee
            xor          a2, a11, a9                           #  14d: 902b30
            add          a14, a14, a15                         #  150: faee
            add          a13, a13, a14                         #  152: eadd
            and          a2, a5, a2                            #  154: 202510
            l32i         a14, sp, 8 /* [(local2)] */           #  157: e821
            xor          a2, a9, a2                            #  159: 202930
            add          a13, a13, a6                          #  15c: 6add
            src          a3, a13, a13                          #  15e: d03d81
            add          a2, a7, a2                            #  161: 2a27
            ssai         24                                    #  163: 104840
            add          a2, a2, a3                            #  166: 3a22
            src          a15, a14, a14                         #  168: e0fe81
            l32i         a3, sp, 12 /* [(local3)] */           #  16b: 3831
            and          a15, a15, a8                          #  16d: 80ff10
            add          a0, a0, a2                            #  170: 2a00
            ssai         8                                     #  172: 004840
            l32i         a2, sp, 16 /* [(local4)] */           #  175: 2841
            add          a0, a0, a6                            #  177: 6a00
            src          a14, a14, a14                         #  179: e0ee81
            and          a14, a14, a4                          #  17c: 40ee10
            ssai         2                                     #  17f: 004240
            src          a5, a5, a5                            #  182: 505581
            or           a14, a14, a15                         #  185: f0ee20
            ssai         27                                    #  188: 104b40
            src          a12, a0, a0                           #  18b: 00c081
            s32i         a14, sp, 248 /* a14 -> [(local62)] */ #  18e: e2613e
            ssai         24                                    #  191: 104840
            src          a10, a3, a3                           #  194: 30a381
            ssai         8                                     #  197: 004840
            and          a10, a10, a8                          #  19a: 80aa10
            src          a3, a3, a3                            #  19d: 303381
            ssai         2                                     #  1a0: 004240
            and          a3, a3, a4                            #  1a3: 403310
            or           a3, a3, a10                           #  1a6: a03320
            s32i         a3, sp, 244 /* a3 -> [(local61)] */   #  1a9: 32613d
            xor          a10, a11, a5                          #  1ac: 50ab30
            xor          a7, a7, a3                            #  1af: 307730
            and          a10, a13, a10                         #  1b2: a0ad10
            src          a13, a13, a13                         #  1b5: d0dd81
            xor          a10, a11, a10                         #  1b8: a0ab30
            ssai         27                                    #  1bb: 104b40
            add          a10, a14, a10                         #  1be: aaae
            add          a10, a10, a12                         #  1c0: caaa
            add          a9, a9, a10                           #  1c2: aa99
            xor          a12, a5, a13                          #  1c4: d0c530
            and          a12, a0, a12                          #  1c7: c0c010
            add          a9, a9, a6                            #  1ca: 6a99
            src          a15, a9, a9                           #  1cc: 90f981
            xor          a12, a5, a12                          #  1cf: c0c530
            ssai         24                                    #  1d2: 104840
            add          a12, a3, a12                          #  1d5: cac3
            add          a12, a12, a15                         #  1d7: facc
            src          a10, a2, a2                           #  1d9: 20a281
            and          a10, a10, a8                          #  1dc: 80aa10
            add          a11, a11, a12                         #  1df: cabb
            ssai         8                                     #  1e1: 004840
            src          a2, a2, a2                            #  1e4: 202281
            add          a11, a11, a6                          #  1e7: 6abb
            ssai         2                                     #  1e9: 004240
            and          a2, a2, a4                            #  1ec: 402210
            or           a2, a2, a10                           #  1ef: a02220
            src          a0, a0, a0                            #  1f2: 000081
            xor          a15, a13, a0                          #  1f5: 00fd30
            s32i         a2, sp, 240 /* a2 -> [(local60)] */   #  1f8: 22613c
            ssai         27                                    #  1fb: 104b40
            l32i         a2, sp, 20 /* [(local5)] */           #  1fe: 2851
            src          a12, a11, a11                         #  200: b0cb81
            and          a15, a9, a15                          #  203: f0f910
            xor          a15, a13, a15                         #  206: f0fd30
            ssai         24                                    #  209: 104840
            src          a10, a2, a2                           #  20c: 20a281
            and          a10, a10, a8                          #  20f: 80aa10
            ssai         8                                     #  212: 004840
            src          a2, a2, a2                            #  215: 202281
            and          a2, a2, a4                            #  218: 402210
            ssai         2                                     #  21b: 004240
            src          a9, a9, a9                            #  21e: 909981
            or           a2, a2, a10                           #  221: a02220
            s32i         a2, sp, 236 /* a2 -> [(local59)] */   #  224: 22613b
            l32i         a10, sp, 240 /* [(local60)] */        #  227: a2213c
            ssai         27                                    #  22a: 104b40
            add          a10, a10, a15                         #  22d: faaa
            add          a10, a10, a12                         #  22f: caaa
            add          a5, a5, a10                           #  231: aa55
            l32i         a12, sp, 24 /* [(local6)] */          #  233: c861
            xor          a10, a0, a9                           #  235: 90a030
            add          a5, a5, a6                            #  238: 6a55
            src          a2, a5, a5                            #  23a: 502581
            and          a10, a11, a10                         #  23d: a0ab10
            xor          a10, a0, a10                          #  240: a0a030
            ssai         24                                    #  243: 104840
            src          a15, a12, a12                         #  246: c0fc81
            and          a15, a15, a8                          #  249: 80ff10
            ssai         8                                     #  24c: 004840
            src          a12, a12, a12                         #  24f: c0cc81
            and          a12, a12, a4                          #  252: 40cc10
            ssai         2                                     #  255: 004240
            src          a11, a11, a11                         #  258: b0bb81
            or           a12, a12, a15                         #  25b: f0cc20
            ssai         27                                    #  25e: 104b40
            s32i         a12, sp, 232 /* a12 -> [(local58)] */ #  261: c2613a
            l32i         a15, sp, 236 /* [(local59)] */        #  264: f2213b
            xor          a12, a11, a9                          #  267: 90cb30
            add          a15, a15, a10                         #  26a: aaff
            add          a15, a15, a2                          #  26c: 2aff
            and          a12, a5, a12                          #  26e: c0c510
            xor          a12, a9, a12                          #  271: c0c930
            add          a13, a13, a15                         #  274: fadd
            add          a13, a13, a6                          #  276: 6add
            l32i         a15, sp, 28 /* [(local7)] */          #  278: f871
            src          a10, a13, a13                         #  27a: d0ad81
            ssai         24                                    #  27d: 104840
            src          a2, a15, a15                          #  280: f02f81
            and          a2, a2, a8                            #  283: 802210
            ssai         8                                     #  286: 004840
            src          a15, a15, a15                         #  289: f0ff81
            and          a15, a15, a4                          #  28c: 40ff10
            ssai         2                                     #  28f: 004240
            src          a5, a5, a5                            #  292: 505581
            or           a15, a15, a2                          #  295: 20ff20
            ssai         27                                    #  298: 104b40
            s32i         a15, sp, 228 /* a15 -> [(local57)] */ #  29b: f26139
            l32i         a2, sp, 232 /* [(local58)] */         #  29e: 22213a
            xor          a15, a11, a5                          #  2a1: 50fb30
            add          a2, a2, a12                           #  2a4: ca22
            add          a2, a2, a10                           #  2a6: aa22
            and          a15, a13, a15                         #  2a8: f0fd10
            xor          a15, a11, a15                         #  2ab: f0fb30
            add          a0, a0, a2                            #  2ae: 2a00
            add          a0, a0, a6                            #  2b0: 6a00
            l32i         a2, sp, 32 /* [(local8)] */           #  2b2: 2881
            src          a12, a0, a0                           #  2b4: 00c081
            ssai         24                                    #  2b7: 104840
            src          a10, a2, a2                           #  2ba: 20a281
            and          a10, a10, a8                          #  2bd: 80aa10
            ssai         8                                     #  2c0: 004840
            src          a2, a2, a2                            #  2c3: 202281
            and          a2, a2, a4                            #  2c6: 402210
            ssai         2                                     #  2c9: 004240
            src          a13, a13, a13                         #  2cc: d0dd81
            or           a2, a2, a10                           #  2cf: a02220
            ssai         27                                    #  2d2: 104b40
            s32i         a2, sp, 224 /* a2 -> [(local56)] */   #  2d5: 226138
            l32i         a10, sp, 228 /* [(local57)] */        #  2d8: a22139
            xor          a2, a5, a13                           #  2db: d02530
            add          a10, a10, a15                         #  2de: faaa
            add          a10, a10, a12                         #  2e0: caaa
            and          a2, a0, a2                            #  2e2: 202010
            xor          a2, a5, a2                            #  2e5: 202530
            add          a9, a9, a10                           #  2e8: aa99
            add          a9, a9, a6                            #  2ea: 6a99
            l32i         a10, sp, 36 /* [(local9)] */          #  2ec: a891
            src          a15, a9, a9                           #  2ee: 90f981
            ssai         24                                    #  2f1: 104840
            src          a12, a10, a10                         #  2f4: a0ca81
            and          a12, a12, a8                          #  2f7: 80cc10
            ssai         8                                     #  2fa: 004840
            src          a10, a10, a10                         #  2fd: a0aa81
            and          a10, a10, a4                          #  300: 40aa10
            ssai         2                                     #  303: 004240
            src          a0, a0, a0                            #  306: 000081
            or           a10, a10, a12                         #  309: c0aa20
            s32i         a10, sp, 220 /* a10 -> [(local55)] */ #  30c: a26137
            l32i         a12, sp, 224 /* [(local56)] */        #  30f: c22138
            ssai         27                                    #  312: 104b40
            add          a12, a12, a2                          #  315: 2acc
            l32i         a2, sp, 40 /* [(local10)] */          #  317: 28a1
            add          a12, a12, a15                         #  319: facc
            add          a11, a11, a12                         #  31b: cabb
            xor          a15, a13, a0                          #  31d: 00fd30
            and          a15, a9, a15                          #  320: f0f910
            add          a11, a11, a6                          #  323: 6abb
            src          a12, a11, a11                         #  325: b0cb81
            xor          a15, a13, a15                         #  328: f0fd30
            ssai         24                                    #  32b: 104840
            src          a10, a2, a2                           #  32e: 20a281
            and          a10, a10, a8                          #  331: 80aa10
            ssai         8                                     #  334: 004840
            src          a2, a2, a2                            #  337: 202281
            and          a2, a2, a4                            #  33a: 402210
            ssai         2                                     #  33d: 004240
            src          a9, a9, a9                            #  340: 909981
            or           a2, a2, a10                           #  343: a02220
            s32i         a2, sp, 216 /* a2 -> [(local54)] */   #  346: 226136
            l32i         a10, sp, 220 /* [(local55)] */        #  349: a22137
            ssai         27                                    #  34c: 104b40
            add          a10, a10, a15                         #  34f: faaa
            add          a10, a10, a12                         #  351: caaa
            add          a5, a5, a10                           #  353: aa55
            l32i         a12, sp, 44 /* [(local11)] */         #  355: c8b1
            xor          a10, a0, a9                           #  357: 90a030
            add          a5, a5, a6                            #  35a: 6a55
            src          a2, a5, a5                            #  35c: 502581
            and          a10, a11, a10                         #  35f: a0ab10
            xor          a10, a0, a10                          #  362: a0a030
            ssai         24                                    #  365: 104840
            src          a15, a12, a12                         #  368: c0fc81
            and          a15, a15, a8                          #  36b: 80ff10
            ssai         8                                     #  36e: 004840
            src          a12, a12, a12                         #  371: c0cc81
            and          a12, a12, a4                          #  374: 40cc10
            ssai         2                                     #  377: 004240
            src          a11, a11, a11                         #  37a: b0bb81
            or           a12, a12, a15                         #  37d: f0cc20
            ssai         27                                    #  380: 104b40
            s32i         a12, sp, 212 /* a12 -> [(local53)] */ #  383: c26135
            l32i         a15, sp, 216 /* [(local54)] */        #  386: f22136
            xor          a12, a11, a9                          #  389: 90cb30
            add          a15, a15, a10                         #  38c: aaff
            add          a15, a15, a2                          #  38e: 2aff
            and          a12, a5, a12                          #  390: c0c510
            xor          a12, a9, a12                          #  393: c0c930
            add          a13, a13, a15                         #  396: fadd
            add          a13, a13, a6                          #  398: 6add
            l32i         a15, sp, 48 /* [(local12)] */         #  39a: f8c1
            src          a10, a13, a13                         #  39c: d0ad81
            ssai         24                                    #  39f: 104840
            src          a2, a15, a15                          #  3a2: f02f81
            and          a2, a2, a8                            #  3a5: 802210
            ssai         8                                     #  3a8: 004840
            src          a15, a15, a15                         #  3ab: f0ff81
            and          a15, a15, a4                          #  3ae: 40ff10
            ssai         2                                     #  3b1: 004240
            src          a5, a5, a5                            #  3b4: 505581
            or           a15, a15, a2                          #  3b7: 20ff20
            ssai         27                                    #  3ba: 104b40
            s32i         a15, sp, 208 /* a15 -> [(local52)] */ #  3bd: f26134
            l32i         a2, sp, 212 /* [(local53)] */         #  3c0: 222135
            xor          a15, a11, a5                          #  3c3: 50fb30
            add          a2, a2, a12                           #  3c6: ca22
            add          a2, a2, a10                           #  3c8: aa22
            and          a15, a13, a15                         #  3ca: f0fd10
            xor          a15, a11, a15                         #  3cd: f0fb30
            add          a0, a0, a2                            #  3d0: 2a00
            add          a0, a0, a6                            #  3d2: 6a00
            l32i         a2, sp, 52 /* [(local13)] */          #  3d4: 28d1
            src          a12, a0, a0                           #  3d6: 00c081
            ssai         24                                    #  3d9: 104840
            src          a10, a2, a2                           #  3dc: 20a281
            and          a10, a10, a8                          #  3df: 80aa10
            ssai         8                                     #  3e2: 004840
            src          a2, a2, a2                            #  3e5: 202281
            and          a2, a2, a4                            #  3e8: 402210
            ssai         2                                     #  3eb: 004240
            src          a13, a13, a13                         #  3ee: d0dd81
            or           a2, a2, a10                           #  3f1: a02220
            ssai         27                                    #  3f4: 104b40
            s32i         a2, sp, 204 /* a2 -> [(local51)] */   #  3f7: 226133
            l32i         a10, sp, 208 /* [(local52)] */        #  3fa: a22134
            xor          a2, a5, a13                           #  3fd: d02530
            add          a10, a10, a15                         #  400: faaa
            add          a10, a10, a12                         #  402: caaa
            and          a2, a0, a2                            #  404: 202010
            xor          a2, a5, a2                            #  407: 202530
            add          a9, a9, a10                           #  40a: aa99
            add          a9, a9, a6                            #  40c: 6a99
            l32i         a10, sp, 56 /* [(local14)] */         #  40e: a8e1
            src          a15, a9, a9                           #  410: 90f981
            ssai         24                                    #  413: 104840
            src          a12, a10, a10                         #  416: a0ca81
            and          a12, a12, a8                          #  419: 80cc10
            ssai         8                                     #  41c: 004840
            src          a10, a10, a10                         #  41f: a0aa81
            and          a10, a10, a4                          #  422: 40aa10
            ssai         2                                     #  425: 004240
            src          a0, a0, a0                            #  428: 000081
            or           a10, a10, a12                         #  42b: c0aa20
            s32i         a10, sp, 200 /* a10 -> [(local50)] */ #  42e: a26132
            l32i         a12, sp, 204 /* [(local51)] */        #  431: c22133
            ssai         27                                    #  434: 104b40
            add          a12, a12, a2                          #  437: 2acc
            add          a12, a12, a15                         #  439: facc
            add          a11, a11, a12                         #  43b: cabb
            l32i         a15, sp, 60 /* [(local15)] */         #  43d: f8f1
            xor          a12, a13, a0                          #  43f: 00cd30
            add          a11, a11, a6                          #  442: 6abb
            src          a10, a11, a11                         #  444: b0ab81
            and          a12, a9, a12                          #  447: c0c910
            xor          a12, a13, a12                         #  44a: c0cd30
            ssai         24                                    #  44d: 104840
            src          a2, a15, a15                          #  450: f02f81
            and          a2, a2, a8                            #  453: 802210
            ssai         8                                     #  456: 004840
            l32i         a8, sp, 200 /* [(local50)] */         #  459: 822132
            src          a15, a15, a15                         #  45c: f0ff81
            and          a15, a15, a4                          #  45f: 40ff10
            ssai         2                                     #  462: 004240
            add          a8, a8, a12                           #  465: ca88
            src          a9, a9, a9                            #  467: 909981
            or           a15, a15, a2                          #  46a: 20ff20
            ssai         27                                    #  46d: 104b40
            s32i         a15, sp, 196 /* a15 -> [(local49)] */ #  470: f26131
            add          a8, a8, a10                           #  473: aa88
            l32i         a12, sp, 0x100 /* [(local64)] */      #  475: c22140
            l32i         a10, sp, 200 /* [(local50)] */        #  478: a22132
            xor          a2, a0, a9                            #  47b: 902030
            add          a5, a5, a8                            #  47e: 8a55
            xor          a12, a12, a14                         #  480: e0cc30
            add          a5, a5, a6                            #  483: 6a55
            l32i         a8, sp, 220 /* [(local55)] */         #  485: 822137
            and          a2, a11, a2                           #  488: 202b10
            xor          a2, a0, a2                            #  48b: 202030
            add          a15, a15, a2                          #  48e: 2aff
            xor          a8, a8, a10                           #  490: a08830
            src          a2, a5, a5                            #  493: 502581
            xor          a7, a7, a8                            #  496: 807730
            ssai         31                                    #  499: 104f40
            add          a15, a15, a2                          #  49c: 2aff
            add          a13, a13, a15                         #  49e: fadd
            l32i         a2, sp, 204 /* [(local51)] */         #  4a0: 222133
            l32i         a15, sp, 224 /* [(local56)] */        #  4a3: f22138
            add          a13, a13, a6                          #  4a6: 6add
            xor          a15, a15, a2                          #  4a8: 20ff30
            xor          a12, a12, a15                         #  4ab: f0cc30
            l32i         a15, sp, 216 /* [(local54)] */        #  4ae: f22136
            src          a12, a12, a12                         #  4b1: c0cc81
            s32i         a12, sp, 192 /* a12 -> [(local48)] */ #  4b4: c26130
            ssai         2                                     #  4b7: 004240
            src          a11, a11, a11                         #  4ba: b0bb81
            xor          a4, a11, a9                           #  4bd: 904b30
            ssai         27                                    #  4c0: 104b40
            and          a4, a5, a4                            #  4c3: 404510
            xor          a4, a9, a4                            #  4c6: 404930
            add          a2, a12, a4                           #  4c9: 4a2c
            src          a4, a13, a13                          #  4cb: d04d81
            add          a2, a2, a4                            #  4ce: 4a22
            ssai         31                                    #  4d0: 104f40
            l32i         a4, sp, 212 /* [(local53)] */         #  4d3: 422135
            add          a0, a0, a2                            #  4d6: 2a00
            src          a7, a7, a7                            #  4d8: 707781
            s32i         a7, sp, 188 /* a7 -> [(local47)] */   #  4db: 72612f
            add          a0, a0, a6                            #  4de: 6a00
            ssai         2                                     #  4e0: 004240
            l32i         a2, sp, 196 /* [(local49)] */         #  4e3: 222131
            src          a5, a5, a5                            #  4e6: 505581
            ssai         27                                    #  4e9: 104b40
            xor          a15, a15, a2                          #  4ec: 20ff30
            xor          a12, a11, a5                          #  4ef: 50cb30
            l32i         a2, sp, 192 /* [(local48)] */         #  4f2: 222130
            and          a12, a13, a12                         #  4f5: c0cd10
            xor          a12, a11, a12                         #  4f8: c0cb30
            add          a10, a7, a12                          #  4fb: caa7
            xor          a2, a2, a4                            #  4fd: 402230
            src          a12, a0, a0                           #  500: 00c081
            ssai         31                                    #  503: 104f40
            add          a10, a10, a12                         #  506: caaa
            add          a9, a9, a10                           #  508: aa99
            l32i         a12, sp, 240 /* [(local60)] */        #  50a: c2213c
            l32i         a10, sp, 188 /* [(local47)] */        #  50d: a2212f
            add          a9, a9, a6                            #  510: 6a99
            xor          a14, a14, a12                         #  512: c0ee30
            xor          a14, a14, a15                         #  515: f0ee30
            src          a14, a14, a14                         #  518: e0ee81
            s32i         a14, sp, 184 /* a14 -> [(local46)] */ #  51b: e2612e
            ssai         2                                     #  51e: 004240
            src          a13, a13, a13                         #  521: d0dd81
            xor          a15, a5, a13                          #  524: d0f530
            ssai         27                                    #  527: 104b40
            and          a15, a0, a15                          #  52a: f0f010
            xor          a15, a5, a15                          #  52d: f0f530
            add          a14, a14, a15                         #  530: faee
            src          a15, a9, a9                           #  532: 90f981
            add          a14, a14, a15                         #  535: faee
            ssai         31                                    #  537: 104f40
            l32i         a15, sp, 208 /* [(local52)] */        #  53a: f22134
            add          a11, a11, a14                         #  53d: eabb
            add          a11, a11, a6                          #  53f: 6abb
            l32i         a14, sp, 236 /* [(local59)] */        #  541: e2213b
            xor          a10, a10, a15                         #  544: f0aa30
            xor          a3, a3, a14                           #  547: e03330
            xor          a2, a2, a3                            #  54a: 302230
            movi         a3, 0x6ed9eba1                        #  54d: 31c5fe
            src          a2, a2, a2                            #  550: 202281
            s32i         a2, sp, 180 /* a2 -> [(local45)] */   #  553: 22612d
            ssai         2                                     #  556: 004240
            src          a0, a0, a0                            #  559: 000081
            xor          a8, a13, a0                           #  55c: 008d30
            ssai         27                                    #  55f: 104b40
            and          a8, a9, a8                            #  562: 808910
            xor          a8, a13, a8                           #  565: 808d30
            add          a7, a2, a8                            #  568: 8a72
            src          a8, a11, a11                          #  56a: b08b81
            add          a7, a7, a8                            #  56d: 8a77
            ssai         31                                    #  56f: 104f40
            l32i         a8, sp, 200 /* [(local50)] */         #  572: 822132
            add          a5, a5, a7                            #  575: 7a55
            add          a5, a5, a6                            #  577: 6a55
            l32i         a7, sp, 232 /* [(local58)] */         #  579: 72213a
            l32i         a6, sp, 180 /* [(local45)] */         #  57c: 62212d
            xor          a12, a12, a7                          #  57f: 70cc30
            xor          a10, a10, a12                         #  582: c0aa30
            xor          a6, a6, a8                            #  585: 806630
            l32i         a12, sp, 184 /* [(local46)] */        #  588: c2212e
            l32i         a8, sp, 224 /* [(local56)] */         #  58b: 822138
            src          a10, a10, a10                         #  58e: a0aa81
            s32i         a10, sp, 176 /* a10 -> [(local44)] */ #  591: a2612c
            ssai         2                                     #  594: 004240
            xor          a7, a7, a8                            #  597: 807730
            src          a9, a9, a9                            #  59a: 909981
            l32i         a8, sp, 204 /* [(local51)] */         #  59d: 822133
            xor          a6, a6, a7                            #  5a0: 706630
            xor          a2, a9, a11                           #  5a3: b02930
            xor          a2, a0, a2                            #  5a6: 202030
            ssai         27                                    #  5a9: 104b40
            add          a15, a10, a2                          #  5ac: 2afa
            src          a2, a5, a5                            #  5ae: 502581
            add          a15, a15, a2                          #  5b1: 2aff
            add          a13, a13, a15                         #  5b3: fadd
            l32i         a15, sp, 204 /* [(local51)] */        #  5b5: f22133
            ssai         31                                    #  5b8: 104f40
            xor          a12, a12, a15                         #  5bb: f0cc30
            l32i         a15, sp, 228 /* [(local57)] */        #  5be: f22139
            add          a13, a13, a3                          #  5c1: 3add
            xor          a14, a14, a15                         #  5c3: f0ee30
            xor          a12, a12, a14                         #  5c6: e0cc30
            l32i         a15, sp, 196 /* [(local49)] */        #  5c9: f22131
            l32i         a14, sp, 176 /* [(local44)] */        #  5cc: e2212c
            src          a12, a12, a12                         #  5cf: c0cc81
            s32i         a12, sp, 172 /* a12 -> [(local43)] */ #  5d2: c2612b
            ssai         2                                     #  5d5: 004240
            xor          a14, a14, a15                         #  5d8: f0ee30
            src          a11, a11, a11                         #  5db: b0bb81
            l32i         a15, sp, 228 /* [(local57)] */        #  5de: f22139
            xor          a4, a11, a5                           #  5e1: 504b30
            ssai         27                                    #  5e4: 104b40
            xor          a4, a9, a4                            #  5e7: 404930
            add          a2, a12, a4                           #  5ea: 4a2c
            src          a4, a13, a13                          #  5ec: d04d81
            add          a2, a2, a4                            #  5ef: 4a22
            ssai         31                                    #  5f1: 104f40
            l32i         a4, sp, 172 /* [(local43)] */         #  5f4: 42212b
            src          a6, a6, a6                            #  5f7: 606681
            add          a0, a0, a2                            #  5fa: 2a00
            add          a0, a0, a3                            #  5fc: 3a00
            s32i         a6, sp, 168 /* a6 -> [(local42)] */   #  5fe: 62612a
            ssai         2                                     #  601: 004240
            l32i         a2, sp, 220 /* [(local55)] */         #  604: 222137
            src          a5, a5, a5                            #  607: 505581
            ssai         27                                    #  60a: 104b40
            xor          a12, a5, a13                          #  60d: d0c530
            xor          a15, a15, a2                          #  610: 20ff30
            xor          a14, a14, a15                         #  613: f0ee30
            xor          a12, a11, a12                         #  616: c0cb30
            l32i         a2, sp, 192 /* [(local48)] */         #  619: 222130
            add          a10, a6, a12                          #  61c: caa6
            l32i         a6, sp, 216 /* [(local54)] */         #  61e: 622136
            xor          a2, a2, a4                            #  621: 402230
            src          a12, a0, a0                           #  624: 00c081
            l32i         a4, sp, 224 /* [(local56)] */         #  627: 422138
            ssai         31                                    #  62a: 104f40
            add          a10, a10, a12                         #  62d: caaa
            add          a9, a9, a10                           #  62f: aa99
            src          a14, a14, a14                         #  631: e0ee81
            l32i         a10, sp, 188 /* [(local47)] */        #  634: a2212f
            add          a9, a9, a3                            #  637: 3a99
            ssai         2                                     #  639: 004240
            s32i         a14, sp, 164 /* a14 -> [(local41)] */ #  63c: e26129
            xor          a4, a4, a6                            #  63f: 604430
            xor          a2, a2, a4                            #  642: 402230
            l32i         a12, sp, 164 /* [(local41)] */        #  645: c22129
            src          a13, a13, a13                         #  648: d0dd81
            xor          a14, a13, a0                          #  64b: 00ed30
            ssai         27                                    #  64e: 104b40
            xor          a14, a5, a14                          #  651: e0e530
            add          a12, a12, a14                         #  654: eacc
            src          a14, a9, a9                           #  656: 90e981
            add          a12, a12, a14                         #  659: eacc
            ssai         31                                    #  65b: 104f40
            l32i         a14, sp, 212 /* [(local53)] */        #  65e: e22135
            add          a11, a11, a12                         #  661: cabb
            src          a2, a2, a2                            #  663: 202281
            s32i         a2, sp, 160 /* a2 -> [(local40)] */   #  666: 226128
            add          a11, a11, a3                          #  669: 3abb
            ssai         2                                     #  66b: 004240
            l32i         a12, sp, 168 /* [(local42)] */        #  66e: c2212a
            src          a0, a0, a0                            #  671: 000081
            ssai         27                                    #  674: 104b40
            xor          a10, a10, a12                         #  677: c0aa30
            xor          a7, a0, a9                            #  67a: 907030
            xor          a7, a13, a7                           #  67d: 707d30
            l32i         a12, sp, 220 /* [(local55)] */        #  680: c22137
            add          a6, a2, a7                            #  683: 7a62
            src          a7, a11, a11                          #  685: b07b81
            xor          a12, a12, a14                         #  688: e0cc30
            ssai         31                                    #  68b: 104f40
            xor          a10, a10, a12                         #  68e: c0aa30
            add          a6, a6, a7                            #  691: 7a66
            l32i         a12, sp, 184 /* [(local46)] */        #  693: c2212e
            l32i         a7, sp, 160 /* [(local40)] */         #  696: 722128
            add          a5, a5, a6                            #  699: 6a55
            add          a5, a5, a3                            #  69b: 3a55
            l32i         a6, sp, 180 /* [(local45)] */         #  69d: 62212d
            src          a10, a10, a10                         #  6a0: a0aa81
            s32i         a10, sp, 156 /* a10 -> [(local39)] */ #  6a3: a26127
            ssai         2                                     #  6a6: 004240
            src          a9, a9, a9                            #  6a9: 909981
            xor          a6, a6, a7                            #  6ac: 706630
            ssai         27                                    #  6af: 104b40
            l32i         a7, sp, 212 /* [(local53)] */         #  6b2: 722135
            xor          a15, a9, a11                          #  6b5: b0f930
            xor          a15, a0, a15                          #  6b8: f0f030
            xor          a7, a7, a8                            #  6bb: 807730
            add          a14, a10, a15                         #  6be: faea
            l32i         a8, sp, 188 /* [(local47)] */         #  6c0: 82212f
            xor          a6, a6, a7                            #  6c3: 706630
            src          a15, a5, a5                           #  6c6: 50f581
            add          a14, a14, a15                         #  6c9: faee
            ssai         31                                    #  6cb: 104f40
            add          a13, a13, a14                         #  6ce: eadd
            l32i         a14, sp, 164 /* [(local41)] */        #  6d0: e22129
            l32i         a15, sp, 208 /* [(local52)] */        #  6d3: f22134
            xor          a12, a12, a14                         #  6d6: e0cc30
            l32i         a14, sp, 216 /* [(local54)] */        #  6d9: e22136
            add          a13, a13, a3                          #  6dc: 3add
            xor          a14, a14, a15                         #  6de: f0ee30
            xor          a12, a12, a14                         #  6e1: e0cc30
            l32i         a15, sp, 156 /* [(local39)] */        #  6e4: f22127
            l32i         a14, sp, 176 /* [(local44)] */        #  6e7: e2212c
            src          a12, a12, a12                         #  6ea: c0cc81
            s32i         a12, sp, 152 /* a12 -> [(local38)] */ #  6ed: c26126
            ssai         2                                     #  6f0: 004240
            xor          a14, a14, a15                         #  6f3: f0ee30
            src          a11, a11, a11                         #  6f6: b0bb81
            l32i         a15, sp, 208 /* [(local52)] */        #  6f9: f22134
            xor          a4, a11, a5                           #  6fc: 504b30
            ssai         27                                    #  6ff: 104b40
            xor          a4, a9, a4                            #  702: 404930
            add          a2, a12, a4                           #  705: 4a2c
            src          a4, a13, a13                          #  707: d04d81
            add          a2, a2, a4                            #  70a: 4a22
            ssai         31                                    #  70c: 104f40
            l32i         a4, sp, 152 /* [(local38)] */         #  70f: 422126
            src          a6, a6, a6                            #  712: 606681
            add          a0, a0, a2                            #  715: 2a00
            add          a0, a0, a3                            #  717: 3a00
            s32i         a6, sp, 148 /* a6 -> [(local37)] */   #  719: 626125
            ssai         2                                     #  71c: 004240
            l32i         a2, sp, 200 /* [(local50)] */         #  71f: 222132
            src          a5, a5, a5                            #  722: 505581
            ssai         27                                    #  725: 104b40
            xor          a12, a5, a13                          #  728: d0c530
            xor          a15, a15, a2                          #  72b: 20ff30
            xor          a14, a14, a15                         #  72e: f0ee30
            xor          a12, a11, a12                         #  731: c0cb30
            l32i         a2, sp, 172 /* [(local43)] */         #  734: 22212b
            add          a10, a6, a12                          #  737: caa6
            l32i         a6, sp, 196 /* [(local49)] */         #  739: 622131
            xor          a2, a2, a4                            #  73c: 402230
            src          a12, a0, a0                           #  73f: 00c081
            l32i         a4, sp, 204 /* [(local51)] */         #  742: 422133
            ssai         31                                    #  745: 104f40
            add          a10, a10, a12                         #  748: caaa
            add          a9, a9, a10                           #  74a: aa99
            src          a14, a14, a14                         #  74c: e0ee81
            l32i         a10, sp, 192 /* [(local48)] */        #  74f: a22130
            add          a9, a9, a3                            #  752: 3a99
            ssai         2                                     #  754: 004240
            s32i         a14, sp, 136 /* a14 -> [(local34)] */ #  757: e26122
            xor          a4, a4, a6                            #  75a: 604430
            xor          a2, a2, a4                            #  75d: 402230
            l32i         a12, sp, 136 /* [(local34)] */        #  760: c22122
            src          a13, a13, a13                         #  763: d0dd81
            xor          a14, a13, a0                          #  766: 00ed30
            ssai         27                                    #  769: 104b40
            xor          a14, a5, a14                          #  76c: e0e530
            add          a12, a12, a14                         #  76f: eacc
            src          a14, a9, a9                           #  771: 90e981
            add          a12, a12, a14                         #  774: eacc
            ssai         31                                    #  776: 104f40
            l32i         a14, sp, 148 /* [(local37)] */        #  779: e22125
            add          a11, a11, a12                         #  77c: cabb
            src          a2, a2, a2                            #  77e: 202281
            s32i         a2, sp, 140 /* a2 -> [(local35)] */   #  781: 226123
            add          a11, a11, a3                          #  784: 3abb
            ssai         2                                     #  786: 004240
            l32i         a12, sp, 168 /* [(local42)] */        #  789: c2212a
            src          a0, a0, a0                            #  78c: 000081
            ssai         27                                    #  78f: 104b40
            xor          a12, a12, a14                         #  792: e0cc30
            xor          a7, a0, a9                            #  795: 907030
            xor          a7, a13, a7                           #  798: 707d30
            l32i         a14, sp, 200 /* [(local50)] */        #  79b: e22132
            add          a6, a2, a7                            #  79e: 7a62
            src          a7, a11, a11                          #  7a0: b07b81
            xor          a10, a10, a14                         #  7a3: e0aa30
            ssai         31                                    #  7a6: 104f40
            add          a6, a6, a7                            #  7a9: 7a66
            xor          a10, a10, a12                         #  7ab: c0aa30
            l32i         a7, sp, 160 /* [(local40)] */         #  7ae: 722128
            add          a5, a5, a6                            #  7b1: 6a55
            l32i         a12, sp, 136 /* [(local34)] */        #  7b3: c22122
            l32i         a6, sp, 192 /* [(local48)] */         #  7b6: 622130
            add          a5, a5, a3                            #  7b9: 3a55
            src          a10, a10, a10                         #  7bb: a0aa81
            s32i         a10, sp, 144 /* a10 -> [(local36)] */ #  7be: a26124
            ssai         2                                     #  7c1: 004240
            src          a9, a9, a9                            #  7c4: 909981
            xor          a15, a9, a11                          #  7c7: b0f930
            ssai         27                                    #  7ca: 104b40
            xor          a15, a0, a15                          #  7cd: f0f030
            add          a14, a10, a15                         #  7d0: faea
            l32i         a10, sp, 164 /* [(local41)] */        #  7d2: a22129
            src          a15, a5, a5                           #  7d5: 50f581
            add          a14, a14, a15                         #  7d8: faee
            ssai         31                                    #  7da: 104f40
            l32i         a15, sp, 148 /* [(local37)] */        #  7dd: f22125
            xor          a10, a10, a12                         #  7e0: c0aa30
            add          a13, a13, a14                         #  7e3: eadd
            l32i         a12, sp, 196 /* [(local49)] */        #  7e5: c22131
            add          a13, a13, a3                          #  7e8: 3add
            xor          a8, a8, a12                           #  7ea: c08830
            xor          a8, a8, a10                           #  7ed: a08830
            l32i         a10, sp, 140 /* [(local35)] */        #  7f0: a22123
            src          a8, a8, a8                            #  7f3: 808881
            s32i         a8, sp, 0x104 /* a8 -> [(local65)] */ #  7f6: 826141
            ssai         2                                     #  7f9: 004240
            xor          a7, a7, a10                           #  7fc: a07730
            src          a11, a11, a11                         #  7ff: b0bb81
            l32i         a10, sp, 184 /* [(local46)] */        #  802: a2212e
            xor          a2, a11, a5                           #  805: 502b30
            ssai         27                                    #  808: 104b40
            src          a4, a13, a13                          #  80b: d04d81
            xor          a2, a9, a2                            #  80e: 202930
            ssai         31                                    #  811: 104f40
            xor          a6, a6, a10                           #  814: a06630
            add          a2, a8, a2                            #  817: 2a28
            add          a2, a2, a4                            #  819: 4a22
            xor          a6, a6, a7                            #  81b: 706630
            l32i         a4, sp, 188 /* [(local47)] */         #  81e: 42212f
            l32i         a7, sp, 156 /* [(local39)] */         #  821: 722127
            add          a0, a0, a2                            #  824: 2a00
            src          a6, a6, a6                            #  826: 606681
            s32i         a6, sp, 76 /* a6 -> [(local19)] */    #  829: 626113
            xor          a15, a6, a15                          #  82c: f0f630
            l32i         a2, sp, 184 /* [(local46)] */         #  82f: 22212e
            ssai         2                                     #  832: 004240
            add          a0, a0, a3                            #  835: 3a00
            src          a5, a5, a5                            #  837: 505581
            ssai         27                                    #  83a: 104b40
            xor          a10, a5, a13                          #  83d: d0a530
            xor          a10, a11, a10                         #  840: a0ab30
            src          a12, a0, a0                           #  843: 00c081
            add          a10, a6, a10                          #  846: aaa6
            add          a10, a10, a12                         #  848: caaa
            add          a9, a9, a10                           #  84a: aa99
            l32i         a10, sp, 144 /* [(local36)] */        #  84c: a22124
            ssai         31                                    #  84f: 104f40
            xor          a7, a7, a10                           #  852: a07730
            l32i         a10, sp, 180 /* [(local45)] */        #  855: a2212d
            add          a9, a9, a3                            #  858: 3a99
            xor          a4, a4, a10                           #  85a: a04430
            xor          a4, a4, a7                            #  85d: 704430
            l32i         a7, sp, 152 /* [(local38)] */         #  860: 722126
            src          a4, a4, a4                            #  863: 404481
            s32i         a4, sp, 80 /* a4 -> [(local20)] */    #  866: 426114
            ssai         2                                     #  869: 004240
            xor          a7, a7, a8                            #  86c: 807730
            src          a13, a13, a13                         #  86f: d0dd81
            l32i         a8, sp, 176 /* [(local44)] */         #  872: 82212c
            xor          a12, a13, a0                          #  875: 00cd30
            ssai         27                                    #  878: 104b40
            src          a14, a9, a9                           #  87b: 90e981
            xor          a12, a5, a12                          #  87e: c0c530
            ssai         31                                    #  881: 104f40
            add          a12, a4, a12                          #  884: cac4
            xor          a2, a2, a8                            #  886: 802230
            xor          a2, a2, a7                            #  889: 702230
            add          a12, a12, a14                         #  88c: eacc
            add          a11, a11, a12                         #  88e: cabb
            src          a2, a2, a2                            #  890: 202281
            s32i         a2, sp, 84 /* a2 -> [(local21)] */    #  893: 226115
            add          a11, a11, a3                          #  896: 3abb
            l32i         a12, sp, 140 /* [(local35)] */        #  898: c22123
            ssai         2                                     #  89b: 004240
            src          a0, a0, a0                            #  89e: 000081
            xor          a12, a2, a12                          #  8a1: c0c230
            xor          a7, a0, a9                            #  8a4: 907030
            ssai         27                                    #  8a7: 104b40
            src          a8, a11, a11                          #  8aa: b08b81
            xor          a7, a13, a7                           #  8ad: 707d30
            add          a7, a2, a7                            #  8b0: 7a72
            ssai         31                                    #  8b2: 104f40
            add          a7, a7, a8                            #  8b5: 8a77
            l32i         a8, sp, 172 /* [(local43)] */         #  8b7: 82212b
            add          a5, a5, a7                            #  8ba: 7a55
            add          a5, a5, a3                            #  8bc: 3a55
            xor          a7, a10, a8                           #  8be: 807a30
            l32i         a8, sp, 168 /* [(local42)] */         #  8c1: 82212a
            xor          a15, a15, a7                          #  8c4: 70ff30
            src          a15, a15, a15                         #  8c7: f0ff81
            s32i         a15, sp, 92 /* a15 -> [(local23)] */  #  8ca: f26117
            ssai         2                                     #  8cd: 004240
            src          a9, a9, a9                            #  8d0: 909981
            xor          a14, a9, a11                          #  8d3: b0e930
            ssai         27                                    #  8d6: 104b40
            src          a7, a5, a5                            #  8d9: 507581
            xor          a14, a0, a14                          #  8dc: e0e030
            add          a14, a15, a14                         #  8df: eaef
            ssai         31                                    #  8e1: 104f40
            add          a14, a14, a7                          #  8e4: 7aee
            l32i         a7, sp, 176 /* [(local44)] */         #  8e6: 72212c
            add          a13, a13, a14                         #  8e9: eadd
            add          a13, a13, a3                          #  8eb: 3add
            l32i         a14, sp, 136 /* [(local34)] */        #  8ed: e22122
            xor          a7, a7, a8                            #  8f0: 807730
            xor          a14, a4, a14                          #  8f3: e0e430
            xor          a14, a14, a7                          #  8f6: 70ee30
            src          a14, a14, a14                         #  8f9: e0ee81
            s32i         a14, sp, 100 /* a14 -> [(local25)] */ #  8fc: e26119
            ssai         2                                     #  8ff: 004240
            src          a11, a11, a11                         #  902: b0bb81
            xor          a7, a11, a5                           #  905: 507b30
            ssai         27                                    #  908: 104b40
            src          a8, a13, a13                          #  90b: d08d81
            xor          a7, a9, a7                            #  90e: 707930
            ssai         31                                    #  911: 104f40
            add          a7, a14, a7                           #  914: 7a7e
            add          a7, a7, a8                            #  916: 8a77
            add          a0, a0, a7                            #  918: 7a00
            l32i         a8, sp, 164 /* [(local41)] */         #  91a: 822129
            l32i         a7, sp, 172 /* [(local43)] */         #  91d: 72212b
            add          a0, a0, a3                            #  920: 3a00
            xor          a7, a7, a8                            #  922: 807730
            l32i         a8, sp, 160 /* [(local40)] */         #  925: 822128
            xor          a12, a12, a7                          #  928: 70cc30
            src          a12, a12, a12                         #  92b: c0cc81
            s32i         a12, sp, 104 /* a12 -> [(local26)] */ #  92e: c2611a
            ssai         2                                     #  931: 004240
            src          a5, a5, a5                            #  934: 505581
            xor          a10, a5, a13                          #  937: d0a530
            ssai         27                                    #  93a: 104b40
            src          a7, a0, a0                            #  93d: 007081
            xor          a10, a11, a10                         #  940: a0ab30
            add          a10, a12, a10                         #  943: aaac
            ssai         31                                    #  945: 104f40
            add          a10, a10, a7                          #  948: 7aaa
            l32i         a7, sp, 168 /* [(local42)] */         #  94a: 72212a
            add          a9, a9, a10                           #  94d: aa99
            add          a9, a9, a3                            #  94f: 3a99
            l32i         a10, sp, 144 /* [(local36)] */        #  951: a22124
            xor          a7, a7, a8                            #  954: 807730
            l32i         a8, sp, 0x104 /* [(local65)] */       #  957: 822141
            xor          a10, a15, a10                         #  95a: a0af30
            xor          a10, a10, a7                          #  95d: 70aa30
            xor          a8, a14, a8                           #  960: 808e30
            src          a10, a10, a10                         #  963: a0aa81
            s32i         a10, sp, 108 /* a10 -> [(local27)] */ #  966: a2611b
            ssai         2                                     #  969: 004240
            src          a13, a13, a13                         #  96c: d0dd81
            xor          a3, a13, a0                           #  96f: 003d30
            ssai         27                                    #  972: 104b40
            src          a7, a9, a9                            #  975: 907981
            xor          a3, a5, a3                            #  978: 303530
            add          a3, a10, a3                           #  97b: 3a3a
            add          a3, a3, a7                            #  97d: 7a33
            add          a11, a11, a3                          #  97f: 3abb
            l32i         a7, sp, 156 /* [(local39)] */         #  981: 722127
            l32i         a3, sp, 164 /* [(local41)] */         #  984: 322129
            ssai         31                                    #  987: 104f40
            xor          a3, a3, a7                            #  98a: 703330
            movi         a7, 0x6ed9eba1                        #  98d: 71b6fd
            xor          a8, a8, a3                            #  990: 308830
            src          a8, a8, a8                            #  993: 808881
            add          a11, a11, a7                          #  996: 7abb
            s32i         a8, sp, 0x108 /* a8 -> [(local66)] */ #  998: 826142
            ssai         2                                     #  99b: 004240
            src          a0, a0, a0                            #  99e: 000081
            xor          a3, a0, a9                            #  9a1: 903030
            xor          a3, a13, a3                           #  9a4: 303d30
            ssai         27                                    #  9a7: 104b40
            add          a8, a8, a3                            #  9aa: 3a88
            src          a3, a11, a11                          #  9ac: b03b81
            ssai         31                                    #  9af: 104f40
            add          a8, a8, a3                            #  9b2: 3a88
            add          a5, a5, a8                            #  9b4: 8a55
            add          a5, a5, a7                            #  9b6: 7a55
            l32i         a8, sp, 152 /* [(local38)] */         #  9b8: 822126
            l32i         a7, sp, 160 /* [(local40)] */         #  9bb: 722128
            xor          a3, a6, a12                           #  9be: c03630
            xor          a7, a7, a8                            #  9c1: 807730
            xor          a3, a3, a7                            #  9c4: 703330
            src          a3, a3, a3                            #  9c7: 303381
            ssai         2                                     #  9ca: 004240
            s32i         a3, sp, 0x114 /* a3 -> [(local69)] */ #  9cd: 326145
            src          a9, a9, a9                            #  9d0: 909981
            ssai         27                                    #  9d3: 104b40
            and          a8, a9, a11                           #  9d6: b08910
            or           a7, a9, a11                           #  9d9: b07920
            and          a7, a0, a7                            #  9dc: 707010
            or           a7, a7, a8                            #  9df: 807720
            add          a3, a3, a7                            #  9e2: 7a33
            l32i         a8, sp, 148 /* [(local37)] */         #  9e4: 822125
            src          a7, a5, a5                            #  9e7: 507581
            ssai         31                                    #  9ea: 104f40
            add          a3, a3, a7                            #  9ed: 7a33
            add          a13, a13, a3                          #  9ef: 3add
            l32i         a7, sp, 156 /* [(local39)] */         #  9f1: 722127
            xor          a3, a4, a10                           #  9f4: a03430
            xor          a7, a7, a8                            #  9f7: 807730
            xor          a3, a3, a7                            #  9fa: 703330
            src          a3, a3, a3                            #  9fd: 303381
            ssai         2                                     #  a00: 004240
            s32i         a3, sp, 0x10c /* a3 -> [(local67)] */ #  a03: 326143
            l32i         a3, sp, 0x10c /* [(local67)] */       #  a06: 322143
            src          a11, a11, a11                         #  a09: b0bb81
            s32i         a11, sp, 0x110 /* a11 -> [(local68)] */ #  a0c: b26144
            ssai         27                                    #  a0f: 104b40
            and          a7, a11, a5                           #  a12: 507b10
            or           a8, a11, a5                           #  a15: 508b20
            and          a8, a9, a8                            #  a18: 808910
            or           a7, a7, a8                            #  a1b: 807720
            add          a3, a3, a7                            #  a1e: 7a33
            l32i         a8, sp, 0x108 /* [(local66)] */       #  a20: 822142
            movi         a7, 0x8f1bbcdc                        #  a23: 7192fd
            xor          a8, a2, a8                            #  a26: 808230
            add          a13, a13, a7                          #  a29: 7add
            src          a7, a13, a13                          #  a2b: d07d81
            add          a3, a3, a7                            #  a2e: 7a33
            add          a0, a0, a3                            #  a30: 3a00
            l32i         a7, sp, 136 /* [(local34)] */         #  a32: 722122
            l32i         a3, sp, 152 /* [(local38)] */         #  a35: 322126
            ssai         31                                    #  a38: 104f40
            xor          a3, a3, a7                            #  a3b: 703330
            xor          a8, a8, a3                            #  a3e: 308830
            l32i         a7, sp, 0x114 /* [(local69)] */       #  a41: 722145
            movi         a3, 0x8f1bbcdc                        #  a44: 318bfd
            src          a8, a8, a8                            #  a47: 808881
            xor          a7, a15, a7                           #  a4a: 707f30
            ssai         2                                     #  a4d: 004240
            add          a0, a0, a3                            #  a50: 3a00
            src          a5, a5, a5                            #  a52: 505581
            s32i         a5, sp, 88 /* a5 -> [(local22)] */    #  a55: 526116
            s32i         a0, sp, 72 /* a0 -> [(local18)] */    #  a58: 026112
            or           a3, a5, a13                           #  a5b: d03520
            ssai         27                                    #  a5e: 104b40
            and          a11, a11, a3                          #  a61: 30bb10
            and          a3, a5, a13                           #  a64: d03510
            or           a11, a11, a3                          #  a67: 30bb20
            src          a3, a0, a0                            #  a6a: 003081
            add          a11, a8, a11                          #  a6d: bab8
            add          a11, a11, a3                          #  a6f: 3abb
            add          a9, a9, a11                           #  a71: ba99
            l32i         a3, sp, 140 /* [(local35)] */         #  a73: 322123
            l32i         a11, sp, 148 /* [(local37)] */        #  a76: b22125
            ssai         31                                    #  a79: 104f40
            xor          a11, a11, a3                          #  a7c: 30bb30
            xor          a7, a7, a11                           #  a7f: b07730
            movi         a3, 0x8f1bbcdc                        #  a82: 317cfd
            src          a7, a7, a7                            #  a85: 707781
            ssai         2                                     #  a88: 004240
            add          a9, a9, a3                            #  a8b: 3a99
            s32i         a9, sp, 68 /* a9 -> [(local17)] */    #  a8d: 926111
            src          a13, a13, a13                         #  a90: d0dd81
            s32i         a13, sp, 96 /* a13 -> [(local24)] */  #  a93: d26118
            and          a11, a13, a0                          #  a96: 00bd10
            ssai         27                                    #  a99: 104b40
            src          a9, a9, a9                            #  a9c: 909981
            or           a13, a13, a0                          #  a9f: 00dd20
            ssai         31                                    #  aa2: 104f40
            l32i         a0, sp, 0x110 /* [(local68)] */       #  aa5: 022144
            and          a5, a5, a13                           #  aa8: d05510
            or           a5, a5, a11                           #  aab: b05520
            l32i         a13, sp, 120 /* [(local30)] */        #  aae: d2211e
            l32i         a11, sp, 0x100 /* [(local64)] */      #  ab1: b22140
            add          a5, a7, a5                            #  ab4: 5a57
            add          a5, a5, a9                            #  ab6: 9a55
            s32i         a11, sp, 0 /* [(local64)] -> [(local0)] */ #  ab8: b901
            l32i         a9, sp, 0x10c /* [(local67)] */       #  aba: 922143
            add          a0, a0, a5                            #  abd: 5a00
            l32i         a11, sp, 244 /* [(local61)] */        #  abf: b2213d
            s32i         a11, sp, 12 /* [(local61)] -> [(local3)] */ #  ac2: b931
            add          a0, a0, a3                            #  ac4: 3a00
            l32i         a5, sp, 252 /* [(local63)] */         #  ac6: 52213f
            l32i         a3, sp, 140 /* [(local35)] */         #  ac9: 322123
            s32i         a0, sp, 64 /* a0 -> [(local16)] */    #  acc: 026110
            s32i         a5, sp, 4 /* [(local63)] -> [(local1)] */ #  acf: 5911
            l32i         a11, sp, 232 /* [(local58)] */        #  ad1: b2213a
            l32i         a5, sp, 240 /* [(local60)] */         #  ad4: 52213c
            s32i         a11, sp, 24 /* [(local58)] -> [(local6)] */ #  ad7: b961
            l32i         a0, sp, 248 /* [(local62)] */         #  ad9: 02213e
            l32i         a11, sp, 220 /* [(local55)] */        #  adc: b22137
            s32i         a0, sp, 8 /* [(local62)] -> [(local2)] */ #  adf: 0921
            s32i         a10, sp, 24 /* a10 -> [(local6)] */   #  ae1: a961
            s32i         a5, sp, 16 /* [(local60)] -> [(local4)] */ #  ae3: 5941
            l32i         a10, sp, 0x114 /* [(local69)] */      #  ae5: a22145
            l32i         a5, sp, 228 /* [(local57)] */         #  ae8: 522139
            l32i         a0, sp, 236 /* [(local59)] */         #  aeb: 02213b
            s32i         a11, sp, 36 /* [(local55)] -> [(local9)] */ #  aee: b991
            s32i         a9, sp, 36 /* [(local67)] -> [(local9)] */ #  af0: 9991
            s32i         a0, sp, 20 /* [(local59)] -> [(local5)] */ #  af2: 0951
            s32i         a5, sp, 28 /* [(local57)] -> [(local7)] */ #  af4: 5971
            l32i         a11, sp, 208 /* [(local52)] */        #  af6: b22134
            s32i         a11, sp, 48 /* [(local52)] -> [(local12)] */ #  af9: b9c1
            l32i         a5, sp, 216 /* [(local54)] */         #  afb: 522136
            l32i         a0, sp, 224 /* [(local56)] */         #  afe: 022138
            s32i         a0, sp, 32 /* [(local56)] -> [(local8)] */ #  b01: 0981
            s32i         a5, sp, 40 /* [(local54)] -> [(local10)] */ #  b03: 59a1
            l32i         a11, sp, 196 /* [(local49)] */        #  b05: b22131
            l32i         a5, sp, 204 /* [(local51)] */         #  b08: 522133
            s32i         a11, sp, 60 /* [(local49)] -> [(local15)] */ #  b0b: b9f1
            l32i         a0, sp, 212 /* [(local53)] */         #  b0d: 022135
            l32i         a11, sp, 184 /* [(local46)] */        #  b10: b2212e
            s32i         a0, sp, 44 /* [(local53)] -> [(local11)] */ #  b13: 09b1
            s32i         a5, sp, 52 /* [(local51)] -> [(local13)] */ #  b15: 59d1
            s32i         a3, sp, 52 /* [(local35)] -> [(local13)] */ #  b17: 39d1
            l32i         a5, sp, 192 /* [(local48)] */         #  b19: 522130
            l32i         a0, sp, 200 /* [(local50)] */         #  b1c: 022132
            s32i         a11, sp, 8 /* [(local46)] -> [(local2)] */ #  b1f: b921
            s32i         a2, sp, 8 /* a2 -> [(local2)] */      #  b21: 2921
            l32i         a11, sp, 172 /* [(local43)] */        #  b23: b2212b
            s32i         a0, sp, 56 /* [(local50)] -> [(local14)] */ #  b26: 09e1
            s32i         a5, sp, 0 /* [(local48)] -> [(local0)] */ #  b28: 5901
            l32i         a0, sp, 188 /* [(local47)] */         #  b2a: 02212f
            l32i         a5, sp, 180 /* [(local45)] */         #  b2d: 52212d
            s32i         a11, sp, 20 /* [(local43)] -> [(local5)] */ #  b30: b951
            s32i         a6, sp, 0 /* a6 -> [(local0)] */      #  b32: 6901
            l32i         a2, sp, 144 /* [(local36)] */         #  b34: 222124
            s32i         a2, sp, 56 /* [(local36)] -> [(local14)] */ #  b37: 29e1
            xor          a6, a14, a9                           #  b39: 906e30
            l32i         a11, sp, 160 /* [(local40)] */        #  b3c: b22128
            s32i         a5, sp, 12 /* [(local45)] -> [(local3)] */ #  b3f: 5931
            s32i         a12, sp, 20 /* a12 -> [(local5)] */   #  b41: c951
            s32i         a0, sp, 4 /* [(local47)] -> [(local1)] */ #  b43: 0911
            s32i         a4, sp, 4 /* a4 -> [(local1)] */      #  b45: 4911
            l32i         a12, sp, 132 /* [(local33)] */        #  b47: c22121
            l32i         a0, sp, 176 /* [(local44)] */         #  b4a: 02212c
            s32i         a15, sp, 12 /* a15 -> [(local3)] */   #  b4d: f931
            s32i         a11, sp, 32 /* [(local40)] -> [(local8)] */ #  b4f: b981
            s32i         a10, sp, 32 /* [(local69)] -> [(local8)] */ #  b51: a981
            l32i         a15, sp, 128 /* [(local32)] */        #  b53: f22120
            s32i         a0, sp, 16 /* [(local44)] -> [(local4)] */ #  b56: 0941
            l32i         a11, sp, 148 /* [(local37)] */        #  b58: b22125
            l32i         a0, sp, 164 /* [(local41)] */         #  b5b: 022129
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #  b5e: e941
            s32i         a11, sp, 44 /* [(local37)] -> [(local11)] */ #  b60: b9b1
            s32i         a7, sp, 44 /* a7 -> [(local11)] */    #  b62: 79b1
            l32i         a14, sp, 124 /* [(local31)] */        #  b64: e2211f
            s32i         a0, sp, 28 /* [(local41)] -> [(local7)] */ #  b67: 0971
            l32i         a11, sp, 136 /* [(local34)] */        #  b69: b22122
            s32i         a11, sp, 48 /* [(local34)] -> [(local12)] */ #  b6c: b9c1
            l32i         a0, sp, 152 /* [(local38)] */         #  b6e: 022126
            xor          a11, a11, a2                          #  b71: 20bb30
            s32i         a0, sp, 40 /* [(local38)] -> [(local10)] */ #  b74: 09a1
            s32i         a8, sp, 40 /* a8 -> [(local10)] */    #  b76: 89a1
            l32i         a0, sp, 0x104 /* [(local65)] */       #  b78: 022141
            xor          a6, a6, a11                           #  b7b: b06630
            src          a6, a6, a6                            #  b7e: 606681
            s32i         a0, sp, 60 /* [(local65)] -> [(local15)] */ #  b81: 09f1
            l32i         a11, sp, 0x108 /* [(local66)] */      #  b83: b22142
            s32i         a11, sp, 28 /* [(local66)] -> [(local7)] */ #  b86: b971
            l32i         a4, sp, 88 /* [(local22)] */          #  b88: 422116
            s32i         a12, sp, 132 /* [(local33)] -> [(local33)] */ #  b8b: c26121
            xor          a3, a3, a0                            #  b8e: 003330
            s32i         a8, sp, 0x120 /* a8 -> [(local72)] */ #  b91: 826148
            ssai         2                                     #  b94: 004240
            s32i         a15, sp, 128 /* [(local32)] -> [(local32)] */ #  b97: f26120
            s32i         a7, sp, 0x11c /* a7 -> [(local71)] */ #  b9a: 726147
            s32i         a13, sp, 120 /* [(local30)] -> [(local30)] */ #  b9d: d2611e
            s32i         a14, sp, 124 /* [(local31)] -> [(local31)] */ #  ba0: e2611f
            s32i         a6, sp, 0x118 /* a6 -> [(local70)] */ #  ba3: 626146
            l32i         a5, sp, 0x118 /* [(local70)] */       #  ba6: 522146
            l32i         a14, sp, 64 /* [(local16)] */         #  ba9: e22110
            l32i         a13, sp, 104 /* [(local26)] */        #  bac: d2211a
            l32i         a7, sp, 72 /* [(local18)] */          #  baf: 722112
            xor          a15, a13, a8                          #  bb2: 80fd30
            src          a7, a7, a7                            #  bb5: 707781
            l32i         a8, sp, 96 /* [(local24)] */          #  bb8: 822118
            xor          a15, a15, a3                          #  bbb: 30ff30
            ssai         27                                    #  bbe: 104b40
            src          a6, a14, a14                          #  bc1: e06e81
            l32i         a3, sp, 68 /* [(local17)] */          #  bc4: 322111
            ssai         31                                    #  bc7: 104f40
            src          a15, a15, a15                         #  bca: f0ff81
            or           a12, a7, a3                           #  bcd: 30c720
            and          a12, a8, a12                          #  bd0: c0c810
            s32i         a15, sp, 204 /* a15 -> [(local51)] */ #  bd3: f26133
            ssai         2                                     #  bd6: 004240
            and          a15, a7, a3                           #  bd9: 30f710
            src          a3, a3, a3                            #  bdc: 303381
            or           a12, a12, a15                         #  bdf: f0cc20
            ssai         27                                    #  be2: 104b40
            add          a5, a5, a12                           #  be5: ca55
            s32i         a3, sp, 180 /* a3 -> [(local45)] */   #  be7: 32612d
            l32i         a12, sp, 204 /* [(local51)] */        #  bea: c22133
            add          a5, a5, a6                            #  bed: 6a55
            or           a15, a3, a14                          #  bef: e0f320
            l32i         a6, sp, 108 /* [(local27)] */         #  bf2: 62211b
            and          a3, a3, a14                           #  bf5: e03310
            add          a4, a4, a5                            #  bf8: 5a44
            and          a15, a7, a15                          #  bfa: f0f710
            movi         a5, 0x8f1bbcdc                        #  bfd: 511efd
            or           a15, a15, a3                          #  c00: 30ff20
            l32i         a3, sp, 0x11c /* [(local71)] */       #  c03: 322147
            add          a12, a12, a15                         #  c06: facc
            add          a4, a4, a5                            #  c08: 5a44
            src          a15, a4, a4                           #  c0a: 40f481
            xor          a3, a6, a3                            #  c0d: 303630
            ssai         31                                    #  c10: 104f40
            add          a12, a12, a15                         #  c13: facc
            add          a8, a8, a12                           #  c15: ca88
            l32i         a15, sp, 76 /* [(local19)] */         #  c17: f22113
            movi         a12, 0x8f1bbcdc                       #  c1a: c118fd
            xor          a2, a15, a2                           #  c1d: 202f30
            add          a8, a8, a12                           #  c20: ca88
            xor          a2, a2, a3                            #  c22: 302230
            src          a2, a2, a2                            #  c25: 202281
            l32i         a3, sp, 180 /* [(local45)] */         #  c28: 32212d
            ssai         2                                     #  c2b: 004240
            s32i         a2, sp, 200 /* a2 -> [(local50)] */   #  c2e: 226132
            l32i         a12, sp, 200 /* [(local50)] */        #  c31: c22132
            src          a2, a14, a14                          #  c34: e02e81
            and          a14, a2, a4                           #  c37: 40e210
            or           a5, a2, a4                            #  c3a: 405220
            and          a3, a3, a5                            #  c3d: 503310
            ssai         27                                    #  c40: 104b40
            or           a14, a14, a3                          #  c43: 30ee20
            add          a12, a12, a14                         #  c46: eacc
            src          a14, a8, a8                           #  c48: 80e881
            ssai         31                                    #  c4b: 104f40
            add          a12, a12, a14                         #  c4e: eacc
            add          a7, a7, a12                           #  c50: ca77
            l32i         a14, sp, 0x118 /* [(local70)] */      #  c52: e22146
            l32i         a12, sp, 80 /* [(local20)] */         #  c55: c22114
            xor          a14, a11, a14                         #  c58: e0eb30
            xor          a5, a12, a0                           #  c5b: 005c30
            xor          a5, a5, a14                           #  c5e: e05530
            movi         a14, 0x8f1bbcdc                       #  c61: e107fd
            src          a5, a5, a5                            #  c64: 505581
            s32i         a5, sp, 196 /* a5 -> [(local49)] */   #  c67: 526131
            ssai         2                                     #  c6a: 004240
            src          a4, a4, a4                            #  c6d: 404481
            add          a7, a7, a14                           #  c70: ea77
            ssai         27                                    #  c72: 104b40
            and          a3, a4, a8                            #  c75: 803410
            or           a0, a4, a8                            #  c78: 800420
            and          a0, a2, a0                            #  c7b: 000210
            or           a0, a0, a3                            #  c7e: 300020
            add          a14, a5, a0                           #  c81: 0ae5
            movi         a3, 0x8f1bbcdc                        #  c83: 3100fd
            l32i         a5, sp, 180 /* [(local45)] */         #  c86: 52212d
            src          a0, a7, a7                            #  c89: 700781
            add          a14, a14, a0                          #  c8c: 0aee
            ssai         31                                    #  c8e: 104f40
            l32i         a0, sp, 204 /* [(local51)] */         #  c91: 022133
            add          a5, a5, a14                           #  c94: ea55
            add          a5, a5, a3                            #  c96: 3a55
            l32i         a14, sp, 84 /* [(local21)] */         #  c98: e22115
            xor          a0, a10, a0                           #  c9b: 000a30
            xor          a15, a15, a14                         #  c9e: e0ff30
            xor          a15, a15, a0                          #  ca1: 00ff30
            src          a15, a15, a15                         #  ca4: f0ff81
            s32i         a15, sp, 192 /* a15 -> [(local48)] */ #  ca7: f26130
            ssai         2                                     #  caa: 004240
            src          a8, a8, a8                            #  cad: 808881
            or           a0, a8, a7                            #  cb0: 700820
            and          a15, a8, a7                           #  cb3: 70f810
            and          a0, a4, a0                            #  cb6: 000410
            or           a0, a0, a15                           #  cb9: f00020
            l32i         a15, sp, 192 /* [(local48)] */        #  cbc: f22130
            ssai         27                                    #  cbf: 104b40
            add          a15, a15, a0                          #  cc2: 0aff
            src          a0, a5, a5                            #  cc4: 500581
            add          a15, a15, a0                          #  cc7: 0aff
            ssai         31                                    #  cc9: 104f40
            l32i         a0, sp, 200 /* [(local50)] */         #  ccc: 022132
            add          a2, a2, a15                           #  ccf: fa22
            add          a2, a2, a3                            #  cd1: 3a22
            l32i         a15, sp, 92 /* [(local23)] */         #  cd3: f22117
            xor          a0, a9, a0                            #  cd6: 000930
            xor          a12, a12, a15                         #  cd9: f0cc30
            xor          a15, a15, a13                         #  cdc: d0ff30
            xor          a12, a12, a0                          #  cdf: 00cc30
            src          a12, a12, a12                         #  ce2: c0cc81
            xor          a13, a13, a11                         #  ce5: b0dd30
            ssai         2                                     #  ce8: 004240
            s32i         a12, sp, 188 /* a12 -> [(local47)] */ #  ceb: c2612f
            src          a7, a7, a7                            #  cee: 707781
            ssai         27                                    #  cf1: 104b40
            and          a3, a7, a5                            #  cf4: 503710
            or           a0, a7, a5                            #  cf7: 500720
            and          a0, a8, a0                            #  cfa: 000810
            or           a0, a0, a3                            #  cfd: 300020
            add          a12, a12, a0                          #  d00: 0acc
            l32i         a3, sp, 196 /* [(local49)] */         #  d02: 322131
            src          a0, a2, a2                            #  d05: 200281
            ssai         31                                    #  d08: 104f40
            add          a12, a12, a0                          #  d0b: 0acc
            add          a4, a4, a12                           #  d0d: ca44
            l32i         a0, sp, 0x120 /* [(local72)] */       #  d0f: 022148
            l32i         a12, sp, 100 /* [(local25)] */        #  d12: c22119
            xor          a0, a0, a3                            #  d15: 300030
            xor          a14, a14, a12                         #  d18: c0ee30
            l32i         a3, sp, 192 /* [(local48)] */         #  d1b: 322130
            xor          a12, a12, a6                          #  d1e: 60cc30
            xor          a14, a14, a0                          #  d21: 00ee30
            src          a14, a14, a14                         #  d24: e0ee81
            l32i         a0, sp, 0x11c /* [(local71)] */       #  d27: 022147
            ssai         2                                     #  d2a: 004240
            xor          a3, a3, a0                            #  d2d: 003330
            src          a5, a5, a5                            #  d30: 505581
            xor          a3, a3, a15                           #  d33: f03330
            movi         a15, 0x8f1bbcdc                       #  d36: f1d4fc
            ssai         27                                    #  d39: 104b40
            add          a4, a4, a15                           #  d3c: fa44
            src          a0, a4, a4                            #  d3e: 400481
            or           a15, a5, a2                           #  d41: 20f520
            and          a15, a7, a15                          #  d44: f0f710
            ssai         31                                    #  d47: 104f40
            src          a3, a3, a3                            #  d4a: 303381
            s32i         a3, sp, 208 /* a3 -> [(local52)] */   #  d4d: 326134
            ssai         2                                     #  d50: 004240
            and          a3, a5, a2                            #  d53: 203510
            src          a2, a2, a2                            #  d56: 202281
            or           a15, a15, a3                          #  d59: 30ff20
            add          a15, a14, a15                         #  d5c: fafe
            l32i         a3, sp, 188 /* [(local47)] */         #  d5e: 32212f
            add          a15, a15, a0                          #  d61: 0aff
            add          a8, a8, a15                           #  d63: fa88
            l32i         a15, sp, 0x118 /* [(local70)] */      #  d65: f22146
            ssai         27                                    #  d68: 104b40
            xor          a3, a3, a15                           #  d6b: f03330
            xor          a3, a3, a12                           #  d6e: c03330
            or           a15, a2, a4                           #  d71: 40f220
            movi         a12, 0x8f1bbcdc                       #  d74: c1c6fc
            and          a15, a5, a15                          #  d77: f0f510
            add          a8, a8, a12                           #  d7a: ca88
            src          a0, a8, a8                            #  d7c: 800881
            ssai         31                                    #  d7f: 104f40
            src          a3, a3, a3                            #  d82: 303381
            s32i         a3, sp, 212 /* a3 -> [(local53)] */   #  d85: 326135
            ssai         2                                     #  d88: 004240
            and          a3, a2, a4                            #  d8b: 403210
            or           a3, a3, a15                           #  d8e: f03320
            src          a4, a4, a4                            #  d91: 404481
            l32i         a15, sp, 208 /* [(local52)] */        #  d94: f22134
            ssai         27                                    #  d97: 104b40
            add          a15, a15, a3                          #  d9a: 3aff
            l32i         a3, sp, 204 /* [(local51)] */         #  d9c: 322133
            add          a15, a15, a0                          #  d9f: 0aff
            add          a7, a7, a15                           #  da1: fa77
            or           a0, a4, a8                            #  da3: 800420
            and          a0, a2, a0                            #  da6: 000210
            add          a7, a7, a12                           #  da9: ca77
            xor          a3, a14, a3                           #  dab: 303e30
            xor          a3, a3, a13                           #  dae: d03330
            src          a15, a7, a7                           #  db1: 70f781
            l32i         a13, sp, 212 /* [(local53)] */        #  db4: d22135
            ssai         31                                    #  db7: 104f40
            src          a3, a3, a3                            #  dba: 303381
            s32i         a3, sp, 220 /* a3 -> [(local55)] */   #  dbd: 326137
            ssai         2                                     #  dc0: 004240
            and          a3, a4, a8                            #  dc3: 803410
            src          a8, a8, a8                            #  dc6: 808881
            or           a0, a0, a3                            #  dc9: 300020
            ssai         27                                    #  dcc: 104b40
            l32i         a3, sp, 200 /* [(local50)] */         #  dcf: 322132
            add          a13, a13, a0                          #  dd2: 0add
            add          a13, a13, a15                         #  dd4: fadd
            xor          a0, a6, a10                           #  dd6: a00630
            l32i         a15, sp, 208 /* [(local52)] */        #  dd9: f22134
            add          a5, a5, a13                           #  ddc: da55
            add          a5, a5, a12                           #  dde: ca55
            or           a13, a8, a7                           #  de0: 70d820
            and          a13, a4, a13                          #  de3: d0d410
            xor          a15, a15, a3                          #  de6: 30ff30
            src          a6, a5, a5                            #  de9: 506581
            l32i         a3, sp, 220 /* [(local55)] */         #  dec: 322137
            xor          a15, a15, a0                          #  def: 00ff30
            ssai         31                                    #  df2: 104f40
            l32i         a0, sp, 212 /* [(local53)] */         #  df5: 022135
            src          a15, a15, a15                         #  df8: f0ff81
            s32i         a15, sp, 216 /* a15 -> [(local54)] */ #  dfb: f26136
            ssai         2                                     #  dfe: 004240
            and          a15, a8, a7                           #  e01: 70f810
            src          a7, a7, a7                            #  e04: 707781
            or           a13, a13, a15                         #  e07: f0dd20
            ssai         27                                    #  e0a: 104b40
            add          a3, a3, a13                           #  e0d: da33
            add          a3, a3, a6                            #  e0f: 6a33
            or           a15, a7, a5                           #  e11: 50f720
            and          a15, a8, a15                          #  e14: f0f810
            add          a2, a2, a3                            #  e17: 3a22
            xor          a6, a11, a9                           #  e19: 906b30
            l32i         a3, sp, 196 /* [(local49)] */         #  e1c: 322131
            add          a11, a2, a12                          #  e1f: cab2
            l32i         a2, sp, 0x120 /* [(local72)] */       #  e21: 222148
            src          a13, a11, a11                         #  e24: b0db81
            xor          a0, a0, a3                            #  e27: 300030
            xor          a0, a0, a6                            #  e2a: 600030
            ssai         31                                    #  e2d: 104f40
            l32i         a6, sp, 216 /* [(local54)] */         #  e30: 622136
            xor          a2, a10, a2                           #  e33: 202a30
            src          a0, a0, a0                            #  e36: 000081
            ssai         2                                     #  e39: 004240
            s32i         a0, sp, 232 /* a0 -> [(local58)] */   #  e3c: 02613a
            l32i         a10, sp, 232 /* [(local58)] */        #  e3f: a2213a
            and          a0, a7, a5                            #  e42: 500710
            or           a15, a15, a0                          #  e45: 00ff20
            src          a5, a5, a5                            #  e48: 505581
            l32i         a0, sp, 220 /* [(local55)] */         #  e4b: 022137
            ssai         27                                    #  e4e: 104b40
            add          a6, a6, a15                           #  e51: fa66
            add          a6, a6, a13                           #  e53: da66
            add          a4, a4, a6                            #  e55: 6a44
            or           a15, a5, a11                          #  e57: b0f520
            and          a15, a7, a15                          #  e5a: f0f710
            l32i         a6, sp, 192 /* [(local48)] */         #  e5d: 622130
            add          a4, a4, a12                           #  e60: ca44
            src          a13, a4, a4                           #  e62: 40d481
            xor          a0, a6, a0                            #  e65: 000630
            ssai         31                                    #  e68: 104f40
            xor          a0, a0, a2                            #  e6b: 200030
            l32i         a2, sp, 216 /* [(local54)] */         #  e6e: 222136
            src          a0, a0, a0                            #  e71: 000081
            s32i         a0, sp, 224 /* a0 -> [(local56)] */   #  e74: 026138
            ssai         2                                     #  e77: 004240
            and          a0, a5, a11                           #  e7a: b00510
            src          a11, a11, a11                         #  e7d: b0bb81
            or           a15, a15, a0                          #  e80: 00ff20
            ssai         27                                    #  e83: 104b40
            l32i         a0, sp, 188 /* [(local47)] */         #  e86: 02212f
            add          a10, a10, a15                         #  e89: faaa
            add          a10, a10, a13                         #  e8b: daaa
            xor          a2, a0, a2                            #  e8d: 202030
            and          a13, a11, a4                          #  e90: 40db10
            or           a15, a11, a4                          #  e93: 40fb20
            add          a8, a8, a10                           #  e96: aa88
            add          a8, a8, a12                           #  e98: ca88
            l32i         a10, sp, 0x11c /* [(local71)] */      #  e9a: a22147
            and          a15, a5, a15                          #  e9d: f0f510
            or           a13, a13, a15                         #  ea0: f0dd20
            xor          a9, a9, a10                           #  ea3: a09930
            l32i         a15, sp, 0x120 /* [(local72)] */      #  ea6: f22148
            src          a10, a8, a8                           #  ea9: 80a881
            xor          a2, a2, a9                            #  eac: 902230
            ssai         31                                    #  eaf: 104f40
            l32i         a9, sp, 224 /* [(local56)] */         #  eb2: 922138
            src          a2, a2, a2                            #  eb5: 202281
            ssai         2                                     #  eb8: 004240
            s32i         a2, sp, 236 /* a2 -> [(local59)] */   #  ebb: 22613b
            add          a9, a9, a13                           #  ebe: da99
            l32i         a2, sp, 0x118 /* [(local70)] */       #  ec0: 222146
            l32i         a13, sp, 232 /* [(local58)] */        #  ec3: d2213a
            src          a4, a4, a4                            #  ec6: 404481
            add          a9, a9, a10                           #  ec9: aa99
            add          a7, a7, a9                            #  ecb: 9a77
            ssai         27                                    #  ecd: 104b40
            l32i         a9, sp, 236 /* [(local59)] */         #  ed0: 92213b
            xor          a13, a14, a13                         #  ed3: d0de30
            xor          a15, a15, a2                          #  ed6: 20ff30
            add          a7, a7, a12                           #  ed9: ca77
            and          a2, a4, a8                            #  edb: 802410
            src          a10, a7, a7                           #  ede: 70a781
            xor          a13, a13, a15                         #  ee1: f0dd30
            ssai         31                                    #  ee4: 104f40
            or           a15, a4, a8                           #  ee7: 80f420
            src          a13, a13, a13                         #  eea: d0dd81
            and          a15, a11, a15                         #  eed: f0fb10
            or           a15, a15, a2                          #  ef0: 20ff20
            ssai         2                                     #  ef3: 004240
            src          a8, a8, a8                            #  ef6: 808881
            add          a9, a9, a15                           #  ef9: fa99
            ssai         27                                    #  efb: 104b40
            l32i         a15, sp, 204 /* [(local51)] */        #  efe: f22133
            add          a9, a9, a10                           #  f01: aa99
            add          a5, a5, a9                            #  f03: 9a55
            l32i         a10, sp, 0x11c /* [(local71)] */      #  f05: a22147
            l32i         a9, sp, 208 /* [(local52)] */         #  f08: 922134
            add          a5, a5, a12                           #  f0b: ca55
            xor          a10, a10, a15                         #  f0d: f0aa30
            src          a2, a5, a5                            #  f10: 502581
            l32i         a15, sp, 224 /* [(local56)] */        #  f13: f22138
            ssai         31                                    #  f16: 104f40
            xor          a9, a9, a15                           #  f19: f09930
            xor          a9, a9, a10                           #  f1c: a09930
            or           a15, a8, a7                           #  f1f: 70f820
            and          a15, a4, a15                          #  f22: f0f410
            src          a9, a9, a9                            #  f25: 909981
            s32i         a9, sp, 228 /* a9 -> [(local57)] */   #  f28: 926139
            ssai         2                                     #  f2b: 004240
            and          a9, a8, a7                            #  f2e: 709810
            src          a7, a7, a7                            #  f31: 707781
            or           a15, a15, a9                          #  f34: 90ff20
            ssai         27                                    #  f37: 104b40
            l32i         a9, sp, 228 /* [(local57)] */         #  f3a: 922139
            or           a10, a7, a5                           #  f3d: 50a720
            add          a15, a13, a15                         #  f40: fafd
            add          a15, a15, a2                          #  f42: 2aff
            and          a10, a8, a10                          #  f44: a0a810
            l32i         a2, sp, 236 /* [(local59)] */         #  f47: 22213b
            add          a11, a11, a15                         #  f4a: fabb
            add          a11, a11, a12                         #  f4c: cabb
            and          a15, a7, a5                           #  f4e: 50f710
            or           a10, a10, a15                         #  f51: f0aa20
            add          a9, a9, a10                           #  f54: aa99
            l32i         a15, sp, 0x118 /* [(local70)] */      #  f56: f22146
            src          a10, a11, a11                         #  f59: b0ab81
            add          a9, a9, a10                           #  f5c: aa99
            ssai         31                                    #  f5e: 104f40
            l32i         a10, sp, 212 /* [(local53)] */        #  f61: a22135
            add          a4, a4, a9                            #  f64: 9a44
            add          a4, a4, a12                           #  f66: ca44
            xor          a10, a10, a2                          #  f68: 20aa30
            l32i         a12, sp, 200 /* [(local50)] */        #  f6b: c22132
            l32i         a2, sp, 204 /* [(local51)] */         #  f6e: 222133
            xor          a15, a15, a12                         #  f71: c0ff30
            xor          a10, a10, a15                         #  f74: f0aa30
            xor          a12, a6, a12                          #  f77: c0c630
            xor          a2, a2, a3                            #  f7a: 302230
            xor          a6, a6, a14                           #  f7d: e06630
            xor          a3, a0, a3                            #  f80: 303030
            src          a10, a10, a10                         #  f83: a0aa81
            l32i         a15, sp, 220 /* [(local55)] */        #  f86: f22137
            ssai         2                                     #  f89: 004240
            src          a5, a5, a5                            #  f8c: 505581
            xor          a15, a15, a13                         #  f8f: d0ff30
            xor          a15, a15, a2                          #  f92: 20ff30
            ssai         27                                    #  f95: 104b40
            xor          a9, a5, a11                           #  f98: b09530
            xor          a9, a7, a9                            #  f9b: 909730
            src          a2, a4, a4                            #  f9e: 402481
            add          a9, a10, a9                           #  fa1: 9a9a
            ssai         31                                    #  fa3: 104f40
            add          a9, a9, a2                            #  fa6: 2a99
            src          a15, a15, a15                         #  fa8: f0ff81
            l32i         a2, sp, 216 /* [(local54)] */         #  fab: 222136
            add          a8, a8, a9                            #  fae: 9a88
            ssai         2                                     #  fb0: 004240
            src          a11, a11, a11                         #  fb3: b0bb81
            l32i         a9, sp, 228 /* [(local57)] */         #  fb6: 922139
            ssai         27                                    #  fb9: 104b40
            xor          a2, a2, a9                            #  fbc: 902230
            movi         a9, 0xca62c1d6                        #  fbf: 9134fc
            xor          a12, a12, a2                          #  fc2: 20cc30
            add          a8, a8, a9                            #  fc5: 9a88
            src          a2, a8, a8                            #  fc7: 802881
            xor          a9, a11, a4                           #  fca: 409b30
            xor          a9, a5, a9                            #  fcd: 909530
            ssai         31                                    #  fd0: 104f40
            src          a12, a12, a12                         #  fd3: c0cc81
            add          a9, a15, a9                           #  fd6: 9a9f
            add          a9, a9, a2                            #  fd8: 2a99
            ssai         2                                     #  fda: 004240
            add          a7, a7, a9                            #  fdd: 9a77
            l32i         a9, sp, 232 /* [(local58)] */         #  fdf: 92213a
            src          a4, a4, a4                            #  fe2: 404481
            xor          a9, a9, a10                           #  fe5: a09930
            xor          a3, a3, a9                            #  fe8: 903330
            movi         a9, 0xca62c1d6                        #  feb: 912afc
            ssai         27                                    #  fee: 104b40
            add          a7, a7, a9                            #  ff1: 9a77
            src          a2, a7, a7                            #  ff3: 702781
            xor          a9, a4, a8                            #  ff6: 809430
            xor          a9, a11, a9                           #  ff9: 909b30
            ssai         31                                    #  ffc: 104f40
            src          a3, a3, a3                            #  fff: 303381
            add          a9, a12, a9                           # 1002: 9a9c
            add          a9, a9, a2                            # 1004: 2a99
            ssai         2                                     # 1006: 004240
            src          a8, a8, a8                            # 1009: 808881
            add          a5, a5, a9                            # 100c: 9a55
            ssai         27                                    # 100e: 104b40
            l32i         a9, sp, 224 /* [(local56)] */         # 1011: 922138
            xor          a2, a8, a7                            # 1014: 702830
            xor          a2, a4, a2                            # 1017: 202430
            xor          a9, a9, a15                           # 101a: f09930
            xor          a6, a6, a9                            # 101d: 906630
            movi         a9, 0xca62c1d6                        # 1020: 911efc
            add          a2, a3, a2                            # 1023: 2a23
            add          a5, a5, a9                            # 1025: 9a55
            src          a9, a5, a5                            # 1027: 509581
            ssai         31                                    # 102a: 104f40
            add          a2, a2, a9                            # 102d: 9a22
            add          a11, a11, a2                          # 102f: 2abb
            src          a6, a6, a6                            # 1031: 606681
            s32i         a6, sp, 0 /* a6 -> [(local0)] */      # 1034: 6901
            ssai         2                                     # 1036: 004240
            l32i         a2, sp, 208 /* [(local52)] */         # 1039: 222134
            src          a7, a7, a7                            # 103c: 707781
            ssai         27                                    # 103f: 104b40
            xor          a0, a0, a2                            # 1042: 200030
            xor          a9, a7, a5                            # 1045: 509730
            l32i         a2, sp, 236 /* [(local59)] */         # 1048: 22213b
            xor          a9, a8, a9                            # 104b: 909830
            xor          a2, a2, a12                           # 104e: c02230
            xor          a0, a0, a2                            # 1051: 200030
            movi         a2, 0xca62c1d6                        # 1054: 2112fc
            add          a9, a6, a9                            # 1057: 9a96
            add          a11, a11, a2                          # 1059: 2abb
            src          a2, a11, a11                          # 105b: b02b81
            add          a9, a9, a2                            # 105e: 2a99
            ssai         31                                    # 1060: 104f40
            l32i         a2, sp, 212 /* [(local53)] */         # 1063: 222135
            add          a4, a4, a9                            # 1066: 9a44
            src          a0, a0, a0                            # 1068: 000081
            movi         a9, 0xca62c1d6                        # 106b: 910dfc
            ssai         2                                     # 106e: 004240
            src          a5, a5, a5                            # 1071: 505581
            xor          a14, a14, a2                          # 1074: 20ee30
            ssai         27                                    # 1077: 104b40
            add          a4, a4, a9                            # 107a: 9a44
            xor          a2, a13, a3                           # 107c: 302d30
            xor          a14, a14, a2                          # 107f: 20ee30
            xor          a9, a5, a11                           # 1082: b09530
            xor          a9, a7, a9                            # 1085: 909730
            add          a9, a0, a9                            # 1088: 9a90
            src          a2, a4, a4                            # 108a: 402481
            add          a9, a9, a2                            # 108d: 2a99
            ssai         31                                    # 108f: 104f40
            l32i         a2, sp, 220 /* [(local55)] */         # 1092: 222137
            add          a8, a8, a9                            # 1095: 9a88
            src          a14, a14, a14                         # 1097: e0ee81
            l32i         a9, sp, 228 /* [(local57)] */         # 109a: 922139
            s32i         a14, sp, 240 /* a14 -> [(local60)] */ # 109d: e2613c
            ssai         2                                     # 10a0: 004240
            src          a11, a11, a11                         # 10a3: b0bb81
            l32i         a14, sp, 208 /* [(local52)] */        # 10a6: e22134
            ssai         27                                    # 10a9: 104b40
            xor          a9, a6, a9                            # 10ac: 909630
            xor          a14, a14, a2                          # 10af: 20ee30
            xor          a9, a9, a14                           # 10b2: e09930
            movi         a14, 0xca62c1d6                       # 10b5: e1fbfb
            xor          a2, a11, a4                           # 10b8: 402b30
            add          a8, a8, a14                           # 10bb: ea88
            l32i         a14, sp, 240 /* [(local60)] */        # 10bd: e2213c
            xor          a2, a5, a2                            # 10c0: 202530
            add          a14, a14, a2                          # 10c3: 2aee
            src          a2, a8, a8                            # 10c5: 802881
            add          a14, a14, a2                          # 10c8: 2aee
            ssai         31                                    # 10ca: 104f40
            l32i         a2, sp, 216 /* [(local54)] */         # 10cd: 222136
            add          a7, a7, a14                           # 10d0: ea77
            src          a9, a9, a9                            # 10d2: 909981
            l32i         a14, sp, 212 /* [(local53)] */        # 10d5: e22135
            s32i         a9, sp, 244 /* a9 -> [(local61)] */   # 10d8: 92613d
            ssai         2                                     # 10db: 004240
            xor          a9, a0, a10                           # 10de: a09030
            src          a4, a4, a4                            # 10e1: 404481
            xor          a14, a14, a2                          # 10e4: 20ee30
            ssai         27                                    # 10e7: 104b40
            xor          a9, a9, a14                           # 10ea: e09930
            movi         a14, 0xca62c1d6                       # 10ed: e1eefb
            xor          a2, a4, a8                            # 10f0: 802430
            add          a7, a7, a14                           # 10f3: ea77
            l32i         a14, sp, 244 /* [(local61)] */        # 10f5: e2213d
            xor          a2, a11, a2                           # 10f8: 202b30
            add          a14, a14, a2                          # 10fb: 2aee
            src          a2, a7, a7                            # 10fd: 702781
            add          a14, a14, a2                          # 1100: 2aee
            ssai         31                                    # 1102: 104f40
            l32i         a2, sp, 232 /* [(local58)] */         # 1105: 22213a
            add          a5, a5, a14                           # 1108: ea55
            src          a9, a9, a9                            # 110a: 909981
            l32i         a14, sp, 220 /* [(local55)] */        # 110d: e22137
            s32i         a9, sp, 252 /* a9 -> [(local63)] */   # 1110: 92613f
            ssai         2                                     # 1113: 004240
            src          a8, a8, a8                            # 1116: 808881
            l32i         a9, sp, 240 /* [(local60)] */         # 1119: 92213c
            xor          a14, a14, a2                          # 111c: 20ee30
            xor          a9, a9, a15                           # 111f: f09930
            xor          a9, a9, a14                           # 1122: e09930
            movi         a14, 0xca62c1d6                       # 1125: e1e1fb
            ssai         27                                    # 1128: 104b40
            add          a5, a5, a14                           # 112b: ea55
            src          a2, a5, a5                            # 112d: 502581
            l32i         a14, sp, 224 /* [(local56)] */        # 1130: e22138
            ssai         31                                    # 1133: 104f40
            src          a9, a9, a9                            # 1136: 909981
            s32i         a9, sp, 0x110 /* a9 -> [(local68)] */ # 1139: 926144
            l32i         a9, sp, 216 /* [(local54)] */         # 113c: 922136
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      # 113f: 0911
            xor          a9, a9, a14                           # 1141: e09930
            l32i         a14, sp, 244 /* [(local61)] */        # 1144: e2213d
            s32i         a4, sp, 184 /* a4 -> [(local46)] */   # 1147: 42612e
            xor          a14, a14, a12                         # 114a: c0ee30
            xor          a14, a14, a9                          # 114d: 90ee30
            l32i         a9, sp, 224 /* [(local56)] */         # 1150: 922138
            ssai         2                                     # 1153: 004240
            xor          a9, a9, a13                           # 1156: d09930
            xor          a13, a13, a10                         # 1159: a0dd30
            xor          a10, a10, a12                         # 115c: c0aa30
            s32i         a10, sp, 248 /* a10 -> [(local62)] */ # 115f: a2613e
            xor          a12, a6, a12                          # 1162: c0c630
            s32i         a12, sp, 0x100 /* a12 -> [(local64)] */ # 1165: c26140
            l32i         a10, sp, 0x110 /* [(local68)] */      # 1168: a22144
            l32i         a12, sp, 252 /* [(local63)] */        # 116b: c2213f
            xor          a6, a6, a10                           # 116e: a06630
            xor          a6, a6, a9                            # 1171: 906630
            l32i         a10, sp, 252 /* [(local63)] */        # 1174: a2213f
            xor          a9, a8, a7                            # 1177: 709830
            xor          a10, a10, a3                          # 117a: 30aa30
            xor          a4, a4, a9                            # 117d: 904430
            src          a7, a7, a7                            # 1180: 707781
            l32i         a9, sp, 228 /* [(local57)] */         # 1183: 922139
            add          a12, a12, a4                          # 1186: 4acc
            ssai         27                                    # 1188: 104b40
            add          a12, a12, a2                          # 118b: 2acc
            add          a11, a11, a12                         # 118d: cabb
            movi         a12, 0xca62c1d6                       # 118f: c1c8fb
            l32i         a4, sp, 236 /* [(local59)] */         # 1192: 42213b
            add          a11, a11, a12                         # 1195: cabb
            src          a2, a11, a11                          # 1197: b02b81
            l32i         a12, sp, 232 /* [(local58)] */        # 119a: c2213a
            ssai         31                                    # 119d: 104f40
            xor          a12, a12, a4                          # 11a0: 40cc30
            src          a14, a14, a14                         # 11a3: e0ee81
            s32i         a14, sp, 24 /* a14 -> [(local6)] */   # 11a6: e961
            ssai         2                                     # 11a8: 004240
            xor          a4, a4, a9                            # 11ab: 904430
            xor          a10, a10, a12                         # 11ae: c0aa30
            xor          a9, a9, a15                           # 11b1: f09930
            xor          a15, a15, a3                          # 11b4: 30ff30
            l32i         a12, sp, 0x110 /* [(local68)] */      # 11b7: c22144
            xor          a3, a0, a3                            # 11ba: 303030
            xor          a0, a0, a14                           # 11bd: e00030
            xor          a0, a0, a4                            # 11c0: 400030
            xor          a4, a7, a5                            # 11c3: 504730
            xor          a4, a8, a4                            # 11c6: 404830
            src          a5, a5, a5                            # 11c9: 505581
            add          a12, a12, a4                          # 11cc: 4acc
            l32i         a4, sp, 184 /* [(local46)] */         # 11ce: 42212e
            add          a12, a12, a2                          # 11d1: 2acc
            add          a4, a4, a12                           # 11d3: ca44
            movi         a12, 0xca62c1d6                       # 11d5: c1b7fb
            ssai         27                                    # 11d8: 104b40
            add          a4, a4, a12                           # 11db: ca44
            src          a2, a4, a4                            # 11dd: 402481
            l32i         a12, sp, 240 /* [(local60)] */        # 11e0: c2213c
            s32i         a12, sp, 8 /* [(local60)] -> [(local2)] */ # 11e3: c921
            ssai         31                                    # 11e5: 104f40
            src          a10, a10, a10                         # 11e8: a0aa81
            s32i         a10, sp, 28 /* a10 -> [(local7)] */   # 11eb: a971
            xor          a12, a12, a10                         # 11ed: a0cc30
            ssai         2                                     # 11f0: 004240
            xor          a12, a12, a13                         # 11f3: d0cc30
            xor          a13, a5, a11                          # 11f6: b0d530
            xor          a13, a7, a13                          # 11f9: d0d730
            src          a11, a11, a11                         # 11fc: b0bb81
            add          a13, a14, a13                         # 11ff: dade
            add          a13, a13, a2                          # 1201: 2add
            add          a8, a8, a13                           # 1203: da88
            movi         a13, 0xca62c1d6                       # 1205: d1acfb
            ssai         27                                    # 1208: 104b40
            add          a8, a8, a13                           # 120b: da88
            src          a2, a8, a8                            # 120d: 802881
            l32i         a13, sp, 244 /* [(local61)] */        # 1210: d2213d
            s32i         a13, sp, 12 /* [(local61)] -> [(local3)] */ # 1213: d931
            ssai         31                                    # 1215: 104f40
            src          a6, a6, a6                            # 1218: 606681
            s32i         a6, sp, 32 /* a6 -> [(local8)] */     # 121b: 6981
            xor          a13, a13, a6                          # 121d: 60dd30
            xor          a13, a13, a9                          # 1220: 90dd30
            ssai         2                                     # 1223: 004240
            xor          a9, a11, a4                           # 1226: 409b30
            src          a4, a4, a4                            # 1229: 404481
            xor          a9, a5, a9                            # 122c: 909530
            ssai         27                                    # 122f: 104b40
            add          a9, a10, a9                           # 1232: 9a9a
            add          a9, a9, a2                            # 1234: 2a99
            add          a7, a7, a9                            # 1236: 9a77
            movi         a2, 0xca62c1d6                        # 1238: 21a1fb
            xor          a9, a4, a8                            # 123b: 809430
            xor          a9, a11, a9                           # 123e: 909b30
            add          a6, a6, a9                            # 1241: 9a66
            add          a7, a7, a2                            # 1243: 2a77
            src          a9, a7, a7                            # 1245: 709781
            add          a6, a6, a9                            # 1248: 9a66
            ssai         31                                    # 124a: 104f40
            l32i         a9, sp, 252 /* [(local63)] */         # 124d: 92213f
            src          a0, a0, a0                            # 1250: 000081
            add          a5, a5, a6                            # 1253: 6a55
            add          a5, a5, a2                            # 1255: 2a55
            s32i         a0, sp, 36 /* a0 -> [(local9)] */     # 1257: 0991
            l32i         a6, sp, 248 /* [(local62)] */         # 1259: 62213e
            s32i         a9, sp, 16 /* [(local63)] -> [(local4)] */ # 125c: 9941
            ssai         2                                     # 125e: 004240
            src          a8, a8, a8                            # 1261: 808881
            xor          a9, a9, a0                            # 1264: 009930
            xor          a9, a9, a6                            # 1267: 609930
            ssai         27                                    # 126a: 104b40
            xor          a6, a8, a7                            # 126d: 706830
            xor          a6, a4, a6                            # 1270: 606430
            add          a0, a0, a6                            # 1273: 6a00
            src          a6, a5, a5                            # 1275: 506581
            add          a0, a0, a6                            # 1278: 6a00
            ssai         31                                    # 127a: 104f40
            l32i         a6, sp, 0x110 /* [(local68)] */       # 127d: 622144
            add          a11, a11, a0                          # 1280: 0abb
            src          a12, a12, a12                         # 1282: c0cc81
            l32i         a0, sp, 132 /* [(local33)] */         # 1285: 022121
            add          a11, a11, a2                          # 1288: 2abb
            s32i         a12, sp, 40 /* a12 -> [(local10)] */  # 128a: c9a1
            s32i         a6, sp, 20 /* [(local68)] -> [(local5)] */ # 128c: 6951
            ssai         2                                     # 128e: 004240
            src          a7, a7, a7                            # 1291: 707781
            xor          a6, a6, a12                           # 1294: c06630
            xor          a6, a6, a15                           # 1297: f06630
            ssai         27                                    # 129a: 104b40
            xor          a15, a7, a5                           # 129d: 50f730
            xor          a15, a8, a15                          # 12a0: f0f830
            add          a12, a12, a15                         # 12a3: facc
            src          a15, a11, a11                         # 12a5: b0fb81
            add          a12, a12, a15                         # 12a8: facc
            ssai         31                                    # 12aa: 104f40
            src          a13, a13, a13                         # 12ad: d0dd81
            add          a4, a4, a12                           # 12b0: ca44
            add          a4, a4, a2                            # 12b2: 2a44
            s32i         a13, sp, 44 /* a13 -> [(local11)] */  # 12b4: d9b1
            xor          a14, a14, a13                         # 12b6: d0ee30
            l32i         a12, sp, 0x100 /* [(local64)] */      # 12b9: c22140
            ssai         2                                     # 12bc: 004240
            src          a5, a5, a5                            # 12bf: 505581
            xor          a12, a12, a14                         # 12c2: e0cc30
            ssai         27                                    # 12c5: 104b40
            xor          a14, a5, a11                          # 12c8: b0e530
            xor          a14, a7, a14                          # 12cb: e0e730
            add          a13, a13, a14                         # 12ce: eadd
            src          a14, a4, a4                           # 12d0: 40e481
            add          a13, a13, a14                         # 12d3: eadd
            ssai         31                                    # 12d5: 104f40
            l32i         a14, sp, 124 /* [(local31)] */        # 12d8: e2211f
            src          a9, a9, a9                            # 12db: 909981
            add          a8, a8, a13                           # 12de: da88
            add          a8, a8, a2                            # 12e0: 2a88
            s32i         a9, sp, 48 /* a9 -> [(local12)] */    # 12e2: 99c1
            xor          a10, a10, a9                          # 12e4: 90aa30
            ssai         2                                     # 12e7: 004240
            src          a11, a11, a11                         # 12ea: b0bb81
            xor          a3, a3, a10                           # 12ed: a03330
            ssai         27                                    # 12f0: 104b40
            xor          a10, a11, a4                          # 12f3: 40ab30
            xor          a10, a5, a10                          # 12f6: a0a530
            add          a9, a9, a10                           # 12f9: aa99
            src          a10, a8, a8                           # 12fb: 80a881
            add          a9, a9, a10                           # 12fe: aa99
            ssai         31                                    # 1300: 104f40
            src          a6, a6, a6                            # 1303: 606681
            add          a7, a7, a9                            # 1306: 9a77
            add          a7, a7, a2                            # 1308: 2a77
            s32i         a6, sp, 52 /* a6 -> [(local13)] */    # 130a: 69d1
            ssai         2                                     # 130c: 004240
            src          a4, a4, a4                            # 130f: 404481
            xor          a9, a4, a8                            # 1312: 809430
            ssai         27                                    # 1315: 104b40
            xor          a9, a11, a9                           # 1318: 909b30
            add          a6, a6, a9                            # 131b: 9a66
            src          a9, a7, a7                            # 131d: 709781
            add          a6, a6, a9                            # 1320: 9a66
            ssai         31                                    # 1322: 104f40
            src          a12, a12, a12                         # 1325: c0cc81
            add          a5, a5, a6                            # 1328: 6a55
            add          a5, a5, a2                            # 132a: 2a55
            s32i         a12, sp, 56 /* a12 -> [(local14)] */  # 132c: c9e1
            ssai         2                                     # 132e: 004240
            src          a8, a8, a8                            # 1331: 808881
            xor          a13, a8, a7                           # 1334: 70d830
            ssai         27                                    # 1337: 104b40
            xor          a13, a4, a13                          # 133a: d0d430
            add          a12, a12, a13                         # 133d: dacc
            src          a13, a5, a5                           # 133f: 50d581
            add          a12, a12, a13                         # 1342: dacc
            ssai         31                                    # 1344: 104f40
            l32i         a13, sp, 120 /* [(local30)] */        # 1347: d2211e
            src          a3, a3, a3                            # 134a: 303381
            add          a11, a11, a12                         # 134d: cabb
            add          a11, a11, a2                          # 134f: 2abb
            ssai         2                                     # 1351: 004240
            s32i         a3, sp, 60 /* a3 -> [(local15)] */    # 1354: 39f1
            l32i         a15, a0, 0 /* [[(local33)]] */        # 1356: f800
            l32i         a10, a0, 4 /* [[(local33)]+0x4] */    # 1358: a810
            src          a7, a7, a7                            # 135a: 707781
            l32i         a9, a0, 16 /* [[(local33)]+0x10] */   # 135d: 9840
            ssai         27                                    # 135f: 104b40
            add          a9, a9, a8                            # 1362: 8a99
            src          a6, a11, a11                          # 1364: b06b81
            add          a10, a10, a11                         # 1367: baaa
            s32i         a10, a0, 4 /* a10 -> [[(local33)]+0x4] */ # 1369: a910
            ssai         2                                     # 136b: 004240
            s32i         a9, a0, 16 /* a9 -> [[(local33)]+0x10] */ # 136e: 9940
            add          a4, a4, a6                            # 1370: 6a44
            xor          a9, a7, a5                            # 1372: 509730
            l32i         a6, a0, 12 /* [[(local33)]+0xc] */    # 1375: 6830
            src          a5, a5, a5                            # 1377: 505581
            xor          a8, a8, a9                            # 137a: 908830
            add          a6, a6, a7                            # 137d: 7a66
            add          a3, a3, a8                            # 137f: 8a33
            add          a3, a3, a4                            # 1381: 4a33
            s32i         a6, a0, 12 /* a6 -> [[(local33)]+0xc] */ # 1383: 6930
            l32i         a4, a0, 8 /* [[(local33)]+0x8] */     # 1385: 4820
            add          a15, a15, a3                          # 1387: 3aff
            add          a15, a15, a2                          # 1389: 2aff
            movi         a3, 0 /* 0x00000000 */                # 138b: 0c03
            mov          a2, sp /* (local0) */                 # 138d: 2d01
            s32i         a15, a0, 0 /* a15 -> [[(local33)]] */ # 138f: f900
            add          a4, a4, a5                            # 1391: 5a44
            s32i         a4, a0, 8 /* a4 -> [[(local33)]+0x8] */ # 1393: 4920
            l32i         a15, sp, 128 /* [(local32)] */        # 1395: f22120
            movi         a4, 64 /* 0x00000040 */               # 1398: 4c04
            call0        memset                                # 139a: 014afbc0
                                                               # 139e: 0000
            l32i         a12, sp, 116 /* [(local29)] */        # 13a0: c2211d
            movi         a2, 304 /* 0x00000130 */              # 13a3: 22a130
            l32i         a0, sp, 112 /* [(local28)] */         # 13a6: 02211c
            add          sp, sp, a2 /* (top of frame) */       # 13a9: 2a11
            ret           /* 0x00000130 */                     # 13ab: 0df0

            .literal_position                                  # 13b0: 01234567
                                                               # 13b4: 89abcdef
                                                               # 13b8: fedcba98
                                                               # 13bc: 76543210
                                                               # 13c0: f0e1d2c3

# Function @ .irom0.text+0x13c4
            .global      sdk_SHA1Init
            .type        sdk_SHA1Init, @function
sdk_SHA1Init:
            movi         a3, 0xc3d2e1f0                        # 13c4: 31ffff
            movi         a4, 0x10325476                        # 13c7: 41fdff
            movi         a5, 0x98badcfe                        # 13ca: 51fbff
            movi         a6, 0xefcdab89                        # 13cd: 61f9ff
            movi         a7, 0x67452301                        # 13d0: 71f8ff
            movi         a8, 0 /* 0x00000000 */                # 13d3: 0c08
            s32i         a8, a2, 24 /* 0x00000000 -> [arg0+0x18] */ # 13d5: 8962
            s32i         a8, a2, 20 /* 0x00000000 -> [arg0+0x14] */ # 13d7: 8952
            s32i         a7, a2, 0 /* 0x67452301 -> [arg0] */  # 13d9: 7902
            s32i         a6, a2, 4 /* 0xefcdab89 -> [arg0+0x4] */ # 13db: 6912
            s32i         a5, a2, 8 /* 0x98badcfe -> [arg0+0x8] */ # 13dd: 5922
            s32i         a4, a2, 12 /* 0x10325476 -> [arg0+0xc] */ # 13df: 4932
            s32i         a3, a2, 16 /* 0xc3d2e1f0 -> [arg0+0x10] */ # 13e1: 3942
            ret           /* arg0 */                           # 13e3: 0df0

            .literal_position                                  # 13e8: 00000000
                                                               # 13ec: 00000000

# Function @ .irom0.text+0x13f0
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .global      sdk_SHA1Update
            .type        sdk_SHA1Update, @function
sdk_SHA1Update:
            addi         sp, sp, -32 /* (local0) */            # 13f0: 12c1e0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    # 13f3: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    # 13f5: d921
            s32i         a4, sp, 24 /* arg2 -> [(local6)] */   # 13f7: 4961
            s32i         a15, sp, 16 /* a15 -> [(local4)] */   # 13f9: f941
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   # 13fb: e931
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      # 13fd: 0901
            mov          a14, a2 /* arg0 */                    # 13ff: ed02
            l32i         a0, a2, 24 /* [arg0+0x18] */          # 1401: 0862
            mov          a15, a4 /* arg2 */                    # 1403: fd04
            extui        a5, a15, 29, 3                        # 1405: f05d25
            l32i         a2, a2, 20 /* [arg0+0x14] */          # 1408: 2852
            slli         a4, a4, 3                             # 140a: d04411
            extui        a13, a2, 3, 6                         # 140d: 20d354
            addx8        a2, a15, a2                           # 1410: 202fb0
            s32i         a2, a14, 20 /* a2 -> [arg0+0x14] */   # 1413: 295e
            bgeu         a2, a4, .Lbr003                       # 1415: 47b203
            addi         a0, a0, 1 /* [arg0+0x18]+0x1 */       # 1418: 1b00
            s32i         a0, a14, 24 /* [arg0+0x18]+0x1 -> [arg0+0x18] */ # 141a: 096e
.Lbr003:    add          a4, a15, a13                          # 141c: da4f
            add          a5, a0, a5                            # 141e: 5a50
            s32i         a5, a14, 24 /* a5 -> [arg0+0x18] */   # 1420: 596e
            bltui        a4, 64, .Lbr006                       # 1422: b6d43d
            s32i         a3, sp, 20 /* arg1 -> [(local5)] */   # 1425: 3951
            movi         a12, 64 /* 0x00000040 */              # 1427: 4c0c
            add          a2, a14, a13                          # 1429: da2e
            addi         a2, a2, 28                            # 142b: 22c21c
            sub          a12, a12, a13                         # 142e: d0ccc0
            mov          a4, a12                               # 1431: 4d0c
            call0        memcpy                                # 1433: 01edffc0
                                                               # 1437: 0000
            mov          a2, a14 /* arg0 */                    # 1439: 2d0e
            addi         a3, a14, 28 /* arg0+0x1c */           # 143b: 32ce1c
            call0        sdk_SHA1Transform                     # 143e: 050000
            movi         a0, 127 /* 0x0000007f */              # 1441: 02a07f
            sub          a13, a0, a13                          # 1444: d0d0c0
            bgeu         a13, a15, .Lbr005                     # 1447: f7bd11
.Lbr004:    l32i         a3, sp, 20 /* [(local5)] */           # 144a: 3851
            mov          a2, a14 /* arg0 */                    # 144c: 2d0e
            add          a3, a3, a12                           # 144e: ca33
            call0        sdk_SHA1Transform                     # 1450: 050000
            addi         a12, a12, 64                          # 1453: c2cc40
            addi         a13, a13, 64                          # 1456: d2cd40
            bltu         a13, a15, .Lbr004                     # 1459: f73ded
.Lbr005:    l32i         a3, sp, 20 /* [(local5)] */           # 145c: 3851
            movi         a13, 0 /* 0x00000000 */               # 145e: 0c0d
            j            .Lbr007                               # 1460: 460000
.Lbr006:    movi         a12, 0 /* 0x00000000 */               # 1463: 0c0c
.Lbr007:    add          a3, a3, a12                           # 1465: ca33
            sub          a4, a15, a12                          # 1467: c04fc0
            add          a2, a14, a13                          # 146a: da2e
            addi         a2, a2, 28                            # 146c: 22c21c
            call0        memcpy                                # 146f: 01dfffc0
                                                               # 1473: 0000
            l32i         a12, sp, 4 /* [(local1)] */           # 1475: c811
            l32i         a13, sp, 8 /* [(local2)] */           # 1477: d821
            l32i         a14, sp, 12 /* [(local3)] */          # 1479: e831
            l32i         a15, sp, 16 /* [(local4)] */          # 147b: f841
            l32i         a0, sp, 0 /* [(local0)] */            # 147d: 0801
            addi         sp, sp, 32 /* (top of frame) */       # 147f: 12c120
            ret                                                # 1482: 0df0

            .literal_position                                  # 1484: 00000000
                                                               # 1488: 00000000
                                                               # 148c: 00000000
                                                               # 1490: 00000000
                                                               # 1494: 00000000
                                                               # 1498: 00000000

# Function @ .irom0.text+0x149c
# Local variables/stack:
#     (local0):  word      @ -0x18
#     (local1):  word      @ -0x14
#     (local2):  word      @ -0x10
#     (local3):  word      @ -0xc
#     (local4):  word[2]   @ -0x8
            .global      sdk_SHA1Final
            .type        sdk_SHA1Final, @function
sdk_SHA1Final:
            addi         sp, sp, -32 /* (FP)-0x20 */           # 149c: 12c1e0
            s32i         a15, sp, 24 /* a15 -> [(local4)] */   # 149f: f961
            s32i         a13, sp, 16 /* a13 -> [(local2)] */   # 14a1: d941
            s32i         a12, sp, 12 /* a12 -> [(local1)] */   # 14a3: c931
            s32i         a0, sp, 8 /* a0 -> [(local0)] */      # 14a5: 0921
            s32i         a14, sp, 20 /* a14 -> [(local3)] */   # 14a7: e951
            movi         a0, 0 /* 0x00000000 */                # 14a9: 0c00
            movi         a14, -1 /* 0xffffffff */              # 14ab: 7cfe
            mov          a12, a3 /* arg1 */                    # 14ad: cd03
            mov          a13, a2 /* arg0 */                    # 14af: dd02
            mov          a3, sp /* (FP)-0x20 */                # 14b1: 3d01
            movi         a2, 1 /* 0x00000001 */                # 14b3: 0c12
.Lbr008:    xor          a5, a0, a14                           # 14b5: e05030
            extui        a5, a5, 0, 2                          # 14b8: 505014
            slli         a5, a5, 3                             # 14bb: d05511
            ssr          a5                                    # 14be: 000540
            bltui        a0, 4, .Lbr009                        # 14c1: b64001
            movi         a2, 0 /* 0x00000000 */                # 14c4: 0c02
.Lbr009:    addi         a0, a0, 1                             # 14c6: 1b00
            addx4        a4, a2, a12                           # 14c8: c042a0
            l32i         a4, a4, 20                            # 14cb: 4854
            movi         a2, 1 /* 0x00000001 */                # 14cd: 0c12
            srl          a4, a4                                # 14cf: 404091
            s8i          a4, a3, 0                             # 14d2: 424300
            addi         a3, a3, 1                             # 14d5: 1b33
            bnei         a0, 8, .Lbr008                        # 14d7: 6680da
            mov          a2, a12 /* arg1 */                    # 14da: 2d0c
            movi         a3, .Label001                         # 14dc: 31eaff
            movi         a4, 1 /* 0x00000001 */                # 14df: 0c14
            call0        sdk_SHA1Update                        # 14e1: 050000
            l32i         a5, a12, 20 /* [arg1+0x14] */         # 14e4: 585c
            movi         a6, 504 /* 0x000001f8 */              # 14e6: 62a1f8
            and          a5, a5, a6                            # 14e9: 605510
            movi         a6, 448 /* 0x000001c0 */              # 14ec: 62a1c0
            beq          a5, a6, .Lbr011                       # 14ef: 671519
            movi         a15, .Ldata001                        # 14f2: f1e5ff
.Lbr010:    mov          a2, a12 /* arg1 */                    # 14f5: 2d0c
            movi         a4, 1 /* 0x00000001 */                # 14f7: 0c14
            mov          a3, a15 /* .Ldata001 */               # 14f9: 3d0f
            call0        sdk_SHA1Update                        # 14fb: 050000
            l32i         a7, a12, 20 /* [arg1+0x14] */         # 14fe: 785c
            movi         a8, 504 /* 0x000001f8 */              # 1500: 82a1f8
            and          a7, a7, a8                            # 1503: 807710
            movi         a8, 448 /* 0x000001c0 */              # 1506: 82a1c0
            bne          a7, a8, .Lbr010                       # 1509: 8797e8
.Lbr011:    mov          a2, a12 /* arg1 */                    # 150c: 2d0c
            mov          a3, sp /* (FP)-0x20 */                # 150e: 3d01
            movi         a4, 8 /* 0x00000008 */                # 1510: 0c84
            call0        sdk_SHA1Update                        # 1512: 050000
            movi         a0, 0 /* 0x00000000 */                # 1515: 0c00
            movi         a2, 20 /* 0x00000014 */               # 1517: 1c42
.Lbr012:    xor          a10, a0, a14                          # 1519: e0a030
            srli         a9, a0, 2                             # 151c: 009241
            addx4        a9, a9, a12                           # 151f: c099a0
            extui        a10, a10, 0, 2                        # 1522: a0a014
            addi         a0, a0, 1                             # 1525: 1b00
            slli         a10, a10, 3                           # 1527: d0aa11
            l32i         a9, a9, 0                             # 152a: 9809
            ssr          a10                                   # 152c: 000a40
            srl          a9, a9                                # 152f: 909091
            s8i          a9, a13, 0                            # 1532: 924d00
            addi         a13, a13, 1                           # 1535: 1bdd
            bne          a0, a2, .Lbr012                       # 1537: 2790de
            addi         a2, a12, 28 /* arg1+0x1c */           # 153a: 22cc1c
            movi         a3, 0 /* 0x00000000 */                # 153d: 0c03
            movi         a4, 64 /* 0x00000040 */               # 153f: 4c04
            call0        memset                                # 1541: 01d2ffc0
                                                               # 1545: 0000
            mov          a2, a12 /* arg1 */                    # 1547: 2d0c
            movi         a3, 0 /* 0x00000000 */                # 1549: 0c03
            movi         a4, 20 /* 0x00000014 */               # 154b: 1c44
            call0        memset                                # 154d: 01d0ffc0
                                                               # 1551: 0000
            addi         a2, a12, 20 /* arg1+0x14 */           # 1553: 22cc14
            movi         a3, 0 /* 0x00000000 */                # 1556: 0c03
            movi         a4, 8 /* 0x00000008 */                # 1558: 0c84
            call0        memset                                # 155a: 01ceffc0
                                                               # 155e: 0000
            mov          a2, sp /* (FP)-0x20 */                # 1560: 2d01
            movi         a3, 0 /* 0x00000000 */                # 1562: 0c03
            movi         a4, 8 /* 0x00000008 */                # 1564: 0c84
            call0        memset                                # 1566: 01ccffc0
                                                               # 156a: 0000
            l32i         a12, sp, 12 /* [(local1)] */          # 156c: c831
            l32i         a13, sp, 16 /* [(local2)] */          # 156e: d841
            l32i         a14, sp, 20 /* [(local3)] */          # 1570: e851
            l32i         a15, sp, 24 /* [(local4)] */          # 1572: f861
            l32i         a0, sp, 8 /* [(local0)] */            # 1574: 0821
            addi         sp, sp, 32 /* (top of frame) */       # 1576: 12c120
            ret                                                # 1579: 0df0

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Label001:  .byte        0x80, 0x00

            .section     .rodata, "a", @progbits

.Ldata001:  .byte        0x00, 0x00

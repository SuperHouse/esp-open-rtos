
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 0000ff00
                                                               #    8: 000000ff
                                                               #    c: 00ff0000

# Function @ .irom0.text+0x10
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word      @ -0x8
#     (local7):  word      @ -0x4
            .global      sdk_rijndaelEncrypt
            .type        sdk_rijndaelEncrypt, @function
sdk_rijndaelEncrypt:
            mov          a6, a4 /* arg2 */                     #   10: 6d04
            addi         sp, sp, -32 /* (local0) */            #   12: 12c1e0
            s32i         a15, sp, 20 /* a15 -> [(local5)] */   #   15: f951
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #   17: c921
            l32i         a5, a2, 8 /* [arg0+0x8] */            #   19: 5822
            l32i         a9, a2, 0 /* [arg0] */                #   1b: 9802
            l8ui         a8, a3, 3 /* [arg1+0x3] */            #   1d: 820303
            l32i         a10, a2, 4 /* [arg0+0x4] */           #   20: a812
            l8ui         a7, a3, 7 /* [arg1+0x7] */            #   22: 720307
            l8ui         a11, a3, 0 /* [arg1] */               #   25: b20300
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #   28: e941
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   2a: 0911
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #   2c: d931
            movi         a0, 5 /* 0x00000005 */                #   2e: 0c50
            l8ui         a4, a3, 11 /* [arg1+0xb] */           #   30: 42030b
            l8ui         a13, a3, 1 /* [arg1+0x1] */           #   33: d20301
            l8ui         a14, a3, 13 /* [arg1+0xd] */          #   36: e2030d
            s32i         a6, sp, 0 /* arg2 -> [(local0)] */    #   39: 6901
            slli         a11, a11, 24                          #   3b: 80bb01
            l8ui         a6, a3, 9 /* [arg1+0x9] */            #   3e: 620309
            slli         a14, a14, 16                          #   41: 00ee11
            xor          a7, a7, a10                           #   44: a07730
            slli         a13, a13, 16                          #   47: 00dd11
            xor          a8, a8, a9                            #   4a: 908830
            xor          a4, a4, a5                            #   4d: 504430
            slli         a6, a6, 16                            #   50: 006611
            l8ui         a5, a3, 8 /* [arg1+0x8] */            #   53: 520308
            l8ui         a9, a3, 4 /* [arg1+0x4] */            #   56: 920304
            xor          a11, a11, a13                         #   59: d0bb30
            l8ui         a10, a3, 5 /* [arg1+0x5] */           #   5c: a20305
            l8ui         a13, a3, 14 /* [arg1+0xe] */          #   5f: d2030e
            slli         a10, a10, 16                          #   62: 00aa11
            slli         a9, a9, 24                            #   65: 809901
            slli         a5, a5, 24                            #   68: 805501
            slli         a13, a13, 8                           #   6b: 80dd11
            xor          a5, a5, a6                            #   6e: 605530
            xor          a9, a9, a10                           #   71: a09930
            l8ui         a6, a3, 10 /* [arg1+0xa] */           #   74: 62030a
            l8ui         a10, a3, 12 /* [arg1+0xc] */          #   77: a2030c
            slli         a6, a6, 8                             #   7a: 806611
            xor          a5, a5, a6                            #   7d: 605530
            slli         a10, a10, 24                          #   80: 80aa01
            xor          a10, a10, a14                         #   83: e0aa30
            xor          a10, a10, a13                         #   86: d0aa30
            l8ui         a14, a3, 6 /* [arg1+0x6] */           #   89: e20306
            l8ui         a13, a3, 2 /* [arg1+0x2] */           #   8c: d20302
            slli         a14, a14, 8                           #   8f: 80ee11
            slli         a13, a13, 8                           #   92: 80dd11
            xor          a9, a9, a14                           #   95: e09930
            xor          a7, a7, a9                            #   98: 907730
            xor          a11, a11, a13                         #   9b: d0bb30
            xor          a8, a8, a11                           #   9e: b08830
            l8ui         a9, a3, 15 /* [arg1+0xf] */           #   a1: 92030f
            l32i         a11, a2, 12 /* [arg0+0xc] */          #   a4: b832
            xor          a4, a4, a5                            #   a6: 504430
            xor          a9, a9, a11                           #   a9: b09930
            xor          a3, a9, a10                           #   ac: a03930
            movi         a9, sdk_Te0                           #   af: 91d4ff
.Lbr001:    addi         a0, a0, -1                            #   b2: 0b00
            ssai         8                                     #   b4: 004840
            extui        a11, a7, 0, 8                         #   b7: 70b074
            extui        a13, a3, 16, 8                        #   ba: 30d075
            extui        a12, a8, 0, 8                         #   bd: 80c074
            extui        a14, a3, 8, 8                         #   c0: 30e874
            extui        a15, a3, 0, 8                         #   c3: 30f074
            extui        a5, a4, 8, 8                          #   c6: 405874
            extui        a10, a7, 16, 8                        #   c9: 70a075
            extui        a6, a8, 24, 8                         #   cc: 806875
            addx4        a6, a6, a9                            #   cf: 9066a0
            addx4        a10, a10, a9                          #   d2: 90aaa0
            addx4        a5, a5, a9                            #   d5: 9055a0
            addx4        a15, a15, a9                          #   d8: 90ffa0
            addx4        a14, a14, a9                          #   db: 90eea0
            addx4        a12, a12, a9                          #   de: 90cca0
            addx4        a13, a13, a9                          #   e1: 90dda0
            addx4        a11, a11, a9                          #   e4: 90bba0
            l32i         a11, a11, 0                           #   e7: b80b
            l32i         a13, a13, 0                           #   e9: d80d
            l32i         a12, a12, 0                           #   eb: c80c
            l32i         a14, a14, 0                           #   ed: e80e
            l32i         a15, a15, 0                           #   ef: f80f
            l32i         a5, a5, 0                             #   f1: 5805
            l32i         a10, a10, 0                           #   f3: a80a
            l32i         a6, a6, 0                             #   f5: 6806
            src          a10, a10, a10                         #   f7: a0aa81
            xor          a6, a6, a10                           #   fa: a06630
            ssai         16                                    #   fd: 104040
            extui        a10, a8, 8, 8                         #  100: 80a874
            src          a5, a5, a5                            #  103: 505581
            extui        a8, a8, 16, 8                         #  106: 808075
            ssai         24                                    #  109: 104840
            xor          a5, a5, a6                            #  10c: 605530
            addx4        a10, a10, a9                          #  10f: 90aaa0
            l32i         a10, a10, 0                           #  112: a80a
            extui        a6, a3, 24, 8                         #  114: 306875
            s32i         a5, sp, 24 /* a5 -> [(local6)] */     #  117: 5961
            src          a15, a15, a15                         #  119: f0ff81
            addx4        a8, a8, a9                            #  11c: 9088a0
            l32i         a8, a8, 0                             #  11f: 8808
            ssai         8                                     #  121: 004840
            extui        a5, a4, 16, 8                         #  124: 405075
            extui        a3, a7, 24, 8                         #  127: 703875
            addx4        a6, a6, a9                            #  12a: 9066a0
            l32i         a6, a6, 0                             #  12d: 6806
            addx4        a3, a3, a9                            #  12f: 9033a0
            addx4        a5, a5, a9                            #  132: 9055a0
            l32i         a5, a5, 0                             #  135: 5805
            l32i         a3, a3, 0                             #  137: 3803
            src          a5, a5, a5                            #  139: 505581
            xor          a3, a3, a5                            #  13c: 503330
            ssai         16                                    #  13f: 104040
            extui        a5, a7, 8, 8                          #  142: 705874
            src          a14, a14, a14                         #  145: e0ee81
            l32i         a7, a2, 20                            #  148: 7852
            addx4        a5, a5, a9                            #  14a: 9055a0
            xor          a14, a14, a3                          #  14d: 30ee30
            ssai         24                                    #  150: 104840
            l32i         a3, a2, 28                            #  153: 3872
            src          a12, a12, a12                         #  155: c0cc81
            l32i         a5, a5, 0                             #  158: 5805
            ssai         8                                     #  15a: 004840
            xor          a7, a7, a12                           #  15d: c07730
            xor          a7, a7, a14                           #  160: e07730
            src          a13, a13, a13                         #  163: d0dd81
            extui        a12, a4, 24, 8                        #  166: 40c875
            addx4        a12, a12, a9                          #  169: 90cca0
            ssai         16                                    #  16c: 104040
            src          a10, a10, a10                         #  16f: a0aa81
            l32i         a12, a12, 0                           #  172: c80c
            ssai         24                                    #  174: 104840
            src          a11, a11, a11                         #  177: b0bb81
            xor          a12, a12, a13                         #  17a: d0cc30
            xor          a10, a10, a12                         #  17d: c0aa30
            ssai         8                                     #  180: 004840
            src          a8, a8, a8                            #  183: 808881
            xor          a6, a6, a8                            #  186: 806630
            ssai         16                                    #  189: 104040
            l32i         a8, a2, 16                            #  18c: 8842
            src          a5, a5, a5                            #  18e: 505581
            xor          a5, a5, a6                            #  191: 605530
            ssai         24                                    #  194: 104840
            l32i         a6, a2, 24                            #  197: 6862
            xor          a8, a8, a15                           #  199: f08830
            addi         a2, a2, 32                            #  19c: 22c220
            l32i         a15, sp, 24 /* [(local6)] */          #  19f: f861
            xor          a6, a6, a11                           #  1a1: b06630
            xor          a6, a6, a10                           #  1a4: a06630
            extui        a10, a4, 0, 8                         #  1a7: 40a074
            addx4        a10, a10, a9                          #  1aa: 90aaa0
            l32i         a10, a10, 0                           #  1ad: a80a
            xor          a8, a8, a15                           #  1af: f08830
            src          a10, a10, a10                         #  1b2: a0aa81
            xor          a3, a3, a10                           #  1b5: a03330
            xor          a3, a3, a5                            #  1b8: 503330
            beqz         a0, .Lbr002                           #  1bb: 166010
            ssai         8                                     #  1be: 004840
            extui        a11, a7, 0, 8                         #  1c1: 70b074
            extui        a10, a8, 8, 8                         #  1c4: 80a874
            extui        a13, a3, 16, 8                        #  1c7: 30d075
            extui        a12, a8, 0, 8                         #  1ca: 80c074
            extui        a14, a3, 8, 8                         #  1cd: 30e874
            extui        a5, a6, 16, 8                         #  1d0: 605075
            extui        a15, a6, 8, 8                         #  1d3: 60f874
            s32i         a0, sp, 28 /* a0 -> [(local7)] */     #  1d6: 0971
            extui        a4, a7, 16, 8                         #  1d8: 704075
            extui        a0, a8, 24, 8                         #  1db: 800875
            addx4        a4, a4, a9                            #  1de: 9044a0
            addx4        a15, a15, a9                          #  1e1: 90ffa0
            addx4        a5, a5, a9                            #  1e4: 9055a0
            addx4        a14, a14, a9                          #  1e7: 90eea0
            addx4        a12, a12, a9                          #  1ea: 90cca0
            addx4        a13, a13, a9                          #  1ed: 90dda0
            addx4        a10, a10, a9                          #  1f0: 90aaa0
            addx4        a11, a11, a9                          #  1f3: 90bba0
            l32i         a11, a11, 0                           #  1f6: b80b
            l32i         a10, a10, 0                           #  1f8: a80a
            l32i         a13, a13, 0                           #  1fa: d80d
            l32i         a12, a12, 0                           #  1fc: c80c
            l32i         a14, a14, 0                           #  1fe: e80e
            l32i         a5, a5, 0                             #  200: 5805
            l32i         a15, a15, 0                           #  202: f80f
            l32i         a4, a4, 0                             #  204: 4804
            addx4        a0, a0, a9                            #  206: 9000a0
            l32i         a0, a0, 0                             #  209: 0800
            src          a4, a4, a4                            #  20b: 404481
            xor          a0, a0, a4                            #  20e: 400030
            ssai         16                                    #  211: 104040
            extui        a4, a8, 16, 8                         #  214: 804075
            src          a15, a15, a15                         #  217: f0ff81
            l32i         a8, a2, 0                             #  21a: 8802
            ssai         24                                    #  21c: 104840
            xor          a15, a15, a0                          #  21f: 00ff30
            addx4        a4, a4, a9                            #  222: 9044a0
            extui        a0, a3, 0, 8                          #  225: 300074
            l32i         a4, a4, 0                             #  228: 4804
            extui        a3, a3, 24, 8                         #  22a: 303875
            addx4        a0, a0, a9                            #  22d: 9000a0
            l32i         a0, a0, 0                             #  230: 0800
            addx4        a3, a3, a9                            #  232: 9033a0
            l32i         a3, a3, 0                             #  235: 3803
            src          a0, a0, a0                            #  237: 000081
            xor          a8, a8, a0                            #  23a: 008830
            ssai         8                                     #  23d: 004840
            src          a5, a5, a5                            #  240: 505581
            xor          a8, a8, a15                           #  243: f08830
            ssai         16                                    #  246: 104040
            src          a14, a14, a14                         #  249: e0ee81
            ssai         24                                    #  24c: 104840
            src          a12, a12, a12                         #  24f: c0cc81
            l32i         a0, sp, 28 /* [(local7)] */           #  252: 0871
            ssai         8                                     #  254: 004840
            src          a13, a13, a13                         #  257: d0dd81
            ssai         16                                    #  25a: 104040
            src          a10, a10, a10                         #  25d: a0aa81
            ssai         24                                    #  260: 104840
            src          a11, a11, a11                         #  263: b0bb81
            ssai         8                                     #  266: 004840
            src          a4, a4, a4                            #  269: 404481
            xor          a3, a3, a4                            #  26c: 403330
            extui        a4, a7, 24, 8                         #  26f: 704875
            addx4        a4, a4, a9                            #  272: 9044a0
            l32i         a4, a4, 0                             #  275: 4804
            ssai         16                                    #  277: 104040
            xor          a4, a4, a5                            #  27a: 504430
            extui        a5, a7, 8, 8                          #  27d: 705874
            xor          a14, a14, a4                          #  280: 40ee30
            l32i         a7, a2, 4                             #  283: 7812
            l32i         a4, a2, 8                             #  285: 4822
            addx4        a5, a5, a9                            #  287: 9055a0
            l32i         a5, a5, 0                             #  28a: 5805
            xor          a4, a4, a11                           #  28c: b04430
            xor          a7, a7, a12                           #  28f: c07730
            xor          a7, a7, a14                           #  292: e07730
            src          a5, a5, a5                            #  295: 505581
            extui        a12, a6, 24, 8                        #  298: 60c875
            ssai         24                                    #  29b: 104840
            addx4        a12, a12, a9                          #  29e: 90cca0
            l32i         a12, a12, 0                           #  2a1: c80c
            xor          a5, a5, a3                            #  2a3: 305530
            xor          a12, a12, a13                         #  2a6: d0cc30
            xor          a10, a10, a12                         #  2a9: c0aa30
            xor          a4, a4, a10                           #  2ac: a04430
            extui        a10, a6, 0, 8                         #  2af: 60a074
            addx4        a10, a10, a9                          #  2b2: 90aaa0
            l32i         a10, a10, 0                           #  2b5: a80a
            l32i         a3, a2, 12                            #  2b7: 3832
            src          a10, a10, a10                         #  2b9: a0aa81
            xor          a3, a3, a10                           #  2bc: a03330
            xor          a3, a3, a5                            #  2bf: 503330
            j            .Lbr001                               #  2c2: 067bff
.Lbr002:    l32i         a11, sp, 0 /* [(local0)] */           #  2c5: b801
            movi         a15, 0xff000000                       #  2c7: f150ff
            l32i         a13, a2, 0                            #  2ca: d802
            movi         a0, 0x0000ff00                        #  2cc: 0150ff
            extui        a5, a7, 16, 8                         #  2cf: 705075
            extui        a10, a8, 24, 8                        #  2d2: 80a875
            extui        a4, a6, 8, 8                          #  2d5: 604874
            extui        a14, a3, 0, 8                         #  2d8: 30e074
            extui        a12, a8, 0, 8                         #  2db: 80c074
            addx4        a12, a12, a9                          #  2de: 90cca0
            addx4        a14, a14, a9                          #  2e1: 90eea0
            addx4        a4, a4, a9                            #  2e4: 9044a0
            addx4        a10, a10, a9                          #  2e7: 90aaa0
            addx4        a5, a5, a9                            #  2ea: 9055a0
            l32i         a5, a5, 0                             #  2ed: 5805
            l32i         a10, a10, 0                           #  2ef: a80a
            l32i         a4, a4, 0                             #  2f1: 4804
            l32i         a14, a14, 0                           #  2f3: e80e
            and          a4, a4, a0                            #  2f5: 004410
            extui        a14, a14, 8, 8                        #  2f8: e0e874
            slli         a10, a10, 8                           #  2fb: 80aa11
            xor          a13, a13, a14                         #  2fe: e0dd30
            movi         a14, 0x00ff0000                       #  301: e140ff
            and          a10, a10, a15                         #  304: f0aa10
            and          a5, a5, a14                           #  307: e05510
            xor          a5, a5, a10                           #  30a: a05530
            xor          a4, a4, a5                            #  30d: 504430
            xor          a13, a13, a4                          #  310: 40dd30
            s8i          a13, a11, 3 /* a13 -> [[(local0)]+0x3] */ #  313: d24b03
            extui        a5, a13, 24, 8                        #  316: d05875
            extui        a4, a13, 16, 16                       #  319: d040f5
            s8i          a4, a11, 1 /* a4 -> [[(local0)]+0x1] */ #  31c: 424b01
            s8i          a5, a11, 0 /* a5 -> [[(local0)]] */   #  31f: 524b00
            extui        a4, a7, 24, 8                         #  322: 704875
            extui        a5, a7, 0, 8                          #  325: 705074
            addx4        a5, a5, a9                            #  328: 9055a0
            addx4        a4, a4, a9                            #  32b: 9044a0
            srli         a13, a13, 8                           #  32e: d0d841
            s8i          a13, a11, 2 /* a13 -> [[(local0)]+0x2] */ #  331: d24b02
            l32i         a10, a2, 4                            #  334: a812
            l32i         a4, a4, 0                             #  336: 4804
            l32i         a12, a12, 0                           #  338: c80c
            extui        a13, a6, 16, 8                        #  33a: 60d075
            addx4        a13, a13, a9                          #  33d: 90dda0
            l32i         a13, a13, 0                           #  340: d80d
            extui        a12, a12, 8, 8                        #  342: c0c874
            slli         a4, a4, 8                             #  345: 804411
            and          a4, a4, a15                           #  348: f04410
            xor          a10, a10, a12                         #  34b: c0aa30
            and          a13, a13, a14                         #  34e: e0dd10
            extui        a12, a3, 8, 8                         #  351: 30c874
            addx4        a12, a12, a9                          #  354: 90cca0
            l32i         a12, a12, 0                           #  357: c80c
            xor          a13, a13, a4                          #  359: 40dd30
            and          a12, a12, a0                          #  35c: 00cc10
            xor          a12, a12, a13                         #  35f: d0cc30
            xor          a10, a10, a12                         #  362: c0aa30
            s8i          a10, a11, 7 /* a10 -> [[(local0)]+0x7] */ #  365: a24b07
            extui        a13, a10, 24, 8                       #  368: a0d875
            extui        a12, a10, 16, 16                      #  36b: a0c0f5
            s8i          a12, a11, 5 /* a12 -> [[(local0)]+0x5] */ #  36e: c24b05
            s8i          a13, a11, 4 /* a13 -> [[(local0)]+0x4] */ #  371: d24b04
            extui        a12, a6, 24, 8                        #  374: 60c875
            extui        a13, a8, 16, 8                        #  377: 80d075
            addx4        a13, a13, a9                          #  37a: 90dda0
            addx4        a12, a12, a9                          #  37d: 90cca0
            srli         a10, a10, 8                           #  380: a0a841
            s8i          a10, a11, 6 /* a10 -> [[(local0)]+0x6] */ #  383: a24b06
            l32i         a4, a2, 8                             #  386: 4822
            l32i         a5, a5, 0                             #  388: 5805
            l32i         a12, a12, 0                           #  38a: c80c
            extui        a10, a3, 16, 8                        #  38c: 30a075
            addx4        a10, a10, a9                          #  38f: 90aaa0
            l32i         a10, a10, 0                           #  392: a80a
            slli         a12, a12, 8                           #  394: 80cc11
            extui        a5, a5, 8, 8                          #  397: 505874
            xor          a4, a4, a5                            #  39a: 504430
            and          a12, a12, a15                         #  39d: f0cc10
            extui        a5, a8, 8, 8                          #  3a0: 805874
            and          a10, a10, a14                         #  3a3: e0aa10
            xor          a10, a10, a12                         #  3a6: c0aa30
            addx4        a5, a5, a9                            #  3a9: 9055a0
            l32i         a5, a5, 0                             #  3ac: 5805
            extui        a12, a7, 8, 8                         #  3ae: 70c874
            addx4        a12, a12, a9                          #  3b1: 90cca0
            and          a5, a5, a0                            #  3b4: 005510
            xor          a5, a5, a10                           #  3b7: a05530
            xor          a4, a4, a5                            #  3ba: 504430
            s8i          a4, a11, 11 /* a4 -> [[(local0)]+0xb] */ #  3bd: 424b0b
            extui        a10, a4, 24, 8                        #  3c0: 40a875
            extui        a5, a4, 16, 16                        #  3c3: 4050f5
            s8i          a5, a11, 9 /* a5 -> [[(local0)]+0x9] */ #  3c6: 524b09
            s8i          a10, a11, 8 /* a10 -> [[(local0)]+0x8] */ #  3c9: a24b08
            srli         a4, a4, 8                             #  3cc: 404841
            s8i          a4, a11, 10 /* a4 -> [[(local0)]+0xa] */ #  3cf: 424b0a
            l32i         a10, a2, 12                           #  3d2: a832
            l32i         a13, a13, 0                           #  3d4: d80d
            l32i         a12, a12, 0                           #  3d6: c80c
            and          a13, a13, a14                         #  3d8: e0dd10
            and          a12, a12, a0                          #  3db: 00cc10
            extui        a14, a3, 24, 8                        #  3de: 30e875
            extui        a0, a6, 0, 8                          #  3e1: 600074
            addx4        a0, a0, a9                            #  3e4: 9000a0
            addx4        a14, a14, a9                          #  3e7: 90eea0
            l32i         a14, a14, 0                           #  3ea: e80e
            l32i         a0, a0, 0                             #  3ec: 0800
            slli         a14, a14, 8                           #  3ee: 80ee11
            extui        a0, a0, 8, 8                          #  3f1: 000874
            xor          a10, a10, a0                          #  3f4: 00aa30
            and          a14, a14, a15                         #  3f7: f0ee10
            l32i         a0, sp, 4 /* [(local1)] */            #  3fa: 0811
            xor          a13, a13, a14                         #  3fc: e0dd30
            l32i         a15, sp, 20 /* [(local5)] */          #  3ff: f851
            l32i         a14, sp, 16 /* [(local4)] */          #  401: e841
            xor          a12, a12, a13                         #  403: d0cc30
            xor          a10, a10, a12                         #  406: c0aa30
            s8i          a10, a11, 15 /* a10 -> [[(local0)]+0xf] */ #  409: a24b0f
            extui        a13, a10, 24, 8                       #  40c: a0d875
            extui        a12, a10, 16, 16                      #  40f: a0c0f5
            s8i          a12, a11, 13 /* a12 -> [[(local0)]+0xd] */ #  412: c24b0d
            s8i          a13, a11, 12 /* a13 -> [[(local0)]+0xc] */ #  415: d24b0c
            l32i         a12, sp, 8 /* [(local2)] */           #  418: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  41a: d831
            srli         a10, a10, 8                           #  41c: a0a841
            s8i          a10, a11, 14 /* a10 -> [[(local0)]+0xe] */ #  41f: a24b0e
            addi         sp, sp, 32 /* (top of frame) */       #  422: 12c120
            ret                                                #  425: 0df0

            .literal_position                                  #  428: 00000000
                                                               #  42c: 00000000

# Function @ .irom0.text+0x430
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .global      sdk_aes_encrypt_init
            .type        sdk_aes_encrypt_init, @function
sdk_aes_encrypt_init:
            addi         sp, sp, -16 /* (local0) */            #  430: 12c1f0
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  433: 0921
            s32i         a2, sp, 4 /* arg0 -> [(local1)] */    #  435: 2911
            bnei         a3, 16, .Lbr003                       #  437: 66b30c
            movi         a2, 176 /* 0x000000b0 */              #  43a: 22a0b0
            call0        malloc                                #  43d: 01faffc0
                                                               #  441: 0000
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  443: 2901
            bnez         a2, .Lbr004                           #  445: cc32
.Lbr003:    movi         a2, 0 /* 0x00000000 */                #  447: 0c02
            j            .Lbr005                               #  449: 460200
.Lbr004:    l32i         a3, sp, 4 /* [(local1)] */            #  44c: 3811
            call0        sdk_rijndaelKeySetupEnc               #  44e: 01f7ffc0
                                                               #  452: 0000
            l32i         a2, sp, 0 /* [(local0)] */            #  454: 2801
.Lbr005:    l32i         a0, sp, 8 /* [(local2)] */            #  456: 0821
            addi         sp, sp, 16 /* (top of frame) */       #  458: 12c110
            ret                                                #  45b: 0df0

            .balign      4
# Function @ .irom0.text+0x460
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      sdk_aes_encrypt
            .type        sdk_aes_encrypt, @function
sdk_aes_encrypt:
            addi         sp, sp, -16 /* (local0) */            #  460: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  463: 0901
            call0        sdk_rijndaelEncrypt                   #  465: 050000
            l32i         a0, sp, 0 /* [(local0)] */            #  468: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  46a: 12c110
            ret                                                #  46d: 0df0

            .literal_position                                  #  470: 00000000
                                                               #  474: 00000000

# Function @ .irom0.text+0x478
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_aes_encrypt_deinit
            .type        sdk_aes_encrypt_deinit, @function
sdk_aes_encrypt_deinit:
            movi         a3, 0 /* 0x00000000 */                #  478: 0c03
            movi         a4, 176 /* 0x000000b0 */              #  47a: 42a0b0
            addi         sp, sp, -16 /* (local0) */            #  47d: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  480: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  482: 0901
            mov          a12, a2 /* arg0 */                    #  484: cd02
            call0        memset                                #  486: 01faffc0
                                                               #  48a: 0000
            mov          a2, a12 /* arg0 */                    #  48c: 2d0c
            call0        free                                  #  48e: 01f9ffc0
                                                               #  492: 0000
            l32i         a12, sp, 4 /* [(local1)] */           #  494: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  496: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  498: 12c110
            ret                                                #  49b: 0df0

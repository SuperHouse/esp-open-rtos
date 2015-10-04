
            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000

# Function @ .irom0.text+0x4
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc001:  addi         sp, sp, -16 /* (local0) */            #    4: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #    7: 0901
            beqz         a3, .Lbr002                           #    9: 8ca3
            beqi         a3, 4, .Lbr002                        #    b: 264308
            bgei         a3, 10, .Lbr001                       #    e: e69302
            bgei         a3, 6, .Lbr002                        #   11: e66302
.Lbr001:    bnei         a3, 16, .Lbr003                       #   14: 66b30a
.Lbr002:    movi         a3, 176 /* 0x000000b0 */              #   17: 32a0b0
            movi         a4, 1 /* 0x00000001 */                #   1a: 0c14
            call0        sdk_ieee80211_send_mgmt               #   1c: 01f9ffc0
                                                               #   20: 0000
.Lbr003:    l32i         a0, sp, 0 /* [(local0)] */            #   22: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   24: 12c110
            ret                                                #   27: 0df0

            .literal_position                                  #   2c: 00000000

# Function @ .irom0.text+0x30
            .balign      4
            .global      sdk_sta_status_set
            .type        sdk_sta_status_set, @function
sdk_sta_status_set:
            movi         a7, sdk_g_ic                          #   30: 71ffff
            l32i         a5, a7, 16 /* [sdk_g_ic+0x10] */      #   33: 5847
            l8ui         a6, a5, 184 /* [[sdk_g_ic+0x10]+0xb8] */ #   35: 6205b8
            l8ui         a10, a5, 185 /* [[sdk_g_ic+0x10]+0xb9] */ #   38: a205b9
            beqi         a6, 1, .Lbr005                        #   3b: 261615
            beq          a2, a6, .Lbr005                       #   3e: 671212
            movi         a6, 0 /* 0x00000000 */                #   41: 0c06
            s8i          a6, a5, 185 /* 0x00 -> [[sdk_g_ic+0x10]+0xb9] */ #   43: 6245b9
            l32i         a4, a7, 16 /* [sdk_g_ic+0x10] */      #   46: 4847
            movi         a3, 1 /* 0x00000001 */                #   48: 0c13
            s8i          a3, a4, 186 /* 0x01 -> [[sdk_g_ic+0x10]+0xba] */ #   4a: 3244ba
.Lbr004:    l32i         a8, a7, 16 /* [sdk_g_ic+0x10] */      #   4d: 8847
            s8i          a2, a8, 184 /* arg0 -> [[sdk_g_ic+0x10]+0xb8] */ #   4f: 2248b8
            ret           /* arg0 */                           #   52: 0df0
.Lbr005:    addi         a10, a10, 1 /* [[sdk_g_ic+0x10]+0xb9]+0x1 */ #   54: 1baa
            s8i          a10, a5, 185 /* [[sdk_g_ic+0x10]+0xb9]+0x1 -> [[sdk_g_ic+0x10]+0xb9] */ #   56: a245b9
            l32i         a5, a7, 16 /* [sdk_g_ic+0x10] */      #   59: 5847
            l8ui         a9, a5, 185 /* [[sdk_g_ic+0x10]+0xb9] */ #   5b: 9205b9
            bnei         a9, 3, .Lbr004                        #   5e: 6639eb
            s8i          a2, a5, 186 /* arg0 -> [[sdk_g_ic+0x10]+0xba] */ #   61: 2245ba
            j            .Lbr004                               #   64: 46f9ff

            .literal_position                                  #   68: 00000000
                                                               #   6c: 00000000
                                                               #   70: 00000000
                                                               #   74: 00000000
                                                               #   78: 00000000
                                                               #   7c: 00000000
                                                               #   80: 00000000
                                                               #   84: 00000000
                                                               #   88: 00000000
                                                               #   8c: 00000000
                                                               #   90: 00000000
                                                               #   94: 00000000
                                                               #   98: 00000000
                                                               #   9c: 00000000
                                                               #   a0: 00000000
                                                               #   a4: 00000000
                                                               #   a8: 00000000
                                                               #   ac: 00000000
                                                               #   b0: 00000000
                                                               #   b4: 00000000
                                                               #   b8: 00000000
                                                               #   bc: 00000000
                                                               #   c0: 00000000

# Function @ .irom0.text+0xc4
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      sdk_ieee80211_sta_new_state
            .type        sdk_ieee80211_sta_new_state, @function
sdk_ieee80211_sta_new_state:
            addi         sp, sp, -32 /* (local0) */            #   c4: 12c1e0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   c7: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   c9: c911
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #   cb: e931
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #   cd: d921
            mov          a14, a2 /* arg0 */                    #   cf: ed02
            l32i         a13, a2, 0 /* [arg0] */               #   d1: d802
            l32i         a12, a2, 16 /* [arg0+0x10] */         #   d3: c842
            addmi        a13, a13, 1536 /* [arg0]+0x600 */     #   d5: d2dd06
            l32i         a0, a12, 60 /* [[arg0+0x10]+0x3c] */  #   d8: 08fc
            s32i         a3, a12, 60 /* arg1 -> [[arg0+0x10]+0x3c] */ #   da: 39fc
            l32i         a13, a13, 140 /* [[arg0]+0x68c] */    #   dc: d22d23
            beqz         a3, .Lbr010                           #   df: 16e305
            bnei         a3, 2, .Lbr006                        #   e2: 662302
            j            .Lbr013                               #   e5: 062500
.Lbr006:    beqi         a3, 3, .Lbr007                        #   e8: 263331
            bnei         a3, 5, .Lbr009                        #   eb: 665343
            bgeui        a0, 4, .Lbr009                        #   ee: f64040
            bltui        a0, 2, .Lbr009                        #   f1: b6203d
            mov          a3, a13 /* [[arg0]+0x68c] */          #   f4: 3d0d
            addi         a2, a4, -16 /* arg2-0x10 */           #   f6: 22c4f0
            movi         a0, 1 /* 0x00000001 */                #   f9: 0c10
            movi         a4, 0 /* 0x00000000 */                #   fb: 0c04
            moveqz       a4, a0, a2                            #   fd: 204083
            mov          a2, a12 /* [arg0+0x10] */             #  100: 2d0c
            call0        sdk_cnx_sta_associated                #  102: 01dbffc0
                                                               #  106: 0000
            addmi        a3, a14, 512 /* arg0+0x200 */         #  108: 32de02
            l8ui         a3, a3, 8 /* [arg0+0x208] */          #  10b: 320308
            addi         a3, a3, -3 /* [arg0+0x208]-0x3 */     #  10e: 32c3fd
            beqz         a3, .Lbr020                           #  111: 166311
            call0        sdk_eagle_auth_done                   #  114: 01d8ffc0
                                                               #  118: 0000
            j            .Lbr009                               #  11a: 060500
.Lbr007:    bgeui        a0, 4, .Lbr008                        #  11d: f64005
            bltui        a0, 2, .Lbr008                        #  120: b62002
            j            .Lbr024                               #  123: c65700
.Lbr008:    addi         a4, a0, -5 /* [[arg0+0x10]+0x3c]-0x5 */ #  126: 42c0fb
            beqz         a4, .Lbr023                           #  129: 16a414
            addi         a5, a0, -7 /* [[arg0+0x10]+0x3c]-0x7 */ #  12c: 52c0f9
            beqz         a5, .Lbr023                           #  12f: 164514
.Lbr009:    movi         a2, 0 /* 0x00000000 */                #  132: 0c02
            l32i         a12, sp, 4 /* [(local1)] */           #  134: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  136: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  138: e831
            l32i         a0, sp, 0 /* [(local0)] */            #  13a: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  13c: 12c120
            ret           /* 0x00000000 */                     #  13f: 0df0
.Lbr010:    addi         a6, a0, -2 /* [[arg0+0x10]+0x3c]-0x2 */ #  141: 62c0fe
            beqz         a6, .Lbr021                           #  144: 16b60e
            addi         a7, a0, -3 /* [[arg0+0x10]+0x3c]-0x3 */ #  147: 72c0fd
            beqz         a7, .Lbr022                           #  14a: 16b70f
            beqi         a0, 5, .Lbr011                        #  14d: 265002
            bnei         a0, 7, .Lbr009                        #  150: 6670de
.Lbr011:    extui        a8, a4, 0, 8                          #  153: 408074
            bnei         a8, 1, .Lbr012                        #  156: 661802
            j            .Lbr017                               #  159: 062600
.Lbr012:    addi         a2, a12, 4 /* [arg0+0x10]+0x4 */      #  15c: 4b2c
            call0        sdk_os_timer_disarm                   #  15e: 01c6ffc0
                                                               #  162: 0000
            addi         a2, a12, 32 /* [arg0+0x10]+0x20 */    #  164: 22cc20
            call0        sdk_os_timer_disarm                   #  167: 01c5ffc0
                                                               #  16b: 0000
            mov          a2, a12 /* [arg0+0x10] */             #  16d: 2d0c
            movi         a3, 160 /* 0x000000a0 */              #  16f: 32a0a0
            movi         a4, 8 /* 0x00000008 */                #  172: 0c84
            call0        sdk_ieee80211_send_mgmt               #  174: 01c3ffc0
                                                               #  178: 0000
            j            .Lbr018                               #  17a: 462200
.Lbr013:    bgeui        a0, 2, .Lbr014                        #  17d: f6200f
            mov          a2, a12 /* [arg0+0x10] */             #  180: 2d0c
            movi         a3, 176 /* 0x000000b0 */              #  182: 32a0b0
            movi         a4, 1 /* 0x00000001 */                #  185: 0c14
            call0        sdk_ieee80211_send_mgmt               #  187: 01bfffc0
                                                               #  18b: 0000
            j            .Lbr009                               #  18d: 46e8ff
.Lbr014:    movi         a3, 176 /* 0x000000b0 */              #  190: 32a0b0
            movi         a7, 192 /* 0x000000c0 */              #  193: 72a0c0
            bgeui        a0, 4, .Lbr015                        #  196: f64002
            bgeui        a0, 2, .Lbr019                        #  199: f62077
.Lbr015:    bnei         a0, 5, .Lbr009                        #  19c: 665092
            movi         a9, 160 /* 0x000000a0 */              #  19f: 92a0a0
            extui        a2, a4, 0, 8                          #  1a2: 402074
            beq          a2, a9, .Lbr016                       #  1a5: 97120d
            s32i         a0, sp, 16 /* [[arg0+0x10]+0x3c] -> [(local4)] */ #  1a8: 0941
            sub          a10, a2, a3                           #  1aa: 30a2c0
            beqz         a10, .Lbr026                          #  1ad: 161a0f
            beq          a2, a7, .Lbr016                       #  1b0: 771202
            j            .Lbr009                               #  1b3: c6deff
.Lbr016:    movi         a2, 2 /* 0x00000002 */                #  1b6: 0c22
            call0        sdk_sta_status_set                    #  1b8: 050000
            addi         a2, a12, 32 /* [arg0+0x10]+0x20 */    #  1bb: 22cc20
            call0        sdk_os_timer_disarm                   #  1be: 01b2ffc0
                                                               #  1c2: 0000
            addi         a14, a12, 4 /* [arg0+0x10]+0x4 */     #  1c4: 4bec
            mov          a2, a14 /* [arg0+0x10]+0x4 */         #  1c6: 2d0e
            call0        sdk_os_timer_disarm                   #  1c8: 01b1ffc0
                                                               #  1cc: 0000
            mov          a2, a14 /* [arg0+0x10]+0x4 */         #  1ce: 2d0e
            movi         a3, sdk_cnx_connect_timeout           #  1d0: 31a6ff
            movi         a4, 0 /* 0x00000000 */                #  1d3: 0c04
            call0        sdk_os_timer_setfn                    #  1d5: 01aeffc0
                                                               #  1d9: 0000
            mov          a2, a14 /* [arg0+0x10]+0x4 */         #  1db: 2d0e
            movi         a3, 1000 /* 0x000003e8 */             #  1dd: 32a3e8
            movi         a4, 0 /* 0x00000000 */                #  1e0: 0c04
            call0        sdk_os_timer_arm                      #  1e2: 01acffc0
                                                               #  1e6: 0000
            mov          a3, a13 /* [[arg0]+0x68c] */          #  1e8: 3d0d
            mov          a2, a12 /* [arg0+0x10] */             #  1ea: 2d0c
            call0        sdk_cnx_sta_leave                     #  1ec: 01abffc0
                                                               #  1f0: 0000
            j            .Lbr009                               #  1f2: 06cfff
.Lbr017:    movi         a2, 4 /* 0x00000004 */                #  1f5: 0c42
            call0        sdk_sta_status_set                    #  1f7: 050000
            mov          a2, a12 /* [arg0+0x10] */             #  1fa: 2d0c
            movi         a3, 160 /* 0x000000a0 */              #  1fc: 32a0a0
            movi         a4, 4 /* 0x00000004 */                #  1ff: 0c44
            call0        sdk_ieee80211_send_mgmt               #  201: 01a6ffc0
                                                               #  205: 0000
.Lbr018:    mov          a3, a13 /* [[arg0]+0x68c] */          #  207: 3d0d
            mov          a2, a12 /* [arg0+0x10] */             #  209: 2d0c
            call0        sdk_cnx_sta_leave                     #  20b: 01a5ffc0
                                                               #  20f: 0000
            j            .Lbr009                               #  211: 46c7ff
.Lbr019:    extui        a2, a4, 0, 8                          #  214: 402074
            beq          a2, a3, .Lbr025                       #  217: 37127a
            sub          a11, a2, a7                           #  21a: 70b2c0
            bnez         a11, .Lbr009                          #  21d: 561bf1
            mov          a2, a12 /* [arg0+0x10] */             #  220: 2d0c
            srai         a3, a4, 8                             #  222: 403821
            call0        .Lfunc001                             #  225: c5ddff
            j            .Lbr009                               #  228: 86c1ff
.Lbr020:    movi         a12, 1 /* 0x00000001 */               #  22b: 0c1c
            s8i          a12, a13, 24 /* 0x01 -> [[[arg0]+0x68c]+0x18] */ #  22d: c24d18
            j            .Lbr009                               #  230: 86bfff
.Lbr021:    movi         a13, sdk_g_ic                         #  233: d18eff
            l32i         a13, a13, 16 /* [sdk_g_ic+0x10] */    #  236: d84d
            l8ui         a13, a13, 184 /* [[sdk_g_ic+0x10]+0xb8] */ #  238: d20db8
            addi         a13, a13, -2 /* [[sdk_g_ic+0x10]+0xb8]-0x2 */ #  23b: d2cdfe
            beqz         a13, .Lbr009                          #  23e: 160def
            movi         a2, 4 /* 0x00000004 */                #  241: 0c42
            call0        sdk_sta_status_set                    #  243: 050000
            j            .Lbr009                               #  246: 06baff
.Lbr022:    mov          a2, a12 /* [arg0+0x10] */             #  249: 2d0c
            movi         a3, 192 /* 0x000000c0 */              #  24b: 32a0c0
            movi         a4, 3 /* 0x00000003 */                #  24e: 0c34
            call0        sdk_ieee80211_send_mgmt               #  250: 0195ffc0
                                                               #  254: 0000
            beqz         a13, .Lbr009                          #  256: 168ded
            addi         a2, a12, 4 /* [arg0+0x10]+0x4 */      #  259: 4b2c
            call0        sdk_os_timer_disarm                   #  25b: 0193ffc0
                                                               #  25f: 0000
            addi         a2, a12, 32 /* [arg0+0x10]+0x20 */    #  261: 22cc20
            call0        sdk_os_timer_disarm                   #  264: 0192ffc0
                                                               #  268: 0000
            mov          a3, a13 /* [[arg0]+0x68c] */          #  26a: 3d0d
            mov          a2, a12 /* [arg0+0x10] */             #  26c: 2d0c
            call0        sdk_cnx_sta_leave                     #  26e: 0190ffc0
                                                               #  272: 0000
            j            .Lbr009                               #  274: 86aeff
.Lbr023:    mov          a2, a12 /* [arg0+0x10] */             #  277: 2d0c
            movi         a3, 32 /* 0x00000020 */               #  279: 2c03
            movi         a4, 0 /* 0x00000000 */                #  27b: 0c04
            call0        sdk_ieee80211_send_mgmt               #  27d: 018dffc0
                                                               #  281: 0000
            j            .Lbr009                               #  283: c6aaff
.Lbr024:    mov          a2, a12 /* [arg0+0x10] */             #  286: 2d0c
            movi         a3, 0 /* 0x00000000 */                #  288: 0c03
            movi         a4, 0 /* 0x00000000 */                #  28a: 0c04
            call0        sdk_ieee80211_send_mgmt               #  28c: 018bffc0
                                                               #  290: 0000
            j            .Lbr009                               #  292: 06a7ff
.Lbr025:    mov          a2, a12 /* [arg0+0x10] */             #  295: 2d0c
            movi         a4, 2 /* 0x00000002 */                #  297: 0c24
            call0        sdk_ieee80211_send_mgmt               #  299: 0188ffc0
                                                               #  29d: 0000
            j            .Lbr009                               #  29f: c6a3ff
.Lbr026:    mov          a2, a12 /* [arg0+0x10] */             #  2a2: 2d0c
            movi         a3, 176 /* 0x000000b0 */              #  2a4: 32a0b0
            movi         a4, 2 /* 0x00000002 */                #  2a7: 0c24
            mov          a13, a0 /* [[arg0+0x10]+0x3c] */      #  2a9: dd00
            call0        sdk_ieee80211_send_mgmt               #  2ab: 0185ffc0
                                                               #  2af: 0000
            s32i         a13, a12, 60 /* [[arg0+0x10]+0x3c] -> [[arg0+0x10]+0x3c] */ #  2b1: d9fc
            j            .Lbr009                               #  2b3: c69eff

            .literal_position                                  #  2b8: 00000000
                                                               #  2bc: 00000000
                                                               #  2c0: 888e0000
                                                               #  2c4: 00000000
                                                               #  2c8: 00000000
                                                               #  2cc: 00000000
                                                               #  2d0: 20070000
                                                               #  2d4: 00000000
                                                               #  2d8: 00000000
                                                               #  2dc: 00000000
                                                               #  2e0: 00000000

# Function @ .irom0.text+0x2e4
# Local variables/stack:
#     (local0):  byte[4]   @ -0x40
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
#     (local12): word[4]   @ -0x10
            .balign      4
            .global      sdk_sta_input
            .type        sdk_sta_input, @function
sdk_sta_input:
            movi         a6, sdk_g_ic+0x180                    #  2e4: 61f5ff
            addi         sp, sp, -64 /* (local0) */            #  2e7: 12c1c0
            s32i         a14, sp, 32 /* a14 -> [(local8)] */   #  2ea: e981
            s32i         a15, sp, 36 /* a15 -> [(local9)] */   #  2ec: f991
            s32i         a0, sp, 20 /* a0 -> [(local5)] */     #  2ee: 0951
            s32i         a12, sp, 24 /* a12 -> [(local6)] */   #  2f0: c961
            s32i         a13, sp, 28 /* a13 -> [(local7)] */   #  2f2: d971
            l8ui         a6, a6, 84 /* [sdk_g_ic+0x1d4] */     #  2f4: 620654
            mov          a13, a2 /* arg0 */                    #  2f7: dd02
            mov          a12, a3 /* arg1 */                    #  2f9: cd03
            l32i         a0, a12, 16 /* [arg1+0x10] */         #  2fb: 084c
            mov          a3, a4 /* arg2 */                     #  2fd: 3d04
            l8ui         a4, a0, 1 /* [[arg1+0x10]+0x1] */     #  2ff: 420001
            mov          a2, a5 /* arg3 */                     #  302: 2d05
            srli         a4, a4, 6                             #  304: 404641
            bnez         a4, .Lbr027                           #  307: cc74
            l16ui        a0, a0, 2 /* [[arg1+0x10]+0x2] */     #  309: 021001
            extui        a0, a0, 0, 12                         #  30c: 0000b4
            j            .Lbr028                               #  30f: 860300
.Lbr027:    l16ui        a5, a0, 6 /* [[arg1+0x10]+0x6] */     #  312: 521003
            l16ui        a4, a0, 4 /* [[arg1+0x10]+0x4] */     #  315: 421002
            slli         a0, a5, 16                            #  318: 000511
            or           a0, a0, a4                            #  31b: 400020
            srli         a0, a0, 8                             #  31e: 000841
.Lbr028:    bnei         a6, 1, .Lbr029                        #  321: 661602
            j            .Lbr032                               #  324: 062400
.Lbr029:    beqz         a13, .Lbr032                          #  327: 16dd08
            l32i         a15, a13, 136 /* [arg0+0x88] */       #  32a: f22d22
            extui        a9, a0, 0, 16                         #  32d: 0090f4
            bgeui        a9, 16, .Lbr030                       #  330: f6b902
            j            .Lbr036                               #  333: c62700
.Lbr030:    l32i         a0, a12, 4 /* [arg1+0x4] */           #  336: 081c
            l32i         a0, a0, 4 /* [[arg1+0x4]+0x4] */      #  338: 0810
            l8ui         a4, a0, 0 /* [[[arg1+0x4]+0x4]] */    #  33a: 420000
            movi         a14, 255 /* 0x000000ff */             #  33d: e2a0ff
            extui        a7, a4, 0, 2                          #  340: 407014
            bnez         a7, .Lbr037                           #  343: 565709
            s32i         a3, sp, 12 /* arg2 -> [(local3)] */   #  346: 3931
            s32i         a2, sp, 8 /* arg3 -> [(local2)] */    #  348: 2921
            l8ui         a10, a0, 1 /* [[[arg1+0x4]+0x4]+0x1] */ #  34a: a20001
            movi         a11, 240 /* 0x000000f0 */             #  34d: b2a0f0
            movi         a14, 12 /* 0x0000000c */              #  350: 0cce
            and          a14, a4, a14                          #  352: e0e410
            and          a11, a4, a11                          #  355: b0b410
            extui        a10, a10, 0, 2                        #  358: a0a014
            beqz         a15, .Lbr031                          #  35b: ac5f
            s32i         a11, sp, 40 /* a11 -> [(local10)] */  #  35d: b9a1
            s32i         a10, sp, 44 /* a10 -> [(local11)] */  #  35f: a9b1
            movi         a2, sdk_gScanStruct                   #  361: 21d6ff
            s32i         a9, sp, 48 /* a9 -> [(local12)] */    #  364: 99c1
            l8ui         a2, a2, 93 /* [sdk_gScanStruct+0x5d] */ #  366: 22025d
            s32i         a0, sp, 4 /* [[arg1+0x4]+0x4] -> [(local1)] */ #  369: 0911
            bbsi         a2, 0, .Lbr031                        #  36b: 07e215
            mov          a3, a15 /* [arg0+0x88] */             #  36e: 3d0f
            movi         a4, 6 /* 0x00000006 */                #  370: 0c64
            addi         a2, a0, 10 /* [[arg1+0x4]+0x4]+0xa */ #  372: ab20
            call0        memcmp                                #  374: 01d4ffc0
                                                               #  378: 0000
            l32i         a0, sp, 4 /* [(local1)] */            #  37a: 0811
            l32i         a9, sp, 48 /* [(local12)] */          #  37c: 98c1
            l32i         a10, sp, 44 /* [(local11)] */         #  37e: a8b1
            l32i         a11, sp, 40 /* [(local10)] */         #  380: b8a1
            bnez         a2, .Lbr033                           #  382: fc52
.Lbr031:    movi         a5, 140 /* 0x0000008c */              #  384: 52a08c
            movi         a6, 136 /* 0x00000088 */              #  387: 62a088
            movi         a4, 64 /* 0x00000040 */               #  38a: 4c04
            l32i         a3, sp, 8 /* [(local2)] */            #  38c: 3821
            s8i          a3, a13, 168 /* [(local2)] -> [arg0+0xa8] */ #  38e: 324da8
            bbsi         a14, 2, .Lbr040                       #  391: 27ee50
            l8ui         a7, a0, 4                             #  394: 720004
            bbsi         a7, 0, .Lbr040                        #  397: 07e74a
            l8ui         a8, a0, 0                             #  39a: 820000
            and          a8, a8, a5                            #  39d: 508810
            sub          a8, a8, a6                            #  3a0: 6088c0
            bnez         a8, .Lbr042                           #  3a3: 56c809
            l8ui         a2, a0, 1                             #  3a6: 220001
            extui        a2, a2, 0, 2                          #  3a9: 202014
            addi         a2, a2, -3                            #  3ac: 22c2fd
            bnez         a2, .Lbr049                           #  3af: 56820e
            l8ui         a2, a0, 30                            #  3b2: 22001e
            j            .Lbr050                               #  3b5: 463900
.Lbr032:    l8ui         a14, sp, 0 /* [(local0)] */           #  3b8: e20100
.Lbr033:    beqz         a12, .Lbr034                          #  3bb: 8c6c
            mov          a2, a12                               #  3bd: 2d0c
            call0        sdk_ppRecycleRxPkt                    #  3bf: 01c2ffc0
                                                               #  3c3: 0000
.Lbr034:    mov          a2, a14                               #  3c5: 2d0e
.Lbr035:    l32i         a12, sp, 24 /* [(local6)] */          #  3c7: c861
            l32i         a13, sp, 28 /* [(local7)] */          #  3c9: d871
            l32i         a14, sp, 32 /* [(local8)] */          #  3cb: e881
            l32i         a15, sp, 36 /* [(local9)] */          #  3cd: f891
            l32i         a0, sp, 20 /* [(local5)] */           #  3cf: 0851
            addi         sp, sp, 64 /* (top of frame) */       #  3d1: 12c140
            ret                                                #  3d4: 0df0
.Lbr036:    movi         a14, 255 /* 0x000000ff */             #  3d6: e2a0ff
            j            .Lbr033                               #  3d9: 86f7ff
.Lbr037:    j            .Lbr033                               #  3dc: c6f6ff
.Lbr038:    addx2        a2, a2, a13                           #  3df: d02290
.Lbr039:    s16i         a8, a2, 88                            #  3e2: 82522c
.Lbr040:    movi         a4, 24 /* 0x00000018 */               #  3e5: 1c84
            movi         a2, 30 /* 0x0000001e */               #  3e7: 1ce2
            l8ui         a3, a0, 0                             #  3e9: 320000
            l8ui         a7, a0, 1                             #  3ec: 720001
            and          a3, a3, a5                            #  3ef: 503310
            extui        a7, a7, 0, 2                          #  3f2: 707014
            addi         a7, a7, -3                            #  3f5: 72c7fd
            movnez       a2, a4, a7                            #  3f8: 702493
            bne          a3, a6, .Lbr041                       #  3fb: 679301
            addi         a2, a2, 2                             #  3fe: 2b22
.Lbr041:    s16i         a2, a12, 20 /* a2 -> [arg1+0x14] */   #  400: 225c0a
            sub          a4, a9, a2                            #  403: 2049c0
            addi         a4, a4, -4                            #  406: 42c4fc
            s16i         a4, a12, 22 /* a4 -> [arg1+0x16] */   #  409: 425c0b
            beqz         a14, .Lbr046                          #  40c: 164e06
            beqi         a14, 4, .Lbr033                       #  40f: 264ea8
            bnei         a14, 8, .Lbr033                       #  412: 668ea5
            l32i         a5, a13, 136 /* [arg0+0x88] */        #  415: 522d22
            beqz         a5, .Lbr033                           #  418: 16f5f9
            blt          a9, a2, .Lbr033                       #  41b: 27299c
            bnei         a10, 2, .Lbr033                       #  41e: 662a99
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  421: 0911
            s32i         a9, sp, 48 /* a9 -> [(local12)] */    #  423: 99c1
            l8ui         a6, a0, 1                             #  425: 620001
            s32i         a2, sp, 16 /* a2 -> [(local4)] */     #  428: 2941
            bbci         a6, 6, .Lbr051                        #  42a: 676676
            mov          a2, a13 /* arg0 */                    #  42d: 2d0d
            mov          a3, a12 /* arg1 */                    #  42f: 3d0c
            l32i         a4, sp, 16 /* [(local4)] */           #  431: 4841
            call0        sdk_ieee80211_crypto_decap            #  433: 01a6ffc0
                                                               #  437: 0000
            l32i         a0, sp, 4 /* [(local1)] */            #  439: 0811
            l32i         a9, sp, 48 /* [(local12)] */          #  43b: 98c1
            bnez         a2, .Lbr052                           #  43d: 560207
            j            .Lbr033                               #  440: c6ddff
.Lbr042:    movi         a2, 16 /* 0x00000010 */               #  443: 1c02
.Lbr043:    l16ui        a8, a0, 22                            #  445: 82100b
            l32i         a3, a13, 72 /* [arg0+0x48] */         #  448: 322d12
            beqz         a15, .Lbr048                          #  44b: 163f04
            l32i         a7, a15, 8 /* [[arg0+0x88]+0x8] */    #  44e: 782f
            and          a7, a7, a4                            #  450: 407710
            or           a3, a3, a7                            #  453: 703320
.Lbr044:    s32i         a3, a13, 72 /* a3 -> [arg0+0x48] */   #  456: 326d12
            bbsi         a3, 6, .Lbr038                        #  459: 67e382
            l8ui         a3, a0, 1                             #  45c: 320001
            addx2        a2, a2, a13                           #  45f: d02290
            bbsi         a3, 3, .Lbr045                        #  462: 37e302
            j            .Lbr039                               #  465: 46deff
.Lbr045:    l16ui        a4, a2, 88                            #  468: 42122c
            sub          a4, a4, a8                            #  46b: 8044c0
            beqz         a4, .Lbr033                           #  46e: 1694f4
            j            .Lbr039                               #  471: 46dbff
.Lbr046:    bnez         a10, .Lbr033                          #  474: 563af4
            movi         a5, 23 /* 0x00000017 */               #  477: 1c75
            bltu         a5, a9, .Lbr047                       #  479: 973502
            j            .Lbr033                               #  47c: c6ceff
.Lbr047:    mov          a4, a11                               #  47f: 4d0b
            mov          a2, a13 /* arg0 */                    #  481: 2d0d
            mov          a3, a12 /* arg1 */                    #  483: 3d0c
            l32i         a5, sp, 12 /* [(local3)] */           #  485: 5831
            l32i         a6, sp, 8 /* [(local2)] */            #  487: 6821
            call0        .Lfunc004                             #  489: 0191ffc0
                                                               #  48d: 0000
            j            .Lbr033                               #  48f: 06caff
.Lbr048:    movi         a7, -65 /* 0xffffffbf */              #  492: 72afbf
            and          a3, a3, a7                            #  495: 703310
            j            .Lbr044                               #  498: 86eeff
.Lbr049:    l8ui         a2, a0, 24                            #  49b: 220018
.Lbr050:    extui        a2, a2, 0, 4                          #  49e: 202034
            j            .Lbr043                               #  4a1: 06e8ff
.Lbr051:    l32i         a10, a12, 4 /* [arg1+0x4] */          #  4a4: a81c
            s32i         a2, sp, 16 /* a2 -> [(local4)] */     #  4a6: 2941
            l32i         a8, a10, 4 /* [[arg1+0x4]+0x4] */     #  4a8: 881a
            extui        a11, a2, 0, 16                        #  4aa: 20b0f4
            add          a8, a8, a11                           #  4ad: ba88
            s32i         a8, a10, 4 /* a8 -> [[arg1+0x4]+0x4] */ #  4af: 891a
.Lbr052:    mov          a4, a9                                #  4b1: 4d09
            mov          a2, a12 /* arg1 */                    #  4b3: 2d0c
            l32i         a5, sp, 16 /* [(local4)] */           #  4b5: 5841
            mov          a3, a0                                #  4b7: 3d00
            call0        sdk_ieee80211_decap                   #  4b9: 0186ffc0
                                                               #  4bd: 0000
            mov          a3, a2                                #  4bf: 3d02
            mov          a12, a2                               #  4c1: cd02
            beqz         a2, .Lbr033                           #  4c3: 1642ef
            l32i         a0, a2, 4                             #  4c6: 0812
            l32i         a4, a13, 136 /* [arg0+0x88] */        #  4c8: 422d22
            movi         a2, 0x00008e88                        #  4cb: 217dff
            l32i         a4, a4, 8 /* [[arg0+0x88]+0x8] */     #  4ce: 4824
            l32i         a0, a0, 4                             #  4d0: 0810
            bbsi         a4, 0, .Lbr053                        #  4d2: 07e42a
            l8ui         a4, a15, 24 /* [[arg0+0x88]+0x18] */  #  4d5: 420f18
            bnei         a4, 1, .Lbr054                        #  4d8: 661446
            l8ui         a5, a0, 13                            #  4db: 52000d
            l8ui         a6, a0, 12                            #  4de: 62000c
            slli         a5, a5, 8                             #  4e1: 805511
            or           a5, a5, a6                            #  4e4: 605520
            sub          a5, a5, a2                            #  4e7: 2055c0
            bnez         a5, .Lbr033                           #  4ea: 56d5ec
            addi         a2, a0, 6                             #  4ed: 6b20
            l16ui        a4, a3, 22                            #  4ef: 42130b
            addi         a3, a0, 14                            #  4f2: eb30
            addi         a4, a4, -14                           #  4f4: 42c4f2
            call0        sdk_wpa_sm_rx_eapol                   #  4f7: 0178ffc0
                                                               #  4fb: 0000
            j            .Lbr033                               #  4fd: 86aeff
.Lbr053:    l8ui         a5, a0, 13                            #  500: 52000d
            l8ui         a6, a0, 12                            #  503: 62000c
            slli         a5, a5, 8                             #  506: 805511
            or           a5, a5, a6                            #  509: 605520
            bne          a5, a2, .Lbr054                       #  50c: 279512
            addi         a2, a0, 6                             #  50f: 6b20
            l16ui        a4, a3, 22                            #  511: 42130b
            addi         a3, a0, 14                            #  514: eb30
            addi         a4, a4, -14                           #  516: 42c4f2
            call0        sdk_wpa_sm_rx_eapol                   #  519: 0170ffc0
                                                               #  51d: 0000
            j            .Lbr033                               #  51f: 06a6ff
.Lbr054:    mov          a2, a13 /* arg0 */                    #  522: 2d0d
            call0        sdk_ieee80211_deliver_data            #  524: 016fffc0
                                                               #  528: 0000
            movi         a2, 8 /* 0x00000008 */                #  52a: 0c82
            j            .Lbr035                               #  52c: c6a5ff

            .literal_position                                  #  530: 00000000
                                                               #  534: 00000000
                                                               #  538: 00000000
                                                               #  53c: 00000000

# Function @ .irom0.text+0x540
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
.Lfunc002:  addi         sp, sp, -16 /* (local0) */            #  540: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  543: 0901
            l32i         a0, a2, 60 /* [arg0+0x3c] */          #  545: 08f2
            bnei         a0, 2, .Lbr057                        #  547: 662037
            bnei         a6, 2, .Lbr057                        #  54a: 662634
            movi         a3, 13 /* 0x0000000d */               #  54d: 0cd3
            bne          a7, a3, .Lbr055                       #  54f: 379715
            movi         a5, sdk_g_ic+0x188                    #  552: 51f7ff
            movi         a4, 2 /* 0x00000002 */                #  555: 0c24
            movi         a3, 176 /* 0x000000b0 */              #  557: 32a0b0
            s8i          a4, a5, 128 /* 0x02 -> [sdk_g_ic+0x208] */ #  55a: 424580
            movi         a4, 1 /* 0x00000001 */                #  55d: 0c14
            call0        sdk_ieee80211_send_mgmt               #  55f: 01f7ffc0
                                                               #  563: 0000
            j            .Lbr057                               #  565: 460600
.Lbr055:    movi         a0, sdk_g_ic                          #  568: 01f3ff
            beqz         a7, .Lbr056                           #  56b: 8ca7
            movi         a3, 0 /* 0x00000000 */                #  56d: 0c03
            movi         a4, 2 /* 0x00000002 */                #  56f: 0c24
            mov          a2, a0 /* sdk_g_ic */                 #  571: 2d00
            call0        sdk_ieee80211_sta_new_state           #  573: 050000
            movi         a0, sdk_g_ic                          #  576: 01f0ff
.Lbr056:    movi         a3, 3 /* 0x00000003 */                #  579: 0c33
            movi         a4, 0 /* 0x00000000 */                #  57b: 0c04
            mov          a2, a0 /* sdk_g_ic */                 #  57d: 2d00
            call0        sdk_ieee80211_sta_new_state           #  57f: 050000
.Lbr057:    l32i         a0, sp, 0 /* [(local0)] */            #  582: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  584: 12c110
            ret                                                #  587: 0df0

            .literal_position                                  #  58c: 00000000
                                                               #  590: 00000000
                                                               #  594: 00000000
                                                               #  598: 00000000
                                                               #  59c: 00000000
                                                               #  5a0: 00000000
                                                               #  5a4: 00000000
                                                               #  5a8: 00000000

# Function @ .irom0.text+0x5ac
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
.Lfunc003:  addi         sp, sp, -32 /* (local0) */            #  5ac: 12c1e0
            l16ui        a7, sp, 36 /* [(FP)+0x4] */           #  5af: 721112
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  5b2: 0921
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  5b4: c931
            movi         a0, sdk_g_ic+0x188                    #  5b6: 01f5ff
            mov          a12, a2 /* arg0 */                    #  5b9: cd02
            movi         a2, 13 /* 0x0000000d */               #  5bb: 0cd2
            bne          a7, a2, .Lbr058                       #  5bd: 279714
            mov          a2, a12 /* arg0 */                    #  5c0: 2d0c
            movi         a3, 176 /* 0x000000b0 */              #  5c2: 32a0b0
            movi         a4, 1 /* 0x00000001 */                #  5c5: 0c14
            movi         a8, 2 /* 0x00000002 */                #  5c7: 0c28
            s8i          a8, a0, 128 /* 0x02 -> [sdk_g_ic+0x208] */ #  5c9: 824080
            call0        sdk_ieee80211_send_mgmt               #  5cc: 01f3ffc0
                                                               #  5d0: 0000
            j            .Lbr061                               #  5d2: 461200
.Lbr058:    l32i         a9, a12, 72 /* [arg0+0x48] */         #  5d5: 922c12
            l8ui         a0, a0, 128 /* [sdk_g_ic+0x208] */    #  5d8: 020080
            bbci         a9, 4, .Lbr059                        #  5db: 476905
            beqi         a0, 4, .Lbr062                        #  5de: 264046
            beqi         a0, 2, .Lbr062                        #  5e1: 262043
.Lbr059:    l32i         a10, a12, 60 /* [arg0+0x3c] */        #  5e4: a8fc
            bnei         a10, 2, .Lbr061                       #  5e6: 662a35
            movi         a2, sdk_g_ic                          #  5e9: 21e9ff
            movi         a3, 1 /* 0x00000001 */                #  5ec: 0c13
            movi         a4, 2 /* 0x00000002 */                #  5ee: 0c24
            call0        sdk_ieee80211_sta_new_state           #  5f0: 050000
            j            .Lbr061                               #  5f3: 060a00
.Lbr060:    mov          a2, a12 /* arg0 */                    #  5f6: 2d0c
            call0        sdk_ieee80211_alloc_challenge         #  5f8: 01e9ffc0
                                                               #  5fc: 0000
            beqz         a2, .Lbr061                           #  5fe: 9cd2
            l32i         a4, sp, 4 /* [(local1)] */            #  600: 4811
            l32i         a2, a12, 84 /* [arg0+0x54] */         #  602: 222c15
            addi         a3, a4, 2 /* [(local1)]+0x2 */        #  605: 2b34
            l8ui         a4, a4, 1 /* [[(local1)]+0x1] */      #  607: 420401
            call0        memcpy                                #  60a: 01e5ffc0
                                                               #  60e: 0000
            mov          a2, a12 /* arg0 */                    #  610: 2d0c
            l32i         a4, sp, 0 /* [(local0)] */            #  612: 4801
            movi         a3, 176 /* 0x000000b0 */              #  614: 32a0b0
            addi         a4, a4, 1 /* [(local0)]+0x1 */        #  617: 1b44
            call0        sdk_ieee80211_send_mgmt               #  619: 01e2ffc0
                                                               #  61d: 0000
.Lbr061:    l32i         a12, sp, 12 /* [(local3)] */          #  61f: c831
            l32i         a0, sp, 8 /* [(local2)] */            #  621: 0821
            addi         sp, sp, 32 /* (local5) */             #  623: 12c120
            ret                                                #  626: 0df0
.Lbr062:    movi         a8, 0 /* 0x00000000 */                #  628: 0c08
            addi         a6, a4, 1 /* arg2+0x1 */              #  62a: 1b64
            bgeu         a6, a5, .Lbr063                       #  62c: 57b618
            l8ui         a10, a4, 1 /* [arg2+0x1] */           #  62f: a20401
            sub          a9, a5, a4                            #  632: 4095c0
            addi         a10, a10, 2 /* [arg2+0x1]+0x2 */      #  635: 2baa
            blt          a9, a10, .Lbr059                      #  637: a729a9
            l8ui         a11, a4, 0 /* [arg2] */               #  63a: b20400
            addi         a11, a11, -16 /* [arg2]-0x10 */       #  63d: b2cbf0
            moveqz       a8, a4, a11                           #  640: b08483
            mov          a5, a8                                #  643: 5d08
            j            .Lbr064                               #  645: 460000
.Lbr063:    mov          a5, a8 /* 0x00000000 */               #  648: 5d08
.Lbr064:    l16ui        a0, sp, 32 /* [(local5)] */           #  64a: 021110
            bgei         a0, 4, .Lbr065                        #  64d: e6400b
            blti         a0, 2, .Lbr065                        #  650: a62008
            beqz         a5, .Lbr059                           #  653: 16d5f8
            l8ui         a3, a5, 1                             #  656: 320501
            bnei         a3, 128, .Lbr059                      #  659: 66e387
.Lbr065:    l32i         a4, a12, 60 /* [arg0+0x3c] */         #  65c: 48fc
            bnei         a4, 2, .Lbr061                        #  65e: 6624bd
            s32i         a0, sp, 0 /* [(local5)] -> [(local0)] */ #  661: 0901
            s32i         a5, sp, 4 /* a5 -> [(local1)] */      #  663: 5911
            beqi         a0, 2, .Lbr060                        #  665: 26208d
            bnei         a0, 4, .Lbr061                        #  668: 6640b3
            l32i         a2, a12, 84 /* [arg0+0x54] */         #  66b: 222c15
            s32i         a7, sp, 16 /* [(FP)+0x4] -> [(local4)] */ #  66e: 7941
            beqz         a2, .Lbr066                           #  670: 8cb2
            call0        free                                  #  672: 01cdffc0
                                                               #  676: 0000
            l32i         a7, sp, 16 /* [(local4)] */           #  678: 7841
            movi         a5, 0 /* 0x00000000 */                #  67a: 0c05
            s32i         a5, a12, 84 /* 0x00000000 -> [arg0+0x54] */ #  67c: 526c15
.Lbr066:    bnez         a7, .Lbr061                           #  67f: 56c7f9
            movi         a2, sdk_g_ic                          #  682: 21c4ff
            movi         a3, 3 /* 0x00000003 */                #  685: 0c33
            movi         a4, 0 /* 0x00000000 */                #  687: 0c04
            call0        sdk_ieee80211_sta_new_state           #  689: 050000
            j            .Lbr061                               #  68c: c6e3ff

            .balign      4
# Function @ .irom0.text+0x690
            .balign      4
            .global      sdk_ieee80211_parse_wmeparams
            .type        sdk_ieee80211_parse_wmeparams, @function
sdk_ieee80211_parse_wmeparams:
            l8ui         a5, a3, 1 /* [arg1+0x1] */            #  690: 520301
            movi         a4, 23 /* 0x00000017 */               #  693: 1c74
            bltu         a4, a5, .Lbr067                       #  695: 573403
            movi         a2, -1 /* 0xffffffff */               #  698: 7cf2
            ret           /* 0xffffffff */                     #  69a: 0df0
.Lbr067:    l8ui         a7, a3, 8 /* [arg1+0x8] */            #  69c: 720308
            l8ui         a8, a2, 87 /* [arg0+0x57] */          #  69f: 820257
            extui        a6, a7, 0, 4                          #  6a2: 706034
            bne          a8, a6, .Lbr068                       #  6a5: 679803
            movi         a2, 0 /* 0x00000000 */                #  6a8: 0c02
            ret           /* 0x00000000 */                     #  6aa: 0df0
.Lbr068:    addi         a3, a3, 10 /* arg1+0xa */             #  6ac: ab33
            s8i          a6, a2, 87 /* a6 -> [arg0+0x57] */    #  6ae: 624257
            movi         a9, 128 /* 0x00000080 */              #  6b1: 92a080
            addi         a6, a2, 24 /* arg0+0x18 */            #  6b4: 62c218
            and          a9, a7, a9                            #  6b7: 909710
            s8i          a9, a2, 12 /* a9 -> [arg0+0xc] */     #  6ba: 92420c
.Lbr069:    l8ui         a7, a3, 0                             #  6bd: 720300
            extui        a7, a7, 4, 1                          #  6c0: 707404
            s8i          a7, a2, 88                            #  6c3: 724258
            l8ui         a5, a3, 0                             #  6c6: 520300
            extui        a5, a5, 0, 4                          #  6c9: 505034
            s8i          a5, a2, 89                            #  6cc: 524259
            l8ui         a4, a3, 1                             #  6cf: 420301
            extui        a4, a4, 0, 4                          #  6d2: 404034
            s8i          a4, a2, 90                            #  6d5: 42425a
            l8ui         a11, a3, 1                            #  6d8: b20301
            addi         a2, a2, 6                             #  6db: 6b22
            extui        a11, a11, 4, 4                        #  6dd: b0b434
            s8i          a11, a2, 85                           #  6e0: b24255
            l8ui         a10, a3, 2                            #  6e3: a20302
            s8i          a10, a2, 86                           #  6e6: a24256
            addi         a3, a3, 4                             #  6e9: 4b33
            bne          a2, a6, .Lbr069                       #  6eb: 6792ce
            movi         a2, 1 /* 0x00000001 */                #  6ee: 0c12
            ret           /* 0x00000001 */                     #  6f0: 0df0

            .literal_position                                  #  6f4: 00000000
                                                               #  6f8: 00000000
                                                               #  6fc: 00000000
                                                               #  700: 6c090000
                                                               #  704: 00000000
                                                               #  708: 00000000
                                                               #  70c: 00000000
                                                               #  710: 00000000
                                                               #  714: 00000000
                                                               #  718: 00000000
                                                               #  71c: 00000000

# Function @ .irom0.text+0x720
# Local variables/stack:
#     (local0):  word      @ -0x80
#     (local1):  word[21]  @ -0x7c
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
.Lfunc004:  addi         sp, sp, -128 /* (local0) */           #  720: 12c180
            s32i         a14, sp, 112 /* a14 -> [(local8)] */  #  723: e2611c
            s32i         a15, sp, 116 /* a15 -> [(local9)] */  #  726: f2611d
            s32i         a5, sp, 92 /* arg3 -> [(local3)] */   #  729: 526117
            s32i         a6, sp, 88 /* arg4 -> [(local2)] */   #  72c: 626116
            s32i         a0, sp, 100 /* a0 -> [(local5)] */    #  72f: 026119
            s32i         a13, sp, 108 /* a13 -> [(local7)] */  #  732: d2611b
            s32i         a12, sp, 104 /* a12 -> [(local6)] */  #  735: c2611a
            s32i         a3, sp, 120 /* arg1 -> [(local10)] */ #  738: 32611e
            mov          a12, a4 /* arg2 */                    #  73b: cd04
            movi         a3, 72 /* 0x00000048 */               #  73d: 4c83
            mov          a13, a2 /* arg0 */                    #  73f: dd02
            l32i         a0, a2, 0 /* [arg0] */                #  741: 0802
            s32i         a0, sp, 96 /* [arg0] -> [(local4)] */ #  743: 026118
            addi         a2, sp, 16 /* (FP)-0x70 */            #  746: 22c110
            call0        bzero                                 #  749: 01ecffc0
                                                               #  74d: 0000
            l32i         a15, sp, 120 /* [(local10)] */        #  74f: f2211e
            l32i         a14, a15, 4 /* [[(local10)]+0x4] */   #  752: e81f
            l16ui        a15, a15, 22 /* [[(local10)]+0x16] */ #  754: f21f0b
            l32i         a14, a14, 4 /* [[[(local10)]+0x4]+0x4] */ #  757: e81e
            movi         a0, 80 /* 0x00000050 */               #  759: 5c00
            add          a15, a15, a14                         #  75b: eaff
            addi         a15, a15, 24                          #  75d: f2cf18
            blt          a12, a0, .Lbr070                      #  760: 072c07
            blt          a0, a12, .Lbr074                      #  763: c72052
            movi         a12, 1 /* 0x00000001 */               #  766: 0c1c
            j            .Lbr078                               #  768: 462400
.Lbr070:    blti         a12, 32, .Lbr072                      #  76b: a6cc2c
            movi         a0, 32 /* 0x00000020 */               #  76e: 2c00
            bge          a0, a12, .Lbr073                      #  770: c7a02f
            bgei         a12, 64, .Lbr073                      #  773: e6dc2c
            movi         a2, 48 /* 0x00000030 */               #  776: 3c02
            bne          a12, a2, .Lbr073                      #  778: 279c27
.Lbr071:    l32i         a3, a13, 60 /* [arg0+0x3c] */         #  77b: 38fd
            bnei         a3, 3, .Lbr073                        #  77d: 663322
            sub          a4, a15, a14                          #  780: e04fc0
            addi         a4, a4, -24                           #  783: 42c4e8
            blti         a4, 6, .Lbr073                        #  786: a66419
            mov          a5, a12 /* arg2 */                    #  789: 5d0c
            mov          a4, a15                               #  78b: 4d0f
            mov          a2, a13 /* arg0 */                    #  78d: 2d0d
            addi         a3, a14, 24 /* [[[(local10)]+0x4]+0x4]+0x18 */ #  78f: 32ce18
            call0        .Lfunc005                             #  792: 01dbffc0
                                                               #  796: 0000
            j            .Lbr073                               #  798: c60100
.Lbr072:    blti         a12, 16, .Lbr073                      #  79b: a6bc04
            movi         a5, 16 /* 0x00000010 */               #  79e: 1c05
            bge          a5, a12, .Lbr071                      #  7a0: c7a5d7
.Lbr073:    l32i         a12, sp, 104 /* [(local6)] */         #  7a3: c2211a
            l32i         a13, sp, 108 /* [(local7)] */         #  7a6: d2211b
            l32i         a14, sp, 112 /* [(local8)] */         #  7a9: e2211c
            l32i         a15, sp, 116 /* [(local9)] */         #  7ac: f2211d
            movi         a2, 128 /* 0x00000080 */              #  7af: 22a080
            l32i         a0, sp, 100 /* [(local5)] */          #  7b2: 022119
            add          sp, sp, a2 /* (top of frame) */       #  7b5: 2a11
            ret           /* 0x00000080 */                     #  7b7: 0df0
.Lbr074:    movi         a10, 176 /* 0x000000b0 */             #  7b9: a2a0b0
            bge          a12, a10, .Lbr075                     #  7bc: a7ac02
            j            .Lbr080                               #  7bf: 862200
.Lbr075:    bge          a10, a12, .Lbr076                     #  7c2: c7aa02
            j            .Lbr084                               #  7c5: 063500
.Lbr076:    sub          a6, a15, a14                          #  7c8: e06fc0
            addi         a6, a6, -24                           #  7cb: 62c6e8
            blti         a6, 6, .Lbr073                        #  7ce: a666d1
            l16ui        a6, a14, 26 /* [[[[(local10)]+0x4]+0x4]+0x1a] */ #  7d1: 621e0d
            l16ui        a0, a14, 24 /* [[[[(local10)]+0x4]+0x4]+0x18] */ #  7d4: 021e0c
            l16ui        a7, a14, 28 /* [[[[(local10)]+0x4]+0x4]+0x1c] */ #  7d7: 721e0e
            addi         a8, a0, -1 /* [[[[(local10)]+0x4]+0x4]+0x18]-0x1 */ #  7da: 0b80
            bnez         a8, .Lbr086                           #  7dc: 56180f
            mov          a5, a15                               #  7df: 5d0f
            mov          a2, a13 /* arg0 */                    #  7e1: 2d0d
            mov          a3, a14 /* [[[(local10)]+0x4]+0x4] */ #  7e3: 3d0e
            addi         a4, a14, 30 /* [[[(local10)]+0x4]+0x4]+0x1e */ #  7e5: 42ce1e
            s32i         a6, sp, 0 /* [[[[(local10)]+0x4]+0x4]+0x1a] -> [(local0)] */ #  7e8: 6901
            s32i         a7, sp, 4 /* [[[[(local10)]+0x4]+0x4]+0x1c] -> [(local1)] */ #  7ea: 7911
            l32i         a6, sp, 92 /* [(local3)] */           #  7ec: 622117
            l32i         a7, sp, 88 /* [(local2)] */           #  7ef: 722116
            call0        .Lfunc003                             #  7f2: 85dbff
            j            .Lbr073                               #  7f5: 86eaff
.Lbr077:    bnei         a12, 128, .Lbr073                     #  7f8: 66eca7
            movi         a12, 0 /* 0x00000000 */               #  7fb: 0c0c
.Lbr078:    l32i         a2, sp, 120 /* [(local10)] */         #  7fd: 22211e
            addi         a3, sp, 16 /* (FP)-0x70 */            #  800: 32c110
            mov          a4, a12                               #  803: 4d0c
            call0        sdk_ieee80211_parse_beacon            #  805: 01bfffc0
                                                               #  809: 0000
            bnez         a2, .Lbr073                           #  80b: 5642f9
            mov          a4, a12                               #  80e: 4d0c
            l32i         a2, sp, 120 /* [(local10)] */         #  810: 22211e
            addi         a3, sp, 16 /* (FP)-0x70 */            #  813: 32c110
            call0        sdk_scan_parse_beacon                 #  816: 01bcffc0
                                                               #  81a: 0000
            l32i         a9, a13, 136 /* [arg0+0x88] */        #  81c: 922d22
            beqz         a9, .Lbr073                           #  81f: 1609f8
            l32i         a10, a13, 60 /* [arg0+0x3c] */        #  822: a8fd
            beqi         a10, 5, .Lbr079                       #  824: 265a02
            j            .Lbr073                               #  827: 06deff
.Lbr079:    addi         a12, a13, 32 /* arg0+0x20 */          #  82a: c2cd20
            mov          a2, a12 /* arg0+0x20 */               #  82d: 2d0c
            call0        sdk_os_timer_disarm                   #  82f: 01b7ffc0
                                                               #  833: 0000
            l32i         a4, a13, 136 /* [arg0+0x88] */        #  835: 422d22
            movi         a3, 30 /* 0x0000001e */               #  838: 1ce3
            l16ui        a4, a4, 28 /* [[arg0+0x88]+0x1c] */   #  83a: 42140e
            mov          a2, a12 /* arg0+0x20 */               #  83d: 2d0c
            mul16u       a3, a3, a4                            #  83f: 4033c1
            movi         a4, 0 /* 0x00000000 */                #  842: 0c04
            call0        sdk_os_timer_arm                      #  844: 01b3ffc0
                                                               #  848: 0000
            j            .Lbr073                               #  84a: 46d5ff
.Lbr080:    movi         a0, 160 /* 0x000000a0 */              #  84d: 02a0a0
            blt          a12, a0, .Lbr077                      #  850: 072ca4
            bge          a0, a12, .Lbr081                      #  853: c7a002
            j            .Lbr073                               #  856: 46d2ff
.Lbr081:    l32i         a0, a13, 60 /* [arg0+0x3c] */         #  859: 08fd
            beqi         a0, 5, .Lbr082                        #  85b: 265008
            beqi         a0, 3, .Lbr082                        #  85e: 263005
            addi         a5, a0, -2 /* [arg0+0x3c]-0x2 */      #  861: 52c0fe
            bnez         a5, .Lbr073                           #  864: 56b5f3
.Lbr082:    addi         a2, a14, 4 /* [[[(local10)]+0x4]+0x4]+0x4 */ #  867: 4b2e
            l32i         a3, sp, 96 /* [(local4)] */           #  869: 322118
            movi         a4, 6 /* 0x00000006 */                #  86c: 0c64
            addi         a3, a3, 41 /* [(local4)]+0x29 */      #  86e: 32c329
            call0        memcmp                                #  871: 01a8ffc0
                                                               #  875: 0000
            bnez         a2, .Lbr073                           #  877: 5682f2
            sub          a4, a15, a14                          #  87a: e04fc0
            addi         a4, a4, -24                           #  87d: 42c4e8
            bgei         a4, 2, .Lbr083                        #  880: e62402
            j            .Lbr073                               #  883: 06c7ff
.Lbr083:    movi         a2, sdk_g_ic                          #  886: 219bff
            movi         a3, 2 /* 0x00000002 */                #  889: 0c23
            l16ui        a4, a14, 24 /* [[[[(local10)]+0x4]+0x4]+0x18] */ #  88b: 421e0c
            movi         a5, 160 /* 0x000000a0 */              #  88e: 52a0a0
            slli         a4, a4, 8                             #  891: 804411
            or           a4, a4, a5                            #  894: 504420
            call0        sdk_ieee80211_sta_new_state           #  897: 050000
            j            .Lbr073                               #  89a: 46c1ff
.Lbr084:    movi         a0, 208 /* 0x000000d0 */              #  89d: 02a0d0
            blt          a12, a0, .Lbr087                      #  8a0: 072c40
            bge          a0, a12, .Lbr085                      #  8a3: c7a002
            j            .Lbr073                               #  8a6: 46beff
.Lbr085:    l32i         a5, a13, 60 /* [arg0+0x3c] */         #  8a9: 58fd
            addi         a5, a5, -5 /* [arg0+0x3c]-0x5 */      #  8ab: 52c5fb
            bnez         a5, .Lbr073                           #  8ae: 5615ef
            mov          a2, a13 /* arg0 */                    #  8b1: 2d0d
            l32i         a3, sp, 120 /* [(local10)] */         #  8b3: 32211e
            call0        sdk_ieee80211_parse_action            #  8b6: 0198ffc0
                                                               #  8ba: 0000
            bnez         a2, .Lbr073                           #  8bc: 5632ee
            mov          a5, a15                               #  8bf: 5d0f
            mov          a2, a13 /* arg0 */                    #  8c1: 2d0d
            mov          a3, a14 /* [[[(local10)]+0x4]+0x4] */ #  8c3: 3d0e
            addi         a4, a14, 24 /* [[[(local10)]+0x4]+0x4]+0x18 */ #  8c5: 42ce18
            call0        sdk_ieee80211_recv_action             #  8c8: 0195ffc0
                                                               #  8cc: 0000
            j            .Lbr073                               #  8ce: 46b4ff
.Lbr086:    bnez         a0, .Lbr073                           #  8d1: 56e0ec
            mov          a3, a14 /* [[[(local10)]+0x4]+0x4] */ #  8d4: 3d0e
            mov          a2, a13 /* arg0 */                    #  8d6: 2d0d
            l32i         a4, sp, 92 /* [(local3)] */           #  8d8: 422117
            l32i         a5, sp, 88 /* [(local2)] */           #  8db: 522116
            call0        .Lfunc002                             #  8de: 05c6ff
            j            .Lbr073                               #  8e1: 86afff
.Lbr087:    movi         a0, 192 /* 0x000000c0 */              #  8e4: 02a0c0
            sub          a6, a12, a0 /* arg2-0xc0 */           #  8e7: 006cc0
            bnez         a6, .Lbr073                           #  8ea: 5656eb
            sub          a7, a15, a14                          #  8ed: e07fc0
            addi         a7, a7, -24                           #  8f0: 72c7e8
            bgei         a7, 2, .Lbr088                        #  8f3: e62702
            j            .Lbr073                               #  8f6: 46aaff
.Lbr088:    l32i         a8, a13, 60 /* [arg0+0x3c] */         #  8f9: 88fd
            addi         a8, a8, -5 /* [arg0+0x3c]-0x5 */      #  8fb: 82c8fb
            bnez         a8, .Lbr073                           #  8fe: 5618ea
            movi         a2, sdk_g_ic                          #  901: 217dff
            l16ui        a4, a14, 24 /* [[[[(local10)]+0x4]+0x4]+0x18] */ #  904: 421e0c
            movi         a3, 2 /* 0x00000002 */                #  907: 0c23
            slli         a4, a4, 8                             #  909: 804411
            or           a4, a4, a0                            #  90c: 004420
            call0        sdk_ieee80211_sta_new_state           #  90f: 050000
            j            .Lbr073                               #  912: 46a3ff

            .literal_position                                  #  918: 00000000
                                                               #  91c: 00000000
                                                               #  920: 00000400
                                                               #  924: ffffdfff
                                                               #  928: 00001000
                                                               #  92c: 0050f202
                                                               #  930: 00000000
                                                               #  934: 00904c33
                                                               #  938: 00904c34
                                                               #  93c: 00060060
                                                               #  940: ffffefff
                                                               #  944: fffffbff
                                                               #  948: 00002000
                                                               #  94c: 00000000
                                                               #  950: 00000000
                                                               #  954: 00000000
                                                               #  958: 00000000
                                                               #  95c: 00000000
                                                               #  960: 00000000
                                                               #  964: 00000000
                                                               #  968: 00000000

# Function @ .irom0.text+0x96c
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
#     (local9):  word[3]   @ -0xc
            .balign      4
.Lfunc005:  addi         sp, sp, -48 /* (local0) */            #  96c: 12c1d0
            s32i         a14, sp, 24 /* a14 -> [(local6)] */   #  96f: e961
            s32i         a15, sp, 28 /* a15 -> [(local7)] */   #  971: f971
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     #  973: 0931
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   #  975: c941
            s32i         a13, sp, 20 /* a13 -> [(local5)] */   #  977: d951
            mov          a13, a2 /* arg0 */                    #  979: dd02
            l32i         a12, a13, 136 /* [arg0+0x88] */       #  97b: c22d22
            mov          a2, a5 /* arg3 */                     #  97e: 2d05
            bnez         a12, .Lbr097                          #  980: 567c0c
.Lbr089:    movi         a2, -1 /* 0xffffffff */               #  983: 7cf2
            j            .Lbr096                               #  985: c62c00
.Lbr090:    l32i         a2, a12, 8 /* [[arg0+0x88]+0x8] */    #  988: 282c
            movi         a3, -3 /* 0xfffffffd */               #  98a: 7cd3
            and          a2, a2, a3                            #  98c: 302210
            s32i         a2, a12, 8 /* a2 -> [[arg0+0x88]+0x8] */ #  98f: 292c
.Lbr091:    beqz         a14, .Lbr092                          #  991: bc3e
            beqz         a15, .Lbr092                          #  993: bc1f
            movi         a4, sdk_g_ic+0x200                    #  995: 41e0ff
            l32i         a4, a4, 0x30c /* [sdk_g_ic+0x50c] */  #  998: 4224c3
            bbci         a4, 19, .Lbr092                       #  99b: 377429
            mov          a2, a13 /* arg0 */                    #  99e: 2d0d
            call0        sdk_ieee80211_ht_node_init            #  9a0: 01ebffc0
                                                               #  9a4: 0000
            mov          a2, a13 /* arg0 */                    #  9a6: 2d0d
            mov          a3, a14                               #  9a8: 3d0e
            mov          a4, a15                               #  9aa: 4d0f
            call0        sdk_ieee80211_ht_updateparams         #  9ac: 01e9ffc0
                                                               #  9b0: 0000
            mov          a3, a14                               #  9b2: 3d0e
            mov          a2, a13 /* arg0 */                    #  9b4: 2d0d
            movi         a4, 48 /* 0x00000030 */               #  9b6: 3c04
            call0        sdk_ieee80211_setup_htrates           #  9b8: 01e7ffc0
                                                               #  9bc: 0000
            mov          a3, a15                               #  9be: 3d0f
            mov          a2, a13 /* arg0 */                    #  9c0: 2d0d
            call0        sdk_ieee80211_setup_basic_htrates     #  9c2: 01e5ffc0
                                                               #  9c6: 0000
.Lbr092:    movi         a13, sdk_g_ic                         #  9c8: d1d5ff
            l16ui        a2, a12, 30 /* [[arg0+0x88]+0x1e] */  #  9cb: 221c0f
            l32i         a0, a13, 28 /* [sdk_g_ic+0x1c] */     #  9ce: 087d
            extui        a5, a2, 5, 1                          #  9d0: 205504
            beqz         a5, .Lbr118                           #  9d3: 16c521
            movi         a4, 0x00040000                        #  9d6: 41d2ff
            movi         a3, 0xffdfffff                        #  9d9: 31d2ff
            or           a0, a0, a4                            #  9dc: 400020
            s32i         a0, a13, 28 /* a0 -> [sdk_g_ic+0x1c] */ #  9df: 097d
            and          a0, a0, a3                            #  9e1: 300010
.Lbr093:    movi         a3, 1024 /* 0x00000400 */             #  9e4: 32a400
            s32i         a0, a13, 28 /* a0 -> [sdk_g_ic+0x1c] */ #  9e7: 097d
            and          a3, a2, a3                            #  9e9: 303210
            mov          a2, a13 /* sdk_g_ic */                #  9ec: 2d0d
            call0        sdk_ieee80211_set_shortslottime       #  9ee: 01dbffc0
                                                               #  9f2: 0000
            l32i         a0, a12, 120 /* [[arg0+0x88]+0x78] */ #  9f4: 022c1e
            l32i         a0, a0, 0 /* [[[arg0+0x88]+0x78]] */  #  9f7: 0800
            movi         a4, 192 /* 0x000000c0 */              #  9f9: 42a0c0
            ball         a0, a4, .Lbr094                       #  9fc: 474008
            movi         a2, 1152 /* 0x00000480 */             #  9ff: 22a480
            ball         a0, a2, .Lbr094                       #  a02: 274002
            j            .Lbr117                               #  a05: c67700
.Lbr094:    l16ui        a3, a12, 34 /* [[arg0+0x88]+0x22] */  #  a08: 321c11
            extui        a3, a3, 1, 1                          #  a0b: 303104
            beqz         a3, .Lbr117                           #  a0e: 16631d
            movi         a2, 0x00100000                        #  a11: 21c5ff
            l32i         a0, a13, 28 /* [sdk_g_ic+0x1c] */     #  a14: 087d
            or           a0, a0, a2                            #  a16: 200020
.Lbr095:    mov          a2, a13 /* sdk_g_ic */                #  a19: 2d0d
            l32i         a4, sp, 0 /* [(local0)] */            #  a1b: 4801
            l32i         a3, a13, 0 /* [sdk_g_ic] */           #  a1d: 380d
            s32i         a0, a13, 28 /* a0 -> [sdk_g_ic+0x1c] */ #  a1f: 097d
            addmi        a3, a3, 1536 /* [sdk_g_ic]+0x600 */   #  a21: 32d306
            s32i         a12, a3, 140 /* [arg0+0x88] -> [[sdk_g_ic]+0x68c] */ #  a24: c26323
            movi         a3, 5 /* 0x00000005 */                #  a27: 0c53
            call0        sdk_ieee80211_sta_new_state           #  a29: 050000
            mov          a3, a12 /* [arg0+0x88] */             #  a2c: 3d0c
            movi         a2, 0 /* 0x00000000 */                #  a2e: 0c02
            movi         a4, 1 /* 0x00000001 */                #  a30: 0c14
            movi         a5, 0 /* 0x00000000 */                #  a32: 0c05
            call0        sdk_ic_bss_info_update                #  a34: 01cbffc0
                                                               #  a38: 0000
            movi         a2, 0 /* 0x00000000 */                #  a3a: 0c02
.Lbr096:    l32i         a12, sp, 16 /* [(local4)] */          #  a3c: c841
            l32i         a13, sp, 20 /* [(local5)] */          #  a3e: d851
            l32i         a14, sp, 24 /* [(local6)] */          #  a40: e861
            l32i         a15, sp, 28 /* [(local7)] */          #  a42: f871
            l32i         a0, sp, 12 /* [(local3)] */           #  a44: 0831
            addi         sp, sp, 48 /* (top of frame) */       #  a46: 12c130
            ret                                                #  a49: 0df0
.Lbr097:    l16ui        a5, a3, 2 /* [arg1+0x2] */            #  a4b: 521301
            l16ui        a0, a3, 0 /* [arg1] */                #  a4e: 021300
            bnez         a5, .Lbr089                           #  a51: 56e5f2
            s32i         a0, sp, 4 /* [arg1] -> [(local1)] */  #  a54: 0911
            s32i         a2, sp, 0 /* arg3 -> [(local0)] */    #  a56: 2901
            l16ui        a6, a3, 4 /* [arg1+0x4] */            #  a58: 621302
            s32i         a6, sp, 8 /* [arg1+0x4] -> [(local2)] */ #  a5b: 6921
            addi         a3, a3, 6 /* arg1+0x6 */              #  a5d: 6b33
            sub          a9, a4, a3                            #  a5f: 3094c0
            bgei         a9, 2, .Lbr098                        #  a62: e62902
            j            .Lbr112                               #  a65: 464200
.Lbr098:    movi         a5, 50 /* 0x00000032 */               #  a68: 3c25
            movi         a11, 45 /* 0x0000002d */              #  a6a: 2cdb
            movi         a10, 0 /* 0x00000000 */               #  a6c: 0c0a
            movi         a2, 0 /* 0x00000000 */                #  a6e: 0c02
            movi         a0, 0 /* 0x00000000 */                #  a70: 0c00
            movi         a15, 0 /* 0x00000000 */               #  a72: 0c0f
            movi         a14, 0 /* 0x00000000 */               #  a74: 0c0e
.Lbr099:    l8ui         a8, a3, 1                             #  a76: 820301
            l8ui         a7, a3, 0                             #  a79: 720300
            addi         a6, a8, 2                             #  a7c: 2b68
            bge          a9, a6, .Lbr100                       #  a7e: 67a902
            j            .Lbr089                               #  a81: 86bfff
.Lbr100:    addi         a9, a7, -1                            #  a84: 0b97
            beqz         a9, .Lbr109                           #  a86: 16690d
            sub          a6, a7, a11                           #  a89: b067c0
            beqz         a6, .Lbr108                           #  a8c: 16b60c
            sub          a9, a7, a5                            #  a8f: 5097c0
            beqz         a9, .Lbr107                           #  a92: 16090c
            addi         a6, a7, -61                           #  a95: 62c7c3
            beqz         a6, .Lbr106                           #  a98: 16560b
            movi         a9, 221 /* 0x000000dd */              #  a9b: 92a0dd
            sub          a9, a7, a9                            #  a9e: 9097c0
            bnez         a9, .Lbr110                           #  aa1: 56d90b
            movi         a9, 0 /* 0x00000000 */                #  aa4: 0c09
            bltui        a8, 4, .Lbr101                        #  aa6: b64829
            l8ui         a6, a3, 2                             #  aa9: 620302
            s32i         a0, sp, 36 /* a0 -> [(local9)] */     #  aac: 0991
            l8ui         a7, a3, 3                             #  aae: 720303
            l8ui         a0, a3, 5                             #  ab1: 020305
            slli         a7, a7, 8                             #  ab4: 807711
            or           a6, a6, a7                            #  ab7: 706620
            l8ui         a7, a3, 4                             #  aba: 720304
            slli         a0, a0, 24                            #  abd: 800001
            slli         a7, a7, 16                            #  ac0: 007711
            or           a7, a7, a0                            #  ac3: 007720
            or           a6, a6, a7                            #  ac6: 706620
            movi         a7, 0x02f25000                        #  ac9: 7198ff
            l32i         a0, sp, 36 /* [(local9)] */           #  acc: 0891
            bne          a6, a7, .Lbr101                       #  ace: 779601
            movi         a9, 1 /* 0x00000001 */                #  ad1: 0c19
.Lbr101:    beqz         a9, .Lbr102                           #  ad3: 8c39
            mov          a10, a3                               #  ad5: ad03
            j            .Lbr110                               #  ad7: c62100
.Lbr102:    movi         a9, sdk_g_ic+0x200                    #  ada: 9195ff
            l32i         a9, a9, 0x30c /* [sdk_g_ic+0x50c] */  #  add: 9229c3
            bbci         a9, 28, .Lbr110                       #  ae0: c7797e
            movi         a9, 0 /* 0x00000000 */                #  ae3: 0c09
            bltui        a8, 4, .Lbr103                        #  ae5: b64829
            l8ui         a6, a3, 2                             #  ae8: 620302
            s32i         a0, sp, 36 /* a0 -> [(local9)] */     #  aeb: 0991
            l8ui         a7, a3, 3                             #  aed: 720303
            l8ui         a0, a3, 5                             #  af0: 020305
            slli         a7, a7, 8                             #  af3: 807711
            or           a6, a6, a7                            #  af6: 706620
            l8ui         a7, a3, 4                             #  af9: 720304
            slli         a0, a0, 24                            #  afc: 800001
            slli         a7, a7, 16                            #  aff: 007711
            or           a7, a7, a0                            #  b02: 007720
            or           a6, a6, a7                            #  b05: 706620
            movi         a7, 0x334c9000                        #  b08: 718bff
            l32i         a0, sp, 36 /* [(local9)] */           #  b0b: 0891
            bne          a6, a7, .Lbr103                       #  b0d: 779601
            movi         a9, 1 /* 0x00000001 */                #  b10: 0c19
.Lbr103:    beqz         a9, .Lbr104                           #  b12: 8c49
            moveqz       a14, a3, a14                          #  b14: e0e383
            j            .Lbr110                               #  b17: c61100
.Lbr104:    movi         a9, 0 /* 0x00000000 */                #  b1a: 0c09
            bltui        a8, 4, .Lbr105                        #  b1c: b64829
            l8ui         a6, a3, 2                             #  b1f: 620302
            s32i         a0, sp, 36 /* a0 -> [(local9)] */     #  b22: 0991
            l8ui         a7, a3, 3                             #  b24: 720303
            l8ui         a0, a3, 5                             #  b27: 020305
            slli         a7, a7, 8                             #  b2a: 807711
            or           a6, a6, a7                            #  b2d: 706620
            l8ui         a7, a3, 4                             #  b30: 720304
            slli         a0, a0, 24                            #  b33: 800001
            slli         a7, a7, 16                            #  b36: 007711
            or           a7, a7, a0                            #  b39: 007720
            or           a6, a6, a7                            #  b3c: 706620
            movi         a7, 0x344c9000                        #  b3f: 717eff
            l32i         a0, sp, 36 /* [(local9)] */           #  b42: 0891
            bne          a6, a7, .Lbr105                       #  b44: 779601
            movi         a9, 1 /* 0x00000001 */                #  b47: 0c19
.Lbr105:    beqz         a9, .Lbr110                           #  b49: 9c59
            moveqz       a14, a3, a15                          #  b4b: f0e383
            j            .Lbr110                               #  b4e: 060400
.Lbr106:    mov          a15, a3                               #  b51: fd03
            j            .Lbr110                               #  b53: c60200
.Lbr107:    mov          a2, a3                                #  b56: 2d03
            j            .Lbr110                               #  b58: 860100
.Lbr108:    mov          a14, a3                               #  b5b: ed03
            j            .Lbr110                               #  b5d: 460000
.Lbr109:    mov          a0, a3                                #  b60: 0d03
.Lbr110:    add          a3, a8, a3                            #  b62: 3a38
            addi         a3, a3, 2                             #  b64: 2b33
            sub          a9, a4, a3                            #  b66: 3094c0
            blti         a9, 2, .Lbr111                        #  b69: a62902
            j            .Lbr099                               #  b6c: 86c1ff
.Lbr111:    j            .Lbr113                               #  b6f: 460200
.Lbr112:    movi         a14, 0 /* 0x00000000 */               #  b72: 0c0e
            movi         a15, 0 /* 0x00000000 */               #  b74: 0c0f
            movi         a0, 0 /* 0x00000000 */                #  b76: 0c00
            movi         a2, 0 /* 0x00000000 */                #  b78: 0c02
            movi         a10, 0 /* 0x00000000 */               #  b7a: 0c0a
.Lbr113:    beqz         a0, .Lbr089                           #  b7c: 1630e0
            l8ui         a3, a0, 1                             #  b7f: 320001
            bltui        a3, 16, .Lbr114                       #  b82: b6b302
            j            .Lbr089                               #  b85: 867eff
.Lbr114:    s32i         a10, sp, 32 /* a10 -> [(local8)] */   #  b88: a981
            beqz         a2, .Lbr115                           #  b8a: 8ce2
            s32i         a10, sp, 32 /* a10 -> [(local8)] */   #  b8c: a981
            l8ui         a5, a2, 1                             #  b8e: 520201
            movi         a4, 15 /* 0x0000000f */               #  b91: 0cf4
            sub          a4, a4, a3                            #  b93: 3044c0
            bge          a4, a5, .Lbr115                       #  b96: 57a402
            j            .Lbr089                               #  b99: 8679ff
.Lbr115:    movi         a5, 47 /* 0x0000002f */               #  b9c: 2cf5
            mov          a4, a2                                #  b9e: 4d02
            mov          a3, a0                                #  ba0: 3d00
            mov          a2, a12 /* [arg0+0x88] */             #  ba2: 2d0c
            call0        sdk_ieee80211_setup_rates             #  ba4: 0170ffc0
                                                               #  ba8: 0000
            l32i         a3, sp, 32 /* [(local8)] */           #  baa: 3881
            l32i         a6, sp, 8 /* [(local2)] */            #  bac: 6821
            l32i         a5, a13, 80 /* [arg0+0x50] */         #  bae: 522d14
            l32i         a7, sp, 4 /* [(local1)] */            #  bb1: 7811
            s16i         a7, a12, 30 /* [(local1)] -> [[arg0+0x88]+0x1e] */ #  bb3: 725c0f
            s16i         a6, a12, 26 /* [(local2)] -> [[arg0+0x88]+0x1a] */ #  bb6: 625c0d
            bnez         a5, .Lbr116                           #  bb9: cc95
            movi         a8, 0x60000600                        #  bbb: 8160ff
            memw                                               #  bbe: c02000
            l32i         a8, a8, 36 /* [0x60000624] */         #  bc1: 8898
            s32i         a8, a13, 80 /* [0x60000624] -> [arg0+0x50] */ #  bc3: 826d14
.Lbr116:    beqz         a3, .Lbr090                           #  bc6: 16e3db
            mov          a2, a12 /* [arg0+0x88] */             #  bc9: 2d0c
            call0        sdk_ieee80211_parse_wmeparams         #  bcb: 050000
            bltz         a2, .Lbr090                           #  bce: 9662db
            mov          a2, a12 /* [arg0+0x88] */             #  bd1: 2d0c
            addi         a3, a12, 87 /* [arg0+0x88]+0x57 */    #  bd3: 32cc57
            l32i         a10, a12, 8 /* [[arg0+0x88]+0x8] */   #  bd6: a82c
            movi         a11, -3 /* 0xfffffffd */              #  bd8: 7cdb
            and          a10, a10, a11                         #  bda: b0aa10
            s32i         a10, a12, 8 /* a10 -> [[arg0+0x88]+0x8] */ #  bdd: a92c
            call0        sdk_ieee80211_wme_updateparams        #  bdf: 0162ffc0
                                                               #  be3: 0000
            j            .Lbr091                               #  be5: 066aff
.Lbr117:    movi         a2, 0xffefffff                        #  be8: 2156ff
            l32i         a0, a13, 28 /* [sdk_g_ic+0x1c] */     #  beb: 087d
            and          a0, a0, a2                            #  bed: 200010
            j            .Lbr095                               #  bf0: 4689ff
.Lbr118:    movi         a4, 0xfffbffff                        #  bf3: 4154ff
            movi         a3, 0x00200000                        #  bf6: 3154ff
            and          a0, a0, a4                            #  bf9: 400010
            s32i         a0, a13, 28 /* a0 -> [sdk_g_ic+0x1c] */ #  bfc: 097d
            or           a0, a0, a3                            #  bfe: 300020
            j            .Lbr093                               #  c01: c677ff

            .literal_position                                  #  c04: 00000000
                                                               #  c08: 00000000
                                                               #  c0c: 00000000
                                                               #  c10: 00000000
                                                               #  c14: 00000000
                                                               #  c18: 00000000
                                                               #  c1c: 00000000
                                                               #  c20: 00000000
                                                               #  c24: 00000000
                                                               #  c28: 00000000
                                                               #  c2c: 00000000

# Function @ .irom0.text+0xc30
# Local variables/stack:
#     (local0):  word[4]   @ -0x20
#     (local1):  word      @ -0x10
#     (local2):  word      @ -0xc
#     (local3):  word[2]   @ -0x8
            .balign      4
            .global      sdk_wifi_station_start
            .type        sdk_wifi_station_start, @function
sdk_wifi_station_start:
            addi         sp, sp, -32 /* (local0) */            #  c30: 12c1e0
            s32i         a0, sp, 20 /* a0 -> [(local2)] */     #  c33: 0951
            movi         a0, sdk_g_ic                          #  c35: 01f3ff
            s32i         a12, sp, 24 /* a12 -> [(local3)] */   #  c38: c961
            l32i         a12, a0, 16 /* [sdk_g_ic+0x10] */     #  c3a: c840
            movi         a2, 0 /* 0x00000000 */                #  c3c: 0c02
            bnez         a12, .Lbr119                          #  c3e: cc1c
            j            .Lbr122                               #  c40: c61a00
.Lbr119:    l8ui         a2, a12, 187 /* [[sdk_g_ic+0x10]+0xbb] */ #  c43: 220cbb
            movi         a0, sdk_info+0x1e                     #  c46: 01f0ff
            bnei         a2, 1, .Lbr120                        #  c49: 661204
            movi         a2, 1 /* 0x00000001 */                #  c4c: 0c12
            j            .Lbr122                               #  c4e: 461700
.Lbr120:    l32i         a3, a12, 0 /* [[sdk_g_ic+0x10]] */    #  c51: 380c
            s32i         a0, sp, 16 /* sdk_info+0x1e -> [(local1)] */ #  c53: 0941
            bnez         a3, .Lbr121                           #  c55: fc93
            movi         a2, 52 /* 0x00000034 */               #  c57: 3c42
            call0        malloc                                #  c59: 01f0ffc0
                                                               #  c5d: 0000
            l32i         a3, sp, 16 /* [(local1)] */           #  c5f: 3841
            s32i         a2, a12, 0 /* a2 -> [[sdk_g_ic+0x10]] */ #  c61: 290c
            movi         a4, 6 /* 0x00000006 */                #  c63: 0c64
            addi         a2, a2, 41                            #  c65: 22c229
            call0        memcpy                                #  c68: 01eeffc0
                                                               #  c6c: 0000
            mov          a6, a12 /* [sdk_g_ic+0x10] */         #  c6e: 6d0c
            movi         a7, ethernetif_init                   #  c70: 71e7ff
            l32i         a2, a12, 0 /* [[sdk_g_ic+0x10]] */    #  c73: 280c
            movi         a3, sdk_info+0xc                      #  c75: 31e6ff
            movi         a8, tcpip_input                       #  c78: 81e7ff
            addi         a4, a3, 4 /* sdk_info+0x10 */         #  c7b: 4b43
            addi         a5, a3, 8 /* sdk_info+0x14 */         #  c7d: 8b53
            s32i         a8, sp, 0 /* tcpip_input -> [(local0)] */ #  c7f: 8901
            call0        netif_add                             #  c81: 01e8ffc0
                                                               #  c85: 0000
            movi         a2, sdk_g_ic                          #  c87: 21e4ff
            call0        sdk_wpa_attach                        #  c8a: 01e7ffc0
                                                               #  c8e: 0000
            l32i         a0, sp, 16 /* [(local1)] */           #  c90: 0841
.Lbr121:    movi         a2, 0 /* 0x00000000 */                #  c92: 0c02
            movi         a3, 1 /* 0x00000001 */                #  c94: 0c13
            movi         a5, 0 /* 0x00000000 */                #  c96: 0c05
            movi         a6, 0 /* 0x00000000 */                #  c98: 0c06
            mov          a4, a0                                #  c9a: 4d00
            call0        sdk_ic_set_vif                        #  c9c: 01e4ffc0
                                                               #  ca0: 0000
            movi         a2, 1 /* 0x00000001 */                #  ca2: 0c12
            movi         a9, 0 /* 0x00000000 */                #  ca4: 0c09
            s8i          a9, a12, 184 /* 0x00 -> [[sdk_g_ic+0x10]+0xb8] */ #  ca6: 924cb8
            s8i          a9, a12, 185 /* 0x00 -> [[sdk_g_ic+0x10]+0xb9] */ #  ca9: 924cb9
            s8i          a2, a12, 187 /* 0x01 -> [[sdk_g_ic+0x10]+0xbb] */ #  cac: 224cbb
.Lbr122:    l32i         a12, sp, 24 /* [(local3)] */          #  caf: c861
            l32i         a0, sp, 20 /* [(local2)] */           #  cb1: 0851
            addi         sp, sp, 32 /* (top of frame) */       #  cb3: 12c120
            ret                                                #  cb6: 0df0

            .literal_position                                  #  cb8: 00000000
                                                               #  cbc: 00000000
                                                               #  cc0: 00000000

# Function @ .irom0.text+0xcc4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_wifi_station_stop
            .type        sdk_wifi_station_stop, @function
sdk_wifi_station_stop:
            addi         sp, sp, -16 /* (local0) */            #  cc4: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  cc7: c911
            movi         a12, sdk_g_ic                         #  cc9: c1fbff
            movi         a2, 0 /* 0x00000000 */                #  ccc: 0c02
            l32i         a12, a12, 16 /* [sdk_g_ic+0x10] */    #  cce: c84c
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  cd0: 0901
            bnez         a12, .Lbr123                          #  cd2: cc1c
            j            .Lbr125                               #  cd4: 860100
.Lbr123:    l8ui         a0, a12, 187 /* [[sdk_g_ic+0x10]+0xbb] */ #  cd7: 020cbb
            bnez         a0, .Lbr126                           #  cda: cc90
.Lbr124:    movi         a2, 1 /* 0x00000001 */                #  cdc: 0c12
.Lbr125:    l32i         a12, sp, 4 /* [(local1)] */           #  cde: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  ce0: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  ce2: 12c110
            ret                                                #  ce5: 0df0
.Lbr126:    movi         a2, 0 /* 0x00000000 */                #  ce7: 0c02
            s8i          a2, a12, 184 /* 0x00 -> [[sdk_g_ic+0x10]+0xb8] */ #  ce9: 224cb8
            s8i          a2, a12, 185 /* 0x00 -> [[sdk_g_ic+0x10]+0xb9] */ #  cec: 224cb9
            call0        sdk_wifi_station_disconnect           #  cef: 01f3ffc0
                                                               #  cf3: 0000
            movi         a2, 0 /* 0x00000000 */                #  cf5: 0c02
            movi         a3, 0 /* 0x00000000 */                #  cf7: 0c03
            movi         a4, 0 /* 0x00000000 */                #  cf9: 0c04
            movi         a5, 0 /* 0x00000000 */                #  cfb: 0c05
            movi         a6, 0 /* 0x00000000 */                #  cfd: 0c06
            call0        sdk_ic_set_vif                        #  cff: 01f0ffc0
                                                               #  d03: 0000
            movi         a3, 0 /* 0x00000000 */                #  d05: 0c03
            s8i          a3, a12, 187 /* 0x00 -> [[sdk_g_ic+0x10]+0xbb] */ #  d07: 324cbb
            j            .Lbr124                               #  d0a: 86f3ff

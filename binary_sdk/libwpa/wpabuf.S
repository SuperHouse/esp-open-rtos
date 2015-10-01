
            .section     .text, "ax", @progbits

# Function @ .text+0x0
.Lfunc001:  l32i         a4, a2, 8 /* [arg0+0x8] */            #    0: 4822
            addi         a3, a2, 12 /* arg0+0xc */             #    2: cb32
            moveqz       a4, a3, a4                            #    4: 404383
            mov          a2, a4                                #    7: 2d04
            ret                                                #    9: 0df0

            .literal_position                                  #    c: 00000000
                                                               #   10: 00000000

# Function @ .text+0x14
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
.Lfunc002:  addi         sp, sp, -16 /* (local0) */            #   14: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   17: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   19: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #   1b: d921
            mov          a12, a3 /* arg1 */                    #   1d: cd03
            mov          a13, a4 /* arg2 */                    #   1f: dd04
            beqz         a3, .Lbr001                           #   21: 9c03
            mov          a3, a4 /* arg2 */                     #   23: 3d04
            call0        sdk_wpabuf_put                        #   25: 01f9ffc0
                                                               #   29: 0000
            mov          a4, a13 /* arg2 */                    #   2b: 4d0d
            mov          a3, a12 /* arg1 */                    #   2d: 3d0c
            call0        memcpy                                #   2f: 01f8ffc0
                                                               #   33: 0000
.Lbr001:    l32i         a12, sp, 4 /* [(local1)] */           #   35: c811
            l32i         a13, sp, 8 /* [(local2)] */           #   37: d821
            l32i         a0, sp, 0 /* [(local0)] */            #   39: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   3b: 12c110
            ret                                                #   3e: 0df0

# Function @ .text+0x40
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc003:  mov          a6, a3 /* arg1 */                     #   40: 6d03
            addi         sp, sp, -16 /* (local0) */            #   42: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   45: 0901
            l32i         a4, a6, 4 /* [arg1+0x4] */            #   47: 4816
            l32i         a3, a3, 8 /* [arg1+0x8] */            #   49: 3823
            addi         a0, a6, 12 /* arg1+0xc */             #   4b: cb06
            moveqz       a3, a0, a3                            #   4d: 303083
            call0        .Lfunc002                             #   50: 05fcff
            l32i         a0, sp, 0 /* [(local0)] */            #   53: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   55: 12c110
            ret                                                #   58: 0df0

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000

# Function @ .irom0.text+0x8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
.Lfunc004:  movi         a2, .Lstr001                          #    8: 21feff
            addi         sp, sp, -16 /* (local0) */            #    b: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #    e: 0901
            call0        ets_printf                            #   10: 01fdffc0
                                                               #   14: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   16: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   18: 12c110
            ret                                                #   1b: 0df0

            .literal_position                                  #   20: 00000000
                                                               #   24: 00000000
                                                               #   28: 00000000
                                                               #   2c: 00000000

# Function @ .irom0.text+0x30
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .global      sdk_wpabuf_resize
            .type        sdk_wpabuf_resize, @function
sdk_wpabuf_resize:
            addi         sp, sp, -16 /* (local0) */            #   30: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   33: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #   35: d921
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #   37: e931
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   39: c911
            mov          a14, a2 /* arg0 */                    #   3b: ed02
            l32i         a12, a2, 0 /* [arg0] */               #   3d: c802
            mov          a13, a3 /* arg1 */                    #   3f: dd03
            bnez         a12, .Lbr002                          #   41: dc1c
            mov          a2, a3 /* arg1 */                     #   43: 2d03
            call0        sdk_wpabuf_alloc                      #   45: 050000
            mov          a3, a2                                #   48: 3d02
            s32i         a2, a14, 0 /* a2 -> [arg0] */         #   4a: 290e
            movi         a0, -1 /* 0xffffffff */               #   4c: 7cf0
            movi         a2, 0 /* 0x00000000 */                #   4e: 0c02
            moveqz       a2, a0, a3                            #   50: 302083
            j            .Lbr006                               #   53: 461100
.Lbr002:    l32i         a3, a12, 4 /* [[arg0]+0x4] */         #   56: 381c
            l32i         a4, a12, 0 /* [[arg0]] */             #   58: 480c
            add          a3, a3, a13                           #   5a: da33
            bgeu         a4, a3, .Lbr005                       #   5c: 37b43a
            l32i         a2, a12, 8 /* [[arg0]+0x8] */         #   5f: 282c
            beqz         a2, .Lbr007                           #   61: 164204
            call0        realloc                               #   64: 01efffc0
                                                               #   68: 0000
            mov          a14, a2                               #   6a: ed02
            beqz         a2, .Lbr008                           #   6c: 168204
            movi         a3, 0 /* 0x00000000 */                #   6f: 0c03
            l32i         a2, a12, 4 /* [[arg0]+0x4] */         #   71: 281c
            mov          a4, a13 /* arg1 */                    #   73: 4d0d
            add          a2, a2, a14                           #   75: ea22
            call0        memset                                #   77: 01ebffc0
                                                               #   7b: 0000
            s32i         a14, a12, 8 /* a14 -> [[arg0]+0x8] */ #   7d: e92c
            j            .Lbr004                               #   7f: 460400
.Lbr003:    movi         a3, 0 /* 0x00000000 */                #   82: 0c03
            l32i         a2, a2, 4                             #   84: 2812
            mov          a4, a13 /* arg1 */                    #   86: 4d0d
            add          a2, a2, a12                           #   88: ca22
            addi         a2, a2, 12                            #   8a: cb22
            call0        memset                                #   8c: 01e7ffc0
                                                               #   90: 0000
            s32i         a12, a14, 0 /* a12 -> [arg0] */       #   92: c90e
.Lbr004:    l32i         a3, a12, 4                            #   94: 381c
            add          a3, a3, a13                           #   96: da33
            s32i         a3, a12, 0                            #   98: 390c
.Lbr005:    movi         a2, 0 /* 0x00000000 */                #   9a: 0c02
.Lbr006:    l32i         a12, sp, 4 /* [(local1)] */           #   9c: c811
            l32i         a13, sp, 8 /* [(local2)] */           #   9e: d821
            l32i         a14, sp, 12 /* [(local3)] */          #   a0: e831
            l32i         a0, sp, 0 /* [(local0)] */            #   a2: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   a4: 12c110
            ret                                                #   a7: 0df0
.Lbr007:    mov          a2, a12 /* [arg0] */                  #   a9: 2d0c
            addi         a3, a3, 12                            #   ab: cb33
            call0        realloc                               #   ad: 01dfffc0
                                                               #   b1: 0000
            mov          a12, a2                               #   b3: cd02
            bnez         a2, .Lbr003                           #   b5: 5692fc
.Lbr008:    movi         a2, -1 /* 0xffffffff */               #   b8: 7cf2
            j            .Lbr006                               #   ba: 86f7ff

            .literal_position                                  #   c0: 00000000

# Function @ .irom0.text+0xc4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_wpabuf_alloc
            .type        sdk_wpabuf_alloc, @function
sdk_wpabuf_alloc:
            addi         sp, sp, -16 /* (local0) */            #   c4: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   c7: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   c9: 0901
            mov          a12, a2 /* arg0 */                    #   cb: cd02
            addi         a2, a2, 12 /* arg0+0xc */             #   cd: cb22
            call0        zalloc                                #   cf: 01fcffc0
                                                               #   d3: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   d5: 0801
            bnez         a2, .Lbr009                           #   d7: cc32
            movi         a2, 0 /* 0x00000000 */                #   d9: 0c02
            j            .Lbr010                               #   db: 460000
.Lbr009:    s32i         a12, a2, 0                            #   de: c902
.Lbr010:    l32i         a12, sp, 4 /* [(local1)] */           #   e0: c811
            addi         sp, sp, 16 /* (top of frame) */       #   e2: 12c110
            ret                                                #   e5: 0df0

            .literal_position                                  #   e8: 00000000

# Function @ .irom0.text+0xec
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .global      sdk_wpabuf_alloc_ext_data
            .type        sdk_wpabuf_alloc_ext_data, @function
sdk_wpabuf_alloc_ext_data:
            addi         sp, sp, -16 /* (local0) */            #   ec: 12c1f0
            s32i         a3, sp, 4 /* arg1 -> [(local1)] */    #   ef: 3911
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #   f1: 2901
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #   f3: 0921
            movi         a2, 12 /* 0x0000000c */               #   f5: 0cc2
            call0        zalloc                                #   f7: 01fcffc0
                                                               #   fb: 0000
            bnez         a2, .Lbr011                           #   fd: cc32
            movi         a2, 0 /* 0x00000000 */                #   ff: 0c02
            j            .Lbr012                               #  101: 460200
.Lbr011:    l32i         a0, sp, 0 /* [(local0)] */            #  104: 0801
            l32i         a3, sp, 4 /* [(local1)] */            #  106: 3811
            s32i         a3, a2, 0                             #  108: 3902
            s32i         a3, a2, 4                             #  10a: 3912
            s32i         a0, a2, 8                             #  10c: 0922
.Lbr012:    l32i         a0, sp, 8 /* [(local2)] */            #  10e: 0821
            addi         sp, sp, 16 /* (top of frame) */       #  110: 12c110
            ret                                                #  113: 0df0

            .literal_position                                  #  118: 14000000

# Function @ .irom0.text+0x11c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .global      sdk_wpabuf_alloc_copy
            .type        sdk_wpabuf_alloc_copy, @function
sdk_wpabuf_alloc_copy:
            mov          a9, a2 /* arg0 */                     #  11c: 9d02
            addi         sp, sp, -16 /* (local0) */            #  11e: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  121: c921
            mov          a2, a3 /* arg1 */                     #  123: 2d03
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  125: d931
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  127: 0911
            mov          a13, a3 /* arg1 */                    #  129: dd03
            s32i         a9, sp, 0 /* arg0 -> [(local0)] */    #  12b: 9901
            call0        sdk_wpabuf_alloc                      #  12d: 050000
            mov          a12, a2                               #  130: cd02
            beqz         a2, .Lbr013                           #  132: 8c82
            mov          a4, a13 /* arg1 */                    #  134: 4d0d
            l32i         a3, sp, 0 /* [(local0)] */            #  136: 3801
            call0        .Lfunc002                             #  138: 01f8ffc0
                                                               #  13c: 0000
.Lbr013:    l32i         a0, sp, 4 /* [(local1)] */            #  13e: 0811
            mov          a2, a12                               #  140: 2d0c
            l32i         a13, sp, 12 /* [(local3)] */          #  142: d831
            l32i         a12, sp, 8 /* [(local2)] */           #  144: c821
            addi         sp, sp, 16 /* (top of frame) */       #  146: 12c110
            ret                                                #  149: 0df0

            .literal_position                                  #  14c: 14000000

# Function @ .irom0.text+0x150
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .global      sdk_wpabuf_dup
            .type        sdk_wpabuf_dup, @function
sdk_wpabuf_dup:
            addi         sp, sp, -16 /* (local0) */            #  150: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  153: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  155: d921
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  157: 0901
            mov          a13, a2 /* arg0 */                    #  159: dd02
            l32i         a2, a2, 4 /* [arg0+0x4] */            #  15b: 2812
            call0        sdk_wpabuf_alloc                      #  15d: 050000
            mov          a12, a2                               #  160: cd02
            beqz         a2, .Lbr014                           #  162: 8cd2
            l32i         a4, a13, 4 /* [arg0+0x4] */           #  164: 481d
            l32i         a3, a13, 8 /* [arg0+0x8] */           #  166: 382d
            addi         a0, a13, 12 /* arg0+0xc */            #  168: cb0d
            moveqz       a3, a0, a3                            #  16a: 303083
            call0        .Lfunc002                             #  16d: 01f7ffc0
                                                               #  171: 0000
.Lbr014:    l32i         a0, sp, 0 /* [(local0)] */            #  173: 0801
            mov          a2, a12                               #  175: 2d0c
            l32i         a13, sp, 8 /* [(local2)] */           #  177: d821
            l32i         a12, sp, 4 /* [(local1)] */           #  179: c811
            addi         sp, sp, 16 /* (top of frame) */       #  17b: 12c110
            ret                                                #  17e: 0df0

            .literal_position                                  #  180: 00000000
                                                               #  184: 00000000

# Function @ .irom0.text+0x188
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .global      sdk_wpabuf_free
            .type        sdk_wpabuf_free, @function
sdk_wpabuf_free:
            addi         sp, sp, -16 /* (local0) */            #  188: 12c1f0
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  18b: c911
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  18d: 0901
            mov          a12, a2 /* arg0 */                    #  18f: cd02
            beqz         a2, .Lbr015                           #  191: 8ce2
            l32i         a2, a2, 8 /* [arg0+0x8] */            #  193: 2822
            call0        free                                  #  195: 01faffc0
                                                               #  199: 0000
            mov          a2, a12 /* arg0 */                    #  19b: 2d0c
            call0        free                                  #  19d: 01f9ffc0
                                                               #  1a1: 0000
.Lbr015:    l32i         a12, sp, 4 /* [(local1)] */           #  1a3: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  1a5: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  1a7: 12c110
            ret                                                #  1aa: 0df0

            .literal_position                                  #  1ac: 00000000

# Function @ .irom0.text+0x1b0
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .global      sdk_wpabuf_put
            .type        sdk_wpabuf_put, @function
sdk_wpabuf_put:
            addi         sp, sp, -32 /* (local0) */            #  1b0: 12c1e0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  1b3: 0901
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  1b5: d921
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  1b7: c911
            mov          a13, a3 /* arg1 */                    #  1b9: dd03
            mov          a12, a2 /* arg0 */                    #  1bb: cd02
            call0        .Lfunc001                             #  1bd: 01fbffc0
                                                               #  1c1: 0000
            s32i         a2, sp, 12 /* a2 -> [(local3)] */     #  1c3: 2931
            l32i         a3, a12, 0 /* [arg0] */               #  1c5: 380c
            l32i         a0, a12, 4 /* [arg0+0x4] */           #  1c7: 081c
            s32i         a0, sp, 16 /* [arg0+0x4] -> [(local4)] */ #  1c9: 0941
            add          a4, a0, a13                           #  1cb: da40
            s32i         a4, a12, 4 /* a4 -> [arg0+0x4] */     #  1cd: 491c
            bgeu         a3, a4, .Lbr016                       #  1cf: 47b30a
            mov          a3, a13 /* arg1 */                    #  1d2: 3d0d
            mov          a2, a12 /* arg0 */                    #  1d4: 2d0c
            call0        .Lfunc004                             #  1d6: 05e3ff
            l32i         a0, sp, 16 /* [(local4)] */           #  1d9: 0841
            l32i         a2, sp, 12 /* [(local3)] */           #  1db: 2831
.Lbr016:    l32i         a12, sp, 4 /* [(local1)] */           #  1dd: c811
            l32i         a13, sp, 8 /* [(local2)] */           #  1df: d821
            add          a2, a2, a0                            #  1e1: 0a22
            l32i         a0, sp, 0 /* [(local0)] */            #  1e3: 0801
            addi         sp, sp, 32 /* (top of frame) */       #  1e5: 12c120
            ret                                                #  1e8: 0df0

            .literal_position                                  #  1ec: 40000000
                                                               #  1f0: 40000000

# Function @ .irom0.text+0x1f4
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .global      sdk_wpabuf_concat
            .type        sdk_wpabuf_concat, @function
sdk_wpabuf_concat:
            addi         sp, sp, -16 /* (local0) */            #  1f4: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  1f7: 0901
            s32i         a14, sp, 12 /* a14 -> [(local3)] */   #  1f9: e931
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  1fb: c911
            s32i         a13, sp, 8 /* a13 -> [(local2)] */    #  1fd: d921
            mov          a12, a2 /* arg0 */                    #  1ff: cd02
            mov          a13, a3 /* arg1 */                    #  201: dd03
            bnez         a3, .Lbr017                           #  203: cc33
            mov          a14, a2 /* arg0 */                    #  205: ed02
            j            .Lbr022                               #  207: 460c00
.Lbr017:    bnez         a2, .Lbr018                           #  20a: cc32
            movi         a0, 0 /* 0x00000000 */                #  20c: 0c00
            j            .Lbr019                               #  20e: 460000
.Lbr018:    l32i         a0, a2, 4 /* [arg0+0x4] */            #  211: 0812
.Lbr019:    l32i         a2, a13, 4 /* [arg1+0x4] */           #  213: 281d
            add          a2, a2, a0                            #  215: 0a22
            call0        sdk_wpabuf_alloc                      #  217: 050000
            mov          a14, a2                               #  21a: ed02
            beqz         a2, .Lbr021                           #  21c: 9c22
            beqz         a12, .Lbr020                          #  21e: 8c6c
            mov          a3, a12 /* arg0 */                    #  220: 3d0c
            call0        .Lfunc003                             #  222: 01f2ffc0
                                                               #  226: 0000
.Lbr020:    mov          a2, a14                               #  228: 2d0e
            mov          a3, a13 /* arg1 */                    #  22a: 3d0d
            call0        .Lfunc003                             #  22c: 01f1ffc0
                                                               #  230: 0000
.Lbr021:    mov          a2, a12 /* arg0 */                    #  232: 2d0c
            call0        sdk_wpabuf_free                       #  234: 050000
            mov          a2, a13 /* arg1 */                    #  237: 2d0d
            call0        sdk_wpabuf_free                       #  239: 050000
.Lbr022:    l32i         a0, sp, 0 /* [(local0)] */            #  23c: 0801
            l32i         a12, sp, 4 /* [(local1)] */           #  23e: c811
            mov          a2, a14                               #  240: 2d0e
            l32i         a13, sp, 8 /* [(local2)] */           #  242: d821
            l32i         a14, sp, 12 /* [(local3)] */          #  244: e831
            addi         sp, sp, 16 /* (top of frame) */       #  246: 12c110
            ret                                                #  249: 0df0

            .literal_position                                  #  24c: 00000000
                                                               #  250: 40000000

# Function @ .irom0.text+0x254
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .global      sdk_wpabuf_zeropad
            .type        sdk_wpabuf_zeropad, @function
sdk_wpabuf_zeropad:
            addi         sp, sp, -32 /* (local0) */            #  254: 12c1e0
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  257: 0921
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  259: c931
            s32i         a13, sp, 16 /* a13 -> [(local4)] */   #  25b: d941
            mov          a12, a2 /* arg0 */                    #  25d: cd02
            mov          a13, a3 /* arg1 */                    #  25f: dd03
            bnez         a2, .Lbr023                           #  261: cc32
            movi         a12, 0 /* 0x00000000 */               #  263: 0c0c
            j            .Lbr025                               #  265: 060e00
.Lbr023:    l32i         a0, a2, 4 /* [arg0+0x4] */            #  268: 0812
            s32i         a0, sp, 0 /* [arg0+0x4] -> [(local0)] */ #  26a: 0901
            bgeu         a0, a3, .Lbr025                       #  26c: 37b031
            mov          a2, a3 /* arg1 */                     #  26f: 2d03
            call0        sdk_wpabuf_alloc                      #  271: 050000
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      #  274: 2911
            beqz         a2, .Lbr024                           #  276: 9ce2
            l32i         a2, sp, 0 /* [(local0)] */            #  278: 2801
            sub          a13, a13, a2                          #  27a: 20ddc0
            l32i         a2, sp, 4 /* [(local1)] */            #  27d: 2811
            mov          a3, a13                               #  27f: 3d0d
            call0        sdk_wpabuf_put                        #  281: 050000
            mov          a4, a13                               #  284: 4d0d
            movi         a3, 0 /* 0x00000000 */                #  286: 0c03
            call0        memset                                #  288: 01f1ffc0
                                                               #  28c: 0000
            l32i         a2, sp, 4 /* [(local1)] */            #  28e: 2811
            mov          a3, a12 /* arg0 */                    #  290: 3d0c
            call0        .Lfunc003                             #  292: 01efffc0
                                                               #  296: 0000
.Lbr024:    mov          a2, a12 /* arg0 */                    #  298: 2d0c
            l32i         a13, sp, 4 /* [(local1)] */           #  29a: d811
            call0        sdk_wpabuf_free                       #  29c: 050000
            mov          a12, a13 /* [(local1)] */             #  29f: cd0d
.Lbr025:    l32i         a0, sp, 8 /* [(local2)] */            #  2a1: 0821
            mov          a2, a12                               #  2a3: 2d0c
            l32i         a13, sp, 16 /* [(local4)] */          #  2a5: d841
            l32i         a12, sp, 12 /* [(local3)] */          #  2a7: c831
            addi         sp, sp, 32 /* (top of frame) */       #  2a9: 12c120
            ret                                                #  2ac: 0df0

            .literal_position                                  #  2b0: 00000000
                                                               #  2b4: 00000000

# Function @ .irom0.text+0x2b8
# Local variables/stack:
#     (local0):  word      @ -0x40
#     (local1):  word      @ -0x3c
#     (local2):  word      @ -0x38
#     (local3):  word      @ -0x34
#     (local4):  word      @ -0x30
#     (local5):  word[5]   @ -0x2c
#     (local6):  word      @ -0x18
#     (local7):  word      @ -0x14
#     (local8):  word      @ -0x10
#     (local9):  word[3]   @ -0xc
            .global      wpabuf_printf
            .type        wpabuf_printf, @function
wpabuf_printf:
            addi         sp, sp, -64 /* (local0) */            #  2b8: 12c1c0
            s32i         a4, sp, 40 /* arg2 -> [(local6)] */   #  2bb: 49a1
            s32i         a5, sp, 44 /* arg3 -> [(local7)] */   #  2bd: 59b1
            s32i         a6, sp, 48 /* arg4 -> [(local8)] */   #  2bf: 69c1
            s32i         a7, sp, 52 /* arg5 -> [(local9)] */   #  2c1: 79d1
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     #  2c3: 0931
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   #  2c5: c941
            s32i         a13, sp, 20 /* a13 -> [(local5)] */   #  2c7: d951
            mov          a12, a2 /* arg0 */                    #  2c9: cd02
            mov          a13, a3 /* arg1 */                    #  2cb: dd03
            call0        .Lfunc001                             #  2cd: 01f8ffc0
                                                               #  2d1: 0000
            mov          a4, a13 /* arg1 */                    #  2d3: 4d0d
            l32i         a3, a12, 0 /* [arg0] */               #  2d5: 380c
            l32i         a5, a12, 4 /* [arg0+0x4] */           #  2d7: 581c
            movi         a6, 8 /* 0x00000008 */                #  2d9: 0c86
            addi         a9, sp, 32 /* (FP)-0x20 */            #  2db: 92c120
            s32i         a9, sp, 4 /* (FP)-0x20 -> [(local1)] */ #  2de: 9911
            s32i         a9, sp, 0 /* (FP)-0x20 -> [(local0)] */ #  2e0: 9901
            s32i         a6, sp, 8 /* 0x00000008 -> [(local2)] */ #  2e2: 6921
            add          a2, a2, a5                            #  2e4: 5a22
            sub          a3, a3, a5                            #  2e6: 5033c0
            mov          a6, a9 /* (FP)-0x20 */                #  2e9: 6d09
            mov          a5, a9 /* (FP)-0x20 */                #  2eb: 5d09
            l32i         a7, sp, 8 /* [(local2)] */            #  2ed: 7821
            call0        ets_vsnprintf                         #  2ef: 01f1ffc0
                                                               #  2f3: 0000
            mov          a13, a2                               #  2f5: dd02
            bltz         a2, .Lbr026                           #  2f7: 969200
            l32i         a0, a12, 4 /* [arg0+0x4] */           #  2fa: 081c
            l32i         a7, a12, 0 /* [arg0] */               #  2fc: 780c
            sub          a7, a7, a0                            #  2fe: 0077c0
            bltu         a2, a7, .Lbr027                       #  301: 773208
.Lbr026:    mov          a2, a12 /* arg0 */                    #  304: 2d0c
            mov          a3, a13                               #  306: 3d0d
            call0        .Lfunc004                             #  308: c5cfff
            l32i         a0, a12, 4 /* [arg0+0x4] */           #  30b: 081c
.Lbr027:    add          a8, a13, a0                           #  30d: 0a8d
            s32i         a8, a12, 4 /* a8 -> [arg0+0x4] */     #  30f: 891c
            l32i         a13, sp, 20 /* [(local5)] */          #  311: d851
            l32i         a12, sp, 16 /* [(local4)] */          #  313: c841
            l32i         a0, sp, 12 /* [(local3)] */           #  315: 0831
            addi         sp, sp, 64 /* (top of frame) */       #  317: 12c140
            ret                                                #  31a: 0df0

            .section     .rodata.str1.4, "MSa", @progbits, 1

.Lstr001:   .asciz       "wpabuf overflow"                     #    0: 77706162
                                                               #    4: 7566206f
                                                               #    8: 76657266
                                                               #    c: 6c6f7700

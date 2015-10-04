
            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .literal_position
            .global      sdk_rc4_skip
            .type        sdk_rc4_skip, @function
sdk_rc4_skip:
            movi         a10, 0 /* 0x00000000 */               #    0: 0c0a
            movi         a9, 0 /* 0x00000000 */                #    2: 0c09
            movi         a7, 288 /* 0x00000120 */              #    4: 72a120
            sub          sp, sp, a7 /* (FP)-0x120 */           #    7: 7011c0
            s32i         a12, sp, 0x108 /* a12 -> [(local2)] */ #    a: c26142
            s32i         a14, sp, 0x110 /* a14 -> [(local4)] */ #    d: e26144
            s32i         a13, sp, 0x10c /* a13 -> [(local3)] */ #   10: d26143
            s32i         a5, sp, 0x100 /* arg3 -> [(local0)] */ #   13: 526140
            s32i         a0, sp, 0x104 /* a0 -> [(local1)] */  #   16: 026141
            mov          a0, sp /* (FP)-0x120 */               #   19: 0d01
.Lbr001:    s8i          a10, a0, 0                            #   1b: a24000
            addi         a0, a0, 1                             #   1e: 1b00
            addi         a10, a10, 1                           #   20: 1baa
            bnei         a10, 0x100, .Lbr001                   #   22: 66faf5
            movi         a5, 0 /* 0x00000000 */                #   25: 0c05
            mov          a13, sp /* (FP)-0x120 */              #   27: dd01
            addmi        a14, sp, 256 /* (local0) */           #   29: e2d101
            mov          a0, sp /* (FP)-0x120 */               #   2c: 0d01
            movi         a10, 0 /* 0x00000000 */               #   2e: 0c0a
            add          a12, a2, a10 /* arg0 */               #   30: aac2
.Lbr002:    l8ui         a11, a0, 0                            #   32: b20000
            l8ui         a12, a12, 0                           #   35: c20c00
            add          a9, a11, a9                           #   38: 9a9b
            add          a9, a12, a9                           #   3a: 9a9c
            addi         a12, a10, 1                           #   3c: 1bca
            extui        a9, a9, 0, 8                          #   3e: 909074
            mov          a10, a5 /* 0x00000000 */              #   41: ad05
            add          a7, a9, a13                           #   43: da79
            l8ui         a8, a7, 0                             #   45: 820700
            s8i          a8, a0, 0                             #   48: 824000
            s8i          a11, a7, 0                            #   4b: b24700
            addi         a0, a0, 1                             #   4e: 1b00
            bgeu         a12, a3, .Lbr003                      #   50: 37bc01
            mov          a10, a12                              #   53: ad0c
.Lbr003:    add          a12, a2, a10                          #   55: aac2
            bne          a0, a14, .Lbr002                      #   57: e790d7
            l32i         a5, sp, 0x100 /* [(local0)] */        #   5a: 522140
            beqz         a4, .Lbr005                           #   5d: ac64
            movi         a10, 0 /* 0x00000000 */               #   5f: 0c0a
            movi         a9, 0 /* 0x00000000 */                #   61: 0c09
            movi         a0, 0 /* 0x00000000 */                #   63: 0c00
.Lbr004:    addi         a10, a10, 1                           #   65: 1baa
            extui        a10, a10, 0, 8                        #   67: a0a074
            add          a2, a10, a13                          #   6a: da2a
            l8ui         a11, a2, 0                            #   6c: b20200
            addi         a0, a0, 1                             #   6f: 1b00
            add          a9, a11, a9                           #   71: 9a9b
            extui        a9, a9, 0, 8                          #   73: 909074
            add          a12, a9, a13                          #   76: dac9
            l8ui         a14, a12, 0                           #   78: e20c00
            s8i          a14, a2, 0                            #   7b: e24200
            s8i          a11, a12, 0                           #   7e: b24c00
            bne          a4, a0, .Lbr004                       #   81: 0794e0
            j            .Lbr006                               #   84: c60000
.Lbr005:    movi         a9, 0 /* 0x00000000 */                #   87: 0c09
            movi         a10, 0 /* 0x00000000 */               #   89: 0c0a
.Lbr006:    beqz         a6, .Lbr008                           #   8b: bc76
            movi         a0, 0 /* 0x00000000 */                #   8d: 0c00
.Lbr007:    addi         a10, a10, 1                           #   8f: 1baa
            extui        a10, a10, 0, 8                        #   91: a0a074
            add          a12, a10, a13                         #   94: daca
            l8ui         a14, a12, 0                           #   96: e20c00
            add          a9, a14, a9                           #   99: 9a9e
            extui        a9, a9, 0, 8                          #   9b: 909074
            add          a2, a9, a13                           #   9e: da29
            l8ui         a3, a2, 0                             #   a0: 320200
            s8i          a3, a12, 0                            #   a3: 324c00
            s8i          a14, a2, 0                            #   a6: e24200
            l8ui         a12, a12, 0                           #   a9: c20c00
            l8ui         a11, a5, 0                            #   ac: b20500
            add          a12, a12, a14                         #   af: eacc
            extui        a12, a12, 0, 8                        #   b1: c0c074
            add          a12, a13, a12                         #   b4: cacd
            l8ui         a12, a12, 0                           #   b6: c20c00
            addi         a0, a0, 1                             #   b9: 1b00
            xor          a11, a11, a12                         #   bb: c0bb30
            s8i          a11, a5, 0                            #   be: b24500
            addi         a5, a5, 1                             #   c1: 1b55
            bne          a6, a0, .Lbr007                       #   c3: 0796c8
.Lbr008:    movi         a2, 0 /* 0x00000000 */                #   c6: 0c02
            l32i         a12, sp, 0x108 /* [(local2)] */       #   c8: c22142
            l32i         a13, sp, 0x10c /* [(local3)] */       #   cb: d22143
            l32i         a14, sp, 0x110 /* [(local4)] */       #   ce: e22144
            movi         a3, 288 /* 0x00000120 */              #   d1: 32a120
            l32i         a0, sp, 0x104 /* [(local1)] */        #   d4: 022141
            add          sp, sp, a3 /* (top of frame) */       #   d7: 3a11
            ret           /* 0x00000000 */                     #   d9: 0df0


            .section     .text, "ax", @progbits

# Function @ .text+0x0
            .balign      4
            .literal_position
.Lfunc001:  bltui        a2, 5, .Lbr003                        #    0: b65213
            bltui        a2, 8, .Lbr001                        #    3: b68209
            movi         a4, 36 /* 0x00000024 */               #    6: 2c44
            bgeui        a2, 16, .Lbr002                       #    8: f6b207
            movi         a4, 20 /* 0x00000014 */               #    b: 1c44
            j            .Lbr002                               #    d: 860000
.Lbr001:    movi         a4, 96 /* 0x00000060 */               #   10: 42a060
.Lbr002:    mov          a2, a4                                #   13: 2d04
            ret                                                #   15: 0df0
.Lbr003:    movi         a2, 192 /* 0x000000c0 */              #   17: 22a0c0
            ret           /* 0x000000c0 */                     #   1a: 0df0

            .literal_position                                  #   1c: 00000000

# Function @ .text+0x20
            .balign      4
            .global      sdk_RC_GetAckRate
            .type        sdk_RC_GetAckRate, @function
sdk_RC_GetAckRate:
            movi         a3, .Ldata002                         #   20: 31ffff
            addx8        a2, a2, a3                            #   23: 3022b0
            l8ui         a2, a2, 5                             #   26: 220205
            ret                                                #   29: 0df0

            .literal_position                                  #   2c: 00000000

# Function @ .text+0x30
            .balign      4
            .global      sdk_RC_GetRtsRate
            .type        sdk_RC_GetRtsRate, @function
sdk_RC_GetRtsRate:
            movi         a3, .Ldata002                         #   30: 31ffff
            addx8        a2, a2, a3                            #   33: 3022b0
            l8ui         a2, a2, 4                             #   36: 220204
            ret                                                #   39: 0df0

            .literal_position                                  #   3c: 00000000
                                                               #   40: 00000000

# Function @ .text+0x44
            .balign      4
            .global      sdk_RC_GetAckTime
            .type        sdk_RC_GetAckTime, @function
sdk_RC_GetAckTime:
            movi         a3, .Ldata002                         #   44: 31feff
            addx8        a2, a2, a3                            #   47: 3022b0
            movi         a3, .Ldata001                         #   4a: 31fdff
            l8ui         a2, a2, 5                             #   4d: 220205
            addx2        a2, a2, a3                            #   50: 302290
            l16ui        a2, a2, 0                             #   53: 221200
            ret                                                #   56: 0df0

# Function @ .text+0x58
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .balign      4
            .global      sdk_RC_GetCtsTime
            .type        sdk_RC_GetCtsTime, @function
sdk_RC_GetCtsTime:
            addi         sp, sp, -32 /* (local0) */            #   58: 12c1e0
            s32i         a3, sp, 0 /* arg1 -> [(local0)] */    #   5b: 3901
            s32i         a4, sp, 4 /* arg2 -> [(local1)] */    #   5d: 4911
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #   5f: c931
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #   61: 0921
            mov          a12, a2 /* arg0 */                    #   63: cd02
            call0        .Lfunc001                             #   65: 85f9ff
            s32i         a2, sp, 16 /* a2 -> [(local4)] */     #   68: 2941
            l32i         a3, sp, 0 /* [(local0)] */            #   6a: 3801
            mov          a2, a12 /* arg0 */                    #   6c: 2d0c
            call0        .Lfunc002                             #   6e: 850600
            l32i         a0, sp, 16 /* [(local4)] */           #   71: 0841
            l32i         a3, sp, 4 /* [(local1)] */            #   73: 3811
            movi         a4, 10 /* 0x0000000a */               #   75: 0ca4
            add          a2, a3, a2                            #   77: 2a23
            bltui        a12, 8, .Lbr004                       #   79: b68c01
            movi         a4, 16 /* 0x00000010 */               #   7c: 1c04
.Lbr004:    l32i         a12, sp, 12 /* [(local3)] */          #   7e: c831
            add          a5, a0, a4                            #   80: 4a50
            add          a2, a2, a5                            #   82: 5a22
            l32i         a0, sp, 8 /* [(local2)] */            #   84: 0821
            addi         sp, sp, 32 /* (top of frame) */       #   86: 12c120
            extui        a2, a2, 0, 16                         #   89: 2020f4
            ret                                                #   8c: 0df0

            .literal_position                                  #   90: 00000000

# Function @ .text+0x94
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_RC_GetBlockAckTime
            .type        sdk_RC_GetBlockAckTime, @function
sdk_RC_GetBlockAckTime:
            addi         sp, sp, -16 /* (local0) */            #   94: 12c1f0
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #   97: c931
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #   99: 0921
            movi         a0, .Ldata002                         #   9b: 01fdff
            movi         a12, 10 /* 0x0000000a */              #   9e: 0cac
            addx8        a0, a2, a0                            #   a0: 0002b0
            l8ui         a2, a0, 5                             #   a3: 220005
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   a6: 0901
            bltui        a2, 8, .Lbr005                        #   a8: b68201
            movi         a12, 16 /* 0x00000010 */              #   ab: 1c0c
.Lbr005:    call0        .Lfunc001                             #   ad: 05f5ff
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      #   b0: 2911
            l32i         a2, sp, 0 /* [(local0)] */            #   b2: 2801
            movi         a3, 32 /* 0x00000020 */               #   b4: 2c03
            l8ui         a2, a2, 5 /* [[(local0)]+0x5] */      #   b6: 220205
            call0        .Lfunc002                             #   b9: c50100
            l32i         a3, sp, 4 /* [(local1)] */            #   bc: 3811
            l32i         a0, sp, 8 /* [(local2)] */            #   be: 0821
            add          a3, a12, a3                           #   c0: 3a3c
            l32i         a12, sp, 12 /* [(local3)] */          #   c2: c831
            add          a2, a2, a3                            #   c4: 3a22
            extui        a2, a2, 0, 16                         #   c6: 2020f4
            addi         sp, sp, 16 /* (top of frame) */       #   c9: 12c110
            ret                                                #   cc: 0df0

            .literal_position                                  #   d0: 00000000
                                                               #   d4: ffff0300

# Function @ .text+0xd8
            .balign      4
.Lfunc002:  slli         a4, a3, 3                             #   d8: d04311
            movi         a5, .Ldata002                         #   db: 51fdff
            extui        a3, a4, 0, 16                         #   de: 4030f4
            movi         a4, 0x0003ffff                        #   e1: 41fcff
            addx8        a5, a2, a5                            #   e4: 5052b0
            l32i         a5, a5, 0                             #   e7: 5805
            bltui        a2, 8, .Lbr006                        #   e9: b68205
            addi         a3, a3, 22                            #   ec: 32c316
            extui        a3, a3, 0, 16                         #   ef: 3030f4
.Lbr006:    mull         a3, a5, a3                            #   f2: 303582
            add          a3, a3, a4                            #   f5: 4a33
            extui        a3, a3, 18, 14                        #   f7: 3032d5
            bltui        a2, 8, .Lbr007                        #   fa: b68206
            movi         a4, -4 /* 0xfffffffc */               #   fd: 7cc4
            addi         a3, a3, 3                             #   ff: 3b33
            and          a3, a3, a4                            #  101: 403310
.Lbr007:    extui        a2, a3, 0, 16                         #  104: 3020f4
            ret                                                #  107: 0df0

            .section     .data, "aw", @progbits

.Ldata001:  .byte        0x3a, 0x01, 0x02, 0x01, 0xdf, 0x00, 0xd5, 0x00
            .byte        0x3a, 0x01, 0xa2, 0x00, 0x7f, 0x00, 0x75, 0x00
            .byte        0x2c, 0x00, 0x2c, 0x00, 0x30, 0x00, 0x3c, 0x00
            .byte        0x2c, 0x00, 0x2c, 0x00, 0x30, 0x00, 0x3c, 0x00
            .byte        0x3c, 0x00, 0x30, 0x00, 0x30, 0x00, 0x2c, 0x00
            .byte        0x2c, 0x00, 0x2c, 0x00, 0x2c, 0x00, 0x2c, 0x00
            .byte        0x3c, 0x00, 0x30, 0x00, 0x30, 0x00, 0x2c, 0x00
            .byte        0x2c, 0x00, 0x2c, 0x00, 0x2c, 0x00, 0x2c, 0x00

            .section     .bss, "aw", @nobits

.Ldata002:  .word        0x00000000                            #    0: 00000000
.Ldata003:  .byte        0x00
.Ldata004:  .byte        0x00
.Ldata005:  .byte        0x00
            .balign      4
.Ldata006:  .word        0x00000000                            #    8: 00000000
.Ldata007:  .byte        0x00
.Ldata008:  .byte        0x00
.Ldata009:  .byte        0x00
            .balign      4
.Ldata010:  .word        0x00000000                            #   10: 00000000
.Ldata011:  .byte        0x00
.Ldata012:  .byte        0x00
.Ldata013:  .byte        0x00
            .balign      4
.Ldata014:  .word        0x00000000                            #   18: 00000000
.Ldata015:  .byte        0x00
.Ldata016:  .byte        0x00
.Ldata017:  .byte        0x00
            .balign      4
.Ldata018:  .word        0x00000000                            #   20: 00000000
.Ldata019:  .byte        0x00
.Ldata020:  .byte        0x00
.Ldata021:  .byte        0x00
            .balign      4
.Ldata022:  .word        0x00000000                            #   28: 00000000
.Ldata023:  .byte        0x00
.Ldata024:  .byte        0x00
.Ldata025:  .byte        0x00
            .balign      4
.Ldata026:  .word        0x00000000                            #   30: 00000000
.Ldata027:  .byte        0x00
.Ldata028:  .byte        0x00
.Ldata029:  .byte        0x00
            .balign      4
.Ldata030:  .word        0x00000000                            #   38: 00000000
.Ldata031:  .byte        0x00
.Ldata032:  .byte        0x00
.Ldata033:  .byte        0x00
            .balign      4
.Ldata034:  .word        0x00000000                            #   40: 00000000
.Ldata035:  .byte        0x00
.Ldata036:  .byte        0x00
.Ldata037:  .byte        0x00
            .balign      4
.Ldata038:  .word        0x00000000                            #   48: 00000000
.Ldata039:  .byte        0x00
.Ldata040:  .byte        0x00
.Ldata041:  .byte        0x00
            .balign      4
.Ldata042:  .word        0x00000000                            #   50: 00000000
.Ldata043:  .byte        0x00
.Ldata044:  .byte        0x00
.Ldata045:  .byte        0x00
            .balign      4
.Ldata046:  .word        0x00000000                            #   58: 00000000
.Ldata047:  .byte        0x00
.Ldata048:  .byte        0x00
.Ldata049:  .byte        0x00
            .balign      4
.Ldata050:  .word        0x00000000                            #   60: 00000000
.Ldata051:  .byte        0x00
.Ldata052:  .byte        0x00
.Ldata053:  .byte        0x00
            .balign      4
.Ldata054:  .word        0x00000000                            #   68: 00000000
.Ldata055:  .byte        0x00
.Ldata056:  .byte        0x00
.Ldata057:  .byte        0x00
            .balign      4
.Ldata058:  .word        0x00000000                            #   70: 00000000
.Ldata059:  .byte        0x00
.Ldata060:  .byte        0x00
.Ldata061:  .byte        0x00
            .balign      4
.Ldata062:  .word        0x00000000                            #   78: 00000000
.Ldata063:  .byte        0x00
.Ldata064:  .byte        0x00
.Ldata065:  .byte        0x00
            .balign      4
.Ldata066:  .word        0x00000000                            #   80: 00000000
.Ldata067:  .byte        0x00
.Ldata068:  .byte        0x00
.Ldata069:  .byte        0x00
            .balign      4
.Ldata070:  .word        0x00000000                            #   88: 00000000
.Ldata071:  .byte        0x00
.Ldata072:  .byte        0x00
.Ldata073:  .byte        0x00
            .balign      4
.Ldata074:  .word        0x00000000                            #   90: 00000000
.Ldata075:  .byte        0x00
.Ldata076:  .byte        0x00
.Ldata077:  .byte        0x00
            .balign      4
.Ldata078:  .word        0x00000000                            #   98: 00000000
.Ldata079:  .byte        0x00
.Ldata080:  .byte        0x00
.Ldata081:  .byte        0x00
            .balign      4
.Ldata082:  .word        0x00000000                            #   a0: 00000000
.Ldata083:  .byte        0x00
.Ldata084:  .byte        0x00
.Ldata085:  .byte        0x00
            .balign      4
.Ldata086:  .word        0x00000000                            #   a8: 00000000
.Ldata087:  .byte        0x00
.Ldata088:  .byte        0x00
.Ldata089:  .byte        0x00
            .balign      4
.Ldata090:  .word        0x00000000                            #   b0: 00000000
.Ldata091:  .byte        0x00
.Ldata092:  .byte        0x00
.Ldata093:  .byte        0x00
            .balign      4
.Ldata094:  .word        0x00000000                            #   b8: 00000000
.Ldata095:  .byte        0x00
.Ldata096:  .byte        0x00
.Ldata097:  .byte        0x00
            .balign      4
.Ldata098:  .word        0x00000000                            #   c0: 00000000
.Ldata099:  .byte        0x00
.Ldata100:  .byte        0x00
.Ldata101:  .byte        0x00
            .balign      4
.Ldata102:  .word        0x00000000                            #   c8: 00000000
.Ldata103:  .byte        0x00
.Ldata104:  .byte        0x00
.Ldata105:  .byte        0x00
            .balign      4
.Ldata106:  .word        0x00000000                            #   d0: 00000000
.Ldata107:  .byte        0x00
.Ldata108:  .byte        0x00
.Ldata109:  .byte        0x00
            .balign      4
.Ldata110:  .word        0x00000000                            #   d8: 00000000
.Ldata111:  .byte        0x00
.Ldata112:  .byte        0x00
.Ldata113:  .byte        0x00
            .balign      4
.Ldata114:  .word        0x00000000                            #   e0: 00000000
.Ldata115:  .byte        0x00
.Ldata116:  .byte        0x00
.Ldata117:  .byte        0x00
            .balign      4
.Ldata118:  .word        0x00000000                            #   e8: 00000000
.Ldata119:  .byte        0x00
.Ldata120:  .byte        0x00
.Ldata121:  .byte        0x00
            .balign      4
.Ldata122:  .word        0x00000000                            #   f0: 00000000
.Ldata123:  .byte        0x00
.Ldata124:  .byte        0x00
.Ldata125:  .byte        0x00
            .balign      4
.Ldata126:  .word        0x00000000                            #   f8: 00000000
.Ldata127:  .byte        0x00
.Ldata128:  .byte        0x00
.Ldata129:  .byte        0x00

            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000400
                                                               #    8: 00000200
                                                               #    c: 2eba0000
                                                               #   10: 175d0000
                                                               #   14: c00f0000
                                                               #   18: aaaa0000
                                                               #   1c: c7710000
                                                               #   20: 55550000
                                                               #   24: e3380000
                                                               #   28: aa2a0000
                                                               #   2c: 711c0000
                                                               #   30: 55150000
                                                               #   34: f6120000
                                                               #   38: 899d0000
                                                               #   3c: c44e0000
                                                               #   40: 83340000
                                                               #   44: 62270000
                                                               #   48: 411a0000
                                                               #   4c: b1130000
                                                               #   50: 81110000
                                                               #   54: c88d0000
                                                               #   58: e4460000
                                                               #   5c: 422f0000
                                                               #   60: 72230000
                                                               #   64: a1170000
                                                               #   68: b9110000
                                                               #   6c: 2d0e0000

# Function @ .irom0.text+0x70
            .balign      4
.Lfunc003:  movi         a9, 0x0000ba2e                        #   70: 91e7ff
            movi         a4, 0x00040000                        #   73: 41e4ff
            movi         a11, 0x00020000                       #   76: b1e4ff
            movi         a7, 0x00005d17                        #   79: 71e5ff
            movi         a5, 7 /* 0x00000007 */                #   7c: 0c75
            movi         a6, 3 /* 0x00000003 */                #   7e: 0c36
            movi         a2, 0 /* 0x00000000 */                #   80: 0c02
            movi         a10, 1 /* 0x00000001 */               #   82: 0c1a
            movi         a3, .Ldata002                         #   84: 31dfff
            movi         a8, 2 /* 0x00000002 */                #   87: 0c28
            s8i          a8, a3, 54 /* 0x02 -> [.Ldata029] */  #   89: 824336
            s8i          a8, a3, 20 /* 0x02 -> [.Ldata011] */  #   8c: 824314
            s8i          a8, a3, 21 /* 0x02 -> [.Ldata012] */  #   8f: 824315
            s8i          a8, a3, 22 /* 0x02 -> [.Ldata013] */  #   92: 824316
            s8i          a10, a3, 46 /* 0x01 -> [.Ldata025] */ #   95: a2432e
            s8i          a10, a3, 12 /* 0x01 -> [.Ldata007] */ #   98: a2430c
            s8i          a10, a3, 13 /* 0x01 -> [.Ldata008] */ #   9b: a2430d
            s8i          a10, a3, 14 /* 0x01 -> [.Ldata009] */ #   9e: a2430e
            s8i          a2, a3, 4 /* 0x00 -> [.Ldata003] */   #   a1: 224304
            s8i          a2, a3, 5 /* 0x00 -> [.Ldata004] */   #   a4: 224305
            s8i          a2, a3, 6 /* 0x00 -> [.Ldata005] */   #   a7: 224306
            s8i          a2, a3, 38 /* 0x00 -> [.Ldata021] */  #   aa: 224326
            s8i          a6, a3, 62 /* 0x03 -> [.Ldata033] */  #   ad: 62433e
            s8i          a6, a3, 28 /* 0x03 -> [.Ldata015] */  #   b0: 62431c
            s8i          a6, a3, 29 /* 0x03 -> [.Ldata016] */  #   b3: 62431d
            s8i          a6, a3, 30 /* 0x03 -> [.Ldata017] */  #   b6: 62431e
            s8i          a5, a3, 60 /* 0x07 -> [.Ldata031] */  #   b9: 52433c
            s8i          a5, a3, 61 /* 0x07 -> [.Ldata032] */  #   bc: 52433d
            s8i          a5, a3, 70 /* 0x07 -> [.Ldata037] */  #   bf: 524346
            s8i          a5, a3, 102 /* 0x07 -> [.Ldata053] */ #   c2: 524366
            s32i         a7, a3, 56 /* 0x00005d17 -> [.Ldata030] */ #   c5: 79e3
            s32i         a7, a3, 24 /* 0x00005d17 -> [.Ldata014] */ #   c7: 7963
            s32i         a11, a3, 40 /* 0x00020000 -> [.Ldata022] */ #   c9: b9a3
            s32i         a11, a3, 8 /* 0x00020000 -> [.Ldata006] */ #   cb: b923
            s32i         a4, a3, 0 /* 0x00040000 -> [.Ldata002] */ #   cd: 4903
            s32i         a9, a3, 48 /* 0x0000ba2e -> [.Ldata026] */ #   cf: 99c3
            s32i         a9, a3, 16 /* 0x0000ba2e -> [.Ldata010] */ #   d1: 9943
            s32i         a4, a3, 32 /* 0x00040000 -> [.Ldata018] */ #   d3: 4983
            movi         a9, 0x00000fc0                        #   d5: 91cfff
            movi         a4, 11 /* 0x0000000b */               #   d8: 0cb4
            movi         a11, 10 /* 0x0000000a */              #   da: 0cab
            movi         a7, 6 /* 0x00000006 */                #   dc: 0c67
            s8i          a7, a3, 52 /* 0x06 -> [.Ldata027] */  #   de: 724334
            s8i          a7, a3, 53 /* 0x06 -> [.Ldata028] */  #   e1: 724335
            s8i          a7, a3, 78 /* 0x06 -> [.Ldata041] */  #   e4: 72434e
            s8i          a7, a3, 110 /* 0x06 -> [.Ldata057] */ #   e7: 72436e
            s8i          a7, a3, 158 /* 0x06 -> [.Ldata081] */ #   ea: 72439e
            s8i          a7, a3, 166 /* 0x06 -> [.Ldata085] */ #   ed: 7243a6
            s8i          a7, a3, 174 /* 0x06 -> [.Ldata089] */ #   f0: 7243ae
            s8i          a7, a3, 182 /* 0x06 -> [.Ldata093] */ #   f3: 7243b6
            s8i          a7, a3, 190 /* 0x06 -> [.Ldata097] */ #   f6: 7243be
            s8i          a7, a3, 222 /* 0x06 -> [.Ldata113] */ #   f9: 7243de
            s8i          a7, a3, 230 /* 0x06 -> [.Ldata117] */ #   fc: 7243e6
            s8i          a7, a3, 238 /* 0x06 -> [.Ldata121] */ #   ff: 7243ee
            s8i          a7, a3, 246 /* 0x06 -> [.Ldata125] */ #  102: 7243f6
            s8i          a7, a3, 254 /* 0x06 -> [.Ldata129] */ #  105: 7243fe
            s8i          a11, a3, 84 /* 0x0a -> [.Ldata043] */ #  108: b24354
            s8i          a11, a3, 85 /* 0x0a -> [.Ldata044] */ #  10b: b24355
            s8i          a11, a3, 116 /* 0x0a -> [.Ldata059] */ #  10e: b24374
            s8i          a11, a3, 117 /* 0x0a -> [.Ldata060] */ #  111: b24375
            s8i          a11, a3, 140 /* 0x0a -> [.Ldata071] */ #  114: b2438c
            s8i          a11, a3, 141 /* 0x0a -> [.Ldata072] */ #  117: b2438d
            s8i          a11, a3, 148 /* 0x0a -> [.Ldata075] */ #  11a: b24394
            s8i          a11, a3, 149 /* 0x0a -> [.Ldata076] */ #  11d: b24395
            s8i          a11, a3, 204 /* 0x0a -> [.Ldata103] */ #  120: b243cc
            s8i          a11, a3, 205 /* 0x0a -> [.Ldata104] */ #  123: b243cd
            s8i          a11, a3, 212 /* 0x0a -> [.Ldata107] */ #  126: b243d4
            s8i          a11, a3, 213 /* 0x0a -> [.Ldata108] */ #  129: b243d5
            s8i          a4, a3, 92 /* 0x0b -> [.Ldata047] */  #  12c: 42435c
            s8i          a4, a3, 93 /* 0x0b -> [.Ldata048] */  #  12f: 42435d
            s8i          a4, a3, 124 /* 0x0b -> [.Ldata063] */ #  132: 42437c
            s8i          a4, a3, 125 /* 0x0b -> [.Ldata064] */ #  135: 42437d
            s8i          a4, a3, 132 /* 0x0b -> [.Ldata067] */ #  138: 424384
            s8i          a4, a3, 133 /* 0x0b -> [.Ldata068] */ #  13b: 424385
            s8i          a4, a3, 196 /* 0x0b -> [.Ldata099] */ #  13e: 4243c4
            s8i          a4, a3, 197 /* 0x0b -> [.Ldata100] */ #  141: 4243c5
            s32i         a9, a3, 184 /* 0x00000fc0 -> [.Ldata094] */ #  144: 92632e
            s32i         a9, a3, 240 /* 0x00000fc0 -> [.Ldata122] */ #  147: 92633c
            movi         a5, 0x000071c7                        #  14a: 51b4ff
            movi         a6, 0x0000aaaa                        #  14d: 61b2ff
            movi         a2, 4 /* 0x00000004 */                #  150: 0c42
            movi         a10, 5 /* 0x00000005 */               #  152: 0c5a
            movi         a8, 9 /* 0x00000009 */                #  154: 0c98
            s8i          a8, a3, 76 /* 0x09 -> [.Ldata039] */  #  156: 82434c
            s8i          a8, a3, 77 /* 0x09 -> [.Ldata040] */  #  159: 82434d
            s8i          a8, a3, 108 /* 0x09 -> [.Ldata055] */ #  15c: 82436c
            s8i          a8, a3, 109 /* 0x09 -> [.Ldata056] */ #  15f: 82436d
            s8i          a8, a3, 68 /* 0x09 -> [.Ldata035] */  #  162: 824344
            s8i          a8, a3, 69 /* 0x09 -> [.Ldata036] */  #  165: 824345
            s8i          a8, a3, 100 /* 0x09 -> [.Ldata051] */ #  168: 824364
            s8i          a8, a3, 101 /* 0x09 -> [.Ldata052] */ #  16b: 824365
            s8i          a8, a3, 156 /* 0x09 -> [.Ldata079] */ #  16e: 82439c
            s8i          a8, a3, 157 /* 0x09 -> [.Ldata080] */ #  171: 82439d
            s8i          a8, a3, 164 /* 0x09 -> [.Ldata083] */ #  174: 8243a4
            s8i          a8, a3, 165 /* 0x09 -> [.Ldata084] */ #  177: 8243a5
            s8i          a8, a3, 172 /* 0x09 -> [.Ldata087] */ #  17a: 8243ac
            s8i          a8, a3, 173 /* 0x09 -> [.Ldata088] */ #  17d: 8243ad
            s8i          a8, a3, 180 /* 0x09 -> [.Ldata091] */ #  180: 8243b4
            s8i          a8, a3, 181 /* 0x09 -> [.Ldata092] */ #  183: 8243b5
            s8i          a8, a3, 188 /* 0x09 -> [.Ldata095] */ #  186: 8243bc
            s8i          a8, a3, 189 /* 0x09 -> [.Ldata096] */ #  189: 8243bd
            s8i          a8, a3, 220 /* 0x09 -> [.Ldata111] */ #  18c: 8243dc
            s8i          a8, a3, 221 /* 0x09 -> [.Ldata112] */ #  18f: 8243dd
            s8i          a8, a3, 228 /* 0x09 -> [.Ldata115] */ #  192: 8243e4
            s8i          a8, a3, 229 /* 0x09 -> [.Ldata116] */ #  195: 8243e5
            s8i          a8, a3, 236 /* 0x09 -> [.Ldata119] */ #  198: 8243ec
            s8i          a8, a3, 237 /* 0x09 -> [.Ldata120] */ #  19b: 8243ed
            s8i          a8, a3, 244 /* 0x09 -> [.Ldata123] */ #  19e: 8243f4
            s8i          a8, a3, 245 /* 0x09 -> [.Ldata124] */ #  1a1: 8243f5
            s8i          a8, a3, 252 /* 0x09 -> [.Ldata127] */ #  1a4: 8243fc
            s8i          a8, a3, 253 /* 0x09 -> [.Ldata128] */ #  1a7: 8243fd
            s8i          a10, a3, 44 /* 0x05 -> [.Ldata023] */ #  1aa: a2432c
            s8i          a10, a3, 45 /* 0x05 -> [.Ldata024] */ #  1ad: a2432d
            s8i          a10, a3, 86 /* 0x05 -> [.Ldata045] */ #  1b0: a24356
            s8i          a10, a3, 118 /* 0x05 -> [.Ldata061] */ #  1b3: a24376
            s8i          a10, a3, 142 /* 0x05 -> [.Ldata073] */ #  1b6: a2438e
            s8i          a10, a3, 150 /* 0x05 -> [.Ldata077] */ #  1b9: a24396
            s8i          a10, a3, 206 /* 0x05 -> [.Ldata105] */ #  1bc: a243ce
            s8i          a10, a3, 214 /* 0x05 -> [.Ldata109] */ #  1bf: a243d6
            s8i          a2, a3, 36 /* 0x04 -> [.Ldata019] */  #  1c2: 224324
            s8i          a2, a3, 37 /* 0x04 -> [.Ldata020] */  #  1c5: 224325
            s8i          a2, a3, 94 /* 0x04 -> [.Ldata049] */  #  1c8: 22435e
            s8i          a2, a3, 126 /* 0x04 -> [.Ldata065] */ #  1cb: 22437e
            s8i          a2, a3, 134 /* 0x04 -> [.Ldata069] */ #  1ce: 224386
            s8i          a2, a3, 198 /* 0x04 -> [.Ldata101] */ #  1d1: 2243c6
            s32i         a6, a3, 88 /* 0x0000aaaa -> [.Ldata046] */ #  1d4: 626316
            s32i         a5, a3, 120 /* 0x000071c7 -> [.Ldata062] */ #  1d7: 52631e
            movi         a9, 0x00001555                        #  1da: 9195ff
            s32i         a9, a3, 64 /* 0x00001555 -> [.Ldata034] */ #  1dd: 926310
            movi         a5, 0x00003483                        #  1e0: 5198ff
            movi         a6, 0x00004ec4                        #  1e3: 6196ff
            s32i         a6, a3, 136 /* 0x00004ec4 -> [.Ldata070] */ #  1e6: 626322
            s32i         a5, a3, 144 /* 0x00003483 -> [.Ldata074] */ #  1e9: 526324
            movi         a9, 0x00008dc8                        #  1ec: 919aff
            s32i         a9, a3, 192 /* 0x00008dc8 -> [.Ldata098] */ #  1ef: 926330
            movi         a5, 0x000017a1                        #  1f2: 519cff
            movi         a6, 0x00002372                        #  1f5: 619aff
            s32i         a6, a3, 216 /* 0x00002372 -> [.Ldata110] */ #  1f8: 626336
            s32i         a5, a3, 224 /* 0x000017a1 -> [.Ldata114] */ #  1fb: 526338
            movi         a2, 0x000038e3                        #  1fe: 2189ff
            movi         a4, 0x00005555                        #  201: 4187ff
            s32i         a4, a3, 80 /* 0x00005555 -> [.Ldata042] */ #  204: 426314
            s32i         a2, a3, 112 /* 0x000038e3 -> [.Ldata058] */ #  207: 22631c
            movi         a4, 0x00002762                        #  20a: 418eff
            movi         a2, 0x00001a41                        #  20d: 218eff
            movi         a10, 0x00001c71                       #  210: a187ff
            s32i         a10, a3, 104 /* 0x00001c71 -> [.Ldata054] */ #  213: a2631a
            s32i         a2, a3, 160 /* 0x00001a41 -> [.Ldata082] */ #  216: 226328
            s32i         a4, a3, 152 /* 0x00002762 -> [.Ldata078] */ #  219: 426326
            movi         a2, 0x00000e2d                        #  21c: 2194ff
            movi         a11, 0x00002aaa                       #  21f: b182ff
            movi         a4, 0x000011b9                        #  222: 4191ff
            movi         a10, 0x00001181                       #  225: a18aff
            s32i         a10, a3, 176 /* 0x00001181 -> [.Ldata090] */ #  228: a2632c
            s32i         a4, a3, 232 /* 0x000011b9 -> [.Ldata118] */ #  22b: 42633a
            s32i         a11, a3, 72 /* 0x00002aaa -> [.Ldata038] */ #  22e: b26312
            s32i         a2, a3, 248 /* 0x00000e2d -> [.Ldata126] */ #  231: 22633e
            movi         a11, 0x000013b1                       #  234: b186ff
            movi         a7, 0x00009d89                        #  237: 7180ff
            s32i         a7, a3, 128 /* 0x00009d89 -> [.Ldata066] */ #  23a: 726320
            s32i         a11, a3, 168 /* 0x000013b1 -> [.Ldata086] */ #  23d: b2632a
            movi         a7, 0x00002f42                        #  240: 7187ff
            s32i         a7, a3, 208 /* 0x00002f42 -> [.Ldata106] */ #  243: 726334
            movi         a8, 0x000012f6                        #  246: 817bff
            s32i         a8, a3, 96 /* 0x000012f6 -> [.Ldata050] */ #  249: 826318
            movi         a8, 0x000046e4                        #  24c: 8183ff
            s32i         a8, a3, 200 /* 0x000046e4 -> [.Ldata102] */ #  24f: 826332
            ret           /* 0x00000e2d */                     #  252: 0df0

            .literal_position                                  #  254: 00000000

# Function @ .irom0.text+0x258
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_RC_SetBasicRate
            .type        sdk_RC_SetBasicRate, @function
sdk_RC_SetBasicRate:
            addi         sp, sp, -16 /* (local0) */            #  258: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  25b: 0901
            movi         a0, 351 /* 0x0000015f */              #  25d: 02a15f
            bnall        a2, a0, .Lbr008                       #  260: 07c205
            call0        .Lfunc003                             #  263: c5e0ff
            j            .Lbr009                               #  266: c60b00
.Lbr008:    movi         a4, .Ldata002                         #  269: 41faff
            movi         a8, 5 /* 0x00000005 */                #  26c: 0c58
            movi         a5, 7 /* 0x00000007 */                #  26e: 0c75
            movi         a2, 3 /* 0x00000003 */                #  270: 0c32
            addi         a9, a3, -1 /* arg1-0x1 */             #  272: 0b93
            movi         a7, 1 /* 0x00000001 */                #  274: 0c17
            movi         a6, 0 /* 0x00000000 */                #  276: 0c06
            moveqz       a6, a7, a9                            #  278: 906783
            movnez       a2, a5, a6                            #  27b: 602593
            movnez       a7, a8, a6                            #  27e: 607893
            s8i          a7, a4, 92 /* a7 -> [.Ldata047] */    #  281: 72445c
            s8i          a7, a4, 124 /* a7 -> [.Ldata063] */   #  284: 72447c
            s8i          a7, a4, 84 /* a7 -> [.Ldata043] */    #  287: 724454
            s8i          a2, a4, 116 /* a2 -> [.Ldata059] */   #  28a: 224474
            s8i          a2, a4, 76 /* a2 -> [.Ldata039] */    #  28d: 22444c
            s8i          a2, a4, 108 /* a2 -> [.Ldata055] */   #  290: 22446c
            s8i          a2, a4, 68 /* a2 -> [.Ldata035] */    #  293: 224444
            s8i          a2, a4, 100 /* a2 -> [.Ldata051] */   #  296: 224464
.Lbr009:    movi         a2, 0 /* 0x00000000 */                #  299: 0c02
            l32i         a0, sp, 0 /* [(local0)] */            #  29b: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  29d: 12c110
            ret           /* 0x00000000 */                     #  2a0: 0df0


            .section     .irom0.text, "ax", @progbits

            .literal_position                                  #    0: 00000000
                                                               #    4: 00000000

# Function @ .irom0.text+0x8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
.Lfunc001:  addi         sp, sp, -16 /* (local0) */            #    8: 12c1f0
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #    b: c921
            l32i         a8, a2, 0x210 /* [arg0+0x210] */      #    d: 822284
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #   10: d931
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   12: 0911
            mov          a13, a7 /* arg5 */                    #   14: dd07
            addi         a0, a5, 4 /* arg3+0x4 */              #   16: 4b05
            movi         a7, 208 /* 0x000000d0 */              #   18: 72a0d0
            add          a7, a2, a7 /* arg0+0xd0 */            #   1b: 7a72
            l32i         a2, a8, 4 /* [[arg0+0x210]+0x4] */    #   1d: 2818
            s32i         a0, a6, 0 /* arg3+0x4 -> [arg4] */    #   1f: 0906
            addi         a0, a2, 14 /* [[arg0+0x210]+0x4]+0xe */ #   21: eb02
            bnez         a0, .Lbr001                           #   23: cc30
            movi         a2, 0 /* 0x00000000 */                #   25: 0c02
            j            .Lbr005                               #   27: 461100
.Lbr001:    addi         a12, a2, 18 /* [[arg0+0x210]+0x4]+0x12 */ #   2a: c2c212
            s32i         a0, sp, 0 /* [[arg0+0x210]+0x4]+0xe -> [(local0)] */ #   2d: 0901
            extui        a8, a5, 8, 8                          #   2f: 508874
            extui        a9, a5, 0, 8                          #   32: 509074
            l8ui         a10, a7, 128 /* [arg0+0x150] */       #   35: a20780
            s8i          a10, a2, 14 /* [arg0+0x150] -> [[[arg0+0x210]+0x4]+0xe] */ #   38: a2420e
            slli         a9, a9, 8                             #   3b: 809911
            s8i          a3, a2, 15 /* arg1 -> [[[arg0+0x210]+0x4]+0xf] */ #   3e: 32420f
            or           a8, a8, a9                            #   41: 908820
            s8i          a8, a2, 16 /* a8 -> [[[arg0+0x210]+0x4]+0x10] */ #   44: 824210
            srli         a8, a8, 8                             #   47: 808841
            s8i          a8, a2, 17 /* a8 -> [[[arg0+0x210]+0x4]+0x11] */ #   4a: 824211
            beqz         a4, .Lbr002                           #   4d: 8cd4
            mov          a3, a4 /* arg2 */                     #   4f: 3d04
            mov          a2, a12 /* [[arg0+0x210]+0x4]+0x12 */ #   51: 2d0c
            mov          a4, a5 /* arg3 */                     #   53: 4d05
            call0        memcpy                                #   55: 01eaffc0
                                                               #   59: 0000
            j            .Lbr003                               #   5b: c60200
.Lbr002:    mov          a4, a5 /* arg3 */                     #   5e: 4d05
            mov          a2, a12 /* [[arg0+0x210]+0x4]+0x12 */ #   60: 2d0c
            movi         a3, 0 /* 0x00000000 */                #   62: 0c03
            call0        memset                                #   64: 01e8ffc0
                                                               #   68: 0000
.Lbr003:    beqz         a13, .Lbr004                          #   6a: 8c0d
            s32i         a12, a13, 0 /* [[arg0+0x210]+0x4]+0x12 -> [arg5] */ #   6c: c90d
.Lbr004:    l32i         a2, sp, 0 /* [(local0)] */            #   6e: 2801
.Lbr005:    l32i         a12, sp, 8 /* [(local2)] */           #   70: c821
            l32i         a13, sp, 12 /* [(local3)] */          #   72: d831
            l32i         a0, sp, 4 /* [(local1)] */            #   74: 0811
            addi         sp, sp, 16 /* (top of frame) */       #   76: 12c110
            ret                                                #   79: 0df0

            .literal_position                                  #   7c: 00000000

# Function @ .irom0.text+0x80
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word      @ -0x10
#     (local5):  word      @ -0xc
#     (local6):  word[2]   @ -0x8
            .balign      4
            .global      wpa_sm_alloc_eapol
            .type        wpa_sm_alloc_eapol, @function
wpa_sm_alloc_eapol:
            addi         sp, sp, -32 /* (local0) */            #   80: 12c1e0
            s32i         a5, sp, 12 /* arg3 -> [(local3)] */   #   83: 5931
            s32i         a6, sp, 16 /* arg4 -> [(local4)] */   #   85: 6941
            s32i         a7, sp, 20 /* arg5 -> [(local5)] */   #   87: 7951
            s32i         a0, sp, 24 /* a0 -> [(local6)] */     #   89: 0961
            s32i         a4, sp, 8 /* arg2 -> [(local2)] */    #   8b: 4921
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #   8d: 2901
            s32i         a3, sp, 4 /* arg1 -> [(local1)] */    #   8f: 3911
            movi         a2, 3 /* 0x00000003 */                #   91: 0c32
            movi         a3, 256 /* 0x00000100 */              #   93: 32a100
            movi         a4, 0 /* 0x00000000 */                #   96: 0c04
            call0        pbuf_alloc                            #   98: 01f9ffc0
                                                               #   9c: 0000
            l32i         a3, sp, 4 /* [(local1)] */            #   9e: 3811
            l32i         a4, sp, 8 /* [(local2)] */            #   a0: 4821
            l32i         a5, sp, 12 /* [(local3)] */           #   a2: 5831
            mov          a0, a2                                #   a4: 0d02
            l32i         a6, sp, 16 /* [(local4)] */           #   a6: 6841
            l32i         a2, sp, 0 /* [(local0)] */            #   a8: 2801
            l32i         a7, sp, 20 /* [(local5)] */           #   aa: 7851
            s32i         a0, a2, 0x210 /* a0 -> [[(local0)]+0x210] */ #   ac: 026284
            call0        .Lfunc001                             #   af: 85f5ff
            l32i         a0, sp, 24 /* [(local6)] */           #   b2: 0861
            addi         sp, sp, 32 /* (top of frame) */       #   b4: 12c120
            ret                                                #   b7: 0df0

            .balign      4
# Function @ .irom0.text+0xbc
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      wpa_sm_deauthenticate
            .type        wpa_sm_deauthenticate, @function
wpa_sm_deauthenticate:
            addi         sp, sp, -16 /* (local0) */            #   bc: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   bf: 0901
            l32i         a0, a2, 0x168 /* [arg0+0x168] */      #   c1: 02225a
            bltui        a0, 5, .Lbr006                        #   c4: b65007
            l32i         a0, a2, 0x220 /* [arg0+0x220] */      #   c7: 022288
            mov          a2, a3 /* arg1 */                     #   ca: 2d03
            callx0       a0 /* [arg0+0x220] */                 #   cc: c00000
.Lbr006:    l32i         a0, sp, 0 /* [(local0)] */            #   cf: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   d1: 12c110
            ret                                                #   d4: 0df0

            .balign      4
# Function @ .irom0.text+0xd8
            .balign      4
            .global      wpa_sm_mlme_setprotection
            .type        wpa_sm_mlme_setprotection, @function
wpa_sm_mlme_setprotection:
            movi         a2, 0 /* 0x00000000 */                #   d8: 0c02
            ret           /* 0x00000000 */                     #   da: 0df0

# Function @ .irom0.text+0xdc
            .balign      4
            .global      wpa_sm_get_beacon_ie
            .type        wpa_sm_get_beacon_ie, @function
wpa_sm_get_beacon_ie:
            movi         a2, 0 /* 0x00000000 */                #   dc: 0c02
            ret           /* 0x00000000 */                     #   de: 0df0

# Function @ .irom0.text+0xe0
            .balign      4
            .global      wpa_sm_disassociate
            .type        wpa_sm_disassociate, @function
wpa_sm_disassociate:
            ret           /* arg0 */                           #   e0: 0df0

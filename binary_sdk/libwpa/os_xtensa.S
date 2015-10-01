
            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
            .global      sdk_os_get_time
            .type        sdk_os_get_time, @function
sdk_os_get_time:
            movi         a2, 0 /* 0x00000000 */                #    0: 0c02
            ret           /* 0x00000000 */                     #    2: 0df0

            .literal_position                                  #    4: 00000000

# Function @ .irom0.text+0x8
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .global      os_random
            .type        os_random, @function
os_random:  addi         sp, sp, -16 /* (local0) */            #    8: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #    b: 0901
            call0        rand                                  #    d: 01fdffc0
                                                               #   11: 0000
            l32i         a0, sp, 0 /* [(local0)] */            #   13: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   15: 12c110
            ret                                                #   18: 0df0

            .literal_position                                  #   1c: 00000000
                                                               #   20: 00000000

# Function @ .irom0.text+0x24
# Local variables/stack:
#     (local0):  word      @ -0x20
#     (local1):  word      @ -0x1c
#     (local2):  word      @ -0x18
#     (local3):  word      @ -0x14
#     (local4):  word[4]   @ -0x10
            .global      os_get_random
            .type        os_get_random, @function
os_get_random:
            addi         sp, sp, -32 /* (local0) */            #   24: 12c1e0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #   27: 0911
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #   29: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #   2b: c921
            s32i         a14, sp, 16 /* a14 -> [(local4)] */   #   2d: e941
            mov          a12, a2 /* arg0 */                    #   2f: cd02
            srli         a14, a3, 2                            #   31: 30e241
            blti         a14, 1, .Lbr002                       #   34: a61e1c
            movi         a13, 0 /* 0x00000000 */               #   37: 0c0d
.Lbr001:    call0        rand                                  #   39: 01f8ffc0
                                                               #   3d: 0000
            mov          a3, sp /* (local0) */                 #   3f: 3d01
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #   41: 2901
            movi         a4, 4 /* 0x00000004 */                #   43: 0c44
            mov          a2, a12                               #   45: 2d0c
            call0        memcpy                                #   47: 01f6ffc0
                                                               #   4b: 0000
            addi         a12, a12, 4                           #   4d: 4bcc
            addi         a13, a13, 1                           #   4f: 1bdd
            bne          a13, a14, .Lbr001                     #   51: e79de4
.Lbr002:    movi         a2, 0 /* 0x00000000 */                #   54: 0c02
            l32i         a12, sp, 8 /* [(local2)] */           #   56: c821
            l32i         a13, sp, 12 /* [(local3)] */          #   58: d831
            l32i         a14, sp, 16 /* [(local4)] */          #   5a: e841
            l32i         a0, sp, 4 /* [(local1)] */            #   5c: 0811
            addi         sp, sp, 32 /* (top of frame) */       #   5e: 12c120
            ret           /* 0x00000000 */                     #   61: 0df0

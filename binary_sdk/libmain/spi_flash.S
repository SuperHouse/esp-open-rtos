
            .section     .text, "ax", @progbits

            .literal_position                                  #    0: ff9f6ffe
                                                               #    4: 00020060
                                                               #    8: 00200000
                                                               #    c: 00000000
                                                               #   10: 00020060
                                                               #   14: 00200001
                                                               #   18: 00201000
                                                               #   1c: 00208000
                                                               #   20: 00600000
                                                               #   24: 00000000
                                                               #   28: 00000000

# Function @ .text+0x2c
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_SPIReadModeCnfig
            .type        sdk_SPIReadModeCnfig, @function
sdk_SPIReadModeCnfig:
            addi         sp, sp, -16 /* (local0) */            #   2c: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #   2f: 0901
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #   31: c911
            movi         a4, 0xfe6f9fff                        #   33: 41f3ff
            movi         a3, 0x60000200                        #   36: 31f3ff
            memw                                               #   39: c02000
            l32i         a0, a3, 8 /* [0x60000208] */          #   3c: 0823
            and          a0, a0, a4                            #   3e: 400010
            memw                                               #   41: c02000
            s32i         a0, a3, 8 /* a0 -> [0x60000208] */    #   44: 0923
            movi         a0, sdk_flashchip                     #   46: 01f1ff
            beqz         a2, .Lbr004                           #   49: 166204
            beqi         a2, 1, .Lbr005                        #   4c: 261249
            beqi         a2, 2, .Lbr006                        #   4f: 26224c
            beqi         a2, 3, .Lbr007                        #   52: 26324f
            addi         a6, a2, -4 /* arg0-0x4 */             #   55: 62c2fc
            movi         a5, 0x00002000                        #   58: 51ecff
            movi         a12, 0 /* 0x00000000 */               #   5b: 0c0c
            moveqz       a12, a5, a6                           #   5d: 60c583
.Lbr001:    beqz         a2, .Lbr003                           #   60: ac42
            beqi         a2, 1, .Lbr003                        #   62: 261222
            mov          a2, a0 /* sdk_flashchip */            #   65: 2d00
            call0        Disable_QMode                         #   67: 01efffc0
                                                               #   6b: 0000
.Lbr002:    memw                                               #   6d: c02000
            movi         a8, 0x60000200                        #   70: 81e8ff
            l32i         a7, a8, 8 /* [0x60000208] */          #   73: 7828
            or           a7, a7, a12                           #   75: c07720
            memw                                               #   78: c02000
            s32i         a7, a8, 8 /* a7 -> [0x60000208] */    #   7b: 7928
            movi         a2, 0 /* 0x00000000 */                #   7d: 0c02
            l32i         a12, sp, 4 /* [(local1)] */           #   7f: c811
            l32i         a0, sp, 0 /* [(local0)] */            #   81: 0801
            addi         sp, sp, 16 /* (top of frame) */       #   83: 12c110
            ret           /* 0x00000000 */                     #   86: 0df0
.Lbr003:    mov          a2, a0 /* sdk_flashchip */            #   88: 2d00
            call0        Enable_QMode                          #   8a: 01e7ffc0
                                                               #   8e: 0000
            j            .Lbr002                               #   90: 46f6ff
.Lbr004:    movi         a12, 0x01002000                       #   93: c1e0ff
            j            .Lbr001                               #   96: 86f1ff
.Lbr005:    movi         a12, 0x00102000                       #   99: c1dfff
            j            .Lbr001                               #   9c: 06f0ff
.Lbr006:    movi         a12, 0x00802000                       #   9f: c1dfff
            j            .Lbr001                               #   a2: 86eeff
.Lbr007:    movi         a12, 0x00006000                       #   a5: c1deff
            j            .Lbr001                               #   a8: 06edff

            .literal_position                                  #   ac: 00000000
                                                               #   b0: 00000000
                                                               #   b4: 00000000
                                                               #   b8: 00000000
                                                               #   bc: 00000000
                                                               #   c0: 00000000
                                                               #   c4: 00000000
                                                               #   c8: 00000000
                                                               #   cc: 00000000
                                                               #   d0: 00000000
                                                               #   d4: 00000000

# Function @ .text+0xd8
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
            .global      sdk_SPIWrite
            .type        sdk_SPIWrite, @function
sdk_SPIWrite:
            mov          a5, a4 /* arg2 */                     #   d8: 5d04
            addi         sp, sp, -48 /* (local0) */            #   da: 12c1d0
            s32i         a12, sp, 16 /* a12 -> [(local4)] */   #   dd: c941
            s32i         a14, sp, 24 /* a14 -> [(local6)] */   #   df: e961
            s32i         a3, sp, 36 /* arg1 -> [(local9)] */   #   e1: 3991
            s32i         a0, sp, 12 /* a0 -> [(local3)] */     #   e3: 0931
            movi         a4, sdk_flashchip                     #   e5: 41f1ff
            s32i         a15, sp, 28 /* a15 -> [(local7)] */   #   e8: f971
            s32i         a13, sp, 20 /* a13 -> [(local5)] */   #   ea: d951
            mov          a15, a3 /* arg1 */                    #   ec: fd03
            mov          a13, a2 /* arg0 */                    #   ee: dd02
            l32i         a0, a4, 4 /* [.Ldata001] */           #   f0: 0814
            add          a2, a5, a2                            #   f2: 2a25
            bltu         a0, a2, .Lbr008                       #   f4: 273002
            j            .Lbr014                               #   f7: 462000
.Lbr008:    movi         a2, 1 /* 0x00000001 */                #   fa: 0c12
            j            .Lbr013                               #   fc: 461b00
.Lbr009:    movi         a2, sdk_flashchip                     #   ff: 21ecff
            mov          a3, a13 /* arg0 */                    #  102: 3d0d
            mov          a4, a15 /* arg1 */                    #  104: 4d0f
            mov          a5, a12                               #  106: 5d0c
            call0        SPI_page_program                      #  108: 01eeffc0
                                                               #  10c: 0000
            bnez         a2, .Lbr008                           #  10e: 5682fe
            l32i         a2, sp, 8 /* [(local2)] */            #  111: 2821
            mov          a3, a14 /* [.Ldata003] */             #  113: 3d0e
            sub          a2, a2, a12                           #  115: c022c0
            s32i         a2, sp, 0 /* a2 -> [(local0)] */      #  118: 2901
            call0        __udivsi3                             #  11a: 01eaffc0
                                                               #  11e: 0000
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      #  120: 2911
            beqz         a2, .Lbr011                           #  122: acf2
            movi         a3, 0 /* 0x00000000 */                #  124: 0c03
            s32i         a3, sp, 32 /* 0x00000000 -> [(local8)] */ #  126: 3981
.Lbr010:    movi         a2, sdk_flashchip                     #  128: 21e3ff
            add          a3, a13, a12                          #  12b: ca3d
            mov          a5, a14 /* [.Ldata003] */             #  12d: 5d0e
            srli         a4, a12, 2                            #  12f: c04241
            addx4        a4, a4, a15                           #  132: f044a0
            call0        SPI_page_program                      #  135: 01e4ffc0
                                                               #  139: 0000
            bnez         a2, .Lbr008                           #  13b: 56b2fb
            add          a12, a14, a12                         #  13e: cace
            l32i         a6, sp, 32 /* [(local8)] */           #  140: 6881
            l32i         a5, sp, 4 /* [(local1)] */            #  142: 5811
            addi         a7, a6, 1 /* [(local8)]+0x1 */        #  144: 1b76
            extui        a6, a7, 0, 8                          #  146: 706074
            s32i         a6, sp, 32 /* a6 -> [(local8)] */     #  149: 6981
            bne          a5, a6, .Lbr010                       #  14b: 6795d9
            l32i         a8, sp, 8 /* [(local2)] */            #  14e: 8821
            sub          a8, a8, a12                           #  150: c088c0
            s32i         a8, sp, 0 /* a8 -> [(local0)] */      #  153: 8901
.Lbr011:    add          a3, a13, a12                          #  155: ca3d
            movi         a2, sdk_flashchip                     #  157: 21d8ff
            l32i         a5, sp, 0 /* [(local0)] */            #  15a: 5801
            srli         a4, a12, 2                            #  15c: c04241
            addx4        a4, a4, a15                           #  15f: f044a0
            call0        SPI_page_program                      #  162: 01daffc0
                                                               #  166: 0000
            bnez         a2, .Lbr008                           #  168: 56e2f8
.Lbr012:    movi         a2, 0 /* 0x00000000 */                #  16b: 0c02
.Lbr013:    l32i         a12, sp, 16 /* [(local4)] */          #  16d: c841
            l32i         a13, sp, 20 /* [(local5)] */          #  16f: d851
            l32i         a14, sp, 24 /* [(local6)] */          #  171: e861
            l32i         a15, sp, 28 /* [(local7)] */          #  173: f871
            l32i         a0, sp, 12 /* [(local3)] */           #  175: 0831
            addi         sp, sp, 48 /* (top of frame) */       #  177: 12c130
            ret                                                #  17a: 0df0
.Lbr014:    mov          a2, a13 /* arg0 */                    #  17c: 2d0d
            l32i         a14, a4, 16 /* [.Ldata003] */         #  17e: e844
            s32i         a5, sp, 8 /* arg2 -> [(local2)] */    #  180: 5921
            mov          a3, a14 /* [.Ldata003] */             #  182: 3d0e
            call0        __umodsi3                             #  184: 01d3ffc0
                                                               #  188: 0000
            l32i         a5, sp, 8 /* [(local2)] */            #  18a: 5821
            sub          a12, a14, a2                          #  18c: 20cec0
            bltu         a5, a12, .Lbr015                      #  18f: c73502
            j            .Lbr009                               #  192: 46daff
.Lbr015:    mov          a4, a15 /* arg1 */                    #  195: 4d0f
            mov          a3, a13 /* arg0 */                    #  197: 3d0d
            movi         a2, sdk_flashchip                     #  199: 21c8ff
            call0        SPI_page_program                      #  19c: 01ceffc0
                                                               #  1a0: 0000
            bnez         a2, .Lbr008                           #  1a2: 5642f5
            j            .Lbr012                               #  1a5: 86f0ff

            .literal_position                                  #  1a8: 00000000
                                                               #  1ac: 00000000

# Function @ .text+0x1b0
# Local variables/stack:
#     (local0):  word[4]   @ -0x10
            .balign      4
            .global      sdk_SPIRead
            .type        sdk_SPIRead, @function
sdk_SPIRead:
            mov          a5, a4 /* arg2 */                     #  1b0: 5d04
            mov          a7, a3 /* arg1 */                     #  1b2: 7d03
            addi         sp, sp, -16 /* (local0) */            #  1b4: 12c1f0
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  1b7: 0901
            mov          a3, a2 /* arg0 */                     #  1b9: 3d02
            mov          a4, a7 /* arg1 */                     #  1bb: 4d07
            movi         a2, sdk_flashchip                     #  1bd: 21faff
            call0        SPI_read_data                         #  1c0: 01fbffc0
                                                               #  1c4: 0000
            movi         a4, 0 /* 0x00000000 */                #  1c6: 0c04
            l32i         a3, sp, 0 /* [(local0)] */            #  1c8: 3801
            movi         a0, 1 /* 0x00000001 */                #  1ca: 0c10
            addi         sp, sp, 16 /* (top of frame) */       #  1cc: 12c110
            moveqz       a0, a4, a2                            #  1cf: 200483
            mov          a2, a0                                #  1d2: 2d00
            mov          a0, a3 /* [(local0)] */               #  1d4: 0d03
            ret                                                #  1d6: 0df0

            .literal_position                                  #  1d8: 00000000
                                                               #  1dc: 00000000
                                                               #  1e0: 00000000
                                                               #  1e4: 00000000
                                                               #  1e8: 00000000
                                                               #  1ec: 00000000

# Function @ .text+0x1f0
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_SPIEraseSector
            .type        sdk_SPIEraseSector, @function
sdk_SPIEraseSector:
            addi         sp, sp, -16 /* (local0) */            #  1f0: 12c1f0
            movi         a3, sdk_flashchip                     #  1f3: 31f9ff
            s32i         a12, sp, 4 /* a12 -> [(local1)] */    #  1f6: c911
            mov          a12, a2 /* arg0 */                    #  1f8: cd02
            s32i         a0, sp, 0 /* a0 -> [(local0)] */      #  1fa: 0901
            l32i         a2, a3, 4 /* [.Ldata001] */           #  1fc: 2813
            l32i         a3, a3, 12 /* [.Ldata002] */          #  1fe: 3833
            call0        __udivsi3                             #  200: 01f9ffc0
                                                               #  204: 0000
            bgeu         a12, a2, .Lbr016                      #  206: 27bc1f
            movi         a2, sdk_flashchip                     #  209: 21f4ff
            call0        SPI_write_enable                      #  20c: 01f7ffc0
                                                               #  210: 0000
            bnez         a2, .Lbr016                           #  212: dc32
            movi         a2, sdk_flashchip                     #  214: 21f3ff
            l32i         a3, a2, 12 /* [.Ldata002] */          #  217: 3832
            mull         a3, a3, a12                           #  219: c03382
            call0        SPI_sector_erase                      #  21c: 01f4ffc0
                                                               #  220: 0000
            bnez         a2, .Lbr016                           #  222: cc32
            movi         a2, 0 /* 0x00000000 */                #  224: 0c02
            j            .Lbr017                               #  226: 460000
.Lbr016:    movi         a2, 1 /* 0x00000001 */                #  229: 0c12
.Lbr017:    l32i         a12, sp, 4 /* [(local1)] */           #  22b: c811
            l32i         a0, sp, 0 /* [(local0)] */            #  22d: 0801
            addi         sp, sp, 16 /* (top of frame) */       #  22f: 12c110
            ret                                                #  232: 0df0

            .literal_position                                  #  234: 00000000
                                                               #  238: 00020060
                                                               #  23c: 00000010
                                                               #  240: ffffff00
                                                               #  244: 00000000
                                                               #  248: 00000000
                                                               #  24c: 00000000
                                                               #  250: 00000000
                                                               #  254: 00000000

# Function @ .text+0x258
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word[3]   @ -0xc
            .balign      4
            .global      sdk_spi_flash_get_id
            .type        sdk_spi_flash_get_id, @function
sdk_spi_flash_get_id:
            addi         sp, sp, -16 /* (local0) */            #  258: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  25b: 0911
            call0        vPortEnterCritical                    #  25d: 01f9ffc0
                                                               #  261: 0000
            call0        Cache_Read_Disable                    #  263: 01f9ffc0
                                                               #  267: 0000
            movi         a2, sdk_flashchip                     #  269: 21f2ff
            call0        Wait_SPI_Idle                         #  26c: 01f8ffc0
                                                               #  270: 0000
            movi         a4, 0 /* 0x00000000 */                #  272: 0c04
            movi         a0, 0x60000200                        #  274: 01f1ff
            memw                                               #  277: c02000
            s32i         a4, a0, 64 /* 0x00000000 -> [0x60000240] */ #  27a: 426010
            movi         a3, 0x10000000                        #  27d: 31efff
            memw                                               #  280: c02000
            s32i         a3, a0, 0 /* 0x10000000 -> [0x60000200] */ #  283: 3900
            memw                                               #  285: c02000
            l32i         a2, a0, 0 /* [0x60000200] */          #  288: 2800
            beqz         a2, .Lbr019                           #  28a: 8c62
.Lbr018:    memw                                               #  28c: c02000
            l32i         a5, a0, 0 /* [0x60000200] */          #  28f: 5800
            bnez         a5, .Lbr018                           #  291: 5675ff
.Lbr019:    movi         a7, 0x00ffffff                        #  294: 71ebff
            memw                                               #  297: c02000
            movi         a2, 0 /* 0x00000000 */                #  29a: 0c02
            movi         a3, 0 /* 0x00000000 */                #  29c: 0c03
            l32i         a6, a0, 64 /* [0x60000240] */         #  29e: 622010
            movi         a4, 1 /* 0x00000001 */                #  2a1: 0c14
            and          a6, a6, a7                            #  2a3: 706610
            s32i         a6, sp, 0 /* a6 -> [(local0)] */      #  2a6: 6901
            call0        Cache_Read_Enable                     #  2a8: 01eaffc0
                                                               #  2ac: 0000
            call0        vPortExitCritical                     #  2ae: 01e9ffc0
                                                               #  2b2: 0000
            l32i         a8, sp, 4 /* [(local1)] */            #  2b4: 8811
            l32i         a2, sp, 0 /* [(local0)] */            #  2b6: 2801
            mov          a0, a8 /* [(local1)] */               #  2b8: 0d08
            addi         sp, sp, 16 /* (top of frame) */       #  2ba: 12c110
            ret           /* [(local0)] */                     #  2bd: 0df0

            .literal_position                                  #  2c0: 00000000
                                                               #  2c4: 00000000
                                                               #  2c8: 00000000
                                                               #  2cc: 00000000
                                                               #  2d0: 00000000
                                                               #  2d4: 00000000

# Function @ .text+0x2d8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_spi_flash_read_status
            .type        sdk_spi_flash_read_status, @function
sdk_spi_flash_read_status:
            addi         sp, sp, -16 /* (local0) */            #  2d8: 12c1f0
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  2db: 2901
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  2dd: 0921
            call0        vPortEnterCritical                    #  2df: 01f9ffc0
                                                               #  2e3: 0000
            call0        Cache_Read_Disable                    #  2e5: 01f8ffc0
                                                               #  2e9: 0000
            movi         a2, sdk_flashchip                     #  2eb: 21f5ff
            l32i         a3, sp, 0 /* [(local0)] */            #  2ee: 3801
            call0        SPI_read_status                       #  2f0: 01f7ffc0
                                                               #  2f4: 0000
            movi         a3, 0 /* 0x00000000 */                #  2f6: 0c03
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      #  2f8: 2911
            movi         a4, 1 /* 0x00000001 */                #  2fa: 0c14
            movi         a2, 0 /* 0x00000000 */                #  2fc: 0c02
            call0        Cache_Read_Enable                     #  2fe: 01f4ffc0
                                                               #  302: 0000
            call0        vPortExitCritical                     #  304: 01f4ffc0
                                                               #  308: 0000
            l32i         a3, sp, 8 /* [(local2)] */            #  30a: 3821
            l32i         a2, sp, 4 /* [(local1)] */            #  30c: 2811
            mov          a0, a3 /* [(local2)] */               #  30e: 0d03
            addi         sp, sp, 16 /* (top of frame) */       #  310: 12c110
            ret           /* [(local1)] */                     #  313: 0df0

            .literal_position                                  #  318: 00000000
                                                               #  31c: 00000000
                                                               #  320: 00000000
                                                               #  324: 00000000
                                                               #  328: 00000000
                                                               #  32c: 00000000

# Function @ .text+0x330
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_spi_flash_write_status
            .type        sdk_spi_flash_write_status, @function
sdk_spi_flash_write_status:
            addi         sp, sp, -16 /* (local0) */            #  330: 12c1f0
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  333: 2901
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  335: 0921
            call0        vPortEnterCritical                    #  337: 01f9ffc0
                                                               #  33b: 0000
            call0        Cache_Read_Disable                    #  33d: 01f8ffc0
                                                               #  341: 0000
            movi         a2, sdk_flashchip                     #  343: 21f5ff
            l32i         a3, sp, 0 /* [(local0)] */            #  346: 3801
            call0        SPI_write_status                      #  348: 01f7ffc0
                                                               #  34c: 0000
            movi         a3, 0 /* 0x00000000 */                #  34e: 0c03
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      #  350: 2911
            movi         a4, 1 /* 0x00000001 */                #  352: 0c14
            movi         a2, 0 /* 0x00000000 */                #  354: 0c02
            call0        Cache_Read_Enable                     #  356: 01f4ffc0
                                                               #  35a: 0000
            call0        vPortExitCritical                     #  35c: 01f4ffc0
                                                               #  360: 0000
            l32i         a3, sp, 8 /* [(local2)] */            #  362: 3821
            l32i         a2, sp, 4 /* [(local1)] */            #  364: 2811
            mov          a0, a3 /* [(local2)] */               #  366: 0d03
            addi         sp, sp, 16 /* (top of frame) */       #  368: 12c110
            ret           /* [(local1)] */                     #  36b: 0df0

            .literal_position                                  #  370: 00000000
                                                               #  374: 00000000
                                                               #  378: 00000000
                                                               #  37c: 00000000

# Function @ .text+0x380
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word[2]   @ -0x8
            .balign      4
            .global      sdk_spi_flash_erase_sector
            .type        sdk_spi_flash_erase_sector, @function
sdk_spi_flash_erase_sector:
            addi         sp, sp, -16 /* (local0) */            #  380: 12c1f0
            s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  383: 2901
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  385: 0921
            call0        vPortEnterCritical                    #  387: 01faffc0
                                                               #  38b: 0000
            call0        Cache_Read_Disable                    #  38d: 01f9ffc0
                                                               #  391: 0000
            l32i         a2, sp, 0 /* [(local0)] */            #  393: 2801
            call0        sdk_SPIEraseSector                    #  395: 050000
            movi         a3, 0 /* 0x00000000 */                #  398: 0c03
            s32i         a2, sp, 4 /* a2 -> [(local1)] */      #  39a: 2911
            movi         a4, 1 /* 0x00000001 */                #  39c: 0c14
            movi         a2, 0 /* 0x00000000 */                #  39e: 0c02
            call0        Cache_Read_Enable                     #  3a0: 01f6ffc0
                                                               #  3a4: 0000
            call0        vPortExitCritical                     #  3a6: 01f5ffc0
                                                               #  3aa: 0000
            l32i         a3, sp, 8 /* [(local2)] */            #  3ac: 3821
            l32i         a2, sp, 4 /* [(local1)] */            #  3ae: 2811
            mov          a0, a3 /* [(local2)] */               #  3b0: 0d03
            addi         sp, sp, 16 /* (top of frame) */       #  3b2: 12c110
            ret           /* [(local1)] */                     #  3b5: 0df0

            .literal_position                                  #  3b8: 00000000
                                                               #  3bc: 00000000
                                                               #  3c0: 00000000
                                                               #  3c4: 00000000

# Function @ .text+0x3c8
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_spi_flash_write
            .type        sdk_spi_flash_write, @function
sdk_spi_flash_write:
            addi         sp, sp, -16 /* (local0) */            #  3c8: 12c1f0
            s32i         a0, sp, 4 /* a0 -> [(local1)] */      #  3cb: 0911
            s32i         a13, sp, 12 /* a13 -> [(local3)] */   #  3cd: d931
            s32i         a12, sp, 8 /* a12 -> [(local2)] */    #  3cf: c921
            mov          a13, a3 /* arg1 */                    #  3d1: dd03
            mov          a12, a4 /* arg2 */                    #  3d3: cd04
            bnez         a3, .Lbr020                           #  3d5: cc33
            movi         a2, 1 /* 0x00000001 */                #  3d7: 0c12
            j            .Lbr022                               #  3d9: 460e00
.Lbr020:    s32i         a2, sp, 0 /* arg0 -> [(local0)] */    #  3dc: 2901
            movi         a0, 3 /* 0x00000003 */                #  3de: 0c30
            bnone        a0, a4, .Lbr021                       #  3e0: 470007
            movi         a0, 4 /* 0x00000004 */                #  3e3: 0c40
            srli         a12, a4, 2                            #  3e5: 40c241
            addx4        a12, a12, a0                          #  3e8: 00cca0
.Lbr021:    call0        vPortEnterCritical                    #  3eb: 01f3ffc0
                                                               #  3ef: 0000
            call0        Cache_Read_Disable                    #  3f1: 01f2ffc0
                                                               #  3f5: 0000
            mov          a4, a12                               #  3f7: 4d0c
            mov          a3, a13 /* arg1 */                    #  3f9: 3d0d
            l32i         a2, sp, 0 /* [(local0)] */            #  3fb: 2801
            call0        sdk_SPIWrite                          #  3fd: 050000
            movi         a3, 0 /* 0x00000000 */                #  400: 0c03
            mov          a12, a2                               #  402: cd02
            movi         a4, 1 /* 0x00000001 */                #  404: 0c14
            movi         a2, 0 /* 0x00000000 */                #  406: 0c02
            call0        Cache_Read_Enable                     #  408: 01eeffc0
                                                               #  40c: 0000
            call0        vPortExitCritical                     #  40e: 01edffc0
                                                               #  412: 0000
            mov          a2, a12                               #  414: 2d0c
.Lbr022:    l32i         a12, sp, 8 /* [(local2)] */           #  416: c821
            l32i         a13, sp, 12 /* [(local3)] */          #  418: d831
            l32i         a0, sp, 4 /* [(local1)] */            #  41a: 0811
            addi         sp, sp, 16 /* (top of frame) */       #  41c: 12c110
            ret                                                #  41f: 0df0

            .literal_position                                  #  424: 00000000
                                                               #  428: 00000000
                                                               #  42c: 00000000
                                                               #  430: 00000000

# Function @ .text+0x434
# Local variables/stack:
#     (local0):  word      @ -0x10
#     (local1):  word      @ -0xc
#     (local2):  word      @ -0x8
#     (local3):  word      @ -0x4
            .balign      4
            .global      sdk_spi_flash_read
            .type        sdk_spi_flash_read, @function
sdk_spi_flash_read:
            addi         sp, sp, -16 /* (local0) */            #  434: 12c1f0
            s32i         a0, sp, 8 /* a0 -> [(local2)] */      #  437: 0921
            s32i         a4, sp, 0 /* arg2 -> [(local0)] */    #  439: 4901
            s32i         a12, sp, 12 /* a12 -> [(local3)] */   #  43b: c931
            s32i         a2, sp, 4 /* arg0 -> [(local1)] */    #  43d: 2911
            mov          a12, a3 /* arg1 */                    #  43f: cd03
            bnez         a3, .Lbr023                           #  441: cc33
            movi         a2, 1 /* 0x00000001 */                #  443: 0c12
            j            .Lbr024                               #  445: 860a00
.Lbr023:    call0        vPortEnterCritical                    #  448: 01f7ffc0
                                                               #  44c: 0000
            call0        Cache_Read_Disable                    #  44e: 01f6ffc0
                                                               #  452: 0000
            mov          a3, a12 /* arg1 */                    #  454: 3d0c
            l32i         a2, sp, 4 /* [(local1)] */            #  456: 2811
            l32i         a4, sp, 0 /* [(local0)] */            #  458: 4801
            call0        sdk_SPIRead                           #  45a: 050000
            movi         a3, 0 /* 0x00000000 */                #  45d: 0c03
            mov          a12, a2                               #  45f: cd02
            movi         a4, 1 /* 0x00000001 */                #  461: 0c14
            movi         a2, 0 /* 0x00000000 */                #  463: 0c02
            call0        Cache_Read_Enable                     #  465: 01f1ffc0
                                                               #  469: 0000
            call0        vPortExitCritical                     #  46b: 01f1ffc0
                                                               #  46f: 0000
            mov          a2, a12                               #  471: 2d0c
.Lbr024:    l32i         a12, sp, 12 /* [(local3)] */          #  473: c831
            l32i         a0, sp, 8 /* [(local2)] */            #  475: 0821
            addi         sp, sp, 16 /* (top of frame) */       #  477: 12c110
            ret                                                #  47a: 0df0

            .section     .data, "aw", @progbits

            .global      sdk_flashchip
            .type        sdk_flashchip, @object
sdk_flashchip:
            .word        0x001640ef                            #    0: ef401600
.Ldata001:  .word        0x00400000                            #    4: 00004000

# NOTE: The following is apparently unreferenced code/data
            .word        0x00010000                            #    8: 00000100

.Ldata002:  .word        0x00001000                            #    c: 00100000
.Ldata003:  .word        0x00000100                            #   10: 00010000

# NOTE: The following is apparently unreferenced code/data
            .word        0x0000ffff                            #   14: ffff0000

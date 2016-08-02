/**
 * The MIT License (MIT)
 *
 * Copyright (c) 2016 sheinz (https://github.com/sheinz)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

        .text
        .section .iram1.text, "x"
        .literal_position

/**
 * Copy unaligned data to 4-byte aligned buffer.
 */
        .align  4
        .global memcpy_unaligned_src
        .type   memcpy_unaligned_src, @function
memcpy_unaligned_src:
/* a2: dst, a3: src, a4: size */
        ssa8l       a3
        srli        a3, a3, 2
        slli        a3, a3, 2
        beqz        a4, u_src_end
        l32i        a6, a3, 0
u_src_loop:
        l32i        a7, a3, 4
        src         a8, a7, a6
        memw
        s32i        a8, a2, 0
        mov         a6, a7
        addi        a3, a3, 4
        addi        a2, a2, 4
        addi        a4, a4, -1
        bnez        a4, u_src_loop
u_src_end:
        movi a2, 0
        ret.n


/**
 * Copy data from 4-byte aligned source to unaligned destination buffer.
 */
        .align  4
        .global memcpy_unaligned_dst
        .type   memcpy_unaligned_dst, @function
memcpy_unaligned_dst:
/* a2: dst, a3: src, a4: size */
        beqz.n       a4, u_dst_end
        extui        a5, a4, 0, 2
        beqz.n       a5, aligned_dst_loop
u_dst_loop:
        /* Load data word */
        memw
        l32i.n       a5, a3, 0

        /* Save byte number 0 */
        s8i          a5, a2, 0
        addi.n       a4, a4, -1
        beqz         a4, u_dst_end
        addi.n       a2, a2, 1

        /* Shift and save byte number 1 */
        srli         a5, a5, 8
        s8i          a5, a2, 0
        addi.n       a4, a4, -1
        beqz         a4, u_dst_end
        addi.n       a2, a2, 1

        /* Shift and save byte number 2 */
        srli         a5, a5, 8
        s8i          a5, a2, 0
        addi.n       a4, a4, -1
        beqz         a4, u_dst_end
        addi.n       a2, a2, 1

        /* Shift and save byte number 3 */
        srli         a5, a5, 8
        s8i          a5, a2, 0
        addi.n       a4, a4, -1
        addi.n       a2, a2, 1

        /* Next word */
        addi.n       a3, a3, 4
        bnez.n       a4, u_dst_loop
        ret.n
aligned_dst_loop:
        memw
        l32i        a5, a3, 0
        s32i        a5, a2, 0
        addi.n      a3, a3, 4
        addi.n      a2, a2, 4
        addi.n      a4, a4, -4
        bnez.n      a4, aligned_dst_loop
u_dst_end:   ret.n


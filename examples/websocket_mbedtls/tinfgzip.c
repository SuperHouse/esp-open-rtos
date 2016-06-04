/*
 * tinfgzip  -  tiny gzip decompressor
 *
 * Copyright (c) 2003 by Joergen Ibsen / Jibz
 * All Rights Reserved
 *
 * http://www.ibsensoftware.com/
 *
 * This software is provided 'as-is', without any express
 * or implied warranty.  In no event will the authors be
 * held liable for any damages arising from the use of
 * this software.
 *
 * Permission is granted to anyone to use this software
 * for any purpose, including commercial applications,
 * and to alter it and redistribute it freely, subject to
 * the following restrictions:
 *
 * 1. The origin of this software must not be
 *    misrepresented; you must not claim that you
 *    wrote the original software. If you use this
 *    software in a product, an acknowledgment in
 *    the product documentation would be appreciated
 *    but is not required.
 *
 * 2. Altered source versions must be plainly marked
 *    as such, and must not be misrepresented as
 *    being the original software.
 *
 * 3. This notice may not be removed or altered from
 *    any source distribution.
 */

#include "tinf.h"

#define FTEXT    1
#define FHCRC    2
#define FEXTRA   4
#define FNAME    8
#define FCOMMENT 16

int tinf_gzip_uncompress(void *dest, unsigned int *destLen,
                         const void *source, unsigned int sourceLen)
{
    unsigned char *src = (unsigned char *)source;
    unsigned char *dst = (unsigned char *)dest;
    unsigned char *start;
    unsigned int dlen, crc32;
    int res;
    unsigned char flg;

    /* -- check format -- */

    /* check id bytes */
    if (src[0] != 0x1f || src[1] != 0x8b) return TINF_DATA_ERROR;

    /* check method is deflate */
    if (src[2] != 8) return TINF_DATA_ERROR;

    /* get flag byte */
    flg = src[3];

    /* check that reserved bits are zero */
    if (flg & 0xe0) return TINF_DATA_ERROR;

    /* -- find start of compressed data -- */

    /* skip base header of 10 bytes */
    start = src + 10;

    /* skip extra data if present */
    if (flg & FEXTRA)
    {
       unsigned int xlen = start[1];
       xlen = 256*xlen + start[0];
       start += xlen + 2;
    }

    /* skip file name if present */
    if (flg & FNAME) { while (*start) ++start; ++start; }

    /* skip file comment if present */
    if (flg & FCOMMENT) { while (*start) ++start; ++start; }

    /* check header crc if present */
    if (flg & FHCRC)
    {
       unsigned int hcrc = start[1];
       hcrc = 256*hcrc + start[0];

       if (hcrc != (tinf_crc32(src, start - src) & 0x0000ffff))
          return TINF_DATA_ERROR;

       start += 2;
    }

    /* -- get decompressed length -- */

    dlen =            src[sourceLen - 1];
    dlen = 256*dlen + src[sourceLen - 2];
    dlen = 256*dlen + src[sourceLen - 3];
    dlen = 256*dlen + src[sourceLen - 4];

    /* -- get crc32 of decompressed data -- */

    crc32 =             src[sourceLen - 5];
    crc32 = 256*crc32 + src[sourceLen - 6];
    crc32 = 256*crc32 + src[sourceLen - 7];
    crc32 = 256*crc32 + src[sourceLen - 8];

    /* -- decompress data -- */

    res = tinf_uncompress(dst, destLen, start, src + sourceLen - start - 8);

    if (res != TINF_OK) return TINF_DATA_ERROR;

    if (*destLen != dlen) return TINF_DATA_ERROR;

    /* -- check CRC32 checksum -- */

    if (crc32 != tinf_crc32(dst, dlen)) return TINF_DATA_ERROR;

    return TINF_OK;
}

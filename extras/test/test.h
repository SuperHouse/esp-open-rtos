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
#ifndef __TEST_H__
#define __TEST_H__

#include <stdio.h>
#include <stdbool.h>

#include "FreeRTOS.h"

extern bool test_result;

#define TEST_CHECK(x, msg)  \
    if (!(x)) { \
        printf("FAIL:%s:%d:%s\n", __FILE__, __LINE__, (msg)); \
        test_result = false; \
    }

#define TEST_ASSERT(x, msg) \
    if (!(x)) { \
        printf("FAIL:%s:%d:%s\n", __FILE__, __LINE__, (msg)); \
        printf("TEST_FINISH: FAIL\n"); \
        test_result = false; \
        vTaskDelete(NULL); \
        taskYIELD(); \
    } 

#define TEST_FAIL(msg) TEST_ASSERT(false, msg)

#define TEST_FINISH() \
    if (test_result) { \
        printf("TEST_FINISH: SUCCESS\n"); \
    } else { \
        printf("TEST_FINISH: FAIL\n"); \
    }

#define TEST_INIT(timeout) test_init(timeout)

void test_init(uint32_t timeout);

#endif  // __TEST_H__

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

#include "test.h"
#include <string.h>
#include "task.h"
#include "esp/uart.h"

bool test_result = true;

void test_init(uint32_t timeout)
{
    char buf[256];
    int data_len = 0;
    buf[data_len] = 0;

    uart_set_baud(0, 115200);

    while (true) {
        int c = getchar();
        if (c == EOF || c == '\n' || c == '\r') {
            if (strcmp(buf, "START") == 0) {
                break;
            } else {
                data_len = 0;
                buf[data_len] = 0;
            }
        } else{
            buf[data_len++] = c;
            buf[data_len] = 0;
        }
        taskYIELD();
    }

    printf("TEST_INIT: TIMEOUT=%ds\n", timeout); \
}

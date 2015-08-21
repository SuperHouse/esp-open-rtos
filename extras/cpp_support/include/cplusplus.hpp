/* 
 * The MIT License (MIT)
 * 
 * ESP8266 FreeRTOS Firmware
 * Copyright (c) 2015 Michael Jacobsen (github.com/mikejac)
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
 *
 * https://github.com/SuperHouse/esp-open-rtos
 * 
 */
 
#ifndef ESP_OPEN_RTOS_CPLUSPLUS_HPP
#define	ESP_OPEN_RTOS_CPLUSPLUS_HPP

#include <stdlib.h>

/******************************************************************************************************************
 * C++ new and delete operators
 *
 */

/**
 * 
 * @param size
 * @return 
 */
inline void *operator new(size_t size) 
{
    return malloc(size);
}
/**
 * 
 * @param size
 * @return 
 */
inline void *operator new[](size_t size) 
{
    return malloc(size);
}
/**
 * 
 * @param ptr
 */
inline void operator delete(void * ptr)
{
    free(ptr);
}
/**
 * 
 * @param ptr
 */
inline void operator delete[](void * ptr) 
{
    free(ptr);
}

#endif	/* ESP_OPEN_RTOS_CPLUSPLUS_HPP */


/* 
 * ESP8266 FreeRTOS Firmware
 * Copyright (C) 2015  Michael Jacobsen
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * https://github.com/SuperHouse/esp-open-rtos
 * 
 */

#ifndef COM_THOLUSI_ESP_OPEN_RTOS_CPLUSPLUS_HPP
#define	COM_THOLUSI_ESP_OPEN_RTOS_CPLUSPLUS_HPP

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

#endif	/* COM_THOLUSI_ESP_OPEN_RTOS_CPLUSPLUS_HPP */


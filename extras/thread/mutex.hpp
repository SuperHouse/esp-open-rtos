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

#ifndef COM_THOLUSI_ESP_OPEN_RTOS_MUTEX_HPP
#define	COM_THOLUSI_ESP_OPEN_RTOS_MUTEX_HPP

#include "semphr.h"

namespace esp_open_rtos {
namespace thread {

/******************************************************************************************************************
 * class mutex_t
 *
 */
class mutex_t
{
public:
    /**
     * 
     */
    inline mutex_t()
    {
        mutex = xSemaphoreCreateMutex();
    }
    /**
     * 
     */
    inline ~mutex_t()
    {
        vQueueDelete(mutex);
    }
    /**
     * 
     * @return 
     */
    inline int lock()
    {
        return (xSemaphoreTake(mutex, portMAX_DELAY) == pdTRUE) ? 0 : -1;
    }
    /**
     * 
     * @param ms
     * @return 
     */
    inline int try_lock(unsigned long ms)
    {
        return (xSemaphoreTake(mutex, ms / portTICK_RATE_MS) == pdTRUE) ? 0 : -1;
    }
    /**
     * 
     * @return 
     */
    inline int unlock()
    {
        return (xSemaphoreGive(mutex) == pdTRUE) ? 0 : -1;
    }

private:
    xSemaphoreHandle    mutex;

    // Disable copy construction and assignment.
    mutex_t (const mutex_t&);
    const mutex_t &operator = (const mutex_t&);
};

} //namespace thread {
} //namespace esp_open_rtos {


#endif	/* COM_THOLUSI_ESP_OPEN_RTOS_MUTEX_HPP */


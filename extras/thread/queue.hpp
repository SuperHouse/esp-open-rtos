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

#ifndef COM_THOLUSI_ESP_OPEN_RTOS_QUEUE_HPP
#define	COM_THOLUSI_ESP_OPEN_RTOS_QUEUE_HPP

#include "FreeRTOS.h"
#include "queue.h"

namespace esp_open_rtos {
namespace thread {

/******************************************************************************************************************
 * class queue_t
 *
 */
template<class Data>
class queue_t
{
public:
    /**
     * 
     */
    inline queue_t()
    {
        queue = 0;
    }
    /**
     * 
     * @param uxQueueLength
     * @param uxItemSize
     * @return 
     */
    inline int create(unsigned portBASE_TYPE uxQueueLength)
    {
        queue = xQueueCreate(uxQueueLength, sizeof(Data));
        
        if(queue == NULL) {
            return -1;
        }
        else {
            return 0;
        }
    }
    /**
     * 
     * @param data
     * @param ms
     * @return 
     */
    inline void destroy()
    {
        vQueueDelete(queue);
        queue = 0;
    }
    /**
     * 
     * @param data
     * @param ms
     * @return 
     */
    inline int post(const Data& data, unsigned long ms = 0)
    {
        return (xQueueSend(queue, &data, ms / portTICK_RATE_MS) == pdTRUE) ? 0 : -1;
    }
    /**
     * 
     * @param data
     * @param ms
     * @return 
     */
    inline int receive(Data& data, unsigned long ms = 0)
    {
        return (xQueueReceive(queue, &data, ms / portTICK_RATE_MS) == pdTRUE) ? 0 : -1;
    }
    /**
     * 
     * @param other
     * @return 
     */
    const queue_t &operator = (const queue_t& other)
    {
        if(this != &other) {        // protect against invalid self-assignment
            queue = other.queue;
        }
        
        return *this;
    }

private:
    xQueueHandle queue;

    // Disable copy construction.
    queue_t (const queue_t&);
};

} //namespace thread {
} //namespace esp_open_rtos {


#endif	/* COM_THOLUSI_ESP_OPEN_RTOS_QUEUE_HPP */


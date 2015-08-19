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

#ifndef COM_THOLUSI_ESP_OPEN_RTOS_TASK_HPP
#define	COM_THOLUSI_ESP_OPEN_RTOS_TASK_HPP

#include "FreeRTOS.h"
#include "task.h"

namespace esp_open_rtos {
namespace thread {

/******************************************************************************************************************
 * task_t
 *
 */
class task_t
{
public:
    /**
     * 
     */
    task_t()
    {}
    /**
     * 
     * @param pcName
     * @param usStackDepth
     * @param uxPriority
     * @return 
     */
    int task_create(const char* const pcName, unsigned short usStackDepth = 256, unsigned portBASE_TYPE uxPriority = 2)
    {
        return xTaskCreate(task_t::_task, (signed char *)pcName, usStackDepth, this, uxPriority, NULL);
    }
    
protected:
    /**
     * 
     * @param ms
     */
    void sleep(unsigned long ms)
    {
        vTaskDelay(ms / portTICK_RATE_MS);
    }
    /**
     * 
     * @return 
     */
    inline unsigned long millis()
    {
        return xTaskGetTickCount() * portTICK_RATE_MS;
    }
    
private:
    /**
     * 
     */
    virtual void task() = 0;
    /**
     * 
     * @param pvParameters
     */
    static void _task(void* pvParameters)
    {
        if(pvParameters != 0) {
            ((task_t*)(pvParameters))->task();
        }
    }
    
    // no copy and no = operator
    task_t(const task_t&);
    task_t &operator=(const task_t&);    
};

} //namespace thread {
} //namespace esp_open_rtos {


#endif	/* COM_THOLUSI_ESP_OPEN_RTOS_TASK_HPP */


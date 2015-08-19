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

#ifndef COM_THOLUSI_ESP_OPEN_RTOS_TIMER_HPP
#define	COM_THOLUSI_ESP_OPEN_RTOS_TIMER_HPP

#include "FreeRTOS.h"
#include "task.h"

namespace esp_open_rtos {
namespace timer {

#define __millis()  (xTaskGetTickCount() * portTICK_RATE_MS)

/******************************************************************************************************************
 * countdown_t
 *
 */
class countdown_t
{
public:
    /**
     * 
     */
    countdown_t()
    {  
	interval_end_ms = 0L;
    }
    /**
     * 
     * @param ms
     */
    countdown_t(int ms)
    {
        countdown_ms(ms);   
    }
    /**
     * 
     * @return 
     */
    bool expired()
    {
        return (interval_end_ms > 0L) && (__millis() >= interval_end_ms);
    }
    /**
     * 
     * @param ms
     */
    void countdown_ms(unsigned long ms)  
    {
        interval_end_ms = __millis() + ms;
    }
    /**
     * 
     * @param seconds
     */
    void countdown(int seconds)
    {
        countdown_ms((unsigned long)seconds * 1000L);
    }
    /**
     * 
     * @return 
     */
    int left_ms()
    {
        return interval_end_ms - __millis();
    }
    
private:
    portTickType interval_end_ms;
};

} // namespace timer {
} // namespace esp_open_rtos {

#endif

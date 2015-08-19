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

#include "cplusplus/cplusplus.hpp"
#include "thread/task.hpp"
#include "thread/queue.hpp"

#include "espressif/esp_common.h"

/******************************************************************************************************************
 * task_1_t
 *
 */
class task_1_t: public esp_open_rtos::thread::task_t
{
public:
    esp_open_rtos::thread::queue_t<uint32_t> queue;
    
private:
    void task()
    {
        printf("task_1_t::task(): start\n");

        uint32_t count = 0;

        while(true) {
            sleep(1000);
            queue.post(count);
            count++;
        }
    }    
};
/******************************************************************************************************************
 * task_2_t
 *
 */
class task_2_t: public esp_open_rtos::thread::task_t
{
public:
    esp_open_rtos::thread::queue_t<uint32_t> queue;
    
private:
    void task()
    {
        printf("task_2_t::task(): start\n");

        while(true) {
            uint32_t count;

            if(queue.receive(count, 1500) == 0) {
                printf("task_2_t::task(): got %lu\n", count);
            } 
            else {
                printf("task_2_t::task(): no msg\n");
            }
        }
    }    
};
/******************************************************************************************************************
 * globals
 *
 */
task_1_t task_1;
task_2_t task_2;

esp_open_rtos::thread::queue_t<uint32_t> MyQueue;

/**
 * 
 */
extern "C" void user_init(void)
{
	sdk_uart_div_modify(0, UART_CLK_FREQ / 115200);
	
    MyQueue.create(10);
    
    task_1.queue = MyQueue;
    task_2.queue = MyQueue;
    
    task_1.task_create("tsk1");
    task_2.task_create("tsk2");
}
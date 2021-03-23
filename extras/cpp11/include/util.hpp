//  Copyright 2017 Florian Eich <florian.eich@gmail.com>
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#ifndef ESP_OPEN_RTOS_EXTRAS_CPP11_UTIL_HPP_
#define ESP_OPEN_RTOS_EXTRAS_CPP11_UTIL_HPP_

#include "FreeRTOS.h"


namespace cxx {


/*!
 * \brief Function to determine current task time.
 * \returns Time spent on task in milliseconds.
 */
unsigned long millis() {
  return xTaskGetTickCount() * portTICK_PERIOD_MS;
}


/*!
 * \brief Function to sleep for some time.
 * \param ms Time to sleep in milliseconds.
 */
void sleep(const unsigned long ms) {
  vTaskDelay(ms / portTICK_PERIOD_MS);
}

}  // namespace cxx

#endif  // ESP_OPEN_RTOS_EXTRAS_CPP11_UTIL_HPP_


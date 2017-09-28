/* --------------------------------------------------------------------------*\
 * Copyright 2017 Florian Eich <florian.eich@gmail.com>
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE./  limitations under the License.
\* --------------------------------------------------------------------------*/

#ifndef ESP_OPEN_RTOS_EXTRAS_CPP11_MUTEX_HPP_
#define ESP_OPEN_RTOS_EXTRAS_CPP11_MUTEX_HPP_


#include "FreeRTOS.h"
#include "semphr.h"


namespace cxx {


/*!
 * \brief Wrapper for FreeRTOS SemaphoreHande_t.
 */
class mutex
{
public:
  /*!
   * \brief Default constructor for mutex class.
   */
  mutex() : _mutex(xSemaphoreCreateMutex()) {}

  // Disable copy construction and assigment.
  mutex(const mutex &) = delete;
  mutex & operator=(const mutex &) = delete;

  /*!
   * \brief Destructor for mutex class releases underlying resource actively.
   */
  ~mutex() { vQueueDelete(_mutex); }

  /*!
   * \brief Check if mutex is usable.
   * \returns boolean: true if usable.
   */
  bool usable() const { return _mutex != nullptr; }

  /*!
   * \brief Try locking mutex with no timeout.
   * \returns boolean: true if successfully locked.
   */
  bool try_lock() { return xSemaphoreTake(_mutex, portMAX_DELAY) == pdTRUE; }

  /*!
   * \brief Try locking mutex with timeout.
   * \param ms Timeout delay in milliseconds.
   * \returns boolean: true if successfully locked.
   */
  bool try_lock(const unsigned long ms) {
    return xSemaphoreTake(_mutex, ms / portTICK_PERIOD_MS) == pdTRUE;
  }

  /*!
   * \brief Unlock mutex.
   * \returns boolean: true if successfully unlocked.
   */
  bool unlock() { return xSemaphoreGive(_mutex) == pdTRUE; }

private:
  SemaphoreHandle_t _mutex;
};

}  // namespace cxx

#endif  // ESP_OPEN_RTOS_EXTRAS_CPP11_MUTEX_HPP_


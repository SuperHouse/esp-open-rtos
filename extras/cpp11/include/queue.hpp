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

#ifndef ESP_OPEN_RTOS_EXTRAS_CPP11_QUEUE_HPP_
#define ESP_OPEN_RTOS_EXTRAS_CPP11_QUEUE_HPP_


#include "FreeRTOS.h"
#include "queue.h"


namespace cxx {


/*!
 * \brief Wrapper for FreeRTOS QueueHandle_t.
 */
template <class D>
class queue
{
public:
  /*!
   * \brief Constructor for queue class.
   * \param uxQueueLength Length of queue.
   */
  queue(const unsigned portBASE_TYPE uxQueueLength)
   : _queue(xQueueCreate(uxQueueLength, sizeof(D))) {}

  // Disable default constructor, copy constructor and assignment operator.
  queue()              = delete;
  queue(const queue &) = delete;
  queue & operator=(const queue &) = delete;

  /*!
   * \brief Destructor for queue class releases underlying resource actively.
   */
  ~queue() { vQueueDelete(_queue); }

  /*!
   * \brief Check if queue is usable.
   * \returns boolean: true if usable.
   */
  bool usable() const { return _queue != nullptr; }

  /*!
   * \brief Send function.
   * \param data Data container.
   * \param ms Timeout delay, default: 0.
   * \returns boolean: true if successful.
   */
  bool send(const D & data, unsigned long ms = 0) {
    return xQueueSend(_queue, &data, ms / portTICK_PERIOD_MS) == pdTRUE;
  }

  /*!
   * \brief Receive function.
   * \param data Data container.
   * \param ms Timeout delay, default: 0.
   * \returns boolean: true if successful.
   */
  bool receive(D & data, unsigned long ms = 0) {
    return xQueueReceive(_queue, &data, ms / portTICK_PERIOD_MS) == pdTRUE;
  }

private:
  QueueHandle_t _queue;
};

}  // namespace cxx

#endif  // ESP_OPEN_RTOS_EXTRAS_CPP11_QUEUE_HPP_


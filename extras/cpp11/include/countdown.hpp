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

#ifndef ESP_OPEN_RTOS_EXTRAS_CPP11_COUNTDOWN_HPP_
#define ESP_OPEN_RTOS_EXTRAS_CPP11_COUNTDOWN_HPP_


#include "FreeRTOS.h"

#include "util.hpp"


namespace cxx {


/*!
 * \brief Wrapper for FreeRTOS TickType_t.
 */
class countdown
{
public:
  /*!
   * \brief Default constructor for countdown class.
   */
  countdown() : _interval_end_ms(0L) {}

  /*!
   * \brief Constructor for countdown class with milliseconds parameter.
   * \param ms Specify milliseconds for countdown timer.
   */
  countdown(const int ms) : _interval_end_ms(millis() + ms) {}

  /*!
   * \brief Function to check if countdown has expired.
   * \returns boolean
   */
  bool expired() {
    return (_interval_end_ms > 0L) && (millis() >= _interval_end_ms);
  }

  /*!
   * \brief Setter for countdown.
   * \param ms Number of milliseconds.
   */
  void countdown_ms(const unsigned long ms) {
    _interval_end_ms = ms + millis();
  }

  /*!
   * \brief Setter for countdown.
   * \param s Number of seconds.
   */
  void countdown_s(const unsigned long s) { countdown_ms(s * 1000L); }

  /*!
   * \brief Function to check time left.
   * \returns Remaining time in milliseconds.
   */
  int left_ms() { return _interval_end_ms - millis(); }

private:
  TickType_t _interval_end_ms;
};

}  // namespace cxx

#endif  // ESP_OPEN_RTOS_EXTRAS_CPP11_COUNTDOWN_HPP_


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

#ifndef ESP_OPEN_RTOS_EXTRAS_CPP11_TASK_HPP_
#define ESP_OPEN_RTOS_EXTRAS_CPP11_TASK_HPP_

#include <utility>

#include "FreeRTOS.h"
#include "task.h"

namespace cxx {


/*!
 * \brief Wrapper for the FreeRTOS task.
 * \param F Template parameter specifying the type of the function, which is
 *          some form of a lambda. Do *NOT* specify this by hand - use the
 *          `make_task` function to instantiate tasks.
 */
template <class F>
class task
{
public:
  /*!
   * \brief Constructor for the task class.
   * \param name Name of the task.
   * \param stack_depth Stack depth for the task (use 256 as default).
   * \param priority FreeRTOS priority of the task (use 2 as default).
   * \param param  Parameter passed to task execution (use nullptr as default).
   * \param thread Function executed by the task.
   */
  task(const char *                 name,
       const unsigned short         stack_depth,
       const unsigned portBASE_TYPE priority,
       void *                       param,
       F                            thread)
   : _name(name),
     _stack_depth(stack_depth),
     _priority(priority),
     _param(param),
     _thread(thread) {}

  /*!
   * \brief Destructor for task class deletes FreeRTOS task.
   */
  ~task() {
    if (_active) { vTaskDelete(_handle); }
  }

  // Disable default construction, copy construction and assignment.
  task()             = delete;
  task(const task &) = delete;
  task & operator=(const task &) = delete;

  // Default move semantics
  task(task && other) = default;

  void run() {
    _active =
      xTaskCreate(
        +_thread, _name, _stack_depth, _param, _priority, &_handle) == pdPASS;
  }

  /*!
   * \brief Check if task is currently active.
   * \returns boolean: true if task is active.
   */
  bool active() const { return _active; }

private:
  const char *                 _name;
  const unsigned short         _stack_depth;
  const unsigned portBASE_TYPE _priority;
  void *                       _param;
  F                            _thread;

  TaskHandle_t _handle;
  bool         _active{false};
};


/*!
 * \brief Function to generate task object.
 * \param name Name of the task.
 * \param stack_depth Stack depth for the task.
 * \param priority FreeRTOS priority of the task.
 * \param thread Function executed by the task.
 * \param param  Parameters passed to task execution, nullptr by default.
 * \returns task object.
 */
template <class F>
constexpr task<F> make_task(const char *                 name,
                            const unsigned short         stack_depth,
                            const unsigned portBASE_TYPE priority,
                            void *                       param,
                            F                            thread) {
  return std::move(task<F>(name, stack_depth, priority, param, thread));
}


/*!
 * \brief Function to generate task object.
 * \param name Name of the task.
 * \param stack_depth Stack depth for the task.
 * \param priority FreeRTOS priority of the task.
 * \param thread Function executed by the task.
 * \returns task object.
 */
template <class F>
constexpr task<F> make_task(const char *                 name,
                            const unsigned short         stack_depth,
                            const unsigned portBASE_TYPE priority,
                            F                            thread) {
  return std::move(task<F>(name, stack_depth, priority, nullptr, thread));
}


/*!
 * \brief Function to generate task object.
 * \param name Name of the task.
 * \param stack_depth Stack depth for the task.
 * \param thread Function executed by the task.
 * \returns task object.
 */
template <class F>
constexpr task<F> make_task(const char *         name,
                            const unsigned short stack_depth,
                            F                    thread) {
  return std::move(task<F>(name, stack_depth, 2, nullptr, thread));
}


/*!
 * \brief Function to generate task object.
 * \param name Name of the task.
 * \param thread Function executed by the task.
 * \returns task object.
 */
template <class F>
constexpr task<F> make_task(const char * name, F thread) {
  return std::move(task<F>(name, 256, 2, nullptr, thread));
}

}  // namespace cxx

#endif  // ESP_OPEN_RTOS_EXTRAS_CPP11_TASK_HPP_


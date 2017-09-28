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

#include "queue.hpp"
#include "task.hpp"
#include "util.hpp"

#include "esp/uart.h"
#include "espressif/esp_common.h"


//
// Declare queue for both tasks to work on.
//
cxx::queue<uint32_t> comq{10};

//
// Instantiate "sender" task using the make_task generator function.
//
//
// The first parameter is the name.
//
// Second parameter is the stack depth for the task (use 512 as default).
//
// Third is the priority of the task (use 2 as default).
//
// Fourth can optionally be a pointer to a parameter passed to the lambda,
// which then must be recasted inside the lambda function via
// "static_cast<your_type>(pvParameter)" to be used.
//
// Fifth is a lambda defining the function (must have "void * pvParameter").
//
auto task1 = cxx::make_task("sender", 256, 2, &comq, [](void * pvParameter) {
  printf("sender: start.\n");

  uint32_t count{0};

  //
  // Cast "pvParameter" to the type you need it to be - must remain pointer.
  //
  auto my_comq = static_cast<cxx::queue<uint32_t> *>(pvParameter);

  while (true) {
    cxx::sleep(10);

    //
    // Now, the "->" must be used sinve "my_comq" is a pointer.
    //
    my_comq->send(count);

    ++count;
  }
});

//
// Instantiate "receiver" task. Same syntax as above.
//
// Here, the simpler syntax is shown. Since "comq" is defined globally
// context, it is automatically captured by the lambda and does not need to be
// passed in.
//
auto task2 = cxx::make_task("receiver", [](void * pvParameter) {
  printf("receiver: start.\n");

  while (true) {
    uint32_t count;
    comq.receive(count, 15) ? printf("receiver: received %u\n", count)
                            : printf("receiver: no message received.\n");
  }
});

//
// The following syntaxes are also allowed:
//
//
// Only specify name and stack depth:
//
auto task3 = cxx::make_task("task3", 256, [](void *) {});
//
//
// Only specify name, stack depth and priority:
//
auto task4 = cxx::make_task("task4", 256, 2, [](void *) {});
//

//
// Let the show begin.
//
extern "C" void user_init(void) {
  uart_set_baud(0, 115200);
  printf("SDK version: %s\n", sdk_system_get_sdk_version());

  //
  // Call "run()" on all your tasks.
  //
  task1.run();
  task2.run();
}


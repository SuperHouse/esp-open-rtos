/* A very basic C++ example, really just proof of concept for C++

   This sample code is in the public domain.
 */
#include "espressif/esp_common.h"
#include "espressif/sdk_private.h"
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

class Counter
{
private:
  uint32_t _count;
public:
  Counter(uint32_t initial_count)
  {
    this->_count = initial_count;
    printf("Counter initialised with count %ld\r\n", initial_count);
  }

  void Increment()
  {
    _count++;
  }

  uint32_t getCount()
  {
    return _count;
  }
};

static Counter static_counter(99);

void task1(void *pvParameters)
{
  Counter local_counter = Counter(12);
  while(1) {
    Counter &counter = rand() % 2 ? static_counter : local_counter;
    counter.Increment();
    printf("local counter %ld static counter %ld\r\n", local_counter.getCount(),
	   static_counter.getCount());
    vTaskDelay(100);
  }
}

extern "C" void user_init(void)
{
    sdk_uart_div_modify(0, UART_CLK_FREQ / 115200);
    printf("SDK version:%s\n", sdk_system_get_sdk_version());
    xTaskCreate(task1, (signed char *)"tsk1", 256, NULL, 2, NULL);
}

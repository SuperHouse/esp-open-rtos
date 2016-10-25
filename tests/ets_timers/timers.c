#include <stdlib.h>
#include <string.h>
#include "FreeRTOS.h"
#include "task.h"
#include "etstimer.h"

#include "test/test.h"

static ETSTimer test_timer_0;

static int timer_0_counter = 0;

static uint32_t test_start_time;


static uint32_t get_current_time()
{
     return timer_get_count(FRC2) / 5000;  // to get roughly 1ms resolution
}

static void timer_0_cb(void *arg)
{
    uint32_t v = (uint32_t)arg;
    uint32_t delay = get_current_time() - test_start_time;

    TEST_CHECK(v == 0xAA, "Timer 0 argument invalid");
    TEST_CHECK(timer_0_counter == 0, "Timer 0 repeat error");

    // Timer should fire in 100ms
    TEST_CHECK(delay > 80, "Timer 0 time wrong");
    TEST_CHECK(delay < 120, "Timer 0 time wrong");

    timer_0_counter++;
}

void test_task(void *pvParameters)
{
    test_start_time = get_current_time();

    sdk_ets_timer_disarm(&test_timer_0);
    sdk_ets_timer_setfn(&test_timer_0, timer_0_cb, (void*)0xAA);
    sdk_ets_timer_arm(&test_timer_0, 100, false);

    // Finish the test and report the result
    TEST_FINISH();
}

void user_init(void)
{
    TEST_INIT(10);   // 10 seconds timeout

    xTaskCreate(test_task, (signed char *)"test_task", 256, NULL, 2, NULL);
}

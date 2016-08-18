#include <stdlib.h>
#include <string.h>
#include "FreeRTOS.h"
#include "task.h"

#include "test/test.h"

void test_task(void *pvParameters)
{
    // Test will continue even if check is failed
    TEST_CHECK(2 + 2 == 4, "math doesn't work");

    // Test will end imidiatelly if assertion is failed
    TEST_ASSERT(strlen("test") == 4, "strlen doesn't work");

    // Finish the test and report the result
    TEST_FINISH();
}

void user_init(void)
{
    TEST_INIT(5);   // 5 seconds timeout

    xTaskCreate(test_task, (signed char *)"test_task", 256, NULL, 2, NULL);
}

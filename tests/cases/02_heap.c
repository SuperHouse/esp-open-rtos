#include "testcase.h"
#include <malloc.h>
#include <string.h>
#include <FreeRTOS.h>

DEFINE_SOLO_TESTCASE(02_heap_simple)

/* Simple heap accounting tests */
static void a_02_heap_simple()
{
    struct mallinfo info = mallinfo();
    printf("'arena' allocation size %d bytes\n", info.arena);
    /* This is really a sanity check, if the "arena" size shrinks then
       this is a good thing and we can update the test. If it grows
       then we can also update the test, but we need a good reason. */
    TEST_ASSERT_INT_WITHIN_MESSAGE(1000, 15000, info.arena, "Initial allocated heap should be approximately 15kB. SEE COMMENT.");

    uint32_t freeheap = xPortGetFreeHeapSize();
    printf("xPortGetFreeHeapSize = %d bytes\n", freeheap);
    TEST_ASSERT_TRUE_MESSAGE(freeheap > 20000, "Should be at least 20kB free.");

    uint8_t *buf = malloc(8192);
    /* <-- have to do something with buf or gcc helpfully optimises it out! */
    memset(buf, 0xEE, 8192);
    uint32_t after = xPortGetFreeHeapSize();
    struct mallinfo after_info = mallinfo();
    printf("after arena size = %d bytes\n", after_info.arena);
    printf("after xPortGetFreeHeapSize = %d bytes\n", after);
    TEST_ASSERT_UINT32_WITHIN_MESSAGE(100, info.arena+8192, after_info.arena, "Allocated heap 'after' size should be 8kB more than before");
    TEST_ASSERT_UINT32_WITHIN_MESSAGE(100, freeheap-8192, after, "Free heap size should be 8kB less than before");

    free(buf);
    after = xPortGetFreeHeapSize();
    printf("after freeing xPortGetFreeHeapSize = %d bytes\n", after);
    TEST_ASSERT_UINT32_WITHIN_MESSAGE(100, freeheap, after, "Free heap size after freeing buffer should be close to initial");
    TEST_PASS;
}

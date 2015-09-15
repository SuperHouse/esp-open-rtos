/* Very basic example that just demonstrates we can run at all!
 */
#include "esp/rom.h"
#include "esp/timer.h"
#include "espressif/esp_common.h"
#include "espressif/sdk_private.h"
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

#include "string.h"
#include "strings.h"

#define TESTSTRING "O hai there! %d %d %d"

const char *dramtest = TESTSTRING;
const __attribute__((section(".iram1.notrodata"))) char iramtest[] = TESTSTRING;
const __attribute__((section(".text.notrodata"))) char iromtest[] = TESTSTRING;

INLINED uint32_t get_ccount (void)
{
    uint32_t ccount;
    asm volatile ("rsr.ccount %0" : "=a" (ccount));
    return ccount;
}

typedef void (* test_with_fn_t)(const char *string);

char buf[64];

void test_memcpy_aligned(const char *string)
{
    memcpy(buf, string, 16);
}

void test_memcpy_unaligned(const char *string)
{
    memcpy(buf, string, 15);
}

void test_memcpy_unaligned2(const char *string)
{
    memcpy(buf, string+1, 15);
}

void test_strcpy(const char *string)
{
    strcpy(buf, string);
}

void test_sprintf(const char *string)
{
    sprintf(buf, string, 1, 2, 3);
}

void test_sprintf_arg(const char *string)
{
    sprintf(buf, "%s", string);
}

void test_naive_strcpy(const char *string)
{
    char *to = buf;
    while((*to++ = *string++))
        ;
}

void test_l16si(const char *string)
{
    /* This follows most of the l16si path, but as the
     values in the string are all 7 bit none of them get sign extended.

    See separate test_sign_extension function which validates
    sign extension works as expected.
    */
    int16_t *src_int16 = (int16_t *)string;
    int32_t *dst_int32 = (int32_t *)buf;
    dst_int32[0] = src_int16[0];
    dst_int32[1] = src_int16[1];
    dst_int32[2] = src_int16[2];
}

#define TEST_REPEATS 1000

void test_noop(const char *string)
{

}

uint32_t IRAM run_test(const char *string, test_with_fn_t testfn, const char *testfn_label, uint32_t nullvalue, bool evict_cache)
{
    printf(" .. against %30s: ", testfn_label);
    vPortEnterCritical();
    uint32_t before = get_ccount();
    for(int i = 0; i < TEST_REPEATS; i++) {
        testfn(string);
        if(evict_cache) {
            Cache_Read_Disable();
            Cache_Read_Enable(0,0,1);
        }
    }
    uint32_t after = get_ccount();
    vPortExitCritical();
    uint32_t instructions = (after-before)/TEST_REPEATS - nullvalue;
    printf("%5d instructions\r\n", instructions);
    return instructions;
}

void test_string(const char *string, char *label, bool evict_cache)
{
    printf("Testing %s (%p) '%s'\r\n", label, string, string);
    printf("Formats as: '");
    printf(string, 1, 2, 3);
    printf("'\r\n");
    uint32_t nullvalue = run_test(string, test_noop, "null op", 0, evict_cache);
    run_test(string, test_memcpy_aligned, "memcpy - aligned len", nullvalue, evict_cache);
    run_test(string, test_memcpy_unaligned, "memcpy - unaligned len", nullvalue, evict_cache);
    run_test(string, test_memcpy_unaligned2, "memcpy - unaligned start&len", nullvalue, evict_cache);
    run_test(string, test_strcpy, "strcpy", nullvalue, evict_cache);
    run_test(string, test_naive_strcpy, "naive strcpy", nullvalue, evict_cache);
    run_test(string, test_sprintf, "sprintf", nullvalue, evict_cache);
    run_test(string, test_sprintf_arg, "sprintf format arg", nullvalue, evict_cache);
    run_test(string, test_l16si, "load as l16si", nullvalue, evict_cache);
}

static void test_doubleexception();
static void test_sign_extension();

void user_init(void)
{
    sdk_uart_div_modify(0, UART_CLK_FREQ / 115200);

    gpio_enable(2, GPIO_OUTPUT); /* used for LED debug */
    gpio_write(2, 1); /* active low */

    printf("\r\n\r\nSDK version:%s\r\n", sdk_system_get_sdk_version());
    test_string(dramtest, "DRAM", 0);
    test_string(iramtest, "IRAM", 0);
    test_string(iromtest, "Cached flash", 0);
    test_string(iromtest, "'Uncached' flash", 1);

    test_doubleexception();
    test_sign_extension();
}

static volatile bool frc1_ran;
static volatile bool frc1_finished;
static volatile char frc1_buf[80];

static void frc1_interrupt_handler(void)
{
    frc1_ran = true;
    timer_set_run(FRC1, false);
    strcpy((char *)frc1_buf, iramtest);
    frc1_finished = true;
}

static void test_doubleexception()
{
    printf("Testing DoubleException behaviour...\r\n");
    timer_set_interrupts(FRC1, false);
    timer_set_run(FRC1, false);
    _xt_isr_attach(INUM_TIMER_FRC1, frc1_interrupt_handler);
    timer_set_frequency(FRC1, 1000);
    timer_set_interrupts(FRC1, true);
    timer_set_run(FRC1, true);
    sdk_os_delay_us(2000);

    if(!frc1_ran)
        printf("ERROR: FRC1 timer exception never fired.\r\n");
    else if(!frc1_finished)
        printf("ERROR: FRC1 timer exception never finished.\r\n");
    else if(strcmp((char *)frc1_buf, iramtest))
        printf("ERROR: FRC1 strcpy from IRAM failed.\r\n");
    else
        printf("PASSED\r\n");
}

const volatile __attribute__((section(".iram1.notliterals"))) int16_t unsigned_shorts[] = { -3, -4, -5, -32767, 44 };

static void test_sign_extension()
{
    /* this step seems to be necessary so the compiler will actually generate l16si */
    int16_t *shorts_p = (int16_t *)unsigned_shorts;
    if(shorts_p[0] == -3 && shorts_p[1] == -4 && shorts_p[2] == -5 && shorts_p[3] == -32767 && shorts_p[4] == 44)
    {
        printf("l16si sign extension worked as expected.\r\n");
    } else {
        printf("l16si sign extension failed. Got values %d %d %d %d %d\r\n", shorts_p[0], shorts_p[1], shorts_p[2], shorts_p[3], shorts_p[4]);
    }
}

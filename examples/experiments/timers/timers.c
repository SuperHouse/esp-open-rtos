/* Experiments to dump timer registers at various points, mess around
 * with timer registers.
 *
 * NOT good code, not example code, nothing something you probably
 * want to mess with.
 *
 * This experimental reverse engineering code is in the public domain.
 */
#include "espressif/esp_common.h"
#include "espressif/sdk_private.h"
#include "FreeRTOS.h"
#include "task.h"
#include "esp8266.h"

#define DUMP_SZ 0x10 /* number of regs not size of buffer */

IRAM void dump_frc1_seq(void)
{
    uint32_t f1_a = TIMER_FRC1_COUNT_REG;
    uint32_t f1_b = TIMER_FRC1_COUNT_REG;
    uint32_t f1_c = TIMER_FRC1_COUNT_REG;
    printf("FRC1 sequence 0x%08lx 0x%08lx 0x%08lx\r\n", f1_a, f1_b, f1_c);
    printf("FRC1 deltas %ld %ld \r\n", f1_b-f1_a, f1_c-f1_b);
}

IRAM void dump_frc2_seq(void)
{
    /* this sequence of reads compiles down to sequence of l32is with
     * memw instructions in between.
     *
     * counts at various divisor values:
     * /1 = 13
     * /16 = 0 or 1 (usually 1)
     * 
     */
    uint32_t f2_a = TIMER_FRC2_COUNT_REG;
    uint32_t f2_b = TIMER_FRC2_COUNT_REG;
    uint32_t f2_c = TIMER_FRC2_COUNT_REG;
    printf("FRC2 sequence 0x%08lx 0x%08lx 0x%08lx\r\n", f2_a, f2_b, f2_c);
    printf("FRC2 deltas %ld %ld \r\n", f2_b-f2_a, f2_c-f2_b);
}

IRAM void dump_timer_regs(const char *msg)
{
    esp_reg_t reg = (esp_reg_t)TIMER_BASE;
    static uint32_t chunk[DUMP_SZ];

    /* load everything as quickly as possible to get a "snapshot" */
    for(int i = 0; i < DUMP_SZ; i++) {
        chunk[i] = reg[i];
    }

    printf("%s:\r\n", msg);
    /* print the chunk we loaded */
    for(int i = 0; i < DUMP_SZ; i++) {
        if(i % 4 == 0)
            printf("%s0x%02x: ", i ? "\r\n" : "", i*4);
        printf("%08lx ", chunk[i]);
    }
    printf("\r\n");

    dump_frc1_seq();
    dump_frc2_seq();
}

extern uint32_t isr[16];
extern uint32_t seen_isr[16];
extern uint32_t max_count;

static volatile uint32_t frc2_handler_call_count;
static volatile uint32_t frc2_last_count_val;

static volatile uint32_t frc1_handler_call_count;
static volatile uint32_t frc1_last_count_val;

void timerRegTask(void *pvParameters)
{
    while(1) {
        printf("state at task tick count %ld:\r\n", xTaskGetTickCount());
        dump_timer_regs("");

        /*
        for(int i = 0; i < 16; i++) {
            printf("int 0x%02x: 0x%08x (%d)\r\n", i, isr[i], seen_isr[i]);
        }
        printf("INUM_MAX count %d\r\n", max_count);
        */

        printf("frc1 handler called %ld times, last value 0x%08lx\r\n", frc1_handler_call_count,
               frc1_last_count_val);

        printf("frc2 handler called %ld times, last value 0x%08lx\r\n", frc2_handler_call_count,
               frc2_last_count_val);

        vTaskDelay(500 / portTICK_RATE_MS);
    }
}

IRAM void frc1_handler(void)
{
    frc1_handler_call_count++;
    frc1_last_count_val = TIMER_FRC1_COUNT_REG;
    //TIMER_FRC1_LOAD_REG = 0x300000;
    //TIMER_FRC1_CLEAR_INT = 0;
    //TIMER_FRC1_MATCH_REG = frc1_last_count_val + 0x100000;
}

void frc2_handler(void)
{
    frc2_handler_call_count++;
    frc2_last_count_val = TIMER_FRC2_COUNT_REG;
    TIMER_FRC2_MATCH_REG = frc2_last_count_val + 0x100000;
    //TIMER_FRC2_LOAD_REG = 0;
    //TIMER_FRC2_LOAD_REG = 0x2000000;
    //TIMER_FRC2_CLEAR_INT_REG = 0;
}

void user_init(void)
{
    sdk_uart_div_modify(0, UART_CLK_FREQ / 115200);
    xTaskCreate(timerRegTask, (signed char *)"timerRegTask", 1024, NULL, 2, NULL);

    TIMER_FRC1_CTRL_REG = TIMER_CTRL_DIV_256|TIMER_CTRL_INT_EDGE|TIMER_CTRL_RELOAD;
    TIMER_FRC1_LOAD_REG = 0x200000;

    TIMER_FRC2_CTRL_REG = TIMER_CTRL_DIV_256|TIMER_CTRL_INT_EDGE;

    DP_INT_ENABLE_REG |= INT_ENABLE_FRC1|INT_ENABLE_FRC2;
    _xt_isr_attach(INUM_TIMER_FRC1, frc1_handler);
    _xt_isr_unmask(1<<INUM_TIMER_FRC1);
    _xt_isr_attach(INUM_TIMER_FRC2, frc2_handler);
    _xt_isr_unmask(1<<INUM_TIMER_FRC2);

    TIMER_FRC1_CTRL_REG |= TIMER_CTRL_RUN;
    TIMER_FRC2_CTRL_REG |= TIMER_CTRL_RUN;

    dump_timer_regs("timer regs during user_init");
    dump_timer_regs("#2 timer regs during user_init");
    dump_timer_regs("#3 timer regs during user_init");
}

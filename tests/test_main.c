#include "testcase.h"
#include <stdlib.h>
#include <esp/uart.h>

/* Linker sets up these pointers to the registered test cases */
extern const testcase_t _testcases_start;
extern const testcase_t _testcases_end;

/* Convert requirement enum to a string we can print */
static const char *get_requirements_name(const testcase_type_t arg) {
    switch(arg) {
    case SOLO:
        return "SOLO";
    case DUAL:
        return "DUAL";
    case EYORE_TEST:
        return "EYORE_TEST";
    default:
        return "UNKNOWN";
    }
}

void user_init(void)
{
    const testcase_t *cases_start = &_testcases_start;
    const testcase_t *cases_end= &_testcases_end;
    uart_set_baud(0, 115200);
    printf("esp-open-rtos test runner.\n");
    printf("testcases_start %p testcases_end %p\n", cases_start, cases_end);
    printf("%d test cases are defined:\n\n", cases_end-cases_start);
    for(const testcase_t *icase=cases_start; icase != cases_end; icase++) {
        printf("CASE %d = %s %s\n", icase-cases_start, icase->name, get_requirements_name(icase->type));
    }

    printf("Enter A or B then number of test case to run, ie A0.\n");
    int case_idx = -1;
    char type;
    do {
        printf("> ");
        uart_rxfifo_wait(0,1);
        type = uart_getc(0);
        if(type != 'a' && type != 'A' && type != 'b' && type != 'B') {
            printf("Type must be A or B.\n");
            continue;
        }

        char idx_buf[6];
        for(int c = 0; c < sizeof(idx_buf); c++) {
            uart_rxfifo_wait(0,1);
            idx_buf[c] = uart_getc(0);
            if(idx_buf[c] == ' ') { /* Ignore spaces */
                c--;
                continue;
            }
            if(idx_buf[c] == '\r' || idx_buf[c] == '\n') {
                idx_buf[c] = 0;
                case_idx = atoi(idx_buf);
                break;
            }
            else if(idx_buf[c] < '0' || idx_buf[c] > '9') {
                break;
            }
        }

        if(case_idx == -1) {
            printf("Invalid case index");
        }
        else if(case_idx < 0 || case_idx >= cases_end-cases_start) {
            printf("Test case index out of range.\n");
        }
        else if((type == 'b' || type =='B') && cases_start[case_idx].type == SOLO) {
            printf("No ESP type B for 'SOLO' test cases.\n");
        } else {
            break;
        }
    } while(1);
    if(type =='a')
        type = 'A';
    else if (type == 'b')
        type = 'B';
    const testcase_t *tcase = &cases_start[case_idx];
    printf("\nRunning test case %d (%s %s) as instance %c \nDefinition at %s:%d\n***\n", case_idx,
           tcase->name, get_requirements_name(tcase->type), type,
           tcase->file, tcase->line);
    Unity.CurrentTestName = tcase->name;
    Unity.TestFile = tcase->file;
    Unity.CurrentTestLineNumber = tcase->line;
    Unity.NumberOfTests = 1;
    if(type=='A')
        cases_start[case_idx].a_fn();
    else
        cases_start[case_idx].b_fn();
    TEST_FAIL_MESSAGE("\n\nTest initialisation routine returned without calling TEST_PASS. Buggy test?");
}

/* testcase_register is a no-op function, we just need it so the linker
   knows to pull in the argument at link time.
 */
void testcase_register(const testcase_t __attribute__((unused)) *ignored)
{

}

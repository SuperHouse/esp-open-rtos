#ifndef _TESTCASE_H
#define _TESTCASE_H
#include <stdbool.h>
#include <stdio.h>
#include "esp/uart.h"

/* Types of test, defined by hardware requirements */
typedef enum {
    SOLO,        /* Test require "ESP A" only, no other connections */
    DUAL,        /* Test requires "ESP A" and "ESP "B", basic interconnections between them */
    EYORE_TEST,  /* Test requires an eyore-test board with onboard STM32F0 */
} testcase_type_t;

typedef bool (testcase_fn_t)(void);

typedef struct {
    char *name;
    testcase_type_t type;
    testcase_fn_t *a_fn;
    testcase_fn_t *b_fn;
} testcase_t;


/* Register a test case using these macros. Use DEFINE_SOLO_TESTCASE for single-MCU tests,
   and DEFINE_TESTCASE for all other test types.
 */
#define DEFINE_SOLO_TESTCASE(NAME)                                            \
    static testcase_fn_t a_##NAME;                                          \
    const __attribute__((section(".testcases.text"))) __attribute__((used)) \
    testcase_t testcase_##NAME = { .name = #NAME, .type = SOLO, .a_fn = a_##NAME };


#define DEFINE_TESTCASE(NAME, TYPE)                                            \
    static testcase_fn_t a_##NAME;                                          \
    static testcase_fn_t b_##NAME;                                          \
    const __attribute__((section(".testcases.text"))) __attribute__((used)) \
    testcase_t testcase_##NAME = { .name = #NAME, .type = TYPE, .a_fn = a_##NAME, .b_fn = b_##NAME };


#endif

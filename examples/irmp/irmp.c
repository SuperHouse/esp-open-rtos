#include "espressif/esp_common.h"
#include "FreeRTOS.h"
#include "task.h"
#include "esp/uart.h"
#include "irmp/irmp.h"
#include <ssid_config.h>

void print_ir(void *pvParameters) {
  IRMP_DATA  irmp_data;

  for (;;){
    if (irmp_get_data (&irmp_data)){
      printf("protocol: 0x%x", irmp_data.protocol);

      #if IRMP_PROTOCOL_NAMES == 1
        printf("   %s", irmp_protocol_names[irmp_data.protocol]);
      #endif
      printf("   address: 0x%x", irmp_data.address);
      printf("   command: 0x%x", irmp_data.command);
      printf("   flags: 0x%x", irmp_data.flags);  
      printf("\r\n");
    }
  }
}

void user_init(void) {
  uart_set_baud(0, 115200);

  _xt_isr_attach(INUM_TIMER_FRC1, (_xt_isr)irmp_ISR);
  timer_set_frequency(FRC1, F_INTERRUPTS); // 15KHz ~66.6uS
  timer_set_interrupts(FRC1, true);
  timer_set_run(FRC1, true);

  irmp_init();
  printf("F_INTERRUPTS==%d\n",F_INTERRUPTS);

  xTaskCreate(&print_ir, "print_ir", 256, NULL, 2, NULL);
}


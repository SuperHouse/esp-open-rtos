/*
 * Example code to test i2c link
 */
/////////////////////////////////Lib
#include "espressif/esp_common.h"
#include "esp/uart.h"
#include "FreeRTOS.h"
#include "task.h"
#include "esp8266.h"

//extras
#include "crc_config_perso.h"

unsigned char check_data[] = { "123456789" };

void crc_8bit(void *pvParameters) {

    config_crc_8 customcrc ; // my crc object
    crc_8 tabsrc[256]; // my crc kook-up table

    crc_8_generic_init(&customcrc,0x31, 8, 0x00, 0x00, 1, 1, 1);

    // Use table algorithm / generate table
    crc_8_generic_select_algo(&customcrc, tabsrc, CRC_TABLE, 0);

    //show table
    printf("tabsrc[256]  = {");
    for (crc_16 i = 0 ; i < 256 ; i++)
    {
        if(!(i%8)) printf("\n");
        printf("0x%02X, ",tabsrc[i]);
    }
    printf("\n};\n");

    //show setting of crc
    printf("CRC library v1.0 written on 11/02/2017 by Zaltora\n");
    printf("-------------------------------------------------\n");
    printf("\n");
    printf("Parameters:\n");
    printf("\n");
    printf(" polynom     :  0x%02X\n", customcrc.polynom);
    printf(" order       :  %d\n", customcrc.order);
    printf(" crcinit     :  0x%02X direct, 0x%x nondirect\n", customcrc.private.crcinit_direct, customcrc.private.crcinit_nondirect);
    printf(" crcxor      :  0x%02X\n", customcrc.crcxor);
    printf(" refin       :  %d\n", customcrc.refin);
    printf(" refout      :  %d\n", customcrc.refout);
    printf("\n");
    printf("check_data   :  '%s' (%d bytes)\n", check_data, sizeof(check_data));
    printf("\n");
    printf("Results:\n");
    printf("\n");

    crc_8_generic_select_algo(&customcrc, (crc_8*)tabsrc, CRC_TABLE, 0);
    printf("CRC_TABLE\t\t: 0x%02X\n", crc_8_generic_compute(&customcrc, check_data, sizeof(check_data)));
    crc_8_generic_select_algo(&customcrc, (crc_8*)tabsrc, CRC_TABLE_FAST, 0);
    printf("CRC_TABLE_FAST\t\t: 0x%02X\n", crc_8_generic_compute(&customcrc, check_data, sizeof(check_data)));
    crc_8_generic_select_algo(&customcrc, NULL, CRC_BIT_TO_BIT, 0);
    printf("CRC_BIT_TO_BIT\t\t: 0x%02X\n", crc_8_generic_compute(&customcrc, check_data, sizeof(check_data)));
    crc_8_generic_select_algo(&customcrc, NULL, CRC_BIT_TO_BIT_FAST, 0);
    printf("CRC_BIT_TO_BIT_FAST\t: 0x%02X\n", crc_8_generic_compute(&customcrc, check_data, sizeof(check_data)));
    crc_8_generic_select_algo(&customcrc, (crc_8*)crc_8_tab_MAXIM, CRC_TABLE_FAST, 1);
    printf("CRC_TABLE_BUILTIN\t\t: 0x%02X\n", crc_8_generic_compute(&customcrc, check_data, sizeof(check_data)));

    vTaskDelay(2000 / portTICK_PERIOD_MS) ;

    while (1) {

        vTaskDelay(1000 / portTICK_PERIOD_MS) ;
    }
}

void  user_init(void)
{
	sdk_system_update_cpu_freq(160);

	uart_set_baud(0, 115200);
	printf("SDK version:%s\n", sdk_system_get_sdk_version());
	printf("Start\n\n");

	xTaskCreate(crc_8bit, "crc_8bit", 512, NULL, 2, NULL);

}

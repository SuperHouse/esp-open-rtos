
#include "uart_cmds.h"
#include <stdint.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <esp8266.h>
#include <esp/uart.h>
#include <stdio.h>
#include "FreeRTOS.h"
#include "task.h"

ATCA_STATUS cmd_ecdh(uint32_t argc, char *argv[])
{
    ATCA_STATUS status;
    if (argc >= 2) {
        uint8_t slot_num = atoi(argv[1]);
        if (slot_num > 0x7){
            LOG("Invalid slot number %d; must be between 0 and 7 for private keys", slot_num);
            return ATCA_BAD_PARAM;
        }

        printf("Performing ECDH key exchange in slot %d\n", slot_num);
        uint8_t pubkeybytes[100];
        int pubkeylen = sizeof(pubkeybytes);
        status = read_pubkey_stdin(pubkeybytes, &pubkeylen);
        if (status != ATCA_SUCCESS)
        {
            RETURN(status, "Failed to read public key");
        }

        LOG("Got valid looking pubkey; does this look correct?");
        uint8_t *keyptr = pubkeybytes + (pubkeylen - ATCA_PUB_KEY_SIZE);
        atcab_printbin_label((const uint8_t*)"pubkey ", keyptr, ATCA_PUB_KEY_SIZE);

        if (!prompt_user()) {
            printf("Aborting\n");
        }else{
            printf("Performing ECDH key exchange\n");
        }

        // Write key to device
        uint8_t pmk[ATCA_PRIV_KEY_SIZE];
        status = atcab_ecdh(slot_num, keyptr, pmk);
        if(status != ATCA_SUCCESS){
            RETURN(status, "Failed to obtain pre-master key");
        }
        atcab_printbin_label((const uint8_t*)"pmk ", pmk, ATCA_PRIV_KEY_SIZE);
        
        return ATCA_SUCCESS;
    } else {
        printf("Error: missing slot number.\n");
        return ATCA_BAD_PARAM;
    }
}

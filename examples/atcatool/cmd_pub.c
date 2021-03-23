
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

// get cert and priv key
//> openssl req -new -x509 -nodes -newkey ec:<(openssl ecparam -name secp256r1) -keyout cert.key -out cert.crt -days 3650
// get pub key
//> openssl x509 -in cert.crt -pubkey -noout > pubkey.pem

ATCA_STATUS cmd_pub(uint32_t argc, char *argv[])
{
    ATCA_STATUS status;
    if (argc >= 2) {
        uint8_t slot_num = atoi(argv[1]);
        if (slot_num < 0x8 || slot_num > 0xF){
            LOG("Invalid slot number %d; must be between 8 and 15 for public keys", slot_num);
            return ATCA_BAD_PARAM;
        }

        printf("Programming public key in slot %d\n", slot_num);
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
            printf("Writing key\n");
        }

        // Write key to device
        status = atcab_write_pubkey(slot_num, keyptr);
        if(status != ATCA_SUCCESS){
            RETURN(status, "Failed to write key to slot");
        }

        return ATCA_SUCCESS;
    } else {
        printf("Error: missing slot number.\n");
        return ATCA_BAD_PARAM;
    }
}


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

//#define PEM_PRIV_KEY_OFFSET 5
#define PEM_PRIV_KEY_OFFSET 7

ATCA_STATUS cmd_priv(uint32_t argc, char *argv[])
{
    ATCA_STATUS status;
    if (argc >= 2) {
        uint8_t slot_num = atoi(argv[1]);
        if (slot_num > 0x7){
            LOG("Invalid slot number %d; must be between 0 and 7 for private keys", slot_num);
            return ATCA_BAD_PARAM;
        }

        uint8_t write_key_slot = 0;
        uint8_t *write_key = NULL;
        uint8_t random_num[RANDOM_NUM_SIZE];
        if (argc >= 3) {
            write_key_slot = atoi(argv[2]);
            if (write_key_slot == slot_num || write_key_slot < 0x0 || write_key_slot > 0xF) {
                LOG("Invalid slot for write key (%d); trying unencrypted write", (int)write_key_slot);
                write_key_slot = 0;
                write_key = NULL;
            } else {
                LOG("Writing write key to slot %d", (int)write_key_slot);
                if((status = atcab_random(random_num)) != ATCA_SUCCESS){
                    RETURN(status, "Could not make random number");
                }
                write_key = random_num;
                if((status = atcab_write_bytes_zone(ATCA_ZONE_DATA, write_key_slot, 0, write_key, RANDOM_NUM_SIZE)) != ATCA_SUCCESS){
                    RETURN(status, "Could not commit write key");
                }
            }
        }

        printf("Programming private key in slot %d\n", slot_num);
        uint8_t privkeybytes[200];
        int privkeylen = sizeof(privkeybytes);
        status = read_privkey_stdin(privkeybytes, &privkeylen);
        if (status != ATCA_SUCCESS)
        {
            RETURN(status, "Failed to read private key");
        }

        LOG("Got valid looking private key; does this look correct?");
        uint8_t *keyptr = privkeybytes + PEM_PRIV_KEY_OFFSET;
        atcab_printbin_label((const uint8_t*)"privkey ", keyptr, ATCA_PRIV_KEY_SIZE);

        if (!prompt_user()) {
            printf("Aborting\n");
            return ATCA_SUCCESS;
        }else{
            printf("Writing key\n");
        }

        // Write key to device
        uint8_t priv_key[ATCA_PRIV_KEY_SIZE + 4] = {0};
        memcpy(priv_key + 4, keyptr, ATCA_PRIV_KEY_SIZE);
        status = atcab_priv_write(slot_num, priv_key, write_key_slot, write_key);
        if(status != ATCA_SUCCESS){
            RETURN(status, "Failed to write key to slot");
        }

        // Read public key
        uint8_t pub_key[ATCA_PUB_KEY_SIZE] = {0};
        if((status = atcab_get_pubkey(slot_num, pub_key)) != ATCA_SUCCESS){
            RETURN(status, "Could not get public key");
        }
        atcab_printbin_label((const uint8_t*)"pubkey ", pub_key, sizeof(pub_key));

        return ATCA_SUCCESS;
    } else {
        printf("Error: missing slot number.\n");
        return ATCA_BAD_PARAM;
    }
}

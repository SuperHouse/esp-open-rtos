
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

// make test hash
//> openssl sha -sha256 cmd_pub.c
// sign test hash
//> openssl sha -sha256 -sign cert.key -hex cmd_pub.c

void get_line(char *buf, size_t buflen)
{
    char ch;
    char cmd[200];
    int i = 0;
    while(1) {
        if (read(0, (void*)&ch, 1)) { // 0 is stdin
            printf("%c", ch);
            if (ch == '\n' || ch == '\r') {
                cmd[i] = 0;
                i = 0;
                printf("\n");
                strcpy(buf, cmd);
                return;
            } else {
                if (i < sizeof(cmd)) cmd[i++] = ch;
            }
        }    
    }
}

ATCA_STATUS cmd_verify(uint32_t argc, char *argv[])
{
    ATCA_STATUS status;
    if (argc >= 2) {
        uint8_t slot_num = atoi(argv[1]);
        if (slot_num < 0x8 || slot_num > 0xF){
            LOG("Invalid slot number %d; must be between 8 and 15 for public keys", slot_num);
            return ATCA_BAD_PARAM;
        }

        printf("Verifying with public key in slot %d\n", slot_num);
        char hash[100]; uint8_t hashbin[100]; int hashlen = sizeof(hashbin);
        char sig[200];  uint8_t sigbin[200];  int siglen = sizeof(sigbin);

        printf("Please paste hash in the terminal (hex format)\n");
        get_line(hash, sizeof(hash));

        status = atcab_hex2bin(hash, strlen(hash), hashbin, &hashlen);
        if(status != ATCA_SUCCESS){
            RETURN(status, "Could not parse hash hex");
        }

        printf("Please paste signature in the terminal (hex format)\n");
        get_line(sig, sizeof(sig));

        status = atcab_hex2bin(sig, strlen(sig), sigbin, &siglen);
        if(status != ATCA_SUCCESS){
            RETURN(status, "Could not parse signature hex");
        }

        bool isVerified = false;
        printf("Trying to verify with\n");
        atcab_printbin_label((const uint8_t*)"hash ", hashbin, hashlen);
        printf("Len %d\n", hashlen);
        atcab_printbin_label((const uint8_t*)"sig ", sigbin, siglen);
        printf("Len %d\n", siglen);

        uint8_t atca_sig[ATCA_SIG_SIZE] = {0};
        if(!parse_asn1_signature(sigbin, siglen, atca_sig))
        {
            RETURN(ATCA_PARSE_ERROR, "Could not parse ASN.1 signature");
        }
        
        atcab_printbin_label((const uint8_t*)"atca_sig ", atca_sig, ATCA_SIG_SIZE);
        printf("Len %d\n", ATCA_SIG_SIZE);

        status = atcab_verify_stored(hashbin, atca_sig, slot_num, &isVerified);
        if(status != ATCA_SUCCESS){
            RETURN(status, "Could not verify signature");
        }

        printf(isVerified ? "Signature is valid\n" : "Signature is invalid\n");
        RETURN(status, "Done");
    } else {
        printf("Error: missing slot number.\n");
        return ATCA_BAD_PARAM;
    }
}

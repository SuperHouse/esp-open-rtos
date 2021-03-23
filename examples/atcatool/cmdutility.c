
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

#define RETURN_BOOL(result, message) {printf(": " message "\r\n"); return result;}

ATCA_STATUS read_key_stdin(const char* beginConst, const char* endConst, uint8_t *keyOut, int *len)
{
    printf("Please paste key in the terminal (PEM format)\n");

    char ch;
    char cmd[81];
    int i = 0;
    bool done = false;
    uint8_t keybuf[1000] = {0}; // max buffer we should need
    int buf_used = 0;
    while (!done && buf_used < (sizeof(keybuf) - 1))
    {
        if (read(0, (void *)&ch, 1))
        { // 0 is stdin
            printf("%c", ch);
            if (ch == '\n' || ch == '\r')
            {
                cmd[i] = 0;
                printf("\n");
                // check for end of public key
                if (!strcmp(endConst, cmd))
                {
                    done = true;
                    printf("Got end of public key\n");
                }
                else if (strcmp(beginConst, cmd))
                {
                    // only copy non-marker text
                    strcat((char *)keybuf, cmd);
                    buf_used += i;
                }
                i = 0;
            }
            else
            {
                if (i < sizeof(cmd))
                    cmd[i++] = ch;
            }
        }
    }

    // Try to parse
    uint8_t keybytes[(sizeof(keybuf) * 3) / 4];
    size_t arrayLen = sizeof(keybytes);
    ATCA_STATUS status = atcab_base64decode((const char *)keybuf, sizeof(keybuf), keybytes, &arrayLen);
    if(status != ATCA_SUCCESS)
    {
        RETURN(status, "Error decoding base64 public key");
    } 
    else if (arrayLen > *len)
    {
        LOG("Key was the wrong size (%d); expected at most %d", arrayLen, *len);
        atcab_printbin_label((const uint8_t*)"decoded ", keybytes, arrayLen);
        return ATCA_BAD_PARAM;
    }

    memcpy(keyOut, keybytes, arrayLen);
    *len = arrayLen;
    return ATCA_SUCCESS;
}

ATCA_STATUS read_pubkey_stdin(uint8_t *keyOut, int *len)
{
    return read_key_stdin(BEGIN_PUB_KEY_CONST, END_PUB_KEY_CONST, keyOut, len);
}

ATCA_STATUS read_privkey_stdin(uint8_t *keyOut, int *len)
{
    return read_key_stdin(BEGIN_PRIV_KEY_CONST, END_PRIV_KEY_CONST, keyOut, len);
}

bool prompt_user()
{
    printf("(y/n)\n");
    char ch = 0;
    while(ch != 'y' && ch != 'n') {
        if (read(0, (void*)&ch, 1)) { // 0 is stdin
            //NOP
        }
    }
    
    return ch == 'y';
}

bool parse_asn1_signature(uint8_t *asn1Sig, size_t asn1SigLen, uint8_t signatureRintSintOUT[ATCA_SIG_SIZE])
{
    if (asn1Sig == NULL || asn1SigLen < sizeof(signatureRintSintOUT)) return false;

    // Parse ASN.1.  We expect the following output:
    // 0x30 0xXX  <--0x30 = sequence; 0xXX num bytes in sequence
    // 0x02 0xYY  <--0x02 = integer (R); 0xYY num bytes in R integer (2's complement)
    // ...  ...   <-- YY bytes of R integer
    // 0x02 0xZZ  <--0x02 = integer (S); 0xZZ num bytes in S integer (2's complement)
    // ...  ...   <-- ZZ bytes of S integer
    const uint8_t halfSigSize = ATCA_SIG_SIZE / 2;
    uint8_t *atca_sig_ptr = signatureRintSintOUT;
    if (asn1Sig[0] != 0x30)
    { // sequence
        RETURN_BOOL(false, "Expected sequence code (0x30) at position 0");
    }
    uint8_t seq_len = asn1Sig[1];
    if (seq_len < ATCA_SIG_SIZE)
    { // sanity check
        RETURN_BOOL(false, "Sequence does not seem to be long enough for a signature");
    }
    if (asn1Sig[2] != 0x02)
    { // integer
        RETURN_BOOL(false, "Expected integer code (0x02) at position 2 (R integer)");
    }
    // Get R integer
    uint8_t r_len = asn1Sig[3];
    uint8_t *int_ptr = &asn1Sig[4];
    if (r_len < halfSigSize)
    {
        atca_sig_ptr += (halfSigSize - r_len);
    }
    else if (r_len > halfSigSize)
    {
        int_ptr += (r_len - halfSigSize);
        r_len = halfSigSize;
    }
    memcpy(atca_sig_ptr, int_ptr, r_len); // <--insert R integer into output
    atca_sig_ptr += r_len;
    int_ptr += r_len;
    // more checks
    if (*int_ptr++ != 0x02)
    { // integer
        RETURN_BOOL(false, "Expected integer code (0x02) at next position (S integer)");
    }
    // Get S integer
    uint8_t s_len = *int_ptr++;
    if (s_len < halfSigSize)
    {
        atca_sig_ptr += (halfSigSize - s_len);
    }
    else if (s_len > halfSigSize)
    {
        int_ptr += (s_len - halfSigSize);
        s_len = halfSigSize;
    }
    memcpy(atca_sig_ptr, int_ptr, s_len); // <--insert S integer into output
    return true;
}

void print_b64_pubkey(uint8_t pubkey[ATCA_PUB_KEY_SIZE])
{
    char b64pubkey[100] = {0};
    size_t b64len = sizeof(b64pubkey);  
    atcab_base64encode(pubkey, ATCA_PUB_KEY_SIZE, b64pubkey, &b64len);
    printf(BEGIN_PUB_KEY_CONST"\r\n");
    printf(b64pubkey);
    printf("\r\n"END_PUB_KEY_CONST"\r\n");
}

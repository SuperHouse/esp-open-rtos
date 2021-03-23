/* pubkeyprog
 * Program public keys in the ATCA over UART
 * UART RX is interrupt driven
 */

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

#include "i2c/i2c.h"
#include "cryptoauthlib_init.h"
#include <cryptoauthlib.h>

#include "uart_cmds.h"

static ATCA_STATUS cmd_cfg(uint32_t argc, char *argv[])
{
    uint8_t configData[ATCA_ECC_CONFIG_SIZE];
    ATCA_STATUS status = atcab_read_config_zone(configData);
    if(status != ATCA_SUCCESS)
    {
        RETURN(status, "Failed to retrieve config data");
    }

    printf("Got config data:\n");
    atcab_printbin(configData, sizeof(configData), true);
    RETURN(status, "Done");
}

static ATCA_STATUS cmd_otp(uint32_t argc, char *argv[])
{
    uint8_t otpData[ATCA_OTP_SIZE];
    ATCA_STATUS status = atcab_read_bytes_zone(ATCA_ZONE_OTP, 0, 0, otpData, sizeof(otpData));
    if(status != ATCA_SUCCESS)
    {
        RETURN(status, "Failed to retrieve OTP data");
    }

    printf("Got OTP data:\n");
    atcab_printbin(otpData, sizeof(otpData), true);
    RETURN(status, "Done");
}

// Copied from unit tests
uint8_t test_ecc_configdata[ATCA_ECC_CONFIG_SIZE] = {
    0x01, 0x23, 0x00, 0x00, 0x00, 0x00, 0x50, 0x00,  0x04, 0x05, 0x06, 0x07, 0xEE, 0x00, 0x01, 0x00,
    0xC0, 0x00, 0x55, 0x00, 0x8F, 0x2F, 0xC4, 0x44,  0x87, 0x20, 0xC4, 0xF4, 0x8F, 0x0F, 0x8F, 0x8F,
    0x9F, 0x8F, 0x83, 0x64, 0xC4, 0x44, 0xC4, 0x64,  0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F,
    0x0F, 0x0F, 0x0F, 0x0F, 0xFF, 0xFF, 0xFF, 0xFF,  0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF,
    0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF,  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
    0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00,  0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x33, 0x00, 0x1C, 0x00, 0x13, 0x00, 0x1C, 0x00,  0x3C, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x33, 0x00,
    0x1C, 0x00, 0x1C, 0x00, 0x3C, 0x00, 0x30, 0x00,  0x3C, 0x00, 0x3C, 0x00, 0x32, 0x00, 0x30, 0x00
};
uint8_t g_otp_data[ATCA_OTP_SIZE] = "This is test data that can be read back out of the chip!huzzah!";

static ATCA_STATUS cmd_cfgwrite(uint32_t argc, char *argv[])
{
    ATCA_STATUS status = atcab_write_config_zone(test_ecc_configdata);    
    if(status != ATCA_SUCCESS)
    {
        RETURN(status, "Failed to write ECC config data");
    }
    
    RETURN(status, "Done");
}

static ATCA_STATUS cmd_otpwrite(uint32_t argc, char *argv[])
{
    ATCA_STATUS status = atcab_write_bytes_zone(ATCA_ZONE_OTP, 0, 0, g_otp_data, ATCA_OTP_SIZE);
    if(status != ATCA_SUCCESS)
    {
        RETURN(status, "Failed to write OTP data");
    }
    
    RETURN(status, "Done");
}

static ATCA_STATUS cmd_cfglock(uint32_t argc, char *argv[])
{
    ATCA_STATUS status = atcab_lock_config_zone();
    if (status != ATCA_SUCCESS)
    {
        printf("Failed!\n");
    }

    printf("Config Locked!\n");
    RETURN(status, "Done");
}

static ATCA_STATUS cmd_otplock(uint32_t argc, char *argv[])
{
    ATCA_STATUS status = atcab_lock_data_zone();
    if (status != ATCA_SUCCESS)
    {
        printf("Failed!\n");
    }

    printf("OTP Locked!\n");
    RETURN(status, "Done");
}

static ATCA_STATUS cmd_gen(uint32_t argc, char *argv[])
{
    ATCA_STATUS status;
    if (argc >= 2) {
        uint8_t slot_num = atoi(argv[1]);
        if (slot_num > 0x7){
            LOG("Invalid slot number %d; must be between 0 and 7 for private keys", slot_num);
            return ATCA_BAD_PARAM;
        }

        uint8_t pubkey[ATCA_PUB_KEY_SIZE] = {0};
        if ((status = atcab_genkey(slot_num, pubkey)) != ATCA_SUCCESS){
            RETURN(status, "Could not generate private key");
        }

        atcab_printbin_label("publickey ", pubkey, sizeof(pubkey));
        print_b64_pubkey(pubkey);
        RETURN(status, "Done");
    } else {
        printf("Error: missing slot number.\n");
        return ATCA_BAD_PARAM;
    }
}

static ATCA_STATUS cmd_getpub(uint32_t argc, char *argv[])
{
    ATCA_STATUS status;
    if (argc >= 2) {
        uint8_t slot_num = atoi(argv[1]);
        if (slot_num > 0x7){
            LOG("Invalid slot number %d; must be between 0 and 7 for private keys", slot_num);
            return ATCA_BAD_PARAM;
        }

        uint8_t pubkey[ATCA_PUB_KEY_SIZE] = {0};
        if ((status = atcab_get_pubkey(slot_num, pubkey)) != ATCA_SUCCESS){
            RETURN(status, "Could not read/generate public key");
        }

        atcab_printbin_label("publickey ", pubkey, sizeof(pubkey));
        print_b64_pubkey(pubkey);
        RETURN(status, "Done");
    } else {
        printf("Error: missing slot number.\n");
        return ATCA_BAD_PARAM;
    }
}

static void cmd_help(uint32_t argc, char *argv[])
{
    printf("pub <slot number>                      Program public key to a slot\n");
    printf("priv <slot number> [slot number]       Program private key to a slot using optional write key\n");
    printf("cfg                                    Dump config\n");
    printf("otp                                    Dump OTP zone\n");
    printf("verify <slot number>                   Verify signature with public key in slot\n");
    printf("cfgwrite                               Write test configuration\n");
    printf("otpwrite                               Write test OTP\n");
    printf("cfglock                                Lock config zone (not reversible!)\n");
    printf("otplock                                Lock OTP zone (not reversible!)\n");
    printf("gen <slot number>                      Generate private key in a slot\n");
    printf("getpub <slot number>                   Read/gen a public key from a private key slot\n");
    printf("ecdh <slot number>                     Perform ECDH key exchange in slot\n");
    printf("\nExample:\n");
    printf("  pub 12<enter> initiates public key programming in slot 12\n");
}

static void handle_command(char *cmd)
{
    char *argv[MAX_ARGC];
    int argc = 1;
    char *temp, *rover;
    memset((void*) argv, 0, sizeof(argv));
    argv[0] = cmd;
    rover = cmd;
    // Split string "<command> <argument 1> <argument 2>  ...  <argument N>"
    // into argv, argc style
    while(argc < MAX_ARGC && (temp = strstr(rover, " "))) {
        rover = &(temp[1]);
        argv[argc++] = rover;
        *temp = 0;
    }

    if (strlen(argv[0]) > 0) {
        if (strcmp(argv[0], "help") == 0) cmd_help(argc, argv);
        else if (strcmp(argv[0], "pub") == 0) cmd_pub(argc, argv);
        else if (strcmp(argv[0], "priv") == 0) cmd_priv(argc, argv);
        else if (strcmp(argv[0], "cfg") == 0) cmd_cfg(argc, argv);
        else if (strcmp(argv[0], "otp") == 0) cmd_otp(argc, argv);
        else if (strcmp(argv[0], "verify") == 0) cmd_verify(argc, argv);
        else if (strcmp(argv[0], "cfgwrite") == 0) cmd_cfgwrite(argc, argv);
        else if (strcmp(argv[0], "otpwrite") == 0) cmd_otpwrite(argc, argv);
        else if (strcmp(argv[0], "cfglock") == 0) cmd_cfglock(argc, argv);
        else if (strcmp(argv[0], "otplock") == 0) cmd_otplock(argc, argv);
        else if (strcmp(argv[0], "gen") == 0) cmd_gen(argc, argv);
        else if (strcmp(argv[0], "getpub") == 0) cmd_getpub(argc, argv);
        else if (strcmp(argv[0], "ecdh") == 0) cmd_ecdh(argc, argv);
        else printf("Unknown command %s, try 'help'\n", argv[0]);
    }
}

void pubkeyprog_task(void *pvParameters)
{
    char ch;
    char cmd[81];
    int i = 0;

    init_cryptoauthlib(0x60);    

    printf("\n\n\nWelcome to atcatool. Type 'help<enter>' for, well, help\n");
    printf("%% ");
    while(1) {
        if (read(0, (void*)&ch, 1)) { // 0 is stdin
            printf("%c", ch);
            if (ch == '\n' || ch == '\r') {
                cmd[i] = 0;
                i = 0;
                printf("\n");
                handle_command((char*) cmd);
                printf("%% ");
            } else {
                if (i < sizeof(cmd)) cmd[i++] = ch;
            }
        }
    }
}

#define I2C_BUS (0)
#define SDA_PIN (4)
#define SCL_PIN (5)

void user_init(void)
{
    uart_set_baud(0, 115200);
    i2c_init(I2C_BUS, SCL_PIN, SDA_PIN, I2C_FREQ_500K);
    xTaskCreate(&pubkeyprog_task, "pubkeyprog_task", 2048, NULL, 2, NULL);
}

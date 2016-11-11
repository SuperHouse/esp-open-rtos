/* http_get_mbedtls - HTTPS version of the http_get example, using mbed TLS.
 *
 * Retrieves a JSON response from the howsmyssl.com API via HTTPS over TLS v1.2.
 *
 * Validates the server's certificate using the root CA loaded (in PEM format) in cert.c.
 *
 * Adapted from the ssl_client1 example in mbedtls.
 *
 * Original Copyright (C) 2006-2015, ARM Limited, All Rights Reserved, Apache 2.0 License.
 * Additions Copyright (C) 2015 Angus Gratton, Apache 2.0 License.
 */
#include "espressif/esp_common.h"
#include "esp/uart.h"
#include "esp/hwrand.h"

#include <string.h>

#include "FreeRTOS.h"
#include "task.h"

#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include "lwip/netdb.h"
#include "lwip/dns.h"
#include "lwip/api.h"

#include "ssid_config.h"

#include "bearssl.h"

#define WEB_SERVER "www.howsmyssl.com"
#define WEB_PORT "443"
#define WEB_URL "https://www.howsmyssl.com/a/check"

#define GET_REQUEST "GET "WEB_URL" HTTP/1.1\nHost: "WEB_SERVER"\n\n"

static const unsigned char TA0_DN[] = {
        0x30, 0x1C, 0x31, 0x0B, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13,
        0x02, 0x43, 0x41, 0x31, 0x0D, 0x30, 0x0B, 0x06, 0x03, 0x55, 0x04, 0x03,
        0x13, 0x04, 0x52, 0x6F, 0x6F, 0x74
};

static const unsigned char TA0_RSA_N[] = {
        0xB6, 0xD9, 0x34, 0xD4, 0x50, 0xFD, 0xB3, 0xAF, 0x7A, 0x73, 0xF1, 0xCE,
        0x38, 0xBF, 0x5D, 0x6F, 0x45, 0xE1, 0xFD, 0x4E, 0xB1, 0x98, 0xC6, 0x60,
        0x83, 0x26, 0xD2, 0x17, 0xD1, 0xC5, 0xB7, 0x9A, 0xA3, 0xC1, 0xDE, 0x63,
        0x39, 0x97, 0x9C, 0xF0, 0x5E, 0x5C, 0xC8, 0x1C, 0x17, 0xB9, 0x88, 0x19,
        0x6D, 0xF0, 0xB6, 0x2E, 0x30, 0x50, 0xA1, 0x54, 0x6E, 0x93, 0xC0, 0xDB,
        0xCF, 0x30, 0xCB, 0x9F, 0x1E, 0x27, 0x79, 0xF1, 0xC3, 0x99, 0x52, 0x35,
        0xAA, 0x3D, 0xB6, 0xDF, 0xB0, 0xAD, 0x7C, 0xCB, 0x49, 0xCD, 0xC0, 0xED,
        0xE7, 0x66, 0x10, 0x2A, 0xE9, 0xCE, 0x28, 0x1F, 0x21, 0x50, 0xFA, 0x77,
        0x4C, 0x2D, 0xDA, 0xEF, 0x3C, 0x58, 0xEB, 0x4E, 0xBF, 0xCE, 0xE9, 0xFB,
        0x1A, 0xDA, 0xA3, 0x83, 0xA3, 0xCD, 0xA3, 0xCA, 0x93, 0x80, 0xDC, 0xDA,
        0xF3, 0x17, 0xCC, 0x7A, 0xAB, 0x33, 0x80, 0x9C, 0xB2, 0xD4, 0x7F, 0x46,
        0x3F, 0xC5, 0x3C, 0xDC, 0x61, 0x94, 0xB7, 0x27, 0x29, 0x6E, 0x2A, 0xBC,
        0x5B, 0x09, 0x36, 0xD4, 0xC6, 0x3B, 0x0D, 0xEB, 0xBE, 0xCE, 0xDB, 0x1D,
        0x1C, 0xBC, 0x10, 0x6A, 0x71, 0x71, 0xB3, 0xF2, 0xCA, 0x28, 0x9A, 0x77,
        0xF2, 0x8A, 0xEC, 0x42, 0xEF, 0xB1, 0x4A, 0x8E, 0xE2, 0xF2, 0x1A, 0x32,
        0x2A, 0xCD, 0xC0, 0xA6, 0x46, 0x2C, 0x9A, 0xC2, 0x85, 0x37, 0x91, 0x7F,
        0x46, 0xA1, 0x93, 0x81, 0xA1, 0x74, 0x66, 0xDF, 0xBA, 0xB3, 0x39, 0x20,
        0x91, 0x93, 0xFA, 0x1D, 0xA1, 0xA8, 0x85, 0xE7, 0xE4, 0xF9, 0x07, 0xF6,
        0x10, 0xF6, 0xA8, 0x27, 0x01, 0xB6, 0x7F, 0x12, 0xC3, 0x40, 0xC3, 0xC9,
        0xE2, 0xB0, 0xAB, 0x49, 0x18, 0x3A, 0x64, 0xB6, 0x59, 0xB7, 0x95, 0xB5,
        0x96, 0x36, 0xDF, 0x22, 0x69, 0xAA, 0x72, 0x6A, 0x54, 0x4E, 0x27, 0x29,
        0xA3, 0x0E, 0x97, 0x15
};

static const unsigned char TA0_RSA_E[] = {
        0x01, 0x00, 0x01
};

static const unsigned char TA1_DN[] = {
        0x30, 0x1C, 0x31, 0x0B, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13,
        0x02, 0x43, 0x41, 0x31, 0x0D, 0x30, 0x0B, 0x06, 0x03, 0x55, 0x04, 0x03,
        0x13, 0x04, 0x52, 0x6F, 0x6F, 0x74
};

static const unsigned char TA1_EC_Q[] = {
        0x04, 0x71, 0x74, 0xBA, 0xAB, 0xB9, 0x30, 0x2E, 0x81, 0xD5, 0xE5, 0x57,
        0xF9, 0xF3, 0x20, 0x68, 0x0C, 0x9C, 0xF9, 0x64, 0xDB, 0xB4, 0x20, 0x0D,
        0x6D, 0xEA, 0x40, 0xD0, 0x4A, 0x6E, 0x42, 0xFD, 0xB6, 0x9A, 0x68, 0x25,
        0x44, 0xF6, 0xDF, 0x7B, 0xC4, 0xFC, 0xDE, 0xDD, 0x7B, 0xBB, 0xC5, 0xDB,
        0x7C, 0x76, 0x3F, 0x41, 0x66, 0x40, 0x6E, 0xDB, 0xA7, 0x87, 0xC2, 0xE5,
        0xD8, 0xC5, 0xF3, 0x7F, 0x8D
};

static const br_x509_trust_anchor TAs[2] = {
        {
                (unsigned char *)TA0_DN, sizeof TA0_DN,
                BR_X509_TA_CA,
                {
                        BR_KEYTYPE_RSA,
                        { .rsa = {
                                (unsigned char *)TA0_RSA_N, sizeof TA0_RSA_N,
                                (unsigned char *)TA0_RSA_E, sizeof TA0_RSA_E,
                        } }
                }
        },
        {
                (unsigned char *)TA1_DN, sizeof TA1_DN,
                BR_X509_TA_CA,
                {
                        BR_KEYTYPE_EC,
                        { .ec = {
                                BR_EC_secp256r1,
                                (unsigned char *)TA1_EC_Q, sizeof TA1_EC_Q,
                        } }
                }
        }
};

#define TAs_NUM 2

/*
 * Low-level data read callback for the simplified SSL I/O API.
 */
static int
sock_read(void *ctx, unsigned char *buf, size_t len)
{
    for (;;) {
        ssize_t rlen;

        rlen = read(*(int *)ctx, buf, len);
        if (rlen <= 0) {
            if (rlen < 0 && errno == EINTR) {
                    continue;
            }
            return -1;
        }
        return (int)rlen;
    }
}

/*
 * Low-level data write callback for the simplified SSL I/O API.
 */
static int
sock_write(void *ctx, const unsigned char *buf, size_t len)
{
    for (;;) {
        ssize_t wlen;

        wlen = write(*(int *)ctx, buf, len);
        if (wlen <= 0) {
            if (wlen < 0 && errno == EINTR) {
                    continue;
            }
            return -1;
        }
        return (int)wlen;
    }
}

// In mono mode, BearSSL requires ~16k of buffer
// TODO: investigate Maximum Fragment Length (RFC 6066) extension
static unsigned char bearssl_buffer[BR_SSL_BUFSIZE_MONO];
static br_ssl_client_context sc;
static br_x509_minimal_context xc;
static br_sslio_context ioc;

void http_get_task(void *pvParameters)
{
    int successes = 0, failures = 0;
    while (1) {
        /* Wait until we can resolve the DNS for the server, as an indication
        our network is probably working...
        */
        const struct addrinfo hints = {
            .ai_family = AF_INET,
            .ai_socktype = SOCK_STREAM,
        };
        struct addrinfo *res = NULL;
        int dns_err = 0;
        do {
            if (res)
                freeaddrinfo(res);
            vTaskDelay(1000 / portTICK_PERIOD_MS);
            dns_err = getaddrinfo(WEB_SERVER, WEB_PORT, &hints, &res);
        } while(dns_err != 0 || res == NULL);

        int fd = socket(res->ai_family, res->ai_socktype, 0);
        if (fd < 0) {
            freeaddrinfo(res);
            printf("socket failed\n");
            failures++;
            continue;
        }

        printf("Initializing BearSSL... ");
        br_ssl_client_init_full(&sc, &xc, TAs, TAs_NUM);
        br_ssl_engine_set_buffer(&sc.eng, bearssl_buffer, sizeof bearssl_buffer, 0);
        // Inject some entropy from the ESP hardware RNG
        // This is necessary because we don't support any of the BearSSL methods
        for (int i = 0; i < 10; i++) {
            int rand = hwrand();
            br_ssl_engine_inject_entropy(&sc.eng, &rand, 4);
        }
        br_ssl_client_reset(&sc, WEB_SERVER, 0);
        br_sslio_init(&ioc, &sc.eng, sock_read, &fd, sock_write, &fd);
        printf("done.\r\n");

        if (connect(fd, res->ai_addr, res->ai_addrlen) != 0)
        {
            close(fd);
            freeaddrinfo(res);
            printf("connect failed\n");
            failures++;
            continue;
        }
        printf("Connected\r\n");

        if (br_sslio_write_all(&ioc, GET_REQUEST, strlen(GET_REQUEST)) != BR_ERR_OK)
        {
            close(fd);
            freeaddrinfo(res);
            printf("br_sslio_write_all failed: %d\r\n", br_ssl_engine_last_error(&sc.eng));
            failures++;
            continue;
        }
        br_sslio_flush(&ioc);

        for (;;)
        {
            int rlen;
            unsigned char buf[128];

            bzero(buf, 128);
            // Leave the final byte for zero termination
            rlen = br_sslio_read(&ioc, buf, sizeof(buf) - 1);

            if (rlen < 0) {
                break;
            }
            if (rlen > 0) {
                printf("%s", buf);
            }
        }

        close(fd);
        freeaddrinfo(res);
        successes++;
        printf("successes = %d failures = %d\r\n", successes, failures);
        for(int countdown = 10; countdown >= 0; countdown--) {
            printf("%d... ", countdown);
            vTaskDelay(1000 / portTICK_PERIOD_MS);
        }
        printf("\r\nStarting again!\r\n");
    }
}

void user_init(void)
{
    uart_set_baud(0, 115200);
    printf("SDK version:%s\n", sdk_system_get_sdk_version());

    struct sdk_station_config config = {
        .ssid = WIFI_SSID,
        .password = WIFI_PASS,
    };

    /* required to call wifi_set_opmode before station_set_config */
    sdk_wifi_set_opmode(STATION_MODE);
    sdk_wifi_station_set_config(&config);

    xTaskCreate(&http_get_task, "get_task", 2048, NULL, 2, NULL);
}

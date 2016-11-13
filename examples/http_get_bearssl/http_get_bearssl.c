/* http_get_bearssl - HTTPS version of the http_get example, using BearSSL.
 *
 * Retrieves a JSON response from the howsmyssl.com API via HTTPS over TLS v1.2.
 *
 * Validates the server's certificate using a hardcoded public key.
 *
 * Adapted from the client_basic sample in BearSSL.
 *
 * Original Copyright (c) 2016 Thomas Pornin <pornin@bolet.org>, MIT License.
 * Additions Copyright (C) 2016 Stefan Schake, MIT License.
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

/*
 * howsmyssl.com public key
 * BearSSL doesn't allow disabling validation and we don't have
 * a correct date/time on the ESP so it would always fail.
 * Instead, we compare the server key against this static public key
 * to validate the server.
 */
static const unsigned char SERVER_PKEY_RSA_N[] = {
	0xA9, 0x11, 0x5C, 0xAF, 0x4F, 0xDD, 0xEB, 0x88, 0xCD, 0xF6, 0x47, 0x11,
	0xB9, 0x7F, 0xFA, 0x08, 0xD7, 0x90, 0x01, 0x14, 0x36, 0x84, 0xBF, 0xE2,
	0xD8, 0xC4, 0x26, 0xBF, 0xD3, 0x6B, 0xBA, 0x2E, 0x06, 0x9C, 0x23, 0x95,
	0x98, 0x8E, 0xC0, 0xC5, 0x91, 0xF0, 0xC6, 0xC3, 0x39, 0x98, 0x04, 0xC6,
	0x78, 0x14, 0x13, 0x08, 0xA7, 0x12, 0x3D, 0x86, 0x1A, 0x14, 0x71, 0x35,
	0x7E, 0xFB, 0x8B, 0xF8, 0xA1, 0x52, 0x21, 0x5B, 0xDE, 0x51, 0x5A, 0x3A,
	0x35, 0x6F, 0x8F, 0xDB, 0xF9, 0x6A, 0xA5, 0xF2, 0x74, 0x6E, 0xCA, 0xFC,
	0xA4, 0x70, 0xCC, 0x70, 0x4D, 0x5E, 0x4E, 0x69, 0xA2, 0xFE, 0x42, 0x23,
	0x8A, 0xC0, 0x01, 0x3B, 0xEF, 0x46, 0xB4, 0xC2, 0x6F, 0x48, 0x26, 0xDD,
	0xF5, 0x05, 0x9B, 0x69, 0x88, 0xB0, 0x7D, 0x38, 0xA8, 0x49, 0x07, 0x11,
	0xE5, 0xFE, 0x27, 0x0F, 0x4F, 0x28, 0x83, 0x18, 0xAB, 0x47, 0x1F, 0x72,
	0x40, 0xEC, 0x67, 0x16, 0xBE, 0x45, 0x76, 0x0B, 0x83, 0x91, 0xE5, 0x42,
	0xC2, 0xA2, 0x5B, 0xF2, 0xEB, 0xB1, 0x8C, 0x37, 0x0F, 0x4B, 0x5E, 0x0F,
	0x05, 0x7D, 0x54, 0x48, 0x9F, 0x55, 0xAE, 0x41, 0xC9, 0x07, 0x6F, 0xD7,
	0xB3, 0xF3, 0xE2, 0x61, 0x18, 0x03, 0x48, 0xA1, 0x3C, 0x8D, 0xBD, 0x5C,
	0xCD, 0x3B, 0x55, 0xCD, 0x97, 0xE3, 0xD1, 0x80, 0x8A, 0x30, 0x88, 0x3A,
	0xAC, 0xEE, 0x64, 0x08, 0xBD, 0x74, 0x82, 0x24, 0x82, 0x11, 0xD4, 0x93,
	0xFA, 0xEF, 0x52, 0x5F, 0x2C, 0x51, 0x0C, 0x88, 0x09, 0xB9, 0x77, 0xA0,
	0xFA, 0x6F, 0xAB, 0xEB, 0xE1, 0x08, 0x5C, 0xA5, 0x02, 0x53, 0xA1, 0x18,
	0xFC, 0xB8, 0x06, 0x67, 0x7E, 0x80, 0xDF, 0xF1, 0xCD, 0xAE, 0x23, 0x58,
	0xCD, 0xCE, 0x7C, 0x69, 0x2E, 0x4D, 0xD6, 0xB0, 0xD2, 0x6D, 0x11, 0x85,
	0x5E, 0x36, 0x41, 0x27
};

static const unsigned char SERVER_PKEY_RSA_E[] = {
	0x01, 0x00, 0x01
};

static const br_rsa_public_key server_pkey = {
    (unsigned char *)SERVER_PKEY_RSA_N, sizeof SERVER_PKEY_RSA_N,
    (unsigned char *)SERVER_PKEY_RSA_E, sizeof SERVER_PKEY_RSA_E,
};

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

/*
 * Buffer to store a record + BearSSL state
 * We use MONO mode to save 16k of RAM.
 * This could be even smaller by using max_fragment_len, but
 * the howsmyssl.com server doesn't seem to support it.
 */
static unsigned char bearssl_buffer[BR_SSL_BUFSIZE_MONO];

static br_ssl_client_context sc;
static br_x509_minimal_context xc;
static br_x509_knownkey_context kkc;
static br_sslio_context ioc;

void http_get_task(void *pvParameters)
{
    int successes = 0, failures = 0;
    while (1) {
        /*
         * Wait until we can resolve the DNS for the server, as an indication
         * our network is probably working...
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
        br_ssl_client_init_full(&sc, &xc, NULL, 0);

        /*
         * Overwrite the default X509 engine with a much simpler known key one
         * This sidesteps validation failure in the default engine, as we have no date/time
         * Instead, the servers key is compared to the hardcoded public key above
         */
        br_x509_knownkey_init_rsa(&kkc, &server_pkey);
        br_ssl_engine_set_x509(&sc.eng, &kkc.vtable);

        /*
         * Set the I/O buffer to the provided array. We allocated a
         * buffer large enough for full-duplex behaviour with all
         * allowed sizes of SSL records, hence we set the last argument
         * to 1 (which means "split the buffer into separate input and
         * output areas").
         */
        br_ssl_engine_set_buffer(&sc.eng, bearssl_buffer, sizeof bearssl_buffer, 0);

        /*
         * Inject some entropy from the ESP hardware RNG
         * This is necessary because we don't support any of the BearSSL methods
         */
        for (int i = 0; i < 10; i++) {
            int rand = hwrand();
            br_ssl_engine_inject_entropy(&sc.eng, &rand, 4);
        }

        /*
         * Reset the client context, for a new handshake. We provide the
         * target host name: it will be used for the SNI extension. The
         * last parameter is 0: we are not trying to resume a session.
         */
        br_ssl_client_reset(&sc, WEB_SERVER, 0);

        /*
         * Initialise the simplified I/O wrapper context, to use our
         * SSL client context, and the two callbacks for socket I/O.
         */
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

        /*
         * Note that while the context has, at that point, already
         * assembled the ClientHello to send, nothing happened on the
         * network yet. Real I/O will occur only with the next call.
         *
         * We write our simple HTTP request. We test the call
         * for an error (-1), but this is not strictly necessary, since
         * the error state "sticks": if the context fails for any reason
         * (e.g. bad server certificate), then it will remain in failed
         * state and all subsequent calls will return -1 as well.
         */
        if (br_sslio_write_all(&ioc, GET_REQUEST, strlen(GET_REQUEST)) != BR_ERR_OK) {
            close(fd);
            freeaddrinfo(res);
            printf("br_sslio_write_all failed: %d\r\n", br_ssl_engine_last_error(&sc.eng));
            failures++;
            continue;
        }

        /*
         * SSL is a buffered protocol: we make sure that all our request
         * bytes are sent onto the wire.
         */
        br_sslio_flush(&ioc);

        /*
         * Read and print the server response
         */
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

        /*
         * If reading the response failed for any reason, we detect it here
         */
        if (br_ssl_engine_last_error(&sc.eng) != BR_ERR_OK) {
            close(fd);
            freeaddrinfo(res);
            printf("failure, error = %d\r\n", br_ssl_engine_last_error(&sc.eng));
            failures++;
            continue;
        }

        /*
         * Close the connection and start over after a delay
         */
        close(fd);
        freeaddrinfo(res);
        successes++;
        printf("\r\n\r\nsuccesses = %d failures = %d\r\n", successes, failures);
        for(int countdown = 10; countdown >= 0; countdown--) {
            printf("%d...\n", countdown);
            vTaskDelay(1000 / portTICK_PERIOD_MS);
        }
        printf("Starting again!\r\n\r\n");
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

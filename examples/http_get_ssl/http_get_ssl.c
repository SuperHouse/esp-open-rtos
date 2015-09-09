/* http_get_ssl - HTTPS version of the http_get example.
 *
 * Retrieves a web page over HTTPS (TLS) using GET.
 *
 * Does not validate server certificate.
 *
 * This sample code is in the public domain.,
 */
#include "espressif/esp_common.h"
#include "espressif/sdk_private.h"

#include <string.h>

#include "FreeRTOS.h"
#include "task.h"

#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include "lwip/netdb.h"
#include "lwip/dns.h"

#include "ssl.h"

#include "ssid_config.h"

#define WEB_SERVER "192.168.0.18"
#define WEB_PORT "8000"
#define WEB_URL "/test"

static void display_cipher(SSL *ssl);
static void display_session_id(SSL *ssl);

void http_get_task(void *pvParameters)
{
    int successes = 0, failures = 0;
    SSL_CTX *ssl_ctx;
    uint32_t options = SSL_SERVER_VERIFY_LATER|SSL_DISPLAY_CERTS;
    printf("HTTP get task starting...\r\n");

    printf("free heap = %u\r\n", xPortGetFreeHeapSize());
    if ((ssl_ctx = ssl_ctx_new(options, SSL_DEFAULT_CLNT_SESS)) == NULL)
    {
        printf("Error: SSL Client context is invalid\n");
        while(1) {}
    }
    printf("Got SSL context.");

    while(1) {
        const struct addrinfo hints = {
            .ai_family = AF_INET,
            .ai_socktype = SOCK_STREAM,
        };
        struct addrinfo *res;

        printf("top of loop, free heap = %u\r\n", xPortGetFreeHeapSize());

        printf("Running DNS lookup for %s...\r\n", WEB_SERVER);
        int err = getaddrinfo(WEB_SERVER, WEB_PORT, &hints, &res);

        if(err != 0 || res == NULL) {
            printf("DNS lookup failed err=%d res=%p\r\n", err, res);
            if(res)
                freeaddrinfo(res);
            vTaskDelay(1000 / portTICK_RATE_MS);
            failures++;
            continue;
        }
        /* Note: inet_ntoa is non-reentrant, look at ipaddr_ntoa_r for "real" code */
        struct in_addr *addr = &((struct sockaddr_in *)res->ai_addr)->sin_addr;
        printf("DNS lookup succeeded. IP=%s\r\n", inet_ntoa(*addr));

        int s = socket(res->ai_family, res->ai_socktype, 0);
        if(s < 0) {
            printf("... Failed to allocate socket.\r\n");
            freeaddrinfo(res);
            vTaskDelay(1000 / portTICK_RATE_MS);
            failures++;
            continue;
        }

        printf("... allocated socket\r\n");

        if(connect(s, res->ai_addr, res->ai_addrlen) != 0) {
            close(s);
            freeaddrinfo(res);
            printf("... socket connect failed.\r\n");
            vTaskDelay(4000 / portTICK_RATE_MS);
            failures++;
            continue;
        }

        printf("... connected. starting TLS session...\r\n");
        freeaddrinfo(res);

        SSL *ssl = ssl_client_new(ssl_ctx, s, NULL, 0);
        printf("initial status %p %d\r\n", ssl, ssl_handshake_status(ssl));
        if((err = ssl_handshake_status(ssl)) != SSL_OK) {
            ssl_free(ssl);
            close(s);
            printf("SSL handshake failed. :( %d\r\n", err);
            vTaskDelay(4000 / portTICK_RATE_MS);
            failures++;
            continue;
        }

        const char *common_name = ssl_get_cert_dn(ssl,
                                                  SSL_X509_CERT_COMMON_NAME);
        if (common_name)
        {
            printf("Common Name:\t\t\t%s\n", common_name);
        }

        display_session_id(ssl);
        display_cipher(ssl);

        const char *req =
            "GET "WEB_URL"\r\n"
            "User-Agent: esp-open-rtos/0.1 esp8266\r\n"
            "\r\n";
        if (ssl_write(ssl, (uint8_t *)req, strlen(req)) < 0) {
            printf("... socket send failed\r\n");
            ssl_free(ssl);
            close(s);
            vTaskDelay(4000 / portTICK_RATE_MS);
            failures++;
            continue;
        }
        printf("... socket send success\r\n");

        uint8_t *recv_buf;
        int r;
        do {
            r = ssl_read(ssl, &recv_buf);
            for(int i = 0; i < r; i++)
                printf("%c", recv_buf[i]);
        } while(r > 0);

        printf("... done reading from socket. Last read return=%d errno=%d\r\n", r, errno);
        if(r != 0)
            failures++;
        else
            successes++;
        ssl_free(ssl);
        close(s);
        printf("successes = %d failures = %d\r\n", successes, failures);
        for(int countdown = 10; countdown >= 0; countdown--) {
            printf("%d... ", countdown);
            vTaskDelay(1000 / portTICK_RATE_MS);
        }
        printf("\r\nStarting again!\r\n");
    }
}

void user_init(void)
{
    sdk_uart_div_modify(0, UART_CLK_FREQ / 115200);
    printf("SDK version:%s\n", sdk_system_get_sdk_version());

    struct sdk_station_config config = {
        .ssid = WIFI_SSID,
        .password = WIFI_PASS,
    };

    /* required to call wifi_set_opmode before station_set_config */
    sdk_wifi_set_opmode(STATION_MODE);
    sdk_wifi_station_set_config(&config);

    xTaskCreate(&http_get_task, (signed char *)"get_task", 2048, NULL, 2, NULL);
}

/**
 * Display what session id we have.
 */
static void display_session_id(SSL *ssl)
{
    int i;
    const uint8_t *session_id = ssl_get_session_id(ssl);
    int sess_id_size = ssl_get_session_id_size(ssl);

    if (sess_id_size > 0)
    {
        printf("-----BEGIN SSL SESSION PARAMETERS-----\n");
        for (i = 0; i < sess_id_size; i++)
        {
            printf("%02x", session_id[i]);
        }

        printf("\n-----END SSL SESSION PARAMETERS-----\n");
    }
}

/**
 * Display what cipher we are using
 */
static void display_cipher(SSL *ssl)
{
    printf("CIPHER is ");
    switch (ssl_get_cipher_id(ssl))
    {
    case SSL_AES128_SHA:
        printf("AES128-SHA");
        break;

    case SSL_AES256_SHA:
        printf("AES256-SHA");
        break;

    case SSL_RC4_128_SHA:
        printf("RC4-SHA");
        break;

    case SSL_RC4_128_MD5:
        printf("RC4-MD5");
        break;

    default:
        printf("Unknown - %d", ssl_get_cipher_id(ssl));
        break;
    }

    printf("\n");
}

/*
 * WiFi configuration via a simple web server.
 *
 * Copyright (C) 2016 OurAirQuality.org
 *
 * Licensed under the Apache License, Version 2.0, January 2004 (the
 * "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at
 *      http://www.apache.org/licenses/
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS WITH THE SOFTWARE.
 *
 */

#include <string.h>
#include <ctype.h>

#include <espressif/esp_common.h>
#include <espressif/user_interface.h>
#include <esp/uart.h>
#include <sdk_internal.h>
#include <FreeRTOS.h>
#include <task.h>
#include <queue.h>
#include <dhcpserver.h>

#include <lwip/api.h>

#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include "lwip/netdb.h"
#include "lwip/dns.h"

#include "wificfg.h"
#include "sysparam.h"


/*
 * Read a line terminated by "\r\n" or "\n" to be robust. Used to read the http
 * status line and headers. On success returns the number of characters read,
 * which might be more that the available buffer size 'len'. Excess characters
 * in a line are discarded as a protection against excessively long lines. On
 * failure -1 is returned. The character case is lowered to give a canonical
 * case for easier comparision. The buffer is null terminated on success, even
 * if truncated.
 */
static int read_crlf_line(int s, char *buf, size_t len)
{
    size_t num = 0;

    do {
        char c;
        int r = read(s, &c, 1);

        /* Expecting a known terminator so fail on EOF. */
        if (r <= 0)
            return -1;

        if (c == '\n')
            break;

        /* Remove a trailing '\r', and many unexpected characters. */
        if (c < 0x20 || c > 0x7e)
            continue;

        if (num < len)
            buf[num] = tolower((unsigned char)c);

        num++;
    } while(1);

    /* Null terminate. */
    buf[num >= len ? len - 1 : num] = 0;

    return num;
}

int wificfg_form_name_value(int s, bool *valp, size_t *rem, char *buf, size_t len)
{
    size_t num = 0;

    do {
        if (*rem == 0)
            break;

        char c;
        int r = read(s, &c, 1);

        /* Expecting a known number of characters so fail on EOF. */
        if (r <= 0) return -1;

        (*rem)--;

        if (valp && c == '=') {
            *valp = true;
            break;
        }

        if (c == '&') {
            if (valp)
                *valp = false;
            break;
        }

        if (num < len)
            buf[num] = c;

        num++;
    } while(1);

    /* Null terminate. */
    buf[num >= len ? len - 1 : num] = 0;

    return num;
}

void wificfg_form_url_decode(char *string)
{
    char *src = string;
    char *src_end = string + strlen(string);
    char *dst = string;

    while (src < src_end) {
        char c = *src++;
        if (c == '+') {
            c = ' ';
        } else if (c == '%' && src < src_end - 1) {
            unsigned char c1 = src[0];
            unsigned char c2 = src[1];
            if (isxdigit(c1) && isxdigit(c2)) {
                c1 = tolower(c1);
                int d1 = (c1 >= 'a' && c1 <= 'z') ? c1 - 'a' + 10 : c1 - '0';
                c2 = tolower(c2);
                int d2 = (c2 >= 'a' && c2 <= 'z') ? c2 - 'a' + 10 : c2 - '0';
                *dst++ = (d1 << 4) + d2;
                src += 2;
                continue;
            }
        }
        *dst++ = c;
    }

    *dst = 0;
}

/* HTML escaping. */
void wificfg_html_escape(char *string, char *buf, size_t len)
{
    size_t i;
    size_t out = 0;

    for (i = 0, out = 0; out < len - 1; ) {
        char c = string[i++];
        if (!c)
            break;

        if (c == '&') {
            if (out >= len - 5)
                break;
            buf[out] = '&';
            buf[out + 1] = 'a';
            buf[out + 2] = 'm';
            buf[out + 3] = 'p';
            buf[out + 4] = ';';
            out += 5;
            continue;
        }
        if (c == '"') {
            if (out >= len - 6)
                break;
            buf[out] = '&';
            buf[out + 1] = 'q';
            buf[out + 2] = 'u';
            buf[out + 3] = 'o';
            buf[out + 4] = 't';
            buf[out + 5] = ';';
            out += 6;
            continue;
        }
        if (c == '<') {
            if (out >= len - 4)
                break;
            buf[out] = '&';
            buf[out + 1] = 'l';
            buf[out + 2] = 't';
            buf[out + 3] = ';';
            out += 4;
            continue;
        }
        if (c == '>') {
            if (out >= len - 4)
                break;
            buf[out] = '&';
            buf[out + 1] = 'g';
            buf[out + 2] = 't';
            buf[out + 3] = ';';
            out += 4;
            continue;
        }

        buf[out++] = c;
    }

    buf[out] = 0;
}

/* Various keywords are interned as they are read. */

static const struct {
    const char *str;
    wificfg_method method;
} method_table[] = {
    {"get", HTTP_METHOD_GET},
    {"post", HTTP_METHOD_POST},
    {"head", HTTP_METHOD_HEAD}
};

static wificfg_method intern_http_method(char *str)
{
    int i;
    for (i = 0;  i < sizeof(method_table) / sizeof(method_table[0]); i++) {
        if (!strcmp(str, method_table[i].str))
            return method_table[i].method;
    }
    return HTTP_METHOD_OTHER;
}

/*
 * The web server recognizes only these header names. Other headers are ignored.
 */
typedef enum {
    HTTP_HEADER_HOST,
    HTTP_HEADER_CONTENT_LENGTH,
    HTTP_HEADER_CONTENT_TYPE,
    HTTP_HEADER_OTHER
} http_header;

static const struct {
    const char *str;
    http_header name;
} http_header_table[] = {
    {"host", HTTP_HEADER_HOST},
    {"content-length", HTTP_HEADER_CONTENT_LENGTH},
    {"content-type", HTTP_HEADER_CONTENT_TYPE}
};

static http_header intern_http_header(char *str)
{
    int i;
    for (i = 0;  i < sizeof(http_header_table) / sizeof(http_header_table[0]); i++) {
        if (!strcmp(str, http_header_table[i].str))
            return http_header_table[i].name;
    }
    return HTTP_HEADER_OTHER;
}


static const struct {
    const char *str;
    wificfg_content_type type;
} content_type_table[] = {
    {"application/x-www-form-urlencoded", HTTP_CONTENT_TYPE_WWW_FORM_URLENCODED}
};

static wificfg_content_type intern_http_content_type(char *str)
{
    int i;
    for (i = 0;  i < sizeof(content_type_table) / sizeof(content_type_table[0]); i++) {
        if (!strcmp(str, content_type_table[i].str))
            return content_type_table[i].type;
    }
    return HTTP_CONTENT_TYPE_OTHER;
}

static char *skip_whitespace(char *string)
{
    while (isspace((unsigned char)*string)) string++;
    return string;
}

static char *skip_to_whitespace(char *string)
{
    do {
        unsigned char c = *string;
        if (!c || isspace(c))
            break;
        string++;
    } while (1);

    return string;
}

int wificfg_write_string(int s, const char *str)
{
    int res = write(s, str, strlen(str));
    return res;
}

typedef enum {
    FORM_NAME_CFG_ENABLE,
    FORM_NAME_CFG_PASSWORD,
    FORM_NAME_STA_ENABLE,
    FORM_NAME_STA_SSID,
    FORM_NAME_STA_PASSWORD,
    FORM_NAME_STA_DHCP,
    FORM_NAME_STA_IP_ADDR,
    FORM_NAME_STA_NETMASK,
    FORM_NAME_STA_GATEWAY,
    FORM_NAME_AP_ENABLE,
    FORM_NAME_AP_SSID,
    FORM_NAME_AP_PASSWORD,
    FORM_NAME_AP_SSID_HIDDEN,
    FORM_NAME_AP_CHANNEL,
    FORM_NAME_AP_AUTHMODE,
    FORM_NAME_AP_MAX_CONN,
    FORM_NAME_AP_BEACON_INTERVAL,
    FORM_NAME_AP_IP_ADDR,
    FORM_NAME_AP_NETMASK,
    FORM_NAME_AP_DHCP_LEASES,
    FORM_NAME_AP_DNS,
    FORM_NAME_NONE
} form_name;

static const struct {
    const char *str;
    form_name name;
} form_name_table[] = {
    {"cfg_enable", FORM_NAME_CFG_ENABLE},
    {"cfg_password", FORM_NAME_CFG_PASSWORD},
    {"sta_enable", FORM_NAME_STA_ENABLE},
    {"sta_ssid", FORM_NAME_STA_SSID},
    {"sta_dhcp", FORM_NAME_STA_DHCP},
    {"sta_password", FORM_NAME_STA_PASSWORD},
    {"sta_ip_addr", FORM_NAME_STA_IP_ADDR},
    {"sta_netmask", FORM_NAME_STA_NETMASK},
    {"sta_gateway", FORM_NAME_STA_GATEWAY},
    {"ap_enable", FORM_NAME_AP_ENABLE},
    {"ap_ssid", FORM_NAME_AP_SSID},
    {"ap_password", FORM_NAME_AP_PASSWORD},
    {"ap_ssid_hidden", FORM_NAME_AP_SSID_HIDDEN},
    {"ap_channel", FORM_NAME_AP_CHANNEL},
    {"ap_authmode", FORM_NAME_AP_AUTHMODE},
    {"ap_max_conn", FORM_NAME_AP_MAX_CONN},
    {"ap_beacon_interval", FORM_NAME_AP_BEACON_INTERVAL},
    {"ap_ip_addr", FORM_NAME_AP_IP_ADDR},
    {"ap_netmask", FORM_NAME_AP_NETMASK},
    {"ap_dhcp_leases", FORM_NAME_AP_DHCP_LEASES},
    {"ap_dns", FORM_NAME_AP_DNS}
};

static form_name intern_form_name(char *str)
{
     int i;
     for (i = 0;  i < sizeof(form_name_table) / sizeof(form_name_table[0]); i++) {
         if (!strcmp(str, form_name_table[i].str))
             return form_name_table[i].name;
     }
     return FORM_NAME_NONE;
}


static const char http_favicon[] =
#include "content/favicon.ico"
;

static void handle_favicon(int s, wificfg_method method,
                           uint32_t content_length,
                           wificfg_content_type content_type,
                           char *buf, size_t len)
{
    wificfg_write_string(s, http_favicon);

}

// .value-lg{font-size:24px}.label-extra{display:block;font-style:italic;font-size:13px}
// devo: "Cache-Control: no-store\r\n"
static const char http_style[] =
#include "content/style.css"
;


static void handle_style(int s, wificfg_method method,
                         uint32_t content_length,
                         wificfg_content_type content_type,
                         char *buf, size_t len)
{
    wificfg_write_string(s, http_style);
}

static const char http_script[] =
#include "content/script.js"
;

static void handle_script(int s, wificfg_method method,
                           uint32_t content_length,
                           wificfg_content_type content_type,
                           char *buf, size_t len)
{
    wificfg_write_string(s, http_script);
}


static const char http_success_header[] = "HTTP/1.0 200 \r\n"
    "Content-Type: text/html; charset=utf-8\r\n"
    "Cache-Control: no-store\r\n"
    "\r\n";

static const char http_redirect_header[] = "HTTP/1.0 302 \r\n"
    "Location: /wificfg/\r\n"
    "\r\n";

static void handle_wificfg_redirect(int s, wificfg_method method,
                                    uint32_t content_length,
                                    wificfg_content_type content_type,
                                    char *buf, size_t len)
{
    wificfg_write_string(s, http_redirect_header);
}

static void handle_ipaddr_redirect(int s, char *buf, size_t len)
{
    if (wificfg_write_string(s, "HTTP/1.0 302 \r\nLocation: http://") < 0) return;

    struct sockaddr addr;
    socklen_t addr_len = sizeof(addr);
    getsockname(s, (struct sockaddr*)&addr, &addr_len);
    struct sockaddr_in *sa = (struct sockaddr_in *)&addr;
    snprintf(buf, len, "" IPSTR "/\r\n\r\n", IP2STR(&sa->sin_addr));
    wificfg_write_string(s, buf);
}


static const char *http_wificfg_content[] = {
#include "content/wificfg/index.html"
};

static void handle_wificfg_index(int s, wificfg_method method,
                                 uint32_t content_length,
                                 wificfg_content_type content_type,
                                 char *buf, size_t len)
{
    if (wificfg_write_string(s, http_success_header) < 0) return;

    if (method != HTTP_METHOD_HEAD) {
        if (wificfg_write_string(s, http_wificfg_content[0]) < 0) return;

        uint32_t chip_id = sdk_system_get_chip_id();
        snprintf(buf, len, "<dt>Chip ID</dt><dd>%08x</dd>", chip_id);
        if (wificfg_write_string(s, buf) < 0) return;

        snprintf(buf, len, "<dt>Uptime</dt><dd>%d seconds</dd>",
                 xTaskGetTickCount() * portTICK_PERIOD_MS / 1000);
        if (wificfg_write_string(s, buf) < 0) return;

        snprintf(buf, len, "<dt>Free heap</dt><dd>%d bytes</dd>", (int)xPortGetFreeHeapSize());
        if (wificfg_write_string(s, buf) < 0) return;

        snprintf(buf, len, "<dt>Flash ID</dt><dd>0x%08x</dd>", sdk_spi_flash_get_id());
        if (wificfg_write_string(s, buf) < 0) return;

        snprintf(buf, len, "<dt>Flash size</dt><dd>%u KiB</dd>", sdk_flashchip.chip_size >> 10);
        if (wificfg_write_string(s, buf) < 0) return;

        enum sdk_sleep_type sleep_type = sdk_wifi_get_sleep_type();
        char *sleep_type_str = "??";
        switch (sleep_type) {
        case WIFI_SLEEP_NONE:
            sleep_type_str = "None";
            break;
        case WIFI_SLEEP_LIGHT:
            sleep_type_str = "Light";
            break;
        case WIFI_SLEEP_MODEM:
            sleep_type_str = "Modem";
            break;
        default:
            break;
        }
        snprintf(buf, len, "<dt>WiFi sleep type</dt><dd>%s</dd>", sleep_type_str);
        if (wificfg_write_string(s, buf) < 0) return;

        uint8_t opmode = sdk_wifi_get_opmode();
        const char *opmode_str = "??";
        switch (opmode) {
        case NULL_MODE:
            opmode_str = "Null";
            break;
        case STATION_MODE:
            opmode_str = "Station";
            break;
        case SOFTAP_MODE:
            opmode_str = "SoftAP";
            break;
        case STATIONAP_MODE:
            opmode_str = "StationAP";
            break;
        default:
            break;
        }
        snprintf(buf, len, "<dt>OpMode</dt><dd>%s</dd>", opmode_str);
        if (wificfg_write_string(s, buf) < 0) return;

        if (opmode > NULL_MODE) {
            snprintf(buf, len, "<dt>WiFi channel</dt><dd>%d</dd>", sdk_wifi_get_channel());
            if (wificfg_write_string(s, buf) < 0) return;

            const char *phy_mode_str = "??";
            switch (sdk_wifi_get_phy_mode()) {
            case PHY_MODE_11B:
                phy_mode_str = "11b";
                break;
            case PHY_MODE_11G:
                phy_mode_str = "11g";
                break;
            case PHY_MODE_11N:
                phy_mode_str = "11n";
                break;
            default:
                break;
            }
            snprintf(buf, len, "<dt>WiFi physical mode</dt><dd>%s</dd>", phy_mode_str);
            if (wificfg_write_string(s, buf) < 0) return;
        }

        if (opmode == STATION_MODE || opmode == STATIONAP_MODE) {
            uint8_t hwaddr[6];
            if (sdk_wifi_get_macaddr(STATION_IF, hwaddr)) {
                if (wificfg_write_string(s, "<dt>Station MAC address</dt>") < 0) return;
                snprintf(buf, len, "<dd>" MACSTR "</dd>", MAC2STR(hwaddr));
                if (wificfg_write_string(s, buf) < 0) return;
            }
            struct ip_info info;
            if (sdk_wifi_get_ip_info(STATION_IF, &info)) {
                if (wificfg_write_string(s, "<dt>Station IP address</dt>") < 0) return;
                snprintf(buf, len, "<dd>" IPSTR "</dd>", IP2STR(&info.ip));
                if (wificfg_write_string(s, buf) < 0) return;
                if (wificfg_write_string(s, "<dt>Station netmask</dt>") < 0) return;
                snprintf(buf, len, "<dd>" IPSTR "</dd>", IP2STR(&info.netmask));
                if (wificfg_write_string(s, buf) < 0) return;
                if (wificfg_write_string(s, "<dt>Station gateway</dt>") < 0) return;
                snprintf(buf, len, "<dd>" IPSTR "</dd>", IP2STR(&info.gw));
                if (wificfg_write_string(s, buf) < 0) return;
            }
        }

        if (opmode == SOFTAP_MODE || opmode == STATIONAP_MODE) {
            uint8_t hwaddr[6];
            if (sdk_wifi_get_macaddr(SOFTAP_IF, hwaddr)) {
                if (wificfg_write_string(s, "<dt>AP MAC address</dt>") < 0) return;
                snprintf(buf, len, "<dd>" MACSTR "</dd>", MAC2STR(hwaddr));
                if (wificfg_write_string(s, buf) < 0) return;
            }
            struct ip_info info;
            if (sdk_wifi_get_ip_info(SOFTAP_IF, &info)) {
                if (wificfg_write_string(s, "<dt>AP IP address</dt>") < 0) return;
                snprintf(buf, len, "<dd>" IPSTR "</dd>", IP2STR(&info.ip));
                if (wificfg_write_string(s, buf) < 0) return;
                if (wificfg_write_string(s, "<dt>AP netmask</dt>") < 0) return;
                snprintf(buf, len, "<dd>" IPSTR "</dd>", IP2STR(&info.netmask));
                if (wificfg_write_string(s, buf) < 0) return;
                if (wificfg_write_string(s, "<dt>AP gateway</dt>") < 0) return;
                snprintf(buf, len, "<dd>" IPSTR "</dd>", IP2STR(&info.gw));
                if (wificfg_write_string(s, buf) < 0) return;
            }
        }

        struct sockaddr addr;
        socklen_t addr_len = sizeof(addr);
        getpeername(s, (struct sockaddr*)&addr, &addr_len);

        if (addr.sa_family == AF_INET) {
            struct sockaddr_in *sa = (struct sockaddr_in *)&addr;
            if (wificfg_write_string(s, "<dt>Peer address</dt>") < 0) return;
            snprintf(buf, len, "<dd>" IPSTR " : %d</dd>",
                     IP2STR(&sa->sin_addr), ntohs(sa->sin_port));
            if (wificfg_write_string(s, buf) < 0) return;
        }

        if (wificfg_write_string(s, http_wificfg_content[1]) < 0) return;

        char *password = NULL;
        sysparam_get_string("cfg_password", &password);
        if (password) {
            wificfg_html_escape(password, buf, len);
            free(password);
            if (wificfg_write_string(s, buf) < 0) return;
        }

        if (wificfg_write_string(s, http_wificfg_content[2]) < 0) return;
    }
}

static void handle_wificfg_index_post(int s, wificfg_method method,
                                      uint32_t content_length,
                                      wificfg_content_type content_type,
                                      char *buf, size_t len)
{
    if (content_type != HTTP_CONTENT_TYPE_WWW_FORM_URLENCODED) {
        wificfg_write_string(s, "HTTP/1.0 400 \r\nContent-Type: text/html\r\n\r\n");
        return;
    }

    size_t rem = content_length;
    bool valp = false;

    while (rem > 0) {
        int r = wificfg_form_name_value(s, &valp, &rem, buf, len);

        if (r < 0) {
            break;
        }

        wificfg_form_url_decode(buf);

        form_name name = intern_form_name(buf);

        if (valp) {
            int r = wificfg_form_name_value(s, NULL, &rem, buf, len);
            if (r < 0) {
                break;
            }

            wificfg_form_url_decode(buf);

            switch (name) {
            case FORM_NAME_CFG_ENABLE: {
                int8_t enable = strtol(buf, NULL, 10) != 0;
                sysparam_set_int8("cfg_enable", enable);
                break;
            }
            case FORM_NAME_CFG_PASSWORD:
                sysparam_set_string("cfg_password", buf);
                break;
            default:
                break;
            }
        }
    }

    wificfg_write_string(s, http_redirect_header);
}

static const char *http_wifi_station_content[] = {
#include "content/wificfg/sta.html"
};

static void handle_wifi_station(int s, wificfg_method method,
                                uint32_t content_length,
                                wificfg_content_type content_type,
                                char *buf, size_t len)
{
    if (wificfg_write_string(s, http_success_header) < 0) return;

    if (method != HTTP_METHOD_HEAD) {
        if (wificfg_write_string(s, http_wifi_station_content[0]) < 0) return;

        int8_t wifi_sta_enable = 1;
        sysparam_get_int8("wifi_sta_enable", &wifi_sta_enable);
        if (wifi_sta_enable && wificfg_write_string(s, "checked") < 0) return;
        if (wificfg_write_string(s, http_wifi_station_content[1]) < 0) return;
        if (!wifi_sta_enable && wificfg_write_string(s, "checked") < 0) return;

        if (wificfg_write_string(s, http_wifi_station_content[2]) < 0) return;

        char *wifi_sta_ssid = NULL;
        sysparam_get_string("wifi_sta_ssid", &wifi_sta_ssid);
        if (wifi_sta_ssid) {
            wificfg_html_escape(wifi_sta_ssid, buf, len);
            free(wifi_sta_ssid);
            if (wificfg_write_string(s, buf) < 0) return;
        }

        if (wificfg_write_string(s, http_wifi_station_content[3]) < 0) return;

        char *wifi_sta_password = NULL;
        sysparam_get_string("wifi_sta_password", &wifi_sta_password);
        if (wifi_sta_password) {
            wificfg_html_escape(wifi_sta_password, buf, len);
            free(wifi_sta_password);
            if (wificfg_write_string(s, buf) < 0) return;
        }

        if (wificfg_write_string(s, http_wifi_station_content[4]) < 0) return;

        int8_t wifi_sta_dhcp = 1;
        sysparam_get_int8("wifi_sta_dhcp", &wifi_sta_dhcp);
        if (wifi_sta_dhcp && wificfg_write_string(s, "checked") < 0) return;
        if (wificfg_write_string(s, http_wifi_station_content[5]) < 0) return;
        if (!wifi_sta_dhcp && wificfg_write_string(s, "checked") < 0) return;

        if (wificfg_write_string(s, http_wifi_station_content[6]) < 0) return;

        char *wifi_sta_ip_addr = NULL;
        sysparam_get_string("wifi_sta_ip_addr", &wifi_sta_ip_addr);
        if (wifi_sta_ip_addr) {
            wificfg_html_escape(wifi_sta_ip_addr, buf, len);
            free(wifi_sta_ip_addr);
            if (wificfg_write_string(s, buf) < 0) return;
        }

        if (wificfg_write_string(s, http_wifi_station_content[7]) < 0) return;

        char *wifi_sta_netmask = NULL;
        sysparam_get_string("wifi_sta_netmask", &wifi_sta_netmask);
        if (wifi_sta_netmask) {
            wificfg_html_escape(wifi_sta_netmask, buf, len);
            free(wifi_sta_netmask);
            if (wificfg_write_string(s, buf) < 0) return;
        }

        if (wificfg_write_string(s, http_wifi_station_content[8]) < 0) return;

        char *wifi_sta_gateway = NULL;
        sysparam_get_string("wifi_sta_gateway", &wifi_sta_gateway);
        if (wifi_sta_gateway) {
            wificfg_html_escape(wifi_sta_gateway, buf, len);
            free(wifi_sta_gateway);
            if (wificfg_write_string(s, buf) < 0) return;
        }

        if (wificfg_write_string(s, http_wifi_station_content[9]) < 0) return;
    }
}

static void handle_wifi_station_post(int s, wificfg_method method,
                                     uint32_t content_length,
                                     wificfg_content_type content_type,
                                     char *buf, size_t len)
{
    if (content_type != HTTP_CONTENT_TYPE_WWW_FORM_URLENCODED) {
        wificfg_write_string(s, "HTTP/1.0 400 \r\nContent-Type: text/html\r\n\r\n");
        return;
    }

    size_t rem = content_length;
    bool valp = false;

    while (rem > 0) {
        int r = wificfg_form_name_value(s, &valp, &rem, buf, len);

        if (r < 0) {
            break;
        }

        wificfg_form_url_decode(buf);

        form_name name = intern_form_name(buf);

        if (valp) {
            int r = wificfg_form_name_value(s, NULL, &rem, buf, len);
            if (r < 0) {
                break;
            }

            wificfg_form_url_decode(buf);

            switch (name) {
            case FORM_NAME_STA_ENABLE: {
                int8_t enable = strtol(buf, NULL, 10) != 0;
                sysparam_set_int8("wifi_sta_enable", enable);
                break;
            }
            case FORM_NAME_STA_SSID:
                sysparam_set_string("wifi_sta_ssid", buf);
                break;
            case FORM_NAME_STA_PASSWORD:
                sysparam_set_string("wifi_sta_password", buf);
                break;
            case FORM_NAME_STA_DHCP: {
                int8_t enable = strtol(buf, NULL, 10) != 0;
                sysparam_set_int8("wifi_sta_dhcp", enable);
                break;
            }
            case FORM_NAME_STA_IP_ADDR:
                sysparam_set_string("wifi_sta_ip_addr", buf);
                break;
            case FORM_NAME_STA_NETMASK:
                sysparam_set_string("wifi_sta_netmask", buf);
                break;
            case FORM_NAME_STA_GATEWAY:
                sysparam_set_string("wifi_sta_gateway", buf);
                break;
            default:
                break;
            }
        }
    }

    wificfg_write_string(s, http_redirect_header);
}

static const char *http_wifi_ap_content[] = {
#include "content/wificfg/ap.html"
};

static void handle_wifi_ap(int s, wificfg_method method,
                           uint32_t content_length,
                           wificfg_content_type content_type,
                           char *buf, size_t len)
{
    if (wificfg_write_string(s, http_success_header) < 0) return;

    if (method != HTTP_METHOD_HEAD) {
        if (wificfg_write_string(s, http_wifi_ap_content[0]) < 0) return;

        int8_t wifi_ap_enable = 1;
        sysparam_get_int8("wifi_ap_enable", &wifi_ap_enable);
        if (wifi_ap_enable && wificfg_write_string(s, "checked") < 0) return;
        if (wificfg_write_string(s, http_wifi_ap_content[1]) < 0) return;
        if (!wifi_ap_enable && wificfg_write_string(s, "checked") < 0) return;

        if (wificfg_write_string(s, http_wifi_ap_content[2]) < 0) return;

        char *wifi_ap_ssid = NULL;
        sysparam_get_string("wifi_ap_ssid", &wifi_ap_ssid);
        if (wifi_ap_ssid) {
            wificfg_html_escape(wifi_ap_ssid, buf, len);
            free(wifi_ap_ssid);
            if (wificfg_write_string(s, buf) < 0) return;
        }

        if (wificfg_write_string(s, http_wifi_ap_content[3]) < 0) return;

        char *wifi_ap_password = NULL;
        sysparam_get_string("wifi_ap_password", &wifi_ap_password);
        if (wifi_ap_password) {
            wificfg_html_escape(wifi_ap_password, buf, len);
            free(wifi_ap_password);
            if (wificfg_write_string(s, buf) < 0) return;
        }

        if (wificfg_write_string(s, http_wifi_ap_content[4]) < 0) return;

        int8_t wifi_ap_ssid_hidden = 0;
        sysparam_get_int8("wifi_ap_ssid_hidden", &wifi_ap_ssid_hidden);
        if (wifi_ap_ssid_hidden && wificfg_write_string(s, "checked") < 0) return;
        if (wificfg_write_string(s, http_wifi_ap_content[5]) < 0) return;
        if (!wifi_ap_ssid_hidden && wificfg_write_string(s, "checked") < 0) return;

        if (wificfg_write_string(s, http_wifi_ap_content[6]) < 0) return;

        int8_t wifi_ap_channel = 3;
        sysparam_get_int8("wifi_ap_channel", &wifi_ap_channel);
        snprintf(buf, len, "%d", wifi_ap_channel);
        if (wificfg_write_string(s, buf) < 0) return;

        if (wificfg_write_string(s, http_wifi_ap_content[7]) < 0) return;

        int8_t wifi_ap_authmode = 4;
        sysparam_get_int8("wifi_ap_authmode", &wifi_ap_authmode);
        if (wifi_ap_authmode == 0 && wificfg_write_string(s, " selected") < 0) return;
        if (wificfg_write_string(s, http_wifi_ap_content[8]) < 0) return;
        if (wifi_ap_authmode == 1 && wificfg_write_string(s, " selected") < 0) return;
        if (wificfg_write_string(s, http_wifi_ap_content[9]) < 0) return;
        if (wifi_ap_authmode == 2 && wificfg_write_string(s, " selected") < 0) return;
        if (wificfg_write_string(s, http_wifi_ap_content[10]) < 0) return;
        if (wifi_ap_authmode == 3 && wificfg_write_string(s, " selected") < 0) return;
        if (wificfg_write_string(s, http_wifi_ap_content[11]) < 0) return;
        if (wifi_ap_authmode == 4 && wificfg_write_string(s, " selected") < 0) return;

        if (wificfg_write_string(s, http_wifi_ap_content[12]) < 0) return;

        int8_t wifi_ap_max_conn = 3;
        sysparam_get_int8("wifi_ap_max_conn", &wifi_ap_max_conn);
        snprintf(buf, len, "%d", wifi_ap_max_conn);
        if (wificfg_write_string(s, buf) < 0) return;

        if (wificfg_write_string(s, http_wifi_ap_content[13]) < 0) return;

        int32_t wifi_ap_beacon_interval = 100;
        sysparam_get_int32("wifi_ap_beacon_interval", &wifi_ap_beacon_interval);
        snprintf(buf, len, "%d", wifi_ap_beacon_interval);
        if (wificfg_write_string(s, buf) < 0) return;

        if (wificfg_write_string(s, http_wifi_ap_content[14]) < 0) return;

        char *wifi_ap_ip_addr = NULL;
        sysparam_get_string("wifi_ap_ip_addr", &wifi_ap_ip_addr);
        if (wifi_ap_ip_addr) {
            wificfg_html_escape(wifi_ap_ip_addr, buf, len);
            free(wifi_ap_ip_addr);
            if (wificfg_write_string(s, buf) < 0) return;
        }

        if (wificfg_write_string(s, http_wifi_ap_content[15]) < 0) return;

        char *wifi_ap_netmask = NULL;
        sysparam_get_string("wifi_ap_netmask", &wifi_ap_netmask);
        if (wifi_ap_netmask) {
            wificfg_html_escape(wifi_ap_netmask, buf, len);
            free(wifi_ap_netmask);
            if (wificfg_write_string(s, buf) < 0) return;
        }

        if (wificfg_write_string(s, http_wifi_ap_content[16]) < 0) return;

        int8_t wifi_ap_dhcp_leases = 0;
        sysparam_get_int8("wifi_ap_dhcp_leases", &wifi_ap_dhcp_leases);
        snprintf(buf, len, "%d", wifi_ap_dhcp_leases);
        if (wificfg_write_string(s, buf) < 0) return;

        if (wificfg_write_string(s, http_wifi_ap_content[17]) < 0) return;

        int8_t wifi_ap_dns = 1;
        sysparam_get_int8("wifi_ap_dns", &wifi_ap_dns);
        if (wifi_ap_dns && wificfg_write_string(s, "checked") < 0) return;
        if (wificfg_write_string(s, http_wifi_ap_content[18]) < 0) return;
        if (!wifi_ap_dns && wificfg_write_string(s, "checked") < 0) return;

        if (wificfg_write_string(s, http_wifi_ap_content[19]) < 0) return;

    }
}

static void handle_wifi_ap_post(int s, wificfg_method method,
                                uint32_t content_length,
                                wificfg_content_type content_type,
                                char *buf, size_t len)
{
    if (content_type != HTTP_CONTENT_TYPE_WWW_FORM_URLENCODED) {
        wificfg_write_string(s, "HTTP/1.0 400 \r\nContent-Type: text/html\r\n\r\n");
        return;
    }

    size_t rem = content_length;
    bool valp = false;

    while (rem > 0) {
        int r = wificfg_form_name_value(s, &valp, &rem, buf, len);

        if (r < 0) {
            break;
        }

        wificfg_form_url_decode(buf);

        form_name name = intern_form_name(buf);

        if (valp) {
            int r = wificfg_form_name_value(s, NULL, &rem, buf, len);
            if (r < 0) {
                break;
            }

            wificfg_form_url_decode(buf);

            switch (name) {
            case FORM_NAME_AP_ENABLE: {
                int8_t enable = strtol(buf, NULL, 10) != 0;
                sysparam_set_int8("wifi_ap_enable", enable);
                break;
            }
            case FORM_NAME_AP_SSID:
                sysparam_set_string("wifi_ap_ssid", buf);
                break;
            case FORM_NAME_AP_PASSWORD:
                sysparam_set_string("wifi_ap_password", buf);
                break;
            case FORM_NAME_AP_SSID_HIDDEN: {
                int8_t hidden = strtol(buf, NULL, 10) != 0;
                sysparam_set_int8("wifi_ap_ssid_hidden", hidden);
                break;
            }
            case FORM_NAME_AP_CHANNEL: {
                int8_t channel = strtol(buf, NULL, 10);
                if (channel >= 1 && channel <= 14)
                    sysparam_set_int8("wifi_ap_channel", channel);
                break;
            }
            case FORM_NAME_AP_AUTHMODE: {
                int8_t mode = strtol(buf, NULL, 10);
                if (mode >= 0 && mode <= 5)
                    sysparam_set_int8("wifi_ap_authmode", mode);
                break;
            }
            case FORM_NAME_AP_MAX_CONN: {
                int8_t max_conn = strtol(buf, NULL, 10);
                if (max_conn >= 0 && max_conn <= 8)
                    sysparam_set_int8("wifi_ap_max_conn", max_conn);
                break;
            }
            case FORM_NAME_AP_BEACON_INTERVAL: {
                int32_t interval = strtol(buf, NULL, 10);
                if (interval >= 0 && interval <= 10000)
                    sysparam_set_int32("wifi_ap_beacon_interval", interval);
                break;
            }
            case FORM_NAME_AP_IP_ADDR:
                sysparam_set_string("wifi_ap_ip_addr", buf);
                break;
            case FORM_NAME_AP_NETMASK:
                sysparam_set_string("wifi_ap_netmask", buf);
                break;
            case FORM_NAME_AP_DHCP_LEASES: {
                int32_t leases = strtol(buf, NULL, 10);
                if (leases >= 0 && leases <= 16)
                    sysparam_set_int8("wifi_ap_dhcp_leases", leases);
                break;
            }
            case FORM_NAME_AP_DNS: {
                int8_t dns = strtol(buf, NULL, 10) != 0;
                sysparam_set_int8("wifi_ap_dns", dns);
                break;
            }
            default:
                break;
            }
        }
    }

    wificfg_write_string(s, http_redirect_header);
}

static void handle_restart_post(int s, wificfg_method method,
                                uint32_t content_length,
                                wificfg_content_type content_type,
                                char *buf, size_t len)
{
    wificfg_write_string(s, http_redirect_header);
    close(s);
    vTaskDelay(1000 / portTICK_PERIOD_MS);
    sdk_system_restart();
}

/* Minimal not-found response. */
static const char not_found_header[] = "HTTP/1.0 404 \r\n"
    "Content-Type: text/html; charset=utf-8\r\n"
    "Cache-Control: no-store\r\n"
    "\r\n";

static const char *http_wificfg_challenge_content[] = {
#include "content/challenge.html"
};

static void handle_wificfg_challenge(int s, wificfg_method method,
                                     uint32_t content_length,
                                     wificfg_content_type content_type,
                                     char *buf, size_t len)
{
    if (method != HTTP_METHOD_HEAD) {
        if (wificfg_write_string(s, http_wificfg_challenge_content[0]) < 0) return;
    }
}

static void handle_wificfg_challenge_post(int s, wificfg_method method,
                                          uint32_t content_length,
                                          wificfg_content_type content_type,
                                          char *buf, size_t len)
{
    if (content_type != HTTP_CONTENT_TYPE_WWW_FORM_URLENCODED) {
        wificfg_write_string(s, "HTTP/1.0 400 \r\nContent-Type: text/html\r\n\r\n");
        return;
    }
    size_t rem = content_length;
    bool valp = false;

    int8_t enable = 1;
    sysparam_get_int8("cfg_enable", &enable);
    char *password = NULL;
    sysparam_get_string("cfg_password", &password);

    if (!enable && password && strlen(password)) {
        while (rem > 0) {
            int r = wificfg_form_name_value(s, &valp, &rem, buf, len);

            if (r < 0) {
                break;
            }

            wificfg_form_url_decode(buf);

            form_name name = intern_form_name(buf);

            if (valp) {
                int r = wificfg_form_name_value(s, NULL, &rem, buf, len);
                if (r < 0) {
                    break;
                }

                wificfg_form_url_decode(buf);

                switch (name) {
                case FORM_NAME_CFG_PASSWORD:
                    if (strcmp(password, buf) == 0)
                        sysparam_set_int8("cfg_enable", 1);
                    break;
                default:
                    break;
                }
            }
        }
    }

    wificfg_write_string(s, http_redirect_header);

    if (password)
        free(password);
}

#ifdef configUSE_TRACE_FACILITY
static const char *http_tasks_content[] = {
#include "content/tasks.html"
};

static void handle_tasks(int s, wificfg_method method,
                         uint32_t content_length,
                         wificfg_content_type content_type,
                         char *buf, size_t len)
{
    if (wificfg_write_string(s, http_success_header) < 0) return;

    if (method != HTTP_METHOD_HEAD) {
        if (wificfg_write_string(s, http_tasks_content[0]) < 0) return;
        int num_tasks = uxTaskGetNumberOfTasks();
        TaskStatus_t *task_status = pvPortMalloc(num_tasks * sizeof(TaskStatus_t));

        if (task_status != NULL) {
            int i;

            if (wificfg_write_string(s, "<table><tr><th>Task name</th><th>Task number</th><th>Status</th><th>Priority</th><th>Base priority</th><th>Runtime</th><th>Stack high-water</th></tr>") < 0) return;

            /* Generate the (binary) data. */
            num_tasks = uxTaskGetSystemState(task_status, num_tasks, NULL);

            /* Create a human readable table from the binary data. */
            for(i = 0; i < num_tasks; i++) {
                char cStatus;
                switch(task_status[i].eCurrentState) {
                case eReady: cStatus = 'R'; break;
                case eBlocked: cStatus = 'B'; break;
                case eSuspended: cStatus = 'S'; break;
                case eDeleted: cStatus = 'D'; break;
                default: cStatus = 0x00; break;
                }

                snprintf(buf, len, "<tr><th>%s</th>", task_status[i].pcTaskName);
                if (wificfg_write_string(s, buf) < 0) return;
                snprintf(buf, len, "<td>%u</td><td>%c</td>",
                         (unsigned int)task_status[i].xTaskNumber,
                         cStatus);
                if (wificfg_write_string(s, buf) < 0) return;
                snprintf(buf, len, "<td>%u</td><td>%u</td>",
                         (unsigned int)task_status[i].uxCurrentPriority,
                         (unsigned int)task_status[i].uxBasePriority);
                if (wificfg_write_string(s, buf) < 0) return;
                snprintf(buf, len, "<td>%u</td><td>%u</td></tr>",
                         (unsigned int)task_status[i].ulRunTimeCounter,
                         (unsigned int)task_status[i].usStackHighWaterMark);
                if (wificfg_write_string(s, buf) < 0) return;
            }

            free(task_status);

            if (wificfg_write_string(s, "</table>") < 0) return;
        }
    }

    if (wificfg_write_string(s, http_tasks_content[1]) < 0) return;
}
#endif /* configUSE_TRACE_FACILITY */

static const wificfg_dispatch wificfg_dispatch_list[] = {
    {"/favicon.ico", HTTP_METHOD_GET, handle_favicon, false},
    {"/style.css", HTTP_METHOD_GET, handle_style, false},
    {"/script.js", HTTP_METHOD_GET, handle_script, false},
    {"/", HTTP_METHOD_GET, handle_wificfg_redirect, false},
    {"/index.html", HTTP_METHOD_GET, handle_wificfg_redirect, false},
    {"/wificfg/", HTTP_METHOD_GET, handle_wificfg_index, true},
    {"/wificfg/", HTTP_METHOD_POST, handle_wificfg_index_post, true},
    {"/wificfg/sta.html", HTTP_METHOD_GET, handle_wifi_station, true},
    {"/wificfg/sta.html", HTTP_METHOD_POST, handle_wifi_station_post, true},
    {"/wificfg/ap.html", HTTP_METHOD_GET, handle_wifi_ap, true},
    {"/wificfg/ap.html", HTTP_METHOD_POST, handle_wifi_ap_post, true},
    {"/challenge.html", HTTP_METHOD_GET, handle_wificfg_challenge, false},
    {"/challenge.html", HTTP_METHOD_POST, handle_wificfg_challenge_post, false},
    {"/wificfg/restart.html", HTTP_METHOD_POST, handle_restart_post, true},
#ifdef configUSE_TRACE_FACILITY
    {"/tasks", HTTP_METHOD_GET, handle_tasks, false},
    {"/tasks.html", HTTP_METHOD_GET, handle_tasks, false},
#endif /* configUSE_TRACE_FACILITY */
    {NULL, HTTP_METHOD_ANY, NULL}
};

static const wificfg_dispatch wificfg_challenge_dispatch = {"/challenge.html", HTTP_METHOD_GET, handle_wificfg_challenge, false};

typedef struct {
    int32_t port;
    /*
     * Two dispatch lists. First is used for the config pages. Second
     * can be used to extend the pages handled in app code.
     */
    const wificfg_dispatch *wificfg_dispatch;
    const wificfg_dispatch *dispatch;
} server_params;

static void server_task(void *pvParameters)
{
    server_params *params = pvParameters;

    struct sockaddr_in serv_addr;
    int listenfd = socket(AF_INET, SOCK_STREAM, 0);
    memset(&serv_addr, '0', sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    serv_addr.sin_port = htons(params->port);
    bind(listenfd, (struct sockaddr*)&serv_addr, sizeof(serv_addr));
    listen(listenfd, 2);

    for (;;) {
        int s = accept(listenfd, (struct sockaddr *)NULL, (socklen_t *)NULL);
        if (s >= 0) {
            int timeout = 10000; /* 10 second timeout */
            setsockopt(s, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout));
            setsockopt(s, SOL_SOCKET, SO_SNDTIMEO, &timeout, sizeof(timeout));

            /* Buffer for reading the request and headers and the post method
             * names and values. */
            char buf[48];

            /* Read the request line */
            int request_line_size = read_crlf_line(s, buf, sizeof(buf));
            if (request_line_size < 5) {
                close(s);
                continue;
            }

            /* Parse the http method, path, and protocol version. */
            char *method_end = skip_to_whitespace(buf);
            char *path_string = skip_whitespace(method_end);
            *method_end = 0;
            wificfg_method method = intern_http_method(buf);
            char *path_end = skip_to_whitespace(path_string);
            *path_end = 0;

            /* Dispatch to separate functions to handle the requests. */
            const wificfg_dispatch *match = NULL;
            const wificfg_dispatch *dispatch;

            /*
             * Check the optional application supplied dispatch table
             * first to allow overriding the wifi config paths.
             */
            if (params->dispatch) {
                for (dispatch = params->dispatch; dispatch->path != NULL; dispatch++) {
                    if (strcmp(path_string, dispatch->path) == 0 &&
                        (dispatch->method == HTTP_METHOD_ANY ||
                         method == dispatch->method)) {
                        match = dispatch;
                        break;
                    }
                }
            }

            if (!match) {
                for (dispatch = params->wificfg_dispatch; dispatch->path != NULL; dispatch++) {
                    if (strcmp(path_string, dispatch->path) == 0 &&
                        (dispatch->method == HTTP_METHOD_ANY ||
                         method == dispatch->method)) {
                        match = dispatch;
                        break;
                    }
                }
            }

            if (match && match->secure) {
                /* A secure url so check if enabled. */
                int8_t enable = 1;
                sysparam_get_int8("cfg_enable", &enable);
                if (!enable) {
                    /* Is there a recovery password? */
                    char *password = NULL;
                    sysparam_get_string("cfg_password", &password);
                    if (password && strlen(password) > 0) {
                        match = &wificfg_challenge_dispatch;
                    } else {
                        match = NULL;
                    }
                    if (password)
                        free(password);
                }
            }

            /* Read the headers, noting some of interest. */
            long content_length = 0;
            wificfg_content_type content_type = HTTP_CONTENT_TYPE_OTHER;
            bool hostp = false;
            uint32_t host = IPADDR_NONE;

            for (;;) {
                int header_length = read_crlf_line(s, buf, sizeof(buf));
                if (header_length <= 0)
                    break;

                char *name_end = buf;
                for (; ; name_end++) {
                    char c = *name_end;
                    if (!c || c == ':')
                        break;
                }
                if (*name_end == ':') {
                    char *value = name_end + 1;
                    *name_end = 0;
                    http_header header = intern_http_header(buf);
                    value = skip_whitespace(value);
                    switch (header) {
                    case HTTP_HEADER_HOST:
                        hostp = true;
                        host = ipaddr_addr(value);
                        break;
                    case HTTP_HEADER_CONTENT_LENGTH:
                        content_length = strtol(value, NULL, 10);
                        break;
                    case HTTP_HEADER_CONTENT_TYPE:
                        content_type = intern_http_content_type(value);
                        break;
                    default:
                        break;
                    }
                }
            }

            if (hostp && host == IPADDR_NONE) {
                /* Redirect to an IP address. */
                handle_ipaddr_redirect(s, buf, sizeof(buf));
            } else if (match) {
                (*match->handler)(s, method, content_length, content_type, buf, sizeof(buf));
            } else {
                wificfg_write_string(s, not_found_header);
            }

            close(s);
        }
    }
}


static void dns_task(void *pvParameters)
{
    char *wifi_ap_ip_addr = NULL;
    sysparam_get_string("wifi_ap_ip_addr", &wifi_ap_ip_addr);
    if (!wifi_ap_ip_addr) {
        vTaskDelete(NULL);
    }
    ip_addr_t server_addr;
    server_addr.addr = ipaddr_addr(wifi_ap_ip_addr);

    struct sockaddr_in serv_addr;
    int fd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

    memset(&serv_addr, '0', sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    serv_addr.sin_port = htons(53);
    bind(fd, (struct sockaddr*)&serv_addr, sizeof(serv_addr));

    for (;;) {
        char buffer[96];
        struct sockaddr src_addr;
        socklen_t src_addr_len = sizeof(src_addr);
        size_t count = recvfrom(fd, buffer, sizeof(buffer), 0, (struct sockaddr*)&src_addr, &src_addr_len);

        /* Drop messages that are too large to send a response in the buffer */
        if (count > 0 && count <= sizeof(buffer) - 16 && src_addr.sa_family == AF_INET) {
            size_t qname_len = strlen(buffer + 12) + 1;
            uint32_t reply_len = 2 + 10 + qname_len + 16 + 4;

            char *head = buffer + 2;
            *head++ = 0x80; // Flags
            *head++ = 0x00;
            *head++ = 0x00; // Q count
            *head++ = 0x01;
            *head++ = 0x00; // A count
            *head++ = 0x01;
            *head++ = 0x00; // Auth count
            *head++ = 0x00;
            *head++ = 0x00; // Add count
            *head++ = 0x00;
            head += qname_len;
            *head++ = 0x00; // Q type
            *head++ = 0x01;
            *head++ = 0x00; // Q class
            *head++ = 0x01;
            *head++ = 0xC0; // LBL offs
            *head++ = 0x0C;
            *head++ = 0x00; // Type
            *head++ = 0x01;
            *head++ = 0x00; // Class
            *head++ = 0x01;
            *head++ = 0x00; // TTL
            *head++ = 0x00;
            *head++ = 0x00;
            *head++ = 0x78;
            *head++ = 0x00; // RD len
            *head++ = 0x04;
            *head++ = ip4_addr1(&server_addr.addr);
            *head++ = ip4_addr2(&server_addr.addr);
            *head++ = ip4_addr3(&server_addr.addr);
            *head++ = ip4_addr4(&server_addr.addr);

            sendto(fd, buffer, reply_len, 0, &src_addr, src_addr_len);
        }
    }
}


void wificfg_init(uint32_t port, const wificfg_dispatch *dispatch)
{
    char *wifi_sta_ssid = NULL;
    char *wifi_sta_password = NULL;
    char *wifi_ap_ssid = NULL;
    char *wifi_ap_password = NULL;

    uint32_t base_addr;
    uint32_t num_sectors;
    if (sysparam_get_info(&base_addr, &num_sectors) != SYSPARAM_OK) {
        printf("Warning: WiFi config, sysparam not initialized\n");
        return;
    }

    sysparam_get_string("wifi_ap_ssid", &wifi_ap_ssid);
    sysparam_get_string("wifi_ap_password", &wifi_ap_password);
    sysparam_get_string("wifi_sta_ssid", &wifi_sta_ssid);
    sysparam_get_string("wifi_sta_password", &wifi_sta_password);

    int8_t wifi_sta_enable = 1;
    int8_t wifi_ap_enable = 1;
    sysparam_get_int8("wifi_sta_enable", &wifi_sta_enable);
    sysparam_get_int8("wifi_ap_enable", &wifi_ap_enable);

    /* Validate the configuration. */

    if (wifi_sta_enable && (!wifi_sta_ssid || !wifi_sta_password ||
                            strlen(wifi_sta_ssid) <= 0 ||
                            strlen(wifi_sta_ssid) > 32 ||
                            strlen(wifi_sta_password) >= 64)) {
        wifi_sta_enable = 0;
    }

    if (wifi_ap_enable) {
        /* Default AP ssid and password. */
        if (!wifi_ap_ssid) {
            uint32_t chip_id = sdk_system_get_chip_id();
            char ssid[13];
            snprintf(ssid, sizeof(ssid), "eor%08x", chip_id);
            sysparam_set_string("wifi_ap_ssid", ssid);
            sysparam_get_string("wifi_ap_ssid", &wifi_ap_ssid);

            if (!wifi_ap_password) {
                sysparam_set_string("wifi_ap_password", "esp-open-rtos");
                sysparam_get_string("wifi_ap_password", &wifi_ap_password);
            }
        }

        if (strlen(wifi_ap_ssid) <= 0 || strlen(wifi_ap_ssid) >= 32 ||
            strlen(wifi_ap_password) >= 64) {
            wifi_ap_enable = 0;
        }
    }

    int8_t wifi_mode = NULL_MODE;
    if (wifi_sta_enable && wifi_ap_enable)
        wifi_mode = STATIONAP_MODE;
    else if (wifi_sta_enable)
        wifi_mode = STATION_MODE;
    else
        wifi_mode = SOFTAP_MODE;
    sdk_wifi_set_opmode(wifi_mode);

    if (wifi_sta_enable) {
        struct sdk_station_config config;
        strcpy((char *)config.ssid, wifi_sta_ssid);
        strcpy((char *)config.password, wifi_sta_password);
        config.bssid_set = 0;

        int8_t wifi_sta_dhcp = 1;
        sysparam_get_int8("wifi_sta_dhcp", &wifi_sta_dhcp);

        if (!wifi_sta_dhcp) {
            char *wifi_sta_ip_addr = NULL;
            char *wifi_sta_netmask = NULL;
            char *wifi_sta_gateway = NULL;
            sysparam_get_string("wifi_sta_ip_addr", &wifi_sta_ip_addr);
            sysparam_get_string("wifi_sta_netmask", &wifi_sta_netmask);
            sysparam_get_string("wifi_sta_gateway", &wifi_sta_gateway);

            if (wifi_sta_ip_addr && strlen(wifi_sta_ip_addr) > 4 &&
                wifi_sta_netmask && strlen(wifi_sta_netmask) > 4 &&
                wifi_sta_gateway && strlen(wifi_sta_gateway) > 4) {
                // TODO this does not appear to work??
                sdk_wifi_station_dhcpc_stop();
                struct ip_info info;
                memset(&info, 0x0, sizeof(info));
                info.ip.addr = ipaddr_addr(wifi_sta_ip_addr);
                info.netmask.addr = ipaddr_addr(wifi_sta_netmask);
                info.gw.addr = ipaddr_addr(wifi_sta_gateway);
                sdk_wifi_set_ip_info(STATION_IF, &info);
            }
            if (wifi_sta_ip_addr) free(wifi_sta_ip_addr);
            if (wifi_sta_netmask) free(wifi_sta_netmask);
            if (wifi_sta_gateway) free(wifi_sta_gateway);
        }

        sdk_wifi_station_set_config(&config);
    }

    if (wifi_ap_enable) {
        /* Read and validate paramenters. */
        int8_t wifi_ap_ssid_hidden = 0;
        sysparam_get_int8("wifi_ap_ssid_hidden", &wifi_ap_ssid_hidden);
        if (wifi_ap_ssid_hidden < 0 || wifi_ap_ssid_hidden > 1)
            wifi_ap_ssid_hidden = 1;

        int8_t wifi_ap_channel = 3;
        sysparam_get_int8("wifi_ap_channel", &wifi_ap_channel);
        if (wifi_ap_channel < 1 || wifi_ap_channel > 14)
            wifi_ap_channel = 3;

        int8_t wifi_ap_authmode = 4;
        sysparam_get_int8("wifi_ap_authmode", &wifi_ap_authmode);
        if (wifi_ap_authmode < AUTH_OPEN || wifi_ap_authmode > AUTH_MAX)
            wifi_ap_authmode = AUTH_WPA_WPA2_PSK;

        int8_t wifi_ap_max_conn = 3;
        sysparam_get_int8("wifi_ap_max_conn", &wifi_ap_max_conn);
        if (wifi_ap_max_conn < 1 || wifi_ap_max_conn > 8)
            wifi_ap_max_conn = 3;

        int32_t wifi_ap_beacon_interval = 100;
        sysparam_get_int32("wifi_ap_beacon_interval", &wifi_ap_beacon_interval);
        if (wifi_ap_beacon_interval < 0 || wifi_ap_beacon_interval > 1000)
            wifi_ap_beacon_interval = 100;

        /* Default AP IP address and netmask. */
        char *wifi_ap_ip_addr = NULL;
        sysparam_get_string("wifi_ap_ip_addr", &wifi_ap_ip_addr);
        if (!wifi_ap_ip_addr) {
            sysparam_set_string("wifi_ap_ip_addr", "172.16.0.1");
            sysparam_get_string("wifi_ap_ip_addr", &wifi_ap_ip_addr);
        }
        char *wifi_ap_netmask = NULL;
        sysparam_get_string("wifi_ap_netmask", &wifi_ap_netmask);
        if (!wifi_ap_netmask) {
            sysparam_set_string("wifi_ap_netmask", "255.255.0.0");
            sysparam_get_string("wifi_ap_netmask", &wifi_ap_netmask);
        }

        if (strlen(wifi_ap_ip_addr) >= 7 && strlen(wifi_ap_netmask) >= 7) {
            struct ip_info ap_ip;
            ap_ip.ip.addr = ipaddr_addr(wifi_ap_ip_addr);
            ap_ip.netmask.addr = ipaddr_addr(wifi_ap_netmask);
            IP4_ADDR(&ap_ip.gw, 0, 0, 0, 0);
            sdk_wifi_set_ip_info(1, &ap_ip);

            struct sdk_softap_config ap_config = {
                .ssid_hidden = wifi_ap_ssid_hidden,
                .channel = wifi_ap_channel,
                .authmode = wifi_ap_authmode,
                .max_connection = wifi_ap_max_conn,
                .beacon_interval = wifi_ap_beacon_interval,
            };
            strcpy((char *)ap_config.ssid, wifi_ap_ssid);
            ap_config.ssid_len = strlen(wifi_ap_ssid);
            strcpy((char *)ap_config.password, wifi_ap_password);
            sdk_wifi_softap_set_config(&ap_config);

            int8_t wifi_ap_dhcp_leases = 4;
            sysparam_get_int8("wifi_ap_dhcp_leases", &wifi_ap_dhcp_leases);
            if (wifi_ap_dhcp_leases) {
                ip_addr_t first_client_ip;
                first_client_ip.addr = ipaddr_addr(wifi_ap_ip_addr) + htonl(1);

                int8_t wifi_ap_dns = 1;
                sysparam_get_int8("wifi_ap_dns", &wifi_ap_dns);
                if (wifi_ap_dns < 0 || wifi_ap_dns > 1)
                    wifi_ap_dns = 1;

                dhcpserver_start(&first_client_ip, wifi_ap_dhcp_leases, wifi_ap_dns);

                if (wifi_ap_dns)
                    xTaskCreate(dns_task, "WiFi Cfg DNS", 224, NULL, 2, NULL);
            }
        }

        free(wifi_ap_ip_addr);
        free(wifi_ap_netmask);
    }

    if (wifi_sta_ssid) free(wifi_sta_ssid);
    if (wifi_sta_password) free(wifi_sta_password);
    if (wifi_ap_ssid) free(wifi_ap_ssid);
    if (wifi_ap_password) free(wifi_ap_password);

    server_params *params = malloc(sizeof(server_params));
    params->port = port;
    params->wificfg_dispatch = wificfg_dispatch_list;
    params->dispatch = dispatch;
    xTaskCreate(server_task, "WiFi Cfg HTTP", 368, params, 2, NULL);
}

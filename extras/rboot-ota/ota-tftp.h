#ifndef _OTA_TFTP_H
#define _OTA_TFTP_H
/* TFTP Server OTA Support
 *
 * To use, call ota_tftp_init_server() which will start the TFTP server task
 * and keep it running until a valid image is sent.
 *
 * The server expects to see a valid image sent with filename "filename.bin"
 * and will switch "slots" and reboot if a valid image is received.
 *
 * Note that the server will allow you to flash an "OTA" update that doesn't
 * support OTA itself, and possibly brick the esp requiring serial upload.
 *
 * Example client comment:
 * tftp -m octet ESP_IP -c put firmware/myprogram.bin firmware.bin
 *
 * TFTP protocol implemented as per RFC1350:
 * https://tools.ietf.org/html/rfc1350
 *
 * IMPORTANT: TFTP is not a secure protocol.
 * Only allow TFTP OTA updates on trusted networks.
 *
 *
 * For more details, see https://github.com/SuperHouse/esp-open-rtos/wiki/OTA-Update-Configuration
 */

/* Start a FreeRTOS task to wait to receive an OTA update from a TFTP client.
 *
 * listen_port is the UDP port number to receive TFTP connections on (default TFTP port is 69)
 */
void ota_tftp_init_server(int listen_port);

#define TFTP_PORT 69

#endif

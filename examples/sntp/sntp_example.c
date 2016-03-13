/*
 * Test code for SNTP on esp-open-rtos.
 *
 * Jesus Alonso (doragasu)
 */
#include <espressif/esp_common.h>
#include <esp/uart.h>

#include <string.h>
#include <stdio.h>

#include <FreeRTOS.h>
#include <task.h>

#include <lwip/err.h>
#include <lwip/sockets.h>
#include <lwip/sys.h>
#include <lwip/netdb.h>
#include <lwip/dns.h>

#include <ssid_config.h>

// Add extras/sntp component to makefile for this include to work
#include <sntp.h>

#define SNTP_SERVERS 	"0.pool.ntp.org", "1.pool.ntp.org", \
						"2.pool.ntp.org", "3.pool.ntp.org"

#define vTaskDelayMs(ms)	vTaskDelay((ms)/portTICK_RATE_MS)
#define UNUSED_ARG(x)	(void)x

// Use GPIO pin 2
const int gpio_frc2 = 2;
// 1 Hz blink frequency
const int freq_frc2 = 1;

void SntpTsk(void *pvParameters)
{
	char *servers[] = {SNTP_SERVERS};
	UNUSED_ARG(pvParameters);

	// Wait until we have joined AP and are assigned an IP
	while (sdk_wifi_station_get_connect_status() != STATION_GOT_IP) {
		vTaskDelayMs(100);
	}

	// Start SNTP
	printf("Starting SNTP... ");
	sntp_set_update_delay(1*60000);
	sntp_initialize(1, 0);
	sntp_set_servers(servers, sizeof(servers) / sizeof(char*));
	printf("DONE!\n");

//	struct timespec ts;
//	clock_getres(CLOCK_REALTIME, &ts);
//	printf("Time resolution: %d secs, %d nanosecs\n", t.tv_sec, t.tv_nsec);
//
//	clock_gettime(CLOCK_REALTIME, &t);
//	printf("Time: %d secs, %d nanosecs\n", t.tv_sec, t.tv_nsec);

	while(1) {
		vTaskDelayMs(5000);
		time_t ts = sntp_get_rtc_time(NULL);
		printf("TIME: %s", ctime(&ts));
	}
}

void frc2_interrupt_handler(void)
{
    /* FRC2 needs the match register updated on each timer interrupt */
    timer_set_frequency(FRC2, freq_frc2);
    gpio_toggle(gpio_frc2);
}

// Configure FRC2 to blink the LED. I'm messing with FRC2 just to test if
// it does affect FreeRTOS.
void Frc2Config(void) {
    /* configure GPIO */
    gpio_enable(gpio_frc2, GPIO_OUTPUT);
    gpio_write(gpio_frc2, 1);

    /* stop timer and mask its interrupt as a precaution */
    timer_set_interrupts(FRC2, false);
    timer_set_run(FRC2, false);

    /* set up ISR */
    _xt_isr_attach(INUM_TIMER_FRC2, frc2_interrupt_handler);

    /* configure timer frequency */
    timer_set_frequency(FRC2, freq_frc2);

    /* unmask interrupt and start timer */
    timer_set_interrupts(FRC2, true);
    timer_set_run(FRC2, true);
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

	// Mess with FRC2 to test if it interferes with FreeRTOS
	Frc2Config();

    xTaskCreate(SntpTsk, (signed char *)"SNTP", 1024, NULL, 1, NULL);
}


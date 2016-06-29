/* 
 *
 * This sample code is in the public domain.
 */
#include "espressif/esp_common.h"
#include "esp/uart.h"
#include "FreeRTOS.h"
#include "task.h"
#include "dht.h"
#include "esp8266.h"

/* An example using the ubiquitous DHT** humidity sensors
 * to read and print a new temperature and humidity measurement
 * from a sensor attached to GPIO pin 4.
 */
int const dht_gpio = 4;

void dhtMeasurementTask(void *pvParameters)
{
  int8_t temperature = 0;
  int8_t humidity = 0;

  // DHT sensors that come mounted on a PCB generally have
  // pull-up resistors on the data pin.  It is recommended
  // to provide an external pull-up resistor otherwise...
  gpio_set_pullup(dht_gpio, false, false);

  while(1) {

    if (dht_fetch_data(dht_gpio, &humidity, &temperature)) {
      printf("Humidity: %i%% Temp: %iC\n", humidity, temperature);
    } else {
      printf("Could not read data from sensor...");
    }

    // Three second delay...
    vTaskDelay(3000 / portTICK_RATE_MS);
  }
}

void user_init(void)
{
    uart_set_baud(0, 115200);
    xTaskCreate(dhtMeasurementTask, (signed char *)"dhtMeasurementTask", 256, NULL, 2, NULL);
}


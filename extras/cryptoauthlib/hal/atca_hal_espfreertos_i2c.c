#include <inttypes.h>
#include <espressif/esp_misc.h> // sdk_os_delay_us

#include "i2c/i2c.h"

#include "cryptoauthlib.h"

#include "FreeRTOS.h"
#include "task.h"

// Move to config if ever necessary
#define I2C_BUS (0)

#define vTaskDelayMs(ms)    vTaskDelay((ms)/portTICK_PERIOD_MS)

#if ATEC_HAL_DEBUG || ATEC_HAL_VERBOSE_DEBUG
	#define DBG(...) printf("%s:%d ",__FILE__,__LINE__); printf(__VA_ARGS__); printf("\r\n");
	#define DBGX(...) printf(__VA_ARGS__);
	#if ATEC_HAL_VERBOSE_DEBUG
		#define DEBUG_HAL
		#define DBGV(...) printf("%s:%d ",__FILE__,__LINE__); printf(__VA_ARGS__); printf("\r\n");
		#define DBGVX(...) printf(__VA_ARGS__);
	#else
		#define DBGV(...) {};
		#define DBGVX(...) {};
	#endif

	#ifdef DEBUG_HAL
		static void print_array(uint8_t *data, uint32_t data_size)
		{
			uint32_t n;

			for (n = 0; n < data_size; n++)
			{
				printf("%.2x ", data[n]);
				if (((n + 1) % 16) == 0)
				{
					printf("\r\n");
					if ((n + 1) != data_size)
						printf("         ");
				}
			}
			if (data_size % 16 != 0)
				printf("\r\n");
		}
	#endif
#else
	#define DBG(...) {};
	#define DBGX(...) {};
	#define DBGV(...) {};
	#define DBGVX(...) {};
#endif

#if ATEC_I2C_HAL_DEBUG
	#define I2C_DBG(...) printf(__VA_ARGS__); printf("\r\n");
#else
	#define I2C_DBG(...) {};
#endif

ATCA_STATUS hal_i2c_init(void *hal, ATCAIfaceCfg *cfg)
{
	(void)hal;
	(void)cfg;
	return ATCA_SUCCESS;
}

ATCA_STATUS hal_i2c_post_init(ATCAIface iface)
{
	(void)iface;
	return ATCA_SUCCESS;
}

static bool hal_internal_i2c_write(ATCAIface iface, uint8_t *txdata, int len)
{
	const ATCAIfaceCfg *cfg = atgetifacecfg(iface);
	uint8_t slave_addr = (cfg->atcai2c.slave_address >> 1);

	int result = i2c_slave_write(I2C_BUS, slave_addr, NULL, txdata, len);
	if (result != 0)
	{
		I2C_DBG("I2C write Error: %d len data: %d first byte: %x", result, len, len > 0 ? txdata[0] : 0);
		return false;
	}

	return true;
}

static bool hal_internal_i2c_read(ATCAIface iface, uint8_t *rxdata, int len)
{
	const ATCAIfaceCfg *cfg = atgetifacecfg(iface);
	uint8_t slave_addr = (cfg->atcai2c.slave_address >> 1);

	int result = i2c_slave_read(I2C_BUS, slave_addr, NULL, rxdata, len);
	if (result != 0)
	{
		I2C_DBG("I2C read Error: %d len data: %d", result, len);
		return false;
	}

	return true;
}

ATCA_STATUS hal_i2c_send(ATCAIface iface, uint8_t *txdata, int txlength)
{
	ATCA_STATUS status = ATCA_TX_TIMEOUT;
#ifdef DEBUG_HAL
	// shamelessly taken from hal_sam4s_i2c_asf.c
	printf("hal_i2c_send()\r\n");

	printf("\r\nCommand Packet (size:0x%.8x)\r\n", (uint32_t)txlength);
	printf("Count  : %.2x\r\n", txdata[1]);
	printf("Opcode : %.2x\r\n", txdata[2]);
	printf("Param1 : %.2x\r\n", txdata[3]);
	printf("Param2 : "); print_array(&txdata[4], 2);
	if (txdata[1] > 7) {
		printf("Data   : "); print_array(&txdata[6], txdata[1] - 7);
	}
	printf("CRC    : "); print_array(&txdata[txdata[1] - 1], 2);
	printf("\r\n");
#endif
		
	DBG("Send len %d, sending command", txlength);
	txdata[0] = 0x03; /* Word Address Value = Command */
	txlength++; /* Include Word Address value in txlength */

	if (hal_internal_i2c_write(iface, txdata, txlength))
	{
		DBGV("ATCA_SUCCESS");
		status = ATCA_SUCCESS;
	}
	else 
	{
		DBGV("ATCA_TX_FAIL");
		status = ATCA_TX_FAIL;
	}
	return status;
}

ATCA_STATUS hal_i2c_receive(ATCAIface iface, uint8_t *rxdata, uint16_t *rxlength)
{
	DBGV("hal_i2c_receive()");
	const ATCAIfaceCfg *cfg = atgetifacecfg(iface);

	ATCA_STATUS status = ATCA_RX_TIMEOUT;

	int retries = cfg->rx_retries;

	while (retries-- > 0) 
	{
		if (!hal_internal_i2c_read(iface, rxdata, *rxlength))
		{
			DBGV("ATCA_RX_FAIL--retry %d", retries);
			continue;
		}
		DBGV("ATCA_SUCCESS");
		status = ATCA_SUCCESS;
		break;
	}

#ifdef DEBUG_HAL
	printf("\r\nResponse Packet (size:0x%.4x)\r\n", rxlength);
	printf("Count  : %.2x\r\n", rxdata[0]);
	if (rxdata[0] > 3) {
		printf("Data   : "); print_array(&rxdata[1], rxdata[0] - 3);
		printf("CRC    : "); print_array(&rxdata[rxdata[0] - 2], 2);
	}
	printf("\r\n");
#endif
	/*
	* rxlength is a pointer, which suggests that the actual number of bytes
	* received should be returned in the value pointed to, but none of the
	* existing HAL implementations do it.
	*/
	return status;
}

ATCA_STATUS hal_i2c_wake(ATCAIface iface)
{
	const ATCAIfaceCfg *cfg = atgetifacecfg(iface);

	ATCA_STATUS status = ATCA_WAKE_FAILED;

	uint8_t response[4] = { 0x00, 0x00, 0x00, 0x00 };
	uint8_t expected_response[4] = { 0x04, 0x11, 0x33, 0x43 };

	/*
	* ATCA devices define "wake up" token as START, 80 us of SDA low, STOP.
	*/
	DBGV("Sending wake");
	i2c_start(I2C_BUS);
	atca_delay_us(80);
	i2c_stop(I2C_BUS);

	/* After wake signal we need to wait some time for device to init. */
	atca_delay_us(cfg->wake_delay);

	/* Receive the wake response. */
	uint16_t len = sizeof(response);
	status = hal_i2c_receive(iface, response, &len);
	if (status == ATCA_SUCCESS) {
		DBGV("Response %x %x %x %x", response[0], response[1], response[2], response[3]);
		if (memcmp(response, expected_response, 4) != 0) {
			DBGV("Wake failed");
			status = ATCA_WAKE_FAILED;
		}
	}

	return status;
}

ATCA_STATUS hal_i2c_idle(ATCAIface iface)
{
	uint8_t idle_cmd = 0x02;
	DBG("Sending idle");
	return hal_internal_i2c_write(iface, &idle_cmd, 1) ? ATCA_SUCCESS : ATCA_TX_FAIL;
}

ATCA_STATUS hal_i2c_sleep(ATCAIface iface)
{
	uint8_t sleep_cmd = 0x01;
	DBG("Sending sleep");
	return hal_internal_i2c_write(iface, &sleep_cmd, 1) ? ATCA_SUCCESS : ATCA_TX_FAIL;
}

ATCA_STATUS hal_i2c_release(void *hal_data)
{
	(void)hal_data;
	return ATCA_SUCCESS;
}

ATCA_STATUS hal_i2c_discover_buses(int i2c_buses[], int max_buses)
{
	i2c_buses[0] = 0;   // There is just one bus on our esp8266 i2c implementation
	return ATCA_SUCCESS;
}

ATCA_STATUS hal_i2c_discover_devices(int busNum, ATCAIfaceCfg *cfg, int *found)
{
	ATCAIfaceCfg *head = cfg;
	uint8_t slaveAddress = 0x01;
	ATCADevice device;
	ATCAIface discoverIface;
	ATCACommand command;
	ATCAPacket packet;
	uint16_t rxsize;
	uint32_t execution_or_wait_time;
	ATCA_STATUS status;
	uint8_t revs508[1][4] = { { 0x00, 0x00, 0x50, 0x00 } };
	uint8_t revs108[1][4] = { { 0x80, 0x00, 0x10, 0x01 } };
	uint8_t revs204[2][4] = { { 0x00, 0x02, 0x00, 0x08 },
							  { 0x00, 0x04, 0x05, 0x00 } };
	int i;

	/** \brief default configuration, to be reused during discovery process */
	ATCAIfaceCfg discoverCfg;
	discoverCfg.iface_type				= ATCA_I2C_IFACE;
	discoverCfg.devtype					= ATECC508A;
	discoverCfg.atcai2c.slave_address	= 0x07;
	discoverCfg.atcai2c.bus				= busNum;
	discoverCfg.atcai2c.baud			= 400000;
	//discoverCfg.atcai2c.baud 			= 100000;
	discoverCfg.wake_delay				= 800;
	discoverCfg.rx_retries				= 3;

	ATCAHAL_t hal;

	hal_i2c_init( &hal, &discoverCfg );
	device = newATCADevice( &discoverCfg );
	discoverIface = atGetIFace( device );
	command = atGetCommands( device );

	// iterate through all addresses on given i2c bus
	// all valid 7-bit addresses go from 0x07 to 0x78
	for ( slaveAddress = 0x07; slaveAddress <= 0x78; slaveAddress++ ) {
		discoverCfg.atcai2c.slave_address = slaveAddress << 1;  // turn it into an 8-bit address which is what the rest of the i2c HAL is expecting when a packet is sent

		// wake up device
		// If it wakes, send it a dev rev command.  Based on that response, determine the device type
		// BTW - this will wake every cryptoauth device living on the same bus (ecc508a, sha204a)

		if ( hal_i2c_wake( discoverIface ) == ATCA_SUCCESS ) {
			(*found)++;
			memcpy( (uint8_t*)head, (uint8_t*)&discoverCfg, sizeof(ATCAIfaceCfg));

			memset( packet.data, 0x00, sizeof(packet.data));

			// get devrev info and set device type accordingly
			atInfo( command, &packet );
#ifdef ATCA_NO_POLL
			if ((status = atGetExecTime(packet->opcode, device->mCommands)) != ATCA_SUCCESS)
			{
				return status;
			}
			execution_or_wait_time = device->mCommands->execution_time_msec;
#else
			execution_or_wait_time = 1;//ATCA_POLLING_INIT_TIME_MSEC;
#endif

			// send the command
			if ( (status = atsend( discoverIface, (uint8_t*)&packet, packet.txsize )) != ATCA_SUCCESS ) {
				printf("packet send error\r\n");
				continue;
			}

			// delay the appropriate amount of time for command to execute
			atca_delay_ms(execution_or_wait_time);

			// receive the response
			if ( (status = atreceive( discoverIface, &(packet.data[0]), &rxsize )) != ATCA_SUCCESS )
				continue;

			if ( (status = isATCAError(packet.data)) != ATCA_SUCCESS ) {
				printf("command response error\r\n");
				continue;
			}

			// determine device type from common info and dev rev response byte strings
			for ( i = 0; i < (int)sizeof(revs508) / 4; i++ ) {
				if ( memcmp( &packet.data[1], &revs508[i], 4) == 0 ) {
					discoverCfg.devtype = ATECC508A;
					break;
				}
			}

			for ( i = 0; i < (int)sizeof(revs204) / 4; i++ ) {
				if ( memcmp( &packet.data[1], &revs204[i], 4) == 0 ) {
					discoverCfg.devtype = ATSHA204A;
					break;
				}
			}

			for ( i = 0; i < (int)sizeof(revs108) / 4; i++ ) {
				if ( memcmp( &packet.data[1], &revs108[i], 4) == 0 ) {
					discoverCfg.devtype = ATECC108A;
					break;
				}
			}

			atca_delay_ms(15);
			// now the device type is known, so update the caller's cfg array element with it
			head->devtype = discoverCfg.devtype;
			head++;
		}

		hal_i2c_idle(discoverIface);
	}

	hal_i2c_release(&hal);

	return ATCA_SUCCESS;
}

void atca_delay_us(uint32_t us) 
{
	DBG("atca_delay_us: %d", us);

	/*
	* configTICK_RATE_HZ is 100, implying 10 ms ticks.
	* But we run CPU at 160 and tick timer is not updated, hence / 2 below.
	* https://github.com/espressif/ESP8266_RTOS_SDK/issues/90
	*/
#define USECS_PER_TICK (1000000 / configTICK_RATE_HZ / 2)
  uint32_t ticks = us / USECS_PER_TICK;
  us = us % USECS_PER_TICK;
  if (ticks > 0) vTaskDelay(ticks);
  sdk_os_delay_us(us);
}

void atca_delay_ms(uint32_t ms) 
{
	atca_delay_us(ms * 1000);
}

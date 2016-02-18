#ifndef __ONEWIRE_H__
#define __ONEWIRE_H__

#include <espressif/esp_misc.h> // sdk_os_delay_us
#include "FreeRTOS.h"

// 1 for keeping the parasitic power on H
#define ONEWIRE_DEFAULT_POWER 1

// Maximum number of devices.
#define ONEWIRE_NUM 20

// You can exclude certain features from OneWire.  In theory, this
// might save some space.  In practice, the compiler automatically
// removes unused code (technically, the linker, using -fdata-sections
// and -ffunction-sections when compiling, and Wl,--gc-sections
// when linking), so most of these will not result in any code size
// reduction.  Well, unless you try to use the missing features
// and redesign your program to not need them!  ONEWIRE_CRC8_TABLE
// is the exception, because it selects a fast but large algorithm
// or a small but slow algorithm.

// Select the table-lookup method of computing the 8-bit CRC
// by setting this to 1.  The lookup table enlarges code size by
// about 250 bytes.  It does NOT consume RAM (but did in very
// old versions of OneWire).  If you disable this, a slower
// but very compact algorithm is used.
#ifndef ONEWIRE_CRC8_TABLE
#define ONEWIRE_CRC8_TABLE 0
#endif

// Platform specific I/O definitions
#define noInterrupts portDISABLE_INTERRUPTS
#define interrupts portENABLE_INTERRUPTS
#define delayMicroseconds sdk_os_delay_us

#define DIRECT_READ(pin)         gpio_read(pin)
#define DIRECT_MODE_INPUT(pin)   gpio_enable(pin, GPIO_INPUT)
#define DIRECT_MODE_OUTPUT(pin)  gpio_enable(pin, GPIO_OUTPUT)
#define DIRECT_WRITE_LOW(pin)    gpio_write(pin, 0)
#define DIRECT_WRITE_HIGH(pin)   gpio_write(pin, 1)

void onewire_init(uint8_t pin);

// Perform a 1-Wire reset cycle. Returns 1 if a device responds
// with a presence pulse.  Returns 0 if there is no device or the
// bus is shorted or otherwise held low for more than 250uS
uint8_t onewire_reset(uint8_t pin);

// Issue a 1-Wire rom select command, you do the reset first.
void onewire_select(uint8_t pin, const uint8_t rom[8]);

// Issue a 1-Wire rom skip command, to address all on bus.
void onewire_skip(uint8_t pin);

// Write a byte. If 'power' is one then the wire is held high at
// the end for parasitically powered devices. You are responsible
// for eventually depowering it by calling depower() or doing
// another read or write.
void onewire_write(uint8_t pin, uint8_t v, uint8_t power);

void onewire_write_bytes(uint8_t pin, const uint8_t *buf, uint16_t count, bool power);

// Read a byte.
uint8_t onewire_read(uint8_t pin);

void onewire_read_bytes(uint8_t pin, uint8_t *buf, uint16_t count);

// Write a bit. The bus is always left powered at the end, see
// note in write() about that.
// void onewire_write_bit(uint8_t pin, uint8_t v);

// Read a bit.
// uint8_t onewire_read_bit(uint8_t pin);

// Stop forcing power onto the bus. You only need to do this if
// you used the 'power' flag to write() or used a write_bit() call
// and aren't about to do another read or write. You would rather
// not leave this powered if you don't have to, just in case
// someone shorts your bus.
void onewire_depower(uint8_t pin);

// Clear the search state so that if will start from the beginning again.
void onewire_reset_search(uint8_t pin);

// Setup the search to find the device type 'family_code' on the next call
// to search(*newAddr) if it is present.
void onewire_target_search(uint8_t pin, uint8_t family_code);

// Look for the next device. Returns 1 if a new address has been
// returned. A zero might mean that the bus is shorted, there are
// no devices, or you have already retrieved all of them.  It
// might be a good idea to check the CRC to make sure you didn't
// get garbage.  The order is deterministic. You will always get
// the same devices in the same order.
uint8_t onewire_search(uint8_t pin, uint8_t *newAddr);

// Compute a Dallas Semiconductor 8 bit CRC, these are used in the
// ROM and scratchpad registers.
uint8_t onewire_crc8(const uint8_t *addr, uint8_t len);

// Compute the 1-Wire CRC16 and compare it against the received CRC.
// Example usage (reading a DS2408):
//    // Put everything in a buffer so we can compute the CRC easily.
//    uint8_t buf[13];
//    buf[0] = 0xF0;    // Read PIO Registers
//    buf[1] = 0x88;    // LSB address
//    buf[2] = 0x00;    // MSB address
//    WriteBytes(net, buf, 3);    // Write 3 cmd bytes
//    ReadBytes(net, buf+3, 10);  // Read 6 data bytes, 2 0xFF, 2 CRC16
//    if (!CheckCRC16(buf, 11, &buf[11])) {
//        // Handle error.
//    }     
//          
// @param input - Array of bytes to checksum.
// @param len - How many bytes to use.
// @param inverted_crc - The two CRC16 bytes in the received data.
//                       This should just point into the received data,
//                       *not* at a 16-bit integer.
// @param crc - The crc starting value (optional)
// @return True, iff the CRC matches.
bool onewire_check_crc16(const uint8_t* input, uint16_t len, const uint8_t* inverted_crc, uint16_t crc);

// Compute a Dallas Semiconductor 16 bit CRC.  This is required to check
// the integrity of data received from many 1-Wire devices.  Note that the
// CRC computed here is *not* what you'll get from the 1-Wire network,
// for two reasons:
//   1) The CRC is transmitted bitwise inverted.
//   2) Depending on the endian-ness of your processor, the binary
//      representation of the two-byte return value may have a different
//      byte order than the two bytes you get from 1-Wire.
// @param input - Array of bytes to checksum.
// @param len - How many bytes to use.
// @param crc - The crc starting value (optional)
// @return The CRC16, as defined by Dallas Semiconductor.
uint16_t onewire_crc16(const uint8_t* input, uint16_t len, uint16_t crc);

#endif

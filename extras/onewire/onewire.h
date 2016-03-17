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

typedef uint64_t onewire_addr_t;

typedef struct {
    uint8_t rom_no[8];
    uint8_t last_discrepancy;
    bool last_device_found;
} onewire_search_t;

// The following is an invalid ROM address that will never occur in a device
// (CRC mismatch), and so can be useful as an indicator for "no-such-device",
// etc.
#define ONEWIRE_NONE ((onewire_addr_t)(0xffffffffffffffffLL))

// Perform a 1-Wire reset cycle. Returns 1 if a device responds
// with a presence pulse.  Returns 0 if there is no device or the
// bus is shorted or otherwise held low for more than 250uS
bool onewire_reset(int pin);

// Issue a 1-Wire rom select command, you do the reset first.
void onewire_select(int pin, const onewire_addr_t rom);

// Issue a 1-Wire rom skip command, to address all on bus.
void onewire_skip_rom(int pin);

// Write a byte. The writing code uses open-drain mode and expects the pullup
// resistor to pull the line high when not driven low.  If you need strong
// power after the write (e.g. DS18B20 in parasite power mode) then call
// onewire_power() after this is complete to actively drive the line high.
// Returns true if successful, false on error.
bool onewire_write(int pin, uint8_t v);

bool onewire_write_bytes(int pin, const uint8_t *buf, size_t count);

// Read a byte.
// Returns the read byte on success, negative value on error.
int onewire_read(int pin);

bool onewire_read_bytes(int pin, uint8_t *buf, size_t count);

// Actively drive the bus high to provide extra power for certain operations of
// parasitically-powered devices.
void onewire_power(int pin);

// Stop forcing power onto the bus. You only need to do this if
// you previously called onewire_power() to drive the bus high and now want to
// allow it to float instead.  Note that onewire_reset() will also
// automatically depower the bus first, so you do not need to call this first
// if you just want to start a new operation.
void onewire_depower(int pin);

// Clear the search state so that if will start from the beginning again.
void onewire_search_start(onewire_search_t *search);

// Setup the search to find the device type 'family_code' on the next call
// to search(*newAddr) if it is present.
void onewire_search_prefix(onewire_search_t *search, uint8_t family_code);

// Look for the next device. Returns the address of the next device on the bus,
// or ONEWIRE_NONE if there is no next address.  ONEWIRE_NONE might mean that
// the bus is shorted, there are no devices, or you have already retrieved all
// of them.  It might be a good idea to check the CRC to make sure you didn't
// get garbage.  The order is deterministic. You will always get the same
// devices in the same order.
onewire_addr_t onewire_search_next(onewire_search_t *search, int pin);

// Compute a Dallas Semiconductor 8 bit CRC, these are used in the
// ROM and scratchpad registers.
uint8_t onewire_crc8(const uint8_t *data, uint8_t len);

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
// @param crc_iv - The crc starting value (optional)
// @return True, iff the CRC matches.
bool onewire_check_crc16(const uint8_t* input, size_t len, const uint8_t* inverted_crc, uint16_t crc_iv);

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
// @param crc_iv - The crc starting value (optional)
// @return The CRC16, as defined by Dallas Semiconductor.
uint16_t onewire_crc16(const uint8_t* input, size_t len, uint16_t crc_iv);

#endif

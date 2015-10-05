/* "Boot ROM" function signatures

   Note that a lot of the ROM functions used in the IoT SDK aren't
   referenced from the Espressif RTOS SDK, and are probably incompatible.
 */
#ifndef _ESP_ROM_H
#define _ESP_ROM_H
#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif

void Cache_Read_Disable(void);

/* http://esp8266-re.foogod.com/wiki/Cache_Read_Enable

   Note: when compiling non-OTA we use the ROM version of this
   function, but for OTA we use the version in extras/rboot-ota that
   maps the correct flash page for OTA support.
 */
void Cache_Read_Enable(uint32_t odd_even, uint32_t mb_count, uint32_t no_idea);

#ifdef	__cplusplus
}
#endif

#endif

/* Memory layout for esp-open-rtos when not using OTA
   (ie ROM bootloader only, no second stage rboot)
 */
MEMORY
{
  dport0_0_seg :                      	org = 0x3FF00000, len = 0x10
  dram0_0_seg :                       	org = 0x3FFE8000, len = 0x14000
  iram1_0_seg :                       	org = 0x40100000, len = 0x08000
/* irom0 section, mapped from SPI flash
  - Origin is offset by 0x20000 to leave space for bootloader RAM sections.

  - Length is max 8Mbit of mappable flash, minus start offset
*/
  irom0_0_seg :                       	org = 0x40220000, len = (1M - 0x20000)
}

/* Memory layout for esp-open-rtos when using OTA second stage bootloader */

MEMORY
{
  dport0_0_seg :                      	org = 0x3FF00000, len = 0x10
  dram0_0_seg :                       	org = 0x3FFE8000, len = 0x14000
  iram1_0_seg :                       	org = 0x40100000, len = 0x08000
/* irom0 section, mapped from SPI flash
  - Origin is offset by 0x2010 to create spacer for second stage bootloader image,
    header.

  - Length is max 8Mbit of mappable flash, minus start offset
*/
  irom0_0_seg :                       	org = 0x40202010, len = (1M - 0x2010)
}

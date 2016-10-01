#ifndef _SSD1306__H_
#define _SSD1306__H_

#include <stdint.h>
#include <stdbool.h>
#include <errno.h>

// shifted
#define SSD1306_I2C_ADDR    (0x3C)

#define SSD1306_ROWS        (64)
#define SSD1306_COLS        (128)

/* Issue single command on SSD1306 */
int ssd1306_command(uint8_t cmd);

/* Default init for SSD1306 */
int ssd1306_init();

/* Load picture in xbm format into SSD1306 RAM
 * xbm - pointer to xbm picture array
 * fb - pointer fo local buffer for storing converted xbm image
 */
int ssd1306_load_xbm(uint8_t *xbm, uint8_t *fb);

/* Load local framebuffer into SSD1306 RAM */
int ssd1306_load_frame_buffer(uint8_t buf[], uint16_t len);

/* Clears SSD1306 ram */
int ssd1306_clear_screen();

int ssd1306_display_on(bool on);
int ssd1306_set_display_start_line(uint8_t start);
int ssd1306_set_display_offset(uint8_t offset);
int ssd1306_set_charge_pump_enabled(bool enabled);
int ssd1306_set_mem_addr_mode(uint8_t mode);
int ssd1306_set_segment_remapping_enabled(bool on);
int ssd1306_set_scan_direction_fwd(bool fwd);
int ssd1306_set_com_pin_hw_config(uint8_t config);
int ssd1306_set_contrast(uint8_t contrast);
int ssd1306_set_inversion(bool on);
int ssd1306_set_osc_freq(uint8_t osc_freq);
int ssd1306_set_mux_ratio(uint8_t ratio);
int ssd1306_set_column_addr(uint8_t start, uint8_t stop);
int ssd1306_set_page_addr(uint8_t start, uint8_t stop);
int ssd1306_set_precharge_period(uint8_t prchrg);
int ssd1306_set_deseltct_lvl(uint8_t lvl);
int ssd1306_set_whole_display_lighting(bool light);

#endif // _SSD1306__H_

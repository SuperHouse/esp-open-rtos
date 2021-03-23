#include "cryptoauthlib.h"
#include "lwip/def.h"

#include <stdio.h>
#include <malloc.h>

#define ATEC_DEBUG
#ifdef ATEC_DEBUG
    #define DBG(...) printf("%s:%d ",__FILE__,__LINE__); printf(__VA_ARGS__); printf("\r\n");
    #define DBGX(...) printf(__VA_ARGS__);
#else
    #define DBGV(...) {};
    #define DBGVX(...) {};
#endif

void init_cryptoauthlib(uint8_t i2c_addr)
{
    uint32_t revision;
    uint32_t serial[(ATCA_SERIAL_NUM_SIZE + sizeof(uint32_t) - 1) / sizeof(uint32_t)];
    bool config_is_locked, data_is_locked;
    ATCA_STATUS status;
    const ATCAIfaceCfg *atca_cfg;

    /*
    * Allow for addresses either in 7-bit format (0-7F) or in Atmel 8-bit shifted-by-one format.
    * If user specifies address > 0x80, it must be already shifted since I2C bus addresses > 0x7f are invalid.
    */
    if (i2c_addr < 0x7f) i2c_addr <<= 1;
    atca_cfg = &cfg_ateccx08a_i2c_default;
    if (atca_cfg->atcai2c.slave_address != i2c_addr) 
    {
        ATCAIfaceCfg *cfg = (ATCAIfaceCfg *) calloc(1, sizeof(*cfg));
        memcpy(cfg, &cfg_ateccx08a_i2c_default, sizeof(*cfg));
        cfg->atcai2c.slave_address = i2c_addr;
        atca_cfg = cfg;
    }

    status = atcab_init(atca_cfg);
    if (status != ATCA_SUCCESS)
    {
        DBG("ATCA: Library init failed");
        goto out;
    }

    status = atcab_info((uint8_t *) &revision);
    if (status != ATCA_SUCCESS) 
    {
        DBG("ATCA: Failed to get chip info");
        goto out;
    }

    status = atcab_read_serial_number((uint8_t *) serial);
    if (status != ATCA_SUCCESS) 
    {
        DBG("ATCA: Failed to get chip serial number");
        goto out;
    }

    status = atcab_is_locked(LOCK_ZONE_CONFIG, &config_is_locked);
    status = atcab_is_locked(LOCK_ZONE_DATA, &data_is_locked);
    if (status != ATCA_SUCCESS) 
    {
        DBG("ATCA: Failed to get chip zone lock status");
        goto out;
    }

    DBG("ATECC508 @ 0x%02x: rev 0x%04x S/N 0x%04x%04x%02x, zone "
        "lock status: %s, %s",
        i2c_addr >> 1, htonl(revision), htonl(serial[0]), htonl(serial[1]),
        *((uint8_t *) &serial[2]), (config_is_locked ? "yes" : "no"),
        (data_is_locked ? "yes" : "no"));

out:
  /*
   * We do not free atca_cfg in case of an error even if it was allocated
   * because it is referenced by ATCA basic object.
   */
  if (status != ATCA_SUCCESS) 
  {
    DBG("ATCA: Chip is not available");
    /* In most cases the device can still work, so we continue anyway. */
  }
}

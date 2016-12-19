/*
 * ina3221.c
 *
 *  Created on: 4 oct. 2016
 *      Author: lilian
 */

#include "ina3221.h"

#ifdef INA3221_DEBUG
#define debug(fmt, ...) printf("%s: " fmt "\n", "INA3221", ## __VA_ARGS__)
#else
#define debug(fmt, ...)
#endif

static int _wireWriteRegister (uint8_t addr, uint8_t reg, uint16_t value)
{
    i2c_start();
    if (!i2c_write(addr<<1)) // adress + W
        goto error ;
    if (!i2c_write(reg))
        goto error;
    if (!i2c_write((value >> 8) & 0xFF))
        goto error;
    if (!i2c_write(value & 0xFF))
        goto error ;
    i2c_stop();

    return 0 ;

    error:
    debug("Error while xmitting I2C slave INA3221\n");
    i2c_stop();
    return -EIO ;
}

static int _wireReadRegister(uint8_t addr, uint8_t reg, uint16_t *value)
{
    uint8_t* tampon = (uint8_t*)&value ;

    i2c_start();
    if (!i2c_write(addr<<1)) // adress + W
        goto error ;
    if (!i2c_write(reg))
        goto error;
    i2c_stop();
    i2c_start(); // restart condition
    if (!i2c_write((addr<<1) | 1)) // adress + R
        goto error;
    tampon[0] = i2c_read(0);
    tampon[1] = i2c_read(1);
    i2c_stop();

    //*value = (tampon[1] << 8) | tampon[0] ;

    return 0 ;

    error:
    debug("Error while xmitting I2C slave INA3221\n");
    i2c_stop();
    return -EIO ;
}

int ina3221_trigger(ina3221_t *dev)
{
    return _wireReadRegister(dev->addr, INA3221_REG_MASK, dev->config->mask_register);
}

int ina3221_sync(ina3221_t *dev)
{
    return _wireReadRegister(dev->addr, INA3221_REG_CONFIG, dev->config->config_register);
}

int ina3221_setting(ina3221_t *dev ,bool mode, bool bus, bool shunt)
{
    dev->config.mode = mode ;
    dev->config.ebus = bus ;
    dev->config.esht = shunt ;
    return _wireWriteRegister(dev->addr, INA3221_REG_CONFIG, dev->config.config_register);
}

int ina3221_enableChannel(ina3221_t *dev ,bool ch1, bool ch2, bool ch3)
{
    dev->config.ch1 = ch1 ;
    dev->config.ch2 = ch2 ;
    dev->config.ch3 = ch3 ;
    return _wireWriteRegister(dev->addr, INA3221_REG_CONFIG, dev->config.config_register);
}

int ina3221_setAverage(ina3221_t *dev, ina3221_avg_t avg)
{
    dev->config.avg = avg ;
    return _wireWriteRegister(dev->addr, INA3221_REG_CONFIG, dev->config.config_register);
}

int ina3221_setBusConversionTime(ina3221_t *dev,ina3221_ct_t ct)
{
    dev->config.vbus = ct ;
    return _wireWriteRegister(dev->addr, INA3221_REG_CONFIG, dev->config.config_register);
}

int ina3221_setShuntConversionTime(ina3221_t *dev,ina3221_ct_t ct)
{
    dev->config.vsht = ct ;
    return _wireWriteRegister(dev->addr, INA3221_REG_CONFIG, dev->config.config_register);
}

int ina3221_reset(ina3221_t *dev)
{
    dev->config.config_register = INA3221_DEFAULT_CONFIG ; //dev reset
    dev->config.mask = INA3221_DEFAULT_CONFIG ; //dev reset
    dev->config.reset = 1 ;
    return _wireWriteRegister(dev->addr, INA3221_REG_CONFIG, dev->config.config_register); // send reset to device
}

int ina3221_getBusVoltage(ina3221_t *dev, ina3221_channel_t channel, uint32_t *voltage)
{
    uint16_t raw_value ;
    int err = 0 ;
    if ((err = _wireReadRegister(dev->addr,INA3221_REG_BUSVOLTAGE_1+channel*2, &raw_value)))
        return err;
    *voltage = (raw_value>>3)*8 ; //mV    8mV step
	return 0;
}

int ina3221_getShuntValue(ina3221_t *dev, ina3221_channel_t channel, uint32_t *voltage, uint32_t *current)
{
    uint16_t raw_value ;
	int err = 0 ;
    if ((err = _wireReadRegister(dev->addr,INA3221_REG_SHUNTVOLTAGE_1+channel*2, &raw_value)))
        return err;
    *voltage = (raw_value>>3)*40 ; //uV   40uV step
    if(dev->shunt[channel]) *current = *voltage/dev->shunt[channel] ;  //mA = uV / mOhm
	return 0;
}

int ina3221_setCriticalAlert(ina3221_t *dev, ina3221_channel_t channel, uint32_t current)
{
    uint16_t raw_value = (current*dev->shunt[channel]/40)<<3 ;
    return _wireWriteRegister(dev->addr,INA3221_REG_CRITICAL_ALERT_1+channel*2, raw_value);
}

int ina3221_setWarningAlert(ina3221_t *dev, ina3221_channel_t channel, uint32_t current)
{
    uint16_t raw_value = (current*dev->shunt[channel]/40)<<3 ;
    return _wireWriteRegister(dev->addr,INA3221_REG_WARNING_ALERT_1+channel*2, raw_value);
}

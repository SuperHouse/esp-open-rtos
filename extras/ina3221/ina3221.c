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

#define sign(x) ((x > 0) - (x < 0))

static int _wireWriteRegister (uint8_t addr, uint8_t reg, uint16_t value)
{
    i2c_start();
    if (!i2c_write(addr<<1)) // adress + W
        goto error;
    if (!i2c_write(reg))
        goto error;
    if (!i2c_write((value >> 8) & 0xFF))
        goto error;
    if (!i2c_write(value & 0xFF))
        goto error;
    i2c_stop();

    return 0 ;

    error:
    debug("Error while xmitting I2C slave INA3221\n");
    i2c_stop();
    return -EIO;
}

static int _wireReadRegister(uint8_t addr, uint8_t reg, uint16_t *value)
{
    uint8_t* tampon = (uint8_t*)&value;

    i2c_start();
    if (!i2c_write(addr<<1)) // adress + W
        goto error;
    if (!i2c_write(reg))
        goto error;
    i2c_stop();
    i2c_start(); // restart condition
    if (!i2c_write((addr<<1) | 1)) // adress + R
        goto error;
    tampon[1] = i2c_read(0);
    tampon[0] = i2c_read(1);
    i2c_stop();
    return 0;

    error:
    debug("Error while xmitting I2C slave INA3221\n");
    i2c_stop();
    return -EIO;
}

int ina3221_trigger(ina3221_t *dev)
{
    return _wireReadRegister(dev->addr, INA3221_REG_MASK, &dev->mask.mask_register);
}

int ina3221_sync(ina3221_t *dev)
{
    uint16_t ptr_config ;
    int err = 0;
    if ((err = _wireReadRegister(dev->addr, INA3221_REG_CONFIG, &ptr_config))) // Read config
        return err;
    if( ptr_config != dev->config.config_register) {
        if ((err = _wireWriteRegister(dev->addr, INA3221_REG_CONFIG, dev->config.config_register))) // Update config
            return err;
    }
    return 0;
}

int ina3221_setting(ina3221_t *dev ,bool mode, bool bus, bool shunt)
{
    dev->config.mode = mode;
    dev->config.ebus = bus;
    dev->config.esht = shunt;
    return _wireWriteRegister(dev->addr, INA3221_REG_CONFIG, dev->config.config_register);
}

int ina3221_enableChannel(ina3221_t *dev ,bool ch1, bool ch2, bool ch3)
{
    dev->config.ch1 = ch1;
    dev->config.ch2 = ch2;
    dev->config.ch3 = ch3;
    return _wireWriteRegister(dev->addr, INA3221_REG_CONFIG, dev->config.config_register);
}

int ina3221_enableChannelSum(ina3221_t *dev ,bool ch1, bool ch2, bool ch3)
{
    dev->mask.scc1 = ch1;
    dev->mask.scc2 = ch2;
    dev->mask.scc3 = ch3;
    return _wireWriteRegister(dev->addr, INA3221_REG_MASK, dev->mask.mask_register);
}

int ina3221_enableLatchPin(ina3221_t *dev ,bool warning, bool critical)
{
    dev->mask.wen = warning;
    dev->mask.cen = critical;
    return _wireWriteRegister(dev->addr, INA3221_REG_MASK, dev->mask.mask_register);
}

int ina3221_setAverage(ina3221_t *dev, ina3221_avg_t avg)
{
    dev->config.avg = avg;
    return _wireWriteRegister(dev->addr, INA3221_REG_CONFIG, dev->config.config_register);
}

int ina3221_setBusConversionTime(ina3221_t *dev,ina3221_ct_t ct)
{
    dev->config.vbus = ct;
    return _wireWriteRegister(dev->addr, INA3221_REG_CONFIG, dev->config.config_register);
}

int ina3221_setShuntConversionTime(ina3221_t *dev,ina3221_ct_t ct)
{
    dev->config.vsht = ct;
    return _wireWriteRegister(dev->addr, INA3221_REG_CONFIG, dev->config.config_register);
}

int ina3221_reset(ina3221_t *dev)
{
    dev->config.config_register = INA3221_DEFAULT_CONFIG ; //dev reset
    dev->mask.mask_register = INA3221_DEFAULT_CONFIG ; //dev reset
    dev->config.reset = 1 ;
    return _wireWriteRegister(dev->addr, INA3221_REG_CONFIG, dev->config.config_register); // send reset to device
}

int ina3221_getBusVoltage(ina3221_t *dev, ina3221_channel_t channel, int32_t *voltage)
{
    int16_t raw_value;
    int err = 0;
    if ((err = _wireReadRegister(dev->addr,INA3221_REG_BUSVOLTAGE_1+channel*2, (uint16_t*)&raw_value)))
        return err;
    *voltage = (raw_value>>3)*8; //mV    8mV step
	return 0;
}

int ina3221_getShuntValue(ina3221_t *dev, ina3221_channel_t channel, int32_t *voltage, int32_t *current)
{
    int16_t raw_value;
	int err = 0;
    if ((err = _wireReadRegister(dev->addr,INA3221_REG_SHUNTVOLTAGE_1+channel*2, (uint16_t*)&raw_value)))
        return err;
    *voltage = (raw_value>>3)*40 ; //uV   40uV step
    if(!dev->shunt[channel])
    {
        debug("No shunt configured for channel %u. Dev:%X INA3221\n",channel+1, dev->addr);
        return -EINVAL;
    }
    *current = *voltage/dev->shunt[channel] ;  //mA = uV / mOhm
	return 0;
}

int ina3221_getSumShuntValue(ina3221_t *dev, int32_t *voltage)
{
    int16_t raw_value;
    int err = 0;
    if ((err = _wireReadRegister(dev->addr,INA3221_REG_SHUNT_VOLTAGE_SUM, (uint16_t*)&raw_value)))
        return err;
    *voltage = (raw_value>>1)*40; //uV   40uV step
    return 0;
}

int ina3221_setCriticalAlert(ina3221_t *dev, ina3221_channel_t channel, int32_t current)
{
    int16_t raw_value = ((current*dev->shunt[channel]+20*sign(current))/40)<<3; // round and format
    uint16_t* ptr_value = (uint16_t*)&raw_value; // FIXME: Need this to convert int to uint without change data ?
    return _wireWriteRegister(dev->addr,INA3221_REG_CRITICAL_ALERT_1+channel*2, *ptr_value);
}

int ina3221_setWarningAlert(ina3221_t *dev, ina3221_channel_t channel, int32_t current)
{
    int16_t raw_value = ((current*dev->shunt[channel]+ 20*sign(current))/40)<<3; // round and format
    uint16_t* ptr_value = (uint16_t*)&raw_value; // FIXME: Need this to convert int to uint without change data ?
    return _wireWriteRegister(dev->addr,INA3221_REG_WARNING_ALERT_1+channel*2, *ptr_value);
}

int ina3221_setSumWarningAlert(ina3221_t *dev, int32_t voltage)
{
    int16_t raw_value = ((voltage + 20*sign(voltage))/40)<<1; // round and format
    uint16_t* ptr_value = (uint16_t*)&raw_value; // FIXME: Need this to convert int to uint without change data ?
    return _wireWriteRegister(dev->addr,INA3221_REG_SHUNT_VOLTAGE_SUM_LIMIT, *ptr_value);
}

int ina3221_setPowerValidUpperLimit(ina3221_t *dev, int32_t voltage)
{
    if(!dev->config.ebus)
    {
        debug("Bus not enable. Dev:%X INA3221\n", dev->addr);
        return -ENOTSUP;
    }
    int16_t raw_value = ((voltage+4*sign(voltage))/8)<<3; // round and format
    uint16_t* ptr_value = (uint16_t*)&raw_value; // FIXME: Need this to convert int to uint without change data ?
    return _wireWriteRegister(dev->addr,INA3221_REG_VALID_POWER_UPPER_LIMIT, *ptr_value);
}

int ina3221_setPowerValidLowerLimit(ina3221_t *dev, int32_t voltage)
{
    if(!dev->config.ebus)
    {
        debug("Bus not enable. Dev:%X INA3221\n", dev->addr);
        return -ENOTSUP;
    }
    int16_t raw_value = ((voltage+4*sign(voltage))/8)<<3; // round and format
    uint16_t* ptr_value = (uint16_t*)&raw_value; // FIXME: Need this to convert int to uint without change data ?
    return _wireWriteRegister(dev->addr,INA3221_REG_VALID_POWER_LOWER_LIMIT, *ptr_value);
}

#include "FreeRTOS.h"
#include "task.h"

#include "onewire/onewire.h"
#include "ds18b20.h"

#define DS1820_WRITE_SCRATCHPAD 0x4E
#define DS1820_READ_SCRATCHPAD  0xBE
#define DS1820_COPY_SCRATCHPAD  0x48
#define DS1820_READ_EEPROM      0xB8
#define DS1820_READ_PWRSUPPLY   0xB4
#define DS1820_SEARCHROM        0xF0
#define DS1820_SKIP_ROM         0xCC
#define DS1820_READROM          0x33
#define DS1820_MATCHROM         0x55
#define DS1820_ALARMSEARCH      0xEC
#define DS1820_CONVERT_T        0x44

uint8_t ds18b20_read_all(uint8_t pin, ds_sensor_t *result) {
    onewire_addr_t addr;
    onewire_search_t search;
    uint8_t sensor_id = 0;

    onewire_search_start(&search);
    
    while ((addr = onewire_search_next(&search, pin)) != ONEWIRE_NONE) {
        uint8_t crc = onewire_crc8((uint8_t *)&addr, 7);
        if (crc != (addr >> 56)){
            printf("CRC check failed: %02X %02X\n", (unsigned)(addr >> 56), crc);
            return 0;
        }

        onewire_reset(pin);
        onewire_select(pin, addr);
        onewire_write(pin, DS1820_CONVERT_T);
        
        vTaskDelay(750 / portTICK_RATE_MS);
        
        onewire_reset(pin);
        onewire_select(pin, addr);
        onewire_write(pin, DS1820_READ_SCRATCHPAD);

        uint8_t get[10];

        for (int k=0;k<9;k++){
            get[k]=onewire_read(pin);
        }
        
        //printf("\n ScratchPAD DATA = %X %X %X %X %X %X %X %X %X\n",get[8],get[7],get[6],get[5],get[4],get[3],get[2],get[1],get[0]);
        crc = onewire_crc8(get, 8);

        if (crc != get[8]){
            printf("CRC check failed: %02X %02X\n", get[8], crc);
            return 0;
        }

        uint8_t temp_msb = get[1]; // Sign byte + lsbit
        uint8_t temp_lsb = get[0]; // Temp data plus lsb
        uint16_t temp = temp_msb << 8 | temp_lsb;
        
        float temperature;

        temperature = (temp * 625.0)/10000;
        //printf("Got a DS18B20 Reading: %d.%02d\n", (int)temperature, (int)(temperature - (int)temperature) * 100);
        result[sensor_id].id = sensor_id;
        result[sensor_id].value = temperature;
        sensor_id++;
    }
    return sensor_id;
}

float ds18b20_read_single(uint8_t pin) {
  
    onewire_reset(pin);
    onewire_skip_rom(pin);
    onewire_write(pin, DS1820_CONVERT_T);

    vTaskDelay(750 / portTICK_RATE_MS);

    onewire_reset(pin);
    onewire_skip_rom(pin);
    onewire_write(pin, DS1820_READ_SCRATCHPAD);
    
    uint8_t get[10];

    for (int k=0;k<9;k++){
        get[k]=onewire_read(pin);
    }
    
    //printf("\n ScratchPAD DATA = %X %X %X %X %X %X %X %X %X\n",get[8],get[7],get[6],get[5],get[4],get[3],get[2],get[1],get[0]);
    uint8_t crc = onewire_crc8(get, 8);

    if (crc != get[8]){
        printf("CRC check failed: %02X %02X", get[8], crc);
        return 0;
    }

    uint8_t temp_msb = get[1]; // Sign byte + lsbit
    uint8_t temp_lsb = get[0]; // Temp data plus lsb
    
    uint16_t temp = temp_msb << 8 | temp_lsb;
    
    float temperature;

    temperature = (temp * 625.0)/10000;
    return temperature;
    //printf("Got a DS18B20 Reading: %d.%02d\n", (int)temperature, (int)(temperature - (int)temperature) * 100);
}

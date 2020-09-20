#ifndef rf_h_INCLUDED
#define rf_h_INCLUDED

#include <stdint.h>
#include <stdbool.h>

#define RECIEVE_MAX_BUFFER_LEN 67
#define SEPERATION_LIMIT_433MHZ 5000 
#define RECIEVE_TOLERANCE_433MHZ 60

/*  
 *  This is a pure c reimplemnation of the rc swich library, it was build to be used with open rtos
 *  Copyright: Felix Richter 2018
 */


typedef struct{
	uint8_t high_time;
	uint8_t low_time;
} pulse_t;

typedef struct{
	pulse_t sync;
	pulse_t zero;
	pulse_t one;
	bool inverted;
} protocol_433mhz;

typedef struct{
	uint32_t data;
	unsigned int code_lenght;
	protocol_433mhz* protocol;
	uint16_t pulse_length;
	uint8_t repeat;
} message_433mhz;

typedef struct{
	uint16_t recieve_len;
	unsigned long last_time;
	unsigned int changeCount;
	unsigned int repeatCount;
	unsigned int seperation_limit;
	unsigned int recieve_tolerance;
	unsigned int timeings[RECIEVE_MAX_BUFFER_LEN];
} reciever_433mhz;

void send_message_433mhz(uint8_t pin, message_433mhz* msg);
void recieve_on_interrupt(reciever_433mhz* reciever);
bool decode_recieved(reciever_433mhz* reciever, protocol_433mhz* proto, message_433mhz* msg);
reciever_433mhz* create_reciever_buffer();

extern protocol_433mhz protocols_433mhz[];  

typedef enum {
	PROTO1,
	PROTO2,
	PROTO3,
	PROTO4,
	PROTO5,
	PROTO6,
	PROTO7,
	PROTOCOL_COUNT
} protocol_name_433mhz;

#endif // rf_h_INCLUDED


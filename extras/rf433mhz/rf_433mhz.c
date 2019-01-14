#include "rf_433mhz.h"
#include "util.h"

protocol_433mhz protocols_433mhz[] = {
	{ { 1, 31 }, { 1, 3 }, { 3, 1 }, false },			// protocol 1
	{ {  1, 10 }, {  1,  2 }, {  2,  1 }, false },		// protocol 2
	{ { 30, 71 }, {  4, 11 }, {  9,  6 }, false },		// protocol 3
	{ {  1,  6 }, {  1,  3 }, {  3,  1 }, false },		// protocol 4
	{ {  6, 14 }, {  1,  2 }, {  2,  1 }, false },		// protocol 5
	{ { 23,  1 }, {  1,  2 }, {  2,  1 }, true },		// protocol 6 (HT6P20B)
	{ {  2, 62 }, {  1,  6 }, {  6,  1 }, false }		// protocol 7 (HS2303-PT, i. e. used in AUKEY Remote)
};

static inline unsigned int diff(int A, int B) {
	  return abs(A - B);
}

//Transmit single pulse meaning 1 or 0 or sync
void transmit(uint8_t pin, protocol_433mhz* proto, pulse_t pulse_params, uint16_t pulse_length) {
	bool firstLogicLevel = proto->inverted ? 0 : 1;
	bool secondLogicLevel = proto->inverted ? 1 : 0;

	setPinDigital(pin, firstLogicLevel);
	delayMicroSec(pulse_length * pulse_params.high_time);
	setPinDigital(pin, secondLogicLevel);
	delayMicroSec(pulse_length * pulse_params.low_time);
}

void send_message_433mhz(uint8_t pin, message_433mhz* msg) {
	disableInterrupts();
	for (uint8_t n_repeat=0; n_repeat < msg->repeat; n_repeat++) {
		for(int i = msg->code_lenght-1; i>=0; i--) {
			if ( msg->data & (1L << i) ) {
				transmit(pin, msg->protocol, msg->protocol->one, msg->pulse_length);
			} else {
				transmit(pin, msg->protocol, msg->protocol->zero, msg->pulse_length);
			}
		}
		transmit(pin, msg->protocol, msg->protocol->sync, msg->pulse_length);
	}
	//make sure antenna is powered off 
	setPinDigital(pin, 0);
	enableInterrupts();
}

void recieve_on_interrupt(reciever_433mhz* reciever) {
	long time = getMicroSec();
	unsigned int duration = time - reciever->last_time;

	if (duration > reciever->seperation_limit) {
		//long stretch without change -> might be gap between transmittions
		if ( diff(duration, reciever->timeings[0]) < 200 ) {
			//this long singal is close in length to the previous recorded signals
			reciever->repeatCount++;
			return;
		} else {
			reciever->changeCount = 0;
		}
	}

	if ( reciever->changeCount >= RECIEVE_MAX_BUFFER_LEN ) {
		reciever->changeCount = 0;
		reciever->repeatCount = 0;
	}

	reciever->timeings[reciever->changeCount++] = duration;
	reciever->last_time = time;
}

bool decode_recieved(reciever_433mhz* reciever, protocol_433mhz* proto, message_433mhz* msg) {
	msg->data = 0;
	unsigned int sync_len = (proto->sync.low_time > proto->sync.high_time) ? proto->sync.low_time : proto->sync.high_time;
	unsigned int delay = reciever->timeings[0]/sync_len;
	unsigned int delay_tolerance = delay * reciever->recieve_tolerance /100;
	/* For protocols that start low, the sync period looks like
	 *               _________
	 * _____________|         |XXXXXXXXXXXX|
	 *
	 * |--1st dur--|-2nd dur-|-Start data-|
	 *
	 * The 3rd saved duration starts the data.
	 *
	 * For protocols that start high, the sync period looks like
	 *
	 *  ______________
	 * |              |____________|XXXXXXXXXXXXX|
	 *
	 * |-filtered out-|--1st dur--|--Start data--|
	 *
	 * The 2nd saved duration starts the data
	 */
	unsigned int firstdata = proto->inverted ? 2 : 1;
	for (unsigned int i = firstdata; i < reciever->changeCount-1; i+=2) {
		msg->data <<= 1;
		if ( diff(reciever->timeings[i], delay*proto->zero.high_time) < delay_tolerance && 
			diff(reciever->timeings[i+1], delay*proto->zero.low_time) < delay_tolerance ){
			//recieved zero
		} else if ( diff(reciever->timeings[i], delay*proto->one.high_time) < delay_tolerance && 
			diff(reciever->timeings[i+1], delay*proto->one.low_time) < delay_tolerance ) {
			//recieved one
			msg->data |= 1;
		} else {
			//Failed to decode data with given protocol
			return false;
		}
	}
	if (reciever->changeCount > 7) {
		msg->code_lenght = (reciever->changeCount -1)/2;
		msg->protocol = proto;
		msg->pulse_length = delay;
		return true;
	}
	return false;
}

reciever_433mhz* create_reciever_buffer() {
	reciever_433mhz* reciever = malloc(sizeof(reciever_433mhz));
	reciever->recieve_tolerance = RECIEVE_TOLERANCE_433MHZ;
	reciever->seperation_limit = SEPERATION_LIMIT_433MHZ;
	reciever->changeCount = 0;
	reciever->repeatCount = 0;
	reciever->last_time = getMicroSec();
	reciever->recieve_len = 0;
	memset(&reciever->timeings, 0, RECIEVE_MAX_BUFFER_LEN);
	return reciever;
}

#include <stdio.h>
#include <string.h>
#include <stdint.h>

#include "tinf.h"
#include "defl_static.h"
#include "conn.h"
#include "ws.h"

const static char http_get[] = "GET wss://%s%s HTTP/1.1\r\n";
const static char http_host[] = "Host: %s\r\n";
const static char http_origin[] = "Origin: https://%s\r\n";
const static char http_upgrade[] = "Upgrade: websocket\r\n";
const static char http_connection[] = "Connection: Upgrade\r\n";
const static char http_ws_key[] = "Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nSec-WebSocket-Extensions: permessage-deflate\r\n";
const static char http_ws_version[] = "Sec-WebSocket-Version: 13\r\n";

#define WS_OPCODE_CONTINUATION 0x00
#define WS_OPCODE_TEXT 0x01
#define WS_OPCODE_BINARY 0x02
#define WS_OPCODE_CONECTION_CLOSE 0x08
#define WS_OPCODE_PING 0x09
#define WS_OPCODE_PONG 0x0A

int wsConnect(int socket, const char *host, const char *path, Bool *compression) {
	char server_reply[1024];
	char buffer[1024];
	
	memset(server_reply, 0, sizeof(server_reply));
	*compression = false;
		
	memset(buffer, 0, sizeof(buffer));
    sprintf(buffer, http_get, host, path);
	ConnWrite(socket, buffer, strlen(buffer));
	
	memset(buffer, 0, sizeof(buffer));
    sprintf(buffer, http_host, host);
	ConnWrite(socket, buffer, strlen(buffer));
	
	memset(buffer, 0, sizeof(buffer));
    sprintf(buffer, http_origin, host);
	ConnWrite(socket, buffer, strlen(buffer));
	
	ConnWrite(socket, http_upgrade, strlen(http_upgrade));
	ConnWrite(socket, http_connection, strlen(http_connection));
	ConnWrite(socket, http_ws_key, strlen(http_ws_key));
	ConnWrite(socket, http_ws_version, strlen(http_ws_version));
	ConnWrite(socket, "\r\n", 2);
		
	if (ConnRead(socket, server_reply, 300) <= 0) {
		return -1;
	}
		
	if (strstr(server_reply, "HTTP/1.1 101 Switching Protocols") == NULL) {
		return -1;
	}
	
	if (strstr(server_reply, "permessage-deflate") != 0) {
		*compression = true;
	}
	
	return 1;	
}

void wsInitFrame(WsFrame *frame) {
	frame->finFlag = 0;
	frame->maskingFlag = 0;
	frame->opcode = 0;
	frame->payloadLenght = 0;
	frame->maskingMap = 0;
	frame->payload = 0;
}

void wsCreateTextFrame(WsFrame *frame, const char *text) {
	frame->finFlag = 1;
	frame->maskingFlag = 1;
	frame->opcode = WS_OPCODE_TEXT;
	frame->payloadLenght = strlen(text);
	frame->maskingMap = 0x00000000;
	frame->payload = (uint8_t *)text;
}

void wsSendFrame(int socket, WsFrame *frame) {
	uint8_t finOpcode = (frame->finFlag) ? frame->opcode | 0x80 : frame->opcode;
	uint8_t maskPayloadLength = (frame->maskingFlag) ? frame->payloadLenght | 0x80 : frame->payloadLenght;	
	unsigned short sizePayload;
	
	// todo support extended payloadLength
	// The length of the "Payload data", in bytes: if 0-125, that is the
	// payload length.  If 126, the following 2 bytes interpreted as a
	// 16-bit unsigned integer are the payload length.  If 127, the
	// following 8 bytes interpreted as a 64-bit unsigned integer (the
	// most significant bit MUST be 0) are the payload length.  Multibyte
	// length quantities are expressed in network byte order.  Note that
	// in all cases, the minimal number of bytes MUST be used to encode
	// the length, for example, the length of a 124-byte-long string
	// can't be encoded as the sequence 126, 0, 124.  The payload length
	// is the length of the "Extension data" + the length of the
	// "Application data".  The length of the "Extension data" may be
	// zero, in which case the payload length is the length of the
	// "Application data".
	// FE = 126
	if (frame->payloadLenght > 125) {
		maskPayloadLength = 0xfe;
		sizePayload = MAKEWORD(LL(frame->payloadLenght), LH(frame->payloadLenght));
	}
	

	ConnWrite(socket, &finOpcode, 1);
	ConnWrite(socket, &maskPayloadLength, 1);
	
	if (frame->payloadLenght > 125) {
		sizePayload = _SWAPS(sizePayload);
		ConnWrite(socket, &sizePayload, 2);
	}
	
	ConnWrite(socket, &frame->maskingMap , 4);
	ConnWrite(socket, frame->payload, frame->payloadLenght);
}

void wsReceiveFrame(int socket, WsFrame *frame, Bool *timeout, int seconds) {
	unsigned char inBuffer[2048];
	int receivedTotal = 0;
	int receivedLength = 0;
	int i = 0, ret = 0;
	
	*timeout = false;
	memset(inBuffer, 0, sizeof(inBuffer));
			
	while((ret = ConnReadBytesAvailable(socket)) == 0) {
		i++;
		sleep_ms(10);
		if ((i > (seconds * 100)) && ret == 0) {
			*timeout = true;
			return;
		}
	}
	
	while((receivedLength = ConnRead(socket, inBuffer + receivedTotal, 2 - receivedTotal)) > 0 && receivedTotal < 2) {
        receivedTotal += receivedLength;
    }
		
    frame->finFlag = (inBuffer[0] & 0x80) >> 7;
    frame->opcode = inBuffer[0] & 0x0F;
    frame->maskingFlag = inBuffer[1] & 0x80;
    frame->payloadLenght = MAKEWORD(inBuffer[1], 0x00);
	
    if (frame->payloadLenght > 125) {
		receivedLength = ConnRead(socket, inBuffer, 2);
		frame->payloadLenght = MAKEWORD(inBuffer[1], inBuffer[0]);
	}
	
	while((receivedLength = ConnRead(socket, inBuffer + receivedTotal, frame->payloadLenght + 2 - receivedTotal)) > 0 && receivedTotal < frame->payloadLenght) {
        receivedTotal += receivedLength;
        if ((receivedTotal - 2) == frame->payloadLenght) break;
    }
		
    memcpy(frame->payload, inBuffer + 2, receivedTotal - 2);
	
    if (frame->opcode == WS_OPCODE_PING) {
        wsSendPong(socket, frame);
    }
}

unsigned char gzipBuffer[2048];
void wsInflateFrame(WsFrame *frame) {
    unsigned int outlen = 2048;
	
	memset(gzipBuffer, 0, sizeof(gzipBuffer));
				
	// https://tools.ietf.org/html/draft-ietf-hybi-permessage-compression-28#page-22
	// 7.2.2 Decompression
	frame->payload[frame->payloadLenght-1] = 0x01;
	frame->payload[frame->payloadLenght] = 0x00;
	frame->payload[frame->payloadLenght+1] = 0x00;
	frame->payload[frame->payloadLenght+2] = 0xff;
	frame->payload[frame->payloadLenght+3] = 0xff;
	
    tinf_uncompress(gzipBuffer, &outlen, frame->payload, frame->payloadLenght+4);
	
    memset(frame->payload, 0, frame->payloadLenght+3);
    memcpy(frame->payload, gzipBuffer, outlen);
}

void wsDeflateFrame(WsFrame *frame) {
    struct Outbuf out = {0};
	memset(gzipBuffer, 0, sizeof(gzipBuffer));
		
	//Deflate payload
    zlib_start_block(&out);
    tinf_compress(&out, frame->payload, frame->payloadLenght);  
    zlib_finish_block(&out);

    memcpy(gzipBuffer, out.outbuf, out.outlen);
	
	frame->finFlag = 0;
	frame->opcode = 0xc1;
	frame->payloadLenght = out.outlen;
	frame->payload = (uint8_t *)gzipBuffer;
	
	zlib_free_block(&out);
}

void wsSendPong(int socket, WsFrame *frame) {
    frame->maskingFlag = 1;	
	frame->opcode = WS_OPCODE_PONG;
	frame->payloadLenght = 0;
	wsSendFrame(socket, frame);
}

void wsSendText(int socket, const char *text, Bool compression) {
    WsFrame frame;
	wsInitFrame(&frame);
	wsCreateTextFrame(&frame, text);
	if (compression) wsDeflateFrame(&frame);
    wsSendFrame(socket, &frame);
}

void wsReceiveText(int socket, char *buffer, int bufferSize, Bool compression, Bool *timeout, int seconds) {
	WsFrame frame;
	wsInitFrame(&frame);
	memset(buffer, 0, bufferSize);
	frame.payload = (uint8_t *)buffer;
	wsReceiveFrame(socket, &frame, timeout, seconds);
	if (frame.opcode == WS_OPCODE_TEXT && compression) wsInflateFrame(&frame);
	if (frame.opcode == WS_OPCODE_PONG) strcpy(buffer, "OPCODE_PING");
}

void hex_dump(const char *desc, const void *addr, const size_t len) {
    int i;
    unsigned char buff[17];
    unsigned char *pc = (unsigned char*)addr;

    // Output description if given.
    if (desc != NULL)
        printf ("%s:\n", desc);

    // Process every byte in the data.
    for (i = 0; i < len; i++) {
        // Multiple of 16 means new line (with line offset).

        if ((i % 16) == 0) {
            // Just don't print ASCII for the zeroth line.
            if (i != 0)
                printf ("  %s\n", buff);

            // Output the offset.
            printf ("  %04x ", i);
        }

        // Now the hex code for the specific character.
        printf (" %02x", pc[i]);

        // And store a printable ASCII character for later.
        if ((pc[i] < 0x20) || (pc[i] > 0x7e))
            buff[i % 16] = '.';
        else
            buff[i % 16] = pc[i];
        buff[(i % 16) + 1] = '\0';
    }

    // Pad out last line if not exactly 16 characters.
    while ((i % 16) != 0) {
        printf ("   ");
        i++;
    }

    // And print the final ASCII bit.
    printf ("  %s\n", buff);
}

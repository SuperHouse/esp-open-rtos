#ifndef WEBSOCKETS
#define WEBSOCKETS

#include "util.h"

typedef struct WsFrame_ {
	Byte finFlag;
	Byte maskingFlag;
	Byte opcode;
	Uint32 payloadLenght;
	Uint32 maskingMap;
	Byte *payload;
} WsFrame;

int wsConnect(int socket, const char *host, const char *path, Bool *compression);
void wsInitFrame(WsFrame *frame);
void wsCreateTextFrame(WsFrame *frame, const char *text);
void wsSendFrame(int socket, WsFrame *frame);
void wsReceiveFrame(int socket, WsFrame *frame, Bool *timeout, int seconds);
void wsInflateFrame(WsFrame *frame);
void wsDeflateFrame(WsFrame *frame);
void wsSendPong(int socket, WsFrame *frame);
void wsSendText(int socket, const char *text, Bool compression);
void wsReceiveText(int socket, char *buffer, int bufferSize, Bool compression, Bool *timeout, int seconds);
void hex_dump(const char *desc, const void *addr, const size_t len);

#endif

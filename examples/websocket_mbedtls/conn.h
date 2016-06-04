#ifndef CONN
#define CONN

int ConnConnect(char *host, int port);
int ConnReadBytesAvailable(int sslHandle);
int ConnRead(int sslHandle, void *buf, int num);
int ConnWrite(int sslHandle, const void *buf, int num);
void ConnClose(int sslHandle);
void sleep_ms(int milliseconds);

#endif
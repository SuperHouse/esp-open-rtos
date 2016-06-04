// util
void hex_dump(const char *desc, const void *addr, const size_t len);

#define Int32	signed long		
#define Uint32	unsigned long	
#define Byte	unsigned char	
#define Word	unsigned short
#define Bool	char
#define true	1
#define false	0

#define MAKEWORD(a, b)      ((Word)(((Byte)((a) & 0xff)) | ((Word)((Byte)((b) & 0xff))) << 8))
#define MAKELONG(low,high)	((Int32)(((Word)(low)) | (((Uint32)((Word)(high))) << 16)))
#define LOWORD(l)           ((Word)((l) & 0xffff))
#define HIWORD(l)           ((Word)((l) >> 16))
#define LOBYTE(w)           ((Byte)((w) & 0xff))
#define HIBYTE(w)           ((Byte)((w) >> 8))
#define HH(x)				HIBYTE(HIWORD( x ))
#define HL(x)				LOBYTE(HIWORD( x ))
#define LH(x)				HIBYTE(LOWORD( x ))
#define LL(x)				LOBYTE(LOWORD( x ))
#define LONIBLE(x)			(((Byte)x) & 0x0F )
#define HINIBLE(x)			((((Byte)x) * 0xF0)>>4)

#define _SWAPS(x) 	((unsigned short)( \
						((((unsigned short) x) & 0x000000FF) << 8) | \
						((((unsigned short) x) & 0x0000FF00) >> 8)   \
					))

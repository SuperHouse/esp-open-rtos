#include "espressif/esp_common.h"
#include "esp/uart.h"

#include <string.h>

#include "FreeRTOS.h"
#include "task.h"

#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include "lwip/netdb.h"
#include "lwip/dns.h"
#include "lwip/api.h"

#include "ssid_config.h"

/* mbedtls/config.h MUST appear before all other mbedtls headers, or
   you'll get the default config.

   (Although mostly that isn't a big problem, you just might get
   errors at link time if functions don't exist.) */
#include "mbedtls/config.h"

#include "mbedtls/net.h"
#include "mbedtls/debug.h"
#include "mbedtls/ssl.h"
#include "mbedtls/entropy.h"
#include "mbedtls/ctr_drbg.h"
#include "mbedtls/error.h"
#include "mbedtls/certs.h"

#include <stdio.h>
#include <string.h>

#include "conn.h"

/* SSL file descriptors */
#define SSL_HANDLES_SIZE 4
mbedtls_ssl_context* sslHandles[SSL_HANDLES_SIZE] = {NULL, NULL, NULL, NULL};
unsigned char ctxC = 0;

mbedtls_ssl_config conf;
mbedtls_x509_crt cacert;
mbedtls_ctr_drbg_context ctr_drbg;
mbedtls_entropy_context entropy;

/* Connect to a hostname and port using TLS 1.2 and 
return a index for one SSL connection on the pool or -1 if error
*/
int ConnConnect(char *hostname, int port) {
	int ret = 0;
	mbedtls_ssl_context *sslFD;
	mbedtls_net_context *socketFD;
	int sslHandle = 0;
	char s_port[10];
		
	// configure mbedtls
	if (!ctxC) {
	    mbedtls_ssl_config_init( &conf );
	    mbedtls_x509_crt_init( &cacert );
	    mbedtls_ctr_drbg_init( &ctr_drbg );
	    mbedtls_entropy_init( &entropy );
		
	    if( ( ret = mbedtls_ctr_drbg_seed( &ctr_drbg, mbedtls_entropy_func, &entropy,
	                               (const unsigned char *) "ssl_client1",
	                               strlen( "ssl_client1" ) ) ) != 0 )
	    {
	        printf( " failed\n  ! mbedtls_ctr_drbg_seed returned %d\n", ret );
	        return -1;
	    }
		
	    ret = mbedtls_x509_crt_parse( &cacert, (const unsigned char *) mbedtls_test_cas_pem,
	                          mbedtls_test_cas_pem_len );
	    if( ret < 0 )
	    {
	        printf( " failed\n  !  mbedtls_x509_crt_parse returned -0x%x\n\n", -ret );
	        return -1;
	    }
		
		
	    if( ( ret = mbedtls_ssl_config_defaults( &conf,
	                    MBEDTLS_SSL_IS_CLIENT,
	                    MBEDTLS_SSL_TRANSPORT_STREAM,
	                    MBEDTLS_SSL_PRESET_DEFAULT ) ) != 0 )
	    {
	        printf( " failed\n  ! mbedtls_ssl_config_defaults returned %d\n\n", ret );
	        return -1;
	    }
		
	    mbedtls_ssl_conf_authmode( &conf, MBEDTLS_SSL_VERIFY_OPTIONAL );
	    mbedtls_ssl_conf_ca_chain( &conf, &cacert, NULL );
	    mbedtls_ssl_conf_rng( &conf, mbedtls_ctr_drbg_random, &ctr_drbg );
		
		ctxC = 1;		
	}
			
	// find a free slot at sslHandles
	while(sslHandle < SSL_HANDLES_SIZE) {
		if (sslHandles[sslHandle] == NULL) {
			sslFD = malloc(sizeof(mbedtls_ssl_context));
			socketFD = malloc(sizeof(mbedtls_net_context));
			mbedtls_ssl_init( sslFD );
			mbedtls_net_init( socketFD );			
			sslHandles[sslHandle] = sslFD;
			break;
		}
		sslHandle++;
	}
	
	// no free slot at sslHandles
	if (sslHandle == SSL_HANDLES_SIZE) {
		return -1;
	}
	
	// connect mbedtls socket
	memset(s_port, 0, sizeof(s_port));
	sprintf(s_port, "%d", port);
	ret = mbedtls_net_connect(socketFD, hostname, s_port, MBEDTLS_NET_PROTO_TCP);
	if (ret != 0) {
		ConnClose(sslHandle);
		return -1;
	}
	
    if(( ret = mbedtls_ssl_setup( sslFD, &conf ) ) != 0 )
    {
        printf( " failed\n  ! mbedtls_ssl_setup returned %d\n\n", ret );
		ConnClose(sslHandle);
        return -1;
    }

    if( ( ret = mbedtls_ssl_set_hostname( sslFD, "mbed TLS Server 1" ) ) != 0 )
    {
        printf( " failed\n  ! mbedtls_ssl_set_hostname returned %d\n\n", ret );
		ConnClose(sslHandle);
        return -1;
    }	
	
	mbedtls_ssl_set_bio( sslFD, socketFD, mbedtls_net_send, mbedtls_net_recv, NULL );
    
    while( ( ret = mbedtls_ssl_handshake( sslFD ) ) != 0 )
    {
        if( ret != MBEDTLS_ERR_SSL_WANT_READ && ret != MBEDTLS_ERR_SSL_WANT_WRITE )
        {
            printf( " failed\n  ! mbedtls_ssl_handshake returned -0x%x\n\n", -ret );
            ConnClose(sslHandle);
			return -1;
        }
    }
	
	return sslHandle;
}

int ConnReadBytesAvailable(int sslHandle) {
	mbedtls_ssl_context* sslFD = NULL;
	mbedtls_net_context* socketFD = NULL;
	int count = 0;

	if (sslHandle >= 0) sslFD = sslHandles[sslHandle];
	else return -1;

	if (sslFD) {
		socketFD = (mbedtls_net_context *) sslFD->p_bio;
		lwip_ioctl(socketFD->fd, FIONREAD, &count);		
		return count;
	} else {
		return -1;
	}
}

/* Read bytes from a valid SSL connection on the pool. Blocking! */
int ConnRead(int sslHandle, void *buf, int num) {
	mbedtls_ssl_context* sslFD = NULL;
	int ret;

	if (sslHandle >= 0) sslFD = sslHandles[sslHandle];
	else return -1;

	if (sslFD) {
		if (num == 0) return 0;
		ret = mbedtls_ssl_read(sslFD, buf, num);
		return ret;
	} else {
		return -1;
	}
}

/* Write bytes to a valid SSL connection on the pool */
int ConnWrite(int sslHandle, const void *buf, int num) {
	mbedtls_ssl_context* sslFD = NULL;
	int ret;

	if (sslHandle >= 0) sslFD = sslHandles[sslHandle];
	else return -1;

	if (sslFD) {
		if (num == 0) return 0;
		ret = mbedtls_ssl_write(sslFD, buf, num);
		return ret;
	} else {
		return -1;
	}
}

/* Close a valid SSL connection on the pool, release the resources and
open the slot to another connection */
void ConnClose(int sslHandle) {
	mbedtls_ssl_context *sslFD = NULL;
	
	if (sslHandle >= 0) sslFD = sslHandles[sslHandle];
	else return;
			
	if (sslFD) {
		mbedtls_ssl_close_notify( sslFD );

		mbedtls_net_free( sslFD->p_bio );
		free(sslFD->p_bio);
				
		mbedtls_ssl_free( sslFD );
		free(sslFD);
	}
	
	sslHandles[sslHandle] = NULL;
}

void sleep_ms(int milliseconds)
{
	vTaskDelay(milliseconds / portTICK_RATE_MS);
}

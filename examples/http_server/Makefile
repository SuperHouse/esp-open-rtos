PROGRAM=http_server

#ESPBAUD=921600

EXTRA_CFLAGS=-DLWIP_HTTPD_CGI=1 -DLWIP_HTTPD_SSI=1 -I./fsdata

EXTRA_COMPONENTS=extras/httpd

include ../../common.mk

html:
	@echo "Generating fsdata.."
	cd fsdata && ./makefsdata

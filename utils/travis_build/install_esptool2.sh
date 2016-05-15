#!/bin/bash
set -uv

# Called by Travis to install esptool2 to generate OTA-compatible build
# images

if test -f ${ESPTOOL2_DIR}/esptool2; then
	echo "Using cached esptool2"
	exit 0
fi

git clone https://github.com/raburton/esptool2 ${ESPTOOL2_DIR}
cd ${ESPTOOL2_DIR}
git reset --hard ${ESPTOOL2_COMMIT}
make

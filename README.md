# esp-open-rtos

A community developed open source [FreeRTOS](http://www.freertos.org/)-based framework for [ESP8266 WiFi-enabled microcontrollers](https://github.com/esp8266/esp8266-wiki/wiki). Intended for use in both commercial and open source projects.

Similar to, but substantially different from, the [Espressif IOT RTOS SDK](https://github.com/espressif/esp_iot_rtos_sdk).

## Quick Start

* Install [esp-open-sdk](https://github.com/pfalcon/esp-open-sdk/) and make the toolchain available on your PATH. Despite the similar name that project has different maintainers (but we think it's fantastic!)

    (Alternative toolchains can also work, as long as a gcc cross-compiler is available on the PATH. The official Tensilica "xcc" compiler will probably not work.)

* Install [esptool.py](https://github.com/themadinventor/esptool) and make it available on your PATH.

* The build process uses `GNU Make`, and the utilities `sed` and `grep`. Linux & OS X should have these already. Windows users can get these tools a variety of ways, [MingGW](http://www.mingw.org/wiki/mingw) is one option.

* Use git to clone the esp-open-rtos project (note the `--recursive`):

```
git clone --recursive git@github.com:superhouse/esp-open-rtos.git
cd esp-open-rtos
```

* Build an example project and flash it to a serial port:

```
make -j4 -C examples/http_get flash ESPPORT=/dev/ttyUSB0
```

## Goals

* Provide professional-quality framework for WiFi-enabled RTOS projects on ESP8266.
* Open source code for all layers above the MAC layer, ideally lower layers if possible (this is a work in progress, see [Issues list](https://github.com/superhouse/esp-open-rtos/issues).
* Leave upstream source clean, for easy interaction with upstream projects.
* Flexible build and compilation settings.

Current status is alpha quality, under development. AP STATION mode (ie wifi client mode) and UDP/TCP client modes are tested. Other functionality should work. Contributors and testers are welcome!

## Open Source Components

* [FreeRTOS](http://freertos.org) V7.5.2
* [lwIP](http://lwip.wikia.com/wiki/LwIP_Wiki) v1.4.1, modified via the [esp-lwip project](https://github.com/kadamski/esp-lwip) by @kadamski.
* [axTLS](http://axtls.sourceforge.net/) compiled from development version v1.5.3, plus modifications for low memory devices.

## Binary Components

Binary libraries (inside the `lib` dir) are all supplied by Espressif as part of their RTOS SDK which is MIT Licensed.

As part of the esp-open-rtos build process, all binary SDK symbols are prefixed with `sdk_`. This makes it easier to differentiate binary & open source code, and also prevents namespace conflicts.

Some binary libraries appear to contain unattributed open source code:

* libnet80211.a appears to be based on FreeBSD net80211, or a fork of it.
* libudhcp has been removed from esp-open-rtos. It was released with the Espressif RTOS SDK but udhcp is GPL licensed.

## Licensing

* BSD license (as described in LICENSE) applies to original source files, and [lwIP](http://lwip.wikia.com/wiki/LwIP_Wiki). LWIP is CopyrighT (C) Swedish Institute of Computer Science.

* FreeRTOS is provided under the GPL with the FreeRTOS linking exception, allowing non-GPL firmwares to be produced using FreeRTOS as the RTOS core. License details in files under FreeRTOS dir. FreeRTOS is Copyright (C) Real Time Engineers Ltd.

* Source & binary components from the [Espressif IOT RTOS SDK](https://github.com/espressif/esp_iot_rtos_sdk) were released under the MIT license. Source code components are relicensed here under the BSD license. Components are Copyright (C) Espressif Systems.

## Contributions

Contributions are very welcome!

* If you find a bug, [please raise an issue to report it](https://github.com/superhouse/esp-open-rtos/issues).

* If you have feature additions or bug fixes then please send a pull request.

* There is a list of outstanding TODO items in the [issues list](https://github.com/superhouse/esp-open-rtos/issues). Contributions to these, as well as other improvements, are very welcome.

If you are contributing code, *please ensure that it can be licensed under the BSD open source license*. Specifically:

* Code from Espressif IoT SDK cannot be merged, as it is provided under either the "Espressif General Public License" or the "Espressif MIT License", which are not compatible with the BSD license.

* Recent releases of the Espressif IoT RTOS SDK cannot be merged, as they changed from MIT License to the "Espressif MIT License" which is not BSD compatible. The Espressif binaries used in esp-open-rtos were taken from [revision ec75c85, as this was the last MIT Licensed revision](https://github.com/espressif/esp_iot_rtos_sdk/commit/43585fa74550054076bdf4bfe185e808ad0da83e).

For code submissions based on reverse engineered binary functionality, please either reverse engineer functionality from MIT Licensed Espressif releases or make sure that the reverse engineered code does not directly copy the code structure of the binaries - it cannot be a "derivative work" of an incompatible binary.

The best way to write suitable code is to first add documentation somewhere like the [esp8266 wiki](https://github.com/esp8266/esp8266-wiki/) describing factual information gained from reverse engineering - such as register addresses, bit masks, orders of register writes, etc. Then write new functions referring to that documentation as reference material.

## Sponsors

Work on esp-open-rtos is sponsored by [SuperHouse Automation](http://superhouse.tv/).

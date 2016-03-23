OTA Bootloader (rboot) source module and support files.

Can be used to build an esp-open-rtos compatible rboot bootloader, for use when OTA=1.

It is also possible to use the upstream rboot verbatim, but *ensure that the `RBOOT_BIG_FLASH` option is enabled or images in slots other than 0 won't work correctly.

rboot is an open source bootloader by Richard Burton:
https://github.com/raburton/rboot

See the contents of the 'rboot' directory for more information.


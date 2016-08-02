# mkspiffs Create spiffs image

mkspiffs is a command line utility to create an image of SPIFFS in order
to write to flash.

## Usage

mkspiffs will be built automatically if you include the following line in your
makefile:

```
$(eval $(call make_spiffs_image,files))
```

where *files* is the directory with files that should go into SPIFFS image.

Or you can build mkspiffs manually with:

```
make SPIFFS_SIZE=0x100000
```

mkspiffs cannot be built without specifying SPIFFS size because it uses the
same SPIFFS sources as the firmware. And for the firmware SPIFFS size is
compile time defined.

Please note that if you change SPIFFS_SIZE you need to rebuild mkspiffs.
The easiest way is to run `make clean` for you project.

To manually generate SPIFFS image from directory, run:

```
mkspiffs DIRECTORY IMAGE_NAME
```

/**
 * The MIT License (MIT)
 *
 * Copyright (c) 2016 sheinz (https://github.com/sheinz)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/dir.h>
#include <dirent.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include "spiffs_config.h"
#include "../spiffs/src/spiffs.h"

static spiffs fs;
static void *image = 0;
static void *work_buf = 0;
static void *fds_buf = 0;
static void *cache_buf = 0;

static void print_usage(const char *prog_name, const char *error_msg)
{
    if (error_msg) {
        printf("Error: %s\n", error_msg);
    }
    printf("Usage: ");
    printf("\t%s DIRECTORY IMAGE_NAME\n\n", prog_name);
    printf("Example:\n");
    printf("\t%s ./my_files spiffs.img\n\n", prog_name);
}

static s32_t _read_data(u32_t addr, u32_t size, u8_t *dst)
{
    memcpy(dst, (uint8_t*)image + addr, size);
    return SPIFFS_OK;
}

static s32_t _write_data(u32_t addr, u32_t size, u8_t *src)
{
    uint32_t i;
    uint8_t *dst = image + addr;

    for (i = 0; i < size; i++) {
        dst[i] &= src[i];  // mimic NOR flash, flip only 1 to 0
    }
    return  SPIFFS_OK;
}

static s32_t _erase_data(u32_t addr, u32_t size)
{
    memset((uint8_t*)image + addr, 0xFF, size);
    return SPIFFS_OK;
}

static bool init_spiffs(bool allocate_mem)
{
    spiffs_config config = {0};
    printf("Initializing SPIFFS, size=%d\n", SPIFFS_SIZE);

    config.hal_read_f = _read_data;
    config.hal_write_f = _write_data;
    config.hal_erase_f = _erase_data;

    int workBufSize = 2 * SPIFFS_CFG_LOG_PAGE_SZ();
    int fdsBufSize = SPIFFS_buffer_bytes_for_filedescs(&fs, 5);
    int cacheBufSize = SPIFFS_buffer_bytes_for_cache(&fs, 5);

    if (allocate_mem) {
        image = malloc(SPIFFS_SIZE);
        work_buf = malloc(workBufSize);
        fds_buf = malloc(fdsBufSize);
        cache_buf = malloc(cacheBufSize);
        printf("spiffs memory, work_buf_size=%d, fds_buf_size=%d, cache_buf_size=%d\n",
                workBufSize, fdsBufSize, cacheBufSize);
    }

    int32_t err = SPIFFS_mount(&fs, &config, work_buf, fds_buf, fdsBufSize,
            cache_buf, cacheBufSize, 0);

    return err == SPIFFS_OK;
}

static bool format_spiffs()
{
    SPIFFS_unmount(&fs);

    if (SPIFFS_format(&fs) == SPIFFS_OK) {
        printf("Format complete\n"); 
    } else {
        printf("Failed to format SPIFFS\n");
        return false;
    }

    if (!init_spiffs(false)) {
        printf("Failed to mount SPIFFS\n");
        return false;
    }
    return true;
}

static void spiffs_free()
{
    free(image); 
    image = NULL;

    free(work_buf);
    work_buf = NULL;

    free(fds_buf);
    fds_buf = NULL;

    free(cache_buf);
    cache_buf = NULL;
}

static bool process_file(const char *src_file, const char *dst_file)
{
    int fd;
    const int buf_size = 256;
    uint8_t buf[buf_size];
    int data_len;
    
    fd = open(src_file, O_RDONLY);
    if (fd < 0) {
        printf("Error openning file: %s\n", src_file);
    }
    
    spiffs_file out_fd = SPIFFS_open(&fs, dst_file, 
            SPIFFS_O_CREAT | SPIFFS_O_WRONLY, 0);
    while ((data_len = read(fd, buf, buf_size)) != 0) {
        if (SPIFFS_write(&fs, out_fd, buf, data_len) != data_len) {
            printf("Error writing to SPIFFS file\n");
            break;
        }       
    }
    SPIFFS_close(&fs, out_fd);
    close(fd);
    return true;
}

static bool process_directory(const char *direcotry)
{
    DIR *dp;
    struct dirent *ep;
    char path[256];

    dp = opendir(direcotry);
    if (dp != NULL) {
        while ((ep = readdir(dp)) != 0) {
            if (!strcmp(ep->d_name, ".") || 
                !strcmp(ep->d_name, "..")) {
                continue;
            }
            if (ep->d_type != DT_REG) {
                continue;  // not a regular file
            }
            sprintf(path, "%s/%s", direcotry, ep->d_name);
            printf("Processing file %s\n", path);
            if (!process_file(path, ep->d_name)) {
                printf("Error processing file\n");   
                break;
            }
        }
        closedir(dp);
    } else {
        printf("Error reading direcotry: %s\n", direcotry);
    }
    return true;
}

static bool write_image(const char *out_file)
{
    int fd;
    int size = SPIFFS_SIZE;
    uint8_t *p = (uint8_t*)image;
    fd = open(out_file, O_WRONLY | O_CREAT | O_TRUNC, 0666);
    if (fd < 0) {
        printf("Error creating file %s\n", out_file);
        return false;
    }

    printf("Writing image to file: %s\n", out_file);

    while (size != 0) {
        write(fd, p, SPIFFS_CFG_LOG_PAGE_SZ());
        p += SPIFFS_CFG_LOG_PAGE_SZ();
        size -= SPIFFS_CFG_LOG_PAGE_SZ();
    }

    close(fd);
    return true;
}

int main(int argc, char *argv[])
{
    int result = 0;
    
    if (argc != 3) {
        print_usage(argv[0], NULL);
        return -1;
    }

    init_spiffs(/*allocate_mem=*/true);

    if (format_spiffs()) {
        if (process_directory(argv[1])) {
            if (!write_image(argv[2])) {
                printf("Error writing image\n");
            }       
        } else {
            printf("Error processing direcotry\n");
        }
    } else {
        printf("Error formating spiffs\n");
    }
      
    spiffs_free();
    return result;
}

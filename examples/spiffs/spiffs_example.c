#include "espressif/esp_common.h"
#include "esp/uart.h"
#include "FreeRTOS.h"
#include "task.h"
#include "esp8266.h"

#include "spiffs.h"
#include "esp_spiffs.h"


#define TEST_FILE_NAME_LEN  16
#define TEST_FILES          32
#define TEST_FILE_MAX_SIZE  8192

typedef struct {
    char name[TEST_FILE_NAME_LEN];
    uint16_t size;
    uint8_t first_data_byte;
} TestFile;

static TestFile test_files[TEST_FILES];

inline static void fill_test_data(uint8_t *src, uint16_t size, uint8_t first_byte)
{
    while (size--) {
        *src++ = first_byte++;
    }
}

static bool write_test_files()
{
    uint8_t *buf = (uint8_t*)malloc(TEST_FILE_MAX_SIZE);
    bool result = true;

    for (uint8_t i = 0; i < TEST_FILES; i++) {
        sprintf(test_files[i].name, "file_%d.dat", i);
        spiffs_file f = SPIFFS_open(&fs, test_files[i].name,
                SPIFFS_CREAT|SPIFFS_RDWR|SPIFFS_TRUNC, 0);
        if (f < 0) {
            printf("Open file operation failed\n");
            result = false;
            break;
        }
        test_files[i].size = rand() % TEST_FILE_MAX_SIZE;
        test_files[i].first_data_byte = rand() % 256;
        fill_test_data(buf, test_files[i].size, test_files[i].first_data_byte);

        printf("Writing file %s size=%d\n", test_files[i].name,
                test_files[i].size);
        int32_t written = SPIFFS_write(&fs, f, buf, test_files[i].size);
        if (written != test_files[i].size) {
            printf("Write file operation failed, written=%d\n", written);
            result = false;
            break;
        }
        SPIFFS_close(&fs, f);
    }
    free(buf);
    return result;
}

inline static bool verify_test_data(uint8_t *data, uint16_t size,
        uint8_t first_byte)
{
    while (size--) {
        if (*data++ != first_byte++) {
            return false;
        }
    }
    return true;
}

static bool verify_test_files()
{
    uint8_t *buf = (uint8_t*)malloc(TEST_FILE_MAX_SIZE);
    bool result = true;

    for (uint8_t i = 0; i < TEST_FILES; i++) {
        printf("Verifying file %s\n", test_files[i].name);
        spiffs_file f = SPIFFS_open(&fs, test_files[i].name, SPIFFS_RDONLY, 0);
        if (f < 0) {
            printf("Open file operation failed\n");
            result = false;
            break;
        }

        int32_t n = SPIFFS_read(&fs, f, buf, test_files[i].size);
        if (n != test_files[i].size) {
            printf("Read file operation failed\n");
            result = false;
            break;
        }

        if (!verify_test_data(buf, test_files[i].size,
                    test_files[i].first_data_byte)) {
            printf("Data verification failed\n");
            result = false;
            break;
        }

        SPIFFS_close(&fs, f);
    }

    free(buf);
    return result;
}

static bool cleanup_test_files()
{
    bool result = true;

    for (uint8_t i = 0; i < TEST_FILES; i++) {
        printf("Removing file %s\n", test_files[i].name);
        if (SPIFFS_remove(&fs, test_files[i].name) != SPIFFS_OK) {
            printf("Remove file operation failed\n");
            result = false;
            break;
        }
    }
    return result;
}

inline static void print_info()
{
    uint32_t total, used;

    SPIFFS_info(&fs, &total, &used);

    printf("FS total=%d bytes, used=%d bytes\n", total, used);
    printf("FS %d %% used\n", 100 * used/total);

    // File system structure visualisation
    // SPIFFS_vis(&fs);
}

void test_task(void *pvParameters)
{
    bool result = true;

    esp_spiffs_mount();
    esp_spiffs_unmount();  // FS must be unmounted before formating
    if (SPIFFS_format(&fs) == SPIFFS_OK) {
        printf("Format complete\n");
    } else {
        printf("Format failed\n");
    }
    esp_spiffs_mount();

    while (1) {
        vTaskDelay(5000 / portTICK_RATE_MS);

        result = write_test_files();

        if (result) {
            result = verify_test_files();
        }

        print_info();

        if (result) {
            result = cleanup_test_files();
        }

        if (result) {
            printf("Test passed!\n");
        } else {
            printf("Test failed!\n");
            while (1) {
                vTaskDelay(1);
            }
        }
    }
}

void user_init(void)
{
    uart_set_baud(0, 115200);

    xTaskCreate(test_task, (signed char *)"test_task", 1024, NULL, 2, NULL);
}

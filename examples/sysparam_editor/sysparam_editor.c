#include "FreeRTOS.h"
#include "task.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sysparam.h>

#define CMD_BUF_SIZE 512

// This is just below the upper-4 sdk-reserved sectors for a 16mbit flash
// Note that the sysparam area will take up two sectors (0x1FAxxx and 0x1FBxxx)
#define SYSPARAM_ADDR 0x1fa000

const int status_base = -6;
const char *status_messages[] = {
    "SYSPARAM_ERR_NOMEM",
    "SYSPARAM_ERR_CORRUPT",
    "SYSPARAM_ERR_IO",
    "SYSPARAM_ERR_FULL",
    "SYSPARAM_ERR_BADVALUE",
    "SYSPARAM_ERR_NOINIT",
    "SYSPARAM_OK",
    "SYSPARAM_NOTFOUND",
    "SYSPARAM_PARSEFAILED",
};

void usage(void) {
    printf(
        "Available commands:\n"
        "  <key>?        -- Query the value of <key>\n"
        "  <key>=<value> -- Set <key> to <value>\n"
        "  dump          -- Show all currently set keys/values\n"
        "  reformat      -- Reinitialize (clear) the sysparam area\n"
        "  help          -- Show this help screen\n"
        );
}

size_t tty_readline(char *buffer, size_t buf_size, bool echo) {
    size_t i = 0;
    int c;

    while (true) {
        c = getchar();
        if (c == '\r') {
            if (echo) putchar('\n');
            break;
        } else if (c == '\b' || c == 0x7f) {
            if (i) {
                if (echo) printf("\b \b");
                i--;
            }
        } else if (c < 0x20) {
            /* Ignore other control characters */
        } else if (i >= buf_size - 1) {
            if (echo) putchar('\a');
        } else {
            buffer[i++] = c;
            if (echo) putchar(c);
        }
    }

    buffer[i] = 0;
    return i;
}

sysparam_status_t dump_params(void) {
    sysparam_status_t status;
    sysparam_iter_t iter;

    status = sysparam_iter_start(&iter);
    if (status < 0) return status;
    while (true) {
        status = sysparam_iter_next(&iter);
        if (status != SYSPARAM_OK) break;
        printf("  %s=%s\n", iter.key, iter.value);
    }
    sysparam_iter_end(&iter);

    if (status == SYSPARAM_NOTFOUND) {
        // This is the normal status when we've reached the end of all entries.
        return SYSPARAM_OK;
    } else {
        // Something apparently went wrong
        return status;
    }
}

void sysparam_editor_task(void *pvParameters) {
    char *cmd_buffer = malloc(CMD_BUF_SIZE);
    sysparam_status_t status;
    char *value;
    size_t len;

    if (!cmd_buffer) {
        printf("ERROR: Cannot allocate command buffer!\n");
        return;
    }

    // NOTE: Eventually, this initialization part will be done automatically on
    // system startup, so the app won't need to do it.
    printf("Initializing sysparam...\n");
    status = sysparam_init(SYSPARAM_ADDR);
    printf("(status %d)\n", status);
    if (status == SYSPARAM_NOTFOUND) {
        printf("Trying to create new sysparam area...\n");
        status = sysparam_create_area(SYSPARAM_ADDR, false);
        printf("(status %d)\n", status);
        if (status == SYSPARAM_OK) {
            status = sysparam_init(SYSPARAM_ADDR);
            printf("(status %d)\n", status);
        }
    }

    while (true) {
        printf("==> ");
        len = tty_readline(cmd_buffer, CMD_BUF_SIZE, true);
        status = 0;
        if (!len) continue;
        if (cmd_buffer[len - 1] == '?') {
            cmd_buffer[len - 1] = 0;
            printf("Querying '%s'...\n", cmd_buffer);
            status = sysparam_get_string(cmd_buffer, &value);
            if (status == SYSPARAM_OK) {
                printf("  '%s' = '%s'\n", cmd_buffer, value);
            }
            free(value);
        } else if ((value = strchr(cmd_buffer, '='))) {
            *value++ = 0;
            printf("Setting '%s' to '%s'...\n", cmd_buffer, value);
            status = sysparam_set_string(cmd_buffer, value);
        } else if (!strcmp(cmd_buffer, "dump")) {
            printf("Dumping all params:\n");
            status = dump_params();
        } else if (!strcmp(cmd_buffer, "reformat")) {
            printf("Re-initializing region...\n");
            status = sysparam_create_area(SYSPARAM_ADDR, true);
            if (status == SYSPARAM_OK) {
                // We need to re-init after wiping out the region we've been
                // using.
                status = sysparam_init(SYSPARAM_ADDR);
            }
        } else if (!strcmp(cmd_buffer, "help")) {
            usage();
        } else {
            printf("Unrecognized command.\n\n");
            usage();
        }

        if (status != SYSPARAM_OK) {
            printf("! Operation returned status: %d (%s)\n", status, status_messages[status - status_base]);
        }
    }
}

void user_init(void)
{
    xTaskCreate(sysparam_editor_task, (signed char *)"sysparam_editor_task", 512, NULL, 2, NULL);
}

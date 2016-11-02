#include "ff.h"
#include <FreeRTOS.h>

#if _USE_LFN == 3   /* LFN with a working buffer on the heap */
#include <stdlib.h>
#endif

#if _FS_REENTRANT

/*
 * Create a Synchronization Object
 * This function is called in f_mount() function to create a new
 * synchronization object, such as semaphore and mutex. When a 0 is returned,
 * the f_mount() function fails with FR_INT_ERR.
 */
int ff_cre_syncobj(BYTE vol, SemaphoreHandle_t *sobj)
{
    int ret;

    *sobj = xSemaphoreCreateMutex();
    ret = (int)(*sobj != NULL);

    return ret;
}

/*
 * Delete a Synchronization Object
 * This function is called in f_mount() function to delete a synchronization
 * object that created with ff_cre_syncobj() function. When a 0 is returned,
 * the f_mount() function fails with FR_INT_ERR.
 */
int ff_del_syncobj(SemaphoreHandle_t sobj)
{
    vSemaphoreDelete(sobj);
    return 1;
}

/*
 * Request Grant to Access the Volume
 * This function is called on entering file functions to lock the volume.
 * When a 0 is returned, the file function fails with FR_TIMEOUT.
 */
int ff_req_grant(SemaphoreHandle_t sobj)
{
    return (int)(xSemaphoreTake(sobj, _FS_TIMEOUT) == pdTRUE);
}

/*
 * Release Grant to Access the Volume
 * This function is called on leaving file functions to unlock the volume.
 */
void ff_rel_grant(SemaphoreHandle_t sobj)
{
    xSemaphoreGive(sobj);
}

#endif

#if _USE_LFN == 3	/* LFN with a working buffer on the heap */
/*
 * Allocate a memory block
 * If a NULL is returned, the file function fails with FR_NOT_ENOUGH_CORE.
 */
void* ff_memalloc(UINT msize)
{
    return malloc(msize);
}

/*
 * Free a memory block
 */
void ff_memfree(void* mblock)
{
    free(mblock);
}

#endif

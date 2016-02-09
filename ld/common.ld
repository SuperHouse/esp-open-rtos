/*
 * Common (OTA and non-OTA) parts for the esp-open-rtos Linker Script
 *
 */

/* FreeRTOS memory management functions

   We link these directly to newlib functions (have to do it at link
   time as binary libraries use these symbols too.)
*/
pvPortMalloc = malloc;
vPortFree = free;

/* FreeRTOS lock functions.

   Rely on a patch to libc that produces weak linked versions of the
   below symbols. Currently treating locking primitives like universal
   global critical section rather than individual locks, but this seems
   OK from the use cases in newlib.
*/
_lock_acquire = vPortEnterCritical;
_lock_acquire_recursive = vPortEnterCritical;
_lock_try_acquire = vPortEnterCritical;
_lock_try_acquire_recursive = vPortEnterCritical;
_lock_release = vPortExitCritical;
_lock_release_recursive = vPortExitCritical;

/* SDK compatibility */
ets_printf = printf;

PHDRS
{
  dport0_0_phdr PT_LOAD;
  dram0_0_phdr PT_LOAD;
  dram0_0_bss_phdr PT_LOAD;
  iram1_0_phdr PT_LOAD;
  irom0_0_phdr PT_LOAD;
}


/*  Default entry point:  */
ENTRY(call_user_start)
PROVIDE(_memmap_vecbase_reset = 0x40000000);
/* Various memory-map dependent cache attribute settings: */
_memmap_cacheattr_wb_base = 0x00000110;
_memmap_cacheattr_wt_base = 0x00000110;
_memmap_cacheattr_bp_base = 0x00000220;
_memmap_cacheattr_unused_mask = 0xFFFFF00F;
_memmap_cacheattr_wb_trapnull = 0x2222211F;
_memmap_cacheattr_wba_trapnull = 0x2222211F;
_memmap_cacheattr_wbna_trapnull = 0x2222211F;
_memmap_cacheattr_wt_trapnull = 0x2222211F;
_memmap_cacheattr_bp_trapnull = 0x2222222F;
_memmap_cacheattr_wb_strict = 0xFFFFF11F;
_memmap_cacheattr_wt_strict = 0xFFFFF11F;
_memmap_cacheattr_bp_strict = 0xFFFFF22F;
_memmap_cacheattr_wb_allvalid = 0x22222112;
_memmap_cacheattr_wt_allvalid = 0x22222112;
_memmap_cacheattr_bp_allvalid = 0x22222222;
PROVIDE(_memmap_cacheattr_reset = _memmap_cacheattr_wb_trapnull);

SECTIONS
{

  .dport0.rodata : ALIGN(4)
  {
    _dport0_rodata_start = ABSOLUTE(.);
    *(.dport0.rodata)
    *(.dport.rodata)
    _dport0_rodata_end = ABSOLUTE(.);
  } >dport0_0_seg :dport0_0_phdr

  .dport0.literal : ALIGN(4)
  {
    _dport0_literal_start = ABSOLUTE(.);
    *(.dport0.literal)
    *(.dport.literal)
    _dport0_literal_end = ABSOLUTE(.);
  } >dport0_0_seg :dport0_0_phdr

  .dport0.data : ALIGN(4)
  {
    _dport0_data_start = ABSOLUTE(.);
    *(.dport0.data)
    *(.dport.data)
    _dport0_data_end = ABSOLUTE(.);
  } >dport0_0_seg :dport0_0_phdr

  .text : ALIGN(4) /* IRAM */
  {
    _stext = .;
    _text_start = ABSOLUTE(.);
    . = ALIGN (16);
    *(.vecbase.text)
    *(.entry.text)
    *(.init.literal)
    *(.init)
    /* esp-open-rtos compiled source files use the .iram1.* section names for IRAM
       functions, etc. */
    *(.iram1.*)
    /* SDK libraries expect their .text sections to link to iram, not irom */
    *sdklib*:*(.literal .text .literal.* .text.*)
    /* libgcc integer functions also need to be in .text, as some are called before
       flash is mapped (also performance)
    */
    *libgcc.a:*i3.o(.literal .text .literal.* .text.*)

    /* libc also in IRAM */
    *libc.a:*malloc.o(.literal .text .literal.* .text.*)
    *libc.a:*mallocr.o(.literal .text .literal.* .text.*)
    *libc.a:*freer.o(.literal .text .literal.* .text.*)
    *libc.a:*memcpy.o(.literal .text .literal.* .text.*)
    *libc.a:*memset.o(.literal .text .literal.* .text.*)
    *libc.a:*memcmp.o(.literal .text .literal.* .text.*)
    *libc.a:*memmove.o(.literal .text .literal.* .text.*)
    *libc.a:*rand.o(.literal .text .literal.* .text.*)
    *libc.a:*bzero.o(.literal .text .literal.* .text.*)
    *libc.a:*lock.o(.literal .text .literal.* .text.*)

    *libc.a:*printf.o(.literal .text .literal.* .text.*)
    *libc.a:*findfp.o(.literal .text .literal.* .text.*)
    *libc.a:*fputwc.o(.literal .text .literal.* .text.*)

    /* xthal_set_intset() called from PendSV in NMI context */
    *libhal.a:*set_intset.o(.literal .text .literal.* .text.*)

    *(.stub .gnu.warning .gnu.linkonce.literal.* .gnu.linkonce.t.*.literal .gnu.linkonce.t.*)
    *(.fini.literal)
    *(.fini)
    *(.gnu.version)
    _text_end = ABSOLUTE(.);
    _etext = .;
  } >iram1_0_seg :iram1_0_phdr

  .irom0.text : ALIGN(4)
  {
    _irom0_text_start = ABSOLUTE(.);
    /* esp-open-rtos compiled code goes into IROM by default
       (except for libgcc which is matched above.)
    */
    *(.literal .text .literal.* .text.*)
    /* Anything explicitly marked as "irom" or "irom0" should go here */
    *(.irom.* .irom.*.* .irom0.*)
    _irom0_text_end = ABSOLUTE(.);

    /* Temporary .rodata hacks start here, eventually all rodata will
    be in irom by default */
    /* mbedtls rodata */
    *mbedtls.a:*.o(.rodata.* .rodata)
    /* actual certificate in example (TEMPORARY HACK) */
    *:cert.o(.rodata.* .rodata)
    /*  C++ constructor and destructor tables, properly ordered:  */
    __init_array_start = ABSOLUTE(.);
    KEEP (*crtbegin.o(.ctors))
    KEEP (*(EXCLUDE_FILE (*crtend.o) .ctors))
    KEEP (*(SORT(.ctors.*)))
    KEEP (*(.ctors))
    __init_array_end = ABSOLUTE(.);
    KEEP (*crtbegin.o(.dtors))
    KEEP (*(EXCLUDE_FILE (*crtend.o) .dtors))
    KEEP (*(SORT(.dtors.*)))
    KEEP (*(.dtors))
    /*  C++ exception handlers table:  */
    __XT_EXCEPTION_DESCS__ = ABSOLUTE(.);
    *(.xt_except_desc)
    *(.gnu.linkonce.h.*)
    __XT_EXCEPTION_DESCS_END__ = ABSOLUTE(.);
    *(.xt_except_desc_end)

  } >irom0_0_seg :irom0_0_phdr

  .data : ALIGN(4)
  {
    _data_start = ABSOLUTE(.);
    *(.data)
    *(.data.*)
    *(.gnu.linkonce.d.*)
    *(.data1)
    *(.sdata)
    *(.sdata.*)
    *(.gnu.linkonce.s.*)
    *(.sdata2)
    *(.sdata2.*)
    *(.gnu.linkonce.s2.*)
    *(.jcr)
    _data_end = ABSOLUTE(.);
  } >dram0_0_seg :dram0_0_phdr

  .rodata : ALIGN(4)
  {
    _rodata_start = ABSOLUTE(.);
    *(.rodata)
    *(.rodata.*)
    *(.gnu.linkonce.r.*)
    *(.rodata1)
    __XT_EXCEPTION_TABLE__ = ABSOLUTE(.);
    *(.xt_except_table)
    *(.gcc_except_table)
    *(.gnu.linkonce.e.*)
    *(.gnu.version_r)
    *(.eh_frame)
    . = (. + 3) & ~ 3;
    *(.dynamic)
    *(.gnu.version_d)
    . = ALIGN(4);		/* this table MUST be 4-byte aligned */
    _bss_table_start = ABSOLUTE(.);
    LONG(_bss_start)
    LONG(_bss_end)
    _bss_table_end = ABSOLUTE(.);
    _rodata_end = ABSOLUTE(.);
  } >dram0_0_seg :dram0_0_phdr

  .bss ALIGN(8) (NOLOAD) : ALIGN(4)
  {
    . = ALIGN (8);
    _bss_start = ABSOLUTE(.);
    *(.dynsbss)
    *(.sbss)
    *(.sbss.*)
    *(.gnu.linkonce.sb.*)
    *(.scommon)
    *(.sbss2)
    *(.sbss2.*)
    *(.gnu.linkonce.sb2.*)
    *(.dynbss)
    *(.bss)
    *(.bss.*)
    *(.gnu.linkonce.b.*)
    *(COMMON)
    . = ALIGN (8);
    _bss_end = ABSOLUTE(.);
    _heap_start = ABSOLUTE(.);
/*    _stack_sentry = ALIGN(0x8); */
  } >dram0_0_seg :dram0_0_bss_phdr
/* __stack = 0x3ffc8000; */

  .lit4 : ALIGN(4)
  {
    _lit4_start = ABSOLUTE(.);
    *(*.lit4)
    *(.lit4.*)
    *(.gnu.linkonce.lit4.*)
    _lit4_end = ABSOLUTE(.);
  } >iram1_0_seg :iram1_0_phdr
}

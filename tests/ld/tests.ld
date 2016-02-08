/* Extra linker script sections used only for test case registration */
SECTIONS
{
  .irom0.text : ALIGN(4)
  {
    _testcases_start = ABSOLUTE(.);
    *(.testcases.text)
    _testcases_end = ABSOLUTE(.);
  } > irom0_0_seg
}


OUTPUT_ARCH( "riscv" )
ENTRY(_start)

MEMORY
{
 ram (rwx) : ORIGIN = 0x00000000, LENGTH = 0x8000
}

SECTIONS
{
  . = 0x00000000;
  .text.trap : { *(.text.trap) } > ram

  . = 0x00000080;
  .text.init : { *(.text.init) } > ram

  . = ALIGN(0x1000);
  .tohost : { *(.tohost); . = ALIGN(0x1000); } > ram

  . = ALIGN(0x1000);
  .text : { *(.text) } > ram

  . = ALIGN(0x1000);
  .data : { *(.data) } > ram
  .data.string : { *(.data.string)} > ram
  .bss : { *(.bss) } > ram
  _end = .;
}


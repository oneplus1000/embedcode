MEMORY
{
    FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 256K
    RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 16K
}

SECTIONS
{
    .text : {
        *(.text)
    } > FLASH

    .bss : {
        *(.bss COMMON)
    } > RAM

    .stack (NOLOAD) : {
        . = ORIGIN(RAM) + LENGTH(RAM);
        _stack_top = .;
    } > RAM
}

        .module z80_header

        .globl  sadr
        .globl  eadr
;
; define memory layout
;
        .area   _CODE
        .area   _LIB
        .area   _LIB_DATA
        .area   _DATA

        .area   _CODE
; .Z80 Header
;
        .dw     sadr
        .dw     s__LIB_DATA-1
        .dw     sadr
        .ascii  'sdas80'
        .db     'C'
        .db     0xd3,0xd3,0xd3
        .ascii  'BLOCKS 1100     '
        
        
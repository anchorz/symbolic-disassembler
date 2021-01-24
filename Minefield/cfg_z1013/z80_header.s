        .module z80_header

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
        .dw     _main
        .dw     s__LIB_DATA-1
        .dw     _main
        .ascii 'HobiSo'
        .ascii 'C'
        .db 0xd3,0xd3,0xd3
        .ascii 'MINEFIELD+Bro+Jo'
        
        
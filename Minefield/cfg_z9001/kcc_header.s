        .module kcc_header

;
; .KCC Header
;
        .ascii  'MINEFILD'
        .ascii  'COM'
        .db     0x00,0x00,0x00,0x00,0x00
        .db     3
        .dw     _main
        ; beim Z9001 sollte diese Addresse auf das letzte Byte, also eadr zeigen
        ; beim KC85/3 aber auf eadr+1
        .dw     s__DATA-1
        .dw     _main
        .db     0x00
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
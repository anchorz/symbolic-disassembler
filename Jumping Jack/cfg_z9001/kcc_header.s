        .module kcc_header

        .globl  sadr
;
; .KCC Header
;
        .ascii  'JUMPINGJ'
        .ascii  'COM'
        .db     0x00,0x00,0x00,0x00,0x00
        .db     3
        .dw     sadr
        ; beim Z9001 sollte diese Addresse auf das letzte Byte, also eadr zeigen
        ; beim KC85/3 aber auf eadr+1
        .dw     s__DATA-1
        .dw     sadr
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
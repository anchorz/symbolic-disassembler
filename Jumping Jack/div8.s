        .module div8
        
        .globl  div8
; 8-bit division - divide HL by D
; IN: HL
;     D
;       
;
div8:                                   ; this routine performs the operation HL=HL/D
        xor     a                       ; clearing the upper 8 bits of AHL
        ld      b,#16                   ; the length of the dividend (16 bits)
div8_loop:
        add     hl,hl                   ; advancing a bit
        rla
        cp      d                       ; checking if the divisor divides the digits chosen (in A)
        jp      c,div8_next_bit         ; if not, advancing without subtraction
        sub     d                       ; subtracting the divisor
        inc     l                       ; and setting the next digit of the quotient
div8_next_bit:
        djnz    div8_loop
        ret

        .module lib_compatibility
        ;
        ; exports
        ;
        .globl  prst7
        .globl  set_cursor
        
prst7:  pop     hl

print_char:
        ld      c,#2                    ; CONSO
        ld      e,(hl)
        res     7,e
        call    0x0005                  ; BOS
        bit     7,(hl)
        inc     hl
        jr      z,print_char
        jp      (hl)

set_cursor:
        push    hl
        push    de
        push    bc
        ld      de,#-0xec00             ; BWS
        add     hl,de
        ld      d,#40                   ; SCREEEN_WIDTH
        call    div8
        inc     a
        inc     l
        ld      e,a
        ld      d,l
        ld      c,#18                   ; SETCU
        call    0x0005                  ; BOS
        pop     bc
        pop     de
        pop     hl
        ret
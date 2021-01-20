        .module lib_compatibility
        .include 'platform.s'
        
        .globl  exit
        .globl  inch
        .globl  color_window
        
        .globl  color_stone
        .globl  CONBU
exit:
        halt
        jr      exit
;
;
;
inch:
        push    hl
        push    de
        push    bc
check:
        ; emulator only
        in      a,(0x2f)
        call    _inkey
        ld      a,l
        or      a
        jr      z,check
        ld      c,#60
        call    delay
        call    _inkey
        ld      a,l
        or      a
        jr      z,check
        call    delay

        ld      hl,#BWS
        ld      (hl),a
        ld      hl,#BWS+23*SCREEN_WIDTH
        ld      (hl),a
        pop     bc
        pop     de
        pop     hl
        ret

delay:
loop2:
        ld      b,#0
loop:
        djnz    loop
        dec     c
        jr      nz,loop2
        ret
;
; Fill Window with Color or Text
;  IN:  HL - top left address
;       C  - WIDTH
;       A  - color
color_window:
        push    de
        ld      de,#SCREEN_WIDTH
color_next_line:
        push    bc
        push    hl
color_next:
        ld      (hl),a
        inc     hl
        dec     c
        jr      nz,color_next
        pop     hl
        pop     bc
        add     hl,de
        dec     b
        jr      nz,color_next_line
        pop     de
        ret
        
        .area   _DATA
color_stone:
        .ds     1
CONBU:
        .ds     128
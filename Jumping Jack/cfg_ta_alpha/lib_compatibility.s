        .module lib_compatibility
        .include 'platform.s'

        .globl  exit
        .globl  crt_cursor_disable
        .globl  crt_cursor_enable
        .globl  prst7
        .globl  inch
        .globl  inkey

;
; set to 1 in order to get keyboard input in emulator
JKCEMU  = 0

exit:
        call    crt_cls
        call    crt_cursor_enable
        jp      mon_reboot

crt_cursor_disable:
        ld      a,#REG_10_CURSOR_START
        out     (CRT_REG),a
        ld      a,#0x29
        out     (CRT_DATA),a
        ret

crt_cursor_enable:
        ld      a,#REG_10_CURSOR_START
        out     (CRT_REG),a
        ld      a,#0x49
        out     (CRT_DATA),a
        ret
        
prst7:  pop     hl

print_char:
        ld      a,(hl)
        res     7,a
        cp      #VK_CLS
        jr      nz,normal_character
        push    hl
        call    _clrscr
        pop     hl
        jr      character_handled
normal_character:
        push    hl
        call    putcharA
        pop     hl
character_handled:
        bit     7,(hl)
        inc     hl
        jr      z,print_char
        jp      (hl)

inkey:
        push    hl
.if JKCEMU
        in      a,(0x2f)
        cp      #'4'
        jr      nz,n1
        ld      a,#VK_LEFT
        jr      end
n1:     cp      #'6'
        jr      nz,n2
        ld      a,#VK_RIGHT
        jr      end
n2:
end:
.else
        call    _inkey
        ld      a,l
.endif
        ;this time too, reverse capitals
        bit     6,a             ;>0x3f
        jr      z,key_set
        xor     #0x20
key_set:
        pop     hl
        ret

inch:
        push    hl
        push    de
        call    animation_delay
        pop     de
        pop     hl
        call    inkey
        or      a
        jr      z,inch
        ret

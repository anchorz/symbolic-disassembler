        .module lib_compatibility
        .include 'platform.s'

        .globl  exit
        .globl  crt_cursor_disable
        .globl  crt_cursor_enable
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
        
        cp      #'8'
        jr      nz,test_kbd_down
        ld      a,#VK_UP
test_kbd_down: 
        cp      #'4'
        jr      nz,test_kbd_left
        ld      a,#VK_LEFT
test_kbd_left:
        cp      #'6'
        jr      nz,test_kbd_right
        ld      a,#VK_RIGHT
test_kbd_right:
        cp      #'2'
        jr      nz,test_kbd_end
        ld      a,#VK_DOWN
test_kbd_end:
        push    bc
        ld      c,#40
wait_kbd_outer:
        ld      b,#0
wait_kbd:
        nop
        djnz    wait_kbd
        dec     c
        jr      nz,wait_kbd_outer
        pop     bc
        ret

inch:
        call    inkey
        or      a
        jr      z,inch
        ret

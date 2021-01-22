        .module lib_compatibility
        .include 'platform.s'
        
        .globl  exit
        .globl  inch
        .globl  color_window
        .globl  crt_cursor_disable
        .globl  crt_cursor_enable
        .globl  cls_small_window
        .globl  inline
        
        .globl  color_stone
        .globl  CURS
        .globl  CONBU

exit:
        call    crt_cls
        call    crt_cursor_enable
        jp      0xe023
        
putchar:
        push    hl
        ld      hl,(CURS)
        ld      (hl),a
        inc     hl
        ld      (CURS),hl
        pop     hl
        ret
;
;
;
JKCEMU = 0 

inch:
        push    hl
        push    de
        push    bc
        ;ld      a,(toggled)
        ;ld      hl,#BWS
        ;or      #0x10
        ;ld      (hl),a
        ;inc     hl
.if JKCEMU
loop_inch:
        in      a,(0x2f) ;emulator only
        or      a
        jr      z,loop_inch
.else
        call    0xe762
.endif
        ;push    af
        ;call    outhx
        ;pop     af
        ;ld      (hl),a
        ;this time only reverse 'A' and 'a'
        bit     6,a             ;>0x3f
        jr      z,key_set
        xor     #0x20
key_set:
        ld      c,#100
        call    delay
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
        
cls_small_window:
        push    hl
        push    de
        push    bc
        ld      hl,#BWS+POSY_INPUT_LINE*SCREEN_WIDTH+POSX_INPUT_LINE
        ld      de,#BWS+POSY_INPUT_LINE*SCREEN_WIDTH+POSX_INPUT_LINE+1
        ld      bc,#INPUT_LINE_size-1
        ld      (hl),#' '
        ldir
        ld      de,#BWS+POSY_INPUT_LINE*SCREEN_WIDTH+POSX_INPUT_LINE
        ld      hl,#CURS
        ld      (hl),e
        inc     hl
        ld      (hl),d
        pop     bc
        pop     de
        pop     hl
        ret
        
inline: push    hl
        push    de
        push    bc
        ld      l,e
        ld      h,d
        ld      b,(hl)
        inc     hl
 next_char:
        inc     hl
        call    inch
        cp      #VK_LEFT
        jr      z,cmd_del
        cp      #VK_ENTER
        jr      z,cmd_enter
        cp      #' '
        jr      c,next_char
        cp      #0x7f
        jr      nc,next_char
        ld      c,a
        ld      a,b
        or      a,a
        jr      z,next_char
        dec     b
        ld      a,c
        ld      (hl),a
        call    putchar
        jr      next_char
cmd_enter:
        ld      (hl),#0
        ld      a,(de)
        sub     b
        inc     de
        ld      (de),a
        xor     a
        pop     bc
        pop     de
        pop     hl
        jr      cls_small_window
cmd_del:
        ld      a,(de)
        cp      b
        jr      z,next_char
        ;ld      a,#VK_LEFT
        ;call    putchar
        dec     hl
        inc     b
        jr      next_char
        
        .area   _DATA
color_stone:
        .ds     1
CURS:
        .ds     2
CONBU:
        .ds     128
        
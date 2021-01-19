        .module lib_compatibility
        .include 'platform.s'
        
        .globl  cursor_disable
        .globl  inline
        .globl  cls_small_window
        .globl  CONBU

        .area   _LIB
cursor_disable:
        push    af
        push    hl
        ld      a,(CURSR_CHAR)
        ld      hl,(CURSR)
        ld      (hl),a
        pop     hl
        pop     af
        ret

        .area   _LIB_DATA
CONBU:  .ds     128

        .area   _LIB
inline: push    hl
        push    de
        push    bc
        ld      l,e
        ld      h,d
        ld      b,(hl)
        inc     hl
 next_char:
        inc     hl
        UP_INCH
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
        UP_OUTCH
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
        ld      a,#VK_LEFT
        UP_OUTCH
        dec     hl
        ld      a,#' '
        ld      (CURSR_CHAR),a
        inc     b
        jr      next_char
;
;
;
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
        ld      hl,#CURSR
        ld      (hl),e
        inc     hl
        ld      (hl),d
        pop     bc
        pop     de
        pop     hl
        ret

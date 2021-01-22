z9001                           =       0
z1013                           =       0
ta_alpha                        =       1
;
; ta specific constants
;
BOS                             =       0x0005
BWS                             =       0xf000
OFFSET_COLOR                    =       0x0800
cfg20_settings                  =       0xe469
crt_cls                         =       0xe9e8

CFG20                           =       0x20
CRT_REG                         =       0x50
CRT_DATA                        =       0x51
REG_10_CURSOR_START             =       10 

VK_CLS                          =       0x0c
VK_ENTER                        =       0x0d
VK_LEFT                         =       0x1d
VK_RIGHT                        =       0x1c
VK_UP                           =       0x1e
VK_DOWN                         =       0x1f

;
; platform specific constants
;
FG_BLACK                        =       0
FG_BLUE                         =       1
FG_RED                          =       2
FG_MAGENTA                      =       3
FG_GREEN                        =       4
FG_CYAN                         =       5
FG_YELLOW                       =       6
FG_WHITE                        =       7
BG_BLACK                        =       0*8
BG_BLUE                         =       1*8
BG_RED                          =       2*8
BG_MAGENTA                      =       3*8
BG_GREEN                        =       4*8
BG_CYAN                         =       5*8
BG_YELLOW                       =       6*8
BG_WHITE                        =       7*8
FRAME_COLOR                     =       FG_MAGENTA+BG_YELLOW
STONE_COLOR                     =       FG_GREEN+BG_YELLOW
RED_STONE_COLOR                 =       FG_MAGENTA+BG_YELLOW
SELC                            =       0x1c
SELCR                           =       0x1c
SCREEN_WIDTH                    =       0x28
SCREEN_HEIGHT                   =       0x18
POSY_INPUT_LINE                 =       21
POSX_INPUT_LINE                 =       22
INPUT_LINE_size                 =       0x0f
POSITION_MOVES                  =       BWS+13*SCREEN_WIDTH+32
POSITION_SUCCESS                =       BWS+16*SCREEN_WIDTH+22
POSITION_FIELD                  =       BWS+10*SCREEN_WIDTH+3
POSITION_LEVEL                  =       BWS+9*SCREEN_WIDTH+29
POSITION_PUZZEL                 =       BWS+11*SCREEN_WIDTH+32
POSITION_INPUT_LINE             =       BWS+POSY_INPUT_LINE*SCREEN_WIDTH+POSX_INPUT_LINE
FIELD_SIZE                      =       0x0c
.macro CURSOR_DISABLE
        call    crt_cursor_disable
.endm

TOP_LEFT   = 0x83
TOP_MIDDLE = 0x83
TOP_RIGHT  = 0x14

BOTTOM_LEFT   = 0x80
BOTTOM_MIDDLE = 0x80
BOTTOM_RIGHT  = 0x15

LEFT = 0x80
RIGHT = 0x15

.macro STONE_GFX
waag2:
        .db     0x02,0x04
        .db     TOP_LEFT,TOP_MIDDLE,TOP_MIDDLE,TOP_RIGHT
        .db     BOTTOM_LEFT,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_RIGHT
waag3:
        .db     0x02,0x06
        .db     TOP_LEFT,TOP_MIDDLE,TOP_MIDDLE,TOP_MIDDLE,TOP_MIDDLE,TOP_RIGHT
        .db     BOTTOM_LEFT,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_RIGHT
senk2:
        .db     0x04,0x02
        .db     TOP_LEFT,TOP_RIGHT
        .db     LEFT,RIGHT
        .db     LEFT,RIGHT
        .db     BOTTOM_LEFT,BOTTOM_RIGHT
senk3:
        .db     0x06,0x02
        .db     TOP_LEFT,TOP_RIGHT
        .db     LEFT,RIGHT
        .db     LEFT,RIGHT
        .db     LEFT,RIGHT
        .db     LEFT,RIGHT
        .db     BOTTOM_LEFT,BOTTOM_RIGHT
red2:
        .db     0x02,0x04
        .db     TOP_LEFT,TOP_MIDDLE,TOP_MIDDLE,TOP_RIGHT
        .db     BOTTOM_LEFT,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_RIGHT

.endm

.macro UP_INCH
        call    inch
.endm

.macro  SYS_EXIT
        jp      exit
.endm

.macro  CALL_OUTA
        call    putchar
.endm

.macro  INPUT_LINE
        call    inline
.endm

.macro  SET_CURSOR ADR
        ld      hl,#ADR
        ld      (CURS),hl
.endm

.macro ROLL_SMALL_WIN
        call    cls_small_window
.endm

.macro  TXT_ERROR
        .asciz  'Err'
.endm

.macro MAIN_PIC
        .db     0xe0,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4
        .db     0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe1

        .db     0xe5,0x20,0x1c,0x93,0x20,0x15,0x20,0x1c,0x14,0x1c,0x04,0x15,0x20,0x10,0x9f,0x0c,0x04,0x20,0x20,0x20
        .ascii  '  VPOHLERS  2020   \345'

        .db     0xe5,0x20,0x1d,0x0e,0x14,0x15,0x20,0x15,0x15,0x15,0x20,0x8a,0x99,0x20,0x0a,0x93,0x20,0x20,0x20,0x20
        .ascii  '                   \345'

        .db     0xe5,0x20,0x8a,0x8f,0x15,0x8a,0x10,0x8a,0x15,0x8a,0x10,0x15,0x20,0x15,0x0c,0x06,0x20,0x20,0x20,0x20
        .ascii  '- FREE THE STONE - \345'

        .db     0xe2,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4
        .db     0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe3

        .ascii  '                                        '
        .ascii  '     E,S,D,X select   e,s,d,x move      '
        .ascii  '       <SPACE> toggle, A next           '
        .ascii  '                                        '

        .db     0x20,0x20,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x20,0x20,0x20,0x20
        .ascii  '  Level  Beginner   '

        .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
        .ascii  '                    '

        .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
        .ascii  '  Puzzle    00001   '

        .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
        .ascii  '                    '

        .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x0a,0x04,0x20,0x20,0x20
        .ascii  '  Moves     00000   '

        .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
        .ascii  '                    '
        .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
        .ascii  '                    '

        .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x97,0x04,0x20,0x20,0x20
        .ascii  '                    '
        .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
        .ascii  '                    '
        .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
        .ascii  '  Code/Reset/Quit   '
        .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
        .ascii  '                    '
        .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
        .ascii  ' \340\344\344\344\344\344\344\344\344\344\344\344\344\344\344\344\341  '
        .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
        .ascii  ' \345               \345  '
        ;FIELD bottom line
        .db     0x20,0x20,0x0d,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0e,0x20,0x20,0x20,0x20
        .ascii  ' \342\344\344\344\344\344\344\344\344\344\344\344\344\344\344\344\343  '

        .db     0x20,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x20,0x20,0x20
        .ascii  '                    '

.endm

.macro CLS_SMALL_WINDOW
        call    cls_small_window
.endm

.macro CLS_FULL_WINDOW
        call    crt_cls
.endm

.macro DECOMP

window_list:
        .dw BWS+OFFSET_COLOR
        .db SCREEN_WIDTH,5
        .db BG_BLUE|FG_CYAN

        .dw BWS+5*SCREEN_WIDTH+OFFSET_COLOR
        .db SCREEN_WIDTH,3
        .db BG_BLACK|FG_CYAN

        .dw BWS+8*SCREEN_WIDTH+OFFSET_COLOR
        .db SCREEN_WIDTH,16
        .db BG_BLUE|FG_YELLOW
        
        .dw POSITION_FIELD-SCREEN_WIDTH-2+OFFSET_COLOR
        .db FIELD_SIZE+4,FIELD_SIZE+2
        .db BG_YELLOW|FG_MAGENTA
        
        .dw POSITION_LEVEL-8+OFFSET_COLOR
        .db 17,5
        .db BG_BLUE|FG_YELLOW
        
        .dw POSITION_LEVEL-8+5*SCREEN_WIDTH+OFFSET_COLOR
        .db 17,4
        .db BG_BLUE|FG_RED
        
        .dw POSITION_INPUT_LINE-3*SCREEN_WIDTH-1+OFFSET_COLOR
        .db 19,7
        .db BG_BLUE|FG_CYAN

        .dw POSITION_INPUT_LINE+OFFSET_COLOR
        .db 15,1
        .db BG_BLUE|FG_RED

window_list_size = 8

decomp:
        ld      de,#BWS
        ld      bc,#SCREEN_WIDTH*SCREEN_HEIGHT
        ldir

        ld      hl,#window_list
        ld      b,#window_list_size
next_window:
        push    bc
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        inc     hl
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        inc     hl
        ld      a,(hl)
        inc     hl
        ex      de,hl
        call    color_window
        ex      de,hl
        pop     bc
        djnz    next_window
        ld      a,#BG_BLUE|FG_YELLOW
        ld      hl,#BWS+OFFSET_COLOR+18*SCREEN_WIDTH+22
        ld      (hl),a
        ld      hl,#BWS+OFFSET_COLOR+18*SCREEN_WIDTH+27
        ld      (hl),a
        ld      hl,#BWS+OFFSET_COLOR+18*SCREEN_WIDTH+33
        ld      (hl),a
        ret
.endm

.macro PUT_A_COLORED
        ld      (hl),a
        set     3,h
        ex      af,af'
        ld      (hl),a
        ex      af,af'
        res     3,h
.endm

.macro SET_STONE_COLOR
        set     3,h
        ld      a,(color_stone)
        ld      (hl),a
        res     3,h
.endm

.macro SET_NORMAL_STONE_COLOR
        ld      a,#STONE_COLOR
        ld      (color_stone),a
.endm

.macro SET_RED_STONE_COLOR
        ld      a,#RED_STONE_COLOR
        ld      (color_stone),a
.endm
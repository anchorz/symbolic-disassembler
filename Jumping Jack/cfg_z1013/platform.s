z9001                           =       0
z1013                           =       1
;
; z1013 specific constants
;
KEY_CODE                        =       0x0004
CURSOR_POS                      =       0x002b
;
; platform specific
;
SCREEN_WIDTH                    =       0x20
SCREEN_HEIGHT                   =       0x20

TOP_LINES                       =       16
TITLE_TOP_SIZE                  =       SCREEN_WIDTH*TOP_LINES-1
MENU_TOP                        =       (TOP_LINES+4)
ALIGN_MIDDLE                    =       0
GAMES_LINES                     =       8
GAME_START_Y                    =       3
SLOW_DOWN_13066                 =       13066
POS_COPYRIGHT                   =       SCREEN_WIDTH*28
POS_LIVES                       =       BWS+30*SCREEN_WIDTH
POS_TOP_WALL                    =       BWS+ 2*SCREEN_WIDTH
POS_TOP_GAME                    =       BWS+ 1*SCREEN_WIDTH+8
POS_GAME_OVER                   =       BWS+ 2*SCREEN_WIDTH+9
POSDIFF_NAME                    =       SCREEN_WIDTH-HINT_COPYRIGHT_size+7
POSDIFF_YEAR                    =       SCREEN_WIDTH-HINT_NAME_size-7
POSDIFF_POINTS                  =       0
POSDIFF_YOUR_SCORE              =       0
POSDIFF_YOUR_SCORE_DY           =       0
POSDIFF_HIGHSCORE_DY            =       0
MONSTER_CORRECTION              =       0

.macro PROGRAM_START
.endm

.macro SCREEN_POS
.endm

.macro CLRSCR
        ld      a,#0x0c
        rst     0x20
        .db     0x00              ;OUTCH
.endm

.macro OUTCH
        rst     0x20
        .db     0x00              ;OUTCH
.endm

.macro INCH
        rst     0x20
        .db     0x01              ;INCH
.endm

.macro PRST7
        rst     0x20
        .db     0x02              ;PRTST7
.endm

.macro INKEY
        xor     a
        ld      (KEY_CODE),a
        rst     0x20
        .db     0x04              ;INKEY
.endm

.macro END_PROGRAM
        rst     0x38
.endm

.macro SET_CURSOR_DE Y,X
        ld      de,#BWS+Y*SCREEN_WIDTH+X
        ld      (CURSOR_POS),de
.endm

.macro SET_CURSOR_HL Y,X
        ld      hl,#BWS+Y*SCREEN_WIDTH+X
        ld      (CURSOR_POS),hl
.endm

.macro SET_CURSOR
        ld      (CURSOR_POS),hl
.endm

.macro REMOVE_CURSOR
        ld      hl,(CURSOR_POS)
        ld      (hl),#' '
.endm

.macro CURSOR_DISABLE
.endm

.macro Z1013_LINE
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
.endm

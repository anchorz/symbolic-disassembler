z9001                           =       1
z1013                           =       0
;
; z9001 specific constants
;
BOS                             =       0x0005
COUNT                           =       0x0023
;letztes gültiges Zeichen
LAKEY                           =       0x0024
;Tastaturpuffer
KEYBU                           =       0x0025
CURS                            =       0x002d
;erste zu rollende Zeile -1
P1ROL                           =       0x003b
;letzte zu rollende Zeile +1
P2ROL                           =       0x003c
;erste zu rollende Spalte -1
P3ROL                           =       0x003d
;letzte zu rollende Spalte +1
P4ROL                           =       0x003e

WBOOT                           =       0xF003
CONST                           =       0xF006
CONIN                           =       0xF009
COOUT                           =       0xF00C
inkey                           =       0xFD33

UP_CONSI                        =       1
UP_CONSO                        =       2
UP_PRNST                        =       9
UP_CSTS                         =       11
UP_SETCU                        =       18
; Löschen des Cursors
UP_DCU                          =       29
;
; platform specific
;
SCREEN_WIDTH                    =       40
SCREEN_HEIGHT                   =       24

TOP_LINES                       =       14
TITLE_TOP_SIZE                  =       SCREEN_WIDTH*TOP_LINES
MENU_TOP                        =       (TOP_LINES+2)
ALIGN_MIDDLE                    =       4
GAMES_LINES                     =       6
GAME_START_Y                    =       2
SLOW_DOWN_13066                 =       18000
POS_LIVES                       =       BWS+23*SCREEN_WIDTH
POS_TOP_WALL                    =       BWS+ 1*SCREEN_WIDTH
POS_TOP_GAME                    =       BWS+ 0*SCREEN_WIDTH+8+ALIGN_MIDDLE
POS_GAME_OVER                   =       BWS+ 0*SCREEN_WIDTH+9+ALIGN_MIDDLE
POS_COPYRIGHT                   =       SCREEN_WIDTH*22
POSDIFF_NAME                    =       SCREEN_WIDTH-HINT_COPYRIGHT_size+3
POSDIFF_YEAR                    =       5
POSDIFF_POINTS                  =       8
POSDIFF_YOUR_SCORE              =       -(SCREEN_WIDTH)
POSDIFF_YOUR_SCORE_DY           =       3
POSDIFF_HIGHSCORE_DY            =       4
MONSTER_CORRECTION              =       1

.macro PROGRAM_START
        jp START
        .ascii 'JUMP    '
        .dw 0
START:
        .endm

.macro SCREEN_POS
        .ascii '    '
 .endm

.macro CLRSCR
        ld      c,#UP_CONSO
        ld      e,#0x0c
        call    BOS
        ld      c,#UP_DCU
        call    BOS
.endm

.macro OUTCH
        push    bc
        push    de
        ld      c,#UP_CONSO
        ld      e,a
        call    BOS
        pop     de
        pop     bc
.endm

.macro INCH
        xor     a
        ld      (KEYBU),a
        ld      c,#UP_CONSI
        call    BOS
.endm

.macro PRST7
        call    prst7
.endm

.macro INKEY
        call    inkey
        ei
.endm

.macro END_PROGRAM
        jp      WBOOT
.endm

.macro SET_CURSOR_DE    Y,X
        push    bc
        ld      de,#(Y+1)*256+(X+1)
        ld      c,#UP_SETCU
        call    BOS
        pop     bc
.endm

.macro SET_CURSOR_HL    Y,X
        push    de
        push    bc
        ld      de,#(Y+1)*256+(X+1)
        ld      h,d
        ld      l,e
        ld      c,#UP_SETCU
        call    BOS
        pop     bc
        pop     de
.endm

.macro SET_CURSOR
        call    set_cursor
.endm

.macro REMOVE_CURSOR
        ld      hl,(CURS)
        ld      (hl),#' '
        res     2,h
        res     7,(hl)
        set     2,h
.endm

.macro CURSOR_DISABLE
        push    bc
        ld      c,#UP_DCU
        call    BOS
        pop     bc
.endm

.macro Z1013_LINE
.endm

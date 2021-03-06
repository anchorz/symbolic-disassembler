z9001                           =       1
z1013                           =       0
ta_alpha                        =       0
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
BWS                             =       0xec00
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

VK_LEFT                         =       0x08
VK_RIGHT                        =       0x09

VK_HEART                        =       0xcb
CHR_WALL                        =       0xc6
CHR_MAN_HEAD                    =       0xcc
CHR_MAN_STAY                    =       0xa1
CHR_MAN_WALK                    =       0x9d
TRANSITION_MAN_WALK_STAY        =       0x04
CHR_MOVING_LINE                 =       0xee
VK_PLAYER                       =       0xc4
CHR_SMOKE                       =       0xcd
CHR_MAN_SLEEP                   =       0x97
CHR_MAN_SLEEP_HEAD              =       0xc9
CHR_ARROW_RIGHT_TOP             =       0x95
CHR_ARROW_RIGHT_BOTTOM          =       0x93
CHR_LINE_TOP                    =       0xf8
CHR_LINE_BOTTOM                 =       0x9e
CHR_MIDDLE_LINE                 =       0xa0

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
HINT_COPYRIGHT_size             =       0x001e
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

.macro TOP_IMAGE_CONTENT
 ; line 1
        SCREEN_POS
        .db     0xae,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e ;........
        .db     0x9e,0x9e,0xad,0x20,0x20,0x20,0x20,0x20 ;..-     
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        SCREEN_POS
        
        ; line 2
        SCREEN_POS
        .db     0x9f,0xb9,0xb6,0xb3,0xb2,0xb6,0xb8,0x20 ;.963268 
        .db     0xbd,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;=0@     
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        SCREEN_POS

        ; line 3
        SCREEN_POS
        .db     0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
        .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
        .db     0x20,0x20,0x20,0x20,0xb7,0xb7,0x20,0x20 ;    77  
        SCREEN_POS

        ; line 4
        SCREEN_POS
        .db     0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
        .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0xb6,0xb7,0x20,0xb9,0xb2,0xb2,0xb8,0x20 ;67 9228 
        SCREEN_POS

        ; line 5
        SCREEN_POS
        .db     0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
        .db     0xb6,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;60@     
        .db     0x20,0x20,0xb2,0xb3,0x20,0x20,0x20,0x20 ;  23    
        .db     0x20,0xba,0xa0,0xb4,0xb4,0xa0,0xb5,0x20 ; : 44 5 
        SCREEN_POS

        ; line 6
        SCREEN_POS
        .db     0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
        .db     0x73,0x3a,0xc0,0x20,0x20,0x20,0x20,0x20 ;s:@     
        .db     0x20,0xb2,0xb0,0xb1,0xb3,0x20,0x20,0xb7 ; 2013  7
        .db     0xb6,0xb1,0xb3,0xb8,0xb1,0xb1,0xb9,0x20 ;6138119 
        SCREEN_POS

        ; line 7
        SCREEN_POS
        .db     0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
        .db     0xf8,0xf8,0xac,0x20,0x20,0x20,0x20,0x20 ;xx,     
        .db     0x20,0xb0,0x20,0x20,0xb5,0xb7,0xb6,0x20 ; 0  576 
        .db     0x20,0x20,0xb1,0xb3,0xb6,0xbc,0x20,0x20 ;  136<  
        SCREEN_POS

        ; line 8
        SCREEN_POS
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0xb1,0xb6,0xb6,0xb6,0xb6,0x20,0x20,0x20 ;16666   
        .db     0x20,0x20,0x20,0xb1,0xb9,0x20,0x20,0x20 ;   19   
         SCREEN_POS

        ; line 9
        Z1013_LINE

        ; line 10
        Z1013_LINE

        ; line 11
        SCREEN_POS
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
         SCREEN_POS

        ; line 12
        SCREEN_POS
        .db     0x20,0x20,0x20,0xb4,0x20,0x20,0x20,0x20 ;   4    
        .db     0x20,0x20,0x20,0x20,0xb0,0x20,0x20,0x20 ;    0   
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0xb4,0x20 ;      4 
        .db     0x20,0x20,0x20,0x20,0xb4,0xb2,0x20,0x20 ;    42  
         SCREEN_POS

        ; line 13
        SCREEN_POS
        .db     0x20,0x20,0x20,0xb4,0xb4,0xb5,0xb5,0xbd ;   4455=
        .db     0xbd,0xb5,0xb6,0xb3,0xb4,0xbc,0xbd,0xb2 ;=5634<=2
        .db     0xb6,0xb3,0x20,0x20,0x20,0x20,0xb4,0xb1 ;63    41
        .db     0xb8,0xb2,0xb6,0xb3,0xbb,0xb0,0x20,0x20 ;8263;0  
         SCREEN_POS

        ; line 14
        SCREEN_POS
        .db     0x20,0xb3,0x20,0xb4,0xb4,0xb5,0xb5,0xb5 ; 3 44555
        .db     0xb5,0xb5,0xb7,0xb0,0xb4,0xb4,0xb5,0xb1 ;55704451
        .db     0xb7,0xb4,0x20,0x20,0xb3,0x20,0xb4,0xb9 ;74  3 49
        .db     0xbd,0xb5,0x20,0xb3,0xb4,0xb8,0x20,0x20 ;=5 348  
         SCREEN_POS

        ; line 15
        SCREEN_POS
        .db     0x20,0xb8,0xb7,0xb0,0xb1,0xb0,0xb1,0xb1 ; 8701011
        .db     0xb1,0xb5,0x20,0x20,0xb0,0xb0,0xb1,0xb1 ;15  0011
        .db     0xb7,0xb0,0x20,0x20,0xb8,0xb7,0xb0,0xb1 ;70  8701
        .db     0xb6,0x20,0xb6,0x20,0xb0,0x20,0xb0,0x20 ;6 6 0 0 
         SCREEN_POS

        ; line 16
        SCREEN_POS
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        SCREEN_POS
.endm

.macro MONSTER_IMG_CONTENT
        .db     0x94,0x90,0x8b,0x90,0x8b,0x91,0x97,0x91 ;........
        .db     0x19,0xb5,0x20,0xbe,0x20,0xbf,0x20,0xae ;.5 > ? .
        .db     0x92,0x96,0xa0,0xa0,0xa0,0xa0,0x88,0xc1 ;..    .A
        .db     0x20,0x95,0x20,0xb7,0x1e,0xff,0x20,0x92 ; . 7.. .
        .db     0x17,0x8c,0xf9,0x8c,0x1d,0x1f,0xfc,0x8c ;..y...|.
        .db     0x92,0x96,0x83,0x82,0x95,0x93,0x20,0x20 ;......  
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
.endm

z9001                           =       0
z1013                           =       0
ta_alpha                        =       1
;
; ta os specific constants
;
BWS                             =       0xf000
OFFSET_COLOR                    =       0x0800
cfg10_settings                  =       0xe468
cfg20_settings                  =       0xe469
crt_cls                         =       0xe9e8
mon_reboot                      =       0xe023
CFG10                           =       0x10
CFG20                           =       0x20
CRT_REG                         =       0x50
CRT_DATA                        =       0x51
REG_10_CURSOR_START             =       10 

BWS_LINE_WIDTH                  =       40
BWS_HEIGHT                      =       24
BWS_SIZE                        =       40*24

VK_CLS                          =       0x0c
VK_ENTER                        =       0x0d
VK_LEFT                         =       0x1d
VK_RIGHT                        =       0x1c
VK_UP                           =       0x1e
VK_DOWN                         =       0x1f

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
;
; application specific constants
;
CHR_MAN                         =       0xfd
CHR_VISITED                     =       0xee
CHR_FREE                        =       ' '
CHR_BONUS                       =       0xfa
CHR_MINE                        =       0xf1
END_ROW                         =       2
END_SCREEN_CORRECTION           =       5 ; starting line of the text
START_ROW                       =       BWS_HEIGHT-2
START_COLUMN                    =       (BWS_LINE_WIDTH/2)-1
END_COLUMN                      =       (BWS_LINE_WIDTH/2)-1
CUT_OFF                         =       (START_ROW-END_ROW-3)*BWS_LINE_WIDTH

.macro  PROGRAM_HEADER
        ld      hl,#s__CODE
        ld      de,#s__CODE
        ld      bc,#l__CODE
        ldir
        ld      hl,#cfg10_settings
        res     6,(hl)                                  ;ROM_PACK_EN=0
        ld      a,(hl)
        out     (CFG10),a
        call    crt_cls
        call    crt_cursor_disable
.endm

.macro  JOYSTICK_INIT
.endm

.macro  FILL_BACKGROUND_COLOR
        ld hl,#BWS+OFFSET_COLOR
        ld de,#BWS+OFFSET_COLOR-1
        ld bc,#BWS_SIZE-1
        ld a,#FG_WHITE|BG_BLACK
        ld (hl),a
        ldir
.endm

.macro  END_MESSAGE
        jp      exit
.endm

.macro  QUIT_SOUND
.endm

.macro  CLICK_SOUND
.endm

.macro  INKEY
        call    inkey
        or      a
        jr      z,up_inch
.endm

.macro  JOYSTICK
.endm

.macro  TXT_MINES
        .ascii 'MINEN:'
.endm

.macro  TXT_PUNKTE
        .ascii '     PUNKTE:'
.endm

.macro  TXT_EMPTY_SCREEN
        .ascii '     '
ofs_vorsicht   .equ .-txt_empty_screen
        .ascii '                 '
        .db 0xe0
        .rept (BWS_LINE_WIDTH/2-3)
        .db 0xe4
        .endm
        .db 0xea,0xe4,0xea
        .rept (BWS_LINE_WIDTH/2-2)
        .db 0xe4
        .endm
        .db 0xe1

        .db 0xe8
        .rept (BWS_LINE_WIDTH/2-3)
        .db 0xe4
        .endm
        .db 0xe3,0x20,0xe2
        .rept (BWS_LINE_WIDTH/2-2)
        .db 0xe4
        .endm
        .db 0xe9

        .rept (BWS_HEIGHT-5)
                .db 0xe5
                .rept (BWS_LINE_WIDTH-2)
                .db 0x20
                .endm
                .db 0xe5
        .endm

        .db 0xe8
        .rept (BWS_LINE_WIDTH/2-3)
        .db 0xe4
        .endm
        .db 0xe1,0x20,0xe0
        .rept (BWS_LINE_WIDTH/2-2)
        .db 0xe4
        .endm
        .db 0xe9

        .db 0xe2
        .rept (BWS_LINE_WIDTH/2-3)
        .db 0xe4
        .endm
        .db 0xeb,0xe4,0xeb
        .rept (BWS_LINE_WIDTH/2-2)
        .db 0xe4
        .endm
        .db 0xe3
.endm

.macro TITLE_IMG_CONTENT
        .ascii '\340\344\344\344\344\344\344\344\344\344\341\040\040\040\040\040\040\040\040   \331   \331\331  \331         '
        .ascii '\345\227\003\011\227\003\011\040\224\027\345\040\040\040\040\040\040\040\040  \331 \331\237\014\003\003\014\020\331\331        '
        .ascii '\345\012\217\020\225\040\040\040\225\025\345\040\040\040\040\040\040\040\040  \331 \227\001\040\040\040\040\002\024\040        '
        .ascii '\345\237\040\225\225\040\237\040\225\025\345\040\040\040\040\040\040\040\040  \040 \025\040\361\040\040\361\040\225\040S Start '
        .ascii '\345\002\014\006\002\014\006\040\016\015\345\040\237\014\003\003\014\020\040  \040 \012\020\040\340\341\040\237\005\040        '
        .ascii                            '\345presents:\345\227\001\040\040\040\040\002\024  \040 \040\002\014\217\217\014\001\040\040\334 Hoch  '
        .ascii '\342\344\344\344\344\344\344\344\344\344\343\025\040\361\040\040\361\040\225  \040 \040\040\225\040\040\025\040\040\040        '
        .ascii '\040\040\040\040\040\040\040\040\040\040\040\012\020\040\342\343\040\237\005  \040 \040\040\205\040\040\212\040\040\040\333 Runter'
        .ascii '\040\040\040\040\040\040\040\040\040\040\040\040\002\014\217\217\014\001                      '
        .ascii ' Now you     \032  \212\217              \335 Links '
        .ascii '            \003    \367\366                     '
        .ascii ' are happy      \367\337\337\366  but be    \336 Rechts'
        .ascii '                       carefull!        '
        .ascii '                                        '
        .ascii '                                        '
        .ascii '     \040\040 \237\040\237\040\040\040\040\040\040\040\040\040\237\020\040\040\040\040\237\040\040\040\020\040\040\040      ' 
        .ascii '     \233\040 \225\011\224\040\021\237\237\040\040\217\020\040\025\040\021\040\217\020\225\040\237\217\025\040\040\030      '
        .ascii '     \040\031 \225\040\225\040\025\225\001\025\225\217\032\012\027\040\025\225\217\032\225\040\025\040\025\040\231\040      '
        .ascii '     \006\040 \225\040\225\237\212\225\040\212\012\217\217\040\025\237\212\012\217\217\225\020\232\217\025\040\040\011      '
        .ascii '                                        '
        .ascii '                                        '
        .ascii '     C-1987 SOFTWARE CENTER ILMENAU     '
        .ascii '          by DIRK STREHLE               '
        .ascii '      2020 MOD by Andreas Ziermann      '
.endm

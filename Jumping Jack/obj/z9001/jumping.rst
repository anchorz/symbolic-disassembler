                                      1         .module jumping_jack
                                      2         .include 'platform.s'
                           000001     1 z9001                           =       1
                           000000     2 z1013                           =       0
                                      3 ;
                                      4 ; z9001 specific constants
                                      5 ;
                           000005     6 BOS                             =       0x0005
                           000023     7 COUNT                           =       0x0023
                                      8 ;letztes gültiges Zeichen
                           000024     9 LAKEY                           =       0x0024
                                     10 ;Tastaturpuffer
                           000025    11 KEYBU                           =       0x0025
                           00002D    12 CURS                            =       0x002d
                                     13 ;erste zu rollende Zeile -1
                           00003B    14 P1ROL                           =       0x003b
                                     15 ;letzte zu rollende Zeile +1
                           00003C    16 P2ROL                           =       0x003c
                                     17 ;erste zu rollende Spalte -1
                           00003D    18 P3ROL                           =       0x003d
                                     19 ;letzte zu rollende Spalte +1
                           00003E    20 P4ROL                           =       0x003e
                                     21 
                           00F003    22 WBOOT                           =       0xF003
                           00F006    23 CONST                           =       0xF006
                           00F009    24 CONIN                           =       0xF009
                           00F00C    25 COOUT                           =       0xF00C
                           00FD33    26 inkey                           =       0xFD33
                                     27 
                           000001    28 UP_CONSI                        =       1
                           000002    29 UP_CONSO                        =       2
                           000009    30 UP_PRNST                        =       9
                           00000B    31 UP_CSTS                         =       11
                           000012    32 UP_SETCU                        =       18
                                     33 ; Löschen des Cursors
                           00001D    34 UP_DCU                          =       29
                                     35 ;
                                     36 ; platform specific
                                     37 ;
                           000028    38 SCREEN_WIDTH                    =       40
                           000018    39 SCREEN_HEIGHT                   =       24
                                     40 
                           00000E    41 TOP_LINES                       =       14
                           000230    42 TITLE_TOP_SIZE                  =       SCREEN_WIDTH*TOP_LINES
                           000010    43 MENU_TOP                        =       (TOP_LINES+2)
                           000004    44 ALIGN_MIDDLE                    =       4
                           000006    45 GAMES_LINES                     =       6
                           000002    46 GAME_START_Y                    =       2
                           004650    47 SLOW_DOWN_13066                 =       18000
                           00EF98    48 POS_LIVES                       =       BWS+23*SCREEN_WIDTH
                           00EC28    49 POS_TOP_WALL                    =       BWS+ 1*SCREEN_WIDTH
                           00EC0C    50 POS_TOP_GAME                    =       BWS+ 0*SCREEN_WIDTH+8+ALIGN_MIDDLE
                           00EC0D    51 POS_GAME_OVER                   =       BWS+ 0*SCREEN_WIDTH+9+ALIGN_MIDDLE
                           000370    52 POS_COPYRIGHT                   =       SCREEN_WIDTH*22
                           00000D    53 POSDIFF_NAME                    =       SCREEN_WIDTH-HINT_COPYRIGHT_size+3
                           000005    54 POSDIFF_YEAR                    =       5
                           000008    55 POSDIFF_POINTS                  =       8
                           FFFFFFD8    56 POSDIFF_YOUR_SCORE              =       -(SCREEN_WIDTH)
                           000003    57 POSDIFF_YOUR_SCORE_DY           =       3
                           000004    58 POSDIFF_HIGHSCORE_DY            =       4
                           000001    59 MONSTER_CORRECTION              =       1
                                     60 
                                     61 .macro PROGRAM_START
                                     62         jp START
                                     63         .ascii 'JUMP    '
                                     64         .dw 0
                                     65 START:
                                     66         .endm
                                     67 
                                     68 .macro SCREEN_POS
                                     69         .ascii '    '
                                     70  .endm
                                     71 
                                     72 .macro CLRSCR
                                     73         ld      c,#UP_CONSO
                                     74         ld      e,#0x0c
                                     75         call    BOS
                                     76         ld      c,#UP_DCU
                                     77         call    BOS
                                     78 .endm
                                     79 
                                     80 .macro OUTCH
                                     81         push    bc
                                     82         push    de
                                     83         ld      c,#UP_CONSO
                                     84         ld      e,a
                                     85         call    BOS
                                     86         pop     de
                                     87         pop     bc
                                     88 .endm
                                     89 
                                     90 .macro INCH
                                     91         xor     a
                                     92         ld      (KEYBU),a
                                     93         ld      c,#UP_CONSI
                                     94         call    BOS
                                     95 .endm
                                     96 
                                     97 .macro PRST7
                                     98         call    prst7
                                     99 .endm
                                    100 
                                    101 .macro INKEY
                                    102         call    inkey
                                    103         ei
                                    104 .endm
                                    105 
                                    106 .macro END_PROGRAM
                                    107         jp      WBOOT
                                    108 .endm
                                    109 
                                    110 .macro SET_CURSOR_DE    Y,X
                                    111         push    bc
                                    112         ld      de,#(Y+1)*256+(X+1)
                                    113         ld      c,#UP_SETCU
                                    114         call    BOS
                                    115         pop     bc
                                    116 .endm
                                    117 
                                    118 .macro SET_CURSOR_HL    Y,X
                                    119         push    de
                                    120         push    bc
                                    121         ld      de,#(Y+1)*256+(X+1)
                                    122         ld      h,d
                                    123         ld      l,e
                                    124         ld      c,#UP_SETCU
                                    125         call    BOS
                                    126         pop     bc
                                    127         pop     de
                                    128 .endm
                                    129 
                                    130 .macro SET_CURSOR
                                    131         call    set_cursor
                                    132 .endm
                                    133 
                                    134 .macro REMOVE_CURSOR
                                    135         ld      hl,(CURS)
                                    136         ld      (hl),#' '
                                    137         res     2,h
                                    138         res     7,(hl)
                                    139         set     2,h
                                    140 .endm
                                    141 
                                    142 .macro CURSOR_DISABLE
                                    143         push    bc
                                    144         ld      c,#UP_DCU
                                    145         call    BOS
                                    146         pop     bc
                                    147 .endm
                                    148 
                                    149 .macro Z1013_LINE
                                    150 .endm
                                      3 
                                      4         .globl  _main
                                      5         .globl  sadr
                                      6 ; 
                                      7 ; constant
                                      8 ; 
                           000000     9 ZERO                             = 0x00
                           000000    10 HI_ZERO                          = 0x00
                           000001    11 LEVEL_1                          = 0x01
                           000008    12 VK_LEFT                          = 0x08
                           000009    13 VK_RIGHT                         = 0x09
                           00000C    14 VK_CLS                           = 0x0c
                           0000CB    15 VK_HEART                         = 0xcb
                           0000C4    16 VK_PLAYER                        = 0xc4
                           0000A0    17 CHR_MIDDLE_LINE                  = 0xa0
                           0000CD    18 CHR_SMOKE                        = 0xcd
                           0000C6    19 CHR_WALL                         = 0xc6
                           0000CC    20 CHR_MAN_HEAD                     = 0xcc
                           0000A1    21 CHR_MAN_STAY                     = 0xa1
                           00009D    22 CHR_MAN_WALK                     = 0x9d
                           000004    23 TRANSITION_MAN_WALK_STAY         = 0x04
                           000097    24 CHR_MAN_SLEEP                    = 0x97
                           0000C9    25 CHR_MAN_SLEEP_HEAD               = 0xc9
                           000095    26 CHR_ARROW_RIGHT_TOP              = 0x95
                           000093    27 CHR_ARROW_RIGHT_BOTTOM           = 0x93
                           0000F8    28 CHR_LINE_TOP                     = 0xf8
                           00009E    29 CHR_LINE_BOTTOM                  = 0x9e
                           0000EE    30 CHR_MOVING_LINE                  = 0xee
                           00005F    31 SMALL_CAPITALS                   = 0x5f
                           000020    32 CAPITALIZE                       = 0x20
                           000006    33 INITIAL_LIVES                    = 0x06
                           000001    34 INITIAL_LEVEL                    = 0x01
                           000005    35 MAX_FAIL_COUNTER                 = 0x05
                           000002    36 INITIAL_FAIL_COUNTER             = 0x02
                           000001    37 INITIAL_DELAY_COUNTER            = 0x01
                           00000B    38 DELAY_COUNTER                    = 0x0b
                           000008    39 DELAY_COUNTER2                   = 0x08
                           000004    40 DELAY_COUNTER_JUMP               = 0x04
                           000002    41 MOVE_2X_RIGHT                    = 0x02
                           000004    42 MONSTER_WIDTH                    = 0x04
                           000008    43 NUMBER_OF_LINES                  = 0x08
                           000005    44 NUMBER_HIGHSCORE_ENTRIES         = 0x05
                           000008    45 MAX_LEVEL                        = 0x08
                                     46 
                           00EC00    47 BWS                              = 0xec00
                           0001FF    48 TOP_IMAGE_size                   = 0x01ff
                           000005    49 VERSION_INFO_size                = 0x0005
                           00000C    50 HINT_RIGHT_size                  = 0x000c
                           00000C    51 HINT_LEFT_size                   = 0x000c
                           00000C    52 HINT_JUMP_size                   = 0x000c
                           00000C    53 HINT_PLAY_size                   = 0x000c
                           00000C    54 HINT_EXIT_size                   = 0x000c
                           00001E    55 HINT_COPYRIGHT_size              = 0x001e
                           00000E    56 HINT_NAME_size                   = 0x000e
                           00000E    57 HINT_YEAR_size                   = 0x000e
                           00010F    58 LINE_BUFFER_size                 = 0x010f
                           000005    59 OFFSET_HOLES_size                = 0x0005
                           000005    60 OFFSET_HOLES_JUMP_PENALTY_size   = 0x0005
                           000010    61 TXT_JUMP_size                    = 0x0010
                           00000F    62 TXT_GAME_OVER_size               = 0x000f
                           00000C    63 TXT_YOUR_SCORE_size              = 0x000c
                           000009    64 TXT_HAZARD_size                  = 0x0009
                           000012    65 TXT_NEW_HIGH_SCORE_size          = 0x0012
                           000002    66 HIGH_SCORE_TABLE01_size          = 0x0002
                           000002    67 HIGH_SCORE_TABLE02_size          = 0x0002
                           000002    68 HIGH_SCORE_TABLE03_size          = 0x0002
                           000002    69 HIGH_SCORE_TABLE04_size          = 0x0002
                           000002    70 HIGH_SCORE_TABLE05_size          = 0x0002
                           000002    71 HIGH_SCORE_TABLE_TMP_size        = 0x0002
                           000002    72 INITIALS_size                    = 0x0002
                           000038    73 MONSTER_PTR_size                 = 0x0038
                           000038    74 MONSTER_IMG_size                 = 0x0038
                                     75 ;
                                     76 ;
                                     77 ;
      000300                         78 _main:
      000300                         79 sadr:
      000000                         80         PROGRAM_START
      000300 C3 0D 03         [10]    1         jp START
      000303 4A 55 4D 50 20 20 20     2         .ascii 'JUMP    '
             20
      00030B 00 00                    3         .dw 0
      00030D                          4 START:
      00000D                         81         CLRSCR
      00030D 0E 02            [ 7]    1         ld      c,#UP_CONSO
      00030F 1E 0C            [ 7]    2         ld      e,#0x0c
      000311 CD 05 00         [17]    3         call    BOS
      000314 0E 1D            [ 7]    4         ld      c,#UP_DCU
      000316 CD 05 00         [17]    5         call    BOS
      000319 11 00 EC         [10]   82         ld      de,#BWS
      00031C 21 0B 0A         [10]   83         ld      hl,#TOP_IMAGE
      00031F 01 30 02         [10]   84         ld      bc,#TITLE_TOP_SIZE
      000322 ED B0            [21]   85         ldir
      000324 21 30 EE         [10]   86         ld      hl,#BWS+SCREEN_WIDTH*TOP_LINES
      000327 36 CB            [10]   87         ld      (hl),#VK_HEART
      000329 11 31 EE         [10]   88         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+1
      00032C 01 27 00         [10]   89         ld      bc,#SCREEN_WIDTH-1
      00032F ED B0            [21]   90         ldir
      000331 11 50 EE         [10]   91         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+(SCREEN_WIDTH-8)
      000334 21 B1 0C         [10]   92         ld      hl,#VERSION_INFO
      000337 01 05 00         [10]   93         ld      bc,#VERSION_INFO_size
      00033A ED B0            [21]   94         ldir
      00033C 11 8E EE         [10]   95         ld      de,#BWS+SCREEN_WIDTH*MENU_TOP+10+ALIGN_MIDDLE
      00033F 21 3B 0C         [10]   96         ld      hl,#HINT_RIGHT
      000342 01 0C 00         [10]   97         ld      bc,#HINT_RIGHT_size
      000345 ED B0            [21]   98         ldir
      000347 0E 1C            [ 7]   99         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000349 EB               [ 4]  100         ex      de,hl
      00034A 09               [11]  101         add     hl,bc
      00034B EB               [ 4]  102         ex      de,hl
      00034C 0E 0C            [ 7]  103         ld      c,#HINT_RIGHT_size
      00034E ED B0            [21]  104         ldir
      000350 0E 1C            [ 7]  105         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000352 EB               [ 4]  106         ex      de,hl
      000353 09               [11]  107         add     hl,bc
      000354 EB               [ 4]  108         ex      de,hl
      000355 0E 0C            [ 7]  109         ld      c,#HINT_RIGHT_size
      000357 ED B0            [21]  110         ldir
      000359 0E 1C            [ 7]  111         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      00035B EB               [ 4]  112         ex      de,hl
      00035C 09               [11]  113         add     hl,bc
      00035D EB               [ 4]  114         ex      de,hl
      00035E 0E 0C            [ 7]  115         ld      c,#HINT_RIGHT_size
      000360 ED B0            [21]  116         ldir
      000362 0E 1C            [ 7]  117         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000364 EB               [ 4]  118         ex      de,hl
      000365 09               [11]  119         add     hl,bc
      000366 EB               [ 4]  120         ex      de,hl
      000367 0E 0C            [ 7]  121         ld      c,#HINT_RIGHT_size
      000369 ED B0            [21]  122         ldir
      00036B 11 70 EF         [10]  123         ld      de,#BWS+POS_COPYRIGHT
      00036E 0E 1E            [ 7]  124         ld      c,#HINT_COPYRIGHT_size
      000370 ED B0            [21]  125         ldir
      000372 0E 0D            [ 7]  126         ld      c,#POSDIFF_NAME
      000374 EB               [ 4]  127         ex      de,hl
      000375 09               [11]  128         add     hl,bc
      000376 EB               [ 4]  129         ex      de,hl
      000377 0E 0E            [ 7]  130         ld      c,#HINT_NAME_size
      000379 ED B0            [21]  131         ldir
      00037B 0E 05            [ 7]  132         ld      c,#POSDIFF_YEAR
      00037D EB               [ 4]  133         ex      de,hl
      00037E 09               [11]  134         add     hl,bc
      00037F EB               [ 4]  135         ex      de,hl
      000380 0E 12            [ 7]  136         ld      c,#HINT_YEAR_size+VERSION_INFO_size-1
      000382 ED B0            [21]  137         ldir
      000384                        138 choose_menu:
      000384 AF               [ 4]  139         xor     a
      000085                        140         INCH
      000385 AF               [ 4]    1         xor     a
      000386 32 25 00         [13]    2         ld      (KEYBU),a
      000389 0E 01            [ 7]    3         ld      c,#UP_CONSI
      00038B CD 05 00         [17]    4         call    BOS
      00038E FE 5F            [ 7]  141         cp      #SMALL_CAPITALS
      000390 38 02            [12]  142         jr      c,capitalized
      000392 D6 20            [ 7]  143         sub     #CAPITALIZE
      000394                        144 capitalized:
      000394 FE 45            [ 7]  145         cp      #'E'
      000396 CA 93 09         [10]  146         jp      z,exit_game
      000399 FE 50            [ 7]  147         cp      #'P'
      00039B 20 E7            [12]  148         jr      nz,choose_menu
      00039D                        149 new_game:
      00009D                        150         CLRSCR
      00039D 0E 02            [ 7]    1         ld      c,#UP_CONSO
      00039F 1E 0C            [ 7]    2         ld      e,#0x0c
      0003A1 CD 05 00         [17]    3         call    BOS
      0003A4 0E 1D            [ 7]    4         ld      c,#UP_DCU
      0003A6 CD 05 00         [17]    5         call    BOS
      0003A9 21 D6 0D         [10]  151         ld      hl,#LIVES
      0003AC 36 06            [10]  152         ld      (hl),#INITIAL_LIVES
      0003AE 21 D7 0D         [10]  153         ld      hl,#POINTS
      0003B1 36 00            [10]  154         ld      (hl),#ZERO
      0003B3 23               [ 6]  155         inc     hl
      0003B4 36 00            [10]  156         ld      (hl),#ZERO
      0003B6 06 06            [ 7]  157         ld      b,#INITIAL_LIVES
      0003B8 21 98 EF         [10]  158         ld      hl,#POS_LIVES
      0003BB                        159 draw_player:
      0003BB 3E 02            [ 7]  160         ld      a,#MOVE_2X_RIGHT
      0003BD 85               [ 4]  161         add     a,l
      0003BE 6F               [ 4]  162         ld      l,a
      0003BF 36 C4            [10]  163         ld      (hl),#VK_PLAYER
      0003C1 10 F8            [13]  164         djnz    draw_player
      0003C3 3E 01            [ 7]  165         ld      a,#INITIAL_LEVEL
      0003C5 32 D9 0D         [13]  166         ld      (LEVEL),a
      0003C8 3E 02            [ 7]  167         ld      a,#INITIAL_FAIL_COUNTER
      0003CA 32 D0 0D         [13]  168         ld      (cnt_fail_trap),a
      0003CD 32 D1 0D         [13]  169         ld      (cnt_fail_jump),a
      0003D0 21 00 EC         [10]  170         ld      hl,#BWS
      0003D3 36 20            [10]  171         ld      (hl),#' '
      0003D5 11 01 EC         [10]  172         ld      de,#BWS+1
      0003D8 01 96 03         [10]  173         ld      bc,#(3+GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH-2
      0003DB ED B0            [21]  174         ldir
      0003DD 21 28 EC         [10]  175         ld      hl,#POS_TOP_WALL
      0003E0 36 C6            [10]  176         ld      (hl),#CHR_WALL
      0003E2 11 29 EC         [10]  177         ld      de,#POS_TOP_WALL+1
      0003E5 01 27 00         [10]  178         ld      bc,#SCREEN_WIDTH-1
      0003E8 ED B0            [21]  179         ldir
      0003EA 21 70 EC         [10]  180         ld      hl,#POS_TOP_WALL+2*SCREEN_WIDTH-8
      0003ED 36 C6            [10]  181         ld      (hl),#CHR_WALL
      0003EF 2B               [ 6]  182         dec     hl
      0003F0 2B               [ 6]  183         dec     hl
      0003F1 36 95            [10]  184         ld      (hl),#CHR_ARROW_RIGHT_TOP
      0003F3 2B               [ 6]  185         dec     hl
      0003F4 36 F8            [10]  186         ld      (hl),#CHR_LINE_TOP
      0003F6 21 98 EC         [10]  187         ld      hl,#POS_TOP_WALL+3*SCREEN_WIDTH-8
      0003F9 36 C6            [10]  188         ld      (hl),#CHR_WALL
      0003FB 2B               [ 6]  189         dec     hl
      0003FC 2B               [ 6]  190         dec     hl
      0003FD 36 93            [10]  191         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      0003FF 2B               [ 6]  192         dec     hl
      000400 36 9E            [10]  193         ld      (hl),#CHR_LINE_BOTTOM
      000402 21 DB 0D         [10]  194         ld      hl,#TXT_JUMP
      000405 11 0C EC         [10]  195         ld      de,#POS_TOP_GAME
      000408 01 10 00         [10]  196         ld      bc,#TXT_JUMP_size
      00040B ED B0            [21]  197         ldir
      00040D 3E 01            [ 7]  198         ld      a,#INITIAL_DELAY_COUNTER
      00040F 21 D4 0D         [10]  199         ld      hl,#JUMP_DELAY
      000412 77               [ 7]  200         ld      (hl),a
      000413 21 D5 0D         [10]  201         ld      hl,#FAIL_DELAY
      000416 77               [ 7]  202         ld      (hl),a
      000417 23               [ 6]  203         inc     hl
      000418 21 32 EF         [10]  204         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      00041B 22 D2 0D         [16]  205         ld      (MAN_HEAD),hl
      00041E 36 CC            [10]  206         ld      (hl),#CHR_MAN_HEAD
      000420 11 28 00         [10]  207         ld      de,#SCREEN_WIDTH
      000423 19               [11]  208         add     hl,de
      000424 36 A1            [10]  209         ld      (hl),#CHR_MAN_STAY
      000426                        210 animation_loop:
      000426 CD BD 04         [17]  211         call    animation_monster
      000429 CD 7C 05         [17]  212         call    animation_lines
      00042C CD EC 05         [17]  213         call    animation_delay
      00042F 3A D4 0D         [13]  214         ld      a,(JUMP_DELAY)
      000432 FE 01            [ 7]  215         cp      #INITIAL_DELAY_COUNTER
      000434 20 29            [12]  216         jr      nz,handle_jump_delay
      000436 3A D5 0D         [13]  217         ld      a,(FAIL_DELAY)
      000439 FE 01            [ 7]  218         cp      #INITIAL_DELAY_COUNTER
      00043B 20 1F            [12]  219         jr      nz,handle_fail_delay
      00013D                        220         INKEY
      00043D CD 33 FD         [17]    1         call    inkey
      000440 FB               [ 4]    2         ei
      000441 FE 20            [ 7]  221         cp      #' '
      000443 CA A9 06         [10]  222         jp      z,action_jump
      000446 FE 08            [ 7]  223         cp      #VK_LEFT
      000448 CC F9 05         [17]  224         call    z,action_left
      00044B FE 09            [ 7]  225         cp      #VK_RIGHT
      00044D CC 50 06         [17]  226         call    z,action_right
                           000001   227 .if z9001
                                    228         ;debugginh
      000450 FE 55            [ 7]  229         cp      #'U'
      000452 20 08            [12]  230         jr      nz,handle_fail_delay
      000454 21 64 EC         [10]  231         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+20
      000457 36 CC            [10]  232         ld      (hl),#CHR_MAN_HEAD
      000459 22 D2 0D         [16]  233         ld      (MAN_HEAD),hl
                                    234 .endif
      00045C                        235 handle_fail_delay:
      00045C CD 0D 07         [17]  236         call    check_fall_through
      00045F                        237 handle_jump_delay:
      00045F 3A D4 0D         [13]  238         ld      a,(JUMP_DELAY)
      000462 FE 01            [ 7]  239         cp      #INITIAL_DELAY_COUNTER
      000464 28 04            [12]  240         jr      z,jump_delay_counter_set
      000466 3D               [ 4]  241         dec     a
      000467 32 D4 0D         [13]  242         ld      (JUMP_DELAY),a
      00046A                        243 jump_delay_counter_set:
      00046A 3A D5 0D         [13]  244         ld      a,(FAIL_DELAY)
      00046D FE 01            [ 7]  245         cp      #INITIAL_DELAY_COUNTER
      00046F 28 42            [12]  246         jr      z,player_activity
      000471 3D               [ 4]  247         dec     a
      000472 32 D5 0D         [13]  248         ld      (FAIL_DELAY),a
      000475 FE 01            [ 7]  249         cp      #INITIAL_DELAY_COUNTER
      000477 20 3A            [12]  250         jr      nz,player_activity
      000479 2A D2 0D         [16]  251         ld      hl,(MAN_HEAD)
                                    252         ; test for bottom line
      00047C 11 D0 EE         [10]  253         ld      de,#BWS+(GAME_START_Y+3*GAMES_LINES-2)*SCREEN_WIDTH
      00047F A7               [ 4]  254         and     a
      000480 ED 52            [15]  255         sbc     hl,de
      000482 38 16            [12]  256         jr      c,player_wake_up
      000484 3A D6 0D         [13]  257         ld      a,(LIVES)
      000487 3D               [ 4]  258         dec     a
      000488 32 D6 0D         [13]  259         ld      (LIVES),a
      00048B 21 9A EF         [10]  260         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES+3)*SCREEN_WIDTH+2
      00048E 16 00            [ 7]  261         ld      d,#HI_ZERO
      000490 87               [ 4]  262         add     a,a
      000491 5F               [ 4]  263         ld      e,a
      000492 19               [11]  264         add     hl,de
      000493 36 20            [10]  265         ld      (hl),#' '
      000495 FE 00            [ 7]  266         cp      #ZERO
      000497 CA 24 08         [10]  267         jp      z,no_lives
      00049A                        268 player_wake_up:
      00049A 2A D2 0D         [16]  269         ld      hl,(MAN_HEAD)
      00049D 36 CC            [10]  270         ld      (hl),#CHR_MAN_HEAD
      00049F 2B               [ 6]  271         dec     hl
      0004A0 3E 20            [ 7]  272         ld      a,#' '
      0004A2 77               [ 7]  273         ld      (hl),a
      0004A3 23               [ 6]  274         inc     hl
      0004A4 23               [ 6]  275         inc     hl
      0004A5 23               [ 6]  276         inc     hl
      0004A6 77               [ 7]  277         ld      (hl),a
      0004A7 2B               [ 6]  278         dec     hl
      0004A8 11 28 00         [10]  279         ld      de,#SCREEN_WIDTH
      0004AB 19               [11]  280         add     hl,de
      0004AC 77               [ 7]  281         ld      (hl),a
      0004AD 23               [ 6]  282         inc     hl
      0004AE 77               [ 7]  283         ld      (hl),a
      0004AF 2B               [ 6]  284         dec     hl
      0004B0 2B               [ 6]  285         dec     hl
      0004B1 36 9D            [10]  286         ld      (hl),#CHR_MAN_WALK
      0004B3                        287 player_activity:
      0004B3 CD 5E 07         [17]  288         call    check_level_finished
      0004B6 C3 26 04         [10]  289         jp      animation_loop
                                    290 ; unchecked data source
      0004B9 67 75 66 69            291         .db     0x67,0x75,0x66,0x69                     ;gufi
      0004BD                        292 animation_monster:
      0004BD 3A D9 0D         [13]  293         ld      a,(LEVEL)
      0004C0 32 DA 0D         [13]  294         ld      (counter),a
      0004C3 FE 01            [ 7]  295         cp      #LEVEL_1
      0004C5 C8               [11]  296         ret     z
      0004C6 01 EB 0D         [10]  297         ld      bc,#MONSTER_PTR
      0004C9 11 23 0E         [10]  298         ld      de,#MONSTER_IMG
      0004CC                        299 handle_one_monster:
      0004CC 0A               [ 7]  300         ld      a,(bc)
      0004CD 6F               [ 4]  301         ld      l,a
      0004CE 03               [ 6]  302         inc     bc
      0004CF 0A               [ 7]  303         ld      a,(bc)
      0004D0 67               [ 4]  304         ld      h,a
      0004D1 CD E0 04         [17]  305         call    handle_by_ptr
      0004D4 3A DA 0D         [13]  306         ld      a,(counter)
      0004D7 3D               [ 4]  307         dec     a
      0004D8 32 DA 0D         [13]  308         ld      (counter),a
      0004DB FE 01            [ 7]  309         cp      #LEVEL_1
      0004DD C8               [11]  310         ret     z
      0004DE 18 EC            [12]  311         jr      handle_one_monster
      0004E0                        312 handle_by_ptr:
      0004E0 C5               [11]  313         push    bc
      0004E1 3E 04            [ 7]  314         ld      a,#MONSTER_WIDTH
      0004E3 D5               [11]  315         push    de
      0004E4                        316 handle_by_column:
      0004E4 36 20            [10]  317         ld      (hl),#' '
      0004E6 11 28 00         [10]  318         ld      de,#SCREEN_WIDTH
      0004E9 19               [11]  319         add     hl,de
      0004EA 36 20            [10]  320         ld      (hl),#' '
      0004EC A7               [ 4]  321         and     a
      0004ED ED 52            [15]  322         sbc     hl,de
      0004EF 2B               [ 6]  323         dec     hl
      0004F0 E5               [11]  324         push    hl
      0004F1 08               [ 4]  325         ex      af,af'
      0004F2 11 EF EC         [10]  326         ld      de,#BWS+(GAME_START_Y+4)*SCREEN_WIDTH-1
      0004F5 A7               [ 4]  327         and     a
      0004F6 ED 52            [15]  328         sbc     hl,de
      0004F8 38 0D            [12]  329         jr      c,correct_ptr
      0004FA C5               [11]  330         push    bc
      0004FB 06 06            [ 7]  331         ld      b,#GAMES_LINES
      0004FD 11 78 00         [10]  332         ld      de,#3*SCREEN_WIDTH
      000500                        333 get_column:
      000500 A7               [ 4]  334         and     a
      000501 ED 52            [15]  335         sbc     hl,de
      000503 38 13            [12]  336         jr      c,test_column
      000505 10 F9            [13]  337         djnz    get_column
      000507                        338 correct_ptr:
      000507 11 27 00         [10]  339         ld      de,#SCREEN_WIDTH-1
      00050A ED 5A            [15]  340         adc     hl,de
      00050C 28 03            [12]  341         jr      z,start_from_bottom
      00050E E1               [10]  342         pop     hl
      00050F 18 19            [12]  343         jr      update_pointers
      000511                        344 start_from_bottom:
      000511 E1               [10]  345         pop     hl
      000512 11 08 02         [10]  346         ld      de,#((GAMES_LINES-2)*3+1)*SCREEN_WIDTH
      000515 19               [11]  347         add     hl,de
      000516 18 12            [12]  348         jr      update_pointers
      000518                        349 test_column:
      000518 C1               [10]  350         pop     bc
      000519 11 27 00         [10]  351         ld      de,#SCREEN_WIDTH-1
      00051C ED 5A            [15]  352         adc     hl,de
      00051E 28 03            [12]  353         jr      z,move_one_line_up
      000520 E1               [10]  354         pop     hl
      000521 18 07            [12]  355         jr      update_pointers
      000523                        356 move_one_line_up:
      000523 E1               [10]  357         pop     hl
      000524 11 50 00         [10]  358         ld      de,#2*SCREEN_WIDTH
      000527 A7               [ 4]  359         and     a
      000528 ED 52            [15]  360         sbc     hl,de
      00052A                        361 update_pointers:
      00052A 0B               [ 6]  362         dec     bc
      00052B 7D               [ 4]  363         ld      a,l
      00052C 02               [ 7]  364         ld      (bc),a
      00052D 03               [ 6]  365         inc     bc
      00052E 7C               [ 4]  366         ld      a,h
      00052F 02               [ 7]  367         ld      (bc),a
      000530 03               [ 6]  368         inc     bc
      000531 0A               [ 7]  369         ld      a,(bc)
      000532 6F               [ 4]  370         ld      l,a
      000533 03               [ 6]  371         inc     bc
      000534 0A               [ 7]  372         ld      a,(bc)
      000535 67               [ 4]  373         ld      h,a
      000536 08               [ 4]  374         ex      af,af'
      000537 3D               [ 4]  375         dec     a
      000538 FE 00            [ 7]  376         cp      #ZERO
      00053A 28 02            [12]  377         jr      z,draw_monster
      00053C 18 A6            [12]  378         jr      handle_by_column
      00053E                        379 draw_monster:
      00053E D1               [10]  380         pop     de
      00053F C1               [10]  381         pop     bc
      000540 0B               [ 6]  382         dec     bc
      000541 3E 04            [ 7]  383         ld      a,#MONSTER_WIDTH
      000543                        384 draw_monster_segment:
      000543 08               [ 4]  385         ex      af,af'
      000544 0A               [ 7]  386         ld      a,(bc)
      000545 6F               [ 4]  387         ld      l,a
      000546 03               [ 6]  388         inc     bc
      000547 0A               [ 7]  389         ld      a,(bc)
      000548 67               [ 4]  390         ld      h,a
      000549 03               [ 6]  391         inc     bc
      00054A 1A               [ 7]  392         ld      a,(de)
      00054B 77               [ 7]  393         ld      (hl),a
      00054C 13               [ 6]  394         inc     de
      00054D 1A               [ 7]  395         ld      a,(de)
      00054E D5               [11]  396         push    de
      00054F 11 28 00         [10]  397         ld      de,#SCREEN_WIDTH
      000552 19               [11]  398         add     hl,de
      000553 77               [ 7]  399         ld      (hl),a
      000554 CD 60 05         [17]  400         call    monster_check_crash
      000557 D1               [10]  401         pop     de
      000558 13               [ 6]  402         inc     de
      000559 08               [ 4]  403         ex      af,af'
      00055A 3D               [ 4]  404         dec     a
      00055B FE 00            [ 7]  405         cp      #ZERO
      00055D 20 E4            [12]  406         jr      nz,draw_monster_segment
      00055F C9               [10]  407         ret
      000560                        408 monster_check_crash:
      000560 A7               [ 4]  409         and     a
      000561 ED 52            [15]  410         sbc     hl,de
      000563 EB               [ 4]  411         ex      de,hl
      000564 2A D2 0D         [16]  412         ld      hl,(MAN_HEAD)
      000567 A7               [ 4]  413         and     a
      000568 ED 52            [15]  414         sbc     hl,de
      00056A EB               [ 4]  415         ex      de,hl
      00056B C0               [11]  416         ret     nz
      00056C 11 28 00         [10]  417         ld      de,#SCREEN_WIDTH
      00056F 19               [11]  418         add     hl,de
      000570 23               [ 6]  419         inc     hl
      000571 36 97            [10]  420         ld      (hl),#CHR_MAN_SLEEP
      000573 23               [ 6]  421         inc     hl
      000574 36 C9            [10]  422         ld      (hl),#CHR_MAN_SLEEP_HEAD
      000576 3E 0B            [ 7]  423         ld      a,#DELAY_COUNTER
      000578 32 D5 0D         [13]  424         ld      (FAIL_DELAY),a
      00057B C9               [10]  425         ret
      00057C                        426 animation_lines:
      00057C 3E EE            [ 7]  427         ld      a,#CHR_MOVING_LINE
      00057E 21 B6 0C         [10]  428         ld      hl,#LINE_BUFFER
      000581 77               [ 7]  429         ld      (hl),a
      000582 11 B7 0C         [10]  430         ld      de,#LINE_BUFFER+1
      000585 01 0E 01         [10]  431         ld      bc,#LINE_BUFFER_size-1
      000588 ED B0            [21]  432         ldir
      00058A 3A D0 0D         [13]  433         ld      a,(cnt_fail_trap)
      00058D 11 C6 0D         [10]  434         ld      de,#OFFSET_HOLES
      000590 1B               [ 6]  435         dec     de
      000591                        436 loop_failed_penalty_holes:
      000591 F5               [11]  437         push    af
      000592 13               [ 6]  438         inc     de
      000593 1A               [ 7]  439         ld      a,(de)
      000594 3C               [ 4]  440         inc     a
      000595 12               [ 7]  441         ld      (de),a
      000596 4F               [ 4]  442         ld      c,a
      000597 06 00            [ 7]  443         ld      b,#HI_ZERO
      000599 21 B6 0C         [10]  444         ld      hl,#LINE_BUFFER
      00059C 09               [11]  445         add     hl,bc
      00059D 36 20            [10]  446         ld      (hl),#' '
      00059F 23               [ 6]  447         inc     hl
      0005A0 36 20            [10]  448         ld      (hl),#' '
      0005A2 23               [ 6]  449         inc     hl
      0005A3 36 20            [10]  450         ld      (hl),#' '
      0005A5 F1               [10]  451         pop     af
      0005A6 3D               [ 4]  452         dec     a
      0005A7 20 E8            [12]  453         jr      nz,loop_failed_penalty_holes
      0005A9 3A D1 0D         [13]  454         ld      a,(cnt_fail_jump)
      0005AC 11 CB 0D         [10]  455         ld      de,#OFFSET_HOLES_JUMP_PENALTY
      0005AF 1B               [ 6]  456         dec     de
      0005B0                        457 loop_jump_penalty_holes:
      0005B0 F5               [11]  458         push    af
      0005B1 13               [ 6]  459         inc     de
      0005B2 1A               [ 7]  460         ld      a,(de)
      0005B3 3D               [ 4]  461         dec     a
      0005B4 12               [ 7]  462         ld      (de),a
      0005B5 4F               [ 4]  463         ld      c,a
      0005B6 06 00            [ 7]  464         ld      b,#HI_ZERO
      0005B8 21 B6 0C         [10]  465         ld      hl,#LINE_BUFFER
      0005BB 09               [11]  466         add     hl,bc
      0005BC 36 20            [10]  467         ld      (hl),#' '
      0005BE 23               [ 6]  468         inc     hl
      0005BF 36 20            [10]  469         ld      (hl),#' '
      0005C1 23               [ 6]  470         inc     hl
      0005C2 36 20            [10]  471         ld      (hl),#' '
      0005C4 F1               [10]  472         pop     af
      0005C5 3D               [ 4]  473         dec     a
      0005C6 20 E8            [12]  474         jr      nz,loop_jump_penalty_holes
      0005C8 3E 06            [ 7]  475         ld      a,#GAMES_LINES
      0005CA 21 B6 0C         [10]  476         ld      hl,#LINE_BUFFER
      0005CD 11 50 EC         [10]  477         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+0
      0005D0                        478 print_line:
      0005D0 01 28 00         [10]  479         ld      bc,#SCREEN_WIDTH
      0005D3 E5               [11]  480         push    hl
      0005D4 EB               [ 4]  481         ex      de,hl
      0005D5 09               [11]  482         add     hl,bc
      0005D6 09               [11]  483         add     hl,bc
      0005D7 EB               [ 4]  484         ex      de,hl
      0005D8 E1               [10]  485         pop     hl
      0005D9 ED B0            [21]  486         ldir
      0005DB 3D               [ 4]  487         dec     a
      0005DC 20 F2            [12]  488         jr      nz,print_line
      0005DE 21 70 EF         [10]  489         ld      hl,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+0
      0005E1 11 71 EF         [10]  490         ld      de,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+1
      0005E4 01 27 00         [10]  491         ld      bc,#SCREEN_WIDTH-1
      0005E7 36 C6            [10]  492         ld      (hl),#CHR_WALL
      0005E9 ED B0            [21]  493         ldir
      0005EB C9               [10]  494         ret
      0005EC                        495 animation_delay:
      0005EC 21 50 46         [10]  496         ld      hl,#SLOW_DOWN_13066
      0005EF 11 01 00         [10]  497         ld      de,#1
      0005F2 A7               [ 4]  498         and     a
      0005F3                        499 delay_loop:
      0005F3 2B               [ 6]  500         dec     hl
      0005F4 ED 52            [15]  501         sbc     hl,de
      0005F6 20 FB            [12]  502         jr      nz,delay_loop
      0005F8 C9               [10]  503         ret
      0005F9                        504 action_left:
      0005F9 F5               [11]  505         push    af
      0005FA 2A D2 0D         [16]  506         ld      hl,(MAN_HEAD)
      0005FD 7E               [ 7]  507         ld      a,(hl)
      0005FE 36 20            [10]  508         ld      (hl),#' '
      000600 2B               [ 6]  509         dec     hl
      000601 22 D2 0D         [16]  510         ld      (MAN_HEAD),hl
      000604 77               [ 7]  511         ld      (hl),a
      000605 11 28 00         [10]  512         ld      de,#SCREEN_WIDTH
      000608 19               [11]  513         add     hl,de
      000609 23               [ 6]  514         inc     hl
      00060A 7E               [ 7]  515         ld      a,(hl)
      00060B 36 20            [10]  516         ld      (hl),#' '
      00060D FE 9D            [ 7]  517         cp      #CHR_MAN_WALK
      00060F 28 04            [12]  518         jr      z,transition_left_stay
      000611 FE A1            [ 7]  519         cp      #CHR_MAN_STAY
      000613 28 04            [12]  520         jr      z,transition_left_walk
      000615                        521 transition_left_stay:
      000615 C6 04            [ 7]  522         add     a,#TRANSITION_MAN_WALK_STAY
      000617 18 02            [12]  523         jr      update_left
      000619                        524 transition_left_walk:
      000619 D6 04            [ 7]  525         sub     #TRANSITION_MAN_WALK_STAY
      00061B                        526 update_left:
      00061B 2B               [ 6]  527         dec     hl
      00061C 77               [ 7]  528         ld      (hl),a
      00061D 3E 07            [ 7]  529         ld      a,#GAMES_LINES+1
      00061F 01 4F EC         [10]  530         ld      bc,#BWS+(GAME_START_Y)*SCREEN_WIDTH-1
      000622                        531 loop_left_border_check:
      000622 C5               [11]  532         push    bc
      000623 60               [ 4]  533         ld      h,b
      000624 69               [ 4]  534         ld      l,c
      000625 ED 5B D2 0D      [20]  535         ld      de,(MAN_HEAD)
      000629 A7               [ 4]  536         and     a
      00062A ED 52            [15]  537         sbc     hl,de
      00062C 28 0E            [12]  538         jr      z,correct_left_border
      00062E                        539 left_border_next_adr:
      00062E C1               [10]  540         pop     bc
      00062F 11 78 00         [10]  541         ld      de,#3*SCREEN_WIDTH
      000632 60               [ 4]  542         ld      h,b
      000633 69               [ 4]  543         ld      l,c
      000634 19               [11]  544         add     hl,de
      000635 44               [ 4]  545         ld      b,h
      000636 4D               [ 4]  546         ld      c,l
      000637 3D               [ 4]  547         dec     a
      000638 20 E8            [12]  548         jr      nz,loop_left_border_check
      00063A F1               [10]  549         pop     af
      00063B C9               [10]  550         ret
      00063C                        551 correct_left_border:
      00063C 2A D2 0D         [16]  552         ld      hl,(MAN_HEAD)
      00063F 11 28 00         [10]  553         ld      de,#SCREEN_WIDTH
      000642 36 C6            [10]  554         ld      (hl),#CHR_WALL
      000644 19               [11]  555         add     hl,de
      000645 36 CC            [10]  556         ld      (hl),#CHR_MAN_HEAD
      000647 22 D2 0D         [16]  557         ld      (MAN_HEAD),hl
      00064A 19               [11]  558         add     hl,de
      00064B 36 9D            [10]  559         ld      (hl),#CHR_MAN_WALK
      00064D C3 2E 06         [10]  560         jp      left_border_next_adr
      000650                        561 action_right:
      000650 F5               [11]  562         push    af
      000651 2A D2 0D         [16]  563         ld      hl,(MAN_HEAD)
      000654 7E               [ 7]  564         ld      a,(hl)
      000655 36 20            [10]  565         ld      (hl),#' '
      000657 23               [ 6]  566         inc     hl
      000658 22 D2 0D         [16]  567         ld      (MAN_HEAD),hl
      00065B 77               [ 7]  568         ld      (hl),a
      00065C 11 28 00         [10]  569         ld      de,#SCREEN_WIDTH
      00065F 19               [11]  570         add     hl,de
      000660 2B               [ 6]  571         dec     hl
      000661 7E               [ 7]  572         ld      a,(hl)
      000662 36 20            [10]  573         ld      (hl),#' '
      000664 FE 9D            [ 7]  574         cp      #CHR_MAN_WALK
      000666 28 04            [12]  575         jr      z,transition_stay
      000668 FE A1            [ 7]  576         cp      #CHR_MAN_STAY
      00066A 28 04            [12]  577         jr      z,transition_walk
      00066C                        578 transition_stay:
      00066C C6 04            [ 7]  579         add     a,#TRANSITION_MAN_WALK_STAY
      00066E 18 02            [12]  580         jr      update_right
      000670                        581 transition_walk:
      000670 D6 04            [ 7]  582         sub     #TRANSITION_MAN_WALK_STAY
      000672                        583 update_right:
      000672 23               [ 6]  584         inc     hl
      000673 77               [ 7]  585         ld      (hl),a
      000674 3E 07            [ 7]  586         ld      a,#GAMES_LINES+1
      000676 01 78 EC         [10]  587         ld      bc,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH+0
      000679                        588 loop_right_border_check:
      000679 C5               [11]  589         push    bc
      00067A 60               [ 4]  590         ld      h,b
      00067B 69               [ 4]  591         ld      l,c
      00067C ED 5B D2 0D      [20]  592         ld      de,(MAN_HEAD)
      000680 A7               [ 4]  593         and     a
      000681 ED 52            [15]  594         sbc     hl,de
      000683 28 0E            [12]  595         jr      z,correct_right_border
      000685                        596 right_border_next_adr:
      000685 C1               [10]  597         pop     bc
      000686 11 78 00         [10]  598         ld      de,#3*SCREEN_WIDTH
      000689 60               [ 4]  599         ld      h,b
      00068A 69               [ 4]  600         ld      l,c
      00068B 19               [11]  601         add     hl,de
      00068C 44               [ 4]  602         ld      b,h
      00068D 4D               [ 4]  603         ld      c,l
      00068E 3D               [ 4]  604         dec     a
      00068F 20 E8            [12]  605         jr      nz,loop_right_border_check
      000691 F1               [10]  606         pop     af
      000692 C9               [10]  607         ret
      000693                        608 correct_right_border:
      000693 2A D2 0D         [16]  609         ld      hl,(MAN_HEAD)
      000696 4E               [ 7]  610         ld      c,(hl)
      000697 36 9D            [10]  611         ld      (hl),#CHR_MAN_WALK
      000699 11 28 00         [10]  612         ld      de,#SCREEN_WIDTH
      00069C A7               [ 4]  613         and     a
      00069D ED 52            [15]  614         sbc     hl,de
      00069F 71               [ 7]  615         ld      (hl),c
      0006A0 22 D2 0D         [16]  616         ld      (MAN_HEAD),hl
      0006A3 19               [11]  617         add     hl,de
      0006A4 19               [11]  618         add     hl,de
      0006A5 36 EE            [10]  619         ld      (hl),#CHR_MOVING_LINE
      0006A7 18 DC            [12]  620         jr      right_border_next_adr
      0006A9                        621 action_jump:
      0006A9 2A D2 0D         [16]  622         ld      hl,(MAN_HEAD)
      0006AC 11 28 00         [10]  623         ld      de,#SCREEN_WIDTH
      0006AF A7               [ 4]  624         and     a
      0006B0 ED 52            [15]  625         sbc     hl,de
      0006B2 7E               [ 7]  626         ld      a,(hl)
      0006B3 FE 20            [ 7]  627         cp      #' '
      0006B5 28 0B            [12]  628         jr      z,jump_ok
      0006B7 FE EE            [ 7]  629         cp      #CHR_MOVING_LINE
      0006B9 28 2B            [12]  630         jr      z,jump_fail
      0006BB FE C6            [ 7]  631         cp      #CHR_WALL
      0006BD 28 27            [12]  632         jr      z,jump_fail
      0006BF C3 5C 04         [10]  633         jp      handle_fail_delay
      0006C2                        634 jump_ok:
      0006C2 D9               [ 4]  635         exx
      0006C3 CD C4 07         [17]  636         call    add_10_points
      0006C6 D9               [ 4]  637         exx
      0006C7 19               [11]  638         add     hl,de
      0006C8 36 20            [10]  639         ld      (hl),#' '
      0006CA 19               [11]  640         add     hl,de
      0006CB 36 20            [10]  641         ld      (hl),#' '
      0006CD 1E 78            [ 7]  642         ld      e,#3*SCREEN_WIDTH
      0006CF A7               [ 4]  643         and     a
      0006D0 ED 52            [15]  644         sbc     hl,de
      0006D2 36 9D            [10]  645         ld      (hl),#CHR_MAN_WALK
      0006D4 1E 28            [ 7]  646         ld      e,#SCREEN_WIDTH
      0006D6 A7               [ 4]  647         and     a
      0006D7 ED 52            [15]  648         sbc     hl,de
      0006D9 36 CC            [10]  649         ld      (hl),#CHR_MAN_HEAD
      0006DB 22 D2 0D         [16]  650         ld      (MAN_HEAD),hl
      0006DE 3E 04            [ 7]  651         ld      a,#DELAY_COUNTER_JUMP
      0006E0 32 D4 0D         [13]  652         ld      (JUMP_DELAY),a
      0006E3 C3 5C 04         [10]  653         jp      handle_fail_delay
      0006E6                        654 jump_fail:
      0006E6 19               [11]  655         add     hl,de
      0006E7 2B               [ 6]  656         dec     hl
      0006E8 3E CD            [ 7]  657         ld      a,#CHR_SMOKE
      0006EA 77               [ 7]  658         ld      (hl),a
      0006EB 23               [ 6]  659         inc     hl
      0006EC 23               [ 6]  660         inc     hl
      0006ED 23               [ 6]  661         inc     hl
      0006EE 77               [ 7]  662         ld      (hl),a
      0006EF 2B               [ 6]  663         dec     hl
      0006F0 2B               [ 6]  664         dec     hl
      0006F1 36 20            [10]  665         ld      (hl),#' '
      0006F3 19               [11]  666         add     hl,de
      0006F4 36 97            [10]  667         ld      (hl),#CHR_MAN_SLEEP
      0006F6 23               [ 6]  668         inc     hl
      0006F7 36 C9            [10]  669         ld      (hl),#CHR_MAN_SLEEP_HEAD
      0006F9 3E 0B            [ 7]  670         ld      a,#DELAY_COUNTER
      0006FB 32 D5 0D         [13]  671         ld      (FAIL_DELAY),a
      0006FE 3A D1 0D         [13]  672         ld      a,(cnt_fail_jump)
      000701 FE 05            [ 7]  673         cp      #MAX_FAIL_COUNTER
      000703 CA 5C 04         [10]  674         jp      z,handle_fail_delay
      000706 3C               [ 4]  675         inc     a
      000707 32 D1 0D         [13]  676         ld      (cnt_fail_jump),a
      00070A C3 5C 04         [10]  677         jp      handle_fail_delay
      00070D                        678 check_fall_through:
      00070D 3A D4 0D         [13]  679         ld      a,(JUMP_DELAY)
      000710 FE 01            [ 7]  680         cp      #INITIAL_DELAY_COUNTER
      000712 C0               [11]  681         ret     nz
      000713                        682 check_for_trap:
      000713 2A D2 0D         [16]  683         ld      hl,(MAN_HEAD)
      000716 11 28 00         [10]  684         ld      de,#SCREEN_WIDTH
      000719 19               [11]  685         add     hl,de
      00071A 19               [11]  686         add     hl,de
      00071B 7E               [ 7]  687         ld      a,(hl)
      00071C FE 20            [ 7]  688         cp      #' '
      00071E C0               [11]  689         ret     nz
      00071F 3A D5 0D         [13]  690         ld      a,(FAIL_DELAY)
      000722 FE 01            [ 7]  691         cp      #INITIAL_DELAY_COUNTER
      000724 28 15            [12]  692         jr      z,erase_player_fell_down
      000726 2A D2 0D         [16]  693         ld      hl,(MAN_HEAD)
      000729 3E 20            [ 7]  694         ld      a,#' '
      00072B 2B               [ 6]  695         dec     hl
      00072C 77               [ 7]  696         ld      (hl),a
      00072D 23               [ 6]  697         inc     hl
      00072E 23               [ 6]  698         inc     hl
      00072F 23               [ 6]  699         inc     hl
      000730 77               [ 7]  700         ld      (hl),a
      000731 2B               [ 6]  701         dec     hl
      000732 19               [11]  702         add     hl,de
      000733 77               [ 7]  703         ld      (hl),a
      000734 23               [ 6]  704         inc     hl
      000735 77               [ 7]  705         ld      (hl),a
      000736 2B               [ 6]  706         dec     hl
      000737 2B               [ 6]  707         dec     hl
      000738 77               [ 7]  708         ld      (hl),a
      000739 18 08            [12]  709         jr      player_fell_down
      00073B                        710 erase_player_fell_down:
      00073B 2A D2 0D         [16]  711         ld      hl,(MAN_HEAD)
      00073E 3E 20            [ 7]  712         ld      a,#' '
      000740 77               [ 7]  713         ld      (hl),a
      000741 19               [11]  714         add     hl,de
      000742 77               [ 7]  715         ld      (hl),a
      000743                        716 player_fell_down:
      000743 19               [11]  717         add     hl,de
      000744 19               [11]  718         add     hl,de
      000745 22 D2 0D         [16]  719         ld      (MAN_HEAD),hl
      000748 19               [11]  720         add     hl,de
      000749 36 97            [10]  721         ld      (hl),#CHR_MAN_SLEEP
      00074B 23               [ 6]  722         inc     hl
      00074C 36 C9            [10]  723         ld      (hl),#CHR_MAN_SLEEP_HEAD
      00074E 3E 08            [ 7]  724         ld      a,#DELAY_COUNTER2
      000750 32 D5 0D         [13]  725         ld      (FAIL_DELAY),a
      000753 3A D0 0D         [13]  726         ld      a,(cnt_fail_trap)
      000756 FE 05            [ 7]  727         cp      #MAX_FAIL_COUNTER
      000758 C8               [11]  728         ret     z
      000759 3C               [ 4]  729         inc     a
      00075A 32 D0 0D         [13]  730         ld      (cnt_fail_trap),a
      00075D C9               [10]  731         ret
      00075E                        732 check_level_finished:
      00075E 2A D2 0D         [16]  733         ld      hl,(MAN_HEAD)
      000761 11 6F EC         [10]  734         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+(SCREEN_WIDTH-9)
      000764 A7               [ 4]  735         and     a
      000765 ED 52            [15]  736         sbc     hl,de
      000767 20 39            [12]  737         jr      nz,round_end
      000769 3A D9 0D         [13]  738         ld      a,(LEVEL)
      00076C FE 08            [ 7]  739         cp      #MAX_LEVEL
      00076E 28 01            [12]  740         jr      z,new_level_set
      000770 3C               [ 4]  741         inc     a
      000771                        742 new_level_set:
      000771 32 D9 0D         [13]  743         ld      (LEVEL),a
      000774 21 33 EF         [10]  744         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+(15+ALIGN_MIDDLE)
      000777 22 D2 0D         [16]  745         ld      (MAN_HEAD),hl
      00077A 3E 28            [ 7]  746         ld      a,#SCREEN_WIDTH
      00077C 36 CC            [10]  747         ld      (hl),#CHR_MAN_HEAD
      00077E 85               [ 4]  748         add     a,l
      00077F 6F               [ 4]  749         ld      l,a
      000780 36 A1            [10]  750         ld      (hl),#CHR_MAN_STAY
      000782 21 D0 0D         [10]  751         ld      hl,#cnt_fail_trap
      000785 3E 02            [ 7]  752         ld      a,#INITIAL_FAIL_COUNTER
      000787 77               [ 7]  753         ld      (hl),a
      000788 21 D1 0D         [10]  754         ld      hl,#cnt_fail_jump
      00078B 77               [ 7]  755         ld      (hl),a
      00078C 21 6D EC         [10]  756         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+(SCREEN_WIDTH-11)
      00078F 36 F8            [10]  757         ld      (hl),#CHR_LINE_TOP
      000791 23               [ 6]  758         inc     hl
      000792 36 95            [10]  759         ld      (hl),#CHR_ARROW_RIGHT_TOP
      000794 23               [ 6]  760         inc     hl
      000795 36 20            [10]  761         ld      (hl),#' '
      000797 21 95 EC         [10]  762         ld      hl,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH++(SCREEN_WIDTH-11)
      00079A 36 9E            [10]  763         ld      (hl),#CHR_LINE_BOTTOM
      00079C 23               [ 6]  764         inc     hl
      00079D 36 93            [10]  765         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      00079F 23               [ 6]  766         inc     hl
      0007A0 36 20            [10]  767         ld      (hl),#' '
      0007A2                        768 round_end:
      0007A2 13               [ 6]  769         inc     de
      0007A3 13               [ 6]  770         inc     de
      0007A4 2A D2 0D         [16]  771         ld      hl,(MAN_HEAD)
      0007A7 A7               [ 4]  772         and     a
      0007A8 ED 52            [15]  773         sbc     hl,de
      0007AA 3E 0B            [ 7]  774         ld      a,#DELAY_COUNTER
      0007AC C0               [11]  775         ret     nz
      0007AD 32 D5 0D         [13]  776         ld      (FAIL_DELAY),a
      0007B0 13               [ 6]  777         inc     de
      0007B1 ED 53 D2 0D      [20]  778         ld      (MAN_HEAD),de
      0007B5 3E 20            [ 7]  779         ld      a,#' '
      0007B7 1B               [ 6]  780         dec     de
      0007B8 12               [ 7]  781         ld      (de),a
      0007B9 83               [ 4]  782         add     a,e
      0007BA 5F               [ 4]  783         ld      e,a
      0007BB 12               [ 7]  784         ld      (de),a
      0007BC 6F               [ 4]  785         ld      l,a
      0007BD 19               [11]  786         add     hl,de
      0007BE 36 97            [10]  787         ld      (hl),#CHR_MAN_SLEEP
      0007C0 23               [ 6]  788         inc     hl
      0007C1 36 C9            [10]  789         ld      (hl),#CHR_MAN_SLEEP_HEAD
      0007C3 C9               [10]  790         ret
      0007C4                        791 add_10_points:
      0004C4                        792         SET_CURSOR_DE 0 23+POSDIFF_POINTS
      0007C4 C5               [11]    1         push    bc
      0007C5 11 20 01         [10]    2         ld      de,#(0+1)*256+(23+POSDIFF_POINTS+1)
      0007C8 0E 12            [ 7]    3         ld      c,#UP_SETCU
      0007CA CD 05 00         [17]    4         call    BOS
      0007CD C1               [10]    5         pop     bc
      0007CE 2A D7 0D         [16]  793         ld      hl,(POINTS)
      0007D1 11 0A 00         [10]  794         ld      de,#10
      0007D4 19               [11]  795         add     hl,de
      0007D5 22 D7 0D         [16]  796         ld      (POINTS),hl
      0007D8 CD E1 07         [17]  797         call    print_decimal
      0007DB 3E 20            [ 7]  798         ld      a,#' '
      0007DD 32 24 EC         [13]  799         ld      (BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS+5),a
      0007E0 C9               [10]  800         ret
      0007E1                        801 print_decimal:
      0007E1 E5               [11]  802         push    hl
      0007E2 01 10 27         [10]  803         ld      bc,#10000
      0007E5 CD 0D 08         [17]  804         call    get_decimal_digit
      0007E8 01 E8 03         [10]  805         ld      bc,#1000
      0007EB CD 0D 08         [17]  806         call    get_decimal_digit
      0007EE 01 64 00         [10]  807         ld      bc,#100
      0007F1 CD 0D 08         [17]  808         call    get_decimal_digit
      0007F4 01 0A 00         [10]  809         ld      bc,#10
      0007F7 CD 0D 08         [17]  810         call    get_decimal_digit
      0007FA 01 01 00         [10]  811         ld      bc,#1
      0007FD CD 0D 08         [17]  812         call    get_decimal_digit
      000500                        813         REMOVE_CURSOR;
      000800 2A 2D 00         [16]    1         ld      hl,(CURS)
      000803 36 20            [10]    2         ld      (hl),#' '
      000805 CB 94            [ 8]    3         res     2,h
      000807 CB BE            [15]    4         res     7,(hl)
      000809 CB D4            [ 8]    5         set     2,h
      00080B E1               [10]  814         pop     hl
      00080C C9               [10]  815         ret
      00080D                        816 get_decimal_digit:
      00080D AF               [ 4]  817         xor     a
      00080E                        818 decimal_loop:
      00080E A7               [ 4]  819         and     a
      00080F ED 42            [15]  820         sbc     hl,bc
      000811 3C               [ 4]  821         inc     a
      000812 D2 0E 08         [10]  822         jp      nc,decimal_loop
      000815 3D               [ 4]  823         dec     a
      000816 09               [11]  824         add     hl,bc
      000817 C6 30            [ 7]  825         add     a,#'0'
      000519                        826         OUTCH
      000819 C5               [11]    1         push    bc
      00081A D5               [11]    2         push    de
      00081B 0E 02            [ 7]    3         ld      c,#UP_CONSO
      00081D 5F               [ 4]    4         ld      e,a
      00081E CD 05 00         [17]    5         call    BOS
      000821 D1               [10]    6         pop     de
      000822 C1               [10]    7         pop     bc
      000823 C9               [10]  827         ret
      000824                        828 no_lives::
      000524                        829         PRST7
      000824 CD B1 0E         [17]    1         call    prst7
      000827 0C A0                  830         .db     0x0c,0xa0
      000829 21 7B 0E         [10]  831         ld      hl,#TXT_GAME_OVER
      00082C 11 0D EC         [10]  832         ld      de,#POS_GAME_OVER
      00082F 01 0F 00         [10]  833         ld      bc,#TXT_GAME_OVER_size
      000832 ED B0            [21]  834         ldir
      000834 0E 40            [ 7]  835         ld      c,#3*SCREEN_WIDTH-TXT_GAME_OVER_size-1+POSDIFF_YOUR_SCORE
      000836 7B               [ 4]  836         ld      a,e
      000837 81               [ 4]  837         add     a,c
      000838 5F               [ 4]  838         ld      e,a
      000839 0E 0C            [ 7]  839         ld      c,#TXT_YOUR_SCORE_size
      00083B ED B0            [21]  840         ldir
      00083D 0E 47            [ 7]  841         ld      c,#2*SCREEN_WIDTH-TXT_YOUR_SCORE_size+3
      00083F 7B               [ 4]  842         ld      a,e
      000840 81               [ 4]  843         add     a,c
      000841 5F               [ 4]  844         ld      e,a
      000842 0E 09            [ 7]  845         ld      c,#TXT_HAZARD_size
      000844 ED B0            [21]  846         ldir
      000846 21 E0 ED         [10]  847         ld      hl,#BWS+15*SCREEN_WIDTH+0+(3*POSDIFF_YOUR_SCORE)
      000849 36 A0            [10]  848         ld      (hl),#CHR_MIDDLE_LINE
      00084B 11 E1 ED         [10]  849         ld      de,#BWS+15*SCREEN_WIDTH+1+(3*POSDIFF_YOUR_SCORE)
      00084E 0E 27            [ 7]  850         ld      c,#SCREEN_WIDTH-1
      000850 ED B0            [21]  851         ldir
      000852 2A D7 0D         [16]  852         ld      hl,(POINTS)
      000555                        853         SET_CURSOR_DE (5-POSDIFF_YOUR_SCORE_DY) (21+ALIGN_MIDDLE)
      000855 C5               [11]    1         push    bc
      000856 11 1A 03         [10]    2         ld      de,#((5-POSDIFF_YOUR_SCORE_DY)+1)*256+((21+ALIGN_MIDDLE)+1)
      000859 0E 12            [ 7]    3         ld      c,#UP_SETCU
      00085B CD 05 00         [17]    4         call    BOS
      00085E C1               [10]    5         pop     bc
      00085F CD E1 07         [17]  854         call    print_decimal
      000862 3A D9 0D         [13]  855         ld      a,(LEVEL)
      000865 C6 2F            [ 7]  856         add     a,#'0'-1
      000867 32 BB EC         [13]  857         ld      (BWS+7*SCREEN_WIDTH+23+ALIGN_MIDDLE+3*POSDIFF_YOUR_SCORE),a
      00086A ED 5B 5D 0E      [20]  858         ld      de,(HIGH_SCORE_TABLE01.points)
      00086E A7               [ 4]  859         and     a
      00086F ED 52            [15]  860         sbc     hl,de
      000871 D4 D9 09         [17]  861         call    nc,draw_new_highscore_box
      000574                        862         SET_CURSOR_HL (17-POSDIFF_YOUR_SCORE_DY) (3+ALIGN_MIDDLE)
      000874 D5               [11]    1         push    de
      000875 C5               [11]    2         push    bc
      000876 11 08 0F         [10]    3         ld      de,#((17-POSDIFF_YOUR_SCORE_DY)+1)*256+((3+ALIGN_MIDDLE)+1)
      000879 62               [ 4]    4         ld      h,d
      00087A 6B               [ 4]    5         ld      l,e
      00087B 0E 12            [ 7]    6         ld      c,#UP_SETCU
      00087D CD 05 00         [17]    7         call    BOS
      000880 C1               [10]    8         pop     bc
      000881 D1               [10]    9         pop     de
      000582                        863         PRST7
      000882 CD B1 0E         [17]    1         call    prst7
      000885 20 49 4E 50 55 54 20   864         .ascis ' INPUT YOUR INITIALS: __ '
             59 4F 55 52 20 49 4E
             49 54 49 41 4C 53 3A
             20 5F 5F A0
                                    865         ; remove 2xcursor
      00089E                        866 input::
      00089E 21 C4 EE         [10]  867         ld      hl,#BWS+17*SCREEN_WIDTH+28
      0008A1 36 20            [10]  868         ld      (hl),#' '
      0008A3 21 01 EC         [10]  869         ld      hl,#BWS+0*SCREEN_WIDTH+1
      0008A6 36 20            [10]  870         ld      (hl),#' '
      0008A8 21 4D EE         [10]  871         ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+25+ALIGN_MIDDLE
      0005AB                        872         CURSOR_DISABLE
      0008AB C5               [11]    1         push    bc
      0008AC 0E 1D            [ 7]    2         ld      c,#UP_DCU
      0008AE CD 05 00         [17]    3         call    BOS
      0008B1 C1               [10]    4         pop     bc
      0005B2                        873         INCH
      0008B2 AF               [ 4]    1         xor     a
      0008B3 32 25 00         [13]    2         ld      (KEYBU),a
      0008B6 0E 01            [ 7]    3         ld      c,#UP_CONSI
      0008B8 CD 05 00         [17]    4         call    BOS
      0008BB 77               [ 7]  874         ld      (hl),a
      0008BC 32 79 0E         [13]  875         ld      (INITIALS),a
      0008BF 23               [ 6]  876         inc     hl
      0005C0                        877         INCH
      0008C0 AF               [ 4]    1         xor     a
      0008C1 32 25 00         [13]    2         ld      (KEYBU),a
      0008C4 0E 01            [ 7]    3         ld      c,#UP_CONSI
      0008C6 CD 05 00         [17]    4         call    BOS
      0008C9 77               [ 7]  878         ld      (hl),a
      0008CA 32 7A 0E         [13]  879         ld      (INITIALS+1),a
      0008CD ED 5B D7 0D      [20]  880         ld      de,(POINTS)
      0008D1 06 05            [ 7]  881         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      0008D3 2A 5D 0E         [16]  882         ld      hl,(HIGH_SCORE_TABLE01.points)
      0008D6 A7               [ 4]  883         and     a
      0008D7 ED 52            [15]  884         sbc     hl,de
      0008D9 DA A8 09         [10]  885         jp      c,insert_score
      0008DC 05               [ 4]  886         dec     b
      0008DD 2A 62 0E         [16]  887         ld      hl,(HIGH_SCORE_TABLE02.points)
      0008E0 A7               [ 4]  888         and     a
      0008E1 ED 52            [15]  889         sbc     hl,de
      0008E3 DA A8 09         [10]  890         jp      c,insert_score
      0008E6 05               [ 4]  891         dec     b
      0008E7 2A 67 0E         [16]  892         ld      hl,(HIGH_SCORE_TABLE03.points)
      0008EA A7               [ 4]  893         and     a
      0008EB ED 52            [15]  894         sbc     hl,de
      0008ED DA A8 09         [10]  895         jp      c,insert_score
      0008F0 05               [ 4]  896         dec     b
      0008F1 2A 6C 0E         [16]  897         ld      hl,(HIGH_SCORE_TABLE04.points)
      0008F4 A7               [ 4]  898         and     a
      0008F5 ED 52            [15]  899         sbc     hl,de
      0008F7 DA A8 09         [10]  900         jp      c,insert_score
      0008FA 05               [ 4]  901         dec     b
      0008FB 2A 71 0E         [16]  902         ld      hl,(HIGH_SCORE_TABLE05.points)
      0008FE A7               [ 4]  903         and     a
      0008FF ED 52            [15]  904         sbc     hl,de
      000901 DA A8 09         [10]  905         jp      c,insert_score
      000904                        906 print_highscore_table::
      000904 06 05            [ 7]  907         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      000906 11 5B 0E         [10]  908         ld      de,#HIGH_SCORE_TABLE01
      000909 21 8A EE         [10]  909         ld      hl,#BWS+(20-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+6+ALIGN_MIDDLE
      00090C                        910 print_highscore_entry:
      00090C 3E 36            [ 7]  911         ld      a,#'6'
      00090E 90               [ 4]  912         sub     b
      00090F 77               [ 7]  913         ld      (hl),a
      000910 1A               [ 7]  914         ld      a,(de)
      000911 23               [ 6]  915         inc     hl
      000912 23               [ 6]  916         inc     hl
      000913 23               [ 6]  917         inc     hl
      000914 77               [ 7]  918         ld      (hl),a
      000915 23               [ 6]  919         inc     hl
      000916 13               [ 6]  920         inc     de
      000917 1A               [ 7]  921         ld      a,(de)
      000918 77               [ 7]  922         ld      (hl),a
      000919 3E 2E            [ 7]  923         ld      a,#'.'
      00091B 23               [ 6]  924         inc     hl
      00091C 23               [ 6]  925         inc     hl
      00091D 77               [ 7]  926         ld      (hl),a
      00091E 23               [ 6]  927         inc     hl
      00091F 77               [ 7]  928         ld      (hl),a
      000920 23               [ 6]  929         inc     hl
      000921 77               [ 7]  930         ld      (hl),a
      000922 23               [ 6]  931         inc     hl
      000923 23               [ 6]  932         inc     hl
      000624                        933         SET_CURSOR
      000924 CD C0 0E         [17]    1         call    set_cursor
      000927 13               [ 6]  934         inc     de
      000928 1A               [ 7]  935         ld      a,(de)
      000929 6F               [ 4]  936         ld      l,a
      00092A 13               [ 6]  937         inc     de
      00092B 1A               [ 7]  938         ld      a,(de)
      00092C 67               [ 4]  939         ld      h,a
      00092D 13               [ 6]  940         inc     de
      00092E C5               [11]  941         push    bc
      00092F D5               [11]  942         push    de
      000930 CD E1 07         [17]  943         call    print_decimal
      000933 D1               [10]  944         pop     de
      000934 C1               [10]  945         pop     bc
      000635                        946         REMOVE_CURSOR
      000935 2A 2D 00         [16]    1         ld      hl,(CURS)
      000938 36 20            [10]    2         ld      (hl),#' '
      00093A CB 94            [ 8]    3         res     2,h
      00093C CB BE            [15]    4         res     7,(hl)
      00093E CB D4            [ 8]    5         set     2,h
      000940 23               [ 6]  947         inc     hl
      000941 23               [ 6]  948         inc     hl
      000942 23               [ 6]  949         inc     hl
      000943 36 30            [10]  950         ld      (hl),#'0'
      000945 23               [ 6]  951         inc     hl
      000946 1A               [ 7]  952         ld      a,(de)
      000947 C6 2F            [ 7]  953         add     a,#'0'-1
      000949 77               [ 7]  954         ld      (hl),a
      00094A 13               [ 6]  955         inc     de
      00094B 3E 15            [ 7]  956         ld      a,#SCREEN_WIDTH-19
      00094D 85               [ 4]  957         add     a,l
      00094E 6F               [ 4]  958         ld      l,a
      00094F 3E 00            [ 7]  959         ld      a,#ZERO
      000951 8C               [ 4]  960         adc     a,h
      000952 67               [ 4]  961         ld      h,a
      000953 10 B7            [13]  962         djnz    print_highscore_entry
      000655                        963         SET_CURSOR_HL (29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY) (9+ALIGN_MIDDLE)
      000955 D5               [11]    1         push    de
      000956 C5               [11]    2         push    bc
      000957 11 0E 17         [10]    3         ld      de,#((29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)+1)*256+((9+ALIGN_MIDDLE)+1)
      00095A 62               [ 4]    4         ld      h,d
      00095B 6B               [ 4]    5         ld      l,e
      00095C 0E 12            [ 7]    6         ld      c,#UP_SETCU
      00095E CD 05 00         [17]    7         call    BOS
      000961 C1               [10]    8         pop     bc
      000962 D1               [10]    9         pop     de
      000663                        964         PRST7
      000963 CD B1 0E         [17]    1         call    prst7
      000966 4E 45 57 20 47 41 4D   965         .ascii  'NEW GAME ? Y/N'
             45 20 3F 20 59 2F 4E
      000974 A0                     966         .db     0xa0
      000975 21 8C EF         [10]  967         ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000978 36 20            [10]  968         ld      (hl),#' '
      00067A                        969         CURSOR_DISABLE
      00097A C5               [11]    1         push    bc
      00097B 0E 1D            [ 7]    2         ld      c,#UP_DCU
      00097D CD 05 00         [17]    3         call    BOS
      000980 C1               [10]    4         pop     bc
      000981                        970 m_070a:
      000981                        971 ask_exit_game:
      000681                        972         INCH
      000981 AF               [ 4]    1         xor     a
      000982 32 25 00         [13]    2         ld      (KEYBU),a
      000985 0E 01            [ 7]    3         ld      c,#UP_CONSI
      000987 CD 05 00         [17]    4         call    BOS
      00098A FE 59            [ 7]  973         cp      #'Y'
      00098C CA 9D 03         [10]  974         jp      z,new_game
      00098F FE 4E            [ 7]  975         cp      #'N'
      000991 20 EE            [12]  976         jr      nz,ask_exit_game
      000993                        977 exit_game:
      000693                        978         PRST7
      000993 CD B1 0E         [17]    1         call    prst7
      000996 0C                     979         .db     0x0c
      000997 4A 75 6D 70 69 6E 67   980         .ascii  'Jumping Jack'
             20 4A 61 63 6B
      0009A3 0D 8D                  981         .db     0x0d,0x8d
      0006A5                        982         END_PROGRAM
      0009A5 C3 03 F0         [10]    1         jp      WBOOT
      0009A8                        983 insert_score:
      0009A8 D5               [11]  984         push    de
      0009A9 11 74 0E         [10]  985         ld      de,#HIGH_SCORE_TABLE_TMP
      0009AC 21 6F 0E         [10]  986         ld      hl,#HIGH_SCORE_TABLE05
      0009AF                        987 move_table_entry:
      0009AF C5               [11]  988         push    bc
      0009B0 01 05 00         [10]  989         ld      bc,#HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05
      0009B3 ED B0            [21]  990         ldir
      0009B5 EB               [ 4]  991         ex      de,hl
      0009B6 0E 0A            [ 7]  992         ld      c,#2*(HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05)
      0009B8 A7               [ 4]  993         and     a
      0009B9 ED 42            [15]  994         sbc     hl,bc
      0009BB EB               [ 4]  995         ex      de,hl
      0009BC A7               [ 4]  996         and     a
      0009BD ED 42            [15]  997         sbc     hl,bc
      0009BF C1               [10]  998         pop     bc
      0009C0 10 ED            [13]  999         djnz    move_table_entry
      0009C2 3A 79 0E         [13] 1000         ld      a,(INITIALS)
      0009C5 12               [ 7] 1001         ld      (de),a
      0009C6 13               [ 6] 1002         inc     de
      0009C7 3A 7A 0E         [13] 1003         ld      a,(INITIALS+1)
      0009CA 12               [ 7] 1004         ld      (de),a
      0009CB EB               [ 4] 1005         ex      de,hl
      0009CC D1               [10] 1006         pop     de
      0009CD 23               [ 6] 1007         inc     hl
      0009CE 73               [ 7] 1008         ld      (hl),e
      0009CF 23               [ 6] 1009         inc     hl
      0009D0 72               [ 7] 1010         ld      (hl),d
      0009D1 23               [ 6] 1011         inc     hl
      0009D2 3A D9 0D         [13] 1012         ld      a,(LEVEL)
      0009D5 77               [ 7] 1013         ld      (hl),a
      0009D6 C3 04 09         [10] 1014         jp      print_highscore_table
      0009D9                       1015 draw_new_highscore_box:
      0009D9 21 FB EC         [10] 1016         ld      hl,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      0009DC 36 2A            [10] 1017         ld      (hl),#'*'
      0009DE 11 FC EC         [10] 1018         ld      de,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+8+ALIGN_MIDDLE
      0009E1 01 11 00         [10] 1019         ld      bc,#TXT_NEW_HIGH_SCORE_size-1
      0009E4 ED B0            [21] 1020         ldir
      0009E6 0E 8F            [ 7] 1021         ld      c,#4*SCREEN_WIDTH-TXT_NEW_HIGH_SCORE_size+1
      0009E8 09               [11] 1022         add     hl,bc
      0009E9 EB               [ 4] 1023         ex      de,hl
      0009EA 09               [11] 1024         add     hl,bc
      0009EB EB               [ 4] 1025         ex      de,hl
      0009EC 0E 11            [ 7] 1026         ld      c,#TXT_NEW_HIGH_SCORE_size-1
      0009EE 36 2A            [10] 1027         ld      (hl),#'*'
      0009F0 ED B0            [21] 1028         ldir
      0009F2 11 4B ED         [10] 1029         ld      de,#BWS+(11-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      0009F5 21 9F 0E         [10] 1030         ld      hl,#TXT_NEW_HIGH_SCORE
      0009F8 0E 12            [ 7] 1031         ld      c,#TXT_NEW_HIGH_SCORE_size
      0009FA ED B0            [21] 1032         ldir
      0009FC 1E 23            [ 7] 1033         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      0009FE 3E 2A            [ 7] 1034         ld      a,#'*'
      000A00 12               [ 7] 1035         ld      (de),a
      000A01 1E 34            [ 7] 1036         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000A03 12               [ 7] 1037         ld      (de),a
      000A04 1E 73            [ 7] 1038         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      000A06 12               [ 7] 1039         ld      (de),a
      000A07 1E 84            [ 7] 1040         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000A09 12               [ 7] 1041         ld      (de),a
      000A0A C9               [10] 1042         ret
      000A0B                       1043 TOP_IMAGE:
                                   1044         ; line 1
      00070B                       1045         SCREEN_POS
      000A0B 20 20 20 20              1         .ascii '    '
      000A0F AE 9E 9E 9E 9E 9E 9E  1046         .db     0xae,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e ;........
             9E
      000A17 9E 9E AD 20 20 20 20  1047         .db     0x9e,0x9e,0xad,0x20,0x20,0x20,0x20,0x20 ;..-     
             20
      000A1F 20 20 20 20 20 20 20  1048         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000A27 20 20 20 20 20 20 20  1049         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00072F                       1050         SCREEN_POS
      000A2F 20 20 20 20              1         .ascii '    '
                                   1051         
                                   1052         ; line 2
      000733                       1053         SCREEN_POS
      000A33 20 20 20 20              1         .ascii '    '
      000A37 9F B9 B6 B3 B2 B6 B8  1054         .db     0x9f,0xb9,0xb6,0xb3,0xb2,0xb6,0xb8,0x20 ;.963268 
             20
      000A3F BD B0 C0 20 20 20 20  1055         .db     0xbd,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;=0@     
             20
      000A47 20 20 20 20 20 20 20  1056         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      000A4F 20 20 20 20 20 20 20  1057         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000757                       1058         SCREEN_POS
      000A57 20 20 20 20              1         .ascii '    '
                                   1059 
                                   1060         ; line 3
      00075B                       1061         SCREEN_POS
      000A5B 20 20 20 20              1         .ascii '    '
      000A5F 9F B8 B7 20 B5 20 20  1062         .db     0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
             20
      000A67 B5 20 C0 20 20 20 20  1063         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      000A6F 20 20 20 20 20 20 20  1064         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      000A77 20 20 20 20 B7 B7 20  1065         .db     0x20,0x20,0x20,0x20,0xb7,0xb7,0x20,0x20 ;    77  
             20
      00077F                       1066         SCREEN_POS
      000A7F 20 20 20 20              1         .ascii '    '
                                   1067 
                                   1068         ; line 4
      000783                       1069         SCREEN_POS
      000A83 20 20 20 20              1         .ascii '    '
      000A87 9F B3 20 B4 B5 20 B2  1070         .db     0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
             20
      000A8F B5 20 C0 20 20 20 20  1071         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      000A97 20 20 20 20 20 20 20  1072         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000A9F B6 B7 20 B9 B2 B2 B8  1073         .db     0xb6,0xb7,0x20,0xb9,0xb2,0xb2,0xb8,0x20 ;67 9228 
             20
      0007A7                       1074         SCREEN_POS
      000AA7 20 20 20 20              1         .ascii '    '
                                   1075 
                                   1076         ; line 5
      0007AB                       1077         SCREEN_POS
      000AAB 20 20 20 20              1         .ascii '    '
      000AAF 9F B1 B6 20 20 B6 B0  1078         .db     0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
             20
      000AB7 B6 B0 C0 20 20 20 20  1079         .db     0xb6,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;60@     
             20
      000ABF 20 20 B2 B3 20 20 20  1080         .db     0x20,0x20,0xb2,0xb3,0x20,0x20,0x20,0x20 ;  23    
             20
      000AC7 20 BA A0 B4 B4 A0 B5  1081         .db     0x20,0xba,0xa0,0xb4,0xb4,0xa0,0xb5,0x20 ; : 44 5 
             20
      0007CF                       1082         SCREEN_POS
      000ACF 20 20 20 20              1         .ascii '    '
                                   1083 
                                   1084         ; line 6
      0007D3                       1085         SCREEN_POS
      000AD3 20 20 20 20              1         .ascii '    '
      000AD7 9F 70 72 65 73 65 6E  1086         .db     0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
             74
      000ADF 73 3A C0 20 20 20 20  1087         .db     0x73,0x3a,0xc0,0x20,0x20,0x20,0x20,0x20 ;s:@     
             20
      000AE7 20 B2 B0 B1 B3 20 20  1088         .db     0x20,0xb2,0xb0,0xb1,0xb3,0x20,0x20,0xb7 ; 2013  7
             B7
      000AEF B6 B1 B3 B8 B1 B1 B9  1089         .db     0xb6,0xb1,0xb3,0xb8,0xb1,0xb1,0xb9,0x20 ;6138119 
             20
      0007F7                       1090         SCREEN_POS
      000AF7 20 20 20 20              1         .ascii '    '
                                   1091 
                                   1092         ; line 7
      0007FB                       1093         SCREEN_POS
      000AFB 20 20 20 20              1         .ascii '    '
      000AFF AB F8 F8 F8 F8 F8 F8  1094         .db     0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
             F8
      000B07 F8 F8 AC 20 20 20 20  1095         .db     0xf8,0xf8,0xac,0x20,0x20,0x20,0x20,0x20 ;xx,     
             20
      000B0F 20 B0 20 20 B5 B7 B6  1096         .db     0x20,0xb0,0x20,0x20,0xb5,0xb7,0xb6,0x20 ; 0  576 
             20
      000B17 20 20 B1 B3 B6 BC 20  1097         .db     0x20,0x20,0xb1,0xb3,0xb6,0xbc,0x20,0x20 ;  136<  
             20
      00081F                       1098         SCREEN_POS
      000B1F 20 20 20 20              1         .ascii '    '
                                   1099 
                                   1100         ; line 8
      000823                       1101         SCREEN_POS
      000B23 20 20 20 20              1         .ascii '    '
      000B27 20 20 20 20 20 20 20  1102         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B2F 20 20 20 20 20 20 20  1103         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B37 B1 B6 B6 B6 B6 20 20  1104         .db     0xb1,0xb6,0xb6,0xb6,0xb6,0x20,0x20,0x20 ;16666   
             20
      000B3F 20 20 20 B1 B9 20 20  1105         .db     0x20,0x20,0x20,0xb1,0xb9,0x20,0x20,0x20 ;   19   
             20
      000847                       1106          SCREEN_POS
      000B47 20 20 20 20              1         .ascii '    '
                                   1107 
                                   1108         ; line 9
      00084B                       1109         Z1013_LINE
                                   1110 
                                   1111         ; line 10
      00084B                       1112         Z1013_LINE
                                   1113 
                                   1114         ; line 11
      00084B                       1115         SCREEN_POS
      000B4B 20 20 20 20              1         .ascii '    '
      000B4F 20 20 20 20 20 20 20  1116         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B57 20 20 20 20 20 20 20  1117         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B5F 20 20 20 20 20 20 20  1118         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B67 20 20 20 20 20 20 20  1119         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00086F                       1120          SCREEN_POS
      000B6F 20 20 20 20              1         .ascii '    '
                                   1121 
                                   1122         ; line 12
      000873                       1123         SCREEN_POS
      000B73 20 20 20 20              1         .ascii '    '
      000B77 20 20 20 B4 20 20 20  1124         .db     0x20,0x20,0x20,0xb4,0x20,0x20,0x20,0x20 ;   4    
             20
      000B7F 20 20 20 20 B0 20 20  1125         .db     0x20,0x20,0x20,0x20,0xb0,0x20,0x20,0x20 ;    0   
             20
      000B87 20 20 20 20 20 20 B4  1126         .db     0x20,0x20,0x20,0x20,0x20,0x20,0xb4,0x20 ;      4 
             20
      000B8F 20 20 20 20 B4 B2 20  1127         .db     0x20,0x20,0x20,0x20,0xb4,0xb2,0x20,0x20 ;    42  
             20
      000897                       1128          SCREEN_POS
      000B97 20 20 20 20              1         .ascii '    '
                                   1129 
                                   1130         ; line 13
      00089B                       1131         SCREEN_POS
      000B9B 20 20 20 20              1         .ascii '    '
      000B9F 20 20 20 B4 B4 B5 B5  1132         .db     0x20,0x20,0x20,0xb4,0xb4,0xb5,0xb5,0xbd ;   4455=
             BD
      000BA7 BD B5 B6 B3 B4 BC BD  1133         .db     0xbd,0xb5,0xb6,0xb3,0xb4,0xbc,0xbd,0xb2 ;=5634<=2
             B2
      000BAF B6 B3 20 20 20 20 B4  1134         .db     0xb6,0xb3,0x20,0x20,0x20,0x20,0xb4,0xb1 ;63    41
             B1
      000BB7 B8 B2 B6 B3 BB B0 20  1135         .db     0xb8,0xb2,0xb6,0xb3,0xbb,0xb0,0x20,0x20 ;8263;0  
             20
      0008BF                       1136          SCREEN_POS
      000BBF 20 20 20 20              1         .ascii '    '
                                   1137 
                                   1138         ; line 14
      0008C3                       1139         SCREEN_POS
      000BC3 20 20 20 20              1         .ascii '    '
      000BC7 20 B3 20 B4 B4 B5 B5  1140         .db     0x20,0xb3,0x20,0xb4,0xb4,0xb5,0xb5,0xb5 ; 3 44555
             B5
      000BCF B5 B5 B7 B0 B4 B4 B5  1141         .db     0xb5,0xb5,0xb7,0xb0,0xb4,0xb4,0xb5,0xb1 ;55704451
             B1
      000BD7 B7 B4 20 20 B3 20 B4  1142         .db     0xb7,0xb4,0x20,0x20,0xb3,0x20,0xb4,0xb9 ;74  3 49
             B9
      000BDF BD B5 20 B3 B4 B8 20  1143         .db     0xbd,0xb5,0x20,0xb3,0xb4,0xb8,0x20,0x20 ;=5 348  
             20
      0008E7                       1144          SCREEN_POS
      000BE7 20 20 20 20              1         .ascii '    '
                                   1145 
                                   1146         ; line 15
      0008EB                       1147         SCREEN_POS
      000BEB 20 20 20 20              1         .ascii '    '
      000BEF 20 B8 B7 B0 B1 B0 B1  1148         .db     0x20,0xb8,0xb7,0xb0,0xb1,0xb0,0xb1,0xb1 ; 8701011
             B1
      000BF7 B1 B5 20 20 B0 B0 B1  1149         .db     0xb1,0xb5,0x20,0x20,0xb0,0xb0,0xb1,0xb1 ;15  0011
             B1
      000BFF B7 B0 20 20 B8 B7 B0  1150         .db     0xb7,0xb0,0x20,0x20,0xb8,0xb7,0xb0,0xb1 ;70  8701
             B1
      000C07 B6 20 B6 20 B0 20 B0  1151         .db     0xb6,0x20,0xb6,0x20,0xb0,0x20,0xb0,0x20 ;6 6 0 0 
             20
      00090F                       1152          SCREEN_POS
      000C0F 20 20 20 20              1         .ascii '    '
                                   1153 
                                   1154         ; line 16
      000913                       1155         SCREEN_POS
      000C13 20 20 20 20              1         .ascii '    '
      000C17 20 20 20 20 20 20 20  1156         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C1F 20 20 20 20 20 20 20  1157         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C27 20 20 20 20 20 20 20  1158         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C2F 20 20 20 20 20 20 20  1159         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000937                       1160         SCREEN_POS
      000C37 20 20 20 20              1         .ascii '    '
                                   1161 
      000C3B                       1162 HINT_RIGHT:
      000C3B 2D 3E 20 2E 2E 2E 20  1163         .db     0x2d,0x3e,0x20,0x2e,0x2e,0x2e,0x20,0x52 ;-> ... R
             52
      000C43 69 67 68 74           1164         .db     0x69,0x67,0x68,0x74                     ;ight
      000C47                       1165 HINT_LEFT:
      000C47 3C 2D 20 2E 2E 2E 2E  1166         .db     0x3c,0x2d,0x20,0x2e,0x2e,0x2e,0x2e,0x20 ;<- .... 
             20
      000C4F 4C 65 66 74           1167         .db     0x4c,0x65,0x66,0x74                     ;Left
      000C53                       1168 HINT_JUMP:
      000C53 53 50 20 2E 2E 2E 2E  1169         .ascii  'SP .... Jump'
             20 4A 75 6D 70
      000C5F                       1170 HINT_PLAY:
      000C5F 50 20 2E 2E 2E 2E 2E  1171         .ascii  'P ..... Play'
             20 50 6C 61 79
      000C6B                       1172 HINT_EXIT:
      000C6B 45 20 2E 2E 2E 2E 2E  1173         .ascii  'E ..... Exit'
             20 45 78 69 74
      000C77                       1174 HINT_COPYRIGHT:
      000C77 43 20 31 39 38 36 20  1175         .ascii  'C 1986 Software Center Ilmenau'
             53 6F 66 74 77 61 72
             65 20 43 65 6E 74 65
             72 20 49 6C 6D 65 6E
             61 75
      000C95                       1176 HINT_NAME:
      000C95 47 2E 46 69 73 63 68  1177         .ascii  'G.Fischer & CO'
             65 72 20 26 20 43 4F
      000CA3                       1178 HINT_YEAR:
      000CA3 20 20 32 30 32 30 20  1179         .ascii  '  2020 Version'
             56 65 72 73 69 6F 6E
      000CB1                       1180 VERSION_INFO:
      000CB1 20 31 2E 31 20        1181         .db     0x20,0x31,0x2e,0x31,0x20                ; 1.1 
      000CB6                       1182 LINE_BUFFER:
      000CB6 EE EE EE EE EE EE EE  1183         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CBE EE EE EE EE EE EE EE  1184         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CC6 EE EE EE EE EE EE EE  1185         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CCE EE EE EE EE EE EE EE  1186         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CD6 EE EE EE EE EE EE EE  1187         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CDE EE EE EE EE EE EE EE  1188         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CE6 EE EE EE EE EE EE EE  1189         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CEE EE EE EE EE EE EE EE  1190         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CF6 20 20 20 EE EE EE EE  1191         .db     0x20,0x20,0x20,0xee,0xee,0xee,0xee,0xee ;   nnnnn
             EE
      000CFE EE EE EE EE EE EE EE  1192         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D06 EE EE EE EE EE 20 20  1193         .db     0xee,0xee,0xee,0xee,0xee,0x20,0x20,0x20 ;nnnnn   
             20
      000D0E 20 20 EE EE EE EE EE  1194         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000D16 EE EE EE EE EE EE EE  1195         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D1E EE 20 20 20 EE EE EE  1196         .db     0xee,0x20,0x20,0x20,0xee,0xee,0xee,0xee ;n   nnnn
             EE
      000D26 EE EE EE EE EE EE EE  1197         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D2E EE EE EE 20 20 20 EE  1198         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D36 EE EE EE EE EE EE EE  1199         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D3E EE EE EE EE 20 20 20  1200         .db     0xee,0xee,0xee,0xee,0x20,0x20,0x20,0xee ;nnnn   n
             EE
      000D46 EE EE EE EE EE EE EE  1201         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0x20 ;nnnnnnn 
             20
      000D4E 20 20 EE EE EE EE EE  1202         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000D56 EE EE EE 20 20 20 EE  1203         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D5E EE EE EE EE EE EE EE  1204         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D66 EE EE EE EE EE EE EE  1205         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D6E EE EE EE EE EE EE EE  1206         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D76 EE EE EE 20 20 20 EE  1207         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D7E EE EE EE EE EE EE EE  1208         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D86 EE EE EE EE EE EE EE  1209         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D8E EE EE EE EE EE EE 20  1210         .db     0xee,0xee,0xee,0xee,0xee,0xee,0x20,0x20 ;nnnnnn  
             20
      000D96 20 EE EE EE EE EE EE  1211         .db     0x20,0xee,0xee,0xee,0xee,0xee,0xee,0xee ; nnnnnnn
             EE
      000D9E EE EE EE EE EE EE EE  1212         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DA6 EE EE EE EE EE EE EE  1213         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DAE EE EE EE EE EE EE EE  1214         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DB6 EE EE EE EE EE EE EE  1215         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DBE EE EE EE EE EE EE EE  1216         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee      ;nnnnnnn
                                   1217 ; unchecked data source
      000DC5 EE                    1218         .db     0xee                                    ;n
      000DC6                       1219 OFFSET_HOLES:
      000DC6 58 7C 41 98 56        1220         .db     0x58,0x7c,0x41,0x98,0x56                ;X|A.V
      000DCB                       1221 OFFSET_HOLES_JUMP_PENALTY:
      000DCB 8B A2 68 C2 DD        1222         .db     0x8b,0xa2,0x68,0xc2,0xdd                ;."hB]
      000DD0                       1223 cnt_fail_trap:
      000DD0 05                    1224         .db     5
      000DD1                       1225 cnt_fail_jump:
      000DD1 05                    1226         .db     5
      000DD2                       1227 MAN_HEAD:
      000DD2 32 EF                 1228         .dw     BWS+(GAME_START_Y+(8-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      000DD4                       1229 JUMP_DELAY:
      000DD4 01                    1230         .db     1
      000DD5                       1231 FAIL_DELAY:
      000DD5 01                    1232         .db     1
      000DD6                       1233 LIVES:
      000DD6 06                    1234         .db     6
      000DD7                       1235 POINTS:
      000DD7 00 00                 1236         .dw     0
      000DD9                       1237 LEVEL:
      000DD9 01                    1238         .db     1
      000DDA                       1239 counter:
      000DDA 01                    1240         .db     1
      000DDB                       1241 TXT_JUMP:
      000DDB 2A 20 4A 55 4D 50 49  1242         .ascii  '* JUMPING JACK *'
             4E 47 20 4A 41 43 4B
             20 2A
      000DEB                       1243 MONSTER_PTR:
      000DEB DF ED                 1244         .dw     BWS+(GAME_START_Y+3*3+1)*SCREEN_WIDTH-1
      000DED 30 EE                 1245         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+0
      000DEF 31 EE                 1246         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000DF1 32 EE                 1247         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
                                   1248 
      000DF3 D5 EC                 1249         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
      000DF5 D6 EC                 1250         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+14
      000DF7 D7 EC                 1251         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+15
      000DF9 D8 EC                 1252         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+16
                                   1253 
      000DFB 31 EE                 1254         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000DFD 32 EE                 1255         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
      000DFF 33 EE                 1256         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+3
      000E01 34 EE                 1257         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+4
                                   1258 
      000E03 C1 EE                 1259         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+25
      000E05 C2 EE                 1260         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+26
      000E07 C3 EE                 1261         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+27
      000E09 C4 EE                 1262         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+28
                                   1263 
      000E0B D2 EC                 1264         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+10
      000E0D D3 EC                 1265         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+11
      000E0F D4 EC                 1266         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+12
      000E11 D5 EC                 1267         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
                                   1268 
      000E13 B3 EE                 1269         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+11
      000E15 B4 EE                 1270         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+12
      000E17 B5 EE                 1271         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+13
      000E19 B6 EE                 1272         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14
                                   1273 
      000E1B BD EE                 1274         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+21
      000E1D BE EE                 1275         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+22
      000E1F BF EE                 1276         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+23
      000E21 C0 EE                 1277         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+24
      000E23                       1278 MONSTER_IMG:
      000E23 94 90 8B 90 8B 91 97  1279         .db     0x94,0x90,0x8b,0x90,0x8b,0x91,0x97,0x91 ;........
             91
      000E2B 19 B5 20 BE 20 BF 20  1280         .db     0x19,0xb5,0x20,0xbe,0x20,0xbf,0x20,0xae ;.5 > ? .
             AE
      000E33 92 96 A0 A0 A0 A0 88  1281         .db     0x92,0x96,0xa0,0xa0,0xa0,0xa0,0x88,0xc1 ;..    .A
             C1
      000E3B 20 95 20 B7 1E FF 20  1282         .db     0x20,0x95,0x20,0xb7,0x1e,0xff,0x20,0x92 ; . 7.. .
             92
      000E43 17 8C F9 8C 1D 1F FC  1283         .db     0x17,0x8c,0xf9,0x8c,0x1d,0x1f,0xfc,0x8c ;..y...|.
             8C
      000E4B 92 96 83 82 95 93 20  1284         .db     0x92,0x96,0x83,0x82,0x95,0x93,0x20,0x20 ;......  
             20
      000E53 20 20 20 20 20 20 20  1285         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000E5B                       1286 HIGH_SCORE_TABLE01:
      000E5B 5F 5F                 1287         .ascii '__'
      000E5D                       1288 HIGH_SCORE_TABLE01.points:
      000E5D 00 00                 1289         .dw     0
      000E5F                       1290 HIGH_SCORE_TABLE01.level:
      000E5F 01                    1291         .db     1
      000E60                       1292 HIGH_SCORE_TABLE02:
      000E60 5F 5F                 1293         .ascii '__'
      000E62                       1294 HIGH_SCORE_TABLE02.points:
      000E62 00 00                 1295         .dw     0
      000E64                       1296 HIGH_SCORE_TABLE02.level:
      000E64 01                    1297         .db     1
      000E65                       1298 HIGH_SCORE_TABLE03:
      000E65 5F 5F                 1299         .ascii '__'
      000E67                       1300 HIGH_SCORE_TABLE03.points:
      000E67 00 00                 1301         .dw     0
      000E69                       1302 HIGH_SCORE_TABLE03.level:
      000E69 01                    1303         .db     1
      000E6A                       1304 HIGH_SCORE_TABLE04:
      000E6A 5F 5F                 1305         .ascii '__'
      000E6C                       1306 HIGH_SCORE_TABLE04.points:
      000E6C 00 00                 1307         .dw     0
      000E6E                       1308 HIGH_SCORE_TABLE04.level:
      000E6E 01                    1309         .db     1
      000E6F                       1310 HIGH_SCORE_TABLE05:
      000E6F 5F 5F                 1311         .ascii '__'
      000E71                       1312 HIGH_SCORE_TABLE05.points:
      000E71 00 00                 1313         .dw     0
      000E73                       1314 HIGH_SCORE_TABLE05.level:
      000E73 01                    1315         .db     1
      000E74                       1316 HIGH_SCORE_TABLE_TMP:
      000E74 5F 5F                 1317         .ascii '__'
      000E76                       1318 HIGH_SCORE_TABLE_TMP.points:
      000E76 00 00                 1319         .dw     0
      000E78                       1320 HIGH_SCORE_TABLE_TMP.level:
      000E78 01                    1321         .db     1
      000E79                       1322 INITIALS:
      000E79 5F 5F                 1323         .ascii '__'
      000E7B                       1324 TXT_GAME_OVER:
      000E7B 2A 2A 20 47 41 4D 45  1325         .ascii  '** GAME OVER **'
             20 4F 56 45 52 20 2A
             2A
      000E8A                       1326 TXT_YOUR_SCORE:
      000E8A 59 4F 55 52 20 53 43  1327         .ascii  'YOUR SCORE :'
             4F 52 45 20 3A
      000E96                       1328 TXT_HAZARD:
      000E96 48 41 5A 41 52 44 53  1329         .ascii  'HAZARDS :'
             20 3A
      000E9F                       1330 TXT_NEW_HIGH_SCORE:
      000E9F 2A 20 4E 45 57 20 48  1331         .ascii  '* NEW HIGH SCORE *'
             49 47 48 20 53 43 4F
             52 45 20 2A
                                   1332 ; end of source
                                   1333 ;
                                   1334 ; mark the end of ROM-image to calculate size for Z80/KCC header
                                   1335         .area  _DATA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 1.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.                                                    =  002710 GL
    .__.ABS.                                                    =  000000 G
    .__.CPU.                                                    =  000000 GL
    .__.H$L.                                                    =  000000 GL
    ALIGN_MIDDLE                                                =  000004 G
    BOS                                                         =  000005 G
    BWS                                                         =  00EC00 G
    CAPITALIZE                                                  =  000020 G
    CHR_ARROW_RIGHT_BOTTOM                                      =  000093 G
    CHR_ARROW_RIGHT_TOP                                         =  000095 G
    CHR_LINE_BOTTOM                                             =  00009E G
    CHR_LINE_TOP                                                =  0000F8 G
    CHR_MAN_HEAD                                                =  0000CC G
    CHR_MAN_SLEEP                                               =  000097 G
    CHR_MAN_SLEEP_HEAD                                          =  0000C9 G
    CHR_MAN_STAY                                                =  0000A1 G
    CHR_MAN_WALK                                                =  00009D G
    CHR_MIDDLE_LINE                                             =  0000A0 G
    CHR_MOVING_LINE                                             =  0000EE G
    CHR_SMOKE                                                   =  0000CD G
    CHR_WALL                                                    =  0000C6 G
    CONIN                                                       =  00F009 G
    CONST                                                       =  00F006 G
    COOUT                                                       =  00F00C G
    COUNT                                                       =  000023 G
    CURS                                                        =  00002D G
    DELAY_COUNTER                                               =  00000B G
    DELAY_COUNTER2                                              =  000008 G
    DELAY_COUNTER_JUMP                                          =  000004 G
  0 FAIL_DELAY                                                     000AD5 GR
    GAMES_LINES                                                 =  000006 G
    GAME_START_Y                                                =  000002 G
  0 HIGH_SCORE_TABLE01                                             000B5B GR
  0 HIGH_SCORE_TABLE01.level                                       000B5F GR
  0 HIGH_SCORE_TABLE01.points                                      000B5D GR
    HIGH_SCORE_TABLE01_size                                     =  000002 G
  0 HIGH_SCORE_TABLE02                                             000B60 GR
  0 HIGH_SCORE_TABLE02.level                                       000B64 GR
  0 HIGH_SCORE_TABLE02.points                                      000B62 GR
    HIGH_SCORE_TABLE02_size                                     =  000002 G
  0 HIGH_SCORE_TABLE03                                             000B65 GR
  0 HIGH_SCORE_TABLE03.level                                       000B69 GR
  0 HIGH_SCORE_TABLE03.points                                      000B67 GR
    HIGH_SCORE_TABLE03_size                                     =  000002 G
  0 HIGH_SCORE_TABLE04                                             000B6A GR
  0 HIGH_SCORE_TABLE04.level                                       000B6E GR
  0 HIGH_SCORE_TABLE04.points                                      000B6C GR
    HIGH_SCORE_TABLE04_size                                     =  000002 G
  0 HIGH_SCORE_TABLE05                                             000B6F GR
  0 HIGH_SCORE_TABLE05.level                                       000B73 GR
  0 HIGH_SCORE_TABLE05.points                                      000B71 GR
    HIGH_SCORE_TABLE05_size                                     =  000002 G
  0 HIGH_SCORE_TABLE_TMP                                           000B74 GR
  0 HIGH_SCORE_TABLE_TMP.level                                     000B78 GR
  0 HIGH_SCORE_TABLE_TMP.points                                    000B76 GR
    HIGH_SCORE_TABLE_TMP_size                                   =  000002 G
  0 HINT_COPYRIGHT                                                 000977 GR
    HINT_COPYRIGHT_size                                         =  00001E G
  0 HINT_EXIT                                                      00096B GR
    HINT_EXIT_size                                              =  00000C G
  0 HINT_JUMP                                                      000953 GR
    HINT_JUMP_size                                              =  00000C G
  0 HINT_LEFT                                                      000947 GR
    HINT_LEFT_size                                              =  00000C G
  0 HINT_NAME                                                      000995 GR
    HINT_NAME_size                                              =  00000E G
  0 HINT_PLAY                                                      00095F GR
    HINT_PLAY_size                                              =  00000C G
  0 HINT_RIGHT                                                     00093B GR
    HINT_RIGHT_size                                             =  00000C G
  0 HINT_YEAR                                                      0009A3 GR
    HINT_YEAR_size                                              =  00000E G
    HI_ZERO                                                     =  000000 G
  0 INITIALS                                                       000B79 GR
    INITIALS_size                                               =  000002 G
    INITIAL_DELAY_COUNTER                                       =  000001 G
    INITIAL_FAIL_COUNTER                                        =  000002 G
    INITIAL_LEVEL                                               =  000001 G
    INITIAL_LIVES                                               =  000006 G
  0 JUMP_DELAY                                                     000AD4 GR
    KEYBU                                                       =  000025 G
    LAKEY                                                       =  000024 G
  0 LEVEL                                                          000AD9 GR
    LEVEL_1                                                     =  000001 G
  0 LINE_BUFFER                                                    0009B6 GR
    LINE_BUFFER_size                                            =  00010F G
  0 LIVES                                                          000AD6 GR
  0 MAN_HEAD                                                       000AD2 GR
    MAX_FAIL_COUNTER                                            =  000005 G
    MAX_LEVEL                                                   =  000008 G
    MENU_TOP                                                    =  000010 G
    MONSTER_CORRECTION                                          =  000001 G
  0 MONSTER_IMG                                                    000B23 GR
    MONSTER_IMG_size                                            =  000038 G
  0 MONSTER_PTR                                                    000AEB GR
    MONSTER_PTR_size                                            =  000038 G
    MONSTER_WIDTH                                               =  000004 G
    MOVE_2X_RIGHT                                               =  000002 G
    NUMBER_HIGHSCORE_ENTRIES                                    =  000005 G
    NUMBER_OF_LINES                                             =  000008 G
  0 OFFSET_HOLES                                                   000AC6 GR
  0 OFFSET_HOLES_JUMP_PENALTY                                      000ACB GR
    OFFSET_HOLES_JUMP_PENALTY_size                              =  000005 G
    OFFSET_HOLES_size                                           =  000005 G
    P1ROL                                                       =  00003B G
    P2ROL                                                       =  00003C G
    P3ROL                                                       =  00003D G
    P4ROL                                                       =  00003E G
  0 POINTS                                                         000AD7 GR
    POSDIFF_HIGHSCORE_DY                                        =  000004 G
    POSDIFF_NAME                                                =  00000D G
    POSDIFF_POINTS                                              =  000008 G
    POSDIFF_YEAR                                                =  000005 G
    POSDIFF_YOUR_SCORE                                          =  FFFFFFD8 G
    POSDIFF_YOUR_SCORE_DY                                       =  000003 G
    POS_COPYRIGHT                                               =  000370 G
    POS_GAME_OVER                                               =  00EC0D G
    POS_LIVES                                                   =  00EF98 G
    POS_TOP_GAME                                                =  00EC0C G
    POS_TOP_WALL                                                =  00EC28 G
    SCREEN_HEIGHT                                               =  000018 G
    SCREEN_WIDTH                                                =  000028 G
    SLOW_DOWN_13066                                             =  004650 G
    SMALL_CAPITALS                                              =  00005F G
  0 START                                                          00000D GR
    TITLE_TOP_SIZE                                              =  000230 G
  0 TOP_IMAGE                                                      00070B GR
    TOP_IMAGE_size                                              =  0001FF G
    TOP_LINES                                                   =  00000E G
    TRANSITION_MAN_WALK_STAY                                    =  000004 G
  0 TXT_GAME_OVER                                                  000B7B GR
    TXT_GAME_OVER_size                                          =  00000F G
  0 TXT_HAZARD                                                     000B96 GR
    TXT_HAZARD_size                                             =  000009 G
  0 TXT_JUMP                                                       000ADB GR
    TXT_JUMP_size                                               =  000010 G
  0 TXT_NEW_HIGH_SCORE                                             000B9F GR
    TXT_NEW_HIGH_SCORE_size                                     =  000012 G
  0 TXT_YOUR_SCORE                                                 000B8A GR
    TXT_YOUR_SCORE_size                                         =  00000C G
    UP_CONSI                                                    =  000001 G
    UP_CONSO                                                    =  000002 G
    UP_CSTS                                                     =  00000B G
    UP_DCU                                                      =  00001D G
    UP_PRNST                                                    =  000009 G
    UP_SETCU                                                    =  000012 G
  0 VERSION_INFO                                                   0009B1 GR
    VERSION_INFO_size                                           =  000005 G
    VK_CLS                                                      =  00000C G
    VK_HEART                                                    =  0000CB G
    VK_LEFT                                                     =  000008 G
    VK_PLAYER                                                   =  0000C4 G
    VK_RIGHT                                                    =  000009 G
    WBOOT                                                       =  00F003 G
    ZERO                                                        =  000000 G
  0 _main                                                          000000 GR
  0 action_jump                                                    0003A9 GR
  0 action_left                                                    0002F9 GR
  0 action_right                                                   000350 GR
  0 add_10_points                                                  0004C4 GR
  0 animation_delay                                                0002EC GR
  0 animation_lines                                                00027C GR
  0 animation_loop                                                 000126 GR
  0 animation_monster                                              0001BD GR
  0 ask_exit_game                                                  000681 GR
  0 capitalized                                                    000094 GR
  0 check_fall_through                                             00040D GR
  0 check_for_trap                                                 000413 GR
  0 check_level_finished                                           00045E GR
  0 choose_menu                                                    000084 GR
  0 cnt_fail_jump                                                  000AD1 GR
  0 cnt_fail_trap                                                  000AD0 GR
  0 correct_left_border                                            00033C GR
  0 correct_ptr                                                    000207 GR
  0 correct_right_border                                           000393 GR
  0 counter                                                        000ADA GR
  0 decimal_loop                                                   00050E GR
  0 delay_loop                                                     0002F3 GR
  0 draw_monster                                                   00023E GR
  0 draw_monster_segment                                           000243 GR
  0 draw_new_highscore_box                                         0006D9 GR
  0 draw_player                                                    0000BB GR
  0 erase_player_fell_down                                         00043B GR
  0 exit_game                                                      000693 GR
  0 get_column                                                     000200 GR
  0 get_decimal_digit                                              00050D GR
  0 handle_by_column                                               0001E4 GR
  0 handle_by_ptr                                                  0001E0 GR
  0 handle_fail_delay                                              00015C GR
  0 handle_jump_delay                                              00015F GR
  0 handle_one_monster                                             0001CC GR
    inkey                                                       =  00FD33 G
  0 input                                                          00059E GR
  0 insert_score                                                   0006A8 GR
  0 jump_delay_counter_set                                         00016A GR
  0 jump_fail                                                      0003E6 GR
  0 jump_ok                                                        0003C2 GR
  0 left_border_next_adr                                           00032E GR
  0 loop_failed_penalty_holes                                      000291 GR
  0 loop_jump_penalty_holes                                        0002B0 GR
  0 loop_left_border_check                                         000322 GR
  0 loop_right_border_check                                        000379 GR
  0 m_070a                                                         000681 GR
  0 monster_check_crash                                            000260 GR
  0 move_one_line_up                                               000223 GR
  0 move_table_entry                                               0006AF GR
  0 new_game                                                       00009D GR
  0 new_level_set                                                  000471 GR
  0 no_lives                                                       000524 GR
  0 player_activity                                                0001B3 GR
  0 player_fell_down                                               000443 GR
  0 player_wake_up                                                 00019A GR
  0 print_decimal                                                  0004E1 GR
  0 print_highscore_entry                                          00060C GR
  0 print_highscore_table                                          000604 GR
  0 print_line                                                     0002D0 GR
    prst7                                                          ****** GX
  0 right_border_next_adr                                          000385 GR
  0 round_end                                                      0004A2 GR
  0 sadr                                                           000000 GR
    set_cursor                                                     ****** GX
  0 start_from_bottom                                              000211 GR
  0 test_column                                                    000218 GR
  0 transition_left_stay                                           000315 GR
  0 transition_left_walk                                           000319 GR
  0 transition_stay                                                00036C GR
  0 transition_walk                                                000370 GR
  0 update_left                                                    00031B GR
  0 update_pointers                                                00022A GR
  0 update_right                                                   000372 GR
    z1013                                                       =  000000 G
    z9001                                                       =  000001 G


ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 2.
Hexadecimal [24-Bits]

Area Table

   0 _CODE                                      size    BB1   flags    0
   1 _DATA                                      size      0   flags    0


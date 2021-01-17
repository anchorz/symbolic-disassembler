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
                           00001D    33 UP_DCU                          =       29
                                     34 ;
                                     35 ; platform specific
                                     36 ;
                           000028    37 SCREEN_WIDTH                    =       40
                           000018    38 SCREEN_HEIGHT                   =       24
                                     39 
                           00000E    40 TOP_LINES                       =       14
                           000230    41 TITLE_TOP_SIZE                  =       SCREEN_WIDTH*TOP_LINES
                           000010    42 MENU_TOP                        =       (TOP_LINES+2)
                           000004    43 ALIGN_MIDDLE                    =       4
                           000006    44 GAMES_LINES                     =       6
                           000002    45 GAME_START_Y                    =       2
                           004650    46 SLOW_DOWN_13066                 =       18000
                           00EF98    47 POS_LIVES                       =       BWS+23*SCREEN_WIDTH
                           00EC28    48 POS_TOP_WALL                    =       BWS+ 1*SCREEN_WIDTH
                           00EC0C    49 POS_TOP_GAME                    =       BWS+ 0*SCREEN_WIDTH+8+ALIGN_MIDDLE
                           00EC0D    50 POS_GAME_OVER                   =       BWS+ 0*SCREEN_WIDTH+9+ALIGN_MIDDLE
                           000370    51 POS_COPYRIGHT                   =       SCREEN_WIDTH*22
                           00000D    52 POSDIFF_NAME                    =       SCREEN_WIDTH-HINT_COPYRIGHT_size+3
                           000005    53 POSDIFF_YEAR                    =       5
                           000008    54 POSDIFF_POINTS                  =       8
                           FFFFFFD8    55 POSDIFF_YOUR_SCORE              =       -(SCREEN_WIDTH)
                           000003    56 POSDIFF_YOUR_SCORE_DY           =       3
                           000004    57 POSDIFF_HIGHSCORE_DY            =       4
                           000001    58 MONSTER_CORRECTION              =       1
                                     59 
                                     60 .macro PROGRAM_START
                                     61         jp START
                                     62         .ascii 'JUMP    '
                                     63         .dw 0
                                     64 START:
                                     65         .endm
                                     66 
                                     67 .macro SCREEN_POS
                                     68         .ascii '    '
                                     69  .endm
                                     70 
                                     71 .macro CLRSCR
                                     72         ld      c,#UP_CONSO
                                     73         ld      e,#0x0c
                                     74         call    BOS
                                     75         ld      c,#UP_DCU
                                     76         call    BOS
                                     77 .endm
                                     78 
                                     79 .macro OUTCH
                                     80         push    bc
                                     81         push    de
                                     82         ld      c,#UP_CONSO
                                     83         ld      e,a
                                     84         call    BOS
                                     85         pop     de
                                     86         pop     bc
                                     87 .endm
                                     88 
                                     89 .macro INCH
                                     90         xor     a
                                     91         ld      (KEYBU),a
                                     92         ld      c,#UP_CONSI
                                     93         call    BOS
                                     94 .endm
                                     95 
                                     96 .macro PRST7
                                     97         call    prst7
                                     98 .endm
                                     99 
                                    100 .macro INKEY
                                    101         call    inkey
                                    102 .endm
                                    103 
                                    104 .macro END_PROGRAM
                                    105         jp      WBOOT
                                    106 .endm
                                    107 
                                    108 .macro SET_CURSOR_DE    Y,X
                                    109         push    bc
                                    110         ld      de,#(Y+1)*256+(X+1)
                                    111         ld      c,#UP_SETCU
                                    112         call    BOS
                                    113         pop     bc
                                    114 .endm
                                    115 
                                    116 .macro SET_CURSOR_HL    Y,X
                                    117         push    de
                                    118         push    bc
                                    119         ld      de,#(Y+1)*256+(X+1)
                                    120         ld      h,d
                                    121         ld      l,e
                                    122         ld      c,#UP_SETCU
                                    123         call    BOS
                                    124         pop     bc
                                    125         pop     de
                                    126 .endm
                                    127 
                                    128 .macro SET_CURSOR
                                    129         call    set_cursor
                                    130 .endm
                                    131 
                                    132 .macro REMOVE_CURSOR
                                    133         ld      hl,(CURS)
                                    134         ld      (hl),#' '
                                    135         res     2,h
                                    136         res     7,(hl)
                                    137         set     2,h
                                    138 .endm
                                    139 
                                    140 .macro CURSOR_DISABLE
                                    141         push    bc
                                    142         ld      c,#UP_DCU
                                    143         call    BOS
                                    144         pop     bc
                                    145 .endm
                                    146 
                                    147 .macro Z1013_LINE
                                    148 .endm
                                      3 ; 
                                      4 ; constant
                                      5 ; 
                           000000     6 ZERO                             = 0x00
                           000000     7 HI_ZERO                          = 0x00
                           000001     8 LEVEL_1                          = 0x01
                           000008     9 VK_LEFT                          = 0x08
                           000009    10 VK_RIGHT                         = 0x09
                           00000C    11 VK_CLS                           = 0x0c
                           0000CB    12 VK_HEART                         = 0xcb
                           0000C4    13 VK_PLAYER                        = 0xc4
                           0000A0    14 CHR_MIDDLE_LINE                  = 0xa0
                           0000CD    15 CHR_SMOKE                        = 0xcd
                           0000C6    16 CHR_WALL                         = 0xc6
                           0000CC    17 CHR_MAN_HEAD                     = 0xcc
                           0000A1    18 CHR_MAN_STAY                     = 0xa1
                           00009D    19 CHR_MAN_WALK                     = 0x9d
                           000004    20 TRANSITION_MAN_WALK_STAY         = 0x04
                           000097    21 CHR_MAN_SLEEP                    = 0x97
                           0000C9    22 CHR_MAN_SLEEP_HEAD               = 0xc9
                           000095    23 CHR_ARROW_RIGHT_TOP              = 0x95
                           000093    24 CHR_ARROW_RIGHT_BOTTOM           = 0x93
                           0000F8    25 CHR_LINE_TOP                     = 0xf8
                           00009E    26 CHR_LINE_BOTTOM                  = 0x9e
                           0000EE    27 CHR_MOVING_LINE                  = 0xee
                           00005F    28 SMALL_CAPITALS                   = 0x5f
                           000020    29 CAPITALIZE                       = 0x20
                           000006    30 INITIAL_LIVES                    = 0x06
                           000001    31 INITIAL_LEVEL                    = 0x01
                           000005    32 MAX_FAIL_COUNTER                 = 0x05
                           000002    33 INITIAL_FAIL_COUNTER             = 0x02
                           000001    34 INITIAL_DELAY_COUNTER            = 0x01
                           00000B    35 DELAY_COUNTER                    = 0x0b
                           000008    36 DELAY_COUNTER2                   = 0x08
                           000004    37 DELAY_COUNTER_JUMP               = 0x04
                           000002    38 MOVE_2X_RIGHT                    = 0x02
                           000004    39 MONSTER_WIDTH                    = 0x04
                           000008    40 NUMBER_OF_LINES                  = 0x08
                           000005    41 NUMBER_HIGHSCORE_ENTRIES         = 0x05
                           000008    42 MAX_LEVEL                        = 0x08
                                     43 
                           00EC00    44 BWS                              = 0xec00
                           0001FF    45 TOP_IMAGE_size                   = 0x01ff
                           000005    46 VERSION_INFO_size                = 0x0005
                           00000C    47 HINT_RIGHT_size                  = 0x000c
                           00000C    48 HINT_LEFT_size                   = 0x000c
                           00000C    49 HINT_JUMP_size                   = 0x000c
                           00000C    50 HINT_PLAY_size                   = 0x000c
                           00000C    51 HINT_EXIT_size                   = 0x000c
                           00001E    52 HINT_COPYRIGHT_size              = 0x001e
                           00000E    53 HINT_NAME_size                   = 0x000e
                           00000E    54 HINT_YEAR_size                   = 0x000e
                           00010F    55 LINE_BUFFER_size                 = 0x010f
                           000005    56 OFFSET_HOLES_size                = 0x0005
                           000005    57 OFFSET_HOLES_JUMP_PENALTY_size   = 0x0005
                           000010    58 TXT_JUMP_size                    = 0x0010
                           00000F    59 TXT_GAME_OVER_size               = 0x000f
                           00000C    60 TXT_YOUR_SCORE_size              = 0x000c
                           000009    61 TXT_HAZARD_size                  = 0x0009
                           000012    62 TXT_NEW_HIGH_SCORE_size          = 0x0012
                           000002    63 HIGH_SCORE_TABLE01_size          = 0x0002
                           000002    64 HIGH_SCORE_TABLE02_size          = 0x0002
                           000002    65 HIGH_SCORE_TABLE03_size          = 0x0002
                           000002    66 HIGH_SCORE_TABLE04_size          = 0x0002
                           000002    67 HIGH_SCORE_TABLE05_size          = 0x0002
                           000002    68 HIGH_SCORE_TABLE_TMP_size        = 0x0002
                           000002    69 INITIALS_size                    = 0x0002
                           000038    70 MONSTER_PTR_size                 = 0x0038
                           000038    71 MONSTER_IMG_size                 = 0x0038
                                     72 ;
                                     73 ;
                                     74 ;
      000000                         75         PROGRAM_START
      000300 C3 0D 03         [10]    1         jp START
      000303 4A 55 4D 50 20 20 20     2         .ascii 'JUMP    '
             20
      00030B 00 00                    3         .dw 0
      00030D                          4 START:
                                     76         ;jp      no_lives
      00000D                         77         CLRSCR
      00030D 0E 02            [ 7]    1         ld      c,#UP_CONSO
      00030F 1E 0C            [ 7]    2         ld      e,#0x0c
      000311 CD 05 00         [17]    3         call    BOS
      000314 0E 1D            [ 7]    4         ld      c,#UP_DCU
      000316 CD 05 00         [17]    5         call    BOS
      000319 11 00 EC         [10]   78         ld      de,#BWS
      00031C 21 0A 0A         [10]   79         ld      hl,#TOP_IMAGE
      00031F 01 30 02         [10]   80         ld      bc,#TITLE_TOP_SIZE
      000322 ED B0            [21]   81         ldir
      000324 21 30 EE         [10]   82         ld      hl,#BWS+SCREEN_WIDTH*TOP_LINES
      000327 36 CB            [10]   83         ld      (hl),#VK_HEART
      000329 11 31 EE         [10]   84         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+1
      00032C 01 27 00         [10]   85         ld      bc,#SCREEN_WIDTH-1
      00032F ED B0            [21]   86         ldir
      000331 11 50 EE         [10]   87         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+(SCREEN_WIDTH-8)
      000334 21 B0 0C         [10]   88         ld      hl,#VERSION_INFO
      000337 01 05 00         [10]   89         ld      bc,#VERSION_INFO_size
      00033A ED B0            [21]   90         ldir
      00033C 11 8E EE         [10]   91         ld      de,#BWS+SCREEN_WIDTH*MENU_TOP+10+ALIGN_MIDDLE
      00033F 21 3A 0C         [10]   92         ld      hl,#HINT_RIGHT
      000342 01 0C 00         [10]   93         ld      bc,#HINT_RIGHT_size
      000345 ED B0            [21]   94         ldir
      000347 0E 1C            [ 7]   95         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000349 EB               [ 4]   96         ex      de,hl
      00034A 09               [11]   97         add     hl,bc
      00034B EB               [ 4]   98         ex      de,hl
      00034C 0E 0C            [ 7]   99         ld      c,#HINT_RIGHT_size
      00034E ED B0            [21]  100         ldir
      000350 0E 1C            [ 7]  101         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000352 EB               [ 4]  102         ex      de,hl
      000353 09               [11]  103         add     hl,bc
      000354 EB               [ 4]  104         ex      de,hl
      000355 0E 0C            [ 7]  105         ld      c,#HINT_RIGHT_size
      000357 ED B0            [21]  106         ldir
      000359 0E 1C            [ 7]  107         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      00035B EB               [ 4]  108         ex      de,hl
      00035C 09               [11]  109         add     hl,bc
      00035D EB               [ 4]  110         ex      de,hl
      00035E 0E 0C            [ 7]  111         ld      c,#HINT_RIGHT_size
      000360 ED B0            [21]  112         ldir
      000362 0E 1C            [ 7]  113         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000364 EB               [ 4]  114         ex      de,hl
      000365 09               [11]  115         add     hl,bc
      000366 EB               [ 4]  116         ex      de,hl
      000367 0E 0C            [ 7]  117         ld      c,#HINT_RIGHT_size
      000369 ED B0            [21]  118         ldir
      00036B 11 70 EF         [10]  119         ld      de,#BWS+POS_COPYRIGHT
      00036E 0E 1E            [ 7]  120         ld      c,#HINT_COPYRIGHT_size
      000370 ED B0            [21]  121         ldir
      000372 0E 0D            [ 7]  122         ld      c,#POSDIFF_NAME
      000374 EB               [ 4]  123         ex      de,hl
      000375 09               [11]  124         add     hl,bc
      000376 EB               [ 4]  125         ex      de,hl
      000377 0E 0E            [ 7]  126         ld      c,#HINT_NAME_size
      000379 ED B0            [21]  127         ldir
      00037B 0E 05            [ 7]  128         ld      c,#POSDIFF_YEAR
      00037D EB               [ 4]  129         ex      de,hl
      00037E 09               [11]  130         add     hl,bc
      00037F EB               [ 4]  131         ex      de,hl
      000380 0E 12            [ 7]  132         ld      c,#HINT_YEAR_size+VERSION_INFO_size-1
      000382 ED B0            [21]  133         ldir
      000384                        134 choose_menu:
      000384 AF               [ 4]  135         xor     a
      000085                        136         INCH
      000385 AF               [ 4]    1         xor     a
      000386 32 25 00         [13]    2         ld      (KEYBU),a
      000389 0E 01            [ 7]    3         ld      c,#UP_CONSI
      00038B CD 05 00         [17]    4         call    BOS
      00038E FE 5F            [ 7]  137         cp      #SMALL_CAPITALS
      000390 38 02            [12]  138         jr      c,capitalized
      000392 D6 20            [ 7]  139         sub     #CAPITALIZE
      000394                        140 capitalized:
      000394 FE 45            [ 7]  141         cp      #'E'
      000396 CA 92 09         [10]  142         jp      z,exit_game
      000399 FE 50            [ 7]  143         cp      #'P'
      00039B 20 E7            [12]  144         jr      nz,choose_menu
      00039D                        145 new_game:
      00009D                        146         CLRSCR
      00039D 0E 02            [ 7]    1         ld      c,#UP_CONSO
      00039F 1E 0C            [ 7]    2         ld      e,#0x0c
      0003A1 CD 05 00         [17]    3         call    BOS
      0003A4 0E 1D            [ 7]    4         ld      c,#UP_DCU
      0003A6 CD 05 00         [17]    5         call    BOS
      0003A9 21 D5 0D         [10]  147         ld      hl,#LIVES
      0003AC 36 06            [10]  148         ld      (hl),#INITIAL_LIVES
      0003AE 21 D6 0D         [10]  149         ld      hl,#POINTS
      0003B1 36 00            [10]  150         ld      (hl),#ZERO
      0003B3 23               [ 6]  151         inc     hl
      0003B4 36 00            [10]  152         ld      (hl),#ZERO
      0003B6 06 06            [ 7]  153         ld      b,#INITIAL_LIVES
      0003B8 21 98 EF         [10]  154         ld      hl,#POS_LIVES
      0003BB                        155 draw_player:
      0003BB 3E 02            [ 7]  156         ld      a,#MOVE_2X_RIGHT
      0003BD 85               [ 4]  157         add     a,l
      0003BE 6F               [ 4]  158         ld      l,a
      0003BF 36 C4            [10]  159         ld      (hl),#VK_PLAYER
      0003C1 10 F8            [13]  160         djnz    draw_player
      0003C3 3E 01            [ 7]  161         ld      a,#INITIAL_LEVEL
      0003C5 32 D8 0D         [13]  162         ld      (LEVEL),a
      0003C8 3E 02            [ 7]  163         ld      a,#INITIAL_FAIL_COUNTER
      0003CA 32 CF 0D         [13]  164         ld      (cnt_fail_trap),a
      0003CD 32 D0 0D         [13]  165         ld      (cnt_fail_jump),a
      0003D0 21 00 EC         [10]  166         ld      hl,#BWS
      0003D3 36 20            [10]  167         ld      (hl),#' '
      0003D5 11 01 EC         [10]  168         ld      de,#BWS+1
      0003D8 01 96 03         [10]  169         ld      bc,#(3+GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH-2
      0003DB ED B0            [21]  170         ldir
      0003DD 21 28 EC         [10]  171         ld      hl,#POS_TOP_WALL
      0003E0 36 C6            [10]  172         ld      (hl),#CHR_WALL
      0003E2 11 29 EC         [10]  173         ld      de,#POS_TOP_WALL+1
      0003E5 01 27 00         [10]  174         ld      bc,#SCREEN_WIDTH-1
      0003E8 ED B0            [21]  175         ldir
      0003EA 21 70 EC         [10]  176         ld      hl,#POS_TOP_WALL+2*SCREEN_WIDTH-8
      0003ED 36 C6            [10]  177         ld      (hl),#CHR_WALL
      0003EF 2B               [ 6]  178         dec     hl
      0003F0 2B               [ 6]  179         dec     hl
      0003F1 36 95            [10]  180         ld      (hl),#CHR_ARROW_RIGHT_TOP
      0003F3 2B               [ 6]  181         dec     hl
      0003F4 36 F8            [10]  182         ld      (hl),#CHR_LINE_TOP
      0003F6 21 98 EC         [10]  183         ld      hl,#POS_TOP_WALL+3*SCREEN_WIDTH-8
      0003F9 36 C6            [10]  184         ld      (hl),#CHR_WALL
      0003FB 2B               [ 6]  185         dec     hl
      0003FC 2B               [ 6]  186         dec     hl
      0003FD 36 93            [10]  187         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      0003FF 2B               [ 6]  188         dec     hl
      000400 36 9E            [10]  189         ld      (hl),#CHR_LINE_BOTTOM
      000402 21 DA 0D         [10]  190         ld      hl,#TXT_JUMP
      000405 11 0C EC         [10]  191         ld      de,#POS_TOP_GAME
      000408 01 10 00         [10]  192         ld      bc,#TXT_JUMP_size
      00040B ED B0            [21]  193         ldir
      00040D 3E 01            [ 7]  194         ld      a,#INITIAL_DELAY_COUNTER
      00040F 21 D3 0D         [10]  195         ld      hl,#JUMP_DELAY
      000412 77               [ 7]  196         ld      (hl),a
      000413 21 D4 0D         [10]  197         ld      hl,#FAIL_DELAY
      000416 77               [ 7]  198         ld      (hl),a
      000417 23               [ 6]  199         inc     hl
      000418 21 32 EF         [10]  200         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      00041B 22 D1 0D         [16]  201         ld      (MAN_HEAD),hl
      00041E 36 CC            [10]  202         ld      (hl),#CHR_MAN_HEAD
      000420 11 28 00         [10]  203         ld      de,#SCREEN_WIDTH
      000423 19               [11]  204         add     hl,de
      000424 36 A1            [10]  205         ld      (hl),#CHR_MAN_STAY
      000426                        206 animation_loop:
      000426 CD BC 04         [17]  207         call    animation_monster
      000429 CD 7B 05         [17]  208         call    animation_lines
      00042C CD EB 05         [17]  209         call    animation_delay
      00042F 3A D3 0D         [13]  210         ld      a,(JUMP_DELAY)
      000432 FE 01            [ 7]  211         cp      #INITIAL_DELAY_COUNTER
      000434 20 28            [12]  212         jr      nz,handle_jump_delay
      000436 3A D4 0D         [13]  213         ld      a,(FAIL_DELAY)
      000439 FE 01            [ 7]  214         cp      #INITIAL_DELAY_COUNTER
      00043B 20 1E            [12]  215         jr      nz,handle_fail_delay
      00013D                        216         INKEY
      00043D CD 33 FD         [17]    1         call    inkey
      000440 FE 20            [ 7]  217         cp      #' '
      000442 CA A8 06         [10]  218         jp      z,action_jump
      000445 FE 08            [ 7]  219         cp      #VK_LEFT
      000447 CC F8 05         [17]  220         call    z,action_left
      00044A FE 09            [ 7]  221         cp      #VK_RIGHT
      00044C CC 4F 06         [17]  222         call    z,action_right
                           000001   223 .if z9001
                                    224         ;debugginh
      00044F FE 55            [ 7]  225         cp      #'U'
      000451 20 08            [12]  226         jr      nz,handle_fail_delay
      000453 21 64 EC         [10]  227         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+20
      000456 36 CC            [10]  228         ld      (hl),#CHR_MAN_HEAD
      000458 22 D1 0D         [16]  229         ld      (MAN_HEAD),hl
                                    230 .endif
      00045B                        231 handle_fail_delay:
      00045B CD 0C 07         [17]  232         call    check_fall_through
      00045E                        233 handle_jump_delay:
      00045E 3A D3 0D         [13]  234         ld      a,(JUMP_DELAY)
      000461 FE 01            [ 7]  235         cp      #INITIAL_DELAY_COUNTER
      000463 28 04            [12]  236         jr      z,jump_delay_counter_set
      000465 3D               [ 4]  237         dec     a
      000466 32 D3 0D         [13]  238         ld      (JUMP_DELAY),a
      000469                        239 jump_delay_counter_set:
      000469 3A D4 0D         [13]  240         ld      a,(FAIL_DELAY)
      00046C FE 01            [ 7]  241         cp      #INITIAL_DELAY_COUNTER
      00046E 28 42            [12]  242         jr      z,player_activity
      000470 3D               [ 4]  243         dec     a
      000471 32 D4 0D         [13]  244         ld      (FAIL_DELAY),a
      000474 FE 01            [ 7]  245         cp      #INITIAL_DELAY_COUNTER
      000476 20 3A            [12]  246         jr      nz,player_activity
      000478 2A D1 0D         [16]  247         ld      hl,(MAN_HEAD)
                                    248         ; test for bottom line
      00047B 11 D0 EE         [10]  249         ld      de,#BWS+(GAME_START_Y+3*GAMES_LINES-2)*SCREEN_WIDTH
      00047E A7               [ 4]  250         and     a
      00047F ED 52            [15]  251         sbc     hl,de
      000481 38 16            [12]  252         jr      c,player_wake_up
      000483 3A D5 0D         [13]  253         ld      a,(LIVES)
      000486 3D               [ 4]  254         dec     a
      000487 32 D5 0D         [13]  255         ld      (LIVES),a
      00048A 21 9A EF         [10]  256         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES+3)*SCREEN_WIDTH+2
      00048D 16 00            [ 7]  257         ld      d,#HI_ZERO
      00048F 87               [ 4]  258         add     a,a
      000490 5F               [ 4]  259         ld      e,a
      000491 19               [11]  260         add     hl,de
      000492 36 20            [10]  261         ld      (hl),#' '
      000494 FE 00            [ 7]  262         cp      #ZERO
      000496 CA 23 08         [10]  263         jp      z,no_lives
      000499                        264 player_wake_up:
      000499 2A D1 0D         [16]  265         ld      hl,(MAN_HEAD)
      00049C 36 CC            [10]  266         ld      (hl),#CHR_MAN_HEAD
      00049E 2B               [ 6]  267         dec     hl
      00049F 3E 20            [ 7]  268         ld      a,#' '
      0004A1 77               [ 7]  269         ld      (hl),a
      0004A2 23               [ 6]  270         inc     hl
      0004A3 23               [ 6]  271         inc     hl
      0004A4 23               [ 6]  272         inc     hl
      0004A5 77               [ 7]  273         ld      (hl),a
      0004A6 2B               [ 6]  274         dec     hl
      0004A7 11 28 00         [10]  275         ld      de,#SCREEN_WIDTH
      0004AA 19               [11]  276         add     hl,de
      0004AB 77               [ 7]  277         ld      (hl),a
      0004AC 23               [ 6]  278         inc     hl
      0004AD 77               [ 7]  279         ld      (hl),a
      0004AE 2B               [ 6]  280         dec     hl
      0004AF 2B               [ 6]  281         dec     hl
      0004B0 36 9D            [10]  282         ld      (hl),#CHR_MAN_WALK
      0004B2                        283 player_activity:
      0004B2 CD 5D 07         [17]  284         call    check_level_finished
      0004B5 C3 26 04         [10]  285         jp      animation_loop
                                    286 ; unchecked data source
      0004B8 67 75 66 69            287         .db     0x67,0x75,0x66,0x69                     ;gufi
      0004BC                        288 animation_monster:
      0004BC 3A D8 0D         [13]  289         ld      a,(LEVEL)
      0004BF 32 D9 0D         [13]  290         ld      (counter),a
      0004C2 FE 01            [ 7]  291         cp      #LEVEL_1
      0004C4 C8               [11]  292         ret     z
      0004C5 01 EA 0D         [10]  293         ld      bc,#MONSTER_PTR
      0004C8 11 22 0E         [10]  294         ld      de,#MONSTER_IMG
      0004CB                        295 handle_one_monster:
      0004CB 0A               [ 7]  296         ld      a,(bc)
      0004CC 6F               [ 4]  297         ld      l,a
      0004CD 03               [ 6]  298         inc     bc
      0004CE 0A               [ 7]  299         ld      a,(bc)
      0004CF 67               [ 4]  300         ld      h,a
      0004D0 CD DF 04         [17]  301         call    handle_by_ptr
      0004D3 3A D9 0D         [13]  302         ld      a,(counter)
      0004D6 3D               [ 4]  303         dec     a
      0004D7 32 D9 0D         [13]  304         ld      (counter),a
      0004DA FE 01            [ 7]  305         cp      #LEVEL_1
      0004DC C8               [11]  306         ret     z
      0004DD 18 EC            [12]  307         jr      handle_one_monster
      0004DF                        308 handle_by_ptr:
      0004DF C5               [11]  309         push    bc
      0004E0 3E 04            [ 7]  310         ld      a,#MONSTER_WIDTH
      0004E2 D5               [11]  311         push    de
      0004E3                        312 handle_by_column:
      0004E3 36 20            [10]  313         ld      (hl),#' '
      0004E5 11 28 00         [10]  314         ld      de,#SCREEN_WIDTH
      0004E8 19               [11]  315         add     hl,de
      0004E9 36 20            [10]  316         ld      (hl),#' '
      0004EB A7               [ 4]  317         and     a
      0004EC ED 52            [15]  318         sbc     hl,de
      0004EE 2B               [ 6]  319         dec     hl
      0004EF E5               [11]  320         push    hl
      0004F0 08               [ 4]  321         ex      af,af'
      0004F1 11 EF EC         [10]  322         ld      de,#BWS+(GAME_START_Y+4)*SCREEN_WIDTH-1
      0004F4 A7               [ 4]  323         and     a
      0004F5 ED 52            [15]  324         sbc     hl,de
      0004F7 38 0D            [12]  325         jr      c,correct_ptr
      0004F9 C5               [11]  326         push    bc
      0004FA 06 06            [ 7]  327         ld      b,#GAMES_LINES
      0004FC 11 78 00         [10]  328         ld      de,#3*SCREEN_WIDTH
      0004FF                        329 get_column:
      0004FF A7               [ 4]  330         and     a
      000500 ED 52            [15]  331         sbc     hl,de
      000502 38 13            [12]  332         jr      c,test_column
      000504 10 F9            [13]  333         djnz    get_column
      000506                        334 correct_ptr:
      000506 11 27 00         [10]  335         ld      de,#SCREEN_WIDTH-1
      000509 ED 5A            [15]  336         adc     hl,de
      00050B 28 03            [12]  337         jr      z,start_from_bottom
      00050D E1               [10]  338         pop     hl
      00050E 18 19            [12]  339         jr      update_pointers
      000510                        340 start_from_bottom:
      000510 E1               [10]  341         pop     hl
      000511 11 08 02         [10]  342         ld      de,#((GAMES_LINES-2)*3+1)*SCREEN_WIDTH
      000514 19               [11]  343         add     hl,de
      000515 18 12            [12]  344         jr      update_pointers
      000517                        345 test_column:
      000517 C1               [10]  346         pop     bc
      000518 11 27 00         [10]  347         ld      de,#SCREEN_WIDTH-1
      00051B ED 5A            [15]  348         adc     hl,de
      00051D 28 03            [12]  349         jr      z,move_one_line_up
      00051F E1               [10]  350         pop     hl
      000520 18 07            [12]  351         jr      update_pointers
      000522                        352 move_one_line_up:
      000522 E1               [10]  353         pop     hl
      000523 11 50 00         [10]  354         ld      de,#2*SCREEN_WIDTH
      000526 A7               [ 4]  355         and     a
      000527 ED 52            [15]  356         sbc     hl,de
      000529                        357 update_pointers:
      000529 0B               [ 6]  358         dec     bc
      00052A 7D               [ 4]  359         ld      a,l
      00052B 02               [ 7]  360         ld      (bc),a
      00052C 03               [ 6]  361         inc     bc
      00052D 7C               [ 4]  362         ld      a,h
      00052E 02               [ 7]  363         ld      (bc),a
      00052F 03               [ 6]  364         inc     bc
      000530 0A               [ 7]  365         ld      a,(bc)
      000531 6F               [ 4]  366         ld      l,a
      000532 03               [ 6]  367         inc     bc
      000533 0A               [ 7]  368         ld      a,(bc)
      000534 67               [ 4]  369         ld      h,a
      000535 08               [ 4]  370         ex      af,af'
      000536 3D               [ 4]  371         dec     a
      000537 FE 00            [ 7]  372         cp      #ZERO
      000539 28 02            [12]  373         jr      z,draw_monster
      00053B 18 A6            [12]  374         jr      handle_by_column
      00053D                        375 draw_monster:
      00053D D1               [10]  376         pop     de
      00053E C1               [10]  377         pop     bc
      00053F 0B               [ 6]  378         dec     bc
      000540 3E 04            [ 7]  379         ld      a,#MONSTER_WIDTH
      000542                        380 draw_monster_segment:
      000542 08               [ 4]  381         ex      af,af'
      000543 0A               [ 7]  382         ld      a,(bc)
      000544 6F               [ 4]  383         ld      l,a
      000545 03               [ 6]  384         inc     bc
      000546 0A               [ 7]  385         ld      a,(bc)
      000547 67               [ 4]  386         ld      h,a
      000548 03               [ 6]  387         inc     bc
      000549 1A               [ 7]  388         ld      a,(de)
      00054A 77               [ 7]  389         ld      (hl),a
      00054B 13               [ 6]  390         inc     de
      00054C 1A               [ 7]  391         ld      a,(de)
      00054D D5               [11]  392         push    de
      00054E 11 28 00         [10]  393         ld      de,#SCREEN_WIDTH
      000551 19               [11]  394         add     hl,de
      000552 77               [ 7]  395         ld      (hl),a
      000553 CD 5F 05         [17]  396         call    monster_check_crash
      000556 D1               [10]  397         pop     de
      000557 13               [ 6]  398         inc     de
      000558 08               [ 4]  399         ex      af,af'
      000559 3D               [ 4]  400         dec     a
      00055A FE 00            [ 7]  401         cp      #ZERO
      00055C 20 E4            [12]  402         jr      nz,draw_monster_segment
      00055E C9               [10]  403         ret
      00055F                        404 monster_check_crash:
      00055F A7               [ 4]  405         and     a
      000560 ED 52            [15]  406         sbc     hl,de
      000562 EB               [ 4]  407         ex      de,hl
      000563 2A D1 0D         [16]  408         ld      hl,(MAN_HEAD)
      000566 A7               [ 4]  409         and     a
      000567 ED 52            [15]  410         sbc     hl,de
      000569 EB               [ 4]  411         ex      de,hl
      00056A C0               [11]  412         ret     nz
      00056B 11 28 00         [10]  413         ld      de,#SCREEN_WIDTH
      00056E 19               [11]  414         add     hl,de
      00056F 23               [ 6]  415         inc     hl
      000570 36 97            [10]  416         ld      (hl),#CHR_MAN_SLEEP
      000572 23               [ 6]  417         inc     hl
      000573 36 C9            [10]  418         ld      (hl),#CHR_MAN_SLEEP_HEAD
      000575 3E 0B            [ 7]  419         ld      a,#DELAY_COUNTER
      000577 32 D4 0D         [13]  420         ld      (FAIL_DELAY),a
      00057A C9               [10]  421         ret
      00057B                        422 animation_lines:
      00057B 3E EE            [ 7]  423         ld      a,#CHR_MOVING_LINE
      00057D 21 B5 0C         [10]  424         ld      hl,#LINE_BUFFER
      000580 77               [ 7]  425         ld      (hl),a
      000581 11 B6 0C         [10]  426         ld      de,#LINE_BUFFER+1
      000584 01 0E 01         [10]  427         ld      bc,#LINE_BUFFER_size-1
      000587 ED B0            [21]  428         ldir
      000589 3A CF 0D         [13]  429         ld      a,(cnt_fail_trap)
      00058C 11 C5 0D         [10]  430         ld      de,#OFFSET_HOLES
      00058F 1B               [ 6]  431         dec     de
      000590                        432 loop_failed_penalty_holes:
      000590 F5               [11]  433         push    af
      000591 13               [ 6]  434         inc     de
      000592 1A               [ 7]  435         ld      a,(de)
      000593 3C               [ 4]  436         inc     a
      000594 12               [ 7]  437         ld      (de),a
      000595 4F               [ 4]  438         ld      c,a
      000596 06 00            [ 7]  439         ld      b,#HI_ZERO
      000598 21 B5 0C         [10]  440         ld      hl,#LINE_BUFFER
      00059B 09               [11]  441         add     hl,bc
      00059C 36 20            [10]  442         ld      (hl),#' '
      00059E 23               [ 6]  443         inc     hl
      00059F 36 20            [10]  444         ld      (hl),#' '
      0005A1 23               [ 6]  445         inc     hl
      0005A2 36 20            [10]  446         ld      (hl),#' '
      0005A4 F1               [10]  447         pop     af
      0005A5 3D               [ 4]  448         dec     a
      0005A6 20 E8            [12]  449         jr      nz,loop_failed_penalty_holes
      0005A8 3A D0 0D         [13]  450         ld      a,(cnt_fail_jump)
      0005AB 11 CA 0D         [10]  451         ld      de,#OFFSET_HOLES_JUMP_PENALTY
      0005AE 1B               [ 6]  452         dec     de
      0005AF                        453 loop_jump_penalty_holes:
      0005AF F5               [11]  454         push    af
      0005B0 13               [ 6]  455         inc     de
      0005B1 1A               [ 7]  456         ld      a,(de)
      0005B2 3D               [ 4]  457         dec     a
      0005B3 12               [ 7]  458         ld      (de),a
      0005B4 4F               [ 4]  459         ld      c,a
      0005B5 06 00            [ 7]  460         ld      b,#HI_ZERO
      0005B7 21 B5 0C         [10]  461         ld      hl,#LINE_BUFFER
      0005BA 09               [11]  462         add     hl,bc
      0005BB 36 20            [10]  463         ld      (hl),#' '
      0005BD 23               [ 6]  464         inc     hl
      0005BE 36 20            [10]  465         ld      (hl),#' '
      0005C0 23               [ 6]  466         inc     hl
      0005C1 36 20            [10]  467         ld      (hl),#' '
      0005C3 F1               [10]  468         pop     af
      0005C4 3D               [ 4]  469         dec     a
      0005C5 20 E8            [12]  470         jr      nz,loop_jump_penalty_holes
      0005C7 3E 06            [ 7]  471         ld      a,#GAMES_LINES
      0005C9 21 B5 0C         [10]  472         ld      hl,#LINE_BUFFER
      0005CC 11 50 EC         [10]  473         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+0
      0005CF                        474 print_line:
      0005CF 01 28 00         [10]  475         ld      bc,#SCREEN_WIDTH
      0005D2 E5               [11]  476         push    hl
      0005D3 EB               [ 4]  477         ex      de,hl
      0005D4 09               [11]  478         add     hl,bc
      0005D5 09               [11]  479         add     hl,bc
      0005D6 EB               [ 4]  480         ex      de,hl
      0005D7 E1               [10]  481         pop     hl
      0005D8 ED B0            [21]  482         ldir
      0005DA 3D               [ 4]  483         dec     a
      0005DB 20 F2            [12]  484         jr      nz,print_line
      0005DD 21 70 EF         [10]  485         ld      hl,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+0
      0005E0 11 71 EF         [10]  486         ld      de,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+1
      0005E3 01 27 00         [10]  487         ld      bc,#SCREEN_WIDTH-1
      0005E6 36 C6            [10]  488         ld      (hl),#CHR_WALL
      0005E8 ED B0            [21]  489         ldir
      0005EA C9               [10]  490         ret
      0005EB                        491 animation_delay:
      0005EB 21 50 46         [10]  492         ld      hl,#SLOW_DOWN_13066
      0005EE 11 01 00         [10]  493         ld      de,#1
      0005F1 A7               [ 4]  494         and     a
      0005F2                        495 delay_loop:
      0005F2 2B               [ 6]  496         dec     hl
      0005F3 ED 52            [15]  497         sbc     hl,de
      0005F5 20 FB            [12]  498         jr      nz,delay_loop
      0005F7 C9               [10]  499         ret
      0005F8                        500 action_left:
      0005F8 F5               [11]  501         push    af
      0005F9 2A D1 0D         [16]  502         ld      hl,(MAN_HEAD)
      0005FC 7E               [ 7]  503         ld      a,(hl)
      0005FD 36 20            [10]  504         ld      (hl),#' '
      0005FF 2B               [ 6]  505         dec     hl
      000600 22 D1 0D         [16]  506         ld      (MAN_HEAD),hl
      000603 77               [ 7]  507         ld      (hl),a
      000604 11 28 00         [10]  508         ld      de,#SCREEN_WIDTH
      000607 19               [11]  509         add     hl,de
      000608 23               [ 6]  510         inc     hl
      000609 7E               [ 7]  511         ld      a,(hl)
      00060A 36 20            [10]  512         ld      (hl),#' '
      00060C FE 9D            [ 7]  513         cp      #CHR_MAN_WALK
      00060E 28 04            [12]  514         jr      z,transition_left_stay
      000610 FE A1            [ 7]  515         cp      #CHR_MAN_STAY
      000612 28 04            [12]  516         jr      z,transition_left_walk
      000614                        517 transition_left_stay:
      000614 C6 04            [ 7]  518         add     a,#TRANSITION_MAN_WALK_STAY
      000616 18 02            [12]  519         jr      update_left
      000618                        520 transition_left_walk:
      000618 D6 04            [ 7]  521         sub     #TRANSITION_MAN_WALK_STAY
      00061A                        522 update_left:
      00061A 2B               [ 6]  523         dec     hl
      00061B 77               [ 7]  524         ld      (hl),a
      00061C 3E 07            [ 7]  525         ld      a,#GAMES_LINES+1
      00061E 01 4F EC         [10]  526         ld      bc,#BWS+(GAME_START_Y)*SCREEN_WIDTH-1
      000621                        527 loop_left_border_check:
      000621 C5               [11]  528         push    bc
      000622 60               [ 4]  529         ld      h,b
      000623 69               [ 4]  530         ld      l,c
      000624 ED 5B D1 0D      [20]  531         ld      de,(MAN_HEAD)
      000628 A7               [ 4]  532         and     a
      000629 ED 52            [15]  533         sbc     hl,de
      00062B 28 0E            [12]  534         jr      z,correct_left_border
      00062D                        535 left_border_next_adr:
      00062D C1               [10]  536         pop     bc
      00062E 11 78 00         [10]  537         ld      de,#3*SCREEN_WIDTH
      000631 60               [ 4]  538         ld      h,b
      000632 69               [ 4]  539         ld      l,c
      000633 19               [11]  540         add     hl,de
      000634 44               [ 4]  541         ld      b,h
      000635 4D               [ 4]  542         ld      c,l
      000636 3D               [ 4]  543         dec     a
      000637 20 E8            [12]  544         jr      nz,loop_left_border_check
      000639 F1               [10]  545         pop     af
      00063A C9               [10]  546         ret
      00063B                        547 correct_left_border:
      00063B 2A D1 0D         [16]  548         ld      hl,(MAN_HEAD)
      00063E 11 28 00         [10]  549         ld      de,#SCREEN_WIDTH
      000641 36 C6            [10]  550         ld      (hl),#CHR_WALL
      000643 19               [11]  551         add     hl,de
      000644 36 CC            [10]  552         ld      (hl),#CHR_MAN_HEAD
      000646 22 D1 0D         [16]  553         ld      (MAN_HEAD),hl
      000649 19               [11]  554         add     hl,de
      00064A 36 9D            [10]  555         ld      (hl),#CHR_MAN_WALK
      00064C C3 2D 06         [10]  556         jp      left_border_next_adr
      00064F                        557 action_right:
      00064F F5               [11]  558         push    af
      000650 2A D1 0D         [16]  559         ld      hl,(MAN_HEAD)
      000653 7E               [ 7]  560         ld      a,(hl)
      000654 36 20            [10]  561         ld      (hl),#' '
      000656 23               [ 6]  562         inc     hl
      000657 22 D1 0D         [16]  563         ld      (MAN_HEAD),hl
      00065A 77               [ 7]  564         ld      (hl),a
      00065B 11 28 00         [10]  565         ld      de,#SCREEN_WIDTH
      00065E 19               [11]  566         add     hl,de
      00065F 2B               [ 6]  567         dec     hl
      000660 7E               [ 7]  568         ld      a,(hl)
      000661 36 20            [10]  569         ld      (hl),#' '
      000663 FE 9D            [ 7]  570         cp      #CHR_MAN_WALK
      000665 28 04            [12]  571         jr      z,transition_stay
      000667 FE A1            [ 7]  572         cp      #CHR_MAN_STAY
      000669 28 04            [12]  573         jr      z,transition_walk
      00066B                        574 transition_stay:
      00066B C6 04            [ 7]  575         add     a,#TRANSITION_MAN_WALK_STAY
      00066D 18 02            [12]  576         jr      update_right
      00066F                        577 transition_walk:
      00066F D6 04            [ 7]  578         sub     #TRANSITION_MAN_WALK_STAY
      000671                        579 update_right:
      000671 23               [ 6]  580         inc     hl
      000672 77               [ 7]  581         ld      (hl),a
      000673 3E 07            [ 7]  582         ld      a,#GAMES_LINES+1
      000675 01 78 EC         [10]  583         ld      bc,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH+0
      000678                        584 loop_right_border_check:
      000678 C5               [11]  585         push    bc
      000679 60               [ 4]  586         ld      h,b
      00067A 69               [ 4]  587         ld      l,c
      00067B ED 5B D1 0D      [20]  588         ld      de,(MAN_HEAD)
      00067F A7               [ 4]  589         and     a
      000680 ED 52            [15]  590         sbc     hl,de
      000682 28 0E            [12]  591         jr      z,correct_right_border
      000684                        592 right_border_next_adr:
      000684 C1               [10]  593         pop     bc
      000685 11 78 00         [10]  594         ld      de,#3*SCREEN_WIDTH
      000688 60               [ 4]  595         ld      h,b
      000689 69               [ 4]  596         ld      l,c
      00068A 19               [11]  597         add     hl,de
      00068B 44               [ 4]  598         ld      b,h
      00068C 4D               [ 4]  599         ld      c,l
      00068D 3D               [ 4]  600         dec     a
      00068E 20 E8            [12]  601         jr      nz,loop_right_border_check
      000690 F1               [10]  602         pop     af
      000691 C9               [10]  603         ret
      000692                        604 correct_right_border:
      000692 2A D1 0D         [16]  605         ld      hl,(MAN_HEAD)
      000695 4E               [ 7]  606         ld      c,(hl)
      000696 36 9D            [10]  607         ld      (hl),#CHR_MAN_WALK
      000698 11 28 00         [10]  608         ld      de,#SCREEN_WIDTH
      00069B A7               [ 4]  609         and     a
      00069C ED 52            [15]  610         sbc     hl,de
      00069E 71               [ 7]  611         ld      (hl),c
      00069F 22 D1 0D         [16]  612         ld      (MAN_HEAD),hl
      0006A2 19               [11]  613         add     hl,de
      0006A3 19               [11]  614         add     hl,de
      0006A4 36 EE            [10]  615         ld      (hl),#CHR_MOVING_LINE
      0006A6 18 DC            [12]  616         jr      right_border_next_adr
      0006A8                        617 action_jump:
      0006A8 2A D1 0D         [16]  618         ld      hl,(MAN_HEAD)
      0006AB 11 28 00         [10]  619         ld      de,#SCREEN_WIDTH
      0006AE A7               [ 4]  620         and     a
      0006AF ED 52            [15]  621         sbc     hl,de
      0006B1 7E               [ 7]  622         ld      a,(hl)
      0006B2 FE 20            [ 7]  623         cp      #' '
      0006B4 28 0B            [12]  624         jr      z,jump_ok
      0006B6 FE EE            [ 7]  625         cp      #CHR_MOVING_LINE
      0006B8 28 2B            [12]  626         jr      z,jump_fail
      0006BA FE C6            [ 7]  627         cp      #CHR_WALL
      0006BC 28 27            [12]  628         jr      z,jump_fail
      0006BE C3 5B 04         [10]  629         jp      handle_fail_delay
      0006C1                        630 jump_ok:
      0006C1 D9               [ 4]  631         exx
      0006C2 CD C3 07         [17]  632         call    add_10_points
      0006C5 D9               [ 4]  633         exx
      0006C6 19               [11]  634         add     hl,de
      0006C7 36 20            [10]  635         ld      (hl),#' '
      0006C9 19               [11]  636         add     hl,de
      0006CA 36 20            [10]  637         ld      (hl),#' '
      0006CC 1E 78            [ 7]  638         ld      e,#3*SCREEN_WIDTH
      0006CE A7               [ 4]  639         and     a
      0006CF ED 52            [15]  640         sbc     hl,de
      0006D1 36 9D            [10]  641         ld      (hl),#CHR_MAN_WALK
      0006D3 1E 28            [ 7]  642         ld      e,#SCREEN_WIDTH
      0006D5 A7               [ 4]  643         and     a
      0006D6 ED 52            [15]  644         sbc     hl,de
      0006D8 36 CC            [10]  645         ld      (hl),#CHR_MAN_HEAD
      0006DA 22 D1 0D         [16]  646         ld      (MAN_HEAD),hl
      0006DD 3E 04            [ 7]  647         ld      a,#DELAY_COUNTER_JUMP
      0006DF 32 D3 0D         [13]  648         ld      (JUMP_DELAY),a
      0006E2 C3 5B 04         [10]  649         jp      handle_fail_delay
      0006E5                        650 jump_fail:
      0006E5 19               [11]  651         add     hl,de
      0006E6 2B               [ 6]  652         dec     hl
      0006E7 3E CD            [ 7]  653         ld      a,#CHR_SMOKE
      0006E9 77               [ 7]  654         ld      (hl),a
      0006EA 23               [ 6]  655         inc     hl
      0006EB 23               [ 6]  656         inc     hl
      0006EC 23               [ 6]  657         inc     hl
      0006ED 77               [ 7]  658         ld      (hl),a
      0006EE 2B               [ 6]  659         dec     hl
      0006EF 2B               [ 6]  660         dec     hl
      0006F0 36 20            [10]  661         ld      (hl),#' '
      0006F2 19               [11]  662         add     hl,de
      0006F3 36 97            [10]  663         ld      (hl),#CHR_MAN_SLEEP
      0006F5 23               [ 6]  664         inc     hl
      0006F6 36 C9            [10]  665         ld      (hl),#CHR_MAN_SLEEP_HEAD
      0006F8 3E 0B            [ 7]  666         ld      a,#DELAY_COUNTER
      0006FA 32 D4 0D         [13]  667         ld      (FAIL_DELAY),a
      0006FD 3A D0 0D         [13]  668         ld      a,(cnt_fail_jump)
      000700 FE 05            [ 7]  669         cp      #MAX_FAIL_COUNTER
      000702 CA 5B 04         [10]  670         jp      z,handle_fail_delay
      000705 3C               [ 4]  671         inc     a
      000706 32 D0 0D         [13]  672         ld      (cnt_fail_jump),a
      000709 C3 5B 04         [10]  673         jp      handle_fail_delay
      00070C                        674 check_fall_through:
      00070C 3A D3 0D         [13]  675         ld      a,(JUMP_DELAY)
      00070F FE 01            [ 7]  676         cp      #INITIAL_DELAY_COUNTER
      000711 C0               [11]  677         ret     nz
      000712                        678 check_for_trap:
      000712 2A D1 0D         [16]  679         ld      hl,(MAN_HEAD)
      000715 11 28 00         [10]  680         ld      de,#SCREEN_WIDTH
      000718 19               [11]  681         add     hl,de
      000719 19               [11]  682         add     hl,de
      00071A 7E               [ 7]  683         ld      a,(hl)
      00071B FE 20            [ 7]  684         cp      #' '
      00071D C0               [11]  685         ret     nz
      00071E 3A D4 0D         [13]  686         ld      a,(FAIL_DELAY)
      000721 FE 01            [ 7]  687         cp      #INITIAL_DELAY_COUNTER
      000723 28 15            [12]  688         jr      z,erase_player_fell_down
      000725 2A D1 0D         [16]  689         ld      hl,(MAN_HEAD)
      000728 3E 20            [ 7]  690         ld      a,#' '
      00072A 2B               [ 6]  691         dec     hl
      00072B 77               [ 7]  692         ld      (hl),a
      00072C 23               [ 6]  693         inc     hl
      00072D 23               [ 6]  694         inc     hl
      00072E 23               [ 6]  695         inc     hl
      00072F 77               [ 7]  696         ld      (hl),a
      000730 2B               [ 6]  697         dec     hl
      000731 19               [11]  698         add     hl,de
      000732 77               [ 7]  699         ld      (hl),a
      000733 23               [ 6]  700         inc     hl
      000734 77               [ 7]  701         ld      (hl),a
      000735 2B               [ 6]  702         dec     hl
      000736 2B               [ 6]  703         dec     hl
      000737 77               [ 7]  704         ld      (hl),a
      000738 18 08            [12]  705         jr      player_fell_down
      00073A                        706 erase_player_fell_down:
      00073A 2A D1 0D         [16]  707         ld      hl,(MAN_HEAD)
      00073D 3E 20            [ 7]  708         ld      a,#' '
      00073F 77               [ 7]  709         ld      (hl),a
      000740 19               [11]  710         add     hl,de
      000741 77               [ 7]  711         ld      (hl),a
      000742                        712 player_fell_down:
      000742 19               [11]  713         add     hl,de
      000743 19               [11]  714         add     hl,de
      000744 22 D1 0D         [16]  715         ld      (MAN_HEAD),hl
      000747 19               [11]  716         add     hl,de
      000748 36 97            [10]  717         ld      (hl),#CHR_MAN_SLEEP
      00074A 23               [ 6]  718         inc     hl
      00074B 36 C9            [10]  719         ld      (hl),#CHR_MAN_SLEEP_HEAD
      00074D 3E 08            [ 7]  720         ld      a,#DELAY_COUNTER2
      00074F 32 D4 0D         [13]  721         ld      (FAIL_DELAY),a
      000752 3A CF 0D         [13]  722         ld      a,(cnt_fail_trap)
      000755 FE 05            [ 7]  723         cp      #MAX_FAIL_COUNTER
      000757 C8               [11]  724         ret     z
      000758 3C               [ 4]  725         inc     a
      000759 32 CF 0D         [13]  726         ld      (cnt_fail_trap),a
      00075C C9               [10]  727         ret
      00075D                        728 check_level_finished:
      00075D 2A D1 0D         [16]  729         ld      hl,(MAN_HEAD)
      000760 11 6F EC         [10]  730         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+(SCREEN_WIDTH-9)
      000763 A7               [ 4]  731         and     a
      000764 ED 52            [15]  732         sbc     hl,de
      000766 20 39            [12]  733         jr      nz,round_end
      000768 3A D8 0D         [13]  734         ld      a,(LEVEL)
      00076B FE 08            [ 7]  735         cp      #MAX_LEVEL
      00076D 28 01            [12]  736         jr      z,new_level_set
      00076F 3C               [ 4]  737         inc     a
      000770                        738 new_level_set:
      000770 32 D8 0D         [13]  739         ld      (LEVEL),a
      000773 21 33 EF         [10]  740         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+(15+ALIGN_MIDDLE)
      000776 22 D1 0D         [16]  741         ld      (MAN_HEAD),hl
      000779 3E 28            [ 7]  742         ld      a,#SCREEN_WIDTH
      00077B 36 CC            [10]  743         ld      (hl),#CHR_MAN_HEAD
      00077D 85               [ 4]  744         add     a,l
      00077E 6F               [ 4]  745         ld      l,a
      00077F 36 A1            [10]  746         ld      (hl),#CHR_MAN_STAY
      000781 21 CF 0D         [10]  747         ld      hl,#cnt_fail_trap
      000784 3E 02            [ 7]  748         ld      a,#INITIAL_FAIL_COUNTER
      000786 77               [ 7]  749         ld      (hl),a
      000787 21 D0 0D         [10]  750         ld      hl,#cnt_fail_jump
      00078A 77               [ 7]  751         ld      (hl),a
      00078B 21 6D EC         [10]  752         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+(SCREEN_WIDTH-11)
      00078E 36 F8            [10]  753         ld      (hl),#CHR_LINE_TOP
      000790 23               [ 6]  754         inc     hl
      000791 36 95            [10]  755         ld      (hl),#CHR_ARROW_RIGHT_TOP
      000793 23               [ 6]  756         inc     hl
      000794 36 20            [10]  757         ld      (hl),#' '
      000796 21 95 EC         [10]  758         ld      hl,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH++(SCREEN_WIDTH-11)
      000799 36 9E            [10]  759         ld      (hl),#CHR_LINE_BOTTOM
      00079B 23               [ 6]  760         inc     hl
      00079C 36 93            [10]  761         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      00079E 23               [ 6]  762         inc     hl
      00079F 36 20            [10]  763         ld      (hl),#' '
      0007A1                        764 round_end:
      0007A1 13               [ 6]  765         inc     de
      0007A2 13               [ 6]  766         inc     de
      0007A3 2A D1 0D         [16]  767         ld      hl,(MAN_HEAD)
      0007A6 A7               [ 4]  768         and     a
      0007A7 ED 52            [15]  769         sbc     hl,de
      0007A9 3E 0B            [ 7]  770         ld      a,#DELAY_COUNTER
      0007AB C0               [11]  771         ret     nz
      0007AC 32 D4 0D         [13]  772         ld      (FAIL_DELAY),a
      0007AF 13               [ 6]  773         inc     de
      0007B0 ED 53 D1 0D      [20]  774         ld      (MAN_HEAD),de
      0007B4 3E 20            [ 7]  775         ld      a,#' '
      0007B6 1B               [ 6]  776         dec     de
      0007B7 12               [ 7]  777         ld      (de),a
      0007B8 83               [ 4]  778         add     a,e
      0007B9 5F               [ 4]  779         ld      e,a
      0007BA 12               [ 7]  780         ld      (de),a
      0007BB 6F               [ 4]  781         ld      l,a
      0007BC 19               [11]  782         add     hl,de
      0007BD 36 97            [10]  783         ld      (hl),#CHR_MAN_SLEEP
      0007BF 23               [ 6]  784         inc     hl
      0007C0 36 C9            [10]  785         ld      (hl),#CHR_MAN_SLEEP_HEAD
      0007C2 C9               [10]  786         ret
      0007C3                        787 add_10_points:
      0004C3                        788         SET_CURSOR_DE 0 23+POSDIFF_POINTS
      0007C3 C5               [11]    1         push    bc
      0007C4 11 20 01         [10]    2         ld      de,#(0+1)*256+(23+POSDIFF_POINTS+1)
      0007C7 0E 12            [ 7]    3         ld      c,#UP_SETCU
      0007C9 CD 05 00         [17]    4         call    BOS
      0007CC C1               [10]    5         pop     bc
      0007CD 2A D6 0D         [16]  789         ld      hl,(POINTS)
      0007D0 11 0A 00         [10]  790         ld      de,#10
      0007D3 19               [11]  791         add     hl,de
      0007D4 22 D6 0D         [16]  792         ld      (POINTS),hl
      0007D7 CD E0 07         [17]  793         call    print_decimal
      0007DA 3E 20            [ 7]  794         ld      a,#' '
      0007DC 32 24 EC         [13]  795         ld      (BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS+5),a
      0007DF C9               [10]  796         ret
      0007E0                        797 print_decimal:
      0007E0 E5               [11]  798         push    hl
      0007E1 01 10 27         [10]  799         ld      bc,#10000
      0007E4 CD 0C 08         [17]  800         call    get_decimal_digit
      0007E7 01 E8 03         [10]  801         ld      bc,#1000
      0007EA CD 0C 08         [17]  802         call    get_decimal_digit
      0007ED 01 64 00         [10]  803         ld      bc,#100
      0007F0 CD 0C 08         [17]  804         call    get_decimal_digit
      0007F3 01 0A 00         [10]  805         ld      bc,#10
      0007F6 CD 0C 08         [17]  806         call    get_decimal_digit
      0007F9 01 01 00         [10]  807         ld      bc,#1
      0007FC CD 0C 08         [17]  808         call    get_decimal_digit
      0004FF                        809         REMOVE_CURSOR;
      0007FF 2A 2D 00         [16]    1         ld      hl,(CURS)
      000802 36 20            [10]    2         ld      (hl),#' '
      000804 CB 94            [ 8]    3         res     2,h
      000806 CB BE            [15]    4         res     7,(hl)
      000808 CB D4            [ 8]    5         set     2,h
      00080A E1               [10]  810         pop     hl
      00080B C9               [10]  811         ret
      00080C                        812 get_decimal_digit:
      00080C AF               [ 4]  813         xor     a
      00080D                        814 decimal_loop:
      00080D A7               [ 4]  815         and     a
      00080E ED 42            [15]  816         sbc     hl,bc
      000810 3C               [ 4]  817         inc     a
      000811 D2 0D 08         [10]  818         jp      nc,decimal_loop
      000814 3D               [ 4]  819         dec     a
      000815 09               [11]  820         add     hl,bc
      000816 C6 30            [ 7]  821         add     a,#'0'
      000518                        822         OUTCH
      000818 C5               [11]    1         push    bc
      000819 D5               [11]    2         push    de
      00081A 0E 02            [ 7]    3         ld      c,#UP_CONSO
      00081C 5F               [ 4]    4         ld      e,a
      00081D CD 05 00         [17]    5         call    BOS
      000820 D1               [10]    6         pop     de
      000821 C1               [10]    7         pop     bc
      000822 C9               [10]  823         ret
      000823                        824 no_lives::
      000523                        825         PRST7
      000823 CD B0 0E         [17]    1         call    prst7
      000826 0C A0                  826         .db     0x0c,0xa0
      000828 21 7A 0E         [10]  827         ld      hl,#TXT_GAME_OVER
      00082B 11 0D EC         [10]  828         ld      de,#POS_GAME_OVER
      00082E 01 0F 00         [10]  829         ld      bc,#TXT_GAME_OVER_size
      000831 ED B0            [21]  830         ldir
      000833 0E 40            [ 7]  831         ld      c,#3*SCREEN_WIDTH-TXT_GAME_OVER_size-1+POSDIFF_YOUR_SCORE
      000835 7B               [ 4]  832         ld      a,e
      000836 81               [ 4]  833         add     a,c
      000837 5F               [ 4]  834         ld      e,a
      000838 0E 0C            [ 7]  835         ld      c,#TXT_YOUR_SCORE_size
      00083A ED B0            [21]  836         ldir
      00083C 0E 47            [ 7]  837         ld      c,#2*SCREEN_WIDTH-TXT_YOUR_SCORE_size+3
      00083E 7B               [ 4]  838         ld      a,e
      00083F 81               [ 4]  839         add     a,c
      000840 5F               [ 4]  840         ld      e,a
      000841 0E 09            [ 7]  841         ld      c,#TXT_HAZARD_size
      000843 ED B0            [21]  842         ldir
      000845 21 E0 ED         [10]  843         ld      hl,#BWS+15*SCREEN_WIDTH+0+(3*POSDIFF_YOUR_SCORE)
      000848 36 A0            [10]  844         ld      (hl),#CHR_MIDDLE_LINE
      00084A 11 E1 ED         [10]  845         ld      de,#BWS+15*SCREEN_WIDTH+1+(3*POSDIFF_YOUR_SCORE)
      00084D 0E 27            [ 7]  846         ld      c,#SCREEN_WIDTH-1
      00084F ED B0            [21]  847         ldir
      000851 2A D6 0D         [16]  848         ld      hl,(POINTS)
      000554                        849         SET_CURSOR_DE (5-POSDIFF_YOUR_SCORE_DY) (21+ALIGN_MIDDLE)
      000854 C5               [11]    1         push    bc
      000855 11 1A 03         [10]    2         ld      de,#((5-POSDIFF_YOUR_SCORE_DY)+1)*256+((21+ALIGN_MIDDLE)+1)
      000858 0E 12            [ 7]    3         ld      c,#UP_SETCU
      00085A CD 05 00         [17]    4         call    BOS
      00085D C1               [10]    5         pop     bc
      00085E CD E0 07         [17]  850         call    print_decimal
      000861 3A D8 0D         [13]  851         ld      a,(LEVEL)
      000864 C6 2F            [ 7]  852         add     a,#'0'-1
      000866 32 BB EC         [13]  853         ld      (BWS+7*SCREEN_WIDTH+23+ALIGN_MIDDLE+3*POSDIFF_YOUR_SCORE),a
      000869 ED 5B 5C 0E      [20]  854         ld      de,(HIGH_SCORE_TABLE01.points)
      00086D A7               [ 4]  855         and     a
      00086E ED 52            [15]  856         sbc     hl,de
      000870 D4 D8 09         [17]  857         call    nc,draw_new_highscore_box
      000573                        858         SET_CURSOR_HL (17-POSDIFF_YOUR_SCORE_DY) (3+ALIGN_MIDDLE)
      000873 D5               [11]    1         push    de
      000874 C5               [11]    2         push    bc
      000875 11 08 0F         [10]    3         ld      de,#((17-POSDIFF_YOUR_SCORE_DY)+1)*256+((3+ALIGN_MIDDLE)+1)
      000878 62               [ 4]    4         ld      h,d
      000879 6B               [ 4]    5         ld      l,e
      00087A 0E 12            [ 7]    6         ld      c,#UP_SETCU
      00087C CD 05 00         [17]    7         call    BOS
      00087F C1               [10]    8         pop     bc
      000880 D1               [10]    9         pop     de
      000581                        859         PRST7
      000881 CD B0 0E         [17]    1         call    prst7
      000884 20 49 4E 50 55 54 20   860         .ascis ' INPUT YOUR INITIALS: __ '
             59 4F 55 52 20 49 4E
             49 54 49 41 4C 53 3A
             20 5F 5F A0
                                    861         ; remove 2xcursor
      00089D 21 C4 EE         [10]  862         ld      hl,#BWS+17*SCREEN_WIDTH+28
      0008A0 36 20            [10]  863         ld      (hl),#' '
      0008A2 21 01 EC         [10]  864         ld      hl,#BWS+0*SCREEN_WIDTH+1
      0008A5 36 20            [10]  865         ld      (hl),#' '
      0008A7 21 4D EE         [10]  866         ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+25+ALIGN_MIDDLE
      0005AA                        867         CURSOR_DISABLE
      0008AA C5               [11]    1         push    bc
      0008AB 0E 1D            [ 7]    2         ld      c,#UP_DCU
      0008AD CD 05 00         [17]    3         call    BOS
      0008B0 C1               [10]    4         pop     bc
      0005B1                        868         INCH
      0008B1 AF               [ 4]    1         xor     a
      0008B2 32 25 00         [13]    2         ld      (KEYBU),a
      0008B5 0E 01            [ 7]    3         ld      c,#UP_CONSI
      0008B7 CD 05 00         [17]    4         call    BOS
      0008BA 77               [ 7]  869         ld      (hl),a
      0008BB 32 78 0E         [13]  870         ld      (INITIALS),a
      0008BE 23               [ 6]  871         inc     hl
      0005BF                        872         INCH
      0008BF AF               [ 4]    1         xor     a
      0008C0 32 25 00         [13]    2         ld      (KEYBU),a
      0008C3 0E 01            [ 7]    3         ld      c,#UP_CONSI
      0008C5 CD 05 00         [17]    4         call    BOS
      0008C8 77               [ 7]  873         ld      (hl),a
      0008C9 32 79 0E         [13]  874         ld      (INITIALS+1),a
      0008CC ED 5B D6 0D      [20]  875         ld      de,(POINTS)
      0008D0 06 05            [ 7]  876         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      0008D2 2A 5C 0E         [16]  877         ld      hl,(HIGH_SCORE_TABLE01.points)
      0008D5 A7               [ 4]  878         and     a
      0008D6 ED 52            [15]  879         sbc     hl,de
      0008D8 DA A7 09         [10]  880         jp      c,insert_score
      0008DB 05               [ 4]  881         dec     b
      0008DC 2A 61 0E         [16]  882         ld      hl,(HIGH_SCORE_TABLE02.points)
      0008DF A7               [ 4]  883         and     a
      0008E0 ED 52            [15]  884         sbc     hl,de
      0008E2 DA A7 09         [10]  885         jp      c,insert_score
      0008E5 05               [ 4]  886         dec     b
      0008E6 2A 66 0E         [16]  887         ld      hl,(HIGH_SCORE_TABLE03.points)
      0008E9 A7               [ 4]  888         and     a
      0008EA ED 52            [15]  889         sbc     hl,de
      0008EC DA A7 09         [10]  890         jp      c,insert_score
      0008EF 05               [ 4]  891         dec     b
      0008F0 2A 6B 0E         [16]  892         ld      hl,(HIGH_SCORE_TABLE04.points)
      0008F3 A7               [ 4]  893         and     a
      0008F4 ED 52            [15]  894         sbc     hl,de
      0008F6 DA A7 09         [10]  895         jp      c,insert_score
      0008F9 05               [ 4]  896         dec     b
      0008FA 2A 70 0E         [16]  897         ld      hl,(HIGH_SCORE_TABLE05.points)
      0008FD A7               [ 4]  898         and     a
      0008FE ED 52            [15]  899         sbc     hl,de
      000900 DA A7 09         [10]  900         jp      c,insert_score
      000903                        901 print_highscore_table::
      000903 06 05            [ 7]  902         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      000905 11 5A 0E         [10]  903         ld      de,#HIGH_SCORE_TABLE01
      000908 21 8A EE         [10]  904         ld      hl,#BWS+(20-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+6+ALIGN_MIDDLE
      00090B                        905 print_highscore_entry:
      00090B 3E 36            [ 7]  906         ld      a,#'6'
      00090D 90               [ 4]  907         sub     b
      00090E 77               [ 7]  908         ld      (hl),a
      00090F 1A               [ 7]  909         ld      a,(de)
      000910 23               [ 6]  910         inc     hl
      000911 23               [ 6]  911         inc     hl
      000912 23               [ 6]  912         inc     hl
      000913 77               [ 7]  913         ld      (hl),a
      000914 23               [ 6]  914         inc     hl
      000915 13               [ 6]  915         inc     de
      000916 1A               [ 7]  916         ld      a,(de)
      000917 77               [ 7]  917         ld      (hl),a
      000918 3E 2E            [ 7]  918         ld      a,#'.'
      00091A 23               [ 6]  919         inc     hl
      00091B 23               [ 6]  920         inc     hl
      00091C 77               [ 7]  921         ld      (hl),a
      00091D 23               [ 6]  922         inc     hl
      00091E 77               [ 7]  923         ld      (hl),a
      00091F 23               [ 6]  924         inc     hl
      000920 77               [ 7]  925         ld      (hl),a
      000921 23               [ 6]  926         inc     hl
      000922 23               [ 6]  927         inc     hl
      000623                        928         SET_CURSOR
      000923 CD BF 0E         [17]    1         call    set_cursor
      000926 13               [ 6]  929         inc     de
      000927 1A               [ 7]  930         ld      a,(de)
      000928 6F               [ 4]  931         ld      l,a
      000929 13               [ 6]  932         inc     de
      00092A 1A               [ 7]  933         ld      a,(de)
      00092B 67               [ 4]  934         ld      h,a
      00092C 13               [ 6]  935         inc     de
      00092D C5               [11]  936         push    bc
      00092E D5               [11]  937         push    de
      00092F CD E0 07         [17]  938         call    print_decimal
      000932 D1               [10]  939         pop     de
      000933 C1               [10]  940         pop     bc
      000634                        941         REMOVE_CURSOR
      000934 2A 2D 00         [16]    1         ld      hl,(CURS)
      000937 36 20            [10]    2         ld      (hl),#' '
      000939 CB 94            [ 8]    3         res     2,h
      00093B CB BE            [15]    4         res     7,(hl)
      00093D CB D4            [ 8]    5         set     2,h
      00093F 23               [ 6]  942         inc     hl
      000940 23               [ 6]  943         inc     hl
      000941 23               [ 6]  944         inc     hl
      000942 36 30            [10]  945         ld      (hl),#'0'
      000944 23               [ 6]  946         inc     hl
      000945 1A               [ 7]  947         ld      a,(de)
      000946 C6 2F            [ 7]  948         add     a,#'0'-1
      000948 77               [ 7]  949         ld      (hl),a
      000949 13               [ 6]  950         inc     de
      00094A 3E 15            [ 7]  951         ld      a,#SCREEN_WIDTH-19
      00094C 85               [ 4]  952         add     a,l
      00094D 6F               [ 4]  953         ld      l,a
      00094E 3E 00            [ 7]  954         ld      a,#ZERO
      000950 8C               [ 4]  955         adc     a,h
      000951 67               [ 4]  956         ld      h,a
      000952 10 B7            [13]  957         djnz    print_highscore_entry
      000654                        958         SET_CURSOR_HL (29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY) (9+ALIGN_MIDDLE)
      000954 D5               [11]    1         push    de
      000955 C5               [11]    2         push    bc
      000956 11 0E 17         [10]    3         ld      de,#((29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)+1)*256+((9+ALIGN_MIDDLE)+1)
      000959 62               [ 4]    4         ld      h,d
      00095A 6B               [ 4]    5         ld      l,e
      00095B 0E 12            [ 7]    6         ld      c,#UP_SETCU
      00095D CD 05 00         [17]    7         call    BOS
      000960 C1               [10]    8         pop     bc
      000961 D1               [10]    9         pop     de
      000662                        959         PRST7
      000962 CD B0 0E         [17]    1         call    prst7
      000965 4E 45 57 20 47 41 4D   960         .ascii  'NEW GAME ? Y/N'
             45 20 3F 20 59 2F 4E
      000973 A0                     961         .db     0xa0
      000974 21 8C EF         [10]  962         ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000977 36 20            [10]  963         ld      (hl),#' '
      000679                        964         CURSOR_DISABLE
      000979 C5               [11]    1         push    bc
      00097A 0E 1D            [ 7]    2         ld      c,#UP_DCU
      00097C CD 05 00         [17]    3         call    BOS
      00097F C1               [10]    4         pop     bc
      000980                        965 m_070a:
      000980                        966 ask_exit_game:
      000680                        967         INCH
      000980 AF               [ 4]    1         xor     a
      000981 32 25 00         [13]    2         ld      (KEYBU),a
      000984 0E 01            [ 7]    3         ld      c,#UP_CONSI
      000986 CD 05 00         [17]    4         call    BOS
      000989 FE 59            [ 7]  968         cp      #'Y'
      00098B CA 9D 03         [10]  969         jp      z,new_game
      00098E FE 4E            [ 7]  970         cp      #'N'
      000990 20 EE            [12]  971         jr      nz,ask_exit_game
      000992                        972 exit_game:
      000692                        973         PRST7
      000992 CD B0 0E         [17]    1         call    prst7
      000995 0C                     974         .db     0x0c
      000996 4A 75 6D 70 69 6E 67   975         .ascii  'Jumping Jack'
             20 4A 61 63 6B
      0009A2 0D 8D                  976         .db     0x0d,0x8d
      0006A4                        977         END_PROGRAM
      0009A4 C3 03 F0         [10]    1         jp      WBOOT
      0009A7                        978 insert_score:
      0009A7 D5               [11]  979         push    de
      0009A8 11 73 0E         [10]  980         ld      de,#HIGH_SCORE_TABLE_TMP
      0009AB 21 6E 0E         [10]  981         ld      hl,#HIGH_SCORE_TABLE05
      0009AE                        982 move_table_entry:
      0009AE C5               [11]  983         push    bc
      0009AF 01 05 00         [10]  984         ld      bc,#HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05
      0009B2 ED B0            [21]  985         ldir
      0009B4 EB               [ 4]  986         ex      de,hl
      0009B5 0E 0A            [ 7]  987         ld      c,#2*(HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05)
      0009B7 A7               [ 4]  988         and     a
      0009B8 ED 42            [15]  989         sbc     hl,bc
      0009BA EB               [ 4]  990         ex      de,hl
      0009BB A7               [ 4]  991         and     a
      0009BC ED 42            [15]  992         sbc     hl,bc
      0009BE C1               [10]  993         pop     bc
      0009BF 10 ED            [13]  994         djnz    move_table_entry
      0009C1 3A 78 0E         [13]  995         ld      a,(INITIALS)
      0009C4 12               [ 7]  996         ld      (de),a
      0009C5 13               [ 6]  997         inc     de
      0009C6 3A 79 0E         [13]  998         ld      a,(INITIALS+1)
      0009C9 12               [ 7]  999         ld      (de),a
      0009CA EB               [ 4] 1000         ex      de,hl
      0009CB D1               [10] 1001         pop     de
      0009CC 23               [ 6] 1002         inc     hl
      0009CD 73               [ 7] 1003         ld      (hl),e
      0009CE 23               [ 6] 1004         inc     hl
      0009CF 72               [ 7] 1005         ld      (hl),d
      0009D0 23               [ 6] 1006         inc     hl
      0009D1 3A D8 0D         [13] 1007         ld      a,(LEVEL)
      0009D4 77               [ 7] 1008         ld      (hl),a
      0009D5 C3 03 09         [10] 1009         jp      print_highscore_table
      0009D8                       1010 draw_new_highscore_box:
      0009D8 21 FB EC         [10] 1011         ld      hl,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      0009DB 36 2A            [10] 1012         ld      (hl),#'*'
      0009DD 11 FC EC         [10] 1013         ld      de,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+8+ALIGN_MIDDLE
      0009E0 01 11 00         [10] 1014         ld      bc,#TXT_NEW_HIGH_SCORE_size-1
      0009E3 ED B0            [21] 1015         ldir
      0009E5 0E 8F            [ 7] 1016         ld      c,#4*SCREEN_WIDTH-TXT_NEW_HIGH_SCORE_size+1
      0009E7 09               [11] 1017         add     hl,bc
      0009E8 EB               [ 4] 1018         ex      de,hl
      0009E9 09               [11] 1019         add     hl,bc
      0009EA EB               [ 4] 1020         ex      de,hl
      0009EB 0E 11            [ 7] 1021         ld      c,#TXT_NEW_HIGH_SCORE_size-1
      0009ED 36 2A            [10] 1022         ld      (hl),#'*'
      0009EF ED B0            [21] 1023         ldir
      0009F1 11 4B ED         [10] 1024         ld      de,#BWS+(11-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      0009F4 21 9E 0E         [10] 1025         ld      hl,#TXT_NEW_HIGH_SCORE
      0009F7 0E 12            [ 7] 1026         ld      c,#TXT_NEW_HIGH_SCORE_size
      0009F9 ED B0            [21] 1027         ldir
      0009FB 1E 23            [ 7] 1028         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      0009FD 3E 2A            [ 7] 1029         ld      a,#'*'
      0009FF 12               [ 7] 1030         ld      (de),a
      000A00 1E 34            [ 7] 1031         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000A02 12               [ 7] 1032         ld      (de),a
      000A03 1E 73            [ 7] 1033         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      000A05 12               [ 7] 1034         ld      (de),a
      000A06 1E 84            [ 7] 1035         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000A08 12               [ 7] 1036         ld      (de),a
      000A09 C9               [10] 1037         ret
      000A0A                       1038 TOP_IMAGE:
                                   1039         ; line 1
      00070A                       1040         SCREEN_POS
      000A0A 20 20 20 20              1         .ascii '    '
      000A0E AE 9E 9E 9E 9E 9E 9E  1041         .db     0xae,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e ;........
             9E
      000A16 9E 9E AD 20 20 20 20  1042         .db     0x9e,0x9e,0xad,0x20,0x20,0x20,0x20,0x20 ;..-     
             20
      000A1E 20 20 20 20 20 20 20  1043         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000A26 20 20 20 20 20 20 20  1044         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00072E                       1045         SCREEN_POS
      000A2E 20 20 20 20              1         .ascii '    '
                                   1046         
                                   1047         ; line 2
      000732                       1048         SCREEN_POS
      000A32 20 20 20 20              1         .ascii '    '
      000A36 9F B9 B6 B3 B2 B6 B8  1049         .db     0x9f,0xb9,0xb6,0xb3,0xb2,0xb6,0xb8,0x20 ;.963268 
             20
      000A3E BD B0 C0 20 20 20 20  1050         .db     0xbd,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;=0@     
             20
      000A46 20 20 20 20 20 20 20  1051         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      000A4E 20 20 20 20 20 20 20  1052         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000756                       1053         SCREEN_POS
      000A56 20 20 20 20              1         .ascii '    '
                                   1054 
                                   1055         ; line 3
      00075A                       1056         SCREEN_POS
      000A5A 20 20 20 20              1         .ascii '    '
      000A5E 9F B8 B7 20 B5 20 20  1057         .db     0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
             20
      000A66 B5 20 C0 20 20 20 20  1058         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      000A6E 20 20 20 20 20 20 20  1059         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      000A76 20 20 20 20 B7 B7 20  1060         .db     0x20,0x20,0x20,0x20,0xb7,0xb7,0x20,0x20 ;    77  
             20
      00077E                       1061         SCREEN_POS
      000A7E 20 20 20 20              1         .ascii '    '
                                   1062 
                                   1063         ; line 4
      000782                       1064         SCREEN_POS
      000A82 20 20 20 20              1         .ascii '    '
      000A86 9F B3 20 B4 B5 20 B2  1065         .db     0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
             20
      000A8E B5 20 C0 20 20 20 20  1066         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      000A96 20 20 20 20 20 20 20  1067         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000A9E B6 B7 20 B9 B2 B2 B8  1068         .db     0xb6,0xb7,0x20,0xb9,0xb2,0xb2,0xb8,0x20 ;67 9228 
             20
      0007A6                       1069         SCREEN_POS
      000AA6 20 20 20 20              1         .ascii '    '
                                   1070 
                                   1071         ; line 5
      0007AA                       1072         SCREEN_POS
      000AAA 20 20 20 20              1         .ascii '    '
      000AAE 9F B1 B6 20 20 B6 B0  1073         .db     0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
             20
      000AB6 B6 B0 C0 20 20 20 20  1074         .db     0xb6,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;60@     
             20
      000ABE 20 20 B2 B3 20 20 20  1075         .db     0x20,0x20,0xb2,0xb3,0x20,0x20,0x20,0x20 ;  23    
             20
      000AC6 20 BA A0 B4 B4 A0 B5  1076         .db     0x20,0xba,0xa0,0xb4,0xb4,0xa0,0xb5,0x20 ; : 44 5 
             20
      0007CE                       1077         SCREEN_POS
      000ACE 20 20 20 20              1         .ascii '    '
                                   1078 
                                   1079         ; line 6
      0007D2                       1080         SCREEN_POS
      000AD2 20 20 20 20              1         .ascii '    '
      000AD6 9F 70 72 65 73 65 6E  1081         .db     0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
             74
      000ADE 73 3A C0 20 20 20 20  1082         .db     0x73,0x3a,0xc0,0x20,0x20,0x20,0x20,0x20 ;s:@     
             20
      000AE6 20 B2 B0 B1 B3 20 20  1083         .db     0x20,0xb2,0xb0,0xb1,0xb3,0x20,0x20,0xb7 ; 2013  7
             B7
      000AEE B6 B1 B3 B8 B1 B1 B9  1084         .db     0xb6,0xb1,0xb3,0xb8,0xb1,0xb1,0xb9,0x20 ;6138119 
             20
      0007F6                       1085         SCREEN_POS
      000AF6 20 20 20 20              1         .ascii '    '
                                   1086 
                                   1087         ; line 7
      0007FA                       1088         SCREEN_POS
      000AFA 20 20 20 20              1         .ascii '    '
      000AFE AB F8 F8 F8 F8 F8 F8  1089         .db     0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
             F8
      000B06 F8 F8 AC 20 20 20 20  1090         .db     0xf8,0xf8,0xac,0x20,0x20,0x20,0x20,0x20 ;xx,     
             20
      000B0E 20 B0 20 20 B5 B7 B6  1091         .db     0x20,0xb0,0x20,0x20,0xb5,0xb7,0xb6,0x20 ; 0  576 
             20
      000B16 20 20 B1 B3 B6 BC 20  1092         .db     0x20,0x20,0xb1,0xb3,0xb6,0xbc,0x20,0x20 ;  136<  
             20
      00081E                       1093         SCREEN_POS
      000B1E 20 20 20 20              1         .ascii '    '
                                   1094 
                                   1095         ; line 8
      000822                       1096         SCREEN_POS
      000B22 20 20 20 20              1         .ascii '    '
      000B26 20 20 20 20 20 20 20  1097         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B2E 20 20 20 20 20 20 20  1098         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B36 B1 B6 B6 B6 B6 20 20  1099         .db     0xb1,0xb6,0xb6,0xb6,0xb6,0x20,0x20,0x20 ;16666   
             20
      000B3E 20 20 20 B1 B9 20 20  1100         .db     0x20,0x20,0x20,0xb1,0xb9,0x20,0x20,0x20 ;   19   
             20
      000846                       1101          SCREEN_POS
      000B46 20 20 20 20              1         .ascii '    '
                                   1102 
                                   1103         ; line 9
      00084A                       1104         Z1013_LINE
                                   1105 
                                   1106         ; line 10
      00084A                       1107         Z1013_LINE
                                   1108 
                                   1109         ; line 11
      00084A                       1110         SCREEN_POS
      000B4A 20 20 20 20              1         .ascii '    '
      000B4E 20 20 20 20 20 20 20  1111         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B56 20 20 20 20 20 20 20  1112         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B5E 20 20 20 20 20 20 20  1113         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B66 20 20 20 20 20 20 20  1114         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00086E                       1115          SCREEN_POS
      000B6E 20 20 20 20              1         .ascii '    '
                                   1116 
                                   1117         ; line 12
      000872                       1118         SCREEN_POS
      000B72 20 20 20 20              1         .ascii '    '
      000B76 20 20 20 B4 20 20 20  1119         .db     0x20,0x20,0x20,0xb4,0x20,0x20,0x20,0x20 ;   4    
             20
      000B7E 20 20 20 20 B0 20 20  1120         .db     0x20,0x20,0x20,0x20,0xb0,0x20,0x20,0x20 ;    0   
             20
      000B86 20 20 20 20 20 20 B4  1121         .db     0x20,0x20,0x20,0x20,0x20,0x20,0xb4,0x20 ;      4 
             20
      000B8E 20 20 20 20 B4 B2 20  1122         .db     0x20,0x20,0x20,0x20,0xb4,0xb2,0x20,0x20 ;    42  
             20
      000896                       1123          SCREEN_POS
      000B96 20 20 20 20              1         .ascii '    '
                                   1124 
                                   1125         ; line 13
      00089A                       1126         SCREEN_POS
      000B9A 20 20 20 20              1         .ascii '    '
      000B9E 20 20 20 B4 B4 B5 B5  1127         .db     0x20,0x20,0x20,0xb4,0xb4,0xb5,0xb5,0xbd ;   4455=
             BD
      000BA6 BD B5 B6 B3 B4 BC BD  1128         .db     0xbd,0xb5,0xb6,0xb3,0xb4,0xbc,0xbd,0xb2 ;=5634<=2
             B2
      000BAE B6 B3 20 20 20 20 B4  1129         .db     0xb6,0xb3,0x20,0x20,0x20,0x20,0xb4,0xb1 ;63    41
             B1
      000BB6 B8 B2 B6 B3 BB B0 20  1130         .db     0xb8,0xb2,0xb6,0xb3,0xbb,0xb0,0x20,0x20 ;8263;0  
             20
      0008BE                       1131          SCREEN_POS
      000BBE 20 20 20 20              1         .ascii '    '
                                   1132 
                                   1133         ; line 14
      0008C2                       1134         SCREEN_POS
      000BC2 20 20 20 20              1         .ascii '    '
      000BC6 20 B3 20 B4 B4 B5 B5  1135         .db     0x20,0xb3,0x20,0xb4,0xb4,0xb5,0xb5,0xb5 ; 3 44555
             B5
      000BCE B5 B5 B7 B0 B4 B4 B5  1136         .db     0xb5,0xb5,0xb7,0xb0,0xb4,0xb4,0xb5,0xb1 ;55704451
             B1
      000BD6 B7 B4 20 20 B3 20 B4  1137         .db     0xb7,0xb4,0x20,0x20,0xb3,0x20,0xb4,0xb9 ;74  3 49
             B9
      000BDE BD B5 20 B3 B4 B8 20  1138         .db     0xbd,0xb5,0x20,0xb3,0xb4,0xb8,0x20,0x20 ;=5 348  
             20
      0008E6                       1139          SCREEN_POS
      000BE6 20 20 20 20              1         .ascii '    '
                                   1140 
                                   1141         ; line 15
      0008EA                       1142         SCREEN_POS
      000BEA 20 20 20 20              1         .ascii '    '
      000BEE 20 B8 B7 B0 B1 B0 B1  1143         .db     0x20,0xb8,0xb7,0xb0,0xb1,0xb0,0xb1,0xb1 ; 8701011
             B1
      000BF6 B1 B5 20 20 B0 B0 B1  1144         .db     0xb1,0xb5,0x20,0x20,0xb0,0xb0,0xb1,0xb1 ;15  0011
             B1
      000BFE B7 B0 20 20 B8 B7 B0  1145         .db     0xb7,0xb0,0x20,0x20,0xb8,0xb7,0xb0,0xb1 ;70  8701
             B1
      000C06 B6 20 B6 20 B0 20 B0  1146         .db     0xb6,0x20,0xb6,0x20,0xb0,0x20,0xb0,0x20 ;6 6 0 0 
             20
      00090E                       1147          SCREEN_POS
      000C0E 20 20 20 20              1         .ascii '    '
                                   1148 
                                   1149         ; line 16
      000912                       1150         SCREEN_POS
      000C12 20 20 20 20              1         .ascii '    '
      000C16 20 20 20 20 20 20 20  1151         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C1E 20 20 20 20 20 20 20  1152         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C26 20 20 20 20 20 20 20  1153         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C2E 20 20 20 20 20 20 20  1154         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000936                       1155         SCREEN_POS
      000C36 20 20 20 20              1         .ascii '    '
                                   1156 
      000C3A                       1157 HINT_RIGHT:
      000C3A 2D 3E 20 2E 2E 2E 20  1158         .db     0x2d,0x3e,0x20,0x2e,0x2e,0x2e,0x20,0x52 ;-> ... R
             52
      000C42 69 67 68 74           1159         .db     0x69,0x67,0x68,0x74                     ;ight
      000C46                       1160 HINT_LEFT:
      000C46 3C 2D 20 2E 2E 2E 2E  1161         .db     0x3c,0x2d,0x20,0x2e,0x2e,0x2e,0x2e,0x20 ;<- .... 
             20
      000C4E 4C 65 66 74           1162         .db     0x4c,0x65,0x66,0x74                     ;Left
      000C52                       1163 HINT_JUMP:
      000C52 53 50 20 2E 2E 2E 2E  1164         .ascii  'SP .... Jump'
             20 4A 75 6D 70
      000C5E                       1165 HINT_PLAY:
      000C5E 50 20 2E 2E 2E 2E 2E  1166         .ascii  'P ..... Play'
             20 50 6C 61 79
      000C6A                       1167 HINT_EXIT:
      000C6A 45 20 2E 2E 2E 2E 2E  1168         .ascii  'E ..... Exit'
             20 45 78 69 74
      000C76                       1169 HINT_COPYRIGHT:
      000C76 43 20 31 39 38 36 20  1170         .ascii  'C 1986 Software Center Ilmenau'
             53 6F 66 74 77 61 72
             65 20 43 65 6E 74 65
             72 20 49 6C 6D 65 6E
             61 75
      000C94                       1171 HINT_NAME:
      000C94 47 2E 46 69 73 63 68  1172         .ascii  'G.Fischer & CO'
             65 72 20 26 20 43 4F
      000CA2                       1173 HINT_YEAR:
      000CA2 20 20 32 30 32 30 20  1174         .ascii  '  2020 Version'
             56 65 72 73 69 6F 6E
      000CB0                       1175 VERSION_INFO:
      000CB0 20 31 2E 31 20        1176         .db     0x20,0x31,0x2e,0x31,0x20                ; 1.1 
      000CB5                       1177 LINE_BUFFER:
      000CB5 EE EE EE EE EE EE EE  1178         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CBD EE EE EE EE EE EE EE  1179         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CC5 EE EE EE EE EE EE EE  1180         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CCD EE EE EE EE EE EE EE  1181         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CD5 EE EE EE EE EE EE EE  1182         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CDD EE EE EE EE EE EE EE  1183         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CE5 EE EE EE EE EE EE EE  1184         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CED EE EE EE EE EE EE EE  1185         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CF5 20 20 20 EE EE EE EE  1186         .db     0x20,0x20,0x20,0xee,0xee,0xee,0xee,0xee ;   nnnnn
             EE
      000CFD EE EE EE EE EE EE EE  1187         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D05 EE EE EE EE EE 20 20  1188         .db     0xee,0xee,0xee,0xee,0xee,0x20,0x20,0x20 ;nnnnn   
             20
      000D0D 20 20 EE EE EE EE EE  1189         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000D15 EE EE EE EE EE EE EE  1190         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D1D EE 20 20 20 EE EE EE  1191         .db     0xee,0x20,0x20,0x20,0xee,0xee,0xee,0xee ;n   nnnn
             EE
      000D25 EE EE EE EE EE EE EE  1192         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D2D EE EE EE 20 20 20 EE  1193         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D35 EE EE EE EE EE EE EE  1194         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D3D EE EE EE EE 20 20 20  1195         .db     0xee,0xee,0xee,0xee,0x20,0x20,0x20,0xee ;nnnn   n
             EE
      000D45 EE EE EE EE EE EE EE  1196         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0x20 ;nnnnnnn 
             20
      000D4D 20 20 EE EE EE EE EE  1197         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000D55 EE EE EE 20 20 20 EE  1198         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D5D EE EE EE EE EE EE EE  1199         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D65 EE EE EE EE EE EE EE  1200         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D6D EE EE EE EE EE EE EE  1201         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D75 EE EE EE 20 20 20 EE  1202         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D7D EE EE EE EE EE EE EE  1203         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D85 EE EE EE EE EE EE EE  1204         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D8D EE EE EE EE EE EE 20  1205         .db     0xee,0xee,0xee,0xee,0xee,0xee,0x20,0x20 ;nnnnnn  
             20
      000D95 20 EE EE EE EE EE EE  1206         .db     0x20,0xee,0xee,0xee,0xee,0xee,0xee,0xee ; nnnnnnn
             EE
      000D9D EE EE EE EE EE EE EE  1207         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DA5 EE EE EE EE EE EE EE  1208         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DAD EE EE EE EE EE EE EE  1209         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DB5 EE EE EE EE EE EE EE  1210         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DBD EE EE EE EE EE EE EE  1211         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee      ;nnnnnnn
                                   1212 ; unchecked data source
      000DC4 EE                    1213         .db     0xee                                    ;n
      000DC5                       1214 OFFSET_HOLES:
      000DC5 58 7C 41 98 56        1215         .db     0x58,0x7c,0x41,0x98,0x56                ;X|A.V
      000DCA                       1216 OFFSET_HOLES_JUMP_PENALTY:
      000DCA 8B A2 68 C2 DD        1217         .db     0x8b,0xa2,0x68,0xc2,0xdd                ;."hB]
      000DCF                       1218 cnt_fail_trap:
      000DCF 05                    1219         .db     5
      000DD0                       1220 cnt_fail_jump:
      000DD0 05                    1221         .db     5
      000DD1                       1222 MAN_HEAD:
      000DD1 32 EF                 1223         .dw     BWS+(GAME_START_Y+(8-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      000DD3                       1224 JUMP_DELAY:
      000DD3 01                    1225         .db     1
      000DD4                       1226 FAIL_DELAY:
      000DD4 01                    1227         .db     1
      000DD5                       1228 LIVES:
      000DD5 06                    1229         .db     6
      000DD6                       1230 POINTS:
      000DD6 00 00                 1231         .dw     0
      000DD8                       1232 LEVEL:
      000DD8 01                    1233         .db     1
      000DD9                       1234 counter:
      000DD9 01                    1235         .db     1
      000DDA                       1236 TXT_JUMP:
      000DDA 2A 20 4A 55 4D 50 49  1237         .ascii  '* JUMPING JACK *'
             4E 47 20 4A 41 43 4B
             20 2A
      000DEA                       1238 MONSTER_PTR:
      000DEA DF ED                 1239         .dw     BWS+(GAME_START_Y+3*3+1)*SCREEN_WIDTH-1
      000DEC 30 EE                 1240         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+0
      000DEE 31 EE                 1241         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000DF0 32 EE                 1242         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
                                   1243 
      000DF2 D5 EC                 1244         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
      000DF4 D6 EC                 1245         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+14
      000DF6 D7 EC                 1246         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+15
      000DF8 D8 EC                 1247         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+16
                                   1248 
      000DFA 31 EE                 1249         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000DFC 32 EE                 1250         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
      000DFE 33 EE                 1251         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+3
      000E00 34 EE                 1252         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+4
                                   1253 
      000E02 C1 EE                 1254         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+25
      000E04 C2 EE                 1255         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+26
      000E06 C3 EE                 1256         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+27
      000E08 C4 EE                 1257         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+28
                                   1258 
      000E0A D2 EC                 1259         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+10
      000E0C D3 EC                 1260         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+11
      000E0E D4 EC                 1261         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+12
      000E10 D5 EC                 1262         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
                                   1263 
      000E12 B3 EE                 1264         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+11
      000E14 B4 EE                 1265         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+12
      000E16 B5 EE                 1266         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+13
      000E18 B6 EE                 1267         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14
                                   1268 
      000E1A BD EE                 1269         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+21
      000E1C BE EE                 1270         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+22
      000E1E BF EE                 1271         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+23
      000E20 C0 EE                 1272         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+24
      000E22                       1273 MONSTER_IMG:
      000E22 94 90 8B 90 8B 91 97  1274         .db     0x94,0x90,0x8b,0x90,0x8b,0x91,0x97,0x91 ;........
             91
      000E2A 19 B5 20 BE 20 BF 20  1275         .db     0x19,0xb5,0x20,0xbe,0x20,0xbf,0x20,0xae ;.5 > ? .
             AE
      000E32 92 96 A0 A0 A0 A0 88  1276         .db     0x92,0x96,0xa0,0xa0,0xa0,0xa0,0x88,0xc1 ;..    .A
             C1
      000E3A 20 95 20 B7 1E FF 20  1277         .db     0x20,0x95,0x20,0xb7,0x1e,0xff,0x20,0x92 ; . 7.. .
             92
      000E42 17 8C F9 8C 1D 1F FC  1278         .db     0x17,0x8c,0xf9,0x8c,0x1d,0x1f,0xfc,0x8c ;..y...|.
             8C
      000E4A 92 96 83 82 95 93 20  1279         .db     0x92,0x96,0x83,0x82,0x95,0x93,0x20,0x20 ;......  
             20
      000E52 20 20 20 20 20 20 20  1280         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000E5A                       1281 HIGH_SCORE_TABLE01:
      000E5A 5F 5F                 1282         .ascii '__'
      000E5C                       1283 HIGH_SCORE_TABLE01.points:
      000E5C 00 00                 1284         .dw     0
      000E5E                       1285 HIGH_SCORE_TABLE01.level:
      000E5E 01                    1286         .db     1
      000E5F                       1287 HIGH_SCORE_TABLE02:
      000E5F 5F 5F                 1288         .ascii '__'
      000E61                       1289 HIGH_SCORE_TABLE02.points:
      000E61 00 00                 1290         .dw     0
      000E63                       1291 HIGH_SCORE_TABLE02.level:
      000E63 01                    1292         .db     1
      000E64                       1293 HIGH_SCORE_TABLE03:
      000E64 5F 5F                 1294         .ascii '__'
      000E66                       1295 HIGH_SCORE_TABLE03.points:
      000E66 00 00                 1296         .dw     0
      000E68                       1297 HIGH_SCORE_TABLE03.level:
      000E68 01                    1298         .db     1
      000E69                       1299 HIGH_SCORE_TABLE04:
      000E69 5F 5F                 1300         .ascii '__'
      000E6B                       1301 HIGH_SCORE_TABLE04.points:
      000E6B 00 00                 1302         .dw     0
      000E6D                       1303 HIGH_SCORE_TABLE04.level:
      000E6D 01                    1304         .db     1
      000E6E                       1305 HIGH_SCORE_TABLE05:
      000E6E 5F 5F                 1306         .ascii '__'
      000E70                       1307 HIGH_SCORE_TABLE05.points:
      000E70 00 00                 1308         .dw     0
      000E72                       1309 HIGH_SCORE_TABLE05.level:
      000E72 01                    1310         .db     1
      000E73                       1311 HIGH_SCORE_TABLE_TMP:
      000E73 5F 5F                 1312         .ascii '__'
      000E75                       1313 HIGH_SCORE_TABLE_TMP.points:
      000E75 00 00                 1314         .dw     0
      000E77                       1315 HIGH_SCORE_TABLE_TMP.level:
      000E77 01                    1316         .db     1
      000E78                       1317 INITIALS:
      000E78 5F 5F                 1318         .ascii '__'
      000E7A                       1319 TXT_GAME_OVER:
      000E7A 2A 2A 20 47 41 4D 45  1320         .ascii  '** GAME OVER **'
             20 4F 56 45 52 20 2A
             2A
      000E89                       1321 TXT_YOUR_SCORE:
      000E89 59 4F 55 52 20 53 43  1322         .ascii  'YOUR SCORE :'
             4F 52 45 20 3A
      000E95                       1323 TXT_HAZARD:
      000E95 48 41 5A 41 52 44 53  1324         .ascii  'HAZARDS :'
             20 3A
      000E9E                       1325 TXT_NEW_HIGH_SCORE:
      000E9E 2A 20 4E 45 57 20 48  1326         .ascii  '* NEW HIGH SCORE *'
             49 47 48 20 53 43 4F
             52 45 20 2A
                                   1327 ; end of source

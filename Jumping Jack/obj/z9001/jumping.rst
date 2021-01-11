                                      1         .module jumping_jack
                                      2         .include 'platform.s'
                           000001     1 z9001                           =       1
                           000000     2 z1013                           =       0
                                      3 ;
                                      4 ; z9001 specific constants
                                      5 ;
                           000005     6 BOS                             =       0x0005
                           000023     7 COUNT                           =       0x0023
                           000025     8 KEYBU                           =       0x0025
                           00002D     9 CURS                            =       0x002d
                           00F003    10 WBOOT                           =       0xF003
                           000001    11 UP_CONSI                        =       1
                           000002    12 UP_CONSO                        =       2
                           000009    13 UP_PRNST                        =       9
                           00000B    14 UP_CSTS                         =       11
                           000012    15 UP_SETCU                        =       18
                           00001D    16 UP_DCU                          =       29
                                     17 ;
                                     18 ; platform specific
                                     19 ;
                           000028    20 SCREEN_WIDTH                    =       40
                           000018    21 SCREEN_HEIGHT                   =       24
                                     22 
                           00000E    23 TOP_LINES                       =       14
                           000230    24 TITLE_TOP_SIZE                  =       SCREEN_WIDTH*TOP_LINES
                           000010    25 MENU_TOP                        =       (TOP_LINES+2)
                           000004    26 ALIGN_MIDDLE                    =       4
                           000006    27 GAMES_LINES                     =       6
                           000002    28 GAME_START_Y                    =       2
                           005208    29 SLOW_DOWN_13066                 =       21000
                           00EF98    30 POS_LIVES                       =       BWS+23*SCREEN_WIDTH
                           00EC28    31 POS_TOP_WALL                    =       BWS+ 1*SCREEN_WIDTH
                           00EC0C    32 POS_TOP_GAME                    =       BWS+ 0*SCREEN_WIDTH+8+ALIGN_MIDDLE
                           00EC0D    33 POS_GAME_OVER                   =       BWS+ 0*SCREEN_WIDTH+9+ALIGN_MIDDLE
                           000370    34 POS_COPYRIGHT                   =       SCREEN_WIDTH*22
                           00000D    35 POSDIFF_NAME                    =       SCREEN_WIDTH-HINT_COPYRIGHT_size+3
                           000005    36 POSDIFF_YEAR                    =       5
                           000008    37 POSDIFF_POINTS                  =       8
                           FFFFFFD8    38 POSDIFF_YOUR_SCORE              =       -(SCREEN_WIDTH)
                           000003    39 POSDIFF_YOUR_SCORE_DY           =       3
                           000004    40 POSDIFF_HIGHSCORE_DY            =       4
                           000001    41 MONSTER_CORRECTION              =       1
                                     42 
                                     43 .macro PROGRAM_START
                                     44         jp START
                                     45         .ascii 'JUMP    '
                                     46         .dw 0
                                     47 START:
                                     48         .endm
                                     49 
                                     50 .macro SCREEN_POS
                                     51         .ascii '    '
                                     52  .endm
                                     53 
                                     54 .macro CLRSCR
                                     55         ld      c,#UP_CONSO
                                     56         ld      e,#0x0c
                                     57         call    BOS
                                     58         ld      c,#UP_DCU
                                     59         call    BOS
                                     60 .endm
                                     61 
                                     62 .macro OUTCH
                                     63         push    bc
                                     64         push    de
                                     65         ld      c,#UP_CONSO
                                     66         ld      e,a
                                     67         call    BOS
                                     68         pop     de
                                     69         pop     bc
                                     70 .endm
                                     71 
                                     72 .macro INCH
                                     73         xor     a
                                     74         ld      (KEYBU),a
                                     75 	inc     a
                                     76 	ld      (COUNT),a
                                     77         ld      c,#UP_CONSI
                                     78         call    BOS
                                     79 .endm
                                     80 
                                     81 .macro PRST7
                                     82         call    prst7
                                     83 .endm
                                     84 
                                     85 .macro INKEY
                                     86         ld      a,(KEYBU)
                                     87         push    af
                                     88         xor     a
                                     89         ld      (KEYBU),a
                                     90 	inc     a
                                     91 	ld      (COUNT),a
                                     92         pop     af
                                     93 .endm
                                     94 
                                     95 .macro END_PROGRAM
                                     96         jp      WBOOT
                                     97 .endm
                                     98 
                                     99 .macro SET_CURSOR_DE    Y,X
                                    100         push    bc
                                    101         ld      de,#(Y+1)*256+(X+1)
                                    102         ld      c,#UP_SETCU
                                    103         call    BOS
                                    104         pop     bc
                                    105 .endm
                                    106 
                                    107 .macro SET_CURSOR_HL    Y,X
                                    108         push    de
                                    109         push    bc
                                    110         ld      de,#(Y+1)*256+(X+1)
                                    111         ld      h,d
                                    112         ld      l,e
                                    113         ld      c,#UP_SETCU
                                    114         call    BOS
                                    115         pop     bc
                                    116         pop     de
                                    117 .endm
                                    118 
                                    119 .macro SET_CURSOR
                                    120         call    set_cursor
                                    121 .endm
                                    122 
                                    123 .macro REMOVE_CURSOR
                                    124         ld      hl,(CURS)
                                    125         ld      (hl),#' '
                                    126         res     2,h
                                    127         res     7,(hl)
                                    128         set     2,h
                                    129 .endm
                                    130 
                                    131 .macro CURSOR_DISABLE
                                    132         push    bc
                                    133         ld      c,#UP_DCU
                                    134         call    BOS
                                    135         pop     bc
                                    136 .endm
                                    137 
                                    138 .macro Z1013_LINE
                                    139 .endm
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
      00031C 21 24 0A         [10]   79         ld      hl,#TOP_IMAGE
      00031F 01 30 02         [10]   80         ld      bc,#TITLE_TOP_SIZE
      000322 ED B0            [21]   81         ldir
      000324 21 30 EE         [10]   82         ld      hl,#BWS+SCREEN_WIDTH*TOP_LINES
      000327 36 CB            [10]   83         ld      (hl),#VK_HEART
      000329 11 31 EE         [10]   84         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+1
      00032C 01 27 00         [10]   85         ld      bc,#SCREEN_WIDTH-1
      00032F ED B0            [21]   86         ldir
      000331 11 50 EE         [10]   87         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+(SCREEN_WIDTH-8)
      000334 21 CA 0C         [10]   88         ld      hl,#VERSION_INFO
      000337 01 05 00         [10]   89         ld      bc,#VERSION_INFO_size
      00033A ED B0            [21]   90         ldir
      00033C 11 8E EE         [10]   91         ld      de,#BWS+SCREEN_WIDTH*MENU_TOP+10+ALIGN_MIDDLE
      00033F 21 54 0C         [10]   92         ld      hl,#HINT_RIGHT
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
      000389 3C               [ 4]    3 	inc     a
      00038A 32 23 00         [13]    4 	ld      (COUNT),a
      00038D 0E 01            [ 7]    5         ld      c,#UP_CONSI
      00038F CD 05 00         [17]    6         call    BOS
      000392 FE 5F            [ 7]  137         cp      #SMALL_CAPITALS
      000394 38 02            [12]  138         jr      c,capitalized
      000396 D6 20            [ 7]  139         sub     #CAPITALIZE
      000398                        140 capitalized:
      000398 FE 45            [ 7]  141         cp      #'E'
      00039A CA AC 09         [10]  142         jp      z,exit_game
      00039D FE 50            [ 7]  143         cp      #'P'
      00039F 20 E3            [12]  144         jr      nz,choose_menu
      0003A1                        145 new_game:
      0000A1                        146         CLRSCR
      0003A1 0E 02            [ 7]    1         ld      c,#UP_CONSO
      0003A3 1E 0C            [ 7]    2         ld      e,#0x0c
      0003A5 CD 05 00         [17]    3         call    BOS
      0003A8 0E 1D            [ 7]    4         ld      c,#UP_DCU
      0003AA CD 05 00         [17]    5         call    BOS
      0003AD 21 EF 0D         [10]  147         ld      hl,#LIVES
      0003B0 36 06            [10]  148         ld      (hl),#INITIAL_LIVES
      0003B2 21 F0 0D         [10]  149         ld      hl,#POINTS
      0003B5 36 00            [10]  150         ld      (hl),#ZERO
      0003B7 23               [ 6]  151         inc     hl
      0003B8 36 00            [10]  152         ld      (hl),#ZERO
      0003BA 06 06            [ 7]  153         ld      b,#INITIAL_LIVES
      0003BC 21 98 EF         [10]  154         ld      hl,#POS_LIVES
      0003BF                        155 draw_player:
      0003BF 3E 02            [ 7]  156         ld      a,#MOVE_2X_RIGHT
      0003C1 85               [ 4]  157         add     a,l
      0003C2 6F               [ 4]  158         ld      l,a
      0003C3 36 C4            [10]  159         ld      (hl),#VK_PLAYER
      0003C5 10 F8            [13]  160         djnz    draw_player
      0003C7 3E 01            [ 7]  161         ld      a,#INITIAL_LEVEL
      0003C9 32 F2 0D         [13]  162         ld      (LEVEL),a
      0003CC 3E 02            [ 7]  163         ld      a,#INITIAL_FAIL_COUNTER
      0003CE 32 E9 0D         [13]  164         ld      (cnt_fail_trap),a
      0003D1 32 EA 0D         [13]  165         ld      (cnt_fail_jump),a
      0003D4 21 00 EC         [10]  166         ld      hl,#BWS
      0003D7 36 20            [10]  167         ld      (hl),#' '
      0003D9 11 01 EC         [10]  168         ld      de,#BWS+1
      0003DC 01 96 03         [10]  169         ld      bc,#(3+GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH-2
      0003DF ED B0            [21]  170         ldir
      0003E1 21 28 EC         [10]  171         ld      hl,#POS_TOP_WALL
      0003E4 36 C6            [10]  172         ld      (hl),#CHR_WALL
      0003E6 11 29 EC         [10]  173         ld      de,#POS_TOP_WALL+1
      0003E9 01 27 00         [10]  174         ld      bc,#SCREEN_WIDTH-1
      0003EC ED B0            [21]  175         ldir
      0003EE 21 70 EC         [10]  176         ld      hl,#POS_TOP_WALL+2*SCREEN_WIDTH-8
      0003F1 36 C6            [10]  177         ld      (hl),#CHR_WALL
      0003F3 2B               [ 6]  178         dec     hl
      0003F4 2B               [ 6]  179         dec     hl
      0003F5 36 95            [10]  180         ld      (hl),#CHR_ARROW_RIGHT_TOP
      0003F7 2B               [ 6]  181         dec     hl
      0003F8 36 F8            [10]  182         ld      (hl),#CHR_LINE_TOP
      0003FA 21 98 EC         [10]  183         ld      hl,#POS_TOP_WALL+3*SCREEN_WIDTH-8
      0003FD 36 C6            [10]  184         ld      (hl),#CHR_WALL
      0003FF 2B               [ 6]  185         dec     hl
      000400 2B               [ 6]  186         dec     hl
      000401 36 93            [10]  187         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      000403 2B               [ 6]  188         dec     hl
      000404 36 9E            [10]  189         ld      (hl),#CHR_LINE_BOTTOM
      000406 21 F4 0D         [10]  190         ld      hl,#TXT_JUMP
      000409 11 0C EC         [10]  191         ld      de,#POS_TOP_GAME
      00040C 01 10 00         [10]  192         ld      bc,#TXT_JUMP_size
      00040F ED B0            [21]  193         ldir
      000411 3E 01            [ 7]  194         ld      a,#INITIAL_DELAY_COUNTER
      000413 21 ED 0D         [10]  195         ld      hl,#JUMP_DELAY
      000416 77               [ 7]  196         ld      (hl),a
      000417 21 EE 0D         [10]  197         ld      hl,#FAIL_DELAY
      00041A 77               [ 7]  198         ld      (hl),a
      00041B 23               [ 6]  199         inc     hl
      00041C 21 32 EF         [10]  200         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      00041F 22 EB 0D         [16]  201         ld      (MAN_HEAD),hl
      000422 36 CC            [10]  202         ld      (hl),#CHR_MAN_HEAD
      000424 11 28 00         [10]  203         ld      de,#SCREEN_WIDTH
      000427 19               [11]  204         add     hl,de
      000428 36 A1            [10]  205         ld      (hl),#CHR_MAN_STAY
      00042A                        206 animation_loop:
      00042A CD CA 04         [17]  207         call    animation_monster
      00042D CD 89 05         [17]  208         call    animation_lines
      000430 CD F9 05         [17]  209         call    animation_delay
      000433 3A ED 0D         [13]  210         ld      a,(JUMP_DELAY)
      000436 FE 01            [ 7]  211         cp      #INITIAL_DELAY_COUNTER
      000438 20 32            [12]  212         jr      nz,handle_jump_delay
      00043A 3A EE 0D         [13]  213         ld      a,(FAIL_DELAY)
      00043D FE 01            [ 7]  214         cp      #INITIAL_DELAY_COUNTER
      00043F 20 28            [12]  215         jr      nz,handle_fail_delay
      000141                        216         INKEY
      000441 3A 25 00         [13]    1         ld      a,(KEYBU)
      000444 F5               [11]    2         push    af
      000445 AF               [ 4]    3         xor     a
      000446 32 25 00         [13]    4         ld      (KEYBU),a
      000449 3C               [ 4]    5 	inc     a
      00044A 32 23 00         [13]    6 	ld      (COUNT),a
      00044D F1               [10]    7         pop     af
      00044E FE 20            [ 7]  217         cp      #' '
      000450 CA B6 06         [10]  218         jp      z,action_jump
      000453 FE 08            [ 7]  219         cp      #VK_LEFT
      000455 CC 06 06         [17]  220         call    z,action_left
      000458 FE 09            [ 7]  221         cp      #VK_RIGHT
      00045A CC 5D 06         [17]  222         call    z,action_right
                           000001   223 .if z9001
                                    224         ;debugginh
      00045D FE 55            [ 7]  225         cp      #'U'
      00045F 20 08            [12]  226         jr      nz,handle_fail_delay
      000461 21 64 EC         [10]  227         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+20
      000464 36 CC            [10]  228         ld      (hl),#CHR_MAN_HEAD
      000466 22 EB 0D         [16]  229         ld      (MAN_HEAD),hl
                                    230 .endif
      000469                        231 handle_fail_delay:
      000469 CD 1A 07         [17]  232         call    check_fall_through
      00046C                        233 handle_jump_delay:
      00046C 3A ED 0D         [13]  234         ld      a,(JUMP_DELAY)
      00046F FE 01            [ 7]  235         cp      #INITIAL_DELAY_COUNTER
      000471 28 04            [12]  236         jr      z,jump_delay_counter_set
      000473 3D               [ 4]  237         dec     a
      000474 32 ED 0D         [13]  238         ld      (JUMP_DELAY),a
      000477                        239 jump_delay_counter_set:
      000477 3A EE 0D         [13]  240         ld      a,(FAIL_DELAY)
      00047A FE 01            [ 7]  241         cp      #INITIAL_DELAY_COUNTER
      00047C 28 42            [12]  242         jr      z,player_activity
      00047E 3D               [ 4]  243         dec     a
      00047F 32 EE 0D         [13]  244         ld      (FAIL_DELAY),a
      000482 FE 01            [ 7]  245         cp      #INITIAL_DELAY_COUNTER
      000484 20 3A            [12]  246         jr      nz,player_activity
      000486 2A EB 0D         [16]  247         ld      hl,(MAN_HEAD)
                                    248         ; test for bottom line
      000489 11 D0 EE         [10]  249         ld      de,#BWS+(GAME_START_Y+3*GAMES_LINES-2)*SCREEN_WIDTH
      00048C A7               [ 4]  250         and     a
      00048D ED 52            [15]  251         sbc     hl,de
      00048F 38 16            [12]  252         jr      c,player_wake_up
      000491 3A EF 0D         [13]  253         ld      a,(LIVES)
      000494 3D               [ 4]  254         dec     a
      000495 32 EF 0D         [13]  255         ld      (LIVES),a
      000498 21 9A EF         [10]  256         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES+3)*SCREEN_WIDTH+2
      00049B 16 00            [ 7]  257         ld      d,#HI_ZERO
      00049D 87               [ 4]  258         add     a,a
      00049E 5F               [ 4]  259         ld      e,a
      00049F 19               [11]  260         add     hl,de
      0004A0 36 20            [10]  261         ld      (hl),#' '
      0004A2 FE 00            [ 7]  262         cp      #ZERO
      0004A4 CA 31 08         [10]  263         jp      z,no_lives
      0004A7                        264 player_wake_up:
      0004A7 2A EB 0D         [16]  265         ld      hl,(MAN_HEAD)
      0004AA 36 CC            [10]  266         ld      (hl),#CHR_MAN_HEAD
      0004AC 2B               [ 6]  267         dec     hl
      0004AD 3E 20            [ 7]  268         ld      a,#' '
      0004AF 77               [ 7]  269         ld      (hl),a
      0004B0 23               [ 6]  270         inc     hl
      0004B1 23               [ 6]  271         inc     hl
      0004B2 23               [ 6]  272         inc     hl
      0004B3 77               [ 7]  273         ld      (hl),a
      0004B4 2B               [ 6]  274         dec     hl
      0004B5 11 28 00         [10]  275         ld      de,#SCREEN_WIDTH
      0004B8 19               [11]  276         add     hl,de
      0004B9 77               [ 7]  277         ld      (hl),a
      0004BA 23               [ 6]  278         inc     hl
      0004BB 77               [ 7]  279         ld      (hl),a
      0004BC 2B               [ 6]  280         dec     hl
      0004BD 2B               [ 6]  281         dec     hl
      0004BE 36 9D            [10]  282         ld      (hl),#CHR_MAN_WALK
      0004C0                        283 player_activity:
      0004C0 CD 6B 07         [17]  284         call    check_level_finished
      0004C3 C3 2A 04         [10]  285         jp      animation_loop
                                    286 ; unchecked data source
      0004C6 67 75 66 69            287         .db     0x67,0x75,0x66,0x69                     ;gufi
      0004CA                        288 animation_monster:
      0004CA 3A F2 0D         [13]  289         ld      a,(LEVEL)
      0004CD 32 F3 0D         [13]  290         ld      (counter),a
      0004D0 FE 01            [ 7]  291         cp      #LEVEL_1
      0004D2 C8               [11]  292         ret     z
      0004D3 01 04 0E         [10]  293         ld      bc,#MONSTER_PTR
      0004D6 11 3C 0E         [10]  294         ld      de,#MONSTER_IMG
      0004D9                        295 handle_one_monster:
      0004D9 0A               [ 7]  296         ld      a,(bc)
      0004DA 6F               [ 4]  297         ld      l,a
      0004DB 03               [ 6]  298         inc     bc
      0004DC 0A               [ 7]  299         ld      a,(bc)
      0004DD 67               [ 4]  300         ld      h,a
      0004DE CD ED 04         [17]  301         call    handle_by_ptr
      0004E1 3A F3 0D         [13]  302         ld      a,(counter)
      0004E4 3D               [ 4]  303         dec     a
      0004E5 32 F3 0D         [13]  304         ld      (counter),a
      0004E8 FE 01            [ 7]  305         cp      #LEVEL_1
      0004EA C8               [11]  306         ret     z
      0004EB 18 EC            [12]  307         jr      handle_one_monster
      0004ED                        308 handle_by_ptr:
      0004ED C5               [11]  309         push    bc
      0004EE 3E 04            [ 7]  310         ld      a,#MONSTER_WIDTH
      0004F0 D5               [11]  311         push    de
      0004F1                        312 handle_by_column:
      0004F1 36 20            [10]  313         ld      (hl),#' '
      0004F3 11 28 00         [10]  314         ld      de,#SCREEN_WIDTH
      0004F6 19               [11]  315         add     hl,de
      0004F7 36 20            [10]  316         ld      (hl),#' '
      0004F9 A7               [ 4]  317         and     a
      0004FA ED 52            [15]  318         sbc     hl,de
      0004FC 2B               [ 6]  319         dec     hl
      0004FD E5               [11]  320         push    hl
      0004FE 08               [ 4]  321         ex      af,af'
      0004FF 11 EF EC         [10]  322         ld      de,#BWS+(GAME_START_Y+4)*SCREEN_WIDTH-1
      000502 A7               [ 4]  323         and     a
      000503 ED 52            [15]  324         sbc     hl,de
      000505 38 0D            [12]  325         jr      c,correct_ptr
      000507 C5               [11]  326         push    bc
      000508 06 06            [ 7]  327         ld      b,#GAMES_LINES
      00050A 11 78 00         [10]  328         ld      de,#3*SCREEN_WIDTH
      00050D                        329 get_column:
      00050D A7               [ 4]  330         and     a
      00050E ED 52            [15]  331         sbc     hl,de
      000510 38 13            [12]  332         jr      c,test_column
      000512 10 F9            [13]  333         djnz    get_column
      000514                        334 correct_ptr:
      000514 11 27 00         [10]  335         ld      de,#SCREEN_WIDTH-1
      000517 ED 5A            [15]  336         adc     hl,de
      000519 28 03            [12]  337         jr      z,start_from_bottom
      00051B E1               [10]  338         pop     hl
      00051C 18 19            [12]  339         jr      update_pointers
      00051E                        340 start_from_bottom:
      00051E E1               [10]  341         pop     hl
      00051F 11 08 02         [10]  342         ld      de,#((GAMES_LINES-2)*3+1)*SCREEN_WIDTH
      000522 19               [11]  343         add     hl,de
      000523 18 12            [12]  344         jr      update_pointers
      000525                        345 test_column:
      000525 C1               [10]  346         pop     bc
      000526 11 27 00         [10]  347         ld      de,#SCREEN_WIDTH-1
      000529 ED 5A            [15]  348         adc     hl,de
      00052B 28 03            [12]  349         jr      z,move_one_line_up
      00052D E1               [10]  350         pop     hl
      00052E 18 07            [12]  351         jr      update_pointers
      000530                        352 move_one_line_up:
      000530 E1               [10]  353         pop     hl
      000531 11 50 00         [10]  354         ld      de,#2*SCREEN_WIDTH
      000534 A7               [ 4]  355         and     a
      000535 ED 52            [15]  356         sbc     hl,de
      000537                        357 update_pointers:
      000537 0B               [ 6]  358         dec     bc
      000538 7D               [ 4]  359         ld      a,l
      000539 02               [ 7]  360         ld      (bc),a
      00053A 03               [ 6]  361         inc     bc
      00053B 7C               [ 4]  362         ld      a,h
      00053C 02               [ 7]  363         ld      (bc),a
      00053D 03               [ 6]  364         inc     bc
      00053E 0A               [ 7]  365         ld      a,(bc)
      00053F 6F               [ 4]  366         ld      l,a
      000540 03               [ 6]  367         inc     bc
      000541 0A               [ 7]  368         ld      a,(bc)
      000542 67               [ 4]  369         ld      h,a
      000543 08               [ 4]  370         ex      af,af'
      000544 3D               [ 4]  371         dec     a
      000545 FE 00            [ 7]  372         cp      #ZERO
      000547 28 02            [12]  373         jr      z,draw_monster
      000549 18 A6            [12]  374         jr      handle_by_column
      00054B                        375 draw_monster:
      00054B D1               [10]  376         pop     de
      00054C C1               [10]  377         pop     bc
      00054D 0B               [ 6]  378         dec     bc
      00054E 3E 04            [ 7]  379         ld      a,#MONSTER_WIDTH
      000550                        380 draw_monster_segment:
      000550 08               [ 4]  381         ex      af,af'
      000551 0A               [ 7]  382         ld      a,(bc)
      000552 6F               [ 4]  383         ld      l,a
      000553 03               [ 6]  384         inc     bc
      000554 0A               [ 7]  385         ld      a,(bc)
      000555 67               [ 4]  386         ld      h,a
      000556 03               [ 6]  387         inc     bc
      000557 1A               [ 7]  388         ld      a,(de)
      000558 77               [ 7]  389         ld      (hl),a
      000559 13               [ 6]  390         inc     de
      00055A 1A               [ 7]  391         ld      a,(de)
      00055B D5               [11]  392         push    de
      00055C 11 28 00         [10]  393         ld      de,#SCREEN_WIDTH
      00055F 19               [11]  394         add     hl,de
      000560 77               [ 7]  395         ld      (hl),a
      000561 CD 6D 05         [17]  396         call    monster_check_crash
      000564 D1               [10]  397         pop     de
      000565 13               [ 6]  398         inc     de
      000566 08               [ 4]  399         ex      af,af'
      000567 3D               [ 4]  400         dec     a
      000568 FE 00            [ 7]  401         cp      #ZERO
      00056A 20 E4            [12]  402         jr      nz,draw_monster_segment
      00056C C9               [10]  403         ret
      00056D                        404 monster_check_crash:
      00056D A7               [ 4]  405         and     a
      00056E ED 52            [15]  406         sbc     hl,de
      000570 EB               [ 4]  407         ex      de,hl
      000571 2A EB 0D         [16]  408         ld      hl,(MAN_HEAD)
      000574 A7               [ 4]  409         and     a
      000575 ED 52            [15]  410         sbc     hl,de
      000577 EB               [ 4]  411         ex      de,hl
      000578 C0               [11]  412         ret     nz
      000579 11 28 00         [10]  413         ld      de,#SCREEN_WIDTH
      00057C 19               [11]  414         add     hl,de
      00057D 23               [ 6]  415         inc     hl
      00057E 36 97            [10]  416         ld      (hl),#CHR_MAN_SLEEP
      000580 23               [ 6]  417         inc     hl
      000581 36 C9            [10]  418         ld      (hl),#CHR_MAN_SLEEP_HEAD
      000583 3E 0B            [ 7]  419         ld      a,#DELAY_COUNTER
      000585 32 EE 0D         [13]  420         ld      (FAIL_DELAY),a
      000588 C9               [10]  421         ret
      000589                        422 animation_lines:
      000589 3E EE            [ 7]  423         ld      a,#CHR_MOVING_LINE
      00058B 21 CF 0C         [10]  424         ld      hl,#LINE_BUFFER
      00058E 77               [ 7]  425         ld      (hl),a
      00058F 11 D0 0C         [10]  426         ld      de,#LINE_BUFFER+1
      000592 01 0E 01         [10]  427         ld      bc,#LINE_BUFFER_size-1
      000595 ED B0            [21]  428         ldir
      000597 3A E9 0D         [13]  429         ld      a,(cnt_fail_trap)
      00059A 11 DF 0D         [10]  430         ld      de,#OFFSET_HOLES
      00059D 1B               [ 6]  431         dec     de
      00059E                        432 loop_failed_penalty_holes:
      00059E F5               [11]  433         push    af
      00059F 13               [ 6]  434         inc     de
      0005A0 1A               [ 7]  435         ld      a,(de)
      0005A1 3C               [ 4]  436         inc     a
      0005A2 12               [ 7]  437         ld      (de),a
      0005A3 4F               [ 4]  438         ld      c,a
      0005A4 06 00            [ 7]  439         ld      b,#HI_ZERO
      0005A6 21 CF 0C         [10]  440         ld      hl,#LINE_BUFFER
      0005A9 09               [11]  441         add     hl,bc
      0005AA 36 20            [10]  442         ld      (hl),#' '
      0005AC 23               [ 6]  443         inc     hl
      0005AD 36 20            [10]  444         ld      (hl),#' '
      0005AF 23               [ 6]  445         inc     hl
      0005B0 36 20            [10]  446         ld      (hl),#' '
      0005B2 F1               [10]  447         pop     af
      0005B3 3D               [ 4]  448         dec     a
      0005B4 20 E8            [12]  449         jr      nz,loop_failed_penalty_holes
      0005B6 3A EA 0D         [13]  450         ld      a,(cnt_fail_jump)
      0005B9 11 E4 0D         [10]  451         ld      de,#OFFSET_HOLES_JUMP_PENALTY
      0005BC 1B               [ 6]  452         dec     de
      0005BD                        453 loop_jump_penalty_holes:
      0005BD F5               [11]  454         push    af
      0005BE 13               [ 6]  455         inc     de
      0005BF 1A               [ 7]  456         ld      a,(de)
      0005C0 3D               [ 4]  457         dec     a
      0005C1 12               [ 7]  458         ld      (de),a
      0005C2 4F               [ 4]  459         ld      c,a
      0005C3 06 00            [ 7]  460         ld      b,#HI_ZERO
      0005C5 21 CF 0C         [10]  461         ld      hl,#LINE_BUFFER
      0005C8 09               [11]  462         add     hl,bc
      0005C9 36 20            [10]  463         ld      (hl),#' '
      0005CB 23               [ 6]  464         inc     hl
      0005CC 36 20            [10]  465         ld      (hl),#' '
      0005CE 23               [ 6]  466         inc     hl
      0005CF 36 20            [10]  467         ld      (hl),#' '
      0005D1 F1               [10]  468         pop     af
      0005D2 3D               [ 4]  469         dec     a
      0005D3 20 E8            [12]  470         jr      nz,loop_jump_penalty_holes
      0005D5 3E 06            [ 7]  471         ld      a,#GAMES_LINES
      0005D7 21 CF 0C         [10]  472         ld      hl,#LINE_BUFFER
      0005DA 11 50 EC         [10]  473         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+0
      0005DD                        474 print_line:
      0005DD 01 28 00         [10]  475         ld      bc,#SCREEN_WIDTH
      0005E0 E5               [11]  476         push    hl
      0005E1 EB               [ 4]  477         ex      de,hl
      0005E2 09               [11]  478         add     hl,bc
      0005E3 09               [11]  479         add     hl,bc
      0005E4 EB               [ 4]  480         ex      de,hl
      0005E5 E1               [10]  481         pop     hl
      0005E6 ED B0            [21]  482         ldir
      0005E8 3D               [ 4]  483         dec     a
      0005E9 20 F2            [12]  484         jr      nz,print_line
      0005EB 21 70 EF         [10]  485         ld      hl,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+0
      0005EE 11 71 EF         [10]  486         ld      de,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+1
      0005F1 01 27 00         [10]  487         ld      bc,#SCREEN_WIDTH-1
      0005F4 36 C6            [10]  488         ld      (hl),#CHR_WALL
      0005F6 ED B0            [21]  489         ldir
      0005F8 C9               [10]  490         ret
      0005F9                        491 animation_delay:
      0005F9 21 08 52         [10]  492         ld      hl,#SLOW_DOWN_13066
      0005FC 11 01 00         [10]  493         ld      de,#1
      0005FF A7               [ 4]  494         and     a
      000600                        495 delay_loop:
      000600 2B               [ 6]  496         dec     hl
      000601 ED 52            [15]  497         sbc     hl,de
      000603 20 FB            [12]  498         jr      nz,delay_loop
      000605 C9               [10]  499         ret
      000606                        500 action_left:
      000606 F5               [11]  501         push    af
      000607 2A EB 0D         [16]  502         ld      hl,(MAN_HEAD)
      00060A 7E               [ 7]  503         ld      a,(hl)
      00060B 36 20            [10]  504         ld      (hl),#' '
      00060D 2B               [ 6]  505         dec     hl
      00060E 22 EB 0D         [16]  506         ld      (MAN_HEAD),hl
      000611 77               [ 7]  507         ld      (hl),a
      000612 11 28 00         [10]  508         ld      de,#SCREEN_WIDTH
      000615 19               [11]  509         add     hl,de
      000616 23               [ 6]  510         inc     hl
      000617 7E               [ 7]  511         ld      a,(hl)
      000618 36 20            [10]  512         ld      (hl),#' '
      00061A FE 9D            [ 7]  513         cp      #CHR_MAN_WALK
      00061C 28 04            [12]  514         jr      z,transition_left_stay
      00061E FE A1            [ 7]  515         cp      #CHR_MAN_STAY
      000620 28 04            [12]  516         jr      z,transition_left_walk
      000622                        517 transition_left_stay:
      000622 C6 04            [ 7]  518         add     a,#TRANSITION_MAN_WALK_STAY
      000624 18 02            [12]  519         jr      update_left
      000626                        520 transition_left_walk:
      000626 D6 04            [ 7]  521         sub     #TRANSITION_MAN_WALK_STAY
      000628                        522 update_left:
      000628 2B               [ 6]  523         dec     hl
      000629 77               [ 7]  524         ld      (hl),a
      00062A 3E 07            [ 7]  525         ld      a,#GAMES_LINES+1
      00062C 01 4F EC         [10]  526         ld      bc,#BWS+(GAME_START_Y)*SCREEN_WIDTH-1
      00062F                        527 loop_left_border_check:
      00062F C5               [11]  528         push    bc
      000630 60               [ 4]  529         ld      h,b
      000631 69               [ 4]  530         ld      l,c
      000632 ED 5B EB 0D      [20]  531         ld      de,(MAN_HEAD)
      000636 A7               [ 4]  532         and     a
      000637 ED 52            [15]  533         sbc     hl,de
      000639 28 0E            [12]  534         jr      z,correct_left_border
      00063B                        535 left_border_next_adr:
      00063B C1               [10]  536         pop     bc
      00063C 11 78 00         [10]  537         ld      de,#3*SCREEN_WIDTH
      00063F 60               [ 4]  538         ld      h,b
      000640 69               [ 4]  539         ld      l,c
      000641 19               [11]  540         add     hl,de
      000642 44               [ 4]  541         ld      b,h
      000643 4D               [ 4]  542         ld      c,l
      000644 3D               [ 4]  543         dec     a
      000645 20 E8            [12]  544         jr      nz,loop_left_border_check
      000647 F1               [10]  545         pop     af
      000648 C9               [10]  546         ret
      000649                        547 correct_left_border:
      000649 2A EB 0D         [16]  548         ld      hl,(MAN_HEAD)
      00064C 11 28 00         [10]  549         ld      de,#SCREEN_WIDTH
      00064F 36 C6            [10]  550         ld      (hl),#CHR_WALL
      000651 19               [11]  551         add     hl,de
      000652 36 CC            [10]  552         ld      (hl),#CHR_MAN_HEAD
      000654 22 EB 0D         [16]  553         ld      (MAN_HEAD),hl
      000657 19               [11]  554         add     hl,de
      000658 36 9D            [10]  555         ld      (hl),#CHR_MAN_WALK
      00065A C3 3B 06         [10]  556         jp      left_border_next_adr
      00065D                        557 action_right:
      00065D F5               [11]  558         push    af
      00065E 2A EB 0D         [16]  559         ld      hl,(MAN_HEAD)
      000661 7E               [ 7]  560         ld      a,(hl)
      000662 36 20            [10]  561         ld      (hl),#' '
      000664 23               [ 6]  562         inc     hl
      000665 22 EB 0D         [16]  563         ld      (MAN_HEAD),hl
      000668 77               [ 7]  564         ld      (hl),a
      000669 11 28 00         [10]  565         ld      de,#SCREEN_WIDTH
      00066C 19               [11]  566         add     hl,de
      00066D 2B               [ 6]  567         dec     hl
      00066E 7E               [ 7]  568         ld      a,(hl)
      00066F 36 20            [10]  569         ld      (hl),#' '
      000671 FE 9D            [ 7]  570         cp      #CHR_MAN_WALK
      000673 28 04            [12]  571         jr      z,transition_stay
      000675 FE A1            [ 7]  572         cp      #CHR_MAN_STAY
      000677 28 04            [12]  573         jr      z,transition_walk
      000679                        574 transition_stay:
      000679 C6 04            [ 7]  575         add     a,#TRANSITION_MAN_WALK_STAY
      00067B 18 02            [12]  576         jr      update_right
      00067D                        577 transition_walk:
      00067D D6 04            [ 7]  578         sub     #TRANSITION_MAN_WALK_STAY
      00067F                        579 update_right:
      00067F 23               [ 6]  580         inc     hl
      000680 77               [ 7]  581         ld      (hl),a
      000681 3E 07            [ 7]  582         ld      a,#GAMES_LINES+1
      000683 01 78 EC         [10]  583         ld      bc,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH+0
      000686                        584 loop_right_border_check:
      000686 C5               [11]  585         push    bc
      000687 60               [ 4]  586         ld      h,b
      000688 69               [ 4]  587         ld      l,c
      000689 ED 5B EB 0D      [20]  588         ld      de,(MAN_HEAD)
      00068D A7               [ 4]  589         and     a
      00068E ED 52            [15]  590         sbc     hl,de
      000690 28 0E            [12]  591         jr      z,correct_right_border
      000692                        592 right_border_next_adr:
      000692 C1               [10]  593         pop     bc
      000693 11 78 00         [10]  594         ld      de,#3*SCREEN_WIDTH
      000696 60               [ 4]  595         ld      h,b
      000697 69               [ 4]  596         ld      l,c
      000698 19               [11]  597         add     hl,de
      000699 44               [ 4]  598         ld      b,h
      00069A 4D               [ 4]  599         ld      c,l
      00069B 3D               [ 4]  600         dec     a
      00069C 20 E8            [12]  601         jr      nz,loop_right_border_check
      00069E F1               [10]  602         pop     af
      00069F C9               [10]  603         ret
      0006A0                        604 correct_right_border:
      0006A0 2A EB 0D         [16]  605         ld      hl,(MAN_HEAD)
      0006A3 4E               [ 7]  606         ld      c,(hl)
      0006A4 36 9D            [10]  607         ld      (hl),#CHR_MAN_WALK
      0006A6 11 28 00         [10]  608         ld      de,#SCREEN_WIDTH
      0006A9 A7               [ 4]  609         and     a
      0006AA ED 52            [15]  610         sbc     hl,de
      0006AC 71               [ 7]  611         ld      (hl),c
      0006AD 22 EB 0D         [16]  612         ld      (MAN_HEAD),hl
      0006B0 19               [11]  613         add     hl,de
      0006B1 19               [11]  614         add     hl,de
      0006B2 36 EE            [10]  615         ld      (hl),#CHR_MOVING_LINE
      0006B4 18 DC            [12]  616         jr      right_border_next_adr
      0006B6                        617 action_jump:
      0006B6 2A EB 0D         [16]  618         ld      hl,(MAN_HEAD)
      0006B9 11 28 00         [10]  619         ld      de,#SCREEN_WIDTH
      0006BC A7               [ 4]  620         and     a
      0006BD ED 52            [15]  621         sbc     hl,de
      0006BF 7E               [ 7]  622         ld      a,(hl)
      0006C0 FE 20            [ 7]  623         cp      #' '
      0006C2 28 0B            [12]  624         jr      z,jump_ok
      0006C4 FE EE            [ 7]  625         cp      #CHR_MOVING_LINE
      0006C6 28 2B            [12]  626         jr      z,jump_fail
      0006C8 FE C6            [ 7]  627         cp      #CHR_WALL
      0006CA 28 27            [12]  628         jr      z,jump_fail
      0006CC C3 69 04         [10]  629         jp      handle_fail_delay
      0006CF                        630 jump_ok:
      0006CF D9               [ 4]  631         exx
      0006D0 CD D1 07         [17]  632         call    add_10_points
      0006D3 D9               [ 4]  633         exx
      0006D4 19               [11]  634         add     hl,de
      0006D5 36 20            [10]  635         ld      (hl),#' '
      0006D7 19               [11]  636         add     hl,de
      0006D8 36 20            [10]  637         ld      (hl),#' '
      0006DA 1E 78            [ 7]  638         ld      e,#3*SCREEN_WIDTH
      0006DC A7               [ 4]  639         and     a
      0006DD ED 52            [15]  640         sbc     hl,de
      0006DF 36 9D            [10]  641         ld      (hl),#CHR_MAN_WALK
      0006E1 1E 28            [ 7]  642         ld      e,#SCREEN_WIDTH
      0006E3 A7               [ 4]  643         and     a
      0006E4 ED 52            [15]  644         sbc     hl,de
      0006E6 36 CC            [10]  645         ld      (hl),#CHR_MAN_HEAD
      0006E8 22 EB 0D         [16]  646         ld      (MAN_HEAD),hl
      0006EB 3E 04            [ 7]  647         ld      a,#DELAY_COUNTER_JUMP
      0006ED 32 ED 0D         [13]  648         ld      (JUMP_DELAY),a
      0006F0 C3 69 04         [10]  649         jp      handle_fail_delay
      0006F3                        650 jump_fail:
      0006F3 19               [11]  651         add     hl,de
      0006F4 2B               [ 6]  652         dec     hl
      0006F5 3E CD            [ 7]  653         ld      a,#CHR_SMOKE
      0006F7 77               [ 7]  654         ld      (hl),a
      0006F8 23               [ 6]  655         inc     hl
      0006F9 23               [ 6]  656         inc     hl
      0006FA 23               [ 6]  657         inc     hl
      0006FB 77               [ 7]  658         ld      (hl),a
      0006FC 2B               [ 6]  659         dec     hl
      0006FD 2B               [ 6]  660         dec     hl
      0006FE 36 20            [10]  661         ld      (hl),#' '
      000700 19               [11]  662         add     hl,de
      000701 36 97            [10]  663         ld      (hl),#CHR_MAN_SLEEP
      000703 23               [ 6]  664         inc     hl
      000704 36 C9            [10]  665         ld      (hl),#CHR_MAN_SLEEP_HEAD
      000706 3E 0B            [ 7]  666         ld      a,#DELAY_COUNTER
      000708 32 EE 0D         [13]  667         ld      (FAIL_DELAY),a
      00070B 3A EA 0D         [13]  668         ld      a,(cnt_fail_jump)
      00070E FE 05            [ 7]  669         cp      #MAX_FAIL_COUNTER
      000710 CA 69 04         [10]  670         jp      z,handle_fail_delay
      000713 3C               [ 4]  671         inc     a
      000714 32 EA 0D         [13]  672         ld      (cnt_fail_jump),a
      000717 C3 69 04         [10]  673         jp      handle_fail_delay
      00071A                        674 check_fall_through:
      00071A 3A ED 0D         [13]  675         ld      a,(JUMP_DELAY)
      00071D FE 01            [ 7]  676         cp      #INITIAL_DELAY_COUNTER
      00071F C0               [11]  677         ret     nz
      000720                        678 check_for_trap:
      000720 2A EB 0D         [16]  679         ld      hl,(MAN_HEAD)
      000723 11 28 00         [10]  680         ld      de,#SCREEN_WIDTH
      000726 19               [11]  681         add     hl,de
      000727 19               [11]  682         add     hl,de
      000728 7E               [ 7]  683         ld      a,(hl)
      000729 FE 20            [ 7]  684         cp      #' '
      00072B C0               [11]  685         ret     nz
      00072C 3A EE 0D         [13]  686         ld      a,(FAIL_DELAY)
      00072F FE 01            [ 7]  687         cp      #INITIAL_DELAY_COUNTER
      000731 28 15            [12]  688         jr      z,erase_player_fell_down
      000733 2A EB 0D         [16]  689         ld      hl,(MAN_HEAD)
      000736 3E 20            [ 7]  690         ld      a,#' '
      000738 2B               [ 6]  691         dec     hl
      000739 77               [ 7]  692         ld      (hl),a
      00073A 23               [ 6]  693         inc     hl
      00073B 23               [ 6]  694         inc     hl
      00073C 23               [ 6]  695         inc     hl
      00073D 77               [ 7]  696         ld      (hl),a
      00073E 2B               [ 6]  697         dec     hl
      00073F 19               [11]  698         add     hl,de
      000740 77               [ 7]  699         ld      (hl),a
      000741 23               [ 6]  700         inc     hl
      000742 77               [ 7]  701         ld      (hl),a
      000743 2B               [ 6]  702         dec     hl
      000744 2B               [ 6]  703         dec     hl
      000745 77               [ 7]  704         ld      (hl),a
      000746 18 08            [12]  705         jr      player_fell_down
      000748                        706 erase_player_fell_down:
      000748 2A EB 0D         [16]  707         ld      hl,(MAN_HEAD)
      00074B 3E 20            [ 7]  708         ld      a,#' '
      00074D 77               [ 7]  709         ld      (hl),a
      00074E 19               [11]  710         add     hl,de
      00074F 77               [ 7]  711         ld      (hl),a
      000750                        712 player_fell_down:
      000750 19               [11]  713         add     hl,de
      000751 19               [11]  714         add     hl,de
      000752 22 EB 0D         [16]  715         ld      (MAN_HEAD),hl
      000755 19               [11]  716         add     hl,de
      000756 36 97            [10]  717         ld      (hl),#CHR_MAN_SLEEP
      000758 23               [ 6]  718         inc     hl
      000759 36 C9            [10]  719         ld      (hl),#CHR_MAN_SLEEP_HEAD
      00075B 3E 08            [ 7]  720         ld      a,#DELAY_COUNTER2
      00075D 32 EE 0D         [13]  721         ld      (FAIL_DELAY),a
      000760 3A E9 0D         [13]  722         ld      a,(cnt_fail_trap)
      000763 FE 05            [ 7]  723         cp      #MAX_FAIL_COUNTER
      000765 C8               [11]  724         ret     z
      000766 3C               [ 4]  725         inc     a
      000767 32 E9 0D         [13]  726         ld      (cnt_fail_trap),a
      00076A C9               [10]  727         ret
      00076B                        728 check_level_finished:
      00076B 2A EB 0D         [16]  729         ld      hl,(MAN_HEAD)
      00076E 11 6F EC         [10]  730         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+(SCREEN_WIDTH-9)
      000771 A7               [ 4]  731         and     a
      000772 ED 52            [15]  732         sbc     hl,de
      000774 20 39            [12]  733         jr      nz,round_end
      000776 3A F2 0D         [13]  734         ld      a,(LEVEL)
      000779 FE 08            [ 7]  735         cp      #MAX_LEVEL
      00077B 28 01            [12]  736         jr      z,new_level_set
      00077D 3C               [ 4]  737         inc     a
      00077E                        738 new_level_set:
      00077E 32 F2 0D         [13]  739         ld      (LEVEL),a
      000781 21 33 EF         [10]  740         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+(15+ALIGN_MIDDLE)
      000784 22 EB 0D         [16]  741         ld      (MAN_HEAD),hl
      000787 3E 28            [ 7]  742         ld      a,#SCREEN_WIDTH
      000789 36 CC            [10]  743         ld      (hl),#CHR_MAN_HEAD
      00078B 85               [ 4]  744         add     a,l
      00078C 6F               [ 4]  745         ld      l,a
      00078D 36 A1            [10]  746         ld      (hl),#CHR_MAN_STAY
      00078F 21 E9 0D         [10]  747         ld      hl,#cnt_fail_trap
      000792 3E 02            [ 7]  748         ld      a,#INITIAL_FAIL_COUNTER
      000794 77               [ 7]  749         ld      (hl),a
      000795 21 EA 0D         [10]  750         ld      hl,#cnt_fail_jump
      000798 77               [ 7]  751         ld      (hl),a
      000799 21 6D EC         [10]  752         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+(SCREEN_WIDTH-11)
      00079C 36 F8            [10]  753         ld      (hl),#CHR_LINE_TOP
      00079E 23               [ 6]  754         inc     hl
      00079F 36 95            [10]  755         ld      (hl),#CHR_ARROW_RIGHT_TOP
      0007A1 23               [ 6]  756         inc     hl
      0007A2 36 20            [10]  757         ld      (hl),#' '
      0007A4 21 95 EC         [10]  758         ld      hl,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH++(SCREEN_WIDTH-11)
      0007A7 36 9E            [10]  759         ld      (hl),#CHR_LINE_BOTTOM
      0007A9 23               [ 6]  760         inc     hl
      0007AA 36 93            [10]  761         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      0007AC 23               [ 6]  762         inc     hl
      0007AD 36 20            [10]  763         ld      (hl),#' '
      0007AF                        764 round_end:
      0007AF 13               [ 6]  765         inc     de
      0007B0 13               [ 6]  766         inc     de
      0007B1 2A EB 0D         [16]  767         ld      hl,(MAN_HEAD)
      0007B4 A7               [ 4]  768         and     a
      0007B5 ED 52            [15]  769         sbc     hl,de
      0007B7 3E 0B            [ 7]  770         ld      a,#DELAY_COUNTER
      0007B9 C0               [11]  771         ret     nz
      0007BA 32 EE 0D         [13]  772         ld      (FAIL_DELAY),a
      0007BD 13               [ 6]  773         inc     de
      0007BE ED 53 EB 0D      [20]  774         ld      (MAN_HEAD),de
      0007C2 3E 20            [ 7]  775         ld      a,#' '
      0007C4 1B               [ 6]  776         dec     de
      0007C5 12               [ 7]  777         ld      (de),a
      0007C6 83               [ 4]  778         add     a,e
      0007C7 5F               [ 4]  779         ld      e,a
      0007C8 12               [ 7]  780         ld      (de),a
      0007C9 6F               [ 4]  781         ld      l,a
      0007CA 19               [11]  782         add     hl,de
      0007CB 36 97            [10]  783         ld      (hl),#CHR_MAN_SLEEP
      0007CD 23               [ 6]  784         inc     hl
      0007CE 36 C9            [10]  785         ld      (hl),#CHR_MAN_SLEEP_HEAD
      0007D0 C9               [10]  786         ret
      0007D1                        787 add_10_points:
      0004D1                        788         SET_CURSOR_DE 0 23+POSDIFF_POINTS
      0007D1 C5               [11]    1         push    bc
      0007D2 11 20 01         [10]    2         ld      de,#(0+1)*256+(23+POSDIFF_POINTS+1)
      0007D5 0E 12            [ 7]    3         ld      c,#UP_SETCU
      0007D7 CD 05 00         [17]    4         call    BOS
      0007DA C1               [10]    5         pop     bc
      0007DB 2A F0 0D         [16]  789         ld      hl,(POINTS)
      0007DE 11 0A 00         [10]  790         ld      de,#10
      0007E1 19               [11]  791         add     hl,de
      0007E2 22 F0 0D         [16]  792         ld      (POINTS),hl
      0007E5 CD EE 07         [17]  793         call    print_decimal
      0007E8 3E 20            [ 7]  794         ld      a,#' '
      0007EA 32 24 EC         [13]  795         ld      (BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS+5),a
      0007ED C9               [10]  796         ret
      0007EE                        797 print_decimal:
      0007EE E5               [11]  798         push    hl
      0007EF 01 10 27         [10]  799         ld      bc,#10000
      0007F2 CD 1A 08         [17]  800         call    get_decimal_digit
      0007F5 01 E8 03         [10]  801         ld      bc,#1000
      0007F8 CD 1A 08         [17]  802         call    get_decimal_digit
      0007FB 01 64 00         [10]  803         ld      bc,#100
      0007FE CD 1A 08         [17]  804         call    get_decimal_digit
      000801 01 0A 00         [10]  805         ld      bc,#10
      000804 CD 1A 08         [17]  806         call    get_decimal_digit
      000807 01 01 00         [10]  807         ld      bc,#1
      00080A CD 1A 08         [17]  808         call    get_decimal_digit
      00050D                        809         REMOVE_CURSOR;
      00080D 2A 2D 00         [16]    1         ld      hl,(CURS)
      000810 36 20            [10]    2         ld      (hl),#' '
      000812 CB 94            [ 8]    3         res     2,h
      000814 CB BE            [15]    4         res     7,(hl)
      000816 CB D4            [ 8]    5         set     2,h
      000818 E1               [10]  810         pop     hl
      000819 C9               [10]  811         ret
      00081A                        812 get_decimal_digit:
      00081A AF               [ 4]  813         xor     a
      00081B                        814 decimal_loop:
      00081B A7               [ 4]  815         and     a
      00081C ED 42            [15]  816         sbc     hl,bc
      00081E 3C               [ 4]  817         inc     a
      00081F D2 1B 08         [10]  818         jp      nc,decimal_loop
      000822 3D               [ 4]  819         dec     a
      000823 09               [11]  820         add     hl,bc
      000824 C6 30            [ 7]  821         add     a,#'0'
      000526                        822         OUTCH
      000826 C5               [11]    1         push    bc
      000827 D5               [11]    2         push    de
      000828 0E 02            [ 7]    3         ld      c,#UP_CONSO
      00082A 5F               [ 4]    4         ld      e,a
      00082B CD 05 00         [17]    5         call    BOS
      00082E D1               [10]    6         pop     de
      00082F C1               [10]    7         pop     bc
      000830 C9               [10]  823         ret
      000831                        824 no_lives::
      000531                        825         PRST7
      000831 CD CA 0E         [17]    1         call    prst7
      000834 0C A0                  826         .db     0x0c,0xa0
      000836 21 94 0E         [10]  827         ld      hl,#TXT_GAME_OVER
      000839 11 0D EC         [10]  828         ld      de,#POS_GAME_OVER
      00083C 01 0F 00         [10]  829         ld      bc,#TXT_GAME_OVER_size
      00083F ED B0            [21]  830         ldir
      000841 0E 40            [ 7]  831         ld      c,#3*SCREEN_WIDTH-TXT_GAME_OVER_size-1+POSDIFF_YOUR_SCORE
      000843 7B               [ 4]  832         ld      a,e
      000844 81               [ 4]  833         add     a,c
      000845 5F               [ 4]  834         ld      e,a
      000846 0E 0C            [ 7]  835         ld      c,#TXT_YOUR_SCORE_size
      000848 ED B0            [21]  836         ldir
      00084A 0E 47            [ 7]  837         ld      c,#2*SCREEN_WIDTH-TXT_YOUR_SCORE_size+3
      00084C 7B               [ 4]  838         ld      a,e
      00084D 81               [ 4]  839         add     a,c
      00084E 5F               [ 4]  840         ld      e,a
      00084F 0E 09            [ 7]  841         ld      c,#TXT_HAZARD_size
      000851 ED B0            [21]  842         ldir
      000853 21 E0 ED         [10]  843         ld      hl,#BWS+15*SCREEN_WIDTH+0+(3*POSDIFF_YOUR_SCORE)
      000856 36 A0            [10]  844         ld      (hl),#CHR_MIDDLE_LINE
      000858 11 E1 ED         [10]  845         ld      de,#BWS+15*SCREEN_WIDTH+1+(3*POSDIFF_YOUR_SCORE)
      00085B 0E 27            [ 7]  846         ld      c,#SCREEN_WIDTH-1
      00085D ED B0            [21]  847         ldir
      00085F 2A F0 0D         [16]  848         ld      hl,(POINTS)
      000562                        849         SET_CURSOR_DE (5-POSDIFF_YOUR_SCORE_DY) (21+ALIGN_MIDDLE)
      000862 C5               [11]    1         push    bc
      000863 11 1A 03         [10]    2         ld      de,#((5-POSDIFF_YOUR_SCORE_DY)+1)*256+((21+ALIGN_MIDDLE)+1)
      000866 0E 12            [ 7]    3         ld      c,#UP_SETCU
      000868 CD 05 00         [17]    4         call    BOS
      00086B C1               [10]    5         pop     bc
      00086C CD EE 07         [17]  850         call    print_decimal
      00086F 3A F2 0D         [13]  851         ld      a,(LEVEL)
      000872 C6 2F            [ 7]  852         add     a,#'0'-1
      000874 32 BB EC         [13]  853         ld      (BWS+7*SCREEN_WIDTH+23+ALIGN_MIDDLE+3*POSDIFF_YOUR_SCORE),a
      000877 ED 5B 76 0E      [20]  854         ld      de,(HIGH_SCORE_TABLE01.points)
      00087B A7               [ 4]  855         and     a
      00087C ED 52            [15]  856         sbc     hl,de
      00087E D4 F2 09         [17]  857         call    nc,draw_new_highscore_box
      000581                        858         SET_CURSOR_HL (17-POSDIFF_YOUR_SCORE_DY) (3+ALIGN_MIDDLE)
      000881 D5               [11]    1         push    de
      000882 C5               [11]    2         push    bc
      000883 11 08 0F         [10]    3         ld      de,#((17-POSDIFF_YOUR_SCORE_DY)+1)*256+((3+ALIGN_MIDDLE)+1)
      000886 62               [ 4]    4         ld      h,d
      000887 6B               [ 4]    5         ld      l,e
      000888 0E 12            [ 7]    6         ld      c,#UP_SETCU
      00088A CD 05 00         [17]    7         call    BOS
      00088D C1               [10]    8         pop     bc
      00088E D1               [10]    9         pop     de
      00058F                        859         PRST7
      00088F CD CA 0E         [17]    1         call    prst7
      000892 20 49 4E 50 55 54 20   860         .ascis ' INPUT YOUR INITIALS: __ '
             59 4F 55 52 20 49 4E
             49 54 49 41 4C 53 3A
             20 5F 5F A0
                                    861         ; remove 2xcursor
      0008AB 21 C4 EE         [10]  862         ld      hl,#BWS+17*SCREEN_WIDTH+28
      0008AE 36 20            [10]  863         ld      (hl),#' '
      0008B0 21 01 EC         [10]  864         ld      hl,#BWS+0*SCREEN_WIDTH+1
      0008B3 36 20            [10]  865         ld      (hl),#' '
      0008B5 21 4D EE         [10]  866         ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+25+ALIGN_MIDDLE
      0005B8                        867         CURSOR_DISABLE
      0008B8 C5               [11]    1         push    bc
      0008B9 0E 1D            [ 7]    2         ld      c,#UP_DCU
      0008BB CD 05 00         [17]    3         call    BOS
      0008BE C1               [10]    4         pop     bc
      0005BF                        868         INCH
      0008BF AF               [ 4]    1         xor     a
      0008C0 32 25 00         [13]    2         ld      (KEYBU),a
      0008C3 3C               [ 4]    3 	inc     a
      0008C4 32 23 00         [13]    4 	ld      (COUNT),a
      0008C7 0E 01            [ 7]    5         ld      c,#UP_CONSI
      0008C9 CD 05 00         [17]    6         call    BOS
      0008CC 77               [ 7]  869         ld      (hl),a
      0008CD 32 92 0E         [13]  870         ld      (INITIALS),a
      0008D0 23               [ 6]  871         inc     hl
      0005D1                        872         INCH
      0008D1 AF               [ 4]    1         xor     a
      0008D2 32 25 00         [13]    2         ld      (KEYBU),a
      0008D5 3C               [ 4]    3 	inc     a
      0008D6 32 23 00         [13]    4 	ld      (COUNT),a
      0008D9 0E 01            [ 7]    5         ld      c,#UP_CONSI
      0008DB CD 05 00         [17]    6         call    BOS
      0008DE 77               [ 7]  873         ld      (hl),a
      0008DF 32 93 0E         [13]  874         ld      (INITIALS+1),a
      0008E2 ED 5B F0 0D      [20]  875         ld      de,(POINTS)
      0008E6 06 05            [ 7]  876         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      0008E8 2A 76 0E         [16]  877         ld      hl,(HIGH_SCORE_TABLE01.points)
      0008EB A7               [ 4]  878         and     a
      0008EC ED 52            [15]  879         sbc     hl,de
      0008EE DA C1 09         [10]  880         jp      c,insert_score
      0008F1 05               [ 4]  881         dec     b
      0008F2 2A 7B 0E         [16]  882         ld      hl,(HIGH_SCORE_TABLE02.points)
      0008F5 A7               [ 4]  883         and     a
      0008F6 ED 52            [15]  884         sbc     hl,de
      0008F8 DA C1 09         [10]  885         jp      c,insert_score
      0008FB 05               [ 4]  886         dec     b
      0008FC 2A 80 0E         [16]  887         ld      hl,(HIGH_SCORE_TABLE03.points)
      0008FF A7               [ 4]  888         and     a
      000900 ED 52            [15]  889         sbc     hl,de
      000902 DA C1 09         [10]  890         jp      c,insert_score
      000905 05               [ 4]  891         dec     b
      000906 2A 85 0E         [16]  892         ld      hl,(HIGH_SCORE_TABLE04.points)
      000909 A7               [ 4]  893         and     a
      00090A ED 52            [15]  894         sbc     hl,de
      00090C DA C1 09         [10]  895         jp      c,insert_score
      00090F 05               [ 4]  896         dec     b
      000910 2A 8A 0E         [16]  897         ld      hl,(HIGH_SCORE_TABLE05.points)
      000913 A7               [ 4]  898         and     a
      000914 ED 52            [15]  899         sbc     hl,de
      000916 DA C1 09         [10]  900         jp      c,insert_score
      000919                        901 print_highscore_table::
      000919 06 05            [ 7]  902         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      00091B 11 74 0E         [10]  903         ld      de,#HIGH_SCORE_TABLE01
      00091E 21 8A EE         [10]  904         ld      hl,#BWS+(20-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+6+ALIGN_MIDDLE
      000921                        905 print_highscore_entry:
      000921 3E 36            [ 7]  906         ld      a,#'6'
      000923 90               [ 4]  907         sub     b
      000924 77               [ 7]  908         ld      (hl),a
      000925 1A               [ 7]  909         ld      a,(de)
      000926 23               [ 6]  910         inc     hl
      000927 23               [ 6]  911         inc     hl
      000928 23               [ 6]  912         inc     hl
      000929 77               [ 7]  913         ld      (hl),a
      00092A 23               [ 6]  914         inc     hl
      00092B 13               [ 6]  915         inc     de
      00092C 1A               [ 7]  916         ld      a,(de)
      00092D 77               [ 7]  917         ld      (hl),a
      00092E 3E 2E            [ 7]  918         ld      a,#'.'
      000930 23               [ 6]  919         inc     hl
      000931 23               [ 6]  920         inc     hl
      000932 77               [ 7]  921         ld      (hl),a
      000933 23               [ 6]  922         inc     hl
      000934 77               [ 7]  923         ld      (hl),a
      000935 23               [ 6]  924         inc     hl
      000936 77               [ 7]  925         ld      (hl),a
      000937 23               [ 6]  926         inc     hl
      000938 23               [ 6]  927         inc     hl
      000639                        928         SET_CURSOR
      000939 CD D9 0E         [17]    1         call    set_cursor
      00093C 13               [ 6]  929         inc     de
      00093D 1A               [ 7]  930         ld      a,(de)
      00093E 6F               [ 4]  931         ld      l,a
      00093F 13               [ 6]  932         inc     de
      000940 1A               [ 7]  933         ld      a,(de)
      000941 67               [ 4]  934         ld      h,a
      000942 13               [ 6]  935         inc     de
      000943 C5               [11]  936         push    bc
      000944 D5               [11]  937         push    de
      000945 CD EE 07         [17]  938         call    print_decimal
      000948 D1               [10]  939         pop     de
      000949 C1               [10]  940         pop     bc
      00064A                        941         REMOVE_CURSOR
      00094A 2A 2D 00         [16]    1         ld      hl,(CURS)
      00094D 36 20            [10]    2         ld      (hl),#' '
      00094F CB 94            [ 8]    3         res     2,h
      000951 CB BE            [15]    4         res     7,(hl)
      000953 CB D4            [ 8]    5         set     2,h
      000955 23               [ 6]  942         inc     hl
      000956 23               [ 6]  943         inc     hl
      000957 23               [ 6]  944         inc     hl
      000958 36 30            [10]  945         ld      (hl),#'0'
      00095A 23               [ 6]  946         inc     hl
      00095B 1A               [ 7]  947         ld      a,(de)
      00095C C6 2F            [ 7]  948         add     a,#'0'-1
      00095E 77               [ 7]  949         ld      (hl),a
      00095F 13               [ 6]  950         inc     de
      000960 3E 15            [ 7]  951         ld      a,#SCREEN_WIDTH-19
      000962 85               [ 4]  952         add     a,l
      000963 6F               [ 4]  953         ld      l,a
      000964 3E 00            [ 7]  954         ld      a,#ZERO
      000966 8C               [ 4]  955         adc     a,h
      000967 67               [ 4]  956         ld      h,a
      000968 10 B7            [13]  957         djnz    print_highscore_entry
      00066A                        958         SET_CURSOR_HL (29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY) (9+ALIGN_MIDDLE)
      00096A D5               [11]    1         push    de
      00096B C5               [11]    2         push    bc
      00096C 11 0E 17         [10]    3         ld      de,#((29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)+1)*256+((9+ALIGN_MIDDLE)+1)
      00096F 62               [ 4]    4         ld      h,d
      000970 6B               [ 4]    5         ld      l,e
      000971 0E 12            [ 7]    6         ld      c,#UP_SETCU
      000973 CD 05 00         [17]    7         call    BOS
      000976 C1               [10]    8         pop     bc
      000977 D1               [10]    9         pop     de
      000678                        959         PRST7
      000978 CD CA 0E         [17]    1         call    prst7
      00097B 4E 45 57 20 47 41 4D   960         .ascii  'NEW GAME ? Y/N'
             45 20 3F 20 59 2F 4E
      000989 A0                     961         .db     0xa0
      00098A 21 8C EF         [10]  962         ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      00098D 36 20            [10]  963         ld      (hl),#' '
      00068F                        964         CURSOR_DISABLE
      00098F C5               [11]    1         push    bc
      000990 0E 1D            [ 7]    2         ld      c,#UP_DCU
      000992 CD 05 00         [17]    3         call    BOS
      000995 C1               [10]    4         pop     bc
      000996                        965 m_070a:
      000996                        966 ask_exit_game:
      000696                        967         INCH
      000996 AF               [ 4]    1         xor     a
      000997 32 25 00         [13]    2         ld      (KEYBU),a
      00099A 3C               [ 4]    3 	inc     a
      00099B 32 23 00         [13]    4 	ld      (COUNT),a
      00099E 0E 01            [ 7]    5         ld      c,#UP_CONSI
      0009A0 CD 05 00         [17]    6         call    BOS
      0009A3 FE 59            [ 7]  968         cp      #'Y'
      0009A5 CA A1 03         [10]  969         jp      z,new_game
      0009A8 FE 4E            [ 7]  970         cp      #'N'
      0009AA 20 EA            [12]  971         jr      nz,ask_exit_game
      0009AC                        972 exit_game:
      0006AC                        973         PRST7
      0009AC CD CA 0E         [17]    1         call    prst7
      0009AF 0C                     974         .db     0x0c
      0009B0 4A 75 6D 70 69 6E 67   975         .ascii  'Jumping Jack'
             20 4A 61 63 6B
      0009BC 0D 8D                  976         .db     0x0d,0x8d
      0006BE                        977         END_PROGRAM
      0009BE C3 03 F0         [10]    1         jp      WBOOT
      0009C1                        978 insert_score:
      0009C1 D5               [11]  979         push    de
      0009C2 11 8D 0E         [10]  980         ld      de,#HIGH_SCORE_TABLE_TMP
      0009C5 21 88 0E         [10]  981         ld      hl,#HIGH_SCORE_TABLE05
      0009C8                        982 move_table_entry:
      0009C8 C5               [11]  983         push    bc
      0009C9 01 05 00         [10]  984         ld      bc,#HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05
      0009CC ED B0            [21]  985         ldir
      0009CE EB               [ 4]  986         ex      de,hl
      0009CF 0E 0A            [ 7]  987         ld      c,#2*(HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05)
      0009D1 A7               [ 4]  988         and     a
      0009D2 ED 42            [15]  989         sbc     hl,bc
      0009D4 EB               [ 4]  990         ex      de,hl
      0009D5 A7               [ 4]  991         and     a
      0009D6 ED 42            [15]  992         sbc     hl,bc
      0009D8 C1               [10]  993         pop     bc
      0009D9 10 ED            [13]  994         djnz    move_table_entry
      0009DB 3A 92 0E         [13]  995         ld      a,(INITIALS)
      0009DE 12               [ 7]  996         ld      (de),a
      0009DF 13               [ 6]  997         inc     de
      0009E0 3A 93 0E         [13]  998         ld      a,(INITIALS+1)
      0009E3 12               [ 7]  999         ld      (de),a
      0009E4 EB               [ 4] 1000         ex      de,hl
      0009E5 D1               [10] 1001         pop     de
      0009E6 23               [ 6] 1002         inc     hl
      0009E7 73               [ 7] 1003         ld      (hl),e
      0009E8 23               [ 6] 1004         inc     hl
      0009E9 72               [ 7] 1005         ld      (hl),d
      0009EA 23               [ 6] 1006         inc     hl
      0009EB 3A F2 0D         [13] 1007         ld      a,(LEVEL)
      0009EE 77               [ 7] 1008         ld      (hl),a
      0009EF C3 19 09         [10] 1009         jp      print_highscore_table
      0009F2                       1010 draw_new_highscore_box:
      0009F2 21 FB EC         [10] 1011         ld      hl,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      0009F5 36 2A            [10] 1012         ld      (hl),#'*'
      0009F7 11 FC EC         [10] 1013         ld      de,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+8+ALIGN_MIDDLE
      0009FA 01 11 00         [10] 1014         ld      bc,#TXT_NEW_HIGH_SCORE_size-1
      0009FD ED B0            [21] 1015         ldir
      0009FF 0E 8F            [ 7] 1016         ld      c,#4*SCREEN_WIDTH-TXT_NEW_HIGH_SCORE_size+1
      000A01 09               [11] 1017         add     hl,bc
      000A02 EB               [ 4] 1018         ex      de,hl
      000A03 09               [11] 1019         add     hl,bc
      000A04 EB               [ 4] 1020         ex      de,hl
      000A05 0E 11            [ 7] 1021         ld      c,#TXT_NEW_HIGH_SCORE_size-1
      000A07 36 2A            [10] 1022         ld      (hl),#'*'
      000A09 ED B0            [21] 1023         ldir
      000A0B 11 4B ED         [10] 1024         ld      de,#BWS+(11-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      000A0E 21 B8 0E         [10] 1025         ld      hl,#TXT_NEW_HIGH_SCORE
      000A11 0E 12            [ 7] 1026         ld      c,#TXT_NEW_HIGH_SCORE_size
      000A13 ED B0            [21] 1027         ldir
      000A15 1E 23            [ 7] 1028         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      000A17 3E 2A            [ 7] 1029         ld      a,#'*'
      000A19 12               [ 7] 1030         ld      (de),a
      000A1A 1E 34            [ 7] 1031         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000A1C 12               [ 7] 1032         ld      (de),a
      000A1D 1E 73            [ 7] 1033         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      000A1F 12               [ 7] 1034         ld      (de),a
      000A20 1E 84            [ 7] 1035         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000A22 12               [ 7] 1036         ld      (de),a
      000A23 C9               [10] 1037         ret
      000A24                       1038 TOP_IMAGE:
                                   1039         ; line 1
      000724                       1040         SCREEN_POS
      000A24 20 20 20 20              1         .ascii '    '
      000A28 AE 9E 9E 9E 9E 9E 9E  1041         .db     0xae,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e ;........
             9E
      000A30 9E 9E AD 20 20 20 20  1042         .db     0x9e,0x9e,0xad,0x20,0x20,0x20,0x20,0x20 ;..-     
             20
      000A38 20 20 20 20 20 20 20  1043         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000A40 20 20 20 20 20 20 20  1044         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000748                       1045         SCREEN_POS
      000A48 20 20 20 20              1         .ascii '    '
                                   1046         
                                   1047         ; line 2
      00074C                       1048         SCREEN_POS
      000A4C 20 20 20 20              1         .ascii '    '
      000A50 9F B9 B6 B3 B2 B6 B8  1049         .db     0x9f,0xb9,0xb6,0xb3,0xb2,0xb6,0xb8,0x20 ;.963268 
             20
      000A58 BD B0 C0 20 20 20 20  1050         .db     0xbd,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;=0@     
             20
      000A60 20 20 20 20 20 20 20  1051         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      000A68 20 20 20 20 20 20 20  1052         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000770                       1053         SCREEN_POS
      000A70 20 20 20 20              1         .ascii '    '
                                   1054 
                                   1055         ; line 3
      000774                       1056         SCREEN_POS
      000A74 20 20 20 20              1         .ascii '    '
      000A78 9F B8 B7 20 B5 20 20  1057         .db     0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
             20
      000A80 B5 20 C0 20 20 20 20  1058         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      000A88 20 20 20 20 20 20 20  1059         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      000A90 20 20 20 20 B7 B7 20  1060         .db     0x20,0x20,0x20,0x20,0xb7,0xb7,0x20,0x20 ;    77  
             20
      000798                       1061         SCREEN_POS
      000A98 20 20 20 20              1         .ascii '    '
                                   1062 
                                   1063         ; line 4
      00079C                       1064         SCREEN_POS
      000A9C 20 20 20 20              1         .ascii '    '
      000AA0 9F B3 20 B4 B5 20 B2  1065         .db     0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
             20
      000AA8 B5 20 C0 20 20 20 20  1066         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      000AB0 20 20 20 20 20 20 20  1067         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000AB8 B6 B7 20 B9 B2 B2 B8  1068         .db     0xb6,0xb7,0x20,0xb9,0xb2,0xb2,0xb8,0x20 ;67 9228 
             20
      0007C0                       1069         SCREEN_POS
      000AC0 20 20 20 20              1         .ascii '    '
                                   1070 
                                   1071         ; line 5
      0007C4                       1072         SCREEN_POS
      000AC4 20 20 20 20              1         .ascii '    '
      000AC8 9F B1 B6 20 20 B6 B0  1073         .db     0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
             20
      000AD0 B6 B0 C0 20 20 20 20  1074         .db     0xb6,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;60@     
             20
      000AD8 20 20 B2 B3 20 20 20  1075         .db     0x20,0x20,0xb2,0xb3,0x20,0x20,0x20,0x20 ;  23    
             20
      000AE0 20 BA A0 B4 B4 A0 B5  1076         .db     0x20,0xba,0xa0,0xb4,0xb4,0xa0,0xb5,0x20 ; : 44 5 
             20
      0007E8                       1077         SCREEN_POS
      000AE8 20 20 20 20              1         .ascii '    '
                                   1078 
                                   1079         ; line 6
      0007EC                       1080         SCREEN_POS
      000AEC 20 20 20 20              1         .ascii '    '
      000AF0 9F 70 72 65 73 65 6E  1081         .db     0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
             74
      000AF8 73 3A C0 20 20 20 20  1082         .db     0x73,0x3a,0xc0,0x20,0x20,0x20,0x20,0x20 ;s:@     
             20
      000B00 20 B2 B0 B1 B3 20 20  1083         .db     0x20,0xb2,0xb0,0xb1,0xb3,0x20,0x20,0xb7 ; 2013  7
             B7
      000B08 B6 B1 B3 B8 B1 B1 B9  1084         .db     0xb6,0xb1,0xb3,0xb8,0xb1,0xb1,0xb9,0x20 ;6138119 
             20
      000810                       1085         SCREEN_POS
      000B10 20 20 20 20              1         .ascii '    '
                                   1086 
                                   1087         ; line 7
      000814                       1088         SCREEN_POS
      000B14 20 20 20 20              1         .ascii '    '
      000B18 AB F8 F8 F8 F8 F8 F8  1089         .db     0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
             F8
      000B20 F8 F8 AC 20 20 20 20  1090         .db     0xf8,0xf8,0xac,0x20,0x20,0x20,0x20,0x20 ;xx,     
             20
      000B28 20 B0 20 20 B5 B7 B6  1091         .db     0x20,0xb0,0x20,0x20,0xb5,0xb7,0xb6,0x20 ; 0  576 
             20
      000B30 20 20 B1 B3 B6 BC 20  1092         .db     0x20,0x20,0xb1,0xb3,0xb6,0xbc,0x20,0x20 ;  136<  
             20
      000838                       1093         SCREEN_POS
      000B38 20 20 20 20              1         .ascii '    '
                                   1094 
                                   1095         ; line 8
      00083C                       1096         SCREEN_POS
      000B3C 20 20 20 20              1         .ascii '    '
      000B40 20 20 20 20 20 20 20  1097         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B48 20 20 20 20 20 20 20  1098         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B50 B1 B6 B6 B6 B6 20 20  1099         .db     0xb1,0xb6,0xb6,0xb6,0xb6,0x20,0x20,0x20 ;16666   
             20
      000B58 20 20 20 B1 B9 20 20  1100         .db     0x20,0x20,0x20,0xb1,0xb9,0x20,0x20,0x20 ;   19   
             20
      000860                       1101          SCREEN_POS
      000B60 20 20 20 20              1         .ascii '    '
                                   1102 
                                   1103         ; line 9
      000864                       1104         Z1013_LINE
                                   1105 
                                   1106         ; line 10
      000864                       1107         Z1013_LINE
                                   1108 
                                   1109         ; line 11
      000864                       1110         SCREEN_POS
      000B64 20 20 20 20              1         .ascii '    '
      000B68 20 20 20 20 20 20 20  1111         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B70 20 20 20 20 20 20 20  1112         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B78 20 20 20 20 20 20 20  1113         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B80 20 20 20 20 20 20 20  1114         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000888                       1115          SCREEN_POS
      000B88 20 20 20 20              1         .ascii '    '
                                   1116 
                                   1117         ; line 12
      00088C                       1118         SCREEN_POS
      000B8C 20 20 20 20              1         .ascii '    '
      000B90 20 20 20 B4 20 20 20  1119         .db     0x20,0x20,0x20,0xb4,0x20,0x20,0x20,0x20 ;   4    
             20
      000B98 20 20 20 20 B0 20 20  1120         .db     0x20,0x20,0x20,0x20,0xb0,0x20,0x20,0x20 ;    0   
             20
      000BA0 20 20 20 20 20 20 B4  1121         .db     0x20,0x20,0x20,0x20,0x20,0x20,0xb4,0x20 ;      4 
             20
      000BA8 20 20 20 20 B4 B2 20  1122         .db     0x20,0x20,0x20,0x20,0xb4,0xb2,0x20,0x20 ;    42  
             20
      0008B0                       1123          SCREEN_POS
      000BB0 20 20 20 20              1         .ascii '    '
                                   1124 
                                   1125         ; line 13
      0008B4                       1126         SCREEN_POS
      000BB4 20 20 20 20              1         .ascii '    '
      000BB8 20 20 20 B4 B4 B5 B5  1127         .db     0x20,0x20,0x20,0xb4,0xb4,0xb5,0xb5,0xbd ;   4455=
             BD
      000BC0 BD B5 B6 B3 B4 BC BD  1128         .db     0xbd,0xb5,0xb6,0xb3,0xb4,0xbc,0xbd,0xb2 ;=5634<=2
             B2
      000BC8 B6 B3 20 20 20 20 B4  1129         .db     0xb6,0xb3,0x20,0x20,0x20,0x20,0xb4,0xb1 ;63    41
             B1
      000BD0 B8 B2 B6 B3 BB B0 20  1130         .db     0xb8,0xb2,0xb6,0xb3,0xbb,0xb0,0x20,0x20 ;8263;0  
             20
      0008D8                       1131          SCREEN_POS
      000BD8 20 20 20 20              1         .ascii '    '
                                   1132 
                                   1133         ; line 14
      0008DC                       1134         SCREEN_POS
      000BDC 20 20 20 20              1         .ascii '    '
      000BE0 20 B3 20 B4 B4 B5 B5  1135         .db     0x20,0xb3,0x20,0xb4,0xb4,0xb5,0xb5,0xb5 ; 3 44555
             B5
      000BE8 B5 B5 B7 B0 B4 B4 B5  1136         .db     0xb5,0xb5,0xb7,0xb0,0xb4,0xb4,0xb5,0xb1 ;55704451
             B1
      000BF0 B7 B4 20 20 B3 20 B4  1137         .db     0xb7,0xb4,0x20,0x20,0xb3,0x20,0xb4,0xb9 ;74  3 49
             B9
      000BF8 BD B5 20 B3 B4 B8 20  1138         .db     0xbd,0xb5,0x20,0xb3,0xb4,0xb8,0x20,0x20 ;=5 348  
             20
      000900                       1139          SCREEN_POS
      000C00 20 20 20 20              1         .ascii '    '
                                   1140 
                                   1141         ; line 15
      000904                       1142         SCREEN_POS
      000C04 20 20 20 20              1         .ascii '    '
      000C08 20 B8 B7 B0 B1 B0 B1  1143         .db     0x20,0xb8,0xb7,0xb0,0xb1,0xb0,0xb1,0xb1 ; 8701011
             B1
      000C10 B1 B5 20 20 B0 B0 B1  1144         .db     0xb1,0xb5,0x20,0x20,0xb0,0xb0,0xb1,0xb1 ;15  0011
             B1
      000C18 B7 B0 20 20 B8 B7 B0  1145         .db     0xb7,0xb0,0x20,0x20,0xb8,0xb7,0xb0,0xb1 ;70  8701
             B1
      000C20 B6 20 B6 20 B0 20 B0  1146         .db     0xb6,0x20,0xb6,0x20,0xb0,0x20,0xb0,0x20 ;6 6 0 0 
             20
      000928                       1147          SCREEN_POS
      000C28 20 20 20 20              1         .ascii '    '
                                   1148 
                                   1149         ; line 16
      00092C                       1150         SCREEN_POS
      000C2C 20 20 20 20              1         .ascii '    '
      000C30 20 20 20 20 20 20 20  1151         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C38 20 20 20 20 20 20 20  1152         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C40 20 20 20 20 20 20 20  1153         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C48 20 20 20 20 20 20 20  1154         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000950                       1155         SCREEN_POS
      000C50 20 20 20 20              1         .ascii '    '
                                   1156 
      000C54                       1157 HINT_RIGHT:
      000C54 2D 3E 20 2E 2E 2E 20  1158         .db     0x2d,0x3e,0x20,0x2e,0x2e,0x2e,0x20,0x52 ;-> ... R
             52
      000C5C 69 67 68 74           1159         .db     0x69,0x67,0x68,0x74                     ;ight
      000C60                       1160 HINT_LEFT:
      000C60 3C 2D 20 2E 2E 2E 2E  1161         .db     0x3c,0x2d,0x20,0x2e,0x2e,0x2e,0x2e,0x20 ;<- .... 
             20
      000C68 4C 65 66 74           1162         .db     0x4c,0x65,0x66,0x74                     ;Left
      000C6C                       1163 HINT_JUMP:
      000C6C 53 50 20 2E 2E 2E 2E  1164         .ascii  'SP .... Jump'
             20 4A 75 6D 70
      000C78                       1165 HINT_PLAY:
      000C78 50 20 2E 2E 2E 2E 2E  1166         .ascii  'P ..... Play'
             20 50 6C 61 79
      000C84                       1167 HINT_EXIT:
      000C84 45 20 2E 2E 2E 2E 2E  1168         .ascii  'E ..... Exit'
             20 45 78 69 74
      000C90                       1169 HINT_COPYRIGHT:
      000C90 43 20 31 39 38 36 20  1170         .ascii  'C 1986 Software Center Ilmenau'
             53 6F 66 74 77 61 72
             65 20 43 65 6E 74 65
             72 20 49 6C 6D 65 6E
             61 75
      000CAE                       1171 HINT_NAME:
      000CAE 47 2E 46 69 73 63 68  1172         .ascii  'G.Fischer & CO'
             65 72 20 26 20 43 4F
      000CBC                       1173 HINT_YEAR:
      000CBC 20 20 32 30 32 30 20  1174         .ascii  '  2020 Version'
             56 65 72 73 69 6F 6E
      000CCA                       1175 VERSION_INFO:
      000CCA 20 31 2E 31 20        1176         .db     0x20,0x31,0x2e,0x31,0x20                ; 1.1 
      000CCF                       1177 LINE_BUFFER:
      000CCF EE EE EE EE EE EE EE  1178         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CD7 EE EE EE EE EE EE EE  1179         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CDF EE EE EE EE EE EE EE  1180         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CE7 EE EE EE EE EE EE EE  1181         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CEF EE EE EE EE EE EE EE  1182         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CF7 EE EE EE EE EE EE EE  1183         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CFF EE EE EE EE EE EE EE  1184         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D07 EE EE EE EE EE EE EE  1185         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D0F 20 20 20 EE EE EE EE  1186         .db     0x20,0x20,0x20,0xee,0xee,0xee,0xee,0xee ;   nnnnn
             EE
      000D17 EE EE EE EE EE EE EE  1187         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D1F EE EE EE EE EE 20 20  1188         .db     0xee,0xee,0xee,0xee,0xee,0x20,0x20,0x20 ;nnnnn   
             20
      000D27 20 20 EE EE EE EE EE  1189         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000D2F EE EE EE EE EE EE EE  1190         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D37 EE 20 20 20 EE EE EE  1191         .db     0xee,0x20,0x20,0x20,0xee,0xee,0xee,0xee ;n   nnnn
             EE
      000D3F EE EE EE EE EE EE EE  1192         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D47 EE EE EE 20 20 20 EE  1193         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D4F EE EE EE EE EE EE EE  1194         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D57 EE EE EE EE 20 20 20  1195         .db     0xee,0xee,0xee,0xee,0x20,0x20,0x20,0xee ;nnnn   n
             EE
      000D5F EE EE EE EE EE EE EE  1196         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0x20 ;nnnnnnn 
             20
      000D67 20 20 EE EE EE EE EE  1197         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000D6F EE EE EE 20 20 20 EE  1198         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D77 EE EE EE EE EE EE EE  1199         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D7F EE EE EE EE EE EE EE  1200         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D87 EE EE EE EE EE EE EE  1201         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D8F EE EE EE 20 20 20 EE  1202         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D97 EE EE EE EE EE EE EE  1203         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D9F EE EE EE EE EE EE EE  1204         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DA7 EE EE EE EE EE EE 20  1205         .db     0xee,0xee,0xee,0xee,0xee,0xee,0x20,0x20 ;nnnnnn  
             20
      000DAF 20 EE EE EE EE EE EE  1206         .db     0x20,0xee,0xee,0xee,0xee,0xee,0xee,0xee ; nnnnnnn
             EE
      000DB7 EE EE EE EE EE EE EE  1207         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DBF EE EE EE EE EE EE EE  1208         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DC7 EE EE EE EE EE EE EE  1209         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DCF EE EE EE EE EE EE EE  1210         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DD7 EE EE EE EE EE EE EE  1211         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee      ;nnnnnnn
                                   1212 ; unchecked data source
      000DDE EE                    1213         .db     0xee                                    ;n
      000DDF                       1214 OFFSET_HOLES:
      000DDF 58 7C 41 98 56        1215         .db     0x58,0x7c,0x41,0x98,0x56                ;X|A.V
      000DE4                       1216 OFFSET_HOLES_JUMP_PENALTY:
      000DE4 8B A2 68 C2 DD        1217         .db     0x8b,0xa2,0x68,0xc2,0xdd                ;."hB]
      000DE9                       1218 cnt_fail_trap:
      000DE9 05                    1219         .db     5
      000DEA                       1220 cnt_fail_jump:
      000DEA 05                    1221         .db     5
      000DEB                       1222 MAN_HEAD:
      000DEB 32 EF                 1223         .dw     BWS+(GAME_START_Y+(8-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      000DED                       1224 JUMP_DELAY:
      000DED 01                    1225         .db     1
      000DEE                       1226 FAIL_DELAY:
      000DEE 01                    1227         .db     1
      000DEF                       1228 LIVES:
      000DEF 06                    1229         .db     6
      000DF0                       1230 POINTS:
      000DF0 00 00                 1231         .dw     0
      000DF2                       1232 LEVEL:
      000DF2 01                    1233         .db     1
      000DF3                       1234 counter:
      000DF3 01                    1235         .db     1
      000DF4                       1236 TXT_JUMP:
      000DF4 2A 20 4A 55 4D 50 49  1237         .ascii  '* JUMPING JACK *'
             4E 47 20 4A 41 43 4B
             20 2A
      000E04                       1238 MONSTER_PTR:
      000E04 DF ED                 1239         .dw     BWS+(GAME_START_Y+3*3+1)*SCREEN_WIDTH-1
      000E06 30 EE                 1240         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+0
      000E08 31 EE                 1241         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000E0A 32 EE                 1242         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
                                   1243 
      000E0C D5 EC                 1244         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
      000E0E D6 EC                 1245         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+14
      000E10 D7 EC                 1246         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+15
      000E12 D8 EC                 1247         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+16
                                   1248 
      000E14 31 EE                 1249         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000E16 32 EE                 1250         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
      000E18 33 EE                 1251         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+3
      000E1A 34 EE                 1252         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+4
                                   1253 
      000E1C C1 EE                 1254         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+25
      000E1E C2 EE                 1255         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+26
      000E20 C3 EE                 1256         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+27
      000E22 C4 EE                 1257         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+28
                                   1258 
      000E24 D2 EC                 1259         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+10
      000E26 D3 EC                 1260         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+11
      000E28 D4 EC                 1261         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+12
      000E2A D5 EC                 1262         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
                                   1263 
      000E2C B3 EE                 1264         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+11
      000E2E B4 EE                 1265         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+12
      000E30 B5 EE                 1266         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+13
      000E32 B6 EE                 1267         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14
                                   1268 
      000E34 BD EE                 1269         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+21
      000E36 BE EE                 1270         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+22
      000E38 BF EE                 1271         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+23
      000E3A C0 EE                 1272         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+24
      000E3C                       1273 MONSTER_IMG:
      000E3C 94 90 8B 90 8B 91 97  1274         .db     0x94,0x90,0x8b,0x90,0x8b,0x91,0x97,0x91 ;........
             91
      000E44 19 B5 20 BE 20 BF 20  1275         .db     0x19,0xb5,0x20,0xbe,0x20,0xbf,0x20,0xae ;.5 > ? .
             AE
      000E4C 92 96 A0 A0 A0 A0 88  1276         .db     0x92,0x96,0xa0,0xa0,0xa0,0xa0,0x88,0xc1 ;..    .A
             C1
      000E54 20 95 20 B7 1E FF 20  1277         .db     0x20,0x95,0x20,0xb7,0x1e,0xff,0x20,0x92 ; . 7.. .
             92
      000E5C 17 8C F9 8C 1D 1F FC  1278         .db     0x17,0x8c,0xf9,0x8c,0x1d,0x1f,0xfc,0x8c ;..y...|.
             8C
      000E64 92 96 83 82 95 93 20  1279         .db     0x92,0x96,0x83,0x82,0x95,0x93,0x20,0x20 ;......  
             20
      000E6C 20 20 20 20 20 20 20  1280         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000E74                       1281 HIGH_SCORE_TABLE01:
      000E74 5F 5F                 1282         .ascii '__'
      000E76                       1283 HIGH_SCORE_TABLE01.points:
      000E76 00 00                 1284         .dw     0
      000E78                       1285 HIGH_SCORE_TABLE01.level:
      000E78 01                    1286         .db     1
      000E79                       1287 HIGH_SCORE_TABLE02:
      000E79 5F 5F                 1288         .ascii '__'
      000E7B                       1289 HIGH_SCORE_TABLE02.points:
      000E7B 00 00                 1290         .dw     0
      000E7D                       1291 HIGH_SCORE_TABLE02.level:
      000E7D 01                    1292         .db     1
      000E7E                       1293 HIGH_SCORE_TABLE03:
      000E7E 5F 5F                 1294         .ascii '__'
      000E80                       1295 HIGH_SCORE_TABLE03.points:
      000E80 00 00                 1296         .dw     0
      000E82                       1297 HIGH_SCORE_TABLE03.level:
      000E82 01                    1298         .db     1
      000E83                       1299 HIGH_SCORE_TABLE04:
      000E83 5F 5F                 1300         .ascii '__'
      000E85                       1301 HIGH_SCORE_TABLE04.points:
      000E85 00 00                 1302         .dw     0
      000E87                       1303 HIGH_SCORE_TABLE04.level:
      000E87 01                    1304         .db     1
      000E88                       1305 HIGH_SCORE_TABLE05:
      000E88 5F 5F                 1306         .ascii '__'
      000E8A                       1307 HIGH_SCORE_TABLE05.points:
      000E8A 00 00                 1308         .dw     0
      000E8C                       1309 HIGH_SCORE_TABLE05.level:
      000E8C 01                    1310         .db     1
      000E8D                       1311 HIGH_SCORE_TABLE_TMP:
      000E8D 5F 5F                 1312         .ascii '__'
      000E8F                       1313 HIGH_SCORE_TABLE_TMP.points:
      000E8F 00 00                 1314         .dw     0
      000E91                       1315 HIGH_SCORE_TABLE_TMP.level:
      000E91 01                    1316         .db     1
      000E92                       1317 INITIALS:
      000E92 5F 5F                 1318         .ascii '__'
      000E94                       1319 TXT_GAME_OVER:
      000E94 2A 2A 20 47 41 4D 45  1320         .ascii  '** GAME OVER **'
             20 4F 56 45 52 20 2A
             2A
      000EA3                       1321 TXT_YOUR_SCORE:
      000EA3 59 4F 55 52 20 53 43  1322         .ascii  'YOUR SCORE :'
             4F 52 45 20 3A
      000EAF                       1323 TXT_HAZARD:
      000EAF 48 41 5A 41 52 44 53  1324         .ascii  'HAZARDS :'
             20 3A
      000EB8                       1325 TXT_NEW_HIGH_SCORE:
      000EB8 2A 20 4E 45 57 20 48  1326         .ascii  '* NEW HIGH SCORE *'
             49 47 48 20 53 43 4F
             52 45 20 2A
                                   1327 ; end of source

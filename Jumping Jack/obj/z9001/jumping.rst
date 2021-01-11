                                      1         .module jumping_jack
                                      2         .include 'platform.s'
                           000001     1 z9001                           =       1
                           000000     2 z1013                           =       0
                                      3 ;
                                      4 ; z9001 specific constants
                                      5 ;
                           000005     6 BOS                             =       0x0005
                           000025     7 KEYBU                           =       0x0025
                           00002D     8 CURS                            =       0x002d
                           00F003     9 WBOOT                           =       0xF003
                           000001    10 UP_CONSI                        =       1
                           000002    11 UP_CONSO                        =       2
                           000009    12 UP_PRNST                        =       9
                           00000B    13 UP_CSTS                         =       11
                           000012    14 UP_SETCU                        =       18
                           00001D    15 UP_DCU                          =       29
                                     16 ;
                                     17 ; platform specific
                                     18 ;
                           000028    19 SCREEN_WIDTH                    =       40
                           000018    20 SCREEN_HEIGHT                   =       24
                                     21 
                           00000E    22 TOP_LINES                       =       14
                           000230    23 TITLE_TOP_SIZE                  =       SCREEN_WIDTH*TOP_LINES
                           000010    24 MENU_TOP                        =       (TOP_LINES+2)
                           000004    25 ALIGN_MIDDLE                    =       4
                           000006    26 GAMES_LINES                     =       6
                           000002    27 GAME_START_Y                    =       2
                           005208    28 SLOW_DOWN_13066                 =       21000
                           00EF98    29 POS_LIVES                       =       BWS+23*SCREEN_WIDTH
                           00EC28    30 POS_TOP_WALL                    =       BWS+ 1*SCREEN_WIDTH
                           00EC0C    31 POS_TOP_GAME                    =       BWS+ 0*SCREEN_WIDTH+8+ALIGN_MIDDLE
                           00EC0D    32 POS_GAME_OVER                   =       BWS+ 0*SCREEN_WIDTH+9+ALIGN_MIDDLE
                           000370    33 POS_COPYRIGHT                   =       SCREEN_WIDTH*22
                           00000D    34 POSDIFF_NAME                    =       SCREEN_WIDTH-HINT_COPYRIGHT_size+3
                           000005    35 POSDIFF_YEAR                    =       5
                           000008    36 POSDIFF_POINTS                  =       8
                           FFFFFFD8    37 POSDIFF_YOUR_SCORE              =       -(SCREEN_WIDTH)
                           000003    38 POSDIFF_YOUR_SCORE_DY           =       3
                           000004    39 POSDIFF_HIGHSCORE_DY            =       4
                           000001    40 MONSTER_CORRECTION              =       1
                                     41 
                                     42 .macro PROGRAM_START
                                     43         jp START
                                     44         .ascii 'JUMP    '
                                     45         .dw 0
                                     46 START:
                                     47         .endm
                                     48 
                                     49 .macro SCREEN_POS
                                     50         .ascii '    '
                                     51  .endm
                                     52 
                                     53 .macro CLRSCR
                                     54         ld      c,#UP_CONSO
                                     55         ld      e,#0x0c
                                     56         call    BOS
                                     57         ld      c,#UP_DCU
                                     58         call    BOS
                                     59 .endm
                                     60 
                                     61 .macro OUTCH
                                     62         push    bc
                                     63         push    de
                                     64         ld      c,#UP_CONSO
                                     65         ld      e,a
                                     66         call    BOS
                                     67         pop     de
                                     68         pop     bc
                                     69 .endm
                                     70 
                                     71 .macro INCH
                                     72         xor     a
                                     73         ld      (KEYBU),a
                                     74         ld      c,#UP_CONSI
                                     75         call    BOS
                                     76 .endm
                                     77 
                                     78 .macro PRST7
                                     79         call    prst7
                                     80 .endm
                                     81 
                                     82 .macro INKEY
                                     83         ld      a,(KEYBU)
                                     84         push    af
                                     85         xor     a
                                     86         ld      (KEYBU),a
                                     87         pop     af
                                     88 .endm
                                     89 
                                     90 .macro END_PROGRAM
                                     91         jp      WBOOT
                                     92 .endm
                                     93 
                                     94 .macro SET_CURSOR_DE    Y,X
                                     95         push    bc
                                     96         ld      de,#(Y+1)*256+(X+1)
                                     97         ld      c,#UP_SETCU
                                     98         call    BOS
                                     99         pop     bc
                                    100 .endm
                                    101 
                                    102 .macro SET_CURSOR_HL    Y,X
                                    103         push    de
                                    104         push    bc
                                    105         ld      de,#(Y+1)*256+(X+1)
                                    106         ld      h,d
                                    107         ld      l,e
                                    108         ld      c,#UP_SETCU
                                    109         call    BOS
                                    110         pop     bc
                                    111         pop     de
                                    112 .endm
                                    113 
                                    114 .macro SET_CURSOR
                                    115         call    set_cursor
                                    116 .endm
                                    117 
                                    118 .macro REMOVE_CURSOR
                                    119         ld      hl,(CURS)
                                    120         ld      (hl),#' '
                                    121         res     2,h
                                    122         res     7,(hl)
                                    123         set     2,h
                                    124 .endm
                                    125 
                                    126 .macro CURSOR_DISABLE
                                    127         push    bc
                                    128         ld      c,#UP_DCU
                                    129         call    BOS
                                    130         pop     bc
                                    131 .endm
                                    132 
                                    133 .macro Z1013_LINE
                                    134 .endm
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
      00031C 21 10 0A         [10]   79         ld      hl,#TOP_IMAGE
      00031F 01 30 02         [10]   80         ld      bc,#TITLE_TOP_SIZE
      000322 ED B0            [21]   81         ldir
      000324 21 30 EE         [10]   82         ld      hl,#BWS+SCREEN_WIDTH*TOP_LINES
      000327 36 CB            [10]   83         ld      (hl),#VK_HEART
      000329 11 31 EE         [10]   84         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+1
      00032C 01 27 00         [10]   85         ld      bc,#SCREEN_WIDTH-1
      00032F ED B0            [21]   86         ldir
      000331 11 50 EE         [10]   87         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+(SCREEN_WIDTH-8)
      000334 21 B6 0C         [10]   88         ld      hl,#VERSION_INFO
      000337 01 05 00         [10]   89         ld      bc,#VERSION_INFO_size
      00033A ED B0            [21]   90         ldir
      00033C 11 8E EE         [10]   91         ld      de,#BWS+SCREEN_WIDTH*MENU_TOP+10+ALIGN_MIDDLE
      00033F 21 40 0C         [10]   92         ld      hl,#HINT_RIGHT
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
      000396 CA 98 09         [10]  142         jp      z,exit_game
      000399 FE 50            [ 7]  143         cp      #'P'
      00039B 20 E7            [12]  144         jr      nz,choose_menu
      00039D                        145 new_game:
      00009D                        146         CLRSCR
      00039D 0E 02            [ 7]    1         ld      c,#UP_CONSO
      00039F 1E 0C            [ 7]    2         ld      e,#0x0c
      0003A1 CD 05 00         [17]    3         call    BOS
      0003A4 0E 1D            [ 7]    4         ld      c,#UP_DCU
      0003A6 CD 05 00         [17]    5         call    BOS
      0003A9 21 DB 0D         [10]  147         ld      hl,#LIVES
      0003AC 36 06            [10]  148         ld      (hl),#INITIAL_LIVES
      0003AE 21 DC 0D         [10]  149         ld      hl,#POINTS
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
      0003C5 32 DE 0D         [13]  162         ld      (LEVEL),a
      0003C8 3E 02            [ 7]  163         ld      a,#INITIAL_FAIL_COUNTER
      0003CA 32 D5 0D         [13]  164         ld      (cnt_fail_trap),a
      0003CD 32 D6 0D         [13]  165         ld      (cnt_fail_jump),a
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
      000402 21 E0 0D         [10]  190         ld      hl,#TXT_JUMP
      000405 11 0C EC         [10]  191         ld      de,#POS_TOP_GAME
      000408 01 10 00         [10]  192         ld      bc,#TXT_JUMP_size
      00040B ED B0            [21]  193         ldir
      00040D 3E 01            [ 7]  194         ld      a,#INITIAL_DELAY_COUNTER
      00040F 21 D9 0D         [10]  195         ld      hl,#JUMP_DELAY
      000412 77               [ 7]  196         ld      (hl),a
      000413 21 DA 0D         [10]  197         ld      hl,#FAIL_DELAY
      000416 77               [ 7]  198         ld      (hl),a
      000417 23               [ 6]  199         inc     hl
      000418 21 32 EF         [10]  200         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      00041B 22 D7 0D         [16]  201         ld      (MAN_HEAD),hl
      00041E 36 CC            [10]  202         ld      (hl),#CHR_MAN_HEAD
      000420 11 28 00         [10]  203         ld      de,#SCREEN_WIDTH
      000423 19               [11]  204         add     hl,de
      000424 36 A1            [10]  205         ld      (hl),#CHR_MAN_STAY
      000426                        206 animation_loop:
      000426 CD C2 04         [17]  207         call    animation_monster
      000429 CD 81 05         [17]  208         call    animation_lines
      00042C CD F1 05         [17]  209         call    animation_delay
      00042F 3A D9 0D         [13]  210         ld      a,(JUMP_DELAY)
      000432 FE 01            [ 7]  211         cp      #INITIAL_DELAY_COUNTER
      000434 20 2E            [12]  212         jr      nz,handle_jump_delay
      000436 3A DA 0D         [13]  213         ld      a,(FAIL_DELAY)
      000439 FE 01            [ 7]  214         cp      #INITIAL_DELAY_COUNTER
      00043B 20 24            [12]  215         jr      nz,handle_fail_delay
      00013D                        216         INKEY
      00043D 3A 25 00         [13]    1         ld      a,(KEYBU)
      000440 F5               [11]    2         push    af
      000441 AF               [ 4]    3         xor     a
      000442 32 25 00         [13]    4         ld      (KEYBU),a
      000445 F1               [10]    5         pop     af
      000446 FE 20            [ 7]  217         cp      #' '
      000448 CA AE 06         [10]  218         jp      z,action_jump
      00044B FE 08            [ 7]  219         cp      #VK_LEFT
      00044D CC FE 05         [17]  220         call    z,action_left
      000450 FE 09            [ 7]  221         cp      #VK_RIGHT
      000452 CC 55 06         [17]  222         call    z,action_right
                           000001   223 .if z9001
                                    224         ;debugginh
      000455 FE 55            [ 7]  225         cp      #'U'
      000457 20 08            [12]  226         jr      nz,handle_fail_delay
      000459 21 64 EC         [10]  227         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+20
      00045C 36 CC            [10]  228         ld      (hl),#CHR_MAN_HEAD
      00045E 22 D7 0D         [16]  229         ld      (MAN_HEAD),hl
                                    230 .endif
      000461                        231 handle_fail_delay:
      000461 CD 12 07         [17]  232         call    check_fall_through
      000464                        233 handle_jump_delay:
      000464 3A D9 0D         [13]  234         ld      a,(JUMP_DELAY)
      000467 FE 01            [ 7]  235         cp      #INITIAL_DELAY_COUNTER
      000469 28 04            [12]  236         jr      z,jump_delay_counter_set
      00046B 3D               [ 4]  237         dec     a
      00046C 32 D9 0D         [13]  238         ld      (JUMP_DELAY),a
      00046F                        239 jump_delay_counter_set:
      00046F 3A DA 0D         [13]  240         ld      a,(FAIL_DELAY)
      000472 FE 01            [ 7]  241         cp      #INITIAL_DELAY_COUNTER
      000474 28 42            [12]  242         jr      z,player_activity
      000476 3D               [ 4]  243         dec     a
      000477 32 DA 0D         [13]  244         ld      (FAIL_DELAY),a
      00047A FE 01            [ 7]  245         cp      #INITIAL_DELAY_COUNTER
      00047C 20 3A            [12]  246         jr      nz,player_activity
      00047E 2A D7 0D         [16]  247         ld      hl,(MAN_HEAD)
                                    248         ; test for bottom line
      000481 11 D0 EE         [10]  249         ld      de,#BWS+(GAME_START_Y+3*GAMES_LINES-2)*SCREEN_WIDTH
      000484 A7               [ 4]  250         and     a
      000485 ED 52            [15]  251         sbc     hl,de
      000487 38 16            [12]  252         jr      c,player_wake_up
      000489 3A DB 0D         [13]  253         ld      a,(LIVES)
      00048C 3D               [ 4]  254         dec     a
      00048D 32 DB 0D         [13]  255         ld      (LIVES),a
      000490 21 9A EF         [10]  256         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES+3)*SCREEN_WIDTH+2
      000493 16 00            [ 7]  257         ld      d,#HI_ZERO
      000495 87               [ 4]  258         add     a,a
      000496 5F               [ 4]  259         ld      e,a
      000497 19               [11]  260         add     hl,de
      000498 36 20            [10]  261         ld      (hl),#' '
      00049A FE 00            [ 7]  262         cp      #ZERO
      00049C CA 29 08         [10]  263         jp      z,no_lives
      00049F                        264 player_wake_up:
      00049F 2A D7 0D         [16]  265         ld      hl,(MAN_HEAD)
      0004A2 36 CC            [10]  266         ld      (hl),#CHR_MAN_HEAD
      0004A4 2B               [ 6]  267         dec     hl
      0004A5 3E 20            [ 7]  268         ld      a,#' '
      0004A7 77               [ 7]  269         ld      (hl),a
      0004A8 23               [ 6]  270         inc     hl
      0004A9 23               [ 6]  271         inc     hl
      0004AA 23               [ 6]  272         inc     hl
      0004AB 77               [ 7]  273         ld      (hl),a
      0004AC 2B               [ 6]  274         dec     hl
      0004AD 11 28 00         [10]  275         ld      de,#SCREEN_WIDTH
      0004B0 19               [11]  276         add     hl,de
      0004B1 77               [ 7]  277         ld      (hl),a
      0004B2 23               [ 6]  278         inc     hl
      0004B3 77               [ 7]  279         ld      (hl),a
      0004B4 2B               [ 6]  280         dec     hl
      0004B5 2B               [ 6]  281         dec     hl
      0004B6 36 9D            [10]  282         ld      (hl),#CHR_MAN_WALK
      0004B8                        283 player_activity:
      0004B8 CD 63 07         [17]  284         call    check_level_finished
      0004BB C3 26 04         [10]  285         jp      animation_loop
                                    286 ; unchecked data source
      0004BE 67 75 66 69            287         .db     0x67,0x75,0x66,0x69                     ;gufi
      0004C2                        288 animation_monster:
      0004C2 3A DE 0D         [13]  289         ld      a,(LEVEL)
      0004C5 32 DF 0D         [13]  290         ld      (counter),a
      0004C8 FE 01            [ 7]  291         cp      #LEVEL_1
      0004CA C8               [11]  292         ret     z
      0004CB 01 F0 0D         [10]  293         ld      bc,#MONSTER_PTR
      0004CE 11 28 0E         [10]  294         ld      de,#MONSTER_IMG
      0004D1                        295 handle_one_monster:
      0004D1 0A               [ 7]  296         ld      a,(bc)
      0004D2 6F               [ 4]  297         ld      l,a
      0004D3 03               [ 6]  298         inc     bc
      0004D4 0A               [ 7]  299         ld      a,(bc)
      0004D5 67               [ 4]  300         ld      h,a
      0004D6 CD E5 04         [17]  301         call    handle_by_ptr
      0004D9 3A DF 0D         [13]  302         ld      a,(counter)
      0004DC 3D               [ 4]  303         dec     a
      0004DD 32 DF 0D         [13]  304         ld      (counter),a
      0004E0 FE 01            [ 7]  305         cp      #LEVEL_1
      0004E2 C8               [11]  306         ret     z
      0004E3 18 EC            [12]  307         jr      handle_one_monster
      0004E5                        308 handle_by_ptr:
      0004E5 C5               [11]  309         push    bc
      0004E6 3E 04            [ 7]  310         ld      a,#MONSTER_WIDTH
      0004E8 D5               [11]  311         push    de
      0004E9                        312 handle_by_column:
      0004E9 36 20            [10]  313         ld      (hl),#' '
      0004EB 11 28 00         [10]  314         ld      de,#SCREEN_WIDTH
      0004EE 19               [11]  315         add     hl,de
      0004EF 36 20            [10]  316         ld      (hl),#' '
      0004F1 A7               [ 4]  317         and     a
      0004F2 ED 52            [15]  318         sbc     hl,de
      0004F4 2B               [ 6]  319         dec     hl
      0004F5 E5               [11]  320         push    hl
      0004F6 08               [ 4]  321         ex      af,af'
      0004F7 11 EF EC         [10]  322         ld      de,#BWS+(GAME_START_Y+4)*SCREEN_WIDTH-1
      0004FA A7               [ 4]  323         and     a
      0004FB ED 52            [15]  324         sbc     hl,de
      0004FD 38 0D            [12]  325         jr      c,correct_ptr
      0004FF C5               [11]  326         push    bc
      000500 06 06            [ 7]  327         ld      b,#GAMES_LINES
      000502 11 78 00         [10]  328         ld      de,#3*SCREEN_WIDTH
      000505                        329 get_column:
      000505 A7               [ 4]  330         and     a
      000506 ED 52            [15]  331         sbc     hl,de
      000508 38 13            [12]  332         jr      c,test_column
      00050A 10 F9            [13]  333         djnz    get_column
      00050C                        334 correct_ptr:
      00050C 11 27 00         [10]  335         ld      de,#SCREEN_WIDTH-1
      00050F ED 5A            [15]  336         adc     hl,de
      000511 28 03            [12]  337         jr      z,start_from_bottom
      000513 E1               [10]  338         pop     hl
      000514 18 19            [12]  339         jr      update_pointers
      000516                        340 start_from_bottom:
      000516 E1               [10]  341         pop     hl
      000517 11 08 02         [10]  342         ld      de,#((GAMES_LINES-2)*3+1)*SCREEN_WIDTH
      00051A 19               [11]  343         add     hl,de
      00051B 18 12            [12]  344         jr      update_pointers
      00051D                        345 test_column:
      00051D C1               [10]  346         pop     bc
      00051E 11 27 00         [10]  347         ld      de,#SCREEN_WIDTH-1
      000521 ED 5A            [15]  348         adc     hl,de
      000523 28 03            [12]  349         jr      z,move_one_line_up
      000525 E1               [10]  350         pop     hl
      000526 18 07            [12]  351         jr      update_pointers
      000528                        352 move_one_line_up:
      000528 E1               [10]  353         pop     hl
      000529 11 50 00         [10]  354         ld      de,#2*SCREEN_WIDTH
      00052C A7               [ 4]  355         and     a
      00052D ED 52            [15]  356         sbc     hl,de
      00052F                        357 update_pointers:
      00052F 0B               [ 6]  358         dec     bc
      000530 7D               [ 4]  359         ld      a,l
      000531 02               [ 7]  360         ld      (bc),a
      000532 03               [ 6]  361         inc     bc
      000533 7C               [ 4]  362         ld      a,h
      000534 02               [ 7]  363         ld      (bc),a
      000535 03               [ 6]  364         inc     bc
      000536 0A               [ 7]  365         ld      a,(bc)
      000537 6F               [ 4]  366         ld      l,a
      000538 03               [ 6]  367         inc     bc
      000539 0A               [ 7]  368         ld      a,(bc)
      00053A 67               [ 4]  369         ld      h,a
      00053B 08               [ 4]  370         ex      af,af'
      00053C 3D               [ 4]  371         dec     a
      00053D FE 00            [ 7]  372         cp      #ZERO
      00053F 28 02            [12]  373         jr      z,draw_monster
      000541 18 A6            [12]  374         jr      handle_by_column
      000543                        375 draw_monster:
      000543 D1               [10]  376         pop     de
      000544 C1               [10]  377         pop     bc
      000545 0B               [ 6]  378         dec     bc
      000546 3E 04            [ 7]  379         ld      a,#MONSTER_WIDTH
      000548                        380 draw_monster_segment:
      000548 08               [ 4]  381         ex      af,af'
      000549 0A               [ 7]  382         ld      a,(bc)
      00054A 6F               [ 4]  383         ld      l,a
      00054B 03               [ 6]  384         inc     bc
      00054C 0A               [ 7]  385         ld      a,(bc)
      00054D 67               [ 4]  386         ld      h,a
      00054E 03               [ 6]  387         inc     bc
      00054F 1A               [ 7]  388         ld      a,(de)
      000550 77               [ 7]  389         ld      (hl),a
      000551 13               [ 6]  390         inc     de
      000552 1A               [ 7]  391         ld      a,(de)
      000553 D5               [11]  392         push    de
      000554 11 28 00         [10]  393         ld      de,#SCREEN_WIDTH
      000557 19               [11]  394         add     hl,de
      000558 77               [ 7]  395         ld      (hl),a
      000559 CD 65 05         [17]  396         call    monster_check_crash
      00055C D1               [10]  397         pop     de
      00055D 13               [ 6]  398         inc     de
      00055E 08               [ 4]  399         ex      af,af'
      00055F 3D               [ 4]  400         dec     a
      000560 FE 00            [ 7]  401         cp      #ZERO
      000562 20 E4            [12]  402         jr      nz,draw_monster_segment
      000564 C9               [10]  403         ret
      000565                        404 monster_check_crash:
      000565 A7               [ 4]  405         and     a
      000566 ED 52            [15]  406         sbc     hl,de
      000568 EB               [ 4]  407         ex      de,hl
      000569 2A D7 0D         [16]  408         ld      hl,(MAN_HEAD)
      00056C A7               [ 4]  409         and     a
      00056D ED 52            [15]  410         sbc     hl,de
      00056F EB               [ 4]  411         ex      de,hl
      000570 C0               [11]  412         ret     nz
      000571 11 28 00         [10]  413         ld      de,#SCREEN_WIDTH
      000574 19               [11]  414         add     hl,de
      000575 23               [ 6]  415         inc     hl
      000576 36 97            [10]  416         ld      (hl),#CHR_MAN_SLEEP
      000578 23               [ 6]  417         inc     hl
      000579 36 C9            [10]  418         ld      (hl),#CHR_MAN_SLEEP_HEAD
      00057B 3E 0B            [ 7]  419         ld      a,#DELAY_COUNTER
      00057D 32 DA 0D         [13]  420         ld      (FAIL_DELAY),a
      000580 C9               [10]  421         ret
      000581                        422 animation_lines:
      000581 3E EE            [ 7]  423         ld      a,#CHR_MOVING_LINE
      000583 21 BB 0C         [10]  424         ld      hl,#LINE_BUFFER
      000586 77               [ 7]  425         ld      (hl),a
      000587 11 BC 0C         [10]  426         ld      de,#LINE_BUFFER+1
      00058A 01 0E 01         [10]  427         ld      bc,#LINE_BUFFER_size-1
      00058D ED B0            [21]  428         ldir
      00058F 3A D5 0D         [13]  429         ld      a,(cnt_fail_trap)
      000592 11 CB 0D         [10]  430         ld      de,#OFFSET_HOLES
      000595 1B               [ 6]  431         dec     de
      000596                        432 loop_failed_penalty_holes:
      000596 F5               [11]  433         push    af
      000597 13               [ 6]  434         inc     de
      000598 1A               [ 7]  435         ld      a,(de)
      000599 3C               [ 4]  436         inc     a
      00059A 12               [ 7]  437         ld      (de),a
      00059B 4F               [ 4]  438         ld      c,a
      00059C 06 00            [ 7]  439         ld      b,#HI_ZERO
      00059E 21 BB 0C         [10]  440         ld      hl,#LINE_BUFFER
      0005A1 09               [11]  441         add     hl,bc
      0005A2 36 20            [10]  442         ld      (hl),#' '
      0005A4 23               [ 6]  443         inc     hl
      0005A5 36 20            [10]  444         ld      (hl),#' '
      0005A7 23               [ 6]  445         inc     hl
      0005A8 36 20            [10]  446         ld      (hl),#' '
      0005AA F1               [10]  447         pop     af
      0005AB 3D               [ 4]  448         dec     a
      0005AC 20 E8            [12]  449         jr      nz,loop_failed_penalty_holes
      0005AE 3A D6 0D         [13]  450         ld      a,(cnt_fail_jump)
      0005B1 11 D0 0D         [10]  451         ld      de,#OFFSET_HOLES_JUMP_PENALTY
      0005B4 1B               [ 6]  452         dec     de
      0005B5                        453 loop_jump_penalty_holes:
      0005B5 F5               [11]  454         push    af
      0005B6 13               [ 6]  455         inc     de
      0005B7 1A               [ 7]  456         ld      a,(de)
      0005B8 3D               [ 4]  457         dec     a
      0005B9 12               [ 7]  458         ld      (de),a
      0005BA 4F               [ 4]  459         ld      c,a
      0005BB 06 00            [ 7]  460         ld      b,#HI_ZERO
      0005BD 21 BB 0C         [10]  461         ld      hl,#LINE_BUFFER
      0005C0 09               [11]  462         add     hl,bc
      0005C1 36 20            [10]  463         ld      (hl),#' '
      0005C3 23               [ 6]  464         inc     hl
      0005C4 36 20            [10]  465         ld      (hl),#' '
      0005C6 23               [ 6]  466         inc     hl
      0005C7 36 20            [10]  467         ld      (hl),#' '
      0005C9 F1               [10]  468         pop     af
      0005CA 3D               [ 4]  469         dec     a
      0005CB 20 E8            [12]  470         jr      nz,loop_jump_penalty_holes
      0005CD 3E 06            [ 7]  471         ld      a,#GAMES_LINES
      0005CF 21 BB 0C         [10]  472         ld      hl,#LINE_BUFFER
      0005D2 11 50 EC         [10]  473         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+0
      0005D5                        474 print_line:
      0005D5 01 28 00         [10]  475         ld      bc,#SCREEN_WIDTH
      0005D8 E5               [11]  476         push    hl
      0005D9 EB               [ 4]  477         ex      de,hl
      0005DA 09               [11]  478         add     hl,bc
      0005DB 09               [11]  479         add     hl,bc
      0005DC EB               [ 4]  480         ex      de,hl
      0005DD E1               [10]  481         pop     hl
      0005DE ED B0            [21]  482         ldir
      0005E0 3D               [ 4]  483         dec     a
      0005E1 20 F2            [12]  484         jr      nz,print_line
      0005E3 21 70 EF         [10]  485         ld      hl,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+0
      0005E6 11 71 EF         [10]  486         ld      de,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+1
      0005E9 01 27 00         [10]  487         ld      bc,#SCREEN_WIDTH-1
      0005EC 36 C6            [10]  488         ld      (hl),#CHR_WALL
      0005EE ED B0            [21]  489         ldir
      0005F0 C9               [10]  490         ret
      0005F1                        491 animation_delay:
      0005F1 21 08 52         [10]  492         ld      hl,#SLOW_DOWN_13066
      0005F4 11 01 00         [10]  493         ld      de,#1
      0005F7 A7               [ 4]  494         and     a
      0005F8                        495 delay_loop:
      0005F8 2B               [ 6]  496         dec     hl
      0005F9 ED 52            [15]  497         sbc     hl,de
      0005FB 20 FB            [12]  498         jr      nz,delay_loop
      0005FD C9               [10]  499         ret
      0005FE                        500 action_left:
      0005FE F5               [11]  501         push    af
      0005FF 2A D7 0D         [16]  502         ld      hl,(MAN_HEAD)
      000602 7E               [ 7]  503         ld      a,(hl)
      000603 36 20            [10]  504         ld      (hl),#' '
      000605 2B               [ 6]  505         dec     hl
      000606 22 D7 0D         [16]  506         ld      (MAN_HEAD),hl
      000609 77               [ 7]  507         ld      (hl),a
      00060A 11 28 00         [10]  508         ld      de,#SCREEN_WIDTH
      00060D 19               [11]  509         add     hl,de
      00060E 23               [ 6]  510         inc     hl
      00060F 7E               [ 7]  511         ld      a,(hl)
      000610 36 20            [10]  512         ld      (hl),#' '
      000612 FE 9D            [ 7]  513         cp      #CHR_MAN_WALK
      000614 28 04            [12]  514         jr      z,transition_left_stay
      000616 FE A1            [ 7]  515         cp      #CHR_MAN_STAY
      000618 28 04            [12]  516         jr      z,transition_left_walk
      00061A                        517 transition_left_stay:
      00061A C6 04            [ 7]  518         add     a,#TRANSITION_MAN_WALK_STAY
      00061C 18 02            [12]  519         jr      update_left
      00061E                        520 transition_left_walk:
      00061E D6 04            [ 7]  521         sub     #TRANSITION_MAN_WALK_STAY
      000620                        522 update_left:
      000620 2B               [ 6]  523         dec     hl
      000621 77               [ 7]  524         ld      (hl),a
      000622 3E 07            [ 7]  525         ld      a,#GAMES_LINES+1
      000624 01 4F EC         [10]  526         ld      bc,#BWS+(GAME_START_Y)*SCREEN_WIDTH-1
      000627                        527 loop_left_border_check:
      000627 C5               [11]  528         push    bc
      000628 60               [ 4]  529         ld      h,b
      000629 69               [ 4]  530         ld      l,c
      00062A ED 5B D7 0D      [20]  531         ld      de,(MAN_HEAD)
      00062E A7               [ 4]  532         and     a
      00062F ED 52            [15]  533         sbc     hl,de
      000631 28 0E            [12]  534         jr      z,correct_left_border
      000633                        535 left_border_next_adr:
      000633 C1               [10]  536         pop     bc
      000634 11 78 00         [10]  537         ld      de,#3*SCREEN_WIDTH
      000637 60               [ 4]  538         ld      h,b
      000638 69               [ 4]  539         ld      l,c
      000639 19               [11]  540         add     hl,de
      00063A 44               [ 4]  541         ld      b,h
      00063B 4D               [ 4]  542         ld      c,l
      00063C 3D               [ 4]  543         dec     a
      00063D 20 E8            [12]  544         jr      nz,loop_left_border_check
      00063F F1               [10]  545         pop     af
      000640 C9               [10]  546         ret
      000641                        547 correct_left_border:
      000641 2A D7 0D         [16]  548         ld      hl,(MAN_HEAD)
      000644 11 28 00         [10]  549         ld      de,#SCREEN_WIDTH
      000647 36 C6            [10]  550         ld      (hl),#CHR_WALL
      000649 19               [11]  551         add     hl,de
      00064A 36 CC            [10]  552         ld      (hl),#CHR_MAN_HEAD
      00064C 22 D7 0D         [16]  553         ld      (MAN_HEAD),hl
      00064F 19               [11]  554         add     hl,de
      000650 36 9D            [10]  555         ld      (hl),#CHR_MAN_WALK
      000652 C3 33 06         [10]  556         jp      left_border_next_adr
      000655                        557 action_right:
      000655 F5               [11]  558         push    af
      000656 2A D7 0D         [16]  559         ld      hl,(MAN_HEAD)
      000659 7E               [ 7]  560         ld      a,(hl)
      00065A 36 20            [10]  561         ld      (hl),#' '
      00065C 23               [ 6]  562         inc     hl
      00065D 22 D7 0D         [16]  563         ld      (MAN_HEAD),hl
      000660 77               [ 7]  564         ld      (hl),a
      000661 11 28 00         [10]  565         ld      de,#SCREEN_WIDTH
      000664 19               [11]  566         add     hl,de
      000665 2B               [ 6]  567         dec     hl
      000666 7E               [ 7]  568         ld      a,(hl)
      000667 36 20            [10]  569         ld      (hl),#' '
      000669 FE 9D            [ 7]  570         cp      #CHR_MAN_WALK
      00066B 28 04            [12]  571         jr      z,transition_stay
      00066D FE A1            [ 7]  572         cp      #CHR_MAN_STAY
      00066F 28 04            [12]  573         jr      z,transition_walk
      000671                        574 transition_stay:
      000671 C6 04            [ 7]  575         add     a,#TRANSITION_MAN_WALK_STAY
      000673 18 02            [12]  576         jr      update_right
      000675                        577 transition_walk:
      000675 D6 04            [ 7]  578         sub     #TRANSITION_MAN_WALK_STAY
      000677                        579 update_right:
      000677 23               [ 6]  580         inc     hl
      000678 77               [ 7]  581         ld      (hl),a
      000679 3E 07            [ 7]  582         ld      a,#GAMES_LINES+1
      00067B 01 78 EC         [10]  583         ld      bc,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH+0
      00067E                        584 loop_right_border_check:
      00067E C5               [11]  585         push    bc
      00067F 60               [ 4]  586         ld      h,b
      000680 69               [ 4]  587         ld      l,c
      000681 ED 5B D7 0D      [20]  588         ld      de,(MAN_HEAD)
      000685 A7               [ 4]  589         and     a
      000686 ED 52            [15]  590         sbc     hl,de
      000688 28 0E            [12]  591         jr      z,correct_right_border
      00068A                        592 right_border_next_adr:
      00068A C1               [10]  593         pop     bc
      00068B 11 78 00         [10]  594         ld      de,#3*SCREEN_WIDTH
      00068E 60               [ 4]  595         ld      h,b
      00068F 69               [ 4]  596         ld      l,c
      000690 19               [11]  597         add     hl,de
      000691 44               [ 4]  598         ld      b,h
      000692 4D               [ 4]  599         ld      c,l
      000693 3D               [ 4]  600         dec     a
      000694 20 E8            [12]  601         jr      nz,loop_right_border_check
      000696 F1               [10]  602         pop     af
      000697 C9               [10]  603         ret
      000698                        604 correct_right_border:
      000698 2A D7 0D         [16]  605         ld      hl,(MAN_HEAD)
      00069B 4E               [ 7]  606         ld      c,(hl)
      00069C 36 9D            [10]  607         ld      (hl),#CHR_MAN_WALK
      00069E 11 28 00         [10]  608         ld      de,#SCREEN_WIDTH
      0006A1 A7               [ 4]  609         and     a
      0006A2 ED 52            [15]  610         sbc     hl,de
      0006A4 71               [ 7]  611         ld      (hl),c
      0006A5 22 D7 0D         [16]  612         ld      (MAN_HEAD),hl
      0006A8 19               [11]  613         add     hl,de
      0006A9 19               [11]  614         add     hl,de
      0006AA 36 EE            [10]  615         ld      (hl),#CHR_MOVING_LINE
      0006AC 18 DC            [12]  616         jr      right_border_next_adr
      0006AE                        617 action_jump:
      0006AE 2A D7 0D         [16]  618         ld      hl,(MAN_HEAD)
      0006B1 11 28 00         [10]  619         ld      de,#SCREEN_WIDTH
      0006B4 A7               [ 4]  620         and     a
      0006B5 ED 52            [15]  621         sbc     hl,de
      0006B7 7E               [ 7]  622         ld      a,(hl)
      0006B8 FE 20            [ 7]  623         cp      #' '
      0006BA 28 0B            [12]  624         jr      z,jump_ok
      0006BC FE EE            [ 7]  625         cp      #CHR_MOVING_LINE
      0006BE 28 2B            [12]  626         jr      z,jump_fail
      0006C0 FE C6            [ 7]  627         cp      #CHR_WALL
      0006C2 28 27            [12]  628         jr      z,jump_fail
      0006C4 C3 61 04         [10]  629         jp      handle_fail_delay
      0006C7                        630 jump_ok:
      0006C7 D9               [ 4]  631         exx
      0006C8 CD C9 07         [17]  632         call    add_10_points
      0006CB D9               [ 4]  633         exx
      0006CC 19               [11]  634         add     hl,de
      0006CD 36 20            [10]  635         ld      (hl),#' '
      0006CF 19               [11]  636         add     hl,de
      0006D0 36 20            [10]  637         ld      (hl),#' '
      0006D2 1E 78            [ 7]  638         ld      e,#3*SCREEN_WIDTH
      0006D4 A7               [ 4]  639         and     a
      0006D5 ED 52            [15]  640         sbc     hl,de
      0006D7 36 9D            [10]  641         ld      (hl),#CHR_MAN_WALK
      0006D9 1E 28            [ 7]  642         ld      e,#SCREEN_WIDTH
      0006DB A7               [ 4]  643         and     a
      0006DC ED 52            [15]  644         sbc     hl,de
      0006DE 36 CC            [10]  645         ld      (hl),#CHR_MAN_HEAD
      0006E0 22 D7 0D         [16]  646         ld      (MAN_HEAD),hl
      0006E3 3E 04            [ 7]  647         ld      a,#DELAY_COUNTER_JUMP
      0006E5 32 D9 0D         [13]  648         ld      (JUMP_DELAY),a
      0006E8 C3 61 04         [10]  649         jp      handle_fail_delay
      0006EB                        650 jump_fail:
      0006EB 19               [11]  651         add     hl,de
      0006EC 2B               [ 6]  652         dec     hl
      0006ED 3E CD            [ 7]  653         ld      a,#CHR_SMOKE
      0006EF 77               [ 7]  654         ld      (hl),a
      0006F0 23               [ 6]  655         inc     hl
      0006F1 23               [ 6]  656         inc     hl
      0006F2 23               [ 6]  657         inc     hl
      0006F3 77               [ 7]  658         ld      (hl),a
      0006F4 2B               [ 6]  659         dec     hl
      0006F5 2B               [ 6]  660         dec     hl
      0006F6 36 20            [10]  661         ld      (hl),#' '
      0006F8 19               [11]  662         add     hl,de
      0006F9 36 97            [10]  663         ld      (hl),#CHR_MAN_SLEEP
      0006FB 23               [ 6]  664         inc     hl
      0006FC 36 C9            [10]  665         ld      (hl),#CHR_MAN_SLEEP_HEAD
      0006FE 3E 0B            [ 7]  666         ld      a,#DELAY_COUNTER
      000700 32 DA 0D         [13]  667         ld      (FAIL_DELAY),a
      000703 3A D6 0D         [13]  668         ld      a,(cnt_fail_jump)
      000706 FE 05            [ 7]  669         cp      #MAX_FAIL_COUNTER
      000708 CA 61 04         [10]  670         jp      z,handle_fail_delay
      00070B 3C               [ 4]  671         inc     a
      00070C 32 D6 0D         [13]  672         ld      (cnt_fail_jump),a
      00070F C3 61 04         [10]  673         jp      handle_fail_delay
      000712                        674 check_fall_through:
      000712 3A D9 0D         [13]  675         ld      a,(JUMP_DELAY)
      000715 FE 01            [ 7]  676         cp      #INITIAL_DELAY_COUNTER
      000717 C0               [11]  677         ret     nz
      000718                        678 check_for_trap:
      000718 2A D7 0D         [16]  679         ld      hl,(MAN_HEAD)
      00071B 11 28 00         [10]  680         ld      de,#SCREEN_WIDTH
      00071E 19               [11]  681         add     hl,de
      00071F 19               [11]  682         add     hl,de
      000720 7E               [ 7]  683         ld      a,(hl)
      000721 FE 20            [ 7]  684         cp      #' '
      000723 C0               [11]  685         ret     nz
      000724 3A DA 0D         [13]  686         ld      a,(FAIL_DELAY)
      000727 FE 01            [ 7]  687         cp      #INITIAL_DELAY_COUNTER
      000729 28 15            [12]  688         jr      z,erase_player_fell_down
      00072B 2A D7 0D         [16]  689         ld      hl,(MAN_HEAD)
      00072E 3E 20            [ 7]  690         ld      a,#' '
      000730 2B               [ 6]  691         dec     hl
      000731 77               [ 7]  692         ld      (hl),a
      000732 23               [ 6]  693         inc     hl
      000733 23               [ 6]  694         inc     hl
      000734 23               [ 6]  695         inc     hl
      000735 77               [ 7]  696         ld      (hl),a
      000736 2B               [ 6]  697         dec     hl
      000737 19               [11]  698         add     hl,de
      000738 77               [ 7]  699         ld      (hl),a
      000739 23               [ 6]  700         inc     hl
      00073A 77               [ 7]  701         ld      (hl),a
      00073B 2B               [ 6]  702         dec     hl
      00073C 2B               [ 6]  703         dec     hl
      00073D 77               [ 7]  704         ld      (hl),a
      00073E 18 08            [12]  705         jr      player_fell_down
      000740                        706 erase_player_fell_down:
      000740 2A D7 0D         [16]  707         ld      hl,(MAN_HEAD)
      000743 3E 20            [ 7]  708         ld      a,#' '
      000745 77               [ 7]  709         ld      (hl),a
      000746 19               [11]  710         add     hl,de
      000747 77               [ 7]  711         ld      (hl),a
      000748                        712 player_fell_down:
      000748 19               [11]  713         add     hl,de
      000749 19               [11]  714         add     hl,de
      00074A 22 D7 0D         [16]  715         ld      (MAN_HEAD),hl
      00074D 19               [11]  716         add     hl,de
      00074E 36 97            [10]  717         ld      (hl),#CHR_MAN_SLEEP
      000750 23               [ 6]  718         inc     hl
      000751 36 C9            [10]  719         ld      (hl),#CHR_MAN_SLEEP_HEAD
      000753 3E 08            [ 7]  720         ld      a,#DELAY_COUNTER2
      000755 32 DA 0D         [13]  721         ld      (FAIL_DELAY),a
      000758 3A D5 0D         [13]  722         ld      a,(cnt_fail_trap)
      00075B FE 05            [ 7]  723         cp      #MAX_FAIL_COUNTER
      00075D C8               [11]  724         ret     z
      00075E 3C               [ 4]  725         inc     a
      00075F 32 D5 0D         [13]  726         ld      (cnt_fail_trap),a
      000762 C9               [10]  727         ret
      000763                        728 check_level_finished:
      000763 2A D7 0D         [16]  729         ld      hl,(MAN_HEAD)
      000766 11 6F EC         [10]  730         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+(SCREEN_WIDTH-9)
      000769 A7               [ 4]  731         and     a
      00076A ED 52            [15]  732         sbc     hl,de
      00076C 20 39            [12]  733         jr      nz,round_end
      00076E 3A DE 0D         [13]  734         ld      a,(LEVEL)
      000771 FE 08            [ 7]  735         cp      #MAX_LEVEL
      000773 28 01            [12]  736         jr      z,new_level_set
      000775 3C               [ 4]  737         inc     a
      000776                        738 new_level_set:
      000776 32 DE 0D         [13]  739         ld      (LEVEL),a
      000779 21 33 EF         [10]  740         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+(15+ALIGN_MIDDLE)
      00077C 22 D7 0D         [16]  741         ld      (MAN_HEAD),hl
      00077F 3E 28            [ 7]  742         ld      a,#SCREEN_WIDTH
      000781 36 CC            [10]  743         ld      (hl),#CHR_MAN_HEAD
      000783 85               [ 4]  744         add     a,l
      000784 6F               [ 4]  745         ld      l,a
      000785 36 A1            [10]  746         ld      (hl),#CHR_MAN_STAY
      000787 21 D5 0D         [10]  747         ld      hl,#cnt_fail_trap
      00078A 3E 02            [ 7]  748         ld      a,#INITIAL_FAIL_COUNTER
      00078C 77               [ 7]  749         ld      (hl),a
      00078D 21 D6 0D         [10]  750         ld      hl,#cnt_fail_jump
      000790 77               [ 7]  751         ld      (hl),a
      000791 21 6D EC         [10]  752         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+(SCREEN_WIDTH-11)
      000794 36 F8            [10]  753         ld      (hl),#CHR_LINE_TOP
      000796 23               [ 6]  754         inc     hl
      000797 36 95            [10]  755         ld      (hl),#CHR_ARROW_RIGHT_TOP
      000799 23               [ 6]  756         inc     hl
      00079A 36 20            [10]  757         ld      (hl),#' '
      00079C 21 95 EC         [10]  758         ld      hl,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH++(SCREEN_WIDTH-11)
      00079F 36 9E            [10]  759         ld      (hl),#CHR_LINE_BOTTOM
      0007A1 23               [ 6]  760         inc     hl
      0007A2 36 93            [10]  761         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      0007A4 23               [ 6]  762         inc     hl
      0007A5 36 20            [10]  763         ld      (hl),#' '
      0007A7                        764 round_end:
      0007A7 13               [ 6]  765         inc     de
      0007A8 13               [ 6]  766         inc     de
      0007A9 2A D7 0D         [16]  767         ld      hl,(MAN_HEAD)
      0007AC A7               [ 4]  768         and     a
      0007AD ED 52            [15]  769         sbc     hl,de
      0007AF 3E 0B            [ 7]  770         ld      a,#DELAY_COUNTER
      0007B1 C0               [11]  771         ret     nz
      0007B2 32 DA 0D         [13]  772         ld      (FAIL_DELAY),a
      0007B5 13               [ 6]  773         inc     de
      0007B6 ED 53 D7 0D      [20]  774         ld      (MAN_HEAD),de
      0007BA 3E 20            [ 7]  775         ld      a,#' '
      0007BC 1B               [ 6]  776         dec     de
      0007BD 12               [ 7]  777         ld      (de),a
      0007BE 83               [ 4]  778         add     a,e
      0007BF 5F               [ 4]  779         ld      e,a
      0007C0 12               [ 7]  780         ld      (de),a
      0007C1 6F               [ 4]  781         ld      l,a
      0007C2 19               [11]  782         add     hl,de
      0007C3 36 97            [10]  783         ld      (hl),#CHR_MAN_SLEEP
      0007C5 23               [ 6]  784         inc     hl
      0007C6 36 C9            [10]  785         ld      (hl),#CHR_MAN_SLEEP_HEAD
      0007C8 C9               [10]  786         ret
      0007C9                        787 add_10_points:
      0004C9                        788         SET_CURSOR_DE 0 23+POSDIFF_POINTS
      0007C9 C5               [11]    1         push    bc
      0007CA 11 20 01         [10]    2         ld      de,#(0+1)*256+(23+POSDIFF_POINTS+1)
      0007CD 0E 12            [ 7]    3         ld      c,#UP_SETCU
      0007CF CD 05 00         [17]    4         call    BOS
      0007D2 C1               [10]    5         pop     bc
      0007D3 2A DC 0D         [16]  789         ld      hl,(POINTS)
      0007D6 11 0A 00         [10]  790         ld      de,#10
      0007D9 19               [11]  791         add     hl,de
      0007DA 22 DC 0D         [16]  792         ld      (POINTS),hl
      0007DD CD E6 07         [17]  793         call    print_decimal
      0007E0 3E 20            [ 7]  794         ld      a,#' '
      0007E2 32 24 EC         [13]  795         ld      (BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS+5),a
      0007E5 C9               [10]  796         ret
      0007E6                        797 print_decimal:
      0007E6 E5               [11]  798         push    hl
      0007E7 01 10 27         [10]  799         ld      bc,#10000
      0007EA CD 12 08         [17]  800         call    get_decimal_digit
      0007ED 01 E8 03         [10]  801         ld      bc,#1000
      0007F0 CD 12 08         [17]  802         call    get_decimal_digit
      0007F3 01 64 00         [10]  803         ld      bc,#100
      0007F6 CD 12 08         [17]  804         call    get_decimal_digit
      0007F9 01 0A 00         [10]  805         ld      bc,#10
      0007FC CD 12 08         [17]  806         call    get_decimal_digit
      0007FF 01 01 00         [10]  807         ld      bc,#1
      000802 CD 12 08         [17]  808         call    get_decimal_digit
      000505                        809         REMOVE_CURSOR;
      000805 2A 2D 00         [16]    1         ld      hl,(CURS)
      000808 36 20            [10]    2         ld      (hl),#' '
      00080A CB 94            [ 8]    3         res     2,h
      00080C CB BE            [15]    4         res     7,(hl)
      00080E CB D4            [ 8]    5         set     2,h
      000810 E1               [10]  810         pop     hl
      000811 C9               [10]  811         ret
      000812                        812 get_decimal_digit:
      000812 AF               [ 4]  813         xor     a
      000813                        814 decimal_loop:
      000813 A7               [ 4]  815         and     a
      000814 ED 42            [15]  816         sbc     hl,bc
      000816 3C               [ 4]  817         inc     a
      000817 D2 13 08         [10]  818         jp      nc,decimal_loop
      00081A 3D               [ 4]  819         dec     a
      00081B 09               [11]  820         add     hl,bc
      00081C C6 30            [ 7]  821         add     a,#'0'
      00051E                        822         OUTCH
      00081E C5               [11]    1         push    bc
      00081F D5               [11]    2         push    de
      000820 0E 02            [ 7]    3         ld      c,#UP_CONSO
      000822 5F               [ 4]    4         ld      e,a
      000823 CD 05 00         [17]    5         call    BOS
      000826 D1               [10]    6         pop     de
      000827 C1               [10]    7         pop     bc
      000828 C9               [10]  823         ret
      000829                        824 no_lives::
      000529                        825         PRST7
      000829 CD B6 0E         [17]    1         call    prst7
      00082C 0C A0                  826         .db     0x0c,0xa0
      00082E 21 80 0E         [10]  827         ld      hl,#TXT_GAME_OVER
      000831 11 0D EC         [10]  828         ld      de,#POS_GAME_OVER
      000834 01 0F 00         [10]  829         ld      bc,#TXT_GAME_OVER_size
      000837 ED B0            [21]  830         ldir
      000839 0E 40            [ 7]  831         ld      c,#3*SCREEN_WIDTH-TXT_GAME_OVER_size-1+POSDIFF_YOUR_SCORE
      00083B 7B               [ 4]  832         ld      a,e
      00083C 81               [ 4]  833         add     a,c
      00083D 5F               [ 4]  834         ld      e,a
      00083E 0E 0C            [ 7]  835         ld      c,#TXT_YOUR_SCORE_size
      000840 ED B0            [21]  836         ldir
      000842 0E 47            [ 7]  837         ld      c,#2*SCREEN_WIDTH-TXT_YOUR_SCORE_size+3
      000844 7B               [ 4]  838         ld      a,e
      000845 81               [ 4]  839         add     a,c
      000846 5F               [ 4]  840         ld      e,a
      000847 0E 09            [ 7]  841         ld      c,#TXT_HAZARD_size
      000849 ED B0            [21]  842         ldir
      00084B 21 E0 ED         [10]  843         ld      hl,#BWS+15*SCREEN_WIDTH+0+(3*POSDIFF_YOUR_SCORE)
      00084E 36 A0            [10]  844         ld      (hl),#CHR_MIDDLE_LINE
      000850 11 E1 ED         [10]  845         ld      de,#BWS+15*SCREEN_WIDTH+1+(3*POSDIFF_YOUR_SCORE)
      000853 0E 27            [ 7]  846         ld      c,#SCREEN_WIDTH-1
      000855 ED B0            [21]  847         ldir
      000857 2A DC 0D         [16]  848         ld      hl,(POINTS)
      00055A                        849         SET_CURSOR_DE (5-POSDIFF_YOUR_SCORE_DY) (21+ALIGN_MIDDLE)
      00085A C5               [11]    1         push    bc
      00085B 11 1A 03         [10]    2         ld      de,#((5-POSDIFF_YOUR_SCORE_DY)+1)*256+((21+ALIGN_MIDDLE)+1)
      00085E 0E 12            [ 7]    3         ld      c,#UP_SETCU
      000860 CD 05 00         [17]    4         call    BOS
      000863 C1               [10]    5         pop     bc
      000864 CD E6 07         [17]  850         call    print_decimal
      000867 3A DE 0D         [13]  851         ld      a,(LEVEL)
      00086A C6 2F            [ 7]  852         add     a,#'0'-1
      00086C 32 BB EC         [13]  853         ld      (BWS+7*SCREEN_WIDTH+23+ALIGN_MIDDLE+3*POSDIFF_YOUR_SCORE),a
      00086F ED 5B 62 0E      [20]  854         ld      de,(HIGH_SCORE_TABLE01.points)
      000873 A7               [ 4]  855         and     a
      000874 ED 52            [15]  856         sbc     hl,de
      000876 D4 DE 09         [17]  857         call    nc,draw_new_highscore_box
      000579                        858         SET_CURSOR_HL (17-POSDIFF_YOUR_SCORE_DY) (3+ALIGN_MIDDLE)
      000879 D5               [11]    1         push    de
      00087A C5               [11]    2         push    bc
      00087B 11 08 0F         [10]    3         ld      de,#((17-POSDIFF_YOUR_SCORE_DY)+1)*256+((3+ALIGN_MIDDLE)+1)
      00087E 62               [ 4]    4         ld      h,d
      00087F 6B               [ 4]    5         ld      l,e
      000880 0E 12            [ 7]    6         ld      c,#UP_SETCU
      000882 CD 05 00         [17]    7         call    BOS
      000885 C1               [10]    8         pop     bc
      000886 D1               [10]    9         pop     de
      000587                        859         PRST7
      000887 CD B6 0E         [17]    1         call    prst7
      00088A 20 49 4E 50 55 54 20   860         .ascis ' INPUT YOUR INITIALS: __ '
             59 4F 55 52 20 49 4E
             49 54 49 41 4C 53 3A
             20 5F 5F A0
                                    861         ; remove 2xcursor
      0008A3 21 C4 EE         [10]  862         ld      hl,#BWS+17*SCREEN_WIDTH+28
      0008A6 36 20            [10]  863         ld      (hl),#' '
      0008A8 21 01 EC         [10]  864         ld      hl,#BWS+0*SCREEN_WIDTH+1
      0008AB 36 20            [10]  865         ld      (hl),#' '
      0008AD 21 4D EE         [10]  866         ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+25+ALIGN_MIDDLE
      0005B0                        867         CURSOR_DISABLE
      0008B0 C5               [11]    1         push    bc
      0008B1 0E 1D            [ 7]    2         ld      c,#UP_DCU
      0008B3 CD 05 00         [17]    3         call    BOS
      0008B6 C1               [10]    4         pop     bc
      0005B7                        868         INCH
      0008B7 AF               [ 4]    1         xor     a
      0008B8 32 25 00         [13]    2         ld      (KEYBU),a
      0008BB 0E 01            [ 7]    3         ld      c,#UP_CONSI
      0008BD CD 05 00         [17]    4         call    BOS
      0008C0 77               [ 7]  869         ld      (hl),a
      0008C1 32 7E 0E         [13]  870         ld      (INITIALS),a
      0008C4 23               [ 6]  871         inc     hl
      0005C5                        872         INCH
      0008C5 AF               [ 4]    1         xor     a
      0008C6 32 25 00         [13]    2         ld      (KEYBU),a
      0008C9 0E 01            [ 7]    3         ld      c,#UP_CONSI
      0008CB CD 05 00         [17]    4         call    BOS
      0008CE 77               [ 7]  873         ld      (hl),a
      0008CF 32 7F 0E         [13]  874         ld      (INITIALS+1),a
      0008D2 ED 5B DC 0D      [20]  875         ld      de,(POINTS)
      0008D6 06 05            [ 7]  876         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      0008D8 2A 62 0E         [16]  877         ld      hl,(HIGH_SCORE_TABLE01.points)
      0008DB A7               [ 4]  878         and     a
      0008DC ED 52            [15]  879         sbc     hl,de
      0008DE DA AD 09         [10]  880         jp      c,insert_score
      0008E1 05               [ 4]  881         dec     b
      0008E2 2A 67 0E         [16]  882         ld      hl,(HIGH_SCORE_TABLE02.points)
      0008E5 A7               [ 4]  883         and     a
      0008E6 ED 52            [15]  884         sbc     hl,de
      0008E8 DA AD 09         [10]  885         jp      c,insert_score
      0008EB 05               [ 4]  886         dec     b
      0008EC 2A 6C 0E         [16]  887         ld      hl,(HIGH_SCORE_TABLE03.points)
      0008EF A7               [ 4]  888         and     a
      0008F0 ED 52            [15]  889         sbc     hl,de
      0008F2 DA AD 09         [10]  890         jp      c,insert_score
      0008F5 05               [ 4]  891         dec     b
      0008F6 2A 71 0E         [16]  892         ld      hl,(HIGH_SCORE_TABLE04.points)
      0008F9 A7               [ 4]  893         and     a
      0008FA ED 52            [15]  894         sbc     hl,de
      0008FC DA AD 09         [10]  895         jp      c,insert_score
      0008FF 05               [ 4]  896         dec     b
      000900 2A 76 0E         [16]  897         ld      hl,(HIGH_SCORE_TABLE05.points)
      000903 A7               [ 4]  898         and     a
      000904 ED 52            [15]  899         sbc     hl,de
      000906 DA AD 09         [10]  900         jp      c,insert_score
      000909                        901 print_highscore_table::
      000909 06 05            [ 7]  902         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      00090B 11 60 0E         [10]  903         ld      de,#HIGH_SCORE_TABLE01
      00090E 21 8A EE         [10]  904         ld      hl,#BWS+(20-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+6+ALIGN_MIDDLE
      000911                        905 print_highscore_entry:
      000911 3E 36            [ 7]  906         ld      a,#'6'
      000913 90               [ 4]  907         sub     b
      000914 77               [ 7]  908         ld      (hl),a
      000915 1A               [ 7]  909         ld      a,(de)
      000916 23               [ 6]  910         inc     hl
      000917 23               [ 6]  911         inc     hl
      000918 23               [ 6]  912         inc     hl
      000919 77               [ 7]  913         ld      (hl),a
      00091A 23               [ 6]  914         inc     hl
      00091B 13               [ 6]  915         inc     de
      00091C 1A               [ 7]  916         ld      a,(de)
      00091D 77               [ 7]  917         ld      (hl),a
      00091E 3E 2E            [ 7]  918         ld      a,#'.'
      000920 23               [ 6]  919         inc     hl
      000921 23               [ 6]  920         inc     hl
      000922 77               [ 7]  921         ld      (hl),a
      000923 23               [ 6]  922         inc     hl
      000924 77               [ 7]  923         ld      (hl),a
      000925 23               [ 6]  924         inc     hl
      000926 77               [ 7]  925         ld      (hl),a
      000927 23               [ 6]  926         inc     hl
      000928 23               [ 6]  927         inc     hl
      000629                        928         SET_CURSOR
      000929 CD C5 0E         [17]    1         call    set_cursor
      00092C 13               [ 6]  929         inc     de
      00092D 1A               [ 7]  930         ld      a,(de)
      00092E 6F               [ 4]  931         ld      l,a
      00092F 13               [ 6]  932         inc     de
      000930 1A               [ 7]  933         ld      a,(de)
      000931 67               [ 4]  934         ld      h,a
      000932 13               [ 6]  935         inc     de
      000933 C5               [11]  936         push    bc
      000934 D5               [11]  937         push    de
      000935 CD E6 07         [17]  938         call    print_decimal
      000938 D1               [10]  939         pop     de
      000939 C1               [10]  940         pop     bc
      00063A                        941         REMOVE_CURSOR
      00093A 2A 2D 00         [16]    1         ld      hl,(CURS)
      00093D 36 20            [10]    2         ld      (hl),#' '
      00093F CB 94            [ 8]    3         res     2,h
      000941 CB BE            [15]    4         res     7,(hl)
      000943 CB D4            [ 8]    5         set     2,h
      000945 23               [ 6]  942         inc     hl
      000946 23               [ 6]  943         inc     hl
      000947 23               [ 6]  944         inc     hl
      000948 36 30            [10]  945         ld      (hl),#'0'
      00094A 23               [ 6]  946         inc     hl
      00094B 1A               [ 7]  947         ld      a,(de)
      00094C C6 2F            [ 7]  948         add     a,#'0'-1
      00094E 77               [ 7]  949         ld      (hl),a
      00094F 13               [ 6]  950         inc     de
      000950 3E 15            [ 7]  951         ld      a,#SCREEN_WIDTH-19
      000952 85               [ 4]  952         add     a,l
      000953 6F               [ 4]  953         ld      l,a
      000954 3E 00            [ 7]  954         ld      a,#ZERO
      000956 8C               [ 4]  955         adc     a,h
      000957 67               [ 4]  956         ld      h,a
      000958 10 B7            [13]  957         djnz    print_highscore_entry
      00065A                        958         SET_CURSOR_HL (29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY) (9+ALIGN_MIDDLE)
      00095A D5               [11]    1         push    de
      00095B C5               [11]    2         push    bc
      00095C 11 0E 17         [10]    3         ld      de,#((29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)+1)*256+((9+ALIGN_MIDDLE)+1)
      00095F 62               [ 4]    4         ld      h,d
      000960 6B               [ 4]    5         ld      l,e
      000961 0E 12            [ 7]    6         ld      c,#UP_SETCU
      000963 CD 05 00         [17]    7         call    BOS
      000966 C1               [10]    8         pop     bc
      000967 D1               [10]    9         pop     de
      000668                        959         PRST7
      000968 CD B6 0E         [17]    1         call    prst7
      00096B 4E 45 57 20 47 41 4D   960         .ascii  'NEW GAME ? Y/N'
             45 20 3F 20 59 2F 4E
      000979 A0                     961         .db     0xa0
      00097A 21 8C EF         [10]  962         ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      00097D 36 20            [10]  963         ld      (hl),#' '
      00067F                        964         CURSOR_DISABLE
      00097F C5               [11]    1         push    bc
      000980 0E 1D            [ 7]    2         ld      c,#UP_DCU
      000982 CD 05 00         [17]    3         call    BOS
      000985 C1               [10]    4         pop     bc
      000986                        965 m_070a:
      000986                        966 ask_exit_game:
      000686                        967         INCH
      000986 AF               [ 4]    1         xor     a
      000987 32 25 00         [13]    2         ld      (KEYBU),a
      00098A 0E 01            [ 7]    3         ld      c,#UP_CONSI
      00098C CD 05 00         [17]    4         call    BOS
      00098F FE 59            [ 7]  968         cp      #'Y'
      000991 CA 9D 03         [10]  969         jp      z,new_game
      000994 FE 4E            [ 7]  970         cp      #'N'
      000996 20 EE            [12]  971         jr      nz,ask_exit_game
      000998                        972 exit_game:
      000698                        973         PRST7
      000998 CD B6 0E         [17]    1         call    prst7
      00099B 0C                     974         .db     0x0c
      00099C 4A 75 6D 70 69 6E 67   975         .ascii  'Jumping Jack'
             20 4A 61 63 6B
      0009A8 0D 8D                  976         .db     0x0d,0x8d
      0006AA                        977         END_PROGRAM
      0009AA C3 03 F0         [10]    1         jp      WBOOT
      0009AD                        978 insert_score:
      0009AD D5               [11]  979         push    de
      0009AE 11 79 0E         [10]  980         ld      de,#HIGH_SCORE_TABLE_TMP
      0009B1 21 74 0E         [10]  981         ld      hl,#HIGH_SCORE_TABLE05
      0009B4                        982 move_table_entry:
      0009B4 C5               [11]  983         push    bc
      0009B5 01 05 00         [10]  984         ld      bc,#HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05
      0009B8 ED B0            [21]  985         ldir
      0009BA EB               [ 4]  986         ex      de,hl
      0009BB 0E 0A            [ 7]  987         ld      c,#2*(HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05)
      0009BD A7               [ 4]  988         and     a
      0009BE ED 42            [15]  989         sbc     hl,bc
      0009C0 EB               [ 4]  990         ex      de,hl
      0009C1 A7               [ 4]  991         and     a
      0009C2 ED 42            [15]  992         sbc     hl,bc
      0009C4 C1               [10]  993         pop     bc
      0009C5 10 ED            [13]  994         djnz    move_table_entry
      0009C7 3A 7E 0E         [13]  995         ld      a,(INITIALS)
      0009CA 12               [ 7]  996         ld      (de),a
      0009CB 13               [ 6]  997         inc     de
      0009CC 3A 7F 0E         [13]  998         ld      a,(INITIALS+1)
      0009CF 12               [ 7]  999         ld      (de),a
      0009D0 EB               [ 4] 1000         ex      de,hl
      0009D1 D1               [10] 1001         pop     de
      0009D2 23               [ 6] 1002         inc     hl
      0009D3 73               [ 7] 1003         ld      (hl),e
      0009D4 23               [ 6] 1004         inc     hl
      0009D5 72               [ 7] 1005         ld      (hl),d
      0009D6 23               [ 6] 1006         inc     hl
      0009D7 3A DE 0D         [13] 1007         ld      a,(LEVEL)
      0009DA 77               [ 7] 1008         ld      (hl),a
      0009DB C3 09 09         [10] 1009         jp      print_highscore_table
      0009DE                       1010 draw_new_highscore_box:
      0009DE 21 FB EC         [10] 1011         ld      hl,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      0009E1 36 2A            [10] 1012         ld      (hl),#'*'
      0009E3 11 FC EC         [10] 1013         ld      de,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+8+ALIGN_MIDDLE
      0009E6 01 11 00         [10] 1014         ld      bc,#TXT_NEW_HIGH_SCORE_size-1
      0009E9 ED B0            [21] 1015         ldir
      0009EB 0E 8F            [ 7] 1016         ld      c,#4*SCREEN_WIDTH-TXT_NEW_HIGH_SCORE_size+1
      0009ED 09               [11] 1017         add     hl,bc
      0009EE EB               [ 4] 1018         ex      de,hl
      0009EF 09               [11] 1019         add     hl,bc
      0009F0 EB               [ 4] 1020         ex      de,hl
      0009F1 0E 11            [ 7] 1021         ld      c,#TXT_NEW_HIGH_SCORE_size-1
      0009F3 36 2A            [10] 1022         ld      (hl),#'*'
      0009F5 ED B0            [21] 1023         ldir
      0009F7 11 4B ED         [10] 1024         ld      de,#BWS+(11-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      0009FA 21 A4 0E         [10] 1025         ld      hl,#TXT_NEW_HIGH_SCORE
      0009FD 0E 12            [ 7] 1026         ld      c,#TXT_NEW_HIGH_SCORE_size
      0009FF ED B0            [21] 1027         ldir
      000A01 1E 23            [ 7] 1028         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      000A03 3E 2A            [ 7] 1029         ld      a,#'*'
      000A05 12               [ 7] 1030         ld      (de),a
      000A06 1E 34            [ 7] 1031         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000A08 12               [ 7] 1032         ld      (de),a
      000A09 1E 73            [ 7] 1033         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      000A0B 12               [ 7] 1034         ld      (de),a
      000A0C 1E 84            [ 7] 1035         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000A0E 12               [ 7] 1036         ld      (de),a
      000A0F C9               [10] 1037         ret
      000A10                       1038 TOP_IMAGE:
                                   1039         ; line 1
      000710                       1040         SCREEN_POS
      000A10 20 20 20 20              1         .ascii '    '
      000A14 AE 9E 9E 9E 9E 9E 9E  1041         .db     0xae,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e ;........
             9E
      000A1C 9E 9E AD 20 20 20 20  1042         .db     0x9e,0x9e,0xad,0x20,0x20,0x20,0x20,0x20 ;..-     
             20
      000A24 20 20 20 20 20 20 20  1043         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000A2C 20 20 20 20 20 20 20  1044         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000734                       1045         SCREEN_POS
      000A34 20 20 20 20              1         .ascii '    '
                                   1046         
                                   1047         ; line 2
      000738                       1048         SCREEN_POS
      000A38 20 20 20 20              1         .ascii '    '
      000A3C 9F B9 B6 B3 B2 B6 B8  1049         .db     0x9f,0xb9,0xb6,0xb3,0xb2,0xb6,0xb8,0x20 ;.963268 
             20
      000A44 BD B0 C0 20 20 20 20  1050         .db     0xbd,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;=0@     
             20
      000A4C 20 20 20 20 20 20 20  1051         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      000A54 20 20 20 20 20 20 20  1052         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00075C                       1053         SCREEN_POS
      000A5C 20 20 20 20              1         .ascii '    '
                                   1054 
                                   1055         ; line 3
      000760                       1056         SCREEN_POS
      000A60 20 20 20 20              1         .ascii '    '
      000A64 9F B8 B7 20 B5 20 20  1057         .db     0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
             20
      000A6C B5 20 C0 20 20 20 20  1058         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      000A74 20 20 20 20 20 20 20  1059         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      000A7C 20 20 20 20 B7 B7 20  1060         .db     0x20,0x20,0x20,0x20,0xb7,0xb7,0x20,0x20 ;    77  
             20
      000784                       1061         SCREEN_POS
      000A84 20 20 20 20              1         .ascii '    '
                                   1062 
                                   1063         ; line 4
      000788                       1064         SCREEN_POS
      000A88 20 20 20 20              1         .ascii '    '
      000A8C 9F B3 20 B4 B5 20 B2  1065         .db     0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
             20
      000A94 B5 20 C0 20 20 20 20  1066         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      000A9C 20 20 20 20 20 20 20  1067         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000AA4 B6 B7 20 B9 B2 B2 B8  1068         .db     0xb6,0xb7,0x20,0xb9,0xb2,0xb2,0xb8,0x20 ;67 9228 
             20
      0007AC                       1069         SCREEN_POS
      000AAC 20 20 20 20              1         .ascii '    '
                                   1070 
                                   1071         ; line 5
      0007B0                       1072         SCREEN_POS
      000AB0 20 20 20 20              1         .ascii '    '
      000AB4 9F B1 B6 20 20 B6 B0  1073         .db     0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
             20
      000ABC B6 B0 C0 20 20 20 20  1074         .db     0xb6,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;60@     
             20
      000AC4 20 20 B2 B3 20 20 20  1075         .db     0x20,0x20,0xb2,0xb3,0x20,0x20,0x20,0x20 ;  23    
             20
      000ACC 20 BA A0 B4 B4 A0 B5  1076         .db     0x20,0xba,0xa0,0xb4,0xb4,0xa0,0xb5,0x20 ; : 44 5 
             20
      0007D4                       1077         SCREEN_POS
      000AD4 20 20 20 20              1         .ascii '    '
                                   1078 
                                   1079         ; line 6
      0007D8                       1080         SCREEN_POS
      000AD8 20 20 20 20              1         .ascii '    '
      000ADC 9F 70 72 65 73 65 6E  1081         .db     0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
             74
      000AE4 73 3A C0 20 20 20 20  1082         .db     0x73,0x3a,0xc0,0x20,0x20,0x20,0x20,0x20 ;s:@     
             20
      000AEC 20 B2 B0 B1 B3 20 20  1083         .db     0x20,0xb2,0xb0,0xb1,0xb3,0x20,0x20,0xb7 ; 2013  7
             B7
      000AF4 B6 B1 B3 B8 B1 B1 B9  1084         .db     0xb6,0xb1,0xb3,0xb8,0xb1,0xb1,0xb9,0x20 ;6138119 
             20
      0007FC                       1085         SCREEN_POS
      000AFC 20 20 20 20              1         .ascii '    '
                                   1086 
                                   1087         ; line 7
      000800                       1088         SCREEN_POS
      000B00 20 20 20 20              1         .ascii '    '
      000B04 AB F8 F8 F8 F8 F8 F8  1089         .db     0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
             F8
      000B0C F8 F8 AC 20 20 20 20  1090         .db     0xf8,0xf8,0xac,0x20,0x20,0x20,0x20,0x20 ;xx,     
             20
      000B14 20 B0 20 20 B5 B7 B6  1091         .db     0x20,0xb0,0x20,0x20,0xb5,0xb7,0xb6,0x20 ; 0  576 
             20
      000B1C 20 20 B1 B3 B6 BC 20  1092         .db     0x20,0x20,0xb1,0xb3,0xb6,0xbc,0x20,0x20 ;  136<  
             20
      000824                       1093         SCREEN_POS
      000B24 20 20 20 20              1         .ascii '    '
                                   1094 
                                   1095         ; line 8
      000828                       1096         SCREEN_POS
      000B28 20 20 20 20              1         .ascii '    '
      000B2C 20 20 20 20 20 20 20  1097         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B34 20 20 20 20 20 20 20  1098         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B3C B1 B6 B6 B6 B6 20 20  1099         .db     0xb1,0xb6,0xb6,0xb6,0xb6,0x20,0x20,0x20 ;16666   
             20
      000B44 20 20 20 B1 B9 20 20  1100         .db     0x20,0x20,0x20,0xb1,0xb9,0x20,0x20,0x20 ;   19   
             20
      00084C                       1101          SCREEN_POS
      000B4C 20 20 20 20              1         .ascii '    '
                                   1102 
                                   1103         ; line 9
      000850                       1104         Z1013_LINE
                                   1105 
                                   1106         ; line 10
      000850                       1107         Z1013_LINE
                                   1108 
                                   1109         ; line 11
      000850                       1110         SCREEN_POS
      000B50 20 20 20 20              1         .ascii '    '
      000B54 20 20 20 20 20 20 20  1111         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B5C 20 20 20 20 20 20 20  1112         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B64 20 20 20 20 20 20 20  1113         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B6C 20 20 20 20 20 20 20  1114         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000874                       1115          SCREEN_POS
      000B74 20 20 20 20              1         .ascii '    '
                                   1116 
                                   1117         ; line 12
      000878                       1118         SCREEN_POS
      000B78 20 20 20 20              1         .ascii '    '
      000B7C 20 20 20 B4 20 20 20  1119         .db     0x20,0x20,0x20,0xb4,0x20,0x20,0x20,0x20 ;   4    
             20
      000B84 20 20 20 20 B0 20 20  1120         .db     0x20,0x20,0x20,0x20,0xb0,0x20,0x20,0x20 ;    0   
             20
      000B8C 20 20 20 20 20 20 B4  1121         .db     0x20,0x20,0x20,0x20,0x20,0x20,0xb4,0x20 ;      4 
             20
      000B94 20 20 20 20 B4 B2 20  1122         .db     0x20,0x20,0x20,0x20,0xb4,0xb2,0x20,0x20 ;    42  
             20
      00089C                       1123          SCREEN_POS
      000B9C 20 20 20 20              1         .ascii '    '
                                   1124 
                                   1125         ; line 13
      0008A0                       1126         SCREEN_POS
      000BA0 20 20 20 20              1         .ascii '    '
      000BA4 20 20 20 B4 B4 B5 B5  1127         .db     0x20,0x20,0x20,0xb4,0xb4,0xb5,0xb5,0xbd ;   4455=
             BD
      000BAC BD B5 B6 B3 B4 BC BD  1128         .db     0xbd,0xb5,0xb6,0xb3,0xb4,0xbc,0xbd,0xb2 ;=5634<=2
             B2
      000BB4 B6 B3 20 20 20 20 B4  1129         .db     0xb6,0xb3,0x20,0x20,0x20,0x20,0xb4,0xb1 ;63    41
             B1
      000BBC B8 B2 B6 B3 BB B0 20  1130         .db     0xb8,0xb2,0xb6,0xb3,0xbb,0xb0,0x20,0x20 ;8263;0  
             20
      0008C4                       1131          SCREEN_POS
      000BC4 20 20 20 20              1         .ascii '    '
                                   1132 
                                   1133         ; line 14
      0008C8                       1134         SCREEN_POS
      000BC8 20 20 20 20              1         .ascii '    '
      000BCC 20 B3 20 B4 B4 B5 B5  1135         .db     0x20,0xb3,0x20,0xb4,0xb4,0xb5,0xb5,0xb5 ; 3 44555
             B5
      000BD4 B5 B5 B7 B0 B4 B4 B5  1136         .db     0xb5,0xb5,0xb7,0xb0,0xb4,0xb4,0xb5,0xb1 ;55704451
             B1
      000BDC B7 B4 20 20 B3 20 B4  1137         .db     0xb7,0xb4,0x20,0x20,0xb3,0x20,0xb4,0xb9 ;74  3 49
             B9
      000BE4 BD B5 20 B3 B4 B8 20  1138         .db     0xbd,0xb5,0x20,0xb3,0xb4,0xb8,0x20,0x20 ;=5 348  
             20
      0008EC                       1139          SCREEN_POS
      000BEC 20 20 20 20              1         .ascii '    '
                                   1140 
                                   1141         ; line 15
      0008F0                       1142         SCREEN_POS
      000BF0 20 20 20 20              1         .ascii '    '
      000BF4 20 B8 B7 B0 B1 B0 B1  1143         .db     0x20,0xb8,0xb7,0xb0,0xb1,0xb0,0xb1,0xb1 ; 8701011
             B1
      000BFC B1 B5 20 20 B0 B0 B1  1144         .db     0xb1,0xb5,0x20,0x20,0xb0,0xb0,0xb1,0xb1 ;15  0011
             B1
      000C04 B7 B0 20 20 B8 B7 B0  1145         .db     0xb7,0xb0,0x20,0x20,0xb8,0xb7,0xb0,0xb1 ;70  8701
             B1
      000C0C B6 20 B6 20 B0 20 B0  1146         .db     0xb6,0x20,0xb6,0x20,0xb0,0x20,0xb0,0x20 ;6 6 0 0 
             20
      000914                       1147          SCREEN_POS
      000C14 20 20 20 20              1         .ascii '    '
                                   1148 
                                   1149         ; line 16
      000918                       1150         SCREEN_POS
      000C18 20 20 20 20              1         .ascii '    '
      000C1C 20 20 20 20 20 20 20  1151         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C24 20 20 20 20 20 20 20  1152         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C2C 20 20 20 20 20 20 20  1153         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C34 20 20 20 20 20 20 20  1154         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00093C                       1155         SCREEN_POS
      000C3C 20 20 20 20              1         .ascii '    '
                                   1156 
      000C40                       1157 HINT_RIGHT:
      000C40 2D 3E 20 2E 2E 2E 20  1158         .db     0x2d,0x3e,0x20,0x2e,0x2e,0x2e,0x20,0x52 ;-> ... R
             52
      000C48 69 67 68 74           1159         .db     0x69,0x67,0x68,0x74                     ;ight
      000C4C                       1160 HINT_LEFT:
      000C4C 3C 2D 20 2E 2E 2E 2E  1161         .db     0x3c,0x2d,0x20,0x2e,0x2e,0x2e,0x2e,0x20 ;<- .... 
             20
      000C54 4C 65 66 74           1162         .db     0x4c,0x65,0x66,0x74                     ;Left
      000C58                       1163 HINT_JUMP:
      000C58 53 50 20 2E 2E 2E 2E  1164         .ascii  'SP .... Jump'
             20 4A 75 6D 70
      000C64                       1165 HINT_PLAY:
      000C64 50 20 2E 2E 2E 2E 2E  1166         .ascii  'P ..... Play'
             20 50 6C 61 79
      000C70                       1167 HINT_EXIT:
      000C70 45 20 2E 2E 2E 2E 2E  1168         .ascii  'E ..... Exit'
             20 45 78 69 74
      000C7C                       1169 HINT_COPYRIGHT:
      000C7C 43 20 31 39 38 36 20  1170         .ascii  'C 1986 Software Center Ilmenau'
             53 6F 66 74 77 61 72
             65 20 43 65 6E 74 65
             72 20 49 6C 6D 65 6E
             61 75
      000C9A                       1171 HINT_NAME:
      000C9A 47 2E 46 69 73 63 68  1172         .ascii  'G.Fischer & CO'
             65 72 20 26 20 43 4F
      000CA8                       1173 HINT_YEAR:
      000CA8 20 20 32 30 32 30 20  1174         .ascii  '  2020 Version'
             56 65 72 73 69 6F 6E
      000CB6                       1175 VERSION_INFO:
      000CB6 20 31 2E 31 20        1176         .db     0x20,0x31,0x2e,0x31,0x20                ; 1.1 
      000CBB                       1177 LINE_BUFFER:
      000CBB EE EE EE EE EE EE EE  1178         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CC3 EE EE EE EE EE EE EE  1179         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CCB EE EE EE EE EE EE EE  1180         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CD3 EE EE EE EE EE EE EE  1181         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CDB EE EE EE EE EE EE EE  1182         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CE3 EE EE EE EE EE EE EE  1183         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CEB EE EE EE EE EE EE EE  1184         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CF3 EE EE EE EE EE EE EE  1185         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CFB 20 20 20 EE EE EE EE  1186         .db     0x20,0x20,0x20,0xee,0xee,0xee,0xee,0xee ;   nnnnn
             EE
      000D03 EE EE EE EE EE EE EE  1187         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D0B EE EE EE EE EE 20 20  1188         .db     0xee,0xee,0xee,0xee,0xee,0x20,0x20,0x20 ;nnnnn   
             20
      000D13 20 20 EE EE EE EE EE  1189         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000D1B EE EE EE EE EE EE EE  1190         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D23 EE 20 20 20 EE EE EE  1191         .db     0xee,0x20,0x20,0x20,0xee,0xee,0xee,0xee ;n   nnnn
             EE
      000D2B EE EE EE EE EE EE EE  1192         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D33 EE EE EE 20 20 20 EE  1193         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D3B EE EE EE EE EE EE EE  1194         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D43 EE EE EE EE 20 20 20  1195         .db     0xee,0xee,0xee,0xee,0x20,0x20,0x20,0xee ;nnnn   n
             EE
      000D4B EE EE EE EE EE EE EE  1196         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0x20 ;nnnnnnn 
             20
      000D53 20 20 EE EE EE EE EE  1197         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000D5B EE EE EE 20 20 20 EE  1198         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D63 EE EE EE EE EE EE EE  1199         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D6B EE EE EE EE EE EE EE  1200         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D73 EE EE EE EE EE EE EE  1201         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D7B EE EE EE 20 20 20 EE  1202         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D83 EE EE EE EE EE EE EE  1203         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D8B EE EE EE EE EE EE EE  1204         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D93 EE EE EE EE EE EE 20  1205         .db     0xee,0xee,0xee,0xee,0xee,0xee,0x20,0x20 ;nnnnnn  
             20
      000D9B 20 EE EE EE EE EE EE  1206         .db     0x20,0xee,0xee,0xee,0xee,0xee,0xee,0xee ; nnnnnnn
             EE
      000DA3 EE EE EE EE EE EE EE  1207         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DAB EE EE EE EE EE EE EE  1208         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DB3 EE EE EE EE EE EE EE  1209         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DBB EE EE EE EE EE EE EE  1210         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DC3 EE EE EE EE EE EE EE  1211         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee      ;nnnnnnn
                                   1212 ; unchecked data source
      000DCA EE                    1213         .db     0xee                                    ;n
      000DCB                       1214 OFFSET_HOLES:
      000DCB 58 7C 41 98 56        1215         .db     0x58,0x7c,0x41,0x98,0x56                ;X|A.V
      000DD0                       1216 OFFSET_HOLES_JUMP_PENALTY:
      000DD0 8B A2 68 C2 DD        1217         .db     0x8b,0xa2,0x68,0xc2,0xdd                ;."hB]
      000DD5                       1218 cnt_fail_trap:
      000DD5 05                    1219         .db     5
      000DD6                       1220 cnt_fail_jump:
      000DD6 05                    1221         .db     5
      000DD7                       1222 MAN_HEAD:
      000DD7 32 EF                 1223         .dw     BWS+(GAME_START_Y+(8-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      000DD9                       1224 JUMP_DELAY:
      000DD9 01                    1225         .db     1
      000DDA                       1226 FAIL_DELAY:
      000DDA 01                    1227         .db     1
      000DDB                       1228 LIVES:
      000DDB 06                    1229         .db     6
      000DDC                       1230 POINTS:
      000DDC 00 00                 1231         .dw     0
      000DDE                       1232 LEVEL:
      000DDE 01                    1233         .db     1
      000DDF                       1234 counter:
      000DDF 01                    1235         .db     1
      000DE0                       1236 TXT_JUMP:
      000DE0 2A 20 4A 55 4D 50 49  1237         .ascii  '* JUMPING JACK *'
             4E 47 20 4A 41 43 4B
             20 2A
      000DF0                       1238 MONSTER_PTR:
      000DF0 DF ED                 1239         .dw     BWS+(GAME_START_Y+3*3+1)*SCREEN_WIDTH-1
      000DF2 30 EE                 1240         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+0
      000DF4 31 EE                 1241         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000DF6 32 EE                 1242         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
                                   1243 
      000DF8 D5 EC                 1244         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
      000DFA D6 EC                 1245         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+14
      000DFC D7 EC                 1246         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+15
      000DFE D8 EC                 1247         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+16
                                   1248 
      000E00 31 EE                 1249         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000E02 32 EE                 1250         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
      000E04 33 EE                 1251         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+3
      000E06 34 EE                 1252         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+4
                                   1253 
      000E08 C1 EE                 1254         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+25
      000E0A C2 EE                 1255         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+26
      000E0C C3 EE                 1256         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+27
      000E0E C4 EE                 1257         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+28
                                   1258 
      000E10 D2 EC                 1259         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+10
      000E12 D3 EC                 1260         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+11
      000E14 D4 EC                 1261         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+12
      000E16 D5 EC                 1262         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
                                   1263 
      000E18 B3 EE                 1264         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+11
      000E1A B4 EE                 1265         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+12
      000E1C B5 EE                 1266         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+13
      000E1E B6 EE                 1267         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14
                                   1268 
      000E20 BD EE                 1269         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+21
      000E22 BE EE                 1270         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+22
      000E24 BF EE                 1271         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+23
      000E26 C0 EE                 1272         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+24
      000E28                       1273 MONSTER_IMG:
      000E28 94 90 8B 90 8B 91 97  1274         .db     0x94,0x90,0x8b,0x90,0x8b,0x91,0x97,0x91 ;........
             91
      000E30 19 B5 20 BE 20 BF 20  1275         .db     0x19,0xb5,0x20,0xbe,0x20,0xbf,0x20,0xae ;.5 > ? .
             AE
      000E38 92 96 A0 A0 A0 A0 88  1276         .db     0x92,0x96,0xa0,0xa0,0xa0,0xa0,0x88,0xc1 ;..    .A
             C1
      000E40 20 95 20 B7 1E FF 20  1277         .db     0x20,0x95,0x20,0xb7,0x1e,0xff,0x20,0x92 ; . 7.. .
             92
      000E48 17 8C F9 8C 1D 1F FC  1278         .db     0x17,0x8c,0xf9,0x8c,0x1d,0x1f,0xfc,0x8c ;..y...|.
             8C
      000E50 92 96 83 82 95 93 20  1279         .db     0x92,0x96,0x83,0x82,0x95,0x93,0x20,0x20 ;......  
             20
      000E58 20 20 20 20 20 20 20  1280         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000E60                       1281 HIGH_SCORE_TABLE01:
      000E60 5F 5F                 1282         .ascii '__'
      000E62                       1283 HIGH_SCORE_TABLE01.points:
      000E62 00 00                 1284         .dw     0
      000E64                       1285 HIGH_SCORE_TABLE01.level:
      000E64 01                    1286         .db     1
      000E65                       1287 HIGH_SCORE_TABLE02:
      000E65 5F 5F                 1288         .ascii '__'
      000E67                       1289 HIGH_SCORE_TABLE02.points:
      000E67 00 00                 1290         .dw     0
      000E69                       1291 HIGH_SCORE_TABLE02.level:
      000E69 01                    1292         .db     1
      000E6A                       1293 HIGH_SCORE_TABLE03:
      000E6A 5F 5F                 1294         .ascii '__'
      000E6C                       1295 HIGH_SCORE_TABLE03.points:
      000E6C 00 00                 1296         .dw     0
      000E6E                       1297 HIGH_SCORE_TABLE03.level:
      000E6E 01                    1298         .db     1
      000E6F                       1299 HIGH_SCORE_TABLE04:
      000E6F 5F 5F                 1300         .ascii '__'
      000E71                       1301 HIGH_SCORE_TABLE04.points:
      000E71 00 00                 1302         .dw     0
      000E73                       1303 HIGH_SCORE_TABLE04.level:
      000E73 01                    1304         .db     1
      000E74                       1305 HIGH_SCORE_TABLE05:
      000E74 5F 5F                 1306         .ascii '__'
      000E76                       1307 HIGH_SCORE_TABLE05.points:
      000E76 00 00                 1308         .dw     0
      000E78                       1309 HIGH_SCORE_TABLE05.level:
      000E78 01                    1310         .db     1
      000E79                       1311 HIGH_SCORE_TABLE_TMP:
      000E79 5F 5F                 1312         .ascii '__'
      000E7B                       1313 HIGH_SCORE_TABLE_TMP.points:
      000E7B 00 00                 1314         .dw     0
      000E7D                       1315 HIGH_SCORE_TABLE_TMP.level:
      000E7D 01                    1316         .db     1
      000E7E                       1317 INITIALS:
      000E7E 5F 5F                 1318         .ascii '__'
      000E80                       1319 TXT_GAME_OVER:
      000E80 2A 2A 20 47 41 4D 45  1320         .ascii  '** GAME OVER **'
             20 4F 56 45 52 20 2A
             2A
      000E8F                       1321 TXT_YOUR_SCORE:
      000E8F 59 4F 55 52 20 53 43  1322         .ascii  'YOUR SCORE :'
             4F 52 45 20 3A
      000E9B                       1323 TXT_HAZARD:
      000E9B 48 41 5A 41 52 44 53  1324         .ascii  'HAZARDS :'
             20 3A
      000EA4                       1325 TXT_NEW_HIGH_SCORE:
      000EA4 2A 20 4E 45 57 20 48  1326         .ascii  '* NEW HIGH SCORE *'
             49 47 48 20 53 43 4F
             52 45 20 2A
                                   1327 ; end of source

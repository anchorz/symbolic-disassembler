                                      1         .module jumping_jack
                                      2         .include 'platform.s'
                           000000     1 z9001                           =       0
                           000001     2 z1013                           =       1
                                      3 ;
                                      4 ; z1013 specific constants
                                      5 ;
                           000004     6 KEY_CODE                        =       0x0004
                           00002B     7 CURSOR_POS                      =       0x002b
                                      8 ;
                                      9 ; platform specific
                                     10 ;
                           000020    11 SCREEN_WIDTH                    =       0x20
                           000020    12 SCREEN_HEIGHT                   =       0x20
                                     13 
                           000010    14 TOP_LINES                       =       16
                           0001FF    15 TITLE_TOP_SIZE                  =       SCREEN_WIDTH*TOP_LINES-1
                           000014    16 MENU_TOP                        =       (TOP_LINES+4)
                           000000    17 ALIGN_MIDDLE                    =       0
                           000008    18 GAMES_LINES                     =       8
                           000003    19 GAME_START_Y                    =       3
                           00330A    20 SLOW_DOWN_13066                 =       13066
                           000380    21 POS_COPYRIGHT                   =       SCREEN_WIDTH*28
                           00EFC0    22 POS_LIVES                       =       BWS+30*SCREEN_WIDTH
                           00EC40    23 POS_TOP_WALL                    =       BWS+ 2*SCREEN_WIDTH
                           00EC28    24 POS_TOP_GAME                    =       BWS+ 1*SCREEN_WIDTH+8
                           00EC49    25 POS_GAME_OVER                   =       BWS+ 2*SCREEN_WIDTH+9
                           000009    26 POSDIFF_NAME                    =       SCREEN_WIDTH-HINT_COPYRIGHT_size+7
                           00000B    27 POSDIFF_YEAR                    =       SCREEN_WIDTH-HINT_NAME_size-7
                           000000    28 POSDIFF_POINTS                  =       0
                           000000    29 POSDIFF_YOUR_SCORE              =       0
                           000000    30 POSDIFF_YOUR_SCORE_DY           =       0
                           000000    31 POSDIFF_HIGHSCORE_DY            =       0
                           000000    32 MONSTER_CORRECTION              =       0
                                     33 
                                     34 .macro PROGRAM_START
                                     35 .endm
                                     36 
                                     37 .macro SCREEN_POS
                                     38 .endm
                                     39 
                                     40 .macro CLRSCR
                                     41         ld      a,#0x0c
                                     42         rst     0x20
                                     43         .db     0x00              ;OUTCH
                                     44 .endm
                                     45 
                                     46 .macro OUTCH
                                     47         rst     0x20
                                     48         .db     0x00              ;OUTCH
                                     49 .endm
                                     50 
                                     51 .macro INCH
                                     52         rst     0x20
                                     53         .db     0x01              ;INCH
                                     54 .endm
                                     55 
                                     56 .macro PRST7
                                     57         rst     0x20
                                     58         .db     0x02              ;PRTST7
                                     59 .endm
                                     60 
                                     61 .macro INKEY
                                     62         xor     a
                                     63         ld      (KEY_CODE),a
                                     64         rst     0x20
                                     65         .db     0x04              ;INKEY
                                     66 .endm
                                     67 
                                     68 .macro END_PROGRAM
                                     69         rst     0x38
                                     70 .endm
                                     71 
                                     72 .macro SET_CURSOR_DE Y,X
                                     73         ld      de,#BWS+Y*SCREEN_WIDTH+X
                                     74         ld      (CURSOR_POS),de
                                     75 .endm
                                     76 
                                     77 .macro SET_CURSOR_HL Y,X
                                     78         ld      hl,#BWS+Y*SCREEN_WIDTH+X
                                     79         ld      (CURSOR_POS),hl
                                     80 .endm
                                     81 
                                     82 .macro SET_CURSOR
                                     83         ld      (CURSOR_POS),hl
                                     84 .endm
                                     85 
                                     86 .macro REMOVE_CURSOR
                                     87         ld      hl,(CURSOR_POS)
                                     88         ld      (hl),#' '
                                     89 .endm
                                     90 
                                     91 .macro CURSOR_DISABLE
                                     92 .endm
                                     93 
                                     94 .macro Z1013_LINE
                                     95         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                     96         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                     97         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                     98         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                     99 .endm
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
      000100                         78 _main:
      000100                         79 sadr:
      000000                         80         PROGRAM_START
      000000                         81         CLRSCR
      000100 3E 0C            [ 7]    1         ld      a,#0x0c
      000102 E7               [11]    2         rst     0x20
      000103 00                       3         .db     0x00              ;OUTCH
      000104 11 00 EC         [10]   82         ld      de,#BWS
      000107 21 8A 07         [10]   83         ld      hl,#TOP_IMAGE
      00010A 01 FF 01         [10]   84         ld      bc,#TITLE_TOP_SIZE
      00010D ED B0            [21]   85         ldir
      00010F 21 00 EE         [10]   86         ld      hl,#BWS+SCREEN_WIDTH*TOP_LINES
      000112 36 CB            [10]   87         ld      (hl),#VK_HEART
      000114 11 01 EE         [10]   88         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+1
      000117 01 1F 00         [10]   89         ld      bc,#SCREEN_WIDTH-1
      00011A ED B0            [21]   90         ldir
      00011C 11 18 EE         [10]   91         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+(SCREEN_WIDTH-8)
      00011F 21 00 0A         [10]   92         ld      hl,#VERSION_INFO
      000122 01 05 00         [10]   93         ld      bc,#VERSION_INFO_size
      000125 ED B0            [21]   94         ldir
      000127 11 8A EE         [10]   95         ld      de,#BWS+SCREEN_WIDTH*MENU_TOP+10+ALIGN_MIDDLE
      00012A 21 8A 09         [10]   96         ld      hl,#HINT_RIGHT
      00012D 01 0C 00         [10]   97         ld      bc,#HINT_RIGHT_size
      000130 ED B0            [21]   98         ldir
      000132 0E 14            [ 7]   99         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000134 EB               [ 4]  100         ex      de,hl
      000135 09               [11]  101         add     hl,bc
      000136 EB               [ 4]  102         ex      de,hl
      000137 0E 0C            [ 7]  103         ld      c,#HINT_RIGHT_size
      000139 ED B0            [21]  104         ldir
      00013B 0E 14            [ 7]  105         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      00013D EB               [ 4]  106         ex      de,hl
      00013E 09               [11]  107         add     hl,bc
      00013F EB               [ 4]  108         ex      de,hl
      000140 0E 0C            [ 7]  109         ld      c,#HINT_RIGHT_size
      000142 ED B0            [21]  110         ldir
      000144 0E 14            [ 7]  111         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000146 EB               [ 4]  112         ex      de,hl
      000147 09               [11]  113         add     hl,bc
      000148 EB               [ 4]  114         ex      de,hl
      000149 0E 0C            [ 7]  115         ld      c,#HINT_RIGHT_size
      00014B ED B0            [21]  116         ldir
      00014D 0E 14            [ 7]  117         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      00014F EB               [ 4]  118         ex      de,hl
      000150 09               [11]  119         add     hl,bc
      000151 EB               [ 4]  120         ex      de,hl
      000152 0E 0C            [ 7]  121         ld      c,#HINT_RIGHT_size
      000154 ED B0            [21]  122         ldir
      000156 11 80 EF         [10]  123         ld      de,#BWS+POS_COPYRIGHT
      000159 0E 1E            [ 7]  124         ld      c,#HINT_COPYRIGHT_size
      00015B ED B0            [21]  125         ldir
      00015D 0E 09            [ 7]  126         ld      c,#POSDIFF_NAME
      00015F EB               [ 4]  127         ex      de,hl
      000160 09               [11]  128         add     hl,bc
      000161 EB               [ 4]  129         ex      de,hl
      000162 0E 0E            [ 7]  130         ld      c,#HINT_NAME_size
      000164 ED B0            [21]  131         ldir
      000166 0E 0B            [ 7]  132         ld      c,#POSDIFF_YEAR
      000168 EB               [ 4]  133         ex      de,hl
      000169 09               [11]  134         add     hl,bc
      00016A EB               [ 4]  135         ex      de,hl
      00016B 0E 12            [ 7]  136         ld      c,#HINT_YEAR_size+VERSION_INFO_size-1
      00016D ED B0            [21]  137         ldir
      00016F                        138 choose_menu:
      00016F AF               [ 4]  139         xor     a
      000070                        140         INCH
      000170 E7               [11]    1         rst     0x20
      000171 01                       2         .db     0x01              ;INCH
      000172 FE 5F            [ 7]  141         cp      #SMALL_CAPITALS
      000174 38 02            [12]  142         jr      c,capitalized
      000176 D6 20            [ 7]  143         sub     #CAPITALIZE
      000178                        144 capitalized:
      000178 FE 45            [ 7]  145         cp      #'E'
      00017A CA 15 07         [10]  146         jp      z,exit_game
      00017D FE 50            [ 7]  147         cp      #'P'
      00017F 20 EE            [12]  148         jr      nz,choose_menu
      000181                        149 new_game:
      000081                        150         CLRSCR
      000181 3E 0C            [ 7]    1         ld      a,#0x0c
      000183 E7               [11]    2         rst     0x20
      000184 00                       3         .db     0x00              ;OUTCH
      000185 21 25 0B         [10]  151         ld      hl,#LIVES
      000188 36 06            [10]  152         ld      (hl),#INITIAL_LIVES
      00018A 21 26 0B         [10]  153         ld      hl,#POINTS
      00018D 36 00            [10]  154         ld      (hl),#ZERO
      00018F 23               [ 6]  155         inc     hl
      000190 36 00            [10]  156         ld      (hl),#ZERO
      000192 06 06            [ 7]  157         ld      b,#INITIAL_LIVES
      000194 21 C0 EF         [10]  158         ld      hl,#POS_LIVES
      000197                        159 draw_player:
      000197 3E 02            [ 7]  160         ld      a,#MOVE_2X_RIGHT
      000199 85               [ 4]  161         add     a,l
      00019A 6F               [ 4]  162         ld      l,a
      00019B 36 C4            [10]  163         ld      (hl),#VK_PLAYER
      00019D 10 F8            [13]  164         djnz    draw_player
      00019F 3E 01            [ 7]  165         ld      a,#INITIAL_LEVEL
      0001A1 32 28 0B         [13]  166         ld      (LEVEL),a
      0001A4 3E 02            [ 7]  167         ld      a,#INITIAL_FAIL_COUNTER
      0001A6 32 1F 0B         [13]  168         ld      (cnt_fail_trap),a
      0001A9 32 20 0B         [13]  169         ld      (cnt_fail_jump),a
      0001AC 21 00 EC         [10]  170         ld      hl,#BWS
      0001AF 36 20            [10]  171         ld      (hl),#' '
      0001B1 11 01 EC         [10]  172         ld      de,#BWS+1
      0001B4 01 BE 03         [10]  173         ld      bc,#(3+GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH-2
      0001B7 ED B0            [21]  174         ldir
      0001B9 21 40 EC         [10]  175         ld      hl,#POS_TOP_WALL
      0001BC 36 C6            [10]  176         ld      (hl),#CHR_WALL
      0001BE 11 41 EC         [10]  177         ld      de,#POS_TOP_WALL+1
      0001C1 01 1F 00         [10]  178         ld      bc,#SCREEN_WIDTH-1
      0001C4 ED B0            [21]  179         ldir
      0001C6 21 78 EC         [10]  180         ld      hl,#POS_TOP_WALL+2*SCREEN_WIDTH-8
      0001C9 36 C6            [10]  181         ld      (hl),#CHR_WALL
      0001CB 2B               [ 6]  182         dec     hl
      0001CC 2B               [ 6]  183         dec     hl
      0001CD 36 95            [10]  184         ld      (hl),#CHR_ARROW_RIGHT_TOP
      0001CF 2B               [ 6]  185         dec     hl
      0001D0 36 F8            [10]  186         ld      (hl),#CHR_LINE_TOP
      0001D2 21 98 EC         [10]  187         ld      hl,#POS_TOP_WALL+3*SCREEN_WIDTH-8
      0001D5 36 C6            [10]  188         ld      (hl),#CHR_WALL
      0001D7 2B               [ 6]  189         dec     hl
      0001D8 2B               [ 6]  190         dec     hl
      0001D9 36 93            [10]  191         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      0001DB 2B               [ 6]  192         dec     hl
      0001DC 36 9E            [10]  193         ld      (hl),#CHR_LINE_BOTTOM
      0001DE 21 2A 0B         [10]  194         ld      hl,#TXT_JUMP
      0001E1 11 28 EC         [10]  195         ld      de,#POS_TOP_GAME
      0001E4 01 10 00         [10]  196         ld      bc,#TXT_JUMP_size
      0001E7 ED B0            [21]  197         ldir
      0001E9 3E 01            [ 7]  198         ld      a,#INITIAL_DELAY_COUNTER
      0001EB 21 23 0B         [10]  199         ld      hl,#JUMP_DELAY
      0001EE 77               [ 7]  200         ld      (hl),a
      0001EF 21 24 0B         [10]  201         ld      hl,#FAIL_DELAY
      0001F2 77               [ 7]  202         ld      (hl),a
      0001F3 23               [ 6]  203         inc     hl
      0001F4 21 6E EF         [10]  204         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      0001F7 22 21 0B         [16]  205         ld      (MAN_HEAD),hl
      0001FA 36 CC            [10]  206         ld      (hl),#CHR_MAN_HEAD
      0001FC 11 20 00         [10]  207         ld      de,#SCREEN_WIDTH
      0001FF 19               [11]  208         add     hl,de
      000200 36 A1            [10]  209         ld      (hl),#CHR_MAN_STAY
      000202                        210 animation_loop:
      000202 CD 8F 02         [17]  211         call    animation_monster
      000205 CD 4E 03         [17]  212         call    animation_lines
      000208 CD BE 03         [17]  213         call    animation_delay
      00020B 3A 23 0B         [13]  214         ld      a,(JUMP_DELAY)
      00020E FE 01            [ 7]  215         cp      #INITIAL_DELAY_COUNTER
      000210 20 1F            [12]  216         jr      nz,handle_jump_delay
      000212 3A 24 0B         [13]  217         ld      a,(FAIL_DELAY)
      000215 FE 01            [ 7]  218         cp      #INITIAL_DELAY_COUNTER
      000217 20 15            [12]  219         jr      nz,handle_fail_delay
      000119                        220         INKEY
      000219 AF               [ 4]    1         xor     a
      00021A 32 04 00         [13]    2         ld      (KEY_CODE),a
      00021D E7               [11]    3         rst     0x20
      00021E 04                       4         .db     0x04              ;INKEY
      00021F FE 20            [ 7]  221         cp      #' '
      000221 CA 7B 04         [10]  222         jp      z,action_jump
      000224 FE 08            [ 7]  223         cp      #VK_LEFT
      000226 CC CB 03         [17]  224         call    z,action_left
      000229 FE 09            [ 7]  225         cp      #VK_RIGHT
      00022B CC 22 04         [17]  226         call    z,action_right
                           000000   227 .if z9001
                                    228         ;debugginh
                                    229         cp      #'U'
                                    230         jr      nz,handle_fail_delay
                                    231         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+20
                                    232         ld      (hl),#CHR_MAN_HEAD
                                    233         ld      (MAN_HEAD),hl
                                    234 .endif
      00022E                        235 handle_fail_delay:
      00022E CD DF 04         [17]  236         call    check_fall_through
      000231                        237 handle_jump_delay:
      000231 3A 23 0B         [13]  238         ld      a,(JUMP_DELAY)
      000234 FE 01            [ 7]  239         cp      #INITIAL_DELAY_COUNTER
      000236 28 04            [12]  240         jr      z,jump_delay_counter_set
      000238 3D               [ 4]  241         dec     a
      000239 32 23 0B         [13]  242         ld      (JUMP_DELAY),a
      00023C                        243 jump_delay_counter_set:
      00023C 3A 24 0B         [13]  244         ld      a,(FAIL_DELAY)
      00023F FE 01            [ 7]  245         cp      #INITIAL_DELAY_COUNTER
      000241 28 42            [12]  246         jr      z,player_activity
      000243 3D               [ 4]  247         dec     a
      000244 32 24 0B         [13]  248         ld      (FAIL_DELAY),a
      000247 FE 01            [ 7]  249         cp      #INITIAL_DELAY_COUNTER
      000249 20 3A            [12]  250         jr      nz,player_activity
      00024B 2A 21 0B         [16]  251         ld      hl,(MAN_HEAD)
                                    252         ; test for bottom line
      00024E 11 20 EF         [10]  253         ld      de,#BWS+(GAME_START_Y+3*GAMES_LINES-2)*SCREEN_WIDTH
      000251 A7               [ 4]  254         and     a
      000252 ED 52            [15]  255         sbc     hl,de
      000254 38 16            [12]  256         jr      c,player_wake_up
      000256 3A 25 0B         [13]  257         ld      a,(LIVES)
      000259 3D               [ 4]  258         dec     a
      00025A 32 25 0B         [13]  259         ld      (LIVES),a
      00025D 21 C2 EF         [10]  260         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES+3)*SCREEN_WIDTH+2
      000260 16 00            [ 7]  261         ld      d,#HI_ZERO
      000262 87               [ 4]  262         add     a,a
      000263 5F               [ 4]  263         ld      e,a
      000264 19               [11]  264         add     hl,de
      000265 36 20            [10]  265         ld      (hl),#' '
      000267 FE 00            [ 7]  266         cp      #ZERO
      000269 CA E5 05         [10]  267         jp      z,no_lives
      00026C                        268 player_wake_up:
      00026C 2A 21 0B         [16]  269         ld      hl,(MAN_HEAD)
      00026F 36 CC            [10]  270         ld      (hl),#CHR_MAN_HEAD
      000271 2B               [ 6]  271         dec     hl
      000272 3E 20            [ 7]  272         ld      a,#' '
      000274 77               [ 7]  273         ld      (hl),a
      000275 23               [ 6]  274         inc     hl
      000276 23               [ 6]  275         inc     hl
      000277 23               [ 6]  276         inc     hl
      000278 77               [ 7]  277         ld      (hl),a
      000279 2B               [ 6]  278         dec     hl
      00027A 11 20 00         [10]  279         ld      de,#SCREEN_WIDTH
      00027D 19               [11]  280         add     hl,de
      00027E 77               [ 7]  281         ld      (hl),a
      00027F 23               [ 6]  282         inc     hl
      000280 77               [ 7]  283         ld      (hl),a
      000281 2B               [ 6]  284         dec     hl
      000282 2B               [ 6]  285         dec     hl
      000283 36 9D            [10]  286         ld      (hl),#CHR_MAN_WALK
      000285                        287 player_activity:
      000285 CD 30 05         [17]  288         call    check_level_finished
      000288 C3 02 02         [10]  289         jp      animation_loop
                                    290 ; unchecked data source
      00028B 67 75 66 69            291         .db     0x67,0x75,0x66,0x69                     ;gufi
      00028F                        292 animation_monster:
      00028F 3A 28 0B         [13]  293         ld      a,(LEVEL)
      000292 32 29 0B         [13]  294         ld      (counter),a
      000295 FE 01            [ 7]  295         cp      #LEVEL_1
      000297 C8               [11]  296         ret     z
      000298 01 3A 0B         [10]  297         ld      bc,#MONSTER_PTR
      00029B 11 72 0B         [10]  298         ld      de,#MONSTER_IMG
      00029E                        299 handle_one_monster:
      00029E 0A               [ 7]  300         ld      a,(bc)
      00029F 6F               [ 4]  301         ld      l,a
      0002A0 03               [ 6]  302         inc     bc
      0002A1 0A               [ 7]  303         ld      a,(bc)
      0002A2 67               [ 4]  304         ld      h,a
      0002A3 CD B2 02         [17]  305         call    handle_by_ptr
      0002A6 3A 29 0B         [13]  306         ld      a,(counter)
      0002A9 3D               [ 4]  307         dec     a
      0002AA 32 29 0B         [13]  308         ld      (counter),a
      0002AD FE 01            [ 7]  309         cp      #LEVEL_1
      0002AF C8               [11]  310         ret     z
      0002B0 18 EC            [12]  311         jr      handle_one_monster
      0002B2                        312 handle_by_ptr:
      0002B2 C5               [11]  313         push    bc
      0002B3 3E 04            [ 7]  314         ld      a,#MONSTER_WIDTH
      0002B5 D5               [11]  315         push    de
      0002B6                        316 handle_by_column:
      0002B6 36 20            [10]  317         ld      (hl),#' '
      0002B8 11 20 00         [10]  318         ld      de,#SCREEN_WIDTH
      0002BB 19               [11]  319         add     hl,de
      0002BC 36 20            [10]  320         ld      (hl),#' '
      0002BE A7               [ 4]  321         and     a
      0002BF ED 52            [15]  322         sbc     hl,de
      0002C1 2B               [ 6]  323         dec     hl
      0002C2 E5               [11]  324         push    hl
      0002C3 08               [ 4]  325         ex      af,af'
      0002C4 11 DF EC         [10]  326         ld      de,#BWS+(GAME_START_Y+4)*SCREEN_WIDTH-1
      0002C7 A7               [ 4]  327         and     a
      0002C8 ED 52            [15]  328         sbc     hl,de
      0002CA 38 0D            [12]  329         jr      c,correct_ptr
      0002CC C5               [11]  330         push    bc
      0002CD 06 08            [ 7]  331         ld      b,#GAMES_LINES
      0002CF 11 60 00         [10]  332         ld      de,#3*SCREEN_WIDTH
      0002D2                        333 get_column:
      0002D2 A7               [ 4]  334         and     a
      0002D3 ED 52            [15]  335         sbc     hl,de
      0002D5 38 13            [12]  336         jr      c,test_column
      0002D7 10 F9            [13]  337         djnz    get_column
      0002D9                        338 correct_ptr:
      0002D9 11 1F 00         [10]  339         ld      de,#SCREEN_WIDTH-1
      0002DC ED 5A            [15]  340         adc     hl,de
      0002DE 28 03            [12]  341         jr      z,start_from_bottom
      0002E0 E1               [10]  342         pop     hl
      0002E1 18 19            [12]  343         jr      update_pointers
      0002E3                        344 start_from_bottom:
      0002E3 E1               [10]  345         pop     hl
      0002E4 11 60 02         [10]  346         ld      de,#((GAMES_LINES-2)*3+1)*SCREEN_WIDTH
      0002E7 19               [11]  347         add     hl,de
      0002E8 18 12            [12]  348         jr      update_pointers
      0002EA                        349 test_column:
      0002EA C1               [10]  350         pop     bc
      0002EB 11 1F 00         [10]  351         ld      de,#SCREEN_WIDTH-1
      0002EE ED 5A            [15]  352         adc     hl,de
      0002F0 28 03            [12]  353         jr      z,move_one_line_up
      0002F2 E1               [10]  354         pop     hl
      0002F3 18 07            [12]  355         jr      update_pointers
      0002F5                        356 move_one_line_up:
      0002F5 E1               [10]  357         pop     hl
      0002F6 11 40 00         [10]  358         ld      de,#2*SCREEN_WIDTH
      0002F9 A7               [ 4]  359         and     a
      0002FA ED 52            [15]  360         sbc     hl,de
      0002FC                        361 update_pointers:
      0002FC 0B               [ 6]  362         dec     bc
      0002FD 7D               [ 4]  363         ld      a,l
      0002FE 02               [ 7]  364         ld      (bc),a
      0002FF 03               [ 6]  365         inc     bc
      000300 7C               [ 4]  366         ld      a,h
      000301 02               [ 7]  367         ld      (bc),a
      000302 03               [ 6]  368         inc     bc
      000303 0A               [ 7]  369         ld      a,(bc)
      000304 6F               [ 4]  370         ld      l,a
      000305 03               [ 6]  371         inc     bc
      000306 0A               [ 7]  372         ld      a,(bc)
      000307 67               [ 4]  373         ld      h,a
      000308 08               [ 4]  374         ex      af,af'
      000309 3D               [ 4]  375         dec     a
      00030A FE 00            [ 7]  376         cp      #ZERO
      00030C 28 02            [12]  377         jr      z,draw_monster
      00030E 18 A6            [12]  378         jr      handle_by_column
      000310                        379 draw_monster:
      000310 D1               [10]  380         pop     de
      000311 C1               [10]  381         pop     bc
      000312 0B               [ 6]  382         dec     bc
      000313 3E 04            [ 7]  383         ld      a,#MONSTER_WIDTH
      000315                        384 draw_monster_segment:
      000315 08               [ 4]  385         ex      af,af'
      000316 0A               [ 7]  386         ld      a,(bc)
      000317 6F               [ 4]  387         ld      l,a
      000318 03               [ 6]  388         inc     bc
      000319 0A               [ 7]  389         ld      a,(bc)
      00031A 67               [ 4]  390         ld      h,a
      00031B 03               [ 6]  391         inc     bc
      00031C 1A               [ 7]  392         ld      a,(de)
      00031D 77               [ 7]  393         ld      (hl),a
      00031E 13               [ 6]  394         inc     de
      00031F 1A               [ 7]  395         ld      a,(de)
      000320 D5               [11]  396         push    de
      000321 11 20 00         [10]  397         ld      de,#SCREEN_WIDTH
      000324 19               [11]  398         add     hl,de
      000325 77               [ 7]  399         ld      (hl),a
      000326 CD 32 03         [17]  400         call    monster_check_crash
      000329 D1               [10]  401         pop     de
      00032A 13               [ 6]  402         inc     de
      00032B 08               [ 4]  403         ex      af,af'
      00032C 3D               [ 4]  404         dec     a
      00032D FE 00            [ 7]  405         cp      #ZERO
      00032F 20 E4            [12]  406         jr      nz,draw_monster_segment
      000331 C9               [10]  407         ret
      000332                        408 monster_check_crash:
      000332 A7               [ 4]  409         and     a
      000333 ED 52            [15]  410         sbc     hl,de
      000335 EB               [ 4]  411         ex      de,hl
      000336 2A 21 0B         [16]  412         ld      hl,(MAN_HEAD)
      000339 A7               [ 4]  413         and     a
      00033A ED 52            [15]  414         sbc     hl,de
      00033C EB               [ 4]  415         ex      de,hl
      00033D C0               [11]  416         ret     nz
      00033E 11 20 00         [10]  417         ld      de,#SCREEN_WIDTH
      000341 19               [11]  418         add     hl,de
      000342 23               [ 6]  419         inc     hl
      000343 36 97            [10]  420         ld      (hl),#CHR_MAN_SLEEP
      000345 23               [ 6]  421         inc     hl
      000346 36 C9            [10]  422         ld      (hl),#CHR_MAN_SLEEP_HEAD
      000348 3E 0B            [ 7]  423         ld      a,#DELAY_COUNTER
      00034A 32 24 0B         [13]  424         ld      (FAIL_DELAY),a
      00034D C9               [10]  425         ret
      00034E                        426 animation_lines:
      00034E 3E EE            [ 7]  427         ld      a,#CHR_MOVING_LINE
      000350 21 05 0A         [10]  428         ld      hl,#LINE_BUFFER
      000353 77               [ 7]  429         ld      (hl),a
      000354 11 06 0A         [10]  430         ld      de,#LINE_BUFFER+1
      000357 01 0E 01         [10]  431         ld      bc,#LINE_BUFFER_size-1
      00035A ED B0            [21]  432         ldir
      00035C 3A 1F 0B         [13]  433         ld      a,(cnt_fail_trap)
      00035F 11 15 0B         [10]  434         ld      de,#OFFSET_HOLES
      000362 1B               [ 6]  435         dec     de
      000363                        436 loop_failed_penalty_holes:
      000363 F5               [11]  437         push    af
      000364 13               [ 6]  438         inc     de
      000365 1A               [ 7]  439         ld      a,(de)
      000366 3C               [ 4]  440         inc     a
      000367 12               [ 7]  441         ld      (de),a
      000368 4F               [ 4]  442         ld      c,a
      000369 06 00            [ 7]  443         ld      b,#HI_ZERO
      00036B 21 05 0A         [10]  444         ld      hl,#LINE_BUFFER
      00036E 09               [11]  445         add     hl,bc
      00036F 36 20            [10]  446         ld      (hl),#' '
      000371 23               [ 6]  447         inc     hl
      000372 36 20            [10]  448         ld      (hl),#' '
      000374 23               [ 6]  449         inc     hl
      000375 36 20            [10]  450         ld      (hl),#' '
      000377 F1               [10]  451         pop     af
      000378 3D               [ 4]  452         dec     a
      000379 20 E8            [12]  453         jr      nz,loop_failed_penalty_holes
      00037B 3A 20 0B         [13]  454         ld      a,(cnt_fail_jump)
      00037E 11 1A 0B         [10]  455         ld      de,#OFFSET_HOLES_JUMP_PENALTY
      000381 1B               [ 6]  456         dec     de
      000382                        457 loop_jump_penalty_holes:
      000382 F5               [11]  458         push    af
      000383 13               [ 6]  459         inc     de
      000384 1A               [ 7]  460         ld      a,(de)
      000385 3D               [ 4]  461         dec     a
      000386 12               [ 7]  462         ld      (de),a
      000387 4F               [ 4]  463         ld      c,a
      000388 06 00            [ 7]  464         ld      b,#HI_ZERO
      00038A 21 05 0A         [10]  465         ld      hl,#LINE_BUFFER
      00038D 09               [11]  466         add     hl,bc
      00038E 36 20            [10]  467         ld      (hl),#' '
      000390 23               [ 6]  468         inc     hl
      000391 36 20            [10]  469         ld      (hl),#' '
      000393 23               [ 6]  470         inc     hl
      000394 36 20            [10]  471         ld      (hl),#' '
      000396 F1               [10]  472         pop     af
      000397 3D               [ 4]  473         dec     a
      000398 20 E8            [12]  474         jr      nz,loop_jump_penalty_holes
      00039A 3E 08            [ 7]  475         ld      a,#GAMES_LINES
      00039C 21 05 0A         [10]  476         ld      hl,#LINE_BUFFER
      00039F 11 60 EC         [10]  477         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+0
      0003A2                        478 print_line:
      0003A2 01 20 00         [10]  479         ld      bc,#SCREEN_WIDTH
      0003A5 E5               [11]  480         push    hl
      0003A6 EB               [ 4]  481         ex      de,hl
      0003A7 09               [11]  482         add     hl,bc
      0003A8 09               [11]  483         add     hl,bc
      0003A9 EB               [ 4]  484         ex      de,hl
      0003AA E1               [10]  485         pop     hl
      0003AB ED B0            [21]  486         ldir
      0003AD 3D               [ 4]  487         dec     a
      0003AE 20 F2            [12]  488         jr      nz,print_line
      0003B0 21 A0 EF         [10]  489         ld      hl,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+0
      0003B3 11 A1 EF         [10]  490         ld      de,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+1
      0003B6 01 1F 00         [10]  491         ld      bc,#SCREEN_WIDTH-1
      0003B9 36 C6            [10]  492         ld      (hl),#CHR_WALL
      0003BB ED B0            [21]  493         ldir
      0003BD C9               [10]  494         ret
      0003BE                        495 animation_delay:
      0003BE 21 0A 33         [10]  496         ld      hl,#SLOW_DOWN_13066
      0003C1 11 01 00         [10]  497         ld      de,#1
      0003C4 A7               [ 4]  498         and     a
      0003C5                        499 delay_loop:
      0003C5 2B               [ 6]  500         dec     hl
      0003C6 ED 52            [15]  501         sbc     hl,de
      0003C8 20 FB            [12]  502         jr      nz,delay_loop
      0003CA C9               [10]  503         ret
      0003CB                        504 action_left:
      0003CB F5               [11]  505         push    af
      0003CC 2A 21 0B         [16]  506         ld      hl,(MAN_HEAD)
      0003CF 7E               [ 7]  507         ld      a,(hl)
      0003D0 36 20            [10]  508         ld      (hl),#' '
      0003D2 2B               [ 6]  509         dec     hl
      0003D3 22 21 0B         [16]  510         ld      (MAN_HEAD),hl
      0003D6 77               [ 7]  511         ld      (hl),a
      0003D7 11 20 00         [10]  512         ld      de,#SCREEN_WIDTH
      0003DA 19               [11]  513         add     hl,de
      0003DB 23               [ 6]  514         inc     hl
      0003DC 7E               [ 7]  515         ld      a,(hl)
      0003DD 36 20            [10]  516         ld      (hl),#' '
      0003DF FE 9D            [ 7]  517         cp      #CHR_MAN_WALK
      0003E1 28 04            [12]  518         jr      z,transition_left_stay
      0003E3 FE A1            [ 7]  519         cp      #CHR_MAN_STAY
      0003E5 28 04            [12]  520         jr      z,transition_left_walk
      0003E7                        521 transition_left_stay:
      0003E7 C6 04            [ 7]  522         add     a,#TRANSITION_MAN_WALK_STAY
      0003E9 18 02            [12]  523         jr      update_left
      0003EB                        524 transition_left_walk:
      0003EB D6 04            [ 7]  525         sub     #TRANSITION_MAN_WALK_STAY
      0003ED                        526 update_left:
      0003ED 2B               [ 6]  527         dec     hl
      0003EE 77               [ 7]  528         ld      (hl),a
      0003EF 3E 09            [ 7]  529         ld      a,#GAMES_LINES+1
      0003F1 01 5F EC         [10]  530         ld      bc,#BWS+(GAME_START_Y)*SCREEN_WIDTH-1
      0003F4                        531 loop_left_border_check:
      0003F4 C5               [11]  532         push    bc
      0003F5 60               [ 4]  533         ld      h,b
      0003F6 69               [ 4]  534         ld      l,c
      0003F7 ED 5B 21 0B      [20]  535         ld      de,(MAN_HEAD)
      0003FB A7               [ 4]  536         and     a
      0003FC ED 52            [15]  537         sbc     hl,de
      0003FE 28 0E            [12]  538         jr      z,correct_left_border
      000400                        539 left_border_next_adr:
      000400 C1               [10]  540         pop     bc
      000401 11 60 00         [10]  541         ld      de,#3*SCREEN_WIDTH
      000404 60               [ 4]  542         ld      h,b
      000405 69               [ 4]  543         ld      l,c
      000406 19               [11]  544         add     hl,de
      000407 44               [ 4]  545         ld      b,h
      000408 4D               [ 4]  546         ld      c,l
      000409 3D               [ 4]  547         dec     a
      00040A 20 E8            [12]  548         jr      nz,loop_left_border_check
      00040C F1               [10]  549         pop     af
      00040D C9               [10]  550         ret
      00040E                        551 correct_left_border:
      00040E 2A 21 0B         [16]  552         ld      hl,(MAN_HEAD)
      000411 11 20 00         [10]  553         ld      de,#SCREEN_WIDTH
      000414 36 C6            [10]  554         ld      (hl),#CHR_WALL
      000416 19               [11]  555         add     hl,de
      000417 36 CC            [10]  556         ld      (hl),#CHR_MAN_HEAD
      000419 22 21 0B         [16]  557         ld      (MAN_HEAD),hl
      00041C 19               [11]  558         add     hl,de
      00041D 36 9D            [10]  559         ld      (hl),#CHR_MAN_WALK
      00041F C3 00 04         [10]  560         jp      left_border_next_adr
      000422                        561 action_right:
      000422 F5               [11]  562         push    af
      000423 2A 21 0B         [16]  563         ld      hl,(MAN_HEAD)
      000426 7E               [ 7]  564         ld      a,(hl)
      000427 36 20            [10]  565         ld      (hl),#' '
      000429 23               [ 6]  566         inc     hl
      00042A 22 21 0B         [16]  567         ld      (MAN_HEAD),hl
      00042D 77               [ 7]  568         ld      (hl),a
      00042E 11 20 00         [10]  569         ld      de,#SCREEN_WIDTH
      000431 19               [11]  570         add     hl,de
      000432 2B               [ 6]  571         dec     hl
      000433 7E               [ 7]  572         ld      a,(hl)
      000434 36 20            [10]  573         ld      (hl),#' '
      000436 FE 9D            [ 7]  574         cp      #CHR_MAN_WALK
      000438 28 04            [12]  575         jr      z,transition_stay
      00043A FE A1            [ 7]  576         cp      #CHR_MAN_STAY
      00043C 28 04            [12]  577         jr      z,transition_walk
      00043E                        578 transition_stay:
      00043E C6 04            [ 7]  579         add     a,#TRANSITION_MAN_WALK_STAY
      000440 18 02            [12]  580         jr      update_right
      000442                        581 transition_walk:
      000442 D6 04            [ 7]  582         sub     #TRANSITION_MAN_WALK_STAY
      000444                        583 update_right:
      000444 23               [ 6]  584         inc     hl
      000445 77               [ 7]  585         ld      (hl),a
      000446 3E 09            [ 7]  586         ld      a,#GAMES_LINES+1
      000448 01 80 EC         [10]  587         ld      bc,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH+0
      00044B                        588 loop_right_border_check:
      00044B C5               [11]  589         push    bc
      00044C 60               [ 4]  590         ld      h,b
      00044D 69               [ 4]  591         ld      l,c
      00044E ED 5B 21 0B      [20]  592         ld      de,(MAN_HEAD)
      000452 A7               [ 4]  593         and     a
      000453 ED 52            [15]  594         sbc     hl,de
      000455 28 0E            [12]  595         jr      z,correct_right_border
      000457                        596 right_border_next_adr:
      000457 C1               [10]  597         pop     bc
      000458 11 60 00         [10]  598         ld      de,#3*SCREEN_WIDTH
      00045B 60               [ 4]  599         ld      h,b
      00045C 69               [ 4]  600         ld      l,c
      00045D 19               [11]  601         add     hl,de
      00045E 44               [ 4]  602         ld      b,h
      00045F 4D               [ 4]  603         ld      c,l
      000460 3D               [ 4]  604         dec     a
      000461 20 E8            [12]  605         jr      nz,loop_right_border_check
      000463 F1               [10]  606         pop     af
      000464 C9               [10]  607         ret
      000465                        608 correct_right_border:
      000465 2A 21 0B         [16]  609         ld      hl,(MAN_HEAD)
      000468 4E               [ 7]  610         ld      c,(hl)
      000469 36 9D            [10]  611         ld      (hl),#CHR_MAN_WALK
      00046B 11 20 00         [10]  612         ld      de,#SCREEN_WIDTH
      00046E A7               [ 4]  613         and     a
      00046F ED 52            [15]  614         sbc     hl,de
      000471 71               [ 7]  615         ld      (hl),c
      000472 22 21 0B         [16]  616         ld      (MAN_HEAD),hl
      000475 19               [11]  617         add     hl,de
      000476 19               [11]  618         add     hl,de
      000477 36 EE            [10]  619         ld      (hl),#CHR_MOVING_LINE
      000479 18 DC            [12]  620         jr      right_border_next_adr
      00047B                        621 action_jump:
      00047B 2A 21 0B         [16]  622         ld      hl,(MAN_HEAD)
      00047E 11 20 00         [10]  623         ld      de,#SCREEN_WIDTH
      000481 A7               [ 4]  624         and     a
      000482 ED 52            [15]  625         sbc     hl,de
      000484 7E               [ 7]  626         ld      a,(hl)
      000485 FE 20            [ 7]  627         cp      #' '
      000487 28 0B            [12]  628         jr      z,jump_ok
      000489 FE EE            [ 7]  629         cp      #CHR_MOVING_LINE
      00048B 28 2B            [12]  630         jr      z,jump_fail
      00048D FE C6            [ 7]  631         cp      #CHR_WALL
      00048F 28 27            [12]  632         jr      z,jump_fail
      000491 C3 2E 02         [10]  633         jp      handle_fail_delay
      000494                        634 jump_ok:
      000494 D9               [ 4]  635         exx
      000495 CD 96 05         [17]  636         call    add_10_points
      000498 D9               [ 4]  637         exx
      000499 19               [11]  638         add     hl,de
      00049A 36 20            [10]  639         ld      (hl),#' '
      00049C 19               [11]  640         add     hl,de
      00049D 36 20            [10]  641         ld      (hl),#' '
      00049F 1E 60            [ 7]  642         ld      e,#3*SCREEN_WIDTH
      0004A1 A7               [ 4]  643         and     a
      0004A2 ED 52            [15]  644         sbc     hl,de
      0004A4 36 9D            [10]  645         ld      (hl),#CHR_MAN_WALK
      0004A6 1E 20            [ 7]  646         ld      e,#SCREEN_WIDTH
      0004A8 A7               [ 4]  647         and     a
      0004A9 ED 52            [15]  648         sbc     hl,de
      0004AB 36 CC            [10]  649         ld      (hl),#CHR_MAN_HEAD
      0004AD 22 21 0B         [16]  650         ld      (MAN_HEAD),hl
      0004B0 3E 04            [ 7]  651         ld      a,#DELAY_COUNTER_JUMP
      0004B2 32 23 0B         [13]  652         ld      (JUMP_DELAY),a
      0004B5 C3 2E 02         [10]  653         jp      handle_fail_delay
      0004B8                        654 jump_fail:
      0004B8 19               [11]  655         add     hl,de
      0004B9 2B               [ 6]  656         dec     hl
      0004BA 3E CD            [ 7]  657         ld      a,#CHR_SMOKE
      0004BC 77               [ 7]  658         ld      (hl),a
      0004BD 23               [ 6]  659         inc     hl
      0004BE 23               [ 6]  660         inc     hl
      0004BF 23               [ 6]  661         inc     hl
      0004C0 77               [ 7]  662         ld      (hl),a
      0004C1 2B               [ 6]  663         dec     hl
      0004C2 2B               [ 6]  664         dec     hl
      0004C3 36 20            [10]  665         ld      (hl),#' '
      0004C5 19               [11]  666         add     hl,de
      0004C6 36 97            [10]  667         ld      (hl),#CHR_MAN_SLEEP
      0004C8 23               [ 6]  668         inc     hl
      0004C9 36 C9            [10]  669         ld      (hl),#CHR_MAN_SLEEP_HEAD
      0004CB 3E 0B            [ 7]  670         ld      a,#DELAY_COUNTER
      0004CD 32 24 0B         [13]  671         ld      (FAIL_DELAY),a
      0004D0 3A 20 0B         [13]  672         ld      a,(cnt_fail_jump)
      0004D3 FE 05            [ 7]  673         cp      #MAX_FAIL_COUNTER
      0004D5 CA 2E 02         [10]  674         jp      z,handle_fail_delay
      0004D8 3C               [ 4]  675         inc     a
      0004D9 32 20 0B         [13]  676         ld      (cnt_fail_jump),a
      0004DC C3 2E 02         [10]  677         jp      handle_fail_delay
      0004DF                        678 check_fall_through:
      0004DF 3A 23 0B         [13]  679         ld      a,(JUMP_DELAY)
      0004E2 FE 01            [ 7]  680         cp      #INITIAL_DELAY_COUNTER
      0004E4 C0               [11]  681         ret     nz
      0004E5                        682 check_for_trap:
      0004E5 2A 21 0B         [16]  683         ld      hl,(MAN_HEAD)
      0004E8 11 20 00         [10]  684         ld      de,#SCREEN_WIDTH
      0004EB 19               [11]  685         add     hl,de
      0004EC 19               [11]  686         add     hl,de
      0004ED 7E               [ 7]  687         ld      a,(hl)
      0004EE FE 20            [ 7]  688         cp      #' '
      0004F0 C0               [11]  689         ret     nz
      0004F1 3A 24 0B         [13]  690         ld      a,(FAIL_DELAY)
      0004F4 FE 01            [ 7]  691         cp      #INITIAL_DELAY_COUNTER
      0004F6 28 15            [12]  692         jr      z,erase_player_fell_down
      0004F8 2A 21 0B         [16]  693         ld      hl,(MAN_HEAD)
      0004FB 3E 20            [ 7]  694         ld      a,#' '
      0004FD 2B               [ 6]  695         dec     hl
      0004FE 77               [ 7]  696         ld      (hl),a
      0004FF 23               [ 6]  697         inc     hl
      000500 23               [ 6]  698         inc     hl
      000501 23               [ 6]  699         inc     hl
      000502 77               [ 7]  700         ld      (hl),a
      000503 2B               [ 6]  701         dec     hl
      000504 19               [11]  702         add     hl,de
      000505 77               [ 7]  703         ld      (hl),a
      000506 23               [ 6]  704         inc     hl
      000507 77               [ 7]  705         ld      (hl),a
      000508 2B               [ 6]  706         dec     hl
      000509 2B               [ 6]  707         dec     hl
      00050A 77               [ 7]  708         ld      (hl),a
      00050B 18 08            [12]  709         jr      player_fell_down
      00050D                        710 erase_player_fell_down:
      00050D 2A 21 0B         [16]  711         ld      hl,(MAN_HEAD)
      000510 3E 20            [ 7]  712         ld      a,#' '
      000512 77               [ 7]  713         ld      (hl),a
      000513 19               [11]  714         add     hl,de
      000514 77               [ 7]  715         ld      (hl),a
      000515                        716 player_fell_down:
      000515 19               [11]  717         add     hl,de
      000516 19               [11]  718         add     hl,de
      000517 22 21 0B         [16]  719         ld      (MAN_HEAD),hl
      00051A 19               [11]  720         add     hl,de
      00051B 36 97            [10]  721         ld      (hl),#CHR_MAN_SLEEP
      00051D 23               [ 6]  722         inc     hl
      00051E 36 C9            [10]  723         ld      (hl),#CHR_MAN_SLEEP_HEAD
      000520 3E 08            [ 7]  724         ld      a,#DELAY_COUNTER2
      000522 32 24 0B         [13]  725         ld      (FAIL_DELAY),a
      000525 3A 1F 0B         [13]  726         ld      a,(cnt_fail_trap)
      000528 FE 05            [ 7]  727         cp      #MAX_FAIL_COUNTER
      00052A C8               [11]  728         ret     z
      00052B 3C               [ 4]  729         inc     a
      00052C 32 1F 0B         [13]  730         ld      (cnt_fail_trap),a
      00052F C9               [10]  731         ret
      000530                        732 check_level_finished:
      000530 2A 21 0B         [16]  733         ld      hl,(MAN_HEAD)
      000533 11 77 EC         [10]  734         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+(SCREEN_WIDTH-9)
      000536 A7               [ 4]  735         and     a
      000537 ED 52            [15]  736         sbc     hl,de
      000539 20 39            [12]  737         jr      nz,round_end
      00053B 3A 28 0B         [13]  738         ld      a,(LEVEL)
      00053E FE 08            [ 7]  739         cp      #MAX_LEVEL
      000540 28 01            [12]  740         jr      z,new_level_set
      000542 3C               [ 4]  741         inc     a
      000543                        742 new_level_set:
      000543 32 28 0B         [13]  743         ld      (LEVEL),a
      000546 21 6F EF         [10]  744         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+(15+ALIGN_MIDDLE)
      000549 22 21 0B         [16]  745         ld      (MAN_HEAD),hl
      00054C 3E 20            [ 7]  746         ld      a,#SCREEN_WIDTH
      00054E 36 CC            [10]  747         ld      (hl),#CHR_MAN_HEAD
      000550 85               [ 4]  748         add     a,l
      000551 6F               [ 4]  749         ld      l,a
      000552 36 A1            [10]  750         ld      (hl),#CHR_MAN_STAY
      000554 21 1F 0B         [10]  751         ld      hl,#cnt_fail_trap
      000557 3E 02            [ 7]  752         ld      a,#INITIAL_FAIL_COUNTER
      000559 77               [ 7]  753         ld      (hl),a
      00055A 21 20 0B         [10]  754         ld      hl,#cnt_fail_jump
      00055D 77               [ 7]  755         ld      (hl),a
      00055E 21 75 EC         [10]  756         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+(SCREEN_WIDTH-11)
      000561 36 F8            [10]  757         ld      (hl),#CHR_LINE_TOP
      000563 23               [ 6]  758         inc     hl
      000564 36 95            [10]  759         ld      (hl),#CHR_ARROW_RIGHT_TOP
      000566 23               [ 6]  760         inc     hl
      000567 36 20            [10]  761         ld      (hl),#' '
      000569 21 95 EC         [10]  762         ld      hl,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH++(SCREEN_WIDTH-11)
      00056C 36 9E            [10]  763         ld      (hl),#CHR_LINE_BOTTOM
      00056E 23               [ 6]  764         inc     hl
      00056F 36 93            [10]  765         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      000571 23               [ 6]  766         inc     hl
      000572 36 20            [10]  767         ld      (hl),#' '
      000574                        768 round_end:
      000574 13               [ 6]  769         inc     de
      000575 13               [ 6]  770         inc     de
      000576 2A 21 0B         [16]  771         ld      hl,(MAN_HEAD)
      000579 A7               [ 4]  772         and     a
      00057A ED 52            [15]  773         sbc     hl,de
      00057C 3E 0B            [ 7]  774         ld      a,#DELAY_COUNTER
      00057E C0               [11]  775         ret     nz
      00057F 32 24 0B         [13]  776         ld      (FAIL_DELAY),a
      000582 13               [ 6]  777         inc     de
      000583 ED 53 21 0B      [20]  778         ld      (MAN_HEAD),de
      000587 3E 20            [ 7]  779         ld      a,#' '
      000589 1B               [ 6]  780         dec     de
      00058A 12               [ 7]  781         ld      (de),a
      00058B 83               [ 4]  782         add     a,e
      00058C 5F               [ 4]  783         ld      e,a
      00058D 12               [ 7]  784         ld      (de),a
      00058E 6F               [ 4]  785         ld      l,a
      00058F 19               [11]  786         add     hl,de
      000590 36 97            [10]  787         ld      (hl),#CHR_MAN_SLEEP
      000592 23               [ 6]  788         inc     hl
      000593 36 C9            [10]  789         ld      (hl),#CHR_MAN_SLEEP_HEAD
      000595 C9               [10]  790         ret
      000596                        791 add_10_points:
      000496                        792         SET_CURSOR_DE 0 23+POSDIFF_POINTS
      000596 11 17 EC         [10]    1         ld      de,#BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS
      000599 ED 53 2B 00      [20]    2         ld      (CURSOR_POS),de
      00059D 2A 26 0B         [16]  793         ld      hl,(POINTS)
      0005A0 11 0A 00         [10]  794         ld      de,#10
      0005A3 19               [11]  795         add     hl,de
      0005A4 22 26 0B         [16]  796         ld      (POINTS),hl
      0005A7 CD B0 05         [17]  797         call    print_decimal
      0005AA 3E 20            [ 7]  798         ld      a,#' '
      0005AC 32 1C EC         [13]  799         ld      (BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS+5),a
      0005AF C9               [10]  800         ret
      0005B0                        801 print_decimal:
      0005B0 E5               [11]  802         push    hl
      0005B1 01 10 27         [10]  803         ld      bc,#10000
      0005B4 CD D6 05         [17]  804         call    get_decimal_digit
      0005B7 01 E8 03         [10]  805         ld      bc,#1000
      0005BA CD D6 05         [17]  806         call    get_decimal_digit
      0005BD 01 64 00         [10]  807         ld      bc,#100
      0005C0 CD D6 05         [17]  808         call    get_decimal_digit
      0005C3 01 0A 00         [10]  809         ld      bc,#10
      0005C6 CD D6 05         [17]  810         call    get_decimal_digit
      0005C9 01 01 00         [10]  811         ld      bc,#1
      0005CC CD D6 05         [17]  812         call    get_decimal_digit
      0004CF                        813         REMOVE_CURSOR;
      0005CF 2A 2B 00         [16]    1         ld      hl,(CURSOR_POS)
      0005D2 36 20            [10]    2         ld      (hl),#' '
      0005D4 E1               [10]  814         pop     hl
      0005D5 C9               [10]  815         ret
      0005D6                        816 get_decimal_digit:
      0005D6 AF               [ 4]  817         xor     a
      0005D7                        818 decimal_loop:
      0005D7 A7               [ 4]  819         and     a
      0005D8 ED 42            [15]  820         sbc     hl,bc
      0005DA 3C               [ 4]  821         inc     a
      0005DB D2 D7 05         [10]  822         jp      nc,decimal_loop
      0005DE 3D               [ 4]  823         dec     a
      0005DF 09               [11]  824         add     hl,bc
      0005E0 C6 30            [ 7]  825         add     a,#'0'
      0004E2                        826         OUTCH
      0005E2 E7               [11]    1         rst     0x20
      0005E3 00                       2         .db     0x00              ;OUTCH
      0005E4 C9               [10]  827         ret
      0005E5                        828 no_lives::
      0004E5                        829         PRST7
      0005E5 E7               [11]    1         rst     0x20
      0005E6 02                       2         .db     0x02              ;PRTST7
      0005E7 0C A0                  830         .db     0x0c,0xa0
      0005E9 21 CA 0B         [10]  831         ld      hl,#TXT_GAME_OVER
      0005EC 11 49 EC         [10]  832         ld      de,#POS_GAME_OVER
      0005EF 01 0F 00         [10]  833         ld      bc,#TXT_GAME_OVER_size
      0005F2 ED B0            [21]  834         ldir
      0005F4 0E 50            [ 7]  835         ld      c,#3*SCREEN_WIDTH-TXT_GAME_OVER_size-1+POSDIFF_YOUR_SCORE
      0005F6 7B               [ 4]  836         ld      a,e
      0005F7 81               [ 4]  837         add     a,c
      0005F8 5F               [ 4]  838         ld      e,a
      0005F9 0E 0C            [ 7]  839         ld      c,#TXT_YOUR_SCORE_size
      0005FB ED B0            [21]  840         ldir
      0005FD 0E 37            [ 7]  841         ld      c,#2*SCREEN_WIDTH-TXT_YOUR_SCORE_size+3
      0005FF 7B               [ 4]  842         ld      a,e
      000600 81               [ 4]  843         add     a,c
      000601 5F               [ 4]  844         ld      e,a
      000602 0E 09            [ 7]  845         ld      c,#TXT_HAZARD_size
      000604 ED B0            [21]  846         ldir
      000606 21 E0 ED         [10]  847         ld      hl,#BWS+15*SCREEN_WIDTH+0+(3*POSDIFF_YOUR_SCORE)
      000609 36 A0            [10]  848         ld      (hl),#CHR_MIDDLE_LINE
      00060B 11 E1 ED         [10]  849         ld      de,#BWS+15*SCREEN_WIDTH+1+(3*POSDIFF_YOUR_SCORE)
      00060E 0E 1F            [ 7]  850         ld      c,#SCREEN_WIDTH-1
      000610 ED B0            [21]  851         ldir
      000612 2A 26 0B         [16]  852         ld      hl,(POINTS)
      000515                        853         SET_CURSOR_DE (5-POSDIFF_YOUR_SCORE_DY) (21+ALIGN_MIDDLE)
      000615 11 B5 EC         [10]    1         ld      de,#BWS+(5-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+(21+ALIGN_MIDDLE)
      000618 ED 53 2B 00      [20]    2         ld      (CURSOR_POS),de
      00061C CD B0 05         [17]  854         call    print_decimal
      00061F 3A 28 0B         [13]  855         ld      a,(LEVEL)
      000622 C6 2F            [ 7]  856         add     a,#'0'-1
      000624 32 F7 EC         [13]  857         ld      (BWS+7*SCREEN_WIDTH+23+ALIGN_MIDDLE+3*POSDIFF_YOUR_SCORE),a
      000627 ED 5B AC 0B      [20]  858         ld      de,(HIGH_SCORE_TABLE01.points)
      00062B A7               [ 4]  859         and     a
      00062C ED 52            [15]  860         sbc     hl,de
      00062E D4 58 07         [17]  861         call    nc,draw_new_highscore_box
      000531                        862         SET_CURSOR_HL (17-POSDIFF_YOUR_SCORE_DY) (3+ALIGN_MIDDLE)
      000631 21 23 EE         [10]    1         ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+(3+ALIGN_MIDDLE)
      000634 22 2B 00         [16]    2         ld      (CURSOR_POS),hl
      000537                        863         PRST7
      000637 E7               [11]    1         rst     0x20
      000638 02                       2         .db     0x02              ;PRTST7
      000639 20 49 4E 50 55 54 20   864         .ascis ' INPUT YOUR INITIALS: __ '
             59 4F 55 52 20 49 4E
             49 54 49 41 4C 53 3A
             20 5F 5F A0
                                    865         ; remove 2xcursor
      000652                        866 input::
      000652 21 3C EE         [10]  867         ld      hl,#BWS+17*SCREEN_WIDTH+28
      000655 36 20            [10]  868         ld      (hl),#' '
      000657 21 01 EC         [10]  869         ld      hl,#BWS+0*SCREEN_WIDTH+1
      00065A 36 20            [10]  870         ld      (hl),#' '
      00065C 21 39 EE         [10]  871         ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+25+ALIGN_MIDDLE
      00055F                        872         CURSOR_DISABLE
      00055F                        873         INCH
      00065F E7               [11]    1         rst     0x20
      000660 01                       2         .db     0x01              ;INCH
      000661 77               [ 7]  874         ld      (hl),a
      000662 32 C8 0B         [13]  875         ld      (INITIALS),a
      000665 23               [ 6]  876         inc     hl
      000566                        877         INCH
      000666 E7               [11]    1         rst     0x20
      000667 01                       2         .db     0x01              ;INCH
      000668 77               [ 7]  878         ld      (hl),a
      000669 32 C9 0B         [13]  879         ld      (INITIALS+1),a
      00066C ED 5B 26 0B      [20]  880         ld      de,(POINTS)
      000670 06 05            [ 7]  881         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      000672 2A AC 0B         [16]  882         ld      hl,(HIGH_SCORE_TABLE01.points)
      000675 A7               [ 4]  883         and     a
      000676 ED 52            [15]  884         sbc     hl,de
      000678 DA 27 07         [10]  885         jp      c,insert_score
      00067B 05               [ 4]  886         dec     b
      00067C 2A B1 0B         [16]  887         ld      hl,(HIGH_SCORE_TABLE02.points)
      00067F A7               [ 4]  888         and     a
      000680 ED 52            [15]  889         sbc     hl,de
      000682 DA 27 07         [10]  890         jp      c,insert_score
      000685 05               [ 4]  891         dec     b
      000686 2A B6 0B         [16]  892         ld      hl,(HIGH_SCORE_TABLE03.points)
      000689 A7               [ 4]  893         and     a
      00068A ED 52            [15]  894         sbc     hl,de
      00068C DA 27 07         [10]  895         jp      c,insert_score
      00068F 05               [ 4]  896         dec     b
      000690 2A BB 0B         [16]  897         ld      hl,(HIGH_SCORE_TABLE04.points)
      000693 A7               [ 4]  898         and     a
      000694 ED 52            [15]  899         sbc     hl,de
      000696 DA 27 07         [10]  900         jp      c,insert_score
      000699 05               [ 4]  901         dec     b
      00069A 2A C0 0B         [16]  902         ld      hl,(HIGH_SCORE_TABLE05.points)
      00069D A7               [ 4]  903         and     a
      00069E ED 52            [15]  904         sbc     hl,de
      0006A0 DA 27 07         [10]  905         jp      c,insert_score
      0006A3                        906 print_highscore_table::
      0006A3 06 05            [ 7]  907         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      0006A5 11 AA 0B         [10]  908         ld      de,#HIGH_SCORE_TABLE01
      0006A8 21 86 EE         [10]  909         ld      hl,#BWS+(20-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+6+ALIGN_MIDDLE
      0006AB                        910 print_highscore_entry:
      0006AB 3E 36            [ 7]  911         ld      a,#'6'
      0006AD 90               [ 4]  912         sub     b
      0006AE 77               [ 7]  913         ld      (hl),a
      0006AF 1A               [ 7]  914         ld      a,(de)
      0006B0 23               [ 6]  915         inc     hl
      0006B1 23               [ 6]  916         inc     hl
      0006B2 23               [ 6]  917         inc     hl
      0006B3 77               [ 7]  918         ld      (hl),a
      0006B4 23               [ 6]  919         inc     hl
      0006B5 13               [ 6]  920         inc     de
      0006B6 1A               [ 7]  921         ld      a,(de)
      0006B7 77               [ 7]  922         ld      (hl),a
      0006B8 3E 2E            [ 7]  923         ld      a,#'.'
      0006BA 23               [ 6]  924         inc     hl
      0006BB 23               [ 6]  925         inc     hl
      0006BC 77               [ 7]  926         ld      (hl),a
      0006BD 23               [ 6]  927         inc     hl
      0006BE 77               [ 7]  928         ld      (hl),a
      0006BF 23               [ 6]  929         inc     hl
      0006C0 77               [ 7]  930         ld      (hl),a
      0006C1 23               [ 6]  931         inc     hl
      0006C2 23               [ 6]  932         inc     hl
      0005C3                        933         SET_CURSOR
      0006C3 22 2B 00         [16]    1         ld      (CURSOR_POS),hl
      0006C6 13               [ 6]  934         inc     de
      0006C7 1A               [ 7]  935         ld      a,(de)
      0006C8 6F               [ 4]  936         ld      l,a
      0006C9 13               [ 6]  937         inc     de
      0006CA 1A               [ 7]  938         ld      a,(de)
      0006CB 67               [ 4]  939         ld      h,a
      0006CC 13               [ 6]  940         inc     de
      0006CD C5               [11]  941         push    bc
      0006CE D5               [11]  942         push    de
      0006CF CD B0 05         [17]  943         call    print_decimal
      0006D2 D1               [10]  944         pop     de
      0006D3 C1               [10]  945         pop     bc
      0005D4                        946         REMOVE_CURSOR
      0006D4 2A 2B 00         [16]    1         ld      hl,(CURSOR_POS)
      0006D7 36 20            [10]    2         ld      (hl),#' '
      0006D9 23               [ 6]  947         inc     hl
      0006DA 23               [ 6]  948         inc     hl
      0006DB 23               [ 6]  949         inc     hl
      0006DC 36 30            [10]  950         ld      (hl),#'0'
      0006DE 23               [ 6]  951         inc     hl
      0006DF 1A               [ 7]  952         ld      a,(de)
      0006E0 C6 2F            [ 7]  953         add     a,#'0'-1
      0006E2 77               [ 7]  954         ld      (hl),a
      0006E3 13               [ 6]  955         inc     de
      0006E4 3E 0D            [ 7]  956         ld      a,#SCREEN_WIDTH-19
      0006E6 85               [ 4]  957         add     a,l
      0006E7 6F               [ 4]  958         ld      l,a
      0006E8 3E 00            [ 7]  959         ld      a,#ZERO
      0006EA 8C               [ 4]  960         adc     a,h
      0006EB 67               [ 4]  961         ld      h,a
      0006EC 10 BD            [13]  962         djnz    print_highscore_entry
      0005EE                        963         SET_CURSOR_HL (29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY) (9+ALIGN_MIDDLE)
      0006EE 21 A9 EF         [10]    1         ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+(9+ALIGN_MIDDLE)
      0006F1 22 2B 00         [16]    2         ld      (CURSOR_POS),hl
      0005F4                        964         PRST7
      0006F4 E7               [11]    1         rst     0x20
      0006F5 02                       2         .db     0x02              ;PRTST7
      0006F6 4E 45 57 20 47 41 4D   965         .ascii  'NEW GAME ? Y/N'
             45 20 3F 20 59 2F 4E
      000704 A0                     966         .db     0xa0
      000705 21 B8 EF         [10]  967         ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000708 36 20            [10]  968         ld      (hl),#' '
      00070A                        969         CURSOR_DISABLE
      00070A                        970 m_070a:
      00060A                        971 ask_exit_game:
      00060A                        972         INCH
      00070A E7               [11]    1         rst     0x20
      00070B 01                       2         .db     0x01              ;INCH
      00070C FE 59            [ 7]  973         cp      #'Y'
      00070E CA 81 01         [10]  974         jp      z,new_game
      000711 FE 4E            [ 7]  975         cp      #'N'
      000713 20 F5            [12]  976         jr      nz,ask_exit_game
      000715                        977 exit_game:
      000615                        978         PRST7
      000715 E7               [11]    1         rst     0x20
      000716 02                       2         .db     0x02              ;PRTST7
      000717 0C                     979         .db     0x0c
      000718 4A 75 6D 70 69 6E 67   980         .ascii  'Jumping Jack'
             20 4A 61 63 6B
      000724 0D 8D                  981         .db     0x0d,0x8d
      000626                        982         END_PROGRAM
      000726 FF               [11]    1         rst     0x38
      000727                        983 insert_score:
      000727 D5               [11]  984         push    de
      000728 11 C3 0B         [10]  985         ld      de,#HIGH_SCORE_TABLE_TMP
      00072B 21 BE 0B         [10]  986         ld      hl,#HIGH_SCORE_TABLE05
      00072E                        987 move_table_entry:
      00072E C5               [11]  988         push    bc
      00072F 01 05 00         [10]  989         ld      bc,#HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05
      000732 ED B0            [21]  990         ldir
      000734 EB               [ 4]  991         ex      de,hl
      000735 0E 0A            [ 7]  992         ld      c,#2*(HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05)
      000737 A7               [ 4]  993         and     a
      000738 ED 42            [15]  994         sbc     hl,bc
      00073A EB               [ 4]  995         ex      de,hl
      00073B A7               [ 4]  996         and     a
      00073C ED 42            [15]  997         sbc     hl,bc
      00073E C1               [10]  998         pop     bc
      00073F 10 ED            [13]  999         djnz    move_table_entry
      000741 3A C8 0B         [13] 1000         ld      a,(INITIALS)
      000744 12               [ 7] 1001         ld      (de),a
      000745 13               [ 6] 1002         inc     de
      000746 3A C9 0B         [13] 1003         ld      a,(INITIALS+1)
      000749 12               [ 7] 1004         ld      (de),a
      00074A EB               [ 4] 1005         ex      de,hl
      00074B D1               [10] 1006         pop     de
      00074C 23               [ 6] 1007         inc     hl
      00074D 73               [ 7] 1008         ld      (hl),e
      00074E 23               [ 6] 1009         inc     hl
      00074F 72               [ 7] 1010         ld      (hl),d
      000750 23               [ 6] 1011         inc     hl
      000751 3A 28 0B         [13] 1012         ld      a,(LEVEL)
      000754 77               [ 7] 1013         ld      (hl),a
      000755 C3 A3 06         [10] 1014         jp      print_highscore_table
      000758                       1015 draw_new_highscore_box:
      000758 21 27 ED         [10] 1016         ld      hl,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      00075B 36 2A            [10] 1017         ld      (hl),#'*'
      00075D 11 28 ED         [10] 1018         ld      de,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+8+ALIGN_MIDDLE
      000760 01 11 00         [10] 1019         ld      bc,#TXT_NEW_HIGH_SCORE_size-1
      000763 ED B0            [21] 1020         ldir
      000765 0E 6F            [ 7] 1021         ld      c,#4*SCREEN_WIDTH-TXT_NEW_HIGH_SCORE_size+1
      000767 09               [11] 1022         add     hl,bc
      000768 EB               [ 4] 1023         ex      de,hl
      000769 09               [11] 1024         add     hl,bc
      00076A EB               [ 4] 1025         ex      de,hl
      00076B 0E 11            [ 7] 1026         ld      c,#TXT_NEW_HIGH_SCORE_size-1
      00076D 36 2A            [10] 1027         ld      (hl),#'*'
      00076F ED B0            [21] 1028         ldir
      000771 11 67 ED         [10] 1029         ld      de,#BWS+(11-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      000774 21 EE 0B         [10] 1030         ld      hl,#TXT_NEW_HIGH_SCORE
      000777 0E 12            [ 7] 1031         ld      c,#TXT_NEW_HIGH_SCORE_size
      000779 ED B0            [21] 1032         ldir
      00077B 1E 47            [ 7] 1033         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      00077D 3E 2A            [ 7] 1034         ld      a,#'*'
      00077F 12               [ 7] 1035         ld      (de),a
      000780 1E 58            [ 7] 1036         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000782 12               [ 7] 1037         ld      (de),a
      000783 1E 87            [ 7] 1038         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      000785 12               [ 7] 1039         ld      (de),a
      000786 1E 98            [ 7] 1040         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000788 12               [ 7] 1041         ld      (de),a
      000789 C9               [10] 1042         ret
      00078A                       1043 TOP_IMAGE:
                                   1044         ; line 1
      00068A                       1045         SCREEN_POS
      00078A AE 9E 9E 9E 9E 9E 9E  1046         .db     0xae,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e ;........
             9E
      000792 9E 9E AD 20 20 20 20  1047         .db     0x9e,0x9e,0xad,0x20,0x20,0x20,0x20,0x20 ;..-     
             20
      00079A 20 20 20 20 20 20 20  1048         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0007A2 20 20 20 20 20 20 20  1049         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0006AA                       1050         SCREEN_POS
                                   1051         
                                   1052         ; line 2
      0006AA                       1053         SCREEN_POS
      0007AA 9F B9 B6 B3 B2 B6 B8  1054         .db     0x9f,0xb9,0xb6,0xb3,0xb2,0xb6,0xb8,0x20 ;.963268 
             20
      0007B2 BD B0 C0 20 20 20 20  1055         .db     0xbd,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;=0@     
             20
      0007BA 20 20 20 20 20 20 20  1056         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      0007C2 20 20 20 20 20 20 20  1057         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0006CA                       1058         SCREEN_POS
                                   1059 
                                   1060         ; line 3
      0006CA                       1061         SCREEN_POS
      0007CA 9F B8 B7 20 B5 20 20  1062         .db     0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
             20
      0007D2 B5 20 C0 20 20 20 20  1063         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      0007DA 20 20 20 20 20 20 20  1064         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      0007E2 20 20 20 20 B7 B7 20  1065         .db     0x20,0x20,0x20,0x20,0xb7,0xb7,0x20,0x20 ;    77  
             20
      0006EA                       1066         SCREEN_POS
                                   1067 
                                   1068         ; line 4
      0006EA                       1069         SCREEN_POS
      0007EA 9F B3 20 B4 B5 20 B2  1070         .db     0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
             20
      0007F2 B5 20 C0 20 20 20 20  1071         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      0007FA 20 20 20 20 20 20 20  1072         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000802 B6 B7 20 B9 B2 B2 B8  1073         .db     0xb6,0xb7,0x20,0xb9,0xb2,0xb2,0xb8,0x20 ;67 9228 
             20
      00070A                       1074         SCREEN_POS
                                   1075 
                                   1076         ; line 5
      00070A                       1077         SCREEN_POS
      00080A 9F B1 B6 20 20 B6 B0  1078         .db     0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
             20
      000812 B6 B0 C0 20 20 20 20  1079         .db     0xb6,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;60@     
             20
      00081A 20 20 B2 B3 20 20 20  1080         .db     0x20,0x20,0xb2,0xb3,0x20,0x20,0x20,0x20 ;  23    
             20
      000822 20 BA A0 B4 B4 A0 B5  1081         .db     0x20,0xba,0xa0,0xb4,0xb4,0xa0,0xb5,0x20 ; : 44 5 
             20
      00072A                       1082         SCREEN_POS
                                   1083 
                                   1084         ; line 6
      00072A                       1085         SCREEN_POS
      00082A 9F 70 72 65 73 65 6E  1086         .db     0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
             74
      000832 73 3A C0 20 20 20 20  1087         .db     0x73,0x3a,0xc0,0x20,0x20,0x20,0x20,0x20 ;s:@     
             20
      00083A 20 B2 B0 B1 B3 20 20  1088         .db     0x20,0xb2,0xb0,0xb1,0xb3,0x20,0x20,0xb7 ; 2013  7
             B7
      000842 B6 B1 B3 B8 B1 B1 B9  1089         .db     0xb6,0xb1,0xb3,0xb8,0xb1,0xb1,0xb9,0x20 ;6138119 
             20
      00074A                       1090         SCREEN_POS
                                   1091 
                                   1092         ; line 7
      00074A                       1093         SCREEN_POS
      00084A AB F8 F8 F8 F8 F8 F8  1094         .db     0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
             F8
      000852 F8 F8 AC 20 20 20 20  1095         .db     0xf8,0xf8,0xac,0x20,0x20,0x20,0x20,0x20 ;xx,     
             20
      00085A 20 B0 20 20 B5 B7 B6  1096         .db     0x20,0xb0,0x20,0x20,0xb5,0xb7,0xb6,0x20 ; 0  576 
             20
      000862 20 20 B1 B3 B6 BC 20  1097         .db     0x20,0x20,0xb1,0xb3,0xb6,0xbc,0x20,0x20 ;  136<  
             20
      00076A                       1098         SCREEN_POS
                                   1099 
                                   1100         ; line 8
      00076A                       1101         SCREEN_POS
      00086A 20 20 20 20 20 20 20  1102         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000872 20 20 20 20 20 20 20  1103         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00087A B1 B6 B6 B6 B6 20 20  1104         .db     0xb1,0xb6,0xb6,0xb6,0xb6,0x20,0x20,0x20 ;16666   
             20
      000882 20 20 20 B1 B9 20 20  1105         .db     0x20,0x20,0x20,0xb1,0xb9,0x20,0x20,0x20 ;   19   
             20
      00078A                       1106          SCREEN_POS
                                   1107 
                                   1108         ; line 9
      00078A                       1109         Z1013_LINE
      00088A 20 20 20 20 20 20 20     1         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000892 20 20 20 20 20 20 20     2         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00089A 20 20 20 20 20 20 20     3         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008A2 20 20 20 20 20 20 20     4         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
                                   1110 
                                   1111         ; line 10
      0007AA                       1112         Z1013_LINE
      0008AA 20 20 20 20 20 20 20     1         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008B2 20 20 20 20 20 20 20     2         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008BA 20 20 20 20 20 20 20     3         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008C2 20 20 20 20 20 20 20     4         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
                                   1113 
                                   1114         ; line 11
      0007CA                       1115         SCREEN_POS
      0008CA 20 20 20 20 20 20 20  1116         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008D2 20 20 20 20 20 20 20  1117         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008DA 20 20 20 20 20 20 20  1118         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008E2 20 20 20 20 20 20 20  1119         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0007EA                       1120          SCREEN_POS
                                   1121 
                                   1122         ; line 12
      0007EA                       1123         SCREEN_POS
      0008EA 20 20 20 B4 20 20 20  1124         .db     0x20,0x20,0x20,0xb4,0x20,0x20,0x20,0x20 ;   4    
             20
      0008F2 20 20 20 20 B0 20 20  1125         .db     0x20,0x20,0x20,0x20,0xb0,0x20,0x20,0x20 ;    0   
             20
      0008FA 20 20 20 20 20 20 B4  1126         .db     0x20,0x20,0x20,0x20,0x20,0x20,0xb4,0x20 ;      4 
             20
      000902 20 20 20 20 B4 B2 20  1127         .db     0x20,0x20,0x20,0x20,0xb4,0xb2,0x20,0x20 ;    42  
             20
      00080A                       1128          SCREEN_POS
                                   1129 
                                   1130         ; line 13
      00080A                       1131         SCREEN_POS
      00090A 20 20 20 B4 B4 B5 B5  1132         .db     0x20,0x20,0x20,0xb4,0xb4,0xb5,0xb5,0xbd ;   4455=
             BD
      000912 BD B5 B6 B3 B4 BC BD  1133         .db     0xbd,0xb5,0xb6,0xb3,0xb4,0xbc,0xbd,0xb2 ;=5634<=2
             B2
      00091A B6 B3 20 20 20 20 B4  1134         .db     0xb6,0xb3,0x20,0x20,0x20,0x20,0xb4,0xb1 ;63    41
             B1
      000922 B8 B2 B6 B3 BB B0 20  1135         .db     0xb8,0xb2,0xb6,0xb3,0xbb,0xb0,0x20,0x20 ;8263;0  
             20
      00082A                       1136          SCREEN_POS
                                   1137 
                                   1138         ; line 14
      00082A                       1139         SCREEN_POS
      00092A 20 B3 20 B4 B4 B5 B5  1140         .db     0x20,0xb3,0x20,0xb4,0xb4,0xb5,0xb5,0xb5 ; 3 44555
             B5
      000932 B5 B5 B7 B0 B4 B4 B5  1141         .db     0xb5,0xb5,0xb7,0xb0,0xb4,0xb4,0xb5,0xb1 ;55704451
             B1
      00093A B7 B4 20 20 B3 20 B4  1142         .db     0xb7,0xb4,0x20,0x20,0xb3,0x20,0xb4,0xb9 ;74  3 49
             B9
      000942 BD B5 20 B3 B4 B8 20  1143         .db     0xbd,0xb5,0x20,0xb3,0xb4,0xb8,0x20,0x20 ;=5 348  
             20
      00084A                       1144          SCREEN_POS
                                   1145 
                                   1146         ; line 15
      00084A                       1147         SCREEN_POS
      00094A 20 B8 B7 B0 B1 B0 B1  1148         .db     0x20,0xb8,0xb7,0xb0,0xb1,0xb0,0xb1,0xb1 ; 8701011
             B1
      000952 B1 B5 20 20 B0 B0 B1  1149         .db     0xb1,0xb5,0x20,0x20,0xb0,0xb0,0xb1,0xb1 ;15  0011
             B1
      00095A B7 B0 20 20 B8 B7 B0  1150         .db     0xb7,0xb0,0x20,0x20,0xb8,0xb7,0xb0,0xb1 ;70  8701
             B1
      000962 B6 20 B6 20 B0 20 B0  1151         .db     0xb6,0x20,0xb6,0x20,0xb0,0x20,0xb0,0x20 ;6 6 0 0 
             20
      00086A                       1152          SCREEN_POS
                                   1153 
                                   1154         ; line 16
      00086A                       1155         SCREEN_POS
      00096A 20 20 20 20 20 20 20  1156         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000972 20 20 20 20 20 20 20  1157         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00097A 20 20 20 20 20 20 20  1158         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000982 20 20 20 20 20 20 20  1159         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00098A                       1160         SCREEN_POS
                                   1161 
      00088A                       1162 HINT_RIGHT:
      00098A 2D 3E 20 2E 2E 2E 20  1163         .db     0x2d,0x3e,0x20,0x2e,0x2e,0x2e,0x20,0x52 ;-> ... R
             52
      000992 69 67 68 74           1164         .db     0x69,0x67,0x68,0x74                     ;ight
      000996                       1165 HINT_LEFT:
      000996 3C 2D 20 2E 2E 2E 2E  1166         .db     0x3c,0x2d,0x20,0x2e,0x2e,0x2e,0x2e,0x20 ;<- .... 
             20
      00099E 4C 65 66 74           1167         .db     0x4c,0x65,0x66,0x74                     ;Left
      0009A2                       1168 HINT_JUMP:
      0009A2 53 50 20 2E 2E 2E 2E  1169         .ascii  'SP .... Jump'
             20 4A 75 6D 70
      0009AE                       1170 HINT_PLAY:
      0009AE 50 20 2E 2E 2E 2E 2E  1171         .ascii  'P ..... Play'
             20 50 6C 61 79
      0009BA                       1172 HINT_EXIT:
      0009BA 45 20 2E 2E 2E 2E 2E  1173         .ascii  'E ..... Exit'
             20 45 78 69 74
      0009C6                       1174 HINT_COPYRIGHT:
      0009C6 43 20 31 39 38 36 20  1175         .ascii  'C 1986 Software Center Ilmenau'
             53 6F 66 74 77 61 72
             65 20 43 65 6E 74 65
             72 20 49 6C 6D 65 6E
             61 75
      0009E4                       1176 HINT_NAME:
      0009E4 47 2E 46 69 73 63 68  1177         .ascii  'G.Fischer & CO'
             65 72 20 26 20 43 4F
      0009F2                       1178 HINT_YEAR:
      0009F2 20 20 32 30 32 30 20  1179         .ascii  '  2020 Version'
             56 65 72 73 69 6F 6E
      000A00                       1180 VERSION_INFO:
      000A00 20 31 2E 31 20        1181         .db     0x20,0x31,0x2e,0x31,0x20                ; 1.1 
      000A05                       1182 LINE_BUFFER:
      000A05 EE EE EE EE EE EE EE  1183         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A0D EE EE EE EE EE EE EE  1184         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A15 EE EE EE EE EE EE EE  1185         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A1D EE EE EE EE EE EE EE  1186         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A25 EE EE EE EE EE EE EE  1187         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A2D EE EE EE EE EE EE EE  1188         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A35 EE EE EE EE EE EE EE  1189         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A3D EE EE EE EE EE EE EE  1190         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A45 20 20 20 EE EE EE EE  1191         .db     0x20,0x20,0x20,0xee,0xee,0xee,0xee,0xee ;   nnnnn
             EE
      000A4D EE EE EE EE EE EE EE  1192         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A55 EE EE EE EE EE 20 20  1193         .db     0xee,0xee,0xee,0xee,0xee,0x20,0x20,0x20 ;nnnnn   
             20
      000A5D 20 20 EE EE EE EE EE  1194         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000A65 EE EE EE EE EE EE EE  1195         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A6D EE 20 20 20 EE EE EE  1196         .db     0xee,0x20,0x20,0x20,0xee,0xee,0xee,0xee ;n   nnnn
             EE
      000A75 EE EE EE EE EE EE EE  1197         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A7D EE EE EE 20 20 20 EE  1198         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000A85 EE EE EE EE EE EE EE  1199         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A8D EE EE EE EE 20 20 20  1200         .db     0xee,0xee,0xee,0xee,0x20,0x20,0x20,0xee ;nnnn   n
             EE
      000A95 EE EE EE EE EE EE EE  1201         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0x20 ;nnnnnnn 
             20
      000A9D 20 20 EE EE EE EE EE  1202         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000AA5 EE EE EE 20 20 20 EE  1203         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000AAD EE EE EE EE EE EE EE  1204         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AB5 EE EE EE EE EE EE EE  1205         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000ABD EE EE EE EE EE EE EE  1206         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AC5 EE EE EE 20 20 20 EE  1207         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000ACD EE EE EE EE EE EE EE  1208         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AD5 EE EE EE EE EE EE EE  1209         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000ADD EE EE EE EE EE EE 20  1210         .db     0xee,0xee,0xee,0xee,0xee,0xee,0x20,0x20 ;nnnnnn  
             20
      000AE5 20 EE EE EE EE EE EE  1211         .db     0x20,0xee,0xee,0xee,0xee,0xee,0xee,0xee ; nnnnnnn
             EE
      000AED EE EE EE EE EE EE EE  1212         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AF5 EE EE EE EE EE EE EE  1213         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AFD EE EE EE EE EE EE EE  1214         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000B05 EE EE EE EE EE EE EE  1215         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000B0D EE EE EE EE EE EE EE  1216         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee      ;nnnnnnn
                                   1217 ; unchecked data source
      000B14 EE                    1218         .db     0xee                                    ;n
      000B15                       1219 OFFSET_HOLES:
      000B15 58 7C 41 98 56        1220         .db     0x58,0x7c,0x41,0x98,0x56                ;X|A.V
      000B1A                       1221 OFFSET_HOLES_JUMP_PENALTY:
      000B1A 8B A2 68 C2 DD        1222         .db     0x8b,0xa2,0x68,0xc2,0xdd                ;."hB]
      000B1F                       1223 cnt_fail_trap:
      000B1F 05                    1224         .db     5
      000B20                       1225 cnt_fail_jump:
      000B20 05                    1226         .db     5
      000B21                       1227 MAN_HEAD:
      000B21 6E EF                 1228         .dw     BWS+(GAME_START_Y+(8-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      000B23                       1229 JUMP_DELAY:
      000B23 01                    1230         .db     1
      000B24                       1231 FAIL_DELAY:
      000B24 01                    1232         .db     1
      000B25                       1233 LIVES:
      000B25 06                    1234         .db     6
      000B26                       1235 POINTS:
      000B26 00 00                 1236         .dw     0
      000B28                       1237 LEVEL:
      000B28 01                    1238         .db     1
      000B29                       1239 counter:
      000B29 01                    1240         .db     1
      000B2A                       1241 TXT_JUMP:
      000B2A 2A 20 4A 55 4D 50 49  1242         .ascii  '* JUMPING JACK *'
             4E 47 20 4A 41 43 4B
             20 2A
      000B3A                       1243 MONSTER_PTR:
      000B3A 9F ED                 1244         .dw     BWS+(GAME_START_Y+3*3+1)*SCREEN_WIDTH-1
      000B3C E0 ED                 1245         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+0
      000B3E E1 ED                 1246         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000B40 E2 ED                 1247         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
                                   1248 
      000B42 CD EC                 1249         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
      000B44 CE EC                 1250         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+14
      000B46 CF EC                 1251         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+15
      000B48 D0 EC                 1252         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+16
                                   1253 
      000B4A E1 ED                 1254         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000B4C E2 ED                 1255         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
      000B4E E3 ED                 1256         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+3
      000B50 E4 ED                 1257         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+4
                                   1258 
      000B52 19 EF                 1259         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+25
      000B54 1A EF                 1260         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+26
      000B56 1B EF                 1261         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+27
      000B58 1C EF                 1262         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+28
                                   1263 
      000B5A CA EC                 1264         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+10
      000B5C CB EC                 1265         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+11
      000B5E CC EC                 1266         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+12
      000B60 CD EC                 1267         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
                                   1268 
      000B62 0B EF                 1269         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+11
      000B64 0C EF                 1270         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+12
      000B66 0D EF                 1271         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+13
      000B68 0E EF                 1272         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14
                                   1273 
      000B6A 15 EF                 1274         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+21
      000B6C 16 EF                 1275         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+22
      000B6E 17 EF                 1276         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+23
      000B70 18 EF                 1277         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+24
      000B72                       1278 MONSTER_IMG:
      000B72 94 90 8B 90 8B 91 97  1279         .db     0x94,0x90,0x8b,0x90,0x8b,0x91,0x97,0x91 ;........
             91
      000B7A 19 B5 20 BE 20 BF 20  1280         .db     0x19,0xb5,0x20,0xbe,0x20,0xbf,0x20,0xae ;.5 > ? .
             AE
      000B82 92 96 A0 A0 A0 A0 88  1281         .db     0x92,0x96,0xa0,0xa0,0xa0,0xa0,0x88,0xc1 ;..    .A
             C1
      000B8A 20 95 20 B7 1E FF 20  1282         .db     0x20,0x95,0x20,0xb7,0x1e,0xff,0x20,0x92 ; . 7.. .
             92
      000B92 17 8C F9 8C 1D 1F FC  1283         .db     0x17,0x8c,0xf9,0x8c,0x1d,0x1f,0xfc,0x8c ;..y...|.
             8C
      000B9A 92 96 83 82 95 93 20  1284         .db     0x92,0x96,0x83,0x82,0x95,0x93,0x20,0x20 ;......  
             20
      000BA2 20 20 20 20 20 20 20  1285         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000BAA                       1286 HIGH_SCORE_TABLE01:
      000BAA 5F 5F                 1287         .ascii '__'
      000BAC                       1288 HIGH_SCORE_TABLE01.points:
      000BAC 00 00                 1289         .dw     0
      000BAE                       1290 HIGH_SCORE_TABLE01.level:
      000BAE 01                    1291         .db     1
      000BAF                       1292 HIGH_SCORE_TABLE02:
      000BAF 5F 5F                 1293         .ascii '__'
      000BB1                       1294 HIGH_SCORE_TABLE02.points:
      000BB1 00 00                 1295         .dw     0
      000BB3                       1296 HIGH_SCORE_TABLE02.level:
      000BB3 01                    1297         .db     1
      000BB4                       1298 HIGH_SCORE_TABLE03:
      000BB4 5F 5F                 1299         .ascii '__'
      000BB6                       1300 HIGH_SCORE_TABLE03.points:
      000BB6 00 00                 1301         .dw     0
      000BB8                       1302 HIGH_SCORE_TABLE03.level:
      000BB8 01                    1303         .db     1
      000BB9                       1304 HIGH_SCORE_TABLE04:
      000BB9 5F 5F                 1305         .ascii '__'
      000BBB                       1306 HIGH_SCORE_TABLE04.points:
      000BBB 00 00                 1307         .dw     0
      000BBD                       1308 HIGH_SCORE_TABLE04.level:
      000BBD 01                    1309         .db     1
      000BBE                       1310 HIGH_SCORE_TABLE05:
      000BBE 5F 5F                 1311         .ascii '__'
      000BC0                       1312 HIGH_SCORE_TABLE05.points:
      000BC0 00 00                 1313         .dw     0
      000BC2                       1314 HIGH_SCORE_TABLE05.level:
      000BC2 01                    1315         .db     1
      000BC3                       1316 HIGH_SCORE_TABLE_TMP:
      000BC3 5F 5F                 1317         .ascii '__'
      000BC5                       1318 HIGH_SCORE_TABLE_TMP.points:
      000BC5 00 00                 1319         .dw     0
      000BC7                       1320 HIGH_SCORE_TABLE_TMP.level:
      000BC7 01                    1321         .db     1
      000BC8                       1322 INITIALS:
      000BC8 5F 5F                 1323         .ascii '__'
      000BCA                       1324 TXT_GAME_OVER:
      000BCA 2A 2A 20 47 41 4D 45  1325         .ascii  '** GAME OVER **'
             20 4F 56 45 52 20 2A
             2A
      000BD9                       1326 TXT_YOUR_SCORE:
      000BD9 59 4F 55 52 20 53 43  1327         .ascii  'YOUR SCORE :'
             4F 52 45 20 3A
      000BE5                       1328 TXT_HAZARD:
      000BE5 48 41 5A 41 52 44 53  1329         .ascii  'HAZARDS :'
             20 3A
      000BEE                       1330 TXT_NEW_HIGH_SCORE:
      000BEE 2A 20 4E 45 57 20 48  1331         .ascii  '* NEW HIGH SCORE *'
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
    ALIGN_MIDDLE                                                =  000000 G
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
    CURSOR_POS                                                  =  00002B G
    DELAY_COUNTER                                               =  00000B G
    DELAY_COUNTER2                                              =  000008 G
    DELAY_COUNTER_JUMP                                          =  000004 G
  0 FAIL_DELAY                                                     000A24 GR
    GAMES_LINES                                                 =  000008 G
    GAME_START_Y                                                =  000003 G
  0 HIGH_SCORE_TABLE01                                             000AAA GR
  0 HIGH_SCORE_TABLE01.level                                       000AAE GR
  0 HIGH_SCORE_TABLE01.points                                      000AAC GR
    HIGH_SCORE_TABLE01_size                                     =  000002 G
  0 HIGH_SCORE_TABLE02                                             000AAF GR
  0 HIGH_SCORE_TABLE02.level                                       000AB3 GR
  0 HIGH_SCORE_TABLE02.points                                      000AB1 GR
    HIGH_SCORE_TABLE02_size                                     =  000002 G
  0 HIGH_SCORE_TABLE03                                             000AB4 GR
  0 HIGH_SCORE_TABLE03.level                                       000AB8 GR
  0 HIGH_SCORE_TABLE03.points                                      000AB6 GR
    HIGH_SCORE_TABLE03_size                                     =  000002 G
  0 HIGH_SCORE_TABLE04                                             000AB9 GR
  0 HIGH_SCORE_TABLE04.level                                       000ABD GR
  0 HIGH_SCORE_TABLE04.points                                      000ABB GR
    HIGH_SCORE_TABLE04_size                                     =  000002 G
  0 HIGH_SCORE_TABLE05                                             000ABE GR
  0 HIGH_SCORE_TABLE05.level                                       000AC2 GR
  0 HIGH_SCORE_TABLE05.points                                      000AC0 GR
    HIGH_SCORE_TABLE05_size                                     =  000002 G
  0 HIGH_SCORE_TABLE_TMP                                           000AC3 GR
  0 HIGH_SCORE_TABLE_TMP.level                                     000AC7 GR
  0 HIGH_SCORE_TABLE_TMP.points                                    000AC5 GR
    HIGH_SCORE_TABLE_TMP_size                                   =  000002 G
  0 HINT_COPYRIGHT                                                 0008C6 GR
    HINT_COPYRIGHT_size                                         =  00001E G
  0 HINT_EXIT                                                      0008BA GR
    HINT_EXIT_size                                              =  00000C G
  0 HINT_JUMP                                                      0008A2 GR
    HINT_JUMP_size                                              =  00000C G
  0 HINT_LEFT                                                      000896 GR
    HINT_LEFT_size                                              =  00000C G
  0 HINT_NAME                                                      0008E4 GR
    HINT_NAME_size                                              =  00000E G
  0 HINT_PLAY                                                      0008AE GR
    HINT_PLAY_size                                              =  00000C G
  0 HINT_RIGHT                                                     00088A GR
    HINT_RIGHT_size                                             =  00000C G
  0 HINT_YEAR                                                      0008F2 GR
    HINT_YEAR_size                                              =  00000E G
    HI_ZERO                                                     =  000000 G
  0 INITIALS                                                       000AC8 GR
    INITIALS_size                                               =  000002 G
    INITIAL_DELAY_COUNTER                                       =  000001 G
    INITIAL_FAIL_COUNTER                                        =  000002 G
    INITIAL_LEVEL                                               =  000001 G
    INITIAL_LIVES                                               =  000006 G
  0 JUMP_DELAY                                                     000A23 GR
    KEY_CODE                                                    =  000004 G
  0 LEVEL                                                          000A28 GR
    LEVEL_1                                                     =  000001 G
  0 LINE_BUFFER                                                    000905 GR
    LINE_BUFFER_size                                            =  00010F G
  0 LIVES                                                          000A25 GR
  0 MAN_HEAD                                                       000A21 GR
    MAX_FAIL_COUNTER                                            =  000005 G
    MAX_LEVEL                                                   =  000008 G
    MENU_TOP                                                    =  000014 G
    MONSTER_CORRECTION                                          =  000000 G
  0 MONSTER_IMG                                                    000A72 GR
    MONSTER_IMG_size                                            =  000038 G
  0 MONSTER_PTR                                                    000A3A GR
    MONSTER_PTR_size                                            =  000038 G
    MONSTER_WIDTH                                               =  000004 G
    MOVE_2X_RIGHT                                               =  000002 G
    NUMBER_HIGHSCORE_ENTRIES                                    =  000005 G
    NUMBER_OF_LINES                                             =  000008 G
  0 OFFSET_HOLES                                                   000A15 GR
  0 OFFSET_HOLES_JUMP_PENALTY                                      000A1A GR
    OFFSET_HOLES_JUMP_PENALTY_size                              =  000005 G
    OFFSET_HOLES_size                                           =  000005 G
  0 POINTS                                                         000A26 GR
    POSDIFF_HIGHSCORE_DY                                        =  000000 G
    POSDIFF_NAME                                                =  000009 G
    POSDIFF_POINTS                                              =  000000 G
    POSDIFF_YEAR                                                =  00000B G
    POSDIFF_YOUR_SCORE                                          =  000000 G
    POSDIFF_YOUR_SCORE_DY                                       =  000000 G
    POS_COPYRIGHT                                               =  000380 G
    POS_GAME_OVER                                               =  00EC49 G
    POS_LIVES                                                   =  00EFC0 G
    POS_TOP_GAME                                                =  00EC28 G
    POS_TOP_WALL                                                =  00EC40 G
    SCREEN_HEIGHT                                               =  000020 G
    SCREEN_WIDTH                                                =  000020 G
    SLOW_DOWN_13066                                             =  00330A G
    SMALL_CAPITALS                                              =  00005F G
    TITLE_TOP_SIZE                                              =  0001FF G
  0 TOP_IMAGE                                                      00068A GR
    TOP_IMAGE_size                                              =  0001FF G
    TOP_LINES                                                   =  000010 G
    TRANSITION_MAN_WALK_STAY                                    =  000004 G
  0 TXT_GAME_OVER                                                  000ACA GR
    TXT_GAME_OVER_size                                          =  00000F G
  0 TXT_HAZARD                                                     000AE5 GR
    TXT_HAZARD_size                                             =  000009 G
  0 TXT_JUMP                                                       000A2A GR
    TXT_JUMP_size                                               =  000010 G
  0 TXT_NEW_HIGH_SCORE                                             000AEE GR
    TXT_NEW_HIGH_SCORE_size                                     =  000012 G
  0 TXT_YOUR_SCORE                                                 000AD9 GR
    TXT_YOUR_SCORE_size                                         =  00000C G
  0 VERSION_INFO                                                   000900 GR
    VERSION_INFO_size                                           =  000005 G
    VK_CLS                                                      =  00000C G
    VK_HEART                                                    =  0000CB G
    VK_LEFT                                                     =  000008 G
    VK_PLAYER                                                   =  0000C4 G
    VK_RIGHT                                                    =  000009 G
    ZERO                                                        =  000000 G
  0 _main                                                          000000 GR
  0 action_jump                                                    00037B GR
  0 action_left                                                    0002CB GR
  0 action_right                                                   000322 GR
  0 add_10_points                                                  000496 GR
  0 animation_delay                                                0002BE GR
  0 animation_lines                                                00024E GR
  0 animation_loop                                                 000102 GR
  0 animation_monster                                              00018F GR
  0 ask_exit_game                                                  00060A GR
  0 capitalized                                                    000078 GR
  0 check_fall_through                                             0003DF GR
  0 check_for_trap                                                 0003E5 GR
  0 check_level_finished                                           000430 GR
  0 choose_menu                                                    00006F GR
  0 cnt_fail_jump                                                  000A20 GR
  0 cnt_fail_trap                                                  000A1F GR
  0 correct_left_border                                            00030E GR
  0 correct_ptr                                                    0001D9 GR
  0 correct_right_border                                           000365 GR
  0 counter                                                        000A29 GR
  0 decimal_loop                                                   0004D7 GR
  0 delay_loop                                                     0002C5 GR
  0 draw_monster                                                   000210 GR
  0 draw_monster_segment                                           000215 GR
  0 draw_new_highscore_box                                         000658 GR
  0 draw_player                                                    000097 GR
  0 erase_player_fell_down                                         00040D GR
  0 exit_game                                                      000615 GR
  0 get_column                                                     0001D2 GR
  0 get_decimal_digit                                              0004D6 GR
  0 handle_by_column                                               0001B6 GR
  0 handle_by_ptr                                                  0001B2 GR
  0 handle_fail_delay                                              00012E GR
  0 handle_jump_delay                                              000131 GR
  0 handle_one_monster                                             00019E GR
  0 input                                                          000552 GR
  0 insert_score                                                   000627 GR
  0 jump_delay_counter_set                                         00013C GR
  0 jump_fail                                                      0003B8 GR
  0 jump_ok                                                        000394 GR
  0 left_border_next_adr                                           000300 GR
  0 loop_failed_penalty_holes                                      000263 GR
  0 loop_jump_penalty_holes                                        000282 GR
  0 loop_left_border_check                                         0002F4 GR
  0 loop_right_border_check                                        00034B GR
  0 m_070a                                                         00060A GR
  0 monster_check_crash                                            000232 GR
  0 move_one_line_up                                               0001F5 GR
  0 move_table_entry                                               00062E GR
  0 new_game                                                       000081 GR
  0 new_level_set                                                  000443 GR
  0 no_lives                                                       0004E5 GR
  0 player_activity                                                000185 GR
  0 player_fell_down                                               000415 GR
  0 player_wake_up                                                 00016C GR
  0 print_decimal                                                  0004B0 GR
  0 print_highscore_entry                                          0005AB GR
  0 print_highscore_table                                          0005A3 GR
  0 print_line                                                     0002A2 GR
  0 right_border_next_adr                                          000357 GR
  0 round_end                                                      000474 GR
  0 sadr                                                           000000 GR
  0 start_from_bottom                                              0001E3 GR
  0 test_column                                                    0001EA GR
  0 transition_left_stay                                           0002E7 GR
  0 transition_left_walk                                           0002EB GR
  0 transition_stay                                                00033E GR
  0 transition_walk                                                000342 GR
  0 update_left                                                    0002ED GR
  0 update_pointers                                                0001FC GR
  0 update_right                                                   000344 GR
    z1013                                                       =  000001 G
    z9001                                                       =  000000 G


ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 2.
Hexadecimal [24-Bits]

Area Table

   0 _CODE                                      size    B00   flags    0
   1 _DATA                                      size      0   flags    0


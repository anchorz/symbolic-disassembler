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
                                     76         ;jp      no_lives
      000000                         77         CLRSCR
      000100 3E 0C            [ 7]    1         ld      a,#0x0c
      000102 E7               [11]    2         rst     0x20
      000103 00                       3         .db     0x00              ;OUTCH
      000104 11 00 EC         [10]   78         ld      de,#BWS
      000107 21 8A 07         [10]   79         ld      hl,#TOP_IMAGE
      00010A 01 FF 01         [10]   80         ld      bc,#TITLE_TOP_SIZE
      00010D ED B0            [21]   81         ldir
      00010F 21 00 EE         [10]   82         ld      hl,#BWS+SCREEN_WIDTH*TOP_LINES
      000112 36 CB            [10]   83         ld      (hl),#VK_HEART
      000114 11 01 EE         [10]   84         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+1
      000117 01 1F 00         [10]   85         ld      bc,#SCREEN_WIDTH-1
      00011A ED B0            [21]   86         ldir
      00011C 11 18 EE         [10]   87         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+(SCREEN_WIDTH-8)
      00011F 21 00 0A         [10]   88         ld      hl,#VERSION_INFO
      000122 01 05 00         [10]   89         ld      bc,#VERSION_INFO_size
      000125 ED B0            [21]   90         ldir
      000127 11 8A EE         [10]   91         ld      de,#BWS+SCREEN_WIDTH*MENU_TOP+10+ALIGN_MIDDLE
      00012A 21 8A 09         [10]   92         ld      hl,#HINT_RIGHT
      00012D 01 0C 00         [10]   93         ld      bc,#HINT_RIGHT_size
      000130 ED B0            [21]   94         ldir
      000132 0E 14            [ 7]   95         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000134 EB               [ 4]   96         ex      de,hl
      000135 09               [11]   97         add     hl,bc
      000136 EB               [ 4]   98         ex      de,hl
      000137 0E 0C            [ 7]   99         ld      c,#HINT_RIGHT_size
      000139 ED B0            [21]  100         ldir
      00013B 0E 14            [ 7]  101         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      00013D EB               [ 4]  102         ex      de,hl
      00013E 09               [11]  103         add     hl,bc
      00013F EB               [ 4]  104         ex      de,hl
      000140 0E 0C            [ 7]  105         ld      c,#HINT_RIGHT_size
      000142 ED B0            [21]  106         ldir
      000144 0E 14            [ 7]  107         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000146 EB               [ 4]  108         ex      de,hl
      000147 09               [11]  109         add     hl,bc
      000148 EB               [ 4]  110         ex      de,hl
      000149 0E 0C            [ 7]  111         ld      c,#HINT_RIGHT_size
      00014B ED B0            [21]  112         ldir
      00014D 0E 14            [ 7]  113         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      00014F EB               [ 4]  114         ex      de,hl
      000150 09               [11]  115         add     hl,bc
      000151 EB               [ 4]  116         ex      de,hl
      000152 0E 0C            [ 7]  117         ld      c,#HINT_RIGHT_size
      000154 ED B0            [21]  118         ldir
      000156 11 80 EF         [10]  119         ld      de,#BWS+POS_COPYRIGHT
      000159 0E 1E            [ 7]  120         ld      c,#HINT_COPYRIGHT_size
      00015B ED B0            [21]  121         ldir
      00015D 0E 09            [ 7]  122         ld      c,#POSDIFF_NAME
      00015F EB               [ 4]  123         ex      de,hl
      000160 09               [11]  124         add     hl,bc
      000161 EB               [ 4]  125         ex      de,hl
      000162 0E 0E            [ 7]  126         ld      c,#HINT_NAME_size
      000164 ED B0            [21]  127         ldir
      000166 0E 0B            [ 7]  128         ld      c,#POSDIFF_YEAR
      000168 EB               [ 4]  129         ex      de,hl
      000169 09               [11]  130         add     hl,bc
      00016A EB               [ 4]  131         ex      de,hl
      00016B 0E 12            [ 7]  132         ld      c,#HINT_YEAR_size+VERSION_INFO_size-1
      00016D ED B0            [21]  133         ldir
      00016F                        134 choose_menu:
      00016F AF               [ 4]  135         xor     a
      000070                        136         INCH
      000170 E7               [11]    1         rst     0x20
      000171 01                       2         .db     0x01              ;INCH
      000172 FE 5F            [ 7]  137         cp      #SMALL_CAPITALS
      000174 38 02            [12]  138         jr      c,capitalized
      000176 D6 20            [ 7]  139         sub     #CAPITALIZE
      000178                        140 capitalized:
      000178 FE 45            [ 7]  141         cp      #'E'
      00017A CA 15 07         [10]  142         jp      z,exit_game
      00017D FE 50            [ 7]  143         cp      #'P'
      00017F 20 EE            [12]  144         jr      nz,choose_menu
      000181                        145 new_game:
      000081                        146         CLRSCR
      000181 3E 0C            [ 7]    1         ld      a,#0x0c
      000183 E7               [11]    2         rst     0x20
      000184 00                       3         .db     0x00              ;OUTCH
      000185 21 25 0B         [10]  147         ld      hl,#LIVES
      000188 36 06            [10]  148         ld      (hl),#INITIAL_LIVES
      00018A 21 26 0B         [10]  149         ld      hl,#POINTS
      00018D 36 00            [10]  150         ld      (hl),#ZERO
      00018F 23               [ 6]  151         inc     hl
      000190 36 00            [10]  152         ld      (hl),#ZERO
      000192 06 06            [ 7]  153         ld      b,#INITIAL_LIVES
      000194 21 C0 EF         [10]  154         ld      hl,#POS_LIVES
      000197                        155 draw_player:
      000197 3E 02            [ 7]  156         ld      a,#MOVE_2X_RIGHT
      000199 85               [ 4]  157         add     a,l
      00019A 6F               [ 4]  158         ld      l,a
      00019B 36 C4            [10]  159         ld      (hl),#VK_PLAYER
      00019D 10 F8            [13]  160         djnz    draw_player
      00019F 3E 01            [ 7]  161         ld      a,#INITIAL_LEVEL
      0001A1 32 28 0B         [13]  162         ld      (LEVEL),a
      0001A4 3E 02            [ 7]  163         ld      a,#INITIAL_FAIL_COUNTER
      0001A6 32 1F 0B         [13]  164         ld      (cnt_fail_trap),a
      0001A9 32 20 0B         [13]  165         ld      (cnt_fail_jump),a
      0001AC 21 00 EC         [10]  166         ld      hl,#BWS
      0001AF 36 20            [10]  167         ld      (hl),#' '
      0001B1 11 01 EC         [10]  168         ld      de,#BWS+1
      0001B4 01 BE 03         [10]  169         ld      bc,#(3+GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH-2
      0001B7 ED B0            [21]  170         ldir
      0001B9 21 40 EC         [10]  171         ld      hl,#POS_TOP_WALL
      0001BC 36 C6            [10]  172         ld      (hl),#CHR_WALL
      0001BE 11 41 EC         [10]  173         ld      de,#POS_TOP_WALL+1
      0001C1 01 1F 00         [10]  174         ld      bc,#SCREEN_WIDTH-1
      0001C4 ED B0            [21]  175         ldir
      0001C6 21 78 EC         [10]  176         ld      hl,#POS_TOP_WALL+2*SCREEN_WIDTH-8
      0001C9 36 C6            [10]  177         ld      (hl),#CHR_WALL
      0001CB 2B               [ 6]  178         dec     hl
      0001CC 2B               [ 6]  179         dec     hl
      0001CD 36 95            [10]  180         ld      (hl),#CHR_ARROW_RIGHT_TOP
      0001CF 2B               [ 6]  181         dec     hl
      0001D0 36 F8            [10]  182         ld      (hl),#CHR_LINE_TOP
      0001D2 21 98 EC         [10]  183         ld      hl,#POS_TOP_WALL+3*SCREEN_WIDTH-8
      0001D5 36 C6            [10]  184         ld      (hl),#CHR_WALL
      0001D7 2B               [ 6]  185         dec     hl
      0001D8 2B               [ 6]  186         dec     hl
      0001D9 36 93            [10]  187         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      0001DB 2B               [ 6]  188         dec     hl
      0001DC 36 9E            [10]  189         ld      (hl),#CHR_LINE_BOTTOM
      0001DE 21 2A 0B         [10]  190         ld      hl,#TXT_JUMP
      0001E1 11 28 EC         [10]  191         ld      de,#POS_TOP_GAME
      0001E4 01 10 00         [10]  192         ld      bc,#TXT_JUMP_size
      0001E7 ED B0            [21]  193         ldir
      0001E9 3E 01            [ 7]  194         ld      a,#INITIAL_DELAY_COUNTER
      0001EB 21 23 0B         [10]  195         ld      hl,#JUMP_DELAY
      0001EE 77               [ 7]  196         ld      (hl),a
      0001EF 21 24 0B         [10]  197         ld      hl,#FAIL_DELAY
      0001F2 77               [ 7]  198         ld      (hl),a
      0001F3 23               [ 6]  199         inc     hl
      0001F4 21 6E EF         [10]  200         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      0001F7 22 21 0B         [16]  201         ld      (MAN_HEAD),hl
      0001FA 36 CC            [10]  202         ld      (hl),#CHR_MAN_HEAD
      0001FC 11 20 00         [10]  203         ld      de,#SCREEN_WIDTH
      0001FF 19               [11]  204         add     hl,de
      000200 36 A1            [10]  205         ld      (hl),#CHR_MAN_STAY
      000202                        206 animation_loop:
      000202 CD 8F 02         [17]  207         call    animation_monster
      000205 CD 4E 03         [17]  208         call    animation_lines
      000208 CD BE 03         [17]  209         call    animation_delay
      00020B 3A 23 0B         [13]  210         ld      a,(JUMP_DELAY)
      00020E FE 01            [ 7]  211         cp      #INITIAL_DELAY_COUNTER
      000210 20 1F            [12]  212         jr      nz,handle_jump_delay
      000212 3A 24 0B         [13]  213         ld      a,(FAIL_DELAY)
      000215 FE 01            [ 7]  214         cp      #INITIAL_DELAY_COUNTER
      000217 20 15            [12]  215         jr      nz,handle_fail_delay
      000119                        216         INKEY
      000219 AF               [ 4]    1         xor     a
      00021A 32 04 00         [13]    2         ld      (KEY_CODE),a
      00021D E7               [11]    3         rst     0x20
      00021E 04                       4         .db     0x04              ;INKEY
      00021F FE 20            [ 7]  217         cp      #' '
      000221 CA 7B 04         [10]  218         jp      z,action_jump
      000224 FE 08            [ 7]  219         cp      #VK_LEFT
      000226 CC CB 03         [17]  220         call    z,action_left
      000229 FE 09            [ 7]  221         cp      #VK_RIGHT
      00022B CC 22 04         [17]  222         call    z,action_right
                           000000   223 .if z9001
                                    224         ;debugginh
                                    225         cp      #'U'
                                    226         jr      nz,handle_fail_delay
                                    227         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+20
                                    228         ld      (hl),#CHR_MAN_HEAD
                                    229         ld      (MAN_HEAD),hl
                                    230 .endif
      00022E                        231 handle_fail_delay:
      00022E CD DF 04         [17]  232         call    check_fall_through
      000231                        233 handle_jump_delay:
      000231 3A 23 0B         [13]  234         ld      a,(JUMP_DELAY)
      000234 FE 01            [ 7]  235         cp      #INITIAL_DELAY_COUNTER
      000236 28 04            [12]  236         jr      z,jump_delay_counter_set
      000238 3D               [ 4]  237         dec     a
      000239 32 23 0B         [13]  238         ld      (JUMP_DELAY),a
      00023C                        239 jump_delay_counter_set:
      00023C 3A 24 0B         [13]  240         ld      a,(FAIL_DELAY)
      00023F FE 01            [ 7]  241         cp      #INITIAL_DELAY_COUNTER
      000241 28 42            [12]  242         jr      z,player_activity
      000243 3D               [ 4]  243         dec     a
      000244 32 24 0B         [13]  244         ld      (FAIL_DELAY),a
      000247 FE 01            [ 7]  245         cp      #INITIAL_DELAY_COUNTER
      000249 20 3A            [12]  246         jr      nz,player_activity
      00024B 2A 21 0B         [16]  247         ld      hl,(MAN_HEAD)
                                    248         ; test for bottom line
      00024E 11 20 EF         [10]  249         ld      de,#BWS+(GAME_START_Y+3*GAMES_LINES-2)*SCREEN_WIDTH
      000251 A7               [ 4]  250         and     a
      000252 ED 52            [15]  251         sbc     hl,de
      000254 38 16            [12]  252         jr      c,player_wake_up
      000256 3A 25 0B         [13]  253         ld      a,(LIVES)
      000259 3D               [ 4]  254         dec     a
      00025A 32 25 0B         [13]  255         ld      (LIVES),a
      00025D 21 C2 EF         [10]  256         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES+3)*SCREEN_WIDTH+2
      000260 16 00            [ 7]  257         ld      d,#HI_ZERO
      000262 87               [ 4]  258         add     a,a
      000263 5F               [ 4]  259         ld      e,a
      000264 19               [11]  260         add     hl,de
      000265 36 20            [10]  261         ld      (hl),#' '
      000267 FE 00            [ 7]  262         cp      #ZERO
      000269 CA E5 05         [10]  263         jp      z,no_lives
      00026C                        264 player_wake_up:
      00026C 2A 21 0B         [16]  265         ld      hl,(MAN_HEAD)
      00026F 36 CC            [10]  266         ld      (hl),#CHR_MAN_HEAD
      000271 2B               [ 6]  267         dec     hl
      000272 3E 20            [ 7]  268         ld      a,#' '
      000274 77               [ 7]  269         ld      (hl),a
      000275 23               [ 6]  270         inc     hl
      000276 23               [ 6]  271         inc     hl
      000277 23               [ 6]  272         inc     hl
      000278 77               [ 7]  273         ld      (hl),a
      000279 2B               [ 6]  274         dec     hl
      00027A 11 20 00         [10]  275         ld      de,#SCREEN_WIDTH
      00027D 19               [11]  276         add     hl,de
      00027E 77               [ 7]  277         ld      (hl),a
      00027F 23               [ 6]  278         inc     hl
      000280 77               [ 7]  279         ld      (hl),a
      000281 2B               [ 6]  280         dec     hl
      000282 2B               [ 6]  281         dec     hl
      000283 36 9D            [10]  282         ld      (hl),#CHR_MAN_WALK
      000285                        283 player_activity:
      000285 CD 30 05         [17]  284         call    check_level_finished
      000288 C3 02 02         [10]  285         jp      animation_loop
                                    286 ; unchecked data source
      00028B 67 75 66 69            287         .db     0x67,0x75,0x66,0x69                     ;gufi
      00028F                        288 animation_monster:
      00028F 3A 28 0B         [13]  289         ld      a,(LEVEL)
      000292 32 29 0B         [13]  290         ld      (counter),a
      000295 FE 01            [ 7]  291         cp      #LEVEL_1
      000297 C8               [11]  292         ret     z
      000298 01 3A 0B         [10]  293         ld      bc,#MONSTER_PTR
      00029B 11 72 0B         [10]  294         ld      de,#MONSTER_IMG
      00029E                        295 handle_one_monster:
      00029E 0A               [ 7]  296         ld      a,(bc)
      00029F 6F               [ 4]  297         ld      l,a
      0002A0 03               [ 6]  298         inc     bc
      0002A1 0A               [ 7]  299         ld      a,(bc)
      0002A2 67               [ 4]  300         ld      h,a
      0002A3 CD B2 02         [17]  301         call    handle_by_ptr
      0002A6 3A 29 0B         [13]  302         ld      a,(counter)
      0002A9 3D               [ 4]  303         dec     a
      0002AA 32 29 0B         [13]  304         ld      (counter),a
      0002AD FE 01            [ 7]  305         cp      #LEVEL_1
      0002AF C8               [11]  306         ret     z
      0002B0 18 EC            [12]  307         jr      handle_one_monster
      0002B2                        308 handle_by_ptr:
      0002B2 C5               [11]  309         push    bc
      0002B3 3E 04            [ 7]  310         ld      a,#MONSTER_WIDTH
      0002B5 D5               [11]  311         push    de
      0002B6                        312 handle_by_column:
      0002B6 36 20            [10]  313         ld      (hl),#' '
      0002B8 11 20 00         [10]  314         ld      de,#SCREEN_WIDTH
      0002BB 19               [11]  315         add     hl,de
      0002BC 36 20            [10]  316         ld      (hl),#' '
      0002BE A7               [ 4]  317         and     a
      0002BF ED 52            [15]  318         sbc     hl,de
      0002C1 2B               [ 6]  319         dec     hl
      0002C2 E5               [11]  320         push    hl
      0002C3 08               [ 4]  321         ex      af,af'
      0002C4 11 DF EC         [10]  322         ld      de,#BWS+(GAME_START_Y+4)*SCREEN_WIDTH-1
      0002C7 A7               [ 4]  323         and     a
      0002C8 ED 52            [15]  324         sbc     hl,de
      0002CA 38 0D            [12]  325         jr      c,correct_ptr
      0002CC C5               [11]  326         push    bc
      0002CD 06 08            [ 7]  327         ld      b,#GAMES_LINES
      0002CF 11 60 00         [10]  328         ld      de,#3*SCREEN_WIDTH
      0002D2                        329 get_column:
      0002D2 A7               [ 4]  330         and     a
      0002D3 ED 52            [15]  331         sbc     hl,de
      0002D5 38 13            [12]  332         jr      c,test_column
      0002D7 10 F9            [13]  333         djnz    get_column
      0002D9                        334 correct_ptr:
      0002D9 11 1F 00         [10]  335         ld      de,#SCREEN_WIDTH-1
      0002DC ED 5A            [15]  336         adc     hl,de
      0002DE 28 03            [12]  337         jr      z,start_from_bottom
      0002E0 E1               [10]  338         pop     hl
      0002E1 18 19            [12]  339         jr      update_pointers
      0002E3                        340 start_from_bottom:
      0002E3 E1               [10]  341         pop     hl
      0002E4 11 60 02         [10]  342         ld      de,#((GAMES_LINES-2)*3+1)*SCREEN_WIDTH
      0002E7 19               [11]  343         add     hl,de
      0002E8 18 12            [12]  344         jr      update_pointers
      0002EA                        345 test_column:
      0002EA C1               [10]  346         pop     bc
      0002EB 11 1F 00         [10]  347         ld      de,#SCREEN_WIDTH-1
      0002EE ED 5A            [15]  348         adc     hl,de
      0002F0 28 03            [12]  349         jr      z,move_one_line_up
      0002F2 E1               [10]  350         pop     hl
      0002F3 18 07            [12]  351         jr      update_pointers
      0002F5                        352 move_one_line_up:
      0002F5 E1               [10]  353         pop     hl
      0002F6 11 40 00         [10]  354         ld      de,#2*SCREEN_WIDTH
      0002F9 A7               [ 4]  355         and     a
      0002FA ED 52            [15]  356         sbc     hl,de
      0002FC                        357 update_pointers:
      0002FC 0B               [ 6]  358         dec     bc
      0002FD 7D               [ 4]  359         ld      a,l
      0002FE 02               [ 7]  360         ld      (bc),a
      0002FF 03               [ 6]  361         inc     bc
      000300 7C               [ 4]  362         ld      a,h
      000301 02               [ 7]  363         ld      (bc),a
      000302 03               [ 6]  364         inc     bc
      000303 0A               [ 7]  365         ld      a,(bc)
      000304 6F               [ 4]  366         ld      l,a
      000305 03               [ 6]  367         inc     bc
      000306 0A               [ 7]  368         ld      a,(bc)
      000307 67               [ 4]  369         ld      h,a
      000308 08               [ 4]  370         ex      af,af'
      000309 3D               [ 4]  371         dec     a
      00030A FE 00            [ 7]  372         cp      #ZERO
      00030C 28 02            [12]  373         jr      z,draw_monster
      00030E 18 A6            [12]  374         jr      handle_by_column
      000310                        375 draw_monster:
      000310 D1               [10]  376         pop     de
      000311 C1               [10]  377         pop     bc
      000312 0B               [ 6]  378         dec     bc
      000313 3E 04            [ 7]  379         ld      a,#MONSTER_WIDTH
      000315                        380 draw_monster_segment:
      000315 08               [ 4]  381         ex      af,af'
      000316 0A               [ 7]  382         ld      a,(bc)
      000317 6F               [ 4]  383         ld      l,a
      000318 03               [ 6]  384         inc     bc
      000319 0A               [ 7]  385         ld      a,(bc)
      00031A 67               [ 4]  386         ld      h,a
      00031B 03               [ 6]  387         inc     bc
      00031C 1A               [ 7]  388         ld      a,(de)
      00031D 77               [ 7]  389         ld      (hl),a
      00031E 13               [ 6]  390         inc     de
      00031F 1A               [ 7]  391         ld      a,(de)
      000320 D5               [11]  392         push    de
      000321 11 20 00         [10]  393         ld      de,#SCREEN_WIDTH
      000324 19               [11]  394         add     hl,de
      000325 77               [ 7]  395         ld      (hl),a
      000326 CD 32 03         [17]  396         call    monster_check_crash
      000329 D1               [10]  397         pop     de
      00032A 13               [ 6]  398         inc     de
      00032B 08               [ 4]  399         ex      af,af'
      00032C 3D               [ 4]  400         dec     a
      00032D FE 00            [ 7]  401         cp      #ZERO
      00032F 20 E4            [12]  402         jr      nz,draw_monster_segment
      000331 C9               [10]  403         ret
      000332                        404 monster_check_crash:
      000332 A7               [ 4]  405         and     a
      000333 ED 52            [15]  406         sbc     hl,de
      000335 EB               [ 4]  407         ex      de,hl
      000336 2A 21 0B         [16]  408         ld      hl,(MAN_HEAD)
      000339 A7               [ 4]  409         and     a
      00033A ED 52            [15]  410         sbc     hl,de
      00033C EB               [ 4]  411         ex      de,hl
      00033D C0               [11]  412         ret     nz
      00033E 11 20 00         [10]  413         ld      de,#SCREEN_WIDTH
      000341 19               [11]  414         add     hl,de
      000342 23               [ 6]  415         inc     hl
      000343 36 97            [10]  416         ld      (hl),#CHR_MAN_SLEEP
      000345 23               [ 6]  417         inc     hl
      000346 36 C9            [10]  418         ld      (hl),#CHR_MAN_SLEEP_HEAD
      000348 3E 0B            [ 7]  419         ld      a,#DELAY_COUNTER
      00034A 32 24 0B         [13]  420         ld      (FAIL_DELAY),a
      00034D C9               [10]  421         ret
      00034E                        422 animation_lines:
      00034E 3E EE            [ 7]  423         ld      a,#CHR_MOVING_LINE
      000350 21 05 0A         [10]  424         ld      hl,#LINE_BUFFER
      000353 77               [ 7]  425         ld      (hl),a
      000354 11 06 0A         [10]  426         ld      de,#LINE_BUFFER+1
      000357 01 0E 01         [10]  427         ld      bc,#LINE_BUFFER_size-1
      00035A ED B0            [21]  428         ldir
      00035C 3A 1F 0B         [13]  429         ld      a,(cnt_fail_trap)
      00035F 11 15 0B         [10]  430         ld      de,#OFFSET_HOLES
      000362 1B               [ 6]  431         dec     de
      000363                        432 loop_failed_penalty_holes:
      000363 F5               [11]  433         push    af
      000364 13               [ 6]  434         inc     de
      000365 1A               [ 7]  435         ld      a,(de)
      000366 3C               [ 4]  436         inc     a
      000367 12               [ 7]  437         ld      (de),a
      000368 4F               [ 4]  438         ld      c,a
      000369 06 00            [ 7]  439         ld      b,#HI_ZERO
      00036B 21 05 0A         [10]  440         ld      hl,#LINE_BUFFER
      00036E 09               [11]  441         add     hl,bc
      00036F 36 20            [10]  442         ld      (hl),#' '
      000371 23               [ 6]  443         inc     hl
      000372 36 20            [10]  444         ld      (hl),#' '
      000374 23               [ 6]  445         inc     hl
      000375 36 20            [10]  446         ld      (hl),#' '
      000377 F1               [10]  447         pop     af
      000378 3D               [ 4]  448         dec     a
      000379 20 E8            [12]  449         jr      nz,loop_failed_penalty_holes
      00037B 3A 20 0B         [13]  450         ld      a,(cnt_fail_jump)
      00037E 11 1A 0B         [10]  451         ld      de,#OFFSET_HOLES_JUMP_PENALTY
      000381 1B               [ 6]  452         dec     de
      000382                        453 loop_jump_penalty_holes:
      000382 F5               [11]  454         push    af
      000383 13               [ 6]  455         inc     de
      000384 1A               [ 7]  456         ld      a,(de)
      000385 3D               [ 4]  457         dec     a
      000386 12               [ 7]  458         ld      (de),a
      000387 4F               [ 4]  459         ld      c,a
      000388 06 00            [ 7]  460         ld      b,#HI_ZERO
      00038A 21 05 0A         [10]  461         ld      hl,#LINE_BUFFER
      00038D 09               [11]  462         add     hl,bc
      00038E 36 20            [10]  463         ld      (hl),#' '
      000390 23               [ 6]  464         inc     hl
      000391 36 20            [10]  465         ld      (hl),#' '
      000393 23               [ 6]  466         inc     hl
      000394 36 20            [10]  467         ld      (hl),#' '
      000396 F1               [10]  468         pop     af
      000397 3D               [ 4]  469         dec     a
      000398 20 E8            [12]  470         jr      nz,loop_jump_penalty_holes
      00039A 3E 08            [ 7]  471         ld      a,#GAMES_LINES
      00039C 21 05 0A         [10]  472         ld      hl,#LINE_BUFFER
      00039F 11 60 EC         [10]  473         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+0
      0003A2                        474 print_line:
      0003A2 01 20 00         [10]  475         ld      bc,#SCREEN_WIDTH
      0003A5 E5               [11]  476         push    hl
      0003A6 EB               [ 4]  477         ex      de,hl
      0003A7 09               [11]  478         add     hl,bc
      0003A8 09               [11]  479         add     hl,bc
      0003A9 EB               [ 4]  480         ex      de,hl
      0003AA E1               [10]  481         pop     hl
      0003AB ED B0            [21]  482         ldir
      0003AD 3D               [ 4]  483         dec     a
      0003AE 20 F2            [12]  484         jr      nz,print_line
      0003B0 21 A0 EF         [10]  485         ld      hl,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+0
      0003B3 11 A1 EF         [10]  486         ld      de,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+1
      0003B6 01 1F 00         [10]  487         ld      bc,#SCREEN_WIDTH-1
      0003B9 36 C6            [10]  488         ld      (hl),#CHR_WALL
      0003BB ED B0            [21]  489         ldir
      0003BD C9               [10]  490         ret
      0003BE                        491 animation_delay:
      0003BE 21 0A 33         [10]  492         ld      hl,#SLOW_DOWN_13066
      0003C1 11 01 00         [10]  493         ld      de,#1
      0003C4 A7               [ 4]  494         and     a
      0003C5                        495 delay_loop:
      0003C5 2B               [ 6]  496         dec     hl
      0003C6 ED 52            [15]  497         sbc     hl,de
      0003C8 20 FB            [12]  498         jr      nz,delay_loop
      0003CA C9               [10]  499         ret
      0003CB                        500 action_left:
      0003CB F5               [11]  501         push    af
      0003CC 2A 21 0B         [16]  502         ld      hl,(MAN_HEAD)
      0003CF 7E               [ 7]  503         ld      a,(hl)
      0003D0 36 20            [10]  504         ld      (hl),#' '
      0003D2 2B               [ 6]  505         dec     hl
      0003D3 22 21 0B         [16]  506         ld      (MAN_HEAD),hl
      0003D6 77               [ 7]  507         ld      (hl),a
      0003D7 11 20 00         [10]  508         ld      de,#SCREEN_WIDTH
      0003DA 19               [11]  509         add     hl,de
      0003DB 23               [ 6]  510         inc     hl
      0003DC 7E               [ 7]  511         ld      a,(hl)
      0003DD 36 20            [10]  512         ld      (hl),#' '
      0003DF FE 9D            [ 7]  513         cp      #CHR_MAN_WALK
      0003E1 28 04            [12]  514         jr      z,transition_left_stay
      0003E3 FE A1            [ 7]  515         cp      #CHR_MAN_STAY
      0003E5 28 04            [12]  516         jr      z,transition_left_walk
      0003E7                        517 transition_left_stay:
      0003E7 C6 04            [ 7]  518         add     a,#TRANSITION_MAN_WALK_STAY
      0003E9 18 02            [12]  519         jr      update_left
      0003EB                        520 transition_left_walk:
      0003EB D6 04            [ 7]  521         sub     #TRANSITION_MAN_WALK_STAY
      0003ED                        522 update_left:
      0003ED 2B               [ 6]  523         dec     hl
      0003EE 77               [ 7]  524         ld      (hl),a
      0003EF 3E 09            [ 7]  525         ld      a,#GAMES_LINES+1
      0003F1 01 5F EC         [10]  526         ld      bc,#BWS+(GAME_START_Y)*SCREEN_WIDTH-1
      0003F4                        527 loop_left_border_check:
      0003F4 C5               [11]  528         push    bc
      0003F5 60               [ 4]  529         ld      h,b
      0003F6 69               [ 4]  530         ld      l,c
      0003F7 ED 5B 21 0B      [20]  531         ld      de,(MAN_HEAD)
      0003FB A7               [ 4]  532         and     a
      0003FC ED 52            [15]  533         sbc     hl,de
      0003FE 28 0E            [12]  534         jr      z,correct_left_border
      000400                        535 left_border_next_adr:
      000400 C1               [10]  536         pop     bc
      000401 11 60 00         [10]  537         ld      de,#3*SCREEN_WIDTH
      000404 60               [ 4]  538         ld      h,b
      000405 69               [ 4]  539         ld      l,c
      000406 19               [11]  540         add     hl,de
      000407 44               [ 4]  541         ld      b,h
      000408 4D               [ 4]  542         ld      c,l
      000409 3D               [ 4]  543         dec     a
      00040A 20 E8            [12]  544         jr      nz,loop_left_border_check
      00040C F1               [10]  545         pop     af
      00040D C9               [10]  546         ret
      00040E                        547 correct_left_border:
      00040E 2A 21 0B         [16]  548         ld      hl,(MAN_HEAD)
      000411 11 20 00         [10]  549         ld      de,#SCREEN_WIDTH
      000414 36 C6            [10]  550         ld      (hl),#CHR_WALL
      000416 19               [11]  551         add     hl,de
      000417 36 CC            [10]  552         ld      (hl),#CHR_MAN_HEAD
      000419 22 21 0B         [16]  553         ld      (MAN_HEAD),hl
      00041C 19               [11]  554         add     hl,de
      00041D 36 9D            [10]  555         ld      (hl),#CHR_MAN_WALK
      00041F C3 00 04         [10]  556         jp      left_border_next_adr
      000422                        557 action_right:
      000422 F5               [11]  558         push    af
      000423 2A 21 0B         [16]  559         ld      hl,(MAN_HEAD)
      000426 7E               [ 7]  560         ld      a,(hl)
      000427 36 20            [10]  561         ld      (hl),#' '
      000429 23               [ 6]  562         inc     hl
      00042A 22 21 0B         [16]  563         ld      (MAN_HEAD),hl
      00042D 77               [ 7]  564         ld      (hl),a
      00042E 11 20 00         [10]  565         ld      de,#SCREEN_WIDTH
      000431 19               [11]  566         add     hl,de
      000432 2B               [ 6]  567         dec     hl
      000433 7E               [ 7]  568         ld      a,(hl)
      000434 36 20            [10]  569         ld      (hl),#' '
      000436 FE 9D            [ 7]  570         cp      #CHR_MAN_WALK
      000438 28 04            [12]  571         jr      z,transition_stay
      00043A FE A1            [ 7]  572         cp      #CHR_MAN_STAY
      00043C 28 04            [12]  573         jr      z,transition_walk
      00043E                        574 transition_stay:
      00043E C6 04            [ 7]  575         add     a,#TRANSITION_MAN_WALK_STAY
      000440 18 02            [12]  576         jr      update_right
      000442                        577 transition_walk:
      000442 D6 04            [ 7]  578         sub     #TRANSITION_MAN_WALK_STAY
      000444                        579 update_right:
      000444 23               [ 6]  580         inc     hl
      000445 77               [ 7]  581         ld      (hl),a
      000446 3E 09            [ 7]  582         ld      a,#GAMES_LINES+1
      000448 01 80 EC         [10]  583         ld      bc,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH+0
      00044B                        584 loop_right_border_check:
      00044B C5               [11]  585         push    bc
      00044C 60               [ 4]  586         ld      h,b
      00044D 69               [ 4]  587         ld      l,c
      00044E ED 5B 21 0B      [20]  588         ld      de,(MAN_HEAD)
      000452 A7               [ 4]  589         and     a
      000453 ED 52            [15]  590         sbc     hl,de
      000455 28 0E            [12]  591         jr      z,correct_right_border
      000457                        592 right_border_next_adr:
      000457 C1               [10]  593         pop     bc
      000458 11 60 00         [10]  594         ld      de,#3*SCREEN_WIDTH
      00045B 60               [ 4]  595         ld      h,b
      00045C 69               [ 4]  596         ld      l,c
      00045D 19               [11]  597         add     hl,de
      00045E 44               [ 4]  598         ld      b,h
      00045F 4D               [ 4]  599         ld      c,l
      000460 3D               [ 4]  600         dec     a
      000461 20 E8            [12]  601         jr      nz,loop_right_border_check
      000463 F1               [10]  602         pop     af
      000464 C9               [10]  603         ret
      000465                        604 correct_right_border:
      000465 2A 21 0B         [16]  605         ld      hl,(MAN_HEAD)
      000468 4E               [ 7]  606         ld      c,(hl)
      000469 36 9D            [10]  607         ld      (hl),#CHR_MAN_WALK
      00046B 11 20 00         [10]  608         ld      de,#SCREEN_WIDTH
      00046E A7               [ 4]  609         and     a
      00046F ED 52            [15]  610         sbc     hl,de
      000471 71               [ 7]  611         ld      (hl),c
      000472 22 21 0B         [16]  612         ld      (MAN_HEAD),hl
      000475 19               [11]  613         add     hl,de
      000476 19               [11]  614         add     hl,de
      000477 36 EE            [10]  615         ld      (hl),#CHR_MOVING_LINE
      000479 18 DC            [12]  616         jr      right_border_next_adr
      00047B                        617 action_jump:
      00047B 2A 21 0B         [16]  618         ld      hl,(MAN_HEAD)
      00047E 11 20 00         [10]  619         ld      de,#SCREEN_WIDTH
      000481 A7               [ 4]  620         and     a
      000482 ED 52            [15]  621         sbc     hl,de
      000484 7E               [ 7]  622         ld      a,(hl)
      000485 FE 20            [ 7]  623         cp      #' '
      000487 28 0B            [12]  624         jr      z,jump_ok
      000489 FE EE            [ 7]  625         cp      #CHR_MOVING_LINE
      00048B 28 2B            [12]  626         jr      z,jump_fail
      00048D FE C6            [ 7]  627         cp      #CHR_WALL
      00048F 28 27            [12]  628         jr      z,jump_fail
      000491 C3 2E 02         [10]  629         jp      handle_fail_delay
      000494                        630 jump_ok:
      000494 D9               [ 4]  631         exx
      000495 CD 96 05         [17]  632         call    add_10_points
      000498 D9               [ 4]  633         exx
      000499 19               [11]  634         add     hl,de
      00049A 36 20            [10]  635         ld      (hl),#' '
      00049C 19               [11]  636         add     hl,de
      00049D 36 20            [10]  637         ld      (hl),#' '
      00049F 1E 60            [ 7]  638         ld      e,#3*SCREEN_WIDTH
      0004A1 A7               [ 4]  639         and     a
      0004A2 ED 52            [15]  640         sbc     hl,de
      0004A4 36 9D            [10]  641         ld      (hl),#CHR_MAN_WALK
      0004A6 1E 20            [ 7]  642         ld      e,#SCREEN_WIDTH
      0004A8 A7               [ 4]  643         and     a
      0004A9 ED 52            [15]  644         sbc     hl,de
      0004AB 36 CC            [10]  645         ld      (hl),#CHR_MAN_HEAD
      0004AD 22 21 0B         [16]  646         ld      (MAN_HEAD),hl
      0004B0 3E 04            [ 7]  647         ld      a,#DELAY_COUNTER_JUMP
      0004B2 32 23 0B         [13]  648         ld      (JUMP_DELAY),a
      0004B5 C3 2E 02         [10]  649         jp      handle_fail_delay
      0004B8                        650 jump_fail:
      0004B8 19               [11]  651         add     hl,de
      0004B9 2B               [ 6]  652         dec     hl
      0004BA 3E CD            [ 7]  653         ld      a,#CHR_SMOKE
      0004BC 77               [ 7]  654         ld      (hl),a
      0004BD 23               [ 6]  655         inc     hl
      0004BE 23               [ 6]  656         inc     hl
      0004BF 23               [ 6]  657         inc     hl
      0004C0 77               [ 7]  658         ld      (hl),a
      0004C1 2B               [ 6]  659         dec     hl
      0004C2 2B               [ 6]  660         dec     hl
      0004C3 36 20            [10]  661         ld      (hl),#' '
      0004C5 19               [11]  662         add     hl,de
      0004C6 36 97            [10]  663         ld      (hl),#CHR_MAN_SLEEP
      0004C8 23               [ 6]  664         inc     hl
      0004C9 36 C9            [10]  665         ld      (hl),#CHR_MAN_SLEEP_HEAD
      0004CB 3E 0B            [ 7]  666         ld      a,#DELAY_COUNTER
      0004CD 32 24 0B         [13]  667         ld      (FAIL_DELAY),a
      0004D0 3A 20 0B         [13]  668         ld      a,(cnt_fail_jump)
      0004D3 FE 05            [ 7]  669         cp      #MAX_FAIL_COUNTER
      0004D5 CA 2E 02         [10]  670         jp      z,handle_fail_delay
      0004D8 3C               [ 4]  671         inc     a
      0004D9 32 20 0B         [13]  672         ld      (cnt_fail_jump),a
      0004DC C3 2E 02         [10]  673         jp      handle_fail_delay
      0004DF                        674 check_fall_through:
      0004DF 3A 23 0B         [13]  675         ld      a,(JUMP_DELAY)
      0004E2 FE 01            [ 7]  676         cp      #INITIAL_DELAY_COUNTER
      0004E4 C0               [11]  677         ret     nz
      0004E5                        678 check_for_trap:
      0004E5 2A 21 0B         [16]  679         ld      hl,(MAN_HEAD)
      0004E8 11 20 00         [10]  680         ld      de,#SCREEN_WIDTH
      0004EB 19               [11]  681         add     hl,de
      0004EC 19               [11]  682         add     hl,de
      0004ED 7E               [ 7]  683         ld      a,(hl)
      0004EE FE 20            [ 7]  684         cp      #' '
      0004F0 C0               [11]  685         ret     nz
      0004F1 3A 24 0B         [13]  686         ld      a,(FAIL_DELAY)
      0004F4 FE 01            [ 7]  687         cp      #INITIAL_DELAY_COUNTER
      0004F6 28 15            [12]  688         jr      z,erase_player_fell_down
      0004F8 2A 21 0B         [16]  689         ld      hl,(MAN_HEAD)
      0004FB 3E 20            [ 7]  690         ld      a,#' '
      0004FD 2B               [ 6]  691         dec     hl
      0004FE 77               [ 7]  692         ld      (hl),a
      0004FF 23               [ 6]  693         inc     hl
      000500 23               [ 6]  694         inc     hl
      000501 23               [ 6]  695         inc     hl
      000502 77               [ 7]  696         ld      (hl),a
      000503 2B               [ 6]  697         dec     hl
      000504 19               [11]  698         add     hl,de
      000505 77               [ 7]  699         ld      (hl),a
      000506 23               [ 6]  700         inc     hl
      000507 77               [ 7]  701         ld      (hl),a
      000508 2B               [ 6]  702         dec     hl
      000509 2B               [ 6]  703         dec     hl
      00050A 77               [ 7]  704         ld      (hl),a
      00050B 18 08            [12]  705         jr      player_fell_down
      00050D                        706 erase_player_fell_down:
      00050D 2A 21 0B         [16]  707         ld      hl,(MAN_HEAD)
      000510 3E 20            [ 7]  708         ld      a,#' '
      000512 77               [ 7]  709         ld      (hl),a
      000513 19               [11]  710         add     hl,de
      000514 77               [ 7]  711         ld      (hl),a
      000515                        712 player_fell_down:
      000515 19               [11]  713         add     hl,de
      000516 19               [11]  714         add     hl,de
      000517 22 21 0B         [16]  715         ld      (MAN_HEAD),hl
      00051A 19               [11]  716         add     hl,de
      00051B 36 97            [10]  717         ld      (hl),#CHR_MAN_SLEEP
      00051D 23               [ 6]  718         inc     hl
      00051E 36 C9            [10]  719         ld      (hl),#CHR_MAN_SLEEP_HEAD
      000520 3E 08            [ 7]  720         ld      a,#DELAY_COUNTER2
      000522 32 24 0B         [13]  721         ld      (FAIL_DELAY),a
      000525 3A 1F 0B         [13]  722         ld      a,(cnt_fail_trap)
      000528 FE 05            [ 7]  723         cp      #MAX_FAIL_COUNTER
      00052A C8               [11]  724         ret     z
      00052B 3C               [ 4]  725         inc     a
      00052C 32 1F 0B         [13]  726         ld      (cnt_fail_trap),a
      00052F C9               [10]  727         ret
      000530                        728 check_level_finished:
      000530 2A 21 0B         [16]  729         ld      hl,(MAN_HEAD)
      000533 11 77 EC         [10]  730         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+(SCREEN_WIDTH-9)
      000536 A7               [ 4]  731         and     a
      000537 ED 52            [15]  732         sbc     hl,de
      000539 20 39            [12]  733         jr      nz,round_end
      00053B 3A 28 0B         [13]  734         ld      a,(LEVEL)
      00053E FE 08            [ 7]  735         cp      #MAX_LEVEL
      000540 28 01            [12]  736         jr      z,new_level_set
      000542 3C               [ 4]  737         inc     a
      000543                        738 new_level_set:
      000543 32 28 0B         [13]  739         ld      (LEVEL),a
      000546 21 6F EF         [10]  740         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+(15+ALIGN_MIDDLE)
      000549 22 21 0B         [16]  741         ld      (MAN_HEAD),hl
      00054C 3E 20            [ 7]  742         ld      a,#SCREEN_WIDTH
      00054E 36 CC            [10]  743         ld      (hl),#CHR_MAN_HEAD
      000550 85               [ 4]  744         add     a,l
      000551 6F               [ 4]  745         ld      l,a
      000552 36 A1            [10]  746         ld      (hl),#CHR_MAN_STAY
      000554 21 1F 0B         [10]  747         ld      hl,#cnt_fail_trap
      000557 3E 02            [ 7]  748         ld      a,#INITIAL_FAIL_COUNTER
      000559 77               [ 7]  749         ld      (hl),a
      00055A 21 20 0B         [10]  750         ld      hl,#cnt_fail_jump
      00055D 77               [ 7]  751         ld      (hl),a
      00055E 21 75 EC         [10]  752         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+(SCREEN_WIDTH-11)
      000561 36 F8            [10]  753         ld      (hl),#CHR_LINE_TOP
      000563 23               [ 6]  754         inc     hl
      000564 36 95            [10]  755         ld      (hl),#CHR_ARROW_RIGHT_TOP
      000566 23               [ 6]  756         inc     hl
      000567 36 20            [10]  757         ld      (hl),#' '
      000569 21 95 EC         [10]  758         ld      hl,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH++(SCREEN_WIDTH-11)
      00056C 36 9E            [10]  759         ld      (hl),#CHR_LINE_BOTTOM
      00056E 23               [ 6]  760         inc     hl
      00056F 36 93            [10]  761         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      000571 23               [ 6]  762         inc     hl
      000572 36 20            [10]  763         ld      (hl),#' '
      000574                        764 round_end:
      000574 13               [ 6]  765         inc     de
      000575 13               [ 6]  766         inc     de
      000576 2A 21 0B         [16]  767         ld      hl,(MAN_HEAD)
      000579 A7               [ 4]  768         and     a
      00057A ED 52            [15]  769         sbc     hl,de
      00057C 3E 0B            [ 7]  770         ld      a,#DELAY_COUNTER
      00057E C0               [11]  771         ret     nz
      00057F 32 24 0B         [13]  772         ld      (FAIL_DELAY),a
      000582 13               [ 6]  773         inc     de
      000583 ED 53 21 0B      [20]  774         ld      (MAN_HEAD),de
      000587 3E 20            [ 7]  775         ld      a,#' '
      000589 1B               [ 6]  776         dec     de
      00058A 12               [ 7]  777         ld      (de),a
      00058B 83               [ 4]  778         add     a,e
      00058C 5F               [ 4]  779         ld      e,a
      00058D 12               [ 7]  780         ld      (de),a
      00058E 6F               [ 4]  781         ld      l,a
      00058F 19               [11]  782         add     hl,de
      000590 36 97            [10]  783         ld      (hl),#CHR_MAN_SLEEP
      000592 23               [ 6]  784         inc     hl
      000593 36 C9            [10]  785         ld      (hl),#CHR_MAN_SLEEP_HEAD
      000595 C9               [10]  786         ret
      000596                        787 add_10_points:
      000496                        788         SET_CURSOR_DE 0 23+POSDIFF_POINTS
      000596 11 17 EC         [10]    1         ld      de,#BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS
      000599 ED 53 2B 00      [20]    2         ld      (CURSOR_POS),de
      00059D 2A 26 0B         [16]  789         ld      hl,(POINTS)
      0005A0 11 0A 00         [10]  790         ld      de,#10
      0005A3 19               [11]  791         add     hl,de
      0005A4 22 26 0B         [16]  792         ld      (POINTS),hl
      0005A7 CD B0 05         [17]  793         call    print_decimal
      0005AA 3E 20            [ 7]  794         ld      a,#' '
      0005AC 32 1C EC         [13]  795         ld      (BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS+5),a
      0005AF C9               [10]  796         ret
      0005B0                        797 print_decimal:
      0005B0 E5               [11]  798         push    hl
      0005B1 01 10 27         [10]  799         ld      bc,#10000
      0005B4 CD D6 05         [17]  800         call    get_decimal_digit
      0005B7 01 E8 03         [10]  801         ld      bc,#1000
      0005BA CD D6 05         [17]  802         call    get_decimal_digit
      0005BD 01 64 00         [10]  803         ld      bc,#100
      0005C0 CD D6 05         [17]  804         call    get_decimal_digit
      0005C3 01 0A 00         [10]  805         ld      bc,#10
      0005C6 CD D6 05         [17]  806         call    get_decimal_digit
      0005C9 01 01 00         [10]  807         ld      bc,#1
      0005CC CD D6 05         [17]  808         call    get_decimal_digit
      0004CF                        809         REMOVE_CURSOR;
      0005CF 2A 2B 00         [16]    1         ld      hl,(CURSOR_POS)
      0005D2 36 20            [10]    2         ld      (hl),#' '
      0005D4 E1               [10]  810         pop     hl
      0005D5 C9               [10]  811         ret
      0005D6                        812 get_decimal_digit:
      0005D6 AF               [ 4]  813         xor     a
      0005D7                        814 decimal_loop:
      0005D7 A7               [ 4]  815         and     a
      0005D8 ED 42            [15]  816         sbc     hl,bc
      0005DA 3C               [ 4]  817         inc     a
      0005DB D2 D7 05         [10]  818         jp      nc,decimal_loop
      0005DE 3D               [ 4]  819         dec     a
      0005DF 09               [11]  820         add     hl,bc
      0005E0 C6 30            [ 7]  821         add     a,#'0'
      0004E2                        822         OUTCH
      0005E2 E7               [11]    1         rst     0x20
      0005E3 00                       2         .db     0x00              ;OUTCH
      0005E4 C9               [10]  823         ret
      0005E5                        824 no_lives::
      0004E5                        825         PRST7
      0005E5 E7               [11]    1         rst     0x20
      0005E6 02                       2         .db     0x02              ;PRTST7
      0005E7 0C A0                  826         .db     0x0c,0xa0
      0005E9 21 CA 0B         [10]  827         ld      hl,#TXT_GAME_OVER
      0005EC 11 49 EC         [10]  828         ld      de,#POS_GAME_OVER
      0005EF 01 0F 00         [10]  829         ld      bc,#TXT_GAME_OVER_size
      0005F2 ED B0            [21]  830         ldir
      0005F4 0E 50            [ 7]  831         ld      c,#3*SCREEN_WIDTH-TXT_GAME_OVER_size-1+POSDIFF_YOUR_SCORE
      0005F6 7B               [ 4]  832         ld      a,e
      0005F7 81               [ 4]  833         add     a,c
      0005F8 5F               [ 4]  834         ld      e,a
      0005F9 0E 0C            [ 7]  835         ld      c,#TXT_YOUR_SCORE_size
      0005FB ED B0            [21]  836         ldir
      0005FD 0E 37            [ 7]  837         ld      c,#2*SCREEN_WIDTH-TXT_YOUR_SCORE_size+3
      0005FF 7B               [ 4]  838         ld      a,e
      000600 81               [ 4]  839         add     a,c
      000601 5F               [ 4]  840         ld      e,a
      000602 0E 09            [ 7]  841         ld      c,#TXT_HAZARD_size
      000604 ED B0            [21]  842         ldir
      000606 21 E0 ED         [10]  843         ld      hl,#BWS+15*SCREEN_WIDTH+0+(3*POSDIFF_YOUR_SCORE)
      000609 36 A0            [10]  844         ld      (hl),#CHR_MIDDLE_LINE
      00060B 11 E1 ED         [10]  845         ld      de,#BWS+15*SCREEN_WIDTH+1+(3*POSDIFF_YOUR_SCORE)
      00060E 0E 1F            [ 7]  846         ld      c,#SCREEN_WIDTH-1
      000610 ED B0            [21]  847         ldir
      000612 2A 26 0B         [16]  848         ld      hl,(POINTS)
      000515                        849         SET_CURSOR_DE (5-POSDIFF_YOUR_SCORE_DY) (21+ALIGN_MIDDLE)
      000615 11 B5 EC         [10]    1         ld      de,#BWS+(5-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+(21+ALIGN_MIDDLE)
      000618 ED 53 2B 00      [20]    2         ld      (CURSOR_POS),de
      00061C CD B0 05         [17]  850         call    print_decimal
      00061F 3A 28 0B         [13]  851         ld      a,(LEVEL)
      000622 C6 2F            [ 7]  852         add     a,#'0'-1
      000624 32 F7 EC         [13]  853         ld      (BWS+7*SCREEN_WIDTH+23+ALIGN_MIDDLE+3*POSDIFF_YOUR_SCORE),a
      000627 ED 5B AC 0B      [20]  854         ld      de,(HIGH_SCORE_TABLE01.points)
      00062B A7               [ 4]  855         and     a
      00062C ED 52            [15]  856         sbc     hl,de
      00062E D4 58 07         [17]  857         call    nc,draw_new_highscore_box
      000531                        858         SET_CURSOR_HL (17-POSDIFF_YOUR_SCORE_DY) (3+ALIGN_MIDDLE)
      000631 21 23 EE         [10]    1         ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+(3+ALIGN_MIDDLE)
      000634 22 2B 00         [16]    2         ld      (CURSOR_POS),hl
      000537                        859         PRST7
      000637 E7               [11]    1         rst     0x20
      000638 02                       2         .db     0x02              ;PRTST7
      000639 20 49 4E 50 55 54 20   860         .ascis ' INPUT YOUR INITIALS: __ '
             59 4F 55 52 20 49 4E
             49 54 49 41 4C 53 3A
             20 5F 5F A0
                                    861         ; remove 2xcursor
      000652 21 3C EE         [10]  862         ld      hl,#BWS+17*SCREEN_WIDTH+28
      000655 36 20            [10]  863         ld      (hl),#' '
      000657 21 01 EC         [10]  864         ld      hl,#BWS+0*SCREEN_WIDTH+1
      00065A 36 20            [10]  865         ld      (hl),#' '
      00065C 21 39 EE         [10]  866         ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+25+ALIGN_MIDDLE
      00055F                        867         CURSOR_DISABLE
      00055F                        868         INCH
      00065F E7               [11]    1         rst     0x20
      000660 01                       2         .db     0x01              ;INCH
      000661 77               [ 7]  869         ld      (hl),a
      000662 32 C8 0B         [13]  870         ld      (INITIALS),a
      000665 23               [ 6]  871         inc     hl
      000566                        872         INCH
      000666 E7               [11]    1         rst     0x20
      000667 01                       2         .db     0x01              ;INCH
      000668 77               [ 7]  873         ld      (hl),a
      000669 32 C9 0B         [13]  874         ld      (INITIALS+1),a
      00066C ED 5B 26 0B      [20]  875         ld      de,(POINTS)
      000670 06 05            [ 7]  876         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      000672 2A AC 0B         [16]  877         ld      hl,(HIGH_SCORE_TABLE01.points)
      000675 A7               [ 4]  878         and     a
      000676 ED 52            [15]  879         sbc     hl,de
      000678 DA 27 07         [10]  880         jp      c,insert_score
      00067B 05               [ 4]  881         dec     b
      00067C 2A B1 0B         [16]  882         ld      hl,(HIGH_SCORE_TABLE02.points)
      00067F A7               [ 4]  883         and     a
      000680 ED 52            [15]  884         sbc     hl,de
      000682 DA 27 07         [10]  885         jp      c,insert_score
      000685 05               [ 4]  886         dec     b
      000686 2A B6 0B         [16]  887         ld      hl,(HIGH_SCORE_TABLE03.points)
      000689 A7               [ 4]  888         and     a
      00068A ED 52            [15]  889         sbc     hl,de
      00068C DA 27 07         [10]  890         jp      c,insert_score
      00068F 05               [ 4]  891         dec     b
      000690 2A BB 0B         [16]  892         ld      hl,(HIGH_SCORE_TABLE04.points)
      000693 A7               [ 4]  893         and     a
      000694 ED 52            [15]  894         sbc     hl,de
      000696 DA 27 07         [10]  895         jp      c,insert_score
      000699 05               [ 4]  896         dec     b
      00069A 2A C0 0B         [16]  897         ld      hl,(HIGH_SCORE_TABLE05.points)
      00069D A7               [ 4]  898         and     a
      00069E ED 52            [15]  899         sbc     hl,de
      0006A0 DA 27 07         [10]  900         jp      c,insert_score
      0006A3                        901 print_highscore_table::
      0006A3 06 05            [ 7]  902         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      0006A5 11 AA 0B         [10]  903         ld      de,#HIGH_SCORE_TABLE01
      0006A8 21 86 EE         [10]  904         ld      hl,#BWS+(20-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+6+ALIGN_MIDDLE
      0006AB                        905 print_highscore_entry:
      0006AB 3E 36            [ 7]  906         ld      a,#'6'
      0006AD 90               [ 4]  907         sub     b
      0006AE 77               [ 7]  908         ld      (hl),a
      0006AF 1A               [ 7]  909         ld      a,(de)
      0006B0 23               [ 6]  910         inc     hl
      0006B1 23               [ 6]  911         inc     hl
      0006B2 23               [ 6]  912         inc     hl
      0006B3 77               [ 7]  913         ld      (hl),a
      0006B4 23               [ 6]  914         inc     hl
      0006B5 13               [ 6]  915         inc     de
      0006B6 1A               [ 7]  916         ld      a,(de)
      0006B7 77               [ 7]  917         ld      (hl),a
      0006B8 3E 2E            [ 7]  918         ld      a,#'.'
      0006BA 23               [ 6]  919         inc     hl
      0006BB 23               [ 6]  920         inc     hl
      0006BC 77               [ 7]  921         ld      (hl),a
      0006BD 23               [ 6]  922         inc     hl
      0006BE 77               [ 7]  923         ld      (hl),a
      0006BF 23               [ 6]  924         inc     hl
      0006C0 77               [ 7]  925         ld      (hl),a
      0006C1 23               [ 6]  926         inc     hl
      0006C2 23               [ 6]  927         inc     hl
      0005C3                        928         SET_CURSOR
      0006C3 22 2B 00         [16]    1         ld      (CURSOR_POS),hl
      0006C6 13               [ 6]  929         inc     de
      0006C7 1A               [ 7]  930         ld      a,(de)
      0006C8 6F               [ 4]  931         ld      l,a
      0006C9 13               [ 6]  932         inc     de
      0006CA 1A               [ 7]  933         ld      a,(de)
      0006CB 67               [ 4]  934         ld      h,a
      0006CC 13               [ 6]  935         inc     de
      0006CD C5               [11]  936         push    bc
      0006CE D5               [11]  937         push    de
      0006CF CD B0 05         [17]  938         call    print_decimal
      0006D2 D1               [10]  939         pop     de
      0006D3 C1               [10]  940         pop     bc
      0005D4                        941         REMOVE_CURSOR
      0006D4 2A 2B 00         [16]    1         ld      hl,(CURSOR_POS)
      0006D7 36 20            [10]    2         ld      (hl),#' '
      0006D9 23               [ 6]  942         inc     hl
      0006DA 23               [ 6]  943         inc     hl
      0006DB 23               [ 6]  944         inc     hl
      0006DC 36 30            [10]  945         ld      (hl),#'0'
      0006DE 23               [ 6]  946         inc     hl
      0006DF 1A               [ 7]  947         ld      a,(de)
      0006E0 C6 2F            [ 7]  948         add     a,#'0'-1
      0006E2 77               [ 7]  949         ld      (hl),a
      0006E3 13               [ 6]  950         inc     de
      0006E4 3E 0D            [ 7]  951         ld      a,#SCREEN_WIDTH-19
      0006E6 85               [ 4]  952         add     a,l
      0006E7 6F               [ 4]  953         ld      l,a
      0006E8 3E 00            [ 7]  954         ld      a,#ZERO
      0006EA 8C               [ 4]  955         adc     a,h
      0006EB 67               [ 4]  956         ld      h,a
      0006EC 10 BD            [13]  957         djnz    print_highscore_entry
      0005EE                        958         SET_CURSOR_HL (29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY) (9+ALIGN_MIDDLE)
      0006EE 21 A9 EF         [10]    1         ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+(9+ALIGN_MIDDLE)
      0006F1 22 2B 00         [16]    2         ld      (CURSOR_POS),hl
      0005F4                        959         PRST7
      0006F4 E7               [11]    1         rst     0x20
      0006F5 02                       2         .db     0x02              ;PRTST7
      0006F6 4E 45 57 20 47 41 4D   960         .ascii  'NEW GAME ? Y/N'
             45 20 3F 20 59 2F 4E
      000704 A0                     961         .db     0xa0
      000705 21 B8 EF         [10]  962         ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000708 36 20            [10]  963         ld      (hl),#' '
      00070A                        964         CURSOR_DISABLE
      00070A                        965 m_070a:
      00060A                        966 ask_exit_game:
      00060A                        967         INCH
      00070A E7               [11]    1         rst     0x20
      00070B 01                       2         .db     0x01              ;INCH
      00070C FE 59            [ 7]  968         cp      #'Y'
      00070E CA 81 01         [10]  969         jp      z,new_game
      000711 FE 4E            [ 7]  970         cp      #'N'
      000713 20 F5            [12]  971         jr      nz,ask_exit_game
      000715                        972 exit_game:
      000615                        973         PRST7
      000715 E7               [11]    1         rst     0x20
      000716 02                       2         .db     0x02              ;PRTST7
      000717 0C                     974         .db     0x0c
      000718 4A 75 6D 70 69 6E 67   975         .ascii  'Jumping Jack'
             20 4A 61 63 6B
      000724 0D 8D                  976         .db     0x0d,0x8d
      000626                        977         END_PROGRAM
      000726 FF               [11]    1         rst     0x38
      000727                        978 insert_score:
      000727 D5               [11]  979         push    de
      000728 11 C3 0B         [10]  980         ld      de,#HIGH_SCORE_TABLE_TMP
      00072B 21 BE 0B         [10]  981         ld      hl,#HIGH_SCORE_TABLE05
      00072E                        982 move_table_entry:
      00072E C5               [11]  983         push    bc
      00072F 01 05 00         [10]  984         ld      bc,#HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05
      000732 ED B0            [21]  985         ldir
      000734 EB               [ 4]  986         ex      de,hl
      000735 0E 0A            [ 7]  987         ld      c,#2*(HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05)
      000737 A7               [ 4]  988         and     a
      000738 ED 42            [15]  989         sbc     hl,bc
      00073A EB               [ 4]  990         ex      de,hl
      00073B A7               [ 4]  991         and     a
      00073C ED 42            [15]  992         sbc     hl,bc
      00073E C1               [10]  993         pop     bc
      00073F 10 ED            [13]  994         djnz    move_table_entry
      000741 3A C8 0B         [13]  995         ld      a,(INITIALS)
      000744 12               [ 7]  996         ld      (de),a
      000745 13               [ 6]  997         inc     de
      000746 3A C9 0B         [13]  998         ld      a,(INITIALS+1)
      000749 12               [ 7]  999         ld      (de),a
      00074A EB               [ 4] 1000         ex      de,hl
      00074B D1               [10] 1001         pop     de
      00074C 23               [ 6] 1002         inc     hl
      00074D 73               [ 7] 1003         ld      (hl),e
      00074E 23               [ 6] 1004         inc     hl
      00074F 72               [ 7] 1005         ld      (hl),d
      000750 23               [ 6] 1006         inc     hl
      000751 3A 28 0B         [13] 1007         ld      a,(LEVEL)
      000754 77               [ 7] 1008         ld      (hl),a
      000755 C3 A3 06         [10] 1009         jp      print_highscore_table
      000758                       1010 draw_new_highscore_box:
      000758 21 27 ED         [10] 1011         ld      hl,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      00075B 36 2A            [10] 1012         ld      (hl),#'*'
      00075D 11 28 ED         [10] 1013         ld      de,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+8+ALIGN_MIDDLE
      000760 01 11 00         [10] 1014         ld      bc,#TXT_NEW_HIGH_SCORE_size-1
      000763 ED B0            [21] 1015         ldir
      000765 0E 6F            [ 7] 1016         ld      c,#4*SCREEN_WIDTH-TXT_NEW_HIGH_SCORE_size+1
      000767 09               [11] 1017         add     hl,bc
      000768 EB               [ 4] 1018         ex      de,hl
      000769 09               [11] 1019         add     hl,bc
      00076A EB               [ 4] 1020         ex      de,hl
      00076B 0E 11            [ 7] 1021         ld      c,#TXT_NEW_HIGH_SCORE_size-1
      00076D 36 2A            [10] 1022         ld      (hl),#'*'
      00076F ED B0            [21] 1023         ldir
      000771 11 67 ED         [10] 1024         ld      de,#BWS+(11-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      000774 21 EE 0B         [10] 1025         ld      hl,#TXT_NEW_HIGH_SCORE
      000777 0E 12            [ 7] 1026         ld      c,#TXT_NEW_HIGH_SCORE_size
      000779 ED B0            [21] 1027         ldir
      00077B 1E 47            [ 7] 1028         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      00077D 3E 2A            [ 7] 1029         ld      a,#'*'
      00077F 12               [ 7] 1030         ld      (de),a
      000780 1E 58            [ 7] 1031         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000782 12               [ 7] 1032         ld      (de),a
      000783 1E 87            [ 7] 1033         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      000785 12               [ 7] 1034         ld      (de),a
      000786 1E 98            [ 7] 1035         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      000788 12               [ 7] 1036         ld      (de),a
      000789 C9               [10] 1037         ret
      00078A                       1038 TOP_IMAGE:
                                   1039         ; line 1
      00068A                       1040         SCREEN_POS
      00078A AE 9E 9E 9E 9E 9E 9E  1041         .db     0xae,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e ;........
             9E
      000792 9E 9E AD 20 20 20 20  1042         .db     0x9e,0x9e,0xad,0x20,0x20,0x20,0x20,0x20 ;..-     
             20
      00079A 20 20 20 20 20 20 20  1043         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0007A2 20 20 20 20 20 20 20  1044         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0006AA                       1045         SCREEN_POS
                                   1046         
                                   1047         ; line 2
      0006AA                       1048         SCREEN_POS
      0007AA 9F B9 B6 B3 B2 B6 B8  1049         .db     0x9f,0xb9,0xb6,0xb3,0xb2,0xb6,0xb8,0x20 ;.963268 
             20
      0007B2 BD B0 C0 20 20 20 20  1050         .db     0xbd,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;=0@     
             20
      0007BA 20 20 20 20 20 20 20  1051         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      0007C2 20 20 20 20 20 20 20  1052         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0006CA                       1053         SCREEN_POS
                                   1054 
                                   1055         ; line 3
      0006CA                       1056         SCREEN_POS
      0007CA 9F B8 B7 20 B5 20 20  1057         .db     0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
             20
      0007D2 B5 20 C0 20 20 20 20  1058         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      0007DA 20 20 20 20 20 20 20  1059         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      0007E2 20 20 20 20 B7 B7 20  1060         .db     0x20,0x20,0x20,0x20,0xb7,0xb7,0x20,0x20 ;    77  
             20
      0006EA                       1061         SCREEN_POS
                                   1062 
                                   1063         ; line 4
      0006EA                       1064         SCREEN_POS
      0007EA 9F B3 20 B4 B5 20 B2  1065         .db     0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
             20
      0007F2 B5 20 C0 20 20 20 20  1066         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      0007FA 20 20 20 20 20 20 20  1067         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000802 B6 B7 20 B9 B2 B2 B8  1068         .db     0xb6,0xb7,0x20,0xb9,0xb2,0xb2,0xb8,0x20 ;67 9228 
             20
      00070A                       1069         SCREEN_POS
                                   1070 
                                   1071         ; line 5
      00070A                       1072         SCREEN_POS
      00080A 9F B1 B6 20 20 B6 B0  1073         .db     0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
             20
      000812 B6 B0 C0 20 20 20 20  1074         .db     0xb6,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;60@     
             20
      00081A 20 20 B2 B3 20 20 20  1075         .db     0x20,0x20,0xb2,0xb3,0x20,0x20,0x20,0x20 ;  23    
             20
      000822 20 BA A0 B4 B4 A0 B5  1076         .db     0x20,0xba,0xa0,0xb4,0xb4,0xa0,0xb5,0x20 ; : 44 5 
             20
      00072A                       1077         SCREEN_POS
                                   1078 
                                   1079         ; line 6
      00072A                       1080         SCREEN_POS
      00082A 9F 70 72 65 73 65 6E  1081         .db     0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
             74
      000832 73 3A C0 20 20 20 20  1082         .db     0x73,0x3a,0xc0,0x20,0x20,0x20,0x20,0x20 ;s:@     
             20
      00083A 20 B2 B0 B1 B3 20 20  1083         .db     0x20,0xb2,0xb0,0xb1,0xb3,0x20,0x20,0xb7 ; 2013  7
             B7
      000842 B6 B1 B3 B8 B1 B1 B9  1084         .db     0xb6,0xb1,0xb3,0xb8,0xb1,0xb1,0xb9,0x20 ;6138119 
             20
      00074A                       1085         SCREEN_POS
                                   1086 
                                   1087         ; line 7
      00074A                       1088         SCREEN_POS
      00084A AB F8 F8 F8 F8 F8 F8  1089         .db     0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
             F8
      000852 F8 F8 AC 20 20 20 20  1090         .db     0xf8,0xf8,0xac,0x20,0x20,0x20,0x20,0x20 ;xx,     
             20
      00085A 20 B0 20 20 B5 B7 B6  1091         .db     0x20,0xb0,0x20,0x20,0xb5,0xb7,0xb6,0x20 ; 0  576 
             20
      000862 20 20 B1 B3 B6 BC 20  1092         .db     0x20,0x20,0xb1,0xb3,0xb6,0xbc,0x20,0x20 ;  136<  
             20
      00076A                       1093         SCREEN_POS
                                   1094 
                                   1095         ; line 8
      00076A                       1096         SCREEN_POS
      00086A 20 20 20 20 20 20 20  1097         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000872 20 20 20 20 20 20 20  1098         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00087A B1 B6 B6 B6 B6 20 20  1099         .db     0xb1,0xb6,0xb6,0xb6,0xb6,0x20,0x20,0x20 ;16666   
             20
      000882 20 20 20 B1 B9 20 20  1100         .db     0x20,0x20,0x20,0xb1,0xb9,0x20,0x20,0x20 ;   19   
             20
      00078A                       1101          SCREEN_POS
                                   1102 
                                   1103         ; line 9
      00078A                       1104         Z1013_LINE
      00088A 20 20 20 20 20 20 20     1         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000892 20 20 20 20 20 20 20     2         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00089A 20 20 20 20 20 20 20     3         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008A2 20 20 20 20 20 20 20     4         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
                                   1105 
                                   1106         ; line 10
      0007AA                       1107         Z1013_LINE
      0008AA 20 20 20 20 20 20 20     1         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008B2 20 20 20 20 20 20 20     2         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008BA 20 20 20 20 20 20 20     3         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008C2 20 20 20 20 20 20 20     4         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
                                   1108 
                                   1109         ; line 11
      0007CA                       1110         SCREEN_POS
      0008CA 20 20 20 20 20 20 20  1111         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008D2 20 20 20 20 20 20 20  1112         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008DA 20 20 20 20 20 20 20  1113         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008E2 20 20 20 20 20 20 20  1114         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0007EA                       1115          SCREEN_POS
                                   1116 
                                   1117         ; line 12
      0007EA                       1118         SCREEN_POS
      0008EA 20 20 20 B4 20 20 20  1119         .db     0x20,0x20,0x20,0xb4,0x20,0x20,0x20,0x20 ;   4    
             20
      0008F2 20 20 20 20 B0 20 20  1120         .db     0x20,0x20,0x20,0x20,0xb0,0x20,0x20,0x20 ;    0   
             20
      0008FA 20 20 20 20 20 20 B4  1121         .db     0x20,0x20,0x20,0x20,0x20,0x20,0xb4,0x20 ;      4 
             20
      000902 20 20 20 20 B4 B2 20  1122         .db     0x20,0x20,0x20,0x20,0xb4,0xb2,0x20,0x20 ;    42  
             20
      00080A                       1123          SCREEN_POS
                                   1124 
                                   1125         ; line 13
      00080A                       1126         SCREEN_POS
      00090A 20 20 20 B4 B4 B5 B5  1127         .db     0x20,0x20,0x20,0xb4,0xb4,0xb5,0xb5,0xbd ;   4455=
             BD
      000912 BD B5 B6 B3 B4 BC BD  1128         .db     0xbd,0xb5,0xb6,0xb3,0xb4,0xbc,0xbd,0xb2 ;=5634<=2
             B2
      00091A B6 B3 20 20 20 20 B4  1129         .db     0xb6,0xb3,0x20,0x20,0x20,0x20,0xb4,0xb1 ;63    41
             B1
      000922 B8 B2 B6 B3 BB B0 20  1130         .db     0xb8,0xb2,0xb6,0xb3,0xbb,0xb0,0x20,0x20 ;8263;0  
             20
      00082A                       1131          SCREEN_POS
                                   1132 
                                   1133         ; line 14
      00082A                       1134         SCREEN_POS
      00092A 20 B3 20 B4 B4 B5 B5  1135         .db     0x20,0xb3,0x20,0xb4,0xb4,0xb5,0xb5,0xb5 ; 3 44555
             B5
      000932 B5 B5 B7 B0 B4 B4 B5  1136         .db     0xb5,0xb5,0xb7,0xb0,0xb4,0xb4,0xb5,0xb1 ;55704451
             B1
      00093A B7 B4 20 20 B3 20 B4  1137         .db     0xb7,0xb4,0x20,0x20,0xb3,0x20,0xb4,0xb9 ;74  3 49
             B9
      000942 BD B5 20 B3 B4 B8 20  1138         .db     0xbd,0xb5,0x20,0xb3,0xb4,0xb8,0x20,0x20 ;=5 348  
             20
      00084A                       1139          SCREEN_POS
                                   1140 
                                   1141         ; line 15
      00084A                       1142         SCREEN_POS
      00094A 20 B8 B7 B0 B1 B0 B1  1143         .db     0x20,0xb8,0xb7,0xb0,0xb1,0xb0,0xb1,0xb1 ; 8701011
             B1
      000952 B1 B5 20 20 B0 B0 B1  1144         .db     0xb1,0xb5,0x20,0x20,0xb0,0xb0,0xb1,0xb1 ;15  0011
             B1
      00095A B7 B0 20 20 B8 B7 B0  1145         .db     0xb7,0xb0,0x20,0x20,0xb8,0xb7,0xb0,0xb1 ;70  8701
             B1
      000962 B6 20 B6 20 B0 20 B0  1146         .db     0xb6,0x20,0xb6,0x20,0xb0,0x20,0xb0,0x20 ;6 6 0 0 
             20
      00086A                       1147          SCREEN_POS
                                   1148 
                                   1149         ; line 16
      00086A                       1150         SCREEN_POS
      00096A 20 20 20 20 20 20 20  1151         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000972 20 20 20 20 20 20 20  1152         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00097A 20 20 20 20 20 20 20  1153         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000982 20 20 20 20 20 20 20  1154         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00098A                       1155         SCREEN_POS
                                   1156 
      00088A                       1157 HINT_RIGHT:
      00098A 2D 3E 20 2E 2E 2E 20  1158         .db     0x2d,0x3e,0x20,0x2e,0x2e,0x2e,0x20,0x52 ;-> ... R
             52
      000992 69 67 68 74           1159         .db     0x69,0x67,0x68,0x74                     ;ight
      000996                       1160 HINT_LEFT:
      000996 3C 2D 20 2E 2E 2E 2E  1161         .db     0x3c,0x2d,0x20,0x2e,0x2e,0x2e,0x2e,0x20 ;<- .... 
             20
      00099E 4C 65 66 74           1162         .db     0x4c,0x65,0x66,0x74                     ;Left
      0009A2                       1163 HINT_JUMP:
      0009A2 53 50 20 2E 2E 2E 2E  1164         .ascii  'SP .... Jump'
             20 4A 75 6D 70
      0009AE                       1165 HINT_PLAY:
      0009AE 50 20 2E 2E 2E 2E 2E  1166         .ascii  'P ..... Play'
             20 50 6C 61 79
      0009BA                       1167 HINT_EXIT:
      0009BA 45 20 2E 2E 2E 2E 2E  1168         .ascii  'E ..... Exit'
             20 45 78 69 74
      0009C6                       1169 HINT_COPYRIGHT:
      0009C6 43 20 31 39 38 36 20  1170         .ascii  'C 1986 Software Center Ilmenau'
             53 6F 66 74 77 61 72
             65 20 43 65 6E 74 65
             72 20 49 6C 6D 65 6E
             61 75
      0009E4                       1171 HINT_NAME:
      0009E4 47 2E 46 69 73 63 68  1172         .ascii  'G.Fischer & CO'
             65 72 20 26 20 43 4F
      0009F2                       1173 HINT_YEAR:
      0009F2 20 20 32 30 32 30 20  1174         .ascii  '  2020 Version'
             56 65 72 73 69 6F 6E
      000A00                       1175 VERSION_INFO:
      000A00 20 31 2E 31 20        1176         .db     0x20,0x31,0x2e,0x31,0x20                ; 1.1 
      000A05                       1177 LINE_BUFFER:
      000A05 EE EE EE EE EE EE EE  1178         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A0D EE EE EE EE EE EE EE  1179         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A15 EE EE EE EE EE EE EE  1180         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A1D EE EE EE EE EE EE EE  1181         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A25 EE EE EE EE EE EE EE  1182         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A2D EE EE EE EE EE EE EE  1183         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A35 EE EE EE EE EE EE EE  1184         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A3D EE EE EE EE EE EE EE  1185         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A45 20 20 20 EE EE EE EE  1186         .db     0x20,0x20,0x20,0xee,0xee,0xee,0xee,0xee ;   nnnnn
             EE
      000A4D EE EE EE EE EE EE EE  1187         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A55 EE EE EE EE EE 20 20  1188         .db     0xee,0xee,0xee,0xee,0xee,0x20,0x20,0x20 ;nnnnn   
             20
      000A5D 20 20 EE EE EE EE EE  1189         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000A65 EE EE EE EE EE EE EE  1190         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A6D EE 20 20 20 EE EE EE  1191         .db     0xee,0x20,0x20,0x20,0xee,0xee,0xee,0xee ;n   nnnn
             EE
      000A75 EE EE EE EE EE EE EE  1192         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A7D EE EE EE 20 20 20 EE  1193         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000A85 EE EE EE EE EE EE EE  1194         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A8D EE EE EE EE 20 20 20  1195         .db     0xee,0xee,0xee,0xee,0x20,0x20,0x20,0xee ;nnnn   n
             EE
      000A95 EE EE EE EE EE EE EE  1196         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0x20 ;nnnnnnn 
             20
      000A9D 20 20 EE EE EE EE EE  1197         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000AA5 EE EE EE 20 20 20 EE  1198         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000AAD EE EE EE EE EE EE EE  1199         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AB5 EE EE EE EE EE EE EE  1200         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000ABD EE EE EE EE EE EE EE  1201         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AC5 EE EE EE 20 20 20 EE  1202         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000ACD EE EE EE EE EE EE EE  1203         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AD5 EE EE EE EE EE EE EE  1204         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000ADD EE EE EE EE EE EE 20  1205         .db     0xee,0xee,0xee,0xee,0xee,0xee,0x20,0x20 ;nnnnnn  
             20
      000AE5 20 EE EE EE EE EE EE  1206         .db     0x20,0xee,0xee,0xee,0xee,0xee,0xee,0xee ; nnnnnnn
             EE
      000AED EE EE EE EE EE EE EE  1207         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AF5 EE EE EE EE EE EE EE  1208         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AFD EE EE EE EE EE EE EE  1209         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000B05 EE EE EE EE EE EE EE  1210         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000B0D EE EE EE EE EE EE EE  1211         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee      ;nnnnnnn
                                   1212 ; unchecked data source
      000B14 EE                    1213         .db     0xee                                    ;n
      000B15                       1214 OFFSET_HOLES:
      000B15 58 7C 41 98 56        1215         .db     0x58,0x7c,0x41,0x98,0x56                ;X|A.V
      000B1A                       1216 OFFSET_HOLES_JUMP_PENALTY:
      000B1A 8B A2 68 C2 DD        1217         .db     0x8b,0xa2,0x68,0xc2,0xdd                ;."hB]
      000B1F                       1218 cnt_fail_trap:
      000B1F 05                    1219         .db     5
      000B20                       1220 cnt_fail_jump:
      000B20 05                    1221         .db     5
      000B21                       1222 MAN_HEAD:
      000B21 6E EF                 1223         .dw     BWS+(GAME_START_Y+(8-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      000B23                       1224 JUMP_DELAY:
      000B23 01                    1225         .db     1
      000B24                       1226 FAIL_DELAY:
      000B24 01                    1227         .db     1
      000B25                       1228 LIVES:
      000B25 06                    1229         .db     6
      000B26                       1230 POINTS:
      000B26 00 00                 1231         .dw     0
      000B28                       1232 LEVEL:
      000B28 01                    1233         .db     1
      000B29                       1234 counter:
      000B29 01                    1235         .db     1
      000B2A                       1236 TXT_JUMP:
      000B2A 2A 20 4A 55 4D 50 49  1237         .ascii  '* JUMPING JACK *'
             4E 47 20 4A 41 43 4B
             20 2A
      000B3A                       1238 MONSTER_PTR:
      000B3A 9F ED                 1239         .dw     BWS+(GAME_START_Y+3*3+1)*SCREEN_WIDTH-1
      000B3C E0 ED                 1240         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+0
      000B3E E1 ED                 1241         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000B40 E2 ED                 1242         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
                                   1243 
      000B42 CD EC                 1244         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
      000B44 CE EC                 1245         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+14
      000B46 CF EC                 1246         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+15
      000B48 D0 EC                 1247         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+16
                                   1248 
      000B4A E1 ED                 1249         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000B4C E2 ED                 1250         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
      000B4E E3 ED                 1251         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+3
      000B50 E4 ED                 1252         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+4
                                   1253 
      000B52 19 EF                 1254         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+25
      000B54 1A EF                 1255         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+26
      000B56 1B EF                 1256         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+27
      000B58 1C EF                 1257         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+28
                                   1258 
      000B5A CA EC                 1259         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+10
      000B5C CB EC                 1260         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+11
      000B5E CC EC                 1261         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+12
      000B60 CD EC                 1262         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
                                   1263 
      000B62 0B EF                 1264         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+11
      000B64 0C EF                 1265         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+12
      000B66 0D EF                 1266         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+13
      000B68 0E EF                 1267         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14
                                   1268 
      000B6A 15 EF                 1269         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+21
      000B6C 16 EF                 1270         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+22
      000B6E 17 EF                 1271         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+23
      000B70 18 EF                 1272         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+24
      000B72                       1273 MONSTER_IMG:
      000B72 94 90 8B 90 8B 91 97  1274         .db     0x94,0x90,0x8b,0x90,0x8b,0x91,0x97,0x91 ;........
             91
      000B7A 19 B5 20 BE 20 BF 20  1275         .db     0x19,0xb5,0x20,0xbe,0x20,0xbf,0x20,0xae ;.5 > ? .
             AE
      000B82 92 96 A0 A0 A0 A0 88  1276         .db     0x92,0x96,0xa0,0xa0,0xa0,0xa0,0x88,0xc1 ;..    .A
             C1
      000B8A 20 95 20 B7 1E FF 20  1277         .db     0x20,0x95,0x20,0xb7,0x1e,0xff,0x20,0x92 ; . 7.. .
             92
      000B92 17 8C F9 8C 1D 1F FC  1278         .db     0x17,0x8c,0xf9,0x8c,0x1d,0x1f,0xfc,0x8c ;..y...|.
             8C
      000B9A 92 96 83 82 95 93 20  1279         .db     0x92,0x96,0x83,0x82,0x95,0x93,0x20,0x20 ;......  
             20
      000BA2 20 20 20 20 20 20 20  1280         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000BAA                       1281 HIGH_SCORE_TABLE01:
      000BAA 5F 5F                 1282         .ascii '__'
      000BAC                       1283 HIGH_SCORE_TABLE01.points:
      000BAC 00 00                 1284         .dw     0
      000BAE                       1285 HIGH_SCORE_TABLE01.level:
      000BAE 01                    1286         .db     1
      000BAF                       1287 HIGH_SCORE_TABLE02:
      000BAF 5F 5F                 1288         .ascii '__'
      000BB1                       1289 HIGH_SCORE_TABLE02.points:
      000BB1 00 00                 1290         .dw     0
      000BB3                       1291 HIGH_SCORE_TABLE02.level:
      000BB3 01                    1292         .db     1
      000BB4                       1293 HIGH_SCORE_TABLE03:
      000BB4 5F 5F                 1294         .ascii '__'
      000BB6                       1295 HIGH_SCORE_TABLE03.points:
      000BB6 00 00                 1296         .dw     0
      000BB8                       1297 HIGH_SCORE_TABLE03.level:
      000BB8 01                    1298         .db     1
      000BB9                       1299 HIGH_SCORE_TABLE04:
      000BB9 5F 5F                 1300         .ascii '__'
      000BBB                       1301 HIGH_SCORE_TABLE04.points:
      000BBB 00 00                 1302         .dw     0
      000BBD                       1303 HIGH_SCORE_TABLE04.level:
      000BBD 01                    1304         .db     1
      000BBE                       1305 HIGH_SCORE_TABLE05:
      000BBE 5F 5F                 1306         .ascii '__'
      000BC0                       1307 HIGH_SCORE_TABLE05.points:
      000BC0 00 00                 1308         .dw     0
      000BC2                       1309 HIGH_SCORE_TABLE05.level:
      000BC2 01                    1310         .db     1
      000BC3                       1311 HIGH_SCORE_TABLE_TMP:
      000BC3 5F 5F                 1312         .ascii '__'
      000BC5                       1313 HIGH_SCORE_TABLE_TMP.points:
      000BC5 00 00                 1314         .dw     0
      000BC7                       1315 HIGH_SCORE_TABLE_TMP.level:
      000BC7 01                    1316         .db     1
      000BC8                       1317 INITIALS:
      000BC8 5F 5F                 1318         .ascii '__'
      000BCA                       1319 TXT_GAME_OVER:
      000BCA 2A 2A 20 47 41 4D 45  1320         .ascii  '** GAME OVER **'
             20 4F 56 45 52 20 2A
             2A
      000BD9                       1321 TXT_YOUR_SCORE:
      000BD9 59 4F 55 52 20 53 43  1322         .ascii  'YOUR SCORE :'
             4F 52 45 20 3A
      000BE5                       1323 TXT_HAZARD:
      000BE5 48 41 5A 41 52 44 53  1324         .ascii  'HAZARDS :'
             20 3A
      000BEE                       1325 TXT_NEW_HIGH_SCORE:
      000BEE 2A 20 4E 45 57 20 48  1326         .ascii  '* NEW HIGH SCORE *'
             49 47 48 20 53 43 4F
             52 45 20 2A
                                   1327 ; end of source

                                      1         .module jumping_jack
                                      2         .include 'platform.s'
                           000001     1 z9001                           =       1
                           000000     2 z1013                           =       0
                           000000     3 ta_alpha                        =       0
                                      4 ;
                                      5 ; z9001 specific constants
                                      6 ;
                           000005     7 BOS                             =       0x0005
                           000023     8 COUNT                           =       0x0023
                                      9 ;letztes gültiges Zeichen
                           000024    10 LAKEY                           =       0x0024
                                     11 ;Tastaturpuffer
                           000025    12 KEYBU                           =       0x0025
                           00002D    13 CURS                            =       0x002d
                                     14 ;erste zu rollende Zeile -1
                           00003B    15 P1ROL                           =       0x003b
                                     16 ;letzte zu rollende Zeile +1
                           00003C    17 P2ROL                           =       0x003c
                                     18 ;erste zu rollende Spalte -1
                           00003D    19 P3ROL                           =       0x003d
                                     20 ;letzte zu rollende Spalte +1
                           00003E    21 P4ROL                           =       0x003e
                           00EC00    22 BWS                             =       0xec00
                           00F003    23 WBOOT                           =       0xF003
                           00F006    24 CONST                           =       0xF006
                           00F009    25 CONIN                           =       0xF009
                           00F00C    26 COOUT                           =       0xF00C
                           00FD33    27 inkey                           =       0xFD33
                                     28 
                           000001    29 UP_CONSI                        =       1
                           000002    30 UP_CONSO                        =       2
                           000009    31 UP_PRNST                        =       9
                           00000B    32 UP_CSTS                         =       11
                           000012    33 UP_SETCU                        =       18
                                     34 ; Löschen des Cursors
                           00001D    35 UP_DCU                          =       29
                                     36 ;
                                     37 ; platform specific
                                     38 ;
                           000028    39 SCREEN_WIDTH                    =       40
                           000018    40 SCREEN_HEIGHT                   =       24
                                     41 
                           000008    42 VK_LEFT                         =       0x08
                           000009    43 VK_RIGHT                        =       0x09
                                     44 
                           0000CB    45 VK_HEART                        =       0xcb
                           0000C6    46 CHR_WALL                        =       0xc6
                           0000CC    47 CHR_MAN_HEAD                    =       0xcc
                           0000A1    48 CHR_MAN_STAY                    =       0xa1
                           00009D    49 CHR_MAN_WALK                    =       0x9d
                           000004    50 TRANSITION_MAN_WALK_STAY        =       0x04
                           0000EE    51 CHR_MOVING_LINE                 =       0xee
                           0000C4    52 VK_PLAYER                       =       0xc4
                           0000CD    53 CHR_SMOKE                       =       0xcd
                           000097    54 CHR_MAN_SLEEP                   =       0x97
                           0000C9    55 CHR_MAN_SLEEP_HEAD              =       0xc9
                           000095    56 CHR_ARROW_RIGHT_TOP             =       0x95
                           000093    57 CHR_ARROW_RIGHT_BOTTOM          =       0x93
                           0000F8    58 CHR_LINE_TOP                    =       0xf8
                           00009E    59 CHR_LINE_BOTTOM                 =       0x9e
                           0000A0    60 CHR_MIDDLE_LINE                 =       0xa0
                                     61 
                           00000E    62 TOP_LINES                       =       14
                           000230    63 TITLE_TOP_SIZE                  =       SCREEN_WIDTH*TOP_LINES
                           000010    64 MENU_TOP                        =       (TOP_LINES+2)
                           000004    65 ALIGN_MIDDLE                    =       4
                           000006    66 GAMES_LINES                     =       6
                           000002    67 GAME_START_Y                    =       2
                           004650    68 SLOW_DOWN_13066                 =       18000
                           00EF98    69 POS_LIVES                       =       BWS+23*SCREEN_WIDTH
                           00EC28    70 POS_TOP_WALL                    =       BWS+ 1*SCREEN_WIDTH
                           00EC0C    71 POS_TOP_GAME                    =       BWS+ 0*SCREEN_WIDTH+8+ALIGN_MIDDLE
                           00EC0D    72 POS_GAME_OVER                   =       BWS+ 0*SCREEN_WIDTH+9+ALIGN_MIDDLE
                           000370    73 POS_COPYRIGHT                   =       SCREEN_WIDTH*22
                           00001E    74 HINT_COPYRIGHT_size             =       0x001e
                           00000D    75 POSDIFF_NAME                    =       SCREEN_WIDTH-HINT_COPYRIGHT_size+3
                           000005    76 POSDIFF_YEAR                    =       5
                           000008    77 POSDIFF_POINTS                  =       8
                           FFFFFFD8    78 POSDIFF_YOUR_SCORE              =       -(SCREEN_WIDTH)
                           000003    79 POSDIFF_YOUR_SCORE_DY           =       3
                           000004    80 POSDIFF_HIGHSCORE_DY            =       4
                           000001    81 MONSTER_CORRECTION              =       1
                                     82 
                                     83 .macro PROGRAM_START
                                     84         jp START
                                     85         .ascii 'JUMP    '
                                     86         .dw 0
                                     87 START:
                                     88         .endm
                                     89 
                                     90 .macro SCREEN_POS
                                     91         .ascii '    '
                                     92  .endm
                                     93 
                                     94 .macro CLRSCR
                                     95         ld      c,#UP_CONSO
                                     96         ld      e,#0x0c
                                     97         call    BOS
                                     98         ld      c,#UP_DCU
                                     99         call    BOS
                                    100 .endm
                                    101 
                                    102 .macro OUTCH
                                    103         push    bc
                                    104         push    de
                                    105         ld      c,#UP_CONSO
                                    106         ld      e,a
                                    107         call    BOS
                                    108         pop     de
                                    109         pop     bc
                                    110 .endm
                                    111 
                                    112 .macro INCH
                                    113         xor     a
                                    114         ld      (KEYBU),a
                                    115         ld      c,#UP_CONSI
                                    116         call    BOS
                                    117 .endm
                                    118 
                                    119 .macro PRST7
                                    120         call    prst7
                                    121 .endm
                                    122 
                                    123 .macro INKEY
                                    124         call    inkey
                                    125         ei
                                    126 .endm
                                    127 
                                    128 .macro END_PROGRAM
                                    129         jp      WBOOT
                                    130 .endm
                                    131 
                                    132 .macro SET_CURSOR_DE    Y,X
                                    133         push    bc
                                    134         ld      de,#(Y+1)*256+(X+1)
                                    135         ld      c,#UP_SETCU
                                    136         call    BOS
                                    137         pop     bc
                                    138 .endm
                                    139 
                                    140 .macro SET_CURSOR_HL    Y,X
                                    141         push    de
                                    142         push    bc
                                    143         ld      de,#(Y+1)*256+(X+1)
                                    144         ld      h,d
                                    145         ld      l,e
                                    146         ld      c,#UP_SETCU
                                    147         call    BOS
                                    148         pop     bc
                                    149         pop     de
                                    150 .endm
                                    151 
                                    152 .macro SET_CURSOR
                                    153         call    set_cursor
                                    154 .endm
                                    155 
                                    156 .macro REMOVE_CURSOR
                                    157         ld      hl,(CURS)
                                    158         ld      (hl),#' '
                                    159         res     2,h
                                    160         res     7,(hl)
                                    161         set     2,h
                                    162 .endm
                                    163 
                                    164 .macro CURSOR_DISABLE
                                    165         push    bc
                                    166         ld      c,#UP_DCU
                                    167         call    BOS
                                    168         pop     bc
                                    169 .endm
                                    170 
                                    171 .macro Z1013_LINE
                                    172 .endm
                                    173 
                                    174 .macro TOP_IMAGE_CONTENT
                                    175  ; line 1
                                    176         SCREEN_POS
                                    177         .db     0xae,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e ;........
                                    178         .db     0x9e,0x9e,0xad,0x20,0x20,0x20,0x20,0x20 ;..-     
                                    179         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    180         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    181         SCREEN_POS
                                    182         
                                    183         ; line 2
                                    184         SCREEN_POS
                                    185         .db     0x9f,0xb9,0xb6,0xb3,0xb2,0xb6,0xb8,0x20 ;.963268 
                                    186         .db     0xbd,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;=0@     
                                    187         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
                                    188         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    189         SCREEN_POS
                                    190 
                                    191         ; line 3
                                    192         SCREEN_POS
                                    193         .db     0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
                                    194         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
                                    195         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
                                    196         .db     0x20,0x20,0x20,0x20,0xb7,0xb7,0x20,0x20 ;    77  
                                    197         SCREEN_POS
                                    198 
                                    199         ; line 4
                                    200         SCREEN_POS
                                    201         .db     0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
                                    202         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
                                    203         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    204         .db     0xb6,0xb7,0x20,0xb9,0xb2,0xb2,0xb8,0x20 ;67 9228 
                                    205         SCREEN_POS
                                    206 
                                    207         ; line 5
                                    208         SCREEN_POS
                                    209         .db     0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
                                    210         .db     0xb6,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;60@     
                                    211         .db     0x20,0x20,0xb2,0xb3,0x20,0x20,0x20,0x20 ;  23    
                                    212         .db     0x20,0xba,0xa0,0xb4,0xb4,0xa0,0xb5,0x20 ; : 44 5 
                                    213         SCREEN_POS
                                    214 
                                    215         ; line 6
                                    216         SCREEN_POS
                                    217         .db     0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
                                    218         .db     0x73,0x3a,0xc0,0x20,0x20,0x20,0x20,0x20 ;s:@     
                                    219         .db     0x20,0xb2,0xb0,0xb1,0xb3,0x20,0x20,0xb7 ; 2013  7
                                    220         .db     0xb6,0xb1,0xb3,0xb8,0xb1,0xb1,0xb9,0x20 ;6138119 
                                    221         SCREEN_POS
                                    222 
                                    223         ; line 7
                                    224         SCREEN_POS
                                    225         .db     0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
                                    226         .db     0xf8,0xf8,0xac,0x20,0x20,0x20,0x20,0x20 ;xx,     
                                    227         .db     0x20,0xb0,0x20,0x20,0xb5,0xb7,0xb6,0x20 ; 0  576 
                                    228         .db     0x20,0x20,0xb1,0xb3,0xb6,0xbc,0x20,0x20 ;  136<  
                                    229         SCREEN_POS
                                    230 
                                    231         ; line 8
                                    232         SCREEN_POS
                                    233         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    234         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    235         .db     0xb1,0xb6,0xb6,0xb6,0xb6,0x20,0x20,0x20 ;16666   
                                    236         .db     0x20,0x20,0x20,0xb1,0xb9,0x20,0x20,0x20 ;   19   
                                    237          SCREEN_POS
                                    238 
                                    239         ; line 9
                                    240         Z1013_LINE
                                    241 
                                    242         ; line 10
                                    243         Z1013_LINE
                                    244 
                                    245         ; line 11
                                    246         SCREEN_POS
                                    247         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    248         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    249         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    250         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    251          SCREEN_POS
                                    252 
                                    253         ; line 12
                                    254         SCREEN_POS
                                    255         .db     0x20,0x20,0x20,0xb4,0x20,0x20,0x20,0x20 ;   4    
                                    256         .db     0x20,0x20,0x20,0x20,0xb0,0x20,0x20,0x20 ;    0   
                                    257         .db     0x20,0x20,0x20,0x20,0x20,0x20,0xb4,0x20 ;      4 
                                    258         .db     0x20,0x20,0x20,0x20,0xb4,0xb2,0x20,0x20 ;    42  
                                    259          SCREEN_POS
                                    260 
                                    261         ; line 13
                                    262         SCREEN_POS
                                    263         .db     0x20,0x20,0x20,0xb4,0xb4,0xb5,0xb5,0xbd ;   4455=
                                    264         .db     0xbd,0xb5,0xb6,0xb3,0xb4,0xbc,0xbd,0xb2 ;=5634<=2
                                    265         .db     0xb6,0xb3,0x20,0x20,0x20,0x20,0xb4,0xb1 ;63    41
                                    266         .db     0xb8,0xb2,0xb6,0xb3,0xbb,0xb0,0x20,0x20 ;8263;0  
                                    267          SCREEN_POS
                                    268 
                                    269         ; line 14
                                    270         SCREEN_POS
                                    271         .db     0x20,0xb3,0x20,0xb4,0xb4,0xb5,0xb5,0xb5 ; 3 44555
                                    272         .db     0xb5,0xb5,0xb7,0xb0,0xb4,0xb4,0xb5,0xb1 ;55704451
                                    273         .db     0xb7,0xb4,0x20,0x20,0xb3,0x20,0xb4,0xb9 ;74  3 49
                                    274         .db     0xbd,0xb5,0x20,0xb3,0xb4,0xb8,0x20,0x20 ;=5 348  
                                    275          SCREEN_POS
                                    276 
                                    277         ; line 15
                                    278         SCREEN_POS
                                    279         .db     0x20,0xb8,0xb7,0xb0,0xb1,0xb0,0xb1,0xb1 ; 8701011
                                    280         .db     0xb1,0xb5,0x20,0x20,0xb0,0xb0,0xb1,0xb1 ;15  0011
                                    281         .db     0xb7,0xb0,0x20,0x20,0xb8,0xb7,0xb0,0xb1 ;70  8701
                                    282         .db     0xb6,0x20,0xb6,0x20,0xb0,0x20,0xb0,0x20 ;6 6 0 0 
                                    283          SCREEN_POS
                                    284 
                                    285         ; line 16
                                    286         SCREEN_POS
                                    287         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    288         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    289         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    290         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    291         SCREEN_POS
                                    292 .endm
                                    293 
                                    294 .macro MONSTER_IMG_CONTENT
                                    295         .db     0x94,0x90,0x8b,0x90,0x8b,0x91,0x97,0x91 ;........
                                    296         .db     0x19,0xb5,0x20,0xbe,0x20,0xbf,0x20,0xae ;.5 > ? .
                                    297         .db     0x92,0x96,0xa0,0xa0,0xa0,0xa0,0x88,0xc1 ;..    .A
                                    298         .db     0x20,0x95,0x20,0xb7,0x1e,0xff,0x20,0x92 ; . 7.. .
                                    299         .db     0x17,0x8c,0xf9,0x8c,0x1d,0x1f,0xfc,0x8c ;..y...|.
                                    300         .db     0x92,0x96,0x83,0x82,0x95,0x93,0x20,0x20 ;......  
                                    301         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    302 .endm
                                      3 
                                      4         .globl  _main
                                      5         .globl  sadr
                                      6         .globl  animation_delay
                                      7 ; 
                                      8 ; constant
                                      9 ; 
                           000000    10 ZERO                             = 0x00
                           000000    11 HI_ZERO                          = 0x00
                           000001    12 LEVEL_1                          = 0x01
                           00000C    13 VK_CLS                           = 0x0c
                           00005F    14 SMALL_CAPITALS                   = 0x5f
                           000020    15 CAPITALIZE                       = 0x20
                           000006    16 INITIAL_LIVES                    = 0x06
                           000001    17 INITIAL_LEVEL                    = 0x01
                           000005    18 MAX_FAIL_COUNTER                 = 0x05
                           000002    19 INITIAL_FAIL_COUNTER             = 0x02
                           000001    20 INITIAL_DELAY_COUNTER            = 0x01
                           00000B    21 DELAY_COUNTER                    = 0x0b
                           000008    22 DELAY_COUNTER2                   = 0x08
                           000004    23 DELAY_COUNTER_JUMP               = 0x04
                           000002    24 MOVE_2X_RIGHT                    = 0x02
                           000004    25 MONSTER_WIDTH                    = 0x04
                           000008    26 NUMBER_OF_LINES                  = 0x08
                           000005    27 NUMBER_HIGHSCORE_ENTRIES         = 0x05
                           000008    28 MAX_LEVEL                        = 0x08
                                     29 
                           0001FF    30 TOP_IMAGE_size                   = 0x01ff
                           000005    31 VERSION_INFO_size                = 0x0005
                           00000C    32 HINT_RIGHT_size                  = 0x000c
                           00000C    33 HINT_LEFT_size                   = 0x000c
                           00000C    34 HINT_JUMP_size                   = 0x000c
                           00000C    35 HINT_PLAY_size                   = 0x000c
                           00000C    36 HINT_EXIT_size                   = 0x000c
                           00000E    37 HINT_NAME_size                   = 0x000e
                           00000E    38 HINT_YEAR_size                   = 0x000e
                           00010F    39 LINE_BUFFER_size                 = 0x010f
                           000005    40 OFFSET_HOLES_size                = 0x0005
                           000005    41 OFFSET_HOLES_JUMP_PENALTY_size   = 0x0005
                           000010    42 TXT_JUMP_size                    = 0x0010
                           00000F    43 TXT_GAME_OVER_size               = 0x000f
                           00000C    44 TXT_YOUR_SCORE_size              = 0x000c
                           000009    45 TXT_HAZARD_size                  = 0x0009
                           000012    46 TXT_NEW_HIGH_SCORE_size          = 0x0012
                           000002    47 HIGH_SCORE_TABLE01_size          = 0x0002
                           000002    48 HIGH_SCORE_TABLE02_size          = 0x0002
                           000002    49 HIGH_SCORE_TABLE03_size          = 0x0002
                           000002    50 HIGH_SCORE_TABLE04_size          = 0x0002
                           000002    51 HIGH_SCORE_TABLE05_size          = 0x0002
                           000002    52 HIGH_SCORE_TABLE_TMP_size        = 0x0002
                           000002    53 INITIALS_size                    = 0x0002
                           000038    54 MONSTER_PTR_size                 = 0x0038
                           000038    55 MONSTER_IMG_size                 = 0x0038
                                     56 ;
                                     57 ;
                                     58 ;
      000300                         59 _main:
      000300                         60 sadr:
      000000                         61         PROGRAM_START
      000300 C3 0D 03         [10]    1         jp START
      000303 4A 55 4D 50 20 20 20     2         .ascii 'JUMP    '
             20
      00030B 00 00                    3         .dw 0
      00030D                          4 START:
      00000D                         62         CLRSCR
      00030D 0E 02            [ 7]    1         ld      c,#UP_CONSO
      00030F 1E 0C            [ 7]    2         ld      e,#0x0c
      000311 CD 05 00         [17]    3         call    BOS
      000314 0E 1D            [ 7]    4         ld      c,#UP_DCU
      000316 CD 05 00         [17]    5         call    BOS
      000319 11 00 EC         [10]   63         ld      de,#BWS
      00031C 21 FF 09         [10]   64         ld      hl,#TOP_IMAGE
      00031F 01 30 02         [10]   65         ld      bc,#TITLE_TOP_SIZE
      000322 ED B0            [21]   66         ldir
      000324 21 30 EE         [10]   67         ld      hl,#BWS+SCREEN_WIDTH*TOP_LINES
      000327 36 CB            [10]   68         ld      (hl),#VK_HEART
      000329 11 31 EE         [10]   69         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+1
      00032C 01 27 00         [10]   70         ld      bc,#SCREEN_WIDTH-1
      00032F ED B0            [21]   71         ldir
      000331 11 50 EE         [10]   72         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+(SCREEN_WIDTH-8)
      000334 21 A5 0C         [10]   73         ld      hl,#VERSION_INFO
      000337 01 05 00         [10]   74         ld      bc,#VERSION_INFO_size
      00033A ED B0            [21]   75         ldir
      00033C 11 8E EE         [10]   76         ld      de,#BWS+SCREEN_WIDTH*MENU_TOP+10+ALIGN_MIDDLE
      00033F 21 2F 0C         [10]   77         ld      hl,#HINT_RIGHT
      000342 01 0C 00         [10]   78         ld      bc,#HINT_RIGHT_size
      000345 ED B0            [21]   79         ldir
      000347 0E 1C            [ 7]   80         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000349 EB               [ 4]   81         ex      de,hl
      00034A 09               [11]   82         add     hl,bc
      00034B EB               [ 4]   83         ex      de,hl
      00034C 0E 0C            [ 7]   84         ld      c,#HINT_RIGHT_size
      00034E ED B0            [21]   85         ldir
      000350 0E 1C            [ 7]   86         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000352 EB               [ 4]   87         ex      de,hl
      000353 09               [11]   88         add     hl,bc
      000354 EB               [ 4]   89         ex      de,hl
      000355 0E 0C            [ 7]   90         ld      c,#HINT_RIGHT_size
      000357 ED B0            [21]   91         ldir
      000359 0E 1C            [ 7]   92         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      00035B EB               [ 4]   93         ex      de,hl
      00035C 09               [11]   94         add     hl,bc
      00035D EB               [ 4]   95         ex      de,hl
      00035E 0E 0C            [ 7]   96         ld      c,#HINT_RIGHT_size
      000360 ED B0            [21]   97         ldir
      000362 0E 1C            [ 7]   98         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000364 EB               [ 4]   99         ex      de,hl
      000365 09               [11]  100         add     hl,bc
      000366 EB               [ 4]  101         ex      de,hl
      000367 0E 0C            [ 7]  102         ld      c,#HINT_RIGHT_size
      000369 ED B0            [21]  103         ldir
      00036B 11 70 EF         [10]  104         ld      de,#BWS+POS_COPYRIGHT
      00036E 0E 1E            [ 7]  105         ld      c,#HINT_COPYRIGHT_size
      000370 ED B0            [21]  106         ldir
      000372 0E 0D            [ 7]  107         ld      c,#POSDIFF_NAME
      000374 EB               [ 4]  108         ex      de,hl
      000375 09               [11]  109         add     hl,bc
      000376 EB               [ 4]  110         ex      de,hl
      000377 0E 0E            [ 7]  111         ld      c,#HINT_NAME_size
      000379 ED B0            [21]  112         ldir
      00037B 0E 05            [ 7]  113         ld      c,#POSDIFF_YEAR
      00037D EB               [ 4]  114         ex      de,hl
      00037E 09               [11]  115         add     hl,bc
      00037F EB               [ 4]  116         ex      de,hl
      000380 0E 12            [ 7]  117         ld      c,#HINT_YEAR_size+VERSION_INFO_size-1
      000382 ED B0            [21]  118         ldir
      000384                        119 choose_menu:
      000384 AF               [ 4]  120         xor     a
      000085                        121         INCH
      000385 AF               [ 4]    1         xor     a
      000386 32 25 00         [13]    2         ld      (KEYBU),a
      000389 0E 01            [ 7]    3         ld      c,#UP_CONSI
      00038B CD 05 00         [17]    4         call    BOS
      00038E FE 5F            [ 7]  122         cp      #SMALL_CAPITALS
      000390 38 02            [12]  123         jr      c,capitalized
      000392 D6 20            [ 7]  124         sub     #CAPITALIZE
      000394                        125 capitalized:
      000394 FE 45            [ 7]  126         cp      #'E'
      000396 CA 87 09         [10]  127         jp      z,exit_game
      000399 FE 50            [ 7]  128         cp      #'P'
      00039B 20 E7            [12]  129         jr      nz,choose_menu
      00039D                        130 new_game:
      00009D                        131         CLRSCR
      00039D 0E 02            [ 7]    1         ld      c,#UP_CONSO
      00039F 1E 0C            [ 7]    2         ld      e,#0x0c
      0003A1 CD 05 00         [17]    3         call    BOS
      0003A4 0E 1D            [ 7]    4         ld      c,#UP_DCU
      0003A6 CD 05 00         [17]    5         call    BOS
      0003A9 21 CA 0D         [10]  132         ld      hl,#LIVES
      0003AC 36 06            [10]  133         ld      (hl),#INITIAL_LIVES
      0003AE 21 CB 0D         [10]  134         ld      hl,#POINTS
      0003B1 36 00            [10]  135         ld      (hl),#ZERO
      0003B3 23               [ 6]  136         inc     hl
      0003B4 36 00            [10]  137         ld      (hl),#ZERO
      0003B6 06 06            [ 7]  138         ld      b,#INITIAL_LIVES
      0003B8 21 98 EF         [10]  139         ld      hl,#POS_LIVES
      0003BB                        140 draw_player:
      0003BB 3E 02            [ 7]  141         ld      a,#MOVE_2X_RIGHT
      0003BD 85               [ 4]  142         add     a,l
      0003BE 6F               [ 4]  143         ld      l,a
      0003BF 36 C4            [10]  144         ld      (hl),#VK_PLAYER
      0003C1 10 F8            [13]  145         djnz    draw_player
      0003C3 3E 01            [ 7]  146         ld      a,#INITIAL_LEVEL
      0003C5 32 CD 0D         [13]  147         ld      (LEVEL),a
      0003C8 3E 02            [ 7]  148         ld      a,#INITIAL_FAIL_COUNTER
      0003CA 32 C4 0D         [13]  149         ld      (cnt_fail_trap),a
      0003CD 32 C5 0D         [13]  150         ld      (cnt_fail_jump),a
      0003D0 21 00 EC         [10]  151         ld      hl,#BWS
      0003D3 36 20            [10]  152         ld      (hl),#' '
      0003D5 11 01 EC         [10]  153         ld      de,#BWS+1
      0003D8 01 96 03         [10]  154         ld      bc,#(3+GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH-2
      0003DB ED B0            [21]  155         ldir
      0003DD 21 28 EC         [10]  156         ld      hl,#POS_TOP_WALL
      0003E0 36 C6            [10]  157         ld      (hl),#CHR_WALL
      0003E2 11 29 EC         [10]  158         ld      de,#POS_TOP_WALL+1
      0003E5 01 27 00         [10]  159         ld      bc,#SCREEN_WIDTH-1
      0003E8 ED B0            [21]  160         ldir
      0003EA 21 70 EC         [10]  161         ld      hl,#POS_TOP_WALL+2*SCREEN_WIDTH-8
      0003ED 36 C6            [10]  162         ld      (hl),#CHR_WALL
      0003EF 2B               [ 6]  163         dec     hl
      0003F0 2B               [ 6]  164         dec     hl
      0003F1 36 95            [10]  165         ld      (hl),#CHR_ARROW_RIGHT_TOP
      0003F3 2B               [ 6]  166         dec     hl
      0003F4 36 F8            [10]  167         ld      (hl),#CHR_LINE_TOP
      0003F6 21 98 EC         [10]  168         ld      hl,#POS_TOP_WALL+3*SCREEN_WIDTH-8
      0003F9 36 C6            [10]  169         ld      (hl),#CHR_WALL
      0003FB 2B               [ 6]  170         dec     hl
      0003FC 2B               [ 6]  171         dec     hl
      0003FD 36 93            [10]  172         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      0003FF 2B               [ 6]  173         dec     hl
      000400 36 9E            [10]  174         ld      (hl),#CHR_LINE_BOTTOM
      000402 21 CF 0D         [10]  175         ld      hl,#TXT_JUMP
      000405 11 0C EC         [10]  176         ld      de,#POS_TOP_GAME
      000408 01 10 00         [10]  177         ld      bc,#TXT_JUMP_size
      00040B ED B0            [21]  178         ldir
      00040D 3E 01            [ 7]  179         ld      a,#INITIAL_DELAY_COUNTER
      00040F 21 C8 0D         [10]  180         ld      hl,#JUMP_DELAY
      000412 77               [ 7]  181         ld      (hl),a
      000413 21 C9 0D         [10]  182         ld      hl,#FAIL_DELAY
      000416 77               [ 7]  183         ld      (hl),a
      000417 23               [ 6]  184         inc     hl
      000418 21 32 EF         [10]  185         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      00041B 22 C6 0D         [16]  186         ld      (MAN_HEAD),hl
      00041E 36 CC            [10]  187         ld      (hl),#CHR_MAN_HEAD
      000420 11 28 00         [10]  188         ld      de,#SCREEN_WIDTH
      000423 19               [11]  189         add     hl,de
      000424 36 A1            [10]  190         ld      (hl),#CHR_MAN_STAY
      000426                        191 animation_loop:
      000426 CD B1 04         [17]  192         call    animation_monster
      000429 CD 70 05         [17]  193         call    animation_lines
      00042C CD E0 05         [17]  194         call    animation_delay
      00042F 3A C8 0D         [13]  195         ld      a,(JUMP_DELAY)
      000432 FE 01            [ 7]  196         cp      #INITIAL_DELAY_COUNTER
      000434 20 1D            [12]  197         jr      nz,handle_jump_delay
      000436 3A C9 0D         [13]  198         ld      a,(FAIL_DELAY)
      000439 FE 01            [ 7]  199         cp      #INITIAL_DELAY_COUNTER
      00043B 20 13            [12]  200         jr      nz,handle_fail_delay
      00013D                        201         INKEY
      00043D CD 33 FD         [17]    1         call    inkey
      000440 FB               [ 4]    2         ei
      000441 FE 20            [ 7]  202         cp      #' '
      000443 CA 9D 06         [10]  203         jp      z,action_jump
      000446 FE 08            [ 7]  204         cp      #VK_LEFT
      000448 CC ED 05         [17]  205         call    z,action_left
      00044B FE 09            [ 7]  206         cp      #VK_RIGHT
      00044D CC 44 06         [17]  207         call    z,action_right
                           000000   208 .if  eq,z9001
                                    209         ;debuggin
                                    210         cp      #'U'
                                    211         jr      nz,next_cmd
                                    212         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+20
                                    213         ld      (hl),#CHR_MAN_HEAD
                                    214         ld      (MAN_HEAD),hl
                                    215         jr      handle_fail_delay
                                    216 next_cmd:
                                    217         cp      #'X'
                                    218         jr      nz,handle_fail_delay
                                    219         jp      no_lives
                                    220 .endif
      000450                        221 handle_fail_delay:
      000450 CD 01 07         [17]  222         call    check_fall_through
      000453                        223 handle_jump_delay:
      000453 3A C8 0D         [13]  224         ld      a,(JUMP_DELAY)
      000456 FE 01            [ 7]  225         cp      #INITIAL_DELAY_COUNTER
      000458 28 04            [12]  226         jr      z,jump_delay_counter_set
      00045A 3D               [ 4]  227         dec     a
      00045B 32 C8 0D         [13]  228         ld      (JUMP_DELAY),a
      00045E                        229 jump_delay_counter_set:
      00045E 3A C9 0D         [13]  230         ld      a,(FAIL_DELAY)
      000461 FE 01            [ 7]  231         cp      #INITIAL_DELAY_COUNTER
      000463 28 42            [12]  232         jr      z,player_activity
      000465 3D               [ 4]  233         dec     a
      000466 32 C9 0D         [13]  234         ld      (FAIL_DELAY),a
      000469 FE 01            [ 7]  235         cp      #INITIAL_DELAY_COUNTER
      00046B 20 3A            [12]  236         jr      nz,player_activity
      00046D 2A C6 0D         [16]  237         ld      hl,(MAN_HEAD)
                                    238         ; test for bottom line
      000470 11 D0 EE         [10]  239         ld      de,#BWS+(GAME_START_Y+3*GAMES_LINES-2)*SCREEN_WIDTH
      000473 A7               [ 4]  240         and     a
      000474 ED 52            [15]  241         sbc     hl,de
      000476 38 16            [12]  242         jr      c,player_wake_up
      000478 3A CA 0D         [13]  243         ld      a,(LIVES)
      00047B 3D               [ 4]  244         dec     a
      00047C 32 CA 0D         [13]  245         ld      (LIVES),a
      00047F 21 9A EF         [10]  246         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES+3)*SCREEN_WIDTH+2
      000482 16 00            [ 7]  247         ld      d,#HI_ZERO
      000484 87               [ 4]  248         add     a,a
      000485 5F               [ 4]  249         ld      e,a
      000486 19               [11]  250         add     hl,de
      000487 36 20            [10]  251         ld      (hl),#' '
      000489 FE 00            [ 7]  252         cp      #ZERO
      00048B CA 18 08         [10]  253         jp      z,no_lives
      00048E                        254 player_wake_up:
      00048E 2A C6 0D         [16]  255         ld      hl,(MAN_HEAD)
      000491 36 CC            [10]  256         ld      (hl),#CHR_MAN_HEAD
      000493 2B               [ 6]  257         dec     hl
      000494 3E 20            [ 7]  258         ld      a,#' '
      000496 77               [ 7]  259         ld      (hl),a
      000497 23               [ 6]  260         inc     hl
      000498 23               [ 6]  261         inc     hl
      000499 23               [ 6]  262         inc     hl
      00049A 77               [ 7]  263         ld      (hl),a
      00049B 2B               [ 6]  264         dec     hl
      00049C 11 28 00         [10]  265         ld      de,#SCREEN_WIDTH
      00049F 19               [11]  266         add     hl,de
      0004A0 77               [ 7]  267         ld      (hl),a
      0004A1 23               [ 6]  268         inc     hl
      0004A2 77               [ 7]  269         ld      (hl),a
      0004A3 2B               [ 6]  270         dec     hl
      0004A4 2B               [ 6]  271         dec     hl
      0004A5 36 9D            [10]  272         ld      (hl),#CHR_MAN_WALK
      0004A7                        273 player_activity:
      0004A7 CD 52 07         [17]  274         call    check_level_finished
      0004AA C3 26 04         [10]  275         jp      animation_loop
                                    276 ; unchecked data source
      0004AD 67 75 66 69            277         .db     0x67,0x75,0x66,0x69                     ;gufi
      0004B1                        278 animation_monster:
      0004B1 3A CD 0D         [13]  279         ld      a,(LEVEL)
      0004B4 32 CE 0D         [13]  280         ld      (counter),a
      0004B7 FE 01            [ 7]  281         cp      #LEVEL_1
      0004B9 C8               [11]  282         ret     z
      0004BA 01 DF 0D         [10]  283         ld      bc,#MONSTER_PTR
      0004BD 11 17 0E         [10]  284         ld      de,#MONSTER_IMG
      0004C0                        285 handle_one_monster:
      0004C0 0A               [ 7]  286         ld      a,(bc)
      0004C1 6F               [ 4]  287         ld      l,a
      0004C2 03               [ 6]  288         inc     bc
      0004C3 0A               [ 7]  289         ld      a,(bc)
      0004C4 67               [ 4]  290         ld      h,a
      0004C5 CD D4 04         [17]  291         call    handle_by_ptr
      0004C8 3A CE 0D         [13]  292         ld      a,(counter)
      0004CB 3D               [ 4]  293         dec     a
      0004CC 32 CE 0D         [13]  294         ld      (counter),a
      0004CF FE 01            [ 7]  295         cp      #LEVEL_1
      0004D1 C8               [11]  296         ret     z
      0004D2 18 EC            [12]  297         jr      handle_one_monster
      0004D4                        298 handle_by_ptr:
      0004D4 C5               [11]  299         push    bc
      0004D5 3E 04            [ 7]  300         ld      a,#MONSTER_WIDTH
      0004D7 D5               [11]  301         push    de
      0004D8                        302 handle_by_column:
      0004D8 36 20            [10]  303         ld      (hl),#' '
      0004DA 11 28 00         [10]  304         ld      de,#SCREEN_WIDTH
      0004DD 19               [11]  305         add     hl,de
      0004DE 36 20            [10]  306         ld      (hl),#' '
      0004E0 A7               [ 4]  307         and     a
      0004E1 ED 52            [15]  308         sbc     hl,de
      0004E3 2B               [ 6]  309         dec     hl
      0004E4 E5               [11]  310         push    hl
      0004E5 08               [ 4]  311         ex      af,af'
      0004E6 11 EF EC         [10]  312         ld      de,#BWS+(GAME_START_Y+4)*SCREEN_WIDTH-1
      0004E9 A7               [ 4]  313         and     a
      0004EA ED 52            [15]  314         sbc     hl,de
      0004EC 38 0D            [12]  315         jr      c,correct_ptr
      0004EE C5               [11]  316         push    bc
      0004EF 06 06            [ 7]  317         ld      b,#GAMES_LINES
      0004F1 11 78 00         [10]  318         ld      de,#3*SCREEN_WIDTH
      0004F4                        319 get_column:
      0004F4 A7               [ 4]  320         and     a
      0004F5 ED 52            [15]  321         sbc     hl,de
      0004F7 38 13            [12]  322         jr      c,test_column
      0004F9 10 F9            [13]  323         djnz    get_column
      0004FB                        324 correct_ptr:
      0004FB 11 27 00         [10]  325         ld      de,#SCREEN_WIDTH-1
      0004FE ED 5A            [15]  326         adc     hl,de
      000500 28 03            [12]  327         jr      z,start_from_bottom
      000502 E1               [10]  328         pop     hl
      000503 18 19            [12]  329         jr      update_pointers
      000505                        330 start_from_bottom:
      000505 E1               [10]  331         pop     hl
      000506 11 08 02         [10]  332         ld      de,#((GAMES_LINES-2)*3+1)*SCREEN_WIDTH
      000509 19               [11]  333         add     hl,de
      00050A 18 12            [12]  334         jr      update_pointers
      00050C                        335 test_column:
      00050C C1               [10]  336         pop     bc
      00050D 11 27 00         [10]  337         ld      de,#SCREEN_WIDTH-1
      000510 ED 5A            [15]  338         adc     hl,de
      000512 28 03            [12]  339         jr      z,move_one_line_up
      000514 E1               [10]  340         pop     hl
      000515 18 07            [12]  341         jr      update_pointers
      000517                        342 move_one_line_up:
      000517 E1               [10]  343         pop     hl
      000518 11 50 00         [10]  344         ld      de,#2*SCREEN_WIDTH
      00051B A7               [ 4]  345         and     a
      00051C ED 52            [15]  346         sbc     hl,de
      00051E                        347 update_pointers:
      00051E 0B               [ 6]  348         dec     bc
      00051F 7D               [ 4]  349         ld      a,l
      000520 02               [ 7]  350         ld      (bc),a
      000521 03               [ 6]  351         inc     bc
      000522 7C               [ 4]  352         ld      a,h
      000523 02               [ 7]  353         ld      (bc),a
      000524 03               [ 6]  354         inc     bc
      000525 0A               [ 7]  355         ld      a,(bc)
      000526 6F               [ 4]  356         ld      l,a
      000527 03               [ 6]  357         inc     bc
      000528 0A               [ 7]  358         ld      a,(bc)
      000529 67               [ 4]  359         ld      h,a
      00052A 08               [ 4]  360         ex      af,af'
      00052B 3D               [ 4]  361         dec     a
      00052C FE 00            [ 7]  362         cp      #ZERO
      00052E 28 02            [12]  363         jr      z,draw_monster
      000530 18 A6            [12]  364         jr      handle_by_column
      000532                        365 draw_monster:
      000532 D1               [10]  366         pop     de
      000533 C1               [10]  367         pop     bc
      000534 0B               [ 6]  368         dec     bc
      000535 3E 04            [ 7]  369         ld      a,#MONSTER_WIDTH
      000537                        370 draw_monster_segment:
      000537 08               [ 4]  371         ex      af,af'
      000538 0A               [ 7]  372         ld      a,(bc)
      000539 6F               [ 4]  373         ld      l,a
      00053A 03               [ 6]  374         inc     bc
      00053B 0A               [ 7]  375         ld      a,(bc)
      00053C 67               [ 4]  376         ld      h,a
      00053D 03               [ 6]  377         inc     bc
      00053E 1A               [ 7]  378         ld      a,(de)
      00053F 77               [ 7]  379         ld      (hl),a
      000540 13               [ 6]  380         inc     de
      000541 1A               [ 7]  381         ld      a,(de)
      000542 D5               [11]  382         push    de
      000543 11 28 00         [10]  383         ld      de,#SCREEN_WIDTH
      000546 19               [11]  384         add     hl,de
      000547 77               [ 7]  385         ld      (hl),a
      000548 CD 54 05         [17]  386         call    monster_check_crash
      00054B D1               [10]  387         pop     de
      00054C 13               [ 6]  388         inc     de
      00054D 08               [ 4]  389         ex      af,af'
      00054E 3D               [ 4]  390         dec     a
      00054F FE 00            [ 7]  391         cp      #ZERO
      000551 20 E4            [12]  392         jr      nz,draw_monster_segment
      000553 C9               [10]  393         ret
      000554                        394 monster_check_crash:
      000554 A7               [ 4]  395         and     a
      000555 ED 52            [15]  396         sbc     hl,de
      000557 EB               [ 4]  397         ex      de,hl
      000558 2A C6 0D         [16]  398         ld      hl,(MAN_HEAD)
      00055B A7               [ 4]  399         and     a
      00055C ED 52            [15]  400         sbc     hl,de
      00055E EB               [ 4]  401         ex      de,hl
      00055F C0               [11]  402         ret     nz
      000560 11 28 00         [10]  403         ld      de,#SCREEN_WIDTH
      000563 19               [11]  404         add     hl,de
      000564 23               [ 6]  405         inc     hl
      000565 36 97            [10]  406         ld      (hl),#CHR_MAN_SLEEP
      000567 23               [ 6]  407         inc     hl
      000568 36 C9            [10]  408         ld      (hl),#CHR_MAN_SLEEP_HEAD
      00056A 3E 0B            [ 7]  409         ld      a,#DELAY_COUNTER
      00056C 32 C9 0D         [13]  410         ld      (FAIL_DELAY),a
      00056F C9               [10]  411         ret
      000570                        412 animation_lines:
      000570 3E EE            [ 7]  413         ld      a,#CHR_MOVING_LINE
      000572 21 AA 0C         [10]  414         ld      hl,#LINE_BUFFER
      000575 77               [ 7]  415         ld      (hl),a
      000576 11 AB 0C         [10]  416         ld      de,#LINE_BUFFER+1
      000579 01 0E 01         [10]  417         ld      bc,#LINE_BUFFER_size-1
      00057C ED B0            [21]  418         ldir
      00057E 3A C4 0D         [13]  419         ld      a,(cnt_fail_trap)
      000581 11 BA 0D         [10]  420         ld      de,#OFFSET_HOLES
      000584 1B               [ 6]  421         dec     de
      000585                        422 loop_failed_penalty_holes:
      000585 F5               [11]  423         push    af
      000586 13               [ 6]  424         inc     de
      000587 1A               [ 7]  425         ld      a,(de)
      000588 3C               [ 4]  426         inc     a
      000589 12               [ 7]  427         ld      (de),a
      00058A 4F               [ 4]  428         ld      c,a
      00058B 06 00            [ 7]  429         ld      b,#HI_ZERO
      00058D 21 AA 0C         [10]  430         ld      hl,#LINE_BUFFER
      000590 09               [11]  431         add     hl,bc
      000591 36 20            [10]  432         ld      (hl),#' '
      000593 23               [ 6]  433         inc     hl
      000594 36 20            [10]  434         ld      (hl),#' '
      000596 23               [ 6]  435         inc     hl
      000597 36 20            [10]  436         ld      (hl),#' '
      000599 F1               [10]  437         pop     af
      00059A 3D               [ 4]  438         dec     a
      00059B 20 E8            [12]  439         jr      nz,loop_failed_penalty_holes
      00059D 3A C5 0D         [13]  440         ld      a,(cnt_fail_jump)
      0005A0 11 BF 0D         [10]  441         ld      de,#OFFSET_HOLES_JUMP_PENALTY
      0005A3 1B               [ 6]  442         dec     de
      0005A4                        443 loop_jump_penalty_holes:
      0005A4 F5               [11]  444         push    af
      0005A5 13               [ 6]  445         inc     de
      0005A6 1A               [ 7]  446         ld      a,(de)
      0005A7 3D               [ 4]  447         dec     a
      0005A8 12               [ 7]  448         ld      (de),a
      0005A9 4F               [ 4]  449         ld      c,a
      0005AA 06 00            [ 7]  450         ld      b,#HI_ZERO
      0005AC 21 AA 0C         [10]  451         ld      hl,#LINE_BUFFER
      0005AF 09               [11]  452         add     hl,bc
      0005B0 36 20            [10]  453         ld      (hl),#' '
      0005B2 23               [ 6]  454         inc     hl
      0005B3 36 20            [10]  455         ld      (hl),#' '
      0005B5 23               [ 6]  456         inc     hl
      0005B6 36 20            [10]  457         ld      (hl),#' '
      0005B8 F1               [10]  458         pop     af
      0005B9 3D               [ 4]  459         dec     a
      0005BA 20 E8            [12]  460         jr      nz,loop_jump_penalty_holes
      0005BC 3E 06            [ 7]  461         ld      a,#GAMES_LINES
      0005BE 21 AA 0C         [10]  462         ld      hl,#LINE_BUFFER
      0005C1 11 50 EC         [10]  463         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+0
      0005C4                        464 print_line:
      0005C4 01 28 00         [10]  465         ld      bc,#SCREEN_WIDTH
      0005C7 E5               [11]  466         push    hl
      0005C8 EB               [ 4]  467         ex      de,hl
      0005C9 09               [11]  468         add     hl,bc
      0005CA 09               [11]  469         add     hl,bc
      0005CB EB               [ 4]  470         ex      de,hl
      0005CC E1               [10]  471         pop     hl
      0005CD ED B0            [21]  472         ldir
      0005CF 3D               [ 4]  473         dec     a
      0005D0 20 F2            [12]  474         jr      nz,print_line
      0005D2 21 70 EF         [10]  475         ld      hl,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+0
      0005D5 11 71 EF         [10]  476         ld      de,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+1
      0005D8 01 27 00         [10]  477         ld      bc,#SCREEN_WIDTH-1
      0005DB 36 C6            [10]  478         ld      (hl),#CHR_WALL
      0005DD ED B0            [21]  479         ldir
      0005DF C9               [10]  480         ret
      0005E0                        481 animation_delay:
      0005E0 21 50 46         [10]  482         ld      hl,#SLOW_DOWN_13066
      0005E3 11 01 00         [10]  483         ld      de,#1
      0005E6 A7               [ 4]  484         and     a
      0005E7                        485 delay_loop:
      0005E7 2B               [ 6]  486         dec     hl
      0005E8 ED 52            [15]  487         sbc     hl,de
      0005EA 20 FB            [12]  488         jr      nz,delay_loop
      0005EC C9               [10]  489         ret
      0005ED                        490 action_left:
      0005ED F5               [11]  491         push    af
      0005EE 2A C6 0D         [16]  492         ld      hl,(MAN_HEAD)
      0005F1 7E               [ 7]  493         ld      a,(hl)
      0005F2 36 20            [10]  494         ld      (hl),#' '
      0005F4 2B               [ 6]  495         dec     hl
      0005F5 22 C6 0D         [16]  496         ld      (MAN_HEAD),hl
      0005F8 77               [ 7]  497         ld      (hl),a
      0005F9 11 28 00         [10]  498         ld      de,#SCREEN_WIDTH
      0005FC 19               [11]  499         add     hl,de
      0005FD 23               [ 6]  500         inc     hl
      0005FE 7E               [ 7]  501         ld      a,(hl)
      0005FF 36 20            [10]  502         ld      (hl),#' '
      000601 FE 9D            [ 7]  503         cp      #CHR_MAN_WALK
      000603 28 04            [12]  504         jr      z,transition_left_stay
      000605 FE A1            [ 7]  505         cp      #CHR_MAN_STAY
      000607 28 04            [12]  506         jr      z,transition_left_walk
      000609                        507 transition_left_stay:
      000609 C6 04            [ 7]  508         add     a,#TRANSITION_MAN_WALK_STAY
      00060B 18 02            [12]  509         jr      update_left
      00060D                        510 transition_left_walk:
      00060D D6 04            [ 7]  511         sub     #TRANSITION_MAN_WALK_STAY
      00060F                        512 update_left:
      00060F 2B               [ 6]  513         dec     hl
      000610 77               [ 7]  514         ld      (hl),a
      000611 3E 07            [ 7]  515         ld      a,#GAMES_LINES+1
      000613 01 4F EC         [10]  516         ld      bc,#BWS+(GAME_START_Y)*SCREEN_WIDTH-1
      000616                        517 loop_left_border_check:
      000616 C5               [11]  518         push    bc
      000617 60               [ 4]  519         ld      h,b
      000618 69               [ 4]  520         ld      l,c
      000619 ED 5B C6 0D      [20]  521         ld      de,(MAN_HEAD)
      00061D A7               [ 4]  522         and     a
      00061E ED 52            [15]  523         sbc     hl,de
      000620 28 0E            [12]  524         jr      z,correct_left_border
      000622                        525 left_border_next_adr:
      000622 C1               [10]  526         pop     bc
      000623 11 78 00         [10]  527         ld      de,#3*SCREEN_WIDTH
      000626 60               [ 4]  528         ld      h,b
      000627 69               [ 4]  529         ld      l,c
      000628 19               [11]  530         add     hl,de
      000629 44               [ 4]  531         ld      b,h
      00062A 4D               [ 4]  532         ld      c,l
      00062B 3D               [ 4]  533         dec     a
      00062C 20 E8            [12]  534         jr      nz,loop_left_border_check
      00062E F1               [10]  535         pop     af
      00062F C9               [10]  536         ret
      000630                        537 correct_left_border:
      000630 2A C6 0D         [16]  538         ld      hl,(MAN_HEAD)
      000633 11 28 00         [10]  539         ld      de,#SCREEN_WIDTH
      000636 36 C6            [10]  540         ld      (hl),#CHR_WALL
      000638 19               [11]  541         add     hl,de
      000639 36 CC            [10]  542         ld      (hl),#CHR_MAN_HEAD
      00063B 22 C6 0D         [16]  543         ld      (MAN_HEAD),hl
      00063E 19               [11]  544         add     hl,de
      00063F 36 9D            [10]  545         ld      (hl),#CHR_MAN_WALK
      000641 C3 22 06         [10]  546         jp      left_border_next_adr
      000644                        547 action_right:
      000644 F5               [11]  548         push    af
      000645 2A C6 0D         [16]  549         ld      hl,(MAN_HEAD)
      000648 7E               [ 7]  550         ld      a,(hl)
      000649 36 20            [10]  551         ld      (hl),#' '
      00064B 23               [ 6]  552         inc     hl
      00064C 22 C6 0D         [16]  553         ld      (MAN_HEAD),hl
      00064F 77               [ 7]  554         ld      (hl),a
      000650 11 28 00         [10]  555         ld      de,#SCREEN_WIDTH
      000653 19               [11]  556         add     hl,de
      000654 2B               [ 6]  557         dec     hl
      000655 7E               [ 7]  558         ld      a,(hl)
      000656 36 20            [10]  559         ld      (hl),#' '
      000658 FE 9D            [ 7]  560         cp      #CHR_MAN_WALK
      00065A 28 04            [12]  561         jr      z,transition_stay
      00065C FE A1            [ 7]  562         cp      #CHR_MAN_STAY
      00065E 28 04            [12]  563         jr      z,transition_walk
      000660                        564 transition_stay:
      000660 C6 04            [ 7]  565         add     a,#TRANSITION_MAN_WALK_STAY
      000662 18 02            [12]  566         jr      update_right
      000664                        567 transition_walk:
      000664 D6 04            [ 7]  568         sub     #TRANSITION_MAN_WALK_STAY
      000666                        569 update_right:
      000666 23               [ 6]  570         inc     hl
      000667 77               [ 7]  571         ld      (hl),a
      000668 3E 07            [ 7]  572         ld      a,#GAMES_LINES+1
      00066A 01 78 EC         [10]  573         ld      bc,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH+0
      00066D                        574 loop_right_border_check:
      00066D C5               [11]  575         push    bc
      00066E 60               [ 4]  576         ld      h,b
      00066F 69               [ 4]  577         ld      l,c
      000670 ED 5B C6 0D      [20]  578         ld      de,(MAN_HEAD)
      000674 A7               [ 4]  579         and     a
      000675 ED 52            [15]  580         sbc     hl,de
      000677 28 0E            [12]  581         jr      z,correct_right_border
      000679                        582 right_border_next_adr:
      000679 C1               [10]  583         pop     bc
      00067A 11 78 00         [10]  584         ld      de,#3*SCREEN_WIDTH
      00067D 60               [ 4]  585         ld      h,b
      00067E 69               [ 4]  586         ld      l,c
      00067F 19               [11]  587         add     hl,de
      000680 44               [ 4]  588         ld      b,h
      000681 4D               [ 4]  589         ld      c,l
      000682 3D               [ 4]  590         dec     a
      000683 20 E8            [12]  591         jr      nz,loop_right_border_check
      000685 F1               [10]  592         pop     af
      000686 C9               [10]  593         ret
      000687                        594 correct_right_border:
      000687 2A C6 0D         [16]  595         ld      hl,(MAN_HEAD)
      00068A 4E               [ 7]  596         ld      c,(hl)
      00068B 36 9D            [10]  597         ld      (hl),#CHR_MAN_WALK
      00068D 11 28 00         [10]  598         ld      de,#SCREEN_WIDTH
      000690 A7               [ 4]  599         and     a
      000691 ED 52            [15]  600         sbc     hl,de
      000693 71               [ 7]  601         ld      (hl),c
      000694 22 C6 0D         [16]  602         ld      (MAN_HEAD),hl
      000697 19               [11]  603         add     hl,de
      000698 19               [11]  604         add     hl,de
      000699 36 EE            [10]  605         ld      (hl),#CHR_MOVING_LINE
      00069B 18 DC            [12]  606         jr      right_border_next_adr
      00069D                        607 action_jump:
      00069D 2A C6 0D         [16]  608         ld      hl,(MAN_HEAD)
      0006A0 11 28 00         [10]  609         ld      de,#SCREEN_WIDTH
      0006A3 A7               [ 4]  610         and     a
      0006A4 ED 52            [15]  611         sbc     hl,de
      0006A6 7E               [ 7]  612         ld      a,(hl)
      0006A7 FE 20            [ 7]  613         cp      #' '
      0006A9 28 0B            [12]  614         jr      z,jump_ok
      0006AB FE EE            [ 7]  615         cp      #CHR_MOVING_LINE
      0006AD 28 2B            [12]  616         jr      z,jump_fail
      0006AF FE C6            [ 7]  617         cp      #CHR_WALL
      0006B1 28 27            [12]  618         jr      z,jump_fail
      0006B3 C3 50 04         [10]  619         jp      handle_fail_delay
      0006B6                        620 jump_ok:
      0006B6 D9               [ 4]  621         exx
      0006B7 CD B8 07         [17]  622         call    add_10_points
      0006BA D9               [ 4]  623         exx
      0006BB 19               [11]  624         add     hl,de
      0006BC 36 20            [10]  625         ld      (hl),#' '
      0006BE 19               [11]  626         add     hl,de
      0006BF 36 20            [10]  627         ld      (hl),#' '
      0006C1 1E 78            [ 7]  628         ld      e,#3*SCREEN_WIDTH
      0006C3 A7               [ 4]  629         and     a
      0006C4 ED 52            [15]  630         sbc     hl,de
      0006C6 36 9D            [10]  631         ld      (hl),#CHR_MAN_WALK
      0006C8 1E 28            [ 7]  632         ld      e,#SCREEN_WIDTH
      0006CA A7               [ 4]  633         and     a
      0006CB ED 52            [15]  634         sbc     hl,de
      0006CD 36 CC            [10]  635         ld      (hl),#CHR_MAN_HEAD
      0006CF 22 C6 0D         [16]  636         ld      (MAN_HEAD),hl
      0006D2 3E 04            [ 7]  637         ld      a,#DELAY_COUNTER_JUMP
      0006D4 32 C8 0D         [13]  638         ld      (JUMP_DELAY),a
      0006D7 C3 50 04         [10]  639         jp      handle_fail_delay
      0006DA                        640 jump_fail:
      0006DA 19               [11]  641         add     hl,de
      0006DB 2B               [ 6]  642         dec     hl
      0006DC 3E CD            [ 7]  643         ld      a,#CHR_SMOKE
      0006DE 77               [ 7]  644         ld      (hl),a
      0006DF 23               [ 6]  645         inc     hl
      0006E0 23               [ 6]  646         inc     hl
      0006E1 23               [ 6]  647         inc     hl
      0006E2 77               [ 7]  648         ld      (hl),a
      0006E3 2B               [ 6]  649         dec     hl
      0006E4 2B               [ 6]  650         dec     hl
      0006E5 36 20            [10]  651         ld      (hl),#' '
      0006E7 19               [11]  652         add     hl,de
      0006E8 36 97            [10]  653         ld      (hl),#CHR_MAN_SLEEP
      0006EA 23               [ 6]  654         inc     hl
      0006EB 36 C9            [10]  655         ld      (hl),#CHR_MAN_SLEEP_HEAD
      0006ED 3E 0B            [ 7]  656         ld      a,#DELAY_COUNTER
      0006EF 32 C9 0D         [13]  657         ld      (FAIL_DELAY),a
      0006F2 3A C5 0D         [13]  658         ld      a,(cnt_fail_jump)
      0006F5 FE 05            [ 7]  659         cp      #MAX_FAIL_COUNTER
      0006F7 CA 50 04         [10]  660         jp      z,handle_fail_delay
      0006FA 3C               [ 4]  661         inc     a
      0006FB 32 C5 0D         [13]  662         ld      (cnt_fail_jump),a
      0006FE C3 50 04         [10]  663         jp      handle_fail_delay
      000701                        664 check_fall_through:
      000701 3A C8 0D         [13]  665         ld      a,(JUMP_DELAY)
      000704 FE 01            [ 7]  666         cp      #INITIAL_DELAY_COUNTER
      000706 C0               [11]  667         ret     nz
      000707                        668 check_for_trap:
      000707 2A C6 0D         [16]  669         ld      hl,(MAN_HEAD)
      00070A 11 28 00         [10]  670         ld      de,#SCREEN_WIDTH
      00070D 19               [11]  671         add     hl,de
      00070E 19               [11]  672         add     hl,de
      00070F 7E               [ 7]  673         ld      a,(hl)
      000710 FE 20            [ 7]  674         cp      #' '
      000712 C0               [11]  675         ret     nz
      000713 3A C9 0D         [13]  676         ld      a,(FAIL_DELAY)
      000716 FE 01            [ 7]  677         cp      #INITIAL_DELAY_COUNTER
      000718 28 15            [12]  678         jr      z,erase_player_fell_down
      00071A 2A C6 0D         [16]  679         ld      hl,(MAN_HEAD)
      00071D 3E 20            [ 7]  680         ld      a,#' '
      00071F 2B               [ 6]  681         dec     hl
      000720 77               [ 7]  682         ld      (hl),a
      000721 23               [ 6]  683         inc     hl
      000722 23               [ 6]  684         inc     hl
      000723 23               [ 6]  685         inc     hl
      000724 77               [ 7]  686         ld      (hl),a
      000725 2B               [ 6]  687         dec     hl
      000726 19               [11]  688         add     hl,de
      000727 77               [ 7]  689         ld      (hl),a
      000728 23               [ 6]  690         inc     hl
      000729 77               [ 7]  691         ld      (hl),a
      00072A 2B               [ 6]  692         dec     hl
      00072B 2B               [ 6]  693         dec     hl
      00072C 77               [ 7]  694         ld      (hl),a
      00072D 18 08            [12]  695         jr      player_fell_down
      00072F                        696 erase_player_fell_down:
      00072F 2A C6 0D         [16]  697         ld      hl,(MAN_HEAD)
      000732 3E 20            [ 7]  698         ld      a,#' '
      000734 77               [ 7]  699         ld      (hl),a
      000735 19               [11]  700         add     hl,de
      000736 77               [ 7]  701         ld      (hl),a
      000737                        702 player_fell_down:
      000737 19               [11]  703         add     hl,de
      000738 19               [11]  704         add     hl,de
      000739 22 C6 0D         [16]  705         ld      (MAN_HEAD),hl
      00073C 19               [11]  706         add     hl,de
      00073D 36 97            [10]  707         ld      (hl),#CHR_MAN_SLEEP
      00073F 23               [ 6]  708         inc     hl
      000740 36 C9            [10]  709         ld      (hl),#CHR_MAN_SLEEP_HEAD
      000742 3E 08            [ 7]  710         ld      a,#DELAY_COUNTER2
      000744 32 C9 0D         [13]  711         ld      (FAIL_DELAY),a
      000747 3A C4 0D         [13]  712         ld      a,(cnt_fail_trap)
      00074A FE 05            [ 7]  713         cp      #MAX_FAIL_COUNTER
      00074C C8               [11]  714         ret     z
      00074D 3C               [ 4]  715         inc     a
      00074E 32 C4 0D         [13]  716         ld      (cnt_fail_trap),a
      000751 C9               [10]  717         ret
      000752                        718 check_level_finished:
      000752 2A C6 0D         [16]  719         ld      hl,(MAN_HEAD)
      000755 11 6F EC         [10]  720         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+(SCREEN_WIDTH-9)
      000758 A7               [ 4]  721         and     a
      000759 ED 52            [15]  722         sbc     hl,de
      00075B 20 39            [12]  723         jr      nz,round_end
      00075D 3A CD 0D         [13]  724         ld      a,(LEVEL)
      000760 FE 08            [ 7]  725         cp      #MAX_LEVEL
      000762 28 01            [12]  726         jr      z,new_level_set
      000764 3C               [ 4]  727         inc     a
      000765                        728 new_level_set:
      000765 32 CD 0D         [13]  729         ld      (LEVEL),a
      000768 21 33 EF         [10]  730         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+(15+ALIGN_MIDDLE)
      00076B 22 C6 0D         [16]  731         ld      (MAN_HEAD),hl
      00076E 3E 28            [ 7]  732         ld      a,#SCREEN_WIDTH
      000770 36 CC            [10]  733         ld      (hl),#CHR_MAN_HEAD
      000772 85               [ 4]  734         add     a,l
      000773 6F               [ 4]  735         ld      l,a
      000774 36 A1            [10]  736         ld      (hl),#CHR_MAN_STAY
      000776 21 C4 0D         [10]  737         ld      hl,#cnt_fail_trap
      000779 3E 02            [ 7]  738         ld      a,#INITIAL_FAIL_COUNTER
      00077B 77               [ 7]  739         ld      (hl),a
      00077C 21 C5 0D         [10]  740         ld      hl,#cnt_fail_jump
      00077F 77               [ 7]  741         ld      (hl),a
      000780 21 6D EC         [10]  742         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+(SCREEN_WIDTH-11)
      000783 36 F8            [10]  743         ld      (hl),#CHR_LINE_TOP
      000785 23               [ 6]  744         inc     hl
      000786 36 95            [10]  745         ld      (hl),#CHR_ARROW_RIGHT_TOP
      000788 23               [ 6]  746         inc     hl
      000789 36 20            [10]  747         ld      (hl),#' '
      00078B 21 95 EC         [10]  748         ld      hl,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH++(SCREEN_WIDTH-11)
      00078E 36 9E            [10]  749         ld      (hl),#CHR_LINE_BOTTOM
      000790 23               [ 6]  750         inc     hl
      000791 36 93            [10]  751         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      000793 23               [ 6]  752         inc     hl
      000794 36 20            [10]  753         ld      (hl),#' '
      000796                        754 round_end:
      000796 13               [ 6]  755         inc     de
      000797 13               [ 6]  756         inc     de
      000798 2A C6 0D         [16]  757         ld      hl,(MAN_HEAD)
      00079B A7               [ 4]  758         and     a
      00079C ED 52            [15]  759         sbc     hl,de
      00079E 3E 0B            [ 7]  760         ld      a,#DELAY_COUNTER
      0007A0 C0               [11]  761         ret     nz
      0007A1 32 C9 0D         [13]  762         ld      (FAIL_DELAY),a
      0007A4 13               [ 6]  763         inc     de
      0007A5 ED 53 C6 0D      [20]  764         ld      (MAN_HEAD),de
      0007A9 3E 20            [ 7]  765         ld      a,#' '
      0007AB 1B               [ 6]  766         dec     de
      0007AC 12               [ 7]  767         ld      (de),a
      0007AD 83               [ 4]  768         add     a,e
      0007AE 5F               [ 4]  769         ld      e,a
      0007AF 12               [ 7]  770         ld      (de),a
      0007B0 6F               [ 4]  771         ld      l,a
      0007B1 19               [11]  772         add     hl,de
      0007B2 36 97            [10]  773         ld      (hl),#CHR_MAN_SLEEP
      0007B4 23               [ 6]  774         inc     hl
      0007B5 36 C9            [10]  775         ld      (hl),#CHR_MAN_SLEEP_HEAD
      0007B7 C9               [10]  776         ret
      0007B8                        777 add_10_points:
      0004B8                        778         SET_CURSOR_DE 0 23+POSDIFF_POINTS
      0007B8 C5               [11]    1         push    bc
      0007B9 11 20 01         [10]    2         ld      de,#(0+1)*256+(23+POSDIFF_POINTS+1)
      0007BC 0E 12            [ 7]    3         ld      c,#UP_SETCU
      0007BE CD 05 00         [17]    4         call    BOS
      0007C1 C1               [10]    5         pop     bc
      0007C2 2A CB 0D         [16]  779         ld      hl,(POINTS)
      0007C5 11 0A 00         [10]  780         ld      de,#10
      0007C8 19               [11]  781         add     hl,de
      0007C9 22 CB 0D         [16]  782         ld      (POINTS),hl
      0007CC CD D5 07         [17]  783         call    print_decimal
      0007CF 3E 20            [ 7]  784         ld      a,#' '
      0007D1 32 24 EC         [13]  785         ld      (BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS+5),a
      0007D4 C9               [10]  786         ret
      0007D5                        787 print_decimal:
      0007D5 E5               [11]  788         push    hl
      0007D6 01 10 27         [10]  789         ld      bc,#10000
      0007D9 CD 01 08         [17]  790         call    get_decimal_digit
      0007DC 01 E8 03         [10]  791         ld      bc,#1000
      0007DF CD 01 08         [17]  792         call    get_decimal_digit
      0007E2 01 64 00         [10]  793         ld      bc,#100
      0007E5 CD 01 08         [17]  794         call    get_decimal_digit
      0007E8 01 0A 00         [10]  795         ld      bc,#10
      0007EB CD 01 08         [17]  796         call    get_decimal_digit
      0007EE 01 01 00         [10]  797         ld      bc,#1
      0007F1 CD 01 08         [17]  798         call    get_decimal_digit
      0004F4                        799         REMOVE_CURSOR;
      0007F4 2A 2D 00         [16]    1         ld      hl,(CURS)
      0007F7 36 20            [10]    2         ld      (hl),#' '
      0007F9 CB 94            [ 8]    3         res     2,h
      0007FB CB BE            [15]    4         res     7,(hl)
      0007FD CB D4            [ 8]    5         set     2,h
      0007FF E1               [10]  800         pop     hl
      000800 C9               [10]  801         ret
      000801                        802 get_decimal_digit:
      000801 AF               [ 4]  803         xor     a
      000802                        804 decimal_loop:
      000802 A7               [ 4]  805         and     a
      000803 ED 42            [15]  806         sbc     hl,bc
      000805 3C               [ 4]  807         inc     a
      000806 D2 02 08         [10]  808         jp      nc,decimal_loop
      000809 3D               [ 4]  809         dec     a
      00080A 09               [11]  810         add     hl,bc
      00080B C6 30            [ 7]  811         add     a,#'0'
      00050D                        812         OUTCH
      00080D C5               [11]    1         push    bc
      00080E D5               [11]    2         push    de
      00080F 0E 02            [ 7]    3         ld      c,#UP_CONSO
      000811 5F               [ 4]    4         ld      e,a
      000812 CD 05 00         [17]    5         call    BOS
      000815 D1               [10]    6         pop     de
      000816 C1               [10]    7         pop     bc
      000817 C9               [10]  813         ret
      000818                        814 no_lives:
      000518                        815         PRST7
      000818 CD A5 0E         [17]    1         call    prst7
      00081B 0C A0                  816         .db     0x0c,0xa0
      00081D 21 6F 0E         [10]  817         ld      hl,#TXT_GAME_OVER
      000820 11 0D EC         [10]  818         ld      de,#POS_GAME_OVER
      000823 01 0F 00         [10]  819         ld      bc,#TXT_GAME_OVER_size
      000826 ED B0            [21]  820         ldir
      000828 0E 40            [ 7]  821         ld      c,#3*SCREEN_WIDTH-TXT_GAME_OVER_size-1+POSDIFF_YOUR_SCORE
      00082A 7B               [ 4]  822         ld      a,e
      00082B 81               [ 4]  823         add     a,c
      00082C 5F               [ 4]  824         ld      e,a
      00082D 0E 0C            [ 7]  825         ld      c,#TXT_YOUR_SCORE_size
      00082F ED B0            [21]  826         ldir
      000831 0E 47            [ 7]  827         ld      c,#2*SCREEN_WIDTH-TXT_YOUR_SCORE_size+3
      000833 7B               [ 4]  828         ld      a,e
      000834 81               [ 4]  829         add     a,c
      000835 5F               [ 4]  830         ld      e,a
      000836 0E 09            [ 7]  831         ld      c,#TXT_HAZARD_size
      000838 ED B0            [21]  832         ldir
      00083A 21 E0 ED         [10]  833         ld      hl,#BWS+15*SCREEN_WIDTH+0+(3*POSDIFF_YOUR_SCORE)
      00083D 36 A0            [10]  834         ld      (hl),#CHR_MIDDLE_LINE
      00083F 11 E1 ED         [10]  835         ld      de,#BWS+15*SCREEN_WIDTH+1+(3*POSDIFF_YOUR_SCORE)
      000842 0E 27            [ 7]  836         ld      c,#SCREEN_WIDTH-1
      000844 ED B0            [21]  837         ldir
      000846 2A CB 0D         [16]  838         ld      hl,(POINTS)
      000549                        839         SET_CURSOR_DE (5-POSDIFF_YOUR_SCORE_DY) (21+ALIGN_MIDDLE)
      000849 C5               [11]    1         push    bc
      00084A 11 1A 03         [10]    2         ld      de,#((5-POSDIFF_YOUR_SCORE_DY)+1)*256+((21+ALIGN_MIDDLE)+1)
      00084D 0E 12            [ 7]    3         ld      c,#UP_SETCU
      00084F CD 05 00         [17]    4         call    BOS
      000852 C1               [10]    5         pop     bc
      000853 CD D5 07         [17]  840         call    print_decimal
      000856 3A CD 0D         [13]  841         ld      a,(LEVEL)
      000859 C6 2F            [ 7]  842         add     a,#'0'-1
      00085B 32 BB EC         [13]  843         ld      (BWS+7*SCREEN_WIDTH+23+ALIGN_MIDDLE+3*POSDIFF_YOUR_SCORE),a
      00085E ED 5B 51 0E      [20]  844         ld      de,(HIGH_SCORE_TABLE01.points)
      000862 A7               [ 4]  845         and     a
      000863 ED 52            [15]  846         sbc     hl,de
      000865 D4 CD 09         [17]  847         call    nc,draw_new_highscore_box
      000568                        848         SET_CURSOR_HL (17-POSDIFF_YOUR_SCORE_DY) (3+ALIGN_MIDDLE)
      000868 D5               [11]    1         push    de
      000869 C5               [11]    2         push    bc
      00086A 11 08 0F         [10]    3         ld      de,#((17-POSDIFF_YOUR_SCORE_DY)+1)*256+((3+ALIGN_MIDDLE)+1)
      00086D 62               [ 4]    4         ld      h,d
      00086E 6B               [ 4]    5         ld      l,e
      00086F 0E 12            [ 7]    6         ld      c,#UP_SETCU
      000871 CD 05 00         [17]    7         call    BOS
      000874 C1               [10]    8         pop     bc
      000875 D1               [10]    9         pop     de
      000576                        849         PRST7
      000876 CD A5 0E         [17]    1         call    prst7
      000879 20 49 4E 50 55 54 20   850         .ascis ' INPUT YOUR INITIALS: __ '
             59 4F 55 52 20 49 4E
             49 54 49 41 4C 53 3A
             20 5F 5F A0
                                    851         ; remove 2xcursor
      000892                        852 input:
      000892 21 C4 EE         [10]  853         ld      hl,#BWS+17*SCREEN_WIDTH+28
      000895 36 20            [10]  854         ld      (hl),#' '
      000897 21 01 EC         [10]  855         ld      hl,#BWS+0*SCREEN_WIDTH+1
      00089A 36 20            [10]  856         ld      (hl),#' '
      00089C 21 4D EE         [10]  857         ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+25+ALIGN_MIDDLE
      00059F                        858         CURSOR_DISABLE
      00089F C5               [11]    1         push    bc
      0008A0 0E 1D            [ 7]    2         ld      c,#UP_DCU
      0008A2 CD 05 00         [17]    3         call    BOS
      0008A5 C1               [10]    4         pop     bc
      0005A6                        859         INCH
      0008A6 AF               [ 4]    1         xor     a
      0008A7 32 25 00         [13]    2         ld      (KEYBU),a
      0008AA 0E 01            [ 7]    3         ld      c,#UP_CONSI
      0008AC CD 05 00         [17]    4         call    BOS
      0008AF 77               [ 7]  860         ld      (hl),a
      0008B0 32 6D 0E         [13]  861         ld      (INITIALS),a
      0008B3 23               [ 6]  862         inc     hl
      0005B4                        863         INCH
      0008B4 AF               [ 4]    1         xor     a
      0008B5 32 25 00         [13]    2         ld      (KEYBU),a
      0008B8 0E 01            [ 7]    3         ld      c,#UP_CONSI
      0008BA CD 05 00         [17]    4         call    BOS
      0008BD 77               [ 7]  864         ld      (hl),a
      0008BE 32 6E 0E         [13]  865         ld      (INITIALS+1),a
      0008C1 ED 5B CB 0D      [20]  866         ld      de,(POINTS)
      0008C5 06 05            [ 7]  867         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      0008C7 2A 51 0E         [16]  868         ld      hl,(HIGH_SCORE_TABLE01.points)
      0008CA A7               [ 4]  869         and     a
      0008CB ED 52            [15]  870         sbc     hl,de
      0008CD DA 9C 09         [10]  871         jp      c,insert_score
      0008D0 05               [ 4]  872         dec     b
      0008D1 2A 56 0E         [16]  873         ld      hl,(HIGH_SCORE_TABLE02.points)
      0008D4 A7               [ 4]  874         and     a
      0008D5 ED 52            [15]  875         sbc     hl,de
      0008D7 DA 9C 09         [10]  876         jp      c,insert_score
      0008DA 05               [ 4]  877         dec     b
      0008DB 2A 5B 0E         [16]  878         ld      hl,(HIGH_SCORE_TABLE03.points)
      0008DE A7               [ 4]  879         and     a
      0008DF ED 52            [15]  880         sbc     hl,de
      0008E1 DA 9C 09         [10]  881         jp      c,insert_score
      0008E4 05               [ 4]  882         dec     b
      0008E5 2A 60 0E         [16]  883         ld      hl,(HIGH_SCORE_TABLE04.points)
      0008E8 A7               [ 4]  884         and     a
      0008E9 ED 52            [15]  885         sbc     hl,de
      0008EB DA 9C 09         [10]  886         jp      c,insert_score
      0008EE 05               [ 4]  887         dec     b
      0008EF 2A 65 0E         [16]  888         ld      hl,(HIGH_SCORE_TABLE05.points)
      0008F2 A7               [ 4]  889         and     a
      0008F3 ED 52            [15]  890         sbc     hl,de
      0008F5 DA 9C 09         [10]  891         jp      c,insert_score
      0008F8                        892 print_highscore_table:
      0008F8 06 05            [ 7]  893         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      0008FA 11 4F 0E         [10]  894         ld      de,#HIGH_SCORE_TABLE01
      0008FD 21 8A EE         [10]  895         ld      hl,#BWS+(20-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+6+ALIGN_MIDDLE
      000900                        896 print_highscore_entry:
      000900 3E 36            [ 7]  897         ld      a,#'6'
      000902 90               [ 4]  898         sub     b
      000903 77               [ 7]  899         ld      (hl),a
      000904 1A               [ 7]  900         ld      a,(de)
      000905 23               [ 6]  901         inc     hl
      000906 23               [ 6]  902         inc     hl
      000907 23               [ 6]  903         inc     hl
      000908 77               [ 7]  904         ld      (hl),a
      000909 23               [ 6]  905         inc     hl
      00090A 13               [ 6]  906         inc     de
      00090B 1A               [ 7]  907         ld      a,(de)
      00090C 77               [ 7]  908         ld      (hl),a
      00090D 3E 2E            [ 7]  909         ld      a,#'.'
      00090F 23               [ 6]  910         inc     hl
      000910 23               [ 6]  911         inc     hl
      000911 77               [ 7]  912         ld      (hl),a
      000912 23               [ 6]  913         inc     hl
      000913 77               [ 7]  914         ld      (hl),a
      000914 23               [ 6]  915         inc     hl
      000915 77               [ 7]  916         ld      (hl),a
      000916 23               [ 6]  917         inc     hl
      000917 23               [ 6]  918         inc     hl
      000618                        919         SET_CURSOR
      000918 CD B4 0E         [17]    1         call    set_cursor
      00091B 13               [ 6]  920         inc     de
      00091C 1A               [ 7]  921         ld      a,(de)
      00091D 6F               [ 4]  922         ld      l,a
      00091E 13               [ 6]  923         inc     de
      00091F 1A               [ 7]  924         ld      a,(de)
      000920 67               [ 4]  925         ld      h,a
      000921 13               [ 6]  926         inc     de
      000922 C5               [11]  927         push    bc
      000923 D5               [11]  928         push    de
      000924 CD D5 07         [17]  929         call    print_decimal
      000927 D1               [10]  930         pop     de
      000928 C1               [10]  931         pop     bc
      000629                        932         REMOVE_CURSOR
      000929 2A 2D 00         [16]    1         ld      hl,(CURS)
      00092C 36 20            [10]    2         ld      (hl),#' '
      00092E CB 94            [ 8]    3         res     2,h
      000930 CB BE            [15]    4         res     7,(hl)
      000932 CB D4            [ 8]    5         set     2,h
      000934 23               [ 6]  933         inc     hl
      000935 23               [ 6]  934         inc     hl
      000936 23               [ 6]  935         inc     hl
      000937 36 30            [10]  936         ld      (hl),#'0'
      000939 23               [ 6]  937         inc     hl
      00093A 1A               [ 7]  938         ld      a,(de)
      00093B C6 2F            [ 7]  939         add     a,#'0'-1
      00093D 77               [ 7]  940         ld      (hl),a
      00093E 13               [ 6]  941         inc     de
      00093F 3E 15            [ 7]  942         ld      a,#SCREEN_WIDTH-19
      000941 85               [ 4]  943         add     a,l
      000942 6F               [ 4]  944         ld      l,a
      000943 3E 00            [ 7]  945         ld      a,#ZERO
      000945 8C               [ 4]  946         adc     a,h
      000946 67               [ 4]  947         ld      h,a
      000947 10 B7            [13]  948         djnz    print_highscore_entry
      000649                        949         SET_CURSOR_HL (29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY) (9+ALIGN_MIDDLE)
      000949 D5               [11]    1         push    de
      00094A C5               [11]    2         push    bc
      00094B 11 0E 17         [10]    3         ld      de,#((29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)+1)*256+((9+ALIGN_MIDDLE)+1)
      00094E 62               [ 4]    4         ld      h,d
      00094F 6B               [ 4]    5         ld      l,e
      000950 0E 12            [ 7]    6         ld      c,#UP_SETCU
      000952 CD 05 00         [17]    7         call    BOS
      000955 C1               [10]    8         pop     bc
      000956 D1               [10]    9         pop     de
      000657                        950         PRST7
      000957 CD A5 0E         [17]    1         call    prst7
      00095A 4E 45 57 20 47 41 4D   951         .ascii  'NEW GAME ? Y/N'
             45 20 3F 20 59 2F 4E
      000968 A0                     952         .db     0xa0
      000969 21 8C EF         [10]  953         ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      00096C 36 20            [10]  954         ld      (hl),#' '
      00066E                        955         CURSOR_DISABLE
      00096E C5               [11]    1         push    bc
      00096F 0E 1D            [ 7]    2         ld      c,#UP_DCU
      000971 CD 05 00         [17]    3         call    BOS
      000974 C1               [10]    4         pop     bc
      000975                        956 m_070a:
      000975                        957 ask_exit_game:
      000675                        958         INCH
      000975 AF               [ 4]    1         xor     a
      000976 32 25 00         [13]    2         ld      (KEYBU),a
      000979 0E 01            [ 7]    3         ld      c,#UP_CONSI
      00097B CD 05 00         [17]    4         call    BOS
      00097E FE 59            [ 7]  959         cp      #'Y'
      000980 CA 9D 03         [10]  960         jp      z,new_game
                           000000   961 .if     eq,z9001
                                    962         cp      #'Z'
                                    963         jp      z,new_game
                                    964 .endif
      000983 FE 4E            [ 7]  965         cp      #'N'
      000985 20 EE            [12]  966         jr      nz,ask_exit_game
      000987                        967 exit_game:
      000687                        968         PRST7
      000987 CD A5 0E         [17]    1         call    prst7
      00098A 0C                     969         .db     0x0c
      00098B 4A 75 6D 70 69 6E 67   970         .ascii  'Jumping Jack'
             20 4A 61 63 6B
      000997 0D 8D                  971         .db     0x0d,0x8d
      000699                        972         END_PROGRAM
      000999 C3 03 F0         [10]    1         jp      WBOOT
      00099C                        973 insert_score:
      00099C D5               [11]  974         push    de
      00099D 11 68 0E         [10]  975         ld      de,#HIGH_SCORE_TABLE_TMP
      0009A0 21 63 0E         [10]  976         ld      hl,#HIGH_SCORE_TABLE05
      0009A3                        977 move_table_entry:
      0009A3 C5               [11]  978         push    bc
      0009A4 01 05 00         [10]  979         ld      bc,#HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05
      0009A7 ED B0            [21]  980         ldir
      0009A9 EB               [ 4]  981         ex      de,hl
      0009AA 0E 0A            [ 7]  982         ld      c,#2*(HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05)
      0009AC A7               [ 4]  983         and     a
      0009AD ED 42            [15]  984         sbc     hl,bc
      0009AF EB               [ 4]  985         ex      de,hl
      0009B0 A7               [ 4]  986         and     a
      0009B1 ED 42            [15]  987         sbc     hl,bc
      0009B3 C1               [10]  988         pop     bc
      0009B4 10 ED            [13]  989         djnz    move_table_entry
      0009B6 3A 6D 0E         [13]  990         ld      a,(INITIALS)
      0009B9 12               [ 7]  991         ld      (de),a
      0009BA 13               [ 6]  992         inc     de
      0009BB 3A 6E 0E         [13]  993         ld      a,(INITIALS+1)
      0009BE 12               [ 7]  994         ld      (de),a
      0009BF EB               [ 4]  995         ex      de,hl
      0009C0 D1               [10]  996         pop     de
      0009C1 23               [ 6]  997         inc     hl
      0009C2 73               [ 7]  998         ld      (hl),e
      0009C3 23               [ 6]  999         inc     hl
      0009C4 72               [ 7] 1000         ld      (hl),d
      0009C5 23               [ 6] 1001         inc     hl
      0009C6 3A CD 0D         [13] 1002         ld      a,(LEVEL)
      0009C9 77               [ 7] 1003         ld      (hl),a
      0009CA C3 F8 08         [10] 1004         jp      print_highscore_table
      0009CD                       1005 draw_new_highscore_box:
      0009CD 21 FB EC         [10] 1006         ld      hl,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      0009D0 36 2A            [10] 1007         ld      (hl),#'*'
      0009D2 11 FC EC         [10] 1008         ld      de,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+8+ALIGN_MIDDLE
      0009D5 01 11 00         [10] 1009         ld      bc,#TXT_NEW_HIGH_SCORE_size-1
      0009D8 ED B0            [21] 1010         ldir
      0009DA 0E 8F            [ 7] 1011         ld      c,#4*SCREEN_WIDTH-TXT_NEW_HIGH_SCORE_size+1
      0009DC 09               [11] 1012         add     hl,bc
      0009DD EB               [ 4] 1013         ex      de,hl
      0009DE 09               [11] 1014         add     hl,bc
      0009DF EB               [ 4] 1015         ex      de,hl
      0009E0 0E 11            [ 7] 1016         ld      c,#TXT_NEW_HIGH_SCORE_size-1
      0009E2 36 2A            [10] 1017         ld      (hl),#'*'
      0009E4 ED B0            [21] 1018         ldir
      0009E6 11 4B ED         [10] 1019         ld      de,#BWS+(11-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      0009E9 21 93 0E         [10] 1020         ld      hl,#TXT_NEW_HIGH_SCORE
      0009EC 0E 12            [ 7] 1021         ld      c,#TXT_NEW_HIGH_SCORE_size
      0009EE ED B0            [21] 1022         ldir
      0009F0 1E 23            [ 7] 1023         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      0009F2 3E 2A            [ 7] 1024         ld      a,#'*'
      0009F4 12               [ 7] 1025         ld      (de),a
      0009F5 1E 34            [ 7] 1026         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      0009F7 12               [ 7] 1027         ld      (de),a
      0009F8 1E 73            [ 7] 1028         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      0009FA 12               [ 7] 1029         ld      (de),a
      0009FB 1E 84            [ 7] 1030         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      0009FD 12               [ 7] 1031         ld      (de),a
      0009FE C9               [10] 1032         ret
      0009FF                       1033 TOP_IMAGE:
      0006FF                       1034         TOP_IMAGE_CONTENT
                                      1  ; line 1
      0006FF                          2         SCREEN_POS
      0009FF 20 20 20 20              1         .ascii '    '
      000A03 AE 9E 9E 9E 9E 9E 9E     3         .db     0xae,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e ;........
             9E
      000A0B 9E 9E AD 20 20 20 20     4         .db     0x9e,0x9e,0xad,0x20,0x20,0x20,0x20,0x20 ;..-     
             20
      000A13 20 20 20 20 20 20 20     5         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000A1B 20 20 20 20 20 20 20     6         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000723                          7         SCREEN_POS
      000A23 20 20 20 20              1         .ascii '    '
                                      8         
                                      9         ; line 2
      000727                         10         SCREEN_POS
      000A27 20 20 20 20              1         .ascii '    '
      000A2B 9F B9 B6 B3 B2 B6 B8    11         .db     0x9f,0xb9,0xb6,0xb3,0xb2,0xb6,0xb8,0x20 ;.963268 
             20
      000A33 BD B0 C0 20 20 20 20    12         .db     0xbd,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;=0@     
             20
      000A3B 20 20 20 20 20 20 20    13         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      000A43 20 20 20 20 20 20 20    14         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00074B                         15         SCREEN_POS
      000A4B 20 20 20 20              1         .ascii '    '
                                     16 
                                     17         ; line 3
      00074F                         18         SCREEN_POS
      000A4F 20 20 20 20              1         .ascii '    '
      000A53 9F B8 B7 20 B5 20 20    19         .db     0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
             20
      000A5B B5 20 C0 20 20 20 20    20         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      000A63 20 20 20 20 20 20 20    21         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      000A6B 20 20 20 20 B7 B7 20    22         .db     0x20,0x20,0x20,0x20,0xb7,0xb7,0x20,0x20 ;    77  
             20
      000773                         23         SCREEN_POS
      000A73 20 20 20 20              1         .ascii '    '
                                     24 
                                     25         ; line 4
      000777                         26         SCREEN_POS
      000A77 20 20 20 20              1         .ascii '    '
      000A7B 9F B3 20 B4 B5 20 B2    27         .db     0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
             20
      000A83 B5 20 C0 20 20 20 20    28         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      000A8B 20 20 20 20 20 20 20    29         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000A93 B6 B7 20 B9 B2 B2 B8    30         .db     0xb6,0xb7,0x20,0xb9,0xb2,0xb2,0xb8,0x20 ;67 9228 
             20
      00079B                         31         SCREEN_POS
      000A9B 20 20 20 20              1         .ascii '    '
                                     32 
                                     33         ; line 5
      00079F                         34         SCREEN_POS
      000A9F 20 20 20 20              1         .ascii '    '
      000AA3 9F B1 B6 20 20 B6 B0    35         .db     0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
             20
      000AAB B6 B0 C0 20 20 20 20    36         .db     0xb6,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;60@     
             20
      000AB3 20 20 B2 B3 20 20 20    37         .db     0x20,0x20,0xb2,0xb3,0x20,0x20,0x20,0x20 ;  23    
             20
      000ABB 20 BA A0 B4 B4 A0 B5    38         .db     0x20,0xba,0xa0,0xb4,0xb4,0xa0,0xb5,0x20 ; : 44 5 
             20
      0007C3                         39         SCREEN_POS
      000AC3 20 20 20 20              1         .ascii '    '
                                     40 
                                     41         ; line 6
      0007C7                         42         SCREEN_POS
      000AC7 20 20 20 20              1         .ascii '    '
      000ACB 9F 70 72 65 73 65 6E    43         .db     0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
             74
      000AD3 73 3A C0 20 20 20 20    44         .db     0x73,0x3a,0xc0,0x20,0x20,0x20,0x20,0x20 ;s:@     
             20
      000ADB 20 B2 B0 B1 B3 20 20    45         .db     0x20,0xb2,0xb0,0xb1,0xb3,0x20,0x20,0xb7 ; 2013  7
             B7
      000AE3 B6 B1 B3 B8 B1 B1 B9    46         .db     0xb6,0xb1,0xb3,0xb8,0xb1,0xb1,0xb9,0x20 ;6138119 
             20
      0007EB                         47         SCREEN_POS
      000AEB 20 20 20 20              1         .ascii '    '
                                     48 
                                     49         ; line 7
      0007EF                         50         SCREEN_POS
      000AEF 20 20 20 20              1         .ascii '    '
      000AF3 AB F8 F8 F8 F8 F8 F8    51         .db     0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
             F8
      000AFB F8 F8 AC 20 20 20 20    52         .db     0xf8,0xf8,0xac,0x20,0x20,0x20,0x20,0x20 ;xx,     
             20
      000B03 20 B0 20 20 B5 B7 B6    53         .db     0x20,0xb0,0x20,0x20,0xb5,0xb7,0xb6,0x20 ; 0  576 
             20
      000B0B 20 20 B1 B3 B6 BC 20    54         .db     0x20,0x20,0xb1,0xb3,0xb6,0xbc,0x20,0x20 ;  136<  
             20
      000813                         55         SCREEN_POS
      000B13 20 20 20 20              1         .ascii '    '
                                     56 
                                     57         ; line 8
      000817                         58         SCREEN_POS
      000B17 20 20 20 20              1         .ascii '    '
      000B1B 20 20 20 20 20 20 20    59         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B23 20 20 20 20 20 20 20    60         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B2B B1 B6 B6 B6 B6 20 20    61         .db     0xb1,0xb6,0xb6,0xb6,0xb6,0x20,0x20,0x20 ;16666   
             20
      000B33 20 20 20 B1 B9 20 20    62         .db     0x20,0x20,0x20,0xb1,0xb9,0x20,0x20,0x20 ;   19   
             20
      00083B                         63          SCREEN_POS
      000B3B 20 20 20 20              1         .ascii '    '
                                     64 
                                     65         ; line 9
      00083F                         66         Z1013_LINE
                                     67 
                                     68         ; line 10
      00083F                         69         Z1013_LINE
                                     70 
                                     71         ; line 11
      00083F                         72         SCREEN_POS
      000B3F 20 20 20 20              1         .ascii '    '
      000B43 20 20 20 20 20 20 20    73         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B4B 20 20 20 20 20 20 20    74         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B53 20 20 20 20 20 20 20    75         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B5B 20 20 20 20 20 20 20    76         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000863                         77          SCREEN_POS
      000B63 20 20 20 20              1         .ascii '    '
                                     78 
                                     79         ; line 12
      000867                         80         SCREEN_POS
      000B67 20 20 20 20              1         .ascii '    '
      000B6B 20 20 20 B4 20 20 20    81         .db     0x20,0x20,0x20,0xb4,0x20,0x20,0x20,0x20 ;   4    
             20
      000B73 20 20 20 20 B0 20 20    82         .db     0x20,0x20,0x20,0x20,0xb0,0x20,0x20,0x20 ;    0   
             20
      000B7B 20 20 20 20 20 20 B4    83         .db     0x20,0x20,0x20,0x20,0x20,0x20,0xb4,0x20 ;      4 
             20
      000B83 20 20 20 20 B4 B2 20    84         .db     0x20,0x20,0x20,0x20,0xb4,0xb2,0x20,0x20 ;    42  
             20
      00088B                         85          SCREEN_POS
      000B8B 20 20 20 20              1         .ascii '    '
                                     86 
                                     87         ; line 13
      00088F                         88         SCREEN_POS
      000B8F 20 20 20 20              1         .ascii '    '
      000B93 20 20 20 B4 B4 B5 B5    89         .db     0x20,0x20,0x20,0xb4,0xb4,0xb5,0xb5,0xbd ;   4455=
             BD
      000B9B BD B5 B6 B3 B4 BC BD    90         .db     0xbd,0xb5,0xb6,0xb3,0xb4,0xbc,0xbd,0xb2 ;=5634<=2
             B2
      000BA3 B6 B3 20 20 20 20 B4    91         .db     0xb6,0xb3,0x20,0x20,0x20,0x20,0xb4,0xb1 ;63    41
             B1
      000BAB B8 B2 B6 B3 BB B0 20    92         .db     0xb8,0xb2,0xb6,0xb3,0xbb,0xb0,0x20,0x20 ;8263;0  
             20
      0008B3                         93          SCREEN_POS
      000BB3 20 20 20 20              1         .ascii '    '
                                     94 
                                     95         ; line 14
      0008B7                         96         SCREEN_POS
      000BB7 20 20 20 20              1         .ascii '    '
      000BBB 20 B3 20 B4 B4 B5 B5    97         .db     0x20,0xb3,0x20,0xb4,0xb4,0xb5,0xb5,0xb5 ; 3 44555
             B5
      000BC3 B5 B5 B7 B0 B4 B4 B5    98         .db     0xb5,0xb5,0xb7,0xb0,0xb4,0xb4,0xb5,0xb1 ;55704451
             B1
      000BCB B7 B4 20 20 B3 20 B4    99         .db     0xb7,0xb4,0x20,0x20,0xb3,0x20,0xb4,0xb9 ;74  3 49
             B9
      000BD3 BD B5 20 B3 B4 B8 20   100         .db     0xbd,0xb5,0x20,0xb3,0xb4,0xb8,0x20,0x20 ;=5 348  
             20
      0008DB                        101          SCREEN_POS
      000BDB 20 20 20 20              1         .ascii '    '
                                    102 
                                    103         ; line 15
      0008DF                        104         SCREEN_POS
      000BDF 20 20 20 20              1         .ascii '    '
      000BE3 20 B8 B7 B0 B1 B0 B1   105         .db     0x20,0xb8,0xb7,0xb0,0xb1,0xb0,0xb1,0xb1 ; 8701011
             B1
      000BEB B1 B5 20 20 B0 B0 B1   106         .db     0xb1,0xb5,0x20,0x20,0xb0,0xb0,0xb1,0xb1 ;15  0011
             B1
      000BF3 B7 B0 20 20 B8 B7 B0   107         .db     0xb7,0xb0,0x20,0x20,0xb8,0xb7,0xb0,0xb1 ;70  8701
             B1
      000BFB B6 20 B6 20 B0 20 B0   108         .db     0xb6,0x20,0xb6,0x20,0xb0,0x20,0xb0,0x20 ;6 6 0 0 
             20
      000903                        109          SCREEN_POS
      000C03 20 20 20 20              1         .ascii '    '
                                    110 
                                    111         ; line 16
      000907                        112         SCREEN_POS
      000C07 20 20 20 20              1         .ascii '    '
      000C0B 20 20 20 20 20 20 20   113         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C13 20 20 20 20 20 20 20   114         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C1B 20 20 20 20 20 20 20   115         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C23 20 20 20 20 20 20 20   116         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00092B                        117         SCREEN_POS
      000C2B 20 20 20 20              1         .ascii '    '
                                   1035         
      000C2F                       1036 HINT_RIGHT:
      000C2F 2D 3E 20 2E 2E 2E 20  1037         .db     0x2d,0x3e,0x20,0x2e,0x2e,0x2e,0x20,0x52 ;-> ... R
             52
      000C37 69 67 68 74           1038         .db     0x69,0x67,0x68,0x74                     ;ight
      000C3B                       1039 HINT_LEFT:
      000C3B 3C 2D 20 2E 2E 2E 2E  1040         .db     0x3c,0x2d,0x20,0x2e,0x2e,0x2e,0x2e,0x20 ;<- .... 
             20
      000C43 4C 65 66 74           1041         .db     0x4c,0x65,0x66,0x74                     ;Left
      000C47                       1042 HINT_JUMP:
      000C47 53 50 20 2E 2E 2E 2E  1043         .ascii  'SP .... Jump'
             20 4A 75 6D 70
      000C53                       1044 HINT_PLAY:
      000C53 50 20 2E 2E 2E 2E 2E  1045         .ascii  'P ..... Play'
             20 50 6C 61 79
      000C5F                       1046 HINT_EXIT:
      000C5F 45 20 2E 2E 2E 2E 2E  1047         .ascii  'E ..... Exit'
             20 45 78 69 74
      000C6B                       1048 HINT_COPYRIGHT:
      000C6B 43 20 31 39 38 36 20  1049         .ascii  'C 1986 Software Center Ilmenau'
             53 6F 66 74 77 61 72
             65 20 43 65 6E 74 65
             72 20 49 6C 6D 65 6E
             61 75
      000C89                       1050 HINT_NAME:
      000C89 47 2E 46 69 73 63 68  1051         .ascii  'G.Fischer & CO'
             65 72 20 26 20 43 4F
      000C97                       1052 HINT_YEAR:
      000C97 20 20 32 30 32 30 20  1053         .ascii  '  2020 Version'
             56 65 72 73 69 6F 6E
      000CA5                       1054 VERSION_INFO:
      000CA5 20 31 2E 31 20        1055         .db     0x20,0x31,0x2e,0x31,0x20                ; 1.1 
      000CAA                       1056 LINE_BUFFER:
      000CAA EE EE EE EE EE EE EE  1057         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CB2 EE EE EE EE EE EE EE  1058         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CBA EE EE EE EE EE EE EE  1059         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CC2 EE EE EE EE EE EE EE  1060         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CCA EE EE EE EE EE EE EE  1061         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CD2 EE EE EE EE EE EE EE  1062         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CDA EE EE EE EE EE EE EE  1063         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CE2 EE EE EE EE EE EE EE  1064         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CEA 20 20 20 EE EE EE EE  1065         .db     0x20,0x20,0x20,0xee,0xee,0xee,0xee,0xee ;   nnnnn
             EE
      000CF2 EE EE EE EE EE EE EE  1066         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000CFA EE EE EE EE EE 20 20  1067         .db     0xee,0xee,0xee,0xee,0xee,0x20,0x20,0x20 ;nnnnn   
             20
      000D02 20 20 EE EE EE EE EE  1068         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000D0A EE EE EE EE EE EE EE  1069         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D12 EE 20 20 20 EE EE EE  1070         .db     0xee,0x20,0x20,0x20,0xee,0xee,0xee,0xee ;n   nnnn
             EE
      000D1A EE EE EE EE EE EE EE  1071         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D22 EE EE EE 20 20 20 EE  1072         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D2A EE EE EE EE EE EE EE  1073         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D32 EE EE EE EE 20 20 20  1074         .db     0xee,0xee,0xee,0xee,0x20,0x20,0x20,0xee ;nnnn   n
             EE
      000D3A EE EE EE EE EE EE EE  1075         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0x20 ;nnnnnnn 
             20
      000D42 20 20 EE EE EE EE EE  1076         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000D4A EE EE EE 20 20 20 EE  1077         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D52 EE EE EE EE EE EE EE  1078         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D5A EE EE EE EE EE EE EE  1079         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D62 EE EE EE EE EE EE EE  1080         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D6A EE EE EE 20 20 20 EE  1081         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000D72 EE EE EE EE EE EE EE  1082         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D7A EE EE EE EE EE EE EE  1083         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D82 EE EE EE EE EE EE 20  1084         .db     0xee,0xee,0xee,0xee,0xee,0xee,0x20,0x20 ;nnnnnn  
             20
      000D8A 20 EE EE EE EE EE EE  1085         .db     0x20,0xee,0xee,0xee,0xee,0xee,0xee,0xee ; nnnnnnn
             EE
      000D92 EE EE EE EE EE EE EE  1086         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000D9A EE EE EE EE EE EE EE  1087         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DA2 EE EE EE EE EE EE EE  1088         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DAA EE EE EE EE EE EE EE  1089         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000DB2 EE EE EE EE EE EE EE  1090         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee      ;nnnnnnn
                                   1091 ; unchecked data source
      000DB9 EE                    1092         .db     0xee                                    ;n
      000DBA                       1093 OFFSET_HOLES:
      000DBA 58 7C 41 98 56        1094         .db     0x58,0x7c,0x41,0x98,0x56                ;X|A.V
      000DBF                       1095 OFFSET_HOLES_JUMP_PENALTY:
      000DBF 8B A2 68 C2 DD        1096         .db     0x8b,0xa2,0x68,0xc2,0xdd                ;."hB]
      000DC4                       1097 cnt_fail_trap:
      000DC4 05                    1098         .db     5
      000DC5                       1099 cnt_fail_jump:
      000DC5 05                    1100         .db     5
      000DC6                       1101 MAN_HEAD:
      000DC6 32 EF                 1102         .dw     BWS+(GAME_START_Y+(8-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      000DC8                       1103 JUMP_DELAY:
      000DC8 01                    1104         .db     1
      000DC9                       1105 FAIL_DELAY:
      000DC9 01                    1106         .db     1
      000DCA                       1107 LIVES:
      000DCA 06                    1108         .db     6
      000DCB                       1109 POINTS:
      000DCB 00 00                 1110         .dw     0
      000DCD                       1111 LEVEL:
      000DCD 01                    1112         .db     1
      000DCE                       1113 counter:
      000DCE 01                    1114         .db     1
      000DCF                       1115 TXT_JUMP:
      000DCF 2A 20 4A 55 4D 50 49  1116         .ascii  '* JUMPING JACK *'
             4E 47 20 4A 41 43 4B
             20 2A
      000DDF                       1117 MONSTER_PTR:
      000DDF DF ED                 1118         .dw     BWS+(GAME_START_Y+3*3+1)*SCREEN_WIDTH-1
      000DE1 30 EE                 1119         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+0
      000DE3 31 EE                 1120         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000DE5 32 EE                 1121         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
                                   1122 
      000DE7 D5 EC                 1123         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
      000DE9 D6 EC                 1124         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+14
      000DEB D7 EC                 1125         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+15
      000DED D8 EC                 1126         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+16
                                   1127 
      000DEF 31 EE                 1128         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000DF1 32 EE                 1129         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
      000DF3 33 EE                 1130         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+3
      000DF5 34 EE                 1131         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+4
                                   1132 
      000DF7 C1 EE                 1133         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+25
      000DF9 C2 EE                 1134         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+26
      000DFB C3 EE                 1135         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+27
      000DFD C4 EE                 1136         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+28
                                   1137 
      000DFF D2 EC                 1138         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+10
      000E01 D3 EC                 1139         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+11
      000E03 D4 EC                 1140         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+12
      000E05 D5 EC                 1141         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
                                   1142 
      000E07 B3 EE                 1143         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+11
      000E09 B4 EE                 1144         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+12
      000E0B B5 EE                 1145         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+13
      000E0D B6 EE                 1146         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14
                                   1147 
      000E0F BD EE                 1148         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+21
      000E11 BE EE                 1149         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+22
      000E13 BF EE                 1150         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+23
      000E15 C0 EE                 1151         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+24
                                   1152         
      000E17                       1153 MONSTER_IMG:
      000B17                       1154         MONSTER_IMG_CONTENT
      000E17 94 90 8B 90 8B 91 97     1         .db     0x94,0x90,0x8b,0x90,0x8b,0x91,0x97,0x91 ;........
             91
      000E1F 19 B5 20 BE 20 BF 20     2         .db     0x19,0xb5,0x20,0xbe,0x20,0xbf,0x20,0xae ;.5 > ? .
             AE
      000E27 92 96 A0 A0 A0 A0 88     3         .db     0x92,0x96,0xa0,0xa0,0xa0,0xa0,0x88,0xc1 ;..    .A
             C1
      000E2F 20 95 20 B7 1E FF 20     4         .db     0x20,0x95,0x20,0xb7,0x1e,0xff,0x20,0x92 ; . 7.. .
             92
      000E37 17 8C F9 8C 1D 1F FC     5         .db     0x17,0x8c,0xf9,0x8c,0x1d,0x1f,0xfc,0x8c ;..y...|.
             8C
      000E3F 92 96 83 82 95 93 20     6         .db     0x92,0x96,0x83,0x82,0x95,0x93,0x20,0x20 ;......  
             20
      000E47 20 20 20 20 20 20 20     7         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
                                   1155 
      000E4F                       1156 HIGH_SCORE_TABLE01:
      000E4F 5F 5F                 1157         .ascii '__'
      000E51                       1158 HIGH_SCORE_TABLE01.points:
      000E51 00 00                 1159         .dw     0
      000E53                       1160 HIGH_SCORE_TABLE01.level:
      000E53 01                    1161         .db     1
      000E54                       1162 HIGH_SCORE_TABLE02:
      000E54 5F 5F                 1163         .ascii '__'
      000E56                       1164 HIGH_SCORE_TABLE02.points:
      000E56 00 00                 1165         .dw     0
      000E58                       1166 HIGH_SCORE_TABLE02.level:
      000E58 01                    1167         .db     1
      000E59                       1168 HIGH_SCORE_TABLE03:
      000E59 5F 5F                 1169         .ascii '__'
      000E5B                       1170 HIGH_SCORE_TABLE03.points:
      000E5B 00 00                 1171         .dw     0
      000E5D                       1172 HIGH_SCORE_TABLE03.level:
      000E5D 01                    1173         .db     1
      000E5E                       1174 HIGH_SCORE_TABLE04:
      000E5E 5F 5F                 1175         .ascii '__'
      000E60                       1176 HIGH_SCORE_TABLE04.points:
      000E60 00 00                 1177         .dw     0
      000E62                       1178 HIGH_SCORE_TABLE04.level:
      000E62 01                    1179         .db     1
      000E63                       1180 HIGH_SCORE_TABLE05:
      000E63 5F 5F                 1181         .ascii '__'
      000E65                       1182 HIGH_SCORE_TABLE05.points:
      000E65 00 00                 1183         .dw     0
      000E67                       1184 HIGH_SCORE_TABLE05.level:
      000E67 01                    1185         .db     1
      000E68                       1186 HIGH_SCORE_TABLE_TMP:
      000E68 5F 5F                 1187         .ascii '__'
      000E6A                       1188 HIGH_SCORE_TABLE_TMP.points:
      000E6A 00 00                 1189         .dw     0
      000E6C                       1190 HIGH_SCORE_TABLE_TMP.level:
      000E6C 01                    1191         .db     1
      000E6D                       1192 INITIALS:
      000E6D 5F 5F                 1193         .ascii '__'
      000E6F                       1194 TXT_GAME_OVER:
      000E6F 2A 2A 20 47 41 4D 45  1195         .ascii  '** GAME OVER **'
             20 4F 56 45 52 20 2A
             2A
      000E7E                       1196 TXT_YOUR_SCORE:
      000E7E 59 4F 55 52 20 53 43  1197         .ascii  'YOUR SCORE :'
             4F 52 45 20 3A
      000E8A                       1198 TXT_HAZARD:
      000E8A 48 41 5A 41 52 44 53  1199         .ascii  'HAZARDS :'
             20 3A
      000E93                       1200 TXT_NEW_HIGH_SCORE:
      000E93 2A 20 4E 45 57 20 48  1201         .ascii  '* NEW HIGH SCORE *'
             49 47 48 20 53 43 4F
             52 45 20 2A
                                   1202 ; end of source
                                   1203 ;
                                   1204 ; mark the end of ROM-image to calculate size for Z80/KCC header
                                   1205         .area  _DATA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 1.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.                                                    =  002710 L
    .__.ABS.                                                    =  000000 G
    .__.CPU.                                                    =  000000 L
    .__.H$L.                                                    =  000000 L
    ALIGN_MIDDLE                                                =  000004 
    BOS                                                         =  000005 
    BWS                                                         =  00EC00 
    CAPITALIZE                                                  =  000020 
    CHR_ARROW_RIGHT_BOTTOM                                      =  000093 
    CHR_ARROW_RIGHT_TOP                                         =  000095 
    CHR_LINE_BOTTOM                                             =  00009E 
    CHR_LINE_TOP                                                =  0000F8 
    CHR_MAN_HEAD                                                =  0000CC 
    CHR_MAN_SLEEP                                               =  000097 
    CHR_MAN_SLEEP_HEAD                                          =  0000C9 
    CHR_MAN_STAY                                                =  0000A1 
    CHR_MAN_WALK                                                =  00009D 
    CHR_MIDDLE_LINE                                             =  0000A0 
    CHR_MOVING_LINE                                             =  0000EE 
    CHR_SMOKE                                                   =  0000CD 
    CHR_WALL                                                    =  0000C6 
    CONIN                                                       =  00F009 
    CONST                                                       =  00F006 
    COOUT                                                       =  00F00C 
    COUNT                                                       =  000023 
    CURS                                                        =  00002D 
    DELAY_COUNTER                                               =  00000B 
    DELAY_COUNTER2                                              =  000008 
    DELAY_COUNTER_JUMP                                          =  000004 
  0 FAIL_DELAY                                                     000AC9 R
    GAMES_LINES                                                 =  000006 
    GAME_START_Y                                                =  000002 
  0 HIGH_SCORE_TABLE01                                             000B4F R
  0 HIGH_SCORE_TABLE01.level                                       000B53 R
  0 HIGH_SCORE_TABLE01.points                                      000B51 R
    HIGH_SCORE_TABLE01_size                                     =  000002 
  0 HIGH_SCORE_TABLE02                                             000B54 R
  0 HIGH_SCORE_TABLE02.level                                       000B58 R
  0 HIGH_SCORE_TABLE02.points                                      000B56 R
    HIGH_SCORE_TABLE02_size                                     =  000002 
  0 HIGH_SCORE_TABLE03                                             000B59 R
  0 HIGH_SCORE_TABLE03.level                                       000B5D R
  0 HIGH_SCORE_TABLE03.points                                      000B5B R
    HIGH_SCORE_TABLE03_size                                     =  000002 
  0 HIGH_SCORE_TABLE04                                             000B5E R
  0 HIGH_SCORE_TABLE04.level                                       000B62 R
  0 HIGH_SCORE_TABLE04.points                                      000B60 R
    HIGH_SCORE_TABLE04_size                                     =  000002 
  0 HIGH_SCORE_TABLE05                                             000B63 R
  0 HIGH_SCORE_TABLE05.level                                       000B67 R
  0 HIGH_SCORE_TABLE05.points                                      000B65 R
    HIGH_SCORE_TABLE05_size                                     =  000002 
  0 HIGH_SCORE_TABLE_TMP                                           000B68 R
  0 HIGH_SCORE_TABLE_TMP.level                                     000B6C R
  0 HIGH_SCORE_TABLE_TMP.points                                    000B6A R
    HIGH_SCORE_TABLE_TMP_size                                   =  000002 
  0 HINT_COPYRIGHT                                                 00096B R
    HINT_COPYRIGHT_size                                         =  00001E 
  0 HINT_EXIT                                                      00095F R
    HINT_EXIT_size                                              =  00000C 
  0 HINT_JUMP                                                      000947 R
    HINT_JUMP_size                                              =  00000C 
  0 HINT_LEFT                                                      00093B R
    HINT_LEFT_size                                              =  00000C 
  0 HINT_NAME                                                      000989 R
    HINT_NAME_size                                              =  00000E 
  0 HINT_PLAY                                                      000953 R
    HINT_PLAY_size                                              =  00000C 
  0 HINT_RIGHT                                                     00092F R
    HINT_RIGHT_size                                             =  00000C 
  0 HINT_YEAR                                                      000997 R
    HINT_YEAR_size                                              =  00000E 
    HI_ZERO                                                     =  000000 
  0 INITIALS                                                       000B6D R
    INITIALS_size                                               =  000002 
    INITIAL_DELAY_COUNTER                                       =  000001 
    INITIAL_FAIL_COUNTER                                        =  000002 
    INITIAL_LEVEL                                               =  000001 
    INITIAL_LIVES                                               =  000006 
  0 JUMP_DELAY                                                     000AC8 R
    KEYBU                                                       =  000025 
    LAKEY                                                       =  000024 
  0 LEVEL                                                          000ACD R
    LEVEL_1                                                     =  000001 
  0 LINE_BUFFER                                                    0009AA R
    LINE_BUFFER_size                                            =  00010F 
  0 LIVES                                                          000ACA R
  0 MAN_HEAD                                                       000AC6 R
    MAX_FAIL_COUNTER                                            =  000005 
    MAX_LEVEL                                                   =  000008 
    MENU_TOP                                                    =  000010 
    MONSTER_CORRECTION                                          =  000001 
  0 MONSTER_IMG                                                    000B17 R
    MONSTER_IMG_size                                            =  000038 
  0 MONSTER_PTR                                                    000ADF R
    MONSTER_PTR_size                                            =  000038 
    MONSTER_WIDTH                                               =  000004 
    MOVE_2X_RIGHT                                               =  000002 
    NUMBER_HIGHSCORE_ENTRIES                                    =  000005 
    NUMBER_OF_LINES                                             =  000008 
  0 OFFSET_HOLES                                                   000ABA R
  0 OFFSET_HOLES_JUMP_PENALTY                                      000ABF R
    OFFSET_HOLES_JUMP_PENALTY_size                              =  000005 
    OFFSET_HOLES_size                                           =  000005 
    P1ROL                                                       =  00003B 
    P2ROL                                                       =  00003C 
    P3ROL                                                       =  00003D 
    P4ROL                                                       =  00003E 
  0 POINTS                                                         000ACB R
    POSDIFF_HIGHSCORE_DY                                        =  000004 
    POSDIFF_NAME                                                =  00000D 
    POSDIFF_POINTS                                              =  000008 
    POSDIFF_YEAR                                                =  000005 
    POSDIFF_YOUR_SCORE                                          =  FFFFFFD8 
    POSDIFF_YOUR_SCORE_DY                                       =  000003 
    POS_COPYRIGHT                                               =  000370 
    POS_GAME_OVER                                               =  00EC0D 
    POS_LIVES                                                   =  00EF98 
    POS_TOP_GAME                                                =  00EC0C 
    POS_TOP_WALL                                                =  00EC28 
    SCREEN_HEIGHT                                               =  000018 
    SCREEN_WIDTH                                                =  000028 
    SLOW_DOWN_13066                                             =  004650 
    SMALL_CAPITALS                                              =  00005F 
  0 START                                                          00000D R
    TITLE_TOP_SIZE                                              =  000230 
  0 TOP_IMAGE                                                      0006FF R
    TOP_IMAGE_size                                              =  0001FF 
    TOP_LINES                                                   =  00000E 
    TRANSITION_MAN_WALK_STAY                                    =  000004 
  0 TXT_GAME_OVER                                                  000B6F R
    TXT_GAME_OVER_size                                          =  00000F 
  0 TXT_HAZARD                                                     000B8A R
    TXT_HAZARD_size                                             =  000009 
  0 TXT_JUMP                                                       000ACF R
    TXT_JUMP_size                                               =  000010 
  0 TXT_NEW_HIGH_SCORE                                             000B93 R
    TXT_NEW_HIGH_SCORE_size                                     =  000012 
  0 TXT_YOUR_SCORE                                                 000B7E R
    TXT_YOUR_SCORE_size                                         =  00000C 
    UP_CONSI                                                    =  000001 
    UP_CONSO                                                    =  000002 
    UP_CSTS                                                     =  00000B 
    UP_DCU                                                      =  00001D 
    UP_PRNST                                                    =  000009 
    UP_SETCU                                                    =  000012 
  0 VERSION_INFO                                                   0009A5 R
    VERSION_INFO_size                                           =  000005 
    VK_CLS                                                      =  00000C 
    VK_HEART                                                    =  0000CB 
    VK_LEFT                                                     =  000008 
    VK_PLAYER                                                   =  0000C4 
    VK_RIGHT                                                    =  000009 
    WBOOT                                                       =  00F003 
    ZERO                                                        =  000000 
  0 _main                                                          000000 GR
  0 action_jump                                                    00039D R
  0 action_left                                                    0002ED R
  0 action_right                                                   000344 R
  0 add_10_points                                                  0004B8 R
  0 animation_delay                                                0002E0 GR
  0 animation_lines                                                000270 R
  0 animation_loop                                                 000126 R
  0 animation_monster                                              0001B1 R
  0 ask_exit_game                                                  000675 R
  0 capitalized                                                    000094 R
  0 check_fall_through                                             000401 R
  0 check_for_trap                                                 000407 R
  0 check_level_finished                                           000452 R
  0 choose_menu                                                    000084 R
  0 cnt_fail_jump                                                  000AC5 R
  0 cnt_fail_trap                                                  000AC4 R
  0 correct_left_border                                            000330 R
  0 correct_ptr                                                    0001FB R
  0 correct_right_border                                           000387 R
  0 counter                                                        000ACE R
  0 decimal_loop                                                   000502 R
  0 delay_loop                                                     0002E7 R
  0 draw_monster                                                   000232 R
  0 draw_monster_segment                                           000237 R
  0 draw_new_highscore_box                                         0006CD R
  0 draw_player                                                    0000BB R
  0 erase_player_fell_down                                         00042F R
  0 exit_game                                                      000687 R
  0 get_column                                                     0001F4 R
  0 get_decimal_digit                                              000501 R
  0 handle_by_column                                               0001D8 R
  0 handle_by_ptr                                                  0001D4 R
  0 handle_fail_delay                                              000150 R
  0 handle_jump_delay                                              000153 R
  0 handle_one_monster                                             0001C0 R
    inkey                                                       =  00FD33 
  0 input                                                          000592 R
  0 insert_score                                                   00069C R
  0 jump_delay_counter_set                                         00015E R
  0 jump_fail                                                      0003DA R
  0 jump_ok                                                        0003B6 R
  0 left_border_next_adr                                           000322 R
  0 loop_failed_penalty_holes                                      000285 R
  0 loop_jump_penalty_holes                                        0002A4 R
  0 loop_left_border_check                                         000316 R
  0 loop_right_border_check                                        00036D R
  0 m_070a                                                         000675 R
  0 monster_check_crash                                            000254 R
  0 move_one_line_up                                               000217 R
  0 move_table_entry                                               0006A3 R
  0 new_game                                                       00009D R
  0 new_level_set                                                  000465 R
  0 no_lives                                                       000518 R
  0 player_activity                                                0001A7 R
  0 player_fell_down                                               000437 R
  0 player_wake_up                                                 00018E R
  0 print_decimal                                                  0004D5 R
  0 print_highscore_entry                                          000600 R
  0 print_highscore_table                                          0005F8 R
  0 print_line                                                     0002C4 R
    prst7                                                          ****** GX
  0 right_border_next_adr                                          000379 R
  0 round_end                                                      000496 R
  0 sadr                                                           000000 GR
    set_cursor                                                     ****** GX
  0 start_from_bottom                                              000205 R
    ta_alpha                                                    =  000000 
  0 test_column                                                    00020C R
  0 transition_left_stay                                           000309 R
  0 transition_left_walk                                           00030D R
  0 transition_stay                                                000360 R
  0 transition_walk                                                000364 R
  0 update_left                                                    00030F R
  0 update_pointers                                                00021E R
  0 update_right                                                   000366 R
    z1013                                                       =  000000 
    z9001                                                       =  000001 


ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 2.
Hexadecimal [24-Bits]

Area Table

   0 _CODE                                      size    BA5   flags    0
   1 _DATA                                      size      0   flags    0


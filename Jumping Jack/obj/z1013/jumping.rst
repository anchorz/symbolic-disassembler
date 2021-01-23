                                      1         .module jumping_jack
                                      2         .include 'platform.s'
                           000000     1 z9001                           =       0
                           000001     2 z1013                           =       1
                           000000     3 ta_alpha                        =       0
                                      4 ;
                                      5 ; z1013 specific constants
                                      6 ;
                           000004     7 KEY_CODE                        =       0x0004
                           00002B     8 CURSOR_POS                      =       0x002b
                           00EC00     9 BWS                             =       0xec00
                           000020    10 SCREEN_WIDTH                    =       32
                           000020    11 SCREEN_HEIGHT                   =       32
                                     12 
                           000008    13 VK_LEFT                         =       0x08
                           000009    14 VK_RIGHT                        =       0x09
                                     15 
                           0000CB    16 VK_HEART                        =       0xcb
                           0000C6    17 CHR_WALL                        =       0xc6
                           0000CC    18 CHR_MAN_HEAD                    =       0xcc
                           0000A1    19 CHR_MAN_STAY                    =       0xa1
                           00009D    20 CHR_MAN_WALK                    =       0x9d
                           000004    21 TRANSITION_MAN_WALK_STAY        =       0x04
                           0000EE    22 CHR_MOVING_LINE                 =       0xee
                           0000C4    23 VK_PLAYER                       =       0xc4
                           0000CD    24 CHR_SMOKE                       =       0xcd
                           000097    25 CHR_MAN_SLEEP                   =       0x97
                           0000C9    26 CHR_MAN_SLEEP_HEAD              =       0xc9
                           000095    27 CHR_ARROW_RIGHT_TOP             =       0x95
                           000093    28 CHR_ARROW_RIGHT_BOTTOM          =       0x93
                           0000F8    29 CHR_LINE_TOP                    =       0xf8
                           00009E    30 CHR_LINE_BOTTOM                 =       0x9e
                           0000A0    31 CHR_MIDDLE_LINE                 =       0xa0
                                     32 ;
                                     33 ; platform specific
                                     34 ;
                                     35 
                           000010    36 TOP_LINES                       =       16
                           0001FF    37 TITLE_TOP_SIZE                  =       SCREEN_WIDTH*TOP_LINES-1
                           000014    38 MENU_TOP                        =       (TOP_LINES+4)
                           000000    39 ALIGN_MIDDLE                    =       0
                           000008    40 GAMES_LINES                     =       8
                           000003    41 GAME_START_Y                    =       3
                           00330A    42 SLOW_DOWN_13066                 =       13066
                           000380    43 POS_COPYRIGHT                   =       SCREEN_WIDTH*28
                           00EFC0    44 POS_LIVES                       =       BWS+30*SCREEN_WIDTH
                           00EC40    45 POS_TOP_WALL                    =       BWS+ 2*SCREEN_WIDTH
                           00EC28    46 POS_TOP_GAME                    =       BWS+ 1*SCREEN_WIDTH+8
                           00EC49    47 POS_GAME_OVER                   =       BWS+ 2*SCREEN_WIDTH+9
                           00001E    48 HINT_COPYRIGHT_size             =       0x001e
                           000009    49 POSDIFF_NAME                    =       SCREEN_WIDTH-HINT_COPYRIGHT_size+7
                           00000B    50 POSDIFF_YEAR                    =       SCREEN_WIDTH-HINT_NAME_size-7
                           000000    51 POSDIFF_POINTS                  =       0
                           000000    52 POSDIFF_YOUR_SCORE              =       0
                           000000    53 POSDIFF_YOUR_SCORE_DY           =       0
                           000000    54 POSDIFF_HIGHSCORE_DY            =       0
                           000000    55 MONSTER_CORRECTION              =       0
                                     56 
                                     57 .macro PROGRAM_START
                                     58 .endm
                                     59 
                                     60 .macro SCREEN_POS
                                     61 .endm
                                     62 
                                     63 .macro CLRSCR
                                     64         ld      a,#0x0c
                                     65         rst     0x20
                                     66         .db     0x00              ;OUTCH
                                     67 .endm
                                     68 
                                     69 .macro OUTCH
                                     70         rst     0x20
                                     71         .db     0x00              ;OUTCH
                                     72 .endm
                                     73 
                                     74 .macro INCH
                                     75         rst     0x20
                                     76         .db     0x01              ;INCH
                                     77 .endm
                                     78 
                                     79 .macro PRST7
                                     80         rst     0x20
                                     81         .db     0x02              ;PRTST7
                                     82 .endm
                                     83 
                                     84 .macro INKEY
                                     85         xor     a
                                     86         ld      (KEY_CODE),a
                                     87         rst     0x20
                                     88         .db     0x04              ;INKEY
                                     89 .endm
                                     90 
                                     91 .macro END_PROGRAM
                                     92         rst     0x38
                                     93 .endm
                                     94 
                                     95 .macro SET_CURSOR_DE Y,X
                                     96         ld      de,#BWS+Y*SCREEN_WIDTH+X
                                     97         ld      (CURSOR_POS),de
                                     98 .endm
                                     99 
                                    100 .macro SET_CURSOR_HL Y,X
                                    101         ld      hl,#BWS+Y*SCREEN_WIDTH+X
                                    102         ld      (CURSOR_POS),hl
                                    103 .endm
                                    104 
                                    105 .macro SET_CURSOR
                                    106         ld      (CURSOR_POS),hl
                                    107 .endm
                                    108 
                                    109 .macro REMOVE_CURSOR
                                    110         ld      hl,(CURSOR_POS)
                                    111         ld      (hl),#' '
                                    112 .endm
                                    113 
                                    114 .macro CURSOR_DISABLE
                                    115 .endm
                                    116 
                                    117 .macro Z1013_LINE
                                    118         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    119         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    120         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    121         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    122 .endm
                                    123 
                                    124 .macro TOP_IMAGE_CONTENT
                                    125  ; line 1
                                    126         SCREEN_POS
                                    127         .db     0xae,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e ;........
                                    128         .db     0x9e,0x9e,0xad,0x20,0x20,0x20,0x20,0x20 ;..-     
                                    129         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    130         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    131         SCREEN_POS
                                    132         
                                    133         ; line 2
                                    134         SCREEN_POS
                                    135         .db     0x9f,0xb9,0xb6,0xb3,0xb2,0xb6,0xb8,0x20 ;.963268 
                                    136         .db     0xbd,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;=0@     
                                    137         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
                                    138         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    139         SCREEN_POS
                                    140 
                                    141         ; line 3
                                    142         SCREEN_POS
                                    143         .db     0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
                                    144         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
                                    145         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
                                    146         .db     0x20,0x20,0x20,0x20,0xb7,0xb7,0x20,0x20 ;    77  
                                    147         SCREEN_POS
                                    148 
                                    149         ; line 4
                                    150         SCREEN_POS
                                    151         .db     0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
                                    152         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
                                    153         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    154         .db     0xb6,0xb7,0x20,0xb9,0xb2,0xb2,0xb8,0x20 ;67 9228 
                                    155         SCREEN_POS
                                    156 
                                    157         ; line 5
                                    158         SCREEN_POS
                                    159         .db     0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
                                    160         .db     0xb6,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;60@     
                                    161         .db     0x20,0x20,0xb2,0xb3,0x20,0x20,0x20,0x20 ;  23    
                                    162         .db     0x20,0xba,0xa0,0xb4,0xb4,0xa0,0xb5,0x20 ; : 44 5 
                                    163         SCREEN_POS
                                    164 
                                    165         ; line 6
                                    166         SCREEN_POS
                                    167         .db     0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
                                    168         .db     0x73,0x3a,0xc0,0x20,0x20,0x20,0x20,0x20 ;s:@     
                                    169         .db     0x20,0xb2,0xb0,0xb1,0xb3,0x20,0x20,0xb7 ; 2013  7
                                    170         .db     0xb6,0xb1,0xb3,0xb8,0xb1,0xb1,0xb9,0x20 ;6138119 
                                    171         SCREEN_POS
                                    172 
                                    173         ; line 7
                                    174         SCREEN_POS
                                    175         .db     0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
                                    176         .db     0xf8,0xf8,0xac,0x20,0x20,0x20,0x20,0x20 ;xx,     
                                    177         .db     0x20,0xb0,0x20,0x20,0xb5,0xb7,0xb6,0x20 ; 0  576 
                                    178         .db     0x20,0x20,0xb1,0xb3,0xb6,0xbc,0x20,0x20 ;  136<  
                                    179         SCREEN_POS
                                    180 
                                    181         ; line 8
                                    182         SCREEN_POS
                                    183         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    184         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    185         .db     0xb1,0xb6,0xb6,0xb6,0xb6,0x20,0x20,0x20 ;16666   
                                    186         .db     0x20,0x20,0x20,0xb1,0xb9,0x20,0x20,0x20 ;   19   
                                    187          SCREEN_POS
                                    188 
                                    189         ; line 9
                                    190         Z1013_LINE
                                    191 
                                    192         ; line 10
                                    193         Z1013_LINE
                                    194 
                                    195         ; line 11
                                    196         SCREEN_POS
                                    197         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    198         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    199         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    200         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    201          SCREEN_POS
                                    202 
                                    203         ; line 12
                                    204         SCREEN_POS
                                    205         .db     0x20,0x20,0x20,0xb4,0x20,0x20,0x20,0x20 ;   4    
                                    206         .db     0x20,0x20,0x20,0x20,0xb0,0x20,0x20,0x20 ;    0   
                                    207         .db     0x20,0x20,0x20,0x20,0x20,0x20,0xb4,0x20 ;      4 
                                    208         .db     0x20,0x20,0x20,0x20,0xb4,0xb2,0x20,0x20 ;    42  
                                    209          SCREEN_POS
                                    210 
                                    211         ; line 13
                                    212         SCREEN_POS
                                    213         .db     0x20,0x20,0x20,0xb4,0xb4,0xb5,0xb5,0xbd ;   4455=
                                    214         .db     0xbd,0xb5,0xb6,0xb3,0xb4,0xbc,0xbd,0xb2 ;=5634<=2
                                    215         .db     0xb6,0xb3,0x20,0x20,0x20,0x20,0xb4,0xb1 ;63    41
                                    216         .db     0xb8,0xb2,0xb6,0xb3,0xbb,0xb0,0x20,0x20 ;8263;0  
                                    217          SCREEN_POS
                                    218 
                                    219         ; line 14
                                    220         SCREEN_POS
                                    221         .db     0x20,0xb3,0x20,0xb4,0xb4,0xb5,0xb5,0xb5 ; 3 44555
                                    222         .db     0xb5,0xb5,0xb7,0xb0,0xb4,0xb4,0xb5,0xb1 ;55704451
                                    223         .db     0xb7,0xb4,0x20,0x20,0xb3,0x20,0xb4,0xb9 ;74  3 49
                                    224         .db     0xbd,0xb5,0x20,0xb3,0xb4,0xb8,0x20,0x20 ;=5 348  
                                    225          SCREEN_POS
                                    226 
                                    227         ; line 15
                                    228         SCREEN_POS
                                    229         .db     0x20,0xb8,0xb7,0xb0,0xb1,0xb0,0xb1,0xb1 ; 8701011
                                    230         .db     0xb1,0xb5,0x20,0x20,0xb0,0xb0,0xb1,0xb1 ;15  0011
                                    231         .db     0xb7,0xb0,0x20,0x20,0xb8,0xb7,0xb0,0xb1 ;70  8701
                                    232         .db     0xb6,0x20,0xb6,0x20,0xb0,0x20,0xb0,0x20 ;6 6 0 0 
                                    233          SCREEN_POS
                                    234 
                                    235         ; line 16
                                    236         SCREEN_POS
                                    237         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    238         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    239         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    240         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    241         SCREEN_POS
                                    242 .endm
                                    243 
                                    244 .macro MONSTER_IMG_CONTENT
                                    245         .db     0x94,0x90,0x8b,0x90,0x8b,0x91,0x97,0x91 ;........
                                    246         .db     0x19,0xb5,0x20,0xbe,0x20,0xbf,0x20,0xae ;.5 > ? .
                                    247         .db     0x92,0x96,0xa0,0xa0,0xa0,0xa0,0x88,0xc1 ;..    .A
                                    248         .db     0x20,0x95,0x20,0xb7,0x1e,0xff,0x20,0x92 ; . 7.. .
                                    249         .db     0x17,0x8c,0xf9,0x8c,0x1d,0x1f,0xfc,0x8c ;..y...|.
                                    250         .db     0x92,0x96,0x83,0x82,0x95,0x93,0x20,0x20 ;......  
                                    251         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    252 .endm
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
      000100                         59 _main:
      000100                         60 sadr:
      000000                         61         PROGRAM_START
      000000                         62         CLRSCR
      000100 3E 0C            [ 7]    1         ld      a,#0x0c
      000102 E7               [11]    2         rst     0x20
      000103 00                       3         .db     0x00              ;OUTCH
      000104 11 00 EC         [10]   63         ld      de,#BWS
      000107 21 A4 07         [10]   64         ld      hl,#TOP_IMAGE
      00010A 01 FF 01         [10]   65         ld      bc,#TITLE_TOP_SIZE
      00010D ED B0            [21]   66         ldir
      00010F 21 00 EE         [10]   67         ld      hl,#BWS+SCREEN_WIDTH*TOP_LINES
      000112 36 CB            [10]   68         ld      (hl),#VK_HEART
      000114 11 01 EE         [10]   69         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+1
      000117 01 1F 00         [10]   70         ld      bc,#SCREEN_WIDTH-1
      00011A ED B0            [21]   71         ldir
      00011C 11 18 EE         [10]   72         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+(SCREEN_WIDTH-8)
      00011F 21 1A 0A         [10]   73         ld      hl,#VERSION_INFO
      000122 01 05 00         [10]   74         ld      bc,#VERSION_INFO_size
      000125 ED B0            [21]   75         ldir
      000127 11 8A EE         [10]   76         ld      de,#BWS+SCREEN_WIDTH*MENU_TOP+10+ALIGN_MIDDLE
      00012A 21 A4 09         [10]   77         ld      hl,#HINT_RIGHT
      00012D 01 0C 00         [10]   78         ld      bc,#HINT_RIGHT_size
      000130 ED B0            [21]   79         ldir
      000132 0E 14            [ 7]   80         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000134 EB               [ 4]   81         ex      de,hl
      000135 09               [11]   82         add     hl,bc
      000136 EB               [ 4]   83         ex      de,hl
      000137 0E 0C            [ 7]   84         ld      c,#HINT_RIGHT_size
      000139 ED B0            [21]   85         ldir
      00013B 0E 14            [ 7]   86         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      00013D EB               [ 4]   87         ex      de,hl
      00013E 09               [11]   88         add     hl,bc
      00013F EB               [ 4]   89         ex      de,hl
      000140 0E 0C            [ 7]   90         ld      c,#HINT_RIGHT_size
      000142 ED B0            [21]   91         ldir
      000144 0E 14            [ 7]   92         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      000146 EB               [ 4]   93         ex      de,hl
      000147 09               [11]   94         add     hl,bc
      000148 EB               [ 4]   95         ex      de,hl
      000149 0E 0C            [ 7]   96         ld      c,#HINT_RIGHT_size
      00014B ED B0            [21]   97         ldir
      00014D 0E 14            [ 7]   98         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      00014F EB               [ 4]   99         ex      de,hl
      000150 09               [11]  100         add     hl,bc
      000151 EB               [ 4]  101         ex      de,hl
      000152 0E 0C            [ 7]  102         ld      c,#HINT_RIGHT_size
      000154 ED B0            [21]  103         ldir
      000156 11 80 EF         [10]  104         ld      de,#BWS+POS_COPYRIGHT
      000159 0E 1E            [ 7]  105         ld      c,#HINT_COPYRIGHT_size
      00015B ED B0            [21]  106         ldir
      00015D 0E 09            [ 7]  107         ld      c,#POSDIFF_NAME
      00015F EB               [ 4]  108         ex      de,hl
      000160 09               [11]  109         add     hl,bc
      000161 EB               [ 4]  110         ex      de,hl
      000162 0E 0E            [ 7]  111         ld      c,#HINT_NAME_size
      000164 ED B0            [21]  112         ldir
      000166 0E 0B            [ 7]  113         ld      c,#POSDIFF_YEAR
      000168 EB               [ 4]  114         ex      de,hl
      000169 09               [11]  115         add     hl,bc
      00016A EB               [ 4]  116         ex      de,hl
      00016B 0E 12            [ 7]  117         ld      c,#HINT_YEAR_size+VERSION_INFO_size-1
      00016D ED B0            [21]  118         ldir
      00016F                        119 choose_menu:
      00016F AF               [ 4]  120         xor     a
      000070                        121         INCH
      000170 E7               [11]    1         rst     0x20
      000171 01                       2         .db     0x01              ;INCH
      000172 FE 5F            [ 7]  122         cp      #SMALL_CAPITALS
      000174 38 02            [12]  123         jr      c,capitalized
      000176 D6 20            [ 7]  124         sub     #CAPITALIZE
      000178                        125 capitalized:
      000178 FE 45            [ 7]  126         cp      #'E'
      00017A CA 2F 07         [10]  127         jp      z,exit_game
      00017D FE 50            [ 7]  128         cp      #'P'
      00017F 20 EE            [12]  129         jr      nz,choose_menu
      000181                        130 new_game:
      000081                        131         CLRSCR
      000181 3E 0C            [ 7]    1         ld      a,#0x0c
      000183 E7               [11]    2         rst     0x20
      000184 00                       3         .db     0x00              ;OUTCH
      000185 21 3F 0B         [10]  132         ld      hl,#LIVES
      000188 36 06            [10]  133         ld      (hl),#INITIAL_LIVES
      00018A 21 40 0B         [10]  134         ld      hl,#POINTS
      00018D 36 00            [10]  135         ld      (hl),#ZERO
      00018F 23               [ 6]  136         inc     hl
      000190 36 00            [10]  137         ld      (hl),#ZERO
      000192 06 06            [ 7]  138         ld      b,#INITIAL_LIVES
      000194 21 C0 EF         [10]  139         ld      hl,#POS_LIVES
      000197                        140 draw_player:
      000197 3E 02            [ 7]  141         ld      a,#MOVE_2X_RIGHT
      000199 85               [ 4]  142         add     a,l
      00019A 6F               [ 4]  143         ld      l,a
      00019B 36 C4            [10]  144         ld      (hl),#VK_PLAYER
      00019D 10 F8            [13]  145         djnz    draw_player
      00019F 3E 01            [ 7]  146         ld      a,#INITIAL_LEVEL
      0001A1 32 42 0B         [13]  147         ld      (LEVEL),a
      0001A4 3E 02            [ 7]  148         ld      a,#INITIAL_FAIL_COUNTER
      0001A6 32 39 0B         [13]  149         ld      (cnt_fail_trap),a
      0001A9 32 3A 0B         [13]  150         ld      (cnt_fail_jump),a
      0001AC 21 00 EC         [10]  151         ld      hl,#BWS
      0001AF 36 20            [10]  152         ld      (hl),#' '
      0001B1 11 01 EC         [10]  153         ld      de,#BWS+1
      0001B4 01 BE 03         [10]  154         ld      bc,#(3+GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH-2
      0001B7 ED B0            [21]  155         ldir
      0001B9 21 40 EC         [10]  156         ld      hl,#POS_TOP_WALL
      0001BC 36 C6            [10]  157         ld      (hl),#CHR_WALL
      0001BE 11 41 EC         [10]  158         ld      de,#POS_TOP_WALL+1
      0001C1 01 1F 00         [10]  159         ld      bc,#SCREEN_WIDTH-1
      0001C4 ED B0            [21]  160         ldir
      0001C6 21 78 EC         [10]  161         ld      hl,#POS_TOP_WALL+2*SCREEN_WIDTH-8
      0001C9 36 C6            [10]  162         ld      (hl),#CHR_WALL
      0001CB 2B               [ 6]  163         dec     hl
      0001CC 2B               [ 6]  164         dec     hl
      0001CD 36 95            [10]  165         ld      (hl),#CHR_ARROW_RIGHT_TOP
      0001CF 2B               [ 6]  166         dec     hl
      0001D0 36 F8            [10]  167         ld      (hl),#CHR_LINE_TOP
      0001D2 21 98 EC         [10]  168         ld      hl,#POS_TOP_WALL+3*SCREEN_WIDTH-8
      0001D5 36 C6            [10]  169         ld      (hl),#CHR_WALL
      0001D7 2B               [ 6]  170         dec     hl
      0001D8 2B               [ 6]  171         dec     hl
      0001D9 36 93            [10]  172         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      0001DB 2B               [ 6]  173         dec     hl
      0001DC 36 9E            [10]  174         ld      (hl),#CHR_LINE_BOTTOM
      0001DE 21 44 0B         [10]  175         ld      hl,#TXT_JUMP
      0001E1 11 28 EC         [10]  176         ld      de,#POS_TOP_GAME
      0001E4 01 10 00         [10]  177         ld      bc,#TXT_JUMP_size
      0001E7 ED B0            [21]  178         ldir
      0001E9 3E 01            [ 7]  179         ld      a,#INITIAL_DELAY_COUNTER
      0001EB 21 3D 0B         [10]  180         ld      hl,#JUMP_DELAY
      0001EE 77               [ 7]  181         ld      (hl),a
      0001EF 21 3E 0B         [10]  182         ld      hl,#FAIL_DELAY
      0001F2 77               [ 7]  183         ld      (hl),a
      0001F3 23               [ 6]  184         inc     hl
      0001F4 21 6E EF         [10]  185         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      0001F7 22 3B 0B         [16]  186         ld      (MAN_HEAD),hl
      0001FA 36 CC            [10]  187         ld      (hl),#CHR_MAN_HEAD
      0001FC 11 20 00         [10]  188         ld      de,#SCREEN_WIDTH
      0001FF 19               [11]  189         add     hl,de
      000200 36 A1            [10]  190         ld      (hl),#CHR_MAN_STAY
      000202                        191 animation_loop:
      000202 CD A4 02         [17]  192         call    animation_monster
      000205 CD 63 03         [17]  193         call    animation_lines
      000208 CD D3 03         [17]  194         call    animation_delay
      00020B 3A 3D 0B         [13]  195         ld      a,(JUMP_DELAY)
      00020E FE 01            [ 7]  196         cp      #INITIAL_DELAY_COUNTER
      000210 20 34            [12]  197         jr      nz,handle_jump_delay
      000212 3A 3E 0B         [13]  198         ld      a,(FAIL_DELAY)
      000215 FE 01            [ 7]  199         cp      #INITIAL_DELAY_COUNTER
      000217 20 2A            [12]  200         jr      nz,handle_fail_delay
      000119                        201         INKEY
      000219 AF               [ 4]    1         xor     a
      00021A 32 04 00         [13]    2         ld      (KEY_CODE),a
      00021D E7               [11]    3         rst     0x20
      00021E 04                       4         .db     0x04              ;INKEY
      00021F FE 20            [ 7]  202         cp      #' '
      000221 CA 90 04         [10]  203         jp      z,action_jump
      000224 FE 08            [ 7]  204         cp      #VK_LEFT
      000226 CC E0 03         [17]  205         call    z,action_left
      000229 FE 09            [ 7]  206         cp      #VK_RIGHT
      00022B CC 37 04         [17]  207         call    z,action_right
                           000001   208 .if  eq,z9001
                                    209         ;debuggin
      00022E FE 55            [ 7]  210         cp      #'U'
      000230 20 0A            [12]  211         jr      nz,next_cmd
      000232 21 74 EC         [10]  212         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+20
      000235 36 CC            [10]  213         ld      (hl),#CHR_MAN_HEAD
      000237 22 3B 0B         [16]  214         ld      (MAN_HEAD),hl
      00023A 18 07            [12]  215         jr      handle_fail_delay
      00023C                        216 next_cmd:
      00023C FE 58            [ 7]  217         cp      #'X'
      00023E 20 03            [12]  218         jr      nz,handle_fail_delay
      000240 C3 FA 05         [10]  219         jp      no_lives
                                    220 .endif
      000243                        221 handle_fail_delay:
      000243 CD F4 04         [17]  222         call    check_fall_through
      000246                        223 handle_jump_delay:
      000246 3A 3D 0B         [13]  224         ld      a,(JUMP_DELAY)
      000249 FE 01            [ 7]  225         cp      #INITIAL_DELAY_COUNTER
      00024B 28 04            [12]  226         jr      z,jump_delay_counter_set
      00024D 3D               [ 4]  227         dec     a
      00024E 32 3D 0B         [13]  228         ld      (JUMP_DELAY),a
      000251                        229 jump_delay_counter_set:
      000251 3A 3E 0B         [13]  230         ld      a,(FAIL_DELAY)
      000254 FE 01            [ 7]  231         cp      #INITIAL_DELAY_COUNTER
      000256 28 42            [12]  232         jr      z,player_activity
      000258 3D               [ 4]  233         dec     a
      000259 32 3E 0B         [13]  234         ld      (FAIL_DELAY),a
      00025C FE 01            [ 7]  235         cp      #INITIAL_DELAY_COUNTER
      00025E 20 3A            [12]  236         jr      nz,player_activity
      000260 2A 3B 0B         [16]  237         ld      hl,(MAN_HEAD)
                                    238         ; test for bottom line
      000263 11 20 EF         [10]  239         ld      de,#BWS+(GAME_START_Y+3*GAMES_LINES-2)*SCREEN_WIDTH
      000266 A7               [ 4]  240         and     a
      000267 ED 52            [15]  241         sbc     hl,de
      000269 38 16            [12]  242         jr      c,player_wake_up
      00026B 3A 3F 0B         [13]  243         ld      a,(LIVES)
      00026E 3D               [ 4]  244         dec     a
      00026F 32 3F 0B         [13]  245         ld      (LIVES),a
      000272 21 C2 EF         [10]  246         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES+3)*SCREEN_WIDTH+2
      000275 16 00            [ 7]  247         ld      d,#HI_ZERO
      000277 87               [ 4]  248         add     a,a
      000278 5F               [ 4]  249         ld      e,a
      000279 19               [11]  250         add     hl,de
      00027A 36 20            [10]  251         ld      (hl),#' '
      00027C FE 00            [ 7]  252         cp      #ZERO
      00027E CA FA 05         [10]  253         jp      z,no_lives
      000281                        254 player_wake_up:
      000281 2A 3B 0B         [16]  255         ld      hl,(MAN_HEAD)
      000284 36 CC            [10]  256         ld      (hl),#CHR_MAN_HEAD
      000286 2B               [ 6]  257         dec     hl
      000287 3E 20            [ 7]  258         ld      a,#' '
      000289 77               [ 7]  259         ld      (hl),a
      00028A 23               [ 6]  260         inc     hl
      00028B 23               [ 6]  261         inc     hl
      00028C 23               [ 6]  262         inc     hl
      00028D 77               [ 7]  263         ld      (hl),a
      00028E 2B               [ 6]  264         dec     hl
      00028F 11 20 00         [10]  265         ld      de,#SCREEN_WIDTH
      000292 19               [11]  266         add     hl,de
      000293 77               [ 7]  267         ld      (hl),a
      000294 23               [ 6]  268         inc     hl
      000295 77               [ 7]  269         ld      (hl),a
      000296 2B               [ 6]  270         dec     hl
      000297 2B               [ 6]  271         dec     hl
      000298 36 9D            [10]  272         ld      (hl),#CHR_MAN_WALK
      00029A                        273 player_activity:
      00029A CD 45 05         [17]  274         call    check_level_finished
      00029D C3 02 02         [10]  275         jp      animation_loop
                                    276 ; unchecked data source
      0002A0 67 75 66 69            277         .db     0x67,0x75,0x66,0x69                     ;gufi
      0002A4                        278 animation_monster:
      0002A4 3A 42 0B         [13]  279         ld      a,(LEVEL)
      0002A7 32 43 0B         [13]  280         ld      (counter),a
      0002AA FE 01            [ 7]  281         cp      #LEVEL_1
      0002AC C8               [11]  282         ret     z
      0002AD 01 54 0B         [10]  283         ld      bc,#MONSTER_PTR
      0002B0 11 8C 0B         [10]  284         ld      de,#MONSTER_IMG
      0002B3                        285 handle_one_monster:
      0002B3 0A               [ 7]  286         ld      a,(bc)
      0002B4 6F               [ 4]  287         ld      l,a
      0002B5 03               [ 6]  288         inc     bc
      0002B6 0A               [ 7]  289         ld      a,(bc)
      0002B7 67               [ 4]  290         ld      h,a
      0002B8 CD C7 02         [17]  291         call    handle_by_ptr
      0002BB 3A 43 0B         [13]  292         ld      a,(counter)
      0002BE 3D               [ 4]  293         dec     a
      0002BF 32 43 0B         [13]  294         ld      (counter),a
      0002C2 FE 01            [ 7]  295         cp      #LEVEL_1
      0002C4 C8               [11]  296         ret     z
      0002C5 18 EC            [12]  297         jr      handle_one_monster
      0002C7                        298 handle_by_ptr:
      0002C7 C5               [11]  299         push    bc
      0002C8 3E 04            [ 7]  300         ld      a,#MONSTER_WIDTH
      0002CA D5               [11]  301         push    de
      0002CB                        302 handle_by_column:
      0002CB 36 20            [10]  303         ld      (hl),#' '
      0002CD 11 20 00         [10]  304         ld      de,#SCREEN_WIDTH
      0002D0 19               [11]  305         add     hl,de
      0002D1 36 20            [10]  306         ld      (hl),#' '
      0002D3 A7               [ 4]  307         and     a
      0002D4 ED 52            [15]  308         sbc     hl,de
      0002D6 2B               [ 6]  309         dec     hl
      0002D7 E5               [11]  310         push    hl
      0002D8 08               [ 4]  311         ex      af,af'
      0002D9 11 DF EC         [10]  312         ld      de,#BWS+(GAME_START_Y+4)*SCREEN_WIDTH-1
      0002DC A7               [ 4]  313         and     a
      0002DD ED 52            [15]  314         sbc     hl,de
      0002DF 38 0D            [12]  315         jr      c,correct_ptr
      0002E1 C5               [11]  316         push    bc
      0002E2 06 08            [ 7]  317         ld      b,#GAMES_LINES
      0002E4 11 60 00         [10]  318         ld      de,#3*SCREEN_WIDTH
      0002E7                        319 get_column:
      0002E7 A7               [ 4]  320         and     a
      0002E8 ED 52            [15]  321         sbc     hl,de
      0002EA 38 13            [12]  322         jr      c,test_column
      0002EC 10 F9            [13]  323         djnz    get_column
      0002EE                        324 correct_ptr:
      0002EE 11 1F 00         [10]  325         ld      de,#SCREEN_WIDTH-1
      0002F1 ED 5A            [15]  326         adc     hl,de
      0002F3 28 03            [12]  327         jr      z,start_from_bottom
      0002F5 E1               [10]  328         pop     hl
      0002F6 18 19            [12]  329         jr      update_pointers
      0002F8                        330 start_from_bottom:
      0002F8 E1               [10]  331         pop     hl
      0002F9 11 60 02         [10]  332         ld      de,#((GAMES_LINES-2)*3+1)*SCREEN_WIDTH
      0002FC 19               [11]  333         add     hl,de
      0002FD 18 12            [12]  334         jr      update_pointers
      0002FF                        335 test_column:
      0002FF C1               [10]  336         pop     bc
      000300 11 1F 00         [10]  337         ld      de,#SCREEN_WIDTH-1
      000303 ED 5A            [15]  338         adc     hl,de
      000305 28 03            [12]  339         jr      z,move_one_line_up
      000307 E1               [10]  340         pop     hl
      000308 18 07            [12]  341         jr      update_pointers
      00030A                        342 move_one_line_up:
      00030A E1               [10]  343         pop     hl
      00030B 11 40 00         [10]  344         ld      de,#2*SCREEN_WIDTH
      00030E A7               [ 4]  345         and     a
      00030F ED 52            [15]  346         sbc     hl,de
      000311                        347 update_pointers:
      000311 0B               [ 6]  348         dec     bc
      000312 7D               [ 4]  349         ld      a,l
      000313 02               [ 7]  350         ld      (bc),a
      000314 03               [ 6]  351         inc     bc
      000315 7C               [ 4]  352         ld      a,h
      000316 02               [ 7]  353         ld      (bc),a
      000317 03               [ 6]  354         inc     bc
      000318 0A               [ 7]  355         ld      a,(bc)
      000319 6F               [ 4]  356         ld      l,a
      00031A 03               [ 6]  357         inc     bc
      00031B 0A               [ 7]  358         ld      a,(bc)
      00031C 67               [ 4]  359         ld      h,a
      00031D 08               [ 4]  360         ex      af,af'
      00031E 3D               [ 4]  361         dec     a
      00031F FE 00            [ 7]  362         cp      #ZERO
      000321 28 02            [12]  363         jr      z,draw_monster
      000323 18 A6            [12]  364         jr      handle_by_column
      000325                        365 draw_monster:
      000325 D1               [10]  366         pop     de
      000326 C1               [10]  367         pop     bc
      000327 0B               [ 6]  368         dec     bc
      000328 3E 04            [ 7]  369         ld      a,#MONSTER_WIDTH
      00032A                        370 draw_monster_segment:
      00032A 08               [ 4]  371         ex      af,af'
      00032B 0A               [ 7]  372         ld      a,(bc)
      00032C 6F               [ 4]  373         ld      l,a
      00032D 03               [ 6]  374         inc     bc
      00032E 0A               [ 7]  375         ld      a,(bc)
      00032F 67               [ 4]  376         ld      h,a
      000330 03               [ 6]  377         inc     bc
      000331 1A               [ 7]  378         ld      a,(de)
      000332 77               [ 7]  379         ld      (hl),a
      000333 13               [ 6]  380         inc     de
      000334 1A               [ 7]  381         ld      a,(de)
      000335 D5               [11]  382         push    de
      000336 11 20 00         [10]  383         ld      de,#SCREEN_WIDTH
      000339 19               [11]  384         add     hl,de
      00033A 77               [ 7]  385         ld      (hl),a
      00033B CD 47 03         [17]  386         call    monster_check_crash
      00033E D1               [10]  387         pop     de
      00033F 13               [ 6]  388         inc     de
      000340 08               [ 4]  389         ex      af,af'
      000341 3D               [ 4]  390         dec     a
      000342 FE 00            [ 7]  391         cp      #ZERO
      000344 20 E4            [12]  392         jr      nz,draw_monster_segment
      000346 C9               [10]  393         ret
      000347                        394 monster_check_crash:
      000347 A7               [ 4]  395         and     a
      000348 ED 52            [15]  396         sbc     hl,de
      00034A EB               [ 4]  397         ex      de,hl
      00034B 2A 3B 0B         [16]  398         ld      hl,(MAN_HEAD)
      00034E A7               [ 4]  399         and     a
      00034F ED 52            [15]  400         sbc     hl,de
      000351 EB               [ 4]  401         ex      de,hl
      000352 C0               [11]  402         ret     nz
      000353 11 20 00         [10]  403         ld      de,#SCREEN_WIDTH
      000356 19               [11]  404         add     hl,de
      000357 23               [ 6]  405         inc     hl
      000358 36 97            [10]  406         ld      (hl),#CHR_MAN_SLEEP
      00035A 23               [ 6]  407         inc     hl
      00035B 36 C9            [10]  408         ld      (hl),#CHR_MAN_SLEEP_HEAD
      00035D 3E 0B            [ 7]  409         ld      a,#DELAY_COUNTER
      00035F 32 3E 0B         [13]  410         ld      (FAIL_DELAY),a
      000362 C9               [10]  411         ret
      000363                        412 animation_lines:
      000363 3E EE            [ 7]  413         ld      a,#CHR_MOVING_LINE
      000365 21 1F 0A         [10]  414         ld      hl,#LINE_BUFFER
      000368 77               [ 7]  415         ld      (hl),a
      000369 11 20 0A         [10]  416         ld      de,#LINE_BUFFER+1
      00036C 01 0E 01         [10]  417         ld      bc,#LINE_BUFFER_size-1
      00036F ED B0            [21]  418         ldir
      000371 3A 39 0B         [13]  419         ld      a,(cnt_fail_trap)
      000374 11 2F 0B         [10]  420         ld      de,#OFFSET_HOLES
      000377 1B               [ 6]  421         dec     de
      000378                        422 loop_failed_penalty_holes:
      000378 F5               [11]  423         push    af
      000379 13               [ 6]  424         inc     de
      00037A 1A               [ 7]  425         ld      a,(de)
      00037B 3C               [ 4]  426         inc     a
      00037C 12               [ 7]  427         ld      (de),a
      00037D 4F               [ 4]  428         ld      c,a
      00037E 06 00            [ 7]  429         ld      b,#HI_ZERO
      000380 21 1F 0A         [10]  430         ld      hl,#LINE_BUFFER
      000383 09               [11]  431         add     hl,bc
      000384 36 20            [10]  432         ld      (hl),#' '
      000386 23               [ 6]  433         inc     hl
      000387 36 20            [10]  434         ld      (hl),#' '
      000389 23               [ 6]  435         inc     hl
      00038A 36 20            [10]  436         ld      (hl),#' '
      00038C F1               [10]  437         pop     af
      00038D 3D               [ 4]  438         dec     a
      00038E 20 E8            [12]  439         jr      nz,loop_failed_penalty_holes
      000390 3A 3A 0B         [13]  440         ld      a,(cnt_fail_jump)
      000393 11 34 0B         [10]  441         ld      de,#OFFSET_HOLES_JUMP_PENALTY
      000396 1B               [ 6]  442         dec     de
      000397                        443 loop_jump_penalty_holes:
      000397 F5               [11]  444         push    af
      000398 13               [ 6]  445         inc     de
      000399 1A               [ 7]  446         ld      a,(de)
      00039A 3D               [ 4]  447         dec     a
      00039B 12               [ 7]  448         ld      (de),a
      00039C 4F               [ 4]  449         ld      c,a
      00039D 06 00            [ 7]  450         ld      b,#HI_ZERO
      00039F 21 1F 0A         [10]  451         ld      hl,#LINE_BUFFER
      0003A2 09               [11]  452         add     hl,bc
      0003A3 36 20            [10]  453         ld      (hl),#' '
      0003A5 23               [ 6]  454         inc     hl
      0003A6 36 20            [10]  455         ld      (hl),#' '
      0003A8 23               [ 6]  456         inc     hl
      0003A9 36 20            [10]  457         ld      (hl),#' '
      0003AB F1               [10]  458         pop     af
      0003AC 3D               [ 4]  459         dec     a
      0003AD 20 E8            [12]  460         jr      nz,loop_jump_penalty_holes
      0003AF 3E 08            [ 7]  461         ld      a,#GAMES_LINES
      0003B1 21 1F 0A         [10]  462         ld      hl,#LINE_BUFFER
      0003B4 11 60 EC         [10]  463         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+0
      0003B7                        464 print_line:
      0003B7 01 20 00         [10]  465         ld      bc,#SCREEN_WIDTH
      0003BA E5               [11]  466         push    hl
      0003BB EB               [ 4]  467         ex      de,hl
      0003BC 09               [11]  468         add     hl,bc
      0003BD 09               [11]  469         add     hl,bc
      0003BE EB               [ 4]  470         ex      de,hl
      0003BF E1               [10]  471         pop     hl
      0003C0 ED B0            [21]  472         ldir
      0003C2 3D               [ 4]  473         dec     a
      0003C3 20 F2            [12]  474         jr      nz,print_line
      0003C5 21 A0 EF         [10]  475         ld      hl,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+0
      0003C8 11 A1 EF         [10]  476         ld      de,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+1
      0003CB 01 1F 00         [10]  477         ld      bc,#SCREEN_WIDTH-1
      0003CE 36 C6            [10]  478         ld      (hl),#CHR_WALL
      0003D0 ED B0            [21]  479         ldir
      0003D2 C9               [10]  480         ret
      0003D3                        481 animation_delay:
      0003D3 21 0A 33         [10]  482         ld      hl,#SLOW_DOWN_13066
      0003D6 11 01 00         [10]  483         ld      de,#1
      0003D9 A7               [ 4]  484         and     a
      0003DA                        485 delay_loop:
      0003DA 2B               [ 6]  486         dec     hl
      0003DB ED 52            [15]  487         sbc     hl,de
      0003DD 20 FB            [12]  488         jr      nz,delay_loop
      0003DF C9               [10]  489         ret
      0003E0                        490 action_left:
      0003E0 F5               [11]  491         push    af
      0003E1 2A 3B 0B         [16]  492         ld      hl,(MAN_HEAD)
      0003E4 7E               [ 7]  493         ld      a,(hl)
      0003E5 36 20            [10]  494         ld      (hl),#' '
      0003E7 2B               [ 6]  495         dec     hl
      0003E8 22 3B 0B         [16]  496         ld      (MAN_HEAD),hl
      0003EB 77               [ 7]  497         ld      (hl),a
      0003EC 11 20 00         [10]  498         ld      de,#SCREEN_WIDTH
      0003EF 19               [11]  499         add     hl,de
      0003F0 23               [ 6]  500         inc     hl
      0003F1 7E               [ 7]  501         ld      a,(hl)
      0003F2 36 20            [10]  502         ld      (hl),#' '
      0003F4 FE 9D            [ 7]  503         cp      #CHR_MAN_WALK
      0003F6 28 04            [12]  504         jr      z,transition_left_stay
      0003F8 FE A1            [ 7]  505         cp      #CHR_MAN_STAY
      0003FA 28 04            [12]  506         jr      z,transition_left_walk
      0003FC                        507 transition_left_stay:
      0003FC C6 04            [ 7]  508         add     a,#TRANSITION_MAN_WALK_STAY
      0003FE 18 02            [12]  509         jr      update_left
      000400                        510 transition_left_walk:
      000400 D6 04            [ 7]  511         sub     #TRANSITION_MAN_WALK_STAY
      000402                        512 update_left:
      000402 2B               [ 6]  513         dec     hl
      000403 77               [ 7]  514         ld      (hl),a
      000404 3E 09            [ 7]  515         ld      a,#GAMES_LINES+1
      000406 01 5F EC         [10]  516         ld      bc,#BWS+(GAME_START_Y)*SCREEN_WIDTH-1
      000409                        517 loop_left_border_check:
      000409 C5               [11]  518         push    bc
      00040A 60               [ 4]  519         ld      h,b
      00040B 69               [ 4]  520         ld      l,c
      00040C ED 5B 3B 0B      [20]  521         ld      de,(MAN_HEAD)
      000410 A7               [ 4]  522         and     a
      000411 ED 52            [15]  523         sbc     hl,de
      000413 28 0E            [12]  524         jr      z,correct_left_border
      000415                        525 left_border_next_adr:
      000415 C1               [10]  526         pop     bc
      000416 11 60 00         [10]  527         ld      de,#3*SCREEN_WIDTH
      000419 60               [ 4]  528         ld      h,b
      00041A 69               [ 4]  529         ld      l,c
      00041B 19               [11]  530         add     hl,de
      00041C 44               [ 4]  531         ld      b,h
      00041D 4D               [ 4]  532         ld      c,l
      00041E 3D               [ 4]  533         dec     a
      00041F 20 E8            [12]  534         jr      nz,loop_left_border_check
      000421 F1               [10]  535         pop     af
      000422 C9               [10]  536         ret
      000423                        537 correct_left_border:
      000423 2A 3B 0B         [16]  538         ld      hl,(MAN_HEAD)
      000426 11 20 00         [10]  539         ld      de,#SCREEN_WIDTH
      000429 36 C6            [10]  540         ld      (hl),#CHR_WALL
      00042B 19               [11]  541         add     hl,de
      00042C 36 CC            [10]  542         ld      (hl),#CHR_MAN_HEAD
      00042E 22 3B 0B         [16]  543         ld      (MAN_HEAD),hl
      000431 19               [11]  544         add     hl,de
      000432 36 9D            [10]  545         ld      (hl),#CHR_MAN_WALK
      000434 C3 15 04         [10]  546         jp      left_border_next_adr
      000437                        547 action_right:
      000437 F5               [11]  548         push    af
      000438 2A 3B 0B         [16]  549         ld      hl,(MAN_HEAD)
      00043B 7E               [ 7]  550         ld      a,(hl)
      00043C 36 20            [10]  551         ld      (hl),#' '
      00043E 23               [ 6]  552         inc     hl
      00043F 22 3B 0B         [16]  553         ld      (MAN_HEAD),hl
      000442 77               [ 7]  554         ld      (hl),a
      000443 11 20 00         [10]  555         ld      de,#SCREEN_WIDTH
      000446 19               [11]  556         add     hl,de
      000447 2B               [ 6]  557         dec     hl
      000448 7E               [ 7]  558         ld      a,(hl)
      000449 36 20            [10]  559         ld      (hl),#' '
      00044B FE 9D            [ 7]  560         cp      #CHR_MAN_WALK
      00044D 28 04            [12]  561         jr      z,transition_stay
      00044F FE A1            [ 7]  562         cp      #CHR_MAN_STAY
      000451 28 04            [12]  563         jr      z,transition_walk
      000453                        564 transition_stay:
      000453 C6 04            [ 7]  565         add     a,#TRANSITION_MAN_WALK_STAY
      000455 18 02            [12]  566         jr      update_right
      000457                        567 transition_walk:
      000457 D6 04            [ 7]  568         sub     #TRANSITION_MAN_WALK_STAY
      000459                        569 update_right:
      000459 23               [ 6]  570         inc     hl
      00045A 77               [ 7]  571         ld      (hl),a
      00045B 3E 09            [ 7]  572         ld      a,#GAMES_LINES+1
      00045D 01 80 EC         [10]  573         ld      bc,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH+0
      000460                        574 loop_right_border_check:
      000460 C5               [11]  575         push    bc
      000461 60               [ 4]  576         ld      h,b
      000462 69               [ 4]  577         ld      l,c
      000463 ED 5B 3B 0B      [20]  578         ld      de,(MAN_HEAD)
      000467 A7               [ 4]  579         and     a
      000468 ED 52            [15]  580         sbc     hl,de
      00046A 28 0E            [12]  581         jr      z,correct_right_border
      00046C                        582 right_border_next_adr:
      00046C C1               [10]  583         pop     bc
      00046D 11 60 00         [10]  584         ld      de,#3*SCREEN_WIDTH
      000470 60               [ 4]  585         ld      h,b
      000471 69               [ 4]  586         ld      l,c
      000472 19               [11]  587         add     hl,de
      000473 44               [ 4]  588         ld      b,h
      000474 4D               [ 4]  589         ld      c,l
      000475 3D               [ 4]  590         dec     a
      000476 20 E8            [12]  591         jr      nz,loop_right_border_check
      000478 F1               [10]  592         pop     af
      000479 C9               [10]  593         ret
      00047A                        594 correct_right_border:
      00047A 2A 3B 0B         [16]  595         ld      hl,(MAN_HEAD)
      00047D 4E               [ 7]  596         ld      c,(hl)
      00047E 36 9D            [10]  597         ld      (hl),#CHR_MAN_WALK
      000480 11 20 00         [10]  598         ld      de,#SCREEN_WIDTH
      000483 A7               [ 4]  599         and     a
      000484 ED 52            [15]  600         sbc     hl,de
      000486 71               [ 7]  601         ld      (hl),c
      000487 22 3B 0B         [16]  602         ld      (MAN_HEAD),hl
      00048A 19               [11]  603         add     hl,de
      00048B 19               [11]  604         add     hl,de
      00048C 36 EE            [10]  605         ld      (hl),#CHR_MOVING_LINE
      00048E 18 DC            [12]  606         jr      right_border_next_adr
      000490                        607 action_jump:
      000490 2A 3B 0B         [16]  608         ld      hl,(MAN_HEAD)
      000493 11 20 00         [10]  609         ld      de,#SCREEN_WIDTH
      000496 A7               [ 4]  610         and     a
      000497 ED 52            [15]  611         sbc     hl,de
      000499 7E               [ 7]  612         ld      a,(hl)
      00049A FE 20            [ 7]  613         cp      #' '
      00049C 28 0B            [12]  614         jr      z,jump_ok
      00049E FE EE            [ 7]  615         cp      #CHR_MOVING_LINE
      0004A0 28 2B            [12]  616         jr      z,jump_fail
      0004A2 FE C6            [ 7]  617         cp      #CHR_WALL
      0004A4 28 27            [12]  618         jr      z,jump_fail
      0004A6 C3 43 02         [10]  619         jp      handle_fail_delay
      0004A9                        620 jump_ok:
      0004A9 D9               [ 4]  621         exx
      0004AA CD AB 05         [17]  622         call    add_10_points
      0004AD D9               [ 4]  623         exx
      0004AE 19               [11]  624         add     hl,de
      0004AF 36 20            [10]  625         ld      (hl),#' '
      0004B1 19               [11]  626         add     hl,de
      0004B2 36 20            [10]  627         ld      (hl),#' '
      0004B4 1E 60            [ 7]  628         ld      e,#3*SCREEN_WIDTH
      0004B6 A7               [ 4]  629         and     a
      0004B7 ED 52            [15]  630         sbc     hl,de
      0004B9 36 9D            [10]  631         ld      (hl),#CHR_MAN_WALK
      0004BB 1E 20            [ 7]  632         ld      e,#SCREEN_WIDTH
      0004BD A7               [ 4]  633         and     a
      0004BE ED 52            [15]  634         sbc     hl,de
      0004C0 36 CC            [10]  635         ld      (hl),#CHR_MAN_HEAD
      0004C2 22 3B 0B         [16]  636         ld      (MAN_HEAD),hl
      0004C5 3E 04            [ 7]  637         ld      a,#DELAY_COUNTER_JUMP
      0004C7 32 3D 0B         [13]  638         ld      (JUMP_DELAY),a
      0004CA C3 43 02         [10]  639         jp      handle_fail_delay
      0004CD                        640 jump_fail:
      0004CD 19               [11]  641         add     hl,de
      0004CE 2B               [ 6]  642         dec     hl
      0004CF 3E CD            [ 7]  643         ld      a,#CHR_SMOKE
      0004D1 77               [ 7]  644         ld      (hl),a
      0004D2 23               [ 6]  645         inc     hl
      0004D3 23               [ 6]  646         inc     hl
      0004D4 23               [ 6]  647         inc     hl
      0004D5 77               [ 7]  648         ld      (hl),a
      0004D6 2B               [ 6]  649         dec     hl
      0004D7 2B               [ 6]  650         dec     hl
      0004D8 36 20            [10]  651         ld      (hl),#' '
      0004DA 19               [11]  652         add     hl,de
      0004DB 36 97            [10]  653         ld      (hl),#CHR_MAN_SLEEP
      0004DD 23               [ 6]  654         inc     hl
      0004DE 36 C9            [10]  655         ld      (hl),#CHR_MAN_SLEEP_HEAD
      0004E0 3E 0B            [ 7]  656         ld      a,#DELAY_COUNTER
      0004E2 32 3E 0B         [13]  657         ld      (FAIL_DELAY),a
      0004E5 3A 3A 0B         [13]  658         ld      a,(cnt_fail_jump)
      0004E8 FE 05            [ 7]  659         cp      #MAX_FAIL_COUNTER
      0004EA CA 43 02         [10]  660         jp      z,handle_fail_delay
      0004ED 3C               [ 4]  661         inc     a
      0004EE 32 3A 0B         [13]  662         ld      (cnt_fail_jump),a
      0004F1 C3 43 02         [10]  663         jp      handle_fail_delay
      0004F4                        664 check_fall_through:
      0004F4 3A 3D 0B         [13]  665         ld      a,(JUMP_DELAY)
      0004F7 FE 01            [ 7]  666         cp      #INITIAL_DELAY_COUNTER
      0004F9 C0               [11]  667         ret     nz
      0004FA                        668 check_for_trap:
      0004FA 2A 3B 0B         [16]  669         ld      hl,(MAN_HEAD)
      0004FD 11 20 00         [10]  670         ld      de,#SCREEN_WIDTH
      000500 19               [11]  671         add     hl,de
      000501 19               [11]  672         add     hl,de
      000502 7E               [ 7]  673         ld      a,(hl)
      000503 FE 20            [ 7]  674         cp      #' '
      000505 C0               [11]  675         ret     nz
      000506 3A 3E 0B         [13]  676         ld      a,(FAIL_DELAY)
      000509 FE 01            [ 7]  677         cp      #INITIAL_DELAY_COUNTER
      00050B 28 15            [12]  678         jr      z,erase_player_fell_down
      00050D 2A 3B 0B         [16]  679         ld      hl,(MAN_HEAD)
      000510 3E 20            [ 7]  680         ld      a,#' '
      000512 2B               [ 6]  681         dec     hl
      000513 77               [ 7]  682         ld      (hl),a
      000514 23               [ 6]  683         inc     hl
      000515 23               [ 6]  684         inc     hl
      000516 23               [ 6]  685         inc     hl
      000517 77               [ 7]  686         ld      (hl),a
      000518 2B               [ 6]  687         dec     hl
      000519 19               [11]  688         add     hl,de
      00051A 77               [ 7]  689         ld      (hl),a
      00051B 23               [ 6]  690         inc     hl
      00051C 77               [ 7]  691         ld      (hl),a
      00051D 2B               [ 6]  692         dec     hl
      00051E 2B               [ 6]  693         dec     hl
      00051F 77               [ 7]  694         ld      (hl),a
      000520 18 08            [12]  695         jr      player_fell_down
      000522                        696 erase_player_fell_down:
      000522 2A 3B 0B         [16]  697         ld      hl,(MAN_HEAD)
      000525 3E 20            [ 7]  698         ld      a,#' '
      000527 77               [ 7]  699         ld      (hl),a
      000528 19               [11]  700         add     hl,de
      000529 77               [ 7]  701         ld      (hl),a
      00052A                        702 player_fell_down:
      00052A 19               [11]  703         add     hl,de
      00052B 19               [11]  704         add     hl,de
      00052C 22 3B 0B         [16]  705         ld      (MAN_HEAD),hl
      00052F 19               [11]  706         add     hl,de
      000530 36 97            [10]  707         ld      (hl),#CHR_MAN_SLEEP
      000532 23               [ 6]  708         inc     hl
      000533 36 C9            [10]  709         ld      (hl),#CHR_MAN_SLEEP_HEAD
      000535 3E 08            [ 7]  710         ld      a,#DELAY_COUNTER2
      000537 32 3E 0B         [13]  711         ld      (FAIL_DELAY),a
      00053A 3A 39 0B         [13]  712         ld      a,(cnt_fail_trap)
      00053D FE 05            [ 7]  713         cp      #MAX_FAIL_COUNTER
      00053F C8               [11]  714         ret     z
      000540 3C               [ 4]  715         inc     a
      000541 32 39 0B         [13]  716         ld      (cnt_fail_trap),a
      000544 C9               [10]  717         ret
      000545                        718 check_level_finished:
      000545 2A 3B 0B         [16]  719         ld      hl,(MAN_HEAD)
      000548 11 77 EC         [10]  720         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+(SCREEN_WIDTH-9)
      00054B A7               [ 4]  721         and     a
      00054C ED 52            [15]  722         sbc     hl,de
      00054E 20 39            [12]  723         jr      nz,round_end
      000550 3A 42 0B         [13]  724         ld      a,(LEVEL)
      000553 FE 08            [ 7]  725         cp      #MAX_LEVEL
      000555 28 01            [12]  726         jr      z,new_level_set
      000557 3C               [ 4]  727         inc     a
      000558                        728 new_level_set:
      000558 32 42 0B         [13]  729         ld      (LEVEL),a
      00055B 21 6F EF         [10]  730         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+(15+ALIGN_MIDDLE)
      00055E 22 3B 0B         [16]  731         ld      (MAN_HEAD),hl
      000561 3E 20            [ 7]  732         ld      a,#SCREEN_WIDTH
      000563 36 CC            [10]  733         ld      (hl),#CHR_MAN_HEAD
      000565 85               [ 4]  734         add     a,l
      000566 6F               [ 4]  735         ld      l,a
      000567 36 A1            [10]  736         ld      (hl),#CHR_MAN_STAY
      000569 21 39 0B         [10]  737         ld      hl,#cnt_fail_trap
      00056C 3E 02            [ 7]  738         ld      a,#INITIAL_FAIL_COUNTER
      00056E 77               [ 7]  739         ld      (hl),a
      00056F 21 3A 0B         [10]  740         ld      hl,#cnt_fail_jump
      000572 77               [ 7]  741         ld      (hl),a
      000573 21 75 EC         [10]  742         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+(SCREEN_WIDTH-11)
      000576 36 F8            [10]  743         ld      (hl),#CHR_LINE_TOP
      000578 23               [ 6]  744         inc     hl
      000579 36 95            [10]  745         ld      (hl),#CHR_ARROW_RIGHT_TOP
      00057B 23               [ 6]  746         inc     hl
      00057C 36 20            [10]  747         ld      (hl),#' '
      00057E 21 95 EC         [10]  748         ld      hl,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH++(SCREEN_WIDTH-11)
      000581 36 9E            [10]  749         ld      (hl),#CHR_LINE_BOTTOM
      000583 23               [ 6]  750         inc     hl
      000584 36 93            [10]  751         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      000586 23               [ 6]  752         inc     hl
      000587 36 20            [10]  753         ld      (hl),#' '
      000589                        754 round_end:
      000589 13               [ 6]  755         inc     de
      00058A 13               [ 6]  756         inc     de
      00058B 2A 3B 0B         [16]  757         ld      hl,(MAN_HEAD)
      00058E A7               [ 4]  758         and     a
      00058F ED 52            [15]  759         sbc     hl,de
      000591 3E 0B            [ 7]  760         ld      a,#DELAY_COUNTER
      000593 C0               [11]  761         ret     nz
      000594 32 3E 0B         [13]  762         ld      (FAIL_DELAY),a
      000597 13               [ 6]  763         inc     de
      000598 ED 53 3B 0B      [20]  764         ld      (MAN_HEAD),de
      00059C 3E 20            [ 7]  765         ld      a,#' '
      00059E 1B               [ 6]  766         dec     de
      00059F 12               [ 7]  767         ld      (de),a
      0005A0 83               [ 4]  768         add     a,e
      0005A1 5F               [ 4]  769         ld      e,a
      0005A2 12               [ 7]  770         ld      (de),a
      0005A3 6F               [ 4]  771         ld      l,a
      0005A4 19               [11]  772         add     hl,de
      0005A5 36 97            [10]  773         ld      (hl),#CHR_MAN_SLEEP
      0005A7 23               [ 6]  774         inc     hl
      0005A8 36 C9            [10]  775         ld      (hl),#CHR_MAN_SLEEP_HEAD
      0005AA C9               [10]  776         ret
      0005AB                        777 add_10_points:
      0004AB                        778         SET_CURSOR_DE 0 23+POSDIFF_POINTS
      0005AB 11 17 EC         [10]    1         ld      de,#BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS
      0005AE ED 53 2B 00      [20]    2         ld      (CURSOR_POS),de
      0005B2 2A 40 0B         [16]  779         ld      hl,(POINTS)
      0005B5 11 0A 00         [10]  780         ld      de,#10
      0005B8 19               [11]  781         add     hl,de
      0005B9 22 40 0B         [16]  782         ld      (POINTS),hl
      0005BC CD C5 05         [17]  783         call    print_decimal
      0005BF 3E 20            [ 7]  784         ld      a,#' '
      0005C1 32 1C EC         [13]  785         ld      (BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS+5),a
      0005C4 C9               [10]  786         ret
      0005C5                        787 print_decimal:
      0005C5 E5               [11]  788         push    hl
      0005C6 01 10 27         [10]  789         ld      bc,#10000
      0005C9 CD EB 05         [17]  790         call    get_decimal_digit
      0005CC 01 E8 03         [10]  791         ld      bc,#1000
      0005CF CD EB 05         [17]  792         call    get_decimal_digit
      0005D2 01 64 00         [10]  793         ld      bc,#100
      0005D5 CD EB 05         [17]  794         call    get_decimal_digit
      0005D8 01 0A 00         [10]  795         ld      bc,#10
      0005DB CD EB 05         [17]  796         call    get_decimal_digit
      0005DE 01 01 00         [10]  797         ld      bc,#1
      0005E1 CD EB 05         [17]  798         call    get_decimal_digit
      0004E4                        799         REMOVE_CURSOR;
      0005E4 2A 2B 00         [16]    1         ld      hl,(CURSOR_POS)
      0005E7 36 20            [10]    2         ld      (hl),#' '
      0005E9 E1               [10]  800         pop     hl
      0005EA C9               [10]  801         ret
      0005EB                        802 get_decimal_digit:
      0005EB AF               [ 4]  803         xor     a
      0005EC                        804 decimal_loop:
      0005EC A7               [ 4]  805         and     a
      0005ED ED 42            [15]  806         sbc     hl,bc
      0005EF 3C               [ 4]  807         inc     a
      0005F0 D2 EC 05         [10]  808         jp      nc,decimal_loop
      0005F3 3D               [ 4]  809         dec     a
      0005F4 09               [11]  810         add     hl,bc
      0005F5 C6 30            [ 7]  811         add     a,#'0'
      0004F7                        812         OUTCH
      0005F7 E7               [11]    1         rst     0x20
      0005F8 00                       2         .db     0x00              ;OUTCH
      0005F9 C9               [10]  813         ret
      0005FA                        814 no_lives:
      0004FA                        815         PRST7
      0005FA E7               [11]    1         rst     0x20
      0005FB 02                       2         .db     0x02              ;PRTST7
      0005FC 0C A0                  816         .db     0x0c,0xa0
      0005FE 21 E4 0B         [10]  817         ld      hl,#TXT_GAME_OVER
      000601 11 49 EC         [10]  818         ld      de,#POS_GAME_OVER
      000604 01 0F 00         [10]  819         ld      bc,#TXT_GAME_OVER_size
      000607 ED B0            [21]  820         ldir
      000609 0E 50            [ 7]  821         ld      c,#3*SCREEN_WIDTH-TXT_GAME_OVER_size-1+POSDIFF_YOUR_SCORE
      00060B 7B               [ 4]  822         ld      a,e
      00060C 81               [ 4]  823         add     a,c
      00060D 5F               [ 4]  824         ld      e,a
      00060E 0E 0C            [ 7]  825         ld      c,#TXT_YOUR_SCORE_size
      000610 ED B0            [21]  826         ldir
      000612 0E 37            [ 7]  827         ld      c,#2*SCREEN_WIDTH-TXT_YOUR_SCORE_size+3
      000614 7B               [ 4]  828         ld      a,e
      000615 81               [ 4]  829         add     a,c
      000616 5F               [ 4]  830         ld      e,a
      000617 0E 09            [ 7]  831         ld      c,#TXT_HAZARD_size
      000619 ED B0            [21]  832         ldir
      00061B 21 E0 ED         [10]  833         ld      hl,#BWS+15*SCREEN_WIDTH+0+(3*POSDIFF_YOUR_SCORE)
      00061E 36 A0            [10]  834         ld      (hl),#CHR_MIDDLE_LINE
      000620 11 E1 ED         [10]  835         ld      de,#BWS+15*SCREEN_WIDTH+1+(3*POSDIFF_YOUR_SCORE)
      000623 0E 1F            [ 7]  836         ld      c,#SCREEN_WIDTH-1
      000625 ED B0            [21]  837         ldir
      000627 2A 40 0B         [16]  838         ld      hl,(POINTS)
      00052A                        839         SET_CURSOR_DE (5-POSDIFF_YOUR_SCORE_DY) (21+ALIGN_MIDDLE)
      00062A 11 B5 EC         [10]    1         ld      de,#BWS+(5-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+(21+ALIGN_MIDDLE)
      00062D ED 53 2B 00      [20]    2         ld      (CURSOR_POS),de
      000631 CD C5 05         [17]  840         call    print_decimal
      000634 3A 42 0B         [13]  841         ld      a,(LEVEL)
      000637 C6 2F            [ 7]  842         add     a,#'0'-1
      000639 32 F7 EC         [13]  843         ld      (BWS+7*SCREEN_WIDTH+23+ALIGN_MIDDLE+3*POSDIFF_YOUR_SCORE),a
      00063C ED 5B C6 0B      [20]  844         ld      de,(HIGH_SCORE_TABLE01.points)
      000640 A7               [ 4]  845         and     a
      000641 ED 52            [15]  846         sbc     hl,de
      000643 D4 72 07         [17]  847         call    nc,draw_new_highscore_box
      000546                        848         SET_CURSOR_HL (17-POSDIFF_YOUR_SCORE_DY) (3+ALIGN_MIDDLE)
      000646 21 23 EE         [10]    1         ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+(3+ALIGN_MIDDLE)
      000649 22 2B 00         [16]    2         ld      (CURSOR_POS),hl
      00054C                        849         PRST7
      00064C E7               [11]    1         rst     0x20
      00064D 02                       2         .db     0x02              ;PRTST7
      00064E 20 49 4E 50 55 54 20   850         .ascis ' INPUT YOUR INITIALS: __ '
             59 4F 55 52 20 49 4E
             49 54 49 41 4C 53 3A
             20 5F 5F A0
                                    851         ; remove 2xcursor
      000667                        852 input:
      000667 21 3C EE         [10]  853         ld      hl,#BWS+17*SCREEN_WIDTH+28
      00066A 36 20            [10]  854         ld      (hl),#' '
      00066C 21 01 EC         [10]  855         ld      hl,#BWS+0*SCREEN_WIDTH+1
      00066F 36 20            [10]  856         ld      (hl),#' '
      000671 21 39 EE         [10]  857         ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+25+ALIGN_MIDDLE
      000574                        858         CURSOR_DISABLE
      000574                        859         INCH
      000674 E7               [11]    1         rst     0x20
      000675 01                       2         .db     0x01              ;INCH
      000676 77               [ 7]  860         ld      (hl),a
      000677 32 E2 0B         [13]  861         ld      (INITIALS),a
      00067A 23               [ 6]  862         inc     hl
      00057B                        863         INCH
      00067B E7               [11]    1         rst     0x20
      00067C 01                       2         .db     0x01              ;INCH
      00067D 77               [ 7]  864         ld      (hl),a
      00067E 32 E3 0B         [13]  865         ld      (INITIALS+1),a
      000681 ED 5B 40 0B      [20]  866         ld      de,(POINTS)
      000685 06 05            [ 7]  867         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      000687 2A C6 0B         [16]  868         ld      hl,(HIGH_SCORE_TABLE01.points)
      00068A A7               [ 4]  869         and     a
      00068B ED 52            [15]  870         sbc     hl,de
      00068D DA 41 07         [10]  871         jp      c,insert_score
      000690 05               [ 4]  872         dec     b
      000691 2A CB 0B         [16]  873         ld      hl,(HIGH_SCORE_TABLE02.points)
      000694 A7               [ 4]  874         and     a
      000695 ED 52            [15]  875         sbc     hl,de
      000697 DA 41 07         [10]  876         jp      c,insert_score
      00069A 05               [ 4]  877         dec     b
      00069B 2A D0 0B         [16]  878         ld      hl,(HIGH_SCORE_TABLE03.points)
      00069E A7               [ 4]  879         and     a
      00069F ED 52            [15]  880         sbc     hl,de
      0006A1 DA 41 07         [10]  881         jp      c,insert_score
      0006A4 05               [ 4]  882         dec     b
      0006A5 2A D5 0B         [16]  883         ld      hl,(HIGH_SCORE_TABLE04.points)
      0006A8 A7               [ 4]  884         and     a
      0006A9 ED 52            [15]  885         sbc     hl,de
      0006AB DA 41 07         [10]  886         jp      c,insert_score
      0006AE 05               [ 4]  887         dec     b
      0006AF 2A DA 0B         [16]  888         ld      hl,(HIGH_SCORE_TABLE05.points)
      0006B2 A7               [ 4]  889         and     a
      0006B3 ED 52            [15]  890         sbc     hl,de
      0006B5 DA 41 07         [10]  891         jp      c,insert_score
      0006B8                        892 print_highscore_table:
      0006B8 06 05            [ 7]  893         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      0006BA 11 C4 0B         [10]  894         ld      de,#HIGH_SCORE_TABLE01
      0006BD 21 86 EE         [10]  895         ld      hl,#BWS+(20-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+6+ALIGN_MIDDLE
      0006C0                        896 print_highscore_entry:
      0006C0 3E 36            [ 7]  897         ld      a,#'6'
      0006C2 90               [ 4]  898         sub     b
      0006C3 77               [ 7]  899         ld      (hl),a
      0006C4 1A               [ 7]  900         ld      a,(de)
      0006C5 23               [ 6]  901         inc     hl
      0006C6 23               [ 6]  902         inc     hl
      0006C7 23               [ 6]  903         inc     hl
      0006C8 77               [ 7]  904         ld      (hl),a
      0006C9 23               [ 6]  905         inc     hl
      0006CA 13               [ 6]  906         inc     de
      0006CB 1A               [ 7]  907         ld      a,(de)
      0006CC 77               [ 7]  908         ld      (hl),a
      0006CD 3E 2E            [ 7]  909         ld      a,#'.'
      0006CF 23               [ 6]  910         inc     hl
      0006D0 23               [ 6]  911         inc     hl
      0006D1 77               [ 7]  912         ld      (hl),a
      0006D2 23               [ 6]  913         inc     hl
      0006D3 77               [ 7]  914         ld      (hl),a
      0006D4 23               [ 6]  915         inc     hl
      0006D5 77               [ 7]  916         ld      (hl),a
      0006D6 23               [ 6]  917         inc     hl
      0006D7 23               [ 6]  918         inc     hl
      0005D8                        919         SET_CURSOR
      0006D8 22 2B 00         [16]    1         ld      (CURSOR_POS),hl
      0006DB 13               [ 6]  920         inc     de
      0006DC 1A               [ 7]  921         ld      a,(de)
      0006DD 6F               [ 4]  922         ld      l,a
      0006DE 13               [ 6]  923         inc     de
      0006DF 1A               [ 7]  924         ld      a,(de)
      0006E0 67               [ 4]  925         ld      h,a
      0006E1 13               [ 6]  926         inc     de
      0006E2 C5               [11]  927         push    bc
      0006E3 D5               [11]  928         push    de
      0006E4 CD C5 05         [17]  929         call    print_decimal
      0006E7 D1               [10]  930         pop     de
      0006E8 C1               [10]  931         pop     bc
      0005E9                        932         REMOVE_CURSOR
      0006E9 2A 2B 00         [16]    1         ld      hl,(CURSOR_POS)
      0006EC 36 20            [10]    2         ld      (hl),#' '
      0006EE 23               [ 6]  933         inc     hl
      0006EF 23               [ 6]  934         inc     hl
      0006F0 23               [ 6]  935         inc     hl
      0006F1 36 30            [10]  936         ld      (hl),#'0'
      0006F3 23               [ 6]  937         inc     hl
      0006F4 1A               [ 7]  938         ld      a,(de)
      0006F5 C6 2F            [ 7]  939         add     a,#'0'-1
      0006F7 77               [ 7]  940         ld      (hl),a
      0006F8 13               [ 6]  941         inc     de
      0006F9 3E 0D            [ 7]  942         ld      a,#SCREEN_WIDTH-19
      0006FB 85               [ 4]  943         add     a,l
      0006FC 6F               [ 4]  944         ld      l,a
      0006FD 3E 00            [ 7]  945         ld      a,#ZERO
      0006FF 8C               [ 4]  946         adc     a,h
      000700 67               [ 4]  947         ld      h,a
      000701 10 BD            [13]  948         djnz    print_highscore_entry
      000603                        949         SET_CURSOR_HL (29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY) (9+ALIGN_MIDDLE)
      000703 21 A9 EF         [10]    1         ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+(9+ALIGN_MIDDLE)
      000706 22 2B 00         [16]    2         ld      (CURSOR_POS),hl
      000609                        950         PRST7
      000709 E7               [11]    1         rst     0x20
      00070A 02                       2         .db     0x02              ;PRTST7
      00070B 4E 45 57 20 47 41 4D   951         .ascii  'NEW GAME ? Y/N'
             45 20 3F 20 59 2F 4E
      000719 A0                     952         .db     0xa0
      00071A 21 B8 EF         [10]  953         ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      00071D 36 20            [10]  954         ld      (hl),#' '
      00071F                        955         CURSOR_DISABLE
      00071F                        956 m_070a:
      00061F                        957 ask_exit_game:
      00061F                        958         INCH
      00071F E7               [11]    1         rst     0x20
      000720 01                       2         .db     0x01              ;INCH
      000721 FE 59            [ 7]  959         cp      #'Y'
      000723 CA 81 01         [10]  960         jp      z,new_game
                           000001   961 .if     eq,z9001
      000726 FE 5A            [ 7]  962         cp      #'Z'
      000728 CA 81 01         [10]  963         jp      z,new_game
                                    964 .endif
      00072B FE 4E            [ 7]  965         cp      #'N'
      00072D 20 F0            [12]  966         jr      nz,ask_exit_game
      00072F                        967 exit_game:
      00062F                        968         PRST7
      00072F E7               [11]    1         rst     0x20
      000730 02                       2         .db     0x02              ;PRTST7
      000731 0C                     969         .db     0x0c
      000732 4A 75 6D 70 69 6E 67   970         .ascii  'Jumping Jack'
             20 4A 61 63 6B
      00073E 0D 8D                  971         .db     0x0d,0x8d
      000640                        972         END_PROGRAM
      000740 FF               [11]    1         rst     0x38
      000741                        973 insert_score:
      000741 D5               [11]  974         push    de
      000742 11 DD 0B         [10]  975         ld      de,#HIGH_SCORE_TABLE_TMP
      000745 21 D8 0B         [10]  976         ld      hl,#HIGH_SCORE_TABLE05
      000748                        977 move_table_entry:
      000748 C5               [11]  978         push    bc
      000749 01 05 00         [10]  979         ld      bc,#HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05
      00074C ED B0            [21]  980         ldir
      00074E EB               [ 4]  981         ex      de,hl
      00074F 0E 0A            [ 7]  982         ld      c,#2*(HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05)
      000751 A7               [ 4]  983         and     a
      000752 ED 42            [15]  984         sbc     hl,bc
      000754 EB               [ 4]  985         ex      de,hl
      000755 A7               [ 4]  986         and     a
      000756 ED 42            [15]  987         sbc     hl,bc
      000758 C1               [10]  988         pop     bc
      000759 10 ED            [13]  989         djnz    move_table_entry
      00075B 3A E2 0B         [13]  990         ld      a,(INITIALS)
      00075E 12               [ 7]  991         ld      (de),a
      00075F 13               [ 6]  992         inc     de
      000760 3A E3 0B         [13]  993         ld      a,(INITIALS+1)
      000763 12               [ 7]  994         ld      (de),a
      000764 EB               [ 4]  995         ex      de,hl
      000765 D1               [10]  996         pop     de
      000766 23               [ 6]  997         inc     hl
      000767 73               [ 7]  998         ld      (hl),e
      000768 23               [ 6]  999         inc     hl
      000769 72               [ 7] 1000         ld      (hl),d
      00076A 23               [ 6] 1001         inc     hl
      00076B 3A 42 0B         [13] 1002         ld      a,(LEVEL)
      00076E 77               [ 7] 1003         ld      (hl),a
      00076F C3 B8 06         [10] 1004         jp      print_highscore_table
      000772                       1005 draw_new_highscore_box:
      000772 21 27 ED         [10] 1006         ld      hl,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      000775 36 2A            [10] 1007         ld      (hl),#'*'
      000777 11 28 ED         [10] 1008         ld      de,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+8+ALIGN_MIDDLE
      00077A 01 11 00         [10] 1009         ld      bc,#TXT_NEW_HIGH_SCORE_size-1
      00077D ED B0            [21] 1010         ldir
      00077F 0E 6F            [ 7] 1011         ld      c,#4*SCREEN_WIDTH-TXT_NEW_HIGH_SCORE_size+1
      000781 09               [11] 1012         add     hl,bc
      000782 EB               [ 4] 1013         ex      de,hl
      000783 09               [11] 1014         add     hl,bc
      000784 EB               [ 4] 1015         ex      de,hl
      000785 0E 11            [ 7] 1016         ld      c,#TXT_NEW_HIGH_SCORE_size-1
      000787 36 2A            [10] 1017         ld      (hl),#'*'
      000789 ED B0            [21] 1018         ldir
      00078B 11 67 ED         [10] 1019         ld      de,#BWS+(11-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      00078E 21 08 0C         [10] 1020         ld      hl,#TXT_NEW_HIGH_SCORE
      000791 0E 12            [ 7] 1021         ld      c,#TXT_NEW_HIGH_SCORE_size
      000793 ED B0            [21] 1022         ldir
      000795 1E 47            [ 7] 1023         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      000797 3E 2A            [ 7] 1024         ld      a,#'*'
      000799 12               [ 7] 1025         ld      (de),a
      00079A 1E 58            [ 7] 1026         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      00079C 12               [ 7] 1027         ld      (de),a
      00079D 1E 87            [ 7] 1028         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      00079F 12               [ 7] 1029         ld      (de),a
      0007A0 1E 98            [ 7] 1030         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      0007A2 12               [ 7] 1031         ld      (de),a
      0007A3 C9               [10] 1032         ret
      0007A4                       1033 TOP_IMAGE:
      0006A4                       1034         TOP_IMAGE_CONTENT
                                      1  ; line 1
      0006A4                          2         SCREEN_POS
      0007A4 AE 9E 9E 9E 9E 9E 9E     3         .db     0xae,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e ;........
             9E
      0007AC 9E 9E AD 20 20 20 20     4         .db     0x9e,0x9e,0xad,0x20,0x20,0x20,0x20,0x20 ;..-     
             20
      0007B4 20 20 20 20 20 20 20     5         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0007BC 20 20 20 20 20 20 20     6         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0006C4                          7         SCREEN_POS
                                      8         
                                      9         ; line 2
      0006C4                         10         SCREEN_POS
      0007C4 9F B9 B6 B3 B2 B6 B8    11         .db     0x9f,0xb9,0xb6,0xb3,0xb2,0xb6,0xb8,0x20 ;.963268 
             20
      0007CC BD B0 C0 20 20 20 20    12         .db     0xbd,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;=0@     
             20
      0007D4 20 20 20 20 20 20 20    13         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      0007DC 20 20 20 20 20 20 20    14         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0006E4                         15         SCREEN_POS
                                     16 
                                     17         ; line 3
      0006E4                         18         SCREEN_POS
      0007E4 9F B8 B7 20 B5 20 20    19         .db     0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
             20
      0007EC B5 20 C0 20 20 20 20    20         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      0007F4 20 20 20 20 20 20 20    21         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
             B5
      0007FC 20 20 20 20 B7 B7 20    22         .db     0x20,0x20,0x20,0x20,0xb7,0xb7,0x20,0x20 ;    77  
             20
      000704                         23         SCREEN_POS
                                     24 
                                     25         ; line 4
      000704                         26         SCREEN_POS
      000804 9F B3 20 B4 B5 20 B2    27         .db     0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
             20
      00080C B5 20 C0 20 20 20 20    28         .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      000814 20 20 20 20 20 20 20    29         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00081C B6 B7 20 B9 B2 B2 B8    30         .db     0xb6,0xb7,0x20,0xb9,0xb2,0xb2,0xb8,0x20 ;67 9228 
             20
      000724                         31         SCREEN_POS
                                     32 
                                     33         ; line 5
      000724                         34         SCREEN_POS
      000824 9F B1 B6 20 20 B6 B0    35         .db     0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
             20
      00082C B6 B0 C0 20 20 20 20    36         .db     0xb6,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;60@     
             20
      000834 20 20 B2 B3 20 20 20    37         .db     0x20,0x20,0xb2,0xb3,0x20,0x20,0x20,0x20 ;  23    
             20
      00083C 20 BA A0 B4 B4 A0 B5    38         .db     0x20,0xba,0xa0,0xb4,0xb4,0xa0,0xb5,0x20 ; : 44 5 
             20
      000744                         39         SCREEN_POS
                                     40 
                                     41         ; line 6
      000744                         42         SCREEN_POS
      000844 9F 70 72 65 73 65 6E    43         .db     0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
             74
      00084C 73 3A C0 20 20 20 20    44         .db     0x73,0x3a,0xc0,0x20,0x20,0x20,0x20,0x20 ;s:@     
             20
      000854 20 B2 B0 B1 B3 20 20    45         .db     0x20,0xb2,0xb0,0xb1,0xb3,0x20,0x20,0xb7 ; 2013  7
             B7
      00085C B6 B1 B3 B8 B1 B1 B9    46         .db     0xb6,0xb1,0xb3,0xb8,0xb1,0xb1,0xb9,0x20 ;6138119 
             20
      000764                         47         SCREEN_POS
                                     48 
                                     49         ; line 7
      000764                         50         SCREEN_POS
      000864 AB F8 F8 F8 F8 F8 F8    51         .db     0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
             F8
      00086C F8 F8 AC 20 20 20 20    52         .db     0xf8,0xf8,0xac,0x20,0x20,0x20,0x20,0x20 ;xx,     
             20
      000874 20 B0 20 20 B5 B7 B6    53         .db     0x20,0xb0,0x20,0x20,0xb5,0xb7,0xb6,0x20 ; 0  576 
             20
      00087C 20 20 B1 B3 B6 BC 20    54         .db     0x20,0x20,0xb1,0xb3,0xb6,0xbc,0x20,0x20 ;  136<  
             20
      000784                         55         SCREEN_POS
                                     56 
                                     57         ; line 8
      000784                         58         SCREEN_POS
      000884 20 20 20 20 20 20 20    59         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00088C 20 20 20 20 20 20 20    60         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000894 B1 B6 B6 B6 B6 20 20    61         .db     0xb1,0xb6,0xb6,0xb6,0xb6,0x20,0x20,0x20 ;16666   
             20
      00089C 20 20 20 B1 B9 20 20    62         .db     0x20,0x20,0x20,0xb1,0xb9,0x20,0x20,0x20 ;   19   
             20
      0007A4                         63          SCREEN_POS
                                     64 
                                     65         ; line 9
      0007A4                         66         Z1013_LINE
      0008A4 20 20 20 20 20 20 20     1         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008AC 20 20 20 20 20 20 20     2         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008B4 20 20 20 20 20 20 20     3         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008BC 20 20 20 20 20 20 20     4         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
                                     67 
                                     68         ; line 10
      0007C4                         69         Z1013_LINE
      0008C4 20 20 20 20 20 20 20     1         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008CC 20 20 20 20 20 20 20     2         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008D4 20 20 20 20 20 20 20     3         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008DC 20 20 20 20 20 20 20     4         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
                                     70 
                                     71         ; line 11
      0007E4                         72         SCREEN_POS
      0008E4 20 20 20 20 20 20 20    73         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008EC 20 20 20 20 20 20 20    74         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008F4 20 20 20 20 20 20 20    75         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008FC 20 20 20 20 20 20 20    76         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000804                         77          SCREEN_POS
                                     78 
                                     79         ; line 12
      000804                         80         SCREEN_POS
      000904 20 20 20 B4 20 20 20    81         .db     0x20,0x20,0x20,0xb4,0x20,0x20,0x20,0x20 ;   4    
             20
      00090C 20 20 20 20 B0 20 20    82         .db     0x20,0x20,0x20,0x20,0xb0,0x20,0x20,0x20 ;    0   
             20
      000914 20 20 20 20 20 20 B4    83         .db     0x20,0x20,0x20,0x20,0x20,0x20,0xb4,0x20 ;      4 
             20
      00091C 20 20 20 20 B4 B2 20    84         .db     0x20,0x20,0x20,0x20,0xb4,0xb2,0x20,0x20 ;    42  
             20
      000824                         85          SCREEN_POS
                                     86 
                                     87         ; line 13
      000824                         88         SCREEN_POS
      000924 20 20 20 B4 B4 B5 B5    89         .db     0x20,0x20,0x20,0xb4,0xb4,0xb5,0xb5,0xbd ;   4455=
             BD
      00092C BD B5 B6 B3 B4 BC BD    90         .db     0xbd,0xb5,0xb6,0xb3,0xb4,0xbc,0xbd,0xb2 ;=5634<=2
             B2
      000934 B6 B3 20 20 20 20 B4    91         .db     0xb6,0xb3,0x20,0x20,0x20,0x20,0xb4,0xb1 ;63    41
             B1
      00093C B8 B2 B6 B3 BB B0 20    92         .db     0xb8,0xb2,0xb6,0xb3,0xbb,0xb0,0x20,0x20 ;8263;0  
             20
      000844                         93          SCREEN_POS
                                     94 
                                     95         ; line 14
      000844                         96         SCREEN_POS
      000944 20 B3 20 B4 B4 B5 B5    97         .db     0x20,0xb3,0x20,0xb4,0xb4,0xb5,0xb5,0xb5 ; 3 44555
             B5
      00094C B5 B5 B7 B0 B4 B4 B5    98         .db     0xb5,0xb5,0xb7,0xb0,0xb4,0xb4,0xb5,0xb1 ;55704451
             B1
      000954 B7 B4 20 20 B3 20 B4    99         .db     0xb7,0xb4,0x20,0x20,0xb3,0x20,0xb4,0xb9 ;74  3 49
             B9
      00095C BD B5 20 B3 B4 B8 20   100         .db     0xbd,0xb5,0x20,0xb3,0xb4,0xb8,0x20,0x20 ;=5 348  
             20
      000864                        101          SCREEN_POS
                                    102 
                                    103         ; line 15
      000864                        104         SCREEN_POS
      000964 20 B8 B7 B0 B1 B0 B1   105         .db     0x20,0xb8,0xb7,0xb0,0xb1,0xb0,0xb1,0xb1 ; 8701011
             B1
      00096C B1 B5 20 20 B0 B0 B1   106         .db     0xb1,0xb5,0x20,0x20,0xb0,0xb0,0xb1,0xb1 ;15  0011
             B1
      000974 B7 B0 20 20 B8 B7 B0   107         .db     0xb7,0xb0,0x20,0x20,0xb8,0xb7,0xb0,0xb1 ;70  8701
             B1
      00097C B6 20 B6 20 B0 20 B0   108         .db     0xb6,0x20,0xb6,0x20,0xb0,0x20,0xb0,0x20 ;6 6 0 0 
             20
      000884                        109          SCREEN_POS
                                    110 
                                    111         ; line 16
      000884                        112         SCREEN_POS
      000984 20 20 20 20 20 20 20   113         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00098C 20 20 20 20 20 20 20   114         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000994 20 20 20 20 20 20 20   115         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00099C 20 20 20 20 20 20 20   116         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0009A4                        117         SCREEN_POS
                                   1035         
      0008A4                       1036 HINT_RIGHT:
      0009A4 2D 3E 20 2E 2E 2E 20  1037         .db     0x2d,0x3e,0x20,0x2e,0x2e,0x2e,0x20,0x52 ;-> ... R
             52
      0009AC 69 67 68 74           1038         .db     0x69,0x67,0x68,0x74                     ;ight
      0009B0                       1039 HINT_LEFT:
      0009B0 3C 2D 20 2E 2E 2E 2E  1040         .db     0x3c,0x2d,0x20,0x2e,0x2e,0x2e,0x2e,0x20 ;<- .... 
             20
      0009B8 4C 65 66 74           1041         .db     0x4c,0x65,0x66,0x74                     ;Left
      0009BC                       1042 HINT_JUMP:
      0009BC 53 50 20 2E 2E 2E 2E  1043         .ascii  'SP .... Jump'
             20 4A 75 6D 70
      0009C8                       1044 HINT_PLAY:
      0009C8 50 20 2E 2E 2E 2E 2E  1045         .ascii  'P ..... Play'
             20 50 6C 61 79
      0009D4                       1046 HINT_EXIT:
      0009D4 45 20 2E 2E 2E 2E 2E  1047         .ascii  'E ..... Exit'
             20 45 78 69 74
      0009E0                       1048 HINT_COPYRIGHT:
      0009E0 43 20 31 39 38 36 20  1049         .ascii  'C 1986 Software Center Ilmenau'
             53 6F 66 74 77 61 72
             65 20 43 65 6E 74 65
             72 20 49 6C 6D 65 6E
             61 75
      0009FE                       1050 HINT_NAME:
      0009FE 47 2E 46 69 73 63 68  1051         .ascii  'G.Fischer & CO'
             65 72 20 26 20 43 4F
      000A0C                       1052 HINT_YEAR:
      000A0C 20 20 32 30 32 30 20  1053         .ascii  '  2020 Version'
             56 65 72 73 69 6F 6E
      000A1A                       1054 VERSION_INFO:
      000A1A 20 31 2E 31 20        1055         .db     0x20,0x31,0x2e,0x31,0x20                ; 1.1 
      000A1F                       1056 LINE_BUFFER:
      000A1F EE EE EE EE EE EE EE  1057         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A27 EE EE EE EE EE EE EE  1058         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A2F EE EE EE EE EE EE EE  1059         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A37 EE EE EE EE EE EE EE  1060         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A3F EE EE EE EE EE EE EE  1061         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A47 EE EE EE EE EE EE EE  1062         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A4F EE EE EE EE EE EE EE  1063         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A57 EE EE EE EE EE EE EE  1064         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A5F 20 20 20 EE EE EE EE  1065         .db     0x20,0x20,0x20,0xee,0xee,0xee,0xee,0xee ;   nnnnn
             EE
      000A67 EE EE EE EE EE EE EE  1066         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A6F EE EE EE EE EE 20 20  1067         .db     0xee,0xee,0xee,0xee,0xee,0x20,0x20,0x20 ;nnnnn   
             20
      000A77 20 20 EE EE EE EE EE  1068         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000A7F EE EE EE EE EE EE EE  1069         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A87 EE 20 20 20 EE EE EE  1070         .db     0xee,0x20,0x20,0x20,0xee,0xee,0xee,0xee ;n   nnnn
             EE
      000A8F EE EE EE EE EE EE EE  1071         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000A97 EE EE EE 20 20 20 EE  1072         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000A9F EE EE EE EE EE EE EE  1073         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AA7 EE EE EE EE 20 20 20  1074         .db     0xee,0xee,0xee,0xee,0x20,0x20,0x20,0xee ;nnnn   n
             EE
      000AAF EE EE EE EE EE EE EE  1075         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0x20 ;nnnnnnn 
             20
      000AB7 20 20 EE EE EE EE EE  1076         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      000ABF EE EE EE 20 20 20 EE  1077         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000AC7 EE EE EE EE EE EE EE  1078         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000ACF EE EE EE EE EE EE EE  1079         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AD7 EE EE EE EE EE EE EE  1080         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000ADF EE EE EE 20 20 20 EE  1081         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      000AE7 EE EE EE EE EE EE EE  1082         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AEF EE EE EE EE EE EE EE  1083         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000AF7 EE EE EE EE EE EE 20  1084         .db     0xee,0xee,0xee,0xee,0xee,0xee,0x20,0x20 ;nnnnnn  
             20
      000AFF 20 EE EE EE EE EE EE  1085         .db     0x20,0xee,0xee,0xee,0xee,0xee,0xee,0xee ; nnnnnnn
             EE
      000B07 EE EE EE EE EE EE EE  1086         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000B0F EE EE EE EE EE EE EE  1087         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000B17 EE EE EE EE EE EE EE  1088         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000B1F EE EE EE EE EE EE EE  1089         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      000B27 EE EE EE EE EE EE EE  1090         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee      ;nnnnnnn
                                   1091 ; unchecked data source
      000B2E EE                    1092         .db     0xee                                    ;n
      000B2F                       1093 OFFSET_HOLES:
      000B2F 58 7C 41 98 56        1094         .db     0x58,0x7c,0x41,0x98,0x56                ;X|A.V
      000B34                       1095 OFFSET_HOLES_JUMP_PENALTY:
      000B34 8B A2 68 C2 DD        1096         .db     0x8b,0xa2,0x68,0xc2,0xdd                ;."hB]
      000B39                       1097 cnt_fail_trap:
      000B39 05                    1098         .db     5
      000B3A                       1099 cnt_fail_jump:
      000B3A 05                    1100         .db     5
      000B3B                       1101 MAN_HEAD:
      000B3B 6E EF                 1102         .dw     BWS+(GAME_START_Y+(8-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      000B3D                       1103 JUMP_DELAY:
      000B3D 01                    1104         .db     1
      000B3E                       1105 FAIL_DELAY:
      000B3E 01                    1106         .db     1
      000B3F                       1107 LIVES:
      000B3F 06                    1108         .db     6
      000B40                       1109 POINTS:
      000B40 00 00                 1110         .dw     0
      000B42                       1111 LEVEL:
      000B42 01                    1112         .db     1
      000B43                       1113 counter:
      000B43 01                    1114         .db     1
      000B44                       1115 TXT_JUMP:
      000B44 2A 20 4A 55 4D 50 49  1116         .ascii  '* JUMPING JACK *'
             4E 47 20 4A 41 43 4B
             20 2A
      000B54                       1117 MONSTER_PTR:
      000B54 9F ED                 1118         .dw     BWS+(GAME_START_Y+3*3+1)*SCREEN_WIDTH-1
      000B56 E0 ED                 1119         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+0
      000B58 E1 ED                 1120         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000B5A E2 ED                 1121         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
                                   1122 
      000B5C CD EC                 1123         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
      000B5E CE EC                 1124         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+14
      000B60 CF EC                 1125         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+15
      000B62 D0 EC                 1126         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+16
                                   1127 
      000B64 E1 ED                 1128         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      000B66 E2 ED                 1129         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
      000B68 E3 ED                 1130         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+3
      000B6A E4 ED                 1131         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+4
                                   1132 
      000B6C 19 EF                 1133         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+25
      000B6E 1A EF                 1134         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+26
      000B70 1B EF                 1135         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+27
      000B72 1C EF                 1136         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+28
                                   1137 
      000B74 CA EC                 1138         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+10
      000B76 CB EC                 1139         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+11
      000B78 CC EC                 1140         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+12
      000B7A CD EC                 1141         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
                                   1142 
      000B7C 0B EF                 1143         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+11
      000B7E 0C EF                 1144         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+12
      000B80 0D EF                 1145         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+13
      000B82 0E EF                 1146         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14
                                   1147 
      000B84 15 EF                 1148         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+21
      000B86 16 EF                 1149         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+22
      000B88 17 EF                 1150         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+23
      000B8A 18 EF                 1151         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+24
                                   1152         
      000B8C                       1153 MONSTER_IMG:
      000A8C                       1154         MONSTER_IMG_CONTENT
      000B8C 94 90 8B 90 8B 91 97     1         .db     0x94,0x90,0x8b,0x90,0x8b,0x91,0x97,0x91 ;........
             91
      000B94 19 B5 20 BE 20 BF 20     2         .db     0x19,0xb5,0x20,0xbe,0x20,0xbf,0x20,0xae ;.5 > ? .
             AE
      000B9C 92 96 A0 A0 A0 A0 88     3         .db     0x92,0x96,0xa0,0xa0,0xa0,0xa0,0x88,0xc1 ;..    .A
             C1
      000BA4 20 95 20 B7 1E FF 20     4         .db     0x20,0x95,0x20,0xb7,0x1e,0xff,0x20,0x92 ; . 7.. .
             92
      000BAC 17 8C F9 8C 1D 1F FC     5         .db     0x17,0x8c,0xf9,0x8c,0x1d,0x1f,0xfc,0x8c ;..y...|.
             8C
      000BB4 92 96 83 82 95 93 20     6         .db     0x92,0x96,0x83,0x82,0x95,0x93,0x20,0x20 ;......  
             20
      000BBC 20 20 20 20 20 20 20     7         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
                                   1155 
      000BC4                       1156 HIGH_SCORE_TABLE01:
      000BC4 5F 5F                 1157         .ascii '__'
      000BC6                       1158 HIGH_SCORE_TABLE01.points:
      000BC6 00 00                 1159         .dw     0
      000BC8                       1160 HIGH_SCORE_TABLE01.level:
      000BC8 01                    1161         .db     1
      000BC9                       1162 HIGH_SCORE_TABLE02:
      000BC9 5F 5F                 1163         .ascii '__'
      000BCB                       1164 HIGH_SCORE_TABLE02.points:
      000BCB 00 00                 1165         .dw     0
      000BCD                       1166 HIGH_SCORE_TABLE02.level:
      000BCD 01                    1167         .db     1
      000BCE                       1168 HIGH_SCORE_TABLE03:
      000BCE 5F 5F                 1169         .ascii '__'
      000BD0                       1170 HIGH_SCORE_TABLE03.points:
      000BD0 00 00                 1171         .dw     0
      000BD2                       1172 HIGH_SCORE_TABLE03.level:
      000BD2 01                    1173         .db     1
      000BD3                       1174 HIGH_SCORE_TABLE04:
      000BD3 5F 5F                 1175         .ascii '__'
      000BD5                       1176 HIGH_SCORE_TABLE04.points:
      000BD5 00 00                 1177         .dw     0
      000BD7                       1178 HIGH_SCORE_TABLE04.level:
      000BD7 01                    1179         .db     1
      000BD8                       1180 HIGH_SCORE_TABLE05:
      000BD8 5F 5F                 1181         .ascii '__'
      000BDA                       1182 HIGH_SCORE_TABLE05.points:
      000BDA 00 00                 1183         .dw     0
      000BDC                       1184 HIGH_SCORE_TABLE05.level:
      000BDC 01                    1185         .db     1
      000BDD                       1186 HIGH_SCORE_TABLE_TMP:
      000BDD 5F 5F                 1187         .ascii '__'
      000BDF                       1188 HIGH_SCORE_TABLE_TMP.points:
      000BDF 00 00                 1189         .dw     0
      000BE1                       1190 HIGH_SCORE_TABLE_TMP.level:
      000BE1 01                    1191         .db     1
      000BE2                       1192 INITIALS:
      000BE2 5F 5F                 1193         .ascii '__'
      000BE4                       1194 TXT_GAME_OVER:
      000BE4 2A 2A 20 47 41 4D 45  1195         .ascii  '** GAME OVER **'
             20 4F 56 45 52 20 2A
             2A
      000BF3                       1196 TXT_YOUR_SCORE:
      000BF3 59 4F 55 52 20 53 43  1197         .ascii  'YOUR SCORE :'
             4F 52 45 20 3A
      000BFF                       1198 TXT_HAZARD:
      000BFF 48 41 5A 41 52 44 53  1199         .ascii  'HAZARDS :'
             20 3A
      000C08                       1200 TXT_NEW_HIGH_SCORE:
      000C08 2A 20 4E 45 57 20 48  1201         .ascii  '* NEW HIGH SCORE *'
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
    ALIGN_MIDDLE                                                =  000000 
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
    CURSOR_POS                                                  =  00002B 
    DELAY_COUNTER                                               =  00000B 
    DELAY_COUNTER2                                              =  000008 
    DELAY_COUNTER_JUMP                                          =  000004 
  0 FAIL_DELAY                                                     000A3E R
    GAMES_LINES                                                 =  000008 
    GAME_START_Y                                                =  000003 
  0 HIGH_SCORE_TABLE01                                             000AC4 R
  0 HIGH_SCORE_TABLE01.level                                       000AC8 R
  0 HIGH_SCORE_TABLE01.points                                      000AC6 R
    HIGH_SCORE_TABLE01_size                                     =  000002 
  0 HIGH_SCORE_TABLE02                                             000AC9 R
  0 HIGH_SCORE_TABLE02.level                                       000ACD R
  0 HIGH_SCORE_TABLE02.points                                      000ACB R
    HIGH_SCORE_TABLE02_size                                     =  000002 
  0 HIGH_SCORE_TABLE03                                             000ACE R
  0 HIGH_SCORE_TABLE03.level                                       000AD2 R
  0 HIGH_SCORE_TABLE03.points                                      000AD0 R
    HIGH_SCORE_TABLE03_size                                     =  000002 
  0 HIGH_SCORE_TABLE04                                             000AD3 R
  0 HIGH_SCORE_TABLE04.level                                       000AD7 R
  0 HIGH_SCORE_TABLE04.points                                      000AD5 R
    HIGH_SCORE_TABLE04_size                                     =  000002 
  0 HIGH_SCORE_TABLE05                                             000AD8 R
  0 HIGH_SCORE_TABLE05.level                                       000ADC R
  0 HIGH_SCORE_TABLE05.points                                      000ADA R
    HIGH_SCORE_TABLE05_size                                     =  000002 
  0 HIGH_SCORE_TABLE_TMP                                           000ADD R
  0 HIGH_SCORE_TABLE_TMP.level                                     000AE1 R
  0 HIGH_SCORE_TABLE_TMP.points                                    000ADF R
    HIGH_SCORE_TABLE_TMP_size                                   =  000002 
  0 HINT_COPYRIGHT                                                 0008E0 R
    HINT_COPYRIGHT_size                                         =  00001E 
  0 HINT_EXIT                                                      0008D4 R
    HINT_EXIT_size                                              =  00000C 
  0 HINT_JUMP                                                      0008BC R
    HINT_JUMP_size                                              =  00000C 
  0 HINT_LEFT                                                      0008B0 R
    HINT_LEFT_size                                              =  00000C 
  0 HINT_NAME                                                      0008FE R
    HINT_NAME_size                                              =  00000E 
  0 HINT_PLAY                                                      0008C8 R
    HINT_PLAY_size                                              =  00000C 
  0 HINT_RIGHT                                                     0008A4 R
    HINT_RIGHT_size                                             =  00000C 
  0 HINT_YEAR                                                      00090C R
    HINT_YEAR_size                                              =  00000E 
    HI_ZERO                                                     =  000000 
  0 INITIALS                                                       000AE2 R
    INITIALS_size                                               =  000002 
    INITIAL_DELAY_COUNTER                                       =  000001 
    INITIAL_FAIL_COUNTER                                        =  000002 
    INITIAL_LEVEL                                               =  000001 
    INITIAL_LIVES                                               =  000006 
  0 JUMP_DELAY                                                     000A3D R
    KEY_CODE                                                    =  000004 
  0 LEVEL                                                          000A42 R
    LEVEL_1                                                     =  000001 
  0 LINE_BUFFER                                                    00091F R
    LINE_BUFFER_size                                            =  00010F 
  0 LIVES                                                          000A3F R
  0 MAN_HEAD                                                       000A3B R
    MAX_FAIL_COUNTER                                            =  000005 
    MAX_LEVEL                                                   =  000008 
    MENU_TOP                                                    =  000014 
    MONSTER_CORRECTION                                          =  000000 
  0 MONSTER_IMG                                                    000A8C R
    MONSTER_IMG_size                                            =  000038 
  0 MONSTER_PTR                                                    000A54 R
    MONSTER_PTR_size                                            =  000038 
    MONSTER_WIDTH                                               =  000004 
    MOVE_2X_RIGHT                                               =  000002 
    NUMBER_HIGHSCORE_ENTRIES                                    =  000005 
    NUMBER_OF_LINES                                             =  000008 
  0 OFFSET_HOLES                                                   000A2F R
  0 OFFSET_HOLES_JUMP_PENALTY                                      000A34 R
    OFFSET_HOLES_JUMP_PENALTY_size                              =  000005 
    OFFSET_HOLES_size                                           =  000005 
  0 POINTS                                                         000A40 R
    POSDIFF_HIGHSCORE_DY                                        =  000000 
    POSDIFF_NAME                                                =  000009 
    POSDIFF_POINTS                                              =  000000 
    POSDIFF_YEAR                                                =  00000B 
    POSDIFF_YOUR_SCORE                                          =  000000 
    POSDIFF_YOUR_SCORE_DY                                       =  000000 
    POS_COPYRIGHT                                               =  000380 
    POS_GAME_OVER                                               =  00EC49 
    POS_LIVES                                                   =  00EFC0 
    POS_TOP_GAME                                                =  00EC28 
    POS_TOP_WALL                                                =  00EC40 
    SCREEN_HEIGHT                                               =  000020 
    SCREEN_WIDTH                                                =  000020 
    SLOW_DOWN_13066                                             =  00330A 
    SMALL_CAPITALS                                              =  00005F 
    TITLE_TOP_SIZE                                              =  0001FF 
  0 TOP_IMAGE                                                      0006A4 R
    TOP_IMAGE_size                                              =  0001FF 
    TOP_LINES                                                   =  000010 
    TRANSITION_MAN_WALK_STAY                                    =  000004 
  0 TXT_GAME_OVER                                                  000AE4 R
    TXT_GAME_OVER_size                                          =  00000F 
  0 TXT_HAZARD                                                     000AFF R
    TXT_HAZARD_size                                             =  000009 
  0 TXT_JUMP                                                       000A44 R
    TXT_JUMP_size                                               =  000010 
  0 TXT_NEW_HIGH_SCORE                                             000B08 R
    TXT_NEW_HIGH_SCORE_size                                     =  000012 
  0 TXT_YOUR_SCORE                                                 000AF3 R
    TXT_YOUR_SCORE_size                                         =  00000C 
  0 VERSION_INFO                                                   00091A R
    VERSION_INFO_size                                           =  000005 
    VK_CLS                                                      =  00000C 
    VK_HEART                                                    =  0000CB 
    VK_LEFT                                                     =  000008 
    VK_PLAYER                                                   =  0000C4 
    VK_RIGHT                                                    =  000009 
    ZERO                                                        =  000000 
  0 _main                                                          000000 GR
  0 action_jump                                                    000390 R
  0 action_left                                                    0002E0 R
  0 action_right                                                   000337 R
  0 add_10_points                                                  0004AB R
  0 animation_delay                                                0002D3 GR
  0 animation_lines                                                000263 R
  0 animation_loop                                                 000102 R
  0 animation_monster                                              0001A4 R
  0 ask_exit_game                                                  00061F R
  0 capitalized                                                    000078 R
  0 check_fall_through                                             0003F4 R
  0 check_for_trap                                                 0003FA R
  0 check_level_finished                                           000445 R
  0 choose_menu                                                    00006F R
  0 cnt_fail_jump                                                  000A3A R
  0 cnt_fail_trap                                                  000A39 R
  0 correct_left_border                                            000323 R
  0 correct_ptr                                                    0001EE R
  0 correct_right_border                                           00037A R
  0 counter                                                        000A43 R
  0 decimal_loop                                                   0004EC R
  0 delay_loop                                                     0002DA R
  0 draw_monster                                                   000225 R
  0 draw_monster_segment                                           00022A R
  0 draw_new_highscore_box                                         000672 R
  0 draw_player                                                    000097 R
  0 erase_player_fell_down                                         000422 R
  0 exit_game                                                      00062F R
  0 get_column                                                     0001E7 R
  0 get_decimal_digit                                              0004EB R
  0 handle_by_column                                               0001CB R
  0 handle_by_ptr                                                  0001C7 R
  0 handle_fail_delay                                              000143 R
  0 handle_jump_delay                                              000146 R
  0 handle_one_monster                                             0001B3 R
  0 input                                                          000567 R
  0 insert_score                                                   000641 R
  0 jump_delay_counter_set                                         000151 R
  0 jump_fail                                                      0003CD R
  0 jump_ok                                                        0003A9 R
  0 left_border_next_adr                                           000315 R
  0 loop_failed_penalty_holes                                      000278 R
  0 loop_jump_penalty_holes                                        000297 R
  0 loop_left_border_check                                         000309 R
  0 loop_right_border_check                                        000360 R
  0 m_070a                                                         00061F R
  0 monster_check_crash                                            000247 R
  0 move_one_line_up                                               00020A R
  0 move_table_entry                                               000648 R
  0 new_game                                                       000081 R
  0 new_level_set                                                  000458 R
  0 next_cmd                                                       00013C R
  0 no_lives                                                       0004FA R
  0 player_activity                                                00019A R
  0 player_fell_down                                               00042A R
  0 player_wake_up                                                 000181 R
  0 print_decimal                                                  0004C5 R
  0 print_highscore_entry                                          0005C0 R
  0 print_highscore_table                                          0005B8 R
  0 print_line                                                     0002B7 R
  0 right_border_next_adr                                          00036C R
  0 round_end                                                      000489 R
  0 sadr                                                           000000 GR
  0 start_from_bottom                                              0001F8 R
    ta_alpha                                                    =  000000 
  0 test_column                                                    0001FF R
  0 transition_left_stay                                           0002FC R
  0 transition_left_walk                                           000300 R
  0 transition_stay                                                000353 R
  0 transition_walk                                                000357 R
  0 update_left                                                    000302 R
  0 update_pointers                                                000211 R
  0 update_right                                                   000359 R
    z1013                                                       =  000001 
    z9001                                                       =  000000 

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 2.
Hexadecimal [24-Bits]

Area Table

   0 _CODE                                      size    B1A   flags    0
   1 _DATA                                      size      0   flags    0


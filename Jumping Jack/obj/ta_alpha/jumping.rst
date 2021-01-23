                                      1         .module jumping_jack
                                      2         .include 'platform.s'
                           000000     1 z9001                           =       0
                           000000     2 z1013                           =       0
                           000001     3 ta_alpha                        =       1
                                      4 ;
                                      5 ; ta specific constants
                                      6 ;
                           00F000     7 BWS                             =       0xf000
                           000800     8 OFFSET_COLOR                    =       0x0800
                           00E468     9 cfg10_settings                  =       0xe468
                           00E469    10 cfg20_settings                  =       0xe469
                           00E9E8    11 crt_cls                         =       0xe9e8
                           00E023    12 mon_reboot                      =       0xe023
                           000010    13 CFG10                           =       0x10
                           000020    14 CFG20                           =       0x20
                           000050    15 CRT_REG                         =       0x50
                           000051    16 CRT_DATA                        =       0x51
                           00000A    17 REG_10_CURSOR_START             =       10 
                                     18 
                           00000C    19 VK_CLS                          =       0x0c
                           00000D    20 VK_ENTER                        =       0x0d
                           00001D    21 VK_LEFT                         =       0x1d
                           00001C    22 VK_RIGHT                        =       0x1c
                           00001E    23 VK_UP                           =       0x1e
                           00001F    24 VK_DOWN                         =       0x1f
                                     25 
                           000000    26 FG_BLACK                        =       0
                           000001    27 FG_BLUE                         =       1
                           000002    28 FG_RED                          =       2
                           000003    29 FG_MAGENTA                      =       3
                           000004    30 FG_GREEN                        =       4
                           000005    31 FG_CYAN                         =       5
                           000006    32 FG_YELLOW                       =       6
                           000007    33 FG_WHITE                        =       7
                           000000    34 BG_BLACK                        =       0*8
                           000008    35 BG_BLUE                         =       1*8
                           000010    36 BG_RED                          =       2*8
                           000018    37 BG_MAGENTA                      =       3*8
                           000020    38 BG_GREEN                        =       4*8
                           000028    39 BG_CYAN                         =       5*8
                           000030    40 BG_YELLOW                       =       6*8
                           000038    41 BG_WHITE                        =       7*8
                                     42 
                           000028    43 SCREEN_WIDTH                    =       40
                           000018    44 SCREEN_HEIGHT                   =       24
                                     45 
                           0000F0    46 VK_HEART                        =       0xf0
                           0000EF    47 CHR_WALL                        =       0xef
                           0000FC    48 CHR_MAN_HEAD                    =       0xfc
                           0000E5    49 CHR_MAN_STAY                    =       0xe5
                           0000E7    50 CHR_MAN_WALK                    =       0xe7
                           FFFFFFFE    51 TRANSITION_MAN_WALK_STAY        =       -2
                           00000C    52 CHR_MOVING_LINE                 =       0x0c
                           0000FE    53 VK_PLAYER                       =       0xfe
                           0000D0    54 CHR_SMOKE                       =       0xd0
                           0000EA    55 CHR_MAN_SLEEP                   =       0xea
                           0000ED    56 CHR_MAN_SLEEP_HEAD              =       0xed
                           0000F6    57 CHR_ARROW_RIGHT_TOP             =       0xf6
                           0000F4    58 CHR_ARROW_RIGHT_BOTTOM          =       0xf4
                           00008F    59 CHR_LINE_TOP                    =       0x8f
                           000003    60 CHR_LINE_BOTTOM                 =       0x03
                           0000E4    61 CHR_MIDDLE_LINE                 =       0xe4
                                     62 ;
                                     63 ; program specific constants
                                     64 ;
                           00000E    65 TOP_LINES                       =       14
                           000230    66 TITLE_TOP_SIZE                  =       SCREEN_WIDTH*TOP_LINES
                           000010    67 MENU_TOP                        =       (TOP_LINES+2)
                           000004    68 ALIGN_MIDDLE                    =       4
                           000006    69 GAMES_LINES                     =       6
                           000002    70 GAME_START_Y                    =       2
                           006D60    71 SLOW_DOWN_13066                 =       28000
                           00F398    72 POS_LIVES                       =       BWS+23*SCREEN_WIDTH
                           00F028    73 POS_TOP_WALL                    =       BWS+ 1*SCREEN_WIDTH
                           00F00C    74 POS_TOP_GAME                    =       BWS+ 0*SCREEN_WIDTH+8+ALIGN_MIDDLE
                           00F00D    75 POS_GAME_OVER                   =       BWS+ 0*SCREEN_WIDTH+9+ALIGN_MIDDLE
                           000370    76 POS_COPYRIGHT                   =       SCREEN_WIDTH*22
                           00001E    77 HINT_COPYRIGHT_size             =       0x001e
                           00000D    78 POSDIFF_NAME                    =       SCREEN_WIDTH-HINT_COPYRIGHT_size+3
                           000005    79 POSDIFF_YEAR                    =       5
                           000008    80 POSDIFF_POINTS                  =       8
                           FFFFFFD8    81 POSDIFF_YOUR_SCORE              =       -(SCREEN_WIDTH)
                           000003    82 POSDIFF_YOUR_SCORE_DY           =       3
                           000004    83 POSDIFF_HIGHSCORE_DY            =       4
                           000001    84 MONSTER_CORRECTION              =       1
                                     85 
                                     86 .macro PROGRAM_START
                                     87         ld      hl,#s__CODE
                                     88         ld      de,#s__CODE
                                     89         ld      bc,#l__CODE
                                     90         ldir
                                     91         ld      hl,#cfg10_settings
                                     92         res     6,(hl)                                  ;ROM_PACK_EN
                                     93         ld      a,(hl)
                                     94         out     (CFG10),a
                                     95         call    crt_cls
                                     96         call    crt_cursor_disable
                                     97 .endm
                                     98 
                                     99 .macro SCREEN_POS
                                    100         .ascii '    '
                                    101  .endm
                                    102 
                                    103 .macro CLRSCR
                                    104         call    crt_cls
                                    105 .endm
                                    106 
                                    107 .macro OUTCH
                                    108         call    putcharA
                                    109 .endm
                                    110 
                                    111 .macro INCH
                                    112         call    inch
                                    113 .endm
                                    114 
                                    115 .macro PRST7
                                    116         call    prst7
                                    117 .endm
                                    118 
                                    119 .macro INKEY
                                    120         call    inkey
                                    121 .endm
                                    122 
                                    123 .macro END_PROGRAM
                                    124         jp      exit
                                    125 .endm
                                    126 
                                    127 .macro SET_CURSOR_DE    Y,X
                                    128         ld      de,#BWS+Y*SCREEN_WIDTH+X
                                    129         ld      (CURSOR),de
                                    130 .endm
                                    131 
                                    132 .macro SET_CURSOR_HL    Y,X
                                    133         ld      hl,#BWS+Y*SCREEN_WIDTH+X
                                    134         ld      (CURSOR),hl
                                    135 .endm
                                    136 
                                    137 .macro SET_CURSOR
                                    138         ld      (CURSOR),hl
                                    139 .endm
                                    140 
                                    141 .macro REMOVE_CURSOR
                                    142         ;actually restores HL
                                    143         ld      hl,(CURSOR)
                                    144 .endm
                                    145 
                                    146 .macro CURSOR_DISABLE
                                    147 .endm
                                    148 
                                    149 .macro Z1013_LINE
                                    150 .endm
                                    151 
                                    152 .macro TOP_IMAGE_CONTENT
                                    153         ; line 1
                                    154         SCREEN_POS
                                    155         .db     0xe0,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe1
                                    156         .db     0x20,0x20,0x20,0x20,0x20
                                    157         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    158         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    159         SCREEN_POS
                                    160         
                                    161         ; line 2
                                    162         SCREEN_POS
                                    163         .db     0xe5,0x16,0x03,0x04,0x97,0x03,0x09,0x20,0x94,0x01,0xe5
                                    164         .db     0x20,0x20,0x20,0x20,0x20
                                    165         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95
                                    166         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    167         SCREEN_POS
                                    168 
                                    169         ; line 3
                                    170         SCREEN_POS
                                    171         .db     0xe5,0x9a,0x8f,0x20,0x95,0x20,0x20,0x20,0x95,0x20,0xe5
                                    172         .db     0x20,0x20,0x20,0x20,0x20
                                    173         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95
                                    174         .db     0x20,0x20,0x20,0x20,0x8f,0x8f,0x20,0x20
                                    175         SCREEN_POS
                                    176 
                                    177         ; line 4
                                    178         SCREEN_POS
                                    179         .db     0xe5,0x10,0x20,0x15,0x95,0x20,0x9f,0x20,0x95,0x20,0xe5
                                    180         .db     0x20,0x20,0x20,0x20,0x20
                                    181         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    182         .db     0x03,0x8f,0x20,0x16,0x9f,0x9f,0x96,0x20
                                    183         SCREEN_POS
                                    184 
                                    185         ; line 5
                                    186          SCREEN_POS
                                    187         .db     0xe5,0x02,0x03,0x20,0x20,0x03,0x01,0x20,0x03,0x01,0xe5
                                    188         .db     0x20,0x20,0x20,0x20,0x20
                                    189         .db     0x20,0x20,0x9f,0x10,0x20,0x20,0x20,0x20
                                    190         .db     0x20,0x85,0x0c,0x15,0x15,0x0c,0x95,0x20
                                    191         SCREEN_POS
                                    192 
                                    193         ; line 6
                                    194         SCREEN_POS
                                    195         .db     0xe5,0x70,0x72,0x65,0x73,0x65,0x6e,0x74,0x73,0x3a,0xe5
                                    196         .db     0x20,0x20,0x20,0x20,0x20
                                    197         .db     0x20,0x9f,0x01,0x02,0x10,0x20,0x20,0x8f
                                    198         .db     0x03,0x02,0x10,0x96,0x02,0x02,0x16,0x20
                                    199         SCREEN_POS
                                    200 
                                    201         ; line 7
                                    202         SCREEN_POS
                                    203         .db     0xe2,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe3
                                    204         .db     0x20,0x20,0x20,0x20,0x20
                                    205         .db     0x20,0x01,0x20,0x20,0x95,0x8f,0x03,0x20
                                    206         .db     0x20,0x20,0x02,0x10,0x03,0x17,0x20,0x20
                                    207         SCREEN_POS
                                    208 
                                    209         ; line 8
                                    210         SCREEN_POS
                                    211         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    212         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    213         .db     0x02,0x03,0x03,0x03,0x03,0x20,0x20,0x20
                                    214         .db     0x20,0x20,0x20,0x02,0x16,0x20,0x20,0x20
                                    215          SCREEN_POS
                                    216 
                                    217         ; line 11
                                    218         SCREEN_POS
                                    219         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    220         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    221         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    222         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    223          SCREEN_POS
                                    224 
                                    225         ; line 12
                                    226         SCREEN_POS
                                    227         .db     0x20,0x20,0x20,0x15,0x20,0x20,0x20,0x20 ;   4    
                                    228         .db     0x20,0x20,0x20,0x20,0x01,0x20,0x20,0x20 ;    0   
                                    229         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x15,0x20 ;      4 
                                    230         .db     0x20,0x20,0x20,0x20,0x15,0x9f,0x20,0x20 ;    42  
                                    231          SCREEN_POS
                                    232 
                                    233         ; line 13
                                    234         SCREEN_POS
                                    235         .db     0x20,0x20,0x20,0x15,0x15,0x95,0x97,0x96 ;   4455=
                                    236         .db     0x96,0x95,0x03,0x14,0x15,0x1d,0x96,0x97 ;=5634<=2
                                    237         .db     0x03,0x14,0x20,0x20,0x20,0x20,0x15,0x02 ;63    41
                                    238         .db     0x96,0x97,0x03,0x14,0x82,0x01,0x20,0x20 ;8263;0  
                                    239          SCREEN_POS
                                    240 
                                    241         ; line 14
                                    242         SCREEN_POS
                                    243         .db     0x20,0x10,0x20,0x15,0x15,0x95,0x95,0x95 ; 3 44555
                                    244         .db     0x95,0x95,0x8f,0x05,0x15,0x15,0x95,0x0a ;55704451
                                    245         .db     0x8f,0x15,0x20,0x20,0x10,0x20,0x15,0x16 ;74  3 49
                                    246         .db     0x94,0x95,0x20,0x10,0x15,0x96,0x20,0x20 ;=5 348  
                                    247          SCREEN_POS
                                    248 
                                    249         ; line 15
                                    250         SCREEN_POS
                                    251         .db     0x20,0x9a,0x8f,0x05,0x02,0x01,0x02,0x02 ; 8701011
                                    252         .db     0x02,0x95,0x20,0x20,0x01,0x01,0x02,0x08 ;15  0011
                                    253         .db     0x8f,0x05,0x20,0x20,0x9a,0x8f,0x05,0x02 ;70  8701
                                    254         .db     0x03,0x20,0x03,0x20,0x01,0x20,0x01,0x20 ;6 6 0 0 
                                    255          SCREEN_POS
                                    256 
                                    257         ; line 16
                                    258         SCREEN_POS
                                    259         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    260         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    261         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    262         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    263         SCREEN_POS
                                    264 .endm
                                    265 
                                    266 .macro MONSTER_IMG_CONTENT
                                    267         .db     0x3c,0x2f,0xdf,0x2f,0xdf,0xb1,0x3e,0xb1
                                    268         .db     0xfc,0x95,0x20,0xf7,0x20,0xf6,0x20,0x2f
                                    269         .db     0x87,0x02,0x0c,0x03,0x0c,0x03,0x8a,0x05
                                    270         .db     0x20,0xf5,0x20,0xee,0x94,0xee,0x01,0xf4
                                    271         .db     0x8b,0xec,0x8f,0xec,0x58,0x03,0x83,0xed
                                    272         .db     0xf7,0xf5,0xea,0xeb,0xf6,0xf4,0x20,0x20
                                    273         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    274 .endm
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
      00A00F                         59 _main:
      00A00F                         60 sadr:
      000000                         61         PROGRAM_START
      00A00F 21 00 A0         [10]    1         ld      hl,#s__CODE
      00A012 11 00 A0         [10]    2         ld      de,#s__CODE
      00A015 01 77 0D         [10]    3         ld      bc,#l__CODE
      00A018 ED B0            [21]    4         ldir
      00A01A 21 68 E4         [10]    5         ld      hl,#cfg10_settings
      00A01D CB B6            [15]    6         res     6,(hl)                                  ;ROM_PACK_EN
      00A01F 7E               [ 7]    7         ld      a,(hl)
      00A020 D3 10            [11]    8         out     (CFG10),a
      00A022 CD E8 E9         [17]    9         call    crt_cls
      00A025 CD AF AC         [17]   10         call    crt_cursor_disable
      000019                         62         CLRSCR
      00A028 CD E8 E9         [17]    1         call    crt_cls
      00A02B 11 00 F0         [10]   63         ld      de,#BWS
      00A02E 21 CE A6         [10]   64         ld      hl,#TOP_IMAGE
      00A031 01 30 02         [10]   65         ld      bc,#TITLE_TOP_SIZE
      00A034 ED B0            [21]   66         ldir
      00A036 21 30 F2         [10]   67         ld      hl,#BWS+SCREEN_WIDTH*TOP_LINES
      00A039 36 F0            [10]   68         ld      (hl),#VK_HEART
      00A03B 11 31 F2         [10]   69         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+1
      00A03E 01 27 00         [10]   70         ld      bc,#SCREEN_WIDTH-1
      00A041 ED B0            [21]   71         ldir
      00A043 11 50 F2         [10]   72         ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+(SCREEN_WIDTH-8)
      00A046 21 74 A9         [10]   73         ld      hl,#VERSION_INFO
      00A049 01 05 00         [10]   74         ld      bc,#VERSION_INFO_size
      00A04C ED B0            [21]   75         ldir
      00A04E 11 8E F2         [10]   76         ld      de,#BWS+SCREEN_WIDTH*MENU_TOP+10+ALIGN_MIDDLE
      00A051 21 FE A8         [10]   77         ld      hl,#HINT_RIGHT
      00A054 01 0C 00         [10]   78         ld      bc,#HINT_RIGHT_size
      00A057 ED B0            [21]   79         ldir
      00A059 0E 1C            [ 7]   80         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      00A05B EB               [ 4]   81         ex      de,hl
      00A05C 09               [11]   82         add     hl,bc
      00A05D EB               [ 4]   83         ex      de,hl
      00A05E 0E 0C            [ 7]   84         ld      c,#HINT_RIGHT_size
      00A060 ED B0            [21]   85         ldir
      00A062 0E 1C            [ 7]   86         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      00A064 EB               [ 4]   87         ex      de,hl
      00A065 09               [11]   88         add     hl,bc
      00A066 EB               [ 4]   89         ex      de,hl
      00A067 0E 0C            [ 7]   90         ld      c,#HINT_RIGHT_size
      00A069 ED B0            [21]   91         ldir
      00A06B 0E 1C            [ 7]   92         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      00A06D EB               [ 4]   93         ex      de,hl
      00A06E 09               [11]   94         add     hl,bc
      00A06F EB               [ 4]   95         ex      de,hl
      00A070 0E 0C            [ 7]   96         ld      c,#HINT_RIGHT_size
      00A072 ED B0            [21]   97         ldir
      00A074 0E 1C            [ 7]   98         ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
      00A076 EB               [ 4]   99         ex      de,hl
      00A077 09               [11]  100         add     hl,bc
      00A078 EB               [ 4]  101         ex      de,hl
      00A079 0E 0C            [ 7]  102         ld      c,#HINT_RIGHT_size
      00A07B ED B0            [21]  103         ldir
      00A07D 11 70 F3         [10]  104         ld      de,#BWS+POS_COPYRIGHT
      00A080 0E 1E            [ 7]  105         ld      c,#HINT_COPYRIGHT_size
      00A082 ED B0            [21]  106         ldir
      00A084 0E 0D            [ 7]  107         ld      c,#POSDIFF_NAME
      00A086 EB               [ 4]  108         ex      de,hl
      00A087 09               [11]  109         add     hl,bc
      00A088 EB               [ 4]  110         ex      de,hl
      00A089 0E 0E            [ 7]  111         ld      c,#HINT_NAME_size
      00A08B ED B0            [21]  112         ldir
      00A08D 0E 05            [ 7]  113         ld      c,#POSDIFF_YEAR
      00A08F EB               [ 4]  114         ex      de,hl
      00A090 09               [11]  115         add     hl,bc
      00A091 EB               [ 4]  116         ex      de,hl
      00A092 0E 12            [ 7]  117         ld      c,#HINT_YEAR_size+VERSION_INFO_size-1
      00A094 ED B0            [21]  118         ldir
      00A096                        119 choose_menu:
      00A096 AF               [ 4]  120         xor     a
      000088                        121         INCH
      00A097 CD E8 AC         [17]    1         call    inch
      00A09A FE 5F            [ 7]  122         cp      #SMALL_CAPITALS
      00A09C 38 02            [12]  123         jr      c,capitalized
      00A09E D6 20            [ 7]  124         sub     #CAPITALIZE
      00A0A0                        125 capitalized:
      00A0A0 FE 45            [ 7]  126         cp      #'E'
      00A0A2 CA 56 A6         [10]  127         jp      z,exit_game
      00A0A5 FE 50            [ 7]  128         cp      #'P'
      00A0A7 20 ED            [12]  129         jr      nz,choose_menu
      00A0A9                        130 new_game:
      00009A                        131         CLRSCR
      00A0A9 CD E8 E9         [17]    1         call    crt_cls
      00A0AC 21 99 AA         [10]  132         ld      hl,#LIVES
      00A0AF 36 06            [10]  133         ld      (hl),#INITIAL_LIVES
      00A0B1 21 9A AA         [10]  134         ld      hl,#POINTS
      00A0B4 36 00            [10]  135         ld      (hl),#ZERO
      00A0B6 23               [ 6]  136         inc     hl
      00A0B7 36 00            [10]  137         ld      (hl),#ZERO
      00A0B9 06 06            [ 7]  138         ld      b,#INITIAL_LIVES
      00A0BB 21 98 F3         [10]  139         ld      hl,#POS_LIVES
      00A0BE                        140 draw_player:
      00A0BE 3E 02            [ 7]  141         ld      a,#MOVE_2X_RIGHT
      00A0C0 85               [ 4]  142         add     a,l
      00A0C1 6F               [ 4]  143         ld      l,a
      00A0C2 36 FE            [10]  144         ld      (hl),#VK_PLAYER
      00A0C4 10 F8            [13]  145         djnz    draw_player
      00A0C6 3E 01            [ 7]  146         ld      a,#INITIAL_LEVEL
      00A0C8 32 9C AA         [13]  147         ld      (LEVEL),a
      00A0CB 3E 02            [ 7]  148         ld      a,#INITIAL_FAIL_COUNTER
      00A0CD 32 93 AA         [13]  149         ld      (cnt_fail_trap),a
      00A0D0 32 94 AA         [13]  150         ld      (cnt_fail_jump),a
      00A0D3 21 00 F0         [10]  151         ld      hl,#BWS
      00A0D6 36 20            [10]  152         ld      (hl),#' '
      00A0D8 11 01 F0         [10]  153         ld      de,#BWS+1
      00A0DB 01 96 03         [10]  154         ld      bc,#(3+GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH-2
      00A0DE ED B0            [21]  155         ldir
      00A0E0 21 28 F0         [10]  156         ld      hl,#POS_TOP_WALL
      00A0E3 36 EF            [10]  157         ld      (hl),#CHR_WALL
      00A0E5 11 29 F0         [10]  158         ld      de,#POS_TOP_WALL+1
      00A0E8 01 27 00         [10]  159         ld      bc,#SCREEN_WIDTH-1
      00A0EB ED B0            [21]  160         ldir
      00A0ED 21 70 F0         [10]  161         ld      hl,#POS_TOP_WALL+2*SCREEN_WIDTH-8
      00A0F0 36 EF            [10]  162         ld      (hl),#CHR_WALL
      00A0F2 2B               [ 6]  163         dec     hl
      00A0F3 2B               [ 6]  164         dec     hl
      00A0F4 36 F6            [10]  165         ld      (hl),#CHR_ARROW_RIGHT_TOP
      00A0F6 2B               [ 6]  166         dec     hl
      00A0F7 36 8F            [10]  167         ld      (hl),#CHR_LINE_TOP
      00A0F9 21 98 F0         [10]  168         ld      hl,#POS_TOP_WALL+3*SCREEN_WIDTH-8
      00A0FC 36 EF            [10]  169         ld      (hl),#CHR_WALL
      00A0FE 2B               [ 6]  170         dec     hl
      00A0FF 2B               [ 6]  171         dec     hl
      00A100 36 F4            [10]  172         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      00A102 2B               [ 6]  173         dec     hl
      00A103 36 03            [10]  174         ld      (hl),#CHR_LINE_BOTTOM
      00A105 21 9E AA         [10]  175         ld      hl,#TXT_JUMP
      00A108 11 0C F0         [10]  176         ld      de,#POS_TOP_GAME
      00A10B 01 10 00         [10]  177         ld      bc,#TXT_JUMP_size
      00A10E ED B0            [21]  178         ldir
      00A110 3E 01            [ 7]  179         ld      a,#INITIAL_DELAY_COUNTER
      00A112 21 97 AA         [10]  180         ld      hl,#JUMP_DELAY
      00A115 77               [ 7]  181         ld      (hl),a
      00A116 21 98 AA         [10]  182         ld      hl,#FAIL_DELAY
      00A119 77               [ 7]  183         ld      (hl),a
      00A11A 23               [ 6]  184         inc     hl
      00A11B 21 32 F3         [10]  185         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      00A11E 22 95 AA         [16]  186         ld      (MAN_HEAD),hl
      00A121 36 FC            [10]  187         ld      (hl),#CHR_MAN_HEAD
      00A123 11 28 00         [10]  188         ld      de,#SCREEN_WIDTH
      00A126 19               [11]  189         add     hl,de
      00A127 36 E5            [10]  190         ld      (hl),#CHR_MAN_STAY
      00A129                        191 animation_loop:
      00A129 CD C8 A1         [17]  192         call    animation_monster
      00A12C CD 87 A2         [17]  193         call    animation_lines
      00A12F CD F7 A2         [17]  194         call    animation_delay
      00A132 3A 97 AA         [13]  195         ld      a,(JUMP_DELAY)
      00A135 FE 01            [ 7]  196         cp      #INITIAL_DELAY_COUNTER
      00A137 20 31            [12]  197         jr      nz,handle_jump_delay
      00A139 3A 98 AA         [13]  198         ld      a,(FAIL_DELAY)
      00A13C FE 01            [ 7]  199         cp      #INITIAL_DELAY_COUNTER
      00A13E 20 27            [12]  200         jr      nz,handle_fail_delay
      000131                        201         INKEY
      00A140 CD DB AC         [17]    1         call    inkey
      00A143 FE 20            [ 7]  202         cp      #' '
      00A145 CA B4 A3         [10]  203         jp      z,action_jump
      00A148 FE 1D            [ 7]  204         cp      #VK_LEFT
      00A14A CC 04 A3         [17]  205         call    z,action_left
      00A14D FE 1C            [ 7]  206         cp      #VK_RIGHT
      00A14F CC 5B A3         [17]  207         call    z,action_right
                           000001   208 .if  eq,z9001
                                    209         ;debuggin
      00A152 FE 55            [ 7]  210         cp      #'U'
      00A154 20 0A            [12]  211         jr      nz,next_cmd
      00A156 21 64 F0         [10]  212         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+20
      00A159 36 FC            [10]  213         ld      (hl),#CHR_MAN_HEAD
      00A15B 22 95 AA         [16]  214         ld      (MAN_HEAD),hl
      00A15E 18 07            [12]  215         jr      handle_fail_delay
      00A160                        216 next_cmd:
      00A160 FE 58            [ 7]  217         cp      #'X'
      00A162 20 03            [12]  218         jr      nz,handle_fail_delay
      00A164 C3 1D A5         [10]  219         jp      no_lives
                                    220 .endif
      00A167                        221 handle_fail_delay:
      00A167 CD 18 A4         [17]  222         call    check_fall_through
      00A16A                        223 handle_jump_delay:
      00A16A 3A 97 AA         [13]  224         ld      a,(JUMP_DELAY)
      00A16D FE 01            [ 7]  225         cp      #INITIAL_DELAY_COUNTER
      00A16F 28 04            [12]  226         jr      z,jump_delay_counter_set
      00A171 3D               [ 4]  227         dec     a
      00A172 32 97 AA         [13]  228         ld      (JUMP_DELAY),a
      00A175                        229 jump_delay_counter_set:
      00A175 3A 98 AA         [13]  230         ld      a,(FAIL_DELAY)
      00A178 FE 01            [ 7]  231         cp      #INITIAL_DELAY_COUNTER
      00A17A 28 42            [12]  232         jr      z,player_activity
      00A17C 3D               [ 4]  233         dec     a
      00A17D 32 98 AA         [13]  234         ld      (FAIL_DELAY),a
      00A180 FE 01            [ 7]  235         cp      #INITIAL_DELAY_COUNTER
      00A182 20 3A            [12]  236         jr      nz,player_activity
      00A184 2A 95 AA         [16]  237         ld      hl,(MAN_HEAD)
                                    238         ; test for bottom line
      00A187 11 D0 F2         [10]  239         ld      de,#BWS+(GAME_START_Y+3*GAMES_LINES-2)*SCREEN_WIDTH
      00A18A A7               [ 4]  240         and     a
      00A18B ED 52            [15]  241         sbc     hl,de
      00A18D 38 16            [12]  242         jr      c,player_wake_up
      00A18F 3A 99 AA         [13]  243         ld      a,(LIVES)
      00A192 3D               [ 4]  244         dec     a
      00A193 32 99 AA         [13]  245         ld      (LIVES),a
      00A196 21 9A F3         [10]  246         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES+3)*SCREEN_WIDTH+2
      00A199 16 00            [ 7]  247         ld      d,#HI_ZERO
      00A19B 87               [ 4]  248         add     a,a
      00A19C 5F               [ 4]  249         ld      e,a
      00A19D 19               [11]  250         add     hl,de
      00A19E 36 20            [10]  251         ld      (hl),#' '
      00A1A0 FE 00            [ 7]  252         cp      #ZERO
      00A1A2 CA 1D A5         [10]  253         jp      z,no_lives
      00A1A5                        254 player_wake_up:
      00A1A5 2A 95 AA         [16]  255         ld      hl,(MAN_HEAD)
      00A1A8 36 FC            [10]  256         ld      (hl),#CHR_MAN_HEAD
      00A1AA 2B               [ 6]  257         dec     hl
      00A1AB 3E 20            [ 7]  258         ld      a,#' '
      00A1AD 77               [ 7]  259         ld      (hl),a
      00A1AE 23               [ 6]  260         inc     hl
      00A1AF 23               [ 6]  261         inc     hl
      00A1B0 23               [ 6]  262         inc     hl
      00A1B1 77               [ 7]  263         ld      (hl),a
      00A1B2 2B               [ 6]  264         dec     hl
      00A1B3 11 28 00         [10]  265         ld      de,#SCREEN_WIDTH
      00A1B6 19               [11]  266         add     hl,de
      00A1B7 77               [ 7]  267         ld      (hl),a
      00A1B8 23               [ 6]  268         inc     hl
      00A1B9 77               [ 7]  269         ld      (hl),a
      00A1BA 2B               [ 6]  270         dec     hl
      00A1BB 2B               [ 6]  271         dec     hl
      00A1BC 36 E7            [10]  272         ld      (hl),#CHR_MAN_WALK
      00A1BE                        273 player_activity:
      00A1BE CD 69 A4         [17]  274         call    check_level_finished
      00A1C1 C3 29 A1         [10]  275         jp      animation_loop
                                    276 ; unchecked data source
      00A1C4 67 75 66 69            277         .db     0x67,0x75,0x66,0x69                     ;gufi
      00A1C8                        278 animation_monster:
      00A1C8 3A 9C AA         [13]  279         ld      a,(LEVEL)
      00A1CB 32 9D AA         [13]  280         ld      (counter),a
      00A1CE FE 01            [ 7]  281         cp      #LEVEL_1
      00A1D0 C8               [11]  282         ret     z
      00A1D1 01 AE AA         [10]  283         ld      bc,#MONSTER_PTR
      00A1D4 11 E6 AA         [10]  284         ld      de,#MONSTER_IMG
      00A1D7                        285 handle_one_monster:
      00A1D7 0A               [ 7]  286         ld      a,(bc)
      00A1D8 6F               [ 4]  287         ld      l,a
      00A1D9 03               [ 6]  288         inc     bc
      00A1DA 0A               [ 7]  289         ld      a,(bc)
      00A1DB 67               [ 4]  290         ld      h,a
      00A1DC CD EB A1         [17]  291         call    handle_by_ptr
      00A1DF 3A 9D AA         [13]  292         ld      a,(counter)
      00A1E2 3D               [ 4]  293         dec     a
      00A1E3 32 9D AA         [13]  294         ld      (counter),a
      00A1E6 FE 01            [ 7]  295         cp      #LEVEL_1
      00A1E8 C8               [11]  296         ret     z
      00A1E9 18 EC            [12]  297         jr      handle_one_monster
      00A1EB                        298 handle_by_ptr:
      00A1EB C5               [11]  299         push    bc
      00A1EC 3E 04            [ 7]  300         ld      a,#MONSTER_WIDTH
      00A1EE D5               [11]  301         push    de
      00A1EF                        302 handle_by_column:
      00A1EF 36 20            [10]  303         ld      (hl),#' '
      00A1F1 11 28 00         [10]  304         ld      de,#SCREEN_WIDTH
      00A1F4 19               [11]  305         add     hl,de
      00A1F5 36 20            [10]  306         ld      (hl),#' '
      00A1F7 A7               [ 4]  307         and     a
      00A1F8 ED 52            [15]  308         sbc     hl,de
      00A1FA 2B               [ 6]  309         dec     hl
      00A1FB E5               [11]  310         push    hl
      00A1FC 08               [ 4]  311         ex      af,af'
      00A1FD 11 EF F0         [10]  312         ld      de,#BWS+(GAME_START_Y+4)*SCREEN_WIDTH-1
      00A200 A7               [ 4]  313         and     a
      00A201 ED 52            [15]  314         sbc     hl,de
      00A203 38 0D            [12]  315         jr      c,correct_ptr
      00A205 C5               [11]  316         push    bc
      00A206 06 06            [ 7]  317         ld      b,#GAMES_LINES
      00A208 11 78 00         [10]  318         ld      de,#3*SCREEN_WIDTH
      00A20B                        319 get_column:
      00A20B A7               [ 4]  320         and     a
      00A20C ED 52            [15]  321         sbc     hl,de
      00A20E 38 13            [12]  322         jr      c,test_column
      00A210 10 F9            [13]  323         djnz    get_column
      00A212                        324 correct_ptr:
      00A212 11 27 00         [10]  325         ld      de,#SCREEN_WIDTH-1
      00A215 ED 5A            [15]  326         adc     hl,de
      00A217 28 03            [12]  327         jr      z,start_from_bottom
      00A219 E1               [10]  328         pop     hl
      00A21A 18 19            [12]  329         jr      update_pointers
      00A21C                        330 start_from_bottom:
      00A21C E1               [10]  331         pop     hl
      00A21D 11 08 02         [10]  332         ld      de,#((GAMES_LINES-2)*3+1)*SCREEN_WIDTH
      00A220 19               [11]  333         add     hl,de
      00A221 18 12            [12]  334         jr      update_pointers
      00A223                        335 test_column:
      00A223 C1               [10]  336         pop     bc
      00A224 11 27 00         [10]  337         ld      de,#SCREEN_WIDTH-1
      00A227 ED 5A            [15]  338         adc     hl,de
      00A229 28 03            [12]  339         jr      z,move_one_line_up
      00A22B E1               [10]  340         pop     hl
      00A22C 18 07            [12]  341         jr      update_pointers
      00A22E                        342 move_one_line_up:
      00A22E E1               [10]  343         pop     hl
      00A22F 11 50 00         [10]  344         ld      de,#2*SCREEN_WIDTH
      00A232 A7               [ 4]  345         and     a
      00A233 ED 52            [15]  346         sbc     hl,de
      00A235                        347 update_pointers:
      00A235 0B               [ 6]  348         dec     bc
      00A236 7D               [ 4]  349         ld      a,l
      00A237 02               [ 7]  350         ld      (bc),a
      00A238 03               [ 6]  351         inc     bc
      00A239 7C               [ 4]  352         ld      a,h
      00A23A 02               [ 7]  353         ld      (bc),a
      00A23B 03               [ 6]  354         inc     bc
      00A23C 0A               [ 7]  355         ld      a,(bc)
      00A23D 6F               [ 4]  356         ld      l,a
      00A23E 03               [ 6]  357         inc     bc
      00A23F 0A               [ 7]  358         ld      a,(bc)
      00A240 67               [ 4]  359         ld      h,a
      00A241 08               [ 4]  360         ex      af,af'
      00A242 3D               [ 4]  361         dec     a
      00A243 FE 00            [ 7]  362         cp      #ZERO
      00A245 28 02            [12]  363         jr      z,draw_monster
      00A247 18 A6            [12]  364         jr      handle_by_column
      00A249                        365 draw_monster:
      00A249 D1               [10]  366         pop     de
      00A24A C1               [10]  367         pop     bc
      00A24B 0B               [ 6]  368         dec     bc
      00A24C 3E 04            [ 7]  369         ld      a,#MONSTER_WIDTH
      00A24E                        370 draw_monster_segment:
      00A24E 08               [ 4]  371         ex      af,af'
      00A24F 0A               [ 7]  372         ld      a,(bc)
      00A250 6F               [ 4]  373         ld      l,a
      00A251 03               [ 6]  374         inc     bc
      00A252 0A               [ 7]  375         ld      a,(bc)
      00A253 67               [ 4]  376         ld      h,a
      00A254 03               [ 6]  377         inc     bc
      00A255 1A               [ 7]  378         ld      a,(de)
      00A256 77               [ 7]  379         ld      (hl),a
      00A257 13               [ 6]  380         inc     de
      00A258 1A               [ 7]  381         ld      a,(de)
      00A259 D5               [11]  382         push    de
      00A25A 11 28 00         [10]  383         ld      de,#SCREEN_WIDTH
      00A25D 19               [11]  384         add     hl,de
      00A25E 77               [ 7]  385         ld      (hl),a
      00A25F CD 6B A2         [17]  386         call    monster_check_crash
      00A262 D1               [10]  387         pop     de
      00A263 13               [ 6]  388         inc     de
      00A264 08               [ 4]  389         ex      af,af'
      00A265 3D               [ 4]  390         dec     a
      00A266 FE 00            [ 7]  391         cp      #ZERO
      00A268 20 E4            [12]  392         jr      nz,draw_monster_segment
      00A26A C9               [10]  393         ret
      00A26B                        394 monster_check_crash:
      00A26B A7               [ 4]  395         and     a
      00A26C ED 52            [15]  396         sbc     hl,de
      00A26E EB               [ 4]  397         ex      de,hl
      00A26F 2A 95 AA         [16]  398         ld      hl,(MAN_HEAD)
      00A272 A7               [ 4]  399         and     a
      00A273 ED 52            [15]  400         sbc     hl,de
      00A275 EB               [ 4]  401         ex      de,hl
      00A276 C0               [11]  402         ret     nz
      00A277 11 28 00         [10]  403         ld      de,#SCREEN_WIDTH
      00A27A 19               [11]  404         add     hl,de
      00A27B 23               [ 6]  405         inc     hl
      00A27C 36 EA            [10]  406         ld      (hl),#CHR_MAN_SLEEP
      00A27E 23               [ 6]  407         inc     hl
      00A27F 36 ED            [10]  408         ld      (hl),#CHR_MAN_SLEEP_HEAD
      00A281 3E 0B            [ 7]  409         ld      a,#DELAY_COUNTER
      00A283 32 98 AA         [13]  410         ld      (FAIL_DELAY),a
      00A286 C9               [10]  411         ret
      00A287                        412 animation_lines:
      00A287 3E 0C            [ 7]  413         ld      a,#CHR_MOVING_LINE
      00A289 21 79 A9         [10]  414         ld      hl,#LINE_BUFFER
      00A28C 77               [ 7]  415         ld      (hl),a
      00A28D 11 7A A9         [10]  416         ld      de,#LINE_BUFFER+1
      00A290 01 0E 01         [10]  417         ld      bc,#LINE_BUFFER_size-1
      00A293 ED B0            [21]  418         ldir
      00A295 3A 93 AA         [13]  419         ld      a,(cnt_fail_trap)
      00A298 11 89 AA         [10]  420         ld      de,#OFFSET_HOLES
      00A29B 1B               [ 6]  421         dec     de
      00A29C                        422 loop_failed_penalty_holes:
      00A29C F5               [11]  423         push    af
      00A29D 13               [ 6]  424         inc     de
      00A29E 1A               [ 7]  425         ld      a,(de)
      00A29F 3C               [ 4]  426         inc     a
      00A2A0 12               [ 7]  427         ld      (de),a
      00A2A1 4F               [ 4]  428         ld      c,a
      00A2A2 06 00            [ 7]  429         ld      b,#HI_ZERO
      00A2A4 21 79 A9         [10]  430         ld      hl,#LINE_BUFFER
      00A2A7 09               [11]  431         add     hl,bc
      00A2A8 36 20            [10]  432         ld      (hl),#' '
      00A2AA 23               [ 6]  433         inc     hl
      00A2AB 36 20            [10]  434         ld      (hl),#' '
      00A2AD 23               [ 6]  435         inc     hl
      00A2AE 36 20            [10]  436         ld      (hl),#' '
      00A2B0 F1               [10]  437         pop     af
      00A2B1 3D               [ 4]  438         dec     a
      00A2B2 20 E8            [12]  439         jr      nz,loop_failed_penalty_holes
      00A2B4 3A 94 AA         [13]  440         ld      a,(cnt_fail_jump)
      00A2B7 11 8E AA         [10]  441         ld      de,#OFFSET_HOLES_JUMP_PENALTY
      00A2BA 1B               [ 6]  442         dec     de
      00A2BB                        443 loop_jump_penalty_holes:
      00A2BB F5               [11]  444         push    af
      00A2BC 13               [ 6]  445         inc     de
      00A2BD 1A               [ 7]  446         ld      a,(de)
      00A2BE 3D               [ 4]  447         dec     a
      00A2BF 12               [ 7]  448         ld      (de),a
      00A2C0 4F               [ 4]  449         ld      c,a
      00A2C1 06 00            [ 7]  450         ld      b,#HI_ZERO
      00A2C3 21 79 A9         [10]  451         ld      hl,#LINE_BUFFER
      00A2C6 09               [11]  452         add     hl,bc
      00A2C7 36 20            [10]  453         ld      (hl),#' '
      00A2C9 23               [ 6]  454         inc     hl
      00A2CA 36 20            [10]  455         ld      (hl),#' '
      00A2CC 23               [ 6]  456         inc     hl
      00A2CD 36 20            [10]  457         ld      (hl),#' '
      00A2CF F1               [10]  458         pop     af
      00A2D0 3D               [ 4]  459         dec     a
      00A2D1 20 E8            [12]  460         jr      nz,loop_jump_penalty_holes
      00A2D3 3E 06            [ 7]  461         ld      a,#GAMES_LINES
      00A2D5 21 79 A9         [10]  462         ld      hl,#LINE_BUFFER
      00A2D8 11 50 F0         [10]  463         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+0
      00A2DB                        464 print_line:
      00A2DB 01 28 00         [10]  465         ld      bc,#SCREEN_WIDTH
      00A2DE E5               [11]  466         push    hl
      00A2DF EB               [ 4]  467         ex      de,hl
      00A2E0 09               [11]  468         add     hl,bc
      00A2E1 09               [11]  469         add     hl,bc
      00A2E2 EB               [ 4]  470         ex      de,hl
      00A2E3 E1               [10]  471         pop     hl
      00A2E4 ED B0            [21]  472         ldir
      00A2E6 3D               [ 4]  473         dec     a
      00A2E7 20 F2            [12]  474         jr      nz,print_line
      00A2E9 21 70 F3         [10]  475         ld      hl,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+0
      00A2EC 11 71 F3         [10]  476         ld      de,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+1
      00A2EF 01 27 00         [10]  477         ld      bc,#SCREEN_WIDTH-1
      00A2F2 36 EF            [10]  478         ld      (hl),#CHR_WALL
      00A2F4 ED B0            [21]  479         ldir
      00A2F6 C9               [10]  480         ret
      00A2F7                        481 animation_delay:
      00A2F7 21 60 6D         [10]  482         ld      hl,#SLOW_DOWN_13066
      00A2FA 11 01 00         [10]  483         ld      de,#1
      00A2FD A7               [ 4]  484         and     a
      00A2FE                        485 delay_loop:
      00A2FE 2B               [ 6]  486         dec     hl
      00A2FF ED 52            [15]  487         sbc     hl,de
      00A301 20 FB            [12]  488         jr      nz,delay_loop
      00A303 C9               [10]  489         ret
      00A304                        490 action_left:
      00A304 F5               [11]  491         push    af
      00A305 2A 95 AA         [16]  492         ld      hl,(MAN_HEAD)
      00A308 7E               [ 7]  493         ld      a,(hl)
      00A309 36 20            [10]  494         ld      (hl),#' '
      00A30B 2B               [ 6]  495         dec     hl
      00A30C 22 95 AA         [16]  496         ld      (MAN_HEAD),hl
      00A30F 77               [ 7]  497         ld      (hl),a
      00A310 11 28 00         [10]  498         ld      de,#SCREEN_WIDTH
      00A313 19               [11]  499         add     hl,de
      00A314 23               [ 6]  500         inc     hl
      00A315 7E               [ 7]  501         ld      a,(hl)
      00A316 36 20            [10]  502         ld      (hl),#' '
      00A318 FE E7            [ 7]  503         cp      #CHR_MAN_WALK
      00A31A 28 04            [12]  504         jr      z,transition_left_stay
      00A31C FE E5            [ 7]  505         cp      #CHR_MAN_STAY
      00A31E 28 04            [12]  506         jr      z,transition_left_walk
      00A320                        507 transition_left_stay:
      00A320 C6 FE            [ 7]  508         add     a,#TRANSITION_MAN_WALK_STAY
      00A322 18 02            [12]  509         jr      update_left
      00A324                        510 transition_left_walk:
      00A324 D6 FE            [ 7]  511         sub     #TRANSITION_MAN_WALK_STAY
      00A326                        512 update_left:
      00A326 2B               [ 6]  513         dec     hl
      00A327 77               [ 7]  514         ld      (hl),a
      00A328 3E 07            [ 7]  515         ld      a,#GAMES_LINES+1
      00A32A 01 4F F0         [10]  516         ld      bc,#BWS+(GAME_START_Y)*SCREEN_WIDTH-1
      00A32D                        517 loop_left_border_check:
      00A32D C5               [11]  518         push    bc
      00A32E 60               [ 4]  519         ld      h,b
      00A32F 69               [ 4]  520         ld      l,c
      00A330 ED 5B 95 AA      [20]  521         ld      de,(MAN_HEAD)
      00A334 A7               [ 4]  522         and     a
      00A335 ED 52            [15]  523         sbc     hl,de
      00A337 28 0E            [12]  524         jr      z,correct_left_border
      00A339                        525 left_border_next_adr:
      00A339 C1               [10]  526         pop     bc
      00A33A 11 78 00         [10]  527         ld      de,#3*SCREEN_WIDTH
      00A33D 60               [ 4]  528         ld      h,b
      00A33E 69               [ 4]  529         ld      l,c
      00A33F 19               [11]  530         add     hl,de
      00A340 44               [ 4]  531         ld      b,h
      00A341 4D               [ 4]  532         ld      c,l
      00A342 3D               [ 4]  533         dec     a
      00A343 20 E8            [12]  534         jr      nz,loop_left_border_check
      00A345 F1               [10]  535         pop     af
      00A346 C9               [10]  536         ret
      00A347                        537 correct_left_border:
      00A347 2A 95 AA         [16]  538         ld      hl,(MAN_HEAD)
      00A34A 11 28 00         [10]  539         ld      de,#SCREEN_WIDTH
      00A34D 36 EF            [10]  540         ld      (hl),#CHR_WALL
      00A34F 19               [11]  541         add     hl,de
      00A350 36 FC            [10]  542         ld      (hl),#CHR_MAN_HEAD
      00A352 22 95 AA         [16]  543         ld      (MAN_HEAD),hl
      00A355 19               [11]  544         add     hl,de
      00A356 36 E7            [10]  545         ld      (hl),#CHR_MAN_WALK
      00A358 C3 39 A3         [10]  546         jp      left_border_next_adr
      00A35B                        547 action_right:
      00A35B F5               [11]  548         push    af
      00A35C 2A 95 AA         [16]  549         ld      hl,(MAN_HEAD)
      00A35F 7E               [ 7]  550         ld      a,(hl)
      00A360 36 20            [10]  551         ld      (hl),#' '
      00A362 23               [ 6]  552         inc     hl
      00A363 22 95 AA         [16]  553         ld      (MAN_HEAD),hl
      00A366 77               [ 7]  554         ld      (hl),a
      00A367 11 28 00         [10]  555         ld      de,#SCREEN_WIDTH
      00A36A 19               [11]  556         add     hl,de
      00A36B 2B               [ 6]  557         dec     hl
      00A36C 7E               [ 7]  558         ld      a,(hl)
      00A36D 36 20            [10]  559         ld      (hl),#' '
      00A36F FE E7            [ 7]  560         cp      #CHR_MAN_WALK
      00A371 28 04            [12]  561         jr      z,transition_stay
      00A373 FE E5            [ 7]  562         cp      #CHR_MAN_STAY
      00A375 28 04            [12]  563         jr      z,transition_walk
      00A377                        564 transition_stay:
      00A377 C6 FE            [ 7]  565         add     a,#TRANSITION_MAN_WALK_STAY
      00A379 18 02            [12]  566         jr      update_right
      00A37B                        567 transition_walk:
      00A37B D6 FE            [ 7]  568         sub     #TRANSITION_MAN_WALK_STAY
      00A37D                        569 update_right:
      00A37D 23               [ 6]  570         inc     hl
      00A37E 77               [ 7]  571         ld      (hl),a
      00A37F 3E 07            [ 7]  572         ld      a,#GAMES_LINES+1
      00A381 01 78 F0         [10]  573         ld      bc,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH+0
      00A384                        574 loop_right_border_check:
      00A384 C5               [11]  575         push    bc
      00A385 60               [ 4]  576         ld      h,b
      00A386 69               [ 4]  577         ld      l,c
      00A387 ED 5B 95 AA      [20]  578         ld      de,(MAN_HEAD)
      00A38B A7               [ 4]  579         and     a
      00A38C ED 52            [15]  580         sbc     hl,de
      00A38E 28 0E            [12]  581         jr      z,correct_right_border
      00A390                        582 right_border_next_adr:
      00A390 C1               [10]  583         pop     bc
      00A391 11 78 00         [10]  584         ld      de,#3*SCREEN_WIDTH
      00A394 60               [ 4]  585         ld      h,b
      00A395 69               [ 4]  586         ld      l,c
      00A396 19               [11]  587         add     hl,de
      00A397 44               [ 4]  588         ld      b,h
      00A398 4D               [ 4]  589         ld      c,l
      00A399 3D               [ 4]  590         dec     a
      00A39A 20 E8            [12]  591         jr      nz,loop_right_border_check
      00A39C F1               [10]  592         pop     af
      00A39D C9               [10]  593         ret
      00A39E                        594 correct_right_border:
      00A39E 2A 95 AA         [16]  595         ld      hl,(MAN_HEAD)
      00A3A1 4E               [ 7]  596         ld      c,(hl)
      00A3A2 36 E7            [10]  597         ld      (hl),#CHR_MAN_WALK
      00A3A4 11 28 00         [10]  598         ld      de,#SCREEN_WIDTH
      00A3A7 A7               [ 4]  599         and     a
      00A3A8 ED 52            [15]  600         sbc     hl,de
      00A3AA 71               [ 7]  601         ld      (hl),c
      00A3AB 22 95 AA         [16]  602         ld      (MAN_HEAD),hl
      00A3AE 19               [11]  603         add     hl,de
      00A3AF 19               [11]  604         add     hl,de
      00A3B0 36 0C            [10]  605         ld      (hl),#CHR_MOVING_LINE
      00A3B2 18 DC            [12]  606         jr      right_border_next_adr
      00A3B4                        607 action_jump:
      00A3B4 2A 95 AA         [16]  608         ld      hl,(MAN_HEAD)
      00A3B7 11 28 00         [10]  609         ld      de,#SCREEN_WIDTH
      00A3BA A7               [ 4]  610         and     a
      00A3BB ED 52            [15]  611         sbc     hl,de
      00A3BD 7E               [ 7]  612         ld      a,(hl)
      00A3BE FE 20            [ 7]  613         cp      #' '
      00A3C0 28 0B            [12]  614         jr      z,jump_ok
      00A3C2 FE 0C            [ 7]  615         cp      #CHR_MOVING_LINE
      00A3C4 28 2B            [12]  616         jr      z,jump_fail
      00A3C6 FE EF            [ 7]  617         cp      #CHR_WALL
      00A3C8 28 27            [12]  618         jr      z,jump_fail
      00A3CA C3 67 A1         [10]  619         jp      handle_fail_delay
      00A3CD                        620 jump_ok:
      00A3CD D9               [ 4]  621         exx
      00A3CE CD CF A4         [17]  622         call    add_10_points
      00A3D1 D9               [ 4]  623         exx
      00A3D2 19               [11]  624         add     hl,de
      00A3D3 36 20            [10]  625         ld      (hl),#' '
      00A3D5 19               [11]  626         add     hl,de
      00A3D6 36 20            [10]  627         ld      (hl),#' '
      00A3D8 1E 78            [ 7]  628         ld      e,#3*SCREEN_WIDTH
      00A3DA A7               [ 4]  629         and     a
      00A3DB ED 52            [15]  630         sbc     hl,de
      00A3DD 36 E7            [10]  631         ld      (hl),#CHR_MAN_WALK
      00A3DF 1E 28            [ 7]  632         ld      e,#SCREEN_WIDTH
      00A3E1 A7               [ 4]  633         and     a
      00A3E2 ED 52            [15]  634         sbc     hl,de
      00A3E4 36 FC            [10]  635         ld      (hl),#CHR_MAN_HEAD
      00A3E6 22 95 AA         [16]  636         ld      (MAN_HEAD),hl
      00A3E9 3E 04            [ 7]  637         ld      a,#DELAY_COUNTER_JUMP
      00A3EB 32 97 AA         [13]  638         ld      (JUMP_DELAY),a
      00A3EE C3 67 A1         [10]  639         jp      handle_fail_delay
      00A3F1                        640 jump_fail:
      00A3F1 19               [11]  641         add     hl,de
      00A3F2 2B               [ 6]  642         dec     hl
      00A3F3 3E D0            [ 7]  643         ld      a,#CHR_SMOKE
      00A3F5 77               [ 7]  644         ld      (hl),a
      00A3F6 23               [ 6]  645         inc     hl
      00A3F7 23               [ 6]  646         inc     hl
      00A3F8 23               [ 6]  647         inc     hl
      00A3F9 77               [ 7]  648         ld      (hl),a
      00A3FA 2B               [ 6]  649         dec     hl
      00A3FB 2B               [ 6]  650         dec     hl
      00A3FC 36 20            [10]  651         ld      (hl),#' '
      00A3FE 19               [11]  652         add     hl,de
      00A3FF 36 EA            [10]  653         ld      (hl),#CHR_MAN_SLEEP
      00A401 23               [ 6]  654         inc     hl
      00A402 36 ED            [10]  655         ld      (hl),#CHR_MAN_SLEEP_HEAD
      00A404 3E 0B            [ 7]  656         ld      a,#DELAY_COUNTER
      00A406 32 98 AA         [13]  657         ld      (FAIL_DELAY),a
      00A409 3A 94 AA         [13]  658         ld      a,(cnt_fail_jump)
      00A40C FE 05            [ 7]  659         cp      #MAX_FAIL_COUNTER
      00A40E CA 67 A1         [10]  660         jp      z,handle_fail_delay
      00A411 3C               [ 4]  661         inc     a
      00A412 32 94 AA         [13]  662         ld      (cnt_fail_jump),a
      00A415 C3 67 A1         [10]  663         jp      handle_fail_delay
      00A418                        664 check_fall_through:
      00A418 3A 97 AA         [13]  665         ld      a,(JUMP_DELAY)
      00A41B FE 01            [ 7]  666         cp      #INITIAL_DELAY_COUNTER
      00A41D C0               [11]  667         ret     nz
      00A41E                        668 check_for_trap:
      00A41E 2A 95 AA         [16]  669         ld      hl,(MAN_HEAD)
      00A421 11 28 00         [10]  670         ld      de,#SCREEN_WIDTH
      00A424 19               [11]  671         add     hl,de
      00A425 19               [11]  672         add     hl,de
      00A426 7E               [ 7]  673         ld      a,(hl)
      00A427 FE 20            [ 7]  674         cp      #' '
      00A429 C0               [11]  675         ret     nz
      00A42A 3A 98 AA         [13]  676         ld      a,(FAIL_DELAY)
      00A42D FE 01            [ 7]  677         cp      #INITIAL_DELAY_COUNTER
      00A42F 28 15            [12]  678         jr      z,erase_player_fell_down
      00A431 2A 95 AA         [16]  679         ld      hl,(MAN_HEAD)
      00A434 3E 20            [ 7]  680         ld      a,#' '
      00A436 2B               [ 6]  681         dec     hl
      00A437 77               [ 7]  682         ld      (hl),a
      00A438 23               [ 6]  683         inc     hl
      00A439 23               [ 6]  684         inc     hl
      00A43A 23               [ 6]  685         inc     hl
      00A43B 77               [ 7]  686         ld      (hl),a
      00A43C 2B               [ 6]  687         dec     hl
      00A43D 19               [11]  688         add     hl,de
      00A43E 77               [ 7]  689         ld      (hl),a
      00A43F 23               [ 6]  690         inc     hl
      00A440 77               [ 7]  691         ld      (hl),a
      00A441 2B               [ 6]  692         dec     hl
      00A442 2B               [ 6]  693         dec     hl
      00A443 77               [ 7]  694         ld      (hl),a
      00A444 18 08            [12]  695         jr      player_fell_down
      00A446                        696 erase_player_fell_down:
      00A446 2A 95 AA         [16]  697         ld      hl,(MAN_HEAD)
      00A449 3E 20            [ 7]  698         ld      a,#' '
      00A44B 77               [ 7]  699         ld      (hl),a
      00A44C 19               [11]  700         add     hl,de
      00A44D 77               [ 7]  701         ld      (hl),a
      00A44E                        702 player_fell_down:
      00A44E 19               [11]  703         add     hl,de
      00A44F 19               [11]  704         add     hl,de
      00A450 22 95 AA         [16]  705         ld      (MAN_HEAD),hl
      00A453 19               [11]  706         add     hl,de
      00A454 36 EA            [10]  707         ld      (hl),#CHR_MAN_SLEEP
      00A456 23               [ 6]  708         inc     hl
      00A457 36 ED            [10]  709         ld      (hl),#CHR_MAN_SLEEP_HEAD
      00A459 3E 08            [ 7]  710         ld      a,#DELAY_COUNTER2
      00A45B 32 98 AA         [13]  711         ld      (FAIL_DELAY),a
      00A45E 3A 93 AA         [13]  712         ld      a,(cnt_fail_trap)
      00A461 FE 05            [ 7]  713         cp      #MAX_FAIL_COUNTER
      00A463 C8               [11]  714         ret     z
      00A464 3C               [ 4]  715         inc     a
      00A465 32 93 AA         [13]  716         ld      (cnt_fail_trap),a
      00A468 C9               [10]  717         ret
      00A469                        718 check_level_finished:
      00A469 2A 95 AA         [16]  719         ld      hl,(MAN_HEAD)
      00A46C 11 6F F0         [10]  720         ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+(SCREEN_WIDTH-9)
      00A46F A7               [ 4]  721         and     a
      00A470 ED 52            [15]  722         sbc     hl,de
      00A472 20 39            [12]  723         jr      nz,round_end
      00A474 3A 9C AA         [13]  724         ld      a,(LEVEL)
      00A477 FE 08            [ 7]  725         cp      #MAX_LEVEL
      00A479 28 01            [12]  726         jr      z,new_level_set
      00A47B 3C               [ 4]  727         inc     a
      00A47C                        728 new_level_set:
      00A47C 32 9C AA         [13]  729         ld      (LEVEL),a
      00A47F 21 33 F3         [10]  730         ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+(15+ALIGN_MIDDLE)
      00A482 22 95 AA         [16]  731         ld      (MAN_HEAD),hl
      00A485 3E 28            [ 7]  732         ld      a,#SCREEN_WIDTH
      00A487 36 FC            [10]  733         ld      (hl),#CHR_MAN_HEAD
      00A489 85               [ 4]  734         add     a,l
      00A48A 6F               [ 4]  735         ld      l,a
      00A48B 36 E5            [10]  736         ld      (hl),#CHR_MAN_STAY
      00A48D 21 93 AA         [10]  737         ld      hl,#cnt_fail_trap
      00A490 3E 02            [ 7]  738         ld      a,#INITIAL_FAIL_COUNTER
      00A492 77               [ 7]  739         ld      (hl),a
      00A493 21 94 AA         [10]  740         ld      hl,#cnt_fail_jump
      00A496 77               [ 7]  741         ld      (hl),a
      00A497 21 6D F0         [10]  742         ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+(SCREEN_WIDTH-11)
      00A49A 36 8F            [10]  743         ld      (hl),#CHR_LINE_TOP
      00A49C 23               [ 6]  744         inc     hl
      00A49D 36 F6            [10]  745         ld      (hl),#CHR_ARROW_RIGHT_TOP
      00A49F 23               [ 6]  746         inc     hl
      00A4A0 36 20            [10]  747         ld      (hl),#' '
      00A4A2 21 95 F0         [10]  748         ld      hl,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH++(SCREEN_WIDTH-11)
      00A4A5 36 03            [10]  749         ld      (hl),#CHR_LINE_BOTTOM
      00A4A7 23               [ 6]  750         inc     hl
      00A4A8 36 F4            [10]  751         ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
      00A4AA 23               [ 6]  752         inc     hl
      00A4AB 36 20            [10]  753         ld      (hl),#' '
      00A4AD                        754 round_end:
      00A4AD 13               [ 6]  755         inc     de
      00A4AE 13               [ 6]  756         inc     de
      00A4AF 2A 95 AA         [16]  757         ld      hl,(MAN_HEAD)
      00A4B2 A7               [ 4]  758         and     a
      00A4B3 ED 52            [15]  759         sbc     hl,de
      00A4B5 3E 0B            [ 7]  760         ld      a,#DELAY_COUNTER
      00A4B7 C0               [11]  761         ret     nz
      00A4B8 32 98 AA         [13]  762         ld      (FAIL_DELAY),a
      00A4BB 13               [ 6]  763         inc     de
      00A4BC ED 53 95 AA      [20]  764         ld      (MAN_HEAD),de
      00A4C0 3E 20            [ 7]  765         ld      a,#' '
      00A4C2 1B               [ 6]  766         dec     de
      00A4C3 12               [ 7]  767         ld      (de),a
      00A4C4 83               [ 4]  768         add     a,e
      00A4C5 5F               [ 4]  769         ld      e,a
      00A4C6 12               [ 7]  770         ld      (de),a
      00A4C7 6F               [ 4]  771         ld      l,a
      00A4C8 19               [11]  772         add     hl,de
      00A4C9 36 EA            [10]  773         ld      (hl),#CHR_MAN_SLEEP
      00A4CB 23               [ 6]  774         inc     hl
      00A4CC 36 ED            [10]  775         ld      (hl),#CHR_MAN_SLEEP_HEAD
      00A4CE C9               [10]  776         ret
      00A4CF                        777 add_10_points:
      0004C0                        778         SET_CURSOR_DE 0 23+POSDIFF_POINTS
      00A4CF 11 1F F0         [10]    1         ld      de,#BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS
      00A4D2 ED 53 00 80      [20]    2         ld      (CURSOR),de
      00A4D6 2A 9A AA         [16]  779         ld      hl,(POINTS)
      00A4D9 11 0A 00         [10]  780         ld      de,#10
      00A4DC 19               [11]  781         add     hl,de
      00A4DD 22 9A AA         [16]  782         ld      (POINTS),hl
      00A4E0 CD E9 A4         [17]  783         call    print_decimal
      00A4E3 3E 20            [ 7]  784         ld      a,#' '
      00A4E5 32 24 F0         [13]  785         ld      (BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS+5),a
      00A4E8 C9               [10]  786         ret
      00A4E9                        787 print_decimal:
      00A4E9 E5               [11]  788         push    hl
      00A4EA 01 10 27         [10]  789         ld      bc,#10000
      00A4ED CD 0D A5         [17]  790         call    get_decimal_digit
      00A4F0 01 E8 03         [10]  791         ld      bc,#1000
      00A4F3 CD 0D A5         [17]  792         call    get_decimal_digit
      00A4F6 01 64 00         [10]  793         ld      bc,#100
      00A4F9 CD 0D A5         [17]  794         call    get_decimal_digit
      00A4FC 01 0A 00         [10]  795         ld      bc,#10
      00A4FF CD 0D A5         [17]  796         call    get_decimal_digit
      00A502 01 01 00         [10]  797         ld      bc,#1
      00A505 CD 0D A5         [17]  798         call    get_decimal_digit
      0004F9                        799         REMOVE_CURSOR;
                                      1         ;actually restores HL
      00A508 2A 00 80         [16]    2         ld      hl,(CURSOR)
      00A50B E1               [10]  800         pop     hl
      00A50C C9               [10]  801         ret
      00A50D                        802 get_decimal_digit:
      00A50D AF               [ 4]  803         xor     a
      00A50E                        804 decimal_loop:
      00A50E A7               [ 4]  805         and     a
      00A50F ED 42            [15]  806         sbc     hl,bc
      00A511 3C               [ 4]  807         inc     a
      00A512 D2 0E A5         [10]  808         jp      nc,decimal_loop
      00A515 3D               [ 4]  809         dec     a
      00A516 09               [11]  810         add     hl,bc
      00A517 C6 30            [ 7]  811         add     a,#'0'
      00050A                        812         OUTCH
      00A519 CD FB AC         [17]    1         call    putcharA
      00A51C C9               [10]  813         ret
      00A51D                        814 no_lives:
      00050E                        815         PRST7
      00A51D CD C1 AC         [17]    1         call    prst7
      00A520 0C A0                  816         .db     0x0c,0xa0
      00A522 21 3E AB         [10]  817         ld      hl,#TXT_GAME_OVER
      00A525 11 0D F0         [10]  818         ld      de,#POS_GAME_OVER
      00A528 01 0F 00         [10]  819         ld      bc,#TXT_GAME_OVER_size
      00A52B ED B0            [21]  820         ldir
      00A52D 0E 40            [ 7]  821         ld      c,#3*SCREEN_WIDTH-TXT_GAME_OVER_size-1+POSDIFF_YOUR_SCORE
      00A52F 7B               [ 4]  822         ld      a,e
      00A530 81               [ 4]  823         add     a,c
      00A531 5F               [ 4]  824         ld      e,a
      00A532 0E 0C            [ 7]  825         ld      c,#TXT_YOUR_SCORE_size
      00A534 ED B0            [21]  826         ldir
      00A536 0E 47            [ 7]  827         ld      c,#2*SCREEN_WIDTH-TXT_YOUR_SCORE_size+3
      00A538 7B               [ 4]  828         ld      a,e
      00A539 81               [ 4]  829         add     a,c
      00A53A 5F               [ 4]  830         ld      e,a
      00A53B 0E 09            [ 7]  831         ld      c,#TXT_HAZARD_size
      00A53D ED B0            [21]  832         ldir
      00A53F 21 E0 F1         [10]  833         ld      hl,#BWS+15*SCREEN_WIDTH+0+(3*POSDIFF_YOUR_SCORE)
      00A542 36 E4            [10]  834         ld      (hl),#CHR_MIDDLE_LINE
      00A544 11 E1 F1         [10]  835         ld      de,#BWS+15*SCREEN_WIDTH+1+(3*POSDIFF_YOUR_SCORE)
      00A547 0E 27            [ 7]  836         ld      c,#SCREEN_WIDTH-1
      00A549 ED B0            [21]  837         ldir
      00A54B 2A 9A AA         [16]  838         ld      hl,(POINTS)
      00053F                        839         SET_CURSOR_DE (5-POSDIFF_YOUR_SCORE_DY) (21+ALIGN_MIDDLE)
      00A54E 11 69 F0         [10]    1         ld      de,#BWS+(5-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+(21+ALIGN_MIDDLE)
      00A551 ED 53 00 80      [20]    2         ld      (CURSOR),de
      00A555 CD E9 A4         [17]  840         call    print_decimal
      00A558 3A 9C AA         [13]  841         ld      a,(LEVEL)
      00A55B C6 2F            [ 7]  842         add     a,#'0'-1
      00A55D 32 BB F0         [13]  843         ld      (BWS+7*SCREEN_WIDTH+23+ALIGN_MIDDLE+3*POSDIFF_YOUR_SCORE),a
      00A560 ED 5B 20 AB      [20]  844         ld      de,(HIGH_SCORE_TABLE01.points)
      00A564 A7               [ 4]  845         and     a
      00A565 ED 52            [15]  846         sbc     hl,de
      00A567 D4 9C A6         [17]  847         call    nc,draw_new_highscore_box
      00055B                        848         SET_CURSOR_HL (17-POSDIFF_YOUR_SCORE_DY) (3+ALIGN_MIDDLE)
      00A56A 21 37 F2         [10]    1         ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+(3+ALIGN_MIDDLE)
      00A56D 22 00 80         [16]    2         ld      (CURSOR),hl
      000561                        849         PRST7
      00A570 CD C1 AC         [17]    1         call    prst7
      00A573 20 49 4E 50 55 54 20   850         .ascis ' INPUT YOUR INITIALS: __ '
             59 4F 55 52 20 49 4E
             49 54 49 41 4C 53 3A
             20 5F 5F A0
                                    851         ; remove 2xcursor
      00A58C                        852 input:
      00A58C 21 C4 F2         [10]  853         ld      hl,#BWS+17*SCREEN_WIDTH+28
      00A58F 36 20            [10]  854         ld      (hl),#' '
      00A591 21 01 F0         [10]  855         ld      hl,#BWS+0*SCREEN_WIDTH+1
      00A594 36 20            [10]  856         ld      (hl),#' '
      00A596 21 4D F2         [10]  857         ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+25+ALIGN_MIDDLE
      00058A                        858         CURSOR_DISABLE
      00058A                        859         INCH
      00A599 CD E8 AC         [17]    1         call    inch
      00A59C 77               [ 7]  860         ld      (hl),a
      00A59D 32 3C AB         [13]  861         ld      (INITIALS),a
      00A5A0 23               [ 6]  862         inc     hl
      000592                        863         INCH
      00A5A1 CD E8 AC         [17]    1         call    inch
      00A5A4 77               [ 7]  864         ld      (hl),a
      00A5A5 32 3D AB         [13]  865         ld      (INITIALS+1),a
      00A5A8 ED 5B 9A AA      [20]  866         ld      de,(POINTS)
      00A5AC 06 05            [ 7]  867         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      00A5AE 2A 20 AB         [16]  868         ld      hl,(HIGH_SCORE_TABLE01.points)
      00A5B1 A7               [ 4]  869         and     a
      00A5B2 ED 52            [15]  870         sbc     hl,de
      00A5B4 DA 6B A6         [10]  871         jp      c,insert_score
      00A5B7 05               [ 4]  872         dec     b
      00A5B8 2A 25 AB         [16]  873         ld      hl,(HIGH_SCORE_TABLE02.points)
      00A5BB A7               [ 4]  874         and     a
      00A5BC ED 52            [15]  875         sbc     hl,de
      00A5BE DA 6B A6         [10]  876         jp      c,insert_score
      00A5C1 05               [ 4]  877         dec     b
      00A5C2 2A 2A AB         [16]  878         ld      hl,(HIGH_SCORE_TABLE03.points)
      00A5C5 A7               [ 4]  879         and     a
      00A5C6 ED 52            [15]  880         sbc     hl,de
      00A5C8 DA 6B A6         [10]  881         jp      c,insert_score
      00A5CB 05               [ 4]  882         dec     b
      00A5CC 2A 2F AB         [16]  883         ld      hl,(HIGH_SCORE_TABLE04.points)
      00A5CF A7               [ 4]  884         and     a
      00A5D0 ED 52            [15]  885         sbc     hl,de
      00A5D2 DA 6B A6         [10]  886         jp      c,insert_score
      00A5D5 05               [ 4]  887         dec     b
      00A5D6 2A 34 AB         [16]  888         ld      hl,(HIGH_SCORE_TABLE05.points)
      00A5D9 A7               [ 4]  889         and     a
      00A5DA ED 52            [15]  890         sbc     hl,de
      00A5DC DA 6B A6         [10]  891         jp      c,insert_score
      00A5DF                        892 print_highscore_table:
      00A5DF 06 05            [ 7]  893         ld      b,#NUMBER_HIGHSCORE_ENTRIES
      00A5E1 11 1E AB         [10]  894         ld      de,#HIGH_SCORE_TABLE01
      00A5E4 21 8A F2         [10]  895         ld      hl,#BWS+(20-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+6+ALIGN_MIDDLE
      00A5E7                        896 print_highscore_entry:
      00A5E7 3E 36            [ 7]  897         ld      a,#'6'
      00A5E9 90               [ 4]  898         sub     b
      00A5EA 77               [ 7]  899         ld      (hl),a
      00A5EB 1A               [ 7]  900         ld      a,(de)
      00A5EC 23               [ 6]  901         inc     hl
      00A5ED 23               [ 6]  902         inc     hl
      00A5EE 23               [ 6]  903         inc     hl
      00A5EF 77               [ 7]  904         ld      (hl),a
      00A5F0 23               [ 6]  905         inc     hl
      00A5F1 13               [ 6]  906         inc     de
      00A5F2 1A               [ 7]  907         ld      a,(de)
      00A5F3 77               [ 7]  908         ld      (hl),a
      00A5F4 3E 2E            [ 7]  909         ld      a,#'.'
      00A5F6 23               [ 6]  910         inc     hl
      00A5F7 23               [ 6]  911         inc     hl
      00A5F8 77               [ 7]  912         ld      (hl),a
      00A5F9 23               [ 6]  913         inc     hl
      00A5FA 77               [ 7]  914         ld      (hl),a
      00A5FB 23               [ 6]  915         inc     hl
      00A5FC 77               [ 7]  916         ld      (hl),a
      00A5FD 23               [ 6]  917         inc     hl
      00A5FE 23               [ 6]  918         inc     hl
      0005F0                        919         SET_CURSOR
      00A5FF 22 00 80         [16]    1         ld      (CURSOR),hl
      00A602 13               [ 6]  920         inc     de
      00A603 1A               [ 7]  921         ld      a,(de)
      00A604 6F               [ 4]  922         ld      l,a
      00A605 13               [ 6]  923         inc     de
      00A606 1A               [ 7]  924         ld      a,(de)
      00A607 67               [ 4]  925         ld      h,a
      00A608 13               [ 6]  926         inc     de
      00A609 C5               [11]  927         push    bc
      00A60A D5               [11]  928         push    de
      00A60B CD E9 A4         [17]  929         call    print_decimal
      00A60E D1               [10]  930         pop     de
      00A60F C1               [10]  931         pop     bc
      000601                        932         REMOVE_CURSOR
                                      1         ;actually restores HL
      00A610 2A 00 80         [16]    2         ld      hl,(CURSOR)
      00A613 23               [ 6]  933         inc     hl
      00A614 23               [ 6]  934         inc     hl
      00A615 23               [ 6]  935         inc     hl
      00A616 36 30            [10]  936         ld      (hl),#'0'
      00A618 23               [ 6]  937         inc     hl
      00A619 1A               [ 7]  938         ld      a,(de)
      00A61A C6 2F            [ 7]  939         add     a,#'0'-1
      00A61C 77               [ 7]  940         ld      (hl),a
      00A61D 13               [ 6]  941         inc     de
      00A61E 3E 15            [ 7]  942         ld      a,#SCREEN_WIDTH-19
      00A620 85               [ 4]  943         add     a,l
      00A621 6F               [ 4]  944         ld      l,a
      00A622 3E 00            [ 7]  945         ld      a,#ZERO
      00A624 8C               [ 4]  946         adc     a,h
      00A625 67               [ 4]  947         ld      h,a
      00A626 10 BF            [13]  948         djnz    print_highscore_entry
      000619                        949         SET_CURSOR_HL (29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY) (9+ALIGN_MIDDLE)
      00A628 21 7D F3         [10]    1         ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+(9+ALIGN_MIDDLE)
      00A62B 22 00 80         [16]    2         ld      (CURSOR),hl
      00061F                        950         PRST7
      00A62E CD C1 AC         [17]    1         call    prst7
      00A631 4E 45 57 20 47 41 4D   951         .ascii  'NEW GAME ? Y/N'
             45 20 3F 20 59 2F 4E
      00A63F A0                     952         .db     0xa0
      00A640 21 8C F3         [10]  953         ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      00A643 36 20            [10]  954         ld      (hl),#' '
      00A645                        955         CURSOR_DISABLE
      00A645                        956 m_070a:
      000636                        957 ask_exit_game:
      000636                        958         INCH
      00A645 CD E8 AC         [17]    1         call    inch
      00A648 FE 59            [ 7]  959         cp      #'Y'
      00A64A CA A9 A0         [10]  960         jp      z,new_game
                           000001   961 .if     eq,z9001
      00A64D FE 5A            [ 7]  962         cp      #'Z'
      00A64F CA A9 A0         [10]  963         jp      z,new_game
                                    964 .endif
      00A652 FE 4E            [ 7]  965         cp      #'N'
      00A654 20 EF            [12]  966         jr      nz,ask_exit_game
      00A656                        967 exit_game:
      000647                        968         PRST7
      00A656 CD C1 AC         [17]    1         call    prst7
      00A659 0C                     969         .db     0x0c
      00A65A 4A 75 6D 70 69 6E 67   970         .ascii  'Jumping Jack'
             20 4A 61 63 6B
      00A666 0D 8D                  971         .db     0x0d,0x8d
      000659                        972         END_PROGRAM
      00A668 C3 A6 AC         [10]    1         jp      exit
      00A66B                        973 insert_score:
      00A66B D5               [11]  974         push    de
      00A66C 11 37 AB         [10]  975         ld      de,#HIGH_SCORE_TABLE_TMP
      00A66F 21 32 AB         [10]  976         ld      hl,#HIGH_SCORE_TABLE05
      00A672                        977 move_table_entry:
      00A672 C5               [11]  978         push    bc
      00A673 01 05 00         [10]  979         ld      bc,#HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05
      00A676 ED B0            [21]  980         ldir
      00A678 EB               [ 4]  981         ex      de,hl
      00A679 0E 0A            [ 7]  982         ld      c,#2*(HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05)
      00A67B A7               [ 4]  983         and     a
      00A67C ED 42            [15]  984         sbc     hl,bc
      00A67E EB               [ 4]  985         ex      de,hl
      00A67F A7               [ 4]  986         and     a
      00A680 ED 42            [15]  987         sbc     hl,bc
      00A682 C1               [10]  988         pop     bc
      00A683 10 ED            [13]  989         djnz    move_table_entry
      00A685 3A 3C AB         [13]  990         ld      a,(INITIALS)
      00A688 12               [ 7]  991         ld      (de),a
      00A689 13               [ 6]  992         inc     de
      00A68A 3A 3D AB         [13]  993         ld      a,(INITIALS+1)
      00A68D 12               [ 7]  994         ld      (de),a
      00A68E EB               [ 4]  995         ex      de,hl
      00A68F D1               [10]  996         pop     de
      00A690 23               [ 6]  997         inc     hl
      00A691 73               [ 7]  998         ld      (hl),e
      00A692 23               [ 6]  999         inc     hl
      00A693 72               [ 7] 1000         ld      (hl),d
      00A694 23               [ 6] 1001         inc     hl
      00A695 3A 9C AA         [13] 1002         ld      a,(LEVEL)
      00A698 77               [ 7] 1003         ld      (hl),a
      00A699 C3 DF A5         [10] 1004         jp      print_highscore_table
      00A69C                       1005 draw_new_highscore_box:
      00A69C 21 FB F0         [10] 1006         ld      hl,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      00A69F 36 2A            [10] 1007         ld      (hl),#'*'
      00A6A1 11 FC F0         [10] 1008         ld      de,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+8+ALIGN_MIDDLE
      00A6A4 01 11 00         [10] 1009         ld      bc,#TXT_NEW_HIGH_SCORE_size-1
      00A6A7 ED B0            [21] 1010         ldir
      00A6A9 0E 8F            [ 7] 1011         ld      c,#4*SCREEN_WIDTH-TXT_NEW_HIGH_SCORE_size+1
      00A6AB 09               [11] 1012         add     hl,bc
      00A6AC EB               [ 4] 1013         ex      de,hl
      00A6AD 09               [11] 1014         add     hl,bc
      00A6AE EB               [ 4] 1015         ex      de,hl
      00A6AF 0E 11            [ 7] 1016         ld      c,#TXT_NEW_HIGH_SCORE_size-1
      00A6B1 36 2A            [10] 1017         ld      (hl),#'*'
      00A6B3 ED B0            [21] 1018         ldir
      00A6B5 11 4B F1         [10] 1019         ld      de,#BWS+(11-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      00A6B8 21 62 AB         [10] 1020         ld      hl,#TXT_NEW_HIGH_SCORE
      00A6BB 0E 12            [ 7] 1021         ld      c,#TXT_NEW_HIGH_SCORE_size
      00A6BD ED B0            [21] 1022         ldir
      00A6BF 1E 23            [ 7] 1023         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      00A6C1 3E 2A            [ 7] 1024         ld      a,#'*'
      00A6C3 12               [ 7] 1025         ld      (de),a
      00A6C4 1E 34            [ 7] 1026         ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      00A6C6 12               [ 7] 1027         ld      (de),a
      00A6C7 1E 73            [ 7] 1028         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
      00A6C9 12               [ 7] 1029         ld      (de),a
      00A6CA 1E 84            [ 7] 1030         ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
      00A6CC 12               [ 7] 1031         ld      (de),a
      00A6CD C9               [10] 1032         ret
      00A6CE                       1033 TOP_IMAGE:
      0006BF                       1034         TOP_IMAGE_CONTENT
                                      1         ; line 1
      0006BF                          2         SCREEN_POS
      00A6CE 20 20 20 20              1         .ascii '    '
      00A6D2 E0 E4 E4 E4 E4 E4 E4     3         .db     0xe0,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe1
             E4 E4 E4 E1
      00A6DD 20 20 20 20 20           4         .db     0x20,0x20,0x20,0x20,0x20
      00A6E2 20 20 20 20 20 20 20     5         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20
      00A6EA 20 20 20 20 20 20 20     6         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20
      0006E3                          7         SCREEN_POS
      00A6F2 20 20 20 20              1         .ascii '    '
                                      8         
                                      9         ; line 2
      0006E7                         10         SCREEN_POS
      00A6F6 20 20 20 20              1         .ascii '    '
      00A6FA E5 16 03 04 97 03 09    11         .db     0xe5,0x16,0x03,0x04,0x97,0x03,0x09,0x20,0x94,0x01,0xe5
             20 94 01 E5
      00A705 20 20 20 20 20          12         .db     0x20,0x20,0x20,0x20,0x20
      00A70A 20 20 20 20 20 20 20    13         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95
             95
      00A712 20 20 20 20 20 20 20    14         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20
      00070B                         15         SCREEN_POS
      00A71A 20 20 20 20              1         .ascii '    '
                                     16 
                                     17         ; line 3
      00070F                         18         SCREEN_POS
      00A71E 20 20 20 20              1         .ascii '    '
      00A722 E5 9A 8F 20 95 20 20    19         .db     0xe5,0x9a,0x8f,0x20,0x95,0x20,0x20,0x20,0x95,0x20,0xe5
             20 95 20 E5
      00A72D 20 20 20 20 20          20         .db     0x20,0x20,0x20,0x20,0x20
      00A732 20 20 20 20 20 20 20    21         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95
             95
      00A73A 20 20 20 20 8F 8F 20    22         .db     0x20,0x20,0x20,0x20,0x8f,0x8f,0x20,0x20
             20
      000733                         23         SCREEN_POS
      00A742 20 20 20 20              1         .ascii '    '
                                     24 
                                     25         ; line 4
      000737                         26         SCREEN_POS
      00A746 20 20 20 20              1         .ascii '    '
      00A74A E5 10 20 15 95 20 9F    27         .db     0xe5,0x10,0x20,0x15,0x95,0x20,0x9f,0x20,0x95,0x20,0xe5
             20 95 20 E5
      00A755 20 20 20 20 20          28         .db     0x20,0x20,0x20,0x20,0x20
      00A75A 20 20 20 20 20 20 20    29         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20
      00A762 03 8F 20 16 9F 9F 96    30         .db     0x03,0x8f,0x20,0x16,0x9f,0x9f,0x96,0x20
             20
      00075B                         31         SCREEN_POS
      00A76A 20 20 20 20              1         .ascii '    '
                                     32 
                                     33         ; line 5
      00075F                         34          SCREEN_POS
      00A76E 20 20 20 20              1         .ascii '    '
      00A772 E5 02 03 20 20 03 01    35         .db     0xe5,0x02,0x03,0x20,0x20,0x03,0x01,0x20,0x03,0x01,0xe5
             20 03 01 E5
      00A77D 20 20 20 20 20          36         .db     0x20,0x20,0x20,0x20,0x20
      00A782 20 20 9F 10 20 20 20    37         .db     0x20,0x20,0x9f,0x10,0x20,0x20,0x20,0x20
             20
      00A78A 20 85 0C 15 15 0C 95    38         .db     0x20,0x85,0x0c,0x15,0x15,0x0c,0x95,0x20
             20
      000783                         39         SCREEN_POS
      00A792 20 20 20 20              1         .ascii '    '
                                     40 
                                     41         ; line 6
      000787                         42         SCREEN_POS
      00A796 20 20 20 20              1         .ascii '    '
      00A79A E5 70 72 65 73 65 6E    43         .db     0xe5,0x70,0x72,0x65,0x73,0x65,0x6e,0x74,0x73,0x3a,0xe5
             74 73 3A E5
      00A7A5 20 20 20 20 20          44         .db     0x20,0x20,0x20,0x20,0x20
      00A7AA 20 9F 01 02 10 20 20    45         .db     0x20,0x9f,0x01,0x02,0x10,0x20,0x20,0x8f
             8F
      00A7B2 03 02 10 96 02 02 16    46         .db     0x03,0x02,0x10,0x96,0x02,0x02,0x16,0x20
             20
      0007AB                         47         SCREEN_POS
      00A7BA 20 20 20 20              1         .ascii '    '
                                     48 
                                     49         ; line 7
      0007AF                         50         SCREEN_POS
      00A7BE 20 20 20 20              1         .ascii '    '
      00A7C2 E2 E4 E4 E4 E4 E4 E4    51         .db     0xe2,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe3
             E4 E4 E4 E3
      00A7CD 20 20 20 20 20          52         .db     0x20,0x20,0x20,0x20,0x20
      00A7D2 20 01 20 20 95 8F 03    53         .db     0x20,0x01,0x20,0x20,0x95,0x8f,0x03,0x20
             20
      00A7DA 20 20 02 10 03 17 20    54         .db     0x20,0x20,0x02,0x10,0x03,0x17,0x20,0x20
             20
      0007D3                         55         SCREEN_POS
      00A7E2 20 20 20 20              1         .ascii '    '
                                     56 
                                     57         ; line 8
      0007D7                         58         SCREEN_POS
      00A7E6 20 20 20 20              1         .ascii '    '
      00A7EA 20 20 20 20 20 20 20    59         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20
      00A7F2 20 20 20 20 20 20 20    60         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20
      00A7FA 02 03 03 03 03 20 20    61         .db     0x02,0x03,0x03,0x03,0x03,0x20,0x20,0x20
             20
      00A802 20 20 20 02 16 20 20    62         .db     0x20,0x20,0x20,0x02,0x16,0x20,0x20,0x20
             20
      0007FB                         63          SCREEN_POS
      00A80A 20 20 20 20              1         .ascii '    '
                                     64 
                                     65         ; line 11
      0007FF                         66         SCREEN_POS
      00A80E 20 20 20 20              1         .ascii '    '
      00A812 20 20 20 20 20 20 20    67         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00A81A 20 20 20 20 20 20 20    68         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00A822 20 20 20 20 20 20 20    69         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00A82A 20 20 20 20 20 20 20    70         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000823                         71          SCREEN_POS
      00A832 20 20 20 20              1         .ascii '    '
                                     72 
                                     73         ; line 12
      000827                         74         SCREEN_POS
      00A836 20 20 20 20              1         .ascii '    '
      00A83A 20 20 20 15 20 20 20    75         .db     0x20,0x20,0x20,0x15,0x20,0x20,0x20,0x20 ;   4    
             20
      00A842 20 20 20 20 01 20 20    76         .db     0x20,0x20,0x20,0x20,0x01,0x20,0x20,0x20 ;    0   
             20
      00A84A 20 20 20 20 20 20 15    77         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x15,0x20 ;      4 
             20
      00A852 20 20 20 20 15 9F 20    78         .db     0x20,0x20,0x20,0x20,0x15,0x9f,0x20,0x20 ;    42  
             20
      00084B                         79          SCREEN_POS
      00A85A 20 20 20 20              1         .ascii '    '
                                     80 
                                     81         ; line 13
      00084F                         82         SCREEN_POS
      00A85E 20 20 20 20              1         .ascii '    '
      00A862 20 20 20 15 15 95 97    83         .db     0x20,0x20,0x20,0x15,0x15,0x95,0x97,0x96 ;   4455=
             96
      00A86A 96 95 03 14 15 1D 96    84         .db     0x96,0x95,0x03,0x14,0x15,0x1d,0x96,0x97 ;=5634<=2
             97
      00A872 03 14 20 20 20 20 15    85         .db     0x03,0x14,0x20,0x20,0x20,0x20,0x15,0x02 ;63    41
             02
      00A87A 96 97 03 14 82 01 20    86         .db     0x96,0x97,0x03,0x14,0x82,0x01,0x20,0x20 ;8263;0  
             20
      000873                         87          SCREEN_POS
      00A882 20 20 20 20              1         .ascii '    '
                                     88 
                                     89         ; line 14
      000877                         90         SCREEN_POS
      00A886 20 20 20 20              1         .ascii '    '
      00A88A 20 10 20 15 15 95 95    91         .db     0x20,0x10,0x20,0x15,0x15,0x95,0x95,0x95 ; 3 44555
             95
      00A892 95 95 8F 05 15 15 95    92         .db     0x95,0x95,0x8f,0x05,0x15,0x15,0x95,0x0a ;55704451
             0A
      00A89A 8F 15 20 20 10 20 15    93         .db     0x8f,0x15,0x20,0x20,0x10,0x20,0x15,0x16 ;74  3 49
             16
      00A8A2 94 95 20 10 15 96 20    94         .db     0x94,0x95,0x20,0x10,0x15,0x96,0x20,0x20 ;=5 348  
             20
      00089B                         95          SCREEN_POS
      00A8AA 20 20 20 20              1         .ascii '    '
                                     96 
                                     97         ; line 15
      00089F                         98         SCREEN_POS
      00A8AE 20 20 20 20              1         .ascii '    '
      00A8B2 20 9A 8F 05 02 01 02    99         .db     0x20,0x9a,0x8f,0x05,0x02,0x01,0x02,0x02 ; 8701011
             02
      00A8BA 02 95 20 20 01 01 02   100         .db     0x02,0x95,0x20,0x20,0x01,0x01,0x02,0x08 ;15  0011
             08
      00A8C2 8F 05 20 20 9A 8F 05   101         .db     0x8f,0x05,0x20,0x20,0x9a,0x8f,0x05,0x02 ;70  8701
             02
      00A8CA 03 20 03 20 01 20 01   102         .db     0x03,0x20,0x03,0x20,0x01,0x20,0x01,0x20 ;6 6 0 0 
             20
      0008C3                        103          SCREEN_POS
      00A8D2 20 20 20 20              1         .ascii '    '
                                    104 
                                    105         ; line 16
      0008C7                        106         SCREEN_POS
      00A8D6 20 20 20 20              1         .ascii '    '
      00A8DA 20 20 20 20 20 20 20   107         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00A8E2 20 20 20 20 20 20 20   108         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00A8EA 20 20 20 20 20 20 20   109         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      00A8F2 20 20 20 20 20 20 20   110         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      0008EB                        111         SCREEN_POS
      00A8FA 20 20 20 20              1         .ascii '    '
                                   1035         
      00A8FE                       1036 HINT_RIGHT:
      00A8FE 2D 3E 20 2E 2E 2E 20  1037         .db     0x2d,0x3e,0x20,0x2e,0x2e,0x2e,0x20,0x52 ;-> ... R
             52
      00A906 69 67 68 74           1038         .db     0x69,0x67,0x68,0x74                     ;ight
      00A90A                       1039 HINT_LEFT:
      00A90A 3C 2D 20 2E 2E 2E 2E  1040         .db     0x3c,0x2d,0x20,0x2e,0x2e,0x2e,0x2e,0x20 ;<- .... 
             20
      00A912 4C 65 66 74           1041         .db     0x4c,0x65,0x66,0x74                     ;Left
      00A916                       1042 HINT_JUMP:
      00A916 53 50 20 2E 2E 2E 2E  1043         .ascii  'SP .... Jump'
             20 4A 75 6D 70
      00A922                       1044 HINT_PLAY:
      00A922 50 20 2E 2E 2E 2E 2E  1045         .ascii  'P ..... Play'
             20 50 6C 61 79
      00A92E                       1046 HINT_EXIT:
      00A92E 45 20 2E 2E 2E 2E 2E  1047         .ascii  'E ..... Exit'
             20 45 78 69 74
      00A93A                       1048 HINT_COPYRIGHT:
      00A93A 43 20 31 39 38 36 20  1049         .ascii  'C 1986 Software Center Ilmenau'
             53 6F 66 74 77 61 72
             65 20 43 65 6E 74 65
             72 20 49 6C 6D 65 6E
             61 75
      00A958                       1050 HINT_NAME:
      00A958 47 2E 46 69 73 63 68  1051         .ascii  'G.Fischer & CO'
             65 72 20 26 20 43 4F
      00A966                       1052 HINT_YEAR:
      00A966 20 20 32 30 32 30 20  1053         .ascii  '  2020 Version'
             56 65 72 73 69 6F 6E
      00A974                       1054 VERSION_INFO:
      00A974 20 31 2E 31 20        1055         .db     0x20,0x31,0x2e,0x31,0x20                ; 1.1 
      00A979                       1056 LINE_BUFFER:
      00A979 EE EE EE EE EE EE EE  1057         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00A981 EE EE EE EE EE EE EE  1058         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00A989 EE EE EE EE EE EE EE  1059         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00A991 EE EE EE EE EE EE EE  1060         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00A999 EE EE EE EE EE EE EE  1061         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00A9A1 EE EE EE EE EE EE EE  1062         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00A9A9 EE EE EE EE EE EE EE  1063         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00A9B1 EE EE EE EE EE EE EE  1064         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00A9B9 20 20 20 EE EE EE EE  1065         .db     0x20,0x20,0x20,0xee,0xee,0xee,0xee,0xee ;   nnnnn
             EE
      00A9C1 EE EE EE EE EE EE EE  1066         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00A9C9 EE EE EE EE EE 20 20  1067         .db     0xee,0xee,0xee,0xee,0xee,0x20,0x20,0x20 ;nnnnn   
             20
      00A9D1 20 20 EE EE EE EE EE  1068         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      00A9D9 EE EE EE EE EE EE EE  1069         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00A9E1 EE 20 20 20 EE EE EE  1070         .db     0xee,0x20,0x20,0x20,0xee,0xee,0xee,0xee ;n   nnnn
             EE
      00A9E9 EE EE EE EE EE EE EE  1071         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00A9F1 EE EE EE 20 20 20 EE  1072         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      00A9F9 EE EE EE EE EE EE EE  1073         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00AA01 EE EE EE EE 20 20 20  1074         .db     0xee,0xee,0xee,0xee,0x20,0x20,0x20,0xee ;nnnn   n
             EE
      00AA09 EE EE EE EE EE EE EE  1075         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0x20 ;nnnnnnn 
             20
      00AA11 20 20 EE EE EE EE EE  1076         .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
             EE
      00AA19 EE EE EE 20 20 20 EE  1077         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      00AA21 EE EE EE EE EE EE EE  1078         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00AA29 EE EE EE EE EE EE EE  1079         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00AA31 EE EE EE EE EE EE EE  1080         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00AA39 EE EE EE 20 20 20 EE  1081         .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
             EE
      00AA41 EE EE EE EE EE EE EE  1082         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00AA49 EE EE EE EE EE EE EE  1083         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00AA51 EE EE EE EE EE EE 20  1084         .db     0xee,0xee,0xee,0xee,0xee,0xee,0x20,0x20 ;nnnnnn  
             20
      00AA59 20 EE EE EE EE EE EE  1085         .db     0x20,0xee,0xee,0xee,0xee,0xee,0xee,0xee ; nnnnnnn
             EE
      00AA61 EE EE EE EE EE EE EE  1086         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00AA69 EE EE EE EE EE EE EE  1087         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00AA71 EE EE EE EE EE EE EE  1088         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00AA79 EE EE EE EE EE EE EE  1089         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
             EE
      00AA81 EE EE EE EE EE EE EE  1090         .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee      ;nnnnnnn
                                   1091 ; unchecked data source
      00AA88 EE                    1092         .db     0xee                                    ;n
      00AA89                       1093 OFFSET_HOLES:
      00AA89 58 7C 41 98 56        1094         .db     0x58,0x7c,0x41,0x98,0x56                ;X|A.V
      00AA8E                       1095 OFFSET_HOLES_JUMP_PENALTY:
      00AA8E 8B A2 68 C2 DD        1096         .db     0x8b,0xa2,0x68,0xc2,0xdd                ;."hB]
      00AA93                       1097 cnt_fail_trap:
      00AA93 05                    1098         .db     5
      00AA94                       1099 cnt_fail_jump:
      00AA94 05                    1100         .db     5
      00AA95                       1101 MAN_HEAD:
      00AA95 32 F3                 1102         .dw     BWS+(GAME_START_Y+(8-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14+ALIGN_MIDDLE
      00AA97                       1103 JUMP_DELAY:
      00AA97 01                    1104         .db     1
      00AA98                       1105 FAIL_DELAY:
      00AA98 01                    1106         .db     1
      00AA99                       1107 LIVES:
      00AA99 06                    1108         .db     6
      00AA9A                       1109 POINTS:
      00AA9A 00 00                 1110         .dw     0
      00AA9C                       1111 LEVEL:
      00AA9C 01                    1112         .db     1
      00AA9D                       1113 counter:
      00AA9D 01                    1114         .db     1
      00AA9E                       1115 TXT_JUMP:
      00AA9E 2A 20 4A 55 4D 50 49  1116         .ascii  '* JUMPING JACK *'
             4E 47 20 4A 41 43 4B
             20 2A
      00AAAE                       1117 MONSTER_PTR:
      00AAAE DF F1                 1118         .dw     BWS+(GAME_START_Y+3*3+1)*SCREEN_WIDTH-1
      00AAB0 30 F2                 1119         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+0
      00AAB2 31 F2                 1120         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      00AAB4 32 F2                 1121         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
                                   1122 
      00AAB6 D5 F0                 1123         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
      00AAB8 D6 F0                 1124         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+14
      00AABA D7 F0                 1125         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+15
      00AABC D8 F0                 1126         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+16
                                   1127 
      00AABE 31 F2                 1128         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
      00AAC0 32 F2                 1129         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
      00AAC2 33 F2                 1130         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+3
      00AAC4 34 F2                 1131         .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+4
                                   1132 
      00AAC6 C1 F2                 1133         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+25
      00AAC8 C2 F2                 1134         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+26
      00AACA C3 F2                 1135         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+27
      00AACC C4 F2                 1136         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+28
                                   1137 
      00AACE D2 F0                 1138         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+10
      00AAD0 D3 F0                 1139         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+11
      00AAD2 D4 F0                 1140         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+12
      00AAD4 D5 F0                 1141         .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
                                   1142 
      00AAD6 B3 F2                 1143         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+11
      00AAD8 B4 F2                 1144         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+12
      00AADA B5 F2                 1145         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+13
      00AADC B6 F2                 1146         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14
                                   1147 
      00AADE BD F2                 1148         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+21
      00AAE0 BE F2                 1149         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+22
      00AAE2 BF F2                 1150         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+23
      00AAE4 C0 F2                 1151         .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+24
                                   1152         
      00AAE6                       1153 MONSTER_IMG:
      000AD7                       1154         MONSTER_IMG_CONTENT
      00AAE6 3C 2F DF 2F DF B1 3E     1         .db     0x3c,0x2f,0xdf,0x2f,0xdf,0xb1,0x3e,0xb1
             B1
      00AAEE FC 95 20 F7 20 F6 20     2         .db     0xfc,0x95,0x20,0xf7,0x20,0xf6,0x20,0x2f
             2F
      00AAF6 87 02 0C 03 0C 03 8A     3         .db     0x87,0x02,0x0c,0x03,0x0c,0x03,0x8a,0x05
             05
      00AAFE 20 F5 20 EE 94 EE 01     4         .db     0x20,0xf5,0x20,0xee,0x94,0xee,0x01,0xf4
             F4
      00AB06 8B EC 8F EC 58 03 83     5         .db     0x8b,0xec,0x8f,0xec,0x58,0x03,0x83,0xed
             ED
      00AB0E F7 F5 EA EB F6 F4 20     6         .db     0xf7,0xf5,0xea,0xeb,0xf6,0xf4,0x20,0x20
             20
      00AB16 20 20 20 20 20 20 20     7         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20
                                   1155 
      00AB1E                       1156 HIGH_SCORE_TABLE01:
      00AB1E 5F 5F                 1157         .ascii '__'
      00AB20                       1158 HIGH_SCORE_TABLE01.points:
      00AB20 00 00                 1159         .dw     0
      00AB22                       1160 HIGH_SCORE_TABLE01.level:
      00AB22 01                    1161         .db     1
      00AB23                       1162 HIGH_SCORE_TABLE02:
      00AB23 5F 5F                 1163         .ascii '__'
      00AB25                       1164 HIGH_SCORE_TABLE02.points:
      00AB25 00 00                 1165         .dw     0
      00AB27                       1166 HIGH_SCORE_TABLE02.level:
      00AB27 01                    1167         .db     1
      00AB28                       1168 HIGH_SCORE_TABLE03:
      00AB28 5F 5F                 1169         .ascii '__'
      00AB2A                       1170 HIGH_SCORE_TABLE03.points:
      00AB2A 00 00                 1171         .dw     0
      00AB2C                       1172 HIGH_SCORE_TABLE03.level:
      00AB2C 01                    1173         .db     1
      00AB2D                       1174 HIGH_SCORE_TABLE04:
      00AB2D 5F 5F                 1175         .ascii '__'
      00AB2F                       1176 HIGH_SCORE_TABLE04.points:
      00AB2F 00 00                 1177         .dw     0
      00AB31                       1178 HIGH_SCORE_TABLE04.level:
      00AB31 01                    1179         .db     1
      00AB32                       1180 HIGH_SCORE_TABLE05:
      00AB32 5F 5F                 1181         .ascii '__'
      00AB34                       1182 HIGH_SCORE_TABLE05.points:
      00AB34 00 00                 1183         .dw     0
      00AB36                       1184 HIGH_SCORE_TABLE05.level:
      00AB36 01                    1185         .db     1
      00AB37                       1186 HIGH_SCORE_TABLE_TMP:
      00AB37 5F 5F                 1187         .ascii '__'
      00AB39                       1188 HIGH_SCORE_TABLE_TMP.points:
      00AB39 00 00                 1189         .dw     0
      00AB3B                       1190 HIGH_SCORE_TABLE_TMP.level:
      00AB3B 01                    1191         .db     1
      00AB3C                       1192 INITIALS:
      00AB3C 5F 5F                 1193         .ascii '__'
      00AB3E                       1194 TXT_GAME_OVER:
      00AB3E 2A 2A 20 47 41 4D 45  1195         .ascii  '** GAME OVER **'
             20 4F 56 45 52 20 2A
             2A
      00AB4D                       1196 TXT_YOUR_SCORE:
      00AB4D 59 4F 55 52 20 53 43  1197         .ascii  'YOUR SCORE :'
             4F 52 45 20 3A
      00AB59                       1198 TXT_HAZARD:
      00AB59 48 41 5A 41 52 44 53  1199         .ascii  'HAZARDS :'
             20 3A
      00AB62                       1200 TXT_NEW_HIGH_SCORE:
      00AB62 2A 20 4E 45 57 20 48  1201         .ascii  '* NEW HIGH SCORE *'
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
    BG_BLACK                                                    =  000000 
    BG_BLUE                                                     =  000008 
    BG_CYAN                                                     =  000028 
    BG_GREEN                                                    =  000020 
    BG_MAGENTA                                                  =  000018 
    BG_RED                                                      =  000010 
    BG_WHITE                                                    =  000038 
    BG_YELLOW                                                   =  000030 
    BWS                                                         =  00F000 
    CAPITALIZE                                                  =  000020 
    CFG10                                                       =  000010 
    CFG20                                                       =  000020 
    CHR_ARROW_RIGHT_BOTTOM                                      =  0000F4 
    CHR_ARROW_RIGHT_TOP                                         =  0000F6 
    CHR_LINE_BOTTOM                                             =  000003 
    CHR_LINE_TOP                                                =  00008F 
    CHR_MAN_HEAD                                                =  0000FC 
    CHR_MAN_SLEEP                                               =  0000EA 
    CHR_MAN_SLEEP_HEAD                                          =  0000ED 
    CHR_MAN_STAY                                                =  0000E5 
    CHR_MAN_WALK                                                =  0000E7 
    CHR_MIDDLE_LINE                                             =  0000E4 
    CHR_MOVING_LINE                                             =  00000C 
    CHR_SMOKE                                                   =  0000D0 
    CHR_WALL                                                    =  0000EF 
    CRT_DATA                                                    =  000051 
    CRT_REG                                                     =  000050 
    CURSOR                                                         ****** GX
    DELAY_COUNTER                                               =  00000B 
    DELAY_COUNTER2                                              =  000008 
    DELAY_COUNTER_JUMP                                          =  000004 
  0 FAIL_DELAY                                                     000A89 R
    FG_BLACK                                                    =  000000 
    FG_BLUE                                                     =  000001 
    FG_CYAN                                                     =  000005 
    FG_GREEN                                                    =  000004 
    FG_MAGENTA                                                  =  000003 
    FG_RED                                                      =  000002 
    FG_WHITE                                                    =  000007 
    FG_YELLOW                                                   =  000006 
    GAMES_LINES                                                 =  000006 
    GAME_START_Y                                                =  000002 
  0 HIGH_SCORE_TABLE01                                             000B0F R
  0 HIGH_SCORE_TABLE01.level                                       000B13 R
  0 HIGH_SCORE_TABLE01.points                                      000B11 R
    HIGH_SCORE_TABLE01_size                                     =  000002 
  0 HIGH_SCORE_TABLE02                                             000B14 R
  0 HIGH_SCORE_TABLE02.level                                       000B18 R
  0 HIGH_SCORE_TABLE02.points                                      000B16 R
    HIGH_SCORE_TABLE02_size                                     =  000002 
  0 HIGH_SCORE_TABLE03                                             000B19 R
  0 HIGH_SCORE_TABLE03.level                                       000B1D R
  0 HIGH_SCORE_TABLE03.points                                      000B1B R
    HIGH_SCORE_TABLE03_size                                     =  000002 
  0 HIGH_SCORE_TABLE04                                             000B1E R
  0 HIGH_SCORE_TABLE04.level                                       000B22 R
  0 HIGH_SCORE_TABLE04.points                                      000B20 R
    HIGH_SCORE_TABLE04_size                                     =  000002 
  0 HIGH_SCORE_TABLE05                                             000B23 R
  0 HIGH_SCORE_TABLE05.level                                       000B27 R
  0 HIGH_SCORE_TABLE05.points                                      000B25 R
    HIGH_SCORE_TABLE05_size                                     =  000002 
  0 HIGH_SCORE_TABLE_TMP                                           000B28 R
  0 HIGH_SCORE_TABLE_TMP.level                                     000B2C R
  0 HIGH_SCORE_TABLE_TMP.points                                    000B2A R
    HIGH_SCORE_TABLE_TMP_size                                   =  000002 
  0 HINT_COPYRIGHT                                                 00092B R
    HINT_COPYRIGHT_size                                         =  00001E 
  0 HINT_EXIT                                                      00091F R
    HINT_EXIT_size                                              =  00000C 
  0 HINT_JUMP                                                      000907 R
    HINT_JUMP_size                                              =  00000C 
  0 HINT_LEFT                                                      0008FB R
    HINT_LEFT_size                                              =  00000C 
  0 HINT_NAME                                                      000949 R
    HINT_NAME_size                                              =  00000E 
  0 HINT_PLAY                                                      000913 R
    HINT_PLAY_size                                              =  00000C 
  0 HINT_RIGHT                                                     0008EF R
    HINT_RIGHT_size                                             =  00000C 
  0 HINT_YEAR                                                      000957 R
    HINT_YEAR_size                                              =  00000E 
    HI_ZERO                                                     =  000000 
  0 INITIALS                                                       000B2D R
    INITIALS_size                                               =  000002 
    INITIAL_DELAY_COUNTER                                       =  000001 
    INITIAL_FAIL_COUNTER                                        =  000002 
    INITIAL_LEVEL                                               =  000001 
    INITIAL_LIVES                                               =  000006 
  0 JUMP_DELAY                                                     000A88 R
  0 LEVEL                                                          000A8D R
    LEVEL_1                                                     =  000001 
  0 LINE_BUFFER                                                    00096A R
    LINE_BUFFER_size                                            =  00010F 
  0 LIVES                                                          000A8A R
  0 MAN_HEAD                                                       000A86 R
    MAX_FAIL_COUNTER                                            =  000005 
    MAX_LEVEL                                                   =  000008 
    MENU_TOP                                                    =  000010 
    MONSTER_CORRECTION                                          =  000001 
  0 MONSTER_IMG                                                    000AD7 R
    MONSTER_IMG_size                                            =  000038 
  0 MONSTER_PTR                                                    000A9F R
    MONSTER_PTR_size                                            =  000038 
    MONSTER_WIDTH                                               =  000004 
    MOVE_2X_RIGHT                                               =  000002 
    NUMBER_HIGHSCORE_ENTRIES                                    =  000005 
    NUMBER_OF_LINES                                             =  000008 
    OFFSET_COLOR                                                =  000800 
  0 OFFSET_HOLES                                                   000A7A R
  0 OFFSET_HOLES_JUMP_PENALTY                                      000A7F R
    OFFSET_HOLES_JUMP_PENALTY_size                              =  000005 
    OFFSET_HOLES_size                                           =  000005 
  0 POINTS                                                         000A8B R
    POSDIFF_HIGHSCORE_DY                                        =  000004 
    POSDIFF_NAME                                                =  00000D 
    POSDIFF_POINTS                                              =  000008 
    POSDIFF_YEAR                                                =  000005 
    POSDIFF_YOUR_SCORE                                          =  FFFFFFD8 
    POSDIFF_YOUR_SCORE_DY                                       =  000003 
    POS_COPYRIGHT                                               =  000370 
    POS_GAME_OVER                                               =  00F00D 
    POS_LIVES                                                   =  00F398 
    POS_TOP_GAME                                                =  00F00C 
    POS_TOP_WALL                                                =  00F028 
    REG_10_CURSOR_START                                         =  00000A 
    SCREEN_HEIGHT                                               =  000018 
    SCREEN_WIDTH                                                =  000028 
    SLOW_DOWN_13066                                             =  006D60 
    SMALL_CAPITALS                                              =  00005F 
    TITLE_TOP_SIZE                                              =  000230 
  0 TOP_IMAGE                                                      0006BF R
    TOP_IMAGE_size                                              =  0001FF 
    TOP_LINES                                                   =  00000E 
    TRANSITION_MAN_WALK_STAY                                    =  FFFFFFFE 
  0 TXT_GAME_OVER                                                  000B2F R
    TXT_GAME_OVER_size                                          =  00000F 
  0 TXT_HAZARD                                                     000B4A R
    TXT_HAZARD_size                                             =  000009 
  0 TXT_JUMP                                                       000A8F R
    TXT_JUMP_size                                               =  000010 
  0 TXT_NEW_HIGH_SCORE                                             000B53 R
    TXT_NEW_HIGH_SCORE_size                                     =  000012 
  0 TXT_YOUR_SCORE                                                 000B3E R
    TXT_YOUR_SCORE_size                                         =  00000C 
  0 VERSION_INFO                                                   000965 R
    VERSION_INFO_size                                           =  000005 
    VK_CLS                                                      =  00000C 
    VK_DOWN                                                     =  00001F 
    VK_ENTER                                                    =  00000D 
    VK_HEART                                                    =  0000F0 
    VK_LEFT                                                     =  00001D 
    VK_PLAYER                                                   =  0000FE 
    VK_RIGHT                                                    =  00001C 
    VK_UP                                                       =  00001E 
    ZERO                                                        =  000000 
  0 _main                                                          000000 GR
  0 action_jump                                                    0003A5 R
  0 action_left                                                    0002F5 R
  0 action_right                                                   00034C R
  0 add_10_points                                                  0004C0 R
  0 animation_delay                                                0002E8 GR
  0 animation_lines                                                000278 R
  0 animation_loop                                                 00011A R
  0 animation_monster                                              0001B9 R
  0 ask_exit_game                                                  000636 R
  0 capitalized                                                    000091 R
    cfg10_settings                                              =  00E468 
    cfg20_settings                                              =  00E469 
  0 check_fall_through                                             000409 R
  0 check_for_trap                                                 00040F R
  0 check_level_finished                                           00045A R
  0 choose_menu                                                    000087 R
  0 cnt_fail_jump                                                  000A85 R
  0 cnt_fail_trap                                                  000A84 R
  0 correct_left_border                                            000338 R
  0 correct_ptr                                                    000203 R
  0 correct_right_border                                           00038F R
  0 counter                                                        000A8E R
    crt_cls                                                     =  00E9E8 
    crt_cursor_disable                                             ****** GX
  0 decimal_loop                                                   0004FF R
  0 delay_loop                                                     0002EF R
  0 draw_monster                                                   00023A R
  0 draw_monster_segment                                           00023F R
  0 draw_new_highscore_box                                         00068D R
  0 draw_player                                                    0000AF R
  0 erase_player_fell_down                                         000437 R
    exit                                                           ****** GX
  0 exit_game                                                      000647 R
  0 get_column                                                     0001FC R
  0 get_decimal_digit                                              0004FE R
  0 handle_by_column                                               0001E0 R
  0 handle_by_ptr                                                  0001DC R
  0 handle_fail_delay                                              000158 R
  0 handle_jump_delay                                              00015B R
  0 handle_one_monster                                             0001C8 R
    inch                                                           ****** GX
    inkey                                                          ****** GX
  0 input                                                          00057D R
  0 insert_score                                                   00065C R
  0 jump_delay_counter_set                                         000166 R
  0 jump_fail                                                      0003E2 R
  0 jump_ok                                                        0003BE R
    l__CODE                                                        ****** GX
  0 left_border_next_adr                                           00032A R
  0 loop_failed_penalty_holes                                      00028D R
  0 loop_jump_penalty_holes                                        0002AC R
  0 loop_left_border_check                                         00031E R
  0 loop_right_border_check                                        000375 R
  0 m_070a                                                         000636 R
    mon_reboot                                                  =  00E023 
  0 monster_check_crash                                            00025C R
  0 move_one_line_up                                               00021F R
  0 move_table_entry                                               000663 R
  0 new_game                                                       00009A R
  0 new_level_set                                                  00046D R
  0 next_cmd                                                       000151 R
  0 no_lives                                                       00050E R
  0 player_activity                                                0001AF R
  0 player_fell_down                                               00043F R
  0 player_wake_up                                                 000196 R
  0 print_decimal                                                  0004DA R
  0 print_highscore_entry                                          0005D8 R
  0 print_highscore_table                                          0005D0 R
  0 print_line                                                     0002CC R
    prst7                                                          ****** GX
    putcharA                                                       ****** GX
  0 right_border_next_adr                                          000381 R
  0 round_end                                                      00049E R
    s__CODE                                                        ****** GX
  0 sadr                                                           000000 GR
  0 start_from_bottom                                              00020D R
    ta_alpha                                                    =  000001 
  0 test_column                                                    000214 R
  0 transition_left_stay                                           000311 R
  0 transition_left_walk                                           000315 R
  0 transition_stay                                                000368 R
  0 transition_walk                                                00036C R
  0 update_left                                                    000317 R
  0 update_pointers                                                000226 R
  0 update_right                                                   00036E R
    z1013                                                       =  000000 
    z9001                                                       =  000000 

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 2.
Hexadecimal [24-Bits]

Area Table

   0 _CODE                                      size    B65   flags    0
   1 _DATA                                      size      0   flags    0

